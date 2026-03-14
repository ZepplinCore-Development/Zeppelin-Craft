/*
 * mmap_query - Standalone navmesh point checker for Zeppelin terrain validator (F-170)
 *
 * Loads AzerothCore mmap files and checks whether world coordinates are on
 * walkable navmesh. Designed to be called from Python via subprocess.
 *
 * Usage:
 *   mmap_query <mmaps_dir>
 *
 * Reads lines from stdin:
 *   <mapId> <x> <y> <z>
 *
 * Outputs one line per input:
 *   <mapId> <x> <y> <z> <ON_MESH|OFF_MESH> <dist> <zDiff> <meshX> <meshY> <meshZ> <slopeAngle>
 *
 * Send "QUIT" or EOF to exit.
 *
 * Build:
 *   ./build.sh
 */

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cmath>
#include <string>
#include <unordered_map>
#include <unordered_set>

#include "DetourNavMesh.h"
#include "DetourNavMeshQuery.h"
#include "DetourCommon.h"
#include "DetourAlloc.h"

// ── Constants from AzerothCore ──────────────────────────────────────────────

#define MMAP_MAGIC   0x4d4d4150  // 'MMAP'
#define MMAP_VERSION 19
#define SIZE_OF_GRIDS 533.3333f
#define MAX_QUERY_SEARCH_NODES 65535

// ── Structs matching AC binary format ───────────────────────────────────────

#pragma pack(push, 1)
struct MmapTileRecastConfig {
    float    walkableSlopeAngle;
    uint8_t  walkableRadius;
    uint8_t  walkableHeight;
    uint8_t  walkableClimb;
    uint8_t  padding0;
    uint32_t vertexPerMapEdge;
    uint32_t vertexPerTileEdge;
    uint32_t tilesPerMapEdge;
    float    baseUnitDim;
    float    cellSizeHorizontal;
    float    cellSizeVertical;
    float    maxSimplificationError;
};

struct MmapTileHeader {
    uint32_t mmapMagic;
    uint32_t dtVersion;
    uint32_t mmapVersion;
    uint32_t size;
    char     usesLiquids;
    char     padding[3];
    MmapTileRecastConfig recastConfig;
};
#pragma pack(pop)

// ── Custom allocator (matches AC) ───────────────────────────────────────────

void* dtCustomAlloc(size_t size, dtAllocHint) {
    return new unsigned char[size];
}

void dtCustomFree(void* ptr) {
    delete[] static_cast<unsigned char*>(ptr);
}

// ── Map data holder ─────────────────────────────────────────────────────────

struct MapData {
    dtNavMesh*      navMesh  = nullptr;
    dtNavMeshQuery* query    = nullptr;
    std::unordered_set<uint64_t> loadedTiles;

    ~MapData() {
        if (query)   dtFreeNavMeshQuery(query);
        if (navMesh) dtFreeNavMesh(navMesh);
    }
};

// ── Globals ─────────────────────────────────────────────────────────────────

static std::string g_mmapsDir;
static std::unordered_map<uint32_t, MapData*> g_maps;

// ── Tile coordinate helpers ─────────────────────────────────────────────────

// WoW world coords -> grid tile index (matching AC's MMapMgr)
static void worldToGrid(float x, float y, int& gx, int& gy) {
    // AC formula: grid = 32 - (coord / SIZE_OF_GRIDS)
    gx = static_cast<int>(32.0f - x / SIZE_OF_GRIDS);
    gy = static_cast<int>(32.0f - y / SIZE_OF_GRIDS);
}

static uint64_t packTile(int x, int y) {
    return (static_cast<uint64_t>(static_cast<uint32_t>(x)) << 32) |
            static_cast<uint64_t>(static_cast<uint32_t>(y));
}

// ── Load map header (.mmap file) ────────────────────────────────────────────

static MapData* loadMapData(uint32_t mapId) {
    auto it = g_maps.find(mapId);
    if (it != g_maps.end())
        return it->second;

    char path[512];
    snprintf(path, sizeof(path), "%s/%03u.mmap", g_mmapsDir.c_str(), mapId);

    FILE* f = fopen(path, "rb");
    if (!f) {
        fprintf(stderr, "WARN: Cannot open %s\n", path);
        g_maps[mapId] = nullptr;
        return nullptr;
    }

    dtNavMeshParams params;
    if (fread(&params, sizeof(dtNavMeshParams), 1, f) != 1) {
        fprintf(stderr, "WARN: Failed to read params from %s\n", path);
        fclose(f);
        g_maps[mapId] = nullptr;
        return nullptr;
    }
    fclose(f);

    dtNavMesh* mesh = dtAllocNavMesh();
    if (!mesh || dtStatusFailed(mesh->init(&params))) {
        fprintf(stderr, "WARN: Failed to init navmesh for map %u\n", mapId);
        if (mesh) dtFreeNavMesh(mesh);
        g_maps[mapId] = nullptr;
        return nullptr;
    }

    dtNavMeshQuery* query = dtAllocNavMeshQuery();
    if (!query || dtStatusFailed(query->init(mesh, MAX_QUERY_SEARCH_NODES))) {
        fprintf(stderr, "WARN: Failed to init query for map %u\n", mapId);
        if (query) dtFreeNavMeshQuery(query);
        dtFreeNavMesh(mesh);
        g_maps[mapId] = nullptr;
        return nullptr;
    }

    MapData* data = new MapData();
    data->navMesh = mesh;
    data->query = query;
    g_maps[mapId] = data;
    return data;
}

// ── Load a single tile (.mmtile file) ───────────────────────────────────────

static bool loadTile(MapData* mapData, uint32_t mapId, int gx, int gy) {
    uint64_t key = packTile(gx, gy);
    if (mapData->loadedTiles.count(key))
        return true;  // already loaded

    char path[512];
    snprintf(path, sizeof(path), "%s/%03u%02d%02d.mmtile",
             g_mmapsDir.c_str(), mapId, gx, gy);

    FILE* f = fopen(path, "rb");
    if (!f) {
        // No tile file = no navmesh for this grid (water, empty, etc.)
        mapData->loadedTiles.insert(key);  // mark as attempted
        return false;
    }

    MmapTileHeader header;
    if (fread(&header, sizeof(MmapTileHeader), 1, f) != 1) {
        fclose(f);
        mapData->loadedTiles.insert(key);
        return false;
    }

    if (header.mmapMagic != MMAP_MAGIC || header.mmapVersion != MMAP_VERSION) {
        fprintf(stderr, "WARN: Bad header in %s (magic=0x%x ver=%u)\n",
                path, header.mmapMagic, header.mmapVersion);
        fclose(f);
        mapData->loadedTiles.insert(key);
        return false;
    }

    // Allocate with Detour allocator so it can manage the memory
    unsigned char* data = static_cast<unsigned char*>(
        dtAlloc(header.size, DT_ALLOC_PERM));
    if (!data) {
        fclose(f);
        mapData->loadedTiles.insert(key);
        return false;
    }

    if (fread(data, header.size, 1, f) != 1) {
        dtFree(data);
        fclose(f);
        mapData->loadedTiles.insert(key);
        return false;
    }
    fclose(f);

    dtTileRef tileRef = 0;
    dtStatus status = mapData->navMesh->addTile(
        data, header.size, DT_TILE_FREE_DATA, 0, &tileRef);

    if (dtStatusFailed(status)) {
        dtFree(data);
        mapData->loadedTiles.insert(key);
        return false;
    }

    mapData->loadedTiles.insert(key);
    return true;
}

// ── Check a single point against navmesh ────────────────────────────────────

static void checkPoint(uint32_t mapId, float x, float y, float z) {
    MapData* mapData = loadMapData(mapId);
    if (!mapData) {
        printf("%u %.4f %.4f %.4f OFF_MESH -1.00\n", mapId, x, y, z);
        return;
    }

    // Load the tile for this position (and neighbors for border cases)
    int gx, gy;
    worldToGrid(x, y, gx, gy);
    loadTile(mapData, mapId, gx, gy);
    // Load adjacent tiles in case point is near a border
    loadTile(mapData, mapId, gx - 1, gy);
    loadTile(mapData, mapId, gx + 1, gy);
    loadTile(mapData, mapId, gx, gy - 1);
    loadTile(mapData, mapId, gx, gy + 1);

    // WoW (x,y,z) -> Detour (y,z,x) coordinate swizzle
    float point[3] = { y, z, x };
    float extents[3] = { 5.0f, 5.0f, 5.0f };  // search box half-extents (yards)
    float closestPoint[3];
    dtPolyRef polyRef = 0;
    dtQueryFilter filter;

    dtStatus status = mapData->query->findNearestPoly(
        point, extents, &filter, &polyRef, closestPoint);

    if (dtStatusFailed(status) || polyRef == 0) {
        printf("%u %.4f %.4f %.4f OFF_MESH -1.00 0.00 %.4f %.4f %.4f 0.0\n",
               mapId, x, y, z, x, y, z);
        return;
    }

    // Helper: compute slope angle of a polygon in degrees
    auto calcSlope = [&](dtPolyRef ref) -> float {
        const dtMeshTile* t = nullptr;
        const dtPoly* p = nullptr;
        if (dtStatusFailed(mapData->navMesh->getTileAndPolyByRef(ref, &t, &p)))
            return 0.0f;
        if (p->vertCount < 3)
            return 0.0f;

        const float* v0 = &t->verts[p->verts[0] * 3];
        const float* v1 = &t->verts[p->verts[1] * 3];
        const float* v2 = &t->verts[p->verts[2] * 3];

        float e1[3] = { v1[0]-v0[0], v1[1]-v0[1], v1[2]-v0[2] };
        float e2[3] = { v2[0]-v0[0], v2[1]-v0[1], v2[2]-v0[2] };

        float nx = e1[1]*e2[2] - e1[2]*e2[1];
        float ny = e1[2]*e2[0] - e1[0]*e2[2];
        float nz = e1[0]*e2[1] - e1[1]*e2[0];
        float len = sqrtf(nx*nx + ny*ny + nz*nz);

        if (len < 0.0001f) return 0.0f;
        float cosAngle = fabsf(ny) / len;
        if (cosAngle > 1.0f) cosAngle = 1.0f;
        return acosf(cosAngle) * (180.0f / 3.14159265f);
    };

    float slopeAngle = calcSlope(polyRef);

    // If nearest poly is too steep (cliff face), search wider for a flat surface
    const float MAX_SLOPE = 40.0f;
    if (slopeAngle > MAX_SLOPE) {
        // Try progressively wider search extents
        float wideExtents[] = { 10.0f, 15.0f, 20.0f, 30.0f };
        dtPolyRef bestRef = 0;
        float bestPoint[3] = {};
        float bestDist = 9999.0f;
        float bestSlope = slopeAngle;

        for (float ext : wideExtents) {
            float searchExt[3] = { ext, ext, ext };

            // findNearestPoly only returns one result, but we can use
            // queryPolygons to get multiple candidates
            const int MAX_POLYS = 128;
            dtPolyRef polys[MAX_POLYS];
            int polyCount = 0;

            dtStatus qs = mapData->query->queryPolygons(
                point, searchExt, &filter, polys, &polyCount, MAX_POLYS);

            if (dtStatusFailed(qs) || polyCount == 0)
                continue;

            for (int i = 0; i < polyCount; i++) {
                float slope = calcSlope(polys[i]);
                if (slope > MAX_SLOPE)
                    continue;  // still too steep

                // Get closest point on this flat poly
                float cp[3];
                bool posOverPoly = false;
                dtStatus cs = mapData->query->closestPointOnPoly(
                    polys[i], point, cp, &posOverPoly);
                if (dtStatusFailed(cs))
                    continue;

                float d = dtVdist(point, cp);
                if (d < bestDist) {
                    bestDist = d;
                    bestRef = polys[i];
                    dtVcopy(bestPoint, cp);
                    bestSlope = slope;
                }
            }

            // Found a flat surface — stop widening
            if (bestRef != 0)
                break;
        }

        // Use the flat surface if found
        if (bestRef != 0) {
            polyRef = bestRef;
            dtVcopy(closestPoint, bestPoint);
            slopeAngle = bestSlope;
        }
    }

    float dist = dtVdist(point, closestPoint);
    // closestPoint is in Detour coords (y,z,x) — index 1 is the Z (height)
    float meshZ = closestPoint[1];
    float spawnZ = z;
    float zDiff = spawnZ - meshZ;

    // Swizzle closestPoint back from Detour (y,z,x) to WoW (x,y,z)
    float meshX = closestPoint[2];
    float meshY = closestPoint[0];

    // ON_MESH if 3D distance is small AND vertical gap is small
    bool onMesh = (dist <= 3.0f) && (fabsf(zDiff) <= 3.0f);
    const char* result = onMesh ? "ON_MESH" : "OFF_MESH";
    printf("%u %.4f %.4f %.4f %s %.2f %.2f %.4f %.4f %.4f %.1f\n",
           mapId, x, y, z, result, dist, zDiff, meshX, meshY, meshZ, slopeAngle);
}

// ── Main ────────────────────────────────────────────────────────────────────

int main(int argc, char* argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Usage: mmap_query <mmaps_dir>\n");
        return 1;
    }

    g_mmapsDir = argv[1];

    // Set custom allocator before any Detour operations
    dtAllocSetCustom(dtCustomAlloc, dtCustomFree);

    // Disable stdout buffering for interactive use
    setvbuf(stdout, nullptr, _IOLBF, 0);

    char line[256];
    while (fgets(line, sizeof(line), stdin)) {
        // Trim newline
        size_t len = strlen(line);
        if (len > 0 && line[len - 1] == '\n') line[len - 1] = '\0';

        if (strcmp(line, "QUIT") == 0 || strcmp(line, "quit") == 0)
            break;

        uint32_t mapId;
        float x, y, z;
        if (sscanf(line, "%u %f %f %f", &mapId, &x, &y, &z) != 4) {
            fprintf(stderr, "WARN: Bad input: %s\n", line);
            continue;
        }

        checkPoint(mapId, x, y, z);
    }

    // Cleanup
    for (auto& pair : g_maps)
        delete pair.second;

    return 0;
}

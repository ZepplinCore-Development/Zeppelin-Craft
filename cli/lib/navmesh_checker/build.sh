#!/bin/bash
# Build mmap_query - standalone navmesh point checker for F-170
#
# Compiles against the Detour library from AzerothCore's bundled
# recastnavigation without needing the full AC build.

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
AC_ROOT="/workspace/project/Zeppelin-Core"
DETOUR_DIR="$AC_ROOT/deps/recastnavigation/Detour"
DETOUR_SRC="$DETOUR_DIR/Source"
DETOUR_INC="$DETOUR_DIR/Include"
OUTPUT="$SCRIPT_DIR/mmap_query"

echo "Building mmap_query..."

g++ -std=c++17 -O2 -Wall \
    -I"$DETOUR_INC" \
    "$SCRIPT_DIR/mmap_query.cpp" \
    "$DETOUR_SRC/DetourAlloc.cpp" \
    "$DETOUR_SRC/DetourAssert.cpp" \
    "$DETOUR_SRC/DetourCommon.cpp" \
    "$DETOUR_SRC/DetourNavMesh.cpp" \
    "$DETOUR_SRC/DetourNavMeshQuery.cpp" \
    "$DETOUR_SRC/DetourNode.cpp" \
    -o "$OUTPUT"

echo "Built: $OUTPUT"
echo "Usage: echo '1 -6295.0 -1306.2 -266.2' | $OUTPUT /workspace/project/data/mmaps"

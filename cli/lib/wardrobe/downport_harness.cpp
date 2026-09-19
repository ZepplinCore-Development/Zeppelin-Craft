// Offline MD21 -> WotLK MD20 downporter using WarcraftXL's shared transform (F-198 wardrobe).
// Reads a chunked modern M2, inlines TXID texture names via an FDID->path map file,
// runs the downport compaction, clears the staging bit, writes the shipped file.
#include "Md21.hpp"
#include "Downport.hpp"
#include "Contract.hpp"

#include <cstdarg>
#include <cstdio>
#include <cstring>
#include <fstream>
#include <map>
#include <string>
#include <vector>

// ---- wxl::log stubs (common/Log.cpp is Windows-only) ----
namespace wxl::log
{
    enum class Level : uint8_t { Trace, Debug, Info, Warn, Error, Off };
    void Open(const char*) {}
    void EnableConsole(const char*) {}
    void SetMinLevel(Level) {}
    Level MinLevel() { return Level::Trace; }
    bool Enabled(Level) { return true; }
    void WriteV(Level, const char* fmt, va_list args)
    {
        vfprintf(stdout, fmt, args);
        fputc('\n', stdout);
    }
    void Write(Level lvl, const char* fmt, ...)
    {
        va_list args; va_start(args, fmt);
        WriteV(lvl, fmt, args);
        va_end(args);
    }
    void Flush() { fflush(stdout); }
    void Close() {}
}

static std::map<uint32_t, std::string> kFdidPaths;  // loaded from argv[3] ("fdid;path" lines)

static bool Resolve(uint32_t fdid, std::string& outPath)
{
    auto it = kFdidPaths.find(fdid);
    if (it == kFdidPaths.end())
    {
        fprintf(stderr, "UNRESOLVED texture FDID %u\n", fdid);
        return false;
    }
    outPath = it->second;
    return true;
}

int main(int argc, char** argv)
{
    if (argc != 3 && argc != 4)
    {
        fprintf(stderr, "usage: %s <in.m2 (MD21)> <out.m2 (MD20)> [fdidmap.txt]\n", argv[0]);
        return 2;
    }
    if (argc == 4)
    {
        std::ifstream mf(argv[3]); std::string line;
        while (std::getline(mf, line))
        {
            auto p = line.find(';'); if (p == std::string::npos) continue;
            kFdidPaths[(uint32_t)std::stoul(line.substr(0, p))] = line.substr(p + 1);
        }
    }

    std::ifstream f(argv[1], std::ios::binary);
    std::vector<uint8_t> in((std::istreambuf_iterator<char>(f)), std::istreambuf_iterator<char>());
    if (in.empty()) { fprintf(stderr, "cannot read %s\n", argv[1]); return 1; }
    printf("in: %s (%zu bytes)\n", argv[1], in.size());

    namespace m2 = wxl::modern::assets::m2;

    if (!m2::md21::IsMd21(in)) { fprintf(stderr, "not an MD21 container\n"); return 1; }

    std::vector<uint8_t> md20;
    if (!m2::md21::Dechunk(in, &Resolve, md20)) { fprintf(stderr, "Dechunk failed\n"); return 1; }
    printf("dechunked: %zu bytes, inner version %u\n", md20.size(), m2::Rd32(md20.data() + 4));

    if (!m2::downport::IsConvertible(md20.data(), (uint32_t)md20.size()))
    { fprintf(stderr, "not in convertible version range\n"); return 1; }
    m2::downport::Inspect(md20.data(), (uint32_t)md20.size());

    uint32_t workSize = m2::downport::WorkSize(md20.data(), (uint32_t)md20.size());
    std::vector<uint8_t> work(workSize, 0);
    memcpy(work.data(), md20.data(), md20.size());
    if (!m2::downport::ProcessInPlace(work.data(), (uint32_t)md20.size(), workSize))
    { fprintf(stderr, "ProcessInPlace failed\n"); return 1; }

    uint32_t ver = m2::Rd32(work.data() + 4);
    printf("downported: version 0x%08x (staged=%d)\n", ver, m2::IsStagedVersion(ver));
    m2::Wr32(work.data() + 4, ver & ~m2::kStagedVersionBit);   // shipped file must be exact 264

    m2::md21::ZeroBoneLookup(work.data(), (uint32_t)work.size());

    // Cata+ repurposed the two bytes WotLK reads as particleType/headorTail (emitter
    // +0x2C/+0x2D) as multiTextureParamX. The in-client DLL's live-engine half handles
    // them at runtime; a SHIPPED file must zero them or the 3.3.5a client misreads them
    // as a tail/trail particle mode (I-286 "backspray"). Emitter record = 476 bytes.
    {
        uint32_t nPart = m2::Rd32(work.data() + 0x128);
        uint32_t oPart = m2::Rd32(work.data() + 0x12C);
        for (uint32_t i = 0; i < nPart; ++i)
        {
            uint8_t* rec = work.data() + oPart + i * 476u;
            if (rec[0x2C] || rec[0x2D])
                printf("emitter[%u]: zeroed particleType/headorTail %u/%u\n", i, rec[0x2C], rec[0x2D]);
            rec[0x2C] = 0;
            rec[0x2D] = 0;
        }
    }

    std::ofstream o(argv[2], std::ios::binary);
    o.write((const char*)work.data(), work.size());
    printf("out: %s (%zu bytes, version %u)\n", argv[2], work.size(), m2::Rd32(work.data() + 4));
    return 0;
}

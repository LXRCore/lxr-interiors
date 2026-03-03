# 🐺 LXR Interiors System

```
██╗     ██╗  ██╗██████╗        ██████╗ ██████╗ ██████╗ ███████╗
██║     ╚██╗██╔╝██╔══██╗      ██╔════╝██╔═══██╗██╔══██╗██╔════╝
██║      ╚███╔╝ ██████╔╝█████╗██║     ██║   ██║██████╔╝█████╗  
██║      ██╔██╗ ██╔══██╗╚════╝██║     ██║   ██║██╔══██╗██╔══╝  
███████╗██╔╝ ██╗██║  ██║      ╚██████╗╚██████╔╝██║  ██║███████╗
╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝       ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝
```

**The Land of Wolves 🐺** — Full interior entity set activation and IMAP management for RedM.

[![Store](https://img.shields.io/badge/Store-theluxempire.tebex.io-blue)](https://theluxempire.tebex.io)
[![Discord](https://img.shields.io/badge/Discord-wolves.land-5865F2)](https://discord.gg/CrKcWdfd3A)
[![Website](https://img.shields.io/badge/Website-wolves.land-green)](https://www.wolves.land)

---

## ═══ Overview ═══

`lxr-interiors` activates interior entity sets and IMAPs across the entire RDR2 world so players on your RedM server can enter and freely explore all buildings, saloons, banks, ranches, and other interior spaces.

---

## ═══ Framework Support ═══

| Framework | Status |
|-----------|--------|
| **LXR Core** | ✅ Primary |
| **RSG Core** | ✅ Primary |
| **VORP Core** | ✅ Supported |
| RedEM:RP | ✅ Compatible |
| QBR Core | ✅ Compatible |
| QR Core | ✅ Compatible |
| Standalone | ✅ Fallback |

---

## ═══ Installation ═══

1. Download or clone this resource into your server's `resources` folder.
2. Ensure the folder is named **`lxr-interiors`** (required for the resource name protection check).
3. Add the following line to your `server.cfg`:

```cfg
ensure lxr-interiors
```

4. Configure `config.lua` to match your server's needs.

---

## ═══ Configuration ═══

Open `config.lua` to adjust settings:

```lua
Config.Interiors = {
    Debug       = false,   -- Enable debug prints
    Mode        = 'both',  -- 'basic' | 'full' | 'both'
    EnableBasic = true,    -- Activate interior entity sets
    EnableFull  = true,    -- Activate IMAPs
}
```

| Option | Default | Description |
|--------|---------|-------------|
| `Debug` | `false` | Print activation messages to console |
| `Mode` | `'both'` | Which interior loader(s) to use |
| `EnableBasic` | `true` | Load entity-set based interiors |
| `EnableFull` | `true` | Load IMAP based interiors |

---

## ═══ File Structure ═══

```
lxr-interiors/
├── fxmanifest.lua          — Resource manifest (fx_version cerulean)
├── config.lua              — Configuration & branding
├── client/
│   ├── main.lua            — Entity set activation (full set)
│   ├── interiorsBasic.lua  — Entity set activation (basic set)
│   └── interiorsFull.lua   — IMAP request / removal
└── README.md
```

---

## ═══ Server Information ═══

| Field | Value |
|-------|-------|
| Server | The Land of Wolves 🐺 |
| Developer | iBoss21 / The Lux Empire |
| Website | https://www.wolves.land |
| Discord | https://discord.gg/CrKcWdfd3A |
| Store | https://theluxempire.tebex.io |

---

© 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved

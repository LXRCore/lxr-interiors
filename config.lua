--[[
    ██╗     ██╗  ██╗██████╗        ██████╗ ██████╗ ██████╗ ███████╗
    ██║     ╚██╗██╔╝██╔══██╗      ██╔════╝██╔═══██╗██╔══██╗██╔════╝
    ██║      ╚███╔╝ ██████╔╝█████╗██║     ██║   ██║██████╔╝█████╗  
    ██║      ██╔██╗ ██╔══██╗╚════╝██║     ██║   ██║██╔══██╗██╔══╝  
    ███████╗██╔╝ ██╗██║  ██║      ╚██████╗╚██████╔╝██║  ██║███████╗
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝       ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝

    🐺 LXR Interiors System

    This configuration file controls the LXR Interiors system for RedM.
    It activates interior entity sets and IMAPs so players can enter and
    experience buildings and locations across the entire RDR2 game world.

    ═══════════════════════════════════════════════════════════════════════════════
    SERVER INFORMATION
    ═══════════════════════════════════════════════════════════════════════════════

    Server:      The Land of Wolves 🐺
    Tagline:     Georgian RP 🇬🇪 | მგლების მიწა - რჩეულთა ადგილი!
    Description: ისტორია ცოცხლდება აქ! (History Lives Here!)
    Type:        Serious Hardcore Roleplay
    Access:      Discord & Whitelisted

    Developer:   iBoss21 / The Lux Empire
    Website:     https://www.wolves.land
    Discord:     https://discord.gg/CrKcWdfd3A
    GitHub:      https://github.com/iBoss21
    Store:       https://theluxempire.tebex.io
    Server:      https://servers.redm.net/servers/detail/8gj7eb

    ═══════════════════════════════════════════════════════════════════════════════

    Version: 1.0.0
    Performance Target: Optimized for minimal client overhead

    Tags: RedM, Interiors, Georgian, SeriousRP, Whitelist, EntitySets, IMAP

    Framework Support:
    - LXR Core (Primary)
    - RSG Core (Compatible)
    - VORP Core (Compatible)
    - RedEM:RP (Compatible)
    - QBR Core (Compatible)
    - QR Core (Compatible)
    - Standalone (Compatible)

    ═══════════════════════════════════════════════════════════════════════════════
    CREDITS
    ═══════════════════════════════════════════════════════════════════════════════

    Script Author: iBoss21 / The Lux Empire for The Land of Wolves

    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]

Config = {}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ SERVER BRANDING & INFO ████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.ServerInfo = {
    name        = 'The Land of Wolves 🐺',
    tagline     = 'Georgian RP 🇬🇪 | მგლების მიწა - რჩეულთა ადგილი!',
    description = 'ისტორია ცოცხლდება აქ!', -- History Lives Here!
    type        = 'Serious Hardcore Roleplay',
    access      = 'Discord & Whitelisted',

    -- Contact & Links
    website      = 'https://www.wolves.land',
    discord      = 'https://discord.gg/CrKcWdfd3A',
    github       = 'https://github.com/iBoss21',
    store        = 'https://theluxempire.tebex.io',
    serverListing = 'https://servers.redm.net/servers/detail/8gj7eb',

    -- Developer Info
    developer = 'iBoss21 / The Lux Empire',

    -- Tags
    tags = {'RedM', 'Georgian', 'SeriousRP', 'Whitelist', 'Interiors', 'EntitySets', 'IMAP'}
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ FRAMEWORK CONFIGURATION ███████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

--[[
    Framework Priority (in order):
    1. LXR-Core (Primary)
    2. RSG-Core (Primary)
    3. VORP Core (Supported)
    4. RedEM:RP  (Optional - if detected)
    5. QBR-Core  (Optional - if detected)
    6. QR-Core   (Optional - if detected)
    7. Standalone (Fallback)
]]

Config.Framework = 'auto' -- 'auto' | 'lxr' | 'rsg' | 'vorp' | 'redem' | 'qbr' | 'qr' | 'standalone'

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ INTERIOR SETTINGS █████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

Config.Interiors = {
    -- ─── General Settings ────────────────────────────────────────────────────────

    -- Enable debug prints when interiors are activated/already active
    Debug = false,

    -- Which interior loader to use:
    --   'basic' — Uses ActivateInteriorEntitySets (lighter, most locations)
    --   'full'  — Uses RequestImap / RemoveImap in addition to entity sets
    --   'both'  — Loads both basic entity sets and full IMAP requests
    Mode = 'both',

    -- ─── Basic Interior Activation (Entity Sets) ─────────────────────────────────
    -- Controls whether the basic entity-set interior loader is active
    EnableBasic = true,

    -- ─── Full Interior Activation (IMAPs) ────────────────────────────────────────
    -- Controls whether the full IMAP-based interior loader is active
    EnableFull = true,
}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ BOOT PRINT ████████████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████

CreateThread(function()
    print(([[
        ═══════════════════════════════════════════════════════════════════════════════
        🐺 LXR Interiors System — Loaded Successfully
        ═══════════════════════════════════════════════════════════════════════════════
        Server:    %s
        Website:   %s
        Discord:   %s
        ═══════════════════════════════════════════════════════════════════════════════
    ]]):format(Config.ServerInfo.name, Config.ServerInfo.website, Config.ServerInfo.discord))
end)

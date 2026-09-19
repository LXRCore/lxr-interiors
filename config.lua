--[[
    ██╗     ██╗  ██╗██████╗       ██╗███╗   ██╗████████╗███████╗██████╗ ██╗ ██████╗ ██████╗ ███████╗
    ██║     ╚██╗██╔╝██╔══██╗      ██║████╗  ██║╚══██╔══╝██╔════╝██╔══██╗██║██╔═══██╗██╔══██╗██╔════╝
    ██║      ╚███╔╝ ██████╔╝█████╗██║██╔██╗ ██║   ██║   █████╗  ██████╔╝██║██║   ██║██████╔╝███████╗
    ██║      ██╔██╗ ██╔══██╗╚════╝██║██║╚██╗██║   ██║   ██╔══╝  ██╔══██╗██║██║   ██║██╔══██╗╚════██║
    ███████╗██╔╝ ██╗██║  ██║      ██║██║ ╚████║   ██║   ███████╗██║  ██║██║╚██████╔╝██║  ██║███████║
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝      ╚═╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝

    LXR Core - Interiors

    The rooms the game leaves shut. Two kinds of map data, both in `data/`:
    entity sets per interior (the furniture, windows and lights of banks,
    saloons, stores) and IMAP pieces to request or remove. The client
    applies them once, retrying until each interior has streamed in, and
    then goes idle. Nothing here is gameplay; it is the stage.

    Brand:       LXRCore — Lux Empire eXperience RedM Core
    Product:     wolves.land / The Land of Wolves
    Developer:   iBoss21 / LXRCore
    Website:     https://www.lxrcore.com
    Discord:     https://discord.gg/GAhk8cgXe9
    GitHub:      https://github.com/LXRCore

    Version: 3.0.0
    Performance Target: 0.00 ms idle (a retry loop that ends when every set is applied or `giveUpMinutes` passes)

    © 2026 iBoss21 / LXRCore | lxrcore.com | All Rights Reserved
]]

Config = Config or {}

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ LANGUAGE ██████████████████████████████████████████████
-- ████████████████████████████████████████████████████████████████████████████████
Config.Lang = 'en'

-- ████████████████████████████████████████████████████████████████████████████████
-- ████████████████████████ WHAT TO APPLY ═════════════════════════════════════════
-- ████████████████████████████████████████████████████████████████████████████████
Config.Interiors = {
    entitySets = true,            -- data/sets.lua
    imaps = true,                 -- data/imaps.lua: Request
    removeImaps = true,           -- data/imaps.lua: Remove
    retrySeconds = 10,            -- between passes over interiors that have not streamed in yet
    giveUpMinutes = 15,           -- stop retrying after this; /interiors reload starts again
    skip = {},                    -- interior ids to leave alone, e.g. { 74241 } for the character creator room
}

Config.Command = { name = 'interiors', permission = 'admin' }   -- /interiors status | reload
Config.Debug = { printBanner = true, log = false }

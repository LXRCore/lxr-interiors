--[[ ═══════════════════════════════════════════════════════════════════════════
     LXR-INTERIORS — Server: the staff command, the banner
     © 2026 iBoss21 / LXRCore — All Rights Reserved
     ═══════════════════════════════════════════════════════════════════════════ ]]

local LXRCore = exports['lxr-core']:GetCoreObject()
local LXR = exports['lxr-core']:GetLXR()
local I = LXRInteriors
local RES = GetCurrentResourceName()

LXR.Commands.Register({
    name = Config.Command.name, help = Lang:t('cmd.help'), permission = Config.Command.permission,
    args = { { name = 'what', help = 'status | reload' } },
    handler = function(src, args)
        if args[1] == 'reload' then TriggerClientEvent('lxr-interiors:client:reload', src) LXRCore.Notify(src, Lang:t('info.reloading'), 'info')
        else TriggerClientEvent('lxr-interiors:client:status', src) end
    end,
})

CreateThread(function()
    local problems = I.Validate()
    for _, p in ipairs(problems) do print('^3[lxr-interiors]^7 data: ' .. p) end
    if Config.Debug.printBanner then
        local groups, sets, req, rem = I.Counts()
        print(('^1[lxr-interiors]^7 v%s — %d interiors, %d entity sets, %d imaps requested, %d removed'):format(GetResourceMetadata(RES, 'version', 0), groups, sets, req, rem))
    end
end)

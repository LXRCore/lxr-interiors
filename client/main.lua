--[[ ═══════════════════════════════════════════════════════════════════════════
     LXR-INTERIORS — Client: apply the map data, then go idle
     © 2026 iBoss21 / LXRCore — All Rights Reserved
     ═══════════════════════════════════════════════════════════════════════════ ]]

local LXRCore = exports['lxr-core']:GetCoreObject()
local I = LXRInteriors
local N = Citizen.InvokeNative
local pending, applied, running = {}, {}, false

local function applyImaps()
    if Config.Interiors.imaps then for _, h in ipairs(I.Request or {}) do RequestImap(h) end end
    if Config.Interiors.removeImaps then for _, h in ipairs(I.Remove or {}) do RemoveImap(h) end end
end

---returns true when the whole group is on
local function applyGroup(g)
    if not IsValidInterior(g.id) then return false end
    if not IsInteriorReady(g.id) then return false end
    for _, s in ipairs(g.sets) do if not IsInteriorEntitySetActive(g.id, s) then ActivateInteriorEntitySet(g.id, s) end end
    return true
end

local function run()
    if running then return end
    running = true
    applyImaps()
    pending, applied = {}, {}
    if Config.Interiors.entitySets then for _, g in ipairs(I.Groups()) do pending[#pending + 1] = g end end
    local giveUp = GetGameTimer() + Config.Interiors.giveUpMinutes * 60000
    while #pending > 0 and GetGameTimer() < giveUp do
        local left = {}
        for _, g in ipairs(pending) do
            if applyGroup(g) then applied[#applied + 1] = g.label if Config.Debug.log then print(('[lxr-interiors] %s on'):format(g.label)) end else left[#left + 1] = g end
        end
        pending = left
        if #pending > 0 then Wait(Config.Interiors.retrySeconds * 1000) end
    end
    running = false
    if Config.Debug.printBanner then print(('^1[lxr-interiors]^7 %d interiors dressed, %d not streamed in'):format(#applied, #pending)) end
end

CreateThread(function() Wait(2000) run() end)

RegisterNetEvent('lxr-interiors:client:reload', function() if not running then CreateThread(run) end end)
RegisterNetEvent('lxr-interiors:client:status', function()
    local groups, sets, req, rem = I.Counts()
    LXRCore.Notify(Lang:t('info.status', { on = #applied, groups = groups, sets = sets, req = req, rem = rem, waiting = #pending }), 'info')
end)

exports('SetActive', function(interior, set, on)
    if not IsValidInterior(interior) then return false end
    if on == false then DeactivateInteriorEntitySet(interior, set) else ActivateInteriorEntitySet(interior, set) end
    return true
end)
exports('Reload', function() if not running then CreateThread(run) end end)
exports('Applied', function() return applied end)

--[[ ═══════════════════════════════════════════════════════════════════════════
     LXR-INTERIORS — Offline tests: the data is clean, skip works, locale parity
     Usage (from the lxr-interiors folder):  lua tests/run.lua
     © 2026 iBoss21 / LXRCore — All Rights Reserved
     ═══════════════════════════════════════════════════════════════════════════ ]]

local CORE = os.getenv('LXR_CORE_PATH') or '../lxr-core'
package.path = CORE .. '/?.lua;' .. package.path
local ok = pcall(function() require('tests.lib.fxshim') end)
if not ok then print('lxr-core shim not found at ' .. CORE) os.exit(2) end
local Shim = require('tests.lib.fxshim')
for _, f in ipairs({ 'shared/main.lua', 'shared/locale.lua', 'locales/en.lua', 'config.lua' }) do Shim.load(CORE .. '/' .. f) end
Config = nil Locale = nil
Shim.load('shared/locale.lua') Shim.load('locales/en.lua') Shim.load('locales/ka.lua') Shim.load('config.lua') Shim.load('data/sets.lua') Shim.load('data/imaps.lua') Shim.load('shared/rules.lua')
local I = LXRInteriors

local passed, failed = 0, 0
local function test(name, fn) local okT, err = xpcall(fn, debug.traceback) if okT then passed = passed + 1 print('  ^ ok   ' .. name) else failed = failed + 1 print('  x FAIL ' .. name .. '\n' .. err) end end
local function eq(a, b, msg) if a ~= b then error((msg or 'eq') .. ': expected ' .. tostring(b) .. ' got ' .. tostring(a), 2) end end

print('lxr-interiors offline tests')
test('the data is clean', function()
    local problems = I.Validate()
    eq(#problems, 0, table.concat(problems, '; '))
    local groups, sets, req, rem = I.Counts()
    assert(groups >= 30 and sets >= 400, 'entity sets present')
    assert(req >= 1000 and rem >= 50, 'imap lists present')
    for _, h in ipairs(I.Request) do assert(math.type(h) == 'integer', tostring(h)) end
end)
test('skip leaves an interior alone', function()
    local before = #I.Groups()
    Config.Interiors.skip = { I.Sets[1].id }
    eq(#I.Groups(), before - 1)
    for _, g in ipairs(I.Groups()) do assert(g.id ~= I.Sets[1].id) end
    Config.Interiors.skip = {}
end)
test('validate catches duplicates', function()
    local saved = I.Sets
    I.Sets = { { id = 1, label = 'a', sets = { 'x', 'x' } }, { id = 1, label = 'b', sets = {} } }
    local p = I.Validate()
    assert(#p == 2, table.concat(p, '; '))
    I.Sets = saved
end)
test('locale parity', function()
    local en, ka = Locale.Bundles.en, Locale.Bundles.ka
    local missing = {}
    for k in pairs(en) do if ka[k] == nil then missing[#missing + 1] = k end end
    eq(#missing, 0, 'ka missing: ' .. table.concat(missing, ', '))
end)
print(('%d passed, %d failed'):format(passed, failed))
os.exit(failed == 0 and 0 or 1)

--[[ ═══════════════════════════════════════════════════════════════════════════
     LXR-INTERIORS — Shared rules: what the data says, cleaned
     © 2026 iBoss21 / LXRCore — All Rights Reserved
     ═══════════════════════════════════════════════════════════════════════════ ]]

LXRInteriors = LXRInteriors or {}
local I = LXRInteriors

---Entity-set groups minus the skipped interiors.
function I.Groups()
    local skip = {}
    for _, id in ipairs(Config.Interiors.skip or {}) do skip[id] = true end
    local out = {}
    for _, g in ipairs(I.Sets or {}) do if not skip[g.id] then out[#out + 1] = g end end
    return out
end

---Counts for the banner and /interiors status.
function I.Counts()
    local groups, sets = 0, 0
    for _, g in ipairs(I.Groups()) do groups = groups + 1 sets = sets + #g.sets end
    return groups, sets, #(I.Request or {}), #(I.Remove or {})
end

---Problems in the data (empty = healthy): duplicate ids, duplicate sets in a group, hashes on both imap lists.
function I.Validate()
    local problems, ids = {}, {}
    for _, g in ipairs(I.Sets or {}) do
        if type(g.id) ~= 'number' or not g.label or type(g.sets) ~= 'table' then problems[#problems + 1] = 'bad group ' .. tostring(g.label or g.id) end
        if ids[g.id] then problems[#problems + 1] = 'interior listed twice: ' .. g.id end
        ids[g.id] = true
        local seen = {}
        for _, s in ipairs(g.sets or {}) do if seen[s] then problems[#problems + 1] = ('set %s twice in %s'):format(s, g.label) end seen[s] = true end
    end
    local req = {}
    for _, h in ipairs(I.Request or {}) do if req[h] then problems[#problems + 1] = 'imap requested twice: ' .. h end req[h] = true end
    for _, h in ipairs(I.Remove or {}) do if req[h] then problems[#problems + 1] = 'imap both requested and removed: ' .. h end end
    return problems
end

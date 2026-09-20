-- #region Utility

local function contains(s, cs)
    return string.find(s, cs) ~= nil
end

local function containsKey(t, k)
    for key, _ in pairs(t) do
        if key == k then
            return true
        end
    end
    return false
end

local function tableContains(t, v)
    for _, value in pairs(t) do
        if value == v then
            return true
        end
    end
    return false
end

-- #endregion

-- #region Constants

local SINGLE_LINES = {
    ["single2_light"] = "light_2",
    ["single2_conflict"] = "dark_2",
    ["touhou_light"] = "touhou_light_wall",
    ["touhou_conflict"] = "touhou_bullet_wall",
    ["undertale_light"] = "undertale_light_wall",
    ["undertale_conflict"] = "undertale_conflict_wall",
    ["megalovaniarmx"] = "undertale_megalovaniarmx_wall",
    ["macula_light_a"] = "macula_light_wall",
    ["macula_conflict_a"] = "macula_conflict_wall"
}

local TRACK_DARK_BG_NAMES = {
    "dynamix_conflict",
    "mirai_conflict",
    "lethaeus",
    "mirai_awakened",
    "saikyostronger"
}

-- #endregion

-- #region Functions

function GetTrackSkinName(song)
    local id = song.Id
    local bg = song.Background
    local side = song.Side

    if contains(bg, "byd_") then
        return nil
    end

    if contains(id, "alexandrite") or tableContains(TRACK_DARK_BG_NAMES, bg) then
        return "Black"
    end

    if contains(bg, "nijuusei") or bg == "vs_conflict" then
        local name = "Nijuusei"
        if side ~= 1 then
            name = "Light"
        end
        return name
    end

    if contains(id, "etherstrike") then
        return "Rei"
    end

    if contains(id, "wereallgonnadie")
    or contains(id, "tempestissimo")
    or contains(id, "undyingmacula")
    then
        return "Tempest"
    end

    if bg == "finale_conflict" or bg == "alterego" then
        return "Finale"
    end

    if bg == "pentiment" or bg == "apophenia" then
        return "Pentiment"
    end

    if bg == "arcanaeden" then
        return "Arcana"
    end

    return nil
end

function GetSingleLineSkinName(song)
    local id = song.Id
    local set = song.PackSet
    local bg = song.Background
    local side = song.Side
    local result = "none"
    if set == "single" then
        if id == "nullapophenia" or id == "desive" then
            return "none"
        end
        if side ~= 1 then
            result = "light"
        else
            result = "dark"
        end
    end
    if containsKey(SINGLE_LINES, bg) then
        return SINGLE_LINES[bg]
    end
    return result
end

function GetHitEffectSkinName(song)
    local side = song.Side
    local set = song.PackSet
    if contains(set, "mirai") then
        if side == 1 then
            return "mirai_conflict"
        else
            return "mirai_light"
        end
    elseif contains(set, "nijuusei") then
        return "mirai_light"
    else
        return nil
    end
end

function GetLongNoteHitEffectSkinName(song)
    local id = song.Id
    local side = song.Side
    local bg = song.Background
    if contains(bg, "mirai") then
        if side == 1 then
            return "mirai_dark"
        else
            return "mirai_light"
        end
    elseif contains(bg, "lethaeus") and side == 1 then
        return "mirai_dark"
    elseif contains(bg, "nijuusei") and id ~= "overdead" then
        return "mirai_light"
    else
        return "normal"
    end
end

function GetCriticalLineSkinName(song)
    if song.Side == 2 then
        return "colorless"
    end
    if song.PackSet == "dynamix" or contains(song.Id, "alexandrite") then
        return "dynamix"
    end
    return "normal"
end

function GetComboTextColorSkinName(song)
    if song.Side == 2 then
        return "colorless"
    end
    if song.PackSet == "dynamix" then
        return "dynamix"
    end
    return nil
end

-- #endregion
-- By NCat

local lastEndX = nil
local lastEndY = nil
local lastIsTrace = nil

-- local function i2b(value)
--     return value ~= 0
-- end

-- local function b2i(value)
--     return value and 1 or 0
-- end

local function round(x)
    if x - math.floor(x) < 0.5 then
        return math.floor(x)
    else
        return math.ceil(x)
    end
end

---@param note LuaArcNote 指定 Note
---@param style integer 样式 ID
---@param hasEnd boolean 表示是否在结尾额外生成一条 Arc (只有 style >= 3 可用)
local function processArc(note, style, hasEnd)
    local interval = NoteEditor.GetIntervalOfBeatlineAtTiming(note.Timing, note.GroupID)
    local duration = note.EndTiming - note.Timing
    local count = round(duration / interval)
    local isTrace = note.IsTrace or (lastIsTrace ~= nil and lastIsTrace)
    local endX = nil
    local endY = nil
    if style == 6 and (not note.RenderHead) then
        if lastEndX ~= nil and lastEndY ~= nil then
            -- Toast.Show(string.format("lastEndX: %f, lastEndY: %f", lastEndX, lastEndY))
            NoteEditor.AddArcNote(
                note.Timing,
                note.Timing,
                lastEndX, note.StartPosition.X,
                ArcLineType.S,
                lastEndY, note.StartPosition.Y,
                note.Color,
                note.IsTrace
            )
        end
    end
    for j = 0, count do
        local p = j / count
        local np = (j + 1) / count

        local t = round(note.Timing + j * interval)
        local et = round(note.Timing + (j + 1) * interval)

        local currX = note.GetXAt(p)
        local currY = note.GetYAt(p)
        local nextX = note.GetXAt(np)
        local nextY = note.GetYAt(np)

        -- endX = nextX
        -- endY = nextY

        local mustInRange = j < count
        local shouldOutOfRange = (mustInRange or ((not mustInRange) and hasEnd))

        if style == 0 and mustInRange then -- 单纯拆解
            NoteEditor.AddArcNote(
                t,
                et,
                currX, nextX,
                ArcLineType.S,
                currY, nextY,
                note.Color,
                note.IsTrace
            )
        elseif style == 1 and mustInRange then -- 拆解 + 1ms 间隔
            NoteEditor.AddArcNote(
                t,
                et - 1,
                currX, nextX,
                ArcLineType.S,
                currY, nextY,
                note.Color,
                note.IsTrace
            )
        elseif style == 2 and mustInRange then -- 记忆森林式拆解
            -- i2b((b2i(isTrace) + j) % 2)
            NoteEditor.AddArcNote(
                t,
                et,
                currX, nextX,
                ArcLineType.S,
                currY, nextY,
                note.Color,
                isTrace
            )
            isTrace = not isTrace
        elseif style == 3 and shouldOutOfRange then -- 直角拆解
            NoteEditor.AddArcNote(
                t,
                et,
                currX, currX,
                ArcLineType.S,
                currY, currY,
                note.Color,
                note.IsTrace
            )
        elseif style == 4 and shouldOutOfRange then -- y 直角拆解
            NoteEditor.AddArcNote(
                t,
                et,
                currX, nextX,
                ArcLineType.S,
                currY, currY,
                note.Color,
                note.IsTrace
            )
        elseif style == 5 and shouldOutOfRange then -- x 直角拆解
            NoteEditor.AddArcNote(
                t,
                et,
                currX, currX,
                ArcLineType.S,
                currY, nextY,
                note.Color,
                note.IsTrace
            )
        elseif style == 6 and mustInRange then -- 直角拆解 + 连接符
            NoteEditor.AddArcNote(
                t,
                et,
                currX, currX,
                ArcLineType.S,
                currY, currY,
                note.Color,
                note.IsTrace
            )
            if j < count - 1 or hasEnd then
                NoteEditor.AddArcNote(
                    et,
                    et,
                    currX, nextX,
                    ArcLineType.S,
                    currY, nextY,
                    note.Color,
                    note.IsTrace
                )
            end
            endX = currX
            endY = currY
        end
    end
    lastEndX = endX
    lastEndY = endY
    lastIsTrace = isTrace
end

local function processNotes(notes, style, hasEnd)
    -- Toast.Show(string.format("style: %d", style))
    local arcs = {}
    for i = 0, notes.Count - 1 do
        local note = notes[i]
        if NoteEvent.IsArc(note) then
            arcs[#arcs + 1] = note
            -- processArc(note, style)
        end
    end

    for i = 1, #arcs do
        processArc(arcs[i], style, hasEnd and i == #arcs)
    end

    lastEndX = nil
    lastEndY = nil
    lastIsTrace = nil
end

local styleNames = {
    "单纯拆解",
    "拆解+1ms间隔",
    "记忆森林式拆解",
    "直角拆解",
    "y直角拆解",
    "x直角拆解",
    "直角拆解+连接符"
}

for i = 0, 6 do
    Tool.Register(
        "切割Arc: "..styleNames[i+1],
        function (notes)
            processNotes(notes, i, false)
        end
    )
    if i >= 3 then
        Tool.Register(
            "切割Arc: "..styleNames[i+1].."+结尾",
            function (notes)
                processNotes(notes, i, true)
            end
        )
    end
end
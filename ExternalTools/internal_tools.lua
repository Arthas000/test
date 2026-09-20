
-- #region HELPER

local function ternary(cond, a, b)
    if cond then
        return a
    else
        return b
    end
end

local function lerp(a, b, t)
    return a + (b - a) * t
end

local function round(x)
    if x - math.floor(x) < 0.5 then
        return math.floor(x)
    else
        return math.ceil(x)
    end
end

local function noteTableContains(table, element)
    for _, value in ipairs(table) do
        if element.ValueEquals(value) then
            return true
        end
    end
    return false
end

local function filterColorIndexNotes(notes)
    local result = {}
    for i = 0, notes.Count - 1, 1 do
        local note = notes[i]
        if NoteEvent.IsArc(note) then
            if note.ArcType == ArcType.Arc and note.Color == 3 and note.Timing == note.EndTiming then
                if not noteTableContains(result, note) then
                    result[#result+1] = note
                end
            end
            local arctaps = note.GetArcTapNotes()
            for j = 0, arctaps.Count - 1, 1 do
                local arctap = arctaps[j]
                if not noteTableContains(result, arctap) then
                    result[#result+1] = arctap
                end
            end
        elseif NoteEvent.IsArcTap(note) then
            if not noteTableContains(result, note) then
                result[#result+1] = note
            end
        elseif NoteEvent.IsLaneNote(note) then
            result[#result+1] = note
        end
    end
    table.sort(
        result,
        function (a, b)
            return b.Timing > a.Timing
        end
    )
    return result
end

local function arcX2world(x)
    return x * 850 - 425
end

local function arcX2Lane(x)
    return (x + 0.5) / 2
end

local function laneX2world(n)
    local x = n.Track
    if n.IsFloatLane then
        x = n.Lane
        return x * 1700 - 850 - 212
    end
    return 425 * x - 1275
end

local function getWorldXPos(n)
    local arctap = NoteEvent.CastToArcTapNote(n)
    if arctap ~= nil then
        return arcX2world(arctap.ParentArc.GetXAtTiming(arctap.Timing))
    end
    local tap = NoteEvent.CastToTapNote(n)
    if tap ~= nil then
        return laneX2world(tap)
    end
    local hold = NoteEvent.CastToHoldNote(n)
    if hold ~= nil then
        return laneX2world(hold)
    end
end

local function getNoteGroups(targetNotes)
    local noteGroups = {}
    local offset = 0
    for i = 1, #targetNotes, 1 do
        local idx = i + offset
        if idx > #targetNotes then
            break
        end
        local note = targetNotes[idx]
        local group = { note }
        local j = idx
        while true do
            j = j + 1
            if j > #targetNotes then
                break
            end
            local nextNote = targetNotes[j]
            if math.abs(nextNote.Timing - note.Timing) <= 2 then
                table.insert(group, nextNote)
                offset = offset + 1
            else
                break
            end
        end
        if #group >= 2 then
            table.sort(
                group,
                function (a, b)
                    local ax = getWorldXPos(a)
                    local bx = getWorldXPos(b)
                    return bx > ax
                end
            )
        end
        table.insert(noteGroups, group)
    end
    return noteGroups
end

local function generateTriangle(time, position, bpm)
    local length = 60000 / bpm / 8
    local endTime = math.ceil(time + length)
    local halfEndTime = math.ceil(time + length / 2)
    local direction = Random.RandInt(0, 4)
    if direction == 0 then     -- △
        NoteEditor.AddArcNote(time, time, position - 0.13, position + 0.13, ArcLineType.S, 1.0, 1.0, 0, true)
        NoteEditor.AddArcNote(time, endTime, position - 0.13, position, ArcLineType.S, 1.0, 1.0, 0, true)
        NoteEditor.AddArcNote(time, endTime, position + 0.13, position, ArcLineType.S, 1.0, 1.0, 0, true)
    elseif direction == 1 then -- ▽
        NoteEditor.AddArcNote(time, endTime, position, position - 0.13, ArcLineType.S, 1.0, 1.0, 0, true)
        NoteEditor.AddArcNote(time, endTime, position, position + 0.13, ArcLineType.S, 1.0, 1.0, 0, true)
        NoteEditor.AddArcNote(endTime, endTime, position - 0.13, position + 0.13, ArcLineType.S, 1.0, 1.0, 0, true)
    elseif direction == 2 then -- ◁
        NoteEditor.AddArcNote(time, halfEndTime, position + 0.13, position - 0.13, ArcLineType.S, 1.0, 1.0, 0, true)
        NoteEditor.AddArcNote(halfEndTime, endTime, position - 0.13, position + 0.13, ArcLineType.S, 1.0, 1.0, 0, true)
        NoteEditor.AddArcNote(time, endTime, position + 0.13, position + 0.13, ArcLineType.S, 1.0, 1.0, 0, true)
    elseif direction == 3 then -- ▷
        NoteEditor.AddArcNote(time, halfEndTime, position - 0.13, position + 0.13, ArcLineType.S, 1.0, 1.0, 0, true)
        NoteEditor.AddArcNote(halfEndTime, endTime, position + 0.13, position - 0.13, ArcLineType.S, 1.0, 1.0, 0, true)
        NoteEditor.AddArcNote(time, endTime, position - 0.13, position - 0.13, ArcLineType.S, 1.0, 1.0, 0, true)
    end
end

-- #endregion HELPER

-- #region NOTE2TRACE


local _TAP_NOTE_LENGTH = 25
local _ARC_HEAD_LENGTH = 5
local _ARC_TAP_LENGTH = 12

local function createArc(t, et, p, ep)
    NoteEditor.AddArcNote(t, et, p.X, ep.X, "s", p.Y, ep.Y, 0, "none", true)
end

local function createSegmentArc(t, et, p, ep, e)
    NoteEditor.AddArcNote(t, et, p.X, ep.X, e, p.Y, ep.Y, 0, "none", true)
end

local function arcXFromLaneNote(laneNote)
    if laneNote.IsFloatLane then
        return (laneNote.Lane - 0.25) * 2
    end
    return -0.75 + laneNote.Track * 0.5
end

local function buildTap(note)
    local x = arcXFromLaneNote(note)
    local verts = {
        Data.Vec2(x - .2, -.2),
        Data.Vec2(x + .2, -.2),
    }
    local t = note.Timing
    local et = note.Timing + _TAP_NOTE_LENGTH
    createArc(t, t, verts[1], verts[2]) -- bottom
    createArc(t, et, verts[1], verts[1]) -- left
    createArc(t, et, verts[2], verts[2]) -- right
    createArc(et, et, verts[1], verts[2]) -- top
end

local function buildHold(note)
    local x = arcXFromLaneNote(note)
    local verts = {
        Data.Vec2(x - .2, -.2),
        Data.Vec2(x + .2, -.2),
    }
    local t = note.Timing
    local et = note.EndTiming
    createArc(t, t, verts[1], verts[2])   -- bottom
    createArc(t, et, verts[1], verts[1])  -- left
    createArc(t, et, verts[2], verts[2])  -- right
    createArc(et, et, verts[1], verts[2]) -- top
end

local function buildArcTap(t, pos)
    local verts = {
        pos + Data.Vec2(-0.24, -0.02), -- top left
        pos + Data.Vec2(0.24, -0.02),  -- top right
        pos + Data.Vec2(-0.24, -0.15), -- bottom left
        pos + Data.Vec2(0.24, -0.15)   -- bottom right
    }

    local et = t + _ARC_TAP_LENGTH

    createArc(t, t, verts[1], verts[2]) -- start top
    createArc(t, t, verts[2], verts[4]) -- start right
    createArc(t, t, verts[4], verts[3]) -- start bottom
    createArc(t, t, verts[3], verts[1]) -- start left

    createArc(t, et, verts[1], verts[1]) -- body top left
    createArc(t, et, verts[2], verts[2]) -- body top right
    createArc(t, et, verts[3], verts[3]) -- body bottom left
    createArc(t, et, verts[4], verts[4]) -- body bottom right

    createArc(et, et, verts[1], verts[2]) -- end top
    createArc(et, et, verts[2], verts[4]) -- end right
    createArc(et, et, verts[4], verts[3]) -- end bottom
    createArc(et, et, verts[3], verts[1]) -- end left
end

local function buildScaledArcTap(t, pos, left, right)
    local verts = {
        pos + Data.Vec2(0.01, -0.02), -- top left
        pos + Data.Vec2(right - left - 0.01, -0.02),  -- top right
        pos + Data.Vec2(0.01, -0.15), -- bottom left
        pos + Data.Vec2(right - left - 0.01, -0.15)   -- bottom right
    }

    local et = t + _ARC_TAP_LENGTH

    createArc(t, t, verts[1], verts[2]) -- start top
    createArc(t, t, verts[2], verts[4]) -- start right
    createArc(t, t, verts[4], verts[3]) -- start bottom
    createArc(t, t, verts[3], verts[1]) -- start left

    createArc(t, et, verts[1], verts[1]) -- body top left
    createArc(t, et, verts[2], verts[2]) -- body top right
    createArc(t, et, verts[3], verts[3]) -- body bottom left
    createArc(t, et, verts[4], verts[4]) -- body bottom right

    createArc(et, et, verts[1], verts[2]) -- end top
    createArc(et, et, verts[2], verts[4]) -- end right
    createArc(et, et, verts[4], verts[3]) -- end bottom
    createArc(et, et, verts[3], verts[1]) -- end left
end

local function buildArc(note)
    local t = note.Timing
    local et = note.EndTiming
    local p = note.StartPosition
    local ep = note.EndPosition

    if note.IsScaledArcTap then

        buildScaledArcTap(t, p, p.X, ep.X)
        
    elseif not note.IsTrace then

        local verts = {
            p + Data.Vec2(0.00, -0.07),  -- head middle

            p + Data.Vec2(-0.09, -0.07), -- segment start left
            p + Data.Vec2(0.00, 0.09),   -- segment start middle
            p + Data.Vec2(0.09, -0.07),  -- segment start right

            ep + Data.Vec2(-0.09, -0.07),   -- segment end left
            ep + Data.Vec2(0.00, 0.09),     -- segment end middle
            ep + Data.Vec2(0.09, -0.07),    -- segment end right
        }

        if note.RenderHeightIndicator then
            local heightVerts = {
                p + Data.Vec2(-0.00, -0.07), -- height top
                Data.Vec2(p.x, -0.20)        -- height bottom
            }
            createArc(t, t, heightVerts[2], heightVerts[1])
        end

        if note.RenderHead then
            local headTick = t - _ARC_HEAD_LENGTH

            createArc(headTick, t, verts[1], verts[2]) -- head left
            createArc(headTick, t, verts[1], verts[3]) -- head middle
            createArc(headTick, t, verts[1], verts[4]) -- head right

        end

        createArc(t, t, verts[2], verts[3])   -- segment start left
        createArc(t, t, verts[4], verts[3])   -- segment start right

        createSegmentArc(t, et, verts[2], verts[5], note.LineTypeString) -- segment body left
        createSegmentArc(t, et, verts[3], verts[6], note.LineTypeString) -- segment body middle
        createSegmentArc(t, et, verts[4], verts[7], note.LineTypeString) -- segment body right

        createArc(et, et, verts[5], verts[6]) -- segment end left
        createArc(et, et, verts[7], verts[6]) -- segment end right
    else
        createSegmentArc(t, et, p, ep, note.LineTypeString)
    end
    
    local arctaps = note.GetArcTapTimings()

    if arctaps.Count == 0 then
        return
    end

    for i = 0, arctaps.Count - 1 do
        local at = arctaps[i]
        buildArcTap(at, Data.Vec2(note.GetXAtTiming(at), note.GetYAtTiming(at)))
    end
end

local function buildModelInternal(note)
    if NoteEvent.IsTap(note) then buildTap(note) end
    if NoteEvent.IsHold(note) then buildHold(note) end
    if NoteEvent.IsArc(note) then buildArc(note) end
end

-- #endregion NOTE2TRACE

Tool.Register(
    "渐变 Timing",
    {
        { "开始时间", ArgumentType.Timing },
        { "结束时间", ArgumentType.Timing },
        { "开始 BPM", ArgumentType.Float },
        { "结束 BPM", ArgumentType.Float },
        { "分割数", ArgumentType.Int },
        { "缓动类型", ArgumentType.List, EaseManager.GetEaseNames() },
        { "组 ID", ArgumentType.Int },
    },
    function(timing, endTiming, startBPM, endBPM, splitCount, easing, groupID)
        if timing == endTiming then
            Toast.ShowError("开始时间和结束时间相同")
            return
        end
        
        local interval = (endTiming - timing) / splitCount
        local ease = EaseManager.ParseEase(easing)

        NoteEditor.SelectTimingGroup(groupID)

        for i = 0, splitCount - 1 do
            local currentTiming = timing + interval * i
            local progress = i / splitCount
            progress = EaseManager.Evaluate(ease, progress)

            local bpm = startBPM + (endBPM - startBPM) * progress
            
            NoteEditor.AddTimingEvent(currentTiming, bpm, 999.)
        end
    end
)

Tool.Register(
    "黑线描边",
    {
        { "开始时间", ArgumentType.Timing },
        { "结束时间", ArgumentType.Timing },
        { "过滤类型", ArgumentType.List, { "All", "LaneNote", "Tap", "Hold", "Arc", "Flick" } },
        { "组 ID", ArgumentType.Int },
    },
    function (timing, endTiming, filterType, groupID)
        if timing == endTiming then
            Toast.ShowError("开始时间和结束时间相同")
            return
        end

        NoteEditor.CreateTimingGroup()
        NoteEditor.SelectLastGroup()
        local newGroup = NoteEditor.TimingGroupCount - 1
        

        function shouldFilter(event)
            if event.GroupID ~= groupID then return false end
            if filterType == "All" then return true end
            if filterType == "LaneNote" and NoteEvent.IsLaneNote(event) then return true end
            if filterType == "Tap" and NoteEvent.IsTap(event) then return true end
            if filterType == "Hold" and NoteEvent.IsHold(event) then return true end
            if filterType == "Arc" and NoteEvent.IsArc(event) then return true end
            if filterType == "Flick" and NoteEvent.IsFlick(event) then return true end
            return false
        end

        local timings = NoteEditor.SelectTimingEventsInRange(timing, endTiming, groupID)
        local notes = NoteEditor.SelectEventsInRange(timing, endTiming)

        local targetNotes = {}

        for i = 0, notes.Count - 1 do
            local note = notes[i]
            if shouldFilter(note) then
                table.insert(targetNotes, note)
            end
        end

        for i = 0, timings.Count - 1 do
            local timing = timings[i]
            if timing.Timing == 0 then
                goto continue
            end
            timing = timing.Clone()
            timing.GroupID = newGroup
            ::continue::
        end

        for i = 1, #targetNotes do
            local note = targetNotes[i]
            buildModelInternal(note)
        end

    end
)

-- Tool.Register(
--     "Z 形蛇生成",
--     {

--     }
-- )

Tool.Register(
    "震动蛇生成",
    {
        { "开始时间", ArgumentType.Timing },
        { "结束时间", ArgumentType.Timing },
        { "开始 X", ArgumentType.Float, 0.0 },
        { "结束 X", ArgumentType.Float, 0.0 },
        { "开始 Y", ArgumentType.Float, 1.0 },
        { "结束 Y", ArgumentType.Float, 1.0 },
        { "开始震动偏移 (仅 X)", ArgumentType.Float, 0.0 },
        { "结束震动偏移 (仅 X)", ArgumentType.Float, 0.0 },
        { "震动次数", ArgumentType.Int, 1 },
        { "缓动类型", ArgumentType.String, "Linear" },
    },
    function (t, et, sx, ex, sy, ey, so, eo, count, easing)
        local easingType = EaseManager.ParseEase(easing)
        local realCount = count * 2
        points = {}
        for i = 0, realCount - 1 do
            local cx = lerp(sx, ex, i / realCount)
            local cy = lerp(sy, ey, i / realCount)
            if i % 2 ~= 0 then
                cx = cx + lerp(so, eo, EaseManager.Evaluate(easingType, i / realCount))
            end
            table.insert(points, { math.floor(lerp(t, et, i / realCount)), Data.Vec2(cx, cy) })
        end
        for i = 1, #points - 1 do
            local i1 = points[i]
            local i2 = points[i + 1]

            local t1 = i1[1]
            local t2 = i2[1]

            local p1 = i1[2]
            local p2 = i2[2]

            -- Logger.Log("Line: " .. p1.ToString() .. ", " .. p2.ToString())

            NoteEditor.AddArcNote(
                t1, t2,
                p1.X, p2.X,
                's',
                p1.Y, p2.Y,
                0,
                'none',
                true
            )
        end

    end
)

Tool.Register(
    "碎蛇生成",
    {
        { "开始时间", ArgumentType.Timing },
        { "结束时间", ArgumentType.Timing },
        { "开始 X", ArgumentType.Float, 0.0 },
        { "开始 Y", ArgumentType.Float, 1.0 },
        { "结束 X", ArgumentType.Float, 0.0 },
        { "结束 Y", ArgumentType.Float, 1.0 },
        { "缓动类型", ArgumentType.String, "Linear" },
        { "颜色", ArgumentType.Int, 0 },
        { "是否黑线", ArgumentType.Bool, false },
        { "数量", ArgumentType.Int, 1 },
    },
    function (t, et, sx, sy, ex, ey, easing, color, isTrace, count)
        local easingType = EaseManager.ParseEase(easing)
        for i = 0, count - 1 do
            local p = EaseManager.Evaluate(easingType, (i / count))
            local ct = lerp(t, et, i / count)
            local cet = lerp(t, et, ((i + 1) / count))
            local cx = lerp(sx, ex, p)
            local cy = lerp(sy, ey, p)
            NoteEditor.AddArcNote(
                ct, cet,
                cx, cx,
                's',
                cy, cy,
                color,
                'none',
                isTrace
            )
        end
    end
)

Tool.Register(
    "Make Rain",
    {
        { "Start", ArgumentType.Timing, 0 },
        { "End", ArgumentType.Timing, 1000 },
        { "Count", ArgumentType.Int, 200 },
        { "Interval Min", ArgumentType.Int, 50 },
        { "Interval Max", ArgumentType.Int, 150 },
        { "X Min", ArgumentType.Float, -0.5 },
        { "X Max", ArgumentType.Float, 1.5 },
        { "Y Min", ArgumentType.Float, 0 },
        { "Y Max", ArgumentType.Float, 1 },
        { "Create Group", ArgumentType.Bool },
    },
    function (t, et, c, imn, imx, xmn, xmx, ymn, ymx, cg)
        if c <= 0 then
            Toast.ShowError("Count is zero")
            return
        end
        if et - t == 0 then
            Toast.ShowError("Time range is zero")
            return
        end
        if cg then
            NoteEditor.CreateTimingGroup()
        end
        for _ = 0, c, 1 do
            local time = Random.RandInt(t, et)
            local interval = Random.RandInt(imn, imx)
            local x = Random.RandFloat(xmn, xmx)
            local y = Random.RandFloat(ymn, ymx)
            NoteEditor.AddArcNote(
                time, time + interval,
                x, x,
                's',
                y, y,
                0,
                'none',
                true
            )
        end
    end
)

Tool.Register(
    "VMirror Tap to ArcTap",
    {
        { "Start Timing", ArgumentType.Timing, 0 },
        { "End Timing", ArgumentType.Timing, 1000 },
        { "Paste Timing", ArgumentType.Timing, 0 },
    },
    function (t, et, pt)
        local notes = NoteEditor.SelectEventsInRange(t, et)
        local minTick = 0x7FFFFFFF
        local targetNotes = {}

        for i = 0, notes.Count - 1 do
            local note = notes[i]
            if NoteEvent.IsTap(note) then
                if note.Timing < minTick then
                    minTick = note.Timing
                end
                targetNotes[#targetNotes + 1] = note
            end
        end

        local diffTick = pt - minTick

        local function getMirrorX(note)
            local x = 0
            if note.IsFloatLane then
                x = note.Lane * 2. - .5
            else
                x = -.75 + note.Track * .5
            end
            return (x + .25) * (2 / 3.)
        end

        for i = 1, #targetNotes do
            local note = targetNotes[i]
            local x = getMirrorX(note)
            NoteEditor.AddArcNote(
                note.Timing + diffTick,
                note.Timing + 1 + diffTick,
                x, x,
                's',
                1, 1,
                0,
                'none',
                true,
                { note.Timing + diffTick }
            )
        end

    end
)

local timingCopyEditing = NoteEditor.CreateEditing(
    function (args)
        local time = args[1]
        local timeEnd = args[2]
        local pasteTime = args[3]

        local events = NoteEditor.SelectTimingEventsInRange(
            time,
            timeEnd,
            TimingManager.CurrentTimingGroupID
        )

        if events.Count == 0 then
            return
        end

        local minTime = 0x7FFFFFFF
        for i = 0, events.Count - 1, 1 do
            local e = events[i]
            minTime = math.min(e.Timing, minTime)
        end

        local offset = pasteTime - minTime

        for i = 0, events.Count - 1, 1 do
            local e = events[i]
            local ne = e.Clone()
            ne.Timing = e.Timing + offset
        end
    end
)
timingCopyEditing.AddSelectTimingCommand("Time")
timingCopyEditing.AddSelectTimingCommand("End time")
timingCopyEditing.AddSelectTimingCommand("Paste time")
Tool.Register(
    "CopyTimings(time,endTime,pasteTime)",
    timingCopyEditing
)

local cameraCopyEditing = NoteEditor.CreateEditing(
    function (args)
        local time = args[1]
        local timeEnd = args[2]
        local pasteTime = args[3]

        local events = NoteEditor.SelectEventsInRangeWithType(
            "LuaCameraControl",
            time,
            timeEnd
        )

        if events.Count == 0 then
            return
        end

        local minTime = 0x7FFFFFFF
        for i = 0, events.Count - 1, 1 do
            local e = events[i]
            minTime = math.min(e.Timing, minTime)
        end

        local offset = pasteTime - minTime

        for i = 0, events.Count - 1, 1 do
            local e = events[i]
            local ne = e.Clone()
            ne.Timing = e.Timing + offset
        end
    end
)
cameraCopyEditing.AddSelectTimingCommand("Time")
cameraCopyEditing.AddSelectTimingCommand("End time")
cameraCopyEditing.AddSelectTimingCommand("Paste time")
Tool.Register(
    "CopyCameras(time,endTime,pasteTime)",
    cameraCopyEditing
)

local cameraCopyMirrorEditing = NoteEditor.CreateEditing(
    function (args)
        local time = args[1]
        local timeEnd = args[2]
        local pasteTime = args[3]

        local events = NoteEditor.SelectEventsInRangeWithType(
            "LuaCameraControl",
            time,
            timeEnd
        )

        if events.Count == 0 then
            return
        end

        local minTime = 0x7FFFFFFF
        for i = 0, events.Count - 1, 1 do
            local e = events[i]
            minTime = math.min(e.Timing, minTime)
        end

        local offset = pasteTime - minTime

        for i = 0, events.Count - 1, 1 do
            local e = events[i]
            local ne = e.Clone()
            ne.Timing = e.Timing + offset

            local move = ne.Move
            move.X = -move.X

            local rotate = ne.Rotate
            rotate.X = -rotate.X
            rotate.Z = -rotate.Z
        end
    end
)
cameraCopyMirrorEditing.AddSelectTimingCommand("Time")
cameraCopyMirrorEditing.AddSelectTimingCommand("End time")
cameraCopyMirrorEditing.AddSelectTimingCommand("Paste time")
Tool.Register(
    "CopyCamerasMirror(time,endTime,pasteTime)",
    cameraCopyMirrorEditing
)


Tool.Register(
    "SelectNotesToTiming(notes)",
    function (notes)
        for i = 0, notes.Count - 1 do
            local note = notes[i]
            if NoteEvent.IsTap(note) then
                local currTiming = NoteEditor.SelectTimingEvent(note.Timing, note.GroupID)
                NoteEditor.AddTimingEvent(note.Timing, currTiming.Bpm, currTiming.BeatsPerLine)
            end
        end
    end
)

Tool.Register(
    "SelectNotesToTimingAndRemove(notes)",
    function (notes)
        for i = 0, notes.Count - 1 do
            local note = notes[i]
            if NoteEvent.IsTap(note) then
                local currTiming = NoteEditor.SelectTimingEvent(note.Timing, note.GroupID)
                NoteEditor.AddTimingEvent(note.Timing, currTiming.Bpm, currTiming.BeatsPerLine)
            end
        end
        NoteEditor.RemoveEvents(notes)
    end
)

local removeTimingsEditing = NoteEditor.CreateEditing(
    function (args)
        local time = args[1]
        local timeEnd = args[2]
        
        local events = NoteEditor.SelectTimingEventsInRange(
            time,
            timeEnd,
            TimingManager.CurrentTimingGroupID
        )

        if events.Count == 0 then
            return
        end

        NoteEditor.RemoveEvents(events)
    end
)
removeTimingsEditing.AddSelectTimingCommand("Time")
removeTimingsEditing.AddSelectTimingCommand("End time")
Tool.Register(
    "RemoveTimings(time,endTime)",
    removeTimingsEditing
)

local removeCamerasEditing = NoteEditor.CreateEditing(
    function (args)
        local time = args[1]
        local timeEnd = args[2]
        
        local events = NoteEditor.SelectEventsInRangeWithType(
            "LuaCameraControl",
            time,
            timeEnd
        )

        if events.Count == 0 then
            return
        end

        NoteEditor.RemoveEvents(events)
    end
)
removeCamerasEditing.AddSelectTimingCommand("Time")
removeCamerasEditing.AddSelectTimingCommand("End time")
Tool.Register(
    "RemoveCameras(time,endTime)",
    removeCamerasEditing
)

Tool.Register(
    "ConnectArcs(notes)",
    function (notes)
        if notes.Count < 2 then
            return
        end

        for i = 0, notes.Count - 2 do

            local arc1 = notes[i]
            local arc2 = notes[i + 1]
    
            local t = arc1.EndTiming
            local et = arc2.Timing
    
            local p = arc1.EndPosition
            local ep = arc2.StartPosition
    
            NoteEditor.AddArcNote(
                t, et,
                p.X, ep.X,
                ArcLineType.S,
                p.Y, ep.Y,
                0,
                arc1.IsTrace
            )
            
        end
    end
)


Tool.Register(
    "SelectNotesToJumpTiming(notes)",
    function (notes)
        local lastTime = 0
        local distance = 0
        for i = 0, notes.Count - 1 do
            local note = notes[i]
            if NoteEvent.IsTap(note) then
                local currTiming = NoteEditor.SelectTimingEvent(note.Timing)
                NoteEditor.AddTimingEvent(note.Timing, currTiming.Bpm, currTiming.BeatsPerLine)
                if i ~= 0 then
                    distance = note.Timing - lastTime
                    NoteEditor.AddTimingEvent(note.Timing - 1, currTiming.Bpm * -distance, currTiming.BeatsPerLine)
                end
                lastTime = note.Timing
            end
        end
    end
)

Tool.Register(
    "SelectNotesToJumpTimingDoubleSpeed(notes)",
    function (notes)
        local lastTime = 0
        local distance = 0
        for i = 0, notes.Count - 1 do
            local note = notes[i]
            if NoteEvent.IsTap(note) then
                local currTiming = NoteEditor.SelectTimingEvent(note.Timing)
                NoteEditor.AddTimingEvent(note.Timing, currTiming.Bpm, currTiming.BeatsPerLine)
                if i ~= 0 then
                    distance = note.Timing - lastTime
                    NoteEditor.AddTimingEvent(note.Timing - 1, currTiming.Bpm * -distance / 2, currTiming.BeatsPerLine)
                end
                lastTime = note.Timing
            end
        end
    end
)

Tool.Register(
    "CutArcsToStraightArcs(notes)",
    function (notes)
        for i = 0, notes.Count - 1 do
            local note = notes[i]
            if NoteEvent.IsArc(note) then
                local interval = NoteEditor.GetIntervalOfBeatlineAtTiming(note.Timing, note.GroupID)
                local duration = note.EndTiming - note.Timing
                local count = math.floor(duration / interval) + 1
                for j = 0, count - 1 do
                    local p = j / count
                    local np = (j + 1) / count

                    local t = lerp(note.Timing, note.EndTiming, p)
                    local et = lerp(note.Timing, note.EndTiming, np)

                    local x = note.GetXAt(p)
                    local y = note.GetYAt(p)

                    NoteEditor.AddArcNote(
                        t, et,
                        x, x,
                        ArcLineType.S,
                        y, y,
                        0,
                        note.IsTrace
                    )
                end
            end
        end
    end
)

Tool.Register(
    "RemoveArcsArcTapsToSingle(notes)",
    function (notes)
        for i = 0, notes.Count - 1 do
            local note = notes[i]
            if NoteEvent.IsArc(note) then

                local arctaps = note.GetArcTapNotes()
                if arctaps ~= nil then
                    for j = 0, arctaps.Count - 1 do
                        local at = arctaps[j]
    
                        local t = at.Timing
    
                        local x = note.GetXAtTiming(t)
                        local y = note.GetYAtTiming(t)
                        
                        NoteEditor.AddSingleArcTapNote(t, x, y)
                    end
                end
            end
        end
    end
)

local function getTypeName(n)
    if NoteEvent.IsArc(n) then
        return "Arc"
    elseif NoteEvent.IsTap(n) then
        return "Tap"
    elseif NoteEvent.IsHold(n) then
        return "Hold"
    elseif NoteEvent.IsArcTap(n) then
        return "ArcTap"
    end
end

local function getNotesString(t)
    local result = "{"
    for i = 1, #t do
        local n = t[i]
        result = result .. getTypeName(n) .. ": " .. n.Timing
        if i ~= #t then
            result = result .. ", "
        end
    end
    result = result .. "}"
    return result
end

Tool.Register(
    "ColorNote::LeftStartColors(notes)",
    function (notes)
        local targetNotes = filterColorIndexNotes(notes)
        local noteGroups = getNoteGroups(targetNotes)

        for i, group in pairs(noteGroups) do
            local color = 1 - i % 2
            if #group == 2 then
                group[1].ColorIndex = 0
                group[2].ColorIndex = 1
            else
                for j, note in pairs(group) do
                    note.ColorIndex = color
                end
            end
        end
    end
)

Tool.Register(
    "ColorNote::RightStartColors(notes)",
    function (notes)
        local targetNotes = filterColorIndexNotes(notes)
        local noteGroups = getNoteGroups(targetNotes)

        for i, group in pairs(noteGroups) do
            local color = i % 2
            if #group == 2 then
                group[1].ColorIndex = 0
                group[2].ColorIndex = 1
            else
                for _, note in pairs(group) do
                    note.ColorIndex = color
                end
            end
        end
    end
)

Tool.Register(
    "Jump(notes)",
    function (notes)
        if notes.Count == 0 then
            return
        end

        local bpm = NoteEditor.SelectTimingEvent(notes[0].Timing).Bpm

        local lastTapNote = nil

        for i = 0, notes.Count - 1 do
            local note = notes[i]
            if NoteEvent.IsTap(note) then
                if lastTapNote ~= nil then
                    NoteEditor.AddTimingEvent(lastTapNote.Timing, 0.01, 4)
                end
                lastTapNote = note
            end
        end

        lastTapNote = nil

        for i = 0, notes.Count - 1 do
            local note = notes[i]
            if NoteEvent.IsTap(note) then
                if lastTapNote ~= nil then
                    local distance = note.Timing - lastTapNote.Timing
                    NoteEditor.AddTimingEvent(note.Timing - 1, bpm * distance, 999)
                end
                lastTapNote = note
            end
        end

        if lastTapNote == nil then
            return
        end

        NoteEditor.AddTimingEvent(lastTapNote.Timing, bpm, 4)
    end
)

Tool.Register(
    "ToTriangles(notes)",
    function (notes)
        if notes.Count == 0 then
            return
        end
        NoteEditor.CreateTimingGroup()
        local bpm = NoteEditor.SelectTimingEvent(notes[0].Timing).Bpm
        for i = 0, notes.Count - 1 do
            local note = notes[i]
            if NoteEvent.IsLaneNote(note) then
                local position = ternary(note.IsFloatLane, note.Lane, note.Track)
                if (note.IsFloatLane) then
                    position = position / 2
                else
                    position = -0.75 + position * 0.5
                end
                generateTriangle(note.Timing, position, bpm)
            end
        end
    end
)

Tool.Register(
    "切割Arc: 波浪",
    function (notes)
        if notes.Count ~= 2 then
            return
        end

        local note1 = notes[0]
        local note2 = notes[1]

        if not NoteEvent.IsArc(note1) or not NoteEvent.IsArc(note2) then
            return
        end

        if note1.Color > note2.Color then
            local temp = note1
            note1 = note2
            note2 = temp
        end

        local interval = NoteEditor.GetIntervalOfBeatlineAtTiming(note1.Timing, note1.GroupID)
        local duration = round(math.max(note1.EndTiming - note1.Timing, note2.EndTiming - note2.Timing))
        local count = round(duration / interval)

        for j = 0, count - 1 do
            local p = j / count
            local np = (j + 1) / count

            local arc = ternary(j % 2 == 0, note1, note2)
            local nextArc = ternary(j % 2 == 0, note2, note1)

            local t = round(arc.Timing + j * interval)
            local et = round(arc.Timing + (j + 1) * interval)

            local currX = arc.GetXAt(p)
            local currY = arc.GetYAt(p)
            local nextX = nextArc.GetXAt(np)
            local nextY = nextArc.GetYAt(np)

            NoteEditor.AddArcNote(t, et, currX, nextX, ArcLineType.S, currY, nextY, arc.Color, arc.IsTrace)
        end
    end
)

Tool.Register(
    "Note2Trace(notes)",
    function (notes)
        for i = 0, #notes - 1 do
            buildModelInternal(notes[i])
        end
    end
)

local arrowEditing = NoteEditor.CreateEditing(
    function (args)
        local function AddArcNote(t, p, ep, d)
            if d == nil then
                d = 0
            end
            local arc = NoteEditor.AddArcNote(t, t + d, p.X, ep.X, ArcLineType.S, p.Y, ep.Y, 0, false)
            arc.GroupID = NoteEditor.GetCurrentTimingGroup().ID
        end

        local lastGroupId = NoteEditor.GetCurrentTimingGroup().ID

        local time = args[1]
        local pos = args[2]
        local endPos = args[3]

        local width = pos.X - endPos.X
        local topOffset = -.105
        if width > 0 then
            topOffset = 0.105
        end
        local globalOffset = -0.1
        if width > 0 then
            globalOffset = 0.1
        end
        pos = endPos
        local topStart = pos + Data.Vec2(topOffset - globalOffset, 0.1)
        local topEnd = pos + Data.Vec2(width + topOffset - globalOffset, 0.1)
        local bottomStart = pos + Data.Vec2(0 - globalOffset, -0.1)
        local bottomEnd = pos + Data.Vec2(width - globalOffset, -0.1)

        AddArcNote(time, topEnd, topStart)
        AddArcNote(time, bottomStart, bottomEnd)

        NoteEditor.CreateTimingGroup()
        local group = NoteEditor.GetCurrentTimingGroup()
        group.NoInput = true
        NoteEditor.AddInternalSceneControl(0, ScenecontrolType.HideGroup, 0.0, 1)
        AddArcNote(time - 1, topEnd, topEnd, 1)
        AddArcNote(time - 1, bottomStart, bottomStart, 1)

        NoteEditor.SelectTimingGroup(lastGroupId)
    end
)
arrowEditing.AddSelectTimingCommand("Time")
arrowEditing.AddSelectPositionCommand("Position")
arrowEditing.AddSelectPositionCommand("Width")
Tool.Register(
    "NCat::CreateArrow(time, position, width)",
    arrowEditing
)

Tool.Register(
    "分离: ArcTap",
    function (notes)
        for i = 0, notes.Count - 1, 1 do
            local note = NoteEvent.CastToArcNote(notes[i])
            if note ~= nil then
                local arctaps = note.GetArcTapTimings()
                for j = 0, arctaps.Count - 1, 1 do
                    local arctap = arctaps[j]
                    local x = note.GetXAtTiming(arctap)
                    local y = note.GetYAtTiming(arctap)
                    NoteEditor.AddSingleArcTapNote(arctap, x, y)
                end
                arctaps = note.GetArcTapNotes()
                for j = 0, arctaps.Count - 1, 1 do
                    local arctap = arctaps[j]
                    NoteEditor.RemoveEvent(arctap)
                end
            end
        end
    end
)

Tool.Register(
    "分离: ArcTap -> Tap",
    function (notes)
        for i = 0, notes.Count - 1, 1 do
            local note = NoteEvent.CastToArcNote(notes[i])
            if note ~= nil then
                local arctaps = note.GetArcTapTimings()
                for j = 0, arctaps.Count - 1, 1 do
                    local arctap = arctaps[j]
                    local x = note.GetXAtTiming(arctap)
                    local lane = arcX2Lane(x)
                    NoteEditor.AddTapNoteFloat(arctap, lane)
                end
                arctaps = note.GetArcTapNotes()
                for j = 0, arctaps.Count - 1, 1 do
                    local arctap = arctaps[j]
                    NoteEditor.RemoveEvent(arctap)
                end
            end
        end
    end
)

Tool.Register(
    "分离: ArcTap -> ArcTap + Tap",
    function (notes)
        for i = 0, notes.Count - 1, 1 do
            local note = NoteEvent.CastToArcNote(notes[i])
            if note ~= nil then
                local arctaps = note.GetArcTapTimings()
                for j = 0, arctaps.Count - 1, 1 do
                    local arctap = arctaps[j]
                    local x = note.GetXAtTiming(arctap)
                    if j == 0 then
                        local y = note.GetYAtTiming(arctap)
                        NoteEditor.AddSingleArcTapNote(arctap, x, y)
                    else
                        local lane = arcX2Lane(x)
                        NoteEditor.AddTapNoteFloat(arctap, lane)
                    end
                end
                arctaps = note.GetArcTapNotes()
                for j = 0, arctaps.Count - 1, 1 do
                    local arctap = arctaps[j]
                    NoteEditor.RemoveEvent(arctap)
                end
            end
        end
    end
)
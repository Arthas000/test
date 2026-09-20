-- NCat

local function condSel(cond, a, b)
    if cond then
        return a
    end
    return b
end

local function laneX2Arc(x, isFloatLane)
    if isFloatLane then
        return 0.5 * x + 0.25
    end
    return -0.75 + 0.5 * x
end

local SHADOW_HEIGHT = 5
local HAS_LENGTH = false

local shadowIndicatorGroupIndex = -1
local shadowGroupIndex = -1

local addedHeight = 0

local function processNote(note)
    NoteEditor.SelectTimingGroup(shadowGroupIndex)
    addedHeight = addedHeight + 0.1
    local height = SHADOW_HEIGHT + addedHeight
    local time = math.max(0, condSel(HAS_LENGTH, note.Timing - 5000, note.Timing - 1))
    if NoteEvent.IsTap(note) then
        -- note = LuaTapNote
        local pos = condSel(note.IsFloatLane, note.Lane, note.Track)
        pos = laneX2Arc(pos, note.IsFloatLane)
        local left = pos - 0.115
        local right = left + .445
        NoteEditor.AddArcNote(note.Timing, note.Timing, left, right, ArcLineType.S, height, height, 0, false)

        NoteEditor.SelectTimingGroup(shadowIndicatorGroupIndex)
        NoteEditor.AddArcNote(time, note.Timing, -10, left, ArcLineType.S, height, height, 0, false)
    elseif NoteEvent.IsHold(note) then
        -- note = LuaHoldNote
        local pos = condSel(note.IsFloatLane, note.Lane, note.Track)
        pos = laneX2Arc(pos, note.IsFloatLane)

        local left = pos - .115
        local right = pos + .115

        NoteEditor.AddArcNote(note.Timing, note.EndTiming, left, left, ArcLineType.S, height, height, 0, false)
        NoteEditor.AddArcNote(note.Timing, note.EndTiming, right, right, ArcLineType.S, height, height, 0, false)

        NoteEditor.SelectTimingGroup(shadowIndicatorGroupIndex)
        NoteEditor.AddArcNote(time, note.Timing, -10, left, ArcLineType.S, height, height, 0, false)
        NoteEditor.AddArcNote(time, note.Timing, -10, right, ArcLineType.S, height, height, 0, false)
    elseif NoteEvent.IsArc(note) then
        -- note = LuaArcNote
        local arc = NoteEditor.AddArcNote(note.Timing, note.EndTiming, note.StartPosition.X, note.EndPosition.X, note.LineTypeString, height, height, 0, note.IsTrace)
        if note.IsTrace == false then
            NoteEditor.SelectTimingGroup(shadowIndicatorGroupIndex)
            NoteEditor.AddArcNote(time, note.Timing, -10, note.StartPosition.X, ArcLineType.S, height, height, 0, false)
        end
        local arctapTimes = note.GetArcTapTimings()
        -- Dialog.Show("Debug", string.format("%d", arctapTimes.Count), "OK")
        if arctapTimes.Count ~= 0 then
            for i = 0, arctapTimes.Count - 1 do
                local t = arctapTimes[i]
                addedHeight = addedHeight + 0.1
                height = SHADOW_HEIGHT + addedHeight
                local pos = note.GetXAtTiming(t)
                local left = pos - 0.145
                local right = left + .5
                NoteEditor.SelectTimingGroup(shadowGroupIndex)
                NoteEditor.AddArcNote(t, t, left, right, ArcLineType.S, height, height, 0, false)
                NoteEditor.SelectTimingGroup(shadowIndicatorGroupIndex)
                NoteEditor.AddArcNote(math.max(condSel(HAS_LENGTH, t - 5000, t - 1), 0), t, -10, left, ArcLineType.S, height, height, 0, false)
            end
        end
    end
end

Tool.Register(
    "Shadow Maker",
    function (notes)
        NoteEditor.CreateTimingGroup()
        NoteEditor.GetLastTimingGroup().NoInput = true
        shadowGroupIndex = NoteEditor.GetLastTimingGroup().ID

        NoteEditor.CreateTimingGroup()
        NoteEditor.GetLastTimingGroup().NoInput = true
        NoteEditor.AddInternalSceneControl(0, ScenecontrolType.HideGroup, 0.0, 1)
        shadowIndicatorGroupIndex = NoteEditor.GetLastTimingGroup().ID

        for i = 0, notes.Count - 1, 1 do
            local note = notes[i]
            processNote(note)
        end
    end
)
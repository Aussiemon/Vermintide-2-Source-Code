-- chunkname: @scripts/entity_system/systems/dialogues/dialogue_state_handler.lua

local MAX_DIALOGUE_CHECKS_PER_FRAME = 10

DialogueStateHandler = class(DialogueStateHandler)
DialogueStateHandler.debug = true

local function debug_printf(...)
	if DialogueStateHandler.debug then
		print("[DialogueStateHandler] " .. string.format(...))
	end
end

DialogueStateHandler.init = function (self, world)
	self._world = world
	self._playing_dialogues = {}
	self._current_index = 1
end

DialogueStateHandler.add_playing_dialogue = function (self, identifier, event_id, t, dialogue_duration)
	self._playing_dialogues[#self._playing_dialogues + 1] = {
		identifier = identifier,
		event_id = event_id,
		start_time = t,
		expected_end = t + dialogue_duration,
	}
end

local DIALOGUES_TO_REMOVE = {}

DialogueStateHandler.update = function (self, t)
	if table.is_empty(self._playing_dialogues) then
		return
	end

	table.clear(DIALOGUES_TO_REMOVE)

	local num_checks = 0
	local start_index = self._current_index
	local level = LevelHelper:current_level(self._world)

	repeat
		local dialogue_data = self._playing_dialogues[self._current_index]

		if t > dialogue_data.expected_end then
			Level.set_flow_variable(level, "dialogue_identifier", dialogue_data.identifier)
			Level.trigger_event(level, "dialogue_ended")

			DIALOGUES_TO_REMOVE[#DIALOGUES_TO_REMOVE + 1] = self._current_index

			debug_printf("Triggering %s after %.2fs", dialogue_data.identifier, t - dialogue_data.start_time)
		end

		self._current_index = math.index_wrapper(self._current_index + 1, #self._playing_dialogues)
		num_checks = num_checks + 1
	until self._current_index == start_index or num_checks >= MAX_DIALOGUE_CHECKS_PER_FRAME

	if not table.is_empty(DIALOGUES_TO_REMOVE) then
		table.sort(DIALOGUES_TO_REMOVE)

		for i = #DIALOGUES_TO_REMOVE, 1, -1 do
			local index = DIALOGUES_TO_REMOVE[i]

			table.remove(self._playing_dialogues, index)
		end
	end
end

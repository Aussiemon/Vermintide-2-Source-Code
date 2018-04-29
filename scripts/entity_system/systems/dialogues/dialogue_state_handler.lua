local MAX_DIALOGUE_CHECKS_PER_FRAME = 10
DialogueStateHandler = class(DialogueStateHandler)
DialogueStateHandler.debug = true

local function debug_printf(...)
	if DialogueStateHandler.debug then
		print("[DialogueStateHandler] " .. string.format(...))
	end

	return 
end

DialogueStateHandler.init = function (self, world, wwise_world)
	self._world = world
	self._wwise_world = wwise_world
	self._playing_dialogues = {}
	self._current_index = 1

	return 
end
DialogueStateHandler.add_playing_dialogue = function (self, identifier, event_id, t)
	self._playing_dialogues[#self._playing_dialogues + 1] = {
		identifier = identifier,
		event_id = event_id,
		start_time = t
	}

	return 
end
local DIALOGUES_TO_REMOVE = {}
DialogueStateHandler.update = function (self, t)
	if #self._playing_dialogues == 0 then
		return 
	end

	table.clear(DIALOGUES_TO_REMOVE)

	local num_checks = 0
	local start_index = self._current_index
	local level = LevelHelper:current_level(self._world)

	while true do
		local dialogue_data = self._playing_dialogues[self._current_index]
		local event_id = dialogue_data.event_id

		if not WwiseWorld.is_playing(self._wwise_world, event_id) then
			Level.set_flow_variable(level, "dialogue_identifier", dialogue_data.identifier)
			Level.trigger_event(level, "dialogue_ended")

			DIALOGUES_TO_REMOVE[#DIALOGUES_TO_REMOVE + 1] = self._current_index

			debug_printf("Triggering %s after %.2fs", dialogue_data.identifier, t - dialogue_data.start_time)
		end

		self._current_index = 1 + self._current_index % #self._playing_dialogues
		num_checks = num_checks + 1

		if self._current_index == start_index or MAX_DIALOGUE_CHECKS_PER_FRAME <= num_checks then
			break
		end
	end

	if 0 < #DIALOGUES_TO_REMOVE then
		table.sort(DIALOGUES_TO_REMOVE)

		for i = #DIALOGUES_TO_REMOVE, 1, -1 do
			local index = DIALOGUES_TO_REMOVE[i]

			table.remove(self._playing_dialogues, index)
		end
	end

	return 
end

return 

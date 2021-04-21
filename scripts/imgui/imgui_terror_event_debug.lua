ImguiTerrorEventDebug = class(ImguiTerrorEventDebug)
local difficulties = {
	"normal",
	"hard",
	"harder",
	"hardest",
	"cataclysm"
}
local difficulty_tweaks = {}

for i = -DifficultyTweak.range, DifficultyTweak.range, 1 do
	difficulty_tweaks[#difficulty_tweaks + 1] = i
end

local function get_current_level()
	if not Managers.state.game_mode then
		return
	end

	local level_transition_handler = Managers.level_transition_handler
	local level_key = level_transition_handler:get_current_level_keys()

	return level_key
end

ImguiTerrorEventDebug.init = function (self)
	self._level_specific_index = 1
	self._generic_index = 1
	self._difficulty_tweak_index = 1
	self._difficulty_index = 1
	self._generic_terror_events = {}

	for name, _ in pairs(GenericTerrorEvents) do
		self._generic_terror_events[#self._generic_terror_events + 1] = name
	end

	table.sort(self._generic_terror_events)
end

ImguiTerrorEventDebug.update = function (self)
	return
end

ImguiTerrorEventDebug.is_persistent = function (self)
	return true
end

ImguiTerrorEventDebug.draw = function (self, is_open)
	Imgui.begin_window("TerrorEventDebug", "always_auto_resize")

	local current_level = get_current_level()

	if current_level ~= self._current_level then
		self._level_specific_terror_events = {}
		local blueprints = TerrorEventBlueprints[current_level]

		if blueprints then
			for name, _ in pairs(blueprints) do
				self._level_specific_terror_events[#self._level_specific_terror_events + 1] = name
			end
		end

		table.sort(self._level_specific_terror_events)

		self._level_specific_index = 1
		self._current_level = current_level
		self._seed = Managers.mechanism:get_level_seed() or 0
	end

	self._seed = Imgui.input_int("seed", self._seed)

	Imgui.spacing()
	Imgui.spacing()
	Imgui.spacing()
	Imgui.spacing()

	self._difficulty_index = Imgui.combo("Difficulty", self._difficulty_index, difficulties)
	self._difficulty_tweak_index = Imgui.combo("Difficulty Tweak", self._difficulty_tweak_index, difficulty_tweaks)

	Imgui.spacing()
	Imgui.spacing()
	Imgui.spacing()
	Imgui.spacing()

	self._level_specific_index = Imgui.combo("Level Specific Terror Event", self._level_specific_index, self._level_specific_terror_events)

	if Imgui.button("Start Level Specific Terror Event") and Managers.state.conflict then
		script_data.terror_event_difficulty = difficulties[self._difficulty_index]
		script_data.terror_event_difficulty_tweak = difficulty_tweaks[self._difficulty_tweak_index]

		Managers.state.conflict:start_terror_event(self._level_specific_terror_events[self._level_specific_index], self._seed)
	end

	Imgui.spacing()
	Imgui.spacing()
	Imgui.spacing()
	Imgui.spacing()

	self._generic_index = Imgui.combo("Generic Terror Event", self._generic_index, self._generic_terror_events)

	if Imgui.button("Start Generic Terror Event") and Managers.state.conflict then
		script_data.terror_event_difficulty = difficulties[self._difficulty_index]
		script_data.terror_event_difficulty_tweak = difficulty_tweaks[self._difficulty_tweak_index]

		Managers.state.conflict:start_terror_event(self._generic_terror_events[self._generic_index], self._seed)
	end

	Imgui.spacing()
	Imgui.spacing()
	Imgui.spacing()
	Imgui.spacing()

	script_data.debug_terror = Imgui.checkbox("Terror Event Debugging On", script_data.debug_terror or false)
	local conflict_director = Managers.state.conflict

	if conflict_director then
		if conflict_director.pacing:get_state() ~= "pacing_frozen" then
			if Imgui.button("Disable Normal Spawning") then
				conflict_director.pacing:disable()
			end
		elseif Imgui.button("Enable Normal Spawning") then
			conflict_director.pacing:enable()
		end

		if Imgui.button("Kill All Enemies") then
			conflict_director:destroy_all_units(true)
		end
	end

	if Imgui.button("Stop active terror events") and (Managers.player.is_server or LEVEL_EDITOR_TEST) then
		local events = TerrorEventMixer.active_events

		for _, event in ipairs(events) do
			TerrorEventMixer.stop_event(event.name)
		end
	end

	Imgui.end_window()
end

return

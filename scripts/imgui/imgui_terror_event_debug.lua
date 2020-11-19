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

	local level_transition_handler = Managers.state.game_mode.level_transition_handler
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
	Imgui.Begin("TerrorEventDebug", "always_auto_resize")

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

	self._seed = Imgui.InputInt("seed", self._seed)

	Imgui.Spacing()
	Imgui.Spacing()
	Imgui.Spacing()
	Imgui.Spacing()

	self._difficulty_index = Imgui.Combo("Difficulty", self._difficulty_index - 1, difficulties)
	self._difficulty_tweak_index = Imgui.Combo("Difficulty Tweak", self._difficulty_tweak_index - 1, difficulty_tweaks)

	Imgui.Spacing()
	Imgui.Spacing()
	Imgui.Spacing()
	Imgui.Spacing()

	self._level_specific_index = Imgui.Combo("Level Specific Terror Event", self._level_specific_index - 1, self._level_specific_terror_events)

	if Imgui.Button("Start Level Specific Terror Event") and Managers.state.conflict then
		script_data.terror_event_difficulty = difficulties[self._difficulty_index]
		script_data.terror_event_difficulty_tweak = difficulty_tweaks[self._difficulty_tweak_index]

		Managers.state.conflict:start_terror_event(self._level_specific_terror_events[self._level_specific_index], self._seed)
	end

	Imgui.Spacing()
	Imgui.Spacing()
	Imgui.Spacing()
	Imgui.Spacing()

	self._generic_index = Imgui.Combo("Generic Terror Event", self._generic_index - 1, self._generic_terror_events)

	if Imgui.Button("Start Generic Terror Event") and Managers.state.conflict then
		script_data.terror_event_difficulty = difficulties[self._difficulty_index]
		script_data.terror_event_difficulty_tweak = difficulty_tweaks[self._difficulty_tweak_index]

		Managers.state.conflict:start_terror_event(self._generic_terror_events[self._generic_index], self._seed)
	end

	Imgui.Spacing()
	Imgui.Spacing()
	Imgui.Spacing()
	Imgui.Spacing()

	script_data.debug_terror = Imgui.Checkbox("Terror Event Debugging On", script_data.debug_terror or false)
	local conflict_director = Managers.state.conflict

	if conflict_director then
		if conflict_director.pacing:get_state() ~= "pacing_frozen" then
			if Imgui.Button("Disable Normal Spawning") then
				conflict_director.pacing:disable()
			end
		elseif Imgui.Button("Enable Normal Spawning") then
			conflict_director.pacing:enable()
		end

		if Imgui.Button("Kill All Enemies") then
			conflict_director:destroy_all_units(true)
		end
	end

	Imgui.End()
end

return

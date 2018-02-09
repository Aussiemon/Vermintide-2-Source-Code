ScriptPresence = class(ScriptPresence)
PRESENCE_LUT = {
	playing = "update_playing",
	inn = "update_inn",
	menu = "update_menu",
	none = "update_none"
}
ScriptPresence.PRESENCE_UPDATE_TIME = 5
ScriptPresence.USE_ASYNC = true
ScriptPresence.init = function (self)
	self._presence_func = "update_menu"
	self._current_presence_data = {}
	self._current_presence_set = false
	self._presence_update_timer = 0

	return 
end
ScriptPresence.set_presence = function (self, presence)
	if PRESENCE_LUT[presence] then
		self._presence_func = PRESENCE_LUT[presence]
		self._current_presence_set = nil
		self._current_presence_data = {}
	else
		Application.warning(string.format("[ScriptPresence] Trying to set presence '%s' which doesn't exist", presence))
	end

	return 
end
ScriptPresence.update = function (self, dt)
	if Managers.account:user_detached() then
		return 
	end

	self._presence_update_timer = (self._presence_update_timer or 0) - dt

	if self._presence_update_timer < 0 then
		local user_id = Managers.account:user_id()

		self[self._presence_func](self, user_id)

		self._presence_update_timer = ScriptPresence.PRESENCE_UPDATE_TIME
	end

	return 
end
ScriptPresence.update_none = function (self, user_id)
	Profiler.start("[Presence] update_none")

	local presence_name = ""

	if self._current_presence_set ~= presence_name then
		self._set_presence(self, user_id, presence_name)

		self._current_presence_set = presence_name
	end

	Profiler.stop("[Presence] update_none")

	return 
end
ScriptPresence.update_menu = function (self, user_id)
	Profiler.start("[Presence] update_menu")

	local presence_name = "InnMenus"

	if self._current_presence_set ~= presence_name then
		self._set_presence(self, user_id, presence_name)

		self._current_presence_set = presence_name
	end

	Profiler.stop("[Presence] update_menu")

	return 
end
ScriptPresence.update_playing = function (self, user_id)
	Profiler.start("[Presence] update_playing")

	local current_level = Managers.state.game_mode and Managers.state.game_mode:level_key()
	local current_difficulty = Managers.state.difficulty and Managers.state.difficulty:get_difficulty()
	local current_num_players = Managers.player and Managers.player:num_human_players()

	Profiler.start("[Presence] Extracting data")

	local data = self._extract_stat_data(self, current_level, current_difficulty, current_num_players)

	Profiler.stop("[Presence] Extracting data")

	if not current_level or not current_difficulty or not current_num_players then
		self.set_presence(self, "menu")
	else
		local presence_name = ""

		if self._has_new_data(self, data) then
			if current_level == "inn_level" then
				presence_name = "Inn"
			elseif current_level == "tutorial" then
				presence_name = "Tutorial"
			elseif current_num_players == 4 then
				presence_name = "Playing"
			else
				presence_name = "NeedsAssistance"
			end

			Profiler.start("[Presence] setup data and set presence")
			self._setup_stat_data(self, data)
			self._set_presence(self, user_id, presence_name)

			self._current_presence_set = presence_name

			Profiler.stop("[Presence] setup data and set presence")
		end
	end

	Profiler.stop("[Presence] update_playing")

	return 
end
CURRENT_DIFFICULTY = "easy"
CURRENT_LEVEL = "magnus"
ScriptPresence._extract_stat_data = function (self, current_level, current_difficulty, current_num_players)
	local data = {}

	if current_level then
		local level_settings = LevelSettings[current_level]

		if level_settings then
			current_level = level_settings.display_name
		else
			current_level = nil
		end
	end

	if current_difficulty then
		local difficulty_settings = DifficultySettings[current_difficulty]

		if difficulty_settings then
			current_difficulty = difficulty_settings.display_name
		else
			current_difficulty = nil
		end
	end

	if current_num_players then
		current_num_players = string.format("(%s/4)", current_num_players)
	else
		current_difficulty = nil
	end

	data.CurrentNumPlayers = current_num_players or ""
	data.CurrentMap = current_level or ""
	data.CurrentDifficulty = current_difficulty or ""

	return data
end
ScriptPresence._has_new_data = function (self, data)
	local has_new_data = false

	for key, value in pairs(data) do
		if self._current_presence_data[key] ~= value then
			has_new_data = true

			break
		end
	end

	return has_new_data
end
ScriptPresence._setup_stat_data = function (self, data)
	self._current_presence_data = data

	for name, value in pairs(data) do
		print(string.format("### Presence stat update: %s - %s", name, value))
		Managers.xbox_events:write(name, {
			Managers.account:xbox_user_id(),
			Managers.account:player_session_id(),
			value
		})
	end

	return 
end
ScriptPresence.destroy = function (self)
	local user_id = Managers.account and Managers.account:user_id()

	if user_id then
		self._set_presence(self, user_id, "")
	end

	return 
end
ScriptPresence._set_presence = function (self, user_id, presence_string)
	if ScriptPresence.USE_ASYNC then
		print("##### Presence:", presence_string)
		Presence.set_async(user_id, presence_string)
	else
		Presence.set(user_id, presence_string)
	end

	return 
end
ScriptPresence.cb_async_presence_set = function (self, info)
	local str = "Presence set: "

	if info.error_code then
		str = str .. "ERROR (" .. tostring(info.error_code) .. ")"
	else
		str = str .. "SUCCESS"
	end

	return 
end

return 

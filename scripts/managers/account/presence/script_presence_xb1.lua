ScriptPresence = class(ScriptPresence)
PRESENCE_LUT = {
	playing = "update_playing",
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
end

ScriptPresence.set_presence = function (self, presence)
	if PRESENCE_LUT[presence] then
		self._presence_func = PRESENCE_LUT[presence]
		self._current_presence_set = nil
		self._current_presence_data = {}
	else
		Application.warning(string.format("[ScriptPresence] Trying to set presence '%s' which doesn't exist", presence))
	end
end

ScriptPresence.update = function (self, dt)
	local account_manager = Managers.account

	if account_manager:user_detached() or not account_manager:is_online() then
		return
	end

	self._presence_update_timer = (self._presence_update_timer or 0) - dt

	if self._presence_update_timer < 0 then
		local user_id = account_manager:user_id()

		self[self._presence_func](self, user_id)

		self._presence_update_timer = ScriptPresence.PRESENCE_UPDATE_TIME
	end
end

ScriptPresence.update_none = function (self, user_id)
	Profiler.start("[Presence] update_none")

	local presence_name = ""

	if self._current_presence_set ~= presence_name then
		self:_set_presence(user_id, presence_name)

		self._current_presence_set = presence_name
	end

	Profiler.stop("[Presence] update_none")
end

ScriptPresence.update_menu = function (self, user_id)
	Profiler.start("[Presence] update_menu")

	local presence_name = "in_menus"

	if self._current_presence_set ~= presence_name then
		self:_set_presence(user_id, presence_name)

		self._current_presence_set = presence_name
	end

	Profiler.stop("[Presence] update_menu")
end

local ACTIVE_PRESENCE_DATA = {}

ScriptPresence.update_playing = function (self, user_id)
	Profiler.start("[Presence] update_playing")

	local current_level = Managers.state.game_mode and Managers.state.game_mode:level_key()
	local current_difficulty = Managers.state.difficulty and Managers.state.difficulty:get_difficulty()
	local current_num_players = Managers.player and Managers.player:num_human_players()
	local is_private = Managers.matchmaking and Managers.matchmaking:is_game_private()

	if not current_level or not current_difficulty or not current_num_players then
		self:set_presence("menu")
	else
		local prefix = ""

		if self:_has_new_data(current_level, current_difficulty, current_num_players, is_private) then
			if current_num_players == 4 or is_private then
				prefix = "playing"
			else
				prefix = "needs_assistance"
			end

			Profiler.start("[Presence] setup data and set presence")
			self:_setup_stat_data(current_level, current_difficulty, current_num_players)

			local presence_string = prefix .. "_" .. current_level .. "_" .. current_difficulty

			self:_set_presence(user_id, presence_string)

			self._current_presence_set = presence_string

			Profiler.stop("[Presence] setup data and set presence")
		end
	end

	Profiler.stop("[Presence] update_playing")
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

ScriptPresence._has_new_data = function (self, current_level, current_difficulty, current_num_players, is_private)
	if ACTIVE_PRESENCE_DATA.current_level ~= current_level then
		return true
	elseif ACTIVE_PRESENCE_DATA.current_difficulty ~= current_difficulty then
		return true
	elseif ACTIVE_PRESENCE_DATA.current_num_players ~= current_num_players then
		return true
	elseif ACTIVE_PRESENCE_DATA.is_private ~= is_private then
		return true
	end

	return false
end

ScriptPresence._setup_stat_data = function (self, current_level, current_difficulty, current_num_players, is_private)
	ACTIVE_PRESENCE_DATA.current_level = current_level
	ACTIVE_PRESENCE_DATA.current_difficulty = current_difficulty
	ACTIVE_PRESENCE_DATA.current_num_players = current_num_players
	ACTIVE_PRESENCE_DATA.is_private = is_private
end

ScriptPresence.destroy = function (self)
	local account_manager = Managers.account

	if account_manager then
		local user_id = account_manager:user_id()
		local is_online = account_manager:is_online()

		if user_id and is_online then
			self:_set_presence(user_id, "")
		end
	end
end

ScriptPresence._set_presence = function (self, user_id, presence_string)
	if self._current_presence_set == presence_string then
		return
	end

	if ScriptPresence.USE_ASYNC then
		print("##### Presence:", presence_string)
		Presence.set_async(user_id, presence_string)
	else
		Presence.set(user_id, presence_string)
	end
end

ScriptPresence.cb_async_presence_set = function (self, info)
	local str = "Presence set: "

	if info.error_code then
		str = str .. "ERROR (" .. tostring(info.error_code) .. ")"
	else
		str = str .. "SUCCESS"
	end
end

return

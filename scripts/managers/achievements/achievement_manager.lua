-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
require("scripts/settings/level_unlock_settings")
require("scripts/managers/achievements/achievement_templates")

local platform_functions = {
	debug_platform = {
		check_version_number = function ()
			local token = Application.time_since_launch() + 1 + math.random()*2

			return false, token
		end,
		version_progress = function (token)
			local time = Application.time_since_launch()

			return token < time
		end,
		is_unlocked = function (template)
			return false
		end,
		unlock = function (platform_id, template)
			print("[AchivementDebug] Unlocked:", template.name)

			local token = Application.time_since_launch() + 1 + math.random()*2

			return token
		end,
		progress = function (token)
			local time = Application.time_since_launch()

			return token < time
		end,
		reset = function ()
			return 
		end
	},
	steam = {
		check_version_number = function ()
			return true
		end,
		version_progress = function (token)
			local result = Stats.progress(token)

			if result.done then
				return true, result.error
			end

			return 
		end,
		is_unlocked = function (template)
			local unlocked, error_msg = Achievement.unlocked(template.name)

			return unlocked, error_msg
		end,
		unlock = function (platform_id, template)
			local token, error_msg = Achievement.unlock(template.name)

			return token, error_msg
		end,
		progress = function (token)
			local result = Achievement.progress(token)

			if result.done then
				return true, result.error
			end

			return 
		end,
		reset = function ()
			Achievement.reset()

			return 
		end
	},
	ps4 = {
		check_version_number = function ()
			return true
		end,
		version_progress = function (token)
			return true
		end,
		is_unlocked = function (template)
			return not template.ID_PS4
		end,
		unlock = function (player_id, template)
			assert(template.ID_PS4, "[AchievementManager] There is no Trophy ID specified for achievement: " .. template.name)

			local token = Trophies.unlock(Managers.account:initial_user_id(), template.ID_PS4)

			return token
		end,
		progress = function (token)
			local result = Trophies.status(token)

			if result == Trophies.STARTED then
				return false
			end

			Trophies.free(token)

			if result == Trophies.COMPLETED then
				return true
			elseif result == Trophies.ERROR then
				return true, "error"
			elseif result == Trophies.UNKNOWN then
				return true, "unknown"
			end

			return 
		end,
		reset = function ()
			errorf("Tried to reset Trophies, not implemented!")

			return 
		end
	},
	xb1 = {
		check_version_number = function ()
			return true
		end,
		version_progress = function (token)
			return true
		end,
		is_unlocked = function (template)
			return not template.ID_XB1
		end,
		unlock = function (player_id, template)
			if not rawget(_G, "XB1Achievements") or Achievements.is_refreshing(XB1Achievements) then
				return 
			end

			assert(template.ID_XB1, "[AchievementManager] There is no Achievement ID specified for achievement: " .. template.name)
			print("[AchievementManager] Unlocking Achievement: ", template.ID_XB1)
			Managers.xbox_events:write(template.ID_XB1, {
				Managers.account:xbox_user_id(),
				Managers.account:player_session_id(),
				1
			}, nil, nil, nil, true)

			local token = Application.time_since_launch() + 5

			Managers.account:set_achievement_unlocked(template.name)

			return token
		end,
		progress = function (token)
			local time = Application.time_since_launch()

			return token < time and not Achievements.is_refreshing(XB1Achievements)
		end,
		reset = function ()
			errorf("Tried to reset Achievements, not implemented!")

			return 
		end
	}
}
AchievementManager = class(AchievementManager)
AchievementManager.init = function (self, world, statistics_db)
	self.world = world
	self.statistics_db = statistics_db
	self.in_progress = {}
	self.hero_stat_table = {}

	if PLATFORM == "xb1" then
		self.completed_achievements = Managers.account:get_unlocked_achievement_list()
	else
		self.completed_achievements = {}
	end

	self.next_achievement_to_process_index = 1
	self.initialized_achievements = false
	local platform = PLATFORM
	local use_debug_platform = Development.parameter("achievement_debug_platform")

	if platform == "win32" or platform == "win64" then
		if rawget(_G, "Steam") and GameSettingsDevelopment.network_mode == "steam" then
			self.platform = "steam"
		else
			use_debug_platform = true
		end
	elseif platform == "ps4" then
		self.platform = "ps4"
	elseif platform == "xb1" then
		if not rawget(_G, "XB1Achievements") then
			if Managers.account:user_detached() then
				self._xbox_achievements_initialized = false
			else
				self._initialize_xbox_achivements(self)
			end
		end

		self.platform = "xb1"
	else
		use_debug_platform = true
	end

	if use_debug_platform then
		print("[AchievementManager] Achievements using debug platform")

		self.platform = "debug_platform"
	end

	self._enabled = false

	Managers.state.event:register(self, "event_enable_achievements", "event_enable_achievements")

	return 
end
AchievementManager.event_enable_achievements = function (self, enable)
	return 
end
AchievementManager._initialize_xbox_achivements = function (self)
	local setup_data = require("scripts/settings/events_xb1")

	Events.setup(setup_data)
	rawset(_G, "XB1Achievements", Achievements(Managers.account:user_id()))
	Achievements.refresh(XB1Achievements)

	self._xbox_achievements_initialized = true

	return 
end
AchievementManager.destroy = function (self)
	if self.gui then
		World.destroy_gui(self.world, self.gui)

		self.gui = nil
	end

	return 
end
local ACHIEVEMENTS_PER_FRAME = 1
local AchievementTemplates = (PLATFORM == "win32" and AchievementTemplates) or {}
local AchievementTemplates_n = (PLATFORM == "win32" and AchievementTemplates_n) or 0
AchievementManager.update = function (self, dt)
	if self.error_timeout then
		self.error_timeout = self.error_timeout - dt

		if self.error_timeout < 0 then
			self.error_timeout = nil
		end

		return 
	end

	if PLATFORM ~= "win32" then
		if not self._sent_warning then
			Application.warning("[AchievementManager] Achievements not yet implemented")

			self._sent_warning = true
		end

		return 
	end

	if not self._enabled then
		return 
	end

	if self.platform == "xb1" and not self._xbox_achievements_initialized then
		if not Managers.account:user_detached() then
			self._initialize_xbox_achivements(self)
		end

		return 
	end

	local player_manager = Managers.player
	local player = player_manager.local_player(player_manager)

	if player ~= nil then
		local statistics_db = self.statistics_db
		local achievements = AchievementTemplates
		local achievements_n = AchievementTemplates_n
		local in_progress = self.in_progress
		local completed_achievements = self.completed_achievements
		local platform = self.platform
		local platform_functions = platform_functions[platform]
		local platform_id = player.platform_id(player)
		local stats_id = player.stats_id(player)

		self.debug_draw(self)

		if not self.checked_version_number then
			if not self.version_token then
				local ok, token = platform_functions.check_version_number()

				if ok then
					self.checked_version_number = true
				else
					self.version_token = token

					return 
				end
			else
				local done, error_msg = platform_functions.version_progress(self.version_token)

				if done then
					self.version_token = nil

					if error_msg then
						print("[AchievementManager] Couldn't update achievement version number stat")

						return 
					else
						self.checked_version_number = true
					end
				else
					return 
				end
			end
		end

		if not self.initialized_achievements then
			self.initialized_achievements = true
			local unlocked, error_msg = nil

			for i = 1, achievements_n, 1 do
				local template = achievements[i]
				local name = template.name
				local unlocked, error_msg = platform_functions.is_unlocked(template)

				if unlocked then
					completed_achievements[name] = true
				elseif error_msg then
					ScriptApplication.send_to_crashify("[AchievementManager]", "ERROR: %s", error_msg)

					completed_achievements[name] = true
				end
			end
		end

		local to_process = ACHIEVEMENTS_PER_FRAME

		while 0 < to_process do
			to_process = to_process - 1
			self.next_achievement_to_process_index = self.next_achievement_to_process_index%achievements_n + 1
			local template = achievements[self.next_achievement_to_process_index]
			local name = template.name

			if not completed_achievements[name] and not in_progress[name] then
				Profiler.start(name)

				local result = template.evaluate(statistics_db, stats_id)

				Profiler.stop(name)

				if result then
					local token, error_msg = platform_functions.unlock(platform_id, template)
				end
			end
		end

		for name, token in pairs(in_progress) do
			local done, error_msg = platform_functions.progress(token)

			if done then
				in_progress[name] = nil

				if error_msg == nil then
					completed_achievements[name] = true
				else
					Application.warning("Unlocking achievement with name %s failed due to error message %s", name, tostring(error_msg))

					self.error_timeout = 5
				end
			end
		end
	end

	return 
end
AchievementManager._test = function (self)
	if not self._achievements then
		self._achievements = Achievements(Managers.account:user_id())
	end

	if not self._refreshed then
		Achievements.refresh(self._achievements)

		self._refreshed = true
	end

	if not Achievements.is_refreshing(self._achievements) and not self._info then
		self._info = Achievements.info(self._achievements, 1)
	end

	slot1 = self._info and 0

	return 
end
AchievementManager.reset = function (self)
	local platform = self.platform
	local platform_functions = platform_functions[platform]

	platform_functions.reset()

	if PLATFORM ~= "xb1" then
		self.completed_achievements = {}
	end

	self.in_progress = {}

	return 
end
local font_size = 16
local font = "gw_arial_16"
local font_mtrl = "materials/fonts/" .. font
AchievementManager.debug_draw = function (self)
	if script_data.achievement_debug then
		if self.gui == nil then
			self.gui = World.create_screen_gui(self.world, "material", "materials/fonts/gw_fonts", "immediate")
		end

		local achievements = AchievementTemplates
		local achievements_n = AchievementTemplates_n
		local gui = self.gui
		local res_x = RESOLUTION_LOOKUP.res_w
		local res_y = RESOLUTION_LOOKUP.res_h
		local header_color = Color(250, 255, 255, 100)
		local bg_color = Color(240, 25, 50, 25)
		local key_color = Color(250, 255, 120, 0)
		local description_color = Color(255, 255, 255, 100)
		local strikethrough_color = Color(100, 255, 255, 0)
		local start_pos = Vector3(res_x/2, res_y - 100, 200)
		local pos = Vector3.copy(start_pos)
		local header_text = string.format("Achievements [%s]", self.platform)

		Gui.text(gui, header_text, font_mtrl, font_size, font, pos, header_color)

		pos.x = pos.x + 10

		for i = 1, achievements_n, 1 do
			local achievement = achievements[i]
			local name = achievement.name
			pos.y = pos.y - 20

			Gui.text(gui, name, font_mtrl, font_size, font, pos, key_color)

			if self.completed_achievements[name] then
				Gui.rect(gui, pos + Vector3(-10, 2, 0), Vector2(120, 2), strikethrough_color)
			elseif self.in_progress[name] then
				Gui.text(gui, "unlocking...", font_mtrl, font_size, font, pos + Vector3(100, 0, 0), description_color)
			end
		end

		Gui.rect(gui, Vector3(start_pos.x - 20, pos.y - 20, 100), Vector2(200, start_pos.y - pos.y + 40), bg_color)
	end

	self.statistics_db:debug_draw()

	return 
end

if PLATFORM == "xb1" then
	AchievementManager.initialize_hero_stats = function (self)
		table.clear(self.hero_stat_table)

		local stats_id = Managers.player:local_player():stats_id()

		for _, hero_stat in pairs(HeroStats) do
			if hero_stat.persistent then
				self.hero_stat_table[hero_stat.stat_name] = hero_stat.evaluate(self.statistics_db, stats_id)
			end
		end

		Application.warning("[AchievementManager] Hero stats initialized!")

		return 
	end
	AchievementManager.write_hero_stats = function (self)
		local xbox_user_id = Managers.account:xbox_user_id()
		local player_session_id = Managers.account:player_session_id()
		local player = Managers.player:local_player()

		if not player then
			Application.warning("[AchievementManager] Hero stats update --> FAILED! due to missing player")

			return 
		end

		local stats_id = player.stats_id(player)

		if not stats_id then
			Application.warning("[AchievementManager] Hero stats update --> FAILED! due to missing stats_id")

			return 
		end

		local final_value = nil

		for _, hero_stat in pairs(HeroStats) do
			local value = hero_stat.evaluate(self.statistics_db, stats_id)

			if hero_stat.persistent then
				final_value = value - self.hero_stat_table[hero_stat.stat_name]
			else
				final_value = value
			end

			print("Writing:", tostring(hero_stat.stat_name), tostring(final_value))
			Managers.xbox_events:write(hero_stat.stat_name, {
				xbox_user_id,
				player_session_id,
				final_value
			})
		end

		Application.warning("[AchievementManager] Hero stats update --> SUCCESS!")

		return 
	end
end

return 

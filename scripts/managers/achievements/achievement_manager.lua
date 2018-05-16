require("scripts/settings/level_unlock_settings")

local achievement_templates = require("scripts/managers/achievements/achievement_templates2")
local PROGRESS_TASK_IDLE, PROGRESS_TASK_STARTED, PROGRESS_TASK_COMPLETED, PROGRESS_TASK_FAILED = nil

if PLATFORM == "xb1" then
	PROGRESS_TASK_IDLE = Achievements2017.PROGRESS_TASK_IDLE
	PROGRESS_TASK_STARTED = Achievements2017.PROGRESS_TASK_STARTED
	PROGRESS_TASK_COMPLETED = Achievements2017.PROGRESS_TASK_COMPLETED
	PROGRESS_TASK_FAILED = Achievements2017.PROGRESS_TASK_FAILED
end

local platform_functions = {
	debug = {
		evaluate_progress = false,
		check_version_number = function ()
			local token = Application.time_since_launch() + 1 + math.random() * 2

			return false, token
		end,
		version_result = function (token)
			local time = Application.time_since_launch()

			return token < time
		end,
		is_unlocked = function (template)
			return false
		end,
		unlock = function (platform_id, template)
			print("[AchievementDebug] Unlocked:", template.id)

			local token = Application.time_since_launch() + 1 + math.random() * 2

			return token
		end,
		unlock_result = function (token)
			local time = Application.time_since_launch()

			return token < time
		end,
		reset = function ()
			return
		end
	},
	steam = {
		evaluate_progress = false,
		check_version_number = function ()
			return true
		end,
		version_result = function (token)
			local result = Stats.progress(token)

			if result.done then
				return true, result.error
			end
		end,
		is_unlocked = function (template)
			local unlocked, error_msg = Achievement.unlocked(template.id)

			return unlocked, error_msg
		end,
		unlock = function (platform_id, template)
			local token, error_msg = Achievement.unlock(template.id)

			return token, error_msg
		end,
		unlock_result = function (token)
			local result = Achievement.progress(token)

			if result.done then
				return true, result.error
			end
		end,
		reset = function ()
			Achievement.reset()
		end
	},
	ps4 = {
		evaluate_progress = false,
		check_version_number = function ()
			return true
		end,
		version_result = function (token)
			return true
		end,
		is_unlocked = function (template)
			return not template.ID_PS4
		end,
		unlock = function (player_id, template)
			assert(template.ID_PS4, "[AchievementManager] There is no Trophy ID specified for achievement: " .. template.id)

			local token = Trophies.unlock(Managers.account:initial_user_id(), template.ID_PS4)

			return token
		end,
		unlock_result = function (token)
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
		end,
		reset = function ()
			errorf("Tried to reset Trophies, not implemented!")
		end
	},
	xb1 = {
		evaluate_progress = true,
		check_version_number = function ()
			return true
		end,
		version_result = function (token)
			return true
		end,
		is_unlocked = function (template)
			return not template.ID_XB1
		end,
		unlock = function (player_id, template, progress)
			local new_progress = progress or 100
			local template_id = template.id
			local achievement_id = template.ID_XB1

			fassert(achievement_id, "[AchievementManager] No Achievement ID specified for achievement %q", template_id)

			if not rawget(_G, "XB1Achievements") then
				return
			end

			if Achievements2017.is_refreshing(XB1Achievements) or Achievements2017.progress_task_status(XB1Achievements) == PROGRESS_TASK_STARTED then
				return
			end

			local current_progress = Achievements2017.progress(XB1Achievements, achievement_id)

			if current_progress == -1 then
				Managers.account:set_achievement_unlocked(template_id)

				return nil, string.format("[AchievementManager] Error when fetching current progress for achievement %q", template_id)
			end

			if current_progress == 100 then
				Managers.account:set_achievement_unlocked(template_id)

				return
			end

			if new_progress <= current_progress then
				return
			end

			local error_msg = Achievements2017.set_progress(XB1Achievements, achievement_id, new_progress)

			if error_msg then
				Managers.account:set_achievement_unlocked(template_id)

				return nil, error_msg
			end

			return true
		end,
		unlock_result = function (token, template_id)
			local result = Achievements2017.progress_task_status(XB1Achievements)

			if result == PROGRESS_TASK_STARTED then
				return false
			elseif result == PROGRESS_TASK_COMPLETED then
				Achievements2017.refresh(XB1Achievements)

				return true
			elseif result == PROGRESS_TASK_FAILED then
				Managers.account:set_achievement_unlocked(template_id)

				return true, "error"
			end
		end,
		reset = function ()
			errorf("Tried to reset Achievements2017, not implemented!")
		end
	}
}
AchievementManager = class(AchievementManager)
local ACHIEVEMENTS_PER_FRAME = 1

AchievementManager.init = function (self, world, statistics_db, is_in_inn)
	self.world = world
	self.statistics_db = statistics_db
	self.context_is_in_inn = is_in_inn
	self._templates = {}
	self.unlock_tasks = {}

	if PLATFORM == "xb1" then
		self.completed_achievements = Managers.account:get_unlocked_achievement_list()
	else
		self.completed_achievements = {}
	end

	self.next_achievement_to_process_index = 0
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
				self:_initialize_xbox_achivements()
			end
		end

		self.platform = "xb1"
	else
		use_debug_platform = true
	end

	if use_debug_platform then
		print("[AchievementManager] Achievements using debug platform")

		self.platform = "debug"
	end

	local template_count = 0

	for id, template in pairs(achievement_templates.achievements) do
		if (self.platform == "steam" and template.ID_STEAM) or (self.platform == "ps4" and template.ID_PS4) or (self.platform == "xb1" and template.ID_XB1) or self.platform == "debug" then
			local idx = template_count + 1
			self._templates[idx] = template
			template_count = idx
			self._templates[idx].id = id
		end
	end

	self._template_count = template_count
	self._enabled = true

	if script_data.settings.use_beta_overlay then
		self._enabled = false
	end

	Managers.state.event:register(self, "event_enable_achievements", "event_enable_achievements")
	Managers.state.event:register(self, "event_set_loadout_items", "event_set_loadout_items")
end

AchievementManager.event_enable_achievements = function (self, enable)
	self._enabled = enable
end

AchievementManager.event_set_loadout_items = function (self)
	self.context_set_loadout = true
	self.next_achievement_to_process_index = 0
end

AchievementManager._initialize_xbox_achivements = function (self)
	local setup_data = require("scripts/settings/events_xb1")

	Events.setup(setup_data)
	rawset(_G, "XB1Achievements", Achievements2017(Managers.account:user_id()))
	Achievements2017.refresh(XB1Achievements)

	self._xbox_achievements_initialized = true
end

AchievementManager.destroy = function (self)
	Managers.state.event:unregister("event_enable_achievements", self)
	Managers.state.event:unregister("event_set_loadout_items", self)

	if self.gui then
		World.destroy_gui(self.world, self.gui)

		self.gui = nil
	end
end

AchievementManager.update = function (self, dt)
	if self.error_timeout then
		self.error_timeout = self.error_timeout - dt

		if self.error_timeout < 0 then
			self.error_timeout = nil
		end

		return
	end

	local platform = self.platform

	if platform == "ps4" then
		if not self._sent_warning then
			Application.warning("[AchievementManager] Achievements not yet implemented")

			self._sent_warning = true
		end

		return
	end

	if not self._enabled then
		return
	end

	if platform == "xb1" and not self._xbox_achievements_initialized then
		if not Managers.account:user_detached() then
			self:_initialize_xbox_achivements()
		end

		return
	end

	local player_manager = Managers.player
	local player = player_manager:local_player()

	if player ~= nil then
		local statistics_db = self.statistics_db
		local achievements = self._templates
		local achievements_n = self._template_count
		local unlock_tasks = self.unlock_tasks
		local completed_achievements = self.completed_achievements
		local platform_functions = platform_functions[platform]
		local platform_id = player:platform_id()
		local stats_id = player:stats_id()

		self:debug_draw()

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
				local done, error_msg = platform_functions.version_result(self.version_token)

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
				local id = template.id
				local unlocked, error_msg = platform_functions.is_unlocked(template)

				if unlocked then
					completed_achievements[id] = true
				elseif error_msg then
					ScriptApplication.send_to_crashify("[AchievementManager]", "ERROR: %s", error_msg)

					completed_achievements[id] = true
				end
			end
		end

		local to_process = ACHIEVEMENTS_PER_FRAME

		while to_process > 0 do
			to_process = to_process - 1
			self.next_achievement_to_process_index = self.next_achievement_to_process_index % achievements_n + 1
			local template = achievements[self.next_achievement_to_process_index]

			if not template then
				break
			end

			local id = template.id
			local in_context = false

			if template.context == "in_inn" then
				if self.context_is_in_inn then
					in_context = true
				end
			elseif template.context == "set_loadout" then
				if self.context_set_loadout then
					in_context = true
				end
			else
				in_context = true
			end

			local should_evaluate = not completed_achievements[id] and not unlock_tasks[id] and in_context

			if should_evaluate then
				local token, error_msg = nil
				local achievement_completed = template.completed(statistics_db, stats_id)

				if achievement_completed then
					token, error_msg = platform_functions.unlock(platform_id, template)
				elseif platform_functions.evaluate_progress and template.progress then
					local progress_table = template.progress(statistics_db, stats_id)
					local progress = progress_table[1]

					if progress > 0 then
						local progress_max = progress_table[2]
						local progress_raw = progress / progress_max * 100
						local progress_percent = math.floor(progress_raw + 0.5)

						if progress_percent > 0 then
							token, error_msg = platform_functions.unlock(platform_id, template, progress_percent)

							if progress_percent == 100 then
								achievement_completed = true
							end
						end
					end
				end

				if token then
					unlock_tasks[id] = {
						token = token,
						achievement_completed = achievement_completed
					}
				elseif error_msg then
					ScriptApplication.send_to_crashify("[AchievementManager]", "ERROR: %s", error_msg)
				end
			end

			if self.next_achievement_to_process_index == achievements_n then
				self.context_set_loadout = false
			end
		end

		for id, task in pairs(unlock_tasks) do
			local token = task.token
			local done, error_msg = platform_functions.unlock_result(token, id)

			if done then
				unlock_tasks[id] = nil

				if error_msg == nil then
					if task.achievement_completed then
						completed_achievements[id] = true
					end
				else
					Application.warning("Unlocking achievement with id %s failed due to error message %s", id, tostring(error_msg))

					self.error_timeout = 5
				end
			end
		end
	end
end

AchievementManager._test = function (self)
	if not self._achievements then
		self._achievements = Achievements2017(Managers.account:user_id())
	end

	if not self._refreshed then
		Achievements2017.refresh(self._achievements)

		self._refreshed = true
	end

	if not Achievements2017.is_refreshing(self._achievements) and not self._info then
		self._info = Achievements2017.info(self._achievements, 1)
	end

	slot1 = self._info and 0
end

AchievementManager.reset = function (self)
	local platform = self.platform
	local platform_functions = platform_functions[platform]

	platform_functions.reset()

	if PLATFORM ~= "xb1" then
		self.completed_achievements = {}
	end

	self.unlock_tasks = {}
end

local font_size = 16
local font = "gw_arial_16"
local font_mtrl = "materials/fonts/" .. font

AchievementManager.debug_draw = function (self)
	if script_data.achievement_debug then
		if self.gui == nil then
			self.gui = World.create_screen_gui(self.world, "material", "materials/fonts/gw_fonts", "immediate")
		end

		local achievements = self._templates
		local achievements_n = self._template_count
		local gui = self.gui
		local res_x = RESOLUTION_LOOKUP.res_w
		local res_y = RESOLUTION_LOOKUP.res_h
		local header_color = Color(250, 255, 255, 100)
		local bg_color = Color(240, 25, 50, 25)
		local key_color = Color(250, 255, 120, 0)
		local description_color = Color(255, 255, 255, 100)
		local strikethrough_color = Color(100, 255, 255, 0)
		local start_pos = Vector3(res_x / 2, res_y - 100, 200)
		local pos = Vector3.copy(start_pos)
		local header_text = string.format("Achievements [%s]", self.platform)

		Gui.text(gui, header_text, font_mtrl, font_size, font, pos, header_color)

		pos.x = pos.x + 10

		for i = 1, achievements_n, 1 do
			local achievement = achievements[i]
			local id = achievement.id
			pos.y = pos.y - 20

			Gui.text(gui, id, font_mtrl, font_size, font, pos, key_color)

			if self.completed_achievements[id] then
				Gui.rect(gui, pos + Vector3(-10, 2, 0), Vector2(120, 2), strikethrough_color)
			elseif self.unlock_tasks[id] then
				Gui.text(gui, "unlocking...", font_mtrl, font_size, font, pos + Vector3(100, 0, 0), description_color)
			end
		end

		Gui.rect(gui, Vector3(start_pos.x - 20, pos.y - 20, 100), Vector2(200, start_pos.y - pos.y + 40), bg_color)
	end

	self.statistics_db:debug_draw()
end

return

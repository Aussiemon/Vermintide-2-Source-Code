require("scripts/managers/achievements/achievement_templates")

local outline = require("scripts/managers/achievements/achievements_outline")
local World = rawget(_G, "World")
local script_data = rawget(_G, "script_data")
local RESOLUTION_LOOKUP = rawget(_G, "RESOLUTION_LOOKUP")
local Color = rawget(_G, "Color")
local Gui = rawget(_G, "Gui")
AchievementManager = class(AchievementManager)
local ACHIEVEMENT_CHECK_DELAY = 1

AchievementManager.init = function (self, world, statistics_db)
	self.initialized = false
	self.world = world
	self._statistics_db = statistics_db
	self._templates = {}
	self._unlocked_achievements = {}
	self._unlock_tasks = {}
	self._achievement_data = {}
	local backend_interface_loot = Managers.backend:get_interface("loot")
	self._backend_interface_loot = backend_interface_loot

	if PLATFORM == "win32" or PLATFORM == "win64" then
		if rawget(_G, "Steam") and GameSettingsDevelopment.network_mode == "steam" then
			self.platform = "steam"
		else
			self.platform = "debug"
		end
	elseif PLATFORM == "ps4" then
		self.platform = "ps4"
	elseif PLATFORM == "xb1" then
		self.platform = "xb1"
	else
		self.platform = "debug"
	end

	local template_count = 0

	for id, template in pairs(AchievementTemplates.achievements) do
		if (self.platform == "steam" and template.ID_STEAM) or (self.platform == "ps4" and template.ID_PS4) or (self.platform == "xb1" and template.ID_XB1) or self.platform == "debug" then
			local idx = template_count + 1
			self._templates[idx] = template
			template_count = idx
			self._templates[idx].id = id
		end
	end

	self._template_count = template_count
	self._curr_template_idx = 1
	self._platform_functions = require("scripts/managers/achievements/platform_" .. self.platform)

	assert(self._platform_functions, "Can't load platform functions for platform %s", self.platform)
	self._platform_functions.init(self)
	printf("[AchievementManager] Achievements using the %s platform", self.platform)
	self:event_enable_achievements(true)

	if template_count == 0 or script_data.settings.use_beta_overlay then
		self._enabled = false
	end

	Managers.state.event:register(self, "event_enable_achievements", "event_enable_achievements")

	self.initialized = true
end

AchievementManager.destroy = function (self)
	Managers.state.event:unregister("event_enable_achievements", self)

	if self.gui then
		World.destroy_gui(self.world, self.gui)

		self.gui = nil
	end
end

AchievementManager.event_enable_achievements = function (self, enable)
	self._enabled = enable
end

AchievementManager.update = function (self, dt, t)
	self:debug_draw()

	if not self._enabled or not self:_check_version_number() or not self:_check_initialized_achievements() then
		return
	end

	if self._error_timeout then
		self._error_timeout = self._error_timeout - dt

		if self._error_timeout < 0 then
			self._error_timeout = nil
		end

		return
	end

	local platform_functions = self._platform_functions
	local platform_update = platform_functions.update

	if platform_update then
		local wait = platform_update(self)

		if wait then
			return
		end
	end

	local player_manager = Managers.player
	local player = player_manager:local_player()

	if not player then
		return
	end

	local unlock_tasks = self._unlock_tasks
	local unlocked_achievements = self._unlocked_achievements

	for template_id, task in pairs(unlock_tasks) do
		local token = task.token
		local done, error_msg = platform_functions.unlock_result(token, template_id)

		if done then
			unlock_tasks[template_id] = nil

			if error_msg == nil then
				if task.achievement_completed then
					unlocked_achievements[template_id] = true
				end
			else
				Application.warning("Unlocking achievement with id %s failed due to error message %s", template_id, tostring(error_msg))

				self._error_timeout = 5

				return
			end
		end
	end

	if self._console_achievement_check_delay and t < self._console_achievement_check_delay then
		return
	end

	local template_idx = self._curr_template_idx
	local template = self._templates[template_idx]
	local template_id = template.id
	local statistics_db = self._statistics_db
	local stats_id = player:stats_id()
	local should_process = not unlocked_achievements[template_id] and not unlock_tasks[template_id]

	if should_process then
		local token, error_msg, achievement_completed = nil

		if platform_functions.set_progress and template.progress then
			local progress_table = template.progress(statistics_db, stats_id)
			local progress = progress_table[1]
			local max_progress = progress_table[2]
			token, error_msg, achievement_completed = platform_functions.set_progress(template, progress, max_progress)
		else
			achievement_completed = template.completed(statistics_db, stats_id)

			if achievement_completed then
				token, error_msg = platform_functions.unlock(template)
			end
		end

		if token then
			unlock_tasks[template_id] = {
				token = token,
				achievement_completed = achievement_completed
			}
		elseif error_msg then
			ScriptApplication.send_to_crashify("[AchievementManager]", "ERROR: %s", error_msg)
		end
	end

	template_idx = template_idx + 1

	if self._template_count < template_idx then
		template_idx = 1
	end

	self._curr_template_idx = template_idx

	if PLATFORM == "xb1" and should_process then
		self._console_achievement_check_delay = t + ACHIEVEMENT_CHECK_DELAY
	end

	self:_update_reward_polling(dt, t)
end

AchievementManager.reset = function (self)
	self._platform_functions.reset()

	self._unlocked_achievements = {}
	self._unlock_tasks = {}
end

AchievementManager.outline = function (self)
	if not self.initialized then
		return nil, "AchievementManager not initialized"
	end

	return outline
end

AchievementManager.get_data_by_id = function (self, achievement_id)
	local achievement_data = self._achievement_data[achievement_id]

	fassert(achievement_data, "Have not set up achievement (%s) yet.", achievement_id)

	return achievement_data
end

AchievementManager.setup_achievement_data = function (self)
	if not self._enabled then
		return
	end

	if not self.initialized then
		return nil, "AchievementManager not initialized"
	end

	local function setup_achievement_data_from_categories(achievement_manager, categories)
		for i, category in ipairs(categories) do
			if category.categories then
				setup_achievement_data_from_categories(achievement_manager, category.categories)
			end

			if category.entries then
				achievement_manager:setup_achievement_data_from_list(category.entries)
			end
		end
	end

	setup_achievement_data_from_categories(self, outline.categories)
end

AchievementManager.setup_achievement_data_from_list = function (self, achievement_ids)
	for i, achievement_id in ipairs(achievement_ids) do
		self:_setup_achievement_data(achievement_id)
	end
end

AchievementManager.can_claim_achievement_rewards = function (self, achievement_id)
	if not self._enabled then
		return nil, "AchievementManager not enabled"
	end

	if not self.initialized then
		return nil, "AchievementManager not initialized"
	end

	local backend_interface_loot = self._backend_interface_loot
	local can_claim = backend_interface_loot:can_claim_achievement_rewards(achievement_id)

	if not can_claim then
		return nil, "Achievement already claimed."
	end

	if self._reward_poll_id then
		return nil, "Achievement reward polling in progress."
	end

	return true
end

AchievementManager.claim_reward = function (self, achievement_id)
	local backend_interface_loot = self._backend_interface_loot
	local reward_poll_id = backend_interface_loot:claim_achievement_rewards(achievement_id)
	self._reward_poll_id = reward_poll_id

	return reward_poll_id
end

AchievementManager.polling_reward = function (self)
	return (self._reward_poll_id and true) or false
end

AchievementManager.has_any_unclaimed_achievement = function (self)
	for achievement_id, data in pairs(self._achievement_data) do
		if data.completed and not data.claimed then
			return true
		end
	end

	return false
end

AchievementManager.evaluate_end_of_level_achievements = function (self, statistics_db, stats_id, level_key, difficulty_key)
	local evaluations = AchievementTemplates.end_of_level_achievement_evaluations

	print("yep")

	for _, data in pairs(evaluations) do
		local levels = data.levels

		print("ok")

		if not levels or table.contains(levels, level_key) then
			local evaluation_func = data.evaluation_func
			local allowed_difficulties = data.allowed_difficulties

			print("cool")

			if (not allowed_difficulties or allowed_difficulties[difficulty_key]) and evaluation_func(statistics_db, stats_id) then
				local stat_to_increment = data.stat_to_increment

				print("its working")
				statistics_db:increment_stat(stats_id, stat_to_increment)
			end
		end
	end
end

AchievementManager._update_reward_polling = function (self)
	local reward_poll_id = self._reward_poll_id

	if reward_poll_id then
		local backend_interface_loot = self._backend_interface_loot
		local poll_completed = backend_interface_loot:is_loot_generated(reward_poll_id)

		if poll_completed then
			self._reward_poll_id = nil
		end
	end
end

AchievementManager._check_version_number = function (self)
	if not self._checked_version_number then
		if not self._version_token then
			local ok, token = self._platform_functions.check_version_number()

			if ok then
				self._checked_version_number = true
			else
				self._version_token = token
			end
		else
			local done, error_msg = self._platform_functions.version_result(self._version_token)

			if done then
				self._version_token = nil

				if error_msg then
					print("[AchievementManager] Couldn't update achievement version number stat")
				else
					self._checked_version_number = true
				end
			end
		end
	end

	return self._checked_version_number
end

AchievementManager._check_initialized_achievements = function (self)
	if not self._initialized_achievements then
		self._initialized_achievements = true
		local unlocked, error_msg = nil

		for i = 1, self._template_count, 1 do
			local template = self._templates[i]
			local unlocked, error_msg = self._platform_functions.is_unlocked(template)

			if unlocked then
				self._unlocked_achievements[template.id] = true
			elseif error_msg then
				Application.warning("[AchievementManager]", "ERROR: %s", error_msg)

				self._unlocked_achievements[template.id] = true
			end
		end
	end

	return self._initialized_achievements
end

AchievementManager._setup_achievement_data = function (self, achievement_id)
	local achievement_data = AchievementTemplates.achievements[achievement_id]

	assert(achievement_data)

	local name, desc, completed, progress, requirements, claimed, required_dlc = nil
	local player_manager = Managers.player
	local player = player_manager:local_player()

	if not player then
		return nil, "Missing player"
	end

	local stats_id = player:stats_id()

	if type(achievement_data.name) == "function" then
		local status, result = pcall(achievement_data.name)

		if status then
			name = result
		else
			Application.warning("Failed to evaluate achievement name for %s: %s", achievement_id, result)

			name = "<Error>"
		end
	elseif type(achievement_data.name) == "string" then
		name = Localize(achievement_data.name)
	end

	if type(achievement_data.desc) == "function" then
		local status, result = pcall(achievement_data.desc)

		if status then
			desc = result
		else
			Application.warning("Failed to evaluate achievement desc for %s: %s", achievement_id, result)

			desc = "<Error>"
		end
	elseif type(achievement_data.desc) == "string" then
		desc = Localize(achievement_data.desc)
	end

	if type(achievement_data.completed) == "boolean" then
		completed = achievement_data.completed
	elseif type(achievement_data.completed) == "function" then
		completed = achievement_data.completed(self._statistics_db, stats_id)
	end

	if type(achievement_data.progress) == "table" then
		progress = achievement_data.progress
	elseif type(achievement_data.progress) == "function" then
		progress = achievement_data.progress(self._statistics_db, stats_id)
	end

	if type(achievement_data.requirements) == "table" then
		requirements = achievement_data.requirements
	elseif type(achievement_data.requirements) == "function" then
		requirements = achievement_data.requirements(self._statistics_db, stats_id)
	end

	if requirements then
		for i, requirement in ipairs(requirements) do
			if type(requirement.name) == "string" then
				requirement.name = Localize(requirement.name)
			elseif type(requirement.name) == "function" then
				local status, result = pcall(requirement.name)

				if status then
					requirement.name = result
				else
					Application.warning("Failed to evaluate requirement name for %s: %s", achievement_id, result)

					requirement.name = "<Error>"
				end
			end
		end
	end

	local backend_interface_loot = self._backend_interface_loot
	claimed = backend_interface_loot:achievement_rewards_claimed(achievement_id)
	local achievement_data = {
		id = achievement_id,
		name = name,
		desc = desc,
		icon = achievement_data.icon,
		required_dlc = achievement_data.required_dlc,
		completed = completed,
		progress = progress,
		requirements = requirements,
		reward = achievement_data.reward,
		claimed = claimed
	}
	self._achievement_data[achievement_id] = achievement_data
end

local font_size = 16
local font = "gw_arial_16"
local font_mtrl = "materials/fonts/" .. font

AchievementManager.debug_draw = function (self)
	if not script_data.achievement_debug then
		return
	end

	if not self.gui then
		self.gui = World.create_screen_gui(self.world, "material", "materials/fonts/gw_fonts", "immediate")
	end

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
	local header_text = string.format("Achievements v2 [%s]", self.platform)

	Gui.text(gui, header_text, font_mtrl, font_size, font, pos, header_color)

	for i = 1, self._template_count, 1 do
		local template = self._templates[i]
		local id = template.id
		pos.y = pos.y - 20
		local color = key_color

		Gui.text(gui, id, font_mtrl, font_size, font, pos, color)

		if self._unlocked_achievements[id] then
			Gui.rect(gui, pos + Vector3(-10, 2, 0), Vector2(220, 2), strikethrough_color)
		elseif self._unlock_tasks[id] then
			Gui.text(gui, "unlocking...", font_mtrl, font_size, font, pos + Vector3(240, 0, 0), description_color)
		end
	end

	Gui.rect(gui, Vector3(start_pos.x - 20, pos.y - 20, 100), Vector2(300, start_pos.y - pos.y + 40), bg_color)
end

return

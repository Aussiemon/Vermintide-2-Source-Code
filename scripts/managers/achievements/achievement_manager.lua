﻿-- chunkname: @scripts/managers/achievements/achievement_manager.lua

require("scripts/managers/achievements/achievement_templates")

local outline = require("scripts/managers/achievements/achievements_outline")
local World = rawget(_G, "World")
local script_data = rawget(_G, "script_data")
local Color = rawget(_G, "Color")
local Gui = rawget(_G, "Gui")
local TIMED_EVENT_TEMPLATE_ID = 1
local TIMED_EVENT_EVENT_ID = 2
local TIMED_EVENT_DELAY = 3
local TIMED_EVENT_DATA = 4

if IS_CONSOLE then
	local to_remove = {}
	local achievements = AchievementTemplates.achievements
	local outline_categories = outline.categories

	for idx, category_data in ipairs(outline_categories) do
		table.clear(to_remove)

		local entries = category_data.entries

		for idx, entry in pairs(entries) do
			if achievements[entry].disable_on_consoles then
				to_remove[#to_remove + 1] = idx
			end
		end

		for i = #to_remove, 1, -1 do
			local idx = to_remove[i]
			local entry = entries[idx]

			table.remove(entries, idx)
			Application.warning(string.format("### [AchievementManager] Stripping %q for consoles", entry))
		end
	end
end

AchievementManager = class(AchievementManager)

local ACHIEVEMENT_CHECK_DELAY = 1

AchievementManager.init = function (self, world, statistics_db)
	self.initialized = false
	self.world = world
	self._statistics_db = statistics_db
	self._event_mappings = {}
	self._template_event_data = {}
	self._templates = {}
	self._unlocked_achievements = {}
	self._unlock_tasks = {}
	self._available_careers = {}
	self._achievement_data = {}
	self._incompleted_achievements = {}
	self._timed_events = {}
	self._canceled_timed_events_n = 0
	self._canceled_timed_events = {}
	self._platform_achievements_to_verify = {}
	self._verify_platform_achievements_data = {}

	local backend_interface_loot = Managers.backend:get_interface("loot")

	self._backend_interface_loot = backend_interface_loot

	if IS_WINDOWS or IS_LINUX then
		if rawget(_G, "Steam") and GameSettingsDevelopment.network_mode == "steam" then
			self.platform = "steam"
		else
			self.platform = "debug"
		end
	elseif IS_PS4 then
		self.platform = "ps4"
	elseif IS_XB1 then
		self.platform = "xb1"
	else
		self.platform = "debug"
	end

	local event_mappings = self._event_mappings
	local template_count = 0

	for _, template in pairs(AchievementTemplates.achievements) do
		if self.platform == "steam" and template.ID_STEAM or IS_PS4 and template.ID_PS4 or IS_XB1 and template.ID_XB1 or self.platform == "debug" then
			local idx = template_count + 1

			self._templates[idx] = template
			template_count = idx
		end

		local events = template.events

		if events then
			for _, event_name in ipairs(events) do
				self._event_mappings[event_name] = self._event_mappings[event_name] or {}
				self._event_mappings[event_name][#self._event_mappings[event_name] + 1] = template
				self._template_event_data[template.id] = {}
			end
		end
	end

	self._template_count = template_count
	self._curr_template_idx = 1
	self._platform_functions = require("scripts/managers/achievements/platform_" .. self.platform)

	assert(self._platform_functions, "Can't load platform functions for platform %s", self.platform)
	self._platform_functions.init(self)
	printf("[AchievementManager] Achievements using the %s platform", self.platform)
	self:event_enable_achievements(true)

	if template_count == 0 or script_data.settings.use_beta_mode or Managers.state.game_mode:setting("disable_achievements") then
		self._enabled = false
	end

	Managers.state.event:register(self, "event_enable_achievements", "event_enable_achievements")

	self.initialized = true
end

AchievementManager.trigger_event = function (self, event_name, ...)
	if DEDICATED_SERVER or script_data["eac-untrusted"] then
		return
	end

	local event_mappings = self._event_mappings
	local template_event_data = self._template_event_data
	local template_list = event_mappings[event_name]
	local unlocked_achievements = self._unlocked_achievements
	local event_data = {
		...,
	}

	if template_list then
		local local_player = Managers.player:local_player()

		if not local_player then
			return
		end

		local stats_id = local_player:stats_id()
		local statistics_db = self._statistics_db

		table.clear(self._available_careers)

		local available_careers = self._available_careers
		local player_manager = Managers.player
		local human_players = player_manager:human_players()

		if human_players then
			for _, player in pairs(human_players) do
				local profile_index = player._profile_index

				if not profile_index then
					local player_unit = player.player_unit
					local owner_player = player_unit and player_manager:owner(player_unit)

					profile_index = owner_player and owner_player:profile_index()
				end

				if profile_index then
					local profile = SPProfiles[profile_index]
					local career = profile and profile.careers[player._career_index]

					if career then
						available_careers[career.display_name] = true
					end
				end
			end
		end

		for _, template in ipairs(template_list) do
			local completed = unlocked_achievements[template.id]
			local required_career = template.required_career
			local required_career_in_play = not required_career or available_careers[required_career]
			local allowed_level = template.allow_in_inn or not global_is_inside_inn
			local always_run = template.always_run

			if allowed_level and required_career_in_play and (not completed or always_run) then
				template.on_event(statistics_db, stats_id, template_event_data[template.id], event_name, event_data)
			end
		end
	end

	local event_manager = Managers.state.event

	if event_manager then
		event_manager:trigger("on_achievement_event", event_name, event_data)
	end
end

AchievementManager.register_timed_event = function (self, achievement_id, event_name, delay, data)
	local t = Managers.time:time("game")
	local handle = {
		achievement_id,
		event_name,
		delay,
		data,
		valid = true,
	}

	self._timed_events[handle] = t + (delay or 0)

	return handle
end

AchievementManager.cancel_timed_event = function (self, handle)
	if self._timed_events[handle] then
		handle.valid = false

		local canceled_n = self._canceled_timed_events_n

		canceled_n = canceled_n + 1
		self._canceled_timed_events[canceled_n] = handle
		self._canceled_timed_events_n = canceled_n
	end
end

AchievementManager.get_registered_timed_event = function (self, handle)
	return self._timed_events[handle]
end

AchievementManager.reset_timed_event = function (self, handle)
	local timed_event = self._timed_events[handle]

	if timed_event and handle.valid then
		local t = Managers.time:time("game")

		timed_event[handle] = t + timed_event[TIMED_EVENT_DELAY]

		return true
	end

	return false
end

AchievementManager._update_timed_events = function (self, dt, t)
	local timed_events = self._timed_events
	local canceled_timed_events = self._canceled_timed_events

	for i = 1, self._canceled_timed_events_n do
		timed_events[canceled_timed_events[i]] = nil
		canceled_timed_events[i] = nil
	end

	self._canceled_timed_events_n = 0

	local local_player = Managers.player:local_player()
	local stats_id = local_player:stats_id()
	local statistics_db = self._statistics_db

	for handle, event_t in pairs(timed_events) do
		if event_t <= t then
			local achievement_id = handle[TIMED_EVENT_TEMPLATE_ID]
			local event = handle[TIMED_EVENT_EVENT_ID]
			local event_data = handle[TIMED_EVENT_DATA]
			local template = AchievementTemplates.achievements[achievement_id]
			local template_event_data = self._template_event_data[template.id]

			template[event](statistics_db, stats_id, template_event_data, event_data)
			self:cancel_timed_event(handle)
		end
	end
end

AchievementManager.destroy = function (self)
	Managers.state.event:unregister("event_enable_achievements", self)

	if self.gui then
		World.destroy_gui(self.world, self.gui)

		self.gui = nil
	end

	self._timed_events = nil
end

AchievementManager.event_enable_achievements = function (self, enable)
	self._enabled = enable
end

AchievementManager.is_enabled = function (self)
	return self._enabled
end

AchievementManager.update = function (self, dt, t)
	if not self._enabled or not self:_check_version_number() or not self:_check_initialized_achievements() or not self:_verify_platform_achievements() or script_data["eac-untrusted"] then
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
		self:_update_timed_events(dt, t)

		return
	end

	local template_idx = self._curr_template_idx
	local template = self._templates[template_idx]
	local template_id = template.id
	local statistics_db = self._statistics_db
	local stats_id = player:stats_id()
	local template_event_data = self._template_event_data
	local should_process = not unlocked_achievements[template_id] and not unlock_tasks[template_id]

	if should_process then
		local token, error_msg, achievement_completed

		if platform_functions.set_progress and template.progress then
			local progress_table = template.progress(statistics_db, stats_id, template_event_data[template.id])
			local progress = progress_table[1]
			local max_progress = progress_table[2]

			token, error_msg, achievement_completed = platform_functions.set_progress(template, progress, max_progress)
		else
			achievement_completed = template.completed(statistics_db, stats_id, template_event_data[template.id])

			if achievement_completed then
				token, error_msg = platform_functions.unlock(template)
			end
		end

		if token then
			if IS_XB1 then
				self._console_achievement_check_delay = t + ACHIEVEMENT_CHECK_DELAY
			end

			unlock_tasks[template_id] = {
				token = token,
				achievement_completed = achievement_completed,
			}
		elseif error_msg then
			Crashify.print_exception("[AchievementManager]", "ERROR: %s", error_msg)
		end
	end

	template_idx = template_idx + 1

	if template_idx > self._template_count then
		template_idx = 1
	end

	self._curr_template_idx = template_idx

	self:_check_for_completed_achievements()
	self:_update_timed_events(dt, t)
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

AchievementManager._search_sub_categories = function (self, categories, in_category_id)
	if not categories then
		return
	end

	for i = 1, #categories do
		local category = categories[i]
		local category_id = category.name

		if category_id == in_category_id then
			return category.entries
		else
			local result = self:_search_sub_categories(category.categories, in_category_id)

			if result then
				return result
			end
		end
	end
end

AchievementManager.get_entries_from_category = function (self, in_category_id)
	return self:_search_sub_categories(outline.categories, in_category_id)
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
	if not self._enabled then
		return
	end

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

	if backend_interface_loot:polling_reward() then
		return nil, "Achievement reward polling in progress."
	end

	return true
end

AchievementManager.can_claim_all_achievement_rewards = function (self, achievement_ids)
	if not self._enabled then
		return nil, nil, "AchievementManager not enabled"
	end

	if not self.initialized then
		return nil, nil, "AchievementManager not initialized"
	end

	local backend_interface_loot = self._backend_interface_loot
	local can_claim, claimable_achievements, failed_achivements = backend_interface_loot:can_claim_all_achievement_rewards(achievement_ids)

	if can_claim and #failed_achivements > 1 then
		return claimable_achievements, failed_achivements, "Some of the achievements have already been claimed!"
	end

	if not can_claim then
		return nil, nil, "None of the achievements could be claimed."
	end

	return claimable_achievements, nil, nil
end

AchievementManager.claim_reward = function (self, achievement_id)
	local backend_interface_loot = self._backend_interface_loot
	local reward_poll_id = backend_interface_loot:generate_reward_loot_id()

	backend_interface_loot:claim_achievement_rewards(achievement_id, reward_poll_id)

	return reward_poll_id
end

AchievementManager.claim_multiple_rewards = function (self, achievement_ids)
	local backend_interface_loot = self._backend_interface_loot
	local reward_poll_id = backend_interface_loot:generate_reward_loot_id()

	backend_interface_loot:claim_multiple_achievement_rewards(achievement_ids, reward_poll_id)

	return reward_poll_id
end

AchievementManager.polling_reward = function (self)
	local backend_interface_loot = self._backend_interface_loot

	return backend_interface_loot:polling_reward()
end

AchievementManager.has_any_unclaimed_achievement = function (self)
	local unlock_manager = Managers.unlock

	for achievement_id, data in pairs(self._achievement_data) do
		if data.completed and not data.claimed then
			local required_dlc = data.required_dlc
			local required_dlc_extra = data.required_dlc_extra
			local is_unlocked = (not required_dlc or unlock_manager:is_dlc_unlocked(required_dlc)) and (not required_dlc_extra or unlock_manager:is_dlc_unlocked(required_dlc_extra))

			if is_unlocked then
				return true
			end
		end
	end

	return false
end

AchievementManager.evaluate_end_of_level_achievements = function (self, statistics_db, stats_id, level_key, difficulty_key)
	local evaluations = AchievementTemplates.end_of_level_achievement_evaluations

	for _, data in pairs(evaluations) do
		local levels = data.levels

		if not levels or table.contains(levels, level_key) then
			local evaluation_func = data.evaluation_func
			local allowed_difficulties = data.allowed_difficulties

			if (not allowed_difficulties or allowed_difficulties[difficulty_key]) and evaluation_func(statistics_db, stats_id) then
				local stat_to_increment = data.stat_to_increment

				statistics_db:increment_stat(stats_id, stat_to_increment)
			end
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

		local unlocked, error_msg

		for i = 1, self._template_count do
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

AchievementManager._display_completion_ui = function (self, achievement_id)
	local parameter = Localize(AchievementTemplates.achievements[achievement_id].name)
	local message = string.format(Localize("finish_level_to_complete_challenge"), parameter)
	local pop_chat = true

	Managers.chat:add_local_system_message(1, message, pop_chat)
end

local function swap_erase_element(list, index, list_length)
	list[index] = list[list_length]
	list[list_length] = nil
end

AchievementManager._check_for_completed_achievements = function (self)
	if self._incompleted_template_count > 0 then
		local incompleted_template_idx = self._incompleted_template_curr_idx
		local incompleted_template = self._incompleted_achievements[incompleted_template_idx]
		local incompleted_template_id = incompleted_template.id

		fassert(incompleted_template_id, "incompleted_template_id is nil on %s ", incompleted_template.name)

		if self:_achievement_completed(incompleted_template_id) then
			self:_display_completion_ui(incompleted_template_id)
			swap_erase_element(self._incompleted_achievements, incompleted_template_idx, self._incompleted_template_count)

			self._incompleted_template_count = self._incompleted_template_count - 1
		end

		incompleted_template_idx = incompleted_template_idx + 1

		if incompleted_template_idx > self._incompleted_template_count then
			incompleted_template_idx = 1
		end

		self._incompleted_template_curr_idx = incompleted_template_idx
	end
end

AchievementManager._achievement_completed = function (self, achievement_id)
	local achievement_data = AchievementTemplates.achievements[achievement_id]

	if type(achievement_data.completed) == "boolean" then
		return achievement_data.completed
	elseif type(achievement_data.completed) == "function" then
		local player = Managers.player:local_player()

		return achievement_data.completed(self._statistics_db, player:stats_id())
	end
end

AchievementManager.setup_incompleted_achievements = function (self)
	if not self._enabled then
		return
	end

	local template_count = 0

	for id, template in pairs(AchievementTemplates.achievements) do
		if not self:_achievement_completed(id) and template.display_completion_ui then
			local idx = template_count + 1

			self._incompleted_achievements[idx] = template
			template_count = idx
		end
	end

	self._incompleted_template_count = template_count
	self._incompleted_template_curr_idx = 1
end

AchievementManager._setup_achievement_data = function (self, achievement_id)
	local achievement_data = AchievementTemplates.achievements[achievement_id]

	fassert(achievement_data, "Missing achievemnt for [\"%s\"]", achievement_id)

	local name, desc, completed, progress, requirements, claimed, required_dlc
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
		completed = achievement_data.completed(self._statistics_db, stats_id, achievement_data)
	end

	if type(achievement_data.progress) == "table" then
		progress = achievement_data.progress
	elseif type(achievement_data.progress) == "function" then
		progress = achievement_data.progress(self._statistics_db, stats_id, achievement_data)
	end

	if completed or progress == 100 then
		local platform_functions = self._platform_functions

		if platform_functions.is_platform_achievement(achievement_data) and not platform_functions.is_unlocked(achievement_data) then
			self:_add_achievement_to_platform_unlock_verification(achievement_id)
		end
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

	local reward = backend_interface_loot:get_achievement_rewards(achievement_id)
	local achievement_data = {
		id = achievement_id,
		name = name,
		desc = desc,
		icon = achievement_data.icon,
		required_dlc = achievement_data.required_dlc,
		required_dlc_extra = achievement_data.required_dlc_extra,
		completed = completed,
		progress = progress,
		requirements = requirements,
		reward = reward,
		claimed = claimed or false,
	}

	self._achievement_data[achievement_id] = achievement_data
end

AchievementManager._add_achievement_to_platform_unlock_verification = function (self, achievement_id)
	local achievement_template = AchievementTemplates.achievements[achievement_id]

	self._platform_achievements_to_verify[#self._platform_achievements_to_verify + 1] = achievement_template
end

AchievementManager._verify_platform_achievements = function (self)
	local platform_functions = self._platform_functions
	local verify_data = self._verify_platform_achievements_data or {}

	if verify_data.in_progress then
		local done = platform_functions.unlock_result(verify_data.token, verify_data.template_id)

		if done then
			verify_data.in_progress = false
		end

		return
	end

	local platform_achievements_to_verify = self._platform_achievements_to_verify
	local current_template = platform_achievements_to_verify[#platform_achievements_to_verify]

	if not current_template then
		return true
	end

	local verified, token = self._platform_functions.verify_platform_unlocked(current_template)

	if not verified then
		return
	end

	if token then
		verify_data.token = token
		verify_data.template_id = current_template.id
		verify_data.in_progress = true
	end

	self._platform_achievements_to_verify[#self._platform_achievements_to_verify] = nil
end

local font_size = 16
local font = "arial"
local font_mtrl = "materials/fonts/" .. font

AchievementManager.debug_draw = function (self)
	if not script_data.achievement_debug then
		return
	end

	if not self.gui then
		self.gui = World.create_screen_gui(self.world, "material", "materials/fonts/gw_fonts", "immediate")
	end

	local gui = self.gui
	local res_x, res_y = RESOLUTION_LOOKUP.res_w, RESOLUTION_LOOKUP.res_h
	local header_color = Color(250, 255, 255, 100)
	local bg_color = Color(240, 25, 50, 25)
	local key_color = Color(250, 255, 120, 0)
	local description_color = Color(255, 255, 255, 100)
	local strikethrough_color = Color(100, 255, 255, 0)
	local start_pos = Vector3(res_x / 2, res_y - 100, 200)
	local pos = Vector3.copy(start_pos)
	local header_text = string.format("Achievements v2 [%s]", self.platform)

	Gui.text(gui, header_text, font_mtrl, font_size, font, pos, header_color)

	for i = 1, self._template_count do
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

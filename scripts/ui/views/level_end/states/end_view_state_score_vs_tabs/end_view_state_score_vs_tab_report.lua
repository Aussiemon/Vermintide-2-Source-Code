-- chunkname: @scripts/ui/views/level_end/states/end_view_state_score_vs_tabs/end_view_state_score_vs_tab_report.lua

local definitions = local_require("scripts/ui/views/level_end/states/end_view_state_score_vs_tabs/end_view_state_score_vs_tab_report_definitions")

EndViewStateScoreVSTabReport = class(EndViewStateScoreVSTabReport)
EndViewStateScoreVSTabReport.NAME = "EndViewStateScoreVSTabReport"

local ITEM_COLUMNS = 5
local ITEM_SIZE = definitions.scenegraph_definition.hero_progress_item_anchor.size
local ITEM_SPACING = 10

EndViewStateScoreVSTabReport.on_enter = function (self, params)
	print("[EndViewStateVS] Enter Substate EndViewStateScoreVSTabReport")

	self._params = params
	self._parent = params.parent

	local context = params.context

	self._context = context
	self._wwise_world = context.wwise_world
	self._ui_renderer = context.ui_renderer
	self._ui_top_renderer = context.ui_top_renderer
	self._input_manager = context.input_manager
	self._render_settings = {
		alpha_multiplier = 0,
		snap_pixel_positions = true,
	}
	self._progression_presentation_done = self._context.progression_presentation_done
	self._animations = {}
	self._ui_animations = {}
	self._animation_callbacks = {}
	self._challenge_entry_widgets = {}
	self._level_up_item_index = 1

	self:_extract_rewards()
	self:_extract_hero_data()
	self:_create_ui_elements(self._params)

	self._reward_popup = RewardPopupUI:new(context)

	if self._progression_presentation_done then
		self:_show_final_progression()
	else
		self:_initialize_entries()
		self:_start_transition_animation("on_enter", "on_enter")
	end

	self._parent:hide_team()
	self:_trigger_telemetry_events()
end

EndViewStateScoreVSTabReport._show_final_progression = function (self)
	self:_initialize_entries()
	self:_gather_challenge_progression()
	self:_set_hero_progression()
	self:_start_transition_animation("on_enter_forced", "on_enter_forced")
	self:_start_transition_animation("animate_hero_progress", "animate_hero_progress_forced")
	self._parent:activate_back_to_keep_button()
end

EndViewStateScoreVSTabReport._set_hero_progression = function (self)
	local context = self._context
	local hero_name = context.local_player_hero_name
	local experience = ExperienceSettings.get_experience(hero_name)
	local experience_pool = ExperienceSettings.get_experience_pool(hero_name)

	self._current_level = self:_set_current_experience(experience + experience_pool)

	local hero_widget = self._widgets_by_name.portrait

	hero_widget.content.level = self._current_level

	local start_level = self._level_start[1]
	local current_level = self._current_level + self._extra_levels
	local end_level = current_level + table.size(self._level_up_rewards)

	for i = current_level, end_level do
		local rewards = self._level_up_rewards[i]

		if rewards then
			self:_handle_rewards(rewards)
		end
	end
end

EndViewStateScoreVSTabReport._extract_hero_data = function (self)
	local peer_id = Network.peer_id()
	local local_player_id = 1
	local unique_id = peer_id .. ":" .. local_player_id
	local player_data = self._player_session_scores[unique_id]

	self._profile_index = player_data.profile_index
	self._career_index = player_data.career_index

	local profile = SPProfiles[self._profile_index]

	self._hero_name = Localize(profile.character_name)

	local career = profile.careers[self._career_index]

	self._career_name = Localize(career.name)
end

EndViewStateScoreVSTabReport._extract_rewards = function (self)
	self._game_won = self._context.game_won
	self._rewards = self._context.rewards
	self._level_up_rewards = self._params.parent.level_up_rewards
	self._versus_level_up_rewards = self._params.parent.versus_level_up_rewards
	self._level_start = self._rewards.level_start
	self._versus_level_start = self._rewards.versus_level_start
	self._mission_results = self._rewards.mission_results
	self._player_session_scores = self._context.players_session_score
	self._challenge_progression_status = self._context.challenge_progression_status
end

EndViewStateScoreVSTabReport._trigger_telemetry_events = function (self)
	local start_level, start_experience = self._versus_level_start[1], self._versus_level_start[2]

	Managers.telemetry_events:start_versus_experience(start_level, start_experience)

	local end_experience = ExperienceSettings.get_versus_experience()

	Managers.telemetry_events:versus_experience_gained(end_experience - start_experience)

	local end_level, _, _ = ExperienceSettings.get_versus_level_from_experience(start_experience + self._total_experience_gained)

	Managers.telemetry_events:versus_level_gained(start_level, end_level)

	local currency_gained = 0

	for _, level_up_rewards in pairs(self._versus_level_up_rewards) do
		for _, reward in pairs(level_up_rewards) do
			if reward.currency == "VS" then
				currency_gained = currency_gained + reward.awarded
			end
		end
	end

	Managers.telemetry_events:versus_currency_gained(currency_gained)
end

EndViewStateScoreVSTabReport._setup_hero_progression = function (self)
	local level_start = self._level_start
	local start_level, start_experience, start_experience_pool = level_start[1], level_start[2], level_start[3]

	self._progress_data = self:_get_total_experience_progress_data(start_experience, start_experience_pool)

	if self._progress_data.bonus_experience > 0 then
		self._extra_levels = self._extra_levels + self._progress_data.start_extra_level
	end

	self._experience_presentation_completed = self._progression_presentation_done
end

EndViewStateScoreVSTabReport._get_total_experience_progress_data = function (self, start_experience, start_experience_pool)
	local start_level, start_progress = ExperienceSettings.get_level(start_experience)
	local start_extra_level, start_extra_level_progress = ExperienceSettings.get_extra_level(start_experience_pool)
	local context = self._context
	local hero_name = context.local_player_hero_name
	local end_experience = ExperienceSettings.get_experience(hero_name)
	local end_level, end_progress = ExperienceSettings.get_level(end_experience)
	local end_experience_pool = ExperienceSettings.get_experience_pool(hero_name)
	local end_extra_level, end_extra_levels_progress = ExperienceSettings.get_extra_level(end_experience_pool)
	local total_start_level = start_level + start_extra_level
	local total_end_level = end_level + end_extra_level
	local bonus_experience = 0

	if start_level ~= ExperienceSettings.max_level and end_level == ExperienceSettings.max_level then
		end_progress = start_extra_level_progress
		bonus_experience = ExperienceSettings.get_experience_required_for_level(ExperienceSettings.max_level) * start_extra_level_progress
	end

	local progress_length = total_end_level - total_start_level + (end_progress - start_progress) + (end_extra_levels_progress - start_extra_level_progress)
	local experience_gained = end_experience - start_experience + (end_experience_pool - start_experience_pool) + bonus_experience

	if start_level == ExperienceSettings.max_level then
		start_experience = start_experience + start_experience_pool
		start_progress = start_extra_level_progress
	end

	local min_time = UISettings.summary_screen.bar_progress_min_time
	local max_time = UISettings.summary_screen.bar_progress_max_time
	local time_multiplier = UISettings.summary_screen.bar_progress_experience_time_multiplier
	local time = math.min(math.max(time_multiplier * experience_gained, min_time), max_time)

	return {
		complete = false,
		time = 0,
		current_experience = start_experience,
		experience_to_add = experience_gained,
		total_progress = progress_length,
		start_progress = start_progress,
		start_extra_level = start_extra_level,
		bonus_experience = bonus_experience,
		total_time = time,
	}
end

EndViewStateScoreVSTabReport._play_sound = function (self, event_name)
	self._parent:play_sound(event_name)
end

EndViewStateScoreVSTabReport._set_global_wwise_parameter = function (self, parameter_name, value)
	WwiseWorld.set_global_parameter(self._wwise_world, parameter_name, value)
end

EndViewStateScoreVSTabReport._initialize_entries = function (self)
	self:_create_summary_entries(self._game_won)
	self:_populate_hero_progression()
end

EndViewStateScoreVSTabReport._populate_hero_progression = function (self)
	local peer_id = Network.peer_id()
	local local_player_id = 1
	local unique_id = peer_id .. ":" .. local_player_id
	local player_data = self._player_session_scores[unique_id]
	local profile_index = player_data.profile_index
	local career_index = player_data.career_index
	local scenegraph_id = "portrait"
	local frame_settings_name = player_data.portrait_frame
	local level_start = self._level_start
	local start_level, start_experience, start_experience_pool = level_start[1], level_start[2], level_start[3]
	local start_level = ExperienceSettings.get_level(start_experience)
	local current_experience = start_experience + start_experience_pool

	if start_level < ExperienceSettings.max_level then
		current_experience = start_experience
	end

	local widget = self._widgets_by_name.experience_gained_text
	local content = widget.content

	content.text = string.format(definitions.summary_value_string, self._total_experience_gained)
	self._current_level, self._extra_levels = self:_set_current_experience(current_experience)

	local level_text = tostring(self._current_level)
	local scale = 1
	local retained_mode = false
	local portrait_texture = career_index and UIUtils.get_portrait_image_by_profile_index(profile_index, career_index) or "unit_frame_portrait_default"
	local widget_definition = UIWidgets.create_portrait_frame(scenegraph_id, frame_settings_name, level_text, scale, retained_mode, portrait_texture)
	local widget = UIWidget.init(widget_definition)

	self._widgets_by_name.portrait = widget
	self._hero_progress_widgets[#self._hero_progress_widgets + 1] = widget

	local profile = SPProfiles[profile_index]
	local hero_name = Localize(profile.character_name)
	local career = profile.careers[career_index]
	local career_name = Localize(career.name)
	local hero_name_widget = self._widgets_by_name.hero_name

	hero_name_widget.content.text = hero_name

	local career_name_widget = self._widgets_by_name.career_name

	career_name_widget.content.text = career_name
end

EndViewStateScoreVSTabReport._animate_experience_bar = function (self, dt, displaying_reward_presentation)
	local progress_data = self._progress_data

	if not progress_data or progress_data.complete or displaying_reward_presentation or self.level_up_anim_id or self._experience_presentation_completed then
		return
	end

	if not self._playing_experience_bar_sound then
		self:_play_sound("Play_vs_hud_progression_hero_counter_loop")

		self._playing_experience_bar_sound = true
	end

	local current_time = progress_data.time
	local total_time = progress_data.total_time
	local time_progress = current_time / total_time
	local smoothstep_progress = math.smoothstep(time_progress, 0, 1)

	current_time = math.min(current_time + dt, total_time)
	progress_data.time = current_time

	self:_set_global_wwise_parameter("summary_meter_progress", current_time / total_time)

	local current_experience = progress_data.current_experience
	local experience_to_add = progress_data.experience_to_add
	local current_experience_to_add = math.floor(experience_to_add * smoothstep_progress)
	local presentation_experience = math.floor(current_experience + current_experience_to_add)
	local level_reached, extra_levels = self:_set_current_experience(presentation_experience)
	local has_reached_level = level_reached ~= self._current_level

	if self._extra_levels ~= nil then
		if self._progress_data.bonus_experience > 0 then
			extra_levels = extra_levels + self._progress_data.start_extra_level
		end

		has_reached_level = has_reached_level or extra_levels ~= self._extra_levels
	end

	if has_reached_level then
		self._current_level = level_reached
		self._extra_levels = extra_levels
		self._level_up_anim_id = self._ui_animator:start_animation("level_up", self._widgets_by_name, definitions.scenegraph_definition, {
			wwise_world = self.wwise_world,
		})

		local hero_widget = self._widgets_by_name.portrait

		hero_widget.content.level = self._current_level

		local current_level = self._current_level + self._extra_levels
		local rewards = self._level_up_rewards[current_level]

		if rewards then
			self:_handle_rewards(rewards)
		end

		self._playing_experience_bar_sound = false

		self:_play_sound("Stop_vs_hud_progression_hero_counter_loop")
	end

	if current_time == total_time then
		progress_data.complete = true
		self._experience_presentation_completed = true

		self:_play_sound("Stop_vs_hud_progression_hero_counter_loop")
		self:_gather_challenge_progression()
	end
end

EndViewStateScoreVSTabReport._gather_challenge_progression = function (self)
	local challenge_progression_entries = {}
	local start_progression = self._challenge_progression_status.start_progress
	local end_progression = self._challenge_progression_status.end_progress
	local num_completed = 0
	local added_groups = {}

	for id, start_progress in pairs(start_progression) do
		local end_progress = end_progression[id]

		if start_progress ~= end_progress then
			challenge_progression_entries[#challenge_progression_entries + 1] = {
				id = id,
				start_progress = start_progress,
				end_progress = end_progress,
			}
			num_completed = num_completed + (end_progress >= 1 and 1 or 0)
		end
	end

	local function sort_func(a, b)
		local a_progress = a.end_progress
		local b_progress = b.end_progress

		return b_progress < a_progress
	end

	table.sort(challenge_progression_entries, sort_func)
	self:_trim_trailing_group_entries(challenge_progression_entries)

	local widget = self._widgets_by_name.challenge_progress_text

	if num_completed > 0 then
		widget.content.text = string.format(definitions.challenge_progress_text_string, num_completed)
	else
		widget.content.text = Localize("achv_menu_achievements_category_title")
	end

	self:_start_transition_animation("animate_challenge_progress", "animate_challenge_progress")

	if self._progression_presentation_done then
		self:_setup_challenge_progression_widgets(challenge_progression_entries)
	else
		self._animation_callbacks.animate_challenge_progress = callback(self, "_setup_challenge_progression_widgets", challenge_progression_entries)
	end
end

local TO_REMOVE = {}

EndViewStateScoreVSTabReport._trim_trailing_group_entries = function (self, entries)
	table.clear(TO_REMOVE)

	local groups = {}

	for i = 1, #entries do
		local entry = entries[i]
		local id = entry.id
		local achievement_template = AchievementTemplates.achievements[id]
		local group = achievement_template.group

		if group then
			if not groups[group] then
				groups[group] = entry.end_progress < 1
			else
				TO_REMOVE[#TO_REMOVE + 1] = i
			end
		end
	end

	for i = #TO_REMOVE, 1, -1 do
		table.remove(entries, TO_REMOVE[i])
	end
end

EndViewStateScoreVSTabReport._setup_challenge_progression_widgets = function (self, challenge_progression_entries)
	local spacing = 25
	local callback_key

	for i = 1, #challenge_progression_entries do
		local entry = challenge_progression_entries[i]
		local idx = i - 1
		local offset = {
			idx % 2 * 400,
			-math.floor(idx / 2) * (definitions.scenegraph_definition.challenge_entry_anchor.size[2] + spacing),
			0,
		}
		local widget_def = definitions.create_challenge_entry_func(entry.id, entry.start_progress, entry.end_progress, offset, self._progression_presentation_done)
		local widget = UIWidget.init(widget_def)

		self._challenge_entry_widgets[#self._challenge_entry_widgets + 1] = widget

		local entry_name = "achievement_entry_" .. #self._challenge_entry_widgets

		self._widgets_by_name[entry_name] = widget

		self:_start_challenge_entry_animation(i, entry_name)
	end

	local offset_y = math.ceil(#challenge_progression_entries / 2) * (definitions.scenegraph_definition.challenge_entry_anchor.size[2] + spacing)
	local excess_area = offset_y - definitions.scenegraph_definition.challenge_progress_anchor.size[2]

	if excess_area > 0 then
		local ui_scenegraph = self._ui_scenegraph
		local scroll_area_scenegraph_id = "challenge_entry_anchor"
		local scroll_area_anchor_scenegraph_id = "challenge_progress_area"
		local enable_auto_scroll = false
		local optional_scroll_area_hotspot_widget, horizontal_scrollbar

		self._scrollbar_ui = ScrollbarUI:new(ui_scenegraph, scroll_area_scenegraph_id, scroll_area_anchor_scenegraph_id, excess_area, enable_auto_scroll, optional_scroll_area_hotspot_widget, horizontal_scrollbar)
	end

	self._parent:activate_back_to_keep_button()
end

EndViewStateScoreVSTabReport._start_challenge_entry_animation = function (self, index, entry_name, is_callback)
	if self._progression_presentation_done then
		return
	end

	self:_play_sound("Play_vs_hud_progression_challenge_appear")

	local callback_key = "wait_" .. index - 1

	if not table.is_empty(self._animations) and not is_callback then
		self._animation_callbacks[callback_key] = callback(self, "_start_challenge_entry_animation", index, entry_name, true)
	else
		local data = {
			entry_name = entry_name,
		}
		local animation_key = "animate_challenge_entry_" .. index
		local wait_key = "wait_" .. index

		self:_start_transition_animation(animation_key, "animate_challenge_entry", data)
		self:_start_transition_animation(wait_key, "wait")
	end
end

EndViewStateScoreVSTabReport._handle_rewards = function (self, rewards)
	local level_up_item_index = self._level_up_item_index
	local item_interface = Managers.backend:get_interface("items")

	for idx, reward in ipairs(rewards) do
		local backend_id = reward.backend_id
		local item = item_interface:get_item_from_id(backend_id)
		local offset_index = level_up_item_index - 1
		local level_up_column_index = offset_index % ITEM_COLUMNS
		local level_up_column_row = math.floor(offset_index / ITEM_COLUMNS)
		local offset_x = level_up_column_index * ITEM_SIZE[1] + (level_up_column_index - 1) * ITEM_SPACING
		local offset_y = -level_up_column_row * ITEM_SIZE[2] - (level_up_column_row - 1) * ITEM_SPACING
		local offset = {
			offset_x,
			offset_y,
			0,
		}
		local widget_def = definitions.create_item_widget_func(item, offset, self._progression_presentation_done)
		local widget = UIWidget.init(widget_def)

		self._widgets[#self._widgets + 1] = widget
		self._widgets_by_name["rewards_" .. level_up_item_index] = widget

		if not self._progression_presentation_done then
			local data = {
				widget = widget,
				offset = table.clone(offset),
				sound = (item.key == "level_chest" or item.key == "level_chest_lesser") and "Play_vs_hud_progression_hero_chest_appear" or "Play_vs_hud_progression_hero_item_appear",
			}

			if idx > 1 then
				self._animation_callbacks["animate_item_" .. level_up_item_index - 1] = callback(self, "_start_transition_animation", "animate_item_" .. level_up_item_index, "animate_item", data)
			else
				self:_start_transition_animation("animate_item_" .. level_up_item_index, "animate_item", data)
			end
		end

		level_up_item_index = level_up_item_index + 1
	end

	if not self._progression_presentation_done then
		self:_play_sound("Play_vs_hud_progression_hero_level_up")
	end

	self._level_up_item_index = level_up_item_index
end

EndViewStateScoreVSTabReport._set_current_experience = function (self, current_experience)
	local level, progress = ExperienceSettings.get_level(current_experience)
	local extra_levels = 0

	if level == ExperienceSettings.max_level then
		local overflow_pool = current_experience - ExperienceSettings.max_experience

		extra_levels, progress = ExperienceSettings.get_extra_level(overflow_pool)
	end

	local next_level = math.clamp(level + 1, 0, ExperienceSettings.max_level)

	if not self._progression_presentation_done and (self._current_level and level > self._current_level or self._extra_levels and extra_levels > self._extra_levels) then
		progress = 1
	end

	local widgets_by_name = self._widgets_by_name
	local experience_bar = widgets_by_name.experience_bar
	local content = experience_bar.content
	local style = experience_bar.style
	local default_size = style.experience_bar.default_size

	style.experience_bar.size[1] = default_size[1] * progress
	style.experience_bar_end.offset[1] = default_size[1] * progress

	return level, extra_levels
end

EndViewStateScoreVSTabReport._create_summary_entries = function (self)
	local mission_rewards = self._mission_results
	local entries = {}
	local widget_index = 0
	local total_experience_gained = 0
	local summary_index = 1

	for index, mission_reward in ipairs(mission_rewards) do
		local experience = mission_reward.experience and math.round(mission_reward.experience)

		if experience and experience > 0 then
			local name = "summary_entry_" .. summary_index
			local text = mission_reward.text
			local format_values = mission_reward.format_values
			local title_text

			if text then
				if format_values then
					title_text = UIUtils.format_localized_description(text, format_values)
				else
					title_text = Localize(text)
				end
			end

			local value = mission_reward.value
			local bonus = mission_reward.bonus
			local icon = mission_reward.icon
			local value_text = experience and tostring(experience) or value and tostring(value) or ""
			local localized_text = title_text .. (value and " (" .. tostring(value) .. ")" or "")
			local entry = {
				name = name,
				title_text = localized_text,
				experience = experience,
				value = value,
				value_text = value_text,
				bonus = bonus,
				icon = icon,
			}

			entries[#entries + 1] = entry

			local widget_def = definitions.create_summery_entry_func(summary_index, localized_text, experience, self._progression_presentation_done)
			local widget = UIWidget.init(widget_def)

			self._widgets[#self._widgets + 1] = widget
			self._widgets_by_name[name] = widget
			total_experience_gained = total_experience_gained + experience
			summary_index = summary_index + 1
		end
	end

	self._total_experience_gained = total_experience_gained

	if self._progression_presentation_done then
		self:_set_final_level_up_progress(total_experience_gained)
	else
		self:_setup_entry_animations(entries, total_experience_gained)
	end
end

EndViewStateScoreVSTabReport._set_final_level_up_progress = function (self, total_experience_gained)
	local bar_thresholds = definitions.bar_thresholds
	local versus_level_start = self._versus_level_start

	if table.is_empty(versus_level_start) then
		versus_level_start[1] = ExperienceSettings.get_versus_level()
		versus_level_start[2] = ExperienceSettings.get_versus_experience()
	end

	local start_level, start_experience = versus_level_start[1], versus_level_start[2]
	local _, start_experience_level_progress = ExperienceSettings.get_versus_level_from_experience(start_experience)
	local end_level, end_experience_level_progress, end_experience_pool = ExperienceSettings.get_versus_level_from_experience(start_experience + total_experience_gained)
	local num_levels_gained = end_level - start_level
	local widget = self._widgets_by_name.level_up
	local content = widget.content

	if num_levels_gained > 0 then
		content.starting_progress = 0
		content.final_progress = math.lerp(bar_thresholds[1], bar_thresholds[2], end_experience_level_progress)
	elseif start_level == ExperienceSettings.max_versus_level then
		content.starting_progress = 1
		content.final_progress = 1
	else
		content.starting_progress = math.lerp(bar_thresholds[1], bar_thresholds[2], start_experience_level_progress)
		content.final_progress = math.lerp(bar_thresholds[1], bar_thresholds[2], end_experience_level_progress)
	end

	content.level_text = end_level

	local insignia_widget = self._widgets_by_name.insignia
	local insignia_main_uvs, insignia_addon_uvs = UIAtlasHelper.get_insignia_texture_settings_from_level(end_level)

	insignia_widget.content.insignia_main.uvs = insignia_main_uvs
	insignia_widget.content.insignia_addon.uvs = insignia_addon_uvs
	insignia_widget.content.level = end_level

	local summary_value_widget = self._widgets_by_name.summary_value_text

	summary_value_widget.content.text = string.format(definitions.summary_value_string, total_experience_gained)
end

EndViewStateScoreVSTabReport._setup_entry_animations = function (self, entries, total_experience_gained)
	local num_entries = #entries

	if num_entries > 0 then
		local entry_data = {
			entry_name = "summary_entry_1",
		}

		self:_start_transition_animation("animate_progression_entry_1", "animate_progression_entry", entry_data)

		for i = 2, #entries do
			local data = {
				entry_name = "summary_entry_" .. i,
			}

			self._animation_callbacks["animate_progression_entry_" .. i - 1] = callback(self, "_start_transition_animation", "animate_progression_entry_" .. i, "animate_progression_entry", data)
		end

		local progression_callback_key = "animate_progression_entry_" .. #entries
		local versus_level_start = self._versus_level_start

		if table.is_empty(versus_level_start) then
			versus_level_start[1] = ExperienceSettings.get_versus_level()
			versus_level_start[2] = ExperienceSettings.get_versus_experience()
		end

		local start_level, start_experience = versus_level_start[1], versus_level_start[2]

		if start_level ~= ExperienceSettings.max_versus_level then
			local _, start_experience_level_progress = ExperienceSettings.get_versus_level_from_experience(start_experience)
			local end_level, end_experience_level_progress = ExperienceSettings.get_versus_level_from_experience(start_experience + total_experience_gained)
			local breakdown, breakdown_index = ExperienceSettings.get_versus_progress_breakdown(start_experience, total_experience_gained)
			local num_levels_gained = end_level - start_level
			local sound_parameter_value = 0
			local level_up_reward_level

			for i = 0, num_levels_gained do
				local new_level = math.min(start_level + (i + 1), ExperienceSettings.max_versus_level)
				local animation_key = "animate_level_up_" .. i + 1

				if i == 0 then
					if num_levels_gained > 0 then
						local data = {
							final_progress = 1,
							starting_progress = start_experience_level_progress,
							level = new_level,
							sound_parameter_values = {
								sound_parameter_value,
								sound_parameter_value + breakdown[breakdown_index],
							},
						}

						if new_level == ExperienceSettings.max_versus_level then
							data.on_complete_optional_starting_progress = 1
							data.on_complete_optional_final_progress = 1
						end

						self._animation_callbacks[progression_callback_key] = callback(self, "_start_transition_animation", animation_key, "animate_level_up_start", data)
						level_up_reward_level = new_level
					else
						local data = {
							starting_progress = start_experience_level_progress,
							final_progress = end_experience_level_progress,
							sound_parameter_values = {
								sound_parameter_value,
								sound_parameter_value + breakdown[breakdown_index],
							},
						}

						self._animation_callbacks[progression_callback_key] = callback(self, "_start_transition_animation", animation_key, "animate_level_up_start_end", data)
					end
				elseif i < num_levels_gained then
					local data = {
						final_progress = 1,
						starting_progress = 0,
						level = new_level,
						sound_parameter_values = {
							sound_parameter_value,
							sound_parameter_value + breakdown[breakdown_index],
						},
					}
					local reward_done_cb = callback(self, "_start_transition_animation", animation_key, "animate_level_up_linear", data)

					self._animation_callbacks[progression_callback_key] = callback(self, "_start_level_up_reward_presentation", level_up_reward_level, reward_done_cb)
					level_up_reward_level = new_level
				elseif new_level == ExperienceSettings.max_versus_level then
					local data = {
						final_progress = 1,
						starting_progress = 1,
						level = ExperienceSettings.max_versus_level,
					}
					local reward_done_cb = callback(self, "_start_transition_animation", animation_key, "animate_level_up_instant", data)

					self._animation_callbacks[progression_callback_key] = callback(self, "_start_level_up_reward_presentation", level_up_reward_level, reward_done_cb)
				else
					local data = {
						starting_progress = 0,
						final_progress = end_experience_level_progress,
						level = new_level,
						sound_parameter_values = {
							sound_parameter_value,
							sound_parameter_value + breakdown[breakdown_index],
						},
					}
					local reward_done_cb = callback(self, "_start_transition_animation", animation_key, "animate_level_up_end", data)

					self._animation_callbacks[progression_callback_key] = callback(self, "_start_level_up_reward_presentation", level_up_reward_level, reward_done_cb)
				end

				progression_callback_key = animation_key
				sound_parameter_value = sound_parameter_value + breakdown[breakdown_index]
				breakdown_index = breakdown_index + 1
			end

			self._animation_callbacks[progression_callback_key] = callback(self, "_start_transition_animation", "versus_level_up_pause", "versus_level_up_pause")
			progression_callback_key = "versus_level_up_pause"
		end

		self._animation_callbacks[progression_callback_key] = callback(self, "_start_transition_animation", "animate_hero_progress", "animate_hero_progress")
		self._animation_callbacks.animate_hero_progress = callback(self, "_setup_hero_progression")
	else
		self:_start_transition_animation("animate_hero_progress", "animate_hero_progress")

		self._animation_callbacks.animate_hero_progress = callback(self, "_setup_hero_progression")
	end
end

local PRESENTATION_DATA = {}

EndViewStateScoreVSTabReport._start_level_up_reward_presentation = function (self, level, reward_done_cb)
	table.clear(PRESENTATION_DATA)

	local level_up_rewards = self._versus_level_up_rewards[level]

	if not level_up_rewards then
		reward_done_cb()

		return
	end

	local entry = {}
	local description = {}

	description[1] = Localize("summary_screen_rank_up")
	description[2] = Localize("versus_level_tag") .. " " .. level
	entry[#entry + 1] = {
		widget_type = "description",
		value = description,
	}

	local items = {}
	local backend_items = Managers.backend:get_interface("items")

	for i = 1, #level_up_rewards do
		local level_up_reward = level_up_rewards[i]
		local item
		local backend_id = level_up_reward.backend_id

		if backend_id then
			item = backend_items:get_item_from_id(backend_id)
		else
			item = {
				data = BackendUtils.get_fake_currency_item(level_up_reward.currency or "SM", level_up_reward.awarded),
			}
		end

		items[#items + 1] = item
	end

	entry[#entry + 1] = {
		widget_type = "item_list",
		value = items,
	}
	PRESENTATION_DATA[#PRESENTATION_DATA + 1] = entry
	PRESENTATION_DATA.bg_alpha = 200
	PRESENTATION_DATA.offset = {
		0,
		0,
		1,
	}

	self._reward_popup:display_presentation(PRESENTATION_DATA, reward_done_cb)
end

EndViewStateScoreVSTabReport.on_exit = function (self, params)
	print("[EndViewStateVS] Exit Substate EndViewStateScoreVSTabReport")

	self._ui_scenegraph = nil
	self._widgets = nil
	self._widgets_by_name = nil
	self._ui_animator = nil
	self._context.progression_presentation_done = true

	if self._reward_popup then
		self._reward_popup:destroy()

		self._reward_popup = nil
	end
end

EndViewStateScoreVSTabReport._create_ui_elements = function (self, params)
	local widget_definitions = definitions.widget_definitions
	local challenge_widget_definitions = definitions.challenge_widget_definitions
	local hero_progress_widget_definitions = definitions.hero_progress_widget_definitions
	local summary_entry_widget_definitions = definitions.summary_entry_widgets
	local scenegraph_definition = definitions.scenegraph_definition
	local animation_definitions = definitions.animation_definitions
	local bar_thresholds = definitions.bar_thresholds

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._scenegraph_definition = scenegraph_definition
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._widgets, self._widgets_by_name = UIUtils.create_widgets(widget_definitions, {}, {})
	self._hero_progress_widgets, self._widgets_by_name = UIUtils.create_widgets(hero_progress_widget_definitions, {}, self._widgets_by_name)
	self._challenge_widgets, self._widgets_by_name = UIUtils.create_widgets(challenge_widget_definitions, {}, self._widgets_by_name)
	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)

	local level_start = self._versus_level_start

	if table.is_empty(level_start) then
		level_start[1] = ExperienceSettings.get_versus_level()
		level_start[2] = ExperienceSettings.get_versus_experience()
	end

	local versus_start_level, versus_start_experience = level_start[1], level_start[2]
	local _, versus_start_experience_level_progress = ExperienceSettings.get_versus_level_from_experience(versus_start_experience)
	local level_up_widget = self._widgets_by_name.level_up

	if versus_start_level == ExperienceSettings.max_versus_level then
		level_up_widget.content.starting_progress = 1
		level_up_widget.content.final_progress = 1
	else
		level_up_widget.content.starting_progress = math.lerp(bar_thresholds[1], bar_thresholds[2], versus_start_experience_level_progress)
		level_up_widget.content.final_progress = math.lerp(bar_thresholds[1], bar_thresholds[2], versus_start_experience_level_progress)
	end

	level_up_widget.content.level_text = versus_start_level

	local insignia_widget = self._widgets_by_name.insignia
	local insignia_main_uvs, insignia_addon_uvs = UIAtlasHelper.get_insignia_texture_settings_from_level(versus_start_level)

	insignia_widget.content.insignia_main.uvs = insignia_main_uvs
	insignia_widget.content.insignia_addon.uvs = insignia_addon_uvs
	insignia_widget.content.level = versus_start_level
end

EndViewStateScoreVSTabReport._get_definitions = function (self)
	return local_require("scripts/ui/views/level_end/states/end_view_state_score_vs_tabs/end_view_state_score_vs_tab_report_definitions")
end

EndViewStateScoreVSTabReport.update = function (self, dt, t)
	self:_draw(dt, t)
	self:_update_animations(dt, t)
	self:_handle_reward_popup(dt, t)
end

EndViewStateScoreVSTabReport._handle_reward_popup = function (self, dt, t)
	self._reward_popup:update(dt, t)
end

EndViewStateScoreVSTabReport.post_update = function (self, dt, t)
	return
end

EndViewStateScoreVSTabReport._handle_input = function (self, dt, t)
	local input_manager = self._input_manager
	local input_service = input_manager:get_service("end_of_level")

	if input_service:get("confirm_hold") then
		return dt * 5
	end

	return dt
end

EndViewStateScoreVSTabReport._update_animations = function (self, dt)
	self._ui_animator:update(dt)

	for name, animation in pairs(self._ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			self._ui_animations[name] = nil
		end
	end

	local animations = self._animations
	local ui_animator = self._ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil

			local anim_callback = self._animation_callbacks[animation_name]

			self._animation_callbacks[animation_name] = nil

			if anim_callback then
				anim_callback()
			end
		end
	end

	if table.is_empty(self._animations) then
		self:_animate_experience_bar(dt)
	end
end

EndViewStateScoreVSTabReport._draw = function (self, input_service, dt, t)
	local input_manager = self._input_manager
	local input_service = input_manager:get_service("end_of_level")
	local ui_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local render_settings = self._render_settings

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	local alpha_multiplier = render_settings.alpha_multiplier

	render_settings.alpha_multiplier = render_settings.hero_progress_alpha_multiplier or 0

	for _, widget in ipairs(self._hero_progress_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	render_settings.alpha_multiplier = alpha_multiplier

	local alpha_multiplier = render_settings.alpha_multiplier

	render_settings.alpha_multiplier = render_settings.challenge_alpha_multiplier or 0

	for _, widget in ipairs(self._challenge_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	render_settings.alpha_multiplier = alpha_multiplier

	local anchor_pos_y = self._ui_scenegraph.challenge_entry_anchor.local_position[2]
	local entry_size_y = self._ui_scenegraph.challenge_entry_anchor.size[2]
	local area_size_y = self._ui_scenegraph.challenge_progress_area.size[2]
	local alpha_multiplier = render_settings.alpha_multiplier

	for _, widget in ipairs(self._challenge_entry_widgets) do
		render_settings.alpha_multiplier = widget.content.alpha_multiplier

		local offset_y = widget.offset[2] + anchor_pos_y

		if offset_y < -area_size_y then
			break
		elseif offset_y - entry_size_y < 0 then
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	render_settings.alpha_multiplier = alpha_multiplier

	UIRenderer.end_pass(ui_renderer)

	if self._scrollbar_ui then
		self._scrollbar_ui:update(dt, t, ui_renderer, input_service, render_settings)
	end
end

EndViewStateScoreVSTabReport._start_transition_animation = function (self, key, animation_name, data)
	local params = {
		set_global_wwise_parameter = callback(self, "_set_global_wwise_parameter"),
		play_sound = callback(self, "_play_sound"),
		render_settings = self._render_settings,
		data = data,
	}
	local widgets = self._widgets_by_name
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, self._scenegraph_definition, params)

	self._animations[key] = anim_id
end

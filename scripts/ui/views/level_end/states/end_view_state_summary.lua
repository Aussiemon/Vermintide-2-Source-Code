local definitions = local_require("scripts/ui/views/level_end/states/definitions/end_view_state_summary_definitions")
local widget_definitions = definitions.widgets
local summary_entry_widget_definitions = definitions.summary_entry_widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local DO_RELOAD = false
local fake_input_service = {
	get = function ()
		return
	end,
	has = function ()
		return
	end
}
EndViewStateSummary = class(EndViewStateSummary)
EndViewStateSummary.NAME = "EndViewStateSummary"
EndViewStateSummary.CAN_SPEED_UP = true

EndViewStateSummary.on_enter = function (self, params)
	print("[EndViewState] Enter Substate EndViewStateSummary")

	self._params = params
	self.parent = params.parent
	self.game_won = params.game_won
	self.game_mode_key = params.game_mode_key
	local context = params.context
	self._context = context
	self.ui_renderer = context.ui_renderer
	self.ui_top_renderer = context.ui_top_renderer
	self.input_manager = context.input_manager
	self.statistics_db = context.statistics_db
	self.profile_synchronizer = context.profile_synchronizer
	self.rewards = context.rewards
	self.render_settings = {
		alpha_multiplier = 0,
		snap_pixel_positions = true
	}
	self.wwise_world = context.wwise_world
	self.world_previewer = params.world_previewer
	self.platform = PLATFORM
	self._animations = {}
	self._ui_animations = {}
	self.peer_id = context.peer_id
	self._hero_name = context.local_player_hero_name

	self:create_ui_elements(params)

	if params.initial_state then
		self._initial_preview = true
		params.initial_state = nil
	end

	self:_start_transition_animation("on_enter", "transition_enter")

	self._exit_timer = nil
	local level_start = self._context.rewards.level_start
	local _ = level_start[1]
	local start_experience = level_start[2]
	local start_experience_pool = level_start[3]

	self:_setup_essence_presentation()

	self._progress_data = self:_get_total_experience_progress_data(start_experience, start_experience_pool)
	local start_level = ExperienceSettings.get_level(start_experience)
	local current_experience = start_experience + start_experience_pool

	if start_level < ExperienceSettings.max_level then
		current_experience = start_experience
	end

	local current_level, extra_levels = self:_set_current_experience(current_experience)
	self._current_level = current_level
	self._extra_levels = extra_levels
	self._experience_presentation_completed = nil

	self:_play_sound("play_gui_mission_summary_appear")
end

EndViewStateSummary.exit = function (self, direction)
	self._exit_started = true

	self:_start_transition_animation("on_enter", "transition_exit")
	self:_play_sound("play_gui_mission_summary_end")
end

EndViewStateSummary.exit_done = function (self)
	return self._exit_started and self._animations.on_enter == nil
end

EndViewStateSummary.create_ui_elements = function (self, params)
	DO_RELOAD = false
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name
	local entry_widgets = {}
	local entry_widgets_by_name = {}

	for name, widget_definition in pairs(summary_entry_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		entry_widgets[#entry_widgets + 1] = widget
		entry_widgets_by_name[name] = widget
	end

	self._entry_widgets = entry_widgets
	self._entry_widgets_by_name = entry_widgets_by_name

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)
end

EndViewStateSummary._wanted_state = function (self)
	local new_state = self.parent:wanted_menu_state()

	return new_state
end

EndViewStateSummary.set_input_manager = function (self, input_manager)
	self.input_manager = input_manager
end

EndViewStateSummary.on_exit = function (self, params)
	print("[EndViewState] Exit Substate EndViewStateSummary")

	self.ui_animator = nil
end

EndViewStateSummary._update_transition_timer = function (self, dt)
	if not self._transition_timer then
		return
	end

	if self._transition_timer == 0 then
		self._transition_timer = nil
	else
		self._transition_timer = math.max(self._transition_timer - dt, 0)
	end
end

EndViewStateSummary.update = function (self, dt, t)
	if DO_RELOAD then
		self:on_enter(self._params)
	end

	local input_manager = self.input_manager
	local input_service = input_manager:get_service("end_of_level")

	if not self._animations.on_enter and not self._summary_entries then
		self:_initialize_entries()
	end

	self:draw(input_service, dt)
	self:_update_transition_timer(dt)

	local wanted_state = self:_wanted_state()

	if not self._transition_timer and (wanted_state or self._new_state) then
		self.parent:clear_wanted_menu_state()

		return wanted_state or self._new_state
	end

	local parent = self.parent
	local displaying_reward_presentation = parent:displaying_reward_presentation()

	if self._summary_entries and self._summary_entries.complete then
		self:_animate_experience_bar(dt, displaying_reward_presentation)
	end

	if not displaying_reward_presentation then
		self.ui_animator:update(dt)
		self:_animate_summary_entries(dt)
	end

	self:_update_animations(dt)

	local transitioning = self.parent:transitioning()

	if not transitioning and not self._transition_timer then
		self:_handle_input(dt, t)
	end
end

EndViewStateSummary.post_update = function (self, dt, t)
	return
end

EndViewStateSummary._update_animations = function (self, dt)
	for name, animation in pairs(self._ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			self._ui_animations[name] = nil
		end
	end

	local animations = self._animations
	local ui_animator = self.ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	if self.level_up_anim_id and ui_animator:is_animation_completed(self.level_up_anim_id) then
		ui_animator:stop_animation(self.level_up_anim_id)

		self.level_up_anim_id = nil
		local max_level = ExperienceSettings.max_level
		local level = nil

		if self._current_level < max_level then
			level = self._current_level
		else
			level = self._current_level + (self._extra_levels or 0)
		end

		self.parent:present_level_up(self._hero_name, level)
	end
end

EndViewStateSummary._handle_input = function (self, dt, t)
	local widgets_by_name = self._widgets_by_name
end

EndViewStateSummary.draw = function (self, input_service, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local render_settings = self.render_settings

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	local summary_entries = self._summary_entries

	if summary_entries then
		for index, entry in ipairs(summary_entries) do
			local widget = entry.widget

			if widget then
				UIRenderer.draw_widget(ui_renderer, widget)
			end
		end
	end

	UIRenderer.end_pass(ui_renderer)
end

EndViewStateSummary._start_transition_animation = function (self, key, animation_name)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[key] = anim_id
end

EndViewStateSummary._start_animation = function (self, key, animation_name)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings
	}
	local widgets = self._widgets_by_name
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[key] = anim_id
end

EndViewStateSummary._animate_element_by_time = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.function_by_time, target, target_index, from, to, time, math.ease_out_quad)

	return new_animation
end

EndViewStateSummary._animate_element_by_catmullrom = function (self, target, target_index, target_value, p0, p1, p2, p3, time)
	local new_animation = UIAnimation.init(UIAnimation.catmullrom, target, target_index, target_value, p0, p1, p2, p3, time)

	return new_animation
end

EndViewStateSummary._initialize_entries = function (self)
	local summary_entries, experience_gained = self:_get_summary_entries(self.game_won, self.game_mode_key)
	self._summary_entries = summary_entries
end

EndViewStateSummary._get_summary_entries = function (self, game_won, game_mode_key)
	local mission_rewards = self._context.rewards.mission_results
	local entry_widgets = self._entry_widgets
	local entries = {}
	local widget_index = 0
	local total_experience_gained = 0

	for index, mission_reward in ipairs(mission_rewards) do
		widget_index = widget_index % #entry_widgets + 1
		local name = "entry_" .. index
		local text = mission_reward.text
		local experience = mission_reward.experience and math.round(mission_reward.experience)
		local value = mission_reward.value
		local bonus = mission_reward.bonus
		local icon = mission_reward.icon
		local widget = entry_widgets[widget_index]
		local value_text = (experience and tostring(experience)) or (value and tostring(value)) or ""
		local entry = {
			spacing = 8,
			start_counter_sound = true,
			name = name,
			title_text = text and Localize(text),
			experience = experience,
			value = value,
			value_text = value_text,
			bonus = bonus,
			widget = widget,
			icon = icon,
			list_index = index,
			wwise_world = self.wwise_world
		}
		entries[index] = entry

		if experience then
			total_experience_gained = total_experience_gained + experience
		end
	end

	return entries, total_experience_gained
end

EndViewStateSummary._animate_summary_entries = function (self, dt)
	local summary_entries = self._summary_entries

	if not summary_entries or summary_entries.complete then
		if summary_entries and summary_entries.complete and self._is_max_level and not self._experience_presentation_completed then
			self._experience_presentation_completed = true

			self.parent:present_additional_rewards()
		end

		return
	end

	local ui_animator = self.ui_animator
	local enter_animation_name = "summary_entry_initial"
	local exit_animation_name = "summary_entry_text_shadow"

	if self.total_experience_count_anim_id and ui_animator:is_animation_completed(self.total_experience_count_anim_id) then
		ui_animator:stop_animation(self.total_experience_count_anim_id)

		self.total_experience_count_anim_id = nil
	end

	local animations_completed = true

	for index, entry in ipairs(summary_entries) do
		if not entry.animation_completed then
			if not self.summary_entry_enter_anim_id then
				self.summary_entry_enter_anim_id = self.ui_animator:start_animation(enter_animation_name, self._widgets_by_name, scenegraph_definition, entry)
			elseif ui_animator:is_animation_completed(self.summary_entry_enter_anim_id) then
				ui_animator:stop_animation(self.summary_entry_enter_anim_id)

				self.summary_entry_enter_anim_id = nil
				entry.animation_completed = true
				self.total_experience_count_anim_id = self.ui_animator:start_animation("total_experience_increase", self._widgets_by_name, scenegraph_definition, entry)
			end

			animations_completed = false
		end
	end

	summary_entries.complete = animations_completed

	if animations_completed then
	end
end

EndViewStateSummary._get_essence_earned = function (self)
	local essence_data = self._context.rewards.end_of_level_rewards.essence

	if not essence_data then
		return nil
	end

	return essence_data[1].awarded
end

EndViewStateSummary._setup_essence_presentation = function (self)
	local essence_gained = self:_get_essence_earned()
	local has_wom_dlc = Managers.unlock:is_dlc_unlocked("scorpion")
	local draw_essence_presentation = has_wom_dlc and essence_gained ~= nil
	local widgets_by_name = self._widgets_by_name
	local draw_essence_icon = true

	if essence_gained then
		local backend_manger = Managers.backend
		local backend_interface_weaves = backend_manger:get_interface("weaves")
		local essence_amount = backend_interface_weaves:get_essence()
		local total_essence = backend_interface_weaves:get_total_essence()
		local maximum_essence = backend_interface_weaves:get_maximum_essence()

		if maximum_essence < total_essence and maximum_essence > total_essence - essence_gained then
			essence_gained = essence_gained - (maximum_essence - total_essence)
		elseif maximum_essence < total_essence - essence_gained then
			essence_gained = nil
			draw_essence_icon = false
		end

		if essence_gained then
			local essence_total_text = widgets_by_name.essence_total_text
			essence_total_text.content.text = essence_gained
			local essence_gained_width = UIUtils.get_text_width(self.ui_renderer, essence_total_text.style.text, tostring(essence_gained))
			local icon_essence = widgets_by_name.icon_essence
			icon_essence.offset[1] = -essence_gained_width
		end
	end

	widgets_by_name.essence_background.content.visible = draw_essence_presentation
	widgets_by_name.essence_background_frame.content.visible = draw_essence_presentation
	widgets_by_name.essence_background_shadow.content.visible = draw_essence_presentation
	widgets_by_name.essence_background_effect_left.content.visible = draw_essence_presentation
	widgets_by_name.essence_background_effect_right.content.visible = draw_essence_presentation
	widgets_by_name.total_essence_title.content.visible = draw_essence_presentation
	widgets_by_name.icon_essence.content.visible = (draw_essence_icon and draw_essence_presentation) or false
	widgets_by_name.essence_total_text.content.visible = (essence_gained ~= nil and draw_essence_presentation) or false
	widgets_by_name.essence_total_text_max.content.visible = draw_essence_presentation and not draw_essence_icon
end

EndViewStateSummary._get_total_experience_progress_data = function (self, start_experience, start_experience_pool)
	local start_level, start_progress = ExperienceSettings.get_level(start_experience)
	local start_extra_level, start_extra_level_progress = ExperienceSettings.get_extra_level(start_experience_pool)
	local hero_name = self._hero_name
	local end_experience = ExperienceSettings.get_experience(hero_name)
	local end_level, end_progress = ExperienceSettings.get_level(end_experience)
	local end_experience_pool = ExperienceSettings.get_experience_pool(hero_name)
	local end_extra_level, end_extra_levels_progress = ExperienceSettings.get_extra_level(end_experience_pool)
	local total_start_level = start_level + start_extra_level
	local total_end_level = end_level + end_extra_level
	local progress_length = total_end_level - total_start_level + end_progress - start_progress + end_extra_levels_progress - start_extra_level_progress
	local experience_gained = end_experience - start_experience + end_experience_pool - start_experience_pool

	if start_level == ExperienceSettings.max_level then
		start_experience = start_experience + start_experience_pool
		start_progress = start_extra_level_progress
	end

	local min_time = UISettings.summary_screen.bar_progress_min_time
	local max_time = UISettings.summary_screen.bar_progress_max_time
	local time_multiplier = UISettings.summary_screen.bar_progress_experience_time_multiplier
	local time = math.min(math.max(time_multiplier * experience_gained, min_time), max_time)

	return {
		time = 0,
		complete = false,
		current_experience = start_experience,
		experience_to_add = experience_gained,
		total_progress = progress_length,
		start_progress = start_progress,
		total_time = time
	}
end

EndViewStateSummary._animate_experience_bar = function (self, dt, displaying_reward_presentation)
	local progress_data = self._progress_data

	if not progress_data or progress_data.complete or displaying_reward_presentation or self.level_up_anim_id or self._experience_presentation_completed then
		return
	end

	if not self._experience_bar_started then
		self:_play_sound("play_gui_mission_summary_experience_bar_begin")

		self._experience_bar_started = true
	end

	local current_time = progress_data.time
	local total_time = progress_data.total_time
	local time_progress = current_time / total_time
	local smoothstep_progress = math.smoothstep(time_progress, 0, 1)
	current_time = math.min(current_time + dt, total_time)
	progress_data.time = current_time
	local current_experience = progress_data.current_experience
	local experience_to_add = progress_data.experience_to_add
	local current_experience_to_add = math.floor(experience_to_add * smoothstep_progress)
	local presentation_experience = math.floor(current_experience + current_experience_to_add)
	local level_reached, extra_levels = self:_set_current_experience(presentation_experience)
	local has_reached_level = level_reached ~= self._current_level

	if self._extra_levels ~= nil then
		has_reached_level = has_reached_level or extra_levels ~= self._extra_levels
	end

	if has_reached_level then
		self._current_level = level_reached
		self._extra_levels = extra_levels

		self:_play_sound("play_gui_mission_summary_experience_bar_end")

		self.level_up_anim_id = self.ui_animator:start_animation("level_up", self._widgets_by_name, scenegraph_definition, {
			wwise_world = self.wwise_world
		})
	end

	if current_time == total_time then
		progress_data.complete = true
		self._experience_presentation_completed = true

		self:_play_sound("play_gui_mission_summary_experience_bar_end")
		self.parent:present_additional_rewards()
	end
end

EndViewStateSummary._set_current_experience = function (self, current_experience)
	local level, progress = ExperienceSettings.get_level(current_experience)
	local extra_levels = 0

	if level == ExperienceSettings.max_level then
		local overflow_pool = current_experience - ExperienceSettings.max_experience
		extra_levels, progress = ExperienceSettings.get_extra_level(overflow_pool)
	end

	local next_level = math.clamp(level + 1, 0, ExperienceSettings.max_level)

	if (self._current_level and self._current_level < level) or (self._extra_levels and self._extra_levels < extra_levels) then
		progress = 1
	end

	local widgets_by_name = self._widgets_by_name
	local experience_bar = widgets_by_name.experience_bar
	local content = experience_bar.content
	local style = experience_bar.style
	local default_size = style.experience_bar.default_size
	style.experience_bar.size[1] = default_size[1] * progress
	style.experience_bar_end.offset[1] = default_size[1] * progress

	if progress == 1 and level ~= next_level then
		widgets_by_name.current_level_text.content.text = tostring(level - 1)
		widgets_by_name.next_level_text.content.text = tostring(next_level - 1)
	else
		widgets_by_name.current_level_text.content.text = tostring(level)
		widgets_by_name.next_level_text.content.text = tostring(next_level)
	end

	WwiseWorld.set_global_parameter(self.wwise_world, "summary_meter_progress", progress)

	return level, extra_levels
end

EndViewStateSummary.done = function (self)
	return self._experience_presentation_completed and self._summary_entries.complete
end

EndViewStateSummary._play_sound = function (self, event)
	self.parent:play_sound(event)
end

return

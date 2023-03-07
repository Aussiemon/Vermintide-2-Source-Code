local definitions = local_require("scripts/ui/views/level_end/states/definitions/end_view_state_chest_definitions")
local widget_definitions = definitions.widgets
local score_entry_widget_definitions = definitions.score_entry_widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local create_bar_divider = definitions.create_bar_divider
local DO_RELOAD = false
local CHEST_PRESENTATION_ZOOM_WAIT_TIME = 2
local CHEST_PRESENTATION_ZOOM_TIME = 0.8
local CHEST_PRESENTATION_BONUS_WAIT_TIME = 1
local CHEST_PRESENTATION_BONUS_TIME = 2
local CHEST_PRESENTATION_EXIT_TIME = 1
local chest_idle_animations = {
	"loot_chest_jump",
	"loot_chest_jump_02"
}
EndViewStateChest = class(EndViewStateChest)
EndViewStateChest.NAME = "EndViewStateChest"
EndViewStateChest.CAN_SPEED_UP = true

EndViewStateChest.on_enter = function (self, params)
	print("[PlayState] Enter Substate EndViewStateChest")

	self.parent = params.parent
	self.game_won = params.game_won
	self.game_mode_key = params.game_mode_key
	self.hero_name = params.hero_name
	local context = params.context
	self._context = context
	self.ui_renderer = context.ui_renderer
	self.ui_top_renderer = context.ui_top_renderer
	self.input_manager = context.input_manager
	self.statistics_db = context.statistics_db
	self.rewards = context.rewards
	self.render_settings = {
		alpha_multiplier = 0,
		snap_pixel_positions = true
	}
	self._score_presentation_queue = {}
	self._total_score = 0
	self.wwise_world = context.wwise_world
	self.world_previewer = params.world_previewer
	self.platform = PLATFORM
	self._animations = {}
	self._ui_animations = {}
	self._units = {}

	self:create_ui_elements(params)
	self:_set_presentation_progress(0, true)

	if params.initial_state then
		self._initial_preview = true
		params.initial_state = nil
	end

	self:_start_transition_animation("on_enter", "transition_enter")

	self._exit_timer = nil
	self.chest_settings = {
		{
			text = "Chest Tier 1",
			score_requirement = LootChestData.score_thresholds_per_chest[1],
			total_score = LootChestData.score_thresholds[1]
		},
		{
			text = "Chest Tier 2",
			score_requirement = LootChestData.score_thresholds_per_chest[2],
			total_score = LootChestData.score_thresholds[2]
		},
		{
			text = "Chest Tier 3",
			score_requirement = LootChestData.score_thresholds_per_chest[3],
			total_score = LootChestData.score_thresholds[3]
		},
		{
			text = "Chest Tier 4",
			score_requirement = LootChestData.score_thresholds_per_chest[4],
			total_score = LootChestData.score_thresholds[4]
		},
		{
			text = "Chest Tier 5",
			score_requirement = LootChestData.score_thresholds_per_chest[5],
			total_score = LootChestData.score_thresholds[5]
		},
		{
			text = "Chest Tier 6",
			score_requirement = LootChestData.score_thresholds_per_chest[6],
			total_score = LootChestData.score_thresholds[6]
		}
	}
	local difficulty_key = context.difficulty
	local chest_settings = LootChestData.chests_by_category[difficulty_key]
	local chest_unit_names = chest_settings.chest_unit_names
	local display_names = chest_settings.display_names

	for index, settings in ipairs(self.chest_settings) do
		settings.unit_name = chest_unit_names[index]
		settings.display_name = display_names[index]
	end

	self:_play_sound("play_gui_mission_summary_chest_uppgrade_amb_begin")
end

EndViewStateChest.exit = function (self, direction)
	self._exit_started = true

	self:_start_transition_animation("on_enter", "transition_exit")
	self:_play_sound("play_gui_mission_summary_chest_uppgrade_amb_end")
end

EndViewStateChest.exit_done = function (self)
	return self._exit_started and self._animations.on_enter == nil
end

EndViewStateChest.create_ui_elements = function (self, params)
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
	local score_widgets = {}

	for _, widget_definition in ipairs(score_entry_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		score_widgets[#score_widgets + 1] = widget
	end

	self._score_widgets = score_widgets
	self._divider_widgets = {}

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)
	local score_entry_bg_left = widgets_by_name.score_entry_bg_left
	local score_entry_bg_right = widgets_by_name.score_entry_bg_right
	local score_entry_texture = widgets_by_name.score_entry_texture
	local bg_left_style = score_entry_bg_left.style.texture_id
	local bg_right_style = score_entry_bg_right.style.texture_id
	local icon_style = score_entry_texture.style.texture_id
	bg_left_style.color[1] = 0
	bg_right_style.color[1] = 0
	icon_style.color[1] = 0

	self:_initialize_score_topics()
end

EndViewStateChest._initialize_score_topics = function (self)
	local score_widgets = self._score_widgets
	local chest_upgrade_score_topics = UISettings.chest_upgrade_score_topics[self.game_mode_key] or UISettings.chest_upgrade_score_topics.default
	local num_score_topics = #chest_upgrade_score_topics
	self._num_score_topics = num_score_topics
	self._score_topics = {}
	local spacing = -10

	for index, settings in ipairs(chest_upgrade_score_topics) do
		local widget = score_widgets[index]
		local name = settings.name
		local texture = settings.texture
		local display_name = settings.display_name
		widget.content.text = Localize(display_name)
		widget.content.texture_id = texture
		widget.content.texture_id_glow = texture .. "_glow"
		widget.content.name = name
		local scenegraph_id = widget.scenegraph_id
		local widget_height = scenegraph_definition[scenegraph_id].size[2]
		widget.offset[2] = -(widget_height + spacing) * (index - 1)
		self._score_topics[#self._score_topics + 1] = name
	end
end

EndViewStateChest._wanted_state = function (self)
	local new_state = self.parent:wanted_menu_state()

	return new_state
end

EndViewStateChest.set_input_manager = function (self, input_manager)
	self.input_manager = input_manager
end

EndViewStateChest.on_exit = function (self, params)
	print("[PlayState] Exit Substate EndViewStateChest")

	self.ui_animator = nil
end

EndViewStateChest._update_transition_timer = function (self, dt)
	if not self._transition_timer then
		return
	end

	if self._transition_timer == 0 then
		self._transition_timer = nil
	else
		self._transition_timer = math.max(self._transition_timer - dt, 0)
	end
end

EndViewStateChest.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false
		local units = self._units
		local world = self:_get_viewport_world()

		if world then
			for unit_name, unit in pairs(units) do
				World.destroy_unit(world, unit)
			end

			table.clear(units)
		end

		self._current_chest_unit_name = nil
		self._spawned_chest_index = nil
		self._current_chest_enter_time = nil
		self._presentation_started = false
		self._entry_duration = 0
		self._current_entry_display_index = nil
		self._total_score = 0
		self._animations = {}
		self._ui_animations = {}
		self._score_entries = {}

		self:create_ui_elements()

		self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)
		self.chest_settings = {
			{
				text = "Chest Tier 1",
				score_requirement = LootChestData.score_thresholds_per_chest[1],
				total_score = LootChestData.score_thresholds[1]
			},
			{
				text = "Chest Tier 2",
				score_requirement = LootChestData.score_thresholds_per_chest[2],
				total_score = LootChestData.score_thresholds[2]
			},
			{
				text = "Chest Tier 3",
				score_requirement = LootChestData.score_thresholds_per_chest[3],
				total_score = LootChestData.score_thresholds[3]
			},
			{
				text = "Chest Tier 4",
				score_requirement = LootChestData.score_thresholds_per_chest[4],
				total_score = LootChestData.score_thresholds[4]
			},
			{
				text = "Chest Tier 5",
				score_requirement = LootChestData.score_thresholds_per_chest[5],
				total_score = LootChestData.score_thresholds[5]
			},
			{
				text = "Chest Tier 6",
				score_requirement = LootChestData.score_thresholds_per_chest[6],
				total_score = LootChestData.score_thresholds[6]
			}
		}
		local difficulty_key = self._context.difficulty
		local chest_settings = LootChestData.chests_by_category[difficulty_key]
		local chest_unit_names = chest_settings.chest_unit_names
		local display_names = chest_settings.display_names

		for index, settings in ipairs(self.chest_settings) do
			settings.unit_name = chest_unit_names[index]
			settings.display_name = display_names[index]
		end
	end

	if not self._presentation_started then
		self:_start_presentation(t)

		self._presentation_started = true
	end

	self:_animate_score_entries(dt, t)

	local input_manager = self.input_manager
	local input_service = input_manager:get_service("end_of_level")

	if self._exit_started then
		local units = self._units
		local world = self:_get_viewport_world()

		for unit_name, unit in pairs(units) do
			World.destroy_unit(world, unit)
		end

		table.clear(units)
	end

	self:draw(input_service, dt)
	self:_update_transition_timer(dt)

	local wanted_state = self:_wanted_state()

	if not self._transition_timer and (wanted_state or self._new_state) then
		self.parent:clear_wanted_menu_state()

		return wanted_state or self._new_state
	end

	self:_update_chest_zoom_wait_time(dt, t)
	self:_update_chest_zoom_time(dt, t)
	self:_update_chest_bonus_time(dt, t)
	self:_update_chest_exit_time(dt, t)

	if self._ready_to_exit and not self._exit_timer and not self.parent:displaying_reward_presentation() then
		self._exit_timer = 1.5
	end

	self:_update_current_chest_enter(dt, t)
	self.ui_animator:update(dt)
	self:_update_animations(dt)
	self:_animate_score_progress(dt, t)

	if self._exit_timer then
		self._exit_timer = math.max(self._exit_timer - dt, 0)

		if self._exit_timer == 0 then
			self._score_entry_presentation_done = true
		end
	end

	local transitioning = self.parent:transitioning()

	if not transitioning and not self._transition_timer then
		self:_handle_input(dt, t)
	end
end

EndViewStateChest.post_update = function (self, dt, t)
	return
end

EndViewStateChest._update_animations = function (self, dt)
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

	if self.score_presentation_anim_id and ui_animator:is_animation_completed(self.score_presentation_anim_id) then
		ui_animator:stop_animation(self.score_presentation_anim_id)

		self.score_presentation_anim_id = nil
	end
end

EndViewStateChest._handle_input = function (self, dt, t)
	local widgets_by_name = self._widgets_by_name
end

EndViewStateChest.draw = function (self, input_service, dt)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local render_settings = self.render_settings

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local alpha_multiplier = render_settings.alpha_multiplier

	for _, widget in ipairs(self._widgets) do
		if widget.alpha_multiplier then
			render_settings.alpha_multiplier = widget.alpha_multiplier
		end

		UIRenderer.draw_widget(ui_renderer, widget)

		render_settings.alpha_multiplier = alpha_multiplier
	end

	local divider_widgets = self._divider_widgets

	if divider_widgets then
		for _, widget in ipairs(divider_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	local num_score_topics = self._num_score_topics
	local score_widgets = self._score_widgets

	if num_score_topics and score_widgets then
		for i = 1, num_score_topics do
			local widget = score_widgets[i]

			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_renderer)
end

EndViewStateChest._start_transition_animation = function (self, key, animation_name)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[key] = anim_id
end

EndViewStateChest._animate_element_by_time = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.function_by_time, target, target_index, from, to, time, math.ease_out_quad)

	return new_animation
end

EndViewStateChest._animate_element_by_catmullrom = function (self, target, target_index, target_value, p0, p1, p2, p3, time)
	local new_animation = UIAnimation.init(UIAnimation.catmullrom, target, target_index, target_value, p0, p1, p2, p3, time)

	return new_animation
end

EndViewStateChest.done = function (self)
	return self._score_entry_presentation_done
end

EndViewStateChest._set_entry_text_progress = function (self, progress)
	local internal_progress = 1 - progress
	internal_progress = (-4 * (progress - 0.5) * (progress - 0.5) + 1) * 0.5
	local default_entry_scenegraph = scenegraph_definition.score_entry_texture
	local entry_scenegraph = self.ui_scenegraph.score_entry_texture
	entry_scenegraph.local_position[1] = default_entry_scenegraph.position[1] + 200 * progress
	local alpha = internal_progress * 255
	local widgets_by_name = self._widgets_by_name
	local score_entry_texture_widget = widgets_by_name.score_entry_texture
	local score_entry_text_widget = widgets_by_name.score_entry_text
	score_entry_text_widget.style.text.text_color[1] = alpha
	score_entry_texture_widget.style.texture_id.color[1] = alpha
end

EndViewStateChest._display_chest_by_settings_index = function (self, index, t, instant_spawn)
	local settings = self.chest_settings[index]
	local unit_name = settings.unit_name
	local display_name = settings.display_name
	local unit = self:_spawn_chest_unit(unit_name, instant_spawn, t)
	self._units[unit_name] = unit
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.chest_title.content.text = Localize(display_name)
	widgets_by_name.chest_sub_title.content.text = Localize("loot_chest")
	local animation_name = "chest_title_update"

	if instant_spawn then
		animation_name = "chest_title_initialize"
		local difficulty_key = self._context.difficulty
		local sound_event = "play_gui_chest_appear_" .. difficulty_key .. "_" .. tostring(index)

		self:_play_sound(sound_event)
	else
		self:_play_sound("play_gui_mission_summary_chest_upgrade")
	end

	self.ui_animator:start_animation(animation_name, self._widgets_by_name, scenegraph_definition, {
		wwise_world = self.wwise_world
	})
end

EndViewStateChest._spawn_chest_unit = function (self, unit_name, instant_spawn, t)
	if self._current_chest_unit_name then
		self._current_chest_enter_time = t + 0.5
		local unit = self._units[self._current_chest_unit_name]

		Unit.flow_event(unit, "loot_chest_upgrade_out")
	end

	local world = self:_get_viewport_world()
	local unit = World.spawn_unit(world, unit_name)

	Unit.set_unit_visibility(unit, instant_spawn == true)

	local link_unit = self.parent:get_world_link_unit()

	World.link_unit(world, unit, 0, link_unit, 0)

	if instant_spawn then
		local anim_name = "loot_chest_enter"

		Unit.flow_event(unit, anim_name)
		self.parent:set_camera_zoom(0)
		self:_set_bar_alpha_by_progress(1)
	else
		self.parent:add_camera_shake(nil, t, nil)
	end

	self._current_chest_unit_name = unit_name

	return unit
end

EndViewStateChest._update_current_chest_enter = function (self, dt, t)
	if not self._current_chest_enter_time then
		return
	end

	if self._current_chest_enter_time <= t then
		self._current_chest_enter_time = nil

		if self._current_chest_unit_name then
			local unit = self._units[self._current_chest_unit_name]

			Unit.set_unit_visibility(unit, true)
			Unit.flow_event(unit, "loot_chest_upgrade_in")
		end
	end
end

EndViewStateChest._trigger_unit_flow_event = function (self, unit, event_name)
	if unit and Unit.alive(unit) then
		Unit.flow_event(unit, event_name)
	end
end

EndViewStateChest._get_viewport_world = function (self)
	return self.parent:get_viewport_world()
end

EndViewStateChest._start_presentation = function (self, t)
	local instant_spawn = true
	local start_settings_index = 1
	self._spawned_chest_index = start_settings_index

	self:_display_chest_by_settings_index(start_settings_index, t, instant_spawn)

	local entry_id = 0
	local context = self._context
	local end_of_level_rewards = context.rewards.end_of_level_rewards
	local chest = end_of_level_rewards.chest
	local score_breakdown = chest.score_breakdown

	for _, score_topic in ipairs(self._score_topics) do
		local score_part = score_breakdown[score_topic]

		if score_part and score_part.score > 0 then
			local score = score_part.score
			local amount = score_part.amount

			self:_add_score({
				id = entry_id,
				score = score,
				name = score_topic,
				amount = amount
			})

			entry_id = entry_id + 1
		end
	end

	if entry_id == 0 then
		self._chest_zoom_wait_duration = CHEST_PRESENTATION_ZOOM_WAIT_TIME
	end
end

EndViewStateChest._add_score = function (self, data)
	if data.score == 0 then
		return
	end

	local score_widgets = self._score_widgets
	self._score_entries = self._score_entries or {}
	local widget = nil

	for _, score_widget in ipairs(score_widgets) do
		if score_widget.content.name == data.name then
			widget = score_widget

			break
		end
	end

	local widget_index = #self._score_entries + 1
	local entry = {
		entry_animation_completed = false,
		entry_index = widget_index,
		data = data,
		widget = widget,
		wwise_world = self.wwise_world
	}
	self._score_entries[widget_index] = entry
	local amount = data.amount

	if amount then
		widget.content.text = widget.content.text .. "\n x" .. tostring(amount)
	end
end

EndViewStateChest._animate_score_entries = function (self, dt)
	local score_entries = self._score_entries

	if not score_entries or score_entries.complete then
		return
	end

	local ui_animator = self.ui_animator
	local enter_animation_name = "score_entry_add"
	local exit_animation_name = "summary_entry_text_shadow"
	local animations_completed = true

	for index, entry in ipairs(score_entries) do
		if not entry.entry_animation_completed then
			if not self.score_entry_enter_anim_id then
				self.score_entry_enter_anim_id = self.ui_animator:start_animation(enter_animation_name, self._widgets_by_name, scenegraph_definition, entry)
			elseif ui_animator:is_animation_completed(self.score_entry_enter_anim_id) then
				ui_animator:stop_animation(self.score_entry_enter_anim_id)

				self.score_entry_enter_anim_id = nil
				entry.entry_animation_completed = true
			end

			animations_completed = false
		end
	end

	score_entries.complete = animations_completed

	if animations_completed and self._score_widgets then
		self:_display_next_score_entry()
	end
end

EndViewStateChest._display_next_score_entry = function (self)
	local score_entries = self._score_entries
	self._current_entry_display_index = (self._current_entry_display_index or 0) + 1
	local entry = score_entries[self._current_entry_display_index]
	self.score_presentation_anim_id = self.ui_animator:start_animation("score_presentation_start", self._widgets_by_name, scenegraph_definition, entry)
	self._current_entry_data = entry.data
	self._entry_duration = 0
end

EndViewStateChest._start_entry_animation = function (self, key)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings
	}
	local widgets = self._widgets_by_name
	local anim_id = self.ui_animator:start_animation("score_entry", widgets, scenegraph_definition, params)
	self._animations[key] = anim_id
end

EndViewStateChest._animate_score_progress = function (self, dt, t)
	local entry_duration = self._entry_duration
	local current_chest_enter_time = self._current_chest_enter_time

	if not entry_duration or current_chest_enter_time or self.score_entry_enter_anim_id or self.score_presentation_anim_id then
		return
	end

	local num_chest_upgrades = #self.chest_settings
	local score_entries = self._score_entries
	local current_entry_display_index = self._current_entry_display_index
	local entry = score_entries[current_entry_display_index]
	local entry_data = entry.data
	local max_score = LootChestData.max_score
	local total_score = self._total_score or 0
	local score_left = max_score - total_score
	local entry_score = entry_data.score
	local actual_entry_score = math.clamp(entry_data.score, 0, max_score - total_score)
	local min_time = UISettings.chest_upgrade_score_topics_min_duration or 0.5
	local max_time = UISettings.chest_upgrade_score_topics_max_duration or 7
	local duration_fraction = score_left > 0 and math.min(actual_entry_score / score_left, 1) or 0
	local duration = math.clamp(duration_fraction * max_time, min_time, max_time)
	entry_duration = math.min(entry_duration + dt, duration)
	local entry_progress = entry_duration / duration
	local default_multiplier = 0.5
	local score_per_chest = LootChestData.score_per_chest
	local bars_fraction = score_per_chest / entry_score
	local speed_multiplier = default_multiplier * bars_fraction
	local entry_animation_progress = math.easeOutCubic(entry_progress)
	local entry_presentation_score = actual_entry_score * entry_animation_progress
	local entry_presentation_total_score = math.min(total_score + entry_presentation_score, max_score)
	local max_upgraded = entry_presentation_total_score == max_score

	if max_upgraded then
		entry_animation_progress = 1
	end

	local current_chest_settings, current_chest_settings_index = self:_get_chest_settings_by_total_score(entry_presentation_total_score)
	local animation_progress = 0
	local spawn_next_chest = max_upgraded and self._spawned_chest_index < num_chest_upgrades or current_chest_settings_index and current_chest_settings_index - 1 ~= self._spawned_chest_index

	if spawn_next_chest then
		animation_progress = 1
		local spawn_index = max_upgraded and num_chest_upgrades or current_chest_settings_index - 1
		self._spawned_chest_index = spawn_index

		self:_display_chest_by_settings_index(spawn_index, t)
	elseif current_chest_settings then
		local current_total_score = current_chest_settings.total_score
		local current_score_requirement = current_chest_settings.score_requirement
		local previous_total_score = current_total_score - current_score_requirement
		animation_progress = (entry_presentation_total_score - previous_total_score) / current_score_requirement
	else
		animation_progress = 1
	end

	WwiseWorld.set_global_parameter(self.wwise_world, "chest_upgrade_progress", entry_animation_progress)

	if not self._upgrade_sound_started and entry_animation_progress < 1 then
		WwiseWorld.trigger_event(self.wwise_world, "play_gui_mission_summary_chest_upgrade_meter_begin")

		self._upgrade_sound_started = true
	end

	if (animation_progress == 1 or entry_animation_progress == 1) and self._upgrade_sound_started then
		WwiseWorld.trigger_event(self.wwise_world, "play_gui_mission_summary_chest_upgrade_meter_end")

		self._upgrade_sound_started = false
	end

	if entry_animation_progress == 1 then
		self._entry_duration = nil
		self._total_score = math.min((self._total_score or 0) + actual_entry_score, max_score)
		local num_score_entries = #score_entries

		if current_entry_display_index == num_score_entries then
			local wait_with_zoom = animation_progress == 1
			self._chest_zoom_wait_duration = wait_with_zoom and 0 or CHEST_PRESENTATION_ZOOM_WAIT_TIME
		else
			self:_display_next_score_entry()
		end

		self._current_bar_total_score_progress = animation_progress

		self.ui_animator:start_animation("score_presentation_end", self._widgets_by_name, scenegraph_definition, entry)
	else
		if self._current_bar_total_score_progress and animation_progress < self._current_bar_total_score_progress then
			animation_progress = 0
			self._current_bar_total_score_progress = nil
		end

		self._entry_duration = entry_duration
	end

	self:_set_presentation_progress(animation_progress)
end

EndViewStateChest._get_chest_settings_by_total_score = function (self, score)
	for index, settings in ipairs(self.chest_settings) do
		local total_score = settings.total_score

		if score < total_score then
			return settings, index
		end
	end
end

EndViewStateChest._set_presentation_progress = function (self, presentation_progress, ignore_sound)
	local widgets_by_name = self._widgets_by_name
	local score_bar_widget = widgets_by_name.score_bar
	local content = score_bar_widget.content.texture_id
	local style = score_bar_widget.style.texture_id
	local score_bar_scenegraph_id = score_bar_widget.scenegraph_id
	local score_bar_scenegraph = self.ui_scenegraph[score_bar_scenegraph_id]
	local score_bar_definiton = scenegraph_definition[score_bar_scenegraph_id]
	local score_bar_default_size = score_bar_definiton.size
	score_bar_scenegraph.size[1] = math.ceil(score_bar_default_size[1] * presentation_progress)

	if not ignore_sound then
		WwiseWorld.set_global_parameter(self.wwise_world, "summary_meter_progress", presentation_progress)
	end
end

EndViewStateChest._update_chest_zoom_wait_time = function (self, dt, t)
	local chest_zoom_wait_duration = self._chest_zoom_wait_duration

	if not chest_zoom_wait_duration then
		return
	end

	chest_zoom_wait_duration = chest_zoom_wait_duration + dt
	local progress = math.min(chest_zoom_wait_duration / CHEST_PRESENTATION_ZOOM_WAIT_TIME, 1)

	if progress == 1 then
		self._chest_zoom_wait_duration = nil
		self._chest_zoom_duration = 0
	else
		self._chest_zoom_wait_duration = chest_zoom_wait_duration
	end
end

EndViewStateChest._update_chest_zoom_time = function (self, dt, t)
	local chest_zoom_duration = self._chest_zoom_duration

	if not chest_zoom_duration then
		return
	end

	chest_zoom_duration = chest_zoom_duration + dt
	local progress = math.min(chest_zoom_duration / CHEST_PRESENTATION_ZOOM_TIME, 1)
	local animation_progress = math.easeOutCubic(progress)

	self.parent:set_camera_zoom(animation_progress)

	if progress == 1 then
		self._chest_zoom_duration = nil
		self._chest_wait_exit_duration = 0
	else
		self._chest_zoom_duration = chest_zoom_duration
	end
end

EndViewStateChest._update_chest_bonus_time = function (self, dt, t)
	local chest_bonus_duration = self._chest_bonus_duration

	if not chest_bonus_duration then
		return
	end

	chest_bonus_duration = chest_bonus_duration + dt
	local progress = math.min(chest_bonus_duration / CHEST_PRESENTATION_BONUS_TIME, 1)

	if progress == 1 then
		self._chest_bonus_duration = nil
		self._chest_wait_exit_duration = 0
	else
		self._chest_bonus_duration = chest_bonus_duration
	end
end

EndViewStateChest._update_chest_exit_time = function (self, dt, t)
	local chest_wait_exit_duration = self._chest_wait_exit_duration

	if not chest_wait_exit_duration then
		return
	end

	chest_wait_exit_duration = chest_wait_exit_duration + dt
	local progress = math.min(chest_wait_exit_duration / CHEST_PRESENTATION_EXIT_TIME, 1)

	if progress == 1 then
		self.parent:present_chest_rewards()

		self._ready_to_exit = true
		self._chest_wait_exit_duration = nil
	else
		self._chest_wait_exit_duration = chest_wait_exit_duration
	end
end

EndViewStateChest._set_bar_alpha_by_progress = function (self, progress)
	local widgets_by_name = self._widgets_by_name
	local bar_bg = widgets_by_name.bar_bg
	local score_bar = widgets_by_name.score_bar
	local score_bar_fg = widgets_by_name.score_bar_fg
	bar_bg.alpha_multiplier = progress
	score_bar.alpha_multiplier = progress
	score_bar_fg.alpha_multiplier = progress
end

EndViewStateChest._play_sound = function (self, event)
	self.parent:play_sound(event)
end

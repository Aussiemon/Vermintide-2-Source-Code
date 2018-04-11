local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_options_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local DO_RELOAD = false
local HERO_POWER_EFFECT_DURATION = 1
HeroWindowOptions = class(HeroWindowOptions)
HeroWindowOptions.NAME = "HeroWindowOptions"
HeroWindowOptions.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate HeroWindowOptions")

	self.parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self.ui_renderer = ingame_ui_context.ui_top_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.statistics_db = ingame_ui_context.statistics_db
	self.render_settings = {
		snap_pixel_positions = true
	}
	local player_manager = Managers.player
	local local_player = player_manager.local_player(player_manager)
	self._stats_id = local_player.stats_id(local_player)
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self.hero_name = params.hero_name
	self.career_index = params.career_index
	self.profile_index = params.profile_index
	local hero_name = self.hero_name
	local career_index = self.career_index
	local profile_index = FindProfileIndex(hero_name)
	local profile = SPProfiles[profile_index]
	local career_data = profile.careers[career_index]
	local career_name = career_data.name
	self._animations = {}
	self._ui_animations = {}

	self.create_ui_elements(self, params, offset)

	self.conditions_params = {
		hero_name = self.hero_name,
		career_name = career_name
	}
	local widgets_by_name = self._widgets_by_name
	self.button_widgets_by_news_template = {
		equipment = widgets_by_name.game_option_1,
		talent = widgets_by_name.game_option_2,
		cosmetics = widgets_by_name.game_option_4,
		loot_chest = widgets_by_name.game_option_5
	}

	return 
end
HeroWindowOptions.create_ui_elements = function (self, params, offset)
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

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self.ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end

	widgets_by_name.game_option_4.content.button_hotspot.disable_button = false

	return 
end
HeroWindowOptions.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate HeroWindowOptions")

	self.ui_animator = nil

	return 
end
HeroWindowOptions.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self.create_ui_elements(self)
	end

	self._sync_news(self, dt, t)
	self._update_selected_option(self)
	self._update_loadout_sync(self)
	self._update_animations(self, dt)
	self._update_hero_power_effect(self, dt)
	self.draw(self, dt)

	return 
end
HeroWindowOptions.post_update = function (self, dt, t)
	self._handle_input(self, dt, t)

	return 
end
HeroWindowOptions._update_animations = function (self, dt)
	self._update_game_options_hover_effect(self, dt)

	local ui_animations = self._ui_animations
	local animations = self._animations
	local ui_animator = self.ui_animator

	for name, animation in pairs(self._ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			self._ui_animations[name] = nil
		end
	end

	ui_animator.update(ui_animator, dt)

	for animation_name, animation_id in pairs(animations) do
		if ui_animator.is_animation_completed(ui_animator, animation_id) then
			ui_animator.stop_animation(ui_animator, animation_id)

			animations[animation_name] = nil
		end
	end

	return 
end
HeroWindowOptions._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		if not hotspot.is_selected then
			return true
		end
	end

	return 
end
HeroWindowOptions._is_stepper_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot_left = content.button_hotspot_left
	local hotspot_right = content.button_hotspot_right

	if hotspot_left.on_release then
		hotspot_left.on_release = false

		return true, -1
	elseif hotspot_right.on_release then
		hotspot_right.on_release = false

		return true, 1
	end

	return 
end
HeroWindowOptions._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter and not hotspot.is_selected
end
HeroWindowOptions._is_button_hover_exit = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_exit and not hotspot.is_selected
end
HeroWindowOptions._is_button_selected = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.is_selected
end
HeroWindowOptions._handle_input = function (self, dt, t)
	local widgets_by_name = self._widgets_by_name

	if self._is_button_pressed(self, widgets_by_name.game_option_1) then
		self.parent:set_layout(1)
	elseif self._is_button_pressed(self, widgets_by_name.game_option_2) then
		self.parent:set_layout(2)
	elseif self._is_button_pressed(self, widgets_by_name.game_option_3) then
		self.parent:set_layout(3)
	elseif self._is_button_pressed(self, widgets_by_name.game_option_4) then
		self.parent:set_layout(4)
	elseif self._is_button_pressed(self, widgets_by_name.game_option_5) then
		self._play_sound(self, "play_gui_lobby_button_00_custom")
		self.parent:requested_screen_change_by_name("loot")
	end

	return 
end
HeroWindowOptions._update_game_options_hover_effect = function (self, dt)
	local widgets_by_name = self._widgets_by_name
	local widget_prefix = "game_option_"

	for i = 1, 4, 1 do
		local widget_name = widget_prefix .. i
		local widget = widgets_by_name[widget_name]

		self._animate_option_button(self, widget, dt)

		if self._is_button_hover_enter(self, widget) then
			self._play_sound(self, "play_gui_equipment_button_hover")
		end
	end

	UIWidgetUtils.animate_default_button(widgets_by_name.game_option_5, dt)

	if self._is_button_hover_enter(self, widgets_by_name.game_option_5) or self._is_button_hover_enter(self, widgets_by_name.hero_power_tooltip) then
		self._play_sound(self, "play_gui_equipment_button_hover")
	end

	return 
end
HeroWindowOptions._set_selected_option = function (self, index)
	local widgets_by_name = self._widgets_by_name
	local widget_prefix = "game_option_"

	for i = 1, 4, 1 do
		local widget_name = widget_prefix .. i
		local widget = widgets_by_name[widget_name]
		widget.content.button_hotspot.is_selected = index == i
	end

	return 
end
HeroWindowOptions._update_selected_option = function (self)
	local parent = self.parent
	local selected_index = parent.get_selected_game_mode_index(parent)

	if selected_index ~= self._selected_index then
		self._set_selected_option(self, selected_index)

		self._selected_index = selected_index
	end

	return 
end
HeroWindowOptions._update_loadout_sync = function (self)
	local parent = self.parent
	local loadout_sync_id = parent.loadout_sync_id

	if loadout_sync_id ~= self._loadout_sync_id or self._has_hero_level_changed(self) then
		self._calculate_power_level(self)
		self._update_experience_presentation(self)
		self._update_hero_portrait_frame(self)

		self._loadout_sync_id = loadout_sync_id
	end

	return 
end
HeroWindowOptions._has_hero_level_changed = function (self)
	local experience = ExperienceSettings.get_experience(self.hero_name)
	local level = ExperienceSettings.get_level(experience)

	if level ~= self._hero_level then
		return true
	end

	return 
end
HeroWindowOptions._update_experience_presentation = function (self)
	local widgets_by_name = self._widgets_by_name
	local experience = ExperienceSettings.get_experience(self.hero_name)
	local level, progress, _, extra_levels = ExperienceSettings.get_level(experience)
	local is_max_level = level == ExperienceSettings.max_level
	local experience_bar_default_size = scenegraph_definition.experience_bar.size
	local experience_bar_size = self.ui_scenegraph.experience_bar.size
	experience_bar_size[1] = math.ceil(experience_bar_default_size[1] * progress)
	local text = Localize("level") .. " " .. tostring(level)

	if is_max_level and extra_levels and 0 < extra_levels then
		text = text .. " (+" .. tostring(extra_levels) .. ")"
	end

	widgets_by_name.level_text.content.text = text
	self._hero_level = level

	return 
end
HeroWindowOptions._calculate_power_level = function (self)
	local hero_name = self.hero_name
	local career_index = self.career_index
	local profile_index = FindProfileIndex(hero_name)
	local profile = SPProfiles[profile_index]
	local career_data = profile.careers[career_index]
	local career_name = career_data.name
	local total_power_level = BackendUtils.get_total_power_level(hero_name, career_name)
	local presentable_hero_power_level = UIUtils.presentable_hero_power_level(total_power_level)
	local widgets_by_name = self._widgets_by_name
	local content = widgets_by_name.power_text.content
	local play_effect = content.power and content.power < presentable_hero_power_level

	if play_effect then
		self._hero_power_effect_time = HERO_POWER_EFFECT_DURATION
	end

	content.power = presentable_hero_power_level
	content.text = tostring(presentable_hero_power_level)

	return 
end
local power_default_color = Colors.get_color_table_with_alpha("white", 255)
local power_increase_color = Colors.get_color_table_with_alpha("font_title", 255)
HeroWindowOptions._update_hero_power_effect = function (self, dt)
	local hero_power_effect_time = self._hero_power_effect_time

	if hero_power_effect_time then
		hero_power_effect_time = math.max(hero_power_effect_time - dt, 0)
		local progress = 1 - hero_power_effect_time / HERO_POWER_EFFECT_DURATION
		local anim_progress = math.easeOutCubic(progress)
		local pulse_progress = math.ease_pulse(anim_progress)
		local widgets_by_name = self._widgets_by_name
		local effect_style = widgets_by_name.hero_power_tooltip.style.effect
		effect_style.angle = math.degrees_to_radians(120 * anim_progress)
		effect_style.color[1] = 255 * pulse_progress
		local text_style = widgets_by_name.power_text.style.text

		Colors.lerp_color_tables(power_default_color, power_increase_color, pulse_progress, text_style.text_color)

		if progress == 1 then
			self._hero_power_effect_time = nil
		else
			self._hero_power_effect_time = hero_power_effect_time
		end
	end

	return 
end
HeroWindowOptions._update_hero_portrait_frame = function (self)
	local career_index = self.career_index
	local profile_index = self.profile_index
	local profile_settings = SPProfiles[profile_index]
	local careers = profile_settings.careers
	local career_settings = careers[career_index]
	local portrait_image = career_settings.portrait_image
	local career_display_name = career_settings.display_name
	local hero_display_name = profile_settings.character_name
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.hero_name.content.text = hero_display_name
	widgets_by_name.career_name.content.text = career_display_name
	local level_text = (self._hero_level and tostring(self._hero_level)) or "-"
	local portrait_frame_name = self._get_portrait_frame(self)
	local portrait_widget = self._create_portrait_frame_widget(self, portrait_frame_name, portrait_image, level_text)
	self._portrait_widget = portrait_widget

	return 
end
HeroWindowOptions.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	if self._portrait_widget then
		UIRenderer.draw_widget(ui_renderer, self._portrait_widget)
	end

	local active_node_widgets = self._active_node_widgets

	if active_node_widgets then
		for _, widget in ipairs(active_node_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_renderer)

	return 
end
HeroWindowOptions._play_sound = function (self, event)
	self.parent:play_sound(event)

	return 
end
HeroWindowOptions._get_text_height = function (self, ui_renderer, size, ui_style, text, ui_style_global)
	local widget_scale = nil

	if ui_style_global then
		widget_scale = ui_style_global.scale
	end

	local font_material, font_size, font_name = nil

	if ui_style.font_type then
		local font, size_of_font = UIFontByResolution(ui_style, widget_scale)
		font_name = font[3]
		font_size = font[2]
		font_material = font[1]
		font_size = size_of_font
	else
		local font = ui_style.font
		font_name = font[3]
		font_size = font[2]
		font_material = font[1]

		if not ui_style.font_size then
		end
	end

	if ui_style.localize then
		text = Localize(text)
	end

	local font_height, font_min, font_max = UIGetFontHeight(ui_renderer.gui, font_name, font_size)
	local texts = UIRenderer.word_wrap(ui_renderer, text, font_material, font_size, size[1])
	local text_start_index = 1
	local max_texts = #texts
	local num_texts = math.min(#texts - text_start_index - 1, max_texts)
	local inv_scale = RESOLUTION_LOOKUP.inv_scale
	local full_font_height = (font_max + math.abs(font_min)) * inv_scale * num_texts

	return full_font_height
end
HeroWindowOptions._create_portrait_frame_widget = function (self, frame_settings_name, portrait_texture, level_text)
	local widget_definition = UIWidgets.create_portrait_frame("portrait_root", frame_settings_name, level_text, 1, nil, portrait_texture)
	local widget = UIWidget.init(widget_definition)
	local widget_content = widget.content
	widget_content.frame_settings_name = frame_settings_name

	return widget
end
HeroWindowOptions._get_portrait_frame = function (self)
	local profile_index = self.profile_index
	local career_index = self.career_index
	local hero_name = self.hero_name
	local profile = SPProfiles[profile_index]
	local career_data = profile.careers[career_index]
	local career_name = career_data.name
	local player_portrait_frame = "default"
	local item = BackendUtils.get_loadout_item(career_name, "slot_frame")

	if item then
		local item_data = item.data
		local frame_name = item_data.temporary_template

		if not frame_name then
		end
	end

	return player_portrait_frame
end
HeroWindowOptions._create_style_animation_enter = function (self, widget, target_value, style_id, widget_index, instant)
	local ui_animations = self._ui_animations
	local animation_name = "game_option_" .. style_id
	local widget_style = widget.style
	local pass_style = widget_style[style_id]
	local current_color_value = pass_style.color[1]
	local target_color_value = target_value
	local total_time = 0.2
	local animation_duration = (1 - current_color_value / target_color_value) * total_time

	if 0 < animation_duration and not instant then
		ui_animations[animation_name .. "_hover_" .. widget_index] = self._animate_element_by_time(self, pass_style.color, 1, current_color_value, target_color_value, animation_duration)
	else
		pass_style.color[1] = target_color_value
	end

	return 
end
HeroWindowOptions._create_style_animation_exit = function (self, widget, target_value, style_id, widget_index, instant)
	local ui_animations = self._ui_animations
	local animation_name = "game_option_" .. style_id
	local widget_style = widget.style
	local pass_style = widget_style[style_id]
	local current_color_value = pass_style.color[1]
	local target_color_value = target_value
	local total_time = 0.2
	local animation_duration = current_color_value / 255 * total_time

	if 0 < animation_duration and not instant then
		ui_animations[animation_name .. "_hover_" .. widget_index] = self._animate_element_by_time(self, pass_style.color, 1, current_color_value, target_color_value, animation_duration)
	else
		pass_style.color[1] = target_color_value
	end

	return 
end
HeroWindowOptions._animate_element_by_time = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.function_by_time, target, target_index, from, to, time, math.ease_out_quad)

	return new_animation
end
HeroWindowOptions._animate_element_by_catmullrom = function (self, target, target_index, target_value, p0, p1, p2, p3, time)
	local new_animation = UIAnimation.init(UIAnimation.catmullrom, target, target_index, target_value, p0, p1, p2, p3, time)

	return new_animation
end
HeroWindowOptions._animate_option_button = function (self, widget, dt)
	local ui_renderer = self.ui_renderer
	local scenegraph_id = widget.scenegraph_id
	local content = widget.content
	local style = widget.style
	local hotspot = content.button_hotspot
	local is_hover = hotspot.is_hover
	local is_selected = hotspot.is_selected
	local input_pressed = not is_selected and hotspot.is_clicked and hotspot.is_clicked == 0
	local input_progress = hotspot.input_progress or 0
	local hover_progress = hotspot.hover_progress or 0
	local selection_progress = hotspot.selection_progress or 0
	local speed = 8
	local input_speed = 20

	if input_pressed then
		input_progress = math.min(input_progress + dt * input_speed, 1)
	else
		input_progress = math.max(input_progress - dt * input_speed, 0)
	end

	local input_easing_out_progress = math.easeOutCubic(input_progress)
	local input_easing_in_progress = math.easeInCubic(input_progress)

	if is_hover then
		hover_progress = math.min(hover_progress + dt * speed, 1)
	else
		hover_progress = math.max(hover_progress - dt * speed, 0)
	end

	local hover_easing_out_progress = math.easeOutCubic(hover_progress)
	local hover_easing_in_progress = math.easeInCubic(hover_progress)

	if is_selected then
		selection_progress = math.min(selection_progress + dt * speed, 1)
	else
		selection_progress = math.max(selection_progress - dt * speed, 0)
	end

	local select_easing_out_progress = math.easeOutCubic(selection_progress)
	local select_easing_in_progress = math.easeInCubic(selection_progress)
	local combined_progress = math.max(hover_progress, selection_progress)
	local combined_out_progress = math.max(select_easing_out_progress, hover_easing_out_progress)
	local combined_in_progress = math.max(hover_easing_in_progress, select_easing_in_progress)
	local input_alpha = 255 * input_progress
	style.button_clicked_rect.color[1] = 100 * input_progress
	style.hover_glow.color[1] = 255 * combined_progress
	local select_alpha = 255 * selection_progress
	style.select_glow.color[1] = select_alpha
	style.icon_selected.color[1] = select_alpha
	style.skull_select_glow.color[1] = select_alpha
	style.icon_bg_glow.color[1] = select_alpha
	local text_disabled_style = style.button_text_disabled
	local disabled_default_text_color = text_disabled_style.default_text_color
	local disabled_text_color = text_disabled_style.text_color
	disabled_text_color[2] = disabled_default_text_color[2] * 0.4
	disabled_text_color[3] = disabled_default_text_color[3] * 0.4
	disabled_text_color[4] = disabled_default_text_color[4] * 0.4
	local button_text_style = style.button_text
	local button_text_color = button_text_style.text_color
	local default_text_color = button_text_style.default_text_color
	local select_text_color = button_text_style.select_text_color

	Colors.lerp_color_tables(default_text_color, select_text_color, combined_progress, button_text_color)

	local icon_color = style.icon.color
	icon_color[2] = button_text_color[2]
	icon_color[3] = button_text_color[3]
	icon_color[4] = button_text_color[4]
	local background_icon_style = style.background_icon
	local background_icon_color = background_icon_style.color
	local background_icon_default_color = background_icon_style.default_color
	background_icon_color[2] = background_icon_default_color[2] + combined_progress * (255 - background_icon_default_color[2])
	background_icon_color[3] = background_icon_default_color[3] + combined_progress * (255 - background_icon_default_color[3])
	background_icon_color[4] = background_icon_default_color[4] + combined_progress * (255 - background_icon_default_color[4])
	hotspot.hover_progress = hover_progress
	hotspot.input_progress = input_progress
	hotspot.selection_progress = selection_progress

	return 
end
HeroWindowOptions._sync_news = function (self, dt, t)
	local sync_delay = self._sync_delay

	if sync_delay then
		sync_delay = math.max(0, sync_delay - dt)

		if sync_delay == 0 then
			self._sync_delay = nil
		else
			self._sync_delay = sync_delay
		end

		return 
	end

	local player = Managers.player:local_player(1)
	local player_unit = player.player_unit
	local news_templates = NewsFeedTemplates
	local conditions_params = self.conditions_params
	local button_widgets_by_news_template = self.button_widgets_by_news_template

	if player_unit then
		for template_name, widget in pairs(button_widgets_by_news_template) do
			local template_index = FindNewsTemplateIndex(template_name)
			local template = news_templates[template_index]
			local condition_func = template.condition_func
			widget.content.new = condition_func(conditions_params)
		end
	end

	self._sync_delay = 4

	return 
end

return 

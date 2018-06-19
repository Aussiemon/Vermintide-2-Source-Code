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
	local local_player = player_manager:local_player()
	self._stats_id = local_player:stats_id()
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

	self:create_ui_elements(params, offset)

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

	if script_data["eac-untrusted"] then
		widgets_by_name.game_option_3.content.button_hotspot.disable_button = true
		widgets_by_name.game_option_5.content.button_hotspot.disable_button = true
	end
end

HeroWindowOptions.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate HeroWindowOptions")

	self.ui_animator = nil
end

HeroWindowOptions.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	self:_sync_news(dt, t)
	self:_update_selected_option()
	self:_update_loadout_sync()
	self:_update_animations(dt)
	self:_update_hero_power_effect(dt)
	self:draw(dt)
end

HeroWindowOptions.post_update = function (self, dt, t)
	self:_handle_input(dt, t)
end

HeroWindowOptions._update_animations = function (self, dt)
	self:_update_game_options_hover_effect(dt)

	local ui_animations = self._ui_animations
	local animations = self._animations
	local ui_animator = self.ui_animator

	for name, animation in pairs(self._ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			self._ui_animations[name] = nil
		end
	end

	ui_animator:update(dt)

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end
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
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local input_service = self.parent:window_input_service()

	if self:_is_button_pressed(widgets_by_name.game_option_1) then
		self.parent:set_layout(1)
	elseif self:_is_button_pressed(widgets_by_name.game_option_2) then
		self.parent:set_layout(2)
	elseif self:_is_button_pressed(widgets_by_name.game_option_3) then
		self.parent:set_layout(3)
	elseif self:_is_button_pressed(widgets_by_name.game_option_4) then
		self.parent:set_layout(4)
	elseif self:_is_button_pressed(widgets_by_name.game_option_5) then
		self:_play_sound("play_gui_lobby_button_00_custom")
		self.parent:requested_screen_change_by_name("loot")
	elseif gamepad_active then
		local current_index = self.parent:get_selected_game_mode_index()

		if input_service:get("move_up_raw") and current_index > 1 then
			self.parent:set_layout(current_index - 1)
		elseif input_service:get("move_down_raw") and current_index < 4 then
			self.parent:set_layout(current_index + 1)
		end
	end
end

HeroWindowOptions._update_game_options_hover_effect = function (self, dt)
	local widgets_by_name = self._widgets_by_name
	local widget_prefix = "game_option_"

	for i = 1, 4, 1 do
		local widget_name = widget_prefix .. i
		local widget = widgets_by_name[widget_name]

		UIWidgetUtils.animate_option_button(widget, dt)

		if self:_is_button_hover_enter(widget) then
			self:_play_sound("play_gui_equipment_button_hover")
		end
	end

	UIWidgetUtils.animate_default_button(widgets_by_name.game_option_5, dt)

	if self:_is_button_hover_enter(widgets_by_name.game_option_5) or self:_is_button_hover_enter(widgets_by_name.hero_power_tooltip) then
		self:_play_sound("play_gui_equipment_button_hover")
	end
end

HeroWindowOptions._set_selected_option = function (self, index)
	local widgets_by_name = self._widgets_by_name
	local widget_prefix = "game_option_"

	for i = 1, 4, 1 do
		local widget_name = widget_prefix .. i
		local widget = widgets_by_name[widget_name]
		widget.content.button_hotspot.is_selected = index == i
	end
end

HeroWindowOptions._update_selected_option = function (self)
	local parent = self.parent
	local selected_index = parent:get_selected_game_mode_index()

	if selected_index ~= self._selected_index then
		self:_set_selected_option(selected_index)

		self._selected_index = selected_index
	end
end

HeroWindowOptions._update_loadout_sync = function (self)
	local parent = self.parent
	local loadout_sync_id = parent.loadout_sync_id

	if loadout_sync_id ~= self._loadout_sync_id or self:_has_hero_level_changed() then
		self:_calculate_power_level()
		self:_update_experience_presentation()
		self:_update_hero_portrait_frame()

		self._loadout_sync_id = loadout_sync_id
	end
end

HeroWindowOptions._has_hero_level_changed = function (self)
	local experience = ExperienceSettings.get_experience(self.hero_name)
	local level = ExperienceSettings.get_level(experience)

	if level ~= self._hero_level then
		return true
	end
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

	if is_max_level and extra_levels and extra_levels > 0 then
		text = text .. " (+" .. tostring(extra_levels) .. ")"
	end

	widgets_by_name.level_text.content.text = text
	self._hero_level = level
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

		self:_play_sound("play_gui_equipment_power_level_increase")
	end

	content.power = presentable_hero_power_level
	content.text = tostring(presentable_hero_power_level)
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
	local portrait_frame_name = self:_get_portrait_frame()
	local portrait_widget = self:_create_portrait_frame_widget(portrait_frame_name, portrait_image, level_text)
	self._portrait_widget = portrait_widget
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
end

HeroWindowOptions._play_sound = function (self, event)
	self.parent:play_sound(event)
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
		font_size = ui_style.font_size or font_size
	end

	if ui_style.localize then
		text = Localize(text)
	end

	local font_height, font_min, font_max = UIGetFontHeight(ui_renderer.gui, font_name, font_size)
	local texts = UIRenderer.word_wrap(ui_renderer, text, font_material, font_size, size[1])
	local text_start_index = 1
	local max_texts = #texts
	local num_texts = math.min(#texts - (text_start_index - 1), max_texts)
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
		player_portrait_frame = frame_name or player_portrait_frame
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

	if animation_duration > 0 and not instant then
		ui_animations[animation_name .. "_hover_" .. widget_index] = self:_animate_element_by_time(pass_style.color, 1, current_color_value, target_color_value, animation_duration)
	else
		pass_style.color[1] = target_color_value
	end
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

	if animation_duration > 0 and not instant then
		ui_animations[animation_name .. "_hover_" .. widget_index] = self:_animate_element_by_time(pass_style.color, 1, current_color_value, target_color_value, animation_duration)
	else
		pass_style.color[1] = target_color_value
	end
end

HeroWindowOptions._animate_element_by_time = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.function_by_time, target, target_index, from, to, time, math.ease_out_quad)

	return new_animation
end

HeroWindowOptions._animate_element_by_catmullrom = function (self, target, target_index, target_value, p0, p1, p2, p3, time)
	local new_animation = UIAnimation.init(UIAnimation.catmullrom, target, target_index, target_value, p0, p1, p2, p3, time)

	return new_animation
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
end

return

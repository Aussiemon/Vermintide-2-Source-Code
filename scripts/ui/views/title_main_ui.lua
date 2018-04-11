-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
require("scripts/ui/ui_animations")

local definitions = local_require("scripts/ui/views/title_main_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local background_widget_definitions = definitions.background_widget_definitions
local single_widget_definitions = definitions.single_widget_definitions
local widget_definitions = definitions.widget_definitions
local attract_mode_video = definitions.attract_mode_video
local animations = definitions.animations
local menu_button_definitions = definitions.menu_button_definitions
local menu_button_font_size = definitions.menu_button_font_size
local menu_item_index_lookup = definitions.menu_item_index_lookup
local DO_RELOAD = false
local legal_texts = {
	"fatshark_legal_1",
	"gw_legal_1",
	"gw_legal_2",
	"gw_legal_3",
	"gw_legal_4"
}
TitleMainUI = class(TitleMainUI)
TitleMainUI.init = function (self, world)
	self._world = world
	local platform = PLATFORM
	self.platform = platform
	self.render_settings = {
		snap_pixel_positions = true
	}
	self._ui_renderer = UIRenderer.create(world, "material", "materials/ui/ui_1080p_title_screen", "material", "materials/ui/ui_1080p_start_screen", "material", "materials/fonts/gw_fonts", "material", "materials/ui/ui_1080p_common", "material", attract_mode_video.video_name)

	UISetupFontHeights(self._ui_renderer.gui)

	self.input_manager = Managers.input

	self.input_manager:create_input_service("main_menu", "TitleScreenKeyMaps", "TitleScreenFilters")
	self.input_manager:map_device_to_service("main_menu", "gamepad")
	self.input_manager:map_device_to_service("main_menu", "keyboard")
	self.input_manager:map_device_to_service("main_menu", "mouse")

	self._attract_mode_active = false

	self._create_ui_elements(self)
	self._init_animations(self)

	return 
end
TitleMainUI._play_sound = function (self, event)
	return Managers.music:trigger_event(event)
end
TitleMainUI.get_ui_renderer = function (self)
	return self._ui_renderer
end
TitleMainUI._init_animations = function (self)
	self._menu_item_animations = {}
	self._ui_animations = {}
	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animations)
	self._circle_pulse_out_anim_id = self._ui_animator:start_animation("circle_glow_pulse_out", self._widgets, scenegraph_definition)

	self._start_fog_animations(self)

	return 
end
TitleMainUI._create_ui_elements = function (self)
	self._current_menu_index = nil
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self.attract_video = UIWidget.init(UIWidgets.create_splash_video(attract_mode_video))
	self._widgets = {}

	for widget_name, widget_definition in pairs(widget_definitions) do
		self._widgets[widget_name] = UIWidget.init(widget_definition)
	end

	self._widgets.frame_line_glow.style.texture_id.color[1] = 0
	self._widgets.frame_top.offset[2] = -5
	self._widgets.frame_bottom.offset[2] = 5
	self._background_widgets = {}

	for widget_name, widget_definition in pairs(background_widget_definitions) do
		self._background_widgets[widget_name] = UIWidget.init(widget_definition)
	end

	local lock_widgets = {
		lock_center = UIWidget.init(single_widget_definitions.lock_center),
		lock_outer_top = UIWidget.init(single_widget_definitions.lock_outer_top),
		lock_middle_top = UIWidget.init(single_widget_definitions.lock_middle_top),
		lock_outer_bottom = UIWidget.init(single_widget_definitions.lock_outer_bottom),
		lock_middle_bottom = UIWidget.init(single_widget_definitions.lock_middle_bottom)
	}
	self._lock_widgets = lock_widgets
	self._information_text = UIWidget.init(single_widget_definitions.information_text)
	self._information_text.style.text.localize = false
	self._legal_text = UIWidget.init(single_widget_definitions.legal_text)
	local legal_text_widget = self._legal_text
	local legal_text_style = legal_text_widget.style.text
	legal_text_style.localize = false
	legal_text_style.vertical_alignment = "bottom"
	local legal_display_text = ""

	for _, text in ipairs(legal_texts) do
		legal_display_text = legal_display_text .. "\n" .. Localize(text)
	end

	legal_text_widget.content.text = legal_display_text
	self._menu_selection_left = UIWidget.init(single_widget_definitions.start_screen_selection_left)
	self._menu_selection_right = UIWidget.init(single_widget_definitions.start_screen_selection_right)
	self._user_gamertag_widget = UIWidget.init(single_widget_definitions.user_gamertag)
	self._playgo_status_widget = UIWidget.init(single_widget_definitions.playgo_status)
	self._change_profile_input_icon_widget = UIWidget.init(single_widget_definitions.change_profile_input_icon)
	self._change_profile_input_text_widget = UIWidget.init(single_widget_definitions.change_profile_input_text)
	self._input_icon_widget = self._widgets.input_icon

	if self.platform ~= "ps4" then
		self._input_icon_widget.content.texture_id = "xbone_button_icon_a_large"
	end

	self._menu_widgets = {}

	for _, definition in ipairs(menu_button_definitions) do
		local menu_item_widget = UIWidget.init(definition)
		self._menu_widgets[#self._menu_widgets + 1] = menu_item_widget
		local widget_style = menu_item_widget.style
		widget_style.text.horizontal_alignment = "center"
		widget_style.text_hover.horizontal_alignment = "center"
	end

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	return 
end
TitleMainUI.update = function (self, dt, t, render_background_only)
	if DO_RELOAD then
		self._attract_mode_active = false

		self._create_ui_elements(self)
		self._init_animations(self)

		DO_RELOAD = false
	end

	for name, ui_animation in pairs(self._ui_animations) do
		UIAnimation.update(ui_animation, dt)

		if UIAnimation.completed(ui_animation) then
			self._ui_animations[name] = nil
		end
	end

	local ui_animator = self._ui_animator

	ui_animator.update(ui_animator, dt)

	if self._circle_pulse_out_anim_id and ui_animator.is_animation_completed(ui_animator, self._circle_pulse_out_anim_id) then
		ui_animator.stop_animation(ui_animator, self._circle_pulse_out_anim_id)

		self._circle_pulse_out_anim_id = nil
		self._circle_pulse_in_anim_id = ui_animator.start_animation(ui_animator, "circle_glow_pulse_in", self._widgets, scenegraph_definition)
	end

	if self._circle_pulse_in_anim_id and ui_animator.is_animation_completed(ui_animator, self._circle_pulse_in_anim_id) then
		ui_animator.stop_animation(ui_animator, self._circle_pulse_in_anim_id)

		self._circle_pulse_in_anim_id = nil
		self._circle_pulse_out_anim_id = self._ui_animator:start_animation("circle_glow_pulse_out", self._widgets, scenegraph_definition)
	end

	if self._frame_anim_id and ui_animator.is_animation_completed(ui_animator, self._frame_anim_id) then
		self._ui_animator:stop_animation(self._frame_anim_id)

		self._frame_anim_id = nil

		if not self._show_menu and not self._circle_pulse_out_anim_id then
			self._circle_pulse_out_anim_id = self._ui_animator:start_animation("circle_glow_pulse_in", self._widgets, scenegraph_definition)
		end
	end

	if self._input_fade_out_anim_id and ui_animator.is_animation_completed(ui_animator, self._input_fade_out_anim_id) then
		self._ui_animator:stop_animation(self._input_fade_out_anim_id)

		self._input_fade_out_anim_id = nil
	end

	self._update_fog_loop_animations(self)

	if not self._frame_anim_id and not self._show_menu and self._start_pressed then
		self._animate_lock(self, dt)
	end

	if not render_background_only and not self._frame_anim_id and self._show_menu then
		self._handle_menu_input(self, dt, t)
	end

	for index, animation in pairs(self._menu_item_animations) do
		self[animation.func](self, animation, index, dt)
	end

	self._draw(self, dt, render_background_only)

	return 
end
TitleMainUI._handle_menu_input = function (self, dt, t)
	local current_index = self._current_menu_index or 1
	local input_service = self.input_manager:get_service("main_menu")
	local navigation_allowed = self._frame_anim_id == nil

	if navigation_allowed then
		if input_service.get(input_service, "down") then
			current_index = 1 + current_index % #self._menu_widgets

			self._play_sound(self, "hud_menu_select")
		elseif input_service.get(input_service, "up") then
			current_index = (current_index - 1 < 1 and #self._menu_widgets) or current_index - 1

			self._play_sound(self, "hud_menu_select")
		end
	end

	if current_index ~= self._current_menu_index then
		if self._current_menu_index then
			self._add_menu_item_animation(self, self._current_menu_index, "anim_deselect_button")
		end

		self._add_menu_item_animation(self, current_index, "anim_select_button")
	end

	self._current_menu_index = current_index

	return 
end
TitleMainUI.current_menu_index = function (self)
	if self._show_menu then
		local index = self._current_menu_index

		if index then
			local menu_item = self._menu_widgets[index]
			local disabled = menu_item.content.disabled

			return not disabled and index
		end
	end

	return 
end
TitleMainUI.active_menu_selection = function (self)
	if self._show_menu then
		return self._current_menu_index ~= nil
	end

	return 
end
TitleMainUI._draw = function (self, dt, render_background_only)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self.input_manager:get_service("main_menu")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	if render_background_only then
		for _, widget in pairs(self._background_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	else
		if self._destroy_video_player then
			UIRenderer.destroy_video_player(ui_renderer)

			self._destroy_video_player = nil
		elseif self._attract_mode_enabled then
			if not self.attract_video.content.video_completed then
				if not ui_renderer.video_player then
					UIRenderer.create_video_player(ui_renderer, self._world, attract_mode_video.video_name, attract_mode_video.loop)
				else
					if not self._sound_started then
						if attract_mode_video.sound_start then
							Managers.music:trigger_event(attract_mode_video.sound_start)
						end

						self._sound_started = true
					end

					UIRenderer.draw_widget(ui_renderer, self.attract_video)
				end
			elseif ui_renderer.video_player then
				UIRenderer.destroy_video_player(ui_renderer)

				self._sound_started = false

				if attract_mode_video.sound_stop then
					Managers.music:trigger_event(attract_mode_video.sound_stop)
				end
			end
		end

		if self._attract_mode_active then
			if ui_renderer.video_player then
				UIRenderer.destroy_video_player(ui_renderer)
			end
		else
			if not self._frame_anim_id and self._show_menu then
				for _, widget in ipairs(self._menu_widgets) do
					UIRenderer.draw_widget(ui_renderer, widget)
				end

				if self._current_menu_index then
					UIRenderer.draw_widget(ui_renderer, self._menu_selection_left)
					UIRenderer.draw_widget(ui_renderer, self._menu_selection_right)
				end

				if self._draw_gamertag then
					UIRenderer.draw_widget(ui_renderer, self._user_gamertag_widget)

					if not self._switch_profile_blocked then
						UIRenderer.draw_widget(ui_renderer, self._change_profile_input_icon_widget)
						UIRenderer.draw_widget(ui_renderer, self._change_profile_input_text_widget)
					end
				end
			end

			UIRenderer.draw_widget(ui_renderer, self._legal_text)

			if self._start_pressed and self._draw_information_text then
				UIRenderer.draw_widget(ui_renderer, self._information_text)
			end

			for _, widget in pairs(self._lock_widgets) do
				UIRenderer.draw_widget(ui_renderer, widget)
			end

			for _, widget in pairs(self._widgets) do
				UIRenderer.draw_widget(ui_renderer, widget)
			end

			for _, widget in pairs(self._background_widgets) do
				UIRenderer.draw_widget(ui_renderer, widget)
			end
		end
	end

	if self._draw_playgo and not self._attract_mode_active then
		UIRenderer.draw_widget(ui_renderer, self._playgo_status_widget)
	end

	UIRenderer.end_pass(ui_renderer)

	return 
end
TitleMainUI.destroy = function (self)
	GarbageLeakDetector.register_object(self, "TitleMainUI")
	UIRenderer.destroy(self._ui_renderer, self._world)

	return 
end
TitleMainUI.should_start = function (self)
	return self._start_pressed
end
TitleMainUI.enter_attract_mode = function (self)
	self._attract_mode_enabled = true
	self.attract_video.content.video_content.video_completed = false

	return 
end
TitleMainUI.exit_attract_mode = function (self)
	self._attract_mode_enabled = false
	self._destroy_video_player = true

	return 
end
TitleMainUI.video_completed = function (self)
	return self.attract_video.content.video_content.video_completed
end
TitleMainUI.attract_mode = function (self)
	return self._attract_mode_enabled
end
TitleMainUI._start_fog_animations = function (self)
	local fog_animations = {}
	local ui_animator = self._ui_animator
	fog_animations[#fog_animations + 1] = {
		name = "fog_move_back",
		id = ui_animator.start_animation(ui_animator, "fog_move_back", self._background_widgets, scenegraph_definition)
	}
	fog_animations[#fog_animations + 1] = {
		name = "fog_move_front",
		id = ui_animator.start_animation(ui_animator, "fog_move_front", self._background_widgets, scenegraph_definition)
	}
	self._fog_animations = fog_animations

	return 
end
TitleMainUI._update_fog_loop_animations = function (self)
	local fog_animations = self._fog_animations

	if fog_animations then
		local ui_animator = self._ui_animator
		local widgets = self._background_widgets

		for index, anim_data in ipairs(fog_animations) do
			local anim_id = anim_data.id
			local anim_name = anim_data.name

			if ui_animator.is_animation_completed(ui_animator, anim_id) then
				anim_data.id = self._ui_animator:start_animation(anim_name, widgets, scenegraph_definition)
			end
		end
	end

	return 
end
TitleMainUI.show_menu = function (self, show)
	if show and self._lock_angle then
		self._show_menu_when_ready = true

		return 
	end

	self._show_menu = show
	self._show_menu_when_ready = nil

	if self._frame_anim_id then
		self._ui_animator:stop_animation(self._frame_anim_id)
	end

	if self._input_fade_out_anim_id then
		self._ui_animator:stop_animation(self._input_fade_out_anim_id)

		self._input_fade_out_anim_id = nil
	end

	if not show then
		local current_menu_index = self._current_menu_index

		if current_menu_index then
			self.anim_deselect_button(self, nil, current_menu_index, nil, 0)

			self._current_menu_index = nil
			self._menu_item_animations[current_menu_index] = nil
		end

		self._frame_anim_id = self._ui_animator:start_animation("frame_close", self._widgets, scenegraph_definition)

		self._play_sound(self, "Play_hud_main_menu_close")
	else
		self._frame_anim_id = self._ui_animator:start_animation("frame_open", self._widgets, scenegraph_definition)

		self._play_sound(self, "Play_hud_main_menu_open")

		self._draw_information_text = nil
	end

	self._lock_angle = nil

	return 
end
TitleMainUI.set_start_pressed = function (self, pressed)
	if self._start_pressed ~= pressed then
		if pressed then
			if self._circle_pulse_out_anim_id then
				self._ui_animator:stop_animation(self._circle_pulse_out_anim_id)

				self._circle_pulse_out_anim_id = nil
			end

			if self._circle_pulse_in_anim_id then
				self._ui_animator:stop_animation(self._circle_pulse_in_anim_id)

				self._circle_pulse_in_anim_id = nil
			end

			self._input_fade_out_anim_id = self._ui_animator:start_animation("input_icon_fade_out", self._widgets, scenegraph_definition)
			self._ui_animations.legal_text_fade = UIAnimation.init(UIAnimation.function_by_time, self._legal_text.style.text.text_color, 1, 255, 0, 0.2, math.easeCubic)
			self._ui_animations.information_text_fade = UIAnimation.init(UIAnimation.function_by_time, self._information_text.style.text.text_color, 1, 0, 255, 0.5, math.easeCubic)
		else
			self._ui_animations.legal_text_fade = UIAnimation.init(UIAnimation.function_by_time, self._legal_text.style.text.text_color, 1, 0, 255, 0.5, math.easeCubic)
			self._ui_animations.information_text_fade = UIAnimation.init(UIAnimation.function_by_time, self._information_text.style.text.text_color, 1, 255, 0, 0.2, math.easeCubic)
			self._draw_information_text = nil

			if not self._frame_anim_id then
				if self._input_fade_out_anim_id then
					self._ui_animator:stop_animation(self._input_fade_out_anim_id)

					self._input_fade_out_anim_id = nil
				end

				self._widgets.input_icon.style.texture_id.color[1] = 255
				self._widgets.frame_line_glow.style.texture_id.color[1] = 0
				self._circle_pulse_out_anim_id = self._ui_animator:start_animation("circle_glow_pulse_out", self._widgets, scenegraph_definition)
			end
		end
	end

	self._start_pressed = pressed

	return 
end
local MENU_ITEM_FADE_IN = 0.2
local MENU_ITEM_FADE_OUT = 0.2
TitleMainUI.anim_select_button = function (self, animation_data, index, dt)
	if animation_data.progress == 1 then
		return 
	end

	animation_data.timer = animation_data.timer or animation_data.progress * MENU_ITEM_FADE_IN
	animation_data.timer = animation_data.timer + dt
	animation_data.progress = math.clamp(animation_data.timer / MENU_ITEM_FADE_IN, 0, 1)
	local menu_item = self._menu_widgets[index]
	local item_disabled = menu_item.content.disabled
	local color = (item_disabled and Colors.color_definitions.gray) or Colors.color_definitions.cheeseburger
	local select_color = (item_disabled and Colors.color_definitions.gray) or Colors.color_definitions.white
	menu_item.style.text.text_color[2] = math.lerp(color[2], select_color[2], math.smoothstep(animation_data.progress, 0, 1))
	menu_item.style.text.text_color[3] = math.lerp(color[3], select_color[3], math.smoothstep(animation_data.progress, 0, 1))
	menu_item.style.text.text_color[4] = math.lerp(color[4], select_color[4], math.smoothstep(animation_data.progress, 0, 1))
	menu_item.style.text.font_size = math.lerp(menu_item.style.text.font_size, menu_button_font_size + 10, math.easeInCubic(animation_data.progress))
	local menu_item_scenegraph_id = menu_item.scenegraph_id
	local ui_scenegraph = self._ui_scenegraph
	ui_scenegraph.selection_anchor.local_position[2] = ui_scenegraph[menu_item_scenegraph_id].local_position[2]
	local widget_style = menu_item.style
	local text = menu_item.content.text_field
	local text_width, text_height = self._get_word_wrap_size(self, Localize(text), widget_style.text, 1000)
	ui_scenegraph.selection_anchor.size[1] = text_width or 0
	self._menu_selection_left.offset[1] = math.lerp(-50, 0, math.smoothstep(animation_data.progress, 0, 1))
	self._menu_selection_right.offset[1] = math.lerp(50, 0, math.smoothstep(animation_data.progress, 0, 1))

	return 
end
TitleMainUI.anim_deselect_button = function (self, animation_data, index, dt, optional_progress)
	if animation_data and animation_data.progress == 0 then
		return 
	end

	local progress = 0

	if not optional_progress then
		animation_data.timer = animation_data.timer or animation_data.progress * MENU_ITEM_FADE_OUT
		animation_data.timer = animation_data.timer - dt
		animation_data.progress = math.clamp(animation_data.timer / MENU_ITEM_FADE_OUT, 0, 1)
		progress = animation_data.progress
	else
		progress = optional_progress
	end

	local menu_item = self._menu_widgets[index]
	local item_disabled = menu_item.content.disabled
	local color = (item_disabled and Colors.color_definitions.gray) or Colors.color_definitions.cheeseburger
	local select_color = (item_disabled and Colors.color_definitions.gray) or Colors.color_definitions.white
	menu_item.style.text.text_color[2] = math.lerp(color[2], select_color[2], math.smoothstep(progress, 0, 1))
	menu_item.style.text.text_color[3] = math.lerp(color[3], select_color[3], math.smoothstep(progress, 0, 1))
	menu_item.style.text.text_color[4] = math.lerp(color[4], select_color[4], math.smoothstep(progress, 0, 1))

	if optional_progress then
		menu_item.style.text.font_size = menu_button_font_size * (1 - progress)
	else
		menu_item.style.text.font_size = math.lerp(menu_item.style.text.font_size, menu_button_font_size, math.easeInCubic(progress))
	end

	return 
end
TitleMainUI._get_text_size = function (self, localized_text, text_style)
	local font, scaled_font_size = UIFontByResolution(text_style)
	local text_width, text_height, min = UIRenderer.text_size(self._ui_renderer, localized_text, font[1], scaled_font_size)

	return text_width, text_height
end
TitleMainUI._get_word_wrap_size = function (self, localized_text, text_style, text_area_width)
	local font, scaled_font_size = UIFontByResolution(text_style)
	local lines = UIRenderer.word_wrap(self._ui_renderer, localized_text, font[1], scaled_font_size, text_area_width)
	local text_width, text_height = self._get_text_size(self, localized_text, text_style)

	return text_width, text_height * #lines
end
TitleMainUI._add_menu_item_animation = function (self, index, func)
	self._menu_item_animations[index] = {
		progress = (self._menu_item_animations[index] and self._menu_item_animations[index].progress) or 0,
		func = func
	}

	return 
end
TitleMainUI.set_information_text = function (self, optinal_text)
	self._draw_information_text = true
	local widget = self._information_text
	local widget_content = widget.content
	local widget_style = widget.style

	if not optinal_text then
		widget_content.text = Localize("state_info")
	else
		widget_content.text = optinal_text
	end

	return 
end
TitleMainUI.set_user_name = function (self, username)
	self._draw_gamertag = true
	self._user_gamertag_widget.content.text = username

	if PLATFORM == "ps4" then
		self._switch_profile_blocked = true
	end

	return 
end
TitleMainUI.clear_user_name = function (self)
	self._draw_gamertag = nil
	self._switch_profile_blocked = nil

	return 
end
TitleMainUI.set_playgo_status = function (self, status_text)
	self._draw_playgo = true
	self._playgo_status_widget.content.text = status_text

	return 
end
TitleMainUI.clear_playgo_status = function (self)
	self._draw_playgo = nil

	return 
end
TitleMainUI.set_menu_item_enable_state_by_index = function (self, item_lookup_name, enabled, reason)
	local index = menu_item_index_lookup[item_lookup_name]
	local menu_item = self._menu_widgets[index]
	menu_item.content.disabled = not enabled
	local color = (enabled and Colors.color_definitions.cheeseburger) or Colors.color_definitions.gray
	local text_color = menu_item.style.text.text_color
	text_color[2] = color[2]
	text_color[3] = color[3]
	text_color[4] = color[4]

	return 
end
TitleMainUI._animate_lock = function (self, dt)
	local widget = self._lock_widgets
	local moduluse_value = 6.2831852999999995
	local lock_outer_top = widget.lock_outer_top
	local lock_middle_top = widget.lock_middle_top
	local lock_outer_bottom = widget.lock_outer_bottom
	local lock_middle_bottom = widget.lock_middle_bottom
	local speed = 3
	local angle = self._lock_angle or 0
	angle = angle + dt * speed

	if self._show_menu_when_ready then
		if moduluse_value < angle then
			angle = 0
		end
	else
		angle = angle % moduluse_value
	end

	lock_outer_top.style.texture_id.angle = angle
	lock_outer_bottom.style.texture_id.angle = angle
	lock_middle_top.style.texture_id.angle = -angle
	lock_middle_bottom.style.texture_id.angle = -angle
	self._lock_angle = angle

	if self._show_menu_when_ready and angle == 0 then
		self._lock_angle = nil

		self.show_menu(self, true)
	end

	return 
end

return 

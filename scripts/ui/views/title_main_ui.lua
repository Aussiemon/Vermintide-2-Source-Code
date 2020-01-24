require("scripts/ui/ui_animations")

local definitions = local_require("scripts/ui/views/title_main_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local background_widget_definitions = definitions.background_widget_definitions
local single_widget_definitions = definitions.single_widget_definitions
local widget_definitions = definitions.widget_definitions
local attract_mode_video = definitions.attract_mode_video
local animations = definitions.animations
local menu_button_definitions = definitions.menu_button_definitions
local base_menu_button_definitions = definitions.base_menu_button_definitions
local menu_button_font_size = definitions.menu_button_font_size
local menu_item_index_lookup = definitions.menu_item_index_lookup
local menu_videos = definitions.menu_videos
local info_texts = definitions.info_texts
local DO_RELOAD = false
local VIDEO_REFERENCE_NAME = "TitleMainUI_ATTRACTMODE"
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
	self._game_type = nil
	self._disable_input = false
	self._alpha_multiplier = 0
	self._disabled_buttons = {}

	if PLATFORM == "win32" then
		self._ui_renderer = UIRenderer.create(world, "material", "materials/ui/ui_1080p_title_screen", "material", "materials/ui/ui_1080p_start_screen", "material", "materials/ui/ui_1080p_menu_atlas_textures", "material", "materials/ui/ui_1080p_menu_single_textures", "material", "materials/fonts/gw_fonts", "material", "materials/ui/ui_1080p_common", "material", attract_mode_video.video_name, "material", menu_videos.main.video_name, "material", menu_videos.main_menu.video_name)
	else
		self._ui_renderer = UIRenderer.create(world, "material", "materials/ui/ui_1080p_title_screen", "material", "materials/ui/ui_1080p_start_screen", "material", "materials/ui/ui_1080p_menu_atlas_textures", "material", "materials/ui/ui_1080p_menu_single_textures", "material", "materials/ui/ui_1080p_news_splash", "material", "materials/fonts/gw_fonts", "material", "materials/ui/ui_1080p_common", "material", attract_mode_video.video_name, "material", menu_videos.main.video_name, "material", menu_videos.main_menu.video_name)
	end

	UISetupFontHeights(self._ui_renderer.gui)

	self.input_manager = Managers.input

	self.input_manager:create_input_service("main_menu", "TitleScreenKeyMaps", "TitleScreenFilters")
	self.input_manager:map_device_to_service("main_menu", "gamepad")
	self.input_manager:map_device_to_service("main_menu", "keyboard")
	self.input_manager:map_device_to_service("main_menu", "mouse")

	self._attract_mode_active = false

	self:_create_ui_elements()
	self:_init_animations()
end

TitleMainUI.set_update_offline_data_enabled = function (self, enable)
	self._update_offline_data_enabled = enable
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
end

TitleMainUI._create_ui_elements = function (self)
	self._current_menu_index = nil
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self.attract_video = UIWidget.init(UIWidgets.create_splash_video(attract_mode_video))

	self:_create_videos()

	self._background_widgets = {}

	for widget_name, widget_definition in pairs(background_widget_definitions) do
		self._background_widgets[widget_name] = UIWidget.init(widget_definition)
	end

	self._engage_prompt = UIWidget.init(single_widget_definitions.create_engage_prompt(self._ui_renderer))
	self._sidebar_mask = UIWidget.init(single_widget_definitions.sidebar_mask)
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
	self._user_gamertag_widget = UIWidget.init(single_widget_definitions.user_gamertag)
	self._playgo_status_widget = UIWidget.init(single_widget_definitions.playgo_status)
	self._game_type_text = UIWidget.init(single_widget_definitions.game_type_text)
	self._info_icon_widget = UIWidget.init(single_widget_definitions.info_icon)
	self._info_icon_text_widget = UIWidget.init(single_widget_definitions.info_icon_text)
	self._change_profile_input_icon_widget = UIWidget.init(single_widget_definitions.change_profile_input_icon)
	self._change_profile_input_text_widget = UIWidget.init(single_widget_definitions.change_profile_input_text)

	if PLATFORM ~= "win32" then
		self._update_offline_data_input_icon_widget = UIWidget.init(single_widget_definitions.update_offline_data_input_icon)
		self._update_offline_data_input_text_widget = UIWidget.init(single_widget_definitions.update_offline_data_input_text)
	end

	self:_reset_menu_buttons()
	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	DO_RELOAD = false
end

TitleMainUI._reset_menu_buttons = function (self)
	self._menu_item_animations = {}
	self._menu_selection_left = UIWidget.init(single_widget_definitions.start_screen_selection_left)
	self._menu_selection_right = UIWidget.init(single_widget_definitions.start_screen_selection_right)
	self._sub_menu_widgets = {}
	local selection_callback = callback(self, "current_menu_index")

	for idx, definition in ipairs(menu_button_definitions) do
		local menu_item_widget = UIWidget.init(definition)
		menu_item_widget.content.selection_callback = selection_callback
		menu_item_widget.content.index = idx
		self._sub_menu_widgets[#self._sub_menu_widgets + 1] = menu_item_widget
		local widget_style = menu_item_widget.style
		local font, size_of_font = UIFontByResolution(widget_style.text, widget_style.scale)
		local font_material = font[1]
		local font_size = font[2]
		local font_name = font[3]
		font_size = size_of_font
		local widget_content = menu_item_widget.content
		local width, height, min = UIRenderer.text_size(self._ui_renderer, Localize(widget_content.text_field), font_material, font_size)
		widget_style.icon.offset[1] = -width * 0.6 - widget_style.icon.texture_size[1]
	end

	self._base_menu_widgets = {}

	for idx, definition in ipairs(base_menu_button_definitions) do
		local menu_item_widget = UIWidget.init(definition)
		menu_item_widget.content.selection_callback = selection_callback
		menu_item_widget.content.index = idx
		self._base_menu_widgets[#self._base_menu_widgets + 1] = menu_item_widget
		local widget_style = menu_item_widget.style
		local font, size_of_font = UIFontByResolution(widget_style.text, widget_style.scale)
		local font_material = font[1]
		local font_size = font[2]
		local font_name = font[3]
		font_size = size_of_font
		local widget_content = menu_item_widget.content
		local width, height, min = UIRenderer.text_size(self._ui_renderer, Localize(widget_content.text_field), font_material, font_size)
		widget_style.icon.offset[1] = -width * 0.6 - widget_style.icon.texture_size[1]
	end

	if script_data.settings.use_beta_mode and not GameSettingsDevelopment.allow_offline_mode_in_beta then
		self._is_in_sub_menu = true
		self._game_type = "online"
		self._menu_widgets = self._sub_menu_widgets
	else
		self._menu_widgets = self._base_menu_widgets
	end

	for button_name, button_data in pairs(self._disabled_buttons) do
		local enabled = button_data.enabled
		local sub_menu = button_data.sub_menu
		local reason = button_data.reason

		self:set_menu_item_enable_state_by_index(button_name, enabled, sub_menu, reason)
	end
end

TitleMainUI._update_animations = function (self, dt)
	for name, ui_animation in pairs(self._ui_animations) do
		UIAnimation.update(ui_animation, dt)

		if UIAnimation.completed(ui_animation) then
			self._ui_animations[name] = nil
		end
	end
end

local TO_DELETE = {}

TitleMainUI.update = function (self, dt, t, render_background_only)
	if DO_RELOAD then
		self._attract_mode_active = false
		self._game_type = nil

		self:_create_ui_elements()
		self:_init_animations()
	end

	self:_update_animations(dt)

	if not render_background_only and not self._frame_anim_id and self._show_menu then
		self:_handle_menu_input(dt, t)
	end

	for index, animation in pairs(self._menu_item_animations) do
		self[animation.func](self, animation, index, dt)
	end

	self:_draw(dt, t, render_background_only)
	self:_update_video(dt, t)
end

TitleMainUI._destroy_video_players = function (self)
	if self._video_widgets then
		for _, video_widget in pairs(self._video_widgets) do
			local content = video_widget.content.video_content
			local video_player = content.video_player

			if video_player then
				World.destroy_video_player(self._world, video_player)
			end
		end

		self._video_widgets = nil
		self._active_video = nil
	end
end

TitleMainUI._change_video = function (self, video_widget_name)
	if script_data.disable_video_player then
		return
	end

	World.remove_video_player(self._world, self._active_video_widget.content.video_content.video_player)

	self._active_video_widget = self._video_widgets[video_widget_name]

	World.add_video_player(self._world, self._active_video_widget.content.video_content.video_player)
end

TitleMainUI._create_videos = function (self)
	if script_data.disable_video_player then
		return
	end

	self:_destroy_video_players()

	self._video_widgets = {}

	for name, video_data in pairs(menu_videos) do
		local video_player = World.create_video_player(self._world, video_data.video_name, true, false)
		local video_widget = UIWidget.init(UIWidgets.create_splash_video(video_data))
		video_widget.content.video_content.video_player = video_player
		self._video_widgets[name] = video_widget
	end

	self._active_video_widget = self._video_widgets.main

	World.add_video_player(self._world, self._active_video_widget.content.video_content.video_player)
end

TitleMainUI._update_video = function (self, dt, t)
	if script_data.disable_video_player then
		return
	end

	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self.input_manager:get_service("main_menu")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)
	UIRenderer.draw_widget(ui_renderer, self._active_video_widget)
	UIRenderer.end_pass(ui_renderer)
end

TitleMainUI._handle_menu_input = function (self, dt, t)
	if self._disable_input then
		return
	end

	local current_index = self._current_menu_index or 1
	local input_service = self.input_manager:get_service("main_menu")
	local force_menu_animation = false
	local is_beta = script_data.settings.use_beta_mode and not GameSettingsDevelopment.allow_offline_mode_in_beta
	local navigation_allowed = self._show_menu

	if navigation_allowed then
		local menu_item = self._menu_widgets[current_index]
		local menu_item_content = menu_item.content
		local gamepad_active = Managers.input:is_device_active("gamepad")

		if gamepad_active then
			if input_service:get("down") then
				current_index = 1 + current_index % #self._menu_widgets
				local content = self._menu_widgets[current_index].content

				while content.disabled do
					current_index = 1 + current_index % #self._menu_widgets
					content = self._menu_widgets[current_index].content
				end

				self:_play_sound("Play_console_menu_hover")
			elseif input_service:get("up") then
				current_index = (current_index - 1 < 1 and #self._menu_widgets) or current_index - 1
				local content = self._menu_widgets[current_index].content

				while content.disabled do
					current_index = (current_index - 1 < 1 and #self._menu_widgets) or current_index - 1
					content = self._menu_widgets[current_index].content
				end

				self:_play_sound("Play_console_menu_hover")
			end
		else
			for idx, menu_element in ipairs(self._menu_widgets) do
				local menu_element_content = menu_element.content

				if menu_element_content.button_text.is_hover then
					current_index = idx
				end
			end
		end

		if self._is_in_sub_menu then
			if is_beta and input_service:get("back") then
				self:_reset_menu_buttons()
				self:set_game_type(nil)

				current_index = 1
				self._current_menu_index = 1
				force_menu_animation = true
			elseif input_service:get("back", true) then
				self:_reset_menu_buttons()

				self._menu_widgets = self._base_menu_widgets
				self._is_in_sub_menu = false

				self:set_game_type(nil)

				current_index = 1
				self._current_menu_index = 1
				force_menu_animation = true

				self:_play_sound("Play_console_menu_back")
			end
		elseif not menu_item_content.disabled and input_service:get("start", true) and (Managers.input:is_device_active("gamepad") or menu_item_content.button_text.is_hover) then
			self:_reset_menu_buttons()

			self._menu_widgets = self._sub_menu_widgets

			self:set_game_type(current_index == 1)

			self._is_in_sub_menu = true
			current_index = 1
			self._current_menu_index = 1
			force_menu_animation = true

			self:_play_sound("Play_console_menu_select")
		end
	end

	if current_index ~= self._current_menu_index or force_menu_animation then
		if not self._is_in_sub_menu then
			self:_set_info_text(current_index)
		end

		if self._current_menu_index then
			self:_add_menu_item_animation(self._current_menu_index, "anim_deselect_button")
		end

		self:_add_menu_item_animation(current_index, "anim_select_button")
	end

	self._current_menu_index = current_index
end

TitleMainUI.menu_option_activated = function (self, activated)
	if activated then
		self._ui_animations.sidebar = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.sidebar.size, 1, 544, 1920, 0.75, math.easeCubic)
		self._ui_animations.sidebar_fade_bg = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.sidebar_fade_bg.position, 1, 544, 1920, 0.75, math.easeCubic)
		self._ui_animations.alpha_multiplier = UIAnimation.init(UIAnimation.function_by_time, self, "_alpha_multiplier", 1, 0, 0.25, math.easeCubic)
	else
		self._ui_animations.sidebar = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.sidebar.size, 1, 1920, 544, 0.75, math.easeCubic)
		self._ui_animations.sidebar_fade_bg = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.sidebar_fade_bg.position, 1, 1920, 544, 0.75, math.easeCubic)
		self._ui_animations.alpha_multiplier = UIAnimation.init(UIAnimation.function_by_time, self, "_alpha_multiplier", 0, 1, 0.25, math.easeCubic)
	end
end

TitleMainUI._set_info_text = function (self, current_index)
	local text = info_texts[current_index]
	local content = self._info_icon_text_widget.content
	content.text = text
end

TitleMainUI.set_game_type = function (self, is_online)
	local game_type_content = self._game_type_text.content

	if is_online ~= nil then
		if is_online then
			self._game_type = "online"
			game_type_content.text = string.upper(Localize("status_online"))
		else
			self._game_type = "offline"
			game_type_content.text = string.upper(Localize("status_offline"))
		end
	else
		game_type_content.text = ""
		self._game_type = nil
	end
end

TitleMainUI.game_type = function (self)
	return self._game_type
end

TitleMainUI.offline_data_available = function (self)
	return self._game_type == "offline" and self._update_offline_data_enabled
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
end

TitleMainUI.active_menu_selection = function (self)
	if self._show_menu then
		if Managers.input:is_device_active("gamepad") then
			return self._current_menu_index ~= nil
		elseif self._current_menu_index then
			local menu_item_content = self._menu_widgets[self._current_menu_index].content

			return menu_item_content.button_text.is_hover
		end
	end
end

TitleMainUI._draw = function (self, dt, t, render_background_only)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self.input_manager:get_service("main_menu")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for _, widget in pairs(self._background_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.draw_widget(ui_renderer, self._sidebar_mask)

	if self._draw_playgo and not self._attract_mode_active then
		UIRenderer.draw_widget(ui_renderer, self._playgo_status_widget)
	end

	UIRenderer.end_pass(ui_renderer)

	if not render_background_only then
		UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

		if self._destroy_video_player then
			UIRenderer.destroy_video_player(ui_renderer, VIDEO_REFERENCE_NAME)

			self._destroy_video_player = nil
		elseif self._attract_mode_enabled then
			if not self.attract_video.content.video_completed then
				if not ui_renderer.video_players[VIDEO_REFERENCE_NAME] then
					UIRenderer.create_video_player(ui_renderer, VIDEO_REFERENCE_NAME, self._world, attract_mode_video.video_name, attract_mode_video.loop)
				else
					if not self._sound_started then
						if attract_mode_video.sound_start then
							Managers.music:trigger_event(attract_mode_video.sound_start)
						end

						self._sound_started = true
					end

					UIRenderer.draw_widget(ui_renderer, self.attract_video)
				end
			elseif ui_renderer.video_players[VIDEO_REFERENCE_NAME] then
				UIRenderer.destroy_video_player(ui_renderer, VIDEO_REFERENCE_NAME)

				self._sound_started = false

				if attract_mode_video.sound_stop then
					Managers.music:trigger_event(attract_mode_video.sound_stop)
				end
			end
		end

		if self._attract_mode_active then
			if ui_renderer.video_players[VIDEO_REFERENCE_NAME] then
				UIRenderer.destroy_video_player(ui_renderer, VIDEO_REFERENCE_NAME)
			end
		else
			if self._show_menu then
				if self._draw_gamertag then
					UIRenderer.draw_widget(ui_renderer, self._user_gamertag_widget)

					if not self._switch_profile_blocked then
						UIRenderer.draw_widget(ui_renderer, self._change_profile_input_icon_widget)
						UIRenderer.draw_widget(ui_renderer, self._change_profile_input_text_widget)
					end
				end

				if self._update_offline_data_enabled and self._game_type == "offline" then
					UIRenderer.draw_widget(ui_renderer, self._update_offline_data_input_icon_widget)
					UIRenderer.draw_widget(ui_renderer, self._update_offline_data_input_text_widget)
				end

				UIRenderer.draw_widget(ui_renderer, self._game_type_text)
			else
				UIRenderer.draw_widget(ui_renderer, self._legal_text)
			end

			if self._start_pressed then
				if self._draw_information_text then
					UIRenderer.draw_widget(ui_renderer, self._information_text)
				end
			else
				UIRenderer.draw_widget(ui_renderer, self._engage_prompt)
			end
		end

		UIRenderer.end_pass(ui_renderer)

		if self._show_menu then
			local render_settings = {
				alpha_multiplier = self._alpha_multiplier
			}

			UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

			for _, widget in ipairs(self._menu_widgets) do
				UIRenderer.draw_widget(ui_renderer, widget)
			end

			if self._current_menu_index then
				UIRenderer.draw_widget(ui_renderer, self._menu_selection_left)
				UIRenderer.draw_widget(ui_renderer, self._menu_selection_right)
			end

			if not self._is_in_sub_menu then
				UIRenderer.draw_widget(ui_renderer, self._info_icon_widget)
				UIRenderer.draw_widget(ui_renderer, self._info_icon_text_widget)
			end

			UIRenderer.end_pass(ui_renderer)
		end
	end
end

TitleMainUI.destroy = function (self)
	GarbageLeakDetector.register_object(self, "TitleMainUI")
	UIRenderer.destroy(self._ui_renderer, self._world)
	self:_destroy_video_players()
end

TitleMainUI.should_start = function (self)
	return self._start_pressed
end

TitleMainUI.enter_attract_mode = function (self)
	self._attract_mode_enabled = true
	self.attract_video.content.video_content.video_completed = false
end

TitleMainUI.exit_attract_mode = function (self)
	self._attract_mode_enabled = false
	self._destroy_video_player = true
end

TitleMainUI.video_completed = function (self)
	return self.attract_video.content.video_content.video_completed
end

TitleMainUI.attract_mode = function (self)
	return self._attract_mode_enabled
end

TitleMainUI.show_menu = function (self, show, force)
	self._show_menu = show
	self._show_menu_when_ready = nil
	local is_beta = script_data.settings.use_beta_mode and not GameSettingsDevelopment.allow_offline_mode_in_beta

	if not show then
		local current_menu_index = self._current_menu_index

		if current_menu_index then
			self:anim_deselect_button(nil, current_menu_index, nil, 0)

			self._current_menu_index = nil
			self._menu_item_animations[current_menu_index] = nil
		end

		self:_play_sound("Play_console_menu_back")
		self:_change_video("main")

		self._ui_scenegraph.sidebar.size[1] = 544
		self._ui_scenegraph.sidebar.position[1] = -800
		self._ui_scenegraph.sidebar_fade_bg.position[1] = -256
		self._ui_animations = {}
	else
		self:_play_sound("Play_console_menu_start")

		self._draw_information_text = nil

		self:_change_video("main_menu")

		if force then
			self._ui_scenegraph.sidebar.position[1] = 0
			self._ui_scenegraph.sidebar_fade_bg.position[1] = 544
			self._alpha_multiplier = 1
		else
			self._ui_animations.sidebar = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.sidebar.position, 1, -800, 0, 0.25, math.easeCubic)
			self._ui_animations.sidebar_fade_bg = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.sidebar_fade_bg.position, 1, -256, 544, 0.25, math.easeCubic)
			self._ui_animations.alpha_multiplier = UIAnimation.init(UIAnimation.function_by_time, self, "_alpha_multiplier", 0, 1, 0.25, math.easeCubic)
		end
	end

	if not is_beta then
		self._is_in_sub_menu = false
		self._menu_widgets = self._base_menu_widgets
	end
end

TitleMainUI.set_start_pressed = function (self, pressed)
	if self._start_pressed ~= pressed then
		if pressed then
			self._ui_animations.legal_text_fade = UIAnimation.init(UIAnimation.function_by_time, self._legal_text.style.text.text_color, 1, 255, 0, 0.2, math.easeCubic)
			self._ui_animations.information_text_fade = UIAnimation.init(UIAnimation.function_by_time, self._information_text.style.text.text_color, 1, 0, 255, 0.5, math.easeCubic)
		else
			self._ui_animations.legal_text_fade = UIAnimation.init(UIAnimation.function_by_time, self._legal_text.style.text.text_color, 1, 0, 255, 0.5, math.easeCubic)
			self._ui_animations.information_text_fade = UIAnimation.init(UIAnimation.function_by_time, self._information_text.style.text.text_color, 1, 255, 0, 0.2, math.easeCubic)
			self._draw_information_text = nil
		end
	end

	self._start_pressed = pressed
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
	local color = (item_disabled and Colors.color_definitions.gray) or Colors.color_definitions.font_title
	local select_color = (item_disabled and Colors.color_definitions.gray) or Colors.color_definitions.white

	if menu_item.style.text then
		menu_item.style.text.text_color[2] = math.lerp(color[2], select_color[2], math.smoothstep(animation_data.progress, 0, 1))
		menu_item.style.text.text_color[3] = math.lerp(color[3], select_color[3], math.smoothstep(animation_data.progress, 0, 1))
		menu_item.style.text.text_color[4] = math.lerp(color[4], select_color[4], math.smoothstep(animation_data.progress, 0, 1))
		menu_item.style.text.font_size = math.lerp(menu_item.style.text.font_size, menu_item.content.default_font_size + 10, math.easeInCubic(animation_data.progress))
	end

	local menu_item_scenegraph_id = menu_item.scenegraph_id
	local ui_scenegraph = self._ui_scenegraph
	ui_scenegraph.selection_anchor.local_position[2] = ui_scenegraph[menu_item_scenegraph_id].local_position[2] + 5
	local widget_style = menu_item.style
	local text = menu_item.content.text_field

	if text then
		local spacing = 20
		spacing = menu_item.content.spacing or spacing
		local text_width, text_height = self:_get_word_wrap_size(Localize(text), widget_style.text, 1000)
		ui_scenegraph.selection_anchor.size[1] = (text_width or 0) + spacing
		self._menu_selection_left.offset[1] = math.lerp(-50, 0, math.smoothstep(animation_data.progress, 0, 1))
		self._menu_selection_right.offset[1] = math.lerp(50, 0, math.smoothstep(animation_data.progress, 0, 1))
	end
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
	local color = (item_disabled and Colors.color_definitions.gray) or Colors.color_definitions.font_title
	local select_color = (item_disabled and Colors.color_definitions.gray) or Colors.color_definitions.white

	if menu_item.style.text then
		menu_item.style.text.text_color[2] = math.lerp(color[2], select_color[2], math.smoothstep(progress, 0, 1))
		menu_item.style.text.text_color[3] = math.lerp(color[3], select_color[3], math.smoothstep(progress, 0, 1))
		menu_item.style.text.text_color[4] = math.lerp(color[4], select_color[4], math.smoothstep(progress, 0, 1))
	end

	if menu_item.style.text then
		if optional_progress then
			menu_item.style.text.font_size = menu_item.content.default_font_size * (1 - progress)
		else
			menu_item.style.text.font_size = math.lerp(menu_item.style.text.font_size, menu_item.content.default_font_size, math.easeInCubic(progress))
		end
	end
end

TitleMainUI._get_text_size = function (self, localized_text, text_style)
	local font, scaled_font_size = UIFontByResolution(text_style)
	local text_width, text_height, min = UIRenderer.text_size(self._ui_renderer, localized_text, font[1], scaled_font_size)

	return text_width, text_height
end

TitleMainUI._get_word_wrap_size = function (self, localized_text, text_style, text_area_width)
	local font, scaled_font_size = UIFontByResolution(text_style)
	local lines = UIRenderer.word_wrap(self._ui_renderer, localized_text, font[1], scaled_font_size, text_area_width)
	local text_width, text_height = self:_get_text_size(localized_text, text_style)

	return text_width, text_height * #lines
end

TitleMainUI._add_menu_item_animation = function (self, index, func, widgets)
	self._menu_item_animations[index] = {
		progress = (self._menu_item_animations[index] and self._menu_item_animations[index].progress) or 0,
		func = func
	}
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
end

TitleMainUI.set_user_name = function (self, username)
	self._draw_gamertag = true
	self._user_gamertag_widget.content.text = username

	print("Username:", username)

	if PLATFORM == "ps4" then
		self._switch_profile_blocked = true
	end
end

TitleMainUI.clear_user_name = function (self)
	self._draw_gamertag = nil
	self._switch_profile_blocked = nil
end

TitleMainUI.set_playgo_status = function (self, status_text)
	self._draw_playgo = true
	self._playgo_status_widget.content.text = status_text
end

TitleMainUI.clear_playgo_status = function (self)
	self._draw_playgo = nil
end

TitleMainUI.set_menu_item_enable_state_by_index = function (self, item_lookup_name, enabled, sub_menu, reason)
	local index = menu_item_index_lookup[item_lookup_name]
	local menu_item_widgets = self._base_menu_widgets

	if sub_menu then
		menu_item_widgets = self._sub_menu_widgets
	end

	local menu_item = menu_item_widgets[index]
	menu_item.content.disabled = not enabled
	local color = (enabled and Colors.color_definitions.font_title) or Colors.color_definitions.gray

	if menu_item.style.text then
		local text_color = menu_item.style.text.text_color
		text_color[2] = color[2]
		text_color[3] = color[3]
		text_color[4] = color[4]
	end

	if not enabled then
		self._disabled_buttons[item_lookup_name] = {
			enabled = enabled,
			sub_menu = sub_menu,
			reason = reason
		}
	else
		self._disabled_buttons[item_lookup_name] = nil
	end
end

TitleMainUI.menu_input_enabled = function (self)
	if not self._current_menu_index then
		return false
	end

	local menu_item = self._menu_widgets[self._current_menu_index]
	local menu_item_content = menu_item.content

	return not menu_item_content.disabled
end

TitleMainUI.disable_input = function (self, disable)
	self._disable_input = disable
end

return

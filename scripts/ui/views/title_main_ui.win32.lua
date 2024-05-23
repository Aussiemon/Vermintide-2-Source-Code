-- chunkname: @scripts/ui/views/title_main_ui.win32.lua

require("scripts/ui/ui_animations")
local_require("scripts/ui/views/menu_information_slate_ui")

local definitions = local_require("scripts/ui/views/title_main_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local background_widget_definitions = definitions.background_widget_definitions
local single_widget_definitions = definitions.single_widget_definitions
local widget_definitions = definitions.widget_definitions
local menu_videos = definitions.menu_videos
local create_menu_button_func = definitions.create_menu_button_func
local legal_texts = definitions.legal_texts
local animation_definitions = definitions.animation_definitions
local create_sub_logo_func = definitions.create_sub_logo_func
local DO_RELOAD = true
local VIDEO_REFERENCE_NAME = "TitleMainUI_ATTRACTMODE"

TitleMainUI = class(TitleMainUI)

TitleMainUI.init = function (self, world)
	self._world = world
	self._render_settings = {
		snap_pixel_positions = true,
	}
	self._disable_input = false
	self._menu_hierarchy = {}
	self._menu_option_widgets = {}
	self._breadcrumbs = {}

	self:_create_ui_renderer()
	self:_setup_input()
	self:_create_ui_elements()
	self:_init_animations()
end

TitleMainUI._start_animation = function (self, animation_name)
	local params = {
		render_settings = self._render_settings,
		ui_scenegraph = self._ui_scenegraph,
	}
	local widgets = self._background_widgets
	local current_anim_id = self._animations[animation_name]

	if current_anim_id then
		self._ui_animator:stop_animation(current_anim_id)
	end

	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)

	self._animations[animation_name] = anim_id
end

TitleMainUI._create_ui_renderer = function (self)
	local materials = {
		"material",
		"materials/ui/ui_1080p_title_screen",
		"material",
		"materials/ui/ui_1080p_start_screen",
		"material",
		"materials/ui/ui_1080p_menu_atlas_textures",
		"material",
		"materials/ui/ui_1080p_menu_single_textures",
		"material",
		"materials/ui/ui_1080p_hud_single_textures",
		"material",
		"materials/fonts/gw_fonts",
		"material",
		"materials/ui/ui_1080p_common",
	}

	for name, data in pairs(menu_videos) do
		materials[#materials + 1] = "material"
		materials[#materials + 1] = data.video_name
	end

	for _, dlc in pairs(DLCSettings) do
		local ui_materials = dlc.ui_materials

		if ui_materials then
			for _, path in ipairs(ui_materials) do
				materials[#materials + 1] = "material"
				materials[#materials + 1] = path
			end
		end
	end

	self._ui_renderer = UIRenderer.create(self._world, unpack(materials))

	UISetupFontHeights(self._ui_renderer.gui)
end

TitleMainUI._setup_input = function (self)
	self._input_manager = Managers.input

	self._input_manager:create_input_service("main_menu", "TitleScreenKeyMaps", "TitleScreenFilters")
	self._input_manager:map_device_to_service("main_menu", "gamepad")
	self._input_manager:map_device_to_service("main_menu", "keyboard")
	self._input_manager:map_device_to_service("main_menu", "mouse")
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
	self._ui_animation_callbacks = {}
	self._animations = {}
	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
end

TitleMainUI._create_ui_elements = function (self)
	self._alpha_multiplier = 1
	self._disabled_buttons = {}
	self._current_menu_widgets = {}
	self._menu_item_animations = {}
	self._current_menu_index = nil
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	self:_create_videos()

	self._background_widgets = {}

	for widget_name, widget_definition in pairs(background_widget_definitions) do
		self._background_widgets[widget_name] = UIWidget.init(widget_definition)
	end

	self._engage_prompt = UIWidget.init(single_widget_definitions.create_engage_prompt(self._ui_renderer))
	self._information_text = UIWidget.init(single_widget_definitions.information_text)
	self._information_text.style.text.localize = false
	self._info_slate_widget = UIWidget.init(single_widget_definitions.info_slate)
	self._game_type_tag_widget = UIWidget.init(single_widget_definitions.game_type)
	self._game_type_description_widget = UIWidget.init(single_widget_definitions.game_type_description)
	self._menu_selection_left = UIWidget.init(single_widget_definitions.start_screen_selection_left)
	self._menu_selection_right = UIWidget.init(single_widget_definitions.start_screen_selection_right)
	self._logo_widget = UIWidget.init(single_widget_definitions.logo)

	self:_setup_legal_texts()
	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	DO_RELOAD = false
end

TitleMainUI._setup_legal_texts = function (self)
	local legal_text_widget = UIWidget.init(single_widget_definitions.legal_text)
	local legal_text_style = legal_text_widget.style.text

	legal_text_style.localize = false
	legal_text_style.vertical_alignment = "bottom"

	local legal_display_text = ""

	for _, text in ipairs(legal_texts) do
		legal_display_text = legal_display_text .. "\n" .. Localize(text)
	end

	legal_text_widget.content.text = legal_display_text
	self._legal_text = legal_text_widget
end

TitleMainUI._create_menu_option_widget = function (self, layout, menu_hierarchy)
	for _, menu_option in ipairs(layout) do
		local text = menu_option.text
		local cb = menu_option.callback
		local conditional_func = menu_option.conditional_func
		local menu_option_layout = menu_option.layout
		local index = #menu_hierarchy + 1

		if not conditional_func or conditional_func() then
			local scenegraph_id = "menu_option_" .. index
			local widget_definition = create_menu_button_func(scenegraph_id, text, cb, menu_option)
			local widget = UIWidget.init(widget_definition)

			menu_hierarchy[index] = widget

			if menu_option_layout then
				menu_hierarchy.sub_menu = menu_hierarchy.sub_menu or {}
				menu_hierarchy.sub_menu[index] = {}

				local sub_menu_hierarchy = menu_hierarchy.sub_menu[index]

				self:_create_menu_option_widget(menu_option_layout, sub_menu_hierarchy)

				local index = #sub_menu_hierarchy + 1
				local cb = callback(self, "_go_back")
				local scenegraph_id = "menu_option_" .. index
				local widget_definition = create_menu_button_func(scenegraph_id, "back_menu_button_name", cb)
				local widget = UIWidget.init(widget_definition)

				sub_menu_hierarchy[index] = widget
			end
		end
	end
end

TitleMainUI.create_menu_options = function (self, menu_layout)
	table.clear(self._menu_hierarchy)
	self:_create_menu_option_widget(menu_layout, self._menu_hierarchy)

	self._current_menu_widgets = self._menu_hierarchy
end

TitleMainUI._update_animations = function (self, dt)
	local animations = self._animations
	local ui_animations = self._ui_animations
	local ui_animation_callbacks = self._ui_animation_callbacks
	local ui_animator = self._ui_animator
	local menu_item_animations = self._menu_item_animations

	for name, ui_animation in pairs(ui_animations) do
		UIAnimation.update(ui_animation, dt)

		if UIAnimation.completed(ui_animation) then
			ui_animations[name] = nil

			local animation_callback = ui_animation_callbacks[name]

			if animation_callback then
				animation_callback()

				ui_animation_callbacks[name] = nil
			end
		end
	end

	for index, animation in pairs(menu_item_animations) do
		self[animation.func](self, animation, index, dt)
	end

	ui_animator:update(dt)

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end
end

TitleMainUI.update = function (self, dt, t, render_background_only)
	if DO_RELOAD then
		self:_create_ui_elements()
		self:_init_animations()
	end

	self:_update_information_text(dt, t)
	self:_update_input(dt, t, render_background_only)
	self:_update_animations(dt)
	self:_draw(dt, t, render_background_only)
end

TitleMainUI._update_information_text = function (self, dt, t)
	if not self._show_menu then
		local current_api_call = Managers.backend and Managers.backend:get_current_api_call()

		if current_api_call and Managers.localizer:exists(current_api_call) then
			local widget = self._information_text
			local widget_content = widget.content

			if widget_content.text ~= current_api_call then
				widget_content.text = Localize(current_api_call)
			end
		end
	end
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
	if video_widget_name == self._active_video_widget_name then
		return
	end

	World.remove_video_player(self._world, self._active_video_widget.content.video_content.video_player)

	self._active_video_widget = self._video_widgets[video_widget_name]
	self._active_video_widget_name = video_widget_name

	World.add_video_player(self._world, self._active_video_widget.content.video_content.video_player)
	self:_start_animation("video_fade_in")
end

TitleMainUI._create_videos = function (self)
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

TitleMainUI._draw_video = function (self, dt, t)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._input_manager:get_service("main_menu")
	local render_settings = self._render_settings

	render_settings.alpha_multiplier = self._alpha_multiplier

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)
	UIRenderer.draw_widget(ui_renderer, self._active_video_widget)
	UIRenderer.end_pass(ui_renderer)

	render_settings.alpha_multiplier = nil
end

TitleMainUI._go_back = function (self)
	self:_play_sound("Play_console_menu_back")

	local current_index = self._current_menu_index
	local breadcrumbs = self._breadcrumbs

	breadcrumbs[#breadcrumbs] = nil

	local menu_hierarchy = self._menu_hierarchy

	for i = 1, #breadcrumbs do
		local breadcrumb_index = breadcrumbs[i]

		menu_hierarchy = menu_hierarchy.sub_menu[breadcrumb_index]
	end

	if menu_hierarchy then
		table.clear(self._menu_item_animations)
		self:anim_deselect_button(nil, current_index, nil, 0)

		self._current_menu_widgets = menu_hierarchy
		self._current_menu_index = nil
		current_index = 1
	end

	self:_update_selection(current_index)

	return true
end

local function NULL_FUNC()
	return
end

TitleMainUI._activate_menu_widget = function (self, index)
	local current_index = self._current_menu_index
	local menu_widget = self._current_menu_widgets[index]
	local content = menu_widget.content
	local callback = content.callback or NULL_FUNC
	local result = callback()

	if result then
		return
	else
		local breadcrumbs = self._breadcrumbs
		local menu_hierarchy = self._menu_hierarchy

		for i = 1, #breadcrumbs do
			local breadcrumb_index = breadcrumbs[i]

			menu_hierarchy = menu_hierarchy.sub_menu[breadcrumb_index]
		end

		local sub_menu = menu_hierarchy.sub_menu and menu_hierarchy.sub_menu[index]

		if sub_menu then
			table.clear(self._menu_item_animations)
			self:anim_deselect_button(nil, current_index, nil, 0)

			breadcrumbs[#breadcrumbs + 1] = index
			self._current_menu_widgets = sub_menu
			self._current_menu_index = nil
			current_index = 1

			self:_play_sound("Play_console_menu_select")
		end
	end

	return current_index
end

TitleMainUI._update_mouse_input = function (self, dt, t, input_service)
	local current_index = self._current_menu_index or 1
	local menu_item = self._current_menu_widgets[current_index]
	local menu_item_content = menu_item.content
	local breadcrumbs = self._breadcrumbs
	local current_hover_index

	for index, menu_widget in ipairs(self._current_menu_widgets) do
		if UIUtils.is_button_pressed(menu_widget, "button_text") then
			current_index = self:_activate_menu_widget(index)
		elseif UIUtils.is_button_hover_enter(menu_widget, "button_text") then
			current_index = index

			self:_play_sound("play_gui_inventory_item_hover")
		end
	end

	if not table.is_empty(breadcrumbs) and input_service:get("back", true) then
		return self:_go_back()
	end

	self:_update_selection(current_index)
end

TitleMainUI._update_gamepad_input = function (self, dt, t, input_service)
	local current_index = self._current_menu_index or 1
	local menu_item = self._current_menu_widgets[current_index]
	local menu_item_content = menu_item.content
	local breadcrumbs = self._breadcrumbs

	if input_service:get("up") then
		current_index = math.clamp(current_index - 1, 1, #self._current_menu_widgets)

		self:_play_sound("play_gui_inventory_item_hover")
	elseif input_service:get("down") then
		current_index = math.clamp(current_index + 1, 1, #self._current_menu_widgets)

		self:_play_sound("play_gui_inventory_item_hover")
	elseif input_service:get("start", true) then
		current_index = self:_activate_menu_widget(current_index)
	elseif not table.is_empty(breadcrumbs) and input_service:get("back", true) then
		return self:_go_back()
	end

	self:_update_selection(current_index)
end

TitleMainUI._update_selection = function (self, current_index)
	if current_index and current_index ~= self._current_menu_index then
		if self._current_menu_index then
			self:_add_menu_item_animation(self._current_menu_index, "anim_deselect_button")
		end

		self:_add_menu_item_animation(current_index, "anim_select_button")

		self._current_menu_index = current_index

		local menu_option_widget = self._current_menu_widgets[self._current_menu_index]

		if menu_option_widget then
			self:_populate_additional_data(menu_option_widget)
		end
	end
end

local EMPTY_TABLE = {}

TitleMainUI._populate_additional_data = function (self, menu_option_widget)
	local content = menu_option_widget.content
	local menu_option_data = content.menu_option_data or EMPTY_TABLE
	local tag = menu_option_data.tag
	local logo_texture = menu_option_data.logo_texture
	local description = menu_option_data.description
	local info_slate = menu_option_data.info_slate
	local video = menu_option_data.video or "main_menu"
	local info_slate_widget = self._info_slate_widget

	info_slate_widget.content.text = info_slate

	local game_type_tag_widget = self._game_type_tag_widget

	game_type_tag_widget.content.text = tag

	local game_type_description_widget = self._game_type_description_widget

	game_type_description_widget.content.text = description
	self._sub_logo_widget = logo_texture and UIWidget.init(create_sub_logo_func(logo_texture)) or nil

	self:_change_video(video)
end

TitleMainUI._update_input = function (self, dt, t, render_background_only)
	if self._disable_input then
		return
	end

	if not self._show_menu then
		return
	end

	if render_background_only or self._frame_anim_id then
		return
	end

	if table.is_empty(self._current_menu_widgets) then
		return
	end

	local input_service = self._input_manager:get_service("main_menu")
	local mouse_active = Managers.input:is_device_active("mouse")

	if mouse_active then
		self:_update_mouse_input(dt, t, input_service)
	else
		self:_update_gamepad_input(dt, t, input_service)
	end
end

TitleMainUI._draw_menu_background = function (self, dt, t, ui_renderer, ui_scenegraph, input_service, render_settings)
	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in pairs(self._background_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	local alpha_multiplier = render_settings.alpha_multiplier or 1

	render_settings.alpha_multiplier = self._alpha_multiplier

	UIRenderer.draw_widget(ui_renderer, self._logo_widget)

	render_settings.alpha_multiplier = alpha_multiplier

	UIRenderer.end_pass(ui_renderer)
end

TitleMainUI._draw_menu = function (self, dt, t, ui_renderer, ui_scenegraph, input_service)
	if not self._show_menu then
		return
	end

	local render_settings = {
		alpha_multiplier = self._alpha_multiplier,
	}

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in ipairs(self._current_menu_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	if self._current_menu_index then
		UIRenderer.draw_widget(ui_renderer, self._menu_selection_left)
		UIRenderer.draw_widget(ui_renderer, self._menu_selection_right)
	end

	UIRenderer.draw_widget(ui_renderer, self._info_slate_widget)
	UIRenderer.draw_widget(ui_renderer, self._game_type_tag_widget)
	UIRenderer.draw_widget(ui_renderer, self._game_type_description_widget)

	if self._sub_logo_widget then
		UIRenderer.draw_widget(ui_renderer, self._sub_logo_widget)
	end

	UIRenderer.end_pass(ui_renderer)
end

TitleMainUI._draw_engage_screen = function (self, dt, t, ui_renderer, ui_scenegraph, input_service, render_settings)
	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self._render_settings)

	if not self._show_menu then
		UIRenderer.draw_widget(ui_renderer, self._legal_text)
	end

	if self._has_engaged then
		if self._draw_information_text then
			UIRenderer.draw_widget(ui_renderer, self._information_text)
		end
	else
		UIRenderer.draw_widget(ui_renderer, self._engage_prompt)
	end

	UIRenderer.end_pass(ui_renderer)
end

TitleMainUI._draw = function (self, dt, t, render_background_only)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._input_manager:get_service("main_menu")
	local render_settings = self._render_settings

	self:_draw_menu_background(dt, t, ui_renderer, ui_scenegraph, input_service, render_settings)
	self:_draw_video(dt, t)

	if self._show_menu and self._information_slate_ui then
		self._information_slate_ui:update(dt, t)
	end

	if render_background_only then
		return
	end

	self:_draw_engage_screen(dt, t, ui_renderer, ui_scenegraph, input_service, render_settings)
	self:_draw_menu(dt, t, ui_renderer, ui_scenegraph, input_service)
end

TitleMainUI.destroy = function (self)
	if self._information_slate_ui then
		self._information_slate_ui:destroy()
	end

	GarbageLeakDetector.register_object(self, "TitleMainUI")
	UIRenderer.destroy(self._ui_renderer, self._world)
	self:_destroy_video_players()
end

TitleMainUI.should_start = function (self)
	return self._has_engaged
end

TitleMainUI.show_menu = function (self, show)
	if show then
		self:_play_sound("Play_console_menu_start")
		self:_change_video("main_menu")

		self._ui_animations.sidebar = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.sidebar.position, 1, -544, 0, 0.5, math.easeCubic)
		self._ui_animations.alpha_multiplier = UIAnimation.init(UIAnimation.function_by_time, self, "_alpha_multiplier", 0, 1, 0.5, math.easeCubic)
		self._draw_information_text = false

		self._ui_animation_callbacks.alpha_multiplier = function ()
			local input_service = Managers.input:get_service("main_menu")

			self._information_slate_ui = MenuInformationSlateUI:new(self._ui_renderer, input_service)
		end
	else
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
		self._information_slate_ui = nil

		table.clear(self._ui_animations)
		table.clear(self._ui_animation_callbacks)
		table.clear(self._breadcrumbs)
	end

	self._show_menu = show
	self._is_in_sub_menu = false
	self._current_menu_widgets = self._menu_hierarchy
end

TitleMainUI.set_start_pressed = function (self, pressed)
	if self._has_engaged ~= pressed then
		if pressed then
			self._ui_animations.legal_text_fade = UIAnimation.init(UIAnimation.function_by_time, self._legal_text.style.text.text_color, 1, 255, 0, 0.2, math.easeCubic)
			self._ui_animations.information_text_fade = UIAnimation.init(UIAnimation.function_by_time, self._information_text.style.text.text_color, 1, 0, 255, 0.5, math.easeCubic)
		else
			self._ui_animations.legal_text_fade = UIAnimation.init(UIAnimation.function_by_time, self._legal_text.style.text.text_color, 1, 0, 255, 0.5, math.easeCubic)
			self._ui_animations.information_text_fade = UIAnimation.init(UIAnimation.function_by_time, self._information_text.style.text.text_color, 1, 255, 0, 0.2, math.easeCubic)
			self._draw_information_text = nil
		end
	end

	self._has_engaged = pressed
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

	local menu_item = self._current_menu_widgets[index]
	local item_disabled = menu_item.content.disabled
	local color = item_disabled and Colors.color_definitions.gray or Colors.color_definitions.font_title
	local select_color = item_disabled and Colors.color_definitions.gray or Colors.color_definitions.white

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

	local menu_item = self._current_menu_widgets[index]
	local item_disabled = menu_item and menu_item.content.disabled
	local color = item_disabled and Colors.color_definitions.gray or Colors.color_definitions.font_title
	local select_color = item_disabled and Colors.color_definitions.gray or Colors.color_definitions.white

	if menu_item and menu_item.style.text then
		menu_item.style.text.text_color[2] = math.lerp(color[2], select_color[2], math.smoothstep(progress, 0, 1))
		menu_item.style.text.text_color[3] = math.lerp(color[3], select_color[3], math.smoothstep(progress, 0, 1))
		menu_item.style.text.text_color[4] = math.lerp(color[4], select_color[4], math.smoothstep(progress, 0, 1))
	end

	if menu_item and menu_item.style.text then
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
		progress = self._menu_item_animations[index] and self._menu_item_animations[index].progress or 0,
		func = func,
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

TitleMainUI.disable_input = function (self, disable)
	self._disable_input = disable
end

TitleMainUI.view_activated = function (self, activated)
	if activated then
		self._ui_animations.sidebar = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.sidebar.size, 1, 544, 1920, 0.5, math.easeCubic)
		self._ui_animations.alpha_multiplier = UIAnimation.init(UIAnimation.function_by_time, self, "_alpha_multiplier", 1, 0, 0.5, math.easeCubic)

		if self._information_slate_ui then
			self._information_slate_ui:hide()
		end
	else
		self._ui_animations.sidebar = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.sidebar.size, 1, 1920, 544, 0.5, math.easeCubic)
		self._ui_animations.alpha_multiplier = UIAnimation.init(UIAnimation.function_by_time, self, "_alpha_multiplier", 0, 1, 0.5, math.easeCubic)

		if self._information_slate_ui then
			self._information_slate_ui:show()
		end
	end
end

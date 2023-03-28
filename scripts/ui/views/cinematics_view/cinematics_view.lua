local definitions = local_require("scripts/ui/views/cinematics_view/cinematics_view_definitions")

require("scripts/ui/views/cinematics_view/cinematics_view_settings")
require("scripts/ui/views/cutscene_overlay_ui")
require("scripts/ui/views/skip_input_ui")

local EMPTY_TABLE = {}
CinematicsView = class(CinematicsView)

CinematicsView.init = function (self, ingame_ui_context)
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._ingame_ui = ingame_ui_context.ingame_ui
	self._input_manager = ingame_ui_context.input_manager
	self._ingame_ui_context = ingame_ui_context
	self._render_settings = {
		alpha_multiplier = 0,
		snap_pixel_positions = false
	}

	self:_reset()

	local input_manager = self._input_manager

	input_manager:create_input_service("cinematics_view", "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager:map_device_to_service("cinematics_view", "keyboard")
	input_manager:map_device_to_service("cinematics_view", "mouse")
	input_manager:map_device_to_service("cinematics_view", "gamepad")
end

CinematicsView._reset = function (self)
	self._current_video_content = nil
	self._current_category_index = 1
	self._current_gamepad_selection_index = 1
	self._exiting = false
end

CinematicsView._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(definitions.widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name

	self:_destroy_video_players()

	local cinematics_settings = CinematicsViewSettings
	local ui_top_renderer = self._ui_top_renderer
	local create_cinematic_entry_func = definitions.create_cinematic_entry
	local cinematics_widgets = {}
	local cinematics_categories_lut = {}

	for i = 1, #cinematics_settings do
		local cinematics = cinematics_settings[i]

		if #cinematics > 0 then
			local category_cinematics_widgets = {}

			for j = 1, #cinematics do
				local cinematic_data = cinematics[j]
				local widget_definition = create_cinematic_entry_func(ui_top_renderer, cinematic_data, j, false, self)
				local widget = UIWidget.init(widget_definition)
				category_cinematics_widgets[#category_cinematics_widgets + 1] = widget
			end

			cinematics_widgets[#cinematics_widgets + 1] = category_cinematics_widgets
			local category_index = #cinematics_widgets
			local category_name = cinematics.category_name
			cinematics_categories_lut[category_name] = category_index
			cinematics_categories_lut[category_index] = category_name
		end
	end

	self._cinematics_widgets = cinematics_widgets
	self._cinematics_categories_lut = cinematics_categories_lut
	self._ui_animations = {}
	self._animations = {}
	self._animation_callbacks = {}
	self._ui_animator = UIAnimator:new(self._ui_scenegraph, definitions.animation_definitions)
	local ui_top_renderer = self._ui_top_renderer
	local input_service = self:input_service()
	local generic_input_actions = definitions.generic_input_actions
	self._menu_input_description = MenuInputDescriptionUI:new(nil, ui_top_renderer, input_service, 5, 900, generic_input_actions.default)

	self._menu_input_description:set_input_description(nil)
end

CinematicsView._create_scrollbar = function (self)
	local current_cinematics_widgets = self._cinematics_widgets[self._current_category_index]
	local num_elements = #current_cinematics_widgets
	local widget_definition = definitions.create_scrollbar(num_elements)
	self._scrollbar_widget = UIWidget.init(widget_definition)
	local ui_scenegraph = self._ui_scenegraph
	local list_length = num_elements * definitions.entry_size[2]
	local video_area = ui_scenegraph.video_area
	local video_area_length = video_area.size[2]
	local scroll_area_size = math.max(list_length - video_area_length, 0)
	self._scroll_area_size = scroll_area_size
end

CinematicsView._destroy_video_players = function (self)
	local ui_top_renderer = self._ui_top_renderer

	if not self._cinematics_widgets then
		return
	end

	for i = 1, #self._cinematics_widgets do
		local category_cinematics_widgets = self._cinematics_widgets[i]

		for j = 1, #category_cinematics_widgets do
			local cinematic_widget = category_cinematics_widgets[j]
			local cinematic_widget_content = cinematic_widget.content
			local reference_name = cinematic_widget_content.reference_name

			if ui_top_renderer.video_players[reference_name] then
				local world = ui_top_renderer.world

				UIRenderer.destroy_video_player(ui_top_renderer, reference_name, world)
			end
		end
	end
end

CinematicsView.input_service = function (self)
	return self._input_manager:get_service("cinematics_view")
end

CinematicsView.on_enter = function (self)
	self._input_manager:capture_input(ALL_INPUT_METHODS, 1, "cinematics_view", "CinematicsView")
	self:_create_ui_elements()
	self:_create_scrollbar()
	self:_reset()
	self:_start_animation("on_enter")
end

CinematicsView._start_animation = function (self, animation_name, callback)
	self._render_settings = self._render_settings or {
		alpha_multiplier = 0,
		snap_pixel_positions = false
	}
	local params = {
		render_settings = self._render_settings
	}
	self._animations[animation_name] = self._ui_animator:start_animation(animation_name, nil, self._ui_scenegraph, params, 1, 0)
	self._animation_callbacks[animation_name] = callback
end

CinematicsView._enable_viewport = function (self, enable)
	if IS_WINDOWS then
		local world_name = "inventory_preview"
		local viewport_name = "inventory_preview_viewport"
		local world = Managers.world:world(world_name)
		local viewport = ScriptWorld.viewport(world, viewport_name)

		if enable then
			ScriptWorld.activate_viewport(world, viewport)
			ShowCursorStack.push()
		else
			ScriptWorld.deactivate_viewport(world, viewport)

			if ShowCursorStack.stack_depth > 0 then
				ShowCursorStack.pop()
			end
		end
	elseif enable then
		ShowCursorStack.push()
	elseif ShowCursorStack.stack_depth > 0 then
		ShowCursorStack.pop()
	end
end

CinematicsView._create_skip_widget = function (self)
	local context = {
		ui_renderer = self._ui_top_renderer
	}
	self._skip_input_ui = SkipInputUI:new(self, context)
end

CinematicsView.on_exit = function (self)
	self._input_manager:release_input(ALL_INPUT_METHODS, 1, "cinematics_view", "CinematicsView")
	self:deactivate_video()
	self:_destroy_video_players()
end

CinematicsView.do_exit = function (self, return_to_game)
	self:_start_animation("on_exit", callback(self, "exit", return_to_game))

	self._exiting = true

	Managers.music:trigger_event(IS_WINDOWS and "Play_hud_select" or "Play_console_menu_select")
end

CinematicsView.update = function (self, dt, t)
	self:_update_input(dt, t)
	self:_update_animations(dt, t)
	self:_update_video(dt, t)
	self:_draw(dt, t)
end

CinematicsView.current_gamepad_selection = function (self)
	return self._current_gamepad_selection_index
end

local EMPTY_TABLE = {}

CinematicsView._update_input = function (self, dt, t)
	if self._exiting then
		return
	end

	local input_service = self:input_service()
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local current_video_content = self._current_video_content
	local toggle_menu_input = input_service:get("toggle_menu", true)
	local back_input = input_service:get("back_menu", true)
	local input_device = Managers.input:get_most_recent_device()
	local any_input_pressed = input_device.any_pressed()
	local fade_edge_hotspot = self._widgets_by_name.fade_edge_hotspot
	local fade_edge_hotspot_content = fade_edge_hotspot.content
	local on_enter_animation_id = self._animations.on_enter
	local fade_edge_hotspot = self._ui_animator:is_animation_completed(on_enter_animation_id) and fade_edge_hotspot_content.hotspot or EMPTY_TABLE

	if not current_video_content and (toggle_menu_input or back_input or fade_edge_hotspot.on_pressed) then
		self:do_exit()

		return
	elseif current_video_content and self._skip_input_ui and self._skip_input_ui:skipped() then
		self:deactivate_video()
	elseif input_service:get("confirm_press") then
		local current_gamepad_selection_index = self._current_gamepad_selection_index
		local category_cinematics_widgets = self._cinematics_widgets[self._current_category_index]
		local widget = category_cinematics_widgets[current_gamepad_selection_index]
		local widget_content = widget.content
		local widget_video_content = widget_content.video_content
		local widget_reference_name = widget_video_content.video_player_reference
		local current_reference_name = current_video_content and current_video_content.video_player_reference

		if widget_reference_name ~= current_reference_name then
			self:activate_video(widget_video_content, current_gamepad_selection_index)
		end
	end

	if not current_video_content then
		self:_update_scrollbar(dt, t, input_service, gamepad_active)
	end
end

CinematicsView._update_animations = function (self, dt, t)
	local ui_animations = self._ui_animations

	for anmation_name, anmation in pairs(ui_animations) do
		UIAnimation.update(anmation, dt)

		if UIAnimation.completed(anmation) then
			ui_animations[anmation_name] = nil
		end
	end

	local ui_animator = self._ui_animator

	ui_animator:update(dt)

	local animations = self._animations
	local animation_callbacks = self._animation_callbacks

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			animations[animation_name] = nil

			if animation_callbacks[animation_name] then
				animation_callbacks[animation_name]()

				animation_callbacks[animation_name] = nil
			end
		end
	end
end

CinematicsView._update_scrollbar = function (self, dt, t, input_service, gamepad_active)
	local video_area_widget = self._widgets_by_name.video_area
	local video_area_content = video_area_widget.content
	local video_area_hotspot = video_area_content.hotspot
	local scrollbar_widget = self._scrollbar_widget
	local scrollbar_widget_content = scrollbar_widget.content
	local scrollbar_widget_style = scrollbar_widget.style
	local scrollbar_widget_scrollbar_hotspot = scrollbar_widget_content.hotspot
	local scrollbar_widget_scroller_hotspot = scrollbar_widget_content.scroller_hotspot
	local scroller_style = scrollbar_widget_style.scroller
	local scroll = input_service:get("scroll_axis")
	local cursor = input_service:get("cursor")
	local cursor_y = cursor and cursor[2] or 0

	if IS_WINDOWS and not gamepad_active then
		cursor_y = cursor_y * RESOLUTION_LOOKUP.inv_scale
	end

	local ui_scenegraph = self._ui_scenegraph
	local anchor_point = ui_scenegraph.anchor_point
	local anchor_point_local_position = anchor_point.local_position

	if scrollbar_widget_scroller_hotspot.on_pressed then
		self._cursor_start_pos = cursor_y
		self._scrollbar_start_pos = anchor_point_local_position[2]
		self._ui_animations.scroll = nil
		scrollbar_widget_scroller_hotspot.selected = true
	elseif self._cursor_start_pos then
		if input_service:get("left_hold") then
			local scrollbar_size = ui_scenegraph.scrollbar.size[2]
			local area_size = ui_scenegraph.video_area.size[2]
			local scroller_size = scroller_style.area_size[2]
			local cursor_pos = cursor_y
			local diff = self._cursor_start_pos - cursor_pos
			local diff_percentage = diff / (area_size - scroller_size)
			anchor_point_local_position[2] = math.clamp(self._scrollbar_start_pos + diff_percentage * self._scroll_area_size, 0, self._scroll_area_size)
		else
			self._cursor_start_pos = nil
			self._scrollbar_start_pos = nil
			scrollbar_widget_scroller_hotspot.selected = false
		end
	elseif scrollbar_widget_scrollbar_hotspot.on_pressed then
		local area_start = ui_scenegraph.video_area.world_position[2]
		local area_size = ui_scenegraph.video_area.size[2]
		local scroller_size = scroller_style.area_size[2]
		local cursor_pos = cursor_y - scroller_size * 0.5
		local cursor_offset = cursor_pos - area_start
		local cursor_percentage = 1 - cursor_offset / (area_size - scroller_size)

		print(cursor_pos, area_start, area_size, cursor_offset, cursor_percentage)

		anchor_point_local_position[2] = math.clamp(self._scroll_area_size * cursor_percentage, 0, self._scroll_area_size)
	elseif video_area_hotspot.is_hover and math.abs(scroll[2]) > 0 then
		local speed = 200
		local data = anchor_point_local_position
		local index = 2
		local start_value = anchor_point_local_position[2]
		local end_value = math.clamp(anchor_point_local_position[2] - scroll[2] * speed, 0, self._scroll_area_size)
		self._ui_animations.scroll = UIAnimation.init(UIAnimation.function_by_time, data, index, start_value, end_value, 0.5, math.easeOutCubic)
	else
		local current_cinematics_widgets = self._cinematics_widgets[self._current_category_index]
		local num_elements = #current_cinematics_widgets
		local gamepad_selection_index = self._current_gamepad_selection_index

		if input_service:get("move_up_hold_continuous") then
			gamepad_selection_index = math.clamp(gamepad_selection_index - 1, 1, num_elements)
		elseif input_service:get("move_down_hold_continuous") then
			gamepad_selection_index = math.clamp(gamepad_selection_index + 1, 1, num_elements)
		end

		if gamepad_selection_index ~= self._current_gamepad_selection_index then
			local step_size = definitions.entry_size[2]
			local data = anchor_point_local_position
			local index = 2
			local start_value = anchor_point_local_position[2]
			local end_value = math.clamp(step_size * (gamepad_selection_index - 1), 0, self._scroll_area_size)
			self._ui_animations.scroll = UIAnimation.init(UIAnimation.function_by_time, data, index, start_value, end_value, 0.5, math.easeOutCubic)
			self._current_gamepad_selection_index = gamepad_selection_index

			self:_play_sound("play_gui_start_menu_button_hover")
		end
	end

	local scrollbar_size = ui_scenegraph.scrollbar.size[2]
	local scroll_progress = anchor_point_local_position[2] / self._scroll_area_size
	scroller_style.offset[2] = scroll_progress * (scrollbar_size - scroller_style.area_size[2]) * -1
end

CinematicsView._update_video = function (self)
	local current_video_content = self._current_video_content

	if current_video_content then
		local reference_name = current_video_content.video_player_reference
		local video_player = self._ui_top_renderer.video_players[reference_name]
		local num_frames = VideoPlayer.number_of_frames(video_player)
		local current_frame = VideoPlayer.current_frame(video_player)

		if num_frames <= current_frame then
			self:deactivate_video()
		end
	end
end

CinematicsView.deactivate_video = function (self)
	if self._current_video_content then
		self:_reset_sound()
		self:_enable_viewport(true)

		local reference_name = self._current_video_content.video_player_reference
		local ui_top_renderer = self._ui_top_renderer

		if ui_top_renderer.video_players[reference_name] then
			local world = ui_top_renderer.world

			UIRenderer.destroy_video_player(ui_top_renderer, reference_name, world)
		end
	end

	if self._cutscene_overlay_ui then
		self._cutscene_overlay_ui:destroy()

		self._cutscene_overlay_ui = nil
	end

	if self._skip_input_ui then
		self._skip_input_ui:destroy()

		self._skip_input_ui = nil
	end

	self._current_video_content = nil

	Managers.chat:set_chat_enabled(true)
end

CinematicsView._play_sound = function (self, sound_event)
	if IS_WINDOWS then
		local world_name = IS_CONSOLE and "title_screen_world" or "level_world"
		local world = Managers.world:world(world_name)
		local wwise_world = Managers.world:wwise_world(world)

		WwiseWorld.trigger_event(wwise_world, sound_event)
	else
		Managers.music:trigger_event(sound_event)
	end
end

CinematicsView._start_video_sound = function (self, sound_start, sound_stop)
	if IS_WINDOWS then
		self:_play_sound("play_gui_amb_hero_screen_loop_end")
		self:_play_sound("Play_hud_start_cinematic")

		if sound_stop then
			self:_play_sound(sound_stop)
		end
	else
		Managers.music:stop_all_sounds()
	end

	if sound_start then
		self:_play_sound(sound_start)
	end
end

CinematicsView._reset_sound = function (self)
	local current_video_content = self._current_video_content
	local current_video_data = current_video_content.video_data
	local sound_stop = current_video_data.sound_stop

	if sound_stop then
		self:_play_sound(sound_stop)
	end

	self:_play_sound(IS_CONSOLE and "Play_console_menu_music" or "Play_menu_screen_music")

	if IS_WINDOWS then
		self:_play_sound("play_gui_amb_hero_screen_loop_begin")
	end
end

CinematicsView.activate_video = function (self, video_content, index)
	if self._exiting then
		return
	end

	local current_video_content = self._current_video_content or EMPTY_TABLE
	local ui_top_renderer = self._ui_top_renderer
	local reference_name = video_content.video_player_reference
	local current_reference_name = current_video_content.video_player_reference

	if reference_name == current_reference_name then
		return
	end

	local video_data = video_content.video_data

	if not ui_top_renderer.video_players[reference_name] then
		UIRenderer.create_video_player(ui_top_renderer, reference_name, ui_top_renderer.world, video_data.resource, video_data.set_loop or false)
	end

	local video_player = ui_top_renderer.video_players[reference_name]
	local current_video_data = current_video_content.video_data or EMPTY_TABLE
	local sound_start = video_data.sound_start
	local sound_stop = current_video_data.sound_stop

	self:_start_video_sound(sound_start, sound_stop)
	self:_setup_subtitles(video_data.subtitle_template_settings)
	self:_enable_viewport(false)
	self:_create_skip_widget()

	self._current_video_content = video_content
	self._current_gamepad_selection_index = index

	Managers.chat:set_chat_enabled(false)
end

CinematicsView._setup_subtitles = function (self, subtitle_template_settings)
	self._cutscene_overlay_ui = nil

	if subtitle_template_settings then
		local context = {
			ui_renderer = self._ui_top_renderer
		}
		self._cutscene_overlay_ui = CutsceneOverlayUI:new(self, context)

		self._cutscene_overlay_ui:start(subtitle_template_settings)
	end
end

CinematicsView.is_video_active = function (self, reference_name)
	local current_video_content = self._current_video_content or EMPTY_TABLE
	local current_reference_name = current_video_content.video_player_reference

	return reference_name == current_reference_name
end

CinematicsView._draw = function (self, dt, t)
	local input_service = self:input_service()
	local ui_top_renderer = self._ui_top_renderer
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local render_settings = self._render_settings
	local gamepad_active = Managers.input:is_device_active("gamepad")

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for i = 1, #self._widgets do
		local widget = self._widgets[i]

		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	if not self._exiting then
		local video_area = ui_scenegraph.video_area
		local video_area_y = video_area.world_position[2]
		local video_area_size_y = video_area.size[2]
		local anchor_point = ui_scenegraph.anchor_point
		local anchor_y = anchor_point.world_position[2]
		local cinematics_widgets = self._cinematics_widgets[self._current_category_index]

		for i = 1, #cinematics_widgets do
			local widget = cinematics_widgets[i]
			local y_pos = anchor_y - definitions.entry_size[2] * (i - 1)

			if y_pos < video_area_y + video_area_size_y and video_area_y < y_pos + definitions.entry_size[2] then
				UIRenderer.draw_widget(ui_top_renderer, widget)
			end
		end
	end

	UIRenderer.draw_widget(ui_top_renderer, self._scrollbar_widget)
	UIRenderer.end_pass(ui_top_renderer)

	local current_video_content = self._current_video_content

	if current_video_content then
		if self._cutscene_overlay_ui then
			self._cutscene_overlay_ui:update(dt)
		end

		if self._skip_input_ui then
			self._skip_input_ui:update(dt, t, input_service, render_settings)
		end
	elseif gamepad_active then
		self._menu_input_description:draw(ui_top_renderer, dt)
	end
end

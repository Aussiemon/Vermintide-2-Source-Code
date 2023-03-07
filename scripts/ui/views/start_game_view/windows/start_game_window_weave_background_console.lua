local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_weave_background_console_definitions")
local top_widget_definitions = definitions.top_widgets
local bottom_widget_definitions = definitions.bottom_widgets
local bottom_hdr_widget_definitions = definitions.bottom_hdr_widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local DO_RELOAD = false
StartGameWindowWeaveBackgroundConsole = class(StartGameWindowWeaveBackgroundConsole)
StartGameWindowWeaveBackgroundConsole.NAME = "StartGameWindowWeaveBackgroundConsole"

StartGameWindowWeaveBackgroundConsole.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowWeaveBackgroundConsole")

	self._params = params
	self._parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self._ingame_ui = ingame_ui_context.ingame_ui
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._statistics_db = ingame_ui_context.statistics_db
	self._render_settings = {
		snap_pixel_positions = true
	}
	self._network_lobby = ingame_ui_context.network_lobby
	self._is_server = ingame_ui_context.is_server
	self._is_in_inn = ingame_ui_context.is_in_inn
	self._ui_hdr_renderer = self._parent:hdr_renderer()
	self._my_player = ingame_ui_context.player
	self._animations = {}
	self._ui_animations = {}

	self:_create_ui_elements(params, offset)
	self:_play_sound("menu_wind_level_open")
end

StartGameWindowWeaveBackgroundConsole._create_ui_elements = function (self, params, offset)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local widgets_by_name = {}
	local top_widgets = {}

	for name, widget_definition in pairs(top_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		top_widgets[#top_widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	local bottom_widgets = {}

	for name, widget_definition in pairs(bottom_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		bottom_widgets[#bottom_widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	local bottom_hdr_widgets = {}

	for name, widget_definition in pairs(bottom_hdr_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		bottom_hdr_widgets[#bottom_hdr_widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._top_widgets = top_widgets
	self._bottom_widgets = bottom_widgets
	self._bottom_hdr_widgets = bottom_hdr_widgets
	self._widgets_by_name = widgets_by_name

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self.ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)

	self:_set_background_wheel_visibility(true)
end

StartGameWindowWeaveBackgroundConsole.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowWeaveBackgroundConsole")

	self.ui_animator = nil

	self:_play_sound("menu_wind_level_close")
end

StartGameWindowWeaveBackgroundConsole.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:_create_ui_elements()
	end

	self:_update_animations(dt, t)
	self:draw(dt)
end

StartGameWindowWeaveBackgroundConsole.post_update = function (self, dt, t)
	return
end

StartGameWindowWeaveBackgroundConsole._update_animations = function (self, dt, t)
	local ui_animations = self._ui_animations
	local animations = self._animations
	local ui_animator = self.ui_animator

	for name, animation in pairs(ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			ui_animations[name] = nil
		end
	end

	ui_animator:update(dt)

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	if self._draw_background_wheel then
		self:_update_background_animations(dt)
		self:_animate_wheel_position(dt)
		self:_animate_background_color(dt)
	end
end

StartGameWindowWeaveBackgroundConsole._set_background_wheel_visibility = function (self, visible)
	local widgets_by_name = self._widgets_by_name
	local background_wheel_1 = widgets_by_name.background_wheel_1
	local hdr_background_wheel_1 = widgets_by_name.hdr_background_wheel_1
	background_wheel_1.content.visible = visible
	hdr_background_wheel_1.content.visible = visible

	for i = 1, 2 do
		local wheel_ring_1 = widgets_by_name["wheel_ring_" .. i .. "_1"]
		local wheel_ring_2 = widgets_by_name["wheel_ring_" .. i .. "_2"]
		local wheel_ring_3 = widgets_by_name["wheel_ring_" .. i .. "_3"]
		local hdr_wheel_ring_1 = widgets_by_name["hdr_wheel_ring_" .. i .. "_1"]
		local hdr_wheel_ring_2 = widgets_by_name["hdr_wheel_ring_" .. i .. "_2"]
		local hdr_wheel_ring_3 = widgets_by_name["hdr_wheel_ring_" .. i .. "_3"]
		wheel_ring_1.content.visible = visible
		wheel_ring_2.content.visible = visible
		wheel_ring_3.content.visible = visible
		hdr_wheel_ring_1.content.visible = visible
		hdr_wheel_ring_2.content.visible = visible
		hdr_wheel_ring_3.content.visible = visible
	end

	self._draw_background_wheel = visible
end

StartGameWindowWeaveBackgroundConsole._update_background_animations = function (self, dt)
	local widgets_by_name = self._widgets_by_name

	for i = 1, 2 do
		local wheel_ring_1 = widgets_by_name["wheel_ring_" .. i .. "_1"]
		local wheel_ring_2 = widgets_by_name["wheel_ring_" .. i .. "_2"]
		local wheel_ring_3 = widgets_by_name["wheel_ring_" .. i .. "_3"]
		local hdr_wheel_ring_1 = widgets_by_name["hdr_wheel_ring_" .. i .. "_1"]
		local hdr_wheel_ring_2 = widgets_by_name["hdr_wheel_ring_" .. i .. "_2"]
		local hdr_wheel_ring_3 = widgets_by_name["hdr_wheel_ring_" .. i .. "_3"]
		local degrees = 360
		local radians = math.degrees_to_radians(degrees)
		local speed_1 = dt * 0.01
		local speed_2 = dt * 0.008
		local speed_3 = dt * 0.006
		wheel_ring_1.style.texture_id.angle = (wheel_ring_1.style.texture_id.angle + radians * speed_1) % radians
		wheel_ring_2.style.texture_id.angle = (wheel_ring_2.style.texture_id.angle - radians * speed_2) % -radians
		wheel_ring_3.style.texture_id.angle = (wheel_ring_3.style.texture_id.angle + radians * speed_3) % radians
		hdr_wheel_ring_1.style.texture_id.angle = wheel_ring_1.style.texture_id.angle
		hdr_wheel_ring_2.style.texture_id.angle = wheel_ring_2.style.texture_id.angle
		hdr_wheel_ring_3.style.texture_id.angle = wheel_ring_3.style.texture_id.angle
	end

	local matchmaking_manager = Managers.matchmaking
	local is_game_matchmaking = matchmaking_manager:is_game_matchmaking()
	local speed = is_game_matchmaking and 4 or 2.5
	local progress = 0.5 + math.sin(Managers.time:time("ui") * speed) * 0.5

	self:_set_background_bloom_intensity(progress, is_game_matchmaking)
end

StartGameWindowWeaveBackgroundConsole._set_background_bloom_intensity = function (self, fraction, is_game_matchmaking)
	local min = 1.39
	local max = is_game_matchmaking and 10 or 2
	local value = min + math.clamp(fraction, 0, 1) * max
	local ui_hdr_renderer = self._ui_hdr_renderer
	local gui = ui_hdr_renderer.gui
	local widgets_by_name = self._widgets_by_name
	local hdr_background_wheel_1 = widgets_by_name.hdr_background_wheel_1
	local texture_background_wheel_1 = hdr_background_wheel_1.content.texture_id
	local gui_material_background_wheel_1 = Gui.material(gui, texture_background_wheel_1)

	Material.set_scalar(gui_material_background_wheel_1, "noise_intensity", value)

	for i = 1, 2 do
		local hdr_wheel_ring_1 = widgets_by_name["hdr_wheel_ring_" .. i .. "_1"]
		local hdr_wheel_ring_2 = widgets_by_name["hdr_wheel_ring_" .. i .. "_2"]
		local hdr_wheel_ring_3 = widgets_by_name["hdr_wheel_ring_" .. i .. "_3"]
		local texture_wheel_ring_1 = hdr_wheel_ring_1.content.texture_id
		local texture_wheel_ring_2 = hdr_wheel_ring_2.content.texture_id
		local texture_wheel_ring_3 = hdr_wheel_ring_3.content.texture_id
		local gui_material_wheel_ring_1 = Gui.material(gui, texture_wheel_ring_1)
		local gui_material_wheel_ring_2 = Gui.material(gui, texture_wheel_ring_2)
		local gui_material_wheel_ring_3 = Gui.material(gui, texture_wheel_ring_3)

		Material.set_scalar(gui_material_wheel_ring_1, "noise_intensity", value)
		Material.set_scalar(gui_material_wheel_ring_2, "noise_intensity", value)
		Material.set_scalar(gui_material_wheel_ring_3, "noise_intensity", value)
	end
end

StartGameWindowWeaveBackgroundConsole._play_sound = function (self, event)
	self._parent:play_sound(event)
end

StartGameWindowWeaveBackgroundConsole._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level
end

StartGameWindowWeaveBackgroundConsole.draw = function (self, dt)
	local ui_renderer = self._parent:ui_renderer()
	local ui_top_renderer = self._ui_top_renderer
	local ui_hdr_renderer = self._ui_hdr_renderer
	local ui_scenegraph = self._ui_scenegraph
	local render_settings = self._render_settings
	local input_service = self._parent:window_input_service()

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in ipairs(self._top_widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	UIRenderer.end_pass(ui_top_renderer)
	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in ipairs(self._bottom_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)
	UIRenderer.begin_pass(ui_hdr_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in ipairs(self._bottom_hdr_widgets) do
		UIRenderer.draw_widget(ui_hdr_renderer, widget)
	end

	UIRenderer.end_pass(ui_hdr_renderer)
end

StartGameWindowWeaveBackgroundConsole._play_sound = function (self, event)
	self._parent:play_sound(event)
end

StartGameWindowWeaveBackgroundConsole._animate_pulse = function (self, target, target_index, from, to, speed)
	local new_animation = UIAnimation.init(UIAnimation.pulse_animation, target, target_index, from, to, speed)

	return new_animation
end

StartGameWindowWeaveBackgroundConsole._animate_element_by_time = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.function_by_time, target, target_index, from, to, time, math.ease_out_quad)

	return new_animation
end

StartGameWindowWeaveBackgroundConsole._animate_element_by_catmullrom = function (self, target, target_index, target_value, p0, p1, p2, p3, time)
	local new_animation = UIAnimation.init(UIAnimation.catmullrom, target, target_index, target_value, p0, p1, p2, p3, time)

	return new_animation
end

StartGameWindowWeaveBackgroundConsole._animate_wheel_position = function (self, dt)
	local parent = self._parent
	local selected_layout_name = parent:get_selected_layout_name()
	self._current_offset = self._current_offset or {
		0,
		0
	}
	self._starting_point = self._starting_point or {
		0,
		0
	}
	self._offset_destinations = self._offset_destinations or {
		weave_ranked = {
			300,
			120
		},
		weave_quickplay = {
			0,
			220
		},
		default = {
			0,
			0
		}
	}

	if self._old_selection_layout_name ~= selected_layout_name then
		self._starting_point[1] = self._current_offset[1]
		self._starting_point[2] = self._current_offset[2]
		self._old_selection_layout_name = selected_layout_name
		self._wheel_position_progress = 0
	end

	local speed = 2
	local wheel_position_progress = self._wheel_position_progress or 0
	wheel_position_progress = math.min(wheel_position_progress + speed * dt, 1)
	local anim_progress = math.easeOutCubic(wheel_position_progress)
	local destination = self._offset_destinations[selected_layout_name] or self._offset_destinations.default
	self._current_offset[1] = math.lerp(self._starting_point[1], destination[1], anim_progress)
	self._current_offset[2] = math.lerp(self._starting_point[2], destination[2], anim_progress)
	local scenegraph_id = "background_wheel"
	local target_index = 1
	local ui_scenegraph = self._ui_scenegraph
	local scenegraph = ui_scenegraph[scenegraph_id]
	local definition = scenegraph_definition[scenegraph_id]
	local position = scenegraph.position
	local default_position = definition.position
	position[target_index] = default_position[target_index] + self._current_offset[1]
	position[2] = default_position[2] + self._current_offset[2]
	self._wheel_position_progress = wheel_position_progress
end

StartGameWindowWeaveBackgroundConsole._animate_background_color = function (self, dt, t)
	local parent = self._parent
	local selected_layout_name = parent:get_selected_layout_name()
	self._current_alpha = self._current_alpha or 0
	self._starting_alpha = self._starting_alpha or 0
	self._alpha_destinations = {
		lobby_browser_weave = 0.3,
		default = 0.1
	}

	if self._old_color_selection_layout_name ~= selected_layout_name then
		self._starting_alpha = self._current_alpha
		self._old_color_selection_layout_name = selected_layout_name
		self._alpha_progress = 0
	end

	local speed = 0.5
	local alpha_progress = self._alpha_progress or 0
	alpha_progress = math.min(alpha_progress + speed * dt, 1)
	local anim_progress = math.easeOutCubic(alpha_progress)
	local starting_alpha = self._starting_alpha
	local destination_alpha = self._alpha_destinations[selected_layout_name] or self._alpha_destinations.default
	self._current_alpha = math.lerp(starting_alpha, destination_alpha, anim_progress)
	local window_background_widget = self._widgets_by_name.window_background
	local window_background_widget_style = window_background_widget.style
	local window_background_widget_content = window_background_widget.content
	window_background_widget_style.rect.color[2] = definitions.window_background_color[2] * self._current_alpha
	window_background_widget_style.rect.color[3] = definitions.window_background_color[3] * self._current_alpha
	window_background_widget_style.rect.color[4] = definitions.window_background_color[4] * self._current_alpha
	self._alpha_progress = alpha_progress
end

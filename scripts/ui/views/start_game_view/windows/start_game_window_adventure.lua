local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_adventure_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local DO_RELOAD = false
StartGameWindowAdventure = class(StartGameWindowAdventure)
StartGameWindowAdventure.NAME = "StartGameWindowAdventure"
StartGameWindowAdventure.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowAdventure")

	self.parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self.ui_renderer = ingame_ui_context.ui_renderer
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
	self._animations = {}

	self.create_ui_elements(self, params, offset)
	self.parent:set_play_button_enabled(true)

	return 
end
StartGameWindowAdventure.create_ui_elements = function (self, params, offset)
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

	return 
end
StartGameWindowAdventure.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowAdventure")

	self.ui_animator = nil

	return 
end
StartGameWindowAdventure.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self.create_ui_elements(self)
	end

	self._update_animations(self, dt)
	self._handle_input(self, dt, t)
	self.draw(self, dt)

	return 
end
StartGameWindowAdventure.post_update = function (self, dt, t)
	return 
end
StartGameWindowAdventure._update_animations = function (self, dt)
	self.ui_animator:update(dt)

	local animations = self._animations
	local ui_animator = self.ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator.is_animation_completed(ui_animator, animation_id) then
			ui_animator.stop_animation(ui_animator, animation_id)

			animations[animation_name] = nil
		end
	end

	local widgets_by_name = self._widgets_by_name

	return 
end
StartGameWindowAdventure._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end

	return 
end
StartGameWindowAdventure._is_stepper_button_pressed = function (self, widget)
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
StartGameWindowAdventure._handle_input = function (self, dt, t)
	return 
end
StartGameWindowAdventure._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level

	return 
end
StartGameWindowAdventure.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
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
StartGameWindowAdventure._play_sound = function (self, event)
	self.parent:play_sound(event)

	return 
end

return 

local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_mutator_summary_console_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
StartGameWindowMutatorSummaryConsole = class(StartGameWindowMutatorSummaryConsole)
StartGameWindowMutatorSummaryConsole.NAME = "StartGameWindowMutatorSummaryConsole"

StartGameWindowMutatorSummaryConsole.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowMutatorSummaryConsole")

	self.parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self.ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
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
	self._animations = {}

	self:create_ui_elements(params, offset)

	self.previous_selected_backend_id = self.parent:get_selected_heroic_deed_backend_id()
end

StartGameWindowMutatorSummaryConsole._start_transition_animation = function (self, animation_name)
	local params = {
		render_settings = self.render_settings
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[animation_name] = anim_id
end

StartGameWindowMutatorSummaryConsole.create_ui_elements = function (self, params, offset)
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

	widgets_by_name.game_option_placeholder.content.visible = true
end

StartGameWindowMutatorSummaryConsole.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowMutatorSummaryConsole")

	self.ui_animator = nil

	if not self.confirm_button_pressed then
		self.parent:set_selected_heroic_deed_backend_id(self.previous_selected_backend_id)
	end
end

StartGameWindowMutatorSummaryConsole.update = function (self, dt, t)
	self:_update_animations(dt)
	self:_update_selected_item_backend_id()
	self:draw(dt)
end

StartGameWindowMutatorSummaryConsole.post_update = function (self, dt, t)
	return
end

StartGameWindowMutatorSummaryConsole._update_animations = function (self, dt)
	local ui_animator = self.ui_animator

	ui_animator:update(dt)

	local animations = self._animations

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end
end

StartGameWindowMutatorSummaryConsole._update_selected_item_backend_id = function (self)
	local backend_id = self.parent:get_selected_heroic_deed_backend_id()

	if backend_id ~= self._selected_backend_id then
		self._selected_backend_id = backend_id

		self:_present_item_by_backend_id(backend_id)
	end
end

StartGameWindowMutatorSummaryConsole._present_item_by_backend_id = function (self, backend_id)
	local was_presenting_item = self._presenting_item
	self._presenting_item = false

	if not backend_id then
		return
	end

	local widgets_by_name = self._widgets_by_name
	widgets_by_name.game_option_placeholder.content.visible = false
	local item_interface = Managers.backend:get_interface("items")
	local item = item_interface:get_item_from_id(backend_id)
	widgets_by_name.item_presentation.content.item = item
	self._presenting_item = true
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if not was_presenting_item and (not IS_WINDOWS or gamepad_active) then
		self:_start_transition_animation("on_enter")
	end
end

StartGameWindowMutatorSummaryConsole.draw = function (self, dt)
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	if self._presenting_item then
		local widgets = self._widgets

		for i = 1, #widgets do
			local widget = widgets[i]

			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_top_renderer)
end

local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_mutator_summary_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local DO_RELOAD = false
StartGameWindowMutatorSummary = class(StartGameWindowMutatorSummary)
StartGameWindowMutatorSummary.NAME = "StartGameWindowMutatorSummary"
StartGameWindowMutatorSummary.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowMutatorSummary")

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

	self.previous_selected_backend_id = self.parent:get_selected_heroic_deed_backend_id()

	return 
end
StartGameWindowMutatorSummary.create_ui_elements = function (self, params, offset)
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

	widgets_by_name.confirm_button.content.button_hotspot.disable_button = true
	widgets_by_name.item_presentation_frame.content.visible = false
	widgets_by_name.item_presentation_bg.content.visible = false
	widgets_by_name.game_option_placeholder.content.visible = true

	return 
end
StartGameWindowMutatorSummary.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowMutatorSummary")

	self.ui_animator = nil

	if not self.confirm_button_pressed then
		self.parent:set_selected_heroic_deed_backend_id(self.previous_selected_backend_id)
	end

	return 
end
StartGameWindowMutatorSummary.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self.create_ui_elements(self)
	end

	self._update_animations(self, dt)
	self._handle_input(self, dt, t)
	self._update_selected_item_backend_id(self)
	self.draw(self, dt)

	return 
end
StartGameWindowMutatorSummary.post_update = function (self, dt, t)
	return 
end
StartGameWindowMutatorSummary._update_animations = function (self, dt)
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
StartGameWindowMutatorSummary._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end

	return 
end
StartGameWindowMutatorSummary._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end
StartGameWindowMutatorSummary._handle_input = function (self, dt, t)
	if not self._selected_backend_id then
		return 
	end

	local confirm_button = self._widgets_by_name.confirm_button

	UIWidgetUtils.animate_default_button(confirm_button, dt)

	if self._is_button_hover_enter(self, confirm_button) then
		self._play_sound(self, "play_gui_lobby_button_01_difficulty_confirm_hover")
	end

	if self._is_button_pressed(self, confirm_button) then
		self.confirm_button_pressed = true

		self.parent:set_layout(3)
	end

	return 
end
StartGameWindowMutatorSummary._update_selected_item_backend_id = function (self)
	local backend_id = self.parent:get_selected_heroic_deed_backend_id()

	if backend_id ~= self._selected_backend_id then
		self._selected_backend_id = backend_id

		self._present_item_by_backend_id(self, backend_id)
	end

	return 
end
StartGameWindowMutatorSummary._present_item_by_backend_id = function (self, backend_id)
	if not backend_id then
		return 
	end

	local widgets_by_name = self._widgets_by_name
	widgets_by_name.item_presentation_frame.content.visible = true
	widgets_by_name.item_presentation_bg.content.visible = true
	widgets_by_name.game_option_placeholder.content.visible = false
	local item_interface = Managers.backend:get_interface("items")
	local item = item_interface.get_item_from_id(item_interface, backend_id)
	widgets_by_name.item_presentation.content.item = item
	local level_key = item.level_key
	local unlocked = Managers.matchmaking:party_has_level_unlocked(level_key)
	local disable_confirm = not unlocked
	local alpha = (disable_confirm and 255) or 0
	widgets_by_name.confirm_button.content.button_hotspot.disable_button = disable_confirm
	widgets_by_name.level_locked_text.style.text.text_color[1] = alpha
	widgets_by_name.level_locked_text.style.text_shadow.text_color[1] = alpha

	return 
end
StartGameWindowMutatorSummary._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level

	return 
end
StartGameWindowMutatorSummary.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)

	return 
end
StartGameWindowMutatorSummary._play_sound = function (self, event)
	self.parent:play_sound(event)

	return 
end

return 

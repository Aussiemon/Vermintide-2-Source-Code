CommonPopup = class(CommonPopup)

CommonPopup.init = function (self, ui_context, dlc_name, common_settings)
	self._ui_context = ui_context
	self._ui_renderer = ui_context.ui_renderer
	self._ui_top_renderer = ui_context.ui_top_renderer
	self._input_manager = ui_context.input_manager
	self._wwise_world = ui_context.wwise_world
	self._render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = true
	}
	self._dlc_name = dlc_name
	self._common_settings = common_settings
	self._animations = {}

	self:create_ui_elements()

	self._input_service_name = "common_popup"

	self:setup_input()
	self:setup_input_description()

	self.popup_id = 0
	self._has_widget_been_closed = false
end

CommonPopup.destroy = function (self)
	if self._is_visible then
		self:hide()
	end
end

CommonPopup.create_ui_elements = function (self)
	local settings = self._common_settings
	self._ui_scenegraph = UISceneGraph.init_scenegraph(settings.definitions.scenegraph_definition)
	local widgets_by_name = nil
	self._widgets, widgets_by_name = UIUtils.create_widgets(settings.definitions.widget_definitions)
	self._widgets_by_name = widgets_by_name

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, settings.definitions.animation_definitions)
end

CommonPopup.update = function (self, dt)
	if not self._is_visible then
		return
	end

	self:_handle_input(dt)
	self:_update_animations(dt)
	self:draw(dt)
end

CommonPopup._handle_input = function (self, dt)
	return
end

CommonPopup.draw = function (self, dt)
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self:_get_input_service()
	local render_settings = self._render_settings
	local gamepad_active = Managers.input:is_device_active("gamepad")

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)
	UIRenderer.draw_all_widgets(ui_top_renderer, self._widgets)
	UIRenderer.end_pass(ui_top_renderer)

	if gamepad_active and self._menu_input_description then
		self._menu_input_description:draw(ui_top_renderer, dt)
	end
end

CommonPopup.show = function (self)
	assert(not self._is_visible)

	self._is_visible = true

	self:acquire_input()
end

CommonPopup.hide = function (self)
	assert(self._is_visible)

	self._is_visible = false

	self:release_input()
end

CommonPopup.exit_done = function (self)
	return not self._is_visible and self._has_widget_been_closed
end

CommonPopup._start_transition_animation = function (self, animation_name)
	return
end

CommonPopup._update_animations = function (self, dt)
	self._ui_animator:update(dt)
end

CommonPopup.acquire_input = function (self)
	local input_manager = self._input_manager

	if input_manager then
		ShowCursorStack.push()
		input_manager:capture_input(ALL_INPUT_METHODS, 1, self._input_service_name, "CommonPopup")
	end
end

CommonPopup.release_input = function (self)
	local input_manager = self._input_manager

	if input_manager then
		ShowCursorStack.pop()
		input_manager:release_input(ALL_INPUT_METHODS, 1, self._input_service_name, "CommonPopup")
	end
end

CommonPopup.setup_input = function (self)
	local input_manager = self._input_manager
	local service_name = self._input_service_name

	if input_manager then
		input_manager:create_input_service(service_name, "IngameMenuKeymaps", "IngameMenuFilters")
		input_manager:map_device_to_service(service_name, "keyboard")
		input_manager:map_device_to_service(service_name, "gamepad")
		input_manager:map_device_to_service(service_name, "mouse")
	end
end

CommonPopup.setup_input_description = function (self)
	local generic_input_actions = self._common_settings.definitions.generic_input_actions

	if not generic_input_actions then
		return
	end

	local menu_desc = MenuInputDescriptionUI:new(nil, self._ui_top_renderer, self:_get_input_service(), 3, 900, self._common_settings.definitions.generic_input_actions.default)

	menu_desc:set_input_description(self._common_settings.input_desc)

	self._menu_input_description = menu_desc
end

CommonPopup._get_input_service = function (self)
	return Managers.input:get_service(self._input_service_name)
end

CommonPopup.should_show = function (self)
	return not self._is_visible
end

CommonPopup.is_popup_showing = function (self)
	return self._is_visible
end

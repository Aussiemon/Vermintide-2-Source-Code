-- chunkname: @scripts/ui/hint_ui/hint_ui.lua

HintUI = class(HintUI)

HintUI.init = function (self, ui_context, hint_name, hint_settings)
	self._ui_context = ui_context
	self._ui_renderer = ui_context.ui_renderer
	self._ui_top_renderer = ui_context.ui_top_renderer
	self._input_manager = ui_context.input_manager
	self._wwise_world = ui_context.wwise_world
	self._render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = true,
	}
	self._hint_name = hint_name
	self._hint_settings = hint_settings
	self._hint_data = hint_settings.data
	self._animations = {}

	self:create_ui_elements()

	self._input_service_name = "hint_ui"

	self:setup_input()

	self.hint_id = 0
	self._has_widget_been_closed = false
end

HintUI.destroy = function (self)
	if self._is_visible then
		self:hide()
	end
end

HintUI.create_ui_elements = function (self)
	local settings = self._hint_settings
	local data = settings.data

	self._ui_scenegraph = UISceneGraph.init_scenegraph(data.definitions.scenegraph_definition)

	local widgets_by_name

	self._widgets, widgets_by_name = UIUtils.create_widgets(data.definitions.widget_definitions)
	self._widgets_by_name = widgets_by_name

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, data.definitions.animation_definitions)
end

HintUI.update = function (self, dt)
	if not self._is_visible then
		return
	end

	self:_handle_input(dt)
	self:_update_animations(dt)
	self:draw(dt)
end

HintUI._handle_input = function (self, dt)
	return
end

HintUI.draw = function (self, dt)
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

HintUI.show = function (self)
	assert(not self._is_visible)

	self._is_visible = true
end

HintUI.hide = function (self)
	assert(self._is_visible)

	self._is_visible = false
end

HintUI.exit_done = function (self)
	return not self._is_visible and self._has_widget_been_closed
end

HintUI._start_transition_animation = function (self, animation_name)
	return
end

HintUI._update_animations = function (self, dt)
	local ui_animator = self._ui_animator

	ui_animator:update(dt)

	local animations = self._animations

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end
end

HintUI.acquire_input = function (self)
	local input_manager = self._input_manager

	if input_manager then
		ShowCursorStack.show("HintUI")
		input_manager:capture_input(ALL_INPUT_METHODS, 1, self._input_service_name, "HintUI")
	end
end

HintUI.release_input = function (self)
	local input_manager = self._input_manager

	if input_manager then
		ShowCursorStack.hide("HintUI")
		input_manager:release_input(ALL_INPUT_METHODS, 1, self._input_service_name, "HintUI")
	end
end

HintUI.setup_input = function (self)
	local input_manager = self._input_manager
	local service_name = self._input_service_name

	if input_manager then
		input_manager:create_input_service(service_name, "IngameMenuKeymaps", "IngameMenuFilters")
		input_manager:map_device_to_service(service_name, "keyboard")
		input_manager:map_device_to_service(service_name, "gamepad")
		input_manager:map_device_to_service(service_name, "mouse")
	end
end

HintUI._get_input_service = function (self)
	return Managers.input:get_service(self._input_service_name)
end

HintUI.should_show = function (self)
	return not self._is_visible
end

HintUI.is_hint_showing = function (self)
	return self._is_visible
end

HintUI.start_animation = function (self, animation_name, widget, optional_params)
	local params = optional_params or {
		wwise_world = self._wwise_world,
		render_settings = self._render_settings,
	}
	local animation_id = self._ui_animator:start_animation(animation_name, widget, self._hint_data.definitions.scenegraph_definition, params)
	local animation_key = animation_name

	self._animations[animation_key] = animation_id

	return animation_id
end

HintUI.get_hint_name = function (self)
	return self._hint_name
end

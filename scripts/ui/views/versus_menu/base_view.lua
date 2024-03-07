-- chunkname: @scripts/ui/views/versus_menu/base_view.lua

BaseView = class(BaseView)

BaseView.init = function (self, ingame_ui_context, definitions)
	fassert(definitions, "No definitions passed")
	fassert(definitions.scenegraph_definition, "No scenegraph in definitions")

	self._ingame_ui_context = ingame_ui_context
	self._world = ingame_ui_context.world
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._render_settings = self._render_settings or {}

	local world = Managers.world:world("level_world")

	self._wwise_world = Managers.world:wwise_world(world)
	self._input_manager = ingame_ui_context.input_manager
	self._input_service_name = "ingame_menu"
	self._definitions = definitions
	self._retained_mode = not not definitions.retained_mode
	self._dirty = true
	self._animations = {}
end

BaseView.destroy = function (self)
	return
end

BaseView.on_enter = function (self)
	ShowCursorStack.push()

	local input_manager = self._input_manager
	local input_service_name = self._input_service_name

	input_manager:block_device_except_service(input_service_name, "keyboard", 1)
	input_manager:block_device_except_service(input_service_name, "mouse", 1)
	input_manager:block_device_except_service(input_service_name, "gamepad", 1)
	self:_create_ui_elements()
end

BaseView.post_update_on_enter = function (self)
	return
end

BaseView.on_exit = function (self)
	ShowCursorStack.pop()

	local input_manager = self._input_manager

	input_manager:device_unblock_all_services("keyboard", 1)
	input_manager:device_unblock_all_services("mouse", 1)
	input_manager:device_unblock_all_services("gamepad", 1)
	self:_destroy_ui_elements()
end

BaseView.post_update_on_exit = function (self)
	return
end

BaseView._create_ui_elements = function (self)
	local definitions = self._definitions
	local scenegraph_definition = definitions.scenegraph_definition

	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	local widgets_by_name = {}

	self._widgets = UIUtils.create_widgets(definitions.widget_definitions, {}, widgets_by_name)

	local top_widget_definitions = definitions.top_widget_definitions

	if top_widget_definitions then
		self._top_widgets = UIUtils.create_widgets(top_widget_definitions, {}, widgets_by_name)
	end

	self._widgets_by_name = widgets_by_name

	local animations = definitions.animations

	if animations then
		self._ui_animator = UIAnimator:new(self._ui_scenegraph, definitions.animations)
	end
end

BaseView._destroy_ui_elements = function (self)
	if self._retained_mode then
		UIUtils.destroy_widgets(self._ui_renderer, self._widgets_by_name)
	end

	self._ui_scenegraph = nil
	self._widgets = nil
	self._top_widgets = nil
	self._widgets_by_name = nil
	self._ui_animator = nil
end

BaseView.post_update = function (self, dt, t)
	return
end

BaseView.update = function (self, dt, t)
	local animator = self._ui_animator

	if animator then
		animator:update(dt, t)
	end

	if not self._retained_mode or self._dirty then
		self:_draw(dt, self:input_service())

		self._dirty = false
	end
end

BaseView._draw_widgets = function (self, ui_renderer, dt)
	return
end

BaseView._draw = function (self, dt, input_service)
	local ui_renderer = self._ui_renderer
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local render_settings = self._render_settings
	local alpha_multiplier = render_settings.alpha_multiplier or 1

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for i, widget in pairs(self._widgets) do
		render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

		UIRenderer.draw_widget(ui_renderer, widget)
	end

	render_settings.alpha_multiplier = alpha_multiplier

	self:_draw_widgets(ui_renderer, dt)
	UIRenderer.end_pass(ui_renderer)

	if self._top_widgets then
		UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

		for _, widget in pairs(self._top_widgets) do
			render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

			UIRenderer.draw_widget(ui_top_renderer, widget)
		end

		UIRenderer.end_pass(ui_top_renderer)
	end

	render_settings.alpha_multiplier = alpha_multiplier
end

BaseView._start_animation = function (self, key, animation_name, widget, optional_params)
	local params = optional_params or {
		wwise_world = self._wwise_world,
		render_settings = self._render_settings,
	}
	local scenegraph_definition = self._definitions.scenegraph_definition

	return self._ui_animator:start_animation(animation_name, widget, scenegraph_definition, params)
end

BaseView.play_sound = function (self, event)
	return WwiseWorld.trigger_event(self._wwise_world, event)
end

BaseView.input_service = function (self)
	return self._input_manager:get_service(self._input_service_name)
end

BaseView._set_widget_dirty = function (self, widget)
	widget.element.dirty = true
end

BaseView.debug_set_definitions = function (self, definitions)
	self._definitions = definitions
end

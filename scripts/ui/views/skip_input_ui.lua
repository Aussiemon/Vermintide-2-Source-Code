local definitions = local_require("scripts/ui/views/skip_input_ui_definitions")
SkipInputUI = class(SkipInputUI)

SkipInputUI.init = function (self, parent, context)
	self._parent = parent
	self._ui_renderer = context.ui_renderer
	self._context = context
	self._skip = false
	self._render_settings = {
		alpha_multiplier = 0,
		internal_alpha_multiplier = 0,
		snap_pixel_positions = false
	}

	self:_create_ui_elements()
end

SkipInputUI._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	local ui_renderer = self._ui_renderer
	local input_service = self._parent:input_service() or FAKE_INPUT_SERVICE
	local widget_definition = definitions.create_skip_widget(self, ui_renderer, input_service)
	self._skip_widget = UIWidget.init(widget_definition)
end

SkipInputUI.destroy = function (self)
	return
end

SkipInputUI.update = function (self, dt, t, input_service, parent_render_settings)
	self:_update_input(dt, t, input_service, parent_render_settings)
	self:_draw(dt, t, input_service, parent_render_settings)
end

SkipInputUI._update_input = function (self, dt, t, input_service, parent_render_settings)
	local alpha = self._render_settings.internal_alpha_multiplier

	if self._active then
		if input_service and input_service:get("cancel_video") then
			alpha = 1
		else
			alpha = math.max(alpha - dt * 2, 0)
		end
	end

	if input_service:get("left_release") or input_service:get("confirm") then
		self._active = true
	end

	self._render_settings.internal_alpha_multiplier = alpha
end

SkipInputUI.skip = function (self)
	self._skip = true
end

SkipInputUI.skipped = function (self)
	local skip = self._skip
	self._skip = false

	return skip
end

SkipInputUI._draw = function (self, dt, t, input_service, parent_render_settings)
	local parent = self._parent
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local render_settings = self._render_settings
	local input_service = input_service or FAKE_INPUT_SERVICE
	local parent_alpha = parent_render_settings and parent_render_settings.alpha_multiplier or 1
	render_settings.alpha_multiplier = parent_alpha * render_settings.internal_alpha_multiplier

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)
	UIRenderer.draw_widget(ui_renderer, self._skip_widget)
	UIRenderer.end_pass(ui_renderer)
end

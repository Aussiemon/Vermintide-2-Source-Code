-- chunkname: @scripts/ui/hud_ui/base_component.lua

BaseComponent = class(BaseComponent)

BaseComponent.init = function (self, ingame_hud, ingame_ui_context, definitions)
	assert(definitions, "No definitions passed")
	assert(definitions.scenegraph_definition, "No scenegraph in definitions")

	self._world = ingame_ui_context.world
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._ingame_ui_context = ingame_ui_context
	self._definitions = definitions
	self._retained_mode = not not definitions.retained_mode
	self._dirty = true

	self:_create_ui_elements()
end

BaseComponent._create_ui_elements = function (self)
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
end

BaseComponent.destroy = function (self)
	self:_destroy_ui_elements()
end

BaseComponent._destroy_ui_elements = function (self)
	if self._retained_mode then
		UIUtils.destroy_widgets(self._ui_renderer, self._widgets_by_name)
	end

	self._widgets_by_name = nil
	self._top_widgets = nil
	self._widgets = nil
	self._ui_scenegraph = nil
end

BaseComponent.set_visible = function (self, visible)
	if self._retained_mode then
		local ui_renderer = self._ui_renderer

		for _, widget in ipairs(self._widgets) do
			UIRenderer.set_element_visible(ui_renderer, widget.element, visible)
		end

		self._dirty = true
	end
end

BaseComponent.debug_set_definitions = function (self, definitions)
	self._definitions = definitions
end

BaseComponent.update = function (self, dt, t, player)
	return
end

BaseComponent.post_update = function (self, dt, t, player)
	if self._dirty or not self._retained_mode then
		self:_draw(dt, self:input_service())

		self._dirty = false
	end
end

BaseComponent._draw_widgets = function (self, ui_renderer, dt)
	return
end

BaseComponent._draw_top_widgets = function (self, ui_renderer, dt)
	return
end

BaseComponent._draw = function (self, dt, input_service)
	local ui_renderer = self._ui_renderer
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)
	UIRenderer.draw_all_widgets(ui_renderer, self._widgets)
	self:_draw_widgets(ui_renderer, dt)
	UIRenderer.end_pass(ui_renderer)
	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt)

	if self._top_widgets then
		UIRenderer.draw_all_widgets(ui_top_renderer, self._top_widgets)
	end

	self:_draw_top_widgets(ui_top_renderer, dt)
	UIRenderer.end_pass(ui_top_renderer)
end

BaseComponent.input_service = function (self)
	return self._input_manager:get_service("Player")
end

BaseComponent._set_widget_dirty = function (self, widget)
	widget.element.dirty = true
end

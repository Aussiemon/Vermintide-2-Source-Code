local definitions = local_require("scripts/ui/views/weave_splash_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local widget_definitions = definitions.widget_definitions
local create_weave_image_func = definitions.create_weave_image_func
local fake_input_service = {
	get = function ()
		return
	end,
	has = function ()
		return
	end
}
local weave_splash_images = {
	"weave_loading_screen"
}
local TIME_BETWEEN_SPLASHES = 5
WeaveSplashUI = class(WeaveSplashUI)

WeaveSplashUI.init = function (self, world)
	self._world = world
	self._current_splash_index = 1
	self._current_timer = #weave_splash_images > 1 and TIME_BETWEEN_SPLASHES

	self:_setup_ui()
	self:_create_ui_elements()
end

WeaveSplashUI._setup_ui = function (self)
	self._render_settings = {
		alpha_multiplier = 1
	}
	self._ui_renderer = UIRenderer.create(self._world, "material", "materials/ui/loading_screens/loading_screen_default")
end

WeaveSplashUI._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._animations = {}
	self._widgets = {}
	self._weave_splash_widgets = {}

	for name, widget_definition in pairs(widget_definitions) do
		self._widgets[name] = UIWidget.init(widget_definition)
	end

	local image_name = weave_splash_images[1]
	local widget_definition = create_weave_image_func(image_name, 255)
	self._weave_splash_widgets[#self._weave_splash_widgets + 1] = UIWidget.init(widget_definition)
	local next_image_index = 1 + self._current_splash_index % #weave_splash_images
	local next_image_name = weave_splash_images[next_image_index]
	local widget_definition = create_weave_image_func(next_image_name, 0)
	self._weave_splash_widgets[#self._weave_splash_widgets + 1] = UIWidget.init(widget_definition)

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)
end

WeaveSplashUI.update = function (self, dt, t)
	self:_update_animations(dt, t)
	self:_draw(dt, t)
	self:_update_current_splash(dt, t)
end

WeaveSplashUI._update_animations = function (self, dt, t)
	local animations = self._animations

	for name, animation in pairs(animations) do
		if not UIAnimation.completed(animation) then
			UIAnimation.update(animation, dt)
		else
			animations[name] = nil

			if table.is_empty(self._animations) then
				self._current_timer = TIME_BETWEEN_SPLASHES
			end
		end
	end
end

WeaveSplashUI._update_current_splash = function (self, dt, t)
	if not self._current_timer then
		return
	end

	self._current_timer = self._current_timer - dt

	if self._current_timer <= 0 then
		local old_splash = self._current_splash_index
		self._current_splash_index = 1 + self._current_splash_index % #weave_splash_images
		local widget_1_content = self._weave_splash_widgets[1].content
		local widget_1_style = self._weave_splash_widgets[1].style.bg_texture
		local widget_2_content = self._weave_splash_widgets[2].content
		local widget_2_style = self._weave_splash_widgets[2].style.bg_texture
		widget_1_content.bg_texture = weave_splash_images[old_splash]
		widget_2_content.bg_texture = weave_splash_images[self._current_splash_index]
		self._animations.splash_image_1 = UIAnimation.init(UIAnimation.function_by_time, widget_1_style.color, 1, 255, 0, 0.5, math.easeInCubic)
		self._animations.splash_image_2 = UIAnimation.init(UIAnimation.function_by_time, widget_2_style.color, 1, 0, 255, 0.5, math.easeInCubic)
		self._current_timer = nil
	end
end

WeaveSplashUI._draw = function (self, dt, t)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local render_settings = self._render_settings
	local input_service = fake_input_service

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for name, widget in pairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	for _, widget in ipairs(self._weave_splash_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)
end

WeaveSplashUI.destroy = function (self)
	UIRenderer.destroy(self._ui_renderer, self._world)
end

WeaveSplashUI.clear_user_name = function (self)
	return
end

return

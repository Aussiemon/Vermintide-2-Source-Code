-- chunkname: @scripts/ui/views/hero_view/windows/store/store_window_background.lua

local definitions = local_require("scripts/ui/views/hero_view/windows/store/definitions/store_window_background_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions

StoreWindowBackground = class(StoreWindowBackground)
StoreWindowBackground.NAME = "StoreWindowBackground"

StoreWindowBackground.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate StoreWindowBackground")

	self._params = params
	self._parent = params.parent

	local ui_renderer, ui_top_renderer = self._parent:get_renderers()

	self._ui_renderer = ui_renderer
	self._ui_top_renderer = ui_top_renderer
	self._render_settings = {
		snap_pixel_positions = true,
	}
	self._layout_settings = params.layout_settings
	self._animations = {}

	self:_create_ui_elements(params, offset)
end

StoreWindowBackground._create_viewport_definition = function (self)
	return {
		scenegraph_id = "screen",
		element = UIElements.Viewport,
		style = {
			viewport = {
				clear_screen_on_create = true,
				enable_sub_gui = false,
				fov = 50,
				layer = 960,
				level_name = "levels/ui_keep_menu/world",
				viewport_name = "store_background_viewport",
				world_name = "store_background",
				world_flags = {
					Application.DISABLE_SOUND,
					Application.DISABLE_ESRAM,
					Application.ENABLE_VOLUMETRICS,
				},
				object_sets = LevelResource.object_set_names("levels/ui_keep_menu/world"),
				camera_position = {
					0,
					2.8,
					0.9,
				},
				camera_lookat = {
					0,
					-2.8,
					0.9,
				},
			},
		},
		content = {
			button_hotspot = {
				allow_multi_hover = true,
			},
		},
	}
end

StoreWindowBackground._create_ui_elements = function (self, params, offset)
	if self._viewport_widget then
		UIWidget.destroy(self.ui_renderer, self._viewport_widget)

		self._viewport_widget = nil
	end

	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)

		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name
	self._viewport_widget_definition = self:_create_viewport_definition()

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self._ui_scenegraph.window.local_position

		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end
end

StoreWindowBackground.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate StoreWindowBackground")

	self._ui_animator = nil

	if self._viewport_widget then
		UIWidget.destroy(self.ui_renderer, self._viewport_widget)

		self._viewport_widget = nil
	end
end

StoreWindowBackground.update = function (self, dt, t)
	self:_update_animations(dt, t)
	self:_draw(dt)
end

StoreWindowBackground.post_update = function (self, dt, t)
	if not self._viewport_widget and self._viewport_widget_definition then
		self._viewport_widget = UIWidget.init(self._viewport_widget_definition)

		self:_hide_object_sets()
	end
end

StoreWindowBackground._hide_object_sets = function (self)
	local preview_pass_data = self._viewport_widget.element.pass_data[1]
	local level_name = self._viewport_widget_definition.style.viewport.level_name
	local level = preview_pass_data.level
	local object_set_names = LevelResource.object_set_names(level_name)

	for _, object_set_name in ipairs(object_set_names) do
		local object_set_units = LevelResource.unit_indices_in_object_set(level_name, object_set_name)

		for _, unit_index in pairs(object_set_units) do
			local unit = Level.unit_by_index(level, unit_index)

			if Unit.alive(unit) then
				Unit.set_unit_visibility(unit, false)
				Unit.flow_event(unit, "unit_object_set_disabled")
			end
		end
	end
end

StoreWindowBackground._update_animations = function (self, dt, t)
	self._ui_animator:update(dt)

	local animations = self._animations
	local ui_animator = self._ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end
end

StoreWindowBackground._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StoreWindowBackground._is_stepper_button_pressed = function (self, widget)
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
end

StoreWindowBackground._draw = function (self, dt)
	local ui_renderer = self._ui_renderer
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._parent:window_input_service()

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self._render_settings)
	UIRenderer.end_pass(ui_top_renderer)
	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self._render_settings)

	if self._viewport_widget then
		UIRenderer.draw_widget(ui_renderer, self._viewport_widget)
	end

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)
end

StoreWindowBackground._play_sound = function (self, event)
	self._parent:play_sound(event)
end

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
		snap_pixel_positions = true
	}
	self._layout_settings = params.layout_settings
	self._animations = {}

	self:_create_ui_elements(params, offset)
end

StoreWindowBackground._create_ui_elements = function (self, params, offset)
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
end

StoreWindowBackground.update = function (self, dt, t)
	self:_update_animations(dt, t)
	self:_draw(dt)
end

StoreWindowBackground.post_update = function (self, dt, t)
	return
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

	local widgets_by_name = self._widgets_by_name
	local start_gradient = widgets_by_name.start_gradient
	local background_gradient = widgets_by_name.background_gradient

	self:_update_gradient_widget_animation(start_gradient, dt, t)
	self:_update_gradient_widget_animation(background_gradient, dt, t)
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

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)
end

StoreWindowBackground._play_sound = function (self, event)
	self._parent:play_sound(event)
end

StoreWindowBackground._update_gradient_widget_animation = function (self, widget, dt, t)
	local style = widget.style.texture_id
	local delay_timer = style.delay_timer

	if delay_timer then
		delay_timer = math.max(delay_timer - dt, 0)

		if delay_timer == 0 then
			style.delay_timer = nil
		else
			style.delay_timer = delay_timer
		end

		return
	end

	local ui_scenegraph = self._ui_scenegraph
	local w = RESOLUTION_LOOKUP.res_w
	local h = RESOLUTION_LOOKUP.res_h
	local scenegraph_id = widget.scenegraph_id
	local scenegraph = ui_scenegraph[scenegraph_id]
	local size = scenegraph.size
	local degrees = 30
	local rotation_progress = degrees / 180
	local width_diff = w - size[1]
	local extra_length = rotation_progress * width_diff * 3
	size[2] = math.floor(h + extra_length)
	local pivot = style.pivot
	local angle = style.angle
	local offset = style.offset
	offset[3] = 0
	style.angle = math.degrees_to_radians(degrees)
	pivot[1] = size[1] / 2
	pivot[2] = size[2] / 2
	local max_time = 3
	local timer = style.timer or 0
	local new_time = math.min(timer + dt, max_time)

	if new_time == max_time then
		new_time = 0
		style.delay_timer = 5
	end

	local progress = new_time / max_time
	style.timer = new_time
	local anim_progress = math.ease_out_quad(1 - progress)
	local x_offest = extra_length + size[1]
	offset[1] = -x_offest + (x_offest + w) * anim_progress
end

return

local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_gotwf_panel_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
HeroWindowGotwfPanel = class(HeroWindowGotwfPanel)
HeroWindowGotwfPanel.NAME = "HeroWindowGotwfPanel"

HeroWindowGotwfPanel.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate HeroWindowGotwfPanel")

	local ingame_ui_context = params.ingame_ui_context
	self._parent = params.parent
	self._ui_renderer = ingame_ui_context.ui_top_renderer
	self._render_settings = {
		snap_pixel_positions = true
	}
	self._animations = {}
	self._ui_animations = {}

	self:_create_ui_elements(params, offset)
end

HeroWindowGotwfPanel._create_ui_elements = function (self, params, offset)
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
end

HeroWindowGotwfPanel.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate HeroWindowGotwfPanel")

	self._ui_animator = nil
end

HeroWindowGotwfPanel.update = function (self, dt, t)
	self:_handle_gamepad_activity()
	self:_update_animations(dt)
	self:_draw(dt)
end

HeroWindowGotwfPanel.post_update = function (self, dt, t)
	self:_handle_input(dt, t)
end

HeroWindowGotwfPanel._update_animations = function (self, dt)
	local ui_animations = self._ui_animations
	local animations = self._animations
	local ui_animator = self._ui_animator

	for name, animation in pairs(self._ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			self._ui_animations[name] = nil
		end
	end

	ui_animator:update(dt)

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	self:_animate_button(self._widgets_by_name.close_button, dt)
end

HeroWindowGotwfPanel._handle_input = function (self, dt, t)
	local parent = self._parent
	local widgets_by_name = self._widgets_by_name
	local input_service = self._parent:window_input_service()
	local close_button = widgets_by_name.close_button

	if UIUtils.is_button_pressed(close_button) then
		parent:set_layout_by_name("featured")
	end
end

HeroWindowGotwfPanel._draw = function (self, dt)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._parent:window_input_service()

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self._render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)
end

HeroWindowGotwfPanel._handle_gamepad_activity = function (self)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local force_update = self._gamepad_active_last_frame == nil

	if gamepad_active then
		if not self._gamepad_active_last_frame or force_update then
			self._gamepad_active_last_frame = true
			local widgets_by_name = self._widgets_by_name
			widgets_by_name.close_button.content.visible = false
		end
	elseif self._gamepad_active_last_frame or force_update then
		self._gamepad_active_last_frame = false
		local widgets_by_name = self._widgets_by_name
		widgets_by_name.close_button.content.visible = true
	end
end

HeroWindowGotwfPanel._animate_button = function (self, widget, dt)
	local content = widget.content
	local style = widget.style
	local hotspot = content.button_hotspot
	local is_hover = hotspot.is_hover
	local is_selected = hotspot.is_selected
	local input_pressed = not is_selected and hotspot.is_clicked and hotspot.is_clicked == 0
	local input_progress = hotspot.input_progress or 0
	local hover_progress = hotspot.hover_progress or 0
	local selection_progress = hotspot.selection_progress or 0
	local speed = 8
	local input_speed = 20

	if input_pressed then
		input_progress = math.min(input_progress + dt * input_speed, 1)
	else
		input_progress = math.max(input_progress - dt * input_speed, 0)
	end

	local input_easing_out_progress = math.easeOutCubic(input_progress)
	local input_easing_in_progress = math.easeInCubic(input_progress)

	if is_hover then
		hover_progress = math.min(hover_progress + dt * speed, 1)
	else
		hover_progress = math.max(hover_progress - dt * speed, 0)
	end

	local hover_easing_out_progress = math.easeOutCubic(hover_progress)
	local hover_easing_in_progress = math.easeInCubic(hover_progress)

	if is_selected then
		selection_progress = math.min(selection_progress + dt * speed, 1)
	else
		selection_progress = math.max(selection_progress - dt * speed, 0)
	end

	local select_easing_out_progress = math.easeOutCubic(selection_progress)
	local select_easing_in_progress = math.easeInCubic(selection_progress)
	local combined_progress = math.max(hover_progress, selection_progress)
	local combined_out_progress = math.max(select_easing_out_progress, hover_easing_out_progress)
	local combined_in_progress = math.max(hover_easing_in_progress, select_easing_in_progress)
	local hover_alpha = 255 * combined_progress
	style.texture_id.color[1] = 255 - hover_alpha
	style.texture_hover_id.color[1] = hover_alpha
	style.selected_texture.color[1] = hover_alpha
	hotspot.hover_progress = hover_progress
	hotspot.input_progress = input_progress
	hotspot.selection_progress = selection_progress
end

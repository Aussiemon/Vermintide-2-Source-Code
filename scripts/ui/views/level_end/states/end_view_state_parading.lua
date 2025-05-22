-- chunkname: @scripts/ui/views/level_end/states/end_view_state_parading.lua

local definitions = local_require("scripts/ui/views/level_end/states/definitions/end_view_state_parading_definitions")

require("scripts/ui/views/world_hero_previewer")

EndViewStateParading = class(EndViewStateParading)
EndViewStateParading.NAME = "EndViewStateParading"
EndViewStateParading.CAN_SPEED_UP = true

local ARBITRARY_TIMER = 6
local USE_STORY = true

EndViewStateParading.on_enter = function (self, params)
	self._parent = params.parent

	local context = params.context

	self._statistics_db = context.statistics_db
	self._profile_synchronizer = context.profile_synchronizer
	self._camera_done = false
	self._ui_renderer = context.ui_renderer
	self._render_settings = {
		alpha_multiplier = 0,
		snap_pixel_positions = true,
	}
	self._animations = {}
	self._input_service = Managers.input:get_service("end_of_level")

	self._parent:show_team()

	local world = self._parent:get_viewport_world()
	local shading_settings = World.get_data(world, "shading_settings")

	shading_settings[1] = "victory_parading"
	self._world = world

	self:_create_ui_elements()

	self._menu_input_desc = MenuInputDescriptionUI:new(nil, self._ui_renderer, self._input_service, 3, 900, definitions.generic_input_actions.default, false)

	self._parent:play_sound("Play_parading_screen_amb")
end

EndViewStateParading._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definitions)

	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(definitions.widget_definitions) do
		local widget = UIWidget.init(widget_definition)

		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, definitions.animation_definitions)
end

EndViewStateParading._start_animation = function (self, animation_name)
	local params = {
		render_settings = self._render_settings,
		ui_scenegraph = self._ui_scenegraph,
	}
	local animation_id = self._ui_animator:start_animation(animation_name, self._widgets_by_name, definitions.scenegraph_definitions, params)

	self._animations[animation_id] = {
		name = animation_name,
	}
end

EndViewStateParading.on_exit = function (self)
	self._parent:_pop_mouse_cursor()
	self._parent:stop_playing_story(self._story_id)
end

local function easeInOutSine(t)
	return -(math.cos(math.pi * t) - 1) / 2
end

EndViewStateParading.update = function (self, dt, t)
	self:_handle_input(dt, t)
	self:_update_animations(dt, t)
	self:_update_camera(dt, t)
	self:_draw(dt, t)
end

EndViewStateParading._handle_input = function (self, dt, t)
	local continue_button_widget = self._widgets_by_name.continue_button

	if UIUtils.is_button_hover_enter(continue_button_widget) then
		self._parent:play_sound("Play_hud_hover")
	end

	if self._camera_done and (UIUtils.is_button_pressed(continue_button_widget) or self._parent:skip_pressed()) then
		self._parent:play_sound("Play_gui_parading_screen_continue_button")

		self._done = true
	end
end

EndViewStateParading._update_animations = function (self, dt, t)
	local ui_animator = self._ui_animator

	ui_animator:update(dt, t)

	local animations = self._animations

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	UIWidgetUtils.animate_default_button(self._widgets_by_name.continue_button, dt)
end

EndViewStateParading._update_camera = function (self, dt, t)
	if self._camera_done or not self._parent:loading_complete(dt, t) then
		return
	end

	if USE_STORY then
		self:_update_story_camera(dt, t)
	else
		self:_update_math_camera(dt, t)
	end
end

EndViewStateParading._update_story_camera = function (self, dt, t)
	if not self._story_id then
		local loop = false
		local speed = 1
		local manual_control = false

		self._story_id = self._parent:start_story_camera("camera_pan", loop, speed, manual_control)
	elseif not self._parent:is_playing_story(self._story_id) then
		self._camera_done = true

		self._parent:_push_mouse_cursor()
		self:_start_animation("animate_continue_button")
	end
end

EndViewStateParading._update_math_camera = function (self, dt, t)
	self._timer = self._timer or Managers.time:time("main") + ARBITRARY_TIMER
	self._time = self._time or Managers.time:time("main")

	local t = self._time
	local delay = 0
	local distance = 3
	local time = self._timer - t - delay
	local base_progress = math.clamp(1 - (self._timer - t) / (ARBITRARY_TIMER - delay), 0, 1)
	local progress = easeInOutSine(base_progress)
	local world, viewport = self._parent:get_viewport_world()
	local camera = ScriptViewport.camera(viewport)
	local camera_pose = self._parent:get_camera_pose()
	local rotation = Matrix4x4.rotation(camera_pose)
	local position = Matrix4x4.translation(camera_pose)
	local forward = Quaternion.forward(rotation)
	local end_point = position + forward * distance
	local start_point = end_point + Vector3(2.5, -4, -2.5)
	local offset = math.sin(math.min(progress * math.pi, math.pi)) * forward * -3 * 1
	local final_pos = Vector3.lerp(start_point, end_point, math.min(progress, 1)) + offset
	local rot = Quaternion.look(Vector3.normalize(Vector3.flat(end_point - (final_pos - forward * 4))), Vector3.up())
	local pose = Matrix4x4.from_quaternion_position(rot, final_pos)

	ScriptCamera.set_local_pose(camera, pose)
	ScriptCamera.force_update(world, camera)

	self._time = self._time + Managers.time:mean_dt()

	if t > self._timer then
		self._camera_done = true

		self._parent:_push_mouse_cursor()
		self:_start_animation("animate_continue_button")
	end
end

EndViewStateParading._draw = function (self, dt, t)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local render_settings = self._render_settings
	local input_service = self._input_service
	local gamepad_active = Managers.input:is_device_active("gamepad")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)

	if gamepad_active and self._camera_done then
		self._menu_input_desc:draw(ui_renderer, dt)
	end
end

EndViewStateParading.done = function (self)
	return self._done
end

EndViewStateParading.exit = function (self)
	return
end

EndViewStateParading.exit_done = function (self)
	return true
end

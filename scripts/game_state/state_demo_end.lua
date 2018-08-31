require("scripts/ui/views/demo_end_ui")

StateDemoEnd = class(StateDemoEnd)
StateDemoEnd.NAME = "StateDemoEnd"

StateDemoEnd.on_enter = function (self)
	self:_setup_world()
	self:_setup_input()
	self:_setup_ui()
	self:_handle_fade()
	self:_handle_video_playback()
end

StateDemoEnd._handle_video_playback = function (self)
	Framerate.set_low_power()
	Managers.music:stop_all_sounds()
end

StateDemoEnd.on_exit = function (self)
	if self._demo_end_ui then
		self._demo_end_ui:destroy()

		self._demo_end_ui = nil
	end

	self._input_manager:destroy()

	self._input_manager = nil
	Managers.input = nil

	Managers.state:destroy()
	Framerate.set_playing()
	ScriptWorld.destroy_viewport(self._world, self._viewport_name)
	Managers.world:destroy_world(self._world)
end

StateDemoEnd._setup_world = function (self)
	self._world_name = "demo_end_world"
	self._viewport_name = "demo_end_world_viewport"
	self._world = Managers.world:create_world(self._world_name, GameSettingsDevelopment.default_environment, nil, nil, Application.DISABLE_PHYSICS, Application.DISABLE_APEX_CLOTH)
	self._viewport = ScriptWorld.create_viewport(self._world, self._viewport_name, "overlay", 1)
end

StateDemoEnd._setup_input = function (self)
	self._input_manager = InputManager:new()
	local input_manager = self._input_manager
	Managers.input = input_manager

	input_manager:initialize_device("keyboard", 1)
	input_manager:initialize_device("mouse", 1)
	input_manager:initialize_device("gamepad")
end

StateDemoEnd._setup_ui = function (self)
	self._demo_end_ui = DemoEndUI:new(self._world)
end

StateDemoEnd._handle_fade = function (self)
	Managers.transition:hide_loading_icon()
	Managers.transition:fade_out(GameSettings.transition_fade_in_speed)
end

StateDemoEnd.update = function (self, dt, t)
	self._demo_end_ui:update(dt, t)

	return self:_try_exit()
end

StateDemoEnd.cb_fade_in_done = function (self, state)
	self._new_state = state
end

StateDemoEnd._try_exit = function (self)
	local skip_outro = false

	if BUILD == "dev" and Keyboard.pressed(Keyboard.ENTER) then
		skip_outro = true
	end

	if not self._fade_started and (self._demo_end_ui:completed() or skip_outro) then
		Managers.transition:fade_in(GameSettings.transition_fade_out_speed, callback(self, "cb_fade_in_done", StateTitleScreen))

		self._fade_started = true
	end

	return self._new_state
end

return

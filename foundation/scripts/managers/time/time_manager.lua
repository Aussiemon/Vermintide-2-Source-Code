require("foundation/scripts/managers/time/timer")

TimeManager = class(TimeManager)

TimeManager.init = function (self)
	self._timers = {
		main = Timer:new("main", nil)
	}
	self._dt_stack = {}
	self._dt_stack_max_size = 10
	self._dt_stack_index = 0
	self._mean_dt = 0
	self._global_time_scale = 1
	self._lerp_global_time_scale = false

	self:register_timer("ui", "main", Application.time_since_launch())
end

TimeManager.register_timer = function (self, name, parent_name, start_time)
	local timers = self._timers

	fassert(timers[name] == nil, "[TimeManager] Tried to add already registered timer %q", name)
	fassert(timers[parent_name], "[TimeManager] Not allowed to add timer with unregistered parent %q", parent_name)

	local parent_timer = timers[parent_name]
	local new_timer = Timer:new(name, parent_timer, start_time)

	parent_timer:add_child(new_timer)

	timers[name] = new_timer
end

TimeManager.unregister_timer = function (self, name)
	local timer = self._timers[name]

	fassert(timer, "[TimeManager] Tried to remove unregistered timer %q", name)
	fassert(table.size(timer:children()) == 0, "[TimeManager] Not allowed to remove timer %q with children", name)

	local parent = timer:parent()

	if parent then
		parent:remove_child(timer)
	end

	timer:destroy()

	self._timers[name] = nil
end

TimeManager.has_timer = function (self, name)
	return (self._timers[name] and true) or false
end

TimeManager.update = function (self, dt)
	local main_timer = self._timers.main

	if main_timer:active() then
		main_timer:update(dt, 1)
	end

	if self._lerp_global_time_scale then
		self:_update_global_time_scale_lerp(dt)
	end

	if script_data.honduras_demo then
		self:_update_demo_timer(dt)
	end

	self:_update_mean_dt(dt)
end

TimeManager._update_demo_timer = function (self, dt)
	self._demo_timer = (self._demo_timer or DemoSettings.demo_idle_timer) - dt
	local device = Managers.input and Managers.input:get_most_recent_device()

	if not device then
		return
	end

	local gamepad_active = Managers.input:is_device_active("gamepad")
	local any_device_input_axis_moved = false

	for key = 0, device.num_axes() - 1, 1 do
		if gamepad_active then
			if (not IS_PS4 or key < 3) and Vector3.length(device.axis(key)) ~= 0 then
				any_device_input_axis_moved = true

				break
			end
		elseif Vector3.length(device.axis(key)) ~= 0 and device.axis_name(key) ~= "cursor" then
			any_device_input_axis_moved = true

			break
		end
	end

	if device.any_pressed() or any_device_input_axis_moved then
		self._demo_timer = DemoSettings.demo_idle_timer
		self._demo_idle_timer_failed = false
	elseif self._demo_timer <= 0 then
		self._demo_idle_timer_failed = true
	end
end

TimeManager.get_demo_transition = function (self)
	return self._demo_idle_timer_failed and "return_to_demo_title_screen"
end

TimeManager._update_mean_dt = function (self, dt)
	local dt_stack = self._dt_stack
	self._dt_stack_index = self._dt_stack_index % self._dt_stack_max_size + 1
	dt_stack[self._dt_stack_index] = dt
	local dt_sum = 0

	for i, dt in ipairs(dt_stack) do
		dt_sum = dt_sum + dt
	end

	self._mean_dt = dt_sum / #dt_stack
end

TimeManager.mean_dt = function (self)
	return self._mean_dt
end

TimeManager.set_time = function (self, name, time)
	self._timers[name]:set_time(time)
end

TimeManager.time = function (self, name)
	if self._timers[name] then
		return self._timers[name]:time()
	end
end

TimeManager.time_and_delta = function (self, name)
	if self._timers[name] then
		return self._timers[name]:time_and_delta()
	end
end

TimeManager.active = function (self, name)
	return self._timers[name]:active()
end

TimeManager.set_active = function (self, name, active)
	self._timers[name]:set_active(active)
end

TimeManager.set_local_scale = function (self, name, scale)
	fassert(name ~= "main", "[TimeManager] Not allowed to set scale in main timer")
	self._timers[name]:set_local_scale(scale)
end

TimeManager.local_scale = function (self, name)
	return self._timers[name]:local_scale()
end

TimeManager.global_scale = function (self, name)
	return self._timers[name]:global_scale()
end

TimeManager.set_global_time_scale = function (self, scale)
	self._global_time_scale = scale
	self._lerp_global_time_scale = false
end

TimeManager.set_global_time_scale_lerp = function (self, wanted_scale, duration)
	self._global_time_scale_lerp_start = self._global_time_scale
	self._global_time_scale_lerp_end = wanted_scale
	self._global_time_scale_lerp_progress = 0
	self._global_time_scale_lerp_increment = 1 / duration
	self._lerp_global_time_scale = true
end

TimeManager._update_global_time_scale_lerp = function (self, dt)
	local start_value = self._global_time_scale_lerp_start
	local end_value = self._global_time_scale_lerp_end
	local progress = self._global_time_scale_lerp_progress
	local lerp_increment = self._global_time_scale_lerp_increment
	progress = math.clamp(progress + dt * lerp_increment, 0, 1)
	local current_value = math.lerp(start_value, end_value, progress)
	self._global_time_scale = current_value
	self._global_time_scale_lerp_progress = progress

	if progress >= 1 then
		self._lerp_global_time_scale = false
	end
end

TimeManager.scaled_delta_time = function (self, dt)
	return math.max(dt * self._global_time_scale, 1e-06)
end

TimeManager.destroy = function (self)
	for name, timer in pairs(self._timers) do
		timer:destroy()
	end

	self._timers = nil
end

return

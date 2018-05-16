Timer = class(Timer)

Timer.init = function (self, name, parent, start_time)
	self._t = start_time or 0
	self._dt = 0
	self._name = name
	self._active = true
	self._local_scale = 1
	self._global_scale = 1
	self._parent = parent
	self._children = {}
end

Timer.update = function (self, dt, global_scale)
	local local_scale = self._local_scale
	dt = math.max(dt * local_scale, 1e-06)
	global_scale = global_scale * local_scale

	for name, child in pairs(self._children) do
		if child:active() then
			child:update(dt, global_scale)
		end
	end

	self._dt = dt
	self._t = self._t + dt
	self._global_scale = global_scale
end

Timer.name = function (self)
	return self._name
end

Timer.set_time = function (self, time)
	self._t = time
end

Timer.time = function (self)
	return self._t
end

Timer.active = function (self)
	return self._active
end

Timer.set_active = function (self, active)
	self._active = active
end

Timer.set_local_scale = function (self, scale)
	self._local_scale = scale
end

Timer.local_scale = function (self)
	return self._local_scale
end

Timer.global_scale = function (self)
	return self._global_scale
end

Timer.add_child = function (self, timer)
	self._children[timer:name()] = timer
end

Timer.remove_child = function (self, timer)
	self._children[timer:name()] = nil
end

Timer.children = function (self)
	return self._children
end

Timer.parent = function (self)
	return self._parent
end

Timer.destroy = function (self)
	self._parent = nil
	self._children = nil
end

Timer.delta_time = function (self)
	return self._dt
end

return

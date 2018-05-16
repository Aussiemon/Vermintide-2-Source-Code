CameraTransitionBase = class(CameraTransitionBase)

CameraTransitionBase.init = function (self, node_1, node_2, duration, speed)
	self._node_1 = node_1
	self._node_2 = node_2
	self._duration = duration
	self._speed = speed
	self._start_time = Managers.time:time("game")
	self._time = 0
end

CameraTransitionBase.update = function (self, dt, update_time)
	if update_time then
		self._time = Managers.time:time("game") - self._start_time
	end
end

return

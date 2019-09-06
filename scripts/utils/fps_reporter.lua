FPSReporter = class(FPSReporter)
FPSReporter.NAME = "FPSReporter"

FPSReporter.init = function (self)
	self._avg_fps = 0
	self._num_frames = 1
end

FPSReporter.update = function (self, dt, t)
	local fps = 1 / dt
	self._avg_fps = (fps + self._avg_fps * (self._num_frames - 1)) / self._num_frames
	self._num_frames = self._num_frames + 1
end

FPSReporter.report = function (self)
	Managers.telemetry.events:fps(self._avg_fps)
end

return

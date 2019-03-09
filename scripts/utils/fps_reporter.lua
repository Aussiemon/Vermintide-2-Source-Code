FPSReporter = class(FPSReporter)
FPSReporter.NAME = "FPSReporter"
local FPS_REPORT_PERIOD = 10

FPSReporter.init = function (self)
	self._min_fps = math.huge
	self._max_fps = 0
	self._num_frames = 1
	self._last_report = 0
end

FPSReporter.update = function (self, dt, t)
	self._min_fps = math.min(self._min_fps, 1 / dt)
	self._max_fps = math.max(self._max_fps, 1 / dt)
	local fps = 1 / dt

	if self._num_frames == 1 then
		self._avg_fps = fps
	else
		self._avg_fps = (fps + self._avg_fps * (self._num_frames - 1)) / self._num_frames
	end

	if FPS_REPORT_PERIOD <= t - self._last_report then
		Managers.telemetry.events:fps(self._min_fps, self._max_fps, self._avg_fps)

		self._min_fps = math.huge
		self._max_fps = 0
		self._num_frames = 0
		self._last_report = t
	end

	self._num_frames = self._num_frames + 1
end

return

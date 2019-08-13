FPSReporter = class(FPSReporter)
FPSReporter.NAME = "FPSReporter"
local FPS_REPORT_PERIOD = 20

FPSReporter.init = function (self)
	self._num_frames = 1
	self._last_report = 0
end

FPSReporter.update = function (self, dt, t)
	local fps = 1 / dt

	if self._num_frames == 1 then
		self._fps = fps
	else
		self._fps = (fps + self._fps * (self._num_frames - 1)) / self._num_frames
	end

	if FPS_REPORT_PERIOD <= t - self._last_report then
		Managers.telemetry.events:fps(self._fps)

		self._num_frames = 0
		self._last_report = t
	end

	self._num_frames = self._num_frames + 1
end

return

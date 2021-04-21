FPSReporter = class(FPSReporter)
FPSReporter.NAME = "FPSReporter"
local NUM_BUCKETS = 10

FPSReporter.init = function (self)
	self._avg_fps = 0
	self._histogram = {}
	self._num_frames = 1

	for i = 1, NUM_BUCKETS + 1, 1 do
		self._histogram[i] = 0
	end
end

FPSReporter.update = function (self, dt, t)
	local fps = 1 / math.max(dt, 0.001)

	self:_update_average_fps(fps)
	self:_update_histogram(fps)

	self._num_frames = self._num_frames + 1
end

FPSReporter._update_average_fps = function (self, fps)
	self._avg_fps = (fps + self._avg_fps * (self._num_frames - 1)) / self._num_frames
end

FPSReporter._update_histogram = function (self, fps)
	local bucket_index = math.clamp(math.ceil(fps / NUM_BUCKETS), 1, NUM_BUCKETS + 1)
	self._histogram[bucket_index] = self._histogram[bucket_index] + 1
end

FPSReporter.report = function (self)
	self:_normalize_histogram()
	Managers.telemetry.events:fps(self._avg_fps, self._histogram)
end

FPSReporter.avg_fps = function (self)
	return self._avg_fps
end

FPSReporter._normalize_histogram = function (self)
	local num_frames = 0

	for _, count in pairs(self._histogram) do
		num_frames = num_frames + count
	end

	num_frames = math.max(num_frames, 1)

	for i, _ in pairs(self._histogram) do
		self._histogram[i] = self._histogram[i] / num_frames
	end
end

return

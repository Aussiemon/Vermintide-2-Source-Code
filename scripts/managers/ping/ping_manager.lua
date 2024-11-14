-- chunkname: @scripts/managers/ping/ping_manager.lua

PingManager = class(PingManager)

PingManager.init = function (self)
	self._target_to_region = {}
	self._targets = {}
	self._latency_results = {}
	self._ping_count = 0
	self._is_fetching_data = false
	self._timeout = 0
	self._cb = nil
end

PingManager.update = function (self, dt, t)
	if not self._is_fetching_data then
		return
	end

	local done_operations = Ping.update(dt, t)

	if not done_operations then
		if t > self._timeout then
			self._is_fetching_data = false

			self._cb(false)
		end

		return
	end

	local processed = {}

	for i = 1, #done_operations do
		for target, result in pairs(done_operations[i].results) do
			local ping_target = self._target_to_region[target]

			if ping_target then
				if result.failed then
					printf("RegionLatency, failed to get latency for region %s", ping_target.region)
				else
					processed[ping_target.region] = result.latency
				end
			else
				printf("RegionLatency, did not recieve latency for target %s", target)
			end
		end
	end

	self._latency_results[#self._latency_results + 1] = processed

	if #self._latency_results < self._ping_count then
		self:_ping(self._timeout)
	else
		self._is_fetching_data = false

		self._cb(true, self:_stats())
	end
end

PingManager._stats = function (self)
	local ping_by_region = {}

	for i = 1, #self._latency_results do
		for target, result in pairs(self._latency_results[i]) do
			local target_data = ping_by_region[target] or {}

			target_data[#target_data + 1] = result
			ping_by_region[target] = target_data
		end
	end

	local average_ping_by_region = {}

	for key, target_data in pairs(ping_by_region) do
		local num_targets = #target_data

		if num_targets > 0 then
			average_ping_by_region[key] = {}

			local subtotal_ping = 0

			for i = 1, num_targets do
				subtotal_ping = subtotal_ping + target_data[i]
			end

			average_ping_by_region[key] = subtotal_ping / num_targets
		end
	end

	return average_ping_by_region
end

PingManager._target_to_regions = function (self, regions)
	if not regions then
		print("Received empty region data, nothing to ping")

		return false
	end

	local targets = self._targets
	local target_to_region = self._target_to_region

	table.clear(targets)
	table.clear(target_to_region)

	for i = 1, #regions do
		local region = regions[i]
		local ping_target = region.pingTarget

		targets[#targets + 1] = ping_target
		target_to_region[ping_target] = region
	end

	return true
end

PingManager.ping_multiple_times = function (self, timeout, regions, ping_count, cb)
	if self._is_fetching_data then
		print("Already pinging")

		return
	end

	if not self:_target_to_regions(regions) then
		return
	end

	table.clear(self._latency_results)

	self._ping_count = ping_count
	self._timeout_duration = timeout
	self._cb = cb

	self:_ping()
end

PingManager.ping = function (self, timeout, regions, cb)
	if self._is_fetching_data then
		print("Already pinging")

		return
	end

	if not self:_target_to_regions(regions) then
		return
	end

	table.clear(self._latency_results)

	self._ping_count = 1
	self._timeout_duration = timeout
	self._cb = cb

	self:_ping()
end

PingManager._ping = function (self)
	local t = Managers.time:time("main")

	self._timeout = t + self._timeout_duration
	self._is_fetching_data = true

	Ping.ping(self._timeout_duration, unpack(self._targets))
end

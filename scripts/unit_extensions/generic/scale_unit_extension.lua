ScaleUnitExtension = class(ScaleUnitExtension)

ScaleUnitExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local t = Managers.time:time("game")
	self.start_size = extension_init_data.start_size
	local end_size = extension_init_data.end_size
	self.duration = extension_init_data.duration
	self.full_scale = end_size - self.start_size
	self.timer = 0
end

ScaleUnitExtension.setup = function (self, start_size, end_size, duration)
	self.start_size = start_size or self.start_size
	self.full_scale = end_size - self.start_size
	self.duration = duration
	self.timer = 0
end

ScaleUnitExtension.update = function (self, unit, input, dt, context, t)
	local timer = self.timer

	if timer < self.duration then
		local norm_time = math.clamp(timer / self.duration, 0, 1)
		local scale_value = self.start_size + math.easeCubic(norm_time) * self.full_scale
		local scale = Vector3(1, 1, scale_value)

		Unit.set_local_scale(unit, 0, scale)

		self.timer = self.timer + dt
	end
end

ScaleUnitExtension.scaling_complete = function (self)
	return self.duration <= self.timer
end

ScaleUnitExtension.despawn = function (self)
	return
end

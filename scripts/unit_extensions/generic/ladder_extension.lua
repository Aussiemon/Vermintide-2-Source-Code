LadderExtension = class(LadderExtension)
LadderExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._world = extension_init_context.world
	self._unit = unit
	self._is_server = Managers.state.network.is_server
	self._seed_x = Math.random()
	self._seed_y = Math.random()
	self._node = Unit.get_data(unit, "ladder_shake_node") or 0
	self._enable_shake = not Unit.get_data(unit, "disable_shake")
	self._start_position = Vector3Box(Unit.world_position(self._unit, self._node))
	self._top_position = Vector3Box(Unit.world_position(unit, Unit.node(unit, "node_top")))
	self._bottom_position = Vector3Box(Unit.world_position(unit, Unit.node(unit, "node_bottom")))

	if self._is_server then
		Managers.state.bot_nav_transition:register_ladder(unit)
	end

	return 
end
LadderExtension.ladder_extents = function (self)
	return self._bottom_position:unbox(), self._top_position:unbox()
end
LadderExtension.perlin_shake = {
	persistance = 1,
	magnitude = 0.1,
	frequency_multiplier = 4,
	duration = 1,
	min_value = 0,
	octaves = 6
}

local function calc_noise(x, seed)
	local next_seed, _ = Math.next_random(x * seed)
	local _, value = Math.next_random(next_seed)

	return value * 2 - 1
end

local function calc_smoothed_noise(x, seed)
	return calc_noise(x, seed) / 2 + calc_noise(x - 1, seed) / 4 + calc_noise(x + 1, seed) / 4
end

local function calc_interpolated_noise(x, seed)
	local x_floored = math.floor(x)
	local remainder = x - x_floored
	local v1 = calc_smoothed_noise(x_floored, seed)
	local v2 = calc_smoothed_noise(x_floored + 1, seed)

	return math.lerp(v1, v2, remainder)
end

local function calculate_perlin_value(x, persistance, number_of_octaves, seed)
	local total = 0
	local max_value = 0

	for i = 0, number_of_octaves, 1 do
		local frequency = 2^i
		local amplitude = persistance^i
		total = total + calc_interpolated_noise(x * frequency, seed) * amplitude
		max_value = max_value + amplitude
	end

	local normalized_total = total / max_value

	return normalized_total
end

LadderExtension.update_enabled = function (self, unit, input, dt, context, t)
	if self._shaking then
		local shake_t = t - self._shaking
		local config = self.perlin_shake
		local duration = config.duration

		if shake_t < duration then
			if self._enable_shake then
				local perlin_value_x = calculate_perlin_value(shake_t * config.frequency_multiplier, config.persistance, config.octaves, self._seed_x)
				local perlin_value_y = calculate_perlin_value(shake_t * config.frequency_multiplier, config.persistance, config.octaves, self._seed_y)
				local magnitude = config.magnitude * math.lerp(1, 0, shake_t / duration)^2

				Unit.set_local_position(self._unit, self._node, self._start_position:unbox() + Vector3(perlin_value_x * magnitude, perlin_value_y * magnitude, 0))
			end
		else
			Managers.state.entity:system("ladder_system"):disable_update_function("LadderExtension", "update", self._unit)

			self.update = nil
			self._shaking = false
		end
	end

	return 
end
LadderExtension.is_shaking = function (self)
	return (self._shaking and true) or false
end
LadderExtension.shake = function (self)
	if not self._shaking then
		self._shaking = Managers.time:time("game")

		if self._is_server then
			local level = LevelHelper:current_level(self._world)
			local level_index = Level.unit_index(level, self._unit)

			Managers.state.network.network_transmit:send_rpc_clients("rpc_ladder_shake", level_index)
		end

		Managers.state.entity:system("ladder_system"):enable_update_function("LadderExtension", "update", self._unit, self)

		self.update = self.update_enabled
	end

	return 
end
LadderExtension.destroy = function (self)
	if self._is_server then
		Managers.state.bot_nav_transition:unregister_ladder(self._unit)
	end

	return 
end

return 

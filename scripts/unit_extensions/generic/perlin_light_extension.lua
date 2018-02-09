require("scripts/settings/perlin_light_configurations")

PerlinLightExtension = class(PerlinLightExtension)
PerlinLightExtension.init = function (self, extension_init_context, unit)
	self._unit = unit
	self._flicker_config_name = Unit.get_data(unit, "flicker_config")
	self._seed_flicker = Math.random()
	self._seed_x = Math.random()
	self._seed_y = Math.random()
	self._node = (Unit.has_data(unit, "perlin_light_node_name") and Unit.node(unit, Unit.get_data(unit, "perlin_light_node_name"))) or 0
	self._light = Unit.light(unit, 0)
	self._color = Vector3Box(Light.color(self._light))
	self._start_pos = Vector3Box(Unit.local_position(unit, self._node))

	return 
end
local calculate_perlin_value, calc_interpolated_noise = nil
PerlinLightExtension.update = function (self, unit, input, dt, context, t)
	local config = PerlinLightConfigurations[self._flicker_config_name]
	local perlin_value = calculate_perlin_value(t*config.frequency_multiplier, config.persistance, config.octaves, self._seed_flicker)
	perlin_value = perlin_value*0.5 + 0.5
	local min_value = config.min_value
	local light_value = perlin_value*(min_value - 1) + min_value

	Light.set_color(self._light, self._color:unbox()*light_value)

	if config.translation then
		local perlin_value_x = calculate_perlin_value(t*config.translation.frequency_multiplier, config.translation.persistance, config.translation.octaves, self._seed_x)
		local perlin_value_y = calculate_perlin_value(t*config.translation.frequency_multiplier, config.translation.persistance, config.translation.octaves, self._seed_y)

		Unit.set_local_position(self._unit, self._node, self._start_pos:unbox() + Vector3(perlin_value_x*0.1, perlin_value_y*0.1, 0))
	end

	return 
end
PerlinLightExtension.destroy = function (self)
	return 
end

function calculate_perlin_value(x, persistance, number_of_octaves, seed)
	local total = 0
	local max_value = 0

	for i = 0, number_of_octaves, 1 do
		local frequency = 2^i
		local amplitude = persistance^i
		total = total + calc_interpolated_noise(x*frequency, seed)*amplitude
		max_value = max_value + amplitude
	end

	local normalized_total = total/max_value

	return normalized_total
end

local function calc_noise(x, seed)
	local next_seed, _ = Math.next_random(x*seed)
	local _, value = Math.next_random(next_seed)

	return value*2 - 1
end

local function calc_smoothed_noise(x, seed)
	return calc_noise(x, seed)/2 + calc_noise(x - 1, seed)/4 + calc_noise(x + 1, seed)/4
end

function calc_interpolated_noise(x, seed)
	local x_floored = math.floor(x)
	local remainder = x - x_floored
	local v1 = calc_smoothed_noise(x_floored, seed)
	local v2 = calc_smoothed_noise(x_floored + 1, seed)

	return math.lerp(v1, v2, remainder)
end

if not Math.calculate_perlin_value then
end

return 

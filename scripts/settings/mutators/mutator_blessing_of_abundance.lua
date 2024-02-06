-- chunkname: @scripts/settings/mutators/mutator_blessing_of_abundance.lua

require("scripts/settings/dlcs/morris/deus_blessing_settings")

local drop_chance = 1
local possible_drops = {
	{
		drop_weight = 500,
		pickup_name = "frag_grenade_t1",
		spawn_function = "spawn_pickup_at_unit",
	},
	{
		drop_weight = 500,
		pickup_name = "frag_grenade_t2",
		spawn_function = "spawn_pickup_at_unit",
	},
	{
		drop_weight = 500,
		pickup_name = "fire_grenade_t1",
		spawn_function = "spawn_pickup_at_unit",
	},
	{
		drop_weight = 500,
		pickup_name = "fire_grenade_t2",
		spawn_function = "spawn_pickup_at_unit",
	},
	{
		drop_weight = 10,
		pickup_name = "holy_hand_grenade",
		spawn_function = "spawn_pickup_at_unit",
	},
	{
		drop_weight = 2000,
		pickup_name = "all_ammo_small",
		spawn_function = "spawn_pickup_at_unit",
	},
	{
		drop_weight = 500,
		pickup_name = "liquid_bravado_potion",
		spawn_function = "spawn_pickup_at_unit",
	},
	{
		drop_weight = 500,
		pickup_name = "friendly_murderer_potion",
		spawn_function = "spawn_pickup_at_unit",
	},
	{
		drop_weight = 500,
		pickup_name = "killer_in_the_shadows_potion",
		spawn_function = "spawn_pickup_at_unit",
	},
	{
		drop_weight = 500,
		pickup_name = "pockets_full_of_bombs_potion",
		spawn_function = "spawn_pickup_at_unit",
	},
	{
		drop_weight = 500,
		pickup_name = "hold_my_beer_potion",
		spawn_function = "spawn_pickup_at_unit",
	},
	{
		drop_weight = 500,
		pickup_name = "moot_milk_potion",
		spawn_function = "spawn_pickup_at_unit",
	},
	{
		drop_weight = 500,
		pickup_name = "vampiric_draught_potion",
		spawn_function = "spawn_pickup_at_unit",
	},
}

local function get_normalized_possible_drops()
	local normalized_weights = {}
	local weight_sum = 0

	for _, config in ipairs(possible_drops) do
		weight_sum = weight_sum + config.drop_weight
	end

	for i = 1, #possible_drops do
		local drop_weight = possible_drops[i].drop_weight
		local normalized_weight = drop_weight / weight_sum

		normalized_weights[i] = possible_drops[i]
		normalized_weights[i].drop_weight = normalized_weight
	end

	return normalized_weights
end

local normalized_possible_drops = get_normalized_possible_drops()

local function get_random_drop_table(possible_drops_table, random)
	local weight_sum = 0

	for _, drop_table in ipairs(possible_drops_table) do
		weight_sum = weight_sum + drop_table.drop_weight

		if random < weight_sum then
			return drop_table
		end
	end

	assert(possible_drops_table[1], "Does not contain first entry. Something went wrong.")

	return possible_drops_table[1]
end

local spawn_functions = {
	spawn_pickup_at_unit = function (unit, drop_table)
		local position = POSITION_LOOKUP[unit] + Vector3.up() * 0.1
		local raycast_down = true
		local pickup_name = drop_table.pickup_name
		local pickup_system = Managers.state.entity:system("pickup_system")

		pickup_system:buff_spawn_pickup(pickup_name, position, raycast_down)
	end,
	spawn_ignited_barrel_at_unit = function (unit, drop_table)
		local position = POSITION_LOOKUP[unit] + Vector3.up() * 0.1
		local rotation = Quaternion.identity()
		local network_position = AiAnimUtils.position_network_scale(position, true)
		local network_rotation = AiAnimUtils.rotation_network_scale(rotation, true)
		local network_velocity = AiAnimUtils.velocity_network_scale(Vector3(0, 0, 0), true)
		local pickup_name = drop_table.pickup_name
		local t = Managers.time:time("game")
		local explosion_data = {
			explode_time = t + drop_table.explode_time,
			fuse_time = drop_table.fuse_time,
		}
		local extension_init_data = {
			projectile_locomotion_system = {
				network_position = network_position,
				network_rotation = network_rotation,
				network_velocity = network_velocity,
				network_angular_velocity = network_velocity,
			},
			death_system = {
				in_hand = false,
				death_data = explosion_data,
				item_name = pickup_name,
			},
			health_system = {
				damage = 1,
				health_data = explosion_data,
				item_name = pickup_name,
			},
			pickup_system = {
				has_physics = true,
				spawn_type = "loot",
				pickup_name = pickup_name,
			},
		}
		local pickup_settings = AllPickups[pickup_name]
		local unit_name = pickup_settings.unit_name
		local unit_template_name = pickup_settings.unit_template_name or "pickup_unit"

		Managers.state.unit_spawner:spawn_network_unit(unit_name, unit_template_name, extension_init_data, position, rotation)
	end,
}

return {
	display_name = DeusBlessingSettings.blessing_of_abundance.display_name,
	description = DeusBlessingSettings.blessing_of_abundance.description,
	icon = DeusBlessingSettings.blessing_of_abundance.icon,
	server_start_function = function (context, data, unit)
		data.seed = Managers.mechanism:get_level_seed("mutator")
	end,
	server_ai_killed_function = function (context, data, killed_unit, killer_unit)
		local killed_breed = Unit.get_data(killed_unit, "breed")

		if not killed_breed.special and not killed_breed.elite and not killed_breed.boss then
			return
		end

		local random

		data.seed, random = Math.next_random(data.seed)

		if random <= drop_chance then
			data.seed, random = Math.next_random(data.seed)

			local possible_drops_table = table.clone(normalized_possible_drops)

			table.array_remove_if(possible_drops_table, function (value)
				return value.pickup_name == data.last_dropped_pickup
			end)

			local drop_table = get_random_drop_table(possible_drops_table, random)
			local spawn_function = drop_table.spawn_function

			spawn_functions[spawn_function](killed_unit, drop_table)

			data.last_dropped_pickup = drop_table.pickup_name
		end
	end,
}

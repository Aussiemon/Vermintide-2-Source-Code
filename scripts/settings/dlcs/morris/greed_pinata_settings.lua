-- chunkname: @scripts/settings/dlcs/morris/greed_pinata_settings.lua

local spawn_functions = {
	spawn_pickup_at_unit = function (pickup_name, position, pickup_data, last_attacker_id)
		local pickup_system = Managers.state.entity:system("pickup_system")

		return pickup_system:buff_spawn_pickup(pickup_name, position, true, "spawn_pickup")
	end,
	spawn_ignited_barrel_at_unit = function (pickup_name, position, pickup_data, last_attacker_id)
		local rotation = Quaternion.identity()
		local network_position = AiAnimUtils.position_network_scale(position, true)
		local network_rotation = AiAnimUtils.rotation_network_scale(rotation, true)
		local network_velocity = AiAnimUtils.velocity_network_scale(Vector3(0, 0, 0), true)
		local explode_time = pickup_data.explode_time or 3
		local fuse_time = pickup_data.fuse_time or 3
		local t = Managers.time:time("game")
		local explosion_data = {
			explode_time = t + explode_time,
			fuse_time = fuse_time,
			attacker_unit_id = last_attacker_id,
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

		return Managers.state.unit_spawner:spawn_network_unit(unit_name, unit_template_name, extension_init_data, position, rotation)
	end,
}

GreedPinataSettings = {
	total_drops = 3,
	possible_drops = {
		first_aid_kit = {
			drop_weight = 6,
			spawn_function = spawn_functions.spawn_pickup_at_unit,
		},
		healing_draught = {
			drop_weight = 6,
			spawn_function = spawn_functions.spawn_pickup_at_unit,
		},
		frag_grenade_t2 = {
			drop_weight = 8,
			spawn_function = spawn_functions.spawn_pickup_at_unit,
		},
		fire_grenade_t2 = {
			drop_weight = 8,
			spawn_function = spawn_functions.spawn_pickup_at_unit,
		},
		friendly_murderer_potion = {
			drop_weight = 5,
			spawn_function = spawn_functions.spawn_pickup_at_unit,
		},
		killer_in_the_shadows_potion = {
			drop_weight = 5,
			spawn_function = spawn_functions.spawn_pickup_at_unit,
		},
		hold_my_beer_potion = {
			drop_weight = 5,
			spawn_function = spawn_functions.spawn_pickup_at_unit,
		},
		pockets_full_of_bombs_potion = {
			drop_weight = 1,
			spawn_function = spawn_functions.spawn_pickup_at_unit,
		},
		vampiric_draught_potion = {
			drop_weight = 5,
			spawn_function = spawn_functions.spawn_pickup_at_unit,
		},
		all_ammo_small = {
			drop_weight = 25,
			spawn_function = spawn_functions.spawn_pickup_at_unit,
		},
		deus_soft_currency = {
			drop_weight = 40,
			spawn_function = spawn_functions.spawn_pickup_at_unit,
		},
		lamp_oil = {
			drop_weight = 8,
			pickup_data = {
				explode_time = 3,
				fuse_time = 3,
			},
			spawn_function = spawn_functions.spawn_ignited_barrel_at_unit,
		},
		explosive_barrel = {
			drop_weight = 8,
			pickup_data = {
				explode_time = 3,
				fuse_time = 3,
			},
			spawn_function = spawn_functions.spawn_ignited_barrel_at_unit,
		},
	},
}

local total_pinata_spawn_weighting = 0

for _, drop in pairs(GreedPinataSettings.possible_drops) do
	total_pinata_spawn_weighting = total_pinata_spawn_weighting + drop.drop_weight
end

for _, drop in pairs(GreedPinataSettings.possible_drops) do
	drop.drop_weight = drop.drop_weight / total_pinata_spawn_weighting
end

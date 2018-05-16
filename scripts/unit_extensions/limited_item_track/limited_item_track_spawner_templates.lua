LimitedItemTrackSpawnerTemplates = {
	explosive_barrel_spawner = {
		init_func = function (world, spawner_unit, extension_init_data)
			local spawn_data = {}

			return spawn_data
		end,
		spawn_func = function (world, spawner_unit, spawn_data)
			local position = Unit.local_position(spawner_unit, 0)
			local rotation = Unit.local_rotation(spawner_unit, 0)
			local network_position = AiAnimUtils.position_network_scale(position, true)
			local network_rotation = AiAnimUtils.rotation_network_scale(rotation, true)
			local network_velocity = AiAnimUtils.velocity_network_scale(Vector3(0, 0, 0), true)
			local network_angular_velocity = network_velocity
			local pickup_name = Unit.get_data(spawner_unit, "pickup_name")
			pickup_name = (pickup_name ~= "" and pickup_name) or "explosive_barrel_objective"
			local pickup_data = Pickups.level_events[pickup_name]
			local unit_name = pickup_data.unit_name
			local unit_template_name = pickup_data.unit_template_name
			local extension_init_data = {
				projectile_locomotion_system = {
					network_position = network_position,
					network_rotation = network_rotation,
					network_velocity = network_velocity,
					network_angular_velocity = network_angular_velocity
				},
				pickup_system = {
					spawn_type = "limited",
					pickup_name = pickup_name
				},
				limited_item_track_system = {
					id = spawn_data.id,
					spawner_unit = spawner_unit
				},
				death_system = {
					in_hand = false,
					item_name = pickup_name
				},
				health_system = {
					in_hand = false,
					item_name = pickup_name
				}
			}
			local modified_position = AiAnimUtils.position_network_scale(network_position)
			local modified_rotation = AiAnimUtils.rotation_network_scale(network_rotation)

			return Managers.state.unit_spawner:spawn_network_unit(unit_name, unit_template_name, extension_init_data, modified_position, modified_rotation)
		end
	},
	sack_spawner = {
		init_func = function (world, spawner_unit, extension_init_data)
			local spawn_data = {}

			return spawn_data
		end,
		spawn_func = function (world, spawner_unit, spawn_data)
			local position = Unit.local_position(spawner_unit, 0)
			local rotation = Unit.local_rotation(spawner_unit, 0)
			local network_position = AiAnimUtils.position_network_scale(position, true)
			local network_rotation = AiAnimUtils.rotation_network_scale(rotation, true)
			local network_velocity = AiAnimUtils.velocity_network_scale(Vector3(0, 0, 0), true)
			local network_angular_velocity = network_velocity
			local pickup_name = Unit.get_data(spawner_unit, "pickup_name")
			pickup_name = (pickup_name ~= "" and pickup_name) or "grain_sack"
			local pickup_data = Pickups.level_events[pickup_name]
			local unit_name = pickup_data.unit_name
			local unit_template_name = pickup_data.unit_template_name
			local extension_init_data = {
				projectile_locomotion_system = {
					network_position = network_position,
					network_rotation = network_rotation,
					network_velocity = network_velocity,
					network_angular_velocity = network_angular_velocity
				},
				pickup_system = {
					spawn_type = "limited",
					pickup_name = pickup_name
				},
				limited_item_track_system = {
					id = spawn_data.id,
					spawner_unit = spawner_unit
				}
			}
			local modified_position = AiAnimUtils.position_network_scale(network_position)
			local modified_rotation = AiAnimUtils.rotation_network_scale(network_rotation)

			return Managers.state.unit_spawner:spawn_network_unit(unit_name, unit_template_name, extension_init_data, modified_position, modified_rotation)
		end
	},
	cannon_ball_spawner = {
		init_func = function (world, spawner_unit, extension_init_data)
			local spawn_data = {}

			return spawn_data
		end,
		spawn_func = function (world, spawner_unit, spawn_data)
			local position = Unit.local_position(spawner_unit, 0)
			local rotation = Unit.local_rotation(spawner_unit, 0)
			local network_position = AiAnimUtils.position_network_scale(position, true)
			local network_rotation = AiAnimUtils.rotation_network_scale(rotation, true)
			local network_velocity = AiAnimUtils.velocity_network_scale(Vector3(0, 0, 0), true)
			local network_angular_velocity = network_velocity
			local pickup_name = Unit.get_data(spawner_unit, "pickup_name")
			pickup_name = (pickup_name ~= "" and pickup_name) or "cannon_ball"
			local pickup_data = Pickups.level_events[pickup_name]
			local unit_name = pickup_data.unit_name
			local unit_template_name = pickup_data.unit_template_name
			local extension_init_data = {
				projectile_locomotion_system = {
					network_position = network_position,
					network_rotation = network_rotation,
					network_velocity = network_velocity,
					network_angular_velocity = network_angular_velocity
				},
				pickup_system = {
					spawn_type = "limited",
					pickup_name = pickup_name
				},
				limited_item_track_system = {
					id = spawn_data.id,
					spawner_unit = spawner_unit
				},
				death_system = {
					in_hand = false,
					item_name = pickup_name
				},
				health_system = {
					in_hand = false,
					item_name = pickup_name
				}
			}
			local modified_position = AiAnimUtils.position_network_scale(network_position)
			local modified_rotation = AiAnimUtils.rotation_network_scale(network_rotation)

			return Managers.state.unit_spawner:spawn_network_unit(unit_name, unit_template_name, extension_init_data, modified_position, modified_rotation)
		end
	}
}

return

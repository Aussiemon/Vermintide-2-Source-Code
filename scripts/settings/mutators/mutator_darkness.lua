return {
	description = "description_mutator_darkness",
	display_name = "display_name_mutator_darkness",
	disable_environment_variations = true,
	icon = "mutator_icon_darkness",
	server_start_function = function (context, data)
		data.tick_interval = 0.1
		data.next_tick = 0
	end,
	server_update_function = function (context, data, dt, t)
		if t < data.next_tick then
			return
		else
			data.next_tick = t + data.tick_interval
		end

		local side = Managers.state.side:get_side_from_name("heroes")
		local player_units = side.PLAYER_UNITS
		local num_player_units = #player_units

		if num_player_units == 0 then
			return
		elseif not data.players_spawned then
			data.tick_interval = 5
			data.players_spawned = true
		end

		local pickup_system = Managers.state.entity:system("pickup_system")
		local torch_pups_in_level = pickup_system:get_pickups_by_type("mutator_torch")

		if not table.is_empty(torch_pups_in_level) then
			data.should_spawn_torch = false

			return
		end

		for i = 1, num_player_units, 1 do
			local inventory_extension = ScriptUnit.has_extension(player_units[i], "inventory_system")
			local has_torch = inventory_extension and inventory_extension:has_inventory_item("slot_level_event", "mutator_torch")

			if has_torch then
				data.should_spawn_torch = false

				return
			end
		end

		if not data.should_spawn_torch then
			data.should_spawn_torch = true

			return
		end

		local init_idx = math.random(num_player_units)
		local player_idx, player_unit, status_extension = nil

		for i = 1, num_player_units, 1 do
			local player_idx = math.index_wrapper(init_idx + 47 * i, num_player_units)
			player_unit = player_units[player_idx]
			status_extension = ScriptUnit.extension(player_unit, "status_system")

			if not status_extension:is_disabled() then
				break
			end
		end

		local position = Unit.world_position(player_unit, 0) + Vector3.up()
		local rotation = Quaternion.identity()
		local network_position = AiAnimUtils.position_network_scale(position, true)
		local network_rotation = AiAnimUtils.rotation_network_scale(rotation, true)
		local network_velocity = AiAnimUtils.velocity_network_scale(Vector3(0, 0, 0), true)
		local network_angular_velocity = network_velocity
		local extension_init_data = {
			pickup_system = {
				has_physics = true,
				pickup_name = "mutator_torch",
				spawn_type = "guaranteed"
			},
			projectile_locomotion_system = {
				network_position = network_position,
				network_rotation = network_rotation,
				network_velocity = network_velocity,
				network_angular_velocity = network_angular_velocity
			}
		}
		local unit_name = "units/weapons/player/pup_torch/pup_torch"
		local unit_template_name = "pickup_torch_unit"

		Managers.state.unit_spawner:spawn_network_unit(unit_name, unit_template_name, extension_init_data, position, rotation)

		data.should_spawn_torch = false
	end,
	client_start_function = function (context, data)
		local world = Managers.world:world("level_world")

		LevelHelper:flow_event(world, "mutator_darkness")

		local darkness_system = Managers.state.entity:system("darkness_system")

		darkness_system:set_global_darkness(true)
		darkness_system:set_player_light_intensity(0.15)

		local level_settings = LevelHelper:current_level_settings()

		if not level_settings.camera_backlight then
			local player_manager = Managers.player
			local local_player = player_manager:local_player()
			local camera_unit = local_player.camera_follow_unit
			local light = Unit.light(camera_unit, "light")

			if light then
				local backlight_settings = {
					intensity = 0.015,
					start_falloff = 0,
					end_falloff = 5,
					color = Vector3(0.9, 0.7, 0.6)
				}

				Light.set_color(light, backlight_settings.color)
				Light.set_intensity(light, backlight_settings.intensity)
				Light.set_falloff_start(light, backlight_settings.start_falloff)
				Light.set_falloff_end(light, backlight_settings.end_falloff)
			end
		end
	end,
	client_stop_function = function (context, data, is_destroy)
		local world = Managers.world:world("level_world")

		if not is_destroy then
			LevelHelper:flow_event(world, "disable_darkness")

			local darkness_system = Managers.state.entity:system("darkness_system")

			darkness_system:set_global_darkness(false)
		end
	end
}

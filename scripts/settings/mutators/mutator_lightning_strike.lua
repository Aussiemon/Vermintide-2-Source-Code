-- chunkname: @scripts/settings/mutators/mutator_lightning_strike.lua

return {
	description = "lightning_strike_mutator_desc",
	display_name = "lightning_strike_mutator_name",
	icon = "mutator_icon_heavens_lightning",
	max_spawns = 3,
	spawn_rate = 11,
	spawn_lightning_strike_unit = function (data)
		local side_manager = data.side_manager
		local hero_side = Managers.state.side:get_side_from_name("heroes")
		local player_and_bot_units = hero_side.PLAYER_AND_BOT_UNITS
		local neutral_side = side_manager:get_side_from_name("neutral")
		local side_id = neutral_side.side_id

		table.clear(data.units)

		for _, player_unit in pairs(player_and_bot_units) do
			data.extension_init_data.area_damage_system.follow_unit = player_unit

			local unit = Managers.state.unit_spawner:spawn_network_unit(data.decal_unit_name, "timed_explosion_unit", data.extension_init_data, Unit.local_position(player_unit, 0))

			side_manager:add_unit_to_side(unit, side_id)
			data.audio_system:play_audio_unit_event("Play_winds_heavens_gameplay_spawn", unit)

			data.units[#data.units + 1] = unit
		end

		data.lock_played = false
		data.charge_played = false
		data.hit_played = false
		data.bots_alerted = false
	end,
	server_start_function = function (context, data)
		data.last_spawn_time = nil
		data.spawn_rate = data.template.spawn_rate
		data.max_spawns = data.template.max_spawns
		data.num_spawns = 0
		data.build_up_effect_time = 1.5
		data.side_manager = Managers.state.side
		data.units = {}
		data.decal_unit_name = "units/decals/decal_heavens_01"
		data.audio_system = Managers.state.entity:system("audio_system")
		data.explosion_template = ExplosionUtils.get_template("lightning_strike_twitch")
		data.follow_time = data.explosion_template.follow_time
		data.time_to_explode = data.explosion_template.time_to_explode
		data.extension_init_data = {
			area_damage_system = {
				explosion_template_name = "lightning_strike_twitch",
			},
		}

		local ai_system = Managers.state.entity:system("ai_system")

		data.ai_system = ai_system
		data._nav_cost_map_id = data._nav_cost_map_id or ai_system:create_nav_cost_map("mutator_heavens_zone", 4)
		data._nav_cost_volume_ids = {}
		data._nav_cost_radius = 4
	end,
	server_stop_function = function (context, data)
		data._nav_cost_map_id = nil

		if #data.units > 0 then
			for k, unit in ipairs(data.units) do
				if ALIVE[unit] then
					Managers.state.unit_spawner:mark_for_deletion(unit)
				end

				data.units[k] = nil
			end
		end
	end,
	server_update_function = function (context, data, dt, t)
		if not Managers.state.network or not Managers.state.network:game() then
			return
		end

		local template = data.template
		local last_spawn_time = data.last_spawn_time
		local spawn_rate = data.spawn_rate

		if #data.units > 0 then
			if not data.lock_played then
				if t > last_spawn_time + data.follow_time then
					data.lock_played = true

					for i = 1, #data.units do
						local unit = data.units[i]

						if ALIVE[unit] then
							data.audio_system:play_audio_unit_event("Play_winds_heavens_gameplay_lock", unit)

							if data._nav_cost_map_id then
								local position = POSITION_LOOKUP[unit]
								local nav_cost_map_volume_id = data.ai_system:add_nav_cost_map_sphere_volume(position, data._nav_cost_radius, data._nav_cost_map_id)

								table.insert(data._nav_cost_volume_ids, nav_cost_map_volume_id)
							end
						end
					end
				end
			elseif t < last_spawn_time + data.follow_time + data.time_to_explode then
				if t > last_spawn_time + data.follow_time + data.time_to_explode - 3 and not data.bots_alerted then
					local aoe_thread_size = Vector3(data._nav_cost_radius, data._nav_cost_radius, data._nav_cost_radius * 0.5)
					local bot_group_system = Managers.state.entity:system("ai_bot_group_system")

					for i = 1, #data.units do
						local unit = data.units[i]

						if Unit.alive(unit) then
							local position = POSITION_LOOKUP[unit]

							bot_group_system:aoe_threat_created(position, "cylinder", aoe_thread_size, nil, 3)
						end
					end

					data.bots_alerted = true
				end

				if t > last_spawn_time + data.follow_time + data.time_to_explode - data.build_up_effect_time then
					if not data.charge_played then
						data.charge_played = true

						for i = 1, #data.units do
							local unit = data.units[i]

							if ALIVE[unit] then
								data.audio_system:play_audio_unit_event("Play_winds_heavens_gamepay_charge", unit)
							end
						end
					end

					local parameter = 100 - math.abs(last_spawn_time + data.follow_time + data.time_to_explode - t) / data.build_up_effect_time * 100
					local players = Managers.player:players()

					for _, player in pairs(players) do
						Managers.state.network.network_transmit:send_rpc("rpc_client_audio_set_global_parameter", player.peer_id, 6, parameter)
					end
				end
			elseif not data.hit_played and t > last_spawn_time + data.follow_time + data.time_to_explode then
				data.hit_played = true

				for i = 1, #data.units do
					local unit = data.units[i]

					if ALIVE[unit] then
						data.audio_system:play_audio_unit_event("Play_winds_heavens_gameplay_hit", unit)
					end
				end

				for i = 1, #data._nav_cost_volume_ids do
					local volume_id = data._nav_cost_volume_ids[i]

					data.ai_system:remove_nav_cost_map_volume(volume_id, data._nav_cost_map_id)
				end

				table.clear(data._nav_cost_volume_ids)
			end
		end

		if last_spawn_time and t > last_spawn_time + spawn_rate and data.num_spawns < data.max_spawns then
			template.spawn_lightning_strike_unit(data)

			data.num_spawns = data.num_spawns + 1
			data.last_spawn_time = data.last_spawn_time + spawn_rate
		elseif last_spawn_time == nil then
			data.last_spawn_time = t - spawn_rate
		end
	end,
}

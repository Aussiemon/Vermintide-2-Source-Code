return {
	description = "lightning_strike_mutator_desc",
	display_name = "lightning_strike_mutator_name",
	spawn_rate = 20,
	spawn_delay = -1,
	icon = "mutator_icon_heavens_lightning",
	spawn_lightning_strike_unit = function (data)
		for _, player in pairs(Managers.player:players()) do
			local player_unit = player.player_unit

			table.clear(data.units)

			if Unit.alive(player_unit) then
				data.extension_init_data.area_damage_system.follow_unit = player_unit
				local unit = Managers.state.unit_spawner:spawn_network_unit(data.decal_unit_name, "timed_explosion_unit", data.extension_init_data, Unit.local_position(player_unit, 0))
				local side_manager = Managers.state.side
				local neutral_side = side_manager:get_side_from_name("neutral")
				local side_id = neutral_side.side_id

				side_manager:add_unit_to_side(unit, side_id)
				data.audio_system:play_audio_unit_event("Play_winds_heavens_gameplay_spawn", unit)

				data.units[#data.units + 1] = unit
			end

			data.lock_played = false
			data.charge_played = false
			data.hit_played = false
		end
	end,
	server_start_function = function (context, data)
		data.last_spawn_time = nil
		data.initial_spawn_delay = data.template.spawn_delay
		data.spawn_rate = data.template.spawn_rate
		data.units = {}
		data.decal_unit_name = "units/decals/decal_heavens_01"
		data.audio_system = Managers.state.entity:system("audio_system")
		data.explosion_template = ExplosionTemplates.lightning_strike_temp
		data.follow_time = data.explosion_template.follow_time
		data.time_to_explode = data.explosion_template.time_to_explode
		data.extension_init_data = {
			area_damage_system = {
				explosion_template_name = "lightning_strike_temp"
			}
		}
	end,
	server_stop_function = function (context, data)
		if #data.units > 0 then
			for k, unit in ipairs(data.units) do
				Managers.state.unit_spawner:mark_for_deletion(unit)

				data.units[k] = nil
			end
		end
	end,
	server_update_function = function (context, data, dt, t)
		local game_session = Network.game_session()

		if game_session == nil then
			return
		end

		local template = data.template
		local last_spawn_time = data.last_spawn_time
		local spawn_rate = data.spawn_rate

		if #data.units > 0 then
			if not data.lock_played then
				if t > last_spawn_time + data.follow_time then
					data.lock_played = true

					for i = 1, #data.units, 1 do
						local unit = data.units[i]

						if Unit.alive(unit) then
							data.audio_system:play_audio_unit_event("Play_winds_heavens_gameplay_lock", unit)
						end
					end
				end
			elseif t < last_spawn_time + data.follow_time + data.time_to_explode then
				if t > (last_spawn_time + data.follow_time + data.time_to_explode) - 1.5 then
					if not data.charge_played then
						data.charge_played = true

						for i = 1, #data.units, 1 do
							local unit = data.units[i]

							if Unit.alive(unit) then
								data.audio_system:play_audio_unit_event("Play_winds_heavens_gamepay_charge", unit)
							end
						end
					end

					local parameter = 100 - math.abs((last_spawn_time + data.follow_time + data.time_to_explode) - t) / 1.5 * 100
					local players = Managers.player:players()

					for _, player in pairs(players) do
						Managers.state.network.network_transmit:send_rpc("rpc_client_audio_set_global_parameter", player.peer_id, 6, parameter)
					end
				end
			elseif not data.hit_played and t > last_spawn_time + data.follow_time + data.time_to_explode then
				data.hit_played = true

				for i = 1, #data.units, 1 do
					local unit = data.units[i]

					if Unit.alive(unit) then
						data.audio_system:play_audio_unit_event("Play_winds_heavens_gameplay_hit", unit)
					end
				end
			end
		end

		if last_spawn_time and t > last_spawn_time + spawn_rate then
			template.spawn_lightning_strike_unit(data)

			data.last_spawn_time = data.last_spawn_time + spawn_rate
		elseif last_spawn_time == nil then
			data.last_spawn_time = (t + data.initial_spawn_delay) - spawn_rate
		end
	end
}

return {
	description = "weaves_heavens_mutator_desc",
	display_name = "weaves_heavens_mutator_name",
	icon = "mutator_icon_heavens_lightning",
	spawn_lightning_strike_unit = function (data)
		table.clear(data.units)

		for _, player in pairs(Managers.player:players()) do
			local player_unit = player.player_unit

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
			data.bots_alerted = false
		end
	end,
	server_start_function = function (context, data)
		local wind_strength = Managers.weave:get_wind_strength() or 1
		local mutator_settings = Managers.weave:get_active_wind_settings()
		local difficulty_name = Managers.state.difficulty:get_difficulty()
		data.follow_time = mutator_settings.timed_explosion_extension_settings.follow_time[difficulty_name][wind_strength]
		data.time_to_explode = mutator_settings.timed_explosion_extension_settings.time_to_explode[difficulty_name][wind_strength]
		data.spawn_rate = mutator_settings.spawn_rate[difficulty_name][wind_strength]
		data.last_spawn_time = nil
		data.initial_spawn_delay = 5
		data.units = {}
		data.decal_unit_name = "units/decals/decal_heavens_01"
		data.audio_system = Managers.state.entity:system("audio_system")
		data.extension_init_data = {
			area_damage_system = {
				explosion_template_name = "lightning_strike"
			}
		}
		data.boss_lightning_challenge = {}
		data.boss_lightning_challenge_counter = 0
		local ai_system = Managers.state.entity:system("ai_system")
		data.ai_system = ai_system
		data._nav_cost_map_id = data._nav_cost_map_id or ai_system:create_nav_cost_map("mutator_heavens_zone", 4)
		data._nav_cost_volume_ids = {}
		data._nav_cost_radius = mutator_settings.radius[difficulty_name][wind_strength]
	end,
	server_stop_function = function (context, data, is_destroy)
		data._nav_cost_map_id = nil
	end,
	server_ai_killed_function = function (context, data, killed_unit, killer_unit, death_data, killing_blow_data)
		if ScorpionSeasonalSettings.current_season_id == 1 then
			if data.boss_lightning_challenge_counter > 0 then
				local boss_killed_only_by_lightning = data.boss_lightning_challenge[killed_unit]

				if boss_killed_only_by_lightning then
					local stat_group_name = "season_1"
					local stat_name = "scorpion_weaves_heavens_season_1"
					local stat_group_index = NetworkLookup.statistics_group_name[stat_group_name]
					local stat_name_index = NetworkLookup.statistics[stat_name]
					local statistics_db = Managers.player:statistics_db()
					local local_player = Managers.player:local_player()
					local stats_id = local_player:stats_id()

					statistics_db:increment_stat(stats_id, stat_group_name, stat_name)

					data.boss_lightning_challenge_counter = 0

					Managers.state.network.network_transmit:send_rpc_clients("rpc_increment_stat_group", stat_group_index, stat_name_index)
				end
			end
		else
			data.boss_lightning_challenge_counter = 0
		end
	end,
	server_ai_hit_by_player_function = function (context, data, hit_unit, attacker_unit, hit_data)
		if data.boss_lightning_challenge_counter > 0 then
			local is_boss = data.boss_lightning_challenge[hit_unit]

			if is_boss then
				local player_unit = Managers.player:is_player_unit(attacker_unit)
				local hit_score = hit_data[DamageDataIndex.DAMAGE_AMOUNT]

				if player_unit and hit_score > 0 then
					data.boss_lightning_challenge[hit_unit] = nil
					data.boss_lightning_challenge_counter = data.boss_lightning_challenge_counter - 1
				end
			end
		end
	end,
	server_ai_spawned_function = function (context, data, spawned_unit)
		local alive_bosses = Managers.state.conflict:alive_bosses()

		if alive_bosses and data.boss_lightning_challenge_counter < #alive_bosses then
			local blackboard = BLACKBOARDS[spawned_unit]
			local breed = blackboard.breed
			local is_boss = breed.boss

			if is_boss then
				data.boss_lightning_challenge[spawned_unit] = true
				data.boss_lightning_challenge_counter = data.boss_lightning_challenge_counter + 1
			end
		end
	end,
	server_players_left_safe_zone = function (context, data)
		data.has_left_safe_zone = true
	end,
	server_update_function = function (context, data, dt, t)
		local game_session = Network.game_session()

		if not data.has_left_safe_zone or game_session == nil then
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

						if Unit.alive(unit) then
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

				if t > last_spawn_time + data.follow_time + data.time_to_explode - 1.5 then
					if not data.charge_played then
						data.charge_played = true

						for i = 1, #data.units do
							local unit = data.units[i]

							if Unit.alive(unit) then
								data.audio_system:play_audio_unit_event("Play_winds_heavens_gamepay_charge", unit)
							end
						end
					end

					local parameter = 100 - math.abs(last_spawn_time + data.follow_time + data.time_to_explode - t) / 1.5 * 100
					local players = Managers.player:players()

					for _, player in pairs(players) do
						Managers.state.network.network_transmit:send_rpc("rpc_client_audio_set_global_parameter", player.peer_id, 6, parameter)
					end
				end
			elseif not data.hit_played and t > last_spawn_time + data.follow_time + data.time_to_explode then
				data.hit_played = true

				for i = 1, #data.units do
					local unit = data.units[i]

					if Unit.alive(unit) then
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

		if last_spawn_time and t > last_spawn_time + spawn_rate then
			template.spawn_lightning_strike_unit(data)

			data.last_spawn_time = t
		elseif last_spawn_time == nil then
			data.last_spawn_time = t + data.initial_spawn_delay - spawn_rate
		end
	end
}

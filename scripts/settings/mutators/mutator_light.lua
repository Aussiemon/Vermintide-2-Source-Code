return {
	description = "weaves_light_mutator_desc",
	display_name = "weaves_light_mutator_name",
	icon = "mutator_icon_light_beacons",
	add_buff = function (data, buffs, buff_system, player_unit)
		local is_server_controlled = true
		local server_buff_id = buff_system:add_buff(player_unit, data.curse_buff_name, player_unit, is_server_controlled)
		buffs[#buffs + 1] = server_buff_id
	end,
	clear_buffs = function (data, buffs, buff_system, player)
		local unit_buff_extension = ScriptUnit.has_extension(player.player_unit, "buff_system")
		local has_buff = unit_buff_extension and unit_buff_extension:has_buff_type(data.curse_buff_name)

		if buffs and has_buff then
			local num_buffs = #buffs
			local server_buff_id = buffs[num_buffs]
			local parameter = (num_buffs - 1) * data.curse_value * -100

			Managers.state.network.network_transmit:send_rpc("rpc_client_audio_set_global_parameter", player.peer_id, 6, parameter)
			buff_system:remove_server_controlled_buff(player.player_unit, server_buff_id)

			buffs[num_buffs] = nil
		end
	end,
	update_challenge_statistics = function (player)
		if ScorpionSeasonalSettings.current_season_id == 1 then
			local stat_group_name = "season_1"
			local stat_name = "weave_light_low_curse"

			if player.local_player then
				local statistics_db = Managers.player:statistics_db()
				local local_player = Managers.player:local_player()
				local stats_id = local_player:stats_id()

				statistics_db:increment_stat(stats_id, stat_group_name, stat_name)
			else
				local stat_group_index = NetworkLookup.statistics_group_name[stat_group_name]
				local stat_name_index = NetworkLookup.statistics[stat_name]
				local peer_id = player:network_id()

				Managers.state.network.network_transmit:send_rpc("rpc_increment_stat_group", peer_id, stat_group_index, stat_name_index)
			end
		end
	end,
	update_curse = function (data, t)
		local template = data.template
		local last_curse_time = data.last_curse_time
		local curse_rate = data.curse_rate

		if last_curse_time and t > last_curse_time + curse_rate then
			data.last_curse_time = t
			local human_players = Managers.player:players()

			for key, player in pairs(human_players) do
				if not data.buffs[key] then
					data.buffs[key] = {}
				end

				local unit_buff_extension = ScriptUnit.has_extension(player.player_unit, "buff_system")
				local has_buff = unit_buff_extension and unit_buff_extension:has_buff_type("mutator_light_cleansing_curse_buff")
				local status_extension = ScriptUnit.has_extension(player.player_unit, "status_system")
				local is_waiting_for_assisted_respawn = status_extension and status_extension.ready_for_assisted_respawn

				if not has_buff and not is_waiting_for_assisted_respawn then
					local buffs = data.buffs[key]

					template.add_buff(data, buffs, data.buff_system, player.player_unit)

					local parameter = #data.buffs[key] * data.curse_value * -100

					if parameter > 10 then
						data.template.update_challenge_statistics(player)
					end

					Managers.state.network.network_transmit:send_rpc("rpc_client_audio_set_global_parameter", player.peer_id, 6, parameter)
				end
			end
		elseif last_curse_time == nil then
			data.last_curse_time = t + 0
		end
	end,
	update_proximity_sound = function (context, data, player, play)
		local network_manager = Managers.state.network
		local my_id = Network.peer_id()

		if not data.players_in_proximity[player.peer_id] and play then
			data.players_in_proximity[player.peer_id] = true

			if player.peer_id ~= my_id then
				local sound_id = NetworkLookup.sound_events.Play_wind_light_beacon_cleanse_loop

				network_manager.network_transmit:send_rpc("rpc_server_audio_event", player.peer_id, sound_id)
			else
				local wwise_world = Managers.world:wwise_world(context.world)

				WwiseWorld.trigger_event(wwise_world, "Play_wind_light_beacon_cleanse_loop")
			end
		elseif data.players_in_proximity[player.peer_id] and not play then
			data.players_in_proximity[player.peer_id] = nil

			if player.peer_id ~= my_id then
				local sound_id = NetworkLookup.sound_events.Stop_wind_light_beacon_cleanse_loop

				network_manager.network_transmit:send_rpc("rpc_server_audio_event", player.peer_id, sound_id)
			else
				local wwise_world = Managers.world:wwise_world(context.world)

				WwiseWorld.trigger_event(wwise_world, "Stop_wind_light_beacon_cleanse_loop")
			end
		end
	end,
	update_beacons = function (context, data, dt, t)
		local last_cleanse_time = data.last_cleanse_time
		local cleanse_rate = data.cleanse_rate

		if last_cleanse_time and t > last_cleanse_time + cleanse_rate then
			data.last_cleanse_time = t
			local human_players = {}

			for key, player in pairs(Managers.player:players()) do
				local new_player = {
					player_unit = player.player_unit,
					peer_id = player.peer_id
				}
				human_players[key] = new_player
			end

			for _, unit in pairs(data.beacons) do
				data.audio_system:play_audio_unit_event("Play_wind_light_beacon_pulse", unit)

				local unit_pos = Unit.local_position(unit, 0)
				local rotation = Unit.local_rotation(unit, 0)
				local area_damage_system = Managers.state.entity:system("area_damage_system")

				area_damage_system:create_explosion(unit, unit_pos, rotation, "light_pulse", 1, "undefined", 0, false)

				for key, player in pairs(human_players) do
					local player_pos = POSITION_LOOKUP[player.player_unit]

					if player_pos then
						local distance_squared = Vector3.distance_squared(unit_pos, player_pos)

						if distance_squared - 6 < data.radius * data.radius then
							player.inside = true
						end
					end
				end
			end

			for key, player in pairs(human_players) do
				if player.inside then
					data.template.clear_buffs(data, data.buffs[key], data.buff_system, player)
					data.template.update_proximity_sound(context, data, player, true)

					human_players[key] = nil
				else
					data.template.update_proximity_sound(context, data, player, false)
				end
			end
		elseif last_cleanse_time == nil then
			data.last_cleanse_time = t + 0
		end
	end,
	server_start_function = function (context, data)
		local weave_manager = Managers.weave
		local wind_settings = weave_manager:get_active_wind_settings()
		local wind_strength = weave_manager:get_wind_strength()
		local objective = weave_manager:get_active_objective_template()
		local difficulty_name = Managers.state.difficulty:get_difficulty()
		data.audio_system = Managers.state.entity:system("audio_system")
		data.radius = wind_settings.radius[difficulty_name][wind_strength]
		data.buff_system = Managers.state.entity:system("buff_system")
		data.curse_rate = wind_settings.curse_settings.curse_rate[difficulty_name][wind_strength]
		data.curse_value = wind_settings.curse_settings.value[difficulty_name]
		data.cleanse_rate = wind_settings.cleanse_rate
		data.beacons = {}
		data.buffs = {}
		data.curse_buff_name = "mutator_light_debuff"
		data.players_in_proximity = {}
		local mutator_item_config = objective.mutator_item_config
		local mutator_item_system = Managers.state.entity:system("mutator_item_system")
		data.beacons = mutator_item_system:spawn_mutator_items(mutator_item_config)
		local human_players = Managers.player:players()

		for k, _ in pairs(human_players) do
			data.buffs[k] = {}
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

		data.template.update_curse(data, t)
		data.template.update_beacons(context, data, dt, t)
	end
}

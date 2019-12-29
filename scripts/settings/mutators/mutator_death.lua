return {
	description = "weaves_death_mutator_desc",
	icon = "mutator_icon_death_spirits",
	display_name = "weaves_death_mutator_name",
	spawn_spirit = function (data, spawn_unit, target_unit)
		local spawn_position = Vector3.add(Unit.local_position(spawn_unit, 0), Vector3(0, 0, data.offset))
		local spirit_unit = data.unit_spawner:spawn_network_unit(data.spirit_unit_name, "position_synched_dummy_unit", data.extension_init_data, spawn_position)
		local spirit = {
			follow_unit = target_unit,
			unit = spirit_unit,
			chase_time = data.chase_time,
			delay_time = data.delay_time
		}
		local spirit_id = data.network_manager:unit_game_object_id(spirit_unit)

		data.audio_system:play_audio_position_event("Play_winds_death_gameplay_spirit_release", spawn_position)
		data.audio_system:play_audio_unit_event("Play_winds_death_gameplay_spirit_loop", spirit_unit)

		data.spirits[spirit_id] = spirit
	end,
	update_spirits = function (context, data, dt, t)
		local spirits = data.spirits
		local hit_distance = 1

		for id, spirit in pairs(spirits) do
			local unit = spirit.unit

			if Unit.alive(unit) then
				if spirit.delay_time == 0 then
					local spirit_position = Unit.local_position(unit, 0)
					local player_unit = spirit.follow_unit
					local player_pos = POSITION_LOOKUP[player_unit]

					if player_pos then
						player_pos = player_pos + Vector3.up()
						local direction = player_pos - spirit_position
						local distance_squared = Vector3.length_squared(direction)
						direction = Vector3.normalize(direction)

						if distance_squared <= hit_distance * hit_distance then
							local health_extension = ScriptUnit.extension(player_unit, "health_system")

							if health_extension then
								local current_health = health_extension:current_permanent_health()

								if current_health > 0 then
									local current_temporary_health = health_extension:current_temporary_health()
									local spirit_damage = data.spirit_damage
									local damage = nil

									if spirit_damage < current_temporary_health + current_health then
										damage = spirit_damage
									else
										damage = current_health - 1
									end

									DamageUtils.add_damage_network(player_unit, unit, damage, "torso", "death_explosion", nil, direction, "undefined")
								end
							end

							local rotation = Unit.world_rotation(unit, 0)
							local area_damage_system = Managers.state.entity:system("area_damage_system")

							area_damage_system:create_explosion(unit, spirit_position, rotation, "death_spirit_bomb", 1, "undefined", 0, false)
							data.audio_system:play_audio_unit_event("Play_winds_death_gameplay_spirit_explode", unit)
							Managers.state.unit_spawner:mark_for_deletion(unit)

							data.spirits[id] = nil

							if ScorpionSeasonalSettings.current_season_id == 1 then
								local stat_group_name = "season_1"
								local stat_name = "weave_death_hit_by_spirit"
								local player = Managers.player:owner(player_unit)

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
						else
							spirit.chase_time = math.max(spirit.chase_time - dt, 0)
							local move_vector = direction * dt * data.chase_speed
							local new_position = spirit_position + move_vector

							Unit.set_local_position(unit, 0, new_position)

							if spirit.chase_time == 0 then
								local rotation = Unit.world_rotation(unit, 0)
								local area_damage_system = Managers.state.entity:system("area_damage_system")

								area_damage_system:create_explosion(unit, spirit_position, rotation, "death_spirit_bomb", 1, "undefined", 0, false)
								data.audio_system:play_audio_unit_event("Play_winds_death_gameplay_spirit_explode", unit)
								Managers.state.unit_spawner:mark_for_deletion(unit)

								data.spirits[id] = nil
							end
						end
					end
				else
					spirit.delay_time = math.max(spirit.delay_time - dt, 0)
				end
			else
				data.spirits[id] = nil
			end
		end
	end,
	update_player_buff = function (context, data)
		local players = Managers.player:players()

		for _, player in pairs(players) do
			if player.player_unit == nil then
				return
			end

			local health_extension = ScriptUnit.extension(player.player_unit, "health_system")
			local current_health_percent = health_extension:current_permanent_health_percent()
			local buff_extension = ScriptUnit.has_extension(player.player_unit, "buff_system")
			local unit_id = data.network_manager:unit_game_object_id(player.player_unit)
			local has_buff = buff_extension:has_buff_type("death_attack_speed_buff")

			if not has_buff then
				if current_health_percent < 0.2 then
					local buff_id = data.buff_system:add_buff(player.player_unit, "mutator_death_attack_speed_player_buff", player.player_unit, true)
					data.player_buffs[unit_id] = buff_id
				end
			elseif current_health_percent >= 0.2 then
				data.buff_system:remove_server_controlled_buff(player.player_unit, data.player_buffs[unit_id])

				data.player_buffs[unit_id] = nil
			end
		end
	end,
	server_ai_hit_by_player_function = function (context, data, hit_unit, attacker_unit, hit_data)
		local is_player_unit = DamageUtils.is_player_unit(attacker_unit)

		if not is_player_unit then
			return
		end

		local breed = Unit.get_data(hit_unit, "breed")

		if breed.boss then
			local network_manager = data.network_manager
			local boss_id = network_manager:unit_game_object_id(hit_unit)

			if not data.boss_drop_timers[boss_id] then
				data.boss_drop_timers[boss_id] = {
					timer = data.boss_drop_cooldown
				}
			end

			if data.boss_drop_cooldown <= data.boss_drop_timers[boss_id].timer then
				data.template.spawn_spirit(data, hit_unit, attacker_unit)

				data.boss_drop_timers[boss_id].timer = 0
			end
		end
	end,
	server_player_hit_function = function (context, data, hit_unit, attacker_unit, hit_data)
		local damage_type = hit_data[2]
		local is_player_unit = DamageUtils.is_player_unit(hit_unit)

		if damage_type == "death_explosion" and is_player_unit then
			local network_manager = data.network_manager
			local heal_type_id = NetworkLookup.heal_types.mutator
			local damage_amount = hit_data[1]
			local unit_go_id = network_manager:unit_game_object_id(hit_unit)

			network_manager.network_transmit:send_rpc_server("rpc_request_heal", unit_go_id, damage_amount, heal_type_id)
		end
	end,
	server_ai_killed_function = function (context, data, killed_unit, killer_unit, death_data)
		local is_player_unit = DamageUtils.is_player_unit(killer_unit)

		if not is_player_unit or not ScriptUnit.has_extension(killer_unit, "status_system") then
			return
		end

		data.template.spawn_spirit(data, killed_unit, killer_unit)
	end,
	server_players_left_safe_zone = function (context, data)
		data.has_left_safe_zone = true
	end,
	server_start_function = function (context, data)
		printf("[Mutator]: mutator_start")

		local weave_manager = Managers.weave
		local wind_settings = weave_manager:get_active_wind_settings()
		local wind_strength = weave_manager:get_wind_strength()
		local difficulty_name = Managers.state.difficulty:get_difficulty()
		data.spirit_damage = wind_settings.spirit_settings.damage[difficulty_name][wind_strength]
		data.delay_time = wind_settings.spirit_settings.wait_time[difficulty_name][wind_strength]
		data.chase_speed = wind_settings.spirit_settings.chase_speed[difficulty_name][wind_strength]
		data.chase_time = wind_settings.spirit_settings.chase_time[difficulty_name][wind_strength]
		data.audio_system = Managers.state.entity:system("audio_system")
		data.network_manager = Managers.state.network
		data.buff_system = Managers.state.entity:system("buff_system")
		data.unit_spawner = Managers.state.unit_spawner
		data.boss_drop_timers = {}
		data.boss_drop_cooldown = 2
		data.player_buffs = {}
		data.spirits = {}
		data.spirit_unit_name = "units/fx/vfx_animation_death_spirit_02"
		data.extension_init_data = {}
		data.offset = 1
		data.num_raycasts = 0
	end,
	server_update_function = function (context, data, dt, t)
		local game_session = Network.game_session()

		if game_session == nil then
			return
		end

		for _, boss in pairs(data.boss_drop_timers) do
			boss.timer = boss.timer + dt
		end

		data.template.update_spirits(context, data, dt, t)
		data.template.update_player_buff(context, data)
	end
}

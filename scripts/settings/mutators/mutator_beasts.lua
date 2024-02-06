-- chunkname: @scripts/settings/mutators/mutator_beasts.lua

return {
	description = "weaves_beasts_mutator_desc",
	display_name = "weaves_beasts_mutator_name",
	icon = "mutator_icon_beast_totems",
	server_level_object_killed_function = function (context, data, killed_unit)
		if Unit.is_a(killed_unit, data.beacon_unit) then
			for i, totem in pairs(data.totems) do
				if killed_unit == totem.unit then
					data.audio_system:play_audio_unit_event("Play_winds_beast_totem_destroy", killed_unit)

					totem.active = false

					data.template.increment_challenge_stat()
				end
			end
		end
	end,
	increment_challenge_stat = function ()
		if ScorpionSeasonalSettings.current_season_id == 1 then
			local stat_group_name = "season_1"
			local stat_name = "weave_beasts_destroyed_totems"
			local stat_group_index = NetworkLookup.statistics_group_name[stat_group_name]
			local stat_name_index = NetworkLookup.statistics[stat_name]
			local statistics_db = Managers.player:statistics_db()
			local local_player = Managers.player:local_player()
			local stats_id = local_player:stats_id()

			statistics_db:increment_stat(stats_id, stat_group_name, stat_name)
			Managers.state.network.network_transmit:send_rpc_clients("rpc_increment_stat_group", stat_group_index, stat_name_index)
		end
	end,
	update_totems = function (context, data, dt, t)
		data.update_timer = data.update_timer + dt

		if data.update_timer > 1 then
			data.update_timer = 0

			local host_player = Managers.player:local_player()
			local host_unit = host_player and host_player.player_unit

			if not host_unit then
				return
			end

			local side = Managers.state.side.side_by_unit[host_unit]
			local enemy_broadphase_categories = side.enemy_broadphase_categories

			for _, totem in ipairs(data.totems) do
				if totem.active then
					table.clear(data.ai_units_broadphase_result)

					local position = POSITION_LOOKUP[totem.unit]
					local num_ai_units = AiUtils.broadphase_query(position, data.radius, data.ai_units_broadphase_result, enemy_broadphase_categories)

					for i = 1, num_ai_units do
						local ai_unit = data.ai_units_broadphase_result[i]
						local buff_extension = ScriptUnit.has_extension(ai_unit, "buff_system")

						if buff_extension and not data.ai_units_inside[ai_unit] then
							data.ai_units_inside[ai_unit] = true
						end
					end
				else
					local weave_manager = Managers.weave
					local objective_template = weave_manager:get_active_objective_template()

					if objective_template and objective_template.allow_mutator_item_respawning then
						totem.respawn_time = totem.respawn_time - 1

						if totem.respawn_time <= 0 then
							totem.active = true
							totem.respawn_time = data.totem_respawn_time

							local position = Unit.local_position(totem.unit, 0)
							local rotation = Unit.local_rotation(totem.unit, 0)
							local unit = Managers.state.unit_spawner:spawn_network_unit(data.unit_name, data.unit_extension_template, data.extension_init_data, position, rotation)

							totem.unit = unit
						end
					end
				end
			end

			local to_remove = {}

			for ai_unit, buff_id in pairs(data.old_ai_units_inside) do
				if (not data.ai_units_inside[ai_unit] or not HEALTH_ALIVE[ai_unit]) and Unit.alive(ai_unit) and data.buff_system:has_server_controlled_buff(ai_unit, buff_id) then
					data.buff_system:remove_server_controlled_buff(ai_unit, buff_id)

					to_remove[#to_remove + 1] = ai_unit
				end
			end

			for i = 1, #to_remove do
				local ai_unit = to_remove[i]

				data.old_ai_units_inside[ai_unit] = nil
			end

			for ai_unit, _ in pairs(data.ai_units_inside) do
				local buff_extension = ScriptUnit.has_extension(ai_unit, "buff_system")

				if buff_extension and not buff_extension:get_non_stacking_buff(data.buff_template_name) and not buff_extension:get_non_stacking_buff("healing_standard") then
					local buff_id = data.buff_system:add_buff(ai_unit, data.buff_template_name, ai_unit, true)

					data.old_ai_units_inside[ai_unit] = buff_id
				end
			end

			table.clear(data.ai_units_inside)
		end
	end,
	server_start_function = function (context, data)
		local weave_manager = Managers.weave
		local objective = weave_manager:get_active_objective_template()
		local difficulty_name = Managers.state.difficulty:get_difficulty()
		local wind_strength = weave_manager:get_wind_strength()
		local wind_settings = weave_manager:get_active_wind_settings()

		data.beacon_unit = wind_settings.beacon_unit
		data.physics_world = World.physics_world(context.world)
		data.audio_system = Managers.state.entity:system("audio_system")
		data.buff_system = Managers.state.entity:system("buff_system")
		data.totems = {}
		data.totem_respawn_time = wind_settings.respawn_rate[difficulty_name][wind_strength]
		data.radius = wind_settings.radius[difficulty_name][wind_strength]
		data.update_timer = 0
		data.ai_units_broadphase_result = {}
		data.ai_units_inside = {}
		data.old_ai_units_inside = {}
		data.unit_name = "units/weave/beasts/beast_totem_mutator"
		data.unit_extension_template = "destructible_objective_unit"
		data.buff_template_name = "mutator_beasts_totem_buff"
		data.extension_init_data = {
			health_system = {
				damage_cap_per_hit = 1,
				health = 5,
			},
			hit_reaction_system = {
				hit_reaction_template = "level_object",
			},
		}

		local mutator_item_config = objective.mutator_item_config
		local mutator_item_system = Managers.state.entity:system("mutator_item_system")
		local units = mutator_item_system:spawn_mutator_items(mutator_item_config)

		for _, unit in pairs(units) do
			data.audio_system:play_audio_unit_event("Play_winds_beast_totem_loop", unit)

			local totem = {
				active = true,
				unit = unit,
				respawn_time = data.totem_respawn_time,
				ai_units_inside = {},
			}

			data.totems[#data.totems + 1] = totem
		end
	end,
	server_players_left_safe_zone = function (context, data)
		data.has_left_safe_zone = true
	end,
	server_update_function = function (context, data, dt, t)
		local game_session = Network.game_session()

		if game_session == nil or not data.has_left_safe_zone then
			return
		end

		data.template.update_totems(context, data, dt, t)
	end,
}

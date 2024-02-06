-- chunkname: @scripts/settings/mutators/mutator_fire.lua

local blacklisted_units = {
	"chaos_corruptor_sorcerer",
	"chaos_vortex_sorcerer",
	"skaven_warpfire_thrower",
	"skaven_poison_wind_globadier",
	"skaven_ratling_gunner",
}

return {
	description = "weaves_fire_mutator_desc",
	display_name = "weaves_fire_mutator_name",
	icon = "mutator_icon_fire_burn",
	server_start_function = function (context, data)
		data.network_manager = Managers.state.network

		local wind_settings = WindSettings.fire
		local weave_manager = Managers.weave
		local wind_strength = weave_manager:get_wind_strength()
		local difficulty_name = Managers.state.difficulty:get_difficulty()

		data.buff_time_player = wind_settings.buff_time_player[difficulty_name][wind_strength]
		data.buff_time_enemy = wind_settings.buff_time_enemy[difficulty_name][wind_strength]
		data.buff_system = Managers.state.entity:system("buff_system")
		data.applied_buffs = {}
		data.buff_name_player = "mutator_fire_player_dot"
		data.buff_name_enemy = "mutator_fire_enemy_dot"
		data.buff_system = Managers.state.entity:system("buff_system")
		data.boss_spawned = {}
		data.boss_spawned_counter = 0
	end,
	client_start_function = function (context, data)
		local weave_manager = Managers.weave
		local wind_settings = weave_manager:get_active_wind_settings()
		local wind_strength = weave_manager:get_wind_strength()
		local difficulty_name = Managers.state.difficulty:get_difficulty()

		data.buff_time_player = wind_settings.buff_time_player[difficulty_name][wind_strength]
		data.buff_name_player = "mutator_fire_player_dot"
		data.buff_name_enemy = "mutator_fire_enemy_dot"
	end,
	update_buffs = function (context, data, dt)
		for id, buff in pairs(data.applied_buffs) do
			buff.duration = buff.duration + dt

			local unit = buff.unit
			local is_dead = not HEALTH_ALIVE[unit]

			if buff.duration > data.buff_time_enemy or is_dead then
				data.template.remove_buff(data, unit, id, is_dead)
			end
		end
	end,
	server_ai_killed_function = function (context, data, killed_unit, killer_unit, death_data, killing_blow_data)
		if data.boss_spawned_counter > 0 then
			local boss_killed = data.boss_spawned[killed_unit]

			if boss_killed then
				data.boss_spawned_counter = data.boss_spawned_counter - 1
				data.boss_spawned[killed_unit] = nil

				if ScorpionSeasonalSettings.current_season_id == 1 then
					local buff_template_name = data.buff_name_enemy
					local buff_extension = ScriptUnit.extension(killed_unit, "buff_system")
					local unit_has_buff = buff_extension:has_buff_type(buff_template_name)
					local wounded_dot = killing_blow_data[DamageDataIndex.DAMAGE_TYPE] == "wounded_dot"

					if unit_has_buff and wounded_dot then
						local stat_group_name = "season_1"
						local stat_name = "scorpion_weaves_fire_season_1"
						local stat_group_index = NetworkLookup.statistics_group_name[stat_group_name]
						local stat_name_index = NetworkLookup.statistics[stat_name]
						local statistics_db = Managers.player:statistics_db()
						local local_player = Managers.player:local_player()
						local stats_id = local_player:stats_id()

						statistics_db:increment_stat(stats_id, stat_group_name, stat_name)
						Managers.state.network.network_transmit:send_rpc_clients("rpc_increment_stat_group", stat_group_index, stat_name_index)
					end
				end
			end
		end
	end,
	apply_buff = function (data, hit_unit, attacker_unit, is_enemy)
		local is_alive = HEALTH_ALIVE[hit_unit]
		local buff_template_name = is_enemy and data.buff_name_enemy or data.buff_name_player
		local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")
		local unit_has_buff = buff_extension:has_buff_type(buff_template_name)

		if is_alive and not unit_has_buff then
			if is_enemy then
				local is_server_controlled = true
				local buff_id = data.buff_system:add_buff(hit_unit, buff_template_name, hit_unit, is_server_controlled)
				local unit_id = data.network_manager:unit_game_object_id(hit_unit)

				data.applied_buffs[unit_id] = {}
				data.applied_buffs[unit_id].buff_id = buff_id
				data.applied_buffs[unit_id].unit = hit_unit
				data.applied_buffs[unit_id].duration = 0
			else
				local duration = data.buff_time_player
				local buff_params = {
					attacker_unit = attacker_unit,
					external_optional_duration = duration,
				}

				buff_extension:add_buff(buff_template_name, buff_params)
			end
		end
	end,
	remove_buff = function (data, unit, id, is_dead)
		if not is_dead then
			data.buff_system:remove_server_controlled_buff(unit, data.applied_buffs[id].buff_id)
		end

		data.applied_buffs[id] = nil
	end,
	unit_has_buff = function (data, unit, buff_name)
		local unit_buff_extension = ScriptUnit.has_extension(unit, "buff_system")
		local unit_has_buff = unit_buff_extension and unit_buff_extension:has_buff_type(buff_name)

		return unit_has_buff
	end,
	check_melee = function (data, hit_data)
		local damage_source = hit_data[DamageDataIndex.DAMAGE_SOURCE_NAME]
		local master_list_item = rawget(ItemMasterList, damage_source)

		if master_list_item then
			local is_melee = master_list_item.slot_type == "melee"

			return is_melee
		else
			local unit_is_banned = table.contains(blacklisted_units, damage_source)

			return not unit_is_banned
		end
	end,
	server_ai_hit_by_player_function = function (context, data, hit_unit, attacker_unit, hit_data)
		if hit_unit ~= attacker_unit then
			local damage_amount = hit_data[DamageDataIndex.DAMAGE_AMOUNT]

			if damage_amount > 0 then
				local is_melee = data.template.check_melee(data, hit_data)
				local wounded_dot = hit_data[DamageDataIndex.DAMAGE_TYPE] == "wounded_dot"
				local pushed = hit_data[DamageDataIndex.DAMAGE_TYPE] == "push"

				if is_melee and not wounded_dot and not pushed then
					local data_template = data.template

					data_template.apply_buff(data, hit_unit, attacker_unit, true)
				end
			end
		end
	end,
	client_player_hit_function = function (context, data, hit_unit, attacker_unit, hit_data)
		if hit_unit ~= attacker_unit then
			local damage_amount = hit_data[DamageDataIndex.DAMAGE_AMOUNT]

			if damage_amount > 0 then
				local wounded_dot = hit_data[DamageDataIndex.DAMAGE_TYPE] == "wounded_dot"
				local is_melee = data.template.check_melee(data, hit_data)

				if is_melee and not wounded_dot then
					data.template.apply_buff(data, hit_unit, attacker_unit, false)
				end
			end
		end
	end,
	server_update_function = function (context, data, dt, t)
		data.template.update_buffs(context, data, dt)
	end,
	server_ai_spawned_function = function (context, data, spawned_unit)
		local alive_bosses = Managers.state.conflict:alive_bosses()

		if alive_bosses and #alive_bosses > data.boss_spawned_counter then
			local blackboard = BLACKBOARDS[spawned_unit]
			local breed = blackboard.breed
			local is_boss = breed.boss

			if is_boss then
				data.boss_spawned[spawned_unit] = true
				data.boss_spawned_counter = data.boss_spawned_counter + 1
			end
		end
	end,
}

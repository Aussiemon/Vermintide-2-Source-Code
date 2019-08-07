local blade_dance_enemies = {
	skaven_ratling_gunner = true,
	skaven_stormfiend = true,
	skaven_storm_vermin_with_shield = true,
	chaos_warrior = true,
	beastmen_bestigor = true,
	skaven_warpfire_thrower = true,
	beastmen_standard_bearer = true,
	skaven_storm_vermin_commander = true,
	skaven_storm_vermin = true,
	skaven_storm_vermin_champion = true
}

return {
	display_name = "weaves_metal_mutator_name",
	description = "weaves_metal_mutator_desc",
	icon = "icon_wind_chamon",
	primary_armor_category = 6,
	modify_primary_armor_category_breeds = {
		"skaven_storm_vermin",
		"skaven_storm_vermin_champion",
		"skaven_storm_vermin_commander",
		"skaven_storm_vermin_with_shield",
		"skaven_stormfiend",
		"skaven_ratling_gunner",
		"skaven_warpfire_thrower",
		"chaos_warrior",
		"beastmen_bestigor",
		"beastmen_standard_bearer"
	},
	server_players_left_safe_zone = function (context, data)
		data.has_left_safe_zone = true
	end,
	server_ai_killed_function = function (context, data, killed_unit, killer_unit)
		local killed_breed = Unit.get_data(killed_unit, "breed")
		local killer_breed = Unit.get_data(killer_unit, "breed")

		if killer_breed and killed_breed and blade_dance_enemies[killed_breed.name] and killer_breed.is_hero then
			if killed_breed.name == "skaven_stormfiend" then
				local human_players = Managers.player:players()

				for key, player in pairs(human_players) do
					local player_unit = player.player_unit

					if AiUtils.unit_alive(player_unit) then
						data.buff_system:add_buff(player_unit, "mutator_metal_blade_dance", player_unit)
					end
				end
			else
				data.buff_system:add_buff(killer_unit, "mutator_metal_blade_dance", killer_unit)
			end
		end
	end,
	server_start_function = function (context, data)
		local weave_manager = Managers.weave
		data.wind_strength = weave_manager:get_wind_strength()
		data.buff_system = Managers.state.entity:system("buff_system")
	end,
	client_start_function = function (context, data)
		data.buff_challenge_counter = 0
		data.player = Managers.player:local_player()
		data.player_unit = nil
		data.unit_buff_extension = nil
		local statistics_db = Managers.player:statistics_db()
		local stats_id = data.player:stats_id()
		data.buff_challenge_result = statistics_db:get_persistent_stat(stats_id, "season_1", "scorpion_weaves_metal_season_1")
	end,
	player_has_metal_buff = function (data, unit)
		if not data.unit_buff_extension then
			data.unit_buff_extension = ScriptUnit.has_extension(unit, "buff_system")
		end

		local has_buff = data.unit_buff_extension and data.unit_buff_extension:has_buff_type("mutator_metal_blade_dance")

		return has_buff
	end,
	server_update_function = function (context, data, dt, t)
		if not data.has_left_safe_zone then
			return
		end
	end,
	client_update_function = function (context, data, dt, t)
		if data.buff_challenge_result < 1 then
			if not data.player_unit then
				data.player_unit = data.player.player_unit
			end

			local has_buff = data.template.player_has_metal_buff(data, data.player_unit)

			if has_buff then
				data.buff_challenge_counter = data.buff_challenge_counter + dt

				if QuestSettings.bladestorm_duration <= data.buff_challenge_counter then
					local statistics_db = Managers.player:statistics_db()
					local stats_id = data.player:stats_id()

					statistics_db:set_stat(stats_id, "season_1", "scorpion_weaves_metal_season_1", 1)

					data.buff_challenge_result = 1
				end
			else
				data.buff_challenge_counter = 0
			end
		end
	end
}

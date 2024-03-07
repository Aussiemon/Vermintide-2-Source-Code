-- chunkname: @scripts/managers/backend/statistics_util.lua

local Unit_alive = Unit.alive
local Unit_get_data = Unit.get_data

StatisticsUtil = {}

local StatisticsUtil = StatisticsUtil
local _tracked_weapon_kill_stats = {
	we_1h_axe = {
		"holly",
	},
	bw_1h_crowbill = {
		"holly",
	},
	wh_dual_wield_axe_falchion = {
		"holly",
	},
	dr_dual_wield_hammers = {
		"holly",
	},
	es_dual_wield_hammer_sword = {
		"holly",
	},
	bw_1h_flail_flaming = {
		"scorpion",
	},
	dr_1h_throwing_axes = {
		"scorpion",
	},
	we_1h_spears_shield = {
		"scorpion",
	},
	es_2h_heavy_spear = {
		"scorpion",
	},
	wh_2h_billhook = {
		"scorpion",
	},
}

DLCUtils.dofile_list("statistics_util")

StatisticsUtil.generate_weapon_kill_stats_dlc = function (stat_player, dlc_name, template)
	for weapon_name, dlcs in pairs(_tracked_weapon_kill_stats) do
		if table.contains(dlcs, dlc_name) then
			local entry = table.clone(template)
			local stat_name = dlc_name .. "_kills_" .. weapon_name

			entry.database_name = stat_name
			stat_player[stat_name] = entry
		end
	end
end

local function _track_weapon_kill_stats(statistics_db, stats_id, weapon_item)
	local weapon_name = weapon_item.name
	local weapon_stats_dlcs = _tracked_weapon_kill_stats[weapon_name]
	local rarity = weapon_item.rarity

	if rarity == "magic" then
		local base_weapon_name = weapon_item.required_unlock_item

		weapon_stats_dlcs = _tracked_weapon_kill_stats[base_weapon_name]
		weapon_name = base_weapon_name
	end

	if weapon_stats_dlcs then
		local dlc_manager = Managers.unlock

		for dlc_id = 1, #weapon_stats_dlcs do
			local dlc_name = weapon_stats_dlcs[dlc_id]

			if dlc_manager:is_dlc_unlocked(dlc_name) then
				statistics_db:increment_stat(stats_id, dlc_name .. "_kills_" .. weapon_name)
			end
		end
	end
end

DLCUtils.merge("_tracked_weapon_kill_stats", _tracked_weapon_kill_stats)

local _tracked_levels_complted_w_weapons_levels = {
	warcamp = {
		"scorpion",
	},
	skaven_stronghold = {
		"scorpion",
	},
	ground_zero = {
		"scorpion",
	},
	skittergate = {
		"scorpion",
	},
}
local _tracked_levels_complted_w_weapons_weapons = {
	bw_1h_flail_flaming = {
		"scorpion",
	},
	dr_1h_throwing_axes = {
		"scorpion",
	},
	we_1h_spears_shield = {
		"scorpion",
	},
	es_2h_heavy_spear = {
		"scorpion",
	},
	wh_2h_billhook = {
		"scorpion",
	},
}

StatisticsUtil.generate_level_complete_with_weapon_stats_dlc = function (stat_player, dlc_name, template)
	for level_name, level_dlcs in pairs(_tracked_levels_complted_w_weapons_levels) do
		if table.contains(level_dlcs, dlc_name) then
			for weapon_name, weapon_dlcs in pairs(_tracked_levels_complted_w_weapons_weapons) do
				if table.contains(weapon_dlcs, dlc_name) then
					local entry = table.clone(template)
					local stat_name = dlc_name .. "_" .. level_name .. "_" .. weapon_name

					entry.database_name = stat_name
					stat_player[stat_name] = entry
				end
			end
		end
	end
end

local function _track_level_complete_with_weapon_stats(statistics_db, stats_id, level, weapon_name, difficulty)
	local difficulty_settings = DifficultySettings[difficulty]

	if not difficulty_settings then
		return
	end

	local is_level_tracked = level and _tracked_levels_complted_w_weapons_levels[level]

	if is_level_tracked then
		local weapon_stats_dlcs = weapon_name and _tracked_levels_complted_w_weapons_weapons[weapon_name]

		if weapon_stats_dlcs then
			local dlc_manager = Managers.unlock

			for dlc_id = 1, #weapon_stats_dlcs do
				local dlc_name = weapon_stats_dlcs[dlc_id]

				if dlc_manager:is_dlc_unlocked(dlc_name) then
					local stat_name = dlc_name .. "_" .. level .. "_" .. weapon_name
					local current_difficulty = statistics_db:get_persistent_stat(stats_id, stat_name)

					if current_difficulty < difficulty_settings.rank then
						statistics_db:set_stat(stats_id, stat_name, difficulty_settings.rank)
					end
				end
			end
		end
	end
end

StatisticsUtil.register_kill = function (victim_unit, damage_data, statistics_db, is_server)
	local victim_health_extension = ScriptUnit.has_extension(victim_unit, "health_system")
	local victim_damage_data = victim_health_extension.last_damage_data

	if not victim_damage_data then
		return
	end

	local player_manager = Managers.player
	local victim_player = player_manager:owner(victim_unit)
	local breed_killed = Unit_get_data(victim_unit, "breed")
	local breed_killed_name = breed_killed and breed_killed.name
	local breed_attacker = victim_damage_data.breed
	local attacker_side = victim_damage_data.attacker_side
	local attacker_unique_id = victim_damage_data.attacker_unique_id
	local attacker_player = player_manager:player_from_unique_id(attacker_unique_id)

	if attacker_player and attacker_player ~= victim_player then
		local stats_id = attacker_player:stats_id()

		statistics_db:increment_stat(stats_id, "kills_total")

		if breed_killed then
			Managers.state.achievement:trigger_event("register_kill", stats_id, victim_unit, damage_data, breed_killed)

			local breed_killed_name = breed_killed.name
			local killed_race_name = breed_killed.race
			local victim_side = Managers.state.side.side_by_unit[victim_unit]

			if Breeds[breed_killed_name] or PlayerBreeds[breed_killed_name] and Managers.state.side:is_enemy_by_side(attacker_side, victim_side) then
				statistics_db:increment_stat(stats_id, "kills_per_breed", breed_killed_name)

				local local_player = Managers.player:local_player()

				if victim_player and attacker_player == local_player then
					Managers.state.event:trigger("add_player_kill_confirmation", attacker_side:name(), victim_player)
				end
			end

			if killed_race_name then
				statistics_db:increment_stat(stats_id, "kills_per_race", killed_race_name)

				if killed_race_name == "critter" then
					local human_players = Managers.player:human_players()

					for _, player in pairs(human_players) do
						local id = player:stats_id()

						if id then
							statistics_db:increment_stat(id, "kills_critter_total")
						end
					end
				end
			end

			local damage_source = damage_data[DamageDataIndex.DAMAGE_SOURCE_NAME]
			local master_list_item = rawget(ItemMasterList, damage_source)

			if master_list_item then
				local slot_type = master_list_item.slot_type
				local attack_type = damage_data[DamageDataIndex.ATTACK_TYPE]

				if attack_type then
					slot_type = (attack_type == "heavy_attack" or attack_type == "light_attack") and "melee" or "ranged"
				end

				if not slot_type then
					local weapon_template_name = master_list_item.template

					if weapon_template_name then
						local weapon_template = Weapons[weapon_template_name]
						local buff_type = weapon_template and weapon_template.buff_type

						if MeleeBuffTypes[buff_type] then
							slot_type = "melee"
						elseif RangedBuffTypes[buff_type] then
							slot_type = "ranged"
						end
					end
				end

				if slot_type == "melee" then
					statistics_db:increment_stat(stats_id, "kills_melee")
				elseif slot_type == "ranged" then
					statistics_db:increment_stat(stats_id, "kills_ranged")
				end

				_track_weapon_kill_stats(statistics_db, stats_id, master_list_item)
			end
		end
	end

	if breed_killed and breed_attacker and breed_killed.awards_positive_reinforcement_message then
		local positive_reinforcement_check = Managers.state.game_mode:setting("positive_reinforcement_check")
		local predicate = "killed_special"

		if not positive_reinforcement_check or positive_reinforcement_check(predicate, breed_attacker, breed_killed) then
			local breed_attacker_name = breed_attacker.name
			local local_human = false
			local stats_id = ""

			if attacker_player then
				local_human = attacker_player.local_player
				stats_id = attacker_player:stats_id()
			end

			local hash = stats_id .. (breed_killed.killfeed_fold_with or breed_killed_name)

			Managers.state.event:trigger("add_coop_feedback_kill", hash, local_human, predicate, breed_attacker_name, breed_killed_name, attacker_player, victim_player)
		end
	end

	if breed_killed and (breed_killed.elite or breed_killed.boss) then
		local victim_side = Managers.state.side.side_by_unit[victim_unit]

		if attacker_side and attacker_side ~= victim_side then
			local party = attacker_side.party
			local occupied_slots = party.occupied_slots

			for _, player_status in ipairs(occupied_slots) do
				local player = player_status.player

				if player ~= attacker_player then
					local stats_id = player:stats_id()

					if statistics_db:is_registered(stats_id) then
						statistics_db:increment_stat(stats_id, "kill_assists_per_breed", breed_killed_name)
					end
				end
			end
		end
	end
end

StatisticsUtil.register_knockdown = function (victim_unit, damage_data, statistics_db, is_server)
	local victim_health_extension = ScriptUnit.has_extension(victim_unit, "health_system")
	local victim_damage_data = victim_health_extension.last_damage_data

	if not victim_damage_data then
		return
	end

	local player_manager = Managers.player
	local victim_player = player_manager:owner(victim_unit)
	local breed_killed = Unit_get_data(victim_unit, "breed")
	local breed_attacker = victim_damage_data.breed
	local attacker_unique_id = victim_damage_data.attacker_unique_id
	local attacker_player = player_manager:player_from_unique_id(attacker_unique_id)

	if breed_killed and breed_attacker then
		local print_message = breed_killed.awards_positive_reinforcement_message

		if print_message then
			local breed_attacker_name = breed_attacker.name
			local breed_killed_name = breed_killed.name
			local predicate = "player_knocked_down"
			local local_human = false
			local stats_id = ""

			if attacker_player then
				local_human = attacker_player.local_player
				stats_id = attacker_player:stats_id()
			end

			Managers.state.event:trigger("add_coop_feedback_kill", stats_id .. breed_killed_name, local_human, predicate, breed_attacker_name, breed_killed_name)

			local local_player = Managers.player:local_player()

			if victim_player and attacker_player == local_player then
				Managers.state.event:trigger("add_player_knock_confirmation", victim_player)
			end
		end
	end
end

StatisticsUtil.check_save = function (savior_unit, enemy_unit)
	local blackboard = BLACKBOARDS[enemy_unit]
	local saved_unit = blackboard.target_unit
	local player_manager = Managers.player

	if not savior_unit or not saved_unit then
		return
	end

	local savior_is_player = player_manager:is_player_unit(savior_unit)
	local saved_is_player = player_manager:is_player_unit(saved_unit)

	if not savior_is_player or not saved_is_player then
		return
	end

	local savior_player = player_manager:owner(savior_unit)
	local saved_player = player_manager:owner(saved_unit)

	if savior_player == saved_player then
		return
	end

	local saved_unit_dir
	local network_manager = Managers.state.network
	local game = network_manager:game()
	local game_object_id = game and network_manager:unit_game_object_id(saved_unit)

	if game_object_id then
		saved_unit_dir = Vector3.normalize(Vector3.flat(GameSession.game_object_field(game, game_object_id, "aim_direction")))
	else
		saved_unit_dir = Quaternion.forward(Unit.local_rotation(saved_unit, 0))
	end

	local enemy_unit_dir = Quaternion.forward(Unit.local_rotation(enemy_unit, 0))
	local saved_unit_pos = POSITION_LOOKUP[saved_unit]
	local enemy_unit_pos = POSITION_LOOKUP[enemy_unit]
	local attack_dir = saved_unit_pos - enemy_unit_pos
	local is_behind = Vector3.distance(saved_unit_pos, enemy_unit_pos) < 3 and Vector3.dot(attack_dir, saved_unit_dir) > 0 and Vector3.dot(attack_dir, enemy_unit_dir) > 0
	local status_ext = ScriptUnit.extension(saved_unit, "status_system")
	local grabber_unit = status_ext:get_pouncer_unit() or status_ext:get_pack_master_grabber()
	local is_disabled = status_ext:is_disabled()
	local predicate
	local statistics_db = player_manager:statistics_db()
	local savior_player_stats_id = savior_player:stats_id()

	if enemy_unit == grabber_unit then
		predicate = "save"

		statistics_db:increment_stat(savior_player_stats_id, "saves")
	elseif is_behind or is_disabled then
		predicate = "aid"

		statistics_db:increment_stat(savior_player_stats_id, "aidings")
	end

	if predicate then
		local local_human = not savior_player.remote and not savior_player.bot_player

		Managers.state.event:trigger("add_coop_feedback", savior_player_stats_id .. saved_player:stats_id(), local_human, predicate, savior_player, saved_player)

		local buff_extension = ScriptUnit.extension(saved_unit, "buff_system")

		buff_extension:trigger_procs("on_assisted", savior_unit, enemy_unit)

		local savior_buff_extension = ScriptUnit.extension(savior_unit, "buff_system")

		savior_buff_extension:trigger_procs("on_assisted_ally", saved_unit, enemy_unit)

		local network_transmit = Managers.state.network.network_transmit
		local savior_player_id = savior_player:network_id()
		local savior_local_player_id = savior_player:local_player_id()
		local saved_player_id = saved_player:network_id()
		local saved_local_player_id = saved_player:local_player_id()
		local predicate_id = NetworkLookup.coop_feedback[predicate]
		local enemy_unit_id = network_manager:unit_game_object_id(enemy_unit)

		network_transmit:send_rpc_clients("rpc_assist", savior_player_id, savior_local_player_id, saved_player_id, saved_local_player_id, predicate_id, enemy_unit_id)
	end
end

StatisticsUtil.register_pull_up = function (puller_up_unit, pulled_up_unit, statistics_db)
	local player_manager = Managers.player
	local player1 = player_manager:owner(puller_up_unit)
	local player2 = player_manager:owner(pulled_up_unit)

	if player1 and player2 then
		local predicate = "assisted_respawn"
		local local_human = not player1.remote and not player1.bot_player

		Managers.state.event:trigger("add_coop_feedback", player1:stats_id() .. player2:stats_id(), local_human, predicate, player1, player2)
	end
end

StatisticsUtil.register_assisted_respawn = function (reviver_unit, revivee_unit, statistics_db)
	local player_manager = Managers.player
	local player1 = player_manager:owner(reviver_unit)
	local player2 = player_manager:owner(revivee_unit)

	if player1 and player2 then
		local predicate = "assisted_respawn"
		local local_human = not player1.remote and not player1.bot_player

		Managers.state.event:trigger("add_coop_feedback", player1:stats_id() .. player2:stats_id(), local_human, predicate, player1, player2)
	end
end

StatisticsUtil.register_revive = function (reviver_unit, revivee_unit, statistics_db)
	local player_manager = Managers.player
	local player1 = player_manager:owner(reviver_unit)

	if player1 then
		local stats_id = player1:stats_id()

		statistics_db:increment_stat(stats_id, "revives")
	end

	local player2 = player_manager:owner(revivee_unit)

	if player2 then
		local stats_id = player2:stats_id()

		statistics_db:increment_stat(stats_id, "times_revived")
	end

	if player1 and player2 then
		local predicate = "revive"
		local local_human = not player1.remote and not player1.bot_player

		Managers.state.event:trigger("add_coop_feedback", player1:stats_id() .. player2:stats_id(), local_human, predicate, player1, player2)
		Managers.state.achievement:trigger_event("register_revive", reviver_unit, revivee_unit)
	end
end

StatisticsUtil.register_heal = function (healer_unit, healed_unit, statistics_db)
	local player_manager = Managers.player
	local player1 = player_manager:owner(healer_unit)
	local player2 = player_manager:owner(healed_unit)

	if player1 and player2 and player1 ~= player2 then
		local predicate = "heal"
		local local_human = not player1.remote and not player1.bot_player

		Managers.state.event:trigger("add_coop_feedback", player1:stats_id() .. player2:stats_id(), local_human, predicate, player1, player2)

		local stats_id = player1:stats_id()

		statistics_db:increment_stat(stats_id, "times_friend_healed")
	end
end

StatisticsUtil.register_damage = function (victim_unit, damage_data, statistics_db)
	local damage_amount = damage_data[DamageDataIndex.DAMAGE_AMOUNT]
	local damage_source_name = damage_data[DamageDataIndex.DAMAGE_SOURCE_NAME]
	local player_manager = Managers.player
	local victim_player = player_manager:owner(victim_unit)

	if victim_player then
		local stats_id = victim_player:stats_id()

		statistics_db:modify_stat_by_amount(stats_id, "damage_taken", damage_amount)

		local health_extension = ScriptUnit.extension(victim_unit, "health_system")
		local current_health = health_extension:current_health()
		local max_health = health_extension:get_max_health()
		local current_health_percentage = (current_health - damage_amount) / max_health
		local career_extension = ScriptUnit.extension(victim_unit, "career_system")
		local career_name = career_extension:career_name()
		local breed = career_extension:get_breed()

		if breed.is_hero then
			Managers.state.achievement:trigger_event("register_damage_taken", victim_unit, damage_data)

			local min_health = statistics_db:get_stat(stats_id, "min_health_percentage", career_name)

			if current_health_percentage < min_health then
				statistics_db:set_stat(stats_id, "min_health_percentage", career_name, current_health_percentage)
			end
		end
	end

	local attacker_unit = damage_data[DamageDataIndex.ATTACKER]
	local source_attacker_unit = damage_data[DamageDataIndex.SOURCE_ATTACKER_UNIT]

	attacker_unit = AiUtils.get_actual_attacker_unit(attacker_unit)

	local attacker_player = player_manager:owner(attacker_unit) or player_manager:owner(source_attacker_unit)

	if attacker_player then
		local target_breed = Unit_alive(victim_unit) and Unit_get_data(victim_unit, "breed")

		if target_breed then
			local breed_name = target_breed.name
			local health_extension = ScriptUnit.extension(victim_unit, "health_system")
			local current_health = health_extension:current_health()

			if current_health > 0 then
				local stats_id = attacker_player:stats_id()

				Managers.state.achievement:trigger_event("register_damage", stats_id, victim_unit, damage_data, attacker_unit, target_breed)

				damage_amount = math.clamp(damage_amount, 0, current_health)

				statistics_db:modify_stat_by_amount(stats_id, "damage_dealt", damage_amount)

				if Breeds[breed_name] or PlayerBreeds[breed_name] and Managers.state.side:is_enemy(attacker_unit, victim_unit) then
					statistics_db:modify_stat_by_amount(stats_id, "damage_dealt_per_breed", breed_name, damage_amount)
				end

				local hit_zone = damage_data[DamageDataIndex.HIT_ZONE]

				if hit_zone == "head" then
					statistics_db:increment_stat(stats_id, "headshots")
				end

				local is_enemy, attacker_side = Managers.state.side:is_enemy(attacker_unit, victim_unit)

				if is_enemy and attacker_side:name() == "heroes" and Managers.mechanism:current_mechanism_name() == "versus" then
					statistics_db:modify_stat_by_amount(stats_id, "vs_damage_dealt_to_pactsworn", damage_amount)
				end

				if target_breed.is_player and is_enemy and attacker_side.show_damage_feedback and HEALTH_ALIVE[victim_unit] then
					local target_player = player_manager:owner(victim_unit)
					local local_human = not attacker_player.remote and not attacker_player.bot_player
					local event_type = local_human and "dealing_damage" or "other_dealing_damage"
					local profile_index = target_player:profile_index()
					local damage_type = damage_data[DamageDataIndex.DAMAGE_TYPE]

					Managers.state.event:trigger("add_damage_feedback_event", stats_id .. breed_name, local_human, event_type, attacker_player, target_player, damage_amount, damage_type)
				end
			end
		end
	end

	if damage_source_name == "skaven_ratling_gunner" and victim_player then
		local stats_id = victim_player:stats_id()

		statistics_db:modify_stat_by_amount(stats_id, "damage_taken_from_ratling_gunner", damage_amount)
	end
end

StatisticsUtil.won_games = function (statistics_db)
	local local_player = Managers.player:local_player()
	local stats_id = local_player:stats_id()
	local completed = 0

	for _, level_name in ipairs(UnlockableLevels) do
		completed = completed + statistics_db:get_persistent_stat(stats_id, "completed_levels", level_name)
	end

	return completed
end

StatisticsUtil.register_collected_grimoires = function (collected_grimoires, statistics_db)
	local local_player = Managers.player:local_player()
	local stats_id = local_player:stats_id()

	for i = 1, collected_grimoires do
		statistics_db:increment_stat(stats_id, "total_collected_grimoires")
	end

	local level_settings = LevelHelper:current_level_settings()
	local level_id = level_settings.level_id

	if not table.find(UnlockableLevels, level_id) then
		return
	end

	local current_collected_grimoires = statistics_db:get_persistent_stat(stats_id, "collected_grimoires", level_id)

	if current_collected_grimoires < collected_grimoires then
		statistics_db:set_stat(stats_id, "collected_grimoires", level_id, collected_grimoires)
	end
end

StatisticsUtil.register_collected_tomes = function (collected_tomes, statistics_db)
	local local_player = Managers.player:local_player()
	local stats_id = local_player:stats_id()

	for i = 1, collected_tomes do
		statistics_db:increment_stat(stats_id, "total_collected_tomes")
	end

	local level_settings = LevelHelper:current_level_settings()
	local level_id = level_settings.level_id

	if not table.find(UnlockableLevels, level_id) then
		return
	end

	local current_collected_tomes = statistics_db:get_persistent_stat(stats_id, "collected_tomes", level_id)

	if current_collected_tomes < collected_tomes then
		statistics_db:set_stat(stats_id, "collected_tomes", level_id, collected_tomes)
	end
end

StatisticsUtil.register_collected_dice = function (collected_dice, statistics_db)
	local local_player = Managers.player:local_player()
	local stats_id = local_player:stats_id()

	for i = 1, collected_dice do
		statistics_db:increment_stat(stats_id, "total_collected_dice")
	end

	local level_settings = LevelHelper:current_level_settings()
	local level_id = level_settings.level_id

	if not table.find(UnlockableLevels, level_id) then
		return
	end

	local current_collected_dice = statistics_db:get_persistent_stat(stats_id, "collected_dice", level_id)

	if current_collected_dice < collected_dice then
		statistics_db:set_stat(stats_id, "collected_dice", level_id, collected_dice)
	end
end

StatisticsUtil.register_complete_level = function (statistics_db)
	local level_settings = LevelHelper:current_level_settings()
	local level_id = level_settings.level_id

	if not table.find(UnlockableLevels, level_id) then
		return
	end

	local game_mode_key = Managers.state.game_mode:game_mode_key()
	local local_player = Managers.player:local_player()
	local stats_id = local_player:stats_id()
	local profile, display_name

	if game_mode_key == "versus" then
		local local_player_status = Managers.party:get_status_from_unique_id(stats_id)
		local selected_profile_index = local_player_status.preferred_profile_index

		if not selected_profile_index then
			return
		end

		profile = SPProfiles[selected_profile_index]
		display_name = profile.display_name
	else
		local profile_index = local_player:profile_index()

		profile = SPProfiles[profile_index]
		display_name = profile.display_name
	end

	statistics_db:increment_stat(stats_id, "completed_levels_" .. display_name, level_id)

	local mission_system = Managers.state.entity:system("mission_system")
	local grimoire_mission_data = mission_system:get_level_end_mission_data("grimoire_hidden_mission")
	local tome_mission_data = mission_system:get_level_end_mission_data("tome_bonus_mission")
	local dice_mission_data = mission_system:get_level_end_mission_data("bonus_dice_hidden_mission")

	if grimoire_mission_data then
		StatisticsUtil.register_collected_grimoires(grimoire_mission_data.current_amount, statistics_db)
	end

	if tome_mission_data then
		StatisticsUtil.register_collected_tomes(tome_mission_data.current_amount, statistics_db)
	end

	if dice_mission_data then
		StatisticsUtil.register_collected_dice(dice_mission_data.current_amount, statistics_db)
	end

	statistics_db:increment_stat(stats_id, "completed_levels", level_id)

	if Managers.deed and Managers.deed:has_deed() then
		statistics_db:increment_stat(stats_id, "completed_heroic_deeds")
	end

	local difficulty_manager = Managers.state.difficulty
	local difficulty_name = difficulty_manager:get_difficulty()
	local career_index = local_player:career_index()
	local career_data = profile.careers[career_index]
	local career_name = career_data.name

	StatisticsUtil._register_completed_level_difficulty(statistics_db, level_id, career_name, difficulty_name)

	local item_interface = Managers.backend:get_interface("items")
	local melee_backend_id = BackendUtils.get_loadout_item_id(career_name, "slot_melee")
	local melee_item_name = melee_backend_id and item_interface:get_item_name(melee_backend_id)
	local ranged_backend_id = BackendUtils.get_loadout_item_id(career_name, "slot_ranged")
	local ranged_item_name = ranged_backend_id and item_interface:get_item_name(ranged_backend_id)

	_track_level_complete_with_weapon_stats(statistics_db, stats_id, level_id, melee_item_name, difficulty_name)
	_track_level_complete_with_weapon_stats(statistics_db, stats_id, level_id, ranged_item_name, difficulty_name)

	if Managers.unlock:is_dlc_unlocked("holly") then
		local min_difficulty_rank = DifficultySettings.hardest.rank
		local completed_difficulty_rank = DifficultySettings[difficulty_name] and DifficultySettings[difficulty_name].rank or 0
		local above_legend_difficulty = min_difficulty_rank <= completed_difficulty_rank
		local is_lord_level = level_id == "ground_zero" or level_id == "warcamp" or level_id == "skaven_stronghold" or level_id == "skittergate"

		if above_legend_difficulty and is_lord_level then
			local weapon_names = {
				"we_1h_axe",
				"bw_1h_crowbill",
				"wh_dual_wield_axe_falchion",
				"dr_dual_wield_hammers",
				"es_dual_wield_hammer_sword",
			}
			local weapon_name

			if table.contains(weapon_names, melee_item_name) then
				weapon_name = melee_item_name
			elseif table.contains(weapon_names, ranged_item_name) then
				weapon_name = ranged_item_name
			end

			if weapon_name then
				local stat_name = "holly_completed_level_" .. level_id .. "_with_" .. weapon_name

				statistics_db:increment_stat(stats_id, stat_name)
			end
		end
	end
end

StatisticsUtil.register_weave_complete = function (statistics_db, player, is_quick_game, difficulty_key)
	local stats_id = player:stats_id()
	local weave_manager = Managers.weave
	local weave_tier = weave_manager:get_weave_tier()
	local weave_name = weave_manager:get_active_weave()
	local wind = weave_manager:get_active_wind()
	local score = weave_manager:get_score()
	local num_players = weave_manager:get_num_players()
	local profile_index = player:profile_index()
	local profile = SPProfiles[profile_index]
	local career_index = player:career_index()
	local career_data = profile.careers[career_index]
	local career_name = career_data.name
	local completed_percentage = statistics_db:get_stat(stats_id, "min_health_percentage", career_name)
	local highest_completed_percentage = statistics_db:get_persistent_stat(stats_id, "min_health_completed", career_name)

	if highest_completed_percentage and completed_percentage and highest_completed_percentage <= completed_percentage then
		statistics_db:set_stat(stats_id, "min_health_completed", career_name, completed_percentage)
	end

	if is_quick_game then
		local weave_quickplay_wins_stat_name = "weave_quickplay_wins"

		statistics_db:increment_stat(stats_id, ScorpionSeasonalSettings.current_season_name, weave_quickplay_wins_stat_name)
		statistics_db:increment_stat(stats_id, "scorpion_weaves_won")

		if ScorpionSeasonalSettings.current_season_id == 1 or not IS_WINDOWS then
			local weave_quickplay_wins_difficulty_stat_name = "weave_quickplay_" .. difficulty_key .. "_wins"

			statistics_db:increment_stat(stats_id, "season_1", weave_quickplay_wins_difficulty_stat_name)
		end
	else
		if ScorpionSeasonalSettings.current_season_id == 1 or not IS_WINDOWS then
			local rainbow_stat_name = "weave_rainbow_" .. wind .. "_" .. career_name .. "_season_1"

			statistics_db:set_stat(stats_id, "season_1", rainbow_stat_name, 1)

			local career_stat_name = "weaves_complete_" .. career_name .. "_season_1"

			statistics_db:increment_stat(stats_id, "season_1", career_stat_name)
			StatisticsUtil._register_mutator_challenges(statistics_db, stats_id, wind)
			statistics_db:increment_stat(stats_id, "season_1", "weave_won", weave_tier)
		end

		statistics_db:increment_stat(stats_id, "completed_weaves", weave_name)
		statistics_db:increment_stat(stats_id, "scorpion_weaves_won")

		local stat_name = ScorpionSeasonalSettings.get_weave_score_stat(weave_tier, num_players)
		local value = statistics_db:get_persistent_stat(stats_id, ScorpionSeasonalSettings.current_season_name, stat_name)

		if value < score then
			statistics_db:set_stat(stats_id, ScorpionSeasonalSettings.current_season_name, stat_name, score)
		end
	end
end

StatisticsUtil._register_mutator_challenges = function (statistics_db, stats_id, wind)
	if ScorpionSeasonalSettings.current_season_id == 1 or not IS_WINDOWS then
		if wind == "life" then
			local life_stat_id = "weave_life_stepped_in_bush"
			local result = statistics_db:get_persistent_stat(stats_id, "season_1", life_stat_id)

			if result == 0 then
				local id = "scorpion_weaves_life_season_1"

				statistics_db:increment_stat(stats_id, "season_1", id)
			end
		elseif wind == "death" then
			local death_stat_id = "weave_death_hit_by_spirit"
			local result = statistics_db:get_persistent_stat(stats_id, "season_1", death_stat_id)

			if result == 0 then
				local id = "scorpion_weaves_death_season_1"

				statistics_db:increment_stat(stats_id, "season_1", id)
			end
		elseif wind == "beasts" then
			local beasts_stat_id = "weave_beasts_destroyed_totems"
			local result = statistics_db:get_persistent_stat(stats_id, "season_1", beasts_stat_id)

			if result == 0 then
				local id = "scorpion_weaves_beasts_season_1"

				statistics_db:increment_stat(stats_id, "season_1", id)
			end
		elseif wind == "light" then
			local beasts_stat_id = "weave_light_low_curse"
			local result = statistics_db:get_persistent_stat(stats_id, "season_1", beasts_stat_id)

			if result == 0 then
				local id = "scorpion_weaves_light_season_1"

				statistics_db:increment_stat(stats_id, "season_1", id)
			end
		elseif wind == "shadow" then
			local beasts_stat_id = "weave_shadow_kill_no_shrouded"
			local result = statistics_db:get_persistent_stat(stats_id, "season_1", beasts_stat_id)

			if result == 0 then
				local id = "scorpion_weaves_shadow_season_1"

				statistics_db:increment_stat(stats_id, "season_1", id)
			end
		end
	end
end

StatisticsUtil.register_journey_complete = function (statistics_db, player, journey_name, dominant_god, difficulty_name)
	StatisticsUtil._register_completed_journey_difficulty(statistics_db, player, journey_name, dominant_god, difficulty_name)
end

StatisticsUtil.register_complete_tutorial = function (statistics_db)
	local level_settings = LevelHelper:current_level_settings()
	local local_player = Managers.player:local_player()
	local stats_id = local_player:stats_id()
	local level_id = level_settings.level_id

	statistics_db:increment_stat(stats_id, "completed_levels", level_id)
end

StatisticsUtil.register_played_quickplay_level = function (statistics_db, player, level_key)
	if not table.find(UnlockableLevels, level_key) then
		return
	end

	statistics_db:increment_stat(player:stats_id(), "played_levels_quickplay", level_key)
	StatisticsUtil.register_last_played_level_id(statistics_db, player, level_key)
end

StatisticsUtil.register_played_weekly_event_level = function (statistics_db, player, level_key, difficulty_key)
	if not table.find(UnlockableLevels, level_key) then
		return
	end

	local stats_id = player:stats_id()

	statistics_db:increment_stat(stats_id, "played_levels_weekly_event", level_key)

	local difficulty_manager = Managers.state.difficulty
	local difficulty_name = difficulty_manager:get_difficulty()

	statistics_db:increment_stat(stats_id, "completed_weekly_event_difficulty", difficulty_name)
end

StatisticsUtil.register_last_played_level_id = function (statistics_db, player, level_key)
	local unlockable_level_id = table.find(UnlockableLevels, level_key)

	if unlockable_level_id then
		statistics_db:set_stat(player:stats_id(), "last_played_level_id", unlockable_level_id)
	end
end

StatisticsUtil.get_game_progress = function (statistics_db)
	local local_player = Managers.player:local_player()
	local stats_id = local_player:stats_id()
	local max_value = #MainGameLevels * 5
	local current_value = 0
	local level_difficulty_name, level_completed_difficulty

	for _, level_id in pairs(MainGameLevels) do
		level_difficulty_name = LevelDifficultyDBNames[level_id]
		level_completed_difficulty = statistics_db:get_persistent_stat(stats_id, "completed_levels_difficulty", level_difficulty_name)

		print("Completed Level Difficulty", level_difficulty_name, level_completed_difficulty, level_id)

		current_value = current_value + level_completed_difficulty
	end

	local game_progress = current_value / max_value * 100

	return game_progress
end

StatisticsUtil._register_completed_level_difficulty = function (statistics_db, level_id, career_name, difficulty_name)
	local local_player = Managers.player:local_player()
	local stats_id = local_player:stats_id()
	local level_difficulty_name = LevelDifficultyDBNames[level_id]
	local current_completed_difficulty = statistics_db:get_persistent_stat(stats_id, "completed_levels_difficulty", level_difficulty_name)
	local difficulty_manager = Managers.state.difficulty
	local difficulties = difficulty_manager:get_level_difficulties(level_id)
	local difficulty = table.find(difficulties, difficulty_name)

	Managers.state.achievement:trigger_event("register_completed_level", difficulty_name, level_id, career_name, local_player)

	if current_completed_difficulty < difficulty then
		statistics_db:set_stat(stats_id, "completed_levels_difficulty", level_difficulty_name, difficulty)
	end

	if statistics_db:has_stat(stats_id, "mission_streak", career_name) then
		local current_streak_difficulty = statistics_db:get_persistent_stat(stats_id, "mission_streak", career_name, level_id)

		if current_streak_difficulty < difficulty then
			statistics_db:set_stat(stats_id, "mission_streak", career_name, level_id, difficulty)
		end
	end

	statistics_db:increment_stat(stats_id, "completed_career_levels", career_name, level_id, difficulty_name)

	local completed_percentage = statistics_db:get_stat(stats_id, "min_health_percentage", career_name)
	local highest_completed_percentage = statistics_db:get_persistent_stat(stats_id, "min_health_completed", career_name)

	if highest_completed_percentage and completed_percentage and highest_completed_percentage < completed_percentage then
		statistics_db:set_stat(stats_id, "min_health_completed", career_name, completed_percentage)
	end

	statistics_db:increment_stat(stats_id, "played_difficulty", difficulty_name)
end

StatisticsUtil._register_completed_journey_difficulty = function (statistics_db, player, journey_name, dominant_god, difficulty_name)
	local stats_id = player:stats_id()
	local profile_index = player:profile_index()
	local profile_abbreviation = SPProfilesAbbreviation[profile_index]
	local journey_db_name = JourneyDifficultyDBNames[journey_name]
	local journey_dominant_god_db_name = JourneyDominantGodDifficultyDBNames[dominant_god]
	local current_completed_difficulty = statistics_db:get_persistent_stat(stats_id, "completed_journeys_difficulty", journey_db_name)
	local current_completed_journey_dominant_god_difficulty = statistics_db:get_persistent_stat(stats_id, "completed_journey_dominant_god_difficulty", journey_dominant_god_db_name)
	local current_completed_hero_journey_difficulty = statistics_db:get_persistent_stat(stats_id, "completed_hero_journey_difficulty", profile_abbreviation, journey_db_name)
	local difficulties = Managers.state.difficulty:get_level_difficulties()
	local difficulty_index = table.find(difficulties, difficulty_name)

	if current_completed_difficulty < difficulty_index then
		if difficulty_index > #DefaultDifficulties then
			ferror("This shouldn't happen. \ndifficulties: %s\ndifficulty_name: %s\ndifficulty_index: %s\nDefaultDifficulties: %s\ncurrent_completed_difficulty: %s", table.tostring(difficulties), difficulty_name, difficulty_index, table.tostring(DefaultDifficulties), current_completed_difficulty)
		end

		statistics_db:set_stat(stats_id, "completed_journeys_difficulty", journey_db_name, difficulty_index)
	end

	if current_completed_journey_dominant_god_difficulty < difficulty_index then
		if difficulty_index > #DefaultDifficulties then
			ferror("This shouldn't happen. \ndifficulties: %s\ndifficulty_name: %s\ndifficulty_index: %s\nDefaultDifficulties: %s\ncurrent_completed_journey_dominant_god_difficulty: %s", table.tostring(difficulties), difficulty_name, difficulty_index, table.tostring(DefaultDifficulties), current_completed_journey_dominant_god_difficulty)
		end

		statistics_db:set_stat(stats_id, "completed_journey_dominant_god_difficulty", journey_dominant_god_db_name, difficulty_index)
	end

	if current_completed_hero_journey_difficulty < difficulty_index then
		if difficulty_index > #DefaultDifficulties then
			ferror("This shouldn't happen. \ndifficulties: %s\ndifficulty_name: %s\ndifficulty_index: %s\nDefaultDifficulties: %s\ncurrent_completed_hero_journey_difficulty: %s", table.tostring(difficulties), difficulty_name, difficulty_index, table.tostring(DefaultDifficulties), current_completed_hero_journey_difficulty)
		end

		statistics_db:set_stat(stats_id, "completed_hero_journey_difficulty", profile_abbreviation, journey_db_name, difficulty_index)
	end
end

StatisticsUtil.unlock_lorebook_page = function (page_id, statistics_db)
	local player = Managers.player:local_player()

	if player then
		local stats_id = player:stats_id()

		print("unlock_lorebook_page", page_id)
		statistics_db:set_array_stat(stats_id, "lorebook_unlocks", page_id, true)

		local category_name = LorebookCategoryNames[page_id]

		LoreBookHelper.mark_page_id_as_new(category_name)
	end
end

local function survival_stat_name(level_id, difficulty, stat_suffix)
	assert(stat_suffix == "waves" or stat_suffix == "time" or stat_suffix == "kills")

	local stat_name = string.format("survival_%s_%s_%s", level_id, difficulty, stat_suffix)

	return stat_name
end

StatisticsUtil.get_survival_stat = function (statistics_db, level_id, difficulty, stat_name, stats_id)
	local stat = survival_stat_name(level_id, difficulty, stat_name)
	local player_manager = Managers.player
	local local_player = player_manager:local_player()

	stats_id = stats_id or local_player:stats_id()

	local value = statistics_db:get_persistent_stat(stats_id, stat)

	return value
end

StatisticsUtil._set_survival_stat = function (statistics_db, level_id, difficulty, stat_name, value)
	local stat = survival_stat_name(level_id, difficulty, stat_name)
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	local stats_id = local_player:stats_id()

	statistics_db:set_stat(stats_id, stat, value)
end

StatisticsUtil.reset_mission_streak = function (player, statistics_db, stats_id)
	local profile_index = player:profile_index()
	local profile = SPProfiles[profile_index]
	local career_index = player:career_index()
	local career_data = profile.careers[career_index]
	local career_name = career_data.name
	local level_settings = LevelHelper:current_level_settings()
	local level_id = level_settings.level_id

	if statistics_db:has_stat(stats_id, "mission_streak", career_name) then
		for i = 1, 3 do
			local act_key = "act_" .. i
			local act_levels = GameActs[act_key]
			local do_reset = false

			for i = 1, #act_levels do
				local cleared = statistics_db:get_persistent_stat(stats_id, "mission_streak", career_name, act_levels[i])

				if cleared == 0 then
					do_reset = true

					break
				end
			end

			if do_reset and table.contains(act_levels, level_id) then
				for i = 1, #act_levels do
					statistics_db:set_stat(stats_id, "mission_streak", career_name, act_levels[i], 0)
				end
			end
		end
	end
end

StatisticsUtil._modify_survival_stat = function (statistics_db, level_id, difficulty, stat_name, value)
	local stat = survival_stat_name(level_id, difficulty, stat_name)
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	local stats_id = local_player:stats_id()

	statistics_db:modify_stat_by_amount(stats_id, stat, value)
end

StatisticsUtil.register_complete_survival_level = function (statistics_db)
	local mission_system = Managers.state.entity:system("mission_system")
	local active_missions, completed_missions = mission_system:get_missions()
	local mission_data = active_missions.survival_wave

	if not mission_data then
		return
	end

	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	local stats_id = local_player:stats_id()
	local level_settings = LevelHelper:current_level_settings()
	local level_id = level_settings.level_id
	local start_wave = mission_data.starting_wave
	local start_difficulty = SurvivalDifficultyByStartWave[start_wave]
	local kills = statistics_db:get_stat(stats_id, "kills_total")

	StatisticsUtil._modify_survival_stat(statistics_db, level_id, start_difficulty, "kills", kills)

	local wave_completed = mission_data.wave_completed

	if wave_completed ~= 0 then
		local completed_waves = wave_completed - start_wave
		local current_completed_waves = StatisticsUtil.get_survival_stat(statistics_db, level_id, start_difficulty, "waves")

		if current_completed_waves < completed_waves then
			StatisticsUtil._set_survival_stat(statistics_db, level_id, start_difficulty, "waves", completed_waves)
		end

		local completed_time = mission_data.wave_completed_time - mission_data.start_time
		local current_completed_time = StatisticsUtil.get_survival_stat(statistics_db, level_id, start_difficulty, "time")

		if current_completed_waves < completed_waves or completed_waves == current_completed_waves and completed_time < current_completed_time then
			StatisticsUtil._set_survival_stat(statistics_db, level_id, start_difficulty, "time", completed_time)
		end

		local completed_difficulty
		local difficulty_manager = Managers.state.difficulty
		local level_difficulties = difficulty_manager:get_level_difficulties(level_id)
		local start_difficulty_index = table.find(level_difficulties, start_difficulty)
		local level_difficulty_name = LevelDifficultyDBNames[level_id]
		local current_completed_difficulty_index = statistics_db:get_persistent_stat(stats_id, "completed_levels_difficulty", level_difficulty_name)
		local started_on_unlocked_difficulty = current_completed_difficulty_index >= start_difficulty_index - 1

		if started_on_unlocked_difficulty then
			local difficulty = difficulty_manager:get_difficulty()
			local difficulty_index = table.find(level_difficulties, difficulty)
			local completed_difficulty_index = difficulty_index == #level_difficulties and completed_waves >= 13 * (difficulty_index - start_difficulty_index + 1) and difficulty_index or difficulty_index - 1

			if completed_difficulty_index > 0 then
				completed_difficulty = level_difficulties[completed_difficulty_index]
			end

			if completed_difficulty_index and completed_difficulty_index < 3 and completed_waves >= 13 then
				Crashify.print_exception("StatisticsUtil", "Error in survival mode data. completed_difficulty_index = %s, completed_waves = %s, started_on_unlocked_difficulty = true", completed_difficulty_index, completed_waves)
			end
		else
			local completed_difficulty_index

			for i = #level_difficulties, 1, -1 do
				local difficulty = level_difficulties[i]
				local difficulty_end_wave = SurvivalEndWaveByDifficulty[difficulty]

				if difficulty_end_wave <= wave_completed then
					completed_difficulty_index = i
					completed_difficulty = difficulty

					break
				end
			end

			if completed_difficulty_index and completed_difficulty_index < 3 and completed_waves >= 13 then
				Crashify.print_exception("StatisticsUtil", "Error in survival mode data. completed_difficulty_index = %s, completed_waves = %s, started_on_unlocked_difficulty = false", completed_difficulty_index, completed_waves)
			end
		end

		if completed_difficulty then
			StatisticsUtil._register_completed_level_difficulty(statistics_db, level_id, completed_difficulty)
		end
	end
end

StatisticsUtil.register_disable = function (disabler_player, statistics_db, disabler_breed_name)
	if Managers.mechanism:current_mechanism_name() == "versus" then
		local stats_id = disabler_player:stats_id()

		statistics_db:increment_stat(stats_id, "vs_disables_per_breed", disabler_breed_name)
	end
end

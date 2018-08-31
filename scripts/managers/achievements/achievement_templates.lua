AchievementTemplates = {}
local ExperienceSettings = rawget(_G, "ExperienceSettings")
local LevelSettings = rawget(_G, "LevelSettings")
local LevelUnlockUtils = rawget(_G, "LevelUnlockUtils")
local ProgressionUnlocks = rawget(_G, "ProgressionUnlocks")
local UnlockableLevels = rawget(_G, "UnlockableLevels")
local DifficultySettings = rawget(_G, "DifficultySettings")

require("scripts/settings/quest_settings")

local function check_level_list(statistics_db, stats_id, levels_to_complete)
	assert(type(levels_to_complete) == "table", "levels_to_complete needs to be a list of levels")

	for i = 1, #levels_to_complete, 1 do
		local level_id = levels_to_complete[i]
		local level_stat = statistics_db:get_persistent_stat(stats_id, "completed_levels", level_id)

		if not level_stat or level_stat == 0 then
			return false
		end
	end

	return true
end

local function check_level_list_difficulty(statistics_db, stats_id, levels_to_complete, difficulty_rank, career)
	assert(type(levels_to_complete) == "table", "levels_to_complete needs to be a list of levels")

	local difficulty_manager = Managers.state.difficulty

	if not difficulty_manager then
		return false
	end

	for i = 1, #levels_to_complete, 1 do
		local level_id = levels_to_complete[i]
		local difficulties = difficulty_manager:get_level_difficulties(level_id)
		local difficulty_index = nil

		if career then
			for i, r in ipairs(difficulties) do
				local wins = statistics_db:get_persistent_stat(stats_id, "completed_career_levels", career, level_id, r)

				if wins > 0 then
					difficulty_index = i
				end
			end
		else
			difficulty_index = LevelUnlockUtils.completed_level_difficulty_index(statistics_db, stats_id, level_id)
		end

		if not difficulty_index then
			return false
		end

		local difficulty_key = difficulties[difficulty_index]

		if not difficulty_key then
			return false
		end

		local completed_rank = DifficultySettings[difficulty_key].rank

		if completed_rank < difficulty_rank then
			return false
		end
	end

	return true
end

local function hero_level(hero_name)
	local experience = ExperienceSettings.get_experience(hero_name)

	return ExperienceSettings.get_level(experience)
end

local rarity_index = {
	common = 2,
	plentiful = 1,
	exotic = 4,
	rare = 3,
	unique = 5
}
local equipment_slots = {
	"melee",
	"ranged",
	"necklace",
	"ring",
	"trinket"
}

local function equipped_items_of_rarity(statistics_db, stats_id, required_rarity)
	local required_rarity_index = rarity_index[required_rarity]

	assert(required_rarity_index, "Invalid rarity %s", required_rarity)

	local count = 0

	for _, slot in ipairs(equipment_slots) do
		local slot_rarity = statistics_db:get_persistent_stat(stats_id, "highest_equipped_rarity", slot)

		if required_rarity_index <= slot_rarity then
			count = count + 1
		end
	end

	return count
end

local rewards_lookup = {
	bogenhafen_city_no_braziers_lit = "bogenhafen_chest",
	complete_all_helmgart_levels_champion_wh_zealot = "skin_wh_zealot_crimson",
	complete_deeds_4 = "frame_0009",
	complete_all_helmgart_levels_veteran = "loot_chest_02_06",
	complete_all_helmgart_levels_legend_dr_ranger = "skin_dr_ranger_black_and_gold",
	complete_all_helmgart_levels_recruit_bw_adept = "frame_0075",
	achievement_markus_level_3 = "knight_hat_0003",
	fort_kill_enemies_cannonball = "loot_chest_04_06",
	skaven_rat_ogre_1 = "level_chest",
	skaven_poison_wind_globardier_3 = "level_chest",
	complete_100_missions_champion_wh_captain = "witchhunter_hat_0002",
	achievement_kerillian_level_3 = "shade_hat_0010",
	kill_bodvarr_burblespew_recruit = "level_chest",
	complete_all_helmgart_levels_champion_we_waywatcher = "skin_ww_waywatcher_anmyr",
	helmgart_lord_1 = "level_chest",
	complete_100_missions_champion_bw_adept = "adept_hat_0003",
	complete_all_helmgart_levels_legend_es_huntsman = "skin_es_huntsman_black_and_gold",
	ground_zero_burblespew_tornado_enemies = "loot_chest_04_06",
	bell_destroy_bell_flee_timed = "loot_chest_04_06",
	complete_100_missions_champion_wh_bountyhunter = "bountyhunter_hat_0003",
	complete_all_helmgart_levels_recruit_wh_zealot = "frame_0071",
	chaos_corruptor_sorcerer_3 = "level_chest",
	complete_100_missions_champion_dr_ranger = "ranger_hat_0004",
	complete_100_missions_champion_dr_slayer = "slayer_hat_0006",
	complete_100_missions_champion_es_mercenary = "mercenary_hat_0007",
	kill_skarrik_rasknitt_recruit = "level_chest",
	complete_all_helmgart_levels_recruit_bw_scholar = "frame_0076",
	chaos_corruptor_sorcerer_2 = "level_chest",
	complete_all_helmgart_levels_champion_wh_captain = "skin_wh_captain_ostland",
	complete_100_missions_champion_we_maidenguard = "maidenguard_hat_0010",
	warcamp_bodvarr_charge_warriors = "loot_chest_04_06",
	complete_all_helmgart_levels_recruit_dr_ironbreaker = "frame_0052",
	complete_all_helmgart_levels_recruit_wh_bountyhunter = "frame_0070",
	complete_all_helmgart_levels_champion_es_knight = "skin_es_knight_red",
	complete_all_helmgart_levels_recruit_we_shade = "frame_0059",
	complete_100_missions_champion_dr_ironbreaker = "ironbreaker_hat_0013",
	complete_all_helmgart_levels_legend_bw_adept = "skin_bw_adept_black_and_gold",
	complete_all_helmgart_levels_veteran_bw_unchained = "frame_0080",
	complete_bogenhafen_slum_veteran = "bogenhafen_chest",
	complete_all_helmgart_levels_veteran_dr_slayer = "frame_0056",
	complete_all_helmgart_levels_veteran_dr_ranger = "frame_0054",
	complete_all_helmgart_levels_all_careers_recruit = "frame_0035",
	complete_all_helmgart_levels_veteran_es_knight = "frame_0068",
	complete_all_helmgart_levels_veteran_es_huntsman = "frame_0067",
	skaven_warpfire_thrower_1 = "level_chest",
	skaven_poison_wind_globardier_1 = "level_chest",
	bogenhafen_complete_veteran = "frame_bogenhafen_02",
	complete_all_helmgart_levels_legend_dr_ironbreaker = "skin_dr_ironbreaker_black_and_gold",
	complete_all_helmgart_levels_legend_wh_zealot = "skin_wh_zealot_black_and_gold",
	complete_all_helmgart_levels_champion_wh_bountyhunter = "skin_wh_bountyhunter_yellow_and_red",
	skaven_gutter_runner_1 = "level_chest",
	complete_all_helmgart_levels_champion_es_mercenary = "skin_es_mercenary_ostermark",
	complete_all_helmgart_levels_veteran_wh_captain = "frame_0072",
	complete_all_helmgart_levels_recruit_bw_unchained = "frame_0077",
	complete_all_helmgart_levels_recruit_we_maidenguard = "frame_0058",
	complete_all_helmgart_levels_veteran_we_waywatcher = "frame_0060",
	complete_all_helmgart_levels_recruit_dr_slayer = "frame_0053",
	complete_all_helmgart_levels_legend_wh_captain = "skin_wh_captain_black_and_gold",
	complete_all_helmgart_levels_recruit_wh_captain = "frame_0069",
	complete_100_missions_champion_we_shade = "shade_hat_0003",
	complete_deeds_3 = "frame_0008",
	complete_all_helmgart_levels_veteran_we_shade = "frame_0062",
	kill_bodvarr_burblespew_champion = "level_chest",
	complete_all_helmgart_levels_veteran_bw_scholar = "frame_0079",
	complete_all_helmgart_levels_recruit_we_waywatcher = "frame_0057",
	complete_all_helmgart_levels_veteran_dr_ironbreaker = "frame_0055",
	complete_all_helmgart_levels_veteran_wh_bountyhunter = "frame_0073",
	complete_all_helmgart_levels_veteran_wh_zealot = "frame_0074",
	complete_all_helmgart_levels_champion_dr_ranger = "skin_dr_ranger_karak_norn",
	complete_all_helmgart_level_achievements = "frame_0081",
	complete_all_helmgart_levels_champion_dr_ironbreaker = "skin_dr_ironbreaker_crimson",
	kill_skarrik_rasknitt_veteran = "level_chest",
	complete_all_helmgart_levels_legend_bw_scholar = "skin_bw_scholar_black_and_gold",
	complete_all_helmgart_levels_recruit_es_huntsman = "frame_0064",
	ussingen_no_event_barrels = "loot_chest_04_06",
	bogenhafen_complete_champion = "frame_bogenhafen_03",
	achievement_markus_level_2 = "huntsman_hat_0004",
	complete_all_helmgart_levels_champion_bw_unchained = "skin_bw_unchained_ostermark",
	chaos_vortex_sorcerer_3 = "level_chest",
	chaos_spawn_1 = "level_chest",
	chaos_troll_2 = "level_chest",
	complete_all_helmgart_levels_legend_es_mercenary = "skin_es_mercenary_black_and_gold",
	skaven_rat_ogre_2 = "level_chest",
	skaven_stormfiend_2 = "level_chest",
	complete_all_helmgart_levels_veteran_bw_adept = "frame_0078",
	complete_all_helmgart_levels_veteran_es_mercenary = "frame_0066",
	skaven_stronghold_skarrik_kill_skaven = "loot_chest_04_06",
	complete_100_missions_champion_bw_unchained = "unchained_hat_0004",
	kill_helmgart_lords_within_time = "level_chest",
	complete_100_missions_champion_wh_zealot = "zealot_hat_0003",
	chaos_corruptor_sorcerer_1 = "level_chest",
	complete_bogenhafen_slum_recruit = "bogenhafen_chest",
	complete_all_helmgart_levels_champion_dr_slayer = "skin_dr_slayer_runes",
	complete_all_helmgart_levels_all_careers_veteran = "frame_0036",
	complete_bogenhafen_slum_champion = "bogenhafen_chest",
	achievement_kerillian_level_1 = "waywatcher_hat_0006",
	complete_bogenhafen_city_recruit = "bogenhafen_chest",
	complete_bogenhafen_city_veteran = "bogenhafen_chest",
	military_kill_chaos_warriors_in_event = "loot_chest_04_06",
	complete_all_helmgart_levels_veteran_we_maidenguard = "frame_0061",
	complete_bogenhafen_city_champion = "bogenhafen_chest",
	complete_bogenhafen_city_legend = "bogenhafen_chest",
	complete_all_helmgart_levels_legend = "loot_chest_04_06",
	bogenhafen_slum_no_windows_broken = "bogenhafen_chest",
	bogenhafen_slum_find_hidden_stash = "bogenhafen_chest",
	skaven_stormfiend_1 = "level_chest",
	bogenhafen_city_fast_switches = "bogenhafen_chest",
	complete_100_missions_champion_es_knight = "knight_hat_0005",
	skaven_gutter_runner_3 = "level_chest",
	bogenhafen_city_all_wine_collected = "bogenhafen_chest",
	bogenhafen_city_torch_not_picked_up = "bogenhafen_chest",
	achievement_bardin_level_1 = "ranger_hat_0003",
	complete_all_helmgart_levels_legend_we_maidenguard = "skin_ww_maidenguard_black_and_gold",
	achievement_bardin_level_3 = "slayer_hat_0007",
	achievement_markus_level_1 = "mercenary_hat_0006",
	mines_kill_final_troll_timed = "loot_chest_04_06",
	complete_all_helmgart_levels_legend_wh_bountyhunter = "skin_wh_bountyhunter_black_and_gold",
	bogenhafen_complete_recruit = "frame_bogenhafen_01",
	complete_all_helmgart_levels_champion_we_maidenguard = "skin_ww_maidenguard_red_and_yellow",
	complete_all_helmgart_levels_champion = "loot_chest_03_06",
	complete_100_missions_champion_we_waywatcher = "waywatcher_hat_0002",
	complete_all_helmgart_levels_recruit_es_mercenary = "frame_0063",
	complete_all_helmgart_levels_legend_we_waywatcher = "skin_ww_waywatcher_black_and_gold",
	complete_all_helmgart_levels_champion_es_huntsman = "skin_es_huntsman_ostermark",
	complete_bogenhafen_slum_legend = "bogenhafen_chest",
	equip_all_veteran_quality = "level_chest",
	skaven_ratling_gunner_2 = "level_chest",
	achievement_kerillian_level_2 = "maidenguard_hat_0005",
	complete_deeds_7 = "frame_0012",
	achievement_sienna_level_1 = "adept_hat_0002",
	skaven_poison_wind_globardier_2 = "level_chest",
	catacombs_stay_inside_ritual_pool = "loot_chest_04_06",
	achievement_sienna_level_3 = "unchained_hat_0008",
	achievement_victor_level_1 = "witchhunter_hat_0003",
	achievement_victor_level_2 = "bountyhunter_hat_0002",
	complete_100_missions_champion_bw_scholar = "scholar_hat_0005",
	achievement_victor_level_3 = "zealot_hat_0009",
	complete_all_helmgart_levels_champion_bw_scholar = "skin_bw_scholar_ostermark",
	complete_deeds_8 = "frame_0013",
	skittergate_deathrattler_rasknitt_timed = "loot_chest_04_06",
	skaven_pack_master_2 = "level_chest",
	complete_all_helmgart_levels_legend_es_knight = "skin_es_knight_black_and_gold",
	skaven_pack_master_1 = "level_chest",
	nurgle_player_showered_in_pus = "loot_chest_04_06",
	chaos_spawn_2 = "level_chest",
	bogenhafen_city_jumping_puzzle = "bogenhafen_chest",
	kill_bodvarr_burblespew_legend = "level_chest",
	complete_all_helmgart_levels_all_careers_champion = "frame_0037",
	skaven_pack_master_3 = "level_chest",
	achievement_sienna_level_2 = "scholar_hat_0004",
	kill_skarrik_rasknitt_champion = "level_chest",
	skaven_ratling_gunner_3 = "level_chest",
	chaos_troll_1 = "level_chest",
	complete_all_helmgart_levels_recruit = "loot_chest_01_06",
	complete_all_helmgart_levels_recruit_es_knight = "frame_0065",
	chaos_vortex_sorcerer_1 = "level_chest",
	complete_all_helmgart_levels_legend_bw_unchained = "skin_bw_unchained_black_and_gold",
	complete_all_helmgart_levels_all_careers_legend = "frame_0038",
	farmlands_rescue_prisoners_timed = "loot_chest_04_06",
	elven_ruins_align_leylines_timed = "loot_chest_04_06",
	bogenhafen_slum_no_ratling_damage = "bogenhafen_chest",
	complete_all_helmgart_levels_legend_we_shade = "skin_ww_shade_black_and_gold",
	complete_deeds_6 = "frame_0011",
	bogenhafen_complete_legend = "frame_bogenhafen_04",
	complete_all_helmgart_levels_legend_dr_slayer = "skin_dr_slayer_dragon",
	complete_all_helmgart_levels_champion_we_shade = "skin_ww_shade_crimson",
	complete_deeds_5 = "frame_0010",
	kill_skarrik_rasknitt_legend = "level_chest",
	kill_bodvarr_burblespew_veteran = "level_chest",
	chaos_vortex_sorcerer_2 = "level_chest",
	skaven_ratling_gunner_1 = "level_chest",
	skaven_warpfire_thrower_2 = "level_chest",
	complete_100_missions_champion_es_huntsman = "huntsman_hat_0009",
	complete_deeds_2 = "frame_0007",
	achievement_bardin_level_2 = "ironbreaker_hat_0007",
	bogenhafen_slum_jumping_puzzle = "bogenhafen_chest",
	bogenhafen_slum_event_speedrun = "bogenhafen_chest",
	complete_deeds_1 = "frame_0006",
	skaven_gutter_runner_2 = "level_chest",
	complete_all_helmgart_levels_recruit_dr_ranger = "frame_0051",
	skaven_warpfire_thrower_3 = "level_chest",
	complete_all_helmgart_levels_champion_bw_adept = "skin_bw_adept_ostermark"
}
AchievementTemplates.end_of_level_achievement_evaluations = {
	no_ratling_damage = {
		stat_to_increment = "bogenhafen_slum_no_ratling_damage",
		levels = {
			"dlc_bogenhafen_slum"
		},
		evaluation_func = function (statistics_db, stats_id)
			return statistics_db:get_stat(stats_id, "damage_taken_from_ratling_gunner") == 0
		end,
		allowed_difficulties = {
			hardest = true
		}
	}
}
AchievementTemplates.achievements = {
	complete_tutorial = {
		ID_XB1 = 2,
		name = "achv_complete_tutorial_name",
		ID_STEAM = "complete_tutorial",
		reward = "level_chest",
		icon = "achievement_trophy_01",
		desc = "achv_complete_tutorial_desc",
		completed = function (statistics_db, stats_id)
			return check_level_list(statistics_db, stats_id, {
				LevelSettings.prologue.level_id
			})
		end
	},
	complete_act_one = {
		ID_XB1 = 3,
		name = "achv_complete_act_one_name",
		reward = "level_chest",
		desc = "achv_complete_act_one_desc",
		ID_STEAM = "complete_act_one",
		icon = "achievement_trophy_02",
		completed = function (statistics_db, stats_id)
			return LevelUnlockUtils.act_completed(statistics_db, stats_id, "act_1")
		end,
		progress = function (statistics_db, stats_id)
			local count = 0

			if check_level_list(statistics_db, stats_id, {
				LevelSettings.military.level_id
			}) then
				count = count + 1
			end

			if check_level_list(statistics_db, stats_id, {
				LevelSettings.catacombs.level_id
			}) then
				count = count + 1
			end

			if check_level_list(statistics_db, stats_id, {
				LevelSettings.mines.level_id
			}) then
				count = count + 1
			end

			if check_level_list(statistics_db, stats_id, {
				LevelSettings.ground_zero.level_id
			}) then
				count = count + 1
			end

			return {
				count,
				4
			}
		end,
		requirements = function (statistics_db, stats_id)
			local complete_military = check_level_list(statistics_db, stats_id, {
				LevelSettings.military.level_id
			})
			local complete_catacombs = check_level_list(statistics_db, stats_id, {
				LevelSettings.catacombs.level_id
			})
			local complete_mines = check_level_list(statistics_db, stats_id, {
				LevelSettings.mines.level_id
			})
			local complete_ground_zero = check_level_list(statistics_db, stats_id, {
				LevelSettings.ground_zero.level_id
			})

			return {
				{
					name = "level_name_military",
					completed = complete_military
				},
				{
					name = "level_name_catacombs",
					completed = complete_catacombs
				},
				{
					name = "level_name_mines",
					completed = complete_mines
				},
				{
					name = "level_name_ground_zero",
					completed = complete_ground_zero
				}
			}
		end
	},
	complete_act_one_veteran = {
		reward = "level_chest",
		name = "achv_complete_act_one_veteran_name",
		icon = "icons_placeholder",
		desc = "achv_complete_act_one_veteran_desc",
		completed = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.hard.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.military.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.catacombs.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.mines.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.ground_zero.level_id
			}, diff) then
				count = count + 1
			end

			return count >= 4
		end,
		progress = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.hard.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.military.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.catacombs.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.mines.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.ground_zero.level_id
			}, diff) then
				count = count + 1
			end

			return {
				count,
				4
			}
		end,
		requirements = function (statistics_db, stats_id)
			local diff = DifficultySettings.hard.rank
			local complete_military = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.military.level_id
			}, diff)
			local complete_catacombs = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.catacombs.level_id
			}, diff)
			local complete_mines = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.mines.level_id
			}, diff)
			local complete_ground_zero = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.ground_zero.level_id
			}, diff)

			return {
				{
					name = "level_name_military",
					completed = complete_military
				},
				{
					name = "level_name_catacombs",
					completed = complete_catacombs
				},
				{
					name = "level_name_mines",
					completed = complete_mines
				},
				{
					name = "level_name_ground_zero",
					completed = complete_ground_zero
				}
			}
		end
	},
	complete_bogenhafen_slum_recruit = {
		reward = "bogenhafen_chest",
		name = "achv_bogenhafen_slum_recruit_name",
		required_dlc = "bogenhafen",
		icon = "achievement_trophy_bogenhafen_slum_recruit",
		desc = "achv_bogenhafen_slum_recruit_desc",
		completed = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.normal.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_slum.level_id
			}, diff) then
				count = count + 1
			end

			return count >= 1
		end
	},
	complete_bogenhafen_slum_veteran = {
		reward = "bogenhafen_chest",
		name = "achv_bogenhafen_slum_veteran_name",
		required_dlc = "bogenhafen",
		icon = "achievement_trophy_bogenhafen_slum_veteran",
		desc = "achv_bogenhafen_slum_veteran_desc",
		completed = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.hard.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_slum.level_id
			}, diff) then
				count = count + 1
			end

			return count >= 1
		end
	},
	complete_bogenhafen_slum_champion = {
		reward = "bogenhafen_chest",
		name = "achv_bogenhafen_slum_champion_name",
		required_dlc = "bogenhafen",
		icon = "achievement_trophy_bogenhafen_slum_champion",
		desc = "achv_bogenhafen_slum_champion_desc",
		completed = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.harder.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_slum.level_id
			}, diff) then
				count = count + 1
			end

			return count >= 1
		end
	},
	complete_bogenhafen_slum_legend = {
		reward = "bogenhafen_chest",
		name = "achv_bogenhafen_slum_legend_name",
		required_dlc = "bogenhafen",
		icon = "achievement_trophy_bogenhafen_slum_legend",
		desc = "achv_bogenhafen_slum_legend_desc",
		completed = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.hardest.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_slum.level_id
			}, diff) then
				count = count + 1
			end

			return count >= 1
		end
	},
	complete_bogenhafen_city_recruit = {
		reward = "bogenhafen_chest",
		name = "achv_bogenhafen_city_recruit_name",
		required_dlc = "bogenhafen",
		icon = "achievement_trophy_bogenhafen_city_recruit",
		desc = "achv_bogenhafen_city_recruit_desc",
		completed = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.normal.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_city.level_id
			}, diff) then
				count = count + 1
			end

			return count >= 1
		end
	},
	complete_bogenhafen_city_veteran = {
		reward = "bogenhafen_chest",
		name = "achv_bogenhafen_city_veteran_name",
		required_dlc = "bogenhafen",
		icon = "achievement_trophy_bogenhafen_city_veteran",
		desc = "achv_bogenhafen_city_veteran_desc",
		completed = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.hard.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_city.level_id
			}, diff) then
				count = count + 1
			end

			return count >= 1
		end
	},
	complete_bogenhafen_city_champion = {
		reward = "bogenhafen_chest",
		name = "achv_bogenhafen_city_champion_name",
		required_dlc = "bogenhafen",
		icon = "achievement_trophy_bogenhafen_city_champion",
		desc = "achv_bogenhafen_city_champion_desc",
		completed = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.harder.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_city.level_id
			}, diff) then
				count = count + 1
			end

			return count >= 1
		end
	},
	complete_bogenhafen_city_legend = {
		reward = "bogenhafen_chest",
		name = "achv_bogenhafen_city_legend_name",
		required_dlc = "bogenhafen",
		icon = "achievement_trophy_bogenhafen_city_legend",
		desc = "achv_bogenhafen_city_legend_desc",
		completed = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.hardest.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_city.level_id
			}, diff) then
				count = count + 1
			end

			return count >= 1
		end
	},
	complete_bogenhafen_recruit = {
		ID_XB1 = 52,
		name = "achv_bogenhafen_complete_recruit_name",
		reward = "frame_bogenhafen_01",
		desc = "achv_bogenhafen_complete_recruit_desc",
		icon = "achievement_trophy_bogenhafen_complete_recruit",
		required_dlc = "bogenhafen",
		completed = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.normal.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_slum.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_city.level_id
			}, diff) then
				count = count + 1
			end

			return count >= 2
		end,
		progress = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.normal.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_slum.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_city.level_id
			}, diff) then
				count = count + 1
			end

			return {
				count,
				2
			}
		end,
		requirements = function (statistics_db, stats_id)
			local diff = DifficultySettings.normal.rank
			local complete_bogenhafen_slum = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_slum.level_id
			}, diff)
			local complete_bogenhafen_city = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_city.level_id
			}, diff)

			return {
				{
					name = "level_name_bogenhafen_slum",
					completed = complete_bogenhafen_slum
				},
				{
					name = "level_name_bogenhafen_city",
					completed = complete_bogenhafen_city
				}
			}
		end
	},
	complete_bogenhafen_veteran = {
		ID_XB1 = 53,
		name = "achv_bogenhafen_complete_veteran_name",
		reward = "frame_bogenhafen_02",
		desc = "achv_bogenhafen_complete_veteran_desc",
		icon = "achievement_trophy_bogenhafen_complete_veteran",
		required_dlc = "bogenhafen",
		completed = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.hard.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_slum.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_city.level_id
			}, diff) then
				count = count + 1
			end

			return count >= 2
		end,
		progress = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.hard.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_slum.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_city.level_id
			}, diff) then
				count = count + 1
			end

			return {
				count,
				2
			}
		end,
		requirements = function (statistics_db, stats_id)
			local diff = DifficultySettings.hard.rank
			local complete_bogenhafen_slum = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_slum.level_id
			}, diff)
			local complete_bogenhafen_city = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_city.level_id
			}, diff)

			return {
				{
					name = "level_name_bogenhafen_slum",
					completed = complete_bogenhafen_slum
				},
				{
					name = "level_name_bogenhafen_city",
					completed = complete_bogenhafen_city
				}
			}
		end
	},
	complete_bogenhafen_champion = {
		ID_XB1 = 54,
		name = "achv_bogenhafen_complete_champion_name",
		reward = "frame_bogenhafen_03",
		desc = "achv_bogenhafen_complete_champion_desc",
		icon = "achievement_trophy_bogenhafen_complete_champion",
		required_dlc = "bogenhafen",
		completed = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.harder.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_slum.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_city.level_id
			}, diff) then
				count = count + 1
			end

			return count >= 2
		end,
		progress = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.harder.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_slum.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_city.level_id
			}, diff) then
				count = count + 1
			end

			return {
				count,
				2
			}
		end,
		requirements = function (statistics_db, stats_id)
			local diff = DifficultySettings.harder.rank
			local complete_bogenhafen_slum = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_slum.level_id
			}, diff)
			local complete_bogenhafen_city = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_city.level_id
			}, diff)

			return {
				{
					name = "level_name_bogenhafen_slum",
					completed = complete_bogenhafen_slum
				},
				{
					name = "level_name_bogenhafen_city",
					completed = complete_bogenhafen_city
				}
			}
		end
	},
	complete_bogenhafen_legend = {
		ID_XB1 = 55,
		name = "achv_bogenhafen_complete_legend_name",
		reward = "frame_bogenhafen_04",
		desc = "achv_bogenhafen_complete_legend_desc",
		icon = "achievement_trophy_bogenhafen_complete_legend",
		required_dlc = "bogenhafen",
		completed = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.hardest.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_slum.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_city.level_id
			}, diff) then
				count = count + 1
			end

			return count >= 2
		end,
		progress = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.hardest.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_slum.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_city.level_id
			}, diff) then
				count = count + 1
			end

			return {
				count,
				2
			}
		end,
		requirements = function (statistics_db, stats_id)
			local diff = DifficultySettings.hardest.rank
			local complete_bogenhafen_slum = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_slum.level_id
			}, diff)
			local complete_bogenhafen_city = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_city.level_id
			}, diff)

			return {
				{
					name = "level_name_bogenhafen_slum",
					completed = complete_bogenhafen_slum
				},
				{
					name = "level_name_bogenhafen_city",
					completed = complete_bogenhafen_city
				}
			}
		end
	},
	complete_act_one_champion = {
		reward = "level_chest",
		name = "achv_complete_act_one_champion_name",
		icon = "icons_placeholder",
		desc = "achv_complete_act_one_champion_desc",
		completed = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.harder.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.military.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.catacombs.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.mines.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.ground_zero.level_id
			}, diff) then
				count = count + 1
			end

			return count >= 4
		end,
		progress = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.harder.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.military.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.catacombs.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.mines.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.ground_zero.level_id
			}, diff) then
				count = count + 1
			end

			return {
				count,
				4
			}
		end,
		requirements = function (statistics_db, stats_id)
			local diff = DifficultySettings.harder.rank
			local complete_military = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.military.level_id
			}, diff)
			local complete_catacombs = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.catacombs.level_id
			}, diff)
			local complete_mines = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.mines.level_id
			}, diff)
			local complete_ground_zero = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.ground_zero.level_id
			}, diff)

			return {
				{
					name = "level_name_military",
					completed = complete_military
				},
				{
					name = "level_name_catacombs",
					completed = complete_catacombs
				},
				{
					name = "level_name_mines",
					completed = complete_mines
				},
				{
					name = "level_name_ground_zero",
					completed = complete_ground_zero
				}
			}
		end
	},
	complete_act_one_legend = {
		reward = "level_chest",
		name = "achv_complete_act_one_legend_name",
		icon = "icons_placeholder",
		desc = "achv_complete_act_one_legend_desc",
		completed = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.hardest.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.military.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.catacombs.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.mines.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.ground_zero.level_id
			}, diff) then
				count = count + 1
			end

			return count >= 4
		end,
		progress = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.hardest.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.military.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.catacombs.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.mines.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.ground_zero.level_id
			}, diff) then
				count = count + 1
			end

			return {
				count,
				4
			}
		end,
		requirements = function (statistics_db, stats_id)
			local diff = DifficultySettings.hardest.rank
			local complete_military = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.military.level_id
			}, diff)
			local complete_catacombs = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.catacombs.level_id
			}, diff)
			local complete_mines = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.mines.level_id
			}, diff)
			local complete_ground_zero = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.ground_zero.level_id
			}, diff)

			return {
				{
					name = "level_name_military",
					completed = complete_military
				},
				{
					name = "level_name_catacombs",
					completed = complete_catacombs
				},
				{
					name = "level_name_mines",
					completed = complete_mines
				},
				{
					name = "level_name_ground_zero",
					completed = complete_ground_zero
				}
			}
		end
	},
	complete_act_two = {
		ID_XB1 = 4,
		name = "achv_complete_act_two_name",
		reward = "level_chest",
		desc = "achv_complete_act_two_desc",
		ID_STEAM = "complete_act_two",
		icon = "achievement_trophy_03",
		completed = function (statistics_db, stats_id)
			return LevelUnlockUtils.act_completed(statistics_db, stats_id, "act_2")
		end,
		progress = function (statistics_db, stats_id)
			local count = 0

			if check_level_list(statistics_db, stats_id, {
				LevelSettings.elven_ruins.level_id
			}) then
				count = count + 1
			end

			if check_level_list(statistics_db, stats_id, {
				LevelSettings.bell.level_id
			}) then
				count = count + 1
			end

			if check_level_list(statistics_db, stats_id, {
				LevelSettings.fort.level_id
			}) then
				count = count + 1
			end

			if check_level_list(statistics_db, stats_id, {
				LevelSettings.skaven_stronghold.level_id
			}) then
				count = count + 1
			end

			return {
				count,
				4
			}
		end,
		requirements = function (statistics_db, stats_id)
			local complete_elven_ruins = check_level_list(statistics_db, stats_id, {
				LevelSettings.elven_ruins.level_id
			})
			local complete_bell = check_level_list(statistics_db, stats_id, {
				LevelSettings.bell.level_id
			})
			local complete_fort = check_level_list(statistics_db, stats_id, {
				LevelSettings.fort.level_id
			})
			local complete_skaven_stronghold = check_level_list(statistics_db, stats_id, {
				LevelSettings.skaven_stronghold.level_id
			})

			return {
				{
					name = "level_name_elven_ruins",
					completed = complete_elven_ruins
				},
				{
					name = "level_name_bell",
					completed = complete_bell
				},
				{
					name = "level_name_forest_fort",
					completed = complete_fort
				},
				{
					name = "level_name_skaven_stronghold",
					completed = complete_skaven_stronghold
				}
			}
		end
	},
	complete_act_two_veteran = {
		reward = "level_chest",
		name = "achv_complete_act_two_veteran_name",
		icon = "icons_placeholder",
		desc = "achv_complete_act_two_veteran_desc",
		completed = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.hard.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.elven_ruins.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.bell.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.fort.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.skaven_stronghold.level_id
			}, diff) then
				count = count + 1
			end

			return count >= 4
		end,
		progress = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.hard.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.elven_ruins.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.bell.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.fort.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.skaven_stronghold.level_id
			}, diff) then
				count = count + 1
			end

			return {
				count,
				4
			}
		end,
		requirements = function (statistics_db, stats_id)
			local diff = DifficultySettings.hard.rank
			local complete_elven_ruins = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.elven_ruins.level_id
			}, diff)
			local complete_bell = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.bell.level_id
			}, diff)
			local complete_fort = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.fort.level_id
			}, diff)
			local complete_skaven_stronghold = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.skaven_stronghold.level_id
			}, diff)

			return {
				{
					name = "level_name_elven_ruins",
					completed = complete_elven_ruins
				},
				{
					name = "level_name_bell",
					completed = complete_bell
				},
				{
					name = "level_name_forest_fort",
					completed = complete_fort
				},
				{
					name = "level_name_skaven_stronghold",
					completed = complete_skaven_stronghold
				}
			}
		end
	},
	complete_act_two_champion = {
		reward = "level_chest",
		name = "achv_complete_act_two_champion_name",
		icon = "icons_placeholder",
		desc = "achv_complete_act_two_champion_desc",
		completed = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.harder.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.elven_ruins.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.bell.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.fort.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.skaven_stronghold.level_id
			}, diff) then
				count = count + 1
			end

			return count >= 4
		end,
		progress = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.harder.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.elven_ruins.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.bell.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.fort.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.skaven_stronghold.level_id
			}, diff) then
				count = count + 1
			end

			return {
				count,
				4
			}
		end,
		requirements = function (statistics_db, stats_id)
			local diff = DifficultySettings.harder.rank
			local complete_elven_ruins = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.elven_ruins.level_id
			}, diff)
			local complete_bell = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.bell.level_id
			}, diff)
			local complete_fort = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.fort.level_id
			}, diff)
			local complete_skaven_stronghold = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.skaven_stronghold.level_id
			}, diff)

			return {
				{
					name = "level_name_elven_ruins",
					completed = complete_elven_ruins
				},
				{
					name = "level_name_bell",
					completed = complete_bell
				},
				{
					name = "level_name_forest_fort",
					completed = complete_fort
				},
				{
					name = "level_name_skaven_stronghold",
					completed = complete_skaven_stronghold
				}
			}
		end
	},
	complete_act_two_legend = {
		reward = "level_chest",
		name = "achv_complete_act_two_legend_name",
		icon = "icons_placeholder",
		desc = "achv_complete_act_two_legend_desc",
		completed = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.hardest.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.elven_ruins.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.bell.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.fort.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.skaven_stronghold.level_id
			}, diff) then
				count = count + 1
			end

			return count >= 4
		end,
		progress = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.hardest.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.elven_ruins.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.bell.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.fort.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.skaven_stronghold.level_id
			}, diff) then
				count = count + 1
			end

			return {
				count,
				4
			}
		end,
		requirements = function (statistics_db, stats_id)
			local diff = DifficultySettings.hardest.rank
			local complete_elven_ruins = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.elven_ruins.level_id
			}, diff)
			local complete_bell = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.bell.level_id
			}, diff)
			local complete_fort = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.fort.level_id
			}, diff)
			local complete_skaven_stronghold = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.skaven_stronghold.level_id
			}, diff)

			return {
				{
					name = "level_name_elven_ruins",
					completed = complete_elven_ruins
				},
				{
					name = "level_name_bell",
					completed = complete_bell
				},
				{
					name = "level_name_forest_fort",
					completed = complete_fort
				},
				{
					name = "level_name_skaven_stronghold",
					completed = complete_skaven_stronghold
				}
			}
		end
	},
	complete_act_three = {
		ID_XB1 = 5,
		name = "achv_complete_act_three_name",
		reward = "level_chest",
		desc = "achv_complete_act_three_desc",
		ID_STEAM = "complete_act_three",
		icon = "achievement_trophy_04",
		completed = function (statistics_db, stats_id)
			return LevelUnlockUtils.act_completed(statistics_db, stats_id, "act_3")
		end,
		progress = function (statistics_db, stats_id)
			local count = 0

			if check_level_list(statistics_db, stats_id, {
				LevelSettings.farmlands.level_id
			}) then
				count = count + 1
			end

			if check_level_list(statistics_db, stats_id, {
				LevelSettings.ussingen.level_id
			}) then
				count = count + 1
			end

			if check_level_list(statistics_db, stats_id, {
				LevelSettings.nurgle.level_id
			}) then
				count = count + 1
			end

			if check_level_list(statistics_db, stats_id, {
				LevelSettings.warcamp.level_id
			}) then
				count = count + 1
			end

			return {
				count,
				4
			}
		end,
		requirements = function (statistics_db, stats_id)
			local complete_farmlands = check_level_list(statistics_db, stats_id, {
				LevelSettings.farmlands.level_id
			})
			local complete_ussingen = check_level_list(statistics_db, stats_id, {
				LevelSettings.ussingen.level_id
			})
			local complete_nurgle = check_level_list(statistics_db, stats_id, {
				LevelSettings.nurgle.level_id
			})
			local complete_warcamp = check_level_list(statistics_db, stats_id, {
				LevelSettings.warcamp.level_id
			})

			return {
				{
					name = "level_name_farmlands",
					completed = complete_farmlands
				},
				{
					name = "level_name_ussingen",
					completed = complete_ussingen
				},
				{
					name = "level_name_nurgle",
					completed = complete_nurgle
				},
				{
					name = "level_name_warcamp",
					completed = complete_warcamp
				}
			}
		end
	},
	complete_act_three_veteran = {
		reward = "level_chest",
		name = "achv_complete_act_three_veteran_name",
		icon = "icons_placeholder",
		desc = "achv_complete_act_three_veteran_desc",
		completed = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.hard.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.farmlands.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.ussingen.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.nurgle.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.warcamp.level_id
			}, diff) then
				count = count + 1
			end

			return count >= 4
		end,
		progress = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.hard.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.farmlands.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.ussingen.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.nurgle.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.warcamp.level_id
			}, diff) then
				count = count + 1
			end

			return {
				count,
				4
			}
		end,
		requirements = function (statistics_db, stats_id)
			local diff = DifficultySettings.hard.rank
			local complete_farmlands = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.farmlands.level_id
			}, diff)
			local complete_ussingen = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.ussingen.level_id
			}, diff)
			local complete_nurgle = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.nurgle.level_id
			}, diff)
			local complete_warcamp = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.warcamp.level_id
			}, diff)

			return {
				{
					name = "level_name_farmlands",
					completed = complete_farmlands
				},
				{
					name = "level_name_ussingen",
					completed = complete_ussingen
				},
				{
					name = "level_name_nurgle",
					completed = complete_nurgle
				},
				{
					name = "level_name_warcamp",
					completed = complete_warcamp
				}
			}
		end
	},
	complete_act_three_champion = {
		reward = "level_chest",
		name = "achv_complete_act_three_champion_name",
		icon = "icons_placeholder",
		desc = "achv_complete_act_three_champion_desc",
		completed = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.harder.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.farmlands.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.ussingen.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.nurgle.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.warcamp.level_id
			}, diff) then
				count = count + 1
			end

			return count >= 4
		end,
		progress = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.harder.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.farmlands.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.ussingen.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.nurgle.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.warcamp.level_id
			}, diff) then
				count = count + 1
			end

			return {
				count,
				4
			}
		end,
		requirements = function (statistics_db, stats_id)
			local diff = DifficultySettings.harder.rank
			local complete_farmlands = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.farmlands.level_id
			}, diff)
			local complete_ussingen = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.ussingen.level_id
			}, diff)
			local complete_nurgle = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.nurgle.level_id
			}, diff)
			local complete_warcamp = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.warcamp.level_id
			}, diff)

			return {
				{
					name = "level_name_farmlands",
					completed = complete_farmlands
				},
				{
					name = "level_name_ussingen",
					completed = complete_ussingen
				},
				{
					name = "level_name_nurgle",
					completed = complete_nurgle
				},
				{
					name = "level_name_warcamp",
					completed = complete_warcamp
				}
			}
		end
	},
	complete_act_three_legend = {
		reward = "level_chest",
		name = "achv_complete_act_three_legend_name",
		icon = "icons_placeholder",
		desc = "achv_complete_act_three_legend_desc",
		completed = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.hardest.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.farmlands.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.ussingen.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.nurgle.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.warcamp.level_id
			}, diff) then
				count = count + 1
			end

			return count >= 4
		end,
		progress = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.hardest.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.farmlands.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.ussingen.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.nurgle.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.warcamp.level_id
			}, diff) then
				count = count + 1
			end

			return {
				count,
				4
			}
		end,
		requirements = function (statistics_db, stats_id)
			local diff = DifficultySettings.hardest.rank
			local complete_farmlands = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.farmlands.level_id
			}, diff)
			local complete_ussingen = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.ussingen.level_id
			}, diff)
			local complete_nurgle = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.nurgle.level_id
			}, diff)
			local complete_warcamp = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.warcamp.level_id
			}, diff)

			return {
				{
					name = "level_name_farmlands",
					completed = complete_farmlands
				},
				{
					name = "level_name_ussingen",
					completed = complete_ussingen
				},
				{
					name = "level_name_nurgle",
					completed = complete_nurgle
				},
				{
					name = "level_name_warcamp",
					completed = complete_warcamp
				}
			}
		end
	},
	complete_skittergate_recruit = {
		ID_XB1 = 6,
		name = "achv_complete_skittergate_normal_name",
		ID_STEAM = "complete_skittergate_recruit",
		reward = "level_chest",
		icon = "achievement_trophy_05",
		desc = "achv_complete_skittergate_normal_desc",
		completed = function (statistics_db, stats_id)
			local diff = DifficultySettings.normal.rank

			return check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.skittergate.level_id
			}, diff)
		end
	},
	complete_skittergate_veteran = {
		ID_XB1 = 7,
		name = "achv_complete_skittergate_hard_name",
		ID_STEAM = "complete_skittergate_veteran",
		reward = "level_chest",
		icon = "achievement_trophy_06",
		desc = "achv_complete_skittergate_hard_desc",
		completed = function (statistics_db, stats_id)
			local diff = DifficultySettings.hard.rank

			return check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.skittergate.level_id
			}, diff)
		end
	},
	complete_skittergate_champion = {
		ID_XB1 = 8,
		name = "achv_complete_skittergate_nightmare_name",
		ID_STEAM = "complete_skittergate_champion",
		reward = "level_chest",
		icon = "achievement_trophy_07",
		desc = "achv_complete_skittergate_nightmare_desc",
		completed = function (statistics_db, stats_id)
			local diff = DifficultySettings.harder.rank

			return check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.skittergate.level_id
			}, diff)
		end
	},
	complete_skittergate_legend = {
		ID_XB1 = 9,
		name = "achv_complete_skittergate_cataclysm_name",
		ID_STEAM = "complete_skittergate_legend",
		reward = "level_chest",
		icon = "achievement_trophy_08",
		desc = "achv_complete_skittergate_cataclysm_desc",
		completed = function (statistics_db, stats_id)
			local diff = DifficultySettings.hardest.rank

			return check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.skittergate.level_id
			}, diff)
		end
	},
	bogenhafen_complete_recruit = {
		reward = "frame_bogenhafen_01",
		name = "achv_bogenhafen_complete_recruit_name",
		icon = "icons_placeholder",
		required_dlc = "bogenhafen",
		desc = "achv_bogenhafen_complete_recruit_desc",
		completed = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.normal.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_slum.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_city.level_id
			}, diff) then
				count = count + 1
			end

			return count >= 2
		end,
		progress = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.normal.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_slum.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_city.level_id
			}, diff) then
				count = count + 1
			end

			return {
				count,
				2
			}
		end,
		requirements = function (statistics_db, stats_id)
			local diff = DifficultySettings.normal.rank
			local complete_slum = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_slum.level_id
			}, diff)
			local complete_city = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_city.level_id
			}, diff)

			return {
				{
					name = "level_name_slum",
					completed = complete_slum
				},
				{
					name = "level_name_city",
					completed = complete_city
				}
			}
		end
	},
	bogenhafen_complete_veteran = {
		reward = "frame_bogenhafen_02",
		name = "achv_bogenhafen_complete_veteran_name",
		icon = "icons_placeholder",
		required_dlc = "bogenhafen",
		desc = "achv_bogenhafen_complete_veteran_desc",
		completed = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.hard.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_slum.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_city.level_id
			}, diff) then
				count = count + 1
			end

			return count >= 2
		end,
		progress = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.hard.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_slum.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_city.level_id
			}, diff) then
				count = count + 1
			end

			return {
				count,
				2
			}
		end,
		requirements = function (statistics_db, stats_id)
			local diff = DifficultySettings.hard.rank
			local complete_slum = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_slum.level_id
			}, diff)
			local complete_city = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_city.level_id
			}, diff)

			return {
				{
					name = "level_name_slum",
					completed = complete_slum
				},
				{
					name = "level_name_city",
					completed = complete_city
				}
			}
		end
	},
	bogenhafen_complete_champion = {
		reward = "frame_bogenhafen_03",
		name = "achv_bogenhafen_complete_champion_name",
		icon = "icons_placeholder",
		required_dlc = "bogenhafen",
		desc = "achv_bogenhafen_complete_champion_desc",
		completed = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.harder.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_slum.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_city.level_id
			}, diff) then
				count = count + 1
			end

			return count >= 2
		end,
		progress = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.harder.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_slum.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_city.level_id
			}, diff) then
				count = count + 1
			end

			return {
				count,
				2
			}
		end,
		requirements = function (statistics_db, stats_id)
			local diff = DifficultySettings.harder.rank
			local complete_slum = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_slum.level_id
			}, diff)
			local complete_city = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_city.level_id
			}, diff)

			return {
				{
					name = "level_name_slum",
					completed = complete_slum
				},
				{
					name = "level_name_city",
					completed = complete_city
				}
			}
		end
	},
	bogenhafen_complete_legend = {
		reward = "frame_bogenhafen_04",
		name = "achv_bogenhafen_complete_legend_name",
		icon = "icons_placeholder",
		required_dlc = "bogenhafen",
		desc = "achv_bogenhafen_complete_legend_desc",
		completed = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.hardest.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_slum.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_city.level_id
			}, diff) then
				count = count + 1
			end

			return count >= 2
		end,
		progress = function (statistics_db, stats_id)
			local count = 0
			local diff = DifficultySettings.hardest.rank

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_slum.level_id
			}, diff) then
				count = count + 1
			end

			if check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_city.level_id
			}, diff) then
				count = count + 1
			end

			return {
				count,
				2
			}
		end,
		requirements = function (statistics_db, stats_id)
			local diff = DifficultySettings.hardest.rank
			local complete_slum = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_slum.level_id
			}, diff)
			local complete_city = check_level_list_difficulty(statistics_db, stats_id, {
				LevelSettings.dlc_bogenhafen_city.level_id
			}, diff)

			return {
				{
					name = "level_name_slum",
					completed = complete_slum
				},
				{
					name = "level_name_city",
					completed = complete_city
				}
			}
		end
	},
	bogenhafen_city_no_braziers_lit = {
		ID_XB1 = 56,
		name = "achv_bogenhafen_city_no_braziers_lit_name",
		required_dlc = "bogenhafen",
		reward = "bogenhafen_chest",
		icon = "achievement_trophy_bogenhafen_city_no_braziers_lit",
		desc = "achv_bogenhafen_city_no_braziers_lit_desc",
		completed = function (statistics_db, stats_id)
			return statistics_db:get_persistent_stat(stats_id, "bogenhafen_city_no_braziers_lit") > 0
		end
	},
	bogenhafen_city_torch_not_picked_up = {
		reward = "bogenhafen_chest",
		name = "achv_bogenhafen_city_torch_not_picked_up_name",
		required_dlc = "bogenhafen",
		icon = "achievement_trophy_bogenhafen_city_torch_not_picked_up",
		desc = "achv_bogenhafen_city_torch_not_picked_up_desc",
		completed = function (statistics_db, stats_id)
			return statistics_db:get_persistent_stat(stats_id, "bogenhafen_city_torch_not_picked_up") > 0
		end
	},
	bogenhafen_city_fast_switches = {
		ID_XB1 = 57,
		name = "achv_bogenhafen_city_fast_switches_name",
		required_dlc = "bogenhafen",
		reward = "bogenhafen_chest",
		icon = "achievement_trophy_bogenhafen_city_fast_switches",
		desc = "achv_bogenhafen_city_fast_switches_desc",
		completed = function (statistics_db, stats_id)
			return statistics_db:get_persistent_stat(stats_id, "bogenhafen_city_fast_switches") > 0
		end
	},
	bogenhafen_city_all_wine_collected = {
		ID_XB1 = 58,
		name = "achv_bogenhafen_city_all_wine_collected_name",
		required_dlc = "bogenhafen",
		reward = "bogenhafen_chest",
		icon = "achievement_trophy_bogenhafen_city_all_wine_collected",
		desc = "achv_bogenhafen_city_all_wine_collected_desc",
		completed = function (statistics_db, stats_id)
			return statistics_db:get_persistent_stat(stats_id, "bogenhafen_city_all_wine_collected") > 0
		end
	},
	bogenhafen_city_jumping_puzzle = {
		reward = "bogenhafen_chest",
		name = "achv_bogenhafen_city_jumping_puzzle_name",
		required_dlc = "bogenhafen",
		icon = "achievement_trophy_bogenhafen_city_jumping_puzzle",
		desc = "achv_bogenhafen_city_jumping_puzzle_desc",
		completed = function (statistics_db, stats_id)
			return statistics_db:get_persistent_stat(stats_id, "bogenhafen_city_jumping_puzzle") > 0
		end
	},
	bogenhafen_slum_no_ratling_damage = {
		ID_XB1 = 59,
		name = "achv_bogenhafen_slum_no_ratling_damage_name",
		required_dlc = "bogenhafen",
		reward = "bogenhafen_chest",
		icon = "achievement_trophy_bogenhafen_slum_no_ratling_damage",
		desc = "achv_bogenhafen_slum_no_ratling_damage_desc",
		completed = function (statistics_db, stats_id)
			return statistics_db:get_persistent_stat(stats_id, "bogenhafen_slum_no_ratling_damage") > 0
		end
	},
	bogenhafen_slum_no_windows_broken = {
		reward = "bogenhafen_chest",
		name = "achv_bogenhafen_slum_no_windows_broken_name",
		required_dlc = "bogenhafen",
		icon = "achievement_trophy_bogenhafen_slum_no_windows_broken",
		desc = "achv_bogenhafen_slum_no_windows_broken_desc",
		completed = function (statistics_db, stats_id)
			return statistics_db:get_persistent_stat(stats_id, "bogenhafen_slum_no_windows_broken") > 0
		end
	},
	bogenhafen_slum_find_hidden_stash = {
		ID_XB1 = 60,
		name = "achv_bogenhafen_slum_find_hidden_stash_name",
		required_dlc = "bogenhafen",
		reward = "bogenhafen_chest",
		icon = "achievement_trophy_bogenhafen_slum_find_hidden_stash",
		desc = "achv_bogenhafen_slum_find_hidden_stash_desc",
		completed = function (statistics_db, stats_id)
			return statistics_db:get_persistent_stat(stats_id, "bogenhafen_slum_find_hidden_stash") > 0
		end
	},
	bogenhafen_slum_jumping_puzzle = {
		reward = "bogenhafen_chest",
		name = "achv_bogenhafen_slum_jumping_puzzle_name",
		required_dlc = "bogenhafen",
		icon = "achievement_trophy_bogenhafen_slum_jumping_puzzle",
		desc = "achv_bogenhafen_slum_jumping_puzzle_desc",
		completed = function (statistics_db, stats_id)
			return statistics_db:get_persistent_stat(stats_id, "bogenhafen_slum_jumping_puzzle") > 0
		end
	},
	bogenhafen_slum_event_speedrun = {
		ID_XB1 = 61,
		name = "achv_bogenhafen_slum_event_speedrun_name",
		required_dlc = "bogenhafen",
		reward = "bogenhafen_chest",
		icon = "achievement_trophy_bogenhafen_slum_event_speedrun",
		desc = "achv_bogenhafen_slum_event_speedrun_desc",
		completed = function (statistics_db, stats_id)
			return statistics_db:get_persistent_stat(stats_id, "bogenhafen_slum_event_speedrun") > 0
		end
	}
}

local function remove_prologue(levels)
	local prologue_index = nil

	for i, level in ipairs(levels) do
		if level == "prologue" then
			prologue_index = i
		end
	end

	local ret = levels

	if prologue_index then
		table.remove(ret, prologue_index)
	end

	return ret
end

local main_game_levels = remove_prologue(MainGameLevels)
local completed_all_levels = {}
AchievementTemplates.achievements.completed_all_levels = {
	name = "achv_complete_all_levels_name",
	desc = "achv_complete_all_levels_desc",
	completed = function (statistics_db, stats_id)
		return check_level_list(statistics_db, stats_id, main_game_levels)
	end,
	progress = function (statistics_db, stats_id)
		local count = 0

		for _, level in ipairs(main_game_levels) do
			if check_level_list(statistics_db, stats_id, {
				level
			}) then
				count = count + 1
			end
		end

		return {
			count,
			#main_game_levels
		}
	end,
	requirements = function (statistics_db, stats_id)
		table.clear(completed_all_levels)

		for _, level in ipairs(main_game_levels) do
			local completed = check_level_list(statistics_db, stats_id, {
				level
			})

			table.insert(completed_all_levels, {
				name = LevelSettings[level].display_name,
				completed = completed
			})
		end

		return completed_all_levels
	end
}
AchievementTemplates.achievements.achievement_bardin_level_1 = {
	reward = "ranger_hat_0003",
	name = "achv_achievement_bardin_level_1_name",
	icon = "achievement_trophy_bardin_level_1",
	desc = "achv_achievement_bardin_level_1_desc",
	completed = function (statistics_db, stats_id)
		return hero_level("dwarf_ranger") >= 17
	end,
	progress = function (statistics_db, stats_id)
		local level = hero_level("dwarf_ranger")

		if level > 17 then
			level = 17
		end

		return {
			level,
			17
		}
	end
}
AchievementTemplates.achievements.achievement_bardin_level_2 = {
	reward = "ironbreaker_hat_0007",
	name = "achv_achievement_bardin_level_2_name",
	icon = "achievement_trophy_bardin_level_2",
	desc = "achv_achievement_bardin_level_2_desc",
	completed = function (statistics_db, stats_id)
		return hero_level("dwarf_ranger") >= 22
	end,
	progress = function (statistics_db, stats_id)
		local level = hero_level("dwarf_ranger")

		if level > 22 then
			level = 22
		end

		return {
			level,
			22
		}
	end
}
AchievementTemplates.achievements.achievement_bardin_level_3 = {
	reward = "slayer_hat_0007",
	name = "achv_achievement_bardin_level_3_name",
	icon = "achievement_trophy_bardin_level_3",
	desc = "achv_achievement_bardin_level_3_desc",
	completed = function (statistics_db, stats_id)
		return hero_level("dwarf_ranger") >= 27
	end,
	progress = function (statistics_db, stats_id)
		local level = hero_level("dwarf_ranger")

		if level > 27 then
			level = 27
		end

		return {
			level,
			27
		}
	end
}
AchievementTemplates.achievements.achievement_markus_level_1 = {
	reward = "mercenary_hat_0006",
	name = "achv_achievement_markus_level_1_name",
	icon = "achievement_trophy_markus_level_1",
	desc = "achv_achievement_markus_level_1_desc",
	completed = function (statistics_db, stats_id)
		return hero_level("empire_soldier") >= 17
	end,
	progress = function (statistics_db, stats_id)
		local level = hero_level("empire_soldier")

		if level > 17 then
			level = 17
		end

		return {
			level,
			17
		}
	end
}
AchievementTemplates.achievements.achievement_markus_level_2 = {
	reward = "huntsman_hat_0004",
	name = "achv_achievement_markus_level_2_name",
	icon = "achievement_trophy_markus_level_2",
	desc = "achv_achievement_markus_level_2_desc",
	completed = function (statistics_db, stats_id)
		return hero_level("empire_soldier") >= 22
	end,
	progress = function (statistics_db, stats_id)
		local level = hero_level("empire_soldier")

		if level > 22 then
			level = 22
		end

		return {
			level,
			22
		}
	end
}
AchievementTemplates.achievements.achievement_markus_level_3 = {
	reward = "knight_hat_0003",
	name = "achv_achievement_markus_level_3_name",
	icon = "achievement_trophy_markus_level_3",
	desc = "achv_achievement_markus_level_3_desc",
	completed = function (statistics_db, stats_id)
		return hero_level("empire_soldier") >= 27
	end,
	progress = function (statistics_db, stats_id)
		local level = hero_level("empire_soldier")

		if level > 27 then
			level = 27
		end

		return {
			level,
			27
		}
	end
}
AchievementTemplates.achievements.achievement_kerillian_level_1 = {
	reward = "waywatcher_hat_0006",
	name = "achv_achievement_kerillian_level_1_name",
	icon = "achievement_trophy_kerillian_level_1",
	desc = "achv_achievement_kerillian_level_1_desc",
	completed = function (statistics_db, stats_id)
		return hero_level("wood_elf") >= 17
	end,
	progress = function (statistics_db, stats_id)
		local level = hero_level("wood_elf")

		if level > 17 then
			level = 17
		end

		return {
			level,
			17
		}
	end
}
AchievementTemplates.achievements.achievement_kerillian_level_2 = {
	reward = "maidenguard_hat_0005",
	name = "achv_achievement_kerillian_level_2_name",
	icon = "achievement_trophy_kerillian_level_2",
	desc = "achv_achievement_kerillian_level_2_desc",
	completed = function (statistics_db, stats_id)
		return hero_level("wood_elf") >= 22
	end,
	progress = function (statistics_db, stats_id)
		local level = hero_level("wood_elf")

		if level > 22 then
			level = 22
		end

		return {
			level,
			22
		}
	end
}
AchievementTemplates.achievements.achievement_kerillian_level_3 = {
	reward = "shade_hat_0010",
	name = "achv_achievement_kerillian_level_3_name",
	icon = "achievement_trophy_kerillian_level_3",
	desc = "achv_achievement_kerillian_level_3_desc",
	completed = function (statistics_db, stats_id)
		return hero_level("wood_elf") >= 27
	end,
	progress = function (statistics_db, stats_id)
		local level = hero_level("wood_elf")

		if level > 27 then
			level = 27
		end

		return {
			level,
			27
		}
	end
}
AchievementTemplates.achievements.achievement_sienna_level_1 = {
	reward = "adept_hat_0002",
	name = "achv_achievement_sienna_level_1_name",
	icon = "achievement_trophy_sienna_level_1",
	desc = "achv_achievement_sienna_level_1_desc",
	completed = function (statistics_db, stats_id)
		return hero_level("bright_wizard") >= 17
	end,
	progress = function (statistics_db, stats_id)
		local level = hero_level("bright_wizard")

		if level > 17 then
			level = 17
		end

		return {
			level,
			17
		}
	end
}
AchievementTemplates.achievements.achievement_sienna_level_2 = {
	reward = "scholar_hat_0004",
	name = "achv_achievement_sienna_level_2_name",
	icon = "achievement_trophy_sienna_level_2",
	desc = "achv_achievement_sienna_level_2_desc",
	completed = function (statistics_db, stats_id)
		return hero_level("bright_wizard") >= 22
	end,
	progress = function (statistics_db, stats_id)
		local level = hero_level("bright_wizard")

		if level > 22 then
			level = 22
		end

		return {
			level,
			22
		}
	end
}
AchievementTemplates.achievements.achievement_sienna_level_3 = {
	reward = "unchained_hat_0008",
	name = "achv_achievement_sienna_level_3_name",
	icon = "achievement_trophy_sienna_level_3",
	desc = "achv_achievement_sienna_level_3_desc",
	completed = function (statistics_db, stats_id)
		return hero_level("bright_wizard") >= 27
	end,
	progress = function (statistics_db, stats_id)
		local level = hero_level("bright_wizard")

		if level > 27 then
			level = 27
		end

		return {
			level,
			27
		}
	end
}
AchievementTemplates.achievements.achievement_victor_level_1 = {
	reward = "witchhunter_hat_0003",
	name = "achv_achievement_victor_level_1_name",
	icon = "achievement_trophy_victor_level_1",
	desc = "achv_achievement_victor_level_1_desc",
	completed = function (statistics_db, stats_id)
		return hero_level("witch_hunter") >= 17
	end,
	progress = function (statistics_db, stats_id)
		local level = hero_level("witch_hunter")

		if level > 17 then
			level = 17
		end

		return {
			level,
			17
		}
	end
}
AchievementTemplates.achievements.achievement_victor_level_2 = {
	reward = "bountyhunter_hat_0002",
	name = "achv_achievement_victor_level_2_name",
	icon = "achievement_trophy_victor_level_2",
	desc = "achv_achievement_victor_level_2_desc",
	completed = function (statistics_db, stats_id)
		return hero_level("witch_hunter") >= 22
	end,
	progress = function (statistics_db, stats_id)
		local level = hero_level("witch_hunter")

		if level > 22 then
			level = 22
		end

		return {
			level,
			22
		}
	end
}
AchievementTemplates.achievements.achievement_victor_level_3 = {
	reward = "zealot_hat_0009",
	name = "achv_achievement_victor_level_3_name",
	icon = "achievement_trophy_victor_level_3",
	desc = "achv_achievement_victor_level_3_desc",
	completed = function (statistics_db, stats_id)
		return hero_level("witch_hunter") >= 27
	end,
	progress = function (statistics_db, stats_id)
		local level = hero_level("witch_hunter")

		if level > 27 then
			level = 27
		end

		return {
			level,
			27
		}
	end
}
AchievementTemplates.achievements.level_thirty_wood_elf = {
	ID_XB1 = 10,
	name = "achv_level_thirty_wood_elf_name",
	ID_STEAM = "level_thirty_wood_elf",
	icon = "achievement_trophy_09",
	reward = "level_chest",
	desc = "achv_level_thirty_wood_elf_desc",
	completed = function (statistics_db, stats_id)
		return hero_level("wood_elf") >= 30
	end,
	progress = function (statistics_db, stats_id)
		local level = hero_level("wood_elf")

		if level > 30 then
			level = 30
		end

		return {
			level,
			30
		}
	end
}
AchievementTemplates.achievements.level_thirty_witch_hunter = {
	ID_XB1 = 11,
	name = "achv_level_thirty_witch_hunter_name",
	ID_STEAM = "level_thirty_witch_hunter",
	icon = "achievement_trophy_10",
	reward = "level_chest",
	desc = "achv_level_thirty_witch_hunter_desc",
	completed = function (statistics_db, stats_id)
		return hero_level("witch_hunter") >= 30
	end,
	progress = function (statistics_db, stats_id)
		local level = hero_level("witch_hunter")

		if level > 30 then
			level = 30
		end

		return {
			level,
			30
		}
	end
}
AchievementTemplates.achievements.level_thirty_empire_soldier = {
	ID_XB1 = 12,
	name = "achv_level_thirty_empire_soldier_name",
	ID_STEAM = "level_thirty_empire_soldier",
	icon = "achievement_trophy_11",
	reward = "level_chest",
	desc = "achv_level_thirty_empire_soldier_desc",
	completed = function (statistics_db, stats_id)
		return hero_level("empire_soldier") >= 30
	end,
	progress = function (statistics_db, stats_id)
		local level = hero_level("empire_soldier")

		if level > 30 then
			level = 30
		end

		return {
			level,
			30
		}
	end
}
AchievementTemplates.achievements.level_thirty_bright_wizard = {
	ID_XB1 = 13,
	name = "achv_level_thirty_bright_wizard_name",
	ID_STEAM = "level_thirty_bright_wizard",
	icon = "achievement_trophy_12",
	reward = "level_chest",
	desc = "achv_level_thirty_bright_wizard_desc",
	completed = function (statistics_db, stats_id)
		return hero_level("bright_wizard") >= 30
	end,
	progress = function (statistics_db, stats_id)
		local level = hero_level("bright_wizard")

		if level > 30 then
			level = 30
		end

		return {
			level,
			30
		}
	end
}
AchievementTemplates.achievements.level_thirty_dwarf_ranger = {
	ID_XB1 = 14,
	name = "achv_level_thirty_dwarf_ranger_name",
	ID_STEAM = "level_thirty_dwarf_ranger",
	icon = "achievement_trophy_13",
	reward = "level_chest",
	desc = "achv_level_thirty_dwarf_ranger_desc",
	completed = function (statistics_db, stats_id)
		return hero_level("dwarf_ranger") >= 30
	end,
	progress = function (statistics_db, stats_id)
		local level = hero_level("dwarf_ranger")

		if level > 30 then
			level = 30
		end

		return {
			level,
			30
		}
	end
}
AchievementTemplates.achievements.level_thirty_all = {
	ID_XB1 = 15,
	name = "achv_level_thirty_all_name",
	reward = "level_chest",
	desc = "achv_level_thirty_all_desc",
	ID_STEAM = "level_thirty_all",
	icon = "achievement_trophy_14",
	completed = function (statistics_db, stats_id)
		return hero_level("wood_elf") >= 30 and hero_level("witch_hunter") >= 30 and hero_level("empire_soldier") >= 30 and hero_level("bright_wizard") >= 30 and hero_level("dwarf_ranger") >= 30
	end,
	progress = function (statistics_db, stats_id)
		local count = 0

		if hero_level("wood_elf") >= 30 then
			count = count + 1
		end

		if hero_level("witch_hunter") >= 30 then
			count = count + 1
		end

		if hero_level("empire_soldier") >= 30 then
			count = count + 1
		end

		if hero_level("bright_wizard") >= 30 then
			count = count + 1
		end

		if hero_level("dwarf_ranger") >= 30 then
			count = count + 1
		end

		return {
			count,
			5
		}
	end,
	requirements = function (statistics_db, stats_id)
		local wood_elf = hero_level("wood_elf")
		local witch_hunter = hero_level("witch_hunter")
		local empire_soldier = hero_level("empire_soldier")
		local bright_wizard = hero_level("bright_wizard")
		local dwarf_ranger = hero_level("dwarf_ranger")

		return {
			{
				name = "wood_elf_short",
				completed = wood_elf >= 30
			},
			{
				name = "witch_hunter_short",
				completed = witch_hunter >= 30
			},
			{
				name = "empire_soldier_short",
				completed = empire_soldier >= 30
			},
			{
				name = "bright_wizard_short",
				completed = bright_wizard >= 30
			},
			{
				name = "dwarf_ranger_short",
				completed = dwarf_ranger >= 30
			}
		}
	end
}
AchievementTemplates.achievements.unlock_first_talent_point = {
	ID_XB1 = 16,
	name = "achv_unlock_first_talent_point_name",
	ID_STEAM = "unlock_first_talent_point",
	reward = "level_chest",
	icon = "achievement_trophy_15",
	desc = "achv_unlock_first_talent_point_desc",
	completed = function (statistics_db, stats_id)
		local heroes = {
			"wood_elf",
			"witch_hunter",
			"empire_soldier",
			"bright_wizard",
			"dwarf_ranger"
		}

		for _, hero in ipairs(heroes) do
			if ProgressionUnlocks.get_num_talent_points(hero) >= 1 then
				return true
			end
		end

		return false
	end
}
AchievementTemplates.achievements.unlock_all_talent_points = {
	ID_XB1 = 17,
	name = "achv_unlock_all_talent_points_name",
	ID_STEAM = "unlock_all_talent_points",
	reward = "level_chest",
	icon = "achievement_trophy_16",
	desc = "achv_unlock_all_talent_points_desc",
	completed = function (statistics_db, stats_id)
		local heroes = {
			"wood_elf",
			"witch_hunter",
			"empire_soldier",
			"bright_wizard",
			"dwarf_ranger"
		}

		for _, hero in ipairs(heroes) do
			if ProgressionUnlocks.get_num_talent_points(hero) == 5 then
				return true
			end
		end

		return false
	end
}
AchievementTemplates.achievements.craft_item = {
	ID_XB1 = 18,
	name = "achv_craft_item_name",
	ID_STEAM = "craft_item",
	reward = "level_chest",
	icon = "achievement_trophy_17",
	desc = "achv_craft_item_desc",
	completed = function (statistics_db, stats_id)
		local crafted_items = statistics_db:get_persistent_stat(stats_id, "crafted_items")

		return crafted_items >= 1
	end
}
AchievementTemplates.achievements.craft_fifty_items = {
	ID_XB1 = 19,
	name = "achv_craft_fifty_items_name",
	ID_STEAM = "craft_fifty_items",
	icon = "achievement_trophy_18",
	reward = "level_chest",
	desc = "achv_craft_fifty_items_desc",
	completed = function (statistics_db, stats_id)
		local crafted_items = statistics_db:get_persistent_stat(stats_id, "crafted_items")

		return crafted_items >= 50
	end,
	progress = function (statistics_db, stats_id)
		local crafted_items = statistics_db:get_persistent_stat(stats_id, "crafted_items")

		if crafted_items > 50 then
			crafted_items = 50
		end

		return {
			crafted_items,
			50
		}
	end
}
AchievementTemplates.achievements.salvage_item = {
	ID_XB1 = 20,
	name = "achv_salvage_item_name",
	ID_STEAM = "salvage_item",
	reward = "level_chest",
	icon = "achievement_trophy_19",
	desc = "achv_salvage_item_desc",
	completed = function (statistics_db, stats_id)
		local crafted_items = statistics_db:get_persistent_stat(stats_id, "salvaged_items")

		return crafted_items >= 1
	end
}
AchievementTemplates.achievements.salvage_hundred_items = {
	ID_XB1 = 21,
	name = "achv_salvage_hundred_items_name",
	ID_STEAM = "salvage_hundred_items",
	icon = "achievement_trophy_20",
	reward = "level_chest",
	desc = "achv_salvage_hundred_items_desc",
	completed = function (statistics_db, stats_id)
		local crafted_items = statistics_db:get_persistent_stat(stats_id, "salvaged_items")

		return crafted_items >= 100
	end,
	progress = function (statistics_db, stats_id)
		local crafted_items = statistics_db:get_persistent_stat(stats_id, "salvaged_items")

		if crafted_items > 100 then
			crafted_items = 100
		end

		return {
			crafted_items,
			100
		}
	end
}
AchievementTemplates.achievements.equip_common_quality = {
	ID_XB1 = 22,
	name = "achv_equip_common_quality_name",
	ID_STEAM = "equip_common_quality",
	reward = "level_chest",
	icon = "achievement_trophy_21",
	desc = "achv_equip_common_quality_desc",
	completed = function (statistics_db, stats_id)
		local items = equipped_items_of_rarity(statistics_db, stats_id, "common")

		return items >= 1
	end
}
AchievementTemplates.achievements.equip_rare_quality = {
	ID_XB1 = 23,
	name = "achv_equip_rare_quality_name",
	ID_STEAM = "equip_rare_quality",
	reward = "level_chest",
	icon = "achievement_trophy_22",
	desc = "achv_equip_rare_quality_desc",
	completed = function (statistics_db, stats_id)
		local items = equipped_items_of_rarity(statistics_db, stats_id, "rare")

		return items >= 1
	end
}
AchievementTemplates.achievements.equip_exotic_quality = {
	ID_XB1 = 24,
	name = "achv_equip_exotic_quality_name",
	ID_STEAM = "equip_exotic_quality",
	reward = "level_chest",
	icon = "achievement_trophy_23",
	desc = "achv_equip_exotic_quality_desc",
	completed = function (statistics_db, stats_id)
		local items = equipped_items_of_rarity(statistics_db, stats_id, "exotic")

		return items >= 1
	end
}
AchievementTemplates.achievements.equip_all_exotic_quality = {
	ID_XB1 = 25,
	name = "achv_equip_all_exotic_quality_name",
	reward = "level_chest",
	desc = "achv_equip_all_exotic_quality_desc",
	ID_STEAM = "equip_all_exotic_quality",
	icon = "achievement_trophy_24",
	completed = function (statistics_db, stats_id)
		local items = equipped_items_of_rarity(statistics_db, stats_id, "exotic")

		return items == 5
	end,
	progress = function (statistics_db, stats_id)
		local items = equipped_items_of_rarity(statistics_db, stats_id, "exotic")

		return {
			items,
			5
		}
	end,
	requirements = function (statistics_db, stats_id)
		local melee = statistics_db:get_persistent_stat(stats_id, "highest_equipped_rarity", "melee")
		local ranged = statistics_db:get_persistent_stat(stats_id, "highest_equipped_rarity", "ranged")
		local necklace = statistics_db:get_persistent_stat(stats_id, "highest_equipped_rarity", "necklace")
		local ring = statistics_db:get_persistent_stat(stats_id, "highest_equipped_rarity", "ring")
		local trinket = statistics_db:get_persistent_stat(stats_id, "highest_equipped_rarity", "trinket")
		local required_rarity = rarity_index.exotic

		return {
			{
				name = "melee",
				completed = required_rarity <= melee
			},
			{
				name = "ranged",
				completed = required_rarity <= ranged
			},
			{
				name = "necklace",
				completed = required_rarity <= necklace
			},
			{
				name = "ring",
				completed = required_rarity <= ring
			},
			{
				name = "trinket",
				completed = required_rarity <= trinket
			}
		}
	end
}
AchievementTemplates.achievements.equip_veteran_quality = {
	ID_XB1 = 26,
	name = "achv_equip_veteran_quality_name",
	ID_STEAM = "equip_veteran_quality",
	reward = "level_chest",
	icon = "achievement_trophy_25",
	desc = "achv_equip_veteran_quality_desc",
	completed = function (statistics_db, stats_id)
		local items = equipped_items_of_rarity(statistics_db, stats_id, "unique")

		return items >= 1
	end
}
AchievementTemplates.achievements.equip_all_veteran_quality = {
	reward = "level_chest",
	name = "achv_equip_all_veteran_quality_name",
	icon = "achievement_trophy_equip_all_veteran_quality",
	desc = "achv_equip_all_veteran_quality_desc",
	completed = function (statistics_db, stats_id)
		local items = equipped_items_of_rarity(statistics_db, stats_id, "unique")

		return items == 5
	end,
	progress = function (statistics_db, stats_id)
		local items = equipped_items_of_rarity(statistics_db, stats_id, "unique")

		return {
			items,
			5
		}
	end,
	requirements = function (statistics_db, stats_id)
		local melee = statistics_db:get_persistent_stat(stats_id, "highest_equipped_rarity", "melee")
		local ranged = statistics_db:get_persistent_stat(stats_id, "highest_equipped_rarity", "ranged")
		local necklace = statistics_db:get_persistent_stat(stats_id, "highest_equipped_rarity", "necklace")
		local ring = statistics_db:get_persistent_stat(stats_id, "highest_equipped_rarity", "ring")
		local trinket = statistics_db:get_persistent_stat(stats_id, "highest_equipped_rarity", "trinket")
		local required_rarity = rarity_index.unique

		return {
			{
				name = "melee",
				completed = required_rarity <= melee
			},
			{
				name = "ranged",
				completed = required_rarity <= ranged
			},
			{
				name = "necklace",
				completed = required_rarity <= necklace
			},
			{
				name = "ring",
				completed = required_rarity <= ring
			},
			{
				name = "trinket",
				completed = required_rarity <= trinket
			}
		}
	end
}
AchievementTemplates.achievements.complete_level_all = {
	ID_XB1 = 27,
	name = "achv_complete_level_all_name",
	ID_STEAM = "complete_level_all",
	reward = "level_chest",
	icon = "achievement_trophy_26",
	desc = "achv_complete_level_all_desc",
	completed = function (statistics_db, stats_id)
		local heroes = {
			"bright_wizard",
			"wood_elf",
			"empire_soldier",
			"dwarf_ranger",
			"witch_hunter"
		}

		for level_key, _ in pairs(LevelSettings) do
			if table.contains(UnlockableLevels, level_key) then
				local all_completed = true

				for _, hero in ipairs(heroes) do
					local completed = statistics_db:get_persistent_stat(stats_id, "completed_levels_" .. hero, level_key)

					if completed == 0 then
						all_completed = false

						break
					end
				end

				if all_completed then
					return true
				end
			end
		end

		return false
	end
}
AchievementTemplates.completed_deed_limits = {
	10,
	25,
	50,
	100,
	200,
	300,
	400,
	500
}

for i, limit in ipairs(AchievementTemplates.completed_deed_limits) do
	local id = "complete_deeds_" .. i
	AchievementTemplates.achievements[id] = {
		name = "achv_complete_deeds_" .. i .. "_name",
		desc = function ()
			return string.format(Localize("achv_complete_deeds_desc"), limit)
		end,
		icon = "achievement_trophy_deeds_" .. i,
		reward = rewards_lookup[id],
		completed = function (statistics_db, stats_id)
			return limit <= statistics_db:get_persistent_stat(stats_id, "completed_heroic_deeds")
		end,
		progress = function (statistics_db, stats_id)
			local deeds = statistics_db:get_persistent_stat(stats_id, "completed_heroic_deeds")
			deeds = math.min(deeds, limit)

			return {
				deeds,
				limit
			}
		end
	}
end

AchievementTemplates.difficulties = {
	harder = "champion",
	hard = "veteran",
	hardest = "legend",
	normal = "recruit"
}

for diff_key, diff_id in pairs(AchievementTemplates.difficulties) do
	local id = "complete_all_helmgart_levels_" .. diff_id
	AchievementTemplates.achievements[id] = {
		name = "achv_complete_all_helmgart_levels_" .. diff_id .. "_name",
		desc = "achv_complete_all_helmgart_levels_" .. diff_id .. "_desc",
		icon = "achievement_trophy_complete_all_helmgart_levels_" .. diff_id,
		reward = rewards_lookup[id],
		completed = function (statistics_db, stats_id)
			return check_level_list_difficulty(statistics_db, stats_id, main_game_levels, DifficultySettings[diff_key].rank)
		end,
		progress = function (statistics_db, stats_id)
			local num_completed = 0

			for _, level in ipairs(main_game_levels) do
				if check_level_list_difficulty(statistics_db, stats_id, {
					level
				}, DifficultySettings[diff_key].rank) then
					num_completed = num_completed + 1
				end
			end

			return {
				num_completed,
				#main_game_levels
			}
		end,
		requirements = function (statistics_db, stats_id)
			local reqs = {}

			for _, level in ipairs(main_game_levels) do
				local completed = check_level_list_difficulty(statistics_db, stats_id, {
					level
				}, DifficultySettings[diff_key].rank)

				table.insert(reqs, {
					name = LevelSettings[level].display_name,
					completed = completed
				})
			end

			return reqs
		end
	}
end

for career, _ in pairs(CareerSettings) do
	if career ~= "empire_soldier_tutorial" then
		for diff_key, diff_id in pairs(AchievementTemplates.difficulties) do
			local id = "complete_all_helmgart_levels_" .. diff_id .. "_" .. career
			AchievementTemplates.achievements[id] = {
				name = "achv_complete_all_helmgart_levels_" .. diff_id .. "_" .. career .. "_name",
				desc = "achv_complete_all_helmgart_levels_" .. diff_id .. "_" .. career .. "_desc",
				icon = "achievement_trophy_" .. diff_id .. "_" .. career,
				reward = rewards_lookup[id],
				completed = function (statistics_db, stats_id)
					return check_level_list_difficulty(statistics_db, stats_id, main_game_levels, DifficultySettings[diff_key].rank, career)
				end,
				progress = function (statistics_db, stats_id)
					local num_completed = 0

					for _, level in ipairs(main_game_levels) do
						if check_level_list_difficulty(statistics_db, stats_id, {
							level
						}, DifficultySettings[diff_key].rank, career) then
							num_completed = num_completed + 1
						end
					end

					return {
						num_completed,
						#main_game_levels
					}
				end,
				requirements = function (statistics_db, stats_id)
					local reqs = {}

					for _, level in ipairs(main_game_levels) do
						local completed = check_level_list_difficulty(statistics_db, stats_id, {
							level
						}, DifficultySettings[diff_key].rank, career)

						table.insert(reqs, {
							name = LevelSettings[level].display_name,
							completed = completed
						})
					end

					return reqs
				end
			}
		end
	end
end

for diff_key, diff_id in pairs(AchievementTemplates.difficulties) do
	local id = "complete_all_helmgart_levels_all_careers_" .. diff_id
	AchievementTemplates.achievements[id] = {
		name = "achv_complete_all_helmgart_levels_all_careers_" .. diff_id .. "_name",
		desc = "achv_complete_all_helmgart_levels_all_careers_" .. diff_id .. "_desc",
		icon = "achievement_trophy_all_careers_" .. diff_id,
		reward = rewards_lookup[id],
		completed = function (statistics_db, stats_id)
			for career, _ in pairs(CareerSettings) do
				if career ~= "empire_soldier_tutorial" then
					local completed = check_level_list_difficulty(statistics_db, stats_id, main_game_levels, DifficultySettings[diff_key].rank, career)

					if not completed then
						return false
					end
				end
			end

			return true
		end,
		progress = function (statistics_db, stats_id)
			local num_completed = 0
			local total = 0

			for career, _ in pairs(CareerSettings) do
				if career ~= "empire_soldier_tutorial" then
					total = total + 1
					local completed = check_level_list_difficulty(statistics_db, stats_id, main_game_levels, DifficultySettings[diff_key].rank, career)

					if completed then
						num_completed = num_completed + 1
					end
				end
			end

			return {
				num_completed,
				total
			}
		end,
		requirements = function (statistics_db, stats_id)
			local reqs = {}

			for career, _ in pairs(CareerSettings) do
				if career ~= "empire_soldier_tutorial" then
					local completed = check_level_list_difficulty(statistics_db, stats_id, main_game_levels, DifficultySettings[diff_key].rank, career)

					table.insert(reqs, {
						name = career,
						completed = completed
					})
				end
			end

			return reqs
		end
	}
end

for career, _ in pairs(CareerSettings) do
	if career ~= "empire_soldier_tutorial" then
		local id = "complete_100_missions_champion_" .. career
		AchievementTemplates.achievements[id] = {
			name = "achv_complete_100_missions_champion_" .. career .. "_name",
			desc = "achv_complete_100_missions_champion_" .. career .. "_desc",
			icon = "achievement_trophy_100_missions_champion_" .. career,
			reward = rewards_lookup[id],
			completed = function (statistics_db, stats_id)
				local wins = 0

				for _, level in ipairs(main_game_levels) do
					wins = wins + statistics_db:get_persistent_stat(stats_id, "completed_career_levels", career, level, "harder")
					wins = wins + statistics_db:get_persistent_stat(stats_id, "completed_career_levels", career, level, "hardest")
				end

				return wins >= 100
			end,
			progress = function (statistics_db, stats_id)
				local wins = 0

				for _, level in ipairs(main_game_levels) do
					wins = wins + statistics_db:get_persistent_stat(stats_id, "completed_career_levels", career, level, "harder")
					wins = wins + statistics_db:get_persistent_stat(stats_id, "completed_career_levels", career, level, "hardest")
				end

				if wins > 100 then
					wins = 100
				end

				return {
					wins,
					100
				}
			end
		}
	end
end

AchievementTemplates.achievements.elven_ruins_align_leylines_timed = {
	ID_XB1 = 28,
	name = "achv_elven_ruins_align_leylines_timed_name",
	icon = "achievement_trophy_elven_ruins_align_leylines_timed",
	desc = function ()
		return string.format(Localize("achv_elven_ruins_align_leylines_timed_desc"), QuestSettings.elven_ruins_speed_event)
	end,
	reward = rewards_lookup.elven_ruins_align_leylines_timed,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "elven_ruins_speed_event") > 0
	end
}
AchievementTemplates.achievements.farmlands_rescue_prisoners_timed = {
	ID_XB1 = 29,
	name = "achv_farmlands_rescue_prisoners_timed_name",
	icon = "achievement_trophy_farmlands_rescue_prisoners_timed",
	desc = function ()
		return string.format(Localize("achv_farmlands_rescue_prisoners_timed_desc"), QuestSettings.farmlands_speed_event)
	end,
	reward = rewards_lookup.farmlands_rescue_prisoners_timed,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "farmlands_speed_event") > 0
	end
}
AchievementTemplates.achievements.military_kill_chaos_warriors_in_event = {
	ID_XB1 = 30,
	name = "achv_military_kill_chaos_warriors_in_event_name",
	icon = "achievement_trophy_military_kill_chaos_warriors_in_event",
	desc = function ()
		return string.format(Localize("achv_military_kill_chaos_warriors_in_event_desc"), 3)
	end,
	reward = rewards_lookup.military_kill_chaos_warriors_in_event,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "military_statue_kill_chaos_warriors") > 0
	end
}
AchievementTemplates.achievements.ground_zero_burblespew_tornado_enemies = {
	ID_XB1 = 31,
	name = "achv_ground_zero_burblespew_tornado_enemies_name",
	icon = "achievement_trophy_ground_zero_burblespew_tornado_enemies",
	desc = function ()
		return string.format(Localize("achv_ground_zero_burblespew_tornado_enemies_desc"), QuestSettings.halescourge_tornado_enemies)
	end,
	reward = rewards_lookup.ground_zero_burblespew_tornado_enemies,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "halescourge_tornado_enemies") > 0
	end
}
AchievementTemplates.achievements.fort_kill_enemies_cannonball = {
	ID_XB1 = 32,
	name = "achv_fort_kill_enemies_cannonball_name",
	icon = "achievement_trophy_fort_kill_enemies_cannonball",
	desc = function ()
		return string.format(Localize("achv_fort_kill_enemies_cannonball_desc"), QuestSettings.forest_fort_kill_cannonball)
	end,
	reward = rewards_lookup.fort_kill_enemies_cannonball,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "forest_fort_kill_cannonball") > 0
	end
}
AchievementTemplates.achievements.nurgle_player_showered_in_pus = {
	ID_XB1 = 33,
	name = "achv_nurgle_player_showered_in_pus_name",
	icon = "achievement_trophy_nurgle_player_showered_in_pus",
	desc = function ()
		return string.format(Localize("achv_nurgle_player_showered_in_pus_desc"), QuestSettings.nurgle_bathed_all)
	end,
	reward = rewards_lookup.nurgle_player_showered_in_pus,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "nurgle_bathed_all") > 0
	end
}
AchievementTemplates.achievements.bell_destroy_bell_flee_timed = {
	ID_XB1 = 34,
	name = "achv_bell_destroy_bell_flee_timed_name",
	icon = "achievement_trophy_bell_destroy_bell_flee_timed",
	desc = function ()
		return string.format(Localize("achv_bell_destroy_bell_flee_timed_desc"), QuestSettings.bell_speed_event)
	end,
	reward = rewards_lookup.bell_destroy_bell_flee_timed,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "bell_speed_event") > 0
	end
}
AchievementTemplates.achievements.catacombs_stay_inside_ritual_pool = {
	ID_XB1 = 35,
	name = "achv_catacombs_stay_inside_ritual_pool_name",
	icon = "achievement_trophy_catacombs_stay_inside_ritual_pool",
	desc = function ()
		return string.format(Localize("achv_catacombs_stay_inside_ritual_pool_desc"), QuestSettings.volume_corpse_pit_damage)
	end,
	reward = rewards_lookup.catacombs_stay_inside_ritual_pool,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "catacombs_added_souls") > 0
	end
}
AchievementTemplates.achievements.mines_kill_final_troll_timed = {
	ID_XB1 = 36,
	name = "achv_mines_kill_final_troll_timed_name",
	icon = "achievement_trophy_mines_kill_final_troll_timed",
	desc = function ()
		return string.format(Localize("achv_mines_kill_final_troll_timed_desc"), QuestSettings.mines_speed_event)
	end,
	reward = rewards_lookup.mines_kill_final_troll_timed,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "mines_speed_event") > 0
	end
}
AchievementTemplates.achievements.warcamp_bodvarr_charge_warriors = {
	ID_XB1 = 37,
	name = "achv_warcamp_bodvarr_charge_warriors_name",
	icon = "achievement_trophy_warcamp_bodvarr_charge_warriors",
	desc = function ()
		return string.format(Localize("achv_warcamp_bodvarr_charge_warriors_desc"), QuestSettings.exalted_champion_charge_chaos_warrior)
	end,
	reward = rewards_lookup.warcamp_bodvarr_charge_warriors,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "exalted_champion_charge_chaos_warrior") > 0
	end
}
AchievementTemplates.achievements.skaven_stronghold_skarrik_kill_skaven = {
	ID_XB1 = 38,
	name = "achv_skaven_stronghold_skarrik_kill_skaven_name",
	icon = "achievement_trophy_skaven_stronghold_skarrik_kill_skaven",
	desc = function ()
		return string.format(Localize("achv_skaven_stronghold_skarrik_kill_skaven_desc"), QuestSettings.storm_vermin_warlord_kills_enemies)
	end,
	reward = rewards_lookup.skaven_stronghold_skarrik_kill_skaven,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "storm_vermin_warlord_kills_enemies") > 0
	end
}
AchievementTemplates.achievements.ussingen_no_event_barrels = {
	ID_XB1 = 39,
	name = "achv_ussingen_no_event_barrels_name",
	icon = "achievement_trophy_ussingen_no_event_barrels",
	desc = "achv_ussingen_no_event_barrels_desc",
	reward = rewards_lookup.ussingen_no_event_barrels,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "ussingen_used_no_barrels") > 0
	end
}
AchievementTemplates.achievements.skittergate_deathrattler_rasknitt_timed = {
	ID_XB1 = 40,
	name = "achv_skittergate_deathrattler_rasknitt_timed_name",
	icon = "achievement_trophy_skittergate_deathrattler_rasknitt_timed",
	desc = function ()
		return string.format(Localize("achv_skittergate_deathrattler_rasknitt_timed_desc"), QuestSettings.skittergate_speed_event)
	end,
	reward = rewards_lookup.skittergate_deathrattler_rasknitt_timed,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "skittergate_speed_event") > 0
	end
}
local helmgart_level_name_stats = {
	achv_elven_ruins_align_leylines_timed_name = "elven_ruins_speed_event",
	achv_farmlands_rescue_prisoners_timed_name = "farmlands_speed_event",
	achv_nurgle_player_showered_in_pus_name = "nurgle_bathed_all",
	achv_catacombs_stay_inside_ritual_pool_name = "catacombs_added_souls",
	achv_mines_kill_final_troll_timed_name = "mines_speed_event",
	achv_fort_kill_enemies_cannonball_name = "forest_fort_kill_cannonball",
	achv_skaven_stronghold_skarrik_kill_skaven_name = "storm_vermin_warlord_kills_enemies",
	achv_skittergate_deathrattler_rasknitt_timed_name = "skittergate_speed_event",
	achv_military_kill_chaos_warriors_in_event_name = "military_statue_kill_chaos_warriors",
	achv_ground_zero_burblespew_tornado_enemies_name = "halescourge_tornado_enemies",
	achv_warcamp_bodvarr_charge_warriors_name = "exalted_champion_charge_chaos_warrior",
	achv_ussingen_no_event_barrels_name = "ussingen_used_no_barrels",
	achv_bell_destroy_bell_flee_timed_name = "bell_speed_event"
}
AchievementTemplates.achievements.complete_all_helmgart_level_achievements = {
	ID_XB1 = 41,
	name = "achv_complete_all_helmgart_level_achievements_name",
	icon = "achievement_trophy_complete_all_helmgart_level_achievements",
	desc = "achv_complete_all_helmgart_level_achievements_desc",
	reward = rewards_lookup.complete_all_helmgart_level_achievements,
	completed = function (statistics_db, stats_id)
		for _, stat_name in pairs(helmgart_level_name_stats) do
			local completed = statistics_db:get_persistent_stat(stats_id, stat_name) > 0

			if not completed then
				return false
			end
		end

		return true
	end,
	progress = function (statistics_db, stats_id)
		local count = 0
		local total = 0

		for _, stat_name in pairs(helmgart_level_name_stats) do
			total = total + 1
			local completed = statistics_db:get_persistent_stat(stats_id, stat_name) > 0

			if completed then
				count = count + 1
			end
		end

		return {
			count,
			total
		}
	end,
	requirements = function (statistics_db, stats_id)
		local reqs = {}

		for achv_name, stat_name in pairs(helmgart_level_name_stats) do
			local completed = statistics_db:get_persistent_stat(stats_id, stat_name) > 0

			table.insert(reqs, {
				name = achv_name,
				completed = completed
			})
		end

		return reqs
	end
}
AchievementTemplates.achievements.skaven_warpfire_thrower_1 = {
	ID_XB1 = 42,
	name = "achv_skaven_warpfire_thrower_1_name",
	reward = "level_chest",
	icon = "achievement_trophy_skaven_warpfire_thrower_1",
	desc = "achv_skaven_warpfire_thrower_1_desc",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "warpfire_kill_before_shooting") > 0
	end
}
AchievementTemplates.achievements.skaven_warpfire_thrower_2 = {
	ID_XB1 = 43,
	name = "achv_skaven_warpfire_thrower_2_name",
	reward = "level_chest",
	icon = "achievement_trophy_skaven_warpfire_thrower_2",
	desc = "achv_skaven_warpfire_thrower_2_desc",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "warpfire_kill_on_power_cell") > 0
	end
}
AchievementTemplates.achievements.skaven_warpfire_thrower_3 = {
	reward = "level_chest",
	name = "achv_skaven_warpfire_thrower_3_name",
	icon = "achievement_trophy_skaven_warpfire_thrower_3",
	desc = function ()
		return string.format(Localize("achv_skaven_warpfire_thrower_3_desc"), QuestSettings.num_enemies_killed_by_warpfire)
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "warpfire_enemies_killed_by_warpfire") > 0
	end
}
AchievementTemplates.achievements.skaven_pack_master_1 = {
	ID_XB1 = 44,
	name = "achv_skaven_pack_master_1_name",
	reward = "level_chest",
	icon = "achievement_trophy_skaven_pack_master_1",
	desc = "achv_skaven_pack_master_1_desc",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "pack_master_kill_abducting_ally") > 0
	end
}
AchievementTemplates.achievements.skaven_pack_master_2 = {
	ID_XB1 = 45,
	name = "achv_skaven_pack_master_2_name",
	reward = "level_chest",
	icon = "achievement_trophy_skaven_pack_master_2",
	desc = "achv_skaven_pack_master_2_desc",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "pack_master_dodged_attack") > 0
	end
}
AchievementTemplates.achievements.skaven_pack_master_3 = {
	reward = "level_chest",
	name = "achv_skaven_pack_master_3_name",
	icon = "achievement_trophy_skaven_pack_master_3",
	desc = "achv_skaven_pack_master_3_desc",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "pack_master_rescue_hoisted_ally") > 0
	end
}
AchievementTemplates.achievements.skaven_gutter_runner_1 = {
	ID_XB1 = 46,
	name = "achv_skaven_gutter_runner_1_name",
	reward = "level_chest",
	icon = "achievement_trophy_skaven_gutter_runner_1",
	desc = "achv_skaven_gutter_runner_1_desc",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "gutter_runner_killed_on_pounce") > 0
	end
}
AchievementTemplates.achievements.skaven_gutter_runner_2 = {
	reward = "level_chest",
	name = "achv_skaven_gutter_runner_2_name",
	icon = "achievement_trophy_skaven_gutter_runner_2",
	desc = "achv_skaven_gutter_runner_2_desc",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "gutter_runner_push_on_target_pounced") > 0
	end
}
AchievementTemplates.achievements.skaven_gutter_runner_3 = {
	reward = "level_chest",
	name = "achv_skaven_gutter_runner_3_name",
	icon = "achievement_trophy_skaven_gutter_runner_3",
	desc = "achv_skaven_gutter_runner_3_desc",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "gutter_runner_push_on_pounce") > 0
	end
}
AchievementTemplates.achievements.skaven_poison_wind_globardier_1 = {
	ID_XB1 = 47,
	name = "achv_skaven_poison_wind_globardier_1_name",
	reward = "level_chest",
	icon = "achievement_trophy_skaven_poison_wind_globardier_1",
	desc = "achv_skaven_poison_wind_globardier_1_desc",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "globadier_kill_during_suicide") > 0
	end
}
AchievementTemplates.achievements.skaven_poison_wind_globardier_2 = {
	reward = "level_chest",
	name = "achv_skaven_poison_wind_globardier_2_name",
	icon = "achievement_trophy_skaven_poison_wind_globardier_2",
	desc = "achv_skaven_poison_wind_globardier_2_desc",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "globadier_kill_before_throwing") > 0
	end
}
AchievementTemplates.achievements.skaven_poison_wind_globardier_3 = {
	reward = "level_chest",
	name = "achv_skaven_poison_wind_globardier_3_name",
	icon = "achievement_trophy_skaven_poison_wind_globardier_3",
	desc = function ()
		return string.format(Localize("achv_skaven_poison_wind_globardier_3_desc"), QuestSettings.num_enemies_killed_by_poison)
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "globadier_enemies_killed_by_poison") > 0
	end
}
AchievementTemplates.achievements.skaven_ratling_gunner_1 = {
	ID_XB1 = 48,
	name = "achv_skaven_ratling_gunner_1_name",
	reward = "level_chest",
	icon = "achievement_trophy_skaven_ratling_gunner_1",
	desc = "achv_skaven_ratling_gunner_1_desc",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "ratling_gunner_killed_by_melee") > 0
	end
}
AchievementTemplates.achievements.skaven_ratling_gunner_2 = {
	reward = "level_chest",
	name = "achv_skaven_ratling_gunner_2_name",
	icon = "achievement_trophy_skaven_ratling_gunner_2",
	desc = "achv_skaven_ratling_gunner_2_desc",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "ratling_gunner_killed_while_shooting") > 0
	end
}
AchievementTemplates.achievements.skaven_ratling_gunner_3 = {
	reward = "level_chest",
	name = "achv_skaven_ratling_gunner_3_name",
	icon = "achievement_trophy_skaven_ratling_gunner_3",
	desc = "achv_skaven_ratling_gunner_3_desc",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "ratling_gunner_blocked_shot") > 0
	end
}
AchievementTemplates.achievements.chaos_corruptor_sorcerer_1 = {
	ID_XB1 = 49,
	name = "achv_chaos_corruptor_sorcerer_1_name",
	reward = "level_chest",
	icon = "achievement_trophy_chaos_corruptor_sorcerer_1",
	desc = "achv_chaos_corruptor_sorcerer_1_desc",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "corruptor_dodged_attack") > 0
	end
}
AchievementTemplates.achievements.chaos_corruptor_sorcerer_2 = {
	reward = "level_chest",
	name = "achv_chaos_corruptor_sorcerer_2_name",
	icon = "achievement_trophy_chaos_corruptor_sorcerer_2",
	desc = function ()
		return string.format(Localize("achv_chaos_corruptor_sorcerer_2_desc"), QuestSettings.corruptor_killed_at_teleport_time)
	end,
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "corruptor_killed_at_teleport_time") > 0
	end
}
AchievementTemplates.achievements.chaos_corruptor_sorcerer_3 = {
	ID_XB1 = 50,
	name = "achv_chaos_corruptor_sorcerer_3_name",
	reward = "level_chest",
	icon = "achievement_trophy_chaos_corruptor_sorcerer_3",
	desc = "achv_chaos_corruptor_sorcerer_3_desc",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "corruptor_killed_while_grabbing") > 0
	end
}
AchievementTemplates.achievements.chaos_vortex_sorcerer_1 = {
	ID_XB1 = 51,
	name = "achv_chaos_vortex_sorcerer_1_name",
	reward = "level_chest",
	icon = "achievement_trophy_chaos_vortex_sorcerer_1",
	desc = "achv_chaos_vortex_sorcerer_1_desc",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "vortex_sorcerer_killed_while_summoning") > 0
	end
}
AchievementTemplates.achievements.chaos_vortex_sorcerer_2 = {
	reward = "level_chest",
	name = "achv_chaos_vortex_sorcerer_2_name",
	icon = "achievement_trophy_chaos_vortex_sorcerer_2",
	desc = "achv_chaos_vortex_sorcerer_2_desc",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "vortex_sorcerer_killed_while_ally_in_vortex") > 0
	end
}
AchievementTemplates.achievements.chaos_vortex_sorcerer_3 = {
	reward = "level_chest",
	name = "achv_chaos_vortex_sorcerer_3_name",
	icon = "achievement_trophy_chaos_vortex_sorcerer_3",
	desc = "achv_chaos_vortex_sorcerer_3_desc",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "vortex_sorcerer_killed_by_melee") > 0
	end
}
AchievementTemplates.achievements.chaos_spawn_1 = {
	reward = "level_chest",
	name = "achv_chaos_spawn_1_name",
	icon = "achievement_trophy_chaos_spawn_1",
	desc = "achv_chaos_spawn_1_desc",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "chaos_spawn_killed_while_grabbing") > 0
	end
}
AchievementTemplates.achievements.chaos_spawn_2 = {
	reward = "level_chest",
	name = "achv_chaos_spawn_2_name",
	icon = "achievement_trophy_chaos_spawn_2",
	desc = "achv_chaos_spawn_2_desc",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "chaos_spawn_killed_without_having_grabbed") > 0
	end
}
AchievementTemplates.achievements.chaos_troll_1 = {
	reward = "level_chest",
	name = "achv_chaos_troll_1_name",
	icon = "achievement_trophy_chaos_troll_1",
	desc = "achv_chaos_troll_1_desc",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "chaos_troll_killed_without_regen") > 0
	end
}
AchievementTemplates.achievements.chaos_troll_2 = {
	reward = "level_chest",
	name = "achv_chaos_troll_2_name",
	icon = "achievement_trophy_chaos_troll_2",
	desc = "achv_chaos_troll_2_desc",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "chaos_troll_killed_without_bile_damage") > 0
	end
}
AchievementTemplates.achievements.skaven_rat_ogre_1 = {
	reward = "level_chest",
	name = "achv_skaven_rat_ogre_1_name",
	icon = "achievement_trophy_skaven_rat_ogre_1",
	desc = "achv_skaven_rat_ogre_1_desc",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "rat_ogre_killed_mid_leap") > 0
	end
}
AchievementTemplates.achievements.skaven_rat_ogre_2 = {
	reward = "level_chest",
	name = "achv_skaven_rat_ogre_2_name",
	icon = "achievement_trophy_skaven_rat_ogre_2",
	desc = "achv_skaven_rat_ogre_2_desc",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "rat_ogre_killed_without_dealing_damage") > 0
	end
}
AchievementTemplates.achievements.skaven_stormfiend_1 = {
	reward = "level_chest",
	name = "achv_skaven_stormfiend_1_name",
	icon = "achievement_trophy_skaven_stormfiend_1",
	desc = "achv_skaven_stormfiend_1_desc",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "stormfiend_killed_without_burn_damage") > 0
	end
}
AchievementTemplates.achievements.skaven_stormfiend_2 = {
	reward = "level_chest",
	name = "achv_skaven_stormfiend_2_name",
	icon = "achievement_trophy_skaven_stormfiend_2",
	desc = "achv_skaven_stormfiend_2_desc",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "stormfiend_killed_on_controller") > 0
	end
}
AchievementTemplates.achievements.helmgart_lord_1 = {
	reward = "level_chest",
	name = "achv_helmgart_lord_1_name",
	icon = "achievement_trophy_helmgart_lord_1",
	desc = "achv_helmgart_lord_1_desc",
	completed = function (statistics_db, stats_id)
		return statistics_db:get_persistent_stat(stats_id, "killed_lord_as_last_player_standing") > 0
	end
}

for difficulty_id, difficulty_name in pairs(AchievementTemplates.difficulties) do
	local id = "kill_bodvarr_burblespew_" .. difficulty_name
	local difficulty_rank = DifficultySettings[difficulty_id].rank
	AchievementTemplates.achievements[id] = {
		name = "achv_kill_bodvarr_burblespew_" .. difficulty_name .. "_name",
		desc = "achv_kill_bodvarr_burblespew_" .. difficulty_name .. "_desc",
		icon = "achievement_trophy_kill_bodvarr_burblespew_" .. difficulty_name,
		reward = rewards_lookup[id],
		completed = function (statistics_db, stats_id)
			local champion_completed = difficulty_rank <= statistics_db:get_persistent_stat(stats_id, "kill_chaos_exalted_champion_difficulty_rank")
			local sorcerer_completed = difficulty_rank <= statistics_db:get_persistent_stat(stats_id, "kill_chaos_exalted_sorcerer_difficulty_rank")

			return champion_completed and sorcerer_completed
		end,
		requirements = function (statistics_db, stats_id)
			local champion_completed = difficulty_rank <= statistics_db:get_persistent_stat(stats_id, "kill_chaos_exalted_champion_difficulty_rank")
			local sorcerer_completed = difficulty_rank <= statistics_db:get_persistent_stat(stats_id, "kill_chaos_exalted_sorcerer_difficulty_rank")

			return {
				{
					name = "chaos_exalted_champion",
					completed = champion_completed
				},
				{
					name = "chaos_exalted_sorcerer",
					completed = sorcerer_completed
				}
			}
		end
	}
	id = "kill_skarrik_rasknitt_" .. difficulty_name
	AchievementTemplates.achievements[id] = {
		name = "achv_kill_skarrik_rasknitt_" .. difficulty_name .. "_name",
		desc = "achv_kill_skarrik_rasknitt_" .. difficulty_name .. "_desc",
		icon = "achievement_trophy_kill_skarrik_rasknitt_" .. difficulty_name,
		reward = rewards_lookup[id],
		completed = function (statistics_db, stats_id)
			local gray_seer_completed = difficulty_rank <= statistics_db:get_persistent_stat(stats_id, "kill_skaven_grey_seer_difficulty_rank")
			local storm_vermin_completed = difficulty_rank <= statistics_db:get_persistent_stat(stats_id, "kill_skaven_storm_vermin_warlord_difficulty_rank")

			return gray_seer_completed and storm_vermin_completed
		end,
		requirements = function (statistics_db, stats_id)
			local gray_seer_completed = difficulty_rank <= statistics_db:get_persistent_stat(stats_id, "kill_skaven_grey_seer_difficulty_rank")
			local storm_vermin_completed = difficulty_rank <= statistics_db:get_persistent_stat(stats_id, "kill_skaven_storm_vermin_warlord_difficulty_rank")

			return {
				{
					name = "skaven_storm_vermin_warlord",
					completed = storm_vermin_completed
				},
				{
					name = "skaven_grey_seer",
					completed = gray_seer_completed
				}
			}
		end
	}
end

return AchievementTemplates

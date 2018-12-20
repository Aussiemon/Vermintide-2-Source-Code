require("scripts/settings/breeds")

StatisticsDefinitions = {
	session = {},
	player = {},
	unit_test = {}
}
local player = StatisticsDefinitions.player
local unit_test = StatisticsDefinitions.unit_test
player.kills_melee = {
	value = 0,
	sync_on_hot_join = true
}
player.kills_ranged = {
	value = 0,
	sync_on_hot_join = true
}
player.headshots = {
	value = 0,
	sync_on_hot_join = true
}
player.revives = {
	value = 0,
	sync_on_hot_join = true
}
player.aidings = {
	value = 0,
	sync_on_hot_join = true
}
player.saves = {
	value = 0,
	sync_on_hot_join = true
}
player.times_revived = {
	value = 0,
	sync_on_hot_join = true
}
player.damage_dealt = {
	value = 0,
	sync_on_hot_join = true
}
local max_daily_quests = 3
local max_event_quests = 3
local max_weekly_quests = 5
local num_quest_statistics_per_quest = 3
player.quest_statistics = {}

for i = 1, max_daily_quests, 1 do
	local stat_prefix = "daily_quest_" .. i

	for j = 1, num_quest_statistics_per_quest, 1 do
		local stat_name = stat_prefix .. "_stat_" .. j
		player.quest_statistics[stat_name] = {
			value = 0,
			source = "player_data",
			database_name = "quest_statistics_" .. stat_name
		}
	end
end

for i = 1, max_event_quests, 1 do
	local stat_prefix = "event_quest_" .. i

	for j = 1, num_quest_statistics_per_quest, 1 do
		local stat_name = stat_prefix .. "_stat_" .. j
		player.quest_statistics[stat_name] = {
			value = 0,
			source = "player_data",
			database_name = "quest_statistics_" .. stat_name
		}
	end
end

for i = 1, max_weekly_quests, 1 do
	local stat_prefix = "weekly_quest_" .. i

	for j = 1, num_quest_statistics_per_quest, 1 do
		local stat_name = stat_prefix .. "_stat_" .. j
		player.quest_statistics[stat_name] = {
			value = 0,
			source = "player_data",
			database_name = "quest_statistics_" .. stat_name
		}
	end
end

player.total_collected_grimoires = {
	value = 0,
	database_name = "total_collected_grimoires"
}
player.total_collected_tomes = {
	value = 0,
	database_name = "total_collected_tomes"
}
player.times_friend_healed = {
	value = 0,
	database_name = "times_friend_healed"
}
player.dynamic_objects_destroyed = {
	value = 0,
	database_name = "dynamic_objects_destroyed"
}
player.completed_levels_bright_wizard = {}
player.completed_levels_wood_elf = {}
player.completed_levels_empire_soldier = {}
player.completed_levels_witch_hunter = {}
player.completed_levels_dwarf_ranger = {}
player.collected_grimoires = {}
player.collected_tomes = {}
player.completed_heroic_deeds = {
	value = 0,
	database_name = "completed_heroic_deeds",
	source = "player_data"
}
player.perfect_rat_ogre = {
	value = 0,
	database_name = "perfect_rat_ogre",
	source = "player_data"
}
player.perfect_chaos_spawn = {
	value = 0,
	database_name = "perfect_chaos_spawn",
	source = "player_data"
}
player.perfect_bile_troll = {
	value = 0,
	database_name = "perfect_bile_troll",
	source = "player_data"
}
player.perfect_storm_fiend = {
	value = 0,
	database_name = "perfect_storm_fiend",
	source = "player_data"
}
player.kill_chaos_exalted_champion_difficulty_rank = {
	value = 0,
	database_name = "kill_chaos_exalted_champion_difficulty_rank",
	source = "player_data"
}
player.kill_chaos_exalted_sorcerer_difficulty_rank = {
	value = 0,
	database_name = "kill_chaos_exalted_sorcerer_difficulty_rank",
	source = "player_data"
}
player.kill_skaven_grey_seer_difficulty_rank = {
	value = 0,
	database_name = "kill_skaven_grey_seer_difficulty_rank",
	source = "player_data"
}
player.kill_skaven_storm_vermin_warlord_difficulty_rank = {
	value = 0,
	database_name = "kill_skaven_storm_vermin_warlord_difficulty_rank",
	source = "player_data"
}
player.highest_equipped_rarity = {}

for _, slot in ipairs({
	"melee",
	"ranged",
	"necklace",
	"ring",
	"trinket",
	"hat",
	"skin",
	"frame"
}) do
	player.highest_equipped_rarity[slot] = {
		value = 0,
		source = "player_data",
		database_name = "highest_equipped_rarity_" .. slot
	}
end

player.military_statue_kill_chaos_warriors_session = {
	value = 0
}
player.military_statue_kill_chaos_warriors = {
	value = 0,
	database_name = "military_statue_kill_chaos_warriors",
	source = "player_data"
}
player.halescourge_tornado_enemies = {
	value = 0,
	database_name = "halescourge_tornado_enemies",
	source = "player_data"
}
player.forest_fort_kill_cannonball = {
	value = 0,
	database_name = "forest_fort_kill_cannonball",
	source = "player_data"
}
player.nurgle_bathed_all = {
	value = 0,
	database_name = "nurgle_bathed_all",
	source = "player_data"
}
player.catacombs_added_souls = {
	value = 0,
	database_name = "catacombs_added_souls",
	source = "player_data"
}
player.ussingen_used_no_barrels = {
	value = 0,
	database_name = "ussingen_used_no_barrels",
	source = "player_data"
}
player.elven_ruins_speed_event = {
	value = 0,
	database_name = "elven_ruins_speed_event",
	source = "player_data"
}
player.farmlands_speed_event = {
	value = 0,
	database_name = "farmlands_speed_event",
	source = "player_data"
}
player.bell_speed_event = {
	value = 0,
	database_name = "bell_speed_event",
	source = "player_data"
}
player.mines_speed_event = {
	value = 0,
	database_name = "mines_speed_event",
	source = "player_data"
}
player.skittergate_speed_event = {
	value = 0,
	database_name = "skittergate_speed_event",
	source = "player_data"
}
player.exalted_champion_charge_chaos_warrior = {
	value = 0,
	database_name = "exalted_champion_charge_chaos_warrior",
	source = "player_data"
}
player.storm_vermin_warlord_kills_enemies = {
	value = 0,
	database_name = "storm_vermin_warlord_kills_enemies",
	source = "player_data"
}
player.bogenhafen_city_no_braziers_lit = {
	value = 0,
	database_name = "bogenhafen_city_no_braziers_lit",
	source = "player_data"
}
player.bogenhafen_city_torch_not_picked_up = {
	value = 0,
	database_name = "bogenhafen_city_torch_not_picked_up",
	source = "player_data"
}
player.bogenhafen_city_fast_switches = {
	value = 0,
	database_name = "bogenhafen_city_fast_switches",
	source = "player_data"
}
player.bogenhafen_city_all_wine_collected = {
	value = 0,
	database_name = "bogenhafen_city_all_wine_collected",
	source = "player_data"
}
player.bogenhafen_city_jumping_puzzle = {
	value = 0,
	database_name = "bogenhafen_city_jumping_puzzle",
	source = "player_data"
}
player.bogenhafen_slum_no_ratling_damage = {
	value = 0,
	database_name = "bogenhafen_slum_no_ratling_damage",
	source = "player_data"
}
player.damage_taken_from_ratling_gunner = {
	value = 0
}
player.bogenhafen_slum_no_windows_broken = {
	value = 0,
	database_name = "bogenhafen_slum_no_windows_broken",
	source = "player_data"
}
player.bogenhafen_slum_find_hidden_stash = {
	value = 0,
	database_name = "bogenhafen_slum_find_hidden_stash",
	source = "player_data"
}
player.bogenhafen_slum_jumping_puzzle = {
	value = 0,
	database_name = "bogenhafen_slum_jumping_puzzle",
	source = "player_data"
}
player.bogenhafen_slum_event_speedrun = {
	value = 0,
	database_name = "bogenhafen_slum_event_speedrun",
	source = "player_data"
}
player.holly_magnus_barrel_relay_race = {
	value = 0,
	database_name = "holly_magnus_barrel_relay_race",
	source = "player_data"
}
player.holly_magnus_barrel_relay_race_hardest = {
	value = 0,
	database_name = "holly_magnus_barrel_relay_race_hardest",
	source = "player_data"
}
player.holly_magnus_secret_room = {
	value = 0,
	database_name = "holly_magnus_secret_room",
	source = "player_data"
}
player.holly_magnus_gutter_runner_treasure = {
	value = 0,
	database_name = "holly_magnus_gutter_runner_treasure",
	source = "player_data"
}
player.holly_magnus_gutter_runner_treasure_hardest = {
	value = 0,
	database_name = "holly_magnus_gutter_runner_treasure_hardest",
	source = "player_data"
}
player.holly_magnus_rune = {
	value = 0,
	database_name = "holly_magnus_rune",
	source = "player_data"
}
player.holly_forest_ambush_synchronized_explosives = {
	value = 0,
	database_name = "holly_forest_ambush_synchronized_explosives",
	source = "player_data"
}
player.holly_forest_ambush_synchronized_explosives_hardest = {
	value = 0,
	database_name = "holly_forest_ambush_synchronized_explosives_hardest",
	source = "player_data"
}
player.holly_forest_ambush_bretonnian_dance = {
	value = 0,
	database_name = "holly_forest_ambush_bretonnian_dance",
	source = "player_data"
}
player.holly_forest_ambush_dragonbane_gem = {
	value = 0,
	database_name = "holly_forest_ambush_dragonbane_gem",
	source = "player_data"
}
player.holly_forest_ambush_rune = {
	value = 0,
	database_name = "holly_forest_ambush_rune",
	source = "player_data"
}
player.holly_cemetery_sleep = {
	value = 0,
	database_name = "holly_cemetery_sleep",
	source = "player_data"
}
player.holly_cemetery_rune = {
	value = 0,
	database_name = "holly_cemetery_rune",
	source = "player_data"
}
player.holly_cemetery_bones = {
	value = 0,
	database_name = "holly_cemetery_bones",
	source = "player_data"
}
player.holly_cemetery_synchronized_chains = {
	value = 0,
	database_name = "holly_cemetery_synchronized_chains",
	source = "player_data"
}
player.holly_cemetery_synchronized_chains_hardest = {
	value = 0,
	database_name = "holly_cemetery_synchronized_chains_hardest",
	source = "player_data"
}
player.holly_find_all_runes = {
	value = 0,
	database_name = "holly_find_all_runes",
	source = "player_data"
}
player.holly_difficulty_selection_plaza = {
	value = 1,
	database_name = "holly_difficulty_selection_plaza",
	source = "player_data"
}
player.holly_kills_we_1h_axe = {
	value = 0,
	database_name = "holly_kills_we_1h_axe",
	source = "player_data"
}
player.holly_kills_bw_1h_crowbill = {
	value = 0,
	database_name = "holly_kills_bw_1h_crowbill",
	source = "player_data"
}
player.holly_kills_wh_dual_wield_axe_falchion = {
	value = 0,
	database_name = "holly_kills_wh_dual_wield_axe_falchion",
	source = "player_data"
}
player.holly_kills_dr_dual_wield_hammers = {
	value = 0,
	database_name = "holly_kills_dr_dual_wield_hammers",
	source = "player_data"
}
player.holly_kills_es_dual_wield_hammer_sword = {
	value = 0,
	database_name = "holly_kills_es_dual_wield_hammer_sword",
	source = "player_data"
}
local holly_lord_levels = {
	"warcamp",
	"skaven_stronghold",
	"ground_zero",
	"skittergate"
}
local weapon_names = {
	"we_1h_axe",
	"bw_1h_crowbill",
	"wh_dual_wield_axe_falchion",
	"dr_dual_wield_hammers",
	"es_dual_wield_hammer_sword"
}

for i = 1, #holly_lord_levels, 1 do
	local level_name = holly_lord_levels[i]

	for i = 1, #weapon_names, 1 do
		local weapon_name = weapon_names[i]
		local stat_name = "holly_completed_level_" .. level_name .. "_with_" .. weapon_name
		player[stat_name] = {
			value = 0,
			source = "player_data",
			database_name = stat_name
		}
	end
end

player.bonfire_lit_mines = {
	value = 0,
	database_name = "bonfire_lit_mines",
	source = "player_data"
}
player.bonfire_lit_warcamp = {
	value = 0,
	database_name = "bonfire_lit_warcamp",
	source = "player_data"
}
player.bonfire_lit_fort = {
	value = 0,
	database_name = "bonfire_lit_fort",
	source = "player_data"
}
player.bonfire_lit_skittergate = {
	value = 0,
	database_name = "bonfire_lit_skittergate",
	source = "player_data"
}
player.globadier_kill_before_throwing = {
	value = 0,
	database_name = "globadier_kill_before_throwing",
	source = "player_data"
}
player.globadier_kill_during_suicide = {
	value = 0,
	database_name = "globadier_kill_during_suicide",
	source = "player_data"
}
player.globadier_enemies_killed_by_poison = {
	value = 0,
	database_name = "globadier_enemies_killed_by_poison",
	source = "player_data"
}
player.warpfire_kill_before_shooting = {
	value = 0,
	database_name = "warpfire_kill_before_shooting",
	source = "player_data"
}
player.warpfire_kill_on_power_cell = {
	value = 0,
	database_name = "warpfire_kill_on_power_cell",
	source = "player_data"
}
player.warpfire_enemies_killed_by_warpfire = {
	value = 0,
	database_name = "warpfire_enemies_killed_by_warpfire",
	source = "player_data"
}
player.pack_master_dodged_attack = {
	value = 0,
	database_name = "pack_master_dodged_attack",
	source = "player_data"
}
player.pack_master_kill_abducting_ally = {
	value = 0,
	database_name = "pack_master_kill_abducting_ally",
	source = "player_data"
}
player.pack_master_rescue_hoisted_ally = {
	value = 0,
	database_name = "pack_master_rescue_hoisted_ally",
	source = "player_data"
}
player.gutter_runner_killed_on_pounce = {
	value = 0,
	database_name = "gutter_runner_killed_on_pounce",
	source = "player_data"
}
player.gutter_runner_push_on_pounce = {
	value = 0,
	database_name = "gutter_runner_push_on_pounce",
	source = "player_data"
}
player.gutter_runner_push_on_target_pounced = {
	value = 0,
	database_name = "gutter_runner_push_on_target_pounced",
	source = "player_data"
}
player.corruptor_killed_at_teleport_time = {
	value = 0,
	database_name = "corruptor_killed_at_teleport_time",
	source = "player_data"
}
player.corruptor_dodged_attack = {
	value = 0,
	database_name = "corruptor_dodged_attack",
	source = "player_data"
}
player.corruptor_killed_while_grabbing = {
	value = 0,
	database_name = "corruptor_killed_while_grabbing",
	source = "player_data"
}
player.vortex_sorcerer_killed_while_summoning = {
	value = 0,
	database_name = "vortex_sorcerer_killed_while_summoning",
	source = "player_data"
}
player.vortex_sorcerer_killed_while_ally_in_vortex = {
	value = 0,
	database_name = "vortex_sorcerer_killed_while_ally_in_vortex",
	source = "player_data"
}
player.vortex_sorcerer_killed_by_melee = {
	value = 0,
	database_name = "vortex_sorcerer_killed_by_melee",
	source = "player_data"
}
player.ratling_gunner_killed_by_melee = {
	value = 0,
	database_name = "ratling_gunner_killed_by_melee",
	source = "player_data"
}
player.ratling_gunner_killed_while_shooting = {
	value = 0,
	database_name = "ratling_gunner_killed_while_shooting",
	source = "player_data"
}
player.ratling_gunner_blocked_shot = {
	value = 0,
	database_name = "ratling_gunner_blocked_shot",
	source = "player_data"
}
player.chaos_spawn_killed_while_grabbing = {
	value = 0,
	database_name = "chaos_spawn_killed_while_grabbing",
	source = "player_data"
}
player.chaos_spawn_killed_without_having_grabbed = {
	value = 0,
	database_name = "chaos_spawn_killed_without_having_grabbed",
	source = "player_data"
}
player.chaos_troll_killed_without_regen = {
	value = 0,
	database_name = "chaos_troll_killed_without_regen",
	source = "player_data"
}
player.chaos_troll_killed_without_bile_damage = {
	value = 0,
	database_name = "chaos_troll_killed_without_bile_damage",
	source = "player_data"
}
player.rat_ogre_killed_mid_leap = {
	value = 0,
	database_name = "rat_ogre_killed_mid_leap",
	source = "player_data"
}
player.rat_ogre_killed_without_dealing_damage = {
	value = 0,
	database_name = "rat_ogre_killed_without_dealing_damage",
	source = "player_data"
}
player.stormfiend_killed_without_burn_damage = {
	value = 0,
	database_name = "stormfiend_killed_without_burn_damage",
	source = "player_data"
}
player.stormfiend_killed_on_controller = {
	value = 0,
	database_name = "stormfiend_killed_on_controller",
	source = "player_data"
}
player.killed_lord_as_last_player_standing = {
	value = 0,
	database_name = "killed_lord_as_last_player_standing",
	source = "player_data"
}
player.played_levels_quickplay = {}
player.last_played_level_id = {
	value = 0,
	database_name = "last_played_level_id",
	sync_to_host = true
}
player.kills_total = {
	value = 0,
	sync_on_hot_join = true
}
player.kills_per_breed = {}
player.kill_assists_per_breed = {}
player.damage_taken = {
	value = 0,
	sync_on_hot_join = true
}
player.damage_dealt_per_breed = {}
player.completed_levels = {}
player.completed_levels_difficulty = {}
player.completed_career_levels = {}
player.played_difficulty = {}
player.completed_event_difficulty = {}
player.crafted_items = {
	value = 0,
	database_name = "crafted_items"
}
player.salvaged_items = {
	value = 0,
	database_name = "salvaged_items"
}
unit_test.kills_total = {
	value = 0,
	database_name = "kills_total"
}
unit_test.profiles = {
	witch_hunter = {
		kills_total = {
			value = 0
		}
	}
}

for career, _ in pairs(CareerSettings) do
	if career ~= "empire_soldier_tutorial" then
		player.completed_career_levels[career] = {}

		for level_key, level in pairs(LevelSettings) do
			if table.contains(UnlockableLevels, level_key) then
				player.completed_career_levels[career][level_key] = {}

				for diff, _ in pairs(DifficultySettings) do
					local database_name = "completed_career_levels_" .. career .. "_" .. level_key .. "_" .. diff
					player.completed_career_levels[career][level_key][diff] = {
						value = 0,
						source = "player_data",
						database_name = database_name
					}
				end
			end
		end
	end
end

for diff, _ in pairs(DifficultySettings) do
	local database_name = "played_difficulty_" .. diff
	player.played_difficulty[diff] = {
		value = 0,
		source = "player_data",
		database_name = database_name
	}
	database_name = string.format("completed_event_difficulty_%s", diff)
	player.completed_event_difficulty[diff] = {
		value = 0,
		source = "player_data",
		database_name = database_name
	}
end

for breed_name, breed in pairs(Breeds) do
	player.kills_per_breed[breed_name] = {
		value = 0,
		sync_on_hot_join = true,
		name = breed_name
	}
	player.kill_assists_per_breed[breed_name] = {
		value = 0,
		name = breed_name
	}
	player.damage_dealt_per_breed[breed_name] = {
		value = 0,
		name = breed_name
	}
end

LevelDifficultyDBNames = {}

for level_key, level in pairs(LevelSettings) do
	if table.contains(UnlockableLevels, level_key) then
		local is_dlc_level = level.dlc_name ~= nil
		local completed_levels_definition = {
			value = 0,
			sync_on_hot_join = true,
			sync_to_host = true,
			database_name = "completed_levels_" .. level_key
		}

		if is_dlc_level then
			completed_levels_definition.source = "player_data"
		end

		player.completed_levels[level_key] = completed_levels_definition
		local played_levels_quickplay_definition = {
			value = 0,
			sync_to_host = true,
			database_name = "played_levels_quickplay_" .. level_key
		}

		if is_dlc_level then
			played_levels_quickplay_definition.source = "player_data"
		end

		player.played_levels_quickplay[level_key] = played_levels_quickplay_definition
		local heroes = {
			"bright_wizard",
			"wood_elf",
			"empire_soldier",
			"witch_hunter",
			"dwarf_ranger"
		}

		for _, hero in ipairs(heroes) do
			local key = "completed_levels_" .. hero
			local t = player[key]
			local definition = {
				value = 0,
				database_name = key .. "_" .. level_key
			}

			if is_dlc_level then
				definition.source = "player_data"
			end

			t[level_key] = definition
		end

		local level_difficulty_name = level_key .. "_difficulty_completed"
		LevelDifficultyDBNames[level_key] = level_difficulty_name
		local completed_levels_difficulty_definition = {
			value = 0,
			sync_on_hot_join = true,
			database_name = level_difficulty_name
		}

		if is_dlc_level then
			completed_levels_difficulty_definition.source = "player_data"
		end

		player.completed_levels_difficulty[level_difficulty_name] = completed_levels_difficulty_definition
		local grimoire_name = "collected_grimoire_" .. level_key
		local collected_grimoires_definition = {
			value = 0,
			database_name = grimoire_name
		}

		if is_dlc_level then
			collected_grimoires_definition.source = "player_data"
		end

		player.collected_grimoires[level_key] = collected_grimoires_definition
		local tome_name = "collected_tome_" .. level_key
		local tome_name_definition = {
			value = 0,
			database_name = tome_name
		}

		if is_dlc_level then
			tome_name_definition.source = "player_data"
		end

		player.collected_tomes[level_key] = tome_name_definition
	end
end

local function add_names(stats)
	for stat_name, stat_definition in pairs(stats) do
		if not stat_definition.value then
			add_names(stat_definition)
		else
			stat_definition.name = stat_name
		end
	end
end

add_names(player)
add_names(unit_test)

return

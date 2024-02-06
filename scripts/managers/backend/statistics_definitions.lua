-- chunkname: @scripts/managers/backend/statistics_definitions.lua

require("scripts/settings/breeds")

StatisticsDefinitions = {}
StatisticsDefinitions.session = {}
StatisticsDefinitions.player = {}
StatisticsDefinitions.unit_test = {}

local player = StatisticsDefinitions.player
local unit_test = StatisticsDefinitions.unit_test

player.kills_melee = {
	sync_on_hot_join = true,
	value = 0,
}
player.kills_ranged = {
	sync_on_hot_join = true,
	value = 0,
}
player.headshots = {
	sync_on_hot_join = true,
	value = 0,
}
player.revives = {
	sync_on_hot_join = true,
	value = 0,
}
player.aidings = {
	sync_on_hot_join = true,
	value = 0,
}
player.saves = {
	sync_on_hot_join = true,
	value = 0,
}
player.times_revived = {
	sync_on_hot_join = true,
	value = 0,
}
player.damage_dealt = {
	sync_on_hot_join = true,
	value = 0,
}
player.quest_statistics = {}

local quest_rules = QuestSettings.rules

for quest_type, data in pairs(quest_rules) do
	local stat_prefix = string.format("%s_quest", quest_type)

	for i = 1, data.max_quests do
		local quest_name = string.format("%s_%d", stat_prefix, i)

		for j = 1, data.num_criterias do
			local stat_name = string.format("%s_stat_%d", quest_name, j)

			player.quest_statistics[stat_name] = {
				source = "player_data",
				value = 0,
				database_name = "quest_statistics_" .. stat_name,
			}
		end
	end
end

player.total_collected_grimoires = {
	database_name = "total_collected_grimoires",
	value = 0,
}
player.total_collected_tomes = {
	database_name = "total_collected_tomes",
	value = 0,
}
player.total_collected_dice = {
	database_name = "total_collected_dice",
	value = 0,
}
player.times_friend_healed = {
	database_name = "times_friend_healed",
	value = 0,
}
player.dynamic_objects_destroyed = {
	database_name = "dynamic_objects_destroyed",
	value = 0,
}
player.completed_levels_bright_wizard = {}
player.completed_levels_wood_elf = {}
player.completed_levels_empire_soldier = {}
player.completed_levels_witch_hunter = {}
player.completed_levels_dwarf_ranger = {}
player.collected_grimoires = {}
player.collected_tomes = {}
player.collected_dice = {}
player.collected_painting_scraps = {}
player.completed_heroic_deeds = {
	database_name = "completed_heroic_deeds",
	source = "player_data",
	value = 0,
}
player.perfect_rat_ogre = {
	database_name = "perfect_rat_ogre",
	source = "player_data",
	value = 0,
}
player.perfect_chaos_spawn = {
	database_name = "perfect_chaos_spawn",
	source = "player_data",
	value = 0,
}
player.perfect_bile_troll = {
	database_name = "perfect_bile_troll",
	source = "player_data",
	value = 0,
}
player.perfect_storm_fiend = {
	database_name = "perfect_storm_fiend",
	source = "player_data",
	value = 0,
}
player.kill_chaos_exalted_champion_difficulty_rank = {
	database_name = "kill_chaos_exalted_champion_difficulty_rank",
	source = "player_data",
	value = 0,
}
player.kill_chaos_exalted_sorcerer_difficulty_rank = {
	database_name = "kill_chaos_exalted_sorcerer_difficulty_rank",
	source = "player_data",
	value = 0,
}
player.kill_skaven_grey_seer_difficulty_rank = {
	database_name = "kill_skaven_grey_seer_difficulty_rank",
	source = "player_data",
	value = 0,
}
player.kill_skaven_storm_vermin_warlord_difficulty_rank = {
	database_name = "kill_skaven_storm_vermin_warlord_difficulty_rank",
	source = "player_data",
	value = 0,
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
	"frame",
}) do
	player.highest_equipped_rarity[slot] = {
		source = "player_data",
		value = 0,
		database_name = "highest_equipped_rarity_" .. slot,
	}
end

player.military_statue_kill_chaos_warriors_session = {
	value = 0,
}
player.military_statue_kill_chaos_warriors = {
	database_name = "military_statue_kill_chaos_warriors",
	source = "player_data",
	value = 0,
}
player.halescourge_tornado_enemies = {
	database_name = "halescourge_tornado_enemies",
	source = "player_data",
	value = 0,
}
player.forest_fort_kill_cannonball = {
	database_name = "forest_fort_kill_cannonball",
	source = "player_data",
	value = 0,
}
player.nurgle_bathed_all = {
	database_name = "nurgle_bathed_all",
	source = "player_data",
	value = 0,
}
player.catacombs_added_souls = {
	database_name = "catacombs_added_souls",
	source = "player_data",
	value = 0,
}
player.ussingen_used_no_barrels = {
	database_name = "ussingen_used_no_barrels",
	source = "player_data",
	value = 0,
}
player.elven_ruins_speed_event = {
	database_name = "elven_ruins_speed_event",
	source = "player_data",
	value = 0,
}
player.farmlands_speed_event = {
	database_name = "farmlands_speed_event",
	source = "player_data",
	value = 0,
}
player.bell_speed_event = {
	database_name = "bell_speed_event",
	source = "player_data",
	value = 0,
}
player.mines_speed_event = {
	database_name = "mines_speed_event",
	source = "player_data",
	value = 0,
}
player.skittergate_speed_event = {
	database_name = "skittergate_speed_event",
	source = "player_data",
	value = 0,
}
player.exalted_champion_charge_chaos_warrior = {
	database_name = "exalted_champion_charge_chaos_warrior",
	source = "player_data",
	value = 0,
}
player.storm_vermin_warlord_kills_enemies = {
	database_name = "storm_vermin_warlord_kills_enemies",
	source = "player_data",
	value = 0,
}
player.military_statue_kill_chaos_warriors_cata = {
	database_name = "military_statue_kill_chaos_warriors_cata",
	source = "player_data",
	value = 0,
}
player.halescourge_tornado_enemies_cata = {
	database_name = "halescourge_tornado_enemies_cata",
	source = "player_data",
	value = 0,
}
player.forest_fort_kill_cannonball_cata = {
	database_name = "forest_fort_kill_cannonball_cata",
	source = "player_data",
	value = 0,
}
player.nurgle_bathed_all_cata = {
	database_name = "nurgle_bathed_all_cata",
	source = "player_data",
	value = 0,
}
player.catacombs_added_souls_cata = {
	database_name = "catacombs_added_souls_cata",
	source = "player_data",
	value = 0,
}
player.ussingen_used_no_barrels_cata = {
	database_name = "ussingen_used_no_barrels_cata",
	source = "player_data",
	value = 0,
}
player.elven_ruins_speed_event_cata = {
	database_name = "elven_ruins_speed_event_cata",
	source = "player_data",
	value = 0,
}
player.farmlands_speed_event_cata = {
	database_name = "farmlands_speed_event_cata",
	source = "player_data",
	value = 0,
}
player.bell_speed_event_cata = {
	database_name = "bell_speed_event_cata",
	source = "player_data",
	value = 0,
}
player.mines_speed_event_cata = {
	database_name = "mines_speed_event_cata",
	source = "player_data",
	value = 0,
}
player.skittergate_speed_event_cata = {
	database_name = "skittergate_speed_event_cata",
	source = "player_data",
	value = 0,
}
player.exalted_champion_charge_chaos_warrior_cata = {
	database_name = "exalted_champion_charge_chaos_warrior_cata",
	source = "player_data",
	value = 0,
}
player.storm_vermin_warlord_kills_enemies_cata = {
	database_name = "storm_vermin_warlord_kills_enemies_cata",
	source = "player_data",
	value = 0,
}
player.bonfire_lit_mines = {
	database_name = "bonfire_lit_mines",
	source = "player_data",
	value = 0,
}
player.bonfire_lit_warcamp = {
	database_name = "bonfire_lit_warcamp",
	source = "player_data",
	value = 0,
}
player.bonfire_lit_fort = {
	database_name = "bonfire_lit_fort",
	source = "player_data",
	value = 0,
}
player.bonfire_lit_skittergate = {
	database_name = "bonfire_lit_skittergate",
	source = "player_data",
	value = 0,
}
player.globadier_kill_before_throwing = {
	database_name = "globadier_kill_before_throwing",
	source = "player_data",
	value = 0,
}
player.globadier_kill_during_suicide = {
	database_name = "globadier_kill_during_suicide",
	source = "player_data",
	value = 0,
}
player.globadier_enemies_killed_by_poison = {
	database_name = "globadier_enemies_killed_by_poison",
	source = "player_data",
	value = 0,
}
player.warpfire_kill_before_shooting = {
	database_name = "warpfire_kill_before_shooting",
	source = "player_data",
	value = 0,
}
player.warpfire_kill_on_power_cell = {
	database_name = "warpfire_kill_on_power_cell",
	source = "player_data",
	value = 0,
}
player.warpfire_enemies_killed_by_warpfire = {
	database_name = "warpfire_enemies_killed_by_warpfire",
	source = "player_data",
	value = 0,
}
player.pack_master_dodged_attack = {
	database_name = "pack_master_dodged_attack",
	source = "player_data",
	value = 0,
}
player.pack_master_kill_abducting_ally = {
	database_name = "pack_master_kill_abducting_ally",
	source = "player_data",
	value = 0,
}
player.pack_master_rescue_hoisted_ally = {
	database_name = "pack_master_rescue_hoisted_ally",
	source = "player_data",
	value = 0,
}
player.gutter_runner_killed_on_pounce = {
	database_name = "gutter_runner_killed_on_pounce",
	source = "player_data",
	value = 0,
}
player.gutter_runner_push_on_pounce = {
	database_name = "gutter_runner_push_on_pounce",
	source = "player_data",
	value = 0,
}
player.gutter_runner_push_on_target_pounced = {
	database_name = "gutter_runner_push_on_target_pounced",
	source = "player_data",
	value = 0,
}
player.corruptor_killed_at_teleport_time = {
	database_name = "corruptor_killed_at_teleport_time",
	source = "player_data",
	value = 0,
}
player.corruptor_dodged_attack = {
	database_name = "corruptor_dodged_attack",
	source = "player_data",
	value = 0,
}
player.corruptor_killed_while_grabbing = {
	database_name = "corruptor_killed_while_grabbing",
	source = "player_data",
	value = 0,
}
player.vortex_sorcerer_killed_while_summoning = {
	database_name = "vortex_sorcerer_killed_while_summoning",
	source = "player_data",
	value = 0,
}
player.vortex_sorcerer_killed_while_ally_in_vortex = {
	database_name = "vortex_sorcerer_killed_while_ally_in_vortex",
	source = "player_data",
	value = 0,
}
player.vortex_sorcerer_killed_by_melee = {
	database_name = "vortex_sorcerer_killed_by_melee",
	source = "player_data",
	value = 0,
}
player.ratling_gunner_killed_by_melee = {
	database_name = "ratling_gunner_killed_by_melee",
	source = "player_data",
	value = 0,
}
player.ratling_gunner_killed_while_shooting = {
	database_name = "ratling_gunner_killed_while_shooting",
	source = "player_data",
	value = 0,
}
player.ratling_gunner_blocked_shot = {
	database_name = "ratling_gunner_blocked_shot",
	source = "player_data",
	value = 0,
}
player.chaos_spawn_killed_while_grabbing = {
	database_name = "chaos_spawn_killed_while_grabbing",
	source = "player_data",
	value = 0,
}
player.chaos_spawn_killed_without_having_grabbed = {
	database_name = "chaos_spawn_killed_without_having_grabbed",
	source = "player_data",
	value = 0,
}
player.chaos_troll_killed_without_regen = {
	database_name = "chaos_troll_killed_without_regen",
	source = "player_data",
	value = 0,
}
player.chaos_troll_killed_without_bile_damage = {
	database_name = "chaos_troll_killed_without_bile_damage",
	source = "player_data",
	value = 0,
}
player.rat_ogre_killed_mid_leap = {
	database_name = "rat_ogre_killed_mid_leap",
	source = "player_data",
	value = 0,
}
player.rat_ogre_killed_without_dealing_damage = {
	database_name = "rat_ogre_killed_without_dealing_damage",
	source = "player_data",
	value = 0,
}
player.stormfiend_killed_without_burn_damage = {
	database_name = "stormfiend_killed_without_burn_damage",
	source = "player_data",
	value = 0,
}
player.stormfiend_killed_on_controller = {
	database_name = "stormfiend_killed_on_controller",
	source = "player_data",
	value = 0,
}
player.killed_lord_as_last_player_standing = {
	database_name = "killed_lord_as_last_player_standing",
	source = "player_data",
	value = 0,
}
player.collected_painting_scraps_generic = {
	database_name = "collected_painting_scraps_generic",
	source = "player_data",
	value = 0,
}
player.collected_painting_scraps_unlimited = {
	database_name = "collected_painting_scraps_unlimited",
	source = "player_data",
	value = 0,
}
player.collected_bogenhafen_cosmetics = {
	database_name = "collected_bogenhafen_cosmetics",
	value = 0,
}
player.played_levels_quickplay = {}
player.last_played_level_id = {
	database_name = "last_played_level_id",
	sync_to_host = true,
	value = 0,
}
player.kills_total = {
	sync_on_hot_join = true,
	value = 0,
}
player.kills_critter_total = {
	sync_on_hot_join = true,
	value = 0,
}
player.kills_per_breed = {}
player.kills_per_race = {}
player.kill_assists_per_breed = {}
player.damage_taken = {
	sync_on_hot_join = true,
	value = 0,
}
player.damage_dealt_per_breed = {}
player.completed_levels = {}
player.completed_levels_difficulty = {}
player.completed_career_levels = {}
player.played_difficulty = {}
player.weapon_kills_per_breed = {}
player.mission_streak = {}
player.spawned_times = {
	sync_on_hot_join = true,
	value = 0,
}
player.completed_daily_quests = {
	database_name = "completed_daily_quests",
	source = "player_data",
	value = 0,
}
player.completed_weekly_quests = {
	database_name = "completed_weekly_quests",
	source = "player_data",
	value = 0,
}
player.played_levels_weekly_event = {}
player.completed_weekly_event_difficulty = {}
player.crafted_items = {
	database_name = "crafted_items",
	value = 0,
}
player.salvaged_items = {
	database_name = "salvaged_items",
	value = 0,
}
unit_test.kills_total = {
	database_name = "kills_total",
	value = 0,
}
unit_test.profiles = {
	witch_hunter = {
		kills_total = {
			value = 0,
		},
	},
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
						source = "player_data",
						value = 0,
						database_name = database_name,
					}
				end
			end
		end
	end
end

player.min_health_percentage = {}
player.min_health_completed = {}

for career, _ in pairs(CareerSettings) do
	local career_breed = CareerSettings[career].breed

	if career_breed and career_breed.is_hero then
		player.min_health_percentage[career] = {
			value = 1,
		}

		local database_name = "min_health_completed_" .. career

		player.min_health_completed[career] = {
			source = "player_data",
			value = 0,
			database_name = database_name,
		}
	end
end

for diff, _ in pairs(DifficultySettings) do
	local database_name = "played_difficulty_" .. diff

	player.played_difficulty[diff] = {
		source = "player_data",
		value = 0,
		database_name = database_name,
	}
	database_name = string.format("completed_weekly_event_difficulty_%s", diff)
	player.completed_weekly_event_difficulty[diff] = {
		source = "player_data",
		value = 0,
		database_name = database_name,
	}
end

for breed_name, breed in pairs(Breeds) do
	player.kills_per_breed[breed_name] = {
		sync_on_hot_join = true,
		value = 0,
		name = breed_name,
	}
	player.kill_assists_per_breed[breed_name] = {
		value = 0,
		name = breed_name,
	}
	player.damage_dealt_per_breed[breed_name] = {
		value = 0,
		name = breed_name,
	}

	local race = breed.race

	if race and not player.kills_per_race[race] then
		player.kills_per_race[race] = {
			value = 0,
			name = race,
		}
	end
end

for breed_name, breed in pairs(PlayerBreeds) do
	player.kills_per_breed[breed_name] = {
		sync_on_hot_join = true,
		value = 0,
		name = breed_name,
	}
	player.kill_assists_per_breed[breed_name] = {
		value = 0,
		name = breed_name,
	}
	player.damage_dealt_per_breed[breed_name] = {
		value = 0,
		name = breed_name,
	}

	local race = breed.race

	if race and not player.kills_per_race[race] then
		player.kills_per_race[race] = {
			value = 0,
			name = race,
		}
	end
end

LevelDifficultyDBNames = {}

for level_key, level in pairs(LevelSettings) do
	if table.contains(UnlockableLevels, level_key) then
		local is_dlc_level = level.dlc_name ~= nil
		local completed_levels_definition = {
			sync_on_hot_join = true,
			sync_to_host = true,
			value = 0,
			database_name = "completed_levels_" .. level_key,
		}

		if is_dlc_level then
			completed_levels_definition.source = "player_data"
		end

		player.completed_levels[level_key] = completed_levels_definition

		local played_levels_quickplay_definition = {
			sync_to_host = true,
			value = 0,
			database_name = "played_levels_quickplay_" .. level_key,
		}
		local played_levels_weekly_event_definition = {
			source = "player_data",
			sync_to_host = true,
			value = 0,
			database_name = "played_levels_weekly_event_" .. level_key,
		}

		if is_dlc_level then
			played_levels_quickplay_definition.source = "player_data"
		end

		player.played_levels_quickplay[level_key] = played_levels_quickplay_definition
		player.played_levels_weekly_event[level_key] = played_levels_weekly_event_definition

		local heroes = {
			"bright_wizard",
			"wood_elf",
			"empire_soldier",
			"witch_hunter",
			"dwarf_ranger",
		}

		for _, hero in ipairs(heroes) do
			local key = "completed_levels_" .. hero
			local t = player[key]
			local definition = {
				value = 0,
				database_name = key .. "_" .. level_key,
			}

			if is_dlc_level then
				definition.source = "player_data"
			end

			t[level_key] = definition
		end

		local level_difficulty_name = level_key .. "_difficulty_completed"

		LevelDifficultyDBNames[level_key] = level_difficulty_name

		local completed_levels_difficulty_definition = {
			sync_on_hot_join = true,
			value = 0,
			database_name = level_difficulty_name,
		}

		if is_dlc_level then
			completed_levels_difficulty_definition.source = "player_data"
		end

		player.completed_levels_difficulty[level_difficulty_name] = completed_levels_difficulty_definition

		local grimoire_name = "collected_grimoire_" .. level_key
		local collected_grimoires_definition = {
			value = 0,
			database_name = grimoire_name,
		}

		if is_dlc_level then
			collected_grimoires_definition.source = "player_data"
		end

		player.collected_grimoires[level_key] = collected_grimoires_definition

		local tome_name = "collected_tome_" .. level_key
		local tome_name_definition = {
			value = 0,
			database_name = tome_name,
		}

		if is_dlc_level then
			tome_name_definition.source = "player_data"
		end

		player.collected_tomes[level_key] = tome_name_definition

		local die_name = "collected_die_" .. level_key
		local die_name_definition = {
			value = 0,
			database_name = die_name,
		}

		if is_dlc_level then
			die_name_definition.source = "player_data"
		end

		player.collected_dice[level_key] = die_name_definition

		local painting_name = "collected_painting_scraps_" .. level_key

		player.collected_painting_scraps[level_key] = {
			source = "player_data",
			value = 0,
			database_name = painting_name,
		}
	end
end

DLCUtils.dofile_list("statistics_definitions")

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

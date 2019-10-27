require("scripts/settings/horde_compositions")
require("scripts/settings/horde_compositions_pacing")
require("scripts/settings/difficulty_settings")
require("scripts/managers/conflict_director/conflict_utils")
require("scripts/settings/terror_event_blueprints")

WeaveSettings = WeaveSettings or {}
WeaveSettings.damage_taken_score_weighting = 1
WeaveSettings.time_score_weighting = 1
WeaveSettings.starting_time = 900
WeaveSettings.bonus_time = 300
WeaveSettings.max_time = WeaveSettings.starting_time + WeaveSettings.bonus_time
WeaveSettings.max_damage_taken = 900
WeaveSettings.rating_values = {
	12000,
	9000,
	6000,
	3000,
	0
}
WeaveSettings.enemies_score_multipliers = {
	default = 1,
	skaven_plague_monk = 5,
	skaven_clan_rat_with_shield = 2,
	chaos_exalted_champion = 12,
	skaven_poison_wind_globadier = 8,
	beastmen_bestigor = 5,
	chaos_raider = 5,
	skaven_gutter_runner = 8,
	chaos_marauder = 2,
	beastmen_minotaur = 32,
	chaos_fanatic = 1.5,
	skaven_slave = 1,
	skaven_storm_vermin_champion = 32,
	skaven_storm_vermin_warlord = 32,
	skaven_clan_rat = 1.5,
	skaven_stormfiend = 32,
	skaven_stormfiend_boss = 32,
	skaven_storm_vermin_with_shield = 8,
	chaos_exalted_sorcerer = 8,
	skaven_rat_ogre = 32,
	chaos_troll = 32,
	chaos_spawn = 32,
	chaos_corruptor_sorcerer = 8,
	chaos_vortex_sorcerer = 10,
	skaven_storm_vermin = 5,
	beastmen_gor = 2,
	beastmen_standard_bearer = 5,
	chaos_berzerker = 5,
	skaven_warpfire_thrower = 8,
	chaos_marauder_with_shield = 4,
	skaven_pack_master = 8,
	beastmen_ungor = 1.5,
	skaven_grey_seer = 8,
	chaos_warrior = 12,
	beastmen_ungor_archer = 1.5,
	skaven_storm_vermin_commander = 5,
	skaven_ratling_gunner = 8
}
WeaveSettings.score = {
	{
		essence = 80
	},
	{
		essence = 100
	},
	{
		essence = 105
	},
	{
		essence = 110
	},
	{
		essence = 120
	},
	{
		essence = 150
	},
	{
		essence = 180
	},
	{
		essence = 210
	},
	{
		essence = 280
	},
	{
		essence = 370
	},
	{
		essence = 500
	},
	{
		essence = 670
	},
	{
		essence = 920
	},
	{
		essence = 1260
	},
	{
		essence = 1730
	},
	{
		essence = 2380
	},
	{
		essence = 3300
	},
	{
		essence = 4580
	},
	{
		essence = 6390
	},
	{
		essence = 6390
	},
	{
		essence = 7400
	},
	{
		essence = 8320
	},
	{
		essence = 9160
	},
	{
		essence = 9940
	},
	{
		essence = 10650
	},
	{
		essence = 11300
	},
	{
		essence = 11910
	},
	{
		essence = 12470
	},
	{
		essence = 13000
	},
	{
		essence = 13490
	},
	{
		essence = 13950
	},
	{
		essence = 14380
	},
	{
		essence = 14780
	},
	{
		essence = 15160
	},
	{
		essence = 15520
	},
	{
		essence = 15860
	},
	{
		essence = 16180
	},
	{
		essence = 16480
	},
	{
		essence = 16770
	},
	{
		essence = 17040
	}
}

if PLATFORM ~= "xb1" then
	WeaveMatchmakingSettings = {
		hosting_time = 20,
		expansion_rules = {
			{
				other_requirements = {
					allow_hosted_weaves = false,
					allow_occupied_hero_lobbies = false
				},
				filters = {
					difficulty = {
						fetch_function = function (state)
							local search_config = state.search_config
							local difficulty = search_config.difficulty

							return difficulty
						end,
						comparison = LobbyComparison.EQUAL
					},
					game_mode = {
						fetch_function = function (state)
							local value = (PLATFORM == "win32" and NetworkLookup.game_modes.weave_find_group) or "weave_find_group"

							return value
						end,
						debug_format = function (value)
							return NetworkLookup.game_modes[value]
						end,
						comparison = LobbyComparison.EQUAL
					}
				},
				near_filters = {
					power_level = {
						fetch_function = function (state)
							local local_player = Managers.player:local_player()
							local hero_name = local_player:profile_display_name()
							local career_name = local_player:career_name()
							local power_level = BackendUtils.get_total_power_level(hero_name, career_name, "weave")

							return power_level
						end,
						transform_data_function = function (lobby_data_value)
							return tonumber(lobby_data_value)
						end,
						requirements = {
							range_down = 50,
							range_up = 50
						}
					},
					weave_name = {
						fetch_function = function (state)
							local ignore_dlc_check = false
							local current_weave = LevelUnlockUtils.current_weave(state._statistics_db, state._stats_id, ignore_dlc_check)

							return current_weave
						end,
						transform_data_function = function (lobby_data_value)
							local weave_template = WeaveSettings.templates[lobby_data_value]
							local weave_index = table.find(WeaveSettings.templates_ordered, weave_template)

							return weave_index
						end,
						requirements = {
							range_down = 5,
							range_up = 5
						}
					}
				}
			},
			{
				other_requirements = {
					allow_hosted_weaves = true,
					allow_occupied_hero_lobbies = false
				},
				filters = {},
				near_filters = {
					power_level = {
						fetch_function = function (state)
							local local_player = Managers.player:local_player()
							local hero_name = local_player:profile_display_name()
							local career_name = local_player:career_name()
							local power_level = BackendUtils.get_total_power_level(hero_name, career_name, "weave")

							return power_level
						end,
						transform_data_function = function (lobby_data_value)
							return tonumber(lobby_data_value)
						end,
						requirements = {
							range_down = 150,
							range_up = 150
						}
					},
					weave_name = {
						fetch_function = function (state)
							local ignore_dlc_check = false
							local current_weave = LevelUnlockUtils.current_weave(state._statistics_db, state._stats_id, ignore_dlc_check)

							return current_weave
						end,
						transform_data_function = function (lobby_data_value)
							local weave_template = WeaveSettings.templates[lobby_data_value]
							local weave_index = table.find(WeaveSettings.templates_ordered, weave_template)

							return weave_index
						end,
						requirements = {
							range_down = 10,
							range_up = 10
						}
					}
				}
			},
			{
				other_requirements = {
					allow_hosted_weaves = true,
					allow_occupied_hero_lobbies = true
				},
				filters = {},
				near_filters = {}
			}
		}
	}
	WeaveMatchmakingSettings.num_expansion_rules = #WeaveMatchmakingSettings.expansion_rules
else
	WeaveMatchmakingSettings = {
		rule_timeout = 20,
		expansion_rules = {
			{
				difficulty = {},
				matchmaking_types = {
					value = {
						"weave_find_group"
					}
				},
				network_hash = {},
				powerlevel = {},
				profiles = {},
				weave_index = {}
			},
			{
				matchmaking_types = {
					value = {
						"weave_find_group",
						"weave"
					}
				},
				network_hash = {},
				powerlevel = {},
				profiles = {},
				weave_index = {}
			},
			{
				matchmaking_types = {
					value = {
						"weave_find_group",
						"weave"
					}
				},
				network_hash = {}
			}
		}
	}
	WeaveMatchmakingSettings.num_expansion_rules = #WeaveMatchmakingSettings.expansion_rules
end

local templates = {}
local weaves_to_add = {
	"weave_1",
	"weave_2",
	"weave_3",
	"weave_4",
	"weave_5",
	"weave_6",
	"weave_7",
	"weave_8",
	"weave_9",
	"weave_10",
	"weave_11",
	"weave_12",
	"weave_13",
	"weave_14",
	"weave_15",
	"weave_16",
	"weave_17",
	"weave_18",
	"weave_19",
	"weave_20",
	"weave_21",
	"weave_22",
	"weave_23",
	"weave_24",
	"weave_25",
	"weave_26",
	"weave_27",
	"weave_28",
	"weave_29",
	"weave_30",
	"weave_31",
	"weave_32",
	"weave_33",
	"weave_34",
	"weave_35",
	"weave_36",
	"weave_37",
	"weave_38",
	"weave_39",
	"weave_40"
}

for i = 1, #weaves_to_add, 1 do
	local name = weaves_to_add[i]
	local path = string.format("scripts/settings/weaves/%s", name)
	local template = local_require(path)
	templates[#templates + 1] = template
end

function generate_missing_weave_horde_compositions()
	local added_compositions = {}
	local missing_composition_string = "\n"

	for i = 1, #weaves_to_add, 1 do
		local name = weaves_to_add[i]
		local path = string.format("scripts/settings/weaves/%s", name)
		local template = local_require(path)
		missing_composition_string = get_missing_horde_compositions_string(template, added_compositions, missing_composition_string)
	end

	print(missing_composition_string)
end

local num_templates = #templates
WeaveSettings.difficulty_increases = {
	{
		breakpoint = 10,
		difficulty_key = "normal",
		scaling_settings = {
			enemy_damage = {
				0,
				0.35
			}
		}
	},
	{
		breakpoint = 20,
		difficulty_key = "hard",
		scaling_settings = {
			enemy_damage = {
				0,
				0.35
			}
		}
	},
	{
		breakpoint = 30,
		difficulty_key = "harder",
		scaling_settings = {
			enemy_damage = {
				0,
				0.5
			}
		}
	},
	{
		breakpoint = 40,
		difficulty_key = "hardest"
	},
	{
		breakpoint = 60,
		difficulty_key = "cataclysm",
		scaling_settings = {
			diminishing_damage = {
				0,
				0.3
			}
		}
	},
	{
		breakpoint = 80,
		difficulty_key = "cataclysm_2",
		scaling_settings = {
			diminishing_damage = {
				0.3,
				0.6
			}
		}
	},
	{
		breakpoint = 90,
		difficulty_key = "cataclysm_3",
		scaling_settings = {
			diminishing_damage = {
				0.6,
				1
			}
		}
	},
	{
		breakpoint = 100,
		difficulty_key = "cataclysm_3",
		scaling_settings = {
			diminishing_damage = {
				1,
				1
			},
			enemy_damage = {
				0,
				1
			}
		}
	},
	{
		breakpoint = 110,
		difficulty_key = "cataclysm_3",
		scaling_settings = {
			diminishing_damage = {
				1,
				1
			},
			enemy_damage = {
				1,
				4
			}
		}
	},
	{
		breakpoint = 120,
		difficulty_key = "cataclysm_3",
		scaling_settings = {
			diminishing_damage = {
				1,
				1
			},
			enemy_damage = {
				4,
				9
			}
		}
	},
	{
		breakpoint = 160,
		difficulty_key = "cataclysm_3",
		scaling_settings = {
			diminishing_damage = {
				1,
				1
			},
			enemy_damage = {
				9,
				9
			}
		}
	}
}
local weave_objective_names = {}
WeaveSettings.winds = {
	"fire",
	"beasts",
	"death",
	"heavens",
	"light",
	"shadow",
	"life",
	"metal"
}
WeaveSettings.templates = {}
WeaveSettings.templates_ordered = {}

for i = 1, num_templates * 4, 1 do
	local index = i % num_templates

	if index == 0 then
		index = num_templates or index
	end

	local template = table.clone(templates[index])
	local name = "weave_" .. i
	local seed = template.seed
	local objectives = template.objectives
	local objective = objectives[1]
	local wind_name = template.wind
	template.display_name = objective.base_level_id .. "_" .. wind_name .. "_name"
	template.name = name
	template.tier = i
	template.dlc_name = "scorpion"
	local difficulty_key = "cataclysm_3"
	local scaling_settings = nil

	for _, increase_data in ipairs(WeaveSettings.difficulty_increases) do
		if i <= increase_data.breakpoint then
			difficulty_key = increase_data.difficulty_key
			scaling_settings = increase_data.scaling_settings

			break
		end
	end

	template.difficulty_key = difficulty_key
	template.scaling_settings = scaling_settings

	for k = 1, #objectives, 1 do
		local objective = objectives[k]
		local level_id = objective.level_id
		local objective_settings = objective.objective_settings
		local objective_lists = objective_settings and objective_settings.objective_lists

		if objective_lists then
			for _, objective_set in ipairs(objective_lists) do
				for objective_name, _ in pairs(objective_set) do
					weave_objective_names[objective_name] = true
				end
			end
		end
	end

	WeaveSettings.templates[name] = template
	WeaveSettings.templates_ordered[i] = template
end

WeaveSettings.objective_names = objective_names
WeaveSettings.weave_objective_names = weave_objective_names
local max_int = math.pow(2, 32)
local TEMP_TABLE = {}

local function objective_sort_func(a, b)
	return a.sort_index < b.sort_index
end

local function sort_objective_indices(weave_template)
	local objectives_ordered = {}
	local objectives = weave_template.objectives

	for objective_index, objective in ipairs(objectives) do
		objectives_ordered[objective_index] = {}
		local objective_settings = objective.objective_settings
		local objective_lists = objective_settings and objective_settings.objective_lists

		if objective_lists then
			for list_index, objective_list in ipairs(objective_lists) do
				table.clear(TEMP_TABLE)

				for objective_name, objective_data in pairs(objective_list) do
					local sort_index = objective_data.sort_index or max_int
					TEMP_TABLE[#TEMP_TABLE + 1] = {
						sort_index = sort_index,
						objective_name = objective_name
					}
				end

				table.sort(TEMP_TABLE, objective_sort_func)

				for _, objective_data in pairs(TEMP_TABLE) do
					local objective_name = objective_data.objective_name
					objectives_ordered[objective_index][#objectives_ordered[objective_index] + 1] = objective_name
				end
			end
		end
	end

	weave_template.objectives_ordered = objectives_ordered
end

for weave_name, weave_template in ipairs(WeaveSettings.templates_ordered) do
	sort_objective_indices(weave_template)
end

local function calc_spawn_enemy(difficulty_rank, event)
	local enemy_count = 0
	local difficulty_required = event.difficulty_requirement

	if difficulty_required and difficulty_rank < difficulty_required then
		return enemy_count
	end

	local breed_name = event.breed_name

	if type(breed_name) == "table" then
		enemy_count = #breed_name
	else
		enemy_count = 1
	end

	return enemy_count
end

local function calculate_enemy_count(main_path_spawning, difficulty_key, weave_name)
	local difficulty_rank = DifficultySettings[difficulty_key].rank
	local enemy_count = 0

	for _, event_data in ipairs(main_path_spawning) do
		local terror_event_name = event_data.terror_event_name
		local terror_event_blueprints = TerrorEventBlueprints.weaves
		local terror_event = terror_event_blueprints[terror_event_name]

		for i = 1, #terror_event, 1 do
			local sub_event = terror_event[i]
			local sub_event_name = sub_event[1]

			if sub_event_name == "spawn" or sub_event_name == "spawn_at_raw" or sub_event_name == "spawn_special" then
				enemy_count = enemy_count + calc_spawn_enemy(difficulty_rank, event_data)
			elseif sub_event_name == "event_horde" then
				local event_composition_type = sub_event.composition_type
				local difficulty_index = difficulty_rank - 1
				local event_composition = HordeCompositions[event_composition_type][difficulty_index]

				fassert(event_composition ~= nil, string.format("[WeaveSettings] No horde composition found for '%s' on difficulty '%s'", event_composition_type, difficulty_key))

				for j = 1, #event_composition, 1 do
					local composition = event_composition[j]
					local breeds = composition.breeds

					for k = 1, #breeds, 2 do
						local breed_count = breeds[k + 1]

						if type(breed_count) == "table" then
							breed_count = breed_count[2]
						end

						enemy_count = enemy_count + breed_count
					end
				end
			end
		end
	end

	return enemy_count
end

for weave_name, weave_template in pairs(WeaveSettings.templates) do
	local objectives = weave_template.objectives

	for idx, objective in ipairs(objectives) do
		if objective.conflict_settings == "weave_disabled" then
			local spawning_settings = objective.spawning_settings
			local main_path_spawning = spawning_settings and spawning_settings.main_path_spawning

			fassert(main_path_spawning, "[WeaveSettings] No main path spawning in %q on objective: %q", weave_name, idx)

			local enemy_count = calculate_enemy_count(main_path_spawning, weave_template.difficulty_key, weave_name)
			objective.enemy_count = enemy_count
			objective.track_kills = true
			objective.bar_cutoff = 100
			objective.bar_multiplier = 0.25
		else
			objective.bar_cutoff = 75
			objective.bar_multiplier = 0.75
		end
	end
end

return

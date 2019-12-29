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
WeaveSettings.kill_percentages = {
	default = 0.5,
	roamers = 0.25,
	capture_points = 1
}
WeaveSettings.roaming_multiplier = {
	xb1 = 0.3,
	win32 = 0.1,
	ps4 = 0.3
}
WeaveSettings.base_score_per_kill = 0.3
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
WeaveSettings.weave_wind_ranges = {}

for i = 1, #weaves_to_add, 1 do
	local name = weaves_to_add[i]
	local path = string.format("scripts/settings/weaves/%s", name)
	local template = local_require(path)
	local wind_name = template.wind

	if not WeaveSettings.weave_wind_ranges[wind_name] then
		WeaveSettings.weave_wind_ranges[wind_name] = {
			i
		}
	else
		table.insert(WeaveSettings.weave_wind_ranges[wind_name], i)
	end

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
				0.8
			}
		}
	},
	{
		breakpoint = 100,
		difficulty_key = "cataclysm_3",
		scaling_settings = {
			diminishing_damage = {
				0.8,
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
				0,
				0.25
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
				0.25,
				0.75
			}
		}
	},
	{
		breakpoint = 130,
		difficulty_key = "cataclysm_3",
		scaling_settings = {
			diminishing_damage = {
				1,
				1
			},
			enemy_damage = {
				0.75,
				2
			}
		}
	},
	{
		breakpoint = 140,
		difficulty_key = "cataclysm_3",
		scaling_settings = {
			diminishing_damage = {
				1,
				1
			},
			enemy_damage = {
				2,
				5
			}
		}
	},
	{
		breakpoint = 150,
		difficulty_key = "cataclysm_3",
		scaling_settings = {
			diminishing_damage = {
				1,
				1
			},
			enemy_damage = {
				5,
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

local TO_SPAWN = {}

local function calc_spawn_enemy(difficulty_rank, event)
	local enemy_count = 0
	local difficulty_required = event.difficulty_requirement

	if difficulty_required and difficulty_rank < difficulty_required then
		return enemy_count
	end

	local breed_name = event.breed_name

	if not breed_name then
		table.dump(event, "TEST", 2)
		assert(false)
	elseif type(breed_name) == "table" then
		enemy_count = #breed_name

		for _, breed_name in pairs(breed_name) do
			TO_SPAWN[breed_name] = (TO_SPAWN[breed_name] or 0) + 1
		end
	else
		TO_SPAWN[breed_name] = (TO_SPAWN[breed_name] or 0) + 1
		enemy_count = 1
	end

	return enemy_count
end

local function calc_spawn_weave_special(element, difficulty_key, seed)
	local check_name = element.breed_name
	local num_to_spawn = element.amount or 1
	local enemy_count = 0

	for i = 1, num_to_spawn, 1 do
		local breed_name, index = nil

		if type(check_name) == "table" then
			seed, index = Math.next_random(seed, 1, #check_name)
			breed_name = check_name[index]
			TO_SPAWN[breed_name] = (TO_SPAWN[breed_name] or 0) + 1
		else
			breed_name = check_name
			TO_SPAWN[breed_name] = (TO_SPAWN[breed_name] or 0) + 1
		end

		enemy_count = enemy_count + 1
	end

	return enemy_count, seed
end

local function calc_spawn_weave_special_event(element, difficulty_key, seed)
	local breed_name = nil
	local check_name = element.breed_name
	local num_to_spawn = element.amount or 1
	local num_to_spawn_scaled = element.difficulty_amount
	local enemy_count = 0

	if num_to_spawn_scaled then
		local chosen_amount = num_to_spawn_scaled[difficulty_key]
		chosen_amount = chosen_amount or num_to_spawn_scaled.hardest

		if type(chosen_amount) == "table" then
			local index = nil
			seed, index = Math.next_random(seed, 1, #chosen_amount)
			num_to_spawn = chosen_amount[index]
		else
			num_to_spawn = chosen_amount
		end
	elseif type(num_to_spawn) == "table" then
		local index = nil
		seed, index = Math.next_random(seed, 1, #num_to_spawn)
		num_to_spawn = num_to_spawn[index]
	end

	if type(check_name) == "table" then
		local index = nil
		seed, index = Math.next_random(seed, 1, #check_name)
		breed_name = check_name[index]
	else
		breed_name = check_name
	end

	enemy_count = num_to_spawn
	TO_SPAWN[breed_name] = (TO_SPAWN[breed_name] or 0) + num_to_spawn

	return enemy_count, seed
end

local include_terror_event_from_objectives = {
	kill = true,
	interactions = true,
	targets = true,
	sockets = true,
	capture_points = false,
	doom_wheels = true
}

local function calculate_enemy_count_from_terror_event(terror_event_name, difficulty_key, enemy_count, seed)
	local difficulty_rank = DifficultySettings[difficulty_key].rank
	local terror_event_blueprints = TerrorEventBlueprints.weaves
	local terror_event = terror_event_blueprints[terror_event_name]

	for i = 1, #terror_event, 1 do
		local sub_event = terror_event[i]
		local sub_event_name = sub_event[1]

		if sub_event_name == "spawn_weave_special" then
			local count = 0
			count, seed = calc_spawn_weave_special(sub_event, difficulty_key, seed)
			enemy_count = enemy_count + count
		elseif sub_event_name == "spawn_weave_special_event" then
			local count = 0
			count, seed = calc_spawn_weave_special_event(sub_event, difficulty_key, seed)
			enemy_count = enemy_count + count
		elseif sub_event_name == "spawn" or sub_event_name == "spawn_at_raw" then
			enemy_count = enemy_count + calc_spawn_enemy(difficulty_rank, sub_event)
		elseif sub_event_name == "event_horde" or sub_event_name == "ambush_horde" then
			local event_composition_type = sub_event.composition_type
			local difficulty_index = difficulty_rank - 1
			local event_composition = HordeCompositions[event_composition_type][difficulty_index]

			fassert(event_composition ~= nil, string.format("[WeaveSettings] No horde composition found for '%s' on difficulty '%s'", event_composition_type, difficulty_key))

			for j = 1, #event_composition, 1 do
				local composition = event_composition[j]
				local breeds = composition.breeds

				for k = 1, #breeds, 2 do
					local breed_name = breeds[k]
					local breed_count = breeds[k + 1]

					if type(breed_count) == "table" then
						breed_count = breed_count[#breed_count]
					end

					enemy_count = enemy_count + breed_count
					TO_SPAWN[breed_name] = (TO_SPAWN[breed_name] or 0) + breed_count
				end
			end
		end
	end

	return enemy_count, seed
end

local function calculate_enemy_count(main_path_spawning, difficulty_key, weave_name, enemy_count, seed)
	if weave_name == "weave_5" then
		slot5 = 0
	end

	for _, event_data in ipairs(main_path_spawning) do
		local terror_event_name = event_data.terror_event_name
		enemy_count, seed = calculate_enemy_count_from_terror_event(terror_event_name, difficulty_key, enemy_count, seed)
	end

	return enemy_count, seed
end

local function calculate_enemy_count_from_terror_events(terror_events, difficulty_key, weave_name, enemy_count, seed)
	if weave_name == "weave_5" then
		slot5 = 0
	end

	for _, terror_event_name in ipairs(terror_events) do
		enemy_count, seed = calculate_enemy_count_from_terror_event(terror_event_name, difficulty_key, enemy_count, seed)
	end

	return enemy_count, seed
end

local function fetch_kill_enemies_score_multipliers(objective)
	local objective_settings = objective.objective_settings

	if not objective_settings then
		return
	end

	local objective_lists = objective_settings.objective_lists

	if not objective_lists then
		return
	end

	local score_multiplier = nil
	local total_objective_score = 0

	for _, objective_list in pairs(objective_lists) do
		for name, objective_data in pairs(objective_list) do
			if name == "kill_enemies" then
				score_multiplier = objective_data.score_multiplier
			else
				total_objective_score = total_objective_score + objective_data.score
			end
		end
	end

	return score_multiplier, total_objective_score
end

local function set_kill_enemies_score_multipliers(objective, score_multipliers)
	local objective_settings = objective.objective_settings
	local objective_lists = objective_settings and objective_settings.objective_lists

	for _, objective_list in pairs(objective_lists) do
		for objective_name, objective_data in pairs(objective_list) do
			if objective_name == "kill_enemies" then
				objective_data.score_multiplier = score_multipliers
			end
		end
	end
end

function calculate_score_multipliers(objective, weave_name)
	local kill_enemies_score_multipliers, total_objective_score = fetch_kill_enemies_score_multipliers(objective)

	if not kill_enemies_score_multipliers then
		return 0
	end

	if type(kill_enemies_score_multipliers) ~= "table" then
		print(weave_name)

		return
	end

	local base_score_multiplier = WeaveSettings.base_score_per_kill
	local base_difficulty_multiplier = 1
	local total_base_score = {}
	local set_score = {}
	local to_spawn = objective.to_spawn

	for difficulty_key, _ in pairs(DifficultySettings) do
		local score_multiplier = kill_enemies_score_multipliers[difficulty_key]

		for breed_name, count in pairs(to_spawn[difficulty_key]) do
			local breed_multiplier = WeaveSettings.enemies_score_multipliers[breed_name] or WeaveSettings.enemies_score_multipliers.default
			total_base_score[difficulty_key] = (total_base_score[difficulty_key] or 0) + base_score_multiplier * base_difficulty_multiplier * breed_multiplier * count

			if score_multiplier then
				set_score[difficulty_key] = (set_score[difficulty_key] or 0) + base_score_multiplier * score_multiplier * breed_multiplier * count
			end
		end
	end

	local calculated_multipliers = {}
	local set_score_percentages = {}
	local score_to_fill = 100 - total_objective_score
	local objective_type = objective.objective_type
	local kill_percentage = WeaveSettings.kill_percentages[objective_type] or WeaveSettings.kill_percentages.default
	local base_kill_percentage = WeaveSettings.base_kill_percentage

	for difficulty_key, base_score in pairs(total_base_score) do
		calculated_multipliers[difficulty_key] = math.max(score_to_fill / (base_score * kill_percentage), 0.1)
	end

	objective.calculated_multipliers = calculated_multipliers
	objective.kill_enemies_score_multipliers = kill_enemies_score_multipliers
	objective.total_base_score = total_base_score
	objective.set_score = set_score

	set_kill_enemies_score_multipliers(objective, calculated_multipliers)
end

local SCRATCH = {}
local time = os.clock()

for weave_name, weave_template in pairs(WeaveSettings.templates) do
	local objectives = weave_template.objectives

	for idx, objective in ipairs(objectives) do
		table.clear(SCRATCH)

		local objective_type = objective.objective_type
		local spawning_settings = objective.spawning_settings
		local main_path_spawning = spawning_settings and spawning_settings.main_path_spawning
		local objective_terror_events = objective.terror_events or SCRATCH

		fassert(main_path_spawning, "[WeaveSettings] No main path spawning in %q on objective: %q", weave_name, idx)

		local enemy_count = {}
		local to_spawn = {}

		for difficulty_key, difficulty_data in pairs(DifficultySettings) do
			table.clear(TO_SPAWN)

			local spawning_seed = objective.spawning_seed
			local cnt = 0
			cnt, spawning_seed = calculate_enemy_count(main_path_spawning, difficulty_key, weave_name, cnt, spawning_seed)

			if objective_type and include_terror_event_from_objectives[objective_type] then
				cnt, spawning_seed = calculate_enemy_count_from_terror_events(objective_terror_events, difficulty_key, weave_name, cnt, spawning_seed)
			end

			enemy_count[difficulty_key] = cnt
			to_spawn[difficulty_key] = table.clone(TO_SPAWN)
		end

		objective.to_spawn = to_spawn
		objective.enemy_count = enemy_count

		if objective.conflict_settings == "weave_disabled" then
			objective.track_kills = true
			objective.bar_cutoff = 100
			objective.bar_multiplier = 0.25
		else
			objective.bar_cutoff = 75
			objective.bar_multiplier = 0.75
		end

		calculate_score_multipliers(objective, weave_name)
	end
end

print("TIME: " .. os.clock() - time)

return

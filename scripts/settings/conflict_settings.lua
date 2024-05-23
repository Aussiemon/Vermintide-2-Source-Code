﻿-- chunkname: @scripts/settings/conflict_settings.lua

require("scripts/settings/horde_compositions")
require("scripts/settings/horde_compositions_pacing")
require("scripts/settings/difficulty_settings")
require("scripts/managers/conflict_director/conflict_utils")

HordeSettingsBasics = {
	ambush = {
		max_spawners = math.huge,
		max_size,
		max_hidden_spawner_dist = 40,
		max_horde_spawner_dist = 35,
		min_hidden_spawner_dist = 5,
		min_horde_spawner_dist = 1,
		min_spawners = 3,
		start_delay = 3.45,
	},
	vector = {
		max_size,
		main_path_chance_spawning_ahead = 0.67,
		main_path_dist_from_players = 30,
		max_hidden_spawner_dist = 40,
		max_horde_spawner_dist = 40,
		max_spawners = 6,
		min_hidden_spawner_dist = 0,
		min_horde_spawner_dist = 0,
		raw_dist_from_players = 20,
		start_delay = 8,
	},
	vector_blob = {
		max_size,
		main_path_chance_spawning_ahead = 0.67,
		main_path_dist_from_players = 60,
		raw_dist_from_players = 20,
		start_delay = 1,
	},
}

do
	local weights = {}
	local crash
	local num_comps = 0

	for name, composition in pairs(HordeCompositions) do
		num_comps = num_comps + 1

		for i = 1, #composition do
			table.clear_array(weights, #weights)

			local compositions = composition[i]

			for j, variant in ipairs(compositions) do
				weights[j] = variant.weight

				local breeds = variant.breeds

				for k = 1, #breeds, 2 do
					local breed_name = breeds[k]
					local breed = Breeds[breed_name]

					if not breed then
						print(string.format("Bad or non-existing breed in HordeCompositions table %s : '%s' defined in HordeCompositions.", name, tostring(breed_name)))

						crash = true
					elseif not breed.can_use_horde_spawners then
						variant.must_use_hidden_spawners = true
					end
				end
			end

			compositions.loaded_probs = {
				LoadedDice.create(weights),
			}

			fassert(not crash, "Found errors in HordeComposition table %s - see above. ", name)
			fassert(compositions.loaded_probs, "Could not create horde compositison sprobablitity table, make sure the table '%s' in HordeCompositions is correctly structured and has an entry for each difficulty.", name)
		end
	end
end

HordeSettings = {
	default = {
		ambush_composition = "medium",
		chance_of_vector = 0.5,
		chance_of_vector_blob = 0.5,
		disabled = false,
		mini_patrol_composition = "mini_patrol",
		mix_paced_hordes = true,
		vector_blob_composition = "medium",
		vector_composition = "medium",
		compositions = HordeCompositions,
		compositions_pacing = HordeCompositionsPacing,
		ambush = HordeSettingsBasics.ambush,
		vector = HordeSettingsBasics.vector,
		vector_blob = HordeSettingsBasics.vector_blob,
		difficulty_overrides = {
			hard = {
				ambush_composition = "medium",
				vector_blob_composition = "medium",
				vector_composition = "medium",
			},
			harder = {
				ambush_composition = "large",
				vector_blob_composition = "large",
				vector_composition = "large",
			},
			hardest = {
				ambush_composition = "large",
				vector_blob_composition = "large",
				vector_composition = "large",
			},
			cataclysm = {
				ambush_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker",
				},
				vector_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker",
				},
				vector_blob_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker",
				},
			},
			cataclysm_2 = {
				ambush_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker",
				},
				vector_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker",
				},
				vector_blob_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker",
				},
			},
			cataclysm_3 = {
				ambush_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker",
				},
				vector_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker",
				},
				vector_blob_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker",
				},
			},
			versus_base = {
				ambush_composition = "large",
				vector_blob_composition = "large",
				vector_composition = "large",
			},
		},
	},
	default_light = {
		ambush_composition = "medium",
		chance_of_vector = 0.5,
		chance_of_vector_blob = 0.5,
		disabled = false,
		mini_patrol_composition = "mini_patrol",
		mix_paced_hordes = true,
		vector_blob_composition = "medium",
		vector_composition = "medium",
		compositions = HordeCompositions,
		compositions_pacing = HordeCompositionsPacing,
		ambush = HordeSettingsBasics.ambush,
		vector = HordeSettingsBasics.vector,
		vector_blob = HordeSettingsBasics.vector_blob,
		difficulty_overrides = {
			hard = {
				ambush_composition = "medium",
				vector_blob_composition = "medium",
				vector_composition = "medium",
			},
			harder = {
				ambush_composition = "large",
				vector_blob_composition = "large",
				vector_composition = "large",
			},
			hardest = {
				ambush_composition = "large",
				vector_blob_composition = "large",
				vector_composition = "large",
			},
			cataclysm = {
				ambush_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker",
				},
				vector_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker",
				},
				vector_blob_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker",
				},
			},
			cataclysm_2 = {
				ambush_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker",
				},
				vector_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker",
				},
				vector_blob_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker",
				},
			},
			cataclysm_3 = {
				ambush_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker",
				},
				vector_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker",
				},
				vector_blob_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker",
				},
			},
			versus_base = {
				ambush_composition = "large",
				vector_blob_composition = "large",
				vector_composition = "large",
			},
		},
	},
	chaos = {
		ambush_composition = "chaos_medium",
		chance_of_vector = 1,
		chance_of_vector_blob = 1,
		disabled = false,
		mini_patrol_composition = "chaos_mini_patrol",
		mix_paced_hordes = true,
		vector_blob_composition = "chaos_medium",
		vector_composition = "chaos_medium",
		compositions = HordeCompositions,
		compositions_pacing = HordeCompositionsPacing,
		ambush = HordeSettingsBasics.ambush,
		vector = HordeSettingsBasics.vector,
		vector_blob = HordeSettingsBasics.vector_blob,
		difficulty_overrides = {
			hard = {
				ambush_composition = "chaos_medium",
				vector_blob_composition = "chaos_medium",
				vector_composition = "chaos_medium",
			},
			harder = {
				ambush_composition = "chaos_large",
				vector_blob_composition = "chaos_large",
				vector_composition = "chaos_large",
			},
			hardest = {
				ambush_composition = "chaos_large",
				vector_blob_composition = "chaos_large",
				vector_composition = "chaos_large",
			},
			cataclysm = {
				ambush_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker",
				},
				vector_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker",
				},
				vector_blob_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker",
				},
			},
			cataclysm_2 = {
				ambush_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker",
				},
				vector_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker",
				},
				vector_blob_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker",
				},
			},
			cataclysm_3 = {
				ambush_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker",
				},
				vector_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker",
				},
				vector_blob_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker",
				},
			},
			versus_base = {
				ambush_composition = "chaos_large",
				vector_blob_composition = "chaos_large",
				vector_composition = "chaos_large",
			},
		},
	},
	chaos_light = {
		ambush_composition = "chaos_medium",
		chance_of_vector = 1,
		chance_of_vector_blob = 1,
		disabled = false,
		mini_patrol_composition = "chaos_mini_patrol",
		mix_paced_hordes = true,
		vector_blob_composition = "chaos_medium",
		vector_composition = "chaos_medium",
		compositions = HordeCompositions,
		compositions_pacing = HordeCompositionsPacing,
		ambush = HordeSettingsBasics.ambush,
		vector = HordeSettingsBasics.vector,
		vector_blob = HordeSettingsBasics.vector_blob,
		difficulty_overrides = {
			hard = {
				ambush_composition = "chaos_medium",
				vector_blob_composition = "chaos_medium",
				vector_composition = "chaos_medium",
			},
			harder = {
				ambush_composition = "chaos_large",
				vector_blob_composition = "chaos_large",
				vector_composition = "chaos_large",
			},
			hardest = {
				ambush_composition = "chaos_large",
				vector_blob_composition = "chaos_large",
				vector_composition = "chaos_large",
			},
			cataclysm = {
				ambush_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker",
				},
				vector_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker",
				},
				vector_blob_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker",
				},
			},
			cataclysm_2 = {
				ambush_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker",
				},
				vector_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker",
				},
				vector_blob_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker",
				},
			},
			cataclysm_3 = {
				ambush_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker",
				},
				vector_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker",
				},
				vector_blob_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker",
				},
			},
			versus_base = {
				ambush_composition = "chaos_large",
				vector_blob_composition = "chaos_large",
				vector_composition = "chaos_large",
			},
		},
	},
	beastmen = {
		ambush_composition = "beastmen_medium",
		chance_of_vector = 0.5,
		chance_of_vector_blob = 0.5,
		disabled = false,
		mini_patrol_composition = "beastmen_mini_patrol",
		mix_paced_hordes = false,
		vector_blob_composition = "beastmen_medium",
		vector_composition = "beastmen_medium",
		compositions = HordeCompositions,
		compositions_pacing = HordeCompositionsPacing,
		ambush = HordeSettingsBasics.ambush,
		vector = HordeSettingsBasics.vector,
		vector_blob = HordeSettingsBasics.vector_blob,
		difficulty_overrides = {
			hard = {
				ambush_composition = "beastmen_medium",
				vector_blob_composition = "beastmen_medium",
				vector_composition = "beastmen_medium",
			},
			harder = {
				ambush_composition = "beastmen_large",
				vector_blob_composition = "beastmen_large",
				vector_composition = "beastmen_large",
			},
			hardest = {
				ambush_composition = "beastmen_large",
				vector_blob_composition = "beastmen_large",
				vector_composition = "beastmen_large",
			},
			cataclysm = {
				ambush_composition = {
					"beastmen_huge",
					"beastmen_huge_armor",
				},
				vector_composition = {
					"beastmen_huge",
					"beastmen_huge_armor",
				},
				vector_blob_composition = {
					"beastmen_huge",
					"beastmen_huge_armor",
				},
			},
			cataclysm_2 = {
				ambush_composition = {
					"beastmen_huge",
					"beastmen_huge_armor",
				},
				vector_composition = {
					"beastmen_huge",
					"beastmen_huge_armor",
				},
				vector_blob_composition = {
					"beastmen_huge",
					"beastmen_huge_armor",
				},
			},
			cataclysm_3 = {
				ambush_composition = {
					"beastmen_huge",
					"beastmen_huge_armor",
				},
				vector_composition = {
					"beastmen_huge",
					"beastmen_huge_armor",
				},
				vector_blob_composition = {
					"beastmen_huge",
					"beastmen_huge_armor",
				},
			},
			versus_base = {
				ambush_composition = "beastmen_large",
				vector_blob_composition = "beastmen_large",
				vector_composition = "beastmen_large",
			},
		},
	},
	challenge_level = {
		ambush_composition = "medium",
		chance_of_vector = 0.5,
		chance_of_vector_blob = 0.5,
		disabled = true,
		mini_patrol_composition = "mini_patrol",
		mix_paced_hordes = true,
		vector_blob_composition = "medium",
		vector_composition = "medium",
		compositions = HordeCompositions,
		compositions_pacing = HordeCompositionsPacing,
		ambush = HordeSettingsBasics.ambush,
		vector = HordeSettingsBasics.vector,
		vector_blob = HordeSettingsBasics.vector_blob,
		difficulty_overrides = {
			hard = {
				ambush_composition = "medium",
				vector_blob_composition = "medium",
				vector_composition = "medium",
			},
			harder = {
				ambush_composition = "large",
				vector_blob_composition = "large",
				vector_composition = "large",
			},
			hardest = {
				ambush_composition = "large",
				vector_blob_composition = "large",
				vector_composition = "large",
			},
			cataclysm = {
				ambush_composition = "huge",
				vector_blob_composition = "huge",
				vector_composition = "huge",
			},
			cataclysm_2 = {
				ambush_composition = "huge",
				vector_blob_composition = "huge",
				vector_composition = "huge",
			},
			cataclysm_3 = {
				ambush_composition = "huge",
				vector_blob_composition = "huge",
				vector_composition = "huge",
			},
			versus_base = {
				ambush_composition = "large",
				vector_blob_composition = "large",
				vector_composition = "large",
			},
		},
	},
}
HordeSettings.disabled = table.clone(HordeSettings.default)
HordeSettings.disabled.disabled = true

do
	local weights = {}
	local crash

	for key, setting in pairs(HordeSettings) do
		setting.name = key

		if setting.compositions_pacing then
			for name, composition in pairs(setting.compositions_pacing) do
				table.clear_array(weights, #weights)

				for i, variant in ipairs(composition) do
					weights[i] = variant.weight

					local breeds = variant.breeds

					for j = 1, #breeds, 2 do
						local breed_name = breeds[j]
						local breed = Breeds[breed_name]

						if not breed then
							print(string.format("Bad or non-existing breed in HordeCompositionsPacing table %s : '%s' defined in HordeCompositionsPacing.", name, tostring(breed_name)))

							crash = true
						elseif not breed.can_use_horde_spawners then
							variant.must_use_hidden_spawners = true
						end
					end
				end

				composition.loaded_probs = {
					LoadedDice.create(weights),
				}

				fassert(not crash, "Found errors in HordeCompositionsPacing table %s - see above. ", name)
				fassert(composition.loaded_probs, "Could not create horde composition probablitity table, make sure the table '%s' in HordeCompositionsPacing is correctly structured.", name)
			end
		end
	end
end

PackDistributions = {
	periodical = {
		max_hi_density = 1,
		max_hi_dist = 3,
		max_low_density = 0.4,
		max_low_dist = 10,
		min_hi_density = 0.65,
		min_hi_dist = 2,
		min_low_density = 0,
		min_low_dist = 7,
		random_distribution = false,
		zero_clamp_max_dist = 5,
		zero_density_below = 0.1,
	},
	random = {},
}
RoamingSettings = {
	default = {
		despawn_distance = 45,
		despawn_distance_z = 30,
		despawn_path_distance = 75,
		disabled = false,
	},
	disabled = {
		despawn_distance = 45,
		despawn_distance_z = 30,
		despawn_path_distance = 75,
		disabled = true,
	},
}

local SpecialDifficultyOverrides = {
	hard = {
		max_specials = 3,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0,
				max_of_same = 2,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					60,
					100,
				},
			},
		},
	},
	harder = {
		max_specials = 3,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.25,
				max_of_same = 2,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					50,
					90,
				},
			},
		},
	},
	hardest = {
		max_specials = 4,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.5,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 2,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					50,
					90,
				},
			},
		},
	},
	cataclysm = {
		max_specials = 5,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.5,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 3,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					40,
					70,
				},
			},
		},
	},
	cataclysm_2 = {
		max_specials = 6,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.5,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 3,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					30,
					60,
				},
			},
		},
	},
	cataclysm_3 = {
		max_specials = 6,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.5,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 3,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					30,
					60,
				},
			},
		},
	},
	versus_base = {
		max_specials = 3,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.25,
				max_of_same = 2,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					50,
					90,
				},
			},
		},
	},
}
local SpecialDifficultyOverrides_skaven = {
	hard = {
		max_specials = 3,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0,
				max_of_same = 2,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					60,
					100,
				},
			},
		},
	},
	harder = {
		max_specials = 4,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.25,
				max_of_same = 2,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					60,
					100,
				},
			},
		},
	},
	hardest = {
		max_specials = 4,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.5,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 2,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					50,
					90,
				},
			},
		},
	},
	cataclysm = {
		max_specials = 5,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.5,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 3,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					40,
					70,
				},
			},
		},
	},
	cataclysm_2 = {
		max_specials = 6,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.5,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 3,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					30,
					60,
				},
			},
		},
	},
	cataclysm_3 = {
		max_specials = 6,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.5,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 3,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					30,
					60,
				},
			},
		},
	},
	versus_base = {
		max_specials = 4,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.25,
				max_of_same = 2,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					60,
					100,
				},
			},
		},
	},
}
local SpecialDifficultyOverrides_chaos = {
	hard = {
		max_specials = 2,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0,
				max_of_same = 1,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					50,
					90,
				},
			},
		},
	},
	harder = {
		max_specials = 3,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.25,
				max_of_same = 2,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					50,
					90,
				},
			},
		},
	},
	hardest = {
		max_specials = 3,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.5,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 2,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					45,
					70,
				},
			},
		},
	},
	cataclysm = {
		max_specials = 5,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.5,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 3,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					40,
					70,
				},
			},
		},
	},
	cataclysm_2 = {
		max_specials = 6,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.5,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 3,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					30,
					60,
				},
			},
		},
	},
	cataclysm_3 = {
		max_specials = 6,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.5,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 3,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					30,
					60,
				},
			},
		},
	},
	versus_base = {
		max_specials = 3,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.25,
				max_of_same = 2,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					50,
					90,
				},
			},
		},
	},
}
local SpecialDifficultyOverrides_beastmen = {
	hard = {
		max_specials = 2,
		breeds = {
			"beastmen_standard_bearer",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_gutter_runner",
			"skaven_pack_master",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0,
				max_of_same = 2,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					40,
					70,
				},
			},
		},
	},
	harder = {
		max_specials = 3,
		breeds = {
			"beastmen_standard_bearer",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_gutter_runner",
			"skaven_pack_master",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.25,
				max_of_same = 2,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					40,
					70,
				},
			},
		},
	},
	hardest = {
		max_specials = 3,
		breeds = {
			"beastmen_standard_bearer",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_gutter_runner",
			"skaven_pack_master",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.5,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 2,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					30,
					60,
				},
			},
		},
	},
	cataclysm = {
		max_specials = 4,
		breeds = {
			"beastmen_standard_bearer",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_gutter_runner",
			"skaven_pack_master",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.5,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 3,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					30,
					60,
				},
			},
		},
	},
	cataclysm_2 = {
		max_specials = 5,
		breeds = {
			"beastmen_standard_bearer",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_gutter_runner",
			"skaven_pack_master",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.5,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 3,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					30,
					60,
				},
			},
		},
	},
	cataclysm_3 = {
		max_specials = 6,
		breeds = {
			"beastmen_standard_bearer",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_gutter_runner",
			"skaven_pack_master",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.5,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 4,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					30,
					60,
				},
			},
		},
	},
	versus_base = {
		max_specials = 3,
		breeds = {
			"beastmen_standard_bearer",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_gutter_runner",
			"skaven_pack_master",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.25,
				max_of_same = 2,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					40,
					70,
				},
			},
		},
	},
}
local SpecialDifficultyOverrides_skaven_beastmen = {
	hard = {
		max_specials = 2,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"skaven_warpfire_thrower",
			"beastmen_standard_bearer",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0,
				max_of_same = 2,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					40,
					70,
				},
			},
		},
	},
	harder = {
		max_specials = 3,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"skaven_warpfire_thrower",
			"beastmen_standard_bearer",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.25,
				max_of_same = 2,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					40,
					70,
				},
			},
		},
	},
	hardest = {
		max_specials = 3,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"skaven_warpfire_thrower",
			"beastmen_standard_bearer",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.5,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 2,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					30,
					60,
				},
			},
		},
	},
	cataclysm = {
		max_specials = 4,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"skaven_warpfire_thrower",
			"beastmen_standard_bearer",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.5,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 3,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					30,
					60,
				},
			},
		},
	},
	cataclysm_2 = {
		max_specials = 5,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"skaven_warpfire_thrower",
			"beastmen_standard_bearer",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.5,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 3,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					30,
					60,
				},
			},
		},
	},
	cataclysm_3 = {
		max_specials = 6,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"skaven_warpfire_thrower",
			"beastmen_standard_bearer",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.5,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 4,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					30,
					60,
				},
			},
		},
	},
	versus_base = {
		max_specials = 3,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"skaven_warpfire_thrower",
			"beastmen_standard_bearer",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.25,
				max_of_same = 2,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					40,
					70,
				},
			},
		},
	},
}
local SpecialDifficultyOverrides_chaos_beastmen = {
	hard = {
		max_specials = 2,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"chaos_corruptor_sorcerer",
			"beastmen_standard_bearer",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0,
				max_of_same = 1,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					50,
					90,
				},
			},
		},
	},
	harder = {
		max_specials = 3,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"chaos_corruptor_sorcerer",
			"beastmen_standard_bearer",
			"beastmen_standard_bearer",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.25,
				max_of_same = 2,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					50,
					90,
				},
			},
		},
	},
	hardest = {
		max_specials = 3,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"beastmen_standard_bearer",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.5,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 2,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					45,
					70,
				},
			},
		},
	},
	cataclysm = {
		max_specials = 5,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"beastmen_standard_bearer",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.5,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 3,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					40,
					70,
				},
			},
		},
	},
	cataclysm_2 = {
		max_specials = 6,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"beastmen_standard_bearer",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.5,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 3,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					30,
					60,
				},
			},
		},
	},
	cataclysm_3 = {
		max_specials = 6,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"beastmen_standard_bearer",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.5,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 3,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					30,
					60,
				},
			},
		},
	},
	versus_base = {
		max_specials = 3,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"chaos_corruptor_sorcerer",
			"beastmen_standard_bearer",
			"beastmen_standard_bearer",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0.25,
				max_of_same = 2,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					50,
					90,
				},
			},
		},
	},
}

SpecialsSettings = {
	default = {
		disabled = false,
		max_specials = 2,
		spawn_method = "specials_by_slots",
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 1,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					60,
					90,
				},
			},
		},
		rush_intervention = {
			chance_of_ambush_horde = 0.25,
			delay_between_interventions = 20,
			distance_until_next_intervention = 30,
			loneliness_value_for_ambush_horde = 25,
			loneliness_value_for_special = 30,
			breeds = {
				"skaven_pack_master",
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
			},
		},
		speed_running_intervention = {
			chance_of_vector_horde = 0.25,
			required_time_spent_in_high_threat = 30,
			time_required_in_pacing_peak_to_ignore_high_intensity = 40,
			travel_distance_check_frequency = 10,
			travel_distance_threshold = 40,
			breeds = {
				"skaven_pack_master",
				"skaven_gutter_runner",
				"chaos_corruptor_sorcerer",
				"skaven_ratling_gunner",
			},
			delay_between_speed_running_intervention_special_spawn = {
				{
					15,
					30,
				},
				{
					12,
					24,
				},
				{
					8,
					18,
				},
				{
					5,
					12,
				},
			},
			delay_between_speed_running_intervention_horde_spawn = {
				8,
				12,
			},
			vector_horde_breeds = {
				"skaven_plague_monk",
				"chaos_berzerker",
				"chaos_marauder",
				"chaos_raider",
			},
			vector_horde_config = {
				skaven_plague_monk = {
					2,
					3,
				},
				chaos_berzerker = {
					2,
					3,
				},
				chaos_marauder = {
					5,
					8,
				},
				chaos_raider = {
					2,
					3,
				},
			},
			total_travel_distance_scaling_thresholds = {
				80,
				160,
				240,
				320,
			},
		},
		difficulty_overrides = SpecialDifficultyOverrides,
	},
	default_light = {
		disabled = false,
		max_specials = 2,
		spawn_method = "specials_by_slots",
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 1,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					60,
					90,
				},
			},
		},
		rush_intervention = {
			chance_of_ambush_horde = 0.25,
			delay_between_interventions = 20,
			distance_until_next_intervention = 30,
			loneliness_value_for_ambush_horde = 25,
			loneliness_value_for_special = 30,
			breeds = {
				"skaven_pack_master",
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
			},
		},
		difficulty_overrides = SpecialDifficultyOverrides,
	},
	skaven = {
		disabled = false,
		max_specials = 2,
		spawn_method = "specials_by_slots",
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 1,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					50,
					90,
				},
			},
		},
		rush_intervention = {
			chance_of_ambush_horde = 0.25,
			delay_between_interventions = 20,
			distance_until_next_intervention = 30,
			loneliness_value_for_ambush_horde = 25,
			loneliness_value_for_special = 30,
			breeds = {
				"skaven_pack_master",
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
			},
		},
		difficulty_overrides = SpecialDifficultyOverrides_skaven,
	},
	skaven_light = {
		disabled = false,
		max_specials = 2,
		spawn_method = "specials_by_slots",
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_slots = {
				chance_of_coordinated_attack = 0,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 1,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					50,
					90,
				},
			},
		},
		rush_intervention = {
			chance_of_ambush_horde = 0.25,
			delay_between_interventions = 20,
			distance_until_next_intervention = 30,
			loneliness_value_for_ambush_horde = 25,
			loneliness_value_for_special = 30,
			breeds = {
				"skaven_pack_master",
				"skaven_gutter_runner",
				"skaven_ratling_gunner",
			},
		},
		difficulty_overrides = SpecialDifficultyOverrides_skaven,
	},
	default_demo = {
		disabled = false,
		max_specials = 2,
		spawn_method = "specials_by_slots",
		breeds = {
			"skaven_poison_wind_globadier",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_time_window = {
				even_out_breeds = true,
				spawn_interval = {
					90,
					120,
				},
				lull_time = {
					20,
					40,
				},
			},
			specials_by_slots = {
				chance_of_coordinated_attack = 0,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 2,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					5,
					150,
				},
				spawn_cooldown = {
					100,
					200,
				},
			},
		},
		rush_intervention = {
			chance_of_ambush_horde = 0.25,
			delay_between_interventions = 30,
			distance_until_next_intervention = 30,
			loneliness_value_for_ambush_horde = 25,
			loneliness_value_for_special = 30,
			breeds = {
				"skaven_pack_master",
			},
		},
	},
	chaos_demo = {
		disabled = false,
		max_specials = 2,
		spawn_method = "specials_by_slots",
		breeds = {
			"skaven_pack_master",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_time_window = {
				even_out_breeds = true,
				spawn_interval = {
					120,
					240,
				},
				lull_time = {
					40,
					60,
				},
			},
			specials_by_slots = {
				chance_of_coordinated_attack = 0,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 2,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					150,
				},
				spawn_cooldown = {
					150,
					250,
				},
			},
		},
		rush_intervention = {
			chance_of_ambush_horde = 0.25,
			delay_between_interventions = 30,
			distance_until_next_intervention = 30,
			loneliness_value_for_ambush_horde = 25,
			loneliness_value_for_special = 30,
			breeds = {
				"skaven_pack_master",
			},
		},
	},
	chaos_light_demo = {
		disabled = true,
		max_specials = 2,
		spawn_method = "specials_by_slots",
		breeds = {
			"skaven_warpfire_thrower",
			"skaven_pack_master",
		},
		methods = {
			specials_by_time_window = {
				even_out_breeds = true,
				spawn_interval = {
					80,
					120,
				},
				lull_time = {
					20,
					30,
				},
			},
			specials_by_slots = {
				chance_of_coordinated_attack = 0,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 2,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					150,
				},
				spawn_cooldown = {
					150,
					250,
				},
			},
		},
		rush_intervention = {
			chance_of_ambush_horde = 0.25,
			delay_between_interventions = 30,
			distance_until_next_intervention = 30,
			loneliness_value_for_ambush_horde = 25,
			loneliness_value_for_special = 30,
			breeds = {
				"skaven_pack_master",
			},
		},
	},
	chaos = {
		disabled = false,
		max_specials = 2,
		spawn_method = "specials_by_slots",
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_time_window = {
				even_out_breeds = true,
				spawn_interval = {
					60,
					100,
				},
				lull_time = {
					20,
					30,
				},
			},
			specials_by_slots = {
				chance_of_coordinated_attack = 0,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 1,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					50,
					80,
				},
			},
		},
		rush_intervention = {
			chance_of_ambush_horde = 0.25,
			delay_between_interventions = 20,
			distance_until_next_intervention = 30,
			loneliness_value_for_ambush_horde = 25,
			loneliness_value_for_special = 30,
			breeds = {
				"chaos_corruptor_sorcerer",
			},
		},
		difficulty_overrides = SpecialDifficultyOverrides_chaos,
	},
	chaos_light = {
		disabled = true,
		max_specials = 2,
		spawn_method = "specials_by_slots",
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_warpfire_thrower",
		},
		methods = {
			specials_by_time_window = {
				even_out_breeds = true,
				spawn_interval = {
					60,
					100,
				},
				lull_time = {
					20,
					30,
				},
			},
			specials_by_slots = {
				chance_of_coordinated_attack = 0,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 1,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					50,
					80,
				},
			},
		},
		rush_intervention = {
			chance_of_ambush_horde = 0.25,
			delay_between_interventions = 20,
			distance_until_next_intervention = 30,
			loneliness_value_for_ambush_horde = 25,
			loneliness_value_for_special = 30,
			breeds = {
				"chaos_corruptor_sorcerer",
			},
		},
		difficulty_overrides = SpecialDifficultyOverrides_chaos,
	},
	beastmen = {
		disabled = false,
		max_specials = 2,
		spawn_method = "specials_by_slots",
		breeds = {
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"beastmen_standard_bearer",
		},
		methods = {
			specials_by_time_window = {
				even_out_breeds = true,
				spawn_interval = {
					60,
					100,
				},
				lull_time = {
					20,
					30,
				},
			},
			specials_by_slots = {
				chance_of_coordinated_attack = 0,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 1,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					50,
					80,
				},
			},
		},
		outside_navmesh_intervention = {
			delay_between_interventions = 10,
			disabled = true,
			intervention_time = 5,
			needed_ordinary_enemy_aggro = 5,
			needed_special_enemy_aggro = 1,
			breeds = {
				"skaven_warpfire_thrower",
				"skaven_poison_wind_globadier",
			},
		},
		rush_intervention = {
			chance_of_ambush_horde = 0.25,
			delay_between_interventions = 20,
			distance_until_next_intervention = 30,
			loneliness_value_for_ambush_horde = 25,
			loneliness_value_for_special = 30,
			breeds = {
				"chaos_corruptor_sorcerer",
			},
		},
		difficulty_overrides = SpecialDifficultyOverrides_beastmen,
	},
	skaven_beastmen = {
		disabled = false,
		max_specials = 2,
		spawn_method = "specials_by_slots",
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"skaven_warpfire_thrower",
			"beastmen_standard_bearer",
		},
		methods = {
			specials_by_time_window = {
				even_out_breeds = true,
				spawn_interval = {
					60,
					100,
				},
				lull_time = {
					20,
					30,
				},
			},
			specials_by_slots = {
				chance_of_coordinated_attack = 0,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 1,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					50,
					80,
				},
			},
		},
		outside_navmesh_intervention = {
			delay_between_interventions = 10,
			disabled = true,
			intervention_time = 5,
			needed_ordinary_enemy_aggro = 5,
			needed_special_enemy_aggro = 1,
			breeds = {
				"skaven_warpfire_thrower",
				"skaven_poison_wind_globadier",
			},
		},
		rush_intervention = {
			chance_of_ambush_horde = 0.25,
			delay_between_interventions = 20,
			distance_until_next_intervention = 30,
			loneliness_value_for_ambush_horde = 25,
			loneliness_value_for_special = 30,
			breeds = {
				"chaos_corruptor_sorcerer",
			},
		},
		difficulty_overrides = SpecialDifficultyOverrides_skaven_beastmen,
	},
	chaos_beastmen = {
		disabled = false,
		max_specials = 2,
		spawn_method = "specials_by_slots",
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_warpfire_thrower",
			"beastmen_standard_bearer",
		},
		methods = {
			specials_by_time_window = {
				even_out_breeds = true,
				spawn_interval = {
					60,
					100,
				},
				lull_time = {
					20,
					30,
				},
			},
			specials_by_slots = {
				chance_of_coordinated_attack = 0,
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 1,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60,
				},
				spawn_cooldown = {
					50,
					80,
				},
			},
		},
		rush_intervention = {
			chance_of_ambush_horde = 0.25,
			delay_between_interventions = 20,
			distance_until_next_intervention = 30,
			loneliness_value_for_ambush_horde = 25,
			loneliness_value_for_special = 30,
			breeds = {
				"chaos_corruptor_sorcerer",
			},
		},
		difficulty_overrides = SpecialDifficultyOverrides_chaos,
	},
	disabled = {
		disabled = true,
		rush_intervention = {},
	},
}
BossSettings = {
	default = {
		disabled = false,
		boss_events = {
			chance_of_encampment = 0,
			debug_color = "deep_sky_blue",
			name = "boss_events",
			terror_events_using_packs = false,
			events = {
				"event_boss",
				"event_patrol",
				"nothing",
			},
			event_lookup = {
				event_boss = {
					"boss_event_chaos_troll",
					"boss_event_chaos_spawn",
					"boss_event_storm_fiend",
					"boss_event_rat_ogre",
				},
				event_patrol = {
					"boss_event_spline_patrol",
				},
			},
		},
		rare_events = {
			debug_color = "deep_pink",
			name = "rare_events",
			events = {
				"event_boss",
			},
			event_lookup = {
				event_boss = {
					"rare_event_loot_rat",
				},
			},
		},
	},
	default_light = {
		disabled = false,
		boss_events = {
			chance_of_encampment = 0,
			debug_color = "deep_sky_blue",
			name = "boss_events",
			terror_events_using_packs = false,
			events = {
				"event_boss",
				"event_patrol",
				"nothing",
			},
			event_lookup = {
				event_boss = {
					"boss_event_chaos_troll",
					"boss_event_chaos_spawn",
					"boss_event_storm_fiend",
					"boss_event_rat_ogre",
				},
				event_patrol = {
					"boss_event_spline_patrol",
				},
			},
		},
		rare_events = {
			debug_color = "deep_pink",
			name = "rare_events",
			events = {
				"event_boss",
			},
			event_lookup = {
				event_boss = {
					"rare_event_loot_rat",
				},
			},
		},
	},
	skaven = {
		disabled = false,
		boss_events = {
			chance_of_encampment = 0,
			debug_color = "deep_sky_blue",
			name = "boss_events",
			terror_events_using_packs = false,
			events = {
				"event_boss",
				"event_patrol",
				"nothing",
			},
			event_lookup = {
				event_boss = {
					"boss_event_storm_fiend",
					"boss_event_rat_ogre",
				},
				event_patrol = {
					"boss_event_skaven_spline_patrol",
				},
			},
		},
		rare_events = {
			debug_color = "deep_pink",
			name = "rare_events",
			events = {
				"event_boss",
			},
			event_lookup = {
				event_boss = {
					"rare_event_loot_rat",
				},
			},
		},
	},
	skaven_light = {
		disabled = false,
		boss_events = {
			chance_of_encampment = 0,
			debug_color = "deep_sky_blue",
			name = "boss_events",
			terror_events_using_packs = false,
			events = {
				"event_boss",
				"event_patrol",
				"nothing",
			},
			event_lookup = {
				event_boss = {
					"boss_event_storm_fiend",
					"boss_event_rat_ogre",
				},
				event_patrol = {
					"boss_event_skaven_spline_patrol",
				},
			},
		},
		rare_events = {
			debug_color = "deep_pink",
			name = "rare_events",
			events = {
				"event_boss",
			},
			event_lookup = {
				event_boss = {
					"rare_event_loot_rat",
				},
			},
		},
	},
	chaos = {
		disabled = false,
		boss_events = {
			chance_of_encampment = 0,
			debug_color = "deep_sky_blue",
			name = "boss_events",
			terror_events_using_packs = false,
			events = {
				"event_boss",
				"event_patrol",
				"nothing",
			},
			event_lookup = {
				event_boss = {
					"boss_event_chaos_troll",
					"boss_event_chaos_spawn",
				},
				event_patrol = {
					"boss_event_chaos_spline_patrol",
				},
			},
		},
		rare_events = {
			debug_color = "deep_pink",
			name = "rare_events",
			events = {
				"event_boss",
			},
			event_lookup = {
				event_boss = {
					"rare_event_loot_rat",
				},
			},
		},
	},
	chaos_light = {
		disabled = true,
		boss_events = {
			chance_of_encampment = 0,
			debug_color = "deep_sky_blue",
			name = "boss_events",
			terror_events_using_packs = false,
			events = {
				"event_boss",
				"event_patrol",
				"nothing",
			},
			event_lookup = {
				event_boss = {
					"boss_event_chaos_troll",
					"boss_event_chaos_spawn",
				},
				event_patrol = {
					"boss_event_spline_patrol",
				},
			},
		},
		rare_events = {
			debug_color = "deep_pink",
			name = "rare_events",
			events = {
				"event_boss",
			},
			event_lookup = {
				event_boss = {
					"rare_event_loot_rat",
				},
			},
		},
	},
	beastmen = {
		disabled = false,
		boss_events = {
			chance_of_encampment = 0,
			debug_color = "deep_sky_blue",
			name = "boss_events",
			terror_events_using_packs = false,
			events = {
				"event_boss",
				"event_patrol",
				"nothing",
			},
			event_lookup = {
				event_boss = {
					"boss_event_minotaur",
					"boss_event_chaos_spawn",
				},
				event_patrol = {
					"boss_event_beastmen_spline_patrol",
				},
			},
		},
		rare_events = {
			debug_color = "deep_pink",
			name = "rare_events",
			events = {
				"event_boss",
			},
			event_lookup = {
				event_boss = {
					"rare_event_loot_rat",
				},
			},
		},
	},
	skaven_beastmen = {
		disabled = false,
		boss_events = {
			chance_of_encampment = 0,
			debug_color = "deep_sky_blue",
			name = "boss_events",
			terror_events_using_packs = false,
			events = {
				"event_boss",
				"event_patrol",
				"nothing",
			},
			event_lookup = {
				event_boss = {
					"boss_event_minotaur",
					"boss_event_chaos_spawn",
					"boss_event_storm_fiend",
				},
				event_patrol = {
					"boss_event_skaven_beastmen_spline_patrol",
				},
			},
		},
		rare_events = {
			debug_color = "deep_pink",
			name = "rare_events",
			events = {
				"event_boss",
			},
			event_lookup = {
				event_boss = {
					"rare_event_loot_rat",
				},
			},
		},
	},
	chaos_beastmen = {
		disabled = false,
		boss_events = {
			chance_of_encampment = 0,
			debug_color = "deep_sky_blue",
			name = "boss_events",
			terror_events_using_packs = false,
			events = {
				"event_boss",
				"event_patrol",
				"nothing",
			},
			event_lookup = {
				event_boss = {
					"boss_event_minotaur",
					"boss_event_chaos_spawn",
					"boss_event_chaos_troll",
				},
				event_patrol = {
					"boss_event_chaos_beastmen_spline_patrol",
				},
			},
		},
		rare_events = {
			debug_color = "deep_pink",
			name = "rare_events",
			events = {
				"event_boss",
			},
			event_lookup = {
				event_boss = {
					"rare_event_loot_rat",
				},
			},
		},
	},
	beastmen_light = {
		disabled = true,
		boss_events = {
			chance_of_encampment = 0,
			debug_color = "deep_sky_blue",
			name = "boss_events",
			terror_events_using_packs = false,
			events = {
				"event_boss",
				"event_patrol",
				"nothing",
			},
			event_lookup = {
				event_boss = {
					"boss_event_minotaur",
					"boss_event_chaos_spawn",
				},
				event_patrol = {
					"boss_event_beastmen_spline_patrol",
				},
			},
		},
		rare_events = {
			debug_color = "deep_pink",
			name = "rare_events",
			events = {
				"event_boss",
			},
			event_lookup = {
				event_boss = {
					"rare_event_loot_rat",
				},
			},
		},
	},
	disabled = {
		disabled = true,
		safe_distance = 100,
	},
	no_patrols = {
		disabled = false,
		boss_events = {
			chance_of_encampment = 0,
			debug_color = "deep_sky_blue",
			name = "boss_events",
			terror_events_using_packs = false,
			events = {
				"event_boss",
				"nothing",
			},
			event_lookup = {
				event_boss = {
					"boss_event_chaos_troll",
					"boss_event_chaos_spawn",
					"boss_event_storm_fiend",
					"boss_event_rat_ogre",
				},
			},
		},
		rare_events = {
			debug_color = "deep_pink",
			name = "rare_events",
			events = {
				"event_boss",
			},
			event_lookup = {
				event_boss = {
					"rare_event_loot_rat",
				},
			},
		},
	},
	versus_playable_boss = {
		disabled = false,
		boss_events = {
			chance_of_encampment = 0,
			debug_color = "deep_sky_blue",
			name = "boss_events",
			terror_events_using_packs = false,
			events = {
				"event_boss",
				"nothing",
			},
			event_lookup = {
				event_boss = {
					"boss_event_chaos_troll",
				},
				event_patrol = {
					"boss_event_spline_patrol",
				},
			},
		},
		rare_events = {
			debug_color = "deep_pink",
			name = "rare_events",
			events = {
				"event_boss",
			},
			event_lookup = {
				event_boss = {
					"rare_event_loot_rat",
				},
			},
		},
	},
}
IntensitySettings = {
	default = {
		decay_delay = 3,
		decay_per_second = 2,
		disabled = false,
		intensity_add_knockdown = 50,
		intensity_add_nearby_kill = 1,
		intensity_add_per_percent_dmg_taken = 1,
		intensity_add_pounced_down = 10,
		max_intensity = 100,
		difficulty_overrides = {
			hard = {
				decay_per_second = 3,
				intensity_add_per_percent_dmg_taken = 1.5,
			},
			harder = {
				decay_per_second = 3,
				intensity_add_per_percent_dmg_taken = 1,
			},
			hardest = {
				decay_per_second = 4,
				intensity_add_per_percent_dmg_taken = 0.5,
			},
			cataclysm = {
				decay_per_second = 6,
				intensity_add_per_percent_dmg_taken = 0.2,
			},
			cataclysm_2 = {
				decay_per_second = 6,
				intensity_add_per_percent_dmg_taken = 0.2,
			},
			cataclysm_3 = {
				decay_per_second = 6,
				intensity_add_per_percent_dmg_taken = 0.2,
			},
			versus_base = {
				decay_per_second = 3,
				intensity_add_per_percent_dmg_taken = 0.9,
			},
		},
	},
	disabled = {
		decay_delay = 0,
		decay_per_second = 100,
		disabled = true,
		intensity_add_knockdown = 0,
		intensity_add_nearby_kill = 0,
		intensity_add_per_percent_dmg_taken = 0,
		intensity_add_pounced_down = 0,
		max_intensity = 100,
	},
}
PacingSettings = {
	default = {
		disabled = false,
		horde_in_relax_if_rushing = false,
		leave_relax_if_rushing = true,
		leave_relax_if_zero_intensity = true,
		multiple_hordes = 3,
		peak_fade_threshold = 32.5,
		peak_intensity_threshold = 45,
		relax_rushing_distance = 70,
		sustain_peak_duration = {
			3,
			5,
		},
		relax_duration = {
			50,
			70,
		},
		horde_frequency = {
			70,
			150,
		},
		multiple_horde_frequency = {
			10,
			15,
		},
		max_delay_until_next_horde = {
			160,
			200,
		},
		horde_startup_time = {
			40,
			120,
		},
		horde = HordeSettings.default,
		horde_delay = {
			0,
			0,
		},
		delay_horde_threat_value = {
			cataclysm = 80,
			cataclysm_2 = 100,
			cataclysm_3 = 100,
			easy = 40,
			hard = 50,
			harder = 60,
			hardest = 60,
			normal = 40,
			versus_base = 60,
		},
		delay_mini_patrol_threat_value = {
			cataclysm = 80,
			cataclysm_2 = 100,
			cataclysm_3 = 100,
			easy = 35,
			hard = 40,
			harder = 50,
			normal = 35,
			versus_base = 50,
		},
		delay_specials_threat_value = {
			cataclysm = 1000,
			cataclysm_2 = 1000,
			cataclysm_3 = 1000,
			easy = 40,
			hard = 50,
			harder = 60,
			hardest = 60,
			normal = 40,
			versus_base = 60,
		},
		mini_patrol = {
			only_spawn_above_intensity = 1,
			only_spawn_below_intensity = 15,
			override_timer = 20,
			frequency = {
				15,
				20,
			},
		},
		difficulty_overrides = {
			hard = {
				multiple_hordes = 3,
				peak_intensity_threshold = 50,
				horde_frequency = {
					60,
					110,
				},
				multiple_horde_frequency = {
					8,
					13,
				},
				relax_duration = {
					35,
					45,
				},
			},
			harder = {
				multiple_hordes = 3,
				peak_intensity_threshold = 55,
				horde_frequency = {
					50,
					100,
				},
				multiple_horde_frequency = {
					8,
					12,
				},
				relax_duration = {
					35,
					45,
				},
			},
			hardest = {
				multiple_hordes = 3,
				peak_intensity_threshold = 70,
				horde_frequency = {
					50,
					100,
				},
				multiple_horde_frequency = {
					7,
					10,
				},
				relax_duration = {
					25,
					35,
				},
			},
			cataclysm = {
				multiple_hordes = 3,
				peak_intensity_threshold = 80,
				horde_frequency = {
					50,
					100,
				},
				multiple_horde_frequency = {
					7,
					10,
				},
				relax_duration = {
					25,
					35,
				},
			},
			cataclysm_2 = {
				multiple_hordes = 3,
				peak_intensity_threshold = 90,
				horde_frequency = {
					50,
					100,
				},
				multiple_horde_frequency = {
					7,
					10,
				},
				relax_duration = {
					25,
					35,
				},
			},
			cataclysm_3 = {
				multiple_hordes = 3,
				peak_intensity_threshold = 90,
				horde_frequency = {
					50,
					100,
				},
				multiple_horde_frequency = {
					7,
					10,
				},
				relax_duration = {
					25,
					35,
				},
			},
			versus_base = {
				multiple_hordes = 3,
				peak_intensity_threshold = 70,
				horde_frequency = {
					50,
					100,
				},
				multiple_horde_frequency = {
					7,
					10,
				},
				relax_duration = {
					20,
					35,
				},
			},
		},
	},
	chaos = {
		disabled = false,
		horde_in_relax_if_rushing = false,
		leave_relax_if_rushing = true,
		leave_relax_if_zero_intensity = true,
		multiple_hordes = 2,
		peak_fade_threshold = 32.5,
		peak_intensity_threshold = 45,
		relax_rushing_distance = 70,
		sustain_peak_duration = {
			3,
			5,
		},
		relax_duration = {
			50,
			70,
		},
		horde_frequency = {
			70,
			150,
		},
		horde_startup_time = {
			40,
			120,
		},
		multiple_horde_frequency = {
			10,
			15,
		},
		max_delay_until_next_horde = {
			180,
			210,
		},
		horde = HordeSettings.chaos,
		horde_delay = {
			0,
			0,
		},
		delay_horde_threat_value = {
			cataclysm = 80,
			cataclysm_2 = 100,
			cataclysm_3 = 100,
			easy = 40,
			hard = 50,
			harder = 60,
			hardest = 60,
			normal = 40,
			versus_base = 60,
		},
		delay_mini_patrol_threat_value = {
			cataclysm = 80,
			cataclysm_2 = 100,
			cataclysm_3 = 100,
			easy = 35,
			hard = 40,
			harder = 50,
			normal = 35,
			versus_base = 60,
		},
		delay_specials_threat_value = {
			cataclysm = 1000,
			cataclysm_2 = 1000,
			cataclysm_3 = 1000,
			easy = 40,
			hard = 50,
			harder = 60,
			hardest = 60,
			normal = 40,
			versus_base = 60,
		},
		mini_patrol = {
			only_spawn_above_intensity = 1,
			only_spawn_below_intensity = 15,
			override_timer = 20,
			frequency = {
				15,
				20,
			},
		},
		difficulty_overrides = {
			hard = {
				multiple_hordes = 3,
				peak_intensity_threshold = 50,
				horde_frequency = {
					60,
					110,
				},
				multiple_horde_frequency = {
					8,
					13,
				},
				relax_duration = {
					35,
					45,
				},
			},
			harder = {
				multiple_hordes = 3,
				peak_intensity_threshold = 55,
				horde_frequency = {
					50,
					100,
				},
				multiple_horde_frequency = {
					8,
					12,
				},
				relax_duration = {
					35,
					45,
				},
			},
			hardest = {
				multiple_hordes = 3,
				peak_intensity_threshold = 70,
				horde_frequency = {
					50,
					100,
				},
				multiple_horde_frequency = {
					7,
					10,
				},
				relax_duration = {
					35,
					45,
				},
			},
			cataclysm = {
				multiple_hordes = 3,
				peak_intensity_threshold = 80,
				horde_frequency = {
					50,
					100,
				},
				multiple_horde_frequency = {
					7,
					10,
				},
				relax_duration = {
					35,
					45,
				},
			},
			cataclysm_2 = {
				multiple_hordes = 3,
				peak_intensity_threshold = 90,
				horde_frequency = {
					50,
					100,
				},
				multiple_horde_frequency = {
					7,
					10,
				},
				relax_duration = {
					35,
					45,
				},
			},
			cataclysm_3 = {
				multiple_hordes = 3,
				peak_intensity_threshold = 90,
				horde_frequency = {
					50,
					100,
				},
				multiple_horde_frequency = {
					7,
					10,
				},
				relax_duration = {
					35,
					45,
				},
			},
			versus_base = {
				multiple_hordes = 3,
				peak_intensity_threshold = 70,
				horde_frequency = {
					50,
					100,
				},
				multiple_horde_frequency = {
					7,
					10,
				},
				relax_duration = {
					20,
					35,
				},
			},
		},
	},
	beastmen = {
		disabled = false,
		horde_in_relax_if_rushing = false,
		leave_relax_if_rushing = true,
		leave_relax_if_zero_intensity = true,
		multiple_hordes = 2,
		peak_fade_threshold = 32.5,
		peak_intensity_threshold = 45,
		relax_rushing_distance = 70,
		sustain_peak_duration = {
			3,
			5,
		},
		relax_duration = {
			50,
			70,
		},
		horde_frequency = {
			70,
			150,
		},
		horde_startup_time = {
			40,
			120,
		},
		multiple_horde_frequency = {
			10,
			15,
		},
		max_delay_until_next_horde = {
			180,
			210,
		},
		horde = HordeSettings.chaos,
		horde_delay = {
			0,
			0,
		},
		delay_horde_threat_value = {
			cataclysm = 80,
			cataclysm_2 = 100,
			cataclysm_3 = 100,
			easy = 40,
			hard = 50,
			harder = 60,
			hardest = 60,
			normal = 40,
			versus_base = 60,
		},
		delay_mini_patrol_threat_value = {
			cataclysm = 80,
			cataclysm_2 = 100,
			cataclysm_3 = 100,
			easy = 35,
			hard = 40,
			harder = 50,
			normal = 35,
			versus_base = 50,
		},
		delay_specials_threat_value = {
			cataclysm = 1000,
			cataclysm_2 = 1000,
			cataclysm_3 = 1000,
			easy = 40,
			hard = 50,
			harder = 60,
			hardest = 60,
			normal = 40,
			versus_base = 60,
		},
		mini_patrol = {
			only_spawn_above_intensity = 1,
			only_spawn_below_intensity = 15,
			override_timer = 20,
			frequency = {
				15,
				20,
			},
		},
		difficulty_overrides = {
			hard = {
				multiple_hordes = 3,
				peak_intensity_threshold = 50,
				horde_frequency = {
					60,
					110,
				},
				multiple_horde_frequency = {
					8,
					13,
				},
				relax_duration = {
					35,
					45,
				},
			},
			harder = {
				multiple_hordes = 3,
				peak_intensity_threshold = 55,
				horde_frequency = {
					50,
					100,
				},
				multiple_horde_frequency = {
					8,
					12,
				},
				relax_duration = {
					35,
					45,
				},
			},
			hardest = {
				multiple_hordes = 3,
				peak_intensity_threshold = 70,
				horde_frequency = {
					50,
					100,
				},
				multiple_horde_frequency = {
					7,
					10,
				},
				relax_duration = {
					35,
					45,
				},
			},
			cataclysm = {
				multiple_hordes = 3,
				peak_intensity_threshold = 80,
				horde_frequency = {
					50,
					100,
				},
				multiple_horde_frequency = {
					10,
					12,
				},
				relax_duration = {
					30,
					40,
				},
			},
			cataclysm_2 = {
				multiple_hordes = 3,
				peak_intensity_threshold = 90,
				horde_frequency = {
					50,
					100,
				},
				multiple_horde_frequency = {
					10,
					12,
				},
				relax_duration = {
					30,
					40,
				},
			},
			cataclysm_3 = {
				multiple_hordes = 3,
				peak_intensity_threshold = 90,
				horde_frequency = {
					50,
					100,
				},
				multiple_horde_frequency = {
					10,
					12,
				},
				relax_duration = {
					30,
					40,
				},
			},
			versus_base = {
				multiple_hordes = 3,
				peak_intensity_threshold = 55,
				horde_frequency = {
					50,
					100,
				},
				multiple_horde_frequency = {
					8,
					12,
				},
				relax_duration = {
					35,
					45,
				},
			},
		},
	},
	intense = {
		disabled = false,
		peak_fade_threshold = 75,
		peak_intensity_threshold = 80,
		sustain_peak_duration = {
			5,
			10,
		},
		relax_duration = {
			15,
			25,
		},
		horde_frequency = {
			15,
			45,
		},
		horde_startup_time = {
			15,
			180,
		},
		horde = HordeSettings.default,
		horde_delay = {
			4,
			5,
		},
	},
	city_wall = {
		disabled = false,
		horde_in_relax_if_rushing = false,
		leave_relax_if_rushing = true,
		leave_relax_if_zero_intensity = true,
		peak_fade_threshold = 32.5,
		peak_intensity_threshold = 35,
		relax_rushing_distance = 70,
		sustain_peak_duration = {
			3,
			5,
		},
		relax_duration = {
			25,
			35,
		},
		horde_frequency = {
			120,
			180,
		},
		horde_startup_time = {
			15,
			180,
		},
		horde = HordeSettings.default,
		horde_delay = {
			0,
			0,
		},
		mini_patrol = {
			composition = "city_wall_extra_spice",
			only_spawn_below_intensity = 65,
			override_timer = 25,
			frequency = {
				10,
				15,
			},
		},
	},
	disabled = {
		disabled = true,
		peak_fade_threshold = 75,
		peak_intensity_threshold = 0,
		sustain_peak_duration = {
			5,
			10,
		},
		relax_duration = {
			10000,
			10000,
		},
		horde_frequency = {
			0,
			0,
		},
		horde_startup_time = {
			0,
			0,
		},
		horde = HordeSettings.disabled,
		horde_delay = {
			4,
			5,
		},
	},
}
PackSpawningDistribution = {
	standard = {
		calculate_nearby_islands = false,
		clamp_main_path_zone_area = 100,
		clamp_outer_zones_used = 1,
		distribution_method = "periodical",
		goal_density = 0.45,
		length_density_coefficient = 0,
		spawn_cycle_length = 350,
	},
}
PackSpawningSettings = {
	default = {
		area_density_coefficient = 0.045,
		basics = PackSpawningDistribution.standard,
		roaming_set = {
			breed_packs = "standard",
			breed_packs_peeks_overide_chance = {
				0.5,
				0.75,
			},
			breed_packs_override = {
				{
					"shield_rats",
					2,
					0.035,
				},
				{
					"plague_monks",
					2,
					0.035,
				},
				{
					"marauders",
					2,
					0.03,
				},
				{
					"marauders_elites",
					2,
					0.03,
				},
			},
		},
		difficulty_overrides = {
			hard = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04,
					},
					{
						"plague_monks",
						2,
						0.035,
					},
					{
						"marauders",
						2,
						0.035,
					},
					{
						"marauders_elites",
						2,
						0.035,
					},
				},
			},
			harder = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04,
					},
					{
						"plague_monks",
						2,
						0.035,
					},
					{
						"marauders",
						2,
						0.035,
					},
					{
						"marauders_elites",
						2,
						0.035,
					},
				},
			},
			hardest = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04,
					},
					{
						"plague_monks",
						2,
						0.035,
					},
					{
						"marauders",
						2,
						0.035,
					},
					{
						"marauders_elites",
						2,
						0.035,
					},
				},
			},
			cataclysm = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04,
					},
					{
						"plague_monks",
						2,
						0.04,
					},
					{
						"marauders",
						2,
						0.04,
					},
					{
						"marauders_elites",
						2,
						0.04,
					},
				},
			},
			cataclysm_2 = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04,
					},
					{
						"plague_monks",
						2,
						0.04,
					},
					{
						"marauders",
						2,
						0.04,
					},
					{
						"marauders_elites",
						2,
						0.04,
					},
				},
			},
			cataclysm_3 = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.045,
					},
					{
						"plague_monks",
						2,
						0.045,
					},
					{
						"marauders",
						2,
						0.045,
					},
					{
						"marauders_elites",
						2,
						0.045,
					},
				},
			},
			versus_base = {
				area_density_coefficient = 0.06,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.06,
					},
					{
						"shield_rats_no_elites",
						2,
						0.06,
					},
					{
						"plague_monks",
						2,
						0.05,
					},
					{
						"marauders",
						2,
						0.05,
					},
					{
						"marauders_elites",
						2,
						0.05,
					},
				},
			},
		},
	},
	skaven_beastmen = {
		area_density_coefficient = 0.045,
		basics = PackSpawningDistribution.standard,
		roaming_set = {
			breed_packs = "skaven_beastmen",
			breed_packs_peeks_overide_chance = {
				0.5,
				0.75,
			},
			breed_packs_override = {
				{
					"shield_rats",
					2,
					0.035,
				},
				{
					"plague_monks",
					2,
					0.035,
				},
				{
					"beastmen",
					2,
					0.035,
				},
				{
					"beastmen_elites",
					2,
					0.035,
				},
			},
		},
		difficulty_overrides = {
			hard = {
				area_density_coefficient = 0.04,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04,
					},
					{
						"plague_monks",
						2,
						0.035,
					},
					{
						"beastmen",
						2,
						0.035,
					},
					{
						"beastmen_elites",
						2,
						0.035,
					},
				},
			},
			harder = {
				area_density_coefficient = 0.04,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04,
					},
					{
						"plague_monks",
						2,
						0.035,
					},
					{
						"beastmen",
						2,
						0.035,
					},
					{
						"beastmen_elites",
						2,
						0.035,
					},
				},
			},
			hardest = {
				area_density_coefficient = 0.04,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04,
					},
					{
						"plague_monks",
						2,
						0.035,
					},
					{
						"beastmen",
						2,
						0.035,
					},
					{
						"beastmen_elites",
						2,
						0.035,
					},
				},
			},
			cataclysm = {
				area_density_coefficient = 0.04,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04,
					},
					{
						"plague_monks",
						2,
						0.04,
					},
					{
						"beastmen",
						2,
						0.04,
					},
					{
						"beastmen_elites",
						2,
						0.04,
					},
				},
			},
			cataclysm_2 = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04,
					},
					{
						"plague_monks",
						2,
						0.04,
					},
					{
						"beastmen",
						2,
						0.04,
					},
					{
						"beastmen_elites",
						2,
						0.04,
					},
				},
			},
			cataclysm_3 = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.045,
					},
					{
						"plague_monks",
						2,
						0.045,
					},
					{
						"beastmen",
						2,
						0.045,
					},
					{
						"beastmen_elites",
						2,
						0.045,
					},
				},
			},
			versus_base = {
				area_density_coefficient = 0.04,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.06,
					},
					{
						"shield_rats_no_elites",
						2,
						0.06,
					},
					{
						"plague_monks",
						2,
						0.05,
					},
					{
						"beastmen",
						2,
						0.05,
					},
					{
						"beastmen_elites",
						2,
						0.05,
					},
				},
			},
		},
	},
	chaos_beastmen = {
		area_density_coefficient = 0.045,
		basics = PackSpawningDistribution.standard,
		roaming_set = {
			breed_packs = "chaos_beastmen",
			breed_packs_peeks_overide_chance = {
				0.5,
				0.75,
			},
			breed_packs_override = {
				{
					"marauders",
					2,
					0.03,
				},
				{
					"marauders_elites",
					2,
					0.03,
				},
				{
					"beastmen",
					2,
					0.035,
				},
				{
					"beastmen_elites",
					2,
					0.035,
				},
			},
		},
		difficulty_overrides = {
			hard = {
				area_density_coefficient = 0.04,
				breed_packs_override = {
					{
						"marauders",
						2,
						0.03,
					},
					{
						"marauders_elites",
						2,
						0.03,
					},
					{
						"beastmen",
						2,
						0.035,
					},
					{
						"beastmen_elites",
						2,
						0.035,
					},
				},
			},
			harder = {
				area_density_coefficient = 0.04,
				breed_packs_override = {
					{
						"marauders",
						2,
						0.035,
					},
					{
						"marauders_elites",
						2,
						0.035,
					},
					{
						"beastmen",
						2,
						0.035,
					},
					{
						"beastmen_elites",
						2,
						0.035,
					},
				},
			},
			hardest = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"marauders",
						2,
						0.035,
					},
					{
						"marauders_elites",
						2,
						0.035,
					},
					{
						"beastmen",
						2,
						0.035,
					},
					{
						"beastmen_elites",
						2,
						0.035,
					},
				},
			},
			cataclysm = {
				area_density_coefficient = 0.04,
				breed_packs_override = {
					{
						"marauders",
						2,
						0.04,
					},
					{
						"marauders_elites",
						2,
						0.04,
					},
					{
						"beastmen",
						2,
						0.04,
					},
					{
						"beastmen_elites",
						2,
						0.04,
					},
				},
			},
			cataclysm_2 = {
				area_density_coefficient = 0.04,
				breed_packs_override = {
					{
						"marauders",
						2,
						0.04,
					},
					{
						"marauders_elites",
						2,
						0.04,
					},
					{
						"beastmen",
						2,
						0.04,
					},
					{
						"beastmen_elites",
						2,
						0.04,
					},
				},
			},
			cataclysm_3 = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"marauders",
						2,
						0.045,
					},
					{
						"marauders_elites",
						2,
						0.045,
					},
					{
						"beastmen",
						2,
						0.045,
					},
					{
						"beastmen_elites",
						2,
						0.045,
					},
				},
			},
			versus_base = {
				area_density_coefficient = 0.06,
				breed_packs_override = {
					{
						"marauders",
						2,
						0.05,
					},
					{
						"marauders_elites",
						2,
						0.05,
					},
					{
						"marauders_berzerkers",
						2,
						0.05,
					},
					{
						"beastmen",
						2,
						0.05,
					},
					{
						"beastmen_elites",
						2,
						0.05,
					},
				},
			},
		},
	},
	default_light = {
		area_density_coefficient = 0.045,
		basics = PackSpawningDistribution.standard,
		roaming_set = {
			breed_packs = "standard_no_elites",
			breed_packs_peeks_overide_chance = {
				0.5,
				0.75,
			},
			breed_packs_override = {
				{
					"plague_monks",
					2,
					0.035,
				},
				{
					"marauders",
					2,
					0.035,
				},
				{
					"marauders_elites",
					2,
					0.035,
				},
			},
		},
	},
	skaven = {
		area_density_coefficient = 0.045,
		basics = PackSpawningDistribution.standard,
		roaming_set = {
			breed_packs = "skaven",
			breed_packs_peeks_overide_chance = {
				0.5,
				1,
			},
			breed_packs_override = {
				{
					"shield_rats",
					2,
					0.035,
				},
				{
					"plague_monks",
					2,
					0.03,
				},
			},
		},
		difficulty_overrides = {
			hard = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04,
					},
					{
						"plague_monks",
						2,
						0.035,
					},
				},
			},
			harder = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04,
					},
					{
						"plague_monks",
						2,
						0.035,
					},
				},
			},
			hardest = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04,
					},
					{
						"plague_monks",
						2,
						0.035,
					},
				},
			},
			cataclysm = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04,
					},
					{
						"plague_monks",
						2,
						0.035,
					},
				},
			},
			cataclysm_2 = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04,
					},
					{
						"plague_monks",
						2,
						0.035,
					},
				},
			},
			cataclysm_3 = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04,
					},
					{
						"plague_monks",
						2,
						0.035,
					},
				},
			},
			versus_base = {
				area_density_coefficient = 0.06,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.06,
					},
					{
						"shield_rats_no_elites",
						2,
						0.06,
					},
					{
						"plague_monks",
						2,
						0.05,
					},
				},
			},
		},
	},
	skaven_light = {
		area_density_coefficient = 0.045,
		basics = PackSpawningDistribution.standard,
		roaming_set = {
			breed_packs = "shield_rats_no_elites",
			breed_packs_peeks_overide_chance = {
				0.5,
				1,
			},
			breed_packs_override = {
				{
					"shield_rats_no_elites",
					2,
					0.035,
				},
				{
					"plague_monks",
					2,
					0.03,
				},
			},
		},
		difficulty_overrides = {
			hard = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04,
					},
					{
						"plague_monks",
						2,
						0.035,
					},
				},
			},
			harder = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04,
					},
					{
						"plague_monks",
						2,
						0.035,
					},
				},
			},
			hardest = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04,
					},
					{
						"plague_monks",
						2,
						0.035,
					},
				},
			},
			cataclysm = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04,
					},
					{
						"plague_monks",
						2,
						0.035,
					},
				},
			},
			cataclysm_2 = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04,
					},
					{
						"plague_monks",
						2,
						0.035,
					},
				},
			},
			cataclysm_3 = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04,
					},
					{
						"plague_monks",
						2,
						0.035,
					},
				},
			},
			versus_base = {
				area_density_coefficient = 0.06,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.06,
					},
					{
						"shield_rats_no_elites",
						2,
						0.06,
					},
					{
						"plague_monks",
						2,
						0.05,
					},
				},
			},
		},
	},
	chaos = {
		area_density_coefficient = 0.035,
		basics = PackSpawningDistribution.standard,
		roaming_set = {
			breed_packs = "marauders",
			breed_packs_peeks_overide_chance = {
				0.5,
				1,
			},
			breed_packs_override = {
				{
					"marauders_and_warriors",
					2,
					0.03,
				},
				{
					"marauders_shields",
					2,
					0.03,
				},
				{
					"marauders_elites",
					2,
					0.03,
				},
				{
					"marauders_berzerkers",
					2,
					0.03,
				},
			},
		},
		difficulty_overrides = {
			hard = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"marauders_and_warriors",
						2,
						0.035,
					},
					{
						"marauders_shields",
						2,
						0.035,
					},
					{
						"marauders_elites",
						2,
						0.035,
					},
					{
						"marauders_berzerkers",
						2,
						0.035,
					},
				},
			},
			harder = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"marauders_and_warriors",
						2,
						0.035,
					},
					{
						"marauders_shields",
						2,
						0.035,
					},
					{
						"marauders_elites",
						2,
						0.035,
					},
					{
						"marauders_berzerkers",
						2,
						0.035,
					},
				},
			},
			hardest = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"marauders_and_warriors",
						2,
						0.035,
					},
					{
						"marauders_shields",
						2,
						0.035,
					},
					{
						"marauders_elites",
						2,
						0.035,
					},
					{
						"marauders_berzerkers",
						2,
						0.035,
					},
				},
			},
			cataclysm = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"marauders_and_warriors",
						2,
						0.035,
					},
					{
						"marauders_shields",
						2,
						0.035,
					},
					{
						"marauders_elites",
						2,
						0.035,
					},
					{
						"marauders_berzerkers",
						2,
						0.035,
					},
				},
			},
			cataclysm_2 = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"marauders_and_warriors",
						2,
						0.035,
					},
					{
						"marauders_shields",
						2,
						0.035,
					},
					{
						"marauders_elites",
						2,
						0.035,
					},
					{
						"marauders_berzerkers",
						2,
						0.035,
					},
				},
			},
			cataclysm_3 = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"marauders_and_warriors",
						2,
						0.035,
					},
					{
						"marauders_shields",
						2,
						0.035,
					},
					{
						"marauders_elites",
						2,
						0.035,
					},
					{
						"marauders_berzerkers",
						2,
						0.035,
					},
				},
			},
			versus_base = {
				area_density_coefficient = 0.06,
				breed_packs_override = {
					{
						"marauders_and_warriors",
						2,
						0.05,
					},
					{
						"marauders_shields",
						2,
						0.05,
					},
					{
						"marauders_elites",
						2,
						0.05,
					},
					{
						"marauders_berzerkers",
						2,
						0.05,
					},
				},
			},
		},
	},
	chaos_light = {
		area_density_coefficient = 0.03,
		basics = PackSpawningDistribution.standard,
		roaming_set = {
			breed_packs = "marauders",
			breed_packs_peeks_overide_chance = {
				0.94,
				1,
			},
			breed_packs_override = {
				{
					"marauders",
					1,
					0.03,
				},
				{
					"marauders_shields",
					2,
					0.025,
				},
				{
					"marauders_elites",
					2,
					0.025,
				},
				{
					"marauders_berzerkers",
					2,
					0.03,
				},
			},
		},
	},
	beastmen = {
		area_density_coefficient = 0.045,
		basics = PackSpawningDistribution.standard,
		roaming_set = {
			breed_packs = "beastmen",
			breed_packs_peeks_overide_chance = {
				0.5,
				0.75,
			},
			breed_packs_override = {
				{
					"beastmen_elites",
					2,
					0.035,
				},
				{
					"beastmen",
					2,
					0.035,
				},
				{
					"beastmen_light",
					2,
					0.04,
				},
			},
		},
		difficulty_overrides = {
			hard = {
				area_density_coefficient = 0.04,
				breed_packs_override = {
					{
						"beastmen_elites",
						2,
						0.035,
					},
					{
						"beastmen",
						2,
						0.035,
					},
					{
						"beastmen_light",
						2,
						0.04,
					},
				},
			},
			harder = {
				area_density_coefficient = 0.04,
				breed_packs_override = {
					{
						"beastmen_elites",
						2,
						0.035,
					},
					{
						"beastmen",
						2,
						0.035,
					},
					{
						"beastmen_light",
						2,
						0.04,
					},
				},
			},
			hardest = {
				area_density_coefficient = 0.04,
				breed_packs_override = {
					{
						"beastmen_elites",
						2,
						0.035,
					},
					{
						"beastmen",
						2,
						0.035,
					},
					{
						"beastmen_light",
						2,
						0.04,
					},
				},
			},
			cataclysm = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"beastmen_elites",
						2,
						0.04,
					},
					{
						"beastmen",
						2,
						0.04,
					},
					{
						"beastmen_light",
						2,
						0.045,
					},
				},
			},
			cataclysm_2 = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"beastmen_elites",
						2,
						0.04,
					},
					{
						"beastmen",
						2,
						0.04,
					},
					{
						"beastmen_light",
						2,
						0.045,
					},
				},
			},
			cataclysm_3 = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"beastmen_elites",
						2,
						0.045,
					},
					{
						"beastmen",
						2,
						0.045,
					},
					{
						"beastmen_light",
						2,
						0.045,
					},
				},
			},
			versus_base = {
				area_density_coefficient = 0.06,
				breed_packs_override = {
					{
						"beastmen_elites",
						2,
						0.05,
					},
					{
						"beastmen",
						2,
						0.05,
					},
					{
						"beastmen_light",
						2,
						0.06,
					},
				},
			},
		},
	},
	beastmen_light = {
		area_density_coefficient = 0.045,
		basics = PackSpawningDistribution.standard,
		roaming_set = {
			breed_packs = "beastmen",
			breed_packs_peeks_overide_chance = {
				0.5,
				1,
			},
			breed_packs_override = {
				{
					"beastmen_light",
					2,
					0.04,
				},
			},
		},
	},
	code_test = {
		area_density_coefficient = 0.03,
		basics = PackSpawningDistribution.standard,
		roaming_set = {
			breed_packs = "code_test",
			breed_packs_peeks_overide_chance = {
				0,
				1,
			},
			breed_packs_override = {
				{
					"marauders",
					1,
					0.03,
				},
				{
					"marauders_shields",
					2,
					0.025,
				},
				{
					"marauders_elites",
					2,
					0.025,
				},
				{
					"marauders_berzerkers",
					2,
					0.03,
				},
			},
		},
	},
	disabled = {
		area_density_coefficient = 0.03,
		disabled = true,
		basics = PackSpawningDistribution.standard,
		roaming_set = {},
	},
}
DefaultConflictDirectorSet = {
	"skaven",
	"chaos",
	"beastmen",
	"skaven_beastmen",
	"chaos_beastmen",
	"default",
}
DefaultConflictPreferredFactionCountChances = {
	1,
	0.8,
	0.2,
}
DefaultConflictFactionWeight = 1
DefaultConflictFactionSetWeights = {
	beastmen = 8,
	chaos = 20,
	skaven = 20,
}
ConflictDirectorLockedFunctions = {
	beastmen = function (level_key)
		if DEDICATED_SERVER then
			return false
		end

		if script_data.unlock_all_levels then
			return false
		end

		local level_settings = LevelSettings[level_key]

		if level_settings.allowed_locked_director_functions and level_settings.allowed_locked_director_functions.beastmen then
			return false
		end

		if not Managers.unlock:is_dlc_unlocked("scorpion") then
			return true
		end

		local stat_to_check = "completed_levels_crater"
		local stats = Managers.backend:get_stats()
		local value = tonumber(stats[stat_to_check])

		if value and value > 0 then
			return false
		end

		return true
	end,
}
ConflictDirectors = {
	default = {
		debug_color = "maroon",
		disabled = false,
		intensity = IntensitySettings.default,
		pacing = PacingSettings.default,
		boss = BossSettings.default,
		specials = SpecialsSettings.default,
		roaming = RoamingSettings.default,
		pack_spawning = PackSpawningSettings.default,
		horde = HordeSettings.default,
		factions = {
			"chaos",
			"skaven",
		},
	},
	default_light = {
		debug_color = "maroon",
		disabled = false,
		intensity = IntensitySettings.default,
		pacing = PacingSettings.default,
		boss = BossSettings.default_light,
		specials = SpecialsSettings.default_light,
		roaming = RoamingSettings.default,
		pack_spawning = PackSpawningSettings.default,
		horde = HordeSettings.default,
		factions = {
			"chaos",
			"skaven",
		},
	},
	skaven = {
		debug_color = "orange",
		disabled = false,
		intensity = IntensitySettings.default,
		pacing = PacingSettings.default,
		boss = BossSettings.skaven,
		specials = SpecialsSettings.skaven,
		roaming = RoamingSettings.default,
		pack_spawning = PackSpawningSettings.skaven,
		horde = HordeSettings.default,
		factions = {
			"skaven",
		},
	},
	skaven_light = {
		debug_color = "orange",
		disabled = false,
		intensity = IntensitySettings.default,
		pacing = PacingSettings.default,
		boss = BossSettings.skaven_light,
		specials = SpecialsSettings.skaven_light,
		roaming = RoamingSettings.default,
		pack_spawning = PackSpawningSettings.skaven_light,
		horde = HordeSettings.default,
		factions = {
			"skaven",
		},
	},
	chaos = {
		debug_color = "purple",
		disabled = false,
		intensity = IntensitySettings.default,
		pacing = PacingSettings.chaos,
		boss = BossSettings.chaos,
		specials = SpecialsSettings.chaos,
		roaming = RoamingSettings.default,
		pack_spawning = PackSpawningSettings.chaos,
		horde = HordeSettings.chaos,
		factions = {
			"chaos",
		},
	},
	chaos_light = {
		debug_color = "purple",
		disabled = false,
		intensity = IntensitySettings.default,
		pacing = PacingSettings.chaos,
		boss = BossSettings.chaos_light,
		specials = SpecialsSettings.chaos_light,
		roaming = RoamingSettings.default,
		pack_spawning = PackSpawningSettings.chaos_light,
		horde = HordeSettings.chaos,
		factions = {
			"chaos",
		},
	},
	marauders_and_warriors = {
		debug_color = "purple",
		disabled = false,
		intensity = IntensitySettings.default,
		pacing = PacingSettings.chaos,
		boss = BossSettings.chaos,
		specials = SpecialsSettings.chaos,
		roaming = RoamingSettings.default,
		pack_spawning = PackSpawningSettings.chaos,
		horde = HordeSettings.chaos,
		factions = {
			"chaos",
		},
	},
	beastmen = {
		debug_color = "purple",
		disabled = false,
		locked_func_name = "beastmen",
		intensity = IntensitySettings.default,
		pacing = PacingSettings.beastmen,
		boss = BossSettings.beastmen,
		specials = SpecialsSettings.beastmen,
		roaming = RoamingSettings.default,
		pack_spawning = PackSpawningSettings.beastmen,
		horde = HordeSettings.beastmen,
		factions = {
			"beastmen",
		},
	},
	beastmen_light = {
		debug_color = "purple",
		disabled = false,
		locked_func_name = "beastmen",
		intensity = IntensitySettings.default,
		pacing = PacingSettings.beastmen,
		boss = BossSettings.beastmen_light,
		specials = SpecialsSettings.beastmen,
		roaming = RoamingSettings.default,
		pack_spawning = PackSpawningSettings.beastmen,
		horde = HordeSettings.beastmen,
		factions = {
			"beastmen",
		},
	},
	skaven_beastmen = {
		debug_color = "orange",
		disabled = false,
		locked_func_name = "beastmen",
		intensity = IntensitySettings.default,
		pacing = PacingSettings.default,
		boss = BossSettings.skaven_beastmen,
		specials = SpecialsSettings.skaven_beastmen,
		roaming = RoamingSettings.default,
		pack_spawning = PackSpawningSettings.skaven_beastmen,
		horde = HordeSettings.beastmen,
		factions = {
			"skaven",
			"beastmen",
		},
	},
	chaos_beastmen = {
		debug_color = "orange",
		disabled = false,
		locked_func_name = "beastmen",
		intensity = IntensitySettings.default,
		pacing = PacingSettings.default,
		boss = BossSettings.chaos_beastmen,
		specials = SpecialsSettings.chaos_beastmen,
		roaming = RoamingSettings.default,
		pack_spawning = PackSpawningSettings.chaos_beastmen,
		horde = HordeSettings.beastmen,
		factions = {
			"chaos",
			"beastmen",
		},
	},
	level_editor = {
		debug_color = "maroon",
		disabled = true,
		intensity = IntensitySettings.disabled,
		pacing = PacingSettings.disabled,
		boss = BossSettings.disabled,
		specials = SpecialsSettings.disabled,
		roaming = RoamingSettings.disabled,
		pack_spawning = PackSpawningSettings.disabled,
		horde = HordeSettings.disabled,
	},
	event_level_with_roaming_no_specials = {
		debug_color = "maroon",
		disabled = false,
		intensity = IntensitySettings.default,
		pacing = PacingSettings.disabled,
		boss = BossSettings.disabled,
		specials = SpecialsSettings.disabled,
		roaming = RoamingSettings.default,
		pack_spawning = PackSpawningSettings.default,
		horde = HordeSettings.default,
	},
	city_wall = {
		debug_color = "maroon",
		disabled = false,
		intensity = IntensitySettings.default,
		pacing = PacingSettings.city_wall,
		boss = BossSettings.default,
		specials = SpecialsSettings.default,
		roaming = RoamingSettings.default,
		pack_spawning = PackSpawningSettings.default,
		horde = HordeSettings.default,
	},
	endboss = {
		debug_color = "maroon",
		disabled = false,
		intensity = IntensitySettings.default,
		pacing = PacingSettings.default,
		boss = BossSettings.disabled,
		specials = SpecialsSettings.default,
		roaming = RoamingSettings.default,
		pack_spawning = PackSpawningSettings.default,
		horde = HordeSettings.default,
	},
	disabled = {
		debug_color = "black",
		disabled = true,
		intensity = IntensitySettings.disabled,
		pacing = PacingSettings.disabled,
		boss = BossSettings.disabled,
		specials = SpecialsSettings.disabled,
		roaming = RoamingSettings.disabled,
		pack_spawning = PackSpawningSettings.disabled,
		horde = HordeSettings.disabled,
	},
	demo = {
		debug_color = "blue",
		disabled = false,
		intensity = IntensitySettings.default,
		pacing = PacingSettings.default,
		boss = BossSettings.disabled,
		specials = SpecialsSettings.default,
		roaming = RoamingSettings.default,
		pack_spawning = PackSpawningSettings.default,
		horde = HordeSettings.default,
	},
	tutorial = {
		debug_color = "maroon",
		disabled = false,
		intensity = IntensitySettings.default,
		pacing = PacingSettings.disabled,
		boss = BossSettings.disabled,
		specials = SpecialsSettings.disabled,
		roaming = RoamingSettings.disabled,
		pack_spawning = PackSpawningSettings.default,
		horde = HordeSettings.disabled,
	},
	code_test = {
		debug_color = "maroon",
		disabled = false,
		intensity = IntensitySettings.default,
		pacing = PacingSettings.default,
		boss = BossSettings.default,
		specials = SpecialsSettings.default,
		roaming = RoamingSettings.default,
		pack_spawning = PackSpawningSettings.code_test,
		horde = HordeSettings.default,
	},
	no_patrols = {
		debug_color = "maroon",
		disabled = false,
		intensity = IntensitySettings.default,
		pacing = PacingSettings.default,
		boss = BossSettings.no_patrols,
		specials = SpecialsSettings.default,
		roaming = RoamingSettings.default,
		pack_spawning = PackSpawningSettings.default,
		horde = HordeSettings.default,
	},
	challenge_level = {
		debug_color = "maroon",
		disabled = false,
		intensity = IntensitySettings.disabled,
		pacing = PacingSettings.disabled,
		boss = BossSettings.disabled,
		specials = SpecialsSettings.disabled,
		roaming = RoamingSettings.disabled,
		pack_spawning = PackSpawningSettings.disabled,
		horde = HordeSettings.challenge_level,
	},
	inn_level = {
		disabled = false,
		intensity = IntensitySettings.disabled,
		pacing = PacingSettings.disabled,
		boss = BossSettings.disabled,
		specials = SpecialsSettings.disabled,
		roaming = RoamingSettings.default,
		pack_spawning = PackSpawningSettings.disabled,
		horde = HordeSettings.disabled,
	},
	default_weave = {
		debug_color = "maroon",
		disabled = false,
		intensity = IntensitySettings.disabled,
		pacing = PacingSettings.disabled,
		boss = BossSettings.disabled,
		specials = SpecialsSettings.disabled,
		roaming = RoamingSettings.default,
		pack_spawning = PackSpawningSettings.default,
		horde = HordeSettings.disabled,
	},
	default_weave_light = {
		debug_color = "maroon",
		disabled = false,
		intensity = IntensitySettings.disabled,
		pacing = PacingSettings.disabled,
		boss = BossSettings.disabled,
		specials = SpecialsSettings.disabled,
		roaming = RoamingSettings.default,
		pack_spawning = PackSpawningSettings.default_light,
		horde = HordeSettings.disabled,
	},
	weave_disabled = {
		debug_color = "maroon",
		disabled = false,
		intensity = IntensitySettings.disabled,
		pacing = PacingSettings.disabled,
		boss = BossSettings.disabled,
		specials = SpecialsSettings.disabled,
		roaming = RoamingSettings.disabled,
		pack_spawning = PackSpawningSettings.disabled,
		horde = HordeSettings.disabled,
	},
	weave_beastmen = {
		debug_color = "maroon",
		disabled = false,
		intensity = IntensitySettings.disabled,
		pacing = PacingSettings.disabled,
		boss = BossSettings.disabled,
		specials = SpecialsSettings.disabled,
		roaming = RoamingSettings.default,
		pack_spawning = PackSpawningSettings.beastmen,
		horde = HordeSettings.disabled,
	},
	weave_beastmen_light = {
		debug_color = "maroon",
		disabled = false,
		intensity = IntensitySettings.disabled,
		pacing = PacingSettings.disabled,
		boss = BossSettings.disabled,
		specials = SpecialsSettings.disabled,
		roaming = RoamingSettings.default,
		pack_spawning = PackSpawningSettings.beastmen_light,
		horde = HordeSettings.disabled,
	},
	weave_chaos = {
		debug_color = "maroon",
		disabled = false,
		intensity = IntensitySettings.disabled,
		pacing = PacingSettings.disabled,
		boss = BossSettings.disabled,
		specials = SpecialsSettings.disabled,
		roaming = RoamingSettings.default,
		pack_spawning = PackSpawningSettings.chaos,
		horde = HordeSettings.disabled,
	},
	weave_chaos_light = {
		debug_color = "maroon",
		disabled = false,
		intensity = IntensitySettings.disabled,
		pacing = PacingSettings.disabled,
		boss = BossSettings.disabled,
		specials = SpecialsSettings.disabled,
		roaming = RoamingSettings.default,
		pack_spawning = PackSpawningSettings.chaos_light,
		horde = HordeSettings.disabled,
	},
	weave_skaven = {
		debug_color = "maroon",
		disabled = false,
		intensity = IntensitySettings.disabled,
		pacing = PacingSettings.disabled,
		boss = BossSettings.disabled,
		specials = SpecialsSettings.disabled,
		roaming = RoamingSettings.default,
		pack_spawning = PackSpawningSettings.skaven,
		horde = HordeSettings.disabled,
	},
	weave_skaven_light = {
		debug_color = "maroon",
		disabled = false,
		intensity = IntensitySettings.disabled,
		pacing = PacingSettings.disabled,
		boss = BossSettings.disabled,
		specials = SpecialsSettings.disabled,
		roaming = RoamingSettings.default,
		pack_spawning = PackSpawningSettings.skaven_light,
		horde = HordeSettings.disabled,
	},
	weave_skaven_beastmen = {
		debug_color = "maroon",
		disabled = false,
		intensity = IntensitySettings.disabled,
		pacing = PacingSettings.disabled,
		boss = BossSettings.disabled,
		specials = SpecialsSettings.disabled,
		roaming = RoamingSettings.default,
		pack_spawning = PackSpawningSettings.skaven_beastmen,
		horde = HordeSettings.disabled,
	},
}

local force_local_require = true

DLCUtils.require_list("conflict_settings_files", force_local_require)

do
	local difficulties = Difficulties
	local start_time = os.clock()
	local ConflictUtils_find_conflict_director_breeds = ConflictUtils.find_conflict_director_breeds

	for conflict_director_name, data in pairs(ConflictDirectors) do
		data.name = conflict_director_name
		data.contained_breeds = {}

		for i = 1, #difficulties do
			local difficulty = difficulties[i]
			local difficulty_breeds = {}

			ConflictUtils_find_conflict_director_breeds(data, difficulty, difficulty_breeds)

			data.contained_breeds[difficulty] = difficulty_breeds
		end
	end

	print("[ConflictSettings] Contained breeds generated in:", os.clock() - start_time)
end

RecycleSettings = {
	ai_stuck_check_start_time = 10,
	destroy_los_distance_squared = 8100,
	destroy_no_path_found_time = 10,
	destroy_no_path_only_behind = true,
	destroy_stuck_distance_squared = 625,
	max_grunts = 90,
	push_horde_if_num_alive_grunts_above = 60,
	push_horde_in_time = true,
}
CurrentConflictSettings = CurrentConflictSettings or false
CurrentIntensitySettings = CurrentIntensitySettings or false
CurrentPacing = CurrentPacing or false
CurrentBossSettings = CurrentBossSettings or false
CurrentSpecialsSettings = CurrentSpecialsSettings or false
CurrentHordeSettings = CurrentHordeSettings or false
CurrentRoamingSettings = CurrentRoamingSettings or false
CurrentPackSpawningSettings = CurrentPackSpawningSettings or false

do
	local crash = false

	for name, horde_setting in pairs(HordeSettings) do
		local compositions = horde_setting.compositions

		horde_setting.name = name

		for event_name, elements in pairs(TerrorEventBlueprints) do
			for i = 1, #elements do
				local element = elements[i]
				local element_type = element[1]

				if element_type == "event_horde" and not compositions[element.composition_type] then
					print(string.format("Bad or misspelled composition_type '%s' in event '%s', element number %d in horde setting %s", tostring(element.composition_type), event_name, i, name))

					crash = true
				end
			end
		end
	end

	if crash then
		error("Found errors in TerrorEventBlueprints, as shown here --^")
	end

	for id, setting in pairs(PackSpawningSettings) do
		setting.name = id

		if not setting.disabled then
			roaming_set = setting.roaming_set
			roaming_set.name = id

			local weights = {}
			local breed_packs_override = roaming_set.breed_packs_override

			if breed_packs_override then
				for i = 1, #breed_packs_override do
					weights[i] = breed_packs_override[i][2]
				end

				roaming_set.breed_packs_override_loaded_dice = {
					LoadedDice.create(weights),
				}
			end
		end
	end

	for name, boss_setting in pairs(BossSettings) do
		boss_setting.name = name
	end

	for name, intensity_setting in pairs(IntensitySettings) do
		intensity_setting.name = name
	end

	for name, specials_setting in pairs(SpecialsSettings) do
		specials_setting.name = name
	end

	for name, pacing_setting in pairs(PacingSettings) do
		pacing_setting.name = name
	end
end

DebugBreedSpawns = {}

require("scripts/settings/horde_compositions")
require("scripts/settings/horde_compositions_pacing")
require("scripts/settings/difficulty_settings")
require("scripts/managers/conflict_director/conflict_utils")

HordeSettingsBasics = {
	ambush = {
		max_size,
		max_horde_spawner_dist = 35,
		min_hidden_spawner_dist = 5,
		min_spawners = 3,
		start_delay = 3.45,
		max_hidden_spawner_dist = 40,
		min_horde_spawner_dist = 1,
		max_spawners = math.huge
	},
	vector = {
		max_size,
		max_horde_spawner_dist = 40,
		start_delay = 8,
		max_hidden_spawner_dist = 40,
		min_hidden_spawner_dist = 0,
		main_path_dist_from_players = 30,
		max_spawners = 6,
		main_path_chance_spawning_ahead = 0.67,
		raw_dist_from_players = 20,
		min_horde_spawner_dist = 0
	},
	vector_blob = {
		max_size,
		start_delay = 1,
		main_path_chance_spawning_ahead = 0.67,
		raw_dist_from_players = 20,
		main_path_dist_from_players = 60
	}
}
local weights = {}
local crash = nil
local num_comps = 0

for name, composition in pairs(HordeCompositions) do
	num_comps = num_comps + 1

	for i = 1, #composition, 1 do
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
			LoadedDice.create(weights)
		}

		fassert(not crash, "Found errors in HordeComposition table %s - see above. ", name)
		fassert(compositions.loaded_probs, "Could not create horde compositison sprobablitity table, make sure the table '%s' in HordeCompositions is correctly structured and has an entry for each difficulty.", name)
	end
end

HordeSettings = {
	default = {
		chance_of_vector = 0.5,
		ambush_composition = "medium",
		vector_composition = "medium",
		mini_patrol_composition = "mini_patrol",
		vector_blob_composition = "medium",
		chance_of_vector_blob = 0.5,
		disabled = false,
		mix_paced_hordes = true,
		compositions = HordeCompositions,
		compositions_pacing = HordeCompositionsPacing,
		ambush = HordeSettingsBasics.ambush,
		vector = HordeSettingsBasics.vector,
		vector_blob = HordeSettingsBasics.vector_blob,
		difficulty_overrides = {
			hard = {
				vector_blob_composition = "medium",
				ambush_composition = "medium",
				vector_composition = "medium"
			},
			harder = {
				vector_blob_composition = "large",
				ambush_composition = "large",
				vector_composition = "large"
			},
			hardest = {
				vector_blob_composition = "large",
				ambush_composition = "large",
				vector_composition = "large"
			},
			cataclysm = {
				ambush_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker"
				},
				vector_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker"
				},
				vector_blob_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker"
				}
			},
			cataclysm_2 = {
				ambush_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker"
				},
				vector_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker"
				},
				vector_blob_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker"
				}
			},
			cataclysm_3 = {
				ambush_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker"
				},
				vector_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker"
				},
				vector_blob_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker"
				}
			}
		}
	},
	default_light = {
		chance_of_vector = 0.5,
		ambush_composition = "medium",
		vector_composition = "medium",
		mini_patrol_composition = "mini_patrol",
		vector_blob_composition = "medium",
		chance_of_vector_blob = 0.5,
		disabled = false,
		mix_paced_hordes = true,
		compositions = HordeCompositions,
		compositions_pacing = HordeCompositionsPacing,
		ambush = HordeSettingsBasics.ambush,
		vector = HordeSettingsBasics.vector,
		vector_blob = HordeSettingsBasics.vector_blob,
		difficulty_overrides = {
			hard = {
				vector_blob_composition = "medium",
				ambush_composition = "medium",
				vector_composition = "medium"
			},
			harder = {
				vector_blob_composition = "large",
				ambush_composition = "large",
				vector_composition = "large"
			},
			hardest = {
				vector_blob_composition = "large",
				ambush_composition = "large",
				vector_composition = "large"
			},
			cataclysm = {
				ambush_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker"
				},
				vector_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker"
				},
				vector_blob_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker"
				}
			},
			cataclysm_2 = {
				ambush_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker"
				},
				vector_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker"
				},
				vector_blob_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker"
				}
			},
			cataclysm_3 = {
				ambush_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker"
				},
				vector_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker"
				},
				vector_blob_composition = {
					"skaven_huge",
					"skaven_huge_shields",
					"skaven_huge_armor",
					"skaven_huge_berzerker"
				}
			}
		}
	},
	chaos = {
		chance_of_vector = 1,
		ambush_composition = "chaos_medium",
		vector_composition = "chaos_medium",
		mini_patrol_composition = "chaos_mini_patrol",
		vector_blob_composition = "chaos_medium",
		chance_of_vector_blob = 1,
		disabled = false,
		mix_paced_hordes = true,
		compositions = HordeCompositions,
		compositions_pacing = HordeCompositionsPacing,
		ambush = HordeSettingsBasics.ambush,
		vector = HordeSettingsBasics.vector,
		vector_blob = HordeSettingsBasics.vector_blob,
		difficulty_overrides = {
			hard = {
				vector_blob_composition = "chaos_medium",
				ambush_composition = "chaos_medium",
				vector_composition = "chaos_medium"
			},
			harder = {
				vector_blob_composition = "chaos_large",
				ambush_composition = "chaos_large",
				vector_composition = "chaos_large"
			},
			hardest = {
				vector_blob_composition = "chaos_large",
				ambush_composition = "chaos_large",
				vector_composition = "chaos_large"
			},
			cataclysm = {
				ambush_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker"
				},
				vector_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker"
				},
				vector_blob_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker"
				}
			},
			cataclysm_2 = {
				ambush_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker"
				},
				vector_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker"
				},
				vector_blob_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker"
				}
			},
			cataclysm_3 = {
				ambush_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker"
				},
				vector_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker"
				},
				vector_blob_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker"
				}
			}
		}
	},
	chaos_light = {
		chance_of_vector = 1,
		ambush_composition = "chaos_medium",
		vector_composition = "chaos_medium",
		mini_patrol_composition = "chaos_mini_patrol",
		vector_blob_composition = "chaos_medium",
		chance_of_vector_blob = 1,
		disabled = false,
		mix_paced_hordes = true,
		compositions = HordeCompositions,
		compositions_pacing = HordeCompositionsPacing,
		ambush = HordeSettingsBasics.ambush,
		vector = HordeSettingsBasics.vector,
		vector_blob = HordeSettingsBasics.vector_blob,
		difficulty_overrides = {
			hard = {
				vector_blob_composition = "chaos_medium",
				ambush_composition = "chaos_medium",
				vector_composition = "chaos_medium"
			},
			harder = {
				vector_blob_composition = "chaos_large",
				ambush_composition = "chaos_large",
				vector_composition = "chaos_large"
			},
			hardest = {
				vector_blob_composition = "chaos_large",
				ambush_composition = "chaos_large",
				vector_composition = "chaos_large"
			},
			cataclysm = {
				ambush_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker"
				},
				vector_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker"
				},
				vector_blob_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker"
				}
			},
			cataclysm_2 = {
				ambush_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker"
				},
				vector_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker"
				},
				vector_blob_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker"
				}
			},
			cataclysm_3 = {
				ambush_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker"
				},
				vector_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker"
				},
				vector_blob_composition = {
					"chaos_huge",
					"chaos_huge_shields",
					"chaos_huge_armor",
					"chaos_huge_berzerker"
				}
			}
		}
	},
	beastmen = {
		chance_of_vector = 0.5,
		ambush_composition = "beastmen_medium",
		vector_composition = "beastmen_medium",
		mini_patrol_composition = "beastmen_mini_patrol",
		vector_blob_composition = "beastmen_medium",
		chance_of_vector_blob = 0.5,
		disabled = false,
		mix_paced_hordes = false,
		compositions = HordeCompositions,
		compositions_pacing = HordeCompositionsPacing,
		ambush = HordeSettingsBasics.ambush,
		vector = HordeSettingsBasics.vector,
		vector_blob = HordeSettingsBasics.vector_blob,
		difficulty_overrides = {
			hard = {
				vector_blob_composition = "beastmen_medium",
				ambush_composition = "beastmen_medium",
				vector_composition = "beastmen_medium"
			},
			harder = {
				vector_blob_composition = "beastmen_large",
				ambush_composition = "beastmen_large",
				vector_composition = "beastmen_large"
			},
			hardest = {
				vector_blob_composition = "beastmen_large",
				ambush_composition = "beastmen_large",
				vector_composition = "beastmen_large"
			},
			cataclysm = {
				ambush_composition = {
					"beastmen_huge",
					"beastmen_huge_armor"
				},
				vector_composition = {
					"beastmen_huge",
					"beastmen_huge_armor"
				},
				vector_blob_composition = {
					"beastmen_huge",
					"beastmen_huge_armor"
				}
			},
			cataclysm_2 = {
				ambush_composition = {
					"beastmen_huge",
					"beastmen_huge_armor"
				},
				vector_composition = {
					"beastmen_huge",
					"beastmen_huge_armor"
				},
				vector_blob_composition = {
					"beastmen_huge",
					"beastmen_huge_armor"
				}
			},
			cataclysm_3 = {
				ambush_composition = {
					"beastmen_huge",
					"beastmen_huge_armor"
				},
				vector_composition = {
					"beastmen_huge",
					"beastmen_huge_armor"
				},
				vector_blob_composition = {
					"beastmen_huge",
					"beastmen_huge_armor"
				}
			}
		}
	},
	challenge_level = {
		chance_of_vector = 0.5,
		ambush_composition = "medium",
		vector_composition = "medium",
		mini_patrol_composition = "mini_patrol",
		vector_blob_composition = "medium",
		chance_of_vector_blob = 0.5,
		disabled = true,
		mix_paced_hordes = true,
		compositions = HordeCompositions,
		compositions_pacing = HordeCompositionsPacing,
		ambush = HordeSettingsBasics.ambush,
		vector = HordeSettingsBasics.vector,
		vector_blob = HordeSettingsBasics.vector_blob,
		difficulty_overrides = {
			hard = {
				vector_blob_composition = "medium",
				ambush_composition = "medium",
				vector_composition = "medium"
			},
			harder = {
				vector_blob_composition = "large",
				ambush_composition = "large",
				vector_composition = "large"
			},
			hardest = {
				vector_blob_composition = "large",
				ambush_composition = "large",
				vector_composition = "large"
			},
			cataclysm = {
				vector_blob_composition = "huge",
				ambush_composition = "huge",
				vector_composition = "huge"
			},
			cataclysm_2 = {
				vector_blob_composition = "huge",
				ambush_composition = "huge",
				vector_composition = "huge"
			},
			cataclysm_3 = {
				vector_blob_composition = "huge",
				ambush_composition = "huge",
				vector_composition = "huge"
			}
		}
	}
}
HordeSettings.disabled = table.clone(HordeSettings.default)
HordeSettings.disabled.disabled = true
local weights = {}
local crash = nil

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
				LoadedDice.create(weights)
			}

			fassert(not crash, "Found errors in HordeCompositionsPacing table %s - see above. ", name)
			fassert(composition.loaded_probs, "Could not create horde composition probablitity table, make sure the table '%s' in HordeCompositionsPacing is correctly structured.", name)
		end
	end
end

PackDistributions = {
	periodical = {
		min_hi_dist = 2,
		min_low_dist = 7,
		max_low_density = 0.4,
		min_hi_density = 0.65,
		random_distribution = false,
		zero_density_below = 0.1,
		max_hi_dist = 3,
		min_low_density = 0,
		zero_clamp_max_dist = 5,
		max_low_dist = 10,
		max_hi_density = 1
	},
	random = {}
}
RoamingSettings = {
	default = {
		despawn_distance = 45,
		despawn_path_distance = 75,
		despawn_distance_z = 30,
		disabled = false
	},
	disabled = {
		despawn_distance = 45,
		despawn_path_distance = 75,
		despawn_distance_z = 30,
		disabled = true
	},
	gdc_build = {
		despawn_distance = 45,
		despawn_path_distance = 75,
		despawn_distance_z = 30
	}
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
			"skaven_warpfire_thrower"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 2,
				chance_of_coordinated_attack = 0,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					60,
					100
				}
			}
		}
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
			"skaven_warpfire_thrower"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 2,
				chance_of_coordinated_attack = 0.25,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					50,
					90
				}
			}
		}
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
			"skaven_warpfire_thrower"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 2,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0.5,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					50,
					90
				}
			}
		}
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
			"skaven_warpfire_thrower"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 3,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0.5,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					40,
					70
				}
			}
		}
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
			"skaven_warpfire_thrower"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 3,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0.5,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					30,
					60
				}
			}
		}
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
			"skaven_warpfire_thrower"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 3,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0.5,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					30,
					60
				}
			}
		}
	}
}
local SpecialDifficultyOverrides_skaven = {
	hard = {
		max_specials = 3,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"skaven_warpfire_thrower"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 2,
				chance_of_coordinated_attack = 0,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					60,
					100
				}
			}
		}
	},
	harder = {
		max_specials = 4,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"skaven_warpfire_thrower"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 2,
				chance_of_coordinated_attack = 0.25,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					60,
					100
				}
			}
		}
	},
	hardest = {
		max_specials = 4,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"skaven_warpfire_thrower"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 2,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0.5,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					50,
					90
				}
			}
		}
	},
	cataclysm = {
		max_specials = 5,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"skaven_warpfire_thrower"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 3,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0.5,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					40,
					70
				}
			}
		}
	},
	cataclysm_2 = {
		max_specials = 6,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"skaven_warpfire_thrower"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 3,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0.5,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					30,
					60
				}
			}
		}
	},
	cataclysm_3 = {
		max_specials = 6,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"skaven_warpfire_thrower"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 3,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0.5,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					30,
					60
				}
			}
		}
	}
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
			"skaven_warpfire_thrower"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 1,
				chance_of_coordinated_attack = 0,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					50,
					90
				}
			}
		}
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
			"skaven_warpfire_thrower"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 2,
				chance_of_coordinated_attack = 0.25,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					50,
					90
				}
			}
		}
	},
	hardest = {
		max_specials = 3,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_warpfire_thrower"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 2,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0.5,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					45,
					70
				}
			}
		}
	},
	cataclysm = {
		max_specials = 5,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_warpfire_thrower"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 3,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0.5,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					40,
					70
				}
			}
		}
	},
	cataclysm_2 = {
		max_specials = 6,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_warpfire_thrower"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 3,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0.5,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					30,
					60
				}
			}
		}
	},
	cataclysm_3 = {
		max_specials = 6,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_warpfire_thrower"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 3,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0.5,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					30,
					60
				}
			}
		}
	}
}
local SpecialDifficultyOverrides_beastmen = {
	hard = {
		max_specials = 2,
		breeds = {
			"beastmen_standard_bearer",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_gutter_runner",
			"skaven_pack_master"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 2,
				chance_of_coordinated_attack = 0,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					40,
					70
				}
			}
		}
	},
	harder = {
		max_specials = 3,
		breeds = {
			"beastmen_standard_bearer",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_gutter_runner",
			"skaven_pack_master"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 2,
				chance_of_coordinated_attack = 0.25,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					40,
					70
				}
			}
		}
	},
	hardest = {
		max_specials = 3,
		breeds = {
			"beastmen_standard_bearer",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_gutter_runner",
			"skaven_pack_master"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 2,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0.5,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					30,
					60
				}
			}
		}
	},
	cataclysm = {
		max_specials = 4,
		breeds = {
			"beastmen_standard_bearer",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_gutter_runner",
			"skaven_pack_master"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 3,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0.5,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					30,
					60
				}
			}
		}
	},
	cataclysm_2 = {
		max_specials = 5,
		breeds = {
			"beastmen_standard_bearer",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_gutter_runner",
			"skaven_pack_master"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 3,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0.5,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					30,
					60
				}
			}
		}
	},
	cataclysm_3 = {
		max_specials = 6,
		breeds = {
			"beastmen_standard_bearer",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_gutter_runner",
			"skaven_pack_master"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 4,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0.5,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					30,
					60
				}
			}
		}
	}
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
			"beastmen_standard_bearer"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 2,
				chance_of_coordinated_attack = 0,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					40,
					70
				}
			}
		}
	},
	harder = {
		max_specials = 3,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"skaven_warpfire_thrower",
			"beastmen_standard_bearer"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 2,
				chance_of_coordinated_attack = 0.25,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					40,
					70
				}
			}
		}
	},
	hardest = {
		max_specials = 3,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"skaven_warpfire_thrower",
			"beastmen_standard_bearer"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 2,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0.5,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					30,
					60
				}
			}
		}
	},
	cataclysm = {
		max_specials = 4,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"skaven_warpfire_thrower",
			"beastmen_standard_bearer"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 3,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0.5,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					30,
					60
				}
			}
		}
	},
	cataclysm_2 = {
		max_specials = 5,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"skaven_warpfire_thrower",
			"beastmen_standard_bearer"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 3,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0.5,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					30,
					60
				}
			}
		}
	},
	cataclysm_3 = {
		max_specials = 6,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"skaven_warpfire_thrower",
			"beastmen_standard_bearer"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 4,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0.5,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					30,
					60
				}
			}
		}
	}
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
			"skaven_warpfire_thrower"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 1,
				chance_of_coordinated_attack = 0,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					50,
					90
				}
			}
		}
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
			"skaven_warpfire_thrower"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 2,
				chance_of_coordinated_attack = 0.25,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					50,
					90
				}
			}
		}
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
			"skaven_warpfire_thrower"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 2,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0.5,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					45,
					70
				}
			}
		}
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
			"skaven_warpfire_thrower"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 3,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0.5,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					40,
					70
				}
			}
		}
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
			"skaven_warpfire_thrower"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 3,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0.5,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					30,
					60
				}
			}
		}
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
			"skaven_warpfire_thrower"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 3,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0.5,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					30,
					60
				}
			}
		}
	}
}
SpecialsSettings = {
	default = {
		spawn_method = "specials_by_slots",
		disabled = false,
		max_specials = 2,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_warpfire_thrower"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 1,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					60,
					90
				}
			}
		},
		rush_intervention = {
			loneliness_value_for_ambush_horde = 25,
			delay_between_interventions = 20,
			chance_of_ambush_horde = 0.25,
			loneliness_value_for_special = 30,
			distance_until_next_intervention = 30,
			breeds = {
				"skaven_pack_master",
				"skaven_gutter_runner",
				"skaven_ratling_gunner"
			}
		},
		speed_running_intervention = {
			travel_distance_check_frequency = 10,
			travel_distance_threshold = 40,
			time_required_in_pacing_peak_to_ignore_high_intensity = 40,
			required_time_spent_in_high_threat = 30,
			chance_of_vector_horde = 0.25,
			breeds = {
				"skaven_pack_master",
				"skaven_gutter_runner",
				"chaos_corruptor_sorcerer",
				"skaven_ratling_gunner"
			},
			delay_between_speed_running_intervention_special_spawn = {
				{
					15,
					30
				},
				{
					12,
					24
				},
				{
					8,
					18
				},
				{
					5,
					12
				}
			},
			delay_between_speed_running_intervention_horde_spawn = {
				8,
				12
			},
			vector_horde_breeds = {
				"skaven_plague_monk",
				"chaos_berzerker",
				"chaos_marauder",
				"chaos_raider"
			},
			vector_horde_config = {
				skaven_plague_monk = {
					2,
					3
				},
				chaos_berzerker = {
					2,
					3
				},
				chaos_marauder = {
					5,
					8
				},
				chaos_raider = {
					2,
					3
				}
			},
			total_travel_distance_scaling_thresholds = {
				80,
				160,
				240,
				320
			}
		},
		difficulty_overrides = SpecialDifficultyOverrides
	},
	default_light = {
		spawn_method = "specials_by_slots",
		disabled = false,
		max_specials = 2,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_warpfire_thrower"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 1,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					60,
					90
				}
			}
		},
		rush_intervention = {
			loneliness_value_for_ambush_horde = 25,
			delay_between_interventions = 20,
			chance_of_ambush_horde = 0.25,
			loneliness_value_for_special = 30,
			distance_until_next_intervention = 30,
			breeds = {
				"skaven_pack_master",
				"skaven_gutter_runner",
				"skaven_ratling_gunner"
			}
		},
		difficulty_overrides = SpecialDifficultyOverrides
	},
	skaven = {
		spawn_method = "specials_by_slots",
		disabled = false,
		max_specials = 2,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"skaven_warpfire_thrower"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 1,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					50,
					90
				}
			}
		},
		rush_intervention = {
			loneliness_value_for_ambush_horde = 25,
			delay_between_interventions = 20,
			chance_of_ambush_horde = 0.25,
			loneliness_value_for_special = 30,
			distance_until_next_intervention = 30,
			breeds = {
				"skaven_pack_master",
				"skaven_gutter_runner",
				"skaven_ratling_gunner"
			}
		},
		difficulty_overrides = SpecialDifficultyOverrides_skaven
	},
	skaven_light = {
		spawn_method = "specials_by_slots",
		disabled = false,
		max_specials = 2,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"skaven_warpfire_thrower"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 1,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					50,
					90
				}
			}
		},
		rush_intervention = {
			loneliness_value_for_ambush_horde = 25,
			delay_between_interventions = 20,
			chance_of_ambush_horde = 0.25,
			loneliness_value_for_special = 30,
			distance_until_next_intervention = 30,
			breeds = {
				"skaven_pack_master",
				"skaven_gutter_runner",
				"skaven_ratling_gunner"
			}
		},
		difficulty_overrides = SpecialDifficultyOverrides_skaven
	},
	default_demo = {
		spawn_method = "specials_by_slots",
		disabled = false,
		max_specials = 2,
		breeds = {
			"skaven_poison_wind_globadier",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_warpfire_thrower"
		},
		methods = {
			specials_by_time_window = {
				even_out_breeds = true,
				spawn_interval = {
					90,
					120
				},
				lull_time = {
					20,
					40
				}
			},
			specials_by_slots = {
				max_of_same = 2,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					5,
					150
				},
				spawn_cooldown = {
					100,
					200
				}
			}
		},
		rush_intervention = {
			loneliness_value_for_ambush_horde = 25,
			delay_between_interventions = 30,
			chance_of_ambush_horde = 0.25,
			loneliness_value_for_special = 30,
			distance_until_next_intervention = 30,
			breeds = {
				"skaven_pack_master"
			}
		}
	},
	chaos_demo = {
		spawn_method = "specials_by_slots",
		disabled = false,
		max_specials = 2,
		breeds = {
			"skaven_pack_master",
			"skaven_warpfire_thrower"
		},
		methods = {
			specials_by_time_window = {
				even_out_breeds = true,
				spawn_interval = {
					120,
					240
				},
				lull_time = {
					40,
					60
				}
			},
			specials_by_slots = {
				max_of_same = 2,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					150
				},
				spawn_cooldown = {
					150,
					250
				}
			}
		},
		rush_intervention = {
			loneliness_value_for_ambush_horde = 25,
			delay_between_interventions = 30,
			chance_of_ambush_horde = 0.25,
			loneliness_value_for_special = 30,
			distance_until_next_intervention = 30,
			breeds = {
				"skaven_pack_master"
			}
		}
	},
	chaos_light_demo = {
		spawn_method = "specials_by_slots",
		disabled = true,
		max_specials = 2,
		breeds = {
			"skaven_warpfire_thrower",
			"skaven_pack_master"
		},
		methods = {
			specials_by_time_window = {
				even_out_breeds = true,
				spawn_interval = {
					80,
					120
				},
				lull_time = {
					20,
					30
				}
			},
			specials_by_slots = {
				max_of_same = 2,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					150
				},
				spawn_cooldown = {
					150,
					250
				}
			}
		},
		rush_intervention = {
			loneliness_value_for_ambush_horde = 25,
			delay_between_interventions = 30,
			chance_of_ambush_horde = 0.25,
			loneliness_value_for_special = 30,
			distance_until_next_intervention = 30,
			breeds = {
				"skaven_pack_master"
			}
		}
	},
	chaos = {
		spawn_method = "specials_by_slots",
		disabled = false,
		max_specials = 2,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_warpfire_thrower"
		},
		methods = {
			specials_by_time_window = {
				even_out_breeds = true,
				spawn_interval = {
					60,
					100
				},
				lull_time = {
					20,
					30
				}
			},
			specials_by_slots = {
				max_of_same = 1,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					50,
					80
				}
			}
		},
		rush_intervention = {
			loneliness_value_for_ambush_horde = 25,
			delay_between_interventions = 20,
			chance_of_ambush_horde = 0.25,
			loneliness_value_for_special = 30,
			distance_until_next_intervention = 30,
			breeds = {
				"chaos_corruptor_sorcerer"
			}
		},
		difficulty_overrides = SpecialDifficultyOverrides_chaos
	},
	chaos_light = {
		spawn_method = "specials_by_slots",
		disabled = true,
		max_specials = 2,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_warpfire_thrower"
		},
		methods = {
			specials_by_time_window = {
				even_out_breeds = true,
				spawn_interval = {
					60,
					100
				},
				lull_time = {
					20,
					30
				}
			},
			specials_by_slots = {
				max_of_same = 1,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					50,
					80
				}
			}
		},
		rush_intervention = {
			loneliness_value_for_ambush_horde = 25,
			delay_between_interventions = 20,
			chance_of_ambush_horde = 0.25,
			loneliness_value_for_special = 30,
			distance_until_next_intervention = 30,
			breeds = {
				"chaos_corruptor_sorcerer"
			}
		},
		difficulty_overrides = SpecialDifficultyOverrides_chaos
	},
	survival = {
		spawn_method = "specials_by_slots",
		disabled = false,
		max_specials = 3,
		breeds = {
			"skaven_gutter_runner",
			"skaven_poison_wind_globadier",
			"skaven_pack_master",
			"skaven_ratling_gunner"
		},
		methods = {
			specials_by_time_window = {
				even_out_breeds = true,
				spawn_interval = {
					80,
					100
				},
				lull_time = {
					15,
					35
				}
			},
			specials_by_slots = {
				max_of_same = 2,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					5,
					150
				},
				spawn_cooldown = {
					100,
					200
				}
			}
		},
		rush_intervention = {
			loneliness_value_for_ambush_horde = 25,
			delay_between_interventions = 30,
			chance_of_ambush_horde = 0.25,
			loneliness_value_for_special = 30,
			distance_until_next_intervention = 30,
			breeds = {
				"skaven_pack_master",
				"skaven_gutter_runner"
			}
		},
		difficulty_overrides = SpecialDifficultyOverrides
	},
	gdc_build = {
		spawn_method = "specials_by_slots",
		disabled = false,
		max_specials = 3,
		breeds = {
			"skaven_poison_wind_globadier",
			"skaven_ratling_gunner"
		},
		methods = {
			specials_by_time_window = {
				even_out_breeds = true,
				spawn_interval = {
					80,
					100
				},
				lull_time = {
					20,
					40
				}
			},
			specials_by_slots = {
				select_next_breed = "get_random_breed",
				coordinated_attack_cooldown_multiplier = 0.5,
				max_of_same = 2,
				spawn_interval = {
					30,
					60
				},
				spawn_cooldown = {
					30,
					40
				}
			}
		},
		rush_intervention = {
			loneliness_value_for_ambush_horde = 25,
			delay_between_interventions = 30,
			chance_of_ambush_horde = 0.25,
			loneliness_value_for_special = 30,
			distance_until_next_intervention = 30,
			breeds = {
				"skaven_pack_master",
				"skaven_gutter_runner"
			}
		},
		difficulty_overrides = SpecialDifficultyOverrides
	},
	beastmen = {
		spawn_method = "specials_by_slots",
		disabled = false,
		max_specials = 2,
		breeds = {
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"beastmen_standard_bearer"
		},
		methods = {
			specials_by_time_window = {
				even_out_breeds = true,
				spawn_interval = {
					60,
					100
				},
				lull_time = {
					20,
					30
				}
			},
			specials_by_slots = {
				max_of_same = 1,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					50,
					80
				}
			}
		},
		outside_navmesh_intervention = {
			delay_between_interventions = 10,
			needed_ordinary_enemy_aggro = 5,
			disabled = true,
			needed_special_enemy_aggro = 1,
			intervention_time = 5,
			breeds = {
				"skaven_warpfire_thrower",
				"skaven_poison_wind_globadier"
			}
		},
		rush_intervention = {
			loneliness_value_for_ambush_horde = 25,
			delay_between_interventions = 20,
			chance_of_ambush_horde = 0.25,
			loneliness_value_for_special = 30,
			distance_until_next_intervention = 30,
			breeds = {
				"chaos_corruptor_sorcerer"
			}
		},
		difficulty_overrides = SpecialDifficultyOverrides_beastmen
	},
	skaven_beastmen = {
		spawn_method = "specials_by_slots",
		disabled = false,
		max_specials = 2,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_ratling_gunner",
			"skaven_poison_wind_globadier",
			"skaven_warpfire_thrower",
			"beastmen_standard_bearer"
		},
		methods = {
			specials_by_time_window = {
				even_out_breeds = true,
				spawn_interval = {
					60,
					100
				},
				lull_time = {
					20,
					30
				}
			},
			specials_by_slots = {
				max_of_same = 1,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					50,
					80
				}
			}
		},
		outside_navmesh_intervention = {
			delay_between_interventions = 10,
			needed_ordinary_enemy_aggro = 5,
			disabled = true,
			needed_special_enemy_aggro = 1,
			intervention_time = 5,
			breeds = {
				"skaven_warpfire_thrower",
				"skaven_poison_wind_globadier"
			}
		},
		rush_intervention = {
			loneliness_value_for_ambush_horde = 25,
			delay_between_interventions = 20,
			chance_of_ambush_horde = 0.25,
			loneliness_value_for_special = 30,
			distance_until_next_intervention = 30,
			breeds = {
				"chaos_corruptor_sorcerer"
			}
		},
		difficulty_overrides = SpecialDifficultyOverrides_skaven_beastmen
	},
	chaos_beastmen = {
		spawn_method = "specials_by_slots",
		disabled = false,
		max_specials = 2,
		breeds = {
			"skaven_gutter_runner",
			"skaven_pack_master",
			"skaven_poison_wind_globadier",
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_warpfire_thrower",
			"beastmen_standard_bearer"
		},
		methods = {
			specials_by_time_window = {
				even_out_breeds = true,
				spawn_interval = {
					60,
					100
				},
				lull_time = {
					20,
					30
				}
			},
			specials_by_slots = {
				max_of_same = 1,
				coordinated_attack_cooldown_multiplier = 0.5,
				chance_of_coordinated_attack = 0,
				select_next_breed = "get_random_breed",
				after_safe_zone_delay = {
					30,
					60
				},
				spawn_cooldown = {
					50,
					80
				}
			}
		},
		rush_intervention = {
			loneliness_value_for_ambush_horde = 25,
			delay_between_interventions = 20,
			chance_of_ambush_horde = 0.25,
			loneliness_value_for_special = 30,
			distance_until_next_intervention = 30,
			breeds = {
				"chaos_corruptor_sorcerer"
			}
		},
		difficulty_overrides = SpecialDifficultyOverrides_chaos
	},
	disabled = {
		disabled = true,
		rush_intervention = {}
	}
}
BossSettings = {
	default = {
		disabled = false,
		boss_events = {
			debug_color = "deep_sky_blue",
			name = "boss_events",
			terror_events_using_packs = false,
			chance_of_encampment = 0,
			events = {
				"event_boss",
				"event_patrol",
				"nothing"
			},
			event_lookup = {
				event_boss = {
					"boss_event_chaos_troll",
					"boss_event_chaos_spawn",
					"boss_event_storm_fiend",
					"boss_event_rat_ogre"
				},
				event_patrol = {
					"boss_event_spline_patrol"
				}
			}
		},
		rare_events = {
			name = "rare_events",
			debug_color = "deep_pink",
			events = {
				"event_boss"
			},
			event_lookup = {
				event_boss = {
					"rare_event_loot_rat"
				}
			}
		}
	},
	default_light = {
		disabled = false,
		boss_events = {
			debug_color = "deep_sky_blue",
			name = "boss_events",
			terror_events_using_packs = false,
			chance_of_encampment = 0,
			events = {
				"event_boss",
				"event_patrol",
				"nothing"
			},
			event_lookup = {
				event_boss = {
					"boss_event_chaos_troll",
					"boss_event_chaos_spawn",
					"boss_event_storm_fiend",
					"boss_event_rat_ogre"
				},
				event_patrol = {
					"boss_event_spline_patrol"
				}
			}
		},
		rare_events = {
			name = "rare_events",
			debug_color = "deep_pink",
			events = {
				"event_boss"
			},
			event_lookup = {
				event_boss = {
					"rare_event_loot_rat"
				}
			}
		}
	},
	skaven = {
		disabled = false,
		boss_events = {
			debug_color = "deep_sky_blue",
			name = "boss_events",
			terror_events_using_packs = false,
			chance_of_encampment = 0,
			events = {
				"event_boss",
				"event_patrol",
				"nothing"
			},
			event_lookup = {
				event_boss = {
					"boss_event_storm_fiend",
					"boss_event_rat_ogre"
				},
				event_patrol = {
					"boss_event_skaven_spline_patrol"
				}
			}
		},
		rare_events = {
			name = "rare_events",
			debug_color = "deep_pink",
			events = {
				"event_boss"
			},
			event_lookup = {
				event_boss = {
					"rare_event_loot_rat"
				}
			}
		}
	},
	skaven_light = {
		disabled = false,
		boss_events = {
			debug_color = "deep_sky_blue",
			name = "boss_events",
			terror_events_using_packs = false,
			chance_of_encampment = 0,
			events = {
				"event_boss",
				"event_patrol",
				"nothing"
			},
			event_lookup = {
				event_boss = {
					"boss_event_storm_fiend",
					"boss_event_rat_ogre"
				},
				event_patrol = {
					"boss_event_skaven_spline_patrol"
				}
			}
		},
		rare_events = {
			name = "rare_events",
			debug_color = "deep_pink",
			events = {
				"event_boss"
			},
			event_lookup = {
				event_boss = {
					"rare_event_loot_rat"
				}
			}
		}
	},
	chaos = {
		disabled = false,
		boss_events = {
			debug_color = "deep_sky_blue",
			name = "boss_events",
			terror_events_using_packs = false,
			chance_of_encampment = 0,
			events = {
				"event_boss",
				"event_patrol",
				"nothing"
			},
			event_lookup = {
				event_boss = {
					"boss_event_chaos_troll",
					"boss_event_chaos_spawn"
				},
				event_patrol = {
					"boss_event_chaos_spline_patrol"
				}
			}
		},
		rare_events = {
			name = "rare_events",
			debug_color = "deep_pink",
			events = {
				"event_boss"
			},
			event_lookup = {
				event_boss = {
					"rare_event_loot_rat"
				}
			}
		}
	},
	chaos_light = {
		disabled = true,
		boss_events = {
			debug_color = "deep_sky_blue",
			name = "boss_events",
			terror_events_using_packs = false,
			chance_of_encampment = 0,
			events = {
				"event_boss",
				"event_patrol",
				"nothing"
			},
			event_lookup = {
				event_boss = {
					"boss_event_chaos_troll",
					"boss_event_chaos_spawn"
				},
				event_patrol = {
					"boss_event_spline_patrol"
				}
			}
		},
		rare_events = {
			name = "rare_events",
			debug_color = "deep_pink",
			events = {
				"event_boss"
			},
			event_lookup = {
				event_boss = {
					"rare_event_loot_rat"
				}
			}
		}
	},
	beastmen = {
		disabled = false,
		boss_events = {
			debug_color = "deep_sky_blue",
			name = "boss_events",
			terror_events_using_packs = false,
			chance_of_encampment = 0,
			events = {
				"event_boss",
				"event_patrol",
				"nothing"
			},
			event_lookup = {
				event_boss = {
					"boss_event_minotaur",
					"boss_event_chaos_spawn"
				},
				event_patrol = {
					"boss_event_beastmen_spline_patrol"
				}
			}
		},
		rare_events = {
			name = "rare_events",
			debug_color = "deep_pink",
			events = {
				"event_boss"
			},
			event_lookup = {
				event_boss = {
					"rare_event_loot_rat"
				}
			}
		}
	},
	skaven_beastmen = {
		disabled = false,
		boss_events = {
			debug_color = "deep_sky_blue",
			name = "boss_events",
			terror_events_using_packs = false,
			chance_of_encampment = 0,
			events = {
				"event_boss",
				"event_patrol",
				"nothing"
			},
			event_lookup = {
				event_boss = {
					"boss_event_minotaur",
					"boss_event_chaos_spawn",
					"boss_event_storm_fiend"
				},
				event_patrol = {
					"boss_event_skaven_beastmen_spline_patrol"
				}
			}
		},
		rare_events = {
			name = "rare_events",
			debug_color = "deep_pink",
			events = {
				"event_boss"
			},
			event_lookup = {
				event_boss = {
					"rare_event_loot_rat"
				}
			}
		}
	},
	chaos_beastmen = {
		disabled = false,
		boss_events = {
			debug_color = "deep_sky_blue",
			name = "boss_events",
			terror_events_using_packs = false,
			chance_of_encampment = 0,
			events = {
				"event_boss",
				"event_patrol",
				"nothing"
			},
			event_lookup = {
				event_boss = {
					"boss_event_minotaur",
					"boss_event_chaos_spawn",
					"boss_event_chaos_troll"
				},
				event_patrol = {
					"boss_event_chaos_beastmen_spline_patrol"
				}
			}
		},
		rare_events = {
			name = "rare_events",
			debug_color = "deep_pink",
			events = {
				"event_boss"
			},
			event_lookup = {
				event_boss = {
					"rare_event_loot_rat"
				}
			}
		}
	},
	beastmen_light = {
		disabled = true,
		boss_events = {
			debug_color = "deep_sky_blue",
			name = "boss_events",
			terror_events_using_packs = false,
			chance_of_encampment = 0,
			events = {
				"event_boss",
				"event_patrol",
				"nothing"
			},
			event_lookup = {
				event_boss = {
					"boss_event_minotaur",
					"boss_event_chaos_spawn"
				},
				event_patrol = {
					"boss_event_beastmen_spline_patrol"
				}
			}
		},
		rare_events = {
			name = "rare_events",
			debug_color = "deep_pink",
			events = {
				"event_boss"
			},
			event_lookup = {
				event_boss = {
					"rare_event_loot_rat"
				}
			}
		}
	},
	gdc_build = {
		disabled = false,
		boss_events = {
			name = "boss_events",
			debug_color = "deep_sky_blue",
			events = {
				"nothing"
			},
			event_lookup = {}
		},
		rare_events = {
			name = "rare_events",
			debug_color = "deep_pink",
			events = {},
			event_lookup = {}
		}
	},
	disabled = {
		safe_distance = 100,
		disabled = true
	},
	no_patrols = {
		disabled = false,
		boss_events = {
			debug_color = "deep_sky_blue",
			name = "boss_events",
			terror_events_using_packs = false,
			chance_of_encampment = 0,
			events = {
				"event_boss",
				"nothing"
			},
			event_lookup = {
				event_boss = {
					"boss_event_chaos_troll",
					"boss_event_chaos_spawn",
					"boss_event_storm_fiend",
					"boss_event_rat_ogre"
				}
			}
		},
		rare_events = {
			name = "rare_events",
			debug_color = "deep_pink",
			events = {
				"event_boss"
			},
			event_lookup = {
				event_boss = {
					"rare_event_loot_rat"
				}
			}
		}
	}
}
IntensitySettings = {
	default = {
		intensity_add_per_percent_dmg_taken = 1,
		decay_delay = 3,
		decay_per_second = 2,
		intensity_add_knockdown = 50,
		intensity_add_pounced_down = 10,
		max_intensity = 100,
		intensity_add_nearby_kill = 1,
		disabled = false,
		difficulty_overrides = {
			hard = {
				intensity_add_per_percent_dmg_taken = 1.5,
				decay_per_second = 3
			},
			harder = {
				intensity_add_per_percent_dmg_taken = 1,
				decay_per_second = 3
			},
			hardest = {
				intensity_add_per_percent_dmg_taken = 0.5,
				decay_per_second = 4
			},
			cataclysm = {
				intensity_add_per_percent_dmg_taken = 0.2,
				decay_per_second = 6
			},
			cataclysm_2 = {
				intensity_add_per_percent_dmg_taken = 0.2,
				decay_per_second = 6
			},
			cataclysm_3 = {
				intensity_add_per_percent_dmg_taken = 0.2,
				decay_per_second = 6
			}
		}
	},
	disabled = {
		intensity_add_per_percent_dmg_taken = 0,
		decay_delay = 0,
		decay_per_second = 100,
		disabled = true,
		intensity_add_knockdown = 0,
		intensity_add_pounced_down = 0,
		intensity_add_nearby_kill = 0,
		max_intensity = 100
	}
}
PacingSettings = {
	default = {
		horde_in_relax_if_rushing = false,
		relax_rushing_distance = 70,
		disabled = false,
		peak_fade_threshold = 32.5,
		multiple_hordes = 3,
		peak_intensity_threshold = 45,
		leave_relax_if_rushing = true,
		leave_relax_if_zero_intensity = true,
		sustain_peak_duration = {
			3,
			5
		},
		relax_duration = {
			50,
			70
		},
		horde_frequency = {
			70,
			150
		},
		multiple_horde_frequency = {
			10,
			15
		},
		max_delay_until_next_horde = {
			160,
			200
		},
		horde_startup_time = {
			40,
			120
		},
		horde = HordeSettings.default,
		horde_delay = {
			0,
			0
		},
		delay_horde_threat_value = {
			harder = 60,
			hard = 50,
			normal = 40,
			hardest = 60,
			cataclysm = 80,
			cataclysm_3 = 100,
			cataclysm_2 = 100,
			easy = 40
		},
		delay_mini_patrol_threat_value = {
			harder = 50,
			hard = 40,
			normal = 35,
			cataclysm_2 = 100,
			cataclysm = 80,
			cataclysm_3 = 100,
			easy = 35
		},
		delay_specials_threat_value = {
			harder = 60,
			hard = 50,
			normal = 40,
			hardest = 60,
			cataclysm = 1000,
			cataclysm_3 = 1000,
			cataclysm_2 = 1000,
			easy = 40
		},
		mini_patrol = {
			only_spawn_above_intensity = 1,
			override_timer = 20,
			only_spawn_below_intensity = 15,
			frequency = {
				15,
				20
			}
		},
		difficulty_overrides = {
			hard = {
				multiple_hordes = 3,
				peak_intensity_threshold = 50,
				horde_frequency = {
					60,
					110
				},
				multiple_horde_frequency = {
					8,
					13
				},
				relax_duration = {
					35,
					45
				}
			},
			harder = {
				multiple_hordes = 3,
				peak_intensity_threshold = 55,
				horde_frequency = {
					50,
					100
				},
				multiple_horde_frequency = {
					8,
					12
				},
				relax_duration = {
					35,
					45
				}
			},
			hardest = {
				multiple_hordes = 3,
				peak_intensity_threshold = 70,
				horde_frequency = {
					50,
					100
				},
				multiple_horde_frequency = {
					7,
					10
				},
				relax_duration = {
					25,
					35
				}
			},
			cataclysm = {
				multiple_hordes = 3,
				peak_intensity_threshold = 80,
				horde_frequency = {
					50,
					100
				},
				multiple_horde_frequency = {
					7,
					10
				},
				relax_duration = {
					25,
					35
				}
			},
			cataclysm_2 = {
				multiple_hordes = 3,
				peak_intensity_threshold = 90,
				horde_frequency = {
					50,
					100
				},
				multiple_horde_frequency = {
					7,
					10
				},
				relax_duration = {
					25,
					35
				}
			},
			cataclysm_3 = {
				multiple_hordes = 3,
				peak_intensity_threshold = 90,
				horde_frequency = {
					50,
					100
				},
				multiple_horde_frequency = {
					7,
					10
				},
				relax_duration = {
					25,
					35
				}
			}
		}
	},
	chaos = {
		horde_in_relax_if_rushing = false,
		relax_rushing_distance = 70,
		disabled = false,
		peak_fade_threshold = 32.5,
		multiple_hordes = 2,
		peak_intensity_threshold = 45,
		leave_relax_if_rushing = true,
		leave_relax_if_zero_intensity = true,
		sustain_peak_duration = {
			3,
			5
		},
		relax_duration = {
			50,
			70
		},
		horde_frequency = {
			70,
			150
		},
		horde_startup_time = {
			40,
			120
		},
		multiple_horde_frequency = {
			10,
			15
		},
		max_delay_until_next_horde = {
			180,
			210
		},
		horde = HordeSettings.chaos,
		horde_delay = {
			0,
			0
		},
		delay_horde_threat_value = {
			harder = 60,
			hard = 50,
			normal = 40,
			hardest = 60,
			cataclysm = 80,
			cataclysm_3 = 100,
			cataclysm_2 = 100,
			easy = 40
		},
		delay_mini_patrol_threat_value = {
			harder = 50,
			hard = 40,
			normal = 35,
			cataclysm_2 = 100,
			cataclysm = 80,
			cataclysm_3 = 100,
			easy = 35
		},
		delay_specials_threat_value = {
			harder = 60,
			hard = 50,
			normal = 40,
			hardest = 60,
			cataclysm = 1000,
			cataclysm_3 = 1000,
			cataclysm_2 = 1000,
			easy = 40
		},
		mini_patrol = {
			only_spawn_above_intensity = 1,
			override_timer = 20,
			only_spawn_below_intensity = 15,
			frequency = {
				15,
				20
			}
		},
		difficulty_overrides = {
			hard = {
				multiple_hordes = 3,
				peak_intensity_threshold = 50,
				horde_frequency = {
					60,
					110
				},
				multiple_horde_frequency = {
					8,
					13
				},
				relax_duration = {
					35,
					45
				}
			},
			harder = {
				multiple_hordes = 3,
				peak_intensity_threshold = 55,
				horde_frequency = {
					50,
					100
				},
				multiple_horde_frequency = {
					8,
					12
				},
				relax_duration = {
					35,
					45
				}
			},
			hardest = {
				multiple_hordes = 3,
				peak_intensity_threshold = 70,
				horde_frequency = {
					50,
					100
				},
				multiple_horde_frequency = {
					7,
					10
				},
				relax_duration = {
					35,
					45
				}
			},
			cataclysm = {
				multiple_hordes = 3,
				peak_intensity_threshold = 80,
				horde_frequency = {
					50,
					100
				},
				multiple_horde_frequency = {
					7,
					10
				},
				relax_duration = {
					35,
					45
				}
			},
			cataclysm_2 = {
				multiple_hordes = 3,
				peak_intensity_threshold = 90,
				horde_frequency = {
					50,
					100
				},
				multiple_horde_frequency = {
					7,
					10
				},
				relax_duration = {
					35,
					45
				}
			},
			cataclysm_3 = {
				multiple_hordes = 3,
				peak_intensity_threshold = 90,
				horde_frequency = {
					50,
					100
				},
				multiple_horde_frequency = {
					7,
					10
				},
				relax_duration = {
					35,
					45
				}
			}
		}
	},
	beastmen = {
		horde_in_relax_if_rushing = false,
		relax_rushing_distance = 70,
		disabled = false,
		peak_fade_threshold = 32.5,
		multiple_hordes = 2,
		peak_intensity_threshold = 45,
		leave_relax_if_rushing = true,
		leave_relax_if_zero_intensity = true,
		sustain_peak_duration = {
			3,
			5
		},
		relax_duration = {
			50,
			70
		},
		horde_frequency = {
			70,
			150
		},
		horde_startup_time = {
			40,
			120
		},
		multiple_horde_frequency = {
			10,
			15
		},
		max_delay_until_next_horde = {
			180,
			210
		},
		horde = HordeSettings.chaos,
		horde_delay = {
			0,
			0
		},
		delay_horde_threat_value = {
			harder = 60,
			hard = 50,
			normal = 40,
			hardest = 60,
			cataclysm = 80,
			cataclysm_3 = 100,
			cataclysm_2 = 100,
			easy = 40
		},
		delay_mini_patrol_threat_value = {
			harder = 50,
			hard = 40,
			normal = 35,
			cataclysm_2 = 100,
			cataclysm = 80,
			cataclysm_3 = 100,
			easy = 35
		},
		delay_specials_threat_value = {
			harder = 60,
			hard = 50,
			normal = 40,
			hardest = 60,
			cataclysm = 1000,
			cataclysm_3 = 1000,
			cataclysm_2 = 1000,
			easy = 40
		},
		mini_patrol = {
			only_spawn_above_intensity = 1,
			override_timer = 20,
			only_spawn_below_intensity = 15,
			frequency = {
				15,
				20
			}
		},
		difficulty_overrides = {
			hard = {
				multiple_hordes = 3,
				peak_intensity_threshold = 50,
				horde_frequency = {
					60,
					110
				},
				multiple_horde_frequency = {
					8,
					13
				},
				relax_duration = {
					35,
					45
				}
			},
			harder = {
				multiple_hordes = 3,
				peak_intensity_threshold = 55,
				horde_frequency = {
					50,
					100
				},
				multiple_horde_frequency = {
					8,
					12
				},
				relax_duration = {
					35,
					45
				}
			},
			hardest = {
				multiple_hordes = 3,
				peak_intensity_threshold = 70,
				horde_frequency = {
					50,
					100
				},
				multiple_horde_frequency = {
					7,
					10
				},
				relax_duration = {
					35,
					45
				}
			},
			cataclysm = {
				multiple_hordes = 3,
				peak_intensity_threshold = 80,
				horde_frequency = {
					50,
					100
				},
				multiple_horde_frequency = {
					10,
					12
				},
				relax_duration = {
					30,
					40
				}
			},
			cataclysm_2 = {
				multiple_hordes = 3,
				peak_intensity_threshold = 90,
				horde_frequency = {
					50,
					100
				},
				multiple_horde_frequency = {
					10,
					12
				},
				relax_duration = {
					30,
					40
				}
			},
			cataclysm_3 = {
				multiple_hordes = 3,
				peak_intensity_threshold = 90,
				horde_frequency = {
					50,
					100
				},
				multiple_horde_frequency = {
					10,
					12
				},
				relax_duration = {
					30,
					40
				}
			}
		}
	},
	intense = {
		peak_intensity_threshold = 80,
		disabled = false,
		peak_fade_threshold = 75,
		sustain_peak_duration = {
			5,
			10
		},
		relax_duration = {
			15,
			25
		},
		horde_frequency = {
			15,
			45
		},
		horde_startup_time = {
			15,
			180
		},
		horde = HordeSettings.default,
		horde_delay = {
			4,
			5
		}
	},
	city_wall = {
		peak_intensity_threshold = 35,
		leave_relax_if_zero_intensity = true,
		horde_in_relax_if_rushing = false,
		leave_relax_if_rushing = true,
		relax_rushing_distance = 70,
		disabled = false,
		peak_fade_threshold = 32.5,
		sustain_peak_duration = {
			3,
			5
		},
		relax_duration = {
			25,
			35
		},
		horde_frequency = {
			120,
			180
		},
		horde_startup_time = {
			15,
			180
		},
		horde = HordeSettings.default,
		horde_delay = {
			0,
			0
		},
		mini_patrol = {
			composition = "city_wall_extra_spice",
			override_timer = 25,
			only_spawn_below_intensity = 65,
			frequency = {
				10,
				15
			}
		}
	},
	disabled = {
		peak_intensity_threshold = 0,
		disabled = true,
		peak_fade_threshold = 75,
		sustain_peak_duration = {
			5,
			10
		},
		relax_duration = {
			10000,
			10000
		},
		horde_frequency = {
			0,
			0
		},
		horde_startup_time = {
			0,
			0
		},
		horde = HordeSettings.disabled,
		horde_delay = {
			4,
			5
		}
	}
}
PackSpawningDistribution = {
	standard = {
		goal_density = 0.45,
		clamp_main_path_zone_area = 100,
		length_density_coefficient = 0,
		spawn_cycle_length = 350,
		clamp_outer_zones_used = 1,
		distribution_method = "periodical",
		calculate_nearby_islands = false
	}
}
PackSpawningSettings = {
	default = {
		area_density_coefficient = 0.045,
		basics = PackSpawningDistribution.standard,
		roaming_set = {
			breed_packs = "standard",
			breed_packs_peeks_overide_chance = {
				0.5,
				0.75
			},
			breed_packs_override = {
				{
					"shield_rats",
					2,
					0.035
				},
				{
					"plague_monks",
					2,
					0.035
				},
				{
					"marauders",
					2,
					0.03
				},
				{
					"marauders_elites",
					2,
					0.03
				}
			}
		},
		difficulty_overrides = {
			hard = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04
					},
					{
						"plague_monks",
						2,
						0.035
					},
					{
						"marauders",
						2,
						0.035
					},
					{
						"marauders_elites",
						2,
						0.035
					}
				}
			},
			harder = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04
					},
					{
						"plague_monks",
						2,
						0.035
					},
					{
						"marauders",
						2,
						0.035
					},
					{
						"marauders_elites",
						2,
						0.035
					}
				}
			},
			hardest = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04
					},
					{
						"plague_monks",
						2,
						0.035
					},
					{
						"marauders",
						2,
						0.035
					},
					{
						"marauders_elites",
						2,
						0.035
					}
				}
			},
			cataclysm = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04
					},
					{
						"plague_monks",
						2,
						0.04
					},
					{
						"marauders",
						2,
						0.04
					},
					{
						"marauders_elites",
						2,
						0.04
					}
				}
			},
			cataclysm_2 = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04
					},
					{
						"plague_monks",
						2,
						0.04
					},
					{
						"marauders",
						2,
						0.04
					},
					{
						"marauders_elites",
						2,
						0.04
					}
				}
			},
			cataclysm_3 = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.045
					},
					{
						"plague_monks",
						2,
						0.045
					},
					{
						"marauders",
						2,
						0.045
					},
					{
						"marauders_elites",
						2,
						0.045
					}
				}
			}
		}
	},
	skaven_beastmen = {
		area_density_coefficient = 0.045,
		basics = PackSpawningDistribution.standard,
		roaming_set = {
			breed_packs = "skaven_beastmen",
			breed_packs_peeks_overide_chance = {
				0.5,
				0.75
			},
			breed_packs_override = {
				{
					"shield_rats",
					2,
					0.035
				},
				{
					"plague_monks",
					2,
					0.035
				},
				{
					"beastmen",
					2,
					0.035
				},
				{
					"beastmen_elites",
					2,
					0.035
				}
			}
		},
		difficulty_overrides = {
			hard = {
				area_density_coefficient = 0.04,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04
					},
					{
						"plague_monks",
						2,
						0.035
					},
					{
						"beastmen",
						2,
						0.035
					},
					{
						"beastmen_elites",
						2,
						0.035
					}
				}
			},
			harder = {
				area_density_coefficient = 0.04,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04
					},
					{
						"plague_monks",
						2,
						0.035
					},
					{
						"beastmen",
						2,
						0.035
					},
					{
						"beastmen_elites",
						2,
						0.035
					}
				}
			},
			hardest = {
				area_density_coefficient = 0.04,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04
					},
					{
						"plague_monks",
						2,
						0.035
					},
					{
						"beastmen",
						2,
						0.035
					},
					{
						"beastmen_elites",
						2,
						0.035
					}
				}
			},
			cataclysm = {
				area_density_coefficient = 0.04,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04
					},
					{
						"plague_monks",
						2,
						0.04
					},
					{
						"beastmen",
						2,
						0.04
					},
					{
						"beastmen_elites",
						2,
						0.04
					}
				}
			},
			cataclysm_2 = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04
					},
					{
						"plague_monks",
						2,
						0.04
					},
					{
						"beastmen",
						2,
						0.04
					},
					{
						"beastmen_elites",
						2,
						0.04
					}
				}
			},
			cataclysm_3 = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.045
					},
					{
						"plague_monks",
						2,
						0.045
					},
					{
						"beastmen",
						2,
						0.045
					},
					{
						"beastmen_elites",
						2,
						0.045
					}
				}
			}
		}
	},
	chaos_beastmen = {
		area_density_coefficient = 0.045,
		basics = PackSpawningDistribution.standard,
		roaming_set = {
			breed_packs = "chaos_beastmen",
			breed_packs_peeks_overide_chance = {
				0.5,
				0.75
			},
			breed_packs_override = {
				{
					"marauders",
					2,
					0.03
				},
				{
					"marauders_elites",
					2,
					0.03
				},
				{
					"beastmen",
					2,
					0.035
				},
				{
					"beastmen_elites",
					2,
					0.035
				}
			}
		},
		difficulty_overrides = {
			hard = {
				area_density_coefficient = 0.04,
				breed_packs_override = {
					{
						"marauders",
						2,
						0.03
					},
					{
						"marauders_elites",
						2,
						0.03
					},
					{
						"beastmen",
						2,
						0.035
					},
					{
						"beastmen_elites",
						2,
						0.035
					}
				}
			},
			harder = {
				area_density_coefficient = 0.04,
				breed_packs_override = {
					{
						"marauders",
						2,
						0.035
					},
					{
						"marauders_elites",
						2,
						0.035
					},
					{
						"beastmen",
						2,
						0.035
					},
					{
						"beastmen_elites",
						2,
						0.035
					}
				}
			},
			hardest = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"marauders",
						2,
						0.035
					},
					{
						"marauders_elites",
						2,
						0.035
					},
					{
						"beastmen",
						2,
						0.035
					},
					{
						"beastmen_elites",
						2,
						0.035
					}
				}
			},
			cataclysm = {
				area_density_coefficient = 0.04,
				breed_packs_override = {
					{
						"marauders",
						2,
						0.04
					},
					{
						"marauders_elites",
						2,
						0.04
					},
					{
						"beastmen",
						2,
						0.04
					},
					{
						"beastmen_elites",
						2,
						0.04
					}
				}
			},
			cataclysm_2 = {
				area_density_coefficient = 0.04,
				breed_packs_override = {
					{
						"marauders",
						2,
						0.04
					},
					{
						"marauders_elites",
						2,
						0.04
					},
					{
						"beastmen",
						2,
						0.04
					},
					{
						"beastmen_elites",
						2,
						0.04
					}
				}
			},
			cataclysm_3 = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"marauders",
						2,
						0.045
					},
					{
						"marauders_elites",
						2,
						0.045
					},
					{
						"beastmen",
						2,
						0.045
					},
					{
						"beastmen_elites",
						2,
						0.045
					}
				}
			}
		}
	},
	default_light = {
		area_density_coefficient = 0.045,
		basics = PackSpawningDistribution.standard,
		roaming_set = {
			breed_packs = "standard_no_elites",
			breed_packs_peeks_overide_chance = {
				0.5,
				0.75
			},
			breed_packs_override = {
				{
					"plague_monks",
					2,
					0.035
				},
				{
					"marauders",
					2,
					0.035
				},
				{
					"marauders_elites",
					2,
					0.035
				}
			}
		}
	},
	skaven = {
		area_density_coefficient = 0.045,
		basics = PackSpawningDistribution.standard,
		roaming_set = {
			breed_packs = "skaven",
			breed_packs_peeks_overide_chance = {
				0.5,
				1
			},
			breed_packs_override = {
				{
					"shield_rats",
					2,
					0.035
				},
				{
					"plague_monks",
					2,
					0.03
				}
			}
		},
		difficulty_overrides = {
			hard = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04
					},
					{
						"plague_monks",
						2,
						0.035
					}
				}
			},
			harder = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04
					},
					{
						"plague_monks",
						2,
						0.035
					}
				}
			},
			hardest = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04
					},
					{
						"plague_monks",
						2,
						0.035
					}
				}
			},
			cataclysm = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04
					},
					{
						"plague_monks",
						2,
						0.035
					}
				}
			},
			cataclysm_2 = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04
					},
					{
						"plague_monks",
						2,
						0.035
					}
				}
			},
			cataclysm_3 = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04
					},
					{
						"plague_monks",
						2,
						0.035
					}
				}
			}
		}
	},
	skaven_light = {
		area_density_coefficient = 0.045,
		basics = PackSpawningDistribution.standard,
		roaming_set = {
			breed_packs = "shield_rats_no_elites",
			breed_packs_peeks_overide_chance = {
				0.5,
				1
			},
			breed_packs_override = {
				{
					"shield_rats_no_elites",
					2,
					0.035
				},
				{
					"plague_monks",
					2,
					0.03
				}
			}
		},
		difficulty_overrides = {
			hard = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04
					},
					{
						"plague_monks",
						2,
						0.035
					}
				}
			},
			harder = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04
					},
					{
						"plague_monks",
						2,
						0.035
					}
				}
			},
			hardest = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04
					},
					{
						"plague_monks",
						2,
						0.035
					}
				}
			},
			cataclysm = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04
					},
					{
						"plague_monks",
						2,
						0.035
					}
				}
			},
			cataclysm_2 = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04
					},
					{
						"plague_monks",
						2,
						0.035
					}
				}
			},
			cataclysm_3 = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"shield_rats",
						2,
						0.04
					},
					{
						"plague_monks",
						2,
						0.035
					}
				}
			}
		}
	},
	chaos = {
		area_density_coefficient = 0.035,
		basics = PackSpawningDistribution.standard,
		roaming_set = {
			breed_packs = "marauders",
			breed_packs_peeks_overide_chance = {
				0.5,
				1
			},
			breed_packs_override = {
				{
					"marauders_and_warriors",
					2,
					0.03
				},
				{
					"marauders_shields",
					2,
					0.03
				},
				{
					"marauders_elites",
					2,
					0.03
				},
				{
					"marauders_berzerkers",
					2,
					0.03
				}
			}
		},
		difficulty_overrides = {
			hard = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"marauders_and_warriors",
						2,
						0.035
					},
					{
						"marauders_shields",
						2,
						0.035
					},
					{
						"marauders_elites",
						2,
						0.035
					},
					{
						"marauders_berzerkers",
						2,
						0.035
					}
				}
			},
			harder = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"marauders_and_warriors",
						2,
						0.035
					},
					{
						"marauders_shields",
						2,
						0.035
					},
					{
						"marauders_elites",
						2,
						0.035
					},
					{
						"marauders_berzerkers",
						2,
						0.035
					}
				}
			},
			hardest = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"marauders_and_warriors",
						2,
						0.035
					},
					{
						"marauders_shields",
						2,
						0.035
					},
					{
						"marauders_elites",
						2,
						0.035
					},
					{
						"marauders_berzerkers",
						2,
						0.035
					}
				}
			},
			cataclysm = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"marauders_and_warriors",
						2,
						0.035
					},
					{
						"marauders_shields",
						2,
						0.035
					},
					{
						"marauders_elites",
						2,
						0.035
					},
					{
						"marauders_berzerkers",
						2,
						0.035
					}
				}
			},
			cataclysm_2 = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"marauders_and_warriors",
						2,
						0.035
					},
					{
						"marauders_shields",
						2,
						0.035
					},
					{
						"marauders_elites",
						2,
						0.035
					},
					{
						"marauders_berzerkers",
						2,
						0.035
					}
				}
			},
			cataclysm_3 = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"marauders_and_warriors",
						2,
						0.035
					},
					{
						"marauders_shields",
						2,
						0.035
					},
					{
						"marauders_elites",
						2,
						0.035
					},
					{
						"marauders_berzerkers",
						2,
						0.035
					}
				}
			}
		}
	},
	chaos_light = {
		area_density_coefficient = 0.03,
		basics = PackSpawningDistribution.standard,
		roaming_set = {
			breed_packs = "marauders",
			breed_packs_peeks_overide_chance = {
				0.94,
				1
			},
			breed_packs_override = {
				{
					"marauders",
					1,
					0.03
				},
				{
					"marauders_shields",
					2,
					0.025
				},
				{
					"marauders_elites",
					2,
					0.025
				},
				{
					"marauders_berzerkers",
					2,
					0.03
				}
			}
		}
	},
	beastmen = {
		area_density_coefficient = 0.045,
		basics = PackSpawningDistribution.standard,
		roaming_set = {
			breed_packs = "beastmen",
			breed_packs_peeks_overide_chance = {
				0.5,
				0.75
			},
			breed_packs_override = {
				{
					"beastmen_elites",
					2,
					0.035
				},
				{
					"beastmen",
					2,
					0.035
				},
				{
					"beastmen_light",
					2,
					0.04
				}
			}
		},
		difficulty_overrides = {
			hard = {
				area_density_coefficient = 0.04,
				breed_packs_override = {
					{
						"beastmen_elites",
						2,
						0.035
					},
					{
						"beastmen",
						2,
						0.035
					},
					{
						"beastmen_light",
						2,
						0.04
					}
				}
			},
			harder = {
				area_density_coefficient = 0.04,
				breed_packs_override = {
					{
						"beastmen_elites",
						2,
						0.035
					},
					{
						"beastmen",
						2,
						0.035
					},
					{
						"beastmen_light",
						2,
						0.04
					}
				}
			},
			hardest = {
				area_density_coefficient = 0.04,
				breed_packs_override = {
					{
						"beastmen_elites",
						2,
						0.035
					},
					{
						"beastmen",
						2,
						0.035
					},
					{
						"beastmen_light",
						2,
						0.04
					}
				}
			},
			cataclysm = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"beastmen_elites",
						2,
						0.04
					},
					{
						"beastmen",
						2,
						0.04
					},
					{
						"beastmen_light",
						2,
						0.045
					}
				}
			},
			cataclysm_2 = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"beastmen_elites",
						2,
						0.04
					},
					{
						"beastmen",
						2,
						0.04
					},
					{
						"beastmen_light",
						2,
						0.045
					}
				}
			},
			cataclysm_3 = {
				area_density_coefficient = 0.045,
				breed_packs_override = {
					{
						"beastmen_elites",
						2,
						0.045
					},
					{
						"beastmen",
						2,
						0.045
					},
					{
						"beastmen_light",
						2,
						0.045
					}
				}
			}
		}
	},
	beastmen_light = {
		area_density_coefficient = 0.045,
		basics = PackSpawningDistribution.standard,
		roaming_set = {
			breed_packs = "beastmen",
			breed_packs_peeks_overide_chance = {
				0.5,
				1
			},
			breed_packs_override = {
				{
					"beastmen_light",
					2,
					0.04
				}
			}
		}
	},
	code_test = {
		area_density_coefficient = 0.03,
		basics = PackSpawningDistribution.standard,
		roaming_set = {
			breed_packs = "code_test",
			breed_packs_peeks_overide_chance = {
				0,
				1
			},
			breed_packs_override = {
				{
					"marauders",
					1,
					0.03
				},
				{
					"marauders_shields",
					2,
					0.025
				},
				{
					"marauders_elites",
					2,
					0.025
				},
				{
					"marauders_berzerkers",
					2,
					0.03
				}
			}
		}
	},
	disabled = {
		area_density_coefficient = 0.03,
		disabled = true,
		basics = PackSpawningDistribution.standard,
		roaming_set = {}
	}
}
DefaultConflictDirectorSet = {
	"skaven",
	"chaos",
	"beastmen",
	"skaven_beastmen",
	"chaos_beastmen",
	"default"
}
ConflictDirectorLockedFunctions = {
	beastmen = function (level_key)
		if DEDICATED_SERVER then
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
	end
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
		horde = HordeSettings.default
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
		horde = HordeSettings.default
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
		horde = HordeSettings.default
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
		horde = HordeSettings.default
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
		horde = HordeSettings.chaos
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
		horde = HordeSettings.chaos
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
		horde = HordeSettings.chaos
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
		horde = HordeSettings.beastmen
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
		horde = HordeSettings.beastmen
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
		horde = HordeSettings.beastmen
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
		horde = HordeSettings.beastmen
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
		horde = HordeSettings.disabled
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
		horde = HordeSettings.default
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
		horde = HordeSettings.default
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
		horde = HordeSettings.default
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
		horde = HordeSettings.disabled
	},
	gdc_build = {
		debug_color = "maroon",
		disabled = false,
		intensity = IntensitySettings.default,
		pacing = PacingSettings.default,
		boss = BossSettings.gdc_build,
		specials = SpecialsSettings.gdc_build,
		roaming = RoamingSettings.default,
		pack_spawning = PackSpawningSettings.default,
		horde = HordeSettings.default
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
		horde = HordeSettings.default
	},
	survival = {
		debug_color = "maroon",
		disabled = false,
		intensity = IntensitySettings.default,
		pacing = PacingSettings.disabled,
		boss = BossSettings.disabled,
		specials = SpecialsSettings.survival,
		roaming = RoamingSettings.disabled,
		pack_spawning = PackSpawningSettings.default,
		horde = HordeSettings.default
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
		horde = HordeSettings.disabled
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
		horde = HordeSettings.default
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
		horde = HordeSettings.default
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
		horde = HordeSettings.challenge_level
	},
	inn_level = {
		disabled = false,
		intensity = IntensitySettings.disabled,
		pacing = PacingSettings.disabled,
		boss = BossSettings.disabled,
		specials = SpecialsSettings.disabled,
		roaming = RoamingSettings.disabled,
		pack_spawning = PackSpawningSettings.disabled,
		horde = HordeSettings.disabled
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
		horde = HordeSettings.disabled
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
		horde = HordeSettings.disabled
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
		horde = HordeSettings.disabled
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
		horde = HordeSettings.disabled
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
		horde = HordeSettings.disabled
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
		horde = HordeSettings.disabled
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
		horde = HordeSettings.disabled
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
		horde = HordeSettings.disabled
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
		horde = HordeSettings.disabled
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
		horde = HordeSettings.disabled
	}
}
local difficulties = Difficulties
local start_time = os.clock()
local ConflictUtils_find_conflict_director_breeds = ConflictUtils.find_conflict_director_breeds

for conflict_director_name, data in pairs(ConflictDirectors) do
	data.name = conflict_director_name
	data.contained_breeds = {}

	for i = 1, #difficulties, 1 do
		local difficulty = difficulties[i]
		local difficulty_breeds = {}

		ConflictUtils_find_conflict_director_breeds(data, difficulty, difficulty_breeds)

		data.contained_breeds[difficulty] = difficulty_breeds
	end
end

print("[ConflictSettings] Contained breeds generated in:", os.clock() - start_time)

RecycleSettings = {
	destroy_stuck_distance_squared = 625,
	destroy_los_distance_squared = 8100,
	push_horde_in_time = true,
	destroy_no_path_only_behind = true,
	ai_stuck_check_start_time = 10,
	push_horde_if_num_alive_grunts_above = 60,
	destroy_no_path_found_time = 10,
	max_grunts = 90
}
CurrentConflictSettings = CurrentConflictSettings or false
CurrentIntensitySettings = CurrentIntensitySettings or false
CurrentPacing = CurrentPacing or false
CurrentBossSettings = CurrentBossSettings or false
CurrentSpecialsSettings = CurrentSpecialsSettings or false
CurrentHordeSettings = CurrentHordeSettings or false
CurrentRoamingSettings = CurrentRoamingSettings or false
CurrentPackSpawningSettings = CurrentPackSpawningSettings or false
local crash = false

for name, horde_setting in pairs(HordeSettings) do
	local compositions = horde_setting.compositions
	horde_setting.name = name

	for event_name, elements in pairs(TerrorEventBlueprints) do
		for i = 1, #elements, 1 do
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
			for i = 1, #breed_packs_override, 1 do
				weights[i] = breed_packs_override[i][2]
			end

			roaming_set.breed_packs_override_loaded_dice = {
				LoadedDice.create(weights)
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

DebugBreedSpawns = {}
local category_lookup = {}

for breed_name, breed in pairs(Breeds) do
	local category_name = breed.debug_spawn_category or (breed.boss and "Boss") or (breed.special and "Specials") or "Roaming"
	local category = category_lookup[category_name]

	if not category then
		local index = #DebugBreedSpawns + 1
		category = {
			name = category_name
		}
		DebugBreedSpawns[index] = category
		category_lookup[category_name] = category
	end

	category[#category + 1] = {
		breed_name
	}
end

local function sort_category_alphabetically_func(a, b)
	return a.name < b.name
end

table.sort(DebugBreedSpawns, sort_category_alphabetically_func)

local function sort_breed_alphabetically_func(a, b)
	return a[1] < b[1]
end

for k, category in ipairs(DebugBreedSpawns) do
	table.sort(category, sort_breed_alphabetically_func)
end

DebugBreedSpawns[#DebugBreedSpawns + 1] = {
	{
		"Everything",
		"debug_spawn_all_breeds",
		{
			skaven_dummy_clan_rat = true,
			chaos_dummy_sorcerer = true,
			chaos_exalted_sorcerer = true,
			skaven_dummy_slave = true,
			chaos_exalted_champion_warcamp = true,
			skaven_storm_vermin_warlord = true,
			chaos_plague_wave_spawner = true,
			chaos_plague_sorcerer = true,
			chaos_exalted_champion_norsca = true,
			skaven_storm_vermin_champion = true,
			chaos_tentacle = true,
			chaos_mutator_sorcerer = true,
			chaos_spawn_exalted_champion_norsca = true,
			skaven_stormfiend_demo = true,
			chaos_dummy_troll = true,
			skaven_grey_seer = true,
			chaos_tentacle_sorcerer = true,
			chaos_zombie = true,
			chaos_exalted_sorcerer_drachenfels = true,
			skaven_stormfiend_boss = true,
			chaos_vortex = true
		}
	},
	{
		"Dummies",
		"debug_spawn_all_breeds",
		{
			chaos_dummy_sorcerer = true,
			chaos_dummy_troll = true,
			skaven_dummy_clan_rat = true,
			skaven_dummy_slave = true
		},
		"spawn_the_list_above"
	},
	name = "Events"
}
local list = {
	name = "Patrols"
}

for formation_name, data in pairs(PatrolFormationSettings) do
	if type(data) == "table" and data.normal then
		list[#list + 1] = {
			formation_name,
			"aim_patrol_spawning",
			formation_name
		}
	end
end

DebugBreedSpawns[#DebugBreedSpawns + 1] = list

return

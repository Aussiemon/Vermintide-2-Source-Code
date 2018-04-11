require("scripts/settings/horde_compositions")
require("scripts/settings/horde_compositions_pacing")

HordeSettingsBasics = {
	ambush = {
		max_size,
		max_horde_spawner_dist = 35,
		max_spawners = 15,
		min_hidden_spawner_dist = 10,
		start_delay = 3.45,
		max_hidden_spawner_dist = 20,
		min_horde_spawner_dist = 1
	},
	vector = {
		max_size,
		max_horde_spawner_dist = 15,
		min_hidden_spawner_dist = 0,
		main_path_dist_from_players = 30,
		start_delay = 8,
		max_spawners = 6,
		max_hidden_spawner_dist = 20,
		main_path_chance_spawning_ahead = 0.67,
		min_horde_spawner_dist = 0
	},
	vector_blob = {
		max_size,
		start_delay = 1,
		main_path_chance_spawning_ahead = 0.67,
		main_path_dist_from_players = 60
	}
}
HordeSettings = {
	default = {
		vector_composition = "medium",
		chance_of_vector = 0.5,
		ambush_composition = "medium",
		mini_patrol_composition = "mini_patrol",
		chance_of_vector_blob = 0.5,
		vector_blob_composition = "medium",
		disabled = false,
		mix_paced_hordes = true,
		compositions = HordeCompositions,
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
			}
		}
	},
	default_light = {
		vector_composition = "medium",
		chance_of_vector = 0.5,
		ambush_composition = "medium",
		mini_patrol_composition = "mini_patrol",
		chance_of_vector_blob = 0.5,
		vector_blob_composition = "medium",
		disabled = false,
		mix_paced_hordes = true,
		compositions = HordeCompositions,
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
			}
		}
	},
	chaos = {
		vector_composition = "chaos_medium",
		chance_of_vector = 1,
		ambush_composition = "chaos_medium",
		mini_patrol_composition = "chaos_mini_patrol",
		chance_of_vector_blob = 0.75,
		vector_blob_composition = "chaos_medium",
		disabled = false,
		mix_paced_hordes = true,
		compositions = HordeCompositions,
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
			}
		}
	},
	chaos_light = {
		vector_composition = "chaos_medium",
		chance_of_vector = 1,
		ambush_composition = "chaos_medium",
		chance_of_vector_blob = 0.75,
		vector_blob_composition = "chaos_medium",
		disabled = false,
		mix_paced_hordes = true,
		compositions = HordeCompositions,
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

	if setting.compositions then
		for size, composition in pairs(setting.compositions) do
			table.clear_array(weights, #weights)

			for i, variant in ipairs(composition) do
				weights[i] = variant.weight
				local breeds = variant.breeds

				for j = 1, #breeds, 2 do
					local breed_name = breeds[j]
					local breed = Breeds[breed_name]

					if not breed then
						print(string.format("Bad or non-existing breed called: '%s' defined in ConflictSettings -> HordeSettings.", tostring(breed_name)))
					elseif not breed.can_use_horde_spawners then
						variant.must_use_hidden_spawners = true
						crash = true
					end
				end
			end

			composition.loaded_probs = {
				LoadedDice.create(weights)
			}
		end
	end
end

if crash then
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
		despawn_path_distance = 60,
		despawn_distance_z = 30,
		disabled = false
	},
	disabled = {
		despawn_distance = 45,
		despawn_path_distance = 60,
		despawn_distance_z = 30,
		disabled = true
	},
	gdc_build = {
		despawn_distance = 45,
		despawn_path_distance = 60,
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
			"chaos_vortex_sorcerer",
			"chaos_corruptor_sorcerer",
			"chaos_corruptor_sorcerer",
			"skaven_warpfire_thrower"
		},
		methods = {
			specials_by_slots = {
				max_of_same = 2,
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
		outside_navmesh_intervention = {
			delay_between_interventions = 10,
			needed_ordinary_enemy_aggro = 5,
			disabled = true,
			needed_special_enemy_aggro = 1,
			intervention_time = 5,
			breeds = {
				"skaven_ratling_gunner",
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
				"skaven_pack_master",
				"skaven_gutter_runner",
				"skaven_ratling_gunner"
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
		outside_navmesh_intervention = {
			delay_between_interventions = 10,
			needed_ordinary_enemy_aggro = 5,
			disabled = true,
			needed_special_enemy_aggro = 1,
			intervention_time = 5,
			breeds = {
				"skaven_ratling_gunner",
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
		outside_navmesh_intervention = {
			delay_between_interventions = 10,
			needed_ordinary_enemy_aggro = 5,
			disabled = true,
			needed_special_enemy_aggro = 1,
			intervention_time = 5,
			breeds = {
				"skaven_ratling_gunner",
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
		outside_navmesh_intervention = {
			delay_between_interventions = 10,
			needed_ordinary_enemy_aggro = 5,
			disabled = true,
			needed_special_enemy_aggro = 1,
			intervention_time = 5,
			breeds = {
				"skaven_ratling_gunner",
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
		outside_navmesh_intervention = {
			delay_between_interventions = 10,
			needed_ordinary_enemy_aggro = 5,
			disabled = true,
			needed_special_enemy_aggro = 1,
			intervention_time = 5,
			breeds = {
				"skaven_ratling_gunner",
				"skaven_poison_wind_globadier"
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
		outside_navmesh_intervention = {
			delay_between_interventions = 8,
			needed_ordinary_enemy_aggro = 5,
			disabled = true,
			needed_special_enemy_aggro = 1,
			intervention_time = 3,
			breeds = {
				"skaven_ratling_gunner",
				"skaven_poison_wind_globadier"
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
	disabled = {
		disabled = true,
		rush_intervention = {},
		outside_navmesh_intervention = {}
	}
}
BossSettings = {
	default = {
		disabled = false,
		boss_events = {
			safe_dist = 150,
			recurring_distance = 300,
			name = "boss_events",
			chance_of_encampment = 0,
			terror_events_using_packs = false,
			padding_dist = 100,
			debug_color = "deep_sky_blue",
			hand_placed_padding_dist = 10,
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
					"boss_event_storm_vermin_patrol"
				}
			},
			spline_patrol_events = {
				"boss_event_spline_patrol"
			},
			max_events_of_this_kind = {
				event_boss = 2
			}
		},
		rare_events = {
			safe_dist = 50,
			recurring_distance = 1500,
			name = "rare_events",
			debug_color = "deep_pink",
			padding_dist = 100,
			events = {
				"event_boss"
			},
			event_lookup = {
				event_boss = {
					"rare_event_loot_rat"
				}
			},
			max_events_of_this_kind = {}
		}
	},
	default_light = {
		disabled = false,
		boss_events = {
			safe_dist = 150,
			recurring_distance = 300,
			name = "boss_events",
			chance_of_encampment = 0,
			terror_events_using_packs = false,
			padding_dist = 100,
			debug_color = "deep_sky_blue",
			hand_placed_padding_dist = 10,
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
					"boss_event_storm_vermin_patrol"
				}
			},
			spline_patrol_events = {
				"boss_event_spline_patrol"
			},
			max_events_of_this_kind = {
				event_boss = 2
			}
		},
		rare_events = {
			safe_dist = 50,
			recurring_distance = 1500,
			name = "rare_events",
			debug_color = "deep_pink",
			padding_dist = 100,
			events = {
				"event_boss"
			},
			event_lookup = {
				event_boss = {
					"rare_event_loot_rat"
				}
			},
			max_events_of_this_kind = {}
		}
	},
	skaven = {
		disabled = false,
		boss_events = {
			safe_dist = 150,
			recurring_distance = 300,
			name = "boss_events",
			chance_of_encampment = 0,
			terror_events_using_packs = false,
			padding_dist = 100,
			debug_color = "deep_sky_blue",
			hand_placed_padding_dist = 10,
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
					"boss_event_storm_vermin_patrol"
				}
			},
			spline_patrol_events = {
				"boss_event_skaven_spline_patrol"
			},
			max_events_of_this_kind = {
				event_boss = 2
			}
		},
		rare_events = {
			safe_dist = 50,
			recurring_distance = 1500,
			name = "rare_events",
			debug_color = "deep_pink",
			padding_dist = 100,
			events = {
				"event_boss"
			},
			event_lookup = {
				event_boss = {
					"rare_event_loot_rat"
				}
			},
			max_events_of_this_kind = {}
		}
	},
	skaven_light = {
		disabled = false,
		boss_events = {
			safe_dist = 150,
			recurring_distance = 300,
			name = "boss_events",
			chance_of_encampment = 0,
			terror_events_using_packs = false,
			padding_dist = 100,
			debug_color = "deep_sky_blue",
			hand_placed_padding_dist = 10,
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
					"boss_event_storm_vermin_patrol"
				}
			},
			spline_patrol_events = {
				"boss_event_skaven_spline_patrol"
			},
			max_events_of_this_kind = {
				event_boss = 2
			}
		},
		rare_events = {
			safe_dist = 50,
			recurring_distance = 1500,
			name = "rare_events",
			debug_color = "deep_pink",
			padding_dist = 100,
			events = {
				"event_boss"
			},
			event_lookup = {
				event_boss = {
					"rare_event_loot_rat"
				}
			},
			max_events_of_this_kind = {}
		}
	},
	chaos = {
		disabled = false,
		boss_events = {
			safe_dist = 150,
			recurring_distance = 300,
			name = "boss_events",
			chance_of_encampment = 0,
			terror_events_using_packs = false,
			padding_dist = 100,
			debug_color = "deep_sky_blue",
			hand_placed_padding_dist = 10,
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
					"boss_event_storm_vermin_patrol"
				}
			},
			spline_patrol_events = {
				"boss_event_chaos_spline_patrol"
			},
			max_events_of_this_kind = {
				event_boss = 2
			}
		},
		rare_events = {
			safe_dist = 50,
			recurring_distance = 1500,
			name = "rare_events",
			debug_color = "deep_pink",
			padding_dist = 100,
			events = {
				"event_boss"
			},
			event_lookup = {
				event_boss = {
					"rare_event_loot_rat"
				}
			},
			max_events_of_this_kind = {}
		}
	},
	chaos_light = {
		disabled = true,
		boss_events = {
			safe_dist = 150,
			recurring_distance = 300,
			name = "boss_events",
			chance_of_encampment = 0,
			terror_events_using_packs = false,
			padding_dist = 100,
			debug_color = "deep_sky_blue",
			hand_placed_padding_dist = 10,
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
					"boss_event_storm_vermin_patrol"
				}
			},
			spline_patrol_events = {
				"boss_event_spline_patrol"
			},
			max_events_of_this_kind = {
				event_boss = 2
			}
		},
		rare_events = {
			safe_dist = 50,
			recurring_distance = 1500,
			name = "rare_events",
			debug_color = "deep_pink",
			padding_dist = 100,
			events = {
				"event_boss"
			},
			event_lookup = {
				event_boss = {
					"rare_event_loot_rat"
				}
			},
			max_events_of_this_kind = {}
		}
	},
	gdc_build = {
		disabled = false,
		boss_events = {
			safe_dist = 150,
			recurring_distance = 300,
			name = "boss_events",
			debug_color = "deep_sky_blue",
			events = {
				"nothing"
			}
		},
		rare_events = {
			safe_dist = 50,
			recurring_distance = 1500,
			name = "rare_events",
			debug_color = "deep_pink",
			events = {}
		}
	},
	disabled = {
		safe_distance = 100,
		disabled = true
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
				decay_per_second = 3
			},
			harder = {
				decay_per_second = 3
			},
			hardest = {
				decay_per_second = 5
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
local difficulty_overrides = IntensitySettings.default.difficulty_overrides

for difficulty_name, settings in pairs(DifficultySettings) do
	difficulty_overrides[difficulty_name] = settings.intensity_overrides
end

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
			harder = 70,
			hard = 60,
			normal = 40,
			easy = 40
		},
		delay_mini_patrol_threat_value = {
			harder = 50,
			hard = 40,
			normal = 35,
			easy = 35
		},
		delay_specials_threat_value = {
			harder = 70,
			hard = 60,
			normal = 40,
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
			harder = 70,
			hard = 60,
			normal = 40,
			easy = 40
		},
		delay_mini_patrol_threat_value = {
			harder = 50,
			hard = 40,
			normal = 35,
			easy = 35
		},
		delay_specials_threat_value = {
			harder = 70,
			hard = 60,
			normal = 40,
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
					"shield_rats_no_elites",
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
					0.03
				},
				{
					"marauders_elites",
					2,
					0.03
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
					1,
					0.03
				}
			}
		}
	},
	skaven_light = {
		area_density_coefficient = 0.045,
		basics = PackSpawningDistribution.standard,
		roaming_set = {
			breed_packs = "skaven_no_elites",
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
					1,
					0.03
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
local difficulty_overrides = PacingSettings.default.difficulty_overrides

for difficulty_name, settings in pairs(DifficultySettings) do
	difficulty_overrides[difficulty_name] = settings.pacing_overrides
end

ConflictDirectorSets = {
	random = {
		pick_random = {
			"chaos",
			5,
			"skaven",
			5
		}
	},
	mostly_chaos = {
		pick_random = {
			"chaos",
			10,
			"skaven",
			2
		}
	},
	mostly_skaven = {
		pick_random = {
			"chaos",
			2,
			"skaven",
			10
		}
	},
	mixed_skaven_and_chaos = {
		pick_random = {
			"chaos",
			5,
			"skaven",
			5
		}
	}
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
		pack_spawning = PackSpawningSettings.default_light,
		horde = HordeSettings.default_light
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
		horde = HordeSettings.default_light
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
		horde = HordeSettings.chaos_light
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
	level_editor = {
		disabled = true,
		intensity = IntensitySettings.disabled,
		pacing = PacingSettings.disabled,
		boss = BossSettings.disabled,
		specials = SpecialsSettings.disabled,
		roaming = RoamingSettings.disabled,
		horde = HordeSettings.disabled
	},
	event_level = {
		disabled = false,
		intensity = IntensitySettings.default,
		pacing = PacingSettings.disabled,
		boss = BossSettings.disabled,
		specials = SpecialsSettings.default,
		roaming = RoamingSettings.disabled
	},
	event_level_with_roaming = {
		disabled = false,
		intensity = IntensitySettings.default,
		pacing = PacingSettings.disabled,
		boss = BossSettings.disabled,
		specials = SpecialsSettings.default,
		roaming = RoamingSettings.default,
		pack_spawning = PackSpawningSettings.default,
		horde = HordeSettings.default
	},
	event_level_with_roaming_no_specials = {
		disabled = false,
		intensity = IntensitySettings.default,
		pacing = PacingSettings.disabled,
		boss = BossSettings.disabled,
		specials = SpecialsSettings.disabled,
		roaming = RoamingSettings.default,
		pack_spawning = PackSpawningSettings.default,
		horde = HordeSettings.default
	},
	event_level_with_roaming_less_roamers = {
		disabled = false,
		intensity = IntensitySettings.default,
		pacing = PacingSettings.disabled,
		boss = BossSettings.disabled,
		specials = SpecialsSettings.default,
		roaming = RoamingSettings.default,
		pack_spawning = PackSpawningSettings.default,
		horde = HordeSettings.default
	},
	city_wall = {
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
		disabled = true,
		intensity = IntensitySettings.disabled,
		pacing = PacingSettings.disabled,
		boss = BossSettings.disabled,
		specials = SpecialsSettings.disabled,
		roaming = RoamingSettings.disabled,
		pack_spawning = PackSpawningSettings.disabled,
		horde = HordeSettings.disabled
	},
	victor = {
		disabled = false,
		intensity = IntensitySettings.default,
		pacing = PacingSettings.default,
		boss = BossSettings.default,
		specials = SpecialsSettings.victor,
		roaming = RoamingSettings.victor,
		horde = HordeSettings.default
	},
	gdc_build = {
		disabled = false,
		intensity = IntensitySettings.default,
		pacing = PacingSettings.default,
		boss = BossSettings.gdc_build,
		specials = SpecialsSettings.gdc_build,
		roaming = RoamingSettings.default,
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
		disabled = false,
		intensity = IntensitySettings.default,
		pacing = PacingSettings.disabled,
		boss = BossSettings.disabled,
		specials = SpecialsSettings.survival,
		roaming = RoamingSettings.disabled,
		horde = HordeSettings.default
	},
	dlc_portals = {
		disabled = false,
		intensity = IntensitySettings.default,
		pacing = PacingSettings.default,
		boss = BossSettings.disabled,
		specials = SpecialsSettings.default,
		roaming = RoamingSettings.default,
		horde = HordeSettings.default
	},
	tutorial = {
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
	}
}

for conflict_director_name, data in pairs(ConflictDirectors) do
	data.name = conflict_director_name
end

for name, director_set in pairs(ConflictDirectorSets) do
	local pick_random = director_set.pick_random

	if pick_random then
		director_set.loaded_easy_dice = LoadedDice.create_from_mixed(pick_random, false)
	end
end

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
				print(string.format("Bad or misspelled composition_type '%s' in event '%s', element number %d", tostring(element.composition_type), event_name, i))

				crash = true
			end
		end
	end
end

if crash then
	assert(false, "Found errors in TerrorEventBlueprints, as shown here --^")
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
			skaven_storm_vermin_champion = true,
			chaos_dummy_sorcerer = true,
			chaos_exalted_champion_warcamp = true,
			chaos_exalted_sorcerer = true,
			skaven_storm_vermin_warlord = true,
			skaven_dummy_clan_rat = true,
			chaos_plague_sorcerer = true,
			skaven_dummy_slave = true,
			chaos_exalted_champion_norsca = true,
			chaos_tentacle = true,
			chaos_spawn_exalted_champion_norsca = true,
			skaven_stormfiend_demo = true,
			chaos_dummy_troll = true,
			skaven_grey_seer = true,
			chaos_tentacle_sorcerer = true,
			chaos_zombie = true,
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
local list = {}
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

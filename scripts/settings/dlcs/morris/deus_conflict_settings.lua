IntensitySettings.deus_default = {
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
}
PacingSettings.deus_default = {
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
		120
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
		70,
		120
	},
	horde = HordeSettings.deus_default,
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
}
PacingSettings.deus_chaos = {
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
		120
	},
	horde_startup_time = {
		70,
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
	horde = HordeSettings.deus_chaos,
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
}
PacingSettings.deus_beastmen = {
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
		120
	},
	horde_startup_time = {
		70,
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
	horde = HordeSettings.deus_beastmen,
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
}
BossSettings.deus_default = {
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
}
BossSettings.deus_skaven = {
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
}
BossSettings.deus_chaos = {
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
}
BossSettings.deus_beastmen = {
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
}
BossSettings.deus_skaven_beastmen = {
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
}
BossSettings.deus_chaos_beastmen = {
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
SpecialsSettings.deus_default = {
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
}
SpecialsSettings.deus_skaven = {
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
}
SpecialsSettings.deus_chaos = {
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
}
SpecialsSettings.deus_beastmen = {
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
}
SpecialsSettings.deus_skaven_beastmen = {
	spawn_method = "specials_by_slots",
	max_specials = 2,
	disabled = false,
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
			"skaven_gutter_runner"
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
			"skaven_warpfire_thrower",
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
			"beastmen_bestigor",
			"beastmen_ungor",
			"beastmen_gor"
		},
		vector_horde_config = {
			skaven_plague_monk = {
				2,
				3
			},
			beastmen_bestigor = {
				2,
				3
			},
			beastmen_ungor = {
				5,
				8
			},
			beastmen_gor = {
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
	difficulty_overrides = SpecialDifficultyOverrides_skaven_beastmen
}
SpecialsSettings.deus_chaos_beastmen = {
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
}
RoamingSettings.deus_default = {
	despawn_distance = 45,
	despawn_path_distance = 75,
	despawn_distance_z = 30,
	disabled = false
}
PackSpawningSettings.deus_default = {
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
}
PackSpawningSettings.deus_skaven_beastmen = {
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
}
PackSpawningSettings.deus_chaos_beastmen = {
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
}
PackSpawningSettings.deus_skaven = {
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
}
PackSpawningSettings.deus_chaos = {
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
}
PackSpawningSettings.deus_beastmen = {
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
}
HordeSettings.deus_default = {
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
}
HordeSettings.deus_chaos = {
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
}
HordeSettings.deus_beastmen = {
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
}
local DeusConflictDirectorUIFlavor = {
	description = {
		skaven_chaos = "deus_conflict_director_skaven_chaos_name",
		skaven_beastmen = "deus_conflict_director_skaven_beastmen_name",
		skaven = "deus_conflict_director_skaven_name",
		chaos_beastmen = "deus_conflict_director_chaos_beastmen_name",
		chaos = "deus_conflict_director_chaos_name",
		skaven_chaos_beastmen = "deus_conflict_director_skaven_chaos_beastmen_name",
		beastmen = "deus_conflict_director_beastmen_name"
	},
	icons = {}
}
ConflictDirectors.deus_skaven_chaos = {
	debug_color = "maroon",
	disabled = false,
	intensity = IntensitySettings.deus_default,
	pacing = PacingSettings.deus_default,
	boss = BossSettings.deus_default,
	specials = SpecialsSettings.deus_default,
	roaming = RoamingSettings.deus_default,
	pack_spawning = PackSpawningSettings.deus_default,
	horde = HordeSettings.deus_default,
	description = DeusConflictDirectorUIFlavor.description.skaven_chaos,
	factions = {
		"chaos",
		"skaven"
	}
}
ConflictDirectors.deus_skaven = {
	debug_color = "orange",
	disabled = false,
	intensity = IntensitySettings.deus_default,
	pacing = PacingSettings.deus_default,
	boss = BossSettings.deus_skaven,
	specials = SpecialsSettings.deus_skaven,
	roaming = RoamingSettings.deus_default,
	pack_spawning = PackSpawningSettings.skaven,
	horde = HordeSettings.deus_default,
	factions = {
		"skaven"
	},
	description = DeusConflictDirectorUIFlavor.description.skaven_chaos
}
ConflictDirectors.deus_chaos = {
	debug_color = "purple",
	disabled = false,
	intensity = IntensitySettings.deus_default,
	pacing = PacingSettings.deus_chaos,
	boss = BossSettings.deus_chaos,
	specials = SpecialsSettings.deus_chaos,
	roaming = RoamingSettings.deus_default,
	pack_spawning = PackSpawningSettings.deus_chaos,
	horde = HordeSettings.deus_chaos,
	factions = {
		"chaos"
	}
}
ConflictDirectors.deus_beastmen = {
	debug_color = "purple",
	disabled = false,
	locked_func_name = "beastmen",
	intensity = IntensitySettings.deus_default,
	pacing = PacingSettings.deus_beastmen,
	boss = BossSettings.deus_beastmen,
	specials = SpecialsSettings.deus_beastmen,
	roaming = RoamingSettings.deus_default,
	pack_spawning = PackSpawningSettings.deus_beastmen,
	horde = HordeSettings.deus_beastmen,
	factions = {
		"beastmen"
	}
}
ConflictDirectors.deus_skaven_beastmen = {
	debug_color = "orange",
	disabled = false,
	locked_func_name = "beastmen",
	intensity = IntensitySettings.deus_default,
	pacing = PacingSettings.deus_default,
	boss = BossSettings.deus_skaven_beastmen,
	specials = SpecialsSettings.deus_skaven_beastmen,
	roaming = RoamingSettings.deus_default,
	pack_spawning = PackSpawningSettings.deus_skaven_beastmen,
	horde = HordeSettings.deus_beastmen,
	description = DeusConflictDirectorUIFlavor.description.skaven_beastmen,
	factions = {
		"beastmen",
		"skaven"
	}
}
ConflictDirectors.deus_chaos_beastmen = {
	debug_color = "deep_sky_blue",
	disabled = false,
	locked_func_name = "beastmen",
	intensity = IntensitySettings.deus_default,
	pacing = PacingSettings.deus_default,
	boss = BossSettings.deus_chaos_beastmen,
	specials = SpecialsSettings.deus_chaos_beastmen,
	roaming = RoamingSettings.deus_default,
	pack_spawning = PackSpawningSettings.deus_chaos_beastmen,
	horde = HordeSettings.deus_beastmen,
	description = DeusConflictDirectorUIFlavor.description.chaos_beastmen,
	factions = {
		"chaos",
		"beastmen"
	}
}

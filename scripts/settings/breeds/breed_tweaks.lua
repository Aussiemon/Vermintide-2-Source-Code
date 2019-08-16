BreedTweaks = {}
local health_step_multipliers = {
	1,
	1,
	1.5,
	2.2,
	3.3,
	4.5,
	6,
	7.5
}
local stagger_step_multipliers = {
	1,
	0.85,
	1.4,
	2.25,
	2.25,
	2.25,
	3.5,
	3.5
}
local elite_stagger_step_multipliers = {
	1,
	1,
	1.7,
	2.75,
	2.75,
	2.75,
	3.5,
	3.5
}
local mass_step_multipliers = {
	1,
	1,
	1.7,
	2.5,
	2.5,
	2.5,
	3.25,
	4.5
}
local elite_health_step_multipliers = {
	1,
	1,
	1.5,
	2.2,
	3.3,
	5.4,
	6.4,
	7.4
}
local elite_stagger_step_multipliers = {
	1,
	1,
	1.7,
	2.75,
	2.75,
	2.75,
	3.5,
	4
}
local elite_mass_step_multipliers = {
	1,
	1,
	1.7,
	2.5,
	2.5,
	2.5,
	3.25,
	4.5
}
local horde_health_step_multipliers = {
	1,
	1,
	1.5,
	2.2,
	3.3,
	4.2,
	5.1,
	6
}
local horde_stagger_step_multipliers = {
	1,
	1,
	1.5,
	2.25,
	2.25,
	2.25,
	3,
	3
}
local horde_mass_step_multipliers = {
	1,
	1,
	1.5,
	2,
	2,
	2,
	2.75,
	3
}
local boss_health_step_multipliers = {
	1,
	1,
	1.5,
	2,
	3,
	5,
	6.5,
	8
}

local function networkify_health(health_amount)
	health_amount = math.clamp(health_amount, 0, 8191.5)
	local decimal = health_amount % 1
	local rounded_decimal = math.round(decimal * 4) * 0.25

	return math.floor(health_amount) + rounded_decimal
end

local function health_steps(value, step_multipliers)
	local value_steps = {}

	for i = 1, 8, 1 do
		local step_value = value * step_multipliers[i]
		local networkifyed_health = networkify_health(step_value)
		value_steps[i] = networkifyed_health
	end

	return value_steps
end

local function steps(value, step_multipliers)
	local value_steps = {}

	for i = 1, 8, 1 do
		local raw_value = value * step_multipliers[i]
		local decimal = raw_value % 1
		local rounded_decimal = math.round(decimal * 4) * 0.25
		value_steps[i] = math.floor(raw_value) + rounded_decimal
	end

	return value_steps
end

BreedTweaks.max_health = {
	slave_rat = health_steps(4, horde_health_step_multipliers),
	fanatic = health_steps(8, horde_health_step_multipliers),
	ungor = health_steps(6, horde_health_step_multipliers),
	clan_rat = health_steps(8, health_step_multipliers),
	clan_rat_with_shield = health_steps(8, health_step_multipliers),
	marauder = health_steps(16, health_step_multipliers),
	gor = health_steps(12, health_step_multipliers),
	berzerker = health_steps(18, elite_health_step_multipliers),
	plague_monk = health_steps(18, elite_health_step_multipliers),
	stormvermin = health_steps(16, elite_health_step_multipliers),
	stormvermin_with_shield = health_steps(16, elite_health_step_multipliers),
	raider = health_steps(30, elite_health_step_multipliers),
	bestigor = health_steps(20, elite_health_step_multipliers),
	chaos_warrior = health_steps(46, elite_health_step_multipliers),
	chaos_spawn = health_steps(800, boss_health_step_multipliers),
	chaos_troll = health_steps(600, boss_health_step_multipliers),
	rat_ogre = health_steps(800, boss_health_step_multipliers),
	stormfiend = health_steps(600, boss_health_step_multipliers),
	corruptor_sorcerer = health_steps(20, health_step_multipliers),
	vortex_sorcerer = health_steps(20, health_step_multipliers),
	warpfire_thrower = health_steps(12, health_step_multipliers),
	globadier = health_steps(20, health_step_multipliers),
	gutter_runner = health_steps(12, health_step_multipliers),
	pack_master = health_steps(25, health_step_multipliers),
	ratling_gunner = health_steps(12, health_step_multipliers),
	standard_bearer = health_steps(20, health_step_multipliers),
	stormvermin_warlord = health_steps(500, boss_health_step_multipliers),
	exalted_champion = health_steps(700, boss_health_step_multipliers),
	exalted_sorcerer = health_steps(800, boss_health_step_multipliers),
	norsca_champion = health_steps(600, boss_health_step_multipliers),
	grey_seer = health_steps(500, boss_health_step_multipliers),
	stormfiend_boss = health_steps(600, boss_health_step_multipliers)
}
BreedTweaks.diff_stagger_resist = {
	slave_rat = steps(1, stagger_step_multipliers),
	fanatic = steps(1.4, stagger_step_multipliers),
	ungor = steps(1.3, stagger_step_multipliers),
	clan_rat = steps(2.1, stagger_step_multipliers),
	gor = steps(2.4, stagger_step_multipliers),
	marauder = steps(2.65, stagger_step_multipliers),
	stormvermin = steps(2.25, elite_stagger_step_multipliers),
	bestigor = steps(3.25, elite_stagger_step_multipliers),
	raider = steps(3, elite_stagger_step_multipliers),
	warrior = steps(4.8, elite_stagger_step_multipliers),
	berzerker = steps(2.7, elite_stagger_step_multipliers),
	plague_monk = steps(3, elite_stagger_step_multipliers),
	packmaster = steps(4, elite_stagger_step_multipliers),
	ratling_gunner = steps(2.5, elite_stagger_step_multipliers),
	sorcerer = steps(2.7, elite_stagger_step_multipliers)
}
BreedTweaks.stagger_reduction = {
	marauder = steps(0.2, stagger_step_multipliers),
	gor = steps(0.1, stagger_step_multipliers),
	stormvermin = steps(1, elite_stagger_step_multipliers),
	raider = steps(0.9, elite_stagger_step_multipliers),
	warrior = steps(1.8, elite_stagger_step_multipliers),
	bestigor = steps(1, elite_stagger_step_multipliers),
	berzerker = steps(0.75, elite_stagger_step_multipliers),
	plague_monk = steps(1.35, elite_stagger_step_multipliers),
	sorcerer = steps(2, elite_stagger_step_multipliers),
	packmaster = steps(2, elite_stagger_step_multipliers),
	ratling_gunner = steps(1, elite_stagger_step_multipliers),
	stormvermin_warlord = steps(1.35, elite_stagger_step_multipliers)
}
BreedTweaks.stagger_duration = {
	slave_rat = {
		1,
		1.5,
		2,
		1.5,
		2,
		5,
		1,
		1
	},
	fanatic = {
		1,
		1.75,
		2.5,
		0.75,
		1.5,
		4,
		1,
		1
	},
	ungor = {
		1,
		1.5,
		2,
		1,
		1.25,
		3,
		1,
		1
	},
	clan_rat = {
		1,
		1.5,
		2,
		1.5,
		2,
		5,
		1,
		1
	},
	marauder = {
		1,
		1.75,
		2.5,
		1,
		1.5,
		4,
		1,
		1
	},
	gor = {
		1,
		1.75,
		2.5,
		1,
		1.25,
		4,
		1,
		1
	},
	stormvermin = {
		1,
		1.25,
		1.75,
		1,
		1.25,
		3,
		1,
		1
	},
	raider = {
		0.75,
		1.25,
		1.75,
		1,
		1,
		1,
		1,
		1
	},
	bestigor = {
		0.75,
		1.25,
		1.75,
		1,
		1.25,
		3,
		1,
		1
	},
	berzerker = {
		0.25,
		1.75,
		3.5,
		0.5,
		0.5,
		4,
		0.25,
		0.25
	},
	plague_monk = {
		0.25,
		0.5,
		0.75,
		0.25,
		0.25,
		2,
		0.25,
		0.25
	},
	sorcerer = {
		0.5,
		1,
		1,
		1,
		1,
		1,
		1,
		1
	},
	warrior = {
		0.1,
		0.3,
		0.75,
		0.1,
		0.1,
		1,
		0.1,
		1
	}
}
BreedTweaks.stagger_duration_difficulty_mod = {
	default = {
		harder = 1.25,
		hard = 1.35,
		normal = 1.5,
		hardest = 1.15,
		cataclysm = 1,
		cataclysm_3 = 1,
		cataclysm_2 = 1,
		easy = 1
	},
	fast = {
		harder = 1,
		hard = 1,
		normal = 1,
		hardest = 1,
		cataclysm = 0.75,
		cataclysm_3 = 0.75,
		cataclysm_2 = 0.75,
		easy = 1
	}
}
BreedTweaks.hit_mass_counts = {
	slave_rat = steps(0.8, mass_step_multipliers),
	fanatic = steps(1.25, mass_step_multipliers),
	ungor = steps(1, mass_step_multipliers),
	clan_rat = steps(1.5, mass_step_multipliers),
	clan_rat_shield_block = steps(1.5, mass_step_multipliers),
	marauder = steps(3, mass_step_multipliers),
	gor = steps(2.75, mass_step_multipliers),
	stormvermin = steps(5, mass_step_multipliers),
	stormvermin_shield_block = steps(8, mass_step_multipliers),
	bestigor = steps(8, mass_step_multipliers),
	raider = steps(5, mass_step_multipliers),
	berzerker = steps(3, mass_step_multipliers),
	marauder_shield_block = steps(5, mass_step_multipliers),
	plague_monk = steps(2.5, mass_step_multipliers),
	sorcerer = steps(8, mass_step_multipliers)
}
BreedTweaks.difficulty_damage = {
	beastmen_roamer_attack = {
		harder = 18,
		hard = 14,
		normal = 8,
		hardest = 25,
		cataclysm = 30,
		cataclysm_3 = 30,
		cataclysm_2 = 30,
		easy = 5
	},
	beastmen_headbutt_attack = {
		harder = 12,
		hard = 8,
		normal = 4,
		hardest = 16,
		cataclysm = 20,
		cataclysm_3 = 20,
		cataclysm_2 = 20,
		easy = 2.5
	},
	skirmish_roamer_attack = {
		harder = 8,
		hard = 5,
		normal = 3,
		hardest = 10,
		cataclysm = 15,
		cataclysm_3 = 15,
		cataclysm_2 = 15,
		easy = 2.5
	},
	chaos_roamer_attack = {
		harder = 12,
		hard = 7,
		normal = 5,
		hardest = 20,
		cataclysm = 25,
		cataclysm_3 = 25,
		cataclysm_2 = 25,
		easy = 4
	},
	chaos_horde_attack = {
		harder = 12,
		hard = 8,
		normal = 4,
		hardest = 16,
		cataclysm = 20,
		cataclysm_3 = 20,
		cataclysm_2 = 20,
		easy = 2.5
	},
	skaven_roamer_attack = {
		harder = 10,
		hard = 6,
		normal = 3,
		hardest = 15,
		cataclysm = 20,
		cataclysm_3 = 20,
		cataclysm_2 = 20,
		easy = 3
	},
	skaven_horde_attack = {
		harder = 8,
		hard = 5,
		normal = 2.5,
		hardest = 12,
		cataclysm = 16,
		cataclysm_3 = 16,
		cataclysm_2 = 16,
		easy = 2
	},
	elite_attack = {
		harder = 30,
		hard = 20,
		normal = 15,
		hardest = 50,
		cataclysm = 60,
		cataclysm_3 = 60,
		cataclysm_2 = 60,
		easy = 15
	},
	elite_attack_heavy = {
		harder = 50,
		hard = 40,
		normal = 30,
		hardest = 100,
		cataclysm = 150,
		cataclysm_3 = 150,
		cataclysm_2 = 150,
		easy = 20
	},
	elite_attack_shielded = {
		harder = 25,
		hard = 20,
		normal = 15,
		hardest = 40,
		cataclysm = 50,
		cataclysm_3 = 50,
		cataclysm_2 = 50,
		easy = 10
	},
	elite_attack_shielded_frenzy = {
		harder = 10,
		hard = 8,
		normal = 4,
		hardest = 14,
		cataclysm = 14,
		cataclysm_3 = 14,
		cataclysm_2 = 14,
		easy = 2
	},
	elite_attack_quick = {
		harder = 16,
		hard = 14,
		normal = 12,
		hardest = 20,
		cataclysm = 30,
		cataclysm_3 = 30,
		cataclysm_2 = 30,
		easy = 10
	},
	berzerker_frenzy_attack = {
		harder = 12,
		hard = 7,
		normal = 2,
		hardest = 20,
		cataclysm = 25,
		cataclysm_3 = 25,
		cataclysm_2 = 25,
		easy = 2
	},
	boss_slam_attack = {
		harder = 40,
		hard = 25,
		normal = 15,
		hardest = 60,
		cataclysm = 60,
		cataclysm_3 = 60,
		cataclysm_2 = 60,
		easy = 15
	},
	boss_slam_attack_blocked = {
		harder = 9,
		hard = 7,
		normal = 2,
		hardest = 10,
		cataclysm = 10,
		cataclysm_3 = 10,
		cataclysm_2 = 10,
		easy = 2
	},
	boss_combo_attack = {
		harder = 25,
		hard = 15,
		normal = 10,
		hardest = 40,
		cataclysm = 50,
		cataclysm_3 = 50,
		cataclysm_2 = 50,
		easy = 10
	}
}
BreedTweaks.bloodlust_health = {
	beastmen_horde = 1.5,
	chaos_roamer = 3,
	skaven_special = 8,
	chaos_warrior = 30,
	skaven_elite = 8,
	beastmen_roamer = 3,
	chaos_elite = 15,
	beastmen_elite = 15,
	skaven_horde = 0.5,
	chaos_special = 10,
	skaven_roamer = 1,
	monster = 50,
	chaos_horde = 1
}
BreedTweaks.blocked_duration = {
	skaven_roamer = {
		harder = {
			1,
			1.2
		},
		hardest = {
			0.75,
			1
		},
		cataclysm = {
			0.5,
			0.75
		},
		cataclysm_2 = {
			0.5,
			0.75
		},
		cataclysm_3 = {
			0.5,
			0.75
		}
	},
	skaven_horde = {
		harder = {
			1,
			1.2
		},
		hardest = {
			0.75,
			1
		},
		cataclysm = {
			0.5,
			0.75
		},
		cataclysm_2 = {
			0.5,
			0.75
		},
		cataclysm_3 = {
			0.5,
			0.75
		}
	},
	skaven_elite = {
		harder = {
			1,
			1.2
		},
		hardest = {
			0.75,
			1
		},
		cataclysm = {
			0.5,
			0.75
		},
		cataclysm_2 = {
			0.5,
			0.75
		},
		cataclysm_3 = {
			0.5,
			0.75
		}
	},
	chaos_roamer = {
		harder = {
			1,
			1.2
		},
		hardest = {
			0.75,
			1
		},
		cataclysm = {
			0.5,
			0.75
		},
		cataclysm_2 = {
			0.5,
			0.75
		},
		cataclysm_3 = {
			0.5,
			0.75
		}
	},
	chaos_horde = {
		harder = {
			1,
			1.2
		},
		hardest = {
			0.75,
			1
		},
		cataclysm = {
			0.5,
			0.75
		},
		cataclysm_2 = {
			0.5,
			0.75
		},
		cataclysm_3 = {
			0.5,
			0.75
		}
	},
	chaos_elite = {
		harder = {
			1,
			1.2
		},
		hardest = {
			0.75,
			1
		},
		cataclysm = {
			0.5,
			0.75
		},
		cataclysm_2 = {
			0.5,
			0.75
		},
		cataclysm_3 = {
			0.5,
			0.75
		}
	},
	beastmen_roamer = {
		harder = {
			1,
			1.2
		},
		hardest = {
			0.75,
			1
		},
		cataclysm = {
			0.5,
			0.75
		},
		cataclysm_2 = {
			0.5,
			0.75
		},
		cataclysm_3 = {
			0.5,
			0.75
		}
	},
	beastmen_elite = {
		harder = {
			1,
			1.2
		},
		hardest = {
			0.75,
			1
		},
		cataclysm = {
			0.5,
			0.75
		},
		cataclysm_2 = {
			0.5,
			0.75
		},
		cataclysm_3 = {
			0.5,
			0.75
		}
	}
}
BreedTweaks.attack_finished_duration = {
	skaven_roamer = {
		harder = {
			1.6,
			1.8
		},
		hardest = {
			1.4,
			1.6
		},
		cataclysm = {
			1.2,
			1.4
		},
		cataclysm_2 = {
			1,
			1.2
		},
		cataclysm_3 = {
			1,
			1.2
		}
	},
	skaven_horde = {
		harder = {
			1.6,
			1.8
		},
		hardest = {
			1.4,
			1.6
		},
		cataclysm = {
			1.2,
			1.4
		},
		cataclysm_2 = {
			1,
			1.2
		},
		cataclysm_3 = {
			1,
			1.2
		}
	},
	skaven_elite = {
		harder = {
			1.6,
			1.8
		},
		hardest = {
			1.4,
			1.6
		},
		cataclysm = {
			1.2,
			1.4
		},
		cataclysm_2 = {
			1,
			1.2
		},
		cataclysm_3 = {
			1,
			1.2
		}
	},
	chaos_roamer = {
		harder = {
			1.7,
			2
		},
		hardest = {
			1.5,
			1.8
		},
		cataclysm = {
			1.1,
			1.3
		},
		cataclysm_2 = {
			1,
			1.2
		},
		cataclysm_3 = {
			1,
			1.2
		}
	},
	chaos_horde = {
		harder = {
			1.7,
			2
		},
		hardest = {
			1.5,
			1.8
		},
		cataclysm = {
			1.1,
			1.3
		},
		cataclysm_2 = {
			1,
			1.2
		},
		cataclysm_3 = {
			1,
			1.2
		}
	},
	beastmen_horde = {
		harder = {
			1.7,
			2
		},
		hardest = {
			1.5,
			1.8
		},
		cataclysm = {
			1.5,
			1.8
		},
		cataclysm_2 = {
			1.5,
			1.8
		},
		cataclysm_3 = {
			1.5,
			1.8
		}
	},
	beastmen_roamer = {
		harder = {
			1.4,
			1.6
		},
		hardest = {
			1.3,
			1.4
		},
		cataclysm = {
			1.2,
			1.3
		},
		cataclysm_2 = {
			1,
			1.2
		},
		cataclysm_3 = {
			1,
			1.2
		}
	},
	beastmen_elite = {
		harder = {
			1.7,
			2
		},
		hardest = {
			1.5,
			1.8
		},
		cataclysm = {
			1.5,
			1.8
		},
		cataclysm_2 = {
			1.5,
			1.8
		},
		cataclysm_3 = {
			1.5,
			1.8
		}
	}
}
BreedTweaks.dodge_windows = {
	normal_attack = {
		harder = 0.25,
		hardest = 0.25,
		cataclysm = 0.25,
		cataclysm_3 = 0.25,
		cataclysm_2 = 0.25
	},
	running_attack = {
		harder = 0.75,
		hardest = 0.75,
		cataclysm = 0.75,
		cataclysm_3 = 0.75,
		cataclysm_2 = 0.75
	},
	piercing_attack = {
		harder = 0.25,
		hardest = 0.25,
		cataclysm = 0.25,
		cataclysm_3 = 0.25,
		cataclysm_2 = 0.25
	},
	fast_attack = {
		harder = 0,
		hardest = 0,
		cataclysm = 0,
		cataclysm_3 = 0,
		cataclysm_2 = 0
	}
}
BreedTweaks.dodge_window_durations = {
	normal_attack = {
		harder = 0.5,
		hardest = 0.5,
		cataclysm = 0.5,
		cataclysm_3 = 0.5,
		cataclysm_2 = 0.5
	},
	running_attack = {
		harder = 0.75,
		hardest = 0.75,
		cataclysm = 0.75,
		cataclysm_3 = 0.75,
		cataclysm_2 = 0.75
	},
	piercing_attack = {
		harder = 1,
		hardest = 1,
		cataclysm = 1,
		cataclysm_3 = 1,
		cataclysm_2 = 1
	}
}
BreedTweaks.fatigue_types = {
	roamer = {
		normal_attack = {
			harder = "blocked_attack",
			hard = "blocked_attack",
			normal = "blocked_attack",
			hardest = "blocked_attack_2",
			cataclysm = "blocked_attack_2",
			cataclysm_3 = "blocked_attack_3",
			cataclysm_2 = "blocked_attack_2",
			easy = "blocked_attack"
		},
		running_attack = {
			harder = "blocked_attack",
			hard = "blocked_attack",
			normal = "blocked_attack",
			hardest = "blocked_attack",
			cataclysm = "blocked_attack_2",
			cataclysm_3 = "blocked_attack_2",
			cataclysm_2 = "blocked_attack_2",
			easy = "blocked_attack"
		}
	},
	horde = {
		normal_attack = {
			harder = "blocked_attack",
			hard = "blocked_attack",
			normal = "blocked_attack",
			hardest = "blocked_attack",
			cataclysm = "blocked_attack_2",
			cataclysm_3 = "blocked_attack_2",
			cataclysm_2 = "blocked_attack_2",
			easy = "blocked_attack"
		},
		running_attack = {
			harder = "blocked_attack",
			hard = "blocked_attack",
			normal = "blocked_attack",
			hardest = "blocked_attack",
			cataclysm = "blocked_attack_2",
			cataclysm_3 = "blocked_attack_2",
			cataclysm_2 = "blocked_attack_2",
			easy = "blocked_attack"
		}
	},
	elite_cleave = {
		normal_attack = {
			harder = "blocked_sv_cleave",
			hard = "blocked_sv_cleave",
			normal = "blocked_sv_cleave",
			hardest = "blocked_sv_cleave",
			cataclysm = "blocked_sv_cleave",
			cataclysm_3 = "blocked_sv_cleave",
			cataclysm_2 = "blocked_sv_cleave",
			easy = "blocked_sv_cleave"
		},
		running_attack = {
			harder = "blocked_sv_cleave",
			hard = "blocked_sv_cleave",
			normal = "blocked_sv_cleave",
			hardest = "blocked_sv_cleave",
			cataclysm = "blocked_sv_cleave",
			cataclysm_3 = "blocked_sv_cleave",
			cataclysm_2 = "blocked_sv_cleave",
			easy = "blocked_sv_cleave"
		}
	},
	elite_sweep = {
		normal_attack = {
			harder = "blocked_sv_sweep",
			hard = "blocked_sv_sweep",
			normal = "blocked_sv_sweep",
			hardest = "blocked_sv_sweep_2",
			cataclysm = "blocked_sv_sweep_2",
			cataclysm_3 = "blocked_sv_sweep_2",
			cataclysm_2 = "blocked_sv_sweep_2",
			easy = "blocked_sv_sweep"
		},
		running_attack = {
			harder = "blocked_sv_sweep",
			hard = "blocked_sv_sweep",
			normal = "blocked_sv_sweep",
			hardest = "blocked_sv_sweep_2",
			cataclysm = "blocked_sv_sweep_2",
			cataclysm_3 = "blocked_sv_sweep_2",
			cataclysm_2 = "blocked_sv_sweep_2",
			easy = "blocked_sv_sweep"
		}
	},
	boss_combo = {
		normal_attack = {
			harder = "blocked_sv_sweep",
			hard = "blocked_sv_sweep",
			normal = "blocked_sv_sweep",
			hardest = "blocked_sv_sweep",
			cataclysm = "blocked_sv_sweep",
			cataclysm_3 = "blocked_sv_sweep",
			cataclysm_2 = "blocked_sv_sweep",
			easy = "blocked_sv_sweep"
		},
		running_attack = {
			harder = "blocked_sv_sweep",
			hard = "blocked_sv_sweep",
			normal = "blocked_sv_sweep",
			hardest = "blocked_sv_sweep",
			cataclysm = "blocked_sv_sweep",
			cataclysm_3 = "blocked_sv_sweep",
			cataclysm_2 = "blocked_sv_sweep",
			easy = "blocked_sv_sweep"
		},
		light_combo = {
			harder = "chaos_spawn_combo",
			hard = "chaos_spawn_combo",
			normal = "chaos_spawn_combo",
			hardest = "chaos_spawn_combo",
			cataclysm = "chaos_spawn_combo",
			cataclysm_3 = "chaos_spawn_combo",
			cataclysm_2 = "chaos_spawn_combo",
			easy = "chaos_spawn_combo"
		}
	},
	headbutt = {
		normal_attack = {
			harder = "blocked_headbutt",
			hard = "blocked_headbutt",
			normal = "blocked_headbutt",
			hardest = "blocked_headbutt",
			cataclysm = "blocked_headbutt",
			cataclysm_3 = "blocked_headbutt",
			cataclysm_2 = "blocked_headbutt",
			easy = "blocked_headbutt"
		}
	}
}
BreedTweaks.diminishing_damage_and_cooldown = {
	roamer = {
		easy = {
			{
				damage = 2,
				cooldown = {
					0.5,
					1
				}
			},
			{
				damage = 2,
				cooldown = {
					0.5,
					1
				}
			},
			{
				damage = 1.5,
				cooldown = {
					1,
					2
				}
			},
			{
				damage = 1,
				cooldown = {
					1.25,
					2.25
				}
			},
			{
				damage = 1,
				cooldown = {
					1.5,
					2.5
				}
			},
			{
				damage = 1,
				cooldown = {
					1.75,
					2.75
				}
			},
			{
				damage = 1,
				cooldown = {
					2,
					3
				}
			},
			{
				damage = 1,
				cooldown = {
					2.25,
					3.25
				}
			},
			{
				damage = 1,
				cooldown = {
					2.5,
					3.5
				}
			}
		},
		normal = {
			{
				damage = 2,
				cooldown = {
					2.75,
					3
				}
			},
			{
				damage = 2,
				cooldown = {
					2.75,
					3
				}
			},
			{
				damage = 1.5,
				cooldown = {
					1,
					2
				}
			},
			{
				damage = 1,
				cooldown = {
					1.25,
					2.25
				}
			},
			{
				damage = 1,
				cooldown = {
					1.5,
					2.5
				}
			},
			{
				damage = 1,
				cooldown = {
					1.75,
					2.75
				}
			},
			{
				damage = 1,
				cooldown = {
					2,
					3
				}
			},
			{
				damage = 1,
				cooldown = {
					2.25,
					3.25
				}
			},
			{
				damage = 1,
				cooldown = {
					2.5,
					3.5
				}
			}
		},
		hard = {
			{
				damage = 2,
				cooldown = {
					1,
					2
				}
			},
			{
				damage = 2,
				cooldown = {
					1,
					2
				}
			},
			{
				damage = 1.5,
				cooldown = {
					1,
					2
				}
			},
			{
				damage = 1,
				cooldown = {
					1.25,
					2.25
				}
			},
			{
				damage = 1,
				cooldown = {
					1.25,
					2.5
				}
			},
			{
				damage = 1,
				cooldown = {
					1.5,
					2.75
				}
			},
			{
				damage = 1,
				cooldown = {
					1.75,
					3
				}
			},
			{
				damage = 1,
				cooldown = {
					2,
					3.25
				}
			},
			{
				damage = 1,
				cooldown = {
					2.25,
					3.5
				}
			}
		},
		harder = {
			{
				damage = 2.5,
				cooldown = {
					0.5,
					1
				}
			},
			{
				damage = 2,
				cooldown = {
					0.5,
					1
				}
			},
			{
				damage = 1.5,
				cooldown = {
					0.5,
					1
				}
			},
			{
				damage = 1,
				cooldown = {
					0.5,
					1
				}
			},
			{
				damage = 1,
				cooldown = {
					0.6,
					1.1
				}
			},
			{
				damage = 1,
				cooldown = {
					0.7,
					1.2
				}
			},
			{
				damage = 1,
				cooldown = {
					0.8,
					1.3
				}
			},
			{
				damage = 1,
				cooldown = {
					0.9,
					1.4
				}
			},
			{
				damage = 1,
				cooldown = {
					1,
					1.5
				}
			}
		},
		hardest = {
			{
				damage = 2.5,
				cooldown = {
					0,
					0.25
				}
			},
			{
				damage = 2,
				cooldown = {
					0,
					0.25
				}
			},
			{
				damage = 2,
				cooldown = {
					0,
					0.25
				}
			},
			{
				damage = 1.8,
				cooldown = {
					0,
					0.3
				}
			},
			{
				damage = 1.6,
				cooldown = {
					0,
					0.35
				}
			},
			{
				damage = 1.4,
				cooldown = {
					0,
					0.4
				}
			},
			{
				damage = 1.2,
				cooldown = {
					0,
					0.45
				}
			},
			{
				damage = 1,
				cooldown = {
					0,
					0.5
				}
			},
			{
				damage = 1,
				cooldown = {
					0,
					0.5
				}
			}
		},
		cataclysm = {
			{
				damage = 2.5,
				cooldown = {
					0,
					0.1
				}
			},
			{
				damage = 2,
				cooldown = {
					0,
					0.1
				}
			},
			{
				damage = 2,
				cooldown = {
					0,
					0.1
				}
			},
			{
				damage = 1.8,
				cooldown = {
					0,
					0.3
				}
			},
			{
				damage = 1.6,
				cooldown = {
					0,
					0.35
				}
			},
			{
				damage = 1.4,
				cooldown = {
					0,
					0.4
				}
			},
			{
				damage = 1.2,
				cooldown = {
					0,
					0.45
				}
			},
			{
				damage = 1,
				cooldown = {
					0,
					0.5
				}
			},
			{
				damage = 1,
				cooldown = {
					0,
					0.5
				}
			}
		},
		cataclysm_2 = {
			{
				damage = 2.5,
				cooldown = {
					0,
					0.1
				}
			},
			{
				damage = 2,
				cooldown = {
					0,
					0.1
				}
			},
			{
				damage = 2,
				cooldown = {
					0,
					0.1
				}
			},
			{
				damage = 1.8,
				cooldown = {
					0,
					0.3
				}
			},
			{
				damage = 1.6,
				cooldown = {
					0,
					0.35
				}
			},
			{
				damage = 1.4,
				cooldown = {
					0,
					0.4
				}
			},
			{
				damage = 1.2,
				cooldown = {
					0,
					0.45
				}
			},
			{
				damage = 1,
				cooldown = {
					0,
					0.5
				}
			},
			{
				damage = 1,
				cooldown = {
					0,
					0.5
				}
			}
		},
		cataclysm_3 = {
			{
				damage = 2.5,
				cooldown = {
					0,
					0
				}
			},
			{
				damage = 2,
				cooldown = {
					0,
					0
				}
			},
			{
				damage = 2,
				cooldown = {
					0,
					0
				}
			},
			{
				damage = 1.8,
				cooldown = {
					0,
					0
				}
			},
			{
				damage = 1.6,
				cooldown = {
					0,
					0
				}
			},
			{
				damage = 1.4,
				cooldown = {
					0,
					0
				}
			},
			{
				damage = 1.2,
				cooldown = {
					0,
					0
				}
			},
			{
				damage = 1,
				cooldown = {
					0,
					0
				}
			},
			{
				damage = 1,
				cooldown = {
					0,
					0
				}
			}
		}
	},
	horde = {
		easy = {
			{
				damage = 2,
				cooldown = {
					3,
					5
				}
			},
			{
				damage = 1.5,
				cooldown = {
					3,
					5
				}
			},
			{
				damage = 1,
				cooldown = {
					3,
					5
				}
			},
			{
				damage = 1,
				cooldown = {
					3,
					5
				}
			},
			{
				damage = 1,
				cooldown = {
					3.3,
					7
				}
			},
			{
				damage = 1,
				cooldown = {
					3.6,
					7
				}
			},
			{
				damage = 1,
				cooldown = {
					4,
					7
				}
			},
			{
				damage = 1,
				cooldown = {
					4.5,
					8
				}
			},
			{
				damage = 1,
				cooldown = {
					5,
					8
				}
			}
		},
		normal = {
			{
				damage = 2,
				cooldown = {
					1.75,
					2.25
				}
			},
			{
				damage = 2,
				cooldown = {
					1.75,
					2.25
				}
			},
			{
				damage = 1.5,
				cooldown = {
					2,
					2.5
				}
			},
			{
				damage = 1,
				cooldown = {
					2,
					2.5
				}
			},
			{
				damage = 1,
				cooldown = {
					2.5,
					3.5
				}
			},
			{
				damage = 1,
				cooldown = {
					2.5,
					3.5
				}
			},
			{
				damage = 1,
				cooldown = {
					2.5,
					3.5
				}
			},
			{
				damage = 1,
				cooldown = {
					2.5,
					3.5
				}
			},
			{
				damage = 1,
				cooldown = {
					2.5,
					3.5
				}
			}
		},
		hard = {
			{
				damage = 2,
				cooldown = {
					1.5,
					2
				}
			},
			{
				damage = 2,
				cooldown = {
					1.5,
					2
				}
			},
			{
				damage = 1.5,
				cooldown = {
					1.75,
					2.25
				}
			},
			{
				damage = 1,
				cooldown = {
					1.75,
					2.25
				}
			},
			{
				damage = 1,
				cooldown = {
					2,
					2.5
				}
			},
			{
				damage = 1,
				cooldown = {
					2,
					2.5
				}
			},
			{
				damage = 1,
				cooldown = {
					2,
					2.5
				}
			},
			{
				damage = 1,
				cooldown = {
					2,
					2.5
				}
			},
			{
				damage = 1,
				cooldown = {
					2,
					2.5
				}
			}
		},
		harder = {
			{
				damage = 2.5,
				cooldown = {
					0.5,
					1
				}
			},
			{
				damage = 2,
				cooldown = {
					0.5,
					1
				}
			},
			{
				damage = 1.5,
				cooldown = {
					0.5,
					1
				}
			},
			{
				damage = 1,
				cooldown = {
					0.5,
					1
				}
			},
			{
				damage = 1,
				cooldown = {
					0.6,
					1.1
				}
			},
			{
				damage = 1,
				cooldown = {
					0.7,
					1.2
				}
			},
			{
				damage = 1,
				cooldown = {
					0.8,
					1.3
				}
			},
			{
				damage = 1,
				cooldown = {
					0.9,
					1.4
				}
			},
			{
				damage = 1,
				cooldown = {
					1,
					1.5
				}
			}
		},
		hardest = {
			{
				damage = 2.5,
				cooldown = {
					0,
					0.25
				}
			},
			{
				damage = 2,
				cooldown = {
					0,
					0.25
				}
			},
			{
				damage = 2,
				cooldown = {
					0,
					0.25
				}
			},
			{
				damage = 1.8,
				cooldown = {
					0,
					0.3
				}
			},
			{
				damage = 1.6,
				cooldown = {
					0,
					0.35
				}
			},
			{
				damage = 1.4,
				cooldown = {
					0,
					0.4
				}
			},
			{
				damage = 1.2,
				cooldown = {
					0,
					0.45
				}
			},
			{
				damage = 1,
				cooldown = {
					0,
					0.5
				}
			},
			{
				damage = 1,
				cooldown = {
					0,
					0.5
				}
			}
		},
		cataclysm = {
			{
				damage = 2.5,
				cooldown = {
					0,
					0.25
				}
			},
			{
				damage = 2,
				cooldown = {
					0,
					0.25
				}
			},
			{
				damage = 2,
				cooldown = {
					0,
					0.25
				}
			},
			{
				damage = 1.8,
				cooldown = {
					0,
					0.3
				}
			},
			{
				damage = 1.6,
				cooldown = {
					0,
					0.35
				}
			},
			{
				damage = 1.4,
				cooldown = {
					0,
					0.4
				}
			},
			{
				damage = 1.2,
				cooldown = {
					0,
					0.45
				}
			},
			{
				damage = 1,
				cooldown = {
					0,
					0.5
				}
			},
			{
				damage = 1,
				cooldown = {
					0,
					0.5
				}
			}
		},
		cataclysm_2 = {
			{
				damage = 2.5,
				cooldown = {
					0,
					0.25
				}
			},
			{
				damage = 2,
				cooldown = {
					0,
					0.25
				}
			},
			{
				damage = 2,
				cooldown = {
					0,
					0.25
				}
			},
			{
				damage = 1.8,
				cooldown = {
					0,
					0.3
				}
			},
			{
				damage = 1.6,
				cooldown = {
					0,
					0.35
				}
			},
			{
				damage = 1.4,
				cooldown = {
					0,
					0.4
				}
			},
			{
				damage = 1.2,
				cooldown = {
					0,
					0.45
				}
			},
			{
				damage = 1,
				cooldown = {
					0,
					0.5
				}
			},
			{
				damage = 1,
				cooldown = {
					0,
					0.5
				}
			}
		},
		cataclysm_3 = {
			{
				damage = 2.5,
				cooldown = {
					0,
					0
				}
			},
			{
				damage = 2,
				cooldown = {
					0,
					0
				}
			},
			{
				damage = 2,
				cooldown = {
					0,
					0
				}
			},
			{
				damage = 1.8,
				cooldown = {
					0,
					0
				}
			},
			{
				damage = 1.6,
				cooldown = {
					0,
					0
				}
			},
			{
				damage = 1.4,
				cooldown = {
					0,
					0
				}
			},
			{
				damage = 1.2,
				cooldown = {
					0,
					0
				}
			},
			{
				damage = 1,
				cooldown = {
					0,
					0
				}
			},
			{
				damage = 1,
				cooldown = {
					0,
					0
				}
			}
		}
	},
	berzerker = {
		easy = {
			{
				damage = 2,
				cooldown = {
					2,
					5
				}
			},
			{
				damage = 1.5,
				cooldown = {
					2,
					5
				}
			},
			{
				damage = 1,
				cooldown = {
					2,
					5
				}
			},
			{
				damage = 1,
				cooldown = {
					2,
					5
				}
			},
			{
				damage = 1,
				cooldown = {
					3,
					7
				}
			},
			{
				damage = 1,
				cooldown = {
					3,
					7
				}
			},
			{
				damage = 1,
				cooldown = {
					3,
					7
				}
			},
			{
				damage = 1,
				cooldown = {
					4,
					8
				}
			},
			{
				damage = 1,
				cooldown = {
					4,
					8
				}
			}
		},
		normal = {
			{
				damage = 2,
				cooldown = {
					2,
					3
				}
			},
			{
				damage = 2,
				cooldown = {
					2,
					3
				}
			},
			{
				damage = 1.5,
				cooldown = {
					2,
					3
				}
			},
			{
				damage = 1,
				cooldown = {
					2.25,
					3.25
				}
			},
			{
				damage = 1,
				cooldown = {
					2.5,
					3.5
				}
			},
			{
				damage = 1,
				cooldown = {
					2.75,
					3.75
				}
			},
			{
				damage = 1,
				cooldown = {
					3,
					4
				}
			},
			{
				damage = 1,
				cooldown = {
					3.25,
					4.25
				}
			},
			{
				damage = 1,
				cooldown = {
					3.5,
					4.5
				}
			}
		},
		hard = {
			{
				damage = 2,
				cooldown = {
					1,
					1.5
				}
			},
			{
				damage = 2,
				cooldown = {
					1,
					1.5
				}
			},
			{
				damage = 1.5,
				cooldown = {
					1,
					1.5
				}
			},
			{
				damage = 1,
				cooldown = {
					1.25,
					1.75
				}
			},
			{
				damage = 1,
				cooldown = {
					1.5,
					2
				}
			},
			{
				damage = 1,
				cooldown = {
					1.75,
					2.25
				}
			},
			{
				damage = 1,
				cooldown = {
					2,
					2.5
				}
			},
			{
				damage = 1,
				cooldown = {
					2.25,
					3.25
				}
			},
			{
				damage = 1,
				cooldown = {
					2.5,
					3.5
				}
			}
		},
		harder = {
			{
				damage = 2.5,
				cooldown = {
					0.5,
					1
				}
			},
			{
				damage = 2,
				cooldown = {
					0.5,
					1
				}
			},
			{
				damage = 1.5,
				cooldown = {
					0.5,
					1
				}
			},
			{
				damage = 1,
				cooldown = {
					0.5,
					1
				}
			},
			{
				damage = 1,
				cooldown = {
					0.6,
					1.1
				}
			},
			{
				damage = 1,
				cooldown = {
					0.7,
					1.2
				}
			},
			{
				damage = 1,
				cooldown = {
					0.8,
					1.3
				}
			},
			{
				damage = 1,
				cooldown = {
					0.9,
					1.4
				}
			},
			{
				damage = 1,
				cooldown = {
					1,
					1.5
				}
			}
		},
		hardest = {
			{
				damage = 2.5,
				cooldown = {
					0,
					0.25
				}
			},
			{
				damage = 2,
				cooldown = {
					0,
					0.25
				}
			},
			{
				damage = 2,
				cooldown = {
					0,
					0.25
				}
			},
			{
				damage = 1.8,
				cooldown = {
					0,
					0.3
				}
			},
			{
				damage = 1.6,
				cooldown = {
					0,
					0.35
				}
			},
			{
				damage = 1.4,
				cooldown = {
					0,
					0.4
				}
			},
			{
				damage = 1.2,
				cooldown = {
					0,
					0.45
				}
			},
			{
				damage = 1,
				cooldown = {
					0,
					0.5
				}
			},
			{
				damage = 1,
				cooldown = {
					0,
					0.5
				}
			}
		},
		cataclysm = {
			{
				damage = 2.5,
				cooldown = {
					0,
					0.25
				}
			},
			{
				damage = 2,
				cooldown = {
					0,
					0.25
				}
			},
			{
				damage = 2,
				cooldown = {
					0,
					0.25
				}
			},
			{
				damage = 1.8,
				cooldown = {
					0,
					0.3
				}
			},
			{
				damage = 1.6,
				cooldown = {
					0,
					0.35
				}
			},
			{
				damage = 1.4,
				cooldown = {
					0,
					0.4
				}
			},
			{
				damage = 1.2,
				cooldown = {
					0,
					0.45
				}
			},
			{
				damage = 1,
				cooldown = {
					0,
					0.5
				}
			},
			{
				damage = 1,
				cooldown = {
					0,
					0.5
				}
			}
		},
		cataclysm_2 = {
			{
				damage = 2.5,
				cooldown = {
					0,
					0.25
				}
			},
			{
				damage = 2,
				cooldown = {
					0,
					0.25
				}
			},
			{
				damage = 2,
				cooldown = {
					0,
					0.25
				}
			},
			{
				damage = 1.8,
				cooldown = {
					0,
					0.3
				}
			},
			{
				damage = 1.6,
				cooldown = {
					0,
					0.35
				}
			},
			{
				damage = 1.4,
				cooldown = {
					0,
					0.4
				}
			},
			{
				damage = 1.2,
				cooldown = {
					0,
					0.45
				}
			},
			{
				damage = 1,
				cooldown = {
					0,
					0.5
				}
			},
			{
				damage = 1,
				cooldown = {
					0,
					0.5
				}
			}
		},
		cataclysm_3 = {
			{
				damage = 2.5,
				cooldown = {
					0,
					0
				}
			},
			{
				damage = 2,
				cooldown = {
					0,
					0
				}
			},
			{
				damage = 2,
				cooldown = {
					0,
					0
				}
			},
			{
				damage = 1.8,
				cooldown = {
					0,
					0
				}
			},
			{
				damage = 1.6,
				cooldown = {
					0,
					0
				}
			},
			{
				damage = 1.4,
				cooldown = {
					0,
					0
				}
			},
			{
				damage = 1.2,
				cooldown = {
					0,
					0
				}
			},
			{
				damage = 1,
				cooldown = {
					0,
					0
				}
			},
			{
				damage = 1,
				cooldown = {
					0,
					0
				}
			}
		}
	}
}

return

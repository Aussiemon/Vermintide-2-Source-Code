-- chunkname: @scripts/settings/breeds/breed_players.lua

PlayerBreeds = PlayerBreeds or {}
PlayerBreedHitZones = PlayerBreedHitZones or {}
PlayerBreedHitZones.player_breed_hit_zones = {
	full = {
		prio = 1,
		actors = {},
	},
	torso = {
		prio = 1,
		actors = {
			"c_head",
			"c_neck",
			"c_spine",
			"c_spine1",
			"c_spine2",
			"c_hips",
			"c_leftshoulder",
			"c_rightshoulder",
			"c_leftarm",
			"c_leftforearm",
			"c_lefthand",
			"c_rightarm",
			"c_rightforearm",
			"c_righthand",
			"c_rightupleg",
			"c_rightleg",
			"c_rightfoot",
			"c_leftupleg",
			"c_leftleg",
			"c_leftfoot",
		},
		push_actors = {},
	},
	afro = {
		prio = 5,
		actors = {
			"c_afro",
		},
	},
}
PlayerBreedHitZones.kruber_breed_hit_zones = {
	full = {
		prio = 1,
		actors = {},
	},
	torso = {
		prio = 1,
		actors = {
			"c_head",
			"c_neck",
			"c_spine",
			"c_hips",
			"c_leftshoulder",
			"c_rightshoulder",
			"c_leftarm",
			"c_leftforearm",
			"c_lefthand",
			"c_rightarm",
			"c_rightforearm",
			"c_righthand",
			"c_rightupleg",
			"c_rightleg",
			"c_rightfoot",
			"c_leftupleg",
			"c_leftleg",
			"c_leftfoot",
		},
		push_actors = {},
	},
	afro = {
		prio = 5,
		actors = {
			"c_afro",
		},
	},
}
PlayerBreeds.hero_we_waywatcher = {
	armor_category = 4,
	awards_positive_reinforcement_message = true,
	cannot_be_aggroed = true,
	disable_local_hit_reactions = true,
	is_hero = true,
	is_player = true,
	name = "hero_we_waywatcher",
	poison_resistance = 0,
	threat_value = 8,
	vortexable = true,
	hit_zones = PlayerBreedHitZones.player_breed_hit_zones,
	status_effect_settings = {
		category = "small",
	},
}
PlayerBreeds.hero_we_maidenguard = {
	armor_category = 4,
	awards_positive_reinforcement_message = true,
	cannot_be_aggroed = true,
	disable_local_hit_reactions = true,
	is_hero = true,
	is_player = true,
	name = "hero_we_maidenguard",
	poison_resistance = 0,
	threat_value = 8,
	vortexable = true,
	hit_zones = PlayerBreedHitZones.player_breed_hit_zones,
	status_effect_settings = {
		category = "small",
	},
}
PlayerBreeds.hero_we_shade = {
	armor_category = 4,
	awards_positive_reinforcement_message = true,
	cannot_be_aggroed = true,
	disable_local_hit_reactions = true,
	is_hero = true,
	is_player = true,
	name = "hero_we_shade",
	poison_resistance = 0,
	threat_value = 8,
	vortexable = true,
	hit_zones = PlayerBreedHitZones.player_breed_hit_zones,
	status_effect_settings = {
		category = "small",
	},
}
PlayerBreeds.hero_bw_scholar = {
	armor_category = 4,
	awards_positive_reinforcement_message = true,
	cannot_be_aggroed = true,
	disable_local_hit_reactions = true,
	is_hero = true,
	is_player = true,
	name = "hero_bw_scholar",
	poison_resistance = 0,
	threat_value = 8,
	vortexable = true,
	hit_zones = PlayerBreedHitZones.player_breed_hit_zones,
	status_effect_settings = {
		category = "small",
	},
}
PlayerBreeds.hero_bw_adept = {
	armor_category = 4,
	awards_positive_reinforcement_message = true,
	cannot_be_aggroed = true,
	disable_local_hit_reactions = true,
	is_hero = true,
	is_player = true,
	name = "hero_bw_adept",
	poison_resistance = 0,
	threat_value = 8,
	vortexable = true,
	hit_zones = PlayerBreedHitZones.player_breed_hit_zones,
	status_effect_settings = {
		category = "small",
	},
}
PlayerBreeds.hero_bw_unchained = {
	armor_category = 4,
	awards_positive_reinforcement_message = true,
	cannot_be_aggroed = true,
	disable_local_hit_reactions = true,
	is_hero = true,
	is_player = true,
	name = "hero_bw_unchained",
	poison_resistance = 0,
	threat_value = 8,
	vortexable = true,
	hit_zones = PlayerBreedHitZones.player_breed_hit_zones,
	status_effect_settings = {
		category = "small",
	},
}
PlayerBreeds.hero_dr_ranger = {
	armor_category = 4,
	awards_positive_reinforcement_message = true,
	cannot_be_aggroed = true,
	disable_local_hit_reactions = true,
	is_hero = true,
	is_player = true,
	name = "hero_dr_ranger",
	poison_resistance = 0,
	threat_value = 8,
	vortexable = true,
	hit_zones = PlayerBreedHitZones.player_breed_hit_zones,
	status_effect_settings = {
		category = "small",
	},
}
PlayerBreeds.hero_dr_ironbreaker = {
	armor_category = 4,
	awards_positive_reinforcement_message = true,
	cannot_be_aggroed = true,
	disable_local_hit_reactions = true,
	is_hero = true,
	is_player = true,
	name = "hero_dr_ironbreaker",
	poison_resistance = 0,
	threat_value = 8,
	vortexable = true,
	hit_zones = PlayerBreedHitZones.player_breed_hit_zones,
	status_effect_settings = {
		category = "small",
	},
}
PlayerBreeds.hero_dr_slayer = {
	armor_category = 4,
	awards_positive_reinforcement_message = true,
	cannot_be_aggroed = true,
	disable_local_hit_reactions = true,
	is_hero = true,
	is_player = true,
	name = "hero_dr_slayer",
	poison_resistance = 0,
	threat_value = 8,
	vortexable = true,
	hit_zones = PlayerBreedHitZones.player_breed_hit_zones,
	status_effect_settings = {
		category = "small",
	},
}
PlayerBreeds.hero_es_mercenary = {
	armor_category = 4,
	awards_positive_reinforcement_message = true,
	cannot_be_aggroed = true,
	disable_local_hit_reactions = true,
	is_hero = true,
	is_player = true,
	name = "hero_es_mercenary",
	poison_resistance = 0,
	threat_value = 8,
	vortexable = true,
	hit_zones = PlayerBreedHitZones.kruber_breed_hit_zones,
	status_effect_settings = {
		category = "small",
	},
}
PlayerBreeds.hero_es_huntsman = {
	armor_category = 4,
	awards_positive_reinforcement_message = true,
	cannot_be_aggroed = true,
	disable_local_hit_reactions = true,
	is_hero = true,
	is_player = true,
	name = "hero_es_huntsman",
	poison_resistance = 0,
	threat_value = 8,
	vortexable = true,
	hit_zones = PlayerBreedHitZones.kruber_breed_hit_zones,
	status_effect_settings = {
		category = "small",
	},
}
PlayerBreeds.hero_es_knight = {
	armor_category = 4,
	awards_positive_reinforcement_message = true,
	cannot_be_aggroed = true,
	disable_local_hit_reactions = true,
	is_hero = true,
	is_player = true,
	name = "hero_es_knight",
	poison_resistance = 0,
	threat_value = 8,
	vortexable = true,
	hit_zones = PlayerBreedHitZones.kruber_breed_hit_zones,
	status_effect_settings = {
		category = "small",
	},
}
PlayerBreeds.hero_wh_zealot = {
	armor_category = 4,
	awards_positive_reinforcement_message = true,
	cannot_be_aggroed = true,
	disable_local_hit_reactions = true,
	is_hero = true,
	is_player = true,
	name = "hero_wh_zealot",
	poison_resistance = 0,
	threat_value = 8,
	vortexable = true,
	hit_zones = PlayerBreedHitZones.player_breed_hit_zones,
	status_effect_settings = {
		category = "small",
	},
}
PlayerBreeds.hero_wh_bountyhunter = {
	armor_category = 4,
	awards_positive_reinforcement_message = true,
	cannot_be_aggroed = true,
	disable_local_hit_reactions = true,
	is_hero = true,
	is_player = true,
	name = "hero_wh_bountyhunter",
	poison_resistance = 0,
	threat_value = 8,
	vortexable = true,
	hit_zones = PlayerBreedHitZones.player_breed_hit_zones,
	status_effect_settings = {
		category = "small",
	},
}
PlayerBreeds.hero_wh_captain = {
	armor_category = 4,
	awards_positive_reinforcement_message = true,
	cannot_be_aggroed = true,
	disable_local_hit_reactions = true,
	is_hero = true,
	is_player = true,
	name = "hero_wh_captain",
	poison_resistance = 0,
	threat_value = 8,
	vortexable = true,
	hit_zones = PlayerBreedHitZones.player_breed_hit_zones,
	status_effect_settings = {
		category = "small",
	},
}

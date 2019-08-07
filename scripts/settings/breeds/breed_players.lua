PlayerBreeds = {}
local player_breed_hit_zones = {
	full = {
		prio = 1,
		actors = {}
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
			"c_leftfoot"
		},
		push_actors = {}
	},
	afro = {
		prio = 5,
		actors = {
			"c_afro"
		}
	}
}
local kruber_breed_hit_zones = {
	full = {
		prio = 1,
		actors = {}
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
			"c_leftfoot"
		},
		push_actors = {}
	},
	afro = {
		prio = 5,
		actors = {
			"c_afro"
		}
	}
}
PlayerBreeds.hero_we_waywatcher = {
	is_hero = true,
	name = "hero_we_waywatcher",
	vortexable = true,
	awards_positive_reinforcement_message = true,
	is_player = true,
	disable_local_hit_reactions = true,
	poison_resistance = 0,
	armor_category = 4,
	threat_value = 8,
	hit_zones = player_breed_hit_zones
}
PlayerBreeds.hero_we_maidenguard = {
	is_hero = true,
	name = "hero_we_maidenguard",
	vortexable = true,
	awards_positive_reinforcement_message = true,
	is_player = true,
	disable_local_hit_reactions = true,
	poison_resistance = 0,
	armor_category = 4,
	threat_value = 8,
	hit_zones = player_breed_hit_zones
}
PlayerBreeds.hero_we_shade = {
	is_hero = true,
	name = "hero_we_shade",
	vortexable = true,
	awards_positive_reinforcement_message = true,
	is_player = true,
	disable_local_hit_reactions = true,
	poison_resistance = 0,
	armor_category = 4,
	threat_value = 8,
	hit_zones = player_breed_hit_zones
}
PlayerBreeds.hero_bw_scholar = {
	is_hero = true,
	name = "hero_bw_scholar",
	vortexable = true,
	awards_positive_reinforcement_message = true,
	is_player = true,
	disable_local_hit_reactions = true,
	poison_resistance = 0,
	armor_category = 4,
	threat_value = 8,
	hit_zones = player_breed_hit_zones
}
PlayerBreeds.hero_bw_adept = {
	is_hero = true,
	name = "hero_bw_adept",
	vortexable = true,
	awards_positive_reinforcement_message = true,
	is_player = true,
	disable_local_hit_reactions = true,
	poison_resistance = 0,
	armor_category = 4,
	threat_value = 8,
	hit_zones = player_breed_hit_zones
}
PlayerBreeds.hero_bw_unchained = {
	is_hero = true,
	name = "hero_bw_unchained",
	vortexable = true,
	awards_positive_reinforcement_message = true,
	is_player = true,
	disable_local_hit_reactions = true,
	poison_resistance = 0,
	armor_category = 4,
	threat_value = 8,
	hit_zones = player_breed_hit_zones
}
PlayerBreeds.hero_dr_ranger = {
	is_hero = true,
	name = "hero_dr_ranger",
	vortexable = true,
	awards_positive_reinforcement_message = true,
	is_player = true,
	disable_local_hit_reactions = true,
	poison_resistance = 0,
	armor_category = 4,
	threat_value = 8,
	hit_zones = player_breed_hit_zones
}
PlayerBreeds.hero_dr_ironbreaker = {
	is_hero = true,
	name = "hero_dr_ironbreaker",
	vortexable = true,
	awards_positive_reinforcement_message = true,
	is_player = true,
	disable_local_hit_reactions = true,
	poison_resistance = 0,
	armor_category = 4,
	threat_value = 8,
	hit_zones = player_breed_hit_zones
}
PlayerBreeds.hero_dr_slayer = {
	is_hero = true,
	name = "hero_dr_slayer",
	vortexable = true,
	awards_positive_reinforcement_message = true,
	is_player = true,
	disable_local_hit_reactions = true,
	poison_resistance = 0,
	armor_category = 4,
	threat_value = 8,
	hit_zones = player_breed_hit_zones
}
PlayerBreeds.hero_es_mercenary = {
	is_hero = true,
	name = "hero_es_mercenary",
	vortexable = true,
	awards_positive_reinforcement_message = true,
	is_player = true,
	disable_local_hit_reactions = true,
	poison_resistance = 0,
	armor_category = 4,
	threat_value = 8,
	hit_zones = kruber_breed_hit_zones
}
PlayerBreeds.hero_es_huntsman = {
	is_hero = true,
	name = "hero_es_huntsman",
	vortexable = true,
	awards_positive_reinforcement_message = true,
	is_player = true,
	disable_local_hit_reactions = true,
	poison_resistance = 0,
	armor_category = 4,
	threat_value = 8,
	hit_zones = kruber_breed_hit_zones
}
PlayerBreeds.hero_es_knight = {
	is_hero = true,
	name = "hero_es_knight",
	vortexable = true,
	awards_positive_reinforcement_message = true,
	is_player = true,
	disable_local_hit_reactions = true,
	poison_resistance = 0,
	armor_category = 4,
	threat_value = 8,
	hit_zones = kruber_breed_hit_zones
}
PlayerBreeds.hero_wh_zealot = {
	is_hero = true,
	name = "hero_wh_zealot",
	vortexable = true,
	awards_positive_reinforcement_message = true,
	is_player = true,
	disable_local_hit_reactions = true,
	poison_resistance = 0,
	armor_category = 4,
	threat_value = 8,
	hit_zones = player_breed_hit_zones
}
PlayerBreeds.hero_wh_bountyhunter = {
	is_hero = true,
	name = "hero_wh_bountyhunter",
	vortexable = true,
	awards_positive_reinforcement_message = true,
	is_player = true,
	disable_local_hit_reactions = true,
	poison_resistance = 0,
	armor_category = 4,
	threat_value = 8,
	hit_zones = player_breed_hit_zones
}
PlayerBreeds.hero_wh_captain = {
	is_hero = true,
	name = "hero_wh_captain",
	vortexable = true,
	awards_positive_reinforcement_message = true,
	is_player = true,
	disable_local_hit_reactions = true,
	poison_resistance = 0,
	armor_category = 4,
	threat_value = 8,
	hit_zones = player_breed_hit_zones
}

return

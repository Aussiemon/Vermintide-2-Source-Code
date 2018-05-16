breed_data = {
	attack_player_sound_event = "Play_slave_rat_attack_player_vce",
	has_inventory = true,
	smart_targeting_width = 0.1,
	scale_death_push = 1,
	flingable = true,
	run_speed = 4.25,
	walk_speed = 2.5,
	race = "skaven",
	exchange_order = 5,
	animation_sync_rpc = "rpc_sync_anim_state_7",
	target_selection = "pick_closest_target_with_spillover",
	opt_base_unit = "units/beings/enemies/skaven_clan_rat/chr_skaven_slave_baked",
	enter_walk_distance = 0.1,
	poison_resistance = 70,
	armor_category = 1,
	hit_reaction = "ai_default",
	bone_lod_level = 1,
	radius = 1.75,
	default_inventory_template = "default",
	stagger_resistance = 1,
	smart_targeting_outer_width = 0.5,
	unit_variation_setting_name = "skaven_slave",
	hit_effect_template = "HitEffectsSkavenSlave",
	smart_targeting_height_multiplier = 3,
	passive_walk_speed = 2,
	horde_behavior = "horde_rat",
	detection_radius = 10,
	unit_template = "ai_unit_clan_rat",
	hit_mass_count = 1,
	smart_object_template = "default_clan_rat",
	perception_previous_attacker_stickyness_value = -12.5,
	leave_walk_distance = 1,
	dialogue_source_name = "skaven_slave",
	wwise_voice_switch_group = "clan_rat_vce",
	death_reaction = "ai_default",
	perception = "perception_regular",
	player_locomotion_constrain_radius = 0.7,
	backstab_player_sound_event = "Play_clan_rat_attack_player_back_vce",
	death_sound_event = "Play_slave_rat_die_vce",
	weapon_reach = 2,
	attack_general_sound_event = "Play_slave_rat_attack_husk_vce",
	horde_target_selection = "horde_pick_closest_target_with_spillover",
	use_backstab_vo = true,
	has_running_attack = true,
	vortexable = true,
	behavior = "pack_rat",
	base_unit = "units/beings/enemies/skaven_clan_rat/chr_skaven_slave",
	aoe_height = 1.2,
	threat_value = 1,
	size_variation_range = {
		0.85,
		0.95
	},
	animation_merge_options = {
		idle_animation_merge_options = {},
		move_animation_merge_options = {},
		walk_animation_merge_options = {},
		interest_point_animation_merge_options = {}
	},
	hitzone_multiplier_types = {
		head = "headshot"
	},
	hit_zones = {
		full = {
			prio = 1,
			actors = {}
		},
		head = {
			prio = 1,
			actors = {
				"c_head"
			},
			push_actors = {
				"j_head",
				"j_neck",
				"j_spine1"
			}
		},
		neck = {
			prio = 1,
			actors = {
				"c_neck"
			},
			push_actors = {
				"j_head",
				"j_neck",
				"j_spine1"
			}
		},
		torso = {
			prio = 3,
			actors = {
				"c_spine2",
				"c_spine",
				"c_hips"
			},
			push_actors = {
				"j_neck",
				"j_spine1",
				"j_hips"
			}
		},
		left_arm = {
			prio = 4,
			actors = {
				"c_leftarm",
				"c_leftforearm",
				"c_lefthand"
			},
			push_actors = {
				"j_spine1",
				"j_leftshoulder",
				"j_leftarm"
			}
		},
		right_arm = {
			prio = 4,
			actors = {
				"c_rightarm",
				"c_rightforearm",
				"c_righthand"
			},
			push_actors = {
				"j_spine1",
				"j_rightshoulder",
				"j_rightarm"
			}
		},
		left_leg = {
			prio = 4,
			actors = {
				"c_leftupleg",
				"c_leftleg",
				"c_leftfoot",
				"c_lefttoebase"
			},
			push_actors = {
				"j_leftfoot",
				"j_rightfoot",
				"j_hips"
			}
		},
		right_leg = {
			prio = 4,
			actors = {
				"c_rightupleg",
				"c_rightleg",
				"c_rightfoot",
				"c_righttoebase"
			},
			push_actors = {
				"j_leftfoot",
				"j_rightfoot",
				"j_hips"
			}
		},
		tail = {
			prio = 4,
			actors = {
				"c_tail1",
				"c_tail2",
				"c_tail3",
				"c_tail4",
				"c_tail5",
				"c_tail6"
			},
			push_actors = {
				"j_hips",
				"j_taill"
			}
		},
		afro = {
			prio = 5,
			actors = {
				"c_afro"
			}
		}
	},
	hitbox_ragdoll_translation = {
		c_leftupleg = "j_leftupleg",
		c_rightarm = "j_rightarm",
		c_righthand = "j_righthand",
		c_rightfoot = "j_rightfoot",
		c_tail2 = "j_tail2",
		c_rightleg = "j_rightleg",
		c_lefthand = "j_lefthand",
		c_tail5 = "j_tail5",
		c_leftleg = "j_leftleg",
		c_spine2 = "j_spine1",
		c_tail6 = "j_tail6",
		c_rightupleg = "j_rightupleg",
		c_tail1 = "j_taill",
		c_tail4 = "j_tail4",
		c_spine = "j_spine",
		c_head = "j_head",
		c_leftforearm = "j_leftforearm",
		c_righttoebase = "j_righttoebase",
		c_leftfoot = "j_leftfoot",
		c_neck = "j_neck",
		c_tail3 = "j_tail3",
		c_rightforearm = "j_rightforearm",
		c_leftarm = "j_leftarm",
		c_hips = "j_hips",
		c_lefttoebase = "j_lefttoebase"
	},
	ragdoll_actor_thickness = {
		j_rightfoot = 0.15,
		j_taill = 0.05,
		j_leftarm = 0.15,
		j_leftforearm = 0.15,
		j_leftleg = 0.15,
		j_tail3 = 0.05,
		j_neck_1 = 0.2,
		j_leftupleg = 0.15,
		j_rightshoulder = 0.2,
		j_rightarm = 0.15,
		j_righttoebase = 0.15,
		j_tail4 = 0.05,
		j_hips = 0.2,
		j_spine1 = 0.2,
		j_rightleg = 0.15,
		j_leftfoot = 0.15,
		j_leftshoulder = 0.2,
		j_tail5 = 0.05,
		j_rightupleg = 0.15,
		j_righthand = 0.15,
		j_lefttoebase = 0.15,
		j_head = 0.3,
		j_tail6 = 0.05,
		j_neck = 0.2,
		j_spine = 0.2,
		j_lefthand = 0.15,
		j_rightforearm = 0.15,
		j_tail2 = 0.05
	},
	max_health = {
		2.5,
		2.5,
		3.5,
		5,
		7.5
	},
	diff_stagger_resist = {
		1,
		1,
		1.3,
		1.6,
		1.6
	},
	stagger_duration = {
		1,
		2,
		3,
		1.5,
		2,
		5,
		1,
		1
	},
	hit_mass_counts = {
		1,
		1,
		1.5,
		2,
		2
	},
	num_push_anims = {
		push_backward = 4
	},
	wwise_voices = {
		"slave_james",
		"slave_magnus"
	},
	debug_color = {
		255,
		240,
		90,
		10
	}
}
Breeds.skaven_slave = table.create_copy(Breeds.skaven_slave, breed_data)

return

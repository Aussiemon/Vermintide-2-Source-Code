-- chunkname: @scripts/settings/breeds/breed_skaven_explosive_loot_rat.lua

local breed_data = {
	animation_sync_rpc = "rpc_sync_anim_state_4",
	aoe_height = 1,
	armor_category = 1,
	awards_positive_reinforcement_message = true,
	base_unit = "units/beings/enemies/skaven_mutator_slave_rat/chr_skaven_mutator_slave_rat",
	behavior = "explosive_loot_rat",
	bone_lod_level = 1,
	death_reaction = "explosive_loot_rat",
	debug_spawn_category = "Misc",
	default_inventory_template = "empty",
	default_spawn_animation = "to_combat",
	detection_radius = 999,
	enter_walk_distance = 1,
	exchange_order = 1,
	flingable = true,
	has_inventory = true,
	height = 1.5,
	hit_effect_template = "HitEffectsSkavenLootRat",
	hit_reaction = "ai_default",
	initial_is_passive = false,
	is_always_spawnable = true,
	leave_walk_distance = 2,
	minion_detection_radius = 7,
	no_stagger_duration = false,
	perception = "perception_all_seeing",
	player_locomotion_constrain_radius = 0.7,
	poison_resistance = 70,
	proximity_system_check = true,
	race = "skaven",
	radius = 1,
	run_speed = 5,
	slot_template = "skaven_roamer",
	smart_object_template = "special",
	smart_targeting_height_multiplier = 3.5,
	smart_targeting_outer_width = 0.6,
	smart_targeting_width = 0.2,
	target_selection = "pick_closest_target",
	threat_value = 0,
	unit_template = "ai_unit_clan_rat",
	use_slot_type = "large",
	vortexable = true,
	walk_speed = 3,
	weapon_reach = 1.6,
	wield_inventory_on_spawn = true,
	infighting = InfightingSettings.small,
	max_health = {
		5,
		5,
		7.5,
		10,
		15,
		15,
		15,
		15,
	},
	bloodlust_health = BreedTweaks.bloodlust_health.skaven_roamer,
	stagger_duration = {
		1.5,
		1.5,
		2,
		2,
		2,
		2,
		2,
		2,
	},
	status_effect_settings = {
		category = "small",
		ignored_statuses = table.set({
			StatusEffectNames.burning_warpfire,
		}),
	},
	debug_color = {
		255,
		100,
		200,
		200,
	},
	hitzone_multiplier_types = {
		head = "headshot",
	},
	hit_zones = {
		head = {
			prio = 1,
			actors = {
				"c_head",
			},
			push_actors = {
				"j_head",
				"j_neck",
				"j_spine1",
			},
		},
		neck = {
			prio = 1,
			actors = {
				"c_neck",
			},
			push_actors = {
				"j_head",
				"j_neck",
				"j_spine1",
			},
		},
		torso = {
			prio = 2,
			actors = {
				"c_spine2",
				"c_spine",
				"c_hips",
			},
			push_actors = {
				"j_neck",
				"j_spine1",
				"j_hips",
			},
		},
		left_arm = {
			prio = 3,
			actors = {
				"c_leftarm",
				"c_leftforearm",
				"c_lefthand",
			},
			push_actors = {
				"j_spine1",
				"j_leftshoulder",
				"j_leftarm",
			},
		},
		right_arm = {
			prio = 3,
			actors = {
				"c_rightarm",
				"c_rightforearm",
				"c_righthand",
			},
			push_actors = {
				"j_spine1",
				"j_rightshoulder",
				"j_rightarm",
			},
		},
		left_leg = {
			prio = 3,
			actors = {
				"c_leftupleg",
				"c_leftleg",
				"c_leftfoot",
				"c_lefttoebase",
			},
			push_actors = {
				"j_leftfoot",
				"j_rightfoot",
				"j_hips",
			},
		},
		right_leg = {
			prio = 3,
			actors = {
				"c_rightupleg",
				"c_rightleg",
				"c_rightfoot",
				"c_righttoebase",
			},
			push_actors = {
				"j_leftfoot",
				"j_rightfoot",
				"j_hips",
			},
		},
		tail = {
			prio = 3,
			actors = {
				"c_tail1",
				"c_tail2",
				"c_tail3",
				"c_tail4",
				"c_tail5",
				"c_tail6",
			},
			push_actors = {
				"j_hips",
				"j_taill",
			},
		},
		full = {
			prio = 4,
			actors = {},
		},
		afro = {
			prio = 5,
			actors = {
				"c_afro",
			},
		},
	},
	hitbox_ragdoll_translation = {
		c_head = "j_head",
		c_hips = "j_hips",
		c_leftarm = "j_leftarm",
		c_leftfoot = "j_leftfoot",
		c_leftforearm = "j_leftforearm",
		c_lefthand = "j_lefthand",
		c_leftleg = "j_leftleg",
		c_lefttoebase = "j_lefttoebase",
		c_leftupleg = "j_leftupleg",
		c_neck = "j_neck",
		c_rightarm = "j_rightarm",
		c_rightfoot = "j_rightfoot",
		c_rightforearm = "j_rightforearm",
		c_righthand = "j_righthand",
		c_rightleg = "j_rightleg",
		c_righttoebase = "j_righttoebase",
		c_rightupleg = "j_rightupleg",
		c_spine = "j_spine",
		c_spine2 = "j_spine1",
		c_tail1 = "j_taill",
		c_tail2 = "j_tail2",
		c_tail3 = "j_tail3",
		c_tail4 = "j_tail4",
		c_tail5 = "j_tail5",
		c_tail6 = "j_tail6",
	},
	ragdoll_actor_thickness = {
		j_head = 0.3,
		j_hips = 0.3,
		j_leftarm = 0.2,
		j_leftfoot = 0.2,
		j_leftforearm = 0.2,
		j_lefthand = 0.2,
		j_leftleg = 0.2,
		j_leftshoulder = 0.3,
		j_lefttoebase = 0.2,
		j_leftupleg = 0.2,
		j_neck = 0.3,
		j_rightarm = 0.2,
		j_rightfoot = 0.2,
		j_rightforearm = 0.2,
		j_righthand = 0.2,
		j_rightleg = 0.2,
		j_rightshoulder = 0.3,
		j_righttoebase = 0.2,
		j_rightupleg = 0.2,
		j_spine = 0.3,
		j_spine1 = 0.3,
		j_tail2 = 0.05,
		j_tail3 = 0.05,
		j_tail4 = 0.05,
		j_tail5 = 0.05,
		j_tail6 = 0.05,
		j_taill = 0.05,
	},
	allowed_layers = {
		bot_poison_wind = 10,
		bot_ratling_gun_fire = 10,
		destructible_wall = 0,
		doors = 1.5,
		fire_grenade = 10,
		jumps = 10,
		ledges = 10,
		ledges_with_fence = 10,
		planks = 1.5,
		teleporters = 5,
		temporary_wall = 0,
	},
}

Breeds.skaven_explosive_loot_rat = table.create_copy(Breeds.skaven_explosive_loot_rat, breed_data)

local action_data = {
	smash_door = {
		attack_anim = "attack_pounce",
		damage = 1,
		damage_type = "cutting",
		move_anim = "move_fwd",
		unblockable = true,
	},
	alerted = {
		action_weight = 1,
		cooldown = -1,
		no_hesitation = true,
		start_anims_name = {
			bwd = "alerted_bwd",
			fwd = "alerted_fwd",
			left = "alerted_left",
			right = "alerted_right",
		},
		start_anims_data = {
			alerted_fwd = {},
			alerted_bwd = {
				dir = -1,
				rad = math.pi,
			},
			alerted_left = {
				dir = 1,
				rad = math.pi / 2,
			},
			alerted_right = {
				dir = -1,
				rad = math.pi / 2,
			},
		},
	},
	idle = {},
	follow = {
		action_weight = 1,
		cooldown = -1,
		start_anims_name = {
			bwd = "move_start_bwd",
			fwd = "move_start_fwd",
			left = "move_start_left",
			right = "move_start_right",
		},
		start_anims_data = {
			move_start_fwd = {},
			move_start_bwd = {
				dir = -1,
				rad = math.pi,
			},
			move_start_left = {
				dir = 1,
				rad = math.pi / 2,
			},
			move_start_right = {
				dir = -1,
				rad = math.pi / 2,
			},
		},
		considerations = UtilityConsiderations.troll_follow,
	},
	explosion_attack = {
		action_weight = 10,
		bot_threat_duration = 1,
		explode_animation = "stagger_fwd_exp",
		explosion_at_time = 0.5,
		radius = 3,
		considerations = UtilityConsiderations.rat_explosion_attack,
		ignore_staggers = {
			true,
			false,
			false,
			true,
			true,
			false,
		},
	},
	stagger = {
		stagger_anims = {
			{
				fwd = {
					"stun_bwd_sword",
				},
				bwd = {
					"stun_fwd_sword",
				},
				left = {
					"stun_left_sword",
					"stun_left_sword_2",
					"stun_left_sword_3",
				},
				right = {
					"stun_right_sword",
					"stun_right_sword_2",
					"stun_right_sword_3",
				},
				dwn = {
					"stun_down",
				},
			},
			{
				fwd = {
					"stagger_fwd",
					"stagger_fwd_2",
					"stagger_fwd_3",
					"stagger_fwd_4",
				},
				bwd = {
					"stagger_bwd",
					"stagger_bwd_2",
					"stagger_bwd_3",
					"stagger_bwd_4",
					"stagger_bwd_5",
				},
				left = {
					"stagger_left",
					"stagger_left_2",
					"stagger_left_3",
					"stagger_left_4",
				},
				right = {
					"stagger_right",
					"stagger_right_2",
					"stagger_right_3",
					"stagger_right_4",
				},
				dwn = {
					"stun_down",
				},
			},
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd_fall",
					"stagger_bwd_fall_2",
					"stagger_bwd_heavy",
					"stagger_bwd_heavy_2",
					"stagger_bwd_heavy_3",
					"stagger_bwd_heavy_4",
				},
				left = {
					"stagger_left_heavy",
					"stagger_left_heavy_2",
					"stagger_left_heavy_3",
					"stagger_left_heavy_4",
					"stagger_left_heavy_5",
				},
				right = {
					"stagger_right_heavy",
					"stagger_right_heavy_2",
					"stagger_right_heavy_3",
					"stagger_right_heavy_4",
					"stagger_right_heavy_5",
				},
				dwn = {
					"stun_down",
				},
			},
			{
				fwd = {
					"stun_fwd_ranged_light",
					"stun_fwd_ranged_light_2",
				},
				bwd = {
					"stun_bwd_ranged_light",
					"stun_bwd_ranged_light_2",
				},
				left = {
					"stun_left_ranged_light",
					"stun_left_ranged_light_2",
				},
				right = {
					"stun_right_ranged_light",
					"stun_right_ranged_light_2",
				},
			},
			{
				fwd = {
					"stagger_fwd_stab",
				},
				bwd = {
					"stagger_bwd_stab",
					"stagger_bwd_stab_2",
				},
				left = {
					"stagger_left_stab",
				},
				right = {
					"stagger_right_stab",
				},
			},
			{
				fwd = {
					"stagger_fwd_exp",
					"stagger_fwd_exp_2",
				},
				bwd = {
					"stagger_bwd_exp",
					"stagger_bwd_exp_2",
				},
				left = {
					"stagger_left_exp",
					"stagger_left_exp_2",
				},
				right = {
					"stagger_right_exp",
					"stagger_right_exp_2",
				},
			},
			{
				fwd = {
					"stagger_short_fwd",
					"stagger_short_fwd_2",
				},
				bwd = {
					"stagger_short_bwd",
					"stagger_short_bwd_2",
					"stagger_short_bwd_3",
					"stagger_short_bwd_4",
					"stagger_short_bwd_5",
				},
				left = {
					"stun_left_sword",
					"stun_left_sword_2",
					"stun_left_sword_3",
					"stagger_short_left",
					"stagger_short_left_2",
				},
				right = {
					"stun_right_sword",
					"stun_right_sword_2",
					"stun_right_sword_3",
					"stagger_short_right",
					"stagger_short_right_2",
				},
				dwn = {
					"stun_down",
				},
			},
			{
				fwd = {},
				bwd = {},
				left = {},
				right = {},
			},
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd_fall",
					"stagger_bwd_fall_2",
					"stagger_bwd_heavy",
					"stagger_bwd_heavy_2",
					"stagger_bwd_heavy_3",
					"stagger_bwd_heavy_4",
				},
				left = {
					"stagger_left_heavy",
					"stagger_left_heavy_2",
					"stagger_left_heavy_3",
					"stagger_left_heavy_4",
					"stagger_left_heavy_5",
				},
				right = {
					"stagger_right_heavy",
					"stagger_right_heavy_2",
					"stagger_right_heavy_3",
					"stagger_right_heavy_4",
					"stagger_right_heavy_5",
				},
				dwn = {
					"stun_down",
				},
			},
		},
	},
}

BreedActions.skaven_explosive_loot_rat = table.create_copy(BreedActions.skaven_explosive_loot_rat, action_data)

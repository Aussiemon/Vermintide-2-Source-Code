-- chunkname: @scripts/settings/breeds/breed_chaos_zombie.lua

local breed_data = {
	animation_sync_rpc = "rpc_sync_anim_state_2",
	aoe_height = 1.4,
	armor_category = 1,
	base_unit = "units/beings/enemies/chaos_nurgle_corpses/chr_npc_chaos_nurgle_corpse",
	behavior = "chaos_zombie",
	bone_lod_level = 1,
	death_reaction = "chaos_zombie",
	debug_spawn_category = "Misc",
	default_inventory_template = "zombie_blobs",
	default_spawn_animation = "spawn_idle",
	detection_radius = 12,
	die_on_vortex_land = true,
	during_horde_detection_radius = 15,
	enter_walk_distance = 4,
	exchange_order = 4,
	flingable = true,
	follow_reach = 1,
	has_inventory = true,
	has_running_attack = true,
	hesitation_timer = 7,
	hit_effect_template = "HitEffectsChaosZombie",
	hit_mass_count = 3,
	hit_reaction = "ai_default",
	horde_target_selection = "horde_pick_closest_target_with_spillover",
	is_bot_threat = true,
	leave_walk_distance = 5,
	passive_walk_speed = 2,
	perception = "perception_regular",
	perception_previous_attacker_stickyness_value = -7.75,
	player_locomotion_constrain_radius = 0.7,
	poison_resistance = 70,
	race = "chaos",
	radius = 1.5,
	run_speed = 2.5,
	scale_death_push = 0.35,
	smart_object_template = "chaos_zombie",
	smart_targeting_height_multiplier = 2,
	smart_targeting_outer_width = 0.75,
	smart_targeting_width = 0.2,
	stagger_resistance = 2,
	target_selection = "pick_closest_target_with_spillover",
	threat_value = 2.5,
	unit_template = "ai_unit_zombie",
	using_inventory_weakspots = true,
	vortexable = true,
	walk_speed = 2.5,
	weapon_reach = 2.25,
	infighting = InfightingSettings.small,
	perception_exceptions = {
		poison_well = true,
		wizard_destructible = true,
	},
	size_variation_range = {
		1,
		1.3,
	},
	max_health = {
		5,
		5,
		7.5,
		10,
		15,
		15,
		15,
		15,
		5,
	},
	diff_stagger_resist = {
		1.75,
		2,
		2.5,
		3,
		5,
	},
	hit_mass_counts = {
		3,
		3,
		4.5,
		6,
		9,
	},
	stagger_duration_difficulty_mod = BreedTweaks.stagger_duration_difficulty_mod.fast,
	debug_color = {
		255,
		200,
		40,
		40,
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
				"c_spine1",
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
				"c_leftshoulder",
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
				"c_rightshoulder",
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
			},
			push_actors = {
				"j_leftfoot",
				"j_rightfoot",
				"j_hips",
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
		c_leftshoulder = "j_leftshoulder",
		c_leftupleg = "j_leftupleg",
		c_neck = "j_neck",
		c_rightarm = "j_rightarm",
		c_rightfoot = "j_rightfoot",
		c_rightforearm = "j_rightforearm",
		c_righthand = "j_righthand",
		c_rightleg = "j_rightleg",
		c_rightshoulder = "j_rightshoulder",
		c_rightupleg = "j_rightupleg",
		c_spine = "j_spine",
		c_spine1 = "j_spine1",
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
	},
	allowed_layers = {
		bot_poison_wind = 1.5,
		bot_ratling_gun_fire = 1,
		doors = 1.5,
		fire_grenade = 1,
		jumps = 0,
		ledges = 1.5,
		ledges_with_fence = 0,
		planks = 1.5,
		teleporters = 5,
	},
}

Breeds.chaos_zombie = table.create_copy(Breeds.chaos_zombie, breed_data)

local action_data = {
	idle = {
		anim_cycle_index = 0,
		animations = {
			"idle_lying_down",
			"idle_lying_down_2",
			"idle_lying_down_3",
			"idle_lying_down_4",
		},
		combat_animations = {
			"idle",
		},
	},
	alerted = {
		close_range_alert_idle = true,
		no_hesitation = true,
		override_time_alerted = 3.5,
		alerted_anims = {
			"alerted",
		},
		start_anims_name = {
			bwd = "move_fwd",
			fwd = "move_fwd",
			left = "move_fwd",
			right = "move_fwd",
		},
		start_anims_data = {
			move_fwd = {},
		},
	},
	follow = {
		action_weight = 1,
		considerations = UtilityConsiderations.clan_rat_follow,
		start_anims_name = {
			bwd = "move_fwd",
			fwd = "move_fwd",
			left = "move_fwd",
			right = "move_fwd",
		},
		start_anims_data = {
			move_fwd = {},
		},
		walk_anims = {
			"move_fwd",
			"move_fwd",
			"move_fwd",
		},
	},
	explosion_attack = {
		action_weight = 10,
		bot_threat_duration = 1.5,
		damage_type = "poison",
		explode_animation = "attack_pounce",
		explosion_at_time = 1,
		radius = 4,
		considerations = UtilityConsiderations.marauder_attack,
	},
	blocked = {
		blocked_anims = {
			"blocked",
		},
	},
	stagger = {
		scale_animation_speeds = false,
		stagger_anims = {
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd",
				},
				left = {
					"stagger_left",
				},
				right = {
					"stagger_right",
				},
				dwn = {
					"stagger_bwd",
				},
			},
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd",
				},
				left = {
					"stagger_left",
				},
				right = {
					"stagger_right",
				},
				dwn = {
					"stagger_bwd",
				},
			},
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd",
				},
				left = {
					"stagger_left",
				},
				right = {
					"stagger_right",
				},
				dwn = {
					"stagger_bwd",
				},
			},
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd",
				},
				left = {
					"stagger_left",
				},
				right = {
					"stagger_right",
				},
				dwn = {
					"stagger_bwd",
				},
			},
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd",
				},
				left = {
					"stagger_left",
				},
				right = {
					"stagger_right",
				},
				dwn = {
					"stagger_bwd",
				},
			},
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd",
				},
				left = {
					"stagger_left",
				},
				right = {
					"stagger_right",
				},
				dwn = {
					"stagger_bwd",
				},
			},
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd",
				},
				left = {
					"stagger_left",
				},
				right = {
					"stagger_right",
				},
				dwn = {
					"stagger_bwd",
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
					"stagger_bwd",
				},
				left = {
					"stagger_left",
				},
				right = {
					"stagger_right",
				},
				dwn = {
					"stagger_bwd",
				},
			},
		},
	},
}

action_data.fallback_idle = action_data.idle
BreedActions.chaos_zombie = table.create_copy(BreedActions.chaos_zombie, action_data)

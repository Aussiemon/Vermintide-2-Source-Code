﻿-- chunkname: @scripts/settings/breeds/breed_skaven_ratling_gunner.lua

local breed_data = {
	ai_strength = 1,
	ai_toughness = 3,
	aim_template = "ratling_gunner",
	always_look_at_target = true,
	animation_sync_rpc = "rpc_sync_anim_state_4",
	aoe_height = 1.5,
	armor_category = 2,
	awards_positive_reinforcement_message = true,
	base_unit = "units/beings/enemies/skaven_ratlinggunner/chr_skaven_ratlinggunner",
	behavior = "skaven_ratling_gunner",
	bone_lod_level = 1,
	bots_flank_while_targeted = true,
	bots_should_flank = true,
	bots_stay_ranged = 10,
	death_reaction = "ai_default",
	death_sound_event = "Play_enemy_vo_ratling_gunner_die",
	default_inventory_template = "ratlinggun",
	exchange_order = 2,
	flingable = true,
	has_inventory = true,
	headshot_coop_stamina_fatigue_type = "headshot_special",
	hit_effect_template = "HitEffectsRatlingGunner",
	hit_reaction = "ai_default",
	is_always_spawnable = true,
	is_bot_aid_threat = true,
	minion_detection_radius = 20,
	no_stagger_duration = true,
	perception = "perception_all_seeing",
	perception_continuous = "perception_continuous_keep_target",
	perception_previous_attacker_stickyness_value = -20,
	player_locomotion_constrain_radius = 0.7,
	poison_resistance = 100,
	proximity_system_check = true,
	race = "skaven",
	radius = 1,
	run_speed = 4,
	scale_death_push = 2,
	smart_object_template = "special",
	smart_targeting_height_multiplier = 2.1,
	smart_targeting_outer_width = 0.7,
	smart_targeting_width = 0.3,
	spawning_rule = "always_ahead",
	special = true,
	stagger_resistance = 2.25,
	stagger_threshold_light = 0.5,
	target_selection = "pick_closest_target",
	threat_value = 8,
	unit_template = "ai_unit_ratling_gunner",
	vortexable = true,
	walk_speed = 1.9,
	weapon_reach = 2,
	wield_inventory_on_spawn = true,
	detection_radius = math.huge,
	infighting = InfightingSettings.small,
	size_variation_range = {
		1.1,
		1.1,
	},
	max_health = BreedTweaks.max_health.ratling_gunner,
	bloodlust_health = BreedTweaks.bloodlust_health.skaven_special,
	diff_stagger_resist = BreedTweaks.diff_stagger_resist.ratling_gunner,
	stagger_reduction = BreedTweaks.stagger_reduction.ratling_gunner,
	stagger_duration = {
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
	},
	status_effect_settings = {
		category = "small",
		ignored_statuses = table.set({
			StatusEffectNames.burning_warpfire,
		}),
	},
	debug_color = {
		255,
		200,
		200,
		0,
	},
	disabled = Development.setting("disable_ratling_gunner") or false,
	line_of_sight_cast_template = {
		"c_spine",
		"c_head",
		c_head = false,
		c_spine = false,
		current_index = 1,
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
				"j_spine1",
			},
		},
		neck = {
			prio = 1,
			actors = {
				"c_neck",
				"c_neck1",
			},
			push_actors = {
				"j_head",
				"j_spine1",
			},
		},
		torso = {
			prio = 2,
			actors = {
				"c_hips",
				"c_spine",
				"c_spine2",
				"c_leftshoulder",
				"c_rightshoulder",
			},
			push_actors = {
				"j_spine1",
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
			},
		},
		left_leg = {
			prio = 3,
			actors = {
				"c_leftleg",
				"c_leftupleg",
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
				"c_rightleg",
				"c_rightupleg",
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
			},
		},
		aux = {
			prio = 4,
			actors = {
				"c_backpack",
			},
			push_actors = {
				"j_backpack",
			},
		},
		full = {
			prio = 5,
			actors = {},
		},
		afro = {
			prio = 6,
			actors = {
				"c_afro",
			},
		},
	},
	custom_death_enter_function = function (unit, killer_unit, damage_type, death_hit_zone, t, damage_source)
		local blackboard = BLACKBOARDS[unit]

		if not Unit.alive(killer_unit) then
			return
		end

		QuestSettings.check_ratling_gunner_killed_by_melee(killer_unit, damage_source)
		QuestSettings.check_ratling_gunner_killed_while_shooting(blackboard, killer_unit)
	end,
}

Breeds.skaven_ratling_gunner = table.create_copy(Breeds.skaven_ratling_gunner, breed_data)

local action_data = {
	move_to_players = {
		find_target_function_name = "_find_target_ratling_gunner",
	},
	lurk = {
		check_distance = 35,
		move_anim = "move_fwd",
		move_speed = breed_data.walk_speed,
	},
	engage = {
		check_distance = 20,
		max_angle_step = 2,
		min_angle_step = 0,
		move_anim = "move_fwd_run",
		move_speed = breed_data.run_speed,
	},
	move_to_shoot_position = {
		move_anim = "move_fwd_run",
		move_speed = breed_data.run_speed,
		keep_target_distance = {
			15,
			20,
		},
	},
	wind_up_ratling_gun = {
		wind_up_time = {
			2,
			2,
		},
	},
	smash_door = {
		attack_anim = "smash_door",
		damage = 5,
		damage_type = "cutting",
		move_anim = "move_fwd",
		unblockable = true,
	},
	shoot_ratling_gun = {
		angle_speed = 20,
		fire_rate_at_end = 25,
		fire_rate_at_start = 10,
		light_weight_projectile_template_name = "ratling_gunner",
		max_fire_rate_at_percentage = 0.25,
		nav_obstacle_layer_name = "bot_ratling_gun_fire",
		attack_time = {
			7,
			10,
		},
		target_switch_distance = {
			15,
			15,
		},
		radial_speed_feet_shooting = math.pi * 0.725,
		radial_speed_upper_body_shooting = math.pi * 0.35,
		line_of_fire_nav_obstacle_half_extents = Vector3Box(1, 25, 1),
		arc_of_sight_nav_obstacle_half_extents = Vector3Box(5, 5, 1),
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
					"stun_fwd_sword",
					"stun_fwd_sword_2",
				},
				bwd = {
					"stun_bwd_sword",
					"stun_bwd_sword_2",
				},
				left = {
					"stun_left_sword",
					"stun_left_sword_2",
				},
				right = {
					"stun_right_sword",
					"stun_right_sword_2",
				},
			},
			{
				fwd = {
					"stagger_fwd",
					"stagger_fwd_2",
				},
				bwd = {
					"stagger_bwd",
					"stagger_bwd_2",
				},
				left = {
					"stagger_left",
					"stagger_left_2",
				},
				right = {
					"stagger_right",
					"stagger_right_2",
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
			},
			{
				fwd = {
					"stun_ranged_fwd",
				},
				bwd = {
					"stun_ranged_bwd",
				},
				left = {
					"stun_ranged_left",
				},
				right = {
					"stun_ranged_right",
				},
			},
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd_stab",
				},
				left = {
					"stagger_left",
				},
				right = {
					"stagger_right",
				},
			},
			{
				fwd = {
					"stagger_fwd_exp",
				},
				bwd = {
					"stagger_bwd_exp",
				},
				left = {
					"stagger_left_exp",
				},
				right = {
					"stagger_right_exp",
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
			},
		},
	},
}

BreedActions.skaven_ratling_gunner = table.create_copy(BreedActions.skaven_ratling_gunner, action_data)

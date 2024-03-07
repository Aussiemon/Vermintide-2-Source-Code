-- chunkname: @scripts/settings/breeds/breed_skaven_warpfire_thrower.lua

local stagger_types = require("scripts/utils/stagger_types")
local breed_data = {
	ai_strength = 2,
	ai_toughness = 3,
	aim_template = "warpfire_thrower",
	always_look_at_target = true,
	animation_sync_rpc = "rpc_sync_anim_state_4",
	aoe_height = 1.5,
	armor_category = 2,
	awards_positive_reinforcement_message = true,
	base_unit = "units/beings/enemies/skaven_warpfire_thrower/chr_skaven_warpfire_thrower",
	behavior = "skaven_warpfire_thrower",
	bone_lod_level = 1,
	bots_flank_while_targeted = true,
	bots_should_flank = true,
	bots_stay_ranged = 15,
	death_reaction = "warpfire_thrower",
	death_sound_event = "Play_enemy_vo_warpfire_die",
	default_inventory_template = "warpfiregun",
	dialogue_source_name = "skaven_warpfire_thrower",
	exchange_order = 2,
	flingable = true,
	has_inventory = true,
	headshot_coop_stamina_fatigue_type = "headshot_special",
	height = 1.5,
	hit_effect_template = "HitEffectsRatlingGunner",
	hit_reaction = "ai_default",
	is_always_spawnable = true,
	is_bot_aid_threat = true,
	minion_detection_radius = 10,
	no_stagger_duration = true,
	perception = "perception_all_seeing",
	player_locomotion_constrain_radius = 0.7,
	poison_resistance = 100,
	proximity_system_check = true,
	race = "skaven",
	radius = 1,
	run_speed = 4.5,
	smart_object_template = "special",
	smart_targeting_height_multiplier = 2.1,
	smart_targeting_outer_width = 0.7,
	smart_targeting_width = 0.3,
	spawning_rule = "always_ahead",
	special = true,
	stagger_resistance = 2.25,
	stagger_threshold_light = 0.5,
	switch_target_radius = 20,
	target_selection = "pick_pack_master_target",
	threat_value = 8,
	unit_template = "ai_unit_warpfire_thrower",
	vortexable = true,
	walk_speed = 2,
	wield_inventory_on_spawn = true,
	detection_radius = math.huge,
	infighting = InfightingSettings.small,
	size_variation_range = {
		1.1,
		1.1,
	},
	max_health = BreedTweaks.max_health.warpfire_thrower,
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
	disabled = Development.setting("disable_warpfire_thrower") or false,
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
	nav_cost_map_allowed_layers = {
		lamp_oil_fire = 10,
		plague_wave = 20,
		stormfiend_warpfire = 1,
		troll_bile = 20,
		vortex_danger_zone = 1,
		vortex_near = 1,
		warpfire_thrower_warpfire = 1,
	},
	custom_death_enter_function = function (unit, killer_unit, damage_type, death_hit_zone)
		local blackboard = BLACKBOARDS[unit]

		if not Unit.alive(killer_unit) then
			return
		end

		QuestSettings.check_warpfire_kill_before_shooting(blackboard, killer_unit)
		QuestSettings.check_warpfire_kill_on_power_cell(death_hit_zone, killer_unit)
	end,
}

Breeds.skaven_warpfire_thrower = table.create_copy(Breeds.skaven_warpfire_thrower, breed_data)

local action_data = {
	skulk = {
		dogpile_aggro_needed = 2,
		melee_override_distance_sqr = 100,
		skulk_animation = "move_start_fwd",
		skulk_time = 1,
		skulk_time_force_attack = 10,
	},
	follow = {
		distance_to_attack = 10,
		move_animation = "move_start_fwd",
	},
	smash_door = {
		attack_anim = "smash_door",
		damage = 5,
		damage_type = "cutting",
		move_anim = "move_fwd",
		name = "smash_door",
		unblockable = true,
	},
	shoot_warpfire_thrower = {
		action_weight = 1,
		aim_rotation_dodge_multipler = 0.15,
		aim_rotation_override_distance = 3,
		aim_rotation_override_speed_multiplier = 1.5,
		bot_threat_duration = 4.233333333333333,
		bot_threat_height = 2,
		bot_threat_offset_forward = 0,
		bot_threat_offset_up = 0,
		bot_threat_radius = 15,
		bot_threat_start_time = 0.7666666666666667,
		buff_name = "warpfire_thrower_face_base",
		close_attack_cooldown = 0.3,
		close_attack_range = 15,
		firing_time = 5,
		hit_radius = 0.4,
		minimum_length = 0.1,
		muzzle_node = "p_fx",
		rotation_speed = 80,
		target_switch_distance = 20,
		warpfire_follow_target_speed = 0.75,
		considerations = UtilityConsiderations.shoot_warpfire_thrower,
		attack_anims = {
			bwd = "turn_bwd",
			fwd = "turn_right",
			left = "turn_left",
			right = "turn_right",
		},
		radial_speed_upper_body_shooting = math.pi * 0.5,
		radial_speed_feet_shooting = math.pi * 1.9,
		ai_push_data = {
			stagger_distance = 1,
			stagger_impact = {
				stagger_types.medium,
				stagger_types.medium,
				stagger_types.medium,
				stagger_types.weak,
				stagger_types.weak,
			},
			stagger_duration = {
				2,
				2,
				0,
				0,
				4,
			},
		},
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

BreedActions.skaven_warpfire_thrower = table.create_copy(BreedActions.skaven_warpfire_thrower, action_data)

-- chunkname: @scripts/settings/breeds/breed_skaven_poison_wind_globadier.lua

local breed_data = {
	ai_strength = 1,
	ai_toughness = 1,
	animation_sync_rpc = "rpc_sync_anim_state_3",
	aoe_height = 1.5,
	armor_category = 1,
	awards_positive_reinforcement_message = true,
	base_unit = "units/beings/enemies/skaven_wind_globadier/chr_skaven_wind_globadier",
	behavior = "skaven_poison_wind_globadier",
	bone_lod_level = 1,
	death_reaction = "poison_globadier",
	death_sound_event = "Play_globadier_death_vce",
	debug_flag = "ai_globadier_behavior",
	exchange_order = 2,
	flingable = true,
	headshot_coop_stamina_fatigue_type = "headshot_special",
	hit_effect_template = "HitEffectsPoisonWind",
	hit_reaction = "ai_default",
	is_always_spawnable = true,
	is_bot_aid_threat = true,
	max_globe_throw_speed = 16383,
	minion_detection_radius = 20,
	no_stagger_duration = true,
	perception = "perception_all_seeing",
	perception_continuous = "perception_continuous_keep_target",
	player_locomotion_constrain_radius = 0.7,
	poison_resistance = 100,
	proximity_system_check = true,
	race = "skaven",
	radius = 1,
	run_speed = 5,
	scale_death_push = 2,
	smart_object_template = "special",
	smart_targeting_height_multiplier = 2.2,
	smart_targeting_outer_width = 0.7,
	smart_targeting_width = 0.3,
	special = true,
	target_selection = "pick_closest_target",
	threat_value = 8,
	unit_template = "ai_unit_poison_wind_globadier",
	vortexable = true,
	walk_speed = 2.5,
	detection_radius = math.huge,
	infighting = InfightingSettings.small,
	max_health = BreedTweaks.max_health.globadier,
	bloodlust_health = BreedTweaks.bloodlust_health.skaven_special,
	stagger_duration = {
		0.5,
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
	debug_class = DebugGlobadier,
	debug_color = {
		255,
		200,
		200,
		0,
	},
	disabled = Development.setting("disable_globadier") or false,
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
				"c_compressor_valve",
				"c_compressor",
				"c_backpack_can",
				"c_backpack_bag",
				"c_ballsling_ball",
			},
			push_actors = {
				"j_backpack_root",
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
	allowed_layers = {
		bot_poison_wind = 2,
		bot_ratling_gun_fire = 10,
		destructible_wall = 0,
		doors = 1.5,
		fire_grenade = 10,
		jumps = 5,
		ledges = 5,
		ledges_with_fence = 5,
		planks = 1.5,
		teleporters = 5,
		temporary_wall = 0,
	},
	custom_death_enter_function = function (unit, killer_unit, damage_type, death_hit_zone)
		local blackboard = BLACKBOARDS[unit]

		if not Unit.alive(killer_unit) then
			return
		end

		QuestSettings.check_globadier_kill_before_throwing(blackboard, killer_unit)
		QuestSettings.check_globadier_kill_during_suicide(blackboard, unit, killer_unit)
	end,
}

Breeds.skaven_poison_wind_globadier = table.create_copy(Breeds.skaven_poison_wind_globadier, breed_data)

local GLOBE_RADIUS = 4
local action_data = {
	skulk_approach = {
		commit_distance = 40,
		decrease_radius_speed = 0.5,
		skulk_init_distance = 50,
	},
	move_to_players = {
		attack_distance = 25,
		find_target_function_name = "_find_target_globadier",
		attack_throw_offset = {
			0.1281,
			1.1719,
			1.3749,
		},
	},
	advance_towards_players = {
		exit_to_skulk_distance = 45,
		ignore_LOS_check_after_first_throw = false,
		range = 40,
		slot_count_distance_modifier = 1,
		slot_count_time_modifier = -0.5,
		time_before_throw_distance_modifier = 2,
		time_until_first_throw = {
			4,
			6,
		},
		keep_target_distance = {
			15,
			20,
		},
		throw_at_distance = {
			10,
			25,
		},
		throw_at_distance_first_time = {
			8,
			35,
		},
		attack_throw_offset = {
			0.1281,
			1.1719,
			1.3749,
		},
		radius = GLOBE_RADIUS,
	},
	throw_poison_globe = {
		aoe_dot_damage_interval = 1,
		attack_anim = "attack_throw",
		attack_time = 1.44,
		barrage_count = 2,
		create_nav_tag_volume = true,
		damage_type = "poison",
		duration = 8,
		initial_radius = 2,
		nav_tag_volume_layer = "bot_poison_wind",
		weapon_node_name = "j_rightweaponattach",
		aoe_init_damage = {
			0,
			0,
			5,
			7,
			10,
			10,
			10,
			10,
			0,
		},
		aoe_dot_damage = {
			2,
			4,
			6,
			8,
			15,
			15,
			15,
			15,
			0,
		},
		radius = GLOBE_RADIUS,
		time_between_throws = {
			12,
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
	suicide_run = {
		action_weight = 10,
		aoe_dot_damage_interval = 1,
		create_nav_tag_volume = true,
		damage_type = "poison",
		distance_to_explode = 1.5,
		duration = 3,
		nav_tag_volume_layer = "bot_poison_wind",
		radius = 4,
		suicide_explosion_timer = 6,
		aoe_init_damage = {
			10,
			15,
			20,
			25,
			40,
			40,
			40,
			40,
			10,
		},
		aoe_dot_damage = {
			2,
			4,
			6,
			8,
			10,
			10,
			10,
			10,
			2,
		},
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			false,
			true,
		},
	},
	stagger = {
		stagger_anims = {
			{
				fwd = {
					"stun_fwd_sword",
				},
				bwd = {
					"stun_bwd_sword",
				},
				left = {
					"stun_left_sword",
				},
				right = {
					"stun_right_sword",
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
					"stun_fwd_ranged_light",
				},
				bwd = {
					"stun_bwd_ranged_light",
				},
				left = {
					"stun_left_ranged_light",
				},
				right = {
					"stun_right_ranged_light",
				},
			},
			{
				fwd = {
					"stun_fwd_sword",
				},
				bwd = {
					"stun_bwd_stab",
				},
				left = {
					"stun_left_sword",
				},
				right = {
					"stun_right_sword",
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

BreedActions.skaven_poison_wind_globadier = table.create_copy(BreedActions.skaven_poison_wind_globadier, action_data)

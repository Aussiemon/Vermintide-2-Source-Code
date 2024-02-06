-- chunkname: @scripts/settings/breeds/breed_skaven_pack_master.lua

local breed_data = {
	ai_strength = 1,
	ai_toughness = 3,
	aim_template = "pack_master",
	animation_sync_rpc = "rpc_sync_anim_state_6",
	aoe_height = 1.2,
	armor_category = 3,
	awards_positive_reinforcement_message = true,
	backstab_player_sound_event = "Play_clan_rat_attack_player_back_vce",
	base_unit = "units/beings/enemies/skaven_pack_master/chr_skaven_pack_master",
	behavior = "pack_master",
	bone_lod_level = 1,
	boss_staggers = false,
	bot_opportunity_target_melee_range = 5,
	bot_opportunity_target_melee_range_while_ranged = 4,
	death_reaction = "ai_default",
	default_inventory_template = "pack_master",
	detection_radius = 12,
	dialogue_source_name = "skaven_pack_master",
	exchange_order = 2,
	flingable = false,
	has_inventory = true,
	headshot_coop_stamina_fatigue_type = "headshot_special",
	hit_effect_template = "HitEffectsSkavenPackMaster",
	hit_reaction = "ai_default",
	is_always_spawnable = true,
	is_bot_aid_threat = true,
	is_resurrectable = false,
	panic_close_detection_radius_sq = 9,
	patrol_active_perception = "perception_regular",
	patrol_active_target_selection = "pick_pack_master_target",
	patrol_detection_radius = 10,
	patrol_passive_perception = "perception_regular",
	patrol_passive_target_selection = "patrol_passive_target_selection",
	perception = "perception_pack_master",
	player_locomotion_constrain_radius = 0.7,
	poison_resistance = 100,
	proximity_system_check = true,
	race = "skaven",
	radius = 1,
	run_speed = 5,
	smart_object_template = "special",
	smart_targeting_height_multiplier = 3,
	smart_targeting_outer_width = 0.6,
	smart_targeting_width = 0.2,
	special = true,
	stagger_resistance = 4,
	stagger_threshold_explosion = 100,
	stagger_threshold_heavy = 4,
	stagger_threshold_light = 2,
	stagger_threshold_medium = 4,
	target_selection = "pick_pack_master_target",
	threat_value = 8,
	unit_template = "ai_unit_pack_master",
	vortexable = true,
	walk_speed = 2.4,
	weapon_reach = 5,
	wield_inventory_on_spawn = true,
	infighting = InfightingSettings.small,
	max_health = BreedTweaks.max_health.pack_master,
	bloodlust_health = BreedTweaks.bloodlust_health.skaven_special,
	stagger_reduction = BreedTweaks.stagger_reduction.packmaster,
	diff_stagger_resist = BreedTweaks.diff_stagger_resist.packmaster,
	stagger_duration = {
		0.25,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
	},
	debug_color = {
		255,
		200,
		200,
		0,
	},
	disabled = Development.setting("disable_pack_master") or false,
	status_effect_settings = {
		category = "small",
		ignored_statuses = table.set({
			StatusEffectNames.burning_warpfire,
		}),
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
			},
			push_actors = {
				"j_head",
				"j_spine1",
			},
		},
		torso = {
			prio = 2,
			actors = {
				"c_spine2",
				"c_spine",
				"c_hips",
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
	allowed_layers = {
		bot_poison_wind = 15,
		bot_ratling_gun_fire = 15,
		destructible_wall = 0,
		doors = 1.5,
		fire_grenade = 15,
		jumps = 1.5,
		ledges = 1.5,
		ledges_with_fence = 1.5,
		planks = 1.5,
		teleporters = 5,
		temporary_wall = 0,
	},
	custom_death_enter_function = function (unit, killer_unit, damage_type, death_hit_zone)
		local blackboard = BLACKBOARDS[unit]

		QuestSettings.check_pack_master_kill_abducting_ally(blackboard, killer_unit)
	end,
}

Breeds.skaven_pack_master = table.create_copy(Breeds.skaven_pack_master, breed_data)

local action_data = {
	skulk = {
		dogpile_aggro_needed = 2,
		melee_override_distance_sqr = 16,
		skulk_time = 1,
		skulk_time_force_attack = 10,
	},
	follow = {
		distance_to_attack = 3,
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
	},
	grab_attack = {
		attack_anim = "attack_grab",
		attack_anim_duration = 1,
		bot_threat_start_time = 0.1,
		cooldown = 4,
		damage = 0,
		damage_type = "pack_master_grab",
		dodge_angle = 12.5,
		dodge_distance = 4,
		fatigue_type = "blocked_attack",
		unblockable = true,
	},
	initial_pull = {
		cooldown = 4,
		pull_distance = 4,
		pull_time = 1.733,
		ignore_staggers = {
			true,
			true,
			false,
			true,
			true,
			false,
		},
	},
	drag = {
		cooldown = 4,
		damage_amount = 3,
		damage_type = "cutting",
		force_hoist_time = 15,
		hit_zone_name = "full",
		safe_hoist_dist_squared_from_humans = 100,
		safe_hoist_max_height_differance = 1,
		time_to_damage = 1,
		ignore_staggers = {
			true,
			true,
			false,
			true,
			true,
			false,
		},
	},
	hoist = {
		cooldown = 4,
		hoist_anim_length = 3.5,
		ignore_staggers = {
			true,
			true,
			false,
			true,
			true,
			false,
		},
	},
	smash_door = {
		attack_anim = "smash_door",
		damage = 5,
		damage_type = "cutting",
		move_anim = "move_fwd",
		unblockable = true,
	},
	stagger = {
		scale_animation_speeds = true,
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

BreedActions.skaven_pack_master = table.create_copy(BreedActions.skaven_pack_master, action_data)

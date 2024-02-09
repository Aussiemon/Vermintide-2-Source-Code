﻿-- chunkname: @scripts/settings/breeds/breed_chaos_skeleton.lua

local breed_data = {
	ai_strength = 1,
	ai_toughness = 1,
	aim_template = "chaos_marauder",
	animation_sync_rpc = "rpc_sync_anim_state_7",
	aoe_height = 1.4,
	armor_category = 1,
	attack_general_sound_event = "Play_skeleton_minion_attack_vce",
	base_unit = "units/beings/npcs/skeleton/chr_npc_skeleton",
	behavior = "marauder",
	bone_lod_level = 1,
	death_reaction = "ai_default",
	death_sound_event = "career_necro_skeleton_spawn",
	debug_spawn_category = "Misc",
	default_inventory_template = "chaos_skeleton",
	detection_radius = 18,
	die_on_vortex_land = true,
	during_horde_detection_radius = 15,
	enter_walk_distance = 2.5,
	exchange_order = 4,
	flingable = true,
	follow_reach = 1,
	has_inventory = true,
	has_running_attack = true,
	hesitation_timer = 5,
	hit_effect_template = "HitEffectsChaosMarauder",
	hit_mass_count = 3,
	hit_reaction = "ai_default",
	horde_behavior = "marauder",
	horde_target_selection = "horde_pick_closest_target_with_spillover",
	is_always_spawnable = false,
	is_bot_threat = true,
	leave_walk_distance = 5,
	look_at_range = 40,
	no_blood_splatter_on_damage = true,
	panic_close_detection_radius_sq = 9,
	passive_walk_speed = 1,
	patrol_active_perception = "perception_regular",
	patrol_active_target_selection = "pick_closest_target_with_spillover",
	patrol_detection_radius = 10,
	patrol_passive_perception = "perception_regular",
	patrol_passive_target_selection = "patrol_passive_target_selection",
	perception = "perception_regular",
	perception_previous_attacker_stickyness_value = -7.75,
	poison_resistance = 100,
	push_sound_event = "Play_generic_pushed_impact_large",
	race = "undead",
	radius = 1,
	run_speed = 4.5,
	scale_death_push = 0.35,
	slot_template = "chaos_roamer",
	smart_object_template = "chaos_zombie",
	smart_targeting_height_multiplier = 2,
	smart_targeting_outer_width = 0.75,
	smart_targeting_width = 0.2,
	stagger_multiplier = 0.45,
	stagger_resistance = 2,
	stagger_threshold_light = 0,
	target_selection = "pick_closest_target_with_spillover",
	threat_value = 2.5,
	unit_template = "ai_unit_skeleton",
	use_backstab_vo = true,
	use_regular_horde_spawning = true,
	use_slot_type = "medium",
	uses_attack_sfx_callback = true,
	using_inventory_weakspots = true,
	vortexable = true,
	walk_speed = 1.6,
	weapon_reach = 2.5,
	wield_inventory_on_spawn = true,
	default_spawn_animation = {
		"spawn_floor",
		"spawn_floor_2",
		"spawn_floor_3",
		"spawn_floor_4",
		"spawn_floor_5",
		"spawn_floor_6",
		"spawn_floor_7",
	},
	passive_in_patrol_start_anim = {
		"move_fwd_4",
		"move_fwd_5",
		"move_fwd_6",
	},
	infighting = InfightingSettings.small,
	perception_exceptions = {
		poison_well = true,
		wizard_destructible = true,
	},
	size_variation_range = {
		0.9,
		1,
	},
	max_health = {
		20,
		30,
		40,
		75,
		100,
		120,
		150,
		175,
		30,
	},
	bloodlust_health = BreedTweaks.bloodlust_health.chaos_roamer,
	hit_mass_counts = {
		3,
		3,
		4.5,
		6,
		9,
	},
	stagger_reduction = BreedTweaks.stagger_reduction.marauder,
	diff_stagger_resist = BreedTweaks.diff_stagger_resist.marauder,
	stagger_duration_difficulty_mod = BreedTweaks.stagger_duration_difficulty_mod.fast,
	stagger_duration = BreedTweaks.stagger_duration.marauder,
	debug_color = {
		255,
		200,
		40,
		40,
	},
	stagger_modifier_function = function (stagger, duration, length, hit_zone_name, blackboard, breed, direction)
		if blackboard.stagger_type == 3 then
			if stagger == 3 and blackboard.heavy_stagger_immune_time then
				stagger = 0
				duration = 0
				length = 0
			elseif stagger ~= 3 and blackboard.stagger_immune_time then
				stagger = 0
				duration = 0
				length = 0
			end
		end

		return stagger, duration, length
	end,
	BTHesitationVariations = {
		hesitate = {
			"outnumbered_1",
			"outnumbered_2",
			"outnumbered_4",
			"outnumbered_5",
			"outnumbered_6",
			"outnumbered_7",
			"outnumbered_8",
			"outnumbered_9",
		},
		hesitate_bwd = {
			"hesitate_bwd_2",
			"hesitate_bwd_3",
			"hesitate_bwd_4",
			"hesitate_bwd_5",
			"hesitate_bwd_6",
			"hesitate_bwd",
		},
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
				"j_spine",
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
				"j_spine",
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
				"j_spine",
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
				"j_spine",
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
				"j_spine",
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
				"j_leftleg",
				"j_hips",
				"j_spine",
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
				"j_rightfoot",
				"j_rightleg",
				"j_hips",
				"j_spine",
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

Breeds.chaos_skeleton = table.create_copy(Breeds.chaos_skeleton, breed_data)

local AttackIntensityPerDifficulty = {
	normal = {
		easy = {
			normal = 2,
		},
		normal = {
			normal = 2,
		},
		hard = {
			normal = 2,
		},
		harder = {
			normal = 2,
		},
		hardest = {
			normal = 2,
		},
		cataclysm = {
			normal = 2,
		},
		cataclysm_2 = {
			normal = 2,
		},
		cataclysm_3 = {
			normal = 2,
		},
	},
	running = {
		easy = {
			running = 2.5,
		},
		normal = {
			running = 2.5,
		},
		hard = {
			running = 2.5,
		},
		harder = {
			running = 2.5,
		},
		hardest = {
			running = 2.5,
		},
		cataclysm = {
			running = 2.5,
		},
		cataclysm_2 = {
			running = 2.5,
		},
		cataclysm_3 = {
			running = 2.5,
		},
	},
}
local action_data = {
	idle = {
		anim_cycle_index = 0,
		animations = {
			"idle",
			"idle_2",
			"idle_3",
			"idle_4",
			"idle_5",
			"idle_6",
		},
		combat_animations = {
			"idle",
			"idle_2",
			"idle_3",
			"idle_4",
			"idle_5",
			"idle_6",
			"idle_7",
			"idle_8",
			"idle_9",
			"idle_10",
		},
		alerted_anims = {
			"alerted",
			"alerted_3",
		},
	},
	combat_shout = {
		action_weight = 1,
		cooldown = -1,
		shout_anim = "shout",
		considerations = UtilityConsiderations.clan_rat_shout,
	},
	alerted = {
		alerted_anims = {
			"alerted",
			"alerted_3",
			"alerted_4",
		},
		easter_egg_alerted_anims = {
			"alerted_2",
		},
		start_anims_name = {
			fwd = {
				"alerted_fwd",
				"alerted_fwd_2",
				"alerted_fwd_3",
			},
			bwd = {
				"alerted_bwd_2",
				"alerted_bwd_3",
			},
			left = {
				"alerted_left",
				"alerted_left_2",
				"alerted_left_3",
			},
			right = {
				"alerted_right",
				"alerted_right_2",
				"alerted_right_3",
			},
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
			alerted_fwd_2 = {},
			alerted_bwd_2 = {
				dir = -1,
				rad = math.pi,
			},
			alerted_left_2 = {
				dir = 1,
				rad = math.pi / 2,
			},
			alerted_right_2 = {
				dir = -1,
				rad = math.pi / 2,
			},
			alerted_fwd_3 = {},
			alerted_bwd_3 = {
				dir = -1,
				rad = math.pi,
			},
			alerted_left_3 = {
				dir = 1,
				rad = math.pi / 2,
			},
			alerted_right_3 = {
				dir = -1,
				rad = math.pi / 2,
			},
		},
	},
	follow = {
		action_weight = 1,
		considerations = UtilityConsiderations.clan_rat_follow,
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
		walk_anims = {
			"move_fwd_walk",
			"move_fwd_walk_2",
			"move_fwd_walk_3",
			"move_fwd_walk_4",
		},
	},
	reposition_on_slot = {
		action_weight = 2,
		considerations = UtilityConsiderations.reposition_on_slot,
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
		walk_anims = {
			"move_fwd_walk",
			"move_fwd_walk_2",
			"move_fwd_walk_3",
			"move_fwd_walk_4",
		},
	},
	running_attack = {
		action_weight = 10,
		attack_intensity = 1,
		attack_intensity_type = "running",
		damage = 3,
		damage_type = "cutting",
		dodge_rotation_time = 1,
		hit_react_type = "medium",
		moving_attack = true,
		player_push_speed = 3,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.marauder_running_attack,
		default_attack = {
			anims = {
				"attack_run",
				"attack_run_2",
				"attack_run_3",
			},
		},
		difficulty_damage = BreedTweaks.difficulty_damage.chaos_roamer_attack,
		fatigue_type = BreedTweaks.fatigue_types.roamer.running_attack,
		diminishing_damage = {},
		difficulty_diminishing_damage = BreedTweaks.diminishing_damage_and_cooldown.roamer,
		dodge_window_start = BreedTweaks.dodge_windows.running_attack,
		dodge_window_duration = BreedTweaks.dodge_window_durations.running_attack,
		attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_roamer,
	},
	normal_attack = {
		action_weight = 1,
		attack_intensity = 0.5,
		attack_intensity_type = "normal",
		damage = 3,
		damage_type = "cutting",
		dodge_rotation_time = 1.2,
		hit_react_type = "medium",
		moving_attack_intensity = 0.75,
		player_push_speed = 5,
		weapon_reach = 2.5,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.marauder_attack,
		dodge_window_start = BreedTweaks.dodge_windows.normal_attack,
		dodge_window_duration = BreedTweaks.dodge_window_durations.normal_attack,
		default_attack = {
			anims = {
				"attack_pounce",
				"attack_pounce_2",
				"attack_pounce_3",
				"attack_pounce_4",
				"attack_pounce_5",
				"attack_pounce_6",
				"attack_pounce_7",
			},
			damage_box_range = {
				down = -0.75,
				flat = 2.25,
				up = 1.7,
			},
		},
		step_attack = {
			moving_attack = true,
			step_distance_moving = 2.5,
			step_distance_stationary = 3.5,
			step_speed_moving = 1,
			anims = {
				"attack_move",
				"attack_move_2",
				"attack_move_3",
				"attack_move_4",
			},
			damage_box_range = {
				down = -0.75,
				flat = 2.25,
				up = 1.7,
			},
		},
		high_attack = {
			z_threshold = 1.5,
			anims = {
				"attack_reach_up",
				"attack_reach_up_2",
				"attack_reach_up_3",
				"attack_reach_up_4",
			},
			damage_box_range = {
				down = 0,
				flat = 1.5,
				up = 3.8,
			},
		},
		mid_attack = {
			flat_threshold = 1.5,
			z_threshold = -0.6,
			anims = {
				"attack_pounce_down",
				"attack_pounce_down_2",
				"attack_pounce_down_3",
			},
			damage_box_range = {
				down = -2,
				flat = 2,
				up = 1.7,
			},
		},
		low_attack = {
			z_threshold = -0.6,
			anims = {
				"attack_reach_down",
				"attack_reach_down_2",
				"attack_reach_down_3",
			},
			damage_box_range = {
				down = -3,
				flat = 1,
				up = 1.7,
			},
		},
		knocked_down_attack = {
			z_threshold = 0.6,
			anims = {
				"attack_pounce_down",
				"attack_pounce_down_2",
				"attack_pounce_down_3",
			},
			damage_box_range = {
				down = -3,
				flat = 1,
				up = 1.7,
			},
		},
		target_type_exceptions = {
			poison_well = {
				anims = "poison_well",
				damage_box_range = {
					down = -0.75,
					flat = 2,
					up = 1.7,
				},
			},
		},
		difficulty_damage = BreedTweaks.difficulty_damage.chaos_roamer_attack,
		fatigue_type = BreedTweaks.fatigue_types.roamer.normal_attack,
		diminishing_damage = {},
		difficulty_diminishing_damage = BreedTweaks.diminishing_damage_and_cooldown.roamer,
		attack_directions = {
			attack_move = "left",
			attack_move_2 = "right",
			attack_move_3 = "left",
			attack_move_4 = "right",
			attack_pounce = "left",
			attack_pounce_2 = "right",
			attack_pounce_3 = "left",
			attack_pounce_4 = "right",
			attack_pounce_5 = "left",
			attack_pounce_6 = "right",
			attack_pounce_7 = "left",
			attack_reach_down = "left",
			attack_reach_down_2 = "left",
			attack_reach_down_3 = "left",
			attack_reach_up = "left",
			attack_reach_up_2 = "left",
			attack_reach_up_3 = "left",
			attack_reach_up_4 = "left",
			attack_run = "left",
			attack_run_2 = "right",
			attack_run_3 = "left",
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_roamer,
	},
	tutorial_attack = {
		action_weight = 1,
		attack_intensity = 0.5,
		attack_intensity_type = "normal",
		damage = 3,
		damage_type = "cutting",
		dodge_rotation_time = 1.2,
		dodge_window_start = 0.25,
		hit_react_type = "medium",
		moving_attack_intensity = 0.75,
		player_push_speed = 5,
		weapon_reach = 2.5,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.marauder_attack,
		default_attack = {
			anims = {
				"attack_pounce",
			},
			damage_box_range = {
				down = -0.75,
				flat = 2.25,
				up = 1.7,
			},
		},
		difficulty_damage = BreedTweaks.difficulty_damage.chaos_roamer_attack,
		fatigue_type = BreedTweaks.fatigue_types.roamer.normal_attack,
		diminishing_damage = {},
		difficulty_diminishing_damage = BreedTweaks.diminishing_damage_and_cooldown.roamer,
		attack_directions = {
			attack_pounce = "left",
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_roamer,
	},
	combat_step = {
		action_weight = 1,
		move_speed = 4,
		considerations = UtilityConsiderations.chaos_marauder_combat_step,
		start_anims_data = {
			combat_step_fwd = {},
			combat_step_bwd = {
				dir = -1,
				rad = math.pi,
			},
			combat_step_left = {
				dir = 1,
				rad = math.pi / 2,
			},
			combat_step_right = {
				dir = -1,
				rad = math.pi / 2,
			},
		},
	},
	climb = {},
	smash_door = {
		damage = 4,
		damage_type = "cutting",
		door_attack_distance = 1,
		move_anim = "move_fwd",
		unblockable = true,
		attack_anim = {
			"attack_blocker",
			"attack_blocker_2",
			"attack_blocker_3",
		},
	},
	utility_action = {
		fail_cooldown_blackboard_identifier = "attack_cooldown_at",
		fail_cooldown_name = "utility_fail_cooldown",
		name = "utility_action",
	},
	blocked = {
		blocked_anims = {
			"blocked",
		},
		difficulty_duration = BreedTweaks.blocked_duration.chaos_roamer,
	},
	stagger = {
		scale_animation_speeds = true,
		custom_enter_function = function (unit, blackboard, t, action)
			if blackboard.stagger_type == 3 then
				blackboard.stagger_immune_time = t + 2.25
				blackboard.heavy_stagger_immune_time = t + 1.5
			elseif blackboard.stagger_type == 6 then
				blackboard.stagger_immune_time = t + 3.5
				blackboard.heavy_stagger_immune_time = t + 3
			end

			local stagger_anims = action.stagger_anims[blackboard.stagger_type]

			return stagger_anims, "idle"
		end,
		stagger_anims = {
			{
				fwd = {
					"stagger_fwd_light",
					"stagger_fwd_light_2",
					"stagger_fwd_light_3",
					"stagger_fwd_light_4",
					"stagger_fwd_light_5",
					"stagger_fwd_light_6",
				},
				bwd = {
					"stagger_bwd_light",
					"stagger_bwd_light_2",
					"stagger_bwd_light_3",
					"stagger_bwd_light_4",
					"stagger_bwd_light_5",
					"stagger_bwd_light_6",
					"stagger_bwd_light_7",
					"stagger_bwd_light_8",
				},
				left = {
					"stagger_left_light",
					"stagger_left_light_2",
					"stagger_left_light_3",
					"stagger_left_light_4",
				},
				right = {
					"stagger_right_light",
					"stagger_right_light_2",
					"stagger_right_light_3",
					"stagger_right_light_4",
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
				},
				left = {
					"stagger_left",
					"stagger_left_2",
					"stagger_left_3",
					"stagger_left_4",
					"stagger_left_5",
				},
				right = {
					"stagger_right",
					"stagger_right_2",
					"stagger_right_3",
					"stagger_right_4",
					"stagger_right_5",
				},
				dwn = {
					"stagger_medium_downward",
					"stagger_medium_downward_2",
					"stagger_medium_downward_3",
				},
			},
			{
				fwd = {
					"stagger_fwd_heavy",
					"stagger_fwd_heavy_2",
					"stagger_fwd_heavy_3",
					"stagger_fwd_heavy_4",
				},
				bwd = {
					"stagger_up_heavy",
					"stagger_up_heavy_2",
					"stagger_up_heavy_3",
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
				},
				right = {
					"stagger_right_heavy",
					"stagger_right_heavy_2",
					"stagger_right_heavy_3",
					"stagger_right_heavy_4",
				},
				dwn = {
					"stagger_dwn_heavy",
					"stagger_dwn_heavy_2",
					"stagger_dwn_heavy_3",
				},
			},
			{
				fwd = {
					"stun_fwd_ranged_light",
					"stun_fwd_ranged_light_2",
					"stun_fwd_ranged_light_3",
				},
				bwd = {
					"stun_bwd_ranged_light",
					"stun_bwd_ranged_light_2",
					"stun_bwd_ranged_light_3",
				},
				left = {
					"stun_left_ranged_light",
					"stun_left_ranged_light_2",
					"stun_left_ranged_light_3",
				},
				right = {
					"stun_right_ranged_light",
					"stun_right_ranged_light_2",
					"stun_right_ranged_light_3",
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
				},
				left = {
					"stagger_left",
					"stagger_left_2",
					"stagger_left_3",
					"stagger_left_4",
					"stagger_left_5",
				},
				right = {
					"stagger_right",
					"stagger_right_2",
					"stagger_right_3",
					"stagger_right_4",
					"stagger_right_5",
				},
				dwn = {
					"stagger_medium_downward",
					"stagger_medium_downward_2",
					"stagger_medium_downward_3",
				},
			},
			{
				fwd = {
					"stagger_explosion_back",
					"stagger_explosion_back_2",
				},
				bwd = {
					"stagger_explosion_front",
				},
				left = {
					"stagger_explosion_left",
				},
				right = {
					"stagger_explosion_right",
				},
			},
			{
				fwd = {
					"stagger_fwd_light",
					"stagger_fwd_light_2",
					"stagger_fwd_light_3",
					"stagger_fwd_light_4",
					"stagger_fwd_light_5",
					"stagger_fwd_light_6",
				},
				bwd = {
					"stagger_bwd_light",
					"stagger_bwd_light_4",
					"stagger_bwd_light_5",
					"stagger_bwd_light_6",
					"stagger_bwd_light_7",
					"stagger_bwd_light_8",
				},
				left = {
					"stagger_left_light",
					"stagger_left_light_2",
					"stagger_left_light_3",
					"stagger_left_light_4",
				},
				right = {
					"stagger_right_light",
					"stagger_right_light_2",
					"stagger_right_light_3",
					"stagger_right_light_4",
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
					"stagger_fwd_2",
					"stagger_fwd_3",
					"stagger_fwd_4",
				},
				bwd = {
					"stagger_bwd",
					"stagger_bwd_2",
					"stagger_bwd_3",
					"stagger_bwd_4",
				},
				left = {
					"stagger_left",
					"stagger_left_2",
					"stagger_left_3",
					"stagger_left_4",
					"stagger_left_5",
				},
				right = {
					"stagger_right",
					"stagger_right_2",
					"stagger_right_3",
					"stagger_right_4",
					"stagger_right_5",
				},
				dwn = {
					"stagger_medium_downward",
					"stagger_medium_downward_2",
					"stagger_medium_downward_3",
				},
			},
		},
	},
}

action_data.fallback_idle = action_data.idle
BreedActions.chaos_skeleton = table.create_copy(BreedActions.chaos_skeleton, action_data)

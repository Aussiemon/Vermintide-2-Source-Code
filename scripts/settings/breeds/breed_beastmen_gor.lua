﻿-- chunkname: @scripts/settings/breeds/breed_beastmen_gor.lua

local stagger_types = require("scripts/utils/stagger_types")
local breed_data = {
	ai_strength = 1,
	ai_toughness = 2,
	aim_template = "chaos_marauder",
	animation_sync_rpc = "rpc_sync_anim_state_8",
	aoe_height = 1.4,
	armor_category = 1,
	attack_general_sound_event = "play_enemy_gor_attack_short_husk_vce",
	attack_general_sound_event_long = "play_enemy_gor_attack_husk_vce",
	attack_player_sound_event = "play_enemy_gor_attack_short_vce",
	attack_player_sound_event_long = "play_enemy_gor_attack_vce",
	backstab_player_sound_event = "play_enemy_gor_attack_player_back_vce",
	base_unit = "units/beings/enemies/beastmen_gor/chr_beastmen_gor",
	behavior = "gor",
	bone_lod_level = 1,
	death_reaction = "gor",
	death_sound_event = "play_enemy_gor_die_vce",
	default_inventory_template = "beastmen_gor_1h",
	detection_radius = 12,
	dialogue_source_name = "beastmen_gor",
	enter_walk_distance = 2.5,
	exchange_order = 3,
	flingable = true,
	follow_reach = 1,
	has_inventory = true,
	has_running_attack = true,
	height = 1.7,
	hit_effect_template = "HitEffectsBeastmenGor",
	hit_mass_count = 3,
	hit_reaction = "ai_default",
	horde_behavior = "gor",
	horde_target_selection = "horde_pick_closest_target_with_spillover",
	is_always_spawnable = true,
	leave_walk_distance = 4.5,
	line_of_sight_distance_sq = 49,
	no_stagger_duration = false,
	opt_default_inventory_template = "opt_beastmen_gor_1h",
	panic_close_detection_radius_sq = 9,
	passive_in_patrol = true,
	patrol_active_perception = "perception_regular",
	patrol_active_target_selection = "storm_patrol_death_squad_target_selection",
	patrol_detection_radius = 10,
	patrol_passive_perception = "perception_regular",
	patrol_passive_target_selection = "patrol_passive_target_selection",
	perception = "perception_regular",
	perception_previous_attacker_stickyness_value = -4.5,
	player_locomotion_constrain_radius = 0.7,
	poison_resistance = 70,
	push_sound_event = "Play_generic_pushed_impact_large",
	race = "beastmen",
	radius = 1.5,
	run_speed = 4.8,
	scale_death_push = 0.65,
	slot_template = "beastmen_roamer",
	smart_object_template = "special",
	smart_targeting_height_multiplier = 2,
	smart_targeting_outer_width = 0.75,
	smart_targeting_width = 0.2,
	stagger_multiplier = 1,
	stagger_resistance = 2.25,
	stagger_threshold_heavy = 3,
	stagger_threshold_light = 0,
	target_selection = "pick_closest_target_with_spillover",
	threat_value = 2,
	unit_template = "ai_unit_marauder",
	use_backstab_vo = true,
	use_slot_type = "medium",
	uses_attack_sfx_callback = true,
	vortexable = true,
	walk_speed = 2.75,
	weapon_reach = 2.5,
	wwise_voice_switch_group = "beastmen_gor_vce",
	perception_exceptions = {
		poison_well = true,
		wizard_destructible = true,
	},
	infighting = InfightingSettings.small,
	passive_in_patrol_start_anim = {
		"move_fwd_walk",
		"move_fwd_walk_2",
		"move_fwd_walk_3",
		"move_fwd_walk_4",
	},
	size_variation_range = {
		1.1,
		1.15,
	},
	max_health = BreedTweaks.max_health.gor,
	diff_stagger_resist = BreedTweaks.diff_stagger_resist.gor,
	stagger_reduction = BreedTweaks.stagger_reduction.gor,
	stagger_duration = BreedTweaks.stagger_duration.gor,
	hit_mass_counts = BreedTweaks.hit_mass_counts.gor,
	bloodlust_health = BreedTweaks.bloodlust_health.beastmen_roamer,
	stagger_duration_difficulty_mod = BreedTweaks.stagger_duration_difficulty_mod.default,
	wwise_voices = {
		"gor_vce_profile_a",
		"gor_vce_profile_b",
		"gor_vce_profile_c",
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
		0,
		170,
	},
	animation_merge_options = {
		idle_animation_merge_options = {},
		walk_animation_merge_options = {},
		move_animation_merge_options = {},
	},
	stagger_modifier_function = function (stagger_type, duration, length, hit_zone_name, blackboard, breed)
		if blackboard.stagger_type == stagger_types.heavy then
			if stagger_type == stagger_types.heavy and blackboard.heavy_stagger_immune_time then
				stagger_type = stagger_types.heavy
				duration = 0
				length = 0
			elseif stagger_type ~= stagger_types.heavy and blackboard.stagger_immune_time then
				stagger_type = stagger_types.none
				duration = 0
				length = 0
			end
		end

		return stagger_type, duration, length
	end,
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
				"c_leftshoulder",
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
				"c_rightshoulder",
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
}

Breeds.beastmen_gor = table.create_copy(Breeds.beastmen_gor, breed_data)
Breeds.beastmen_gor_dummy = table.create_copy(Breeds.beastmen_gor_dummy, breed_data)
Breeds.beastmen_gor_dummy.behavior = "beastmen_dummy"
Breeds.beastmen_gor_dummy.horde_behavior = "beastmen_dummy"
Breeds.beastmen_gor_dummy.debug_spawn_category = "Misc"
Breeds.beastmen_gor_dummy.perception = "perception_no_seeing"
Breeds.beastmen_gor_dummy.wield_inventory_on_spawn = true
Breeds.beastmen_gor_dummy.is_always_spawnable = nil

local AttackIntensityPerDifficulty = {
	normal = {
		easy = {
			normal = 2,
			running = 2.5,
		},
		normal = {
			normal = 2,
			running = 2.5,
		},
		hard = {
			normal = 2,
			running = 2.5,
		},
		harder = {
			normal = 2,
			running = 2.5,
		},
		hardest = {
			normal = 2,
			running = 2.5,
		},
		cataclysm = {
			normal = 2,
			running = 2.5,
		},
		cataclysm_2 = {
			normal = 2,
			running = 2.5,
		},
		cataclysm_3 = {
			normal = 2,
			running = 2.5,
		},
		versus_base = {
			normal = 2,
			running = 2.5,
		},
	},
	running = {
		easy = {
			normal = 1,
			running = 2.5,
		},
		normal = {
			normal = 1,
			running = 2.5,
		},
		hard = {
			normal = 1,
			running = 2.5,
		},
		harder = {
			normal = 1,
			running = 2.5,
		},
		hardest = {
			normal = 1,
			running = 2.5,
		},
		cataclysm = {
			normal = 1,
			running = 7,
		},
		cataclysm_2 = {
			normal = 1,
			running = 2.5,
		},
		cataclysm_3 = {
			normal = 1,
			running = 2.5,
		},
		versus_base = {
			normal = 1,
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
		},
		alerted_anims = {
			"alerted",
			"alerted_2",
		},
	},
	alerted = {
		action_weight = 1,
		cooldown = -1,
		alerted_anims = {
			"alerted",
			"alerted_2",
		},
		start_anims_name = {
			bwd = "alerted_bwd",
			left = "alerted_left",
			fwd = {
				"alerted_fwd",
				"alerted_fwd_2",
			},
			right = {
				"alerted_right",
				"alerted_right_2",
			},
		},
		start_anims_data = {
			alerted_fwd = {},
			alerted_fwd_2 = {},
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
			alerted_right_2 = {
				dir = -1,
				rad = math.pi / 2,
			},
		},
	},
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
		considerations = UtilityConsiderations.clan_rat_follow,
	},
	running_attack = {
		action_weight = 10,
		attack_intensity = 1,
		attack_intensity_type = "running",
		damage = 3,
		damage_type = "cutting",
		hit_react_type = "medium",
		moving_attack = true,
		player_push_speed = 3,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.beastmen_gor_running_attack,
		default_attack = {
			anims = {
				"attack_run",
			},
		},
		difficulty_damage = BreedTweaks.difficulty_damage.beastmen_roamer_attack,
		fatigue_type = BreedTweaks.fatigue_types.roamer.running_attack,
		diminishing_damage = {},
		difficulty_diminishing_damage = BreedTweaks.diminishing_damage_and_cooldown.roamer,
		dodge_window_start = BreedTweaks.dodge_windows.running_attack,
		dodge_window_duration = BreedTweaks.dodge_window_durations.running_attack,
		attack_finished_duration = BreedTweaks.attack_finished_duration.beastmen_roamer,
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
		player_push_speed = 3,
		weapon_reach = 2.5,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.beastmen_gor_attack,
		dodge_window_start = BreedTweaks.dodge_windows.normal_attack,
		dodge_window_duration = BreedTweaks.dodge_window_durations.normal_attack,
		default_attack = {
			anims = {
				"attack_1h",
				"attack_1h_2",
				"attack_1h_3",
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
			},
			damage_box_range = {
				down = 0,
				flat = 1.5,
				up = 3.8,
			},
		},
		low_attack = {
			z_threshold = -1.5,
			anims = {
				"attack_reach_down",
				"attack_reach_down_2",
			},
			damage_box_range = {
				down = -3,
				flat = 1,
				up = 1.7,
			},
		},
		step_attack = {
			moving_attack = true,
			step_distance_moving = 2.5,
			step_distance_stationary = 3.5,
			step_speed_moving = 1,
			anims = {
				"attack_step",
				"attack_step_2",
				"attack_step_head",
			},
			damage_box_range = {
				down = -0.75,
				flat = 2.25,
				up = 1.7,
			},
		},
		knocked_down_attack = {
			z_threshold = 0.6,
			anims = {
				"attack_downed",
				"attack_downed_2",
				"attack_downed_3",
			},
			damage_box_range = {
				down = -3,
				flat = 1,
				up = 1.7,
			},
		},
		difficulty_damage = BreedTweaks.difficulty_damage.beastmen_roamer_attack,
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
		attack_finished_duration = BreedTweaks.attack_finished_duration.beastmen_roamer,
	},
	headbutt_attack = {
		action_weight = 2,
		attack_intensity = 0.5,
		attack_intensity_type = "normal",
		damage = 3,
		damage_type = "cutting",
		dodge_rotation_time = 1.2,
		hit_react_type = "medium",
		moving_attack_intensity = 0.75,
		player_push_speed = 8,
		player_push_speed_blocked = 6,
		weapon_reach = 2,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.beastmen_gor_headbutt_attack,
		dodge_window_start = BreedTweaks.dodge_windows.fast_attack,
		dodge_window_duration = BreedTweaks.dodge_window_durations.normal_attack,
		default_attack = {
			anims = {
				"attack_headbutt",
				"attack_headbutt_2",
				"attack_punch",
			},
			damage_box_range = {
				down = -0.75,
				flat = 2.25,
				up = 1.7,
			},
		},
		low_attack = {
			z_threshold = -1,
			anims = {
				"attack_reach_down",
				"attack_reach_down_2",
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
				"attack_downed",
				"attack_downed_2",
				"attack_downed_3",
			},
			damage_box_range = {
				down = -3,
				flat = 1,
				up = 1.7,
			},
		},
		difficulty_damage = BreedTweaks.difficulty_damage.beastmen_headbutt_attack,
		fatigue_type = BreedTweaks.fatigue_types.headbutt.normal_attack,
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
		attack_finished_duration = BreedTweaks.attack_finished_duration.beastmen_roamer,
	},
	combat_shout = {
		action_weight = 1,
		cooldown = -1,
		shout_anim = "shout",
		considerations = UtilityConsiderations.clan_rat_shout,
	},
	smash_door = {
		attack_anim = "attack_move",
		damage = 3,
		damage_type = "cutting",
		hit_react_type = "medium",
		move_anim = "move_fwd",
		name = "smash_door",
		unblockable = true,
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
	dummy_idle = {
		anim_cycle_index = 0,
		force_idle_animation = true,
		animations = {
			"crater_intro_1",
		},
	},
	blocked = {
		blocked_anims = {
			"blocked",
			"blocked_2",
		},
		difficulty_duration = BreedTweaks.blocked_duration.beastmen_roamer,
	},
	stagger = {
		scale_animation_speeds = true,
		custom_enter_function = function (unit, blackboard, t, action)
			if blackboard.standard_bearer_stagger then
				local stagger_anims = action.standard_stagger_anims[blackboard.stagger_type]

				blackboard.standard_bearer_stagger = nil

				return stagger_anims, "idle"
			end

			if blackboard.stagger_type == stagger_types.heavy then
				blackboard.stagger_immune_time = t + 2.25
				blackboard.heavy_stagger_immune_time = t + 2
			elseif blackboard.stagger_type == stagger_types.explosion then
				blackboard.stagger_immune_time = t + 3.5
				blackboard.heavy_stagger_immune_time = t + 3
			end

			local stagger_anims = action.stagger_anims[blackboard.stagger_type]

			return stagger_anims, "idle"
		end,
		stagger_anims = {
			{
				fwd = {
					"stun_fwd_sword",
					"stun_fwd_sword_2",
				},
				bwd = {
					"stun_bwd_sword",
					"stun_bwd_sword_2",
					"stun_bwd_sword_3",
				},
				left = {
					"stun_left_sword",
					"stun_left_sword_2",
				},
				right = {
					"stun_right_sword",
					"stun_right_sword_2",
					"stun_right_sword_3",
				},
				dwn = {
					"stun_bwd_sword",
				},
			},
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd",
					"stagger_bwd_2",
					"stagger_bwd_3",
					"stagger_bwd_4",
				},
				left = {
					"stagger_left",
					"stagger_left_heavy_2",
				},
				right = {
					"stagger_right",
					"stagger_right_heavy_2",
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
					"stagger_bwd_heavy",
				},
				left = {
					"stagger_left_heavy_3",
				},
				right = {
					"stagger_right_heavy_3",
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
					"stagger_bwd_2",
					"stagger_bwd_3",
					"stagger_bwd_4",
				},
				left = {
					"stagger_left",
					"stagger_left_heavy_2",
				},
				right = {
					"stagger_right",
					"stagger_right_heavy_2",
				},
			},
		},
		standard_stagger_anims = {
			{
				fwd = {
					"stagger_fwd_cheer_1",
					"stagger_fwd_cheer_2",
					"stagger_fwd_cheer_3",
					"stagger_fwd_cheer_4",
					"stagger_fwd_cheer_5",
				},
				bwd = {
					"stagger_fwd_cheer_1",
					"stagger_fwd_cheer_2",
					"stagger_fwd_cheer_3",
					"stagger_fwd_cheer_4",
					"stagger_fwd_cheer_5",
				},
				left = {
					"stagger_fwd_cheer_1",
					"stagger_fwd_cheer_2",
					"stagger_fwd_cheer_3",
					"stagger_fwd_cheer_4",
					"stagger_fwd_cheer_5",
				},
				right = {
					"stagger_fwd_cheer_1",
					"stagger_fwd_cheer_2",
					"stagger_fwd_cheer_3",
					"stagger_fwd_cheer_4",
					"stagger_fwd_cheer_5",
				},
			},
			{
				fwd = {
					"stagger_fwd_cheer_1",
					"stagger_fwd_cheer_2",
					"stagger_fwd_cheer_3",
					"stagger_fwd_cheer_4",
					"stagger_fwd_cheer_5",
				},
				bwd = {
					"stagger_fwd_cheer_1",
					"stagger_fwd_cheer_2",
					"stagger_fwd_cheer_3",
					"stagger_fwd_cheer_4",
					"stagger_fwd_cheer_5",
				},
				left = {
					"stagger_fwd_cheer_1",
					"stagger_fwd_cheer_2",
					"stagger_fwd_cheer_3",
					"stagger_fwd_cheer_4",
					"stagger_fwd_cheer_5",
				},
				right = {
					"stagger_fwd_cheer_1",
					"stagger_fwd_cheer_2",
					"stagger_fwd_cheer_3",
					"stagger_fwd_cheer_4",
					"stagger_fwd_cheer_5",
				},
			},
			{
				fwd = {
					"stagger_fwd_cheer_1",
					"stagger_fwd_cheer_2",
					"stagger_fwd_cheer_3",
					"stagger_fwd_cheer_4",
					"stagger_fwd_cheer_5",
				},
				bwd = {
					"stagger_fwd_cheer_1",
					"stagger_fwd_cheer_2",
					"stagger_fwd_cheer_3",
					"stagger_fwd_cheer_4",
					"stagger_fwd_cheer_5",
				},
				left = {
					"stagger_fwd_cheer_1",
					"stagger_fwd_cheer_2",
					"stagger_fwd_cheer_3",
					"stagger_fwd_cheer_4",
					"stagger_fwd_cheer_5",
				},
				right = {
					"stagger_fwd_cheer_1",
					"stagger_fwd_cheer_2",
					"stagger_fwd_cheer_3",
					"stagger_fwd_cheer_4",
					"stagger_fwd_cheer_5",
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
					"stagger_fwd_cheer_1",
					"stagger_fwd_cheer_2",
					"stagger_fwd_cheer_3",
					"stagger_fwd_cheer_4",
					"stagger_fwd_cheer_5",
				},
				bwd = {
					"stagger_fwd_cheer_1",
					"stagger_fwd_cheer_2",
					"stagger_fwd_cheer_3",
					"stagger_fwd_cheer_4",
					"stagger_fwd_cheer_5",
				},
				left = {
					"stagger_fwd_cheer_1",
					"stagger_fwd_cheer_2",
					"stagger_fwd_cheer_3",
					"stagger_fwd_cheer_4",
					"stagger_fwd_cheer_5",
				},
				right = {
					"stagger_fwd_cheer_1",
					"stagger_fwd_cheer_2",
					"stagger_fwd_cheer_3",
					"stagger_fwd_cheer_4",
					"stagger_fwd_cheer_5",
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
					"stagger_bwd_2",
					"stagger_bwd_3",
					"stagger_bwd_4",
				},
				left = {
					"stagger_left",
					"stagger_left_heavy_2",
				},
				right = {
					"stagger_right",
					"stagger_right_heavy_2",
				},
			},
		},
	},
}

BreedActions.beastmen_gor = table.create_copy(BreedActions.beastmen_gor, action_data)

﻿-- chunkname: @scripts/settings/breeds/breed_skaven_clan_rat.lua

local stagger_types = require("scripts/utils/stagger_types")
local breed_data = {
	ai_strength = 1,
	ai_toughness = 1,
	animation_sync_rpc = "rpc_sync_anim_state_7",
	aoe_height = 1.4,
	armor_category = 1,
	attack_general_sound_event = "Play_clan_rat_attack_husk_vce",
	attack_player_sound_event = "Play_clan_rat_attack_player_vce",
	backstab_player_sound_event = "Play_clan_rat_attack_player_back_vce",
	base_unit = "units/beings/enemies/skaven_clan_rat/chr_skaven_clan_rat",
	behavior = "pack_rat",
	bone_lod_level = 1,
	death_reaction = "ai_default",
	death_sound_event = "Play_clan_rat_die_vce",
	detection_radius = 12,
	during_horde_detection_radius = 15,
	enter_walk_distance = 2,
	exchange_order = 4,
	flingable = true,
	has_inventory = true,
	has_running_attack = true,
	hit_effect_template = "HitEffectsSkavenClanRat",
	hit_mass_count = 1.5,
	hit_reaction = "ai_default",
	horde_behavior = "horde_rat",
	horde_target_selection = "horde_pick_closest_target_with_spillover",
	increase_incoming_damage_fx = "fx/chr_enemy_clanrat_damage_buff",
	increase_incoming_damage_fx_node = "c_head",
	is_always_spawnable = true,
	leave_walk_distance = 5,
	panic_close_detection_radius_sq = 9,
	passive_walk_speed = 2,
	patrol_active_perception = "perception_regular",
	patrol_active_target_selection = "storm_patrol_death_squad_target_selection",
	patrol_detection_radius = 10,
	patrol_passive_perception = "perception_regular",
	patrol_passive_target_selection = "patrol_passive_target_selection",
	perception = "perception_regular",
	perception_previous_attacker_stickyness_value = -7.75,
	player_dodged_cone = 0.95,
	player_dodged_radius = 0.5,
	player_locomotion_constrain_radius = 0.7,
	poison_resistance = 70,
	race = "skaven",
	radius = 2,
	run_speed = 4.75,
	scale_death_push = 0.8,
	slot_template = "skaven_roamer",
	smart_object_template = "default_clan_rat",
	smart_targeting_height_multiplier = 2,
	smart_targeting_outer_width = 0.75,
	smart_targeting_width = 0.2,
	stagger_duration_mod = 1,
	stagger_multiplier = 0.75,
	stagger_resistance = 1.5,
	stagger_threshold_light = 0,
	target_selection = "pick_closest_target_with_spillover",
	threat_value = 1.5,
	unit_template = "ai_unit_clan_rat",
	unit_variation_setting_name = "skaven_clan_rat",
	use_backstab_vo = true,
	uses_attack_sfx_callback = true,
	vortexable = true,
	walk_speed = 2.75,
	weapon_reach = 2.1,
	wwise_voice_switch_group = "clan_rat_vce",
	default_inventory_template = {
		"skaven_clan_rat_sword",
		"skaven_clan_rat_spear",
	},
	opt_default_inventory_template = {
		"opt_skaven_clan_rat_sword",
		"opt_skaven_clan_rat_spear",
	},
	size_variation_range = {
		0.95,
		1.05,
	},
	animation_merge_options = {
		idle_animation_merge_options = {},
		move_animation_merge_options = {},
		walk_animation_merge_options = {},
		interest_point_animation_merge_options = {},
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
		j_hips = 0.4,
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
		j_spine = 0.4,
		j_spine1 = 0.4,
		j_tail2 = 0.05,
		j_tail3 = 0.05,
		j_tail4 = 0.05,
		j_tail5 = 0.05,
		j_tail6 = 0.05,
		j_taill = 0.05,
	},
	perception_exceptions = {
		poison_well = true,
		wizard_destructible = true,
	},
	infighting = InfightingSettings.small,
	max_health = BreedTweaks.max_health.clan_rat,
	bloodlust_health = BreedTweaks.bloodlust_health.skaven_roamer,
	diff_stagger_resist = BreedTweaks.diff_stagger_resist.clan_rat,
	stagger_duration = BreedTweaks.stagger_duration.clan_rat,
	hit_mass_counts = BreedTweaks.hit_mass_counts.clan_rat,
	num_push_anims = {
		push_backward = 2,
	},
	wwise_voices = {
		"indy_low",
		"indy_medium",
		"indy_high",
		"james_low",
		"james_medium",
		"james_high",
		"danijel_high",
		"danijel_medium",
		"danijel_low",
		"magnus_high",
		"magnus_low",
		"magnus_medium",
	},
	status_effect_settings = {
		category = "small",
	},
	debug_color = {
		255,
		200,
		40,
		40,
	},
	stagger_duration_difficulty_mod = BreedTweaks.stagger_duration_difficulty_mod.default,
	stagger_modifier_function = function (stagger_type, duration, length, hit_zone_name, blackboard, breed, direction)
		if blackboard.stagger_type == stagger_types.heavy then
			if stagger_type == stagger_types.heavy and blackboard.heavy_stagger_immune_time then
				stagger_type = stagger_types.none
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
	BTHesitationVariations = {
		hesitate = {
			"hesitate",
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
}

Breeds.skaven_clan_rat = table.create_copy(Breeds.skaven_clan_rat, breed_data)
Breeds.skaven_clan_rat_tutorial = table.create_copy(Breeds.skaven_clan_rat_tutorial, breed_data)
Breeds.skaven_clan_rat_tutorial.detection_radius = 2
Breeds.skaven_clan_rat_tutorial.debug_spawn_category = "Misc"

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
		versus_base = {
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
		versus_base = {
			running = 2.5,
		},
	},
}
local action_data = {
	idle = {
		alerted_anims = {
			"alerted",
		},
	},
	alerted = {
		action_weight = 1,
		cooldown = -1,
		do_wall_check = true,
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
	climb = {},
	running_attack = {
		action_weight = 10,
		attack_intensity_type = "running",
		damage = 3,
		damage_type = "cutting",
		moving_attack = true,
		player_push_speed = 3,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		default_attack = {
			anims = {
				"attack_move",
				"attack_move_1",
				"attack_move_2",
			},
		},
		difficulty_damage = BreedTweaks.difficulty_damage.skaven_roamer_attack,
		considerations = UtilityConsiderations.clan_rat_running_attack,
		fatigue_type = BreedTweaks.fatigue_types.roamer.running_attack,
		diminishing_damage = {},
		difficulty_diminishing_damage = BreedTweaks.diminishing_damage_and_cooldown.roamer,
		attack_finished_duration = BreedTweaks.attack_finished_duration.skaven_roamer,
		dodge_window_start = BreedTweaks.dodge_windows.running_attack,
		dodge_window_duration = BreedTweaks.dodge_window_durations.running_attack,
	},
	normal_attack = {
		action_weight = 1,
		attack_intensity_type = "normal",
		damage = 3,
		damage_type = "cutting",
		move_anim = "move_fwd",
		player_push_speed = 3,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		default_attack = {
			anims = {
				"attack_pounce",
				"attack_pounce_2",
				"attack_pounce_3",
				"attack_pounce_4",
			},
			damage_box_range = {
				down = -0.75,
				flat = 2,
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
		difficulty_damage = BreedTweaks.difficulty_damage.skaven_roamer_attack,
		considerations = UtilityConsiderations.clan_rat_attack,
		fatigue_type = BreedTweaks.fatigue_types.roamer.normal_attack,
		diminishing_damage = {},
		difficulty_diminishing_damage = BreedTweaks.diminishing_damage_and_cooldown.roamer,
		dodge_window_start = BreedTweaks.dodge_windows.normal_attack,
		dodge_window_duration = BreedTweaks.dodge_window_durations.normal_attack,
		attack_directions = {
			attack_move = "left",
			attack_move_1 = "right",
			attack_move_2 = "left",
			attack_pounce = "right",
			attack_pounce_2 = "left",
			attack_pounce_3 = "right",
			attack_pounce_4 = "right",
			attack_pounce_down = "left",
			attack_pounce_down_2 = "right",
			attack_pounce_down_3 = "left",
			attack_reach_down = "left",
			attack_reach_down_2 = "left",
			attack_reach_down_3 = "right",
			attack_reach_up = "left",
			attack_reach_up_2 = "left",
			attack_reach_up_3 = "right",
			attack_reach_up_4 = "left",
			attack_run = "left",
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.skaven_roamer,
	},
	combat_shout = {
		action_weight = 1,
		cooldown = -1,
		shout_anim = "shout",
		considerations = UtilityConsiderations.clan_rat_shout,
	},
	smash_door = {
		attack_anim = "attack_pounce",
		damage = 1,
		damage_type = "cutting",
		move_anim = "move_fwd",
		name = "smash_door",
		unblockable = true,
	},
	interest_point_choose = {
		max_range = 10,
		min_range = 4,
		name = "interest_point_choose",
	},
	utility_action = {
		fail_cooldown_blackboard_identifier = "attack_cooldown_at",
		fail_cooldown_name = "utility_fail_cooldown",
		name = "utility_action",
	},
	blocked = {
		blocked_anims = {
			"blocked",
			"blocked_2",
			"blocked_3",
		},
		difficulty_duration = BreedTweaks.blocked_duration.skaven_roamer,
	},
	stagger = {
		imation_speeds = true,
		scale_animation_speeds = true,
		custom_enter_function = function (unit, blackboard, t, action)
			if blackboard.stagger_type == stagger_types.heavy then
				blackboard.stagger_immune_time = t + 1.25
				blackboard.heavy_stagger_immune_time = t + 0.5
			elseif blackboard.stagger_type == stagger_types.explosion then
				blackboard.stagger_immune_time = t + 2.5
				blackboard.heavy_stagger_immune_time = t + 2
			end

			local stagger_anims = action.stagger_anims[blackboard.stagger_type]

			return stagger_anims, "idle"
		end,
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
		},
	},
	defend_destructible = {
		function_call_interval = 0.25,
		find_move_pos = {
			max_above = 0.1,
			max_below = 1.3,
			radius = 2,
			spread = 2,
			tries = 15,
		},
		has_overlap_at_pos = {
			radius = 0.8,
		},
	},
}

BreedActions.skaven_clan_rat = table.create_copy(BreedActions.skaven_clan_rat, action_data)

﻿-- chunkname: @scripts/settings/breeds/breed_chaos_warrior.lua

local stagger_types = require("scripts/utils/stagger_types")
local pushed_data = {
	ahead_dist = 1.5,
	player_pushed_speed = 4,
	push_forward_offset = 1.5,
	push_stagger_distance = 1,
	push_width = 1.25,
	push_stagger_impact = {
		stagger_types.medium,
		stagger_types.medium,
		stagger_types.none,
		stagger_types.none,
	},
	push_stagger_duration = {
		1.5,
		1,
		0,
		0,
	},
}
local breed_data = {
	ai_strength = 6,
	ai_toughness = 5,
	aim_template = "chaos_warrior",
	always_look_at_target = true,
	animation_sync_rpc = "rpc_sync_anim_state_7",
	aoe_height = 1.7,
	aoe_radius = 0.4,
	armor_category = 2,
	attack_general_sound_event = "Play_breed_triggered_sound",
	attack_player_sound_event = "Play_breed_triggered_sound",
	awards_positive_reinforcement_message = true,
	backstab_player_sound_event = "Play_enemy_vce_chaos_warrior_attack_player_back",
	base_unit = "units/beings/enemies/chaos_warrior/chr_chaos_warrior",
	behavior = "chaos_warrior",
	big_boy_turning_dot = 0.4,
	bone_lod_level = 0,
	bot_hitbox_radius_approximation = 0.8,
	bot_melee_aim_node = "j_spine1",
	bots_should_flank = true,
	controllable = true,
	death_reaction = "ai_default",
	death_sound_event = "Play_enemy_vce_chaos_warrior_die",
	default_inventory_template = "warrior_axe",
	detection_radius = 12,
	dialogue_source_name = "chaos_warrior",
	disable_crowd_dispersion = true,
	elite = true,
	enter_walk_distance = 3,
	exchange_order = 2,
	friends_alert_range = 10,
	has_inventory = true,
	has_running_attack = true,
	headshot_coop_stamina_fatigue_type = "headshot_special",
	height = 2.25,
	hit_effect_template = "HitEffectsChaosWarrior",
	hit_mass_count = 20,
	hit_reaction = "ai_default",
	horde_behavior = "chaos_warrior",
	ignore_targets_outside_detection_radius = true,
	is_always_spawnable = true,
	is_bot_aid_threat = true,
	is_bot_threat = true,
	leave_walk_distance = 4.5,
	no_stagger_damage_reduction = true,
	no_stagger_duration = true,
	panic_close_detection_radius_sq = 9,
	patrol_active_perception = "perception_regular_update_aggro",
	patrol_active_target_selection = "storm_patrol_death_squad_target_selection",
	patrol_detection_radius = 10,
	patrol_passive_perception = "perception_regular",
	patrol_passive_target_selection = "patrol_passive_target_selection",
	perception = "perception_regular_update_aggro",
	perception_previous_attacker_stickyness_value = 0,
	player_locomotion_constrain_radius = 0.7,
	poison_resistance = 100,
	primary_armor_category = 6,
	proximity_system_check = true,
	push_sound_event = "Play_generic_pushed_impact_large_armour",
	race = "chaos",
	radius = 1,
	run_speed = 4.2,
	slot_template = "chaos_large_elite",
	smart_object_template = "chaos_warrior",
	smart_targeting_height_multiplier = 3,
	smart_targeting_outer_width = 1,
	smart_targeting_width = 0.2,
	stagger_count_reset_time = 5,
	stagger_resistance = 5,
	stagger_threshold_light = 0.5,
	sync_full_rotation = false,
	target_selection = "pick_rat_ogre_target_with_weights",
	target_stickyness_modifier = -10,
	threat_value = 12,
	trigger_dialogue_on_target_switch = true,
	unit_template = "ai_unit_chaos_warrior",
	use_avoidance = false,
	use_big_boy_turning = true,
	use_navigation_path_splines = true,
	use_regular_horde_spawning = true,
	use_slot_type = "large",
	vortexable = false,
	walk_speed = 2.4,
	weapon_reach = 2,
	wwise_voice_switch_group = "stormvermin_vce",
	displace_players_data = pushed_data,
	infighting = InfightingSettings.large,
	perception_exceptions = {
		poison_well = true,
		wizard_destructible = true,
	},
	perception_weights = {
		aggro_decay_per_sec = 1,
		distance_weight = 100,
		max_distance = 50,
		old_target_aggro_mul = 1,
		target_catapulted_mul = 0.5,
		target_disabled_aggro_mul = 0,
		target_disabled_mul = 0.15,
		target_outside_navmesh_mul = 0.5,
		target_stickyness_bonus_a = 50,
		target_stickyness_bonus_b = 10,
		target_stickyness_duration_a = 5,
		target_stickyness_duration_b = 20,
		targeted_by_other_special = -10,
	},
	size_variation_range = {
		1,
		1,
	},
	max_health = BreedTweaks.max_health.chaos_warrior,
	bloodlust_health = BreedTweaks.bloodlust_health.chaos_warrior,
	stagger_reduction = BreedTweaks.stagger_reduction.warrior,
	diff_stagger_resist = BreedTweaks.diff_stagger_resist.warrior,
	stagger_duration = BreedTweaks.stagger_duration.warrior,
	wwise_voices = {
		"low",
		"medium",
		"high",
	},
	status_effect_settings = {
		category = "medium",
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
	run_on_spawn = AiBreedSnippets.on_chaos_warrior_spawn,
	run_on_update = AiBreedSnippets.on_chaos_warrior_update,
	stagger_modifier_function = function (stagger_type, duration, length, hit_zone_name, blackboard, breed)
		if blackboard.stagger_type == stagger_types.heavy or blackboard.stagger_type == stagger_types.explosion then
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
	hitzone_multiplier_types = {
		head = "headshot",
		neck = "headshot",
	},
	hitzone_primary_armor_categories = {
		head = {
			attack = 6,
			impact = 2,
		},
		neck = {
			attack = 6,
			impact = 2,
		},
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
		c_leftupleg = "j_leftupleg",
		c_neck = "j_neck",
		c_rightarm = "j_rightarm",
		c_rightfoot = "j_rightfoot",
		c_rightforearm = "j_rightforearm",
		c_righthand = "j_righthand",
		c_rightleg = "j_rightleg",
		c_rightupleg = "j_rightupleg",
		c_spine = "j_spine1",
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
		j_leftupleg = 0.2,
		j_neck = 0.3,
		j_rightarm = 0.2,
		j_rightfoot = 0.2,
		j_rightforearm = 0.2,
		j_righthand = 0.2,
		j_rightleg = 0.2,
		j_rightshoulder = 0.3,
		j_rightupleg = 0.2,
		j_spine1 = 0.3,
	},
}

Breeds.chaos_warrior = table.create_copy(Breeds.chaos_warrior, breed_data)

local AttackIntensityPerDifficulty = {
	normal = {
		easy = {
			normal = 3,
		},
		normal = {
			normal = 3,
		},
		hard = {
			normal = 3,
		},
		harder = {
			normal = 3,
		},
		hardest = {
			normal = 3,
		},
		cataclysm = {
			normal = 3,
		},
		cataclysm_2 = {
			normal = 3,
		},
		cataclysm_3 = {
			normal = 3,
		},
		versus_base = {
			normal = 3,
		},
	},
	sweep = {
		easy = {
			normal = 2,
			sweep = 4,
		},
		normal = {
			normal = 2,
			sweep = 4,
		},
		hard = {
			normal = 2,
			sweep = 4,
		},
		harder = {
			normal = 2,
			sweep = 4,
		},
		hardest = {
			normal = 2,
			sweep = 4,
		},
		cataclysm = {
			normal = 2,
			sweep = 4,
		},
		cataclysm_2 = {
			normal = 2,
			sweep = 4,
		},
		cataclysm_3 = {
			normal = 2,
			sweep = 4,
		},
		versus_base = {
			normal = 2,
			sweep = 4,
		},
	},
	cleave = {
		easy = {
			normal = 2,
			sweep = 4,
		},
		normal = {
			normal = 2,
			sweep = 4,
		},
		hard = {
			normal = 2,
			sweep = 4,
		},
		harder = {
			normal = 2,
			sweep = 4,
		},
		hardest = {
			normal = 2,
			sweep = 4,
		},
		cataclysm = {
			normal = 2,
			sweep = 4,
		},
		cataclysm_2 = {
			normal = 2,
			sweep = 4,
		},
		cataclysm_3 = {
			normal = 2,
			sweep = 4,
		},
		versus_base = {
			normal = 2,
			sweep = 4,
		},
	},
	push = {
		easy = {
			push = 1.5,
		},
		normal = {
			push = 1.5,
		},
		hard = {
			push = 1.5,
		},
		harder = {
			push = 1.5,
		},
		hardest = {
			push = 1.5,
		},
		cataclysm = {
			push = 1.5,
		},
		cataclysm_2 = {
			push = 1.5,
		},
		cataclysm_3 = {
			push = 1.5,
		},
		versus_base = {
			push = 1.5,
		},
	},
	running = {
		easy = {
			running = 4.5,
		},
		normal = {
			running = 4.5,
		},
		hard = {
			running = 4.5,
		},
		harder = {
			running = 4.5,
		},
		hardest = {
			running = 4.5,
		},
		cataclysm = {
			running = 4.5,
		},
		cataclysm_2 = {
			running = 4.5,
		},
		cataclysm_3 = {
			running = 4.5,
		},
		versus_base = {
			running = 4.5,
		},
	},
}
local action_data = {
	alerted = {
		no_hesitation = true,
		override_time_alerted = 0.2,
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
		slow_approach_distance_sq = 144,
		slow_approach_time = 5,
		considerations = UtilityConsiderations.chaos_warrior_follow,
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
	combat_step = {
		action_weight = 1,
		considerations = UtilityConsiderations.chaos_warrior_combat_step,
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
	special_attack_cleave = {
		action_weight = 1,
		attack_intensity_type = "cleave",
		bot_threat_duration = 1,
		bot_threat_start_time = 1.25,
		bot_threat_start_time_step = 1.45,
		damage = 30,
		damage_type = "cutting",
		dodge_rotation_time = 2.5,
		dodge_window_start = 0.75,
		fatigue_type = "chaos_cleave",
		height = 2,
		hit_react_type = "heavy",
		knocked_down_attack_threshold = 0.6,
		no_block_stagger = true,
		offset_forward = 0.6,
		offset_up = 0,
		range = 3,
		reset_attack_animation_speed = 1.3,
		rotation_time = 1.5,
		step_attack_distance = 1.8,
		step_attack_distance_override = 3.2,
		step_attack_target_speed_away = 1.5,
		step_attack_target_speed_away_override = 2,
		width = 0.4,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.chaos_warrior_special_attack,
		attack_anim = {
			"attack_cleave_01",
			"attack_cleave_02",
		},
		knocked_down_attack_anim = {
			"attack_downed",
		},
		reset_attack_animations = {
			"attack_special_reset",
		},
		step_attack_anim = {
			"attack_cleave_moving_01",
		},
		difficulty_damage = BreedTweaks.difficulty_damage.elite_attack_heavy,
		ignore_staggers = {
			true,
			true,
			false,
			true,
			true,
			false,
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_elite,
	},
	special_attack_sweep = {
		action_weight = 1,
		attack_intensity_type = "sweep",
		blocked_anim = "blocked",
		bot_threat_duration = 0.7,
		bot_threat_start_time = 0.4,
		bot_threat_start_time_step = 0.5,
		damage = 15,
		damage_type = "cutting",
		height = 1,
		hit_react_type = "medium",
		knocked_down_attack_threshold = 0.6,
		offset_forward = 0.5,
		offset_up = 0,
		player_push_speed = 5,
		player_push_speed_blocked = 7.5,
		push = true,
		range = 2.5,
		reset_attack_animation_speed = 1.2,
		rotation_time = 1,
		step_attack_distance = 1.9,
		step_attack_distance_override = 3.2,
		step_attack_target_speed_away = 1.65,
		step_attack_target_speed_away_override = 2.1,
		width = 1,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.chaos_warrior_sweep_attack,
		attack_anim = {
			"attack_sweep_01",
			"attack_sweep_02",
			"attack_sweep_03",
		},
		knocked_down_attack_anim = {
			"attack_downed",
		},
		reset_attack_animations = {
			"attack_right_reset",
		},
		step_attack_anim = {
			"attack_sweep_moving_01",
		},
		difficulty_damage = BreedTweaks.difficulty_damage.elite_attack,
		fatigue_type = BreedTweaks.fatigue_types.elite_sweep.normal_attack,
		ignore_staggers = {
			false,
			false,
			false,
			true,
			true,
			false,
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_elite,
	},
	special_attack_quick = {
		action_weight = 1,
		attack_intensity_type = "normal",
		damage = 10,
		damage_type = "cutting",
		fatigue_type = "blocked_shove",
		height = 1,
		hit_react_type = "heavy",
		knocked_down_attack_threshold = 0.6,
		no_block_stagger = true,
		offset_forward = 0,
		offset_up = 0,
		player_push_speed = 9,
		player_push_speed_blocked = 9,
		push = true,
		range = 3,
		reset_attack_animation_speed = 1.3,
		rotation_time = 0.75,
		width = 0.4,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.chaos_warrior_push_attack,
		attack_anim = {
			"attack_quick_01",
			"attack_quick_02",
		},
		knocked_down_attack_anim = {
			"attack_downed",
		},
		difficulty_damage = BreedTweaks.difficulty_damage.elite_attack_quick,
		ignore_staggers = {
			false,
			false,
			false,
			true,
			true,
			false,
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_elite,
	},
	running_attack_right = {
		action_weight = 5,
		attack_intensity_type = "running",
		blocked_anim = "blocked",
		bot_threat_duration = 0.7,
		bot_threat_start_time = 0.5,
		damage = 20,
		damage_type = "cutting",
		height = 1,
		hit_react_type = "heavy",
		moving_attack = true,
		offset_forward = 0.5,
		offset_up = 1,
		player_push_speed = 9,
		player_push_speed_blocked = 9,
		push = true,
		range = 2.5,
		reset_attack_animation_speed = 1.3,
		rotation_time = 1.5,
		width = 1,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.chaos_warrior_running_attack,
		attack_anim = {
			"attack_run",
			"attack_sweep_run_01",
		},
		difficulty_damage = BreedTweaks.difficulty_damage.elite_attack,
		fatigue_type = BreedTweaks.fatigue_types.elite_cleave.running_attack,
		ignore_staggers = {
			false,
			false,
			false,
			true,
			false,
			false,
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_elite,
	},
	special_attack_launch = {
		action_weight = 1,
		attack_anim = "attack_pounce",
		attack_intensity_type = "sweep",
		bot_threat_duration = 0.75,
		bot_threat_start_time = 0.5,
		catapult = true,
		damage = 5,
		damage_type = "cutting",
		fatigue_type = "blocked_slam",
		height = 1,
		hit_react_type = "heavy",
		knocked_down_attack_threshold = 0.6,
		no_block_stagger = true,
		offset_forward = 0.8,
		offset_up = 0,
		range = 3.2,
		reset_attack_animation_speed = 1.3,
		reset_stagger_count = true,
		rotation_time = 0.75,
		shove_speed = 5,
		shove_z_speed = 2,
		width = 1.5,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.chaos_warrior_launch_attack,
		knocked_down_attack_anim = {
			"attack_downed",
		},
		difficulty_damage = BreedTweaks.difficulty_damage.elite_attack,
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			false,
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_elite,
	},
	push_attack = {
		action_weight = 1,
		attack_intensity_type = "push",
		damage = 0,
		damage_type = "blunt",
		fatigue_type = "blocked_slam",
		hit_react_type = "heavy",
		impact_push_speed = 11,
		max_impact_push_speed = 9,
		unblockable = true,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.chaos_warrior_push_attack,
		attack_anim = {
			"attack_push_2",
			"attack_push",
		},
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			false,
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_elite,
	},
	smash_door = {
		attack_anim = "attack_pounce",
		damage = 3,
		damage_type = "cutting",
		move_anim = "move_fwd",
		unblockable = true,
	},
	blocked = {
		blocked_anims = {
			"blocked",
		},
		difficulty_duration = BreedTweaks.blocked_duration.chaos_elite,
	},
	stagger = {
		custom_enter_function = function (unit, blackboard, t, action)
			if blackboard.stagger_type == stagger_types.heavy then
				blackboard.stagger_immune_time = t + 2.25
				blackboard.heavy_stagger_immune_time = t + 1.5
			elseif blackboard.stagger_type == stagger_types.explosion then
				blackboard.stagger_immune_time = t + 4.5
				blackboard.heavy_stagger_immune_time = t + 4
			end

			local stagger_anims = action.stagger_anims[blackboard.stagger_type]

			return stagger_anims, "idle"
		end,
		stagger_anims = {
			{
				fwd = {
					"hit_react_fwd",
				},
				bwd = {
					"hit_react_bwd",
				},
				left = {
					"hit_react_left",
				},
				right = {
					"hit_react_right",
				},
				dwn = {
					"hit_react_overhead",
				},
			},
			{
				fwd = {
					"stagger_light_fwd",
				},
				bwd = {
					"stagger_light_bwd",
				},
				left = {
					"stagger_light_left",
				},
				right = {
					"stagger_light_right",
				},
			},
			{
				fwd = {
					"stagger_medium_fwd",
				},
				bwd = {
					"stagger_medium_bwd",
				},
				left = {
					"stagger_medium_left",
				},
				right = {
					"stagger_medium_right",
				},
			},
			{
				fwd = {
					"hit_react_fwd",
				},
				bwd = {
					"hit_react_bwd",
				},
				left = {
					"hit_react_left",
				},
				right = {
					"hit_react_right",
				},
			},
			{
				fwd = {
					"hit_react_fwd",
				},
				bwd = {
					"hit_react_bwd",
				},
				left = {
					"hit_react_left",
				},
				right = {
					"hit_react_right",
				},
			},
			{
				fwd = {
					"stagger_fwd_downed",
				},
				bwd = {
					"stagger_bwd_exp",
				},
				left = {
					"stagger_left_downed",
				},
				right = {
					"stagger_right_downed",
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
					"hit_react_fwd",
				},
				bwd = {
					"hit_react_bwd",
				},
				left = {
					"hit_react_left",
				},
				right = {
					"hit_react_right",
				},
				dwn = {
					"hit_react_overhead",
				},
			},
		},
	},
}

BreedActions.chaos_warrior = table.create_copy(BreedActions.chaos_warrior, action_data)

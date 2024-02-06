-- chunkname: @scripts/settings/breeds/breed_chaos_berzerker.lua

local stagger_types = require("scripts/utils/stagger_types")
local MOVING_STAGGERS = {
	"run_stagger_left",
}
local MOVING_HVY_STAGGERS = {
	"run_stagger_right",
}
local breed_data = {
	ai_strength = 2,
	ai_toughness = 3,
	aim_template = "chaos_marauder",
	allow_aoe_push = true,
	animation_sync_rpc = "rpc_sync_anim_state_7",
	aoe_height = 1.4,
	armor_category = 5,
	attack_general_sound_event = "Play_enemy_berserker_attack_husk_vce",
	attack_player_sound_event = "Play_enemy_berserker_attack_player_vce",
	attack_start_slow_factor_time = 0.35,
	attack_start_slow_fraction = 0.5,
	awards_positive_reinforcement_message = true,
	backstab_player_sound_event = "Play_enemy_marauder_attack_player_back_vce",
	base_unit = "units/beings/enemies/chaos_berzerker/chr_chaos_berzerker",
	behavior = "berzerker",
	berzerker_alert = true,
	berzerking_stagger_time = 0.75,
	bone_lod_level = 0,
	death_reaction = "ai_default",
	death_sound_event = "Play_enemy_marauder_death_vce",
	default_inventory_template = "berzerker_dual_axes",
	detection_radius = 24,
	dialogue_source_name = "chaos_berzerker",
	dodge_timer = 0.15,
	dont_wield_weapon_on_patrol = true,
	during_horde_detection_radius = 24,
	elite = true,
	enter_walk_distance = 1.5,
	exchange_order = 3,
	flingable = true,
	force_walk_while_tired = true,
	has_inventory = true,
	has_running_attack = true,
	hit_effect_template = "HitEffectsChaosBerzerker",
	hit_mass_count = 4,
	hit_reaction = "ai_default",
	horde_behavior = "berzerker",
	horde_target_selection = "horde_pick_closest_target_with_spillover",
	is_always_spawnable = true,
	is_bot_threat = true,
	leave_walk_distance = 3.5,
	look_at_range = 30,
	match_speed_distance = 2,
	opt_base_unit = "units/beings/enemies/chaos_berzerker/chr_chaos_berzerker_baked",
	panic_close_detection_radius_sq = 9,
	passive_walk_speed = 2,
	patrol_active_perception = "perception_regular",
	patrol_active_target_selection = "storm_patrol_death_squad_target_selection",
	patrol_detection_radius = 10,
	patrol_passive_perception = "perception_regular",
	patrol_passive_target_selection = "patrol_passive_target_selection",
	perception = "perception_regular",
	perception_previous_attacker_stickyness_value = 0,
	player_locomotion_constrain_radius = 0.7,
	poison_resistance = 100,
	proximity_system_check = true,
	race = "chaos",
	radius = 1.25,
	run_speed = 6,
	run_speed_interpolation_factor = 0.5,
	scale_death_push = 0.65,
	slot_template = "chaos_elite",
	smart_object_template = "special",
	smart_targeting_width = 0.2,
	stagger_resistance = 3,
	stagger_threshold_explosion = 5,
	stagger_threshold_heavy = 3,
	stagger_threshold_light = 0.75,
	stagger_threshold_medium = 1.5,
	target_selection = "pick_closest_target_with_spillover",
	threat_value = 5,
	unit_template = "ai_unit_berzerker",
	use_backstab_vo = true,
	use_slot_type = "medium",
	uses_attack_sfx_callback = true,
	using_combo = true,
	vortexable = true,
	walk_speed = 2.25,
	weapon_reach = 2,
	wwise_voice_switch_group = "marauder_vce_variations",
	infighting = InfightingSettings.small,
	size_variation_range = {
		1,
		1,
	},
	passive_in_patrol_start_anim = {
		"move_fwd_4",
		"move_fwd_5",
		"move_fwd_6",
	},
	stagger_modifier_function = function (stagger_type, duration, length, hit_zone_name, blackboard, breed)
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
		j_neck1 = 0.3,
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
	perception_exceptions = {
		poison_well = true,
		wizard_destructible = true,
	},
	max_health = BreedTweaks.max_health.berzerker,
	bloodlust_health = BreedTweaks.bloodlust_health.chaos_elite,
	diff_stagger_resist = BreedTweaks.diff_stagger_resist.berzerker,
	stagger_reduction = BreedTweaks.stagger_reduction.berzerker,
	stagger_duration = BreedTweaks.stagger_duration.berzerker,
	hit_mass_counts = BreedTweaks.hit_mass_counts.berzerker,
	num_push_anims = {
		push_backward = 2,
	},
	wwise_voices = {
		"marauder_andreas",
		"marauder_olof",
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
		40,
		40,
	},
}

Breeds.chaos_berzerker = table.create_copy(Breeds.chaos_berzerker, breed_data)

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
	frenzy = {
		easy = {
			frenzy = 5,
			normal = 2.5,
		},
		normal = {
			frenzy = 5,
			normal = 2.5,
		},
		hard = {
			frenzy = 5,
			normal = 2.5,
		},
		harder = {
			frenzy = 5,
			normal = 2.5,
		},
		hardest = {
			frenzy = 5,
			normal = 2.5,
		},
		cataclysm = {
			frenzy = 5,
			normal = 2.5,
		},
		cataclysm_2 = {
			frenzy = 5,
			normal = 2.5,
		},
		cataclysm_3 = {
			frenzy = 5,
			normal = 2.5,
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
local DEFAULT_ALLOWED_STAGGERS = {
	true,
	false,
	false,
	true,
	true,
	false,
	true,
}
local OPENING_ALLOWED_STAGGERS = {
	true,
	true,
	false,
	true,
	true,
	false,
	true,
}
local JUMPATTACK_IGNORE_STAGGERS = {
	true,
	true,
	true,
	true,
	true,
	false,
	true,
}
local action_data = {
	alerted = {
		action_weight = 1,
		cooldown = -1,
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
		alt_tired_anim = "move_fwd_jog",
		alt_walk_anim = "move_fwd_jog",
		cooldown = -1,
		custom_is_tired_function = function (unit, blackboard)
			if blackboard.time_since_last_combo and blackboard.time_since_last_combo <= 8 then
				return true
			end

			return false
		end,
		start_alt_tired_anims_name = {
			bwd = "move_start_bwd_jog",
			fwd = "move_start_fwd_jog",
			left = "move_start_left_jog",
			right = "move_start_right_jog",
		},
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
			move_start_fwd_jog = {},
			move_start_bwd_jog = {
				dir = -1,
				rad = math.pi,
			},
			move_start_left_jog = {
				dir = 1,
				rad = math.pi / 2,
			},
			move_start_right_jog = {
				dir = -1,
				rad = math.pi / 2,
			},
		},
		considerations = UtilityConsiderations.clan_rat_follow,
	},
	running_attack = {
		action_weight = 10,
		attack_intensity_type = "running",
		damage = 3,
		damage_type = "cutting",
		moving_attack = true,
		player_push_speed = 3,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		default_attack = {
			anims = "attack_lunge",
		},
		difficulty_damage = BreedTweaks.difficulty_damage.chaos_roamer_attack,
		considerations = UtilityConsiderations.chaos_berzerker_running_attack,
		fatigue_type = BreedTweaks.fatigue_types.roamer.running_attack,
		difficulty_diminishing_damage = BreedTweaks.diminishing_damage_and_cooldown.berzerker,
		ignore_staggers = JUMPATTACK_IGNORE_STAGGERS,
		attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_elite,
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
		difficulty_damage = BreedTweaks.difficulty_damage.chaos_roamer_attack,
		considerations = UtilityConsiderations.berzerker_attack,
		fatigue_type = BreedTweaks.fatigue_types.roamer.normal_attack,
		difficulty_diminishing_damage = BreedTweaks.diminishing_damage_and_cooldown.berzerker,
		attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_elite,
		dodge_window_start = BreedTweaks.dodge_windows.normal_attack,
		dodge_window_duration = BreedTweaks.dodge_window_durations.normal_attack,
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
	blocked = {
		blocked_anims = {
			"blocked",
			"blocked_2",
			"blocked_3",
		},
		difficulty_duration = BreedTweaks.blocked_duration.chaos_elite,
	},
	stagger = {
		moving_stagger_minimum_destination_distance = 4,
		moving_stagger_threshold = 2.5,
		scale_animation_speeds = true,
		custom_enter_function = function (unit, blackboard, t, action)
			local combo = blackboard.combo_attack_data

			if combo and combo.aborted then
				local berzerker_stagger_multiplier = blackboard.stagger_type < stagger_types.heavy and math.clamp(blackboard.stagger_type - 1, 1, 1.5) or 1

				if blackboard.stagger_type ~= stagger_types.explosion and blackboard.stagger_type ~= stagger_types.heavy then
					blackboard.stagger_ignore_anim_cb = true
					blackboard.stagger_time = t + blackboard.breed.berzerking_stagger_time * berzerker_stagger_multiplier
				end
			end

			if blackboard.stagger_type == stagger_types.heavy then
				blackboard.stagger_immune_time = t + 2.25
				blackboard.heavy_stagger_immune_time = t + 1.5
			elseif blackboard.stagger_type == stagger_types.explosion then
				blackboard.stagger_immune_time = t + 3.5
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
				moving_fwd = MOVING_STAGGERS,
				moving_bwd = MOVING_STAGGERS,
				moving_left = MOVING_STAGGERS,
				moving_right = MOVING_STAGGERS,
				moving_dwn = MOVING_STAGGERS,
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
				moving_fwd = MOVING_STAGGERS,
				moving_bwd = MOVING_STAGGERS,
				moving_left = MOVING_STAGGERS,
				moving_right = MOVING_STAGGERS,
				moving_dwn = MOVING_STAGGERS,
			},
			{
				fwd = {
					"stagger_fwd_heavy",
					"stagger_fwd_heavy_2",
					"stagger_fwd_heavy_3",
					"stagger_fwd_heavy_4",
				},
				bwd = {
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
					"stagger_bwd_heavy",
					"stagger_bwd_heavy_2",
					"stagger_bwd_heavy_3",
					"stagger_bwd_heavy_4",
				},
				moving_fwd = MOVING_HVY_STAGGERS,
				moving_bwd = MOVING_HVY_STAGGERS,
				moving_left = MOVING_HVY_STAGGERS,
				moving_right = MOVING_HVY_STAGGERS,
				moving_dwn = MOVING_HVY_STAGGERS,
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
				moving_fwd = MOVING_STAGGERS,
				moving_bwd = MOVING_STAGGERS,
				moving_left = MOVING_STAGGERS,
				moving_right = MOVING_STAGGERS,
				moving_dwn = MOVING_STAGGERS,
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
				moving_fwd = MOVING_STAGGERS,
				moving_bwd = MOVING_STAGGERS,
				moving_left = MOVING_STAGGERS,
				moving_right = MOVING_STAGGERS,
				moving_dwn = MOVING_STAGGERS,
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
				moving_fwd = MOVING_HVY_STAGGERS,
				moving_bwd = MOVING_HVY_STAGGERS,
				moving_left = MOVING_HVY_STAGGERS,
				moving_right = MOVING_HVY_STAGGERS,
				moving_dwn = MOVING_HVY_STAGGERS,
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
				moving_fwd = MOVING_STAGGERS,
				moving_bwd = MOVING_STAGGERS,
				moving_left = MOVING_STAGGERS,
				moving_right = MOVING_STAGGERS,
				moving_dwn = MOVING_STAGGERS,
			},
			{
				fwd = {},
				bwd = {},
				left = {},
				right = {},
				moving_fwd = {},
				moving_bwd = {},
				moving_left = {},
				moving_right = {},
				moving_dwn = {},
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
				moving_fwd = MOVING_STAGGERS,
				moving_bwd = MOVING_STAGGERS,
				moving_left = MOVING_STAGGERS,
				moving_right = MOVING_STAGGERS,
				moving_dwn = MOVING_STAGGERS,
			},
		},
	},
}
local frenzy_attack = {
	action_weight = 10,
	attack_anim = "attack_pounce",
	attack_intensity = 5,
	attack_intensity_type = "frenzy",
	combo_anim_variations = 3,
	combo_attack_cycle_index = 0,
	cooldown = -1,
	damage = 4,
	damage_type = "cutting_berserker",
	fatigue_type = "blocked_attack",
	move_anim = "move_fwd",
	moving_attack = true,
	num_attacks = 3,
	player_push_speed = 4,
	difficulty_attack_intensity = AttackIntensityPerDifficulty,
	considerations = UtilityConsiderations.berzerker_frenzy_attack,
	ignore_staggers = DEFAULT_ALLOWED_STAGGERS,
	attack_directions = {
		attack_combo_1_01 = "left",
		attack_combo_1_02 = "left",
		attack_combo_1_03 = "right",
		attack_combo_1_04 = "right",
		attack_combo_1_05 = "left",
		attack_combo_2_01 = "right",
		attack_combo_2_02 = "left",
		attack_combo_2_03 = "right",
		attack_combo_2_04 = "left",
		attack_combo_2_05 = "right",
		attack_combo_2_finish = "left",
		attack_combo_3_01 = "right",
		attack_combo_3_02 = "left",
		attack_combo_3_03 = "right",
		attack_combo_3_04 = "right",
		attack_combo_3_finish = "left",
		attack_lunge = "left",
		attack_move = "left",
		attack_pounce = "left",
		attack_pounce_2 = "right",
		attack_run = "left",
	},
	init_blackboard = {
		time_since_last_combo = math.huge,
	},
	combo_attacks = {
		attack_1b = {
			attack_start_slow_factor_time = 0.25,
			attack_start_slow_fraction = 0.75,
			combo_cooldown_start = true,
			fatigue_type = "blocked_berzerker",
			next = "attack_2",
			no_abort_attack = true,
			rotation_scheme = "continuous",
			run_speed = 4,
			anim = {
				"attack_combo_1_01",
				"attack_combo_2_01",
				"attack_combo_3_01",
			},
			move_anim = {
				"attack_combo_1_01",
				"attack_combo_2_01",
				"attack_combo_3_01",
			},
			ignore_staggers = DEFAULT_ALLOWED_STAGGERS,
		},
		attack_2 = {
			attack_start_slow_factor_time = 0.25,
			attack_start_slow_fraction = 0.65,
			fatigue_type = "blocked_berzerker",
			next = "attack_3",
			no_abort_attack = true,
			rotation_scheme = "continuous",
			run_speed = 4,
			anim = {
				"attack_combo_1_02",
				"attack_combo_2_02",
				"attack_combo_3_02",
			},
			move_anim = {
				"attack_combo_1_02",
				"attack_combo_2_02",
				"attack_combo_3_02",
			},
			ignore_staggers = DEFAULT_ALLOWED_STAGGERS,
		},
		attack_3 = {
			attack_start_slow_factor_time = 0.25,
			attack_start_slow_fraction = 0.5,
			fatigue_type = "blocked_berzerker",
			next = "attack_4",
			no_abort_attack = true,
			rotation_scheme = "continuous",
			run_speed = 4,
			anim = {
				"attack_combo_1_03",
				"attack_combo_2_03",
				"attack_combo_3_03",
			},
			move_anim = {
				"attack_combo_1_03",
				"attack_combo_2_03",
				"attack_combo_3_03",
			},
			ignore_staggers = DEFAULT_ALLOWED_STAGGERS,
		},
		attack_3b = {
			attack_start_slow_factor_time = 0.25,
			attack_start_slow_fraction = 0.5,
			fatigue_type = "blocked_berzerker",
			next = "attack_medium",
			no_abort_attack = true,
			rotation_scheme = "continuous",
			run_speed = 5,
			anim = {
				"attack_combo_1_04",
				"attack_combo_2_04",
				"attack_combo_3_04",
			},
			move_anim = {
				"attack_combo_1_04",
				"attack_combo_2_04",
				"attack_combo_3_04",
			},
			ignore_staggers = DEFAULT_ALLOWED_STAGGERS,
		},
		attack_4 = {
			attack_start_slow_factor_time = 0.25,
			attack_start_slow_fraction = 0.5,
			fatigue_type = "blocked_berzerker",
			no_abort_attack = true,
			rotation_scheme = "continuous",
			run_speed = 3.5,
			anim = {
				"attack_combo_1_04",
				"attack_combo_2_04",
				"attack_combo_3_04",
			},
			move_anim = {
				"attack_combo_1_04",
				"attack_combo_2_04",
				"attack_combo_3_04",
			},
			ignore_staggers = DEFAULT_ALLOWED_STAGGERS,
			next = {
				"attack_5",
				"attack_5",
				"attack_heavy",
			},
		},
		attack_5 = {
			attack_start_slow_factor_time = 0.35,
			attack_start_slow_fraction = 0.75,
			fatigue_type = "blocked_berzerker",
			next = "attack_heavy",
			no_abort_attack = true,
			rotation_scheme = "continuous",
			run_speed = 3.5,
			anim = {
				"attack_combo_1_05",
				"attack_combo_2_05",
				"attack_combo_3_05",
			},
			move_anim = {
				"attack_combo_1_05",
				"attack_combo_2_05",
				"attack_combo_3_05",
			},
			ignore_staggers = DEFAULT_ALLOWED_STAGGERS,
		},
		attack_heavy = {
			attack_start_slow_factor_time = 0.35,
			attack_start_slow_fraction = 0.75,
			block_interrupts = false,
			bot_threat_duration = 0.2,
			fatigue_type = "blocked_sv_cleave",
			is_animation_driven = false,
			next = "done",
			rotation_scheme = "continuous",
			run_speed = 3.5,
			anim = {
				"attack_combo_2_finish",
				"attack_combo_2_finish",
				"attack_combo_3_finish",
			},
			move_anim = {
				"attack_combo_2_finish",
				"attack_combo_2_finish",
				"attack_combo_3_finish",
			},
			ignore_staggers = OPENING_ALLOWED_STAGGERS,
			damage_done_time = {
				attack_combo_2_finish = 1.2463768115942029,
				attack_combo_3_finish = 1,
			},
			difficulty_damage = BreedTweaks.difficulty_damage.elite_attack,
		},
	},
	difficulty_damage = BreedTweaks.difficulty_damage.berzerker_frenzy_attack,
	difficulty_diminishing_damage = BreedTweaks.diminishing_damage_and_cooldown.berzerker,
	target_type_exceptions = {
		poison_well = {
			attack_anim = "poison_well",
		},
	},
}

action_data.frenzy_attack = table.create_copy(action_data.frenzy_attack, frenzy_attack)
action_data.frenzy_attack.considerations = UtilityConsiderations.berzerker_frenzy_attack
action_data.frenzy_attack.combo_attacks.attack_1 = {
	attack_intensity_type = "frenzy",
	bot_threat_duration = 0.2,
	combo_cooldown_start = true,
	fatigue_type = "blocked_berzerker",
	next = "attack_2",
	no_abort_attack = true,
	rotation_scheme = "continuous",
	run_speed = 5,
	difficulty_attack_intensity = AttackIntensityPerDifficulty,
	anim = {
		"attack_combo_1_01",
		"attack_combo_2_01",
		"attack_combo_3_01",
	},
	move_anim = {
		"attack_combo_1_01",
		"attack_combo_2_01",
		"attack_combo_3_01",
	},
	ignore_staggers = DEFAULT_ALLOWED_STAGGERS,
}
BreedActions.chaos_berzerker = table.create_copy(BreedActions.chaos_berzerker, action_data)

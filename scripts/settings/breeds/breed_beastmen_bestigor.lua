local stagger_types = require("scripts/utils/stagger_types")
local breed_data = {
	detection_radius = 30,
	perception_previous_attacker_stickyness_value = 0,
	walk_speed = 2.75,
	aoe_height = 1.7,
	has_running_attack = true,
	patrol_active_target_selection = "storm_patrol_death_squad_target_selection",
	exchange_order = 3,
	line_of_sight_distance_sq = 900,
	proximity_system_check = true,
	animation_sync_rpc = "rpc_sync_anim_state_5",
	aoe_radius = 0.4,
	is_always_spawnable = true,
	disable_crowd_dispersion = true,
	target_selection = "pick_bestigor_target_with_weights",
	ai_strength = 3,
	poison_resistance = 100,
	no_stagger_duration = false,
	scale_death_push = 0.7,
	slot_template = "beastmen_elite",
	is_bot_threat = true,
	attack_general_sound_event = "Play_enemy_bestigor_attack_short_husk_vce",
	default_inventory_template = "beastmen_bestigor_2h_axe",
	stagger_resistance = 2.25,
	patrol_detection_radius = 10,
	attack_player_sound_event = "Play_enemy_bestigor_attack_short_vce",
	flingable = true,
	wwise_voice_switch_group = "beastmen_bestigor_vce",
	panic_close_detection_radius_sq = 9,
	radius = 1,
	push_sound_event = "Play_generic_pushed_impact_large",
	dialogue_source_name = "beastmen_bestigor",
	hit_mass_count = 5,
	patrol_active_perception = "perception_regular_update_aggro",
	uses_attack_sfx_callback = true,
	animation_movement_template = "beastmen_bestigor",
	race = "beastmen",
	trigger_dialogue_on_target_switch = true,
	death_reaction = "ai_default",
	armor_category = 2,
	headshot_coop_stamina_fatigue_type = "headshot_special",
	threat_value = 8,
	backstab_player_sound_event = "Play_enemy_bestigor_attack_player_back_vce",
	death_sound_event = "Play_enemy_bestigor_die_short_vce",
	awards_positive_reinforcement_message = true,
	use_navigation_path_splines = true,
	smart_object_template = "special",
	smart_targeting_width = 0.2,
	is_bot_aid_threat = true,
	behavior = "bestigor",
	bone_lod_level = 1,
	bots_should_flank = true,
	has_inventory = true,
	run_speed = 4.8,
	follow_reach = 1,
	ai_toughness = 4,
	passive_in_patrol_start_anim = "move_fwd",
	navigation_spline_distance_to_borders = 1,
	stagger_threshold_light = 0.5,
	hit_reaction = "ai_default",
	passive_in_patrol = true,
	patrol_passive_target_selection = "patrol_passive_target_selection",
	smart_targeting_outer_width = 1,
	hit_effect_template = "HitEffectsBeastmenGor",
	smart_targeting_height_multiplier = 2.5,
	horde_behavior = "bestigor",
	unit_template = "ai_unit_beastmen_bestigor",
	leave_walk_distance = 4.5,
	no_stagger_damage_reduction = true,
	perception = "perception_regular_update_aggro",
	player_locomotion_constrain_radius = 0.7,
	weapon_reach = 2,
	use_backstab_vo = true,
	patrol_passive_perception = "perception_regular",
	vortexable = true,
	base_unit = "units/beings/enemies/beastmen_bestigor/chr_beastmen_bestigor",
	enter_walk_distance = 2.5,
	elite = true,
	perception_exceptions = {
		poison_well = true,
		wizard_destructible = true
	},
	perception_weights = {
		target_catapulted_mul = 0.5,
		target_stickyness_bonus_b = 10,
		targeted_by_other_special = -10,
		target_stickyness_duration_a = 2,
		target_stickyness_duration_b = 10,
		aggro_decay_per_sec = 1,
		target_outside_navmesh_mul = 0.5,
		old_target_aggro_mul = 1,
		target_disabled_aggro_mul = 0,
		target_targeted_by_other_charge = 0.2,
		target_is_charged = 0.2,
		max_distance = 50,
		target_stickyness_bonus_a = 50,
		distance_weight = 100,
		target_disabled_mul = 0.15
	},
	navigation_path_spline_config = {
		spline_distance_to_borders = 5,
		max_distance_to_spline_position = 5,
		max_distance_between_gates = 5,
		navigation_channel_radius = 6,
		spline_recomputation_ratio = 0.5,
		channel_smoothing_anle = 20,
		turn_sampling_angle = 25,
		min_distance_between_gates = 0.5
	},
	size_variation_range = {
		1.35,
		1.375
	},
	max_health = BreedTweaks.max_health.bestigor,
	diff_stagger_resist = BreedTweaks.diff_stagger_resist.bestigor,
	hit_mass_counts = BreedTweaks.hit_mass_counts.bestigor,
	stagger_duration = BreedTweaks.stagger_duration.bestigor,
	stagger_reduction = BreedTweaks.stagger_reduction.bestigor,
	bloodlust_health = BreedTweaks.bloodlust_health.beastmen_elite,
	wwise_voices = {
		"bestigor_vce_profile_a",
		"bestigor_vce_profile_b",
		"bestigor_vce_robert_vernon"
	},
	debug_color = {
		255,
		200,
		0,
		170
	},
	animation_merge_options = {
		idle_animation_merge_options = {},
		walk_animation_merge_options = {},
		move_animation_merge_options = {}
	},
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
	run_on_spawn = AiBreedSnippets.on_beastmen_bestigor_spawn,
	run_on_update = AiBreedSnippets.on_beastmen_bestigor_update,
	run_on_death = AiBreedSnippets.on_beastmen_bestigor_death,
	run_on_despawn = AiBreedSnippets.on_beastmen_bestigor_death,
	hitzone_multiplier_types = {
		head = "headshot"
	},
	hit_zones = {
		head = {
			prio = 1,
			actors = {
				"c_head"
			},
			push_actors = {
				"j_head",
				"j_neck",
				"j_spine1"
			}
		},
		neck = {
			prio = 1,
			actors = {
				"c_neck"
			},
			push_actors = {
				"j_head",
				"j_neck",
				"j_spine1"
			}
		},
		torso = {
			prio = 2,
			actors = {
				"c_spine1",
				"c_spine",
				"c_hips"
			},
			push_actors = {
				"j_neck",
				"j_spine1",
				"j_hips"
			}
		},
		left_arm = {
			prio = 3,
			actors = {
				"c_leftshoulder",
				"c_leftarm",
				"c_leftforearm",
				"c_lefthand"
			},
			push_actors = {
				"j_spine1",
				"j_leftshoulder",
				"j_leftarm"
			}
		},
		right_arm = {
			prio = 3,
			actors = {
				"c_rightshoulder",
				"c_rightarm",
				"c_rightforearm",
				"c_righthand"
			},
			push_actors = {
				"j_spine1",
				"j_rightshoulder",
				"j_rightarm"
			}
		},
		left_leg = {
			prio = 3,
			actors = {
				"c_leftupleg",
				"c_leftleg",
				"c_leftfoot"
			},
			push_actors = {
				"j_leftfoot",
				"j_rightfoot",
				"j_hips"
			}
		},
		right_leg = {
			prio = 3,
			actors = {
				"c_rightupleg",
				"c_rightleg",
				"c_rightfoot"
			},
			push_actors = {
				"j_leftfoot",
				"j_rightfoot",
				"j_hips"
			}
		},
		full = {
			prio = 4,
			actors = {}
		},
		afro = {
			prio = 5,
			actors = {
				"c_afro"
			}
		}
	},
	hitbox_ragdoll_translation = {
		c_leftupleg = "j_leftupleg",
		c_rightarm = "j_rightarm",
		c_leftshoulder = "j_leftshoulder",
		c_rightshoulder = "j_rightshoulder",
		c_rightfoot = "j_rightfoot",
		c_rightleg = "j_rightleg",
		c_lefthand = "j_lefthand",
		c_rightforearm = "j_rightforearm",
		c_leftleg = "j_leftleg",
		c_righthand = "j_righthand",
		c_rightupleg = "j_rightupleg",
		c_spine = "j_spine",
		c_head = "j_head",
		c_leftforearm = "j_leftforearm",
		c_leftfoot = "j_leftfoot",
		c_neck = "j_neck",
		c_spine1 = "j_spine1",
		c_leftarm = "j_leftarm",
		c_hips = "j_hips"
	},
	ragdoll_actor_thickness = {
		j_rightfoot = 0.2,
		j_spine1 = 0.3,
		j_leftarm = 0.2,
		j_leftforearm = 0.2,
		j_leftleg = 0.2,
		j_leftshoulder = 0.3,
		j_rightarm = 0.2,
		j_leftupleg = 0.2,
		j_rightshoulder = 0.3,
		j_righthand = 0.2,
		j_righttoebase = 0.2,
		j_hips = 0.3,
		j_rightleg = 0.2,
		j_leftfoot = 0.2,
		j_rightupleg = 0.2,
		j_lefttoebase = 0.2,
		j_head = 0.3,
		j_neck = 0.3,
		j_spine = 0.3,
		j_lefthand = 0.2,
		j_rightforearm = 0.2
	}
}
Breeds.beastmen_bestigor = table.create_copy(Breeds.beastmen_bestigor, breed_data)
Breeds.beastmen_bestigor_dummy = table.create_copy(Breeds.beastmen_bestigor_dummy, breed_data)
Breeds.beastmen_bestigor_dummy.behavior = "beastmen_dummy"
Breeds.beastmen_bestigor_dummy.horde_behavior = "beastmen_dummy"
Breeds.beastmen_bestigor_dummy.debug_spawn_category = "Misc"
Breeds.beastmen_bestigor_dummy.perception = "perception_no_seeing"
local AttackIntensityPerDifficulty = {
	sweep = {
		easy = {
			normal = 1.5,
			sweep = 3
		},
		normal = {
			normal = 1.5,
			sweep = 3
		},
		hard = {
			normal = 1.5,
			sweep = 3
		},
		harder = {
			normal = 1.5,
			sweep = 3
		},
		hardest = {
			normal = 1.5,
			sweep = 3
		},
		cataclysm = {
			normal = 1.5,
			sweep = 3
		},
		cataclysm_2 = {
			normal = 1.5,
			sweep = 3
		},
		cataclysm_3 = {
			normal = 1.5,
			sweep = 3
		}
	},
	cleave = {
		easy = {
			cleave = 3,
			normal = 1.5
		},
		normal = {
			cleave = 3,
			normal = 1.5
		},
		hard = {
			cleave = 3,
			normal = 1.5
		},
		harder = {
			cleave = 3,
			normal = 1.5
		},
		hardest = {
			cleave = 3,
			normal = 1.5
		},
		cataclysm = {
			cleave = 3,
			normal = 1.5
		},
		cataclysm_2 = {
			cleave = 3,
			normal = 1.5
		},
		cataclysm_3 = {
			cleave = 3,
			normal = 1.5
		}
	},
	push = {
		easy = {
			push = 1.5
		},
		normal = {
			push = 1.5
		},
		hard = {
			push = 1.5
		},
		harder = {
			push = 1.5
		},
		hardest = {
			push = 1.5
		},
		cataclysm = {
			push = 1.5
		},
		cataclysm_2 = {
			push = 1.5
		},
		cataclysm_3 = {
			push = 1.5
		}
	},
	running = {
		easy = {
			running = 3.5
		},
		normal = {
			running = 3.5
		},
		hard = {
			running = 3.5
		},
		harder = {
			running = 3.5
		},
		hardest = {
			running = 3.5
		},
		cataclysm = {
			running = 3.5
		},
		cataclysm_2 = {
			running = 3.5
		},
		cataclysm_3 = {
			running = 3.5
		}
	},
	charge = {
		easy = {
			charge = 10
		},
		normal = {
			charge = 10
		},
		hard = {
			charge = 10
		},
		harder = {
			charge = 10
		},
		hardest = {
			charge = 10
		},
		cataclysm = {
			charge = 10
		},
		cataclysm_2 = {
			charge = 10
		},
		cataclysm_3 = {
			charge = 10
		}
	}
}
local action_data = {
	alerted = {
		no_hesitation = true,
		cooldown = -1,
		action_weight = 1,
		start_anims_name = {
			bwd = "alerted_bwd",
			fwd = "alerted_fwd",
			left = "alerted_left",
			right = "alerted_right"
		},
		start_anims_data = {
			alerted_fwd = {},
			alerted_bwd = {
				dir = -1,
				rad = math.pi
			},
			alerted_left = {
				dir = 1,
				rad = math.pi / 2
			},
			alerted_right = {
				dir = -1,
				rad = math.pi / 2
			}
		}
	},
	follow = {
		cooldown = -1,
		action_weight = 1,
		start_anims_name = {
			bwd = "move_start_bwd",
			fwd = "move_start_fwd",
			left = "move_start_left",
			right = "move_start_right"
		},
		start_anims_data = {
			move_start_fwd = {},
			move_start_bwd = {
				dir = -1,
				rad = math.pi
			},
			move_start_left = {
				dir = 1,
				rad = math.pi / 2
			},
			move_start_right = {
				dir = -1,
				rad = math.pi / 2
			}
		},
		considerations = UtilityConsiderations.clan_rat_follow
	},
	combat_step = {
		action_weight = 1,
		considerations = UtilityConsiderations.chaos_warrior_combat_step,
		start_anims_data = {
			combat_step_fwd = {},
			combat_step_bwd = {
				dir = -1,
				rad = math.pi
			},
			combat_step_left = {
				dir = 1,
				rad = math.pi / 2
			},
			combat_step_right = {
				dir = -1,
				rad = math.pi / 2
			}
		}
	},
	special_attack = {
		action_weight = 1,
		considerations = UtilityConsiderations.storm_vermin_special_attack
	},
	running_attack = {
		action_weight = 10,
		considerations = UtilityConsiderations.storm_vermin_running_attack
	},
	special_attack_cleave = {
		height = 3,
		offset_forward = 0,
		offset_up = 0,
		cooldown = 1,
		rotation_time = 1,
		hit_react_type = "heavy",
		bot_threat_duration = 0.7,
		bot_threat_start_time = 0.5,
		damage_type = "cutting",
		attack_anim = "attack_special",
		range = 3,
		damage = 30,
		knocked_down_attack_threshold = 0.6,
		attack_intensity_type = "cleave",
		action_weight = 1,
		move_anim = "move_fwd",
		width = 0.4,
		considerations = UtilityConsiderations.bestigor_cleave_attack,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		knocked_down_attack_anim = {
			"attack_downed"
		},
		difficulty_damage = BreedTweaks.difficulty_damage.elite_attack_heavy,
		fatigue_type = BreedTweaks.fatigue_types.elite_cleave.normal_attack,
		ignore_staggers = {
			true,
			false,
			false,
			true,
			true,
			false
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.beastmen_elite
	},
	special_attack_sweep = {
		hit_react_type = "medium",
		height = 0.5,
		offset_forward = 0.5,
		offset_up = 0.7,
		cooldown = 1,
		rotation_time = 1,
		bot_threat_duration = 0.7,
		bot_threat_start_time = 0.5,
		damage_type = "cutting",
		range = 2.4,
		damage = 20,
		knocked_down_attack_threshold = 0.6,
		attack_intensity_type = "sweep",
		action_weight = 1,
		move_anim = "move_fwd",
		width = 2,
		considerations = UtilityConsiderations.bestigor_sweep_attack,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		attack_anim = {
			"attack_pounce",
			"attack_pounce_2"
		},
		step_attack_anim = {
			"attack_move",
			"attack_move_2"
		},
		knocked_down_attack_anim = {
			"attack_downed"
		},
		difficulty_damage = BreedTweaks.difficulty_damage.elite_attack,
		fatigue_type = BreedTweaks.fatigue_types.elite_sweep.normal_attack,
		ignore_staggers = {
			false,
			false,
			false,
			false,
			false,
			false
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.beastmen_elite
	},
	push_attack = {
		impact_push_speed = 7,
		damage = 0,
		max_impact_push_speed = 8,
		fatigue_type = "sv_push",
		hit_react_type = "heavy",
		attack_intensity_type = "push",
		action_weight = 1,
		damage_type = "blunt",
		unblockable = true,
		attack_anim = "attack_push",
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.storm_vermin_push_attack,
		ignore_staggers = {
			true,
			false,
			false,
			true,
			true,
			false
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.beastmen_elite
	},
	utility_action = {
		fail_cooldown = 0.1,
		name = "utility_action"
	},
	charge_attack = {
		slow_down_speed = 1,
		impact_animation = "charge_impact",
		charge_max_speed_at = 3,
		dodge_past_sound_event = "Play_enemy_bestigor_charge_attack_miss",
		charge_at_max_speed_duration = 3,
		max_slowdown_percentage = 0.25,
		charge_rotation_speed = 5,
		min_slowdown_angle = 20,
		slow_down_start_time = 0.55,
		cancel_animation = "charge_cancel",
		charge_blocked_animation = "charge_blocked",
		cancel_slow_down_speed = 2,
		hit_target_slow_down_speed = 3,
		start_align_t = 0.16666666666666666,
		end_align_t = 0.5666666666666667,
		shield_blocked_fatigue_type = "blocked_sv_cleave",
		radius = 1.25,
		animation_move_speed = 10,
		align_to_target_animation = "turn_bwd",
		attack_intensity_type = "charge",
		action_weight = 8,
		hit_ai_radius = 1,
		player_push_speed_blocked = 10,
		target_extrapolation_length_scale = 50,
		dodge_past_push_speed = 8,
		max_slowdown_angle = 40,
		ignore_ledge_death = false,
		wall_collision_check_range = 0.75,
		cooldown = -1,
		lunge_rotation_speed = 6.5,
		hit_react_type = "heavy",
		fatigue_type = "blocked_charge",
		damage = 20,
		disable_path_splines_on_exit = true,
		ignore_ai_damage = true,
		damage_type = "cutting",
		charge_speed_min = 8,
		charge_speed_max = 10,
		start_animation = "charge_start",
		head_radius = 1.3,
		target_dodged_radius = 0.5,
		player_push_speed = 9.5,
		blocked_velocity_scale = 1.5,
		max_angle_to_allow_lunge = 60,
		charge_notification_sound_event = "Play_boss_aggro_enter",
		lunge_rotation_slow_down_speed = 2,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.beastmen_charge,
		charging_distance_thresholds = {
			far = 10,
			medium = 6,
			short = 4
		},
		tracking_durations = {
			far = 4,
			medium = 1.5,
			short = 1
		},
		enter_lunge_thresholds = {
			far = 10,
			medium = 7.5,
			short = 4
		},
		lunge_velocity_scaling = {
			far = 1.7,
			medium = 1.1,
			short = 0.6
		},
		charging_animations = {
			far = "charge_loop",
			medium = "charge_loop",
			short = "charge_loop"
		},
		lunge_animations = {
			far = "charge_lunge_far",
			medium = "charge_lunge_medium",
			short = "charge_lunge_short"
		},
		push_ai = {
			stagger_distance = 1.5,
			stagger_impact = {
				stagger_types.explosion,
				stagger_types.explosion,
				stagger_types.none,
				stagger_types.none,
				stagger_types.explosion
			},
			stagger_duration = {
				3,
				1,
				0,
				0,
				4
			}
		},
		difficulty_damage = {
			harder = 10,
			hard = 7,
			normal = 5,
			hardest = 20,
			cataclysm = 20,
			cataclysm_3 = 20,
			cataclysm_2 = 20,
			easy = 5
		},
		ignore_staggers = {
			true,
			false,
			false,
			false,
			true,
			false
		}
	},
	combat_shout = {
		cooldown = -1,
		shout_anim = "shout",
		action_weight = 1,
		considerations = UtilityConsiderations.clan_rat_shout
	},
	smash_door = {
		hit_react_type = "medium",
		name = "smash_door",
		damage = 10,
		damage_type = "cutting",
		move_anim = "move_fwd",
		unblockable = true,
		attack_anim = "attack_blocker"
	},
	blocked = {
		blocked_anims = {
			"blocked",
			"blocked_2"
		},
		difficulty_duration = BreedTweaks.blocked_duration.beastmen_elite
	},
	stagger = {
		custom_enter_function = function (unit, blackboard, t, action)
			local charge_stagger = blackboard.charge_stagger
			local stagger_anims, override_rotation = nil

			if blackboard.standard_bearer_stagger then
				local stagger_anims = action.standard_stagger_anims[blackboard.stagger_type]
				blackboard.standard_bearer_stagger = nil

				return stagger_anims, "idle"
			end

			if charge_stagger and blackboard.stagger_type ~= stagger_types.explosion and blackboard.stagger_type ~= stagger_types.weak then
				stagger_anims = action.charge_stagger_anims[blackboard.stagger_type]
				blackboard.charge_stagger = nil
				local impact_dir = blackboard.stagger_direction:unbox()
				local new_impact_dir = Quaternion.forward(Unit.local_rotation(unit, 0)) + Vector3.flat(impact_dir) * 0.5

				blackboard.stagger_direction:store(Vector3.normalize(new_impact_dir))

				override_rotation = Quaternion.look(Vector3.normalize(new_impact_dir))
			else
				stagger_anims = action.stagger_anims[blackboard.stagger_type]
			end

			if blackboard.stagger_type == stagger_types.heavy then
				blackboard.stagger_immune_time = t + 2.25
				blackboard.heavy_stagger_immune_time = t + 1.5
			elseif blackboard.stagger_type == stagger_types.explosion then
				blackboard.stagger_immune_time = t + 3.5
				blackboard.heavy_stagger_immune_time = t + 3
			end

			return stagger_anims, "idle", nil, override_rotation
		end,
		stagger_anims = {
			{
				fwd = {
					"stun_fwd_sword",
					"stun_fwd_sword_2"
				},
				bwd = {
					"stun_bwd_sword",
					"stun_bwd_sword_2",
					"stun_bwd_sword_3"
				},
				left = {
					"stun_left_sword",
					"stun_left_sword_2"
				},
				right = {
					"stun_right_sword",
					"stun_right_sword_2",
					"stun_right_sword_3"
				}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd",
					"stagger_bwd_2",
					"stagger_bwd_3",
					"stagger_bwd_4"
				},
				left = {
					"stagger_left"
				},
				right = {
					"stagger_right"
				}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd",
					"stagger_bwd_2",
					"stagger_bwd_3",
					"stagger_bwd_4"
				},
				left = {
					"stagger_left_heavy",
					"stagger_left_heavy_2",
					"stagger_left_heavy_3"
				},
				right = {
					"stagger_right_heavy_3"
				}
			},
			{
				fwd = {
					"stun_ranged_fwd"
				},
				bwd = {
					"stun_ranged_bwd"
				},
				left = {
					"stun_ranged_left"
				},
				right = {
					"stun_ranged_right"
				}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd_stab"
				},
				left = {
					"stagger_left"
				},
				right = {
					"stagger_right"
				}
			},
			{
				fwd = {
					"stagger_fwd_exp"
				},
				bwd = {
					"stagger_bwd_exp"
				},
				left = {
					"stagger_left_exp"
				},
				right = {
					"stagger_right_exp"
				}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd"
				},
				left = {
					"stagger_left"
				},
				right = {
					"stagger_right"
				}
			},
			{
				fwd = {},
				bwd = {},
				left = {},
				right = {}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd",
					"stagger_bwd_2",
					"stagger_bwd_3",
					"stagger_bwd_4"
				},
				left = {
					"stagger_left_heavy",
					"stagger_left_heavy_2",
					"stagger_left_heavy_3"
				},
				right = {
					"stagger_right_heavy_3"
				}
			}
		},
		charge_stagger_anims = {
			{
				fwd = {
					"stagger_fwd_exp"
				},
				bwd = {
					"stagger_bwd_charge"
				},
				left = {
					"stagger_left_charge"
				},
				right = {
					"stagger_right_charge"
				}
			},
			{
				fwd = {
					"stagger_fwd_exp"
				},
				bwd = {
					"stagger_bwd_charge"
				},
				left = {
					"stagger_left_charge"
				},
				right = {
					"stagger_right_charge"
				}
			},
			{
				fwd = {
					"stagger_fwd_exp"
				},
				bwd = {
					"stagger_bwd_charge"
				},
				left = {
					"stagger_left_charge"
				},
				right = {
					"stagger_right_charge"
				}
			},
			{
				fwd = {
					"stagger_fwd_exp"
				},
				bwd = {
					"stagger_bwd_charge"
				},
				left = {
					"stagger_left_charge"
				},
				right = {
					"stagger_right_charge"
				}
			},
			{
				fwd = {
					"stagger_fwd_exp"
				},
				bwd = {
					"stagger_bwd_charge"
				},
				left = {
					"stagger_left_charge"
				},
				right = {
					"stagger_right_charge"
				}
			},
			{
				fwd = {
					"stagger_fwd_exp"
				},
				bwd = {
					"stagger_bwd_charge"
				},
				left = {
					"stagger_left_charge"
				},
				right = {
					"stagger_right_charge"
				}
			},
			{
				fwd = {
					"stagger_fwd_exp"
				},
				bwd = {
					"stagger_bwd_charge"
				},
				left = {
					"stagger_left_charge"
				},
				right = {
					"stagger_right_charge"
				}
			},
			{
				fwd = {},
				bwd = {},
				left = {},
				right = {}
			},
			{
				fwd = {
					"stagger_fwd_exp"
				},
				bwd = {
					"stagger_bwd_charge"
				},
				left = {
					"stagger_left_charge"
				},
				right = {
					"stagger_right_charge"
				}
			}
		},
		standard_stagger_anims = {
			{
				fwd = {
					"stagger_fwd_cheer_1",
					"stagger_fwd_cheer_2",
					"stagger_fwd_cheer_3"
				},
				bwd = {
					"stagger_fwd_cheer_1",
					"stagger_fwd_cheer_2",
					"stagger_fwd_cheer_3"
				},
				left = {
					"stagger_fwd_cheer_1",
					"stagger_fwd_cheer_2",
					"stagger_fwd_cheer_3"
				},
				right = {
					"stagger_fwd_cheer_1",
					"stagger_fwd_cheer_2",
					"stagger_fwd_cheer_3"
				}
			},
			{
				fwd = {
					"stagger_fwd_cheer_1",
					"stagger_fwd_cheer_2",
					"stagger_fwd_cheer_3"
				},
				bwd = {
					"stagger_fwd_cheer_1",
					"stagger_fwd_cheer_2",
					"stagger_fwd_cheer_3"
				},
				left = {
					"stagger_fwd_cheer_1",
					"stagger_fwd_cheer_2",
					"stagger_fwd_cheer_3"
				},
				right = {
					"stagger_fwd_cheer_1",
					"stagger_fwd_cheer_2",
					"stagger_fwd_cheer_3"
				}
			},
			{
				fwd = {
					"stagger_fwd_cheer_1",
					"stagger_fwd_cheer_2",
					"stagger_fwd_cheer_3"
				},
				bwd = {
					"stagger_fwd_cheer_1",
					"stagger_fwd_cheer_2",
					"stagger_fwd_cheer_3"
				},
				left = {
					"stagger_fwd_cheer_1",
					"stagger_fwd_cheer_2",
					"stagger_fwd_cheer_3"
				},
				right = {
					"stagger_fwd_cheer_1",
					"stagger_fwd_cheer_2",
					"stagger_fwd_cheer_3"
				}
			},
			{
				fwd = {
					"stun_ranged_fwd"
				},
				bwd = {
					"stun_ranged_bwd"
				},
				left = {
					"stun_ranged_left"
				},
				right = {
					"stun_ranged_right"
				}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd_stab"
				},
				left = {
					"stagger_left"
				},
				right = {
					"stagger_right"
				}
			},
			{
				fwd = {
					"stagger_fwd_cheer_1",
					"stagger_fwd_cheer_2",
					"stagger_fwd_cheer_3"
				},
				bwd = {
					"stagger_fwd_cheer_1",
					"stagger_fwd_cheer_2",
					"stagger_fwd_cheer_3"
				},
				left = {
					"stagger_fwd_cheer_1",
					"stagger_fwd_cheer_2",
					"stagger_fwd_cheer_3"
				},
				right = {
					"stagger_fwd_cheer_1",
					"stagger_fwd_cheer_2",
					"stagger_fwd_cheer_3"
				}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd"
				},
				left = {
					"stagger_left"
				},
				right = {
					"stagger_right"
				}
			},
			{
				fwd = {},
				bwd = {},
				left = {},
				right = {}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd",
					"stagger_bwd_2",
					"stagger_bwd_3",
					"stagger_bwd_4"
				},
				left = {
					"stagger_left",
					"stagger_left_heavy_2"
				},
				right = {
					"stagger_right",
					"stagger_right_heavy_2"
				}
			}
		}
	}
}
BreedActions.beastmen_bestigor = table.create_copy(BreedActions.beastmen_bestigor, action_data)

return

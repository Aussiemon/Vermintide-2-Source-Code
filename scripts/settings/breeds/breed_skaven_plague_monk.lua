local stagger_types = require("scripts/utils/stagger_types")
local MOVING_STAGGERS = {
	"stagger_run_light_bwd",
	"stagger_run_light_bwd_2"
}
local MOVING_HVY_STAGGERS = {
	"stagger_run_heavy_bwd",
	"stagger_run_heavy_bwd_2"
}
local breed_data = {
	detection_radius = 24,
	walk_speed = 3.25,
	proximity_system_check = true,
	attack_start_slow_fraction = 0.25,
	poison_resistance = 100,
	berzerker_alert = true,
	animation_sync_rpc = "rpc_sync_anim_state_9",
	ai_toughness = 2,
	is_always_spawnable = true,
	wwise_voice_switch_group = "plague_monk_vce_variations",
	has_inventory = true,
	attack_general_sound_event = "Play_plague_monk_frenzy_attack_vce",
	has_running_attack = true,
	slot_template = "skaven_elite",
	threat_value = 5,
	bone_lod_level = 1,
	awards_positive_reinforcement_message = true,
	default_inventory_template = "dual_sword",
	stagger_resistance = 1.5,
	dialogue_source_name = "skaven_plague_monk",
	flingable = true,
	berzerking_stagger_time = 0.65,
	radius = 2,
	is_bot_threat = true,
	run_speed_interpolation_factor = 0.5,
	hit_mass_count = 2.5,
	stagger_threshold_explosion = 5,
	perception_previous_attacker_stickyness_value = 0,
	race = "skaven",
	ai_strength = 3,
	death_reaction = "ai_default",
	armor_category = 5,
	backstab_player_sound_event = "Play_plague_monk_attack_player_back_vce",
	death_sound_event = "Play_enemy_plague_monk_death_new_vce",
	dodge_timer = 0.15,
	smart_targeting_width = 0.2,
	behavior = "plague_monk",
	during_horde_detection_radius = 12,
	attack_player_sound_event = "Play_plague_monk_frenzy_attack_vce",
	target_selection = "pick_closest_target_with_spillover",
	attack_start_slow_factor_time = 0.2,
	run_speed = 5.5,
	exchange_order = 3,
	stagger_threshold_heavy = 3,
	stagger_threshold_light = 0.75,
	hit_reaction = "ai_default",
	hit_effect_template = "HitEffectsSkavenPlagueMonk",
	using_combo = true,
	passive_walk_speed = 2,
	horde_behavior = "plague_monk",
	unit_template = "ai_unit_plague_monk",
	smart_object_template = "special",
	perception = "perception_regular",
	player_locomotion_constrain_radius = 0.7,
	stagger_threshold_medium = 2,
	weapon_reach = 2,
	horde_target_selection = "horde_pick_closest_target_with_spillover",
	use_backstab_vo = true,
	vortexable = true,
	allow_aoe_push = true,
	base_unit = "units/beings/enemies/skaven_plague_monk/chr_skaven_plague_monk",
	aoe_height = 1.4,
	elite = true,
	animation_merge_options = {
		idle_animation_merge_options = {},
		move_animation_merge_options = {},
		walk_animation_merge_options = {},
		interest_point_animation_merge_options = {}
	},
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
		neck1 = {
			prio = 1,
			actors = {
				"c_neck1"
			},
			push_actors = {
				"j_head",
				"j_neck1",
				"j_spine1"
			}
		},
		torso = {
			prio = 2,
			actors = {
				"c_spine2",
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
				"c_leftfoot",
				"c_lefttoebase"
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
				"c_rightfoot",
				"c_righttoebase"
			},
			push_actors = {
				"j_leftfoot",
				"j_rightfoot",
				"j_hips"
			}
		},
		tail = {
			prio = 3,
			actors = {
				"c_tail1",
				"c_tail2",
				"c_tail3",
				"c_tail4",
				"c_tail5",
				"c_tail6"
			},
			push_actors = {
				"j_hips",
				"j_taill"
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
		c_righthand = "j_righthand",
		c_rightfoot = "j_rightfoot",
		c_tail2 = "j_tail2",
		c_rightleg = "j_rightleg",
		c_lefthand = "j_lefthand",
		c_tail5 = "j_tail5",
		c_leftleg = "j_leftleg",
		c_spine2 = "j_spine1",
		c_tail6 = "j_tail6",
		c_rightupleg = "j_rightupleg",
		c_tail1 = "j_taill",
		c_neck1 = "j_neck1",
		c_tail4 = "j_tail4",
		c_spine = "j_spine",
		c_head = "j_head",
		c_leftforearm = "j_leftforearm",
		c_righttoebase = "j_righttoebase",
		c_leftfoot = "j_leftfoot",
		c_neck = "j_neck",
		c_tail3 = "j_tail3",
		c_rightforearm = "j_rightforearm",
		c_leftarm = "j_leftarm",
		c_hips = "j_hips",
		c_lefttoebase = "j_lefttoebase"
	},
	ragdoll_actor_thickness = {
		j_rightfoot = 0.2,
		j_taill = 0.05,
		j_leftarm = 0.2,
		j_leftforearm = 0.2,
		j_leftleg = 0.2,
		j_tail3 = 0.05,
		j_neck1 = 0.3,
		j_leftupleg = 0.2,
		j_rightshoulder = 0.3,
		j_rightarm = 0.2,
		j_righttoebase = 0.2,
		j_tail4 = 0.05,
		j_hips = 0.3,
		j_spine1 = 0.3,
		j_rightleg = 0.2,
		j_leftfoot = 0.2,
		j_leftshoulder = 0.3,
		j_tail5 = 0.05,
		j_rightupleg = 0.2,
		j_righthand = 0.2,
		j_lefttoebase = 0.2,
		j_head = 0.3,
		j_tail6 = 0.05,
		j_neck = 0.3,
		j_spine = 0.3,
		j_lefthand = 0.2,
		j_rightforearm = 0.2,
		j_tail2 = 0.05
	},
	perception_exceptions = {
		poison_well = true,
		wizard_destructible = true
	},
	infighting = InfightingSettings.small,
	max_health = BreedTweaks.max_health.plague_monk,
	bloodlust_health = BreedTweaks.bloodlust_health.skaven_elite,
	diff_stagger_resist = BreedTweaks.diff_stagger_resist.plague_monk,
	stagger_reduction = BreedTweaks.stagger_reduction.plague_monk,
	stagger_duration = BreedTweaks.stagger_duration.plague_monk,
	stagger_duration_difficulty_mod = BreedTweaks.stagger_duration_difficulty_mod.default,
	hit_mass_counts = BreedTweaks.hit_mass_counts.plague_monk,
	num_push_anims = {
		push_backward = 2
	},
	wwise_voices = {
		"plague_monk_high",
		"plague_monk_medium",
		"plague_monk_low"
	},
	status_effect_settings = {
		category = "small",
		ignored_statuses = table.set({
			StatusEffectNames.burning_warpfire
		})
	},
	debug_color = {
		255,
		200,
		40,
		40
	}
}
Breeds.skaven_plague_monk = table.create_copy(Breeds.skaven_plague_monk, breed_data)
local AttackIntensityPerDifficulty = {
	normal = {
		easy = {
			normal = 2
		},
		normal = {
			normal = 2
		},
		hard = {
			normal = 2
		},
		harder = {
			normal = 2
		},
		hardest = {
			normal = 2
		},
		cataclysm = {
			normal = 2
		},
		cataclysm_2 = {
			normal = 2
		},
		cataclysm_3 = {
			normal = 2
		}
	},
	frenzy = {
		easy = {
			normal = 2.5,
			frenzy = 5
		},
		normal = {
			normal = 2.5,
			frenzy = 5
		},
		hard = {
			normal = 2.5,
			frenzy = 5
		},
		harder = {
			normal = 2.5,
			frenzy = 5
		},
		hardest = {
			normal = 2.5,
			frenzy = 5
		},
		cataclysm = {
			normal = 2.5,
			frenzy = 5
		},
		cataclysm_2 = {
			normal = 2.5,
			frenzy = 5
		},
		cataclysm_3 = {
			normal = 2.5,
			frenzy = 5
		}
	},
	running = {
		easy = {
			running = 2.5
		},
		normal = {
			running = 2.5
		},
		hard = {
			running = 2.5
		},
		harder = {
			running = 2.5
		},
		hardest = {
			running = 2.5
		},
		cataclysm = {
			running = 2.5
		},
		cataclysm_2 = {
			running = 2.5
		},
		cataclysm_3 = {
			running = 2.5
		}
	}
}
local DEFAULT_ALLOWED_STAGGERS = {
	true,
	false,
	false,
	true,
	true,
	false,
	true
}
local OPENING_ALLOWED_STAGGERS = {
	true,
	true,
	true,
	true,
	true,
	true,
	true
}
local JUMPATTACK_ALLOWED_STAGGERS = {
	false,
	false,
	false,
	false,
	false,
	true,
	false
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
	running_attack = {
		damage = 3,
		player_push_speed = 3,
		attack_intensity_type = "running",
		action_weight = 10,
		damage_type = "cutting",
		moving_attack = true,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		default_attack = {
			anims = "attack_move"
		},
		difficulty_damage = BreedTweaks.difficulty_damage.skaven_roamer_attack,
		considerations = UtilityConsiderations.clan_rat_running_attack,
		fatigue_type = BreedTweaks.fatigue_types.roamer.running_attack,
		diminishing_damage = {},
		difficulty_diminishing_damage = BreedTweaks.diminishing_damage_and_cooldown.berzerker,
		dodge_window_start = BreedTweaks.dodge_windows.running_attack,
		dodge_window_duration = BreedTweaks.dodge_window_durations.running_attack
	},
	normal_attack = {
		cooldown = 3,
		damage_type = "cutting",
		damage = 3,
		player_push_speed = 3,
		attack_intensity_type = "normal",
		action_weight = 1,
		move_anim = "move_fwd",
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		default_attack = {
			anims = "attack_pounce"
		},
		high_attack = {
			z_threshold = 1.5,
			anims = {
				"attack_pounce",
				"attack_pounce",
				"attack_pounce",
				"attack_pounce"
			},
			damage_box_range = {
				flat = 1.5,
				up = 3.8,
				down = 0
			}
		},
		mid_attack = {
			z_threshold = -0.6,
			flat_threshold = 1.5,
			anims = {
				"attack_pounce",
				"attack_pounce",
				"attack_pounce"
			},
			damage_box_range = {
				flat = 2,
				up = 1.7,
				down = -2
			}
		},
		low_attack = {
			z_threshold = -0.6,
			anims = {
				"attack_pounce",
				"attack_pounce",
				"attack_pounce"
			},
			damage_box_range = {
				flat = 1,
				up = 1.7,
				down = -3
			}
		},
		knocked_down_attack = {
			z_threshold = 0.6,
			anims = {
				"attack_pounce_down",
				"attack_pounce_down_2"
			},
			damage_box_range = {
				flat = 1,
				up = 1.7,
				down = -3
			}
		},
		target_type_exceptions = {
			poison_well = {
				anims = "poison_well",
				damage_box_range = {
					flat = 2,
					up = 1.7,
					down = -0.75
				}
			}
		},
		difficulty_damage = BreedTweaks.difficulty_damage.skaven_roamer_attack,
		considerations = UtilityConsiderations.plague_monk_normal_attack,
		fatigue_type = BreedTweaks.fatigue_types.roamer.normal_attack,
		diminishing_damage = {},
		difficulty_diminishing_damage = BreedTweaks.diminishing_damage_and_cooldown.berzerker,
		dodge_window_start = BreedTweaks.dodge_windows.normal_attack,
		dodge_window_duration = BreedTweaks.dodge_window_durations.normal_attack
	},
	combat_shout = {
		cooldown = -1,
		shout_anim = "shout",
		action_weight = 1,
		considerations = UtilityConsiderations.clan_rat_shout
	},
	smash_door = {
		unblockable = true,
		name = "smash_door",
		damage = 1,
		damage_type = "cutting",
		move_anim = "move_fwd",
		attack_anim = "attack_pounce"
	},
	blocked = {
		blocked_anims = {
			"blocked",
			"blocked_2",
			"blocked_3"
		},
		difficulty_duration = BreedTweaks.blocked_duration.skaven_elite
	},
	stagger = {
		moving_stagger_minimum_destination_distance = 3,
		scale_animation_speeds = true,
		moving_stagger_threshold = 3,
		custom_enter_function = function (unit, blackboard, t, action)
			local combo = blackboard.combo_attack_data

			if combo and combo.aborted then
				local berzerker_stagger_multiplier = blackboard.stagger_type <= stagger_types.heavy and math.clamp(blackboard.stagger_type - 1, 1, 1.5) or 1

				if blackboard.stagger_type ~= stagger_types.explosion and blackboard.stagger_type ~= stagger_types.heavy then
					blackboard.stagger_ignore_anim_cb = true
					blackboard.stagger_time = t + blackboard.breed.berzerking_stagger_time * berzerker_stagger_multiplier
				end
			end

			local stagger_anims = action.stagger_anims[blackboard.stagger_type]

			return stagger_anims, "idle"
		end,
		stagger_anims = {
			{
				fwd = {
					"stun_bwd_sword"
				},
				bwd = {
					"stun_fwd_sword"
				},
				left = {
					"stun_left_sword"
				},
				right = {
					"stun_right_sword"
				},
				dwn = {
					"stun_bwd_sword"
				},
				moving_fwd = MOVING_STAGGERS,
				moving_bwd = MOVING_STAGGERS,
				moving_left = MOVING_STAGGERS,
				moving_right = MOVING_STAGGERS,
				moving_dwn = MOVING_STAGGERS
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd",
					"stagger_bwd_2"
				},
				left = {
					"stagger_left"
				},
				right = {
					"stagger_right"
				},
				dwn = {
					"stun_bwd_sword"
				},
				moving_fwd = MOVING_STAGGERS,
				moving_bwd = MOVING_STAGGERS,
				moving_left = MOVING_STAGGERS,
				moving_right = MOVING_STAGGERS,
				moving_dwn = MOVING_STAGGERS
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd",
					"stagger_bwd_2"
				},
				left = {
					"stagger_left"
				},
				right = {
					"stagger_right"
				},
				dwn = {
					"stun_bwd_sword"
				},
				moving_fwd = MOVING_HVY_STAGGERS,
				moving_bwd = MOVING_HVY_STAGGERS,
				moving_left = MOVING_HVY_STAGGERS,
				moving_right = MOVING_HVY_STAGGERS,
				moving_dwn = MOVING_HVY_STAGGERS
			},
			{
				fwd = {
					"stun_bwd_sword"
				},
				bwd = {
					"stun_fwd_sword"
				},
				left = {
					"stun_left_sword"
				},
				right = {
					"stun_right_sword"
				},
				moving_fwd = MOVING_STAGGERS,
				moving_bwd = MOVING_STAGGERS,
				moving_left = MOVING_STAGGERS,
				moving_right = MOVING_STAGGERS,
				moving_dwn = MOVING_STAGGERS
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_short_bwd",
					"stagger_short_bwd_2"
				},
				left = {
					"stagger_left"
				},
				right = {
					"stagger_right"
				},
				moving_fwd = MOVING_STAGGERS,
				moving_bwd = MOVING_STAGGERS,
				moving_left = MOVING_STAGGERS,
				moving_right = MOVING_STAGGERS,
				moving_dwn = MOVING_STAGGERS
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
				},
				moving_fwd = MOVING_HVY_STAGGERS,
				moving_bwd = MOVING_HVY_STAGGERS,
				moving_left = MOVING_HVY_STAGGERS,
				moving_right = MOVING_HVY_STAGGERS,
				moving_dwn = MOVING_HVY_STAGGERS
			},
			{
				fwd = {
					"stun_bwd_sword"
				},
				bwd = {
					"stagger_short_bwd",
					"stagger_short_bwd_2"
				},
				left = {
					"stun_left_sword"
				},
				right = {
					"stun_right_sword"
				},
				dwn = {
					"stun_bwd_sword"
				},
				moving_fwd = MOVING_STAGGERS,
				moving_bwd = MOVING_STAGGERS,
				moving_left = MOVING_STAGGERS,
				moving_right = MOVING_STAGGERS,
				moving_dwn = MOVING_STAGGERS
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
				moving_dwn = {}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd",
					"stagger_bwd_2"
				},
				left = {
					"stagger_left"
				},
				right = {
					"stagger_right"
				},
				dwn = {
					"stun_bwd_sword"
				},
				moving_fwd = MOVING_HVY_STAGGERS,
				moving_bwd = MOVING_HVY_STAGGERS,
				moving_left = MOVING_HVY_STAGGERS,
				moving_right = MOVING_HVY_STAGGERS,
				moving_dwn = MOVING_HVY_STAGGERS
			}
		}
	}
}
local frenzy_attack = {
	action_weight = 10,
	combo_anim_variations = 2,
	fatigue_type = "blocked_attack",
	damage_type = "cutting_berserker",
	cooldown = -1,
	num_attacks = 3,
	moving_attack = true,
	attack_anim = "attack_pounce",
	damage = 4,
	player_push_speed = 4,
	attack_intensity_type = "frenzy",
	move_anim = "move_fwd",
	start_sound_event = "Play_enemy_plague_monk_start_frenzy",
	difficulty_attack_intensity = AttackIntensityPerDifficulty,
	considerations = UtilityConsiderations.plague_monk_frenzy_attack,
	ignore_staggers = DEFAULT_ALLOWED_STAGGERS,
	attack_directions = {
		attack_2_run_quick_2 = "right",
		attack_quick_3 = "right",
		attack_run_medium = "right",
		attack_run_quick_2 = "left",
		attack_2_quick_3 = "right",
		attack_pounce_2 = "right",
		attack_2_quick_2 = "left",
		attack_medium = "right",
		attack_2_medium = "left",
		attack_run_medium_2 = "left",
		attack_2_run_quick_3 = "left",
		attack_quick_2 = "left",
		attack_run_quick_3 = "right",
		attack_pounce = "left"
	},
	init_blackboard = {
		time_since_last_combo = math.huge
	},
	combo_attacks = {
		attack_1b = {
			fatigue_type = "blocked_berzerker",
			no_abort_attack = true,
			run_speed = 5,
			rotation_scheme = "continuous",
			combo_cooldown_start = true,
			next = "attack_2",
			anim = {
				"attack_quick_1",
				"attack_2_quick_1"
			},
			move_anim = {
				"attack_run_quick_1",
				"attack_2_run_quick_1"
			},
			ignore_staggers = DEFAULT_ALLOWED_STAGGERS
		},
		attack_2 = {
			rotation_scheme = "continuous",
			next = "attack_3",
			no_abort_attack = true,
			fatigue_type = "blocked_berzerker",
			run_speed = 5,
			anim = {
				"attack_quick_2",
				"attack_2_quick_2"
			},
			move_anim = {
				"attack_run_quick_2",
				"attack_2_run_quick_2"
			},
			ignore_staggers = DEFAULT_ALLOWED_STAGGERS
		},
		attack_2b = {
			rotation_scheme = "continuous",
			next = "attack_3",
			no_abort_attack = true,
			fatigue_type = "blocked_berzerker",
			run_speed = 5,
			anim = {
				"attack_quick_1",
				"attack_2_quick_1"
			},
			move_anim = {
				"attack_run_quick_2",
				"attack_2_run_quick_2"
			},
			ignore_staggers = DEFAULT_ALLOWED_STAGGERS
		},
		attack_3 = {
			no_abort_attack = true,
			rotation_scheme = "continuous",
			next_hit = "attack_3b",
			run_speed = 5,
			fatigue_type = "blocked_berzerker",
			next = "attack_medium",
			anim = {
				"attack_quick_3",
				"attack_2_quick_3"
			},
			move_anim = {
				"attack_run_quick_3",
				"attack_2_run_quick_3"
			},
			ignore_staggers = DEFAULT_ALLOWED_STAGGERS
		},
		attack_3b = {
			rotation_scheme = "continuous",
			next = "attack_medium",
			no_abort_attack = true,
			fatigue_type = "blocked_berzerker",
			run_speed = 5,
			anim = {
				"attack_quick_2",
				"attack_2_quick_2"
			},
			move_anim = {
				"attack_run_quick_3",
				"attack_2_run_quick_3"
			},
			ignore_staggers = DEFAULT_ALLOWED_STAGGERS
		},
		attack_medium = {
			next_blocked = "attack_heavy",
			block_interrupts = true,
			next_hit = "attack_heavy",
			no_abort_attack = true,
			rotation_scheme = "continuous",
			fatigue_type = "blocked_sv_sweep",
			run_speed = 2,
			next = "attack_wild_flailing",
			allow_push_stagger = true,
			anim = {
				"attack_medium",
				"attack_medium_2"
			},
			move_anim = {
				"attack_run_medium",
				"attack_run_medium_2"
			},
			ignore_staggers = DEFAULT_ALLOWED_STAGGERS
		},
		attack_heavy = {
			rotation_scheme = "continuous",
			fatigue_type = "blocked_sv_cleave",
			is_animation_driven = true,
			block_interrupts = true,
			damage = 10,
			bot_threat_duration = 0.2,
			damage_done_time = 1.1,
			next = "done",
			move_anim = "attack_heavy",
			anim = "attack_heavy",
			staggers_allowed = OPENING_ALLOWED_STAGGERS,
			difficulty_damage = BreedTweaks.difficulty_damage.elite_attack
		},
		attack_wild_flailing = {
			fatigue_type = "blocked_sv_sweep",
			is_animation_driven = true,
			run_speed = 0,
			bot_threat_duration = 0.4,
			rotation_scheme = "continuous",
			damage_done_time = 0.9,
			next = "done",
			move_anim = "attack_wild_flailing",
			anim = "attack_wild_flailing",
			staggers_allowed = OPENING_ALLOWED_STAGGERS,
			push_non_targets = {
				close_impact_radius = 1.5,
				lateral_impact_speed = 1.75,
				forward_impact_speed = 1,
				far_impact_radius = 2
			}
		}
	},
	difficulty_damage = BreedTweaks.difficulty_damage.berzerker_frenzy_attack,
	diminishing_damage = {},
	difficulty_diminishing_damage = BreedTweaks.diminishing_damage_and_cooldown.berzerker,
	target_type_exceptions = {
		poison_well = {
			attack_anim = "poison_well"
		}
	}
}
action_data.frenzy_attack = table.create_copy(action_data.frenzy_attack, frenzy_attack)
action_data.frenzy_attack.considerations = UtilityConsiderations.plague_monk_frenzy_attack
action_data.frenzy_attack.combo_attacks.attack_1 = {
	run_speed = 5,
	rotation_scheme = "continuous",
	fatigue_type = "blocked_berzerker",
	no_abort_attack = true,
	bot_threat_duration = 0.2,
	attack_intensity_type = "frenzy",
	combo_cooldown_start = true,
	next = "attack_2",
	move_anim = "attack_run_quick_1",
	anim = "attack_run_quick_1",
	difficulty_attack_intensity = AttackIntensityPerDifficulty,
	staggers_allowed = DEFAULT_ALLOWED_STAGGERS
}
action_data.frenzy_attack_ranged = table.create_copy(action_data.frenzy_attack_ranged, frenzy_attack)
action_data.frenzy_attack_ranged.considerations = UtilityConsiderations.plague_monk_frenzy_attack_ranged
action_data.frenzy_attack_ranged.combo_attacks.attack_1 = {
	fatigue_type = "blocked_berzerker",
	rotation_scheme = "continuous",
	attack_intensity_type = "frenzy",
	run_speed = 6,
	no_abort_attack = true,
	bot_threat_duration = 0.2,
	combo_cooldown_start = true,
	next = "attack_2",
	anim = "attack_run_lunge",
	difficulty_attack_intensity = AttackIntensityPerDifficulty,
	staggers_allowed = JUMPATTACK_ALLOWED_STAGGERS,
	push_non_targets = {
		close_impact_radius = 1.5,
		lateral_impact_speed = 1.75,
		forward_impact_speed = 1,
		far_impact_radius = 2
	}
}
BreedActions.skaven_plague_monk = table.create_copy(BreedActions.skaven_plague_monk, action_data)

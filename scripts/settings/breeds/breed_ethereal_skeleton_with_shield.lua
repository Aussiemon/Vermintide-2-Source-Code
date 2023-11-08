local stagger_types = require("scripts/utils/stagger_types")
local breed_data = {
	detection_radius = 18,
	leave_walk_distance = 5,
	walk_speed = 1.8,
	uses_spawn_animation = true,
	exchange_order = 4,
	patrol_active_target_selection = "pick_closest_target_with_spillover",
	flingable = true,
	hit_effect = "fx/tower_skeletons_hit",
	target_selection = "pick_closest_target_with_spillover",
	aoe_height = 1.4,
	is_always_spawnable = true,
	debug_spawn_category = "Misc",
	no_blood = true,
	scale_death_push = 0.35,
	aim_template = "chaos_marauder",
	shield_blunt_block_sound = "Play_enemy_undead_ethereal_skeleton_shield_impact",
	slot_template = "chaos_roamer",
	no_stagger_duration = true,
	die_on_vortex_land = true,
	wield_inventory_on_spawn = true,
	attack_general_sound_event = "Play_enemy_undead_ethereal_skeleton_attack_vce_husk",
	default_inventory_template = "undead_ethereal_skeleton_with_shield",
	stagger_resistance = 5,
	patrol_detection_radius = 10,
	animation_sync_rpc = "rpc_sync_anim_state_8",
	hesitation_timer = 5,
	attack_player_sound_event = "Play_enemy_undead_ethereal_skeleton_attack_vce",
	panic_close_detection_radius_sq = 9,
	radius = 1,
	use_slot_type = "normal",
	hit_mass_count = 1.5,
	look_at_range = 40,
	patrol_active_perception = "perception_regular",
	poison_resistance = 100,
	perception_previous_attacker_stickyness_value = -7.75,
	race = "undead",
	shield_slashing_block_sound = "Play_enemy_undead_ethereal_skeleton_shield_impact",
	ai_strength = 2,
	death_reaction = "ai_default",
	armor_category = 1,
	shield_stab_block_sound = "Play_enemy_undead_ethereal_skeleton_shield_impact",
	shield_burning_block_sound = "Play_weapon_fire_torch_metal_shield_hit",
	backstab_player_sound_event = "Play_enemy_undead_ethereal_skeleton_attack_vce_back",
	death_sound_event = "Play_enemy_undead_ethereal_skeleton_death",
	uses_attack_sfx_callback = true,
	push_sound_event = "Play_generic_pushed_impact_large",
	is_bot_threat = true,
	threat_value = 2.5,
	smart_targeting_width = 0.2,
	bone_lod_level = 1,
	behavior = "ethereal_skeleton_with_shield",
	use_regular_horde_spawning = false,
	smart_object_template = "chaos_marauder",
	during_horde_detection_radius = 15,
	shield_user = true,
	has_inventory = true,
	run_speed = 4.8,
	follow_reach = 1,
	ai_toughness = 4,
	using_inventory_weakspots = true,
	stagger_threshold_light = 0.5,
	shield_opening_event = "idle",
	hit_reaction = "ai_default",
	passive_in_patrol = false,
	patrol_passive_target_selection = "patrol_passive_target_selection",
	smart_targeting_outer_width = 0.75,
	hit_effect_template = "HitEffectsUndeadEtherealSkeleton",
	smart_targeting_height_multiplier = 2,
	passive_walk_speed = 4.8,
	horde_behavior = "ethereal_skeleton_with_shield",
	unit_template = "ai_unit_skeleton_with_shield",
	has_running_attack = true,
	no_stagger_damage_reduction = true,
	perception = "perception_regular",
	player_locomotion_constrain_radius = 0.7,
	weapon_reach = 2.5,
	horde_target_selection = "horde_pick_closest_target_with_spillover",
	use_backstab_vo = true,
	patrol_passive_perception = "perception_regular",
	vortexable = true,
	base_unit = "units/beings/enemies/undead_ethereal_skeleton/chr_undead_ethereal_skeleton",
	enter_walk_distance = 2.5,
	infighting = InfightingSettings.small,
	passive_in_patrol_start_anim = {
		"move_fwd_4",
		"move_fwd_5",
		"move_fwd_6"
	},
	default_spawn_animation = {
		"spawn_floor",
		"spawn_floor_2",
		"spawn_floor_3",
		"spawn_floor_4",
		"spawn_floor_5",
		"spawn_floor_6",
		"spawn_floor_7",
		"spawn_floor_2",
		"spawn_floor_3",
		"spawn_floor_4",
		"spawn_floor_5",
		"spawn_floor_6",
		"spawn_floor_7"
	},
	perception_exceptions = {
		poison_well = true,
		wizard_destructible = true
	},
	size_variation_range = {
		0.95,
		1.125
	},
	blackboard_init_data = {
		player_locomotion_constrain_radius = 0
	},
	max_health = BreedTweaks.max_health.marauder,
	bloodlust_health = BreedTweaks.bloodlust_health.chaos_roamer,
	stagger_reduction = BreedTweaks.stagger_reduction.marauder,
	diff_stagger_resist = BreedTweaks.diff_stagger_resist.marauder,
	stagger_duration = BreedTweaks.stagger_duration.marauder,
	hit_mass_counts = BreedTweaks.hit_mass_counts.clan_rat,
	status_effect_settings = {
		category = "small",
		ignored_statuses = table.set({
			StatusEffectNames.burning,
			StatusEffectNames.burning_warpfire,
			StatusEffectNames.poisoned
		})
	},
	debug_color = {
		255,
		200,
		40,
		40
	},
	stagger_modifier_function = function (stagger_type, duration, length, hit_zone_name, blackboard, breed, direction)
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
	BTHesitationVariations = {
		hesitate = {
			"outnumbered_1",
			"outnumbered_2",
			"outnumbered_4",
			"outnumbered_5",
			"outnumbered_6",
			"outnumbered_7",
			"outnumbered_8",
			"outnumbered_9"
		},
		hesitate_bwd = {
			"hesitate_bwd_2",
			"hesitate_bwd_3",
			"hesitate_bwd_4",
			"hesitate_bwd_5",
			"hesitate_bwd_6",
			"hesitate_bwd"
		}
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
				"j_neck1",
				"j_spine2"
			}
		},
		neck = {
			prio = 1,
			actors = {
				"c_neck",
				"c_neck1"
			},
			push_actors = {
				"j_head",
				"j_neck",
				"j_neck1",
				"j_spine2"
			}
		},
		torso = {
			prio = 2,
			actors = {
				"c_spine2",
				"c_spine1",
				"c_spine",
				"c_hips"
			},
			push_actors = {
				"j_neck",
				"j_spine2",
				"j_spine1",
				"j_hips",
				"j_spine"
			}
		},
		left_arm = {
			prio = 3,
			actors = {
				"c_leftarm",
				"c_leftforearm",
				"c_lefthand",
				"c_leftshoulder"
			},
			push_actors = {
				"j_spine2",
				"j_leftshoulder",
				"j_leftarm"
			}
		},
		right_arm = {
			prio = 3,
			actors = {
				"c_rightarm",
				"c_rightforearm",
				"c_righthand",
				"c_rightshoulder"
			},
			push_actors = {
				"j_spine2",
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
				"j_leftleg",
				"j_hips",
				"j_spine"
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
				"j_rightfoot",
				"j_rightleg",
				"j_hips",
				"j_spine"
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
		c_rightshoulder = "j_rightshoulder",
		c_rightfoot = "j_rightfoot",
		c_head = "j_head",
		c_rightleg = "j_rightleg",
		c_lefthand = "j_lefthand",
		c_rightforearm = "j_rightforearm",
		c_leftleg = "j_leftleg",
		c_spine2 = "j_spine2",
		c_righthand = "j_righthand",
		c_rightupleg = "j_rightupleg",
		c_neck1 = "j_neck1",
		c_spine = "j_spine",
		c_leftshoulder = "j_leftshoulder",
		c_leftforearm = "j_leftforearm",
		c_leftfoot = "j_leftfoot",
		c_neck = "j_neck",
		c_spine1 = "j_spine1",
		c_leftarm = "j_leftarm",
		c_hips = "j_hips"
	},
	ragdoll_actor_thickness = {
		j_rightfoot = 0.2,
		j_leftarm = 0.2,
		j_leftleg = 0.2,
		j_leftforearm = 0.2,
		j_leftshoulder = 0.3,
		j_neck = 0.3,
		j_neck1 = 0.3,
		j_leftupleg = 0.2,
		j_rightshoulder = 0.3,
		j_rightarm = 0.2,
		j_righttoebase = 0.2,
		j_righthand = 0.2,
		j_hips = 0.3,
		j_rightleg = 0.2,
		j_leftfoot = 0.2,
		j_rightupleg = 0.2,
		j_lefttoebase = 0.2,
		j_head = 0.3,
		j_spine2 = 0.3,
		j_spine1 = 0.3,
		j_spine = 0.3,
		j_lefthand = 0.2,
		j_rightforearm = 0.2
	},
	allowed_layers = {
		planks = 1.5,
		ledges = 1.5,
		bot_ratling_gun_fire = 1,
		jumps = 0,
		ledges_with_fence = 0,
		doors = 1.5,
		teleporters = 5,
		bot_poison_wind = 1.5,
		fire_grenade = 1
	}
}
Breeds.ethereal_skeleton_with_shield = table.create_copy(Breeds.ethereal_skeleton_with_shield, breed_data)
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
local action_data = {
	idle = {
		anim_cycle_index = 0,
		animations = {
			"idle",
			"idle_2",
			"idle_3",
			"idle_4",
			"idle_5",
			"idle_6"
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
			"idle_10"
		},
		alerted_anims = {
			"alerted",
			"alerted_3"
		}
	},
	combat_shout = {
		cooldown = -1,
		shout_anim = "shout",
		action_weight = 1,
		considerations = UtilityConsiderations.clan_rat_shout
	},
	alerted = {
		no_hesitation = true,
		alerted_anims = {
			"alerted",
			"alerted_3",
			"alerted_4"
		},
		easter_egg_alerted_anims = {
			"alerted_2"
		},
		start_anims_name = {
			fwd = {
				"alerted_fwd",
				"alerted_fwd_2",
				"alerted_fwd_3"
			},
			bwd = {
				"alerted_bwd_2",
				"alerted_bwd_3"
			},
			left = {
				"alerted_left",
				"alerted_left_2",
				"alerted_left_3"
			},
			right = {
				"alerted_right",
				"alerted_right_2",
				"alerted_right_3"
			}
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
			},
			alerted_fwd_2 = {},
			alerted_bwd_2 = {
				dir = -1,
				rad = math.pi
			},
			alerted_left_2 = {
				dir = 1,
				rad = math.pi / 2
			},
			alerted_right_2 = {
				dir = -1,
				rad = math.pi / 2
			},
			alerted_fwd_3 = {},
			alerted_bwd_3 = {
				dir = -1,
				rad = math.pi
			},
			alerted_left_3 = {
				dir = 1,
				rad = math.pi / 2
			},
			alerted_right_3 = {
				dir = -1,
				rad = math.pi / 2
			}
		}
	},
	follow = {
		action_weight = 1,
		considerations = UtilityConsiderations.clan_rat_follow,
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
		walk_anims = {
			"move_fwd_walk",
			"move_fwd_walk_2",
			"move_fwd_walk_3",
			"move_fwd_walk_4"
		}
	},
	reposition_on_slot = {
		action_weight = 2,
		considerations = UtilityConsiderations.reposition_on_slot,
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
		walk_anims = {
			"move_fwd_walk",
			"move_fwd_walk_2",
			"move_fwd_walk_3",
			"move_fwd_walk_4"
		}
	},
	running_attack = {
		dodge_rotation_time = 1,
		hit_react_type = "medium",
		damage_type = "cutting",
		attack_intensity = 1,
		moving_attack = true,
		damage = 3,
		player_push_speed = 3,
		attack_intensity_type = "running",
		action_weight = 10,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.marauder_running_attack,
		default_attack = {
			anims = {
				"attack_run",
				"attack_run_2",
				"attack_run_3"
			}
		},
		difficulty_damage = BreedTweaks.difficulty_damage.chaos_roamer_attack,
		fatigue_type = BreedTweaks.fatigue_types.roamer.running_attack,
		diminishing_damage = {},
		difficulty_diminishing_damage = BreedTweaks.diminishing_damage_and_cooldown.roamer,
		dodge_window_start = BreedTweaks.dodge_windows.running_attack,
		dodge_window_duration = BreedTweaks.dodge_window_durations.running_attack,
		attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_roamer
	},
	normal_attack = {
		damage = 3,
		damage_type = "cutting",
		hit_react_type = "medium",
		attack_intensity = 0.5,
		dodge_rotation_time = 1.2,
		weapon_reach = 2.5,
		moving_attack_intensity = 0.75,
		player_push_speed = 5,
		attack_intensity_type = "normal",
		action_weight = 1,
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
				"attack_pounce_7"
			},
			damage_box_range = {
				flat = 2.25,
				up = 1.7,
				down = -0.75
			}
		},
		step_attack = {
			step_distance_moving = 2.5,
			step_speed_moving = 1,
			step_distance_stationary = 3.5,
			moving_attack = true,
			anims = {
				"attack_move",
				"attack_move_2",
				"attack_move_3",
				"attack_move_4"
			},
			damage_box_range = {
				flat = 2.25,
				up = 1.7,
				down = -0.75
			}
		},
		high_attack = {
			z_threshold = 1.5,
			anims = {
				"attack_reach_up",
				"attack_reach_up_2",
				"attack_reach_up_3",
				"attack_reach_up_4"
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
				"attack_pounce_down",
				"attack_pounce_down_2",
				"attack_pounce_down_3"
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
				"attack_reach_down",
				"attack_reach_down_2",
				"attack_reach_down_3"
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
				"attack_pounce_down_2",
				"attack_pounce_down_3"
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
		difficulty_damage = BreedTweaks.difficulty_damage.chaos_roamer_attack,
		fatigue_type = BreedTweaks.fatigue_types.roamer.normal_attack,
		diminishing_damage = {},
		difficulty_diminishing_damage = BreedTweaks.diminishing_damage_and_cooldown.roamer,
		attack_directions = {
			attack_reach_down = "left",
			attack_run_3 = "left",
			attack_pounce_6 = "right",
			attack_pounce_7 = "left",
			attack_run = "left",
			attack_pounce_2 = "right",
			attack_reach_up_3 = "left",
			attack_reach_up_2 = "left",
			attack_move = "left",
			attack_run_2 = "right",
			attack_pounce_5 = "left",
			attack_reach_down_2 = "left",
			attack_move_4 = "right",
			attack_move_2 = "right",
			attack_move_3 = "left",
			attack_reach_up_4 = "left",
			attack_reach_up = "left",
			attack_reach_down_3 = "left",
			attack_pounce_4 = "right",
			attack_pounce_3 = "left",
			attack_pounce = "left"
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_roamer
	},
	shield_bash = {
		damage = 0,
		hit_react_type = "heavy",
		fatigue_type = "blocked_slam",
		attack_intensity_type = "push",
		action_weight = 1,
		impact_push_speed = 22,
		damage_type = "blunt",
		unblockable = true,
		max_impact_push_speed = 18,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.chaos_warrior_push_attack,
		attack_anim = {
			"attack_shield_bash"
		},
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			false
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_elite
	},
	combat_step = {
		move_speed = 4,
		action_weight = 1,
		considerations = UtilityConsiderations.chaos_marauder_combat_step,
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
	climb = {},
	smash_door = {
		unblockable = true,
		damage = 4,
		damage_type = "cutting",
		move_anim = "move_fwd",
		door_attack_distance = 1,
		attack_anim = {
			"attack_blocker",
			"attack_blocker_2",
			"attack_blocker_3"
		}
	},
	utility_action = {
		fail_cooldown_blackboard_identifier = "attack_cooldown_at",
		name = "utility_action",
		fail_cooldown_name = "utility_fail_cooldown"
	},
	blocked = {
		blocked_anims = {
			"blocked"
		},
		difficulty_duration = BreedTweaks.blocked_duration.chaos_roamer
	}
}
action_data.stagger = {
	scale_animation_speeds = true,
	custom_enter_function = function (unit, blackboard, t, action)
		assert(ScriptUnit.has_extension(unit, "ai_shield_system"), "chaos_marauder_with_shield dont have ai_shield_user_extension")

		if blackboard.shield_breaking_hit then
			blackboard.shield_breaking_hit = false

			return action.shield_break_anims[blackboard.stagger_type], "idle", "to_sword"
		end

		local ai_shield_extension = ScriptUnit.extension(unit, "ai_shield_system")
		local stagger_anims, idle_event = nil
		local blocked_stagger = false
		local blocked_previous_attack = ai_shield_extension.blocked_previous_attack
		local using_shield = not ai_shield_extension.shield_broken

		if using_shield and not blackboard.stagger_immune_time and blocked_previous_attack then
			local is_blocking = blackboard.stagger <= 2

			ai_shield_extension:set_is_blocking(is_blocking)

			if not is_blocking then
				blackboard.stagger_time = blackboard.stagger_time + math.clamp(0.2 * blackboard.stagger, 0, 0.6)
			end

			if not blackboard.blocked and blackboard.stagger < 3 and action.shield_block_anims then
				blocked_stagger = true
				stagger_anims = action.shield_block_anims[blackboard.stagger_type]
				idle_event = "idle"
			elseif not blackboard.blocked and blackboard.stagger < 4 and action.shield_stagger_anims then
				blocked_stagger = true
				stagger_anims = action.shield_stagger_anims[blackboard.stagger_type]
				idle_event = blackboard.breed.shield_opening_event or "idle"
			else
				stagger_anims = action.stagger_anims[blackboard.stagger_type]
				idle_event = blackboard.breed.shield_opening_event or "idle"
			end
		else
			ai_shield_extension:set_is_blocking(false)

			stagger_anims = action.stagger_anims[blackboard.stagger_type]
			idle_event = "idle"
		end

		if blackboard.stagger_type == 3 then
			blackboard.stagger_immune_time = t + 2.25
			blackboard.heavy_stagger_immune_time = t + 1.5
		elseif blackboard.stagger_type == 6 then
			blackboard.stagger_immune_time = t + 3.5
			blackboard.heavy_stagger_immune_time = t + 3
		end

		if blocked_previous_attack then
			ai_shield_extension.blocked_previous_attack = false
		end

		return stagger_anims, idle_event
	end,
	custom_exit_function = function (unit, blackboard, t)
		local ai_shield_extension = ScriptUnit.has_extension(unit, "ai_shield_system") and ScriptUnit.extension(unit, "ai_shield_system")

		ai_shield_extension:set_is_blocking(true)
	end,
	stagger_anims = {
		{
			fwd = {
				"stagger_fwd_light",
				"stagger_fwd_light_2",
				"stagger_fwd_light_3",
				"stagger_fwd_light_4",
				"stagger_fwd_light_5",
				"stagger_fwd_light_6"
			},
			bwd = {
				"stagger_bwd_light",
				"stagger_bwd_light_2",
				"stagger_bwd_light_3",
				"stagger_bwd_light_4",
				"stagger_bwd_light_5",
				"stagger_bwd_light_6",
				"stagger_bwd_light_7",
				"stagger_bwd_light_8"
			},
			left = {
				"stagger_left_light",
				"stagger_left_light_2",
				"stagger_left_light_3",
				"stagger_left_light_4"
			},
			right = {
				"stagger_right_light",
				"stagger_right_light_2",
				"stagger_right_light_3",
				"stagger_right_light_4"
			},
			dwn = {
				"stun_down"
			}
		},
		{
			fwd = {
				"stagger_fwd",
				"stagger_fwd_2",
				"stagger_fwd_3",
				"stagger_fwd_4"
			},
			bwd = {
				"stagger_bwd",
				"stagger_bwd_2",
				"stagger_bwd_3",
				"stagger_bwd_4"
			},
			left = {
				"stagger_left",
				"stagger_left_2",
				"stagger_left_3",
				"stagger_left_4",
				"stagger_left_5"
			},
			right = {
				"stagger_right",
				"stagger_right_2",
				"stagger_right_3",
				"stagger_right_4",
				"stagger_right_5"
			},
			dwn = {
				"stagger_medium_downward",
				"stagger_medium_downward_2",
				"stagger_medium_downward_3"
			}
		},
		{
			fwd = {
				"stagger_fwd_heavy",
				"stagger_fwd_heavy_2",
				"stagger_fwd_heavy_3",
				"stagger_fwd_heavy_4"
			},
			bwd = {
				"stagger_up_heavy",
				"stagger_up_heavy_2",
				"stagger_up_heavy_3",
				"stagger_bwd_heavy",
				"stagger_bwd_heavy_2",
				"stagger_bwd_heavy_3",
				"stagger_bwd_heavy_4"
			},
			left = {
				"stagger_left_heavy",
				"stagger_left_heavy_2",
				"stagger_left_heavy_3",
				"stagger_left_heavy_4"
			},
			right = {
				"stagger_right_heavy",
				"stagger_right_heavy_2",
				"stagger_right_heavy_3",
				"stagger_right_heavy_4"
			},
			dwn = {
				"stagger_dwn_heavy",
				"stagger_dwn_heavy_2",
				"stagger_dwn_heavy_3"
			}
		},
		{
			fwd = {
				"stun_fwd_ranged_light",
				"stun_fwd_ranged_light_2",
				"stun_fwd_ranged_light_3"
			},
			bwd = {
				"stun_bwd_ranged_light",
				"stun_bwd_ranged_light_2",
				"stun_bwd_ranged_light_3"
			},
			left = {
				"stun_left_ranged_light",
				"stun_left_ranged_light_2",
				"stun_left_ranged_light_3"
			},
			right = {
				"stun_right_ranged_light",
				"stun_right_ranged_light_2",
				"stun_right_ranged_light_3"
			}
		},
		{
			fwd = {
				"stagger_fwd",
				"stagger_fwd_2",
				"stagger_fwd_3",
				"stagger_fwd_4"
			},
			bwd = {
				"stagger_bwd",
				"stagger_bwd_2",
				"stagger_bwd_3",
				"stagger_bwd_4"
			},
			left = {
				"stagger_left",
				"stagger_left_2",
				"stagger_left_3",
				"stagger_left_4",
				"stagger_left_5"
			},
			right = {
				"stagger_right",
				"stagger_right_2",
				"stagger_right_3",
				"stagger_right_4",
				"stagger_right_5"
			},
			dwn = {
				"stagger_medium_downward",
				"stagger_medium_downward_2",
				"stagger_medium_downward_3"
			}
		},
		{
			fwd = {
				"stagger_explosion_back",
				"stagger_explosion_back_2"
			},
			bwd = {
				"stagger_explosion_front"
			},
			left = {
				"stagger_explosion_left"
			},
			right = {
				"stagger_explosion_right"
			}
		},
		{
			fwd = {
				"stagger_fwd_light",
				"stagger_fwd_light_2",
				"stagger_fwd_light_3",
				"stagger_fwd_light_4",
				"stagger_fwd_light_5",
				"stagger_fwd_light_6"
			},
			bwd = {
				"stagger_bwd_light",
				"stagger_bwd_light_4",
				"stagger_bwd_light_5",
				"stagger_bwd_light_6",
				"stagger_bwd_light_7",
				"stagger_bwd_light_8"
			},
			left = {
				"stagger_left_light",
				"stagger_left_light_2",
				"stagger_left_light_3",
				"stagger_left_light_4"
			},
			right = {
				"stagger_right_light",
				"stagger_right_light_2",
				"stagger_right_light_3",
				"stagger_right_light_4"
			},
			dwn = {
				"stun_down"
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
				"stagger_fwd",
				"stagger_fwd_2",
				"stagger_fwd_3",
				"stagger_fwd_4"
			},
			bwd = {
				"stagger_bwd",
				"stagger_bwd_2",
				"stagger_bwd_3",
				"stagger_bwd_4"
			},
			left = {
				"stagger_left",
				"stagger_left_2",
				"stagger_left_3",
				"stagger_left_4",
				"stagger_left_5"
			},
			right = {
				"stagger_right",
				"stagger_right_2",
				"stagger_right_3",
				"stagger_right_4",
				"stagger_right_5"
			},
			dwn = {
				"stagger_medium_downward",
				"stagger_medium_downward_2",
				"stagger_medium_downward_3"
			}
		}
	},
	shield_block_anims = {
		{
			fwd = {
				"stagger_shield_light"
			},
			bwd = {
				"stagger_shield_light"
			},
			left = {
				"stagger_left_shield_light"
			},
			right = {
				"stagger_right_shield_light"
			},
			dwn = {
				"stagger_shield_light"
			}
		},
		{
			fwd = {
				"stagger_shield_medium"
			},
			bwd = {
				"stagger_shield_medium"
			},
			left = {
				"stagger_left_shield"
			},
			right = {
				"stagger_right_shield"
			},
			dwn = {
				"stagger_shield_medium"
			}
		},
		{
			fwd = {
				"stagger_shield_medium"
			},
			bwd = {
				"stagger_shield_medium"
			},
			left = {
				"stagger_left_shield"
			},
			right = {
				"stagger_right_shield"
			},
			dwn = {
				"stagger_shield_medium"
			}
		},
		{
			fwd = {
				"stagger_shield_light"
			},
			bwd = {
				"stagger_shield_light"
			},
			left = {
				"stagger_left_shield_light"
			},
			right = {
				"stagger_right_shield_light"
			}
		},
		{
			fwd = {
				"stagger_shield_medium"
			},
			bwd = {
				"stagger_shield_medium"
			},
			left = {
				"stagger_left_shield"
			},
			right = {
				"stagger_right_shield"
			}
		},
		{
			fwd = {
				"stagger_explosion_back",
				"stagger_explosion_back_2"
			},
			bwd = {
				"stagger_explosion_front"
			},
			left = {
				"stagger_explosion_left"
			},
			right = {
				"stagger_explosion_right"
			}
		},
		{
			fwd = {
				"stagger_shield_medium"
			},
			bwd = {
				"stagger_shield_medium"
			},
			left = {
				"stagger_left_shield"
			},
			right = {
				"stagger_right_shield"
			},
			dwn = {
				"stagger_shield_medium"
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
				"stagger_shield_medium"
			},
			bwd = {
				"stagger_shield_medium"
			},
			left = {
				"stagger_left_shield"
			},
			right = {
				"stagger_right_shield"
			},
			dwn = {
				"stagger_shield_medium"
			}
		}
	},
	shield_break_anims = {
		{
			fwd = {
				"stagger_shield_medium_break"
			},
			bwd = {
				"stagger_shield_medium_break"
			},
			left = {
				"stagger_shield_medium_break"
			},
			right = {
				"stagger_shield_medium_break"
			},
			dwn = {
				"stagger_shield_medium_break"
			}
		},
		{
			fwd = {
				"stagger_shield_medium_break"
			},
			bwd = {
				"stagger_shield_medium_break"
			},
			left = {
				"stagger_shield_medium_break"
			},
			right = {
				"stagger_shield_medium_break"
			},
			dwn = {
				"stagger_shield_medium_break"
			}
		},
		{
			fwd = {
				"stagger_shield_medium_break"
			},
			bwd = {
				"stagger_shield_medium_break"
			},
			left = {
				"stagger_shield_medium_break"
			},
			right = {
				"stagger_shield_medium_break"
			},
			dwn = {
				"stagger_shield_medium_break"
			}
		},
		{
			fwd = {
				"stagger_shield_medium_break"
			},
			bwd = {
				"stagger_shield_medium_break"
			},
			left = {
				"stagger_shield_medium_break"
			},
			right = {
				"stagger_shield_medium_break"
			},
			dwn = {
				"stagger_shield_medium_break"
			}
		},
		{
			fwd = {
				"stagger_shield_medium_break"
			},
			bwd = {
				"stagger_shield_medium_break"
			},
			left = {
				"stagger_shield_medium_break"
			},
			right = {
				"stagger_shield_medium_break"
			},
			dwn = {
				"stagger_shield_medium_break"
			}
		},
		{
			fwd = {
				"stagger_explosion_back",
				"stagger_explosion_back_2"
			},
			bwd = {
				"stagger_explosion_front"
			},
			left = {
				"stagger_explosion_left"
			},
			right = {
				"stagger_explosion_right"
			}
		},
		{
			fwd = {
				"stagger_shield_medium_break"
			},
			bwd = {
				"stagger_shield_medium_break"
			},
			left = {
				"stagger_shield_medium_break"
			},
			right = {
				"stagger_shield_medium_break"
			},
			dwn = {
				"stagger_shield_medium_break"
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
				"stagger_shield_medium_break"
			},
			bwd = {
				"stagger_shield_medium_break"
			},
			left = {
				"stagger_shield_medium_break"
			},
			right = {
				"stagger_shield_medium_break"
			},
			dwn = {
				"stagger_shield_medium_break"
			}
		}
	},
	shield_stagger_anims = {
		{
			fwd = {
				"stagger_bwd_shield_light"
			},
			bwd = {
				"stagger_bwd_shield_light"
			},
			left = {
				"stagger_bwd_shield_light"
			},
			right = {
				"stagger_bwd_shield_light"
			},
			dwn = {
				"stagger_bwd_shield_light"
			}
		},
		{
			fwd = {
				"stagger_bwd_shield"
			},
			bwd = {
				"stagger_bwd_shield"
			},
			left = {
				"stagger_bwd_shield"
			},
			right = {
				"stagger_bwd_shield"
			},
			dwn = {
				"stagger_bwd_shield"
			}
		},
		{
			fwd = {
				"stagger_bwd_shield_heavy"
			},
			bwd = {
				"stagger_bwd_shield_heavy"
			},
			left = {
				"stagger_bwd_shield_heavy"
			},
			right = {
				"stagger_bwd_shield_heavy"
			},
			dwn = {
				"stagger_bwd_shield_heavy"
			}
		},
		{
			fwd = {
				"stagger_bwd_shield_light"
			},
			bwd = {
				"stagger_bwd_shield_light"
			},
			left = {
				"stagger_bwd_shield_light"
			},
			right = {
				"stagger_bwd_shield_light"
			},
			dwn = {
				"stagger_bwd_shield_light"
			}
		},
		{
			fwd = {
				"stagger_bwd_shield"
			},
			bwd = {
				"stagger_bwd_shield"
			},
			left = {
				"stagger_bwd_shield"
			},
			right = {
				"stagger_bwd_shield"
			},
			dwn = {
				"stagger_bwd_shield"
			}
		},
		{
			fwd = {
				"stagger_explosion_back",
				"stagger_explosion_back_2"
			},
			bwd = {
				"stagger_explosion_front"
			},
			left = {
				"stagger_explosion_left"
			},
			right = {
				"stagger_explosion_right"
			}
		},
		{
			fwd = {
				"stagger_bwd_shield"
			},
			bwd = {
				"stagger_bwd_shield"
			},
			left = {
				"stagger_bwd_shield"
			},
			right = {
				"stagger_bwd_shield"
			},
			dwn = {
				"stagger_bwd_shield"
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
				"stagger_bwd_shield_heavy"
			},
			bwd = {
				"stagger_bwd_shield_heavy"
			},
			left = {
				"stagger_bwd_shield_heavy"
			},
			right = {
				"stagger_bwd_shield_heavy"
			},
			dwn = {
				"stagger_bwd_shield_heavy"
			}
		}
	}
}
action_data.follow_owner = {}
action_data.fallback_idle = action_data.idle
BreedActions.ethereal_skeleton_with_shield = table.create_copy(BreedActions.ethereal_skeleton_with_shield, action_data)

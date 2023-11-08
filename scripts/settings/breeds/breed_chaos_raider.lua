local stagger_types = require("scripts/utils/stagger_types")
local breed_data = {
	detection_radius = 12,
	disable_crowd_dispersion = true,
	walk_speed = 2.2,
	dont_wield_weapon_on_patrol = true,
	patrol_active_target_selection = "storm_patrol_death_squad_target_selection",
	death_reaction = "ai_default",
	ai_toughness = 4,
	scale_death_push = 0.75,
	animation_sync_rpc = "rpc_sync_anim_state_7",
	aoe_radius = 0.4,
	is_always_spawnable = true,
	opt_base_unit = "units/beings/enemies/chaos_raider/chr_chaos_raider_baked",
	exchange_order = 3,
	target_selection = "pick_closest_target_with_spillover",
	ai_strength = 3,
	line_of_sight_distance_sq = 64,
	hit_mass_count = 8,
	slot_template = "chaos_elite",
	no_stagger_duration = true,
	attack_general_sound_event = "Play_enemy_marauder_attack_husk_vce",
	default_inventory_template = "raider_axe_2h",
	stagger_resistance = 3,
	patrol_detection_radius = 10,
	dialogue_source_name = "chaos_marauder",
	flingable = true,
	wwise_voice_switch_group = "marauder_vce_variations",
	panic_close_detection_radius_sq = 9,
	radius = 2,
	use_slot_type = "medium",
	look_at_range = 30,
	patrol_active_perception = "perception_regular",
	attack_player_sound_event = "Play_enemy_marauder_attack_player_vce",
	perception_previous_attacker_stickyness_value = -4.5,
	race = "chaos",
	is_bot_threat = true,
	poison_resistance = 100,
	armor_category = 1,
	push_sound_event = "Play_generic_pushed_impact_large",
	backstab_player_sound_event = "Play_enemy_marauder_attack_player_back_vce",
	death_sound_event = "Play_enemy_marauder_death_vce",
	headshot_coop_stamina_fatigue_type = "headshot_special",
	threat_value = 5,
	awards_positive_reinforcement_message = true,
	bone_lod_level = 1,
	smart_targeting_width = 0.2,
	is_bot_aid_threat = true,
	behavior = "raider",
	stagger_armor_category = 2,
	smart_object_template = "special",
	bots_should_flank = true,
	has_inventory = true,
	run_speed = 4.8,
	aim_template = "chaos_marauder",
	stagger_threshold_heavy = 3,
	stagger_multiplier = 0.6,
	stagger_threshold_light = 0.4,
	hit_reaction = "ai_default",
	patrol_passive_target_selection = "patrol_passive_target_selection",
	smart_targeting_outer_width = 1,
	hit_effect_template = "HitEffectsChaosRaider",
	smart_targeting_height_multiplier = 2.5,
	uses_attack_sfx_callback = true,
	horde_behavior = "raider",
	unit_template = "ai_unit_chaos_warrior",
	has_running_attack = true,
	no_stagger_damage_reduction = true,
	perception = "perception_regular",
	player_locomotion_constrain_radius = 0.7,
	weapon_reach = 2.1,
	horde_target_selection = "horde_pick_closest_target_with_spillover",
	use_backstab_vo = true,
	patrol_passive_perception = "perception_regular",
	vortexable = true,
	base_unit = "units/beings/enemies/chaos_raider/chr_chaos_raider",
	aoe_height = 1.7,
	elite = true,
	passive_in_patrol_start_anim = {
		"move_fwd_4",
		"move_fwd_5",
		"move_fwd_6"
	},
	infighting = InfightingSettings.small,
	perception_exceptions = {
		poison_well = true,
		wizard_destructible = true
	},
	size_variation_range = {
		1.15,
		1.15
	},
	max_health = BreedTweaks.max_health.raider,
	bloodlust_health = BreedTweaks.bloodlust_health.chaos_elite,
	diff_stagger_resist = BreedTweaks.diff_stagger_resist.raider,
	stagger_reduction = BreedTweaks.stagger_reduction.raider,
	stagger_duration = BreedTweaks.stagger_duration.raider,
	hitzone_armor_categories = {
		head = 2
	},
	hitzone_primary_armor_categories = {
		head = {
			attack = 6,
			impact = 2
		}
	},
	hitzone_multiplier_types = {
		head = "headshot"
	},
	hit_mass_counts = BreedTweaks.hit_mass_counts.raider,
	wwise_voices = {
		"marauder_andreas",
		"marauder_olof"
	},
	status_effect_settings = {
		category = "medium",
		ignored_statuses = table.set({
			StatusEffectNames.burning_warpfire
		})
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
				"c_leftarm",
				"c_leftforearm",
				"c_lefthand",
				"c_leftshoulder"
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
				"c_righthand",
				"c_rightshoulder"
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
Breeds.chaos_raider = table.create_copy(Breeds.chaos_raider, breed_data)
Breeds.chaos_raider_tutorial = table.create_copy(Breeds.chaos_raider_tutorial, breed_data)
Breeds.chaos_raider_tutorial.behavior = "raider_tutorial"
Breeds.chaos_raider_tutorial.horde_behavior = "raider_tutorial"
Breeds.chaos_raider_tutorial.debug_spawn_category = "Misc"
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
	}
}
local action_data = {
	alerted = {
		action_weight = 1,
		no_hesitation = true,
		cooldown = -1,
		close_range_alert_idle = false,
		override_time_alerted = 1.8,
		alerted_anims = {
			"alerted"
		},
		easter_egg_alerted_anims = {
			"alerted_2"
		},
		start_anims_name = {
			fwd = {
				"alerted_fwd"
			},
			bwd = {
				"alerted_bwd"
			},
			left = {
				"alerted_left"
			},
			right = {
				"alerted_right"
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
	special_attack = {
		action_weight = 1,
		considerations = UtilityConsiderations.chaos_raider_special_attack
	},
	moving_attack = {
		action_weight = 10,
		considerations = UtilityConsiderations.chaos_raider_moving_attack
	},
	running_attack = {
		hit_react_type = "heavy",
		height = 1.1,
		offset_forward = 0.5,
		cooldown = 1,
		rotation_time = 1,
		bot_threat_start_time = 1,
		damage_type = "cutting",
		offset_up = 0,
		attack_anim = "attack_cleave",
		range = 1.95,
		damage = 30,
		bot_threat_duration = 0.7,
		attack_intensity_type = "running",
		action_weight = 10,
		move_anim = "move_fwd",
		width = 1.6,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.chaos_raider_running_attack,
		step_attack_anim = {
			"attack_run",
			"attack_run_2"
		},
		difficulty_damage = BreedTweaks.difficulty_damage.elite_attack_heavy,
		fatigue_type = BreedTweaks.fatigue_types.elite_sweep.running_attack,
		ignore_staggers = {
			true,
			false,
			false,
			false,
			false,
			false
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_elite
	},
	special_attack_cleave = {
		height = 2,
		offset_forward = 0,
		hit_react_type = "heavy",
		rotation_time_step = 2.1,
		cooldown = 1,
		rotation_time = 1,
		bot_threat_start_time = 0.7,
		no_block_stagger = true,
		damage_type = "cutting",
		offset_up = 0,
		range = 2.75,
		damage = 30,
		bot_threat_duration = 0.7,
		attack_intensity_type = "cleave",
		bot_threat_start_time_step = 1.6,
		move_anim = "move_fwd",
		width = 0.4,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		attack_anim = {
			"attack_cleave",
			"attack_cleave_02"
		},
		step_attack_anim = {
			"attack_cleave_moving_01"
		},
		difficulty_damage = BreedTweaks.difficulty_damage.elite_attack_heavy,
		fatigue_type = BreedTweaks.fatigue_types.elite_cleave.normal_attack,
		ignore_staggers = {
			true,
			false,
			false,
			false,
			false,
			false
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_elite
	},
	special_attack_sweep = {
		offset_forward = 0.5,
		height = 1.1,
		cooldown = 1,
		rotation_time = 1,
		bot_threat_start_time = 0.6,
		damage_type = "cutting",
		offset_up = 0,
		range = 2.6,
		damage = 20,
		bot_threat_duration = 0.7,
		attack_intensity_type = "sweep",
		move_anim = "move_fwd",
		width = 1.6,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		attack_anim = {
			"attack_pounce",
			"attack_pounce_2",
			"attack_pounce_3",
			"attack_pounce_4"
		},
		step_attack_anim = {
			"attack_move",
			"attack_move_2"
		},
		difficulty_damage = BreedTweaks.difficulty_damage.elite_attack,
		fatigue_type = BreedTweaks.fatigue_types.elite_sweep.normal_attack,
		ignore_staggers = {
			true,
			false,
			false,
			false,
			false,
			false
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_elite
	},
	push_attack = {
		impact_push_speed = 7,
		damage = 0,
		fatigue_type = "sv_push",
		hit_react_type = "heavy",
		max_impact_push_speed = 8,
		attack_intensity_type = "push",
		action_weight = 1,
		damage_type = "blunt",
		unblockable = true,
		attack_anim = "attack_push",
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.chaos_raider_push_attack,
		ignore_staggers = {
			true,
			false,
			false,
			true,
			true,
			false
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_elite
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
		damage = 3,
		damage_type = "cutting",
		move_anim = "move_fwd",
		attack_anim = "attack_blocker"
	},
	blocked = {
		blocked_anims = {
			"blocked",
			"blocked_2"
		},
		difficulty_duration = BreedTweaks.blocked_duration.chaos_elite
	},
	special_attack_cleave_tutorial = {
		fatigue_type = "chaos_cleave",
		height = 2,
		offset_forward = 0,
		rotation_time_step = 2.1,
		cooldown = 1,
		rotation_time = 1,
		hit_react_type = "heavy",
		bot_threat_start_time = 0.7,
		no_block_stagger = true,
		damage_type = "cutting",
		offset_up = 0,
		range = 3.1,
		damage = 30,
		bot_threat_duration = 0.7,
		attack_intensity_type = "cleave",
		action_weight = 1,
		bot_threat_start_time_step = 1.6,
		move_anim = "move_fwd",
		width = 0.4,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.chaos_raider_special_attack,
		attack_anim = {
			"attack_cleave_02"
		},
		difficulty_damage = BreedTweaks.difficulty_damage.elite_attack_heavy,
		ignore_staggers = {
			true,
			false,
			false,
			false,
			false,
			false
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_elite
	}
}
action_data.stagger = {
	scale_animation_speeds = true,
	custom_enter_function = function (unit, blackboard, t, action)
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
		}
	}
}
BreedActions.chaos_raider = table.create_copy(BreedActions.chaos_raider, action_data)

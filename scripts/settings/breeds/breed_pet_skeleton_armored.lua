local stagger_types = require("scripts/utils/stagger_types")

local function hit_ai_func(unit, blackboard, hit_unit, action, attack)
	if hit_unit ~= blackboard.attacking_target then
		local damage = 0
		local buff_extension = ScriptUnit.extension(unit, "buff_system")

		buff_extension:trigger_procs("on_damage_dealt", hit_unit, unit, damage, nil, nil, nil, nil, nil, nil, nil, nil, nil)
		Managers.state.achievement:trigger_event("on_damage_dealt", hit_unit, unit, damage, nil, nil, nil, nil, nil, nil, nil, nil, nil)
	end
end

local breed_data = {
	detection_radius = 18,
	pet_skeleton_type = "armored",
	walk_speed = 4,
	perception = "perception_regular",
	flingable = true,
	patrol_active_target_selection = "pick_closest_target_with_spillover",
	run_max_speed_distance = 4,
	horde_behavior = "pet_skeleton",
	animation_sync_rpc = "rpc_sync_anim_state_7",
	aoe_radius = 0.4,
	is_always_spawnable = true,
	run_min_speed_distance = 1.5,
	debug_spawn_category = "Misc",
	no_blood = true,
	disable_crowd_dispersion = true,
	aoe_height = 1.4,
	has_inventory = true,
	slot_template = "chaos_elite",
	default_inventory_template = "undead_npc_skeleton_armored",
	die_on_vortex_land = false,
	wield_inventory_on_spawn = true,
	attack_general_sound_event = "Play_skeleton_minion_attack_vce",
	force_walk_while_tired = true,
	stagger_resistance = 2,
	patrol_detection_radius = 10,
	hesitation_timer = 5,
	leave_walk_distance = 5,
	panic_close_detection_radius_sq = 9,
	radius = 1,
	use_slot_type = "medium",
	scale_death_push = 0.35,
	look_at_range = 40,
	patrol_active_perception = "perception_regular",
	stagger_multiplier = 0.45,
	perception_previous_attacker_stickyness_value = -4.5,
	race = "undead",
	ai_strength = 1,
	death_reaction = "ai_default",
	armor_category = 1,
	hit_mass_count = 8,
	uses_spawn_animation = true,
	poison_resistance = 100,
	death_sound_event = "career_necro_skeleton_spawn",
	uses_attack_sfx_callback = true,
	max_commander_distance = 28,
	push_sound_event = "Play_generic_pushed_impact_large",
	commanded_unit_aggro_sound = "Play_skeleton_minion_charge_vce",
	smart_targeting_width = 0.2,
	is_bot_threat = true,
	threat_value = 5,
	behavior = "pet_skeleton",
	use_regular_horde_spawning = true,
	debug_despawn_immunity = true,
	during_horde_detection_radius = 15,
	aim_template = "chaos_marauder",
	bone_lod_level = 1,
	target_selection = "pick_closest_target_near_detection_source_position",
	smart_object_template = "chaos_marauder",
	run_speed = 6,
	follow_reach = 1,
	exchange_order = 4,
	using_inventory_weakspots = true,
	stagger_threshold_light = 0,
	hit_reaction = "ai_default",
	passive_in_patrol = false,
	patrol_passive_target_selection = "patrol_passive_target_selection",
	smart_targeting_outer_width = 1,
	hit_effect_template = "HitEffectsChaosMarauder",
	smart_targeting_height_multiplier = 2.5,
	passive_walk_speed = 4,
	unit_template = "ai_unit_pet_skeleton",
	has_running_attack = true,
	hit_effect = "fx/skull_shatter",
	damage_multiplier_vs_ai = 0.37,
	weapon_reach = 2.5,
	far_off_despawn_immunity = true,
	use_backstab_vo = true,
	patrol_passive_perception = "perception_regular",
	vortexable = true,
	base_unit = "units/beings/npcs/necromancer_skeleton/chr_npc_necromancer_skeleton",
	enter_walk_distance = 0.25,
	min_run_speed = 3,
	strong_hit_reacts = {
		fwd = {
			"stun_fwd_sword"
		},
		bwd = {
			"stun_bwd_sword"
		},
		left = {
			"stun_left_sword"
		},
		right = {
			"stun_right_sword"
		}
	},
	ai_toughness = math.huge,
	default_spawn_animation = {
		"spawn_floor",
		"spawn_floor_2",
		"spawn_floor_3",
		"spawn_floor_4",
		"spawn_floor_5",
		"spawn_floor_6",
		"spawn_floor_7"
	},
	passive_in_patrol_start_anim = {
		"move_fwd_4",
		"move_fwd_5",
		"move_fwd_6"
	},
	infighting = InfightingSettings.skeleton_pet,
	perception_exceptions = {
		poison_well = true,
		wizard_destructible = true
	},
	size_variation_range = {
		1,
		1
	},
	max_health = {
		20.8125,
		20.8125,
		30.9375,
		36.5625,
		56.25,
		84.375,
		84.375,
		84.375
	},
	bloodlust_health = BreedTweaks.bloodlust_health.chaos_roamer,
	hit_mass_counts = BreedTweaks.hit_mass_counts.raider,
	stagger_reduction = BreedTweaks.stagger_reduction.marauder,
	diff_stagger_resist = BreedTweaks.diff_stagger_resist.marauder,
	stagger_duration_difficulty_mod = BreedTweaks.stagger_duration_difficulty_mod.fast,
	stagger_duration = BreedTweaks.stagger_duration.marauder,
	status_effect_settings = {
		category = "small",
		ignored_statuses = table.set({
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
				"j_spine1",
				"j_spine"
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
				"j_spine1",
				"j_spine"
			}
		},
		torso = {
			prio = 2,
			actors = {
				"c_spine1",
				"c_spine",
				"c_spine2",
				"c_hips"
			},
			push_actors = {
				"j_neck",
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
				"j_spine1",
				"j_leftshoulder",
				"j_leftarm",
				"j_spine"
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
				"j_rightarm",
				"j_spine"
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
		c_spine2 = "j_spine1",
		c_righthand = "j_righthand",
		c_rightupleg = "j_rightupleg",
		c_neck1 = "j_neck",
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
	},
	commander_formation = {
		alternating = true,
		lead_dist_min = 2,
		lead_dist_max = 2,
		commander_avoid_radius = 1.2,
		dist = 2.3,
		formation_type = "circle",
		lead_dist_mult = math.huge,
		angle_offset = math.pi * -0.1,
		initial_angle_offset = math.pi * 0.35
	},
	networked_animation_variables = {
		{
			anims = {
				"attack_run",
				"attack_run_2"
			},
			variables = {
				moving_attack_fwd_speed = {
					move_speed_variable_lerp_speed = 4,
					animation_move_speed_config = {
						{
							value = 3,
							distance = 6.5
						},
						{
							value = 2,
							distance = 3
						},
						{
							value = 1,
							distance = 1.25
						},
						{
							value = 0,
							distance = 0
						}
					}
				}
			}
		},
		{
			anims = {
				"attack_move",
				"attack_move_2",
				"attack_cleave_moving_01"
			},
			variables = {
				moving_attack_fwd_speed = {
					move_speed_variable_lerp_speed = 4,
					animation_move_speed_config = {
						{
							value = 1,
							distance = 3
						},
						{
							value = 0,
							distance = 0
						}
					}
				}
			}
		}
	}
}
Breeds.pet_skeleton_armored = table.create_copy(Breeds.pet_skeleton_armored, breed_data)
local increased_armor_damage = 1.5
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
	idle = {
		anim_cycle_index = 0,
		animations = {
			"idle"
		},
		combat_animations = {
			"idle"
		},
		alerted_anims = {
			"alerted",
			"alerted_3"
		}
	},
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
	special_attack = {
		action_weight = 1,
		considerations = UtilityConsiderations.chaos_raider_special_attack
	},
	moving_attack = {
		action_weight = 10,
		considerations = UtilityConsiderations.chaos_raider_moving_attack
	},
	running_sweep_attack = {
		moving_attack = true,
		hit_react_type = "heavy",
		cooldown = 1,
		damage_type = "cutting",
		attack_intensity = 1,
		damage = 3,
		attack_intensity_type = "running",
		action_weight = 10,
		ignore_ai_damage = true,
		self_running_speed_threshold = 1,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.chaos_raider_running_attack,
		target_running_distance_threshold = math.huge,
		running_attacks = {
			{
				range = 4,
				height = 1.5,
				lock_attack_time = 2.1,
				width = 2.6,
				rotation_time = 0.8,
				anim_driven = true,
				offset_forward = 0,
				offset_up = 0,
				hit_multiple_targets = true,
				attack_anim = {
					"attack_run"
				},
				attack_time = math.huge,
				push_ai = {
					stagger_distance = 1,
					stagger_impact = {
						stagger_types.weak,
						stagger_types.weak,
						stagger_types.none,
						stagger_types.none
					},
					stagger_duration = {
						1,
						0.5,
						0,
						0
					}
				},
				immune_breeds = {
					skaven_grey_seer = true
				}
			},
			{
				height = 1.5,
				range = 4,
				offset_up = 0,
				rotation_time = 0.8,
				anim_driven = true,
				offset_forward = 0,
				hit_multiple_targets = true,
				width = 2.2,
				attack_anim = {
					"attack_run_2"
				},
				attack_time = math.huge,
				push_ai = {
					stagger_distance = 1,
					stagger_impact = {
						stagger_types.weak,
						stagger_types.weak,
						stagger_types.none,
						stagger_types.none
					},
					stagger_duration = {
						1,
						0.5,
						0,
						0
					}
				},
				immune_breeds = {
					skaven_grey_seer = true
				}
			}
		},
		attacks = {
			{
				range = 4,
				height = 1.5,
				lock_attack_time = 2.1,
				width = 2.6,
				rotation_time = 0.8,
				anim_driven = true,
				offset_forward = 0,
				offset_up = 0,
				hit_multiple_targets = true,
				attack_anim = {
					"attack_move"
				},
				attack_time = math.huge,
				push_ai = {
					stagger_distance = 1,
					stagger_impact = {
						stagger_types.weak,
						stagger_types.weak,
						stagger_types.none,
						stagger_types.none
					},
					stagger_duration = {
						1,
						0.5,
						0,
						0
					}
				},
				immune_breeds = {
					skaven_grey_seer = true
				}
			},
			{
				height = 1.5,
				range = 4,
				offset_up = 0,
				rotation_time = 0.8,
				anim_driven = true,
				offset_forward = 0,
				hit_multiple_targets = true,
				width = 2.2,
				attack_anim = {
					"attack_move_2"
				},
				attack_time = math.huge,
				push_ai = {
					stagger_distance = 1,
					stagger_impact = {
						stagger_types.weak,
						stagger_types.weak,
						stagger_types.none,
						stagger_types.none
					},
					stagger_duration = {
						1,
						0.5,
						0,
						0
					}
				},
				immune_breeds = {
					skaven_grey_seer = true
				}
			}
		},
		ignore_staggers = {
			true,
			false,
			false,
			false,
			false,
			false
		},
		difficulty_damage = {
			easy = {
				5,
				2,
				8,
				0,
				4,
				1
			},
			normal = {
				6,
				3,
				9,
				0,
				5,
				2
			},
			hard = {
				7,
				4,
				10,
				0,
				6,
				3
			},
			harder = {
				8,
				5,
				11,
				0,
				7,
				4
			},
			hardest = {
				9,
				6,
				12,
				0,
				8,
				4
			},
			cataclysm = {
				11,
				7,
				14,
				0,
				10,
				5
			},
			cataclysm_2 = {
				11,
				7,
				14,
				0,
				10,
				5
			},
			cataclysm_3 = {
				11,
				7,
				14,
				0,
				10,
				5
			}
		},
		fatigue_type = BreedTweaks.fatigue_types.elite_sweep.running_attack,
		hit_ai_func = hit_ai_func
	},
	special_attack_cleave = {
		height = 2,
		offset_forward = 0,
		cooldown = 1,
		rotation_time = 1,
		hit_react_type = "heavy",
		no_block_stagger = true,
		damage_type = "cutting",
		offset_up = 0,
		range = 2.75,
		damage = 5,
		attack_intensity_type = "cleave",
		ignore_ai_damage = true,
		width = 0.4,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		attacks = {
			{
				range = 2.8,
				height = 2,
				lock_attack_time = 2.1,
				width = 1,
				rotation_time = 0.8,
				anim_driven = true,
				offset_forward = 0,
				offset_up = 0,
				hit_multiple_targets = true,
				attack_anim = {
					"attack_cleave",
					"attack_cleave_02"
				},
				attack_time = math.huge,
				push_ai = {
					stagger_distance = 1,
					stagger_impact = {
						stagger_types.weak,
						stagger_types.weak,
						stagger_types.none,
						stagger_types.none
					},
					stagger_duration = {
						1,
						0.5,
						0,
						0
					}
				},
				immune_breeds = {
					skaven_grey_seer = true
				}
			}
		},
		difficulty_damage = {
			easy = {
				5,
				2,
				8,
				0,
				4,
				1
			},
			normal = {
				6,
				3,
				9,
				0,
				5,
				2
			},
			hard = {
				7,
				4,
				10,
				0,
				6,
				3
			},
			harder = {
				8,
				5,
				11,
				0,
				7,
				4
			},
			hardest = {
				9,
				6,
				12,
				0,
				8,
				4
			},
			cataclysm = {
				11,
				7,
				14,
				0,
				10,
				5
			},
			cataclysm_2 = {
				11,
				7,
				14,
				0,
				10,
				5
			},
			cataclysm_3 = {
				11,
				7,
				14,
				0,
				10,
				5
			}
		},
		fatigue_type = BreedTweaks.fatigue_types.elite_cleave.normal_attack,
		ignore_staggers = {
			true,
			false,
			false,
			false,
			false,
			false
		},
		hit_ai_func = hit_ai_func
	},
	special_attack_sweep = {
		damage_type = "cutting",
		height = 2,
		no_block_stagger = true,
		cooldown = 1,
		rotation_time = 1,
		offset_forward = 0,
		offset_up = 0,
		range = 2.75,
		damage = 5,
		attack_intensity_type = "sweep",
		ignore_ai_damage = true,
		width = 0.4,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		attacks = {
			{
				range = 3,
				height = 2,
				lock_attack_time = 2.1,
				width = 2.5,
				rotation_time = 0.8,
				anim_driven = true,
				offset_forward = 0,
				offset_up = 0,
				hit_multiple_targets = true,
				attack_anim = {
					"attack_pounce",
					"attack_pounce_3",
					"attack_pounce_4"
				},
				attack_time = math.huge,
				push_ai = {
					stagger_distance = 1,
					stagger_impact = {
						stagger_types.weak,
						stagger_types.weak,
						stagger_types.none,
						stagger_types.none
					},
					stagger_duration = {
						1,
						0.5,
						0,
						0
					}
				},
				immune_breeds = {
					skaven_grey_seer = true
				}
			},
			{
				range = 3,
				height = 2,
				lock_attack_time = 2.1,
				width = 2.2,
				rotation_time = 0.8,
				anim_driven = true,
				offset_forward = 0,
				offset_up = 0,
				hit_multiple_targets = true,
				attack_anim = {
					"attack_pounce_2"
				},
				attack_time = math.huge,
				push_ai = {
					stagger_distance = 1,
					stagger_impact = {
						stagger_types.weak,
						stagger_types.weak,
						stagger_types.none,
						stagger_types.none
					},
					stagger_duration = {
						1,
						0.5,
						0,
						0
					}
				},
				immune_breeds = {
					skaven_grey_seer = true
				}
			}
		},
		difficulty_damage = {
			easy = {
				5,
				2,
				8,
				0,
				4,
				1
			},
			normal = {
				6,
				3,
				9,
				0,
				5,
				2
			},
			hard = {
				7,
				4,
				10,
				0,
				6,
				3
			},
			harder = {
				8,
				5,
				11,
				0,
				7,
				4
			},
			hardest = {
				9,
				6,
				12,
				0,
				8,
				4
			},
			cataclysm = {
				11,
				7,
				14,
				0,
				10,
				5
			},
			cataclysm_2 = {
				11,
				7,
				14,
				0,
				10,
				5
			},
			cataclysm_3 = {
				11,
				7,
				14,
				0,
				10,
				5
			}
		},
		fatigue_type = BreedTweaks.fatigue_types.elite_sweep.normal_attack,
		ignore_staggers = {
			true,
			false,
			false,
			false,
			false,
			false
		},
		hit_ai_func = hit_ai_func
	},
	push_attack = {
		damage = 0,
		impact_push_speed = 7,
		hit_react_type = "heavy",
		max_impact_push_speed = 8,
		attack_intensity_type = "push",
		action_weight = 1,
		unblockable = true,
		damage_type = "blunt",
		step_attack_anim = "attack_push_moving",
		fatigue_type = "sv_push",
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
	ability_charge = {
		slow_down_speed = 1,
		charge_distance = 11,
		hit_target_slow_down_speed = 3,
		max_slowdown_percentage = 0.25,
		fatigue_type = "blocked_charge",
		cancel_slow_down_speed = 2,
		charge_blocked_animation = "ability_test_charge_finish",
		dodge_past_push_speed = 8,
		cancel_animation = "ability_test_charge_finish",
		min_slowdown_angle = 20,
		charge_max_speed_at = 1.5,
		wall_collision_check_range = 0.75,
		shield_blocked_fatigue_type = "blocked_sv_cleave",
		charge_speed_min = 6,
		damage = 5,
		charge_rotation_speed = 10,
		player_push_speed_blocked = 10,
		target_extrapolation_length_scale = 50,
		max_slowdown_angle = 40,
		ignore_ledge_death = true,
		radius = 1,
		ignore_friendly_ai = true,
		max_charge_t = 15,
		hit_ai_radius = 0.5,
		start_animation = "charge_start",
		head_radius = 1.3,
		target_dodged_radius = 0.5,
		player_push_speed = 9.5,
		charge_speed_max = 10,
		charging_animations = {
			far = "ability_test_charge",
			medium = "ability_test_charge",
			short = "ability_test_charge"
		},
		impact_animation = {
			"ability_test_charge_finish"
		},
		charge_at_max_speed_duration = math.huge,
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
		difficulty_damage = {
			harder = 5,
			hard = 4,
			normal = 3,
			hardest = 6,
			cataclysm = 10,
			cataclysm_3 = 10,
			cataclysm_2 = 10,
			easy = 2
		},
		push_ai = {
			stagger_distance = 1.5,
			stagger_impact = {
				stagger_types.heavy,
				stagger_types.heavy,
				stagger_types.none,
				stagger_types.none,
				stagger_types.medium
			},
			stagger_duration = {
				1,
				0.5,
				0,
				0,
				4
			}
		}
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
		damage = 5,
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
		difficulty_damage = {
			easy = {
				5,
				2,
				8,
				0,
				4,
				1
			},
			normal = {
				6,
				3,
				9,
				0,
				5,
				2
			},
			hard = {
				7,
				4,
				10,
				0,
				6,
				3
			},
			harder = {
				8,
				5,
				11,
				0,
				7,
				4
			},
			hardest = {
				9,
				6,
				12,
				0,
				8,
				4
			},
			cataclysm = {
				11,
				7,
				14,
				0,
				10,
				5
			},
			cataclysm_2 = {
				11,
				7,
				14,
				0,
				10,
				5
			},
			cataclysm_3 = {
				11,
				7,
				14,
				0,
				10,
				5
			}
		},
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
	stagger = {
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
	},
	follow_owner = {}
}
action_data.moving_special_attack_sweep = table.clone(action_data.special_attack_sweep)
action_data.moving_special_attack_sweep.target_running_velocity_threshold = 2
action_data.moving_special_attack_sweep.running_attacks = {
	{
		range = 5,
		height = 2,
		lock_attack_time = 2.1,
		offset_forward = 0,
		rotation_time = 2,
		anim_driven = true,
		attack_time = 1.3666666666666667,
		hit_multiple_targets = true,
		offset_up = 0,
		width = 1,
		attack_anim = {
			"attack_move",
			"attack_move_2"
		},
		difficulty_attack_intensity = AttackIntensityPerDifficulty
	},
	{
		range = 5,
		height = 2,
		lock_attack_time = 2.1,
		offset_forward = 0,
		rotation_time = 2,
		anim_driven = true,
		attack_time = 1.6,
		hit_multiple_targets = true,
		offset_up = 0,
		width = 1,
		attack_anim = {
			"attack_move_2"
		},
		difficulty_attack_intensity = AttackIntensityPerDifficulty
	}
}
action_data.moving_special_attack_cleave = table.clone(action_data.special_attack_cleave)
action_data.moving_special_attack_cleave.target_running_velocity_threshold = 2
action_data.moving_special_attack_cleave.running_attacks = {
	{
		height = 2,
		offset_forward = 0,
		range = 5,
		attack_time = 2.7666666666666666,
		rotation_time = 2,
		anim_driven = true,
		hit_multiple_targets = true,
		offset_up = 0,
		width = 1,
		attack_anim = {
			"attack_cleave_moving_01"
		},
		difficulty_attack_intensity = AttackIntensityPerDifficulty
	}
}
action_data.command_attack = table.clone(action_data.special_attack_sweep)
action_data.command_attack.considerations = UtilityConsiderations.command_attack
action_data.command_attack.action_weight = 1
action_data.running_command_attack = table.clone(action_data.running_sweep_attack)
action_data.running_command_attack.considerations = UtilityConsiderations.running_command_attack
action_data.fallback_idle = action_data.idle
BreedActions.pet_skeleton_armored = table.create_copy(BreedActions.pet_skeleton_armored, action_data)

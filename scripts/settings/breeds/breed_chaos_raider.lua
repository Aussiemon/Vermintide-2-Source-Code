local breed_data = {
	is_bot_threat = true,
	poison_resistance = 100,
	walk_speed = 2.2,
	dont_wield_weapon_on_patrol = true,
	patrol_active_target_selection = "storm_patrol_death_squad_target_selection",
	aim_template = "chaos_marauder",
	run_speed = 4.8,
	animation_sync_rpc = "rpc_sync_anim_state_7",
	aoe_radius = 0.4,
	disable_crowd_dispersion = true,
	scale_death_push = 0.35,
	has_inventory = true,
	detection_radius = 12,
	dialogue_source_name = "chaos_marauder",
	attack_player_sound_event = "Play_enemy_marauder_attack_player_vce",
	headshot_coop_stamina_fatigue_type = "headshot_special",
	threat_value = 5,
	awards_positive_reinforcement_message = true,
	attack_general_sound_event = "Play_enemy_marauder_attack_husk_vce",
	default_inventory_template = "raider_axe_2h",
	stagger_resistance = 3,
	patrol_detection_radius = 10,
	flingable = true,
	wwise_voice_switch_group = "marauder_vce_variations",
	panic_close_detection_radius_sq = 9,
	radius = 2,
	bone_lod_level = 1,
	hit_mass_count = 8,
	patrol_active_perception = "perception_regular",
	smart_object_template = "special",
	perception_previous_attacker_stickyness_value = -4.5,
	race = "chaos",
	death_reaction = "ai_default",
	armor_category = 1,
	backstab_player_sound_event = "Play_enemy_marauder_attack_player_back_vce",
	death_sound_event = "Play_enemy_marauder_death_vce",
	smart_targeting_width = 0.2,
	is_bot_aid_threat = true,
	behavior = "raider",
	stagger_armor_category = 2,
	bots_should_flank = true,
	target_selection = "pick_closest_target_with_spillover",
	no_stagger_duration = true,
	exchange_order = 3,
	stagger_threshold_heavy = 3,
	stagger_multiplier = 0.4,
	stagger_threshold_light = 0.25,
	hit_reaction = "ai_default",
	patrol_passive_target_selection = "patrol_passive_target_selection",
	smart_targeting_outer_width = 1,
	hit_effect_template = "HitEffectsChaosRaider",
	smart_targeting_height_multiplier = 2.5,
	uses_attack_sfx_callback = true,
	horde_behavior = "raider",
	unit_template = "ai_unit_chaos_warrior",
	has_running_attack = true,
	perception = "perception_regular",
	player_locomotion_constrain_radius = 0.7,
	weapon_reach = 2.1,
	horde_target_selection = "horde_pick_closest_target_with_spillover",
	use_backstab_vo = true,
	patrol_passive_perception = "perception_regular",
	vortexable = true,
	death_squad_detection_radius = 8,
	base_unit = "units/beings/enemies/chaos_raider/chr_chaos_raider",
	aoe_height = 1.7,
	elite = true,
	passive_in_patrol_start_anim = {
		"move_fwd_4",
		"move_fwd_5",
		"move_fwd_6"
	},
	perception_exceptions = {
		poison_well = true,
		wizard_destructible = true
	},
	size_variation_range = {
		1.15,
		1.15
	},
	max_health = {
		30,
		30,
		45,
		60,
		90
	},
	diff_stagger_resist = {
		3,
		3,
		4,
		5,
		5
	},
	stagger_reduction = {
		0.9,
		0.9,
		1.2,
		1.5,
		1.5
	},
	stagger_duration = {
		0.5,
		0.75,
		1,
		1,
		1,
		1,
		1,
		1
	},
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
	hit_mass_counts = {
		8,
		8,
		12,
		16,
		16
	},
	wwise_voices = {
		"marauder_andreas",
		"marauder_olof"
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
	stagger_modifier_function = function (stagger, duration, length, hit_zone_name, blackboard, breed, direction)
		if blackboard.stagger_type == 3 then
			local t = Managers.time:time("game")

			if stagger == 3 and blackboard.heavy_stagger_immune_time then
				stagger = 0
				duration = 0
				length = 0
			elseif stagger ~= 3 and blackboard.stagger_immune_time then
				stagger = 0
				duration = 0
				length = 0
			end

			if direction then
				local unit_dir = Quaternion.forward(Unit.local_rotation(blackboard.unit, 0))
				local angle = Vector3.dot(Vector3.normalize(direction), Vector3.normalize(unit_dir))
				local direction_allowed = -0.35 <= angle and angle <= 1

				if direction_allowed then
					blackboard.fallen_stagger = true
					blackboard.fallen_stagger_timer = t + 0.5
					blackboard.fallen_stagger_direction = Vector3Box(direction)
				end
			end
		end

		return stagger, duration, length
	end,
	hit_zones = {
		full = {
			prio = 1,
			actors = {}
		},
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
			prio = 3,
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
			prio = 4,
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
			prio = 4,
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
			prio = 4,
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
			prio = 4,
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
		height = 3,
		offset_forward = 0,
		hit_react_type = "heavy",
		cooldown = 1,
		rotation_time = 1,
		fatigue_type = "blocked_sv_cleave",
		bot_threat_start_time = 1,
		damage_type = "cutting",
		offset_up = 0,
		attack_anim = "attack_cleave",
		range = 3,
		bot_threat_duration = 0.7,
		action_weight = 10,
		move_anim = "move_fwd",
		width = 2,
		considerations = UtilityConsiderations.chaos_raider_running_attack,
		step_attack_anim = {
			"attack_run",
			"attack_run_2"
		},
		damage = {
			30,
			25,
			20
		},
		difficulty_damage = {
			easy = {
				20,
				20,
				15
			},
			normal = {
				30,
				25,
				20
			},
			hard = {
				40,
				35,
				30
			},
			survival_hard = {
				40,
				35,
				30
			},
			harder = {
				50,
				40,
				30
			},
			survival_harder = {
				50,
				40,
				30
			},
			hardest = {
				100,
				50,
				30
			},
			survival_hardest = {
				150,
				75,
				45
			}
		},
		ignore_staggers = {
			true,
			false,
			false,
			false,
			false,
			false
		}
	},
	special_attack_cleave = {
		offset_forward = 0,
		height = 2,
		hit_react_type = "heavy",
		rotation_time_step = 2.1,
		cooldown = 1,
		rotation_time = 1,
		fatigue_type = "complete",
		bot_threat_start_time = 0.7,
		no_block_stagger = true,
		damage_type = "cutting",
		offset_up = 0,
		range = 2.25,
		bot_threat_duration = 0.7,
		bot_threat_start_time_step = 1.6,
		move_anim = "move_fwd",
		width = 0.4,
		attack_anim = {
			"attack_cleave",
			"attack_cleave_02"
		},
		step_attack_anim = {
			"attack_cleave_moving_01"
		},
		damage = {
			30,
			25,
			20
		},
		difficulty_damage = {
			easy = {
				20,
				20,
				15
			},
			normal = {
				30,
				25,
				20
			},
			hard = {
				40,
				35,
				30
			},
			survival_hard = {
				40,
				35,
				30
			},
			harder = {
				50,
				40,
				30
			},
			survival_harder = {
				50,
				40,
				30
			},
			hardest = {
				100,
				50,
				30
			},
			survival_hardest = {
				150,
				75,
				45
			}
		},
		ignore_staggers = {
			true,
			false,
			false,
			false,
			false,
			false
		}
	},
	special_attack_sweep = {
		range = 2.8,
		height = 0.1,
		width = 2,
		cooldown = 1,
		rotation_time = 1,
		fatigue_type = "blocked_sv_sweep",
		offset_forward = 0,
		bot_threat_start_time = 0.6,
		bot_threat_duration = 0.7,
		damage_type = "cutting",
		move_anim = "move_fwd",
		offset_up = 0,
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
		difficulty_damage = {
			easy = {
				10,
				10,
				5
			},
			normal = {
				10,
				10,
				5
			},
			hard = {
				20,
				15,
				10
			},
			survival_hard = {
				20,
				15,
				10
			},
			harder = {
				30,
				20,
				10
			},
			survival_harder = {
				30,
				20,
				10
			},
			hardest = {
				50,
				30,
				20
			},
			survival_hardest = {
				75,
				45,
				30
			}
		},
		ignore_staggers = {
			true,
			false,
			false,
			false,
			false,
			false
		}
	},
	push_attack = {
		impact_push_speed = 7,
		damage_type = "blunt",
		fatigue_type = "sv_push",
		max_impact_push_speed = 8,
		hit_react_type = "heavy",
		action_weight = 1,
		unblockable = true,
		attack_anim = "attack_push",
		considerations = UtilityConsiderations.chaos_raider_push_attack,
		damage = {
			0,
			0,
			0
		},
		ignore_staggers = {
			true,
			false,
			false,
			true,
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
		unblockable = true,
		name = "smash_door",
		damage_type = "cutting",
		move_anim = "move_fwd",
		attack_anim = "attack_blocker",
		damage = {
			3,
			3,
			3
		}
	},
	blocked = {
		blocked_anims = {
			"blocked",
			"blocked_2"
		}
	},
	special_attack_cleave_tutorial = {
		height = 2,
		offset_forward = 0,
		hit_react_type = "heavy",
		rotation_time_step = 2.1,
		cooldown = 1,
		rotation_time = 1,
		fatigue_type = "complete",
		bot_threat_start_time = 0.7,
		no_block_stagger = true,
		damage_type = "cutting",
		offset_up = 0,
		range = 3.1,
		bot_threat_duration = 0.7,
		action_weight = 1,
		bot_threat_start_time_step = 1.6,
		move_anim = "move_fwd",
		width = 0.4,
		considerations = UtilityConsiderations.chaos_raider_special_attack,
		attack_anim = {
			"attack_cleave_02"
		},
		damage = {
			30,
			25,
			20
		},
		difficulty_damage = {
			easy = {
				20,
				20,
				15
			},
			normal = {
				30,
				25,
				20
			},
			hard = {
				40,
				35,
				30
			},
			survival_hard = {
				40,
				35,
				30
			},
			harder = {
				50,
				40,
				30
			},
			survival_harder = {
				50,
				40,
				30
			},
			hardest = {
				100,
				50,
				30
			},
			survival_hardest = {
				150,
				75,
				45
			}
		},
		ignore_staggers = {
			true,
			false,
			false,
			false,
			false,
			false
		}
	},
	stagger = {
		scale_animation_speeds = true,
		custom_enter_function = function (unit, blackboard, t, action)
			if blackboard.stagger_type == 3 then
				blackboard.stagger_immune_time = t + 2.25
				blackboard.heavy_stagger_immune_time = t + 1.5
			elseif blackboard.stagger_type == 6 then
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
			}
		}
	}
}
BreedActions.chaos_raider = table.create_copy(BreedActions.chaos_raider, action_data)

return 

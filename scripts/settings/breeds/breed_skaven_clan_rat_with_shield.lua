local breed_data = {
	detection_radius = 12,
	walk_speed = 2.75,
	passive_walk_speed = 2,
	patrol_active_target_selection = "storm_patrol_death_squad_target_selection",
	wwise_voice_switch_group = "clan_rat_vce",
	poison_resistance = 70,
	patrol_detection_radius = 10,
	animation_sync_rpc = "rpc_sync_anim_state_7",
	radius = 2,
	hit_mass_count_block = 3,
	run_speed = 4.75,
	target_selection = "pick_closest_target_with_spillover",
	has_running_attack = true,
	bone_lod_level = 1,
	no_stagger_duration = false,
	attack_general_sound_event = "Play_clan_rat_attack_vce",
	default_inventory_template = "sword_and_shield",
	stagger_resistance = 1.5,
	dialogue_source_name = "skaven_clan_rat_with_shield",
	threat_value = 2,
	flingable = true,
	panic_close_detection_radius_sq = 9,
	hit_mass_count = 1.5,
	patrol_active_perception = "perception_regular",
	perception_previous_attacker_stickyness_value = -7.75,
	race = "skaven",
	death_reaction = "ai_default",
	backstab_player_sound_event = "Play_clan_rat_attack_player_back_vce",
	death_sound_event = "Play_clan_rat_die_vce",
	behavior = "shield_rat",
	during_horde_detection_radius = 15,
	shield_user = true,
	attack_player_sound_event = "Play_clan_rat_attack_player_vce",
	has_inventory = true,
	scale_death_push = 0.65,
	exchange_order = 4,
	shield_opening_event = "idle_shield_down",
	hit_reaction = "ai_default",
	patrol_passive_target_selection = "patrol_passive_target_selection",
	unit_variation_setting_name = "skaven_clan_rat_with_shield",
	hit_effect_template = "HitEffectsSkavenClanRatShield",
	uses_attack_sfx_callback = true,
	horde_behavior = "horde_shield_rat",
	unit_template = "ai_unit_shield_rat",
	smart_object_template = "default_clan_rat",
	perception = "perception_regular",
	player_locomotion_constrain_radius = 0.7,
	weapon_reach = 2,
	horde_target_selection = "horde_pick_closest_target_with_spillover",
	patrol_passive_perception = "perception_regular",
	vortexable = true,
	death_squad_detection_radius = 8,
	allow_aoe_push = true,
	base_unit = "units/beings/enemies/skaven_clan_rat/chr_skaven_clan_rat",
	aoe_height = 1.4,
	opt_base_unit = {
		"units/beings/enemies/skaven_clan_rat/chr_skaven_clan_rat_baked_var2",
		"units/beings/enemies/skaven_clan_rat/chr_skaven_clan_rat_baked_var3",
		"units/beings/enemies/skaven_clan_rat/chr_skaven_clan_rat_baked_var4"
	},
	size_variation_range = {
		1.05,
		1.075
	},
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
			prio = 4,
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
			prio = 4,
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
			prio = 4,
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
			prio = 4,
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
			prio = 4,
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
		j_rightarm = 0.2,
		j_leftupleg = 0.2,
		j_rightshoulder = 0.3,
		j_righthand = 0.2,
		j_righttoebase = 0.2,
		j_tail4 = 0.05,
		j_hips = 0.3,
		j_leftshoulder = 0.3,
		j_rightleg = 0.2,
		j_leftfoot = 0.2,
		j_spine1 = 0.3,
		j_tail5 = 0.05,
		j_rightupleg = 0.2,
		j_tail6 = 0.05,
		j_lefttoebase = 0.2,
		j_head = 0.3,
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
	max_health = {
		5,
		5,
		7.5,
		10,
		15
	},
	diff_stagger_resist = {
		2,
		2,
		3,
		4,
		6
	},
	stagger_duration = {
		1,
		2.5,
		4,
		1.5,
		2,
		5,
		1,
		1
	},
	hit_mass_counts = {
		1.25,
		1.25,
		1.75,
		2.5,
		3.75
	},
	hit_mass_counts_block = {
		3,
		3,
		4.5,
		6,
		9
	},
	num_push_anims = {
		push_backward = 2
	},
	wwise_voices = {
		"shield_rat_high",
		"james_medium",
		"magnus_medium",
		"shield_rat_low"
	},
	debug_color = {
		255,
		200,
		40,
		40
	}
}
Breeds.skaven_clan_rat_with_shield = table.create_copy(Breeds.skaven_clan_rat_with_shield, breed_data)
local action_data = {
	alerted = {
		no_hesitation = true,
		cooldown = -1,
		action_weight = 1,
		start_anims_name = {
			bwd = "slam_shield_bwd",
			fwd = "slam_shield_fwd",
			left = "slam_shield_left",
			right = "slam_shield_right"
		},
		start_anims_data = {
			slam_shield_fwd = {},
			slam_shield_bwd = {
				dir = -1,
				rad = math.pi
			},
			slam_shield_left = {
				dir = 1,
				rad = math.pi/2
			},
			slam_shield_right = {
				dir = -1,
				rad = math.pi/2
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
				rad = math.pi/2
			},
			move_start_right = {
				dir = -1,
				rad = math.pi/2
			}
		},
		considerations = UtilityConsiderations.clan_rat_follow
	},
	climb = {},
	running_attack = {
		damage_type = "cutting",
		player_push_speed = 3,
		fatigue_type = "blocked_running",
		action_weight = 10,
		moving_attack = true,
		default_attack = {
			anims = "attack_move"
		},
		damage = {
			3,
			2,
			1
		},
		difficulty_damage = {
			easy = {
				2,
				2,
				1
			},
			normal = {
				3,
				2,
				1
			},
			hard = {
				6,
				4,
				2
			},
			survival_hard = {
				6,
				4,
				2
			},
			harder = {
				10,
				6,
				3
			},
			survival_harder = {
				10,
				6,
				3
			},
			hardest = {
				15,
				8,
				4
			},
			survival_hardest = {
				15,
				8,
				4
			}
		},
		considerations = UtilityConsiderations.clan_rat_running_attack
	},
	normal_attack = {
		player_push_speed = 3,
		fatigue_type = "blocked_attack",
		action_weight = 1,
		damage_type = "cutting",
		move_anim = "move_fwd",
		default_attack = {
			anims = "attack_pounce",
			damage_box_range = {
				flat = 2,
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
		damage = {
			3,
			2,
			1
		},
		difficulty_damage = {
			easy = {
				2,
				2,
				1
			},
			normal = {
				3,
				2,
				1
			},
			hard = {
				6,
				4,
				2
			},
			survival_hard = {
				6,
				4,
				2
			},
			harder = {
				10,
				6,
				3
			},
			survival_harder = {
				10,
				6,
				3
			},
			hardest = {
				15,
				8,
				4
			},
			survival_hardest = {
				15,
				8,
				4
			}
		},
		considerations = UtilityConsiderations.clan_rat_attack,
		target_type_exceptions = {
			poison_well = {
				attack_anim = "poison_well"
			}
		},
		attack_directions = {
			attack_run = "left",
			attack_move_2 = "left",
			attack_pounce_down_2 = "right",
			attack_pounce_4 = "left",
			attack_reach_up = "left",
			attack_pounce_2 = "left",
			attack_reach_down_3 = "right",
			attack_move_1 = "left",
			attack_pounce_down_3 = "left",
			attack_pounce_down = "left",
			attack_reach_down_2 = "left",
			attack_pounce_3 = "left",
			attack_move = "left",
			attack_reach_down = "left",
			attack_pounce = "left"
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
		attack_anim = "attack_pounce",
		damage = {
			1,
			1,
			1
		}
	},
	interest_point_choose = {
		max_range = 10,
		name = "interest_point_choose",
		min_range = 4
	},
	blocked = {
		blocked_anims = {
			"blocked",
			"blocked_2",
			"blocked_3"
		}
	},
	stagger = {
		scale_animation_speeds = true,
		custom_enter_function = function (unit, blackboard, t, action)
			assert(ScriptUnit.has_extension(unit, "ai_shield_system"), "skaven_clan_rat_with_shield dont have ai_shield_user_extension")

			if blackboard.shield_breaking_hit then
				blackboard.shield_breaking_hit = false

				return action.shield_break_anims[blackboard.stagger_type], "idle", "to_sword"
			end

			local ai_shield_extension = ScriptUnit.extension(unit, "ai_shield_system")
			local stagger_anims, idle_event = nil
			local using_shield = not ai_shield_extension.shield_broken

			if using_shield then
				local is_blocking = blackboard.stagger <= 1

				ai_shield_extension.set_is_blocking(ai_shield_extension, is_blocking)

				if not is_blocking then
					blackboard.stagger_time = blackboard.stagger_time + math.clamp(blackboard.stagger*0.2, 0, 0.6)
				end

				if not blackboard.blocked and blackboard.stagger < 2 and action.shield_block_anims then
					stagger_anims = action.shield_block_anims[blackboard.stagger_type]
					idle_event = "idle"
				elseif not blackboard.blocked and blackboard.stagger < 3 and action.shield_stagger_anims then
					stagger_anims = action.shield_stagger_anims[blackboard.stagger_type]
					idle_event = blackboard.breed.shield_opening_event or "idle"
				else
					stagger_anims = action.stagger_anims[blackboard.stagger_type]
					idle_event = blackboard.breed.shield_opening_event or "idle"
				end
			else
				stagger_anims = action.stagger_anims[blackboard.stagger_type]
				idle_event = "idle"
			end

			return stagger_anims, idle_event
		end,
		custom_exit_function = function (unit, blackboard, t)
			local ai_shield_extension = ScriptUnit.has_extension(unit, "ai_shield_system") and ScriptUnit.extension(unit, "ai_shield_system")

			ai_shield_extension.set_is_blocking(ai_shield_extension, true)

			return 
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
					"stun_left_sword",
					"stun_left_sword_2",
					"stun_left_sword_3"
				},
				right = {
					"stun_right_sword",
					"stun_right_sword_2",
					"stun_right_sword_3"
				},
				dwn = {
					"stun_down"
				}
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
					"stagger_left",
					"stagger_left_2",
					"stagger_left_3",
					"stagger_left_4"
				},
				right = {
					"stagger_right",
					"stagger_right_2",
					"stagger_right_3",
					"stagger_right_4"
				},
				dwn = {
					"stun_down"
				}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd_fall",
					"stagger_bwd_fall_2"
				},
				left = {
					"stagger_left_heavy",
					"stagger_left_heavy_2",
					"stagger_left_heavy_3"
				},
				right = {
					"stagger_right_heavy",
					"stagger_right_heavy_2",
					"stagger_right_heavy_3"
				},
				dwn = {
					"stun_down"
				}
			},
			{
				fwd = {
					"stun_fwd_ranged_light",
					"stun_fwd_ranged_light_2"
				},
				bwd = {
					"stun_bwd_ranged_light",
					"stun_bwd_ranged_light_2"
				},
				left = {
					"stun_left_ranged_light",
					"stun_left_ranged_light_2"
				},
				right = {
					"stun_right_ranged_light",
					"stun_right_ranged_light_2"
				}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd_stab",
					"stagger_bwd_stab_2"
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
					"stagger_fwd_exp",
					"stagger_fwd_exp_2"
				},
				bwd = {
					"stagger_bwd_exp",
					"stagger_bwd_exp_2"
				},
				left = {
					"stagger_left_exp",
					"stagger_left_exp_2"
				},
				right = {
					"stagger_right_exp",
					"stagger_right_exp_2"
				}
			},
			{
				fwd = {
					"stun_bwd_sword"
				},
				bwd = {
					"stagger_short_bwd",
					"stagger_short_bwd_2",
					"stagger_short_bwd_3",
					"stagger_short_bwd_4",
					"stagger_short_bwd_5"
				},
				left = {
					"stun_left_sword",
					"stun_left_sword_2",
					"stun_left_sword_3",
					"stagger_short_bwd_4",
					"stagger_short_bwd_5"
				},
				right = {
					"stun_right_sword",
					"stun_right_sword_2",
					"stun_right_sword_3",
					"stagger_short_bwd_4",
					"stagger_short_bwd_5"
				},
				dwn = {
					"stun_down"
				}
			}
		},
		shield_block_anims = {
			{
				fwd = {
					"stun_bwd_sword"
				},
				bwd = {
					"stagger_bwd_shield_up_light"
				},
				left = {
					"stagger_left_shield_up_light"
				},
				right = {
					"stagger_right_shield_up_light"
				},
				dwn = {
					"stagger_bwd_shield_up_light_head"
				}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd_shield_up",
					"stagger_bwd_shield_up_2",
					"stagger_bwd_shield_up_3",
					"stagger_bwd_shield_up_4"
				},
				left = {
					"stagger_left_shield_up"
				},
				right = {
					"stagger_right_shield_up"
				},
				dwn = {
					"stagger_bwd_shield_up_head",
					"stagger_bwd_shield_up_head_2"
				}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd_shield_up",
					"stagger_bwd_shield_up_2",
					"stagger_bwd_shield_up_3"
				},
				left = {
					"stagger_left_shield_up"
				},
				right = {
					"stagger_right_shield_up"
				},
				dwn = {
					"stagger_bwd_shield_up_head",
					"stagger_bwd_shield_up_head_2"
				}
			},
			{
				fwd = {
					"stun_fwd_ranged_light",
					"stun_fwd_ranged_light_2"
				},
				bwd = {
					"stagger_bwd_shield_up",
					"stagger_bwd_shield_up_2",
					"stagger_bwd_shield_up_3"
				},
				left = {
					"stagger_left_shield_up"
				},
				right = {
					"stagger_right_shield_up"
				},
				dwn = {
					"stagger_bwd_shield_up"
				}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd_shield_up",
					"stagger_bwd_shield_up_2",
					"stagger_bwd_shield_up_3"
				},
				left = {
					"stagger_left_shield_up"
				},
				right = {
					"stagger_right_shield_up"
				},
				dwn = {
					"stagger_bwd_shield_up_light_head"
				}
			},
			{
				fwd = {
					"stagger_fwd_exp",
					"stagger_fwd_exp_2"
				},
				bwd = {
					"stagger_bwd_shield_up",
					"stagger_bwd_shield_up_2",
					"stagger_bwd_shield_up_3"
				},
				left = {
					"stagger_left_shield_up"
				},
				right = {
					"stagger_right_shield_up"
				},
				dwn = {
					"stagger_bwd_shield_up"
				}
			},
			{
				fwd = {
					"stun_bwd_sword"
				},
				bwd = {
					"stagger_bwd_shield_up_light"
				},
				left = {
					"stagger_left_shield_up_light"
				},
				right = {
					"stagger_right_shield_up_light"
				},
				dwn = {
					"stagger_bwd_shield_up_light"
				}
			}
		},
		shield_break_anims = {
			{
				fwd = {
					"stun_bwd_sword"
				},
				bwd = {
					"stagger_shield_break_bwd"
				},
				left = {
					"stagger_shield_break_left"
				},
				right = {
					"stagger_shield_break_right"
				},
				dwn = {
					"stagger_shield_break_bwd"
				}
			},
			{
				fwd = {
					"stun_bwd_sword"
				},
				bwd = {
					"stagger_shield_break_bwd"
				},
				left = {
					"stagger_shield_break_left"
				},
				right = {
					"stagger_shield_break_right"
				},
				dwn = {
					"stagger_shield_break_bwd"
				}
			},
			{
				fwd = {
					"stun_bwd_sword"
				},
				bwd = {
					"stagger_shield_break_bwd"
				},
				left = {
					"stagger_shield_break_left"
				},
				right = {
					"stagger_shield_break_right"
				},
				dwn = {
					"stagger_shield_break_bwd"
				}
			},
			{
				fwd = {
					"stun_bwd_sword"
				},
				bwd = {
					"stagger_shield_break_bwd"
				},
				left = {
					"stagger_shield_break_left"
				},
				right = {
					"stagger_shield_break_right"
				},
				dwn = {
					"stagger_shield_break_bwd"
				}
			},
			{
				fwd = {
					"stun_bwd_sword"
				},
				bwd = {
					"stagger_shield_break_bwd"
				},
				left = {
					"stagger_shield_break_left"
				},
				right = {
					"stagger_shield_break_right"
				},
				dwn = {
					"stagger_shield_break_bwd"
				}
			},
			{
				fwd = {
					"stun_bwd_sword"
				},
				bwd = {
					"stagger_shield_break_bwd"
				},
				left = {
					"stagger_shield_break_left"
				},
				right = {
					"stagger_shield_break_right"
				},
				dwn = {
					"stagger_shield_break_bwd"
				}
			},
			{
				fwd = {
					"stun_bwd_sword"
				},
				bwd = {
					"stagger_shield_break_bwd"
				},
				left = {
					"stagger_shield_break_left"
				},
				right = {
					"stagger_shield_break_right"
				},
				dwn = {
					"stagger_shield_break_bwd"
				}
			}
		},
		shield_stagger_anims = {
			{
				fwd = {
					"stun_bwd_sword"
				},
				bwd = {
					"stagger_bwd_shield_light"
				},
				left = {
					"stagger_left_shield_light"
				},
				right = {
					"stagger_right_shield_light"
				},
				dwn = {
					"stagger_bwd_shield_light"
				}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd_shield",
					"stagger_bwd_shield_2",
					"stagger_bwd_shield_3"
				},
				left = {
					"stagger_left_shield"
				},
				right = {
					"stagger_right_shield"
				},
				dwn = {
					"stagger_bwd_shield"
				}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd_shield",
					"stagger_bwd_shield_2",
					"stagger_bwd_shield_3"
				},
				left = {
					"stagger_left_shield"
				},
				right = {
					"stagger_right_shield"
				},
				dwn = {
					"stagger_bwd_shield"
				}
			},
			{
				fwd = {
					"stun_fwd_ranged_light",
					"stun_fwd_ranged_light_2"
				},
				bwd = {
					"stagger_bwd_shield",
					"stagger_bwd_shield_2",
					"stagger_bwd_shield_3"
				},
				left = {
					"stagger_left_shield"
				},
				right = {
					"stagger_right_shield"
				},
				dwn = {
					"stagger_bwd_shield"
				}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd_shield",
					"stagger_bwd_shield_2",
					"stagger_bwd_shield_3"
				},
				left = {
					"stagger_left_shield"
				},
				right = {
					"stagger_right_shield"
				},
				dwn = {
					"stagger_bwd_shield"
				}
			},
			{
				fwd = {
					"stagger_fwd_exp",
					"stagger_fwd_exp_2"
				},
				bwd = {
					"stagger_bwd_shield",
					"stagger_bwd_shield_2",
					"stagger_bwd_shield_3"
				},
				left = {
					"stagger_left_shield"
				},
				right = {
					"stagger_right_shield"
				},
				dwn = {
					"stagger_bwd_shield"
				}
			},
			{
				fwd = {
					"stun_bwd_sword"
				},
				bwd = {
					"stagger_bwd_shield_light"
				},
				left = {
					"stagger_left_shield_light"
				},
				right = {
					"stagger_right_shield_light"
				},
				dwn = {
					"stagger_bwd_shield_light"
				}
			}
		}
	}
}
BreedActions.skaven_clan_rat_with_shield = table.create_copy(BreedActions.skaven_clan_rat_with_shield, action_data)

return 

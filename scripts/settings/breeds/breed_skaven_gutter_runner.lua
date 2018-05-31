local breed_data = {
	behavior = "gutter_runner",
	walk_speed = 3,
	run_speed = 9,
	stagger_in_air_mover_check_radius = 0.2,
	vortexable = true,
	ignore_death_watch_timer = true,
	target_selection = "pick_ninja_approach_target",
	exchange_order = 2,
	animation_sync_rpc = "rpc_sync_anim_state_3",
	pounce_bonus_dmg_per_meter = 1,
	has_inventory = true,
	default_inventory_template = "gutter_runner",
	allow_fence_jumping = true,
	armor_category = 1,
	flingable = true,
	approaching_switch_radius = 10,
	poison_resistance = 100,
	hit_reaction = "ai_default",
	jump_speed = 25,
	time_to_unspawn_after_death = 1,
	headshot_coop_stamina_fatigue_type = "headshot_special",
	special = true,
	awards_positive_reinforcement_message = true,
	smart_targeting_outer_width = 0.6,
	no_stagger_duration = true,
	hit_effect_template = "HitEffectsGutterRunner",
	smart_targeting_height_multiplier = 1.6,
	radius = 1,
	unit_template = "ai_unit_gutter_runner",
	debug_flag = "ai_gutter_runner_behavior",
	special_spawn_stinger = "enemy_gutterrunner_stinger",
	race = "skaven",
	smart_object_template = "special",
	proximity_system_check = true,
	death_reaction = "gutter_runner",
	perception = "perception_all_seeing_re_evaluate",
	player_locomotion_constrain_radius = 0.7,
	jump_gravity = 9.82,
	bone_lod_level = 1,
	jump_range = 20,
	smart_targeting_width = 0.3,
	is_bot_aid_threat = true,
	initial_is_passive = false,
	base_unit = "units/beings/enemies/skaven_gutter_runner/chr_skaven_gutter_runner",
	threat_value = 8,
	pounce_impact_damage = {
		5,
		7
	},
	detection_radius = math.huge,
	perception_weights = {
		sticky_bonus = 5,
		dog_pile_penalty = -5,
		distance_weight = 10,
		max_distance = 40
	},
	max_health = {
		12,
		12,
		18,
		24,
		36
	},
	stagger_duration = {
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1
	},
	debug_class = DebugGutterRunner,
	debug_color = {
		255,
		200,
		200,
		0
	},
	disabled = Development.setting("disable_gutter_runner") or false,
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
				"j_spine1"
			}
		},
		torso = {
			prio = 3,
			actors = {
				"c_hips",
				"c_spine",
				"c_spine2",
				"c_leftshoulder",
				"c_rightshoulder"
			},
			push_actors = {
				"j_spine1"
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
				"j_spine1"
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
				"j_spine1"
			}
		},
		left_leg = {
			prio = 4,
			actors = {
				"c_leftleg",
				"c_leftupleg",
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
				"c_rightleg",
				"c_rightupleg",
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
	custom_death_enter_function = function (unit, killer_unit, damage_type, death_hit_zone, t, damage_source)
		local blackboard = BLACKBOARDS[unit]

		if not Unit.alive(killer_unit) then
			return
		end

		QuestSettings.check_gutter_killed_while_pouncing(blackboard, killer_unit, damage_source)
	end
}
Breeds.skaven_gutter_runner = table.create_copy(Breeds.skaven_gutter_runner, breed_data)
local action_data = {
	target_pounced = {
		final_damage_multiplier = 5,
		time_before_ramping_damage = 5,
		foff_after_pounce_kill = true,
		time_to_reach_final_damage_multiplier = 10,
		fatigue_type = "blocked_attack",
		far_impact_radius = 6,
		close_impact_radius = 2,
		impact_speed_given = 10,
		damage_type = "cutting",
		stab_until_target_is_killed = true,
		damage = {
			1.5,
			1.5,
			1.5,
			1.5
		},
		difficulty_damage = {
			easy = {
				1,
				0.5,
				0.25
			},
			normal = {
				1.5,
				1,
				0.5
			},
			hard = {
				2,
				1,
				0.5
			},
			survival_hard = {
				2,
				1,
				0.5
			},
			harder = {
				2.5,
				1.5,
				0.5
			},
			survival_harder = {
				2.5,
				1.5,
				0.5
			},
			hardest = {
				5,
				2,
				0.5
			},
			survival_hardest = {
				7.5,
				3,
				0.75
			}
		},
		ignore_staggers = {
			true,
			false,
			false,
			true,
			false,
			false,
			allow_push = true
		}
	},
	jump = {
		difficulty_jump_delay_time = {
			0.3,
			0.3,
			0.3,
			0.3,
			0.3
		}
	},
	prepare_crazy_jump = {
		difficulty_prepare_jump_time = {
			0.4,
			0.4,
			0.4,
			0.4,
			0.4
		}
	},
	ninja_vanish = {
		stalk_lonliest_player = true,
		foff_anim_length = 0.32,
		effect_name = "fx/chr_gutter_foff"
	},
	smash_door = {
		unblockable = true,
		damage_type = "cutting",
		move_anim = "move_fwd",
		attack_anim = "smash_door",
		damage = {
			5,
			5,
			5
		}
	},
	stagger = {
		custom_enter_function = function (unit, blackboard, t, action)
			local pushing_unit = blackboard.pushing_unit
			local bt_node_name = blackboard.btnode_name

			QuestSettings.check_gutter_runner_push_on_pounce(blackboard, pushing_unit)
			QuestSettings.check_gutter_runner_push_on_target_pounced(blackboard, pushing_unit)

			local stagger_anims = action.stagger_anims[blackboard.stagger_type]

			return stagger_anims, "idle"
		end,
		stagger_anims = {
			{
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
				fwd = {
					"stagger_fwd_heavy"
				},
				bwd = {
					"stagger_bwd_heavy"
				},
				left = {
					"stagger_left_heavy"
				},
				right = {
					"stagger_right_heavy"
				}
			},
			{
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
			}
		}
	}
}
BreedActions.skaven_gutter_runner = table.create_copy(BreedActions.skaven_gutter_runner, action_data)

return

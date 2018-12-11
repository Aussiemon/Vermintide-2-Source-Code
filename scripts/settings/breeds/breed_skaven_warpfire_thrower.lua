local breed_data = {
	flingable = true,
	has_inventory = true,
	walk_speed = 2,
	run_speed = 4.5,
	aim_template = "warpfire_thrower",
	unit_template = "ai_unit_warpfire_thrower",
	target_selection = "pick_pack_master_target",
	always_look_at_target = true,
	exchange_order = 2,
	animation_sync_rpc = "rpc_sync_anim_state_4",
	smart_targeting_width = 0.3,
	special = true,
	poison_resistance = 100,
	armor_category = 2,
	no_stagger_duration = true,
	hit_reaction = "ai_default",
	scale_death_push = 1,
	bots_flank_while_targeted = true,
	wield_inventory_on_spawn = true,
	dialogue_source_name = "skaven_warpfire_thrower",
	default_inventory_template = "warpfiregun",
	stagger_resistance = 2,
	smart_targeting_outer_width = 0.7,
	headshot_coop_stamina_fatigue_type = "headshot_special",
	hit_effect_template = "HitEffectsRatlingGunner",
	smart_targeting_height_multiplier = 2.1,
	awards_positive_reinforcement_message = true,
	radius = 1,
	switch_target_radius = 20,
	bone_lod_level = 1,
	race = "skaven",
	proximity_system_check = true,
	death_reaction = "warpfire_thrower",
	perception = "perception_all_seeing",
	player_locomotion_constrain_radius = 0.7,
	smart_object_template = "special",
	death_sound_event = "Play_enemy_vo_warpfire_die",
	spawning_rule = "always_ahead",
	vortexable = true,
	is_bot_aid_threat = true,
	behavior = "skaven_warpfire_thrower",
	base_unit = "units/beings/enemies/skaven_warpfire_thrower/chr_skaven_warpfire_thrower",
	threat_value = 8,
	bots_should_flank = true,
	detection_radius = math.huge,
	size_variation_range = {
		1.1,
		1.1
	},
	max_health = {
		12,
		12,
		18,
		24,
		36
	},
	bloodlust_health = BreedTweaks.bloodlust_health.skaven_special,
	diff_stagger_resist = {
		3,
		3,
		4,
		5,
		5
	},
	stagger_duration = {
		0.25,
		0.5,
		1,
		1,
		1,
		1,
		1,
		1
	},
	debug_color = {
		255,
		200,
		200,
		0
	},
	disabled = Development.setting("disable_warpfire_thrower") or false,
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
				"c_neck",
				"c_neck1"
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
		},
		aux = {
			prio = 6,
			actors = {
				"c_backpack"
			},
			push_actors = {
				"j_backpack"
			}
		}
	},
	nav_cost_map_allowed_layers = {
		plague_wave = 20,
		troll_bile = 20,
		lamp_oil_fire = 10,
		warpfire_thrower_warpfire = 1,
		vortex_near = 1,
		stormfiend_warpfire = 1,
		vortex_danger_zone = 1
	},
	custom_death_enter_function = function (unit, killer_unit, damage_type, death_hit_zone)
		local blackboard = BLACKBOARDS[unit]

		if not Unit.alive(killer_unit) then
			return
		end

		QuestSettings.check_warpfire_kill_before_shooting(blackboard, killer_unit)
		QuestSettings.check_warpfire_kill_on_power_cell(death_hit_zone, killer_unit)
	end
}
Breeds.skaven_warpfire_thrower = table.create_copy(Breeds.skaven_warpfire_thrower, breed_data)
local action_data = {
	skulk = {
		dogpile_aggro_needed = 2,
		skulk_time = 1,
		skulk_time_force_attack = 10,
		skulk_animation = "move_start_fwd",
		melee_override_distance_sqr = 100
	},
	follow = {
		move_animation = "move_start_fwd",
		distance_to_attack = 10
	},
	smash_door = {
		unblockable = true,
		name = "smash_door",
		damage_type = "cutting",
		move_anim = "move_fwd",
		attack_anim = "smash_door",
		damage = {
			5,
			5,
			5
		}
	},
	shoot_warpfire_thrower = {
		aim_rotation_override_speed_multiplier = 1.5,
		minimum_length = 0.1,
		target_switch_distance = 20,
		bot_threat_offset_up = 0,
		firing_time = 5,
		aim_rotation_dodge_multipler = 0.15,
		close_attack_range = 15,
		bot_threat_height = 2,
		bot_threat_start_time = 0.7666666666666667,
		bot_threat_offset_forward = 0,
		close_attack_cooldown = 0.3,
		bot_threat_radius = 15,
		action_weight = 1,
		hit_radius = 0.4,
		buff_name = "warpfire_thrower_face_base",
		aim_rotation_override_distance = 3,
		muzzle_node = "p_fx",
		bot_threat_duration = 4.233333333333333,
		rotation_speed = 80,
		warpfire_follow_target_speed = 0.75,
		considerations = UtilityConsiderations.shoot_warpfire_thrower,
		attack_anims = {
			bwd = "turn_bwd",
			fwd = "turn_right",
			left = "turn_left",
			right = "turn_right"
		},
		radial_speed_upper_body_shooting = math.pi * 0.5,
		radial_speed_feet_shooting = math.pi * 1.9,
		ai_push_data = {
			stagger_distance = 1,
			stagger_impact = {
				2,
				2,
				2,
				1,
				1
			},
			stagger_duration = {
				2,
				2,
				0,
				0,
				4
			}
		}
	},
	stagger = {
		stagger_anims = {
			{
				fwd = {
					"stun_fwd_sword",
					"stun_fwd_sword_2"
				},
				bwd = {
					"stun_bwd_sword",
					"stun_bwd_sword_2"
				},
				left = {
					"stun_left_sword",
					"stun_left_sword_2"
				},
				right = {
					"stun_right_sword",
					"stun_right_sword_2"
				}
			},
			{
				fwd = {
					"stagger_fwd",
					"stagger_fwd_2"
				},
				bwd = {
					"stagger_bwd",
					"stagger_bwd_2"
				},
				left = {
					"stagger_left",
					"stagger_left_2"
				},
				right = {
					"stagger_right",
					"stagger_right_2"
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
			}
		}
	}
}
BreedActions.skaven_warpfire_thrower = table.create_copy(BreedActions.skaven_warpfire_thrower, action_data)

return

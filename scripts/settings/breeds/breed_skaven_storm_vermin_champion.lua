local breed_data = {
	threat_value = 32,
	walk_speed = 2,
	race = "skaven",
	player_locomotion_constrain_radius = 1,
	poison_resistance = 100,
	is_bot_aid_threat = true,
	ai_strength = 6,
	animation_sync_rpc = "rpc_sync_anim_state_6",
	bot_hitbox_radius_approximation = 1,
	disable_crowd_dispersion = true,
	target_selection = "pick_rat_ogre_target_with_weights",
	ai_toughness = 3,
	death_sound_event = "Play_stormvermin_die_vce",
	run_speed = 6.109090909090908,
	has_running_attack = true,
	slot_template = "skaven_elite",
	bot_opportunity_target_melee_range = 7,
	bone_lod_level = 1,
	wield_inventory_on_spawn = true,
	perception = "perception_rat_ogre",
	default_inventory_template = "halberd",
	behavior = "storm_vermin_champion",
	dialogue_source_name = "skaven_storm_vermin_champion",
	initial_is_passive = false,
	boss_staggers = true,
	aoe_radius = 0.6,
	radius = 1,
	boss = true,
	disable_second_hit_ragdoll = true,
	proximity_system_check = true,
	death_reaction = "storm_vermin_champion",
	armor_category = 2,
	angry_run_speed = 6,
	smart_targeting_width = 0.2,
	perception_continuous = "perception_continuous_rat_ogre",
	bots_should_flank = true,
	has_inventory = true,
	no_stagger_duration = true,
	awards_positive_reinforcement_message = true,
	exchange_order = 1,
	combat_music_state = "champion_skaven_stormvermin",
	hit_reaction = "ai_default",
	smart_targeting_outer_width = 1,
	hit_effect_template = "HitEffectsStormVerminChampion",
	smart_targeting_height_multiplier = 2.5,
	unit_template = "ai_unit_storm_vermin_champion",
	smart_object_template = "special",
	headshot_coop_stamina_fatigue_type = "headshot_special",
	minion_detection_radius = 20,
	bot_opportunity_target_melee_range_while_ranged = 5,
	weapon_reach = 2,
	far_off_despawn_immunity = true,
	override_mover_move_distance = 1.5,
	stagger_immune = true,
	base_unit = "units/beings/enemies/skaven_stormvermin_champion/chr_skaven_stormvermin_champion",
	aoe_height = 1.7,
	detection_radius = math.huge,
	perception_weights = {
		target_catapulted_mul = 0.5,
		target_stickyness_bonus_b = 10,
		targeted_by_other_special = -10,
		distance_weight = 10,
		target_stickyness_duration_b = 20,
		aggro_decay_per_sec = 10,
		target_outside_navmesh_mul = 0.5,
		target_stickyness_bonus_a = 50,
		old_target_aggro_mul = 1,
		target_disabled_aggro_mul = 0,
		max_distance = 50,
		target_stickyness_duration_a = 5,
		target_disabled_mul = 0.15,
		aggro_multipliers = {
			melee = 1,
			ranged = 3,
			grenade = 2
		}
	},
	size_variation_range = {
		1.4,
		1.4
	},
	max_health = {
		300,
		350,
		400,
		500,
		800,
		800,
		800,
		800
	},
	bloodlust_health = BreedTweaks.bloodlust_health.monster,
	stagger_duration = BreedTweaks.stagger_duration.stormvermin,
	debug_color = {
		255,
		200,
		0,
		170
	},
	run_on_spawn = AiBreedSnippets.on_storm_vermin_champion_spawn,
	run_on_death = AiBreedSnippets.on_storm_vermin_champion_death,
	run_on_update = AiBreedSnippets.on_storm_vermin_champion_update,
	run_on_husk_spawn = AiBreedSnippets.on_storm_vermin_champion_husk_spawn,
	run_on_despawn = AiBreedSnippets.on_storm_vermin_champion_despawn,
	hot_join_sync = AiBreedSnippets.on_storm_vermin_hot_join_sync,
	hitzone_multiplier_types = {
		head = "headshot",
		ward = "protected_spot"
	},
	hit_zones = {
		ward = {
			prio = 1,
			actors = {
				"c_trophy_rack_ward"
			},
			push_actors = {
				"j_hips"
			}
		},
		head = {
			prio = 2,
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
			prio = 2,
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
		full = {
			prio = 5,
			actors = {}
		},
		afro = {
			prio = 6,
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
	}
}
Breeds.skaven_storm_vermin_champion = table.create_copy(Breeds.skaven_storm_vermin_champion, breed_data)
local action_data = {
	follow = {
		follow_target_function_name = "_follow_target_rat_ogre",
		cooldown = -1,
		move_anim = "move_fwd",
		action_weight = 1,
		start_anims = {
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
		considerations = UtilityConsiderations.storm_vermin_champion_follow
	},
	special_attack_champion = {
		action_weight = 1,
		considerations = UtilityConsiderations.storm_vermin_champion_special_attack
	},
	running_attack = {
		action_weight = 2,
		considerations = UtilityConsiderations.storm_vermin_champion_running_attack
	},
	special_attack_cleave = {
		offset_forward = 0,
		height = 3,
		cooldown = 1.5,
		rotation_time = 1,
		fatigue_type = "blocked_sv_cleave",
		bot_threat_duration = 0.75,
		increment_stat_on_attack_dodged = "dodged_storm_vermin_champion",
		damage_type = "cutting",
		offset_up = 0,
		attack_anim = "attack_special",
		range = 4,
		damage = 30,
		player_push_speed = 10,
		blocked_damage = 0,
		player_push_speed_blocked = 8,
		move_anim = "move_fwd",
		width = 0.4,
		throw_dialogue_system_event_on_dodged_attack = true,
		blocked_difficulty_damage = {
			harder = 5,
			hard = 2,
			normal = 0,
			hardest = 10,
			cataclysm = 15,
			cataclysm_3 = 30,
			cataclysm_2 = 20,
			easy = 0
		},
		difficulty_damage = {
			harder = 50,
			hard = 40,
			normal = 30,
			hardest = 100,
			cataclysm = 100,
			cataclysm_3 = 100,
			cataclysm_2 = 100,
			easy = 20
		},
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			false
		}
	},
	special_attack_spin = {
		height = 4,
		offset_forward = -6,
		radius = 4.5,
		cooldown = 0.25,
		rotation_time = 0,
		fatigue_type = "blocked_slam",
		collision_type = "cylinder",
		player_push_speed = 20,
		shove_speed = 9,
		damage_type = "cutting",
		shove_z_speed = 6,
		offset_up = 0,
		attack_anim = "attack_spin_charge",
		offset_right = 0,
		bot_threat_duration = 2,
		damage = 20,
		action_weight = 4,
		blocked_damage = 0,
		player_push_speed_blocked = 15,
		move_anim = "move_fwd",
		attack_sequence = {
			{
				attack_anim = "attack_spin_charge"
			},
			{
				attack_anim = "attack_spin",
				at = 2
			}
		},
		blocked_difficulty_damage = {
			harder = 5,
			hard = 2,
			normal = 0,
			hardest = 10,
			cataclysm = 10,
			cataclysm_3 = 10,
			cataclysm_2 = 10,
			easy = 0
		},
		difficulty_damage = {
			harder = 30,
			hard = 25,
			normal = 20,
			hardest = 50,
			cataclysm = 60,
			cataclysm_3 = 100,
			cataclysm_2 = 75,
			easy = 15
		},
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			false
		},
		considerations = UtilityConsiderations.storm_vermin_champion_spin
	}
}
action_data.defensive_mode_spin = {
	height = 4,
	offset_forward = -6,
	radius = 6,
	cooldown = 0.25,
	rotation_time = 0,
	fatigue_type = "blocked_slam",
	collision_type = "cylinder",
	player_push_speed = 20,
	shove_speed = 9,
	damage_type = "cutting",
	shove_z_speed = 6,
	offset_up = 0,
	attack_anim = "attack_spin_charge",
	offset_right = 0,
	bot_threat_duration = 2,
	damage = 20,
	action_weight = 4,
	blocked_damage = 0,
	player_push_speed_blocked = 15,
	move_anim = "move_fwd",
	exit_flow_event = "lua_disable_weapon_fx",
	attack_sequence = {
		{
			attack_anim = "attack_spin_charge"
		},
		{
			attack_anim = "attack_spin",
			ready_function = function (unit, blackboard, t)
				local charge_t = t - blackboard.attack_sequence_start_time

				return charge_t > 1.5 and blackboard.surrounding_players > 0 or charge_t > 2.5
			end
		}
	},
	blocked_difficulty_damage = {
		harder = 5,
		hard = 2,
		normal = 0,
		hardest = 10,
		cataclysm = 10,
		cataclysm_3 = 10,
		cataclysm_2 = 10,
		easy = 0
	},
	difficulty_damage = {
		harder = 30,
		hard = 25,
		normal = 20,
		hardest = 50,
		cataclysm = 50,
		cataclysm_3 = 100,
		cataclysm_2 = 75,
		easy = 15
	},
	ignore_staggers = {
		true,
		true,
		true,
		true,
		true,
		false
	},
	considerations = UtilityConsiderations.storm_vermin_champion_defensive_spin
}
action_data.special_attack_sweep_left = {
	radius = 2.25,
	overlap_end_time = 0.7575757575757576,
	cooldown = 0.25,
	rotation_time = 0,
	fatigue_type = "blocked_sv_sweep",
	collision_filter = "filter_player_and_husk_trigger",
	offset_right = 0,
	mode = "radial_cylinder",
	direction = "counter_clockwise",
	damage_type = "cutting",
	offset_forward = -1.5,
	offset_up = 0,
	attack_anim = "attack_sweep_left",
	collision_type = "cylinder",
	height = 2,
	damage = 20,
	player_push_speed = 8,
	overlap_start_time = 0.5151515151515151,
	bot_threat_duration = 1,
	player_push_speed_blocked = 6,
	move_anim = "move_fwd",
	throw_dialogue_system_event_on_dodged_attack = true,
	difficulty_damage = {
		harder = 30,
		hard = 25,
		normal = 20,
		hardest = 50,
		cataclysm = 60,
		cataclysm_3 = 100,
		cataclysm_2 = 75,
		easy = 15
	},
	overlap_start_angle_offset = -math.pi,
	overlap_end_angle_offset = 0.5 * math.pi,
	ignore_staggers = {
		true,
		true,
		true,
		true,
		true,
		false
	}
}
action_data.special_attack_sweep_right = {
	radius = 2.25,
	overlap_end_time = 0.7333333333333333,
	cooldown = 0.25,
	rotation_time = 0,
	fatigue_type = "blocked_sv_sweep",
	collision_filter = "filter_player_and_husk_trigger",
	offset_right = 0,
	mode = "radial_cylinder",
	direction = "clockwise",
	damage_type = "cutting",
	offset_forward = -1.1,
	offset_up = 0,
	attack_anim = "attack_sweep_right",
	collision_type = "cylinder",
	height = 2,
	damage = 20,
	player_push_speed = 8,
	overlap_start_time = 0.36666666666666664,
	bot_threat_duration = 1,
	player_push_speed_blocked = 6,
	move_anim = "move_fwd",
	throw_dialogue_system_event_on_dodged_attack = true,
	difficulty_damage = {
		harder = 30,
		hard = 25,
		normal = 20,
		hardest = 50,
		cataclysm = 50,
		cataclysm_3 = 50,
		cataclysm_2 = 50,
		easy = 15
	},
	overlap_start_angle_offset = -0.5 * math.pi,
	overlap_end_angle_offset = math.pi,
	ignore_staggers = {
		true,
		true,
		true,
		true,
		true,
		false
	}
}
action_data.special_lunge_attack = {
	animation_driven = true,
	offset_forward = 0.25,
	wall_collision_stun_time = 1.1666666666666667,
	overlap_start_time = 1.1,
	cooldown = 0.25,
	rotation_time = 1,
	fatigue_type = "blocked_slam",
	overlap_end_time = 2.3666666666666667,
	mode = "continuous_overlap",
	player_push_speed = 12,
	damage_type = "cutting",
	overlap_check_walls_range = 2,
	offset_up = 0,
	overlap_check_walls_time = 1.75,
	range = 2,
	damage = 20,
	height = 2,
	wall_collision_anim = "charge_attack_lunge_miss",
	action_weight = 5,
	blocked_damage = 5,
	player_push_speed_blocked = 8,
	move_anim = "move_fwd",
	width = 1,
	throw_dialogue_system_event_on_missed_attack = true,
	considerations = UtilityConsiderations.storm_vermin_champion_lunge_attack,
	attack_sequence = {
		{
			attack_anim = "charge_attack_step"
		},
		{
			at = 1.0666666666666667,
			animation_drive_scale = 0.4,
			attack_anim = "charge_attack_lunge"
		}
	},
	blocked_difficulty_damage = {
		harder = 9,
		hard = 7,
		normal = 5,
		hardest = 15,
		cataclysm = 17,
		cataclysm_3 = 21.25,
		cataclysm_2 = 19,
		easy = 4
	},
	difficulty_damage = {
		harder = 30,
		hard = 25,
		normal = 20,
		hardest = 50,
		cataclysm = 69,
		cataclysm_3 = 100,
		cataclysm_2 = 75,
		easy = 15
	},
	ignore_staggers = {
		true,
		true,
		true,
		true,
		true,
		false
	}
}
action_data.special_running_attack = {
	animation_driven = true,
	offset_forward = 0.15,
	overlap_start_time = 0.2,
	cooldown = 0.5,
	rotation_time = 1.1,
	fatigue_type = "blocked_attack",
	overlap_end_time = 1.1,
	overlap_start_damage = 0,
	mode = "continuous_overlap",
	height = 2,
	damage_type = "cutting",
	player_push_speed = 12,
	offset_up = 0,
	damage = 20,
	movement_controlled_rotation = false,
	action_weight = 5,
	blocked_damage = 0,
	player_push_speed_blocked = 12,
	width = 0.3,
	considerations = UtilityConsiderations.storm_vermin_champion_running_attack,
	attack_sequence = {
		{
			attack_anim = "charge_attack_step"
		},
		{
			attack_anim = "attack_run_2",
			at = 0.16666666666666666
		}
	},
	blocked_difficulty_damage = {
		harder = 5,
		hard = 2,
		normal = 0,
		hardest = 10,
		cataclysm = 20,
		cataclysm_3 = 35,
		cataclysm_2 = 25,
		easy = 0
	},
	difficulty_damage = {
		harder = 30,
		hard = 25,
		normal = 20,
		hardest = 50,
		cataclysm = 25,
		cataclysm_3 = 75,
		cataclysm_2 = 30,
		easy = 15
	},
	ignore_staggers = {
		true,
		true,
		true,
		true,
		true,
		false
	},
	range = function (t_value)
		if t_value < 0.65 then
			return 0.4
		else
			local scaled_t = math.min((t_value - 0.65) * 4, 1)

			return math.lerp(0.4, 2.95, scaled_t)
		end
	end
}
action_data.special_attack_shatter = {
	wave_fx = "fx/chr_stormvermin_champion_beam_impact_dot",
	anticipation_fx = "fx/chr_stormvermin_champion_beam_anticipation_dot",
	damage = 20,
	cooldown = 1,
	rotation_time = 0,
	fatigue_type = "blocked_slam",
	wave_point_distance = 1,
	height = 2,
	mode = "nav_mesh_wave",
	offset_forward = 0.5,
	damage_type = "cutting",
	num_wave_points = 15,
	shove_speed = 4,
	shove_z_speed = 10,
	wave_sfx = "Play_enemy_stormvermin_champion_electric_floor",
	wave_speed = 20,
	overlap_start_time = 2.1666666666666665,
	action_weight = 5,
	blocked_damage = 5,
	move_anim = "move_fwd",
	width = 2,
	considerations = UtilityConsiderations.storm_vermin_champion_shatter_attack,
	attack_sequence = {
		{
			attack_anim = "attack_charge_special"
		},
		{
			attack_anim = "attack_charge_shatter",
			at = 1.5
		}
	},
	blocked_difficulty_damage = {
		harder = 9,
		hard = 7,
		normal = 5,
		hardest = 12,
		cataclysm = 17,
		cataclysm_3 = 35,
		cataclysm_2 = 25,
		easy = 4
	},
	difficulty_damage = {
		harder = 30,
		hard = 25,
		normal = 20,
		hardest = 50,
		cataclysm = 60,
		cataclysm_3 = 100,
		cataclysm_2 = 75,
		easy = 15
	},
	ignore_staggers = {
		true,
		true,
		true,
		true,
		true,
		false
	}
}
action_data.defensive_attack_shatter = {
	wave_fx = "fx/chr_stormvermin_champion_beam_impact_dot",
	anticipation_fx = "fx/chr_stormvermin_champion_beam_anticipation_dot",
	damage = 20,
	cooldown = 1,
	rotation_time = 0,
	fatigue_type = "blocked_slam",
	wave_point_distance = 1,
	height = 2,
	mode = "nav_mesh_wave",
	offset_forward = 0.5,
	damage_type = "cutting",
	num_wave_points = 9,
	shove_speed = 4,
	shove_z_speed = 10,
	wave_sfx = "Play_enemy_stormvermin_champion_electric_floor",
	wave_speed = 20,
	overlap_start_time = 2.1666666666666665,
	action_weight = 5,
	blocked_damage = 5,
	move_anim = "move_fwd",
	width = 2,
	considerations = UtilityConsiderations.storm_vermin_champion_defensive_shatter_attack,
	attack_sequence = {
		{
			attack_anim = "attack_charge_special"
		},
		{
			attack_anim = "attack_charge_shatter",
			at = 1.5
		}
	},
	blocked_difficulty_damage = {
		harder = 9,
		hard = 7,
		normal = 5,
		hardest = 12,
		cataclysm = 15,
		cataclysm_3 = 30,
		cataclysm_2 = 20,
		easy = 4
	},
	difficulty_damage = {
		harder = 30,
		hard = 25,
		normal = 20,
		hardest = 50,
		cataclysm = 60,
		cataclysm_3 = 100,
		cataclysm_2 = 75,
		easy = 15
	},
	ignore_staggers = {
		true,
		true,
		true,
		true,
		true,
		false
	}
}
action_data.smash_door = {
	unblockable = true,
	name = "smash_door",
	damage = 3,
	damage_type = "cutting",
	move_anim = "move_fwd",
	attack_anim = "attack_pounce"
}
action_data.blocked = {
	blocked_anims = {
		"blocked",
		"blocked_2"
	}
}
action_data.stagger = {
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
			},
			dwn = {
				"stun_bwd_sword"
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
			},
			dwn = {
				"stagger_bwd"
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
				"stagger_bwd"
			},
			left = {
				"stagger_left_heavy"
			},
			right = {
				"stagger_right_heavy"
			}
		}
	}
}
action_data.spawn_sequence = {
	action_weight = 20,
	considerations = UtilityConsiderations.storm_vermin_champion_spawn
}
action_data.turn_to_face_target = {
	action_weight = 20,
	rage_time = 0.6,
	considerations = UtilityConsiderations.storm_vermin_champion_turn_to_face_target,
	start_anims_name = {
		bwd = "turn_bwd",
		left = "turn_left",
		right = "turn_right"
	},
	start_anims_data = {
		turn_bwd = {
			dir = -1,
			rad = math.pi
		},
		turn_left = {
			dir = 1,
			rad = math.pi / 2
		},
		turn_right = {
			dir = -1,
			rad = math.pi / 2
		}
	}
}
action_data.spawn_allies = {
	run_to_spawn_speed = 7,
	spawn_group = "default",
	animation = "call_allies",
	move_anim = "move_fwd",
	duration = 5,
	spawn = "stormdorf_boss_event_defensive_hard",
	spawn_list = {
		"skaven_storm_vermin",
		"skaven_storm_vermin"
	},
	difficulty_spawn_list = {
		easy = {
			"skaven_storm_vermin"
		},
		normal = {
			"skaven_storm_vermin",
			"skaven_storm_vermin"
		},
		hard = {
			"skaven_storm_vermin",
			"skaven_storm_vermin"
		},
		harder = {
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin"
		},
		hardest = {
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin"
		},
		cataclysm = {
			"skaven_storm_vermin",
			"skaven_storm_vermin"
		},
		cataclysm_2 = {
			"skaven_storm_vermin",
			"skaven_storm_vermin"
		},
		cataclysm_3 = {
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin",
			"skaven_storm_vermin"
		}
	},
	difficulty_spawn = {
		harder = "stormdorf_boss_event_defensive_harder",
		hard = "stormdorf_boss_event_defensive_hard",
		normal = "stormdorf_boss_event_defensive_normal",
		hardest = "stormdorf_boss_event_defensive_hardest",
		cataclysm = "stormdorf_boss_event_defensive_hard",
		cataclysm_3 = "stormdorf_boss_event_defensive_hard",
		cataclysm_2 = "stormdorf_boss_event_defensive_hard",
		easy = "stormdorf_boss_event_defensive_easy"
	},
	start_anims = {
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
	}
}
action_data.defensive_idle = {
	force_idle_animation = true,
	idle_animation = "defensive_idle"
}
BreedActions.skaven_storm_vermin_champion = table.create_copy(BreedActions.skaven_storm_vermin_champion, action_data)

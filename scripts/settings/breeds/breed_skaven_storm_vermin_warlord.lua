local pushed_data = {
	ahead_dist = 2,
	push_width = 1.25,
	push_forward_offset = 1.5,
	push_stagger_distance = 1,
	player_pushed_speed = 8,
	push_stagger_impact = {
		2,
		2,
		0,
		0
	},
	push_stagger_duration = {
		1.5,
		1,
		0,
		0
	}
}
local WARLORD_ALLOWED_STAGGERS = {
	true,
	true,
	true,
	true,
	true,
	true,
	true
}
local breed_data = {
	bot_hitbox_radius_approximation = 1,
	walk_speed = 2.545454545454545,
	is_bot_aid_threat = true,
	angry_run_speed = 6,
	poison_resistance = 100,
	behavior = "storm_vermin_warlord",
	smart_targeting_height_multiplier = 2.5,
	disable_crowd_dispersion = true,
	target_selection = "pick_rat_ogre_target_with_weights",
	no_effects_on_shield_block = true,
	aoe_radius = 0.6,
	bots_should_flank = true,
	death_reaction = "storm_vermin_champion",
	base_unit = "units/beings/enemies/skaven_stormvermin_champion/chr_skaven_stormvermin_warlord",
	shield_stab_block_sound = "weapon_stormvermin_champion_sword_block",
	headshot_coop_stamina_fatigue_type = "headshot_special",
	shield_blunt_block_sound = "weapon_stormvermin_champion_sword_block",
	threat_value = 32,
	bot_opportunity_target_melee_range = 7,
	wield_inventory_on_spawn = true,
	default_inventory_template = "warlord_dual_setups",
	stagger_resistance = 1,
	dialogue_source_name = "skaven_storm_vermin_warlord",
	awards_positive_reinforcement_message = true,
	boss_staggers = false,
	primary_armor_category = 6,
	server_controlled_health_bar = true,
	radius = 1,
	boss = true,
	bone_lod_level = 1,
	smart_object_template = "special",
	animation_sync_rpc = "rpc_sync_anim_state_6",
	race = "skaven",
	disable_second_hit_ragdoll = true,
	proximity_system_check = true,
	unbreakable_shield = true,
	armor_category = 2,
	death_sound_event = "Play_stormvermin_die_vce",
	smart_targeting_width = 0.2,
	perception_continuous = "perception_continuous_rat_ogre",
	initial_is_passive = false,
	boost_curve_multiplier_override = 2,
	has_inventory = true,
	run_speed = 6.109090909090908,
	exchange_order = 1,
	shield_stagger_mod = 1,
	combat_music_state = "champion_skaven_stormvermin_warlord",
	hit_reaction = "ai_default",
	passive_in_patrol = false,
	can_dodge = true,
	armored_boss_damage_reduction = true,
	smart_targeting_outer_width = 1,
	hit_effect_template = "HitEffectsStormVerminChampion",
	using_combo = true,
	unit_template = "ai_unit_storm_vermin_warlord",
	difficulty_kill_achievement = "kill_skaven_storm_vermin_warlord_difficulty_rank",
	has_running_attack = true,
	perception = "perception_rat_ogre",
	player_locomotion_constrain_radius = 1,
	bot_opportunity_target_melee_range_while_ranged = 5,
	weapon_reach = 2,
	far_off_despawn_immunity = true,
	override_mover_move_distance = 1.5,
	shield_slashing_block_sound = "weapon_stormvermin_champion_sword_block",
	aoe_height = 1.7,
	displace_players_data = pushed_data,
	detection_radius = math.huge,
	perception_weights = {
		target_catapulted_mul = 0.5,
		target_stickyness_bonus_b = 10,
		targeted_by_other_special = -10,
		distance_weight = 10,
		target_stickyness_duration_b = 20,
		aggro_decay_per_sec = 15,
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
		400,
		500,
		750,
		1000,
		1500
	},
	diff_stagger_resist = {
		2.25,
		2.25,
		3,
		3.75,
		3.75
	},
	stagger_reduction = {
		1.35,
		1.35,
		1.8,
		2.25,
		2.25
	},
	stagger_duration = {
		0.35,
		0.35,
		0.35,
		0.35,
		0.35,
		2.35,
		0.35,
		0.35
	},
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
	stagger_modifier_function = function (stagger, duration, length, hit_zone_name, blackboard, breed)
		if not blackboard.dual_wield_mode and stagger ~= 6 then
			stagger = 0
			local ai_shield_extension = ScriptUnit.extension(blackboard.unit, "ai_shield_system")

			ai_shield_extension:set_is_blocking(false)
		end

		return stagger, duration, length
	end,
	hitzone_multiplier_types = {
		head = "headshot",
		ward = "protected_spot"
	},
	hit_zones = {
		full = {
			prio = 2,
			actors = {}
		},
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
	custom_death_enter_function = function (unit, killer_unit, damage_type, death_hit_zone, t, damage_source)
		local blackboard = BLACKBOARDS[unit]

		if not Unit.alive(killer_unit) then
			return
		end

		QuestSettings.check_killed_lord_as_last_player_standing(killer_unit)
	end
}
local pushed_data = {
	ahead_dist = 2.5,
	push_width = 1.25,
	push_forward_offset = 0.5,
	push_stagger_distance = 1,
	player_pushed_speed = 6,
	push_stagger_impact = {
		2,
		2,
		0,
		0
	},
	push_stagger_duration = {
		1.5,
		1,
		0,
		0
	}
}
Breeds.skaven_storm_vermin_warlord = table.create_copy(Breeds.skaven_storm_vermin_warlord, breed_data)
local action_data = {
	follow = {
		follow_target_function_name = "_follow_target_rat_ogre",
		move_anim = "move_fwd",
		action_weight = 1,
		considerations = UtilityConsiderations.storm_vermin_champion_follow,
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
	},
	special_attack_champion = {
		action_weight = 1,
		considerations = UtilityConsiderations.storm_vermin_champion_special_attack
	},
	special_attack_champion_defensive = {
		action_weight = 2,
		considerations = UtilityConsiderations.storm_vermin_champion_special_attack_defensive
	},
	special_attack_cleave = {
		damage_type = "cutting",
		offset_forward = 0,
		height = 3,
		fatigue_type = "blocked_sv_cleave",
		rotation_time = 1,
		hit_react_type = "heavy",
		player_push_speed = 10,
		offset_up = 0,
		attack_anim = "attack_special",
		range = 4,
		bot_threat_duration = 0.7333333333333333,
		player_push_speed_blocked = 8,
		width = 0.4,
		throw_dialogue_system_event_on_dodged_attack = true,
		blocked_damage = {
			0,
			0,
			0
		},
		blocked_difficulty_damage = {
			easy = {
				0,
				0,
				0
			},
			normal = {
				0,
				0,
				0
			},
			hard = {
				2,
				2,
				2
			},
			survival_hard = {
				2,
				2,
				2
			},
			harder = {
				5,
				5,
				5
			},
			survival_harder = {
				5,
				5,
				5
			},
			hardest = {
				10,
				10,
				10
			},
			survival_hardest = {
				10,
				10,
				10
			}
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
				15,
				20,
				15
			},
			hard = {
				20,
				25,
				20
			},
			survival_hard = {
				40,
				35,
				30
			},
			harder = {
				30,
				40,
				30
			},
			survival_harder = {
				50,
				40,
				30
			},
			hardest = {
				40,
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
			true,
			true,
			true,
			true,
			false
		}
	},
	dual_attack_cleave = {
		damage_type = "cutting",
		offset_forward = 0.5,
		height = 3,
		fatigue_type = "blocked_sv_sweep",
		player_push_speed = 10,
		rotation_time = 1,
		hit_react_type = "medium",
		offset_up = 0,
		attack_anim = "attack_pounce",
		range = 3.2,
		bot_threat_duration = 1,
		action_weight = 1,
		player_push_speed_blocked = 8,
		width = 2.25,
		throw_dialogue_system_event_on_dodged_attack = true,
		considerations = UtilityConsiderations.storm_vermin_champion_special_attack,
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
				15,
				20,
				15
			},
			hard = {
				20,
				25,
				20
			},
			survival_hard = {
				20,
				35,
				30
			},
			harder = {
				30,
				45,
				30
			},
			survival_harder = {
				50,
				40,
				30
			},
			hardest = {
				40,
				50,
				40
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
	special_attack_spin = {
		height = 4,
		offset_forward = -4,
		radius = 4.25,
		collision_type = "cylinder",
		rotation_time = 0,
		hit_react_type = "heavy",
		collision_filter = "filter_player_and_enemy_hit_box_check",
		bot_threat_duration = 2.3333333333333335,
		shove_speed = 9,
		damage_type = "grenade",
		shove_z_speed = 6,
		offset_up = 0,
		offset_right = 0,
		player_push_speed = 20,
		fatigue_type = "blocked_slam",
		action_weight = 4,
		player_push_speed_blocked = 15,
		ignore_abort_on_blocked_attack = true,
		considerations = UtilityConsiderations.storm_vermin_champion_spin,
		attack_sequence = {
			{
				attack_anim = "attack_spin_charge"
			},
			{
				attack_anim = "attack_spin",
				at = 2
			}
		},
		blocked_damage = {
			0,
			0,
			0
		},
		blocked_difficulty_damage = {
			easy = {
				0,
				0,
				0
			},
			normal = {
				0,
				0,
				0
			},
			hard = {
				2,
				2,
				2
			},
			survival_hard = {
				2,
				2,
				2
			},
			harder = {
				5,
				5,
				5
			},
			survival_harder = {
				5,
				5,
				5
			},
			hardest = {
				10,
				10,
				10
			},
			survival_hardest = {
				10,
				10,
				10
			}
		},
		damage = {
			20,
			10,
			5
		},
		difficulty_damage = {
			easy = {
				15,
				10,
				5
			},
			normal = {
				20,
				10,
				5
			},
			hard = {
				25,
				15,
				10
			},
			survival_hard = {
				25,
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
		},
		hit_ai_func = function (unit, blackboard, hit_unit)
			local stat_name = "storm_vermin_warlord_kills_enemies"
			local current_difficulty = Managers.state.difficulty:get_difficulty()
			local allowed_difficulties = QuestSettings.allowed_difficulties[stat_name]
			local allowed_difficulty = allowed_difficulties[current_difficulty]

			if allowed_difficulty and not blackboard.kill_skaven_challenge_completed then
				local hit_unit_blackboard = BLACKBOARDS[hit_unit]
				local is_skaven = hit_unit_blackboard.breed.race == "skaven"
				local num_times_hit_skaven = blackboard.num_times_hit_skaven

				if is_skaven then
					blackboard.num_times_hit_skaven = num_times_hit_skaven + 1
				end

				if QuestSettings.storm_vermin_warlord_kills_enemies <= blackboard.num_times_hit_skaven then
					local statistics_db = Managers.player:statistics_db()

					statistics_db:increment_stat_and_sync_to_clients(stat_name)

					blackboard.kill_skaven_challenge_completed = true

					QuestSettings.send_completed_message(stat_name)
				end
			end
		end
	},
	defensive_mode_spin = {
		height = 4,
		offset_forward = -4,
		radius = 4.25,
		collision_type = "cylinder",
		rotation_time = 0,
		hit_react_type = "heavy",
		collision_filter = "filter_player_and_enemy_hit_box_check",
		bot_threat_duration = 2.6666666666666665,
		shove_speed = 9,
		damage_type = "grenade",
		shove_z_speed = 6,
		offset_up = 0,
		offset_right = 0,
		player_push_speed = 20,
		fatigue_type = "blocked_slam",
		action_weight = 4,
		player_push_speed_blocked = 15,
		ignore_abort_on_blocked_attack = true,
		considerations = UtilityConsiderations.storm_vermin_champion_defensive_spin,
		attack_sequence = {
			{
				attack_anim = "attack_spin_charge"
			},
			{
				attack_anim = "attack_spin",
				ready_function = function (unit, blackboard, t)
					local charge_t = t - blackboard.attack_sequence_start_time

					return (charge_t > 1.5 and blackboard.surrounding_players > 0) or charge_t > 2.5
				end
			}
		},
		blocked_damage = {
			0,
			0,
			0
		},
		blocked_difficulty_damage = {
			easy = {
				0,
				0,
				0
			},
			normal = {
				0,
				0,
				0
			},
			hard = {
				2,
				2,
				2
			},
			survival_hard = {
				2,
				2,
				2
			},
			harder = {
				5,
				5,
				5
			},
			survival_harder = {
				5,
				5,
				5
			},
			hardest = {
				10,
				10,
				10
			},
			survival_hardest = {
				10,
				10,
				10
			}
		},
		damage = {
			20,
			10,
			5
		},
		difficulty_damage = {
			easy = {
				15,
				10,
				5
			},
			normal = {
				20,
				10,
				5
			},
			hard = {
				25,
				15,
				10
			},
			survival_hard = {
				25,
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
			true,
			true,
			true,
			true,
			true
		},
		hit_ai_func = function (unit, blackboard, hit_unit)
			if not blackboard.kill_skaven_challenge_completed then
				local hit_unit_blackboard = BLACKBOARDS[hit_unit]
				local is_skaven = hit_unit_blackboard.breed.race == "skaven"
				local num_times_hit_skaven = blackboard.num_times_hit_skaven

				if is_skaven then
					blackboard.num_times_hit_skaven = num_times_hit_skaven + 1
				end

				if QuestSettings.storm_vermin_warlord_kills_enemies <= blackboard.num_times_hit_skaven then
					local stat_name = "storm_vermin_warlord_kills_enemies"
					local statistics_db = Managers.player:statistics_db()

					statistics_db:increment_stat_and_sync_to_clients(stat_name)

					blackboard.kill_skaven_challenge_completed = true

					QuestSettings.send_completed_message(stat_name)
				end
			end
		end
	},
	special_attack_sweep_left = {
		height = 2,
		hit_react_type = "medium",
		radius = 2.6,
		rotation_time = 0,
		fatigue_type = "blocked_sv_sweep",
		collision_filter = "filter_player_and_husk_trigger",
		offset_right = 0,
		mode = "radial_cylinder",
		direction = "counter_clockwise",
		overlap_end_time = 0.7575757575757576,
		offset_forward = -1.5,
		offset_up = 0,
		attack_anim = "attack_sweep_left",
		collision_type = "cylinder",
		bot_threat_duration = 1,
		damage_type = "cutting",
		overlap_start_time = 0.5151515151515151,
		player_push_speed = 14,
		player_push_speed_blocked = 12,
		throw_dialogue_system_event_on_dodged_attack = true,
		damage = {
			20,
			10,
			5
		},
		difficulty_damage = {
			easy = {
				15,
				10,
				5
			},
			normal = {
				15,
				10,
				5
			},
			hard = {
				25,
				15,
				10
			},
			survival_hard = {
				25,
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
		overlap_start_angle_offset = -math.pi,
		overlap_end_angle_offset = 0.5 * math.pi,
		ignore_staggers = {
			true,
			false,
			false,
			true,
			true,
			false
		}
	},
	special_attack_sweep_right = {
		height = 2,
		hit_react_type = "medium",
		radius = 2.6,
		rotation_time = 0,
		fatigue_type = "blocked_sv_sweep",
		collision_filter = "filter_player_and_husk_trigger",
		offset_right = 0,
		mode = "radial_cylinder",
		direction = "clockwise",
		overlap_end_time = 0.7333333333333333,
		offset_forward = -1.1,
		offset_up = 0,
		attack_anim = "attack_sweep_right",
		collision_type = "cylinder",
		bot_threat_duration = 0.8333333333333334,
		damage_type = "cutting",
		overlap_start_time = 0.36666666666666664,
		player_push_speed = 14,
		player_push_speed_blocked = 12,
		throw_dialogue_system_event_on_dodged_attack = true,
		damage = {
			20,
			10,
			5
		},
		difficulty_damage = {
			easy = {
				15,
				10,
				5
			},
			normal = {
				15,
				10,
				5
			},
			hard = {
				25,
				15,
				10
			},
			survival_hard = {
				25,
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
		overlap_start_angle_offset = -0.5 * math.pi,
		overlap_end_angle_offset = math.pi,
		ignore_staggers = {
			true,
			false,
			false,
			true,
			true,
			false
		}
	},
	dual_lunge_attack = {
		animation_driven = true,
		height = 2,
		overlap_end_time = 1.6333333333333333,
		fatigue_type = "blocked_attack",
		rotation_time = 1.5,
		hit_react_type = "medium",
		offset_forward = 0.15,
		mode = "continuous_overlap",
		player_push_speed = 12,
		damage_type = "cutting",
		offset_up = 0,
		range = 2.2,
		movement_controlled_rotation = false,
		overlap_start_time = 0.8333333333333334,
		action_weight = 5,
		player_push_speed_blocked = 12,
		width = 1,
		considerations = UtilityConsiderations.storm_vermin_champion_running_attack,
		attack_sequence = {
			{
				attack_anim = "attack_run_2"
			}
		},
		blocked_damage = {
			0,
			0,
			0
		},
		blocked_difficulty_damage = {
			easy = {
				0,
				0,
				0
			},
			normal = {
				0,
				0,
				0
			},
			hard = {
				2,
				2,
				2
			},
			survival_hard = {
				2,
				2,
				2
			},
			harder = {
				5,
				5,
				5
			},
			survival_harder = {
				5,
				5,
				5
			},
			hardest = {
				10,
				10,
				10
			},
			survival_hardest = {
				10,
				10,
				10
			}
		},
		damage = {
			20,
			10,
			5
		},
		difficulty_damage = {
			easy = {
				15,
				10,
				5
			},
			normal = {
				15,
				10,
				5
			},
			hard = {
				25,
				15,
				10
			},
			survival_hard = {
				25,
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
				40,
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
			true,
			true,
			true,
			true,
			false
		}
	},
	special_running_attack = {
		animation_driven = true,
		height = 2,
		fatigue_type = "blocked_attack",
		overlap_start_time = 0.5641025641025641,
		overlap_end_time = 1.0512820512820513,
		rotation_time = 1.2,
		hit_react_type = "medium",
		offset_forward = 0.8,
		mode = "continuous_overlap",
		player_push_speed = 16,
		damage_type = "cutting",
		offset_up = 0,
		range = 2,
		movement_controlled_rotation = false,
		action_weight = 5,
		player_push_speed_blocked = 12,
		width = 1,
		considerations = UtilityConsiderations.storm_vermin_champion_running_attack,
		attack_sequence = {
			{
				attack_anim = "charge_attack_step"
			},
			{
				attack_anim = "attack_run_2",
				at = 0.1282051282051282
			}
		},
		damage = {
			20,
			10,
			5
		},
		difficulty_damage = {
			easy = {
				15,
				10,
				5
			},
			normal = {
				20,
				10,
				5
			},
			hard = {
				25,
				15,
				10
			},
			survival_hard = {
				25,
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
			true,
			true,
			true,
			true,
			false
		}
	},
	special_lunge_attack = {
		animation_driven = true,
		offset_forward = 0.25,
		wall_collision_stun_time = 1.1666666666666667,
		damage_type = "cutting",
		hit_react_type = "medium",
		rotation_time = 1,
		fatigue_type = "blocked_slam",
		mode = "continuous_overlap",
		player_push_speed = 18,
		overlap_end_time = 2.3666666666666667,
		overlap_check_walls_range = 2,
		offset_up = 0,
		overlap_check_walls_time = 1.75,
		height = 2,
		range = 2,
		overlap_start_time = 1.1,
		wall_collision_anim = "charge_attack_lunge_miss",
		action_weight = 5,
		player_push_speed_blocked = 14,
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
		damage = {
			20,
			10,
			5
		},
		difficulty_damage = {
			easy = {
				15,
				10,
				5
			},
			normal = {
				20,
				10,
				5
			},
			hard = {
				25,
				15,
				10
			},
			survival_hard = {
				25,
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
			true,
			true,
			true,
			true,
			false
		}
	},
	smash_door = {
		unblockable = true,
		damage_type = "cutting",
		move_anim = "move_fwd",
		attack_anim = "attack_pounce",
		damage = {
			3,
			3,
			3
		}
	},
	stagger = {
		scale_animation_speeds = true,
		stagger_animation_scale = 3.5,
		custom_enter_function = function (unit, blackboard, t, action)
			assert(ScriptUnit.has_extension(unit, "ai_shield_system"), "skaven_storm_vermin_warlord dont have ai_shield_user_extension")

			local breed = blackboard.breed
			local blocked = blackboard.blocked
			local stagger = blackboard.stagger
			local stagger_type = blackboard.stagger_type
			local ai_shield_extension = ScriptUnit.extension(unit, "ai_shield_system")
			local shield_user = not ai_shield_extension.shield_broken
			local is_blocking = ai_shield_extension.is_blocking
			local is_dual_wield_mode = blackboard.dual_wield_mode
			local is_dodging = ai_shield_extension.is_dodging
			local stagger_anims = action.stagger_anims[stagger_type]
			local idle_event = nil
			local stagger_count = blackboard.stagger_count

			if stagger_type == 6 then
				idle_event = "idle"

				return stagger_anims, idle_event
			end

			blackboard.stagger_ignore_anim_cb = false

			if shield_user and stagger and is_dual_wield_mode then
				blackboard.stagger_avoid_timer = blackboard.stagger_avoid_timer or t + 3
				local avoid_timer = blackboard.stagger_avoid_timer
				local avoid_broken_timer = blackboard.stagger_avoid_broken_timer
				local avoid_attack = false

				if avoid_broken_timer and t < avoid_broken_timer then
					avoid_attack = false
				elseif avoid_broken_timer and avoid_broken_timer < t then
					blackboard.stagger_avoid_timer = t + 3
					blackboard.stagger_avoid_broken_timer = nil
					avoid_attack = true
				elseif avoid_timer and t < avoid_timer then
					avoid_attack = true
				elseif avoid_timer < t then
					if blackboard.stagger_count and blackboard.stagger_count >= 5 then
						blackboard.stagger_avoid_broken_timer = t + 3
					else
						blackboard.stagger_avoid_timer = t + 3
					end

					avoid_attack = false
				end

				if avoid_attack then
					local should_dodge_next_attack = false
					blackboard.stagger_time = blackboard.stagger_time + 0.35

					if should_dodge_next_attack then
						ai_shield_extension:set_is_dodging(true)
						ai_shield_extension:set_is_blocking(false)
					else
						ai_shield_extension:set_is_blocking(true)
						ai_shield_extension:set_is_dodging(false)
					end

					is_blocking = ai_shield_extension.is_blocking

					if is_blocking then
						stagger_anims = action.shield_block_anims[stagger_type]
					elseif is_dodging then
						stagger_anims = action.dodge_anims[stagger_type]
					end

					idle_event = "idle_guard_up"
				else
					blackboard.stagger_time = 0
					stagger_anims = action.stagger_anims[stagger_type]
					idle_event = "idle_guard_up"

					ai_shield_extension:set_is_dodging(false)
					ai_shield_extension:set_is_blocking(false)
				end

				blackboard.stagger_ignore_anim_cb = true
			else
				blackboard.stagger_time = 0
				stagger_anims = action.stagger_anims[stagger_type]
				idle_event = "idle_guard_down"

				ai_shield_extension:set_is_dodging(false)
				ai_shield_extension:set_is_blocking(false)
			end

			idle_event = "idle"

			return stagger_anims, idle_event
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
			}
		},
		shield_block_anims = {
			{
				fwd = {
					"stagger_bwd_block_short"
				},
				bwd = {
					"stagger_bwd_block_short"
				},
				left = {
					"stagger_left_block"
				},
				right = {
					"stagger_right_block"
				},
				dwn = {
					"stagger_bwd_block_short"
				}
			},
			{
				fwd = {
					"stagger_bwd_block"
				},
				bwd = {
					"stagger_bwd_block"
				},
				left = {
					"stagger_left_block"
				},
				right = {
					"stagger_right_block"
				},
				dwn = {
					"stagger_bwd_block"
				}
			},
			{
				fwd = {
					"stagger_bwd_block"
				},
				bwd = {
					"stagger_bwd_block"
				},
				left = {
					"stagger_left_block"
				},
				right = {
					"stagger_right_block"
				},
				dwn = {
					"stagger_bwd_block"
				}
			},
			{
				fwd = {
					"stagger_bwd_block"
				},
				bwd = {
					"stagger_bwd_block"
				},
				left = {
					"stagger_left_block"
				},
				right = {
					"stagger_right_block"
				},
				dwn = {
					"stagger_bwd_block"
				}
			},
			{
				fwd = {
					"stagger_bwd_block"
				},
				bwd = {
					"stagger_bwd_block"
				},
				left = {
					"stagger_left_block"
				},
				right = {
					"stagger_right_block"
				},
				dwn = {
					"stagger_bwd_block"
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
				},
				dwn = {
					"stagger_bwd_exp"
				}
			},
			{
				fwd = {
					"stagger_bwd_block"
				},
				bwd = {
					"stagger_bwd_block"
				},
				left = {
					"stagger_left_block"
				},
				right = {
					"stagger_right_block"
				},
				dwn = {
					"stagger_bwd_block"
				}
			}
		},
		dodge_anims = {
			{
				fwd = {
					"stagger_bwd_dodge"
				},
				bwd = {
					"stagger_bwd_dodge"
				},
				left = {
					"stagger_left_dodge"
				},
				right = {
					"stagger_right_dodge"
				},
				dwn = {
					"stagger_bwd_dodge"
				}
			},
			{
				fwd = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				},
				bwd = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				},
				left = {
					"stagger_bwd_dodge",
					"stagger_left_dodge"
				},
				right = {
					"stagger_bwd_dodge",
					"stagger_right_dodge"
				},
				dwn = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				}
			},
			{
				fwd = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				},
				bwd = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				},
				left = {
					"stagger_bwd_dodge",
					"stagger_left_dodge"
				},
				right = {
					"stagger_bwd_dodge",
					"stagger_right_dodge"
				},
				dwn = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				}
			},
			{
				fwd = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				},
				bwd = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				},
				left = {
					"stagger_bwd_dodge",
					"stagger_left_dodge"
				},
				right = {
					"stagger_bwd_dodge",
					"stagger_right_dodge"
				},
				dwn = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				}
			},
			{
				fwd = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				},
				bwd = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				},
				left = {
					"stagger_bwd_dodge",
					"stagger_left_dodge"
				},
				right = {
					"stagger_bwd_dodge",
					"stagger_right_dodge"
				},
				dwn = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				}
			},
			{
				fwd = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				},
				bwd = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				},
				left = {
					"stagger_bwd_dodge",
					"stagger_left_dodge"
				},
				right = {
					"stagger_bwd_dodge",
					"stagger_right_dodge"
				},
				dwn = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				}
			},
			{
				fwd = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				},
				bwd = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				},
				left = {
					"stagger_bwd_dodge",
					"stagger_left_dodge"
				},
				right = {
					"stagger_bwd_dodge",
					"stagger_right_dodge"
				},
				dwn = {
					"stagger_bwd_dodge",
					"stagger_left_dodge",
					"stagger_right_dodge"
				}
			}
		},
		shield_stagger_anims = {
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
					"stun_down"
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
				},
				dwn = {
					"stun_ranged_bwd"
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
				},
				dwn = {
					"stun_ranged_bwd"
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
				},
				dwn = {
					"stagger_bwd_exp"
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
				},
				dwn = {
					"stun_bwd_sword"
				}
			}
		}
	},
	spawn_sequence = {
		action_weight = 20,
		considerations = UtilityConsiderations.storm_vermin_champion_spawn
	},
	turn_to_face_target = {
		rage_time = 0.6,
		action_weight = 20,
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
	},
	spawn_allies = {
		stinger_name = "enemy_horde_stinger",
		find_spawn_points = true,
		defensive_mode_duration = 10,
		spawn_group = "warlord_spawners",
		animation = "call_allies",
		run_to_spawn_speed = 7,
		move_anim = "move_fwd",
		duration = 3,
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
				"skaven_clan_rat_with_shield",
				"skaven_clan_rat_with_shield"
			},
			hard = {
				"skaven_storm_vermin",
				"skaven_storm_vermin"
			},
			survival_hard = {
				"skaven_storm_vermin",
				"skaven_storm_vermin"
			},
			harder = {
				"skaven_storm_vermin",
				"skaven_storm_vermin",
				"skaven_storm_vermin"
			},
			survival_harder = {
				"skaven_storm_vermin",
				"skaven_storm_vermin"
			},
			hardest = {
				"skaven_storm_vermin",
				"skaven_storm_vermin",
				"skaven_storm_vermin",
				"skaven_storm_vermin"
			},
			survival_hardest = {
				"skaven_storm_vermin",
				"skaven_storm_vermin",
				"skaven_storm_vermin",
				"skaven_storm_vermin",
				"skaven_storm_vermin",
				"skaven_storm_vermin"
			}
		},
		difficulty_spawn = {
			harder = "stronghold_boss_event_defensive_harder",
			normal = "stronghold_boss_event_defensive_normal",
			hard = "stronghold_boss_event_defensive_hard",
			survival_hard = "stronghold_boss_event_defensive_hard",
			survival_harder = "stronghold_boss_event_defensive_hard",
			hardest = "stronghold_boss_event_defensive_hardest",
			survival_hardest = "stronghold_boss_event_defensive_hard",
			easy = "stronghold_boss_event_defensive_easy"
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
		},
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true
		}
	},
	defensive_idle = {
		action_weight = 1,
		idle_animation = "defensive_idle",
		force_idle_animation = false,
		considerations = UtilityConsiderations.chaos_exalted_defensive_idle
	},
	intro_idle = {
		action_weight = 0.5,
		force_idle_animation = false,
		idle_animation = {
			"defensive_idle"
		}
	},
	jump_to_position = {
		jump_animation = "intro_jump_down",
		horizontal_length = 15,
		action_weight = 1,
		land_animation = "intro_jump_down_land"
	},
	dual_combo_attack2 = {
		stagger_distance = 2,
		hit_react_type = "medium",
		unblockable = false,
		player_push_speed_blocked = 6,
		player_push_speed = 10,
		fatigue_type = "blocked_sv_sweep",
		action_weight = 4,
		is_combo_attack = true,
		damage_type = "cutting",
		considerations = UtilityConsiderations.storm_vermin_warlord_dual_combo_attack,
		init_blackboard = {
			time_since_last_combo = math.huge
		},
		attacks = {
			{
				next_combo_index = 2,
				height = 2.5,
				anim_driven = true,
				rotation_speed = 10,
				offset_forward = 0,
				rotation_time = 4,
				offset_up = 0,
				range = 2.5,
				player_push_speed = 10,
				hit_multiple_targets = false,
				player_push_speed_blocked = 8,
				push_close_units_during_attack = true,
				attack_time = 3,
				width = 1.2,
				attack_anim = {
					"attack_combo_1"
				},
				staggers_allowed = WARLORD_ALLOWED_STAGGERS,
				push_units_in_the_way = pushed_data
			},
			{
				next_combo_index = 3,
				height = 1.75,
				anim_driven = true,
				rotation_speed = 10,
				offset_forward = 0.5,
				rotation_time = 3,
				offset_up = 1,
				range = 2.5,
				player_push_speed = 10,
				hit_multiple_targets = false,
				player_push_speed_blocked = 8,
				push_close_units_during_attack = true,
				attack_time = 3,
				width = 2,
				attack_anim = {
					"attack_combo_2"
				},
				staggers_allowed = WARLORD_ALLOWED_STAGGERS,
				push_units_in_the_way = pushed_data
			},
			{
				rotation_speed = 20,
				offset_forward = 0,
				anim_driven = true,
				height = 2.2,
				rotation_time = 1.5,
				offset_up = 0,
				range = 2.5,
				player_push_speed = 10,
				damage_done_time = 0.5333333333333333,
				hit_multiple_targets = false,
				player_push_speed_blocked = 8,
				push_close_units_during_attack = true,
				attack_time = 3,
				width = 1.2,
				attack_anim = {
					"attack_combo_3"
				},
				staggers_allowed = WARLORD_ALLOWED_STAGGERS,
				push_units_in_the_way = pushed_data
			}
		},
		damage = {
			20,
			25,
			20
		},
		difficulty_damage = {
			easy = {
				15,
				20,
				15
			},
			normal = {
				10,
				15,
				20
			},
			hard = {
				20,
				25,
				20
			},
			survival_hard = {
				25,
				35,
				30
			},
			harder = {
				25,
				30,
				25
			},
			survival_harder = {
				35,
				40,
				30
			},
			hardest = {
				35,
				40,
				35
			},
			survival_hardest = {
				50,
				75,
				45
			}
		},
		stagger_impact = {
			1,
			2,
			0,
			0
		}
	}
}
BreedActions.skaven_storm_vermin_warlord = table.create_copy(BreedActions.skaven_storm_vermin_warlord, action_data)

return

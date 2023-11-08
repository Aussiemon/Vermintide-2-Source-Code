local stagger_types = require("scripts/utils/stagger_types")
local pushed_data = {
	ahead_dist = 1.5,
	push_width = 1.25,
	push_forward_offset = 1.5,
	push_stagger_distance = 1,
	player_pushed_speed = 4,
	push_stagger_impact = {
		stagger_types.medium,
		stagger_types.medium,
		stagger_types.none,
		stagger_types.none
	},
	push_stagger_duration = {
		1.5,
		1,
		0,
		0
	}
}
local breed_data = {
	is_bot_threat = true,
	is_bot_aid_threat = true,
	walk_speed = 2,
	player_locomotion_constrain_radius = 1.2,
	aoe_height = 1.7,
	sync_full_rotation = false,
	line_of_sight_distance_sq = 400,
	race = "chaos",
	disable_crowd_dispersion = true,
	death_reaction = "ai_default",
	ai_strength = 10,
	animation_sync_rpc = "rpc_sync_anim_state_7",
	aoe_radius = 0.4,
	aim_template = "chaos_warrior",
	run_speed = 6.109090909090908,
	target_selection = "pick_rat_ogre_target_with_weights",
	proximity_system_check = true,
	behavior = "chaos_exalted_champion_warcamp",
	slot_template = "chaos_large_elite",
	bot_opportunity_target_melee_range = 7,
	bots_should_flank = true,
	default_inventory_template = "exalted_axe",
	bot_hitbox_radius_approximation = 0.8,
	dialogue_source_name = "chaos_exalted_champion_warcamp",
	death_sound_event = "Play_enemy_vce_chaos_warrior_die",
	boss_staggers = true,
	primary_armor_category = 6,
	headshot_coop_stamina_fatigue_type = "headshot_special",
	radius = 1,
	use_slot_type = "large",
	boss = true,
	hit_mass_count = 20,
	threat_value = 12,
	use_avoidance = false,
	disable_second_hit_ragdoll = true,
	poison_resistance = 100,
	armor_category = 2,
	smart_object_template = "chaos_warrior",
	angry_run_speed = 6,
	ai_toughness = 10,
	use_big_boy_turning = false,
	use_navigation_path_splines = true,
	smart_targeting_width = 0.2,
	perception_continuous = "perception_continuous_rat_ogre",
	initial_is_passive = false,
	bone_lod_level = 0,
	server_controlled_health_bar = true,
	boost_curve_multiplier_override = 1.5,
	bot_melee_aim_node = "j_spine1",
	has_inventory = true,
	no_stagger_duration = true,
	awards_positive_reinforcement_message = true,
	exchange_order = 2,
	combat_music_state = "champion_chaos_exalted_warcamp",
	hit_reaction = "ai_default",
	passive_in_patrol = false,
	armored_boss_damage_reduction = true,
	smart_targeting_outer_width = 1,
	hit_effect_template = "HitEffectsChaosExaltedChampion",
	smart_targeting_height_multiplier = 3,
	unit_template = "ai_unit_chaos_exalted_champion",
	leave_walk_distance = 2.5,
	perception = "perception_rat_ogre",
	minion_detection_radius = 20,
	bot_opportunity_target_melee_range_while_ranged = 5,
	weapon_reach = 2.2,
	far_off_despawn_immunity = true,
	trigger_dialogue_on_target_switch = true,
	base_unit = "units/beings/enemies/chaos_warrior_boss/chr_chaos_warrior_boss",
	enter_walk_distance = 1,
	bots_flank_while_targeted = false,
	displace_players_data = pushed_data,
	infighting = InfightingSettings.boss,
	detection_radius = math.huge,
	perception_weights = {
		target_catapulted_mul = 0.25,
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
		target_stickyness_duration_a = 15,
		target_disabled_mul = 0,
		aggro_multipliers = {
			melee = 1,
			ranged = 5,
			grenade = 2
		}
	},
	size_variation_range = {
		1.2,
		1.2
	},
	max_health = BreedTweaks.max_health.exalted_champion,
	bloodlust_health = BreedTweaks.bloodlust_health.monster,
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
	run_on_spawn = AiBreedSnippets.on_chaos_exalted_champion_spawn,
	run_on_update = AiBreedSnippets.on_chaos_exalted_champion_update,
	run_on_despawn = AiBreedSnippets.on_chaos_exalted_champion_despawn,
	run_on_death = AiBreedSnippets.on_chaos_exalted_champion_death,
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
		torso = {
			prio = 2,
			actors = {
				"c_spine",
				"c_hips",
				"c_cloak_01",
				"c_cloak_02",
				"c_cloak_03"
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
		c_spine = "j_spine1",
		c_head = "j_head",
		c_leftforearm = "j_leftforearm",
		c_rightfoot = "j_rightfoot",
		c_lefthand = "j_lefthand",
		c_rightleg = "j_rightleg",
		c_leftfoot = "j_leftfoot",
		c_neck = "j_neck",
		c_leftleg = "j_leftleg",
		c_leftupleg = "j_leftupleg",
		c_rightarm = "j_rightarm",
		c_rightupleg = "j_rightupleg",
		c_leftarm = "j_leftarm",
		c_rightforearm = "j_rightforearm",
		c_hips = "j_hips",
		c_righthand = "j_righthand"
	},
	ragdoll_actor_thickness = {
		j_rightfoot = 0.2,
		j_spine1 = 0.3,
		j_leftarm = 0.2,
		j_leftforearm = 0.2,
		j_leftleg = 0.2,
		j_leftshoulder = 0.3,
		j_righthand = 0.2,
		j_leftupleg = 0.2,
		j_rightshoulder = 0.3,
		j_rightarm = 0.2,
		j_hips = 0.3,
		j_rightleg = 0.2,
		j_leftfoot = 0.2,
		j_rightupleg = 0.2,
		j_head = 0.3,
		j_neck = 0.3,
		j_lefthand = 0.2,
		j_rightforearm = 0.2
	},
	allowed_layers = {
		end_zone = 0,
		ledges = 1.5,
		barrel_explosion = 10,
		jumps = 1.5,
		bot_ratling_gun_fire = 3,
		temporary_wall = 1,
		planks = 1.5,
		big_boy_destructible = 0,
		destructible_wall = 0,
		ledges_with_fence = 1.5,
		doors = 1.5,
		teleporters = 5,
		bot_poison_wind = 1.5,
		fire_grenade = 10
	},
	stagger_modifier_function = function (stagger_type, duration, length, hit_zone_name, blackboard, breed, direction)
		local t = Managers.time:time("game")

		if blackboard.stagger_immune_time and t < blackboard.stagger_immune_time then
			stagger_type = stagger_types.none
			duration = 0
			length = 0
		end

		return stagger_type, duration, length
	end,
	difficulty_kill_achievements = {
		"kill_chaos_exalted_champion_difficulty_rank",
		"kill_chaos_exalted_champion_scorpion_hardest"
	},
	custom_death_enter_function = function (unit, killer_unit, damage_type, death_hit_zone, t, damage_source)
		if not Unit.alive(killer_unit) then
			return
		end

		QuestSettings.check_killed_lord_as_last_player_standing(killer_unit)
	end
}
Breeds.chaos_exalted_champion_warcamp = table.create_copy(Breeds.chaos_exalted_champion_warcamp, breed_data)
local breed_data_norsca = {
	death_sound_event = "Play_enemy_vce_chaos_warrior_die",
	attack_player_sound_event = "Play_breed_triggered_sound",
	server_controlled_health_bar = false,
	behavior = "chaos_exalted_champion_norsca",
	trigger_dialogue_on_target_switch = true,
	attack_general_sound_event = "Play_breed_triggered_sound",
	default_inventory_template = "exalted_spawn_axe",
	dialogue_source_name = "chaos_warrior",
	combat_music_state = "champion_chaos_exalted_norsca",
	run_on_spawn = AiBreedSnippets.on_chaos_exalted_champion_norsca_spawn,
	run_on_update = AiBreedSnippets.on_chaos_exalted_champion_norsca_update,
	run_on_death = AiBreedSnippets.on_chaos_exalted_champion_norsca_death,
	run_on_despawn = AiBreedSnippets.on_chaos_exalted_champion_despawn,
	max_health = BreedTweaks.max_health.norsca_champion
}

for key, value in pairs(breed_data) do
	local keep_value = breed_data_norsca[key]

	if keep_value == "SET_TO_NIL" then
		breed_data_norsca[key] = nil
	elseif keep_value ~= nil then
		breed_data_norsca[key] = keep_value
	else
		breed_data_norsca[key] = value
	end
end

Breeds.chaos_exalted_champion_norsca = table.create_copy(Breeds.chaos_exalted_champion_norsca, breed_data_norsca)
local action_data = {
	follow = {
		move_anim = "move_fwd",
		slow_approach_time = 2,
		action_weight = 1,
		considerations = UtilityConsiderations.chaos_exalted_follow,
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
		}
	},
	throw_weapon = {
		catapult_players = true,
		radius = 1.25,
		catch_animation = "catch_weapon",
		throw_speed = 25,
		return_speed = 45,
		rotation_time = 2,
		hit_react_type = "heavy",
		close_attack_damage = 10,
		fatigue_type = "blocked_sv_cleave",
		arrival_linger_time = 0.25,
		throw_animation = "throw_weapon",
		damage_type = "cutting",
		stop_sound_id = "Stop_enemy_champion_axe",
		impact_sound_id = "Play_enemy_champion_axe_impact",
		damage = 20,
		pull_sound_id = "Play_enemy_champion_pull_axe",
		target_dodged_radius = 0.25,
		use_close_attack = false,
		push_speed_z = 6,
		action_weight = 4,
		rotation_speed = 20,
		throw_unit_name = "units/weapons/enemy/wpn_chaos_set/wpn_chaos_2h_axe_03",
		hit_targets_on_return = false,
		running_sound_id = "Play_enemy_champion_throw_axe",
		push_speed = 10,
		considerations = UtilityConsiderations.chaos_exalted_champion_throw_attack,
		difficulty_damage = {
			harder = 25,
			hard = 16,
			normal = 8,
			hardest = 30,
			cataclysm = 40,
			cataclysm_3 = 75,
			cataclysm_2 = 50,
			easy = 8
		}
	},
	intro_idle = {
		force_idle_animation = false,
		action_weight = 0.5,
		considerations = UtilityConsiderations.chaos_exalted_defensive_idle,
		idle_animation = {
			"idle_defence"
		}
	},
	defensive_idle = {
		force_idle_animation = false,
		action_weight = 0.5,
		considerations = UtilityConsiderations.chaos_exalted_defensive_idle,
		idle_animation = {
			"idle_2"
		}
	},
	spawn_sequence = {
		action_weight = 20,
		considerations = UtilityConsiderations.storm_vermin_champion_spawn
	},
	angry_charge_sequence = {
		action_weight = 20,
		considerations = UtilityConsiderations.chaos_exalted_angry_charge_sequence
	},
	intro_sequence = {
		action_weight = 20
	},
	spawn_allies = {
		has_ward = false,
		run_to_spawn_speed = 7,
		stay_still = false,
		stinger_name = "enemy_horde_chaos_stinger",
		move_anim = "move_fwd",
		spawn_group = "warcamp_boss_minions",
		terror_event_id = "warcamp_boss_minions",
		duration = 2,
		find_spawn_points = true,
		spawn = "warcamp_boss_event_defensive_hard",
		defensive_mode_duration = {
			30,
			30,
			30,
			25,
			20,
			12,
			12,
			12
		},
		animation = {
			"idle_defence_2"
		},
		difficulty_spawn = {
			harder = "warcamp_boss_event_defensive",
			hard = "warcamp_boss_event_defensive",
			normal = "warcamp_boss_event_defensive",
			hardest = "warcamp_boss_event_defensive",
			cataclysm = "warcamp_boss_event_defensive",
			cataclysm_3 = "warcamp_boss_event_defensive",
			cataclysm_2 = "warcamp_boss_event_defensive",
			easy = "warcamp_boss_event_defensive"
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
			true,
			true,
			true
		}
	},
	special_attack_cleave = {
		height = 2,
		offset_forward = 0,
		fatigue_type = "blocked_sv_cleave",
		offset_up = 0,
		rotation_time = 2.6,
		hit_react_type = "heavy",
		catapult = true,
		shove_z_speed = 5,
		no_block_stagger = true,
		bot_threat_duration = 1.1666666666666667,
		damage_type = "cutting",
		bot_threat_start_time = 1,
		range = 3.8,
		damage = 15,
		knocked_down_attack_threshold = 0.6,
		reset_attack_animation_speed = 2.5,
		action_weight = 1,
		shove_speed = 9,
		bot_threat_start_time_step = 0.8333333333333334,
		width = 1.25,
		considerations = UtilityConsiderations.chaos_exalted_cleave_attack,
		attack_anim = {
			"attack_cleave_01",
			"attack_cleave_02"
		},
		step_attack_anim = {
			"attack_cleave_moving_01"
		},
		knocked_down_attack_anim = {
			"attack_downed"
		},
		difficulty_damage = {
			harder = 30,
			hard = 20,
			normal = 15,
			hardest = 50,
			cataclysm = 75,
			cataclysm_3 = 100,
			cataclysm_2 = 100,
			easy = 10
		},
		ignore_staggers = {
			{
				delay = 0.1,
				type = "reset_attack"
			},
			{
				delay = 0.15,
				type = "reset_attack"
			},
			{
				delay = 0.2,
				type = "reset_attack"
			},
			{
				delay = 0.1,
				type = "reset_attack"
			},
			{
				delay = 0.1,
				type = "reset_attack"
			},
			false
		},
		reset_attack_animations = {
			"attack_special_reset"
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_elite
	},
	special_attack_sweep = {
		knocked_down_attack_threshold = 0.6,
		height = 1,
		fatigue_type = "blocked_sv_cleave",
		push = true,
		range = 4,
		rotation_time = 0.8,
		hit_react_type = "medium",
		offset_forward = 0,
		blocked_anim = "blocked",
		step_attack_target_speed_away = 1,
		damage_type = "cutting",
		offset_up = 0,
		step_attack_target_speed_away_override = 2,
		damage = 15,
		player_push_speed = 10,
		reset_attack_animation_speed = 1.2,
		action_weight = 1,
		step_attack_distance = 3.75,
		player_push_speed_blocked = 7.5,
		step_attack_distance_override = 4,
		width = 2.2,
		considerations = UtilityConsiderations.chaos_exalted_swing_attack,
		attack_anim = {
			"attack_sweep_01",
			"attack_sweep_02",
			"attack_sweep_03"
		},
		step_attack_anim = {
			"attack_sweep_run_01",
			"attack_run"
		},
		knocked_down_attack_anim = {
			"attack_downed"
		},
		difficulty_damage = {
			harder = 25,
			hard = 15,
			normal = 10,
			hardest = 40,
			cataclysm = 50,
			cataclysm_3 = 100,
			cataclysm_2 = 75,
			easy = 5
		},
		ignore_staggers = {
			false,
			false,
			false,
			true,
			true,
			false
		},
		reset_attack_animations = {
			"attack_right_reset"
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_elite
	},
	special_attack_aoe = {
		offset_forward = -4,
		height = 4,
		radius = 4.5,
		collision_type = "cylinder",
		rotation_time = 0,
		fatigue_type = "blocked_slam",
		shove_z_speed = 7,
		bot_threat_duration = 0.75,
		damage_type = "cutting",
		offset_up = -0.6,
		attack_anim = "attack_pushback_swing",
		offset_right = 0,
		damage = 20,
		player_push_speed = 20,
		action_weight = 4,
		shove_speed = 10,
		player_push_speed_blocked = 15,
		ignore_abort_on_blocked_attack = true,
		considerations = UtilityConsiderations.chaos_exalted_aoe,
		difficulty_damage = {
			harder = 25,
			hard = 15,
			normal = 10,
			hardest = 30,
			cataclysm = 40,
			cataclysm_3 = 75,
			cataclysm_2 = 50,
			easy = 5
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
	special_attack_aoe_defensive = {
		offset_forward = -4,
		height = 4,
		radius = 4.5,
		collision_type = "cylinder",
		rotation_time = 0,
		fatigue_type = "blocked_slam",
		shove_z_speed = 7,
		bot_threat_duration = 0.75,
		damage_type = "cutting",
		offset_up = -0.5,
		attack_anim = "attack_pushback_swing",
		offset_right = 0,
		damage = 20,
		player_push_speed = 20,
		action_weight = 4,
		shove_speed = 10,
		player_push_speed_blocked = 15,
		ignore_abort_on_blocked_attack = true,
		considerations = UtilityConsiderations.chaos_exalted_defensive_aoe,
		difficulty_damage = {
			harder = 25,
			hard = 15,
			normal = 10,
			hardest = 30,
			cataclysm = 40,
			cataclysm_3 = 75,
			cataclysm_2 = 50,
			easy = 15
		},
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true,
			true,
			true
		}
	},
	special_attack_retaliation_aoe = {
		offset_forward = -4,
		height = 4,
		radius = 4.5,
		collision_type = "cylinder",
		rotation_time = 0,
		fatigue_type = "blocked_slam",
		shove_z_speed = 7,
		bot_threat_duration = 0.75,
		damage_type = "cutting",
		offset_up = -0.5,
		attack_anim = "attack_pushback_swing",
		offset_right = 0,
		damage = 20,
		player_push_speed = 20,
		action_weight = 4,
		shove_speed = 10,
		player_push_speed_blocked = 15,
		ignore_abort_on_blocked_attack = true,
		difficulty_damage = {
			harder = 25,
			hard = 15,
			normal = 10,
			hardest = 30,
			cataclysm = 40,
			cataclysm_3 = 75,
			cataclysm_2 = 50,
			easy = 5
		},
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true,
			true,
			true
		}
	},
	special_attack_launch = {
		offset_up = 0,
		offset_forward = 0,
		height = 1,
		fatigue_type = "blocked_sv_cleave",
		rotation_time = 0.5,
		hit_react_type = "heavy",
		catapult = true,
		shove_z_speed = 7,
		no_block_stagger = true,
		reset_stagger_count = true,
		damage_type = "cutting",
		attack_anim = "attack_pounce",
		range = 4,
		damage = 5,
		knocked_down_attack_threshold = 0.6,
		reset_attack_animation_speed = 1.3,
		action_weight = 1.2,
		shove_speed = 8.5,
		width = 1.75,
		considerations = UtilityConsiderations.chaos_exalted_launch_attack,
		knocked_down_attack_anim = {
			"attack_downed"
		},
		difficulty_damage = {
			harder = 15,
			hard = 10,
			normal = 7,
			hardest = 20,
			cataclysm = 30,
			cataclysm_3 = 50,
			cataclysm_2 = 40,
			easy = 5
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
	special_attack_kick = {
		offset_up = 0,
		offset_forward = 0,
		height = 1,
		fatigue_type = "blocked_sv_cleave",
		rotation_time = 0.5,
		hit_react_type = "heavy",
		catapult = true,
		shove_z_speed = 5,
		no_block_stagger = true,
		reset_stagger_count = true,
		damage_type = "cutting",
		attack_anim = "attack_push_2",
		range = 4,
		damage = 5,
		knocked_down_attack_threshold = 0.6,
		reset_attack_animation_speed = 1.3,
		action_weight = 1.35,
		shove_speed = 8.5,
		width = 1.75,
		considerations = UtilityConsiderations.chaos_exalted_kick_attack,
		knocked_down_attack_anim = {
			"attack_downed"
		},
		difficulty_damage = {
			harder = 15,
			hard = 10,
			normal = 7,
			hardest = 20,
			cataclysm = 30,
			cataclysm_3 = 50,
			cataclysm_2 = 40,
			easy = 5
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
	special_attack_launch_defensive = {
		offset_up = 0,
		offset_forward = 0,
		height = 1,
		fatigue_type = "blocked_sv_cleave",
		rotation_time = 0.5,
		hit_react_type = "heavy",
		catapult = true,
		shove_z_speed = 7,
		no_block_stagger = true,
		reset_stagger_count = true,
		damage_type = "cutting",
		attack_anim = "attack_pounce",
		range = 4,
		damage = 5,
		knocked_down_attack_threshold = 0.6,
		reset_attack_animation_speed = 1.3,
		action_weight = 1.2,
		shove_speed = 9,
		width = 2.1,
		considerations = UtilityConsiderations.chaos_exalted_launch_attack_defensive,
		knocked_down_attack_anim = {
			"attack_downed"
		},
		difficulty_damage = {
			harder = 15,
			hard = 10,
			normal = 7,
			hardest = 20,
			cataclysm = 30,
			cataclysm_3 = 50,
			cataclysm_2 = 40,
			easy = 5
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
	transform = {
		transfer_health_percentage = true,
		wanted_breed_transform = "chaos_spawn_exalted_champion_norsca",
		transform_animation = "death_spawn"
	},
	charge = {
		damage_type = "cutting",
		damage = 20,
		allow_friendly_fire = true,
		fatigue_type = "blocked_slam",
		action_weight = 3,
		ignore_ai_damage = true,
		considerations = UtilityConsiderations.chaos_exalted_champion_lunge_attack,
		attacks = {
			{
				anim_driven = true,
				height = 2.3,
				ignore_targets_behind = true,
				catapult_player = true,
				rotation_time = 0.5,
				freeze_intensity_decay_time = 15,
				ignores_dodging = false,
				offset_forward = 0.25,
				stop_on_target_impact = true,
				player_push_speed_blocked_z = 6,
				offset_up = 0,
				player_push_speed_z = 8,
				hit_only_players = false,
				range = 2,
				enable_nav_extension = true,
				player_push_speed = 16,
				hit_multiple_targets = true,
				player_push_speed_blocked = 9.6,
				attack_time = 3,
				width = 1,
				attack_anim = {
					"charge_attack_step"
				},
				continious_overlap = {
					charge_attack_step = {
						base_node_name = "root_point",
						tip_node_name = "root_point",
						start_time = 0.8
					}
				},
				push_ai = {
					stagger_distance = 3,
					stagger_impact = {
						stagger_types.explosion,
						stagger_types.explosion,
						stagger_types.none,
						stagger_types.none,
						stagger_types.explosion
					},
					stagger_duration = {
						4.5,
						1,
						0,
						0,
						4
					}
				},
				wall_collision = {
					stun_time = 0.75,
					check_range = 3,
					start_check_time = 1,
					animation = "charge_attack_miss"
				},
				bot_threats = {
					{
						offset_right = 0,
						range = 15,
						height = 2,
						radius = 4.5,
						offset_forward = 1,
						collision_type = "oobb",
						duration = 1.5,
						start_time = 0.3,
						offset_up = 0
					}
				},
				hit_ai_func = function (unit, blackboard, hit_unit, action, attack)
					local stat_names = {
						"exalted_champion_charge_chaos_warrior",
						"exalted_champion_charge_chaos_warrior_cata"
					}

					for i = 1, #stat_names do
						local current_difficulty = Managers.state.difficulty:get_difficulty()
						local allowed_difficulties = QuestSettings.allowed_difficulties[stat_names[i]]
						local allowed_difficulty = allowed_difficulties[current_difficulty]

						if allowed_difficulty and not blackboard.hit_warrior_challenge_completed then
							local hit_unit_blackboard = BLACKBOARDS[hit_unit]
							local is_chaos_warrior = hit_unit_blackboard.breed.name == "chaos_warrior"
							local num_times_hit_chaos_warrior = blackboard.num_times_hit_chaos_warrior

							if is_chaos_warrior then
								blackboard.num_times_hit_chaos_warrior = num_times_hit_chaos_warrior + 1
							end

							if QuestSettings.exalted_champion_charge_chaos_warrior <= blackboard.num_times_hit_chaos_warrior then
								local statistics_db = Managers.player:statistics_db()

								statistics_db:increment_stat_and_sync_to_clients(stat_names[i])

								blackboard.hit_warrior_challenge_completed = true
							end
						end
					end
				end
			}
		},
		difficulty_damage = {
			harder = 25,
			hard = 15,
			normal = 10,
			hardest = 30,
			cataclysm = 40,
			cataclysm_3 = 75,
			cataclysm_2 = 50,
			easy = 15
		},
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			false,
			true,
			true
		}
	},
	smash_door = {
		unblockable = true,
		damage = 3,
		damage_type = "cutting",
		move_anim = "move_fwd",
		attack_anim = "attack_pounce"
	},
	stagger = {
		custom_enter_function = function (unit, blackboard, t, action)
			local stagger_anims = blackboard.action.stagger_anims[blackboard.stagger_type]

			if blackboard.stagger_type == stagger_types.explosion then
				if blackboard.chain_stagger_resistant_t and blackboard.chain_stagger_resistant_t < t then
					blackboard.chain_stagger_resistant_t = nil
					blackboard.num_chain_stagger = nil
				end

				local num_chain_stagger = blackboard.num_chain_stagger or 0
				blackboard.num_chain_stagger = num_chain_stagger + 1

				if not blackboard.chain_stagger_resistant_t and blackboard.num_chain_stagger > 1 and blackboard.stagger_type == stagger_types.explosion then
					blackboard.chain_stagger_resistant_t = t + 8
				end

				if blackboard.chain_stagger_resistant_t and t < blackboard.chain_stagger_resistant_t then
					stagger_anims = blackboard.action.stagger_anims[stagger_types.heavy]
					blackboard.stagger_time = t + 2
				end
			end

			return stagger_anims, "idle"
		end,
		stagger_anims = {
			{
				fwd = {
					"hit_react_fwd"
				},
				bwd = {
					"hit_react_bwd"
				},
				left = {
					"hit_react_left"
				},
				right = {
					"hit_react_right"
				},
				dwn = {
					"hit_react_overhead"
				}
			},
			{
				fwd = {
					"stagger_light_fwd"
				},
				bwd = {
					"stagger_light_bwd"
				},
				left = {
					"stagger_light_left"
				},
				right = {
					"stagger_light_right"
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
					"hit_react_fwd"
				},
				bwd = {
					"hit_react_bwd"
				},
				left = {
					"hit_react_left"
				},
				right = {
					"hit_react_right"
				}
			},
			{
				fwd = {
					"hit_react_fwd"
				},
				bwd = {
					"hit_react_bwd"
				},
				left = {
					"hit_react_left"
				},
				right = {
					"hit_react_right"
				}
			},
			{
				fwd = {
					"stagger_fwd_downed"
				},
				bwd = {
					"stagger_bwd_downed"
				},
				left = {
					"stagger_left_downed"
				},
				right = {
					"stagger_right_downed"
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
					"stagger_left"
				},
				right = {
					"stagger_right"
				}
			}
		}
	}
}
BreedActions.chaos_exalted_champion = table.create_copy(BreedActions.chaos_exalted_champion, action_data)
BreedActions.chaos_exalted_champion.angry_charge = table.create_copy(BreedActions.chaos_exalted_champion.angry_charge, BreedActions.chaos_exalted_champion.charge)
BreedActions.chaos_exalted_champion.angry_charge.considerations = UtilityConsiderations.chaos_exalted_champion_angry_lunge_attack
BreedActions.chaos_exalted_champion.norsca_charge = table.create_copy(BreedActions.chaos_exalted_champion.norsca_charge, BreedActions.chaos_exalted_champion.charge)
BreedActions.chaos_exalted_champion.norsca_charge.attacks[1].hit_ai_func = nil

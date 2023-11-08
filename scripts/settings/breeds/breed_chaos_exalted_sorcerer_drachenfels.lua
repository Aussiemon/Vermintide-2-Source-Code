local stagger_types = require("scripts/utils/stagger_types")
local base_health = 850
local breed_data = {
	minion_detection_radius = 20,
	walk_speed = 6.5,
	race = "chaos",
	is_bot_aid_threat = true,
	look_at_range = 30,
	behavior = "chaos_exalted_sorcerer_drachenfels",
	lord_damage_reduction = true,
	aoe_radius = 1,
	armored_on_no_damage = true,
	bot_hitbox_radius_approximation = 0.8,
	target_selection = "pick_rat_ogre_target_with_weights",
	unit_template = "ai_unit_chaos_exalted_sorcerer_drachenfels",
	ai_toughness = 10,
	boss = true,
	death_reaction = "ai_default",
	perception = "perception_rat_ogre",
	proximity_system_check = true,
	bone_lod_level = 1,
	wield_inventory_on_spawn = true,
	max_vortex_units = 3,
	default_inventory_template = "chaos_exalted_sorcerer_drachenfels",
	threat_value = 8,
	dialogue_source_name = "chaos_exalted_sorcerer_drachenfels",
	flingable = true,
	aim_template = "chaos_marauder",
	animation_sync_rpc = "rpc_sync_anim_state_7",
	radius = 1.5,
	server_controlled_health_bar = true,
	hit_mass_count = 100,
	disable_second_hit_ragdoll = true,
	ai_strength = 10,
	poison_resistance = 100,
	armor_category = 5,
	death_sound_event = "Play_sorcerer_boss_dead",
	smart_targeting_width = 0.3,
	perception_continuous = "perception_continuous_rat_ogre",
	initial_is_passive = false,
	boost_curve_multiplier_override = 2,
	has_inventory = true,
	run_speed = 6.5,
	awards_positive_reinforcement_message = true,
	exchange_order = 2,
	combat_music_state = "no_boss",
	hit_reaction = "ai_default",
	smart_targeting_outer_width = 0.7,
	hit_effect_template = "HitEffectsChaosExaltedSorcererDrachenfels",
	smart_targeting_height_multiplier = 2.2,
	max_chain_stagger_time = 2,
	smart_object_template = "special",
	headshot_coop_stamina_fatigue_type = "headshot_special",
	player_locomotion_constrain_radius = 0.7,
	far_off_despawn_immunity = true,
	is_of_interest_func = "is_of_interest_boss_sorcerer",
	vortexable = false,
	base_unit = "units/beings/enemies/chaos_sorcerer_boss_drachenfels/chr_chaos_sorcerer_boss_drachenfels",
	aoe_height = 3,
	detection_radius = math.huge,
	perception_weights = {
		target_catapulted_mul = 1,
		target_stickyness_bonus_b = 25,
		targeted_by_other_special = -10,
		target_stickyness_duration_a = 6,
		target_stickyness_duration_b = 12,
		aggro_decay_per_sec = 1,
		target_outside_navmesh_mul = 0.7,
		old_target_aggro_mul = 0.5,
		target_disabled_aggro_mul = 0.1,
		max_distance = 50,
		target_stickyness_bonus_a = 50,
		distance_weight = 20,
		target_disabled_mul = 0.15
	},
	infighting = InfightingSettings.boss,
	size_variation_range = {
		1.4,
		1.4
	},
	max_health = {
		base_health * 1,
		base_health * 1,
		base_health * 1.5,
		base_health * 2,
		base_health * 3,
		base_health * 5,
		base_health * 6.5,
		base_health * 8
	},
	bloodlust_health = BreedTweaks.bloodlust_health.monster,
	stagger_modifier_function = function (stagger_type, duration, length, hit_zone_name, blackboard, breed)
		if stagger_types.heavy <= blackboard.stagger_count then
			stagger_type = stagger_types.none
			blackboard.stagger_ignore_anim_cb = true
		else
			blackboard.stagger_ignore_anim_cb = false
		end

		return stagger_type, duration, length
	end,
	status_effect_settings = {
		category = "medium",
		ignored_statuses = table.set({
			StatusEffectNames.burning_warpfire,
			StatusEffectNames.poisoned
		})
	},
	debug_color = {
		255,
		200,
		200,
		0
	},
	run_on_spawn = AiBreedSnippets.on_chaos_exalted_sorcerer_drachenfels_spawn,
	run_on_game_update = AiBreedSnippets.on_chaos_exalted_sorcerer_drachenfels_update,
	run_on_death = AiBreedSnippets.on_chaos_exalted_sorcerer_drachenfels_death,
	run_on_despawn = AiBreedSnippets.on_chaos_exalted_sorcerer_drachenfels_despawn,
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
			prio = 2,
			actors = {
				"c_hips",
				"c_spine",
				"c_spine1",
				"c_leftshoulder",
				"c_rightshoulder"
			},
			push_actors = {
				"j_spine1"
			}
		},
		left_arm = {
			prio = 3,
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
			prio = 3,
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
			prio = 3,
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
			prio = 3,
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
		full = {
			prio = 4,
			actors = {}
		},
		afro = {
			prio = 5,
			actors = {
				"h_afro"
			}
		}
	},
	allowed_layers = {
		planks = 1.5,
		ledges = 5,
		bot_ratling_gun_fire = 10,
		jumps = 5,
		destructible_wall = 0,
		temporary_wall = 2,
		ledges_with_fence = 5,
		doors = 1.5,
		teleporters = 5,
		bot_poison_wind = 2,
		fire_grenade = 10
	},
	difficulty_kill_achievements = {
		"kill_chaos_exalted_sorcerer_difficulty_rank",
		"kill_chaos_exalted_sorcerer_scorpion_hardest"
	},
	custom_death_enter_function = function (unit, killer_unit, damage_type, death_hit_zone, t, damage_source)
		if not Unit.alive(killer_unit) then
			return
		end

		QuestSettings.check_killed_lord_as_last_player_standing(killer_unit)
	end
}
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
	},
	charge = {
		easy = {
			charge = 10
		},
		normal = {
			charge = 10
		},
		hard = {
			charge = 10
		},
		harder = {
			charge = 10
		},
		hardest = {
			charge = 10
		},
		cataclysm = {
			charge = 10
		},
		cataclysm_2 = {
			charge = 10
		},
		cataclysm_3 = {
			charge = 10
		}
	},
	combo = {
		easy = {
			running = 0.5,
			normal = 3
		},
		normal = {
			running = 0.5,
			normal = 3
		},
		hard = {
			running = 0.5,
			normal = 3
		},
		harder = {
			running = 0.5,
			normal = 3
		},
		hardest = {
			running = 0.5,
			normal = 3
		},
		cataclysm = {
			running = 0.5,
			normal = 3
		},
		cataclysm_2 = {
			running = 0.5,
			normal = 3
		},
		cataclysm_3 = {
			running = 0.5,
			normal = 3
		}
	}
}
local pushed_data = {
	ahead_dist = 2,
	push_width = 3,
	push_forward_offset = 1,
	push_stagger_distance = 1,
	player_pushed_speed = 10,
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
local pushed_data_continuous = {
	ahead_dist = 1,
	push_width = 3,
	push_forward_offset = 1,
	push_stagger_distance = 1,
	player_pushed_speed = 10,
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
Breeds.chaos_exalted_sorcerer_drachenfels = table.create_copy(Breeds.chaos_exalted_sorcerer_drachenfels, breed_data)
local MISSILE_RADIUS = 2
local num_flower_waves = 12
local angle_between_flower_waves = 2 * math.pi / ((num_flower_waves + 1) * 0.5)
local action_data = {
	skulking = {
		third_wave_max_distance = 7,
		third_wave_min_distance = 1,
		close_distance = 7,
		sorcerer_type = "exalted",
		move_animation = "move_fwd",
		min_cast_vortex_distance = 0,
		search_func_name = "update_portal_search",
		max_cast_vortex_distance = 75,
		teleport_closer_range = 5,
		far_away_from_target_sq = 400,
		max_player_vortex_distance = 15,
		vortex_spawn_timer = 3,
		preferred_distance = 10,
		part_hp_lost_to_teleport = 0.01,
		min_player_vortex_distance = 0,
		vortex_check_timer = 2,
		vanish_timer = 8,
		min_wave_distance = 13,
		vanish_countdown = 7.5,
		max_wave_distance = 25,
		teleport_cooldown = {
			7,
			10
		},
		missile_spawn_offset = {
			0.1281,
			1.1719,
			1.3749
		},
		available_spells = {
			"plague_wave"
		},
		after_casting_delay = {
			harder = 0.5,
			hard = 1.5,
			normal = 3,
			hardest = 0,
			cataclysm = 1.5,
			cataclysm_3 = 0,
			cataclysm_2 = 0.5,
			easy = 4
		}
	},
	charge_attack = {
		slow_down_speed = 2,
		impact_animation = "attack_float_special",
		cancel_animation = "attack_float_special",
		dodge_past_sound_event = "Play_enemy_bestigor_charge_attack_miss",
		cancel_slow_down_speed = 3,
		max_slowdown_percentage = 0.25,
		charge_notification_sound_event = "Play_boss_aggro_enter",
		num_charges = 5,
		dodge_past_push_speed = 8,
		fallback_to_idle = true,
		charge_rotation_speed = 5,
		charge_at_max_speed_duration = 3,
		charge_max_speed_at = 3,
		hit_target_slow_down_speed = 3,
		charge_blocked_animation = "attack_float_special",
		start_align_t = 0.16666666666666666,
		shield_blocked_fatigue_type = "blocked_sv_cleave",
		wall_collision_check_range = 0.75,
		animation_move_speed = 10,
		align_to_target_animation = "turn_bwd",
		attack_intensity_type = "charge",
		action_weight = 8,
		radius = 1.25,
		hit_ai_radius = 3,
		player_push_speed_blocked = 10,
		target_extrapolation_length_scale = 50,
		max_slowdown_angle = 40,
		sound_event = "Play_sorcerer_boss_fly_charge",
		min_slowdown_angle = 20,
		end_align_t = 0.5666666666666667,
		catapult_player = true,
		damage = 300,
		hit_react_type = "heavy",
		fatigue_type = "blocked_charge",
		ignore_ledge_death = false,
		disable_path_splines_on_exit = true,
		damage_type = "cutting",
		charge_speed_min = 25,
		hit_radius = 3,
		start_animation = "float_start_fwd",
		target_dodged_radius = 2,
		player_push_speed = 9.5,
		blocked_velocity_scale = 1.5,
		catapult_force_z = 5,
		charge_speed_max = 25,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		charging_distance_thresholds = {
			far = 0,
			medium = 0,
			short = 0
		},
		tracking_durations = {
			far = 4,
			medium = 1.5,
			short = 1
		},
		lunge = {
			rotation_speed = 6.5,
			rotation_slow_down_speed = 4,
			max_angle_to_allow = 60,
			enter_thresholds = {
				far = 3,
				medium = 3,
				short = 3
			},
			velocity_scaling = {
				far = 1,
				medium = 1,
				short = 1
			},
			animations = {
				far = "attack_float_special",
				medium = "attack_float_special",
				short = "attack_float_special"
			}
		},
		charging_animations = {
			far = "float_fwd_special",
			medium = "float_fwd_special",
			short = "float_fwd_special"
		},
		push_ai = {
			stagger_distance = 1.5,
			stagger_impact = {
				stagger_types.explosion,
				stagger_types.explosion,
				stagger_types.none,
				stagger_types.none,
				stagger_types.explosion
			},
			stagger_duration = {
				3,
				1,
				0,
				0,
				4
			}
		},
		difficulty_damage = {
			harder = 150,
			hard = 105,
			normal = 75,
			hardest = 300,
			cataclysm = 300,
			cataclysm_3 = 300,
			cataclysm_2 = 300,
			easy = 75
		},
		ignore_staggers = {
			true,
			false,
			false,
			false,
			true,
			false
		}
	},
	follow = {
		idle_anim = "float_idle",
		follow_target_function_name = "_follow_target_rat_ogre",
		move_anim = "float_start_fwd",
		action_weight = 1,
		considerations = UtilityConsiderations.follow,
		start_anims_name = {
			bwd = "float_start_bwd",
			fwd = "float_start_fwd",
			left = "float_start_left",
			right = "float_start_right"
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
		init_blackboard = {
			chasing_timer = -10
		}
	},
	quick_teleport = {
		teleport_effect = "fx/chr_chaos_sorcerer_teleport",
		teleport_end_anim = "teleport_end",
		force_teleport = true,
		teleport_effect_trail = "fx/chr_chaos_sorcerer_teleport_direction",
		action_weight = 10,
		teleport_end_effect = "fx/drachenfels_boss_teleport_enter",
		face_player_when_teleporting = true,
		teleport_start_anim = "teleport_start",
		teleport_pos_func = function (unit, blackboard)
			local player_positions = Managers.state.side:get_side_from_name("heroes").PLAYER_POSITIONS
			local total_pos = Vector3.zero()
			local level_analysis = Managers.state.conflict.level_analysis
			local node_units = level_analysis.generic_ai_node_units.sorcerer_boss_drachenfels_center
			local center_unit = node_units[1]
			local teleport_pos = Unit.local_position(center_unit, 0)

			for _, player_pos in ipairs(player_positions) do
				if player_pos then
					total_pos = total_pos + player_pos
				end
			end

			local avarage_pos = total_pos / #player_positions
			local nav_world = blackboard.nav_world
			local arena_radius = 12
			local wanted_teleport_position = ConflictUtils.get_furthest_pos_from_pos_on_circle(nav_world, teleport_pos, arena_radius, 1, 15, avarage_pos)

			return wanted_teleport_position
		end,
		considerations = {},
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true
		}
	},
	teleport_behind_player = {
		teleport_effect = "fx/chr_chaos_sorcerer_teleport",
		teleport_end_effect = "fx/drachenfels_boss_teleport_enter",
		force_teleport = true,
		teleport_effect_trail = "fx/chr_chaos_sorcerer_teleport_direction",
		action_weight = 10,
		teleport_pos_func = function (unit, blackboard)
			local nav_world = blackboard.nav_world
			local position = POSITION_LOOKUP[unit]
			local target_position = POSITION_LOOKUP[blackboard.target_unit]
			local direction = Vector3.normalize(target_position - position)
			target_position = target_position + 3 * direction
			local success, altitude = GwNavQueries.triangle_from_position(nav_world, target_position, 2, 2)

			if success then
				target_position.z = altitude

				return target_position
			end
		end,
		considerations = {},
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true
		}
	},
	retaliation_aoe = {
		offset_forward = -4,
		height = 3,
		radius = 6,
		collision_type = "cylinder",
		rotation_time = 0,
		fatigue_type = "blocked_slam",
		shove_z_speed = 3,
		damage_type = "cutting",
		offset_up = -0.5,
		attack_anim = "attack_staff_floor",
		offset_right = 0,
		damage = 0,
		player_push_speed = 10,
		action_weight = 4,
		shove_speed = 5,
		player_push_speed_blocked = 5,
		ignore_abort_on_blocked_attack = true,
		considerations = UtilityConsiderations.chaos_exalted_sorcerer_drachenfels_defensive_aoe,
		difficulty_damage = {
			harder = 0,
			hard = 0,
			normal = 0,
			hardest = 0,
			cataclysm = 0,
			cataclysm_3 = 0,
			cataclysm_2 = 0,
			easy = 0
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
	death_explosion = {
		damage_type = "cutting",
		offset_forward = -4,
		height = 3,
		radius = 10,
		rotation_time = 0,
		fatigue_type = "blocked_slam",
		collision_type = "cylinder",
		shove_z_speed = 3,
		offset_up = -0.5,
		effect_name = "fx/drachenfels_shockwave",
		offset_right = 0,
		damage = 0,
		player_push_speed = 10,
		action_weight = 1,
		shove_speed = 5,
		player_push_speed_blocked = 7,
		ignore_abort_on_blocked_attack = true,
		difficulty_damage = {
			harder = 0,
			hard = 0,
			normal = 0,
			hardest = 0,
			cataclysm = 0,
			cataclysm_3 = 0,
			cataclysm_2 = 0,
			easy = 0
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
	spawn_boss_rings_1 = {
		spawn_func_name = "spawn_boss_rings",
		start_ability_sound_event = "Play_sorcerer_boss_special_ability_start",
		damage_profile_name = "frag_grenade",
		init_func_name = "init_boss_rings",
		update_func_name = "update_boss_rings",
		end_ability_sound_event = "Play_sorcerer_boss_special_windup_end",
		cleanup_func_name = "clean_up_boss_rings",
		damage_sound_event = "Play_sorcerer_boss_special_ability_burn",
		attack_anim = "attack_cast_spell_loop",
		ring_info = {
			{
				damage_effect_name = "fx/drachenfels_boss_indicator_disc_part_2",
				premonition_effect_name_medium = "fx/drachenfels_boss_indicator_disc_part_1",
				premonition_effect_name_short = "fx/drachenfels_boss_indicator_disc_part_1",
				min_radius = 0,
				premonition_effect_name_long = "fx/drachenfels_boss_indicator_disc_part_1",
				max_radius = 4
			},
			{
				damage_effect_name = "fx/drachenfels_boss_indicator_donut_small_part_2",
				premonition_effect_name_medium = "fx/drachenfels_boss_indicator_donut_small_part_1",
				premonition_effect_name_short = "fx/drachenfels_boss_indicator_donut_small_part_1",
				min_radius = 4,
				premonition_effect_name_long = "fx/drachenfels_boss_indicator_donut_small_part_1",
				max_radius = 8
			},
			{
				damage_effect_name = "fx/drachenfels_boss_indicator_donut_medium_part_2",
				premonition_effect_name_medium = "fx/drachenfels_boss_indicator_donut_medium_part_1",
				premonition_effect_name_short = "fx/drachenfels_boss_indicator_donut_medium_part_1",
				min_radius = 8,
				premonition_effect_name_long = "fx/drachenfels_boss_indicator_donut_medium_part_1",
				max_radius = 12
			},
			{
				damage_effect_name = "fx/drachenfels_boss_indicator_donut_large_part_2",
				premonition_effect_name_medium = "fx/drachenfels_boss_indicator_donut_large_part_1",
				premonition_effect_name_short = "fx/drachenfels_boss_indicator_donut_large_part_1",
				min_radius = 12,
				premonition_effect_name_long = "fx/drachenfels_boss_indicator_donut_large_part_1",
				max_radius = 15
			}
		},
		power_level = {
			harder = 100,
			hard = 75,
			normal = 50,
			hardest = 150,
			cataclysm = 400,
			cataclysm_3 = 400,
			cataclysm_2 = 400,
			easy = 50
		},
		ring_sequence = {
			{
				catapult_strength = 5,
				premination = "long",
				catapult_direction = "out",
				delay = 3,
				position = 1
			},
			{
				catapult_strength = 1,
				premination = "long",
				catapult_direction = "out",
				delay = 0,
				position = 3
			},
			{
				catapult_strength = 5,
				premination = "long",
				catapult_direction = "in",
				delay = 0,
				position = 4
			},
			{
				catapult_strength = 7,
				premination = "long",
				catapult_direction = "out",
				delay = 2,
				position = 1
			},
			{
				catapult_strength = 5,
				premination = "long",
				catapult_direction = "out",
				delay = 0,
				position = 2
			},
			{
				catapult_strength = 1,
				premination = "long",
				catapult_direction = "in",
				delay = 0,
				position = 4
			},
			{
				catapult_strength = 7,
				premination = "long",
				catapult_direction = "out",
				delay = 2,
				position = 1
			},
			{
				catapult_strength = 6,
				premination = "long",
				catapult_direction = "out",
				delay = 0,
				position = 2
			},
			{
				catapult_strength = 3,
				premination = "long",
				catapult_direction = "out",
				delay = 0,
				position = 3
			},
			{
				catapult_strength = 7,
				premination = "long",
				catapult_direction = "in",
				delay = 2,
				position = 4
			},
			{
				catapult_strength = 7,
				premination = "long",
				catapult_direction = "in",
				delay = 2,
				position = 4
			},
			{
				catapult_strength = 5,
				premination = "long",
				catapult_direction = "in",
				delay = 0,
				position = 3
			},
			{
				catapult_strength = 7,
				premination = "long",
				catapult_direction = "in",
				delay = 2,
				position = 4
			},
			{
				catapult_strength = 5,
				premination = "long",
				catapult_direction = "in",
				delay = 0,
				position = 3
			},
			{
				catapult_strength = 3,
				premination = "long",
				catapult_direction = "in",
				delay = 0,
				position = 2
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
	spawn_boss_rings_2 = {
		spawn_func_name = "spawn_boss_rings",
		start_ability_sound_event = "Play_sorcerer_boss_special_ability_start",
		damage_profile_name = "frag_grenade",
		init_func_name = "init_boss_rings",
		update_func_name = "update_boss_rings",
		end_ability_sound_event = "Play_sorcerer_boss_special_windup_end",
		cleanup_func_name = "clean_up_boss_rings",
		damage_sound_event = "Play_sorcerer_boss_special_ability_burn",
		attack_anim = "attack_cast_spell_loop",
		ring_info = {
			{
				damage_effect_name = "fx/drachenfels_boss_indicator_disc_part_2",
				premonition_effect_name_medium = "fx/drachenfels_boss_indicator_disc_part_1",
				premonition_effect_name_short = "fx/drachenfels_boss_indicator_disc_part_1",
				min_radius = 0,
				premonition_effect_name_long = "fx/drachenfels_boss_indicator_disc_part_1",
				max_radius = 4
			},
			{
				damage_effect_name = "fx/drachenfels_boss_indicator_donut_small_part_2",
				premonition_effect_name_medium = "fx/drachenfels_boss_indicator_donut_small_part_1",
				premonition_effect_name_short = "fx/drachenfels_boss_indicator_donut_small_part_1",
				min_radius = 4,
				premonition_effect_name_long = "fx/drachenfels_boss_indicator_donut_small_part_1",
				max_radius = 8
			},
			{
				damage_effect_name = "fx/drachenfels_boss_indicator_donut_medium_part_2",
				premonition_effect_name_medium = "fx/drachenfels_boss_indicator_donut_medium_part_1",
				premonition_effect_name_short = "fx/drachenfels_boss_indicator_donut_medium_part_1",
				min_radius = 8,
				premonition_effect_name_long = "fx/drachenfels_boss_indicator_donut_medium_part_1",
				max_radius = 12
			},
			{
				damage_effect_name = "fx/drachenfels_boss_indicator_donut_large_part_2",
				premonition_effect_name_medium = "fx/drachenfels_boss_indicator_donut_large_part_1",
				premonition_effect_name_short = "fx/drachenfels_boss_indicator_donut_large_part_1",
				min_radius = 12,
				premonition_effect_name_long = "fx/drachenfels_boss_indicator_donut_large_part_1",
				max_radius = 15
			}
		},
		power_level = {
			harder = 100,
			hard = 75,
			normal = 50,
			hardest = 150,
			cataclysm = 400,
			cataclysm_3 = 400,
			cataclysm_2 = 400,
			easy = 50
		},
		ring_sequence = {
			{
				catapult_strength = 6,
				premination = "long",
				catapult_direction = "out",
				delay = 3,
				position = 1
			},
			{
				catapult_strength = 6,
				premination = "long",
				catapult_direction = "in",
				delay = 0,
				position = 3
			},
			{
				catapult_strength = 6,
				premination = "long",
				catapult_direction = "out",
				delay = 2,
				position = 2
			},
			{
				catapult_strength = 6,
				premination = "long",
				catapult_direction = "in",
				delay = 0,
				position = 4
			},
			{
				catapult_strength = 6,
				premination = "long",
				catapult_direction = "out",
				delay = 2,
				position = 1
			},
			{
				catapult_strength = 6,
				premination = "long",
				catapult_direction = "in",
				delay = 0,
				position = 3
			},
			{
				catapult_strength = 6,
				premination = "long",
				catapult_direction = "out",
				delay = 2,
				position = 2
			},
			{
				catapult_strength = 6,
				premination = "long",
				catapult_direction = "in",
				delay = 0,
				position = 4
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
	spawn_boss_rings_3 = {
		spawn_func_name = "spawn_boss_rings",
		start_ability_sound_event = "Play_sorcerer_boss_special_ability_start",
		damage_profile_name = "frag_grenade",
		init_func_name = "init_boss_rings",
		update_func_name = "update_boss_rings",
		end_ability_sound_event = "Play_sorcerer_boss_special_windup_end",
		cleanup_func_name = "clean_up_boss_rings",
		damage_sound_event = "Play_sorcerer_boss_special_ability_burn",
		attack_anim = "attack_cast_spell_loop",
		ring_info = {
			{
				damage_effect_name = "fx/drachenfels_boss_indicator_disc_part_2",
				premonition_effect_name_medium = "fx/drachenfels_boss_indicator_disc_part_1",
				premonition_effect_name_short = "fx/drachenfels_boss_indicator_disc_part_1",
				min_radius = 0,
				premonition_effect_name_long = "fx/drachenfels_boss_indicator_disc_part_1",
				max_radius = 4
			},
			{
				damage_effect_name = "fx/drachenfels_boss_indicator_donut_small_part_2",
				premonition_effect_name_medium = "fx/drachenfels_boss_indicator_donut_small_part_1",
				premonition_effect_name_short = "fx/drachenfels_boss_indicator_donut_small_part_1",
				min_radius = 4,
				premonition_effect_name_long = "fx/drachenfels_boss_indicator_donut_small_part_1",
				max_radius = 8
			},
			{
				damage_effect_name = "fx/drachenfels_boss_indicator_donut_medium_part_2",
				premonition_effect_name_medium = "fx/drachenfels_boss_indicator_donut_medium_part_1",
				premonition_effect_name_short = "fx/drachenfels_boss_indicator_donut_medium_part_1",
				min_radius = 8,
				premonition_effect_name_long = "fx/drachenfels_boss_indicator_donut_medium_part_1",
				max_radius = 12
			},
			{
				damage_effect_name = "fx/drachenfels_boss_indicator_donut_large_part_2",
				premonition_effect_name_medium = "fx/drachenfels_boss_indicator_donut_large_part_1",
				premonition_effect_name_short = "fx/drachenfels_boss_indicator_donut_large_part_1",
				min_radius = 12,
				premonition_effect_name_long = "fx/drachenfels_boss_indicator_donut_large_part_1",
				max_radius = 15
			}
		},
		power_level = {
			harder = 100,
			hard = 75,
			normal = 50,
			hardest = 150,
			cataclysm = 400,
			cataclysm_3 = 400,
			cataclysm_2 = 400,
			easy = 50
		},
		ring_sequence = {
			{
				catapult_strength = 3,
				premination = "long",
				catapult_direction = "out",
				delay = 3,
				position = 1
			},
			{
				catapult_strength = 5,
				premination = "long",
				catapult_direction = "out",
				delay = 2,
				position = 1
			},
			{
				catapult_strength = 3,
				premination = "long",
				catapult_direction = "out",
				delay = 0,
				position = 2
			},
			{
				catapult_strength = 7,
				premination = "long",
				catapult_direction = "out",
				delay = 2,
				position = 1
			},
			{
				catapult_strength = 5,
				premination = "long",
				catapult_direction = "out",
				delay = 0,
				position = 2
			},
			{
				catapult_strength = 3,
				premination = "long",
				catapult_direction = "out",
				delay = 0,
				position = 3
			},
			{
				catapult_strength = 3,
				premination = "long",
				catapult_direction = "in",
				delay = 2,
				position = 4
			},
			{
				catapult_strength = 5,
				premination = "long",
				catapult_direction = "in",
				delay = 2,
				position = 4
			},
			{
				catapult_strength = 3,
				premination = "long",
				catapult_direction = "in",
				delay = 0,
				position = 3
			},
			{
				catapult_strength = 7,
				premination = "long",
				catapult_direction = "in",
				delay = 2,
				position = 4
			},
			{
				catapult_strength = 5,
				premination = "long",
				catapult_direction = "in",
				delay = 0,
				position = 3
			},
			{
				catapult_strength = 3,
				premination = "long",
				catapult_direction = "in",
				delay = 0,
				position = 2
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
	spawn_boss_rings_4 = {
		spawn_func_name = "spawn_boss_rings",
		start_ability_sound_event = "Play_sorcerer_boss_special_ability_start",
		damage_profile_name = "frag_grenade",
		init_func_name = "init_boss_rings",
		update_func_name = "update_boss_rings",
		end_ability_sound_event = "Play_sorcerer_boss_special_windup_end",
		cleanup_func_name = "clean_up_boss_rings",
		damage_sound_event = "Play_sorcerer_boss_special_ability_burn",
		attack_anim = "attack_cast_spell_loop",
		ring_info = {
			{
				damage_effect_name = "fx/drachenfels_boss_indicator_disc_part_2",
				premonition_effect_name_medium = "fx/drachenfels_boss_indicator_disc_part_1",
				premonition_effect_name_short = "fx/drachenfels_boss_indicator_disc_part_1",
				min_radius = 0,
				premonition_effect_name_long = "fx/drachenfels_boss_indicator_disc_part_1",
				max_radius = 4
			},
			{
				damage_effect_name = "fx/drachenfels_boss_indicator_donut_small_part_2",
				premonition_effect_name_medium = "fx/drachenfels_boss_indicator_donut_small_part_1",
				premonition_effect_name_short = "fx/drachenfels_boss_indicator_donut_small_part_1",
				min_radius = 4,
				premonition_effect_name_long = "fx/drachenfels_boss_indicator_donut_small_part_1",
				max_radius = 8
			},
			{
				damage_effect_name = "fx/drachenfels_boss_indicator_donut_medium_part_2",
				premonition_effect_name_medium = "fx/drachenfels_boss_indicator_donut_medium_part_1",
				premonition_effect_name_short = "fx/drachenfels_boss_indicator_donut_medium_part_1",
				min_radius = 8,
				premonition_effect_name_long = "fx/drachenfels_boss_indicator_donut_medium_part_1",
				max_radius = 12
			},
			{
				damage_effect_name = "fx/drachenfels_boss_indicator_donut_large_part_2",
				premonition_effect_name_medium = "fx/drachenfels_boss_indicator_donut_large_part_1",
				premonition_effect_name_short = "fx/drachenfels_boss_indicator_donut_large_part_1",
				min_radius = 12,
				premonition_effect_name_long = "fx/drachenfels_boss_indicator_donut_large_part_1",
				max_radius = 15
			}
		},
		power_level = {
			harder = 100,
			hard = 75,
			normal = 50,
			hardest = 150,
			cataclysm = 400,
			cataclysm_3 = 400,
			cataclysm_2 = 400,
			easy = 50
		},
		ring_sequence = {
			{
				catapult_strength = 7,
				premination = "long",
				catapult_direction = "out",
				delay = 3,
				position = 4
			},
			{
				catapult_strength = 7,
				premination = "long",
				catapult_direction = "out",
				delay = 2,
				position = 4
			},
			{
				catapult_strength = 7,
				premination = "long",
				catapult_direction = "out",
				delay = 0,
				position = 3
			},
			{
				catapult_strength = 7,
				premination = "long",
				catapult_direction = "out",
				delay = 2,
				position = 4
			},
			{
				catapult_strength = 7,
				premination = "long",
				catapult_direction = "out",
				delay = 0,
				position = 3
			},
			{
				catapult_strength = 7,
				premination = "long",
				catapult_direction = "out",
				delay = 0,
				position = 2
			},
			{
				catapult_strength = 7,
				premination = "long",
				catapult_direction = "out",
				delay = 2,
				position = 1
			},
			{
				catapult_strength = 7,
				premination = "long",
				catapult_direction = "out",
				delay = 2,
				position = 1
			},
			{
				catapult_strength = 7,
				premination = "long",
				catapult_direction = "out",
				delay = 0,
				position = 2
			},
			{
				catapult_strength = 7,
				premination = "long",
				catapult_direction = "out",
				delay = 2,
				position = 1
			},
			{
				catapult_strength = 7,
				premination = "long",
				catapult_direction = "out",
				delay = 0,
				position = 2
			},
			{
				catapult_strength = 7,
				premination = "long",
				catapult_direction = "out",
				delay = 0,
				position = 3
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
	spawn_boss_rings_5 = {
		spawn_func_name = "spawn_boss_rings",
		start_ability_sound_event = "Play_sorcerer_boss_special_ability_start",
		damage_profile_name = "frag_grenade",
		init_func_name = "init_boss_rings",
		update_func_name = "update_boss_rings",
		end_ability_sound_event = "Play_sorcerer_boss_special_windup_end",
		cleanup_func_name = "clean_up_boss_rings",
		damage_sound_event = "Play_sorcerer_boss_special_ability_burn",
		attack_anim = "attack_cast_spell_loop",
		ring_info = {
			{
				damage_effect_name = "fx/drachenfels_boss_indicator_disc_part_2",
				premonition_effect_name_medium = "fx/drachenfels_boss_indicator_disc_part_1",
				premonition_effect_name_short = "fx/drachenfels_boss_indicator_disc_part_1",
				min_radius = 0,
				premonition_effect_name_long = "fx/drachenfels_boss_indicator_disc_part_1",
				max_radius = 4
			},
			{
				damage_effect_name = "fx/drachenfels_boss_indicator_donut_small_part_2",
				premonition_effect_name_medium = "fx/drachenfels_boss_indicator_donut_small_part_1",
				premonition_effect_name_short = "fx/drachenfels_boss_indicator_donut_small_part_1",
				min_radius = 4,
				premonition_effect_name_long = "fx/drachenfels_boss_indicator_donut_small_part_1",
				max_radius = 8
			},
			{
				damage_effect_name = "fx/drachenfels_boss_indicator_donut_medium_part_2",
				premonition_effect_name_medium = "fx/drachenfels_boss_indicator_donut_medium_part_1",
				premonition_effect_name_short = "fx/drachenfels_boss_indicator_donut_medium_part_1",
				min_radius = 8,
				premonition_effect_name_long = "fx/drachenfels_boss_indicator_donut_medium_part_1",
				max_radius = 12
			},
			{
				damage_effect_name = "fx/drachenfels_boss_indicator_donut_large_part_2",
				premonition_effect_name_medium = "fx/drachenfels_boss_indicator_donut_large_part_1",
				premonition_effect_name_short = "fx/drachenfels_boss_indicator_donut_large_part_1",
				min_radius = 12,
				premonition_effect_name_long = "fx/drachenfels_boss_indicator_donut_large_part_1",
				max_radius = 15
			}
		},
		power_level = {
			harder = 100,
			hard = 75,
			normal = 50,
			hardest = 150,
			cataclysm = 400,
			cataclysm_3 = 400,
			cataclysm_2 = 400,
			easy = 50
		},
		ring_sequence = {
			{
				catapult_strength = 3,
				premination = "long",
				catapult_direction = "out",
				delay = 3,
				position = 1
			},
			{
				catapult_strength = 3,
				premination = "long",
				catapult_direction = "in",
				delay = 0,
				position = 2
			},
			{
				catapult_strength = 3,
				premination = "long",
				catapult_direction = "out",
				delay = 2,
				position = 3
			},
			{
				catapult_strength = 3,
				premination = "long",
				catapult_direction = "in",
				delay = 0,
				position = 4
			},
			{
				catapult_strength = 3,
				premination = "long",
				catapult_direction = "out",
				delay = 2,
				position = 1
			},
			{
				catapult_strength = 3,
				premination = "long",
				catapult_direction = "in",
				delay = 0,
				position = 2
			},
			{
				catapult_strength = 3,
				premination = "long",
				catapult_direction = "out",
				delay = 2,
				position = 3
			},
			{
				catapult_strength = 3,
				premination = "long",
				catapult_direction = "in",
				delay = 0,
				position = 4
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
	spawn_boss_rings_outer = {
		spawn_func_name = "spawn_boss_rings",
		start_ability_sound_event = "Play_sorcerer_boss_special_ability_start",
		damage_profile_name = "frag_grenade",
		init_func_name = "init_boss_rings",
		update_func_name = "update_boss_rings",
		end_ability_sound_event = "Play_sorcerer_boss_special_windup_end",
		cleanup_func_name = "clean_up_boss_rings",
		damage_sound_event = "Play_sorcerer_boss_special_ability_burn",
		ring_info = {
			{
				damage_effect_name = "fx/drachenfels_boss_indicator_disc_part_2",
				premonition_effect_name_medium = "fx/drachenfels_boss_indicator_disc_part_1",
				premonition_effect_name_short = "fx/drachenfels_boss_indicator_disc_part_1",
				min_radius = 0,
				premonition_effect_name_long = "fx/drachenfels_boss_indicator_disc_part_1",
				max_radius = 4
			},
			{
				damage_effect_name = "fx/drachenfels_boss_indicator_donut_small_part_2",
				premonition_effect_name_medium = "fx/drachenfels_boss_indicator_donut_small_part_1",
				premonition_effect_name_short = "fx/drachenfels_boss_indicator_donut_small_part_1",
				min_radius = 4,
				premonition_effect_name_long = "fx/drachenfels_boss_indicator_donut_small_part_1",
				max_radius = 8
			},
			{
				damage_effect_name = "fx/drachenfels_boss_indicator_donut_medium_part_2",
				premonition_effect_name_medium = "fx/drachenfels_boss_indicator_donut_medium_part_1",
				premonition_effect_name_short = "fx/drachenfels_boss_indicator_donut_medium_part_1",
				min_radius = 8,
				premonition_effect_name_long = "fx/drachenfels_boss_indicator_donut_medium_part_1",
				max_radius = 12
			},
			{
				damage_effect_name = "fx/drachenfels_boss_indicator_donut_large_part_2",
				premonition_effect_name_medium = "fx/drachenfels_boss_indicator_donut_large_part_1",
				premonition_effect_name_short = "fx/drachenfels_boss_indicator_donut_large_part_1",
				min_radius = 12,
				premonition_effect_name_long = "fx/drachenfels_boss_indicator_donut_large_part_1",
				max_radius = 15
			}
		},
		power_level = {
			harder = 100,
			hard = 75,
			normal = 50,
			hardest = 150,
			cataclysm = 400,
			cataclysm_3 = 400,
			cataclysm_2 = 400,
			easy = 50
		},
		ring_sequence = {
			{
				catapult_strength = 7,
				premination = "long",
				catapult_direction = "in",
				delay = 0,
				position = 4
			},
			{
				catapult_strength = 7,
				premination = "long",
				catapult_direction = "in",
				delay = 0,
				position = 3
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
	swing_floating = {
		height = 2,
		offset_forward = 0.5,
		action_weight = 1,
		hit_react_type = "medium",
		ignores_dodging = true,
		target_running_velocity_threshold = 2,
		fatigue_type = "blocked_sv_cleave",
		rotation_time = 2,
		damage_type = "cutting",
		offset_up = 0,
		range = 5,
		damage = 15,
		allow_friendly_fire = true,
		attack_intensity_type = "sweep",
		width = 1.5,
		considerations = UtilityConsiderations.drachenfels_swing_floating_attack,
		attacks = {
			{
				"attack_float_02",
				offset_up = 0,
				catapult_player = true,
				offset_forward = 0,
				ignores_dodging = true,
				rotation_time = 2,
				anim_driven = false,
				height = 2,
				blocked_anim = "attack_float_01",
				player_push_speed_blocked_z = 4,
				moving_attack = true,
				player_push_speed_z = 4,
				range = 5,
				player_push_speed = 9,
				reset_attack_animation_speed = 1.2,
				hit_multiple_targets = true,
				player_push_speed_blocked = 8,
				attack_time = 2.2666666666666666,
				width = 2,
				attack_anim = {
					"attack_float_01",
					"attack_float_02"
				},
				difficulty_attack_intensity = AttackIntensityPerDifficulty,
				reset_attack_animations = {
					"attack_float_01",
					"attack_float_02"
				},
				attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_sorcerer_drachenfels
			}
		},
		running_attacks = {
			{
				"attack_float_02_fwd",
				offset_up = 0,
				ignores_dodging = true,
				offset_forward = 0,
				catapult_player = true,
				rotation_time = 2,
				anim_driven = true,
				height = 2,
				blocked_anim = "attack_float_01_fwd",
				player_push_speed_blocked_z = 4,
				moving_attack = true,
				player_push_speed_z = 4,
				range = 5,
				player_push_speed = 9,
				reset_attack_animation_speed = 1.2,
				hit_multiple_targets = true,
				player_push_speed_blocked = 8,
				attack_time = 2.2666666666666666,
				width = 1.5,
				attack_anim = {
					"attack_float_01_fwd",
					"attack_float_02_fwd"
				},
				difficulty_attack_intensity = AttackIntensityPerDifficulty,
				reset_attack_animations = {
					"attack_float_01_fwd",
					"attack_float_02_fwd"
				},
				attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_sorcerer_drachenfels
			}
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
		}
	},
	combo_attack = {
		fatigue_type = "chaos_spawn_combo",
		shield_blocked_fatigue_type = "chaos_spawn_combo",
		damage = 15,
		damage_type = "cutting",
		allow_friendly_fire = true,
		attack_intensity_type = "combo",
		action_weight = 1,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.drachenfels_floating_combo,
		attacks = {
			{
				hit_multiple_targets = true,
				offset_forward = 1,
				height = 2.5,
				ignores_dodging = true,
				rotation_time = 2,
				anim_driven = true,
				offset_up = 0,
				range = 2.5,
				player_push_speed = 8,
				damage_done_time = 1.9,
				rotation_speed = 6,
				player_push_speed_blocked = 8,
				attack_time = 2.8333333333333335,
				width = 1.5,
				attack_anim = {
					"attack_float_combo_01"
				},
				push_units_in_the_way = pushed_data,
				push_units_in_the_way_continuous = pushed_data_continuous,
				bot_threats = {
					{
						range = 3.5,
						duration = 0.3333333333333333,
						start_time = 0.3333333333333333
					},
					{
						range = 3.5,
						duration = 0.3333333333333333,
						start_time = 1.1666666666666667
					},
					{
						range = 3.5,
						duration = 0.3333333333333333,
						start_time = 0.8333333333333334
					},
					{
						range = 3.5,
						duration = 0.3333333333333333,
						start_time = 1.9333333333333333
					}
				},
				hit_player_func = function (unit, blackboard, hit_unit, action, attack, dealt_damage)
					if dealt_damage then
						blackboard.has_dealt_damage = true
					end
				end
			}
		},
		difficulty_damage = BreedTweaks.difficulty_damage.boss_combo_attack,
		ignore_staggers = {
			true,
			false,
			false,
			true,
			true,
			false
		}
	},
	overhead_floating = {
		damage = 10,
		hit_react_type = "heavy",
		fatigue_type = "chaos_cleave",
		target_running_velocity_threshold = 2,
		attack_intensity_type = "cleave",
		action_weight = 1,
		blocked_damage = 5,
		damage_type = "cutting",
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.drachenfels_overhead_floating_attack,
		attacks = {
			{
				"attack_float_03",
				moving_attack = true,
				height = 2,
				offset_forward = 0.6,
				bot_threat_start_time = 1.25,
				ignores_dodging = true,
				rotation_time = 1.5,
				anim_driven = false,
				dodge_window_start = 0.75,
				blocked_anim = "attack_float_06",
				no_block_stagger = true,
				offset_up = 0,
				dodge_rotation_time = 2.5,
				range = 3.5,
				bot_threat_duration = 1,
				reset_attack_animation_speed = 1.2,
				hit_multiple_targets = true,
				bot_threat_start_time_step = 1.45,
				attack_time = 1.9333333333333333,
				width = 0.4,
				attack_anim = {
					"attack_float_06",
					"attack_float_03"
				},
				difficulty_attack_intensity = AttackIntensityPerDifficulty,
				reset_attack_animations = {
					"attack_float_06",
					"attack_float_03"
				},
				attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_elite
			}
		},
		running_attacks = {
			{
				"attack_float_06_fwd",
				moving_attack = true,
				height = 2,
				offset_forward = 0.6,
				dodge_window_start = 0.75,
				ignores_dodging = true,
				rotation_time = 1.5,
				anim_driven = true,
				blocked_anim = "attack_float_03_fwd",
				bot_threat_start_time = 1.25,
				offset_up = 0,
				dodge_rotation_time = 2.5,
				range = 3.5,
				bot_threat_duration = 1,
				reset_attack_animation_speed = 1.2,
				hit_multiple_targets = true,
				bot_threat_start_time_step = 1.45,
				attack_time = 1.9333333333333333,
				width = 0.4,
				attack_anim = {
					"attack_float_03_fwd",
					"attack_float_06_fwd"
				},
				difficulty_attack_intensity = AttackIntensityPerDifficulty,
				reset_attack_animations = {
					"attack_float_03_fwd",
					"attack_float_06_fwd"
				},
				attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_sorcerer_drachenfels
			}
		},
		blocked_difficulty_damage = BreedTweaks.difficulty_damage.boss_slam_attack_blocked,
		difficulty_damage = BreedTweaks.difficulty_damage.boss_slam_attack,
		ignore_staggers = {
			false,
			false,
			false,
			true,
			true,
			false
		}
	},
	charge_swing = {
		"attack_float_02",
		reset_attack_animation_speed = 1.2,
		push = true,
		hit_react_type = "medium",
		rotation_time = 0.8,
		fatigue_type = "blocked_sv_cleave",
		offset_forward = 0,
		blocked_anim = "attack_float_01",
		height = 2,
		damage_type = "cutting",
		offset_up = 0,
		range = 5,
		damage = 15,
		attack_intensity_type = "sweep",
		action_weight = 1,
		width = 3,
		considerations = {},
		attack_anim = {
			"attack_float_01",
			"attack_float_02"
		},
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
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
			"attack_float_01",
			"attack_float_02"
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_sorcerer_drachenfels
	},
	overhead_downed = {
		height = 2,
		offset_forward = 0.6,
		hit_react_type = "heavy",
		bot_threat_start_time = 1.25,
		dodge_rotation_time = 2.5,
		rotation_time = 1.5,
		fatigue_type = "chaos_cleave",
		dodge_window_start = 0.75,
		no_block_stagger = true,
		damage_type = "cutting",
		offset_up = 0,
		range = 3,
		damage = 30,
		bot_threat_duration = 1,
		attack_intensity_type = "cleave",
		action_weight = 1,
		bot_threat_start_time_step = 1.45,
		width = 0.4,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.drachenfels_overhead_downed_attack,
		attack_anim = {
			"attack_close_01"
		},
		difficulty_damage = BreedTweaks.difficulty_damage.elite_attack_heavy,
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_elite
	},
	cleave_downed = {
		height = 2,
		offset_forward = 0.6,
		hit_react_type = "heavy",
		bot_threat_start_time = 1.25,
		dodge_rotation_time = 2.5,
		rotation_time = 1.5,
		fatigue_type = "chaos_cleave",
		dodge_window_start = 0.75,
		no_block_stagger = true,
		damage_type = "cutting",
		offset_up = 0,
		range = 3,
		damage = 30,
		bot_threat_duration = 1,
		attack_intensity_type = "sweep",
		action_weight = 1,
		bot_threat_start_time_step = 1.45,
		width = 3,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.drachenfels_cleave_downed_attack,
		attack_anim = {
			"attack_close_02"
		},
		difficulty_damage = BreedTweaks.difficulty_damage.elite_attack,
		ignore_staggers = {
			true,
			true,
			false,
			true,
			true,
			false
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_elite
	},
	punch_downed = {
		height = 2,
		offset_forward = 0.6,
		hit_react_type = "heavy",
		bot_threat_start_time = 1.25,
		dodge_rotation_time = 2.5,
		rotation_time = 1.5,
		fatigue_type = "chaos_cleave",
		dodge_window_start = 0.75,
		no_block_stagger = true,
		damage_type = "cutting",
		offset_up = 0,
		range = 2,
		damage = 30,
		bot_threat_duration = 1,
		attack_intensity_type = "push",
		action_weight = 1,
		bot_threat_start_time_step = 1.45,
		width = 1.5,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.drachenfels_punch_downed_attack,
		attack_anim = {
			"attack_close_03"
		},
		difficulty_damage = BreedTweaks.difficulty_damage.elite_attack,
		ignore_staggers = {
			true,
			true,
			false,
			true,
			true,
			false
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_elite
	},
	swarm_players = {
		nav_tag_volume_layer = "bot_poison_wind",
		damage_type = "poison",
		damage = 0,
		health = 5,
		cast_anim = "attack_shoot_hand",
		create_nav_tag_volume = true,
		action_weight = 1,
		duration = 8,
		considerations = UtilityConsiderations.swarm_players
	},
	defensive_magic_missile = {
		create_nav_tag_volume = true,
		cast_anim = "attack_shoot_staff",
		nav_tag_volume_layer = "bot_poison_wind",
		target_close_distance = 50,
		damage_type = "poison",
		duration = 8,
		face_target_while_casting = true,
		only_cb = true,
		volleys = 1,
		target_close_anim = "attack_shoot_staff",
		volley_delay = 1,
		action_weight = 1,
		considerations = UtilityConsiderations.defensive_magic_missile_drachenfels,
		missile_spawn_offset = {
			0.1281,
			1.1719,
			1.3749
		},
		init_spell_func = function (blackboard)
			blackboard.current_spell = blackboard.magic_missile_ground_data
		end,
		get_throw_position_func = function (unit, blackboard, target_position)
			local ai_inventory_ext = ScriptUnit.has_extension(unit, "ai_inventory_system")
			local weapon_unit = ai_inventory_ext.inventory_item_units[1]
			local throw_pos = Unit.world_position(weapon_unit, Unit.node(weapon_unit, "g_scythe"))
			local target_dir = Vector3.normalize(target_position - throw_pos)

			return throw_pos, target_dir
		end,
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true
		}
	},
	defensive_seeking_bomb = {
		cast_anim = "attack_shoot_staff",
		volleys = 1,
		create_nav_tag_volume = true,
		nav_tag_volume_layer = "bot_poison_wind",
		volley_delay = 0.3,
		action_weight = 1,
		damage_type = "poison",
		duration = 8,
		face_target_while_casting = true,
		only_cb = true,
		considerations = UtilityConsiderations.defensive_seeking_bomb,
		missile_spawn_offset = {
			0.1281,
			1.1719,
			1.3749
		},
		init_spell_func = function (blackboard)
			blackboard.current_spell = blackboard.seeking_bomb_missile_data
		end,
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true
		}
	},
	intro_idle = {
		duration = 21,
		animation = "intro_lord"
	},
	defensive_idle = {
		animation = "idle",
		duration = 1,
		action_weight = 1,
		considerations = {},
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true
		}
	},
	exhausted = {
		dont_face_target = true,
		idle_animation = "idle",
		duration = 6,
		action_weight = 1,
		considerations = {},
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
	defensive_escape_teleport = {
		teleport_effect = "fx/chr_chaos_sorcerer_teleport",
		teleport_end_effect = "fx/drachenfels_boss_teleport_enter",
		teleport_end_anim = "teleport_defensive",
		teleport_effect_trail = "fx/chr_chaos_sorcerer_teleport_direction",
		teleport_start_anim = "teleport_start",
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true
		},
		teleport_pos_func = function (unit, blackboard)
			local spawner = ConflictUtils.get_random_spawner_with_id("sorcerer_boss_drachenfels", blackboard.defensive_spawner)
			blackboard.defensive_spawner = spawner

			return Unit.local_position(spawner, 0)
		end
	},
	defensive_teleport = {
		teleport_effect = "fx/chr_chaos_sorcerer_teleport",
		teleport_end_effect = "fx/drachenfels_boss_teleport_enter",
		teleport_end_anim = "teleport_end",
		teleport_effect_trail = "fx/chr_chaos_sorcerer_teleport_direction",
		teleport_start_anim = "teleport_start",
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true
		}
	},
	teleport_to_death = {
		teleport_effect = "fx/chr_chaos_sorcerer_teleport",
		teleport_end_effect = "fx/drachenfels_boss_teleport_enter",
		dont_face_target = true,
		teleport_end_anim = "float_teleport_death_end",
		teleport_effect_trail = "fx/chr_chaos_sorcerer_teleport_direction",
		teleport_start_anim = "float_teleport_start",
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true
		},
		teleport_start_function = function (unit, blackboard)
			LevelHelper:flow_event(blackboard.world, "cs_boss_death")
			LocomotionUtils.set_animation_driven_movement(unit, true)
		end
	},
	teleport_to_aoe = {
		teleport_effect = "fx/chr_chaos_sorcerer_teleport",
		teleport_end_effect = "fx/drachenfels_boss_teleport_enter",
		teleport_end_anim = "teleport_to_aoe",
		teleport_effect_trail = "fx/chr_chaos_sorcerer_teleport_direction",
		teleport_start_anim = "teleport_start",
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true
		}
	},
	teleport_to_float = {
		teleport_effect = "fx/chr_chaos_sorcerer_teleport",
		teleport_end_effect = "fx/drachenfels_boss_teleport_enter",
		teleport_end_anim = "teleport_to_flying",
		teleport_effect_trail = "fx/chr_chaos_sorcerer_teleport_direction",
		teleport_start_anim = "teleport_start",
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true
		}
	},
	defensive_teleport_float = {
		sound_event = "Play_sorcerer_boss_fly_stop",
		teleport_end_effect = "fx/drachenfels_boss_teleport_enter",
		teleport_effect = "fx/chr_chaos_sorcerer_teleport",
		teleport_end_anim = "float_teleport_end",
		teleport_effect_trail = "fx/chr_chaos_sorcerer_teleport_direction",
		teleport_start_anim = "float_teleport_start",
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true
		}
	},
	offensive_idle = {
		sound_event = "Play_sorcerer_boss_fly_start",
		animation = "float_into",
		duration = 1,
		action_weight = 1,
		considerations = {},
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true
		}
	},
	exhausted_idle = {
		animation = "to_exhausted",
		duration = 3,
		action_weight = 1,
		considerations = {},
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
	offensive_idle_start = {
		sound_event = "Play_sorcerer_boss_fly_start",
		animation = "float_into",
		effect_name = "fx/drachenfels_boss_levitate",
		duration = 1,
		action_weight = 1,
		considerations = {},
		effect_offset = Vector3Box(0, 0.2, 1),
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true
		}
	},
	spawn_trickle = {
		action_weight = 20,
		considerations = UtilityConsiderations.chaos_exalted_sorcerer_drachenfels_tp_trickle
	},
	teleport_attack = {
		action_weight = 20,
		considerations = UtilityConsiderations.teleport_attack
	},
	ring_spawn = {
		action_weight = 20,
		considerations = UtilityConsiderations.chaos_exalted_sorcerer_drachenfels_floating_trickle
	},
	spawn_allies_defensive = {
		dont_rotate = true,
		stay_still = true,
		terror_event_id = "sorcerer_boss_drachenfels_minion",
		duration = 5,
		find_spawn_points = false,
		animation = "idle_guard",
		difficulty_spawn = {
			harder = "chaos_event_defensive",
			hard = "chaos_event_defensive",
			normal = "chaos_event_defensive",
			hardest = "chaos_event_defensive",
			cataclysm = "chaos_event_defensive",
			cataclysm_3 = "chaos_event_defensive",
			cataclysm_2 = "chaos_event_defensive",
			easy = "chaos_event_defensive"
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
	spawn_allies_devensive_intense = {
		dont_rotate = true,
		stay_still = true,
		terror_event_id = "sorcerer_boss_drachenfels_minion",
		duration = 5,
		find_spawn_points = false,
		animation = "idle_guard",
		difficulty_spawn = {
			harder = "chaos_event_defensive_intense",
			hard = "chaos_event_defensive_intense",
			normal = "chaos_event_defensive_intense",
			hardest = "chaos_event_defensive_intense",
			cataclysm = "chaos_event_defensive_intense",
			cataclysm_3 = "chaos_event_defensive_intense",
			cataclysm_2 = "chaos_event_defensive_intense",
			easy = "chaos_event_defensive_intense"
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
	spawn_allies_offensive = {
		dont_rotate = true,
		stay_still = true,
		limit_spawners = 2,
		animation = "idle_guard",
		terror_event_id = "sorcerer_boss_drachenfels_minion",
		duration = 1,
		find_spawn_points = false,
		use_closest_spawners = true,
		difficulty_spawn = {
			harder = "chaos_event_offensive",
			hard = "chaos_event_offensive",
			normal = "chaos_event_offensive",
			hardest = "chaos_event_offensive",
			cataclysm = "chaos_event_offensive",
			cataclysm_3 = "chaos_event_offensive",
			cataclysm_2 = "chaos_event_offensive",
			easy = "chaos_event_offensive"
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
	spawn_allies_trickle = {
		dont_rotate = true,
		stay_still = true,
		action_weight = 5,
		terror_event_id = "sorcerer_boss_drachenfels_minion",
		duration = 0,
		find_spawn_points = false,
		considerations = {},
		difficulty_spawn = {
			harder = "chaos_event_offensive_small",
			hard = "chaos_event_offensive_small",
			normal = "chaos_event_offensive_small",
			hardest = "chaos_event_offensive_small",
			cataclysm = "chaos_event_offensive_small",
			cataclysm_3 = "chaos_event_offensive_small",
			cataclysm_2 = "chaos_event_offensive_small",
			easy = "chaos_event_offensive_small"
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
	spawn_allies_offensive_intense = {
		dont_rotate = true,
		stay_still = true,
		limit_spawners = 2,
		animation = "idle_guard",
		terror_event_id = "sorcerer_boss_drachenfels_minion",
		duration = 1,
		find_spawn_points = false,
		use_closest_spawners = true,
		difficulty_spawn = {
			harder = "chaos_event_offensive_intense",
			hard = "chaos_event_offensive_intense",
			normal = "chaos_event_offensive_intense",
			hardest = "chaos_event_offensive_intense",
			cataclysm = "chaos_event_offensive_intense",
			cataclysm_3 = "chaos_event_offensive_intense",
			cataclysm_2 = "chaos_event_offensive_intense",
			easy = "chaos_event_offensive_intense"
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
	stagger = {
		custom_enter_function = function (unit, blackboard, t, action)
			blackboard.stagger_ignore_anim_cb = true
			local stagger_anims = action.stagger_anims[blackboard.stagger_type]

			return stagger_anims, "idle"
		end,
		stagger_anims = {
			{
				fwd = {
					"stagger_fwd_light"
				},
				bwd = {
					"stagger_bwd_light"
				},
				right = {
					"stagger_left_light"
				},
				left = {
					"stagger_right_light"
				}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd"
				},
				right = {
					"stagger_left"
				},
				left = {
					"stagger_right"
				}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd"
				},
				right = {
					"stagger_left"
				},
				left = {
					"stagger_right"
				}
			},
			{
				fwd = {
					"stagger_fwd_light"
				},
				bwd = {
					"stagger_bwd_light"
				},
				right = {
					"stagger_left_light"
				},
				left = {
					"stagger_right_light"
				}
			},
			{
				fwd = {
					"stagger_fwd_light"
				},
				bwd = {
					"stagger_bwd_light"
				},
				right = {
					"stagger_left_light"
				},
				left = {
					"stagger_right_light"
				}
			},
			{
				fwd = {
					"stagger_fwd_exp"
				},
				bwd = {
					"stagger_bwd_exp"
				},
				right = {
					"stagger_left_exp"
				},
				left = {
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
				right = {
					"stagger_left"
				},
				left = {
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
				right = {
					"stagger_left"
				},
				left = {
					"stagger_right"
				}
			}
		}
	}
}

local function copy_action_data(action_name, source_action, spell_name)
	local action = table.clone(source_action)
	action.considerations = UtilityConsiderations[action_name]
	action.action_weight = 1
	action.available_spells = {
		spell_name
	}

	return action
end

action_data.vortex_skulking = copy_action_data("vortex_skulking", action_data.skulking, "vortex")
action_data.vortex_skulking.search_func_name = "_update_vortex_search"
action_data.tentacle_skulking = copy_action_data("tentacle_skulking", action_data.skulking, "tentacle")
action_data.plague_wave_skulking = copy_action_data("exalted_plague_wave_skulking", action_data.skulking, "plague_wave")
action_data.magic_missile_skulking = copy_action_data("magic_missile_skulking", action_data.skulking, "magic_missile")
action_data.seeking_bomb_missile_skulking = copy_action_data("seeking_bomb_missile_skulking", action_data.skulking, "seeking_bomb_missile")
BreedActions.chaos_exalted_sorcerer_drachenfels = table.create_copy(BreedActions.chaos_exalted_sorcerer_drachenfels, action_data)

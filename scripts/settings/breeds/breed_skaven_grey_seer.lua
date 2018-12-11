local breed_data = {
	walk_speed = 5,
	has_inventory = false,
	use_avoidance = false,
	run_speed = 5,
	awards_positive_reinforcement_message = true,
	boss_staggers = false,
	animation_sync_rpc = "rpc_sync_anim_state_8",
	unit_template = "ai_unit_grey_seer",
	target_selection = "pick_rat_ogre_target_with_weights",
	exchange_order = 1,
	default_spawn_animation = "to_stormfiend_rasknitt_boss",
	stagger_count_reset_time = 5,
	lord_damage_reduction = true,
	poison_resistance = 100,
	override_mover_move_distance = 0.7,
	armored_on_no_damage = true,
	armor_category = 1,
	bot_hitbox_radius_approximation = 0.8,
	hit_reaction = "ai_default",
	combat_music_state = "champion_skaven_grey_seer",
	headshot_coop_stamina_fatigue_type = "headshot_special",
	server_controlled_health_bar = true,
	smart_targeting_outer_width = 1.4,
	bone_lod_level = 0,
	hit_effect_template = "HitEffectsSkavenGreySeer",
	smart_targeting_height_multiplier = 1.5,
	radius = 1,
	smart_object_template = "stormfiend",
	boss = true,
	dialogue_source_name = "skaven_grey_seer",
	difficulty_kill_achievement = "kill_skaven_grey_seer_difficulty_rank",
	race = "skaven",
	behavior = "grey_seer",
	proximity_system_check = true,
	death_reaction = "ai_default",
	perception = "perception_rat_ogre",
	player_locomotion_constrain_radius = 0.7,
	teleport_sound_event = "Play_emitter_grey_seer_lightning_bolt_hit",
	far_off_despawn_immunity = true,
	smart_targeting_width = 0.6,
	perception_continuous = "perception_continuous_rat_ogre",
	initial_is_passive = false,
	base_unit = "units/beings/enemies/skaven_grey_seer/chr_skaven_grey_seer",
	threat_value = 8,
	boost_curve_multiplier_override = 2,
	detection_radius = math.huge,
	perception_weights = {
		target_catapulted_mul = 0.1,
		target_stickyness_bonus_b = 10,
		targeted_by_other_special = -10,
		target_stickyness_duration_a = 1,
		target_stickyness_duration_b = 2,
		aggro_decay_per_sec = 25,
		target_outside_navmesh_mul = 0.7,
		old_target_aggro_mul = 0.5,
		target_disabled_aggro_mul = 0.1,
		max_distance = 50,
		target_stickyness_bonus_a = 50,
		distance_weight = 20,
		target_disabled_mul = 0.15
	},
	max_health = {
		400,
		400,
		600,
		800,
		1200
	},
	bloodlust_health = BreedTweaks.bloodlust_health.monster,
	debug_color = {
		255,
		20,
		20,
		20
	},
	run_on_spawn = AiBreedSnippets.on_grey_seer_spawn,
	run_on_update = AiBreedSnippets.on_grey_seer_update,
	run_on_death = AiBreedSnippets.on_grey_seer_death,
	run_on_despawn = AiBreedSnippets.on_grey_seer_despawn,
	stagger_modifier_function = function (stagger, duration, length, hit_zone_name, blackboard, breed)
		local health_extension = ScriptUnit.extension(blackboard.unit, "health_system")
		local hp = health_extension:current_health_percent()

		if not health_extension.is_invincible and hp < 0.05 and blackboard.current_phase ~= 6 then
			local max_health = health_extension:get_max_health()
			health_extension.is_invincible = true

			health_extension:set_current_damage(max_health * 0.95)

			blackboard.death_sequence = true
		end

		if (blackboard.mounted_data and not blackboard.knocked_off_mount) or blackboard.stagger_count >= 5 then
			stagger = 0
			blackboard.stagger_ignore_anim_cb = true
		else
			blackboard.stagger_ignore_anim_cb = false
		end

		return stagger, duration, length
	end,
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
				"j_neck_1",
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
				"j_neck",
				"j_neck_1",
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
				"j_neck_1",
				"j_spine1",
				"j_hips"
			}
		},
		left_arm = {
			prio = 4,
			actors = {
				"c_leftshoulder",
				"c_leftarm",
				"c_leftforearm",
				"c_lefthand"
			},
			push_actors = {
				"j_spine1",
				"j_leftshoulder",
				"j_leftarm",
				"j_leftforearm"
			}
		},
		right_arm = {
			prio = 4,
			actors = {
				"c_rightshoulder",
				"c_rightarm",
				"c_rightforearm",
				"c_righthand"
			},
			push_actors = {
				"j_spine1",
				"j_rightshoulder",
				"j_rightarm",
				"j_right_forearm"
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
	allowed_layers = {
		planks = 1.5,
		ledges = 1.5,
		bot_ratling_gun_fire = 15,
		jumps = 1.5,
		big_boy_destructible = 1.5,
		ledges_with_fence = 1.5,
		doors = 1.5,
		teleporters = 5,
		bot_poison_wind = 0,
		fire_grenade = 15
	},
	nav_cost_map_allowed_layers = {
		plague_wave = 1,
		troll_bile = 1,
		lamp_oil_fire = 15,
		warpfire_thrower_warpfire = 1,
		vortex_near = 1,
		stormfiend_warpfire = 1,
		vortex_danger_zone = 1
	},
	custom_death_enter_function = function (unit, killer_unit, damage_type, death_hit_zone, t, damage_source)
		local blackboard = BLACKBOARDS[unit]

		if not Unit.alive(killer_unit) then
			return
		end

		QuestSettings.check_killed_lord_as_last_player_standing(killer_unit)
	end
}
Breeds.skaven_grey_seer = table.create_copy(Breeds.skaven_grey_seer, breed_data)
local action_data = {
	ground_combat = {
		spawn_allies_cooldown = 20,
		use_fallback_spawners = true,
		final_phase_teleport_cooldown = 35,
		staggers_until_teleport = 5,
		spawn_group = "grey_seer_spawner",
		terror_event_id = "grey_seer_spawner",
		spawn = "skittergate_boss_event_defensive",
		warp_lightning_spell_cooldown = {
			8,
			6,
			4,
			4
		},
		vermintide_spell_cooldown = {
			12,
			10,
			8,
			8
		},
		teleport_spell_cooldown = {
			10,
			8,
			6,
			6
		},
		override_spawn_groups = {
			"grey_seer_spawner_1",
			"grey_seer_spawner_2",
			"grey_seer_spawner_3",
			"grey_seer_spawner_4"
		},
		spawn_list = {
			"skaven_clan_rat",
			"skaven_clan_rat"
		},
		difficulty_spawn_list = {
			easy = {
				"skaven_clan_rat"
			},
			normal = {
				"skaven_clan_rat"
			},
			hard = {
				"skaven_storm_vermin",
				"skaven_clan_rat"
			},
			harder = {
				"skaven_storm_vermin",
				"skaven_storm_vermin",
				"skaven_clan_rat"
			},
			hardest = {
				"skaven_storm_vermin",
				"skaven_storm_vermin",
				"skaven_storm_vermin_with_shield",
				"skaven_clan_rat"
			}
		},
		difficulty_spawn = {
			harder = "skittergate_boss_event_defensive",
			hard = "skittergate_boss_event_defensive",
			normal = "skittergate_boss_event_defensive",
			hardest = "skittergate_boss_event_defensive",
			easy = "skittergate_boss_event_defensive"
		}
	},
	defensive_idle = {
		idle_animation = "idle_eat_warpstone"
	},
	wounded_idle = {
		idle_animation = "idle_wounded"
	},
	intro_idle = {
		force_idle_animation = true,
		idle_animation = "intro_idle"
	},
	grey_seer_death_sequence = {
		action_weight = 100,
		considerations = UtilityConsiderations.grey_seer_death_sequence
	},
	mount_unit = {
		animation = "back_up_on_back"
	},
	quick_teleport = {
		teleport_effect = "fx/warp_lightning_bolt_impact",
		radius = 4,
		push_close_players = true,
		push_speed = 10,
		catapult_players = true,
		push_speed_z = 6,
		teleport_effect_trail = "fx/chr_chaos_sorcerer_teleport_direction",
		teleport_end_anim = "teleport_end",
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
	quick_teleport_death = {
		teleport_effect = "fx/warp_lightning_bolt_impact",
		radius = 4,
		push_close_players = true,
		push_speed = 10,
		catapult_players = true,
		push_speed_z = 6,
		teleport_effect_trail = "fx/chr_chaos_sorcerer_teleport_direction",
		teleport_end_anim = "teleport_end",
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true
		},
		teleport_start_anim = {
			"teleport_pose_pain_1",
			"teleport_pose_pain_2",
			"teleport_pose_pain_3"
		}
	},
	cast_missile = {
		radius = 4,
		volleys = 3,
		damage_type = "poison",
		volley_delay = 0.5,
		action_weight = 2,
		initial_radius = 2.4,
		create_nav_tag_volume = true,
		nav_tag_volume_layer = "bot_poison_wind",
		cast_anim = "attack_shoot_missile",
		face_target_while_casting = true,
		duration = 8,
		aoe_dot_damage_interval = 1,
		considerations = UtilityConsiderations.grey_seer_missile,
		aoe_init_damage = {
			{
				0,
				1,
				0
			},
			{
				0,
				1,
				0
			},
			{
				3,
				1,
				0
			},
			{
				5,
				1,
				0
			},
			{
				7,
				1,
				0
			}
		},
		aoe_dot_damage = {
			{
				1,
				0,
				0
			},
			{
				2,
				0,
				0
			},
			{
				4,
				0,
				0
			},
			{
				6,
				0,
				0
			},
			{
				10,
				0,
				0
			}
		}
	},
	spawn_plague_wave = {
		spawn_func_name = "spawn_plague_wave",
		max_wave_to_target_dist = 5,
		face_target_while_summoning = true,
		init_func_name = "init_summon_vermintide",
		update_func_name = "update_summon_plague_wave",
		attack_anim = "attack_wave_summon_start",
		action_weight = 2,
		considerations = UtilityConsiderations.grey_seer_vermintide_spell
	},
	stagger = {
		scale_animation_speeds = true,
		stagger_animation_scale = 1.3,
		custom_enter_function = function (unit, blackboard, t, action)
			local stagger_anims = action.stagger_anims[blackboard.stagger_type]
			local idle_event = "idle_eat_warpstone"

			return stagger_anims, idle_event
		end,
		stagger_anims = {
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
					"stagger_bwd_4",
					"stagger_bwd_5"
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
					"stagger_fwd",
					"stagger_fwd_2",
					"stagger_fwd_3",
					"stagger_fwd_4"
				},
				bwd = {
					"stagger_bwd",
					"stagger_bwd_2",
					"stagger_bwd_3",
					"stagger_bwd_4",
					"stagger_bwd_5"
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
					"stagger_fwd",
					"stagger_fwd_2",
					"stagger_fwd_3",
					"stagger_fwd_4"
				},
				bwd = {
					"stagger_bwd",
					"stagger_bwd_2",
					"stagger_bwd_3",
					"stagger_bwd_4",
					"stagger_bwd_5"
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
					"stagger_fwd",
					"stagger_fwd_2",
					"stagger_fwd_3",
					"stagger_fwd_4"
				},
				bwd = {
					"stagger_bwd",
					"stagger_bwd_2",
					"stagger_bwd_3",
					"stagger_bwd_4",
					"stagger_bwd_5"
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
					"stagger_fwd_stab"
				},
				bwd = {
					"stagger_bwd_stab",
					"stagger_bwd_stab_2"
				},
				left = {
					"stagger_left_stab"
				},
				right = {
					"stagger_right_stab"
				}
			},
			{
				fwd = {
					"stagger_fwd_exp_2"
				},
				bwd = {
					"stagger_bwd_exp_2"
				},
				left = {
					"stagger_left_exp_2"
				},
				right = {
					"stagger_right_exp_2"
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
					"stagger_bwd_4",
					"stagger_bwd_5"
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
					"stagger_weakspot"
				},
				bwd = {
					"stagger_weakspot"
				},
				left = {
					"stagger_weakspot"
				},
				right = {
					"stagger_weakspot"
				}
			}
		}
	}
}
BreedActions.skaven_grey_seer = table.create_copy(BreedActions.skaven_grey_seer, action_data)

return

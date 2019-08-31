local breed_data = {
	detection_radius = 12,
	using_combo = true,
	walk_speed = 2,
	leave_walk_distance = 3.5,
	attack_start_slow_fraction = 1,
	patrol_active_target_selection = "storm_patrol_death_squad_target_selection",
	block_stagger_mod_2 = 0.75,
	death_reaction = "ai_default",
	block_stagger_mod = 0.5,
	animation_sync_rpc = "rpc_sync_anim_state_5",
	aoe_radius = 0.4,
	target_selection = "pick_closest_target_with_spillover",
	opt_base_unit = "units/beings/enemies/skaven_stormvermin/chr_skaven_stormvermin_baked",
	aoe_height = 1.7,
	poison_resistance = 100,
	disable_crowd_dispersion = true,
	hit_mass_count_block = 10,
	shield_blunt_block_sound = "blunt_hit_shield_metal",
	slot_template = "skaven_elite",
	scale_death_push = 0.8,
	is_bot_threat = true,
	match_speed_distance = 2,
	default_inventory_template = "stormvermin_sword_and_shield",
	stagger_resistance = 2.25,
	patrol_detection_radius = 10,
	attack_player_sound_event = "Play_clan_rat_attack_player_vce",
	wwise_voice_switch_group = "stormvermin_vce",
	panic_close_detection_radius_sq = 9,
	radius = 1,
	attack_general_sound_event = "Play_clan_rat_attack_vce",
	hit_mass_count = 5,
	patrol_active_perception = "perception_regular",
	shield_slashing_block_sound = "slashing_hit_shield_metal",
	perception_previous_attacker_stickyness_value = -4.5,
	race = "skaven",
	shield_stab_block_sound = "stab_hit_shield_metal",
	unbreakable_shield = true,
	armor_category = 2,
	shield_burning_block_sound = "Play_weapon_fire_torch_metal_shield_hit",
	headshot_coop_stamina_fatigue_type = "headshot_special",
	backstab_player_sound_event = "Play_stormvermin_attack_player_back_vce",
	death_sound_event = "Play_stormvermin_die_vce",
	dodge_timer = 0.35,
	threat_value = 8,
	bone_lod_level = 1,
	smart_targeting_width = 0.2,
	block_stamina = 1,
	is_bot_aid_threat = true,
	behavior = "shield_vermin",
	awards_positive_reinforcement_message = true,
	smart_object_template = "special",
	bots_should_flank = true,
	shield_user = true,
	has_inventory = true,
	attack_start_slow_factor_time = 0.4,
	run_speed = 4.8,
	exchange_order = 3,
	hit_reaction = "ai_default",
	patrol_passive_target_selection = "patrol_passive_target_selection",
	smart_targeting_outer_width = 1,
	unit_variation_setting_name = "skaven_storm_vermin_with_shield",
	hit_effect_template = "HitEffectsStormVermin",
	smart_targeting_height_multiplier = 2.5,
	shield_health = 3,
	horde_behavior = "shield_vermin",
	unit_template = "ai_unit_shield_vermin",
	no_random_stagger_duration = true,
	has_running_attack = true,
	no_stagger_damage_reduction = true,
	perception = "perception_regular",
	player_locomotion_constrain_radius = 0.7,
	husk_hit_reaction_cooldown = 1,
	weapon_reach = 2,
	horde_target_selection = "horde_pick_closest_target_with_spillover",
	use_backstab_vo = true,
	patrol_passive_perception = "perception_regular",
	vortexable = true,
	disable_local_hit_reactions = false,
	base_unit = "units/beings/enemies/skaven_stormvermin/chr_skaven_stormvermin",
	enter_walk_distance = 1.5,
	elite = true,
	shield_opening_event = {
		"idle_shield_down",
		"idle_shield_down_2"
	},
	perception_exceptions = {
		poison_well = true,
		wizard_destructible = true
	},
	size_variation_range = {
		1.05,
		1.15
	},
	max_health = BreedTweaks.max_health.stormvermin_with_shield,
	bloodlust_health = BreedTweaks.bloodlust_health.skaven_elite,
	stagger_duration = {
		0.5,
		1,
		2,
		0.4,
		0.5,
		3,
		1,
		1
	},
	diff_stagger_resist = BreedTweaks.diff_stagger_resist.stormvermin,
	stagger_reduction = BreedTweaks.stagger_reduction.stormvermin,
	hit_mass_counts = BreedTweaks.hit_mass_counts.stormvermin,
	hit_mass_counts_block = BreedTweaks.hit_mass_counts.stormvermin_shield_block,
	wwise_voices = {
		"low",
		"medium",
		"high"
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
			prio = 3,
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
			prio = 3,
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
		tail = {
			prio = 3,
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
local AttackIntensityPerDifficulty = {
	sweep = {
		easy = {
			normal = 1,
			sweep = 2
		},
		normal = {
			normal = 1,
			sweep = 2
		},
		hard = {
			normal = 1,
			sweep = 2
		},
		harder = {
			normal = 1,
			sweep = 2
		},
		hardest = {
			normal = 1,
			sweep = 2
		},
		cataclysm = {
			normal = 1,
			sweep = 2
		},
		cataclysm_2 = {
			normal = 1,
			sweep = 2
		},
		cataclysm_3 = {
			normal = 1,
			sweep = 2
		}
	},
	cleave = {
		easy = {
			cleave = 2,
			normal = 1
		},
		normal = {
			cleave = 2,
			normal = 1
		},
		hard = {
			cleave = 2,
			normal = 1
		},
		harder = {
			cleave = 2,
			normal = 1
		},
		hardest = {
			cleave = 2,
			normal = 1
		},
		cataclysm = {
			cleave = 2,
			normal = 1
		},
		cataclysm_2 = {
			cleave = 2,
			normal = 1
		},
		cataclysm_3 = {
			cleave = 2,
			normal = 1
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
			running = 2.5
		},
		normal = {
			running = 2.5
		},
		hard = {
			running = 2.5
		},
		harder = {
			running = 2.5
		},
		hardest = {
			running = 2.5
		},
		cataclysm = {
			running = 2.5
		},
		cataclysm_2 = {
			running = 2.5
		},
		cataclysm_3 = {
			running = 2.5
		}
	},
	frenzy = {
		easy = {
			normal = 1.5,
			frenzy = 3.5
		},
		normal = {
			normal = 1.5,
			frenzy = 3.5
		},
		hard = {
			normal = 1.5,
			frenzy = 3.5
		},
		harder = {
			normal = 1.5,
			frenzy = 3.5
		},
		hardest = {
			normal = 1.5,
			frenzy = 3.5
		},
		cataclysm = {
			normal = 1.5,
			frenzy = 3.5
		},
		cataclysm_2 = {
			normal = 1.5,
			frenzy = 3.5
		},
		cataclysm_3 = {
			normal = 1.5,
			frenzy = 3.5
		}
	}
}
local COMBO_ALLOWED_STAGGERS = {
	false,
	false,
	true,
	false,
	true,
	true,
	false
}
Breeds.skaven_storm_vermin_with_shield = table.create_copy(Breeds.skaven_storm_vermin_with_shield, breed_data)
local action_data = {
	alerted = {
		no_hesitation = true,
		cooldown = -1,
		action_weight = 1,
		start_anims_name = {
			bwd = "slam_shield_bwd",
			left = "slam_shield_left",
			right = "slam_shield_right",
			fwd = {
				"slam_shield_fwd",
				"slam_shield_fwd_2"
			}
		},
		start_anims_data = {
			slam_shield_fwd = {},
			slam_shield_fwd_2 = {},
			slam_shield_bwd = {
				dir = -1,
				rad = math.pi
			},
			slam_shield_left = {
				dir = 1,
				rad = math.pi / 2
			},
			slam_shield_right = {
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
		considerations = UtilityConsiderations.storm_vermin_special_attack
	},
	running_attack = {
		action_weight = 10,
		considerations = UtilityConsiderations.storm_vermin_running_attack
	},
	special_attack_cleave = {
		offset_forward = 0,
		height = 3,
		cooldown = 1,
		rotation_time = 1,
		bot_threat_start_time = 0.5,
		damage_type = "cutting",
		offset_up = 0,
		attack_anim = "attack_special",
		range = 3,
		damage = 50,
		bot_threat_duration = 0.7,
		attack_intensity_type = "cleave",
		move_anim = "move_fwd",
		width = 0.4,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		difficulty_damage = BreedTweaks.difficulty_damage.elite_attack,
		fatigue_type = BreedTweaks.fatigue_types.elite_sweep.normal_attack,
		ignore_staggers = {
			true,
			false,
			false,
			true,
			false,
			false
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.skaven_elite
	},
	special_attack_sweep = {
		offset_up = 1,
		offset_forward = 0.5,
		height = 0.1,
		cooldown = 1,
		rotation_time = 1,
		bot_threat_duration = 0.7,
		bot_threat_start_time = 0.5,
		damage_type = "cutting",
		range = 2.2,
		damage = 40,
		knocked_down_attack_threshold = 0.6,
		attack_intensity_type = "sweep",
		move_anim = "move_fwd",
		width = 2,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		attack_anim = {
			"attack_pounce",
			"attack_pounce_2"
		},
		knocked_down_attack_anim = {
			"attack_downed",
			"attack_downed_2"
		},
		difficulty_damage = BreedTweaks.difficulty_damage.elite_attack_shielded,
		fatigue_type = BreedTweaks.fatigue_types.elite_sweep.normal_attack,
		ignore_staggers = {
			false,
			false,
			false,
			false,
			false,
			false
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.skaven_elite
	},
	push_attack = {
		hit_react_type = "medium",
		damage = 0,
		impact_push_speed = 7,
		max_impact_push_speed = 8,
		fatigue_type = "blocked_sv_cleave",
		attack_intensity_type = "push",
		action_weight = 1,
		unblockable = true,
		damage_type = "blunt",
		attack_anim = "attack_push",
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.storm_vermin_shield_push_attack,
		init_blackboard = {
			wake_up_push = 0
		},
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			false
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.skaven_elite
	},
	push_attack_wake_up = {
		impact_push_speed = 7,
		damage = 0,
		hit_react_type = "medium",
		max_impact_push_speed = 8,
		fatigue_type = "blocked_sv_cleave",
		attack_intensity_type = "push",
		action_weight = 20,
		damage_type = "blunt",
		unblockable = true,
		attack_anim = "attack_push",
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.storm_vermin_shield_push_attack_wake_up,
		ignore_staggers = {
			true,
			false,
			false,
			true,
			false,
			false
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.skaven_elite
	},
	attack_riposte = {
		fatigue_type = "blocked_attack",
		range = 2,
		damage = 0,
		height = 0,
		cooldown = 1,
		width = 1,
		attack_intensity_type = "normal",
		damage_type = "cutting",
		move_anim = "move_fwd",
		attack_anim = "attack_combo_1",
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		difficulty_damage = BreedTweaks.difficulty_damage.elite_attack_shielded,
		ignore_staggers = {
			true,
			false,
			false,
			true,
			false,
			false
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.skaven_elite
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
		attack_anim = "attack_pounce"
	},
	blocked = {
		blocked_anims = {
			"blocked",
			"blocked_2"
		},
		difficulty_duration = BreedTweaks.blocked_duration.skaven_elite
	},
	stagger = {
		scale_animation_speeds = true,
		custom_enter_function = function (unit, blackboard, t, action)
			assert(ScriptUnit.has_extension(unit, "ai_shield_system"), "skaven_storm_vermin_with_shield dont have ai_shield_user_extension")

			local breed = blackboard.breed
			local current_health = blackboard.current_health_percent
			local blocked = blackboard.blocked
			local stagger = blackboard.stagger
			local stagger_type = blackboard.stagger_type
			local ai_shield_extension = ScriptUnit.extension(unit, "ai_shield_system")
			local shield_user = not ai_shield_extension.shield_broken
			local is_blocking = ai_shield_extension.is_blocking
			local blocked_previous_attack = ai_shield_extension.blocked_previous_attack
			local block_count = 3

			if current_health <= 0.5 then
				block_count = 2
			end

			local stagger_anims, idle_event = nil

			if shield_user and stagger then
				if not blocked and stagger <= block_count and action.shield_block_anims and blocked_previous_attack then
					blackboard.stagger_time = blackboard.stagger_time + math.max(0.5, stagger / block_count) * breed.block_stagger_mod
					stagger_anims = action.shield_block_anims[stagger_type]

					ai_shield_extension:set_is_blocking(true)

					idle_event = "idle_shield_up"
				elseif not blocked and is_blocking and stagger == block_count and action.shield_stagger_anims then
					blackboard.stagger_time = blackboard.stagger_time + stagger / block_count * breed.block_stagger_mod_2
					local index = Math.random(1, 2)
					local anim_table = {
						"idle_shield_down",
						"idle_shield_down_2"
					}
					idle_event = anim_table[index]

					ai_shield_extension:set_is_blocking(false)

					blackboard.wake_up_push = math.huge
					stagger_anims = action.shield_stagger_anims[stagger_type]
				elseif stagger > block_count + 5 and action.shield_block_anims then
					blackboard.stagger_time = 0
					blackboard.stagger = 0

					ai_shield_extension:set_is_blocking(true)

					stagger_anims = action.shield_block_anims[stagger_type]
					blackboard.stagger_time = 0.2
					idle_event = "idle_shield_up"
				else
					stagger_anims = action.stagger_anims[stagger_type]
					blackboard.stagger_time = blackboard.stagger_time + stagger / block_count * breed.block_stagger_mod_2
					local index = Math.random(1, 2)
					local anim_table = {
						"idle_shield_down",
						"idle_shield_down_2"
					}
					idle_event = anim_table[index]

					ai_shield_extension:set_is_blocking(false)
				end
			else
				stagger_anims = action.stagger_anims[stagger_type]
				idle_event = "idle_shield_down"
			end

			return stagger_anims, idle_event, idle_event
		end,
		custom_exit_function = function (unit, blackboard, t)
			local ai_shield_extension = ScriptUnit.extension(unit, "ai_shield_system")

			ai_shield_extension:set_is_blocking(true)
		end,
		shield_stagger_anims = {
			{
				fwd = {
					"stun_fwd_sword"
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
					"stagger_bwd_shield"
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
					"stagger_bwd_shield"
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
					"stun_fwd_sword"
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
					"stagger_bwd_shield"
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
					"stagger_fwd_exp"
				},
				bwd = {
					"stagger_bwd_shield"
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
					"stagger_bwd_shield"
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
			}
		},
		shield_block_anims = {
			{
				fwd = {
					"stun_fwd_sword"
				},
				bwd = {
					"stagger_bwd_shield_up_light",
					"stagger_bwd_shield_up_light_2"
				},
				left = {
					"stagger_left_shield_up_light"
				},
				right = {
					"stagger_right_shield_up_light"
				},
				dwn = {
					"stagger_bwd_shield_up_light_head",
					"stagger_bwd_shield_up_light_head_2"
				}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd_shield_up",
					"stagger_bwd_shield_up_2"
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
					"stagger_bwd_shield_up_2"
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
					"stun_fwd_sword"
				},
				bwd = {
					"stagger_bwd_shield_up",
					"stagger_bwd_shield_up_2"
				},
				left = {
					"stagger_left_shield_up"
				},
				right = {
					"stagger_right_shield_up"
				},
				dwn = {
					"stagger_bwd_shield_up",
					"stagger_bwd_shield_up_2"
				}
			},
			{
				fwd = {
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd_shield_up",
					"stagger_bwd_shield_up_2"
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
					"stagger_fwd_exp"
				},
				bwd = {
					"stagger_bwd_shield_up",
					"stagger_bwd_shield_up_2"
				},
				left = {
					"stagger_left_shield_up"
				},
				right = {
					"stagger_right_shield_up"
				},
				dwn = {
					"stagger_bwd_shield_up",
					"stagger_bwd_shield_up_2"
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
					"stagger_bwd_shield_up",
					"stagger_bwd_shield_up_2"
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
			}
		},
		stagger_anims = {
			{
				fwd = {
					"stun_fwd_open"
				},
				bwd = {
					"stun_bwd_open"
				},
				left = {
					"stun_left_open"
				},
				right = {
					"stun_right_open"
				},
				dwn = {
					"stun_bwd_open"
				}
			},
			{
				fwd = {
					"stagger_fwd_open"
				},
				bwd = {
					"stagger_bwd_open"
				},
				left = {
					"stagger_left_open"
				},
				right = {
					"stagger_right_open"
				},
				dwn = {
					"stagger_bwd_open"
				}
			},
			{
				fwd = {
					"stagger_fwd_open"
				},
				bwd = {
					"stagger_bwd_open"
				},
				left = {
					"stagger_left_open"
				},
				right = {
					"stagger_right_open"
				}
			},
			{
				fwd = {
					"stun_fwd_open"
				},
				bwd = {
					"stun_bwd_open"
				},
				left = {
					"stun_left_open"
				},
				right = {
					"stun_right_open"
				}
			},
			{
				fwd = {
					"stagger_fwd_open"
				},
				bwd = {
					"stagger_bwd_open"
				},
				left = {
					"stagger_left_open"
				},
				right = {
					"stagger_right_open"
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
					"stagger_fwd_open"
				},
				bwd = {
					"stagger_bwd_open"
				},
				left = {
					"stagger_left_open"
				},
				right = {
					"stagger_right_open"
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
					"stagger_fwd_open"
				},
				bwd = {
					"stagger_bwd_open"
				},
				left = {
					"stagger_left_open"
				},
				right = {
					"stagger_right_open"
				}
			}
		}
	}
}
local frenzy_attack = {
	num_attacks = 4,
	combo_anim_variations = 1,
	cooldown = 10,
	fatigue_type = "blocked_attack",
	damage_type = "cutting_berserker",
	moving_attack = true,
	attack_anim = "attack_pounce",
	damage = 20,
	player_push_speed = 4,
	attack_intensity_type = "frenzy",
	action_weight = 10,
	move_anim = "move_fwd",
	difficulty_attack_intensity = AttackIntensityPerDifficulty,
	considerations = UtilityConsiderations.storm_vermin_shield_combo_attack,
	init_blackboard = {
		time_since_last_combo = math.huge
	},
	difficulty_damage = BreedTweaks.difficulty_damage.elite_attack_shielded_frenzy,
	combo_attacks = {
		attack_2 = {
			next_blocked = "attack_3",
			fatigue_type = "blocked_berzerker",
			is_animation_driven = false,
			next_hit = "attack_3",
			no_abort_attack = true,
			bot_threat_duration = 0.2,
			rotation_scheme = "continuous",
			next = "attack_3",
			move_anim = "attack_combo_2",
			anim = "attack_combo_2",
			staggers_allowed = COMBO_ALLOWED_STAGGERS
		},
		attack_3 = {
			next_blocked = "attack_4",
			fatigue_type = "blocked_sv_sweep",
			is_animation_driven = false,
			next_hit = "attack_4",
			no_abort_attack = true,
			bot_threat_duration = 0.2,
			rotation_scheme = "continuous",
			next = "attack_4",
			move_anim = "attack_combo_3",
			anim = "attack_combo_3",
			staggers_allowed = COMBO_ALLOWED_STAGGERS
		},
		attack_4 = {
			fatigue_type = "blocked_berzerker",
			is_animation_driven = false,
			move_anim = "attack_combo_4",
			run_speed = 1.5,
			bot_threat_duration = 0.2,
			rotation_scheme = "continuous",
			damage_done_time = 1.1,
			next = "done",
			allow_push_stagger = true,
			anim = "attack_combo_4",
			staggers_allowed = COMBO_ALLOWED_STAGGERS
		}
	},
	target_type_exceptions = {
		poison_well = {
			attack_anim = "poison_well"
		}
	}
}
action_data.frenzy_attack = table.create_copy(action_data.frenzy_attack, frenzy_attack)
action_data.frenzy_attack.considerations = UtilityConsiderations.storm_vermin_shield_combo_attack
action_data.frenzy_attack.combo_attacks.attack_1 = {
	next_blocked = "attack_2",
	rotation_scheme = "continuous",
	is_animation_driven = false,
	next_hit = "attack_2",
	no_abort_attack = true,
	bot_threat_duration = 0.2,
	fatigue_type = "blocked_berzerker",
	combo_cooldown_start = true,
	next = "attack_2",
	attack_intensity_type = "frenzy",
	move_anim = "attack_combo_1",
	anim = "attack_combo_1",
	difficulty_attack_intensity = AttackIntensityPerDifficulty,
	staggers_allowed = COMBO_ALLOWED_STAGGERS
}
action_data.frenzy_attack_ranged = table.create_copy(action_data.frenzy_attack_ranged, frenzy_attack)
action_data.frenzy_attack_ranged.considerations = UtilityConsiderations.storm_vermin_shield_combo_attack
action_data.frenzy_attack_ranged.combo_attacks.attack_1 = {
	next_blocked = "attack_2",
	rotation_scheme = "continuous",
	is_animation_driven = false,
	next_hit = "attack_2",
	no_abort_attack = true,
	bot_threat_duration = 0.2,
	combo_cooldown_start = true,
	fatigue_type = "blocked_berzerker",
	next = "attack_2",
	run_speed = 3,
	attack_intensity_type = "frenzy",
	anim = "attack_combo_1",
	difficulty_attack_intensity = AttackIntensityPerDifficulty,
	staggers_allowed = COMBO_ALLOWED_STAGGERS
}
BreedActions.skaven_storm_vermin_with_shield = table.create_copy(BreedActions.skaven_storm_vermin_with_shield, action_data)

return

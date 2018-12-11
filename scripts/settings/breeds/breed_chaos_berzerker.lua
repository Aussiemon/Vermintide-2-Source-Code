local MOVING_STAGGERS = {
	"run_stagger_left"
}
local MOVING_HVY_STAGGERS = {
	"run_stagger_right"
}
local breed_data = {
	patrol_active_perception = "perception_regular",
	walk_speed = 2.25,
	attack_start_slow_fraction = 0.5,
	patrol_active_target_selection = "storm_patrol_death_squad_target_selection",
	exchange_order = 3,
	berzerker_alert = true,
	animation_sync_rpc = "rpc_sync_anim_state_7",
	look_at_range = 30,
	death_reaction = "ai_default",
	opt_base_unit = "units/beings/enemies/chaos_berzerker/chr_chaos_berzerker_baked",
	dont_wield_weapon_on_patrol = true,
	has_inventory = true,
	is_bot_threat = true,
	bone_lod_level = 0,
	scale_death_push = 0.65,
	detection_radius = 24,
	smart_object_template = "special",
	match_speed_distance = 2,
	default_inventory_template = "berzerker_dual_axes",
	stagger_resistance = 3,
	patrol_detection_radius = 10,
	flingable = true,
	wwise_voice_switch_group = "marauder_vce_variations",
	panic_close_detection_radius_sq = 9,
	radius = 1.25,
	use_slot_type = "medium",
	attack_player_sound_event = "Play_enemy_berserker_attack_player_vce",
	hit_mass_count = 4,
	stagger_threshold_explosion = 5,
	attack_general_sound_event = "Play_enemy_berserker_attack_husk_vce",
	perception_previous_attacker_stickyness_value = 0,
	race = "chaos",
	uses_attack_sfx_callback = true,
	proximity_system_check = true,
	poison_resistance = 70,
	armor_category = 5,
	dialogue_source_name = "chaos_berzerker",
	aoe_height = 1.4,
	backstab_player_sound_event = "Play_enemy_marauder_attack_player_back_vce",
	death_sound_event = "Play_enemy_marauder_death_vce",
	dodge_timer = 0.15,
	has_running_attack = true,
	threat_value = 5,
	awards_positive_reinforcement_message = true,
	smart_targeting_width = 0.2,
	berzerking_stagger_time = 0.75,
	is_bot_aid_threat = true,
	behavior = "berzerker",
	run_speed_interpolation_factor = 0.5,
	during_horde_detection_radius = 24,
	force_walk_while_tired = true,
	target_selection = "pick_closest_target_with_spillover",
	attack_start_slow_factor_time = 0.35,
	run_speed = 6,
	aim_template = "chaos_marauder",
	stagger_threshold_heavy = 3,
	stagger_threshold_light = 0.75,
	hit_reaction = "ai_default",
	patrol_passive_target_selection = "patrol_passive_target_selection",
	hit_effect_template = "HitEffectsChaosBerzerker",
	using_combo = true,
	passive_walk_speed = 2,
	horde_behavior = "berzerker",
	unit_template = "ai_unit_berzerker",
	leave_walk_distance = 3.5,
	perception = "perception_regular",
	player_locomotion_constrain_radius = 0.7,
	stagger_threshold_medium = 1.5,
	weapon_reach = 2,
	horde_target_selection = "horde_pick_closest_target_with_spillover",
	use_backstab_vo = true,
	patrol_passive_perception = "perception_regular",
	vortexable = true,
	allow_aoe_push = true,
	base_unit = "units/beings/enemies/chaos_berzerker/chr_chaos_berzerker",
	enter_walk_distance = 1.5,
	elite = true,
	size_variation_range = {
		1,
		1
	},
	passive_in_patrol_start_anim = {
		"move_fwd_4",
		"move_fwd_5",
		"move_fwd_6"
	},
	stagger_modifier_function = function (stagger, duration, length, hit_zone_name, blackboard, breed)
		if blackboard.stagger_type == 3 then
			if stagger == 3 and blackboard.heavy_stagger_immune_time then
				stagger = 0
				duration = 0
				length = 0
			elseif stagger ~= 3 and blackboard.stagger_immune_time then
				stagger = 0
				duration = 0
				length = 0
			end
		end

		return stagger, duration, length
	end,
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
		j_taill = 0.05,
		j_leftarm = 0.2,
		j_leftforearm = 0.2,
		j_leftleg = 0.2,
		j_tail3 = 0.05,
		j_neck1 = 0.3,
		j_leftupleg = 0.2,
		j_rightshoulder = 0.3,
		j_rightarm = 0.2,
		j_righttoebase = 0.2,
		j_tail4 = 0.05,
		j_hips = 0.3,
		j_spine1 = 0.3,
		j_rightleg = 0.2,
		j_leftfoot = 0.2,
		j_leftshoulder = 0.3,
		j_tail5 = 0.05,
		j_rightupleg = 0.2,
		j_righthand = 0.2,
		j_lefttoebase = 0.2,
		j_head = 0.3,
		j_tail6 = 0.05,
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
		18,
		18,
		27,
		36,
		54
	},
	bloodlust_health = BreedTweaks.bloodlust_health.chaos_elite,
	diff_stagger_resist = {
		2.7,
		2.7,
		3.6,
		4.5,
		4.5
	},
	stagger_reduction = {
		0.75,
		0.75,
		1,
		1.25,
		1.25
	},
	stagger_duration = {
		0.25,
		1.75,
		3.5,
		0.5,
		0.5,
		4,
		0.25,
		0.25
	},
	hit_mass_counts = {
		4,
		4,
		6,
		8,
		8
	},
	num_push_anims = {
		push_backward = 2
	},
	wwise_voices = {
		"marauder_andreas",
		"marauder_olof"
	},
	debug_color = {
		255,
		200,
		40,
		40
	}
}
Breeds.chaos_berzerker = table.create_copy(Breeds.chaos_berzerker, breed_data)
local BreedActionDimishingDamageDifficulty = {
	easy = {
		{
			damage = 2,
			cooldown = {
				2,
				5
			}
		},
		{
			damage = 1.5,
			cooldown = {
				2,
				5
			}
		},
		{
			damage = 1,
			cooldown = {
				2,
				5
			}
		},
		{
			damage = 1,
			cooldown = {
				2,
				5
			}
		},
		{
			damage = 1,
			cooldown = {
				3,
				7
			}
		},
		{
			damage = 1,
			cooldown = {
				3,
				7
			}
		},
		{
			damage = 1,
			cooldown = {
				3,
				7
			}
		},
		{
			damage = 1,
			cooldown = {
				4,
				8
			}
		},
		{
			damage = 1,
			cooldown = {
				4,
				8
			}
		}
	},
	normal = {
		{
			damage = 2,
			cooldown = {
				2,
				3
			}
		},
		{
			damage = 2,
			cooldown = {
				2,
				3
			}
		},
		{
			damage = 1.5,
			cooldown = {
				2,
				3
			}
		},
		{
			damage = 1,
			cooldown = {
				2.25,
				3.25
			}
		},
		{
			damage = 1,
			cooldown = {
				2.5,
				3.5
			}
		},
		{
			damage = 1,
			cooldown = {
				2.75,
				3.75
			}
		},
		{
			damage = 1,
			cooldown = {
				3,
				4
			}
		},
		{
			damage = 1,
			cooldown = {
				3.25,
				4.25
			}
		},
		{
			damage = 1,
			cooldown = {
				3.5,
				4.5
			}
		}
	},
	hard = {
		{
			damage = 2,
			cooldown = {
				1,
				1.5
			}
		},
		{
			damage = 2,
			cooldown = {
				1,
				1.5
			}
		},
		{
			damage = 1.5,
			cooldown = {
				1,
				1.5
			}
		},
		{
			damage = 1,
			cooldown = {
				1.25,
				1.75
			}
		},
		{
			damage = 1,
			cooldown = {
				1.5,
				2
			}
		},
		{
			damage = 1,
			cooldown = {
				1.75,
				2.25
			}
		},
		{
			damage = 1,
			cooldown = {
				2,
				2.5
			}
		},
		{
			damage = 1,
			cooldown = {
				2.25,
				3.25
			}
		},
		{
			damage = 1,
			cooldown = {
				2.5,
				3.5
			}
		}
	},
	survival_hard = {
		{
			damage = 2,
			cooldown = {
				1,
				1.5
			}
		},
		{
			damage = 2,
			cooldown = {
				1,
				1.5
			}
		},
		{
			damage = 1.5,
			cooldown = {
				1,
				1.5
			}
		},
		{
			damage = 1,
			cooldown = {
				1.25,
				1.75
			}
		},
		{
			damage = 1,
			cooldown = {
				1.5,
				2
			}
		},
		{
			damage = 1,
			cooldown = {
				1.75,
				2.25
			}
		},
		{
			damage = 1,
			cooldown = {
				2,
				2.5
			}
		},
		{
			damage = 1,
			cooldown = {
				2.25,
				3.25
			}
		},
		{
			damage = 1,
			cooldown = {
				2.5,
				3.5
			}
		}
	},
	harder = {
		{
			damage = 2.5,
			cooldown = {
				0.5,
				1
			}
		},
		{
			damage = 2,
			cooldown = {
				0.5,
				1
			}
		},
		{
			damage = 1.5,
			cooldown = {
				0.5,
				1
			}
		},
		{
			damage = 1,
			cooldown = {
				0.5,
				1
			}
		},
		{
			damage = 1,
			cooldown = {
				0.6,
				1.1
			}
		},
		{
			damage = 1,
			cooldown = {
				0.7,
				1.2
			}
		},
		{
			damage = 1,
			cooldown = {
				0.8,
				1.3
			}
		},
		{
			damage = 1,
			cooldown = {
				0.9,
				1.4
			}
		},
		{
			damage = 1,
			cooldown = {
				1,
				1.5
			}
		}
	},
	survival_harder = {
		{
			damage = 2.5,
			cooldown = {
				0.5,
				1
			}
		},
		{
			damage = 2,
			cooldown = {
				0.5,
				1
			}
		},
		{
			damage = 1.5,
			cooldown = {
				0.5,
				1
			}
		},
		{
			damage = 1,
			cooldown = {
				0.5,
				1
			}
		},
		{
			damage = 1,
			cooldown = {
				0.6,
				1.1
			}
		},
		{
			damage = 1,
			cooldown = {
				0.7,
				1.2
			}
		},
		{
			damage = 1,
			cooldown = {
				0.8,
				1.3
			}
		},
		{
			damage = 1,
			cooldown = {
				0.9,
				1.4
			}
		},
		{
			damage = 1,
			cooldown = {
				1,
				1.5
			}
		}
	},
	hardest = {
		{
			damage = 2.5,
			cooldown = {
				0,
				0.25
			}
		},
		{
			damage = 2,
			cooldown = {
				0,
				0.25
			}
		},
		{
			damage = 2,
			cooldown = {
				0,
				0.25
			}
		},
		{
			damage = 1.8,
			cooldown = {
				0,
				0.3
			}
		},
		{
			damage = 1.6,
			cooldown = {
				0,
				0.35
			}
		},
		{
			damage = 1.4,
			cooldown = {
				0,
				0.4
			}
		},
		{
			damage = 1.2,
			cooldown = {
				0,
				0.45
			}
		},
		{
			damage = 1,
			cooldown = {
				0,
				0.5
			}
		},
		{
			damage = 1,
			cooldown = {
				0,
				0.5
			}
		}
	},
	survival_hardest = {
		{
			damage = 2.5,
			cooldown = {
				0,
				0.25
			}
		},
		{
			damage = 2,
			cooldown = {
				0,
				0.25
			}
		},
		{
			damage = 2,
			cooldown = {
				0,
				0.25
			}
		},
		{
			damage = 1.8,
			cooldown = {
				0,
				0.3
			}
		},
		{
			damage = 1.6,
			cooldown = {
				0,
				0.35
			}
		},
		{
			damage = 1.4,
			cooldown = {
				0,
				0.4
			}
		},
		{
			damage = 1.2,
			cooldown = {
				0,
				0.45
			}
		},
		{
			damage = 1,
			cooldown = {
				0,
				0.5
			}
		},
		{
			damage = 1,
			cooldown = {
				0,
				0.5
			}
		}
	}
}
local DEFAULT_ALLOWED_STAGGERS = {
	true,
	false,
	false,
	true,
	true,
	false,
	true
}
local OPENING_ALLOWED_STAGGERS = {
	true,
	true,
	false,
	true,
	true,
	false,
	true
}
local JUMPATTACK_ALLOWED_STAGGERS = {
	false,
	false,
	false,
	false,
	false,
	true,
	false
}
local JUMPATTACK_IGNORE_STAGGERS = {
	true,
	true,
	true,
	true,
	true,
	false,
	true
}
local action_data = {
	alerted = {
		no_hesitation = true,
		cooldown = -1,
		override_time_alerted = 0.2,
		action_weight = 1,
		start_anims_name = {
			bwd = "alerted_bwd",
			fwd = "alerted_fwd",
			left = "alerted_left",
			right = "alerted_right"
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
		alt_walk_anim = "move_fwd_jog",
		cooldown = -1,
		action_weight = 1,
		alt_tired_anim = "move_fwd_jog",
		custom_is_tired_function = function (unit, blackboard)
			if blackboard.time_since_last_combo and blackboard.time_since_last_combo <= 8 then
				return true
			end

			return false
		end,
		start_alt_tired_anims_name = {
			bwd = "move_start_bwd_jog",
			fwd = "move_start_fwd_jog",
			left = "move_start_left_jog",
			right = "move_start_right_jog"
		},
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
			},
			move_start_fwd_jog = {},
			move_start_bwd_jog = {
				dir = -1,
				rad = math.pi
			},
			move_start_left_jog = {
				dir = 1,
				rad = math.pi / 2
			},
			move_start_right_jog = {
				dir = -1,
				rad = math.pi / 2
			}
		},
		considerations = UtilityConsiderations.clan_rat_follow
	},
	running_attack = {
		damage_type = "cutting",
		player_push_speed = 3,
		fatigue_type = "blocked_running",
		action_weight = 10,
		moving_attack = true,
		default_attack = {
			anims = "attack_lunge"
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
		considerations = UtilityConsiderations.chaos_berzerker_running_attack,
		difficulty_diminishing_damage = BreedActionDimishingDamageDifficulty,
		ignore_staggers = JUMPATTACK_IGNORE_STAGGERS
	},
	normal_attack = {
		player_push_speed = 3,
		fatigue_type = "blocked_attack",
		action_weight = 1,
		move_anim = "move_fwd",
		damage_type = "cutting",
		default_attack = {
			anims = {
				"attack_pounce",
				"attack_pounce_2"
			},
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
				22.5,
				12,
				6
			}
		},
		considerations = UtilityConsiderations.berzerker_attack,
		difficulty_diminishing_damage = BreedActionDimishingDamageDifficulty
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
		moving_stagger_minimum_destination_distance = 4,
		scale_animation_speeds = true,
		moving_stagger_threshold = 2.5,
		custom_enter_function = function (unit, blackboard, t, action)
			local combo = blackboard.combo_attack_data

			if combo and combo.aborted then
				local berzerker_stagger_multiplier = (blackboard.stagger_type < 3 and math.clamp(blackboard.stagger_type - 1, 1, 1.5)) or 1

				if blackboard.stagger_type ~= 6 and blackboard.stagger_type ~= 3 then
					blackboard.stagger_ignore_anim_cb = true
					blackboard.stagger_time = t + blackboard.breed.berzerking_stagger_time * berzerker_stagger_multiplier
				end
			end

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
				},
				moving_fwd = MOVING_STAGGERS,
				moving_bwd = MOVING_STAGGERS,
				moving_left = MOVING_STAGGERS,
				moving_right = MOVING_STAGGERS,
				moving_dwn = MOVING_STAGGERS
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
				},
				moving_fwd = MOVING_STAGGERS,
				moving_bwd = MOVING_STAGGERS,
				moving_left = MOVING_STAGGERS,
				moving_right = MOVING_STAGGERS,
				moving_dwn = MOVING_STAGGERS
			},
			{
				fwd = {
					"stagger_fwd_heavy",
					"stagger_fwd_heavy_2",
					"stagger_fwd_heavy_3",
					"stagger_fwd_heavy_4"
				},
				bwd = {
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
					"stagger_bwd_heavy",
					"stagger_bwd_heavy_2",
					"stagger_bwd_heavy_3",
					"stagger_bwd_heavy_4"
				},
				moving_fwd = MOVING_HVY_STAGGERS,
				moving_bwd = MOVING_HVY_STAGGERS,
				moving_left = MOVING_HVY_STAGGERS,
				moving_right = MOVING_HVY_STAGGERS,
				moving_dwn = MOVING_HVY_STAGGERS
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
				},
				moving_fwd = MOVING_STAGGERS,
				moving_bwd = MOVING_STAGGERS,
				moving_left = MOVING_STAGGERS,
				moving_right = MOVING_STAGGERS,
				moving_dwn = MOVING_STAGGERS
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
				},
				moving_fwd = MOVING_STAGGERS,
				moving_bwd = MOVING_STAGGERS,
				moving_left = MOVING_STAGGERS,
				moving_right = MOVING_STAGGERS,
				moving_dwn = MOVING_STAGGERS
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
				},
				moving_fwd = MOVING_HVY_STAGGERS,
				moving_bwd = MOVING_HVY_STAGGERS,
				moving_left = MOVING_HVY_STAGGERS,
				moving_right = MOVING_HVY_STAGGERS,
				moving_dwn = MOVING_HVY_STAGGERS
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
				},
				moving_fwd = MOVING_STAGGERS,
				moving_bwd = MOVING_STAGGERS,
				moving_left = MOVING_STAGGERS,
				moving_right = MOVING_STAGGERS,
				moving_dwn = MOVING_STAGGERS
			}
		}
	}
}
local frenzy_attack = {
	action_weight = 10,
	combo_anim_variations = 3,
	combo_attack_cycle_index = 0,
	cooldown = -1,
	num_attacks = 3,
	fatigue_type = "blocked_attack",
	attack_intensity = 5,
	moving_attack = true,
	attack_anim = "attack_pounce",
	damage_type = "cutting_berserker",
	player_push_speed = 4,
	move_anim = "move_fwd",
	considerations = UtilityConsiderations.berzerker_frenzy_attack,
	ignore_staggers = DEFAULT_ALLOWED_STAGGERS,
	attack_directions = {
		attack_combo_1_01 = "left",
		attack_combo_1_02 = "left",
		attack_combo_3_04 = "right",
		attack_combo_3_01 = "right",
		attack_combo_3_03 = "right",
		attack_pounce_2 = "right",
		attack_combo_3_02 = "left",
		attack_combo_1_05 = "left",
		attack_combo_3_finish = "left",
		attack_combo_1_04 = "right",
		attack_combo_1_03 = "right",
		attack_combo_2_01 = "right",
		attack_move = "left",
		attack_lunge = "left",
		attack_run = "left",
		attack_combo_2_05 = "right",
		attack_combo_2_04 = "left",
		attack_combo_2_03 = "right",
		attack_combo_2_02 = "left",
		attack_combo_2_finish = "left",
		attack_pounce = "left"
	},
	init_blackboard = {
		time_since_last_combo = math.huge
	},
	combo_attacks = {
		attack_1b = {
			rotation_scheme = "continuous",
			attack_start_slow_fraction = 0.75,
			run_speed = 4,
			attack_start_slow_factor_time = 0.25,
			no_abort_attack = true,
			fatigue_type = "blocked_berzerker",
			combo_cooldown_start = true,
			next = "attack_2",
			anim = {
				"attack_combo_1_01",
				"attack_combo_2_01",
				"attack_combo_3_01"
			},
			move_anim = {
				"attack_combo_1_01",
				"attack_combo_2_01",
				"attack_combo_3_01"
			},
			ignore_staggers = DEFAULT_ALLOWED_STAGGERS
		},
		attack_2 = {
			attack_start_slow_fraction = 0.65,
			rotation_scheme = "continuous",
			run_speed = 4,
			attack_start_slow_factor_time = 0.25,
			no_abort_attack = true,
			fatigue_type = "blocked_berzerker",
			next = "attack_3",
			anim = {
				"attack_combo_1_02",
				"attack_combo_2_02",
				"attack_combo_3_02"
			},
			move_anim = {
				"attack_combo_1_02",
				"attack_combo_2_02",
				"attack_combo_3_02"
			},
			ignore_staggers = DEFAULT_ALLOWED_STAGGERS
		},
		attack_3 = {
			attack_start_slow_fraction = 0.5,
			rotation_scheme = "continuous",
			run_speed = 4,
			attack_start_slow_factor_time = 0.25,
			no_abort_attack = true,
			fatigue_type = "blocked_berzerker",
			next = "attack_4",
			anim = {
				"attack_combo_1_03",
				"attack_combo_2_03",
				"attack_combo_3_03"
			},
			move_anim = {
				"attack_combo_1_03",
				"attack_combo_2_03",
				"attack_combo_3_03"
			},
			ignore_staggers = DEFAULT_ALLOWED_STAGGERS
		},
		attack_3b = {
			attack_start_slow_fraction = 0.5,
			rotation_scheme = "continuous",
			run_speed = 5,
			attack_start_slow_factor_time = 0.25,
			no_abort_attack = true,
			fatigue_type = "blocked_berzerker",
			next = "attack_medium",
			anim = {
				"attack_combo_1_04",
				"attack_combo_2_04",
				"attack_combo_3_04"
			},
			move_anim = {
				"attack_combo_1_04",
				"attack_combo_2_04",
				"attack_combo_3_04"
			},
			ignore_staggers = DEFAULT_ALLOWED_STAGGERS
		},
		attack_4 = {
			attack_start_slow_fraction = 0.5,
			rotation_scheme = "continuous",
			run_speed = 3.5,
			attack_start_slow_factor_time = 0.25,
			no_abort_attack = true,
			fatigue_type = "blocked_berzerker",
			move_anim = "attack_combo_2_04",
			anim = "attack_combo_2_04",
			anim = {
				"attack_combo_1_04",
				"attack_combo_2_04",
				"attack_combo_3_04"
			},
			move_anim = {
				"attack_combo_1_04",
				"attack_combo_2_04",
				"attack_combo_3_04"
			},
			ignore_staggers = DEFAULT_ALLOWED_STAGGERS,
			next = {
				"attack_5",
				"attack_5",
				"attack_heavy"
			}
		},
		attack_5 = {
			attack_start_slow_fraction = 0.75,
			rotation_scheme = "continuous",
			run_speed = 3.5,
			attack_start_slow_factor_time = 0.35,
			no_abort_attack = true,
			fatigue_type = "blocked_berzerker",
			next = "attack_heavy",
			anim = {
				"attack_combo_1_05",
				"attack_combo_2_05",
				"attack_combo_3_05"
			},
			move_anim = {
				"attack_combo_1_05",
				"attack_combo_2_05",
				"attack_combo_3_05"
			},
			ignore_staggers = DEFAULT_ALLOWED_STAGGERS
		},
		attack_heavy = {
			rotation_scheme = "continuous",
			block_interrupts = false,
			is_animation_driven = false,
			attack_start_slow_factor_time = 0.35,
			run_speed = 3.5,
			bot_threat_duration = 0.2,
			fatigue_type = "blocked_sv_cleave",
			attack_start_slow_fraction = 0.75,
			next = "done",
			anim = {
				"attack_combo_2_finish",
				"attack_combo_2_finish",
				"attack_combo_3_finish"
			},
			move_anim = {
				"attack_combo_2_finish",
				"attack_combo_2_finish",
				"attack_combo_3_finish"
			},
			ignore_staggers = OPENING_ALLOWED_STAGGERS,
			damage_done_time = {
				attack_combo_2_finish = 1.2463768115942029,
				attack_combo_3_finish = 1
			},
			difficulty_damage = {
				easy = {
					5,
					4,
					2
				},
				normal = {
					8,
					4,
					2
				},
				hard = {
					14,
					8,
					4
				},
				survival_hard = {
					14,
					8,
					4
				},
				harder = {
					25,
					12,
					6
				},
				survival_harder = {
					25,
					12,
					6
				},
				hardest = {
					40,
					16,
					8
				},
				survival_hardest = {
					40,
					16,
					8
				}
			}
		}
	},
	damage = {
		4,
		2,
		1
	},
	difficulty_damage = {
		easy = {
			2,
			2,
			2
		},
		normal = {
			2,
			2,
			2
		},
		hard = {
			7,
			6,
			4
		},
		survival_hard = {
			7,
			6,
			4
		},
		harder = {
			12,
			12,
			6
		},
		survival_harder = {
			12,
			12,
			6
		},
		hardest = {
			20,
			16,
			8
		},
		survival_hardest = {
			20,
			16,
			8
		}
	},
	difficulty_diminishing_damage = BreedActionDimishingDamageDifficulty,
	target_type_exceptions = {
		poison_well = {
			attack_anim = "poison_well"
		}
	}
}
action_data.frenzy_attack = table.create_copy(action_data.frenzy_attack, frenzy_attack)
action_data.frenzy_attack.considerations = UtilityConsiderations.berzerker_frenzy_attack
action_data.frenzy_attack.combo_attacks.attack_1 = {
	fatigue_type = "blocked_berzerker",
	run_speed = 5,
	no_abort_attack = true,
	bot_threat_duration = 0.2,
	rotation_scheme = "continuous",
	combo_cooldown_start = true,
	next = "attack_2",
	anim = {
		"attack_combo_1_01",
		"attack_combo_2_01",
		"attack_combo_3_01"
	},
	move_anim = {
		"attack_combo_1_01",
		"attack_combo_2_01",
		"attack_combo_3_01"
	},
	ignore_staggers = DEFAULT_ALLOWED_STAGGERS
}
BreedActions.chaos_berzerker = table.create_copy(BreedActions.chaos_berzerker, action_data)

return

local breed_data = {
	wwise_voice_switch_group = "clan_rat_vce",
	walk_speed = 2.75,
	leave_walk_distance = 5,
	poison_resistance = 70,
	patrol_active_target_selection = "storm_patrol_death_squad_target_selection",
	enter_walk_distance = 2,
	animation_sync_rpc = "rpc_sync_anim_state_7",
	detection_radius = 12,
	smart_targeting_outer_width = 0.75,
	scale_death_push = 0.8,
	has_inventory = true,
	player_dodged_radius = 0.95,
	attack_general_sound_event = "Play_clan_rat_attack_husk_vce",
	uses_attack_sfx_callback = true,
	increase_incoming_damage_fx_node = "c_head",
	bone_lod_level = 1,
	aoe_height = 1.4,
	default_inventory_template = "default",
	stagger_resistance = 1.5,
	patrol_detection_radius = 10,
	flingable = true,
	panic_close_detection_radius_sq = 9,
	radius = 2,
	has_running_attack = true,
	hit_mass_count = 1.5,
	patrol_active_perception = "perception_regular",
	perception_previous_attacker_stickyness_value = -7.75,
	race = "skaven",
	death_reaction = "ai_default",
	armor_category = 1,
	backstab_player_sound_event = "Play_clan_rat_attack_player_back_vce",
	death_sound_event = "Play_clan_rat_die_vce",
	smart_targeting_width = 0.2,
	behavior = "pack_rat",
	during_horde_detection_radius = 15,
	attack_player_sound_event = "Play_clan_rat_attack_player_vce",
	target_selection = "pick_closest_target_with_spillover",
	run_speed = 4.75,
	exchange_order = 4,
	increase_incoming_damage_fx = "fx/chr_enemy_clanrat_damage_buff",
	hit_reaction = "ai_default",
	patrol_passive_target_selection = "patrol_passive_target_selection",
	player_dodged_cone = 0.5,
	unit_variation_setting_name = "skaven_clan_rat",
	hit_effect_template = "HitEffectsSkavenClanRat",
	smart_targeting_height_multiplier = 2,
	passive_walk_speed = 2,
	horde_behavior = "horde_rat",
	unit_template = "ai_unit_clan_rat",
	smart_object_template = "default_clan_rat",
	stagger_duration_mod = 1,
	perception = "perception_regular",
	player_locomotion_constrain_radius = 0.7,
	weapon_reach = 2.1,
	horde_target_selection = "horde_pick_closest_target_with_spillover",
	use_backstab_vo = true,
	patrol_passive_perception = "perception_regular",
	vortexable = true,
	death_squad_detection_radius = 8,
	base_unit = "units/beings/enemies/skaven_clan_rat/chr_skaven_clan_rat",
	threat_value = 1.5,
	opt_base_unit = {
		"units/beings/enemies/skaven_clan_rat/chr_skaven_clan_rat_baked_var1",
		"units/beings/enemies/skaven_clan_rat/chr_skaven_clan_rat_baked_var2",
		"units/beings/enemies/skaven_clan_rat/chr_skaven_clan_rat_baked_var3",
		"units/beings/enemies/skaven_clan_rat/chr_skaven_clan_rat_baked_var4"
	},
	size_variation_range = {
		0.95,
		1.05
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
		j_hips = 0.4,
		j_leftshoulder = 0.3,
		j_rightleg = 0.2,
		j_leftfoot = 0.2,
		j_spine1 = 0.4,
		j_tail5 = 0.05,
		j_rightupleg = 0.2,
		j_tail6 = 0.05,
		j_lefttoebase = 0.2,
		j_head = 0.3,
		j_neck = 0.3,
		j_spine = 0.4,
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
		2.1,
		2.1,
		2.8,
		3.5,
		3.5
	},
	stagger_duration = {
		1,
		2,
		3.25,
		1.5,
		2,
		5,
		1,
		1
	},
	hit_mass_counts = {
		1.5,
		1.5,
		2.25,
		3,
		3
	},
	num_push_anims = {
		push_backward = 2
	},
	wwise_voices = {
		"indy_low",
		"indy_medium",
		"indy_high",
		"james_low",
		"james_medium",
		"james_high",
		"danijel_high",
		"danijel_medium",
		"danijel_low",
		"magnus_high",
		"magnus_low",
		"magnus_medium"
	},
	debug_color = {
		255,
		200,
		40,
		40
	},
	stagger_duration_difficulty_mod = {
		harder = 0.75,
		hard = 0.9,
		normal = 1,
		hardest = 0.6,
		easy = 1
	},
	stagger_modifier_function = function (stagger, duration, length, hit_zone_name, blackboard, breed, direction)
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
	BTHesitationVariations = {
		hesitate = {
			"hesitate"
		},
		hesitate_bwd = {
			"hesitate_bwd_2",
			"hesitate_bwd_3",
			"hesitate_bwd_4",
			"hesitate_bwd_5",
			"hesitate_bwd_6",
			"hesitate_bwd"
		}
	}
}
Breeds.skaven_clan_rat = table.create_copy(Breeds.skaven_clan_rat, breed_data)
Breeds.skaven_clan_rat_tutorial = table.create_copy(Breeds.skaven_clan_rat_tutorial, breed_data)
Breeds.skaven_clan_rat_tutorial.detection_radius = 2
Breeds.skaven_clan_rat_tutorial.debug_spawn_category = "Misc"
local BreedActionDimishingDamageDifficulty = {
	easy = {
		{
			damage = 2,
			cooldown = {
				1.25,
				2
			}
		},
		{
			damage = 2,
			cooldown = {
				1.25,
				2
			}
		},
		{
			damage = 1.5,
			cooldown = {
				1.25,
				2
			}
		},
		{
			damage = 1,
			cooldown = {
				1.5,
				2.25
			}
		},
		{
			damage = 1,
			cooldown = {
				1.75,
				2.5
			}
		},
		{
			damage = 1,
			cooldown = {
				2,
				2.75
			}
		},
		{
			damage = 1,
			cooldown = {
				2.25,
				3
			}
		},
		{
			damage = 1,
			cooldown = {
				2.5,
				3.25
			}
		},
		{
			damage = 1,
			cooldown = {
				2.75,
				3.5
			}
		}
	},
	normal = {
		{
			damage = 2,
			cooldown = {
				1.25,
				2
			}
		},
		{
			damage = 2,
			cooldown = {
				1.25,
				2
			}
		},
		{
			damage = 1.5,
			cooldown = {
				1.25,
				2
			}
		},
		{
			damage = 1,
			cooldown = {
				1.5,
				2.25
			}
		},
		{
			damage = 1,
			cooldown = {
				1.75,
				2.5
			}
		},
		{
			damage = 1,
			cooldown = {
				2,
				2.75
			}
		},
		{
			damage = 1,
			cooldown = {
				2.25,
				3
			}
		},
		{
			damage = 1,
			cooldown = {
				2.5,
				3.25
			}
		},
		{
			damage = 1,
			cooldown = {
				2.75,
				3.5
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
local action_data = {
	idle = {
		alerted_anims = {
			"alerted"
		}
	},
	alerted = {
		cooldown = -1,
		do_wall_check = true,
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
	climb = {},
	running_attack = {
		damage_type = "cutting",
		player_push_speed = 3,
		fatigue_type = "blocked_running",
		action_weight = 10,
		moving_attack = true,
		default_attack = {
			anims = {
				"attack_move",
				"attack_move_1",
				"attack_move_2"
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
				2.5,
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
		considerations = UtilityConsiderations.clan_rat_running_attack,
		dimishing_damage = {},
		difficulty_diminishing_damage = BreedActionDimishingDamageDifficulty
	},
	normal_attack = {
		damage_type = "cutting",
		move_anim = "move_fwd",
		fatigue_type = "blocked_attack",
		attack_intensity = 0.5,
		player_push_speed = 3,
		action_weight = 1,
		default_attack = {
			anims = {
				"attack_pounce",
				"attack_pounce_2",
				"attack_pounce_3",
				"attack_pounce_4"
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
				2.5,
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
		considerations = UtilityConsiderations.clan_rat_attack,
		dimishing_damage = {},
		difficulty_diminishing_damage = BreedActionDimishingDamageDifficulty,
		attack_directions = {
			attack_run = "left",
			attack_move_2 = "left",
			attack_pounce_down_2 = "right",
			attack_pounce_4 = "right",
			attack_reach_up = "left",
			attack_pounce_2 = "left",
			attack_reach_down_3 = "right",
			attack_move_1 = "right",
			attack_pounce_down_3 = "left",
			attack_pounce_down = "left",
			attack_reach_down_2 = "left",
			attack_pounce_3 = "right",
			attack_move = "left",
			attack_reach_down = "left",
			attack_pounce = "right"
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
	utility_action = {
		fail_cooldown_blackboard_identifier = "attack_cooldown_at",
		name = "utility_action",
		fail_cooldown_name = "utility_fail_cooldown"
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
		imation_speeds = true,
		custom_enter_function = function (unit, blackboard, t, action)
			if blackboard.stagger_type == 3 then
				blackboard.stagger_immune_time = t + 1.25
				blackboard.heavy_stagger_immune_time = t + 0.5
			elseif blackboard.stagger_type == 6 then
				blackboard.stagger_immune_time = t + 2.5
				blackboard.heavy_stagger_immune_time = t + 2
			end

			local stagger_anims = action.stagger_anims[blackboard.stagger_type]

			return stagger_anims, "idle"
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
					"stagger_fwd"
				},
				bwd = {
					"stagger_bwd_fall",
					"stagger_bwd_fall_2",
					"stagger_bwd_heavy",
					"stagger_bwd_heavy_2",
					"stagger_bwd_heavy_3",
					"stagger_bwd_heavy_4"
				},
				left = {
					"stagger_left_heavy",
					"stagger_left_heavy_2",
					"stagger_left_heavy_3",
					"stagger_left_heavy_4",
					"stagger_left_heavy_5"
				},
				right = {
					"stagger_right_heavy",
					"stagger_right_heavy_2",
					"stagger_right_heavy_3",
					"stagger_right_heavy_4",
					"stagger_right_heavy_5"
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
					"stagger_short_fwd",
					"stagger_short_fwd_2"
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
					"stagger_short_left",
					"stagger_short_left_2"
				},
				right = {
					"stun_right_sword",
					"stun_right_sword_2",
					"stun_right_sword_3",
					"stagger_short_right",
					"stagger_short_right_2"
				},
				dwn = {
					"stun_down"
				}
			}
		}
	}
}
BreedActions.skaven_clan_rat = table.create_copy(BreedActions.skaven_clan_rat, action_data)

return

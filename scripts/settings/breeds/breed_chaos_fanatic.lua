local breed_data = {
	detection_radius = 12,
	death_reaction = "ai_default",
	walk_speed = 2.3,
	aoe_height = 1.4,
	leave_walk_distance = 5,
	patrol_active_target_selection = "pick_closest_target_with_spillover",
	hesitation_timer = 7,
	look_at_range = 30,
	run_speed = 4.8,
	animation_sync_rpc = "rpc_sync_anim_state_7",
	aim_template = "chaos_marauder",
	target_selection = "pick_closest_target_with_spillover",
	wwise_voice_switch_group = "marauder_vce_variations",
	uses_attack_sfx_callback = true,
	threat_value = 1.5,
	bone_lod_level = 1,
	smart_object_template = "chaos_marauder",
	attack_general_sound_event = "Play_enemy_marauder_attack_husk_vce",
	default_inventory_template = "fanatic",
	stagger_resistance = 1.75,
	patrol_detection_radius = 10,
	flingable = true,
	panic_close_detection_radius_sq = 9,
	radius = 1.5,
	hit_mass_count = 4,
	patrol_active_perception = "perception_regular",
	perception_previous_attacker_stickyness_value = -7.75,
	race = "chaos",
	poison_resistance = 70,
	armor_category = 1,
	backstab_player_sound_event = "Play_enemy_marauder_attack_player_back_vce",
	death_sound_event = "Play_enemy_marauder_death_vce",
	smart_targeting_width = 0.2,
	behavior = "fanatic",
	use_regular_horde_spawning = true,
	during_horde_detection_radius = 15,
	attack_player_sound_event = "Play_enemy_marauder_attack_player_vce",
	has_inventory = true,
	scale_death_push = 0.5,
	follow_reach = 1,
	exchange_order = 4,
	stagger_multiplier = 1,
	dont_wield_weapon_on_patrol = true,
	hit_reaction = "ai_default",
	patrol_passive_target_selection = "patrol_passive_target_selection",
	smart_targeting_outer_width = 0.75,
	hit_effect_template = "HitEffectsChaosMarauder",
	smart_targeting_height_multiplier = 2,
	passive_walk_speed = 2,
	horde_behavior = "fanatic",
	unit_template = "ai_unit_marauder",
	has_running_attack = true,
	perception = "perception_regular",
	player_locomotion_constrain_radius = 0.7,
	weapon_reach = 2.25,
	horde_target_selection = "horde_pick_closest_target_with_spillover",
	use_backstab_vo = true,
	patrol_passive_perception = "perception_regular",
	vortexable = true,
	base_unit = "units/beings/enemies/chaos_fanatic/chr_chaos_fanatic",
	enter_walk_distance = 3,
	opt_base_unit = {
		"units/beings/enemies/chaos_fanatic/chr_chaos_fanatic_baked_var1",
		"units/beings/enemies/chaos_fanatic/chr_chaos_fanatic_baked_var2",
		"units/beings/enemies/chaos_fanatic/chr_chaos_fanatic_baked_var3"
	},
	passive_in_patrol_start_anim = {
		"move_fwd_4",
		"move_fwd_5",
		"move_fwd_6"
	},
	perception_exceptions = {
		poison_well = true,
		wizard_destructible = true
	},
	size_variation_range = {
		0.9,
		1
	},
	max_health = {
		6,
		6,
		9,
		12,
		18
	},
	diff_stagger_resist = {
		1.75,
		1.75,
		2.3,
		2.9,
		2.9
	},
	stagger_duration = {
		0.75,
		2,
		3,
		0.75,
		1.5,
		4,
		1,
		1
	},
	stagger_duration_difficulty_mod = {
		harder = 0.6,
		hard = 0.8,
		normal = 1,
		hardest = 0.4,
		easy = 1
	},
	hit_mass_counts = {
		1.25,
		1.25,
		2,
		2.5,
		2.5
	},
	wwise_voices = {
		"fanatic"
	},
	debug_color = {
		255,
		200,
		40,
		40
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

			if direction and (blackboard.stagger_immune_time or blackboard.heavy_stagger_immune_time) then
				local t = Managers.time:time("game")
				blackboard.fallen_stagger = true
				blackboard.fallen_stagger_timer = t + 0.5
				blackboard.fallen_stagger_direction = Vector3Box(direction)
			end
		end

		return stagger, duration, length
	end,
	BTHesitationVariations = {
		hesitate = {
			"outnumbered_1",
			"outnumbered_2",
			"outnumbered_4",
			"outnumbered_5",
			"outnumbered_6",
			"outnumbered_7",
			"outnumbered_8",
			"outnumbered_9"
		},
		hesitate_bwd = {
			"hesitate_bwd_2",
			"hesitate_bwd_3",
			"hesitate_bwd_4",
			"hesitate_bwd_5",
			"hesitate_bwd_6",
			"hesitate_bwd"
		}
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
				"j_spine1",
				"j_spine"
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
				"j_spine1",
				"j_spine"
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
				"j_hips",
				"j_spine"
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
				"j_leftarm",
				"j_spine"
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
				"j_rightarm",
				"j_spine"
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
				"j_hips",
				"j_spine"
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
				"j_hips",
				"j_spine"
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
		j_spine1 = 0.3,
		j_leftarm = 0.2,
		j_leftforearm = 0.2,
		j_leftleg = 0.2,
		j_leftshoulder = 0.3,
		j_rightarm = 0.2,
		j_leftupleg = 0.2,
		j_rightshoulder = 0.3,
		j_righthand = 0.2,
		j_righttoebase = 0.2,
		j_hips = 0.3,
		j_rightleg = 0.2,
		j_leftfoot = 0.2,
		j_rightupleg = 0.2,
		j_lefttoebase = 0.2,
		j_head = 0.3,
		j_neck = 0.3,
		j_spine = 0.3,
		j_lefthand = 0.2,
		j_rightforearm = 0.2
	}
}
Breeds.chaos_fanatic = table.create_copy(Breeds.chaos_fanatic, breed_data)
local BreedActionDimishingDamageDifficulty = {
	easy = {
		{
			damage = 2,
			cooldown = {
				3,
				5
			}
		},
		{
			damage = 1.5,
			cooldown = {
				3,
				5
			}
		},
		{
			damage = 1,
			cooldown = {
				3,
				5
			}
		},
		{
			damage = 1,
			cooldown = {
				3,
				5
			}
		},
		{
			damage = 1,
			cooldown = {
				3.3,
				7
			}
		},
		{
			damage = 1,
			cooldown = {
				3.6,
				7
			}
		},
		{
			damage = 1,
			cooldown = {
				4,
				7
			}
		},
		{
			damage = 1,
			cooldown = {
				4.5,
				8
			}
		},
		{
			damage = 1,
			cooldown = {
				5,
				8
			}
		}
	},
	normal = {
		{
			damage = 2,
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
				1,
				2
			}
		},
		{
			damage = 1,
			cooldown = {
				1.25,
				2.25
			}
		},
		{
			damage = 1,
			cooldown = {
				1.5,
				2.5
			}
		},
		{
			damage = 1,
			cooldown = {
				1.75,
				2.75
			}
		},
		{
			damage = 1,
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
		}
	},
	hard = {
		{
			damage = 2,
			cooldown = {
				1,
				2
			}
		},
		{
			damage = 2,
			cooldown = {
				1,
				2
			}
		},
		{
			damage = 1.5,
			cooldown = {
				1,
				2
			}
		},
		{
			damage = 1,
			cooldown = {
				1.25,
				2.25
			}
		},
		{
			damage = 1,
			cooldown = {
				1.5,
				2.5
			}
		},
		{
			damage = 1,
			cooldown = {
				1.75,
				2.75
			}
		},
		{
			damage = 1,
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
		anim_cycle_index = 0,
		animations = {
			"idle",
			"idle_2",
			"idle_3",
			"idle_4",
			"idle_5",
			"idle_6"
		},
		combat_animations = {
			"idle",
			"idle_2",
			"idle_3",
			"idle_4",
			"idle_5",
			"idle_6",
			"idle_7",
			"idle_8",
			"idle_9",
			"idle_10"
		}
	},
	alerted = {
		alerted_anims = {
			"alerted",
			"alerted_3",
			"alerted_4"
		},
		easter_egg_alerted_anims = {
			"alerted_2"
		},
		start_anims_name = {
			fwd = {
				"alerted_fwd",
				"alerted_fwd_2",
				"alerted_fwd_3"
			},
			bwd = {
				"alerted_bwd_2",
				"alerted_bwd_3"
			},
			left = {
				"alerted_left",
				"alerted_left_2",
				"alerted_left_3"
			},
			right = {
				"alerted_right",
				"alerted_right_2",
				"alerted_right_3"
			}
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
			},
			alerted_fwd_2 = {},
			alerted_bwd_2 = {
				dir = -1,
				rad = math.pi
			},
			alerted_left_2 = {
				dir = 1,
				rad = math.pi / 2
			},
			alerted_right_2 = {
				dir = -1,
				rad = math.pi / 2
			},
			alerted_fwd_3 = {},
			alerted_bwd_3 = {
				dir = -1,
				rad = math.pi
			},
			alerted_left_3 = {
				dir = 1,
				rad = math.pi / 2
			},
			alerted_right_3 = {
				dir = -1,
				rad = math.pi / 2
			}
		}
	},
	follow = {
		action_weight = 1,
		considerations = UtilityConsiderations.clan_rat_follow,
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
		walk_anims = {
			"move_fwd_walk",
			"move_fwd_walk_2",
			"move_fwd_walk_3",
			"move_fwd_walk_4"
		}
	},
	running_attack = {
		damage_type = "cutting",
		hit_react_type = "medium",
		player_push_speed = 3,
		fatigue_type = "blocked_running",
		action_weight = 10,
		dodge_rotation_time = 1,
		dodge_window_start = 1.1,
		attack_intensity = 0.5,
		moving_attack = true,
		considerations = UtilityConsiderations.clan_rat_running_attack,
		default_attack = {
			anims = {
				"attack_move",
				"attack_move_2",
				"attack_move_3",
				"attack_move_4"
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
		dimishing_damage = {},
		difficulty_diminishing_damage = BreedActionDimishingDamageDifficulty
	},
	normal_attack = {
		dodge_window_start = 0.25,
		moving_attack_intensity = 0.75,
		fatigue_type = "blocked_attack",
		hit_react_type = "medium",
		dodge_rotation_time = 1.2,
		damage_type = "cutting",
		attack_intensity = 0.5,
		player_push_speed = 5,
		action_weight = 1,
		considerations = UtilityConsiderations.clan_rat_attack,
		default_attack = {
			anims = {
				"attack_pounce",
				"attack_pounce_2",
				"attack_pounce_3",
				"attack_pounce_4",
				"attack_pounce_5",
				"attack_pounce_6",
				"attack_pounce_7"
			},
			damage_box_range = {
				flat = 2.25,
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
		dimishing_damage = {},
		difficulty_diminishing_damage = BreedActionDimishingDamageDifficulty,
		attack_directions = {
			attack_reach_down = "left",
			attack_run_3 = "left",
			attack_pounce_6 = "right",
			attack_pounce_7 = "left",
			attack_run = "left",
			attack_pounce_2 = "right",
			attack_reach_up_3 = "left",
			attack_reach_up_2 = "left",
			attack_move = "left",
			attack_run_2 = "right",
			attack_pounce_5 = "left",
			attack_reach_down_2 = "left",
			attack_move_4 = "right",
			attack_move_2 = "right",
			attack_move_3 = "left",
			attack_reach_up_4 = "left",
			attack_reach_up = "left",
			attack_reach_down_3 = "left",
			attack_pounce_4 = "right",
			attack_pounce_3 = "left",
			attack_pounce = "left"
		}
	},
	combat_shout = {
		cooldown = -1,
		shout_anim = "shout",
		action_weight = 1,
		considerations = UtilityConsiderations.clan_rat_shout
	},
	combat_step = {
		move_speed = 4,
		action_weight = 1,
		considerations = UtilityConsiderations.chaos_marauder_combat_step
	},
	smash_door = {
		unblockable = true,
		damage_type = "cutting",
		move_anim = "move_fwd",
		door_attack_distance = 1,
		attack_anim = {
			"attack_blocker",
			"attack_blocker_2",
			"attack_blocker_3"
		},
		damage = {
			4,
			4,
			4
		}
	},
	utility_action = {
		fail_cooldown_blackboard_identifier = "attack_cooldown_at",
		name = "utility_action",
		fail_cooldown_name = "utility_fail_cooldown"
	},
	blocked = {
		blocked_anims = {
			"blocked"
		}
	},
	stagger = {
		scale_animation_speeds = true,
		custom_enter_function = function (unit, blackboard, t, action)
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
				}
			},
			{
				fwd = {
					"stagger_fwd_heavy",
					"stagger_fwd_heavy_2",
					"stagger_fwd_heavy_3",
					"stagger_fwd_heavy_4"
				},
				bwd = {
					"stagger_up_heavy",
					"stagger_up_heavy_2",
					"stagger_up_heavy_3",
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
					"stagger_dwn_heavy",
					"stagger_dwn_heavy_2",
					"stagger_dwn_heavy_3"
				}
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
				}
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
				}
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
				}
			}
		}
	},
	fallback_idle = action_data.idle
}
BreedActions.chaos_fanatic = table.create_copy(BreedActions.chaos_fanatic, action_data)

return

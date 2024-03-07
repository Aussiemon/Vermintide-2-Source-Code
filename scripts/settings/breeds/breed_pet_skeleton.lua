-- chunkname: @scripts/settings/breeds/breed_pet_skeleton.lua

local stagger_types = require("scripts/utils/stagger_types")

require("scripts/settings/profiles/career_constants")

local function hit_ai_func(unit, blackboard, hit_unit, action, attack)
	if hit_unit ~= blackboard.attacking_target then
		local damage = 0
		local buff_extension = ScriptUnit.extension(unit, "buff_system")

		buff_extension:trigger_procs("on_damage_dealt", hit_unit, unit, damage, nil, nil, nil, nil, nil, nil, nil, nil, nil)
		Managers.state.achievement:trigger_event("on_damage_dealt", hit_unit, unit, damage, nil, nil, nil, nil, nil, nil, nil, nil, nil)
	end
end

local breed_data = {
	ai_strength = 0.8,
	aim_template = "chaos_marauder",
	animation_sync_rpc = "rpc_sync_anim_state_7",
	aoe_height = 1.4,
	armor_category = 1,
	attack_general_sound_event = "Play_skeleton_minion_attack_vce",
	base_unit = "units/beings/npcs/necromancer_skeleton/chr_npc_necromancer_skeleton",
	behavior = "pet_skeleton",
	bone_lod_level = 1,
	commanded_unit_aggro_sound = "Play_skeleton_minion_charge_vce",
	damage_multiplier_vs_ai = 0.25,
	death_reaction = "ai_default",
	death_sound_event = "career_necro_skeleton_spawn",
	debug_despawn_immunity = true,
	debug_spawn_category = "Misc",
	default_inventory_template = "undead_npc_skeleton",
	detection_radius = 18,
	die_on_vortex_land = false,
	disable_alert_friends_on_death = true,
	disable_friendly_fire = true,
	during_horde_detection_radius = 15,
	enter_walk_distance = 0.25,
	exchange_order = 4,
	far_off_despawn_immunity = true,
	flingable = true,
	follow_reach = 1,
	force_walk_while_tired = true,
	has_inventory = true,
	has_running_attack = true,
	height = 1.5,
	hesitation_timer = 5,
	hit_effect = "fx/skull_shatter",
	hit_effect_template = "HitEffectsChaosMarauder",
	hit_mass_count = 3,
	hit_reaction = "ai_default",
	horde_behavior = "pet_skeleton",
	is_always_spawnable = true,
	is_bot_threat = true,
	leave_walk_distance = 5,
	look_at_range = 40,
	max_commander_distance = 28,
	min_run_speed = 3,
	no_blood = true,
	panic_close_detection_radius_sq = 9,
	passive_in_patrol = false,
	passive_walk_speed = 4,
	patrol_active_perception = "perception_regular",
	patrol_active_target_selection = "pick_closest_target_with_spillover",
	patrol_detection_radius = 10,
	patrol_passive_perception = "perception_regular",
	patrol_passive_target_selection = "patrol_passive_target_selection",
	perception = "perception_regular",
	perception_previous_attacker_stickyness_value = -7.75,
	pet_skeleton_type = "default",
	poison_resistance = 100,
	race = "undead",
	radius = 1,
	run_max_speed_distance = 4,
	run_min_speed_distance = 1.5,
	run_speed = 6,
	scale_death_push = 0.35,
	slot_template = "chaos_roamer",
	smart_object_template = "chaos_marauder",
	smart_targeting_height_multiplier = 2,
	smart_targeting_outer_width = 0.75,
	smart_targeting_width = 0.2,
	stagger_multiplier = 0.45,
	stagger_resistance = 2,
	stagger_threshold_light = 0,
	target_selection = "pick_closest_target_near_detection_source_position",
	threat_value = 2.5,
	unit_template = "ai_unit_pet_skeleton",
	use_backstab_vo = true,
	use_regular_horde_spawning = true,
	use_slot_type = "normal",
	uses_attack_sfx_callback = true,
	uses_spawn_animation = true,
	using_inventory_weakspots = true,
	vortexable = true,
	walk_speed = 4,
	weapon_reach = 2.5,
	wield_inventory_on_spawn = true,
	strong_hit_reacts = {
		fwd = {
			"stun_fwd_sword",
		},
		bwd = {
			"stun_bwd_sword",
		},
		left = {
			"stun_left_sword",
		},
		right = {
			"stun_right_sword",
		},
	},
	ai_toughness = math.huge,
	default_spawn_animation = {
		"spawn_floor",
		"spawn_floor_2",
		"spawn_floor_3",
		"spawn_floor_4",
		"spawn_floor_5",
		"spawn_floor_6",
		"spawn_floor_7",
	},
	passive_in_patrol_start_anim = {
		"move_fwd_4",
		"move_fwd_5",
		"move_fwd_6",
	},
	infighting = InfightingSettings.skeleton_pet,
	perception_exceptions = {
		poison_well = true,
		wizard_destructible = true,
	},
	size_variation_range = {
		0.9,
		1,
	},
	max_health = {
		37 * CareerConstants.bw_necromancer.pet_balance_health_modifier,
		37 * CareerConstants.bw_necromancer.pet_balance_health_modifier,
		55 * CareerConstants.bw_necromancer.pet_balance_health_modifier,
		65 * CareerConstants.bw_necromancer.pet_balance_health_modifier,
		100 * CareerConstants.bw_necromancer.pet_balance_health_modifier,
		150 * CareerConstants.bw_necromancer.pet_balance_health_modifier,
		150 * CareerConstants.bw_necromancer.pet_balance_health_modifier,
		150 * CareerConstants.bw_necromancer.pet_balance_health_modifier,
		37 * CareerConstants.bw_necromancer.pet_balance_health_modifier,
	},
	bloodlust_health = BreedTweaks.bloodlust_health.chaos_roamer,
	hit_mass_counts = {
		3,
		3,
		4.5,
		6,
		9,
	},
	stagger_reduction = BreedTweaks.stagger_reduction.marauder,
	diff_stagger_resist = BreedTweaks.diff_stagger_resist.marauder,
	stagger_duration_difficulty_mod = BreedTweaks.stagger_duration_difficulty_mod.fast,
	stagger_duration = BreedTweaks.stagger_duration.marauder,
	status_effect_settings = {
		category = "small",
		ignored_statuses = table.set({
			StatusEffectNames.poisoned,
		}),
	},
	debug_color = {
		255,
		200,
		40,
		40,
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
	BTHesitationVariations = {
		hesitate = {
			"outnumbered_1",
			"outnumbered_2",
			"outnumbered_4",
			"outnumbered_5",
			"outnumbered_6",
			"outnumbered_7",
			"outnumbered_8",
			"outnumbered_9",
		},
		hesitate_bwd = {
			"hesitate_bwd_2",
			"hesitate_bwd_3",
			"hesitate_bwd_4",
			"hesitate_bwd_5",
			"hesitate_bwd_6",
			"hesitate_bwd",
		},
	},
	hitzone_multiplier_types = {
		head = "headshot",
	},
	hit_zones = {
		head = {
			prio = 1,
			actors = {
				"c_head",
			},
			push_actors = {
				"j_head",
				"j_neck",
				"j_spine1",
				"j_spine",
			},
		},
		neck = {
			prio = 1,
			actors = {
				"c_neck",
				"c_neck1",
			},
			push_actors = {
				"j_head",
				"j_neck",
				"j_spine1",
				"j_spine",
			},
		},
		torso = {
			prio = 2,
			actors = {
				"c_spine1",
				"c_spine",
				"c_spine2",
				"c_hips",
			},
			push_actors = {
				"j_neck",
				"j_spine1",
				"j_hips",
				"j_spine",
			},
		},
		left_arm = {
			prio = 3,
			actors = {
				"c_leftarm",
				"c_leftforearm",
				"c_lefthand",
				"c_leftshoulder",
			},
			push_actors = {
				"j_spine1",
				"j_leftshoulder",
				"j_leftarm",
				"j_spine",
			},
		},
		right_arm = {
			prio = 3,
			actors = {
				"c_rightarm",
				"c_rightforearm",
				"c_righthand",
				"c_rightshoulder",
			},
			push_actors = {
				"j_spine1",
				"j_rightshoulder",
				"j_rightarm",
				"j_spine",
			},
		},
		left_leg = {
			prio = 3,
			actors = {
				"c_leftupleg",
				"c_leftleg",
				"c_leftfoot",
			},
			push_actors = {
				"j_leftfoot",
				"j_leftleg",
				"j_hips",
				"j_spine",
			},
		},
		right_leg = {
			prio = 3,
			actors = {
				"c_rightupleg",
				"c_rightleg",
				"c_rightfoot",
			},
			push_actors = {
				"j_rightfoot",
				"j_rightleg",
				"j_hips",
				"j_spine",
			},
		},
		full = {
			prio = 4,
			actors = {},
		},
		afro = {
			prio = 5,
			actors = {
				"c_afro",
			},
		},
	},
	hitbox_ragdoll_translation = {
		c_head = "j_head",
		c_hips = "j_hips",
		c_leftarm = "j_leftarm",
		c_leftfoot = "j_leftfoot",
		c_leftforearm = "j_leftforearm",
		c_lefthand = "j_lefthand",
		c_leftleg = "j_leftleg",
		c_leftshoulder = "j_leftshoulder",
		c_leftupleg = "j_leftupleg",
		c_neck = "j_neck",
		c_neck1 = "j_neck",
		c_rightarm = "j_rightarm",
		c_rightfoot = "j_rightfoot",
		c_rightforearm = "j_rightforearm",
		c_righthand = "j_righthand",
		c_rightleg = "j_rightleg",
		c_rightshoulder = "j_rightshoulder",
		c_rightupleg = "j_rightupleg",
		c_spine = "j_spine",
		c_spine1 = "j_spine1",
		c_spine2 = "j_spine1",
	},
	ragdoll_actor_thickness = {
		j_head = 0.3,
		j_hips = 0.3,
		j_leftarm = 0.2,
		j_leftfoot = 0.2,
		j_leftforearm = 0.2,
		j_lefthand = 0.2,
		j_leftleg = 0.2,
		j_leftshoulder = 0.3,
		j_lefttoebase = 0.2,
		j_leftupleg = 0.2,
		j_neck = 0.3,
		j_rightarm = 0.2,
		j_rightfoot = 0.2,
		j_rightforearm = 0.2,
		j_righthand = 0.2,
		j_rightleg = 0.2,
		j_rightshoulder = 0.3,
		j_righttoebase = 0.2,
		j_rightupleg = 0.2,
		j_spine = 0.3,
		j_spine1 = 0.3,
	},
	commander_formation = {
		alternating = true,
		commander_avoid_radius = 1.2,
		dist = 2.3,
		formation_type = "circle",
		lead_dist_max = 2,
		lead_dist_min = 2,
		lead_dist_mult = math.huge,
		angle_offset = math.pi * -0.1,
		initial_angle_offset = math.pi * 0.35,
	},
	networked_animation_variables = {
		{
			anims = {
				"attack_run",
				"attack_run_2",
				"attack_run_3",
			},
			variables = {
				moving_attack_fwd_speed = {
					move_speed_variable_lerp_speed = 4,
					animation_move_speed_config = {
						{
							distance = 6.5,
							value = 3,
						},
						{
							distance = 3,
							value = 2,
						},
						{
							distance = 1.25,
							value = 1,
						},
						{
							distance = 0,
							value = 0,
						},
					},
				},
			},
		},
		{
			anims = {
				"attack_move",
				"attack_move_2",
				"attack_move_3",
				"attack_move_4",
			},
			variables = {
				moving_attack_fwd_speed = {
					move_speed_variable_lerp_speed = 4,
					animation_move_speed_config = {
						{
							distance = 3,
							value = 1,
						},
						{
							distance = 0,
							value = 0,
						},
					},
				},
			},
		},
	},
}

Breeds.pet_skeleton = table.create_copy(Breeds.pet_skeleton, breed_data)

local AttackIntensityPerDifficulty = {
	normal = {
		easy = {
			normal = 2,
		},
		normal = {
			normal = 2,
		},
		hard = {
			normal = 2,
		},
		harder = {
			normal = 2,
		},
		hardest = {
			normal = 2,
		},
		cataclysm = {
			normal = 2,
		},
		cataclysm_2 = {
			normal = 2,
		},
		cataclysm_3 = {
			normal = 2,
		},
		versus_base = {
			normal = 2,
		},
	},
	running = {
		easy = {
			running = 2.5,
		},
		normal = {
			running = 2.5,
		},
		hard = {
			running = 2.5,
		},
		harder = {
			running = 2.5,
		},
		hardest = {
			running = 2.5,
		},
		cataclysm = {
			running = 2.5,
		},
		cataclysm_2 = {
			running = 2.5,
		},
		cataclysm_3 = {
			running = 2.5,
		},
		versus_base = {
			running = 2.5,
		},
	},
}
local action_data = {
	spawn = {
		incrementing_anim_variations = {
			{
				max = 7,
				min = 0,
				name = "pose_variation",
				value_type = "int",
			},
			{
				max = 9,
				min = 0,
				name = "rare_variation",
				value_type = "int",
			},
		},
	},
	idle = {
		anim_cycle_index = 0,
		animations = {
			"idle",
		},
		combat_animations = {
			"idle",
		},
		alerted_anims = {
			"alerted",
			"alerted_3",
		},
	},
	commander_disabled = {
		force_idle_animation = true,
		idle_animation = {
			"idle_disabled",
		},
	},
	commander_disabled_resume = {
		force_idle_animation = true,
		idle_animation = "idle_enabled",
	},
	combat_shout = {
		action_weight = 1,
		cooldown = -1,
		shout_anim = "shout",
		considerations = UtilityConsiderations.clan_rat_shout,
	},
	alerted = {
		no_hesitation = true,
		alerted_anims = {
			"alerted",
			"alerted_3",
			"alerted_4",
		},
		easter_egg_alerted_anims = {
			"alerted_2",
		},
		start_anims_name = {
			fwd = {
				"alerted_fwd",
				"alerted_fwd_2",
				"alerted_fwd_3",
			},
			bwd = {
				"alerted_bwd_2",
				"alerted_bwd_3",
			},
			left = {
				"alerted_left",
				"alerted_left_2",
				"alerted_left_3",
			},
			right = {
				"alerted_right",
				"alerted_right_2",
				"alerted_right_3",
			},
		},
		start_anims_data = {
			alerted_fwd = {},
			alerted_bwd = {
				dir = -1,
				rad = math.pi,
			},
			alerted_left = {
				dir = 1,
				rad = math.pi / 2,
			},
			alerted_right = {
				dir = -1,
				rad = math.pi / 2,
			},
			alerted_fwd_2 = {},
			alerted_bwd_2 = {
				dir = -1,
				rad = math.pi,
			},
			alerted_left_2 = {
				dir = 1,
				rad = math.pi / 2,
			},
			alerted_right_2 = {
				dir = -1,
				rad = math.pi / 2,
			},
			alerted_fwd_3 = {},
			alerted_bwd_3 = {
				dir = -1,
				rad = math.pi,
			},
			alerted_left_3 = {
				dir = 1,
				rad = math.pi / 2,
			},
			alerted_right_3 = {
				dir = -1,
				rad = math.pi / 2,
			},
		},
	},
	follow = {
		action_weight = 1,
		goal_margin = 0.3,
		skip_start_anim_if_moving = true,
		considerations = UtilityConsiderations.clan_rat_follow,
		move_speed_func = function (unit, blackboard)
			local goal_destination = blackboard.goal_destination

			if not goal_destination then
				return
			end

			goal_destination = goal_destination:unbox()

			local commander_speed = 0
			local commander_locomotion = ScriptUnit.has_extension(blackboard.commander_unit, "locomotion_system")

			if commander_locomotion then
				commander_speed = Vector3.length(commander_locomotion:current_velocity())
			end

			local unit_position = POSITION_LOOKUP[unit]
			local distance_to_goal = Vector3.distance(unit_position, goal_destination)
			local max_speed = math.max(blackboard.breed.run_speed, commander_speed)
			local min_speed = math.max(blackboard.breed.min_run_speed, commander_speed)
			local max_speed_dist = blackboard.breed.run_max_speed_distance
			local min_speed_dist = blackboard.breed.run_min_speed_distance
			local speed = math.lerp(min_speed, max_speed, math.clamp01((distance_to_goal - min_speed_dist) / max_speed_dist))

			blackboard.navigation_extension:set_max_speed(speed)
		end,
		start_anims_name = {
			bwd = "move_start_bwd",
			fwd = "move_start_fwd",
			left = "move_start_left",
			right = "move_start_right",
		},
		start_anims_data = {
			move_start_fwd = {},
			move_start_bwd = {
				dir = -1,
				rad = math.pi,
			},
			move_start_left = {
				dir = 1,
				rad = math.pi / 2,
			},
			move_start_right = {
				dir = -1,
				rad = math.pi / 2,
			},
		},
		walk_anims = {
			"move_fwd_walk",
			"move_fwd_walk_2",
			"move_fwd_walk_3",
			"move_fwd_walk_4",
		},
	},
	follow_commander = {
		start_anims_name = {
			bwd = "move_start_bwd",
			fwd = "move_start_fwd",
			left = "move_start_left",
			right = "move_start_right",
		},
		start_anims_data = {
			move_start_fwd = {},
			move_start_bwd = {
				dir = -1,
				rad = math.pi,
			},
			move_start_left = {
				dir = 1,
				rad = math.pi / 2,
			},
			move_start_right = {
				dir = -1,
				rad = math.pi / 2,
			},
		},
		walk_anims = {
			"move_fwd_walk",
			"move_fwd_walk_2",
			"move_fwd_walk_3",
			"move_fwd_walk_4",
		},
	},
	reposition_on_slot = {
		action_weight = 2,
		considerations = UtilityConsiderations.reposition_on_slot,
		start_anims_name = {
			bwd = "move_start_bwd",
			fwd = "move_start_fwd",
			left = "move_start_left",
			right = "move_start_right",
		},
		start_anims_data = {
			move_start_fwd = {},
			move_start_bwd = {
				dir = -1,
				rad = math.pi,
			},
			move_start_left = {
				dir = 1,
				rad = math.pi / 2,
			},
			move_start_right = {
				dir = -1,
				rad = math.pi / 2,
			},
		},
		walk_anims = {
			"move_fwd_walk",
			"move_fwd_walk_2",
			"move_fwd_walk_3",
			"move_fwd_walk_4",
		},
	},
	running_sweep_attack = {
		action_weight = 10,
		attack_intensity = 1,
		attack_intensity_type = "running",
		damage = 3,
		damage_type = "cutting",
		hit_react_type = "medium",
		ignore_ai_damage = true,
		moving_attack = true,
		self_running_speed_threshold = 1,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.marauder_running_attack,
		target_running_distance_threshold = math.huge,
		running_attacks = {
			{
				anim_driven = true,
				height = 1.5,
				hit_multiple_targets = true,
				lock_attack_time = 2.1,
				offset_forward = 0,
				offset_up = 0,
				range = 2.7,
				rotation_time = 0.8,
				width = 2.5,
				attack_anim = {
					"attack_run",
					"attack_run_2",
					"attack_run_3",
				},
				attack_time = math.huge,
				push_ai = {
					stagger_distance = 1,
					stagger_impact = {
						stagger_types.weak,
						stagger_types.none,
						stagger_types.none,
						stagger_types.none,
					},
					stagger_duration = {
						1,
						0,
						0,
						0,
					},
				},
				immune_breeds = {
					skaven_grey_seer = true,
				},
			},
		},
		attacks = {
			{
				anim_driven = true,
				height = 1.5,
				hit_multiple_targets = true,
				lock_attack_time = 2.1,
				offset_forward = 0,
				offset_up = 0,
				range = 2.7,
				rotation_time = 0.8,
				width = 2.5,
				attack_anim = {
					"attack_move",
					"attack_move_2",
					"attack_move_3",
					"attack_move_4",
				},
				attack_time = math.huge,
				push_ai = {
					stagger_distance = 1,
					stagger_impact = {
						stagger_types.weak,
						stagger_types.none,
						stagger_types.none,
						stagger_types.none,
					},
					stagger_duration = {
						1,
						0,
						0,
						0,
					},
				},
				immune_breeds = {
					skaven_grey_seer = true,
				},
			},
		},
		difficulty_damage = {
			easy = {
				5,
				2,
				8,
				0,
				4,
				1,
			},
			normal = {
				6,
				3,
				9,
				0,
				5,
				2,
			},
			hard = {
				7,
				4,
				10,
				0,
				6,
				3,
			},
			harder = {
				8,
				5,
				11,
				0,
				7,
				4,
			},
			hardest = {
				9,
				6,
				12,
				0,
				8,
				4,
			},
			cataclysm = {
				11,
				7,
				14,
				0,
				10,
				5,
			},
			cataclysm_2 = {
				11,
				7,
				14,
				0,
				10,
				5,
			},
			cataclysm_3 = {
				11,
				7,
				14,
				0,
				10,
				5,
			},
			versus_base = {
				11,
				7,
				14,
				0,
				10,
				5,
			},
		},
		fatigue_type = BreedTweaks.fatigue_types.roamer.running_attack,
		hit_ai_func = hit_ai_func,
	},
	sweep_attack = {
		action_weight = 1,
		attack_intensity_type = "normal",
		damage = 3,
		damage_type = "cutting",
		ignore_ai_damage = true,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.marauder_attack,
		attacks = {
			{
				anim_driven = true,
				height = 1.5,
				hit_multiple_targets = true,
				lock_attack_time = 2.1,
				offset_forward = 0,
				offset_up = 0,
				range = 2.7,
				rotation_time = 0.3,
				width = 2.5,
				attack_anim = {
					"attack_pounce",
					"attack_pounce_2",
					"attack_pounce_5",
					"attack_pounce_6",
				},
				attack_time = math.huge,
				push_ai = {
					stagger_distance = 1,
					stagger_impact = {
						stagger_types.weak,
						stagger_types.none,
						stagger_types.none,
						stagger_types.none,
					},
					stagger_duration = {
						1,
						0,
						0,
						0,
					},
				},
				immune_breeds = {
					skaven_grey_seer = true,
				},
			},
			{
				anim_driven = true,
				height = 1.5,
				hit_multiple_targets = true,
				lock_attack_time = 2.1,
				offset_forward = 0.5,
				offset_up = 0,
				range = 2.7,
				rotation_time = 0.3,
				width = 1,
				attack_anim = {
					"attack_pounce_3",
					"attack_pounce_4",
				},
				attack_time = math.huge,
				push_ai = {
					stagger_distance = 1,
					stagger_impact = {
						stagger_types.weak,
						stagger_types.none,
						stagger_types.none,
						stagger_types.none,
					},
					stagger_duration = {
						1,
						0,
						0,
						0,
					},
				},
				immune_breeds = {
					skaven_grey_seer = true,
				},
			},
		},
		fatigue_type = BreedTweaks.fatigue_types.roamer.normal_attack,
		difficulty_damage = {
			easy = {
				5,
				2,
				8,
				0,
				4,
				1,
			},
			normal = {
				6,
				3,
				9,
				0,
				5,
				2,
			},
			hard = {
				7,
				4,
				10,
				0,
				6,
				3,
			},
			harder = {
				8,
				5,
				11,
				0,
				7,
				4,
			},
			hardest = {
				9,
				6,
				12,
				0,
				8,
				4,
			},
			cataclysm = {
				11,
				7,
				14,
				0,
				10,
				5,
			},
			cataclysm_2 = {
				11,
				7,
				14,
				0,
				10,
				5,
			},
			cataclysm_3 = {
				11,
				7,
				14,
				0,
				10,
				5,
			},
			versus_base = {
				11,
				7,
				14,
				0,
				10,
				5,
			},
		},
		hit_ai_func = hit_ai_func,
	},
	combat_step = {
		action_weight = 1,
		move_speed = 4,
		considerations = UtilityConsiderations.chaos_marauder_combat_step,
		start_anims_data = {
			combat_step_fwd = {},
			combat_step_bwd = {
				dir = -1,
				rad = math.pi,
			},
			combat_step_left = {
				dir = 1,
				rad = math.pi / 2,
			},
			combat_step_right = {
				dir = -1,
				rad = math.pi / 2,
			},
		},
	},
	climb = {},
	smash_door = {
		damage = 4,
		damage_type = "cutting",
		door_attack_distance = 1,
		move_anim = "move_fwd",
		unblockable = true,
		attack_anim = {
			"attack_blocker",
			"attack_blocker_2",
			"attack_blocker_3",
		},
	},
	utility_action = {
		fail_cooldown_blackboard_identifier = "attack_cooldown_at",
		fail_cooldown_name = "utility_fail_cooldown",
		name = "utility_action",
	},
	blocked = {
		blocked_anims = {
			"blocked",
		},
		difficulty_duration = BreedTweaks.blocked_duration.chaos_roamer,
	},
	special_attack = {
		action_weight = 1,
		considerations = UtilityConsiderations.chaos_raider_special_attack,
	},
	moving_attack = {
		action_weight = 10,
		considerations = UtilityConsiderations.chaos_raider_moving_attack,
	},
	stagger = {
		scale_animation_speeds = true,
		custom_enter_function = function (unit, blackboard, t, action)
			if blackboard.stagger_type == 3 then
				blackboard.stagger_immune_time = t + 2.25
				blackboard.heavy_stagger_immune_time = t + 1.5
			elseif blackboard.stagger_type == 6 then
				blackboard.stagger_immune_time = t + 3.5
				blackboard.heavy_stagger_immune_time = t + 3
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
					"stagger_fwd_light_6",
				},
				bwd = {
					"stagger_bwd_light",
					"stagger_bwd_light_2",
					"stagger_bwd_light_3",
					"stagger_bwd_light_4",
					"stagger_bwd_light_5",
					"stagger_bwd_light_6",
					"stagger_bwd_light_7",
					"stagger_bwd_light_8",
				},
				left = {
					"stagger_left_light",
					"stagger_left_light_2",
					"stagger_left_light_3",
					"stagger_left_light_4",
				},
				right = {
					"stagger_right_light",
					"stagger_right_light_2",
					"stagger_right_light_3",
					"stagger_right_light_4",
				},
				dwn = {
					"stun_down",
				},
			},
			{
				fwd = {
					"stagger_fwd",
					"stagger_fwd_2",
					"stagger_fwd_3",
					"stagger_fwd_4",
				},
				bwd = {
					"stagger_bwd",
					"stagger_bwd_2",
					"stagger_bwd_3",
					"stagger_bwd_4",
				},
				left = {
					"stagger_left",
					"stagger_left_2",
					"stagger_left_3",
					"stagger_left_4",
					"stagger_left_5",
				},
				right = {
					"stagger_right",
					"stagger_right_2",
					"stagger_right_3",
					"stagger_right_4",
					"stagger_right_5",
				},
				dwn = {
					"stagger_medium_downward",
					"stagger_medium_downward_2",
					"stagger_medium_downward_3",
				},
			},
			{
				fwd = {
					"stagger_fwd_heavy",
					"stagger_fwd_heavy_2",
					"stagger_fwd_heavy_3",
					"stagger_fwd_heavy_4",
				},
				bwd = {
					"stagger_up_heavy",
					"stagger_up_heavy_2",
					"stagger_up_heavy_3",
					"stagger_bwd_heavy",
					"stagger_bwd_heavy_2",
					"stagger_bwd_heavy_3",
					"stagger_bwd_heavy_4",
				},
				left = {
					"stagger_left_heavy",
					"stagger_left_heavy_2",
					"stagger_left_heavy_3",
					"stagger_left_heavy_4",
				},
				right = {
					"stagger_right_heavy",
					"stagger_right_heavy_2",
					"stagger_right_heavy_3",
					"stagger_right_heavy_4",
				},
				dwn = {
					"stagger_dwn_heavy",
					"stagger_dwn_heavy_2",
					"stagger_dwn_heavy_3",
				},
			},
			{
				fwd = {
					"stun_fwd_ranged_light",
					"stun_fwd_ranged_light_2",
					"stun_fwd_ranged_light_3",
				},
				bwd = {
					"stun_bwd_ranged_light",
					"stun_bwd_ranged_light_2",
					"stun_bwd_ranged_light_3",
				},
				left = {
					"stun_left_ranged_light",
					"stun_left_ranged_light_2",
					"stun_left_ranged_light_3",
				},
				right = {
					"stun_right_ranged_light",
					"stun_right_ranged_light_2",
					"stun_right_ranged_light_3",
				},
			},
			{
				fwd = {
					"stagger_fwd",
					"stagger_fwd_2",
					"stagger_fwd_3",
					"stagger_fwd_4",
				},
				bwd = {
					"stagger_bwd",
					"stagger_bwd_2",
					"stagger_bwd_3",
					"stagger_bwd_4",
				},
				left = {
					"stagger_left",
					"stagger_left_2",
					"stagger_left_3",
					"stagger_left_4",
					"stagger_left_5",
				},
				right = {
					"stagger_right",
					"stagger_right_2",
					"stagger_right_3",
					"stagger_right_4",
					"stagger_right_5",
				},
				dwn = {
					"stagger_medium_downward",
					"stagger_medium_downward_2",
					"stagger_medium_downward_3",
				},
			},
			{
				fwd = {
					"stagger_explosion_back",
					"stagger_explosion_back_2",
				},
				bwd = {
					"stagger_explosion_front",
				},
				left = {
					"stagger_explosion_left",
				},
				right = {
					"stagger_explosion_right",
				},
			},
			{
				fwd = {
					"stagger_fwd_light",
					"stagger_fwd_light_2",
					"stagger_fwd_light_3",
					"stagger_fwd_light_4",
					"stagger_fwd_light_5",
					"stagger_fwd_light_6",
				},
				bwd = {
					"stagger_bwd_light",
					"stagger_bwd_light_4",
					"stagger_bwd_light_5",
					"stagger_bwd_light_6",
					"stagger_bwd_light_7",
					"stagger_bwd_light_8",
				},
				left = {
					"stagger_left_light",
					"stagger_left_light_2",
					"stagger_left_light_3",
					"stagger_left_light_4",
				},
				right = {
					"stagger_right_light",
					"stagger_right_light_2",
					"stagger_right_light_3",
					"stagger_right_light_4",
				},
				dwn = {
					"stun_down",
				},
			},
			{
				fwd = {},
				bwd = {},
				left = {},
				right = {},
			},
			{
				fwd = {
					"stagger_fwd",
					"stagger_fwd_2",
					"stagger_fwd_3",
					"stagger_fwd_4",
				},
				bwd = {
					"stagger_bwd",
					"stagger_bwd_2",
					"stagger_bwd_3",
					"stagger_bwd_4",
				},
				left = {
					"stagger_left",
					"stagger_left_2",
					"stagger_left_3",
					"stagger_left_4",
					"stagger_left_5",
				},
				right = {
					"stagger_right",
					"stagger_right_2",
					"stagger_right_3",
					"stagger_right_4",
					"stagger_right_5",
				},
				dwn = {
					"stagger_medium_downward",
					"stagger_medium_downward_2",
					"stagger_medium_downward_3",
				},
			},
		},
	},
	follow_owner = {},
}

action_data.command_attack = table.clone(action_data.sweep_attack)
action_data.command_attack.considerations = UtilityConsiderations.command_attack
action_data.running_command_attack = table.clone(action_data.running_sweep_attack)
action_data.running_command_attack.considerations = UtilityConsiderations.running_command_attack
action_data.command_follow = table.clone(action_data.follow)
action_data.command_follow.slow_approach_time = 0
action_data.command_follow.walk_time = 0
action_data.fallback_idle = action_data.idle
BreedActions.pet_skeleton = table.create_copy(BreedActions.pet_skeleton, action_data)

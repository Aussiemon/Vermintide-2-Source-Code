-- chunkname: @scripts/settings/breeds/breed_pet_skeleton_armored.lua

local stagger_types = require("scripts/utils/stagger_types")

local function hit_ai_func(unit, blackboard, hit_unit, action, attack)
	if hit_unit ~= blackboard.attacking_target then
		local damage = 0
		local buff_extension = ScriptUnit.extension(unit, "buff_system")

		buff_extension:trigger_procs("on_damage_dealt", hit_unit, unit, damage, nil, nil, nil, nil, nil, nil, nil, nil, nil)

		if not Managers.state.network:in_game_session() then
			Managers.state.achievement:trigger_event("on_damage_dealt", hit_unit, unit, damage, nil, nil, nil, nil, nil, nil, nil, nil, nil)
		end
	end
end

local breed_data = {
	ai_strength = 1,
	aim_template = "chaos_marauder",
	animation_sync_rpc = "rpc_sync_anim_state_7",
	aoe_height = 1.4,
	aoe_radius = 0.4,
	armor_category = 1,
	attack_general_sound_event = "Play_skeleton_minion_attack_vce",
	base_unit = "units/beings/npcs/necromancer_skeleton/chr_npc_necromancer_skeleton",
	behavior = "pet_skeleton",
	bone_lod_level = 1,
	commanded_unit_aggro_sound = "Play_skeleton_minion_charge_vce",
	damage_multiplier_vs_ai = 0.37,
	death_reaction = "ai_default",
	death_sound_event = "career_necro_skeleton_spawn",
	debug_despawn_immunity = true,
	debug_spawn_category = "Misc",
	default_inventory_template = "undead_npc_skeleton_armored",
	detection_radius = 18,
	die_on_vortex_land = false,
	disable_crowd_dispersion = true,
	disable_projectile_friendly_fire = true,
	during_horde_detection_radius = 15,
	enter_walk_distance = 0.25,
	exchange_order = 4,
	far_off_despawn_immunity = true,
	flingable = true,
	follow_reach = 1,
	force_walk_while_tired = true,
	has_inventory = true,
	has_running_attack = true,
	height = 1.75,
	hesitation_timer = 5,
	hit_effect = "fx/skull_shatter",
	hit_effect_template = "HitEffectsChaosMarauder",
	hit_mass_count = 8,
	hit_reaction = "ai_default",
	horde_behavior = "pet_skeleton",
	ignore_activate_unit = true,
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
	perception_previous_attacker_stickyness_value = -4.5,
	pet_skeleton_type = "armored",
	poison_resistance = 100,
	push_sound_event = "Play_generic_pushed_impact_large",
	race = "undead",
	radius = 1,
	run_max_speed_distance = 4,
	run_min_speed_distance = 1.5,
	run_speed = 6,
	scale_death_push = 0.35,
	slot_template = "chaos_elite",
	smart_object_template = "chaos_marauder",
	smart_targeting_height_multiplier = 2.5,
	smart_targeting_outer_width = 1,
	smart_targeting_width = 0.2,
	stagger_multiplier = 0.45,
	stagger_resistance = 2,
	stagger_threshold_light = 0,
	target_selection = "pick_closest_target_near_detection_source_position",
	threat_value = 5,
	unit_template = "ai_unit_pet_skeleton",
	use_backstab_vo = true,
	use_regular_horde_spawning = true,
	use_slot_type = "medium",
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
		1,
		1,
	},
	max_health = {
		37 * CareerConstants.bw_necromancer.pet_balance_health_modifier * CareerConstants.bw_necromancer.armored_pet_health_additional_modifier,
		37 * CareerConstants.bw_necromancer.pet_balance_health_modifier * CareerConstants.bw_necromancer.armored_pet_health_additional_modifier,
		55 * CareerConstants.bw_necromancer.pet_balance_health_modifier * CareerConstants.bw_necromancer.armored_pet_health_additional_modifier,
		65 * CareerConstants.bw_necromancer.pet_balance_health_modifier * CareerConstants.bw_necromancer.armored_pet_health_additional_modifier,
		100 * CareerConstants.bw_necromancer.pet_balance_health_modifier * CareerConstants.bw_necromancer.armored_pet_health_additional_modifier,
		150 * CareerConstants.bw_necromancer.pet_balance_health_modifier * CareerConstants.bw_necromancer.armored_pet_health_additional_modifier,
		150 * CareerConstants.bw_necromancer.pet_balance_health_modifier * CareerConstants.bw_necromancer.armored_pet_health_additional_modifier,
		150 * CareerConstants.bw_necromancer.pet_balance_health_modifier * CareerConstants.bw_necromancer.armored_pet_health_additional_modifier,
		37 * CareerConstants.bw_necromancer.pet_balance_health_modifier * CareerConstants.bw_necromancer.armored_pet_health_additional_modifier,
	},
	bloodlust_health = BreedTweaks.bloodlust_health.chaos_roamer,
	hit_mass_counts = BreedTweaks.hit_mass_counts.raider,
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
	stagger_modifier_function = function (stagger_type, duration, length, hit_zone_name, blackboard, breed)
		if blackboard.stagger_type == stagger_types.heavy then
			if stagger_type == stagger_types.heavy and blackboard.heavy_stagger_immune_time then
				stagger_type = stagger_types.none
				duration = 0
				length = 0
			elseif stagger_type ~= stagger_types.heavy and blackboard.stagger_immune_time then
				stagger_type = stagger_types.none
				duration = 0
				length = 0
			end
		end

		return stagger_type, duration, length
	end,
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
				"attack_cleave_moving_01",
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

Breeds.pet_skeleton_armored = table.create_copy(Breeds.pet_skeleton_armored, breed_data)

local increased_armor_damage = 1.5
local AttackIntensityPerDifficulty = {
	sweep = {
		easy = {
			normal = 1.5,
			sweep = 3,
		},
		normal = {
			normal = 1.5,
			sweep = 3,
		},
		hard = {
			normal = 1.5,
			sweep = 3,
		},
		harder = {
			normal = 1.5,
			sweep = 3,
		},
		hardest = {
			normal = 1.5,
			sweep = 3,
		},
		cataclysm = {
			normal = 1.5,
			sweep = 3,
		},
		cataclysm_2 = {
			normal = 1.5,
			sweep = 3,
		},
		cataclysm_3 = {
			normal = 1.5,
			sweep = 3,
		},
		normal = {
			normal = 1.5,
			sweep = 3,
		},
	},
	cleave = {
		easy = {
			cleave = 3,
			normal = 1.5,
		},
		normal = {
			cleave = 3,
			normal = 1.5,
		},
		hard = {
			cleave = 3,
			normal = 1.5,
		},
		harder = {
			cleave = 3,
			normal = 1.5,
		},
		hardest = {
			cleave = 3,
			normal = 1.5,
		},
		cataclysm = {
			cleave = 3,
			normal = 1.5,
		},
		cataclysm_2 = {
			cleave = 3,
			normal = 1.5,
		},
		cataclysm_3 = {
			cleave = 3,
			normal = 1.5,
		},
		versus_base = {
			cleave = 3,
			normal = 1.5,
		},
	},
	push = {
		easy = {
			push = 1.5,
		},
		normal = {
			push = 1.5,
		},
		hard = {
			push = 1.5,
		},
		harder = {
			push = 1.5,
		},
		hardest = {
			push = 1.5,
		},
		cataclysm = {
			push = 1.5,
		},
		cataclysm_2 = {
			push = 1.5,
		},
		cataclysm_3 = {
			push = 1.5,
		},
		versus_base = {
			push = 1.5,
		},
	},
	running = {
		easy = {
			running = 3.5,
		},
		normal = {
			running = 3.5,
		},
		hard = {
			running = 3.5,
		},
		harder = {
			running = 3.5,
		},
		hardest = {
			running = 3.5,
		},
		cataclysm = {
			running = 3.5,
		},
		cataclysm_2 = {
			running = 3.5,
		},
		cataclysm_3 = {
			running = 3.5,
		},
		versus_base = {
			running = 3.5,
		},
	},
}
local action_data = {
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
	alerted = {
		action_weight = 1,
		close_range_alert_idle = false,
		cooldown = -1,
		no_hesitation = true,
		override_time_alerted = 1.8,
		alerted_anims = {
			"alerted",
		},
		easter_egg_alerted_anims = {
			"alerted_2",
		},
		start_anims_name = {
			fwd = {
				"alerted_fwd",
			},
			bwd = {
				"alerted_bwd",
			},
			left = {
				"alerted_left",
			},
			right = {
				"alerted_right",
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
		},
	},
	special_attack = {
		action_weight = 1,
		considerations = UtilityConsiderations.chaos_raider_special_attack,
	},
	moving_attack = {
		action_weight = 10,
		considerations = UtilityConsiderations.chaos_raider_moving_attack,
	},
	running_sweep_attack = {
		action_weight = 10,
		attack_intensity = 1,
		attack_intensity_type = "running",
		cooldown = 1,
		damage = 3,
		damage_type = "cutting",
		hit_react_type = "heavy",
		ignore_ai_damage = true,
		moving_attack = true,
		self_running_speed_threshold = 1,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.chaos_raider_running_attack,
		target_running_distance_threshold = math.huge,
		running_attacks = {
			{
				anim_driven = true,
				height = 1.5,
				hit_multiple_targets = true,
				lock_attack_time = 2.1,
				offset_forward = 0,
				offset_up = 0,
				range = 4,
				rotation_time = 0.8,
				width = 2.6,
				attack_anim = {
					"attack_run",
				},
				attack_time = math.huge,
				push_ai = {
					stagger_distance = 1,
					stagger_impact = {
						stagger_types.weak,
						stagger_types.weak,
						stagger_types.none,
						stagger_types.none,
					},
					stagger_duration = {
						1,
						0.5,
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
				offset_forward = 0,
				offset_up = 0,
				range = 4,
				rotation_time = 0.8,
				width = 2.2,
				attack_anim = {
					"attack_run_2",
				},
				attack_time = math.huge,
				push_ai = {
					stagger_distance = 1,
					stagger_impact = {
						stagger_types.weak,
						stagger_types.weak,
						stagger_types.none,
						stagger_types.none,
					},
					stagger_duration = {
						1,
						0.5,
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
				range = 4,
				rotation_time = 0.8,
				width = 2.6,
				attack_anim = {
					"attack_move",
				},
				attack_time = math.huge,
				push_ai = {
					stagger_distance = 1,
					stagger_impact = {
						stagger_types.weak,
						stagger_types.weak,
						stagger_types.none,
						stagger_types.none,
					},
					stagger_duration = {
						1,
						0.5,
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
				offset_forward = 0,
				offset_up = 0,
				range = 4,
				rotation_time = 0.8,
				width = 2.2,
				attack_anim = {
					"attack_move_2",
				},
				attack_time = math.huge,
				push_ai = {
					stagger_distance = 1,
					stagger_impact = {
						stagger_types.weak,
						stagger_types.weak,
						stagger_types.none,
						stagger_types.none,
					},
					stagger_duration = {
						1,
						0.5,
						0,
						0,
					},
				},
				immune_breeds = {
					skaven_grey_seer = true,
				},
			},
		},
		ignore_staggers = {
			true,
			false,
			false,
			false,
			false,
			false,
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
				6,
				3,
				9,
				0,
				5,
				2,
			},
		},
		fatigue_type = BreedTweaks.fatigue_types.elite_sweep.running_attack,
		hit_ai_func = hit_ai_func,
	},
	special_attack_cleave = {
		attack_intensity_type = "cleave",
		cooldown = 1,
		damage = 5,
		damage_type = "cutting",
		height = 2,
		hit_react_type = "heavy",
		ignore_ai_damage = true,
		no_block_stagger = true,
		offset_forward = 0,
		offset_up = 0,
		range = 2.75,
		rotation_time = 1,
		width = 0.4,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		attacks = {
			{
				anim_driven = true,
				height = 2,
				hit_multiple_targets = true,
				lock_attack_time = 2.1,
				offset_forward = 0,
				offset_up = 0,
				range = 2.8,
				rotation_time = 0.8,
				width = 1,
				attack_anim = {
					"attack_cleave",
					"attack_cleave_02",
				},
				attack_time = math.huge,
				push_ai = {
					stagger_distance = 1,
					stagger_impact = {
						stagger_types.weak,
						stagger_types.weak,
						stagger_types.none,
						stagger_types.none,
					},
					stagger_duration = {
						1,
						0.5,
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
				6,
				3,
				9,
				0,
				5,
				2,
			},
		},
		fatigue_type = BreedTweaks.fatigue_types.elite_cleave.normal_attack,
		ignore_staggers = {
			true,
			false,
			false,
			false,
			false,
			false,
		},
		hit_ai_func = hit_ai_func,
	},
	special_attack_sweep = {
		attack_intensity_type = "sweep",
		cooldown = 1,
		damage = 5,
		damage_type = "cutting",
		height = 2,
		ignore_ai_damage = true,
		no_block_stagger = true,
		offset_forward = 0,
		offset_up = 0,
		range = 2.75,
		rotation_time = 1,
		width = 0.4,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		attacks = {
			{
				anim_driven = true,
				height = 2,
				hit_multiple_targets = true,
				lock_attack_time = 2.1,
				offset_forward = 0,
				offset_up = 0,
				range = 3,
				rotation_time = 0.8,
				width = 2.5,
				attack_anim = {
					"attack_pounce",
					"attack_pounce_3",
					"attack_pounce_4",
				},
				attack_time = math.huge,
				push_ai = {
					stagger_distance = 1,
					stagger_impact = {
						stagger_types.weak,
						stagger_types.weak,
						stagger_types.none,
						stagger_types.none,
					},
					stagger_duration = {
						1,
						0.5,
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
				height = 2,
				hit_multiple_targets = true,
				lock_attack_time = 2.1,
				offset_forward = 0,
				offset_up = 0,
				range = 3,
				rotation_time = 0.8,
				width = 2.2,
				attack_anim = {
					"attack_pounce_2",
				},
				attack_time = math.huge,
				push_ai = {
					stagger_distance = 1,
					stagger_impact = {
						stagger_types.weak,
						stagger_types.weak,
						stagger_types.none,
						stagger_types.none,
					},
					stagger_duration = {
						1,
						0.5,
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
				6,
				3,
				9,
				0,
				5,
				2,
			},
		},
		fatigue_type = BreedTweaks.fatigue_types.elite_sweep.normal_attack,
		ignore_staggers = {
			true,
			false,
			false,
			false,
			false,
			false,
		},
		hit_ai_func = hit_ai_func,
	},
	push_attack = {
		action_weight = 1,
		attack_anim = "attack_push",
		attack_intensity_type = "push",
		damage = 0,
		damage_type = "blunt",
		fatigue_type = "sv_push",
		hit_react_type = "heavy",
		impact_push_speed = 7,
		max_impact_push_speed = 8,
		step_attack_anim = "attack_push_moving",
		unblockable = true,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.chaos_raider_push_attack,
		ignore_staggers = {
			true,
			false,
			false,
			true,
			true,
			false,
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_elite,
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
	combat_shout = {
		action_weight = 1,
		cooldown = -1,
		shout_anim = "shout",
		considerations = UtilityConsiderations.clan_rat_shout,
	},
	smash_door = {
		attack_anim = "attack_blocker",
		damage = 3,
		damage_type = "cutting",
		move_anim = "move_fwd",
		name = "smash_door",
		unblockable = true,
	},
	blocked = {
		blocked_anims = {
			"blocked",
			"blocked_2",
		},
		difficulty_duration = BreedTweaks.blocked_duration.chaos_elite,
	},
	ability_charge = {
		cancel_animation = "ability_test_charge_finish",
		cancel_slow_down_speed = 2,
		charge_blocked_animation = "ability_test_charge_finish",
		charge_distance = 11,
		charge_max_speed_at = 1.5,
		charge_rotation_speed = 10,
		charge_speed_max = 10,
		charge_speed_min = 6,
		damage = 5,
		dodge_past_push_speed = 8,
		fatigue_type = "blocked_charge",
		head_radius = 1.3,
		hit_ai_radius = 0.5,
		hit_target_slow_down_speed = 3,
		ignore_friendly_ai = true,
		ignore_ledge_death = true,
		max_charge_t = 15,
		max_slowdown_angle = 40,
		max_slowdown_percentage = 0.25,
		min_slowdown_angle = 20,
		player_push_speed = 9.5,
		player_push_speed_blocked = 10,
		radius = 1,
		shield_blocked_fatigue_type = "blocked_sv_cleave",
		slow_down_speed = 1,
		start_animation = "charge_start",
		target_dodged_radius = 0.5,
		target_extrapolation_length_scale = 50,
		wall_collision_check_range = 0.75,
		charging_animations = {
			far = "ability_test_charge",
			medium = "ability_test_charge",
			short = "ability_test_charge",
		},
		impact_animation = {
			"ability_test_charge_finish",
		},
		charge_at_max_speed_duration = math.huge,
		charging_distance_thresholds = {
			far = 10,
			medium = 6,
			short = 4,
		},
		tracking_durations = {
			far = 4,
			medium = 1.5,
			short = 1,
		},
		difficulty_damage = {
			cataclysm = 10,
			cataclysm_2 = 10,
			cataclysm_3 = 10,
			easy = 2,
			hard = 4,
			harder = 5,
			hardest = 6,
			normal = 3,
			versus_base = 3,
		},
		push_ai = {
			stagger_distance = 1.5,
			stagger_impact = {
				stagger_types.heavy,
				stagger_types.heavy,
				stagger_types.none,
				stagger_types.none,
				stagger_types.medium,
			},
			stagger_duration = {
				1,
				0.5,
				0,
				0,
				4,
			},
		},
	},
	special_attack_cleave_tutorial = {
		action_weight = 1,
		attack_intensity_type = "cleave",
		bot_threat_duration = 0.7,
		bot_threat_start_time = 0.7,
		bot_threat_start_time_step = 1.6,
		cooldown = 1,
		damage = 5,
		damage_type = "cutting",
		fatigue_type = "chaos_cleave",
		height = 2,
		hit_react_type = "heavy",
		move_anim = "move_fwd",
		no_block_stagger = true,
		offset_forward = 0,
		offset_up = 0,
		range = 3.1,
		rotation_time = 1,
		rotation_time_step = 2.1,
		width = 0.4,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.chaos_raider_special_attack,
		attack_anim = {
			"attack_cleave_02",
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
				6,
				3,
				9,
				0,
				5,
				2,
			},
		},
		ignore_staggers = {
			true,
			false,
			false,
			false,
			false,
			false,
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_elite,
	},
	stagger = {
		scale_animation_speeds = true,
		custom_enter_function = function (unit, blackboard, t, action)
			if blackboard.stagger_type == stagger_types.heavy then
				blackboard.stagger_immune_time = t + 2.25
				blackboard.heavy_stagger_immune_time = t + 1.5
			elseif blackboard.stagger_type == stagger_types.explosion then
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
		},
	},
	follow_owner = {},
}

action_data.moving_special_attack_sweep = table.clone(action_data.special_attack_sweep)
action_data.moving_special_attack_sweep.target_running_velocity_threshold = 2
action_data.moving_special_attack_sweep.running_attacks = {
	{
		anim_driven = true,
		attack_time = 1.3666666666666667,
		height = 2,
		hit_multiple_targets = true,
		lock_attack_time = 2.1,
		offset_forward = 0,
		offset_up = 0,
		range = 5,
		rotation_time = 2,
		width = 1,
		attack_anim = {
			"attack_move",
			"attack_move_2",
		},
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
	},
	{
		anim_driven = true,
		attack_time = 1.6,
		height = 2,
		hit_multiple_targets = true,
		lock_attack_time = 2.1,
		offset_forward = 0,
		offset_up = 0,
		range = 5,
		rotation_time = 2,
		width = 1,
		attack_anim = {
			"attack_move_2",
		},
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
	},
}
action_data.moving_special_attack_cleave = table.clone(action_data.special_attack_cleave)
action_data.moving_special_attack_cleave.target_running_velocity_threshold = 2
action_data.moving_special_attack_cleave.running_attacks = {
	{
		anim_driven = true,
		attack_time = 2.7666666666666666,
		height = 2,
		hit_multiple_targets = true,
		offset_forward = 0,
		offset_up = 0,
		range = 5,
		rotation_time = 2,
		width = 1,
		attack_anim = {
			"attack_cleave_moving_01",
		},
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
	},
}
action_data.command_attack = table.clone(action_data.special_attack_sweep)
action_data.command_attack.considerations = UtilityConsiderations.command_attack
action_data.command_attack.action_weight = 1
action_data.running_command_attack = table.clone(action_data.running_sweep_attack)
action_data.running_command_attack.considerations = UtilityConsiderations.running_command_attack
action_data.fallback_idle = action_data.idle
BreedActions.pet_skeleton_armored = table.create_copy(BreedActions.pet_skeleton_armored, action_data)

-- chunkname: @scripts/settings/breeds/breed_pet_skeleton_with_shield.lua

local stagger_types = require("scripts/utils/stagger_types")
local breed_data = {
	ai_strength = 1,
	aim_template = "chaos_marauder",
	animation_sync_rpc = "rpc_sync_anim_state_7",
	aoe_height = 1.4,
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
	default_inventory_template = "undead_npc_skeleton_with_shield",
	detection_radius = 18,
	die_on_vortex_land = false,
	during_horde_detection_radius = 15,
	enter_walk_distance = 0.25,
	exchange_order = 4,
	far_off_despawn_immunity = true,
	flingable = true,
	follow_reach = 1,
	force_walk_while_tired = true,
	has_inventory = true,
	has_running_attack = true,
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
	poison_resistance = 100,
	push_sound_event = "Play_generic_pushed_impact_large",
	race = "undead",
	radius = 1,
	run_max_speed_distance = 4,
	run_min_speed_distance = 1.5,
	run_speed = 6,
	scale_death_push = 0.35,
	shield_opening_event = "idle",
	shield_user = true,
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
	unit_template = "ai_unit_pet_skeleton_with_shield",
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
	infighting = InfightingSettings.skeleton_pet_shield,
	perception_exceptions = {
		poison_well = true,
		wizard_destructible = true,
	},
	size_variation_range = {
		0.9,
		1,
	},
	max_health = {
		20.8125,
		20.8125,
		30.9375,
		36.5625,
		56.25,
		84.375,
		84.375,
		84.375,
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

Breeds.pet_skeleton_with_shield = table.create_copy(Breeds.pet_skeleton_with_shield, breed_data)

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
	ability_shield_bash = {
		action_weight = 1,
		attack_direction = "right",
		attack_intensity_type = "push",
		damage = 0,
		damage_type = "blunt",
		fatigue_type = "blocked_slam",
		hit_react_type = "heavy",
		impact_push_speed = 22,
		max_impact_push_speed = 18,
		range = 3.5,
		unblockable = true,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.chaos_warrior_push_attack,
		anims = {
			"ability_shield_bash",
		},
		damage_angle = math.pi,
		push_data = {
			stagger_distance = 1,
			stagger_impact = {
				stagger_types.heavy,
				stagger_types.medium,
				stagger_types.none,
				stagger_types.weak,
			},
			stagger_duration = {
				1,
				0.5,
				0,
				0,
			},
		},
		ignore_staggers = {
			[stagger_types.none] = true,
			[stagger_types.weak] = true,
			[stagger_types.medium] = true,
			[stagger_types.heavy] = true,
			[stagger_types.ranged_weak] = true,
			[stagger_types.ranged_medium] = true,
			[stagger_types.explosion] = false,
			[stagger_types.weakspot] = true,
			[stagger_types.pulling] = true,
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_elite,
	},
	shield_bash = {
		action_weight = 1,
		attack_intensity_type = "push",
		damage = 0,
		damage_type = "blunt",
		fatigue_type = "blocked_slam",
		hit_react_type = "heavy",
		ignore_ai_damage = true,
		impact_push_speed = 22,
		max_impact_push_speed = 18,
		unblockable = true,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.chaos_warrior_push_attack,
		attacks = {
			{
				anim_driven = true,
				height = 1.5,
				hit_multiple_targets = true,
				lock_attack_time = 2.1,
				offset_forward = -1,
				offset_up = 0,
				range = 3.5,
				rotation_time = 0.8,
				width = 3.5,
				attack_anim = {
					"attack_shield_bash",
				},
				attack_time = math.huge,
				push_ai = {
					stagger_distance = 2,
					stagger_impact = {
						stagger_types.medium,
						stagger_types.weak,
						stagger_types.none,
						stagger_types.none,
					},
					stagger_duration = {
						2,
						1,
						0,
						0,
					},
				},
				immune_breeds = {
					skaven_grey_seer = true,
				},
			},
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_elite,
		ignore_staggers = {
			[stagger_types.none] = true,
			[stagger_types.weak] = true,
			[stagger_types.medium] = true,
			[stagger_types.heavy] = true,
			[stagger_types.ranged_weak] = true,
			[stagger_types.ranged_medium] = true,
			[stagger_types.explosion] = false,
			[stagger_types.weakspot] = true,
			[stagger_types.pulling] = true,
		},
	},
	taunt = {
		action_weight = 1,
		duration = 8,
		effect_name = "fx/chr_kruber_shockwave",
		radius = 11,
		sound_event = "Play_career_necro_ability_skeleton_taunt",
		considerations = UtilityConsiderations.pet_skeleton_taunt,
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
			assert(ScriptUnit.has_extension(unit, "ai_shield_system"), "chaos_marauder_with_shield dont have ai_shield_user_extension")

			if blackboard.shield_breaking_hit then
				blackboard.shield_breaking_hit = false

				return action.shield_break_anims[blackboard.stagger_type], "idle", "to_sword"
			end

			local ai_shield_extension = ScriptUnit.extension(unit, "ai_shield_system")
			local stagger_anims, idle_event
			local blocked_stagger = false
			local blocked_previous_attack = ai_shield_extension.blocked_previous_attack
			local using_shield = not ai_shield_extension.shield_broken

			if using_shield and not blackboard.stagger_immune_time and blocked_previous_attack then
				local is_blocking = blackboard.stagger <= 2

				ai_shield_extension:set_is_blocking(is_blocking)

				if not is_blocking then
					blackboard.stagger_time = blackboard.stagger_time + math.clamp(0.2 * blackboard.stagger, 0, 0.6)
				end

				if not blackboard.blocked and blackboard.stagger < 3 and action.shield_block_anims then
					blocked_stagger = true
					stagger_anims = action.shield_block_anims[blackboard.stagger_type]
					idle_event = "idle"
				elseif not blackboard.blocked and blackboard.stagger < 4 and action.shield_stagger_anims then
					blocked_stagger = true
					stagger_anims = action.shield_stagger_anims[blackboard.stagger_type]
					idle_event = blackboard.breed.shield_opening_event or "idle"
				else
					stagger_anims = action.stagger_anims[blackboard.stagger_type]
					idle_event = blackboard.breed.shield_opening_event or "idle"
				end
			else
				ai_shield_extension:set_is_blocking(false)

				stagger_anims = action.stagger_anims[blackboard.stagger_type]
				idle_event = "idle"
			end

			if blackboard.stagger_type == 3 then
				blackboard.stagger_immune_time = t + 2.25
				blackboard.heavy_stagger_immune_time = t + 1.5
			elseif blackboard.stagger_type == 6 then
				blackboard.stagger_immune_time = t + 3.5
				blackboard.heavy_stagger_immune_time = t + 3
			end

			if blocked_previous_attack then
				ai_shield_extension.blocked_previous_attack = false
			end

			return stagger_anims, idle_event
		end,
		custom_exit_function = function (unit, blackboard, t)
			local ai_shield_extension = ScriptUnit.has_extension(unit, "ai_shield_system") and ScriptUnit.extension(unit, "ai_shield_system")

			ai_shield_extension:set_is_blocking(true)
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
		shield_block_anims = {
			{
				fwd = {
					"stagger_shield_light",
				},
				bwd = {
					"stagger_shield_light",
				},
				left = {
					"stagger_left_shield_light",
				},
				right = {
					"stagger_right_shield_light",
				},
				dwn = {
					"stagger_shield_light",
				},
			},
			{
				fwd = {
					"stagger_shield_medium",
				},
				bwd = {
					"stagger_shield_medium",
				},
				left = {
					"stagger_left_shield",
				},
				right = {
					"stagger_right_shield",
				},
				dwn = {
					"stagger_shield_medium",
				},
			},
			{
				fwd = {
					"stagger_shield_medium",
				},
				bwd = {
					"stagger_shield_medium",
				},
				left = {
					"stagger_left_shield",
				},
				right = {
					"stagger_right_shield",
				},
				dwn = {
					"stagger_shield_medium",
				},
			},
			{
				fwd = {
					"stagger_shield_light",
				},
				bwd = {
					"stagger_shield_light",
				},
				left = {
					"stagger_left_shield_light",
				},
				right = {
					"stagger_right_shield_light",
				},
			},
			{
				fwd = {
					"stagger_shield_medium",
				},
				bwd = {
					"stagger_shield_medium",
				},
				left = {
					"stagger_left_shield",
				},
				right = {
					"stagger_right_shield",
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
					"stagger_shield_medium",
				},
				bwd = {
					"stagger_shield_medium",
				},
				left = {
					"stagger_left_shield",
				},
				right = {
					"stagger_right_shield",
				},
				dwn = {
					"stagger_shield_medium",
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
					"stagger_shield_medium",
				},
				bwd = {
					"stagger_shield_medium",
				},
				left = {
					"stagger_left_shield",
				},
				right = {
					"stagger_right_shield",
				},
				dwn = {
					"stagger_shield_medium",
				},
			},
		},
		shield_break_anims = {
			{
				fwd = {
					"stagger_shield_medium_break",
				},
				bwd = {
					"stagger_shield_medium_break",
				},
				left = {
					"stagger_shield_medium_break",
				},
				right = {
					"stagger_shield_medium_break",
				},
				dwn = {
					"stagger_shield_medium_break",
				},
			},
			{
				fwd = {
					"stagger_shield_medium_break",
				},
				bwd = {
					"stagger_shield_medium_break",
				},
				left = {
					"stagger_shield_medium_break",
				},
				right = {
					"stagger_shield_medium_break",
				},
				dwn = {
					"stagger_shield_medium_break",
				},
			},
			{
				fwd = {
					"stagger_shield_medium_break",
				},
				bwd = {
					"stagger_shield_medium_break",
				},
				left = {
					"stagger_shield_medium_break",
				},
				right = {
					"stagger_shield_medium_break",
				},
				dwn = {
					"stagger_shield_medium_break",
				},
			},
			{
				fwd = {
					"stagger_shield_medium_break",
				},
				bwd = {
					"stagger_shield_medium_break",
				},
				left = {
					"stagger_shield_medium_break",
				},
				right = {
					"stagger_shield_medium_break",
				},
				dwn = {
					"stagger_shield_medium_break",
				},
			},
			{
				fwd = {
					"stagger_shield_medium_break",
				},
				bwd = {
					"stagger_shield_medium_break",
				},
				left = {
					"stagger_shield_medium_break",
				},
				right = {
					"stagger_shield_medium_break",
				},
				dwn = {
					"stagger_shield_medium_break",
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
					"stagger_shield_medium_break",
				},
				bwd = {
					"stagger_shield_medium_break",
				},
				left = {
					"stagger_shield_medium_break",
				},
				right = {
					"stagger_shield_medium_break",
				},
				dwn = {
					"stagger_shield_medium_break",
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
					"stagger_shield_medium_break",
				},
				bwd = {
					"stagger_shield_medium_break",
				},
				left = {
					"stagger_shield_medium_break",
				},
				right = {
					"stagger_shield_medium_break",
				},
				dwn = {
					"stagger_shield_medium_break",
				},
			},
		},
		shield_stagger_anims = {
			{
				fwd = {
					"stagger_bwd_shield_light",
				},
				bwd = {
					"stagger_bwd_shield_light",
				},
				left = {
					"stagger_bwd_shield_light",
				},
				right = {
					"stagger_bwd_shield_light",
				},
				dwn = {
					"stagger_bwd_shield_light",
				},
			},
			{
				fwd = {
					"stagger_bwd_shield",
				},
				bwd = {
					"stagger_bwd_shield",
				},
				left = {
					"stagger_bwd_shield",
				},
				right = {
					"stagger_bwd_shield",
				},
				dwn = {
					"stagger_bwd_shield",
				},
			},
			{
				fwd = {
					"stagger_bwd_shield_heavy",
				},
				bwd = {
					"stagger_bwd_shield_heavy",
				},
				left = {
					"stagger_bwd_shield_heavy",
				},
				right = {
					"stagger_bwd_shield_heavy",
				},
				dwn = {
					"stagger_bwd_shield_heavy",
				},
			},
			{
				fwd = {
					"stagger_bwd_shield_light",
				},
				bwd = {
					"stagger_bwd_shield_light",
				},
				left = {
					"stagger_bwd_shield_light",
				},
				right = {
					"stagger_bwd_shield_light",
				},
				dwn = {
					"stagger_bwd_shield_light",
				},
			},
			{
				fwd = {
					"stagger_bwd_shield",
				},
				bwd = {
					"stagger_bwd_shield",
				},
				left = {
					"stagger_bwd_shield",
				},
				right = {
					"stagger_bwd_shield",
				},
				dwn = {
					"stagger_bwd_shield",
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
					"stagger_bwd_shield",
				},
				bwd = {
					"stagger_bwd_shield",
				},
				left = {
					"stagger_bwd_shield",
				},
				right = {
					"stagger_bwd_shield",
				},
				dwn = {
					"stagger_bwd_shield",
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
					"stagger_bwd_shield_heavy",
				},
				bwd = {
					"stagger_bwd_shield_heavy",
				},
				left = {
					"stagger_bwd_shield_heavy",
				},
				right = {
					"stagger_bwd_shield_heavy",
				},
				dwn = {
					"stagger_bwd_shield_heavy",
				},
			},
		},
	},
	follow_owner = {},
}

action_data.fallback_idle = action_data.idle
BreedActions.pet_skeleton_with_shield = table.create_copy(BreedActions.pet_skeleton_with_shield, action_data)

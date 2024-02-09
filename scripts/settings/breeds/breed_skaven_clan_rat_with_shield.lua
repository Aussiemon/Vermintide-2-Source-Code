-- chunkname: @scripts/settings/breeds/breed_skaven_clan_rat_with_shield.lua

local stagger_types = require("scripts/utils/stagger_types")
local breed_data = {
	ai_strength = 1,
	ai_toughness = 2,
	allow_aoe_push = true,
	animation_sync_rpc = "rpc_sync_anim_state_7",
	aoe_height = 1.4,
	armor_category = 1,
	attack_general_sound_event = "Play_clan_rat_attack_vce",
	attack_player_sound_event = "Play_clan_rat_attack_player_vce",
	backstab_player_sound_event = "Play_clan_rat_attack_player_back_vce",
	base_unit = "units/beings/enemies/skaven_clan_rat/chr_skaven_clan_rat",
	behavior = "shield_rat",
	bone_lod_level = 1,
	death_reaction = "ai_default",
	death_sound_event = "Play_clan_rat_die_vce",
	default_inventory_template = "skaven_clan_rat_sword_and_shield",
	detection_radius = 12,
	dialogue_source_name = "skaven_clan_rat_with_shield",
	during_horde_detection_radius = 15,
	exchange_order = 4,
	flingable = true,
	has_inventory = true,
	has_running_attack = true,
	hit_effect_template = "HitEffectsSkavenClanRatShield",
	hit_mass_count = 1.5,
	hit_mass_count_block = 3,
	hit_reaction = "ai_default",
	horde_behavior = "horde_shield_rat",
	horde_target_selection = "horde_pick_closest_target_with_spillover",
	is_always_spawnable = true,
	no_stagger_duration = false,
	opt_default_inventory_template = "opt_skaven_clan_rat_sword_and_shield",
	panic_close_detection_radius_sq = 9,
	passive_walk_speed = 2,
	patrol_active_perception = "perception_regular",
	patrol_active_target_selection = "storm_patrol_death_squad_target_selection",
	patrol_detection_radius = 10,
	patrol_passive_perception = "perception_regular",
	patrol_passive_target_selection = "patrol_passive_target_selection",
	perception = "perception_regular",
	perception_previous_attacker_stickyness_value = -7.75,
	player_locomotion_constrain_radius = 0.7,
	poison_resistance = 70,
	proximity_system_check = true,
	race = "skaven",
	radius = 2,
	run_speed = 4.75,
	scale_death_push = 0.65,
	shield_opening_event = "idle_shield_down",
	shield_user = true,
	slot_template = "skaven_roamer",
	smart_object_template = "default_clan_rat",
	stagger_resistance = 1.5,
	stagger_threshold_light = 0,
	target_selection = "pick_closest_target_with_spillover",
	threat_value = 2,
	unit_template = "ai_unit_shield_rat",
	unit_variation_setting_name = "skaven_clan_rat_with_shield",
	use_backstab_vo = true,
	uses_attack_sfx_callback = true,
	vortexable = true,
	walk_speed = 2.75,
	weapon_reach = 2,
	wwise_voice_switch_group = "clan_rat_vce",
	size_variation_range = {
		1.05,
		1.075,
	},
	animation_merge_options = {
		idle_animation_merge_options = {},
		move_animation_merge_options = {},
		walk_animation_merge_options = {},
		interest_point_animation_merge_options = {},
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
			},
		},
		neck = {
			prio = 1,
			actors = {
				"c_neck",
			},
			push_actors = {
				"j_head",
				"j_neck",
				"j_spine1",
			},
		},
		torso = {
			prio = 2,
			actors = {
				"c_spine2",
				"c_spine",
				"c_hips",
			},
			push_actors = {
				"j_neck",
				"j_spine1",
				"j_hips",
			},
		},
		left_arm = {
			prio = 3,
			actors = {
				"c_leftarm",
				"c_leftforearm",
				"c_lefthand",
			},
			push_actors = {
				"j_spine1",
				"j_leftshoulder",
				"j_leftarm",
			},
		},
		right_arm = {
			prio = 3,
			actors = {
				"c_rightarm",
				"c_rightforearm",
				"c_righthand",
			},
			push_actors = {
				"j_spine1",
				"j_rightshoulder",
				"j_rightarm",
			},
		},
		left_leg = {
			prio = 3,
			actors = {
				"c_leftupleg",
				"c_leftleg",
				"c_leftfoot",
				"c_lefttoebase",
			},
			push_actors = {
				"j_leftfoot",
				"j_rightfoot",
				"j_hips",
			},
		},
		right_leg = {
			prio = 3,
			actors = {
				"c_rightupleg",
				"c_rightleg",
				"c_rightfoot",
				"c_righttoebase",
			},
			push_actors = {
				"j_leftfoot",
				"j_rightfoot",
				"j_hips",
			},
		},
		tail = {
			prio = 3,
			actors = {
				"c_tail1",
				"c_tail2",
				"c_tail3",
				"c_tail4",
				"c_tail5",
				"c_tail6",
			},
			push_actors = {
				"j_hips",
				"j_taill",
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
		c_lefttoebase = "j_lefttoebase",
		c_leftupleg = "j_leftupleg",
		c_neck = "j_neck",
		c_rightarm = "j_rightarm",
		c_rightfoot = "j_rightfoot",
		c_rightforearm = "j_rightforearm",
		c_righthand = "j_righthand",
		c_rightleg = "j_rightleg",
		c_righttoebase = "j_righttoebase",
		c_rightupleg = "j_rightupleg",
		c_spine = "j_spine",
		c_spine2 = "j_spine1",
		c_tail1 = "j_taill",
		c_tail2 = "j_tail2",
		c_tail3 = "j_tail3",
		c_tail4 = "j_tail4",
		c_tail5 = "j_tail5",
		c_tail6 = "j_tail6",
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
		j_tail2 = 0.05,
		j_tail3 = 0.05,
		j_tail4 = 0.05,
		j_tail5 = 0.05,
		j_tail6 = 0.05,
		j_taill = 0.05,
	},
	perception_exceptions = {
		poison_well = true,
		wizard_destructible = true,
	},
	infighting = InfightingSettings.small,
	max_health = BreedTweaks.max_health.clan_rat_with_shield,
	bloodlust_health = BreedTweaks.bloodlust_health.skaven_roamer,
	diff_stagger_resist = BreedTweaks.diff_stagger_resist.clan_rat,
	stagger_duration = BreedTweaks.stagger_duration.clan_rat,
	stagger_duration_difficulty_mod = BreedTweaks.stagger_duration_difficulty_mod.default,
	hit_mass_counts = BreedTweaks.hit_mass_counts.clan_rat,
	hit_mass_counts_block = BreedTweaks.hit_mass_counts.clan_rat_shield_block,
	num_push_anims = {
		push_backward = 2,
	},
	wwise_voices = {
		"shield_rat_high",
		"james_medium",
		"magnus_medium",
		"shield_rat_low",
	},
	status_effect_settings = {
		category = "small",
	},
	debug_color = {
		255,
		200,
		40,
		40,
	},
}

Breeds.skaven_clan_rat_with_shield = table.create_copy(Breeds.skaven_clan_rat_with_shield, breed_data)

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
	alerted = {
		action_weight = 1,
		cooldown = -1,
		no_hesitation = true,
		start_anims_name = {
			bwd = "slam_shield_bwd",
			fwd = "slam_shield_fwd",
			left = "slam_shield_left",
			right = "slam_shield_right",
		},
		start_anims_data = {
			slam_shield_fwd = {},
			slam_shield_bwd = {
				dir = -1,
				rad = math.pi,
			},
			slam_shield_left = {
				dir = 1,
				rad = math.pi / 2,
			},
			slam_shield_right = {
				dir = -1,
				rad = math.pi / 2,
			},
		},
	},
	follow = {
		action_weight = 1,
		cooldown = -1,
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
		considerations = UtilityConsiderations.clan_rat_follow,
	},
	climb = {},
	running_attack = {
		action_weight = 10,
		attack_intensity_type = "running",
		damage = 3,
		damage_type = "cutting",
		moving_attack = true,
		player_push_speed = 3,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		default_attack = {
			anims = "attack_move",
		},
		difficulty_damage = BreedTweaks.difficulty_damage.skaven_roamer_attack,
		diminishing_damage = {},
		difficulty_diminishing_damage = BreedTweaks.diminishing_damage_and_cooldown.roamer,
		considerations = UtilityConsiderations.clan_rat_running_attack,
		fatigue_type = BreedTweaks.fatigue_types.roamer.running_attack,
		attack_finished_duration = BreedTweaks.attack_finished_duration.skaven_roamer,
		dodge_window_start = BreedTweaks.dodge_windows.running_attack,
		dodge_window_duration = BreedTweaks.dodge_window_durations.running_attack,
	},
	normal_attack = {
		action_weight = 1,
		attack_intensity_type = "normal",
		damage = 3,
		damage_type = "cutting",
		move_anim = "move_fwd",
		player_push_speed = 3,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		default_attack = {
			anims = {
				"attack_pounce",
				"attack_pounce_3",
				"attack_pounce_4",
			},
			damage_box_range = {
				down = -0.75,
				flat = 2,
				up = 1.7,
			},
		},
		high_attack = {
			z_threshold = 1.5,
			anims = {
				"attack_reach_up",
				"attack_reach_up_2",
				"attack_reach_up_3",
				"attack_reach_up_4",
			},
			damage_box_range = {
				down = 0,
				flat = 1.5,
				up = 3.8,
			},
		},
		mid_attack = {
			flat_threshold = 1.5,
			z_threshold = -0.6,
			anims = {
				"attack_pounce_down",
				"attack_pounce_down_2",
				"attack_pounce_down_3",
			},
			damage_box_range = {
				down = -2,
				flat = 2,
				up = 1.7,
			},
		},
		low_attack = {
			z_threshold = -0.6,
			anims = {
				"attack_reach_down",
				"attack_reach_down_2",
				"attack_reach_down_3",
			},
			damage_box_range = {
				down = -3,
				flat = 1,
				up = 1.7,
			},
		},
		knocked_down_attack = {
			z_threshold = 0.6,
			anims = {
				"attack_pounce_down",
				"attack_pounce_down_2",
				"attack_pounce_down_3",
			},
			damage_box_range = {
				down = -3,
				flat = 1,
				up = 1.7,
			},
		},
		target_type_exceptions = {
			poison_well = {
				anims = "poison_well",
				damage_box_range = {
					down = -0.75,
					flat = 2,
					up = 1.7,
				},
			},
		},
		difficulty_damage = BreedTweaks.difficulty_damage.skaven_roamer_attack,
		diminishing_damage = {},
		difficulty_diminishing_damage = BreedTweaks.diminishing_damage_and_cooldown.roamer,
		considerations = UtilityConsiderations.clan_rat_attack,
		fatigue_type = BreedTweaks.fatigue_types.roamer.normal_attack,
		attack_directions = {
			attack_move = "left",
			attack_move_1 = "left",
			attack_move_2 = "left",
			attack_pounce = "left",
			attack_pounce_2 = "left",
			attack_pounce_3 = "left",
			attack_pounce_4 = "left",
			attack_pounce_down = "left",
			attack_pounce_down_2 = "right",
			attack_pounce_down_3 = "left",
			attack_reach_down = "left",
			attack_reach_down_2 = "left",
			attack_reach_down_3 = "right",
			attack_reach_up = "left",
			attack_reach_up_2 = "left",
			attack_reach_up_3 = "right",
			attack_reach_up_4 = "left",
			attack_run = "left",
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.skaven_roamer,
		dodge_window_start = BreedTweaks.dodge_windows.normal_attack,
		dodge_window_duration = BreedTweaks.dodge_window_durations.normal_attack,
	},
	combat_shout = {
		action_weight = 1,
		cooldown = -1,
		shout_anim = "shout",
		considerations = UtilityConsiderations.clan_rat_shout,
	},
	smash_door = {
		attack_anim = "attack_pounce",
		damage = 1,
		damage_type = "cutting",
		move_anim = "move_fwd",
		name = "smash_door",
		unblockable = true,
	},
	interest_point_choose = {
		max_range = 10,
		min_range = 4,
		name = "interest_point_choose",
	},
	blocked = {
		blocked_anims = {
			"blocked",
			"blocked_2",
			"blocked_3",
		},
		difficulty_duration = BreedTweaks.blocked_duration.skaven_roamer,
	},
	stagger = {
		scale_animation_speeds = true,
		custom_enter_function = function (unit, blackboard, t, action)
			assert(ScriptUnit.has_extension(unit, "ai_shield_system"), "skaven_clan_rat_with_shield dont have ai_shield_user_extension")

			if blackboard.shield_breaking_hit then
				blackboard.shield_breaking_hit = false

				return action.shield_break_anims[blackboard.stagger_type], "idle", "to_sword"
			end

			local ai_shield_extension = ScriptUnit.extension(unit, "ai_shield_system")
			local stagger_anims, idle_event
			local using_shield = not ai_shield_extension.shield_broken

			if using_shield then
				local is_blocking = blackboard.stagger <= 1 and blackboard.stagger_type ~= stagger_types.explosion

				ai_shield_extension:set_is_blocking(is_blocking)

				if not is_blocking then
					blackboard.stagger_time = blackboard.stagger_time + math.clamp(0.2 * blackboard.stagger, 0, 0.6)
				end

				if not blackboard.blocked and blackboard.stagger < 2 and action.shield_block_anims then
					stagger_anims = action.shield_block_anims[blackboard.stagger_type]
					idle_event = "idle"
				elseif not blackboard.blocked and blackboard.stagger < 3 and action.shield_stagger_anims then
					stagger_anims = action.shield_stagger_anims[blackboard.stagger_type]
					idle_event = blackboard.breed.shield_opening_event or "idle"
				else
					stagger_anims = action.stagger_anims[blackboard.stagger_type]
					idle_event = blackboard.breed.shield_opening_event or "idle"
				end
			else
				stagger_anims = action.stagger_anims[blackboard.stagger_type]
				idle_event = "idle"
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
					"stun_bwd_sword",
				},
				bwd = {
					"stun_fwd_sword",
				},
				left = {
					"stun_left_sword",
					"stun_left_sword_2",
					"stun_left_sword_3",
				},
				right = {
					"stun_right_sword",
					"stun_right_sword_2",
					"stun_right_sword_3",
				},
				dwn = {
					"stun_down",
				},
			},
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd",
					"stagger_bwd_2",
				},
				left = {
					"stagger_left",
					"stagger_left_2",
					"stagger_left_3",
					"stagger_left_4",
				},
				right = {
					"stagger_right",
					"stagger_right_2",
					"stagger_right_3",
					"stagger_right_4",
				},
				dwn = {
					"stun_down",
				},
			},
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd_fall",
					"stagger_bwd_fall_2",
				},
				left = {
					"stagger_left_heavy",
					"stagger_left_heavy_2",
					"stagger_left_heavy_3",
				},
				right = {
					"stagger_right_heavy",
					"stagger_right_heavy_2",
					"stagger_right_heavy_3",
				},
				dwn = {
					"stun_down",
				},
			},
			{
				fwd = {
					"stun_fwd_ranged_light",
					"stun_fwd_ranged_light_2",
				},
				bwd = {
					"stun_bwd_ranged_light",
					"stun_bwd_ranged_light_2",
				},
				left = {
					"stun_left_ranged_light",
					"stun_left_ranged_light_2",
				},
				right = {
					"stun_right_ranged_light",
					"stun_right_ranged_light_2",
				},
			},
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd_stab",
					"stagger_bwd_stab_2",
				},
				left = {
					"stagger_left",
				},
				right = {
					"stagger_right",
				},
			},
			{
				fwd = {
					"stagger_fwd_exp",
					"stagger_fwd_exp_2",
				},
				bwd = {
					"stagger_bwd_exp",
					"stagger_bwd_exp_2",
				},
				left = {
					"stagger_left_exp",
					"stagger_left_exp_2",
				},
				right = {
					"stagger_right_exp",
					"stagger_right_exp_2",
				},
			},
			{
				fwd = {
					"stun_bwd_sword",
				},
				bwd = {
					"stagger_short_bwd",
					"stagger_short_bwd_2",
					"stagger_short_bwd_3",
					"stagger_short_bwd_4",
					"stagger_short_bwd_5",
				},
				left = {
					"stun_left_sword",
					"stun_left_sword_2",
					"stun_left_sword_3",
					"stagger_short_bwd_4",
					"stagger_short_bwd_5",
				},
				right = {
					"stun_right_sword",
					"stun_right_sword_2",
					"stun_right_sword_3",
					"stagger_short_bwd_4",
					"stagger_short_bwd_5",
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
				},
				bwd = {
					"stagger_bwd",
					"stagger_bwd_2",
				},
				left = {
					"stagger_left",
					"stagger_left_2",
					"stagger_left_3",
					"stagger_left_4",
				},
				right = {
					"stagger_right",
					"stagger_right_2",
					"stagger_right_3",
					"stagger_right_4",
				},
				dwn = {
					"stun_down",
				},
			},
		},
		shield_block_anims = {
			{
				fwd = {
					"stun_bwd_sword",
				},
				bwd = {
					"stagger_bwd_shield_up_light",
				},
				left = {
					"stagger_left_shield_up_light",
				},
				right = {
					"stagger_right_shield_up_light",
				},
				dwn = {
					"stagger_bwd_shield_up_light_head",
				},
			},
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd_shield_up",
					"stagger_bwd_shield_up_2",
					"stagger_bwd_shield_up_3",
					"stagger_bwd_shield_up_4",
				},
				left = {
					"stagger_left_shield_up",
				},
				right = {
					"stagger_right_shield_up",
				},
				dwn = {
					"stagger_bwd_shield_up_head",
					"stagger_bwd_shield_up_head_2",
				},
			},
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd_shield_up",
					"stagger_bwd_shield_up_2",
					"stagger_bwd_shield_up_3",
				},
				left = {
					"stagger_left_shield_up",
				},
				right = {
					"stagger_right_shield_up",
				},
				dwn = {
					"stagger_bwd_shield_up_head",
					"stagger_bwd_shield_up_head_2",
				},
			},
			{
				fwd = {
					"stun_fwd_ranged_light",
					"stun_fwd_ranged_light_2",
				},
				bwd = {
					"stagger_bwd_shield_up",
					"stagger_bwd_shield_up_2",
					"stagger_bwd_shield_up_3",
				},
				left = {
					"stagger_left_shield_up",
				},
				right = {
					"stagger_right_shield_up",
				},
				dwn = {
					"stagger_bwd_shield_up",
				},
			},
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd_shield_up",
					"stagger_bwd_shield_up_2",
					"stagger_bwd_shield_up_3",
				},
				left = {
					"stagger_left_shield_up",
				},
				right = {
					"stagger_right_shield_up",
				},
				dwn = {
					"stagger_bwd_shield_up_light_head",
				},
			},
			{
				fwd = {
					"stagger_fwd_exp",
					"stagger_fwd_exp_2",
				},
				bwd = {
					"stagger_bwd_shield_up",
					"stagger_bwd_shield_up_2",
					"stagger_bwd_shield_up_3",
				},
				left = {
					"stagger_left_shield_up",
				},
				right = {
					"stagger_right_shield_up",
				},
				dwn = {
					"stagger_bwd_shield_up",
				},
			},
			{
				fwd = {
					"stun_bwd_sword",
				},
				bwd = {
					"stagger_bwd_shield_up_light",
				},
				left = {
					"stagger_left_shield_up_light",
				},
				right = {
					"stagger_right_shield_up_light",
				},
				dwn = {
					"stagger_bwd_shield_up_light",
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
				},
				bwd = {
					"stagger_bwd_shield_up",
					"stagger_bwd_shield_up_2",
					"stagger_bwd_shield_up_3",
				},
				left = {
					"stagger_left_shield_up",
				},
				right = {
					"stagger_right_shield_up",
				},
				dwn = {
					"stagger_bwd_shield_up_head",
					"stagger_bwd_shield_up_head_2",
				},
			},
		},
		shield_break_anims = {
			{
				fwd = {
					"stun_bwd_sword",
				},
				bwd = {
					"stagger_shield_break_bwd",
				},
				left = {
					"stagger_shield_break_left",
				},
				right = {
					"stagger_shield_break_right",
				},
				dwn = {
					"stagger_shield_break_bwd",
				},
			},
			{
				fwd = {
					"stun_bwd_sword",
				},
				bwd = {
					"stagger_shield_break_bwd",
				},
				left = {
					"stagger_shield_break_left",
				},
				right = {
					"stagger_shield_break_right",
				},
				dwn = {
					"stagger_shield_break_bwd",
				},
			},
			{
				fwd = {
					"stun_bwd_sword",
				},
				bwd = {
					"stagger_shield_break_bwd",
				},
				left = {
					"stagger_shield_break_left",
				},
				right = {
					"stagger_shield_break_right",
				},
				dwn = {
					"stagger_shield_break_bwd",
				},
			},
			{
				fwd = {
					"stun_bwd_sword",
				},
				bwd = {
					"stagger_shield_break_bwd",
				},
				left = {
					"stagger_shield_break_left",
				},
				right = {
					"stagger_shield_break_right",
				},
				dwn = {
					"stagger_shield_break_bwd",
				},
			},
			{
				fwd = {
					"stun_bwd_sword",
				},
				bwd = {
					"stagger_shield_break_bwd",
				},
				left = {
					"stagger_shield_break_left",
				},
				right = {
					"stagger_shield_break_right",
				},
				dwn = {
					"stagger_shield_break_bwd",
				},
			},
			{
				fwd = {
					"stun_bwd_sword",
				},
				bwd = {
					"stagger_shield_break_bwd",
				},
				left = {
					"stagger_shield_break_left",
				},
				right = {
					"stagger_shield_break_right",
				},
				dwn = {
					"stagger_shield_break_bwd",
				},
			},
			{
				fwd = {
					"stun_bwd_sword",
				},
				bwd = {
					"stagger_shield_break_bwd",
				},
				left = {
					"stagger_shield_break_left",
				},
				right = {
					"stagger_shield_break_right",
				},
				dwn = {
					"stagger_shield_break_bwd",
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
					"stun_bwd_sword",
				},
				bwd = {
					"stagger_shield_break_bwd",
				},
				left = {
					"stagger_shield_break_left",
				},
				right = {
					"stagger_shield_break_right",
				},
				dwn = {
					"stagger_shield_break_bwd",
				},
			},
		},
		shield_stagger_anims = {
			{
				fwd = {
					"stun_bwd_sword",
				},
				bwd = {
					"stagger_bwd_shield_light",
				},
				left = {
					"stagger_left_shield_light",
				},
				right = {
					"stagger_right_shield_light",
				},
				dwn = {
					"stagger_bwd_shield_light",
				},
			},
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd_shield",
					"stagger_bwd_shield_2",
					"stagger_bwd_shield_3",
				},
				left = {
					"stagger_left_shield",
				},
				right = {
					"stagger_right_shield",
				},
				dwn = {
					"stagger_bwd_shield",
				},
			},
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd_shield",
					"stagger_bwd_shield_2",
					"stagger_bwd_shield_3",
				},
				left = {
					"stagger_left_shield",
				},
				right = {
					"stagger_right_shield",
				},
				dwn = {
					"stagger_bwd_shield",
				},
			},
			{
				fwd = {
					"stun_fwd_ranged_light",
					"stun_fwd_ranged_light_2",
				},
				bwd = {
					"stagger_bwd_shield",
					"stagger_bwd_shield_2",
					"stagger_bwd_shield_3",
				},
				left = {
					"stagger_left_shield",
				},
				right = {
					"stagger_right_shield",
				},
				dwn = {
					"stagger_bwd_shield",
				},
			},
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd_shield",
					"stagger_bwd_shield_2",
					"stagger_bwd_shield_3",
				},
				left = {
					"stagger_left_shield",
				},
				right = {
					"stagger_right_shield",
				},
				dwn = {
					"stagger_bwd_shield",
				},
			},
			{
				fwd = {
					"stagger_fwd_exp",
					"stagger_fwd_exp_2",
				},
				bwd = {
					"stagger_bwd_shield",
					"stagger_bwd_shield_2",
					"stagger_bwd_shield_3",
				},
				left = {
					"stagger_left_shield",
				},
				right = {
					"stagger_right_shield",
				},
				dwn = {
					"stagger_bwd_shield",
				},
			},
			{
				fwd = {
					"stun_bwd_sword",
				},
				bwd = {
					"stagger_bwd_shield_light",
				},
				left = {
					"stagger_left_shield_light",
				},
				right = {
					"stagger_right_shield_light",
				},
				dwn = {
					"stagger_bwd_shield_light",
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
					"stagger_fwd_exp",
					"stagger_fwd_exp_2",
				},
				bwd = {
					"stagger_bwd_shield",
					"stagger_bwd_shield_2",
					"stagger_bwd_shield_3",
				},
				left = {
					"stagger_left_shield",
				},
				right = {
					"stagger_right_shield",
				},
				dwn = {
					"stagger_bwd_shield",
				},
			},
		},
	},
}

BreedActions.skaven_clan_rat_with_shield = table.create_copy(BreedActions.skaven_clan_rat_with_shield, action_data)

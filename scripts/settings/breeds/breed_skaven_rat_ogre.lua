-- chunkname: @scripts/settings/breeds/breed_skaven_rat_ogre.lua

local stagger_types = require("scripts/utils/stagger_types")
local default_bot_threat_difficulty_data = BotConstants and BotConstants.default.DEFAULT_BOT_THREAT_DIFFICULTY_DATA
local breed_data = {
	ai_strength = 10,
	ai_toughness = 10,
	animation_sync_rpc = "rpc_sync_anim_state_8",
	aoe_height = 2.4,
	aoe_radius = 1,
	armor_category = 3,
	awards_positive_reinforcement_message = true,
	base_unit = "units/beings/enemies/skaven_rat_ogre/chr_skaven_rat_ogre",
	behavior = "ogre",
	big_boy_turning_dot = 0.4,
	blood_effect_name = "fx/impact_blood_ogre",
	bone_lod_level = 0,
	boost_curve_multiplier_override = 2,
	boss = true,
	boss_damage_reduction = true,
	boss_staggers = true,
	bot_hitbox_radius_approximation = 0.75,
	bot_opportunity_target_melee_range = 7,
	bot_opportunity_target_melee_range_while_ranged = 5,
	bots_should_flank = true,
	catch_up_speed = 12,
	combat_music_state = "rat_ogre",
	death_reaction = "ai_default",
	default_inventory_template = "rat_ogre",
	detection_radius = 9999999,
	distance_sq_can_detect_target = 2025,
	distance_sq_idle_auto_detect_target = 49,
	exchange_order = 1,
	far_off_despawn_immunity = true,
	has_inventory = true,
	headshot_coop_stamina_fatigue_type = "headshot_special",
	hit_effect_template = "HitEffectsRatOgre",
	hit_mass_count = 50,
	hit_reaction = "ai_default",
	ignore_nav_propagation_box = true,
	is_always_spawnable = true,
	is_bot_aid_threat = true,
	jump_slam_gravity = 19,
	minion_detection_radius = 10,
	no_stagger_duration = false,
	override_mover_move_distance = 1.5,
	panic_close_detection_radius_sq = 9,
	passive_in_patrol = true,
	passive_in_patrol_start_anim = "move_fwd",
	patrol_active_perception = "perception_rat_ogre",
	patrol_active_target_selection = "pick_rat_ogre_target_with_weights",
	patrol_detection_radius = 10,
	patrol_passive_perception = "perception_rat_ogre",
	patrol_passive_target_selection = "patrol_passive_target_selection",
	patrol_walk_speed = 2.5,
	perception = "perception_rat_ogre",
	perception_continuous = "perception_continuous_rat_ogre",
	player_locomotion_constrain_radius = 1.5,
	poison_resistance = 100,
	proximity_system_check = true,
	race = "skaven",
	radius = 2,
	reach_distance = 3,
	run_speed = 7,
	slot_template = "boss",
	smart_object_template = "rat_ogre",
	smart_targeting_height_multiplier = 1.5,
	smart_targeting_outer_width = 1.4,
	smart_targeting_width = 0.6,
	stagger_resistance = 100,
	stagger_threshold_explosion = 1,
	stagger_threshold_heavy = 1,
	stagger_threshold_light = 1,
	stagger_threshold_medium = 1,
	target_selection = "pick_rat_ogre_target_idle",
	target_selection_angry = "pick_rat_ogre_target_with_weights",
	threat_value = 32,
	trigger_dialogue_on_target_switch = true,
	unit_template = "ai_unit_rat_ogre",
	use_aggro = true,
	use_avoidance = false,
	use_big_boy_turning = true,
	walk_speed = 5,
	infighting = InfightingSettings.boss,
	perception_weights = {
		aggro_decay_per_sec = 1,
		distance_weight = 100,
		max_distance = 50,
		old_target_aggro_mul = 1,
		target_catapulted_mul = 0.5,
		target_disabled_aggro_mul = 0,
		target_disabled_mul = 0.15,
		target_outside_navmesh_mul = 0.5,
		target_staggered_you_bonus = 100,
		target_stickyness_bonus_a = 50,
		target_stickyness_bonus_b = 10,
		target_stickyness_duration_a = 5,
		target_stickyness_duration_b = 20,
		targeted_by_other_special = -10,
	},
	max_health = BreedTweaks.max_health.rat_ogre,
	bloodlust_health = BreedTweaks.bloodlust_health.monster,
	stagger_duration = {
		0,
		0,
		0,
		0,
		0,
		3,
		0,
		1,
	},
	status_effect_settings = {
		category = "medium",
		ignored_statuses = table.set({
			StatusEffectNames.burning_warpfire,
		}),
	},
	debug_color = {
		255,
		20,
		20,
		20,
	},
	run_on_spawn = AiBreedSnippets.on_rat_ogre_spawn,
	run_on_death = AiBreedSnippets.on_rat_ogre_death,
	run_on_despawn = AiBreedSnippets.on_rat_ogre_despawn,
	blackboard_init_data = {
		ladder_distance = math.huge,
	},
	blood_intensity = {
		mtr_skin = "blood_intensity",
	},
	blood_effect_nodes = {
		{
			node = "fx_wound_001",
			triggered = false,
		},
		{
			node = "fx_wound_002",
			triggered = false,
		},
		{
			node = "fx_wound_003",
			triggered = false,
		},
		{
			node = "fx_wound_004",
			triggered = false,
		},
		{
			node = "fx_wound_005",
			triggered = false,
		},
		{
			node = "fx_wound_006",
			triggered = false,
		},
		{
			node = "fx_wound_007",
			triggered = false,
		},
		{
			node = "fx_wound_008",
			triggered = false,
		},
		{
			node = "fx_wound_009",
			triggered = false,
		},
		{
			node = "fx_wound_010",
			triggered = false,
		},
		{
			node = "fx_wound_011",
			triggered = false,
		},
		{
			node = "fx_wound_012",
			triggered = false,
		},
		{
			node = "fx_wound_013",
			triggered = false,
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
				"j_spine1",
			},
		},
		neck = {
			prio = 1,
			actors = {
				"c_neck1",
			},
			push_actors = {
				"j_head",
				"j_spine1",
			},
		},
		torso = {
			prio = 2,
			actors = {
				"c_spine2",
				"c_spine",
				"c_spine1",
				"c_hips",
				"c_leftshoulder",
				"c_rightshoulder",
			},
			push_actors = {
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
				"j_leftarm",
				"j_leftforearm",
				"j_lefthand",
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
				"j_rightarm",
				"j_rightforearm",
				"j_righthand",
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
				"j_leftupleg",
				"j_leftleg",
				"j_leftfoot",
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
				"j_rightupleg",
				"j_rightleg",
				"j_rightfoot",
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
				"j_tail1",
				"j_tail2",
				"j_tail3",
				"j_tail4",
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
	allowed_layers = {
		big_boy_destructible = 1.5,
		bot_poison_wind = 1.5,
		bot_ratling_gun_fire = 15,
		destructible_wall = 5,
		doors = 1.5,
		fire_grenade = 15,
		jumps = 1.5,
		ledges = 1.5,
		ledges_with_fence = 1.5,
		planks = 1.5,
		teleporters = 5,
		temporary_wall = 0,
	},
	nav_cost_map_allowed_layers = {
		lamp_oil_fire = 15,
		plague_wave = 1,
		stormfiend_warpfire = 1,
		troll_bile = 1,
		vortex_danger_zone = 1,
		vortex_near = 1,
		warpfire_thrower_warpfire = 1,
	},
	custom_death_enter_function = function (unit, killer_unit, damage_type, death_hit_zone, t, damage_source)
		local blackboard = BLACKBOARDS[unit]

		if not Unit.alive(killer_unit) then
			return
		end

		QuestSettings.check_rat_ogre_killed_mid_leap(blackboard, killer_unit)
		QuestSettings.check_rat_ogre_killed_without_dealing_damage(blackboard, killer_unit)
	end,
	before_stagger_enter_function = function (unit, blackboard, attacker_unit, is_push)
		Managers.state.achievement:trigger_event("rat_ogre_stagger", unit, blackboard, attacker_unit)
	end,
}

Breeds.skaven_rat_ogre = table.create_copy(Breeds.skaven_rat_ogre, breed_data)

local pushed_data = {
	ahead_dist = 2,
	player_pushed_speed = 10,
	push_forward_offset = 1,
	push_stagger_distance = 1,
	push_width = 4,
	push_stagger_impact = {
		stagger_types.medium,
		stagger_types.medium,
		stagger_types.none,
		stagger_types.none,
	},
	push_stagger_duration = {
		1.5,
		1,
		0,
		0,
	},
}
local AttackIntensityPerDifficulty = {
	melee_slam = {
		easy = {
			normal = 5,
			running = 2,
		},
		normal = {
			normal = 5,
			running = 2,
		},
		hard = {
			normal = 5,
			running = 2,
		},
		harder = {
			normal = 5,
			running = 2,
		},
		hardest = {
			normal = 5,
			running = 2,
		},
		cataclysm = {
			normal = 5,
			running = 2,
		},
		cataclysm_2 = {
			normal = 5,
			running = 2,
		},
		cataclysm_3 = {
			normal = 5,
			running = 2,
		},
	},
	combo = {
		easy = {
			normal = 3,
			running = 0.5,
		},
		normal = {
			normal = 3,
			running = 0.5,
		},
		hard = {
			normal = 3,
			running = 0.5,
		},
		harder = {
			normal = 3,
			running = 0.5,
		},
		hardest = {
			normal = 3,
			running = 0.5,
		},
		cataclysm = {
			normal = 3,
			running = 0.5,
		},
		cataclysm_2 = {
			normal = 3,
			running = 0.5,
		},
		cataclysm_3 = {
			normal = 3,
			running = 0.5,
		},
	},
	shove = {
		easy = {
			normal = 1,
		},
		normal = {
			normal = 1,
		},
		hard = {
			normal = 1,
		},
		harder = {
			normal = 1,
		},
		hardest = {
			normal = 1,
		},
		cataclysm = {
			normal = 1,
		},
		cataclysm_2 = {
			normal = 1,
		},
		cataclysm_3 = {
			normal = 1,
		},
	},
	jump_slam = {
		easy = {
			normal = 5,
			running = 2,
		},
		normal = {
			normal = 5,
			running = 2,
		},
		hard = {
			normal = 5,
			running = 2,
		},
		harder = {
			normal = 5,
			running = 2,
		},
		hardest = {
			normal = 5,
			running = 2,
		},
		cataclysm = {
			normal = 5,
			running = 2,
		},
		cataclysm_2 = {
			normal = 5,
			running = 2,
		},
		cataclysm_3 = {
			normal = 5,
			running = 2,
		},
	},
}
local action_data = {
	follow = {
		action_weight = 1,
		follow_target_function_name = "_follow_target_rat_ogre",
		move_anim = "move_start_fwd",
		considerations = UtilityConsiderations.follow,
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
		init_blackboard = {
			chasing_timer = -10,
		},
	},
	smash_door = {
		attack_anim = "attack_slam",
		damage = 15,
		damage_type = "cutting",
		door_attack_distance = 2,
		hit_react_type = "heavy",
		move_anim = "move_fwd",
		name = "smash_door",
		unblockable = true,
		ignore_staggers = {
			false,
			true,
			true,
			true,
			false,
			true,
		},
	},
	target_rage = {
		change_target_fwd_close_dist = 15,
		rage_time = 1.75,
		start_anims_name = {
			bwd = "change_target_bwd",
			fwd = "change_target_fwd",
			left = "change_target_left",
			right = "change_target_right",
		},
		start_anims_data = {
			change_target_fwd = {},
			change_target_bwd = {
				dir = -1,
				rad = math.pi,
			},
			change_target_left = {
				dir = 1,
				rad = math.pi / 2,
			},
			change_target_right = {
				dir = -1,
				rad = math.pi / 2,
			},
		},
		change_target_fwd_close_anims = {
			"roar",
			"roar_2",
		},
	},
	melee_slam = {
		action_weight = 1,
		attack_intensity_type = "melee_slam",
		attack_time = 1.3333333333333333,
		blocked_damage = 5,
		cooldown = -1,
		damage = 10,
		damage_type = "cutting",
		dodge_mitigation_radius_squared = 2.25,
		fatigue_type = "blocked_slam",
		forward_offset = 1.75,
		height = 2.5,
		hit_react_type = "heavy",
		player_push_speed = 8,
		player_push_speed_blocked = 4,
		radius = 1.2,
		stagger_distance = 7,
		unblockable = false,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.melee_slam,
		attack_anim = {
			"attack_slam",
			"attack_slam_2",
			"attack_slam_3",
			"attack_slam_4",
		},
		blocked_difficulty_damage = BreedTweaks.difficulty_damage.boss_slam_attack,
		difficulty_damage = BreedTweaks.difficulty_damage.boss_slam_attack,
		stagger_impact = {
			stagger_types.weak,
			stagger_types.medium,
			stagger_types.none,
			stagger_types.none,
			stagger_types.weak,
		},
		bot_threats = {
			{
				duration = 0.3333333333333333,
				start_time = 0.16666666666666666,
			},
		},
		hit_player_func = function (unit, blackboard, hit_unit, damage)
			if damage then
				blackboard.has_dealt_damage = true
			end
		end,
	},
	combo_attack = {
		action_weight = 1,
		allow_friendly_fire = true,
		attack_intensity_type = "combo",
		damage = 15,
		damage_type = "cutting",
		fatigue_type = "chaos_spawn_combo",
		shield_blocked_fatigue_type = "chaos_spawn_combo",
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.rat_ogre_combo,
		attacks = {
			{
				anim_driven = true,
				attack_time = 3.1666666666666665,
				damage_done_time = 2.2666666666666666,
				height = 2.5,
				hit_multiple_targets = true,
				ignores_dodging = true,
				offset_forward = 1,
				offset_up = 0,
				player_push_speed = 10,
				player_push_speed_blocked = 10,
				range = 2.5,
				rotation_speed = 2.5,
				rotation_time = 2,
				width = 1.5,
				attack_anim = {
					"attack_combo_fwd",
				},
				push_units_in_the_way = pushed_data,
				bot_threats = {
					{
						duration = 0.3333333333333333,
						range = 3.5,
						start_time = 0.3333333333333333,
					},
					{
						duration = 0.3333333333333333,
						range = 3.5,
						start_time = 1.1666666666666667,
					},
					{
						duration = 0.3333333333333333,
						range = 3.5,
						start_time = 0.8333333333333334,
					},
					{
						duration = 0.3333333333333333,
						range = 3.5,
						start_time = 1.9333333333333333,
					},
				},
				hit_player_func = function (unit, blackboard, hit_unit, action, attack, dealt_damage)
					if dealt_damage then
						blackboard.has_dealt_damage = true
					end
				end,
			},
		},
		difficulty_damage = BreedTweaks.difficulty_damage.boss_combo_attack,
		ignore_staggers = {
			true,
			false,
			false,
			true,
			true,
			false,
		},
	},
	melee_shove = {
		action_weight = 1,
		allow_friendly_fire = true,
		attack_intensity_type = "shove",
		damage = 20,
		damage_type = "cutting",
		fatigue_type = "ogre_shove",
		hit_react_type = "heavy",
		ignore_ai_damage = true,
		target_running_velocity_threshold = 2,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.melee_shove,
		attacks = {
			{
				anim_driven = false,
				attack_time = 2.1,
				catapult_player = true,
				freeze_intensity_decay_time = 15,
				height = 2,
				hit_multiple_targets = true,
				hit_only_players = false,
				ignore_targets_behind = true,
				ignores_dodging = false,
				offset_forward = 0,
				offset_up = 0,
				player_push_speed = 16,
				player_push_speed_blocked = 9.6,
				player_push_speed_blocked_z = 4,
				player_push_speed_z = 4,
				range = 2,
				rotation_time = 0.3,
				width = 0.4,
				attack_anim = {
					"attack_shove_left",
					"attack_shove_right",
				},
				damage_done_time = {
					attack_shove_left = 0.9333333333333333,
					attack_shove_right = 0.6,
				},
				continious_overlap = {
					attack_shove_left = {
						base_node_name = "j_leftforearm",
						start_time = 0.6,
						tip_node_name = "j_lefthand",
					},
					attack_shove_right = {
						base_node_name = "j_rightforearm",
						start_time = 0.3333333333333333,
						tip_node_name = "j_righthand",
					},
				},
				push_ai = {
					stagger_distance = 3,
					stagger_impact = {
						stagger_types.explosion,
						stagger_types.heavy,
						stagger_types.none,
						stagger_types.none,
						stagger_types.explosion,
					},
					stagger_duration = {
						4.5,
						1,
						0,
						0,
						4,
					},
				},
				bot_threat_difficulty_data = default_bot_threat_difficulty_data,
				bot_threats = {
					attack_shove_left = {
						{
							collision_type = "cylinder",
							duration = 0.6,
							height = 4,
							offset_forward = 0,
							offset_right = 0,
							offset_up = 0,
							radius = 4.5,
							start_time = 0.3333333333333333,
						},
					},
					attack_shove_right = {
						{
							collision_type = "cylinder",
							duration = 0.6,
							height = 4,
							offset_forward = 0,
							offset_right = 0,
							offset_up = 0,
							radius = 4.5,
							start_time = 0,
						},
					},
				},
				hit_player_func = function (unit, blackboard, hit_unit, action, attack, dealt_damage)
					if dealt_damage then
						blackboard.has_dealt_damage = true
					end
				end,
			},
		},
		running_attacks = {
			{
				anim_driven = true,
				attack_time = 1.7666666666666666,
				catapult_player = true,
				freeze_intensity_decay_time = 15,
				height = 2,
				hit_multiple_targets = true,
				hit_only_players = false,
				ignore_targets_behind = true,
				ignores_dodging = false,
				offset_forward = 0,
				offset_up = 0,
				player_push_speed = 16,
				player_push_speed_blocked = 9.6,
				player_push_speed_blocked_z = 4,
				player_push_speed_z = 4,
				range = 2,
				rotation_time = 0.3,
				width = 0.4,
				attack_anim = {
					"attack_shove_left_run",
					"attack_shove_right_run",
				},
				damage_done_time = {
					attack_shove_left_run = 0.7333333333333333,
					attack_shove_right_run = 0.8,
				},
				continious_overlap = {
					attack_shove_left_run = {
						base_node_name = "j_leftforearm",
						start_time = 0.4,
						tip_node_name = "j_lefthand",
					},
					attack_shove_right_run = {
						base_node_name = "j_rightforearm",
						start_time = 0.4,
						tip_node_name = "j_righthand",
					},
				},
				push_ai = {
					stagger_distance = 3,
					stagger_impact = {
						stagger_types.explosion,
						stagger_types.heavy,
						stagger_types.none,
						stagger_types.none,
						stagger_types.explosion,
					},
					stagger_duration = {
						4.5,
						1,
						0,
						0,
						4,
					},
				},
				hit_player_func = function (unit, blackboard, hit_unit, action, attack, dealt_damage)
					if dealt_damage then
						blackboard.has_dealt_damage = true
					end
				end,
			},
		},
		difficulty_damage = BreedTweaks.difficulty_damage.boss_slam_attack,
	},
	target_unreachable = {
		move_anim = "move_start_fwd",
	},
	jump_slam = {
		action_weight = 1,
		attack_intensity_type = "jump_slam",
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.jump_slam,
		bot_threats = {
			{
				collision_type = "sphere",
				duration = 1.5,
				offset_forward = 0,
				radius = 7,
				start_time_before_landing = 1.3333333333333333,
			},
		},
	},
	jump_slam_impact = {
		catapult_players = true,
		catapult_within_radius = 7,
		catapulted_player_speed = 7,
		damage = 10,
		damage_type = "blunt",
		fatigue_type = "blocked_jump_slam",
		hit_react_type = "heavy",
		max_damage_radius = 2.5,
		stagger_distance = 7,
		stagger_radius = 7.5,
		difficulty_damage = BreedTweaks.difficulty_damage.boss_slam_attack,
		stagger_impact = {
			stagger_types.weak,
			stagger_types.medium,
			stagger_types.none,
			stagger_types.none,
		},
	},
	climb = {
		catapult_players = {
			collision_filter = "filter_player_hit_box_check",
			radius = 2,
			speed = 7,
			angle = math.pi / 6,
		},
	},
	stagger = {
		scale_animation_speeds = true,
		stagger_animation_scale = 1,
		stagger_anims = {
			{
				fwd = {},
				bwd = {},
				left = {},
				right = {},
			},
			{
				fwd = {},
				bwd = {},
				left = {},
				right = {},
			},
			{
				fwd = {},
				bwd = {},
				left = {},
				right = {},
			},
			{
				fwd = {},
				bwd = {},
				left = {},
				right = {},
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
				},
				bwd = {
					"stagger_bwd_exp",
				},
				left = {
					"stagger_left_exp",
				},
				right = {
					"stagger_right_exp",
				},
			},
			{
				fwd = {},
				bwd = {},
				left = {},
				right = {},
			},
			{
				fwd = {},
				bwd = {},
				left = {},
				right = {},
			},
			{
				fwd = {},
				bwd = {},
				left = {},
				right = {},
			},
		},
	},
	walking = {
		move_anim = "walk_fwd",
	},
}

action_data.anti_ladder_melee_slam = table.clone(action_data.melee_slam)
action_data.anti_ladder_melee_slam.considerations = UtilityConsiderations.anti_ladder_melee_slam
action_data.fling_skaven = table.clone(action_data.melee_shove)
action_data.fling_skaven.self_running_speed_threshold = 2
BreedActions.skaven_rat_ogre = table.create_copy(BreedActions.skaven_rat_ogre, action_data)

-- chunkname: @scripts/settings/breeds/breed_chaos_exalted_champion.lua

local stagger_types = require("scripts/utils/stagger_types")
local pushed_data = {
	ahead_dist = 1.5,
	player_pushed_speed = 4,
	push_forward_offset = 1.5,
	push_stagger_distance = 1,
	push_width = 1.25,
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
local breed_data = {
	ai_strength = 10,
	ai_toughness = 10,
	aim_template = "chaos_warrior",
	angry_run_speed = 6,
	animation_sync_rpc = "rpc_sync_anim_state_7",
	aoe_height = 1.7,
	aoe_radius = 0.4,
	armor_category = 2,
	armored_boss_damage_reduction = true,
	awards_positive_reinforcement_message = true,
	base_unit = "units/beings/enemies/chaos_warrior_boss/chr_chaos_warrior_boss",
	behavior = "chaos_exalted_champion_warcamp",
	bone_lod_level = 0,
	boost_curve_multiplier_override = 1.5,
	boss = true,
	boss_staggers = true,
	bot_hitbox_radius_approximation = 0.8,
	bot_melee_aim_node = "j_spine1",
	bot_opportunity_target_melee_range = 7,
	bot_opportunity_target_melee_range_while_ranged = 5,
	bots_flank_while_targeted = false,
	bots_should_flank = true,
	combat_music_state = "champion_chaos_exalted_warcamp",
	death_reaction = "ai_default",
	death_sound_event = "Play_enemy_vce_chaos_warrior_die",
	default_inventory_template = "exalted_axe",
	dialogue_source_name = "chaos_exalted_champion_warcamp",
	disable_crowd_dispersion = true,
	disable_second_hit_ragdoll = true,
	enter_walk_distance = 1,
	exchange_order = 2,
	far_off_despawn_immunity = true,
	has_inventory = true,
	headshot_coop_stamina_fatigue_type = "headshot_special",
	hit_effect_template = "HitEffectsChaosExaltedChampion",
	hit_mass_count = 20,
	hit_reaction = "ai_default",
	initial_is_passive = false,
	is_bot_aid_threat = true,
	is_bot_threat = true,
	leave_walk_distance = 2.5,
	line_of_sight_distance_sq = 400,
	minion_detection_radius = 20,
	no_stagger_duration = true,
	passive_in_patrol = false,
	perception = "perception_rat_ogre",
	perception_continuous = "perception_continuous_rat_ogre",
	player_locomotion_constrain_radius = 1.2,
	poison_resistance = 100,
	primary_armor_category = 6,
	proximity_system_check = true,
	race = "chaos",
	radius = 1,
	run_speed = 6.109090909090908,
	server_controlled_health_bar = true,
	slot_template = "chaos_large_elite",
	smart_object_template = "chaos_warrior",
	smart_targeting_height_multiplier = 3,
	smart_targeting_outer_width = 1,
	smart_targeting_width = 0.2,
	sync_full_rotation = false,
	target_selection = "pick_rat_ogre_target_with_weights",
	threat_value = 12,
	trigger_dialogue_on_target_switch = true,
	unit_template = "ai_unit_chaos_exalted_champion",
	use_avoidance = false,
	use_big_boy_turning = false,
	use_navigation_path_splines = true,
	use_slot_type = "large",
	walk_speed = 2,
	weapon_reach = 2.2,
	displace_players_data = pushed_data,
	infighting = InfightingSettings.boss,
	detection_radius = math.huge,
	perception_weights = {
		aggro_decay_per_sec = 15,
		distance_weight = 10,
		max_distance = 50,
		old_target_aggro_mul = 1,
		target_catapulted_mul = 0.25,
		target_disabled_aggro_mul = 0,
		target_disabled_mul = 0,
		target_outside_navmesh_mul = 0.5,
		target_stickyness_bonus_a = 50,
		target_stickyness_bonus_b = 10,
		target_stickyness_duration_a = 15,
		target_stickyness_duration_b = 20,
		targeted_by_other_special = -10,
		aggro_multipliers = {
			grenade = 2,
			melee = 1,
			ranged = 5,
		},
	},
	size_variation_range = {
		1.2,
		1.2,
	},
	max_health = BreedTweaks.max_health.exalted_champion,
	bloodlust_health = BreedTweaks.bloodlust_health.monster,
	status_effect_settings = {
		category = "medium",
		ignored_statuses = table.set({
			StatusEffectNames.burning_warpfire,
		}),
	},
	debug_color = {
		255,
		200,
		0,
		170,
	},
	run_on_spawn = AiBreedSnippets.on_chaos_exalted_champion_spawn,
	run_on_update = AiBreedSnippets.on_chaos_exalted_champion_update,
	run_on_despawn = AiBreedSnippets.on_chaos_exalted_champion_despawn,
	run_on_death = AiBreedSnippets.on_chaos_exalted_champion_death,
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
				"c_spine",
				"c_hips",
				"c_cloak_01",
				"c_cloak_02",
				"c_cloak_03",
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
				"c_leftshoulder",
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
				"c_rightshoulder",
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
			},
			push_actors = {
				"j_leftfoot",
				"j_rightfoot",
				"j_hips",
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
		c_leftupleg = "j_leftupleg",
		c_neck = "j_neck",
		c_rightarm = "j_rightarm",
		c_rightfoot = "j_rightfoot",
		c_rightforearm = "j_rightforearm",
		c_righthand = "j_righthand",
		c_rightleg = "j_rightleg",
		c_rightupleg = "j_rightupleg",
		c_spine = "j_spine1",
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
		j_leftupleg = 0.2,
		j_neck = 0.3,
		j_rightarm = 0.2,
		j_rightfoot = 0.2,
		j_rightforearm = 0.2,
		j_righthand = 0.2,
		j_rightleg = 0.2,
		j_rightshoulder = 0.3,
		j_rightupleg = 0.2,
		j_spine1 = 0.3,
	},
	allowed_layers = {
		barrel_explosion = 10,
		big_boy_destructible = 0,
		bot_poison_wind = 1.5,
		bot_ratling_gun_fire = 3,
		destructible_wall = 0,
		doors = 1.5,
		end_zone = 0,
		fire_grenade = 10,
		jumps = 1.5,
		ledges = 1.5,
		ledges_with_fence = 1.5,
		planks = 1.5,
		teleporters = 5,
		temporary_wall = 1,
	},
	stagger_modifier_function = function (stagger_type, duration, length, hit_zone_name, blackboard, breed, direction)
		local t = Managers.time:time("game")

		if blackboard.stagger_immune_time and t < blackboard.stagger_immune_time then
			stagger_type = stagger_types.none
			duration = 0
			length = 0
		end

		return stagger_type, duration, length
	end,
	difficulty_kill_achievements = {
		"kill_chaos_exalted_champion_difficulty_rank",
		"kill_chaos_exalted_champion_scorpion_hardest",
	},
	custom_death_enter_function = function (unit, killer_unit, damage_type, death_hit_zone, t, damage_source)
		if not Unit.alive(killer_unit) then
			return
		end

		QuestSettings.check_killed_lord_as_last_player_standing(killer_unit)
	end,
}

Breeds.chaos_exalted_champion_warcamp = table.create_copy(Breeds.chaos_exalted_champion_warcamp, breed_data)

local breed_data_norsca = {
	attack_general_sound_event = "Play_breed_triggered_sound",
	attack_player_sound_event = "Play_breed_triggered_sound",
	behavior = "chaos_exalted_champion_norsca",
	combat_music_state = "champion_chaos_exalted_norsca",
	death_sound_event = "Play_enemy_vce_chaos_warrior_die",
	default_inventory_template = "exalted_spawn_axe",
	dialogue_source_name = "chaos_warrior",
	server_controlled_health_bar = false,
	trigger_dialogue_on_target_switch = true,
	run_on_spawn = AiBreedSnippets.on_chaos_exalted_champion_norsca_spawn,
	run_on_update = AiBreedSnippets.on_chaos_exalted_champion_norsca_update,
	run_on_death = AiBreedSnippets.on_chaos_exalted_champion_norsca_death,
	run_on_despawn = AiBreedSnippets.on_chaos_exalted_champion_despawn,
	max_health = BreedTweaks.max_health.norsca_champion,
}

for key, value in pairs(breed_data) do
	local keep_value = breed_data_norsca[key]

	if keep_value == "SET_TO_NIL" then
		breed_data_norsca[key] = nil
	elseif keep_value ~= nil then
		breed_data_norsca[key] = keep_value
	else
		breed_data_norsca[key] = value
	end
end

Breeds.chaos_exalted_champion_norsca = table.create_copy(Breeds.chaos_exalted_champion_norsca, breed_data_norsca)

local action_data = {
	follow = {
		action_weight = 1,
		move_anim = "move_fwd",
		slow_approach_time = 2,
		considerations = UtilityConsiderations.chaos_exalted_follow,
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
	},
	throw_weapon = {
		action_weight = 4,
		arrival_linger_time = 0.25,
		catapult_players = true,
		catch_animation = "catch_weapon",
		close_attack_damage = 10,
		damage = 20,
		damage_type = "cutting",
		fatigue_type = "blocked_sv_cleave",
		hit_react_type = "heavy",
		hit_targets_on_return = false,
		impact_sound_id = "Play_enemy_champion_axe_impact",
		pull_sound_id = "Play_enemy_champion_pull_axe",
		push_speed = 10,
		push_speed_z = 6,
		radius = 1.25,
		return_speed = 45,
		rotation_speed = 20,
		rotation_time = 2,
		running_sound_id = "Play_enemy_champion_throw_axe",
		stop_sound_id = "Stop_enemy_champion_axe",
		target_dodged_radius = 0.25,
		throw_animation = "throw_weapon",
		throw_speed = 25,
		throw_unit_name = "units/weapons/enemy/wpn_chaos_set/wpn_chaos_2h_axe_03",
		use_close_attack = false,
		considerations = UtilityConsiderations.chaos_exalted_champion_throw_attack,
		difficulty_damage = {
			cataclysm = 40,
			cataclysm_2 = 50,
			cataclysm_3 = 75,
			easy = 8,
			hard = 16,
			harder = 25,
			hardest = 30,
			normal = 8,
			versus_base = 8,
		},
	},
	intro_idle = {
		action_weight = 0.5,
		force_idle_animation = false,
		considerations = UtilityConsiderations.chaos_exalted_defensive_idle,
		idle_animation = {
			"idle_defence",
		},
	},
	defensive_idle = {
		action_weight = 0.5,
		force_idle_animation = false,
		considerations = UtilityConsiderations.chaos_exalted_defensive_idle,
		idle_animation = {
			"idle_2",
		},
	},
	spawn_sequence = {
		action_weight = 20,
		considerations = UtilityConsiderations.storm_vermin_champion_spawn,
	},
	angry_charge_sequence = {
		action_weight = 20,
		considerations = UtilityConsiderations.chaos_exalted_angry_charge_sequence,
	},
	intro_sequence = {
		action_weight = 20,
	},
	spawn_allies = {
		duration = 2,
		find_spawn_points = true,
		has_ward = false,
		move_anim = "move_fwd",
		run_to_spawn_speed = 7,
		spawn = "warcamp_boss_event_defensive_hard",
		spawn_group = "warcamp_boss_minions",
		stay_still = false,
		stinger_name = "enemy_horde_chaos_stinger",
		terror_event_id = "warcamp_boss_minions",
		defensive_mode_duration = {
			30,
			30,
			30,
			25,
			20,
			12,
			12,
			12,
		},
		animation = {
			"idle_defence_2",
		},
		difficulty_spawn = {
			cataclysm = "warcamp_boss_event_defensive",
			cataclysm_2 = "warcamp_boss_event_defensive",
			cataclysm_3 = "warcamp_boss_event_defensive",
			easy = "warcamp_boss_event_defensive",
			hard = "warcamp_boss_event_defensive",
			harder = "warcamp_boss_event_defensive",
			hardest = "warcamp_boss_event_defensive",
			normal = "warcamp_boss_event_defensive",
			versus_base = "warcamp_boss_event_defensive",
		},
		start_anims = {
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
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true,
			true,
			true,
		},
	},
	special_attack_cleave = {
		action_weight = 1,
		bot_threat_duration = 1.1666666666666667,
		bot_threat_start_time = 1,
		bot_threat_start_time_step = 0.8333333333333334,
		catapult = true,
		damage = 15,
		damage_type = "cutting",
		fatigue_type = "blocked_sv_cleave",
		height = 2,
		hit_react_type = "heavy",
		knocked_down_attack_threshold = 0.6,
		no_block_stagger = true,
		offset_forward = 0,
		offset_up = 0,
		range = 3.8,
		reset_attack_animation_speed = 2.5,
		rotation_time = 2.6,
		shove_speed = 9,
		shove_z_speed = 5,
		width = 1.25,
		considerations = UtilityConsiderations.chaos_exalted_cleave_attack,
		attack_anim = {
			"attack_cleave_01",
			"attack_cleave_02",
		},
		step_attack_anim = {
			"attack_cleave_moving_01",
		},
		knocked_down_attack_anim = {
			"attack_downed",
		},
		difficulty_damage = {
			cataclysm = 75,
			cataclysm_2 = 100,
			cataclysm_3 = 100,
			easy = 10,
			hard = 20,
			harder = 30,
			hardest = 50,
			normal = 15,
			versus_base = 15,
		},
		ignore_staggers = {
			{
				delay = 0.1,
				type = "reset_attack",
			},
			{
				delay = 0.15,
				type = "reset_attack",
			},
			{
				delay = 0.2,
				type = "reset_attack",
			},
			{
				delay = 0.1,
				type = "reset_attack",
			},
			{
				delay = 0.1,
				type = "reset_attack",
			},
			false,
		},
		reset_attack_animations = {
			"attack_special_reset",
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_elite,
	},
	special_attack_sweep = {
		action_weight = 1,
		blocked_anim = "blocked",
		damage = 15,
		damage_type = "cutting",
		fatigue_type = "blocked_sv_cleave",
		height = 1,
		hit_react_type = "medium",
		knocked_down_attack_threshold = 0.6,
		offset_forward = 0,
		offset_up = 0,
		player_push_speed = 10,
		player_push_speed_blocked = 7.5,
		push = true,
		range = 4,
		reset_attack_animation_speed = 1.2,
		rotation_time = 0.8,
		step_attack_distance = 3.75,
		step_attack_distance_override = 4,
		step_attack_target_speed_away = 1,
		step_attack_target_speed_away_override = 2,
		width = 2.2,
		considerations = UtilityConsiderations.chaos_exalted_swing_attack,
		attack_anim = {
			"attack_sweep_01",
			"attack_sweep_02",
			"attack_sweep_03",
		},
		step_attack_anim = {
			"attack_sweep_run_01",
			"attack_run",
		},
		knocked_down_attack_anim = {
			"attack_downed",
		},
		difficulty_damage = {
			cataclysm = 50,
			cataclysm_2 = 75,
			cataclysm_3 = 100,
			easy = 5,
			hard = 15,
			harder = 25,
			hardest = 40,
			normal = 10,
			versus_base = 10,
		},
		ignore_staggers = {
			false,
			false,
			false,
			true,
			true,
			false,
		},
		reset_attack_animations = {
			"attack_right_reset",
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_elite,
	},
	special_attack_aoe = {
		action_weight = 4,
		attack_anim = "attack_pushback_swing",
		bot_threat_duration = 0.75,
		collision_type = "cylinder",
		damage = 20,
		damage_type = "cutting",
		fatigue_type = "blocked_slam",
		height = 4,
		ignore_abort_on_blocked_attack = true,
		offset_forward = -4,
		offset_right = 0,
		offset_up = -0.6,
		player_push_speed = 20,
		player_push_speed_blocked = 15,
		radius = 4.5,
		rotation_time = 0,
		shove_speed = 10,
		shove_z_speed = 7,
		considerations = UtilityConsiderations.chaos_exalted_aoe,
		difficulty_damage = {
			cataclysm = 40,
			cataclysm_2 = 50,
			cataclysm_3 = 75,
			easy = 5,
			hard = 15,
			harder = 25,
			hardest = 30,
			normal = 10,
			versus_base = 10,
		},
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			false,
		},
	},
	special_attack_aoe_defensive = {
		action_weight = 4,
		attack_anim = "attack_pushback_swing",
		bot_threat_duration = 0.75,
		collision_type = "cylinder",
		damage = 20,
		damage_type = "cutting",
		fatigue_type = "blocked_slam",
		height = 4,
		ignore_abort_on_blocked_attack = true,
		offset_forward = -4,
		offset_right = 0,
		offset_up = -0.5,
		player_push_speed = 20,
		player_push_speed_blocked = 15,
		radius = 4.5,
		rotation_time = 0,
		shove_speed = 10,
		shove_z_speed = 7,
		considerations = UtilityConsiderations.chaos_exalted_defensive_aoe,
		difficulty_damage = {
			cataclysm = 40,
			cataclysm_2 = 50,
			cataclysm_3 = 75,
			easy = 15,
			hard = 15,
			harder = 25,
			hardest = 30,
			normal = 10,
			versus_base = 10,
		},
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true,
			true,
			true,
		},
	},
	special_attack_retaliation_aoe = {
		action_weight = 4,
		attack_anim = "attack_pushback_swing",
		bot_threat_duration = 0.75,
		collision_type = "cylinder",
		damage = 20,
		damage_type = "cutting",
		fatigue_type = "blocked_slam",
		height = 4,
		ignore_abort_on_blocked_attack = true,
		offset_forward = -4,
		offset_right = 0,
		offset_up = -0.5,
		player_push_speed = 20,
		player_push_speed_blocked = 15,
		radius = 4.5,
		rotation_time = 0,
		shove_speed = 10,
		shove_z_speed = 7,
		difficulty_damage = {
			cataclysm = 40,
			cataclysm_2 = 50,
			cataclysm_3 = 75,
			easy = 5,
			hard = 15,
			harder = 25,
			hardest = 30,
			normal = 10,
			versus_base = 10,
		},
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true,
			true,
			true,
		},
	},
	special_attack_launch = {
		action_weight = 1.2,
		attack_anim = "attack_pounce",
		catapult = true,
		damage = 5,
		damage_type = "cutting",
		fatigue_type = "blocked_sv_cleave",
		height = 1,
		hit_react_type = "heavy",
		knocked_down_attack_threshold = 0.6,
		no_block_stagger = true,
		offset_forward = 0,
		offset_up = 0,
		range = 4,
		reset_attack_animation_speed = 1.3,
		reset_stagger_count = true,
		rotation_time = 0.5,
		shove_speed = 8.5,
		shove_z_speed = 7,
		width = 1.75,
		considerations = UtilityConsiderations.chaos_exalted_launch_attack,
		knocked_down_attack_anim = {
			"attack_downed",
		},
		difficulty_damage = {
			cataclysm = 30,
			cataclysm_2 = 40,
			cataclysm_3 = 50,
			easy = 5,
			hard = 10,
			harder = 15,
			hardest = 20,
			normal = 7,
			versus_base = 7,
		},
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			false,
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_elite,
	},
	special_attack_kick = {
		action_weight = 1.35,
		attack_anim = "attack_push_2",
		catapult = true,
		damage = 5,
		damage_type = "cutting",
		fatigue_type = "blocked_sv_cleave",
		height = 1,
		hit_react_type = "heavy",
		knocked_down_attack_threshold = 0.6,
		no_block_stagger = true,
		offset_forward = 0,
		offset_up = 0,
		range = 4,
		reset_attack_animation_speed = 1.3,
		reset_stagger_count = true,
		rotation_time = 0.5,
		shove_speed = 8.5,
		shove_z_speed = 5,
		width = 1.75,
		considerations = UtilityConsiderations.chaos_exalted_kick_attack,
		knocked_down_attack_anim = {
			"attack_downed",
		},
		difficulty_damage = {
			cataclysm = 30,
			cataclysm_2 = 40,
			cataclysm_3 = 50,
			easy = 5,
			hard = 10,
			harder = 15,
			hardest = 20,
			normal = 7,
			versus_base = 7,
		},
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			false,
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_elite,
	},
	special_attack_launch_defensive = {
		action_weight = 1.2,
		attack_anim = "attack_pounce",
		catapult = true,
		damage = 5,
		damage_type = "cutting",
		fatigue_type = "blocked_sv_cleave",
		height = 1,
		hit_react_type = "heavy",
		knocked_down_attack_threshold = 0.6,
		no_block_stagger = true,
		offset_forward = 0,
		offset_up = 0,
		range = 4,
		reset_attack_animation_speed = 1.3,
		reset_stagger_count = true,
		rotation_time = 0.5,
		shove_speed = 9,
		shove_z_speed = 7,
		width = 2.1,
		considerations = UtilityConsiderations.chaos_exalted_launch_attack_defensive,
		knocked_down_attack_anim = {
			"attack_downed",
		},
		difficulty_damage = {
			cataclysm = 30,
			cataclysm_2 = 40,
			cataclysm_3 = 50,
			easy = 5,
			hard = 10,
			harder = 15,
			hardest = 20,
			normal = 7,
			versus_base = 7,
		},
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			false,
		},
		attack_finished_duration = BreedTweaks.attack_finished_duration.chaos_elite,
	},
	transform = {
		transfer_health_percentage = true,
		transform_animation = "death_spawn",
		wanted_breed_transform = "chaos_spawn_exalted_champion_norsca",
	},
	charge = {
		action_weight = 3,
		allow_friendly_fire = true,
		damage = 20,
		damage_type = "cutting",
		fatigue_type = "blocked_slam",
		ignore_ai_damage = true,
		considerations = UtilityConsiderations.chaos_exalted_champion_lunge_attack,
		attacks = {
			{
				anim_driven = true,
				attack_time = 3,
				catapult_player = true,
				enable_nav_extension = true,
				freeze_intensity_decay_time = 15,
				height = 2.3,
				hit_multiple_targets = true,
				hit_only_players = false,
				ignore_targets_behind = true,
				ignores_dodging = false,
				offset_forward = 0.25,
				offset_up = 0,
				player_push_speed = 16,
				player_push_speed_blocked = 9.6,
				player_push_speed_blocked_z = 6,
				player_push_speed_z = 8,
				range = 2,
				rotation_time = 0.5,
				stop_on_target_impact = true,
				width = 1,
				attack_anim = {
					"charge_attack_step",
				},
				continious_overlap = {
					charge_attack_step = {
						base_node_name = "root_point",
						start_time = 0.8,
						tip_node_name = "root_point",
					},
				},
				push_ai = {
					stagger_distance = 3,
					stagger_impact = {
						stagger_types.explosion,
						stagger_types.explosion,
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
				wall_collision = {
					animation = "charge_attack_miss",
					check_range = 3,
					start_check_time = 1,
					stun_time = 0.75,
				},
				bot_threats = {
					{
						collision_type = "oobb",
						duration = 1.5,
						height = 2,
						offset_forward = 1,
						offset_right = 0,
						offset_up = 0,
						radius = 4.5,
						range = 15,
						start_time = 0.3,
					},
				},
				hit_ai_func = function (unit, blackboard, hit_unit, action, attack)
					local stat_names = {
						"exalted_champion_charge_chaos_warrior",
						"exalted_champion_charge_chaos_warrior_cata",
					}

					for i = 1, #stat_names do
						local current_difficulty = Managers.state.difficulty:get_difficulty()
						local allowed_difficulties = QuestSettings.allowed_difficulties[stat_names[i]]
						local allowed_difficulty = allowed_difficulties[current_difficulty]

						if allowed_difficulty and not blackboard.hit_warrior_challenge_completed then
							local hit_unit_blackboard = BLACKBOARDS[hit_unit]
							local is_chaos_warrior = hit_unit_blackboard.breed.name == "chaos_warrior"
							local num_times_hit_chaos_warrior = blackboard.num_times_hit_chaos_warrior

							if is_chaos_warrior then
								blackboard.num_times_hit_chaos_warrior = num_times_hit_chaos_warrior + 1
							end

							if blackboard.num_times_hit_chaos_warrior >= QuestSettings.exalted_champion_charge_chaos_warrior then
								local statistics_db = Managers.player:statistics_db()

								statistics_db:increment_stat_and_sync_to_clients(stat_names[i])

								blackboard.hit_warrior_challenge_completed = true
							end
						end
					end
				end,
			},
		},
		difficulty_damage = {
			cataclysm = 40,
			cataclysm_2 = 50,
			cataclysm_3 = 75,
			easy = 15,
			hard = 15,
			harder = 25,
			hardest = 30,
			normal = 10,
			versus_base = 10,
		},
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			false,
			true,
			true,
		},
	},
	smash_door = {
		attack_anim = "attack_pounce",
		damage = 3,
		damage_type = "cutting",
		move_anim = "move_fwd",
		unblockable = true,
	},
	stagger = {
		custom_enter_function = function (unit, blackboard, t, action)
			local stagger_anims = blackboard.action.stagger_anims[blackboard.stagger_type]

			if blackboard.stagger_type == stagger_types.explosion then
				if blackboard.chain_stagger_resistant_t and t > blackboard.chain_stagger_resistant_t then
					blackboard.chain_stagger_resistant_t = nil
					blackboard.num_chain_stagger = nil
				end

				local num_chain_stagger = blackboard.num_chain_stagger or 0

				blackboard.num_chain_stagger = num_chain_stagger + 1

				if not blackboard.chain_stagger_resistant_t and blackboard.num_chain_stagger > 1 and blackboard.stagger_type == stagger_types.explosion then
					blackboard.chain_stagger_resistant_t = t + 8
				end

				if blackboard.chain_stagger_resistant_t and t < blackboard.chain_stagger_resistant_t then
					stagger_anims = blackboard.action.stagger_anims[stagger_types.heavy]
					blackboard.stagger_time = t + 2
				end
			end

			return stagger_anims, "idle"
		end,
		stagger_anims = {
			{
				fwd = {
					"hit_react_fwd",
				},
				bwd = {
					"hit_react_bwd",
				},
				left = {
					"hit_react_left",
				},
				right = {
					"hit_react_right",
				},
				dwn = {
					"hit_react_overhead",
				},
			},
			{
				fwd = {
					"stagger_light_fwd",
				},
				bwd = {
					"stagger_light_bwd",
				},
				left = {
					"stagger_light_left",
				},
				right = {
					"stagger_light_right",
				},
			},
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd",
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
					"hit_react_fwd",
				},
				bwd = {
					"hit_react_bwd",
				},
				left = {
					"hit_react_left",
				},
				right = {
					"hit_react_right",
				},
			},
			{
				fwd = {
					"hit_react_fwd",
				},
				bwd = {
					"hit_react_bwd",
				},
				left = {
					"hit_react_left",
				},
				right = {
					"hit_react_right",
				},
			},
			{
				fwd = {
					"stagger_fwd_downed",
				},
				bwd = {
					"stagger_bwd_downed",
				},
				left = {
					"stagger_left_downed",
				},
				right = {
					"stagger_right_downed",
				},
			},
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd",
				},
				left = {
					"stagger_left",
				},
				right = {
					"stagger_right",
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
				},
				left = {
					"stagger_left",
				},
				right = {
					"stagger_right",
				},
			},
		},
	},
}

BreedActions.chaos_exalted_champion = table.create_copy(BreedActions.chaos_exalted_champion, action_data)
BreedActions.chaos_exalted_champion.angry_charge = table.create_copy(BreedActions.chaos_exalted_champion.angry_charge, BreedActions.chaos_exalted_champion.charge)
BreedActions.chaos_exalted_champion.angry_charge.considerations = UtilityConsiderations.chaos_exalted_champion_angry_lunge_attack
BreedActions.chaos_exalted_champion.norsca_charge = table.create_copy(BreedActions.chaos_exalted_champion.norsca_charge, BreedActions.chaos_exalted_champion.charge)
BreedActions.chaos_exalted_champion.norsca_charge.attacks[1].hit_ai_func = nil

-- chunkname: @scripts/settings/breeds/breed_chaos_troll_chief.lua

local stagger_types = require("scripts/utils/stagger_types")
local size_multiplier = 1.5
local pushed_data = {
	ahead_dist = 1.5,
	player_pushed_speed = 7,
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
local running_pushed_data = {
	ahead_dist = 2.5,
	player_pushed_speed = 9,
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
local default_bot_threat_difficulty_data = BotConstants and BotConstants.default.DEFAULT_BOT_THREAT_DIFFICULTY_DATA
local breed_data = {
	ai_strength = 10,
	ai_toughness = 10,
	aim_template = "chaos_warrior",
	always_look_at_target = true,
	animation_movement_template = "chaos_troll",
	animation_sync_rpc = "rpc_sync_anim_state_6",
	aoe_height = 2.4,
	aoe_radius = 1,
	armor_category = 3,
	awards_positive_reinforcement_message = true,
	base_unit = "units/beings/enemies/chaos_troll_chief/chr_chaos_troll_chief",
	behavior = "troll_chief",
	big_boy_turning_dot = 0.4,
	bone_lod_level = 0,
	boost_curve_multiplier_override = 1.8,
	boss = true,
	boss_damage_reduction = true,
	boss_staggers = true,
	bot_hitbox_radius_approximation = 1,
	bot_opportunity_target_melee_range = 7,
	bot_opportunity_target_melee_range_while_ranged = 5,
	bots_should_flank = true,
	catch_up_speed = 10,
	combat_music_state = "troll",
	death_reaction = "ai_default",
	default_inventory_template = "chaos_troll_chief",
	detection_radius = 9999999,
	dialogue_target_switch_attack_tag = "chaos_troll_target_changed",
	dialogue_target_switch_event = "enemy_target_changed",
	distance_sq_can_detect_target = 2025,
	distance_sq_idle_auto_detect_target = 49,
	downed_pulse_intensity = 0.2,
	downed_pulse_interval = 1,
	exchange_order = 1,
	far_off_despawn_immunity = true,
	far_vomit = "troll_chief_vomit",
	has_inventory = true,
	has_running_attack = true,
	headshot_coop_stamina_fatigue_type = "headshot_special",
	height = 3,
	hit_effect_template = "HitEffectsChaosTroll",
	hit_mass_count = 50,
	hit_reaction = "ai_default",
	husk_hit_reaction_cooldown = 1,
	ignore_nav_propagation_box = true,
	initial_is_passive = false,
	is_always_spawnable = true,
	is_bot_aid_threat = true,
	keep_weapon_on_death = false,
	minion_detection_radius = 10,
	navigation_spline_distance_to_borders = 1,
	near_vomit = "troll_chief_vomit_near",
	no_stagger_duration = false,
	panic_close_detection_radius_sq = 9,
	passive_in_patrol = true,
	passive_in_patrol_start_anim = "move_fwd",
	patrol_active_perception = "perception_rat_ogre",
	patrol_active_target_selection = "pick_rat_ogre_target_with_weights",
	patrol_detection_radius = 10,
	patrol_passive_perception = "perception_rat_ogre",
	patrol_passive_target_selection = "patrol_passive_target_selection",
	perception = "perception_rat_ogre",
	perception_continuous = "perception_continuous_chaos_troll",
	player_locomotion_constrain_radius = 1.5,
	poison_resistance = 100,
	proximity_system_check = true,
	race = "chaos",
	radius = 2,
	reach_distance = 4.2,
	reflect_regen_reduction_in_hp_bar = true,
	regen_pulse_intensity = 0.05,
	regen_pulse_interval = 2,
	regen_taken_damage_pause_time = 2,
	run_speed = 5.25,
	scale_death_push = 1,
	show_health_bar = true,
	slot_template = "boss",
	smart_object_template = "chaos_troll",
	stagger_resistance = 100,
	stagger_threshold_explosion = 1,
	stagger_threshold_heavy = 1,
	stagger_threshold_light = 1,
	stagger_threshold_medium = 1,
	target_selection = "pick_rat_ogre_target_idle",
	target_selection_angry = "pick_chaos_troll_target_with_weights",
	threat_value = 32,
	trigger_dialogue_on_target_switch = true,
	unit_template = "ai_unit_chaos_troll",
	use_aggro = true,
	use_avoidance = false,
	use_big_boy_turning = true,
	use_navigation_path_splines = true,
	walk_speed = 4,
	wield_inventory_on_spawn = true,
	displace_players_data = pushed_data,
	infighting = InfightingSettings.boss,
	perception_weights = {
		aggro_decay_per_sec = 4,
		distance_weight = 10,
		max_distance = 10,
		old_target_aggro_mul = 0.5,
		target_catapulted_mul = 2,
		target_disabled_aggro_mul = 0,
		target_disabled_mul = 0,
		target_is_in_vomit_multiplier = 10,
		target_outside_navmesh_mul = 0.5,
		target_staggered_you_bonus = 100,
		target_stickyness_bonus_a = 50,
		target_stickyness_bonus_b = 10,
		target_stickyness_duration_a = 3,
		target_stickyness_duration_b = 5,
		targeted_by_other_special = -10,
	},
	size_variation_range = {
		1 * size_multiplier,
		1 * size_multiplier,
	},
	max_health = BreedTweaks.max_health.chaos_troll_chief,
	bloodlust_health = BreedTweaks.bloodlust_health.monster,
	stagger_duration = {
		0,
		0,
		0,
		0,
		0,
		2.5,
		0,
		1,
	},
	max_health_regen_per_sec = {
		2,
		2,
		2,
		2,
		2,
		2,
		2,
		2,
	},
	max_health_regen_time = {
		12,
		12,
		10,
		8,
		6,
		4,
		3,
		2,
	},
	bot_melee_aim_node = {
		"j_leftleg",
		"j_rightleg",
		"j_hips",
		"j_head",
	},
	status_effect_settings = {
		category = "large",
		ignored_statuses = table.set({
			StatusEffectNames.burning_warpfire,
		}),
	},
	custom_health_bar_name = function (unit, default_name)
		local health_extension = ScriptUnit.has_extension(unit, "health_system")

		if not health_extension then
			return
		end

		local buff_extension = ScriptUnit.extension(unit, "buff_system")
		local current_time = Managers.time:time("game")

		if health_extension.state == "down" then
			local downed_buff = buff_extension:get_buff_type("troll_chief_downed_regen")

			if downed_buff then
				local time_since_downed = current_time - downed_buff.start_time
				local total_time = AiUtils.downed_duration(BreedActions.chaos_troll_chief.downed)
				local time_left = total_time - time_since_downed
				local title = Localize("chaos_troll_chief_regenerating")

				if time_left > 0 then
					return string.format("%s: %d", title, time_left)
				end
			end
		end

		local rage_buff = buff_extension:get_buff_type("troll_chief_on_downed_wounded")

		if rage_buff then
			local time_since_buff = current_time - rage_buff.start_time
			local total_time = rage_buff.duration
			local time_left = total_time - time_since_buff
			local title = Localize("chaos_troll_chief_raging")

			if time_left > 0 then
				return string.format("%s: %d", title, time_left)
			end
		end

		local num_protection_buff = buff_extension:num_buff_stacks("sorcerer_tether_buff_invulnerability")

		if num_protection_buff > 0 then
			return string.format("%s (%s)", Localize(default_name), Localize("chaos_troll_chief_protected"))
		end
	end,
	debug_color = {
		255,
		20,
		20,
		20,
	},
	run_on_spawn = AiBreedSnippets.on_chaos_troll_chief_spawn,
	run_on_update = AiBreedSnippets.on_chaos_troll_chief_update,
	run_on_death = AiBreedSnippets.on_chaos_troll_chief_death,
	run_on_despawn = AiBreedSnippets.on_chaos_troll_chief_despawn,
	blackboard_init_data = {
		ladder_distance = math.huge,
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
				"c_neck",
			},
			push_actors = {
				"j_head",
				"j_spine1",
			},
		},
		torso = {
			prio = 2,
			actors = {
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
			},
			push_actors = {
				"j_rightupleg",
				"j_rightleg",
				"j_rightfoot",
			},
		},
		full = {
			prio = 4,
			actors = {},
		},
		afro = {
			prio = 5,
			actors = {
				"afro",
			},
		},
	},
	allowed_layers = {
		big_boy_destructible = 1.5,
		bot_ratling_gun_fire = 15,
		destructible_wall = 0,
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

		QuestSettings.check_chaos_troll_killed_without_regen(blackboard, killer_unit)
		QuestSettings.check_chaos_troll_killed_without_bile_damage(blackboard, killer_unit)
	end,
}

Breeds.chaos_troll_chief = table.create_copy(Breeds.chaos_troll_chief, breed_data)

local AttackIntensityPerDifficulty = {
	cleave = {
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
		versus_base = {
			normal = 5,
			running = 2,
		},
	},
	sweep = {
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
		versus_base = {
			normal = 5,
			running = 2,
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
		versus_base = {
			normal = 1,
		},
	},
	vomit = {
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
		versus_base = {
			normal = 3,
			running = 0.5,
		},
	},
}
local action_data = {
	follow = {
		action_weight = 1,
		follow_target_function_name = "_follow_target_rat_ogre",
		move_anim = "move_start_fwd",
		override_move_speed = 4.25,
		considerations = UtilityConsiderations.troll_follow,
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
	follow_crouching = {
		action_weight = 1,
		crouching = true,
		follow_target_function_name = "_follow_target_rat_ogre",
		move_anim = "move_start_fwd",
		override_move_speed = 4,
		considerations = UtilityConsiderations.troll_follow,
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
		attack_anim = "smash_door",
		damage = 25,
		damage_type = "cutting",
		door_attack_distance = 2,
		move_anim = "move_start_fwd",
		name = "smash_door",
		unblockable = true,
	},
	attack_cleave = {
		action_weight = 1,
		allow_friendly_fire = true,
		attack_intensity_type = "cleave",
		blocked_damage = 15,
		damage = 30,
		damage_type = "cutting",
		fatigue_type = "chaos_cleave",
		target_running_distance_threshold = 4.5,
		target_running_velocity_threshold = 1,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.troll_chief_cleave,
		attacks = {
			{
				anim_driven = false,
				attack_time = 2.6666666666666665,
				damage_done_time = 1.5333333333333334,
				hit_multiple_targets = true,
				ignores_dodging = true,
				offset_forward = 1.1,
				offset_up = 0,
				player_push_speed = 8,
				player_push_speed_blocked = 8,
				rotation_time = 1.7,
				width = 1.75,
				multi_attack_anims = {
					fwd = "attack_cleave",
					left = "attack_cleave_left",
					right = "attack_cleave_right",
				},
				multi_anims_data = {
					attack_cleave = {},
					attack_cleave_left = {
						dir = 1,
						rad = math.pi / 2,
					},
					attack_cleave_right = {
						dir = -1,
						rad = math.pi / 2,
					},
				},
				attack_anim = {
					"attack_cleave",
				},
				range = 2.75 * size_multiplier,
				height = 2.5 * size_multiplier,
				push_units_in_the_way = pushed_data,
				bot_threats = {
					{
						duration = 0.6666666666666666,
						start_time = 0.8333333333333334,
					},
				},
			},
		},
		running_attacks = {
			{
				anim_driven = true,
				attack_time = 2.6666666666666665,
				damage_done_time = 1.4333333333333333,
				hit_multiple_targets = true,
				ignores_dodging = false,
				offset_forward = 1,
				offset_up = 0,
				player_push_speed = 8,
				player_push_speed_blocked = 8,
				rotation_speed = 8,
				rotation_time = 2.2,
				width = 1.75,
				attack_anim = {
					"attack_move_cleave",
				},
				range = 2.75 * size_multiplier,
				height = 2.5 * size_multiplier,
				push_units_in_the_way = running_pushed_data,
				bot_threats = {
					{
						duration = 0.6666666666666666,
						start_time = 0.9,
					},
				},
			},
		},
		difficulty_damage = BreedTweaks.difficulty_damage.boss_slam_attack,
		blocked_difficulty_damage = BreedTweaks.difficulty_damage.boss_slam_attack_blocked,
		ignore_staggers = {
			true,
			false,
			false,
			true,
			true,
			false,
		},
	},
	attack_crouch_sweep = {
		action_weight = 1,
		allow_friendly_fire = true,
		attack_intensity_type = "sweep",
		cooldown = -1,
		damage = 8,
		damage_type = "cutting",
		fatigue_type = "ogre_shove",
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.attack_crouch_sweep,
		attacks = {
			{
				anim_driven = false,
				attack_time = 2.3333333333333335,
				catapult_player = true,
				damage_done_time = 1.3333333333333333,
				freeze_intensity_decay_time = 15,
				height = 2,
				hit_multiple_targets = true,
				hit_only_players = false,
				ignore_targets_behind = true,
				ignores_dodging = true,
				offset_forward = 0,
				offset_up = 0,
				player_push_speed = 16,
				player_push_speed_blocked = 12.8,
				player_push_speed_blocked_z = 4,
				player_push_speed_z = 4,
				range = 2,
				rotation_time = 1,
				width = 0.4,
				attack_anim = {
					"attack_sweep",
					"attack_shove",
				},
				continious_overlap = {
					attack_sweep = {
						base_node_name = "j_leftforearm",
						start_time = 0.6666666666666666,
						tip_node_name = "j_lefthand",
					},
					attack_shove = {
						base_node_name = "j_rightforearm",
						start_time = 0.6666666666666666,
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
					},
					stagger_duration = {
						4.5,
						1,
						0,
						0,
					},
				},
				bot_threat_difficulty_data = default_bot_threat_difficulty_data,
				bot_threats = {
					{
						collision_type = "cylinder",
						duration = 0.7333333333333333,
						height = 3.5,
						offset_forward = 0,
						offset_right = 0,
						offset_up = 0,
						radius = 3.5,
						start_time = 0.6,
					},
				},
			},
		},
		difficulty_damage = BreedTweaks.difficulty_damage.boss_slam_attack,
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
		damage = 8,
		damage_type = "cutting",
		fatigue_type = "ogre_shove",
		ignore_ai_damage = true,
		self_running_speed_threshold = 2,
		target_running_distance_threshold = 4,
		target_running_velocity_threshold = 0.75,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.troll_chief_melee_shove,
		attacks = {
			{
				anim_driven = false,
				attack_time = 1.6666666666666667,
				catapult_player = true,
				freeze_intensity_decay_time = 15,
				hit_multiple_targets = true,
				hit_only_players = false,
				ignore_targets_behind = true,
				ignores_dodging = false,
				offset_forward = 0.5,
				offset_up = 0.5,
				player_push_speed = 16,
				player_push_speed_blocked = 12.8,
				player_push_speed_blocked_z = 4,
				player_push_speed_z = 4,
				rotation_speed = 7,
				rotation_time = 0.6,
				attack_anim = {
					"attack_shove",
				},
				damage_done_time = {
					attack_shove = 0.9,
				},
				range = 0.7 * size_multiplier,
				height = 0.8 * size_multiplier * 2,
				width = 0.8 * size_multiplier,
				continious_overlap = {
					attack_shove = {
						base_node_name = "j_rightforearm",
						start_time = 0.7,
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
					},
					stagger_duration = {
						4.5,
						1,
						0,
						0,
					},
				},
				bot_threat_difficulty_data = default_bot_threat_difficulty_data,
				bot_threats = {
					{
						collision_type = "cylinder",
						duration = 0.9333333333333333,
						height = 3.5,
						offset_forward = 0.5,
						offset_right = 0.25,
						offset_up = 0.5,
						radius = 4,
						start_time = 0.16666666666666666,
					},
				},
			},
		},
		running_attacks = {
			{
				anim_driven = true,
				attack_time = 2,
				catapult_player = true,
				freeze_intensity_decay_time = 15,
				hit_multiple_targets = true,
				hit_only_players = false,
				ignore_targets_behind = true,
				ignores_dodging = false,
				offset_forward = 1.2,
				offset_up = 0.5,
				player_push_speed = 16,
				player_push_speed_blocked = 12.8,
				player_push_speed_blocked_z = 4,
				player_push_speed_z = 4,
				rotation_speed = 1.5,
				rotation_time = 1,
				attack_anim = {
					"attack_pounce",
				},
				damage_done_time = {
					attack_pounce = 1.0333333333333334,
				},
				range = 0.7 * size_multiplier,
				height = 0.9 * size_multiplier * 2,
				width = 1.1 * size_multiplier,
				continious_overlap = {
					attack_pounce = {
						base_node_name = "j_rightforearm",
						start_time = 0.6,
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
					},
					stagger_duration = {
						4.5,
						1,
						0,
						0,
					},
				},
				bot_threat_difficulty_data = default_bot_threat_difficulty_data,
				bot_threats = {
					{
						collision_type = "cylinder",
						duration = 0.9333333333333333,
						height = 3.7,
						offset_forward = 5,
						offset_right = 0,
						offset_up = 0,
						radius = 3,
						start_time = 0.16666666666666666,
					},
				},
			},
		},
		difficulty_damage = BreedTweaks.difficulty_damage.boss_slam_attack,
	},
	melee_sweep = {
		action_weight = 1,
		allow_friendly_fire = true,
		attack_intensity_type = "sweep",
		blocked_damage = 2,
		damage = 8,
		damage_type = "cutting",
		fatigue_type = "ogre_shove",
		ignore_ai_damage = true,
		self_running_speed_threshold = 2,
		target_running_distance_threshold = 4,
		target_running_velocity_threshold = 0.75,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.troll_chief_melee_sweep,
		attacks = {
			{
				anim_driven = false,
				attack_time = 1.6666666666666667,
				catapult_player = true,
				freeze_intensity_decay_time = 15,
				hit_multiple_targets = true,
				hit_only_players = false,
				ignore_targets_behind = true,
				ignores_dodging = true,
				offset_forward = 1,
				offset_up = 0.5,
				player_push_speed = 16,
				player_push_speed_blocked = 12.8,
				player_push_speed_blocked_z = 4,
				player_push_speed_z = 4,
				rotation_speed = 7,
				rotation_time = 0.6,
				attack_anim = {
					"attack_sweep",
				},
				damage_done_time = {
					attack_sweep = 1,
				},
				range = 0.8 * size_multiplier,
				height = 0.8 * size_multiplier * 2,
				width = 1.1 * size_multiplier,
				continious_overlap = {
					attack_sweep = {
						base_node_name = "j_leftforearm",
						start_time = 0.6666666666666666,
						tip_node_name = "j_lefthand",
					},
				},
				push_ai = {
					stagger_distance = 3,
					stagger_impact = {
						stagger_types.explosion,
						stagger_types.heavy,
						stagger_types.none,
						stagger_types.none,
					},
					stagger_duration = {
						4.5,
						1,
						0,
						0,
					},
				},
				bot_threat_difficulty_data = default_bot_threat_difficulty_data,
				bot_threats = {
					{
						collision_type = "cylinder",
						duration = 0.9333333333333333,
						height = 3.5,
						offset_forward = 0,
						offset_right = -0.5,
						offset_up = 0,
						radius = 5,
						start_time = 0.16666666666666666,
					},
				},
			},
		},
		running_attacks = {
			{
				anim_driven = true,
				attack_time = 2,
				catapult_player = true,
				freeze_intensity_decay_time = 15,
				hit_multiple_targets = true,
				hit_only_players = false,
				ignore_targets_behind = true,
				ignores_dodging = false,
				offset_forward = 1.8,
				offset_up = 0.3,
				player_push_speed = 16,
				player_push_speed_blocked = 12.8,
				player_push_speed_blocked_z = 4,
				player_push_speed_z = 4,
				rotation_speed = 12,
				rotation_time = 1,
				attack_anim = {
					"attack_move_sweep",
				},
				damage_done_time = {
					attack_move_sweep = 1,
				},
				range = 1 * size_multiplier,
				height = 0.9 * size_multiplier * 2,
				width = 1.4 * size_multiplier,
				continious_overlap = {
					attack_move_sweep = {
						base_node_name = "j_leftforearm",
						start_time = 0.6666666666666666,
						tip_node_name = "j_lefthand",
					},
				},
				push_ai = {
					stagger_distance = 3,
					stagger_impact = {
						stagger_types.explosion,
						stagger_types.heavy,
						stagger_types.none,
						stagger_types.none,
					},
					stagger_duration = {
						4.5,
						1,
						0,
						0,
					},
				},
				bot_threat_difficulty_data = default_bot_threat_difficulty_data,
				bot_threats = {
					{
						collision_type = "cylinder",
						duration = 0.9333333333333333,
						height = 3.7,
						offset_forward = 4,
						offset_right = 0,
						offset_up = 0,
						radius = 5,
						start_time = 0.16666666666666666,
					},
				},
			},
		},
		difficulty_damage = BreedTweaks.difficulty_damage.boss_slam_attack,
		blocked_difficulty_damage = BreedTweaks.difficulty_damage.boss_slam_attack_blocked,
	},
	vomit = {
		action_weight = 1,
		attack_intensity_type = "vomit",
		attack_time = 2.5,
		firing_time = 0.77,
		near_vomit_distance = 25,
		rotation_time = 0.8,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.troll_chief_vomit,
		attack_anims = {
			near_vomit = "attack_vomit",
			ranged_vomit = "attack_vomit_high",
		},
		bot_threat_difficulty_data = default_bot_threat_difficulty_data,
		bot_threats = {
			{
				duration = 1,
				height = 3,
				offset_forward = 1,
				offset_up = 0,
				range = 8,
				start_time = 0.7333333333333333,
				width = 2.5,
			},
		},
	},
	target_rage = {
		rage_time = 0.75,
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
	},
	target_unreachable = {
		move_anim = "move_start_fwd",
	},
	climb = {
		catapult_players = {
			collision_filter = "filter_player_hit_box_check",
			radius = 2,
			speed = 7,
			angle = math.pi / 6,
		},
	},
	downed_sequence = {
		action_weight = 20,
	},
	downed = {
		buff_during_stand_up = "troll_chief_healing_immune",
		downed_buff = "troll_chief_downed",
		fixed_hp_chunks = 3,
		freeze_healing = true,
		min_downed_duration = 3,
		puke_on_downed = false,
		rage_buff_on_wounded = "troll_chief_on_downed_wounded",
		rage_explosion_template = "troll_chief_rage_explosion",
		reduce_hp_permanently = true,
		remove_leaving_buff_on_enter = true,
		reset_duration = 0,
		reset_health_on_fail = true,
		respawn_hp_chunk_percent = 0,
		standup_anim_duration = 5,
		downed_duration = {
			120,
			120,
			90,
			75,
			75,
			75,
			75,
		},
		downed_chunk_events = {
			[{
				1,
				2,
			}] = {
				start = function (unit, blackboard, phase)
					local unit_handles = {}

					blackboard.chunk_event_socket_handles = unit_handles
					blackboard.chunk_event_socket_units = {}
					blackboard.chunk_event_fused_units = {}
					blackboard.phase_one_buffs = blackboard.phase_one_buffs or {}

					local difficulty = Managers.state.difficulty:get_difficulty()
					local num_sockets_per_difficulty = {
						cataclysm = 4,
						default = 4,
						hard = 3,
						harder = 3,
						hardest = 4,
						normal = 2,
					}
					local num_sockets = num_sockets_per_difficulty[difficulty] or num_sockets_per_difficulty.default
					local socket_offset = 1.75
					local socket_space = 2
					local socket_unit = "units/gameplay/explosive_oil_jug_socket_01"
					local unit_pos = Unit.local_position(unit, 0)
					local unit_rot = Unit.local_rotation(unit, 0)
					local unit_right = Quaternion.right(unit_rot)
					local unit_forward = Quaternion.forward(unit_rot)
					local left_reference = unit_pos - unit_right * socket_offset
					local right_reference = unit_pos + unit_right * socket_offset
					local forward_reference = unit_pos + unit_forward * socket_offset
					local back_reference = unit_pos - unit_forward * socket_offset
					local extension_init_data = {}
					local nav_world = Managers.state.entity:system("ai_system"):nav_world()
					local num_on_left = math.ceil(num_sockets * 0.5)

					for i = 1, num_on_left do
						local fit_space = num_on_left > 1 and socket_space / ((num_on_left - 1) * 0.5) or 0
						local slot = (i - 1 - (num_on_left - 1) * 0.5) * fit_space * 0.5
						local pos = LocomotionUtils.pos_on_mesh(nav_world, left_reference + unit_forward * slot, 1, 1)

						if pos then
							unit_handles[#unit_handles + 1] = Managers.state.unit_spawner:queue_spawn_network_unit(socket_unit, "explosive_barrel_socket", extension_init_data, pos)
						else
							num_sockets = num_sockets + 1
						end
					end

					local num_on_right = num_sockets - num_on_left

					for i = 1, num_on_right do
						local fit_space = num_on_right > 1 and socket_space / ((num_on_right - 1) * 0.5) or 0
						local slot = (i - 1 - (num_on_right - 1) * 0.5) * fit_space * 0.5
						local pos = LocomotionUtils.pos_on_mesh(nav_world, right_reference + unit_forward * slot, 1, 1)

						if pos then
							unit_handles[#unit_handles + 1] = Managers.state.unit_spawner:queue_spawn_network_unit(socket_unit, "explosive_barrel_socket", extension_init_data, pos)
						else
							num_sockets = num_sockets + 1
						end
					end

					local num_forward = num_sockets - num_on_left - num_on_right

					for i = 1, num_forward do
						local fit_space = num_forward > 1 and socket_space / ((num_forward - 1) * 0.5) or 0
						local slot = (i - 1 - (num_forward - 1) * 0.5) * fit_space * 0.5
						local pos = LocomotionUtils.pos_on_mesh(nav_world, forward_reference + unit_right * slot, 1, 1)

						if pos then
							unit_handles[#unit_handles + 1] = Managers.state.unit_spawner:queue_spawn_network_unit(socket_unit, "explosive_barrel_socket", extension_init_data, pos)
						else
							num_sockets = num_sockets + 1
						end
					end

					local num_back = num_sockets - num_on_left - num_on_right - num_forward

					for i = 1, num_back do
						local fit_space = num_back > 1 and socket_space / ((num_back - 1) * 0.5) or 0
						local slot = (i - 1 - (num_back - 1) * 0.5) * fit_space * 0.5
						local pos = LocomotionUtils.pos_on_mesh(nav_world, back_reference + unit_right * slot, 1, 1)

						if pos then
							unit_handles[#unit_handles + 1] = Managers.state.unit_spawner:queue_spawn_network_unit(socket_unit, "explosive_barrel_socket", extension_init_data, pos)
						end
					end

					local num_barrels = #unit_handles

					local function safe_navigation_callback()
						local barrel_extension_init_data = {
							tutorial_system = {
								always_show = true,
							},
						}
						local pickup_system = Managers.state.entity:system("pickup_system")
						local barrel_spawners = pickup_system.triggered_pickup_spawners.boss_barrel_spawn

						if barrel_spawners then
							barrel_spawners = table.shallow_copy(barrel_spawners)

							table.shuffle(barrel_spawners)
						end

						local num_spawners = barrel_spawners and #barrel_spawners

						for i = 1, num_barrels do
							local barrel_pos = barrel_spawners and Unit.local_position(barrel_spawners[math.index_wrapper(i, num_spawners)], 0) or Unit.local_position(unit, 0)

							if barrel_pos then
								local rot = Quaternion.axis_angle(Vector3.up(), math.random() * math.tau)

								rot = Quaternion.multiply(Quaternion.axis_angle(Vector3.right(), math.random() * math.tau), rot)
								rot = Quaternion.multiply(Quaternion.axis_angle(Vector3.forward(), math.random() * math.tau), rot)

								local pickup_unit = pickup_system:spawn_pickup("lamp_oil", barrel_pos, rot, false, "triggered", nil, "explosive_pickup_projectile_unit", barrel_extension_init_data)
								local tutorial_extension = ScriptUnit.extension(pickup_unit, "tutorial_system")

								tutorial_extension:set_active(true)
							end
						end
					end

					local ai_navigation_system = Managers.state.entity:system("ai_navigation_system")

					ai_navigation_system:add_safe_navigation_callback(safe_navigation_callback)
				end,
				update = function (unit, blackboard, t)
					local time_to_explode = 2
					local health_extension = ScriptUnit.extension(unit, "health_system")
					local chunk_size = health_extension:chunk_size()
					local total_of_chunk = BuffTemplates.troll_chief_barrel_exploded.buffs[1].total_part_of_chunk
					local num_socket_units = #blackboard.chunk_event_socket_units
					local damage_to_deal = chunk_size / num_socket_units * total_of_chunk
					local unit_handles = blackboard.chunk_event_socket_handles
					local socket_units = blackboard.chunk_event_socket_units

					for i = #unit_handles, 1, -1 do
						local spawned_unit = Managers.state.unit_spawner:try_claim_async_unit(unit_handles[i])

						if spawned_unit then
							socket_units[#socket_units + 1] = spawned_unit

							table.swap_delete(unit_handles, i)

							local num_sockets = #socket_units + #unit_handles
							local total_damage_reduction = BuffTemplates.troll_chief_phase_one_damage_reduction.buffs[1].total_multiplier
							local multiplier = total_damage_reduction / num_sockets
							local buff_system = Managers.state.entity:system("buff_system")

							blackboard.phase_one_buffs[spawned_unit] = buff_system:add_buff_synced(unit, "troll_chief_phase_one_damage_reduction", BuffSyncType.All, {
								external_optional_multiplier = multiplier,
							})
						end
					end

					local fused_units = blackboard.chunk_event_fused_units

					for i = 1, #socket_units do
						local socket_unit = socket_units[i]
						local socket_extension = ScriptUnit.extension(socket_unit, "objective_socket_system")

						if not fused_units[socket_unit] then
							local socket = socket_extension:socket_from_id(1)

							if socket.open == false then
								Unit.flow_event(socket_units[i], "fuse_light")

								fused_units[socket_unit] = t + time_to_explode
							end
						elseif t > fused_units[socket_unit] then
							local function safe_navigation_callback()
								if fused_units[socket_unit] and HEALTH_ALIVE[unit] then
									Unit.flow_event(socket_units[i], "force_explode")

									local buff_extension = ScriptUnit.extension(unit, "buff_system")
									local damage_reduction_id = blackboard.phase_one_buffs[socket_unit]

									buff_extension:remove_buff(damage_reduction_id)

									blackboard.phase_one_buffs[socket_unit] = nil

									DamageUtils.add_damage_network(unit, unit, damage_to_deal, "torso", "forced", nil, Vector3(0, 0, 1), "life_tap", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 1)

									local buff_system = Managers.state.entity:system("buff_system")

									buff_system:add_buff_synced(unit, "troll_chief_barrel_exploded", BuffSyncType.All, {
										external_optional_multiplier = -1 / num_socket_units,
									})
								end
							end

							local ai_navigation_system = Managers.state.entity:system("ai_navigation_system")

							ai_navigation_system:add_safe_navigation_callback(safe_navigation_callback)

							fused_units[socket_unit] = math.huge
						end
					end
				end,
				before_down_end = function (unit, blackboard)
					local health_extension = ScriptUnit.extension(unit, "health_system")
					local chunk_size = health_extension:chunk_size()
					local total_of_chunk = BuffTemplates.troll_chief_barrel_exploded.buffs[1].total_part_of_chunk
					local num_socket_units = #blackboard.chunk_event_socket_units
					local damage_to_deal = chunk_size / num_socket_units * total_of_chunk
					local buff_extension = ScriptUnit.extension(unit, "buff_system")

					for socket_unit, id in pairs(blackboard.phase_one_buffs) do
						buff_extension:remove_buff(id)

						blackboard.phase_one_buffs[socket_unit] = nil
					end

					local fused_units = blackboard.chunk_event_fused_units

					for fused_unit, t in pairs(fused_units) do
						if t ~= math.huge then
							Unit.flow_event(fused_unit, "force_explode")
							DamageUtils.add_damage_network(unit, unit, damage_to_deal, "torso", "life_tap", nil, Vector3(0, 0, 1), "debug", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, 1)

							local buff_system = Managers.state.entity:system("buff_system")

							buff_system:add_buff_synced(unit, "troll_chief_barrel_exploded", BuffSyncType.All, {
								external_optional_multiplier = -1 / num_socket_units,
							})
						end
					end
				end,
				finish = function (unit, blackboard, phase)
					local unit_handles = blackboard.chunk_event_socket_handles

					for i = 1, #unit_handles do
						Managers.state.unit_spawner:remove_queued_network_unit(unit_handles[i])

						unit_handles[i] = nil
					end

					local socket_units = blackboard.chunk_event_socket_units

					for i = 1, #socket_units do
						Managers.state.unit_spawner:mark_for_deletion(socket_units[i])

						socket_units[i] = nil
					end

					local objectives = Managers.state.entity:get_entities("ObjectiveUnitExtension")

					for objective_unit, extension in pairs(objectives) do
						if not AiUtils.unit_breed(objective_unit) and extension.active then
							extension:set_active(false)

							extension.proxy_active = false
						end
					end

					local health_extension = ScriptUnit.extension(unit, "health_system")
					local _, _, _, _, new_phase = health_extension:respawn_thresholds()

					if new_phase ~= phase then
						local buff_system = Managers.state.entity:system("buff_system")
						local buff_extension = ScriptUnit.extension(unit, "buff_system")
						local healing_reduction_buffs = buff_extension:get_stacking_buff("troll_chief_barrel_exploded")

						if healing_reduction_buffs then
							for i = #healing_reduction_buffs, 1, -1 do
								buff_system:remove_buff_synced(unit, healing_reduction_buffs[i].id)
							end
						end

						local open_alcove_event = "boss_arena_alcove_" .. string.pad_left(tostring(phase), 2, "0") .. "_open"

						LevelHelper:flow_event(blackboard.world, open_alcove_event)
					end

					table.clear(blackboard.chunk_event_fused_units)
				end,
			},
		},
		upped_chunk_events = {
			[{
				2,
				3,
			}] = {
				condition_func = function (unit, blackboard, phase, t, dt)
					local buff_extension = ScriptUnit.extension(unit, "buff_system")

					if buff_extension:get_buff_type("troll_chief_on_downed_wounded") then
						blackboard.wizards_delay = nil

						return false
					end

					blackboard.wizards_delay = blackboard.wizards_delay or t + 1.5

					if t > blackboard.wizards_delay then
						return true
					end

					return false
				end,
				start = function (unit, blackboard, phase, t, dt)
					local difficulty = Managers.state.difficulty:get_difficulty()
					local num_sorcerers_per_difficulty = {
						cataclysm = 4,
						default = 4,
						hard = 2,
						harder = 3,
						hardest = 4,
						normal = 1,
					}
					local num_sorcerers = num_sorcerers_per_difficulty[difficulty] or num_sorcerers_per_difficulty.default
					local spawner_system = Managers.state.entity:system("spawner_system")
					local spawners = spawner_system:get_raw_spawner_units("boss_sorcerer")

					if spawners then
						spawners = table.shallow_copy(spawners)

						table.shuffle(spawners)
					end

					local num_spawners = spawners and #spawners
					local buff_system = Managers.state.entity:system("buff_system")
					local optional_data = {
						far_off_despawn_immunity = true,
						spawned_func = function (ai_unit, breed, optional_data)
							local buff_params = {
								attacker_unit = ai_unit,
							}

							buff_system:add_buff_synced(unit, "sorcerer_tether_buff_invulnerability", BuffSyncType.All, buff_params)

							local tutorial_extension = ScriptUnit.extension(ai_unit, "tutorial_system")

							tutorial_extension:set_active(true)
							tutorial_extension:set_always_show(true)
						end,
					}
					local breed = Breeds.chaos_tether_sorcerer

					for i = 1, num_sorcerers do
						local spawn_pos = spawners and Unit.local_position(spawners[math.index_wrapper(i, num_spawners)], 0) or Unit.local_position(unit, 0)

						Managers.state.conflict:spawn_queued_unit(breed, Vector3Box(spawn_pos), QuaternionBox(Quaternion.identity()), nil, nil, "terror_event", optional_data)
					end

					Managers.state.entity:system("audio_system"):play_2d_audio_event("Play_dwarf_fest_boss_sorcerer_shield_spawn")
				end,
				finish = function (unit, blackboard)
					blackboard.wizards_delay = nil
				end,
			},
		},
	},
	spawn_allies_defensive = {
		duration = 0,
		find_spawn_points = false,
		spawn_group = "default",
		stay_still = true,
		stinger_name = "enemy_horde_chaos_stinger",
		phase_spawn = {
			"troll_chief_defensive_1",
			"troll_chief_defensive_2",
			"troll_chief_defensive_2",
		},
	},
	spawn_allies_rage = {
		duration = 0,
		find_spawn_points = false,
		spawn_group = "default",
		stay_still = true,
		stinger_name = "enemy_horde_chaos_stinger",
		phase_spawn = {
			"troll_chief_rage_1",
			"troll_chief_rage_1",
			"troll_chief_rage_2",
		},
	},
	stagger = {
		override_mover_move_distance = 2,
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
}

BreedActions.chaos_troll_chief = table.create_copy(BreedActions.chaos_troll_chief, action_data)

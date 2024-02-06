-- chunkname: @scripts/settings/breeds/breed_chaos_exalted_sorcerer.lua

local stagger_types = require("scripts/utils/stagger_types")
local breed_data = {
	ai_strength = 10,
	ai_toughness = 10,
	animation_sync_rpc = "rpc_sync_anim_state_7",
	aoe_height = 2.1,
	aoe_radius = 0.7,
	armor_category = 3,
	armored_on_no_damage = true,
	awards_positive_reinforcement_message = true,
	base_unit = "units/beings/enemies/chaos_sorcerer_boss/chr_chaos_sorcerer_boss",
	behavior = "chaos_exalted_sorcerer",
	bone_lod_level = 1,
	boost_curve_multiplier_override = 1.8,
	boss = true,
	bot_hitbox_radius_approximation = 0.8,
	combat_music_state = "champion_chaos_exalted_sorcerer",
	death_reaction = "ai_default",
	default_inventory_template = "chaos_exalted_sorcerer",
	detection_radius = 9999999,
	dialogue_source_name = "chaos_exalted_sorcerer",
	disable_second_hit_ragdoll = true,
	exchange_order = 2,
	far_off_despawn_immunity = true,
	flingable = true,
	has_inventory = true,
	headshot_coop_stamina_fatigue_type = "headshot_special",
	hit_effect_template = "HitEffectsChaosExaltedSorcerer",
	hit_reaction = "ai_default",
	initial_is_passive = false,
	is_bot_aid_threat = true,
	is_of_interest_func = "is_of_interest_boss_sorcerer",
	lord_damage_reduction = true,
	max_chain_stagger_time = 2,
	max_vortex_units = 3,
	minion_detection_radius = 10,
	perception = "perception_all_seeing_boss",
	player_locomotion_constrain_radius = 0.7,
	poison_resistance = 100,
	proximity_system_check = true,
	race = "chaos",
	radius = 1,
	run_speed = 0.65,
	server_controlled_health_bar = true,
	smart_object_template = "special",
	smart_targeting_height_multiplier = 2.2,
	smart_targeting_outer_width = 0.7,
	smart_targeting_width = 0.3,
	target_selection = "pick_boss_sorcerer_target",
	threat_value = 8,
	unit_template = "ai_unit_chaos_exalted_sorcerer",
	vortexable = false,
	walk_speed = 0.65,
	wield_inventory_on_spawn = true,
	infighting = InfightingSettings.boss,
	size_variation_range = {
		1.27,
		1.27,
	},
	max_health = BreedTweaks.max_health.exalted_sorcerer,
	bloodlust_health = BreedTweaks.bloodlust_health.monster,
	stagger_modifier_function = function (stagger_type, duration, length, hit_zone_name, blackboard, breed)
		if not blackboard.unit then
			return stagger_type, duration, length
		end

		if blackboard.stagger_count >= stagger_types.heavy then
			stagger_type = stagger_types.none
			blackboard.stagger_ignore_anim_cb = true
		else
			blackboard.stagger_ignore_anim_cb = false
		end

		return stagger_type, duration, length
	end,
	status_effect_settings = {
		category = "medium",
		ignored_statuses = table.set({
			StatusEffectNames.burning_warpfire,
			StatusEffectNames.poisoned,
		}),
	},
	debug_color = {
		255,
		200,
		200,
		0,
	},
	run_on_spawn = AiBreedSnippets.on_chaos_exalted_sorcerer_spawn,
	run_on_update = AiBreedSnippets.on_chaos_exalted_sorcerer_update,
	run_on_death = AiBreedSnippets.on_chaos_exalted_sorcerer_death,
	run_on_despawn = AiBreedSnippets.on_chaos_exalted_sorcerer_despawn,
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
				"c_hips",
				"c_spine",
				"c_spine1",
				"c_leftshoulder",
				"c_rightshoulder",
			},
			push_actors = {
				"j_spine1",
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
		full = {
			prio = 4,
			actors = {},
		},
		afro = {
			prio = 5,
			actors = {
				"h_afro",
			},
		},
	},
	allowed_layers = {
		bot_poison_wind = 2,
		bot_ratling_gun_fire = 10,
		destructible_wall = 0,
		doors = 1.5,
		fire_grenade = 10,
		jumps = 5,
		ledges = 5,
		ledges_with_fence = 5,
		planks = 1.5,
		teleporters = 5,
		temporary_wall = 2,
	},
	difficulty_kill_achievements = {
		"kill_chaos_exalted_sorcerer_difficulty_rank",
		"kill_chaos_exalted_sorcerer_scorpion_hardest",
	},
	custom_death_enter_function = function (unit, killer_unit, damage_type, death_hit_zone, t, damage_source)
		if not Unit.alive(killer_unit) then
			return
		end

		QuestSettings.check_killed_lord_as_last_player_standing(killer_unit)
	end,
}

Breeds.chaos_exalted_sorcerer = table.create_copy(Breeds.chaos_exalted_sorcerer, breed_data)

local MISSILE_RADIUS = 4
local num_flower_waves = 12
local angle_between_flower_waves = 2 * math.pi / ((num_flower_waves + 1) * 0.5)
local action_data = {
	skulking = {
		close_distance = 7,
		far_away_from_target_sq = 400,
		max_cast_vortex_distance = 75,
		max_player_vortex_distance = 15,
		max_wave_distance = 25,
		min_cast_vortex_distance = 0,
		min_player_vortex_distance = 0,
		min_wave_distance = 13,
		move_animation = "move_fwd",
		part_hp_lost_to_teleport = 0.01,
		preferred_distance = 10,
		search_func_name = "update_portal_search",
		sorcerer_type = "exalted",
		teleport_closer_range = 5,
		third_wave_max_distance = 7,
		third_wave_min_distance = 1,
		vanish_countdown = 7.5,
		vanish_timer = 8,
		vortex_check_timer = 2,
		vortex_spawn_timer = 3,
		teleport_cooldown = {
			7,
			10,
		},
		missile_spawn_offset = {
			0.1281,
			1.1719,
			1.3749,
		},
		available_spells = {
			"vortex",
			"plague_wave",
			"magic_missile",
			"seeking_bomb_missile",
		},
		after_casting_delay = {
			cataclysm = 1.5,
			cataclysm_2 = 0.5,
			cataclysm_3 = 0,
			easy = 4,
			hard = 1.5,
			harder = 0.5,
			hardest = 0,
			normal = 3,
		},
	},
	spawn_boss_vortex = {
		attack_anim = "attack_staff",
		cleanup_func_name = "_clean_up_vortex_summoning",
		inner_decal_unit_name = "units/decals/decal_vortex_circle_inner",
		link_decal_units_to_vortex = true,
		outer_decal_unit_name = "units/decals/decal_vortex_circle_outer",
		spawn_func_name = "_spawn_boss_vortex",
		vortex_template_name = "boss_sorcerer",
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true,
		},
	},
	spawn_flower_wave = {
		attack_anim = "attack_wave_summon_start",
		damage_wave_template = "pattern_plague_wave",
		duration_between_waves = 0.1,
		ignore_attack_finished = true,
		init_func_name = "init_summon_plague_wave_sequence",
		max_wave_to_target_dist = 5,
		pattern_repetitions = 1,
		range = 8,
		spawn_func_name = "spawn_plague_waves_in_patterns",
		spawner_set_id = "sorcerer_boss_center",
		update_func_name = "update_sequenced_plague_wave_spawning",
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true,
		},
		num_waves = num_flower_waves,
		spawn_rot_func = function (unit, blackboard, spawner_unit, index)
			local spawn_rot = Unit.local_rotation(spawner_unit, 0)
			local radians = blackboard.random_flower_angles and blackboard.random_flower_angles[blackboard.wave_counter] or angle_between_flower_waves * blackboard.wave_counter
			local turn_rot = Quaternion(Vector3.up(), radians)

			spawn_rot = Quaternion.multiply(spawn_rot, turn_rot)

			return spawn_rot
		end,
		sequence_init_func = function (unit, blackboard)
			local angles = {}
			local angle = math.random()

			for i = 1, num_flower_waves do
				angle = angle + angle_between_flower_waves
				angles[i] = angle
			end

			table.shuffle(angles)

			blackboard.random_flower_angles = angles
		end,
	},
	spawn_multiple_wave = {
		attack_anim = "attack_wave_summon_start",
		damage_wave_template = "plague_wave",
		init_func_name = "init_summon_plague_wave",
		max_wave_to_target_dist = 5,
		pattern_repetitions = 3,
		spawn_func_name = "spawn_plague_waves_in_patterns",
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true,
		},
		spawn_rot_func = function (unit, blackboard, _, index)
			local spawn_rot = Unit.local_rotation(unit, 0)
			local radians = (index - 2) * 0.3
			local turn_rot = Quaternion(Vector3.up(), radians)

			spawn_rot = Quaternion.multiply(spawn_rot, turn_rot)

			return spawn_rot
		end,
		goal_pos_func = function (unit, blackboard, spawner_unit, index, spawn_pos, goal_pos, spawn_dir)
			local _, hit_pos = GwNavQueries.raycast(blackboard.nav_world, spawn_pos, goal_pos)

			if hit_pos then
				return hit_pos
			end
		end,
	},
	cast_missile = {
		cast_anim = "attack_shoot_hand",
		create_nav_tag_volume = true,
		damage_type = "poison",
		duration = 8,
		face_target_while_casting = true,
		launch_angle = 1,
		nav_tag_volume_layer = "bot_poison_wind",
		volley_delay = 0.3,
		volleys = 2,
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true,
		},
		missile_spawn_offset = {
			0.1281,
			1.1719,
			1.3749,
		},
		init_spell_func = function (blackboard)
			blackboard.current_spell = blackboard.sorcerer_strike_missile_data
		end,
		get_throw_position_func = function (unit, blackboard, target_position)
			local ai_inventory_ext = ScriptUnit.has_extension(unit, "ai_inventory_system")
			local weapon_unit = ai_inventory_ext.inventory_item_units[1]
			local throw_pos = Unit.world_position(weapon_unit, Unit.node(weapon_unit, "j_skull_2_parent"))
			local target_dir = Vector3.normalize(target_position - throw_pos)

			return throw_pos, target_dir
		end,
	},
	cast_seeking_bomb_missile = {
		cast_anim = "attack_shoot_staff",
		create_nav_tag_volume = true,
		damage_type = "poison",
		duration = 8,
		face_target_while_casting = true,
		nav_tag_volume_layer = "bot_poison_wind",
		volley_delay = 0.3,
		volleys = 1,
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true,
		},
		radius = MISSILE_RADIUS,
		initial_radius = MISSILE_RADIUS * 0.6,
		missile_spawn_offset = {
			0.1281,
			1.1719,
			1.3749,
		},
	},
	quick_teleport = {
		catapult_players = true,
		push_close_players = true,
		push_speed = 10,
		push_speed_z = 6,
		radius = 4,
		teleport_effect = "fx/chr_chaos_sorcerer_teleport",
		teleport_effect_trail = "fx/chr_chaos_sorcerer_teleport_direction",
		teleport_end_anim = "teleport_end",
		teleport_start_anim = "teleport_start",
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true,
		},
	},
	defensive_magic_missile = {
		action_weight = 1,
		cast_anim = "attack_shoot_hand",
		create_nav_tag_volume = true,
		damage_type = "poison",
		duration = 8,
		face_target_while_casting = true,
		launch_angle = 1,
		nav_tag_volume_layer = "bot_poison_wind",
		volley_delay = 0.3,
		volleys = 2,
		considerations = UtilityConsiderations.defensive_magic_missile,
		radius = MISSILE_RADIUS,
		initial_radius = MISSILE_RADIUS * 0.6,
		missile_spawn_offset = {
			0.1281,
			1.1719,
			1.3749,
		},
		init_spell_func = function (blackboard)
			blackboard.current_spell = blackboard.sorcerer_strike_missile_data
		end,
		get_throw_position_func = function (unit, blackboard, target_position)
			local ai_inventory_ext = ScriptUnit.has_extension(unit, "ai_inventory_system")
			local weapon_unit = ai_inventory_ext.inventory_item_units[1]
			local throw_pos = Unit.world_position(weapon_unit, Unit.node(weapon_unit, "j_skull_2_parent"))
			local target_dir = Vector3.normalize(target_position - throw_pos)

			return throw_pos, target_dir
		end,
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true,
		},
	},
	defensive_seeking_bomb = {
		action_weight = 1,
		cast_anim = "attack_shoot_staff",
		create_nav_tag_volume = true,
		damage_type = "poison",
		duration = 8,
		face_target_while_casting = true,
		nav_tag_volume_layer = "bot_poison_wind",
		volley_delay = 0.3,
		volleys = 1,
		considerations = UtilityConsiderations.defensive_seeking_bomb,
		missile_spawn_offset = {
			0.1281,
			1.1719,
			1.3749,
		},
		init_spell_func = function (blackboard)
			blackboard.current_spell = blackboard.seeking_bomb_missile_data
		end,
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true,
		},
	},
	intro_idle = {
		animation = "intro_lord",
		duration = 21,
		ignore_staggers = {
			true,
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
	defensive_idle = {
		action_weight = 1,
		animation = "idle_guard",
		duration = 3,
		considerations = UtilityConsiderations.defensive_sorcerer_idle,
		ignore_staggers = {
			true,
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
	defensive_escape_teleport = {
		teleport_effect = "fx/chr_chaos_sorcerer_teleport",
		teleport_effect_trail = "fx/chr_chaos_sorcerer_teleport_direction",
		teleport_end_anim = "teleport_end",
		teleport_start_anim = "teleport_start",
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true,
		},
		teleport_pos_func = function (unit, blackboard)
			local spawner = ConflictUtils.get_random_spawner_with_id("sorcerer_boss", blackboard.defensive_spawner)

			blackboard.defensive_spawner = spawner

			return Unit.local_position(spawner, 0)
		end,
	},
	defensive_teleport = {
		teleport_effect = "fx/chr_chaos_sorcerer_teleport",
		teleport_effect_trail = "fx/chr_chaos_sorcerer_teleport_direction",
		teleport_end_anim = "teleport_end",
		teleport_start_anim = "teleport_start",
		ignore_staggers = {
			true,
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
	spawn_allies = {
		animation = "idle_guard",
		duration = 5,
		find_spawn_points = false,
		stay_still = true,
		stinger_name = "enemy_horde_chaos_stinger",
		terror_event_id = "sorcerer_boss_minion",
		difficulty_spawn = {
			cataclysm = "sorcerer_boss_event_defensive",
			cataclysm_2 = "sorcerer_boss_event_defensive",
			cataclysm_3 = "sorcerer_boss_event_defensive",
			easy = "sorcerer_boss_event_defensive",
			hard = "sorcerer_boss_event_defensive",
			harder = "sorcerer_boss_event_defensive",
			hardest = "sorcerer_boss_event_defensive",
			normal = "sorcerer_boss_event_defensive",
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
			true,
		},
	},
	spawn_allies_horde = {
		animation = "idle_guard",
		duration = 1,
		find_spawn_points = false,
		stay_still = true,
		terror_event_id = "sorcerer_boss_minion",
		difficulty_spawn = {
			cataclysm = "sorcerer_extra_spawn",
			cataclysm_2 = "sorcerer_extra_spawn",
			cataclysm_3 = "sorcerer_extra_spawn",
			easy = "sorcerer_extra_spawn",
			hard = "sorcerer_extra_spawn",
			harder = "sorcerer_extra_spawn",
			hardest = "sorcerer_extra_spawn",
			normal = "sorcerer_extra_spawn",
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
			true,
		},
	},
	stagger = {
		custom_enter_function = function (unit, blackboard, t, action)
			blackboard.stagger_ignore_anim_cb = true

			local stagger_anims = action.stagger_anims[blackboard.stagger_type]

			return stagger_anims, "idle"
		end,
		stagger_anims = {
			{
				fwd = {
					"stagger_fwd_light",
				},
				bwd = {
					"stagger_bwd_light",
				},
				right = {
					"stagger_left_light",
				},
				left = {
					"stagger_right_light",
				},
			},
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd",
				},
				right = {
					"stagger_left",
				},
				left = {
					"stagger_right",
				},
			},
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd",
				},
				right = {
					"stagger_left",
				},
				left = {
					"stagger_right",
				},
			},
			{
				fwd = {
					"stagger_fwd_light",
				},
				bwd = {
					"stagger_bwd_light",
				},
				right = {
					"stagger_left_light",
				},
				left = {
					"stagger_right_light",
				},
			},
			{
				fwd = {
					"stagger_fwd_light",
				},
				bwd = {
					"stagger_bwd_light",
				},
				right = {
					"stagger_left_light",
				},
				left = {
					"stagger_right_light",
				},
			},
			{
				fwd = {
					"stagger_fwd_exp",
				},
				bwd = {
					"stagger_bwd_exp",
				},
				right = {
					"stagger_left_exp",
				},
				left = {
					"stagger_right_exp",
				},
			},
			{
				fwd = {
					"stagger_fwd",
				},
				bwd = {
					"stagger_bwd",
				},
				right = {
					"stagger_left",
				},
				left = {
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
				right = {
					"stagger_left",
				},
				left = {
					"stagger_right",
				},
			},
		},
	},
}

local function copy_action_data(action_name, source_action, spell_name)
	local action = table.clone(source_action)

	action.considerations = UtilityConsiderations[action_name]
	action.action_weight = 1
	action.available_spells = {
		spell_name,
	}

	return action
end

action_data.vortex_skulking = copy_action_data("vortex_skulking", action_data.skulking, "vortex")
action_data.vortex_skulking.search_func_name = "_update_vortex_search"
action_data.tentacle_skulking = copy_action_data("tentacle_skulking", action_data.skulking, "tentacle")
action_data.plague_wave_skulking = copy_action_data("exalted_plague_wave_skulking", action_data.skulking, "plague_wave")
action_data.magic_missile_skulking = copy_action_data("magic_missile_skulking", action_data.skulking, "magic_missile")
action_data.seeking_bomb_missile_skulking = copy_action_data("seeking_bomb_missile_skulking", action_data.skulking, "seeking_bomb_missile")
BreedActions.chaos_exalted_sorcerer = table.create_copy(BreedActions.chaos_exalted_sorcerer, action_data)

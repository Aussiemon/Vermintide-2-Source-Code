-- chunkname: @scripts/settings/breeds/breed_chaos_spawn.lua

local stagger_types = require("scripts/utils/stagger_types")
local pushed_data = {
	ahead_dist = 1.5,
	player_pushed_speed = 8,
	push_forward_offset = 1,
	push_stagger_distance = 1,
	push_width = 2.5,
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
	animation_sync_rpc = "rpc_sync_anim_state_12",
	aoe_height = 2.4,
	aoe_radius = 1,
	armor_category = 3,
	awards_positive_reinforcement_message = true,
	base_unit = "units/beings/enemies/chaos_spawn/chr_chaos_spawn",
	behavior = "chaos_spawn",
	big_boy_turning_dot = 0.4,
	bone_lod_level = 0,
	boost_curve_multiplier_override = 2,
	boss = true,
	boss_damage_reduction = true,
	boss_staggers = true,
	bot_hitbox_radius_approximation = 0.8,
	bot_opportunity_target_melee_range = 7,
	bot_opportunity_target_melee_range_while_ranged = 5,
	bots_should_flank = true,
	catch_up_speed = 12,
	combat_music_state = "chaos_spawn",
	death_reaction = "ai_default",
	detection_radius = 9999999,
	disable_local_hit_reactions = true,
	distance_sq_can_detect_target = 2025,
	distance_sq_idle_auto_detect_target = 49,
	exchange_order = 1,
	far_off_despawn_immunity = true,
	has_inventory = false,
	headshot_coop_stamina_fatigue_type = "headshot_special",
	hit_effect_template = "HitEffectsChaosSpawn",
	hit_mass_count = 50,
	hit_reaction = "ai_default",
	husk_hit_reaction_cooldown = 1,
	ignore_nav_propagation_box = true,
	is_always_spawnable = true,
	is_bot_aid_threat = true,
	max_grabbed_attacks = 2,
	minion_detection_radius = 10,
	navigation_spline_distance_to_borders = 1,
	no_stagger_duration = false,
	override_mover_move_distance = 1.5,
	perception = "perception_rat_ogre",
	perception_continuous = "perception_continuous_chaos_spawn",
	player_locomotion_constrain_radius = 1.5,
	poison_resistance = 100,
	proximity_system_check = true,
	race = "chaos",
	radius = 2,
	reach_distance = 3,
	run_speed = 7,
	scale_death_push = 1,
	slot_template = "boss",
	smart_object_template = "chaos_spawn",
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
	unit_template = "ai_unit_chaos_spawn",
	use_avoidance = false,
	use_big_boy_turning = false,
	use_navigation_path_splines = false,
	walk_speed = 3.5,
	infighting = InfightingSettings.boss,
	perception_weights = {
		aggro_decay_per_sec = 1,
		distance_weight = 100,
		max_distance = 50,
		old_target_aggro_mul = 1,
		target_catapulted_mul = 0.5,
		target_disabled_aggro_mul = 0.1,
		target_disabled_mul = 0.15,
		target_outside_navmesh_mul = 0.5,
		target_staggered_you_bonus = 100,
		target_stickyness_bonus_a = 75,
		target_stickyness_bonus_b = 10,
		target_stickyness_duration_a = 5,
		target_stickyness_duration_b = 20,
		targeted_by_other_special = -10,
	},
	max_health = BreedTweaks.max_health.chaos_spawn,
	bloodlust_health = BreedTweaks.bloodlust_health.monster,
	stagger_duration = {
		0,
		0,
		0,
		0,
		0,
		1.5,
		0,
		1,
	},
	status_effect_settings = {
		category = "large",
		ignored_statuses = table.set({
			StatusEffectNames.burning_warpfire,
			StatusEffectNames.poisoned,
		}),
	},
	debug_color = {
		255,
		20,
		20,
		20,
	},
	run_on_spawn = AiBreedSnippets.on_chaos_spawn_spawn,
	run_on_death = AiBreedSnippets.on_chaos_spawn_death,
	run_on_despawn = AiBreedSnippets.on_chaos_spawn_despawn,
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
				"c_neck2",
			},
			push_actors = {
				"j_head",
				"j_spine1",
			},
		},
		torso = {
			prio = 2,
			actors = {
				"c_spine1",
				"c_spine",
				"c_hips",
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
				"j_leftarm",
				"j_leftforearm",
				"j_lefthand",
			},
		},
		left_tentacle = {
			prio = 3,
			actors = {
				"c_leftfinger1_jnt",
				"c_leftfinger2_jnt",
				"c_leftfinger3_jnt",
				"c_leftfinger4_jnt",
				"c_leftfinger5_jnt",
			},
			push_actors = {
				"j_leftfinger1_jnt",
				"j_leftfinger2_jnt",
				"j_leftfinger3_jnt",
				"j_leftfinger4_jnt",
				"j_leftfinger5_jnt",
			},
		},
		right_arm = {
			prio = 3,
			actors = {
				"c_rightarm",
				"c_rightforearm",
				"c_righthand",
				"c_righthandthumb1",
				"c_rightinhandindex",
				"c_rightinhandmiddle",
				"c_rightinhandpinky",
				"c_righthandthumb2",
				"c_righthandindex1",
				"c_righthandmiddle1",
				"c_righthandpinky1",
				"c_righthandmiddle2",
				"c_righthandindex2",
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
			},
			push_actors = {
				"j_rightupleg",
				"j_rightleg",
				"j_rightfoot",
			},
		},
		aux = {
			prio = 3,
			actors = {
				"c_leftarmA",
				"c_leftforearmA",
				"c_lefthandA",
				"c_leftarmB",
				"c_leftforearmB",
				"c_lefthandB",
				"c_smallTentacleA1",
				"c_smallTentacleA2",
				"c_smallTentacleA3",
				"c_smallTentacleA4",
				"c_smallTentacleB1",
				"c_smallTentacleB2",
				"c_smallTentacleB3",
				"c_smallTentacleB4",
				"c_smallTentacleC1",
				"c_smallTentacleC2",
				"c_smallTentacleC3",
				"c_smallTentacleC4",
				"c_smallTentacleD1",
				"c_smallTentacleD2",
				"c_smallTentacleD3",
				"c_smallTentacleD4",
				"c_smallTentacleE1",
				"c_smallTentacleE2",
				"c_smallTentacleE3",
				"c_smallTentacleE4",
				"c_tentacleB1",
				"c_tentacleB2",
				"c_tentacleB3",
				"c_tentacleB4",
				"c_tentacleB5",
				"c_tentacleC1",
				"c_tentacleC2",
				"c_tentacleC3",
				"c_tentacleC4",
				"c_tentacleC5",
				"c_tentacleD1",
				"c_tentacleD2",
				"c_tentacleD3",
				"c_tentacleD4",
			},
			push_actors = {
				"j_spine1",
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

		QuestSettings.check_chaos_spawn_killed_while_grabbing(blackboard, killer_unit)
		QuestSettings.check_chaos_spawn_killed_without_having_grabbed(blackboard, killer_unit)
	end,
}

Breeds.chaos_spawn = table.create_copy(Breeds.chaos_spawn, breed_data)

local breed_data_norsca = {
	combat_music_state = "champion_chaos_exalted_norsca",
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

Breeds.chaos_spawn_exalted_champion_norsca = table.create_copy(Breeds.chaos_spawn_exalted_champion_norsca, breed_data_norsca)
Breeds.chaos_spawn_exalted_champion_norsca.is_always_spawnable = nil

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
		versus_base = {
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
		versus_base = {
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
		versus_base = {
			normal = 1,
		},
	},
}
local action_data = {
	climb = {
		catapult_players = {
			collision_filter = "filter_player_hit_box_check",
			radius = 2,
			speed = 7,
			angle = math.pi / 6,
		},
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
		considerations = UtilityConsiderations.chaos_spawn_combo,
		attacks = {
			{
				anim_driven = true,
				attack_time = 2.5,
				damage_done_time = 1.5666666666666667,
				height = 2.5,
				hit_multiple_targets = true,
				ignores_dodging = true,
				offset_forward = 1.5,
				offset_up = 0,
				player_push_speed = 7,
				player_push_speed_blocked = 7,
				push_close_units_during_attack = true,
				range = 2.5,
				rotation_speed = 2.5,
				rotation_time = 2,
				width = 1.5,
				attack_anim = {
					"attack_melee_combo",
				},
				push_units_in_the_way = pushed_data,
				bot_threats = {
					{
						duration = 0.3333333333333333,
						range = 3.5,
						start_time = 0,
					},
					{
						duration = 0.3333333333333333,
						range = 3.5,
						start_time = 0.4,
					},
					{
						duration = 0.3333333333333333,
						range = 3.5,
						start_time = 0.8333333333333334,
					},
					{
						duration = 0.3333333333333333,
						range = 3.5,
						start_time = 1.2333333333333334,
					},
				},
			},
			{
				anim_driven = true,
				attack_time = 2.5,
				damage_done_time = 1.9333333333333333,
				height = 2.5,
				hit_multiple_targets = true,
				ignores_dodging = true,
				offset_forward = 1.5,
				offset_up = 0,
				player_push_speed = 9,
				player_push_speed_blocked = 9,
				push_close_units_during_attack = true,
				range = 2.5,
				rotation_speed = 5,
				rotation_time = 1.5,
				width = 1.5,
				attack_anim = {
					"attack_melee_combo_2",
				},
				push_units_in_the_way = pushed_data,
				bot_threats = {
					{
						duration = 0.3333333333333333,
						range = 3.5,
						start_time = 0.2,
					},
					{
						duration = 0.3333333333333333,
						range = 3.5,
						start_time = 0.9333333333333333,
					},
					{
						duration = 0.3333333333333333,
						range = 3.5,
						start_time = 1.5666666666666667,
					},
				},
			},
		},
		difficulty_damage = BreedTweaks.difficulty_damage.boss_combo_attack,
	},
	melee_slam = {
		action_weight = 1,
		attack_intensity_type = "melee_slam",
		attack_time = 1.1666666666666667,
		blocked_damage = 5,
		cooldown = -1,
		damage = 20,
		damage_type = "cutting",
		dodge_mitigation_radius_squared = 2.25,
		fatigue_type = "blocked_slam",
		forward_offset = 1.75,
		height = 2.5,
		player_push_speed = 8,
		player_push_speed_blocked = 4,
		radius = 1.2,
		stagger_distance = 7,
		unblockable = false,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.chaos_spawn_melee_slam,
		attack_anim = {
			"attack_melee_claw",
		},
		blocked_difficulty_damage = BreedTweaks.difficulty_damage.boss_slam_attack_blocked,
		difficulty_damage = BreedTweaks.difficulty_damage.boss_slam_attack,
		stagger_impact = {
			stagger_types.weak,
			stagger_types.medium,
			stagger_types.none,
			stagger_types.none,
		},
		bot_threats = {
			{
				duration = 0.3333333333333333,
				start_time = 0.16666666666666666,
			},
		},
	},
	melee_shove = {
		action_weight = 1,
		allow_friendly_fire = true,
		attack_intensity_type = "shove",
		damage = 20,
		damage_type = "cutting",
		fatigue_type = "ogre_shove",
		ignore_ai_damage = true,
		difficulty_attack_intensity = AttackIntensityPerDifficulty,
		considerations = UtilityConsiderations.spawn_melee_shove,
		attacks = {
			{
				anim_driven = false,
				attack_time = 2,
				catapult_player = true,
				damage_done_time = 1.2666666666666666,
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
					"attack_melee_sweep",
				},
				continious_overlap = {
					attack_melee_sweep = {
						base_node_name = "j_leftforearm",
						start_time = 0.9333333333333333,
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
					{
						collision_type = "cylinder",
						duration = 0.9333333333333333,
						height = 4,
						offset_forward = 0,
						offset_right = 0,
						offset_up = 0,
						radius = 4.5,
						start_time = 0.3333333333333333,
					},
				},
			},
		},
		difficulty_damage = BreedTweaks.difficulty_damage.boss_slam_attack,
	},
	attack_grabbed_smash = {
		action_weight = 1,
		allow_friendly_fire = true,
		damage = 20,
		damage_type = "cutting",
		fatigue_type = "ogre_shove",
		ignore_ai_damage = true,
		considerations = UtilityConsiderations.attack_grabbed_smash,
		attacks = {
			{
				anim_driven = false,
				attack_time = 1.8,
				catapult_player = false,
				freeze_intensity_decay_time = 15,
				height = 2,
				hit_multiple_targets = true,
				hit_only_players = false,
				ignore_targets_behind = true,
				ignores_dodging = false,
				offset_forward = 0,
				offset_up = 0,
				player_push_speed = 5,
				player_push_speed_blocked = 2.6,
				player_push_speed_blocked_z = 4,
				player_push_speed_z = 4,
				range = 2,
				rotation_time = 0.3,
				width = 0.4,
				attack_anim = {
					"attack_grabbed_smash",
				},
				continious_overlap = {
					attack_grabbed_smash = {
						base_node_name = "j_leftforearm",
						start_time = 0.3333333333333333,
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
				bot_threats = {
					{
						collision_type = "cylinder",
						duration = 1.8,
						height = 5,
						offset_forward = 0,
						offset_right = 0,
						offset_up = 0,
						radius = 3.5,
						start_time = 0,
					},
				},
			},
		},
		difficulty_damage = {
			cataclysm = 32,
			cataclysm_2 = 40,
			cataclysm_3 = 50,
			easy = 3,
			hard = 8,
			harder = 15,
			hardest = 25,
			normal = 5,
			versus_base = 5,
		},
	},
	attack_grabbed_throw = {
		action_weight = 1,
		considerations = UtilityConsiderations.attack_grabbed_throw,
	},
	attack_grabbed_chew = {
		action_weight = 1,
		damage = 15,
		damage_type = "cutting",
		max_chew_attacks = 3,
		considerations = UtilityConsiderations.attack_grabbed_chew,
		difficulty_damage = {
			cataclysm = 32,
			cataclysm_2 = 40,
			cataclysm_3 = 50,
			easy = 3,
			hard = 8,
			harder = 15,
			hardest = 25,
			normal = 5,
			versus_base = 5,
		},
		health_leech_multiplier = {
			cataclysm = 12.5,
			cataclysm_2 = 11.25,
			cataclysm_3 = 10,
			easy = 3.33,
			hard = 12.5,
			harder = 13.33,
			hardest = 12,
			normal = 2,
			versus_base = 2,
		},
	},
	tentacle_grab = {
		action_weight = 6,
		allow_friendly_fire = true,
		damage = 20,
		damage_type = "cutting",
		fatigue_type = "ogre_shove",
		ignore_ai_damage = true,
		ignore_shield_block = true,
		considerations = UtilityConsiderations.chaos_spawn_tentacle_grab,
		attacks = {
			{
				anim_driven = false,
				attack_time = 1.75,
				catapult_player = false,
				damage_done_time = 1,
				freeze_intensity_decay_time = 15,
				height = 2,
				hit_multiple_targets = false,
				hit_only_players = true,
				ignore_targets_behind = true,
				ignores_dodging = false,
				offset_forward = 0,
				offset_up = 0,
				range = 2,
				rotation_time = 0.3,
				width = 0.4,
				attack_anim = {
					"attack_grab",
				},
				hit_player_func = function (unit, blackboard, hit_unit, action, attack)
					local status_extension = ScriptUnit.has_extension(hit_unit, "status_system")

					if not status_extension:is_disabled() and not status_extension:is_invisible() then
						blackboard.victim_grabbed = hit_unit
						blackboard.has_grabbed = true

						local network_manager = Managers.state.network

						network_manager:anim_event(unit, "attack_grab_player")
						StatusUtils.set_grabbed_by_chaos_spawn_network(hit_unit, true, unit)

						blackboard.grabbed_time = 0
						blackboard.grabbed_state = "tentacle_grab"
					end
				end,
				continious_overlap = {
					attack_grab = {
						base_node_name = "j_leftforearm",
						start_time = 0.6666666666666666,
						tip_node_name = "j_lefthand",
					},
				},
				bot_threat_difficulty_data = default_bot_threat_difficulty_data,
				bot_threats = {
					{
						collision_type = "cylinder",
						duration = 0.8333333333333334,
						height = 4,
						offset_forward = 0,
						offset_right = 0,
						offset_up = 0,
						radius = 4.5,
						start_time = 0.16666666666666666,
					},
				},
			},
		},
		difficulty_damage = {
			cataclysm = 10,
			cataclysm_2 = 10,
			cataclysm_3 = 10,
			easy = 3,
			hard = 6,
			harder = 7,
			hardest = 8,
			normal = 5,
			versus_base = 5,
		},
	},
	erratic_follow = {
		action_weight = 1,
		enter_catch_up_dist_sq = 1600,
		enter_walk_dist_sq = 4,
		jump_dist = 10,
		leave_walk_dist_sq = 9,
		move_anim = "move_fwd",
		uses_high_jumps = true,
		walk_anim = "walk_fwd",
		considerations = UtilityConsiderations.follow,
		start_anims_name = {
			bwd = "move_start_bwd",
			fwd = "move_start_fwd",
			left = "move_start_left",
			right = "move_start_right",
		},
		walk_start_anims_name = {
			bwd = "walk_start_bwd",
			fwd = "walk_start_fwd",
			left = "walk_start_left",
			right = "walk_start_right",
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
		move_jump_left_anims = {
			ray_angle = math.pi * 0.25,
			{
				"move_jump_left_45",
				ray_angle = 0,
				ray_dist = 5,
			},
			{
				"move_jump_left_45_turn_right_45",
				ray_dist = 5,
				ray_angle = -math.pi * 0.25,
			},
			{
				"move_jump_left_45_turn_right_90",
				ray_dist = 5,
				ray_angle = -math.pi * 0.5,
			},
			name = "move_jump_left_anims",
			ray_dist = 8,
		},
		move_jump_right_anims = {
			ray_angle = -math.pi * 0.25,
			{
				"move_jump_right_45",
				ray_angle = 0,
				ray_dist = 5,
			},
			{
				"move_jump_right_45_turn_left_45",
				ray_dist = 5,
				ray_angle = math.pi * 0.25,
			},
			{
				"move_jump_right_45_turn_left_90",
				ray_dist = 5,
				ray_angle = math.pi * 0.5,
			},
			name = "move_jump_right_anims",
			ray_dist = 8,
		},
		move_jump_fwd_anims = {
			{
				"move_jump_fwd",
				ray_angle = 0,
				ray_dist = 5,
			},
			{
				"move_jump_fwd_turn_left_45",
				ray_dist = 5,
				ray_angle = math.pi * 0.25,
			},
			{
				"move_jump_fwd_turn_left_90",
				ray_dist = 5,
				ray_angle = math.pi * 0.5,
			},
			{
				"move_jump_fwd_turn_right_45",
				ray_dist = 5,
				ray_angle = -math.pi * 0.25,
			},
			{
				"move_jump_fwd_turn_right_90",
				ray_dist = 5,
				ray_angle = -math.pi * 0.5,
			},
			name = "move_jump_fwd_anims",
			ray_angle = 0,
			ray_dist = 8,
		},
		move_jump_only_left_anims = {
			ray_angle = math.pi * 0.25,
			{
				"move_jump_left_45",
				ray_angle = 0,
				ray_dist = 5,
			},
			{
				"move_jump_left_90",
				ray_angle = 0,
				ray_dist = 5,
			},
			ray_dist = 8,
		},
		move_jump_only_fwd_left_anims = {
			{
				"move_jump_fwd_turn_left_45",
				ray_dist = 5,
				ray_angle = math.pi * 0.25,
			},
			{
				"move_jump_fwd_turn_left_90",
				ray_dist = 5,
				ray_angle = math.pi * 0.5,
			},
			ray_angle = 0,
			ray_dist = 8,
		},
		move_jump_only_right_anims = {
			ray_angle = -math.pi * 0.25,
			{
				"move_jump_right_45",
				ray_angle = 0,
				ray_dist = 5,
			},
			{
				"move_jump_right_90",
				ray_angle = 0,
				ray_dist = 5,
			},
			ray_dist = 8,
		},
		move_jump_only_fwd_right_anims = {
			{
				"move_jump_fwd_turn_right_45",
				ray_dist = 5,
				ray_angle = -math.pi * 0.25,
			},
			{
				"move_jump_fwd_turn_right_90",
				ray_dist = 5,
				ray_angle = -math.pi * 0.5,
			},
			ray_angle = 0,
			ray_dist = 8,
		},
	},
	smash_door = {
		attack_anim = "attack_melee_claw",
		damage = 25,
		damage_type = "cutting",
		door_attack_distance = 2,
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
		close_anims_dist = 16,
		close_rage_time = 1,
		rage_time = 3,
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
		close_anims_name = {
			bwd = "turn_bwd",
			left = "turn_left",
			right = "turn_right",
		},
		close_anims_data = {
			turn_bwd = {
				dir = -1,
				rad = math.pi,
			},
			turn_left = {
				dir = 1,
				rad = math.pi / 2,
			},
			turn_right = {
				dir = -1,
				rad = math.pi / 2,
			},
		},
	},
	target_unreachable = {
		move_anim = "move_start_fwd",
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
}

BreedActions.chaos_spawn = table.create_copy(BreedActions.chaos_spawn, action_data)

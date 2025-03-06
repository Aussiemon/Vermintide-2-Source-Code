-- chunkname: @scripts/settings/breeds/breed_chaos_mutator_sorcerer.lua

local breed_data = {
	animation_sync_rpc = "rpc_sync_anim_state_8",
	aoe_height = 2.1,
	aoe_radius = 0.7,
	armor_category = 1,
	awards_positive_reinforcement_message = true,
	base_unit = "units/beings/enemies/chaos_mutator_sorcerer/chr_chaos_mutator_sorcerer",
	behavior = "chaos_mutator_sorcerer",
	bone_lod_level = 1,
	bot_hitbox_radius_approximation = 0.8,
	death_reaction = "ai_default",
	debug_spawn_category = "Misc",
	default_inventory_template = "chaos_mutator_sorcerer",
	detection_radius = 9999999,
	dialogue_source_name = "chaos_corruptor_sorcerer",
	disable_second_hit_ragdoll = true,
	exchange_order = 2,
	far_off_despawn_immunity = true,
	flingable = true,
	has_inventory = true,
	headshot_coop_stamina_fatigue_type = "headshot_special",
	height = 2.4,
	hit_effect_template = "HitEffectsDummySorcerer",
	hit_mass_count = 8,
	hit_reaction = "ai_default",
	ignore_bot_opportunity = true,
	initial_is_passive = false,
	is_bot_aid_threat = true,
	is_of_interest_func = "is_of_interest_to_corruptor",
	minion_detection_radius = 10,
	navigation_spline_distance_to_borders = 1,
	no_stagger_duration = false,
	perception = "perception_pack_master",
	player_locomotion_constrain_radius = 0.7,
	poison_resistance = 100,
	proximity_system_check = true,
	race = "chaos",
	radius = 1,
	run_speed = 4.8,
	smart_object_template = "special",
	smart_targeting_height_multiplier = 2.2,
	smart_targeting_outer_width = 0.7,
	smart_targeting_width = 0.3,
	special = true,
	stagger_resistance = 3,
	stagger_threshold_light = 0.5,
	target_selection = "pick_mutator_sorcerer_target",
	threat_value = 0,
	unit_template = "ai_unit_chaos_corruptor_sorcerer",
	use_navigation_path_splines = true,
	vortexable = false,
	walk_speed = 2.3,
	weapon_reach = 15,
	wield_inventory_on_spawn = false,
	infighting = InfightingSettings.small,
	max_health = {
		30,
		30,
		40,
		60,
		90,
		90,
		90,
		90,
	},
	bloodlust_health = BreedTweaks.bloodlust_health.chaos_special,
	stagger_duration = {
		3,
		3,
		3,
		3,
		3,
		3,
		3,
		3,
	},
	diff_stagger_resist = BreedTweaks.diff_stagger_resist.sorcerer,
	hit_mass_counts = BreedTweaks.hit_mass_counts.sorcerer,
	hitzone_multiplier_types = {
		head = "headshot",
	},
	run_on_spawn = AiBreedSnippets.on_chaos_sorcerer_spawn,
	status_effect_settings = {
		category = "medium",
		ignored_statuses = table.set({
			StatusEffectNames.burning,
			StatusEffectNames.burning_warpfire,
			StatusEffectNames.poisoned,
		}),
	},
	target_player_sound_events = {
		bright_wizard = "chaos_sorcerer_plague_targeting_wizard",
		dwarf_ranger = "chaos_sorcerer_plague_targeting_dwarf",
		empire_soldier = "chaos_sorcerer_plague_targeting_soldier",
		witch_hunter = "chaos_sorcerer_plague_targeting_saltspyre",
		wood_elf = "chaos_sorcerer_plague_targeting_elf",
	},
	debug_color = {
		255,
		200,
		200,
		0,
	},
	disabled = Development.setting("disable_plague_sorcerer") or false,
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
		destructible_wall = 5,
		doors = 1.5,
		fire_grenade = 10,
		jumps = 5,
		ledges = 5,
		ledges_with_fence = 5,
		planks = 1.5,
		teleporters = 5,
		temporary_wall = 0,
	},
}

Breeds.chaos_mutator_sorcerer = table.create_copy(Breeds.chaos_mutator_sorcerer, breed_data)

local action_data = {
	idle = {
		idle_animation = "float_into",
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true,
		},
	},
	follow = {
		catchup_distance = 20,
		catchup_speed = 8,
		distance_to_attack = 3,
		fast_move_speed = 4,
		fast_move_speed_sound_event = "Play_enemy_mutator_chaos_sorcerer_wind_loop",
		hunting_sound_distance = 15,
		hunting_sound_event = "Play_enemy_mutator_chaos_sorcerer_hunting_loop",
		infront_movement_multiplier = 2,
		move_animation = "float_fwd",
		skulking_sound_event = "Play_enemy_mutator_chaos_sorcerer_skulking_loop",
		slow_down_on_look_at = true,
		slow_move_speed = 0.65,
		stop_fast_move_speed_sound_event = "Stop_enemy_mutator_chaos_sorcerer_wind_loop",
		stop_hunting_sound_event = "Stop_enemy_mutator_chaos_sorcerer_hunting_loop",
		stop_skulking_sound_event = "Stop_enemy_mutator_chaos_sorcerer_skulking_loop",
		start_anims_name = {
			bwd = "float_start_bwd",
			fwd = "float_start_fwd",
			left = "float_start_left",
			right = "float_start_right",
		},
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true,
		},
	},
	grab_attack = {
		attack_anim = "attack_dementor_start",
		cooldown = 4,
		damage = 5,
		damage_type = "pack_master_grab",
		dodge_angle = 3.5,
		dodge_distance = 1.25,
		drag_in_anim = "attack_dementor_drag_in",
		drain_life_tick_rate = 1,
		fatigue_type = "blocked_attack",
		ignore_dodge = true,
		max_distance_squared = 144,
		min_dodge_angle_squared = 4,
		projectile_radius = 2,
		unblockable = true,
		disable_player_time = math.huge,
		difficulty_damage = {
			cataclysm = 22,
			cataclysm_2 = 22,
			cataclysm_3 = 22,
			easy = 3,
			hard = 8,
			harder = 12,
			hardest = 18,
			normal = 5,
		},
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true,
		},
	},
	smash_door = {
		door_attack_distance = 1,
		move_speed = 3.75,
		rotation_speed = 0,
	},
	quick_teleport = {
		teleport_effect = "fx/chr_chaos_sorcerer_teleport",
		teleport_effect_trail = "fx/chr_chaos_sorcerer_teleport_direction",
		teleport_end_anim = "teleport_end",
		teleport_start_anim = "teleport_start",
		teleport_pos_func = function (unit, blackboard)
			local conflict_director = Managers.state.conflict
			local wanted_teleport_distance_in_main_path = math.max(conflict_director.main_path_info.ahead_travel_dist - 40, 0)
			local wanted_teleport_position = MainPathUtils.point_on_mainpath(nil, wanted_teleport_distance_in_main_path)

			return wanted_teleport_position
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
	stagger = {
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true,
		},
		custom_enter_function = function (unit, blackboard, t, action)
			local stagger_anims

			blackboard.stagger_ignore_anim_cb = true

			if blackboard.corruptor_grab_stagger then
				stagger_anims = action.grabbing_stagger_anims[blackboard.stagger_type]
				blackboard.stagger_time = t + 1
			else
				stagger_anims = action.stagger_anims[blackboard.stagger_type]
			end

			return stagger_anims, "idle"
		end,
		custom_exit_function = function (unit, blackboard, t)
			blackboard.corruptor_grab_stagger = nil
		end,
		stagger_anims = {
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
				right = {
					"stagger_left_exp",
				},
				left = {
					"stagger_right_exp",
				},
			},
		},
		grabbing_stagger_anims = {
			{
				fwd = {
					"stagger_fwd_light_dementor",
				},
				bwd = {
					"stagger_bwd_light_dementor",
				},
				right = {
					"stagger_left_light_dementor",
				},
				left = {
					"stagger_right_light_dementor",
				},
			},
			{
				fwd = {
					"stagger_fwd_dementor",
				},
				bwd = {
					"stagger_bwd_dementor",
				},
				right = {
					"stagger_left_dementor",
				},
				left = {
					"stagger_right_dementor",
				},
			},
			{
				fwd = {
					"stagger_fwd_dementor",
				},
				bwd = {
					"stagger_bwd_dementor",
				},
				right = {
					"stagger_left_dementor",
				},
				left = {
					"stagger_right_dementor",
				},
			},
			{
				fwd = {
					"stagger_fwd_light_dementor",
				},
				bwd = {
					"stagger_bwd_light_dementor",
				},
				right = {
					"stagger_left_light_dementor",
				},
				left = {
					"stagger_right_light_dementor",
				},
			},
			{
				fwd = {
					"stagger_fwd_light_dementor",
				},
				bwd = {
					"stagger_bwd_light_dementor",
				},
				right = {
					"stagger_left_light_dementor",
				},
				left = {
					"stagger_right_light_dementor",
				},
			},
			{
				fwd = {
					"stagger_fwd_dementor",
				},
				bwd = {
					"stagger_bwd_dementor",
				},
				right = {
					"stagger_left_dementor",
				},
				left = {
					"stagger_right_dementor",
				},
			},
			{
				fwd = {
					"stagger_fwd_dementor",
				},
				bwd = {
					"stagger_bwd_dementor",
				},
				right = {
					"stagger_left_dementor",
				},
				left = {
					"stagger_right_dementor",
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
					"stagger_fwd_dementor",
				},
				bwd = {
					"stagger_bwd_dementor",
				},
				right = {
					"stagger_left_dementor",
				},
				left = {
					"stagger_right_dementor",
				},
			},
		},
	},
}

BreedActions.chaos_mutator_sorcerer = table.create_copy(BreedActions.chaos_mutator_sorcerer, action_data)

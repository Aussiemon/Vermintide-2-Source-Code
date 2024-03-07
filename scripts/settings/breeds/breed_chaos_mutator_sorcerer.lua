-- chunkname: @scripts/settings/breeds/breed_chaos_mutator_sorcerer.lua

local breed_data = {
	animation_sync_rpc = "rpc_sync_anim_state_8",
	armor_category = 1,
	base_unit = "units/beings/enemies/chaos_mutator_sorcerer/chr_chaos_mutator_sorcerer",
	behavior = "chaos_mutator_sorcerer",
	debug_spawn_category = "Misc",
	default_inventory_template = "chaos_mutator_sorcerer",
	dialogue_source_name = "chaos_corruptor_sorcerer",
	far_off_despawn_immunity = true,
	has_inventory = true,
	height = 2.4,
	hit_effect_template = "HitEffectsDummySorcerer",
	ignore_bot_opportunity = true,
	is_of_interest_func = "is_of_interest_to_corruptor",
	navigation_spline_distance_to_borders = 1,
	no_stagger_duration = false,
	perception = "perception_pack_master",
	perception_continuous = "SET_TO_NIL",
	race = "chaos",
	run_speed = 4.8,
	stagger_resistance = 3,
	stagger_threshold_light = 0.5,
	target_selection = "pick_mutator_sorcerer_target",
	threat_value = 0,
	unit_template = "ai_unit_chaos_corruptor_sorcerer",
	use_navigation_path_splines = true,
	walk_speed = 2.3,
	weapon_reach = 15,
	wield_inventory_on_spawn = false,
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
	hitzone_multiplier_types = {
		head = "headshot",
	},
	run_on_spawn = AiBreedSnippets.on_chaos_plague_sorcerer_spawn,
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
	disabled = Development.setting("disable_plague_sorcerer") or false,
}

for key, value in pairs(Breeds.chaos_tentacle_sorcerer) do
	local keep_value = breed_data[key]

	if keep_value == "SET_TO_NIL" then
		breed_data[key] = nil
	elseif keep_value ~= nil then
		breed_data[key] = keep_value
	else
		breed_data[key] = value
	end
end

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

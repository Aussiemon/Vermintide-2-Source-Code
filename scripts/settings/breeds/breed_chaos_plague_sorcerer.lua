-- chunkname: @scripts/settings/breeds/breed_chaos_plague_sorcerer.lua

local breed_data = {
	animation_sync_rpc = "rpc_sync_anim_state_8",
	armor_category = 1,
	base_unit = "units/beings/enemies/chaos_sorcerer/chr_chaos_sorcerer",
	behavior = "chaos_plague_sorcerer",
	death_sound_event = "chaos_sorcerer_plague_death",
	debug_spawn_category = "Misc",
	dialogue_source_name = "chaos_plague_sorcerer",
	is_of_interest_func = "is_of_interest_plague_wave_sorcerer",
	no_stagger_duration = true,
	no_summon_sound_for_target = true,
	race = "chaos",
	stagger_resistance = 3,
	stagger_threshold_explosion = 5,
	stagger_threshold_heavy = 3,
	stagger_threshold_light = 0.5,
	stagger_threshold_medium = 2,
	summon_sound_event = "chaos_sorcerer_plague_summoning",
	target_selection = "pick_closest_target_with_filter",
	max_health = {
		25,
		25,
		37.5,
		50,
		75,
		75,
		75,
		75,
	},
	bloodlust_health = BreedTweaks.bloodlust_health.chaos_special,
	stagger_duration = {
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
	},
	stagger_reduction = BreedTweaks.stagger_reduction.sorcerer,
	diff_stagger_resist = BreedTweaks.diff_stagger_resist.sorcerer,
	run_on_spawn = AiBreedSnippets.on_chaos_plague_sorcerer_spawn,
	status_effect_settings = {
		category = "medium",
		ignored_statuses = table.set({
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

Breeds.chaos_plague_sorcerer = table.create_copy(Breeds.chaos_plague_sorcerer, breed_data)

local action_data = {
	skulk_approach = {
		close_distance = 20,
		far_away_from_target_sq = 400,
		max_wave_distance = 25,
		min_wave_distance = 13,
		move_animation = "move_fwd",
		part_hp_lost_to_teleport = 0.1,
		plague_wave_spawn_timer = 2,
		preferred_distance = 20,
		third_wave_max_distance = 7,
		third_wave_min_distance = 1,
		vanish_countdown = 3,
		vanish_timer = 2,
		teleport_cooldown = {
			7,
			10,
		},
	},
	spawn_plague_wave = {
		attack_anim = "attack_wave_summon_start",
		cleanup_func_name = "clean_up_plague_wave",
		init_func_name = "init_summon_plague_wave",
		max_wave_to_target_dist = 5,
		spawn_func_name = "spawn_plague_wave",
		update_func_name = "update_summon_plague_wave",
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true,
		},
	},
	quick_teleport = {
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

BreedActions.chaos_plague_sorcerer = table.create_copy(BreedActions.chaos_plague_sorcerer, action_data)

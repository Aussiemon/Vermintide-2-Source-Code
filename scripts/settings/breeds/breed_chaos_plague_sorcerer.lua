local breed_data = {
	stagger_resistance = 3,
	target_selection = "pick_closest_target_with_filter",
	summon_sound_event = "chaos_sorcerer_plague_summoning",
	no_stagger_duration = true,
	armor_category = 1,
	race = "chaos",
	animation_sync_rpc = "rpc_sync_anim_state_8",
	stagger_threshold_heavy = 3,
	stagger_threshold_explosion = 5,
	stagger_threshold_medium = 2,
	debug_spawn_category = "Misc",
	stagger_threshold_light = 0.5,
	death_sound_event = "chaos_sorcerer_plague_death",
	is_of_interest_func = "is_of_interest_plague_wave_sorcerer",
	behavior = "chaos_plague_sorcerer",
	base_unit = "units/beings/enemies/chaos_sorcerer/chr_chaos_sorcerer",
	dialogue_source_name = "chaos_plague_sorcerer",
	no_summon_sound_for_target = true,
	max_health = {
		25,
		25,
		37.5,
		50,
		75,
		75,
		75,
		75
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
		1
	},
	stagger_reduction = BreedTweaks.stagger_reduction.sorcerer,
	diff_stagger_resist = BreedTweaks.diff_stagger_resist.sorcerer,
	run_on_spawn = AiBreedSnippets.on_chaos_plague_sorcerer_spawn,
	target_player_sound_events = {
		witch_hunter = "chaos_sorcerer_plague_targeting_saltspyre",
		empire_soldier = "chaos_sorcerer_plague_targeting_soldier",
		dwarf_ranger = "chaos_sorcerer_plague_targeting_dwarf",
		wood_elf = "chaos_sorcerer_plague_targeting_elf",
		bright_wizard = "chaos_sorcerer_plague_targeting_wizard"
	},
	disabled = Development.setting("disable_plague_sorcerer") or false
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
		far_away_from_target_sq = 400,
		move_animation = "move_fwd",
		close_distance = 20,
		part_hp_lost_to_teleport = 0.1,
		plague_wave_spawn_timer = 2,
		max_wave_distance = 25,
		third_wave_max_distance = 7,
		vanish_timer = 2,
		vanish_countdown = 3,
		min_wave_distance = 13,
		third_wave_min_distance = 1,
		preferred_distance = 20,
		teleport_cooldown = {
			7,
			10
		}
	},
	spawn_plague_wave = {
		cleanup_func_name = "clean_up_plague_wave",
		max_wave_to_target_dist = 5,
		spawn_func_name = "spawn_plague_wave",
		init_func_name = "init_summon_plague_wave",
		update_func_name = "update_summon_plague_wave",
		attack_anim = "attack_wave_summon_start",
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true
		}
	},
	quick_teleport = {
		teleport_effect = "fx/chr_chaos_sorcerer_teleport",
		teleport_end_anim = "teleport_end",
		teleport_effect_trail = "fx/chr_chaos_sorcerer_teleport_direction",
		teleport_start_anim = "teleport_start",
		ignore_staggers = {
			true,
			true,
			true,
			true,
			true,
			true
		}
	}
}
action_data.stagger = {
	custom_enter_function = function (unit, blackboard, t, action)
		blackboard.stagger_ignore_anim_cb = true
		local stagger_anims = action.stagger_anims[blackboard.stagger_type]

		return stagger_anims, "idle"
	end,
	stagger_anims = {
		{
			fwd = {
				"stagger_fwd_light"
			},
			bwd = {
				"stagger_bwd_light"
			},
			right = {
				"stagger_left_light"
			},
			left = {
				"stagger_right_light"
			}
		},
		{
			fwd = {
				"stagger_fwd"
			},
			bwd = {
				"stagger_bwd"
			},
			right = {
				"stagger_left"
			},
			left = {
				"stagger_right"
			}
		},
		{
			fwd = {
				"stagger_fwd"
			},
			bwd = {
				"stagger_bwd"
			},
			right = {
				"stagger_left"
			},
			left = {
				"stagger_right"
			}
		},
		{
			fwd = {
				"stagger_fwd_light"
			},
			bwd = {
				"stagger_bwd_light"
			},
			right = {
				"stagger_left_light"
			},
			left = {
				"stagger_right_light"
			}
		},
		{
			fwd = {
				"stagger_fwd_light"
			},
			bwd = {
				"stagger_bwd_light"
			},
			right = {
				"stagger_left_light"
			},
			left = {
				"stagger_right_light"
			}
		},
		{
			fwd = {
				"stagger_fwd_exp"
			},
			bwd = {
				"stagger_bwd_exp"
			},
			right = {
				"stagger_left_exp"
			},
			left = {
				"stagger_right_exp"
			}
		},
		{
			fwd = {
				"stagger_fwd"
			},
			bwd = {
				"stagger_bwd"
			},
			right = {
				"stagger_left"
			},
			left = {
				"stagger_right"
			}
		},
		{
			fwd = {},
			bwd = {},
			left = {},
			right = {}
		},
		{
			fwd = {
				"stagger_fwd"
			},
			bwd = {
				"stagger_bwd"
			},
			right = {
				"stagger_left"
			},
			left = {
				"stagger_right"
			}
		}
	}
}
BreedActions.chaos_plague_sorcerer = table.create_copy(BreedActions.chaos_plague_sorcerer, action_data)

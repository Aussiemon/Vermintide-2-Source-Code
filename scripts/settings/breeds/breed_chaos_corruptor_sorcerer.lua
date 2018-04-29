local breed_data = {
	stagger_resistance = 3,
	target_selection = "pick_corruptor_target",
	unit_template = "ai_unit_chaos_corruptor_sorcerer",
	no_stagger_duration = true,
	armor_category = 1,
	race = "chaos",
	death_sound_event = "chaos_sorcerer_plague_death",
	animation_sync_rpc = "rpc_sync_anim_state_8",
	perception = "perception_pack_master",
	stagger_threshold_light = 0.5,
	weapon_reach = 15,
	is_of_interest_func = "is_of_interest_to_corruptor",
	perception_continuous = "SET_TO_NIL",
	behavior = "chaos_corruptor_sorcerer",
	base_unit = "units/beings/enemies/chaos_sorcerer_corruptor/chr_chaos_sorcerer_corruptor",
	dialogue_source_name = "chaos_corruptor_sorcerer",
	max_health = {
		20,
		20,
		30,
		40,
		60
	},
	stagger_duration = {
		0.5,
		1,
		1,
		1,
		1,
		1,
		1,
		1
	},
	diff_stagger_resist = {
		3,
		3,
		4,
		5,
		5
	},
	hitzone_multiplier_types = {
		head = "headshot"
	},
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

Breeds.chaos_corruptor_sorcerer = table.create_copy(Breeds.chaos_corruptor_sorcerer, breed_data)
local action_data = {
	skulk_approach = {
		move_animation = "move_fwd",
		close_distance = 10,
		far_away_from_target_sq = 400,
		skulk_foreshadowing_sound_stop = "chaos_corruptor_spawning_stop",
		max_wave_distance = 8,
		third_wave_max_distance = 8,
		vanish_timer = 4,
		vanish_countdown = 4,
		min_wave_distance = 5,
		third_wave_min_distance = 3,
		part_hp_lost_to_teleport = 0.1,
		skulk_foreshadowing_sound = "chaos_corruptor_spawning",
		preferred_distance = 20,
		skulk_time = {
			1,
			3
		},
		teleport_cooldown = {
			15,
			15
		}
	},
	grab_attack = {
		fatigue_type = "blocked_attack",
		dodge_angle = 3.5,
		max_distance_squared = 144,
		cooldown = 4,
		min_dodge_angle_squared = 4,
		drain_life_tick_rate = 1,
		dodge_distance = 1.25,
		projectile_radius = 2,
		damage_type = "cutting",
		unblockable = true,
		drag_in_anim = "attack_dementor_drag_in",
		attack_anim = "attack_dementor_start",
		disable_player_time = math.huge,
		damage = {
			0,
			0
		},
		damage = {
			5,
			8,
			10
		},
		difficulty_damage = {
			easy = {
				3,
				3,
				3
			},
			normal = {
				5,
				5,
				5
			},
			hard = {
				8,
				8,
				8
			},
			survival_hard = {
				8,
				8,
				8
			},
			harder = {
				15,
				15,
				15
			},
			survival_harder = {
				15,
				15,
				15
			},
			hardest = {
				25,
				25,
				25
			},
			survival_hardest = {
				25,
				25,
				25
			}
		},
		health_leech = {
			harder = 10,
			normal = 2,
			hard = 5,
			survival_hard = 30,
			survival_harder = 40,
			hardest = 20,
			survival_hardest = 20,
			easy = 2
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
	},
	stagger = {
		custom_enter_function = function (unit, blackboard, t, action)
			local stagger_anims = nil
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

			return 
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
			}
		},
		grabbing_stagger_anims = {
			{
				fwd = {
					"stagger_fwd_light_dementor"
				},
				bwd = {
					"stagger_bwd_light_dementor"
				},
				right = {
					"stagger_left_light_dementor"
				},
				left = {
					"stagger_right_light_dementor"
				}
			},
			{
				fwd = {
					"stagger_fwd_dementor"
				},
				bwd = {
					"stagger_bwd_dementor"
				},
				right = {
					"stagger_left_dementor"
				},
				left = {
					"stagger_right_dementor"
				}
			},
			{
				fwd = {
					"stagger_fwd_dementor"
				},
				bwd = {
					"stagger_bwd_dementor"
				},
				right = {
					"stagger_left_dementor"
				},
				left = {
					"stagger_right_dementor"
				}
			},
			{
				fwd = {
					"stagger_fwd_light_dementor"
				},
				bwd = {
					"stagger_bwd_light_dementor"
				},
				right = {
					"stagger_left_light_dementor"
				},
				left = {
					"stagger_right_light_dementor"
				}
			},
			{
				fwd = {
					"stagger_fwd_light_dementor"
				},
				bwd = {
					"stagger_bwd_light_dementor"
				},
				right = {
					"stagger_left_light_dementor"
				},
				left = {
					"stagger_right_light_dementor"
				}
			},
			{
				fwd = {
					"stagger_fwd_dementor"
				},
				bwd = {
					"stagger_bwd_dementor"
				},
				right = {
					"stagger_left_dementor"
				},
				left = {
					"stagger_right_dementor"
				}
			},
			{
				fwd = {
					"stagger_fwd_dementor"
				},
				bwd = {
					"stagger_bwd_dementor"
				},
				right = {
					"stagger_left_dementor"
				},
				left = {
					"stagger_right_dementor"
				}
			}
		}
	}
}
BreedActions.chaos_corruptor_sorcerer = table.create_copy(BreedActions.chaos_corruptor_sorcerer, action_data)

return 

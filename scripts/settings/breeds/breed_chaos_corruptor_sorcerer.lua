local breed_data = {
	base_unit = "units/beings/enemies/chaos_sorcerer_corruptor/chr_chaos_sorcerer_corruptor",
	is_resurrectable = false,
	target_selection = "pick_corruptor_target",
	unit_template = "ai_unit_chaos_corruptor_sorcerer",
	no_stagger_duration = true,
	race = "chaos",
	animation_sync_rpc = "rpc_sync_anim_state_8",
	perception = "perception_pack_master",
	is_always_spawnable = true,
	controllable = true,
	debug_spawn_category = "Specials",
	death_sound_event = "chaos_sorcerer_corrupt_death",
	weapon_reach = 15,
	stagger_threshold_light = 0.5,
	is_of_interest_func = "is_of_interest_to_corruptor",
	perception_continuous = "SET_TO_NIL",
	behavior = "chaos_corruptor_sorcerer",
	dialogue_source_name = "chaos_corruptor_sorcerer",
	threat_value = 8,
	stagger_resistance = 3,
	armor_category = 1,
	max_health = BreedTweaks.max_health.corruptor_sorcerer,
	bloodlust_health = BreedTweaks.bloodlust_health.chaos_special,
	stagger_duration = BreedTweaks.stagger_duration.sorcerer,
	diff_stagger_resist = BreedTweaks.diff_stagger_resist.sorcerer,
	hitzone_multiplier_types = {
		head = "headshot"
	},
	hit_zones = {
		head = {
			prio = 1,
			actors = {
				"c_head"
			},
			push_actors = {
				"j_head",
				"j_spine1"
			}
		},
		neck = {
			prio = 1,
			actors = {
				"c_neck"
			},
			push_actors = {
				"j_head",
				"j_spine1"
			}
		},
		torso = {
			prio = 2,
			actors = {
				"c_hips",
				"c_spine",
				"c_spine1",
				"c_leftshoulder",
				"c_rightshoulder"
			},
			push_actors = {
				"j_spine1"
			}
		},
		left_arm = {
			prio = 3,
			actors = {
				"c_leftarm",
				"c_leftforearm",
				"c_lefthand"
			},
			push_actors = {
				"j_spine1"
			}
		},
		right_arm = {
			prio = 3,
			actors = {
				"c_rightarm",
				"c_rightforearm",
				"c_righthand"
			},
			push_actors = {
				"j_spine1"
			}
		},
		left_leg = {
			prio = 3,
			actors = {
				"c_leftupleg",
				"c_leftleg",
				"c_leftfoot",
				"c_lefttoebase"
			},
			push_actors = {
				"j_leftfoot",
				"j_rightfoot",
				"j_hips"
			}
		},
		right_leg = {
			prio = 3,
			actors = {
				"c_rightupleg",
				"c_rightleg",
				"c_rightfoot",
				"c_righttoebase"
			},
			push_actors = {
				"j_leftfoot",
				"j_rightfoot",
				"j_hips"
			}
		},
		full = {
			prio = 4,
			actors = {}
		},
		afro = {
			prio = 5,
			actors = {
				"h_afro"
			}
		}
	},
	run_on_spawn = AiBreedSnippets.on_chaos_plague_sorcerer_spawn,
	target_player_sound_events = {
		witch_hunter = "chaos_sorcerer_plague_targeting_saltspyre",
		empire_soldier = "chaos_sorcerer_plague_targeting_soldier",
		dwarf_ranger = "chaos_sorcerer_plague_targeting_dwarf",
		wood_elf = "chaos_sorcerer_plague_targeting_elf",
		bright_wizard = "chaos_sorcerer_plague_targeting_wizard"
	},
	status_effect_settings = {
		category = "medium",
		ignored_statuses = table.set({
			StatusEffectNames.burning_warpfire,
			StatusEffectNames.poisoned
		})
	},
	disabled = Development.setting("disable_plague_sorcerer") or false,
	custom_death_enter_function = function (unit, killer_unit, damage_type, death_hit_zone, t)
		local blackboard = BLACKBOARDS[unit]

		if not Unit.alive(killer_unit) then
			return
		end

		local teleport_at_t = blackboard.teleport_at_t

		if teleport_at_t then
			QuestSettings.check_corruptor_killed_at_teleport_time(blackboard, teleport_at_t, t, killer_unit)
		end

		QuestSettings.check_corruptor_killed_while_grabbing(blackboard, killer_unit)
	end
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
		part_hp_lost_to_teleport = 0.1,
		skulk_foreshadowing_sound_stop = "chaos_corruptor_spawning_stop",
		max_wave_distance = 8,
		third_wave_max_distance = 8,
		vanish_timer = 4,
		vanish_countdown = 4,
		far_away_from_target_sq = 400,
		third_wave_min_distance = 3,
		skulk_foreshadowing_sound = "chaos_corruptor_spawning",
		min_wave_distance = 5,
		preferred_distance = 20,
		initial_skulk_time = {
			10,
			12
		},
		skulk_time = {
			5,
			8
		},
		teleport_cooldown = {
			15,
			15
		}
	},
	grab_attack = {
		drain_life_tick_rate = 1,
		dodge_angle = 3.5,
		projectile_radius = 2,
		max_distance_squared = 144,
		cooldown = 4,
		fatigue_type = "blocked_attack",
		projectile_speed = 25,
		dodge_distance = 1.25,
		damage_type = "cutting",
		min_dodge_angle_squared = 4,
		drag_in_anim = "attack_dementor_drag_in",
		attack_anim = "attack_dementor_start",
		damage = 5,
		unblockable = true,
		disable_player_time = math.huge,
		difficulty_damage = {
			harder = 15,
			hard = 8,
			normal = 5,
			hardest = 25,
			cataclysm = 30,
			cataclysm_3 = 50,
			cataclysm_2 = 40,
			easy = 3
		},
		health_leech = {
			harder = 10,
			hard = 5,
			normal = 2,
			hardest = 20,
			cataclysm = 30,
			cataclysm_3 = 50,
			cataclysm_2 = 40,
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
	}
}
action_data.stagger = {
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
		},
		{
			fwd = {},
			bwd = {},
			left = {},
			right = {}
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
BreedActions.chaos_corruptor_sorcerer = table.create_copy(BreedActions.chaos_corruptor_sorcerer, action_data)

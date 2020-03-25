local buff_tweak_data = {
	markus_huntsman_ability_cooldown_on_hit = {
		bonus = 0.3
	},
	markus_huntsman_ability_cooldown_on_damage_taken = {
		bonus = 0.4
	},
	markus_huntsman_passive = {
		bonus = 1
	},
	markus_huntsman_passive_crit_aura = {
		range = 5
	},
	markus_huntsman_passive_crit_aura_buff = {
		bonus = 0.05
	},
	markus_huntsman_passive_increased_ammunition = {
		multiplier = 0.5
	},
	markus_huntsman_activated_ability = {
		dodge_distance_multiplier = 0.95,
		attack_speed_multiplier = 1,
		dodge_speed_multiplier = 0.95,
		headshot_multiplier = 0.5,
		move_speed_multiplier = 0.9,
		duration = 6,
		reload_speed_multiplier = -0.4
	},
	markus_huntsman_vanguard = {},
	markus_huntsman_bloodlust = {},
	markus_huntsman_conqueror = {},
	markus_huntsman_increased_damage_to_wounded_enemies = {
		display_health_threshold = 0.5,
		multiplier = 0.3
	},
	markus_huntsman_headshot_damage = {
		multiplier = 0.5
	},
	markus_huntsman_headshots_increase_reload_speed_buff = {
		duration = 5,
		multiplier = -0.2
	},
	markus_huntsman_passive_crit_buff = {
		bonus = 0.25
	},
	markus_huntsman_passive_temp_health_on_headshot = {
		bonus = 2
	},
	markus_huntsman_movement_speed = {
		multiplier = 1.1
	},
	markus_huntsman_damage_reduction_on_monster_kill_buff = {
		display_multiplier = 0.3,
		multiplier = -0.27
	},
	markus_huntsman_damage_reduction_on_monster_kill_passive = {
		multiplier = -0.03
	},
	markus_huntsman_ammo_on_special_kill = {
		ammo_bonus_fraction = 0.1
	},
	markus_huntsman_activated_ability_cooldown = {
		multiplier = -0.3
	},
	markus_huntsman_activated_ability_duration = {
		duration = 10
	},
	markus_knight_ability_cooldown_on_hit = {
		bonus = 0.25
	},
	markus_knight_ability_cooldown_on_damage_taken = {
		bonus = 0.5
	},
	markus_knight_passive = {
		range = 5
	},
	markus_knight_passive_damage_reduction = {
		multiplier = -0.1
	},
	markus_knight_passive_increased_stamina = {
		bonus = 2
	},
	markus_knight_passive_defence_aura = {
		multiplier = -0.15
	},
	markus_knight_activated_ability = {
		duration = 1.7
	},
	markus_knight_vanguard = {},
	markus_knight_reaper = {},
	markus_knight_conqueror = {},
	markus_knight_power_level_impact = {
		multiplier = 0.35
	},
	markus_knight_power_level_on_stagger_elite_buff = {
		duration = 10,
		multiplier = 0.15
	},
	markus_knight_attack_speed_on_push_buff = {
		duration = 3,
		multiplier = 0.15
	},
	markus_knight_improved_passive_defence_aura_buff = {
		multiplier = -0.05
	},
	markus_knight_passive_block_cost_aura_buff = {
		multiplier = -0.2
	},
	markus_knight_passive_power_increase_buff = {
		multiplier = 0.1
	},
	markus_knight_movement_speed_on_incapacitated_allies_buff = {
		multiplier = 1.3
	},
	markus_knight_free_pushes_on_block_buff = {
		duration = 1
	},
	markus_knight_damage_taken_ally_proximity_buff = {
		max_stacks = 3,
		multiplier = -0.05
	},
	markus_knight_ability_invulnerability_buff = {
		duration = 3
	},
	markus_knight_ability_hit_target_damage_taken = {
		cdr = 0.66,
		bonus = 20
	},
	markus_knight_ability_attack_speed_enemy_hit_buff = {
		max_stacks = 10,
		multiplier = 0.03,
		duration = 10
	},
	markus_mercenary_ability_cooldown_on_hit = {
		bonus = 0.5
	},
	markus_mercenary_ability_cooldown_on_damage_taken = {
		bonus = 0.5
	},
	markus_mercenary_passive = {
		targets = 3
	},
	markus_mercenary_passive_crit_chance = {
		bonus = 0.05
	},
	markus_mercenary_passive_proc = {
		duration = 6,
		multiplier = 0.1
	},
	markus_mercenary_reaper = {},
	markus_mercenary_bloodlust = {},
	markus_mercenary_conqueror = {},
	markus_mercenary_increased_damage_on_enemy_proximity = {
		chunk_size = 1,
		range = 3
	},
	markus_mercenary_damage_on_enemy_proximity = {
		max_stacks = 5,
		multiplier = 0.05
	},
	markus_mercenary_power_level_cleave = {
		multiplier = 0.5
	},
	markus_mercenary_crit_count = {
		buff_on_stacks = 5
	},
	markus_mercenary_passive_power_level = {
		duration = 6,
		multiplier = 0.15
	},
	markus_mercenary_passive_improved = {
		duration = 6,
		multiplier = 0.2,
		targets = 4
	},
	markus_mercenary_passive_defence = {
		duration = 6,
		multiplier = -0.25
	},
	markus_mercenary_dodge_range = {
		multiplier = 1.2
	},
	markus_mercenary_dodge_speed = {
		multiplier = 1.2
	},
	markus_mercenary_max_ammo = {
		multiplier = 0.3
	},
	markus_mercenary_activated_ability_cooldown_no_heal = {
		multiplier = -0.45
	},
	markus_mercenary_activated_ability_damage_reduction = {
		duration = 10,
		multiplier = -0.4
	}
}
TalentBuffTemplates = TalentBuffTemplates or {}
TalentBuffTemplates.empire_soldier = {
	markus_huntsman_ability_cooldown_on_hit = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = "reduce_activated_ability_cooldown"
			}
		}
	},
	markus_huntsman_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				event_buff = true,
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken"
			}
		}
	},
	markus_huntsman_end_activated_on_ranged_hit = {
		buffs = {
			{
				event = "on_ranged_hit",
				event_buff = true,
				buff_func = "end_huntsman_stealth",
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration
			}
		}
	},
	markus_huntsman_end_activated_on_melee_hit = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = "end_huntsman_stealth",
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration
			}
		}
	},
	markus_huntsman_passive = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = "markus_huntsman_passive_proc"
			}
		}
	},
	markus_huntsman_passive_crit_aura = {
		buffs = {
			{
				buff_to_add = "markus_huntsman_passive_crit_aura_buff",
				update_func = "activate_buff_on_distance"
			}
		}
	},
	markus_huntsman_passive_crit_aura_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "markus_huntsman_crit_aura",
				stat_buff = "critical_strike_chance"
			}
		}
	},
	markus_huntsman_passive_increased_ammunition = {
		buffs = {
			{
				stat_buff = "total_ammo"
			}
		}
	},
	markus_huntsman_passive_no_damage_dropoff = {
		buffs = {
			{
				perk = "no_damage_dropoff"
			}
		}
	},
	markus_huntsman_activated_ability = {
		deactivation_effect = "fx/screenspace_huntsman_skill_02",
		buffs = {
			{
				remove_buff_func = "end_huntsman_activated_ability",
				name = "markus_huntsman_activated_ability",
				continuous_effect = "fx/screenspace_huntsman_skill_01",
				max_stacks = 1,
				icon = "markus_huntsman_activated_ability",
				apply_buff_func = "apply_huntsman_activated_ability",
				refresh_durations = true,
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration
			}
		}
	},
	markus_huntsman_activated_ability_increased_zoom = {
		buffs = {
			{
				name = "markus_huntsman_activated_ability_increased_zoom",
				refresh_durations = true,
				max_stacks = 1,
				perk = "increased_zoom",
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration
			}
		}
	},
	markus_huntsman_activated_ability_headshot_multiplier = {
		buffs = {
			{
				name = "markus_huntsman_activated_ability_headshot_multiplier",
				stat_buff = "headshot_multiplier",
				refresh_durations = true,
				max_stacks = 1,
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.headshot_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration
			}
		}
	},
	markus_huntsman_activated_ability_increased_reload_speed = {
		buffs = {
			{
				name = "markus_huntsman_activated_ability_increased_reload_speed",
				stat_buff = "reload_speed",
				refresh_durations = true,
				max_stacks = 1,
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.reload_speed_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration
			}
		}
	},
	markus_huntsman_activated_ability_decrease_move_speed = {
		buffs = {
			{
				name = "markus_huntsman_activated_ability_decrease_move_speed",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_movement",
				lerp_time = 1,
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed"
				},
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.move_speed_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration
			}
		}
	},
	markus_huntsman_activated_ability_decrease_crouch_move_speed = {
		buffs = {
			{
				name = "markus_huntsman_activated_ability_decrease_crouch_move_speed",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				lerp_time = 1,
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"crouch_move_speed"
				},
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.move_speed_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration
			}
		}
	},
	markus_huntsman_activated_ability_decrease_walk_move_speed = {
		buffs = {
			{
				name = "markus_huntsman_activated_ability_decrease_walk_move_speed",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_walk_movement",
				lerp_time = 1,
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"walk_move_speed"
				},
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.move_speed_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration
			}
		}
	},
	markus_huntsman_activated_ability_decrease_dodge_speed = {
		buffs = {
			{
				name = "markus_huntsman_activated_ability_decrease_dodge_speed",
				lerp_time = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				refresh_durations = true,
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier"
				},
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.dodge_speed_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration
			}
		}
	},
	markus_huntsman_activated_ability_decrease_dodge_distance = {
		buffs = {
			{
				name = "markus_huntsman_activated_ability_decrease_dodge_distance",
				lerp_time = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				refresh_durations = true,
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier"
				},
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.dodge_distance_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration
			}
		}
	},
	markus_huntsman_activated_ability_duration = {
		deactivation_effect = "fx/screenspace_huntsman_skill_02",
		buffs = {
			{
				remove_buff_func = "end_huntsman_activated_ability",
				name = "markus_huntsman_activated_ability",
				continuous_effect = "fx/screenspace_huntsman_skill_01",
				max_stacks = 1,
				icon = "markus_huntsman_activated_ability",
				apply_buff_func = "apply_huntsman_activated_ability",
				refresh_durations = true,
				duration = buff_tweak_data.markus_huntsman_activated_ability_duration.duration
			}
		}
	},
	markus_huntsman_activated_ability_increased_zoom_duration = {
		buffs = {
			{
				name = "markus_huntsman_activated_ability_increased_zoom",
				refresh_durations = true,
				max_stacks = 1,
				perk = "increased_zoom",
				duration = buff_tweak_data.markus_huntsman_activated_ability_duration.duration
			}
		}
	},
	markus_huntsman_end_activated_on_ranged_hit_duration = {
		buffs = {
			{
				event = "on_ranged_hit",
				event_buff = true,
				buff_func = "end_huntsman_stealth",
				duration = buff_tweak_data.markus_huntsman_activated_ability_duration.duration
			}
		}
	},
	markus_huntsman_end_activated_on_melee_hit_duration = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = "end_huntsman_stealth",
				duration = buff_tweak_data.markus_huntsman_activated_ability_duration.duration
			}
		}
	},
	markus_huntsman_activated_ability_headshot_multiplier_duration = {
		buffs = {
			{
				name = "markus_huntsman_activated_ability_headshot_multiplier",
				stat_buff = "headshot_multiplier",
				refresh_durations = true,
				max_stacks = 1,
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.headshot_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability_duration.duration
			}
		}
	},
	markus_huntsman_activated_ability_increased_reload_speed_duration = {
		buffs = {
			{
				name = "markus_huntsman_activated_ability_increased_reload_speed",
				stat_buff = "reload_speed",
				refresh_durations = true,
				max_stacks = 1,
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.reload_speed_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability_duration.duration
			}
		}
	},
	markus_huntsman_activated_ability_decrease_move_speed_duration = {
		buffs = {
			{
				name = "markus_huntsman_activated_ability_decrease_move_speed",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_movement",
				lerp_time = 1,
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed"
				},
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.move_speed_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability_duration.duration
			}
		}
	},
	markus_huntsman_activated_ability_decrease_crouch_move_speed_duration = {
		buffs = {
			{
				name = "markus_huntsman_activated_ability_decrease_crouch_move_speed",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				lerp_time = 1,
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"crouch_move_speed"
				},
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.move_speed_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability_duration.duration
			}
		}
	},
	markus_huntsman_activated_ability_decrease_walk_move_speed_duration = {
		buffs = {
			{
				name = "markus_huntsman_activated_ability_decrease_walk_move_speed",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				apply_buff_func = "apply_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_walk_movement",
				lerp_time = 1,
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"walk_move_speed"
				},
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.move_speed_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability_duration.duration
			}
		}
	},
	markus_huntsman_activated_ability_decrease_dodge_speed_duration = {
		buffs = {
			{
				name = "markus_huntsman_activated_ability_decrease_dodge_speed",
				lerp_time = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				refresh_durations = true,
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier"
				},
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.dodge_speed_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability_duration.duration
			}
		}
	},
	markus_huntsman_activated_ability_decrease_dodge_distance_duration = {
		buffs = {
			{
				name = "markus_huntsman_activated_ability_decrease_dodge_distance",
				lerp_time = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				refresh_durations = true,
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier"
				},
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.dodge_distance_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability_duration.duration
			}
		}
	},
	markus_huntsman_vanguard = {
		buffs = {
			{
				multiplier = 1,
				name = "vanguard",
				event_buff = true,
				buff_func = "heal_stagger_targets_on_melee",
				event = "on_stagger",
				perk = "tank_healing"
			}
		}
	},
	markus_huntsman_bloodlust = {
		buffs = {
			{
				multiplier = 0.45,
				name = "bloodlust",
				event_buff = true,
				buff_func = "heal_percent_of_damage_dealt_on_melee",
				event = "on_damage_dealt",
				perk = "smiter_healing",
				heal_cap = 0.25
			}
		}
	},
	markus_huntsman_conqueror = {
		buffs = {
			{
				multiplier = 0.2,
				name = "conqueror",
				event_buff = true,
				buff_func = "heal_other_players_percent_at_range",
				event = "on_healed_consumeable",
				range = 10
			}
		}
	},
	markus_huntsman_debuff_defence_on_crit = {
		buffs = {
			{
				event = "on_critical_hit",
				buff_to_add = "defence_debuff_enemies",
				event_buff = true,
				buff_func = "on_hit_debuff_enemy_defence"
			}
		}
	},
	markus_huntsman_increased_damage_to_wounded_enemies = {
		buffs = {
			{
				stat_buff = "increased_weapon_damage_ranged_to_wounded"
			}
		}
	},
	markus_huntsman_headshot_damage = {
		buffs = {
			{
				stat_buff = "headshot_multiplier"
			}
		}
	},
	markus_huntsman_headshots_increase_reload_speed = {
		buffs = {
			{
				max_stacks = 1,
				name = "markus_huntsman_headshots_restore_health",
				event_buff = true,
				buff_func = "markus_huntsman_increase_reload_speed",
				event = "on_hit"
			}
		}
	},
	markus_huntsman_headshots_increase_reload_speed_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "markus_huntsman_headshots_increase_reload_speed",
				stat_buff = "reload_speed",
				refresh_durations = true
			}
		}
	},
	markus_huntsman_passive_crit_buff = {
		buffs = {
			{
				max_stacks = 1,
				stat_buff = "critical_strike_chance",
				is_cooldown = true,
				icon = "markus_huntsman_passive_crit_buff_on_headshot",
				dormant = true
			}
		}
	},
	markus_huntsman_passive_crit_buff_removal = {
		buffs = {
			{
				name = "markus_huntsman_passive_crit_buff_removal",
				event_buff = true,
				buff_func = "remove_markus_huntsman_passive_crit_buff",
				event = "on_critical_action",
				dormant = true
			}
		}
	},
	markus_huntsman_passive_temp_health_on_headshot = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = "heal_finesse_damage_on_ranged"
			}
		}
	},
	markus_huntsman_movement_speed = {
		buffs = {
			{
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			}
		}
	},
	markus_huntsman_damage_reduction_on_monster_kill = {
		buffs = {
			{
				event = "on_boss_killed",
				buff_to_add = "markus_huntsman_damage_reduction_on_monster_kill_buff",
				event_buff = true,
				buff_func = "add_buff"
			}
		}
	},
	markus_huntsman_damage_reduction_on_monster_kill_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "markus_huntsman_damage_reduction_on_monster_kill",
				stat_buff = "damage_taken_secondary"
			}
		}
	},
	markus_huntsman_damage_reduction_on_monster_kill_passive = {
		buffs = {
			{
				stat_buff = "damage_taken_secondary",
				max_stacks = 1
			}
		}
	},
	markus_huntsman_ammo_on_special_kill = {
		buffs = {
			{
				event = "on_special_killed",
				event_buff = true,
				buff_func = "restore_ammo_on_special_kill"
			}
		}
	},
	markus_huntsman_activated_ability_cooldown = {
		buffs = {
			{
				stat_buff = "activated_cooldown"
			}
		}
	},
	markus_knight_ability_cooldown_on_hit = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = "reduce_activated_ability_cooldown"
			}
		}
	},
	markus_knight_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				event_buff = true,
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken"
			}
		}
	},
	markus_knight_passive = {
		buffs = {
			{
				buff_to_add = "markus_knight_passive_defence_aura",
				update_func = "markus_knight_proximity_buff_update"
			}
		}
	},
	markus_knight_passive_damage_reduction = {
		buffs = {
			{
				stat_buff = "damage_taken"
			}
		}
	},
	markus_knight_passive_increased_stamina = {
		buffs = {
			{
				stat_buff = "max_fatigue"
			}
		}
	},
	markus_knight_passive_defence_aura = {
		buffs = {
			{
				max_stacks = 1,
				icon = "markus_knight_passive",
				stat_buff = "damage_taken"
			}
		}
	},
	markus_knight_activated_ability = {
		buffs = {
			{
				remove_buff_func = "end_knight_activated_ability",
				icon = "markus_knight_activated_ability",
				perk = "uninterruptible"
			}
		}
	},
	markus_knight_vanguard = {
		buffs = {
			{
				multiplier = 1,
				name = "vanguard",
				event_buff = true,
				buff_func = "heal_stagger_targets_on_melee",
				event = "on_stagger",
				perk = "tank_healing"
			}
		}
	},
	markus_knight_reaper = {
		buffs = {
			{
				multiplier = -0.05,
				name = "reaper",
				event_buff = true,
				buff_func = "heal_damage_targets_on_melee",
				event = "on_damage_dealt",
				perk = "linesman_healing",
				max_targets = 5,
				bonus = 0.25
			}
		}
	},
	markus_knight_conqueror = {
		buffs = {
			{
				multiplier = 0.2,
				name = "conqueror",
				event_buff = true,
				buff_func = "heal_other_players_percent_at_range",
				event = "on_healed_consumeable",
				range = 10
			}
		}
	},
	markus_knight_power_level_impact = {
		buffs = {
			{
				stat_buff = "power_level_impact"
			}
		}
	},
	markus_knight_power_level_on_stagger_elite = {
		buffs = {
			{
				buff_to_add = "markus_knight_power_level_on_stagger_elite_buff",
				event_buff = true,
				buff_func = "buff_on_stagger_enemy",
				event = "on_stagger",
				enemy_type = {
					"elite"
				}
			}
		}
	},
	markus_knight_power_level_on_stagger_elite_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "markus_knight_power_level_on_stagger_elite",
				stat_buff = "power_level",
				refresh_durations = true
			}
		}
	},
	markus_knight_attack_speed_on_push = {
		buffs = {
			{
				event = "on_push",
				buff_to_add = "markus_knight_attack_speed_on_push_buff",
				event_buff = true,
				buff_func = "add_buff"
			}
		}
	},
	markus_knight_attack_speed_on_push_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "markus_knight_attack_speed_on_push",
				stat_buff = "attack_speed",
				refresh_durations = true
			}
		}
	},
	markus_knight_improved_passive_defence_aura = {
		buffs = {
			{
				buff_to_add = "markus_knight_improved_passive_defence_aura_buff",
				update_func = "activate_buff_on_distance",
				range = buff_tweak_data.markus_knight_passive.range
			}
		}
	},
	markus_knight_improved_passive_defence_aura_buff = {
		buffs = {
			{
				stat_buff = "damage_taken",
				max_stacks = 1
			}
		}
	},
	markus_knight_passive_block_cost_aura = {
		buffs = {
			{
				buff_to_add = "markus_knight_passive_block_cost_aura_buff",
				update_func = "activate_buff_on_distance",
				range = buff_tweak_data.markus_knight_passive.range
			}
		}
	},
	markus_knight_passive_block_cost_aura_buff = {
		buffs = {
			{
				stat_buff = "block_cost",
				max_stacks = 1
			}
		}
	},
	markus_knight_passive_power_increase_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "markus_knight_passive_power_increase",
				stat_buff = "power_level"
			}
		}
	},
	markus_knight_movement_speed_on_incapacitated_allies = {
		buffs = {
			{
				buff_to_add = "markus_knight_movement_speed_on_incapacitated_allies_buff",
				update_func = "markus_knight_movespeed_on_incapacitated_ally"
			}
		}
	},
	markus_knight_movement_speed_on_incapacitated_allies_buff = {
		buffs = {
			{
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				icon = "markus_knight_movement_speed_on_incapacitated_allies",
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			}
		}
	},
	markus_knight_free_pushes_on_block = {
		buffs = {
			{
				event = "on_block",
				buff_to_add = "markus_knight_free_pushes_on_block_buff",
				event_buff = true,
				buff_func = "add_buff"
			}
		}
	},
	markus_knight_free_pushes_on_block_buff = {
		buffs = {
			{
				icon = "markus_knight_free_pushes_on_block",
				perk = "no_push_fatigue_cost",
				stat_buff = "push_power",
				max_stacks = 1,
				refresh_durations = true,
				dormant = true
			}
		}
	},
	markus_knight_damage_taken_ally_proximity = {
		buffs = {
			{
				buff_to_add = "markus_knight_damage_taken_ally_proximity_buff",
				chunk_size = 1,
				range = 5,
				max_stacks = 3,
				update_func = "activate_buff_stacks_based_on_ally_proximity"
			}
		}
	},
	markus_knight_damage_taken_ally_proximity_buff = {
		buffs = {
			{
				dormant = true,
				icon = "markus_knight_damage_taken_ally_proximity",
				stat_buff = "damage_taken_secondary"
			}
		}
	},
	markus_knight_ability_invulnerability_buff = {
		buffs = {
			{
				duration = 5,
				multiplier = -1,
				stat_buff = "damage_taken",
				icon = "markus_knight_ability_invulnerability",
				dormant = true
			}
		}
	},
	markus_knight_ability_hit_target_damage_taken_blast = {
		buffs = {
			{
				event = "on_charge_ability_hit_blast",
				event_buff = true,
				buff_func = "on_hit_debuff_enemy_defence"
			}
		}
	},
	markus_knight_ability_hit_target_damage_taken_charge = {
		buffs = {
			{
				event = "on_charge_ability_hit",
				event_buff = true,
				buff_func = "on_hit_debuff_enemy_defence"
			}
		}
	},
	markus_knight_ability_attack_speed_enemy_hit_blast = {
		buffs = {
			{
				event = "on_charge_ability_hit_blast",
				buff_to_add = "markus_knight_ability_attack_speed_enemy_hit_buff",
				event_buff = true,
				buff_func = "add_buff"
			}
		}
	},
	markus_knight_ability_attack_speed_enemy_hit_charge = {
		buffs = {
			{
				event = "on_charge_ability_hit",
				buff_to_add = "markus_knight_ability_attack_speed_enemy_hit_buff",
				event_buff = true,
				buff_func = "add_buff"
			}
		}
	},
	markus_knight_ability_attack_speed_enemy_hit_buff = {
		buffs = {
			{
				dormant = true,
				icon = "markus_knight_ability_attack_speed_enemy_hit",
				stat_buff = "attack_speed",
				refresh_durations = true
			}
		}
	},
	markus_mercenary_ability_cooldown_on_hit = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = "reduce_activated_ability_cooldown"
			}
		}
	},
	markus_mercenary_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				event_buff = true,
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken"
			}
		}
	},
	markus_mercenary_passive = {
		buffs = {
			{
				event = "on_hit",
				buff_to_add = "markus_mercenary_passive_proc",
				event_buff = true,
				buff_func = "gain_markus_mercenary_passive_proc"
			}
		}
	},
	markus_mercenary_passive_crit_chance = {
		buffs = {
			{
				stat_buff = "critical_strike_chance"
			}
		}
	},
	markus_mercenary_passive_uninterruptible_heavy = {
		buffs = {
			{
				perk = "uninterruptible_heavy"
			}
		}
	},
	markus_mercenary_passive_hit_mass_override = {
		buffs = {
			{
				perk = "hit_mass_override"
			}
		}
	},
	markus_mercenary_passive_proc = {
		buffs = {
			{
				dormant = true,
				refresh_durations = true,
				stat_buff = "attack_speed",
				max_stacks = 1,
				icon = "markus_mercenary_passive",
				priority_buff = true
			}
		}
	},
	markus_mercenary_reaper = {
		buffs = {
			{
				multiplier = -0.05,
				name = "reaper",
				event_buff = true,
				buff_func = "heal_damage_targets_on_melee",
				event = "on_damage_dealt",
				perk = "linesman_healing",
				max_targets = 5,
				bonus = 0.25
			}
		}
	},
	markus_mercenary_bloodlust = {
		buffs = {
			{
				multiplier = 0.45,
				name = "bloodlust",
				event_buff = true,
				buff_func = "heal_percent_of_damage_dealt_on_melee",
				event = "on_damage_dealt",
				perk = "smiter_healing",
				heal_cap = 0.25
			}
		}
	},
	markus_mercenary_conqueror = {
		buffs = {
			{
				multiplier = 0.2,
				name = "conqueror",
				event_buff = true,
				buff_func = "heal_other_players_percent_at_range",
				event = "on_healed_consumeable",
				range = 10
			}
		}
	},
	markus_mercenary_increased_damage_on_enemy_proximity = {
		buffs = {
			{
				buff_to_add = "markus_mercenary_damage_on_enemy_proximity",
				update_func = "activate_buff_stacks_based_on_enemy_proximity"
			}
		}
	},
	markus_mercenary_damage_on_enemy_proximity = {
		buffs = {
			{
				stat_buff = "power_level",
				icon = "markus_mercenary_increased_damage_on_enemy_proximity"
			}
		}
	},
	markus_mercenary_power_level_cleave = {
		buffs = {
			{
				stat_buff = "power_level_melee_cleave"
			}
		}
	},
	markus_mercenary_crit_count = {
		buffs = {
			{
				event = "on_hit",
				buff_to_add = "markus_mercenary_counter_buff",
				event_buff = true,
				buff_func = "add_buff_on_first_target_hit"
			}
		}
	},
	markus_mercenary_counter_buff = {
		buffs = {
			{
				reset_on_max_stacks = true,
				max_stacks = 5,
				icon = "markus_mercenary_crit_count",
				dormant = true,
				on_max_stacks_func = function (player, sub_buff_template)
					local player_unit = player.player_unit

					if Unit.alive(player_unit) then
						local buff_to_add = "markus_mercenary_crit_count_buff"
						local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")

						buff_extension:add_buff(buff_to_add)
					end
				end
			}
		}
	},
	markus_mercenary_crit_count_buff = {
		buffs = {
			{
				event = "on_critical_action",
				icon = "markus_mercenary_crit_count",
				event_buff = true,
				buff_func = "dummy_function",
				remove_on_proc = true,
				perk = "guaranteed_crit",
				priority_buff = true,
				max_stacks = 1
			}
		}
	},
	markus_mercenary_passive_power_level = {
		buffs = {
			{
				refresh_durations = true,
				stat_buff = "power_level",
				max_stacks = 1,
				icon = "markus_mercenary_passive_power_level_on_proc",
				dormant = true
			}
		}
	},
	markus_mercenary_passive_improved = {
		buffs = {
			{
				dormant = true,
				refresh_durations = true,
				stat_buff = "attack_speed",
				max_stacks = 1,
				icon = "markus_mercenary_passive_improved",
				priority_buff = true
			}
		}
	},
	markus_mercenary_passive_defence = {
		buffs = {
			{
				refresh_durations = true,
				stat_buff = "damage_taken",
				max_stacks = 1,
				icon = "markus_mercenary_passive_defence_on_proc",
				dormant = true
			}
		}
	},
	markus_mercenary_dodge_range = {
		buffs = {
			{
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier"
				}
			}
		}
	},
	markus_mercenary_dodge_speed = {
		buffs = {
			{
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier"
				}
			}
		}
	},
	markus_mercenary_max_ammo = {
		buffs = {
			{
				stat_buff = "total_ammo"
			}
		}
	},
	markus_mercenary_activated_ability_cooldown_no_heal = {
		buffs = {
			{
				stat_buff = "activated_cooldown",
				name = "markus_mercenary_activated_ability_cooldown_no_heal"
			}
		}
	},
	markus_mercenary_activated_ability_damage_reduction = {
		buffs = {
			{
				icon = "markus_mercenary_activated_ability_damage_reduction",
				name = "markus_mercenary_activated_ability_damage_reduction",
				stat_buff = "damage_taken_secondary",
				max_stacks = 1,
				refresh_durations = true
			}
		}
	}
}
TalentTrees = TalentTrees or {}
TalentTrees.empire_soldier = {
	{
		{
			"markus_huntsman_vanguard",
			"markus_huntsman_bloodlust_2",
			"markus_huntsman_heal_share"
		},
		{
			"markus_huntsman_increased_damage_to_wounded_enemies",
			"markus_huntsman_debuff_defence_on_crit",
			"markus_huntsman_headshot_damage"
		},
		{
			"markus_huntsman_tank_unbalance",
			"markus_huntsman_smiter_unbalance",
			"markus_huntsman_power_level_unbalance"
		},
		{
			"markus_huntsman_headshots_increase_reload_speed",
			"markus_huntsman_passive_crit_buff_on_headshot",
			"markus_huntsman_passive_temp_health_on_headshot"
		},
		{
			"markus_huntsman_ammo_on_special_kill",
			"markus_huntsman_damage_reduction_on_monster_kill",
			"markus_huntsman_movement_speed"
		},
		{
			"markus_huntsman_activated_ability_cooldown",
			"markus_huntsman_activated_ability_improved_stealth",
			"markus_huntsman_activated_ability_duration"
		}
	},
	{
		{
			"markus_knight_vanguard",
			"markus_knight_reaper",
			"markus_knight_heal_share"
		},
		{
			"markus_knight_power_level_impact",
			"markus_knight_power_level_on_stagger_elite",
			"markus_knight_attack_speed_on_push"
		},
		{
			"markus_knight_tank_unbalance",
			"markus_knight_linesman_unbalance",
			"markus_knight_power_level_unbalance"
		},
		{
			"markus_knight_passive_block_cost_aura",
			"markus_knight_improved_passive_defence_aura",
			"markus_knight_passive_power_increase"
		},
		{
			"markus_knight_movement_speed_on_incapacitated_allies",
			"markus_knight_free_pushes_on_block",
			"markus_knight_damage_taken_ally_proximity"
		},
		{
			"markus_knight_ability_invulnerability",
			"markus_knight_ability_hit_target_damage_taken",
			"markus_knight_ability_attack_speed_enemy_hit"
		}
	},
	{
		{
			"markus_mercenary_reaper",
			"markus_mercenary_bloodlust_2",
			"markus_mercenary_heal_share"
		},
		{
			"markus_mercenary_increased_damage_on_enemy_proximity",
			"markus_mercenary_power_level_cleave",
			"markus_mercenary_crit_count"
		},
		{
			"markus_mercenary_linesman_unbalance",
			"markus_mercenary_smiter_unbalance",
			"markus_mercenary_power_level_unbalance"
		},
		{
			"markus_mercenary_passive_power_level_on_proc",
			"markus_mercenary_passive_improved",
			"markus_mercenary_passive_group_proc"
		},
		{
			"markus_mercenary_dodge_range",
			"markus_mercenary_passive_defence_on_proc",
			"markus_mercenary_max_ammo"
		},
		{
			"markus_mercenary_activated_ability_damage_reduction",
			"markus_mercenary_activated_ability_cooldown_no_heal",
			"markus_mercenary_activated_ability_revive"
		}
	}
}
Talents = Talents or {}
Talents.empire_soldier = {
	{
		description = "vanguard_desc",
		name = "markus_huntsman_vanguard",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_huntsman_regrowth",
		description_values = {},
		requirements = {},
		buffs = {
			"markus_huntsman_vanguard"
		},
		buff_data = {}
	},
	{
		description = "bloodlust_desc_3",
		name = "markus_huntsman_bloodlust_2",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_huntsman_bloodlust",
		description_values = {},
		requirements = {},
		buffs = {
			"markus_huntsman_bloodlust"
		},
		buff_data = {}
	},
	{
		description = "conqueror_desc_3",
		name = "markus_huntsman_heal_share",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_huntsman_conqueror",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.conqueror.buffs[1].multiplier
			}
		},
		requirements = {},
		buffs = {
			"markus_huntsman_conqueror"
		},
		buff_data = {}
	},
	{
		description = "markus_huntsman_increased_damage_to_wounded_enemies_desc",
		name = "markus_huntsman_increased_damage_to_wounded_enemies",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_huntsman_increased_damage_to_wounded_enemies",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_huntsman_increased_damage_to_wounded_enemies.multiplier
			},
			{
				value_type = "percent",
				value = buff_tweak_data.markus_huntsman_increased_damage_to_wounded_enemies.display_health_threshold
			}
		},
		requirements = {},
		buffs = {
			"markus_huntsman_increased_damage_to_wounded_enemies"
		},
		buff_data = {}
	},
	{
		description = "markus_huntsman_debuff_defence_on_crit_desc_2",
		name = "markus_huntsman_debuff_defence_on_crit",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_huntsman_debuff_defence_on_crit",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.defence_debuff_enemies.buffs[1].multiplier
			},
			{
				value = BuffTemplates.defence_debuff_enemies.buffs[1].duration
			}
		},
		requirements = {},
		buffs = {
			"markus_huntsman_debuff_defence_on_crit"
		},
		buff_data = {}
	},
	{
		description = "markus_huntsman_headshot_damage_desc",
		name = "markus_huntsman_headshot_damage",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_huntsman_headshot_damage",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_huntsman_headshot_damage.multiplier
			}
		},
		requirements = {},
		buffs = {
			"markus_huntsman_headshot_damage"
		},
		buff_data = {}
	},
	{
		description = "markus_huntsman_headshots_increase_reload_speed_desc",
		name = "markus_huntsman_headshots_increase_reload_speed",
		num_ranks = 1,
		icon = "markus_huntsman_headshots_increase_reload_speed",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_huntsman_headshots_increase_reload_speed_buff.multiplier
			},
			{
				value = buff_tweak_data.markus_huntsman_headshots_increase_reload_speed_buff.duration
			}
		},
		requirements = {},
		buffs = {
			"markus_huntsman_headshots_increase_reload_speed"
		},
		buff_data = {}
	},
	{
		description = "markus_huntsman_passive_crit_buff_on_headshot_desc",
		name = "markus_huntsman_passive_crit_buff_on_headshot",
		num_ranks = 1,
		icon = "markus_huntsman_passive_crit_buff_on_headshot",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_huntsman_passive_crit_buff.bonus
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "markus_huntsman_passive_temp_health_on_headshot_desc",
		name = "markus_huntsman_passive_temp_health_on_headshot",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_huntsman_reduced_spread",
		description_values = {
			{
				value = buff_tweak_data.markus_huntsman_passive_temp_health_on_headshot.bonus
			}
		},
		requirements = {},
		buffs = {
			"markus_huntsman_passive_temp_health_on_headshot"
		},
		buff_data = {}
	},
	{
		description = "markus_huntsman_movement_speed_desc",
		name = "markus_huntsman_movement_speed",
		num_ranks = 1,
		icon = "markus_huntsman_max_stamina",
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.markus_huntsman_movement_speed.multiplier
			}
		},
		requirements = {},
		buffs = {
			"markus_huntsman_movement_speed"
		},
		buff_data = {}
	},
	{
		description = "markus_huntsman_damage_reduction_on_monster_kill_desc",
		name = "markus_huntsman_damage_reduction_on_monster_kill",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_huntsman_damage_reduction_on_monster_kill",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_huntsman_damage_reduction_on_monster_kill_passive.multiplier
			},
			{
				value_type = "percent",
				value = buff_tweak_data.markus_huntsman_damage_reduction_on_monster_kill_buff.display_multiplier
			}
		},
		requirements = {},
		buffs = {
			"markus_huntsman_damage_reduction_on_monster_kill",
			"markus_huntsman_damage_reduction_on_monster_kill_passive"
		},
		buff_data = {}
	},
	{
		description = "markus_huntsman_ammo_on_special_kill_desc",
		name = "markus_huntsman_ammo_on_special_kill",
		num_ranks = 1,
		icon = "markus_huntsman_ammo_on_special_kill",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_huntsman_ammo_on_special_kill.ammo_bonus_fraction
			}
		},
		requirements = {},
		buffs = {
			"markus_huntsman_ammo_on_special_kill"
		},
		buff_data = {}
	},
	{
		description = "markus_huntsman_activated_ability_improved_stealth_desc",
		name = "markus_huntsman_activated_ability_improved_stealth",
		num_ranks = 1,
		buffer = "both",
		icon = "markus_huntsman_activated_ability_improved_stealth",
		description_values = {},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "markus_huntsman_activated_ability_duration_desc",
		name = "markus_huntsman_activated_ability_duration",
		num_ranks = 1,
		buffer = "both",
		icon = "markus_huntsman_activated_ability_duration",
		description_values = {
			{
				value = buff_tweak_data.markus_huntsman_activated_ability_duration.duration
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "markus_huntsman_activated_ability_cooldown_desc",
		name = "markus_huntsman_activated_ability_cooldown",
		num_ranks = 1,
		icon = "markus_huntsman_activated_ability_cooldown",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_huntsman_activated_ability_cooldown.multiplier
			}
		},
		requirements = {},
		buffs = {
			"markus_huntsman_activated_ability_cooldown"
		},
		buff_data = {}
	},
	{
		description = "tank_unbalance_desc",
		name = "markus_huntsman_tank_unbalance",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_huntsman_tank_unbalance",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.tank_unbalance_buff.buffs[1].bonus
			},
			{
				value = BuffTemplates.tank_unbalance_buff.buffs[1].duration
			},
			{
				value_type = "percent",
				value = BuffTemplates.tank_unbalance.buffs[1].display_multiplier
			},
			{
				value_type = "percent",
				value = BuffTemplates.tank_unbalance.buffs[1].max_display_multiplier
			}
		},
		requirements = {},
		buffs = {
			"tank_unbalance"
		},
		buff_data = {}
	},
	{
		description = "smiter_unbalance_desc",
		name = "markus_huntsman_smiter_unbalance",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_huntsman_smiter_unbalance",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.smiter_unbalance.buffs[1].display_multiplier
			},
			{
				value_type = "percent",
				value = BuffTemplates.smiter_unbalance.buffs[1].max_display_multiplier
			}
		},
		requirements = {},
		buffs = {
			"smiter_unbalance"
		},
		buff_data = {}
	},
	{
		description = "power_level_unbalance_desc",
		name = "markus_huntsman_power_level_unbalance",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_huntsman_power_level_unbalance",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.power_level_unbalance.buffs[1].multiplier
			}
		},
		requirements = {},
		buffs = {
			"power_level_unbalance"
		},
		buff_data = {}
	},
	{
		description = "reaper_desc",
		name = "markus_knight_reaper",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_knight_regrowth",
		description_values = {
			{
				value = BuffTemplates.reaper.buffs[1].max_targets
			}
		},
		requirements = {},
		buffs = {
			"markus_knight_reaper"
		},
		buff_data = {}
	},
	{
		description = "vanguard_desc",
		name = "markus_knight_vanguard",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_knight_bloodlust",
		description_values = {},
		requirements = {},
		buffs = {
			"markus_knight_vanguard"
		},
		buff_data = {}
	},
	{
		description = "conqueror_desc_3",
		name = "markus_knight_heal_share",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_knight_conqueror",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.conqueror.buffs[1].multiplier
			}
		},
		requirements = {},
		buffs = {
			"markus_knight_conqueror"
		},
		buff_data = {}
	},
	{
		description = "markus_knight_power_level_impact_desc",
		name = "markus_knight_power_level_impact",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_knight_power_level_impact",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_knight_power_level_impact.multiplier
			}
		},
		requirements = {},
		buffs = {
			"markus_knight_power_level_impact"
		},
		buff_data = {}
	},
	{
		description = "markus_knight_power_level_on_stagger_elite_desc",
		name = "markus_knight_power_level_on_stagger_elite",
		num_ranks = 1,
		buffer = "both",
		icon = "markus_knight_power_level_on_stagger_elite",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_knight_power_level_on_stagger_elite_buff.multiplier
			},
			{
				value = buff_tweak_data.markus_knight_power_level_on_stagger_elite_buff.duration
			}
		},
		requirements = {},
		buffs = {
			"markus_knight_power_level_on_stagger_elite"
		},
		buff_data = {}
	},
	{
		description = "markus_knight_attack_speed_on_push_desc",
		name = "markus_knight_attack_speed_on_push",
		num_ranks = 1,
		icon = "markus_knight_attack_speed_on_push",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_knight_attack_speed_on_push_buff.multiplier
			},
			{
				value = buff_tweak_data.markus_knight_attack_speed_on_push_buff.duration
			}
		},
		requirements = {},
		buffs = {
			"markus_knight_attack_speed_on_push"
		},
		buff_data = {}
	},
	{
		description = "markus_knight_improved_passive_defence_aura_desc",
		name = "markus_knight_improved_passive_defence_aura",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_knight_improved_passive_defence_aura",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_knight_improved_passive_defence_aura_buff.multiplier
			}
		},
		requirements = {},
		buffs = {
			"markus_knight_improved_passive_defence_aura"
		},
		buff_data = {}
	},
	{
		description = "markus_knight_passive_block_cost_aura_desc",
		name = "markus_knight_passive_block_cost_aura",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_knight_passive_block_cost_aura",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_knight_passive_block_cost_aura_buff.multiplier
			}
		},
		requirements = {},
		buffs = {
			"markus_knight_passive_block_cost_aura"
		},
		buff_data = {}
	},
	{
		description = "markus_knight_passive_power_increase_desc",
		name = "markus_knight_passive_power_increase",
		num_ranks = 1,
		buffer = "both",
		icon = "markus_knight_passive_power_increase",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_knight_passive_power_increase_buff.multiplier
			}
		},
		requirements = {},
		buffs = {
			"markus_knight_passive_power_increase_buff"
		},
		buff_data = {}
	},
	{
		description = "markus_knight_movement_speed_on_incapacitated_allies_desc",
		name = "markus_knight_movement_speed_on_incapacitated_allies",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_knight_movement_speed_on_incapacitated_allies",
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.markus_knight_movement_speed_on_incapacitated_allies_buff.multiplier
			}
		},
		requirements = {},
		buffs = {
			"markus_knight_movement_speed_on_incapacitated_allies"
		},
		buff_data = {}
	},
	{
		description = "markus_knight_free_pushes_on_block_desc",
		name = "markus_knight_free_pushes_on_block",
		num_ranks = 1,
		icon = "markus_knight_free_pushes_on_block",
		description_values = {
			{
				value = buff_tweak_data.markus_knight_free_pushes_on_block_buff.duration
			}
		},
		requirements = {},
		buffs = {
			"markus_knight_free_pushes_on_block"
		},
		buff_data = {}
	},
	{
		description = "markus_knight_damage_taken_ally_proximity_desc",
		name = "markus_knight_damage_taken_ally_proximity",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_knight_damage_taken_ally_proximity",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_knight_damage_taken_ally_proximity_buff.multiplier
			}
		},
		requirements = {},
		buffs = {
			"markus_knight_damage_taken_ally_proximity"
		},
		buff_data = {}
	},
	{
		description = "markus_knight_ability_invulnerability_desc",
		name = "markus_knight_ability_invulnerability",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_knight_ability_invulnerability",
		description_values = {
			{
				value = buff_tweak_data.markus_knight_ability_invulnerability_buff.duration
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "markus_knight_ability_hit_target_damage_taken_desc",
		name = "markus_knight_ability_hit_target_damage_taken",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_knight_ability_hit_target_damage_taken",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.defence_debuff_enemies.buffs[1].multiplier
			},
			{
				value = BuffTemplates.defence_debuff_enemies.buffs[1].duration
			}
		},
		requirements = {},
		buffs = {
			"markus_knight_ability_hit_target_damage_taken_blast",
			"markus_knight_ability_hit_target_damage_taken_charge"
		},
		buff_data = {}
	},
	{
		description = "markus_knight_ability_attack_speed_enemy_hit_desc",
		name = "markus_knight_ability_attack_speed_enemy_hit",
		num_ranks = 1,
		icon = "markus_knight_ability_attack_speed_enemy_hit",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_knight_ability_attack_speed_enemy_hit_buff.multiplier
			},
			{
				value = buff_tweak_data.markus_knight_ability_attack_speed_enemy_hit_buff.duration
			},
			{
				value = buff_tweak_data.markus_knight_ability_attack_speed_enemy_hit_buff.max_stacks
			}
		},
		requirements = {},
		buffs = {
			"markus_knight_ability_attack_speed_enemy_hit_blast",
			"markus_knight_ability_attack_speed_enemy_hit_charge"
		},
		buff_data = {}
	},
	{
		description = "tank_unbalance_desc",
		name = "markus_knight_tank_unbalance",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_knight_tank_unbalance",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.tank_unbalance_buff.buffs[1].bonus
			},
			{
				value = BuffTemplates.tank_unbalance_buff.buffs[1].duration
			},
			{
				value_type = "percent",
				value = BuffTemplates.tank_unbalance.buffs[1].display_multiplier
			},
			{
				value_type = "percent",
				value = BuffTemplates.tank_unbalance.buffs[1].max_display_multiplier
			}
		},
		requirements = {},
		buffs = {
			"tank_unbalance"
		},
		buff_data = {}
	},
	{
		description = "linesman_unbalance_desc",
		name = "markus_knight_linesman_unbalance",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_knight_linesman_unbalance",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.linesman_unbalance.buffs[1].display_multiplier
			},
			{
				value_type = "percent",
				value = BuffTemplates.linesman_unbalance.buffs[1].max_display_multiplier
			}
		},
		requirements = {},
		buffs = {
			"linesman_unbalance"
		},
		buff_data = {}
	},
	{
		description = "power_level_unbalance_desc",
		name = "markus_knight_power_level_unbalance",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_knight_power_level_unbalance",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.power_level_unbalance.buffs[1].multiplier
			}
		},
		requirements = {},
		buffs = {
			"power_level_unbalance"
		},
		buff_data = {}
	},
	{
		description = "reaper_desc",
		name = "markus_mercenary_reaper",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_mercenary_regrowth",
		description_values = {
			{
				value = BuffTemplates.reaper.buffs[1].max_targets
			}
		},
		requirements = {},
		buffs = {
			"markus_mercenary_reaper"
		},
		buff_data = {}
	},
	{
		description = "bloodlust_desc_3",
		name = "markus_mercenary_bloodlust_2",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_mercenary_bloodlust",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.bloodlust.buffs[1].multiplier
			}
		},
		requirements = {},
		buffs = {
			"markus_mercenary_bloodlust"
		},
		buff_data = {}
	},
	{
		description = "conqueror_desc_3",
		name = "markus_mercenary_heal_share",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_mercenary_conqueror",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.conqueror.buffs[1].multiplier
			}
		},
		requirements = {},
		buffs = {
			"markus_mercenary_conqueror"
		},
		buff_data = {}
	},
	{
		description = "markus_mercenary_increased_damage_on_enemy_proximity_desc",
		name = "markus_mercenary_increased_damage_on_enemy_proximity",
		num_ranks = 1,
		buffer = "both",
		icon = "markus_mercenary_increased_damage_on_enemy_proximity",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_mercenary_damage_on_enemy_proximity.multiplier
			},
			{
				value = buff_tweak_data.markus_mercenary_damage_on_enemy_proximity.max_stacks
			}
		},
		requirements = {},
		buffs = {
			"markus_mercenary_increased_damage_on_enemy_proximity"
		},
		buff_data = {}
	},
	{
		description = "markus_mercenary_power_level_cleave_desc",
		name = "markus_mercenary_power_level_cleave",
		num_ranks = 1,
		buffer = "both",
		icon = "markus_mercenary_power_level_cleave",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_mercenary_power_level_cleave.multiplier
			}
		},
		requirements = {},
		buffs = {
			"markus_mercenary_power_level_cleave"
		},
		buff_data = {}
	},
	{
		description = "markus_mercenary_crit_count_desc",
		name = "markus_mercenary_crit_count",
		num_ranks = 1,
		icon = "markus_mercenary_crit_count",
		description_values = {
			{
				value = buff_tweak_data.markus_mercenary_crit_count.buff_on_stacks
			}
		},
		requirements = {},
		buffs = {
			"markus_mercenary_crit_count"
		},
		buff_data = {},
		perks = {
			"no_random_crits"
		}
	},
	{
		description = "markus_mercenary_passive_power_level_on_proc_desc",
		name = "markus_mercenary_passive_power_level_on_proc",
		num_ranks = 1,
		buffer = "both",
		icon = "markus_mercenary_passive_power_level_on_proc",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_mercenary_passive_power_level.multiplier
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "markus_mercenary_passive_group_proc_desc",
		name = "markus_mercenary_passive_group_proc",
		num_ranks = 1,
		icon = "markus_mercenary_passive_group_proc",
		description_values = {},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "markus_mercenary_passive_improved_desc",
		name = "markus_mercenary_passive_improved",
		num_ranks = 1,
		icon = "markus_mercenary_passive_improved",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_mercenary_passive_improved.multiplier
			},
			{
				value = buff_tweak_data.markus_mercenary_passive_improved.targets
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "markus_mercenary_passive_defence_on_proc_desc",
		name = "markus_mercenary_passive_defence_on_proc",
		num_ranks = 1,
		buffer = "both",
		icon = "markus_mercenary_passive_defence_on_proc",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_mercenary_passive_defence.multiplier
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "markus_mercenary_dodge_range_desc",
		name = "markus_mercenary_dodge_range",
		num_ranks = 1,
		icon = "markus_mercenary_activated_ability_improved_healing",
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.markus_mercenary_dodge_range.multiplier
			}
		},
		requirements = {},
		buffs = {
			"markus_mercenary_dodge_range",
			"markus_mercenary_dodge_speed"
		},
		buff_data = {}
	},
	{
		description = "markus_mercenary_max_ammo_desc",
		name = "markus_mercenary_max_ammo",
		num_ranks = 1,
		icon = "markus_mercenary_max_ammo",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_mercenary_max_ammo.multiplier
			}
		},
		requirements = {},
		buffs = {
			"markus_mercenary_max_ammo"
		},
		buff_data = {}
	},
	{
		description = "markus_mercenary_activated_ability_revive_desc",
		name = "markus_mercenary_activated_ability_revive",
		num_ranks = 1,
		icon = "markus_mercenary_activated_ability_revive",
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "markus_mercenary_activated_ability_cooldown_no_heal_desc",
		name = "markus_mercenary_activated_ability_cooldown_no_heal",
		num_ranks = 1,
		icon = "markus_mercenary_activated_ability_cooldown_no_heal",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_mercenary_activated_ability_cooldown_no_heal.multiplier
			}
		},
		requirements = {},
		buffs = {
			"markus_mercenary_activated_ability_cooldown_no_heal"
		},
		buff_data = {}
	},
	{
		description = "markus_mercenary_activated_ability_damage_reduction_desc",
		name = "markus_mercenary_activated_ability_damage_reduction",
		num_ranks = 1,
		icon = "markus_mercenary_activated_ability_damage_reduction",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_mercenary_activated_ability_damage_reduction.multiplier
			},
			{
				value = buff_tweak_data.markus_mercenary_activated_ability_damage_reduction.duration
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "linesman_unbalance_desc",
		name = "markus_mercenary_linesman_unbalance",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_mercenary_linesman_unbalance",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.linesman_unbalance.buffs[1].display_multiplier
			},
			{
				value_type = "percent",
				value = BuffTemplates.linesman_unbalance.buffs[1].max_display_multiplier
			}
		},
		requirements = {},
		buffs = {
			"linesman_unbalance"
		},
		buff_data = {}
	},
	{
		description = "smiter_unbalance_desc",
		name = "markus_mercenary_smiter_unbalance",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_mercenary_smiter_unbalance",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.smiter_unbalance.buffs[1].display_multiplier
			},
			{
				value_type = "percent",
				value = BuffTemplates.smiter_unbalance.buffs[1].max_display_multiplier
			}
		},
		requirements = {},
		buffs = {
			"smiter_unbalance"
		},
		buff_data = {}
	},
	{
		description = "power_level_unbalance_desc",
		name = "markus_mercenary_power_level_unbalance",
		num_ranks = 1,
		buffer = "server",
		icon = "markus_mercenary_power_level_unbalance",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.power_level_unbalance.buffs[1].multiplier
			}
		},
		requirements = {},
		buffs = {
			"power_level_unbalance"
		},
		buff_data = {}
	},
	{
		description = "markus_placeholder",
		name = "markus_placeholder"
	}
}

for name, data in pairs(TalentBuffTemplates.empire_soldier) do
	local buffs = data.buffs

	fassert(#buffs == 1, "talent buff has more than one sub buff, add multiple buffs from the talent instead")

	local buff = buffs[1]
	buff.name = name
end

BuffUtils.apply_buff_tweak_data(TalentBuffTemplates.empire_soldier, buff_tweak_data)

return

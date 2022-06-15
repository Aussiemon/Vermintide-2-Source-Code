local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")
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
	markus_huntsman_reload_speed_passive_stacks_buff = {
		multiplier = 0.05
	},
	markus_huntsman_power_on_headshot_buff = {
		max_stacks = 4,
		multiplier = 0.05,
		duration = 10
	},
	markus_huntsman_defence_buff = {
		max_stacks = 4
	},
	markus_huntsman_fast_passive = {
		presentation_multiplier = 0.3
	},
	markus_huntsman_passive_melee_kills = {
		max_sub_buff_stacks = 8
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
	markus_knight_passive_defence_aura_range = {
		multiplier = -0.15
	},
	markus_knight_vanguard = {},
	markus_knight_reaper = {},
	markus_knight_conqueror = {},
	markus_knight_power_level_impact = {
		multiplier = 0.35
	},
	markus_knight_power_level_on_stagger_elite = {
		bonus = 0.05
	},
	markus_knight_power_level_on_stagger_elite_buff = {
		duration = 10,
		multiplier = 0.15
	},
	markus_knight_cooldown_buff = {
		duration = 0.5,
		multiplier = 2
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
	markus_knight_guard_buff = {
		presentation_multiplier = 0.5,
		multiplier = -0.5
	},
	markus_knight_guard = {
		multiplier = 0.1
	},
	markus_knight_guard_defence = {
		multiplier = -0.15
	},
	markus_knight_guard_defence_buff = {
		multiplier = -0.5
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
	markus_mercenary_passive_hit_mass_reduction = {
		multiplier = -0.25
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
		multiplier = -0.2
	},
	markus_mercenary_activated_ability_damage_reduction = {
		duration = 10,
		multiplier = -0.25
	}
}
TalentBuffTemplates = TalentBuffTemplates or {}
TalentBuffTemplates.empire_soldier = {
	markus_huntsman_ability_cooldown_on_hit = {
		buffs = {
			{
				event = "on_hit",
				buff_func = "reduce_activated_ability_cooldown"
			}
		}
	},
	markus_huntsman_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken"
			}
		}
	},
	markus_huntsman_end_activated_on_ranged_hit = {
		buffs = {
			{
				event = "on_ranged_hit",
				buff_func = "end_huntsman_stealth",
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration
			}
		}
	},
	markus_huntsman_end_activated_on_melee_hit = {
		buffs = {
			{
				event = "on_hit",
				buff_func = "end_huntsman_stealth",
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration
			}
		}
	},
	markus_huntsman_passive = {
		buffs = {
			{
				event = "on_hit",
				buff_func = "markus_huntsman_passive_proc"
			}
		}
	},
	markus_huntsman_auto_headshot_remove = {
		buffs = {
			{
				deletion_delay = 0.05,
				buff_func = "mark_for_delayed_deletion",
				event = "on_auto_headshot",
				update_func = "delayed_buff_removal",
				reference_buff = "markus_huntsman_passive"
			}
		}
	},
	markus_huntsman_passive_on_headshot = {
		buffs = {
			{
				buff_to_add = "markus_huntsman_auto_headshot",
				add_delay = 0.05,
				buff_func = "add_buff_on_unmodified_headshot",
				event = "on_hit",
				update_func = "delayed_buff_add",
				reference_buff = "markus_huntsman_passive"
			}
		}
	},
	markus_huntsman_auto_headshot = {
		buffs = {
			{
				max_stacks = 10,
				icon = "markus_huntsman_passive",
				perk = buff_perks.auto_headshot
			}
		}
	},
	markus_huntsman_passive_crit_aura = {
		buffs = {
			{
				buff_to_add = "markus_huntsman_passive_crit_aura_buff",
				update_func = "activate_buff_on_distance",
				remove_buff_func = "remove_aura_buff"
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
				perk = buff_perks.no_damage_dropoff
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
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration,
				perk = buff_perks.increased_zoom
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
				duration = buff_tweak_data.markus_huntsman_activated_ability_duration.duration,
				perk = buff_perks.increased_zoom
			}
		}
	},
	markus_huntsman_end_activated_on_ranged_hit_duration = {
		buffs = {
			{
				event = "on_ranged_hit",
				buff_func = "end_huntsman_stealth",
				duration = buff_tweak_data.markus_huntsman_activated_ability_duration.duration
			}
		}
	},
	markus_huntsman_end_activated_on_melee_hit_duration = {
		buffs = {
			{
				event = "on_hit",
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
				name = "vanguard",
				multiplier = 1,
				buff_func = "heal_stagger_targets_on_melee",
				event = "on_stagger",
				perk = buff_perks.tank_healing
			}
		}
	},
	markus_huntsman_bloodlust = {
		buffs = {
			{
				name = "bloodlust",
				multiplier = 0.45,
				heal_cap = 0.25,
				buff_func = "heal_percentage_of_enemy_hp_on_melee_kill",
				event = "on_kill",
				perk = buff_perks.smiter_healing
			}
		}
	},
	markus_huntsman_conqueror = {
		buffs = {
			{
				name = "conqueror",
				multiplier = 0.2,
				range = 10,
				buff_func = "heal_other_players_percent_at_range",
				event = "on_healed_consumeable"
			}
		}
	},
	markus_huntsman_debuff_defence_on_crit = {
		buffs = {
			{
				buff_to_add = "defence_debuff_enemies",
				event = "on_critical_hit",
				buff_func = "on_hit_debuff_enemy_defence"
			}
		}
	},
	markus_huntsman_increased_damage_to_wounded_enemies = {
		buffs = {
			{
				event = "on_hit",
				buff_to_add = "defence_debuff_enemies",
				stat_buff = "increased_weapon_damage_ranged_to_wounded",
				buff_func = "on_hit_debuff_enemy_defence"
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
	markus_huntsman_headshot_no_ammo_count = {
		buffs = {
			{
				event = "on_hit",
				buff_to_add = "markus_huntsman_headshot_no_ammo_count_counter",
				buff_func = "add_buff_on_first_target_hit_range"
			}
		}
	},
	markus_huntsman_headshot_no_ammo_count_counter = {
		buffs = {
			{
				reset_on_max_stacks = true,
				max_stacks = 3,
				on_max_stacks_func = "add_remove_buffs",
				icon = "markus_huntsman_increased_damage_to_wounded_enemies",
				max_stack_data = {
					buffs_to_add = {
						"markus_huntsman_headshot_no_ammo_count_buff"
					}
				}
			}
		}
	},
	markus_huntsman_headshot_no_ammo_count_buff = {
		buffs = {
			{
				event = "on_ammo_used",
				icon = "markus_huntsman_increased_damage_to_wounded_enemies",
				max_stacks = 1,
				buff_func = "markus_huntsman_free_shot"
			}
		}
	},
	markus_huntsman_headshots_increase_reload_speed = {
		buffs = {
			{
				max_stacks = 1,
				name = "markus_huntsman_headshots_restore_health",
				event = "on_hit",
				buff_func = "markus_huntsman_increase_reload_speed"
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
				is_cooldown = true,
				icon = "markus_huntsman_passive_crit_buff_on_headshot",
				stat_buff = "critical_strike_chance",
				max_stacks = 1
			}
		}
	},
	markus_huntsman_passive_crit_buff_removal = {
		buffs = {
			{
				event = "on_critical_action",
				name = "markus_huntsman_passive_crit_buff_removal",
				buff_func = "remove_markus_huntsman_passive_crit_buff"
			}
		}
	},
	markus_huntsman_passive_temp_health_on_headshot = {
		buffs = {
			{
				event = "on_hit",
				buff_func = "heal_finesse_damage_on_ranged"
			}
		}
	},
	markus_huntsman_reload_speed_passive_stacks = {
		buffs = {
			{
				buff_to_add = "markus_huntsman_reload_speed_passive_stacks_buff",
				update_func = "set_stacks_on_stacks",
				parent_stacks_per_stack = 1,
				buff_to_check = "markus_huntsman_auto_headshot"
			}
		}
	},
	markus_huntsman_reload_speed_passive_stacks_buff = {
		buffs = {
			{
				stat_buff = "power_level_ranged",
				icon = "markus_huntsman_passive_crit_buff_on_headshot"
			}
		}
	},
	markus_huntsman_power_on_headshot = {
		buffs = {
			{
				event = "on_hit",
				buff_to_add = "markus_huntsman_power_on_headshot_buff",
				buff_func = "add_buff_on_first_target_hit_headshot"
			}
		}
	},
	markus_huntsman_power_on_headshot_buff = {
		buffs = {
			{
				icon = "markus_huntsman_damage_reduction_on_monster_kill",
				refresh_durations = true,
				stat_buff = "power_level"
			}
		}
	},
	markus_huntsman_passive_on_crit = {
		buffs = {
			{
				buff_to_add = "markus_huntsman_auto_headshot",
				buff_func = "add_buff_stack_on_melee_critical_hit",
				event = "on_hit",
				remove_buff_func = "on_crit_passive_removed",
				reference_buff = "markus_huntsman_passive"
			}
		}
	},
	markus_huntsman_passive_melee_kills = {
		buffs = {
			{
				buff_to_add = "markus_huntsman_auto_headshot",
				buff_func = "markus_huntsman_passive_on_melee_kills",
				event = "on_kill",
				counter_buff_to_add = "markus_huntsman_passive_melee_kills_counter",
				reference_buff = "markus_huntsman_passive"
			}
		}
	},
	markus_huntsman_passive_melee_kills_counter = {
		buffs = {
			{
				max_stacks = 8,
				icon = "markus_huntsman_reduced_spread",
				reset_on_max_stacks = true
			}
		}
	},
	markus_huntsman_movement_speed = {
		buffs = {
			{
				max_stacks = 1,
				remove_buff_func = "remove_movement_buff",
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			}
		}
	},
	markus_huntsman_stacking_damage_reduction_on_kills = {
		buffs = {
			{
				buff_to_add = "markus_huntsman_defence_buff",
				event = "on_kill",
				buff_func = "add_buff_stack_on_special_kill",
				max_stacks = 1,
				max_sub_buff_stacks = 4
			}
		}
	},
	markus_huntsman_defence_buff = {
		buffs = {
			{
				multiplier = -0.1,
				icon = "markus_huntsman_damage_reduction_on_monster_kill",
				stat_buff = "damage_taken"
			}
		}
	},
	markus_huntsman_defence_remove = {
		buffs = {
			{
				event = "on_damage_taken",
				buff_func = "remove_ref_buff_stack",
				reference_buff = "markus_huntsman_stacking_damage_reduction_on_kills"
			}
		}
	},
	markus_huntsman_damage_reduction_on_monster_kill = {
		buffs = {
			{
				event = "on_boss_killed",
				buff_to_add = "markus_huntsman_damage_reduction_on_monster_kill_buff",
				buff_func = "add_buff"
			}
		}
	},
	markus_huntsman_damage_reduction_on_monster_kill_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "markus_huntsman_damage_reduction_on_monster_kill",
				stat_buff = "damage_taken"
			}
		}
	},
	markus_huntsman_damage_reduction_on_monster_kill_passive = {
		buffs = {
			{
				stat_buff = "damage_taken",
				max_stacks = 1
			}
		}
	},
	markus_huntsman_ammo_on_special_kill = {
		buffs = {
			{
				event = "on_special_killed",
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
	markus_huntsman_ult_on_death = {
		buffs = {
			{
				buff_to_add = "markus_huntsman_invuln_flash",
				recharge_buff = "markus_huntsman_ult_on_death_delay",
				buff_func = "markus_huntsman_ult_on_death",
				event = "on_damage_taken",
				icon = "markus_huntsman_damage_reduction_on_monster_kill"
			}
		}
	},
	markus_huntsman_invuln_flash = {
		buffs = {
			{
				remove_buff_func = "remove_invulnd_flash",
				apply_buff_func = "add_invulnd_flash",
				duration = 1,
				perk = buff_perks.invulnerable
			}
		}
	},
	markus_huntsman_ult_on_death_delay = {
		buffs = {
			{
				buff_after_delay = true,
				name = "ult_on_death_delay",
				icon = "markus_huntsman_activated_ability_duration",
				max_stacks = 1,
				is_cooldown = true,
				duration = 120,
				refresh_durations = true,
				delayed_buff_name = "markus_huntsman_ult_on_death"
			}
		}
	},
	markus_knight_ability_cooldown_on_hit = {
		buffs = {
			{
				event = "on_hit",
				buff_func = "reduce_activated_ability_cooldown"
			}
		}
	},
	markus_knight_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken"
			}
		}
	},
	markus_knight_passive = {
		buffs = {
			{
				buff_to_add = "markus_knight_passive_defence_aura",
				update_func = "markus_knight_proximity_buff_update",
				remove_buff_func = "remove_aura_buff"
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
				perk = buff_perks.uninterruptible
			}
		}
	},
	markus_knight_vanguard = {
		buffs = {
			{
				name = "vanguard",
				multiplier = 1,
				buff_func = "heal_stagger_targets_on_melee",
				event = "on_stagger",
				perk = buff_perks.tank_healing
			}
		}
	},
	markus_knight_reaper = {
		buffs = {
			{
				multiplier = -0.05,
				name = "reaper",
				max_targets = 5,
				buff_func = "heal_damage_targets_on_melee",
				event = "on_player_damage_dealt",
				bonus = 0.25,
				perk = buff_perks.linesman_healing
			}
		}
	},
	markus_knight_conqueror = {
		buffs = {
			{
				name = "conqueror",
				multiplier = 0.2,
				range = 10,
				buff_func = "heal_other_players_percent_at_range",
				event = "on_healed_consumeable"
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
	markus_knight_cooldown_on_stagger_elite = {
		buffs = {
			{
				event = "on_stagger",
				buff_to_add = "markus_knight_cooldown_buff",
				buff_func = "markus_knight_reduce_cooldown_on_stagger",
				enemy_type = {
					"elite"
				}
			}
		}
	},
	markus_knight_cooldown_buff = {
		buffs = {
			{
				max_stacks = 1,
				name = "cooldown reduction buff",
				stat_buff = "cooldown_regen",
				refresh_durations = true
			}
		}
	},
	markus_knight_power_level_on_stagger_elite = {
		buffs = {
			{
				event = "on_stagger",
				buff_to_add = "markus_knight_power_level_on_stagger_elite_buff",
				buff_func = "buff_on_stagger_enemy",
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
				remove_buff_func = "remove_aura_buff",
				range = buff_tweak_data.markus_knight_passive.range
			}
		}
	},
	markus_knight_improved_passive_defence_aura_buff = {
		buffs = {
			{
				stacking_name = "markus_knight_passive_defence_aura",
				max_stacks = 1,
				stat_buff = "damage_taken"
			}
		}
	},
	markus_knight_passive_block_cost_aura = {
		buffs = {
			{
				buff_to_add = "markus_knight_passive_block_cost_aura_buff",
				update_func = "activate_buff_on_distance",
				range = buff_tweak_data.markus_knight_passive.range * 2
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
	markus_knight_passive_range = {
		buffs = {
			{
				buff_to_add = "markus_knight_passive_defence_aura_range",
				update_func = "activate_buff_on_distance",
				remove_buff_func = "remove_aura_buff",
				range = buff_tweak_data.markus_knight_passive.range * 2
			}
		}
	},
	markus_knight_passive_defence_aura_range = {
		buffs = {
			{
				max_stacks = 1,
				icon = "markus_knight_passive",
				stat_buff = "damage_taken"
			}
		}
	},
	markus_knight_guard_defence = {
		buffs = {
			{
				buff_to_add = "markus_knight_guard_defence_buff",
				stat_buff = "damage_taken",
				update_func = "activate_buff_on_closest_distance",
				remove_buff_func = "remove_aura_buff",
				range = buff_tweak_data.markus_knight_passive.range
			}
		}
	},
	markus_knight_guard_defence_buff = {
		buffs = {
			{
				stat_buff = "damage_taken",
				max_stacks = 1
			}
		}
	},
	markus_knight_guard = {
		buffs = {
			{
				buff_to_add = "markus_knight_passive_power_increase_buff",
				stat_buff = "power_level",
				remove_buff_func = "remove_aura_buff",
				icon = "markus_knight_passive_power_increase",
				update_func = "activate_buff_on_closest_distance",
				range = buff_tweak_data.markus_knight_passive.range
			}
		}
	},
	markus_knight_guard_buff = {
		buffs = {
			{
				max_stacks = 1,
				stat_buff = "damage_taken",
				buff_func = "markus_knight_guard_damage_taken",
				event = "on_damage_taken",
				icon = "markus_knight_passive_power_increase"
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
				apply_buff_func = "markus_hero_time_reset"
			}
		}
	},
	markus_knight_free_pushes_on_block = {
		buffs = {
			{
				event = "on_block",
				buff_to_add = "markus_knight_free_pushes_on_block_buff",
				buff_func = "add_buff"
			}
		}
	},
	markus_knight_free_pushes_on_block_buff = {
		buffs = {
			{
				icon = "markus_knight_free_pushes_on_block",
				stat_buff = "push_power",
				max_stacks = 1,
				refresh_durations = true,
				perk = buff_perks.no_push_fatigue_cost
			}
		}
	},
	markus_knight_damage_taken_ally_proximity = {
		buffs = {
			{
				buff_to_add = "markus_knight_damage_taken_ally_proximity_buff",
				range = 5,
				update_func = "activate_party_buff_stacks_on_ally_proximity",
				chunk_size = 1,
				max_stacks = 3,
				remove_buff_func = "remove_party_buff_stacks"
			}
		}
	},
	markus_knight_damage_taken_ally_proximity_buff = {
		buffs = {
			{
				stacking_name = "markus_knight_passive_defence_aura",
				icon = "markus_knight_damage_taken_ally_proximity",
				stat_buff = "damage_taken"
			}
		}
	},
	markus_knight_ability_invulnerability_buff = {
		buffs = {
			{
				icon = "markus_knight_ability_invulnerability",
				multiplier = -1,
				stat_buff = "damage_taken",
				refresh_durations = true,
				max_stacks = 1,
				duration = 5
			}
		}
	},
	markus_knight_ability_hit_target_damage_taken_blast = {
		buffs = {
			{
				event = "on_charge_ability_hit_blast",
				buff_func = "on_hit_debuff_enemy_defence"
			}
		}
	},
	markus_knight_ability_hit_target_damage_taken_charge = {
		buffs = {
			{
				event = "on_charge_ability_hit",
				buff_func = "on_hit_debuff_enemy_defence"
			}
		}
	},
	markus_knight_ability_attack_speed_enemy_hit_blast = {
		buffs = {
			{
				event = "on_charge_ability_hit_blast",
				buff_to_add = "markus_knight_ability_attack_speed_enemy_hit_buff",
				buff_func = "add_buff"
			}
		}
	},
	markus_knight_ability_attack_speed_enemy_hit_charge = {
		buffs = {
			{
				event = "on_charge_ability_hit",
				buff_to_add = "markus_knight_ability_attack_speed_enemy_hit_buff",
				buff_func = "add_buff"
			}
		}
	},
	markus_knight_ability_attack_speed_enemy_hit_buff = {
		buffs = {
			{
				refresh_durations = true,
				icon = "markus_knight_ability_attack_speed_enemy_hit",
				stat_buff = "attack_speed"
			}
		}
	},
	markus_mercenary_ability_cooldown_on_hit = {
		buffs = {
			{
				event = "on_hit",
				buff_func = "reduce_activated_ability_cooldown"
			}
		}
	},
	markus_mercenary_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken"
			}
		}
	},
	markus_mercenary_passive = {
		buffs = {
			{
				buff_to_add = "markus_mercenary_passive_proc",
				event = "on_hit",
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
				perk = buff_perks.uninterruptible_heavy
			}
		}
	},
	markus_mercenary_passive_hit_mass_reduction = {
		buffs = {
			{
				stat_buff = "hit_mass_reduction"
			}
		}
	},
	markus_mercenary_passive_proc = {
		buffs = {
			{
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
				max_targets = 5,
				buff_func = "heal_damage_targets_on_melee",
				event = "on_player_damage_dealt",
				bonus = 0.25,
				perk = buff_perks.linesman_healing
			}
		}
	},
	markus_mercenary_bloodlust = {
		buffs = {
			{
				name = "bloodlust",
				multiplier = 0.45,
				heal_cap = 0.25,
				buff_func = "heal_percentage_of_enemy_hp_on_melee_kill",
				event = "on_kill",
				perk = buff_perks.smiter_healing
			}
		}
	},
	markus_mercenary_conqueror = {
		buffs = {
			{
				name = "conqueror",
				multiplier = 0.2,
				range = 10,
				buff_func = "heal_other_players_percent_at_range",
				event = "on_healed_consumeable"
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
				buff_func = "add_buff_on_first_target_hit"
			}
		}
	},
	markus_mercenary_counter_buff = {
		buffs = {
			{
				reset_on_max_stacks = true,
				on_max_stacks_func = "add_remove_buffs",
				max_stacks = 5,
				is_cooldown = true,
				icon = "markus_mercenary_crit_count",
				max_stack_data = {
					buffs_to_add = {
						"markus_mercenary_crit_count_buff"
					}
				}
			}
		}
	},
	markus_mercenary_crit_count_buff = {
		buffs = {
			{
				event = "on_critical_action",
				icon = "markus_mercenary_crit_count",
				max_stacks = 1,
				buff_func = "dummy_function",
				remove_on_proc = true,
				priority_buff = true,
				perk = buff_perks.guaranteed_crit
			}
		}
	},
	markus_mercenary_passive_power_level = {
		buffs = {
			{
				max_stacks = 1,
				icon = "markus_mercenary_passive_power_level_on_proc",
				stat_buff = "power_level",
				refresh_durations = true
			}
		}
	},
	markus_mercenary_passive_improved = {
		buffs = {
			{
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
				max_stacks = 1,
				icon = "markus_mercenary_passive_defence_on_proc",
				stat_buff = "damage_taken",
				refresh_durations = true
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
				stat_buff = "damage_taken",
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
			"markus_huntsman_third_shot_free",
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
			"markus_huntsman_movement_speed_2",
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
			"markus_knight_damage_taken_ally_proximity",
			"markus_knight_guard"
		},
		{
			"markus_knight_charge_reset_on_incapacitated_allies",
			"markus_knight_free_pushes_on_block",
			"markus_knight_cooldown_on_stagger_elite"
		},
		{
			"markus_knight_ability_invulnerability",
			"markus_knight_wide_charge",
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
		buffer = "server",
		num_ranks = 1,
		icon = "markus_huntsman_regrowth",
		description_values = {},
		buffs = {
			"markus_huntsman_vanguard"
		}
	},
	{
		description = "bloodlust_desc_3",
		name = "markus_huntsman_bloodlust_2",
		buffer = "server",
		num_ranks = 1,
		icon = "markus_huntsman_bloodlust",
		description_values = {},
		buffs = {
			"markus_huntsman_bloodlust"
		}
	},
	{
		description = "conqueror_desc_3",
		name = "markus_huntsman_heal_share",
		buffer = "server",
		num_ranks = 1,
		icon = "markus_huntsman_conqueror",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.conqueror.buffs[1].multiplier
			}
		},
		buffs = {
			"markus_huntsman_conqueror"
		}
	},
	{
		description = "markus_huntsman_third_shot_free_desc",
		name = "markus_huntsman_third_shot_free",
		buffer = "server",
		num_ranks = 1,
		icon = "markus_huntsman_increased_damage_to_wounded_enemies",
		description_values = {},
		buffs = {
			"markus_huntsman_headshot_no_ammo_count"
		}
	},
	{
		description = "markus_huntsman_debuff_defence_on_crit_desc_2",
		name = "markus_huntsman_debuff_defence_on_crit",
		buffer = "server",
		num_ranks = 1,
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
		buffs = {
			"markus_huntsman_debuff_defence_on_crit"
		}
	},
	{
		description = "markus_huntsman_headshot_damage_desc",
		name = "markus_huntsman_headshot_damage",
		buffer = "server",
		num_ranks = 1,
		icon = "markus_huntsman_headshot_damage",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_huntsman_headshot_damage.multiplier
			}
		},
		buffs = {
			"markus_huntsman_headshot_damage"
		}
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
		buffs = {
			"markus_huntsman_headshots_increase_reload_speed"
		}
	},
	{
		description = "markus_huntsman_passive_crit_buff_on_headshot_desc",
		name = "markus_huntsman_passive_crit_buff_on_headshot",
		buffer = "both",
		num_ranks = 1,
		icon = "markus_huntsman_passive_crit_buff_on_headshot",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_huntsman_passive_crit_buff.bonus
			}
		},
		buffs = {}
	},
	{
		description = "markus_huntsman_passive_temp_health_on_headshot_desc",
		name = "markus_huntsman_passive_temp_health_on_headshot",
		buffer = "server",
		num_ranks = 1,
		icon = "markus_huntsman_reduced_spread",
		description_values = {
			{
				value = buff_tweak_data.markus_huntsman_passive_temp_health_on_headshot.bonus
			}
		},
		buffs = {
			"markus_huntsman_passive_temp_health_on_headshot"
		}
	},
	{
		description = "markus_huntsman_movement_speed_desc",
		name = "markus_huntsman_movement_speed",
		buffer = "both",
		num_ranks = 1,
		icon = "markus_huntsman_max_stamina",
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.markus_huntsman_movement_speed.multiplier
			}
		},
		buffs = {
			"markus_huntsman_movement_speed"
		}
	},
	{
		description = "markus_huntsman_movement_speed_desc_2",
		name = "markus_huntsman_movement_speed_2",
		buffer = "both",
		num_ranks = 1,
		icon = "markus_huntsman_damage_reduction_on_monster_kill",
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.markus_huntsman_movement_speed.multiplier
			},
			{
				value = buff_tweak_data.markus_huntsman_defence_buff.max_stacks
			}
		},
		buffs = {
			"markus_huntsman_stacking_damage_reduction_on_kills",
			"markus_huntsman_defence_remove"
		}
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
		buffs = {
			"markus_huntsman_ammo_on_special_kill"
		}
	},
	{
		description = "markus_huntsman_activated_ability_improved_stealth_desc",
		name = "markus_huntsman_activated_ability_improved_stealth",
		buffer = "both",
		num_ranks = 1,
		icon = "markus_huntsman_activated_ability_improved_stealth",
		description_values = {},
		buffs = {}
	},
	{
		description = "markus_huntsman_activated_ability_duration_desc",
		name = "markus_huntsman_activated_ability_duration",
		buffer = "both",
		num_ranks = 1,
		icon = "markus_huntsman_activated_ability_duration",
		description_values = {
			{
				value = buff_tweak_data.markus_huntsman_activated_ability_duration.duration
			}
		},
		buffs = {}
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
		buffs = {
			"markus_huntsman_activated_ability_cooldown"
		}
	},
	{
		description = "tank_unbalance_desc",
		name = "markus_huntsman_tank_unbalance",
		buffer = "server",
		num_ranks = 1,
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
		buffs = {
			"tank_unbalance"
		}
	},
	{
		description = "smiter_unbalance_desc",
		name = "markus_huntsman_smiter_unbalance",
		buffer = "server",
		num_ranks = 1,
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
		buffs = {
			"smiter_unbalance"
		}
	},
	{
		description = "power_level_unbalance_desc",
		name = "markus_huntsman_power_level_unbalance",
		buffer = "server",
		num_ranks = 1,
		icon = "markus_huntsman_power_level_unbalance",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.power_level_unbalance.buffs[1].multiplier
			}
		},
		buffs = {
			"power_level_unbalance"
		}
	},
	{
		description = "reaper_desc",
		name = "markus_knight_reaper",
		buffer = "server",
		num_ranks = 1,
		icon = "markus_knight_regrowth",
		description_values = {
			{
				value = BuffTemplates.reaper.buffs[1].max_targets
			}
		},
		buffs = {
			"markus_knight_reaper"
		}
	},
	{
		description = "vanguard_desc",
		name = "markus_knight_vanguard",
		buffer = "server",
		num_ranks = 1,
		icon = "markus_knight_bloodlust",
		description_values = {},
		buffs = {
			"markus_knight_vanguard"
		}
	},
	{
		description = "conqueror_desc_3",
		name = "markus_knight_heal_share",
		buffer = "server",
		num_ranks = 1,
		icon = "markus_knight_conqueror",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.conqueror.buffs[1].multiplier
			}
		},
		buffs = {
			"markus_knight_conqueror"
		}
	},
	{
		description = "markus_knight_power_level_impact_desc",
		name = "markus_knight_power_level_impact",
		buffer = "server",
		num_ranks = 1,
		icon = "markus_knight_power_level_impact",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_knight_power_level_impact.multiplier
			}
		},
		buffs = {
			"markus_knight_power_level_impact"
		}
	},
	{
		description = "markus_knight_cooldown_on_stagger_elite_desc",
		name = "markus_knight_cooldown_on_stagger_elite",
		buffer = "both",
		num_ranks = 1,
		icon = "markus_knight_improved_passive_defence_aura",
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.markus_knight_cooldown_buff.multiplier
			},
			{
				value = buff_tweak_data.markus_knight_cooldown_buff.duration
			}
		},
		buffs = {
			"markus_knight_cooldown_on_stagger_elite"
		}
	},
	{
		description = "markus_knight_power_level_on_stagger_elite_desc",
		name = "markus_knight_power_level_on_stagger_elite",
		buffer = "both",
		num_ranks = 1,
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
		buffs = {
			"markus_knight_power_level_on_stagger_elite"
		}
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
		buffs = {
			"markus_knight_attack_speed_on_push"
		}
	},
	{
		description = "markus_knight_improved_passive_defence_aura_desc",
		name = "markus_knight_improved_passive_defence_aura",
		buffer = "server",
		num_ranks = 1,
		icon = "markus_knight_improved_passive_defence_aura",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_knight_improved_passive_defence_aura_buff.multiplier
			}
		},
		buffs = {
			"markus_knight_improved_passive_defence_aura"
		}
	},
	{
		description = "markus_knight_passive_block_cost_aura_desc_2",
		name = "markus_knight_passive_block_cost_aura",
		buffer = "server",
		num_ranks = 1,
		icon = "markus_knight_passive_block_cost_aura",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_knight_passive_block_cost_aura_buff.multiplier
			}
		},
		buffs = {
			"markus_knight_passive_block_cost_aura",
			"markus_knight_passive_range"
		}
	},
	{
		description = "markus_knight_guard_desc",
		name = "markus_knight_guard",
		buffer = "both",
		num_ranks = 1,
		icon = "markus_knight_passive_power_increase",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_knight_passive_power_increase_buff.multiplier
			},
			{
				value_type = "percent",
				value = buff_tweak_data.markus_knight_guard_buff.presentation_multiplier
			},
			{
				value_type = "percent",
				value = buff_tweak_data.markus_knight_passive_power_increase_buff.multiplier
			}
		},
		buffs = {
			"markus_knight_guard",
			"markus_knight_guard_defence"
		}
	},
	{
		description = "markus_knight_charge_reset_on_incapacitated_allies_desc",
		name = "markus_knight_charge_reset_on_incapacitated_allies",
		buffer = "server",
		num_ranks = 1,
		icon = "markus_knight_movement_speed_on_incapacitated_allies",
		description_values = {},
		buffs = {
			"markus_knight_movement_speed_on_incapacitated_allies"
		}
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
		buffs = {
			"markus_knight_free_pushes_on_block"
		}
	},
	{
		description = "markus_knight_damage_taken_ally_proximity_desc_2",
		name = "markus_knight_damage_taken_ally_proximity",
		buffer = "server",
		num_ranks = 1,
		icon = "markus_knight_damage_taken_ally_proximity",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_knight_damage_taken_ally_proximity_buff.multiplier
			}
		},
		buffs = {
			"markus_knight_damage_taken_ally_proximity"
		}
	},
	{
		description = "markus_knight_ability_invulnerability_desc",
		name = "markus_knight_ability_invulnerability",
		buffer = "server",
		num_ranks = 1,
		icon = "markus_knight_ability_invulnerability",
		description_values = {
			{
				value = buff_tweak_data.markus_knight_ability_invulnerability_buff.duration
			}
		},
		buffs = {}
	},
	{
		description = "markus_knight_wide_charge_desc",
		name = "markus_knight_wide_charge",
		buffer = "server",
		num_ranks = 1,
		icon = "markus_knight_ability_hit_target_damage_taken",
		description_values = {},
		buffs = {}
	},
	{
		description = "markus_knight_ability_attack_speed_enemy_hit_desc",
		name = "markus_knight_ability_attack_speed_enemy_hit",
		buffer = "server",
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
		buffs = {
			"markus_knight_ability_attack_speed_enemy_hit_blast",
			"markus_knight_ability_attack_speed_enemy_hit_charge"
		}
	},
	{
		description = "tank_unbalance_desc",
		name = "markus_knight_tank_unbalance",
		buffer = "server",
		num_ranks = 1,
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
		buffs = {
			"tank_unbalance"
		}
	},
	{
		description = "linesman_unbalance_desc",
		name = "markus_knight_linesman_unbalance",
		buffer = "server",
		num_ranks = 1,
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
		buffs = {
			"linesman_unbalance"
		}
	},
	{
		description = "power_level_unbalance_desc",
		name = "markus_knight_power_level_unbalance",
		buffer = "server",
		num_ranks = 1,
		icon = "markus_knight_power_level_unbalance",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.power_level_unbalance.buffs[1].multiplier
			}
		},
		buffs = {
			"power_level_unbalance"
		}
	},
	{
		description = "reaper_desc",
		name = "markus_mercenary_reaper",
		buffer = "server",
		num_ranks = 1,
		icon = "markus_mercenary_regrowth",
		description_values = {
			{
				value = BuffTemplates.reaper.buffs[1].max_targets
			}
		},
		buffs = {
			"markus_mercenary_reaper"
		}
	},
	{
		description = "bloodlust_desc_3",
		name = "markus_mercenary_bloodlust_2",
		buffer = "server",
		num_ranks = 1,
		icon = "markus_mercenary_bloodlust",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.bloodlust.buffs[1].multiplier
			}
		},
		buffs = {
			"markus_mercenary_bloodlust"
		}
	},
	{
		description = "conqueror_desc_3",
		name = "markus_mercenary_heal_share",
		buffer = "server",
		num_ranks = 1,
		icon = "markus_mercenary_conqueror",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.conqueror.buffs[1].multiplier
			}
		},
		buffs = {
			"markus_mercenary_conqueror"
		}
	},
	{
		description = "markus_mercenary_increased_damage_on_enemy_proximity_desc",
		name = "markus_mercenary_increased_damage_on_enemy_proximity",
		buffer = "both",
		num_ranks = 1,
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
		buffs = {
			"markus_mercenary_increased_damage_on_enemy_proximity"
		}
	},
	{
		description = "markus_mercenary_power_level_cleave_desc",
		name = "markus_mercenary_power_level_cleave",
		buffer = "both",
		num_ranks = 1,
		icon = "markus_mercenary_power_level_cleave",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_mercenary_power_level_cleave.multiplier
			}
		},
		buffs = {
			"markus_mercenary_power_level_cleave"
		}
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
		buffs = {
			"markus_mercenary_crit_count"
		},
		perks = {
			"no_random_crits"
		}
	},
	{
		description = "markus_mercenary_passive_power_level_on_proc_desc",
		name = "markus_mercenary_passive_power_level_on_proc",
		buffer = "both",
		num_ranks = 1,
		icon = "markus_mercenary_passive_power_level_on_proc",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_mercenary_passive_power_level.multiplier
			}
		},
		buffs = {}
	},
	{
		description = "markus_mercenary_passive_group_proc_desc",
		name = "markus_mercenary_passive_group_proc",
		num_ranks = 1,
		icon = "markus_mercenary_passive_group_proc",
		description_values = {},
		buffs = {}
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
		buffs = {}
	},
	{
		description = "markus_mercenary_passive_defence_on_proc_desc",
		name = "markus_mercenary_passive_defence_on_proc",
		buffer = "both",
		num_ranks = 1,
		icon = "markus_mercenary_passive_defence_on_proc",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_mercenary_passive_defence.multiplier
			}
		},
		buffs = {}
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
		buffs = {
			"markus_mercenary_dodge_range",
			"markus_mercenary_dodge_speed"
		}
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
		buffs = {
			"markus_mercenary_max_ammo"
		}
	},
	{
		description = "markus_mercenary_activated_ability_revive_desc",
		name = "markus_mercenary_activated_ability_revive",
		num_ranks = 1,
		icon = "markus_mercenary_activated_ability_revive",
		buffs = {}
	},
	{
		description = "markus_mercenary_activated_ability_cooldown_no_heal_desc_2",
		name = "markus_mercenary_activated_ability_cooldown_no_heal",
		num_ranks = 1,
		icon = "markus_mercenary_activated_ability_cooldown_no_heal",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_mercenary_activated_ability_cooldown_no_heal.multiplier
			}
		},
		buffs = {
			"markus_mercenary_activated_ability_cooldown_no_heal"
		}
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
		buffs = {}
	},
	{
		description = "linesman_unbalance_desc",
		name = "markus_mercenary_linesman_unbalance",
		buffer = "server",
		num_ranks = 1,
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
		buffs = {
			"linesman_unbalance"
		}
	},
	{
		description = "smiter_unbalance_desc",
		name = "markus_mercenary_smiter_unbalance",
		buffer = "server",
		num_ranks = 1,
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
		buffs = {
			"smiter_unbalance"
		}
	},
	{
		description = "power_level_unbalance_desc",
		name = "markus_mercenary_power_level_unbalance",
		buffer = "server",
		num_ranks = 1,
		icon = "markus_mercenary_power_level_unbalance",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.power_level_unbalance.buffs[1].multiplier
			}
		},
		buffs = {
			"power_level_unbalance"
		}
	},
	{
		description = "markus_placeholder",
		name = "markus_placeholder"
	}
}

BuffUtils.copy_talent_buff_names(TalentBuffTemplates.empire_soldier)
BuffUtils.apply_buff_tweak_data(TalentBuffTemplates.empire_soldier, buff_tweak_data)

return

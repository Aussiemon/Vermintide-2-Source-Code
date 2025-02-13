-- chunkname: @scripts/managers/talents/talent_settings_markus.lua

local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")
local buff_tweak_data = {
	markus_huntsman_ability_cooldown_on_hit = {
		bonus = 0.3,
	},
	markus_huntsman_ability_cooldown_on_damage_taken = {
		bonus = 0.4,
	},
	markus_huntsman_passive = {
		bonus = 1,
	},
	markus_huntsman_passive_crit_aura = {
		range = 5,
	},
	markus_huntsman_passive_crit_aura_buff = {
		bonus = 0.05,
	},
	markus_huntsman_passive_increased_ammunition = {
		multiplier = 0.5,
	},
	markus_huntsman_activated_ability = {
		attack_speed_multiplier = 1,
		dodge_distance_multiplier = 0.95,
		dodge_speed_multiplier = 0.95,
		duration = 6,
		headshot_multiplier = 0.5,
		move_speed_multiplier = 0.9,
		reload_speed_multiplier = -0.4,
	},
	markus_huntsman_vanguard = {},
	markus_huntsman_bloodlust = {},
	markus_huntsman_conqueror = {},
	markus_huntsman_increased_damage_to_wounded_enemies = {
		display_health_threshold = 0.5,
		multiplier = 0.3,
	},
	markus_huntsman_headshot_damage = {
		multiplier = 0.5,
	},
	markus_huntsman_headshots_increase_reload_speed_buff = {
		duration = 5,
		multiplier = -0.2,
	},
	markus_huntsman_passive_crit_buff = {
		bonus = 0.25,
	},
	markus_huntsman_passive_temp_health_on_headshot = {
		bonus = 2,
	},
	markus_huntsman_reload_speed_passive_stacks_buff = {
		multiplier = 0.05,
	},
	markus_huntsman_power_on_headshot_buff = {
		duration = 10,
		max_stacks = 4,
		multiplier = 0.05,
	},
	markus_huntsman_defence_buff = {
		max_stacks = 4,
	},
	markus_huntsman_fast_passive = {
		presentation_multiplier = 0.3,
	},
	markus_huntsman_passive_melee_kills = {
		max_sub_buff_stacks = 8,
	},
	markus_huntsman_movement_speed = {
		multiplier = 1.1,
	},
	markus_huntsman_damage_reduction_on_monster_kill_buff = {
		display_multiplier = 0.3,
		multiplier = -0.27,
	},
	markus_huntsman_damage_reduction_on_monster_kill_passive = {
		multiplier = -0.03,
	},
	markus_huntsman_ammo_on_special_kill = {
		ammo_bonus_fraction = 0.1,
	},
	markus_huntsman_activated_ability_cooldown = {
		multiplier = -0.3,
	},
	markus_huntsman_activated_ability_duration = {
		duration = 10,
	},
	markus_knight_ability_cooldown_on_hit = {
		bonus = 0.25,
	},
	markus_knight_ability_cooldown_on_damage_taken = {
		bonus = 0.5,
	},
	markus_knight_passive = {
		range = 5,
	},
	markus_knight_passive_damage_reduction = {
		multiplier = -0.1,
	},
	markus_knight_passive_increased_stamina = {
		bonus = 2,
	},
	markus_knight_passive_defence_aura = {
		multiplier = -0.15,
	},
	markus_knight_activated_ability = {
		duration = 1.7,
	},
	markus_knight_passive_defence_aura_range = {
		multiplier = -0.15,
	},
	markus_knight_vanguard = {},
	markus_knight_reaper = {},
	markus_knight_conqueror = {},
	markus_knight_power_level_impact = {
		multiplier = 0.35,
	},
	markus_knight_power_level_on_stagger_elite = {
		bonus = 0.05,
	},
	markus_knight_power_level_on_stagger_elite_buff = {
		duration = 10,
		multiplier = 0.15,
	},
	markus_knight_cooldown_buff = {
		duration = 0.5,
		multiplier = 2,
	},
	markus_knight_attack_speed_on_push_buff = {
		duration = 3,
		multiplier = 0.15,
	},
	markus_knight_improved_passive_defence_aura_buff = {
		multiplier = -0.05,
	},
	markus_knight_passive_block_cost_aura_buff = {
		multiplier = -0.2,
	},
	markus_knight_passive_power_increase_buff = {
		multiplier = 0.1,
	},
	markus_knight_guard_buff = {
		multiplier = -0.5,
		presentation_multiplier = 0.5,
	},
	markus_knight_guard = {
		multiplier = 0.1,
	},
	markus_knight_guard_defence = {
		multiplier = -0.15,
	},
	markus_knight_guard_defence_buff = {
		multiplier = -0.5,
	},
	markus_knight_movement_speed_on_incapacitated_allies_buff = {
		multiplier = 1.3,
	},
	markus_knight_free_pushes_on_block_buff = {
		duration = 1,
	},
	markus_knight_damage_taken_ally_proximity_buff = {
		max_stacks = 3,
		multiplier = -0.05,
	},
	markus_knight_ability_invulnerability_buff = {
		duration = 3,
	},
	markus_knight_ability_hit_target_damage_taken = {
		bonus = 20,
		cdr = 0.66,
	},
	markus_knight_ability_attack_speed_enemy_hit_buff = {
		duration = 10,
		max_stacks = 10,
		multiplier = 0.03,
	},
	markus_mercenary_ability_cooldown_on_hit = {
		bonus = 0.5,
	},
	markus_mercenary_ability_cooldown_on_damage_taken = {
		bonus = 0.5,
	},
	markus_mercenary_passive = {
		targets = 3,
	},
	markus_mercenary_passive_crit_chance = {
		bonus = 0.05,
	},
	markus_mercenary_passive_hit_mass_reduction = {
		multiplier = -0.25,
	},
	markus_mercenary_passive_proc = {
		duration = 6,
		multiplier = 0.1,
	},
	markus_mercenary_reaper = {},
	markus_mercenary_bloodlust = {},
	markus_mercenary_conqueror = {},
	markus_mercenary_increased_damage_on_enemy_proximity = {
		chunk_size = 1,
		range = 3,
	},
	markus_mercenary_damage_on_enemy_proximity = {
		max_stacks = 5,
		multiplier = 0.05,
	},
	markus_mercenary_power_level_cleave = {
		multiplier = 0.5,
	},
	markus_mercenary_crit_count = {
		buff_on_stacks = 5,
	},
	markus_mercenary_passive_power_level = {
		duration = 6,
		multiplier = 0.15,
	},
	markus_mercenary_passive_improved = {
		duration = 6,
		multiplier = 0.2,
		targets = 4,
	},
	markus_mercenary_passive_defence = {
		duration = 6,
		multiplier = -0.25,
	},
	markus_mercenary_dodge_range = {
		multiplier = 1.2,
	},
	markus_mercenary_dodge_speed = {
		multiplier = 1.2,
	},
	markus_mercenary_max_ammo = {
		multiplier = 0.3,
	},
	markus_mercenary_activated_ability_cooldown_no_heal = {
		multiplier = -0.2,
	},
	markus_mercenary_activated_ability_damage_reduction = {
		duration = 10,
		multiplier = -0.25,
	},
}

TalentBuffTemplates = TalentBuffTemplates or {}
TalentBuffTemplates.empire_soldier = {
	markus_huntsman_ability_cooldown_on_hit = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown",
				event = "on_hit",
			},
		},
	},
	markus_huntsman_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken",
				event = "on_damage_taken",
			},
		},
	},
	markus_huntsman_end_activated_on_hit = {
		buffs = {
			{
				buff_func = "end_huntsman_stealth",
				event = "on_hit",
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration,
			},
		},
	},
	markus_huntsman_passive = {
		buffs = {
			{
				buff_func = "markus_huntsman_passive_proc",
				event = "on_hit",
			},
		},
	},
	markus_huntsman_auto_headshot_remove = {
		buffs = {
			{
				buff_func = "mark_for_delayed_deletion",
				deletion_delay = 0.05,
				event = "on_auto_headshot",
				reference_buff = "markus_huntsman_passive",
				update_func = "delayed_buff_removal",
			},
		},
	},
	markus_huntsman_passive_on_headshot = {
		buffs = {
			{
				add_delay = 0.05,
				buff_func = "add_buff_on_unmodified_headshot",
				buff_to_add = "markus_huntsman_auto_headshot",
				event = "on_hit",
				reference_buff = "markus_huntsman_passive",
				update_func = "delayed_buff_add",
			},
		},
	},
	markus_huntsman_auto_headshot = {
		buffs = {
			{
				icon = "markus_huntsman_passive",
				max_stacks = 10,
				perks = {
					buff_perks.auto_headshot,
				},
			},
		},
	},
	markus_huntsman_passive_crit_aura = {
		buffs = {
			{
				buff_to_add = "markus_huntsman_passive_crit_aura_buff",
				remove_buff_func = "remove_aura_buff",
				update_func = "activate_buff_on_distance",
			},
		},
	},
	markus_huntsman_passive_crit_aura_buff = {
		buffs = {
			{
				icon = "markus_huntsman_crit_aura",
				max_stacks = 1,
				stat_buff = "critical_strike_chance",
			},
		},
	},
	markus_huntsman_passive_increased_ammunition = {
		buffs = {
			{
				stat_buff = "total_ammo",
			},
		},
	},
	markus_huntsman_passive_no_damage_dropoff = {
		buffs = {
			{
				perks = {
					buff_perks.no_damage_dropoff,
				},
			},
		},
	},
	markus_huntsman_activated_ability = {
		deactivation_effect = "fx/screenspace_huntsman_skill_02",
		buffs = {
			{
				apply_buff_func = "apply_huntsman_activated_ability",
				continuous_effect = "fx/screenspace_huntsman_skill_01",
				icon = "markus_huntsman_activated_ability",
				max_stacks = 1,
				name = "markus_huntsman_activated_ability",
				refresh_durations = true,
				remove_buff_func = "end_huntsman_activated_ability",
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration,
			},
		},
	},
	markus_huntsman_activated_ability_increased_zoom = {
		buffs = {
			{
				max_stacks = 1,
				name = "markus_huntsman_activated_ability_increased_zoom",
				refresh_durations = true,
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration,
				perks = {
					buff_perks.increased_zoom,
				},
			},
		},
	},
	markus_huntsman_activated_ability_headshot_multiplier = {
		buffs = {
			{
				max_stacks = 1,
				name = "markus_huntsman_activated_ability_headshot_multiplier",
				refresh_durations = true,
				stat_buff = "headshot_multiplier",
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.headshot_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration,
			},
		},
	},
	markus_huntsman_activated_ability_increased_reload_speed = {
		buffs = {
			{
				max_stacks = 1,
				name = "markus_huntsman_activated_ability_increased_reload_speed",
				refresh_durations = true,
				stat_buff = "reload_speed",
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.reload_speed_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration,
			},
		},
	},
	markus_huntsman_activated_ability_decrease_move_speed = {
		buffs = {
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				lerp_time = 1,
				name = "markus_huntsman_activated_ability_decrease_move_speed",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.move_speed_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration,
			},
		},
	},
	markus_huntsman_activated_ability_decrease_crouch_move_speed = {
		buffs = {
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				lerp_time = 1,
				name = "markus_huntsman_activated_ability_decrease_crouch_move_speed",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"crouch_move_speed",
				},
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.move_speed_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration,
			},
		},
	},
	markus_huntsman_activated_ability_decrease_walk_move_speed = {
		buffs = {
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				lerp_time = 1,
				name = "markus_huntsman_activated_ability_decrease_walk_move_speed",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_walk_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"walk_move_speed",
				},
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.move_speed_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration,
			},
		},
	},
	markus_huntsman_activated_ability_decrease_dodge_speed = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				lerp_time = 1,
				name = "markus_huntsman_activated_ability_decrease_dodge_speed",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier",
				},
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.dodge_speed_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration,
			},
		},
	},
	markus_huntsman_activated_ability_decrease_dodge_distance = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				lerp_time = 1,
				name = "markus_huntsman_activated_ability_decrease_dodge_distance",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier",
				},
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.dodge_distance_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability.duration,
			},
		},
	},
	markus_huntsman_activated_ability_duration = {
		deactivation_effect = "fx/screenspace_huntsman_skill_02",
		buffs = {
			{
				apply_buff_func = "apply_huntsman_activated_ability",
				continuous_effect = "fx/screenspace_huntsman_skill_01",
				icon = "markus_huntsman_activated_ability",
				max_stacks = 1,
				name = "markus_huntsman_activated_ability",
				refresh_durations = true,
				remove_buff_func = "end_huntsman_activated_ability",
				duration = buff_tweak_data.markus_huntsman_activated_ability_duration.duration,
			},
		},
	},
	markus_huntsman_activated_ability_increased_zoom_duration = {
		buffs = {
			{
				max_stacks = 1,
				name = "markus_huntsman_activated_ability_increased_zoom",
				refresh_durations = true,
				duration = buff_tweak_data.markus_huntsman_activated_ability_duration.duration,
				perks = {
					buff_perks.increased_zoom,
				},
			},
		},
	},
	markus_huntsman_end_activated_on_hit_duration = {
		buffs = {
			{
				buff_func = "end_huntsman_stealth",
				event = "on_hit",
				duration = buff_tweak_data.markus_huntsman_activated_ability_duration.duration,
			},
		},
	},
	markus_huntsman_activated_ability_headshot_multiplier_duration = {
		buffs = {
			{
				max_stacks = 1,
				name = "markus_huntsman_activated_ability_headshot_multiplier",
				refresh_durations = true,
				stat_buff = "headshot_multiplier",
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.headshot_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability_duration.duration,
			},
		},
	},
	markus_huntsman_activated_ability_increased_reload_speed_duration = {
		buffs = {
			{
				max_stacks = 1,
				name = "markus_huntsman_activated_ability_increased_reload_speed",
				refresh_durations = true,
				stat_buff = "reload_speed",
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.reload_speed_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability_duration.duration,
			},
		},
	},
	markus_huntsman_activated_ability_decrease_move_speed_duration = {
		buffs = {
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				lerp_time = 1,
				name = "markus_huntsman_activated_ability_decrease_move_speed",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.move_speed_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability_duration.duration,
			},
		},
	},
	markus_huntsman_activated_ability_decrease_crouch_move_speed_duration = {
		buffs = {
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				lerp_time = 1,
				name = "markus_huntsman_activated_ability_decrease_crouch_move_speed",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_crouch_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"crouch_move_speed",
				},
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.move_speed_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability_duration.duration,
			},
		},
	},
	markus_huntsman_activated_ability_decrease_walk_move_speed_duration = {
		buffs = {
			{
				apply_buff_func = "apply_action_lerp_movement_buff",
				lerp_time = 1,
				name = "markus_huntsman_activated_ability_decrease_walk_move_speed",
				refresh_durations = true,
				remove_buff_func = "remove_action_lerp_movement_buff",
				remove_buff_name = "planted_return_to_normal_walk_movement",
				update_func = "update_charging_action_lerp_movement_buff",
				path_to_movement_setting_to_modify = {
					"walk_move_speed",
				},
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.move_speed_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability_duration.duration,
			},
		},
	},
	markus_huntsman_activated_ability_decrease_dodge_speed_duration = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				lerp_time = 1,
				name = "markus_huntsman_activated_ability_decrease_dodge_speed",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier",
				},
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.dodge_speed_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability_duration.duration,
			},
		},
	},
	markus_huntsman_activated_ability_decrease_dodge_distance_duration = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				lerp_time = 1,
				name = "markus_huntsman_activated_ability_decrease_dodge_distance",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier",
				},
				multiplier = buff_tweak_data.markus_huntsman_activated_ability.dodge_distance_multiplier,
				duration = buff_tweak_data.markus_huntsman_activated_ability_duration.duration,
			},
		},
	},
	markus_huntsman_vanguard = {
		buffs = {
			{
				buff_func = "heal_stagger_targets_on_melee",
				event = "on_stagger",
				multiplier = 1,
				name = "vanguard",
				perks = {
					buff_perks.tank_healing,
				},
			},
		},
	},
	markus_huntsman_bloodlust = {
		buffs = {
			{
				buff_func = "heal_percentage_of_enemy_hp_on_melee_kill",
				event = "on_kill",
				heal_cap = 0.25,
				multiplier = 0.45,
				name = "bloodlust",
				perks = {
					buff_perks.smiter_healing,
				},
			},
		},
	},
	markus_huntsman_conqueror = {
		buffs = {
			{
				buff_func = "heal_other_players_percent_at_range",
				event = "on_healed_consumeable",
				multiplier = 0.2,
				name = "conqueror",
				range = 10,
			},
		},
	},
	markus_huntsman_debuff_defence_on_crit = {
		buffs = {
			{
				buff_func = "on_hit_debuff_enemy_defence",
				buff_to_add = "defence_debuff_enemies",
				event = "on_critical_hit",
			},
		},
	},
	markus_huntsman_increased_damage_to_wounded_enemies = {
		buffs = {
			{
				buff_func = "on_hit_debuff_enemy_defence",
				buff_to_add = "defence_debuff_enemies",
				event = "on_hit",
				stat_buff = "increased_weapon_damage_ranged_to_wounded",
			},
		},
	},
	markus_huntsman_headshot_damage = {
		buffs = {
			{
				stat_buff = "headshot_multiplier",
			},
		},
	},
	markus_huntsman_headshot_no_ammo_count = {
		buffs = {
			{
				buff_func = "add_buff_on_first_target_hit_range",
				buff_to_add = "markus_huntsman_headshot_no_ammo_count_counter",
				event = "on_hit",
			},
		},
	},
	markus_huntsman_headshot_no_ammo_count_counter = {
		buffs = {
			{
				icon = "markus_huntsman_increased_damage_to_wounded_enemies",
				max_stacks = 3,
				on_max_stacks_func = "add_remove_buffs",
				reset_on_max_stacks = true,
				max_stack_data = {
					buffs_to_add = {
						"markus_huntsman_headshot_no_ammo_count_buff",
					},
				},
			},
		},
	},
	markus_huntsman_headshot_no_ammo_count_buff = {
		buffs = {
			{
				buff_func = "markus_huntsman_free_shot",
				event = "on_ammo_used",
				icon = "markus_huntsman_increased_damage_to_wounded_enemies",
				max_stacks = 1,
			},
		},
	},
	markus_huntsman_headshots_increase_reload_speed = {
		buffs = {
			{
				buff_func = "markus_huntsman_increase_reload_speed",
				event = "on_hit",
				max_stacks = 1,
				name = "markus_huntsman_headshots_restore_health",
			},
		},
	},
	markus_huntsman_headshots_increase_reload_speed_buff = {
		buffs = {
			{
				icon = "markus_huntsman_headshots_increase_reload_speed",
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "reload_speed",
			},
		},
	},
	markus_huntsman_passive_crit_buff = {
		buffs = {
			{
				icon = "markus_huntsman_passive_crit_buff_on_headshot",
				is_cooldown = false,
				max_stacks = 1,
				stat_buff = "critical_strike_chance",
			},
		},
	},
	markus_huntsman_passive_crit_buff_removal = {
		buffs = {
			{
				buff_func = "remove_markus_huntsman_passive_crit_buff",
				event = "on_critical_action",
				name = "markus_huntsman_passive_crit_buff_removal",
			},
		},
	},
	markus_huntsman_passive_temp_health_on_headshot = {
		buffs = {
			{
				buff_func = "heal_finesse_damage_on_ranged",
				event = "on_hit",
			},
		},
	},
	markus_huntsman_reload_speed_passive_stacks = {
		buffs = {
			{
				buff_to_add = "markus_huntsman_reload_speed_passive_stacks_buff",
				buff_to_check = "markus_huntsman_auto_headshot",
				parent_stacks_per_stack = 1,
				update_func = "set_stacks_on_stacks",
			},
		},
	},
	markus_huntsman_reload_speed_passive_stacks_buff = {
		buffs = {
			{
				icon = "markus_huntsman_passive_crit_buff_on_headshot",
				stat_buff = "power_level_ranged",
			},
		},
	},
	markus_huntsman_power_on_headshot = {
		buffs = {
			{
				buff_func = "add_buff_on_first_target_hit_headshot",
				buff_to_add = "markus_huntsman_power_on_headshot_buff",
				event = "on_hit",
			},
		},
	},
	markus_huntsman_power_on_headshot_buff = {
		buffs = {
			{
				icon = "markus_huntsman_damage_reduction_on_monster_kill",
				refresh_durations = true,
				stat_buff = "power_level",
			},
		},
	},
	markus_huntsman_passive_on_crit = {
		buffs = {
			{
				buff_func = "add_buff_stack_on_melee_critical_hit",
				buff_to_add = "markus_huntsman_auto_headshot",
				event = "on_hit",
				reference_buff = "markus_huntsman_passive",
				remove_buff_func = "on_crit_passive_removed",
			},
		},
	},
	markus_huntsman_passive_melee_kills = {
		buffs = {
			{
				buff_func = "markus_huntsman_passive_on_melee_kills",
				buff_to_add = "markus_huntsman_auto_headshot",
				counter_buff_to_add = "markus_huntsman_passive_melee_kills_counter",
				event = "on_kill",
				reference_buff = "markus_huntsman_passive",
			},
		},
	},
	markus_huntsman_passive_melee_kills_counter = {
		buffs = {
			{
				icon = "markus_huntsman_reduced_spread",
				max_stacks = 8,
				reset_on_max_stacks = true,
			},
		},
	},
	markus_huntsman_movement_speed = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				max_stacks = 1,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
		},
	},
	markus_huntsman_stacking_damage_reduction_on_kills = {
		buffs = {
			{
				buff_func = "add_buff_stack_on_special_kill",
				buff_to_add = "markus_huntsman_defence_buff",
				event = "on_kill",
				max_stacks = 1,
				max_sub_buff_stacks = 4,
			},
		},
	},
	markus_huntsman_defence_buff = {
		buffs = {
			{
				icon = "markus_huntsman_damage_reduction_on_monster_kill",
				multiplier = -0.1,
				stat_buff = "damage_taken",
			},
		},
	},
	markus_huntsman_defence_remove = {
		buffs = {
			{
				buff_func = "remove_ref_buff_stack",
				event = "on_damage_taken",
				reference_buff = "markus_huntsman_stacking_damage_reduction_on_kills",
			},
		},
	},
	markus_huntsman_damage_reduction_on_monster_kill = {
		buffs = {
			{
				buff_func = "add_buff",
				buff_to_add = "markus_huntsman_damage_reduction_on_monster_kill_buff",
				event = "on_boss_killed",
			},
		},
	},
	markus_huntsman_damage_reduction_on_monster_kill_buff = {
		buffs = {
			{
				icon = "markus_huntsman_damage_reduction_on_monster_kill",
				max_stacks = 1,
				stat_buff = "damage_taken",
			},
		},
	},
	markus_huntsman_damage_reduction_on_monster_kill_passive = {
		buffs = {
			{
				max_stacks = 1,
				stat_buff = "damage_taken",
			},
		},
	},
	markus_huntsman_ammo_on_special_kill = {
		buffs = {
			{
				buff_func = "restore_ammo_on_special_kill",
				event = "on_special_killed",
			},
		},
	},
	markus_huntsman_activated_ability_cooldown = {
		buffs = {
			{
				stat_buff = "activated_cooldown",
			},
		},
	},
	markus_huntsman_ult_on_death = {
		buffs = {
			{
				buff_func = "markus_huntsman_ult_on_death",
				buff_to_add = "markus_huntsman_invuln_flash",
				event = "on_damage_taken",
				icon = "markus_huntsman_damage_reduction_on_monster_kill",
				recharge_buff = "markus_huntsman_ult_on_death_delay",
			},
		},
	},
	markus_huntsman_invuln_flash = {
		buffs = {
			{
				apply_buff_func = "add_invulnd_flash",
				duration = 1,
				remove_buff_func = "remove_invulnd_flash",
				perks = {
					buff_perks.invulnerable,
				},
			},
		},
	},
	markus_huntsman_ult_on_death_delay = {
		buffs = {
			{
				buff_to_add = "markus_huntsman_ult_on_death",
				duration = 120,
				duration_end_func = "add_buff_local",
				icon = "markus_huntsman_activated_ability_duration",
				is_cooldown = true,
				max_stacks = 1,
				name = "ult_on_death_delay",
				refresh_durations = true,
			},
		},
	},
	markus_knight_ability_cooldown_on_hit = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown",
				event = "on_hit",
			},
		},
	},
	markus_knight_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken",
				event = "on_damage_taken",
			},
		},
	},
	markus_knight_passive = {
		buffs = {
			{
				buff_to_add = "markus_knight_passive_defence_aura",
				remove_buff_func = "remove_aura_buff",
				update_func = "markus_knight_proximity_buff_update",
			},
		},
	},
	markus_knight_passive_damage_reduction = {
		buffs = {
			{
				stat_buff = "damage_taken",
			},
		},
	},
	markus_knight_passive_increased_stamina = {
		buffs = {
			{
				stat_buff = "max_fatigue",
			},
		},
	},
	markus_knight_passive_defence_aura = {
		buffs = {
			{
				icon = "markus_knight_passive",
				max_stacks = 1,
				stat_buff = "damage_taken",
			},
		},
	},
	markus_knight_activated_ability = {
		buffs = {
			{
				icon = "markus_knight_activated_ability",
				remove_buff_func = "end_knight_activated_ability",
				perks = {
					buff_perks.uninterruptible,
				},
			},
		},
	},
	markus_knight_vanguard = {
		buffs = {
			{
				buff_func = "heal_stagger_targets_on_melee",
				event = "on_stagger",
				multiplier = 1,
				name = "vanguard",
				perks = {
					buff_perks.tank_healing,
				},
			},
		},
	},
	markus_knight_reaper = {
		buffs = {
			{
				bonus = 0.25,
				buff_func = "heal_damage_targets_on_melee",
				event = "on_player_damage_dealt",
				max_targets = 5,
				multiplier = -0.05,
				name = "reaper",
				perks = {
					buff_perks.linesman_healing,
				},
			},
		},
	},
	markus_knight_conqueror = {
		buffs = {
			{
				buff_func = "heal_other_players_percent_at_range",
				event = "on_healed_consumeable",
				multiplier = 0.2,
				name = "conqueror",
				range = 10,
			},
		},
	},
	markus_knight_power_level_impact = {
		buffs = {
			{
				stat_buff = "power_level_impact",
			},
		},
	},
	markus_knight_cooldown_on_stagger_elite = {
		buffs = {
			{
				buff_func = "markus_knight_reduce_cooldown_on_stagger",
				buff_to_add = "markus_knight_cooldown_buff",
				event = "on_stagger",
				enemy_type = {
					"elite",
				},
			},
		},
	},
	markus_knight_cooldown_buff = {
		buffs = {
			{
				max_stacks = 1,
				name = "cooldown reduction buff",
				refresh_durations = true,
				stat_buff = "cooldown_regen",
			},
		},
	},
	markus_knight_power_level_on_stagger_elite = {
		buffs = {
			{
				buff_func = "buff_on_stagger_enemy",
				buff_to_add = "markus_knight_power_level_on_stagger_elite_buff",
				event = "on_stagger",
				enemy_type = {
					"elite",
				},
			},
		},
	},
	markus_knight_power_level_on_stagger_elite_buff = {
		buffs = {
			{
				icon = "markus_knight_power_level_on_stagger_elite",
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "power_level",
			},
		},
	},
	markus_knight_attack_speed_on_push = {
		buffs = {
			{
				buff_func = "add_buff",
				buff_to_add = "markus_knight_attack_speed_on_push_buff",
				event = "on_push",
			},
		},
	},
	markus_knight_attack_speed_on_push_buff = {
		buffs = {
			{
				icon = "markus_knight_attack_speed_on_push",
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "attack_speed",
			},
		},
	},
	markus_knight_improved_passive_defence_aura = {
		buffs = {
			{
				buff_to_add = "markus_knight_improved_passive_defence_aura_buff",
				remove_buff_func = "remove_aura_buff",
				update_func = "activate_buff_on_distance",
				range = buff_tweak_data.markus_knight_passive.range,
			},
		},
	},
	markus_knight_improved_passive_defence_aura_buff = {
		buffs = {
			{
				max_stacks = 1,
				stacking_name = "markus_knight_passive_defence_aura",
				stat_buff = "damage_taken",
			},
		},
	},
	markus_knight_passive_block_cost_aura = {
		buffs = {
			{
				buff_to_add = "markus_knight_passive_block_cost_aura_buff",
				update_func = "activate_buff_on_distance",
				range = buff_tweak_data.markus_knight_passive.range * 2,
			},
		},
	},
	markus_knight_passive_block_cost_aura_buff = {
		buffs = {
			{
				max_stacks = 1,
				stat_buff = "block_cost",
			},
		},
	},
	markus_knight_passive_range = {
		buffs = {
			{
				buff_to_add = "markus_knight_passive_defence_aura_range",
				remove_buff_func = "remove_aura_buff",
				update_func = "activate_buff_on_distance",
				range = buff_tweak_data.markus_knight_passive.range * 2,
			},
		},
	},
	markus_knight_passive_defence_aura_range = {
		buffs = {
			{
				icon = "markus_knight_passive",
				max_stacks = 1,
				stat_buff = "damage_taken",
			},
		},
	},
	markus_knight_guard_defence = {
		buffs = {
			{
				buff_to_add = "markus_knight_guard_defence_buff",
				remove_buff_func = "remove_aura_buff",
				stat_buff = "damage_taken",
				update_func = "activate_buff_on_closest_distance",
				range = buff_tweak_data.markus_knight_passive.range,
			},
		},
	},
	markus_knight_guard_defence_buff = {
		buffs = {
			{
				max_stacks = 1,
				stat_buff = "damage_taken",
			},
		},
	},
	markus_knight_guard = {
		buffs = {
			{
				buff_to_add = "markus_knight_passive_power_increase_buff",
				icon = "markus_knight_passive_power_increase",
				remove_buff_func = "remove_aura_buff",
				stat_buff = "power_level",
				update_func = "activate_buff_on_closest_distance",
				range = buff_tweak_data.markus_knight_passive.range,
			},
		},
	},
	markus_knight_guard_buff = {
		buffs = {
			{
				buff_func = "markus_knight_guard_damage_taken",
				event = "on_damage_taken",
				icon = "markus_knight_passive_power_increase",
				max_stacks = 1,
				stat_buff = "damage_taken",
			},
		},
	},
	markus_knight_passive_power_increase_buff = {
		buffs = {
			{
				icon = "markus_knight_passive_power_increase",
				max_stacks = 1,
				stat_buff = "power_level",
			},
		},
	},
	markus_knight_movement_speed_on_incapacitated_allies = {
		buffs = {
			{
				buff_to_add = "markus_knight_movement_speed_on_incapacitated_allies_buff",
				update_func = "markus_knight_movespeed_on_incapacitated_ally",
			},
		},
	},
	markus_knight_movement_speed_on_incapacitated_allies_buff = {
		buffs = {
			{
				apply_buff_func = "markus_hero_time_reset",
			},
		},
	},
	markus_knight_free_pushes_on_block = {
		buffs = {
			{
				buff_func = "add_buff_local",
				buff_to_add = "markus_knight_free_pushes_on_block_buff",
				event = "on_block",
			},
		},
	},
	markus_knight_free_pushes_on_block_buff = {
		buffs = {
			{
				icon = "markus_knight_free_pushes_on_block",
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "push_power",
				perks = {
					buff_perks.no_push_fatigue_cost,
				},
			},
		},
	},
	markus_knight_damage_taken_ally_proximity = {
		buffs = {
			{
				buff_to_add = "markus_knight_damage_taken_ally_proximity_buff",
				chunk_size = 1,
				max_stacks = 3,
				range = 5,
				remove_buff_func = "remove_party_buff_stacks",
				update_func = "activate_party_buff_stacks_on_ally_proximity",
			},
		},
	},
	markus_knight_damage_taken_ally_proximity_buff = {
		buffs = {
			{
				icon = "markus_knight_damage_taken_ally_proximity",
				stacking_name = "markus_knight_passive_defence_aura",
				stat_buff = "damage_taken",
			},
		},
	},
	markus_knight_ability_invulnerability_buff = {
		buffs = {
			{
				duration = 5,
				icon = "markus_knight_ability_invulnerability",
				max_stacks = 1,
				multiplier = -1,
				refresh_durations = true,
				stat_buff = "damage_taken",
			},
		},
	},
	markus_knight_ability_hit_target_damage_taken_blast = {
		buffs = {
			{
				buff_func = "on_hit_debuff_enemy_defence",
				event = "on_charge_ability_hit_blast",
			},
		},
	},
	markus_knight_ability_hit_target_damage_taken_charge = {
		buffs = {
			{
				buff_func = "on_hit_debuff_enemy_defence",
				event = "on_charge_ability_hit",
			},
		},
	},
	markus_knight_ability_attack_speed_enemy_hit_blast = {
		buffs = {
			{
				buff_func = "add_buff",
				buff_to_add = "markus_knight_ability_attack_speed_enemy_hit_buff",
				event = "on_charge_ability_hit_blast",
			},
		},
	},
	markus_knight_ability_attack_speed_enemy_hit_charge = {
		buffs = {
			{
				buff_func = "add_buff",
				buff_to_add = "markus_knight_ability_attack_speed_enemy_hit_buff",
				event = "on_charge_ability_hit",
			},
		},
	},
	markus_knight_ability_attack_speed_enemy_hit_buff = {
		buffs = {
			{
				icon = "markus_knight_ability_attack_speed_enemy_hit",
				refresh_durations = true,
				stat_buff = "attack_speed",
			},
		},
	},
	markus_mercenary_ability_cooldown_on_hit = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown",
				event = "on_hit",
			},
		},
	},
	markus_mercenary_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken",
				event = "on_damage_taken",
			},
		},
	},
	markus_mercenary_passive = {
		buffs = {
			{
				buff_func = "gain_markus_mercenary_passive_proc",
				buff_to_add = "markus_mercenary_passive_proc",
				event = "on_hit",
			},
		},
	},
	markus_mercenary_passive_crit_chance = {
		buffs = {
			{
				stat_buff = "critical_strike_chance",
			},
		},
	},
	markus_mercenary_passive_uninterruptible_heavy = {
		buffs = {
			{
				perks = {
					buff_perks.uninterruptible_heavy,
				},
			},
		},
	},
	markus_mercenary_passive_hit_mass_reduction = {
		buffs = {
			{
				stat_buff = "hit_mass_reduction",
			},
		},
	},
	markus_mercenary_passive_proc = {
		buffs = {
			{
				icon = "markus_mercenary_passive",
				max_stacks = 1,
				priority_buff = true,
				refresh_durations = true,
				stat_buff = "attack_speed",
			},
		},
	},
	markus_mercenary_reaper = {
		buffs = {
			{
				bonus = 0.25,
				buff_func = "heal_damage_targets_on_melee",
				event = "on_player_damage_dealt",
				max_targets = 5,
				multiplier = -0.05,
				name = "reaper",
				perks = {
					buff_perks.linesman_healing,
				},
			},
		},
	},
	markus_mercenary_bloodlust = {
		buffs = {
			{
				buff_func = "heal_percentage_of_enemy_hp_on_melee_kill",
				event = "on_kill",
				heal_cap = 0.25,
				multiplier = 0.45,
				name = "bloodlust",
				perks = {
					buff_perks.smiter_healing,
				},
			},
		},
	},
	markus_mercenary_conqueror = {
		buffs = {
			{
				buff_func = "heal_other_players_percent_at_range",
				event = "on_healed_consumeable",
				multiplier = 0.2,
				name = "conqueror",
				range = 10,
			},
		},
	},
	markus_mercenary_increased_damage_on_enemy_proximity = {
		buffs = {
			{
				buff_to_add = "markus_mercenary_damage_on_enemy_proximity",
				update_func = "activate_buff_stacks_based_on_enemy_proximity",
			},
		},
	},
	markus_mercenary_damage_on_enemy_proximity = {
		buffs = {
			{
				icon = "markus_mercenary_increased_damage_on_enemy_proximity",
				stat_buff = "power_level",
			},
		},
	},
	markus_mercenary_power_level_cleave = {
		buffs = {
			{
				stat_buff = "power_level_melee_cleave",
			},
		},
	},
	markus_mercenary_crit_count = {
		buffs = {
			{
				buff_func = "add_buff_on_first_target_hit",
				buff_to_add = "markus_mercenary_counter_buff",
				event = "on_hit",
			},
		},
	},
	markus_mercenary_counter_buff = {
		buffs = {
			{
				icon = "markus_mercenary_crit_count",
				is_cooldown = true,
				max_stacks = 5,
				on_max_stacks_func = "add_remove_buffs",
				reset_on_max_stacks = true,
				max_stack_data = {
					buffs_to_add = {
						"markus_mercenary_crit_count_buff",
					},
				},
			},
		},
	},
	markus_mercenary_crit_count_buff = {
		buffs = {
			{
				buff_func = "dummy_function",
				event = "on_critical_action",
				icon = "markus_mercenary_crit_count",
				max_stacks = 1,
				priority_buff = true,
				remove_on_proc = true,
				perks = {
					buff_perks.guaranteed_crit,
				},
			},
		},
	},
	markus_mercenary_passive_power_level = {
		buffs = {
			{
				icon = "markus_mercenary_passive_power_level_on_proc",
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "power_level",
			},
		},
	},
	markus_mercenary_passive_improved = {
		buffs = {
			{
				icon = "markus_mercenary_passive_improved",
				max_stacks = 1,
				priority_buff = true,
				refresh_durations = true,
				stat_buff = "attack_speed",
			},
		},
	},
	markus_mercenary_passive_defence = {
		buffs = {
			{
				icon = "markus_mercenary_passive_defence_on_proc",
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "damage_taken",
			},
		},
	},
	markus_mercenary_dodge_range = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier",
				},
			},
		},
	},
	markus_mercenary_dodge_speed = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier",
				},
			},
		},
	},
	markus_mercenary_max_ammo = {
		buffs = {
			{
				stat_buff = "total_ammo",
			},
		},
	},
	markus_mercenary_activated_ability_cooldown_no_heal = {
		buffs = {
			{
				name = "markus_mercenary_activated_ability_cooldown_no_heal",
				stat_buff = "activated_cooldown",
			},
		},
	},
	markus_mercenary_activated_ability_damage_reduction = {
		buffs = {
			{
				icon = "markus_mercenary_activated_ability_damage_reduction",
				max_stacks = 1,
				name = "markus_mercenary_activated_ability_damage_reduction",
				refresh_durations = true,
				stat_buff = "damage_taken",
			},
		},
	},
}
TalentTrees = TalentTrees or {}
TalentTrees.empire_soldier = {
	{
		{
			"markus_huntsman_vanguard",
			"markus_huntsman_bloodlust_2",
			"markus_huntsman_heal_share",
		},
		{
			"markus_huntsman_third_shot_free",
			"markus_huntsman_debuff_defence_on_crit",
			"markus_huntsman_headshot_damage",
		},
		{
			"markus_huntsman_tank_unbalance",
			"markus_huntsman_smiter_unbalance",
			"markus_huntsman_power_level_unbalance",
		},
		{
			"markus_huntsman_headshots_increase_reload_speed",
			"markus_huntsman_passive_crit_buff_on_headshot",
			"markus_huntsman_passive_temp_health_on_headshot",
		},
		{
			"markus_huntsman_ammo_on_special_kill",
			"markus_huntsman_movement_speed_2",
			"markus_huntsman_movement_speed",
		},
		{
			"markus_huntsman_activated_ability_cooldown",
			"markus_huntsman_activated_ability_improved_stealth",
			"markus_huntsman_activated_ability_duration",
		},
	},
	{
		{
			"markus_knight_vanguard",
			"markus_knight_reaper",
			"markus_knight_heal_share",
		},
		{
			"markus_knight_power_level_impact",
			"markus_knight_power_level_on_stagger_elite",
			"markus_knight_attack_speed_on_push",
		},
		{
			"markus_knight_tank_unbalance",
			"markus_knight_linesman_unbalance",
			"markus_knight_power_level_unbalance",
		},
		{
			"markus_knight_passive_block_cost_aura",
			"markus_knight_damage_taken_ally_proximity",
			"markus_knight_guard",
		},
		{
			"markus_knight_charge_reset_on_incapacitated_allies",
			"markus_knight_free_pushes_on_block",
			"markus_knight_cooldown_on_stagger_elite",
		},
		{
			"markus_knight_ability_invulnerability",
			"markus_knight_wide_charge",
			"markus_knight_ability_attack_speed_enemy_hit",
		},
	},
	{
		{
			"markus_mercenary_reaper",
			"markus_mercenary_bloodlust_2",
			"markus_mercenary_heal_share",
		},
		{
			"markus_mercenary_increased_damage_on_enemy_proximity",
			"markus_mercenary_power_level_cleave",
			"markus_mercenary_crit_count",
		},
		{
			"markus_mercenary_linesman_unbalance",
			"markus_mercenary_smiter_unbalance",
			"markus_mercenary_power_level_unbalance",
		},
		{
			"markus_mercenary_passive_power_level_on_proc",
			"markus_mercenary_passive_improved",
			"markus_mercenary_passive_group_proc",
		},
		{
			"markus_mercenary_dodge_range",
			"markus_mercenary_passive_defence_on_proc",
			"markus_mercenary_max_ammo",
		},
		{
			"markus_mercenary_activated_ability_damage_reduction",
			"markus_mercenary_activated_ability_cooldown_no_heal",
			"markus_mercenary_activated_ability_revive",
		},
	},
}
Talents.empire_soldier = {
	{
		buffer = "server",
		description = "vanguard_desc",
		icon = "markus_huntsman_regrowth",
		name = "markus_huntsman_vanguard",
		num_ranks = 1,
		description_values = {},
		buffs = {
			"markus_huntsman_vanguard",
		},
	},
	{
		buffer = "server",
		description = "bloodlust_desc_3",
		icon = "markus_huntsman_bloodlust",
		name = "markus_huntsman_bloodlust_2",
		num_ranks = 1,
		description_values = {},
		buffs = {
			"markus_huntsman_bloodlust",
		},
	},
	{
		buffer = "server",
		description = "conqueror_desc_3",
		icon = "markus_huntsman_conqueror",
		name = "markus_huntsman_heal_share",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("conqueror", "adventure").buffs[1].multiplier,
			},
		},
		buffs = {
			"markus_huntsman_conqueror",
		},
	},
	{
		buffer = "server",
		description = "markus_huntsman_third_shot_free_desc",
		icon = "markus_huntsman_increased_damage_to_wounded_enemies",
		name = "markus_huntsman_third_shot_free",
		num_ranks = 1,
		description_values = {},
		buffs = {
			"markus_huntsman_headshot_no_ammo_count",
		},
	},
	{
		buffer = "server",
		description = "markus_huntsman_debuff_defence_on_crit_desc_2",
		icon = "markus_huntsman_debuff_defence_on_crit",
		name = "markus_huntsman_debuff_defence_on_crit",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("defence_debuff_enemies", "adventure").buffs[1].multiplier,
			},
			{
				value = BuffUtils.get_buff_template("defence_debuff_enemies", "adventure").buffs[1].duration,
			},
		},
		buffs = {
			"markus_huntsman_debuff_defence_on_crit",
		},
	},
	{
		buffer = "server",
		description = "markus_huntsman_headshot_damage_desc",
		icon = "markus_huntsman_headshot_damage",
		name = "markus_huntsman_headshot_damage",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_huntsman_headshot_damage.multiplier,
			},
		},
		buffs = {
			"markus_huntsman_headshot_damage",
		},
	},
	{
		description = "markus_huntsman_headshots_increase_reload_speed_desc",
		icon = "markus_huntsman_headshots_increase_reload_speed",
		name = "markus_huntsman_headshots_increase_reload_speed",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_huntsman_headshots_increase_reload_speed_buff.multiplier,
			},
			{
				value = buff_tweak_data.markus_huntsman_headshots_increase_reload_speed_buff.duration,
			},
		},
		buffs = {
			"markus_huntsman_headshots_increase_reload_speed",
		},
	},
	{
		buffer = "both",
		description = "markus_huntsman_passive_crit_buff_on_headshot_desc",
		icon = "markus_huntsman_passive_crit_buff_on_headshot",
		name = "markus_huntsman_passive_crit_buff_on_headshot",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_huntsman_passive_crit_buff.bonus,
			},
		},
		buffs = {},
	},
	{
		buffer = "server",
		description = "markus_huntsman_passive_temp_health_on_headshot_desc",
		icon = "markus_huntsman_reduced_spread",
		name = "markus_huntsman_passive_temp_health_on_headshot",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.markus_huntsman_passive_temp_health_on_headshot.bonus,
			},
		},
		buffs = {
			"markus_huntsman_passive_temp_health_on_headshot",
		},
	},
	{
		buffer = "both",
		description = "markus_huntsman_movement_speed_desc",
		icon = "markus_huntsman_max_stamina",
		name = "markus_huntsman_movement_speed",
		num_ranks = 1,
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.markus_huntsman_movement_speed.multiplier,
			},
		},
		buffs = {
			"markus_huntsman_movement_speed",
		},
	},
	{
		buffer = "both",
		description = "markus_huntsman_movement_speed_desc_2",
		icon = "markus_huntsman_damage_reduction_on_monster_kill",
		name = "markus_huntsman_movement_speed_2",
		num_ranks = 1,
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.markus_huntsman_movement_speed.multiplier,
			},
			{
				value = buff_tweak_data.markus_huntsman_defence_buff.max_stacks,
			},
		},
		buffs = {
			"markus_huntsman_stacking_damage_reduction_on_kills",
			"markus_huntsman_defence_remove",
		},
	},
	{
		description = "markus_huntsman_ammo_on_special_kill_desc",
		icon = "markus_huntsman_ammo_on_special_kill",
		name = "markus_huntsman_ammo_on_special_kill",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_huntsman_ammo_on_special_kill.ammo_bonus_fraction,
			},
		},
		buffs = {
			"markus_huntsman_ammo_on_special_kill",
		},
	},
	{
		buffer = "both",
		description = "markus_huntsman_activated_ability_improved_stealth_desc",
		icon = "markus_huntsman_activated_ability_improved_stealth",
		name = "markus_huntsman_activated_ability_improved_stealth",
		num_ranks = 1,
		description_values = {},
		buffs = {},
	},
	{
		buffer = "both",
		description = "markus_huntsman_activated_ability_duration_desc",
		icon = "markus_huntsman_activated_ability_duration",
		name = "markus_huntsman_activated_ability_duration",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.markus_huntsman_activated_ability_duration.duration,
			},
		},
		buffs = {},
	},
	{
		description = "markus_huntsman_activated_ability_cooldown_desc",
		icon = "markus_huntsman_activated_ability_cooldown",
		name = "markus_huntsman_activated_ability_cooldown",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_huntsman_activated_ability_cooldown.multiplier,
			},
		},
		buffs = {
			"markus_huntsman_activated_ability_cooldown",
		},
	},
	{
		buffer = "server",
		description = "tank_unbalance_desc",
		icon = "markus_huntsman_tank_unbalance",
		name = "markus_huntsman_tank_unbalance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("tank_unbalance_buff", "adventure").buffs[1].bonus,
			},
			{
				value = BuffUtils.get_buff_template("tank_unbalance_buff", "adventure").buffs[1].duration,
			},
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("tank_unbalance", "adventure").buffs[1].display_multiplier,
			},
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("tank_unbalance", "adventure").buffs[1].max_display_multiplier,
			},
		},
		buffs = {
			"tank_unbalance",
		},
	},
	{
		buffer = "server",
		description = "smiter_unbalance_desc",
		icon = "markus_huntsman_smiter_unbalance",
		name = "markus_huntsman_smiter_unbalance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("smiter_unbalance", "adventure").buffs[1].display_multiplier,
			},
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("smiter_unbalance", "adventure").buffs[1].max_display_multiplier,
			},
		},
		buffs = {
			"smiter_unbalance",
		},
	},
	{
		buffer = "server",
		description = "power_level_unbalance_desc",
		icon = "markus_huntsman_power_level_unbalance",
		name = "markus_huntsman_power_level_unbalance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("power_level_unbalance", "adventure").buffs[1].multiplier,
			},
		},
		buffs = {
			"power_level_unbalance",
		},
	},
	{
		buffer = "server",
		description = "reaper_desc",
		icon = "markus_knight_regrowth",
		name = "markus_knight_reaper",
		num_ranks = 1,
		description_values = {
			{
				value = BuffUtils.get_buff_template("reaper", "adventure").buffs[1].max_targets,
			},
		},
		buffs = {
			"markus_knight_reaper",
		},
	},
	{
		buffer = "server",
		description = "vanguard_desc",
		icon = "markus_knight_bloodlust",
		name = "markus_knight_vanguard",
		num_ranks = 1,
		description_values = {},
		buffs = {
			"markus_knight_vanguard",
		},
	},
	{
		buffer = "server",
		description = "conqueror_desc_3",
		icon = "markus_knight_conqueror",
		name = "markus_knight_heal_share",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("conqueror", "adventure").buffs[1].multiplier,
			},
		},
		buffs = {
			"markus_knight_conqueror",
		},
	},
	{
		buffer = "server",
		description = "markus_knight_power_level_impact_desc",
		icon = "markus_knight_power_level_impact",
		name = "markus_knight_power_level_impact",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_knight_power_level_impact.multiplier,
			},
		},
		buffs = {
			"markus_knight_power_level_impact",
		},
	},
	{
		buffer = "both",
		description = "markus_knight_cooldown_on_stagger_elite_desc",
		icon = "markus_knight_improved_passive_defence_aura",
		name = "markus_knight_cooldown_on_stagger_elite",
		num_ranks = 1,
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.markus_knight_cooldown_buff.multiplier,
			},
			{
				value = buff_tweak_data.markus_knight_cooldown_buff.duration,
			},
		},
		buffs = {
			"markus_knight_cooldown_on_stagger_elite",
		},
	},
	{
		buffer = "both",
		description = "markus_knight_power_level_on_stagger_elite_desc",
		icon = "markus_knight_power_level_on_stagger_elite",
		name = "markus_knight_power_level_on_stagger_elite",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_knight_power_level_on_stagger_elite_buff.multiplier,
			},
			{
				value = buff_tweak_data.markus_knight_power_level_on_stagger_elite_buff.duration,
			},
		},
		buffs = {
			"markus_knight_power_level_on_stagger_elite",
		},
	},
	{
		description = "markus_knight_attack_speed_on_push_desc",
		icon = "markus_knight_attack_speed_on_push",
		name = "markus_knight_attack_speed_on_push",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_knight_attack_speed_on_push_buff.multiplier,
			},
			{
				value = buff_tweak_data.markus_knight_attack_speed_on_push_buff.duration,
			},
		},
		buffs = {
			"markus_knight_attack_speed_on_push",
		},
	},
	{
		buffer = "server",
		description = "markus_knight_improved_passive_defence_aura_desc",
		icon = "markus_knight_improved_passive_defence_aura",
		name = "markus_knight_improved_passive_defence_aura",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_knight_improved_passive_defence_aura_buff.multiplier,
			},
		},
		buffs = {
			"markus_knight_improved_passive_defence_aura",
		},
	},
	{
		buffer = "server",
		description = "markus_knight_passive_block_cost_aura_desc_2",
		icon = "markus_knight_passive_block_cost_aura",
		name = "markus_knight_passive_block_cost_aura",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_knight_passive_block_cost_aura_buff.multiplier,
			},
		},
		buffs = {
			"markus_knight_passive_block_cost_aura",
			"markus_knight_passive_range",
		},
	},
	{
		buffer = "both",
		description = "markus_knight_guard_desc",
		icon = "markus_knight_passive_power_increase",
		name = "markus_knight_guard",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_knight_passive_power_increase_buff.multiplier,
			},
			{
				value_type = "percent",
				value = buff_tweak_data.markus_knight_guard_buff.presentation_multiplier,
			},
			{
				value_type = "percent",
				value = buff_tweak_data.markus_knight_passive_power_increase_buff.multiplier,
			},
		},
		buffs = {
			"markus_knight_guard",
			"markus_knight_guard_defence",
		},
	},
	{
		buffer = "server",
		description = "markus_knight_charge_reset_on_incapacitated_allies_desc",
		icon = "markus_knight_movement_speed_on_incapacitated_allies",
		name = "markus_knight_charge_reset_on_incapacitated_allies",
		num_ranks = 1,
		description_values = {},
		buffs = {
			"markus_knight_movement_speed_on_incapacitated_allies",
		},
	},
	{
		description = "markus_knight_free_pushes_on_block_desc",
		icon = "markus_knight_free_pushes_on_block",
		name = "markus_knight_free_pushes_on_block",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.markus_knight_free_pushes_on_block_buff.duration,
			},
		},
		buffs = {
			"markus_knight_free_pushes_on_block",
		},
	},
	{
		buffer = "server",
		description = "markus_knight_damage_taken_ally_proximity_desc_2",
		icon = "markus_knight_damage_taken_ally_proximity",
		name = "markus_knight_damage_taken_ally_proximity",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_knight_damage_taken_ally_proximity_buff.multiplier,
			},
		},
		buffs = {
			"markus_knight_damage_taken_ally_proximity",
		},
	},
	{
		buffer = "server",
		description = "markus_knight_ability_invulnerability_desc",
		icon = "markus_knight_ability_invulnerability",
		name = "markus_knight_ability_invulnerability",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.markus_knight_ability_invulnerability_buff.duration,
			},
		},
		buffs = {},
	},
	{
		buffer = "server",
		description = "markus_knight_wide_charge_desc",
		icon = "markus_knight_ability_hit_target_damage_taken",
		name = "markus_knight_wide_charge",
		num_ranks = 1,
		description_values = {},
		buffs = {},
	},
	{
		buffer = "server",
		description = "markus_knight_ability_attack_speed_enemy_hit_desc",
		icon = "markus_knight_ability_attack_speed_enemy_hit",
		name = "markus_knight_ability_attack_speed_enemy_hit",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_knight_ability_attack_speed_enemy_hit_buff.multiplier,
			},
			{
				value = buff_tweak_data.markus_knight_ability_attack_speed_enemy_hit_buff.duration,
			},
			{
				value = buff_tweak_data.markus_knight_ability_attack_speed_enemy_hit_buff.max_stacks,
			},
		},
		buffs = {
			"markus_knight_ability_attack_speed_enemy_hit_blast",
			"markus_knight_ability_attack_speed_enemy_hit_charge",
		},
	},
	{
		buffer = "server",
		description = "tank_unbalance_desc",
		icon = "markus_knight_tank_unbalance",
		name = "markus_knight_tank_unbalance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("tank_unbalance_buff", "adventure").buffs[1].bonus,
			},
			{
				value = BuffUtils.get_buff_template("tank_unbalance_buff", "adventure").buffs[1].duration,
			},
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("tank_unbalance", "adventure").buffs[1].display_multiplier,
			},
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("tank_unbalance", "adventure").buffs[1].max_display_multiplier,
			},
		},
		buffs = {
			"tank_unbalance",
		},
	},
	{
		buffer = "server",
		description = "linesman_unbalance_desc",
		icon = "markus_knight_linesman_unbalance",
		name = "markus_knight_linesman_unbalance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("linesman_unbalance", "adventure").buffs[1].display_multiplier,
			},
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("linesman_unbalance", "adventure").buffs[1].max_display_multiplier,
			},
		},
		buffs = {
			"linesman_unbalance",
		},
	},
	{
		buffer = "server",
		description = "power_level_unbalance_desc",
		icon = "markus_knight_power_level_unbalance",
		name = "markus_knight_power_level_unbalance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("power_level_unbalance", "adventure").buffs[1].multiplier,
			},
		},
		buffs = {
			"power_level_unbalance",
		},
	},
	{
		buffer = "server",
		description = "reaper_desc",
		icon = "markus_mercenary_regrowth",
		name = "markus_mercenary_reaper",
		num_ranks = 1,
		description_values = {
			{
				value = BuffUtils.get_buff_template("reaper", "adventure").buffs[1].max_targets,
			},
		},
		buffs = {
			"markus_mercenary_reaper",
		},
	},
	{
		buffer = "server",
		description = "bloodlust_desc_3",
		icon = "markus_mercenary_bloodlust",
		name = "markus_mercenary_bloodlust_2",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("bloodlust", "adventure").buffs[1].multiplier,
			},
		},
		buffs = {
			"markus_mercenary_bloodlust",
		},
	},
	{
		buffer = "server",
		description = "conqueror_desc_3",
		icon = "markus_mercenary_conqueror",
		name = "markus_mercenary_heal_share",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("conqueror", "adventure").buffs[1].multiplier,
			},
		},
		buffs = {
			"markus_mercenary_conqueror",
		},
	},
	{
		buffer = "both",
		description = "markus_mercenary_increased_damage_on_enemy_proximity_desc",
		icon = "markus_mercenary_increased_damage_on_enemy_proximity",
		name = "markus_mercenary_increased_damage_on_enemy_proximity",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_mercenary_damage_on_enemy_proximity.multiplier,
			},
			{
				value = buff_tweak_data.markus_mercenary_damage_on_enemy_proximity.max_stacks,
			},
		},
		buffs = {
			"markus_mercenary_increased_damage_on_enemy_proximity",
		},
	},
	{
		buffer = "both",
		description = "markus_mercenary_power_level_cleave_desc",
		icon = "markus_mercenary_power_level_cleave",
		name = "markus_mercenary_power_level_cleave",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_mercenary_power_level_cleave.multiplier,
			},
		},
		buffs = {
			"markus_mercenary_power_level_cleave",
		},
	},
	{
		description = "markus_mercenary_crit_count_desc",
		icon = "markus_mercenary_crit_count",
		name = "markus_mercenary_crit_count",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.markus_mercenary_crit_count.buff_on_stacks,
			},
		},
		buffs = {
			"markus_mercenary_crit_count",
		},
		perks = {
			"no_random_crits",
		},
	},
	{
		buffer = "both",
		description = "markus_mercenary_passive_power_level_on_proc_desc",
		icon = "markus_mercenary_passive_power_level_on_proc",
		name = "markus_mercenary_passive_power_level_on_proc",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_mercenary_passive_power_level.multiplier,
			},
		},
		buffs = {},
	},
	{
		description = "markus_mercenary_passive_group_proc_desc",
		icon = "markus_mercenary_passive_group_proc",
		name = "markus_mercenary_passive_group_proc",
		num_ranks = 1,
		description_values = {},
		buffs = {},
	},
	{
		description = "markus_mercenary_passive_improved_desc",
		icon = "markus_mercenary_passive_improved",
		name = "markus_mercenary_passive_improved",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_mercenary_passive_improved.multiplier,
			},
			{
				value = buff_tweak_data.markus_mercenary_passive_improved.targets,
			},
		},
		buffs = {},
	},
	{
		buffer = "both",
		description = "markus_mercenary_passive_defence_on_proc_desc",
		icon = "markus_mercenary_passive_defence_on_proc",
		name = "markus_mercenary_passive_defence_on_proc",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_mercenary_passive_defence.multiplier,
			},
		},
		buffs = {},
	},
	{
		description = "markus_mercenary_dodge_range_desc",
		icon = "markus_mercenary_activated_ability_improved_healing",
		name = "markus_mercenary_dodge_range",
		num_ranks = 1,
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.markus_mercenary_dodge_range.multiplier,
			},
		},
		buffs = {
			"markus_mercenary_dodge_range",
			"markus_mercenary_dodge_speed",
		},
	},
	{
		description = "markus_mercenary_max_ammo_desc",
		icon = "markus_mercenary_max_ammo",
		name = "markus_mercenary_max_ammo",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_mercenary_max_ammo.multiplier,
			},
		},
		buffs = {
			"markus_mercenary_max_ammo",
		},
	},
	{
		description = "markus_mercenary_activated_ability_revive_desc",
		icon = "markus_mercenary_activated_ability_revive",
		name = "markus_mercenary_activated_ability_revive",
		num_ranks = 1,
		buffs = {},
	},
	{
		description = "markus_mercenary_activated_ability_cooldown_no_heal_desc_2",
		icon = "markus_mercenary_activated_ability_cooldown_no_heal",
		name = "markus_mercenary_activated_ability_cooldown_no_heal",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_mercenary_activated_ability_cooldown_no_heal.multiplier,
			},
		},
		buffs = {
			"markus_mercenary_activated_ability_cooldown_no_heal",
		},
	},
	{
		description = "markus_mercenary_activated_ability_damage_reduction_desc",
		icon = "markus_mercenary_activated_ability_damage_reduction",
		name = "markus_mercenary_activated_ability_damage_reduction",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.markus_mercenary_activated_ability_damage_reduction.multiplier,
			},
			{
				value = buff_tweak_data.markus_mercenary_activated_ability_damage_reduction.duration,
			},
		},
		buffs = {},
	},
	{
		buffer = "server",
		description = "linesman_unbalance_desc",
		icon = "markus_mercenary_linesman_unbalance",
		name = "markus_mercenary_linesman_unbalance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("linesman_unbalance", "adventure").buffs[1].display_multiplier,
			},
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("linesman_unbalance", "adventure").buffs[1].max_display_multiplier,
			},
		},
		buffs = {
			"linesman_unbalance",
		},
	},
	{
		buffer = "server",
		description = "smiter_unbalance_desc",
		icon = "markus_mercenary_smiter_unbalance",
		name = "markus_mercenary_smiter_unbalance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("smiter_unbalance", "adventure").buffs[1].display_multiplier,
			},
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("smiter_unbalance", "adventure").buffs[1].max_display_multiplier,
			},
		},
		buffs = {
			"smiter_unbalance",
		},
	},
	{
		buffer = "server",
		description = "power_level_unbalance_desc",
		icon = "markus_mercenary_power_level_unbalance",
		name = "markus_mercenary_power_level_unbalance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("power_level_unbalance", "adventure").buffs[1].multiplier,
			},
		},
		buffs = {
			"power_level_unbalance",
		},
	},
	{
		description = "markus_placeholder",
		name = "markus_placeholder",
	},
}

BuffUtils.copy_talent_buff_names(TalentBuffTemplates.empire_soldier)
BuffUtils.apply_buff_tweak_data(TalentBuffTemplates.empire_soldier, buff_tweak_data)

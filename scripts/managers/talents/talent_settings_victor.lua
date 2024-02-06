-- chunkname: @scripts/managers/talents/talent_settings_victor.lua

local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")
local buff_tweak_data = {
	victor_zealot_ability_cooldown_on_hit = {
		bonus = 0.5,
	},
	victor_zealot_ability_cooldown_on_damage_taken = {
		bonus = 0.2,
	},
	victor_zealot_passive_increased_damage = {
		chunk_size = 25,
	},
	victor_zealot_passive_damage = {
		description_stacks = 6,
		multiplier = 0.05,
	},
	victor_zealot_passive_attack_speed_aura_buff = {
		multiplier = 0.05,
	},
	victor_zealot_passive_attack_speed_aura = {
		range = 5,
	},
	victor_zealot_invulnerability_cooldown = {
		duration = 120,
	},
	victor_zealot_invulnerability_on_lethal_damage_taken = {
		duration = 5,
		multiplier = -1,
	},
	victor_zealot_activated_ability = {
		duration = 5,
		multiplier = 0.25,
	},
	victor_zealot_reaper = {},
	victor_zealot_bloodlust = {},
	victor_zealot_conqueror = {},
	victor_zealot_crit_count = {
		buff_on_stacks = 5,
	},
	victor_zealot_power = {
		multiplier = 0.05,
	},
	victor_zealot_attack_speed_on_health_percent_buff = {
		max_stacks = 2,
		multiplier = 0.1,
	},
	victor_zealot_attack_speed_on_health_percent = {
		threshold_1 = 0.5,
		threshold_2 = 0.2,
	},
	victor_zealot_passive_move_speed_buff = {
		multiplier = 1.05,
	},
	victor_zealot_passive_healing_received_buff = {
		multiplier = 0.15,
	},
	victor_zealot_passive_damage_taken_buff = {
		multiplier = -0.05,
	},
	victor_zealot_move_speed_on_damage_taken_buff = {
		duration = 2,
		multiplier = 1.3,
	},
	victor_zealot_reduced_damage_taken_buff = {
		multiplier = -0.1,
	},
	victor_zealot_activated_ability_power_on_hit_buff = {
		duration = 5,
		max_stacks = 10,
		multiplier = 0.02,
	},
	victor_zealot_activated_ability_cooldown_stack_on_hit_buff = {
		cooldown_amount = 0.05,
		max_stacks = 10,
	},
	victor_bountyhunter_ability_cooldown_on_hit = {
		bonus = 0.25,
	},
	victor_bountyhunter_ability_cooldown_on_damage_taken = {
		bonus = 0.3,
	},
	victor_bountyhunter_passive_crit_buff = {
		bonus = 1,
	},
	victor_bountyhunter_passive_reload_speed = {
		multiplier = -0.2,
	},
	victor_bountyhunter_passive_crit_cooldown = {
		duration = 10,
	},
	victor_bountyhunter_passive_increased_ammunition = {
		multiplier = 0.5,
	},
	victor_bountyhunter_regrowth = {},
	victor_bountyhunter_bloodlust = {},
	victor_bountyhunter_conqueror = {},
	victor_bountyhunter_melee_damage_on_no_ammo_buff = {
		multiplier = 0.25,
	},
	victor_bountyhunter_power_level_on_clip_size_buff = {
		multiplier = 0.01,
	},
	victor_bountyhunter_attack_speed_on_no_ammo_buff = {
		duration = 15,
		multiplier = 0.15,
	},
	victor_bountyhunter_power_on_no_ammo_buff = {
		duration = 15,
		multiplier = 0.15,
	},
	victor_bountyhunter_blessed_melee_damage_buff = {
		multiplier = 0.15,
		presentation_stacks = 6,
	},
	victor_bountyhunter_blessed_ranged_damage_buff = {
		multiplier = 0.15,
		presentation_stacks = 6,
	},
	victor_bountyhunter_passive_reduced_cooldown = {
		duration = 6,
	},
	victor_bountyhunter_party_movespeed_on_ranged_crit_buff = {
		duration = 10,
		multiplier = 1.1,
	},
	victor_bountyhunter_restore_ammo_on_elite_kill = {
		ammo_bonus_fraction = 0.2,
	},
	victor_bountyhunter_stacking_damage_reduction_on_elite_or_special_kill_buff = {
		max_stacks = 30,
		multiplier = -0.01,
	},
	victor_bountyhunter_activated_ability_passive_cooldown_reduction = {
		cooldown = 10,
		multiplier = 0.2,
	},
	victor_bountyhunter_activated_ability_blast_shotgun = {
		multiplier = -0.25,
		required_target_number = 4,
	},
	victor_bountyhunter_activated_ability_railgun = {
		multiplier = 0.6,
	},
	victor_bountyhunter_activated_ability_reset_cooldown_on_stacks = {
		multiplier = 0.02,
	},
	victor_bountyhunter_activated_ability_reset_cooldown_on_stacks_buff = {
		max_stacks = 25,
		multiplier = 0.02,
	},
	victor_witchhunter_ability_cooldown_on_hit = {
		bonus = 0.5,
	},
	victor_witchhunter_ability_cooldown_on_damage_taken = {
		bonus = 0.2,
	},
	victor_witchhunter_passive_debuff = {
		multiplier = 0.2,
	},
	victor_witchhunter_passive_block_cost_reduction = {
		multiplier = -1,
	},
	victor_witchhunter_passive_dodge_range = {
		multiplier = 1.1,
	},
	victor_witchhunter_passive_dodge_speed = {
		multiplier = 1.1,
	},
	victor_witchhunter_headshot_multiplier_increase = {
		multiplier = 0.25,
	},
	victor_witchhunter_activated_ability_crit_buff = {
		bonus = 0.25,
		duration = 6,
		max_stacks = 1,
	},
	victor_witchhunter_regrowth = {},
	victor_witchhunter_reaper = {},
	victor_witchhunter_conqueror = {},
	victor_witchhunter_headshot_damage_increase = {
		multiplier = 0.5,
	},
	victor_witchhunter_guaranteed_crit_on_timed_block_buff = {
		bonus = 1,
		duration = 2,
	},
	victor_witchhunter_ping_target_crit_chance = {
		bonus = 0.05,
		duration = 5,
	},
	victor_witchhunter_attack_speed_on_enemy_pinged_buff = {
		duration = 15,
		multiplier = 0.1,
	},
	victor_witchhunter_improved_damage_taken_ping = {
		duration = 5,
		multiplier = 0.05,
	},
	victor_witchhunter_max_ammo = {
		multiplier = 0.3,
	},
	victor_witchhunter_stamina_regen_on_push_buff = {
		duration = 2,
		multiplier = 0.4,
	},
	victor_witchhunter_dodge_range = {
		multiplier = 1.2,
	},
	victor_witchhunter_dodge_speed = {
		multiplier = 1.2,
	},
	victor_witchhunter_activated_ability_guaranteed_crit_self_buff = {
		bonus = 1,
		duration = 6,
	},
	victor_witchhunter_activated_ability_refund_cooldown_on_enemies_hit = {
		cooldown_reduction = 0.4,
		required_targets = 10,
	},
}

TalentBuffTemplates = TalentBuffTemplates or {}
TalentBuffTemplates.witch_hunter = {
	victor_zealot_ability_cooldown_on_hit = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown",
				event = "on_hit",
			},
		},
	},
	victor_zealot_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken",
				event = "on_damage_taken",
			},
		},
	},
	victor_zealot_passive_increased_damage = {
		buffs = {
			{
				buff_to_add = "victor_zealot_passive_damage",
				max_stacks = 6,
				update_func = "activate_buff_stacks_based_on_health_chunks",
			},
		},
	},
	victor_zealot_passive_damage = {
		buffs = {
			{
				icon = "victor_zealot_passive",
				max_stacks = 6,
				stat_buff = "power_level",
			},
		},
	},
	victor_zealot_passive_uninterruptible_heavy = {
		buffs = {
			{
				perks = {
					buff_perks.uninterruptible_heavy,
				},
			},
		},
	},
	victor_zealot_invulnerability_cooldown = {
		buffs = {
			{
				buff_to_add = "victor_zealot_gain_invulnerability_on_lethal_damage_taken",
				duration_end_func = "add_buff_local",
				icon = "victor_zealot_passive_invulnerability",
				is_cooldown = true,
				max_stacks = 1,
				refresh_durations = true,
			},
		},
	},
	victor_zealot_gain_invulnerability_on_lethal_damage_taken = {
		buffs = {
			{
				buff_func = "victor_zealot_gain_invulnerability",
				buff_to_add = "victor_zealot_invulnerability_on_lethal_damage_taken",
				event = "on_damage_taken",
				icon = "victor_zealot_passive_invulnerability",
				max_stacks = 1,
				proc_weight = 5,
				remove_on_proc = true,
			},
		},
	},
	victor_zealot_invulnerability_on_lethal_damage_taken = {
		activation_effect = "fx/screenspace_potion_03",
		activation_sound = "hud_gameplay_stance_tank_activate",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		buffs = {
			{
				icon = "victor_zealot_passive_invulnerability",
				max_stacks = 1,
				priority_buff = true,
				remove_buff_func = "add_victor_zealot_invulnerability_cooldown",
				stat_buff = "damage_taken",
				perks = {
					buff_perks.ignore_death,
				},
			},
		},
	},
	victor_zealot_activated_ability = {
		buffs = {
			{
				icon = "victor_zealot_activated_ability",
				max_stacks = 1,
				priority_buff = true,
				remove_buff_func = "end_zealot_activated_ability",
				stat_buff = "attack_speed",
				perks = {
					buff_perks.victor_zealot_activated_ability,
				},
			},
		},
	},
	victor_zealot_reaper = {
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
	victor_zealot_bloodlust = {
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
	victor_zealot_conqueror = {
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
	victor_zealot_crit_count = {
		buffs = {
			{
				buff_func = "add_buff_on_first_target_hit",
				buff_to_add = "victor_zealot_counter_buff",
				event = "on_hit",
			},
		},
	},
	victor_zealot_counter_buff = {
		buffs = {
			{
				icon = "victor_zealot_crit_count",
				is_cooldown = true,
				max_stacks = 5,
				on_max_stacks_func = "add_remove_buffs",
				reset_on_max_stacks = true,
				max_stack_data = {
					buffs_to_add = {
						"victor_zealot_crit_count_buff",
					},
				},
			},
		},
	},
	victor_zealot_crit_count_buff = {
		buffs = {
			{
				buff_func = "dummy_function",
				event = "on_critical_action",
				icon = "victor_zealot_crit_count",
				max_stacks = 1,
				priority_buff = true,
				remove_on_proc = true,
				perks = {
					buff_perks.guaranteed_crit,
				},
			},
		},
	},
	victor_zealot_power = {
		buffs = {
			{
				max_stacks = 1,
				stat_buff = "power_level",
			},
		},
	},
	victor_zealot_attack_speed_on_health_percent = {
		buffs = {
			{
				buff_to_add = "victor_zealot_attack_speed_on_health_percent_buff",
				update_func = "victor_zealot_activate_buff_stacks_based_on_health_percent",
			},
		},
	},
	victor_zealot_attack_speed_on_health_percent_buff = {
		buffs = {
			{
				icon = "victor_zealot_attack_speed_on_health_percent",
				multiplier = 0.1,
				stat_buff = "attack_speed",
			},
		},
	},
	victor_zealot_passive_move_speed = {
		buffs = {
			{
				buff_to_add = "victor_zealot_passive_move_speed_buff",
				chunk_size = 25,
				max_stacks = 6,
				update_func = "activate_buff_stacks_based_on_health_chunks",
			},
		},
	},
	victor_zealot_passive_move_speed_buff = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				icon = "victor_zealot_passive_move_speed",
				max_stacks = 6,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
		},
	},
	victor_zealot_passive_healing_received = {
		buffs = {
			{
				buff_to_add = "victor_zealot_passive_healing_received_buff",
				chunk_size = 25,
				max_stacks = 6,
				update_func = "activate_buff_stacks_based_on_health_chunks",
			},
		},
	},
	victor_zealot_passive_healing_received_buff = {
		buffs = {
			{
				icon = "victor_zealot_passive_healing_received",
				max_stacks = 6,
				multiplier = 0.2,
				stat_buff = "healing_received",
			},
		},
	},
	victor_zealot_passive_damage_taken = {
		buffs = {
			{
				buff_to_add = "victor_zealot_passive_damage_taken_buff",
				chunk_size = 25,
				max_stacks = 6,
				update_func = "activate_buff_stacks_based_on_health_chunks",
			},
		},
	},
	victor_zealot_passive_damage_taken_buff = {
		buffs = {
			{
				icon = "victor_zealot_passive_damage_taken",
				max_stacks = 6,
				stat_buff = "damage_taken",
			},
		},
	},
	victor_zealot_move_speed_on_damage_taken = {
		buffs = {
			{
				buff_func = "add_buff_on_enemy_damage_taken",
				buff_to_add = "victor_zealot_move_speed_on_damage_taken_buff",
				event = "on_damage_taken",
				perks = {
					buff_perks.no_moveslow_on_hit,
				},
			},
		},
	},
	victor_zealot_move_speed_on_damage_taken_buff = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				icon = "victor_zealot_move_speed_on_damage_taken",
				max_stacks = 1,
				multiplier = 1.5,
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
		},
	},
	victor_zealot_max_stamina_on_damage_taken = {
		buffs = {
			{
				buff_func = "restore_stamina_on_enemy_damage_taken",
				event = "on_damage_taken",
			},
		},
	},
	victor_zealot_reduced_damage_taken_buff = {
		buffs = {
			{
				multiplier = -0.1,
				stat_buff = "damage_taken",
			},
		},
	},
	victor_zealot_activated_ability_power_on_hit = {
		buffs = {
			{
				buff_func = "add_buff",
				buff_to_add = "victor_zealot_activated_ability_power_on_hit_buff",
				duration = 5,
				event = "on_hit",
			},
		},
	},
	victor_zealot_activated_ability_power_on_hit_buff = {
		buffs = {
			{
				icon = "victor_zealot_activated_ability_power_on_hit",
				refresh_durations = true,
				stat_buff = "power_level",
			},
		},
	},
	victor_zealot_activated_ability_ignore_death = {
		activation_effect = "fx/screenspace_potion_03",
		activation_sound = "hud_gameplay_stance_tank_activate",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		buffs = {
			{
				duration = 5,
				icon = "victor_zealot_activated_ability_ignore_death",
				max_stacks = 1,
				perks = {
					buff_perks.ignore_death,
				},
			},
		},
	},
	victor_zealot_activated_ability_cooldown_stack_on_hit = {
		buffs = {
			{
				buff_func = "add_buff",
				buff_to_add = "victor_zealot_activated_ability_cooldown_stack_on_hit_buff",
				duration = 5,
				event = "on_hit",
			},
		},
	},
	victor_zealot_activated_ability_cooldown_stack_on_hit_buff = {
		buffs = {
			{
				duration = 5,
				icon = "victor_zealot_activated_ability_cooldown_stack_on_hit",
				refresh_durations = true,
				remove_buff_func = "reduce_cooldown_percent",
			},
		},
	},
	victor_bountyhunter_ability_cooldown_on_hit = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown",
				event = "on_hit",
			},
		},
	},
	victor_bountyhunter_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken",
				event = "on_damage_taken",
			},
		},
	},
	victor_bountyhunter_passive_crit_buff = {
		buffs = {
			{
				icon = "victor_bountyhunter_passive",
				max_stacks = 1,
				stat_buff = "critical_strike_chance_ranged",
			},
		},
	},
	victor_bountyhunter_passive_crit_buff_removal = {
		buffs = {
			{
				buff_func = "remove_victor_bountyhunter_passive_crit_buff",
				event = "on_critical_action",
			},
		},
	},
	victor_bountyhunter_passive_crit_cooldown = {
		buffs = {
			{
				buff_to_add = "victor_bountyhunter_passive_crit_buff",
				duration_end_func = "add_buff_local",
				icon = "victor_bountyhunter_passive",
				is_cooldown = true,
				max_stacks = 1,
				refresh_durations = true,
			},
		},
	},
	victor_bountyhunter_passive_reload_speed = {
		buffs = {
			{
				stat_buff = "reload_speed",
			},
		},
	},
	victor_bountyhunter_passive_increased_ammunition = {
		buffs = {
			{
				stat_buff = "total_ammo",
			},
		},
	},
	victor_bountyhunter_regrowth = {
		buffs = {
			{
				bonus = 2,
				buff_func = "heal_finesse_damage_on_melee",
				event = "on_hit",
				name = "regrowth",
				perks = {
					buff_perks.ninja_healing,
				},
			},
		},
	},
	victor_bountyhunter_conqueror = {
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
	victor_bountyhunter_bloodlust = {
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
	victor_bountyhunter_increased_melee_damage_on_no_ammo_add = {
		buffs = {
			{
				buff_func = "add_buff_on_out_of_ammo",
				event = "on_last_ammo_used",
				buffs_to_add = {
					"victor_bountyhunter_attack_speed_on_no_ammo_buff",
					"victor_bountyhunter_power_on_no_ammo_buff",
				},
			},
		},
	},
	victor_bountyhunter_attack_speed_on_no_ammo_buff = {
		buffs = {
			{
				icon = "victor_bountyhunter_melee_damage_on_no_ammo",
				max_stacks = 1,
				name = "bardin_slayer_frenzy",
				refresh_durations = true,
				stat_buff = "attack_speed",
			},
		},
	},
	victor_bountyhunter_power_on_no_ammo_buff = {
		buffs = {
			{
				max_stacks = 1,
				priority_buff = true,
				refresh_durations = true,
				stat_buff = "power_level",
			},
		},
	},
	victor_bountyhunter_debuff_defence_on_crit = {
		buffs = {
			{
				buff_func = "on_hit_debuff_enemy_defence",
				buff_to_add = "defence_debuff_enemies",
				event = "on_critical_hit",
			},
		},
	},
	victor_bountyhunter_power_level_on_clip_size = {
		buffs = {
			{
				buff_to_add = "victor_bountyhunter_power_level_on_clip_size_buff",
				remove_buff_func = "remove_buff_stacks_based_on_clip_size",
				update_func = "activate_buff_stacks_based_on_clip_size",
			},
		},
	},
	victor_bountyhunter_power_level_on_clip_size_buff = {
		buffs = {
			{
				icon = "victor_bountyhunter_power_level_on_clip_size",
				max_stacks = 20,
				stat_buff = "power_level_ranged",
			},
		},
	},
	victor_bountyhunter_passive_reduced_cooldown = {
		buffs = {
			{
				buff_to_add = "victor_bountyhunter_passive_crit_buff",
				duration_end_func = "add_buff_local",
				icon = "victor_bountyhunter_passive",
				is_cooldown = true,
				max_stacks = 1,
				refresh_durations = true,
			},
		},
	},
	victor_bountyhunter_activate_passive_on_melee_kill = {
		buffs = {
			{
				buff_func = "victor_bountyhunter_activate_passive_on_melee_kill",
				event = "on_kill",
			},
		},
	},
	victor_bountyhunter_weapon_swap_buff = {
		buffs = {
			{
				buff_func = "victor_bountyhunter_blessed_combat",
				event = "on_hit",
				melee_buff = "victor_bountyhunter_blessed_melee_buff",
				melee_buff_to_add = "victor_bountyhunter_blessed_melee_damage_buff",
				ranged_buff = "victor_bountyhunter_blessed_ranged_buff",
				ranged_buff_to_add = "victor_bountyhunter_blessed_ranged_damage_buff",
				update_func = "victor_bountyhunter_blessed_combat_update",
				melee_buff_ids = {},
				ranged_buff_ids = {},
			},
		},
	},
	victor_bountyhunter_blessed_melee_buff = {
		buffs = {
			{
				icon = "victor_bountyhunter_passive_infinite_ammo",
				max_stacks = 6,
			},
		},
	},
	victor_bountyhunter_blessed_melee_damage_buff = {
		buffs = {
			{
				max_stacks = 1,
				stat_buff = "power_level_melee",
			},
		},
	},
	victor_bountyhunter_blessed_ranged_buff = {
		buffs = {
			{
				icon = "victor_bountyhunter_heal_on_critical_hit",
				max_stacks = 6,
			},
		},
	},
	victor_bountyhunter_blessed_ranged_damage_buff = {
		buffs = {
			{
				max_stacks = 1,
				stat_buff = "power_level_ranged",
			},
		},
	},
	victor_bountyhunter_passive_infinite_ammo = {
		buffs = {
			{
				activation_buff = "victor_bountyhunter_passive_crit_buff",
				buff_to_add = "victor_bountyhunter_passive_infinite_ammo_buff",
				update_func = "activate_buff_on_other_buff",
			},
		},
	},
	victor_bountyhunter_passive_infinite_ammo_buff = {
		buffs = {
			{
				icon = "victor_bountyhunter_passive_infinite_ammo",
				max_stacks = 1,
				perks = {
					buff_perks.infinite_ammo,
				},
			},
		},
	},
	victor_bountyhunter_party_movespeed_on_ranged_crit = {
		buffs = {
			{
				buff_func = "add_team_buff_on_ranged_critical_hit",
				buff_to_add = "victor_bountyhunter_party_movespeed_on_ranged_crit_buff",
				event = "on_hit",
			},
		},
	},
	victor_bountyhunter_reload_on_kill = {
		buffs = {
			{
				buff_func = "victor_bounty_hunter_reload_on_kill",
				event = "on_kill",
			},
		},
	},
	victor_bountyhunter_restore_ammo_on_elite_kill = {
		buffs = {
			{
				buff_func = "victor_bounty_hunter_ammo_fraction_gain_out_of_ammo",
				event = "on_kill",
			},
		},
	},
	victor_bountyhunter_restore_ammo_on_kill_buff = {
		buffs = {
			{
				buff_func = "victor_bounty_hunter_ammo_regen",
				duration = 5,
				event = "on_hit",
				icon = "bardin_slayer_activated_ability",
				max_stacks = 1,
				priority_buff = true,
				refresh_durations = true,
			},
		},
	},
	victor_bountyhunter_party_movespeed_on_ranged_crit_buff = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				icon = "victor_bountyhunter_movespeed_on_ranged_crit",
				max_stacks = 1,
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
		},
	},
	victor_bountyhunter_stacking_damage_reduction_on_elite_or_special_kill = {
		buffs = {
			{
				buff_func = "add_buff_on_elite_or_special_kill",
				buff_to_add = "victor_bountyhunter_stacking_damage_reduction_on_elite_or_special_kill_buff",
				event = "on_kill",
				restore_sub_buffs = true,
			},
		},
	},
	victor_bountyhunter_stacking_damage_reduction_on_elite_or_special_kill_buff = {
		buffs = {
			{
				icon = "victor_bountyhunter_stacking_damage_reduction_on_elite_or_special_kill",
				stat_buff = "damage_taken",
			},
		},
	},
	victor_bountyhunter_activated_ability_passive_cooldown_reduction = {
		buffs = {
			{
				buff_func = "victor_bountyhunter_reduce_activated_ability_cooldown_on_passive_crit",
				event = "on_critical_hit",
			},
		},
	},
	victor_bountyhunter_activated_ability_reset_cooldown_on_stacks = {
		buffs = {
			{
				buff_func = "victor_bountyhunter_reduce_activated_ability_cooldown_ignore_paused_on_kill",
				event = "on_kill",
			},
		},
	},
	victor_bountyhunter_activated_ability_blast_shotgun = {
		buffs = {
			{
				buff_func = "victor_bounty_blast_streak_activation",
				buff_to_add = "victor_bounty_blast_streak_buff",
				event = "on_kill",
				stat_buff = "activated_cooldown",
			},
		},
	},
	victor_bounty_blast_streak_buff = {
		buffs = {
			{
				buff_func = "victor_bounty_blast_streak_buff",
				event = "on_hit",
				icon = "victor_bountyhunter_activated_ability_reset_cooldown_on_stacks",
				max_stacks = 20,
			},
		},
	},
	victor_bountyhunter_activated_ability_railgun = {
		buffs = {
			{
				buff_func = "victor_bounty_hunter_reduce_activated_ability_cooldown_railgun",
				buff_to_add = "victor_bountyhunter_activated_ability_railgun_delayed_add",
				event = "on_hit",
			},
		},
	},
	victor_bountyhunter_activated_ability_railgun_delayed_add = {
		buffs = {
			{
				duration = 0.25,
				max_stacks = 1,
				multiplier = 0.6,
				remove_buff_func = "victor_bountyhunter_activated_ability_railgun_delayed",
			},
		},
	},
	victor_witchhunter_ability_cooldown_on_hit = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown",
				event = "on_hit",
			},
		},
	},
	victor_witchhunter_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken",
				event = "on_damage_taken",
			},
		},
	},
	victor_witchhunter_passive = {
		buffs = {
			{
				max_stacks = 1,
			},
		},
	},
	victor_witchhunter_passive_debuff = {
		buffs = {
			{
				max_stacks = 1,
				stat_buff = "damage_taken",
			},
		},
	},
	victor_witchhunter_passive_dodge_range = {
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
	victor_witchhunter_passive_dodge_speed = {
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
	victor_witchhunter_passive_block_cost_reduction = {
		buffs = {
			{
				perks = {
					buff_perks.in_arc_block_cost_reduction,
				},
			},
		},
	},
	victor_witchhunter_headshot_multiplier_increase = {
		buffs = {
			{
				stat_buff = "headshot_multiplier",
			},
		},
	},
	victor_witchhunter_headshot_crit_killing_blow = {
		buffs = {
			{
				perks = {
					buff_perks.crit_headshot_killing_blow,
				},
			},
		},
	},
	victor_witchhunter_activated_ability_crit_buff = {
		buffs = {
			{
				icon = "victor_witchhunter_activated_ability",
				priority_buff = true,
				refresh_durations = true,
				stat_buff = "critical_strike_chance",
			},
		},
	},
	victor_witchhunter_regrowth = {
		buffs = {
			{
				bonus = 2,
				buff_func = "heal_finesse_damage_on_melee",
				event = "on_hit",
				name = "regrowth",
				perks = {
					buff_perks.ninja_healing,
				},
			},
		},
	},
	victor_witchhunter_reaper = {
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
	victor_witchhunter_conqueror = {
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
	victor_witchhunter_headshot_damage_increase = {
		buffs = {
			{
				stat_buff = "headshot_multiplier",
			},
		},
	},
	victor_witchhunter_guaranteed_crit_on_timed_block_add = {
		buffs = {
			{
				buff_func = "add_buff",
				buff_to_add = "victor_witchhunter_guaranteed_crit_on_timed_block_buff",
				event = "on_timed_block",
			},
		},
	},
	victor_witchhunter_guaranteed_crit_on_timed_block_buff = {
		buffs = {
			{
				buff_func = "dummy_function",
				event = "on_hit",
				icon = "victor_witchhunter_guaranteed_crit_on_timed_block",
				max_stacks = 1,
				refresh_durations = true,
				remove_on_proc = true,
				stat_buff = "critical_strike_chance",
			},
		},
	},
	victor_witchhunter_bleed_on_critical_hit = {
		buffs = {
			{
				perks = {
					buff_perks.victor_witchhunter_bleed_on_critical_hit,
				},
			},
		},
	},
	victor_witchhunter_critical_hit_chance_on_ping_target_killed = {
		buffs = {
			{
				buff_func = "add_buff_to_all_players",
				buff_to_add = "victor_witchhunter_ping_target_crit_chance",
				event = "on_ping_target_killed",
			},
		},
	},
	victor_witchhunter_ping_target_crit_chance = {
		buffs = {
			{
				icon = "victor_witchhunter_critical_hit_chance_on_ping_target_killed",
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "critical_strike_chance",
			},
		},
	},
	victor_witchhunter_attack_speed_on_enemy_pinged = {
		buffs = {
			{
				buff_func = "victor_witchhunter_ping_enemy_attack_speed",
				buff_to_add = "victor_witchhunter_attack_speed_on_enemy_pinged_buff",
				event = "on_pinged",
			},
		},
	},
	victor_witchhunter_attack_speed_on_enemy_pinged_buff = {
		buffs = {
			{
				icon = "victor_witchhunter_attack_speed_on_enemy_pinged",
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "attack_speed",
			},
		},
	},
	victor_witchhunter_improved_damage_taken_ping = {
		buffs = {
			{
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "damage_taken",
			},
		},
	},
	victor_witchhunter_max_ammo = {
		buffs = {
			{
				stat_buff = "total_ammo",
			},
		},
	},
	victor_witchhunter_stamina_regen_on_push = {
		buffs = {
			{
				buff_func = "add_buff",
				buff_to_add = "victor_witchhunter_stamina_regen_on_push_buff",
				event = "on_push",
			},
		},
	},
	victor_witchhunter_stamina_regen_on_push_buff = {
		buffs = {
			{
				icon = "victor_witchhunter_stamina_regen_on_push",
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "fatigue_regen",
			},
		},
	},
	victor_witchhunter_dodge_range = {
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
	victor_witchhunter_dodge_speed = {
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
	victor_witchhunter_activated_ability_refund_cooldown_on_enemies_hit = {
		buffs = {
			{
				buff_func = "victor_witchhunter_activated_ability_refund_cooldown_on_enemies_hit",
				event = "on_hit",
			},
		},
	},
	victor_witchhunter_activated_ability_guaranteed_crit_self_buff = {
		buffs = {
			{
				icon = "victor_witchhunter_activated_ability_guaranteed_crit_self_buff",
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "critical_strike_chance_melee",
			},
		},
	},
}
TalentTrees = TalentTrees or {}
TalentTrees.witch_hunter = {
	{
		{
			"victor_zealot_reaper",
			"victor_zealot_bloodlust_2",
			"victor_zealot_heal_share",
		},
		{
			"victor_zealot_attack_speed_on_health_percent",
			"victor_zealot_crit_count",
			"victor_zealot_power",
		},
		{
			"victor_zealot_smiter_unbalance",
			"victor_zealot_linesman_unbalance",
			"victor_zealot_power_level_unbalance",
		},
		{
			"victor_zealot_passive_move_speed",
			"victor_zealot_passive_healing_received",
			"victor_zealot_passive_damage_taken",
		},
		{
			"victor_zealot_move_speed_on_damage_taken",
			"victor_zealot_max_stamina_on_damage_taken",
			"victor_zealot_reduced_damage_taken",
		},
		{
			"victor_zealot_activated_ability_power_on_hit",
			"victor_zealot_activated_ability_ignore_death",
			"victor_zealot_activated_ability_cooldown_stack_on_hit",
		},
	},
	{
		{
			"victor_bountyhunter_regrowth_2",
			"victor_bountyhunter_bloodlust_2",
			"victor_bountyhunter_heal_share",
		},
		{
			"victor_bountyhunter_debuff_defence_on_crit",
			"victor_bountyhunter_power_burst_on_no_ammo",
			"victor_bountyhunter_power_level_on_clip_size",
		},
		{
			"victor_bounty_hunter_smiter_unbalance",
			"victor_bounty_hunter_finesse_unbalance",
			"victor_bounty_hunter_power_level_unbalance",
		},
		{
			"victor_bountyhunter_weapon_swap_buff",
			"victor_bountyhunter_passive_reduced_cooldown",
			"victor_bountyhunter_passive_infinite_ammo",
		},
		{
			"victor_bountyhunter_party_movespeed_on_ranged_crit",
			"victor_bountyhunter_reload_on_kill",
			"victor_bountyhunter_stacking_damage_reduction_on_elite_or_special_kill",
		},
		{
			"victor_bountyhunter_activated_ability_reset_cooldown_on_stacks",
			"victor_bountyhunter_activated_ability_railgun",
			"victor_bountyhunter_activated_ability_blast_shotgun",
		},
	},
	{
		{
			"victor_witchhunter_regrowth_2",
			"victor_witchhunter_reaper",
			"victor_witchhunter_heal_share",
		},
		{
			"victor_witchhunter_guaranteed_crit_on_timed_block",
			"victor_witchhunter_headshot_damage_increase",
			"victor_witchhunter_bleed_on_critical_hit",
		},
		{
			"victor_witchhunter_linesman_unbalance",
			"victor_witchhunter_finesse_unbalance",
			"victor_witchhunter_power_level_unbalance",
		},
		{
			"victor_witchhunter_improved_damage_taken_ping",
			"victor_witchhunter_attack_speed_on_enemy_pinged",
			"victor_witchhunter_critical_hit_chance_on_ping_target_killed",
		},
		{
			"victor_witchhunter_dodge_range",
			"victor_witchhunter_stamina_regen_on_push",
			"victor_witchhunter_max_ammo",
		},
		{
			"victor_captain_activated_ability_stagger_ping_debuff",
			"victor_witchhunter_activated_ability_guaranteed_crit_self_buff",
			"victor_witchhunter_activated_ability_refund_cooldown_on_enemies_hit",
		},
	},
}
Talents = Talents or {}
Talents.witch_hunter = {
	{
		buffer = "server",
		description = "reaper_desc",
		icon = "victor_zealot_regrowth",
		name = "victor_zealot_reaper",
		num_ranks = 1,
		description_values = {
			{
				value = BuffTemplates.reaper.buffs[1].max_targets,
			},
		},
		buffs = {
			"victor_zealot_reaper",
		},
	},
	{
		buffer = "server",
		description = "bloodlust_desc_3",
		icon = "victor_zealot_bloodlust",
		name = "victor_zealot_bloodlust_2",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.bloodlust.buffs[1].multiplier,
			},
		},
		buffs = {
			"victor_zealot_bloodlust",
		},
	},
	{
		buffer = "server",
		description = "conqueror_desc_3",
		icon = "victor_zealot_conqueror",
		name = "victor_zealot_heal_share",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.conqueror.buffs[1].multiplier,
			},
		},
		buffs = {
			"victor_zealot_conqueror",
		},
	},
	{
		description = "victor_zealot_crit_count_desc",
		icon = "victor_zealot_crit_count",
		name = "victor_zealot_crit_count",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.victor_zealot_crit_count.buff_on_stacks,
			},
		},
		buffs = {
			"victor_zealot_crit_count",
		},
		perks = {
			"no_random_crits",
		},
	},
	{
		buffer = "server",
		description = "victor_zealot_power_desc",
		icon = "victor_zealot_power",
		name = "victor_zealot_power",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_zealot_power.multiplier,
			},
		},
		buffs = {
			"victor_zealot_power",
		},
	},
	{
		buffer = "server",
		description = "victor_zealot_attack_speed_on_health_percent_desc",
		icon = "victor_zealot_attack_speed_on_health_percent",
		name = "victor_zealot_attack_speed_on_health_percent",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_zealot_attack_speed_on_health_percent_buff.multiplier,
			},
			{
				value_type = "percent",
				value = buff_tweak_data.victor_zealot_attack_speed_on_health_percent.threshold_1,
			},
			{
				value_type = "percent",
				value = buff_tweak_data.victor_zealot_attack_speed_on_health_percent.threshold_2,
			},
		},
		buffs = {
			"victor_zealot_attack_speed_on_health_percent",
		},
	},
	{
		buffer = "server",
		description = "victor_zealot_passive_move_speed_desc",
		icon = "victor_zealot_passive_move_speed",
		name = "victor_zealot_passive_move_speed",
		num_ranks = 1,
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.victor_zealot_passive_move_speed_buff.multiplier,
			},
		},
		buffs = {
			"victor_zealot_passive_move_speed",
		},
	},
	{
		buffer = "server",
		description = "victor_zealot_passive_healing_received_desc",
		icon = "victor_zealot_passive_healing_received",
		name = "victor_zealot_passive_healing_received",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_zealot_passive_healing_received_buff.multiplier,
			},
		},
		buffs = {
			"victor_zealot_passive_healing_received",
		},
	},
	{
		buffer = "server",
		description = "victor_zealot_passive_damage_taken_desc",
		icon = "victor_zealot_passive_damage_taken",
		name = "victor_zealot_passive_damage_taken",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_zealot_passive_damage_taken_buff.multiplier,
			},
		},
		buffs = {
			"victor_zealot_passive_damage_taken",
		},
	},
	{
		description = "victor_zealot_move_speed_on_damage_taken_desc",
		icon = "victor_zealot_move_speed_on_damage_taken",
		name = "victor_zealot_move_speed_on_damage_taken",
		num_ranks = 1,
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.victor_zealot_move_speed_on_damage_taken_buff.multiplier,
			},
			{
				value = buff_tweak_data.victor_zealot_move_speed_on_damage_taken_buff.duration,
			},
		},
		buffs = {
			"victor_zealot_move_speed_on_damage_taken",
		},
	},
	{
		description = "victor_zealot_max_stamina_on_damage_taken_desc",
		icon = "victor_zealot_max_stamina_on_damage_taken",
		name = "victor_zealot_max_stamina_on_damage_taken",
		num_ranks = 1,
		buffs = {
			"victor_zealot_max_stamina_on_damage_taken",
		},
	},
	{
		buffer = "server",
		description = "victor_zealot_reduced_damage_taken_desc",
		icon = "victor_zealot_reduced_damage_taken",
		name = "victor_zealot_reduced_damage_taken",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_zealot_reduced_damage_taken_buff.multiplier,
			},
		},
		buffs = {
			"victor_zealot_reduced_damage_taken_buff",
		},
	},
	{
		buffer = "server",
		description = "victor_zealot_activated_ability_power_on_hit_desc",
		icon = "victor_zealot_activated_ability_power_on_hit",
		name = "victor_zealot_activated_ability_power_on_hit",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_zealot_activated_ability_power_on_hit_buff.multiplier,
			},
			{
				value = buff_tweak_data.victor_zealot_activated_ability_power_on_hit_buff.duration,
			},
			{
				value = buff_tweak_data.victor_zealot_activated_ability_power_on_hit_buff.max_stacks,
			},
		},
		buffs = {},
	},
	{
		buffer = "server",
		description = "victor_zealot_activated_ability_ignore_death_desc",
		icon = "victor_zealot_activated_ability_ignore_death",
		name = "victor_zealot_activated_ability_ignore_death",
		num_ranks = 1,
		buffs = {},
	},
	{
		description = "victor_zealot_activated_ability_cooldown_stack_on_hit_desc",
		icon = "victor_zealot_activated_ability_cooldown_stack_on_hit",
		name = "victor_zealot_activated_ability_cooldown_stack_on_hit",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.victor_zealot_activated_ability_cooldown_stack_on_hit_buff.max_stacks,
			},
			{
				value_type = "percent",
				value = buff_tweak_data.victor_zealot_activated_ability_cooldown_stack_on_hit_buff.cooldown_amount,
			},
		},
		buffs = {},
	},
	{
		buffer = "server",
		description = "smiter_unbalance_desc",
		icon = "victor_zealot_smiter_unbalance",
		name = "victor_zealot_smiter_unbalance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.smiter_unbalance.buffs[1].display_multiplier,
			},
			{
				value_type = "percent",
				value = BuffTemplates.smiter_unbalance.buffs[1].max_display_multiplier,
			},
		},
		buffs = {
			"smiter_unbalance",
		},
	},
	{
		buffer = "server",
		description = "linesman_unbalance_desc",
		icon = "victor_zealot_linesman_unbalance",
		name = "victor_zealot_linesman_unbalance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.linesman_unbalance.buffs[1].display_multiplier,
			},
			{
				value_type = "percent",
				value = BuffTemplates.linesman_unbalance.buffs[1].max_display_multiplier,
			},
		},
		buffs = {
			"linesman_unbalance",
		},
	},
	{
		buffer = "server",
		description = "power_level_unbalance_desc",
		icon = "victor_zealot_power_level_unbalance",
		name = "victor_zealot_power_level_unbalance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.power_level_unbalance.buffs[1].multiplier,
			},
		},
		buffs = {
			"power_level_unbalance",
		},
	},
	{
		buffer = "both",
		description = "regrowth_desc_3",
		icon = "victor_bountyhunter_regrowth",
		name = "victor_bountyhunter_regrowth_2",
		num_ranks = 1,
		description_values = {
			{
				value = BuffTemplates.regrowth.buffs[1].bonus,
			},
		},
		buffs = {
			"victor_bountyhunter_regrowth",
		},
	},
	{
		buffer = "server",
		description = "bloodlust_desc_3",
		icon = "victor_bountyhunter_bloodlust",
		name = "victor_bountyhunter_bloodlust_2",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.bloodlust.buffs[1].multiplier,
			},
		},
		buffs = {
			"victor_bountyhunter_bloodlust",
		},
	},
	{
		buffer = "server",
		description = "conqueror_desc_3",
		icon = "victor_bountyhunter_conqueror",
		name = "victor_bountyhunter_heal_share",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.conqueror.buffs[1].multiplier,
			},
		},
		buffs = {
			"victor_bountyhunter_conqueror",
		},
	},
	{
		buffer = "server",
		description = "victor_bountyhunter_power_burst_on_no_ammo_desc",
		icon = "victor_bountyhunter_melee_damage_on_no_ammo",
		name = "victor_bountyhunter_power_burst_on_no_ammo",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_bountyhunter_attack_speed_on_no_ammo_buff.multiplier,
			},
			{
				value_type = "percent",
				value = buff_tweak_data.victor_bountyhunter_power_on_no_ammo_buff.multiplier,
			},
			{
				value = buff_tweak_data.victor_bountyhunter_attack_speed_on_no_ammo_buff.duration,
			},
		},
		buffs = {
			"victor_bountyhunter_increased_melee_damage_on_no_ammo_add",
		},
	},
	{
		buffer = "server",
		description = "victor_bountyhunter_debuff_defence_on_crit_desc",
		icon = "victor_bountyhunter_debuff_defence_on_crit",
		name = "victor_bountyhunter_debuff_defence_on_crit",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.defence_debuff_enemies.buffs[1].multiplier,
			},
			{
				value = BuffTemplates.defence_debuff_enemies.buffs[1].duration,
			},
		},
		buffs = {
			"victor_bountyhunter_debuff_defence_on_crit",
		},
	},
	{
		buffer = "server",
		description = "victor_bountyhunter_power_level_on_clip_size_desc",
		icon = "victor_bountyhunter_power_level_on_clip_size",
		name = "victor_bountyhunter_power_level_on_clip_size",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_bountyhunter_power_level_on_clip_size_buff.multiplier,
			},
		},
		buffs = {
			"victor_bountyhunter_power_level_on_clip_size",
		},
	},
	{
		buffer = "both",
		description = "victor_bountyhunter_weapon_swap_buff_desc",
		icon = "victor_bountyhunter_heal_on_critical_hit",
		name = "victor_bountyhunter_weapon_swap_buff",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.victor_bountyhunter_blessed_melee_damage_buff.presentation_stacks,
			},
			{
				value_type = "percent",
				value = buff_tweak_data.victor_bountyhunter_blessed_melee_damage_buff.multiplier,
			},
			{
				value = buff_tweak_data.victor_bountyhunter_blessed_ranged_damage_buff.presentation_stacks,
			},
			{
				value_type = "percent",
				value = buff_tweak_data.victor_bountyhunter_blessed_ranged_damage_buff.multiplier,
			},
		},
		buffs = {
			"victor_bountyhunter_weapon_swap_buff",
			"victor_bountyhunter_activate_passive_on_melee_kill",
		},
	},
	{
		description = "victor_bountyhunter_passive_reduced_cooldown_desc",
		icon = "victor_bountyhunter_passive_reduced_cooldown",
		name = "victor_bountyhunter_passive_reduced_cooldown",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.victor_bountyhunter_passive_reduced_cooldown.duration,
			},
		},
		buffs = {},
	},
	{
		description = "victor_bountyhunter_passive_infinite_ammo_desc",
		icon = "victor_bountyhunter_passive_infinite_ammo",
		name = "victor_bountyhunter_passive_infinite_ammo",
		num_ranks = 1,
		buffs = {
			"victor_bountyhunter_passive_infinite_ammo",
		},
	},
	{
		description = "victor_bountyhunter_party_movespeed_on_ranged_crit_desc",
		icon = "victor_bountyhunter_movespeed_on_ranged_crit",
		name = "victor_bountyhunter_party_movespeed_on_ranged_crit",
		num_ranks = 1,
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.victor_bountyhunter_party_movespeed_on_ranged_crit_buff.multiplier,
			},
			{
				value = buff_tweak_data.victor_bountyhunter_party_movespeed_on_ranged_crit_buff.duration,
			},
		},
		buffs = {
			"victor_bountyhunter_party_movespeed_on_ranged_crit",
		},
	},
	{
		description = "victor_bountyhunter_reload_on_kill_desc",
		icon = "victor_bountyhunter_restore_ammo_on_elite_kill",
		name = "victor_bountyhunter_reload_on_kill",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_bountyhunter_restore_ammo_on_elite_kill.ammo_bonus_fraction,
			},
		},
		buffs = {
			"victor_bountyhunter_reload_on_kill",
			"victor_bountyhunter_restore_ammo_on_elite_kill",
		},
	},
	{
		buffer = "server",
		description = "victor_bountyhunter_stacking_damage_reduction_on_elite_or_special_kill_desc",
		icon = "victor_bountyhunter_stacking_damage_reduction_on_elite_or_special_kill",
		name = "victor_bountyhunter_stacking_damage_reduction_on_elite_or_special_kill",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_bountyhunter_stacking_damage_reduction_on_elite_or_special_kill_buff.multiplier,
			},
			{
				value = buff_tweak_data.victor_bountyhunter_stacking_damage_reduction_on_elite_or_special_kill_buff.max_stacks,
			},
		},
		buffs = {
			"victor_bountyhunter_stacking_damage_reduction_on_elite_or_special_kill",
		},
	},
	{
		description = "victor_bountyhunter_activated_ability_railgun_desc_2",
		icon = "victor_bountyhunter_activated_ability_railgun",
		name = "victor_bountyhunter_activated_ability_railgun",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_bountyhunter_activated_ability_railgun.multiplier,
			},
		},
		buffs = {
			"victor_bountyhunter_activated_ability_railgun",
		},
	},
	{
		description = "victor_bountyhunter_activated_ability_blast_shotgun_desc",
		icon = "victor_bountyhunter_activated_ability_shotgun",
		name = "victor_bountyhunter_activated_ability_blast_shotgun",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_bountyhunter_activated_ability_blast_shotgun.multiplier,
			},
			{
				value = buff_tweak_data.victor_bountyhunter_activated_ability_blast_shotgun.required_target_number,
			},
		},
		buffs = {
			"victor_bountyhunter_activated_ability_blast_shotgun",
		},
	},
	{
		description = "victor_bountyhunter_activated_ability_reset_cooldown_on_stacks_2_desc",
		icon = "victor_bountyhunter_activated_ability_reset_cooldown_on_stacks",
		name = "victor_bountyhunter_activated_ability_reset_cooldown_on_stacks",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_bountyhunter_activated_ability_passive_cooldown_reduction.multiplier,
			},
			{
				value = buff_tweak_data.victor_bountyhunter_activated_ability_passive_cooldown_reduction.cooldown,
			},
		},
		buffs = {
			"victor_bountyhunter_activated_ability_passive_cooldown_reduction",
		},
	},
	{
		buffer = "server",
		description = "smiter_unbalance_desc",
		icon = "victor_bounty_hunter_smiter_unbalance",
		name = "victor_bounty_hunter_smiter_unbalance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.smiter_unbalance.buffs[1].display_multiplier,
			},
			{
				value_type = "percent",
				value = BuffTemplates.smiter_unbalance.buffs[1].max_display_multiplier,
			},
		},
		buffs = {
			"smiter_unbalance",
		},
	},
	{
		buffer = "server",
		description = "finesse_unbalance_desc",
		icon = "victor_bounty_hunter_ninja_unbalance",
		name = "victor_bounty_hunter_finesse_unbalance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.finesse_unbalance.buffs[1].display_multiplier,
			},
			{
				value_type = "percent",
				value = BuffTemplates.finesse_unbalance.buffs[1].max_display_multiplier,
			},
		},
		buffs = {
			"finesse_unbalance",
		},
	},
	{
		buffer = "server",
		description = "power_level_unbalance_desc",
		icon = "victor_bounty_hunter_power_level_unbalance",
		name = "victor_bounty_hunter_power_level_unbalance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.power_level_unbalance.buffs[1].multiplier,
			},
		},
		buffs = {
			"power_level_unbalance",
		},
	},
	{
		buffer = "both",
		description = "regrowth_desc_3",
		icon = "victor_witchhunter_regrowth",
		name = "victor_witchhunter_regrowth_2",
		num_ranks = 1,
		description_values = {
			{
				value = BuffTemplates.regrowth.buffs[1].bonus,
			},
		},
		buffs = {
			"victor_witchhunter_regrowth",
		},
	},
	{
		buffer = "server",
		description = "reaper_desc",
		icon = "victor_witchhunter_bloodlust",
		name = "victor_witchhunter_reaper",
		num_ranks = 1,
		description_values = {
			{
				value = BuffTemplates.reaper.buffs[1].max_targets,
			},
		},
		buffs = {
			"victor_witchhunter_reaper",
		},
	},
	{
		buffer = "server",
		description = "conqueror_desc_3",
		icon = "victor_witchhunter_conqueror",
		name = "victor_witchhunter_heal_share",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.conqueror.buffs[1].multiplier,
			},
		},
		buffs = {
			"victor_witchhunter_conqueror",
		},
	},
	{
		buffer = "server",
		description = "victor_witchhunter_headshot_damage_increase_desc_2",
		icon = "victor_witchhunter_headshot_damage_increase",
		name = "victor_witchhunter_headshot_damage_increase",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_witchhunter_headshot_damage_increase.multiplier,
			},
		},
		buffs = {
			"victor_witchhunter_headshot_damage_increase",
		},
	},
	{
		buffer = "server",
		description = "victor_witchhunter_bleed_on_critical_hit_desc",
		icon = "victor_witchhunter_bleed_on_critical_hit",
		name = "victor_witchhunter_bleed_on_critical_hit",
		num_ranks = 1,
		description_values = {},
		buffs = {
			"victor_witchhunter_bleed_on_critical_hit",
		},
	},
	{
		description = "victor_witchhunter_guaranteed_crit_on_timed_block_desc",
		icon = "victor_witchhunter_guaranteed_crit_on_timed_block",
		name = "victor_witchhunter_guaranteed_crit_on_timed_block",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.victor_witchhunter_guaranteed_crit_on_timed_block_buff.duration,
			},
		},
		buffs = {
			"victor_witchhunter_guaranteed_crit_on_timed_block_add",
		},
	},
	{
		buffer = "both",
		description = "victor_witchhunter_critical_hit_chance_on_ping_target_killed_desc_2",
		icon = "victor_witchhunter_critical_hit_chance_on_ping_target_killed",
		name = "victor_witchhunter_critical_hit_chance_on_ping_target_killed",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_witchhunter_ping_target_crit_chance.bonus,
			},
			{
				value = buff_tweak_data.victor_witchhunter_ping_target_crit_chance.duration,
			},
		},
		buffs = {
			"victor_witchhunter_critical_hit_chance_on_ping_target_killed",
		},
	},
	{
		buffer = "client",
		description = "victor_witchhunter_attack_speed_on_enemy_pinged_desc",
		icon = "victor_witchhunter_attack_speed_on_enemy_pinged",
		name = "victor_witchhunter_attack_speed_on_enemy_pinged",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_witchhunter_attack_speed_on_enemy_pinged_buff.multiplier,
			},
			{
				value = buff_tweak_data.victor_witchhunter_attack_speed_on_enemy_pinged_buff.duration,
			},
		},
		buffs = {
			"victor_witchhunter_attack_speed_on_enemy_pinged",
		},
	},
	{
		buffer = "both",
		description = "victor_witchhunter_improved_damage_taken_ping_desc",
		icon = "victor_witchhunter_improved_damage_taken_ping",
		name = "victor_witchhunter_improved_damage_taken_ping",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_witchhunter_improved_damage_taken_ping.multiplier,
			},
		},
		buffs = {},
	},
	{
		description = "victor_witchhunter_max_ammo_desc",
		icon = "victor_witchhunter_max_ammo",
		name = "victor_witchhunter_max_ammo",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_witchhunter_max_ammo.multiplier,
			},
		},
		buffs = {
			"victor_witchhunter_max_ammo",
		},
	},
	{
		description = "victor_witchhunter_stamina_regen_on_push_desc",
		icon = "victor_witchhunter_stamina_regen_on_push",
		name = "victor_witchhunter_stamina_regen_on_push",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.victor_witchhunter_stamina_regen_on_push_buff.multiplier,
			},
			{
				value = buff_tweak_data.victor_witchhunter_stamina_regen_on_push_buff.duration,
			},
		},
		buffs = {
			"victor_witchhunter_stamina_regen_on_push",
		},
	},
	{
		description = "victor_witchhunter_dodge_range_desc",
		icon = "victor_witchhunter_dodge_range",
		name = "victor_witchhunter_dodge_range",
		num_ranks = 1,
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.victor_witchhunter_dodge_range.multiplier,
			},
		},
		buffs = {
			"victor_witchhunter_dodge_range",
			"victor_witchhunter_dodge_speed",
		},
	},
	{
		description = "victor_captain_activated_ability_stagger_ping_debuff_desc",
		icon = "victor_captain_activated_ability_stagger_ping_debuff",
		name = "victor_captain_activated_ability_stagger_ping_debuff",
		num_ranks = 1,
		description_values = {},
		buffs = {},
	},
	{
		description = "victor_witchhunter_activated_ability_guaranteed_crit_self_buff_desc",
		icon = "victor_witchhunter_activated_ability_guaranteed_crit_self_buff",
		name = "victor_witchhunter_activated_ability_guaranteed_crit_self_buff",
		num_ranks = 1,
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.victor_witchhunter_activated_ability_guaranteed_crit_self_buff.bonus,
			},
			{
				value = buff_tweak_data.victor_witchhunter_activated_ability_guaranteed_crit_self_buff.duration,
			},
		},
		buffs = {},
	},
	{
		description = "victor_witchhunter_activated_ability_refund_cooldown_on_enemies_hit_desc",
		icon = "victor_witchhunter_activated_ability_refund_cooldown_on_enemies_hit",
		name = "victor_witchhunter_activated_ability_refund_cooldown_on_enemies_hit",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.victor_witchhunter_activated_ability_refund_cooldown_on_enemies_hit.required_targets,
			},
			{
				value_type = "percent",
				value = buff_tweak_data.victor_witchhunter_activated_ability_refund_cooldown_on_enemies_hit.cooldown_reduction,
			},
		},
		buffs = {
			"victor_witchhunter_activated_ability_refund_cooldown_on_enemies_hit",
		},
	},
	{
		buffer = "server",
		description = "linesman_unbalance_desc",
		icon = "victor_witchhunter_linesman_unbalance",
		name = "victor_witchhunter_linesman_unbalance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.linesman_unbalance.buffs[1].display_multiplier,
			},
			{
				value_type = "percent",
				value = BuffTemplates.linesman_unbalance.buffs[1].max_display_multiplier,
			},
		},
		buffs = {
			"linesman_unbalance",
		},
	},
	{
		buffer = "server",
		description = "finesse_unbalance_desc",
		icon = "victor_witchhunter_ninja_unbalance",
		name = "victor_witchhunter_finesse_unbalance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.finesse_unbalance.buffs[1].display_multiplier,
			},
			{
				value_type = "percent",
				value = BuffTemplates.finesse_unbalance.buffs[1].max_display_multiplier,
			},
		},
		buffs = {
			"finesse_unbalance",
		},
	},
	{
		buffer = "server",
		description = "power_level_unbalance_desc",
		icon = "victor_witchhunter_power_level_unbalance",
		name = "victor_witchhunter_power_level_unbalance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.power_level_unbalance.buffs[1].multiplier,
			},
		},
		buffs = {
			"power_level_unbalance",
		},
	},
	{
		description = "victor_placeholder",
		name = "victor_placeholder",
	},
}

BuffUtils.copy_talent_buff_names(TalentBuffTemplates.witch_hunter)
BuffUtils.apply_buff_tweak_data(TalentBuffTemplates.witch_hunter, buff_tweak_data)

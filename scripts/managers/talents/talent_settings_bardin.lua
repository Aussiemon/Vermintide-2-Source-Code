local buff_tweak_data = {
	bardin_ironbreaker_ability_cooldown_on_hit = {
		bonus = 0.25
	},
	bardin_ironbreaker_ability_cooldown_on_damage_taken = {
		bonus = 0.5
	},
	bardin_ironbreaker_passive_increased_defence = {
		multiplier = -0.3
	},
	bardin_ironbreaker_passive_increased_stamina = {
		bonus = 2
	},
	bardin_ironbreaker_passive_reduced_stun_duration = {
		multiplier = 0.5
	},
	bardin_ironbreaker_gromril_delay = {
		duration = 20
	},
	bardin_ironbreaker_gromril_antistun = {
		multiplier = -0.5
	},
	bardin_ironbreaker_activated_ability = {
		range = 10,
		multiplier_damage_taken = -0.5,
		duration = 10,
		attack_intensity_decay_multiplier = 1,
		multiplier_block_cost = -1
	},
	bardin_ironbreaker_vanguard = {},
	bardin_ironbreaker_bloodlust = {},
	bardin_ironbreaker_conqueror = {},
	bardin_ironbreaker_power_on_nearby_allies_buff = {
		max_stacks = 3,
		multiplier = 0.05
	},
	bardin_ironbreaker_increased_overcharge = {
		multiplier = 0.3
	},
	bardin_ironbreaker_increased_ranged_power = {
		multiplier = 0.3
	},
	bardin_ironbreaker_power_on_blocked_attacks_buff = {
		max_stacks = 5,
		multiplier = 0.05
	},
	bardin_ironbreaker_gromril_stamina_regen = {
		multiplier = 0.5
	},
	bardin_ironbreaker_gromril_delay_short = {
		duration = 13
	},
	bardin_ironbreaker_regen_stamina_on_charged_attacks_buff = {
		duration = 2,
		multiplier = 0.4
	},
	bardin_ironbreaker_regen_stamina_on_block_broken = {
		proc_chance = 0.5
	},
	bardin_ironbreaker_cooldown_reduction_on_kill_while_full_stamina = {
		cooldown_reduction = 0.02
	},
	bardin_ironbreaker_activated_ability_taunt_range_and_duration = {
		display_multiplier = 0.5,
		range = 15,
		multiplier_damage_taken = -0.5,
		duration = 15,
		attack_intensity_decay_multiplier = 1,
		multiplier_block_cost = -1
	},
	bardin_ironbreaker_activated_ability_duration = {
		display_multiplier = 0.5,
		duration = 15
	},
	bardin_ironbreaker_activated_ability_power_buff = {
		multiplier = 0.2,
		range = 15,
		duration = 10
	},
	bardin_slayer_ability_cooldown_on_hit = {
		bonus = 0.5
	},
	bardin_slayer_ability_cooldown_on_damage_taken = {
		bonus = 0.1
	},
	bardin_slayer_passive_stacking_damage_buff = {
		max_stacks = 3,
		multiplier = 0.1,
		duration = 2
	},
	bardin_slayer_passive_attack_speed = {
		multiplier = 0.075
	},
	bardin_slayer_activated_ability = {
		duration = 10,
		multiplier = 0.3
	},
	bardin_slayer_reaper = {},
	bardin_slayer_bloodlust = {},
	bardin_slayer_conqueror = {},
	bardin_slayer_crit_chance = {
		bonus = 0.05
	},
	bardin_slayer_attack_speed_on_double_one_handed_weapons_buff = {
		multiplier = 0.1
	},
	bardin_slayer_power_on_double_two_handed_weapons_buff = {
		multiplier = 0.15
	},
	bardin_slayer_passive_cooldown_reduction_on_max_stacks = {
		multiplier = 2
	},
	bardin_slayer_passive_increased_max_stacks = {
		max_stacks = 4,
		multiplier = 0.1,
		duration = 2,
		display_value = 1
	},
	bardin_slayer_passive_movement_speed = {
		max_stacks = 3,
		multiplier = 1.1,
		duration = 2
	},
	bardin_slayer_damage_taken_capped = {
		bonus = 10
	},
	bardin_slayer_damage_reduction_on_melee_charge_action_buff = {
		duration = 1,
		multiplier = -0.5
	},
	bardin_slayer_activated_ability_movement = {
		multiplier = 1.25
	},
	bardin_slayer_activated_ability_leap_range = {
		display_multiplier = 0.5
	},
	bardin_slayer_activated_ability_leap_damage_buff = {
		multiplier = 1.5
	},
	bardin_ranger_ability_cooldown_on_hit = {
		bonus = 0.3
	},
	bardin_ranger_ability_cooldown_on_damage_taken = {
		bonus = 0.3
	},
	bardin_ranger_passive = {
		drop_chance = 1
	},
	bardin_ranger_passive_consumeable_dupe_healing = {
		proc_chance = 0.1
	},
	bardin_ranger_passive_consumeable_dupe_potion = {
		proc_chance = 0.1
	},
	bardin_ranger_passive_consumeable_dupe_grenade = {
		proc_chance = 0.1
	},
	bardin_ranger_passive_reload_speed = {
		multiplier = -0.15
	},
	bardin_ranger_passive_increased_ammunition = {
		multiplier = 0.5
	},
	bardin_ranger_activated_ability = {
		duration = 10
	},
	bardin_ranger_vanguard = {},
	bardin_ranger_reaper = {},
	bardin_ranger_conqueror = {},
	bardin_ranger_melee_damage_on_no_ammo = {
		multiplier = 0.25
	},
	bardin_ranger_cooldown_on_reload = {
		bonus = 2
	},
	bardin_ranger_attack_speed = {
		multiplier = 0.05
	},
	bardin_ranger_passive_improved_ammo = {
		multiplier = 0.3
	},
	bardin_ranger_passive_ammo_on_ally_pickup = {
		ammo_bonus_fraction = 0.1
	},
	bardin_ranger_passive_spawn_potions_or_bombs = {
		display_multiplier = 0.2
	},
	bardin_ranger_movement_speed = {
		multiplier = 1.1
	},
	bardin_ranger_reduced_damage_taken_headshot_buff = {
		duration = 5,
		multiplier = -0.3
	},
	bardin_ranger_reload_speed_on_multi_hit_buff = {
		duration = 2,
		multiplier = -0.35
	},
	bardin_ranger_reload_speed_on_multi_hit_add = {
		target_number = 2
	},
	bardin_ranger_activated_ability_duration = {
		duration = 15
	},
	bardin_ranger_ability_free_grenade_buff = {
		duration = 10
	}
}
TalentBuffTemplates = TalentBuffTemplates or {}
TalentBuffTemplates.dwarf_ranger = {
	bardin_ironbreaker_ability_cooldown_on_hit = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown
			}
		}
	},
	bardin_ironbreaker_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown_on_damage_taken
			}
		}
	},
	bardin_ironbreaker_passive_increased_defence = {
		buffs = {
			{
				stat_buff = "damage_taken"
			}
		}
	},
	bardin_ironbreaker_passive_increased_stamina = {
		buffs = {
			{
				stat_buff = "max_fatigue"
			}
		}
	},
	bardin_ironbreaker_passive_reduced_stun_duration = {
		buffs = {
			{
				stat_buff = "stun_duration"
			}
		}
	},
	bardin_ironbreaker_gromril_delay = {
		buffs = {
			{
				buff_after_delay = true,
				max_stacks = 1,
				refresh_durations = true,
				is_cooldown = true,
				icon = "bardin_ironbreaker_gromril_armour",
				dormant = true,
				delayed_buff_name = "bardin_ironbreaker_gromril_armour"
			}
		}
	},
	bardin_ironbreaker_refresh_gromril_armour = {
		buffs = {
			{
				event = "on_gromril_armour_removed",
				event_buff = true,
				buff_func = ProcFunctions.add_gromril_delay
			}
		}
	},
	bardin_ironbreaker_gromril_armour = {
		buffs = {
			{
				max_stacks = 1,
				icon = "bardin_ironbreaker_gromril_armour",
				dormant = true,
				refresh_durations = true
			}
		}
	},
	bardin_ironbreaker_gromril_antistun = {
		buffs = {
			{
				max_stacks = 1,
				stat_buff = "stun_duration"
			}
		}
	},
	bardin_ironbreaker_activated_ability = {
		activation_effect = "fx/screenspace_potion_03",
		buffs = {
			{
				update_func = "update_bardin_ironbreaker_activated_ability",
				stat_buff = "damage_taken",
				perk = "reduced_hit_react",
				name = "bardin_ironbreaker_activated_ability",
				remove_buff_func = "end_bardin_ironbreaker_activated_ability",
				refresh_durations = true,
				max_stacks = 1,
				icon = "bardin_ironbreaker_activated_ability",
				multiplier = buff_tweak_data.bardin_ironbreaker_activated_ability.multiplier_damage_taken
			}
		}
	},
	bardin_ironbreaker_activated_ability_block_cost = {
		buffs = {
			{
				name = "bardin_ironbreaker_ability_stamina",
				stat_buff = "block_cost",
				refresh_durations = true,
				max_stacks = 1,
				multiplier = buff_tweak_data.bardin_ironbreaker_activated_ability.multiplier_block_cost,
				duration = buff_tweak_data.bardin_ironbreaker_activated_ability.duration
			}
		}
	},
	bardin_ironbreaker_activated_ability_attack_intensity_decay_increase = {
		buffs = {
			{
				name = "bardin_ironbreaker_activated_ability_attack_intensity_decay_increase",
				stat_buff = "attack_intensity_decay",
				refresh_durations = true,
				max_stacks = 1,
				multiplier = buff_tweak_data.bardin_ironbreaker_activated_ability.attack_intensity_decay_multiplier,
				duration = buff_tweak_data.bardin_ironbreaker_activated_ability.duration
			}
		}
	},
	bardin_ironbreaker_vanguard = {
		buffs = {
			{
				multiplier = 1,
				name = "vanguard",
				event_buff = true,
				event = "on_stagger",
				perk = "tank_healing",
				buff_func = ProcFunctions.heal_stagger_targets_on_melee
			}
		}
	},
	bardin_ironbreaker_bloodlust = {
		buffs = {
			{
				multiplier = 0.45,
				name = "bloodlust",
				event_buff = true,
				event = "on_damage_dealt",
				perk = "smiter_healing",
				heal_cap = 0.25,
				buff_func = ProcFunctions.heal_percent_of_damage_dealt_on_melee
			}
		}
	},
	bardin_ironbreaker_conqueror = {
		buffs = {
			{
				multiplier = 0.2,
				name = "conqueror",
				event_buff = true,
				event = "on_healed_consumeable",
				range = 10,
				buff_func = ProcFunctions.heal_other_players_percent_at_range
			}
		}
	},
	bardin_ironbreaker_power_on_nearby_allies = {
		buffs = {
			{
				buff_to_add = "bardin_ironbreaker_power_on_nearby_allies_buff",
				chunk_size = 1,
				range = 5,
				max_stacks = 3,
				update_func = "activate_buff_stacks_based_on_ally_proximity"
			}
		}
	},
	bardin_ironbreaker_power_on_nearby_allies_buff = {
		buffs = {
			{
				dormant = true,
				icon = "bardin_ironbreaker_power_on_nearby_allies2",
				stat_buff = "power_level"
			}
		}
	},
	bardin_ironbreaker_increased_overcharge = {
		buffs = {
			{
				stat_buff = "reduced_overcharge"
			}
		}
	},
	bardin_ironbreaker_increased_ranged_power = {
		buffs = {
			{
				stat_buff = "power_level_ranged_drakefire"
			}
		}
	},
	bardin_ironbreaker_power_on_blocked_attacks_add = {
		buffs = {
			{
				buff_to_add = "bardin_ironbreaker_power_on_blocked_attacks_buff",
				chunk_size = 1,
				event_buff = true,
				event = "on_block",
				max_stacks = 1,
				max_sub_buff_stacks = 5,
				buff_func = ProcFunctions.bardin_ironbreaker_add_power_buff_on_block
			}
		}
	},
	bardin_ironbreaker_power_on_blocked_attacks_remove_damage = {
		buffs = {
			{
				buff_to_remove = "bardin_ironbreaker_power_on_blocked_attacks_buff",
				chunk_size = 1,
				event_buff = true,
				event = "on_damage_dealt",
				max_stacks = 1,
				reference_buff = "bardin_ironbreaker_power_on_blocked_attacks_add",
				buff_func = ProcFunctions.bardin_ironbreaker_remove_on_block_power_buff
			}
		}
	},
	bardin_ironbreaker_power_on_blocked_attacks_remove_stagger = {
		buffs = {
			{
				buff_to_remove = "bardin_ironbreaker_power_on_blocked_attacks_buff",
				chunk_size = 1,
				event_buff = true,
				event = "on_stagger",
				max_stacks = 1,
				reference_buff = "bardin_ironbreaker_power_on_blocked_attacks_add",
				buff_func = ProcFunctions.bardin_ironbreaker_remove_on_block_power_buff
			}
		}
	},
	bardin_ironbreaker_power_on_blocked_attacks_buff = {
		buffs = {
			{
				dormant = true,
				icon = "bardin_ironbreaker_power_on_blocked_attacks",
				stat_buff = "power_level_melee"
			}
		}
	},
	bardin_ironbreaker_stamina_regen_during_gromril = {
		buffs = {
			{
				buff_to_add = "bardin_ironbreaker_gromril_stamina_regen",
				activation_buff = "bardin_ironbreaker_gromril_armour",
				update_func = "activate_buff_on_other_buff"
			}
		}
	},
	bardin_ironbreaker_gromril_stamina_regen = {
		buffs = {
			{
				max_stacks = 1,
				icon = "bardin_ironbreaker_stamina_regen_during_gromril",
				stat_buff = "fatigue_regen"
			}
		}
	},
	bardin_ironbreaker_gromril_delay_short = {
		buffs = {
			{
				buff_after_delay = true,
				name = "gromril_delay",
				max_stacks = 1,
				refresh_durations = true,
				is_cooldown = true,
				icon = "bardin_ironbreaker_gromril_armour",
				dormant = true,
				delayed_buff_name = "bardin_ironbreaker_gromril_armour"
			}
		}
	},
	bardin_ironbreaker_gromril_stagger = {
		buffs = {
			{
				event = "on_gromril_armour_removed",
				event_buff = true,
				buff_func = ProcFunctions.bardin_ironbreaker_gromril_stagger,
				explosion_template = ExplosionTemplates.bardin_ironbreaker_gromril_stagger
			}
		}
	},
	bardin_ironbreaker_regen_stamina_on_charged_attacks = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = ProcFunctions.bardin_ironbreaker_regen_stamina_on_charged_attacks
			}
		}
	},
	bardin_ironbreaker_regen_stamina_on_charged_attacks_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "bardin_ironbreaker_regen_stamina_on_charged_attacks",
				stat_buff = "fatigue_regen",
				refresh_durations = true
			}
		}
	},
	bardin_ironbreaker_regen_stamina_on_block_broken = {
		buffs = {
			{
				event = "on_block_broken",
				event_buff = true,
				buff_func = ProcFunctions.bardin_ironbreaker_regen_stamina_on_block_broken
			}
		}
	},
	bardin_ironbreaker_cooldown_reduction_on_kill_while_full_stamina = {
		buffs = {
			{
				event = "on_kill",
				event_buff = true,
				buff_func = ProcFunctions.bardin_ironbreaker_cooldown_reduction_on_kill_while_full_stamina
			}
		}
	},
	bardin_ironbreaker_activated_ability_taunt_range_and_duration = {
		activation_effect = "fx/screenspace_potion_03",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		activation_sound = "hud_gameplay_stance_tank_activate",
		buffs = {
			{
				update_func = "update_bardin_ironbreaker_activated_ability",
				stat_buff = "damage_taken",
				perk = "reduced_hit_react",
				name = "bardin_ironbreaker_activated_ability_duration",
				remove_buff_func = "end_bardin_ironbreaker_activated_ability",
				refresh_durations = true,
				max_stacks = 1,
				icon = "bardin_ironbreaker_activated_ability",
				multiplier = buff_tweak_data.bardin_ironbreaker_activated_ability_taunt_range_and_duration.multiplier_damage_taken
			}
		}
	},
	bardin_ironbreaker_activated_ability_taunt_range_and_duration_block_cost = {
		buffs = {
			{
				refresh_durations = true,
				stat_buff = "block_cost",
				max_stacks = 1,
				multiplier = buff_tweak_data.bardin_ironbreaker_activated_ability_taunt_range_and_duration.multiplier_block_cost,
				duration = buff_tweak_data.bardin_ironbreaker_activated_ability_taunt_range_and_duration.duration
			}
		}
	},
	bardin_ironbreaker_activated_ability_taunt_range_and_duration_attack_intensity_decay_increase = {
		buffs = {
			{
				name = "bardin_ironbreaker_activated_ability_attack_intensity_decay_increase",
				stat_buff = "attack_intensity_decay",
				refresh_durations = true,
				max_stacks = 1,
				multiplier = buff_tweak_data.bardin_ironbreaker_activated_ability_taunt_range_and_duration.attack_intensity_decay_multiplier,
				duration = buff_tweak_data.bardin_ironbreaker_activated_ability_taunt_range_and_duration.duration
			}
		}
	},
	bardin_ironbreaker_activated_ability_power_buff = {
		buffs = {
			{
				dormant = true,
				icon = "bardin_ironbreaker_activated_ability_power_buff_allies",
				stat_buff = "power_level",
				refresh_durations = true
			}
		}
	},
	bardin_slayer_ability_cooldown_on_hit = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown
			}
		}
	},
	bardin_slayer_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown_on_damage_taken
			}
		}
	},
	bardin_slayer_passive_attack_speed = {
		buffs = {
			{
				stat_buff = "attack_speed"
			}
		}
	},
	bardin_slayer_passive_uninterruptible_heavy = {
		buffs = {
			{
				perk = "uninterruptible_heavy"
			}
		}
	},
	bardin_slayer_passive_stacking_damage_buff_on_hit = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				max_stacks = buff_tweak_data.bardin_slayer_passive_stacking_damage_buff.max_stacks,
				buff_func = ProcFunctions.add_bardin_slayer_passive_buff
			}
		}
	},
	bardin_slayer_passive_stacking_damage_buff = {
		buffs = {
			{
				refresh_durations = true,
				icon = "bardin_slayer_passive",
				stat_buff = "increased_weapon_damage"
			}
		}
	},
	bardin_slayer_activated_ability = {
		buffs = {
			{
				icon = "bardin_slayer_activated_ability",
				name = "bardin_slayer_frenzy",
				stat_buff = "attack_speed",
				perk = "no_ranged_knockback",
				max_stacks = 1,
				remove_buff_func = "end_slayer_activated_ability",
				dormant = true,
				refresh_durations = true
			}
		}
	},
	bardin_slayer_reaper = {
		buffs = {
			{
				multiplier = -0.05,
				name = "reaper",
				event_buff = true,
				event = "on_damage_dealt",
				perk = "linesman_healing",
				max_targets = 5,
				bonus = 0.25,
				buff_func = ProcFunctions.heal_damage_targets_on_melee
			}
		}
	},
	bardin_slayer_bloodlust = {
		buffs = {
			{
				multiplier = 0.45,
				name = "bloodlust",
				event_buff = true,
				event = "on_damage_dealt",
				perk = "smiter_healing",
				heal_cap = 0.25,
				buff_func = ProcFunctions.heal_percent_of_damage_dealt_on_melee
			}
		}
	},
	bardin_slayer_conqueror = {
		buffs = {
			{
				multiplier = 0.2,
				name = "conqueror",
				event_buff = true,
				event = "on_healed_consumeable",
				range = 10,
				buff_func = ProcFunctions.heal_other_players_percent_at_range
			}
		}
	},
	bardin_slayer_crit_chance = {
		buffs = {
			{
				stat_buff = "critical_strike_chance"
			}
		}
	},
	bardin_slayer_power_on_double_two_handed_weapons = {
		buffs = {
			{
				buff_to_add = "bardin_slayer_power_on_double_two_handed_weapons_buff",
				update_func = "bardin_slayer_activate_buff_on_loadout",
				buff_type = "MELEE_2H"
			}
		}
	},
	bardin_slayer_power_on_double_two_handed_weapons_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "bardin_slayer_power_on_double_two_handed_weapons",
				stat_buff = "power_level",
				dormant = true
			}
		}
	},
	bardin_slayer_attack_speed_on_double_one_handed_weapons = {
		buffs = {
			{
				buff_to_add = "bardin_slayer_attack_speed_on_double_one_handed_weapons_buff",
				update_func = "bardin_slayer_activate_buff_on_loadout",
				buff_type = "MELEE_1H"
			}
		}
	},
	bardin_slayer_attack_speed_on_double_one_handed_weapons_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "bardin_slayer_attack_speed_on_double_one_handed_weapons",
				stat_buff = "attack_speed",
				dormant = true
			}
		}
	},
	bardin_slayer_passive_cooldown_reduction_on_max_stacks = {
		buffs = {
			{
				icon = "bardin_slayer_passive_cooldown_reduction_on_max_stacks",
				stat_buff = "cooldown_regen",
				max_stacks = 1,
				refresh_durations = true,
				duration = buff_tweak_data.bardin_slayer_passive_stacking_damage_buff.duration
			}
		}
	},
	bardin_slayer_passive_increased_max_stacks = {
		buffs = {
			{
				refresh_durations = true,
				icon = "bardin_slayer_passive",
				stat_buff = "increased_weapon_damage"
			}
		}
	},
	bardin_slayer_passive_movement_speed = {
		buffs = {
			{
				remove_buff_func = "remove_movement_buff",
				dormant = true,
				refresh_durations = true,
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			}
		}
	},
	bardin_slayer_damage_taken_capped = {
		buffs = {
			{
				stat_buff = "max_damage_taken"
			}
		}
	},
	bardin_slayer_damage_reduction_on_melee_charge_action = {
		buffs = {
			{
				buff_to_add = "bardin_slayer_damage_reduction_on_melee_charge_action_buff",
				update_func = "bardin_slayer_active_buff_on_charge_action"
			}
		}
	},
	bardin_slayer_damage_reduction_on_melee_charge_action_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "bardin_slayer_damage_reduction_on_melee_charge_action",
				stat_buff = "damage_taken_secondary",
				refresh_durations = true
			}
		}
	},
	bardin_slayer_push_on_dodge = {
		buffs = {
			{
				event = "on_dodge",
				explosion_template = "bardin_slayer_push_on_dodge",
				event_buff = true,
				buff_func = ProcFunctions.bardin_slayer_push_on_dodge
			}
		}
	},
	bardin_slayer_activated_ability_leap_damage_add = {
		buffs = {
			{
				buff_to_add = "bardin_slayer_activated_ability_leap_damage_buff",
				max_stacks = 1,
				event_buff = true,
				event = "on_leap_start",
				buff_func = ProcFunctions.bardin_slayer_add_buff_on_leap_start
			}
		}
	},
	bardin_slayer_activated_ability_leap_damage_remove = {
		buffs = {
			{
				event = "on_leap_finished",
				max_stacks = 1,
				event_buff = true,
				parent_buff = "bardin_slayer_activated_ability_leap_damage_add",
				buff_func = ProcFunctions.bardin_slayer_remove_buff_on_leap_finished
			}
		}
	},
	bardin_slayer_activated_ability_leap_damage_buff = {
		buffs = {
			{
				perk = "bloody_mess",
				stat_buff = "power_level",
				max_stacks = 1,
				icon = "bardin_slayer_activated_ability_leap_damage",
				dormant = true
			}
		}
	},
	bardin_slayer_activated_ability_movement = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				refresh_durations = true,
				max_stacks = 1,
				remove_buff_func = "remove_movement_buff",
				duration = buff_tweak_data.bardin_slayer_activated_ability.duration,
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			}
		}
	},
	bardin_ranger_ability_cooldown_on_hit = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown
			}
		}
	},
	bardin_ranger_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown_on_damage_taken
			}
		}
	},
	bardin_ranger_passive = {
		buffs = {
			{
				event = "on_special_killed",
				event_buff = true,
				buff_func = ProcFunctions.bardin_ranger_scavenge_proc
			}
		}
	},
	bardin_ranger_passive_consumeable_dupe_healing = {
		buffs = {
			{
				dormant = true,
				stat_buff = "not_consume_medpack"
			}
		}
	},
	bardin_ranger_passive_consumeable_dupe_potion = {
		buffs = {
			{
				dormant = true,
				stat_buff = "not_consume_potion"
			}
		}
	},
	bardin_ranger_passive_consumeable_dupe_grenade = {
		buffs = {
			{
				dormant = true,
				stat_buff = "not_consume_grenade"
			}
		}
	},
	bardin_ranger_passive_reload_speed = {
		buffs = {
			{
				stat_buff = "reload_speed"
			}
		}
	},
	bardin_ranger_passive_increased_ammunition = {
		buffs = {
			{
				stat_buff = "total_ammo"
			}
		}
	},
	bardin_ranger_activated_ability = {
		deactivation_effect = "fx/screenspace_ranger_skill_02",
		buffs = {
			{
				continuous_effect = "fx/screenspace_ranger_skill_01",
				name = "bardin_ranger_activated_ability",
				refresh_durations = true,
				area_unit_name = "units/hub_elements/empty",
				remove_buff_func = "end_ranger_activated_ability",
				refresh_buff_area_position = true,
				area_radius = 7,
				buff_area = true,
				max_stacks = 1,
				icon = "bardin_ranger_activated_ability"
			}
		}
	},
	bardin_ranger_reaper = {
		buffs = {
			{
				multiplier = -0.05,
				name = "reaper",
				event_buff = true,
				event = "on_damage_dealt",
				perk = "linesman_healing",
				max_targets = 5,
				bonus = 0.25,
				buff_func = ProcFunctions.heal_damage_targets_on_melee
			}
		}
	},
	bardin_ranger_vanguard = {
		buffs = {
			{
				multiplier = 1,
				name = "vanguard",
				event_buff = true,
				event = "on_stagger",
				perk = "tank_healing",
				buff_func = ProcFunctions.heal_stagger_targets_on_melee
			}
		}
	},
	bardin_ranger_conqueror = {
		buffs = {
			{
				multiplier = 0.2,
				name = "conqueror",
				event_buff = true,
				event = "on_healed_consumeable",
				range = 10,
				buff_func = ProcFunctions.heal_other_players_percent_at_range
			}
		}
	},
	bardin_ranger_increased_melee_damage_on_no_ammo_add = {
		buffs = {
			{
				buff_to_add = "bardin_ranger_melee_damage_on_no_ammo",
				event = "on_last_ammo_used",
				event_buff = true,
				buff_func = ProcFunctions.bardin_ranger_add_power_on_no_ammo_proc
			}
		}
	},
	bardin_ranger_increased_melee_damage_on_no_ammo_remove = {
		buffs = {
			{
				event = "on_gained_ammo_from_no_ammo",
				buff_to_remove = "bardin_ranger_melee_damage_on_no_ammo",
				event_buff = true,
				buff_func = ProcFunctions.bardin_ranger_remove_power_on_no_ammo_proc
			}
		}
	},
	bardin_ranger_melee_damage_on_no_ammo = {
		buffs = {
			{
				max_stacks = 1,
				icon = "bardin_ranger_increased_melee_damage_on_no_ammo",
				priority_buff = true,
				stat_buff = "power_level"
			}
		}
	},
	bardin_ranger_cooldown_on_reload = {
		buffs = {
			{
				event = "on_reload",
				event_buff = true,
				buff_func = ProcFunctions.reduce_activated_ability_cooldown
			}
		}
	},
	bardin_ranger_attack_speed = {
		buffs = {
			{
				stat_buff = "attack_speed"
			}
		}
	},
	bardin_ranger_passive_ammo_on_ally_pickup = {
		buffs = {
			{
				event = "on_bardin_consumable_picked_up_any_player",
				event_buff = true,
				buff_func = ProcFunctions.bardin_ranger_restore_ammo_on_ally_picked_up_ammo
			}
		}
	},
	bardin_ranger_movement_speed = {
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
	bardin_ranger_reduced_damage_taken_headshot = {
		buffs = {
			{
				event = "on_hit",
				buff_to_add = "bardin_ranger_reduced_damage_taken_headshot_buff",
				event_buff = true,
				buff_func = ProcFunctions.add_buff_on_headshot
			}
		}
	},
	bardin_ranger_reduced_damage_taken_headshot_buff = {
		buffs = {
			{
				icon = "bardin_ranger_reduced_damage_taken_headshot",
				stat_buff = "damage_taken",
				max_stacks = 1,
				refresh_durations = true,
				dormant = true
			}
		}
	},
	bardin_ranger_reload_speed_on_multi_hit_add = {
		buffs = {
			{
				event = "on_hit",
				buff_to_add = "bardin_ranger_reload_speed_on_multi_hit_buff",
				event_buff = true,
				buff_func = ProcFunctions.bardin_ranger_add_reload_speed_buff
			}
		}
	},
	bardin_ranger_reload_speed_on_multi_hit_buff = {
		buffs = {
			{
				icon = "bardin_ranger_reload_speed_on_multi_hit",
				stat_buff = "reload_speed",
				max_stacks = 1,
				refresh_durations = true,
				dormant = true
			}
		}
	},
	bardin_ranger_activated_ability_duration = {
		deactivation_effect = "fx/screenspace_ranger_skill_02",
		buffs = {
			{
				continuous_effect = "fx/screenspace_ranger_skill_01",
				name = "bardin_ranger_activated_ability_duration",
				refresh_durations = true,
				area_unit_name = "units/hub_elements/empty",
				remove_buff_func = "end_ranger_activated_ability",
				refresh_buff_area_position = true,
				area_radius = 7,
				buff_area = true,
				max_stacks = 1,
				icon = "bardin_ranger_activated_ability"
			}
		}
	},
	bardin_ranger_activated_ability_stealth_outside_of_smoke = {
		deactivation_effect = "fx/screenspace_ranger_skill_02",
		buffs = {
			{
				remove_buff_func = "end_ranger_activated_ability",
				name = "bardin_ranger_activated_ability_stealth_outside_of_smoke",
				icon = "bardin_ranger_activated_ability",
				area_unit_name = "units/hub_elements/empty",
				refresh_durations = true,
				refresh_buff_area_position = true,
				area_radius = 7,
				continuous_effect = "fx/screenspace_ranger_skill_01",
				max_stacks = 1,
				duration = 10
			}
		}
	},
	bardin_ranger_ability_free_grenade_remove = {
		buffs = {
			{
				event = "on_grenade_use",
				buff_to_remove = "bardin_ranger_ability_free_grenade_buff",
				event_buff = true,
				buff_func = ProcFunctions.remove_non_stacking_buff
			}
		}
	},
	bardin_ranger_ability_free_grenade_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "bardin_ranger_ability_free_grenade",
				dormant = true,
				perk = "free_grenade"
			}
		}
	}
}
TalentTrees = TalentTrees or {}
TalentTrees.dwarf_ranger = {
	{
		{
			"bardin_ironbreaker_vanguard",
			"bardin_ironbreaker_bloodlust_2",
			"bardin_ironbreaker_heal_share"
		},
		{
			"bardin_ironbreaker_increased_overcharge_increased_range_power",
			"bardin_ironbreaker_power_on_nearby_allies",
			"bardin_ironbreaker_power_on_blocked_attacks"
		},
		{
			"bardin_ironbreaker_tank_unbalance",
			"bardin_ironbreaker_smiter_unbalance",
			"bardin_ironbreaker_power_level_unbalance"
		},
		{
			"bardin_ironbreaker_stamina_regen_during_gromril",
			"bardin_ironbreaker_gromril_stagger",
			"bardin_ironbreaker_max_gromril_delay"
		},
		{
			"bardin_ironbreaker_regen_stamina_on_block_broken",
			"bardin_ironbreaker_cooldown_reduction_on_kill_while_full_stamina",
			"bardin_ironbreaker_regen_stamina_on_charged_attacks"
		},
		{
			"bardin_ironbreaker_activated_ability_power_buff_allies",
			"bardin_ironbreaker_activated_ability_taunt_bosses",
			"bardin_ironbreaker_activated_ability_taunt_range_and_duration"
		}
	},
	{
		{
			"bardin_slayer_reaper",
			"bardin_slayer_bloodlust_2",
			"bardin_slayer_heal_share"
		},
		{
			"bardin_slayer_attack_speed_on_double_one_handed_weapons",
			"bardin_slayer_power_on_double_two_handed_weapons",
			"bardin_slayer_crit_chance"
		},
		{
			"bardin_slayer_smiter_unbalance",
			"bardin_slayer_linesman_unbalance",
			"bardin_slayer_power_level_unbalance"
		},
		{
			"bardin_slayer_passive_movement_speed",
			"bardin_slayer_passive_increased_max_stacks",
			"bardin_slayer_passive_cooldown_reduction_on_max_stacks"
		},
		{
			"bardin_slayer_damage_taken_capped",
			"bardin_slayer_damage_reduction_on_melee_charge_action",
			"bardin_slayer_push_on_dodge"
		},
		{
			"bardin_slayer_activated_ability_leap_range",
			"bardin_slayer_activated_ability_leap_damage",
			"bardin_slayer_activated_ability_movement"
		}
	},
	{
		{
			"bardin_ranger_vanguard",
			"bardin_ranger_reaper",
			"bardin_ranger_heal_share"
		},
		{
			"bardin_ranger_increased_melee_damage_on_no_ammo",
			"bardin_ranger_cooldown_on_reload",
			"bardin_ranger_attack_speed"
		},
		{
			"bardin_ranger_tank_unbalance",
			"bardin_ranger_linesman_unbalance",
			"bardin_ranger_power_level_unbalance"
		},
		{
			"bardin_ranger_passive_ammo_on_ally_pickup",
			"bardin_ranger_passive_improved_ammo",
			"bardin_ranger_passive_spawn_potions_or_bombs"
		},
		{
			"bardin_ranger_movement_speed",
			"bardin_ranger_reduced_damage_taken_headshot",
			"bardin_ranger_reload_speed_on_multi_hit"
		},
		{
			"bardin_ranger_activated_ability_duration",
			"bardin_ranger_activated_ability_stealth_outside_of_smoke",
			"bardin_ranger_ability_free_grenade"
		}
	}
}
Talents = Talents or {}
Talents.dwarf_ranger = {
	{
		description = "vanguard_desc",
		name = "bardin_ironbreaker_vanguard",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_ironbreaker_regrowth",
		description_values = {},
		requirements = {},
		buffs = {
			"bardin_ironbreaker_vanguard"
		},
		buff_data = {}
	},
	{
		description = "bloodlust_desc_3",
		name = "bardin_ironbreaker_bloodlust_2",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_ironbreaker_bloodlust",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.bloodlust.buffs[1].multiplier
			}
		},
		requirements = {},
		buffs = {
			"bardin_ironbreaker_bloodlust"
		},
		buff_data = {}
	},
	{
		description = "conqueror_desc_3",
		name = "bardin_ironbreaker_heal_share",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_ironbreaker_conqueror",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.conqueror.buffs[1].multiplier
			}
		},
		requirements = {},
		buffs = {
			"bardin_ironbreaker_conqueror"
		},
		buff_data = {}
	},
	{
		description = "bardin_ironbreaker_power_on_nearby_allies_desc",
		name = "bardin_ironbreaker_power_on_nearby_allies",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_ironbreaker_power_on_nearby_allies2",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ironbreaker_power_on_nearby_allies_buff.multiplier
			}
		},
		requirements = {},
		buffs = {
			"bardin_ironbreaker_power_on_nearby_allies"
		},
		buff_data = {}
	},
	{
		description = "bardin_ironbreaker_increased_overcharge_increased_range_power_desc",
		name = "bardin_ironbreaker_increased_overcharge_increased_range_power",
		num_ranks = 1,
		buffer = "both",
		icon = "bardin_ironbreaker_increased_overcharge_increased_range_power",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ironbreaker_increased_ranged_power.multiplier
			},
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ironbreaker_increased_overcharge.multiplier
			}
		},
		requirements = {},
		buffs = {
			"bardin_ironbreaker_increased_overcharge",
			"bardin_ironbreaker_increased_ranged_power"
		},
		buff_data = {}
	},
	{
		description = "bardin_ironbreaker_power_on_blocked_attacks_desc",
		name = "bardin_ironbreaker_power_on_blocked_attacks",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_ironbreaker_power_on_blocked_attacks",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ironbreaker_power_on_blocked_attacks_buff.multiplier
			},
			{
				value = buff_tweak_data.bardin_ironbreaker_power_on_blocked_attacks_buff.max_stacks
			}
		},
		requirements = {},
		buffs = {
			"bardin_ironbreaker_power_on_blocked_attacks_add",
			"bardin_ironbreaker_power_on_blocked_attacks_remove_damage",
			"bardin_ironbreaker_power_on_blocked_attacks_remove_stagger"
		},
		buff_data = {}
	},
	{
		description = "bardin_ironbreaker_stamina_regen_during_gromril_desc",
		name = "bardin_ironbreaker_stamina_regen_during_gromril",
		num_ranks = 1,
		icon = "bardin_ironbreaker_stamina_regen_during_gromril",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ironbreaker_gromril_stamina_regen.multiplier
			}
		},
		requirements = {},
		buffs = {
			"bardin_ironbreaker_stamina_regen_during_gromril"
		},
		buff_data = {}
	},
	{
		description = "bardin_ironbreaker_max_gromril_delay_desc",
		name = "bardin_ironbreaker_max_gromril_delay",
		num_ranks = 1,
		icon = "bardin_ironbreaker_max_gromril_delay",
		description_values = {
			{
				value = buff_tweak_data.bardin_ironbreaker_gromril_delay_short.duration
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "bardin_ironbreaker_gromril_stagger_desc",
		name = "bardin_ironbreaker_gromril_stagger",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_ironbreaker_gromril_stagger",
		description_values = {},
		requirements = {},
		buffs = {
			"bardin_ironbreaker_gromril_stagger"
		},
		buff_data = {}
	},
	{
		description = "bardin_ironbreaker_regen_stamina_on_charged_attacks_desc",
		name = "bardin_ironbreaker_regen_stamina_on_charged_attacks",
		num_ranks = 1,
		icon = "bardin_ironbreaker_regen_stamina_on_charged_attacks",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ironbreaker_regen_stamina_on_charged_attacks_buff.multiplier
			},
			{
				value = buff_tweak_data.bardin_ironbreaker_regen_stamina_on_charged_attacks_buff.duration
			}
		},
		requirements = {},
		buffs = {
			"bardin_ironbreaker_regen_stamina_on_charged_attacks"
		},
		buff_data = {}
	},
	{
		description = "bardin_ironbreaker_regen_stamina_on_block_broken_desc",
		name = "bardin_ironbreaker_regen_stamina_on_block_broken",
		num_ranks = 1,
		icon = "bardin_ironbreaker_regen_stamina_on_block_broken",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ironbreaker_regen_stamina_on_block_broken.proc_chance
			}
		},
		requirements = {},
		buffs = {
			"bardin_ironbreaker_regen_stamina_on_block_broken"
		},
		buff_data = {}
	},
	{
		description = "bardin_ironbreaker_cooldown_reduction_on_kill_while_full_stamina_desc",
		name = "bardin_ironbreaker_cooldown_reduction_on_kill_while_full_stamina",
		num_ranks = 1,
		icon = "bardin_ironbreaker_cooldown_reduction_on_kill_while_full_stamina",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ironbreaker_cooldown_reduction_on_kill_while_full_stamina.cooldown_reduction
			}
		},
		requirements = {},
		buffs = {
			"bardin_ironbreaker_cooldown_reduction_on_kill_while_full_stamina"
		},
		buff_data = {}
	},
	{
		description = "bardin_ironbreaker_activated_ability_power_buff_allies_desc",
		name = "bardin_ironbreaker_activated_ability_power_buff_allies",
		num_ranks = 1,
		icon = "bardin_ironbreaker_activated_ability_power_buff_allies",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ironbreaker_activated_ability_power_buff.multiplier
			},
			{
				value = buff_tweak_data.bardin_ironbreaker_activated_ability_power_buff.duration
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "bardin_ironbreaker_activated_ability_taunt_bosses_desc",
		name = "bardin_ironbreaker_activated_ability_taunt_bosses",
		num_ranks = 1,
		icon = "bardin_ironbreaker_activated_ability_taunt_bosses",
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "bardin_ironbreaker_activated_ability_taunt_range_and_duration_desc",
		name = "bardin_ironbreaker_activated_ability_taunt_range_and_duration",
		num_ranks = 1,
		icon = "bardin_ironbreaker_activated_ability_duration",
		description_values = {
			{
				value = buff_tweak_data.bardin_ironbreaker_activated_ability_taunt_range_and_duration.duration
			},
			{
				value = buff_tweak_data.bardin_ironbreaker_activated_ability_taunt_range_and_duration.range
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "tank_unbalance_desc",
		name = "bardin_ironbreaker_tank_unbalance",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_ironbreaker_tank_unbalance",
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
		name = "bardin_ironbreaker_smiter_unbalance",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_ironbreaker_smiter_unbalance",
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
		name = "bardin_ironbreaker_power_level_unbalance",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_ironbreaker_power_level_unbalance",
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
		name = "bardin_slayer_reaper",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_slayer_regrowth",
		description_values = {
			{
				value = BuffTemplates.reaper.buffs[1].max_targets
			}
		},
		requirements = {},
		buffs = {
			"bardin_slayer_reaper"
		},
		buff_data = {}
	},
	{
		description = "bloodlust_desc_3",
		name = "bardin_slayer_bloodlust_2",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_slayer_bloodlust",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.bloodlust.buffs[1].multiplier
			}
		},
		requirements = {},
		buffs = {
			"bardin_slayer_bloodlust"
		},
		buff_data = {}
	},
	{
		description = "conqueror_desc_3",
		name = "bardin_slayer_heal_share",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_slayer_conqueror",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.conqueror.buffs[1].multiplier
			}
		},
		requirements = {},
		buffs = {
			"bardin_slayer_conqueror"
		},
		buff_data = {}
	},
	{
		description = "bardin_slayer_crit_chance_desc",
		name = "bardin_slayer_crit_chance",
		num_ranks = 1,
		icon = "bardin_slayer_crit_chance",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_slayer_crit_chance.bonus
			}
		},
		requirements = {},
		buffs = {
			"bardin_slayer_crit_chance"
		},
		buff_data = {}
	},
	{
		description = "bardin_slayer_power_on_double_two_handed_weapons_desc",
		name = "bardin_slayer_power_on_double_two_handed_weapons",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_slayer_power_on_double_two_handed_weapons",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_slayer_power_on_double_two_handed_weapons_buff.multiplier
			}
		},
		requirements = {},
		buffs = {
			"bardin_slayer_power_on_double_two_handed_weapons"
		},
		buff_data = {}
	},
	{
		description = "bardin_slayer_attack_speed_on_double_one_handed_weapons_desc",
		name = "bardin_slayer_attack_speed_on_double_one_handed_weapons",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_slayer_attack_speed_on_double_one_handed_weapons",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_slayer_attack_speed_on_double_one_handed_weapons_buff.multiplier
			}
		},
		requirements = {},
		buffs = {
			"bardin_slayer_attack_speed_on_double_one_handed_weapons"
		},
		buff_data = {}
	},
	{
		description = "bardin_slayer_passive_cooldown_reduction_on_max_stacks_desc",
		name = "bardin_slayer_passive_cooldown_reduction_on_max_stacks",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_slayer_passive_cooldown_reduction_on_max_stacks",
		description_values = {},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "bardin_slayer_passive_movement_speed_desc",
		name = "bardin_slayer_passive_movement_speed",
		num_ranks = 1,
		buffer = "both",
		icon = "bardin_slayer_passive_movement_speed",
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.bardin_slayer_passive_movement_speed.multiplier
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "bardin_slayer_passive_increased_max_stacks_desc",
		name = "bardin_slayer_passive_increased_max_stacks",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_slayer_passive_increased_max_stacks",
		description_values = {
			{
				value = buff_tweak_data.bardin_slayer_passive_increased_max_stacks.display_value
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "bardin_slayer_damage_taken_capped_desc_2",
		name = "bardin_slayer_damage_taken_capped",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_slayer_damage_taken_capped",
		description_values = {
			{
				value = buff_tweak_data.bardin_slayer_damage_taken_capped.bonus
			}
		},
		requirements = {},
		buffs = {
			"bardin_slayer_damage_taken_capped"
		},
		buff_data = {}
	},
	{
		description = "bardin_slayer_damage_reduction_on_melee_charge_action_desc",
		name = "bardin_slayer_damage_reduction_on_melee_charge_action",
		num_ranks = 1,
		icon = "bardin_slayer_damage_reduction_on_melee_charge_action",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_slayer_damage_reduction_on_melee_charge_action_buff.multiplier
			}
		},
		requirements = {},
		buffs = {
			"bardin_slayer_damage_reduction_on_melee_charge_action"
		},
		buff_data = {}
	},
	{
		description = "bardin_slayer_push_on_dodge_desc",
		name = "bardin_slayer_push_on_dodge",
		num_ranks = 1,
		icon = "bardin_slayer_push_on_dodge",
		description_values = {},
		requirements = {},
		buffs = {
			"bardin_slayer_push_on_dodge"
		},
		buff_data = {}
	},
	{
		description = "bardin_slayer_activated_ability_leap_range_desc",
		name = "bardin_slayer_activated_ability_leap_range",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_slayer_activated_ability_leap_range",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_slayer_activated_ability_leap_range.display_multiplier
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "bardin_slayer_activated_ability_leap_damage_desc",
		name = "bardin_slayer_activated_ability_leap_damage",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_slayer_activated_ability_leap_damage",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_slayer_activated_ability_leap_damage_buff.multiplier
			}
		},
		requirements = {},
		buffs = {
			"bardin_slayer_activated_ability_leap_damage_add",
			"bardin_slayer_activated_ability_leap_damage_remove"
		},
		buff_data = {}
	},
	{
		description = "bardin_slayer_activated_ability_movement_desc_2",
		name = "bardin_slayer_activated_ability_movement",
		num_ranks = 1,
		icon = "bardin_slayer_activated_ability_movement",
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.bardin_slayer_activated_ability_movement.multiplier
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "smiter_unbalance_desc",
		name = "bardin_slayer_smiter_unbalance",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_slayer_smiter_unbalance",
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
		description = "linesman_unbalance_desc",
		name = "bardin_slayer_linesman_unbalance",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_slayer_linesman_unbalance",
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
		name = "bardin_slayer_power_level_unbalance",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_slayer_power_level_unbalance",
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
		description = "vanguard_desc",
		name = "bardin_ranger_vanguard",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_ranger_regrowth",
		description_values = {},
		requirements = {},
		buffs = {
			"bardin_ranger_vanguard"
		},
		buff_data = {}
	},
	{
		description = "reaper_desc",
		name = "bardin_ranger_reaper",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_ranger_bloodlust",
		description_values = {
			{
				value = BuffTemplates.reaper.buffs[1].max_targets
			}
		},
		requirements = {},
		buffs = {
			"bardin_ranger_reaper"
		},
		buff_data = {}
	},
	{
		description = "conqueror_desc_3",
		name = "bardin_ranger_heal_share",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_ranger_conqueror",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.conqueror.buffs[1].multiplier
			}
		},
		requirements = {},
		buffs = {
			"bardin_ranger_conqueror"
		},
		buff_data = {}
	},
	{
		description = "bardin_ranger_increased_melee_damage_on_no_ammo_desc",
		name = "bardin_ranger_increased_melee_damage_on_no_ammo",
		num_ranks = 1,
		buffer = "both",
		icon = "bardin_ranger_increased_melee_damage_on_no_ammo",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ranger_melee_damage_on_no_ammo.multiplier
			}
		},
		requirements = {},
		buffs = {
			"bardin_ranger_increased_melee_damage_on_no_ammo_add",
			"bardin_ranger_increased_melee_damage_on_no_ammo_remove"
		},
		buff_data = {}
	},
	{
		description = "bardin_ranger_cooldown_on_reload_desc",
		name = "bardin_ranger_cooldown_on_reload",
		num_ranks = 1,
		buffer = "both",
		icon = "bardin_ranger_cooldown_on_reload",
		description_values = {
			{
				value = buff_tweak_data.bardin_ranger_cooldown_on_reload.bonus
			}
		},
		requirements = {},
		buffs = {
			"bardin_ranger_cooldown_on_reload"
		},
		buff_data = {}
	},
	{
		description = "bardin_ranger_attack_speed_desc",
		name = "bardin_ranger_attack_speed",
		num_ranks = 1,
		icon = "bardin_ranger_attack_speed",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ranger_attack_speed.multiplier
			}
		},
		requirements = {},
		buffs = {
			"bardin_ranger_attack_speed"
		},
		buff_data = {}
	},
	{
		description = "bardin_ranger_passive_spawn_potions_or_bombs_desc",
		name = "bardin_ranger_passive_spawn_potions_or_bombs",
		num_ranks = 1,
		icon = "bardin_ranger_passive_spawn_potions",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ranger_passive_spawn_potions_or_bombs.display_multiplier
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "bardin_ranger_passive_improved_ammo_desc_2",
		name = "bardin_ranger_passive_improved_ammo",
		num_ranks = 1,
		icon = "bardin_ranger_passive_improved_ammo",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ranger_passive_improved_ammo.multiplier
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "bardin_ranger_passive_ammo_on_ally_pickup_desc",
		name = "bardin_ranger_passive_ammo_on_ally_pickup",
		num_ranks = 1,
		icon = "bardin_ranger_passive_ammo_on_ally_pickup",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ranger_passive_ammo_on_ally_pickup.ammo_bonus_fraction
			}
		},
		requirements = {},
		buffs = {
			"bardin_ranger_passive_ammo_on_ally_pickup"
		},
		buff_data = {}
	},
	{
		description = "bardin_ranger_movement_speed_desc",
		name = "bardin_ranger_movement_speed",
		num_ranks = 1,
		icon = "bardin_ranger_movement_speed",
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.bardin_ranger_movement_speed.multiplier
			}
		},
		requirements = {},
		buffs = {
			"bardin_ranger_movement_speed"
		},
		buff_data = {}
	},
	{
		description = "bardin_ranger_reduced_damage_taken_headshot_desc",
		name = "bardin_ranger_reduced_damage_taken_headshot",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_ranger_reduced_damage_taken_headshot",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ranger_reduced_damage_taken_headshot_buff.multiplier
			},
			{
				value = buff_tweak_data.bardin_ranger_reduced_damage_taken_headshot_buff.duration
			}
		},
		requirements = {},
		buffs = {
			"bardin_ranger_reduced_damage_taken_headshot"
		},
		buff_data = {}
	},
	{
		description = "bardin_ranger_reload_speed_on_multi_hit_desc",
		name = "bardin_ranger_reload_speed_on_multi_hit",
		num_ranks = 1,
		icon = "bardin_ranger_reload_speed_on_multi_hit",
		description_values = {
			{
				value = buff_tweak_data.bardin_ranger_reload_speed_on_multi_hit_add.target_number
			},
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ranger_reload_speed_on_multi_hit_buff.multiplier
			}
		},
		requirements = {},
		buffs = {
			"bardin_ranger_reload_speed_on_multi_hit_add"
		},
		buff_data = {}
	},
	{
		description = "bardin_ranger_activated_ability_duration_desc",
		name = "bardin_ranger_activated_ability_duration",
		num_ranks = 1,
		icon = "bardin_ranger_activated_ability_duration",
		description_values = {
			{
				value = buff_tweak_data.bardin_ranger_activated_ability_duration.duration
			}
		},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "bardin_ranger_activated_ability_stealth_outside_of_smoke_desc",
		name = "bardin_ranger_activated_ability_stealth_outside_of_smoke",
		num_ranks = 1,
		icon = "bardin_ranger_activated_ability_stealth_outside_of_smoke",
		description_values = {},
		requirements = {},
		buffs = {},
		buff_data = {}
	},
	{
		description = "bardin_ranger_ability_free_grenade_desc",
		name = "bardin_ranger_ability_free_grenade",
		num_ranks = 1,
		icon = "bardin_ranger_ability_free_grenade",
		description_values = {
			{
				value = buff_tweak_data.bardin_ranger_ability_free_grenade_buff.duration
			}
		},
		requirements = {},
		buffs = {
			"bardin_ranger_ability_free_grenade_remove"
		},
		buff_data = {}
	},
	{
		description = "tank_unbalance_desc",
		name = "bardin_ranger_tank_unbalance",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_ranger_tank_unbalance",
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
		name = "bardin_ranger_linesman_unbalance",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_ranger_linesman_unbalance",
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
		name = "bardin_ranger_power_level_unbalance",
		num_ranks = 1,
		buffer = "server",
		icon = "bardin_ranger_power_level_unbalance",
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
		description = "bardin_placeholder",
		name = "bardin_placeholder"
	}
}

for name, data in pairs(TalentBuffTemplates.dwarf_ranger) do
	local buffs = data.buffs

	fassert(#buffs == 1, "talent buff has more than one sub buff, add multiple buffs from the talent instead")

	local buff = buffs[1]
	buff.name = name
end

BuffUtils.apply_buff_tweak_data(TalentBuffTemplates.dwarf_ranger, buff_tweak_data)

return

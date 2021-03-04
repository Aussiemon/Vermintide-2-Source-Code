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
	bardin_ironbreaker_decreased_overcharge = {
		multiplier = -1
	},
	bardin_ironbreaker_increased_ranged_power = {
		multiplier = 0.3
	},
	bardin_ironbreaker_increased_ranged_attack_speed = {
		multiplier = 1
	},
	bardin_ironbreaker_party_power_on_blocked_attacks_buff = {
		max_stacks = 5,
		multiplier = 0.02,
		duration = 10
	},
	bardin_ironbreaker_gromril_attack_speed = {
		presentation_delay = 7,
		multiplier = 0.08
	},
	bardin_ironbreaker_gromril_buff = {
		bonus = -0.5
	},
	bardin_ironbreaker_drakefire_changing_attack_speed = {
		multiplier = 1,
		chunk_size = 3
	},
	bardin_ironbreaker_drakefire_attack_speed = {
		multiplier = -0.15
	},
	bardin_ironbreaker_drakefire_changing_ranged_power = {
		chunk_size = 3,
		multiplier = -0.8
	},
	bardin_ironbreaker_drakefire_ranged_power = {
		multiplier = 0.2
	},
	bardin_ironbreaker_power_on_blocked_attacks_buff = {
		max_stacks = 5,
		multiplier = 0.05
	},
	bardin_ironbreaker_overcharge_increase_power_lowers_attack_speed_desc = {
		final_power = 1.2,
		final_attack_speed = -0.5,
		initial_attack_speed = 1,
		inital_power = -0.8
	},
	bardin_ironbreaker_gromril_stamina_regen = {
		multiplier = 0.5
	},
	bardin_ironbreaker_gromril_delay_short = {
		duration = 10
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
		value = 10
	},
	bardin_slayer_damage_reduction_on_melee_charge_action_buff = {
		duration = 5,
		multiplier = -0.4
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
	bardin_slayer_activated_ability_impact_damage = {
		display_multiplier = 1
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
	bardin_survival_ale_buff_presentation = {
		max_stacks = 3,
		multiplier = 1.04,
		duration = 5,
		multiplier_2 = 0.03
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
	bardin_ranger_smoke_attack_buff = {
		multiplier = 0.08
	},
	bardin_ranger_passive_improved_ammo = {
		multiplier = 0.3
	},
	bardin_ranger_passive_spawn_potions_or_bombs = {
		display_multiplier = 0.2
	},
	bardin_ranger_movement_speed = {
		multiplier = 1.1
	},
	bardin_ranger_reduced_damage_taken_headshot_buff = {
		duration = 7,
		multiplier = -0.3
	},
	bardin_ranger_reload_speed_on_multi_hit_buff = {
		duration = 2,
		multiplier = -0.35
	},
	bardin_ranger_reload_speed_on_multi_hit_add = {
		target_number = 2
	},
	bardin_ranger_smoke_attack = {
		duration = 10
	},
	bardin_ranger_smoke_heal = {
		duration = 10
	},
	bardin_ranger_smoke_heal_buff = {
		time_between_heals = 1,
		heal_amount = 3
	},
	bardin_ranger_activated_ability_stealth_outside_of_smoke = {
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
				buff_func = "reduce_activated_ability_cooldown"
			}
		}
	},
	bardin_ironbreaker_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				event_buff = true,
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken"
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
				delayed_buff_name = "bardin_ironbreaker_gromril_armour"
			}
		}
	},
	bardin_ironbreaker_refresh_gromril_armour = {
		buffs = {
			{
				buff_to_add = "bardin_ironbreaker_gromril_buff",
				buff_func = "add_gromril_delay",
				event_buff = true,
				event = "on_gromril_armour_removed",
				base_duration = buff_tweak_data.bardin_ironbreaker_gromril_delay.duration
			}
		}
	},
	bardin_ironbreaker_gromril_buff = {
		buffs = {
			{
				stat_buff = "gromril_cooldown",
				max_stacks = 30
			}
		}
	},
	bardin_ironbreaker_gromril_armour = {
		buffs = {
			{
				max_stacks = 1,
				icon = "bardin_ironbreaker_gromril_armour",
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
				buff_func = "heal_stagger_targets_on_melee",
				event = "on_stagger",
				perk = "tank_healing"
			}
		}
	},
	bardin_ironbreaker_bloodlust = {
		buffs = {
			{
				multiplier = 0.45,
				name = "bloodlust",
				event_buff = true,
				buff_func = "heal_percentage_of_enemy_hp_on_melee_kill",
				event = "on_kill",
				perk = "smiter_healing",
				heal_cap = 0.25
			}
		}
	},
	bardin_ironbreaker_conqueror = {
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
				stat_buff = "power_level",
				icon = "bardin_ironbreaker_power_on_nearby_allies2"
			}
		}
	},
	bardin_ironbreaker_drakefire_changing_attack_speed = {
		buffs = {
			{
				buff_to_add = "bardin_ironbreaker_drakefire_attack_speed",
				update_func = "activate_buff_stacks_based_on_overcharge_chunks",
				stat_buff = "attack_speed_drakefire",
				max_stacks = 10,
				perk = "overcharge_no_slow"
			}
		}
	},
	bardin_ironbreaker_drakefire_attack_speed = {
		buffs = {
			{
				stat_buff = "attack_speed_drakefire"
			}
		}
	},
	bardin_ironbreaker_drakefire_changing_ranged_power = {
		buffs = {
			{
				buff_to_add = "bardin_ironbreaker_drakefire_ranged_power",
				update_func = "activate_server_buff_stacks_based_on_overcharge_chunks",
				stat_buff = "power_level_ranged_drakefire",
				max_sub_buff_stacks = 10
			}
		}
	},
	bardin_ironbreaker_drakefire_ranged_power = {
		buffs = {
			{
				stat_buff = "power_level_ranged_drakefire"
			}
		}
	},
	bardin_ironbreaker_decreased_overcharge = {
		buffs = {
			{
				stat_buff = "reduced_overcharge",
				max_stacks = 1
			}
		}
	},
	bardin_ironbreaker_increased_ranged_power = {
		buffs = {
			{
				stat_buff = "power_level_ranged_drakefire",
				max_stacks = 1
			}
		}
	},
	bardin_ironbreaker_increased_ranged_attack_speed = {
		buffs = {
			{
				stat_buff = "attack_speed",
				max_stacks = 1
			}
		}
	},
	bardin_ironbreaker_party_power_on_blocked_attacks_add = {
		buffs = {
			{
				buff_to_add = "bardin_ironbreaker_party_power_on_blocked_attacks_buff",
				chunk_size = 1,
				event_buff = true,
				buff_func = "add_buff_to_all_players",
				event = "on_block",
				max_stacks = 1,
				max_sub_buff_stacks = 5
			}
		}
	},
	bardin_ironbreaker_party_power_on_blocked_attacks_buff = {
		buffs = {
			{
				refresh_durations = true,
				icon = "bardin_ironbreaker_power_on_blocked_attacks",
				stat_buff = "power_level_melee"
			}
		}
	},
	bardin_ironbreaker_power_on_blocked_attacks_add = {
		buffs = {
			{
				buff_to_add = "bardin_ironbreaker_power_on_blocked_attacks_buff",
				max_stacks = 1,
				event_buff = true,
				buff_func = "bardin_ironbreaker_add_power_buff_on_block",
				event = "on_block"
			}
		}
	},
	bardin_ironbreaker_power_on_blocked_attacks_remove_damage = {
		buffs = {
			{
				buff_to_remove = "bardin_ironbreaker_power_on_blocked_attacks_buff",
				chunk_size = 1,
				event_buff = true,
				buff_func = "bardin_ironbreaker_remove_on_block_power_buff",
				event = "on_player_damage_dealt",
				max_stacks = 1,
				reference_buff = "bardin_ironbreaker_power_on_blocked_attacks_add"
			}
		}
	},
	bardin_ironbreaker_power_on_blocked_attacks_remove_stagger = {
		buffs = {
			{
				buff_to_remove = "bardin_ironbreaker_power_on_blocked_attacks_buff",
				chunk_size = 1,
				event_buff = true,
				buff_func = "bardin_ironbreaker_remove_on_block_power_buff",
				event = "on_stagger",
				max_stacks = 1,
				reference_buff = "bardin_ironbreaker_power_on_blocked_attacks_add"
			}
		}
	},
	bardin_ironbreaker_power_on_blocked_attacks_buff = {
		buffs = {
			{
				stat_buff = "power_level_melee",
				icon = "bardin_ironbreaker_power_on_blocked_attacks"
			}
		}
	},
	bardin_ironbreaker_stacking_buff_gromril = {
		buffs = {
			{
				buff_on_pop = "bardin_ironbreaker_gromril_attack_speed",
				activation_buff = "bardin_ironbreaker_gromril_armour",
				pulse_frequency = 7,
				buff_to_add = "bardin_ironbreaker_gromril_rising_anger",
				update_func = "bardin_ironbreaker_stacking_buff_gromril",
				max_sub_buff_stacks = 5
			}
		}
	},
	bardin_ironbreaker_gromril_attack_speed = {
		buffs = {
			{
				duration = 10,
				icon = "bardin_ironbreaker_power_on_blocked_attacks",
				stat_buff = "attack_speed"
			}
		}
	},
	bardin_ironbreaker_gromril_stamina_regen = {
		buffs = {
			{
				max_stacks = 5,
				icon = "bardin_ironbreaker_stamina_regen_during_gromril",
				stat_buff = "fatigue_regen"
			}
		}
	},
	bardin_ironbreaker_gromril_rising_anger = {
		buffs = {
			{
				max_stacks = 5,
				icon = "bardin_ironbreaker_stamina_regen_during_gromril"
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
				delayed_buff_name = "bardin_ironbreaker_gromril_armour"
			}
		}
	},
	bardin_ironbreaker_gromril_stagger = {
		buffs = {
			{
				event = "on_gromril_armour_removed",
				event_buff = true,
				buff_func = "bardin_ironbreaker_gromril_stagger",
				explosion_template = ExplosionTemplates.bardin_ironbreaker_gromril_stagger
			}
		}
	},
	bardin_ironbreaker_regen_stamina_on_charged_attacks = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = "bardin_ironbreaker_regen_stamina_on_charged_attacks"
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
				buff_func = "bardin_ironbreaker_regen_stamina_on_block_broken"
			}
		}
	},
	bardin_ironbreaker_cooldown_reduction_on_kill_while_full_stamina = {
		buffs = {
			{
				event = "on_kill",
				event_buff = true,
				buff_func = "bardin_ironbreaker_cooldown_reduction_on_kill_while_full_stamina"
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
				refresh_durations = true,
				icon = "bardin_ironbreaker_activated_ability_power_buff_allies",
				stat_buff = "power_level"
			}
		}
	},
	bardin_slayer_ability_cooldown_on_hit = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = "reduce_activated_ability_cooldown"
			}
		}
	},
	bardin_slayer_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				event_buff = true,
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken"
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
	bardin_slayer_passive_uninterruptible_leap = {
		buffs = {
			{
				max_stacks = 1,
				perk = "uninterruptible"
			}
		}
	},
	bardin_slayer_passive_stacking_damage_buff_on_hit = {
		buffs = {
			{
				event = "on_hit",
				event_buff = true,
				buff_func = "add_bardin_slayer_passive_buff",
				max_stacks = buff_tweak_data.bardin_slayer_passive_stacking_damage_buff.max_stacks
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
				buff_func = "heal_damage_targets_on_melee",
				event = "on_player_damage_dealt",
				perk = "linesman_healing",
				max_targets = 5,
				bonus = 0.25
			}
		}
	},
	bardin_slayer_bloodlust = {
		buffs = {
			{
				multiplier = 0.45,
				name = "bloodlust",
				event_buff = true,
				buff_func = "heal_percentage_of_enemy_hp_on_melee_kill",
				event = "on_kill",
				perk = "smiter_healing",
				heal_cap = 0.25
			}
		}
	},
	bardin_slayer_conqueror = {
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
				stat_buff = "power_level"
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
				stat_buff = "attack_speed"
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
				apply_buff_func = "apply_movement_buff",
				refresh_durations = true,
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			}
		}
	},
	bardin_slayer_damage_taken_capped = {
		buffs = {
			{
				stat_buff = "max_damage_taken_from_boss_or_elite"
			}
		}
	},
	bardin_slayer_damage_reduction_on_melee_charge_action = {
		buffs = {
			{
				buff_to_add = "bardin_slayer_damage_reduction_on_melee_charge_action_buff",
				event = "on_hit",
				event_buff = true,
				buff_func = "add_buff_on_charged_attack_hit",
				max_stacks = 1,
				server_controlled = false
			}
		}
	},
	bardin_slayer_damage_reduction_on_melee_charge_action_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "bardin_slayer_damage_reduction_on_melee_charge_action",
				stat_buff = "damage_taken",
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
				buff_func = "bardin_slayer_push_on_dodge"
			}
		}
	},
	bardin_slayer_activated_ability_leap_damage_add = {
		buffs = {
			{
				buff_to_add = "bardin_slayer_activated_ability_leap_damage_buff",
				max_stacks = 1,
				event_buff = true,
				buff_func = "bardin_slayer_add_buff_on_leap_start",
				event = "on_leap_start"
			}
		}
	},
	bardin_slayer_activated_ability_leap_damage_remove = {
		buffs = {
			{
				event = "on_leap_finished",
				max_stacks = 1,
				event_buff = true,
				buff_func = "bardin_slayer_remove_buff_on_leap_finished",
				parent_buff = "bardin_slayer_activated_ability_leap_damage_add"
			}
		}
	},
	bardin_slayer_activated_ability_leap_damage_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "bardin_slayer_activated_ability_leap_damage",
				stat_buff = "power_level",
				perk = "bloody_mess"
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
				buff_func = "reduce_activated_ability_cooldown"
			}
		}
	},
	bardin_ranger_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				event = "on_damage_taken",
				event_buff = true,
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken"
			}
		}
	},
	bardin_ranger_passive = {
		buffs = {
			{
				event = "on_special_killed",
				event_buff = true,
				buff_func = "bardin_ranger_scavenge_proc"
			}
		}
	},
	bardin_ranger_passive_consumeable_dupe_healing = {
		buffs = {
			{
				stat_buff = "not_consume_medpack"
			}
		}
	},
	bardin_ranger_passive_consumeable_dupe_potion = {
		buffs = {
			{
				stat_buff = "not_consume_potion"
			}
		}
	},
	bardin_ranger_passive_consumeable_dupe_grenade = {
		buffs = {
			{
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
		buffs = {
			{
				buff_to_add = "bardin_ranger_activated_ability_buff",
				name = "bardin_ranger_activated_ability",
				area_unit_name = "units/hub_elements/empty",
				icon = "bardin_ranger_activated_ability",
				enter_area_func = "enter_buff_area",
				refresh_durations = true,
				refresh_buff_area_position = true,
				area_radius = 8,
				buff_area = true,
				max_stacks = 1,
				exit_area_func = "exit_buff_area"
			}
		}
	},
	bardin_ranger_activated_ability_buff = {
		deactivation_effect = "fx/screenspace_ranger_skill_02",
		buffs = {
			{
				remove_buff_func = "ranger_activated_ability_buff_remove",
				continuous_effect = "fx/screenspace_ranger_skill_01",
				max_stacks = 1,
				icon = "bardin_ranger_activated_ability",
				apply_buff_func = "ranger_activated_ability_buff"
			}
		}
	},
	bardin_ranger_reaper = {
		buffs = {
			{
				multiplier = -0.05,
				name = "reaper",
				event_buff = true,
				buff_func = "heal_damage_targets_on_melee",
				event = "on_player_damage_dealt",
				perk = "linesman_healing",
				max_targets = 5,
				bonus = 0.25
			}
		}
	},
	bardin_ranger_vanguard = {
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
	bardin_ranger_conqueror = {
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
	bardin_ranger_increased_melee_damage_on_no_ammo_add = {
		buffs = {
			{
				buff_to_add = "bardin_ranger_melee_damage_on_no_ammo",
				event = "on_last_ammo_used",
				event_buff = true,
				buff_func = "bardin_ranger_add_power_on_no_ammo_proc"
			}
		}
	},
	bardin_ranger_increased_melee_damage_on_no_ammo_remove = {
		buffs = {
			{
				event = "on_gained_ammo_from_no_ammo",
				buff_to_remove = "bardin_ranger_melee_damage_on_no_ammo",
				event_buff = true,
				buff_func = "bardin_ranger_remove_power_on_no_ammo_proc"
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
				buff_func = "reduce_activated_ability_cooldown"
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
				buff_func = "add_buff_on_headshot"
			}
		}
	},
	bardin_ranger_reduced_damage_taken_headshot_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "bardin_ranger_reduced_damage_taken_headshot",
				stat_buff = "damage_taken",
				refresh_durations = true
			}
		}
	},
	bardin_ranger_reload_speed_on_multi_hit_add = {
		buffs = {
			{
				event = "on_hit",
				buff_to_add = "bardin_ranger_reload_speed_on_multi_hit_buff",
				event_buff = true,
				buff_func = "bardin_ranger_add_reload_speed_buff"
			}
		}
	},
	bardin_ranger_reload_speed_on_multi_hit_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "bardin_ranger_reload_speed_on_multi_hit",
				stat_buff = "reload_speed",
				refresh_durations = true
			}
		}
	},
	bardin_ranger_smoke_attack = {
		buffs = {
			{
				buff_to_add = "bardin_ranger_activated_ability_buff",
				name = "bardin_ranger_activated_ability",
				smoke_buff = "bardin_ranger_smoke_attack_buff",
				area_unit_name = "units/hub_elements/empty",
				enter_area_func = "enter_buff_area",
				refresh_durations = true,
				refresh_buff_area_position = false,
				update_func = "bardin_ranger_smoke_buff",
				icon = "bardin_ranger_activated_ability",
				area_radius = 7,
				buff_area = true,
				max_stacks = 1,
				exit_area_func = "exit_buff_area"
			}
		}
	},
	bardin_ranger_smoke_attack_buff = {
		buffs = {
			{
				icon = "bardin_ranger_activated_ability_duration",
				refresh_durations = true,
				stat_buff = "attack_speed",
				max_stacks = 1,
				duration = 3
			}
		}
	},
	bardin_ranger_smoke_heal = {
		buffs = {
			{
				buff_to_add = "bardin_ranger_activated_ability_buff",
				name = "bardin_ranger_activated_ability",
				smoke_buff = "bardin_ranger_smoke_heal_buff",
				update_func = "bardin_ranger_smoke_buff",
				enter_area_func = "enter_buff_area",
				refresh_durations = true,
				refresh_buff_area_position = false,
				max_stacks = 1,
				area_radius = 7,
				buff_area = true,
				area_unit_name = "units/hub_elements/empty",
				exit_area_func = "exit_buff_area"
			}
		}
	},
	bardin_ranger_smoke_heal_buff = {
		buffs = {
			{
				max_stacks = 1,
				refresh_durations = true,
				update_func = "bardin_ranger_heal_smoke",
				duration = 3
			}
		}
	},
	bardin_ranger_activated_ability_stealth_outside_of_smoke = {
		buffs = {
			{
				buff_to_add = "bardin_ranger_activated_ability_buff",
				name = "bardin_ranger_activated_ability",
				area_unit_name = "units/hub_elements/empty",
				icon = "bardin_ranger_activated_ability",
				enter_area_func = "enter_buff_area",
				refresh_durations = true,
				refresh_buff_area_position = false,
				area_radius = 7,
				buff_area = true,
				max_stacks = 1,
				exit_area_func = "exit_buff_area",
				unlimited = true
			}
		}
	},
	bardin_ranger_ability_free_grenade_remove = {
		buffs = {
			{
				event = "on_grenade_use",
				buff_to_remove = "bardin_ranger_ability_free_grenade_buff",
				event_buff = true,
				buff_func = "remove_non_stacking_buff"
			}
		}
	},
	bardin_ranger_ability_free_grenade_buff = {
		buffs = {
			{
				max_stacks = 1,
				icon = "bardin_ranger_ability_free_grenade",
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
			"bardin_ironbreaker_overcharge_increase_power_lowers_attack_speed",
			"bardin_ironbreaker_power_on_nearby_allies",
			"bardin_ironbreaker_party_power_on_blocked_attacks"
		},
		{
			"bardin_ironbreaker_tank_unbalance",
			"bardin_ironbreaker_smiter_unbalance",
			"bardin_ironbreaker_power_level_unbalance"
		},
		{
			"bardin_ironbreaker_rising_attack_speed",
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
			"bardin_slayer_activated_ability_impact_damage",
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
			"bardin_ranger_passive_ale",
			"bardin_ranger_passive_improved_ammo",
			"bardin_ranger_passive_spawn_potions_or_bombs"
		},
		{
			"bardin_ranger_movement_speed",
			"bardin_ranger_reduced_damage_taken_headshot",
			"bardin_ranger_reload_speed_on_multi_hit"
		},
		{
			"bardin_ranger_smoke_attack",
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
		buffer = "server",
		num_ranks = 1,
		icon = "bardin_ironbreaker_regrowth",
		description_values = {},
		buffs = {
			"bardin_ironbreaker_vanguard"
		}
	},
	{
		description = "bloodlust_desc_3",
		name = "bardin_ironbreaker_bloodlust_2",
		buffer = "server",
		num_ranks = 1,
		icon = "bardin_ironbreaker_bloodlust",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.bloodlust.buffs[1].multiplier
			}
		},
		buffs = {
			"bardin_ironbreaker_bloodlust"
		}
	},
	{
		description = "conqueror_desc_3",
		name = "bardin_ironbreaker_heal_share",
		buffer = "server",
		num_ranks = 1,
		icon = "bardin_ironbreaker_conqueror",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.conqueror.buffs[1].multiplier
			}
		},
		buffs = {
			"bardin_ironbreaker_conqueror"
		}
	},
	{
		description = "bardin_ironbreaker_power_on_nearby_allies_desc",
		name = "bardin_ironbreaker_power_on_nearby_allies",
		buffer = "server",
		num_ranks = 1,
		icon = "bardin_ironbreaker_power_on_nearby_allies2",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ironbreaker_power_on_nearby_allies_buff.multiplier
			}
		},
		buffs = {
			"bardin_ironbreaker_power_on_nearby_allies"
		}
	},
	{
		description = "bardin_ironbreaker_overcharge_increase_power_lowers_attack_speed_desc",
		name = "bardin_ironbreaker_overcharge_increase_power_lowers_attack_speed",
		buffer = "both",
		num_ranks = 1,
		icon = "bardin_ironbreaker_increased_overcharge_increased_range_power",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ironbreaker_overcharge_increase_power_lowers_attack_speed_desc.inital_power
			},
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ironbreaker_overcharge_increase_power_lowers_attack_speed_desc.final_power
			},
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ironbreaker_overcharge_increase_power_lowers_attack_speed_desc.initial_attack_speed
			},
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ironbreaker_overcharge_increase_power_lowers_attack_speed_desc.final_attack_speed
			}
		},
		buffs = {
			"bardin_ironbreaker_drakefire_changing_attack_speed",
			"bardin_ironbreaker_drakefire_changing_ranged_power"
		}
	},
	{
		description = "bardin_ironbreaker_party_power_on_blocked_attacks_desc",
		name = "bardin_ironbreaker_party_power_on_blocked_attacks",
		buffer = "server",
		num_ranks = 1,
		icon = "bardin_ironbreaker_power_on_blocked_attacks",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ironbreaker_party_power_on_blocked_attacks_buff.multiplier
			},
			{
				value = buff_tweak_data.bardin_ironbreaker_party_power_on_blocked_attacks_buff.duration
			},
			{
				value = buff_tweak_data.bardin_ironbreaker_party_power_on_blocked_attacks_buff.max_stacks
			}
		},
		buffs = {
			"bardin_ironbreaker_party_power_on_blocked_attacks_add"
		}
	},
	{
		description = "bardin_ironbreaker_rising_attack_speed_desc",
		name = "bardin_ironbreaker_rising_attack_speed",
		num_ranks = 1,
		icon = "bardin_ironbreaker_stamina_regen_during_gromril",
		description_values = {
			{
				value = buff_tweak_data.bardin_ironbreaker_gromril_attack_speed.presentation_delay
			},
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ironbreaker_gromril_attack_speed.multiplier
			}
		},
		buffs = {
			"bardin_ironbreaker_stacking_buff_gromril"
		}
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
		buffs = {}
	},
	{
		description = "bardin_ironbreaker_gromril_stagger_desc",
		name = "bardin_ironbreaker_gromril_stagger",
		buffer = "server",
		num_ranks = 1,
		icon = "bardin_ironbreaker_gromril_stagger",
		description_values = {},
		buffs = {
			"bardin_ironbreaker_gromril_stagger"
		}
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
		buffs = {
			"bardin_ironbreaker_regen_stamina_on_charged_attacks"
		}
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
		buffs = {
			"bardin_ironbreaker_regen_stamina_on_block_broken"
		}
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
		buffs = {
			"bardin_ironbreaker_cooldown_reduction_on_kill_while_full_stamina"
		}
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
		buffs = {}
	},
	{
		description = "bardin_ironbreaker_activated_ability_taunt_bosses_desc",
		name = "bardin_ironbreaker_activated_ability_taunt_bosses",
		num_ranks = 1,
		icon = "bardin_ironbreaker_activated_ability_taunt_bosses",
		buffs = {}
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
		buffs = {}
	},
	{
		description = "tank_unbalance_desc",
		name = "bardin_ironbreaker_tank_unbalance",
		buffer = "server",
		num_ranks = 1,
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
		buffs = {
			"tank_unbalance"
		}
	},
	{
		description = "smiter_unbalance_desc",
		name = "bardin_ironbreaker_smiter_unbalance",
		buffer = "server",
		num_ranks = 1,
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
		buffs = {
			"smiter_unbalance"
		}
	},
	{
		description = "power_level_unbalance_desc",
		name = "bardin_ironbreaker_power_level_unbalance",
		buffer = "server",
		num_ranks = 1,
		icon = "bardin_ironbreaker_power_level_unbalance",
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
		name = "bardin_slayer_reaper",
		buffer = "server",
		num_ranks = 1,
		icon = "bardin_slayer_regrowth",
		description_values = {
			{
				value = BuffTemplates.reaper.buffs[1].max_targets
			}
		},
		buffs = {
			"bardin_slayer_reaper"
		}
	},
	{
		description = "bloodlust_desc_3",
		name = "bardin_slayer_bloodlust_2",
		buffer = "server",
		num_ranks = 1,
		icon = "bardin_slayer_bloodlust",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.bloodlust.buffs[1].multiplier
			}
		},
		buffs = {
			"bardin_slayer_bloodlust"
		}
	},
	{
		description = "conqueror_desc_3",
		name = "bardin_slayer_heal_share",
		buffer = "server",
		num_ranks = 1,
		icon = "bardin_slayer_conqueror",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.conqueror.buffs[1].multiplier
			}
		},
		buffs = {
			"bardin_slayer_conqueror"
		}
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
		buffs = {
			"bardin_slayer_crit_chance"
		}
	},
	{
		description = "bardin_slayer_power_on_double_two_handed_weapons_desc",
		name = "bardin_slayer_power_on_double_two_handed_weapons",
		buffer = "server",
		num_ranks = 1,
		icon = "bardin_slayer_power_on_double_two_handed_weapons",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_slayer_power_on_double_two_handed_weapons_buff.multiplier
			}
		},
		buffs = {
			"bardin_slayer_power_on_double_two_handed_weapons"
		}
	},
	{
		description = "bardin_slayer_attack_speed_on_double_one_handed_weapons_desc",
		name = "bardin_slayer_attack_speed_on_double_one_handed_weapons",
		buffer = "server",
		num_ranks = 1,
		icon = "bardin_slayer_attack_speed_on_double_one_handed_weapons",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_slayer_attack_speed_on_double_one_handed_weapons_buff.multiplier
			}
		},
		buffs = {
			"bardin_slayer_attack_speed_on_double_one_handed_weapons"
		}
	},
	{
		description = "bardin_slayer_passive_cooldown_reduction_on_max_stacks_desc",
		name = "bardin_slayer_passive_cooldown_reduction_on_max_stacks",
		buffer = "server",
		num_ranks = 1,
		icon = "bardin_slayer_passive_cooldown_reduction_on_max_stacks",
		description_values = {},
		buffs = {}
	},
	{
		description = "bardin_slayer_passive_movement_speed_desc",
		name = "bardin_slayer_passive_movement_speed",
		buffer = "both",
		num_ranks = 1,
		icon = "bardin_slayer_passive_movement_speed",
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.bardin_slayer_passive_movement_speed.multiplier
			}
		},
		buffs = {}
	},
	{
		description = "bardin_slayer_passive_increased_max_stacks_desc",
		name = "bardin_slayer_passive_increased_max_stacks",
		buffer = "server",
		num_ranks = 1,
		icon = "bardin_slayer_passive_increased_max_stacks",
		description_values = {
			{
				value = buff_tweak_data.bardin_slayer_passive_increased_max_stacks.display_value
			}
		},
		buffs = {}
	},
	{
		description = "bardin_slayer_damage_taken_capped_desc_2",
		name = "bardin_slayer_damage_taken_capped",
		buffer = "server",
		num_ranks = 1,
		icon = "bardin_slayer_damage_taken_capped",
		description_values = {
			{
				value = buff_tweak_data.bardin_slayer_damage_taken_capped.value
			}
		},
		buffs = {
			"bardin_slayer_damage_taken_capped"
		}
	},
	{
		description = "bardin_slayer_damage_reduction_on_melee_charge_action_desc_2",
		name = "bardin_slayer_damage_reduction_on_melee_charge_action",
		buffer = "server",
		num_ranks = 1,
		icon = "bardin_slayer_damage_reduction_on_melee_charge_action",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_slayer_damage_reduction_on_melee_charge_action_buff.multiplier
			},
			{
				value = buff_tweak_data.bardin_slayer_damage_reduction_on_melee_charge_action_buff.duration
			}
		},
		buffs = {
			"bardin_slayer_damage_reduction_on_melee_charge_action"
		}
	},
	{
		description = "bardin_slayer_push_on_dodge_desc",
		name = "bardin_slayer_push_on_dodge",
		num_ranks = 1,
		icon = "bardin_slayer_push_on_dodge",
		description_values = {},
		buffs = {
			"bardin_slayer_push_on_dodge"
		}
	},
	{
		description = "bardin_slayer_activated_ability_leap_range_desc",
		name = "bardin_slayer_activated_ability_leap_range",
		buffer = "server",
		num_ranks = 1,
		icon = "bardin_slayer_activated_ability_leap_range",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_slayer_activated_ability_leap_range.display_multiplier
			}
		},
		buffs = {}
	},
	{
		description = "bardin_slayer_activated_ability_leap_damage_desc",
		name = "bardin_slayer_activated_ability_leap_damage",
		buffer = "server",
		num_ranks = 1,
		icon = "bardin_slayer_activated_ability_leap_damage",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_slayer_activated_ability_leap_damage_buff.multiplier
			}
		},
		buffs = {
			"bardin_slayer_activated_ability_leap_damage_add",
			"bardin_slayer_activated_ability_leap_damage_remove"
		}
	},
	{
		description = "bardin_slayer_activated_ability_impact_damage_desc_2",
		name = "bardin_slayer_activated_ability_impact_damage",
		num_ranks = 1,
		icon = "bardin_slayer_activated_ability_impact_damage",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_slayer_activated_ability_impact_damage.display_multiplier
			}
		},
		buffs = {}
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
		buffs = {}
	},
	{
		description = "smiter_unbalance_desc",
		name = "bardin_slayer_smiter_unbalance",
		buffer = "server",
		num_ranks = 1,
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
		buffs = {
			"smiter_unbalance"
		}
	},
	{
		description = "linesman_unbalance_desc",
		name = "bardin_slayer_linesman_unbalance",
		buffer = "server",
		num_ranks = 1,
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
		buffs = {
			"linesman_unbalance"
		}
	},
	{
		description = "power_level_unbalance_desc",
		name = "bardin_slayer_power_level_unbalance",
		buffer = "server",
		num_ranks = 1,
		icon = "bardin_slayer_power_level_unbalance",
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
		description = "vanguard_desc",
		name = "bardin_ranger_vanguard",
		buffer = "server",
		num_ranks = 1,
		icon = "bardin_ranger_regrowth",
		description_values = {},
		buffs = {
			"bardin_ranger_vanguard"
		}
	},
	{
		description = "reaper_desc",
		name = "bardin_ranger_reaper",
		buffer = "server",
		num_ranks = 1,
		icon = "bardin_ranger_bloodlust",
		description_values = {
			{
				value = BuffTemplates.reaper.buffs[1].max_targets
			}
		},
		buffs = {
			"bardin_ranger_reaper"
		}
	},
	{
		description = "conqueror_desc_3",
		name = "bardin_ranger_heal_share",
		buffer = "server",
		num_ranks = 1,
		icon = "bardin_ranger_conqueror",
		description_values = {
			{
				value_type = "percent",
				value = BuffTemplates.conqueror.buffs[1].multiplier
			}
		},
		buffs = {
			"bardin_ranger_conqueror"
		}
	},
	{
		description = "bardin_ranger_increased_melee_damage_on_no_ammo_desc",
		name = "bardin_ranger_increased_melee_damage_on_no_ammo",
		buffer = "both",
		num_ranks = 1,
		icon = "bardin_ranger_increased_melee_damage_on_no_ammo",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ranger_melee_damage_on_no_ammo.multiplier
			}
		},
		buffs = {
			"bardin_ranger_increased_melee_damage_on_no_ammo_add",
			"bardin_ranger_increased_melee_damage_on_no_ammo_remove"
		}
	},
	{
		description = "bardin_ranger_cooldown_on_reload_desc",
		name = "bardin_ranger_cooldown_on_reload",
		buffer = "both",
		num_ranks = 1,
		icon = "bardin_ranger_cooldown_on_reload",
		description_values = {
			{
				value = buff_tweak_data.bardin_ranger_cooldown_on_reload.bonus
			}
		},
		buffs = {
			"bardin_ranger_cooldown_on_reload"
		}
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
		buffs = {
			"bardin_ranger_attack_speed"
		}
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
		buffs = {}
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
		buffs = {}
	},
	{
		description = "bardin_ranger_passive_ale_desc",
		name = "bardin_ranger_passive_ale",
		num_ranks = 1,
		icon = "buff_icon_mutator_icon_drunk",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_survival_ale_buff_presentation.multiplier_2
			},
			{
				value_type = "baked_percent",
				value = buff_tweak_data.bardin_survival_ale_buff_presentation.multiplier
			},
			{
				value = buff_tweak_data.bardin_survival_ale_buff_presentation.duration
			},
			{
				value = buff_tweak_data.bardin_survival_ale_buff_presentation.max_stacks
			}
		},
		buffs = {}
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
		buffs = {
			"bardin_ranger_movement_speed"
		}
	},
	{
		description = "bardin_ranger_reduced_damage_taken_headshot_desc_2",
		name = "bardin_ranger_reduced_damage_taken_headshot",
		buffer = "server",
		num_ranks = 1,
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
		buffs = {
			"bardin_ranger_reduced_damage_taken_headshot"
		}
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
		buffs = {
			"bardin_ranger_reload_speed_on_multi_hit_add"
		}
	},
	{
		description = "bardin_ranger_smoke_attack_desc",
		name = "bardin_ranger_smoke_attack",
		num_ranks = 1,
		icon = "bardin_ranger_activated_ability_duration",
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ranger_smoke_attack_buff.multiplier
			},
			{
				value = buff_tweak_data.bardin_ranger_smoke_heal_buff.heal_amount
			}
		},
		buffs = {}
	},
	{
		description = "bardin_ranger_activated_ability_stealth_outside_of_smoke_desc",
		name = "bardin_ranger_activated_ability_stealth_outside_of_smoke",
		num_ranks = 1,
		icon = "bardin_ranger_activated_ability_stealth_outside_of_smoke",
		description_values = {},
		buffs = {}
	},
	{
		description = "bardin_ranger_ability_free_grenade_desc",
		name = "bardin_ranger_ability_free_grenade",
		num_ranks = 1,
		icon = "bardin_ranger_ability_free_grenade",
		description_values = {},
		buffs = {
			"bardin_ranger_ability_free_grenade_remove"
		}
	},
	{
		description = "tank_unbalance_desc",
		name = "bardin_ranger_tank_unbalance",
		buffer = "server",
		num_ranks = 1,
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
		buffs = {
			"tank_unbalance"
		}
	},
	{
		description = "linesman_unbalance_desc",
		name = "bardin_ranger_linesman_unbalance",
		buffer = "server",
		num_ranks = 1,
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
		buffs = {
			"linesman_unbalance"
		}
	},
	{
		description = "power_level_unbalance_desc",
		name = "bardin_ranger_power_level_unbalance",
		buffer = "server",
		num_ranks = 1,
		icon = "bardin_ranger_power_level_unbalance",
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
		description = "bardin_placeholder",
		name = "bardin_placeholder"
	}
}

BuffUtils.copy_talent_buff_names(TalentBuffTemplates.dwarf_ranger)
BuffUtils.apply_buff_tweak_data(TalentBuffTemplates.dwarf_ranger, buff_tweak_data)

return

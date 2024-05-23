-- chunkname: @scripts/managers/talents/talent_settings_bardin.lua

require("scripts/entity_system/systems/buff/buff_sync_type")
require("scripts/settings/profiles/career_constants")

local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")
local buff_tweak_data = {
	bardin_ironbreaker_ability_cooldown_on_hit = {
		bonus = 0.25,
	},
	bardin_ironbreaker_ability_cooldown_on_damage_taken = {
		bonus = 0.5,
	},
	bardin_ironbreaker_passive_increased_defence = {
		multiplier = -0.3,
	},
	bardin_ironbreaker_passive_increased_stamina = {
		bonus = 2,
	},
	bardin_ironbreaker_passive_reduced_stun_duration = {
		multiplier = 0.5,
	},
	bardin_ironbreaker_gromril_delay = {
		duration = 20,
		duration_modifier_func = function (unit, sub_buff_template, duration, buff_extension, params)
			local mechanism_name = Managers.mechanism:current_mechanism_name()

			if mechanism_name == "versus" then
				local talent_extension = ScriptUnit.extension(unit, "talent_system")

				if talent_extension:has_talent("bardin_ironbreaker_gromril_stagger") then
					duration = 30
				end
			end

			return duration
		end,
	},
	bardin_ironbreaker_gromril_antistun = {
		multiplier = -0.5,
	},
	bardin_ironbreaker_activated_ability = {
		attack_intensity_decay_multiplier = 1,
		duration = 10,
		multiplier_block_cost = -1,
		multiplier_damage_taken = -0.5,
		range = 10,
	},
	bardin_ironbreaker_vanguard = {},
	bardin_ironbreaker_bloodlust = {},
	bardin_ironbreaker_conqueror = {},
	bardin_ironbreaker_power_on_nearby_allies_buff = {
		max_stacks = 3,
		multiplier = 0.05,
	},
	bardin_ironbreaker_decreased_overcharge = {
		multiplier = -1,
	},
	bardin_ironbreaker_increased_ranged_power = {
		multiplier = 0.3,
	},
	bardin_ironbreaker_increased_ranged_attack_speed = {
		multiplier = 1,
	},
	bardin_ironbreaker_party_power_on_blocked_attacks_buff = {
		duration = 10,
		max_stacks = 5,
		multiplier = 0.02,
	},
	bardin_ironbreaker_gromril_attack_speed = {
		multiplier = 0.08,
		presentation_delay = 7,
	},
	bardin_ironbreaker_gromril_buff = {
		bonus = -0.5,
	},
	bardin_ironbreaker_drakefire_changing_attack_speed = {
		chunk_size = 3,
		multiplier = 1,
	},
	bardin_ironbreaker_drakefire_attack_speed = {
		multiplier = -0.15,
	},
	bardin_ironbreaker_drakefire_changing_ranged_power = {
		chunk_size = 3,
		multiplier = -0.8,
	},
	bardin_ironbreaker_drakefire_ranged_power = {
		multiplier = 0.2,
	},
	bardin_ironbreaker_power_on_blocked_attacks_buff = {
		max_stacks = 5,
		multiplier = 0.05,
	},
	bardin_ironbreaker_overcharge_increase_power_lowers_attack_speed_desc = {
		final_attack_speed = -0.5,
		final_power = 1.2,
		inital_power = -0.8,
		initial_attack_speed = 1,
	},
	bardin_ironbreaker_gromril_stamina_regen = {
		multiplier = 0.5,
	},
	bardin_ironbreaker_gromril_delay_short = {
		duration = 10,
	},
	bardin_ironbreaker_regen_stamina_on_charged_attacks_buff = {
		duration = 2,
		multiplier = 0.4,
	},
	bardin_ironbreaker_regen_stamina_on_block_broken = {
		proc_chance = 0.5,
	},
	bardin_ironbreaker_cooldown_reduction_on_kill_while_full_stamina = {
		cooldown_reduction = 0.02,
	},
	bardin_ironbreaker_activated_ability_taunt_range_and_duration = {
		attack_intensity_decay_multiplier = 1,
		display_multiplier = 0.5,
		duration = 15,
		multiplier_block_cost = -1,
		multiplier_damage_taken = -0.5,
		range = 15,
	},
	bardin_ironbreaker_activated_ability_duration = {
		display_multiplier = 0.5,
		duration = 15,
	},
	bardin_ironbreaker_activated_ability_power_buff = {
		duration = 10,
		multiplier = 0.2,
		range = 15,
	},
	bardin_slayer_ability_cooldown_on_hit = {
		bonus = 0.5,
	},
	bardin_slayer_ability_cooldown_on_damage_taken = {
		bonus = 0.1,
	},
	bardin_slayer_passive_stacking_damage_buff = {
		duration = 2,
		max_stacks = 3,
		multiplier = 0.1,
	},
	bardin_slayer_passive_attack_speed = {
		multiplier = 0.075,
	},
	bardin_slayer_activated_ability = {
		duration = 10,
		multiplier = 0.3,
	},
	bardin_slayer_reaper = {},
	bardin_slayer_bloodlust = {},
	bardin_slayer_conqueror = {},
	bardin_slayer_crit_chance = {
		bonus = 0.1,
	},
	bardin_slayer_attack_speed_on_double_one_handed_weapons_buff = {
		multiplier = 0.1,
	},
	bardin_slayer_power_on_double_two_handed_weapons_buff = {
		multiplier = 0.15,
	},
	bardin_slayer_passive_cooldown_reduction_on_max_stacks = {
		multiplier = 2,
	},
	bardin_slayer_passive_increased_max_stacks = {
		display_value = 1,
		duration = 2,
		max_stacks = 4,
		multiplier = 0.1,
	},
	bardin_slayer_passive_movement_speed = {
		duration = 2,
		max_stacks = 3,
		multiplier = 1.1,
	},
	bardin_slayer_damage_taken_capped = {
		value = 10,
	},
	bardin_slayer_damage_reduction_on_melee_charge_action_buff = {
		duration = 5,
		multiplier = -0.4,
	},
	bardin_slayer_activated_ability_movement = {
		multiplier = 1.25,
	},
	bardin_slayer_activated_ability_leap_range = {
		display_multiplier = 0.5,
	},
	bardin_slayer_activated_ability_leap_damage_buff = {
		multiplier = 1.5,
	},
	bardin_slayer_activated_ability_impact_damage = {
		display_multiplier = 1,
	},
	bardin_ranger_ability_cooldown_on_hit = {
		bonus = 0.3,
	},
	bardin_ranger_ability_cooldown_on_damage_taken = {
		bonus = 0.3,
	},
	bardin_ranger_passive = {
		drop_chance = 1,
	},
	bardin_ranger_passive_consumeable_dupe_healing = {
		proc_chance = 0.1,
	},
	bardin_ranger_passive_consumeable_dupe_potion = {
		proc_chance = 0.1,
	},
	bardin_ranger_passive_consumeable_dupe_grenade = {
		proc_chance = 0.1,
	},
	bardin_survival_ale_buff_presentation = {
		duration = 5,
		max_stacks = 3,
		multiplier = 1.04,
		multiplier_2 = 0.03,
	},
	bardin_ranger_passive_reload_speed = {
		multiplier = -0.15,
	},
	bardin_ranger_passive_increased_ammunition = {
		multiplier = 0.5,
	},
	bardin_ranger_activated_ability = {
		duration = CareerConstants.dr_ranger.ability_duration,
	},
	bardin_ranger_vanguard = {},
	bardin_ranger_reaper = {},
	bardin_ranger_conqueror = {},
	bardin_ranger_melee_damage_on_no_ammo = {
		multiplier = 0.25,
	},
	bardin_ranger_cooldown_on_reload = {
		bonus = 2,
	},
	bardin_ranger_attack_speed = {
		multiplier = 0.05,
	},
	bardin_ranger_smoke_attack_buff = {
		multiplier = 0.08,
	},
	bardin_ranger_passive_improved_ammo = {
		multiplier = 0.3,
	},
	bardin_ranger_passive_spawn_potions_or_bombs = {
		spawn_chance = 0.2,
		spawn_chance_versus = 0.05,
	},
	bardin_ranger_movement_speed = {
		multiplier = 1.1,
	},
	bardin_ranger_reduced_damage_taken_headshot_buff = {
		duration = 7,
		multiplier = -0.3,
	},
	bardin_ranger_reload_speed_on_multi_hit_buff = {
		duration = 2,
		multiplier = -0.35,
	},
	bardin_ranger_reload_speed_on_multi_hit_add = {
		target_number = 2,
	},
	bardin_ranger_smoke_attack = {
		duration = CareerConstants.dr_ranger.ability_duration,
	},
	bardin_ranger_smoke_heal = {
		duration = CareerConstants.dr_ranger.ability_duration,
	},
	bardin_ranger_smoke_heal_buff = {
		heal_amount = 3,
		time_between_heals = 1,
	},
	bardin_ranger_activated_ability_stealth_outside_of_smoke = {
		duration = CareerConstants.dr_ranger.ability_duration,
	},
}

TalentBuffTemplates = TalentBuffTemplates or {}
TalentBuffTemplates.dwarf_ranger = {
	bardin_ironbreaker_ability_cooldown_on_hit = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown",
				event = "on_hit",
			},
		},
	},
	bardin_ironbreaker_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken",
				event = "on_damage_taken",
			},
		},
	},
	bardin_ironbreaker_passive_increased_defence = {
		buffs = {
			{
				stat_buff = "damage_taken",
			},
		},
	},
	bardin_ironbreaker_passive_increased_stamina = {
		buffs = {
			{
				stat_buff = "max_fatigue",
			},
		},
	},
	bardin_ironbreaker_passive_reduced_stun_duration = {
		buffs = {
			{
				stat_buff = "stun_duration",
			},
		},
	},
	bardin_ironbreaker_gromril_delay = {
		buffs = {
			{
				buff_to_add = "bardin_ironbreaker_gromril_armour",
				duration_end_func = "add_buff_local",
				icon = "bardin_ironbreaker_gromril_armour",
				is_cooldown = true,
				max_stacks = 1,
				refresh_durations = true,
			},
		},
	},
	bardin_ironbreaker_refresh_gromril_armour = {
		buffs = {
			{
				buff_func = "add_gromril_delay",
				buff_to_add = "bardin_ironbreaker_gromril_buff",
				event = "on_gromril_armour_removed",
				base_duration = buff_tweak_data.bardin_ironbreaker_gromril_delay.duration,
			},
		},
	},
	bardin_ironbreaker_gromril_buff = {
		buffs = {
			{
				max_stacks = 30,
				stat_buff = "gromril_cooldown",
			},
		},
	},
	bardin_ironbreaker_gromril_armour = {
		buffs = {
			{
				icon = "bardin_ironbreaker_gromril_armour",
				max_stacks = 1,
				refresh_durations = true,
			},
		},
	},
	bardin_ironbreaker_gromril_antistun = {
		buffs = {
			{
				max_stacks = 1,
				stat_buff = "stun_duration",
			},
		},
	},
	bardin_ironbreaker_activated_ability = {
		activation_effect = "fx/screenspace_potion_03",
		buffs = {
			{
				icon = "bardin_ironbreaker_activated_ability",
				max_stacks = 1,
				name = "bardin_ironbreaker_activated_ability",
				refresh_durations = true,
				remove_buff_func = "end_bardin_ironbreaker_activated_ability",
				stat_buff = "damage_taken",
				update_func = "update_bardin_ironbreaker_activated_ability",
				perks = {
					buff_perks.reduced_hit_react,
				},
				multiplier = buff_tweak_data.bardin_ironbreaker_activated_ability.multiplier_damage_taken,
			},
		},
	},
	bardin_ironbreaker_activated_ability_block_cost = {
		buffs = {
			{
				max_stacks = 1,
				name = "bardin_ironbreaker_ability_stamina",
				refresh_durations = true,
				stat_buff = "block_cost",
				multiplier = buff_tweak_data.bardin_ironbreaker_activated_ability.multiplier_block_cost,
				duration = buff_tweak_data.bardin_ironbreaker_activated_ability.duration,
			},
		},
	},
	bardin_ironbreaker_activated_ability_attack_intensity_decay_increase = {
		buffs = {
			{
				max_stacks = 1,
				name = "bardin_ironbreaker_activated_ability_attack_intensity_decay_increase",
				refresh_durations = true,
				stat_buff = "attack_intensity_decay",
				multiplier = buff_tweak_data.bardin_ironbreaker_activated_ability.attack_intensity_decay_multiplier,
				duration = buff_tweak_data.bardin_ironbreaker_activated_ability.duration,
			},
		},
	},
	bardin_ironbreaker_vanguard = {
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
	bardin_ironbreaker_bloodlust = {
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
	bardin_ironbreaker_conqueror = {
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
	bardin_ironbreaker_power_on_nearby_allies = {
		buffs = {
			{
				buff_to_add = "bardin_ironbreaker_power_on_nearby_allies_buff",
				chunk_size = 1,
				max_stacks = 3,
				range = 5,
				update_func = "activate_buff_stacks_based_on_ally_proximity",
			},
		},
	},
	bardin_ironbreaker_power_on_nearby_allies_buff = {
		buffs = {
			{
				icon = "bardin_ironbreaker_power_on_nearby_allies2",
				stat_buff = "power_level",
			},
		},
	},
	bardin_ironbreaker_drakefire_changing_attack_speed = {
		buffs = {
			{
				buff_to_add = "bardin_ironbreaker_drakefire_attack_speed",
				max_stacks = 10,
				stat_buff = "attack_speed_drakefire",
				update_func = "activate_buff_stacks_based_on_overcharge_chunks",
				perks = {
					buff_perks.overcharge_no_slow,
				},
			},
		},
	},
	bardin_ironbreaker_drakefire_attack_speed = {
		buffs = {
			{
				stat_buff = "attack_speed_drakefire",
			},
		},
	},
	bardin_ironbreaker_drakefire_changing_ranged_power = {
		buffs = {
			{
				buff_to_add = "bardin_ironbreaker_drakefire_ranged_power",
				max_sub_buff_stacks = 10,
				stat_buff = "power_level_ranged_drakefire",
				update_func = "activate_server_buff_stacks_based_on_overcharge_chunks",
			},
		},
	},
	bardin_ironbreaker_drakefire_ranged_power = {
		buffs = {
			{
				stat_buff = "power_level_ranged_drakefire",
			},
		},
	},
	bardin_ironbreaker_decreased_overcharge = {
		buffs = {
			{
				max_stacks = 1,
				stat_buff = "reduced_overcharge",
			},
		},
	},
	bardin_ironbreaker_increased_ranged_power = {
		buffs = {
			{
				max_stacks = 1,
				stat_buff = "power_level_ranged_drakefire",
			},
		},
	},
	bardin_ironbreaker_increased_ranged_attack_speed = {
		buffs = {
			{
				max_stacks = 1,
				stat_buff = "attack_speed",
			},
		},
	},
	bardin_ironbreaker_party_power_on_blocked_attacks_add = {
		buffs = {
			{
				buff_func = "add_buff_to_all_players",
				buff_to_add = "bardin_ironbreaker_party_power_on_blocked_attacks_buff",
				chunk_size = 1,
				event = "on_block",
				max_stacks = 1,
				max_sub_buff_stacks = 5,
			},
		},
	},
	bardin_ironbreaker_party_power_on_blocked_attacks_buff = {
		buffs = {
			{
				icon = "bardin_ironbreaker_power_on_blocked_attacks",
				refresh_durations = true,
				stat_buff = "power_level_melee",
			},
		},
	},
	bardin_ironbreaker_power_on_blocked_attacks_add = {
		buffs = {
			{
				buff_func = "bardin_ironbreaker_add_power_buff_on_block",
				buff_to_add = "bardin_ironbreaker_power_on_blocked_attacks_buff",
				event = "on_block",
				max_stacks = 1,
			},
		},
	},
	bardin_ironbreaker_power_on_blocked_attacks_remove_damage = {
		buffs = {
			{
				buff_func = "bardin_ironbreaker_remove_on_block_power_buff",
				buff_to_remove = "bardin_ironbreaker_power_on_blocked_attacks_buff",
				chunk_size = 1,
				event = "on_player_damage_dealt",
				max_stacks = 1,
				reference_buff = "bardin_ironbreaker_power_on_blocked_attacks_add",
			},
		},
	},
	bardin_ironbreaker_power_on_blocked_attacks_remove_stagger = {
		buffs = {
			{
				buff_func = "bardin_ironbreaker_remove_on_block_power_buff",
				buff_to_remove = "bardin_ironbreaker_power_on_blocked_attacks_buff",
				chunk_size = 1,
				event = "on_stagger",
				max_stacks = 1,
				reference_buff = "bardin_ironbreaker_power_on_blocked_attacks_add",
			},
		},
	},
	bardin_ironbreaker_power_on_blocked_attacks_buff = {
		buffs = {
			{
				icon = "bardin_ironbreaker_power_on_blocked_attacks",
				stat_buff = "power_level_melee",
			},
		},
	},
	bardin_ironbreaker_stacking_buff_gromril = {
		buffs = {
			{
				activation_buff = "bardin_ironbreaker_gromril_armour",
				buff_func = "bardin_ironbreaker_gromril_trigger_rising_anger",
				buff_on_pop = "bardin_ironbreaker_gromril_attack_speed",
				buff_to_add = "bardin_ironbreaker_gromril_rising_anger",
				event = "on_gromril_armour_removed",
				max_sub_buff_stacks = 5,
				update_frequency = 7,
				update_func = "bardin_ironbreaker_stacking_buff_gromril",
			},
		},
	},
	bardin_ironbreaker_gromril_attack_speed = {
		buffs = {
			{
				duration = 10,
				icon = "bardin_ironbreaker_power_on_blocked_attacks",
				stat_buff = "attack_speed",
			},
		},
	},
	bardin_ironbreaker_gromril_stamina_regen = {
		buffs = {
			{
				icon = "bardin_ironbreaker_stamina_regen_during_gromril",
				max_stacks = 5,
				stat_buff = "fatigue_regen",
			},
		},
	},
	bardin_ironbreaker_gromril_rising_anger = {
		buffs = {
			{
				icon = "bardin_ironbreaker_stamina_regen_during_gromril",
				max_stacks = 5,
			},
		},
	},
	bardin_ironbreaker_gromril_delay_short = {
		buffs = {
			{
				buff_to_add = "bardin_ironbreaker_gromril_armour",
				duration_end_func = "add_buff_local",
				icon = "bardin_ironbreaker_gromril_armour",
				is_cooldown = true,
				max_stacks = 1,
				name = "gromril_delay",
				refresh_durations = true,
			},
		},
	},
	bardin_ironbreaker_gromril_stagger = {
		buffs = {
			{
				buff_func = "bardin_ironbreaker_gromril_stagger",
				event = "on_gromril_armour_removed",
				explosion_template = ExplosionTemplates.bardin_ironbreaker_gromril_stagger,
			},
		},
	},
	bardin_ironbreaker_regen_stamina_on_charged_attacks = {
		buffs = {
			{
				buff_func = "bardin_ironbreaker_regen_stamina_on_charged_attacks",
				event = "on_hit",
			},
		},
	},
	bardin_ironbreaker_regen_stamina_on_charged_attacks_buff = {
		buffs = {
			{
				icon = "bardin_ironbreaker_regen_stamina_on_charged_attacks",
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "fatigue_regen",
			},
		},
	},
	bardin_ironbreaker_regen_stamina_on_block_broken = {
		buffs = {
			{
				buff_func = "bardin_ironbreaker_regen_stamina_on_block_broken",
				event = "on_block_broken",
			},
		},
	},
	bardin_ironbreaker_cooldown_reduction_on_kill_while_full_stamina = {
		buffs = {
			{
				buff_func = "bardin_ironbreaker_cooldown_reduction_on_kill_while_full_stamina",
				event = "on_kill",
			},
		},
	},
	bardin_ironbreaker_activated_ability_taunt_range_and_duration = {
		activation_effect = "fx/screenspace_potion_03",
		activation_sound = "hud_gameplay_stance_tank_activate",
		deactivation_sound = "hud_gameplay_stance_deactivate",
		buffs = {
			{
				icon = "bardin_ironbreaker_activated_ability",
				max_stacks = 1,
				name = "bardin_ironbreaker_activated_ability_duration",
				refresh_durations = true,
				remove_buff_func = "end_bardin_ironbreaker_activated_ability",
				stat_buff = "damage_taken",
				update_func = "update_bardin_ironbreaker_activated_ability",
				perks = {
					buff_perks.reduced_hit_react,
				},
				multiplier = buff_tweak_data.bardin_ironbreaker_activated_ability_taunt_range_and_duration.multiplier_damage_taken,
			},
		},
	},
	bardin_ironbreaker_activated_ability_taunt_range_and_duration_block_cost = {
		buffs = {
			{
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "block_cost",
				multiplier = buff_tweak_data.bardin_ironbreaker_activated_ability_taunt_range_and_duration.multiplier_block_cost,
				duration = buff_tweak_data.bardin_ironbreaker_activated_ability_taunt_range_and_duration.duration,
			},
		},
	},
	bardin_ironbreaker_activated_ability_taunt_range_and_duration_attack_intensity_decay_increase = {
		buffs = {
			{
				max_stacks = 1,
				name = "bardin_ironbreaker_activated_ability_attack_intensity_decay_increase",
				refresh_durations = true,
				stat_buff = "attack_intensity_decay",
				multiplier = buff_tweak_data.bardin_ironbreaker_activated_ability_taunt_range_and_duration.attack_intensity_decay_multiplier,
				duration = buff_tweak_data.bardin_ironbreaker_activated_ability_taunt_range_and_duration.duration,
			},
		},
	},
	bardin_ironbreaker_activated_ability_power_buff = {
		buffs = {
			{
				icon = "bardin_ironbreaker_activated_ability_power_buff_allies",
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "power_level",
			},
		},
	},
	bardin_slayer_ability_cooldown_on_hit = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown",
				event = "on_hit",
			},
		},
	},
	bardin_slayer_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken",
				event = "on_damage_taken",
			},
		},
	},
	bardin_slayer_passive_attack_speed = {
		buffs = {
			{
				stat_buff = "attack_speed",
			},
		},
	},
	bardin_slayer_passive_uninterruptible_heavy = {
		buffs = {
			{
				perks = {
					buff_perks.uninterruptible_heavy,
				},
			},
		},
	},
	bardin_slayer_passive_uninterruptible_leap = {
		buffs = {
			{
				max_stacks = 1,
				perks = {
					buff_perks.uninterruptible,
				},
			},
		},
	},
	bardin_slayer_passive_stacking_damage_buff_on_hit = {
		buffs = {
			{
				buff_func = "add_bardin_slayer_passive_buff",
				event = "on_hit",
				max_stacks = buff_tweak_data.bardin_slayer_passive_stacking_damage_buff.max_stacks,
			},
		},
	},
	bardin_slayer_passive_stacking_damage_buff = {
		buffs = {
			{
				icon = "bardin_slayer_passive",
				refresh_durations = true,
				stat_buff = "increased_weapon_damage",
			},
		},
	},
	bardin_slayer_activated_ability = {
		buffs = {
			{
				icon = "bardin_slayer_activated_ability",
				max_stacks = 1,
				name = "bardin_slayer_frenzy",
				refresh_durations = true,
				remove_buff_func = "end_slayer_activated_ability",
				stat_buff = "attack_speed",
				perks = {
					buff_perks.no_ranged_knockback,
				},
			},
		},
	},
	bardin_slayer_reaper = {
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
	bardin_slayer_bloodlust = {
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
	bardin_slayer_conqueror = {
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
	bardin_slayer_crit_chance = {
		buffs = {
			{
				stat_buff = "critical_strike_chance",
			},
		},
	},
	bardin_slayer_power_on_double_two_handed_weapons = {
		buffs = {
			{
				buff_to_add = "bardin_slayer_power_on_double_two_handed_weapons_buff",
				buff_type = "MELEE_2H",
				update_func = "bardin_slayer_activate_buff_on_loadout",
			},
		},
	},
	bardin_slayer_power_on_double_two_handed_weapons_buff = {
		buffs = {
			{
				icon = "bardin_slayer_power_on_double_two_handed_weapons",
				max_stacks = 1,
				stat_buff = "power_level",
			},
		},
	},
	bardin_slayer_attack_speed_on_double_one_handed_weapons = {
		buffs = {
			{
				buff_to_add = "bardin_slayer_attack_speed_on_double_one_handed_weapons_buff",
				buff_type = "MELEE_1H",
				update_func = "bardin_slayer_activate_buff_on_loadout",
			},
		},
	},
	bardin_slayer_attack_speed_on_double_one_handed_weapons_buff = {
		buffs = {
			{
				icon = "bardin_slayer_attack_speed_on_double_one_handed_weapons",
				max_stacks = 1,
				stat_buff = "attack_speed",
			},
		},
	},
	bardin_slayer_passive_cooldown_reduction_on_max_stacks = {
		buffs = {
			{
				icon = "bardin_slayer_passive_cooldown_reduction_on_max_stacks",
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "cooldown_regen",
				duration = buff_tweak_data.bardin_slayer_passive_stacking_damage_buff.duration,
			},
		},
	},
	bardin_slayer_passive_increased_max_stacks = {
		buffs = {
			{
				icon = "bardin_slayer_passive",
				refresh_durations = true,
				stat_buff = "increased_weapon_damage",
			},
		},
	},
	bardin_slayer_passive_movement_speed = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
		},
	},
	bardin_slayer_damage_taken_capped = {
		buffs = {
			{
				stat_buff = "max_damage_taken_from_boss_or_elite",
			},
		},
	},
	bardin_slayer_damage_reduction_on_melee_charge_action = {
		buffs = {
			{
				buff_func = "add_buff_on_charged_attack_hit",
				buff_to_add = "bardin_slayer_damage_reduction_on_melee_charge_action_buff",
				event = "on_hit",
				max_stacks = 1,
				server_controlled = false,
			},
		},
	},
	bardin_slayer_damage_reduction_on_melee_charge_action_buff = {
		buffs = {
			{
				icon = "bardin_slayer_damage_reduction_on_melee_charge_action",
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "damage_taken",
			},
		},
	},
	bardin_slayer_push_on_dodge = {
		buffs = {
			{
				buff_func = "bardin_slayer_push_on_dodge",
				event = "on_dodge",
				explosion_template = "bardin_slayer_push_on_dodge",
			},
		},
	},
	bardin_slayer_activated_ability_leap_damage_add = {
		buffs = {
			{
				buff_func = "bardin_slayer_add_buff_on_leap_start",
				buff_to_add = "bardin_slayer_activated_ability_leap_damage_buff",
				event = "on_leap_start",
				max_stacks = 1,
			},
		},
	},
	bardin_slayer_activated_ability_leap_damage_remove = {
		buffs = {
			{
				buff_func = "bardin_slayer_remove_buff_on_leap_finished",
				event = "on_leap_finished",
				max_stacks = 1,
				parent_buff = "bardin_slayer_activated_ability_leap_damage_add",
			},
		},
	},
	bardin_slayer_activated_ability_leap_damage_buff = {
		buffs = {
			{
				icon = "bardin_slayer_activated_ability_leap_damage",
				max_stacks = 1,
				stat_buff = "power_level",
				perks = {
					buff_perks.bloody_mess,
				},
			},
		},
	},
	bardin_slayer_activated_ability_movement = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				max_stacks = 1,
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				duration = buff_tweak_data.bardin_slayer_activated_ability.duration,
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
		},
	},
	bardin_ranger_ability_cooldown_on_hit = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown",
				event = "on_hit",
			},
		},
	},
	bardin_ranger_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken",
				event = "on_damage_taken",
			},
		},
	},
	bardin_ranger_passive = {
		buffs = {
			{
				buff_func = "bardin_ranger_scavenge_proc",
				event = "on_special_killed",
			},
		},
	},
	bardin_ranger_passive_consumeable_dupe_healing = {
		buffs = {
			{
				stat_buff = "not_consume_medpack",
			},
		},
	},
	bardin_ranger_passive_consumeable_dupe_potion = {
		buffs = {
			{
				stat_buff = "not_consume_potion",
			},
		},
	},
	bardin_ranger_passive_consumeable_dupe_grenade = {
		buffs = {
			{
				stat_buff = "not_consume_grenade",
			},
		},
	},
	bardin_ranger_passive_reload_speed = {
		buffs = {
			{
				stat_buff = "reload_speed",
			},
		},
	},
	bardin_ranger_passive_increased_ammunition = {
		buffs = {
			{
				stat_buff = "total_ammo",
			},
		},
	},
	bardin_ranger_activated_ability = {
		buffs = {
			{
				apply_buff_func = "play_sound_synced",
				area_radius = 8,
				area_unit_name = "units/hub_elements/empty",
				buff_area = true,
				buff_area_buff = "bardin_ranger_activated_ability_buff",
				buff_self = true,
				icon = "bardin_ranger_activated_ability",
				name = "bardin_ranger_activated_ability",
				shared_area = true,
				sound_to_play = "Play_career_ability_bardin_ranger_enter",
				buff_sync_type = BuffSyncType.LocalAndServer,
				duration_modifier_func = function (unit, sub_buff_template, duration, self, params)
					local mechanism_name = Managers.mechanism:current_mechanism_name()

					if mechanism_name == "versus" then
						return CareerConstants.dr_ranger.ability_duration_versus
					end

					return duration
				end,
			},
		},
	},
	bardin_ranger_activated_ability_buff = {
		buffs = {
			{
				apply_buff_func = "ranger_activated_ability_buff",
				icon = "bardin_ranger_activated_ability",
				remove_buff_func = "ranger_activated_ability_buff_remove",
				status_effect = "invis_ranger",
			},
		},
	},
	bardin_ranger_reaper = {
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
	bardin_ranger_vanguard = {
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
	bardin_ranger_conqueror = {
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
	bardin_ranger_increased_melee_damage_on_no_ammo_add = {
		buffs = {
			{
				buff_func = "bardin_ranger_add_power_on_no_ammo_proc",
				buff_to_add = "bardin_ranger_melee_damage_on_no_ammo",
				event = "on_last_ammo_used",
			},
		},
	},
	bardin_ranger_increased_melee_damage_on_no_ammo_remove = {
		buffs = {
			{
				buff_func = "bardin_ranger_remove_power_on_no_ammo_proc",
				buff_to_remove = "bardin_ranger_melee_damage_on_no_ammo",
				event = "on_gained_ammo_from_no_ammo",
			},
		},
	},
	bardin_ranger_melee_damage_on_no_ammo = {
		buffs = {
			{
				icon = "bardin_ranger_increased_melee_damage_on_no_ammo",
				max_stacks = 1,
				priority_buff = true,
				stat_buff = "power_level",
			},
		},
	},
	bardin_ranger_cooldown_on_reload = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown",
				event = "on_reload",
			},
		},
	},
	bardin_ranger_attack_speed = {
		buffs = {
			{
				stat_buff = "attack_speed",
			},
		},
	},
	bardin_ranger_movement_speed = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
		},
	},
	bardin_ranger_reduced_damage_taken_headshot = {
		buffs = {
			{
				buff_func = "add_buff_on_headshot",
				buff_to_add = "bardin_ranger_reduced_damage_taken_headshot_buff",
				event = "on_hit",
			},
		},
	},
	bardin_ranger_reduced_damage_taken_headshot_buff = {
		buffs = {
			{
				icon = "bardin_ranger_reduced_damage_taken_headshot",
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "damage_taken",
			},
		},
	},
	bardin_ranger_reload_speed_on_multi_hit_add = {
		buffs = {
			{
				buff_func = "bardin_ranger_add_reload_speed_buff",
				buff_to_add = "bardin_ranger_reload_speed_on_multi_hit_buff",
				event = "on_hit",
			},
		},
	},
	bardin_ranger_reload_speed_on_multi_hit_buff = {
		buffs = {
			{
				icon = "bardin_ranger_reload_speed_on_multi_hit",
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "reload_speed",
			},
		},
	},
	bardin_ranger_smoke_attack = {
		buffs = {
			{
				area_radius = 8,
				area_unit_name = "units/hub_elements/empty",
				buff_allies = true,
				buff_area = true,
				buff_area_buff = "bardin_ranger_smoke_attack_buff",
				buff_self = true,
				name = "bardin_ranger_activated_ability_attack",
				shared_area = true,
				buff_sync_type = BuffSyncType.All,
				duration_modifier_func = function (unit, sub_buff_template, duration, self, params)
					local mechanism_name = Managers.mechanism:current_mechanism_name()

					if mechanism_name == "versus" then
						return CareerConstants.dr_ranger.ability_duration_versus
					end

					return duration
				end,
			},
		},
	},
	bardin_ranger_smoke_attack_buff = {
		buffs = {
			{
				icon = "bardin_ranger_activated_ability_duration",
				refresh_durations = true,
				stat_buff = "attack_speed",
			},
		},
	},
	bardin_ranger_smoke_heal = {
		buffs = {
			{
				area_radius = 8,
				area_unit_name = "units/hub_elements/empty",
				buff_allies = true,
				buff_area = true,
				buff_area_buff = "bardin_ranger_smoke_heal_buff",
				buff_self = true,
				name = "bardin_ranger_activated_ability_heal",
				shared_area = true,
				buff_sync_type = BuffSyncType.LocalAndServer,
				duration_modifier_func = function (unit, sub_buff_template, duration, self, params)
					local mechanism_name = Managers.mechanism:current_mechanism_name()

					if mechanism_name == "versus" then
						return CareerConstants.dr_ranger.ability_duration_versus
					end

					return duration
				end,
			},
		},
	},
	bardin_ranger_smoke_heal_buff = {
		buffs = {
			{
				refresh_durations = true,
				update_func = "bardin_ranger_heal_smoke",
			},
		},
	},
	bardin_ranger_activated_ability_stealth_outside_of_smoke = {
		buffs = {
			{
				apply_buff_func = "add_buff_local",
				buff_to_add = "bardin_ranger_activated_ability_buff",
				icon = "bardin_ranger_activated_ability",
				max_stacks = 1,
				name = "bardin_ranger_activated_ability",
				refresh_durations = true,
				duration_modifier_func = function (unit, sub_buff_template, duration, self, params)
					local mechanism_name = Managers.mechanism:current_mechanism_name()

					if mechanism_name == "versus" then
						return CareerConstants.dr_ranger.ability_duration_versus
					end

					return duration
				end,
			},
		},
	},
	bardin_ranger_ability_free_grenade_buff = {
		buffs = {
			{
				event = "on_grenade_use",
				icon = "bardin_ranger_ability_free_grenade",
				max_stacks = 1,
				remove_on_proc = true,
				perks = {
					buff_perks.free_grenade,
				},
			},
		},
	},
}
TalentTrees = TalentTrees or {}
TalentTrees.dwarf_ranger = {
	{
		{
			"bardin_ironbreaker_vanguard",
			"bardin_ironbreaker_bloodlust_2",
			"bardin_ironbreaker_heal_share",
		},
		{
			"bardin_ironbreaker_overcharge_increase_power_lowers_attack_speed",
			"bardin_ironbreaker_power_on_nearby_allies",
			"bardin_ironbreaker_party_power_on_blocked_attacks",
		},
		{
			"bardin_ironbreaker_tank_unbalance",
			"bardin_ironbreaker_smiter_unbalance",
			"bardin_ironbreaker_power_level_unbalance",
		},
		{
			"bardin_ironbreaker_rising_attack_speed",
			"bardin_ironbreaker_gromril_stagger",
			"bardin_ironbreaker_max_gromril_delay",
		},
		{
			"bardin_ironbreaker_regen_stamina_on_block_broken",
			"bardin_ironbreaker_cooldown_reduction_on_kill_while_full_stamina",
			"bardin_ironbreaker_regen_stamina_on_charged_attacks",
		},
		{
			"bardin_ironbreaker_activated_ability_power_buff_allies",
			"bardin_ironbreaker_activated_ability_taunt_bosses",
			"bardin_ironbreaker_activated_ability_taunt_range_and_duration",
		},
	},
	{
		{
			"bardin_slayer_reaper",
			"bardin_slayer_bloodlust_2",
			"bardin_slayer_heal_share",
		},
		{
			"bardin_slayer_attack_speed_on_double_one_handed_weapons",
			"bardin_slayer_power_on_double_two_handed_weapons",
			"bardin_slayer_crit_chance",
		},
		{
			"bardin_slayer_smiter_unbalance",
			"bardin_slayer_linesman_unbalance",
			"bardin_slayer_power_level_unbalance",
		},
		{
			"bardin_slayer_passive_movement_speed",
			"bardin_slayer_passive_increased_max_stacks",
			"bardin_slayer_passive_cooldown_reduction_on_max_stacks",
		},
		{
			"bardin_slayer_damage_taken_capped",
			"bardin_slayer_damage_reduction_on_melee_charge_action",
			"bardin_slayer_push_on_dodge",
		},
		{
			"bardin_slayer_activated_ability_impact_damage",
			"bardin_slayer_activated_ability_leap_damage",
			"bardin_slayer_activated_ability_movement",
		},
	},
	{
		{
			"bardin_ranger_vanguard",
			"bardin_ranger_reaper",
			"bardin_ranger_heal_share",
		},
		{
			"bardin_ranger_increased_melee_damage_on_no_ammo",
			"bardin_ranger_cooldown_on_reload",
			"bardin_ranger_attack_speed",
		},
		{
			"bardin_ranger_tank_unbalance",
			"bardin_ranger_linesman_unbalance",
			"bardin_ranger_power_level_unbalance",
		},
		{
			"bardin_ranger_passive_ale",
			"bardin_ranger_passive_improved_ammo",
			"bardin_ranger_passive_spawn_potions_or_bombs",
		},
		{
			"bardin_ranger_movement_speed",
			"bardin_ranger_reduced_damage_taken_headshot",
			"bardin_ranger_reload_speed_on_multi_hit",
		},
		{
			"bardin_ranger_smoke_attack",
			"bardin_ranger_activated_ability_stealth_outside_of_smoke",
			"bardin_ranger_ability_free_grenade",
		},
	},
}
Talents.dwarf_ranger = {
	{
		buffer = "server",
		description = "vanguard_desc",
		icon = "bardin_ironbreaker_regrowth",
		name = "bardin_ironbreaker_vanguard",
		num_ranks = 1,
		description_values = {},
		buffs = {
			"bardin_ironbreaker_vanguard",
		},
	},
	{
		buffer = "server",
		description = "bloodlust_desc_3",
		icon = "bardin_ironbreaker_bloodlust",
		name = "bardin_ironbreaker_bloodlust_2",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("bloodlust", "adventure").buffs[1].multiplier,
			},
		},
		buffs = {
			"bardin_ironbreaker_bloodlust",
		},
	},
	{
		buffer = "server",
		description = "conqueror_desc_3",
		icon = "bardin_ironbreaker_conqueror",
		name = "bardin_ironbreaker_heal_share",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("conqueror", "adventure").buffs[1].multiplier,
			},
		},
		buffs = {
			"bardin_ironbreaker_conqueror",
		},
	},
	{
		buffer = "server",
		description = "bardin_ironbreaker_power_on_nearby_allies_desc",
		icon = "bardin_ironbreaker_power_on_nearby_allies2",
		name = "bardin_ironbreaker_power_on_nearby_allies",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ironbreaker_power_on_nearby_allies_buff.multiplier,
			},
		},
		buffs = {
			"bardin_ironbreaker_power_on_nearby_allies",
		},
	},
	{
		buffer = "both",
		description = "bardin_ironbreaker_overcharge_increase_power_lowers_attack_speed_desc",
		icon = "bardin_ironbreaker_increased_overcharge_increased_range_power",
		name = "bardin_ironbreaker_overcharge_increase_power_lowers_attack_speed",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ironbreaker_overcharge_increase_power_lowers_attack_speed_desc.inital_power,
			},
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ironbreaker_overcharge_increase_power_lowers_attack_speed_desc.final_power,
			},
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ironbreaker_overcharge_increase_power_lowers_attack_speed_desc.initial_attack_speed,
			},
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ironbreaker_overcharge_increase_power_lowers_attack_speed_desc.final_attack_speed,
			},
		},
		buffs = {
			"bardin_ironbreaker_drakefire_changing_attack_speed",
			"bardin_ironbreaker_drakefire_changing_ranged_power",
		},
	},
	{
		buffer = "server",
		description = "bardin_ironbreaker_party_power_on_blocked_attacks_desc",
		icon = "bardin_ironbreaker_power_on_blocked_attacks",
		name = "bardin_ironbreaker_party_power_on_blocked_attacks",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ironbreaker_party_power_on_blocked_attacks_buff.multiplier,
			},
			{
				value = buff_tweak_data.bardin_ironbreaker_party_power_on_blocked_attacks_buff.duration,
			},
			{
				value = buff_tweak_data.bardin_ironbreaker_party_power_on_blocked_attacks_buff.max_stacks,
			},
		},
		buffs = {
			"bardin_ironbreaker_party_power_on_blocked_attacks_add",
		},
	},
	{
		description = "bardin_ironbreaker_rising_attack_speed_desc",
		icon = "bardin_ironbreaker_stamina_regen_during_gromril",
		name = "bardin_ironbreaker_rising_attack_speed",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.bardin_ironbreaker_gromril_attack_speed.presentation_delay,
			},
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ironbreaker_gromril_attack_speed.multiplier,
			},
		},
		buffs = {
			"bardin_ironbreaker_stacking_buff_gromril",
		},
	},
	{
		description = "bardin_ironbreaker_max_gromril_delay_desc",
		icon = "bardin_ironbreaker_max_gromril_delay",
		name = "bardin_ironbreaker_max_gromril_delay",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.bardin_ironbreaker_gromril_delay_short.duration,
			},
		},
		buffs = {},
	},
	{
		buffer = "server",
		description = "bardin_ironbreaker_gromril_stagger_desc",
		icon = "bardin_ironbreaker_gromril_stagger",
		name = "bardin_ironbreaker_gromril_stagger",
		num_ranks = 1,
		description_values = {},
		buffs = {
			"bardin_ironbreaker_gromril_stagger",
		},
	},
	{
		description = "bardin_ironbreaker_regen_stamina_on_charged_attacks_desc",
		icon = "bardin_ironbreaker_regen_stamina_on_charged_attacks",
		name = "bardin_ironbreaker_regen_stamina_on_charged_attacks",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ironbreaker_regen_stamina_on_charged_attacks_buff.multiplier,
			},
			{
				value = buff_tweak_data.bardin_ironbreaker_regen_stamina_on_charged_attacks_buff.duration,
			},
		},
		buffs = {
			"bardin_ironbreaker_regen_stamina_on_charged_attacks",
		},
	},
	{
		description = "bardin_ironbreaker_regen_stamina_on_block_broken_desc",
		icon = "bardin_ironbreaker_regen_stamina_on_block_broken",
		name = "bardin_ironbreaker_regen_stamina_on_block_broken",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ironbreaker_regen_stamina_on_block_broken.proc_chance,
			},
		},
		buffs = {
			"bardin_ironbreaker_regen_stamina_on_block_broken",
		},
	},
	{
		description = "bardin_ironbreaker_cooldown_reduction_on_kill_while_full_stamina_desc",
		icon = "bardin_ironbreaker_cooldown_reduction_on_kill_while_full_stamina",
		name = "bardin_ironbreaker_cooldown_reduction_on_kill_while_full_stamina",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ironbreaker_cooldown_reduction_on_kill_while_full_stamina.cooldown_reduction,
			},
		},
		buffs = {
			"bardin_ironbreaker_cooldown_reduction_on_kill_while_full_stamina",
		},
	},
	{
		description = "bardin_ironbreaker_activated_ability_power_buff_allies_desc",
		icon = "bardin_ironbreaker_activated_ability_power_buff_allies",
		name = "bardin_ironbreaker_activated_ability_power_buff_allies",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ironbreaker_activated_ability_power_buff.multiplier,
			},
			{
				value = buff_tweak_data.bardin_ironbreaker_activated_ability_power_buff.duration,
			},
		},
		buffs = {},
	},
	{
		description = "bardin_ironbreaker_activated_ability_taunt_bosses_desc",
		icon = "bardin_ironbreaker_activated_ability_taunt_bosses",
		name = "bardin_ironbreaker_activated_ability_taunt_bosses",
		num_ranks = 1,
		buffs = {},
	},
	{
		description = "bardin_ironbreaker_activated_ability_taunt_range_and_duration_desc",
		icon = "bardin_ironbreaker_activated_ability_duration",
		name = "bardin_ironbreaker_activated_ability_taunt_range_and_duration",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ironbreaker_activated_ability_taunt_range_and_duration.display_multiplier,
			},
			{
				value = buff_tweak_data.bardin_ironbreaker_activated_ability_taunt_range_and_duration.duration,
			},
		},
		buffs = {},
	},
	{
		buffer = "server",
		description = "tank_unbalance_desc",
		icon = "bardin_ironbreaker_tank_unbalance",
		name = "bardin_ironbreaker_tank_unbalance",
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
		icon = "bardin_ironbreaker_smiter_unbalance",
		name = "bardin_ironbreaker_smiter_unbalance",
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
		icon = "bardin_ironbreaker_power_level_unbalance",
		name = "bardin_ironbreaker_power_level_unbalance",
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
		icon = "bardin_slayer_regrowth",
		name = "bardin_slayer_reaper",
		num_ranks = 1,
		description_values = {
			{
				value = BuffUtils.get_buff_template("reaper", "adventure").buffs[1].max_targets,
			},
		},
		buffs = {
			"bardin_slayer_reaper",
		},
	},
	{
		buffer = "server",
		description = "bloodlust_desc_3",
		icon = "bardin_slayer_bloodlust",
		name = "bardin_slayer_bloodlust_2",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("bloodlust", "adventure").buffs[1].multiplier,
			},
		},
		buffs = {
			"bardin_slayer_bloodlust",
		},
	},
	{
		buffer = "server",
		description = "conqueror_desc_3",
		icon = "bardin_slayer_conqueror",
		name = "bardin_slayer_heal_share",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("conqueror", "adventure").buffs[1].multiplier,
			},
		},
		buffs = {
			"bardin_slayer_conqueror",
		},
	},
	{
		description = "bardin_slayer_crit_chance_desc",
		icon = "bardin_slayer_crit_chance",
		name = "bardin_slayer_crit_chance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_slayer_crit_chance.bonus,
			},
		},
		buffs = {
			"bardin_slayer_crit_chance",
		},
	},
	{
		buffer = "server",
		description = "bardin_slayer_power_on_double_two_handed_weapons_desc",
		icon = "bardin_slayer_power_on_double_two_handed_weapons",
		name = "bardin_slayer_power_on_double_two_handed_weapons",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_slayer_power_on_double_two_handed_weapons_buff.multiplier,
			},
		},
		buffs = {
			"bardin_slayer_power_on_double_two_handed_weapons",
		},
	},
	{
		buffer = "server",
		description = "bardin_slayer_attack_speed_on_double_one_handed_weapons_desc",
		icon = "bardin_slayer_attack_speed_on_double_one_handed_weapons",
		name = "bardin_slayer_attack_speed_on_double_one_handed_weapons",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_slayer_attack_speed_on_double_one_handed_weapons_buff.multiplier,
			},
		},
		buffs = {
			"bardin_slayer_attack_speed_on_double_one_handed_weapons",
		},
	},
	{
		buffer = "server",
		description = "bardin_slayer_passive_cooldown_reduction_on_max_stacks_desc",
		icon = "bardin_slayer_passive_cooldown_reduction_on_max_stacks",
		name = "bardin_slayer_passive_cooldown_reduction_on_max_stacks",
		num_ranks = 1,
		description_values = {},
		buffs = {},
	},
	{
		buffer = "both",
		description = "bardin_slayer_passive_movement_speed_desc",
		icon = "bardin_slayer_passive_movement_speed",
		name = "bardin_slayer_passive_movement_speed",
		num_ranks = 1,
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.bardin_slayer_passive_movement_speed.multiplier,
			},
		},
		buffs = {},
	},
	{
		buffer = "server",
		description = "bardin_slayer_passive_increased_max_stacks_desc",
		icon = "bardin_slayer_passive_increased_max_stacks",
		name = "bardin_slayer_passive_increased_max_stacks",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.bardin_slayer_passive_increased_max_stacks.display_value,
			},
		},
		buffs = {},
	},
	{
		buffer = "server",
		description = "bardin_slayer_damage_taken_capped_desc_2",
		icon = "bardin_slayer_damage_taken_capped",
		name = "bardin_slayer_damage_taken_capped",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.bardin_slayer_damage_taken_capped.value,
			},
		},
		buffs = {
			"bardin_slayer_damage_taken_capped",
		},
	},
	{
		buffer = "server",
		description = "bardin_slayer_damage_reduction_on_melee_charge_action_desc_2",
		icon = "bardin_slayer_damage_reduction_on_melee_charge_action",
		name = "bardin_slayer_damage_reduction_on_melee_charge_action",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_slayer_damage_reduction_on_melee_charge_action_buff.multiplier,
			},
			{
				value = buff_tweak_data.bardin_slayer_damage_reduction_on_melee_charge_action_buff.duration,
			},
		},
		buffs = {
			"bardin_slayer_damage_reduction_on_melee_charge_action",
		},
	},
	{
		description = "bardin_slayer_push_on_dodge_desc",
		icon = "bardin_slayer_push_on_dodge",
		name = "bardin_slayer_push_on_dodge",
		num_ranks = 1,
		description_values = {},
		buffs = {
			"bardin_slayer_push_on_dodge",
		},
	},
	{
		buffer = "server",
		description = "bardin_slayer_activated_ability_leap_range_desc",
		icon = "bardin_slayer_activated_ability_leap_range",
		name = "bardin_slayer_activated_ability_leap_range",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_slayer_activated_ability_leap_range.display_multiplier,
			},
		},
		buffs = {},
	},
	{
		buffer = "server",
		description = "bardin_slayer_activated_ability_leap_damage_desc",
		icon = "bardin_slayer_activated_ability_leap_damage",
		name = "bardin_slayer_activated_ability_leap_damage",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_slayer_activated_ability_leap_damage_buff.multiplier,
			},
		},
		buffs = {
			"bardin_slayer_activated_ability_leap_damage_add",
			"bardin_slayer_activated_ability_leap_damage_remove",
		},
	},
	{
		description = "bardin_slayer_activated_ability_impact_damage_desc_2",
		icon = "bardin_slayer_activated_ability_impact_damage",
		name = "bardin_slayer_activated_ability_impact_damage",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_slayer_activated_ability_impact_damage.display_multiplier,
			},
		},
		buffs = {},
	},
	{
		description = "bardin_slayer_activated_ability_movement_desc_2",
		icon = "bardin_slayer_activated_ability_movement",
		name = "bardin_slayer_activated_ability_movement",
		num_ranks = 1,
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.bardin_slayer_activated_ability_movement.multiplier,
			},
		},
		buffs = {},
	},
	{
		buffer = "server",
		description = "smiter_unbalance_desc",
		icon = "bardin_slayer_smiter_unbalance",
		name = "bardin_slayer_smiter_unbalance",
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
		description = "linesman_unbalance_desc",
		icon = "bardin_slayer_linesman_unbalance",
		name = "bardin_slayer_linesman_unbalance",
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
		icon = "bardin_slayer_power_level_unbalance",
		name = "bardin_slayer_power_level_unbalance",
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
		description = "vanguard_desc",
		icon = "bardin_ranger_regrowth",
		name = "bardin_ranger_vanguard",
		num_ranks = 1,
		description_values = {},
		buffs = {
			"bardin_ranger_vanguard",
		},
	},
	{
		buffer = "server",
		description = "reaper_desc",
		icon = "bardin_ranger_bloodlust",
		name = "bardin_ranger_reaper",
		num_ranks = 1,
		description_values = {
			{
				value = BuffUtils.get_buff_template("reaper", "adventure").buffs[1].max_targets,
			},
		},
		buffs = {
			"bardin_ranger_reaper",
		},
	},
	{
		buffer = "server",
		description = "conqueror_desc_3",
		icon = "bardin_ranger_conqueror",
		name = "bardin_ranger_heal_share",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("conqueror", "adventure").buffs[1].multiplier,
			},
		},
		buffs = {
			"bardin_ranger_conqueror",
		},
	},
	{
		buffer = "both",
		description = "bardin_ranger_increased_melee_damage_on_no_ammo_desc",
		icon = "bardin_ranger_increased_melee_damage_on_no_ammo",
		name = "bardin_ranger_increased_melee_damage_on_no_ammo",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ranger_melee_damage_on_no_ammo.multiplier,
			},
		},
		buffs = {
			"bardin_ranger_increased_melee_damage_on_no_ammo_add",
			"bardin_ranger_increased_melee_damage_on_no_ammo_remove",
		},
	},
	{
		buffer = "both",
		description = "bardin_ranger_cooldown_on_reload_desc",
		icon = "bardin_ranger_cooldown_on_reload",
		name = "bardin_ranger_cooldown_on_reload",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.bardin_ranger_cooldown_on_reload.bonus,
			},
		},
		buffs = {
			"bardin_ranger_cooldown_on_reload",
		},
	},
	{
		description = "bardin_ranger_attack_speed_desc",
		icon = "bardin_ranger_attack_speed",
		name = "bardin_ranger_attack_speed",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ranger_attack_speed.multiplier,
			},
		},
		buffs = {
			"bardin_ranger_attack_speed",
		},
	},
	{
		description = "bardin_ranger_passive_spawn_potions_or_bombs_desc",
		icon = "bardin_ranger_passive_spawn_potions",
		name = "bardin_ranger_passive_spawn_potions_or_bombs",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ranger_passive_spawn_potions_or_bombs.spawn_chance,
			},
		},
		buffs = {},
		attributes = {
			spawn_chance = buff_tweak_data.bardin_ranger_passive_spawn_potions_or_bombs.spawn_chance,
		},
		mechanism_overrides = {
			versus = {
				description_values = {
					{
						value_type = "percent",
						value = buff_tweak_data.bardin_ranger_passive_spawn_potions_or_bombs.spawn_chance_versus,
					},
				},
				attributes = {
					spawn_chance = buff_tweak_data.bardin_ranger_passive_spawn_potions_or_bombs.spawn_chance_versus,
				},
			},
		},
	},
	{
		description = "bardin_ranger_passive_improved_ammo_desc_2",
		icon = "bardin_ranger_passive_improved_ammo",
		name = "bardin_ranger_passive_improved_ammo",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ranger_passive_improved_ammo.multiplier,
			},
		},
		buffs = {},
	},
	{
		description = "bardin_ranger_passive_ale_desc",
		icon = "buff_icon_mutator_icon_drunk",
		name = "bardin_ranger_passive_ale",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_survival_ale_buff_presentation.multiplier_2,
			},
			{
				value_type = "baked_percent",
				value = buff_tweak_data.bardin_survival_ale_buff_presentation.multiplier,
			},
			{
				value = buff_tweak_data.bardin_survival_ale_buff_presentation.duration,
			},
			{
				value = buff_tweak_data.bardin_survival_ale_buff_presentation.max_stacks,
			},
		},
		buffs = {},
	},
	{
		description = "bardin_ranger_movement_speed_desc",
		icon = "bardin_ranger_movement_speed",
		name = "bardin_ranger_movement_speed",
		num_ranks = 1,
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.bardin_ranger_movement_speed.multiplier,
			},
		},
		buffs = {
			"bardin_ranger_movement_speed",
		},
	},
	{
		buffer = "server",
		description = "bardin_ranger_reduced_damage_taken_headshot_desc_2",
		icon = "bardin_ranger_reduced_damage_taken_headshot",
		name = "bardin_ranger_reduced_damage_taken_headshot",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ranger_reduced_damage_taken_headshot_buff.multiplier,
			},
			{
				value = buff_tweak_data.bardin_ranger_reduced_damage_taken_headshot_buff.duration,
			},
		},
		buffs = {
			"bardin_ranger_reduced_damage_taken_headshot",
		},
	},
	{
		description = "bardin_ranger_reload_speed_on_multi_hit_desc",
		icon = "bardin_ranger_reload_speed_on_multi_hit",
		name = "bardin_ranger_reload_speed_on_multi_hit",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.bardin_ranger_reload_speed_on_multi_hit_add.target_number,
			},
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ranger_reload_speed_on_multi_hit_buff.multiplier,
			},
		},
		buffs = {
			"bardin_ranger_reload_speed_on_multi_hit_add",
		},
	},
	{
		description = "bardin_ranger_smoke_attack_desc",
		icon = "bardin_ranger_activated_ability_duration",
		name = "bardin_ranger_smoke_attack",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.bardin_ranger_smoke_attack_buff.multiplier,
			},
			{
				value = buff_tweak_data.bardin_ranger_smoke_heal_buff.heal_amount,
			},
		},
		buffs = {},
	},
	{
		description = "bardin_ranger_activated_ability_stealth_outside_of_smoke_desc",
		icon = "bardin_ranger_activated_ability_stealth_outside_of_smoke",
		name = "bardin_ranger_activated_ability_stealth_outside_of_smoke",
		num_ranks = 1,
		description_values = {},
		buffs = {},
	},
	{
		description = "bardin_ranger_ability_free_grenade_desc",
		icon = "bardin_ranger_ability_free_grenade",
		name = "bardin_ranger_ability_free_grenade",
		num_ranks = 1,
		description_values = {},
		buffs = {},
	},
	{
		buffer = "server",
		description = "tank_unbalance_desc",
		icon = "bardin_ranger_tank_unbalance",
		name = "bardin_ranger_tank_unbalance",
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
		icon = "bardin_ranger_linesman_unbalance",
		name = "bardin_ranger_linesman_unbalance",
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
		icon = "bardin_ranger_power_level_unbalance",
		name = "bardin_ranger_power_level_unbalance",
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
		description = "bardin_placeholder",
		name = "bardin_placeholder",
	},
}

BuffUtils.copy_talent_buff_names(TalentBuffTemplates.dwarf_ranger)
BuffUtils.apply_buff_tweak_data(TalentBuffTemplates.dwarf_ranger, buff_tweak_data)

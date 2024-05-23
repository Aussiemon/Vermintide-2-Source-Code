-- chunkname: @scripts/managers/talents/talent_settings_kerillian.lua

require("scripts/entity_system/systems/buff/buff_sync_type")

local buff_perks = require("scripts/unit_extensions/default_player_unit/buffs/settings/buff_perk_names")
local buff_tweak_data = {
	kerillian_shade_ability_cooldown_on_hit = {
		bonus = 0.5,
	},
	kerillian_shade_ability_cooldown_on_damage_taken = {
		bonus = 0.2,
	},
	kerillian_shade_passive = {
		bonus = 1,
	},
	kerillian_shade_passive_crit = {
		bonus = 0.05,
	},
	kerillian_shade_activated_ability = {
		duration = 5,
	},
	kerillian_shade_activated_ability_quick_cooldown_buff = {
		multiplier = -0.45,
	},
	kerillian_shade_activated_ability_quick_cooldown_crit = {
		bonus = 1,
		duration = 4,
	},
	kerillian_shade_regrowth = {},
	kerillian_shade_bloodlust = {},
	kerillian_shade_conqueror = {},
	kerillian_shade_increased_damage_on_poisoned_or_bleeding_enemy = {
		multiplier = 0.2,
	},
	kerillian_shade_increased_critical_strike_damage = {
		multiplier = 0.5,
	},
	kerillian_shade_stacking_headshot_damage_on_headshot_buff = {
		duration = 10,
		max_stacks = 10,
		multiplier = 0.1,
	},
	kerillian_shade_headshot_backstab_counter = {
		max_stacks = 2,
	},
	kerillian_shade_passive_improved = {
		bonus = 0.25,
	},
	kerillian_shade_backstabs_cooldown_regeneration_buff = {
		duration = 3,
		max_stacks = 1,
		multiplier = 1,
	},
	kerillian_shade_charged_backstabs_buff = {
		bonus = 0.25,
		duration = 5,
		max_stacks = 2,
	},
	kerillian_shade_backstabs_replenishes_ammunition = {
		bonus = 1,
	},
	kerillian_shade_backstabs_replenishes_ammunition_cooldown = {
		duration = 2,
	},
	kerillian_shade_backstabs_free_shot_buff = {
		max_stacks = 3,
	},
	kerillian_shade_activated_ability_short = {
		duration = 3,
	},
	kerillian_shade_activated_ability_short_blocker = {
		duration = 5,
	},
	kerillian_shade_movement_speed = {
		multiplier = 1.1,
	},
	kerillian_shade_movement_speed_on_critical_hit_buff = {
		duration = 5,
		multiplier = 1.2,
	},
	kerillian_shade_damage_reduction_on_critical_hit_buff = {
		duration = 5,
		multiplier = -0.2,
	},
	kerillian_shade_activated_ability_quick_cooldown = {
		duration = 5,
	},
	kerillian_shade_activated_ability_power_vs_unarmored = {
		multiplier = 0.2,
	},
	kerillian_shade_activated_ability_move_speed = {
		duration = 12,
		multiplier = 1.2,
	},
	kerillian_shade_ult_invis = {
		duration = 3,
	},
	kerillian_shade_ult_invis_combo_window = {
		duration = 0.3,
		extend_time = 1,
		max_stacks = 1,
	},
	kerillian_shade_power_buff = {
		multiplier = 0.15,
	},
	kerillian_shade_phasing_buff = {
		duration = 10,
	},
	kerillian_shade_movespeed_buff = {
		display_multiplier = 0.1,
		multiplier = 1.1,
	},
	kerillian_maidenguard_ability_cooldown_on_hit = {
		bonus = 0.25,
	},
	kerillian_maidenguard_ability_cooldown_on_damage_taken = {
		bonus = 0.5,
	},
	kerillian_maidenguard_passive_dodge = {
		multiplier = 1.15,
	},
	kerillian_maidenguard_passive_dodge_speed = {
		multiplier = 1.15,
	},
	kerillian_maidenguard_passive_increased_stamina = {
		bonus = 1,
	},
	kerillian_maidenguard_passive_damage_reduction = {
		multiplier = -0.2,
	},
	kerillian_maidenguard_passive_stamina_regen_aura = {
		range = 5,
	},
	kerillian_maidenguard_passive_stamina_regen_buff = {
		multiplier = 1,
	},
	kerillian_maidenguard_activated_ability = {
		duration = 0.45,
	},
	kerillian_maidenguard_reaper = {},
	kerillian_maidenguard_bloodlust = {},
	kerillian_maidenguard_conqueror = {},
	kerillian_maidenguard_power_level_on_unharmed = {
		multiplier = 0.15,
	},
	kerillian_maidenguard_power_level_on_unharmed_cooldown = {
		duration = 10,
	},
	kerillian_maidenguard_crit_chance = {
		bonus = 0.05,
	},
	kerillian_maidenguard_cooldown_on_nearby_allies_buff = {
		max_stacks = 3,
		multiplier = 0.15,
	},
	kerillian_maidenguard_power_on_dodge = {
		multiplier = 0.1,
	},
	kerillian_maidenguard_speed_on_block_buff = {
		multiplier = 0.3,
	},
	kerillian_maidenguard_power_on_block_buff = {
		multiplier = 0.1,
	},
	kerillian_maidenguard_passive_attack_speed_on_dodge_buff = {
		duration = 6,
		max_stacks = 3,
		multiplier = 0.05,
	},
	kerillian_maidenguard_improved_dodge = {
		multiplier = 1.201,
	},
	kerillian_maidenguard_improved_dodge_speed = {
		multiplier = 1.201,
	},
	kerillian_maidenguard_max_ammo = {
		multiplier = 0.4,
	},
	kerillian_maidenguard_max_health = {
		multiplier = 0.15,
	},
	kerillian_maidenguard_block_cost = {
		multiplier = -0.3,
	},
	kerillian_maidenguard_activated_ability_damage = {
		multiplier = 1,
	},
	kerillian_maidenguard_activated_ability_invis_duration = {
		duration = 2,
	},
	kerillian_maidenguard_activated_ability_crit_buff = {
		bonus = 0.05,
		duration = 15,
		max_stacks = 5,
	},
	kerillian_maidenguard_insta_ress = {
		duration = 10,
		multiplier = -20,
	},
	kerillian_maidenguard_insta_ress_buff = {
		duration = 0.5,
	},
	kerillian_maidenguard_ress_buff = {
		bonus = 0.5,
		duration = 5,
	},
	kerillian_waywatcher_ability_cooldown_on_hit = {
		bonus = 0.35,
	},
	kerillian_waywatcher_ability_cooldown_on_damage_taken = {
		bonus = 0.3,
	},
	kerillian_waywatcher_passive = {
		heal_amount = 3,
		time_between_heals = 10,
	},
	kerillian_waywatcher_passive_increased_ammunition = {
		multiplier = 1,
	},
	kerillian_waywatcher_regrowth = {},
	kerillian_waywatcher_reaper = {},
	kerillian_waywatcher_conqueror = {},
	kerillian_waywatcher_attack_speed_on_ranged_headshot_buff = {
		duration = 5,
		multiplier = 0.15,
	},
	kerillian_waywatcher_extra_arrow_melee_kill_buff = {
		bonus = 1,
		duration = 10,
	},
	kerillian_waywatcher_movement_speed_on_special_kill_buff = {
		duration = 10,
		multiplier = 1.15,
	},
	kerillian_waywatcher_improved_regen = {
		bonus = 3,
		display_multiplier = 0.5,
	},
	kerillian_waywatcher_passive_cooldown_restore = {
		display_multiplier = 0.05,
	},
	kerillian_waywatcher_activated_ability_cooldown = {
		multiplier = -0.2,
	},
	kerillian_waywatcher_projectile_ricochet = {
		bonus = 3,
	},
	kerillian_waywatcher_activated_ability_restore_ammo_on_career_skill_special_kill = {
		ammo_bonus_fraction = 0.3,
	},
	kerillian_waywatcher_activated_ability_piercing_shot = {
		multiplier = 1,
	},
}

TalentBuffTemplates = TalentBuffTemplates or {}
TalentBuffTemplates.wood_elf = {
	kerillian_shade_ability_cooldown_on_hit = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown",
				event = "on_hit",
			},
		},
	},
	kerillian_shade_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken",
				event = "on_damage_taken",
			},
		},
	},
	kerillian_shade_passive = {
		buffs = {
			{
				stat_buff = "backstab_multiplier",
			},
		},
	},
	kerillian_shade_passive_crit = {
		buffs = {
			{
				stat_buff = "critical_strike_chance",
			},
		},
	},
	kerillian_shade_passive_sfx = {
		buffs = {
			{
				buff_func = "event_hud_sfx",
				event = "on_backstab",
				sound_to_play = "Play_career_ability_kerillian_shade_backstab_small",
			},
		},
	},
	kerillian_shade_stealth_crits = {
		buffs = {
			{
				buff_func = "add_buff_local",
				buff_to_add = "kerillian_shade_stealth_crits_buff",
				event = "on_invisible",
			},
		},
	},
	kerillian_shade_stealth_crits_remover = {
		buffs = {
			{
				buff_func = "remove_buff_stack",
				event = "on_visible",
				remove_buff_func = "remove_buff_stack",
				remove_buff_stack_data = {
					{
						buff_to_remove = "kerillian_shade_stealth_crits_buff",
						num_stacks = 1,
						server_controlled = false,
					},
				},
			},
		},
	},
	kerillian_shade_stealth_crits_buff = {
		buffs = {
			{
				bonus = 1,
				icon = "kerillian_shade_perk_dagger_in_the_dark",
				max_stacks = 1,
				stat_buff = "critical_strike_chance_melee",
			},
		},
	},
	kerillian_shade_passive_backstab_killing_blow = {
		buffs = {
			{
				perks = {
					buff_perks.crit_backstab_killing_blow,
				},
			},
		},
	},
	kerillian_shade_passive_stealth_parry = {
		buffs = {
			{
				buff_func = "add_buff",
				buff_to_add = "kerillian_shade_dash_stealth",
				event = "on_timed_block",
			},
		},
	},
	kerillian_shade_dash_stealth = {
		buffs = {
			{
				buff_func = "kerillian_thorn_sister_add_buff_remove",
				buff_to_add = "kerillian_shade_dash_stealth_active",
				duration = 1.5,
				event = "on_dodge",
				icon = "kerillian_shade_perk_blur",
				max_stacks = 1,
				refresh_durations = true,
			},
		},
	},
	kerillian_shade_dash_stealth_active = {
		activation_sound = "Play_career_ability_kerillian_shade_enter_small",
		buffs = {
			{
				apply_buff_func = "on_apply_shade_dash_stealth",
				buff_func = "shade_short_stealth_on_hit",
				continuous_effect = "fx/screenspace_shade_skill_01",
				duration = 1.5,
				event = "on_hit",
				icon = "kerillian_shade_perk_blur",
				max_stacks = 1,
				proc_weight = 5,
				refresh_durations = true,
				remove_buff_func = "on_remove_shade_dash_stealth",
			},
		},
	},
	kerillian_shade_activated_ability = {
		deactivation_effect = "fx/screenspace_shade_skill_02",
		buffs = {
			{
				apply_buff_func = "apply_shade_activated_ability",
				buff_func = "shade_activated_ability_on_hit",
				can_restealth_combo = true,
				can_restealth_on_remove = true,
				continuous_effect = "fx/screenspace_shade_skill_01",
				event = "on_hit",
				icon = "passive_bonus_kerillian_shade",
				max_stacks = 1,
				name = "kerillian_shade_activated_ability",
				proc_weight = 5,
				refresh_durations = true,
				remove_buff_func = "on_shade_activated_ability_remove",
				stealth_identifier = "skill_shade",
				perks = {
					"shade_melee_boost",
				},
			},
		},
	},
	kerillian_shade_activated_ability_restealth = {
		deactivation_effect = "fx/screenspace_shade_skill_02",
		buffs = {
			{
				apply_buff_func = "apply_shade_activated_ability",
				buff_func = "shade_activated_ability_on_hit",
				can_restealth_combo = true,
				can_restealth_on_remove = false,
				continuous_effect = "fx/screenspace_shade_skill_01",
				event = "on_hit",
				icon = "passive_bonus_kerillian_shade",
				max_stacks = 1,
				name = "kerillian_shade_activated_ability_restealth",
				proc_weight = 5,
				refresh_durations = true,
				remove_buff_func = "on_shade_activated_ability_remove",
				stealth_identifier = "skill_shade_restealth",
				duration = buff_tweak_data.kerillian_shade_activated_ability.duration,
				perks = {
					"shade_melee_boost",
				},
			},
		},
	},
	kerillian_shade_regrowth = {
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
	kerillian_shade_bloodlust = {
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
	kerillian_shade_conqueror = {
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
	kerillian_shade_increased_damage_on_poisoned_or_bleeding_enemy = {
		buffs = {
			{
				stat_buff = "increased_weapon_damage_poisoned_or_bleeding",
			},
		},
	},
	kerillian_shade_increased_critical_strike_damage = {
		buffs = {
			{
				stat_buff = "critical_strike_effectiveness",
			},
		},
	},
	kerillian_shade_stacking_headshot_damage_on_headshot = {
		buffs = {
			{
				buff_func = "add_buff_on_headshot",
				buff_to_add = "kerillian_shade_stacking_headshot_damage_on_headshot_buff",
				event = "on_hit",
			},
		},
	},
	kerillian_shade_stacking_headshot_damage_on_headshot_buff = {
		buffs = {
			{
				icon = "kerillian_shade_stacking_headshot_damage_on_headshot",
				refresh_durations = true,
				stat_buff = "headshot_multiplier",
			},
		},
	},
	kerillian_shade_headshot_backstab = {
		buffs = {
			{
				buff_func = "add_buff_on_headshot",
				buff_to_add = "kerillian_shade_headshot_cooldown",
				event = "on_hit",
				allowed_attacks = {
					heavy_attack = true,
				},
			},
		},
	},
	kerillian_shade_headshot_cooldown = {
		buffs = {
			{
				duration = 3,
				icon = "kerillian_shade_stacking_headshot_damage_on_headshot",
				multiplier = 0.2,
				stat_buff = "cooldown_regen",
			},
		},
	},
	kerillian_shade_charged_backstabs = {
		buffs = {
			{
				buff_func = "kerillian_shade_buff_on_charged_backstab",
				buff_to_add = "kerillian_shade_charged_backstabs_buff",
				event = "on_hit",
			},
		},
	},
	kerillian_shade_charged_backstabs_buff = {
		buffs = {
			{
				icon = "kerillian_shade_passive_improved",
				refresh_durations = true,
				stat_buff = "backstab_multiplier",
			},
		},
	},
	kerillian_shade_passive_improved_crit_blocker = {
		buffs = {
			{
				duration = 0.1,
			},
		},
	},
	kerillian_shade_backstabs_cooldown_regeneration = {
		buffs = {
			{
				buff_func = "kerillian_shade_cooldown_regen_on_backstab_kill",
				buff_to_add = "kerillian_shade_backstabs_cooldown_regeneration_buff",
				event = "on_kill",
			},
		},
	},
	kerillian_shade_backstabs_cooldown_regeneration_buff = {
		buffs = {
			{
				icon = "kerillian_shade_passive_stealth_on_backstab_kill",
				refresh_durations = true,
				stat_buff = "cooldown_regen",
			},
		},
	},
	kerillian_shade_backstabs_free_shot_buff = {
		buffs = {
			{
				icon = "kerillian_shade_backstabs_replenishes_ammunition",
			},
		},
	},
	kerillian_shade_backstabs_replenishes_ammunition = {
		buffs = {
			{
				buff_func = "shade_backstab_ammo_gain",
				event = "on_backstab",
			},
		},
	},
	kerillian_shade_backstabs_replenishes_ammunition_cooldown = {
		buffs = {
			{},
		},
	},
	kerillian_shade_passive_stealth_on_backstab_kill = {
		buffs = {
			{
				buff_func = "kerillian_shade_stealth_on_backstab_kill",
				event = "on_kill",
			},
		},
	},
	kerillian_shade_activated_ability_short_blocker = {
		buffs = {
			{
				debuff = true,
				icon = "kerillian_shade_passive_stealth_on_backstab_kill",
				max_stacks = 1,
			},
		},
	},
	kerillian_shade_activated_ability_short = {
		deactivation_effect = "fx/screenspace_shade_skill_02",
		buffs = {
			{
				apply_buff_func = "apply_shade_activated_ability",
				buff_func = "shade_short_stealth_on_hit",
				can_restealth_combo = false,
				continuous_effect = "fx/screenspace_shade_skill_01",
				event = "on_hit",
				icon = "kerillian_shade_passive_stealth_on_backstab_kill",
				max_stacks = 1,
				name = "kerillian_shade_activated_ability_short",
				proc_weight = 5,
				refresh_durations = true,
				remove_buff_func = "on_shade_activated_ability_remove",
				stealth_identifier = "skill_shade_short",
			},
		},
	},
	kerillian_shade_movement_speed = {
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
	kerillian_shade_movement_speed_on_critical_hit = {
		buffs = {
			{
				buff_func = "add_buff",
				buff_to_add = "kerillian_shade_movement_speed_on_critical_hit_buff",
				event = "on_critical_hit",
			},
		},
	},
	kerillian_shade_movement_speed_on_critical_hit_buff = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				icon = "kerillian_shade_movement_speed_on_critical_hit",
				max_stacks = 1,
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
		},
	},
	kerillian_shade_damage_reduction_on_critical_hit = {
		buffs = {
			{
				buff_func = "add_buff",
				buff_to_add = "kerillian_shade_damage_reduction_on_critical_hit_buff",
				event = "on_critical_hit",
			},
		},
	},
	kerillian_shade_damage_reduction_on_critical_hit_buff = {
		buffs = {
			{
				icon = "kerillian_shade_damage_reduction_on_critical_hit",
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "damage_taken",
			},
		},
	},
	kerillian_shade_ult_invis = {
		deactivation_effect = "fx/screenspace_shade_skill_02",
		buffs = {
			{
				apply_buff_func = "apply_shade_activated_ability",
				buff_func = "shade_combo_stealth_on_hit",
				buff_to_add = "shade_short_stealth_on_hit",
				can_restealth_combo = false,
				continuous_effect = "fx/screenspace_shade_skill_01",
				event = "on_hit",
				icon = "kerillian_shade_activated_ability_quick_cooldown",
				max_stacks = 1,
				name = "kerillian_shade_ult_invis",
				proc_weight = 4,
				refresh_durations = true,
				remove_buff_func = "on_shade_activated_ability_remove",
				stealth_identifier = "skill_shade_short",
			},
		},
	},
	kerillian_shade_ult_invis_combo_window = {
		buffs = {
			{
				buff_func = "shade_combo_stealth_extend_on_kill",
				duration = 0.3,
				event = "on_kill_elite_special",
				extend_time = 1,
				max_stacks = 1,
				refresh_durations = true,
				remove_buff_func = "kerillian_shade_missed_combo_window",
			},
		},
	},
	kerillian_shade_ult_invis_combo_blocker = {
		buffs = {
			{
				duration = 0.1,
				max_stacks = 1,
				refresh_durations = true,
			},
		},
	},
	kerillian_shade_restealth_blocker = {
		buffs = {
			{
				debuff = true,
				duration = 0.1,
				max_stacks = 1,
				refresh_durations = true,
			},
		},
	},
	kerillian_shade_activated_ability_phasing = {
		deactivation_effect = "fx/screenspace_shade_skill_02",
		buffs = {
			{
				apply_buff_func = "apply_shade_activated_ability",
				buff_func = "shade_activated_ability_on_hit",
				can_restealth_combo = true,
				can_restealth_on_remove = true,
				continuous_effect = "fx/screenspace_shade_skill_01",
				duration = 5,
				event = "on_hit",
				icon = "passive_bonus_kerillian_shade",
				max_stacks = 1,
				name = "kerillian_shade_activated_ability_phasing",
				proc_weight = 5,
				refresh_durations = true,
				remove_buff_func = "on_shade_activated_ability_remove",
				stealth_identifier = "skill_shade",
			},
		},
	},
	kerillian_shade_phasing_buff = {
		buffs = {
			{
				apply_buff_func = "kerillian_shade_noclip_on",
				icon = "kerillian_shade_activated_ability_dash",
				max_stacks = 1,
				refresh_durations = true,
				remove_buff_func = "kerillian_shade_noclip_off",
			},
		},
	},
	kerillian_shade_movespeed_buff = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				max_stacks = 1,
				name = "kerillian_shade_movespeed_buff",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				duration = buff_tweak_data.kerillian_shade_phasing_buff.duration,
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
		},
	},
	kerillian_shade_power_buff = {
		buffs = {
			{
				max_stacks = 1,
				name = "kerillian_shade_power_buff",
				refresh_durations = true,
				stat_buff = "power_level",
				duration = buff_tweak_data.kerillian_shade_phasing_buff.duration,
			},
		},
	},
	kerillian_maidenguard_ability_cooldown_on_hit = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown",
				event = "on_hit",
			},
		},
	},
	kerillian_maidenguard_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken",
				event = "on_damage_taken",
			},
		},
	},
	kerillian_maidenguard_passive_increased_stamina = {
		buffs = {
			{
				stat_buff = "max_fatigue",
			},
		},
	},
	kerillian_maidenguard_passive_damage_reduction = {
		buffs = {
			{
				stat_buff = "damage_taken",
			},
		},
	},
	kerillian_maidenguard_passive_dodge = {
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
	kerillian_maidenguard_passive_dodge_speed = {
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
	kerillian_maidenguard_passive_stamina_regen_aura = {
		buffs = {
			{
				buff_to_add = "kerillian_maidenguard_passive_stamina_regen_buff",
				remove_buff_func = "remove_aura_buff",
				update_func = "activate_buff_on_distance",
			},
		},
	},
	kerillian_maidenguard_passive_uninterruptible_revive = {
		buffs = {
			{
				perks = {
					buff_perks.uninterruptible_revive,
				},
			},
		},
	},
	kerillian_maidenguard_passive_stamina_regen_buff = {
		buffs = {
			{
				icon = "kerillian_maidenguard_passive",
				max_stacks = 1,
				stat_buff = "fatigue_regen",
			},
		},
	},
	kerillian_maidenguard_activated_ability = {
		buffs = {
			{
				apply_buff_func = "start_maidenguard_activated_ability",
				remove_buff_func = "end_maidenguard_activated_ability",
			},
		},
	},
	kerillian_maidenguard_ress_time = {
		buffs = {
			{
				buff_func = "buff_defence_on_revived_target",
				event = "on_revived_ally",
				multiplier = -0.5,
				refresh_durations = true,
				stat_buff = "faster_revive",
				buff_to_add = {
					"kerillian_maidenguard_insta_ress_buff",
				},
			},
		},
	},
	kerillian_maidenguard_reaper = {
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
	kerillian_maidenguard_bloodlust = {
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
	kerillian_maidenguard_conqueror = {
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
	kerillian_maidenguard_power_level_on_unharmed = {
		buffs = {
			{
				buff_func = "maidenguard_reset_unharmed_buff",
				event = "on_damage_taken",
				icon = "kerillian_maidenguard_power_level_on_unharmed",
				max_stacks = 1,
				remove_on_proc = true,
				stat_buff = "power_level",
			},
		},
	},
	kerillian_maidenguard_power_level_on_unharmed_cooldown = {
		buffs = {
			{
				buff_to_add = "kerillian_maidenguard_power_level_on_unharmed",
				icon = "kerillian_maidenguard_power_level_on_unharmed",
				is_cooldown = true,
				max_stacks = 1,
				refresh_durations = true,
				remove_buff_func = "add_buff",
			},
		},
	},
	kerillian_maidenguard_crit_chance = {
		buffs = {
			{
				stat_buff = "critical_strike_chance",
			},
		},
	},
	kerillian_maidenguard_speed_on_block = {
		buffs = {
			{
				amount_to_add = 2,
				buff_func = "maidenguard_add_power_buff_on_block",
				buff_to_add = "kerillian_maidenguard_speed_on_block_dummy_buff",
				event = "on_block",
				max_stacks = 1,
				max_sub_buff_stacks = 2,
				update_func = "maidenguard_attack_speed_on_block_update",
				stat_increase_buffs = {
					"kerillian_maidenguard_speed_on_block_buff",
					"kerillian_maidenguard_power_on_block_buff",
				},
			},
		},
	},
	kerillian_maidenguard_speed_on_push = {
		buffs = {
			{
				amount_to_add = 2,
				buff_func = "maidenguard_add_power_buff_on_block",
				buff_to_add = "kerillian_maidenguard_speed_on_block_dummy_buff",
				event = "on_push",
				max_stacks = 1,
				max_sub_buff_stacks = 2,
				update_func = "maidenguard_attack_speed_on_block_update",
				stat_increase_buffs = {
					"kerillian_maidenguard_speed_on_block_buff",
					"kerillian_maidenguard_power_on_block_buff",
				},
			},
		},
	},
	kerillian_maidenguard_speed_on_block_dummy_buff = {
		buffs = {
			{
				icon = "kerillian_maidenguard_power_level_on_unharmed",
				max_stacks = 2,
			},
		},
	},
	kerillian_maidenguard_speed_on_block_buff = {
		buffs = {
			{
				max_stacks = 1,
				stat_buff = "attack_speed",
			},
		},
	},
	kerillian_maidenguard_power_on_block_buff = {
		buffs = {
			{
				max_stacks = 1,
				stat_buff = "power_level",
			},
		},
	},
	kerillian_maidenguard_power_on_blocked_attacks_remove_damage = {
		buffs = {
			{
				buff_func = "maidenguard_remove_on_block_speed_buff",
				buff_to_remove = "kerillian_maidenguard_speed_on_block_dummy_buff",
				chunk_size = 1,
				event = "on_damage_dealt",
				max_stacks = 1,
				reference_buffs = {
					"kerillian_maidenguard_speed_on_block",
					"kerillian_maidenguard_speed_on_push",
				},
			},
		},
	},
	kerillian_maidenguard_versatile_dodge = {
		buffs = {
			{
				attack_buff_to_add = "kerillian_maidenguard_power_on_dodge",
				buff_func = "maidenguard_footwork_buff",
				event = "on_dodge",
				dodge_buffs_to_add = {
					"kerillian_maidenguard_improved_dodge",
					"kerillian_maidenguard_improved_dodge_speed",
				},
			},
		},
	},
	kerillian_maidenguard_power_on_dodge = {
		buffs = {
			{
				duration = 2,
				icon = "kerillian_maidenguard_cooldown_on_nearby_allies",
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "power_level",
			},
		},
	},
	kerillian_maidenguard_cooldown_on_nearby_allies_buff = {
		buffs = {
			{
				icon = "kerillian_maidenguard_cooldown_on_nearby_allies",
				stat_buff = "cooldown_regen",
			},
		},
	},
	kerillian_maidenguard_passive_attack_speed_on_dodge = {
		buffs = {
			{
				buff_func = "add_buff",
				buff_to_add = "kerillian_maidenguard_passive_attack_speed_on_dodge_buff",
				event = "on_dodge",
			},
		},
	},
	kerillian_maidenguard_passive_attack_speed_on_dodge_buff = {
		buffs = {
			{
				icon = "kerillian_maidenguard_passive_attack_speed_on_dodge",
				refresh_durations = true,
				stat_buff = "attack_speed",
			},
		},
	},
	kerillian_maidenguard_improved_dodge = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				buff_func = "maidenguard_footwork_on_dodge_end",
				event = "on_dodge_finished",
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"distance_modifier",
				},
			},
		},
	},
	kerillian_maidenguard_improved_dodge_speed = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				buff_func = "maidenguard_footwork_on_dodge_end",
				event = "on_dodge_finished",
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"dodging",
					"speed_modifier",
				},
			},
		},
	},
	kerillian_maidenguard_passive_noclip_dodge_start = {
		buffs = {
			{
				buff_func = "set_noclip",
				event = "on_dodge",
				set_status = true,
				status_identifier = "kerillian_maidenguard_passive_noclip_dodge",
			},
		},
	},
	kerillian_maidenguard_passive_noclip_dodge_end = {
		buffs = {
			{
				buff_func = "set_noclip",
				event = "on_dodge_finished",
				set_status = false,
				status_identifier = "kerillian_maidenguard_passive_noclip_dodge",
			},
		},
	},
	kerillian_maidenguard_max_ammo = {
		buffs = {
			{
				stat_buff = "total_ammo",
			},
		},
	},
	kerillian_maidenguard_max_health = {
		buffs = {
			{
				stat_buff = "max_health_alive",
			},
		},
	},
	kerillian_maidenguard_block_cost = {
		buffs = {
			{
				stat_buff = "block_cost",
			},
		},
	},
	kerillian_maidenguard_activated_ability_invis_duration = {
		buffs = {
			{
				icon = "kerillian_maidenguard_activated_ability_invis_duration",
				max_stacks = 1,
				name = "kerillian_maidenguard_activated_ability",
				refresh_durations = true,
				remove_buff_func = "end_maidenguard_activated_ability",
			},
		},
	},
	kerillian_maidenguard_activated_ability_buff_on_enemy_hit = {
		buffs = {
			{
				buff_func = "add_buff",
				buff_to_add = "kerillian_maidenguard_activated_ability_crit_buff",
				event = "on_charge_ability_hit",
			},
		},
	},
	kerillian_maidenguard_activated_ability_crit_buff = {
		buffs = {
			{
				icon = "kerillian_maidenguard_activated_ability_buff_on_enemy_hit",
				refresh_durations = true,
				stat_buff = "critical_strike_chance",
			},
		},
	},
	kerillian_maidenguard_insta_ress = {
		buffs = {
			{
				buff_func = "buff_defence_on_revived_target",
				event = "on_revived_ally",
				refresh_durations = true,
				stat_buff = "faster_revive",
				buff_to_add = {
					"kerillian_maidenguard_insta_ress_buff",
				},
			},
		},
	},
	kerillian_maidenguard_insta_ress_buff = {
		buffs = {
			{
				heal_amount = 20,
				remove_buff_func = "add_health_on_application",
			},
		},
	},
	kerillian_maidenguard_ress_buff = {
		buffs = {
			{
				icon = "kerillian_maidenguard_crit_chance",
				stat_buff = "critical_strike_chance",
			},
		},
	},
	kerillian_waywatcher_ability_cooldown_on_hit = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown",
				event = "on_hit",
			},
		},
	},
	kerillian_waywatcher_ability_cooldown_on_damage_taken = {
		buffs = {
			{
				buff_func = "reduce_activated_ability_cooldown_on_damage_taken",
				event = "on_damage_taken",
			},
		},
	},
	kerillian_waywatcher_passive_increased_ammunition = {
		buffs = {
			{
				stat_buff = "total_ammo",
			},
		},
	},
	kerillian_waywatcher_passive = {
		buffs = {
			{
				icon = "kerillian_waywatcher_passive",
				max_stacks = 1,
				update_func = "update_kerillian_waywatcher_regen",
			},
		},
	},
	kerillian_waywatcher_passive_increased_zoom = {
		buffs = {
			{
				perks = {
					buff_perks.increased_zoom,
				},
			},
		},
	},
	kerillian_waywatcher_passive_no_damage_dropoff = {
		buffs = {
			{
				perks = {
					buff_perks.no_damage_dropoff,
				},
			},
		},
	},
	kerillian_waywatcher_regrowth = {
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
	kerillian_waywatcher_reaper = {
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
	kerillian_waywatcher_conqueror = {
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
	kerillian_waywatcher_extra_arrow_melee_kill = {
		buffs = {
			{
				buff_func = "kerillian_waywatcher_add_extra_shot_buff_on_melee_kill",
				buff_to_add = "kerillian_waywatcher_extra_arrow_melee_kill_buff",
				event = "on_kill",
			},
		},
	},
	kerillian_waywatcher_extra_arrow_melee_kill_buff = {
		buffs = {
			{
				buff_func = "kerillian_waywatcher_consume_extra_shot_buff",
				event = "on_ranged_hit",
				icon = "kerillian_waywatcher_extra_arrow_melee_kill",
				max_stacks = 1,
				refresh_durations = true,
				remove_on_proc = true,
				stat_buff = "extra_shot",
			},
		},
	},
	kerillian_waywatcher_critical_bleed = {
		buffs = {
			{
				perks = {
					buff_perks.kerillian_critical_bleed_dot,
				},
			},
		},
	},
	kerillian_waywatcher_attack_speed_on_ranged_headshot = {
		buffs = {
			{
				buff_func = "add_buff_on_ranged_headshot",
				buff_on_stacks = 5,
				buff_to_add = "kerillian_waywatcher_attack_speed_on_ranged_headshot_buff",
				event = "on_hit",
			},
		},
	},
	kerillian_waywatcher_attack_speed_on_ranged_headshot_buff = {
		buffs = {
			{
				icon = "kerillian_waywatcher_attack_speed_on_ranged_headshot",
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "attack_speed",
			},
		},
	},
	kerillian_waywatcher_movement_speed_on_special_kill = {
		buffs = {
			{
				buff_func = "add_buff",
				buff_to_add = "kerillian_waywatcher_movement_speed_on_special_kill_buff",
				event = "on_kill_elite_special",
			},
		},
	},
	kerillian_waywatcher_movement_speed_on_special_kill_buff = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				icon = "kerillian_waywatcher_movement_speed_on_special_kill",
				max_stacks = 1,
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
		},
	},
	kerillian_waywatcher_activated_ability_cooldown = {
		buffs = {
			{
				stat_buff = "activated_cooldown",
			},
		},
	},
	kerillian_waywatcher_projectile_ricochet = {
		buffs = {
			{
				max_stacks = 1,
				stat_buff = "projectile_bounces",
				perks = {
					buff_perks.add_projectile_bounces,
				},
			},
		},
	},
	kerillian_waywatcher_activated_ability_restore_ammo_on_career_skill_special_kill = {
		buffs = {
			{
				buff_func = "kerillian_waywatcher_restore_ammo_on_career_skill_special_kill",
				event = "on_kill_elite_special",
			},
		},
	},
	kerillian_waywatcher_activated_ability_piercing_shot = {
		buffs = {
			{
				buff_func = "kerillian_waywatcher_reduce_activated_ability_cooldown",
				event = "on_hit",
			},
		},
	},
}
TalentTrees = TalentTrees or {}
TalentTrees.wood_elf = {
	{
		{
			"kerillian_shade_regrowth_2",
			"kerillian_shade_bloodlust",
			"kerillian_shade_heal_share",
		},
		{
			"kerillian_shade_increased_critical_strike_damage",
			"kerillian_shade_increased_damage_on_poisoned_or_bleeding_enemy",
			"kerillian_shade_stacking_headshot_damage_on_headshot",
		},
		{
			"kerillian_shade_smiter_unbalance",
			"kerillian_shade_finesse_unbalance",
			"kerillian_shade_power_level_unbalance",
		},
		{
			"kerillian_shade_charged_backstabs",
			"kerillian_shade_backstabs_cooldown_regeneration",
			"kerillian_shade_backstabs_replenishes_ammunition",
		},
		{
			"kerillian_shade_damage_reduction_on_critical_hit",
			"kerillian_shade_movement_speed_on_critical_hit",
			"kerillian_shade_movement_speed",
		},
		{
			"kerillian_shade_activated_stealth_combo",
			"kerillian_shade_activated_ability_phasing",
			"kerillian_shade_activated_ability_restealth",
		},
	},
	{
		{
			"kerillian_maidenguard_reaper",
			"kerillian_maidenguard_bloodlust_2",
			"kerillian_maidenguard_heal_share",
		},
		{
			"kerillian_maidenguard_power_level_on_unharmed",
			"kerillian_maidenguard_crit_chance",
			"kerillian_maidenguard_speed_on_block",
		},
		{
			"kerillian_maidenguard_smiter_unbalance",
			"kerillian_maidenguard_linesman_unbalance",
			"kerillian_maidenguard_power_level_unbalance",
		},
		{
			"kerillian_maidenguard_passive_attack_speed_on_dodge",
			"kerillian_maidenguard_versatile_dodge",
			"kerillian_maidenguard_passive_noclip_dodge",
		},
		{
			"kerillian_maidenguard_max_health",
			"kerillian_maidenguard_block_cost",
			"kerillian_maidenguard_max_ammo",
		},
		{
			"kerillian_maidenguard_activated_ability_invis_duration",
			"kerillian_maidenguard_activated_ability_damage",
			"kerillian_maidenguard_activated_ability_buff_on_enemy_hit",
		},
	},
	{
		{
			"kerillian_waywatcher_regrowth_2",
			"kerillian_waywatcher_reaper",
			"kerillian_waywatcher_heal_share",
		},
		{
			"kerillian_waywatcher_extra_arrow_melee_kill",
			"kerillian_waywatcher_critical_bleed",
			"kerillian_waywatcher_attack_speed_on_ranged_headshot",
		},
		{
			"kerillian_waystalker_linesman_unbalance",
			"kerillian_waystalker_finesse_unbalance",
			"kerillian_waystalker_power_level_unbalance",
		},
		{
			"kerillian_waywatcher_improved_regen",
			"kerillian_waywatcher_passive_cooldown_restore",
			"kerillian_waywatcher_group_regen",
		},
		{
			"kerillian_waywatcher_movement_speed_on_special_kill",
			"kerillian_waywatcher_projectile_ricochet",
			"kerillian_waywatcher_activated_ability_cooldown",
		},
		{
			"kerillian_waywatcher_activated_ability_piercing_shot",
			"kerillian_waywatcher_activated_ability_additional_projectile",
			"kerillian_waywatcher_activated_ability_restore_ammo_on_career_skill_special_kill",
		},
	},
}
Talents.wood_elf = {
	{
		buffer = "both",
		description = "regrowth_desc_3",
		icon = "kerillian_shade_regrowth",
		name = "kerillian_shade_regrowth_2",
		num_ranks = 1,
		description_values = {
			{
				value = BuffUtils.get_buff_template("regrowth", "adventure").buffs[1].bonus,
			},
		},
		buffs = {
			"kerillian_shade_regrowth",
		},
	},
	{
		buffer = "server",
		description = "bloodlust_desc_3",
		icon = "kerillian_shade_bloodlust",
		name = "kerillian_shade_bloodlust",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("bloodlust", "adventure").buffs[1].multiplier,
			},
		},
		buffs = {
			"kerillian_shade_bloodlust",
		},
	},
	{
		buffer = "server",
		description = "conqueror_desc_3",
		icon = "kerillian_shade_conqueror",
		name = "kerillian_shade_heal_share",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("conqueror", "adventure").buffs[1].multiplier,
			},
		},
		buffs = {
			"kerillian_shade_conqueror",
		},
	},
	{
		buffer = "server",
		description = "kerillian_shade_increased_damage_on_poisoned_or_bleeding_enemy_desc",
		icon = "kerillian_shade_increased_damage_on_poisoned_or_bleeding_enemy",
		name = "kerillian_shade_increased_damage_on_poisoned_or_bleeding_enemy",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_shade_increased_damage_on_poisoned_or_bleeding_enemy.multiplier,
			},
		},
		buffs = {
			"kerillian_shade_increased_damage_on_poisoned_or_bleeding_enemy",
		},
	},
	{
		buffer = "server",
		description = "kerillian_shade_increased_critical_strike_damage_desc",
		icon = "kerillian_shade_increased_critical_strike_damage",
		name = "kerillian_shade_increased_critical_strike_damage",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_shade_increased_critical_strike_damage.multiplier,
			},
		},
		buffs = {
			"kerillian_shade_increased_critical_strike_damage",
		},
	},
	{
		buffer = "server",
		description = "kerillian_shade_stacking_headshot_damage_on_headshot_desc",
		icon = "kerillian_shade_stacking_headshot_damage_on_headshot",
		name = "kerillian_shade_stacking_headshot_damage_on_headshot",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_shade_stacking_headshot_damage_on_headshot_buff.multiplier,
			},
			{
				value = buff_tweak_data.kerillian_shade_stacking_headshot_damage_on_headshot_buff.duration,
			},
			{
				value = buff_tweak_data.kerillian_shade_stacking_headshot_damage_on_headshot_buff.max_stacks,
			},
		},
		buffs = {
			"kerillian_shade_stacking_headshot_damage_on_headshot",
		},
	},
	{
		buffer = "both",
		description = "kerillian_shade_charged_backstabs_desc",
		icon = "kerillian_shade_passive_improved",
		name = "kerillian_shade_charged_backstabs",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_shade_charged_backstabs_buff.bonus,
			},
			{
				value = buff_tweak_data.kerillian_shade_charged_backstabs_buff.duration,
			},
			{
				value = buff_tweak_data.kerillian_shade_charged_backstabs_buff.max_stacks,
			},
		},
		buffs = {
			"kerillian_shade_charged_backstabs",
		},
	},
	{
		description = "kerillian_shade_backstabs_cooldown_regeneration_desc",
		icon = "kerillian_shade_passive_stealth_on_backstab_kill",
		name = "kerillian_shade_backstabs_cooldown_regeneration",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.kerillian_shade_backstabs_cooldown_regeneration_buff.duration,
			},
		},
		buffs = {
			"kerillian_shade_backstabs_cooldown_regeneration",
		},
	},
	{
		description = "kerillian_shade_backstabs_replenishes_ammunition_desc_2",
		icon = "kerillian_shade_backstabs_replenishes_ammunition",
		name = "kerillian_shade_backstabs_replenishes_ammunition",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.kerillian_shade_backstabs_replenishes_ammunition.bonus,
			},
			{
				value = buff_tweak_data.kerillian_shade_backstabs_replenishes_ammunition_cooldown.duration,
			},
		},
		buffs = {
			"kerillian_shade_backstabs_replenishes_ammunition",
		},
	},
	{
		description = "kerillian_shade_movement_speed_desc",
		icon = "kerillian_shade_movement_speed",
		name = "kerillian_shade_movement_speed",
		num_ranks = 1,
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.kerillian_shade_movement_speed.multiplier,
			},
		},
		buffs = {
			"kerillian_shade_movement_speed",
		},
	},
	{
		description = "kerillian_shade_movement_speed_on_critical_hit_desc",
		icon = "kerillian_shade_movement_speed_on_critical_hit",
		name = "kerillian_shade_movement_speed_on_critical_hit",
		num_ranks = 1,
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.kerillian_shade_movement_speed_on_critical_hit_buff.multiplier,
			},
			{
				value = buff_tweak_data.kerillian_shade_movement_speed_on_critical_hit_buff.duration,
			},
		},
		buffs = {
			"kerillian_shade_movement_speed_on_critical_hit",
		},
	},
	{
		buffer = "server",
		description = "kerillian_shade_damage_reduction_on_critical_hit_desc",
		icon = "kerillian_shade_damage_reduction_on_critical_hit",
		name = "kerillian_shade_damage_reduction_on_critical_hit",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_shade_damage_reduction_on_critical_hit_buff.multiplier,
			},
			{
				value = buff_tweak_data.kerillian_shade_damage_reduction_on_critical_hit_buff.duration,
			},
		},
		buffs = {
			"kerillian_shade_damage_reduction_on_critical_hit",
		},
	},
	{
		buffer = "both",
		description = "kerillian_shade_activated_stealth_combo_desc",
		icon = "kerillian_shade_activated_ability_quick_cooldown",
		name = "kerillian_shade_activated_stealth_combo",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.kerillian_shade_ult_invis.duration,
			},
			{
				value = buff_tweak_data.kerillian_shade_ult_invis_combo_window.extend_time,
			},
		},
		buffs = {},
	},
	{
		description = "kerillian_shade_activated_ability_phasing_desc",
		icon = "kerillian_shade_activated_ability_dash",
		name = "kerillian_shade_activated_ability_phasing",
		num_ranks = 1,
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.kerillian_shade_movespeed_buff.multiplier,
			},
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_shade_power_buff.multiplier,
			},
			{
				value = buff_tweak_data.kerillian_shade_phasing_buff.duration,
			},
		},
		buffs = {},
	},
	{
		description = "kerillian_shade_activated_ability_restealth_desc_3",
		icon = "kerillian_shade_activated_ability_restealth",
		name = "kerillian_shade_activated_ability_restealth",
		num_ranks = 1,
		description_values = {},
		buffs = {},
	},
	{
		buffer = "server",
		description = "smiter_unbalance_desc",
		icon = "kerillian_shade_smiter_unbalance",
		name = "kerillian_shade_smiter_unbalance",
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
		description = "finesse_unbalance_desc",
		icon = "kerillian_shade_ninja_unbalance",
		name = "kerillian_shade_finesse_unbalance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("finesse_unbalance", "adventure").buffs[1].display_multiplier,
			},
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("finesse_unbalance", "adventure").buffs[1].max_display_multiplier,
			},
		},
		buffs = {
			"finesse_unbalance",
		},
	},
	{
		buffer = "server",
		description = "power_level_unbalance_desc",
		icon = "kerillian_shade_power_level_unbalance",
		name = "kerillian_shade_power_level_unbalance",
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
		icon = "kerillian_maidenguard_regrowth",
		name = "kerillian_maidenguard_reaper",
		num_ranks = 1,
		description_values = {
			{
				value = BuffUtils.get_buff_template("reaper", "adventure").buffs[1].max_targets,
			},
		},
		buffs = {
			"kerillian_maidenguard_reaper",
		},
	},
	{
		buffer = "server",
		description = "bloodlust_desc_3",
		icon = "kerillian_maidenguard_bloodlust",
		name = "kerillian_maidenguard_bloodlust_2",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("bloodlust", "adventure").buffs[1].multiplier,
			},
		},
		buffs = {
			"kerillian_maidenguard_bloodlust",
		},
	},
	{
		buffer = "server",
		description = "conqueror_desc_3",
		icon = "kerillian_maidenguard_conqueror",
		name = "kerillian_maidenguard_heal_share",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("conqueror", "adventure").buffs[1].multiplier,
			},
		},
		buffs = {
			"kerillian_maidenguard_conqueror",
		},
	},
	{
		buffer = "both",
		description = "kerillian_maidenguard_power_level_on_unharmed_desc",
		icon = "kerillian_maidenguard_power_level_on_unharmed",
		name = "kerillian_maidenguard_power_level_on_unharmed",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.kerillian_maidenguard_power_level_on_unharmed_cooldown.duration,
			},
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_maidenguard_power_level_on_unharmed.multiplier,
			},
		},
		buffs = {
			"kerillian_maidenguard_power_level_on_unharmed",
		},
	},
	{
		buffer = "client",
		description = "kerillian_maidenguard_crit_chance_desc",
		icon = "kerillian_maidenguard_damage_reduction_on_last_standing",
		name = "kerillian_maidenguard_crit_chance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_maidenguard_crit_chance.bonus,
			},
		},
		buffs = {
			"kerillian_maidenguard_crit_chance",
		},
	},
	{
		buffer = "both",
		description = "kerillian_maidenguard_versatile_dodge_desc",
		icon = "kerillian_maidenguard_cooldown_on_nearby_allies",
		name = "kerillian_maidenguard_versatile_dodge",
		num_ranks = 1,
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.kerillian_maidenguard_improved_dodge.multiplier,
			},
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_maidenguard_power_on_dodge.multiplier,
			},
		},
		buffs = {
			"kerillian_maidenguard_versatile_dodge",
		},
	},
	{
		description = "kerillian_maidenguard_passive_attack_speed_on_dodge_desc",
		icon = "kerillian_maidenguard_passive_attack_speed_on_dodge",
		name = "kerillian_maidenguard_passive_attack_speed_on_dodge",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_maidenguard_passive_attack_speed_on_dodge_buff.multiplier,
			},
			{
				value = buff_tweak_data.kerillian_maidenguard_passive_attack_speed_on_dodge_buff.duration,
			},
			{
				value = buff_tweak_data.kerillian_maidenguard_passive_attack_speed_on_dodge_buff.max_stacks,
			},
		},
		buffs = {
			"kerillian_maidenguard_passive_attack_speed_on_dodge",
		},
	},
	{
		buffer = "both",
		description = "kerillian_maidenguard_speed_on_block_desc",
		icon = "kerillian_maidenguard_improved_dodge",
		name = "kerillian_maidenguard_speed_on_block",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_maidenguard_speed_on_block_buff.multiplier,
			},
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_maidenguard_power_on_block_buff.multiplier,
			},
		},
		buffs = {
			"kerillian_maidenguard_speed_on_block",
			"kerillian_maidenguard_speed_on_push",
			"kerillian_maidenguard_power_on_blocked_attacks_remove_damage",
		},
	},
	{
		description = "kerillian_maidenguard_passive_noclip_dodge_desc",
		icon = "kerillian_maidenguard_passive_noclip_dodge",
		name = "kerillian_maidenguard_passive_noclip_dodge",
		num_ranks = 1,
		description_values = {},
		buffs = {
			"kerillian_maidenguard_passive_noclip_dodge_start",
			"kerillian_maidenguard_passive_noclip_dodge_end",
		},
	},
	{
		description = "kerillian_maidenguard_max_ammo_desc",
		icon = "kerillian_maidenguard_max_ammo",
		name = "kerillian_maidenguard_max_ammo",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_maidenguard_max_ammo.multiplier,
			},
		},
		buffs = {
			"kerillian_maidenguard_max_ammo",
		},
	},
	{
		buffer = "server",
		description = "kerillian_maidenguard_max_health_desc",
		icon = "kerillian_maidenguard_max_stamina",
		name = "kerillian_maidenguard_max_health",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_maidenguard_max_health.multiplier,
			},
		},
		buffs = {
			"kerillian_maidenguard_max_health",
		},
	},
	{
		description = "kerillian_maidenguard_block_cost_desc",
		icon = "kerillian_maidenguard_block_cost",
		name = "kerillian_maidenguard_block_cost",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_maidenguard_block_cost.multiplier,
			},
		},
		buffs = {
			"kerillian_maidenguard_block_cost",
		},
	},
	{
		description = "kerillian_maidenguard_activated_ability_invis_duration_desc",
		icon = "kerillian_maidenguard_activated_ability_invis_duration",
		name = "kerillian_maidenguard_activated_ability_invis_duration",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.kerillian_maidenguard_activated_ability_invis_duration.duration,
			},
		},
		buffs = {},
	},
	{
		buffer = "both",
		description = "kerillian_maidenguard_activated_ability_damage_desc_2",
		icon = "kerillian_maidenguard_activated_ability_damage",
		name = "kerillian_maidenguard_activated_ability_damage",
		num_ranks = 1,
		description_values = {},
		buffs = {},
	},
	{
		buffer = "both",
		description = "kerillian_maidenguard_activated_ability_buff_on_enemy_hit_desc",
		icon = "kerillian_maidenguard_activated_ability_buff_on_enemy_hit",
		name = "kerillian_maidenguard_activated_ability_buff_on_enemy_hit",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_maidenguard_activated_ability_crit_buff.bonus,
			},
			{
				value = buff_tweak_data.kerillian_maidenguard_activated_ability_crit_buff.duration,
			},
			{
				value = buff_tweak_data.kerillian_maidenguard_activated_ability_crit_buff.max_stacks,
			},
		},
		buffs = {
			"kerillian_maidenguard_activated_ability_buff_on_enemy_hit",
		},
	},
	{
		buffer = "server",
		description = "smiter_unbalance_desc",
		icon = "kerillian_maidenguard_smiter_unbalance",
		name = "kerillian_maidenguard_smiter_unbalance",
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
		icon = "kerillian_maidenguard_linesman_unbalance",
		name = "kerillian_maidenguard_linesman_unbalance",
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
		icon = "kerillian_maidenguard_power_level_unbalance",
		name = "kerillian_maidenguard_power_level_unbalance",
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
		buffer = "both",
		description = "regrowth_desc_3",
		icon = "kerillian_waywatcher_regrowth",
		name = "kerillian_waywatcher_regrowth_2",
		num_ranks = 1,
		description_values = {
			{
				value = BuffUtils.get_buff_template("regrowth", "adventure").buffs[1].bonus,
			},
		},
		buffs = {
			"kerillian_waywatcher_regrowth",
		},
	},
	{
		buffer = "server",
		description = "reaper_desc",
		icon = "kerillian_waywatcher_bloodlust",
		name = "kerillian_waywatcher_reaper",
		num_ranks = 1,
		description_values = {
			{
				value = BuffUtils.get_buff_template("reaper", "adventure").buffs[1].max_targets,
			},
		},
		buffs = {
			"kerillian_waywatcher_reaper",
		},
	},
	{
		buffer = "server",
		description = "conqueror_desc_3",
		icon = "kerillian_waywatcher_conqueror",
		name = "kerillian_waywatcher_heal_share",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("conqueror", "adventure").buffs[1].multiplier,
			},
		},
		buffs = {
			"kerillian_waywatcher_conqueror",
		},
	},
	{
		description = "kerillian_waywatcher_extra_arrow_melee_kill_desc",
		icon = "kerillian_waywatcher_extra_arrow_melee_kill",
		name = "kerillian_waywatcher_extra_arrow_melee_kill",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.kerillian_waywatcher_extra_arrow_melee_kill_buff.duration,
			},
		},
		buffs = {
			"kerillian_waywatcher_extra_arrow_melee_kill",
		},
	},
	{
		buffer = "server",
		description = "kerillian_waywatcher_critical_bleed_desc",
		icon = "kerillian_waywatcher_critical_bleed",
		name = "kerillian_waywatcher_critical_bleed",
		num_ranks = 1,
		description_values = {},
		buffs = {
			"kerillian_waywatcher_critical_bleed",
		},
	},
	{
		description = "kerillian_waywatcher_attack_speed_on_ranged_headshot_desc",
		icon = "kerillian_waywatcher_attack_speed_on_ranged_headshot",
		name = "kerillian_waywatcher_attack_speed_on_ranged_headshot",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_waywatcher_attack_speed_on_ranged_headshot_buff.multiplier,
			},
			{
				value = buff_tweak_data.kerillian_waywatcher_attack_speed_on_ranged_headshot_buff.duration,
			},
		},
		buffs = {
			"kerillian_waywatcher_attack_speed_on_ranged_headshot",
		},
	},
	{
		description = "kerillian_waywatcher_improved_regen_desc_2",
		icon = "kerillian_waywatcher_improved_regen",
		name = "kerillian_waywatcher_improved_regen",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_waywatcher_improved_regen.display_multiplier,
			},
		},
		buffs = {},
	},
	{
		description = "kerillian_waywatcher_group_regen_desc_2",
		icon = "kerillian_waywatcher_group_regen",
		name = "kerillian_waywatcher_group_regen",
		num_ranks = 1,
		buffs = {},
	},
	{
		description = "kerillian_waywatcher_passive_cooldown_restore_desc",
		icon = "kerillian_waywatcher_passive_cooldown_restore",
		name = "kerillian_waywatcher_passive_cooldown_restore",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_waywatcher_passive_cooldown_restore.display_multiplier,
			},
		},
		buffs = {},
	},
	{
		description = "kerillian_waywatcher_movement_speed_on_special_kill_desc",
		icon = "kerillian_waywatcher_movement_speed_on_special_kill",
		name = "kerillian_waywatcher_movement_speed_on_special_kill",
		num_ranks = 1,
		description_values = {
			{
				value_type = "baked_percent",
				value = buff_tweak_data.kerillian_waywatcher_movement_speed_on_special_kill_buff.multiplier,
			},
			{
				value = buff_tweak_data.kerillian_waywatcher_movement_speed_on_special_kill_buff.duration,
			},
		},
		buffs = {
			"kerillian_waywatcher_movement_speed_on_special_kill",
		},
	},
	{
		description = "kerillian_waywatcher_activated_ability_cooldown_desc",
		icon = "kerillian_waywatcher_activated_ability_cooldown",
		name = "kerillian_waywatcher_activated_ability_cooldown",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_waywatcher_activated_ability_cooldown.multiplier,
			},
		},
		buffs = {
			"kerillian_waywatcher_activated_ability_cooldown",
		},
	},
	{
		buffer = "all",
		description = "kerillian_waywatcher_projectile_ricochet_desc",
		icon = "kerillian_waywatcher_projectile_ricochet",
		name = "kerillian_waywatcher_projectile_ricochet",
		num_ranks = 1,
		description_values = {
			{
				value = buff_tweak_data.kerillian_waywatcher_projectile_ricochet.bonus,
			},
		},
		buffs = {
			"kerillian_waywatcher_projectile_ricochet",
		},
	},
	{
		description = "kerillian_waywatcher_activated_ability_restore_ammo_on_career_skill_special_kill_desc",
		icon = "kerillian_waywatcher_activated_ability_restore_ammo_on_career_skill_special_kill",
		name = "kerillian_waywatcher_activated_ability_restore_ammo_on_career_skill_special_kill",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_waywatcher_activated_ability_restore_ammo_on_career_skill_special_kill.ammo_bonus_fraction,
			},
		},
		buffs = {
			"kerillian_waywatcher_activated_ability_restore_ammo_on_career_skill_special_kill",
		},
	},
	{
		description = "kerillian_waywatcher_activated_ability_additional_projectile_desc",
		icon = "kerillian_waywatcher_activated_ability_additional_projectile",
		name = "kerillian_waywatcher_activated_ability_additional_projectile",
		num_ranks = 1,
		description_values = {},
		buffs = {},
	},
	{
		description = "kerillian_waywatcher_activated_ability_piercing_shot_desc",
		icon = "kerillian_waywatcher_activated_ability_piercing_shot",
		name = "kerillian_waywatcher_activated_ability_piercing_shot",
		num_ranks = 1,
		talent_career_skill_index = 2,
		description_values = {
			{
				value_type = "percent",
				value = buff_tweak_data.kerillian_waywatcher_activated_ability_piercing_shot.multiplier,
			},
		},
		buffs = {
			"kerillian_waywatcher_activated_ability_piercing_shot",
		},
	},
	{
		buffer = "server",
		description = "linesman_unbalance_desc",
		icon = "kerillian_waystalker_linesman_unbalance",
		name = "kerillian_waystalker_linesman_unbalance",
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
		description = "finesse_unbalance_desc",
		icon = "kerillian_waystalker_ninja_unbalance",
		name = "kerillian_waystalker_finesse_unbalance",
		num_ranks = 1,
		description_values = {
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("finesse_unbalance", "adventure").buffs[1].display_multiplier,
			},
			{
				value_type = "percent",
				value = BuffUtils.get_buff_template("finesse_unbalance", "adventure").buffs[1].max_display_multiplier,
			},
		},
		buffs = {
			"finesse_unbalance",
		},
	},
	{
		buffer = "server",
		description = "power_level_unbalance_desc",
		icon = "kerillian_waystalker_power_level_unbalance",
		name = "kerillian_waystalker_power_level_unbalance",
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
		description = "kerillian_placeholder",
		name = "kerillian_placeholder",
	},
}

BuffUtils.copy_talent_buff_names(TalentBuffTemplates.wood_elf)
BuffUtils.apply_buff_tweak_data(TalentBuffTemplates.wood_elf, buff_tweak_data)

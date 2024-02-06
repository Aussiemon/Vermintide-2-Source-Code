-- chunkname: @scripts/unit_extensions/default_player_unit/buffs/talent_buff_templates.lua

OldTalentBuffTemplates = {
	increased_max_alive_health = {
		buffs = {
			{
				name = "increased_max_alive_health",
				stat_buff = "max_health_alive",
			},
		},
	},
	increased_healing_received = {
		buffs = {
			{
				name = "increased_healing_received",
				stat_buff = "healing_received",
			},
		},
	},
	increased_attack_speed = {
		buffs = {
			{
				max_stacks = 1,
				name = "increased_attack_speed",
				refresh_durations = true,
				stat_buff = "attack_speed",
			},
		},
	},
	increased_critical_hit_chance = {
		buffs = {
			{
				max_stacks = 1,
				name = "increased_critical_hit_chance",
				refresh_durations = true,
				stat_buff = "critical_strike_chance",
			},
		},
	},
	reduced_damage_taken = {
		buffs = {
			{
				name = "reduced_damage_taken",
				stat_buff = "damage_taken",
			},
		},
	},
	increased_damage = {
		buffs = {
			{
				name = "increased_damage",
				stat_buff = "increased_weapon_damage",
			},
		},
	},
	increased_max_fatigue = {
		buffs = {
			{
				name = "increased_max_fatigue",
				stat_buff = "max_fatigue",
			},
		},
	},
	increased_damage_melee = {
		buffs = {
			{
				name = "increased_damage_melee",
				stat_buff = "increased_weapon_damage_melee",
			},
		},
	},
	increased_movement_speed_from_proc = {
		buffs = {
			{
				apply_buff_func = "apply_movement_buff",
				icon = "ranged_movespeed_on_damage_taken",
				max_stacks = 1,
				name = "movement",
				refresh_durations = true,
				remove_buff_func = "remove_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed",
				},
			},
		},
	},
	stamina_regen = {
		buffs = {
			{
				duration = 2,
				max_stacks = 1,
				multiplier = 0.4,
				name = "stamina_regen",
				refresh_durations = true,
				stat_buff = "fatigue_regen",
			},
		},
	},
}

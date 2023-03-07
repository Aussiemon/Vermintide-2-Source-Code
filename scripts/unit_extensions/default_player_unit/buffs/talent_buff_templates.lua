OldTalentBuffTemplates = {
	increased_max_alive_health = {
		buffs = {
			{
				stat_buff = "max_health_alive",
				name = "increased_max_alive_health"
			}
		}
	},
	increased_healing_received = {
		buffs = {
			{
				stat_buff = "healing_received",
				name = "increased_healing_received"
			}
		}
	},
	increased_attack_speed = {
		buffs = {
			{
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "attack_speed",
				name = "increased_attack_speed"
			}
		}
	},
	increased_critical_hit_chance = {
		buffs = {
			{
				max_stacks = 1,
				refresh_durations = true,
				stat_buff = "critical_strike_chance",
				name = "increased_critical_hit_chance"
			}
		}
	},
	reduced_damage_taken = {
		buffs = {
			{
				stat_buff = "damage_taken",
				name = "reduced_damage_taken"
			}
		}
	},
	increased_damage = {
		buffs = {
			{
				stat_buff = "increased_weapon_damage",
				name = "increased_damage"
			}
		}
	},
	increased_max_fatigue = {
		buffs = {
			{
				stat_buff = "max_fatigue",
				name = "increased_max_fatigue"
			}
		}
	},
	increased_damage_melee = {
		buffs = {
			{
				stat_buff = "increased_weapon_damage_melee",
				name = "increased_damage_melee"
			}
		}
	},
	increased_movement_speed_from_proc = {
		buffs = {
			{
				icon = "ranged_movespeed_on_damage_taken",
				name = "movement",
				remove_buff_func = "remove_movement_buff",
				max_stacks = 1,
				refresh_durations = true,
				apply_buff_func = "apply_movement_buff",
				path_to_movement_setting_to_modify = {
					"move_speed"
				}
			}
		}
	},
	stamina_regen = {
		buffs = {
			{
				name = "stamina_regen",
				multiplier = 0.4,
				stat_buff = "fatigue_regen",
				refresh_durations = true,
				max_stacks = 1,
				duration = 2
			}
		}
	}
}

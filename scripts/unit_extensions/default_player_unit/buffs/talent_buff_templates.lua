OldTalentBuffTemplates = {
	increased_max_alive_health = {
		buffs = {
			{
				name = "increased_max_alive_health",
				stat_buff = StatBuffIndex.MAX_HEALTH_ALIVE
			}
		}
	},
	increased_healing_received = {
		buffs = {
			{
				name = "increased_healing_received",
				stat_buff = StatBuffIndex.HEALING_RECEIVED
			}
		}
	},
	increased_attack_speed = {
		buffs = {
			{
				max_stacks = 1,
				refresh_durations = true,
				name = "increased_attack_speed",
				stat_buff = StatBuffIndex.ATTACK_SPEED
			}
		}
	},
	increased_critical_hit_chance = {
		buffs = {
			{
				max_stacks = 1,
				refresh_durations = true,
				name = "increased_critical_hit_chance",
				stat_buff = StatBuffIndex.CRITICAL_STRIKE_CHANCE
			}
		}
	},
	reduced_damage_taken = {
		buffs = {
			{
				name = "reduced_damage_taken",
				stat_buff = StatBuffIndex.DAMAGE_TAKEN
			}
		}
	},
	increased_damage = {
		buffs = {
			{
				name = "increased_damage",
				stat_buff = StatBuffIndex.INCREASED_WEAPON_DAMAGE
			}
		}
	},
	increased_max_fatigue = {
		buffs = {
			{
				name = "increased_max_fatigue",
				stat_buff = StatBuffIndex.MAX_FATIGUE
			}
		}
	},
	increased_damage_melee = {
		buffs = {
			{
				name = "increased_damage_melee",
				stat_buff = StatBuffIndex.INCREASED_WEAPON_DAMAGE_MELEE
			}
		}
	},
	increased_movement_speed_from_proc = {
		buffs = {
			{
				icon = "trinket_increased_movement_speed_tier1",
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
				refresh_durations = true,
				multiplier = 0.4,
				max_stacks = 1,
				duration = 2,
				stat_buff = StatBuffIndex.FATIGUE_REGEN
			}
		}
	}
}

return 

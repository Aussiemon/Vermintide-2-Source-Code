HeroStatisticsTemplate = {
	{
		type = "empty"
	},
	{
		type = "title",
		display_name = Localize("tooltip_hero_stats_base_stats")
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_health"),
		description_name = Localize("tooltip_hero_stats_health_description"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local health_extension = ScriptUnit.has_extension(player_unit, "health_system")
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local health = health_extension:get_max_health()
			local modified_health = buff_extension:apply_buffs_to_value(100, StatBuffIndex.MAX_HEALTH)
			local modifier = (modified_health - 100) / 100 * 100
			local value = health
			local presentation_text = tostring(value) .. "(" .. tostring(modifier) .. "%" .. ")"

			return presentation_text
		end,
		generate_value_new = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local health_extension = ScriptUnit.has_extension(player_unit, "health_system")
			local health = health_extension:get_max_health()

			return health
		end,
		generate_description = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local modified_health = buff_extension:apply_buffs_to_value(100, StatBuffIndex.MAX_HEALTH)
			local modifier = (modified_health - 100) / 100 * 100
			local desc_key = "tooltip_hero_stats_health_description"
			local description_text = string.format(Localize(desc_key), modifier)

			return description_text
		end
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_movement_speed"),
		description_name = Localize("tooltip_hero_stats_movement_speed_description"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local movement_settings = PlayerUnitMovementSettings.get_movement_settings_table(player_unit)
			local move_speed = movement_settings.move_speed
			local move_speed_stat = move_speed / 4 * 100
			local move_speed_rounded = math.round(move_speed)
			local value = math.round(move_speed_stat)
			local presentation_text = tostring(move_speed_rounded) .. "(" .. tostring(value) .. "%" .. ")"

			return presentation_text
		end
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_respawn_speed"),
		description_name = Localize("tooltip_hero_stats_respawn_speed_description"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_respawn_time = 30
			local respawn_time = buff_extension:apply_buffs_to_value(base_respawn_time, StatBuffIndex.FASTER_RESPAWN)
			local modified_respawn_time = (base_respawn_time - respawn_time) / base_respawn_time * 100
			local value = respawn_time
			local presentation_text = tostring(value) .. "(" .. tostring(modified_respawn_time) .. "%" .. ")"

			return presentation_text
		end
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_ability_cooldown"),
		description_name = Localize("tooltip_hero_stats_ability_cooldown_description"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local career_extension = ScriptUnit.has_extension(player_unit, "career_system")
			local base_cooldown = career_extension:get_max_ability_cooldown()
			local modified_cooldown = buff_extension:apply_buffs_to_value(base_cooldown, StatBuffIndex.ACTIVATED_COOLDOWN)
			local cooldown = (modified_cooldown - base_cooldown) / base_cooldown * 100
			local value = math.round(modified_cooldown)
			local presentation_text = tostring(value) .. "(" .. tostring(cooldown) .. "%" .. ")"

			return presentation_text
		end
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_revive_speed"),
		description_name = Localize("tooltip_hero_stats_revive_speed_description"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local duration = 2
			local modified_duration = buff_extension:apply_buffs_to_value(duration, StatBuffIndex.FASTER_REVIVE)
			local changed_value = (modified_duration - duration) / duration * 100
			local value = modified_duration
			local presentation_text = tostring(value) .. "(" .. tostring(changed_value) .. "%" .. ")"

			return presentation_text
		end
	},
	{
		type = "empty"
	},
	{
		type = "title",
		display_name = Localize("tooltip_hero_stats_offensive_stats")
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_attack_speed"),
		description_name = Localize("tooltip_hero_stats_attack_speed_description"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_attack_speed = 100
			local buffed_attack_speed = buff_extension:apply_buffs_to_value(base_attack_speed, StatBuffIndex.ATTACK_SPEED)
			local value = math.round(buffed_attack_speed)
			local presentation_text = tostring(value) .. "%"

			return presentation_text
		end
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_critical_strike_chance"),
		description_name = Localize("tooltip_hero_stats_critical_strike_chance_description"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local career_extension = ScriptUnit.has_extension(player_unit, "career_system")
			local career_name = career_extension:career_name()
			local career_settings = CareerSettings[career_name]
			local career_attributes = career_settings.attributes
			local base_critical_strike_chance = career_attributes.base_critical_strike_chance
			local buffed_critical_strike_chance = buff_extension:apply_buffs_to_value(base_critical_strike_chance, StatBuffIndex.CRITICAL_STRIKE_CHANCE)
			local normalized_critical_strike_chance = math.round(buffed_critical_strike_chance * 100)
			local value = normalized_critical_strike_chance
			local presentation_text = tostring(value) .. "%"

			return presentation_text
		end
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_critical_strike_boost"),
		description_name = Localize("tooltip_hero_stats_critical_strike_boost_description"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_critical_strike_boost = 100
			local critical_strike_boost = buff_extension:apply_buffs_to_value(base_critical_strike_boost, StatBuffIndex.CRITICAL_STRIKE_EFFECTIVENESS)
			local value = critical_strike_boost
			local presentation_text = tostring(value) .. "%"

			return presentation_text
		end
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_headshot_damage"),
		description_name = Localize("tooltip_hero_stats_headshot_damage_description"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_headshot_damage = 100
			local headshot_damage = buff_extension:apply_buffs_to_value(base_headshot_damage, StatBuffIndex.HEADSHOT_MULTIPLIER)
			local value = headshot_damage
			local presentation_text = tostring(value) .. "%"

			return presentation_text
		end
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_power_increase"),
		description_name = Localize("tooltip_hero_stats_power_increase_description"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_power_level = 100
			local buffed_power_level = buff_extension:apply_buffs_to_value(base_power_level, StatBuffIndex.POWER_LEVEL)
			local power_level = buffed_power_level - base_power_level
			local value = math.round(power_level)
			local presentation_text = tostring(value) .. "%"

			return presentation_text
		end
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_power_vs_skaven"),
		description_name = Localize("tooltip_hero_stats_power_vs_skaven_description"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_power_level = 100
			local buffed_power_level = buff_extension:apply_buffs_to_value(base_power_level, StatBuffIndex.POWER_LEVEL_SKAVEN)
			local power_level = buffed_power_level - base_power_level
			local value = math.round(power_level)
			local presentation_text = tostring(value) .. "%"

			return presentation_text
		end
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_power_vs_chaos"),
		description_name = Localize("tooltip_hero_stats_power_vs_chaos_description"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_power_level = 100
			local buffed_power_level = buff_extension:apply_buffs_to_value(base_power_level, StatBuffIndex.POWER_LEVEL_CHAOS)
			local power_level = buffed_power_level - base_power_level
			local value = math.round(power_level)
			local presentation_text = tostring(value) .. "%"

			return presentation_text
		end
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_power_vs_infantry"),
		description_name = Localize("tooltip_hero_stats_power_vs_infantry_description"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_power_level = 100
			local buffed_power_level = buff_extension:apply_buffs_to_value(base_power_level, StatBuffIndex.POWER_LEVEL_UNARMOURED)
			local power_level = buffed_power_level - base_power_level
			local value = math.round(power_level)
			local presentation_text = tostring(value) .. "%"

			return presentation_text
		end
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_power_vs_armored"),
		description_name = Localize("tooltip_hero_stats_power_vs_armored_description"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_power_level = 100
			local buffed_power_level = buff_extension:apply_buffs_to_value(base_power_level, StatBuffIndex.POWER_LEVEL_ARMOURED)
			local power_level = buffed_power_level - base_power_level
			local value = math.round(power_level)
			local presentation_text = tostring(value) .. "%"

			return presentation_text
		end
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_power_vs_monsters"),
		description_name = Localize("tooltip_hero_stats_power_vs_monsters_description"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_power_level = 100
			local buffed_power_level = buff_extension:apply_buffs_to_value(base_power_level, StatBuffIndex.POWER_LEVEL_LARGE)
			local power_level = buffed_power_level - base_power_level
			local value = math.round(power_level)
			local presentation_text = tostring(value) .. "%"

			return presentation_text
		end
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_power_vs_frenzied"),
		description_name = Localize("tooltip_hero_stats_power_vs_frenzied_description"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_power_level = 100
			local buffed_power_level = buff_extension:apply_buffs_to_value(base_power_level, StatBuffIndex.POWER_LEVEL_FRENZY)
			local power_level = buffed_power_level - base_power_level
			local value = math.round(power_level)
			local presentation_text = tostring(value) .. "%"

			return presentation_text
		end
	},
	{
		type = "empty"
	},
	{
		type = "title",
		display_name = Localize("tooltip_hero_stats_defensive_stats")
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_shields_and_stamina"),
		description_name = Localize("tooltip_hero_stats_shields_and_stamina_description"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local status_extension = ScriptUnit.has_extension(player_unit, "status_system")
			local max_fatigue_points = status_extension:get_max_fatigue_points() or 0
			local shields = max_fatigue_points / 2
			local rounded_max_fatigue_points = math.round(max_fatigue_points)
			local rounded_shields = math.round(shields)
			local value = rounded_shields
			local presentation_text = tostring(value) .. "(" .. tostring(rounded_max_fatigue_points) .. ")"

			return presentation_text
		end
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_stamina_regeneration_speed"),
		description_name = Localize("tooltip_hero_stats_stamina_regeneration_speed_description"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local status_extension = ScriptUnit.has_extension(player_unit, "status_system")
			local max_fatigue_points = status_extension:get_max_fatigue_points() or 0
			local base_regen_speed = PlayerUnitStatusSettings.FATIGUE_POINTS_DEGEN_AMOUNT
			local regen_speed = buff_extension:apply_buffs_to_value(base_regen_speed, StatBuffIndex.FATIGUE_REGEN)
			local modified_regen_speed = math.round((regen_speed - base_regen_speed) / base_regen_speed * 100 + 100)
			local value = math.round_with_precision(regen_speed, 2)
			local presentation_text = tostring(value) .. "/s" .. "(" .. tostring(modified_regen_speed) .. "%" .. ")"

			return presentation_text
		end
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_dodge_distance"),
		description_name = Localize("tooltip_hero_stats_dodge_distance_description"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local movement_settings = PlayerUnitMovementSettings.get_movement_settings_table(player_unit)
			local dodge_distance_modifier = movement_settings.dodging.distance_modifier
			local base_dodge_distance = movement_settings.dodging.distance
			local dodge_distance_stat = dodge_distance_modifier * 100
			local modified_dodge_distance = math.round(base_dodge_distance * dodge_distance_modifier)
			local value = math.round(dodge_distance_stat)
			local presentation_text = tostring(modified_dodge_distance) .. "(" .. tostring(value) .. "%" .. ")"

			return presentation_text
		end
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_block_push_arc"),
		description_name = Localize("tooltip_hero_stats_block_push_arc_description"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_arc = 100
			local buffed_arc = buff_extension:apply_buffs_to_value(base_arc, StatBuffIndex.BLOCK_ANGLE)
			local value = math.round(buffed_arc)
			local presentation_text = tostring(value) .. "%"

			return presentation_text
		end
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_block_cost_reduction"),
		description_name = Localize("tooltip_hero_stats_block_cost_reduction_description"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_block_cost = 100
			local buffed_block_cost = buff_extension:apply_buffs_to_value(base_block_cost, StatBuffIndex.BLOCK_COST)
			local block_cost = base_block_cost - buffed_block_cost
			local value = math.round(block_cost)
			local presentation_text = tostring(value) .. "%"

			return presentation_text
		end
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_stun_duration"),
		description_name = Localize("tooltip_hero_stats_stun_duration_description"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_stun_duration = 100
			local buffed_stun_duration = buff_extension:apply_buffs_to_value(base_stun_duration, StatBuffIndex.STUN_DURATION)
			local stun_duration = base_stun_duration - buffed_stun_duration
			local value = math.round(buffed_stun_duration)
			local presentation_text = tostring(value) .. "%"

			return presentation_text
		end
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_damage_reduction"),
		description_name = Localize("tooltip_hero_stats_damage_reduction_description"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_damage_reduction = 100
			local buffed_damage_reduction = buff_extension:apply_buffs_to_value(base_damage_reduction, StatBuffIndex.DAMAGE_TAKEN)
			local damage_reduction = base_damage_reduction - buffed_damage_reduction
			local value = math.round(damage_reduction)
			local presentation_text = tostring(value) .. "%"

			return presentation_text
		end
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_damage_reduction_skaven"),
		description_name = Localize("tooltip_hero_stats_damage_reduction_skaven_description"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_damage_reduction = 100
			local buffed_damage_reduction = buff_extension:apply_buffs_to_value(base_damage_reduction, StatBuffIndex.PROTECTION_SKAVEN)
			local damage_reduction = base_damage_reduction - buffed_damage_reduction
			local value = math.round(damage_reduction)
			local presentation_text = tostring(value) .. "%"

			return presentation_text
		end
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_damage_reduction_chaos"),
		description_name = Localize("tooltip_hero_stats_damage_reduction_chaos_description"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_damage_reduction = 100
			local buffed_damage_reduction = buff_extension:apply_buffs_to_value(base_damage_reduction, StatBuffIndex.PROTECTION_CHAOS)
			local damage_reduction = base_damage_reduction - buffed_damage_reduction
			local value = math.round(damage_reduction)
			local presentation_text = tostring(value) .. "%"

			return presentation_text
		end
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_damage_reduction_aoe"),
		description_name = Localize("tooltip_hero_stats_damage_reduction_aoe_description"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_damage_reduction = 100
			local buffed_damage_reduction = buff_extension:apply_buffs_to_value(base_damage_reduction, StatBuffIndex.PROTECTION_AOE)
			local damage_reduction = base_damage_reduction - buffed_damage_reduction
			local value = math.round(damage_reduction)
			local presentation_text = tostring(value) .. "%"

			return presentation_text
		end
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_curse_resistance"),
		description_name = Localize("tooltip_hero_stats_curse_resistance_description"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_curse_resistance = 100
			local buffed_curse_resistance = buff_extension:apply_buffs_to_value(base_curse_resistance, StatBuffIndex.CURSE_PROTECTION)
			local curse_resistance = base_curse_resistance - buffed_curse_resistance
			local value = math.round(curse_resistance)
			local presentation_text = tostring(value) .. "%"

			return presentation_text
		end
	},
	{
		type = "empty"
	},
	{
		type = "title",
		display_name = Localize("tooltip_hero_stats_ranged_stats")
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_max_ammo_increase"),
		description_name = Localize("tooltip_hero_stats_max_ammo_increase_description"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_value = 100
			local buffed_value = buff_extension:apply_buffs_to_value(base_value, StatBuffIndex.TOTAL_AMMO)
			local value = buffed_value - base_value
			local presentation_text = tostring(value) .. "%"

			return presentation_text
		end
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_reload_speed_increase"),
		description_name = Localize("tooltip_hero_stats_reload_speed_increase_description"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_value = 100
			local buffed_value = buff_extension:apply_buffs_to_value(base_value, StatBuffIndex.RELOAD_SPEED)
			local value = base_value - buffed_value
			local presentation_text = tostring(value) .. "%"

			return presentation_text
		end
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_max_overheat"),
		description_name = Localize("tooltip_hero_stats_max_overheat_description"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local overcharge_extension = ScriptUnit.has_extension(player_unit, "overcharge_system")
			local max_value = overcharge_extension:get_max_value()
			local presentation_text = tostring(max_value)

			return presentation_text
		end
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_overheat_generated"),
		description_name = Localize("tooltip_hero_stats_overheat_generated_description"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local value = nil
			local base_value = 100
			local buffed_value = buff_extension:apply_buffs_to_value(base_value, StatBuffIndex.REDUCED_OVERCHARGE)
			value = buffed_value - base_value
			local presentation_text = tostring(value) .. "%"

			return presentation_text
		end
	},
	{
		type = "empty"
	}
}

return

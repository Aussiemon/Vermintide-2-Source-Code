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
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local health_extension = ScriptUnit.has_extension(player_unit, "health_system")
			local health = health_extension:get_max_health()

			return math.round(health)
		end,
		generate_description = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local health_extension = ScriptUnit.has_extension(player_unit, "health_system")
			local base_max_health = health_extension:get_base_max_health()
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local modified_health = buff_extension:apply_buffs_to_value(base_max_health, "max_health")
			local modifier = (modified_health / base_max_health - 1) * 100
			local desc_key = "tooltip_hero_stats_health_description"
			local description_text = string.format(Localize(desc_key), math.round(modifier))

			return description_text
		end
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_movement_speed"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local movement_settings = PlayerUnitMovementSettings.get_movement_settings_table(player_unit)
			local move_speed = movement_settings.move_speed
			local move_speed_rounded = move_speed

			return math.round_with_precision(move_speed_rounded, 2)
		end,
		generate_description = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local movement_settings = PlayerUnitMovementSettings.get_movement_settings_table(player_unit)
			local move_speed = movement_settings.move_speed
			local move_speed_stat = (move_speed / 4 - 1) * 100
			local modifier = move_speed_stat
			local desc_key = "tooltip_hero_stats_movement_speed_description"
			local description_text = string.format(Localize(desc_key), math.round(modifier))

			return description_text
		end
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_respawn_speed"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_respawn_time = 30
			local respawn_time = buff_extension:apply_buffs_to_value(base_respawn_time, "faster_respawn")
			local modified_respawn_time = (base_respawn_time - respawn_time) / base_respawn_time * 100
			local value = respawn_time
			local presentation_text = value

			return math.round(presentation_text)
		end,
		generate_description = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_respawn_time = 30
			local respawn_time = buff_extension:apply_buffs_to_value(base_respawn_time, "faster_respawn")
			local modifier = (base_respawn_time - respawn_time) / base_respawn_time * 100
			local desc_key = "tooltip_hero_stats_respawn_speed_description"
			local description_text = string.format(Localize(desc_key), math.round(modifier))

			return description_text
		end
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_ability_cooldown"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local career_extension = ScriptUnit.has_extension(player_unit, "career_system")
			local base_cooldown = career_extension:get_max_ability_cooldown()
			local modified_cooldown = buff_extension:apply_buffs_to_value(base_cooldown, "activated_cooldown")
			local value = modified_cooldown

			return value
		end,
		generate_description = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local career_extension = ScriptUnit.has_extension(player_unit, "career_system")
			local base_cooldown = career_extension:get_max_ability_cooldown()
			local modified_cooldown = buff_extension:apply_buffs_to_value(base_cooldown, "activated_cooldown")
			local modifier = (modified_cooldown - base_cooldown) / base_cooldown * -100
			local desc_key = "tooltip_hero_stats_ability_cooldown_description"
			local description_text = string.format(Localize(desc_key), math.round(modifier))

			return description_text
		end
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_revive_speed"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local duration = 2
			local modified_duration = buff_extension:apply_buffs_to_value(duration, "faster_revive")
			local value = modified_duration

			return math.round_with_precision(value, 2)
		end,
		generate_description = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local duration = 2
			local modified_duration = buff_extension:apply_buffs_to_value(duration, "faster_revive")
			local modifier = (modified_duration - duration) / duration * -100
			local desc_key = "tooltip_hero_stats_revive_speed_description"
			local description_text = string.format(Localize(desc_key), math.round(modifier))

			return description_text
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
		value_type = "percent",
		display_name = Localize("tooltip_hero_stats_attack_speed"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_attack_speed = 1
			local buffed_attack_speed = buff_extension:apply_buffs_to_value(base_attack_speed, "attack_speed")
			buffed_attack_speed = (buffed_attack_speed / base_attack_speed - 1) * 100
			local value = buffed_attack_speed

			return math.round(value)
		end,
		generate_description = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_attack_speed = 1
			local buffed_attack_speed = buff_extension:apply_buffs_to_value(base_attack_speed, "attack_speed")
			buffed_attack_speed = (buffed_attack_speed / base_attack_speed - 1) * 100
			local modifier = buffed_attack_speed
			local desc_key = "tooltip_hero_stats_attack_speed_description"
			local description_text = string.format(Localize(desc_key), math.round(modifier))

			return description_text
		end
	},
	{
		type = "entry",
		value_type = "percent",
		display_name = Localize("tooltip_hero_stats_critical_strike_chance"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local career_extension = ScriptUnit.has_extension(player_unit, "career_system")
			local career_name = career_extension:career_name()
			local career_settings = CareerSettings[career_name]
			local career_attributes = career_settings.attributes
			local base_critical_strike_chance = career_attributes.base_critical_strike_chance
			local buffed_critical_strike_chance = buff_extension:apply_buffs_to_value(base_critical_strike_chance, "critical_strike_chance")
			local normalized_critical_strike_chance = buffed_critical_strike_chance * 100
			local value = normalized_critical_strike_chance

			return math.round(value)
		end,
		generate_description = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local career_extension = ScriptUnit.has_extension(player_unit, "career_system")
			local career_name = career_extension:career_name()
			local career_settings = CareerSettings[career_name]
			local career_attributes = career_settings.attributes
			local base_critical_strike_chance = career_attributes.base_critical_strike_chance
			local buffed_critical_strike_chance = buff_extension:apply_buffs_to_value(base_critical_strike_chance, "critical_strike_chance")
			local modifier = buffed_critical_strike_chance * 100
			local desc_key = "tooltip_hero_stats_critical_strike_chance_description"
			local description_text = string.format(Localize(desc_key), math.round(modifier))

			return description_text
		end
	},
	{
		type = "entry",
		value_type = "percent",
		display_name = Localize("tooltip_hero_stats_critical_strike_boost"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_critical_strike_boost = 1
			local critical_strike_boost = buff_extension:apply_buffs_to_value(base_critical_strike_boost, "critical_strike_effectiveness")
			critical_strike_boost = (critical_strike_boost / base_critical_strike_boost - 1) * 100
			local value = critical_strike_boost

			return math.round(value)
		end,
		generate_description = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_critical_strike_boost = 1
			local modifier = buff_extension:apply_buffs_to_value(base_critical_strike_boost, "critical_strike_effectiveness")
			modifier = (modifier / base_critical_strike_boost - 1) * 100
			local desc_key = "tooltip_hero_stats_critical_strike_boost_description"
			local description_text = string.format(Localize(desc_key), math.round(modifier))

			return description_text
		end
	},
	{
		type = "entry",
		value_type = "percent",
		display_name = Localize("tooltip_hero_stats_headshot_damage"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_headshot_damage = 1
			local headshot_damage = buff_extension:apply_buffs_to_value(base_headshot_damage, "headshot_multiplier")
			headshot_damage = (headshot_damage / base_headshot_damage - 1) * 100
			local value = headshot_damage

			return math.round(value)
		end,
		generate_description = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_headshot_damage = 1
			local modifier = buff_extension:apply_buffs_to_value(base_headshot_damage, "headshot_multiplier")
			modifier = (modifier / base_headshot_damage - 1) * 100
			local desc_key = "tooltip_hero_stats_headshot_damage_description"
			local description_text = string.format(Localize(desc_key), math.round(modifier))

			return description_text
		end
	},
	{
		type = "entry",
		value_type = "percent",
		display_name = Localize("tooltip_hero_stats_power_increase"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_power_level = 100
			local buffed_power_level = buff_extension:apply_buffs_to_value(base_power_level, "power_level")
			local power_level = buffed_power_level - base_power_level
			local value = power_level

			return math.round(value)
		end,
		generate_description = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_power_level = 100
			local buffed_power_level = buff_extension:apply_buffs_to_value(base_power_level, "power_level")
			local power_level = buffed_power_level - base_power_level
			local modifier = power_level
			local desc_key = "tooltip_hero_stats_power_increase_description"
			local description_text = string.format(Localize(desc_key), math.round(modifier))

			return description_text
		end
	},
	{
		type = "entry",
		value_type = "percent",
		display_name = Localize("tooltip_hero_stats_power_vs_skaven"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_power_level = 100
			local buffed_power_level = buff_extension:apply_buffs_to_value(base_power_level, "power_level_skaven")
			local power_level = buffed_power_level - base_power_level
			local value = power_level

			return math.round(value)
		end,
		generate_description = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_power_level = 100
			local buffed_power_level = buff_extension:apply_buffs_to_value(base_power_level, "power_level_skaven")
			local power_level = buffed_power_level - base_power_level
			local modifier = power_level
			local desc_key = "tooltip_hero_stats_power_vs_skaven_description"
			local description_text = string.format(Localize(desc_key), math.round(modifier))

			return description_text
		end
	},
	{
		type = "entry",
		value_type = "percent",
		display_name = Localize("tooltip_hero_stats_power_vs_chaos"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_power_level = 100
			local buffed_power_level = buff_extension:apply_buffs_to_value(base_power_level, "power_level_chaos")
			local power_level = buffed_power_level - base_power_level
			local value = power_level

			return math.round(value)
		end,
		generate_description = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_power_level = 100
			local buffed_power_level = buff_extension:apply_buffs_to_value(base_power_level, "power_level_chaos")
			local power_level = buffed_power_level - base_power_level
			local modifier = power_level
			local desc_key = "tooltip_hero_stats_power_vs_chaos_description"
			local description_text = string.format(Localize(desc_key), math.round(modifier))

			return description_text
		end
	},
	{
		type = "entry",
		value_type = "percent",
		display_name = Localize("tooltip_hero_stats_power_vs_infantry"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_power_level = 100
			local buffed_power_level = buff_extension:apply_buffs_to_value(base_power_level, "power_level_unarmoured")
			local power_level = buffed_power_level - base_power_level
			local value = power_level

			return math.round(value)
		end,
		generate_description = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_power_level = 100
			local buffed_power_level = buff_extension:apply_buffs_to_value(base_power_level, "power_level_unarmoured")
			local power_level = buffed_power_level - base_power_level
			local modifier = power_level
			local desc_key = "tooltip_hero_stats_power_vs_infantry_description"
			local description_text = string.format(Localize(desc_key), math.round(modifier))

			return description_text
		end
	},
	{
		type = "entry",
		value_type = "percent",
		display_name = Localize("tooltip_hero_stats_power_vs_armored"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_power_level = 100
			local buffed_power_level = buff_extension:apply_buffs_to_value(base_power_level, "power_level_armoured")
			local power_level = buffed_power_level - base_power_level
			local value = power_level

			return math.round(value)
		end,
		generate_description = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_power_level = 100
			local buffed_power_level = buff_extension:apply_buffs_to_value(base_power_level, "power_level_armoured")
			local power_level = buffed_power_level - base_power_level
			local modifier = power_level
			local desc_key = "tooltip_hero_stats_power_vs_armored_description"
			local description_text = string.format(Localize(desc_key), math.round(modifier))

			return description_text
		end
	},
	{
		type = "entry",
		value_type = "percent",
		display_name = Localize("tooltip_hero_stats_power_vs_monsters"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_power_level = 100
			local buffed_power_level = buff_extension:apply_buffs_to_value(base_power_level, "power_level_large")
			local power_level = buffed_power_level - base_power_level
			local value = power_level

			return math.round(value)
		end,
		generate_description = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_power_level = 100
			local buffed_power_level = buff_extension:apply_buffs_to_value(base_power_level, "power_level_large")
			local power_level = buffed_power_level - base_power_level
			local modifier = power_level
			local desc_key = "tooltip_hero_stats_power_vs_monsters_description"
			local description_text = string.format(Localize(desc_key), math.round(modifier))

			return description_text
		end
	},
	{
		type = "entry",
		value_type = "percent",
		display_name = Localize("tooltip_hero_stats_power_vs_frenzied"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_power_level = 100
			local buffed_power_level = buff_extension:apply_buffs_to_value(base_power_level, "power_level_frenzy")
			local power_level = buffed_power_level - base_power_level
			local value = power_level

			return math.round(value)
		end,
		generate_description = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_power_level = 100
			local buffed_power_level = buff_extension:apply_buffs_to_value(base_power_level, "power_level_frenzy")
			local power_level = buffed_power_level - base_power_level
			local modifier = power_level
			local desc_key = "tooltip_hero_stats_power_vs_frenzied_description"
			local description_text = string.format(Localize(desc_key), math.round(modifier))

			return description_text
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
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local status_extension = ScriptUnit.has_extension(player_unit, "status_system")
			local max_fatigue_points = status_extension:get_max_fatigue_points() or 0
			local shields = max_fatigue_points / 2
			local rounded_shields = shields
			local value = rounded_shields

			return math.round(value)
		end,
		generate_description = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local status_extension = ScriptUnit.has_extension(player_unit, "status_system")
			local max_fatigue_points = status_extension:get_max_fatigue_points() or 0
			local shields = max_fatigue_points / 2
			local modifier = max_fatigue_points
			local desc_key = "tooltip_hero_stats_shields_and_stamina_description"
			local description_text = string.format(Localize(desc_key), math.round(modifier))

			return description_text
		end
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_stamina_regeneration_speed"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local status_extension = ScriptUnit.has_extension(player_unit, "status_system")
			local max_fatigue_points = status_extension:get_max_fatigue_points() or 0
			local base_regen_speed = PlayerUnitStatusSettings.FATIGUE_POINTS_DEGEN_AMOUNT
			local regen_speed = buff_extension:apply_buffs_to_value(base_regen_speed, "fatigue_regen")
			local value = regen_speed

			return math.round_with_precision(value, 2)
		end,
		generate_description = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local status_extension = ScriptUnit.has_extension(player_unit, "status_system")
			local max_fatigue_points = status_extension:get_max_fatigue_points() or 0
			local base_regen_speed = PlayerUnitStatusSettings.FATIGUE_POINTS_DEGEN_AMOUNT
			local regen_speed = buff_extension:apply_buffs_to_value(base_regen_speed, "fatigue_regen")
			local modifier = (regen_speed / base_regen_speed - 1) * 100
			local desc_key = "tooltip_hero_stats_stamina_regeneration_speed_description"
			local description_text = string.format(Localize(desc_key), math.round(modifier))

			return description_text
		end
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_dodge_distance"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local movement_settings = PlayerUnitMovementSettings.get_movement_settings_table(player_unit)
			local dodge_distance_modifier = movement_settings.dodging.distance_modifier
			local base_dodge_distance = movement_settings.dodging.distance
			local dodge_distance_stat = dodge_distance_modifier * 100
			local dodge_distance_stat = base_dodge_distance * dodge_distance_modifier
			local value = dodge_distance_stat

			return math.round_with_precision(value, 2)
		end,
		generate_description = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local movement_settings = PlayerUnitMovementSettings.get_movement_settings_table(player_unit)
			local dodge_distance_modifier = movement_settings.dodging.distance_modifier
			local base_dodge_distance = movement_settings.dodging.distance
			local dodge_distance_stat = (base_dodge_distance * dodge_distance_modifier / base_dodge_distance - 1) * 100
			local modifier = dodge_distance_stat
			local value = dodge_distance_stat
			local desc_key = "tooltip_hero_stats_dodge_distance_description"
			local description_text = string.format(Localize(desc_key), math.round(modifier))

			return description_text
		end
	},
	{
		type = "entry",
		value_type = "percent",
		display_name = Localize("tooltip_hero_stats_block_push_arc"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_arc = 1
			local buffed_arc = buff_extension:apply_buffs_to_value(base_arc, "block_angle")
			buffed_arc = (buffed_arc / base_arc - 1) * 100
			local value = buffed_arc

			return math.round(value)
		end,
		generate_description = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_arc = 1
			local buffed_arc = buff_extension:apply_buffs_to_value(base_arc, "block_angle")
			buffed_arc = (buffed_arc / base_arc - 1) * 100
			local modifier = buffed_arc
			local desc_key = "tooltip_hero_stats_block_push_arc_description"
			local description_text = string.format(Localize(desc_key), math.round(modifier))

			return description_text
		end
	},
	{
		type = "entry",
		value_type = "percent",
		display_name = Localize("tooltip_hero_stats_block_cost_reduction"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_block_cost = 1
			local buffed_block_cost = buff_extension:apply_buffs_to_value(base_block_cost, "block_cost")
			local block_cost = (buffed_block_cost / base_block_cost - 1) * -100
			local value = block_cost

			return math.round(value)
		end,
		generate_description = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_block_cost = 1
			local buffed_block_cost = buff_extension:apply_buffs_to_value(base_block_cost, "block_cost")
			local block_cost = (buffed_block_cost / base_block_cost - 1) * -100
			local modifier = block_cost
			local desc_key = "tooltip_hero_stats_block_cost_reduction_description"
			local description_text = string.format(Localize(desc_key), math.round(modifier))

			return description_text
		end
	},
	{
		type = "entry",
		value_type = "percent",
		display_name = Localize("tooltip_hero_stats_stun_duration"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_stun_duration = 1
			local buffed_stun_duration = buff_extension:apply_buffs_to_value(base_stun_duration, "stun_duration")
			buffed_stun_duration = (buffed_stun_duration / base_stun_duration - 1) * -100
			local value = buffed_stun_duration

			return math.round(value)
		end,
		generate_description = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_stun_duration = 1
			local buffed_stun_duration = buff_extension:apply_buffs_to_value(base_stun_duration, "stun_duration")
			buffed_stun_duration = (buffed_stun_duration / base_stun_duration - 1) * -100
			local modifier = buffed_stun_duration
			local desc_key = "tooltip_hero_stats_stun_duration_description"
			local description_text = string.format(Localize(desc_key), math.round(modifier))

			return description_text
		end
	},
	{
		type = "entry",
		value_type = "percent",
		display_name = Localize("tooltip_hero_stats_damage_reduction"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_damage_reduction = 1
			local buffed_damage_reduction = buff_extension:apply_buffs_to_value(base_damage_reduction, "damage_taken")
			local damage_reduction = (buffed_damage_reduction / base_damage_reduction - 1) * -100
			local value = damage_reduction

			return math.round(value)
		end,
		generate_description = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_damage_reduction = 1
			local buffed_damage_reduction = buff_extension:apply_buffs_to_value(base_damage_reduction, "damage_taken")
			local damage_reduction = (buffed_damage_reduction / base_damage_reduction - 1) * -100
			local modifier = damage_reduction
			local desc_key = "tooltip_hero_stats_damage_reduction_description"
			local description_text = string.format(Localize(desc_key), math.round(modifier))

			return description_text
		end
	},
	{
		type = "entry",
		value_type = "percent",
		display_name = Localize("tooltip_hero_stats_damage_reduction_skaven"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_damage_reduction = 1
			local buffed_damage_reduction = buff_extension:apply_buffs_to_value(base_damage_reduction, "protection_skaven")
			local damage_reduction = (buffed_damage_reduction / base_damage_reduction - 1) * -100
			local value = damage_reduction

			return math.round(value)
		end,
		generate_description = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_damage_reduction = 1
			local buffed_damage_reduction = buff_extension:apply_buffs_to_value(base_damage_reduction, "protection_skaven")
			local damage_reduction = (buffed_damage_reduction / base_damage_reduction - 1) * -100
			local modifier = damage_reduction
			local desc_key = "tooltip_hero_stats_damage_reduction_skaven_description"
			local description_text = string.format(Localize(desc_key), math.round(modifier))

			return description_text
		end
	},
	{
		type = "entry",
		value_type = "percent",
		display_name = Localize("tooltip_hero_stats_damage_reduction_chaos"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_damage_reduction = 1
			local buffed_damage_reduction = buff_extension:apply_buffs_to_value(base_damage_reduction, "protection_chaos")
			local damage_reduction = (buffed_damage_reduction / base_damage_reduction - 1) * -100
			local value = damage_reduction

			return math.round(value)
		end,
		generate_description = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_damage_reduction = 1
			local buffed_damage_reduction = buff_extension:apply_buffs_to_value(base_damage_reduction, "protection_chaos")
			local damage_reduction = (buffed_damage_reduction / base_damage_reduction - 1) * -100
			local modifier = damage_reduction
			local desc_key = "tooltip_hero_stats_damage_reduction_chaos_description"
			local description_text = string.format(Localize(desc_key), math.round(modifier))

			return description_text
		end
	},
	{
		type = "entry",
		value_type = "percent",
		display_name = Localize("tooltip_hero_stats_damage_reduction_aoe"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_damage_reduction = 100
			local buffed_damage_reduction = buff_extension:apply_buffs_to_value(base_damage_reduction, "protection_aoe")
			local damage_reduction = (buffed_damage_reduction / base_damage_reduction - 1) * -100
			local value = damage_reduction

			return math.round(value)
		end,
		generate_description = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_damage_reduction = 100
			local buffed_damage_reduction = buff_extension:apply_buffs_to_value(base_damage_reduction, "protection_aoe")
			local damage_reduction = (buffed_damage_reduction / base_damage_reduction - 1) * -100
			local modifier = damage_reduction
			local desc_key = "tooltip_hero_stats_damage_reduction_aoe_description"
			local description_text = string.format(Localize(desc_key), math.round(modifier))

			return description_text
		end
	},
	{
		type = "entry",
		value_type = "percent",
		display_name = Localize("tooltip_hero_stats_curse_resistance"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_curse_resistance = 1
			local buffed_curse_resistance = buff_extension:apply_buffs_to_value(base_curse_resistance, "curse_protection")
			local curse_resistance = (buffed_curse_resistance * base_curse_resistance - 1) * -100
			local value = curse_resistance

			return math.round(value)
		end,
		generate_description = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_curse_resistance = 1
			local buffed_curse_resistance = buff_extension:apply_buffs_to_value(base_curse_resistance, "curse_protection")
			local curse_resistance = (buffed_curse_resistance * base_curse_resistance - 1) * -100
			local modifier = math.abs(curse_resistance)
			local desc_key = "tooltip_hero_stats_curse_resistance_description"
			local description_text = string.format(Localize(desc_key), math.round(modifier))

			return description_text
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
		value_type = "percent",
		display_name = Localize("tooltip_hero_stats_max_ammo_increase"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_value = 1
			local buffed_value = buff_extension:apply_buffs_to_value(base_value, "total_ammo")
			local value = (buffed_value / base_value - 1) * 100

			return math.round(value)
		end,
		generate_description = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_value = 1
			local buffed_value = buff_extension:apply_buffs_to_value(base_value, "total_ammo")
			local modifier = (buffed_value / base_value - 1) * 100
			local desc_key = "tooltip_hero_stats_max_ammo_increase_description"
			local description_text = string.format(Localize(desc_key), math.round(modifier))

			return description_text
		end
	},
	{
		type = "entry",
		value_type = "percent",
		display_name = Localize("tooltip_hero_stats_reload_speed_increase"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_value = 1
			local buffed_value = buff_extension:apply_buffs_to_value(base_value, "reload_speed")
			local value = (buffed_value / base_value - 1) * 100

			return math.round(value)
		end,
		generate_description = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_value = 1
			local buffed_value = buff_extension:apply_buffs_to_value(base_value, "reload_speed")
			local modifier = (buffed_value / base_value - 1) * 100
			local desc_key = "tooltip_hero_stats_reload_speed_increase_description"
			local description_text = string.format(Localize(desc_key), math.round(modifier))

			return description_text
		end
	},
	{
		type = "entry",
		display_name = Localize("tooltip_hero_stats_max_overheat"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local overcharge_extension = ScriptUnit.has_extension(player_unit, "overcharge_system")
			local max_value = overcharge_extension:get_max_value()
			local presentation_text = tostring(max_value)

			return math.round(presentation_text)
		end,
		generate_description = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local overcharge_extension = ScriptUnit.has_extension(player_unit, "overcharge_system")
			local modifier = overcharge_extension:get_max_value()
			local desc_key = "tooltip_hero_stats_max_overheat_description"
			local description_text = string.format(Localize(desc_key), math.round(modifier))

			return description_text
		end
	},
	{
		type = "entry",
		value_type = "percent",
		display_name = Localize("tooltip_hero_stats_overheat_generated"),
		generate_value = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local value = nil
			local base_value = 1
			local buffed_value = buff_extension:apply_buffs_to_value(base_value, "reduced_overcharge")
			value = (buffed_value / base_value - 1) * -100

			return math.round(value)
		end,
		generate_description = function (params)
			local player_unit = Managers.player:local_player().player_unit
			local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")
			local base_value = 1
			local buffed_value = buff_extension:apply_buffs_to_value(base_value, "reduced_overcharge")
			local modifier = (buffed_value / base_value - 1) * -100
			local desc_key = "tooltip_hero_stats_overheat_generated_description"
			local description_text = string.format(Localize(desc_key), math.round(modifier))

			return description_text
		end
	},
	{
		type = "empty"
	}
}

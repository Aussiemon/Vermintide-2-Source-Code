UIUtils = UIUtils or {}

UIUtils.get_talent_description = function (talent_data)
	local description_text = Localize(talent_data.description)
	local description_values = talent_data.description_values
	local values = {}
	local text = nil

	if description_values then
		for i = 1, #description_values, 1 do
			local data = description_values[i]
			local value_type = data.value_type
			local value = data.value

			if value_type == "percent" then
				values[#values + 1] = math.abs(100 * value)
			elseif value_type == "baked_percent" then
				values[#values + 1] = math.abs(100 * (value - 1))
			else
				values[#values + 1] = value
			end
		end

		text = string.format(description_text, unpack(values))
	else
		text = description_text
	end

	return text
end

UIUtils.get_property_description = function (property_name, lerp_value)
	local property_data = WeaponProperties.properties[property_name]
	local description_text = Localize(property_data.display_name)
	local description_values = property_data.description_values
	local text = nil
	local advanced_description = ""

	if description_values then
		local min_value, max_value = nil
		local data = description_values[1]
		local value_type = data.value_type
		local value = data.value
		local display_value = nil

		if type(value) == "table" then
			if #value > 2 then
				local index = (lerp_value == 1 and #value) or 1 + math.floor(lerp_value / 1 / #value)
				display_value = value[index]
				min_value = value[1]
				max_value = value[#value]
			else
				min_value = value[1]
				max_value = value[2]
				display_value = math.lerp(min_value, max_value, lerp_value)
			end
		else
			display_value = value
		end

		if value_type == "percent" then
			display_value = math.abs(100 * display_value)
			min_value = math.abs(100 * min_value)
			max_value = math.abs(100 * max_value)
			advanced_description = string.format(" (%.1f%% - %.1f%%)", min_value, max_value)
		elseif value_type == "baked_percent" then
			display_value = math.abs(100 * (display_value - 1))
			min_value = math.abs(100 * (min_value - 1))
			max_value = math.abs(100 * (max_value - 1))
			advanced_description = string.format(" (%.1f%% - %.1f%%)", min_value, max_value)
		end

		text = string.format(description_text, display_value)
	else
		text = description_text
	end

	return text, advanced_description
end

UIUtils.get_trait_description = function (trait_name)
	local trait_data = WeaponTraits.traits[trait_name]
	local description_text = Localize(trait_data.advanced_description)
	local description_values = trait_data.description_values
	local text = nil

	if description_values then
		local values = {}

		for i = 1, #description_values, 1 do
			local data = description_values[i]
			local value_type = data.value_type
			local value = data.value

			if value_type == "percent" then
				values[#values + 1] = math.abs(100 * value)
			else
				values[#values + 1] = value
			end
		end

		text = string.format(description_text, unpack(values))
	else
		text = description_text
	end

	return text
end

UIUtils.get_ui_information_from_item = function (item)
	local item_data = item.data
	local item_type = item_data.item_type
	local rarity = item.rarity
	local inventory_icon, display_name, description = nil

	if item_type == "weapon_skin" then
		local skin = item.skin
		local skin_template = WeaponSkins.skins[skin]
		inventory_icon = skin_template.inventory_icon
		display_name = skin_template.display_name
		description = skin_template.description
	elseif item.skin then
		local skin = item.skin
		local skin_template = WeaponSkins.skins[skin]
		inventory_icon = skin_template.inventory_icon
		display_name = skin_template.display_name
		description = skin_template.description
	elseif rarity == "default" then
		local item_key = item_data.key
		local default_item_data = UISettings.default_items[item_key]

		if default_item_data then
			inventory_icon = default_item_data.inventory_icon or item_data.inventory_icon
			display_name = default_item_data.display_name or item_data.display_name
			description = default_item_data.description or item_data.description
		else
			inventory_icon = item_data.inventory_icon
			display_name = item_data.display_name
			description = item_data.description
		end
	else
		inventory_icon = item_data.inventory_icon
		display_name = item_data.display_name
		description = item_data.description
	end

	return inventory_icon, display_name, description
end

UIUtils.presentable_hero_power_level = function (power_level)
	return math.max(0, math.floor(power_level - PowerLevelFromLevelSettings.starting_power_level))
end

local formatting_functions = {
	damage = function (value)
		return string.format("%.2f", value)
	end,
	max_targets = function (value)
		if value == -1 then
			return "inf."
		end

		return string.format("%.2f", math.round_with_precision(value, 2))
	end,
	stagger_strength = function (value)
		return string.format("%.2f", math.round_with_precision(value, 2))
	end,
	crit = function (value)
		return string.format("%.1f", math.round_with_precision(value, 1) * 100) .. "%"
	end,
	time_between_damage = function (value)
		return string.format("%.2f", math.round_with_precision(value, 2))
	end,
	boost = function (value)
		return string.format("%.2f", math.round_with_precision(value, 2))
	end,
	push_angle = function (value)
		return tostring(value)
	end,
	push_strength = function (value)
		return string.format("%.2f", math.round_with_precision(value, 2))
	end
}

local function format_return_string(format_type, values)
	local formatting_function = formatting_functions[format_type]
	local return_string = ""

	if type(values) == "table" then
		for i = 1, #values, 1 do
			local current_value = values[i]

			if current_value.type == "charge" then
				return_string = return_string .. formatting_function(current_value.value_min) .. "-" .. formatting_function(current_value.value_max)
			elseif current_value.type == "multi" then
				return_string = return_string .. formatting_function(current_value.value) .. " x" .. tostring(current_value.shot_count)
			elseif current_value.type == "dual" then
				return_string = return_string .. formatting_function(current_value.value_left) .. "+" .. formatting_function(current_value.value_right)
			else
				return_string = return_string .. formatting_function(current_value.value)
			end

			if i < #values then
				return_string = return_string .. " / "
			end
		end
	else
		return_string = formatting_function(values)
	end

	return return_string
end

local function get_damage(unit, item, armor_type, primary_armor_type, damage_profile, power_level, difficulty_level)
	local damage_source = item.name
	local hit_zone_name = "torso"
	local target_index = 1
	local target_settings = (damage_profile.targets and damage_profile.targets[target_index]) or damage_profile.default_target
	local boost_curve = BoostCurves[target_settings.boost_curve_type]
	local boost_damage_multiplier = nil
	local is_critical_strike = false
	local backstab_multiplier = 1
	local breed = Breeds.skaven_clan_rat
	local dropoff_scalar = 0
	local has_power_boost = false
	local damage = DamageUtils.calculate_damage_tooltip(unit, damage_source, power_level, hit_zone_name, damage_profile, target_index, boost_curve, boost_damage_multiplier, is_critical_strike, backstab_multiplier, breed, dropoff_scalar, has_power_boost, difficulty_level, armor_type, primary_armor_type)

	return damage
end

local function get_stagger_strength(unit, item, damage_profile, power_level, difficulty_level)
	local breed = nil
	local hit_zone_name = "torso"
	local is_critical_strike = false
	local target_index = 1
	local blocked = false
	local damage_source = item.name
	local has_power_boost = false
	local dropoff_scalar = 0
	local type, duration, distance, value, strength = DamageUtils.calculate_stagger_player_tooltip(breed, unit, hit_zone_name, power_level, is_critical_strike, damage_profile, target_index, blocked, damage_source, difficulty_level, has_power_boost, dropoff_scalar)

	return type, duration, distance, value, strength
end

function get_next_action_names(action, charge_type)
	local chain_actions = action.allowed_chain_actions
	local no_auto_chain = true

	for _, chain_action in pairs(chain_actions) do
		if chain_action.auto_chain then
			no_auto_chain = false

			break
		end
	end

	local next_action_name, next_sub_action_name, next_start_time = nil
	local wanted_index = 1

	for index, chain_action in ipairs(chain_actions) do
		if (charge_type == "light" and index == wanted_index) or (charge_type == "heavy" and chain_action.auto_chain) or (no_auto_chain and charge_type == "heavy" and index == wanted_index) then
			if chain_action.input ~= "action_wield" then
				next_action_name = chain_action.action
				next_sub_action_name = chain_action.sub_action
				next_start_time = chain_action.start_time

				break
			else
				wanted_index = wanted_index + 1
			end
		end
	end

	return next_action_name, next_sub_action_name, next_start_time
end

local function get_action(unit, item, stat_descriptor)
	local career_extension = ScriptUnit.has_extension(unit, "career_system")
	local buff_extension = ScriptUnit.has_extension(unit, "buff_system")
	local item_data = item.data
	local item_template = BackendUtils.get_item_template(item_data)
	local actions = item_template.actions
	local charge_type = stat_descriptor.charge_type or "light"
	local compare_table = item_template.tooltip_compare
	local compare_actions = compare_table[charge_type]
	local action = actions[compare_actions.action_name][compare_actions.sub_action_name]

	return action
end

function get_chain_damages(values, action, unit, item, stat_descriptor)
	local impact_data = action.impact_data
	local career_extension = ScriptUnit.has_extension(unit, "career_system")
	local buff_extension = ScriptUnit.has_extension(unit, "buff_system")
	local power_level = career_extension:get_career_power_level()
	local difficulty_level = Managers.state.difficulty:get_difficulty()
	local armor_types = stat_descriptor.armor_types or {}
	local armor_type = armor_types[1] or 1
	local primary_armor_type = armor_types[2]
	local damage_profile_name = (impact_data and impact_data.damage_profile) or action.damage_profile
	local damage_profile_name_left = (impact_data and impact_data.damage_profile_left) or action.damage_profile_left
	local damage_profile_name_right = (impact_data and impact_data.damage_profile_right) or action.damage_profile_right

	if damage_profile_name then
		local damage_profile = DamageProfileTemplates[damage_profile_name]

		if action.kind == "charged_projectile" and action.scale_power_level then
			local power_level_min = ActionUtils.scale_charged_projectile_power_level(power_level, action, 0)
			local power_level_max = ActionUtils.scale_charged_projectile_power_level(power_level, action, 1)
			local damage_min = get_damage(unit, item, armor_type, primary_armor_type, damage_profile, power_level_min, difficulty_level)
			local damage_max = get_damage(unit, item, armor_type, primary_armor_type, damage_profile, power_level_max, difficulty_level)
			values[#values + 1] = {
				type = "charge",
				value_min = damage_min,
				value_max = damage_max
			}
		elseif action.kind == "geiser" then
			local power_level_min = ActionUtils.scale_geiser_power_level(power_level, 0)
			local power_level_max = ActionUtils.scale_geiser_power_level(power_level, 1)
			local damage_min = get_damage(unit, item, armor_type, primary_armor_type, damage_profile, power_level_min, difficulty_level)
			local damage_max = get_damage(unit, item, armor_type, primary_armor_type, damage_profile, power_level_max, difficulty_level)
			values[#values + 1] = {
				type = "charge",
				value_min = damage_min,
				value_max = damage_max
			}
		else
			local damage = get_damage(unit, item, armor_type, primary_armor_type, damage_profile, power_level, difficulty_level)
			local shot_count = (impact_data and (impact_data.shot_count or impact_data.num_projectiles)) or action.shot_count or action.num_projectiles or 1
			values[#values + 1] = {
				type = (shot_count > 1 and "multi") or "single",
				shot_count = shot_count,
				value = damage
			}
		end
	elseif damage_profile_name_left and damage_profile_name_right then
		local damage_profile_left = DamageProfileTemplates[damage_profile_name_left]
		local damage_profile_right = DamageProfileTemplates[damage_profile_name_right]
		local damage_left = get_damage(unit, item, armor_type, primary_armor_type, damage_profile_left, power_level, difficulty_level)
		local damage_right = get_damage(unit, item, armor_type, primary_armor_type, damage_profile_right, power_level, difficulty_level)
		values[#values + 1] = {
			type = "dual",
			value_left = damage_left,
			value_right = damage_right
		}
	end
end

function get_chain_max_targets(values, action, unit, item, stat_descriptor)
	local impact_data = action.impact_data
	local career_extension = ScriptUnit.has_extension(unit, "career_system")
	local buff_extension = ScriptUnit.has_extension(unit, "buff_system")
	local power_level = career_extension:get_career_power_level()
	local difficulty_level = Managers.state.difficulty:get_difficulty()
	local damage_profile_name = (impact_data and impact_data.damage_profile) or action.damage_profile
	local damage_profile_name_left = (impact_data and impact_data.damage_profile_left) or action.damage_profile_left
	local damage_profile_name_right = (impact_data and impact_data.damage_profile_right) or action.damage_profile_right

	if damage_profile_name then
		local damage_profile = DamageProfileTemplates[damage_profile_name]

		if action.kind == "charged_projectile" and action.scale_power_level then
			local power_level_min = ActionUtils.scale_charged_projectile_power_level(power_level, action, 0)
			local power_level_max = ActionUtils.scale_charged_projectile_power_level(power_level, action, 1)
			local cleave_power_level_min = ActionUtils.scale_power_levels(power_level_min, "cleave", unit, difficulty_level)
			local cleave_power_level_max = ActionUtils.scale_power_levels(power_level_max, "cleave", unit, difficulty_level)
			local max_targets_attack_min, max_targets_impact_min = ActionUtils.get_max_targets(damage_profile, cleave_power_level_min)
			local max_targets_attack_max, max_targets_impact_max = ActionUtils.get_max_targets(damage_profile, cleave_power_level_max)
			local max_targets_min = (max_targets_impact_min < max_targets_attack_min and max_targets_attack_min) or max_targets_impact_min
			local max_targets_max = (max_targets_impact_max < max_targets_attack_max and max_targets_attack_max) or max_targets_impact_max
			values[#values + 1] = {
				type = "charge",
				value_min = max_targets_min,
				value_max = max_targets_max
			}
		elseif action.kind == "geiser" or action.kind == "shield_slam" or action.kind == "push_stagger" then
			values[#values + 1] = {
				value = -1,
				type = "single"
			}
		else
			local cleave_power_level = ActionUtils.scale_power_levels(power_level, "cleave", unit, difficulty_level)
			local max_targets_attack, max_targets_impact = ActionUtils.get_max_targets(damage_profile, cleave_power_level)
			local max_targets = (max_targets_impact < max_targets_attack and max_targets_attack) or max_targets_impact
			local shot_count = (impact_data and (impact_data.shot_count or impact_data.num_projectiles)) or action.shot_count or action.num_projectiles or 1
			values[#values + 1] = {
				type = (shot_count > 1 and "multi") or "single",
				shot_count = shot_count,
				value = max_targets
			}
		end
	elseif damage_profile_name_left and damage_profile_name_right then
		local damage_profile_left = DamageProfileTemplates[damage_profile_name_left]
		local damage_profile_right = DamageProfileTemplates[damage_profile_name_right]
		local cleave_power_level = ActionUtils.scale_power_levels(power_level, "cleave", unit, difficulty_level)
		local max_targets_attack_left, max_targets_impact_left = ActionUtils.get_max_targets(damage_profile_left, cleave_power_level)
		local max_targets_attack_right, max_targets_impact_right = ActionUtils.get_max_targets(damage_profile_right, cleave_power_level)
		local max_targets_left = (max_targets_impact_left < max_targets_attack_left and max_targets_attack_left) or max_targets_impact_left
		local max_targets_right = (max_targets_impact_right < max_targets_attack_right and max_targets_attack_right) or max_targets_impact_right
		values[#values + 1] = {
			type = "dual",
			value_left = max_targets_left,
			value_right = max_targets_right
		}
	end
end

function get_chain_stagger_strengths(values, action, unit, item, stat_descriptor)
	local impact_data = action.impact_data
	local career_extension = ScriptUnit.has_extension(unit, "career_system")
	local buff_extension = ScriptUnit.has_extension(unit, "buff_system")
	local power_level = career_extension:get_career_power_level()
	local difficulty_level = Managers.state.difficulty:get_difficulty()
	local damage_profile_name = (impact_data and impact_data.damage_profile) or action.damage_profile
	local damage_profile_name_left = (impact_data and impact_data.damage_profile_left) or action.damage_profile_left
	local damage_profile_name_right = (impact_data and impact_data.damage_profile_right) or action.damage_profile_right

	if damage_profile_name then
		local damage_profile = DamageProfileTemplates[damage_profile_name]

		if action.kind == "charged_projectile" and action.scale_power_level then
			local power_level_min = ActionUtils.scale_charged_projectile_power_level(power_level, action, 0)
			local power_level_max = ActionUtils.scale_charged_projectile_power_level(power_level, action, 1)
			local type_min, duration_min, distance_min, value_min, strength_min = get_stagger_strength(unit, item, damage_profile, power_level_min, difficulty_level)
			local type_max, duration_max, distance_max, value_max, strength_max = get_stagger_strength(unit, item, damage_profile, power_level_max, difficulty_level)
			values[#values + 1] = {
				type = "charge",
				value_min = strength_min,
				value_max = strength_max
			}
		elseif action.kind == "geiser" then
			local power_level_min = ActionUtils.scale_geiser_power_level(power_level, 0)
			local power_level_max = ActionUtils.scale_geiser_power_level(power_level, 1)
			local type_min, duration_min, distance_min, value_min, strength_min = get_stagger_strength(unit, item, damage_profile, power_level_min, difficulty_level)
			local type_max, duration_max, distance_max, value_max, strength_max = get_stagger_strength(unit, item, damage_profile, power_level_max, difficulty_level)
			values[#values + 1] = {
				type = "charge",
				value_min = strength_min,
				value_max = strength_max
			}
		else
			local type, duration, distance, value, strength = get_stagger_strength(unit, item, damage_profile, power_level, difficulty_level)
			local shot_count = (impact_data and (impact_data.shot_count or impact_data.num_projectiles)) or action.shot_count or action.num_projectiles or 1
			values[#values + 1] = {
				type = (shot_count > 1 and "multi") or "single",
				shot_count = shot_count,
				value = strength
			}
		end
	elseif damage_profile_name_left and damage_profile_name_right then
		local damage_profile_left = DamageProfileTemplates[damage_profile_name_left]
		local damage_profile_right = DamageProfileTemplates[damage_profile_name_right]
		local type_left, duration_left, distance_left, value_left, strength_left = get_stagger_strength(unit, item, damage_profile_left, power_level, difficulty_level)
		local type_right, duration_right, distance_right, value_right, strength_right = get_stagger_strength(unit, item, damage_profile_right, power_level, difficulty_level)
		values[#values + 1] = {
			type = "dual",
			value_left = strength_left,
			value_right = strength_right
		}
	end
end

function get_chain_critical_hit_chances(values, action, unit, item, stat_descriptor)
	local impact_data = action.impact_data
	local damage_profile_name = (impact_data and impact_data.damage_profile) or action.damage_profile
	local damage_profile_name_left = (impact_data and impact_data.damage_profile_left) or action.damage_profile_left
	local damage_profile_name_right = (impact_data and impact_data.damage_profile_right) or action.damage_profile_right

	if damage_profile_name or (damage_profile_name_left and damage_profile_name_right) then
		local crit_chance = ActionUtils.get_critical_strike_chance(unit, action)
		values[#values + 1] = {
			type = "single",
			value = crit_chance
		}
	end
end

local ranged_actions = {
	beam = true,
	crossbow = true,
	charged_projectile = true,
	shotgun = true,
	handgun = true,
	bow = true,
	bullet_spray = true,
	flamethrower = true
}

function get_time_between_damage(values, action, unit, item, stat_descriptor)
	local impact_data = action.impact_data
	local damage_profile_name = (impact_data and impact_data.damage_profile) or action.damage_profile
	local damage_profile_name_left = (impact_data and impact_data.damage_profile_left) or action.damage_profile_left
	local damage_profile_name_right = (impact_data and impact_data.damage_profile_right) or action.damage_profile_right

	if damage_profile_name or (damage_profile_name_left and damage_profile_name_right) then
		if ranged_actions[action.kind] then
			local chain_start_time = stat_descriptor.chain_start_time or 0
			local start_time = action.damage_interval or action.fire_time or 0
			local attack_time = chain_start_time + start_time
			values[#values + 1] = {
				type = "single",
				value = attack_time
			}
		elseif action.kind == "sweep" or action.kind == "shield_slam" then
			local chain_start_time = stat_descriptor.chain_start_time or 0
			local damage_window_start = action.damage_window_start or 0
			local damage_window_end = action.damage_window_end or 0
			local attack_time = chain_start_time + damage_window_start
			values[#values + 1] = {
				type = "single",
				value = attack_time
			}

			return true
		end
	end
end

function get_chain_boost_coefficients(values, action, unit, item, stat_descriptor)
	local impact_data = action.impact_data
	local damage_profile_name = (impact_data and impact_data.damage_profile) or action.damage_profile
	local damage_profile_name_left = (impact_data and impact_data.damage_profile_left) or action.damage_profile_left
	local damage_profile_name_right = (impact_data and impact_data.damage_profile_right) or action.damage_profile_right

	if damage_profile_name then
		local damage_profile = DamageProfileTemplates[damage_profile_name]
		local target_index = 1
		local target_settings = (damage_profile.targets and damage_profile.targets[target_index]) or damage_profile.default_target
		local boost_coefficient = target_settings.boost_curve_coefficient or DefaultBoostCurveCoefficient
		local shot_count = (impact_data and (impact_data.shot_count or impact_data.num_projectiles)) or action.shot_count or action.num_projectiles or 1
		values[#values + 1] = {
			type = (shot_count > 1 and "multi") or "single",
			shot_count = shot_count,
			value = boost_coefficient
		}
	elseif damage_profile_name_left and damage_profile_name_right then
		local damage_profile_left = DamageProfileTemplates[damage_profile_name_left]
		local damage_profile_right = DamageProfileTemplates[damage_profile_name_right]
		local target_index = 1
		local target_settings_left = (damage_profile_left.targets and damage_profile_left.targets[target_index]) or damage_profile_left.default_target
		local boost_coefficient_left = target_settings_left.boost_curve_coefficient or DefaultBoostCurveCoefficient
		local target_settings_right = (damage_profile_right.targets and damage_profile_right.targets[target_index]) or damage_profile_right.default_target
		local boost_coefficient_right = target_settings_right.boost_curve_coefficient or DefaultBoostCurveCoefficient
		values[#values + 1] = {
			type = "dual",
			value_left = boost_coefficient_left,
			value_right = boost_coefficient_right
		}
	end
end

function get_chain_headshot_boost_coefficients(values, action, unit, item, stat_descriptor)
	local impact_data = action.impact_data
	local damage_profile_name = (impact_data and impact_data.damage_profile) or action.damage_profile
	local damage_profile_name_left = (impact_data and impact_data.damage_profile_left) or action.damage_profile_left
	local damage_profile_name_right = (impact_data and impact_data.damage_profile_right) or action.damage_profile_right

	if damage_profile_name then
		local damage_profile = DamageProfileTemplates[damage_profile_name]
		local target_index = 1
		local target_settings = (damage_profile.targets and damage_profile.targets[target_index]) or damage_profile.default_target
		local boost_coefficient_headshot = target_settings.boost_curve_coefficient_headshot or DefaultBoostCurveCoefficient
		local shot_count = (impact_data and (impact_data.shot_count or impact_data.num_projectiles)) or action.shot_count or action.num_projectiles or 1
		values[#values + 1] = {
			type = (shot_count > 1 and "multi") or "single",
			shot_count = shot_count,
			value = boost_coefficient_headshot
		}
	elseif damage_profile_name_left and damage_profile_name_right then
		local damage_profile_left = DamageProfileTemplates[damage_profile_name_left]
		local damage_profile_right = DamageProfileTemplates[damage_profile_name_right]
		local target_index = 1
		local target_settings_left = (damage_profile_left.targets and damage_profile_left.targets[target_index]) or damage_profile_left.default_target
		local boost_coefficient_headshot_left = target_settings_left.boost_curve_coefficient_headshot or DefaultBoostCurveCoefficient
		local target_settings_right = (damage_profile_right.targets and damage_profile_right.targets[target_index]) or damage_profile_right.default_target
		local boost_coefficient_headshot_right = target_settings_right.boost_curve_coefficient_headshot or DefaultBoostCurveCoefficient
		values[#values + 1] = {
			type = "dual",
			value_left = boost_coefficient_headshot_left,
			value_right = boost_coefficient_headshot_right
		}
	end
end

function get_push_angles(values, action, unit, item, stat_descriptor)
	local item_data = item.data
	local item_template = BackendUtils.get_item_template(item_data)
	local actions = item_template.actions
	local charge_type = stat_descriptor.charge_type
	local action_name, sub_action_name = nil
	local tooltip_detail = item_template.tooltip_detail

	if tooltip_detail then
		action_name = tooltip_detail[charge_type].action_name
		sub_action_name = tooltip_detail[charge_type].sub_action_name
	else
		return values
	end

	local action = actions[action_name][sub_action_name]
	local damage_profile_inner_name = action.damage_profile_inner
	local damage_profile_outer_name = action.damage_profile_outer

	if damage_profile_inner_name and damage_profile_outer_name then
		local inner_push_angle = action.push_angle
		local outer_push_angle = action.outer_push_angle
		values[#values + 1] = {
			type = "single",
			value = inner_push_angle
		}
		values[#values + 1] = {
			type = "single",
			value = outer_push_angle
		}
	end
end

function get_push_strengths(values, action, unit, item, stat_descriptor)
	local career_extension = ScriptUnit.has_extension(unit, "career_system")
	local buff_extension = ScriptUnit.has_extension(unit, "buff_system")
	local power_level = career_extension:get_career_power_level()
	local difficulty_level = Managers.state.difficulty:get_difficulty()
	local item_data = item.data
	local item_template = BackendUtils.get_item_template(item_data)
	local actions = item_template.actions
	local charge_type = stat_descriptor.charge_type
	local action_name, sub_action_name = nil
	local tooltip_detail = item_template.tooltip_detail

	if tooltip_detail then
		action_name = tooltip_detail[charge_type].action_name
		sub_action_name = tooltip_detail[charge_type].sub_action_name
	else
		return values
	end

	local action = actions[action_name][sub_action_name]
	local damage_profile_inner_name = action.damage_profile_inner
	local damage_profile_outer_name = action.damage_profile_outer

	if damage_profile_inner_name and damage_profile_outer_name then
		local damage_profile_inner = DamageProfileTemplates[damage_profile_inner_name]
		local damage_profile_outer = DamageProfileTemplates[damage_profile_outer_name]
		local breed = nil
		local hit_zone_name = "torso"
		local is_critical_strike = false
		local target_index = 1
		local blocked = false
		local damage_source = item.name
		local has_power_boost = false
		local dropoff_scalar = 0
		local type_inner, duration_inner, distance_inner, value_inner, strength_inner = get_stagger_strength(unit, item, damage_profile_inner, power_level, difficulty_level)
		local type_outer, duration_outer, distance_outer, value_outer, strength_outer = get_stagger_strength(unit, item, damage_profile_outer, power_level, difficulty_level)
		values[#values + 1] = {
			type = "single",
			value = strength_inner
		}
		values[#values + 1] = {
			type = "single",
			value = strength_outer
		}
	end
end

local TRAVERSED_ACTION_PAIRS = {}

function parse_weapon_chain(values, unit, item, stat_descriptor, chain_value_function)
	local item_data = item.data
	local item_template = BackendUtils.get_item_template(item_data)
	local actions = item_template.actions
	local charge_type = stat_descriptor.charge_type
	local slot_type = item_data.slot_type
	local uses_custom_chain = false
	local current_action_name, current_sub_action_name, current_chain_start_time = nil
	local skip_chain_start_time = slot_type == "ranged"
	local tooltip_detail = item_template.tooltip_detail
	local tooltip_sub_detail = nil

	if tooltip_detail then
		tooltip_sub_detail = tooltip_detail[charge_type]
		uses_custom_chain = tooltip_sub_detail.custom_chain

		if not uses_custom_chain then
			current_action_name = tooltip_sub_detail.action_name
			current_sub_action_name = tooltip_sub_detail.sub_action_name
			local action = actions[current_action_name][current_sub_action_name]
			local _, _, next_chain_start_time = get_next_action_names(action, charge_type)
			current_chain_start_time = next_chain_start_time
		end
	else
		return values
	end

	if uses_custom_chain then
		for _, settings in ipairs(tooltip_sub_detail) do
			current_action_name = settings.action_name
			current_sub_action_name = settings.sub_action_name
			local action = actions[current_action_name][current_sub_action_name]
			stat_descriptor.chain_start_time = settings.chain_start_time

			chain_value_function(values, action, unit, item, stat_descriptor)
		end
	else
		local traversed_action_pairs = TRAVERSED_ACTION_PAIRS

		table.clear(traversed_action_pairs)

		if slot_type == "ranged" then
			traversed_action_pairs[#traversed_action_pairs + 1] = {
				tooltip_detail.light.action_name,
				tooltip_detail.light.sub_action_name
			}
			traversed_action_pairs[#traversed_action_pairs + 1] = {
				tooltip_detail.heavy.action_name,
				tooltip_detail.heavy.sub_action_name
			}
		end

		local chain_complete = false

		while not chain_complete do
			traversed_action_pairs[#traversed_action_pairs + 1] = {
				current_action_name,
				current_sub_action_name
			}
			local action = actions[current_action_name][current_sub_action_name]
			local next_action_name, next_sub_action_name, next_chain_start_time = get_next_action_names(action, charge_type)
			stat_descriptor.chain_start_time = not skip_chain_start_time and current_chain_start_time
			skip_chain_start_time = chain_value_function(values, action, unit, item, stat_descriptor)

			if next_action_name == nil and next_sub_action_name == nil then
				chain_complete = true
			end

			if not chain_complete then
				for _, action_pair in pairs(traversed_action_pairs) do
					if action_pair[1] == next_action_name and action_pair[2] == next_sub_action_name then
						chain_complete = true
					end
				end
			end

			if not chain_complete then
				current_action_name = next_action_name
				current_sub_action_name = next_sub_action_name

				if skip_chain_start_time then
					current_chain_start_time = next_chain_start_time
				end
			end
		end
	end
end

UIUtils.get_tooltip_damage = function (unit, item, stat_descriptor)
	local damages = {}

	if stat_descriptor.detailed then
		parse_weapon_chain(damages, unit, item, stat_descriptor, get_chain_damages)
	else
		local action = get_action(unit, item, stat_descriptor)

		get_chain_damages(damages, action, unit, item, stat_descriptor)
	end

	return format_return_string("damage", damages)
end

UIUtils.get_tooltip_max_targets = function (unit, item, stat_descriptor)
	local max_targets = {}

	if stat_descriptor.detailed then
		parse_weapon_chain(max_targets, unit, item, stat_descriptor, get_chain_max_targets)
	else
		local action = get_action(unit, item, stat_descriptor)

		get_chain_max_targets(max_targets, action, unit, item, stat_descriptor)
	end

	return format_return_string("max_targets", max_targets)
end

UIUtils.get_tooltip_stagger_strength = function (unit, item, stat_descriptor)
	local stagger_strengths = {}

	if stat_descriptor.detailed then
		parse_weapon_chain(stagger_strengths, unit, item, stat_descriptor, get_chain_stagger_strengths)
	else
		local action = get_action(unit, item, stat_descriptor)

		get_chain_stagger_strengths(stagger_strengths, action, unit, item, stat_descriptor)
	end

	return format_return_string("stagger_strength", stagger_strengths)
end

UIUtils.get_tooltip_critical_hit_chance = function (unit, item, stat_descriptor)
	local critical_hit_chances = {}

	if stat_descriptor.detailed then
		parse_weapon_chain(critical_hit_chances, unit, item, stat_descriptor, get_chain_critical_hit_chances)
	else
		local action = get_action(unit, item, stat_descriptor)

		get_chain_critical_hit_chances(critical_hit_chances, action, unit, item, stat_descriptor)
	end

	return format_return_string("crit", critical_hit_chances)
end

UIUtils.get_tooltip_time_between_damage = function (unit, item, stat_descriptor)
	local time_between_damages = {}

	if stat_descriptor.detailed then
		parse_weapon_chain(time_between_damages, unit, item, stat_descriptor, get_time_between_damage)
	end

	return format_return_string("time_between_damage", time_between_damages)
end

UIUtils.get_tooltip_boost_coefficient = function (unit, item, stat_descriptor)
	local boost_coefficients = {}

	if stat_descriptor.detailed then
		parse_weapon_chain(boost_coefficients, unit, item, stat_descriptor, get_chain_boost_coefficients)
	else
		local action = get_action(unit, item, stat_descriptor)

		get_chain_boost_coefficients(boost_coefficients, action, unit, item, stat_descriptor)
	end

	return format_return_string("boost", boost_coefficients)
end

UIUtils.get_tooltip_headshot_boost_coefficient = function (unit, item, stat_descriptor)
	local headshot_boost_coefficients = {}

	if stat_descriptor.detailed then
		parse_weapon_chain(headshot_boost_coefficients, unit, item, stat_descriptor, get_chain_headshot_boost_coefficients)
	else
		local action = get_action(unit, item, stat_descriptor)

		get_chain_headshot_boost_coefficients(headshot_boost_coefficients, action, unit, item, stat_descriptor)
	end

	return format_return_string("boost", headshot_boost_coefficients)
end

UIUtils.get_tooltip_push_angles = function (unit, item, stat_descriptor)
	local push_angles = {}

	parse_weapon_chain(push_angles, unit, item, stat_descriptor, get_push_angles)

	return format_return_string("push_angle", push_angles)
end

UIUtils.get_tooltip_push_stagger_strengths = function (unit, item, stat_descriptor)
	local push_strengths = {}

	parse_weapon_chain(push_strengths, unit, item, stat_descriptor, get_push_strengths)

	return format_return_string("push_strength", push_strengths)
end

UIUtils.get_hero_statistics_by_template = function (template)
	local layout = {}
	local params = {}

	for index, entry in ipairs(template) do
		local entry_type = entry.type
		local display_name = entry.display_name
		local value = nil

		if entry_type == "title" then
			display_name = entry.display_name
		elseif entry_type == "entry" then
			display_name = entry.display_name
			value = entry.generate_value(params)
		end

		layout[index] = {
			display_name = display_name,
			value = value,
			type = entry_type
		}
	end

	return layout
end

return

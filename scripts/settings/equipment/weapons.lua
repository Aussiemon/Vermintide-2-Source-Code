require("scripts/settings/attachment_node_linking")
require("scripts/unit_extensions/generic/interactions")
require("scripts/settings/profiles/career_settings")
require("scripts/helpers/weapon_utils")
dofile("scripts/settings/explosion_templates")
dofile("scripts/settings/equipment/hit_mass_counts")
require("scripts/settings/equipment/attack_templates")
require("scripts/settings/equipment/power_level_settings")
require("scripts/settings/equipment/power_level_templates")
require("scripts/settings/equipment/damage_profile_templates")
require("scripts/utils/action_assert_funcs")
dofile("scripts/settings/equipment/projectiles")
dofile("scripts/settings/equipment/light_weight_projectiles")
require("scripts/settings/action_templates")

Weapons = Weapons or {}
local weapon_template_files_names = dofile("scripts/settings/equipment/honduras_weapon_templates")

for _, dlc in pairs(DLCSettings) do
	if dlc.weapon_template_file_names then
		table.append(weapon_template_files_names, dlc.weapon_template_file_names)
	end
end

for i = 1, #weapon_template_files_names, 1 do
	local file_name = weapon_template_files_names[i]
	local weapon_templates = dofile(file_name)

	if weapon_templates then
		for template_name, template in pairs(weapon_templates) do
			Weapons[template_name] = template
		end
	end
end

table.clear(weapon_template_files_names)

DAMAGE_TYPES_AOE = {
	warpfire_face = true,
	vomit_face = true,
	vomit_ground = true,
	poison = true,
	plague_face = true,
	warpfire_ground = true
}
local buff_params = {}

local function add_dot(dot_template_name, hit_unit, attacker_unit, damage_source, power_level)
	if ScriptUnit.has_extension(hit_unit, "buff_system") then
		table.clear(buff_params)

		buff_params.attacker_unit = attacker_unit
		buff_params.damage_source = damage_source
		buff_params.power_level = power_level
		local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

		buff_extension:add_buff(dot_template_name, buff_params)
	end
end

local function add_dot_network_synced(dot_template_name, hit_unit, attacker_unit, damage_source, power_level)
	if ScriptUnit.has_extension(hit_unit, "buff_system") then
		local buff_system = Managers.state.entity:system("buff_system")

		buff_system:add_buff(hit_unit, dot_template_name, attacker_unit, false)
	end
end

Dots = {
	poison_dot = function (dot_template_name, damage_profile, target_index, power_level, target_unit, attacker_unit, hit_zone_name, damage_source, boost_curve_multiplier, is_critical_strike)
		if not damage_profile then
			return false
		end

		local target_settings = damage_profile.targets[target_index] or damage_profile.default_target
		dot_template_name = dot_template_name or target_settings.dot_template_name or damage_profile.dot_template_name

		if not dot_template_name then
			return false
		end

		local do_dot = true
		local breed = AiUtils.unit_breed(target_unit)
		local dummy_unit_armor = Unit.get_data(target_unit, "armor")
		local breed_armor = ActionUtils.get_target_armor(hit_zone_name, breed, dummy_unit_armor)

		if breed_armor == 2 then
			local boost_curve = BoostCurves[target_settings.boost_curve_type]
			local predicted_damage = DamageUtils.calculate_damage(DamageOutput, target_unit, attacker_unit, hit_zone_name, power_level, boost_curve, boost_curve_multiplier, is_critical_strike, damage_profile, target_index, false, damage_source)

			if predicted_damage <= 0 then
				do_dot = false
			end
		end

		if do_dot then
			if target_settings.network_sync_dot then
				add_dot_network_synced(dot_template_name, target_unit, attacker_unit, damage_source, power_level)
			else
				add_dot(dot_template_name, target_unit, attacker_unit, damage_source, power_level)
			end
		end

		return do_dot
	end,
	burning_dot = function (dot_template_name, damage_profile, target_index, power_level, target_unit, attacker_unit, hit_zone_name, damage_source, boost_curve_multiplier, is_critical_strike)
		if damage_profile then
			dot_template_name = dot_template_name or target_settings.dot_template_name or damage_profile.dot_template_name
		end

		if not dot_template_name then
			return false
		end

		local talent_extension = ScriptUnit.has_extension(attacker_unit, "talent_system")

		if talent_extension then
			local breed = AiUtils.unit_breed(target_unit)
			local infinite_burn_talent = talent_extension:has_talent("sienna_adept_infinite_burn")

			if infinite_burn_talent and breed and not breed.is_hero then
				dot_template_name = InfiniteBurnDotLookup[dot_template_name]
			end
		end

		local attacker_unit_buff_extension = ScriptUnit.has_extension(attacker_unit, "buff_system")

		if attacker_unit_buff_extension then
			attacker_unit_buff_extension:trigger_procs("on_enemy_ignited", dot_template_name, damage_profile, target_index, target_unit, hit_zone_name, damage_source, is_critical_strike)
		end

		add_dot_network_synced(dot_template_name, target_unit, attacker_unit, damage_source, power_level)

		return true
	end,
	slow_debuff = function (dot_template_name, damage_profile, target_index, power_level, target_unit, attacker_unit, hit_zone_name, damage_source, boost_curve_multiplier, is_critical_strike)
		if damage_profile then
			dot_template_name = dot_template_name or target_settings.dot_template_name or damage_profile.dot_template_name
		end

		if not dot_template_name then
			return false
		end

		add_dot(dot_template_name, target_unit, attacker_unit, damage_source, power_level)

		return true
	end
}
DotTypeLookup = {
	burning_flamethrower_dot = "burning_dot",
	burning_3W_dot = "burning_dot",
	burning_dot = "burning_dot",
	arrow_poison_dot = "poison_dot",
	weapon_bleed_dot_maidenguard = "poison_dot",
	corpse_explosion_default = "poison_dot",
	burning_dot_fire_grenade = "burning_dot",
	beam_burning_dot = "burning_dot",
	weapon_bleed_dot_dagger = "poison_dot",
	burning_1W_dot = "burning_dot",
	burning_1W_dot_unchained_push = "burning_dot",
	aoe_poison_dot = "poison_dot",
	chaos_zombie_explosion = "poison_dot"
}
local checked_templates = {
	bright_wizard = {},
	dwarf_ranger = {},
	empire_soldier = {},
	witch_hunter = {},
	wood_elf = {}
}

for _, item in pairs(ItemMasterList) do
	local slot_type = item.slot_type

	if slot_type == "melee" or slot_type == "ranged" or slot_type == "grenade" or slot_type == "healthkit" or slot_type == "potion" then
		local template_name = item.template or item.temporary_template

		fassert(Weapons[template_name], "Weapon template [\"%s\"] does not exist!", template_name)

		local careers = item.can_wield

		for i = 1, #careers, 1 do
			local career_name = careers[i]
			local career_data = CareerSettings[career_name]
			local profile_name = career_data.profile_name
			local action_names = CareerActionNames[profile_name]

			if checked_templates[profile_name] and not checked_templates[profile_name][template_name] then
				checked_templates[profile_name][template_name] = true
				local template = Weapons[template_name]
				local actions = template.actions

				for j = 1, #action_names, 1 do
					local action_name = action_names[j]
					actions[action_name] = ActionTemplates[action_name]
				end

				actions.action_career_skill = nil
			end
		end
	end
end

local WEAPON_DAMAGE_UNIT_LENGTH_EXTENT = 1.919366
local TAP_ATTACK_BASE_RANGE_OFFSET = 0.6
local HOLD_ATTACK_BASE_RANGE_OFFSET = 0.65

for item_template_name, item_template in pairs(Weapons) do
	item_template.name = item_template_name
	item_template.crosshair_style = item_template.crosshair_style or "dot"
	local attack_meta_data = item_template.attack_meta_data
	local tap_attack_meta_data = attack_meta_data and attack_meta_data.tap_attack
	local hold_attack_meta_data = attack_meta_data and attack_meta_data.hold_attack
	local set_default_tap_attack_range = tap_attack_meta_data and tap_attack_meta_data.max_range == nil
	local set_default_hold_attack_range = hold_attack_meta_data and hold_attack_meta_data.max_range == nil
	local actions = item_template.actions

	for action_name, sub_actions in pairs(actions) do
		for sub_action_name, sub_action_data in pairs(sub_actions) do
			local lookup_data = {
				item_template_name = item_template_name,
				action_name = action_name,
				sub_action_name = sub_action_name
			}
			sub_action_data.lookup_data = lookup_data
			local action_kind = sub_action_data.kind
			local action_assert_func = ActionAssertFuncs[action_kind]

			if action_assert_func then
				action_assert_func(item_template_name, action_name, sub_action_name, sub_action_data)
			end

			if action_name == "action_one" then
				local range_mod = sub_action_data.range_mod or 1

				if set_default_tap_attack_range and string.find(sub_action_name, "light_attack") then
					local current_attack_range = tap_attack_meta_data.max_range or math.huge
					local tap_attack_range = TAP_ATTACK_BASE_RANGE_OFFSET + WEAPON_DAMAGE_UNIT_LENGTH_EXTENT * range_mod
					tap_attack_meta_data.max_range = math.min(current_attack_range, tap_attack_range)
				elseif set_default_hold_attack_range and string.find(sub_action_name, "heavy_attack") then
					local current_attack_range = hold_attack_meta_data.max_range or math.huge
					local hold_attack_range = HOLD_ATTACK_BASE_RANGE_OFFSET + WEAPON_DAMAGE_UNIT_LENGTH_EXTENT * range_mod
					hold_attack_meta_data.max_range = math.min(current_attack_range, hold_attack_range)
				end
			end

			local impact_data = sub_action_data.impact_data

			if impact_data then
				local pickup_settings = impact_data.pickup_settings

				if pickup_settings then
					local link_hit_zones = pickup_settings.link_hit_zones

					if link_hit_zones then
						for i = 1, #link_hit_zones, 1 do
							local hit_zone_name = link_hit_zones[i]
							link_hit_zones[hit_zone_name] = true
						end
					end
				end
			end
		end
	end
end

return

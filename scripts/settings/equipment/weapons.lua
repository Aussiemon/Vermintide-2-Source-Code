-- chunkname: @scripts/settings/equipment/weapons.lua

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

DamageTypes = {
	ARMOR_PIERCING = 1,
	CLEAVE = 2,
	DAMAGE = 5,
	SPEED = 3,
	STAGGER = 4,
}
Weapons = Weapons or {}

local weapon_template_files_names = dofile("scripts/settings/equipment/honduras_weapon_templates")

for _, dlc in pairs(DLCSettings) do
	if dlc.weapon_template_file_names then
		table.append(weapon_template_files_names, dlc.weapon_template_file_names)
	end
end

for i = 1, #weapon_template_files_names do
	local file_name = weapon_template_files_names[i]
	local weapon_templates = dofile(file_name)

	if weapon_templates then
		for template_name, template in pairs(weapon_templates) do
			local actions = template.actions
			local required_projectile_unit_templates = {}

			template.required_projectile_unit_templates = required_projectile_unit_templates

			for _, sub_actions in pairs(actions) do
				for _, sub_action_data in pairs(sub_actions) do
					local projectile_info = sub_action_data.projectile_info

					if projectile_info then
						local projectile_units_template = projectile_info.projectile_units_template

						if projectile_units_template then
							required_projectile_unit_templates[projectile_units_template] = projectile_info.use_weapon_skin == true
						end
					end
				end
			end

			Weapons[template_name] = template
		end
	end
end

table.clear(weapon_template_files_names)

DAMAGE_TYPES_AOE = {
	plague_face = true,
	poison = true,
	vomit_face = true,
	vomit_ground = true,
	warpfire_face = true,
	warpfire_ground = true,
}

local function kinda_equals(a, b, tolerence)
	return tolerence > math.abs(a - b)
end

local buff_params = {}

local function add_dot(dot_template_name, hit_unit, attacker_unit, damage_source, power_level, source_attacker_unit)
	if ScriptUnit.has_extension(hit_unit, "buff_system") then
		table.clear(buff_params)

		buff_params.attacker_unit = attacker_unit
		buff_params.damage_source = damage_source
		buff_params.power_level = power_level
		buff_params.source_attacker_unit = source_attacker_unit

		local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

		buff_extension:add_buff(dot_template_name, buff_params)
	end
end

local function add_dot_network_synced(dot_template_name, hit_unit, attacker_unit, damage_source, power_level, source_attacker_unit)
	if ScriptUnit.has_extension(hit_unit, "buff_system") then
		table.clear(buff_params)

		buff_params.attacker_unit = attacker_unit
		buff_params.damage_source = damage_source
		buff_params.power_level = power_level
		buff_params.source_attacker_unit = source_attacker_unit

		local buff_system = Managers.state.entity:system("buff_system")

		buff_system:add_buff_synced(hit_unit, dot_template_name, BuffSyncType.All, buff_params)

		if source_attacker_unit then
			local breed = AiUtils.unit_breed(hit_unit)

			if breed and not breed.is_hero then
				AiUtils.alert_unit_of_enemy(hit_unit, source_attacker_unit)
			end
		end
	end
end

Dots = {
	poison_dot = function (dot_template_name, damage_profile, target_index, power_level, target_unit, attacker_unit, hit_zone_name, damage_source, boost_curve_multiplier, is_critical_strike, source_attacker_unit)
		local target_settings

		if damage_profile then
			target_settings = damage_profile.targets[target_index] or damage_profile.default_target
			dot_template_name = dot_template_name or target_settings.dot_template_name or damage_profile.dot_template_name
		end

		if not dot_template_name then
			return false
		end

		local do_dot = true
		local breed = AiUtils.unit_breed(target_unit)
		local armor_override = Unit.get_data(target_unit, "armor")
		local breed_armor = ActionUtils.get_target_armor(hit_zone_name, breed, armor_override)

		if target_settings and breed_armor == 2 then
			local boost_curve = BoostCurves[target_settings.boost_curve_type]
			local predicted_damage = DamageUtils.calculate_damage(DamageOutput, target_unit, attacker_unit, hit_zone_name, power_level, boost_curve, boost_curve_multiplier, is_critical_strike, damage_profile, target_index, false, damage_source)

			if predicted_damage <= 0 then
				do_dot = false
			end
		end

		if do_dot then
			add_dot(dot_template_name, target_unit, attacker_unit, damage_source, power_level, source_attacker_unit)
		end

		return do_dot
	end,
	burning_dot = function (dot_template_name, damage_profile, target_index, power_level, target_unit, attacker_unit, hit_zone_name, damage_source, boost_curve_multiplier, is_critical_strike, source_attacker_unit)
		if damage_profile and not dot_template_name then
			local target_settings = damage_profile.targets[target_index] or damage_profile.default_target

			dot_template_name = target_settings.dot_template_name or damage_profile.dot_template_name
		end

		if not dot_template_name then
			return false
		end

		local breed = AiUtils.unit_breed(target_unit)

		if breed and not breed.is_hero then
			local talent_extension = ScriptUnit.has_extension(attacker_unit, "talent_system") or ScriptUnit.has_extension(source_attacker_unit, "talent_system")

			dot_template_name = talent_extension and talent_extension:has_talent("sienna_adept_infinite_burn") and InfiniteBurnDotLookup[dot_template_name] or dot_template_name

			local attacker_unit_buff_extension = ScriptUnit.has_extension(attacker_unit, "buff_system")

			if attacker_unit_buff_extension then
				attacker_unit_buff_extension:trigger_procs("on_enemy_ignited", dot_template_name, damage_profile, target_index, target_unit, hit_zone_name, damage_source, is_critical_strike)
			end
		end

		add_dot_network_synced(dot_template_name, target_unit, attacker_unit, damage_source, power_level, source_attacker_unit)

		return true
	end,
	slow_debuff = function (dot_template_name, damage_profile, target_index, power_level, target_unit, attacker_unit, hit_zone_name, damage_source, boost_curve_multiplier, is_critical_strike, source_attacker_unit)
		if damage_profile and not dot_template_name then
			local target_settings = damage_profile.targets[target_index] or damage_profile.default_target

			dot_template_name = target_settings.dot_template_name or damage_profile.dot_template_name
		end

		if not dot_template_name then
			return false
		end

		add_dot(dot_template_name, target_unit, attacker_unit, damage_source, power_level, source_attacker_unit)

		return true
	end,
}
DotTypeLookup = DotTypeLookup or {
	aoe_poison_dot = "poison_dot",
	arrow_poison_dot = "poison_dot",
	beam_burning_dot = "burning_dot",
	burning_dot = "burning_dot",
	burning_dot_1tick = "burning_dot",
	burning_dot_3tick = "burning_dot",
	burning_dot_fire_grenade = "burning_dot",
	burning_dot_unchained_push = "burning_dot",
	burning_flamethrower_dot = "burning_dot",
	chaos_zombie_explosion = "poison_dot",
	death_staff_dot = "burning_dot",
	sienna_necromancer_4_3_dot = "burning_dot",
	vs_ratling_gunner_slow = "burning_dot",
	weapon_bleed_dot_dagger = "poison_dot",
	weapon_bleed_dot_maidenguard = "poison_dot",
	weapon_bleed_dot_whc = "poison_dot",
}

DLCUtils.merge("dot_type_lookup", DotTypeLookup)

local checked_templates = {
	bright_wizard = {},
	dwarf_ranger = {},
	empire_soldier = {},
	witch_hunter = {},
	wood_elf = {},
	vs_poison_wind_globadier = {},
	vs_packmaster = {},
	vs_gutter_runner = {},
	vs_ratling_gunner = {},
	vs_warpfire_thrower = {},
	vs_chaos_troll = {},
}

for _, item in pairs(ItemMasterList) do
	local slot_type = item.slot_type

	if slot_type == "melee" or slot_type == "ranged" or slot_type == "grenade" or slot_type == "healthkit" or slot_type == "potion" then
		local template_name = item.template or item.temporary_template

		fassert(Weapons[template_name], "Weapon template [\"%s\"] does not exist!", template_name)

		local careers = item.can_wield

		for i = 1, #careers do
			local career_name = careers[i]
			local career_data = CareerSettings[career_name]
			local profile_name = career_data.profile_name
			local action_names = CareerActionNames[profile_name]

			if checked_templates[profile_name] and not checked_templates[profile_name][template_name] then
				checked_templates[profile_name][template_name] = true

				local template = Weapons[template_name]
				local actions = template.actions

				for j = 1, #action_names do
					local action_name = action_names[j]

					actions[action_name] = ActionTemplates[action_name]
				end
			end
		end
	end
end

local MeleeBuffTypes = MeleeBuffTypes or {
	MELEE_1H = true,
	MELEE_2H = true,
}
local RangedBuffTypes = RangedBuffTypes or {
	RANGED = true,
	RANGED_ABILITY = true,
}
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

	if RangedBuffTypes[item_template.buff_type] and attack_meta_data then
		attack_meta_data.effective_against = attack_meta_data.effective_against or 0
		attack_meta_data.effective_against_charged = attack_meta_data.effective_against_charged or 0
		attack_meta_data.effective_against_combined = bit.bor(attack_meta_data.effective_against, attack_meta_data.effective_against_charged)
	end

	if MeleeBuffTypes[item_template.buff_type] then
		fassert(attack_meta_data, "Missing attack metadata for weapon %s", item_template_name)
		fassert(tap_attack_meta_data, "Missing tap_attack metadata for weapon %s", item_template_name)
		fassert(hold_attack_meta_data, "Missing hold_attack metadata for weapon %s", item_template_name)
		fassert(tap_attack_meta_data.arc, "Missing arc parameter in tap_attack metadata for weapon %s", item_template_name)
		fassert(hold_attack_meta_data.arc, "Missing arc parameter in hold_attack metadata for weapon %s", item_template_name)
	end

	local actions = item_template.actions

	for action_name, sub_actions in pairs(actions) do
		for sub_action_name, sub_action_data in pairs(sub_actions) do
			local lookup_data = {}

			lookup_data.item_template_name = item_template_name
			lookup_data.action_name = action_name
			lookup_data.sub_action_name = sub_action_name
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
						for i = 1, #link_hit_zones do
							local hit_zone_name = link_hit_zones[i]

							link_hit_zones[hit_zone_name] = true
						end
					end
				end
			end
		end
	end
end

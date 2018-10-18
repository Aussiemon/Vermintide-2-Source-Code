require("scripts/settings/attachment_node_linking")
require("scripts/unit_extensions/generic/interactions")
require("scripts/utils/action_assert_funcs")
require("scripts/settings/profiles/career_settings")
require("scripts/helpers/weapon_utils")
dofile("scripts/settings/explosion_templates")
dofile("scripts/settings/equipment/attack_templates")
dofile("scripts/settings/equipment/power_level_templates")
dofile("scripts/settings/equipment/hit_mass_counts")
dofile("scripts/settings/equipment/power_level_settings")
dofile("scripts/settings/equipment/projectiles")
dofile("scripts/settings/equipment/light_weight_projectiles")
require("scripts/settings/action_templates")
dofile("scripts/settings/equipment/1h_swords")
dofile("scripts/settings/equipment/1h_swords_wood_elf")
dofile("scripts/settings/equipment/1h_swords_wizard")
dofile("scripts/settings/equipment/1h_swords_flaming_spell")
dofile("scripts/settings/equipment/1h_dagger_wizard")
dofile("scripts/settings/equipment/1h_swords_shield")
dofile("scripts/settings/equipment/1h_axes_shield")
dofile("scripts/settings/equipment/1h_hammers_shield")
dofile("scripts/settings/equipment/fencing_swords")
dofile("scripts/settings/equipment/dual_wield_swords")
dofile("scripts/settings/equipment/dual_wield_sword_dagger")
dofile("scripts/settings/equipment/dual_wield_daggers")
dofile("scripts/settings/equipment/dual_wield_axes")
dofile("scripts/settings/equipment/1h_falchions")
dofile("scripts/settings/equipment/1h_axes")
dofile("scripts/settings/equipment/1h_hammers")
dofile("scripts/settings/equipment/1h_hammers_wizard")
dofile("scripts/settings/equipment/2h_swords")
dofile("scripts/settings/equipment/2h_swords_wood_elf")
dofile("scripts/settings/equipment/2h_swords_executioner")
dofile("scripts/settings/equipment/2h_axes")
dofile("scripts/settings/equipment/2h_axes_wood_elf")
dofile("scripts/settings/equipment/2h_hammers")
dofile("scripts/settings/equipment/2h_picks")
dofile("scripts/settings/equipment/1h_flails")
dofile("scripts/settings/equipment/halberds")
dofile("scripts/settings/equipment/spears_wood_elf")
dofile("scripts/settings/equipment/shortbows")
dofile("scripts/settings/equipment/shortbows_bodkin")
dofile("scripts/settings/equipment/shortbows_trueflight")
dofile("scripts/settings/equipment/shortbows_hagbane")
dofile("scripts/settings/equipment/longbows")
dofile("scripts/settings/equipment/longbows_bodkin")
dofile("scripts/settings/equipment/longbows_hagbane")
dofile("scripts/settings/equipment/longbows_trueflight")
dofile("scripts/settings/equipment/longbows_empire")
dofile("scripts/settings/equipment/crossbows")
dofile("scripts/settings/equipment/repeating_crossbows")
dofile("scripts/settings/equipment/repeating_crossbows_elf")
dofile("scripts/settings/equipment/bardin_ranger_career_skill")
dofile("scripts/settings/equipment/kerillian_waywatcher_career_skill")
dofile("scripts/settings/equipment/sienna_scholar_career_skill")
dofile("scripts/settings/equipment/victor_bountyhunter_career_skill")
dofile("scripts/settings/equipment/brace_of_pistols")
dofile("scripts/settings/equipment/brace_of_drake_pistols")
dofile("scripts/settings/equipment/repeating_pistols")
dofile("scripts/settings/equipment/brace_of_repeating_pistols")
dofile("scripts/settings/equipment/blunderbusses")
dofile("scripts/settings/equipment/grudge_raker")
dofile("scripts/settings/equipment/handguns")
dofile("scripts/settings/equipment/repeating_handguns")
dofile("scripts/settings/equipment/drakegun")
dofile("scripts/settings/equipment/staff_flamethrower")
dofile("scripts/settings/equipment/staff_spark_spear")
dofile("scripts/settings/equipment/staff_fireball_fireball")
dofile("scripts/settings/equipment/staff_fireball_geiser")
dofile("scripts/settings/equipment/staff_slam_geiser")
dofile("scripts/settings/equipment/staff_blast_beam")
dofile("scripts/settings/equipment/staff_firefly_flamewave")
dofile("scripts/settings/equipment/potions")
dofile("scripts/settings/equipment/scrolls")
dofile("scripts/settings/equipment/first_aid_kits")
dofile("scripts/settings/equipment/healing_draught")
dofile("scripts/settings/equipment/sacks")
dofile("scripts/settings/equipment/statues")
dofile("scripts/settings/equipment/barrels")
dofile("scripts/settings/equipment/grenades")
dofile("scripts/settings/equipment/torches")
dofile("scripts/settings/equipment/grimoire")
dofile("scripts/settings/equipment/door_sticks")
dofile("scripts/settings/equipment/packmaster_claw")

DAMAGE_TYPES_AOE = {
	warpfire_face = true,
	vomit_face = true,
	vomit_ground = true,
	poison = true,
	globadier_gas_dot = true,
	plague_face = true,
	warpfire_ground = true
}
Weapons = Weapons or {}
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

		add_dot(dot_template_name, target_unit, attacker_unit, damage_source, power_level)

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
	burning_dot = "burning_dot",
	burning_3W_dot = "burning_dot",
	corpse_explosion_default = "poison_dot",
	arrow_poison_dot = "poison_dot",
	beam_burning_dot = "burning_dot",
	weapon_bleed_dot_test = "poison_dot",
	burning_1W_dot = "burning_dot",
	burning_flamethrower_dot = "burning_dot",
	aoe_poison_dot = "poison_dot",
	slow_grenade_slow = "slow_debuff",
	chaos_zombie_explosion = "poison_dot"
}
local checked_templates = {
	bright_wizard = {},
	dwarf_ranger = {},
	empire_soldier = {},
	witch_hunter = {},
	wood_elf = {}
}

for item_name, item in pairs(ItemMasterList) do
	local slot_type = item.slot_type

	if slot_type == "melee" or slot_type == "ranged" or slot_type == "grenade" or slot_type == "healthkit" or slot_type == "potion" then
		local template_name = item.template or item.temporary_template
		local careers = item.can_wield

		for i = 1, #careers, 1 do
			local career_name = careers[i]
			local career_data = CareerSettings[career_name]
			local profile_name = career_data.profile_name
			local action_names = CareerActionNames[profile_name]

			if not checked_templates[profile_name][template_name] then
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
		end
	end
end

return

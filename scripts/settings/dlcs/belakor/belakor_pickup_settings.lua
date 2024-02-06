-- chunkname: @scripts/settings/dlcs/belakor/belakor_pickup_settings.lua

require("scripts/settings/dlcs/belakor/belakor_balancing")

local settings = DLCSettings.belakor

local function can_spawn_deus_belakor_unit(params, is_debug_spawn)
	if Managers.mechanism:current_mechanism_name() == "deus" then
		local mechanism = Managers.mechanism:game_mechanism()
		local deus_run_controller = mechanism:get_deus_run_controller()

		if not deus_run_controller then
			return false
		end

		local current_node = deus_run_controller:get_current_node()
		local theme = current_node.theme

		return theme == "belakor" or current_node.base_level == "arena_belakor"
	else
		return false
	end
end

local function can_spawn_belakor_locus(params, is_debug_spawn)
	if Managers.mechanism:current_mechanism_name() == "deus" then
		local mechanism = Managers.mechanism:game_mechanism()
		local deus_run_controller = mechanism:get_deus_run_controller()

		if not deus_run_controller then
			return false
		end

		return deus_run_controller:can_spawn_belakor_locus()
	else
		return false
	end
end

local function check_if_buff_is_active(pickup_settings, unit)
	local buff_extension = ScriptUnit.extension(unit, "buff_system")
	local potion_name = pickup_settings.buff_name_for_check or pickup_settings.granted_buff
	local has_normal_buff = buff_extension:has_buff_type(potion_name)
	local has_increased_buff = buff_extension:has_buff_type(potion_name .. "_increased")
	local has_buff = has_normal_buff or has_increased_buff

	return not has_buff
end

local function check_if_ability_is_not_ready(pickup_settings, unit)
	local career_extension = ScriptUnit.extension(unit, "career_system")
	local percentage = career_extension:current_ability_cooldown_percentage()

	return percentage > 0
end

settings.pickups = {
	orb = {
		test_orb_01 = {
			debug_pickup_category = "orbs",
			granted_buff = "orb_test_buff_01",
			item_name = "test_orb_01",
			spawn_weighting = 1e-06,
			type = "orb_pickup_unit",
			unit_name = "units/props/deus_orb/deus_orb_01",
			unit_template_name = "orb_pickup_unit",
		},
		health_orb = {
			debug_pickup_category = "orbs",
			granted_buff = "health_orb",
			item_name = "health_orb",
			spawn_weighting = 1e-06,
			type = "orb_pickup_unit",
			unit_name = "units/props/deus_orb/deus_orb_01",
			unit_template_name = "orb_pickup_unit",
			can_pickup_orb = function (pickup_settings, unit)
				local health_extension = ScriptUnit.extension(unit, "health_system")
				local max_health = health_extension:get_max_health()
				local current_health = health_extension:current_health()

				if current_health < max_health then
					return true
				end
			end,
		},
		static_charge = {
			debug_pickup_category = "orbs",
			granted_buff = "static_charge",
			item_name = "static_charge",
			spawn_weighting = 1e-06,
			type = "orb_pickup_unit",
			unit_name = "units/props/deus_orb/deus_orb_01",
			unit_template_name = "orb_pickup_unit",
			can_pickup_orb = check_if_buff_is_active,
		},
		friendly_murderer_potion_orb = {
			debug_pickup_category = "orbs",
			granted_buff = "friendly_murderer_potion",
			item_name = "friendly_murderer_potion",
			spawn_weighting = 1e-06,
			type = "orb_pickup_unit",
			unit_name = "units/props/deus_orb/deus_orb_01",
			unit_template_name = "orb_pickup_unit",
			can_pickup_orb = check_if_buff_is_active,
		},
		hold_my_beer_potion_orb = {
			debug_pickup_category = "orbs",
			granted_buff = "hold_my_beer_potion",
			item_name = "hold_my_beer_potion_orb",
			spawn_weighting = 1e-06,
			type = "orb_pickup_unit",
			unit_name = "units/props/deus_orb/deus_orb_01",
			unit_template_name = "orb_pickup_unit",
			can_pickup_orb = check_if_buff_is_active,
		},
		killer_in_the_shadows_potion_orb = {
			debug_pickup_category = "orbs",
			granted_buff = "killer_in_the_shadows_potion",
			item_name = "killer_in_the_shadows_potion_orb",
			spawn_weighting = 1e-06,
			type = "orb_pickup_unit",
			unit_name = "units/props/deus_orb/deus_orb_01",
			unit_template_name = "orb_pickup_unit",
			can_pickup_orb = check_if_buff_is_active,
		},
		liquid_bravado_potion_orb = {
			debug_pickup_category = "orbs",
			granted_buff = "liquid_bravado_potion",
			item_name = "liquid_bravado_potion_orb",
			spawn_weighting = 1e-06,
			type = "orb_pickup_unit",
			unit_name = "units/props/deus_orb/deus_orb_01",
			unit_template_name = "orb_pickup_unit",
			can_pickup_orb = check_if_buff_is_active,
		},
		moot_milk_potion_orb = {
			debug_pickup_category = "orbs",
			granted_buff = "moot_milk_potion",
			item_name = "moot_milk_potion_orb",
			spawn_weighting = 1e-06,
			type = "orb_pickup_unit",
			unit_name = "units/props/deus_orb/deus_orb_01",
			unit_template_name = "orb_pickup_unit",
			can_pickup_orb = check_if_buff_is_active,
		},
		pockets_full_of_bombs_potion_orb = {
			debug_pickup_category = "orbs",
			granted_buff = "pockets_full_of_bombs_potion",
			item_name = "pockets_full_of_bombs_potion_orb",
			spawn_weighting = 1e-06,
			type = "orb_pickup_unit",
			unit_name = "units/props/deus_orb/deus_orb_01",
			unit_template_name = "orb_pickup_unit",
			can_pickup_orb = check_if_buff_is_active,
		},
		poison_proof_potion_orb = {
			debug_pickup_category = "orbs",
			granted_buff = "poison_proof_potion",
			item_name = "poison_proof_potion_orb",
			spawn_weighting = 1e-06,
			type = "orb_pickup_unit",
			unit_name = "units/props/deus_orb/deus_orb_01",
			unit_template_name = "orb_pickup_unit",
			can_pickup_orb = check_if_buff_is_active,
		},
		vampiric_draught_potion_orb = {
			debug_pickup_category = "orbs",
			granted_buff = "vampiric_draught_potion",
			item_name = "vampiric_draught_potion_orb",
			spawn_weighting = 1e-06,
			type = "orb_pickup_unit",
			unit_name = "units/props/deus_orb/deus_orb_01",
			unit_template_name = "orb_pickup_unit",
			can_pickup_orb = check_if_buff_is_active,
		},
		damage_boost_potion_orb = {
			buff_name_for_check = "potion_armor_penetration_buff",
			debug_pickup_category = "orbs",
			granted_buff = "damage_boost_potion",
			item_name = "damage_boost_potion_orb",
			spawn_weighting = 1e-06,
			type = "orb_pickup_unit",
			unit_name = "units/props/deus_orb/deus_orb_01",
			unit_template_name = "orb_pickup_unit",
			can_pickup_orb = check_if_buff_is_active,
		},
		speed_boost_potion_orb = {
			buff_name_for_check = "potion_movement_buff",
			debug_pickup_category = "orbs",
			granted_buff = "speed_boost_potion",
			item_name = "speed_boost_potion_orb",
			spawn_weighting = 1e-06,
			type = "orb_pickup_unit",
			unit_name = "units/props/deus_orb/deus_orb_01",
			unit_template_name = "orb_pickup_unit",
			can_pickup_orb = check_if_buff_is_active,
		},
		cooldown_reduction_potion_orb = {
			buff_name_for_check = "potion_cooldown_reduction_buff",
			debug_pickup_category = "orbs",
			granted_buff = "cooldown_reduction_potion",
			item_name = "cooldown_reduction_potion_orb",
			spawn_weighting = 1e-06,
			type = "orb_pickup_unit",
			unit_name = "units/props/deus_orb/deus_orb_01",
			unit_template_name = "orb_pickup_unit",
			can_pickup_orb = check_if_buff_is_active,
		},
		protection_orb = {
			debug_pickup_category = "orbs",
			granted_buff = "protection_orb",
			item_name = "protection_orb",
			spawn_weighting = 1e-06,
			type = "orb_pickup_unit",
			unit_name = "units/props/deus_orb/deus_orb_01",
			unit_template_name = "orb_pickup_unit",
			can_pickup_orb = check_if_buff_is_active,
		},
		ability_cooldown_reduction_orb = {
			debug_pickup_category = "orbs",
			granted_buff = "ability_cooldown_reduction_orb",
			item_name = "ability_cooldown_reduction_orb",
			spawn_weighting = 1e-06,
			type = "orb_pickup_unit",
			unit_name = "units/props/deus_orb/deus_orb_01",
			unit_template_name = "orb_pickup_unit",
			can_pickup_orb = check_if_ability_is_not_ready,
		},
	},
	deus_02 = {
		deus_02 = {
			debug_pickup_category = "deus",
			hud_description = "deus_belakor_locus_hud_desc",
			item_description = "deus_belakor_locus_item_desc",
			item_name = "deus_belakor_locus",
			spawn_weighting = 1e-06,
			type = "deus_02",
			unit_name = "units/props/blk/blk_locus_01",
			unit_template_name = "deus_belakor_locus",
			can_spawn_func = can_spawn_belakor_locus,
			additional_data = {
				pickup_system = {
					pickup_name = "deus_02",
				},
				death_system = {
					death_reaction_template = "level_object",
					is_husk = true,
				},
				hit_reaction_system = {
					hit_reaction_template = "level_object",
					is_husk = true,
				},
			},
			additional_data_husk = {
				pickup_system = {
					pickup_name = "deus_02",
				},
				death_system = {
					death_reaction_template = "level_object",
					is_husk = true,
				},
				hit_reaction_system = {
					hit_reaction_template = "level_object",
					is_husk = true,
				},
			},
		},
	},
	deus_04 = {
		deus_04 = {
			debug_pickup_category = "deus",
			spawn_weighting = 1e-06,
			type = "deus_04",
			unit_name = "units/props/blk/blk_curse_shadow_homing_skulls_spawner_01",
			unit_template_name = "shadow_homing_skulls_spawner",
			can_spawn_func = can_spawn_deus_belakor_unit,
		},
	},
	belakor_crystal = {
		belakor_crystal = {
			debug_pickup_category = "deus",
			hud_description = "belakor_crystal_hud_desc",
			individual_pickup = false,
			item_description = "belakor_crystal_item_desc",
			item_name = "belakor_crystal",
			only_once = true,
			slot_name = "slot_level_event",
			spawn_weighting = 1e-06,
			type = "inventory_item",
			unit_name = "units/weapons/player/pup_belakor_crystal/pup_belakor_crystal",
			unit_template_name = "belakor_crystal",
			wield_on_pickup = true,
		},
	},
}

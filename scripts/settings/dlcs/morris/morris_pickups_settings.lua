-- chunkname: @scripts/settings/dlcs/morris/morris_pickups_settings.lua

local settings = DLCSettings.morris

local function can_spawn_deus_pickup(params, is_debug_spawn)
	return Managers.mechanism:current_mechanism_name() == "deus"
end

local material_settings_templates = {
	friendly_murderer_potion = {
		theme_index_01 = {
			type = "scalar",
			value = 1,
		},
	},
	killer_in_the_shadows_potion = {
		theme_index_01 = {
			type = "scalar",
			value = 2,
		},
	},
	pockets_full_of_bombs_potion = {
		theme_index_01 = {
			type = "scalar",
			value = 3,
		},
	},
	liquid_bravado_potion = {
		theme_index_01 = {
			type = "scalar",
			value = 4,
		},
	},
	poison_proof_potion = {
		theme_index_01 = {
			type = "scalar",
			value = 6,
		},
	},
	vampiric_draught_potion = {
		theme_index_01 = {
			type = "scalar",
			value = 7,
		},
	},
	hold_my_beer_potion = {
		theme_index_01 = {
			type = "scalar",
			value = 8,
		},
	},
	moot_milk_potion = {
		theme_index_01 = {
			type = "scalar",
			value = 9,
		},
	},
}

settings.pickups = {
	deus_weapon_chest = {
		deus_weapon_chest = {
			debug_pickup_category = "deus",
			hud_description = "deus_weapon_chest_hud_desc",
			item_description = "deus_weapon_chest_item_desc",
			item_name = "deus_weapon_chest",
			spawn_weighting = 1e-06,
			type = "deus_weapon_chest",
			unit_name = "units/props/inn/deus/deus_chest_01",
			unit_template_name = "deus_weapon_chest",
			can_spawn_func = can_spawn_deus_pickup,
		},
	},
	deus_soft_currency = {
		deus_soft_currency = {
			debug_pickup_category = "deus",
			disallow_bot_pickup = true,
			hud_description = "deus_soft_currency_item_desc",
			item_description = "deus_soft_currency_item_desc",
			item_name = "deus_soft_currency",
			only_once = true,
			slot_name = "infinite_slot",
			spawn_weighting = 1,
			type = "deus_soft_currency",
			unit_name = "units/props/deus_pickups/deus_loot_pyramide_01",
			unit_template_name = "pickup_unit",
			on_pick_up_func = function (world, interactor_unit, is_server, interactable_unit)
				local game_mode = Managers.state.game_mode:game_mode()

				if game_mode.on_picked_up_soft_currency then
					game_mode:on_picked_up_soft_currency(interactable_unit, interactor_unit)
				end

				local player = Managers.player:local_player()

				Managers.state.event:trigger("player_pickup_deus_soft_currency", player)
			end,
			can_spawn_func = can_spawn_deus_pickup,
		},
	},
	deus_cursed_chest = {
		deus_cursed_chest = {
			debug_pickup_category = "deus",
			hud_description = "deus_cursed_chest_hud_desc",
			item_description = "deus_cursed_chest_item_desc",
			item_name = "deus_cursed_chest",
			spawn_weighting = 1e-06,
			type = "deus_cursed_chest",
			unit_name = "units/props/inn/deus/deus_cursed_chest",
			unit_template_name = "deus_cursed_chest",
			can_spawn_func = can_spawn_deus_pickup,
		},
	},
	level_events = {
		deus_relic_01 = {
			debug_pickup_category = "level_event",
			hud_description = "deus_relic_01_hud_desc",
			individual_pickup = false,
			item_description = "deus_relic_01_hud_desc",
			item_name = "wpn_deus_relic_01",
			only_once = true,
			slot_name = "slot_level_event",
			spawn_weighting = 1e-06,
			type = "inventory_item",
			unit_name = "units/weapons/player/pup_deus_relic_01/pup_deus_relic_01",
			unit_template_name = "deus_relic",
			wield_on_pickup = true,
			can_spawn_func = can_spawn_deus_pickup,
		},
		deus_rally_flag = {
			bots_mule_pickup = true,
			consumable_item = false,
			debug_pickup_category = "level_event",
			dupable = true,
			hud_description = "deus_rally_flag_01_hud_desc",
			individual_pickup = false,
			item_description = "deus_rally_flag_01_item_desc",
			item_name = "deus_rally_flag",
			local_pickup_sound = true,
			only_once = true,
			pickup_sound_event = "pickup_medkit",
			slot_name = "slot_healthkit",
			spawn_weighting = 0.2,
			type = "inventory_item",
			unit_name = "units/weapons/player/pup_deus_folded_rally_flag_01/pup_deus_folded_rally_flag_01",
			can_spawn_func = can_spawn_deus_pickup,
		},
		tiny_explosive_barrel = {
			additional_data_func = "explosive_barrel",
			debug_pickup_category = "level_event",
			hud_description = "explosive_barrel",
			individual_pickup = false,
			item_description = "explosive_barrel",
			item_name = "explosive_barrel",
			only_once = true,
			slot_name = "slot_level_event",
			spawn_weighting = 1,
			type = "explosive_inventory_item",
			unit_name = "units/weapons/player/pup_explosive_barrel/pup_tiny_explosive_barrel_01",
			unit_template_name = "explosive_pickup_projectile_unit",
			wield_on_pickup = true,
		},
	},
	deus_potions = {
		liquid_bravado_potion = {
			bots_mule_pickup = true,
			consumable_item = true,
			debug_pickup_category = "consumables",
			dupable = true,
			hud_description = "potion_liquid_bravado_01_hud_desc",
			individual_pickup = false,
			item_description = "potion_liquid_bravado_01_item_desc",
			item_name = "potion_liquid_bravado_01",
			local_pickup_sound = true,
			only_once = true,
			pickup_sound_event = "pickup_potion",
			slot_name = "slot_potion",
			spawn_weighting = 0.2,
			type = "inventory_item",
			unit_name = "units/weapons/player/pup_deus_potion_01/pup_deus_potion_01",
			can_spawn_func = can_spawn_deus_pickup,
			material_settings = material_settings_templates.liquid_bravado_potion,
		},
		vampiric_draught_potion = {
			bots_mule_pickup = true,
			consumable_item = true,
			debug_pickup_category = "consumables",
			dupable = true,
			hud_description = "potion_vampiric_draught_01_hud_desc",
			individual_pickup = false,
			item_description = "potion_vampiric_draught_01_item_desc",
			item_name = "potion_vampiric_draught_01",
			local_pickup_sound = true,
			only_once = true,
			pickup_sound_event = "pickup_potion",
			slot_name = "slot_potion",
			spawn_weighting = 0.2,
			type = "inventory_item",
			unit_name = "units/weapons/player/pup_deus_potion_01/pup_deus_potion_01",
			can_spawn_func = can_spawn_deus_pickup,
			material_settings = material_settings_templates.vampiric_draught_potion,
		},
		moot_milk_potion = {
			bots_mule_pickup = true,
			consumable_item = true,
			debug_pickup_category = "consumables",
			dupable = true,
			hud_description = "potion_moot_milk_01_hud_desc",
			individual_pickup = false,
			item_description = "potion_moot_milk_01_item_desc",
			item_name = "potion_moot_milk_01",
			local_pickup_sound = true,
			only_once = true,
			pickup_sound_event = "pickup_potion",
			slot_name = "slot_potion",
			spawn_weighting = 0.2,
			type = "inventory_item",
			unit_name = "units/weapons/player/pup_deus_potion_01/pup_deus_potion_01",
			can_spawn_func = can_spawn_deus_pickup,
			material_settings = material_settings_templates.moot_milk_potion,
		},
		friendly_murderer_potion = {
			bots_mule_pickup = true,
			consumable_item = true,
			debug_pickup_category = "consumables",
			dupable = true,
			hud_description = "potion_friendly_murderer_01_hud_desc",
			individual_pickup = false,
			item_description = "potion_friendly_murderer_01_item_desc",
			item_name = "potion_friendly_murderer_01",
			local_pickup_sound = true,
			only_once = true,
			pickup_sound_event = "pickup_potion",
			slot_name = "slot_potion",
			spawn_weighting = 0.2,
			type = "inventory_item",
			unit_name = "units/weapons/player/pup_deus_potion_01/pup_deus_potion_01",
			can_spawn_func = can_spawn_deus_pickup,
			material_settings = material_settings_templates.friendly_murderer_potion,
		},
		killer_in_the_shadows_potion = {
			bots_mule_pickup = true,
			consumable_item = true,
			debug_pickup_category = "consumables",
			dupable = true,
			hud_description = "potion_killer_in_the_shadows_01_hud_desc",
			individual_pickup = false,
			item_description = "potion_killer_in_the_shadows_01_item_desc",
			item_name = "potion_killer_in_the_shadows_01",
			local_pickup_sound = true,
			only_once = true,
			pickup_sound_event = "pickup_potion",
			slot_name = "slot_potion",
			spawn_weighting = 0.2,
			type = "inventory_item",
			unit_name = "units/weapons/player/pup_deus_potion_01/pup_deus_potion_01",
			can_spawn_func = can_spawn_deus_pickup,
			material_settings = material_settings_templates.killer_in_the_shadows_potion,
		},
		pockets_full_of_bombs_potion = {
			bots_mule_pickup = true,
			consumable_item = true,
			debug_pickup_category = "consumables",
			dupable = true,
			hud_description = "potion_pockets_full_of_bombs_01_hud_desc",
			individual_pickup = false,
			item_description = "potion_pockets_full_of_bombs_01_item_desc",
			item_name = "potion_pockets_full_of_bombs_01",
			local_pickup_sound = true,
			only_once = true,
			pickup_sound_event = "pickup_potion",
			slot_name = "slot_potion",
			spawn_weighting = 0.1,
			type = "inventory_item",
			unit_name = "units/weapons/player/pup_deus_potion_01/pup_deus_potion_01",
			can_spawn_func = can_spawn_deus_pickup,
			material_settings = material_settings_templates.pockets_full_of_bombs_potion,
		},
		hold_my_beer_potion = {
			bots_mule_pickup = true,
			consumable_item = true,
			debug_pickup_category = "consumables",
			dupable = true,
			hud_description = "potion_hold_my_beer_01_hud_desc",
			individual_pickup = false,
			item_description = "potion_hold_my_beer_01_item_desc",
			item_name = "potion_hold_my_beer_01",
			local_pickup_sound = true,
			only_once = true,
			pickup_sound_event = "pickup_potion",
			slot_name = "slot_potion",
			spawn_weighting = 0.2,
			type = "inventory_item",
			unit_name = "units/weapons/player/pup_deus_potion_01/pup_deus_potion_01",
			can_spawn_func = can_spawn_deus_pickup,
			material_settings = material_settings_templates.hold_my_beer_potion,
		},
		poison_proof_potion = {
			bots_mule_pickup = true,
			consumable_item = true,
			debug_pickup_category = "consumables",
			dupable = true,
			hud_description = "potion_poison_proof_01_hud_desc",
			individual_pickup = false,
			item_description = "potion_poison_proof_01_item_desc",
			item_name = "potion_poison_proof_01",
			local_pickup_sound = true,
			only_once = true,
			pickup_sound_event = "pickup_potion",
			slot_name = "slot_potion",
			spawn_weighting = 0.2,
			type = "inventory_item",
			unit_name = "units/weapons/player/pup_deus_potion_01/pup_deus_potion_01",
			can_spawn_func = can_spawn_deus_pickup,
			material_settings = material_settings_templates.poison_proof_potion,
		},
	},
	grenades = {
		holy_hand_grenade = {
			bots_mule_pickup = true,
			consumable_item = true,
			debug_pickup_category = "grenades",
			dupable = true,
			hud_description = "holy_hand_grenade_desc",
			individual_pickup = false,
			item_description = "holy_hand_grenade_desc",
			item_name = "holy_hand_grenade",
			local_pickup_sound = true,
			only_once = true,
			pickup_sound_event = "pickup_grenade",
			slot_name = "slot_grenade",
			spawn_weighting = 0.8,
			type = "inventory_item",
			unit_name = "units/weapons/player/pup_grenades/pup_holy_hand_grenade_01_t1",
		},
	},
}
settings.pickup_system_extension_update = {
	"DeusChestExtension",
}
settings.loot_rat_pickups = {
	deus = {
		all_ammo_small = 6,
		fire_grenade_t2 = 2,
		first_aid_kit = 6,
		frag_grenade_t2 = 2,
		healing_draught = 6,
	},
}
settings.bardin_scavenger_custom_potions = {
	deus = {},
}

local loot_rat_deus_potion_amount = 1
local deus_loot_rat_pickups = settings.loot_rat_pickups.deus
local bardin_scavenger_custom_potions = settings.bardin_scavenger_custom_potions.deus

for deus_potion_name, _ in pairs(settings.pickups.deus_potions) do
	deus_loot_rat_pickups[deus_potion_name] = loot_rat_deus_potion_amount
	bardin_scavenger_custom_potions[#bardin_scavenger_custom_potions + 1] = deus_potion_name
end

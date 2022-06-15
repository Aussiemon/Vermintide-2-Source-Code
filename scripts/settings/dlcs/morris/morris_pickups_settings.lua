local settings = DLCSettings.morris

local function can_spawn_deus_pickup(params, is_debug_spawn)
	return Managers.mechanism:current_mechanism_name() == "deus"
end

local material_settings_templates = {
	friendly_murderer_potion = {
		theme_index_01 = {
			value = 1,
			type = "scalar"
		}
	},
	killer_in_the_shadows_potion = {
		theme_index_01 = {
			value = 2,
			type = "scalar"
		}
	},
	pockets_full_of_bombs_potion = {
		theme_index_01 = {
			value = 3,
			type = "scalar"
		}
	},
	liquid_bravado_potion = {
		theme_index_01 = {
			value = 4,
			type = "scalar"
		}
	},
	poison_proof_potion = {
		theme_index_01 = {
			value = 6,
			type = "scalar"
		}
	},
	vampiric_draught_potion = {
		theme_index_01 = {
			value = 7,
			type = "scalar"
		}
	},
	hold_my_beer_potion = {
		theme_index_01 = {
			value = 8,
			type = "scalar"
		}
	},
	moot_milk_potion = {
		theme_index_01 = {
			value = 9,
			type = "scalar"
		}
	}
}
settings.pickups = {
	deus_weapon_chest = {
		deus_weapon_chest = {
			type = "deus_weapon_chest",
			item_description = "deus_weapon_chest_item_desc",
			spawn_weighting = 1e-06,
			debug_pickup_category = "deus",
			item_name = "deus_weapon_chest",
			unit_name = "units/props/inn/deus/deus_chest_01",
			unit_template_name = "deus_weapon_chest",
			hud_description = "deus_weapon_chest_hud_desc",
			can_spawn_func = can_spawn_deus_pickup
		}
	},
	deus_soft_currency = {
		deus_soft_currency = {
			only_once = true,
			slot_name = "infinite_slot",
			item_description = "deus_soft_currency_item_desc",
			spawn_weighting = 1,
			debug_pickup_category = "deus",
			type = "deus_soft_currency",
			item_name = "deus_soft_currency",
			unit_name = "units/props/deus_pickups/deus_loot_pyramide_01",
			unit_template_name = "pickup_unit",
			hud_description = "deus_soft_currency_item_desc",
			disallow_bot_pickup = true,
			on_pick_up_func = function (world, interactor_unit, is_server, interactable_unit)
				local game_mode = Managers.state.game_mode:game_mode()

				if game_mode.on_picked_up_soft_currency then
					game_mode:on_picked_up_soft_currency(interactable_unit, interactor_unit)
				end

				local player = Managers.player:local_player()

				Managers.state.event:trigger("player_pickup_deus_soft_currency", player)
			end,
			can_spawn_func = can_spawn_deus_pickup
		}
	},
	deus_cursed_chest = {
		deus_cursed_chest = {
			type = "deus_cursed_chest",
			item_description = "deus_cursed_chest_item_desc",
			spawn_weighting = 1e-06,
			debug_pickup_category = "deus",
			item_name = "deus_cursed_chest",
			unit_name = "units/props/inn/deus/deus_cursed_chest",
			unit_template_name = "deus_cursed_chest",
			hud_description = "deus_cursed_chest_hud_desc",
			can_spawn_func = can_spawn_deus_pickup
		}
	},
	level_events = {
		deus_relic_01 = {
			only_once = true,
			individual_pickup = false,
			type = "inventory_item",
			item_description = "deus_relic_01_hud_desc",
			spawn_weighting = 1e-06,
			debug_pickup_category = "level_event",
			slot_name = "slot_level_event",
			item_name = "wpn_deus_relic_01",
			unit_name = "units/weapons/player/pup_deus_relic_01/pup_deus_relic_01",
			unit_template_name = "deus_relic",
			wield_on_pickup = true,
			hud_description = "deus_relic_01_hud_desc",
			can_spawn_func = can_spawn_deus_pickup
		},
		deus_rally_flag = {
			only_once = true,
			individual_pickup = false,
			slot_name = "slot_healthkit",
			item_description = "deus_rally_flag_01_item_desc",
			spawn_weighting = 0.2,
			debug_pickup_category = "level_event",
			dupable = true,
			item_name = "deus_rally_flag",
			unit_name = "units/weapons/player/pup_deus_folded_rally_flag_01/pup_deus_folded_rally_flag_01",
			bots_mule_pickup = true,
			type = "inventory_item",
			consumable_item = false,
			local_pickup_sound = true,
			hud_description = "deus_rally_flag_01_hud_desc",
			pickup_sound_event = "pickup_medkit",
			can_spawn_func = can_spawn_deus_pickup
		},
		tiny_explosive_barrel = {
			only_once = true,
			individual_pickup = false,
			type = "explosive_inventory_item",
			item_description = "explosive_barrel",
			spawn_weighting = 1,
			debug_pickup_category = "level_event",
			slot_name = "slot_level_event",
			item_name = "explosive_barrel",
			unit_name = "units/weapons/player/pup_explosive_barrel/pup_tiny_explosive_barrel_01",
			additional_data_func = "explosive_barrel",
			unit_template_name = "explosive_pickup_projectile_unit",
			wield_on_pickup = true,
			hud_description = "explosive_barrel"
		}
	},
	deus_potions = {
		liquid_bravado_potion = {
			spawn_weighting = 0.2,
			only_once = true,
			type = "inventory_item",
			pickup_sound_event = "pickup_potion",
			debug_pickup_category = "consumables",
			slot_name = "slot_potion",
			unit_name = "units/weapons/player/pup_deus_potion_01/pup_deus_potion_01",
			hud_description = "potion_liquid_bravado_01_hud_desc",
			bots_mule_pickup = true,
			individual_pickup = false,
			item_description = "potion_liquid_bravado_01_item_desc",
			dupable = true,
			item_name = "potion_liquid_bravado_01",
			consumable_item = true,
			local_pickup_sound = true,
			can_spawn_func = can_spawn_deus_pickup,
			material_settings = material_settings_templates.liquid_bravado_potion
		},
		vampiric_draught_potion = {
			spawn_weighting = 0.2,
			only_once = true,
			type = "inventory_item",
			pickup_sound_event = "pickup_potion",
			debug_pickup_category = "consumables",
			slot_name = "slot_potion",
			unit_name = "units/weapons/player/pup_deus_potion_01/pup_deus_potion_01",
			hud_description = "potion_vampiric_draught_01_hud_desc",
			bots_mule_pickup = true,
			individual_pickup = false,
			item_description = "potion_vampiric_draught_01_item_desc",
			dupable = true,
			item_name = "potion_vampiric_draught_01",
			consumable_item = true,
			local_pickup_sound = true,
			can_spawn_func = can_spawn_deus_pickup,
			material_settings = material_settings_templates.vampiric_draught_potion
		},
		moot_milk_potion = {
			spawn_weighting = 0.2,
			only_once = true,
			type = "inventory_item",
			pickup_sound_event = "pickup_potion",
			debug_pickup_category = "consumables",
			slot_name = "slot_potion",
			unit_name = "units/weapons/player/pup_deus_potion_01/pup_deus_potion_01",
			hud_description = "potion_moot_milk_01_hud_desc",
			bots_mule_pickup = true,
			individual_pickup = false,
			item_description = "potion_moot_milk_01_item_desc",
			dupable = true,
			item_name = "potion_moot_milk_01",
			consumable_item = true,
			local_pickup_sound = true,
			can_spawn_func = can_spawn_deus_pickup,
			material_settings = material_settings_templates.moot_milk_potion
		},
		friendly_murderer_potion = {
			spawn_weighting = 0.2,
			only_once = true,
			type = "inventory_item",
			pickup_sound_event = "pickup_potion",
			debug_pickup_category = "consumables",
			slot_name = "slot_potion",
			unit_name = "units/weapons/player/pup_deus_potion_01/pup_deus_potion_01",
			hud_description = "potion_friendly_murderer_01_hud_desc",
			bots_mule_pickup = true,
			individual_pickup = false,
			item_description = "potion_friendly_murderer_01_item_desc",
			dupable = true,
			item_name = "potion_friendly_murderer_01",
			consumable_item = true,
			local_pickup_sound = true,
			can_spawn_func = can_spawn_deus_pickup,
			material_settings = material_settings_templates.friendly_murderer_potion
		},
		killer_in_the_shadows_potion = {
			spawn_weighting = 0.2,
			only_once = true,
			type = "inventory_item",
			pickup_sound_event = "pickup_potion",
			debug_pickup_category = "consumables",
			slot_name = "slot_potion",
			unit_name = "units/weapons/player/pup_deus_potion_01/pup_deus_potion_01",
			hud_description = "potion_killer_in_the_shadows_01_hud_desc",
			bots_mule_pickup = true,
			individual_pickup = false,
			item_description = "potion_killer_in_the_shadows_01_item_desc",
			dupable = true,
			item_name = "potion_killer_in_the_shadows_01",
			consumable_item = true,
			local_pickup_sound = true,
			can_spawn_func = can_spawn_deus_pickup,
			material_settings = material_settings_templates.killer_in_the_shadows_potion
		},
		pockets_full_of_bombs_potion = {
			spawn_weighting = 0.1,
			only_once = true,
			type = "inventory_item",
			pickup_sound_event = "pickup_potion",
			debug_pickup_category = "consumables",
			slot_name = "slot_potion",
			unit_name = "units/weapons/player/pup_deus_potion_01/pup_deus_potion_01",
			hud_description = "potion_pockets_full_of_bombs_01_hud_desc",
			bots_mule_pickup = true,
			individual_pickup = false,
			item_description = "potion_pockets_full_of_bombs_01_item_desc",
			dupable = true,
			item_name = "potion_pockets_full_of_bombs_01",
			consumable_item = true,
			local_pickup_sound = true,
			can_spawn_func = can_spawn_deus_pickup,
			material_settings = material_settings_templates.pockets_full_of_bombs_potion
		},
		hold_my_beer_potion = {
			spawn_weighting = 0.2,
			only_once = true,
			type = "inventory_item",
			pickup_sound_event = "pickup_potion",
			debug_pickup_category = "consumables",
			slot_name = "slot_potion",
			unit_name = "units/weapons/player/pup_deus_potion_01/pup_deus_potion_01",
			hud_description = "potion_hold_my_beer_01_hud_desc",
			bots_mule_pickup = true,
			individual_pickup = false,
			item_description = "potion_hold_my_beer_01_item_desc",
			dupable = true,
			item_name = "potion_hold_my_beer_01",
			consumable_item = true,
			local_pickup_sound = true,
			can_spawn_func = can_spawn_deus_pickup,
			material_settings = material_settings_templates.hold_my_beer_potion
		},
		poison_proof_potion = {
			spawn_weighting = 0.2,
			only_once = true,
			type = "inventory_item",
			pickup_sound_event = "pickup_potion",
			debug_pickup_category = "consumables",
			slot_name = "slot_potion",
			unit_name = "units/weapons/player/pup_deus_potion_01/pup_deus_potion_01",
			hud_description = "potion_poison_proof_01_hud_desc",
			bots_mule_pickup = true,
			individual_pickup = false,
			item_description = "potion_poison_proof_01_item_desc",
			dupable = true,
			item_name = "potion_poison_proof_01",
			consumable_item = true,
			local_pickup_sound = true,
			can_spawn_func = can_spawn_deus_pickup,
			material_settings = material_settings_templates.poison_proof_potion
		}
	},
	grenades = {
		holy_hand_grenade = {
			only_once = true,
			individual_pickup = false,
			slot_name = "slot_grenade",
			item_description = "holy_hand_grenade_desc",
			spawn_weighting = 0.8,
			debug_pickup_category = "grenades",
			dupable = true,
			pickup_sound_event = "pickup_grenade",
			item_name = "holy_hand_grenade",
			unit_name = "units/weapons/player/pup_grenades/pup_holy_hand_grenade_01_t1",
			bots_mule_pickup = true,
			type = "inventory_item",
			consumable_item = true,
			local_pickup_sound = true,
			hud_description = "holy_hand_grenade_desc"
		}
	}
}
settings.pickup_system_extension_update = {
	"DeusChestExtension"
}
settings.loot_rat_pickups = {
	deus = {
		first_aid_kit = 6,
		all_ammo_small = 6,
		fire_grenade_t2 = 2,
		frag_grenade_t2 = 2,
		healing_draught = 6
	}
}
settings.bardin_scavenger_custom_potions = {
	deus = {}
}
local loot_rat_deus_potion_amount = 1
local deus_loot_rat_pickups = settings.loot_rat_pickups.deus
local bardin_scavenger_custom_potions = settings.bardin_scavenger_custom_potions.deus

for deus_potion_name, _ in pairs(settings.pickups.deus_potions) do
	deus_loot_rat_pickups[deus_potion_name] = loot_rat_deus_potion_amount
	bardin_scavenger_custom_potions[#bardin_scavenger_custom_potions + 1] = deus_potion_name
end

return

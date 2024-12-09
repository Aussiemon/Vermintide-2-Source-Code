-- chunkname: @scripts/settings/equipment/pickups.lua

require("scripts/entity_system/systems/buff/buff_sync_type")

Pickups = Pickups or {}
Pickups.healing = Pickups.healing or {}
Pickups.healing.first_aid_kit = {
	consumable_item = true,
	debug_pickup_category = "consumables",
	dupable = true,
	hud_description = "healthkit_first_aid_kit_01",
	individual_pickup = false,
	item_description = "healthkit_first_aid_kit_01",
	item_name = "healthkit_first_aid_kit_01",
	local_pickup_sound = true,
	only_once = true,
	pickup_sound_event = "pickup_medkit",
	slot_name = "slot_healthkit",
	spawn_weighting = 0.5,
	type = "inventory_item",
	unit_name = "units/weapons/player/pup_first_aid/pup_first_aid",
}
Pickups.healing.healing_draught = {
	consumable_item = true,
	debug_pickup_category = "consumables",
	dupable = true,
	hud_description = "potion_healing_draught_01",
	individual_pickup = false,
	item_description = "healthkit_first_aid_kit_01",
	item_name = "potion_healing_draught_01",
	local_pickup_sound = true,
	only_once = true,
	pickup_sound_event = "pickup_medkit",
	slot_name = "slot_healthkit",
	spawn_weighting = 0.5,
	type = "inventory_item",
	unit_name = "units/weapons/player/pup_potion_01/pup_potion_healing_01",
}
Pickups.potions = Pickups.potions or {}
Pickups.potions.damage_boost_potion = {
	bots_mule_pickup = true,
	consumable_item = true,
	debug_pickup_category = "consumables",
	dupable = true,
	hud_description = "potion_damage_boost_01",
	individual_pickup = false,
	item_description = "potion_damage_boost_01",
	item_name = "potion_damage_boost_01",
	local_pickup_sound = true,
	only_once = true,
	pickup_sound_event = "pickup_potion",
	slot_name = "slot_potion",
	spawn_weighting = 0.2,
	type = "inventory_item",
	unit_name = "units/weapons/player/pup_potion_01/pup_potion_strenght_01",
}
Pickups.potions.speed_boost_potion = {
	bots_mule_pickup = true,
	consumable_item = true,
	debug_pickup_category = "consumables",
	dupable = true,
	hud_description = "potion_speed_boost_01",
	individual_pickup = false,
	item_description = "potion_speed_boost_01",
	item_name = "potion_speed_boost_01",
	local_pickup_sound = true,
	only_once = true,
	pickup_sound_event = "pickup_potion",
	slot_name = "slot_potion",
	spawn_weighting = 0.2,
	type = "inventory_item",
	unit_name = "units/weapons/player/pup_potion_01/pup_potion_speed_01",
}
Pickups.potions.cooldown_reduction_potion = {
	bots_mule_pickup = true,
	consumable_item = true,
	debug_pickup_category = "consumables",
	dupable = true,
	hud_description = "potion_cooldown_reduction_01",
	individual_pickup = false,
	item_description = "potion_cooldown_reduction_01",
	item_name = "potion_cooldown_reduction_01",
	local_pickup_sound = true,
	only_once = true,
	pickup_sound_event = "pickup_potion",
	slot_name = "slot_potion",
	spawn_weighting = 0.2,
	type = "inventory_item",
	unit_name = "units/weapons/player/pup_potion_01/pup_potion_extra_01",
}
Pickups.level_events = Pickups.level_events or {}
Pickups.level_events.grain_sack = {
	debug_pickup_category = "level_event",
	hud_description = "grain_sack",
	individual_pickup = false,
	item_description = "grain_sack",
	item_name = "grain_sack",
	only_once = true,
	slot_name = "slot_level_event",
	spawn_weighting = 1e-06,
	type = "inventory_item",
	unit_name = "units/weapons/player/pup_sacks/pup_sacks_01",
	unit_template_name = "pickup_projectile_unit_limited",
	wield_on_pickup = true,
}
Pickups.level_events.door_stick = {
	debug_pickup_category = "level_event",
	hud_description = "door_stick",
	individual_pickup = false,
	item_description = "door_stick",
	item_name = "door_stick",
	only_once = true,
	slot_name = "slot_level_event",
	spawn_weighting = 1e-06,
	type = "inventory_item",
	unit_name = "units/gameplay/timed_door_base_02/pup_timed_door_stick",
	unit_template_name = "pickup_unit",
	wield_on_pickup = true,
}
Pickups.level_events.training_dummy_bob = {
	debug_pickup_category = "level_event",
	hud_description = "dummy_description",
	individual_pickup = false,
	item_description = "dummy_description",
	item_name = "training_dummy_bob",
	only_once = true,
	slot_name = "slot_level_event",
	spawn_weighting = 1e-06,
	type = "inventory_item",
	unit_name = "units/gameplay/training_dummy/training_dummy_bob",
	unit_template_name = "ai_unit_training_dummy_bob",
	wield_on_pickup = true,
	spawn_override_func = function (pickup_settings, data, spawn_pos, spawn_rot)
		local breed = Breeds.training_dummy
		local optional_data = {
			side_id = 2,
			prepare_func = function (breed, extension_init_data, optional_data, spawn_pos, spawn_rot)
				extension_init_data.projectile_locomotion_system = data.projectile_locomotion_system
				extension_init_data.pickup_system = data.pickup_system
			end,
			spawned_func = function (ai_unit, breed, optional_data)
				local ai_system = Managers.state.entity:system("ai_system")

				ai_system:set_attribute(ai_unit, "armor", "training_dummy", false)
			end,
		}
		local unit = Managers.state.conflict:spawn_unit_immediate(breed, spawn_pos, spawn_rot, "pickup", nil, nil, optional_data)

		return unit
	end,
}
Pickups.level_events.training_dummy_armored_bob = {
	debug_pickup_category = "level_event",
	hud_description = "dummy_description",
	individual_pickup = false,
	item_description = "dummy_description",
	item_name = "training_dummy_armored_bob",
	only_once = true,
	slot_name = "slot_level_event",
	spawn_weighting = 1e-06,
	type = "inventory_item",
	unit_name = "units/gameplay/training_dummy/training_dummy_bob",
	unit_template_name = "ai_unit_training_dummy_bob",
	wield_on_pickup = true,
	spawn_override_func = function (pickup_settings, data, spawn_pos, spawn_rot)
		local breed = Breeds.training_dummy
		local optional_data = {
			side_id = 2,
			prepare_func = function (breed, extension_init_data, optional_data, spawn_pos, spawn_rot)
				extension_init_data.projectile_locomotion_system = data.projectile_locomotion_system
				extension_init_data.pickup_system = data.pickup_system
			end,
			spawned_func = function (ai_unit, breed, optional_data)
				local ai_system = Managers.state.entity:system("ai_system")

				ai_system:set_attribute(ai_unit, "armor", "training_dummy", true)
			end,
		}
		local unit = Managers.state.conflict:spawn_unit_immediate(breed, spawn_pos, spawn_rot, "pickup", nil, nil, optional_data)

		return unit
	end,
}
Pickups.level_events.torch = {
	debug_pickup_category = "level_event",
	hud_description = "interaction_torch",
	individual_pickup = false,
	item_description = "interaction_torch",
	item_name = "torch",
	only_once = true,
	slot_name = "slot_level_event",
	spawn_weighting = 1e-06,
	teleport_time = 3.5,
	type = "inventory_item",
	unit_name = "units/weapons/player/pup_torch/pup_torch",
	unit_template_name = "pickup_torch_unit_init",
	wield_on_pickup = true,
	on_pick_up_func = function (world, interactor_unit, is_server)
		if is_server then
			LevelHelper:flow_event(world, "lua_torch_picked_up")
		end
	end,
}
Pickups.level_events.mutator_torch = {
	debug_pickup_category = "level_event",
	hud_description = "interaction_torch",
	individual_pickup = false,
	item_description = "interaction_torch",
	item_name = "mutator_torch",
	only_once = true,
	slot_name = "slot_level_event",
	spawn_weighting = 1e-06,
	teleport_time = 3.5,
	type = "inventory_item",
	unit_name = "units/weapons/player/pup_torch/pup_torch",
	unit_template_name = "pickup_torch_unit",
	wield_on_pickup = true,
	on_pick_up_func = function (world, interactor_unit, is_server)
		if is_server then
			LevelHelper:flow_event(world, "lua_torch_picked_up")
		end
	end,
}
Pickups.level_events.shadow_torch = {
	debug_pickup_category = "level_event",
	hud_description = "interaction_torch",
	individual_pickup = false,
	item_description = "interaction_torch",
	item_name = "shadow_torch",
	only_once = true,
	slot_name = "slot_level_event",
	spawn_weighting = 1e-06,
	teleport_time = 1000,
	type = "inventory_item",
	unit_name = "units/weapons/player/pup_shadow_torch/pup_shadow_torch",
	unit_template_name = "pickup_torch_unit_init",
	wield_on_pickup = true,
	on_pick_up_func = function (world, interactor_unit, is_server)
		if is_server then
			LevelHelper:flow_event(world, "lua_torch_picked_up")
		end
	end,
}
Pickups.level_events.explosive_barrel = {
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
	unit_name = "units/weapons/player/pup_explosive_barrel/pup_explosive_barrel_01",
	unit_template_name = "explosive_pickup_projectile_unit",
	wield_on_pickup = true,
}
Pickups.level_events.whale_oil_barrel = {
	additional_data_func = "explosive_barrel",
	debug_pickup_category = "level_event",
	hud_description = "explosive_barrel",
	individual_pickup = false,
	item_description = "explosive_barrel",
	item_name = "whale_oil_barrel",
	only_once = true,
	slot_name = "slot_level_event",
	spawn_weighting = 1,
	type = "explosive_inventory_item",
	unit_name = "units/weapons/player/pup_whale_oil_barrel/pup_whale_oil_barrel_01",
	unit_template_name = "explosive_pickup_projectile_unit",
	wield_on_pickup = true,
}
Pickups.level_events.lamp_oil = {
	additional_data_func = "explosive_barrel",
	debug_pickup_category = "level_event",
	hud_description = "lamp_oil",
	individual_pickup = false,
	item_description = "lamp_oil",
	item_name = "lamp_oil",
	only_once = true,
	slot_name = "slot_level_event",
	spawn_weighting = 1,
	type = "explosive_inventory_item",
	unit_name = "units/weapons/player/pup_oil_jug_01/pup_oil_jug_01",
	unit_template_name = "explosive_pickup_projectile_unit",
	wield_on_pickup = true,
}
Pickups.level_events.explosive_barrel_objective = {
	additional_data_func = "explosive_barrel",
	debug_pickup_category = "level_event",
	hud_description = "explosive_barrel_objective",
	individual_pickup = false,
	item_description = "explosive_barrel_objective",
	item_name = "explosive_barrel_objective",
	only_once = true,
	slot_name = "slot_level_event",
	spawn_weighting = 1e-06,
	type = "explosive_inventory_item",
	unit_name = "units/weapons/player/pup_explosive_barrel/pup_gun_powder_barrel_01",
	unit_template_name = "explosive_pickup_projectile_unit_limited",
	wield_on_pickup = true,
}
Pickups.level_events.beer_barrel = {
	debug_pickup_category = "level_event",
	hud_description = "beer_barrel",
	individual_pickup = false,
	item_description = "beer_barrel",
	item_name = "beer_barrel",
	only_once = true,
	slot_name = "slot_level_event",
	spawn_weighting = 1e-06,
	type = "inventory_item",
	unit_name = "units/weapons/player/pup_explosive_barrel/pup_explosive_barrel_01",
	unit_template_name = "pickup_unit",
	wield_on_pickup = true,
}
Pickups.level_events.magic_barrel = {
	additional_data_func = "explosive_barrel",
	debug_pickup_category = "level_event",
	hud_description = "magic_barrel",
	individual_pickup = false,
	item_description = "magic_barrel",
	item_name = "magic_barrel",
	only_once = true,
	slot_name = "slot_level_event",
	spawn_weighting = 1e-06,
	type = "explosive_inventory_item",
	unit_name = "units/weapons/player/pup_magic_barrel/pup_magic_barrel_01",
	unit_template_name = "explosive_pickup_projectile_unit_limited",
	wield_on_pickup = true,
}
Pickups.level_events.wizards_barrel = {
	additional_data_func = "wizards_barrel",
	debug_pickup_category = "level_event",
	hud_description = "wizards_barrel",
	individual_pickup = false,
	item_description = "wizards_barrel",
	item_name = "wizards_barrel",
	only_once = true,
	slot_name = "slot_level_event",
	spawn_weighting = 1e-06,
	type = "explosive_inventory_item",
	unit_name = "units/weapons/player/pup_wizards_barrel_01/pup_wizards_barrel_01",
	unit_template_name = "explosive_pickup_projectile_unit_limited",
	wield_on_pickup = true,
	on_pick_up_func = function (world, interactor_unit, is_server)
		Managers.state.event:trigger("set_tower_skulls_target", interactor_unit)

		if is_server then
			AIGroupTemplates.ethereal_skulls.try_spawn_group("picked_up", interactor_unit)
		end
	end,
}
Pickups.level_events.grimoire = {
	debug_pickup_category = "special",
	hud_description = "grimoire",
	individual_pickup = false,
	item_description = "grimoire",
	item_name = "wpn_grimoire_01",
	local_pickup_sound = true,
	only_once = true,
	pickup_sound_event = "pickup_medkit",
	slot_name = "slot_potion",
	spawn_weighting = 1,
	type = "inventory_item",
	unit_name = "units/weapons/player/pup_grimoire_01/pup_grimoire_01",
}
Pickups.level_events.tome = {
	debug_pickup_category = "special",
	hud_description = "tome",
	individual_pickup = false,
	item_description = "tome",
	item_name = "wpn_side_objective_tome_01",
	local_pickup_sound = true,
	only_once = true,
	pickup_sound_event = "pickup_medkit",
	slot_name = "slot_healthkit",
	spawn_weighting = 1,
	type = "inventory_item",
	unit_name = "units/weapons/player/pup_side_objective_tome/pup_side_objective_tome_01",
}
Pickups.level_events.cannon_ball = {
	debug_pickup_category = "level_event",
	hud_description = "cannon_ball",
	individual_pickup = false,
	item_description = "cannon_ball",
	item_name = "wpn_cannon_ball_01",
	only_once = true,
	slot_name = "slot_level_event",
	spawn_weighting = 1e-06,
	type = "inventory_item",
	unit_name = "units/weapons/player/pup_cannon_ball_01/pup_cannon_ball_01",
	unit_template_name = "pickup_projectile_unit_limited",
	wield_on_pickup = true,
}
Pickups.level_events.trail_cog = {
	debug_pickup_category = "level_event",
	hud_description = "cog_wheel",
	individual_pickup = false,
	item_description = "cog_wheel",
	item_name = "wpn_trail_cog",
	only_once = true,
	slot_name = "slot_level_event",
	spawn_weighting = 1e-06,
	type = "inventory_item",
	unit_name = "units/weapons/player/wpn_trail_cog_02/pup_trail_cog_02",
	unit_template_name = "pickup_projectile_unit_limited",
	wield_on_pickup = true,
}
Pickups.level_events.gargoyle_head = {
	debug_pickup_category = "level_event",
	hud_description = "gargoyle_head",
	individual_pickup = false,
	item_description = "gargoyle_head",
	item_name = "wpn_gargoyle_head",
	only_once = true,
	slot_name = "slot_level_event",
	spawn_weighting = 1e-06,
	type = "inventory_item",
	unit_name = "units/weapons/player/pup_gargoyle_head/pup_gargoyle_head_01",
	unit_template_name = "pickup_projectile_unit",
	wield_on_pickup = true,
}
Pickups.level_events.gargoyle_head_vs = {
	debug_pickup_category = "level_event",
	hud_description = "gargoyle_head",
	individual_pickup = false,
	item_description = "gargoyle_head",
	item_name = "wpn_gargoyle_head",
	only_once = true,
	slot_name = "slot_level_event",
	spawn_weighting = 1e-06,
	type = "inventory_item",
	unit_name = "units/weapons/player/pup_gargoyle_head/pup_gargoyle_head_01",
	unit_template_name = "pickup_projectile_unit_limited",
	wield_on_pickup = true,
}
Pickups.level_events.waystone_piece = {
	debug_pickup_category = "level_event",
	hud_description = "interaction_waystone_piece",
	individual_pickup = false,
	item_description = "interaction_waystone_piece",
	item_name = "wpn_waystone_piece",
	only_once = true,
	slot_name = "slot_level_event",
	spawn_weighting = 1e-06,
	type = "inventory_item",
	unit_name = "units/weapons/player/pup_waystone_piece_01/pup_waystone_piece_01",
	unit_template_name = "pickup_projectile_unit",
	wield_on_pickup = true,
}
Pickups.level_events.magic_crystal = {
	debug_pickup_category = "level_event",
	hud_description = "magic_crystal",
	individual_pickup = false,
	item_description = "magic_crystal",
	item_name = "wpn_magic_crystal",
	only_once = true,
	slot_name = "slot_level_event",
	spawn_weighting = 1e-06,
	type = "inventory_item",
	unit_name = "units/weapons/player/pup_magic_crystal/pup_magic_crystal",
	unit_template_name = "pickup_projectile_unit_limited",
	wield_on_pickup = true,
}
Pickups.level_events.shadow_gargoyle_head = {
	debug_pickup_category = "level_event",
	hud_description = "gargoyle_head",
	individual_pickup = false,
	item_description = "gargoyle_head",
	item_name = "wpn_shadow_gargoyle_head",
	only_once = true,
	slot_name = "slot_level_event",
	spawn_weighting = 1e-06,
	type = "inventory_item",
	unit_name = "units/weapons/player/pup_shadow_gargoyle_head/pup_shadow_gargoyle_head_01",
	unit_template_name = "pickup_projectile_unit",
	wield_on_pickup = true,
}
Pickups.ammo = Pickups.ammo or {}
Pickups.ammo.all_ammo = {
	consumable_item = true,
	debug_pickup_category = "consumables",
	hud_description = "interaction_ammunition_crate",
	individual_pickup = false,
	local_pickup_sound = true,
	only_once = false,
	spawn_weighting = 1,
	type = "ammo",
	unit_name = "units/weapons/player/pup_ammo_box/pup_ammo_box",
	unit_template_name = "pickup_unit",
	pickup_sound_event_func = function (interactor_unit, interactable_unit, data)
		local inventory_extension = ScriptUnit.extension(interactor_unit, "inventory_system")
		local full_ammo = inventory_extension:has_full_ammo()

		return full_ammo and "pickup_ammo_full" or "pickup_ammo"
	end,
	can_interact_func = function (interactor_unit, interactable_unit, data)
		local inventory_extension = ScriptUnit.has_extension(interactor_unit, "inventory_system")

		if not inventory_extension then
			return false
		end

		local has_ammo_consuming_weapon = inventory_extension:has_ammo_consuming_weapon_equipped()
		local is_throwing_axe = inventory_extension:has_ammo_consuming_weapon_equipped("throwing_axe")
		local infinite_ammo = inventory_extension:has_infinite_ammo()

		if not is_throwing_axe then
			return has_ammo_consuming_weapon and not infinite_ammo
		end

		return true
	end,
}
Pickups.ammo.all_ammo_small = {
	consumable_item = true,
	debug_pickup_category = "consumables",
	hud_description = "interaction_ammunition",
	individual_pickup = false,
	local_pickup_sound = true,
	only_once = true,
	pickup_sound_event = "pickup_ammo",
	spawn_weighting = 2,
	type = "ammo",
	unit_name = "units/weapons/player/pup_ammo_box/pup_ammo_box_limited",
	unit_template_name = "pickup_unit",
	can_interact_func = function (interactor_unit, interactable_unit, data)
		local inventory_extension = ScriptUnit.has_extension(interactor_unit, "inventory_system")

		if not inventory_extension then
			return false
		end

		local has_ammo_consuming_weapon = inventory_extension:has_ammo_consuming_weapon_equipped()
		local is_throwing_axe = inventory_extension:has_ammo_consuming_weapon_equipped("throwing_axe")
		local infinite_ammo = inventory_extension:has_infinite_ammo()

		return has_ammo_consuming_weapon and not is_throwing_axe and not infinite_ammo
	end,
}
Pickups.ammo.ammo_ranger = {
	consumable_item = true,
	debug_pickup_category = "consumables",
	hud_description = "interaction_ranger_ammunition",
	individual_pickup = false,
	local_pickup_sound = true,
	only_once = true,
	pickup_sound_event = "pickup_ammo",
	ranger_ammo = true,
	refill_percentage = 0.1,
	spawn_weighting = 1e-06,
	type = "ammo",
	unit_name = "units/weapons/player/pup_ammo_box/pup_ammo_box_limited",
	unit_template_name = "pickup_unit",
	can_interact_func = function (interactor_unit, interactable_unit, data)
		local inventory_extension = ScriptUnit.has_extension(interactor_unit, "inventory_system")

		if not inventory_extension then
			return false
		end

		local has_ammo_consuming_weapon = inventory_extension:has_ammo_consuming_weapon_equipped()
		local is_throwing_axe = inventory_extension:has_ammo_consuming_weapon_equipped("throwing_axe")
		local infinite_ammo = inventory_extension:has_infinite_ammo()

		return has_ammo_consuming_weapon and not is_throwing_axe and not infinite_ammo
	end,
}
Pickups.ammo.ammo_ranger_improved = {
	consumable_item = true,
	debug_pickup_category = "consumables",
	hud_description = "interaction_ranger_ammunition_improved",
	individual_pickup = false,
	local_pickup_sound = true,
	only_once = true,
	pickup_sound_event = "pickup_ammo",
	ranger_ammo = true,
	refill_percentage = 0.3,
	spawn_weighting = 1e-06,
	type = "ammo",
	unit_name = "units/weapons/player/pup_ammo_box/pup_ammo_box_limited",
	unit_template_name = "pickup_unit",
	can_interact_func = function (interactor_unit, interactable_unit, data)
		local inventory_extension = ScriptUnit.has_extension(interactor_unit, "inventory_system")

		if not inventory_extension then
			return false
		end

		local has_ammo_consuming_weapon = inventory_extension:has_ammo_consuming_weapon_equipped()
		local is_throwing_axe = inventory_extension:has_ammo_consuming_weapon_equipped("throwing_axe")
		local infinite_ammo = inventory_extension:has_infinite_ammo()

		return has_ammo_consuming_weapon and not is_throwing_axe and not infinite_ammo
	end,
}
Pickups.grenades = Pickups.grenades or {}
Pickups.grenades.frag_grenade_t1 = {
	bots_mule_pickup = true,
	consumable_item = true,
	debug_pickup_category = "grenades",
	dupable = true,
	hud_description = "grenade_frag",
	individual_pickup = false,
	item_description = "grenade_frag",
	item_name = "grenade_frag_01",
	local_pickup_sound = true,
	only_once = true,
	pickup_sound_event = "pickup_grenade",
	slot_name = "slot_grenade",
	spawn_weighting = 0.8,
	type = "inventory_item",
	unit_name = "units/weapons/player/pup_grenades/pup_grenade_01_t1",
}
Pickups.grenades.fire_grenade_t1 = {
	bots_mule_pickup = true,
	consumable_item = true,
	debug_pickup_category = "grenades",
	dupable = true,
	hud_description = "grenade_fire",
	individual_pickup = false,
	item_description = "grenade_fire",
	item_name = "grenade_fire_01",
	local_pickup_sound = true,
	only_once = true,
	pickup_sound_event = "pickup_grenade",
	slot_name = "slot_grenade",
	spawn_weighting = 0.8,
	type = "inventory_item",
	unit_name = "units/weapons/player/pup_grenades/pup_grenade_03_t1",
}
Pickups.improved_grenades = Pickups.improved_grenades or {}
Pickups.improved_grenades.frag_grenade_t2 = {
	bots_mule_pickup = true,
	consumable_item = true,
	debug_pickup_category = "grenades",
	dupable = true,
	hud_description = "grenade_frag",
	individual_pickup = false,
	item_description = "grenade_frag",
	item_name = "grenade_frag_02",
	local_pickup_sound = true,
	only_once = true,
	pickup_sound_event = "pickup_grenade",
	slot_name = "slot_grenade",
	spawn_weighting = 0.2,
	type = "inventory_item",
	unit_name = "units/weapons/player/pup_grenades/pup_grenade_01_t2",
}
Pickups.improved_grenades.fire_grenade_t2 = {
	bots_mule_pickup = true,
	consumable_item = true,
	debug_pickup_category = "grenades",
	dupable = true,
	hud_description = "grenade_fire",
	individual_pickup = false,
	item_description = "grenade_fire",
	item_name = "grenade_fire_02",
	local_pickup_sound = true,
	only_once = true,
	pickup_sound_event = "pickup_grenade",
	slot_name = "slot_grenade",
	spawn_weighting = 0.2,
	type = "inventory_item",
	unit_name = "units/weapons/player/pup_grenades/pup_grenade_03_t2",
}
Pickups.grenades.engineer_grenade_t1 = {
	bots_mule_pickup = true,
	consumable_item = true,
	debug_pickup_category = "grenades",
	dupable = true,
	hud_description = "grenade_frag",
	individual_pickup = false,
	item_description = "grenade_frag",
	item_name = "grenade_engineer",
	local_pickup_sound = true,
	only_once = true,
	pickup_sound_event = "pickup_grenade",
	slot_name = "slot_grenade",
	spawn_weighting = 0.8,
	type = "inventory_item",
	unit_name = "units/weapons/player/pup_grenades/pup_grenade_01_t1",
}
Pickups.special = {}
Pickups.special.loot_die = {
	debug_pickup_category = "special",
	hud_description = "interaction_loot_dice",
	individual_pickup = false,
	local_pickup_sound = false,
	mission_name = "bonus_dice_hidden_mission",
	only_once = true,
	pickup_sound_event = "hud_pickup_loot_die",
	spawn_weighting = 1,
	type = "loot_die",
	unit_name = "units/props/dice_bowl/pup_loot_die",
	can_spawn_func = function (params, is_debug_spawn)
		if is_debug_spawn then
			return true
		end

		if not params then
			return true
		end

		local dice_keeper = params.dice_keeper

		return dice_keeper:num_bonus_dice_spawned() < 2
	end,
}
Pickups.special.bardin_survival_ale = {
	bots_mule_pickup = true,
	consumable_item = true,
	debug_pickup_category = "consumables",
	hud_description = "interaction_beer",
	item_description = "interaction_beer",
	item_name = "wpn_bardin_survival_ale",
	local_pickup_sound = true,
	only_once = true,
	pickup_sound_event = "pickup_potion",
	slot_name = "slot_level_event",
	spawn_weighting = 1e-06,
	type = "inventory_item",
	unit_name = "units/weapons/player/pup_ale/pup_ale",
	wield_on_pickup = true,
	action_on_wield = {
		action = "action_one",
		sub_action = "default",
	},
	on_pick_up_func = function (world, interactor_unit, is_server)
		local buff_extension = ScriptUnit.extension(interactor_unit, "buff_system")

		buff_extension:add_buff("intoxication_base")
	end,
	can_interact_func = function (interactor_unit, interactable_unit, data)
		local buff_extension = ScriptUnit.extension(interactor_unit, "buff_system")
		local is_in_cooldown = buff_extension:has_buff_type("beer_bottle_pickup_cooldown")
		local is_falling_down = buff_extension:has_buff_perk("falling_down")

		return not is_in_cooldown and not is_falling_down
	end,
}
Pickups.special.necromancer_ripped_soul = {
	debug_pickup_category = "orbs",
	granted_buff = "sienna_necromancer_4_2_soul_rip_stack",
	item_name = "health_orb",
	local_only = true,
	pickup_radius = 0.3,
	pickup_sound = "Play_career_necro_ability_soul_rip_orb_pickup",
	spawn_weighting = 1e-06,
	type = "orb_pickup_unit",
	unit_name = "units/beings/player/bright_wizard_necromancer/talents/ripped_soul",
	unit_template_name = "orb_pickup_unit",
	buff_sync_type = BuffSyncType.Local,
	can_pickup_orb = function (pickup_settings, unit)
		local career_extension = ScriptUnit.has_extension(unit, "career_system")

		if career_extension and career_extension:career_name() == "bw_necromancer" then
			return true
		end
	end,
	orb_offset = {
		0,
		0,
		0.32,
	},
	hover_settings = {
		amplitude = 0.3,
		frequency = 0.4,
	},
	magnetic_settings = {
		max_speed = 6.5,
		radius = 3.5,
		time_to_max_speed = 0.5,
	},
}

if script_data then
	script_data.lorebook_enabled = script_data.lorebook_enabled or Development.parameter("lorebook_enabled")
end

Pickups.lorebook_pages = {}
Pickups.lorebook_pages.lorebook_page = {
	debug_pickup_category = "special",
	hide_on_pickup = true,
	hud_description = "interaction_lorebook_page",
	only_once = false,
	pickup_sound_event = "Play_hud_lorebook_unlock_page",
	spawn_weighting = 1,
	type = "lorebook_page",
	unit_name = "units/weapons/player/pup_lore_page/pup_lore_page_01",
	hide_func = function (statistics_db)
		local level_key = Managers.state.game_mode:level_key()
		local pages = LorebookCollectablePages[level_key]

		fassert(pages, "Trying to a pick up a lorebook page on a level where pages can not be unlocked")

		local num_pages = #pages
		local local_player = Managers.player:local_player()
		local stats_id = local_player:stats_id()
		local unlocked_all = true

		for i = 1, num_pages do
			local category_name = pages[i]
			local id = LorebookCategoryLookup[category_name]
			local unlocked = statistics_db:get_persistent_array_stat(stats_id, "lorebook_unlocks", id)

			if not unlocked then
				unlocked_all = false

				break
			end
		end

		return unlocked_all
	end,
	can_spawn_func = function (params, is_debug_spawn)
		if is_debug_spawn then
			return true
		end

		if not script_data.lorebook_enabled then
			return false
		end

		local level_key = Managers.state.game_mode:level_key()

		if LorebookCollectablePages[level_key] then
			return true
		end

		return false
	end,
}
Pickups.painting_scrap = {}
Pickups.painting_scrap.painting_scrap = {
	debug_pickup_category = "special",
	hide_on_pickup = true,
	hud_description = "ravaged_art",
	individual_pickup = true,
	local_pickup_sound = true,
	only_once = true,
	pickup_sound_event = "hud_pickup_painting_piece",
	spawn_weighting = 1,
	type = "painting_scrap",
	unit_name = "units/weapons/player/pup_painting/pup_painting_scraps",
	can_spawn_func = function (params, is_debug_spawn)
		return true
	end,
}

DLCUtils.merge("pickups", Pickups, true)

LootRatPickups = {
	default = {
		boss_loot = 4,
		cooldown_reduction_potion = 1,
		damage_boost_potion = 1,
		fire_grenade_t2 = 1,
		first_aid_kit = 3,
		frag_grenade_t2 = 1,
		healing_draught = 2,
		lorebook_page = 4,
		speed_boost_potion = 1,
	},
	versus = {
		cooldown_reduction_potion = 1,
		damage_boost_potion = 1,
		fire_grenade_t2 = 1,
		first_aid_kit = 3,
		frag_grenade_t2 = 1,
		healing_draught = 2,
		speed_boost_potion = 1,
	},
}
BardinScavengerCustomPotions = {}

for _, dlc in pairs(DLCSettings) do
	local loot_rat_pickups = dlc.loot_rat_pickups

	if loot_rat_pickups then
		table.merge(LootRatPickups, loot_rat_pickups)
	end

	local bardin_scavenger_custom_potions = dlc.bardin_scavenger_custom_potions

	if bardin_scavenger_custom_potions then
		table.merge(BardinScavengerCustomPotions, bardin_scavenger_custom_potions)
	end
end

for _, pickup_settings in pairs(LootRatPickups) do
	local total_loot_rat_spawn_weighting = 0

	for _, spawn_weighting in pairs(pickup_settings) do
		total_loot_rat_spawn_weighting = total_loot_rat_spawn_weighting + spawn_weighting
	end

	for pickup_name, spawn_weighting in pairs(pickup_settings) do
		pickup_settings[pickup_name] = spawn_weighting / total_loot_rat_spawn_weighting
	end
end

NearPickupSpawnChance = NearPickupSpawnChance or {
	grenades = 0.5,
	healing = 0.7,
	potions = 0.3,
}
AllPickups = {}

for group, pickups in pairs(Pickups) do
	local total_spawn_weighting = 0

	for _, settings in pairs(pickups) do
		total_spawn_weighting = total_spawn_weighting + settings.spawn_weighting
	end

	for pickup_name, settings in pairs(pickups) do
		settings.spawn_weighting = settings.spawn_weighting / total_spawn_weighting
		settings.pickup_name = pickup_name
		AllPickups[pickup_name] = settings
	end

	NearPickupSpawnChance[group] = NearPickupSpawnChance[group] or 0
end

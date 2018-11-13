Pickups = Pickups or {}
Pickups.healing = Pickups.healing or {}
Pickups.healing.first_aid_kit = {
	only_once = true,
	type = "inventory_item",
	slot_name = "slot_healthkit",
	item_description = "healthkit_first_aid_kit_01",
	spawn_weighting = 0.5,
	debug_pickup_category = "consumables",
	dupable = true,
	pickup_sound_event = "pickup_medkit",
	item_name = "healthkit_first_aid_kit_01",
	unit_name = "units/weapons/player/pup_first_aid/pup_first_aid",
	consumable_item = true,
	local_pickup_sound = true,
	hud_description = "healthkit_first_aid_kit_01"
}
Pickups.healing.healing_draught = {
	only_once = true,
	type = "inventory_item",
	slot_name = "slot_healthkit",
	item_description = "healthkit_first_aid_kit_01",
	spawn_weighting = 0.5,
	debug_pickup_category = "consumables",
	dupable = true,
	pickup_sound_event = "pickup_medkit",
	item_name = "potion_healing_draught_01",
	unit_name = "units/weapons/player/pup_potion_01/pup_potion_healing_01",
	consumable_item = true,
	local_pickup_sound = true,
	hud_description = "potion_healing_draught_01"
}
Pickups.potions = Pickups.potions or {}
Pickups.potions.damage_boost_potion = {
	only_once = true,
	type = "inventory_item",
	slot_name = "slot_potion",
	item_description = "potion_damage_boost_01",
	spawn_weighting = 0.2,
	debug_pickup_category = "consumables",
	dupable = true,
	bots_mule_pickup = true,
	item_name = "potion_damage_boost_01",
	unit_name = "units/weapons/player/pup_potion_01/pup_potion_strenght_01",
	pickup_sound_event = "pickup_potion",
	consumable_item = true,
	local_pickup_sound = true,
	hud_description = "potion_damage_boost_01"
}
Pickups.potions.speed_boost_potion = {
	only_once = true,
	type = "inventory_item",
	slot_name = "slot_potion",
	item_description = "potion_speed_boost_01",
	spawn_weighting = 0.2,
	debug_pickup_category = "consumables",
	dupable = true,
	bots_mule_pickup = true,
	item_name = "potion_speed_boost_01",
	unit_name = "units/weapons/player/pup_potion_01/pup_potion_speed_01",
	pickup_sound_event = "pickup_potion",
	consumable_item = true,
	local_pickup_sound = true,
	hud_description = "potion_speed_boost_01"
}
Pickups.potions.cooldown_reduction_potion = {
	only_once = true,
	type = "inventory_item",
	slot_name = "slot_potion",
	item_description = "potion_cooldown_reduction_01",
	spawn_weighting = 0.2,
	debug_pickup_category = "consumables",
	dupable = true,
	bots_mule_pickup = true,
	item_name = "potion_cooldown_reduction_01",
	unit_name = "units/weapons/player/pup_potion_01/pup_potion_extra_01",
	pickup_sound_event = "pickup_potion",
	consumable_item = true,
	local_pickup_sound = true,
	hud_description = "potion_cooldown_reduction_01"
}
Pickups.level_events = Pickups.level_events or {}
Pickups.level_events.grain_sack = {
	only_once = true,
	slot_name = "slot_level_event",
	type = "inventory_item",
	item_description = "grain_sack",
	spawn_weighting = 1e-06,
	debug_pickup_category = "level_event",
	item_name = "grain_sack",
	unit_name = "units/weapons/player/pup_sacks/pup_sacks_01",
	unit_template_name = "pickup_projectile_unit_limited",
	wield_on_pickup = true,
	hud_description = "grain_sack"
}
Pickups.level_events.door_stick = {
	only_once = true,
	slot_name = "slot_level_event",
	type = "inventory_item",
	item_description = "door_stick",
	spawn_weighting = 1e-06,
	debug_pickup_category = "level_event",
	item_name = "door_stick",
	unit_name = "units/gameplay/timed_door_base_02/pup_timed_door_stick",
	unit_template_name = "pickup_unit",
	wield_on_pickup = true,
	hud_description = "door_stick"
}
Pickups.level_events.training_dummy = {
	only_once = true,
	slot_name = "slot_level_event",
	type = "inventory_item",
	item_description = "dummy_description",
	spawn_weighting = 1e-06,
	debug_pickup_category = "level_event",
	item_name = "training_dummy",
	unit_name = "units/gameplay/training_dummy/training_dummy",
	unit_template_name = "pickup_training_dummy_unit",
	wield_on_pickup = true,
	hud_description = "dummy_description"
}
Pickups.level_events.training_dummy_armored = {
	only_once = true,
	slot_name = "slot_level_event",
	type = "inventory_item",
	item_description = "dummy_description",
	spawn_weighting = 1e-06,
	debug_pickup_category = "level_event",
	item_name = "training_dummy_armored",
	unit_name = "units/gameplay/training_dummy/training_dummy_armored",
	unit_template_name = "pickup_training_dummy_unit",
	wield_on_pickup = true,
	hud_description = "dummy_description"
}
Pickups.level_events.training_dummy_skaven = {
	only_once = true,
	slot_name = "slot_level_event",
	type = "inventory_item",
	item_description = "dummy_description",
	spawn_weighting = 1e-06,
	debug_pickup_category = "level_event",
	item_name = "training_dummy_skaven",
	unit_name = "units/gameplay/training_dummy/training_dummy_skaven/training_dummy_skaven",
	unit_template_name = "pickup_training_dummy_unit",
	wield_on_pickup = true,
	hud_description = "dummy_description"
}
Pickups.level_events.torch = {
	only_once = true,
	type = "inventory_item",
	item_description = "interaction_torch",
	spawn_weighting = 1e-06,
	debug_pickup_category = "level_event",
	teleport_time = 40,
	slot_name = "slot_level_event",
	item_name = "torch",
	unit_name = "units/weapons/player/pup_torch/pup_torch",
	unit_template_name = "pickup_torch_unit_init",
	wield_on_pickup = true,
	hud_description = "interaction_torch",
	on_pick_up_func = function (world, interactor_unit, is_server)
		if is_server then
			LevelHelper:flow_event(world, "lua_torch_picked_up")
		end
	end
}
Pickups.level_events.explosive_barrel = {
	only_once = true,
	slot_name = "slot_level_event",
	type = "explosive_inventory_item",
	item_description = "explosive_barrel",
	spawn_weighting = 1,
	debug_pickup_category = "level_event",
	item_name = "explosive_barrel",
	unit_name = "units/weapons/player/pup_explosive_barrel/pup_explosive_barrel_01",
	additional_data_func = "explosive_barrel",
	unit_template_name = "explosive_pickup_projectile_unit",
	wield_on_pickup = true,
	hud_description = "explosive_barrel"
}
Pickups.level_events.lamp_oil = {
	only_once = true,
	slot_name = "slot_level_event",
	type = "explosive_inventory_item",
	item_description = "lamp_oil",
	spawn_weighting = 1,
	debug_pickup_category = "level_event",
	item_name = "lamp_oil",
	unit_name = "units/weapons/player/pup_oil_jug_01/pup_oil_jug_01",
	additional_data_func = "explosive_barrel",
	unit_template_name = "explosive_pickup_projectile_unit",
	wield_on_pickup = true,
	hud_description = "lamp_oil"
}
Pickups.level_events.explosive_barrel_objective = {
	only_once = true,
	slot_name = "slot_level_event",
	type = "explosive_inventory_item",
	item_description = "explosive_barrel_objective",
	spawn_weighting = 1e-06,
	debug_pickup_category = "level_event",
	item_name = "explosive_barrel_objective",
	unit_name = "units/weapons/player/pup_explosive_barrel/pup_gun_powder_barrel_01",
	additional_data_func = "explosive_barrel",
	unit_template_name = "explosive_pickup_projectile_unit_limited",
	wield_on_pickup = true,
	hud_description = "explosive_barrel_objective"
}
Pickups.level_events.beer_barrel = {
	only_once = true,
	slot_name = "slot_level_event",
	type = "inventory_item",
	item_description = "beer_barrel",
	spawn_weighting = 1e-06,
	debug_pickup_category = "level_event",
	item_name = "beer_barrel",
	unit_name = "units/weapons/player/pup_explosive_barrel/pup_explosive_barrel_01",
	unit_template_name = "pickup_unit",
	wield_on_pickup = true,
	hud_description = "beer_barrel"
}
Pickups.level_events.grimoire = {
	only_once = true,
	type = "inventory_item",
	slot_name = "slot_potion",
	item_description = "grimoire",
	spawn_weighting = 1,
	debug_pickup_category = "special",
	pickup_sound_event = "pickup_medkit",
	item_name = "wpn_grimoire_01",
	unit_name = "units/weapons/player/pup_grimoire_01/pup_grimoire_01",
	local_pickup_sound = true,
	hud_description = "grimoire"
}
Pickups.level_events.tome = {
	only_once = true,
	type = "inventory_item",
	slot_name = "slot_healthkit",
	item_description = "tome",
	spawn_weighting = 1,
	debug_pickup_category = "special",
	pickup_sound_event = "pickup_medkit",
	item_name = "wpn_side_objective_tome_01",
	unit_name = "units/weapons/player/pup_side_objective_tome/pup_side_objective_tome_01",
	local_pickup_sound = true,
	hud_description = "tome"
}
Pickups.level_events.cannon_ball = {
	only_once = true,
	slot_name = "slot_level_event",
	type = "inventory_item",
	item_description = "cannon_ball",
	spawn_weighting = 1e-06,
	debug_pickup_category = "level_event",
	item_name = "wpn_cannon_ball_01",
	unit_name = "units/weapons/player/pup_cannon_ball_01/pup_cannon_ball_01",
	unit_template_name = "pickup_projectile_unit_limited",
	wield_on_pickup = true,
	hud_description = "cannon_ball"
}
Pickups.ammo = Pickups.ammo or {}
Pickups.ammo.all_ammo = {
	only_once = false,
	type = "ammo",
	spawn_weighting = 1,
	debug_pickup_category = "consumables",
	unit_name = "units/weapons/player/pup_ammo_box/pup_ammo_box",
	unit_template_name = "pickup_unit",
	local_pickup_sound = true,
	hud_description = "interaction_ammunition_crate",
	pickup_sound_event_func = function (interactor_unit, interactable_unit, data)
		local inventory_extension = ScriptUnit.extension(interactor_unit, "inventory_system")
		local full_ammo = inventory_extension:has_full_ammo()

		return (full_ammo and "pickup_ammo_full") or "pickup_ammo"
	end,
	can_interact_func = function (interactor_unit, interactable_unit, data)
		local inventory_extension = ScriptUnit.extension(interactor_unit, "inventory_system")

		return inventory_extension:has_ammo_consuming_weapon_equipped()
	end
}
Pickups.ammo.all_ammo_small = {
	only_once = true,
	spawn_weighting = 2,
	type = "ammo",
	pickup_sound_event = "pickup_ammo",
	debug_pickup_category = "consumables",
	unit_name = "units/weapons/player/pup_ammo_box/pup_ammo_box_limited",
	unit_template_name = "pickup_unit",
	consumable_item = true,
	local_pickup_sound = true,
	hud_description = "interaction_ammunition",
	can_interact_func = function (interactor_unit, interactable_unit, data)
		local inventory_extension = ScriptUnit.extension(interactor_unit, "inventory_system")

		return inventory_extension:has_ammo_consuming_weapon_equipped()
	end
}
Pickups.ammo.ammo_ranger = {
	only_once = true,
	refill_amount = 0.1,
	type = "ammo",
	pickup_sound_event = "pickup_ammo",
	debug_pickup_category = "consumables",
	spawn_weighting = 1e-06,
	unit_name = "units/weapons/player/pup_ammo_box/pup_ammo_box_limited",
	unit_template_name = "pickup_unit",
	consumable_item = true,
	local_pickup_sound = true,
	hud_description = "interaction_ranger_ammunition",
	can_interact_func = function (interactor_unit, interactable_unit, data)
		local inventory_extension = ScriptUnit.extension(interactor_unit, "inventory_system")

		return inventory_extension:has_ammo_consuming_weapon_equipped()
	end
}
Pickups.ammo.ammo_ranger_improved = {
	only_once = true,
	refill_amount = 0.3,
	type = "ammo",
	pickup_sound_event = "pickup_ammo",
	debug_pickup_category = "consumables",
	spawn_weighting = 1e-06,
	unit_name = "units/weapons/player/pup_ammo_box/pup_ammo_box_limited",
	unit_template_name = "pickup_unit",
	consumable_item = true,
	local_pickup_sound = true,
	hud_description = "interaction_ranger_ammunition_improved",
	can_interact_func = function (interactor_unit, interactable_unit, data)
		local inventory_extension = ScriptUnit.extension(interactor_unit, "inventory_system")

		return inventory_extension:has_ammo_consuming_weapon_equipped()
	end
}
Pickups.grenades = Pickups.grenades or {}
Pickups.grenades.frag_grenade_t1 = {
	only_once = true,
	type = "inventory_item",
	slot_name = "slot_grenade",
	item_description = "grenade_frag",
	spawn_weighting = 0.8,
	debug_pickup_category = "grenades",
	dupable = true,
	bots_mule_pickup = true,
	item_name = "grenade_frag_01",
	unit_name = "units/weapons/player/pup_grenades/pup_grenade_01_t1",
	pickup_sound_event = "pickup_grenade",
	consumable_item = true,
	local_pickup_sound = true,
	hud_description = "grenade_frag"
}
Pickups.grenades.smoke_grenade_t1 = {
	only_once = true,
	item_description = "grenade_smoke",
	slot_name = "slot_grenade",
	type = "inventory_item",
	spawn_weighting = 0,
	debug_pickup_category = "grenades",
	dupable = true,
	pickup_sound_event = "pickup_grenade",
	item_name = "grenade_smoke_01",
	unit_name = "units/weapons/player/pup_grenades/pup_grenade_02_t1",
	consumable_item = true,
	local_pickup_sound = true,
	hud_description = "grenade_smoke"
}
Pickups.grenades.fire_grenade_t1 = {
	only_once = true,
	item_description = "grenade_fire",
	slot_name = "slot_grenade",
	type = "inventory_item",
	spawn_weighting = 0.8,
	debug_pickup_category = "grenades",
	dupable = true,
	bots_mule_pickup = true,
	item_name = "grenade_fire_01",
	unit_name = "units/weapons/player/pup_grenades/pup_grenade_03_t1",
	pickup_sound_event = "pickup_grenade",
	consumable_item = true,
	local_pickup_sound = true,
	hud_description = "grenade_fire"
}
Pickups.improved_grenades = Pickups.improved_grenades or {}
Pickups.improved_grenades.frag_grenade_t2 = {
	only_once = true,
	type = "inventory_item",
	slot_name = "slot_grenade",
	item_description = "grenade_frag",
	spawn_weighting = 0.2,
	debug_pickup_category = "grenades",
	dupable = true,
	bots_mule_pickup = true,
	item_name = "grenade_frag_02",
	unit_name = "units/weapons/player/pup_grenades/pup_grenade_01_t2",
	pickup_sound_event = "pickup_grenade",
	consumable_item = true,
	local_pickup_sound = true,
	hud_description = "grenade_frag"
}
Pickups.improved_grenades.smoke_grenade_t2 = {
	only_once = true,
	type = "inventory_item",
	slot_name = "slot_grenade",
	item_description = "grenade_smoke",
	spawn_weighting = 0,
	debug_pickup_category = "grenades",
	dupable = true,
	pickup_sound_event = "pickup_grenade",
	item_name = "grenade_smoke_02",
	unit_name = "units/weapons/player/pup_grenades/pup_grenade_02_t2",
	consumable_item = true,
	local_pickup_sound = true,
	hud_description = "grenade_smoke"
}
Pickups.improved_grenades.fire_grenade_t2 = {
	only_once = true,
	type = "inventory_item",
	slot_name = "slot_grenade",
	item_description = "grenade_fire",
	spawn_weighting = 0.2,
	debug_pickup_category = "grenades",
	dupable = true,
	bots_mule_pickup = true,
	item_name = "grenade_fire_02",
	unit_name = "units/weapons/player/pup_grenades/pup_grenade_03_t2",
	pickup_sound_event = "pickup_grenade",
	consumable_item = true,
	local_pickup_sound = true,
	hud_description = "grenade_fire"
}
Pickups.special = {
	loot_die = {
		only_once = true,
		mission_name = "bonus_dice_hidden_mission",
		spawn_weighting = 1,
		type = "loot_die",
		pickup_sound_event = "hud_pickup_loot_die",
		debug_pickup_category = "special",
		unit_name = "units/props/dice_bowl/pup_loot_die",
		local_pickup_sound = false,
		hud_description = "interaction_loot_dice",
		can_spawn_func = function (params, is_debug_spawn)
			if is_debug_spawn then
				return true
			end

			local dice_keeper = params.dice_keeper

			return dice_keeper:num_bonus_dice_spawned() < 2
		end
	},
	endurance_badge_01 = {
		only_once = true,
		mission_name = "endurance_badge_01_mission",
		spawn_weighting = 1e-06,
		type = "endurance_badge",
		pickup_sound_event = "Play_hud_pickup_badge",
		debug_pickup_category = "special",
		unit_name = "units/props/endurance_badges/prop_endurance_badge_01",
		local_pickup_sound = false,
		hud_description = "interaction_endurance_badge"
	}
}
Pickups.special.endurance_badge_02 = table.clone(Pickups.special.endurance_badge_01)
Pickups.special.endurance_badge_02.unit_name = "units/props/endurance_badges/prop_endurance_badge_02"
Pickups.special.endurance_badge_02.mission_name = "endurance_badge_02_mission"
Pickups.special.endurance_badge_03 = table.clone(Pickups.special.endurance_badge_01)
Pickups.special.endurance_badge_03.unit_name = "units/props/endurance_badges/prop_endurance_badge_03"
Pickups.special.endurance_badge_03.mission_name = "endurance_badge_03_mission"
Pickups.special.endurance_badge_04 = table.clone(Pickups.special.endurance_badge_01)
Pickups.special.endurance_badge_04.unit_name = "units/props/endurance_badges/prop_endurance_badge_04"
Pickups.special.endurance_badge_04.mission_name = "endurance_badge_04_mission"
Pickups.special.endurance_badge_05 = table.clone(Pickups.special.endurance_badge_01)
Pickups.special.endurance_badge_05.unit_name = "units/props/endurance_badges/prop_endurance_badge_05"
Pickups.special.endurance_badge_05.mission_name = "endurance_badge_05_mission"

if script_data then
	script_data.lorebook_enabled = script_data.lorebook_enabled or Development.parameter("lorebook_enabled")
end

Pickups.lorebook_pages = {
	lorebook_page = {
		only_once = false,
		spawn_weighting = 1,
		hide_on_pickup = true,
		type = "lorebook_page",
		pickup_sound_event = "Play_hud_lorebook_unlock_page",
		debug_pickup_category = "special",
		unit_name = "units/weapons/player/pup_lore_page/pup_lore_page_01",
		hud_description = "interaction_lorebook_page",
		hide_func = function (statistics_db)
			local level_key = Managers.state.game_mode:level_key()
			local pages = LorebookCollectablePages[level_key]

			fassert(pages, "Trying to a pick up a lorebook page on a level where pages can not be unlocked")

			local num_pages = #pages
			local local_player = Managers.player:local_player()
			local stats_id = local_player:stats_id()
			local unlocked_all = true

			for i = 1, num_pages, 1 do
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
		end
	}
}
LootRatPickups = {
	first_aid_kit = 3,
	healing_draught = 2,
	damage_boost_potion = 1,
	speed_boost_potion = 1,
	cooldown_reduction_potion = 1,
	frag_grenade_t2 = 1,
	fire_grenade_t2 = 1,
	loot_die = 4,
	lorebook_page = 4
}
local total_loot_rat_spawn_weighting = 0

for pickup_name, spawn_weighting in pairs(LootRatPickups) do
	total_loot_rat_spawn_weighting = total_loot_rat_spawn_weighting + spawn_weighting
end

for pickup_name, spawn_weighting in pairs(LootRatPickups) do
	LootRatPickups[pickup_name] = spawn_weighting / total_loot_rat_spawn_weighting
end

NearPickupSpawnChance = NearPickupSpawnChance or {
	grenades = 0.5,
	healing = 0.7,
	potions = 0.3
}
AllPickups = {}

for group, pickups in pairs(Pickups) do
	local total_spawn_weighting = 0

	for pickup_name, settings in pairs(pickups) do
		total_spawn_weighting = total_spawn_weighting + settings.spawn_weighting
	end

	for pickup_name, settings in pairs(pickups) do
		settings.spawn_weighting = settings.spawn_weighting / total_spawn_weighting
		AllPickups[pickup_name] = settings
	end

	NearPickupSpawnChance[group] = NearPickupSpawnChance[group] or 0
end

return

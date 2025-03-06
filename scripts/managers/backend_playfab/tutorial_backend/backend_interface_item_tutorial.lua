-- chunkname: @scripts/managers/backend_playfab/tutorial_backend/backend_interface_item_tutorial.lua

BackendInterfaceItemTutorial = class(BackendInterfaceItemTutorial)

local PlayFabClientApi = require("PlayFab.PlayFabClientApi")

BackendInterfaceItemTutorial.init = function (self, backend_mirror)
	self._loadouts = {}
	self._items = {}
	self._backend_mirror = backend_mirror
	self._modified_templates = {}

	self:_refresh()
end

local loadout_slots = {
	"slot_ranged",
	"slot_melee",
	"slot_skin",
	"slot_hat",
	"slot_necklace",
	"slot_ring",
	"slot_trinket_1",
	"slot_frame",
}

BackendInterfaceItemTutorial._refresh = function (self)
	self:_refresh_items()
	self:_refresh_loadouts()

	self._dirty = false
end

BackendInterfaceItemTutorial._refresh_items = function (self)
	self._items = {
		{
			backend_id = 1,
			key = "es_longbow_tutorial",
			power_level = 10,
			rarity = "default",
			data = ItemMasterList.es_longbow_tutorial,
		},
		{
			backend_id = 2,
			key = "es_2h_hammer_tutorial",
			power_level = 10,
			rarity = "default",
			data = ItemMasterList.es_2h_hammer_tutorial,
		},
		{
			backend_id = 3,
			key = "skin_es_knight",
			rarity = "default",
			data = ItemMasterList.skin_es_knight,
		},
		{
			backend_id = 4,
			key = "knight_hat_0000",
			rarity = "default",
			data = ItemMasterList.knight_hat_0000,
		},
		{
			backend_id = 5,
			key = "dr_crossbow",
			power_level = 10,
			rarity = "default",
			data = ItemMasterList.dr_crossbow,
		},
		{
			backend_id = 6,
			key = "dr_1h_axe",
			power_level = 10,
			rarity = "default",
			data = ItemMasterList.dr_1h_axe,
		},
		{
			backend_id = 7,
			key = "skin_dr_ranger",
			rarity = "default",
			data = ItemMasterList.skin_dr_ranger,
		},
		{
			backend_id = 8,
			key = "ranger_hat_0000",
			rarity = "default",
			data = ItemMasterList.ranger_hat_0000,
		},
		{
			backend_id = 9,
			key = "we_longbow",
			power_level = 10,
			rarity = "default",
			data = ItemMasterList.we_longbow,
		},
		{
			backend_id = 10,
			key = "we_dual_wield_daggers",
			power_level = 10,
			rarity = "default",
			data = ItemMasterList.we_dual_wield_daggers,
		},
		{
			backend_id = 11,
			key = "skin_ww_waywatcher",
			rarity = "default",
			data = ItemMasterList.skin_ww_waywatcher,
		},
		{
			backend_id = 12,
			key = "waywatcher_hat_0000",
			rarity = "default",
			data = ItemMasterList.waywatcher_hat_0000,
		},
		{
			backend_id = 13,
			key = "bw_skullstaff_fireball",
			power_level = 10,
			rarity = "default",
			data = ItemMasterList.bw_skullstaff_fireball,
		},
		{
			backend_id = 14,
			key = "bw_1h_mace",
			power_level = 10,
			rarity = "default",
			data = ItemMasterList.bw_1h_mace,
		},
		{
			backend_id = 15,
			key = "skin_bw_adept",
			rarity = "default",
			data = ItemMasterList.skin_bw_adept,
		},
		{
			backend_id = 16,
			key = "adept_hat_0000",
			rarity = "default",
			data = ItemMasterList.adept_hat_0000,
		},
	}
end

BackendInterfaceItemTutorial._refresh_loadouts = function (self)
	self._loadouts = {
		empire_soldier_tutorial = {
			slot_hat = 4,
			slot_melee = 2,
			slot_ranged = 1,
			slot_skin = 3,
		},
		dr_ranger = {
			slot_hat = 8,
			slot_melee = 6,
			slot_ranged = 5,
			slot_skin = 7,
		},
		we_waywatcher = {
			slot_hat = 12,
			slot_melee = 10,
			slot_ranged = 9,
			slot_skin = 11,
		},
		bw_adept = {
			slot_hat = 16,
			slot_melee = 14,
			slot_ranged = 13,
			slot_skin = 15,
		},
	}
end

BackendInterfaceItemTutorial.ready = function (self)
	if self._items then
		return true
	end

	return false
end

BackendInterfaceItemTutorial.type = function (self)
	return "backend"
end

BackendInterfaceItemTutorial.update = function (self)
	return
end

BackendInterfaceItemTutorial.refresh_entities = function (self)
	return
end

BackendInterfaceItemTutorial.check_for_errors = function (self)
	return
end

BackendInterfaceItemTutorial.num_current_item_server_requests = function (self)
	return 0
end

BackendInterfaceItemTutorial.set_properties_serialized = function (self, backend_id, properties)
	return
end

BackendInterfaceItemTutorial.get_properties = function (self, backend_id)
	local item = self:get_item_from_id(backend_id)

	if item then
		local properties = item.properties

		return properties
	end

	return nil
end

BackendInterfaceItemTutorial.get_traits = function (self, backend_id)
	local item = self:get_item_from_id(backend_id)

	if item then
		local traits = item.traits

		return traits
	end

	return nil
end

BackendInterfaceItemTutorial.set_runes = function (self, backend_id, runes)
	return
end

BackendInterfaceItemTutorial.get_runes = function (self, backend_id)
	return
end

BackendInterfaceItemTutorial.socket_rune = function (self, backend_id, rune_to_insert, rune_index)
	return
end

BackendInterfaceItemTutorial.get_skin = function (self)
	return nil
end

BackendInterfaceItemTutorial.get_item_masterlist_data = function (self, backend_id)
	local item = self:get_item_from_id(backend_id)

	if item then
		return item.data
	end
end

BackendInterfaceItemTutorial.get_item_amount = function (self, backend_id)
	local item = self:get_item_from_id(backend_id)

	return item.RemainingUses or 1
end

BackendInterfaceItemTutorial.get_item_power_level = function (self, backend_id)
	local item = self:get_item_from_id(backend_id)
	local power_level = item.power_level

	return power_level
end

BackendInterfaceItemTutorial.get_item_rarity = function (self, backend_id)
	local item = self:get_item_from_id(backend_id)
	local rarity = item.rarity

	return rarity
end

BackendInterfaceItemTutorial.get_key = function (self, backend_id)
	local item = self:get_item_from_id(backend_id)

	return item.key
end

BackendInterfaceItemTutorial.get_item_from_id = function (self, backend_id)
	local items = self:get_all_backend_items()
	local item = items[backend_id]

	return item
end

BackendInterfaceItemTutorial.get_item_from_key = function (self, item_key)
	local items = self:get_all_backend_items()

	for _, item in pairs(items) do
		if item.key == item_key then
			return item
		end
	end
end

BackendInterfaceItemTutorial.get_all_backend_items = function (self)
	if self._dirty then
		self:_refresh()
	end

	return self._items
end

BackendInterfaceItemTutorial.get_loadout = function (self)
	if self._dirty then
		self:_refresh()
	end

	return self._loadouts
end

BackendInterfaceItemTutorial.get_loadout_by_career_name = function (self, career_name)
	if self._dirty then
		self:_refresh()
	end

	return self._loadouts[career_name]
end

BackendInterfaceItemTutorial.get_loadout_item_id = function (self, career_name, slot_name)
	local loadouts = self:get_loadout()

	return loadouts[career_name][slot_name]
end

local empty_params = {}

BackendInterfaceItemTutorial.get_filtered_items = function (self, filter, params)
	local all_items = self:get_all_backend_items()
	local backend_common = Managers.backend:get_interface("common")
	local items = backend_common:filter_items(all_items, filter, params or empty_params)

	return items
end

BackendInterfaceItemTutorial.set_loadout_item = function (self, item_id, career_name, slot_name)
	local all_items = self:get_all_backend_items()

	if item_id then
		fassert(all_items[item_id], "Trying to equip item that doesn't exist %d", item_id or "nil")
	end

	self._backend_mirror:set_character_data(career_name, slot_name, item_id)

	self._dirty = true
end

BackendInterfaceItemTutorial.remove_item = function (self, backend_id, ignore_equipped)
	return
end

BackendInterfaceItemTutorial.award_item = function (self, item_key)
	return
end

BackendInterfaceItemTutorial.data_server_script = function (self, script_name, ...)
	return
end

BackendInterfaceItemTutorial.upgrades_failed_game = function (self, level_start, level_end)
	return
end

BackendInterfaceItemTutorial.poll_upgrades_failed_game = function (self)
	return
end

BackendInterfaceItemTutorial.generate_item_server_loot = function (self, dice, difficulty, start_level, end_level, hero_name, dlc_name)
	return
end

BackendInterfaceItemTutorial.check_for_loot = function (self)
	return
end

BackendInterfaceItemTutorial.equipped_by = function (self, backend_id)
	local loadouts = self._loadouts
	local equipped_careers = {}

	for career_name, items_by_slot in pairs(loadouts) do
		for slot_name, item_id in pairs(items_by_slot) do
			if backend_id == item_id then
				table.insert(equipped_careers, career_name)
			end
		end
	end

	return equipped_careers
end

BackendInterfaceItemTutorial.is_equipped = function (self, backend_id, profile_name)
	return
end

BackendInterfaceItemTutorial.set_data_server_queue = function (self, queue)
	return
end

BackendInterfaceItemTutorial.make_dirty = function (self)
	self._dirty = true
end

BackendInterfaceItemTutorial.has_item = function (self, item_key)
	local items = self:get_all_backend_items()

	for backend_id, item in pairs(items) do
		if item_key == item.key then
			return true
		end
	end

	return false
end

BackendInterfaceItemTutorial.get_item_template = function (self, item_data, backend_id)
	local template_name = item_data.temporary_template or item_data.template
	local item_template = WeaponUtils.get_weapon_template(template_name)
	local modified_templates = self._modified_templates

	if item_template then
		if backend_id then
			if not modified_templates[backend_id] then
				modified_templates[backend_id] = {}
			end

			if not modified_templates[backend_id][template_name] then
				table.clear(modified_templates[backend_id])

				modified_templates[backend_id][template_name] = GearUtils.apply_properties_to_item_template(item_template, backend_id)
			end

			return modified_templates[backend_id][template_name]
		end

		return item_template
	end

	item_template = Attachments[template_name]

	if item_template then
		return item_template
	end

	item_template = Cosmetics[template_name]

	if item_template then
		return item_template
	end

	fassert(false, "no item_template for item: " .. item_data.key .. ", template name = " .. template_name)
end

BackendInterfaceItemTutorial.sum_best_power_levels = function (self)
	return 10
end

BackendInterfaceItemTutorial.configure_game_mode_specific_items = function (self, game_mode, items)
	return
end

BackendInterfaceItemTutorial.set_game_mode_specific_items = function (self, game_mode)
	return
end

local WEAPON_POSE_DATA = {
	equipped_weapon_pose_skin = {},
}

BackendInterfaceItemTutorial.get_dirty_weapon_pose_data = function (self)
	return WEAPON_POSE_DATA
end

local UNLOCKED_WEAPON_POSES = {}

BackendInterfaceItemTutorial.get_unlocked_weapon_poses = function (self)
	return UNLOCKED_WEAPON_POSES
end

local EQUIPPED_WEAPON_POSES = {}

BackendInterfaceItemTutorial.get_equipped_weapon_pose_skins = function (self)
	return EQUIPPED_WEAPON_POSES
end

BackendInterfaceItemTutorial.get_equipped_weapon_pose_skin = function (self, parent_item_name)
	return nil
end

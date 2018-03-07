BackendInterfaceItemTutorial = class(BackendInterfaceItemTutorial)
local PlayFabClientApi = require("PlayFab.PlayFabClientApi")
BackendInterfaceItemTutorial.init = function (self, backend_mirror)
	self._loadouts = {}
	self._items = {}
	self._backend_mirror = backend_mirror
	self._modified_templates = {}

	self._refresh(self)

	return 
end
local loadout_slots = {
	"slot_ranged",
	"slot_melee",
	"slot_skin",
	"slot_hat",
	"slot_necklace",
	"slot_ring",
	"slot_trinket_1",
	"slot_frame"
}
BackendInterfaceItemTutorial._refresh = function (self)
	self._refresh_items(self)
	self._refresh_loadouts(self)

	self._dirty = false

	return 
end
BackendInterfaceItemTutorial._refresh_items = function (self)
	self._items = {
		{
			key = "es_longbow_tutorial",
			rarity = "default",
			power_level = 10,
			backend_id = 1,
			data = ItemMasterList.es_longbow_tutorial
		},
		{
			key = "es_2h_hammer_tutorial",
			rarity = "default",
			power_level = 10,
			backend_id = 2,
			data = ItemMasterList.es_2h_hammer_tutorial
		},
		{
			key = "skin_es_knight",
			backend_id = 3,
			rarity = "default",
			data = ItemMasterList.skin_es_knight
		},
		{
			key = "knight_hat_0000",
			backend_id = 4,
			rarity = "default",
			data = ItemMasterList.knight_hat_0000
		},
		{
			key = "dr_crossbow",
			rarity = "default",
			power_level = 10,
			backend_id = 5,
			data = ItemMasterList.dr_crossbow
		},
		{
			key = "dr_1h_axe",
			rarity = "default",
			power_level = 10,
			backend_id = 6,
			data = ItemMasterList.dr_1h_axe
		},
		{
			key = "skin_dr_ranger",
			backend_id = 7,
			rarity = "default",
			data = ItemMasterList.skin_dr_ranger
		},
		{
			key = "ranger_hat_0000",
			backend_id = 8,
			rarity = "default",
			data = ItemMasterList.ranger_hat_0000
		},
		{
			key = "we_longbow",
			rarity = "default",
			power_level = 10,
			backend_id = 9,
			data = ItemMasterList.we_longbow
		},
		{
			key = "we_1h_sword",
			rarity = "default",
			power_level = 10,
			backend_id = 10,
			data = ItemMasterList.we_1h_sword
		},
		{
			key = "skin_ww_waywatcher",
			backend_id = 11,
			rarity = "default",
			data = ItemMasterList.skin_ww_waywatcher
		},
		{
			key = "waywatcher_hat_0000",
			backend_id = 12,
			rarity = "default",
			data = ItemMasterList.waywatcher_hat_0000
		},
		{
			key = "bw_skullstaff_fireball",
			rarity = "default",
			power_level = 10,
			backend_id = 13,
			data = ItemMasterList.bw_skullstaff_fireball
		},
		{
			key = "bw_1h_mace",
			rarity = "default",
			power_level = 10,
			backend_id = 14,
			data = ItemMasterList.bw_1h_mace
		},
		{
			key = "skin_bw_adept",
			backend_id = 15,
			rarity = "default",
			data = ItemMasterList.skin_bw_adept
		},
		{
			key = "adept_hat_0000",
			backend_id = 16,
			rarity = "default",
			data = ItemMasterList.adept_hat_0000
		}
	}

	return 
end
BackendInterfaceItemTutorial._refresh_loadouts = function (self)
	self._loadouts = {
		empire_soldier_tutorial = {
			slot_skin = 3,
			slot_melee = 2,
			slot_hat = 4,
			slot_ranged = 1
		},
		dr_ranger = {
			slot_skin = 7,
			slot_melee = 6,
			slot_hat = 8,
			slot_ranged = 5
		},
		we_waywatcher = {
			slot_skin = 11,
			slot_melee = 10,
			slot_hat = 12,
			slot_ranged = 9
		},
		bw_adept = {
			slot_skin = 15,
			slot_melee = 14,
			slot_hat = 16,
			slot_ranged = 13
		}
	}

	return 
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
	local item = self.get_item_from_id(self, backend_id)

	if item then
		local properties = item.properties

		return properties
	end

	return nil
end
BackendInterfaceItemTutorial.get_traits = function (self, backend_id)
	local item = self.get_item_from_id(self, backend_id)

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
	local item = self.get_item_from_id(self, backend_id)

	if item then
		return item.data
	end

	return 
end
BackendInterfaceItemTutorial.get_item_amount = function (self, backend_id)
	local item = self.get_item_from_id(self, backend_id)

	return item.RemainingUses or 1
end
BackendInterfaceItemTutorial.get_item_power_level = function (self, backend_id)
	local item = self.get_item_from_id(self, backend_id)
	local power_level = item.power_level

	return power_level
end
BackendInterfaceItemTutorial.get_item_rarity = function (self, backend_id)
	local item = self.get_item_from_id(self, backend_id)
	local rarity = item.rarity

	return rarity
end
BackendInterfaceItemTutorial.get_key = function (self, backend_id)
	local item = self.get_item_from_id(self, backend_id)

	return item.key
end
BackendInterfaceItemTutorial.get_item_from_id = function (self, backend_id)
	local items = self.get_all_backend_items(self)
	local item = items[backend_id]

	return item
end
BackendInterfaceItemTutorial.get_all_backend_items = function (self)
	if self._dirty then
		self._refresh(self)
	end

	return self._items
end
BackendInterfaceItemTutorial.get_loadout = function (self)
	if self._dirty then
		self._refresh(self)
	end

	return self._loadouts
end
BackendInterfaceItemTutorial.get_loadout_item_id = function (self, career_name, slot_name)
	local loadouts = self.get_loadout(self)

	return loadouts[career_name][slot_name]
end
BackendInterfaceItemTutorial.get_filtered_items = function (self, filter)
	local all_items = self.get_all_backend_items(self)
	local backend_common = Managers.backend:get_interface("common")
	local items = backend_common.filter_items(backend_common, all_items, filter)

	return items
end
BackendInterfaceItemTutorial.set_loadout_item = function (self, item_id, career_name, slot_name)
	local all_items = self.get_all_backend_items(self)

	if item_id then
		fassert(all_items[item_id], "Trying to equip item that doesn't exist %d", item_id or "nil")
	end

	self._backend_mirror:set_character_data(career_name, slot_name, item_id)

	self._dirty = true

	return 
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

	for career_name, items_by_slot in pairs(loadouts) do
		for slot_name, item_id in pairs(items_by_slot) do
			if backend_id == item_id then
				return career_name
			end
		end
	end

	return 
end
BackendInterfaceItemTutorial.is_equipped = function (self, backend_id, profile_name)
	return 
end
BackendInterfaceItemTutorial.set_data_server_queue = function (self, queue)
	return 
end
BackendInterfaceItemTutorial.make_dirty = function (self)
	self._dirty = true

	return 
end
BackendInterfaceItemTutorial.has_item = function (self, item_key)
	local items = self.get_all_backend_items(self)

	for backend_id, item in pairs(items) do
		if item_key == item.key then
			return true
		end
	end

	return false
end
BackendInterfaceItemTutorial.get_item_template = function (self, item_data, backend_id)
	local template_name = item_data.temporary_template or item_data.template
	local item_template = Weapons[template_name]
	local modified_item_templates = self._modified_templates
	local modified_item_template = nil

	if item_template then
		if backend_id then
			if not modified_item_templates[backend_id] then
				modified_item_template = GearUtils.apply_properties_to_item_template(item_template, backend_id)
				self._modified_templates[backend_id] = modified_item_template
			else
				return modified_item_templates[backend_id]
			end
		end

		return modified_item_template or item_template
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

	return 
end
BackendInterfaceItemTutorial.sum_best_power_levels = function (self)
	return 10
end

return 

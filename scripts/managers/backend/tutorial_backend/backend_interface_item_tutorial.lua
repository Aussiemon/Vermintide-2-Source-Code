BackendInterfaceItemPlayfab = class(BackendInterfaceItemPlayfab)
local PlayFabClientApi = require("PlayFab.PlayFabClientApi")
BackendInterfaceItemPlayfab.init = function (self, backend_mirror)
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
BackendInterfaceItemPlayfab._refresh = function (self)
	self._refresh_items(self)
	self._refresh_loadouts(self)

	self._dirty = false

	return 
end
BackendInterfaceItemPlayfab._refresh_items = function (self)
	return 
end
BackendInterfaceItemPlayfab._refresh_loadouts = function (self)
	return 
end
BackendInterfaceItemPlayfab.ready = function (self)
	if self._items then
		return true
	end

	return false
end
BackendInterfaceItemPlayfab.type = function (self)
	return "backend"
end
BackendInterfaceItemPlayfab.update = function (self)
	return 
end
BackendInterfaceItemPlayfab.refresh_entities = function (self)
	return 
end
BackendInterfaceItemPlayfab.check_for_errors = function (self)
	return 
end
BackendInterfaceItemPlayfab.num_current_item_server_requests = function (self)
	return 0
end
BackendInterfaceItemPlayfab.set_properties_serialized = function (self, backend_id, properties)
	return 
end
BackendInterfaceItemPlayfab.get_properties = function (self, backend_id)
	local item = self.get_item_from_id(self, backend_id)

	if item then
		local properties = item.properties

		return properties
	end

	return nil
end
BackendInterfaceItemPlayfab.get_traits = function (self, backend_id)
	local item = self.get_item_from_id(self, backend_id)

	if item then
		local traits = item.traits

		return traits
	end

	return nil
end
BackendInterfaceItemPlayfab.set_runes = function (self, backend_id, runes)
	return 
end
BackendInterfaceItemPlayfab.get_runes = function (self, backend_id)
	return 
end
BackendInterfaceItemPlayfab.socket_rune = function (self, backend_id, rune_to_insert, rune_index)
	return 
end
BackendInterfaceItemPlayfab.get_skin = function (self)
	return nil
end
BackendInterfaceItemPlayfab.get_item_masterlist_data = function (self, backend_id)
	local item = self.get_item_from_id(self, backend_id)

	if item then
		return item.data
	end

	return 
end
BackendInterfaceItemPlayfab.get_item_amount = function (self, backend_id)
	local item = self.get_item_from_id(self, backend_id)

	return item.RemainingUses or 1
end
BackendInterfaceItemPlayfab.get_item_power_level = function (self, backend_id)
	local item = self.get_item_from_id(self, backend_id)
	local power_level = item.power_level

	return power_level
end
BackendInterfaceItemPlayfab.get_item_rarity = function (self, backend_id)
	local item = self.get_item_from_id(self, backend_id)
	local rarity = item.rarity

	return rarity
end
BackendInterfaceItemPlayfab.get_key = function (self, backend_id)
	local item = self.get_item_from_id(self, backend_id)

	return item.key
end
BackendInterfaceItemPlayfab.get_item_from_id = function (self, backend_id)
	local items = self.get_all_backend_items(self)
	local item = items[backend_id]

	return item
end
BackendInterfaceItemPlayfab.get_all_backend_items = function (self)
	if self._dirty then
		self._refresh(self)
	end

	return self._items
end
BackendInterfaceItemPlayfab.get_loadout = function (self)
	if self._dirty then
		self._refresh(self)
	end

	return self._loadouts
end
BackendInterfaceItemPlayfab.get_loadout_item_id = function (self, career_name, slot_name)
	local loadouts = self.get_loadout(self)

	return loadouts[career_name][slot_name]
end
BackendInterfaceItemPlayfab.get_filtered_items = function (self, filter)
	local all_items = self.get_all_backend_items(self)
	local backend_common = Managers.backend:get_interface("common")
	local items = backend_common.filter_items(backend_common, all_items, filter)

	return items
end
BackendInterfaceItemPlayfab.set_loadout_item = function (self, item_id, career_name, slot_name)
	local all_items = self.get_all_backend_items(self)

	if item_id then
		fassert(all_items[item_id], "Trying to equip item that doesn't exist %d", item_id or "nil")
	end

	self._backend_mirror:set_character_data(career_name, slot_name, item_id)

	self._dirty = true

	return 
end
BackendInterfaceItemPlayfab.remove_item = function (self, backend_id, ignore_equipped)
	return 
end
BackendInterfaceItemPlayfab.award_item = function (self, item_key)
	return 
end
BackendInterfaceItemPlayfab.data_server_script = function (self, script_name, ...)
	return 
end
BackendInterfaceItemPlayfab.upgrades_failed_game = function (self, level_start, level_end)
	return 
end
BackendInterfaceItemPlayfab.poll_upgrades_failed_game = function (self)
	return 
end
BackendInterfaceItemPlayfab.generate_item_server_loot = function (self, dice, difficulty, start_level, end_level, hero_name, dlc_name)
	return 
end
BackendInterfaceItemPlayfab.check_for_loot = function (self)
	return 
end
BackendInterfaceItemPlayfab.equipped_by = function (self, backend_id)
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
BackendInterfaceItemPlayfab.is_equipped = function (self, backend_id, profile_name)
	return 
end
BackendInterfaceItemPlayfab.set_data_server_queue = function (self, queue)
	return 
end
BackendInterfaceItemPlayfab.make_dirty = function (self)
	self._dirty = true

	return 
end
BackendInterfaceItemPlayfab.has_item = function (self, item_key)
	local items = self.get_all_backend_items(self)

	for backend_id, item in pairs(items) do
		if item_key == item.key then
			return true
		end
	end

	return false
end
BackendInterfaceItemPlayfab.get_item_template = function (self, item_data, backend_id)
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
BackendInterfaceItemPlayfab.sum_best_power_levels = function (self)
	return 10
end

return 

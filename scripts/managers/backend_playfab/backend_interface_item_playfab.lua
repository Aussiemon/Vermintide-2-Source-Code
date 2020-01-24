BackendInterfaceItemPlayfab = class(BackendInterfaceItemPlayfab)
local PlayFabClientApi = require("PlayFab.PlayFabClientApi")

BackendInterfaceItemPlayfab.init = function (self, backend_mirror)
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
	"slot_frame"
}

BackendInterfaceItemPlayfab._refresh = function (self)
	self:_refresh_items()
	self:_refresh_loadouts()

	self._dirty = false
end

BackendInterfaceItemPlayfab._refresh_items = function (self)
	local backend_mirror = self._backend_mirror
	local items = backend_mirror:get_all_inventory_items()
	local unlocked_weapon_skins = backend_mirror:get_unlocked_weapon_skins()

	for _, item in pairs(items) do
		if item.skin and not unlocked_weapon_skins[item.skin] then
			item.skin = nil
		end
	end

	self._items = items
	local fake_items = backend_mirror:get_all_fake_inventory_items()
	self._fake_items = fake_items
	local new_backend_ids = ItemHelper.get_new_backend_ids()

	if new_backend_ids then
		for backend_id, _ in pairs(new_backend_ids) do
			if not items[backend_id] then
				ItemHelper.unmark_backend_id_as_new(backend_id)
			end
		end
	end

	local favorite_backend_ids = ItemHelper.get_favorite_backend_ids()

	if favorite_backend_ids then
		for backend_id, _ in pairs(favorite_backend_ids) do
			if not items[backend_id] then
				ItemHelper.unmark_backend_id_as_favorite(backend_id)
			end
		end
	end
end

BackendInterfaceItemPlayfab._refresh_loadouts = function (self)
	local loadouts = self._loadouts
	local backend_mirror = self._backend_mirror

	for career_name, settings in pairs(CareerSettings) do
		if settings.playfab_name then
			for i = 1, #loadout_slots, 1 do
				local slot_name = loadout_slots[i]
				local item_id = backend_mirror:get_character_data(career_name, slot_name)
				loadouts[career_name] = loadouts[career_name] or {}
				loadouts[career_name][slot_name] = item_id
			end
		end
	end
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
	local item = self:get_item_from_id(backend_id)

	if item then
		local properties = item.properties

		return properties
	end

	return nil
end

BackendInterfaceItemPlayfab.get_traits = function (self, backend_id)
	local item = self:get_item_from_id(backend_id)

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

BackendInterfaceItemPlayfab.get_skin = function (self, backend_id)
	local item = self:get_item_from_id(backend_id)

	return item.skin
end

BackendInterfaceItemPlayfab.get_item_masterlist_data = function (self, backend_id)
	local item = self:get_item_from_id(backend_id)

	if item then
		return item.data
	end
end

BackendInterfaceItemPlayfab.get_item_amount = function (self, backend_id)
	local item = self:get_item_from_id(backend_id)

	return item.RemainingUses or 1
end

BackendInterfaceItemPlayfab.get_item_power_level = function (self, backend_id)
	local item = self:get_item_from_id(backend_id)
	local power_level = item.power_level

	return power_level
end

BackendInterfaceItemPlayfab.get_item_rarity = function (self, backend_id)
	local item = self:get_item_from_id(backend_id)
	local rarity = item.rarity

	return rarity
end

BackendInterfaceItemPlayfab.get_key = function (self, backend_id)
	local item = self:get_item_from_id(backend_id)

	return item.key
end

BackendInterfaceItemPlayfab.get_item_from_id = function (self, backend_id)
	local items = self:get_all_backend_items()
	local item = items[backend_id]

	return item
end

BackendInterfaceItemPlayfab.get_item_from_key = function (self, item_key)
	local items = self:get_all_backend_items()

	for _, item in pairs(items) do
		if item.key == item_key then
			return item
		end
	end
end

BackendInterfaceItemPlayfab.get_all_backend_items = function (self)
	if self._dirty then
		self:_refresh()
	end

	return self._items
end

BackendInterfaceItemPlayfab.get_all_fake_backend_items = function (self)
	if self._dirty then
		self:_refresh()
	end

	return self._fake_items
end

BackendInterfaceItemPlayfab.get_loadout = function (self)
	if self._dirty then
		self:_refresh()
	end

	return self._loadouts
end

BackendInterfaceItemPlayfab.get_loadout_item_id = function (self, career_name, slot_name)
	local loadouts = self:get_loadout()

	return loadouts[career_name][slot_name]
end

BackendInterfaceItemPlayfab.get_cosmetic_loadout = function (self, career_name)
	local loadouts = self:get_loadout()
	local career_loadout = loadouts[career_name]

	return career_loadout.slot_hat, career_loadout.slot_skin, career_loadout.slot_frame
end

BackendInterfaceItemPlayfab.get_item_name = function (self, item_id)
	local items = self:get_all_backend_items()

	return items[item_id].key
end

local empty_params = {}

BackendInterfaceItemPlayfab.get_filtered_items = function (self, filter, params)
	local all_items = self:get_all_backend_items()
	local backend_common = Managers.backend:get_interface("common")
	local items = backend_common:filter_items(all_items, filter, params or empty_params)

	return items
end

BackendInterfaceItemPlayfab.set_loadout_item = function (self, item_id, career_name, slot_name)
	local all_items = self:get_all_backend_items()

	if item_id then
		fassert(all_items[item_id], "Trying to equip item that doesn't exist %d", item_id or "nil")
	end

	self._backend_mirror:set_character_data(career_name, slot_name, item_id)

	self._dirty = true
end

BackendInterfaceItemPlayfab.get_unseen_item_rewards = function (self)
	local user_data = self._backend_mirror:get_user_data()
	local unseen_rewards_json = user_data.unseen_rewards

	if not unseen_rewards_json then
		return nil
	end

	local unseen_rewards = cjson.decode(unseen_rewards_json)
	local unseen_items = nil
	local index = 1

	while index <= #unseen_rewards do
		local reward = unseen_rewards[index]
		local reward_type = reward.reward_type

		if reward_type == "item" then
			unseen_items = unseen_items or {}
			unseen_items[#unseen_items + 1] = reward

			table.remove(unseen_rewards, index)
		else
			index = index + 1
		end
	end

	if unseen_items then
		self._backend_mirror:set_user_data("unseen_rewards", cjson.encode(unseen_rewards))
	end

	return unseen_items
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

BackendInterfaceItemPlayfab.is_equipped = function (self, backend_id, profile_name)
	return
end

BackendInterfaceItemPlayfab.set_data_server_queue = function (self, queue)
	return
end

BackendInterfaceItemPlayfab.make_dirty = function (self)
	self._dirty = true
end

BackendInterfaceItemPlayfab.has_item = function (self, item_key)
	local items = self:get_all_backend_items()

	for backend_id, item in pairs(items) do
		if item_key == item.key then
			return true
		end
	end

	return false
end

BackendInterfaceItemPlayfab.has_weapon_illusion = function (self, item_key)
	local items = self:get_all_fake_backend_items()

	for backend_id, item in pairs(items) do
		if item_key == item.skin then
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
end

BackendInterfaceItemPlayfab.sum_best_power_levels = function (self)
	local debug_value = script_data.sum_of_best_power_levels_override

	if debug_value then
		return debug_value
	else
		return self._backend_mirror.sum_best_power_levels
	end
end

return

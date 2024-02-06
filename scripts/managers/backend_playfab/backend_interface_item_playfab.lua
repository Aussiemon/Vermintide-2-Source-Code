-- chunkname: @scripts/managers/backend_playfab/backend_interface_item_playfab.lua

BackendInterfaceItemPlayfab = class(BackendInterfaceItemPlayfab)

local PlayFabClientApi = require("PlayFab.PlayFabClientApi")

BackendInterfaceItemPlayfab.init = function (self, backend_mirror)
	self._loadouts = {}
	self._items = {}
	self._game_mode_specific_items = {}
	self._backend_mirror = backend_mirror
	self._modified_templates = {}
	self._last_id = 0
	self._delete_deeds_request = {}
	self._is_deleting_deeds = false

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

BackendInterfaceItemPlayfab._refresh = function (self)
	self:_refresh_items()
	self:_refresh_loadouts()

	self._dirty = false

	self:_unmark_favorites()
end

BackendInterfaceItemPlayfab._refresh_items = function (self)
	local backend_mirror = self._backend_mirror
	local items = backend_mirror:get_all_inventory_items()
	local unlocked_weapon_skins = backend_mirror:get_unlocked_weapon_skins()
	local unlocked_cosmetics = backend_mirror:get_unlocked_cosmetics()

	for _, item in pairs(items) do
		if not item.bypass_skin_ownership_check and item.skin and not unlocked_weapon_skins[item.skin] then
			item.skin = nil
		end
	end

	if self._active_game_mode_specific_items then
		self._items = table.clone(items)

		for key, item in pairs(self._active_game_mode_specific_items) do
			self._items[key] = item
		end
	else
		self._items = items
	end

	local fake_items = backend_mirror:get_all_fake_inventory_items()

	self._fake_items = fake_items

	local new_backend_ids = ItemHelper.get_new_backend_ids()

	if new_backend_ids then
		for backend_id, _ in pairs(new_backend_ids) do
			if not items[backend_id] then
				ItemHelper.unmark_backend_id_as_new(backend_id, true)
			end
		end

		Managers.save:auto_save(SaveFileName, SaveData, nil)
	end
end

BackendInterfaceItemPlayfab._unmark_favorites = function (self)
	local favorite_backend_ids = ItemHelper.get_favorite_backend_ids()

	if favorite_backend_ids then
		local items = self._items

		for backend_id, _ in pairs(favorite_backend_ids) do
			if not items[backend_id] and not self:get_backend_id_from_cosmetic_item(backend_id) then
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
			for i = 1, #loadout_slots do
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

BackendInterfaceItemPlayfab.get_backend_id_from_cosmetic_item = function (self, item_name)
	local unlocked_cosmetics = self._backend_mirror:get_unlocked_cosmetics()

	return unlocked_cosmetics[item_name]
end

BackendInterfaceItemPlayfab.get_item_from_key = function (self, item_key)
	local items = self:get_all_backend_items()

	for _, item in pairs(items) do
		if item.key == item_key then
			return item
		end
	end
end

BackendInterfaceItemPlayfab.get_weapon_skin_from_skin_key = function (self, skin_key)
	local items = self:get_all_fake_backend_items()

	for id, item in pairs(items) do
		if item.skin == skin_key then
			return id, item
		end
	end
end

local fake_item_types = {
	frame = true,
	hat = true,
	skin = true,
	weapon_skin = true,
}

BackendInterfaceItemPlayfab.free_inventory_slots = function (self)
	local items = self:get_all_backend_items()
	local item_count = 0
	local is_fake_item = ItemHelper.is_fake_item

	for _, item in pairs(items) do
		if not is_fake_item(item.data.item_type) then
			item_count = item_count + 1
		end
	end

	return UISettings.max_inventory_items - item_count
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
	local loadout = loadouts[career_name]
	local item_id = loadout and loadout[slot_name]

	if CosmeticUtils.is_cosmetic_slot(slot_name) and item_id then
		local cosmetics = self._backend_mirror:get_unlocked_cosmetics()

		return cosmetics[item_id]
	end

	return loadout and loadout[slot_name]
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
	local item

	if item_id then
		item = all_items[item_id]

		fassert(item, "Trying to equip item that doesn't exist %d", item_id or "nil")
	end

	if not item then
		print("[BackendInterfaceItemPlayfab] Attempted to equip weapon that doesn't exist:", item_id, career_name, slot_name)

		return false
	end

	if item.rarity == "magic" then
		print("[BackendInterfaceItemPlayfab] Attempted to equip magic weapon in adventure:", item_id, career_name, slot_name)

		return false
	end

	if CosmeticUtils.is_cosmetic_slot(slot_name) then
		item_id = item.override_id or item.ItemId
	end

	self._backend_mirror:set_character_data(career_name, slot_name, item_id)

	self._dirty = true

	return true
end

BackendInterfaceItemPlayfab.add_steam_items = function (self, item_list)
	self._backend_mirror:add_steam_items(item_list)
	self:_refresh_items()
end

BackendInterfaceItemPlayfab.get_unseen_item_rewards = function (self)
	local unseen_rewards_json = self._backend_mirror:get_user_data("unseen_rewards")

	if not unseen_rewards_json then
		return nil
	end

	local unseen_rewards = cjson.decode(unseen_rewards_json)
	local unseen_items
	local index = 1

	while index <= #unseen_rewards do
		local reward = unseen_rewards[index]
		local reward_type = reward.reward_type

		if reward_type == "item" or reward_type == "keep_decoration_painting" or reward_type == "weapon_skin" or CosmeticUtils.is_cosmetic_item(reward_type) then
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

BackendInterfaceItemPlayfab.has_bundle_contents = function (self, bundle_contains)
	if not bundle_contains then
		return false, false, nil
	end

	local all_owned = true
	local any_owned = false
	local required_dlcs = {}

	for i = 1, #bundle_contains do
		local steam_itemdefid = bundle_contains[i]
		local item_key = SteamitemdefidToMasterList[steam_itemdefid]
		local item_data = ItemMasterList[item_key]
		local required_dlc = item_data.required_dlc

		if required_dlc then
			local owns_required_dlc = Managers.unlock:is_dlc_unlocked(required_dlc)

			if not owns_required_dlc and not table.find(required_dlcs, required_dlc) then
				required_dlcs[#required_dlcs + 1] = required_dlc
			end
		end

		if self:has_item(item_key) or self:has_weapon_illusion(item_key) then
			any_owned = true
		else
			all_owned = false
		end
	end

	return all_owned, any_owned, required_dlcs
end

BackendInterfaceItemPlayfab.get_item_template = function (self, item_data, backend_id)
	local template_name = item_data.temporary_template or item_data.template
	local item_template = Weapons[template_name]
	local modified_item_templates = self._modified_templates
	local modified_item_template

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

BackendInterfaceItemPlayfab.configure_game_mode_specific_items = function (self, game_mode, items)
	self._game_mode_specific_items[game_mode] = items
end

BackendInterfaceItemPlayfab.set_game_mode_specific_items = function (self, game_mode)
	self._active_game_mode_specific_items = self._game_mode_specific_items[game_mode]

	self:make_dirty()
end

BackendInterfaceItemPlayfab.refresh_game_mode_specific_items = function (self)
	self:make_dirty()
end

local DEEDS_CHUNK_LIMIT = 300

BackendInterfaceItemPlayfab.delete_marked_deeds = function (self, deeds_list, start_index, end_index)
	self._is_deleting_deeds = true
	start_index = start_index or 1
	end_index = end_index or DEEDS_CHUNK_LIMIT

	local id = self:_new_id()
	local temp_deeds
	local num_elements = #deeds_list

	if start_index > 1 then
		temp_deeds = table.slice(deeds_list, start_index, num_elements)
	else
		temp_deeds = deeds_list
	end

	local reduced_deeds_list = table.map(temp_deeds, function (entry)
		return {
			ItemInstanceId = entry.ItemInstanceId,
		}
	end)

	if end_index < num_elements then
		for i = DEEDS_CHUNK_LIMIT + 1, num_elements do
			reduced_deeds_list[i] = nil
		end
	end

	local delete_marked_deeds_request = {
		FunctionName = "deleteMarkedDeeds",
		FunctionParameter = {
			marked_deeds_list = reduced_deeds_list,
		},
	}
	local data = {
		marked_deeds_list = reduced_deeds_list,
		id = id,
	}
	local success_callback = callback(self, "delete_marked_deeds_request_cb", data, end_index, start_index, deeds_list)
	local request_queue = self._backend_mirror:request_queue()

	request_queue:enqueue(delete_marked_deeds_request, success_callback, true)
end

BackendInterfaceItemPlayfab.delete_marked_deeds_request_cb = function (self, data, end_index, start_index, deeds_list, result)
	local function_result = result.FunctionResult
	local item_revokes = function_result.item_revokes
	local backend_mirror = self._backend_mirror

	if not function_result then
		Managers.backend:playfab_api_error(result)

		return
	elseif function_result.error_message == "no_items_received" then
		Managers.backend:playfab_error(BACKEND_PLAYFAB_ERRORS.ERR_REMOVE_DEEDS_NO_ITEMS_RECEIVED)

		return
	end

	if item_revokes then
		for i = 1, #item_revokes do
			local revoke = item_revokes[i]
			local item_instance_id = revoke.ItemInstanceId

			backend_mirror:remove_item(item_instance_id)
		end
	end

	local num_elements = #deeds_list

	if end_index < num_elements then
		local next_start_index = start_index + DEEDS_CHUNK_LIMIT
		local next_end_index = end_index + DEEDS_CHUNK_LIMIT

		self:delete_marked_deeds(deeds_list, next_start_index, next_end_index)
	else
		self._is_deleting_deeds = false

		Managers.backend:dirtify_interfaces()
	end
end

BackendInterfaceItemPlayfab.is_deleting_deeds = function (self)
	return self._is_deleting_deeds
end

BackendInterfaceItemPlayfab._new_id = function (self)
	self._last_id = self._last_id + 1

	return self._last_id
end

BackendInterfaceItemPlayfab.can_delete_deeds = function (self, current_deeds, marked_deeds)
	if #current_deeds == #marked_deeds then
		return true, current_deeds, marked_deeds
	end

	local remaining_deeds = {}
	local deletable_deeds = {}

	remaining_deeds = current_deeds

	for _, deed in ipairs(marked_deeds) do
		local idx = table.index_of(remaining_deeds, deed)

		if idx ~= -1 then
			table.insert(deletable_deeds, deed)
			table.swap_delete(remaining_deeds, idx)
		end
	end

	if table.is_empty(deletable_deeds) then
		return false, remaining_deeds, nil
	end

	return true, remaining_deeds, deletable_deeds
end

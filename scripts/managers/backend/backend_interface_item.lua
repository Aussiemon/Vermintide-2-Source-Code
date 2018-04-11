local Items = class(Items)
Items.init = function (self)
	self._dirty = true
	self._debug_end_of_round_timeout = false

	return 
end
local CLEARABLE_SLOTS = {
	slot_trinket_2 = true,
	slot_trinket_3 = true,
	slot_trinket_1 = true
}
local MUST_HAVE_SLOTS = {
	slot_hat = true,
	slot_skin = true,
	slot_frame = true,
	slot_melee = true,
	slot_ranged = true
}
local COSMETIC_ITEMS = {
	frame = true,
	skin = true,
	hat = true
}
local STARTING_ITEMS = {
	dr_shield_axe_0001 = true,
	dr_crossbow_0001 = true,
	we_shortbow_0001 = true,
	dr_helmet_0001 = true,
	bw_skullstaff_fireball_0001 = true,
	es_blunderbuss_0001 = true,
	ww_hood_0001 = true,
	bw_gate_0001 = true,
	bw_sword_0001 = true,
	we_dual_wield_daggers_0001 = true,
	es_2h_hammer_0001 = true,
	es_hat_0001 = true,
	wh_hat_0001 = true,
	wh_brace_of_pistols_0001 = true,
	wh_fencing_sword_0001 = true
}

local function find_item_for_slot(items, profile_name, slot)
	for backend_id, item_data in pairs(items) do
		local item_config = ItemMasterList[item_data.key]
		local can_wield = item_config.can_wield

		for _, profile in ipairs(can_wield) do
			if profile == profile_name then
				local slot_type = item_config.slot_type
				local wanted_type = InventorySettings.slots_by_name[slot].type

				if slot_type == wanted_type then
					return backend_id
				end
			end
		end
	end

	return 
end

local function clean_inventory(items, loadout, whitelist)
	if whitelist then
		local items_not_in_whitelist = {}

		for backend_id, item in pairs(items) do
			if not whitelist[item.key] then
				items_not_in_whitelist[backend_id] = item.key
			end
		end

		for backend_id, item_key in pairs(items_not_in_whitelist) do
			print(string.format("[BackendInterfaceItem] Item %q not found in white list, removing it.", item_key))

			items[backend_id] = nil
		end
	end

	local missing_items = nil

	for backend_id, item in pairs(items) do
		if not rawget(ItemMasterList, item.key) then
			missing_items = missing_items or {}
			missing_items[backend_id] = item.key
		end
	end

	local empty_must_have_slots = {}

	for profile_name, slots in pairs(loadout) do
		for slot, backend_id in pairs(slots) do
			if slot == "backend_id" then
			elseif not items[backend_id] then
				ScriptApplication.send_to_crashify("BackendInterfaceItem", "Tried to equip item not found in items list, clearing slot. Profile: %q, Backend id: %d, Slot: %q", profile_name, backend_id, slot)
				BackendItem.set_loadout_item(nil, loadout[profile_name].backend_id, slot)

				slots[slot] = nil

				if MUST_HAVE_SLOTS[slot] then
					empty_must_have_slots[#empty_must_have_slots + 1] = {
						slot = slot,
						profile_name = profile_name
					}
				end
			elseif missing_items and missing_items[backend_id] then
				ScriptApplication.send_to_crashify("BackendInterfaceItem", "Tried to equip item not found in ItemMasterList, clearing slot. Profile: %q, Item: %q, Backend id: %d, Slot: %q", profile_name, missing_items[backend_id], backend_id, slot)
				BackendItem.set_loadout_item(nil, loadout[profile_name].backend_id, slot)

				slots[slot] = nil

				if MUST_HAVE_SLOTS[slot] then
					empty_must_have_slots[#empty_must_have_slots + 1] = {
						slot = slot,
						profile_name = profile_name
					}
				end
			end
		end
	end

	if missing_items then
		for backend_id, key in pairs(missing_items) do
			ScriptApplication.send_to_crashify("BackendInterfaceItem", "Missing item %q in backend, removing it. Backend id: %q", key, backend_id)

			items[backend_id] = nil
		end
	end

	for index, slot_data in ipairs(empty_must_have_slots) do
		local profile_name = slot_data.profile_name
		local slot = slot_data.slot
		local backend_id = find_item_for_slot(items, profile_name, slot)

		if backend_id then
			ScriptApplication.send_to_crashify("BackendInterfaceItem", "Slot %q was empty, putting item %d in it", slot, backend_id)
			BackendItem.set_loadout_item(backend_id, loadout[profile_name].backend_id, slot)

			empty_must_have_slots[index] = nil
			loadout[profile_name][slot] = backend_id
		end
	end

	fassert(table.is_empty(empty_must_have_slots), "[BackendInterfaceItem] Your backend save is broken, ask for help resetting it")

	return 
end

Items.set_item_whitelist = function (self, item_keys)
	local whitelist = {}

	for i = 1, #item_keys, 1 do
		local key = item_keys[i]
		whitelist[key] = true
	end

	self._item_whitelist = whitelist
	self._dirty = true

	return 
end
Items._refresh_entities_if_needed = function (self)
	if self._dirty then
		local items, loadout = BackendItem.get_items()

		clean_inventory(items, loadout, self._item_whitelist)

		self._items = items
		self._loadout = loadout
		self._profile_cache = {}
		self._dirty = false
	end

	return 
end
Items.get_all_backend_items = function (self)
	self._refresh_entities_if_needed(self)

	return self._items
end
local empty_params = {}
Items.get_filtered_items = function (self, filter, params)
	local all_items = self.get_all_backend_items(self)
	local backend_common = Managers.backend:get_interface("common")
	local items = backend_common.filter_items(backend_common, all_items, filter, params or empty_params)

	return items
end
Items.set_error = function (self, error_data)
	self._error_data = error_data

	return 
end
Items.check_for_errors = function (self)
	local error_data = self._error_data
	self._error_data = nil

	return error_data
end
local DO_RELOAD = true
Items.update = function (self, dt)
	if DO_RELOAD then
		self._modified_templates = {}
		DO_RELOAD = false
	end

	if self._dice_game_data then
		local backend_session = Managers.backend:get_interface("session")
		local session_ready = not self._debug_end_of_round_timeout and backend_session.get_state(backend_session) == "END_OF_ROUND"
		local sessions_disabled = not GameSettingsDevelopment.backend_settings.enable_sessions

		if session_ready or sessions_disabled then
			local parameters = self._dice_game_data.parameters
			local dice_script = GameSettingsDevelopment.backend_settings.dice_script

			print("Generating backend loot with:", unpack(parameters))

			self._dice_item = self._queue:add_item(dice_script, unpack(parameters))

			self._dice_item:disable_registered_commands()

			self._dice_game_data = nil
		elseif self._dice_game_data.time_out < Managers.time:time("main") then
			self._dice_game_data = nil

			self.set_error(self, {
				reason = BACKEND_LUA_ERRORS.ERR_DICE_TIMEOUT1
			})
		end
	elseif self._upgrades_failed_game_data then
		local backend_session = Managers.backend:get_interface("session")
		local session_ready = not self._debug_end_of_round_timeout and backend_session.get_state(backend_session) == "END_OF_ROUND"
		local sessions_disabled = not GameSettingsDevelopment.backend_settings.enable_sessions

		if session_ready or sessions_disabled then
			local start_level = self._upgrades_failed_game_data.start_level
			local end_level = self._upgrades_failed_game_data.end_level
			local upgrades_failed_script = GameSettingsDevelopment.backend_settings.upgrades_failed_script

			print("Generating upgrades for failed game:", upgrades_failed_script, "param_start_level", start_level, "param_end_level", end_level)

			self._upgrades_item = self._queue:add_item(upgrades_failed_script, "param_start_level", start_level, "param_end_level", end_level)

			self._upgrades_item:disable_registered_commands()

			self._upgrades_failed_game_data = nil
		elseif self._upgrades_failed_game_data.time_out < Managers.time:time("main") then
			self._upgrades_failed_game_data = nil

			self.set_error(self, {
				reason = BACKEND_LUA_ERRORS.ERR_UPGRADES_TIMEOUT
			})
		end
	end

	return 
end
Items.reset_dice_game_item = function (self)
	self._dice_item = nil

	return 
end
Items.dice_game_item = function (self)
	return self._dice_item
end
Items.poll_upgrades = function (self)
	local upgrades_item = self._upgrades_item

	if upgrades_item and upgrades_item.is_done(upgrades_item) then
		self._upgrades_item = nil

		return upgrades_item.items(upgrades_item)
	end

	return 
end
Items.get_loadout = function (self)
	self._refresh_entities_if_needed(self)

	return self._loadout
end
Items.generate_item_server_loot = function (self, dice, difficulty, start_level, end_level, hero_name, dlc_name)
	fassert(not self._dice_game_data and not self._upgrades_failed_game_data, "Trying to do two item server scripts at once. DiceGame: %s, UpgradesFailedGame: %s", self._dice_game_data and "true", self._upgrades_failed_game_data and "true")

	local time_out = Managers.time:time("main") + 20
	local parameters = {
		"param_dice",
		tostring(dice),
		"param_difficulty",
		difficulty,
		"param_start_level",
		start_level,
		"param_end_level",
		end_level
	}

	if hero_name then
		parameters[#parameters + 1] = "param_hero_name"
		parameters[#parameters + 1] = hero_name
	end

	if dlc_name then
		parameters[#parameters + 1] = "param_dlc_name"
		parameters[#parameters + 1] = dlc_name
	end

	self._dice_game_data = {
		time_out = time_out,
		parameters = parameters
	}

	return 
end
Items.upgrades_failed_game = function (self, start_level, end_level)
	fassert(not self._dice_game_data and not self._upgrades_failed_game_data, "Trying to do two item server scripts at once. DiceGame: %s, UpgradesFailedGame: %s", self._dice_game_data and "true", self._upgrades_failed_game_data and "true")

	local time_out = Managers.time:time("main") + 20
	self._upgrades_failed_game_data = {
		time_out = time_out,
		start_level = start_level,
		end_level = end_level
	}

	return 
end
Items.num_current_item_server_requests = function (self)
	return self._queue:num_current_requests()
end
Items.make_dirty = function (self)
	self._dirty = true

	return 
end
Items.set_data_server_queue = function (self, queue)
	self._queue = queue

	return 
end
Items.data_server_queue = function (self)
	return self._queue
end
BackendInterfaceItem = class(BackendInterfaceItem)
BackendInterfaceItem.init = function (self)
	self._backend_items = Items:new()
	self._modified_templates = {}

	return 
end
BackendInterfaceItem.type = function (self)
	return "backend"
end
BackendInterfaceItem.update = function (self)
	Profiler.start("BackendInterfaceItem update")
	self._backend_items:update()
	Profiler.stop("BackendInterfaceItem update")

	return 
end
BackendInterfaceItem.refresh_entities = function (self)
	Profiler.start("BackendInterfaceItem refresh_entites")
	self._backend_items:make_dirty()
	self._backend_items:_refresh_entities_if_needed()
	Profiler.stop("BackendInterfaceItem refresh_entites")

	return 
end
BackendInterfaceItem.check_for_errors = function (self)
	return self._backend_items:check_for_errors()
end
BackendInterfaceItem.num_current_item_server_requests = function (self)
	return self._backend_items:num_current_item_server_requests()
end
BackendInterfaceItem.set_properties_serialized = function (self, backend_id, properties)
	local error_code = BackendItem.set_traits(backend_id, properties)

	return 
end
BackendInterfaceItem.get_properties = function (self, backend_id)
	local serialized_properties = BackendItem.get_traits(backend_id)

	if not serialized_properties then
		return nil
	end

	serialized_properties = serialized_properties or ""
	local properties = {}

	for rune_slot, property_key, rune_value in string.gmatch(serialized_properties, "([%w_]+):([%w_]+),([%w_]+)") do
		local property_data = {
			rune_slot = rune_slot,
			property_key = property_key,
			rune_value = rune_value
		}
		properties[#properties + 1] = property_data
	end

	return properties
end
BackendInterfaceItem.get_traits = function (self, backend_id)
	local item = self.get_item_from_id(self, backend_id)

	if item then
		return item.traits
	end

	return nil
end
BackendInterfaceItem.set_runes = function (self, backend_id, runes)
	local rune_interface = Managers.backend:get_interface("runes")

	for _, rune in pairs(runes) do
		rune_interface.set(rune_interface, backend_id, rune)
	end

	return 
end
BackendInterfaceItem.get_runes = function (self, backend_id)
	local rune_interface = Managers.backend:get_interface("runes")
	local runes = rune_interface.get(rune_interface, backend_id)

	return runes
end
BackendInterfaceItem.get_key = function (self, backend_id)
	local items = self._backend_items:get_all_backend_items()
	local item = items[backend_id]

	if item then
		return item.key
	end

	return 
end
BackendInterfaceItem.get_item_from_id = function (self, backend_id)
	if backend_id == 0 then
		ScriptApplication.send_to_crashify("BackendInterfaceItem", "Tried to get item from backend_id 0")
	end

	local items = self._backend_items:get_all_backend_items()

	return items[backend_id]
end
BackendInterfaceItem.get_all_backend_items = function (self)
	return self._backend_items:get_all_backend_items()
end
BackendInterfaceItem.get_loadout = function (self)
	return self._backend_items:get_loadout()
end
BackendInterfaceItem.get_loadout_item_id = function (self, career_name, slot)
	local loadout = self._backend_items:get_loadout()
	local backend_id = loadout[career_name][slot]

	return backend_id
end
BackendInterfaceItem.get_filtered_items = function (self, filter)
	local items = self._backend_items:get_filtered_items(filter)

	return items
end
BackendInterfaceItem.set_loadout_item = function (self, item_id, profile, slot)
	local items = self._backend_items:get_all_backend_items()

	if item_id then
		fassert(items[item_id], "Trying to equip item that doesn't exist %d", item_id or "nil")
	end

	local loadout = self._backend_items:get_loadout()
	local profile_id = loadout[profile].backend_id

	print("SLOT " .. slot)
	BackendItem.set_loadout_item(item_id, profile_id, slot)
	self._backend_items:make_dirty()

	return 
end
BackendInterfaceItem.remove_item = function (self, backend_id, ignore_equipped)
	if not ignore_equipped then
		local loadout = self._backend_items:get_loadout()

		for hero, slots in pairs(loadout) do
			for slot, id in pairs(slots) do
				if MUST_HAVE_SLOTS[slot] then
					fassert(backend_id ~= id, "Trying to destroy equipped item: %s:%s:%d", hero, slot, backend_id)
				end
			end
		end
	end

	local result = BackendItem.destroy_entity(backend_id)

	self._backend_items:make_dirty()

	return result
end
BackendInterfaceItem.award_item = function (self, item_key)
	BackendItem.award_item(item_key)
	self._backend_items:make_dirty()

	return 
end
BackendInterfaceItem.data_server_script = function (self, script_name, ...)
	local queue = self._backend_items:data_server_queue()
	local request = queue.add_item(queue, script_name, ...)

	return request
end
BackendInterfaceItem.upgrades_failed_game = function (self, level_start, level_end)
	self._backend_items:upgrades_failed_game(level_start, level_end)

	return 
end
BackendInterfaceItem.generate_item_server_loot = function (self, dice, difficulty, start_level, end_level, hero_name, dlc_name)
	local dice_string = ""

	for type, amount in pairs(dice) do
		dice_string = dice_string .. type .. "," .. tostring(amount) .. ";"
	end

	self._backend_items:generate_item_server_loot(dice_string, difficulty, start_level, end_level, hero_name, dlc_name)

	return 
end
BackendInterfaceItem.check_for_loot = function (self)
	local dice_item = self._backend_items:dice_game_item()

	if dice_item and dice_item.is_done(dice_item) then
		local error_message = dice_item.error_message(dice_item)

		if error_message then
			self._backend_items:set_error(error_message)
		elseif dice_item.items(dice_item) then
			local parameters = dice_item.parameters(dice_item)
			local items = dice_item.items(dice_item)
			local successes = {}
			local total_successes = 1
			local successes_string = parameters.successes

			for type, num_successes in string.gmatch(successes_string, "([%w_]+),(%w+);") do
				successes[type] = tonumber(num_successes)
				total_successes = total_successes + num_successes
			end

			local win_list_string = parameters.win_list
			local win_list = {}

			for item in string.gmatch(win_list_string, "([%w_]+),") do
				win_list[#win_list + 1] = item
			end

			local item_key = win_list[total_successes]
			local dice_win_id = nil
			local level_rewards = {}

			for id, key in pairs(items) do
				if item_key == key then
					dice_win_id = id
				else
					level_rewards[id] = key
				end
			end

			fassert(dice_win_id, "Broken dice game winnings")

			local backend_session = Managers.backend:get_interface("session")

			backend_session.received_dice_game_loot(backend_session)
			self._backend_items:reset_dice_game_item()
			self._backend_items:make_dirty()

			return successes, win_list, dice_win_id, level_rewards
		end
	end

	return 
end
BackendInterfaceItem.equipped_by = function (self, backend_id)
	local equipped_heroes = {}
	local loadout = self._backend_items:get_loadout()

	for hero, slots in pairs(loadout) do
		for slot, id in pairs(slots) do
			if backend_id == id then
				table.insert(equipped_heroes, hero)
			end
		end
	end

	return equipped_heroes
end
BackendInterfaceItem.is_equipped = function (self, backend_id, profile_name)
	local loadout = self._backend_items:get_loadout()

	for hero, slots in pairs(loadout) do
		if not profile_name or hero == profile_name then
			for slot, id in pairs(slots) do
				if (MUST_HAVE_SLOTS[slot] or CLEARABLE_SLOTS[slot]) and backend_id == id then
					return true
				end
			end
		end
	end

	return false
end
local SalvageableSlotTypes = {
	ranged = true,
	melee = true,
	hat = true,
	trinket = true
}
local SalvageableRarities = {
	common = true,
	plentiful = true,
	exotic = true,
	rare = true,
	unique = true
}
BackendInterfaceItem.is_salvageable = function (self, backend_id)
	local unequipped = not self.is_equipped(self, backend_id)
	local items = self._backend_items:get_all_backend_items()
	local item = items[backend_id]
	local item_config = ItemMasterList[item.key]
	local salvageable_slot_type = SalvageableSlotTypes[item_config.slot_type]
	local salvageable_rarity = SalvageableRarities[item_config.rarity]

	return unequipped and salvageable_slot_type and salvageable_rarity
end
local FuseableSlotTypes = {
	melee = true,
	ranged = true
}
local FuseableRarities = {
	common = true,
	plentiful = true,
	rare = true
}
BackendInterfaceItem.is_fuseable = function (self, backend_id)
	local unequipped = not self.is_equipped(self, backend_id)
	local items = self._backend_items:get_all_backend_items()
	local item = items[backend_id]
	local item_config = ItemMasterList[item.key]
	local fuseable_slot_type = FuseableSlotTypes[item_config.slot_type]
	local fuseable_rarity = FuseableRarities[item_config.rarity]

	return unequipped and fuseable_slot_type and fuseable_rarity
end
BackendInterfaceItem.set_data_server_queue = function (self, queue)
	self._backend_items:set_data_server_queue(queue)

	local item_whitelist_script = GameSettingsDevelopment.backend_settings.item_whitelist

	if item_whitelist_script then
		queue.register_executor(queue, "item_whitelist", callback(self, "_command_item_whitelist"))
		queue.add_item(queue, item_whitelist_script)
	end

	return 
end
BackendInterfaceItem.__dirtify = function (self)
	self._backend_items:make_dirty()

	return 
end
BackendInterfaceItem.has_item = function (self, item_key)
	local items, loadout = BackendItem.get_items()

	for backend_id, item in pairs(items) do
		if item.key == item_key then
			return true
		end
	end

	return false
end
BackendInterfaceItem.clean_inventory_for_prestige = function (self, profile_index, unit)
	local items, loadout = BackendItem.get_items()
	local missing_items = nil
	local items_to_remove = {}

	for backend_id, item in pairs(items) do
		local item_data = ItemMasterList[item.key]
		local can_wield = false

		for _, profile in pairs(item_data.can_wield) do
			local profile_can_wield = FindProfileIndex(profile) == profile_index

			if profile_can_wield then
				can_wield = true
			end
		end

		if can_wield and not COSMETIC_ITEMS[item_data.item_type] and not STARTING_ITEMS[item_data.name] then
			items[backend_id] = nil
			items_to_remove[#items_to_remove + 1] = backend_id
		end
	end

	local empty_must_have_slots = {}

	for profile_name, slots in pairs(loadout) do
		for slot, backend_id in pairs(slots) do
			if slot == "backend_id" then
			elseif not items[backend_id] then
				BackendItem.set_loadout_item(nil, loadout[profile_name].backend_id, slot)

				slots[slot] = nil

				if MUST_HAVE_SLOTS[slot] then
					empty_must_have_slots[#empty_must_have_slots + 1] = {
						slot = slot,
						profile_name = profile_name
					}
				end
			elseif missing_items and missing_items[backend_id] then
				BackendItem.set_loadout_item(nil, loadout[profile_name].backend_id, slot)

				slots[slot] = nil

				if MUST_HAVE_SLOTS[slot] then
					empty_must_have_slots[#empty_must_have_slots + 1] = {
						slot = slot,
						profile_name = profile_name
					}
				end
			end
		end
	end

	local inventory_extension = ScriptUnit.extension(unit, "inventory_system")

	for index, slot_data in ipairs(empty_must_have_slots) do
		local profile_name = slot_data.profile_name
		local slot = slot_data.slot
		local backend_id = find_item_for_slot(items, profile_name, slot)

		if backend_id then
			local slot_type = InventorySettings.slots_by_name[slot].type

			if slot_type == "melee" or slot_type == "ranged" then
				local slot = (slot_type == "melee" and "slot_melee") or "slot_ranged"

				inventory_extension.create_equipment_in_slot(inventory_extension, slot, backend_id)
				inventory_extension.wield(inventory_extension, slot)
			elseif slot_type == "hat" then
				local attachment_extension = ScriptUnit.extension(unit, "attachment_system")

				attachment_extension.create_attachment_in_slot(attachment_extension, slot, backend_id)
			elseif slot_type == "trinket" then
				local attachment_extension = ScriptUnit.extension(unit, "attachment_system")

				attachment_extension.create_attachment_in_slot(attachment_extension, slot, backend_id)
			end

			ScriptApplication.send_to_crashify("BackendInterfaceItem", "Slot %q was empty, putting item %d in it", slot, backend_id)
			BackendItem.set_loadout_item(backend_id, loadout[profile_name].backend_id, slot)

			empty_must_have_slots[index] = nil
			loadout[profile_name][slot] = backend_id
		end
	end

	fassert(table.is_empty(empty_must_have_slots), "[BackendInterfaceItem] Your backend save is broken, ask for help resetting it")

	self._items = items
	self._loadout = loadout
	self._profile_cache = {}

	self._backend_items:make_dirty()

	self._dirty = true

	for _, backend_id in ipairs(items_to_remove) do
		self.remove_item(self, backend_id)
	end

	return 
end
BackendInterfaceItem.get_runes = function (self, item_id)
	local item = self.get_item_from_id(self, item_id)

	if item then
		local runes = item.runes

		return runes
	end

	return nil
end
BackendInterfaceItem._slot_item_rune = function (self, item_data, rune_to_insert)
	return 
end
BackendInterfaceItem.get_item_template = function (self, item_data, backend_id)
	local template_name = item_data.temporary_template or item_data.template
	local item_template = Weapons[template_name]
	local modified_item_template = nil

	if item_template then
		if backend_id then
			if not self._modified_templates[backend_id] then
				modified_item_template = GearUtils.apply_properties_to_item_template(item_template, backend_id)
				self._modified_templates[backend_id] = modified_item_template
			else
				return self._modified_templates[backend_id]
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
BackendInterfaceItem._command_item_whitelist = function (self, data)
	local backend_items = self._backend_items

	if data.enabled then
		backend_items.set_item_whitelist(backend_items, data.items)
	end

	local queue = backend_items.data_server_queue(backend_items)

	queue.unregister_executor(queue, "item_whitelist")

	return 
end

return 

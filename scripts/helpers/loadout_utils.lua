LoadoutUtils = LoadoutUtils or {}
local LOADOUT_SLOTS = LOADOUT_SLOTS or {
	slot_necklace = true,
	slot_trinket_1 = true,
	slot_ring = true,
	slot_melee = true,
	slot_ranged = true
}

LoadoutUtils.sync_loadout_slot = function (player, slot_name, item, sync_to_specific_peer_id)
	if not LOADOUT_SLOTS[slot_name] then
		return
	end

	local network_manager = Managers.state.network
	local is_server = network_manager.is_server
	local network_transmit = network_manager.network_transmit
	local item_key = item.key
	local power_level = item.power_level
	local rarity = item.rarity or "plentiful"
	local slot_id = NetworkLookup.equipment_slots[slot_name]
	local item_id = NetworkLookup.item_names[item_key]
	local rarity_id = NetworkLookup.rarities[rarity]
	local properties_array, properties_values_array, traits_array = LoadoutUtils.properties_to_rpc_params(item)

	if #properties_array ~= #properties_values_array then
		fassert(false, "[LoadoutUtils.sync_loadout_slot] Length of arrays properties_array(%d) and properties_values_array(%d) not equal!", #properties_array, #properties_values_array)
	end

	local peer_id = player:network_id()
	local local_player_id = player:local_player_id()

	if sync_to_specific_peer_id then
		network_transmit:send_rpc("rpc_sync_loadout_slot", sync_to_specific_peer_id, peer_id, local_player_id, slot_id, item_id, rarity_id, power_level, properties_array, properties_values_array, traits_array)
	elseif is_server then
		network_transmit:send_rpc_all("rpc_sync_loadout_slot", peer_id, local_player_id, slot_id, item_id, rarity_id, power_level, properties_array, properties_values_array, traits_array)
	else
		network_transmit:send_rpc_server("rpc_sync_loadout_slot", peer_id, local_player_id, slot_id, item_id, rarity_id, power_level, properties_array, properties_values_array, traits_array)
	end
end

local EMPTY_TABLE = {}

LoadoutUtils.hot_join_sync = function (peer_id)
	if not Managers.state.network.is_server then
		return
	end

	local player_loadouts = Managers.player:player_loadouts()
	local players = Managers.player:players()

	for unique_id, player in pairs(players) do
		local player_peer_id = player:network_id()

		if player_peer_id ~= peer_id then
			local loadout = player_loadouts[unique_id] or EMPTY_TABLE

			for slot_name, item in pairs(loadout) do
				LoadoutUtils.sync_loadout_slot(player, slot_name, item, peer_id)
			end
		else
			print("############### DONT SYNC YOURSELF")
		end
	end
end

LoadoutUtils.create_loadout_item_from_rpc_data = function (slot_id, item_id, rarity_id, power_level, properties_array, properties_values_array, traits_array)
	local slot_name = NetworkLookup.equipment_slots[slot_id]
	local item_key = NetworkLookup.item_names[item_id]
	local rarity = NetworkLookup.rarities[rarity_id]
	local power_level = power_level
	local num_properties, properties, traits = LoadoutUtils.properties_from_rpc_params(properties_array, properties_values_array, traits_array)
	local item_template = ItemMasterList[item_key]
	local item = {
		data = item_template,
		power_level = power_level,
		rarity = rarity,
		key = item_key,
		ItemId = item_key,
		properties = (num_properties > 0 and properties) or nil,
		traits = (#traits > 0 and traits) or nil
	}

	return slot_name, item
end

LoadoutUtils.properties_to_rpc_params = function (item)
	local properties_lookup = NetworkLookup.properties
	local traits_lookup = NetworkLookup.traits
	local properties_ids = {}
	local properties_values = {}
	local traits_ids = {}
	local item_properties = item.properties

	if item_properties then
		for property_name, property_value in pairs(item_properties) do
			properties_ids[#properties_ids + 1] = properties_lookup[property_name]
			properties_values[#properties_values + 1] = property_value
		end
	end

	local item_traits = item.traits

	if item_traits then
		for i = 1, #item_traits, 1 do
			local trait_name = item_traits[i]
			traits_ids[#traits_ids + 1] = traits_lookup[trait_name]
		end
	end

	return properties_ids, properties_values, traits_ids
end

LoadoutUtils.properties_from_rpc_params = function (properties_array, properties_values_array, traits_array)
	local properties_lookup = NetworkLookup.properties
	local traits_lookup = NetworkLookup.traits
	local num_properties = 0
	local properties = {}
	local traits = {}

	for i = 1, #properties_array, 1 do
		local property_id = properties_array[i]
		local property_name = properties_lookup[property_id]
		local property_value = properties_values_array[i]
		properties[property_name] = property_value
		num_properties = num_properties + 1
	end

	for i = 1, #traits_array, 1 do
		local trait_id = traits_array[i]
		traits[#traits + 1] = traits_lookup[trait_id]
	end

	return num_properties, properties, traits
end

return

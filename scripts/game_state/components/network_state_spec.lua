-- chunkname: @scripts/game_state/components/network_state_spec.lua

local LibDeflate = require("scripts/utils/lib_deflate")
local ByteArray = require("scripts/utils/byte_array")

local function inventory_map_to_network_array(inventory_map)
	local destination = {}
	local inventory_packages_lut = NetworkLookup.inventory_packages

	for inventory_package_name, _ in pairs(inventory_map) do
		local value = inventory_packages_lut[inventory_package_name]

		assert(value, "No existing inventory package for attempted name %q", inventory_package_name)

		destination[#destination + 1] = value
	end

	return destination
end

local function encode_full_profile_peers(peer_array)
	local network_table = {}

	for _, other_peer in ipairs(peer_array) do
		network_table[#network_table + 1] = {
			other_peer.peer_id,
			other_peer.local_player_id,
			other_peer.profile_index,
			other_peer.career_index,
			other_peer.is_bot,
		}
	end

	return cjson.encode(network_table)
end

local function decode_full_profile_peers(peer_string)
	local json_array = cjson.decode(peer_string)
	local peer_array = {}

	for _, peer_info_array in ipairs(json_array) do
		local peer_table = {}

		peer_table.peer_id = peer_info_array[1]
		peer_table.local_player_id = peer_info_array[2]
		peer_table.profile_index = peer_info_array[3]
		peer_table.career_index = peer_info_array[4]
		peer_table.is_bot = peer_info_array[5]
		peer_array[#peer_array + 1] = peer_table
	end

	return peer_array
end

local function encode_inventory(inventory)
	local network_inventory_list_3p = inventory_map_to_network_array(inventory.third_person)
	local network_inventory_list_1p = inventory_map_to_network_array(inventory.first_person)
	local byte_array = {}

	ByteArray.write_int32(byte_array, inventory.inventory_id)
	ByteArray.write_hash(byte_array, inventory.inventory_hash)
	ByteArray.write_int32(byte_array, #network_inventory_list_1p)

	for i = 1, #network_inventory_list_1p do
		ByteArray.write_int32(byte_array, network_inventory_list_1p[i])
	end

	ByteArray.write_int32(byte_array, #network_inventory_list_3p)

	for i = 1, #network_inventory_list_3p do
		ByteArray.write_int32(byte_array, network_inventory_list_3p[i])
	end

	local byte_array_string = ByteArray.read_string(byte_array)
	local compressed_byte_array_string = LibDeflate:CompressDeflate(byte_array_string)

	return compressed_byte_array_string
end

local function decode_inventory(compressed_byte_array_string)
	local byte_array_string = LibDeflate:DecompressDeflate(compressed_byte_array_string)
	local byte_array = {}

	ByteArray.write_string(byte_array, byte_array_string)

	local index = 1
	local inventory_id, inventory_hash

	inventory_id, index = ByteArray.read_int32(byte_array, index)
	inventory_hash, index = ByteArray.read_hash(byte_array, index)

	local inventory_pack_1p_count

	inventory_pack_1p_count, index = ByteArray.read_int32(byte_array, index)

	local first_person_packages = {}

	for i = 1, inventory_pack_1p_count do
		local network_package

		network_package, index = ByteArray.read_int32(byte_array, index)
		first_person_packages[NetworkLookup.inventory_packages[network_package]] = false
	end

	local inventory_pack_3p_count

	inventory_pack_3p_count, index = ByteArray.read_int32(byte_array, index)

	local third_person_packages = {}

	for i = 1, inventory_pack_3p_count do
		local network_package

		network_package, index = ByteArray.read_int32(byte_array, index)
		third_person_packages[NetworkLookup.inventory_packages[network_package]] = false
	end

	return {
		inventory_id = inventory_id,
		inventory_hash = inventory_hash,
		first_person = first_person_packages,
		third_person = third_person_packages,
	}
end

local function encode_character_data(character_data)
	return string.format("%d:%d", character_data.profile_index, character_data.career_index)
end

local function decode_character_data(character_string)
	local split = string.split(character_string, ":")

	return {
		profile_index = tonumber(split[1]),
		career_index = tonumber(split[2]),
	}
end

local function encode_persistent_character_data(character_data)
	return string.format("%d:%d:%d", character_data.profile_index, character_data.career_index, character_data.party_id)
end

local function decode_persistent_character_data(character_string)
	local split = string.split(character_string, ":")

	return {
		profile_index = tonumber(split[1]),
		career_index = tonumber(split[2]),
		party_id = tonumber(split[3]),
	}
end

local function encode_comma_separated_string_array(array)
	return table.concat(array, ",")
end

local function decode_comma_separated_string_array(string)
	local array = string.split_deprecated(string, ",")

	return array
end

local function encode_locked_director_functions(array)
	local ids_array = {}

	for index, func in ipairs(array) do
		ids_array[index] = NetworkLookup.conflict_director_lock_lookup[func]
	end

	return table.concat(ids_array, ",")
end

local function decode_locked_director_functions(string)
	local array = string.split_deprecated(string, ",")
	local func_array = {}

	for index, id in ipairs(array) do
		func_array[index] = NetworkLookup.conflict_director_lock_lookup[tonumber(id)]
	end

	return func_array
end

local function encode_extra_packages(array)
	local ids_array = {}

	for index, package in ipairs(array) do
		ids_array[index] = NetworkLookup.network_packages[package]
	end

	return table.concat(ids_array, ",")
end

local function decode_extra_packages(string)
	local id_array = string.split_deprecated(string, ",")
	local array = {}

	for index, id in ipairs(id_array) do
		array[index] = NetworkLookup.network_packages[tonumber(id)]
	end

	return array
end

local function encode_game_mode_event_data(data)
	local lookup_data = table.clone(data, true)
	local mutators = lookup_data.mutators

	mutators = mutators and table.convert_lookup(mutators, NetworkLookup.mutator_templates)

	local boons = lookup_data.boons

	boons = boons and table.convert_lookup(boons, NetworkLookup.deus_power_up_templates)

	return cjson.encode(lookup_data)
end

local function decode_game_mode_event_data(string)
	local data = cjson.decode(string)
	local mutators = data.mutators

	mutators = mutators and table.convert_lookup(mutators, NetworkLookup.mutator_templates)

	local boons = data.boons

	boons = boons and table.convert_lookup(boons, NetworkLookup.deus_power_up_templates)

	return data
end

local function encode_lookup(lookup_key)
	return function (val)
		return NetworkLookup[lookup_key][val]
	end
end

local function decode_lookup(lookup_key)
	return function (val)
		return NetworkLookup[lookup_key][val]
	end
end

local function encode_level_transition_type(level_transition_type_string)
	return level_transition_type_string == "load_next_level" and 0 or 1
end

local function decode_level_transition_type(level_transition_type_number)
	if level_transition_type_number == 0 then
		return "load_next_level"
	else
		return "reload_level"
	end
end

local function encode_mutator_map(mutator_map)
	local id_array = table.map_to_array(mutator_map, function (mutator_name)
		return NetworkLookup.mutator_templates[mutator_name]
	end)
	local id_string = encode_comma_separated_string_array(id_array)

	return id_string
end

local function decode_mutator_map(id_string)
	local id_array = decode_comma_separated_string_array(id_string)
	local mutator_map = table.array_to_map(id_array, function (_, mutator_id)
		return NetworkLookup.mutator_templates[tonumber(mutator_id)], true
	end)

	return mutator_map
end

local function encode_breed_map(breed_map)
	local num_masks = math.ceil(#NetworkLookup.breeds / 8)
	local byte_array = {}

	for i = 1, num_masks do
		byte_array[i] = 0
	end

	for breed_name in pairs(breed_map) do
		local breed_index = NetworkLookup.breeds[breed_name]
		local bit_index = (breed_index - 1) % 8
		local bitmask_index = math.ceil(breed_index / 8)
		local bitmask = byte_array[bitmask_index]

		byte_array[bitmask_index] = bit.bor(bitmask, 2^bit_index)
	end

	local byte_array_string = ByteArray.read_string(byte_array)
	local compressed_byte_array_string = LibDeflate:CompressDeflate(byte_array_string)

	return compressed_byte_array_string
end

local function decode_breed_map(compressed_byte_array_string)
	local byte_array_string = LibDeflate:DecompressDeflate(compressed_byte_array_string)
	local byte_array = {}

	ByteArray.write_string(byte_array, byte_array_string)

	local breed_map = {}

	for i = 1, #byte_array do
		local bitmask = tonumber(byte_array[i])

		if bitmask ~= 0 then
			for j = 0, 7 do
				local is_set = bit.band(bitmask, 2^j) ~= 0

				if is_set then
					local breed_index = j + 1 + 8 * (i - 1)
					local breed_name = NetworkLookup.breeds[breed_index]

					breed_map[breed_name] = true
				end
			end
		end
	end

	return breed_map
end

local spec = {
	server = {
		peer_ingame = {
			clear_when_peer_id_leaves = true,
			default_value = false,
			type = "boolean",
			composite_keys = {
				peer_id = true,
			},
		},
		peer_hot_join_synced = {
			clear_when_peer_id_leaves = true,
			default_value = false,
			type = "boolean",
			composite_keys = {
				peer_id = true,
			},
		},
		profile_index_reservation = {
			default_value = "",
			type = "string",
			composite_keys = {
				party_id = true,
				profile_index = true,
			},
		},
		persistent_hero_reservation = {
			type = "table",
			default_value = {
				career_index = 0,
				party_id = 0,
				profile_index = 0,
			},
			composite_keys = {
				peer_id = true,
			},
			encode = encode_persistent_character_data,
			decode = decode_persistent_character_data,
		},
		bot_profile = {
			type = "table",
			default_value = {
				career_index = 0,
				profile_index = 0,
			},
			composite_keys = {
				local_player_id = true,
				party_id = true,
			},
			encode = encode_character_data,
			decode = decode_character_data,
		},
		full_profile_peers = {
			type = "table",
			default_value = {},
			composite_keys = {},
			encode = encode_full_profile_peers,
			decode = decode_full_profile_peers,
		},
		peers = {
			type = "table",
			default_value = {},
			composite_keys = {},
			encode = encode_comma_separated_string_array,
			decode = decode_comma_separated_string_array,
		},
		level_key = {
			default_value = "inn_level",
			type = "string",
			composite_keys = {},
		},
		level_seed = {
			default_value = 0,
			type = "number",
			composite_keys = {},
		},
		conflict_director = {
			default_value = "inn_level",
			type = "string",
			composite_keys = {},
		},
		game_mode = {
			default_value = "inn",
			type = "string",
			composite_keys = {},
		},
		environment_variation_id = {
			default_value = 0,
			type = "number",
			composite_keys = {},
		},
		locked_director_functions = {
			type = "table",
			default_value = {},
			composite_keys = {},
			encode = encode_locked_director_functions,
			decode = decode_locked_director_functions,
		},
		difficulty = {
			default_value = "normal",
			type = "string",
			composite_keys = {},
			encode = encode_lookup("difficulties"),
			decode = decode_lookup("difficulties"),
		},
		difficulty_tweak = {
			default_value = 0,
			type = "number",
			composite_keys = {},
		},
		extra_packages = {
			type = "table",
			default_value = {},
			composite_keys = {},
			encode = encode_extra_packages,
			decode = decode_extra_packages,
		},
		mechanism = {
			default_value = "adventure",
			type = "string",
			composite_keys = {},
			encode = encode_lookup("mechanism_keys"),
			decode = decode_lookup("mechanism_keys"),
		},
		level_session_id = {
			default_value = 0,
			type = "number",
			composite_keys = {},
		},
		level_transition_type = {
			default_value = "load_next_level",
			type = "string",
			composite_keys = {},
			encode = encode_level_transition_type,
			decode = decode_level_transition_type,
		},
		side_order_state = {
			default_value = 1,
			type = "number",
			composite_keys = {},
		},
		game_mode_event_data = {
			type = "table",
			default_value = {},
			composite_keys = {},
			encode = encode_game_mode_event_data,
			decode = decode_game_mode_event_data,
		},
		initialized_mutator_map = {
			type = "table",
			default_value = {},
			composite_keys = {},
			encode = encode_mutator_map,
			decode = decode_mutator_map,
		},
		session_breed_map = {
			mute_print = true,
			type = "table",
			default_value = {},
			composite_keys = {},
			encode = encode_breed_map,
			decode = decode_breed_map,
		},
		startup_breed_map = {
			type = "table",
			default_value = {},
			composite_keys = {},
			encode = encode_breed_map,
			decode = decode_breed_map,
		},
	},
	peer = {
		inventory_list = {
			type = "table",
			composite_keys = {
				local_player_id = true,
			},
			default_value = {
				inventory_hash = "0000000000000000",
				inventory_id = 0,
				first_person = {},
				third_person = {},
			},
			encode = encode_inventory,
			decode = decode_inventory,
		},
		loaded_inventory_id = {
			clear_when_peer_id_leaves = true,
			default_value = 0,
			type = "number",
			composite_keys = {
				local_player_id = true,
				peer_id = true,
			},
		},
		actually_ingame = {
			clear_when_peer_id_leaves = true,
			default_value = false,
			type = "boolean",
			composite_keys = {
				peer_id = true,
			},
		},
		loaded_session_breed_map = {
			mute_print = true,
			type = "table",
			default_value = {},
			composite_keys = {},
			encode = encode_breed_map,
			decode = decode_breed_map,
		},
	},
}

SharedState.validate_spec(spec)

return spec

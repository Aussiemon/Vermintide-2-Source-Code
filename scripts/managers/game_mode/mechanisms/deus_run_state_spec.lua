local LibDeflate = require("scripts/utils/lib_deflate")
local ByteArray = require("scripts/utils/byte_array")
local FLOAT_CONVERSION_EPSILON = 100000

local function encode_comma_separated_string_array(array)
	return table.concat(array, ",")
end

local function decode_comma_separated_string_array(string)
	local array = string:split(",")

	return array
end

local function encode_blessings(blessings_table)
	local blessings_array = {}

	for blessing_name, buyer in pairs(blessings_table) do
		blessings_array[#blessings_array + 1] = blessing_name
		blessings_array[#blessings_array + 1] = buyer
	end

	return table.concat(blessings_array, ",")
end

local function decode_blessings(blessings_string)
	local blessings_with_buyer_unassigned = string.split(blessings_string, ",")
	local blessings_with_buyer = {}

	for i = 1, #blessings_with_buyer_unassigned, 2 do
		local blessing_name = blessings_with_buyer_unassigned[i]
		local buyer_peer_id = blessings_with_buyer_unassigned[i + 1]
		blessings_with_buyer[blessing_name] = buyer_peer_id
	end

	return blessings_with_buyer
end

local function encode_json(table)
	return cjson.encode(table)
end

local function decode_json(json)
	local table = cjson.decode(json)

	return table
end

local power_ups_working_byte_array = {}

local function encode_power_ups(power_ups_table)
	table.clear(power_ups_working_byte_array)

	for power_up_table_index = 1, #power_ups_table, 1 do
		local power_up = power_ups_table[power_up_table_index]

		ByteArray.write_int32(power_ups_working_byte_array, NetworkLookup.deus_power_up_templates[power_up.name])
		ByteArray.write_int32(power_ups_working_byte_array, NetworkLookup.rarities[power_up.rarity])
		ByteArray.write_int32(power_ups_working_byte_array, power_up.client_id)
	end

	local power_ups_string = ByteArray.read_string(power_ups_working_byte_array)
	local compressed_power_ups_string = LibDeflate:CompressDeflate(power_ups_string)

	return compressed_power_ups_string
end

local function decode_power_ups(compressed_power_ups_string)
	local power_ups_string = LibDeflate:DecompressDeflate(compressed_power_ups_string)

	table.clear(power_ups_working_byte_array)
	ByteArray.write_string(power_ups_working_byte_array, power_ups_string)

	local power_ups = {}
	local index = 1

	while index < #power_ups_working_byte_array do
		local power_up_name_lookup = ByteArray.read_int32(power_ups_working_byte_array, index)
		index = index + 4
		local power_up_name = NetworkLookup.deus_power_up_templates[power_up_name_lookup]
		local rarity_lookup = ByteArray.read_int32(power_ups_working_byte_array, index)
		index = index + 4
		local rarity = NetworkLookup.rarities[rarity_lookup]
		local client_id = ByteArray.read_int32(power_ups_working_byte_array, index)
		index = index + 4
		power_ups[#power_ups + 1] = {
			name = power_up_name,
			rarity = rarity,
			client_id = client_id
		}
	end

	return power_ups
end

local function encode_percentage(val)
	return math.round(val * FLOAT_CONVERSION_EPSILON)
end

local function decode_percentage(encoded_val)
	return encoded_val / FLOAT_CONVERSION_EPSILON
end

local function encode_additional_items(additional_items)
	local encoded_table = SpawningHelper.netpack_additional_items(additional_items)

	return table.concat(encoded_table, ",")
end

local function decode_additional_items(encoded_additional_items_string)
	local encoded_additional_items_list = string.split(encoded_additional_items_string, ",")
	local decoded_table = SpawningHelper.unnetpack_additional_items(encoded_additional_items_list)
	decoded_table = table.clone(decoded_table)

	return decoded_table
end

local function encode_bought_power_ups(bought_power_ups)
	local string_array = {}

	for power_up_table_index = 1, #bought_power_ups, 1 do
		local power_up = bought_power_ups[power_up_table_index]

		table.insert(string_array, NetworkLookup.deus_power_up_templates[power_up])
	end

	return table.concat(string_array, ",")
end

local function decode_bought_power_ups(bought_power_ups_string)
	local power_ups = {}
	local power_up_data_strings = string.split(bought_power_ups_string, ",")

	for power_up_data_strings_index = 1, #power_up_data_strings, 1 do
		local power_up_data_string = power_up_data_strings[power_up_data_strings_index]
		local power_up_name = NetworkLookup.deus_power_up_templates[tonumber(power_up_data_string)]
		power_ups[#power_ups + 1] = power_up_name
	end

	return power_ups
end

local function encode_bought_blessings(bought_blessings)
	local string_array = {}

	for blessing_table_index = 1, #bought_blessings, 1 do
		local blessing = bought_blessings[blessing_table_index]

		table.insert(string_array, NetworkLookup.deus_blessings[blessing])
	end

	return table.concat(string_array, ",")
end

local function decode_bought_blessings(bought_blessings_string)
	local blessings = {}
	local blessing_data_strings = string.split(bought_blessings_string, ",")

	for blessing_data_strings_index = 1, #blessing_data_strings, 1 do
		local blessing_data_string = blessing_data_strings[blessing_data_strings_index]
		local blessing_name = NetworkLookup.deus_blessings[tonumber(blessing_data_string)]
		blessings[#blessings + 1] = blessing_name
	end

	return blessings
end

local function encode_chests_used(chests_used_table)
	local string_array = {}

	for rarity, count in pairs(chests_used_table) do
		string_array[#string_array + 1] = NetworkLookup.rarities[rarity]
		string_array[#string_array + 1] = tostring(count)
	end

	return table.concat(string_array, ",")
end

local function decode_chests_used(chests_used_string)
	local chests_used_string_split = string.split(chests_used_string, ",")
	local chests_used_table = {}

	for i = 1, #chests_used_string_split, 2 do
		local rarity_lookup = chests_used_string_split[i]
		local count_string = chests_used_string_split[i + 1]
		chests_used_table[NetworkLookup.rarities[tonumber(rarity_lookup)]] = tonumber(count_string)
	end

	return chests_used_table
end

local function compress_string(string)
	return LibDeflate:CompressDeflate(string)
end

local function decompress_string(compressed_string)
	return LibDeflate:DecompressDeflate(compressed_string)
end

local spec = {
	server = {
		run_node_key = {
			default_value = "start",
			type = "string",
			composite_keys = {}
		},
		run_ended = {
			default_value = false,
			type = "boolean",
			composite_keys = {}
		},
		completed_level_count = {
			default_value = 0,
			type = "number",
			composite_keys = {}
		},
		traversed_nodes = {
			type = "table",
			default_value = {},
			composite_keys = {},
			encode = encode_comma_separated_string_array,
			decode = decode_comma_separated_string_array
		},
		blessings_with_buyer = {
			type = "table",
			default_value = {},
			composite_keys = {},
			encode = encode_blessings,
			decode = decode_blessings
		},
		blessing_lifetimes = {
			type = "table",
			default_value = {},
			composite_keys = {},
			encode = encode_json,
			decode = decode_json
		},
		peer_initialized = {
			default_value = false,
			type = "boolean",
			composite_keys = {
				peer_id = true
			}
		},
		profile_initialized = {
			default_value = false,
			type = "boolean",
			composite_keys = {
				peer_id = true,
				career_index = true,
				profile_index = true,
				local_player_id = true
			}
		},
		cursed_levels_completed = {
			default_value = 0,
			type = "number",
			composite_keys = {
				peer_id = true
			}
		},
		cursed_chests_purified = {
			default_value = 0,
			type = "number",
			composite_keys = {
				peer_id = true
			}
		},
		coin_chests_collected = {
			default_value = 0,
			type = "number",
			composite_keys = {
				peer_id = true
			}
		},
		spawned_once = {
			default_value = false,
			type = "boolean",
			composite_keys = {
				peer_id = true,
				career_index = true,
				profile_index = true,
				local_player_id = true
			}
		},
		power_ups = {
			type = "table",
			default_value = {},
			composite_keys = {
				peer_id = true,
				career_index = true,
				profile_index = true,
				local_player_id = true
			},
			encode = encode_power_ups,
			decode = decode_power_ups
		},
		party_power_ups = {
			type = "table",
			default_value = {},
			composite_keys = {},
			encode = encode_power_ups,
			decode = decode_power_ups
		},
		persistent_buffs = {
			type = "table",
			default_value = {},
			composite_keys = {
				peer_id = true,
				career_index = true,
				profile_index = true,
				local_player_id = true
			},
			encode = encode_comma_separated_string_array,
			decode = decode_comma_separated_string_array
		},
		soft_currency = {
			default_value = 0,
			type = "number",
			composite_keys = {
				peer_id = true,
				local_player_id = true
			}
		},
		health_percentage = {
			type = "number",
			default_value = 1,
			composite_keys = {
				peer_id = true,
				career_index = true,
				profile_index = true,
				local_player_id = true
			},
			encode = encode_percentage,
			decode = decode_percentage
		},
		health_state = {
			default_value = "alive",
			type = "string",
			composite_keys = {
				peer_id = true,
				career_index = true,
				profile_index = true,
				local_player_id = true
			}
		},
		melee_ammo = {
			type = "number",
			default_value = 1,
			composite_keys = {
				peer_id = true,
				career_index = true,
				profile_index = true,
				local_player_id = true
			},
			encode = encode_percentage,
			decode = decode_percentage
		},
		ranged_ammo = {
			type = "number",
			default_value = 1,
			composite_keys = {
				peer_id = true,
				career_index = true,
				profile_index = true,
				local_player_id = true
			},
			encode = encode_percentage,
			decode = decode_percentage
		},
		healthkit = {
			default_value = "",
			type = "string",
			composite_keys = {
				peer_id = true,
				career_index = true,
				profile_index = true,
				local_player_id = true
			}
		},
		potion = {
			default_value = "",
			type = "string",
			composite_keys = {
				peer_id = true,
				career_index = true,
				profile_index = true,
				local_player_id = true
			}
		},
		grenade = {
			default_value = "",
			type = "string",
			composite_keys = {
				peer_id = true,
				career_index = true,
				profile_index = true,
				local_player_id = true
			}
		},
		additional_items = {
			type = "table",
			default_value = {},
			composite_keys = {
				peer_id = true,
				career_index = true,
				profile_index = true,
				local_player_id = true
			},
			encode = encode_additional_items,
			decode = decode_additional_items
		},
		slot_melee = {
			type = "string",
			default_value = "",
			composite_keys = {
				peer_id = true,
				career_index = true,
				profile_index = true,
				local_player_id = true
			},
			encode = compress_string,
			decode = decompress_string
		},
		slot_ranged = {
			type = "string",
			default_value = "",
			composite_keys = {
				peer_id = true,
				career_index = true,
				profile_index = true,
				local_player_id = true
			},
			encode = compress_string,
			decode = decompress_string
		},
		twitch_vote = {
			default_value = "",
			type = "string",
			composite_keys = {}
		},
		persisted_score = {
			type = "table",
			default_value = {},
			composite_keys = {
				peer_id = true,
				local_player_id = true
			},
			encode = encode_json,
			decode = decode_json
		},
		bought_power_ups = {
			type = "table",
			default_value = {},
			composite_keys = {},
			encode = encode_bought_power_ups,
			decode = decode_bought_power_ups
		},
		bought_blessings = {
			type = "table",
			default_value = {},
			composite_keys = {},
			encode = encode_bought_blessings,
			decode = decode_bought_blessings
		},
		ground_coins_picked_up = {
			default_value = 0,
			type = "number",
			composite_keys = {}
		},
		monster_coins_picked_up = {
			default_value = 0,
			type = "number",
			composite_keys = {}
		},
		melee_swap_chests_used = {
			type = "table",
			default_value = {},
			composite_keys = {},
			encode = encode_chests_used,
			decode = decode_chests_used
		},
		ranged_swap_chests_used = {
			type = "table",
			default_value = {},
			composite_keys = {},
			encode = encode_chests_used,
			decode = decode_chests_used
		},
		upgrade_chests_used = {
			type = "table",
			default_value = {},
			composite_keys = {},
			encode = encode_chests_used,
			decode = decode_chests_used
		},
		power_up_chests_used = {
			default_value = 0,
			type = "number",
			composite_keys = {}
		},
		coins_earned = {
			default_value = 0,
			type = "number",
			composite_keys = {}
		},
		coins_spent = {
			default_value = 0,
			type = "number",
			composite_keys = {}
		},
		host_migration_count = {
			default_value = 0,
			type = "number",
			composite_keys = {}
		},
		arena_belakor_node = {
			default_value = "",
			type = "string",
			composite_keys = {}
		},
		seen_arena_belakor_node = {
			default_value = false,
			type = "boolean",
			composite_keys = {
				peer_id = true
			}
		},
		granted_non_party_end_of_level_power_ups = {
			type = "table",
			default_value = {},
			composite_keys = {
				peer_id = true,
				career_index = true,
				profile_index = true,
				local_player_id = true
			},
			encode = encode_comma_separated_string_array,
			decode = decode_comma_separated_string_array
		}
	},
	peer = {
		telemetry_id = {
			default_value = "",
			type = "string",
			composite_keys = {}
		},
		player_level = {
			default_value = 1,
			type = "number",
			composite_keys = {}
		},
		player_name = {
			default_value = "Player",
			type = "string",
			composite_keys = {}
		},
		player_frame = {
			default_value = "default",
			type = "string",
			composite_keys = {}
		}
	}
}

SharedState.validate_spec(spec)

return spec

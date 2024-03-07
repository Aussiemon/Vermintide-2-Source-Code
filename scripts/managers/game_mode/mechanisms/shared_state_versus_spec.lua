-- chunkname: @scripts/managers/game_mode/mechanisms/shared_state_versus_spec.lua

local LibDeflate = require("scripts/utils/lib_deflate")
local ByteArray = require("scripts/utils/byte_array")

local function encode_saved_hero(character_data)
	local party_id = character_data.party_id or 0
	local slot_id = character_data.slot_id or 0
	local profile_index = character_data.profile_index or 0
	local career_index = character_data.career_index or 0
	local packed_number, index

	packed_number, index = ByteArray.pack_uint8(packed_number, party_id, index)
	packed_number, index = ByteArray.pack_uint8(packed_number, slot_id, index)
	packed_number, index = ByteArray.pack_uint8(packed_number, profile_index, index)
	packed_number, index = ByteArray.pack_uint8(packed_number, career_index, index)

	return packed_number
end

local function decode_saved_hero(packed_number)
	local party_id, slot_id, profile_index, career_index, unpack_index

	party_id, unpack_index = ByteArray.unpack_uint8(packed_number, unpack_index)
	slot_id, unpack_index = ByteArray.unpack_uint8(packed_number, unpack_index)
	profile_index, unpack_index = ByteArray.unpack_uint8(packed_number, unpack_index)
	career_index, unpack_index = ByteArray.unpack_uint8(packed_number, unpack_index)

	return {
		party_id = party_id,
		slot_id = slot_id,
		profile_index = profile_index,
		career_index = career_index,
	}
end

local function encode_hero_cosmetics(cosmetics_data)
	local weapon_slot_id = NetworkLookup.equipment_slots[cosmetics_data.weapon_slot]
	local weapon_id = CosmeticUtils.get_cosmetic_id(cosmetics_data.weapon_slot, cosmetics_data.weapon)
	local hero_skin_id = CosmeticUtils.get_cosmetic_id("slot_skin", cosmetics_data.hero_skin)
	local hat_id = CosmeticUtils.get_cosmetic_id("slot_hat", cosmetics_data.hat)
	local byte_array, index = FrameTable.alloc_table(), 1

	byte_array, index = ByteArray.write_uint8(byte_array, weapon_slot_id, index)
	byte_array, index = ByteArray.write_uint16(byte_array, weapon_id, index)
	byte_array, index = ByteArray.write_uint16(byte_array, hero_skin_id, index)
	byte_array, index = ByteArray.write_uint16(byte_array, hat_id, index)

	local byte_array_string = ByteArray.read_string(byte_array)
	local compressed_byte_array_string = LibDeflate:CompressDeflate(byte_array_string)

	return compressed_byte_array_string
end

local function decode_hero_cosmetics(compressed_byte_array_string)
	local byte_array_string = LibDeflate:DecompressDeflate(compressed_byte_array_string)
	local byte_array = FrameTable.alloc_table()

	ByteArray.write_string(byte_array, byte_array_string)

	local weapon_slot_id, weapon_id, hero_skin_id, hat_id
	local index = 1

	weapon_slot_id, index = ByteArray.read_uint8(byte_array, index)
	weapon_id, index = ByteArray.read_uint16(byte_array, index)
	hero_skin_id, index = ByteArray.read_uint16(byte_array, index)
	hat_id, index = ByteArray.read_uint16(byte_array, index)

	local weapon_slot = NetworkLookup.equipment_slots[weapon_slot_id]

	return {
		weapon_slot = weapon_slot,
		weapon = CosmeticUtils.get_cosmetic_name(weapon_slot, weapon_id),
		hero_skin = CosmeticUtils.get_cosmetic_name("slot_skin", hero_skin_id),
		hat = CosmeticUtils.get_cosmetic_name("slot_hat", hat_id),
	}
end

local spec = {
	server = {
		saved_hero = {
			type = "table",
			composite_keys = {
				local_player_id = true,
				peer_id = true,
			},
			default_value = {
				career_index = 0,
				party_id = 0,
				profile_index = 0,
				slot_id = 0,
			},
			encode = encode_saved_hero,
			decode = decode_saved_hero,
		},
		match_ended = {
			default_value = false,
			type = "boolean",
			composite_keys = {},
		},
		party_won_early = {
			default_value = false,
			type = "boolean",
			composite_keys = {},
		},
	},
	peer = {
		hero_cosmetics = {
			type = "table",
			composite_keys = {
				local_player_id = true,
			},
			default_value = {},
			encode = encode_hero_cosmetics,
			decode = decode_hero_cosmetics,
		},
	},
}

SharedState.validate_spec(spec)

return spec

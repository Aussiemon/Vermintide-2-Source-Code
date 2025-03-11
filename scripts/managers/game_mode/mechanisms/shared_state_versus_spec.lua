-- chunkname: @scripts/managers/game_mode/mechanisms/shared_state_versus_spec.lua

local LibDeflate = require("scripts/utils/lib_deflate")
local ByteArray = require("scripts/utils/byte_array")

local function encode_hero_cosmetics(cosmetics_data)
	local weapon_slot_id = NetworkLookup.equipment_slots[cosmetics_data.weapon_slot]
	local weapon_id = CosmeticUtils.get_cosmetic_id(cosmetics_data.weapon_slot, cosmetics_data.weapon)
	local weapon_pose_id = CosmeticUtils.get_cosmetic_id("slot_pose", cosmetics_data.weapon_pose)
	local weapon_pose_skin_id = CosmeticUtils.get_cosmetic_id("slot_pose_skin", cosmetics_data.weapon_pose_skin)
	local hero_skin_id = CosmeticUtils.get_cosmetic_id("slot_skin", cosmetics_data.hero_skin)
	local hat_id = CosmeticUtils.get_cosmetic_id("slot_hat", cosmetics_data.hat)
	local frame_id = CosmeticUtils.get_cosmetic_id("slot_frame", cosmetics_data.frame)
	local byte_array, index = FrameTable.alloc_table(), 1

	byte_array, index = ByteArray.write_uint8(byte_array, weapon_slot_id, index)
	byte_array, index = ByteArray.write_uint16(byte_array, weapon_id, index)
	byte_array, index = ByteArray.write_uint16(byte_array, weapon_pose_id, index)
	byte_array, index = ByteArray.write_uint16(byte_array, weapon_pose_skin_id, index)
	byte_array, index = ByteArray.write_uint16(byte_array, hero_skin_id, index)
	byte_array, index = ByteArray.write_uint16(byte_array, hat_id, index)
	byte_array, index = ByteArray.write_uint16(byte_array, frame_id, index)

	local pactsworn_cosmetics = cosmetics_data.pactsworn_cosmetics
	local num_cosmetics = table.size(pactsworn_cosmetics)

	byte_array, index = ByteArray.write_uint8(byte_array, num_cosmetics, index)

	for profile_name, ps_data in pairs(pactsworn_cosmetics) do
		local profile_idx = PROFILES_BY_NAME[profile_name].index
		local ps_weapon_slot_id = NetworkLookup.equipment_slots[ps_data.weapon_slot]
		local pactsworn_skin_id = CosmeticUtils.get_cosmetic_id(ps_data.weapon_slot, ps_data.skin)
		local pactsworn_weapon_id = CosmeticUtils.get_cosmetic_id(ps_data.weapon_slot, ps_data.weapon)

		byte_array, index = ByteArray.write_uint8(byte_array, profile_idx, index)
		byte_array, index = ByteArray.write_uint8(byte_array, ps_weapon_slot_id, index)
		byte_array, index = ByteArray.write_uint16(byte_array, pactsworn_skin_id, index)
		byte_array, index = ByteArray.write_uint16(byte_array, pactsworn_weapon_id, index)
	end

	local byte_array_string = ByteArray.read_string(byte_array)
	local compressed_byte_array_string = LibDeflate:CompressDeflate(byte_array_string)

	return compressed_byte_array_string
end

local function decode_hero_cosmetics(compressed_byte_array_string)
	local byte_array_string = LibDeflate:DecompressDeflate(compressed_byte_array_string)
	local byte_array = FrameTable.alloc_table()

	ByteArray.write_string(byte_array, byte_array_string)

	local weapon_slot_id, weapon_id, weapon_pose_id, weapon_pose_skin_id, hero_skin_id, hat_id, frame_id, num_cosmetics
	local pactsworn_cosmetics = {}
	local index = 1

	weapon_slot_id, index = ByteArray.read_uint8(byte_array, index)
	weapon_id, index = ByteArray.read_uint16(byte_array, index)
	weapon_pose_id, index = ByteArray.read_uint16(byte_array, index)
	weapon_pose_skin_id, index = ByteArray.read_uint16(byte_array, index)
	hero_skin_id, index = ByteArray.read_uint16(byte_array, index)
	hat_id, index = ByteArray.read_uint16(byte_array, index)
	frame_id, index = ByteArray.read_uint16(byte_array, index)
	num_cosmetics, index = ByteArray.read_uint8(byte_array, index)

	for i = 1, num_cosmetics do
		local profile_idx, ps_weapon_slot_id, pactsworn_skin_id, pactsworn_weapon_id

		profile_idx, index = ByteArray.read_uint8(byte_array, index)
		ps_weapon_slot_id, index = ByteArray.read_uint8(byte_array, index)
		pactsworn_skin_id, index = ByteArray.read_uint16(byte_array, index)
		pactsworn_weapon_id, index = ByteArray.read_uint16(byte_array, index)

		local profile_name = SPProfiles[profile_idx].display_name
		local ps_weapon_slot = NetworkLookup.equipment_slots[ps_weapon_slot_id]
		local pactsworn_skin = CosmeticUtils.get_cosmetic_name(ps_weapon_slot, pactsworn_skin_id)
		local pactsworn_weapon = CosmeticUtils.get_cosmetic_name(ps_weapon_slot, pactsworn_weapon_id)

		pactsworn_cosmetics[profile_name] = {
			skin = pactsworn_skin,
			weapon = pactsworn_weapon,
			weapon_slot = ps_weapon_slot,
		}
	end

	local weapon_slot = NetworkLookup.equipment_slots[weapon_slot_id]

	return {
		weapon_slot = weapon_slot,
		weapon = CosmeticUtils.get_cosmetic_name(weapon_slot, weapon_id),
		weapon_pose = CosmeticUtils.get_cosmetic_name("slot_pose", weapon_pose_id),
		weapon_pose_skin = CosmeticUtils.get_cosmetic_name("slot_pose_skin", weapon_pose_skin_id),
		hero_skin = CosmeticUtils.get_cosmetic_name("slot_skin", hero_skin_id),
		hat = CosmeticUtils.get_cosmetic_name("slot_hat", hat_id),
		frame = CosmeticUtils.get_cosmetic_name("slot_frame", frame_id),
		pactsworn_cosmetics = pactsworn_cosmetics,
	}
end

local spec = {
	server = {
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
		match_id = {
			default_value = "missing id",
			type = "string",
			composite_keys = {},
		},
	},
	peer = {
		hero_cosmetics = {
			type = "table",
			composite_keys = {
				local_player_id = true,
			},
			default_value = {
				pactsworn_cosmetics = {},
			},
			encode = encode_hero_cosmetics,
			decode = decode_hero_cosmetics,
		},
	},
}

SharedState.validate_spec(spec)

return spec

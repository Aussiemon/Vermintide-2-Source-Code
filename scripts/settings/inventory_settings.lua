-- chunkname: @scripts/settings/inventory_settings.lua

ItemType = {
	FRAME = "frame",
	HAT = "hat",
	LOOT_CHEST = "loot_chest",
	MELEE = "melee",
	NECKLACE = "necklace",
	RANGED = "ranged",
	RING = "ring",
	SKIN = "skin",
	TRINKET = "trinket",
}
InventorySettings = {
	slots = {
		{
			category = "weapon",
			hud_index = 1,
			name = "slot_melee",
			slot_index = 1,
			ui_slot_index = 1,
			wield_input = "wield_1",
			type = ItemType.MELEE,
		},
		{
			category = "weapon",
			hud_index = 2,
			name = "slot_ranged",
			slot_index = 2,
			ui_slot_index = 2,
			wield_input = "wield_2",
			type = ItemType.RANGED,
		},
		{
			category = "attachment",
			name = "slot_necklace",
			slot_index = 3,
			ui_slot_index = 3,
			unequippable = true,
			type = ItemType.NECKLACE,
		},
		{
			category = "attachment",
			name = "slot_ring",
			slot_index = 4,
			ui_slot_index = 4,
			unequippable = true,
			type = ItemType.RING,
		},
		{
			category = "attachment",
			name = "slot_trinket_1",
			slot_index = 5,
			ui_slot_index = 5,
			unequippable = true,
			type = ItemType.TRINKET,
		},
		{
			category = "attachment",
			cosmetic_index = 1,
			name = "slot_hat",
			slot_index = 6,
			type = ItemType.HAT,
		},
		{
			category = "cosmetic",
			cosmetic_index = 2,
			name = "slot_skin",
			slot_index = 8,
			type = ItemType.SKIN,
		},
		{
			category = "cosmetic",
			cosmetic_index = 3,
			name = "slot_frame",
			slot_index = 9,
			type = ItemType.FRAME,
		},
		{
			category = "weapon",
			console_hud_index = 2,
			hud_index = 3,
			name = "slot_healthkit",
			wield_input = "wield_3",
			drop_reasons = {
				death = true,
			},
		},
		{
			category = "weapon",
			console_hud_index = 4,
			hud_index = 4,
			name = "slot_potion",
			wield_input = "wield_4",
			wield_input_alt = "wield_4_alt",
			drop_reasons = {
				death = true,
			},
		},
		{
			category = "weapon",
			console_hud_index = 3,
			hud_index = 5,
			name = "slot_grenade",
			wield_input = "wield_5",
			drop_reasons = {
				death = true,
			},
		},
		{
			category = "enemy_weapon",
			name = "slot_packmaster_claw",
			drop_reasons = {
				death = true,
			},
		},
		{
			category = "level_event",
			name = "slot_level_event",
			drop_reasons = {
				career_ability = true,
				death = true,
				grabbed_by_chaos_spawn = true,
				grabbed_by_corruptor = true,
				grabbed_by_pack_master = true,
				grabbed_by_tentacle = true,
				knocked_down = true,
				pounced_down = true,
			},
		},
		{
			category = "career_skill_weapon",
			hud_index = 6,
			name = "slot_career_skill_weapon",
		},
	},
}
InventorySettings.loadouts = {
	{
		loadout_index = 1,
		loadout_type = "default",
	},
	{
		loadout_index = 2,
		loadout_type = "default",
	},
	{
		loadout_icon = "loadout_icon_1",
		loadout_index = 1,
		loadout_type = "custom",
	},
	{
		loadout_icon = "loadout_icon_2",
		loadout_index = 2,
		loadout_type = "custom",
	},
	{
		loadout_icon = "loadout_icon_3",
		loadout_index = 3,
		loadout_type = "custom",
	},
}

local max_num_custom_loadouts = 0

for _, loadout_data in ipairs(InventorySettings.loadouts) do
	if loadout_data.loadout_type == "custom" then
		max_num_custom_loadouts = max_num_custom_loadouts + 1
	end
end

InventorySettings.MAX_NUM_CUSTOM_LOADOUTS = max_num_custom_loadouts
InventorySettings.default_loadout_allowed_game_modes = {
	versus = true,
}
InventorySettings.bot_loadout_allowed_game_modes = {
	adventure = true,
	deus = true,
	inn = true,
	inn_deus = true,
	map_deus = true,
}
InventorySettings.weapon_slots = {}
InventorySettings.enemy_weapon_slots = {}
InventorySettings.attachment_slots = {}
InventorySettings.career_skill_weapon_slots = {}

for index, slot in ipairs(InventorySettings.slots) do
	if slot.category == "enemy_weapon" then
		InventorySettings.enemy_weapon_slots[#InventorySettings.enemy_weapon_slots + 1] = slot
	elseif slot.category == "weapon" then
		InventorySettings.weapon_slots[#InventorySettings.weapon_slots + 1] = slot
	elseif slot.category == "attachment" then
		InventorySettings.attachment_slots[#InventorySettings.attachment_slots + 1] = slot
	elseif slot.category == "career_skill_weapon" then
		InventorySettings.career_skill_weapon_slots[#InventorySettings.career_skill_weapon_slots + 1] = slot
	end
end

InventorySettings.slots_by_name = {}

for index, slot in ipairs(InventorySettings.slots) do
	InventorySettings.slots_by_name[slot.name] = slot
end

InventorySettings.slot_names_by_type = {}

for index, slot in ipairs(InventorySettings.slots) do
	if slot.type then
		if not InventorySettings.slot_names_by_type[slot.type] then
			InventorySettings.slot_names_by_type[slot.type] = {}
		end

		local slot_names_table = InventorySettings.slot_names_by_type[slot.type]

		slot_names_table[#slot_names_table + 1] = slot.name
	end
end

InventorySettings.slots_by_wield_input = {}

for index, slot in ipairs(InventorySettings.slots) do
	if slot.wield_input then
		local index_string = string.sub(slot.wield_input, 7)
		local index = tonumber(index_string)

		slot.wield_index = index
		InventorySettings.slots_by_wield_input[index] = slot
	end
end

InventorySettings.slots_by_inventory_button_index = {}

for index, slot in ipairs(InventorySettings.slots) do
	if slot.inventory_button_index then
		InventorySettings.slots_by_inventory_button_index[slot.inventory_button_index] = slot
	end
end

InventorySettings.slots_by_ui_slot_index = {}

for index, slot in ipairs(InventorySettings.slots) do
	if slot.ui_slot_index then
		InventorySettings.slots_by_ui_slot_index[slot.ui_slot_index] = slot
	end
end

InventorySettings.slots_by_cosmetic_index = {}

for index, slot in ipairs(InventorySettings.slots) do
	if slot.cosmetic_index then
		InventorySettings.slots_by_cosmetic_index[slot.cosmetic_index] = slot
	end
end

InventorySettings.slots_by_slot_index = {}

for index, slot in ipairs(InventorySettings.slots) do
	if slot.slot_index then
		InventorySettings.slots_by_slot_index[slot.slot_index] = slot
	end
end

InventorySettings.slots_by_console_hud_index = {}

for index, slot in ipairs(InventorySettings.slots) do
	if slot.console_hud_index then
		InventorySettings.slots_by_console_hud_index[slot.console_hud_index] = slot
	end
end

local equipment_slots = {
	slot_melee = true,
	slot_necklace = true,
	slot_ranged = true,
	slot_ring = true,
	slot_trinket_1 = true,
}

InventorySettings.equipment_slots = {}

for index, slot in ipairs(InventorySettings.slots) do
	if equipment_slots[slot.name] then
		InventorySettings.equipment_slots[#InventorySettings.equipment_slots + 1] = slot
	end
end

local jewellery_slots = {
	slot_necklace = true,
	slot_ring = true,
	slot_trinket_1 = true,
}

InventorySettings.jewellery_slots = {}

for index, slot in ipairs(InventorySettings.slots) do
	if jewellery_slots[slot.name] then
		InventorySettings.jewellery_slots[#InventorySettings.jewellery_slots + 1] = slot
	end
end

InventorySettings.item_types = {
	"bw_1h_sword",
	"bw_flame_sword",
	"bw_morningstar",
	"bw_staff_beam",
	"bw_staff_firball",
	"bw_staff_geiser",
	"bw_staff_spear",
	"dr_1h_axe_shield",
	"dr_1h_axes",
	"dr_1h_hammer ",
	"dr_1h_hammer_shield",
	"dr_2h_axes",
	"dr_2h_picks",
	"dr_2h_hammer",
	"dr_crossbow",
	"dr_drakefire_pistols",
	"dr_drakegun",
	"dr_grudgeraker",
	"dr_handgun",
	"es_1h_mace",
	"es_1h_mace_shield",
	"es_1h_sword",
	"es_1h_sword_shield",
	"es_2h_sword",
	"es_2h_war_hammer",
	"es_blunderbuss",
	"es_handgun",
	"es_repeating_handgun",
	"wh_1h_axes",
	"wh_1h_falchions",
	"wh_2h_sword",
	"wh_brace_of_pisols",
	"wh_crossbow",
	"wh_fencing_sword",
	"wh_repeating_pistol",
	"wh_repeating_crossbow",
	"ww_1h_sword ",
	"ww_2h_axe",
	"ww_dual_daggers",
	"ww_dual_swords",
	"ww_hagbane",
	"ww_longbow",
	"ww_shortbow",
	"ww_sword_and_dagger",
	"ww_trueflight",
}

DLCUtils.require_list("inventory_settings")

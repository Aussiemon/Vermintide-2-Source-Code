ItemType = {
	MELEE = "melee",
	FRAME = "frame",
	HAT = "hat",
	RANGED = "ranged",
	RING = "ring",
	NECKLACE = "necklace",
	TRINKET = "trinket",
	LOOT_CHEST = "loot_chest",
	SKIN = "skin"
}
InventorySettings = {
	slots = {
		{
			name = "slot_melee",
			wield_input = "wield_1",
			category = "weapon",
			slot_index = 1,
			hud_index = 1,
			ui_slot_index = 1,
			type = ItemType.MELEE
		},
		{
			name = "slot_ranged",
			wield_input = "wield_2",
			category = "weapon",
			slot_index = 2,
			hud_index = 2,
			ui_slot_index = 2,
			type = ItemType.RANGED
		},
		{
			name = "slot_necklace",
			slot_index = 3,
			category = "attachment",
			unequippable = true,
			ui_slot_index = 3,
			type = ItemType.NECKLACE
		},
		{
			name = "slot_ring",
			slot_index = 4,
			category = "attachment",
			unequippable = true,
			ui_slot_index = 4,
			type = ItemType.RING
		},
		{
			name = "slot_trinket_1",
			slot_index = 5,
			category = "attachment",
			unequippable = true,
			ui_slot_index = 5,
			type = ItemType.TRINKET
		},
		{
			name = "slot_hat",
			slot_index = 6,
			category = "attachment",
			cosmetic_index = 1,
			type = ItemType.HAT
		},
		{
			name = "slot_skin",
			slot_index = 8,
			category = "cosmetic",
			cosmetic_index = 2,
			type = ItemType.SKIN
		},
		{
			name = "slot_frame",
			slot_index = 9,
			category = "cosmetic",
			cosmetic_index = 3,
			type = ItemType.FRAME
		},
		{
			name = "slot_healthkit",
			wield_input = "wield_3",
			category = "weapon",
			hud_index = 3,
			drop_reasons = {
				death = true
			}
		},
		{
			name = "slot_potion",
			wield_input = "wield_4",
			category = "weapon",
			hud_index = 4,
			drop_reasons = {
				death = true
			}
		},
		{
			name = "slot_grenade",
			wield_input = "wield_5",
			category = "weapon",
			hud_index = 5,
			drop_reasons = {
				death = true
			}
		},
		{
			name = "slot_packmaster_claw",
			category = "enemy_weapon",
			drop_reasons = {
				death = true
			}
		},
		{
			name = "slot_level_event",
			category = "level_event",
			drop_reasons = {
				grabbed_by_chaos_spawn = true,
				pounced_down = true,
				grabbed_by_pack_master = true,
				death = true,
				knocked_down = true,
				grabbed_by_tentacle = true
			}
		},
		{
			name = "slot_career_skill_weapon",
			category = "career_skill_weapon"
		}
	},
	weapon_slots = {},
	enemy_weapon_slots = {},
	attachment_slots = {},
	career_skill_weapon_slots = {}
}

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

local equipment_slots = {
	slot_necklace = true,
	slot_trinket_1 = true,
	slot_ring = true,
	slot_melee = true,
	slot_ranged = true
}
InventorySettings.equipment_slots = {}

for index, slot in ipairs(InventorySettings.slots) do
	if equipment_slots[slot.name] then
		InventorySettings.equipment_slots[#InventorySettings.equipment_slots + 1] = slot
	end
end

local jewellery_slots = {
	slot_necklace = true,
	slot_trinket_1 = true,
	slot_ring = true
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
	"ww_trueflight"
}

return 

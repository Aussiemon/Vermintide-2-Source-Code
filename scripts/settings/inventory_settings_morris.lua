local item_types = {
	"dr_deus_01",
	"es_deus_01",
	"bw_deus_01",
	"wh_deus_01",
	"we_deus_01"
}
local slots = {
	slot_level_event = {
		drop_reasons = {
			deus_cursed_chest = true,
			deus_weapon_chest = true
		}
	}
}

for _, slot_settings in pairs(InventorySettings.slots) do
	local slot_name = slot_settings.name
	local extra_slot_settings = slots[slot_name]

	if extra_slot_settings then
		table.merge_recursive(slot_settings, extra_slot_settings)
	end
end

table.merge_recursive(InventorySettings.item_types, item_types)

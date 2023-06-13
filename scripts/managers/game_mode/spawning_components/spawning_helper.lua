SpawningHelper = class(SpawningHelper)
local CONSUMABLE_SLOTS = {
	"slot_healthkit",
	"slot_potion",
	"slot_grenade"
}
local temp_table = {}

SpawningHelper.netpack_consumables = function (consumables)
	table.clear(temp_table)

	for i = 1, #CONSUMABLE_SLOTS do
		local slot_name = CONSUMABLE_SLOTS[i]
		local item_name = consumables[slot_name]
		local item = rawget(ItemMasterList, item_name)

		if not item or item.skip_sync then
			item_name = "n/a"
		end

		temp_table[i] = NetworkLookup.item_names[item_name]
	end

	return temp_table
end

local temp_table_2 = {}

SpawningHelper.netpack_additional_items = function (additional_items)
	table.clear(temp_table_2)

	for slot_name, slot_data in pairs(additional_items) do
		local slot_items = slot_data.items

		for i = 1, #slot_items do
			local item = slot_items[i]

			if not item.skip_sync then
				local item_name = item.key
				local slot_id = NetworkLookup.equipment_slots[slot_name]
				local item_id = NetworkLookup.item_names[item_name]
				temp_table_2[#temp_table_2 + 1] = slot_id
				temp_table_2[#temp_table_2 + 1] = item_id
			end
		end
	end

	return temp_table_2
end

SpawningHelper.unnetpack_additional_items = function (encoded_additional_items)
	local decoded_table = {}

	for i = 1, #encoded_additional_items, 2 do
		local slot_id = tonumber(encoded_additional_items[i])
		local item_id = tonumber(encoded_additional_items[i + 1])
		local slot_name = NetworkLookup.equipment_slots[slot_id]
		local item_name = NetworkLookup.item_names[item_id]

		if not decoded_table[slot_name] then
			decoded_table[slot_name] = {
				items = {}
			}
		end

		local items = decoded_table[slot_name].items
		items[#items + 1] = ItemMasterList[item_name]
	end

	return decoded_table
end

SpawningHelper.fill_consumable_table = function (consumables, inventory_extension)
	for i = 1, #CONSUMABLE_SLOTS do
		local slot_name = CONSUMABLE_SLOTS[i]
		local slot_data = inventory_extension:get_slot_data(slot_name)
		local item_data = slot_data and slot_data.item_data
		local item_key = item_data and item_data.key

		if (item_key ~= nil or consumables[slot_name] ~= nil) and (not item_data or not item_data.skip_sync) then
			consumables[slot_name] = item_key
		end
	end
end

SpawningHelper.default_spawn_items = function (consumables, difficulty_settings, game_mode_settings)
	if not game_mode_settings.disable_difficulty_spawning_items then
		for i = 1, #CONSUMABLE_SLOTS do
			local slot_name = CONSUMABLE_SLOTS[i]
			consumables[slot_name] = difficulty_settings[slot_name]
		end
	end
end

SpawningHelper.get_consumable_slot_order = function ()
	return CONSUMABLE_SLOTS
end

SpawningHelper.fill_ammo_percentage = function (ammo, inventory_extension, player_unit)
	local equipment = inventory_extension:equipment()
	local slots = equipment.slots
	local owner = Managers.player:owner(player_unit)
	local is_remote = owner.remote

	for slot_name, _ in pairs(ammo) do
		local ammo_percentage = 1
		local slot_data = slots[slot_name]

		if slot_data then
			local item_data = slot_data.item_data
			local item_template = BackendUtils.get_item_template(item_data)

			if item_template.ammo_data then
				local ammo_unit_hand = item_template.ammo_data.ammo_hand

				if is_remote then
					ammo_percentage = inventory_extension:ammo_percentage() or ammo_percentage
				elseif ammo_unit_hand == "right" and Unit.alive(slot_data.right_unit_1p) then
					local ammo_extension = ScriptUnit.extension(slot_data.right_unit_1p, "ammo_system")
					ammo_percentage = ammo_extension:total_ammo_fraction()
				elseif ammo_unit_hand == "left" and Unit.alive(slot_data.left_unit_1p) then
					local ammo_extension = ScriptUnit.extension(slot_data.left_unit_1p, "ammo_system")
					ammo_percentage = ammo_extension:total_ammo_fraction()
				end
			end
		end

		ammo[slot_name] = ammo_percentage
	end
end

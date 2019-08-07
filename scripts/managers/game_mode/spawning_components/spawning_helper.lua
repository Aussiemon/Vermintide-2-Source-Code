SpawningHelper = class(SpawningHelper)
local CONSUMABLE_SLOTS = {
	"slot_healthkit",
	"slot_potion",
	"slot_grenade"
}
local temp_table = {}

SpawningHelper.netpack_consumables = function (consumables)
	table.clear(temp_table)

	for i = 1, #CONSUMABLE_SLOTS, 1 do
		local slot_name = CONSUMABLE_SLOTS[i]
		temp_table[i] = NetworkLookup.item_names[consumables[slot_name] or "n/a"]
	end

	return temp_table
end

SpawningHelper.fill_consumable_table = function (consumables, inventory_extension)
	for i = 1, #CONSUMABLE_SLOTS, 1 do
		local slot_name = CONSUMABLE_SLOTS[i]
		local slot_data = inventory_extension:get_slot_data(slot_name)
		local item_key = slot_data and slot_data.item_data.key

		if item_key ~= nil or consumables[slot_name] ~= nil then
			consumables[slot_name] = item_key
		end
	end
end

SpawningHelper.default_spawn_items = function (consumables, difficulty_settings, game_mode_settings)
	if not game_mode_settings.disable_difficulty_spawning_items then
		for i = 1, #CONSUMABLE_SLOTS, 1 do
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

return

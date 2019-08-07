CosmeticUtils = CosmeticUtils or {}

CosmeticUtils.color_tint_unit = function (unit, hero_name, gradient_variation, gradient_value)
	local material_name = "mtr_outfit"

	if hero_name == "bright_wizard" then
		material_name = "mtr_body"
	end

	local num_meshes = Unit.num_meshes(unit)

	for i = 0, num_meshes - 1, 1 do
		local mesh = Unit.mesh(unit, i)
		local has_material = Mesh.has_material(mesh, material_name)

		if has_material then
			local material = Mesh.material(mesh, material_name)
			local gradient_variation = gradient_variation
			local gradient_value = gradient_value

			Material.set_scalar(material, "gradient_variation", gradient_variation)
			Material.set_scalar(material, "tint_columns_pair", gradient_value)
		end
	end
end

local cosmetic_slots = {
	"slot_ranged",
	"slot_melee",
	"slot_skin",
	"slot_hat",
	"slot_frame"
}

CosmeticUtils.update_cosmetic_slot = function (player, slot, item_name, skin_name)
	if not table.contains(cosmetic_slots, slot) then
		return
	end

	if player and player.local_player and player:sync_data_active() then
		local name_id = 1

		if slot == "slot_frame" or slot == "slot_skin" then
			name_id = NetworkLookup.cosmetics[item_name or "default"]
		else
			name_id = NetworkLookup.item_names[item_name or "n/a"]
		end

		player:set_data(slot, name_id)

		if CosmeticUtils.is_weapon_slot(slot) then
			local skin_id = NetworkLookup.weapon_skins[skin_name or "n/a"]

			player:set_data(slot .. "_skin", skin_id)
		end
	end
end

CosmeticUtils.get_cosmetic_slot = function (player, slot)
	if not table.contains(cosmetic_slots, slot) then
		return nil
	end

	if player and player:sync_data_active() then
		local data = {}
		local item_id = player:get_data(slot)

		if not item_id then
			print("[CosmeticUtils] item_id for slot " .. slot .. " is nill ")

			return nil
		end

		if slot == "slot_frame" or slot == "slot_skin" then
			local item_name = NetworkLookup.cosmetics[item_id]

			if item_name == "default" then
				item_name = nil
			end

			data.item_name = item_name
		else
			local item_name = NetworkLookup.item_names[item_id]

			if item_name == "n/a" then
				item_name = nil
			end

			data.item_name = item_name
		end

		if CosmeticUtils.is_weapon_slot(slot) then
			local weapon_skin_id = player:get_data(slot .. "_skin")
			local skin_name = weapon_skin_id and NetworkLookup.weapon_skins[weapon_skin_id]

			if skin_name == "n/a" then
				skin_name = nil
			end

			data.skin_name = skin_name
		end

		return data
	end

	return nil
end

CosmeticUtils.is_weapon_slot = function (slot)
	return slot == "slot_melee" or slot == "slot_ranged"
end

CosmeticUtils.get_all_cosmetics = function (player)
	local cosmetics = {}

	for i = 1, #cosmetic_slots, 1 do
		local slot = cosmetic_slots[i]
		local data = CosmeticUtils.get_cosmetic_slot(player, slot)
		cosmetics[slot] = data
	end

	return cosmetics
end

CosmeticUtils.is_valid = function (item_data)
	return item_data and item_data.item_name
end

CosmeticUtils.get_default_cosmetic_slot = function (career_settings, slot_name)
	if not table.contains(cosmetic_slots, slot_name) then
		return nil
	end

	if slot_name == "slot_skin" then
		return {
			item_name = career_settings.base_skin
		}
	elseif CosmeticUtils.is_weapon_slot(slot_name) or slot_name == "slot_hat" then
		local preview_items = career_settings.preview_items

		if preview_items then
			for i = 1, #preview_items, 1 do
				local item_name = preview_items[i]
				local item_template = ItemMasterList[item_name]
				local slot_type = item_template.slot_type
				local slot_names = InventorySettings.slot_names_by_type[slot_type]

				if slot_names[1] == slot_name then
					return {
						item_name = item_name
					}
				end
			end
		end
	elseif slot_name == "slot_frame" then
		return {
			item_name = "default"
		}
	end

	return nil
end

CosmeticUtils.sync_local_player_cosmetics = function (profile_index, career_index)
	local player = Managers.player and Managers.player:local_player()

	if not player then
		return
	end

	local profile = SPProfiles[profile_index]
	local careers = profile.careers
	local career = careers[career_index]
	local career_name = career.name
	local slots_n = #cosmetic_slots
	local preview_items = career.preview_items

	if preview_items then
		for i = 1, #preview_items, 1 do
			local item_name = preview_items[i]
			local item_template = ItemMasterList[item_name]
			local slot_type = item_template.slot_type
			local slot_names = InventorySettings.slot_names_by_type[slot_type]
			local slot_name = slot_names[1]

			CosmeticUtils.update_cosmetic_slot(player, slot_name, item_name)
		end
	end

	CosmeticUtils.update_cosmetic_slot(player, "slot_skin", career.base_skin)

	for i = 1, slots_n, 1 do
		local slot_name = cosmetic_slots[i]
		local item = BackendUtils.get_loadout_item(career_name, slot_name)

		if item then
			local item_data = item.data
			local backend_id = item.backend_id
			local item_units = BackendUtils.get_item_units(item_data, backend_id)
			local item_name = item_data and item_data.name
			local item_skin = item_units and item_units.skin

			CosmeticUtils.update_cosmetic_slot(player, slot_name, item_name, item_skin)
		end
	end
end

return

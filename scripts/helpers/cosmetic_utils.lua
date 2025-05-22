-- chunkname: @scripts/helpers/cosmetic_utils.lua

CosmeticUtils = CosmeticUtils or {}

CosmeticUtils.color_tint_unit = function (unit, hero_name, gradient_variation, gradient_value)
	local material_name = "mtr_outfit"

	if hero_name == "bright_wizard" then
		material_name = "mtr_body"
	end

	local num_meshes = Unit.num_meshes(unit)

	for i = 0, num_meshes - 1 do
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

CosmeticUtils.apply_material_settings = function (unit, material_settings)
	for variable_name, data in pairs(material_settings) do
		if data.type == "color" then
			if data.apply_to_children then
				Unit.set_color_for_materials_in_unit_and_childs(unit, variable_name, Quaternion(data.alpha, data.r, data.g, data.b))
			else
				Unit.set_color_for_materials(unit, variable_name, Quaternion(data.alpha, data.r, data.g, data.b))
			end
		elseif data.type == "matrix4x4" then
			local matrix = Matrix4x4(data.xx, data.xy, data.xz, data.yx, data.yy, data.yz, data.zx, data.zy, data.zz, data.tx, data.ty, data.tz)

			if data.apply_to_children then
				Unit.set_matrix4x4_for_materials_in_unit_and_childs(unit, variable_name, matrix)
			else
				Unit.set_matrix4x4_for_materials(unit, variable_name, matrix)
			end
		elseif data.type == "scalar" then
			if data.apply_to_children then
				Unit.set_scalar_for_materials_in_unit_and_childs(unit, variable_name, data.value)
			else
				Unit.set_scalar_for_materials(unit, variable_name, data.value)
			end
		elseif data.type == "vector2" then
			if data.apply_to_children then
				Unit.set_vector2_for_materials_in_unit_and_childs(unit, variable_name, Vector3(data.x, data.y, 0))
			else
				Unit.set_vector2_for_materials(unit, variable_name, Vector3(data.x, data.y, 0))
			end
		elseif data.type == "vector3" then
			if data.apply_to_children then
				Unit.set_vector3_for_materials_in_unit_and_childs(unit, variable_name, Vector3(data.x, data.y, data.z))
			else
				Unit.set_vector3_for_materials(unit, variable_name, Vector3(data.x, data.y, data.z))
			end
		elseif data.type == "vector4" then
			if data.apply_to_children then
				Unit.set_vector4_for_materials_in_unit_and_childs(unit, variable_name, Quaternion(data.x, data.y, data.z, data.w))
			else
				Unit.set_vector4_for_materials(unit, variable_name, Quaternion(data.x, data.y, data.z, data.w))
			end
		elseif data.type == "texture" and Application.can_get("texture", data.texture) then
			Unit.set_texture_for_materials(unit, variable_name, data.texture)
		end
	end
end

local cosmetic_slots = {
	slot_frame = true,
	slot_hat = true,
	slot_skin = true,
}
local cosmetic_items = {
	frame = true,
	hat = true,
	skin = true,
}
local cosmetic_and_weapon_slots = {
	"slot_ranged",
	"slot_melee",
	"slot_skin",
	"slot_hat",
	"slot_frame",
	"slot_pose",
}
local cosmetic_and_weapon_slots_lookup = {
	slot_frame = true,
	slot_hat = true,
	slot_melee = true,
	slot_pose = true,
	slot_ranged = true,
	slot_skin = true,
}

CosmeticUtils.is_cosmetic_slot = function (slot_name)
	return cosmetic_slots[slot_name] ~= nil
end

CosmeticUtils.is_cosmetic_item = function (item_type)
	return cosmetic_items[item_type] ~= nil
end

CosmeticUtils.is_weapon_pose = function (item)
	local slot_type = item.slot_type

	return slot_type == "weapon_pose"
end

local generic_frame_template = {
	icon = "unit_frame_02",
	name = "",
	unit = "",
	attachment_node = {
		unit = "units/ui/ui_portrait_frame",
		attachment_node = AttachmentNodeLinking.ui_portrait_frame,
	},
	material_settings = {
		portrait_frame = {
			texture = "gui/1080p/single_textures/generic/transparent_placeholder_texture",
			type = "texture",
		},
	},
}

CosmeticUtils.generate_frame_template = function (name)
	local template = generic_frame_template
	local texture_package_name = string.format("resource_packages/store/item_icons/store_item_icon_%s", name)

	if Application.can_get("package", texture_package_name) then
		template.texture_package_name = texture_package_name
		template.material_settings.portrait_frame.texture = string.format("gui/1080p/single_textures/store_item_icons/store_item_icon_%s/store_item_icon_%s", name, name)
	end

	template.name = name

	return template
end

CosmeticUtils.get_cosmetic_name = function (slot, optional_item_id)
	local item_name

	if slot == "slot_frame" or slot == "slot_skin" then
		item_name = NetworkLookup.cosmetics[optional_item_id or 1]
	else
		item_name = NetworkLookup.item_names[optional_item_id or 1]
	end

	return item_name
end

CosmeticUtils.get_weapon_skin_name = function (slot, optional_skin_id)
	local skin_name

	if CosmeticUtils.is_weapon_slot(slot) then
		skin_name = NetworkLookup.weapon_skins[optional_skin_id or 1]
	elseif slot == "slot_pose" then
		skin_name = NetworkLookup.item_names[optional_skin_id or 1]
	end

	return skin_name
end

CosmeticUtils.get_cosmetic_id = function (slot, optional_item_name)
	if slot == "slot_frame" or slot == "slot_skin" then
		return NetworkLookup.cosmetics[optional_item_name or "default"]
	else
		return NetworkLookup.item_names[optional_item_name or "n/a"]
	end
end

CosmeticUtils.get_weapon_pose_skin = function (item_name)
	local weapon_pose_skin
	local item = ItemMasterList[item_name]
	local backend_items = Managers.backend:get_interface("items")
	local equipped_weapon_pose_skins = backend_items:get_equipped_weapon_pose_skins()
	local parent_name = item.parent
	local equipped_weapon_pose_skin_name = equipped_weapon_pose_skins[parent_name]

	if equipped_weapon_pose_skin_name then
		local weapon_pose_skin_backend_id = backend_items:get_weapon_skin_from_skin_key(equipped_weapon_pose_skin_name)

		weapon_pose_skin = weapon_pose_skin_backend_id and backend_items:get_item_from_id(weapon_pose_skin_backend_id)
	end

	return weapon_pose_skin
end

CosmeticUtils.get_weapon_skin_id = function (slot, optional_skin_name)
	local skin_id

	if CosmeticUtils.is_weapon_slot(slot) then
		skin_id = NetworkLookup.weapon_skins[optional_skin_name or "n/a"]
	elseif slot == "slot_pose" then
		local item = ItemMasterList[optional_skin_name]
		local backend_items = Managers.backend:get_interface("items")
		local parent_name = item.parent
		local weapon_pose_skin = backend_items:get_equipped_weapon_pose_skin(parent_name)

		if weapon_pose_skin then
			local weapon_pose_skin_id = NetworkLookup.item_names[weapon_pose_skin]

			if weapon_pose_skin_id then
				skin_id = weapon_pose_skin_id
			end
		else
			skin_id = NetworkLookup.item_names["n/a"]
		end
	end

	return skin_id
end

CosmeticUtils.update_cosmetic_slot = function (player, slot, item_name, skin_name)
	if not cosmetic_and_weapon_slots_lookup[slot] then
		return
	end

	if player and (player.local_player or player.bot_player and player.is_server) and player:sync_data_active() then
		local name_id = CosmeticUtils.get_cosmetic_id(slot, item_name)

		player:set_data(slot, name_id)

		local skin_id

		if slot == "slot_pose" then
			skin_id = CosmeticUtils.get_weapon_skin_id(slot, item_name)
		elseif skin_name then
			skin_id = CosmeticUtils.get_weapon_skin_id(slot, skin_name)
		end

		if skin_id then
			player:set_data(slot .. "_skin", skin_id)
		end
	end
end

CosmeticUtils.get_cosmetic_slot = function (player, slot)
	if not cosmetic_and_weapon_slots_lookup[slot] then
		return nil
	end

	if player and player:sync_data_active() then
		local data = {}
		local item_id = player:get_data(slot)

		if not item_id then
			print("[CosmeticUtils] item_id for slot " .. slot .. " is nill ")

			return nil
		end

		local skin_id

		if CosmeticUtils.is_weapon_slot(slot) or slot == "slot_pose" then
			skin_id = player:get_data(slot .. "_skin")
		end

		local item_name = CosmeticUtils.get_cosmetic_name(slot, item_id)

		if item_name == "default" or item_name == "n/a" then
			item_name = nil
		end

		local skin_name = CosmeticUtils.get_weapon_skin_name(slot, skin_id)

		if skin_name == "n/a" then
			skin_name = nil
		end

		data.item_name = item_name
		data.skin_name = skin_name

		return data
	end

	return nil
end

CosmeticUtils.is_weapon_slot = function (slot)
	return slot == "slot_melee" or slot == "slot_ranged"
end

CosmeticUtils.is_valid = function (item_data)
	return item_data and item_data.item_name
end

CosmeticUtils.get_default_cosmetic_slot = function (career_settings, slot_name)
	if not cosmetic_and_weapon_slots_lookup[slot_name] then
		return nil
	end

	if slot_name == "slot_skin" then
		return {
			item_name = career_settings.base_skin,
		}
	elseif slot_name == "slot_pose" then
		return {
			item_name = "default_weapon_pose_01",
		}
	elseif CosmeticUtils.is_weapon_slot(slot_name) or slot_name == "slot_hat" then
		local preview_items = career_settings.preview_items

		if preview_items then
			for i = 1, #preview_items do
				local item = preview_items[i]
				local item_name = item.item_name
				local item_template = ItemMasterList[item_name]
				local slot_type = item_template.slot_type
				local slot_names = InventorySettings.slot_names_by_type[slot_type]

				if slot_names[1] == slot_name then
					return {
						item_name = item_name,
					}
				end
			end
		end
	elseif slot_name == "slot_frame" then
		return {
			item_name = "default",
		}
	end

	return nil
end

CosmeticUtils.sync_local_player_cosmetics = function (player, profile_index, career_index)
	if not player then
		Application.warning("[CosmeticUtils.sync_local_player_cosmetics] Failed to sync cosmetics")

		return
	end

	local profile = SPProfiles[profile_index]
	local careers = profile.careers
	local career = careers[career_index]
	local career_name = career.name
	local slots_n = #cosmetic_and_weapon_slots
	local preview_items = career.preview_items

	if preview_items then
		for i = 1, #preview_items do
			local item = preview_items[i]
			local item_name = item.item_name
			local item_template = ItemMasterList[item_name]
			local slot_type = item_template.slot_type
			local slot_names = InventorySettings.slot_names_by_type[slot_type]
			local slot_name = slot_names[1]

			CosmeticUtils.update_cosmetic_slot(player, slot_name, item_name)
		end
	end

	CosmeticUtils.update_cosmetic_slot(player, "slot_skin", career.base_skin)

	for i = 1, slots_n do
		local slot_name = cosmetic_and_weapon_slots[i]
		local item = BackendUtils.get_loadout_item(career_name, slot_name)

		if item then
			local item_data = item.data
			local backend_id = item.backend_id
			local item_units = BackendUtils.get_item_units(item_data, backend_id, nil, career_name)
			local item_name = item_data and item_data.name
			local item_skin = item_units and item_units.skin

			CosmeticUtils.update_cosmetic_slot(player, slot_name, item_name, item_skin)
		end
	end
end

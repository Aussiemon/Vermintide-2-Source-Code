GearUtils = {}
local unit_node = Unit.node

GearUtils.create_equipment = function (world, slot_name, item_data, unit_1p, unit_3p, is_bot, unit_template, extra_extension_data, ammo_percent, override_item_template, override_item_units, career_name)
	local right_hand_weapon_unit_3p, right_hand_weapon_unit_1p, left_hand_weapon_unit_3p, left_hand_weapon_unit_1p, right_hand_ammo_unit_3p, right_hand_ammo_unit_1p, left_hand_ammo_unit_3p, left_hand_ammo_unit_1p = nil
	local item_template = override_item_template or BackendUtils.get_item_template(item_data)
	local item_units = override_item_units or BackendUtils.get_item_units(item_data, nil, nil, career_name)

	if item_units.right_hand_unit then
		right_hand_weapon_unit_3p, right_hand_ammo_unit_3p, right_hand_weapon_unit_1p, right_hand_ammo_unit_1p = GearUtils.spawn_inventory_unit(world, "right", item_template, item_units, slot_name, item_data, unit_1p, unit_3p, unit_template, extra_extension_data, ammo_percent, item_units.material_settings)
	end

	if item_units.left_hand_unit then
		left_hand_weapon_unit_3p, left_hand_ammo_unit_3p, left_hand_weapon_unit_1p, left_hand_ammo_unit_1p = GearUtils.spawn_inventory_unit(world, "left", item_template, item_units, slot_name, item_data, unit_1p, unit_3p, unit_template, extra_extension_data, ammo_percent, item_units.material_settings)
	end

	if right_hand_weapon_unit_3p then
		Unit.set_flow_variable(right_hand_weapon_unit_3p, "is_bot", is_bot)
		Unit.set_unit_visibility(right_hand_weapon_unit_3p, false)

		if right_hand_ammo_unit_3p then
			Unit.set_unit_visibility(right_hand_ammo_unit_3p, false)
		end
	end

	if right_hand_weapon_unit_1p then
		Unit.set_flow_variable(right_hand_weapon_unit_1p, "is_bot", is_bot)
		Unit.set_unit_visibility(right_hand_weapon_unit_1p, false)

		if right_hand_ammo_unit_1p then
			Unit.set_unit_visibility(right_hand_ammo_unit_1p, false)
		end
	end

	if left_hand_weapon_unit_3p then
		Unit.set_flow_variable(left_hand_weapon_unit_3p, "is_bot", is_bot)
		Unit.set_unit_visibility(left_hand_weapon_unit_3p, false)

		if left_hand_ammo_unit_3p then
			Unit.set_unit_visibility(left_hand_ammo_unit_3p, false)
		end
	end

	if left_hand_weapon_unit_1p then
		Unit.set_flow_variable(left_hand_weapon_unit_1p, "is_bot", is_bot)
		Unit.set_unit_visibility(left_hand_weapon_unit_1p, false)

		if left_hand_ammo_unit_1p then
			Unit.set_unit_visibility(left_hand_ammo_unit_1p, false)
		end
	end

	local is_ammo_weapon = item_units.is_ammo_weapon

	if is_ammo_weapon then
		local material_settings = item_units.material_settings or item_template.material_settings

		if material_settings then
			if right_hand_ammo_unit_3p then
				GearUtils.apply_material_settings(right_hand_ammo_unit_3p, material_settings)
			end

			if left_hand_ammo_unit_3p then
				GearUtils.apply_material_settings(left_hand_ammo_unit_3p, material_settings)
			end

			if unit_1p then
				if right_hand_ammo_unit_1p then
					GearUtils.apply_material_settings(right_hand_ammo_unit_1p, material_settings)
				end

				if left_hand_ammo_unit_1p then
					GearUtils.apply_material_settings(left_hand_ammo_unit_1p, material_settings)
				end
			end
		end
	end

	local slot_data = {
		id = slot_name,
		item_data = item_data,
		item_template = item_template,
		skin = item_units.skin,
		right_unit_3p = right_hand_weapon_unit_3p,
		right_ammo_unit_3p = right_hand_ammo_unit_3p,
		right_unit_1p = right_hand_weapon_unit_1p,
		right_ammo_unit_1p = right_hand_ammo_unit_1p,
		left_unit_3p = left_hand_weapon_unit_3p,
		left_ammo_unit_3p = left_hand_ammo_unit_3p,
		left_unit_1p = left_hand_weapon_unit_1p,
		left_ammo_unit_1p = left_hand_ammo_unit_1p,
		projectile_units_template = item_units.projectile_units_template,
		pickup_template_name = item_units.pickup_template_name,
		link_pickup_template_name = item_units.link_pickup_template_name,
		destroy_indexed_projectiles = item_template.destroy_indexed_projectiles,
		right_hand_unit_name = item_units.right_hand_unit,
		left_hand_unit_name = item_units.left_hand_unit
	}

	return slot_data
end

GearUtils.apply_properties_to_item_template = function (template, backend_id)
	local backend_items = Managers.backend:get_interface("items")
	local item = backend_items:get_item_from_id(backend_id)
	local properties = item and item.properties

	if properties then
		local template_clone = table.clone(template)
		local properties_data = item.rarity == "magic" and WeaveProperties.properties or WeaponProperties.properties

		for property_key, _ in pairs(properties) do
			local property_data = properties_data[property_key]
			local template_function = property_data.template_function

			if template_function and template_clone[template_function] then
				local property_quality = 1

				template_clone[template_function](template_clone, property_quality)
			end
		end

		return template_clone
	end

	return template
end

GearUtils.apply_material_settings = function (unit, material_settings)
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
		end
	end
end

GearUtils.spawn_inventory_unit = function (world, hand, item_template, item_units, slot_name, item_data, owner_unit_1p, owner_unit_3p, unit_template, extra_extension_data, ammo_percent, material_settings)
	local ammo_data = item_template.ammo_data
	local item_name = item_data.name
	local node_linking_settings = item_template[hand .. "_hand_attachment_node_linking"]
	local weapon_unit_name = item_units[hand .. "_hand_unit"]
	local ammo_unit_name = item_units.ammo_unit
	local ammo_unit_name_3p = item_units.ammo_unit_3p
	local ammo_unit_3p = nil

	if ammo_data and ammo_data.ammo_hand == hand and ammo_unit_name then
		local ammo_unit_attachment_node_linking = ammo_data.ammo_unit_attachment_node_linking

		fassert(ammo_unit_attachment_node_linking, "ammo unit: [\"%s\"] defined in weapon without attachment node linking", ammo_unit_name)

		ammo_unit_3p = GearUtils._attach_ammo_unit(world, ammo_unit_name_3p or ammo_unit_name .. "_3p", ammo_unit_attachment_node_linking.third_person.wielded, owner_unit_3p)
	end

	local attachment_node_linking_3p = node_linking_settings.third_person.wielded
	local unit_template_3p_name = item_data.third_person_extension_template or item_template.third_person_extension_template or "weapon_unit_3p"
	local extension_init_data_3p = nil

	if item_template.uses_weapon_system_on_3p and not owner_unit_1p then
		extension_init_data_3p = {
			weapon_system = {
				item_template = item_template
			}
		}
	else
		unit_template_3p_name = "weapon_unit_3p"
		extension_init_data_3p = {}
	end

	local weapon_unit_3p_name = weapon_unit_name .. "_3p"
	local weapon_unit_3p = Managers.state.unit_spawner:spawn_local_unit_with_extensions(weapon_unit_3p_name, unit_template_3p_name, extension_init_data_3p)
	local scene_graph_links_3p = {}

	GearUtils.link(world, attachment_node_linking_3p, scene_graph_links_3p, owner_unit_3p, weapon_unit_3p)

	material_settings = material_settings or item_template.material_settings

	if material_settings then
		GearUtils.apply_material_settings(weapon_unit_3p, material_settings)
	end

	if owner_unit_1p then
		local attachment_node_linking_1p = node_linking_settings.first_person.wielded
		local extension_init_data_1p = {
			weapon_system = {
				first_person_rig = owner_unit_1p,
				owner_unit = owner_unit_3p,
				attach_nodes = attachment_node_linking_1p,
				item_name = item_name,
				item_template = item_template,
				skin_name = item_units.skin
			},
			ammo_system = {
				owner_unit = owner_unit_3p,
				ammo_data = ammo_data,
				ammo_percent = ammo_percent,
				reload_event = item_template.reload_event,
				pickup_reload_event_1p = item_template.pickup_reload_event_1p,
				no_ammo_reload_event = item_template.no_ammo_reload_event,
				last_reload_event = item_template.reload_end_event,
				item_name = item_name,
				slot_name = slot_name
			},
			spread_system = {
				owner_unit = owner_unit_3p,
				item_name = item_name
			},
			overcharge_system = {
				ammo_percent = ammo_percent,
				owner_unit = owner_unit_3p,
				item_name = item_name
			}
		}
		local unit_template_1p, ammo_unit_1p = nil
		local ammo_hand = ammo_data and ammo_data.ammo_hand

		if ammo_data then
			fassert(ammo_hand, "weapon [\"%s\"] does not have an ammo hand defined in its ammo_data", item_name)
		end

		local default_spread_template = item_template.default_spread_template

		if ammo_data and ammo_hand == hand then
			if ammo_unit_name then
				local ammo_unit_attachment_node_linking = ammo_data.ammo_unit_attachment_node_linking

				fassert(ammo_unit_attachment_node_linking, "ammo unit: [\"%s\"] defined in weapon without attachment node linking", ammo_unit_name)

				ammo_unit_1p = GearUtils._attach_ammo_unit(world, ammo_unit_name, ammo_unit_attachment_node_linking.first_person.wielded, owner_unit_1p)
			end

			if default_spread_template then
				unit_template_1p = "weapon_unit_ammo_spread"
			else
				unit_template_1p = "weapon_unit_ammo"
			end
		elseif default_spread_template then
			unit_template_1p = "weapon_unit_spread"
		else
			unit_template_1p = "weapon_unit"
		end

		if unit_template then
			unit_template_1p = unit_template

			table.merge(extension_init_data_1p, extra_extension_data)
		elseif item_template.unit_extension_template then
			unit_template_1p = item_template.unit_extension_template
		end

		local weapon_unit_1p = Managers.state.unit_spawner:spawn_local_unit_with_extensions(weapon_unit_name, unit_template_1p, extension_init_data_1p)
		local scene_graph_links = {}

		GearUtils.link(world, attachment_node_linking_1p, scene_graph_links, owner_unit_1p, weapon_unit_1p)

		if material_settings then
			GearUtils.apply_material_settings(weapon_unit_1p, material_settings)
		end

		return weapon_unit_3p, ammo_unit_3p, weapon_unit_1p, ammo_unit_1p
	end

	return weapon_unit_3p, ammo_unit_3p
end

GearUtils._attach_ammo_unit = function (world, ammo_unit_name, attachment_node_linking, target_unit)
	local ammo_unit = Managers.state.unit_spawner:spawn_local_unit(ammo_unit_name)
	local scene_graph_links = {}

	GearUtils.link(world, attachment_node_linking, scene_graph_links, target_unit, ammo_unit)

	return ammo_unit
end

GearUtils.link = function (world, attachment_node_linking, scene_graph_links, user_unit, unit)
	table.clear(scene_graph_links)
	GearUtils.link_units(world, attachment_node_linking, scene_graph_links, user_unit, unit)
end

GearUtils.link_units = function (world, attachment_node_linking, link_table, source, target)
	for i, attachment_nodes in ipairs(attachment_node_linking) do
		local source_node = attachment_nodes.source
		local target_node = attachment_nodes.target
		local source_node_index = type(source_node) == "string" and Unit.node(source, source_node) or source_node
		local target_node_index = type(target_node) == "string" and Unit.node(target, target_node) or target_node
		link_table[#link_table + 1] = {
			unit = target,
			i = target_node_index,
			parent = Unit.scene_graph_parent(target, target_node_index),
			local_pose = Matrix4x4Box(Unit.local_pose(target, target_node_index))
		}

		World.link_unit(world, target, target_node_index, source, source_node_index)
	end
end

GearUtils.restore_scene_graph = function (scene_graph_links)
	if scene_graph_links then
		for i, link in ipairs(scene_graph_links) do
			if link.parent then
				Unit.scene_graph_link(link.unit, link.i, link.parent)
				Unit.set_local_pose(link.unit, link.i, link.local_pose:unbox())
			end
		end
	end
end

GearUtils.destroy_wielded = function (world, wielded_unit)
	Unit.flow_event(wielded_unit, "lua_unwield")

	local unit_spawner = Managers.state.unit_spawner

	unit_spawner:mark_for_deletion(wielded_unit)
end

GearUtils.get_ammo_extension = function (right_hand_unit, left_hand_unit)
	local right_hand_ammo_extension = right_hand_unit and ScriptUnit.has_extension(right_hand_unit, "ammo_system")
	local left_hand_ammo_extension = left_hand_unit and ScriptUnit.has_extension(left_hand_unit, "ammo_system")

	return right_hand_ammo_extension or left_hand_ammo_extension
end

GearUtils.destroy_equipment = function (world, equipment)
	local unit_spawner = Managers.state.unit_spawner

	if equipment.right_hand_wielded_unit_3p and Unit.alive(equipment.right_hand_wielded_unit_3p) then
		GearUtils.destroy_wielded(world, equipment.right_hand_wielded_unit_3p)
	end

	if equipment.right_hand_ammo_unit_3p and Unit.alive(equipment.right_hand_ammo_unit_3p) then
		unit_spawner:mark_for_deletion(equipment.right_hand_ammo_unit_3p)
	end

	if equipment.right_hand_wielded_unit and Unit.alive(equipment.right_hand_wielded_unit) then
		GearUtils.destroy_wielded(world, equipment.right_hand_wielded_unit)
	end

	if equipment.right_hand_ammo_unit_1p and Unit.alive(equipment.right_hand_ammo_unit_1p) then
		unit_spawner:mark_for_deletion(equipment.right_hand_ammo_unit_1p)
	end

	if equipment.left_hand_wielded_unit_3p and Unit.alive(equipment.left_hand_wielded_unit_3p) then
		GearUtils.destroy_wielded(world, equipment.left_hand_wielded_unit_3p)
	end

	if equipment.left_hand_ammo_unit_3p and Unit.alive(equipment.left_hand_ammo_unit_3p) then
		unit_spawner:mark_for_deletion(equipment.left_hand_ammo_unit_3p)
	end

	if equipment.left_hand_wielded_unit and Unit.alive(equipment.left_hand_wielded_unit) then
		GearUtils.destroy_wielded(world, equipment.left_hand_wielded_unit)
	end

	if equipment.left_hand_ammo_unit_1p and Unit.alive(equipment.left_hand_ammo_unit_1p) then
		unit_spawner:mark_for_deletion(equipment.left_hand_ammo_unit_1p)
	end

	equipment.right_hand_wielded_unit_3p = nil
	equipment.right_hand_ammo_unit_3p = nil
	equipment.right_hand_wielded_unit = nil
	equipment.right_hand_ammo_unit_1p = nil
	equipment.left_hand_wielded_unit_3p = nil
	equipment.left_hand_ammo_unit_3p = nil
	equipment.left_hand_wielded_unit = nil
	equipment.left_hand_ammo_unit_1p = nil
end

GearUtils.destroy_slot = function (world, unit, slot_data, equipment, allow_destroy_weapon)
	local item_data = slot_data.item_data
	local slot_name = slot_data.id

	fassert(allow_destroy_weapon or slot_name ~= "slot_ranged" and slot_name ~= "slot_melee", "Trying to destroy weapon without permission")

	if item_data == equipment.wielded then
		GearUtils.destroy_equipment(world, equipment)
	else
		local right_hand_weapon_unit_3p = slot_data.right_unit_3p
		local right_hand_ammo_unit_3p = slot_data.right_ammo_unit_3p
		local right_hand_weapon_unit_1p = slot_data.right_unit_1p
		local right_hand_ammo_unit_1p = slot_data.right_ammo_unit_1p
		local left_hand_weapon_unit_3p = slot_data.left_unit_3p
		local left_hand_ammo_unit_3p = slot_data.left_ammo_unit_3p
		local left_hand_weapon_unit_1p = slot_data.left_unit_1p
		local left_hand_ammo_unit_1p = slot_data.left_ammo_unit_1p
		local unit_spawner = Managers.state.unit_spawner

		if right_hand_weapon_unit_3p then
			unit_spawner:mark_for_deletion(right_hand_weapon_unit_3p)
		end

		if right_hand_ammo_unit_3p then
			unit_spawner:mark_for_deletion(right_hand_ammo_unit_3p)
		end

		if right_hand_weapon_unit_1p then
			unit_spawner:mark_for_deletion(right_hand_weapon_unit_1p)
		end

		if right_hand_ammo_unit_1p then
			unit_spawner:mark_for_deletion(right_hand_ammo_unit_1p)
		end

		if left_hand_weapon_unit_3p then
			unit_spawner:mark_for_deletion(left_hand_weapon_unit_3p)
		end

		if left_hand_ammo_unit_3p then
			unit_spawner:mark_for_deletion(left_hand_ammo_unit_3p)
		end

		if left_hand_weapon_unit_1p then
			unit_spawner:mark_for_deletion(left_hand_weapon_unit_1p)
		end

		if left_hand_ammo_unit_1p then
			unit_spawner:mark_for_deletion(left_hand_ammo_unit_1p)
		end
	end

	equipment.slots[slot_name] = nil
end

local temp_table = {}

GearUtils.hot_join_sync = function (peer_id, unit, equipment, additional_items)
	local slots = equipment.slots
	local unit_object_id = Managers.state.unit_storage:go_id(unit)
	local channel_id = PEER_ID_TO_CHANNEL[peer_id]

	for slot_name, slot_data in pairs(slots) do
		repeat
			local slot = InventorySettings.slots_by_name[slot_name]

			if slot.category ~= "weapon" and slot.category ~= "career_skill_weapon" and slot.category ~= "enemy_weapon" and slot.category ~= "level_event" then
				break
			end

			local slot_id = NetworkLookup.equipment_slots[slot_name]
			local item_data = slot_data.item_data
			local item_id = NetworkLookup.item_names[item_data.name]
			local weapon_skin_id = NetworkLookup.weapon_skins[slot_data.skin or "n/a"]

			RPC.rpc_add_equipment(channel_id, unit_object_id, slot_id, item_id, weapon_skin_id)
		until true
	end

	local profile_synchronizer = Managers.state.network.profile_synchronizer
	local resyncing_loadout = not profile_synchronizer:is_peer_all_synced(peer_id)

	if not resyncing_loadout and equipment.wielded then
		RPC.rpc_wield_equipment(channel_id, unit_object_id, NetworkLookup.equipment_slots[equipment.wielded_slot])
	end

	for slot_name, data in pairs(additional_items) do
		local slot_id = NetworkLookup.equipment_slots[slot_name]

		table.clear(temp_table)

		for i = 1, #data.items do
			local item = data.items[i]
			temp_table[#temp_table + 1] = NetworkLookup.item_names[item.name]
		end

		RPC.rpc_update_additional_slot(channel_id, unit_object_id, slot_id, temp_table)
	end
end

GearUtils._setup_extension_init_data_type_impact = function (item_template, item_name)
	local explosive_settings = item_template.explosive_settings
	local area_damage_system = {
		item_template_name = item_template.name,
		invisible_projectile = explosive_settings.invisible_projectile,
		impact_player_take_damage = explosive_settings.impact_player_take_damage,
		impact_damage = explosive_settings.impact_damage,
		impact_damage_radius = explosive_settings.impact_damage_radius,
		impact_damage_min_radius_with_max_damage = explosive_settings.impact_damage_min_radius_with_max_damage,
		impact_effect_name = explosive_settings.impact_effect_name,
		impact_sound_event = explosive_settings.impact_sound_event,
		impact_area_damage_template = explosive_settings.impact_area_damage_template,
		item_name = item_name
	}

	return area_damage_system
end

GearUtils._setup_extension_init_data_type_dot = function (item_template, item_name)
	local dot_settings = item_template.dot_settings
	local area_damage_system = {
		item_template_name = item_template.name,
		invisible_projectile = dot_settings.invisible_projectile,
		aoe_dot_player_take_damage = dot_settings.aoe_dot_player_take_damage,
		aoe_dot_life_time = dot_settings.aoe_dot_life_time,
		aoe_dot_radius = dot_settings.aoe_dot_radius,
		aoe_dot_damage = dot_settings.aoe_dot_damage,
		aoe_dot_damage_interval = dot_settings.aoe_dot_damage_interval,
		impact_sound_event = dot_settings.impact_sound_event,
		dot_effect_name = dot_settings.dot_effect_name,
		player_screen_effect_name = dot_settings.player_screen_effect_name,
		area_damage_template = dot_settings.area_damage_template,
		area_ai_random_death_template = dot_settings.area_ai_random_death_template,
		item_name = item_name
	}

	return area_damage_system
end

GearUtils.create_grenade_extension_init_data = function (owner_unit, item_name, current_action, projectile_data, explode_time)
	local network_position = AiAnimUtils.position_network_scale(projectile_data.position, true)
	local network_rotation = AiAnimUtils.rotation_network_scale(projectile_data.rotation, true)
	local network_velocity = AiAnimUtils.velocity_network_scale(projectile_data.velocity, true)
	local network_angular_velocity = AiAnimUtils.velocity_network_scale(projectile_data.angular_velocity, true)
	local projectile_info = current_action.projectile_info
	local lookup_data = current_action.lookup_data
	local life_time = projectile_info.life_time
	local t = Managers.time:time("game")
	local stop_time = explode_time or t + life_time
	local extension_init_data = {
		projectile_locomotion_system = {
			owner_unit = owner_unit,
			network_position = network_position,
			network_rotation = network_rotation,
			network_velocity = network_velocity,
			network_angular_velocity = network_angular_velocity,
			use_dynamic_collision = projectile_info.use_dynamic_collision,
			collision_filter = projectile_info.collision_filter,
			item_name = item_name
		},
		projectile_system = {
			owner_unit = owner_unit,
			stop_time = stop_time,
			item_name = item_name,
			item_template_name = lookup_data.item_template_name,
			action_name = lookup_data.action_name,
			sub_action_name = lookup_data.sub_action_name
		}
	}
	local item_template = Weapons[lookup_data.item_template_name]

	if current_action.is_impact_type then
		extension_init_data.area_damage_system = GearUtils._setup_extension_init_data_type_impact(item_template, item_name)
	else
		extension_init_data.area_damage_system = GearUtils._setup_extension_init_data_type_dot(item_template, item_name)
	end

	return extension_init_data
end

GearUtils.get_property_and_trait_buffs = function (backend_items, backend_id, buffs_table, only_no_wield_required)
	if Managers.state.game_mode:has_activated_mutator("whiterun") then
		return buffs_table
	end

	local item = backend_items:get_item_from_id(backend_id)
	local properties = item and item.properties

	if properties then
		local properties_data = item.rarity == "magic" and WeaveProperties.properties or WeaponProperties.properties

		for property_key, property_value in pairs(properties) do
			local property_data = properties_data[property_key]
			local buff_name = property_data.buff_name
			local buffer = property_data.buffer or "client"
			local no_wield_required = property_data.no_wield_required

			if BuffTemplates[buff_name] then
				if only_no_wield_required and no_wield_required then
					buffs_table[buffer][buff_name] = {
						variable_value = property_value
					}
				elseif not only_no_wield_required and not no_wield_required then
					buffs_table[buffer][buff_name] = {
						variable_value = property_value
					}
				end
			end
		end
	end

	local traits = item and item.traits

	if traits then
		local traits_data = item.rarity == "magic" and WeaveTraits.traits or WeaponTraits.traits

		for _, trait_key in pairs(traits) do
			local trait_data = traits_data[trait_key]
			local buff_name = trait_data.buff_name
			local buffer = trait_data.buffer or "client"
			local no_wield_required = traits_data.no_wield_required

			if BuffTemplates[buff_name] then
				if only_no_wield_required and no_wield_required then
					buffs_table[buffer][buff_name] = {
						variable_value = 1
					}
				elseif not only_no_wield_required and not no_wield_required then
					buffs_table[buffer][buff_name] = {
						variable_value = 1
					}
				end
			end
		end
	end

	return buffs_table
end

local function _get_item_particle_link_target(fx, equipment, unit_3p, unit_1p, is_first_person)
	local link_target = nil

	if fx.link_target == "left_weapon" then
		link_target = is_first_person and equipment.left_hand_wielded_unit or equipment.left_hand_wielded_unit_3p
	elseif fx.link_target == "right_weapon" then
		link_target = is_first_person and equipment.right_hand_wielded_unit or equipment.right_hand_wielded_unit_3p
	elseif fx.link_target == "owner_3p" then
		link_target = unit_3p
	elseif fx.link_target == "owner_1p" then
		link_target = unit_1p
	end

	return link_target
end

local function _get_item_particle_link_node(fx, link_target)
	return fx.link_node and unit_node(link_target, fx.link_node) or 0
end

GearUtils.create_attached_particles = function (world, particle_fx, equipment, unit_3p, unit_1p, is_first_person)
	if not world or not particle_fx or not equipment then
		return nil
	end

	local stop_fx = {}
	local destroy_fx = {}
	local fx_ids = {
		stop_fx = stop_fx,
		destroy_fx = destroy_fx
	}

	for i = 1, #particle_fx do
		local fx = particle_fx[i]

		if is_first_person and fx.first_person or not is_first_person and fx.third_person then
			local link_target = _get_item_particle_link_target(fx, equipment, unit_3p, unit_1p, is_first_person)

			if link_target then
				local node_id = _get_item_particle_link_node(fx, link_target)
				local fx_id = ScriptWorld.create_particles_linked(world, fx.effect, link_target, node_id, fx.orphaned_policy)

				if fx.destroy_policy == "stop_spawning" then
					stop_fx[#stop_fx + 1] = fx_id
				else
					destroy_fx[#destroy_fx + 1] = fx_id
				end
			end
		end
	end

	return fx_ids
end

GearUtils.destroy_attached_particles = function (world, fx_ids)
	if fx_ids and world then
		local destroy_fx = fx_ids.destroy_fx

		if destroy_fx then
			for i = 1, #destroy_fx do
				World.destroy_particles(world, destroy_fx[i])
			end
		end

		local stop_fx = fx_ids.stop_fx

		if stop_fx then
			for i = 1, #stop_fx do
				World.stop_spawning_particles(world, stop_fx[i])
			end
		end
	end

	return nil
end

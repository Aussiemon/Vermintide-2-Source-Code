﻿-- chunkname: @scripts/flow/flow_callbacks_foundation.lua

require("foundation/scripts/util/table")
require("scripts/settings/attachment_node_linking")
require("scripts/settings/ai_inventory_templates")

local unit_alive = Unit.alive

function flow_query_script_data(params)
	local output_value

	if params.table then
		output_value = Unit.get_data(params.unit, params.table, params.scriptdata)
	else
		output_value = Unit.get_data(params.unit, params.scriptdata)
	end

	local returns = {
		value = output_value,
	}

	return returns
end

function flow_set_script_data(params)
	if params.table then
		Unit.set_data(params.unit, params.table, params.scriptdata, params.value)
	else
		Unit.set_data(params.unit, params.scriptdata, params.value)
	end
end

function flow_script_data_compare_bool(params)
	local script_data_value
	local ref_value = params.reference
	local returns

	if params.table then
		local tab = split(params.table, "/")

		table.insert(tab, params.scriptdata)

		script_data_value = Unit.get_data(params.unit, unpack(tab))
	else
		script_data_value = Unit.get_data(params.unit, params.scriptdata)
	end

	if type(script_data_value) == "boolean" then
		if script_data_value == ref_value then
			returns = {
				equal = true,
				unequal = false,
			}
		else
			returns = {
				equal = false,
				unequal = true,
			}
		end

		return returns
	end
end

function flow_script_data_compare_string(params)
	local script_data_value
	local ref_value = params.reference
	local returns

	if params.table then
		local tab = split(params.table, "/")

		table.insert(tab, params.scriptdata)

		script_data_value = Unit.get_data(params.unit, unpack(tab))
	else
		script_data_value = Unit.get_data(params.unit, params.scriptdata)
	end

	if type(script_data_value) == "string" then
		if script_data_value == ref_value then
			returns = {
				equal = true,
			}
		else
			returns = {
				unequal = true,
			}
		end

		return returns
	end
end

function flow_script_data_compare_number(params)
	local script_data_value
	local ref_value = params.reference
	local returns

	if params.table then
		local tab = split(params.table, "/")

		table.insert(tab, params.scriptdata)

		script_data_value = Unit.get_data(params.unit, unpack(tab))
	else
		script_data_value = Unit.get_data(params.unit, params.scriptdata)
	end

	if type(script_data_value) == "number" then
		if script_data_value < ref_value then
			returns = {
				less = true,
			}
		elseif script_data_value <= ref_value then
			returns = {
				less_or_equal = true,
			}
		elseif script_data_value == ref_value then
			returns = {
				equal = true,
			}
		elseif script_data_value ~= ref_value then
			returns = {
				unequal = true,
			}
		elseif ref_value <= script_data_value then
			returns = {
				more_or_equal = true,
			}
		elseif ref_value < script_data_value then
			returns = {
				more = true,
			}
		end

		return returns
	end
end

function flow_callback_state_false(params)
	local returns = {
		state = false,
		updated = true,
	}

	return returns
end

function flow_callback_state_true(params)
	local returns = {
		state = true,
		updated = true,
	}

	return returns
end

function flow_callback_construct_vector3(params)
	local v = Vector3(params.x, params.y, params.z)
	local returns = {
		vector = v,
	}

	return returns
end

function flow_callback_store_float(params)
	local stored_value = params.invalue
	local returns = {
		state = true,
		updated = true,
		outvalue = stored_value,
	}

	return returns
end

function flow_callback_store_boolean(params)
	local stored_bool = params.inbool
	local returns = {
		state = true,
		updated = true,
		outbool = stored_bool,
	}

	return returns
end

function flow_callback_switchcase(params)
	local ret = {}
	local outStr = "out"

	if params.case ~= "" then
		for k, v in pairs(params) do
			if k ~= "case" and params.case == v then
				ret[outStr .. string.sub(k, -1)] = true
			end
		end
	end

	return ret
end

function flow_callback_switchcase_special(params)
	local ret = {}
	local outStr = "out"

	if params.case ~= "" then
		for k, v in pairs(params) do
			if k ~= "case" then
				local i = string.sub(k, -1)

				if params.case == i then
					ret[outStr .. i] = true
					ret.out_number = i
				end
			end
		end
	end

	return ret
end

function flow_callback_set_numeric_w_out(params)
	local ret = {}
	local outStr = "out"

	if params.case ~= "" then
		for k, v in pairs(params) do
			if k ~= "case" then
				local i = string.sub(k, -1)

				if params.case == i then
					ret[outStr .. i] = true
					ret.out_number = i
				end
			end
		end
	end

	return ret
end

function flow_callback_math_addition(params)
	local term_one = params.term_one
	local term_two = params.term_two

	return {
		value = term_one + term_two,
	}
end

function flow_callback_rotate_vector3(params)
	local direction = params.direction
	local vector3 = params.vector3

	vector3 = Quaternion.rotate(direction, vector3)

	return {
		vector = vector3,
	}
end

function flow_callback_look(params)
	local direction = params.direction
	local up = params.up
	local look_quat = Quaternion.look(direction, up)

	return {
		rotation = look_quat,
	}
end

function flow_callback_math_subtraction(params)
	local term_one = params.term_one
	local term_two = params.term_two

	return {
		value = term_one - term_two,
	}
end

function flow_callback_math_multiplication(params)
	local factor_one = params.factor_one
	local factor_two = params.factor_two

	return {
		value = factor_one * factor_two,
	}
end

function flow_callback_math_multiplication_vector3(params)
	local vector = params.vector
	local float = params.float

	return {
		value = vector * float,
	}
end

function flow_callback_math_division(params)
	local dividend = params.dividend
	local divisor = params.divisor

	fassert(divisor ~= 0, "Trying to divide by 0 in division flow node.")

	return {
		value = dividend / divisor,
	}
end

function flow_callback_math_floor(params)
	return {
		value = math.floor(params.float),
	}
end

function flow_callback_math_ceil(params)
	return {
		value = math.ceil(params.float),
	}
end

function flow_callback_trigger_event(params)
	if unit_alive(params.unit) then
		Unit.flow_event(params.unit, params.event)
	else
		print("WARNING: flow_callback_trigger_event - unit:", params.unit)
	end
end

function flow_callback_set_unit_visibility(params)
	Unit.set_visibility(params.unit, params.group, params.visibility)
end

function flow_callback_distance_between(params)
	local unit = params.unit
	local node_1 = params.node1
	local node_2 = params.node2
	local node_index_1 = Unit.node(unit, node_1)
	local node_index_2 = Unit.node(unit, node_2)
	local world_position_1 = Unit.world_position(unit, node_index_1)
	local world_position_2 = Unit.world_position(unit, node_index_2)
	local distance_between = Vector3.distance(world_position_1, world_position_2)
	local returns = {
		distance = distance_between,
	}

	return returns
end

function flow_callback_link_objects_in_units_and_store(params)
	local parentunit = params.parent_unit
	local childunit = params.child_unit
	local parentnodes = split(params.parent_nodes, ";")
	local childnodes = split(params.child_nodes, ";")
	local world = Unit.world(parentunit)
	local index_offset = Script.index_offset()

	for i = 1, #parentnodes - 1 do
		local parentnodeindex = Unit.node(parentunit, parentnodes[i])
		local childnode = childnodes[i]
		local childnodeindex

		if string.find(childnode, "Index(.)") then
			childnodeindex = tonumber(string.match(childnode, "%d+") + index_offset)
		else
			childnodeindex = Unit.node(childunit, childnode)
		end

		World.link_unit(world, childunit, childnodeindex, parentunit, parentnodeindex)

		if params.parent_lod_object and params.child_lod_object and Unit.has_lod_object(parentunit, params.parent_lod_object) and Unit.has_lod_object(childunit, params.child_lod_object) then
			local parent_lod_object = Unit.lod_object(parentunit, params.parent_lod_object)
			local child_lod_object = Unit.lod_object(childunit, params.child_lod_object)

			LODObject.set_bounding_volume(child_lod_object, LODObject.bounding_volume(parent_lod_object))
			World.link_unit(world, childunit, LODObject.node(child_lod_object), parentunit, LODObject.node(parent_lod_object))
		end
	end

	local unit_attachments = Unit.get_data(parentunit, "flow_unit_attachments") or {}

	table.insert(unit_attachments, childunit)
	Unit.set_data(parentunit, "flow_unit_attachments", unit_attachments)

	return {
		linked = true,
	}
end

function flow_callback_unlink_objects_in_units_and_remove(params)
	local parentunit = params.parent_unit
	local childunit = params.child_unit
	local world = Unit.world(parentunit)

	World.unlink_unit(world, childunit)

	local unit_attachments = Unit.get_data(parentunit, "flow_unit_attachments") or {}
	local key = table.find(unit_attachments, childunit)

	if key then
		table.remove(unit_attachments, key)
	end

	Unit.set_data(parentunit, "flow_unit_attachments", unit_attachments)

	return {
		unlinked = true,
	}
end

function flow_callback_attach_unit(params)
	local node_link_table = AttachmentNodeLinking
	local node_linking_template = split(params.node_link_template, "/")

	if not node_linking_template then
		print("No attachment node linking defined in flow!")

		return
	end

	for _, key in ipairs(node_linking_template) do
		node_link_table = node_link_table[key]
	end

	if type(node_link_table) ~= "table" then
		print("No attachment node linking with name %s", tostring(params.node_link_template))

		return
	end

	local parentunit = params.parent_unit
	local childunit = params.child_unit
	local index_offset = Script.index_offset()
	local world = Unit.world(parentunit)

	for _, link_data in ipairs(node_link_table) do
		local parent_node = link_data.source
		local child_node = link_data.target
		local parent_node_index = type(parent_node) == "string" and Unit.node(parentunit, parent_node) or parent_node + index_offset
		local child_node_index = type(child_node) == "string" and Unit.node(childunit, child_node) or child_node + index_offset

		World.link_unit(world, childunit, child_node_index, parentunit, parent_node_index)
	end

	if params.link_lod_groups and Unit.num_lod_objects(parentunit) ~= 0 and Unit.num_lod_objects(childunit) ~= 0 then
		local parent_lod_object = Unit.lod_object(parentunit, index_offset)
		local child_lod_object = Unit.lod_object(childunit, index_offset)

		LODObject.set_bounding_volume(child_lod_object, LODObject.bounding_volume(parent_lod_object))
		World.link_unit(world, childunit, LODObject.node(child_lod_object), parentunit, LODObject.node(parent_lod_object))
	end

	if params.store_in_parent then
		local unit_attachments = Unit.get_data(parentunit, "flow_unit_attachments") or {}

		table.insert(unit_attachments, childunit)
		Unit.set_data(parentunit, "flow_unit_attachments", unit_attachments)
	end

	return {
		linked = true,
	}
end

function flow_callback_attach_player_item(params)
	if params.item == nil then
		return {}
	end

	local item_unit
	local parent_unit = params.unit
	local world = Unit.world(parent_unit)

	if ItemMasterList ~= nil then
		local item_table = ItemMasterList
		local item = item_table[params.item]

		if item ~= nil then
			if params.career_filter and not table.is_empty(item.can_wield) and not table.find(item.can_wield, params.career_filter) then
				print("SKIPPED ITEM! Career " .. params.career_filter .. " can't wield " .. params.item)
				table.dump(item.can_wield)

				return
			end

			if item.slot_type == "melee" or item.slot_type == "ranged" or item.slot_type == "weapon_skin" or item.slot_type == "potion" then
				if Weapons ~= nil then
					local weapon_template = Weapons[item.template]

					if item.right_hand_unit ~= nil then
						item_unit = attach_player_item(parent_unit, item.right_hand_unit .. "_3p", weapon_template.right_hand_attachment_node_linking.third_person, params.unwielded, false)
					end

					if item.left_hand_unit ~= nil then
						if item.left_hand_unit ~= item.ammo_unit then
							item_unit = attach_player_item(parent_unit, item.left_hand_unit .. "_3p", weapon_template.left_hand_attachment_node_linking.third_person, params.unwielded, false)
						else
							item_unit = attach_player_item(parent_unit, item.left_hand_unit .. "_3p", weapon_template.right_hand_attachment_node_linking.third_person, params.unwielded, false)
						end
					end

					if weapon_template.ammo_data ~= nil and weapon_template.actions.action_one.default.projectile_info ~= nil then
						local projectile_units = ProjectileUnits

						if projectile_units[weapon_template.actions.action_one.default.projectile_info.projectile_units_template].dummy_linker_unit_name ~= nil then
							item_unit = attach_player_item(parent_unit, projectile_units[weapon_template.actions.action_one.default.projectile_info.projectile_units_template].dummy_linker_unit_name, weapon_template.ammo_data.ammo_unit_attachment_node_linking.third_person, params.unwielded, false)
						end
					end

					if Unit.has_animation_state_machine(parent_unit) and weapon_template.wield_anim ~= nil and not params.skip_wield_anim then
						Unit.animation_event(parent_unit, weapon_template.wield_anim)
					end
				else
					print("SKIPPED PLAYER WEAPON: Missing Weapons table")
				end
			elseif item.slot_type == "hat" then
				if item.unit ~= nil then
					if Attachments ~= nil then
						local hat_template = Attachments[item.template]

						item_unit = attach_player_item(parent_unit, item.unit, hat_template.attachment_node_linking.slot_hat, nil, true)
						equip_event = Unit.get_data(item_unit, "equip_event") or hat_template.show_attachments_event or nil
						material_switches = nil

						if hat_template.character_material_changes ~= nil then
							material_switches = hat_template.character_material_changes.third_person
						end

						if equip_event then
							Unit.flow_event(parent_unit, equip_event)
						end

						local flow_item_attachments = Unit.get_data(parent_unit, "flow_item_attachments") or {}

						for _, attached_unit in pairs(flow_item_attachments) do
							if equip_event then
								Unit.flow_event(attached_unit, equip_event)
							end

							if material_switches ~= nil then
								for slot_name, material_name in pairs(material_switches) do
									Unit.set_material(attached_unit, slot_name, material_name)
								end
							end
						end

						local skin_events = Unit.get_data(parent_unit, "skin_events") or {}

						for _, skin_event in pairs(skin_events) do
							Unit.flow_event(item_unit, skin_event)
						end
					else
						print("SKIPPED PLAYER ATTACHMENT: Missing Attachments table")
					end
				end
			elseif item.slot_type == "skin" then
				if Cosmetics ~= nil then
					local skin_template = Cosmetics[params.item]

					if skin_template.third_person_attachment ~= nil then
						item_unit = attach_player_item(parent_unit, skin_template.third_person_attachment.unit, skin_template.third_person_attachment.attachment_node_linking, nil, true)

						if skin_template.material_changes ~= nil then
							for slot_name, material_name in pairs(skin_template.material_changes.third_person) do
								Unit.set_material(item_unit, slot_name, material_name)
							end
						end

						local skin_events = Unit.get_data(parent_unit, "skin_events") or {}

						if skin_template.equip_hat_event ~= nil then
							table.insert(skin_events, skin_template.equip_hat_event)
						else
							table.insert(skin_events, "using_skin_default")
						end

						Unit.set_data(parent_unit, "skin_events", skin_events)
						Unit.set_data(item_unit, "skin_events", skin_events)

						if Unit.has_animation_state_machine(item_unit) and Unit.has_animation_event(item_unit, "enable") then
							Unit.animation_event(item_unit, "enable")
						end
					end
				else
					print("SKIPPED PLAYER COSMETICS: Missing Cosmetics table")
				end
			else
				print("SKIPPED PLAYER ITEM: Unsupported slot type " .. item.slot_type)
			end
		else
			print("SKIPPED PLAYER ITEM: Missing item " .. params.item)
		end
	else
		print("SKIPPED PLAYER INVENTORY: Missing ItemMasterList table")
	end

	return {
		item_unit = item_unit,
	}
end

function attach_player_item(parent_unit, child_unit_name, node_link_template, unwielded, link_lods)
	local index_offset = Script.index_offset()

	if unwieled then
		node_link_template = node_link_template.unwielded or node_link_template
	else
		node_link_template = node_link_template.wielded or node_link_template
	end

	local item_position, item_rotation

	for target_node, source_node in pairs(node_link_template) do
		if target_node == 0 then
			local source_node_index = type(source_node) == "string" and Unit.node(parent_unit, source_node) or source_node + index_offset

			item_position = Unit.world_position(parent_unit, source_node_index)
			item_rotation = Unit.world_rotation(parent_unit, source_node_index)

			break
		end
	end

	local world = Unit.world(parent_unit)
	local child_unit = World.spawn_unit(world, child_unit_name, item_position, item_rotation)

	for _, link_data in ipairs(node_link_template) do
		local parent_node = link_data.source
		local child_node = link_data.target
		local parent_node_index = type(parent_node) == "string" and Unit.node(parent_unit, parent_node) or parent_node + index_offset
		local child_node_index = type(child_node) == "string" and Unit.node(child_unit, child_node) or child_node + index_offset

		World.link_unit(world, child_unit, child_node_index, parent_unit, parent_node_index)
	end

	if link_lods and Unit.num_lod_objects(parent_unit) ~= 0 and Unit.num_lod_objects(child_unit) ~= 0 then
		local parent_lod_object = Unit.lod_object(parent_unit, index_offset)
		local child_lod_object = Unit.lod_object(child_unit, index_offset)

		LODObject.set_bounding_volume(child_lod_object, LODObject.bounding_volume(parent_lod_object))
		World.link_unit(world, child_unit, LODObject.node(child_lod_object), parent_unit, LODObject.node(parent_lod_object))
	end

	local item_attachments = Unit.get_data(parent_unit, "flow_item_attachments") or {}

	table.insert(item_attachments, child_unit)
	Unit.set_data(parent_unit, "flow_item_attachments", item_attachments)

	return child_unit
end

function flow_callback_remove_player_items(params)
	local parent_unit = params.unit
	local world = Unit.world(parent_unit)
	local item_attachments = Unit.get_data(parent_unit, "flow_item_attachments") or {}

	for i = 1, #item_attachments do
		params.unit = item_attachments[i]

		local temp = flow_callback_remove_player_items(params)

		World.destroy_unit(world, item_attachments[i])
	end

	Unit.set_data(parent_unit, "flow_item_attachments", {})

	return {}
end

function flow_callback_unattach_unit(params)
	local parentunit = params.parent_unit
	local childunit = params.child_unit
	local world = Unit.world(parentunit)

	World.unlink_unit(world, childunit)

	local unit_attachments = Unit.get_data(parentunit, "flow_unit_attachments") or {}
	local key = table.find(unit_attachments, childunit)

	if key then
		table.remove(unit_attachments, key)
	end

	Unit.set_data(parentunit, "flow_unit_attachments", unit_attachments)

	return {
		unlinked = true,
	}
end

function flow_callback_trigger_event_on_attachments(params)
	local unit_attachments = Unit.get_data(params.unit, "flow_unit_attachments") or {}

	for i = 1, #unit_attachments do
		Unit.flow_event(unit_attachments[i], params.event)
	end

	return {
		triggered = true,
	}
end

function flow_callback_unit_spawner_mark_for_deletion(params)
	return
end

function flow_callback_set_actor_enabled(params)
	local unit = params.unit

	assert(unit, "Set Actor Enabled flow node is missing unit")

	local actor = params.actor or Unit.actor(unit, params.actor_name)

	fassert(actor, "Set Actor Enabled flow node referring to unit %s is missing actor %s", tostring(unit), tostring(params.actor or params.actor_name))
	Actor.set_collision_enabled(actor, params.enabled)
	Actor.set_scene_query_enabled(actor, params.enabled)
end

function flow_callback_set_actor_kinematic(params)
	local unit = params.unit

	assert(unit, "Set Actor Kinematic flow node is missing unit")

	local actor = params.actor or Unit.actor(unit, params.actor_name)

	fassert(actor, "Set Actor Kinematic flow node referring to unit %s is missing actor %s", tostring(unit), tostring(params.actor or params.actor_name))
	Actor.set_kinematic(actor, params.enabled)
end

function flow_callback_spawn_actor(params)
	local unit = params.unit

	assert(unit, "Spawn Actor flow node is missing unit")

	local actor = params.actor_name

	Unit.create_actor(unit, actor)
end

function flow_callback_destroy_actor(params)
	local unit = params.unit

	assert(unit, "Destroy Actor flow node is missing unit")

	local actor = params.actor_name

	Unit.destroy_actor(unit, actor)
end

function flow_callback_set_actor_initial_velocity(params)
	local unit = params.unit

	assert(unit, "Set actor initial velocity has no unit")
	Unit.apply_initial_actor_velocities(unit, true)
end

function flow_callback_set_actor_initial_velocity(params)
	local unit = params.unit

	assert(unit, "Set actor initial velocity has no unit")
	Unit.apply_initial_actor_velocities(unit, true)
end

function flow_callback_set_unit_material_variation(params)
	local unit = params.unit
	local material_variation = params.material_variation

	Unit.set_material_variation(unit, material_variation)
end

function flow_callback_set_material_property_scalar(params)
	local unit = params.unit
	local all_meshes = params.all_meshes
	local mesh = params.mesh
	local material_name = params.material
	local variable = params.variable
	local value = params.value

	if all_meshes then
		for i = 0, Unit.num_meshes(unit) - 1 do
			mesh = Unit.mesh(unit, i)

			if Mesh.has_material(mesh, material_name) then
				local material = Mesh.material(mesh, material_name)

				Material.set_scalar(material, variable, value)
			end
		end
	else
		mesh = Unit.mesh(unit, mesh)

		local material = Mesh.material(mesh, material_name)

		Material.set_scalar(material, variable, value)
	end
end

function flow_callback_set_material_property_vector2(params)
	local unit = params.unit
	local all_meshes = params.all_meshes
	local mesh = params.mesh
	local material_name = params.material
	local variable = params.variable
	local value = Vector2(params.value.x, params.value.y)

	if all_meshes then
		for i = 0, Unit.num_meshes(unit) - 1 do
			mesh = Unit.mesh(unit, i)

			if Mesh.has_material(mesh, material_name) then
				local material = Mesh.material(mesh, material_name)

				Material.set_vector2(material, variable, value)
			end
		end
	else
		mesh = Unit.mesh(unit, mesh)

		local material = Mesh.material(mesh, material_name)

		Material.set_vector2(material, variable, value)
	end
end

function flow_callback_set_material_property_vector3(params)
	local unit = params.unit
	local all_meshes = params.all_meshes
	local mesh = params.mesh
	local material_name = params.material
	local variable = params.variable
	local value = params.value

	if all_meshes then
		for i = 0, Unit.num_meshes(unit) - 1 do
			mesh = Unit.mesh(unit, i)

			if Mesh.has_material(mesh, material_name) then
				local material = Mesh.material(mesh, material_name)

				Material.set_vector3(material, variable, value)
			end
		end
	else
		mesh = Unit.mesh(unit, mesh)

		local material = Mesh.material(mesh, material_name)

		Material.set_vector3(material, variable, value)
	end
end

function flow_callback_set_material_property_color(params)
	local unit = params.unit
	local all_meshes = params.all_meshes
	local mesh = params.mesh
	local material_name = params.material
	local variable = params.variable
	local color = params.color

	if all_meshes then
		for i = 0, Unit.num_meshes(unit) - 1 do
			mesh = Unit.mesh(unit, i)

			if Mesh.has_material(mesh, material_name) then
				local material = Mesh.material(mesh, material_name)

				Material.set_color(material, variable, color)
			end
		end
	else
		mesh = Unit.mesh(unit, mesh)

		local material = Mesh.material(mesh, material_name)

		Material.set_color(material, variable, color)
	end
end

function do_material_dissolve(material, timer_var, timer_data, start_state_var, start_state)
	Material.set_scalar(material, start_state_var, start_state)
	Material.set_vector2(material, timer_var, timer_data)
end

function flow_callback_set_material_property_scalar_all(params)
	local unit = params.unit
	local variable = params.variable
	local value = params.value
	local index_offset = Script.index_offset()
	local end_offset = 1 - index_offset
	local num_meshes = Unit.num_meshes(unit)

	for i = index_offset, num_meshes - end_offset do
		local mesh = Unit.mesh(unit, i)
		local num_materials = Mesh.num_materials(mesh)

		for j = index_offset, num_materials - end_offset do
			local material = Mesh.material(mesh, j)

			Material.set_scalar(material, variable, value)
		end
	end
end

function flow_callback_material_scalar_set_chr_inventory(params)
	assert(params.unit, "[flow_callback_material_scalar_set_chr_inventory] You need to specify the Unit")
	assert(params.variable, "[flow_callback_material_scalar_set_chr_inventory] You need to specify variable value")
	assert(params.value, "[flow_callback_material_scalar_set_chr_inventory] You need to specify variable name")

	local unit = params.unit
	local items = {}

	for _, v in ipairs({
		"outfit",
		"stump",
		"helmet",
		"other",
	}) do
		items = Unit.get_data(unit, v .. "_items") or {}

		for i = 1, #items do
			params.unit = items[i]

			flow_callback_set_material_property_scalar_all(params)
		end
	end
end

function flow_callback_material_dissolve(params)
	assert(params.unit, "[flow_callback_material_dissolve] You need to specify the Unit")
	assert(params.duration, "[flow_callback_material_dissolve] You need to specify duration")

	local timer_var = params.timer_var_name or "dissolve_timer"
	local start_time = World.time(Application.main_world())
	local timer_data = Vector2(start_time, start_time + params.duration)
	local start_state_var = params.dissolve_start_state_var_name or "dissolve_start_value"
	local start_state = math.floor(0.5 + params.dissolve_start_state or 1)
	local unit = params.unit
	local index_offset = Script.index_offset()
	local mesh
	local mesh_name = params.mesh_name

	if mesh_name then
		fassert(Unit.has_mesh(unit, mesh_name), string.format("[flow_callback_material_dissolve] The mesh %s doesn't exist in unit %s", mesh_name, tostring(unit)))

		mesh = Unit.mesh(unit, mesh_name)
	end

	local material
	local material_name = params.material_name

	if mesh and material_name then
		fassert(Mesh.has_material(mesh, material_name), string.format("[flow_callback_material_dissolve] The material %s doesn't exist for mesh %s", mesh_name, material_name))

		material = Mesh.material(mesh, material_name)
	end

	if mesh and material then
		do_material_dissolve(material, timer_var, timer_data, start_state_var, start_state)
	elseif mesh then
		local num_materials = Mesh.num_materials(mesh)

		for i = 0, num_materials - 1 do
			do_material_dissolve(Mesh.material(mesh, i + index_offset), timer_var, timer_data, start_state_var, start_state)
		end
	elseif material_name then
		local num_meshes = Unit.num_meshes(unit)

		for i = 0, num_meshes - 1 do
			local unit_mesh = Unit.mesh(unit, i + index_offset)

			if Mesh.has_material(unit_mesh, material_name) then
				do_material_dissolve(Mesh.material(unit_mesh, material_name), timer_var, timer_data, start_state_var, start_state)
			end
		end
	else
		local num_meshes = Unit.num_meshes(unit)

		for i = 0, num_meshes - 1 do
			local unit_mesh = Unit.mesh(unit, i + index_offset)
			local num_materials = Mesh.num_materials(unit_mesh)

			for j = 0, num_materials - 1 do
				do_material_dissolve(Mesh.material(unit_mesh, j + index_offset), timer_var, timer_data, start_state_var, start_state)
			end
		end
	end
end

function flow_callback_material_dissolve_chr(params)
	assert(params.unit, "[flow_callback_material_dissolve_chr] You need to specify the Unit")
	assert(params.duration, "[flow_callback_material_dissolve_chr] You need to specify duration")
	flow_callback_material_dissolve(params)

	local unit = params.unit
	local items = {}

	for _, v in ipairs({
		"outfit",
		"stump",
		"helmet",
	}) do
		items = Unit.get_data(unit, v .. "_items") or {}

		for i = 1, #items do
			params.unit = items[i]

			flow_callback_material_dissolve(params)
		end
	end
end

function flow_callback_material_dissolve_chr_inventory(params)
	assert(params.unit, "[flow_callback_material_dissolve_chr_outfit] You need to specify the Unit")
	assert(params.duration, "[flow_callback_material_dissolve_chr_outfit] You need to specify duration")
	assert(params.inventory_type, "[flow_callback_material_dissolve_chr_inventory] You need to specify inventory type")

	local unit = params.unit
	local inventory_items = {}

	if params.inventory_type == "weapon" then
		inventory_items = Unit.get_data(unit, "other_items") or {}
	else
		inventory_items = Unit.get_data(unit, params.inventory_type .. "_items") or {}
	end

	for i = 1, #inventory_items do
		params.unit = inventory_items[i]

		flow_callback_material_dissolve(params)
	end
end

function do_material_fade(material, timer_var, timer_data, fade_range_var, fade_interval)
	Material.set_vector2(material, fade_range_var, fade_interval)
	Material.set_vector2(material, timer_var, timer_data)
end

function flow_callback_material_fade(params)
	assert(params.unit, "[flow_callback_material_fade] You need to specify the Unit")
	assert(params.duration, "[flow_callback_material_fade] You need to specify duration")

	local timer_var = params.timer_var_name or "fade_timer"
	local start_time = World.time(Application.main_world())
	local timer_data = Vector2(start_time, start_time + params.duration)
	local fade_range_var = params.fade_range_var_name or "fade_interval"
	local fade_interval = Vector2(params.fade_range_from or 1, params.fade_range_to or 0)
	local unit = params.unit
	local index_offset = Script.index_offset()
	local mesh
	local mesh_name = params.mesh_name

	if mesh_name then
		fassert(Unit.has_mesh(unit, mesh_name), string.format("[flow_callback_material_fade] The mesh %s doesn't exist in unit %s", mesh_name, tostring(unit)))

		mesh = Unit.mesh(unit, mesh_name)
	end

	local material
	local material_name = params.material_name

	if mesh and material_name then
		fassert(Mesh.has_material(mesh, material_name), string.format("[flow_callback_material_fade] The material %s doesn't exist for mesh %s", mesh_name, material_name))

		material = Mesh.material(mesh, material_name)
	end

	if mesh and material then
		do_material_fade(material, timer_var, timer_data, fade_range_var, fade_interval)
	elseif mesh then
		local num_materials = Mesh.num_materials(mesh)

		for i = 0, num_materials - 1 do
			do_material_fade(Mesh.material(mesh, i + index_offset), timer_var, timer_data, fade_range_var, fade_interval)
		end
	elseif material_name then
		local num_meshes = Unit.num_meshes(unit)

		for i = 0, num_meshes - 1 do
			local unit_mesh = Unit.mesh(unit, i + index_offset)

			if Mesh.has_material(unit_mesh, material_name) then
				do_material_fade(Mesh.material(unit_mesh, material_name), timer_var, timer_data, fade_range_var, fade_interval)
			end
		end
	else
		local num_meshes = Unit.num_meshes(unit)

		for i = 0, num_meshes - 1 do
			local unit_mesh = Unit.mesh(unit, i + index_offset)
			local num_materials = Mesh.num_materials(unit_mesh)

			for j = 0, num_materials - 1 do
				do_material_fade(Mesh.material(unit_mesh, j + index_offset), timer_var, timer_data, fade_range_var, fade_interval)
			end
		end
	end
end

function flow_callback_material_fade_chr(params)
	assert(params.unit, "[flow_callback_material_fade_chr] You need to specify the Unit")
	assert(params.duration, "[flow_callback_material_fade_chr] You need to specify duration")
	flow_callback_material_fade(params)

	local unit = params.unit
	local items = {}

	for _, v in ipairs({
		"outfit",
		"stump",
		"helmet",
	}) do
		items = Unit.get_data(unit, v .. "_items") or {}

		for i = 1, #items do
			params.unit = items[i]

			flow_callback_material_fade(params)
		end
	end
end

function flow_callback_material_fade_chr_inventory(params)
	assert(params.unit, "[flow_callback_material_fade_chr_inventory] You need to specify the Unit")
	assert(params.duration, "[flow_callback_material_fade_chr_inventory] You need to specify duration")
	assert(params.inventory_type, "[flow_callback_material_fade_chr_inventory] You need to specify inventory type")

	local unit = params.unit
	local inventory_items = {}

	if params.inventory_type == "weapon" then
		inventory_items = Unit.get_data(unit, "other_items") or {}
	else
		inventory_items = Unit.get_data(unit, params.inventory_type .. "_items") or {}
	end

	for i = 1, #inventory_items do
		params.unit = inventory_items[i]

		flow_callback_material_fade(params)
	end
end

function flow_callback_visibility_chr_inventory(params)
	assert(params.unit, "[flow_callback_visibility_chr_inventory] You need to specify the Unit")

	local parent_unit = params.unit
	local visibility = params.visibility
	local items = {}

	for _, v in ipairs({
		"outfit",
		"stump",
		"helmet",
		"other",
	}) do
		items = Unit.get_data(parent_unit, v .. "_items") or {}

		for i = 1, #items do
			Unit.set_unit_visibility(items[i], visibility)
		end
	end
end

function start_material_fade(material, fade_switch_name, fade_switch, start_end_time_name, fade_duration, start_fade_name, start_fade_value, end_fade_name, end_fade_value)
	if start_fade_name and start_fade_value then
		Material.set_scalar(material, start_fade_name, start_fade_value)
	end

	if end_fade_name and end_fade_value then
		Material.set_scalar(material, end_fade_name, end_fade_value)
	end

	Material.set_scalar(material, fade_switch_name, fade_switch)
	Material.set_vector2(material, start_end_time_name, fade_duration)
end

function flow_callback_start_fade(params)
	assert(params.unit, "[flow_callback_start_fade] You need to specify the Unit")
	assert(params.duration, "[flow_callback_start_fade] You need to specify duration")
	assert(params.fade_switch, "[flow_callback_start_fade] You need to specify whether to fade in or out (0 or 1)")

	local start_time = World.time(Application.main_world())
	local fade_duration = Vector2(start_time, start_time + params.duration)
	local fade_switch = math.floor(params.fade_switch + 0.5)
	local fade_switch_name = params.fade_switch_name or "fade_switch"
	local start_end_time_name = params.start_end_time_name or "start_end_time"
	local unit = params.unit
	local index_offset = Script.index_offset()
	local mesh
	local mesh_name = params.mesh_name
	local start_fade_name = params.start_fade_value_name or nil
	local start_fade_value = params.start_fade_value or nil
	local end_fade_name = params.end_fade_value_name or nil
	local end_fade_value = params.end_fade_value or nil

	if mesh_name then
		assert(Unit.has_mesh(unit, mesh_name), string.format("[flow_callback_start_fade] The mesh %s doesn't exist in unit %s", mesh_name, tostring(unit)))

		mesh = Unit.mesh(unit, mesh_name)
	end

	local material
	local material_name = params.material_name

	if mesh and material_name then
		assert(Mesh.has_material(mesh, material_name), string.format("[flow_callback_start_fade] The material %s doesn't exist for mesh %s", mesh_name, material_name))

		material = Mesh.material(mesh, material_name)
	end

	if mesh and material then
		start_material_fade(material, fade_switch_name, fade_switch, start_end_time_name, fade_duration, start_fade_name, start_fade_value, end_fade_name, end_fade_value)
	elseif mesh then
		local num_materials = Mesh.num_materials(mesh)

		for i = 0, num_materials - 1 do
			local material = Mesh.material(mesh, i + index_offset)

			start_material_fade(material, fade_switch_name, fade_switch, start_end_time_name, fade_duration, start_fade_name, start_fade_value, end_fade_name, end_fade_value)
		end
	elseif material_name then
		local num_meshes = Unit.num_meshes(unit)

		for i = 0, num_meshes - 1 do
			local mesh = Unit.mesh(unit, i + index_offset)

			if Mesh.has_material(mesh, material_name) then
				local material = Mesh.material(mesh, material_name)

				start_material_fade(material, fade_switch_name, fade_switch, start_end_time_name, fade_duration, start_fade_name, start_fade_value, end_fade_name, end_fade_value)
			end
		end
	else
		local num_meshes = Unit.num_meshes(unit)

		for i = 0, num_meshes - 1 do
			local mesh = Unit.mesh(unit, i + index_offset)
			local num_materials = Mesh.num_materials(mesh)

			for j = 0, num_materials - 1 do
				local material = Mesh.material(mesh, j + index_offset)

				start_material_fade(material, fade_switch_name, fade_switch, start_end_time_name, fade_duration, start_fade_name, start_fade_value, end_fade_name, end_fade_value)
			end
		end
	end
end

function flow_callback_chr_editor_inventory_spawn(params)
	local unit = params.unit
	local world = Unit.world(unit)
	local unwielded = params.unwield
	local inventory_configuration = InventoryConfigurations[params.inventory_config]

	if inventory_configuration ~= nil then
		local outfit_items = Unit.get_data(unit, "outfit_items") or {}
		local helmet_items = Unit.get_data(unit, "helmet_items") or {}
		local other_items = Unit.get_data(unit, "other_items") or {}

		for i = 1, #inventory_configuration.items do
			local item = inventory_configuration.items[i][math.random(1, inventory_configuration.items[i].count)]
			local item_node_linking = item.attachment_node_linking
			local item_flow_event = item.flow_event or nil
			local node_linking_data = item_node_linking.wielded or item_node_linking

			if unwielded then
				node_linking_data = item_node_linking.unwielded or item_node_linking
			end

			local item_position, item_rotation

			for _, data in ipairs(node_linking_data) do
				if data.target == 0 then
					local source_node = data.source
					local source_node_index = type(source_node) == "string" and Unit.node(unit, source_node) or source_node + 1

					item_position = Unit.world_position(unit, source_node_index)
					item_rotation = Unit.world_rotation(unit, source_node_index)

					break
				end
			end

			if item_flow_event then
				Unit.flow_event(unit, item_flow_event)
			end

			local item_unit = World.spawn_unit(world, item.unit_name, item_position, item_rotation)

			link_attachment(node_linking_data, world, item_unit, unit)
			Unit.set_data(item_unit, "node_linking_data", node_linking_data)

			if Unit.has_animation_state_machine(item_unit) and Unit.has_animation_event(item_unit, "linked") then
				Unit.animation_event(item_unit, "linked")
			end

			local item_unit_template_name = item.unit_extension_template or "ai_inventory_item"

			if item_unit_template_name == "ai_helmet_unit" then
				table.insert(helmet_items, item_unit)
			elseif item_unit_template_name == "ai_outfit_unit" then
				table.insert(outfit_items, item_unit)
			else
				table.insert(other_items, item_unit)
			end
		end

		if unwielded ~= true then
			local anim_state_event = inventory_configuration.anim_state_event

			if anim_state_event and Unit.has_animation_event(unit, anim_state_event) then
				Unit.animation_event(unit, anim_state_event)
			end
		end

		Unit.set_data(unit, "outfit_items", outfit_items)
		Unit.set_data(unit, "helmet_items", helmet_items)
		Unit.set_data(unit, "other_items", other_items)
	end

	return {
		spawned = true,
	}
end

function flow_callback_chr_editor_inventory_unspawn(params)
	local unit = params.unit
	local world = Unit.world(unit)
	local outfit_items = Unit.get_data(unit, "outfit_items") or {}
	local helmet_items = Unit.get_data(unit, "helmet_items") or {}
	local other_items = Unit.get_data(unit, "other_items") or {}

	for i = 1, #outfit_items do
		World.destroy_unit(world, outfit_items[i])
	end

	for i = 1, #helmet_items do
		World.destroy_unit(world, helmet_items[i])
	end

	for i = 1, #other_items do
		World.destroy_unit(world, other_items[i])
	end

	Unit.set_data(unit, "outfit_items", {})
	Unit.set_data(unit, "helmet_items", {})
	Unit.set_data(unit, "other_items", {})

	return {
		unspawned = true,
	}
end

function flow_callback_chr_editor_inventory_drop(params)
	local unit = params.unit
	local world = Unit.world(unit)
	local other_items = Unit.get_data(unit, "other_items") or {}

	for i = 1, #other_items do
		local item_unit = other_items[i]
		local node_linking_data = Unit.get_data(item_unit, "node_linking_data") or {}

		if node_linking_data then
			unlink_attachment(node_linking_data, world, item_unit)
			Unit.flow_event(item_unit, "lua_dropped")

			local actor = Unit.create_actor(item_unit, "rp_dropped")

			Actor.add_angular_velocity(actor, Vector3(math.random(), math.random(), math.random()) * 5)
			Actor.add_velocity(actor, optional_drop_direction or Vector3(2 * math.random() - 0.5, 2 * math.random() - 0.5, 4.5))
		end
	end

	return {
		dropped = true,
	}
end

function flow_callback_chr_enemy_inventory_send_event(params)
	assert(params.unit, "[flow_callback_chr_enemy_inventory_send_event] You need to specify the Unit")
	assert(params.event, "[flow_callback_chr_enemy_inventory_send_event] You need to specify an event name")

	local unit = params.unit
	local event = params.event
	local outfit_items = Unit.get_data(unit, "outfit_items") or {}

	for i = 1, #outfit_items do
		Unit.flow_event(outfit_items[i], event)
	end

	local helmet_items = Unit.get_data(unit, "helmet_items") or {}

	for i = 1, #helmet_items do
		Unit.flow_event(helmet_items[i], event)
	end

	local stump_items = Unit.get_data(unit, "stump_items") or {}

	for i = 1, #stump_items do
		Unit.flow_event(stump_items[i], event)
	end

	local other_items = Unit.get_data(unit, "other_items") or {}

	for i = 1, #other_items do
		Unit.flow_event(other_items[i], event)
	end
end

function flow_callback_is_character_alive(params)
	return {
		out_value = true,
	}
end

function flow_callback_set_unit_light_state(params)
	local unit = params.unit
	local state = params.state
	local all_lights = params.all_lights

	if all_lights then
		local num_lights = Unit.num_lights(unit)

		if num_lights then
			for i = 1, num_lights do
				local light = Unit.light(unit, i - 1)

				Light.set_enabled(light, state)
			end
		else
			print("No Lights in unit")
		end
	else
		local light = params.light

		if light then
			local light = Unit.light(unit, light)

			Light.set_enabled(light, state)
		else
			print("No light named ", light, " in scene")
		end
	end
end

function flow_callback_set_unit_light_color(params)
	local unit = params.unit
	local color = params.color
	local all_lights = params.all_lights

	if all_lights then
		local num_lights = Unit.num_lights(unit)

		if num_lights then
			for i = 1, num_lights do
				local light = Unit.light(unit, i - 1)

				Light.set_color(light, color)
			end
		else
			print("No Lights in unit")
		end
	else
		local light = params.light

		if light then
			local light = Unit.light(unit, light)

			Light.set_color(light, color)
		else
			print("No light named ", light, " in scene")
		end
	end
end

function flow_callback_debug_print(params)
	local print_string

	if params.prefix then
		print_string = string.format("[flow:%s]", params.prefix)
	else
		print_string = "[flow]"
	end

	if params.unit then
		print_string = print_string .. string.format(" unit=%q", tostring(params.unit))
	end

	if params.actor then
		print_string = print_string .. string.format(" actor=%q", tostring(params.actor))
	end

	if params.bool then
		print_string = print_string .. string.format(" bool=%q", tostring(params.bool))
	end

	if params.string then
		print_string = print_string .. string.format(" string=%q", params.string)
	end

	if params.mover then
		print_string = print_string .. string.format(" mover=%q", tostring(params.mover))
	end

	if params.vector3 then
		print_string = print_string .. string.format(" vector3=%q", tostring(params.vector3))
	end

	if params.quaternion then
		print_string = print_string .. string.format(" quaternion=%q", tostring(params.quaternion))
	end

	if params.float then
		print_string = print_string .. string.format(" float=%f", params.float)
	end

	print(print_string)
end

function flow_callback_link_objects_in_units(params)
	local parentunit = params.parent_unit
	local childunit = params.child_unit
	local parentnodes = split(params.parent_nodes, ";")
	local childnodes = split(params.child_nodes, ";")
	local world = Unit.world(parentunit)

	for i = 1, #parentnodes - 1 do
		local parentnodeindex = Unit.node(parentunit, parentnodes[i])
		local childnode = childnodes[i]
		local childnodeindex

		if string.find(string.lower(childnode), "index(.)") then
			childnodeindex = tonumber(string.match(childnode, "%d+"))
		else
			childnodeindex = Unit.node(childunit, childnode)
		end

		World.link_unit(world, childunit, childnodeindex, parentunit, parentnodeindex)

		if params.parent_lod_object and params.child_lod_object and Unit.has_lod_object(parentunit, params.parent_lod_object) and Unit.has_lod_object(childunit, params.child_lod_object) then
			local parent_lod_object = Unit.lod_object(parentunit, params.parent_lod_object)
			local child_lod_object = Unit.lod_object(childunit, params.child_lod_object)

			LODObject.set_bounding_volume(child_lod_object, LODObject.bounding_volume(parent_lod_object))
			World.link_unit(world, childunit, LODObject.node(child_lod_object), parentunit, LODObject.node(parent_lod_object))
		end
	end
end

function flow_callback_get_local_transform(params)
	local node = params.node
	local unit = params.unit
	local nodeindex

	if string.find(string.lower(node), "index(.)") then
		nodeindex = tonumber(string.match(node, "%d+"))
	else
		nodeindex = Unit.node(unit, node)
	end

	return {
		position = Unit.local_position(unit, nodeindex),
		rotation = Unit.local_rotation(unit, nodeindex),
		scale = Unit.local_scale(unit, nodeindex),
	}
end

function flow_callback_get_world_transform(params)
	local node = params.node
	local unit = params.unit
	local nodeindex

	if string.find(string.lower(node), "index(.)") then
		nodeindex = tonumber(string.match(node, "%d+"))
	else
		nodeindex = Unit.node(unit, node)
	end

	return {
		position = Unit.world_position(unit, nodeindex),
		rotation = Unit.world_rotation(unit, nodeindex),
	}
end

function flow_callback_set_local_scale(params)
	local node_index = Unit.node(params.unit, params.node)

	Unit.set_local_scale(params.unit, node_index, params.scale)
end

function flow_callback_render_cubemap(params)
	local unit = params.unit
	local path = params.path
	local unitPosition = Unit.world_position(unit, 0)

	LevelEditor.cubemap_generator:create(unitPosition, LevelEditor.shading_environment, path)
	Application.console_command("reload", "texture")
end

function flow_callback_store_parent(params)
	local parentunit = params.parent_unit
	local childunit = params.child_unit

	Unit.set_data(childunit, "parent_ref", parentunit)
end

function flow_callback_stored_parent(params)
	local childunit = params.child_unit
	local parent = Unit.get_data(childunit, "parent_ref")
	local returns = {
		parent_unit = parent,
	}

	return returns
end

function flow_callback_set_unit_enabled(params)
	if params.enabled then
		Unit.set_unit_visibility(params.unit, true)
		Unit.enable_physics(params.unit)
		Unit.enable_animation_state_machine(params.unit)
	else
		Unit.set_unit_visibility(params.unit, false)
		Unit.disable_physics(params.unit)

		if Unit.has_animation_state_machine(params.unit) then
			Unit.disable_animation_state_machine(params.unit)
		end
	end
end

function flow_callback_set_unit_physics(params)
	if params.physics then
		Unit.enable_physics(params.unit)
	else
		Unit.disable_physics(params.unit)
	end
end

function flow_callback_disable_animation_state_machine(params)
	Unit.disable_animation_state_machine(params.unit)
end

function flow_callback_play_voice(params)
	return
end

function flow_callback_relay_trigger(params)
	return {
		out = true,
	}
end

function flow_callback_set_shading_environment_scalar(params)
	if GameSettingsDevelopment then
		return
	end

	local variable = params.variable
	local value = params.value

	LevelEditor.camera_env_control = true

	local shadingenvironment = LevelEditor.shading_environment

	ShadingEnvironment.set_scalar(shadingenvironment, variable, value)
	ShadingEnvironment.apply(shadingenvironment)
end

function split(text, sep)
	sep = sep or "\n"

	local lines = {}
	local pos = 1

	while true do
		local b, e = text:find(sep, pos)

		if not b then
			table.insert(lines, text:sub(pos))

			break
		end

		table.insert(lines, text:sub(pos, b - 1))

		pos = e + 1
	end

	return lines
end

function link_attachment(attachment_node_link, world, target, source)
	local index_offset = Script.index_offset()

	for i, attachment_nodes in ipairs(attachment_node_link) do
		local source_node = attachment_nodes.source
		local target_node = attachment_nodes.target
		local source_node_index = type(source_node) == "string" and Unit.node(source, source_node) or source_node + 1
		local target_node_index = type(target_node) == "string" and Unit.node(target, target_node) or target_node + 1

		World.link_unit(world, target, target_node_index, source, source_node_index)

		if Unit.num_lod_objects(source) ~= 0 and Unit.num_lod_objects(target) ~= 0 then
			local owner_lod_object = Unit.lod_object(source, index_offset)
			local attachment_lod_object = Unit.lod_object(target, index_offset)

			LODObject.set_bounding_volume(attachment_lod_object, LODObject.bounding_volume(owner_lod_object))
			World.link_unit(world, target, LODObject.node(attachment_lod_object), source, LODObject.node(owner_lod_object))
		end
	end
end

function unlink_attachment(attachment_node_link, world, target)
	World.unlink_unit(world, target)

	local node_linking_data = attachment_node_link.wielded or attachment_node_link

	for _, attachment_nodes in ipairs(node_linking_data) do
		local target_node = attachment_nodes.target
		local target_node_index = type(target_node) == "string" and Unit.node(target, target_node) or target_node + 1

		if target_node_index > 1 then
			Unit.scene_graph_link(target, target_node_index, 1)
		end
	end
end

function flow_callback_wwise_trigger_event_with_environment()
	return
end

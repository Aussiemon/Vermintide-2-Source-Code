SimpleHuskInventoryExtension = class(SimpleHuskInventoryExtension)

SimpleHuskInventoryExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._world = extension_init_context.world
	self._game_object_id = extension_init_data.id
	self._game = extension_init_data.game
	self._unit = unit
	self._equipment = {
		slots = {}
	}
	self._attached_units = {}
	self._slot_buffs = {
		slot_ranged = {},
		slot_melee = {}
	}
	self.current_item_buffs = {}
	self._show_third_person = true
end

SimpleHuskInventoryExtension.ammo_percentage = function (self)
	if GameSession.game_object_exists(self._game, self._game_object_id) then
		local ammo_percentage = GameSession.game_object_field(self._game, self._game_object_id, "ammo_percentage")

		return ammo_percentage
	end
end

SimpleHuskInventoryExtension.destroy = function (self)
	if Managers.player.is_server then
		for slot_name, slot_data in pairs(self._equipment.slots) do
			if slot_data.limited_item_data then
				self:evaluate_limited_item_state(slot_data)
			elseif slot_name == "slot_level_event" then
				self:drop_level_event_item(slot_data)
			end
		end
	end

	GearUtils.destroy_equipment(self._world, self._equipment)
	self:_despawn_attached_units()
end

SimpleHuskInventoryExtension.get_weapon_unit = function (self)
	local equipment = self._equipment
	local weapon_unit = equipment.left_hand_wielded_unit_3p or equipment.right_hand_wielded_unit_3p

	return weapon_unit
end

SimpleHuskInventoryExtension.get_all_weapon_unit = function (self)
	local equipment = self._equipment

	return equipment.left_hand_wielded_unit_3p, equipment.right_hand_wielded_unit_3p
end

SimpleHuskInventoryExtension.drop_level_event_item = function (self, slot_data)
	local item_template = self:get_item_template(slot_data)

	if item_template.no_drop then
		return
	end

	local action = item_template.actions.action_dropped.default
	local projectile_info = action.projectile_info

	if projectile_info.drop_on_player_destroyed then
		local unit = self._unit
		local weapon_unit = self._equipment.right_hand_wielded_unit_3p or self._equipment.left_hand_wielded_unit_3p
		local position = Unit.world_position(unit, 0) + Vector3(0, 0, 2)
		local proj_rotation = Quaternion.identity()
		local velocity = Vector3(math.random(), math.random(), math.random())
		local angular_velocity_transformed = Vector3(math.random(), math.random(), math.random())
		local item_data = slot_data.item_data
		local item_name = item_data.name
		local spawn_type = "dropped"

		ActionUtils.spawn_pickup_projectile(self._world, weapon_unit, projectile_info.projectile_unit_name, projectile_info.projectile_unit_template_name, action, unit, position, proj_rotation, velocity, angular_velocity_transformed, item_name, spawn_type)
	end

	self:destroy_slot("slot_level_event")
end

SimpleHuskInventoryExtension._unlink_unit = function (self, unit, reason, attachment_node_linking)
	World.unlink_unit(self._world, unit)

	local node_linking_data = attachment_node_linking.wielded or attachment_node_linking

	for i, attachment_nodes in ipairs(node_linking_data) do
		local target_node = attachment_nodes.target

		if target_node ~= 0 then
			local target_node_index = (type(target_node) == "string" and Unit.node(unit, target_node)) or target_node
			local parent = Unit.scene_graph_parent(unit, target_node_index)

			Unit.scene_graph_link(unit, target_node_index, 0)
			Unit.set_local_pose(unit, target_node_index, Matrix4x4.identity())
		end
	end

	Unit.set_flow_variable(unit, "lua_drop_reason", reason)
	Unit.set_shader_pass_flag_for_meshes_in_unit_and_childs(unit, "outline_unit", false)
	Unit.flow_event(unit, "lua_dropped")

	local actor = Unit.create_actor(unit, "rp_dropped")

	Actor.add_angular_velocity(actor, Vector3(math.random(), math.random(), math.random()) * 40)
	Actor.add_velocity(actor, Vector3(2 * math.random() - 0.5, 2 * math.random() - 0.5, 4.5))
end

SimpleHuskInventoryExtension.drop_equipped_weapons = function (self, reason)
	local equipment = self._equipment
	local wielded = equipment.wielded
	local template_name = wielded.template
	local linking_template = AttachmentNodeLinking[template_name]
	local left_hand_unit_name = wielded.left_hand_unit
	local right_hand_unit_name = wielded.right_hand_unit

	if left_hand_unit_name then
		local attachment_node_linking = (linking_template.left and linking_template.left.third_person) or linking_template.third_person
		local left_hand_unit = equipment.left_hand_wielded_unit_3p

		self:_unlink_unit(left_hand_unit, reason, attachment_node_linking)
	end

	if right_hand_unit_name then
		local attachment_node_linking = (linking_template.right and linking_template.right.third_person) or linking_template.third_person
		local right_hand_unit = equipment.right_hand_wielded_unit_3p

		self:_unlink_unit(right_hand_unit, reason, attachment_node_linking)
	end
end

SimpleHuskInventoryExtension.equipment = function (self)
	return self._equipment
end

SimpleHuskInventoryExtension.add_equipment = function (self, slot_name, item_name, skin_name)
	local item_data = ItemMasterList[item_name]
	local slot_buffs = self._slot_buffs[slot_name]

	if slot_buffs then
		table.clear(slot_buffs)
	end

	if item_data.slot_to_use then
		local other_slot_slot_data = self._equipment.slots[item_data.slot_to_use]
		local item_units = BackendUtils.get_item_units(item_data)
		local other_slot_item_units = BackendUtils.get_item_units(other_slot_slot_data.item_data, nil, other_slot_slot_data.skin)
		skin_name = nil

		for key, _ in pairs(item_data.item_units_to_replace) do
			if other_slot_item_units[key] then
				item_data[key] = other_slot_item_units[key]
			else
				item_data[key] = item_units[key]
			end
		end
	end

	self._equipment.slots[slot_name] = {
		item_data = item_data,
		id = slot_name,
		skin = skin_name
	}
end

SimpleHuskInventoryExtension.add_equipment_limited_item = function (self, slot_name, item_name, spawner_unit, limited_item_id)
	local item_data = ItemMasterList[item_name]
	self._equipment.slots[slot_name] = {
		item_data = item_data,
		id = slot_name,
		limited_item_data = {
			spawner_unit = spawner_unit,
			id = limited_item_id
		}
	}
end

SimpleHuskInventoryExtension.destroy_slot = function (self, slot_name)
	local equipment = self._equipment
	local slot_data = equipment.slots[slot_name]

	if slot_data == nil then
		return
	end

	if Managers.player.is_server and slot_data.limited_item_data then
		self:evaluate_limited_item_state(slot_data)
	end

	GearUtils.destroy_slot(self._world, self._unit, slot_data, equipment, true)
end

SimpleHuskInventoryExtension.evaluate_limited_item_state = function (self, slot_data)
	local limited_item_data = slot_data.limited_item_data
	local spawner_unit = limited_item_data.spawner_unit
	local limited_item_spawner_extension = ScriptUnit.extension(spawner_unit, "limited_item_track_system")
	local limited_item_id = limited_item_data.id

	if limited_item_spawner_extension:is_transformed(limited_item_id) then
		local limited_item_track_system = Managers.state.entity:system("limited_item_track_system")

		limited_item_track_system:held_limited_item_destroyed(spawner_unit, limited_item_id)
	end
end

SimpleHuskInventoryExtension._setup_equipment = function (self, world, unit_3p, profile)
	local equipment = {
		slots = {}
	}

	return equipment
end

SimpleHuskInventoryExtension.update = function (self)
	return
end

local new_linked_units = {}

SimpleHuskInventoryExtension._reapply_fade = function (self, equipment)
	table.clear(new_linked_units)

	if equipment.right_hand_wielded_unit_3p then
		new_linked_units[#new_linked_units + 1] = equipment.right_hand_wielded_unit_3p
	end

	if equipment.right_hand_ammo_unit_3p then
		new_linked_units[#new_linked_units + 1] = equipment.right_hand_ammo_unit_3p
	end

	if equipment.left_hand_wielded_unit_3p then
		new_linked_units[#new_linked_units + 1] = equipment.left_hand_wielded_unit_3p
	end

	if equipment.left_hand_ammo_unit_3p then
		new_linked_units[#new_linked_units + 1] = equipment.left_hand_ammo_unit_3p
	end

	Managers.state.entity:system("fade_system"):new_linked_units(self._unit, new_linked_units)
end

SimpleHuskInventoryExtension.wield = function (self, slot_name)
	local equipment = self._equipment

	self:_despawn_attached_units()
	self:_wield_slot(self._world, equipment, slot_name, nil, self._unit)

	self.wielded_slot = slot_name

	if slot_name then
		local slot_data = equipment.slots[slot_name]

		if slot_data then
			local item_template = self:get_item_template(slot_data)

			self:_spawn_attached_units(item_template.third_person_attached_units)

			if ScriptUnit.has_extension(self._unit, "outline_system") then
				local outline_extension = ScriptUnit.extension(self._unit, "outline_system")

				outline_extension:reapply_outline()
			end

			self:_reapply_fade(equipment)

			local slot_buffs = self._slot_buffs[slot_name]

			if Managers.player.is_server and slot_buffs then
				self:_apply_buffs(slot_buffs)
			end
		end
	end
end

SimpleHuskInventoryExtension._despawn_attached_units = function (self)
	local attached_units = self._attached_units
	local world = self._world

	for index, attached_unit in pairs(attached_units) do
		Managers.state.unit_spawner:mark_for_deletion(attached_unit)

		attached_units[index] = nil
	end
end

SimpleHuskInventoryExtension._spawn_attached_units = function (self, attached_units)
	if attached_units == nil then
		return
	end

	local unit = self._unit
	local world = self._world
	local own_attached_units = self._attached_units

	for index, attached_unit in pairs(attached_units) do
		local spawned_unit = AttachmentUtils.create_weapon_visual_attachment(world, unit, attached_unit.unit, attached_unit.attachment_node_linking)
		own_attached_units[index] = spawned_unit
	end
end

SimpleHuskInventoryExtension.add_buffs_to_slot = function (self, slot_name, buff_name_1, buff_data_type_1, value_1, buff_name_2, buff_data_type_2, value_2, buff_name_3, buff_data_type_3, value_3, buff_name_4, buff_data_type_4, value_4)
	local slot_buffs = self._slot_buffs[slot_name]

	if buff_name_1 ~= "n/a" then
		slot_buffs[buff_name_1] = {
			[buff_data_type_1] = value_1
		}
	end

	if buff_name_2 ~= "n/a" then
		slot_buffs[buff_name_2] = {
			[buff_data_type_2] = value_2
		}
	end

	if buff_name_3 ~= "n/a" then
		slot_buffs[buff_name_3] = {
			[buff_data_type_3] = value_3
		}
	end

	if buff_name_4 ~= "n/a" then
		slot_buffs[buff_name_4] = {
			[buff_data_type_4] = value_4
		}
	end
end

local params = {}

SimpleHuskInventoryExtension._apply_buffs = function (self, buffs)
	local buff_extension = ScriptUnit.extension(self._unit, "buff_system")
	local current_item_buffs = self.current_item_buffs

	for i = 1, #current_item_buffs, 1 do
		local buff_id = current_item_buffs[i]

		buff_extension:remove_buff(buff_id)
	end

	table.clear(current_item_buffs)

	local index = 1

	for buff_name, variable_data in pairs(buffs) do
		table.clear(params)

		for data_type, data_value in pairs(variable_data) do
			params[data_type] = data_value
		end

		current_item_buffs[index] = buff_extension:add_buff(buff_name, params)
		index = index + 1
	end
end

SimpleHuskInventoryExtension.has_inventory_item = function (self, slot_name, item_name)
	local slot_data = self:get_slot_data(slot_name)

	if slot_data then
		local item_data = slot_data.item_data
		local name = item_data.name

		return name == item_name
	end

	return false
end

SimpleHuskInventoryExtension.show_third_person_inventory = function (self, show)
	self._show_third_person = show
	local right_hand_wielded_unit = self._equipment.right_hand_wielded_unit_3p

	if right_hand_wielded_unit then
		if Unit.has_visibility_group(right_hand_wielded_unit, "normal") then
			Unit.set_visibility(right_hand_wielded_unit, "normal", show)
		else
			Unit.set_unit_visibility(right_hand_wielded_unit, show)
		end

		local right_hand_ammo_unit_3p = self._equipment.right_hand_ammo_unit_3p

		if right_hand_ammo_unit_3p then
			Unit.set_unit_visibility(right_hand_ammo_unit_3p, show)
		end

		if show then
			Unit.flow_event(right_hand_wielded_unit, "lua_wield")

			if right_hand_ammo_unit_3p then
				Unit.flow_event(right_hand_ammo_unit_3p, "lua_wield")
			end
		else
			Unit.flow_event(right_hand_wielded_unit, "lua_unwield")

			if right_hand_ammo_unit_3p then
				Unit.flow_event(right_hand_ammo_unit_3p, "lua_unwield")
			end
		end
	end

	local left_hand_wielded_unit = self._equipment.left_hand_wielded_unit_3p

	if left_hand_wielded_unit then
		if Unit.has_visibility_group(left_hand_wielded_unit, "normal") then
			Unit.set_visibility(left_hand_wielded_unit, "normal", show)
		else
			Unit.set_unit_visibility(left_hand_wielded_unit, show)
		end

		local left_hand_ammo_unit_3p = self._equipment.left_hand_ammo_unit_3p

		if left_hand_ammo_unit_3p then
			Unit.set_unit_visibility(left_hand_ammo_unit_3p, show)
		end

		if show then
			Unit.flow_event(left_hand_wielded_unit, "lua_wield")

			if left_hand_ammo_unit_3p then
				Unit.flow_event(left_hand_ammo_unit_3p, "lua_wield")
			end
		else
			Unit.flow_event(left_hand_wielded_unit, "lua_unwield")

			if left_hand_ammo_unit_3p then
				Unit.flow_event(left_hand_ammo_unit_3p, "lua_unwield")
			end
		end
	end

	self:_despawn_attached_units()

	local equipment = self._equipment
	local wielded_slot = self.wielded_slot

	if wielded_slot then
		local slot_data = equipment.slots[wielded_slot]

		if slot_data and show then
			local item_template = self:get_item_template(slot_data)

			self:_spawn_attached_units(item_template.third_person_attached_units)
		end
	end
end

SimpleHuskInventoryExtension.get_item_template = function (self, slot_data)
	local item_data = slot_data.item_data
	local item_template = BackendUtils.get_item_template(item_data)

	return item_template
end

SimpleHuskInventoryExtension.get_wielded_slot_item_template = function (self)
	local wielded_slot_name = self.wielded_slot
	local equipment = self._equipment
	local slot_data = equipment.slots[wielded_slot_name]

	if not slot_data then
		return nil
	end

	local item_template = self:get_item_template(slot_data)

	return item_template
end

SimpleHuskInventoryExtension.hot_join_sync = function (self, sender)
	GearUtils.hot_join_sync(sender, self._unit, self._equipment)
end

SimpleHuskInventoryExtension.get_wielded_slot_name = function (self)
	local equipment = self._equipment
	local wielded_slot = equipment.wielded_slot

	return wielded_slot
end

SimpleHuskInventoryExtension.get_slot_data = function (self, slot_id)
	local equipment = self._equipment
	local slots = equipment.slots

	return slots[slot_id]
end

SimpleHuskInventoryExtension.set_loaded_projectile_override = function (self)
	return
end

SimpleHuskInventoryExtension._override_career_skill_item_template = function (self, item_data)
	local override_item_template = nil
	local slot_to_use = item_data.slot_to_use

	if slot_to_use then
		local equipment = self._equipment
		local slots = equipment.slots
		local override_slot_data = slots[slot_to_use]
		local override_item_template = self:get_item_template(override_slot_data)
		local item_template = BackendUtils.get_item_template(item_data)
		item_template.left_hand_attachment_node_linking = override_item_template.left_hand_attachment_node_linking
		item_template.right_hand_attachment_node_linking = override_item_template.right_hand_attachment_node_linking
		item_template.wield_anim = override_item_template.wield_anim
		item_template.wield_anim_no_ammo = override_item_template.wield_anim_no_ammo
		override_item_template = item_template
	end

	return override_item_template
end

SimpleHuskInventoryExtension._wield_slot = function (self, world, equipment, slot_name, unit_1p, unit_3p)
	local slot = equipment.slots[slot_name]

	if not slot then
		print("Cannot wield item from " .. tostring(slot_name) .. " since this slot does not exist.")

		return
	end

	local item_data = slot.item_data

	if not item_data then
		print("Cannot wield item from " .. tostring(slot_name) .. " since it is empty.")

		return
	end

	GearUtils.destroy_equipment(world, equipment)

	local override_item_template = self:_override_career_skill_item_template(item_data)
	local item_template = override_item_template or BackendUtils.get_item_template(item_data)
	local item_units = BackendUtils.get_item_units(item_data, nil, slot.skin)
	local right_hand_weapon_unit_3p, right_hand_weapon_unit_1p, left_hand_weapon_unit_3p, left_hand_weapon_unit_1p, right_hand_ammo_unit_3p, right_hand_ammo_unit_1p, left_hand_ammo_unit_3p, left_hand_ammo_unit_1p = nil

	if item_units.right_hand_unit then
		right_hand_weapon_unit_3p, right_hand_ammo_unit_3p, right_hand_weapon_unit_1p, right_hand_ammo_unit_1p = GearUtils.spawn_inventory_unit(world, "right", item_template, item_units, slot_name, item_data, unit_1p, unit_3p, nil, nil, nil, item_units.material_settings)
	end

	if item_units.left_hand_unit then
		left_hand_weapon_unit_3p, left_hand_ammo_unit_3p, left_hand_weapon_unit_1p, left_hand_ammo_unit_1p = GearUtils.spawn_inventory_unit(world, "left", item_template, item_units, slot_name, item_data, unit_1p, unit_3p, nil, nil, nil, item_units.material_settings)
	end

	local career_extension = ScriptUnit.extension(unit_3p, "career_system")
	local career_index = career_extension:career_index()

	if Unit.animation_has_variable(unit_3p, "career_index") then
		local variable_index = Unit.animation_find_variable(unit_3p, "career_index")

		Unit.animation_set_variable(unit_3p, variable_index, career_index)
	end

	local item_template = BackendUtils.get_item_template(item_data)
	local wield_anim = item_template.wield_anim

	if right_hand_weapon_unit_3p or left_hand_weapon_unit_3p then
		Unit.flow_event(unit_3p, "lua_wield")
		Unit.animation_event(unit_3p, wield_anim)

		if right_hand_weapon_unit_3p then
			Unit.flow_event(right_hand_weapon_unit_3p, "lua_wield")
		end

		if left_hand_weapon_unit_3p then
			Unit.flow_event(left_hand_weapon_unit_3p, "lua_wield")
		end
	end

	if right_hand_weapon_unit_1p or left_hand_weapon_unit_1p then
		Unit.animation_event(unit_1p, wield_anim)
	end

	if right_hand_weapon_unit_1p then
		Unit.set_unit_visibility(right_hand_weapon_unit_3p, false)

		if right_hand_ammo_unit_1p then
			Unit.set_unit_visibility(right_hand_ammo_unit_3p, false)
		end
	end

	if left_hand_weapon_unit_1p then
		Unit.set_unit_visibility(left_hand_weapon_unit_3p, false)

		if left_hand_ammo_unit_1p then
			Unit.set_unit_visibility(left_hand_ammo_unit_3p, false)
		end
	end

	equipment.right_hand_wielded_unit_3p = right_hand_weapon_unit_3p
	equipment.right_hand_ammo_unit_3p = right_hand_ammo_unit_3p
	equipment.right_hand_wielded_unit = right_hand_weapon_unit_1p
	equipment.right_hand_ammo_unit_1p = right_hand_ammo_unit_1p
	equipment.left_hand_wielded_unit_3p = left_hand_weapon_unit_3p
	equipment.left_hand_ammo_unit_3p = left_hand_ammo_unit_3p
	equipment.left_hand_wielded_unit = left_hand_weapon_unit_1p
	equipment.left_hand_ammo_unit_1p = left_hand_ammo_unit_1p
	equipment.wielded = item_data
	equipment.wielded_slot = slot_name
	local blackboard = BLACKBOARDS[self._unit]

	if not blackboard.weapon_unit then
		blackboard.weapon_unit = self:get_weapon_unit()
	end

	return item_data
end

SimpleHuskInventoryExtension.is_showing_third_person_inventory = function (self)
	return self._show_third_person
end

return

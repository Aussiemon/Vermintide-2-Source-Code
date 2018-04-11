SimpleHuskInventoryExtension = class(SimpleHuskInventoryExtension)
SimpleHuskInventoryExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._world = extension_init_context.world
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
	self._show_third_person = false

	return 
end
SimpleHuskInventoryExtension.destroy = function (self)
	if Managers.player.is_server then
		for slot_name, slot_data in pairs(self._equipment.slots) do
			if slot_data.limited_item_data then
				self.evaluate_limited_item_state(self, slot_data)
			elseif slot_name == "slot_level_event" then
				self.drop_level_event_item(self, slot_data)
			end
		end
	end

	GearUtils.destroy_equipment(self._world, self._equipment)
	self._despawn_attached_units(self)

	return 
end
SimpleHuskInventoryExtension.drop_level_event_item = function (self, slot_data)
	local item_template = self.get_item_template(self, slot_data)
	local action = item_template.actions.action_one.default
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

	self.destroy_slot(self, "slot_level_event")

	return 
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
		local override_slot_data = self._equipment.slots[item_data.slot_to_use]
		local override_item_data = override_slot_data.item_data
		item_data.left_hand_unit = override_item_data.left_hand_unit
		item_data.right_hand_unit = override_item_data.right_hand_unit
	end

	self._equipment.slots[slot_name] = {
		item_data = item_data,
		id = slot_name,
		skin = skin_name
	}

	return 
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

	return 
end
SimpleHuskInventoryExtension.destroy_slot = function (self, slot_name)
	local equipment = self._equipment
	local slot_data = equipment.slots[slot_name]

	if slot_data == nil then
		return 
	end

	if Managers.player.is_server and slot_data.limited_item_data then
		self.evaluate_limited_item_state(self, slot_data)
	end

	GearUtils.destroy_slot(self._world, self._unit, slot_data, equipment, true)

	return 
end
SimpleHuskInventoryExtension.evaluate_limited_item_state = function (self, slot_data)
	local limited_item_data = slot_data.limited_item_data
	local spawner_unit = limited_item_data.spawner_unit
	local limited_item_spawner_extension = ScriptUnit.extension(spawner_unit, "limited_item_track_system")
	local limited_item_id = limited_item_data.id

	if limited_item_spawner_extension.is_transformed(limited_item_spawner_extension, limited_item_id) then
		local limited_item_track_system = Managers.state.entity:system("limited_item_track_system")

		limited_item_track_system.held_limited_item_destroyed(limited_item_track_system, spawner_unit, limited_item_id)
	end

	return 
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
SimpleHuskInventoryExtension.wield = function (self, slot_name)
	local equipment = self._equipment

	self._despawn_attached_units(self)
	self._wield_slot(self, self._world, equipment, slot_name, nil, self._unit)

	self.wielded_slot = slot_name

	if slot_name then
		local slot_data = equipment.slots[slot_name]

		if slot_data then
			local item_template = self.get_item_template(self, slot_data)

			self._spawn_attached_units(self, item_template.third_person_attached_units)

			if ScriptUnit.has_extension(self._unit, "outline_system") then
				local outline_extension = ScriptUnit.extension(self._unit, "outline_system")

				outline_extension.reapply_outline(outline_extension)
			end

			local slot_buffs = self._slot_buffs[slot_name]

			if Managers.player.is_server and slot_buffs then
				self._apply_buffs(self, slot_buffs)
			end
		end
	end

	return 
end
SimpleHuskInventoryExtension._despawn_attached_units = function (self)
	local attached_units = self._attached_units
	local world = self._world

	for index, attached_unit in pairs(attached_units) do
		Managers.state.unit_spawner:mark_for_deletion(attached_unit)

		attached_units[index] = nil
	end

	return 
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

	return 
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

	return 
end
local params = {}
SimpleHuskInventoryExtension._apply_buffs = function (self, buffs)
	local buff_extension = ScriptUnit.extension(self._unit, "buff_system")
	local current_item_buffs = self.current_item_buffs

	for i = 1, #current_item_buffs, 1 do
		local buff_id = current_item_buffs[i]

		buff_extension.remove_buff(buff_extension, buff_id)
	end

	table.clear(current_item_buffs)

	local index = 1

	for buff_name, variable_data in pairs(buffs) do
		table.clear(params)

		for data_type, data_value in pairs(variable_data) do
			params[data_type] = data_value
		end

		current_item_buffs[index] = buff_extension.add_buff(buff_extension, buff_name, params)
		index = index + 1
	end

	return 
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

	self._despawn_attached_units(self)

	local equipment = self._equipment
	local wielded_slot = self.wielded_slot

	if wielded_slot then
		local slot_data = equipment.slots[wielded_slot]

		if slot_data and show then
			local item_template = self.get_item_template(self, slot_data)

			self._spawn_attached_units(self, item_template.third_person_attached_units)
		end
	end

	return 
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

	local item_template = self.get_item_template(self, slot_data)

	return item_template
end
SimpleHuskInventoryExtension.hot_join_sync = function (self, sender)
	GearUtils.hot_join_sync(sender, self._unit, self._equipment)

	return 
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
SimpleHuskInventoryExtension.override_career_skill_item_template = function (self, item_data)
	local override_item_template = nil
	local slot_to_use = item_data.slot_to_use

	if slot_to_use then
		local equipment = self._equipment
		local slots = equipment.slots
		local override_slot_data = slots[slot_to_use]
		local override_item_template = self.get_item_template(self, override_slot_data)
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

	local override_item_template = self.override_career_skill_item_template(self, item_data)
	local item_template = override_item_template or BackendUtils.get_item_template(item_data)
	local item_units = BackendUtils.get_item_units(item_data, nil, slot.skin)
	local right_hand_weapon_unit_3p, right_hand_weapon_unit_1p, left_hand_weapon_unit_3p, left_hand_weapon_unit_1p, right_hand_ammo_unit_3p, right_hand_ammo_unit_1p, left_hand_ammo_unit_3p, left_hand_ammo_unit_1p = nil

	if item_units.right_hand_unit then
		right_hand_weapon_unit_3p, right_hand_ammo_unit_3p, right_hand_weapon_unit_1p, right_hand_ammo_unit_1p = GearUtils.spawn_inventory_unit(world, "right", item_template.third_person_extension_template, item_units.right_hand_unit, item_template.right_hand_attachment_node_linking, slot_name, item_data, unit_1p, unit_3p)
	end

	if item_units.left_hand_unit then
		left_hand_weapon_unit_3p, left_hand_ammo_unit_3p, left_hand_weapon_unit_1p, left_hand_ammo_unit_1p = GearUtils.spawn_inventory_unit(world, "left", item_template.third_person_extension_template, item_units.left_hand_unit, item_template.left_hand_attachment_node_linking, slot_name, item_data, unit_1p, unit_3p)
	end

	local career_extension = ScriptUnit.extension(unit_3p, "career_system")
	local career_index = career_extension.career_index(career_extension)

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

	return item_data
end
SimpleHuskInventoryExtension.is_showing_third_person_inventory = function (self)
	return self._show_third_person
end

return 

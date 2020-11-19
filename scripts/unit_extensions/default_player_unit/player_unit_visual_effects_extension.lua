PlayerUnitVisualEffectsExtension = class(PlayerUnitVisualEffectsExtension)
local unit_set_flow_variable = Unit.set_flow_variable
local unit_flow_event = Unit.flow_event

PlayerUnitVisualEffectsExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.network_manager = Managers.state.network
	self.world = extension_init_context.world
	self.unit = unit
	self.overcharge_threshold_changed = true
end

PlayerUnitVisualEffectsExtension.extensions_ready = function (self, world, unit)
	self.inventory_extension = ScriptUnit.extension(unit, "inventory_system")
	self.overcharge_extension = ScriptUnit.extension(unit, "overcharge_system")
	local first_person_extension = ScriptUnit.extension(unit, "first_person_system")
	local first_person_unit = first_person_extension:get_first_person_unit()
	local first_person_mesh_unit = first_person_extension:get_first_person_mesh_unit()
	self.first_person_extension = first_person_extension
	self.first_person_unit = first_person_unit
	self.first_person_mesh_unit = first_person_mesh_unit
end

PlayerUnitVisualEffectsExtension.destroy = function (self)
	return
end

PlayerUnitVisualEffectsExtension.update = function (self, unit, input, dt, context, t)
	self:_update_overcharge_thresholds()
	self:_set_overcharge_flow_values()
	self:_set_weapons_energy_drainable()
end

PlayerUnitVisualEffectsExtension._update_overcharge_thresholds = function (self)
	local overcharge_extension = self.overcharge_extension
	local value, threshold, _ = overcharge_extension:current_overcharge_status()

	if self.above_overcharge_threshold and value < threshold then
		self.above_overcharge_threshold = false
		self.overcharge_threshold_changed = true
	elseif not self.above_overcharge_threshold and threshold <= value then
		self.above_overcharge_threshold = true
		self.overcharge_threshold_changed = true
	else
		self.overcharge_threshold_changed = false
	end
end

PlayerUnitVisualEffectsExtension._set_overcharge_flow_values = function (self)
	local overcharge_extension = self.overcharge_extension
	local anim_blend_overcharge = overcharge_extension:get_anim_blend_overcharge()

	self:_set_character_overcharge(anim_blend_overcharge)
	self:_set_weapons_overcharge(anim_blend_overcharge)

	if self.overcharge_threshold_changed then
		self:_set_character_overcharge_threshold()
		self:_set_weapons_overcharge_threshold()

		self.overcharge_threshold_changed = false
	end
end

PlayerUnitVisualEffectsExtension._set_character_overcharge = function (self, value)
	local unit = self.unit
	local first_person_unit = self.first_person_unit
	local first_person_mesh_unit = self.first_person_mesh_unit

	if unit and Unit.alive(unit) then
		unit_set_flow_variable(unit, "current_overcharge", value)
		unit_flow_event(unit, "lua_update_overcharge")
	end

	if first_person_unit and Unit.alive(first_person_unit) then
		unit_set_flow_variable(first_person_unit, "current_overcharge", value)
		unit_flow_event(first_person_unit, "lua_update_overcharge")
	end

	if first_person_mesh_unit and Unit.alive(first_person_mesh_unit) then
		unit_set_flow_variable(first_person_mesh_unit, "current_overcharge", value)
		unit_flow_event(first_person_mesh_unit, "lua_update_overcharge")
	end
end

PlayerUnitVisualEffectsExtension._set_weapons_energy_drainable = function (self)
	local inventory_extension = self.inventory_extension
	local wielded_slot_data = inventory_extension:get_wielded_slot_data()
	local unit = self.unit
	local energy_extension = unit and ScriptUnit.has_extension(unit, "energy_system")

	if wielded_slot_data and energy_extension then
		local is_energy_drainable = energy_extension:is_drainable()
		local left_unit_1p = wielded_slot_data.left_unit_1p
		local left_ammo_unit_1p = wielded_slot_data.left_ammo_unit_1p
		local right_unit_1p = wielded_slot_data.right_unit_1p
		local right_ammo_unit_1p = wielded_slot_data.right_ammo_unit_1p

		if left_unit_1p and Unit.alive(left_unit_1p) then
			unit_set_flow_variable(left_unit_1p, "is_energy_drainable", is_energy_drainable)
		end

		if left_ammo_unit_1p and Unit.alive(left_ammo_unit_1p) then
			unit_set_flow_variable(left_ammo_unit_1p, "is_energy_drainable", is_energy_drainable)
		end

		if right_unit_1p and Unit.alive(right_unit_1p) then
			unit_set_flow_variable(right_unit_1p, "is_energy_drainable", is_energy_drainable)
		end

		if right_ammo_unit_1p and Unit.alive(right_ammo_unit_1p) then
			unit_set_flow_variable(right_ammo_unit_1p, "is_energy_drainable", is_energy_drainable)
		end

		local left_hand_unit_3p = wielded_slot_data.left_unit_3p
		local left_ammo_unit_3p = wielded_slot_data.left_ammo_unit_3p
		local right_hand_unit_3p = wielded_slot_data.right_unit_3p
		local right_ammo_unit_3p = wielded_slot_data.right_ammo_unit_3p

		if left_hand_unit_3p and Unit.alive(left_hand_unit_3p) then
			unit_set_flow_variable(left_hand_unit_3p, "is_energy_drainable", is_energy_drainable)
		end

		if left_ammo_unit_3p and Unit.alive(left_ammo_unit_3p) then
			unit_set_flow_variable(left_ammo_unit_3p, "is_energy_drainable", is_energy_drainable)
		end

		if right_hand_unit_3p and Unit.alive(right_hand_unit_3p) then
			unit_set_flow_variable(right_hand_unit_3p, "is_energy_drainable", is_energy_drainable)
		end

		if right_ammo_unit_3p and Unit.alive(right_ammo_unit_3p) then
			unit_set_flow_variable(right_ammo_unit_3p, "is_energy_drainable", is_energy_drainable)
		end
	end
end

PlayerUnitVisualEffectsExtension._set_character_overcharge_threshold = function (self)
	local unit = self.unit
	local first_person_unit = self.first_person_unit
	local first_person_mesh_unit = self.first_person_mesh_unit
	local event_name = "below_overcharge_threshold"

	if self.above_overcharge_threshold then
		event_name = "above_overcharge_threshold"
	end

	if unit and Unit.alive(unit) then
		unit_flow_event(unit, event_name)
	end

	if first_person_unit and Unit.alive(first_person_unit) then
		unit_flow_event(first_person_unit, event_name)
	end

	if first_person_mesh_unit and Unit.alive(first_person_mesh_unit) then
		unit_flow_event(first_person_mesh_unit, event_name)
	end
end

PlayerUnitVisualEffectsExtension._set_weapons_overcharge = function (self, value)
	local inventory_extension = self.inventory_extension
	local wielded_slot_data = inventory_extension:get_wielded_slot_data()

	if wielded_slot_data then
		local left_hand_unit = wielded_slot_data.left_unit_1p
		local right_hand_unit = wielded_slot_data.right_unit_1p

		if left_hand_unit and Unit.alive(left_hand_unit) then
			unit_set_flow_variable(left_hand_unit, "current_overcharge", value)
			unit_flow_event(left_hand_unit, "lua_update_overcharge")
		end

		if right_hand_unit and Unit.alive(right_hand_unit) then
			unit_set_flow_variable(right_hand_unit, "current_overcharge", value)
			unit_flow_event(right_hand_unit, "lua_update_overcharge")
		end

		local left_hand_unit_3p = wielded_slot_data.left_unit_3p
		local right_hand_unit_3p = wielded_slot_data.right_unit_3p

		if left_hand_unit_3p and Unit.alive(left_hand_unit_3p) then
			unit_set_flow_variable(left_hand_unit_3p, "current_overcharge", value)
			unit_flow_event(left_hand_unit_3p, "lua_update_overcharge")
		end

		if right_hand_unit_3p and Unit.alive(right_hand_unit_3p) then
			unit_set_flow_variable(right_hand_unit_3p, "current_overcharge", value)
			unit_flow_event(right_hand_unit_3p, "lua_update_overcharge")
		end
	end
end

PlayerUnitVisualEffectsExtension._set_weapons_overcharge_threshold = function (self)
	local inventory_extension = self.inventory_extension
	local wielded_slot_data = inventory_extension:get_wielded_slot_data()

	if wielded_slot_data then
		local event_name = "below_overcharge_threshold"

		if self.above_overcharge_threshold then
			event_name = "above_overcharge_threshold"
		end

		local left_hand_unit = wielded_slot_data.left_unit_1p
		local right_hand_unit = wielded_slot_data.right_unit_1p

		if left_hand_unit and Unit.alive(left_hand_unit) then
			unit_flow_event(left_hand_unit, event_name)
		end

		if right_hand_unit and Unit.alive(right_hand_unit) then
			unit_flow_event(right_hand_unit, event_name)
		end

		local left_hand_unit_3p = wielded_slot_data.left_unit_3p
		local right_hand_unit_3p = wielded_slot_data.right_unit_3p

		if left_hand_unit_3p and Unit.alive(left_hand_unit_3p) then
			unit_flow_event(left_hand_unit_3p, event_name)
		end

		if right_hand_unit_3p and Unit.alive(right_hand_unit_3p) then
			unit_flow_event(right_hand_unit_3p, event_name)
		end
	end
end

return

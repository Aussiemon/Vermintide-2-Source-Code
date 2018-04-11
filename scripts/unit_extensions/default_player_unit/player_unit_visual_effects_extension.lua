PlayerUnitVisualEffectsExtension = class(PlayerUnitVisualEffectsExtension)
local unit_set_flow_variable = Unit.set_flow_variable
local unit_flow_event = Unit.flow_event
PlayerUnitVisualEffectsExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.network_manager = Managers.state.network
	self.world = extension_init_context.world
	self.unit = unit
	self.threshold_changed = true

	return 
end
PlayerUnitVisualEffectsExtension.extensions_ready = function (self, world, unit)
	self.inventory_extension = ScriptUnit.extension(unit, "inventory_system")
	self.overcharge_extension = ScriptUnit.extension(unit, "overcharge_system")
	local first_person_extension = ScriptUnit.extension(unit, "first_person_system")
	local first_person_unit = first_person_extension.get_first_person_unit(first_person_extension)
	local first_person_mesh_unit = first_person_extension.get_first_person_mesh_unit(first_person_extension)
	self.first_person_extension = first_person_extension
	self.first_person_unit = first_person_unit
	self.first_person_mesh_unit = first_person_mesh_unit

	return 
end
PlayerUnitVisualEffectsExtension.destroy = function (self)
	return 
end
PlayerUnitVisualEffectsExtension.update = function (self, unit, input, dt, context, t)
	local overcharge_extension = self.overcharge_extension
	local overcharge_value, overcharge_threshold, max_overcharge = overcharge_extension.current_overcharge_status(overcharge_extension)

	self._update_game_object_field(self, overcharge_threshold, max_overcharge)
	self._update_thresholds(self, overcharge_value, overcharge_threshold)
	self._set_flow_values(self)

	return 
end
PlayerUnitVisualEffectsExtension._update_thresholds = function (self, overcharge_value, overcharge_threshold)
	if self.above_threshold and overcharge_value < overcharge_threshold then
		self.above_threshold = false
		self.threshold_changed = true
	elseif not self.above_threshold and overcharge_threshold <= overcharge_value then
		self.above_threshold = true
		self.threshold_changed = true
	else
		self.threshold_changed = false
	end

	return 
end
PlayerUnitVisualEffectsExtension._update_game_object_field = function (self, overcharge_threshold, max_overcharge)
	local network_manager = self.network_manager
	local unit = self.unit
	local game = network_manager.game(network_manager)
	local go_id = Managers.state.unit_storage:go_id(unit)
	local overcharge_extension = self.overcharge_extension
	local overcharge_percentage = overcharge_extension.get_anim_blend_overcharge(overcharge_extension)
	local overcharge_threshold_percentage = overcharge_threshold / max_overcharge

	GameSession.set_game_object_field(game, go_id, "overcharge_percentage", overcharge_percentage)
	GameSession.set_game_object_field(game, go_id, "overcharge_threshold_percentage", overcharge_threshold_percentage)

	return 
end
PlayerUnitVisualEffectsExtension._set_flow_values = function (self)
	local overcharge_extension = self.overcharge_extension
	local anim_blend_overcharge = overcharge_extension.get_anim_blend_overcharge(overcharge_extension)
	local unit = self.unit
	local first_person_unit = self.first_person_unit
	local first_person_mesh_unit = self.first_person_mesh_unit

	if unit and Unit.alive(unit) then
		unit_set_flow_variable(unit, "current_overcharge", anim_blend_overcharge)
		unit_flow_event(unit, "lua_update_overcharge")
	end

	if first_person_unit and Unit.alive(first_person_unit) then
		unit_set_flow_variable(first_person_unit, "current_overcharge", anim_blend_overcharge)
		unit_flow_event(first_person_unit, "lua_update_overcharge")
	end

	if first_person_mesh_unit and Unit.alive(first_person_mesh_unit) then
		unit_set_flow_variable(first_person_mesh_unit, "current_overcharge", anim_blend_overcharge)
		unit_flow_event(first_person_mesh_unit, "lua_update_overcharge")
	end

	self._set_weapon_flow_variable(self, "current_overcharge", anim_blend_overcharge)
	self._weapon_flow_event(self, "lua_update_overcharge")

	if self.threshold_changed then
		local event_name = "below_overcharge_threshold"

		if self.above_threshold then
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

		self._weapon_flow_event(self, event_name)
	end

	return 
end
PlayerUnitVisualEffectsExtension._set_weapon_flow_variable = function (self, variable_name, value)
	local inventory_extension = self.inventory_extension
	local wielded_slot_data = inventory_extension.get_wielded_slot_data(inventory_extension)

	if wielded_slot_data then
		local left_hand_unit = wielded_slot_data.left_unit_1p
		local right_hand_unit = wielded_slot_data.right_unit_1p

		if left_hand_unit and Unit.alive(left_hand_unit) then
			unit_set_flow_variable(left_hand_unit, variable_name, value)
		end

		if right_hand_unit and Unit.alive(right_hand_unit) then
			unit_set_flow_variable(right_hand_unit, variable_name, value)
		end
	end

	return 
end
PlayerUnitVisualEffectsExtension._weapon_flow_event = function (self, event)
	local inventory_extension = self.inventory_extension
	local wielded_slot_data = inventory_extension.get_wielded_slot_data(inventory_extension)

	if wielded_slot_data then
		local left_hand_unit = wielded_slot_data.left_unit_1p
		local right_hand_unit = wielded_slot_data.right_unit_1p

		if left_hand_unit and Unit.alive(left_hand_unit) then
			unit_flow_event(left_hand_unit, event)
		end

		if right_hand_unit and Unit.alive(right_hand_unit) then
			unit_flow_event(right_hand_unit, event)
		end
	end

	return 
end

return 

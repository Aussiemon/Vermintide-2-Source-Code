PickupUnitExtension = class(PickupUnitExtension)

PickupUnitExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.world = extension_init_context.world
	self.unit = unit
	local pickup_name = extension_init_data.pickup_name
	local has_physics = extension_init_data.has_physics
	local spawn_type = extension_init_data.spawn_type
	local network_transmit = extension_init_context.network_transmit
	self.pickup_name = pickup_name
	self.has_physics = has_physics
	self.spawn_type = spawn_type
	self.is_server = network_transmit.is_server
	self.spawn_index = extension_init_data.spawn_index
	local pickup_settings = AllPickups[self.pickup_name]
	self.hide_func = pickup_settings.hide_func
	self.hidden = false

	Unit.set_data(unit, "interaction_data", "hud_description", pickup_settings.hud_description)
	Unit.set_data(unit, "interaction_data", "interaction_length", Unit.get_data(unit, "interaction_data", "interaction_length") or 0)
	Unit.set_data(unit, "interaction_data", "interaction_type", "pickup_object")
	Unit.set_data(unit, "interaction_data", "only_once", pickup_settings.only_once)

	self.can_interact_time = Managers.time:time("game") + 1

	if Unit.find_actor(unit, "pickup") then
		if has_physics then
			Unit.create_actor(unit, "pickup")
		else
			Unit.destroy_actor(unit, "pickup")
		end
	end

	if self.is_server then
		local position = POSITION_LOOKUP[unit]

		Managers.telemetry.events:pickup_spawned(pickup_name, spawn_type, position)
	end
end

PickupUnitExtension.extensions_ready = function (self)
	return
end

PickupUnitExtension.update = function (self, unit, input, dt, context, t)
	return
end

PickupUnitExtension.hide = function (self)
	local unit = self.unit
	self.hidden = true

	Unit.set_unit_visibility(unit, false)
	Unit.disable_physics(unit)
	Unit.flow_event(unit, "lua_hidden")
end

PickupUnitExtension.get_pickup_settings = function (self)
	return AllPickups[self.pickup_name]
end

PickupUnitExtension.destroy = function (self)
	local pickup_system = Managers.state.entity:system("pickup_system")

	if pickup_system and self.spawn_index then
		pickup_system:set_taken(self.spawn_index)
	end

	if self.is_server then
		local position = POSITION_LOOKUP[self.unit]

		Managers.telemetry.events:pickup_destroyed(self.pickup_name, self.spawn_type, position)
	end
end

PickupUnitExtension.can_interact = function (self)
	local t = Managers.time:time("game")
	local return_value = t <= self.can_interact_time

	return not return_value
end

return

ThrownUnitHuskExtension = class(ThrownUnitHuskExtension)
local unit_alive = Unit.alive
local position_lookup = POSITION_LOOKUP

ThrownUnitHuskExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local world = extension_init_context.world
	self.world = world
	self.game = Managers.state.network:game()
	self.unit = unit
	local unit_storage = Managers.state.unit_storage
	self.go_id = unit_storage:go_id(unit)
end

ThrownUnitHuskExtension.extensions_ready = function (self, world, unit)
	Unit.flow_event(unit, "axe_thrown")
end

ThrownUnitHuskExtension.destroy = function (self)
	return
end

ThrownUnitHuskExtension.update = function (self, unit, input, dt, context, t)
	local lerp_value = math.min(dt * 20, 1)
	local current_pos = POSITION_LOOKUP[unit]
	local wanted_pos = GameSession.game_object_field(self.game, self.go_id, "position")
	local pos = Vector3.lerp(current_pos, wanted_pos, lerp_value)

	Unit.set_local_position(unit, 0, pos)

	local current_rot = Unit.local_rotation(unit, 0)
	local wanted_rot = GameSession.game_object_field(self.game, self.go_id, "rotation")
	local rot = Quaternion.lerp(current_rot, wanted_rot, lerp_value)

	Unit.set_local_rotation(unit, 0, rot)
end

return

require("scripts/unit_extensions/generic/generic_state_machine")

LureWhereaboutsExtension = class(LureWhereaboutsExtension)
LureWhereaboutsExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._unit = unit
	local nav_world = Managers.state.entity:system("ai_system"):nav_world()
	self._closest_positions = {}
	local pos = Unit.world_position(unit, 0)
	local above = 1
	local below = 5
	local found, z = GwNavQueries.triangle_from_position(nav_world, pos, above, below)

	if found then
		self._closest_positions[1] = Vector3Box(Vector3(pos.x, pos.y, z))
		self._on_navmesh = true
	else
		self._on_navmesh = false
		local max_lateral_offset = 5
		local from_border = 0.1
		local nav_mesh_pos = GwNavQueries.inside_position_from_outside_position(nav_world, pos, above, below, max_lateral_offset, from_border)

		if nav_mesh_pos then
			self._closest_positions[1] = Vector3Box(nav_mesh_pos)
		end
	end

	return 
end
LureWhereaboutsExtension.destroy = function (self)
	return 
end
LureWhereaboutsExtension.closest_positions_when_outside_navmesh = function (self)
	return self._closest_positions, self._on_navmesh
end

return 

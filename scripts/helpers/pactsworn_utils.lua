-- chunkname: @scripts/helpers/pactsworn_utils.lua

PactswornUtils = {}

PactswornUtils.get_hoist_position = function (unit, grabber_unit)
	local player_position = POSITION_LOOKUP[unit]
	local root = Unit.node(unit, "aim_target")
	local root_pos = Unit.world_position(unit, root)
	local offset = player_position - root_pos
	local packmaster_unit_position = POSITION_LOOKUP[grabber_unit]
	local length = Vector3.length(offset)
	local direction = player_position - packmaster_unit_position

	direction.z = 0

	local hoist_position = packmaster_unit_position + Vector3.normalize(direction) * length
	local nav_world = Managers.state.entity:system("ai_system"):nav_world()
	local unit_is_on_navmesh, z = GwNavQueries.triangle_from_position(nav_world, hoist_position, 3, 3)
	local nav_pos

	if unit_is_on_navmesh then
		nav_pos = Vector3.copy(hoist_position)
		nav_pos[3] = z
	else
		nav_pos = GwNavQueries.inside_position_from_outside_position(nav_world, hoist_position, 5, 5, 5, 0.25)
	end

	return nav_pos or root_pos
end

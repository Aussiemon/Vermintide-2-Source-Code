local AISlotUtils = {}
local Vector3_copy = Vector3.copy
local GwNavQueries_triangle_from_position = GwNavQueries.triangle_from_position
local GwNavQueries_inside_position_from_outside_position = GwNavQueries.inside_position_from_outside_position
local Z_MAX_DIFFERENCE_ABOVE = 1.5
local Z_MAX_DIFFERENCE_BELOW = 1.5
local SLOT_Z_MAX_DOWN = 7.5

AISlotUtils.clamp_position_on_navmesh = function (position, nav_world, above, below)
	below = below or Z_MAX_DIFFERENCE_BELOW
	above = above or Z_MAX_DIFFERENCE_ABOVE
	local is_on_navmesh, altitude = GwNavQueries_triangle_from_position(nav_world, position, above, below)

	if is_on_navmesh then
		local position_on_navmesh = Vector3_copy(position)
		position_on_navmesh.z = altitude

		return position_on_navmesh
	end

	return nil
end

AISlotUtils.get_target_pos_on_navmesh = function (target_position, nav_world)
	local position_on_navmesh = AISlotUtils.clamp_position_on_navmesh(target_position, nav_world)

	if position_on_navmesh then
		return position_on_navmesh
	end

	local above_limit = Z_MAX_DIFFERENCE_ABOVE
	local below_limit = Z_MAX_DIFFERENCE_BELOW
	local horizontal_limit = 1
	local distance_from_nav_border = 0.05
	local border_position = GwNavQueries_inside_position_from_outside_position(nav_world, target_position, above_limit, below_limit, horizontal_limit, distance_from_nav_border)

	if border_position then
		return border_position
	end

	above_limit = Z_MAX_DIFFERENCE_ABOVE
	below_limit = SLOT_Z_MAX_DOWN
	position_on_navmesh = AISlotUtils.clamp_position_on_navmesh(target_position, nav_world, above_limit, below_limit)

	if position_on_navmesh then
		return position_on_navmesh
	end

	return nil
end

return AISlotUtils

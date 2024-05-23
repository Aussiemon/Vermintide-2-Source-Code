-- chunkname: @scripts/helpers/pactsworn_utils.lua

PactswornUtils = {}

PactswornUtils.get_hoist_position = function (unit, grabber_unit)
	local player_position = POSITION_LOOKUP[unit]
	local packmaster_unit_position = POSITION_LOOKUP[grabber_unit]
	local direction, length = Vector3.direction_length(player_position - packmaster_unit_position)

	direction.z = 0

	local hoist_position = packmaster_unit_position + Vector3.normalize(direction) * length

	return hoist_position
end

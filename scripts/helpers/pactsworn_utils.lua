-- chunkname: @scripts/helpers/pactsworn_utils.lua

PactswornUtils = {}

local RAYCAST_INDEX_POSITION = 1

PactswornUtils.get_hoist_position = function (physics_world, unit, grabber_unit)
	local player_position = POSITION_LOOKUP[unit]
	local packmaster_unit_position = POSITION_LOOKUP[grabber_unit]
	local direction, length = Vector3.direction_length(player_position - packmaster_unit_position)

	direction.z = 0

	local hoist_position = packmaster_unit_position + Vector3.normalize(direction) * length
	local ray_dir, ray_length = Vector3.direction_length(hoist_position - player_position)

	if ray_length < math.epsilon then
		return player_position
	end

	local result = PhysicsWorld.immediate_raycast_actors(physics_world, player_position, ray_dir, ray_length, "static_collision_filter", "filter_player_ray_projectile_static_only", "max_hits", 1)

	if result then
		local hit = result[1]

		if script_data.vs_debug_hoist then
			QuickDrawerStay:sphere(hit[RAYCAST_INDEX_POSITION], 0.15, Colors.get("tomato"))
			QuickDrawerStay:line(hit[RAYCAST_INDEX_POSITION], hoist_position, Colors.get("tomato"))
			QuickDrawerStay:sphere(hoist_position, 0.15, Colors.get("cyan"))
		end

		hoist_position = hit[RAYCAST_INDEX_POSITION]
	end

	return hoist_position
end

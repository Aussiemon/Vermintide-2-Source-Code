AILineOfSightExtension = class(AILineOfSightExtension)

AILineOfSightExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.unit = unit
	self._offsets = {}
end

AILineOfSightExtension.extensions_ready = function (self, world, unit)
	self._physics_world = World.physics_world(world)
end

AILineOfSightExtension.destroy = function (self)
	return
end

AILineOfSightExtension.reset = function (self)
	return
end

local MAX_DIST_SQUARED = 36
local BENEATH_ABOVE_EPSILON = 0.1
local RAY_DISTANCE_EPSILON = 0.1

AILineOfSightExtension.has_line_of_sight = function (self, unit, blackboard, override_target, override_distance)
	if blackboard.pause_line_of_sight_t then
		local t = Managers.time:time("game")

		if t < blackboard.pause_line_of_sight_t then
			return false, 1
		else
			blackboard.pause_line_of_sight_t = nil
		end
	end

	local offsets = self._offsets
	offsets[1] = Vector3(0, 0, 1.5)
	offsets[2] = Vector3(0.5, 0, 1.5)
	offsets[3] = Vector3(-0.5, 0, 1.5)
	local ray_from_offset = Vector3(0, 0, 1.5)
	local num_offsets = 3
	local physics_world = self._physics_world
	local up = Vector3.up()
	local unit_alive = Unit.alive
	local is_character = DamageUtils.is_character
	local debug = false
	local Vector3_distance_squared = Vector3.distance_squared
	local num_raycasts = 0
	local success = false
	local max_distance = override_distance or blackboard.breed.line_of_sight_distance_sq or MAX_DIST_SQUARED
	local target = override_target or blackboard.attacking_target or blackboard.target_unit

	if unit_alive(target) and is_character(target) then
		local self_pos = POSITION_LOOKUP[unit]
		local target_pos = POSITION_LOOKUP[target]

		if target_pos then
			local dist_sq = Vector3_distance_squared(self_pos, target_pos)

			if dist_sq < max_distance then
				local target_offset = target_pos - self_pos
				success = false

				if math.abs(target_offset.x) < BENEATH_ABOVE_EPSILON and math.abs(target_offset.y) < BENEATH_ABOVE_EPSILON then
					local z_offset_target = offsets[1].z
					local from = self_pos + ray_from_offset
					local to_offset = target_offset + Vector3(0, 0, z_offset_target - ray_from_offset.z)
					local dist = math.max(Vector3.length(to_offset), 0.0001)
					local dir = to_offset / dist

					if RAY_DISTANCE_EPSILON < dist then
						num_raycasts = num_raycasts + 1
						local hit, _, _, _, hit_actor = PhysicsWorld.raycast(physics_world, from, dir, dist, "closest", "collision_filter", "filter_ai_line_of_sight_check")

						if not hit or Actor.unit(hit_actor) == target then
							success = true
						end
					else
						success = true
					end
				else
					local right_vector = Vector3.normalize(Vector3.cross(target_offset, up))

					for i = 1, num_offsets do
						num_raycasts = num_raycasts + 1
						local offset = offsets[i]
						local from = self_pos + ray_from_offset
						local to_offset = target_offset + Vector3(right_vector.x * offset.x, right_vector.y * offset.x, offset.z - ray_from_offset.z)
						local dist = Vector3.length(to_offset)
						local dir = to_offset / dist
						local hit, _, _, _, hit_actor = PhysicsWorld.raycast(physics_world, from, dir, dist, "closest", "collision_filter", "filter_ai_line_of_sight_check")

						if not hit or Actor.unit(hit_actor) == target then
							success = true

							break
						end
					end
				end
			end
		end
	end

	return success, num_raycasts
end

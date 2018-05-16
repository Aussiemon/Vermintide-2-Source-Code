require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTInGravityWellAction = class(BTInGravityWellAction, BTNode)

BTInGravityWellAction.init = function (self, ...)
	BTInGravityWellAction.super.init(self, ...)
end

BTInGravityWellAction.name = "BTInGravityWellAction"
local DEFAULT_IN_AIR_MOVER_CHECK_RADIUS = 0.35

BTInGravityWellAction.enter = function (self, unit, blackboard, t)
	local locomotion_extension = blackboard.locomotion_extension
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_enabled(false)

	local breed = blackboard.breed
	local overlap_radius = breed.stagger_in_air_mover_check_radius or DEFAULT_IN_AIR_MOVER_CHECK_RADIUS
	local overlap_pos = POSITION_LOOKUP[unit]
	local overlap_size = Vector3(overlap_radius, 1, overlap_radius)
	local overlap_rotation = Quaternion.look(Vector3.down(), Vector3.forward())
	local world = blackboard.world
	local physics_world = World.get_data(world, "physics_world")
	local _, actor_count = PhysicsWorld.immediate_overlap(physics_world, "position", overlap_pos, "rotation", overlap_rotation, "size", overlap_size, "shape", "capsule", "types", "both", "collision_filter", "filter_environment_overlap", "use_global_table")

	if actor_count == 0 then
		local override_mover_move_distance = breed.override_mover_move_distance

		locomotion_extension:set_movement_type("constrained_by_mover", override_mover_move_distance)
	end

	blackboard.attack_aborted = true
	blackboard.move_state = "stagger"
	local action_data = self._tree_node.action_data
	blackboard.action = action_data
	blackboard.spawn_to_running = nil
end

BTInGravityWellAction._set_wanted_velocity = function (self, dt, blackboard, self_pos)
	local locomotion_extension = blackboard.locomotion_extension
	local gravity_well_pos = blackboard.gravity_well_position:unbox()
	local gravity_well_strength = blackboard.gravity_well_strength
	local offset = gravity_well_pos - self_pos
	local dir = Vector3.normalize(offset)
	local dist_sq = Vector3.length_squared(offset)
	local old_velocity = locomotion_extension:current_velocity()
	local broke_free = false
	local new_velocity = nil

	if dist_sq < 1 then
		new_velocity = (old_velocity - dir * Vector3.dot(old_velocity, dir)) * (1 - 5 * dt)
	else
		local force_magnitude = gravity_well_strength / dist_sq
		broke_free = force_magnitude < 0.1
		local force = dir * force_magnitude
		new_velocity = old_velocity + dt * force
		new_velocity.z = math.min(new_velocity.z, 2)
	end

	locomotion_extension:set_wanted_velocity(new_velocity)
	locomotion_extension:set_wanted_rotation(Quaternion.look(Vector3.flat(-dir), Vector3.up()))

	return new_velocity, broke_free
end

BTInGravityWellAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.action = nil
	blackboard.stagger_hit_wall = nil
	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:set_movement_type("snap_to_navmesh")
	locomotion_extension:set_wanted_velocity(Vector3.zero())

	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_enabled(true)

	blackboard.gravity_well_position = nil
	blackboard.gravity_well_strength = nil
	blackboard.gravity_well_time = nil
end

BTInGravityWellAction.run = function (self, unit, blackboard, t, dt)
	local position = POSITION_LOOKUP[unit]
	local velocity, broke_free = self:_set_wanted_velocity(dt, blackboard, position)
	local locomotion_extension = blackboard.locomotion_extension

	if locomotion_extension.movement_type ~= "constrained_by_mover" and not blackboard.stagger_hit_wall then
		local nav_world = blackboard.nav_world
		local world = blackboard.world
		local physics_world = World.physics_world(world)
		local navigation_extension = blackboard.navigation_extension
		local traverse_logic = navigation_extension:traverse_logic()
		local result = LocomotionUtils.navmesh_movement_check(position, velocity, nav_world, physics_world, traverse_logic)

		if result == "navmesh_hit_wall" then
			blackboard.stagger_hit_wall = true
		elseif result == "navmesh_use_mover" then
			local breed = blackboard.breed
			local override_mover_move_distance = breed.override_mover_move_distance
			local ignore_forced_mover_kill = true
			local successful = locomotion_extension:set_movement_type("constrained_by_mover", override_mover_move_distance, ignore_forced_mover_kill)

			if not successful then
				locomotion_extension:set_movement_type("snap_to_navmesh")

				blackboard.stagger_hit_wall = true
			end
		end
	end

	return ((broke_free or blackboard.gravity_well_time < t) and "done") or "running"
end

return

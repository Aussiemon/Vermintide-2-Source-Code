require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTInVortexAction = class(BTInVortexAction, BTNode)
BTInVortexAction.init = function (self, ...)
	BTInVortexAction.super.init(self, ...)

	return 
end
BTInVortexAction.name = "BTInVortexAction"
BTInVortexAction.enter = function (self, unit, blackboard, t)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension.set_enabled(navigation_extension, false)

	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension.set_movement_type(locomotion_extension, "script_driven")
	locomotion_extension.set_wanted_rotation(locomotion_extension, nil)

	local network_manager = Managers.state.network

	network_manager.anim_event(network_manager, unit, "vortex_loop")

	blackboard.in_vortex_state = "in_vortex"
	blackboard.stagger_prohibited = true
	local hit_reaction_extension = ScriptUnit.extension(unit, "hit_reaction_system")
	hit_reaction_extension.force_ragdoll_on_death = true

	return 
end
BTInVortexAction.leave = function (self, unit, blackboard, t, reason, destroy)
	LocomotionUtils.set_animation_driven_movement(unit, false, false)

	local health_extension = ScriptUnit.extension(unit, "health_system")

	if health_extension.is_alive(health_extension) then
		local locomotion_extension = blackboard.locomotion_extension

		locomotion_extension.set_movement_type(locomotion_extension, "snap_to_navmesh")

		local navigation_extension = blackboard.navigation_extension

		navigation_extension.set_enabled(navigation_extension, true)
		navigation_extension.reset_destination(navigation_extension, POSITION_LOOKUP[unit] or Unit.local_position(unit, 0))
	end

	blackboard.in_vortex = false
	blackboard.stagger_prohibited = nil
	local hit_reaction_extension = ScriptUnit.extension(unit, "hit_reaction_system")
	hit_reaction_extension.force_ragdoll_on_death = nil

	return 
end
BTInVortexAction.run = function (self, unit, blackboard, t, dt)
	local state = blackboard.in_vortex_state

	if state == "ejected_from_vortex" then
		local velocity = blackboard.ejected_from_vortex:unbox()
		velocity = velocity - Vector3(0, 0, 9.82)*dt
		local locomotion_extension = blackboard.locomotion_extension

		locomotion_extension.set_wanted_velocity(locomotion_extension, velocity)
		blackboard.ejected_from_vortex:store(velocity)

		local mover = Unit.mover(unit)
		local mover_collides_down = Mover.collides_down(mover)

		if mover_collides_down then
			velocity = velocity - Vector3.normalize(velocity)*dt

			blackboard.ejected_from_vortex:store(velocity)

			local nav_world = blackboard.nav_world
			local position = POSITION_LOOKUP[unit]
			local nav_position = LocomotionUtils.pos_on_mesh(nav_world, position, 1, 1)

			if nav_position == nil then
				local vertical_range = 0.5
				local horizontal_tolerance = 0.5
				local distance_from_obstacle = 0.5
				nav_position = GwNavQueries.inside_position_from_outside_position(nav_world, position, vertical_range, vertical_range, horizontal_tolerance, distance_from_obstacle)

				if nav_position == nil then
					local damage_type = "forced"
					local damage_direction = Vector3(0, 0, -1)

					AiUtils.kill_unit(unit, nil, nil, damage_type, damage_direction)

					return "failed"
				end
			end

			Unit.set_local_position(unit, 0, nav_position)

			if not blackboard.breed.die_on_vortex_land then
				Managers.state.network:anim_event(unit, "vortex_landing")
			end

			blackboard.in_vortex_state = "waiting_to_land"
			local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
			local event_data = FrameTable.alloc_table()

			dialogue_input.trigger_networked_dialogue_event(dialogue_input, "landing", event_data)
			LocomotionUtils.set_animation_driven_movement(unit, true, true, false)
		end
	elseif state == "waiting_to_land" then
		if not blackboard.breed.die_on_vortex_land and blackboard.landing_finished then
			local locomotion_extension = blackboard.locomotion_extension

			locomotion_extension.set_wanted_velocity(locomotion_extension, Vector3.zero())

			blackboard.landing_finished = nil
			blackboard.in_vortex_state = "landed"

			return "done"
		elseif blackboard.breed.die_on_vortex_land then
			local damage_type = "forced"
			local damage_direction = Vector3(0, 0, -1)

			AiUtils.kill_unit(unit, nil, nil, damage_type, damage_direction)
		end
	end

	return "running"
end

return 

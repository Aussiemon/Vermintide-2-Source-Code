require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTInVortexAction = class(BTInVortexAction, BTNode)

BTInVortexAction.init = function (self, ...)
	BTInVortexAction.super.init(self, ...)
end

BTInVortexAction.name = "BTInVortexAction"

BTInVortexAction.enter = function (self, unit, blackboard, t)
	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_enabled(false)

	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:set_movement_type("script_driven")
	locomotion_extension:set_wanted_rotation(nil)

	blackboard.in_vortex_state = "in_vortex_init"
	blackboard.stagger_prohibited = true
	blackboard.move_state = "idle"
	local hit_reaction_extension = ScriptUnit.extension(unit, "hit_reaction_system")
	hit_reaction_extension.force_ragdoll_on_death = true
	local shield_extension = ScriptUnit.has_extension(unit, "ai_shield_system")

	if shield_extension then
		shield_extension:set_is_blocking(false)
	end
end

BTInVortexAction.leave = function (self, unit, blackboard, t, reason, destroy)
	if not destroy then
		LocomotionUtils.set_animation_driven_movement(unit, false, false)
	end

	local health_extension = ScriptUnit.extension(unit, "health_system")

	if health_extension:is_alive() and not destroy then
		local locomotion_extension = blackboard.locomotion_extension

		locomotion_extension:set_movement_type("snap_to_navmesh")

		local navigation_extension = blackboard.navigation_extension

		navigation_extension:set_enabled(true)
		navigation_extension:reset_destination(POSITION_LOOKUP[unit] or Unit.local_position(unit, 0))

		local shield_extension = ScriptUnit.has_extension(unit, "ai_shield_system")

		if shield_extension then
			shield_extension:set_is_blocking(true)
		end
	end

	blackboard.in_vortex = false
	blackboard.stagger_prohibited = nil
	local hit_reaction_extension = ScriptUnit.extension(unit, "hit_reaction_system")
	hit_reaction_extension.force_ragdoll_on_death = nil
end

BTInVortexAction.run = function (self, unit, blackboard, t, dt)
	local state = blackboard.in_vortex_state

	if state == "in_vortex_init" then
		if blackboard.umbral_leap then
			local network_manager = Managers.state.network

			network_manager:anim_event(unit, "umbral_leap")

			blackboard.in_vortex_state = "in_umbral_leap"
			local locomotion_extension = blackboard.locomotion_extension

			locomotion_extension:set_wanted_velocity(Vector3.zero())
			locomotion_extension:set_movement_type("script_driven")
			locomotion_extension:set_affected_by_gravity(false)

			blackboard.umbral_leap = false
			blackboard.umbral_leap_jump_start = t
		else
			local network_manager = Managers.state.network

			network_manager:anim_event(unit, "vortex_loop")

			blackboard.in_vortex_state = "in_vortex"
		end
	elseif state == "in_umbral_leap" then
		if blackboard.umbral_leap_destination then
			ConflictUtils.teleport_ai_unit(unit, blackboard.umbral_leap_destination:unbox())

			blackboard.umbral_leap_destination = nil
			blackboard.in_vortex_state = "umbral_leap_landing"
		else
			local jump_time = t - blackboard.umbral_leap_jump_start
			local z_speed = 0

			if jump_time > 0.4 then
				z_speed = 9.8
			end

			local locomotion_extension = blackboard.locomotion_extension

			locomotion_extension:set_wanted_velocity(Vector3(0, 0, z_speed))
		end
	elseif state == "ejected_from_vortex" then
		local velocity = blackboard.ejected_from_vortex:unbox()
		velocity = velocity - Vector3(0, 0, 9.82) * dt
		local locomotion_extension = blackboard.locomotion_extension

		locomotion_extension:set_wanted_velocity(velocity)
		blackboard.ejected_from_vortex:store(velocity)

		local mover = Unit.mover(unit)
		local mover_collides_down = Mover.collides_down(mover)

		if mover_collides_down then
			velocity = velocity - Vector3.normalize(velocity) * dt

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
				local anim_event = blackboard.sot_landing and "sot_landing" or "vortex_landing"

				Managers.state.network:anim_event(unit, anim_event)
			end

			blackboard.in_vortex_state = "waiting_to_land"
			local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
			local event_data = FrameTable.alloc_table()

			dialogue_input:trigger_networked_dialogue_event("landing", event_data)

			if blackboard.thornsister_vortex then
				blackboard.thornsister_vortex = nil
				blackboard.thornsister_vortex_ext = nil
			else
				LocomotionUtils.set_animation_driven_movement(unit, true, true, false)
			end
		end
	elseif state == "umbral_leap_landing" then
		Managers.state.network:anim_event(unit, "idle")

		local locomotion_extension = blackboard.locomotion_extension

		locomotion_extension:set_wanted_velocity(Vector3.zero())
		locomotion_extension:set_affected_by_gravity(true)
		locomotion_extension:set_movement_type("constrained_by_mover")

		blackboard.umbral_leap_velocity = nil
		blackboard.landing_finished = nil
		blackboard.in_vortex_state = "landed"
		blackboard.stagger = false

		return "done"
	elseif state == "waiting_to_land" then
		if not blackboard.breed.die_on_vortex_land and blackboard.landing_finished then
			local locomotion_extension = blackboard.locomotion_extension

			locomotion_extension:set_wanted_velocity(Vector3.zero())

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

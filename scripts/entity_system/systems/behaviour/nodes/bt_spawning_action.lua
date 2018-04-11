require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTSpawningAction = class(BTSpawningAction, BTNode)
BTSpawningAction.init = function (self, ...)
	BTSpawningAction.super.init(self, ...)

	return 
end
BTSpawningAction.name = "BTSpawningAction"
local unit_alive = Unit.alive
BTSpawningAction.enter = function (self, unit, blackboard, t)
	Unit.set_animation_root_mode(unit, "ignore")

	if blackboard.spawn_type == "horde" then
		local ai_extension = ScriptUnit.extension(unit, "ai_system")
		local animation_translation_scale = 1 / ai_extension.size_variation(ai_extension)

		LocomotionUtils.set_animation_translation_scale(unit, Vector3(animation_translation_scale, animation_translation_scale, animation_translation_scale))

		local locomotion_extension = blackboard.locomotion_extension

		locomotion_extension.use_lerp_rotation(locomotion_extension, false)
		locomotion_extension.set_movement_type(locomotion_extension, "script_driven")
		LocomotionUtils.set_animation_driven_movement(unit, true)
	else
		blackboard.spawning_finished = true
	end

	local network_manager = Managers.state.network
	local breed = blackboard.breed
	local wield_inventory_on_spawn = breed.wield_inventory_on_spawn
	local is_horde = blackboard.spawn_type == "horde" or blackboard.spawn_type == "horde_hidden"

	if (is_horde or wield_inventory_on_spawn) and ScriptUnit.has_extension(unit, "ai_inventory_system") then
		local unit_id = network_manager.unit_game_object_id(network_manager, unit)

		network_manager.network_transmit:send_rpc_all("rpc_ai_inventory_wield", unit_id, 1)
	end

	spawn_animation = blackboard.spawn_animation or breed.default_spawn_animation or "idle"

	network_manager.anim_event(network_manager, unit, spawn_animation)

	blackboard.spawn_last_pos = Vector3Box(POSITION_LOOKUP[unit])
	blackboard.spawn_immovable_time = 0

	return 
end
BTSpawningAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.spawn = nil
	blackboard.spawning_finished = nil
	blackboard.spawn_last_pos = nil
	local ai_navigation = blackboard.navigation_extension

	ai_navigation.init_position(ai_navigation)

	if (blackboard.spawn_type == "horde" or blackboard.spawn_type == "horde_hidden") and not destroy then
		local ai_extension = ScriptUnit.extension(unit, "ai_system")

		ai_extension.force_enemy_detection(ai_extension, t)

		if unit_alive(blackboard.target_unit) then
			local ai_slot_system = Managers.state.entity:system("ai_slot_system")

			ai_slot_system.do_slot_search(ai_slot_system, unit, true)
		else
			blackboard.target_unit = nil
		end
	end

	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension.set_movement_type(locomotion_extension, "snap_to_navmesh")

	if blackboard.spawn_type == "horde" then
		locomotion_extension.use_lerp_rotation(locomotion_extension, true)
		LocomotionUtils.set_animation_driven_movement(unit, false)

		blackboard.spawn_landing_state = nil
		blackboard.jump_climb_finished = nil
	end

	if blackboard.constrained_on_client then
		blackboard.constrained_on_client = nil

		LocomotionUtils.constrain_on_clients(unit, false, Vector3.zero(), Vector3.zero())
	end

	LocomotionUtils.set_animation_translation_scale(unit, Vector3(1, 1, 1))

	return 
end
BTSpawningAction.run = function (self, unit, blackboard, t, dt)
	local locomotion_extension = blackboard.locomotion_extension
	local spawning_finished = blackboard.spawning_finished
	local nav_world = blackboard.nav_world
	local current_pos = POSITION_LOOKUP[unit]

	if spawning_finished and not blackboard.spawn_landing_state then
		local is_position_on_navmesh, altitude = GwNavQueries.triangle_from_position(nav_world, current_pos, 0.5, 0.5)

		if is_position_on_navmesh then
			local spawn_position = Vector3(current_pos.x, current_pos.y, altitude)
			local network_manager = Managers.state.network
			local unit_id = network_manager.unit_game_object_id(network_manager, unit)

			network_manager.network_transmit:send_rpc_clients("rpc_teleport_unit_to", unit_id, spawn_position, Unit.local_rotation(unit, 0))
			locomotion_extension.teleport_to(locomotion_extension, spawn_position)

			return "done"
		else
			locomotion_extension.set_affected_by_gravity(locomotion_extension, true)
			locomotion_extension.set_movement_type(locomotion_extension, "script_driven")

			blackboard.spawn_landing_state = "falling"
			is_position_on_navmesh, altitude = GwNavQueries.triangle_from_position(nav_world, current_pos, 0, 20)

			if is_position_on_navmesh then
				local min_pos = Vector3(current_pos.x, current_pos.y, altitude)

				LocomotionUtils.constrain_on_clients(unit, true, min_pos, current_pos)

				blackboard.constrained_on_client = true
				blackboard.landing_destination = Vector3Box(current_pos.x, current_pos.y, altitude)

				if not blackboard.spawn_animation then
					Managers.state.network:anim_event(unit, "idle")
				end
			else
				if BUILD ~= "release" then
					QuickDrawerStay:sphere(current_pos + Vector3.up(), 1, Colors.get("orange"))
					QuickDrawerStay:vector(current_pos, Vector3.down(), Colors.get("orange"))
					QuickDrawerStay:vector(current_pos, Vector3.down() * 20, Colors.get("orange"))
					Debug.world_sticky_text(current_pos, "BTSpawningAction couldn't find place to land.", Colors.get("orange"))
				end

				local damage_type = "forced"
				local damage_direction = Vector3(0, 0, -1)

				AiUtils.kill_unit(unit, nil, nil, damage_type, damage_direction)

				return 
			end
		end
	end

	if blackboard.spawn_landing_state == "falling" then
		local fall_speed = locomotion_extension.current_velocity(locomotion_extension).z
		local landing_destination = blackboard.landing_destination:unbox()
		local next_height = current_pos.z + fall_speed * dt * 2

		if next_height < landing_destination.z then
			local network_manager = Managers.state.network
			local unit_id = network_manager.unit_game_object_id(network_manager, unit)

			network_manager.network_transmit:send_rpc_clients("rpc_teleport_unit_to", unit_id, landing_destination, Unit.local_rotation(unit, 0))
			locomotion_extension.teleport_to(locomotion_extension, landing_destination)
			locomotion_extension.set_movement_type(locomotion_extension, "snap_to_navmesh")

			if blackboard.spawn_animation then
				LocomotionUtils.set_animation_driven_movement(unit, true, false, false)
				Managers.state.network:anim_event(unit, "jump_down_land")

				blackboard.spawn_landing_state = "landing"
			else
				return "done"
			end
		end
	elseif blackboard.spawn_landing_state == "landing" and blackboard.jump_climb_finished then
		return "done"
	end

	return "running"
end

return 

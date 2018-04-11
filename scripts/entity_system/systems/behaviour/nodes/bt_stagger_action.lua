require("scripts/entity_system/systems/behaviour/nodes/bt_node")

BTStaggerAction = class(BTStaggerAction, BTNode)
BTStaggerAction.init = function (self, ...)
	BTStaggerAction.super.init(self, ...)

	return 
end
BTStaggerAction.name = "BTStaggerAction"
local DEFAULT_IN_AIR_MOVER_CHECK_RADIUS = 0.35
BTStaggerAction.enter = function (self, unit, blackboard, t)
	local locomotion_extension = blackboard.locomotion_extension
	local navigation_extension = blackboard.navigation_extension

	navigation_extension.set_enabled(navigation_extension, false)

	local breed = blackboard.breed
	local was_already_in_stagger = blackboard.staggering_id and blackboard.stagger ~= blackboard.staggering_id

	if not was_already_in_stagger then
		local overlap_radius = breed.stagger_in_air_mover_check_radius or DEFAULT_IN_AIR_MOVER_CHECK_RADIUS
		local overlap_pos = POSITION_LOOKUP[unit]
		local overlap_size = Vector3(overlap_radius, 1, overlap_radius)
		local overlap_rotation = Quaternion.look(Vector3.down(), Vector3.forward())
		local world = blackboard.world
		local physics_world = World.get_data(world, "physics_world")
		local _, actor_count = PhysicsWorld.immediate_overlap(physics_world, "position", overlap_pos, "rotation", overlap_rotation, "size", overlap_size, "shape", "capsule", "types", "both", "collision_filter", "filter_environment_overlap", "use_global_table")

		if actor_count == 0 then
			local override_mover_move_distance = breed.override_mover_move_distance

			locomotion_extension.set_movement_type(locomotion_extension, "constrained_by_mover", override_mover_move_distance)
		end
	end

	blackboard.stagger_anim_done = false
	blackboard.stagger_hit_wall = nil
	blackboard.staggering_id = blackboard.stagger
	blackboard.attack_aborted = true
	blackboard.move_state = "stagger"
	local action_data = self._tree_node.action_data
	blackboard.action = action_data
	local ai_base_extension = ScriptUnit.extension(unit, "ai_system")

	ai_base_extension.increase_stagger_count(ai_base_extension)

	local stagger_anims, idle_event, post_stagger_event = nil
	local custom_enter_function = action_data.custom_enter_function

	if custom_enter_function then
		stagger_anims, idle_event, post_stagger_event = custom_enter_function(unit, blackboard, t, action_data)

		if post_stagger_event then
			blackboard.post_stagger_event = post_stagger_event
		end
	else
		idle_event = "idle"
		stagger_anims = action_data.stagger_anims[blackboard.stagger_type]
	end

	if action_data.custom_weakspot_function and blackboard.stagger_type == 8 then
		action_data.custom_weakspot_function(unit, blackboard, t, action_data)
	end

	local impact_dir = blackboard.stagger_direction:unbox()
	local push_anim, impact_rot = self._select_animation(self, unit, blackboard, impact_dir, stagger_anims)

	Unit.set_local_rotation(unit, 0, impact_rot)

	local network_manager = Managers.state.network

	network_manager.anim_event(network_manager, unit, "to_combat")

	if action_data.scale_animation_speeds then
		local anim_scale = action_data.stagger_animation_scale or blackboard.stagger_animation_scale or 1

		network_manager.anim_event_with_variable_float(network_manager, unit, push_anim, "stagger_scale", anim_scale)
	else
		network_manager.anim_event(network_manager, unit, push_anim)
	end

	network_manager.anim_event(network_manager, unit, idle_event)

	local scale = blackboard.stagger_length

	LocomotionUtils.set_animation_translation_scale(unit, Vector3(scale, scale, scale))

	if was_already_in_stagger then
		local unit_id = network_manager.unit_game_object_id(network_manager, unit)
		local unit_position = POSITION_LOOKUP[unit]
		local unit_rotation = impact_rot

		network_manager.network_transmit:send_rpc_clients("rpc_teleport_unit_to", unit_id, unit_position, unit_rotation)
	else
		LocomotionUtils.set_animation_driven_movement(unit, true, true, false)
	end

	if blackboard.stagger_type == 3 or blackboard.stagger_type == 6 then
		local hit_reaction_extension = ScriptUnit.extension(unit, "hit_reaction_system")
		hit_reaction_extension.force_ragdoll_on_death = true
	end

	locomotion_extension.set_rotation_speed(locomotion_extension, 100)
	locomotion_extension.set_wanted_velocity(locomotion_extension, Vector3.zero())
	locomotion_extension.use_lerp_rotation(locomotion_extension, false)

	blackboard.spawn_to_running = nil

	return 
end
BTStaggerAction._select_animation = function (self, unit, blackboard, impact_vec, stagger_anims)
	local impact_dir = Vector3.normalize(impact_vec)
	local my_fwd = Quaternion.forward(Unit.local_rotation(unit, 0))
	local dot = Vector3.dot(my_fwd, impact_dir)
	dot = math.clamp(dot, -1, 1)
	local angle = math.acos(dot)
	local action = blackboard.action
	local locomotion_extension = blackboard.locomotion_extension
	local velocity = locomotion_extension.current_velocity(locomotion_extension)
	local impact_rot, anim_table = nil
	local moving_stagger_distance = action.moving_stagger_minimum_destination_distance
	local in_moving_stagger_distane = moving_stagger_distance and moving_stagger_distance < blackboard.destination_dist
	local moving_stagger_threshold = action.moving_stagger_threshold
	local velocy_my_fwd_dot = Vector3.dot(velocity, my_fwd)
	local in_moving_stagger_velocity = moving_stagger_threshold and moving_stagger_threshold < velocy_my_fwd_dot
	local moving_stagger = false

	if not blackboard.always_stagger_suffered then
		moving_stagger = in_moving_stagger_distane and in_moving_stagger_velocity
	end

	blackboard.always_stagger_suffered = nil

	if impact_vec.z == -1 and stagger_anims.dwn then
		impact_dir.z = 0
		impact_rot = Quaternion.look(-impact_dir)
		anim_table = (moving_stagger and stagger_anims.moving_dwn) or stagger_anims.dwn
	else
		impact_dir.z = 0

		if math.pi * 0.75 < angle then
			impact_rot = Quaternion.look(-impact_dir)
			anim_table = (moving_stagger and stagger_anims.moving_bwd) or stagger_anims.bwd
		elseif angle < math.pi * 0.25 then
			impact_rot = Quaternion.look(impact_dir)
			anim_table = (moving_stagger and stagger_anims.moving_fwd) or stagger_anims.fwd
		elseif 0 < Vector3.cross(my_fwd, impact_dir).z then
			local dir = Vector3.cross(Vector3(0, 0, -1), impact_dir)
			impact_rot = Quaternion.look(dir)
			anim_table = (moving_stagger and stagger_anims.moving_left) or stagger_anims.left
		else
			local dir = Vector3.cross(Vector3(0, 0, 1), impact_dir)
			impact_rot = Quaternion.look(dir)
			anim_table = (moving_stagger and stagger_anims.moving_right) or stagger_anims.right
		end
	end

	local num_anims = #anim_table
	local index = Math.random(1, num_anims)
	local anim = anim_table[index]

	if anim == blackboard.last_stagger_anim then
		anim = anim_table[index % num_anims + 1]
	end

	blackboard.last_stagger_anim = anim

	return anim, impact_rot
end
BTStaggerAction.clean_blackboard = function (self, blackboard)
	blackboard.stagger_type = nil
	blackboard.stagger = nil
	blackboard.pushing_unit = nil
	blackboard.staggering_id = nil
	blackboard.stagger_direction = nil
	blackboard.stagger_length = nil
	blackboard.stagger_time = nil
	blackboard.stagger_immune_time = nil
	blackboard.heavy_stagger_immune_time = nil
	blackboard.stagger_anim_done = nil
	blackboard.stagger_hit_wall = nil
	blackboard.stagger_ignore_anim_cb = nil
	blackboard.fallen_stagger = nil
	blackboard.action = nil

	return 
end
BTStaggerAction.leave = function (self, unit, blackboard, t, reason, destroy)
	self.clean_blackboard(self, blackboard)
	LocomotionUtils.set_animation_driven_movement(unit, false, false)

	if ScriptUnit.has_extension(unit, "ai_shield_system") then
		local shield_extension = ScriptUnit.extension(unit, "ai_shield_system")

		shield_extension.set_is_blocking(shield_extension, true)
	end

	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension.set_rotation_speed(locomotion_extension, 10)
	locomotion_extension.set_wanted_rotation(locomotion_extension, nil)
	locomotion_extension.set_movement_type(locomotion_extension, "snap_to_navmesh")
	locomotion_extension.use_lerp_rotation(locomotion_extension, true)
	locomotion_extension.set_wanted_velocity(locomotion_extension, Vector3.zero())
	LocomotionUtils.set_animation_translation_scale(unit, Vector3(1, 1, 1))

	local network_manager = Managers.state.network
	local post_stagger_anim_event = nil

	if blackboard.post_stagger_event then
		post_stagger_anim_event = blackboard.post_stagger_event
		blackboard.post_stagger_event = nil
	else
		post_stagger_anim_event = "stagger_finished"
	end

	network_manager.anim_event(network_manager, unit, post_stagger_anim_event)

	local navigation_extension = blackboard.navigation_extension

	navigation_extension.set_enabled(navigation_extension, true)

	local run_on_stagger_action_done = blackboard.breed.run_on_stagger_action_done

	if run_on_stagger_action_done then
		run_on_stagger_action_done(unit, blackboard, t)
	end

	local hit_reaction_extension = ScriptUnit.has_extension(unit, "hit_reaction_system")
	hit_reaction_extension.force_ragdoll_on_death = nil

	return 
end
BTStaggerAction.run = function (self, unit, blackboard, t, dt)
	if blackboard.stagger ~= blackboard.staggering_id then
		self.enter(self, unit, blackboard, t)
	end

	local locomotion_extension = blackboard.locomotion_extension
	local stagger_anim_done = blackboard.stagger_anim_done

	if blackboard.fallen_stagger then
		if blackboard.fallen_stagger_direction and blackboard.fallen_stagger_timer and t < blackboard.fallen_stagger_timer then
			local impact_dir = blackboard.fallen_stagger_direction:unbox()

			locomotion_extension.set_rotation_speed(locomotion_extension, 10)
			LocomotionUtils.set_animation_driven_movement(unit, false, false, false)
			locomotion_extension.use_lerp_rotation(locomotion_extension, true)
			locomotion_extension.set_wanted_velocity(locomotion_extension, impact_dir * (blackboard.fallen_stagger_timer - t + 1))

			blackboard.fallen_stagger_direction = nil
		elseif blackboard.fallen_stagger_timer and blackboard.fallen_stagger_timer < t then
			locomotion_extension.set_rotation_speed(locomotion_extension, 100)
			locomotion_extension.use_lerp_rotation(locomotion_extension, false)
			LocomotionUtils.set_animation_driven_movement(unit, true, true, false)

			blackboard.fallen_stagger = nil

			locomotion_extension.set_wanted_velocity(locomotion_extension, Vector3.zero())
		end
	end

	if locomotion_extension.movement_type ~= "constrained_by_mover" and not blackboard.stagger_hit_wall then
		Profiler.start("checking navmesh")

		local position = POSITION_LOOKUP[unit]
		local velocity = locomotion_extension.current_velocity(locomotion_extension)
		local nav_world = blackboard.nav_world
		local world = blackboard.world
		local physics_world = World.physics_world(world)
		local navigation_extension = blackboard.navigation_extension
		local traverse_logic = navigation_extension.traverse_logic(navigation_extension)
		local result = LocomotionUtils.navmesh_movement_check(position, velocity, nav_world, physics_world, traverse_logic)

		if result == "navmesh_hit_wall" then
			blackboard.stagger_hit_wall = true
		elseif result == "navmesh_use_mover" then
			local breed = blackboard.breed
			local override_mover_move_distance = breed.override_mover_move_distance
			local ignore_forced_mover_kill = true
			local successful = locomotion_extension.set_movement_type(locomotion_extension, "constrained_by_mover", override_mover_move_distance, ignore_forced_mover_kill)

			if not successful then
				local mover = Unit.mover(unit)
				local radius = Mover.radius(mover)

				QuickDrawerStay:sphere(position, radius, Colors.get("red"))
				QuickDrawerStay:line(position, position + Vector3(0, 0, 5), Colors.get("red"))

				local debug_text = string.format("LD should check the Navmesh here, Mover separation failed for %s!", breed.name)

				Debug.world_sticky_text(position + Vector3(0, 0, 5), debug_text, "red")
				locomotion_extension.set_movement_type(locomotion_extension, "snap_to_navmesh")

				blackboard.stagger_hit_wall = true
			end
		end

		Profiler.stop("checking navmesh")
	end

	stagger_time_finished = blackboard.stagger_time < t
	local stagger_ignore_anim_cb = blackboard.stagger_ignore_anim_cb

	if blackboard.stagger_immune_time and blackboard.stagger_immune_time < t then
		blackboard.stagger_immune_time = nil
	end

	if blackboard.heavy_stagger_immune_time and blackboard.heavy_stagger_immune_time < t then
		blackboard.heavy_stagger_immune_time = nil
	end

	if stagger_time_finished and (stagger_ignore_anim_cb or stagger_anim_done) then
		return "done"
	else
		return "running"
	end

	return 
end

return 

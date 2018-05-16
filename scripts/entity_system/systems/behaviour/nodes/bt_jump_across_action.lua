require("scripts/entity_system/systems/behaviour/nodes/bt_node")

local function debug_graph()
	local graph = Managers.state.debug.graph_drawer:graph("BTJumpAcrossAction")

	if graph == nil then
		graph = Managers.state.debug.graph_drawer:create_graph("BTJumpAcrossAction", {
			"time",
			"unit altitude"
		})
	end

	return graph
end

local function randomize(event)
	if type(event) == "table" then
		return event[Math.random(1, #event)]
	else
		return event
	end
end

BTJumpAcrossAction = class(BTJumpAcrossAction, BTNode)

BTJumpAcrossAction.init = function (self, ...)
	BTJumpAcrossAction.super.init(self, ...)
end

BTJumpAcrossAction.name = "BTJumpAcrossAction"

BTJumpAcrossAction.enter = function (self, unit, blackboard, t)
	local drawer = Managers.state.debug:drawer({
		mode = "retained",
		name = "BTJumpAcrossAction"
	})

	drawer:reset()

	local next_smart_object_data = blackboard.next_smart_object_data
	local entrance_pos = next_smart_object_data.entrance_pos:unbox()
	local exit_pos = next_smart_object_data.exit_pos:unbox()
	blackboard.jump_entrance_pos = Vector3Box(entrance_pos)
	blackboard.jump_exit_pos = Vector3Box(exit_pos)
	blackboard.jump_ledge_lookat_direction = Vector3Box(Vector3.normalize(Vector3.flat(exit_pos - entrance_pos)))
	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:set_affected_by_gravity(false)
	locomotion_extension:set_movement_type("snap_to_navmesh")
	locomotion_extension:set_rotation_speed(10)

	blackboard.jump_state = "moving_to_ledge"

	if script_data.ai_debug_smartobject then
		Unit.set_animation_logging(unit, true)

		local unit_position = POSITION_LOOKUP[unit]

		debug_graph():reset()
		debug_graph():set_active(true)
		debug_graph():add_annotation({
			color = "green",
			x = t,
			y = unit_position.z,
			text = "starting BTJumpAcrossAction" .. tostring(unit_position)
		})
	else
		debug_graph():set_active(false)
	end
end

BTJumpAcrossAction.leave = function (self, unit, blackboard, t, reason, destroy)
	blackboard.jump_spline_ground = nil
	blackboard.jump_spline_ledge = nil
	blackboard.jump_entrance_pos = nil
	blackboard.jump_state = nil
	blackboard.is_jumping = nil
	blackboard.jump_ledge_lookat_direction = nil
	blackboard.jump_entrance_pos = nil
	blackboard.jump_exit_pos = nil
	blackboard.is_smart_objecting = nil
	blackboard.jump_start_finished = nil

	LocomotionUtils.set_animation_driven_movement(unit, false, true)
	LocomotionUtils.set_animation_translation_scale(unit, Vector3(1, 1, 1))

	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension:set_movement_type("snap_to_navmesh")

	local navigation_extension = blackboard.navigation_extension

	navigation_extension:set_enabled(true)

	local hit_reaction_extension = ScriptUnit.extension(unit, "hit_reaction_system")
	hit_reaction_extension.force_ragdoll_on_death = nil
	slot9 = navigation_extension:is_using_smart_object() and navigation_extension:use_smart_object(false)
end

BTJumpAcrossAction.run = function (self, unit, blackboard, t, dt)
	local navigation_extension = blackboard.navigation_extension
	local locomotion_extension = blackboard.locomotion_extension
	local unit_position = POSITION_LOOKUP[unit]
	local entrance_pos = blackboard.jump_entrance_pos:unbox()
	local exit_pos = blackboard.jump_exit_pos:unbox()

	if script_data.ai_debug_smartobject then
		self:_debug_draw_update(unit, blackboard, t)
	end

	if blackboard.jump_state == "moving_to_ledge" and Vector3.distance_squared(entrance_pos, unit_position) < 1 then
		LocomotionUtils.set_animation_driven_movement(unit, false)
		locomotion_extension:set_wanted_velocity(Vector3.zero())
		locomotion_extension:set_movement_type("script_driven")
		navigation_extension:set_enabled(false)

		if navigation_extension:use_smart_object(true) then
			blackboard.is_smart_objecting = true
			blackboard.is_jumping = true
			blackboard.jump_state = "moving_towards_smartobject_entrance"
		else
			print("BTJumpAcrossAction - failing to use smart object")

			return "failed"
		end
	end

	if blackboard.jump_state == "moving_towards_smartobject_entrance" then
		local move_target = entrance_pos
		local look_direction_wanted = blackboard.jump_ledge_lookat_direction:unbox()
		local wanted_rotation = Quaternion.look(look_direction_wanted)
		local vector_to_target = move_target - unit_position
		local distance_to_target = Vector3.length(vector_to_target)

		if distance_to_target > 0.1 then
			local speed = blackboard.breed.run_speed

			if distance_to_target < speed * dt then
				speed = distance_to_target / dt
			end

			local direction_to_target = Vector3.normalize(vector_to_target)
			local wanted_velocity = direction_to_target * speed

			locomotion_extension:set_wanted_velocity(wanted_velocity)
			locomotion_extension:set_wanted_rotation(wanted_rotation)

			if script_data.ai_debug_smartobject then
				local drawer = Managers.state.debug:drawer({
					mode = "immediate",
					name = "BTJumpAcrossAction2"
				})

				drawer:vector(unit_position + Vector3.up() * 0.3, vector_to_target)
				drawer:sphere(move_target, 0.3, Colors.get("blue"))
			end
		else
			locomotion_extension:teleport_to(move_target, wanted_rotation)
			LocomotionUtils.set_animation_driven_movement(unit, true)

			local jump_vector = exit_pos - entrance_pos
			local horizontal_length = Vector3.length(Vector3.flat(jump_vector))
			local smart_object_settings = SmartObjectSettings.templates[blackboard.breed.smart_object_template]
			local jump_across_anim_thresholds = smart_object_settings.jump_across_anim_thresholds

			for i = 1, #jump_across_anim_thresholds, 1 do
				local jump_anim_threshold = jump_across_anim_thresholds[i]

				if horizontal_length < jump_anim_threshold.horizontal_threshold then
					Managers.state.network:anim_event(unit, randomize(jump_anim_threshold.animation_jump))

					local animation_distance = jump_anim_threshold.horizontal_length
					local forward_factor = horizontal_length / animation_distance
					local height_factor = jump_vector.z

					LocomotionUtils.set_animation_translation_scale(unit, Vector3(forward_factor, forward_factor, height_factor))

					break
				end
			end

			local hit_reaction_extension = ScriptUnit.extension(unit, "hit_reaction_system")
			hit_reaction_extension.force_ragdoll_on_death = true
			blackboard.jump_state = "waiting_to_reach_end"
		end
	end

	if blackboard.jump_state == "waiting_to_reach_end" and blackboard.jump_start_finished then
		navigation_extension:set_navbot_position(exit_pos)
		locomotion_extension:teleport_to(exit_pos)
		Managers.state.network:anim_event(unit, "move_fwd")

		blackboard.spawn_to_running = true
		blackboard.jump_state = "done"
	end

	if blackboard.jump_state == "done" then
		blackboard.jump_state = "done_for_reals"
	elseif blackboard.jump_state == "done_for_reals" then
		blackboard.jump_state = "done_for_reals2"
	elseif blackboard.jump_state == "done_for_reals2" then
		return "done"
	end

	return "running"
end

BTJumpAcrossAction._debug_draw_update = function (self, unit, blackboard, t)
	local drawer = Managers.state.debug:drawer({
		mode = "immediate",
		name = "BTJumpAcrossAction2"
	})
	local unit_position = POSITION_LOOKUP[unit]
	local jump_entrance_pos = blackboard.jump_entrance_pos:unbox()
	local jump_exit_pos = blackboard.jump_exit_pos:unbox()

	Debug.text("BTJumpAcrossAction state=           %s", blackboard.jump_state)
	Debug.text("BTJumpAcrossAction entrance_pos=%s", tostring(jump_entrance_pos))
	Debug.text("BTJumpAcrossAction exit_pos=        %s", tostring(jump_exit_pos))
	Debug.text("BTJumpAcrossAction pos=             %s", tostring(unit_position))
	drawer:sphere(jump_entrance_pos, 0.3, Colors.get("red"))
	drawer:sphere(jump_exit_pos, 0.3, Colors.get("red"))
	drawer:sphere(unit_position, 0.3 + math.sin(t * 5) * 0.01, Colors.get("purple"))
	debug_graph():add_point(t, unit_position.z)
end

return

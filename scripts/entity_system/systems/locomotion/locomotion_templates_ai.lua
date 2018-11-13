LocomotionTemplates = LocomotionTemplates or {}
local LocomotionTemplates = LocomotionTemplates
local detailed_profiler_start, detailed_profiler_stop = nil
local DETAILED_PROFILING = true

if DETAILED_PROFILING then
else
	function detailed_profiler_start()
		return
	end

	function detailed_profiler_stop()
		return
	end
end

LocomotionTemplates.AILocomotionExtension = {
	init = function (data, nav_world)
		data.nav_world = nav_world
		data.destroy_units = {}
		data.all_update_units = {}
		data.affected_by_gravity_update_units = {}
		data.animation_update_units = {}
		data.animation_and_script_update_units = {}
		data.rotation_speed_modifier_update_units = {}
		data.script_driven_update_units = {}
		data.snap_to_navmesh_update_units = {}
		data.get_to_navmesh_update_units = {}
		data.mover_constrained_update_units = {}
	end,
	update = function (data, t, dt)
		LocomotionTemplates.AILocomotionExtension.validate2(data, t, dt)
		LocomotionTemplates.AILocomotionExtension.update_alive(data, t, dt)
		LocomotionTemplates.AILocomotionExtension.update_velocity(data, t, dt)
		LocomotionTemplates.AILocomotionExtension.update_animation_driven_units(data, t, dt)
		LocomotionTemplates.AILocomotionExtension.update_gravity(data, t, dt)
		LocomotionTemplates.AILocomotionExtension.update_rotation(data, t, dt)
		LocomotionTemplates.AILocomotionExtension.update_position(data, t, dt)
		LocomotionTemplates.AILocomotionExtension.update_out_of_range(data, t, dt)
		LocomotionTemplates.AILocomotionExtension.update_network(data, t, dt)
	end,
	validate2 = function (data, t, dt)
		local all_update_units = data.all_update_units
		local snap_to_navmesh_update_units = data.snap_to_navmesh_update_units
		local get_to_navmesh_update_units = data.get_to_navmesh_update_units
		local mover_constrained_update_units = data.mover_constrained_update_units
		local script_driven_update_units = data.script_driven_update_units

		for unit, extension in pairs(all_update_units) do
			assert(script_driven_update_units[unit] ~= nil or snap_to_navmesh_update_units[unit] ~= nil or mover_constrained_update_units[unit] ~= nil or get_to_navmesh_update_units[unit] ~= nil)

			local wanted_velocity = extension._wanted_velocity

			if wanted_velocity then
				fassert(Vector3.is_valid(wanted_velocity), "Invalid velocity %s", wanted_velocity)
			end
		end
	end,
	update_alive = function (data, t, dt)
		for unit, extension in pairs(data.destroy_units) do
			data.destroy_units[unit] = nil
			data.all_update_units[unit] = nil
			data.affected_by_gravity_update_units[unit] = nil
			data.animation_update_units[unit] = nil
			data.animation_and_script_update_units[unit] = nil
			data.rotation_speed_modifier_update_units[unit] = nil
			data.script_driven_update_units[unit] = nil
			data.snap_to_navmesh_update_units[unit] = nil
			data.get_to_navmesh_update_units[unit] = nil
			data.mover_constrained_update_units[unit] = nil
		end
	end,
	update_velocity = function (data, t, dt)
		for unit, extension in pairs(data.all_update_units) do
			extension._wanted_velocity = extension._wanted_velocity or extension._velocity:unbox()
		end
	end,
	update_gravity = function (data, t, dt)
		for unit, extension in pairs(data.affected_by_gravity_update_units) do
			extension._wanted_velocity.z = extension._velocity.z - extension._gravity * dt
		end
	end,
	update_animation_driven_units = function (data, t, dt)
		for unit, extension in pairs(data.animation_update_units) do
			local wanted_pose = Unit.animation_wanted_root_pose(unit)
			local wanted_position = Matrix4x4.translation(wanted_pose)
			local wanted_rotation = Matrix4x4.rotation(wanted_pose)
			local current_position = Unit.local_position(unit, 0)
			local current_rotation = Unit.local_rotation(unit, 0)
			local up_vector = Quaternion.up(current_rotation)
			local current_rotation_inv = Quaternion.inverse(current_rotation)
			local delta_rotation = Quaternion.multiply(current_rotation_inv, wanted_rotation)
			local yaw_rotation_radians = Quaternion.yaw(delta_rotation)
			yaw_rotation_radians = yaw_rotation_radians * extension._animation_rotation_scale
			wanted_rotation = Quaternion.multiply(current_rotation, Quaternion(up_vector, yaw_rotation_radians))
			local wanted_velocity = (wanted_position - current_position) / dt
			wanted_velocity = Vector3.multiply_elements(wanted_velocity, extension._animation_translation_scale:unbox())
			extension._wanted_velocity = wanted_velocity
			extension._wanted_rotation = wanted_rotation
		end

		for unit, extension in pairs(data.animation_and_script_update_units) do
			local wanted_pose = Unit.animation_wanted_root_pose(unit)
			local wanted_position = Matrix4x4.translation(wanted_pose)
			local current_position = Unit.local_position(unit, 0)
			local wanted_velocity = (wanted_position - current_position) / dt
			wanted_velocity = Vector3.multiply_elements(wanted_velocity, extension._animation_translation_scale:unbox())
			extension._wanted_velocity = wanted_velocity
		end
	end,
	update_rotation = function (data, t, dt)
		local Vector3_length_squared = Vector3.length_squared
		local Vector3_flat = Vector3.flat
		local Quaternion_look = Quaternion.look
		local up_vector = Vector3.up()
		local Unit_set_local_rotation = Unit.set_local_rotation
		local Unit_local_rotation = Unit.local_rotation
		local Quaternion_lerp = Quaternion.lerp

		for unit, extension in pairs(data.all_update_units) do
			repeat
				local wanted_velocity = extension._wanted_velocity
				local wanted_rotation = extension._wanted_rotation

				if not wanted_rotation then
					local flat_velocity = Vector3_flat(wanted_velocity)

					if Vector3_length_squared(flat_velocity) < 0.010000000000000002 then
						break
					end

					wanted_rotation = Quaternion_look(flat_velocity, up_vector)
				end

				extension._wanted_rotation = nil

				if extension._lerp_rotation then
					if extension._rotation_speed * extension._rotation_speed_modifier * dt > 1 then
						local new_rotation = wanted_rotation

						Unit_set_local_rotation(unit, 0, new_rotation)
					else
						local current_rotation = Unit_local_rotation(unit, 0)
						local new_rotation = Quaternion_lerp(current_rotation, wanted_rotation, extension._rotation_speed * extension._rotation_speed_modifier * dt)

						Unit_set_local_rotation(unit, 0, new_rotation)
					end
				else
					Unit_set_local_rotation(unit, 0, wanted_rotation)
				end
			until true
		end

		for unit, extension in pairs(data.rotation_speed_modifier_update_units) do
			local lerp_total_time = extension._rotation_speed_modifier_lerp_end_time - extension._rotation_speed_modifier_lerp_start_time
			local time_in_lerp = math.max(0, t - extension._rotation_speed_modifier_lerp_start_time)
			local lerp_percentage = time_in_lerp / lerp_total_time

			if lerp_percentage >= 1 then
				extension._rotation_speed_modifier = 1
				extension._rotation_speed_modifier_lerp_end_time = nil
				extension._rotation_speed_modifier_lerp_start_time = nil
				extension._rotation_speed_modifier_lerp_start_value = nil
				data.rotation_speed_modifier_update_units[unit] = nil
			else
				extension._rotation_speed_modifier = math.lerp(extension._rotation_speed_modifier_lerp_start_value, 1, lerp_percentage)
			end
		end
	end,
	update_position = function (data, t, dt)
		local Unit_local_position = Unit.local_position
		local Unit_set_local_position = Unit.set_local_position
		local Unit_mover = Unit.mover
		local Mover_move = Mover.move
		local nav_world = data.nav_world
		local MIN_SPEED_SQ = 0.0001

		if dt == 0 then
			dt = 0.00016666666666666666
		end

		for unit, extension in pairs(data.script_driven_update_units) do
			local wanted_velocity = extension._wanted_velocity
			local current_position = Unit_local_position(unit, 0)
			local final_position = current_position + wanted_velocity * dt

			extension._velocity:store(wanted_velocity)
			Unit_set_local_position(unit, 0, final_position)
		end

		for unit, extension in pairs(data.get_to_navmesh_update_units) do
			local final_velocity, final_position = nil
			local current_position = POSITION_LOOKUP[unit]
			local blackboard = BLACKBOARDS[unit]
			local has_reached_destination = blackboard.navigation_extension:has_reached_destination(0.1)

			if has_reached_destination then
				final_velocity = Vector3(0, 0, 0)
				final_position = current_position
			else
				local is_position_on_navmesh, altitude = GwNavQueries.triangle_from_position(nav_world, current_position, 0.5, 0.5)

				if is_position_on_navmesh then
					data.get_to_navmesh_update_units[unit] = nil
					data.snap_to_navmesh_update_units[unit] = extension
				else
					local mesh_position = GwNavQueries.inside_position_from_outside_position(nav_world, current_position, 1, 1, 5)

					if mesh_position then
						if data.animation_update_units[unit] then
							final_velocity = extension._wanted_velocity
							final_position = current_position - final_velocity * dt
						else
							local speed = blackboard.breed.run_speed
							local to_goal = current_position - mesh_position
							final_velocity = Vector3.normalize(to_goal) * speed
							final_position = current_position - final_velocity * dt
							final_velocity.z = 0
						end
					else
						final_velocity = Vector3(0, 0, 0)
						final_position = current_position
					end

					extension._velocity:store(final_velocity)
					Unit_set_local_position(unit, 0, final_position)
				end
			end
		end

		local Vector3_length_squared = Vector3.length_squared
		local GwNavQueries_move_on_navmesh = GwNavQueries.move_on_navmesh
		local GwNavQueries_triangle_from_position = GwNavQueries.triangle_from_position

		for unit, extension in pairs(data.snap_to_navmesh_update_units) do
			local wanted_velocity = extension._wanted_velocity
			local current_position = Unit_local_position(unit, 0)
			local wanted_velocity_flat_size_sq = Vector3_length_squared(Vector3.flat(wanted_velocity))
			local final_position, final_velocity = nil
			final_position = GwNavQueries_move_on_navmesh(nav_world, current_position, wanted_velocity, dt)
			final_velocity = (final_position - current_position) / dt

			extension._velocity:store(final_velocity)
			Unit_set_local_position(unit, 0, final_position)
		end

		for unit, extension in pairs(data.mover_constrained_update_units) do
			local mover_displacement = nil

			if extension._mover_displacement_duration then
				extension._mover_displacement_t = extension._mover_displacement_t - dt
				mover_displacement = extension._mover_displacement:unbox() * extension._mover_displacement_t / extension._mover_displacement_duration

				if extension._mover_displacement_t <= 0 then
					extension._mover_displacement_duration = nil
				end
			else
				mover_displacement = Vector3(0, 0, 0)
			end

			local current_position = Unit_local_position(unit, 0)
			local wanted_velocity = extension._wanted_velocity
			local mover = Unit.mover(unit)

			Mover_move(mover, wanted_velocity * dt, dt)

			local final_position = Mover.position(mover) - mover_displacement
			local final_velocity = (final_position - current_position) / dt
			local mover_collides_down = Mover.collides_down(mover)

			if mover_collides_down and Mover.standing_frames(mover) > 0 then
				final_velocity.z = 0
				extension._is_falling = false
			else
				final_velocity.z = wanted_velocity.z

				if extension._check_falling then
					local dist_sq = Vector3.distance_squared(extension._last_fall_position:unbox(), final_position)

					if not extension._is_falling or dist_sq > 0.0625 then
						local physics_world = World.get_data(extension._world, "physics_world")
						local size = Vector3(0.5, 1.5, 0.5)
						local rotation = Quaternion.look(Vector3(0, 0, 1))
						local test_pos = final_position + Vector3(0, 0, -1)
						local hit_actors, num_hit_actors = PhysicsWorld.immediate_overlap(physics_world, "shape", "capsule", "position", test_pos, "rotation", rotation, "size", size, "collision_filter", "filter_environment_overlap", "use_global_table")
						extension._is_falling = num_hit_actors == 0

						extension._last_fall_position:store(final_position)
					end
				end
			end

			extension._velocity:store(final_velocity)
			Unit_set_local_position(unit, 0, final_position)
		end

		local Mover_set_position = Mover.set_position

		for unit, extension in pairs(data.all_update_units) do
			extension._wanted_velocity = nil
			local mover = Unit_mover(unit)

			if mover and data.mover_constrained_update_units[unit] == nil then
				Mover_set_position(mover, Unit_local_position(unit, 0))
			end
		end
	end,
	update_out_of_range = function (data, t, dt)
		local conflict_director = Managers.state.conflict
		local Unit_local_position = Unit.local_position
		local ScriptUnit_extension = ScriptUnit.extension
		local pos_min = NetworkConstants.position.min
		local pos_max = NetworkConstants.position.max

		for unit, extension in pairs(data.all_update_units) do
			local pos = Unit_local_position(unit, 0)
			local pos_x = pos.x
			local pos_y = pos.y
			local pos_z = pos.z
			local out_of_range_x = pos_x < pos_min or pos_max < pos_x
			local out_of_range_y = pos_y < pos_min or pos_max < pos_y
			local out_of_range_z = pos_z < pos_min or pos_max < pos_z

			if out_of_range_x or out_of_range_y or out_of_range_z then
				local ai_extension = ScriptUnit_extension(unit, "ai_system")
				local blackboard = ai_extension._blackboard
				data.all_update_units[unit] = nil

				conflict_director:destroy_unit(unit, blackboard, "out_of_range")
			end
		end
	end,
	update_network = function (data, t, dt)
		local game = Managers.state.network:game()

		if game == nil then
			return
		end

		local unit_storage = Managers.state.unit_storage
		local Unit_local_position = Unit.local_position
		local Unit_local_rotation = Unit.local_rotation
		local V3_min = Vector3.min
		local V3_max = Vector3.max
		local GameSession_set_game_object_field = GameSession.set_game_object_field
		local constant = NetworkConstants.enemy_velocity
		local vel_min = constant.min
		local vel_max = constant.max
		local vel_min_v3 = Vector3(vel_min, vel_min, vel_min)
		local vel_max_v3 = Vector3(vel_max, vel_max, vel_max)

		for unit, extension in pairs(data.all_update_units) do
			local go_id = unit_storage:go_id(unit)
			local pos = Unit_local_position(unit, 0)
			local rot = Unit_local_rotation(unit, 0)
			local yaw = Quaternion.yaw(rot)
			local velocity = extension._velocity:unbox()

			GameSession_set_game_object_field(game, go_id, "position", pos)
			GameSession_set_game_object_field(game, go_id, "yaw_rot", yaw)

			velocity = V3_min(V3_max(velocity, vel_min_v3), vel_max_v3)

			GameSession_set_game_object_field(game, go_id, "velocity", velocity)
		end
	end
}

return

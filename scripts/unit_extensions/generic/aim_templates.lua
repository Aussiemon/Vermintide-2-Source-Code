AimTemplates = AimTemplates or {}
local BLACKBOARDS = BLACKBOARDS
local AIM_DIRECTION_MAX = 1.9999999
local HUSK_MIN_PITCH = -0.95
local HUSK_MAX_PITCH = 0.6

local function look_at_target_unit(unit, data, dt, target_unit, target_distance, head_constraint_target, always_on)
	local previously_used_head_constraint = data.is_using_head_constraint

	if not previously_used_head_constraint and not always_on then
		data.is_using_head_constraint = true

		Unit.animation_event(unit, data.look_at_on_animation or "look_at_on")
	end

	if not target_unit or not Unit.alive(target_unit) then
		AiUtils.set_default_anim_constraint(unit, head_constraint_target)

		return
	end

	local look_target = nil
	local first_person_extension = ScriptUnit.has_extension(target_unit, "first_person_system")

	if first_person_extension ~= nil then
		look_target = first_person_extension:current_position()
	else
		local head_index = Unit.node(target_unit, "j_head")
		look_target = Unit.world_position(target_unit, head_index)
	end

	local rotation = Unit.world_rotation(unit, 0)
	local rotation_forward = Vector3.flat(Quaternion.forward(rotation))
	local rotation_forward_normalized = Vector3.normalize(rotation_forward)
	local unit_position = POSITION_LOOKUP[unit]
	local to_target = Vector3.flat(look_target - unit_position)
	local to_target_normalized = Vector3.normalize(to_target)
	local dot = Vector3.dot(to_target_normalized, rotation_forward_normalized)

	if dot < math.inverse_sqrt_2 then
		local old_z = look_target.z
		local rotation_right = Vector3.flat(Quaternion.right(rotation))

		if Vector3.cross(rotation_forward_normalized, to_target_normalized).z > 0 then
			look_target = unit_position + (rotation_forward - rotation_right) * target_distance
		else
			look_target = unit_position + (rotation_forward + rotation_right) * target_distance
		end

		look_target.z = old_z
	end

	if previously_used_head_constraint and not data.lerp_aiming_disabled then
		local previous_look_target = data.previous_look_target:unbox()
		local lerp_t = math.min(dt * 5, 1)
		look_target = Vector3.lerp(previous_look_target, look_target, lerp_t)
	end

	data.previous_look_target:store(look_target)
	Unit.animation_set_constraint_target(unit, head_constraint_target, look_target)
end

AimTemplates.player = {
	owner = {
		init = function (unit, data)
			data.packmaster_claw_aim_constraint = Unit.animation_find_constraint_target(unit, "packmaster_claw_target")
			data.aim_constraint_anim_var = Unit.animation_find_constraint_target(unit, "aim_constraint_target")
			data.look_direction_anim_var = Unit.animation_find_variable(unit, "aim_direction")
			data.aim_direction_pitch_var = Unit.animation_find_variable(unit, "aim_direction_pitch")
			data.locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
			data.status_extension = ScriptUnit.extension(unit, "status_system")
		end,
		update = function (unit, t, dt, data)
			local aim_direction = nil
			local unit_fwd = Quaternion.forward(Unit.local_rotation(unit, 0))
			local status_extension = data.status_extension

			if status_extension:is_grabbed_by_pack_master() then
				local packmaster_unit = status_extension:get_pack_master_grabber()
				local node = Unit.node(packmaster_unit, "j_rightweaponcomponent10")
				local node_position = Unit.world_position(packmaster_unit, node)

				Unit.animation_set_constraint_target(unit, data.packmaster_claw_aim_constraint, node_position)

				aim_direction = unit_fwd
			elseif status_extension:is_inspecting() then
				aim_direction = unit_fwd
			else
				local rotation = data.locomotion_extension:current_rotation()
				aim_direction = Quaternion.forward(rotation)
			end

			local block_anim_variable = PlayerUnitMovementSettings.block.aim_direction_pitch_function(aim_direction.z)

			Unit.animation_set_variable(unit, data.aim_direction_pitch_var, block_anim_variable)

			local aim_direction_scaled = aim_direction * 3
			local aim_from_pos = Unit.world_position(unit, Unit.node(unit, "camera_attach"))
			local aim_target = aim_from_pos + aim_direction_scaled

			Unit.animation_set_constraint_target(unit, data.aim_constraint_anim_var, aim_target)

			local aim_dir_flat = Vector3.normalize(Vector3.flat(aim_direction))
			local fwd_flat = Vector3.normalize(Vector3.flat(unit_fwd))
			local aim_angle = math.atan2(aim_dir_flat.y, aim_dir_flat.x) - math.atan2(fwd_flat.y, fwd_flat.x)
			local aim_direction_scaled = -((aim_angle / math.pi + 1) % 2 - 1) * 2

			Unit.animation_set_variable(unit, data.look_direction_anim_var, math.clamp(aim_direction_scaled, -AIM_DIRECTION_MAX, AIM_DIRECTION_MAX))

			local game = Managers.state.network:game()
			local go_id = Managers.state.unit_storage:go_id(unit)

			if game and go_id then
				local first_person_extension = ScriptUnit.extension(unit, "first_person_system")
				local aim_position = first_person_extension:current_position()
				local network_aim_position = NetworkUtils.network_clamp_position(aim_position)

				GameSession.set_game_object_field(game, go_id, "aim_direction", aim_direction)
				GameSession.set_game_object_field(game, go_id, "aim_position", network_aim_position)
			end
		end,
		leave = function (unit, data)
			return
		end
	},
	husk = {
		init = function (unit, data)
			data.aim_constraint_anim_var = Unit.animation_find_constraint_target(unit, "aim_constraint_target")
			data.look_direction_anim_var = Unit.animation_find_variable(unit, "aim_direction")
			data.aim_direction_pitch_var = Unit.animation_find_variable(unit, "aim_direction_pitch")
			data.packmaster_claw_aim_constraint = Unit.animation_find_constraint_target(unit, "packmaster_claw_target")
			data.camera_attach_node = Unit.node(unit, "camera_attach")
			data.status_extension = ScriptUnit.extension(unit, "status_system")
		end,
		update = function (unit, t, dt, data)
			local game = Managers.state.network:game()
			local go_id = Managers.state.unit_storage:go_id(unit)

			if not game or not go_id then
				return
			end

			local aim_direction = GameSession.game_object_field(game, go_id, "aim_direction")
			local rotation = Quaternion.look(aim_direction)
			local yaw = Quaternion.yaw(rotation)
			local pitch = math.clamp(Quaternion.pitch(rotation), HUSK_MIN_PITCH, HUSK_MAX_PITCH)
			local yaw_rotation = Quaternion(Vector3.up(), yaw)
			local pitch_rotation = Quaternion(Vector3.right(), pitch)
			local look_rotation = Quaternion.multiply(yaw_rotation, pitch_rotation)
			aim_direction = Vector3.normalize(Quaternion.forward(look_rotation))
			local aim_direction_scaled = aim_direction * 3
			local from_pos = Unit.world_position(unit, data.camera_attach_node)

			if script_data.lerp_debug or script_data.extrapolation_debug then
				local old_target = Matrix4x4.translation(Unit.animation_get_constraint_target(unit, data.aim_constraint_anim_var))
				local new_target = from_pos + aim_direction_scaled

				Unit.animation_set_constraint_target(unit, data.aim_constraint_anim_var, new_target)

				local anim_variable = PlayerUnitMovementSettings.block.aim_direction_pitch_function(Vector3.normalize(aim_direction_scaled).z)

				Unit.animation_set_variable(unit, Unit.animation_find_variable(unit, "aim_direction_pitch"), anim_variable)
			else
				Unit.animation_set_constraint_target(unit, data.aim_constraint_anim_var, from_pos + aim_direction_scaled)
			end

			local new_yaw = GameSession.game_object_field(game, go_id, "yaw")
			local new_pitch = GameSession.game_object_field(game, go_id, "pitch")
			local yaw_rotation = Quaternion(Vector3.up(), new_yaw)
			local pitch_rotation = Quaternion(Vector3.right(), new_pitch)
			local new_rot = Quaternion.multiply(yaw_rotation, pitch_rotation)
			local fwd_dir = Quaternion.forward(new_rot)

			Vector3.set_z(fwd_dir, 0)
			Vector3.set_z(aim_direction_scaled, 0)

			local fwd_flat = Vector3.normalize(fwd_dir)
			local aim_dir_flat = Vector3.normalize(aim_direction_scaled)
			local aim_angle = math.atan2(aim_dir_flat.y, aim_dir_flat.x) - math.atan2(fwd_flat.y, fwd_flat.x)
			local aim_direction_scaled = -((aim_angle / math.pi + 1) % 2 - 1) * 2

			Unit.animation_set_variable(unit, data.look_direction_anim_var, math.clamp(aim_direction_scaled, -AIM_DIRECTION_MAX, AIM_DIRECTION_MAX))

			if data.status_extension:is_grabbed_by_pack_master() then
				local packmaster_unit = data.status_extension:get_pack_master_grabber()
				local node = Unit.node(packmaster_unit, "j_rightweaponcomponent10")
				local node_position = Unit.world_position(packmaster_unit, node)

				Unit.animation_set_constraint_target(unit, data.packmaster_claw_aim_constraint, node_position)
			end
		end,
		leave = function (unit, data)
			return
		end
	}
}
AimTemplates.enemy_character = {
	owner = {
		init = function (unit, data)
			data.aim_constraint_anim_var = Unit.animation_find_constraint_target(unit, "aim_constraint_target")
			data.look_direction_anim_var = Unit.animation_find_variable(unit, "aim_direction")
			data.aim_direction_pitch_var = Unit.animation_find_variable(unit, "aim_direction_pitch")
			data.locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
			data.status_extension = ScriptUnit.extension(unit, "status_system")
		end,
		update = function (unit, t, dt, data)
			local aim_direction = nil
			local unit_fwd = Quaternion.forward(Unit.local_rotation(unit, 0))
			local status_extension = data.status_extension

			if status_extension:is_inspecting() then
				aim_direction = unit_fwd
			elseif status_extension:get_is_packmaster_dragging() then
				aim_direction = unit_fwd
			else
				local rotation = data.locomotion_extension:current_rotation()
				aim_direction = Quaternion.forward(rotation)
			end

			local block_anim_variable = PlayerUnitMovementSettings.block.aim_direction_pitch_function(aim_direction.z)

			Unit.animation_set_variable(unit, data.aim_direction_pitch_var, block_anim_variable)

			local aim_direction_scaled = aim_direction * 3
			local aim_from_pos = Unit.world_position(unit, Unit.node(unit, "camera_attach"))
			local aim_target = aim_from_pos + aim_direction_scaled

			Unit.animation_set_constraint_target(unit, data.aim_constraint_anim_var, aim_target)

			local aim_dir_flat = Vector3.normalize(Vector3.flat(aim_direction))
			local fwd_flat = Vector3.normalize(Vector3.flat(unit_fwd))
			local aim_angle = math.atan2(aim_dir_flat.y, aim_dir_flat.x) - math.atan2(fwd_flat.y, fwd_flat.x)
			local aim_direction_scaled = -((aim_angle / math.pi + 1) % 2 - 1) * 2

			Unit.animation_set_variable(unit, data.look_direction_anim_var, math.clamp(aim_direction_scaled, -AIM_DIRECTION_MAX, AIM_DIRECTION_MAX))

			local game = Managers.state.network:game()
			local go_id = Managers.state.unit_storage:go_id(unit)

			if game and go_id then
				local first_person_extension = ScriptUnit.extension(unit, "first_person_system")
				local aim_position = first_person_extension:current_position()
				local network_aim_position = NetworkUtils.network_clamp_position(aim_position)

				GameSession.set_game_object_field(game, go_id, "aim_direction", aim_direction)
				GameSession.set_game_object_field(game, go_id, "aim_position", network_aim_position)
			end
		end,
		leave = function (unit, data)
			return
		end
	},
	husk = {
		init = function (unit, data)
			data.aim_constraint_anim_var = Unit.animation_find_constraint_target(unit, "aim_constraint_target")
			data.look_direction_anim_var = Unit.animation_find_variable(unit, "aim_direction")
			data.aim_direction_pitch_var = Unit.animation_find_variable(unit, "aim_direction_pitch")
			data.camera_attach_node = Unit.node(unit, "camera_attach")
			data.status_extension = ScriptUnit.extension(unit, "status_system")
		end,
		update = function (unit, t, dt, data)
			local game = Managers.state.network:game()
			local go_id = Managers.state.unit_storage:go_id(unit)

			if not game or not go_id then
				return
			end

			local aim_direction = GameSession.game_object_field(game, go_id, "aim_direction")
			local rotation = Quaternion.look(aim_direction)
			local yaw = Quaternion.yaw(rotation)
			local pitch = math.clamp(Quaternion.pitch(rotation), HUSK_MIN_PITCH, HUSK_MAX_PITCH)
			local yaw_rotation = Quaternion(Vector3.up(), yaw)
			local pitch_rotation = Quaternion(Vector3.right(), pitch)
			local look_rotation = Quaternion.multiply(yaw_rotation, pitch_rotation)
			aim_direction = Vector3.normalize(Quaternion.forward(look_rotation))
			local aim_direction_scaled = aim_direction * 3
			local from_pos = Unit.world_position(unit, data.camera_attach_node)

			if script_data.lerp_debug or script_data.extrapolation_debug then
				local old_target = Matrix4x4.translation(Unit.animation_get_constraint_target(unit, data.aim_constraint_anim_var))
				local new_target = from_pos + aim_direction_scaled

				Unit.animation_set_constraint_target(unit, data.aim_constraint_anim_var, new_target)

				local anim_variable = PlayerUnitMovementSettings.block.aim_direction_pitch_function(Vector3.normalize(aim_direction_scaled).z)

				Unit.animation_set_variable(unit, Unit.animation_find_variable(unit, "aim_direction_pitch"), anim_variable)
			else
				Unit.animation_set_constraint_target(unit, data.aim_constraint_anim_var, from_pos + aim_direction_scaled)
			end

			local new_yaw = GameSession.game_object_field(game, go_id, "yaw")
			local new_pitch = GameSession.game_object_field(game, go_id, "pitch")
			local yaw_rotation = Quaternion(Vector3.up(), new_yaw)
			local pitch_rotation = Quaternion(Vector3.right(), new_pitch)
			local new_rot = Quaternion.multiply(yaw_rotation, pitch_rotation)
			local fwd_dir = Quaternion.forward(new_rot)

			Vector3.set_z(fwd_dir, 0)
			Vector3.set_z(aim_direction_scaled, 0)

			local fwd_flat = Vector3.normalize(fwd_dir)
			local aim_dir_flat = Vector3.normalize(aim_direction_scaled)
			local aim_angle = math.atan2(aim_dir_flat.y, aim_dir_flat.x) - math.atan2(fwd_flat.y, fwd_flat.x)
			local aim_direction_scaled = -((aim_angle / math.pi + 1) % 2 - 1) * 2

			Unit.animation_set_variable(unit, data.look_direction_anim_var, math.clamp(aim_direction_scaled, -AIM_DIRECTION_MAX, AIM_DIRECTION_MAX))
		end,
		leave = function (unit, data)
			return
		end
	}
}
AimTemplates.packmaster_claw = {
	owner = {
		init = function (unit, data)
			data.aim_constraint_anim_var = Unit.animation_find_constraint_target(unit, "aim_constraint_target")
		end,
		update = function (unit, t, dt, data)
			return
		end,
		leave = function (unit, data)
			return
		end
	}
}
AimTemplates.ratling_gunner = {
	owner = {
		init = function (unit, data)
			local blackboard = BLACKBOARDS[unit]
			data.blackboard = blackboard
			data.constraint_target = Unit.animation_find_constraint_target(unit, "aim_target")
		end,
		update = function (unit, t, dt, data)
			local unit_position = POSITION_LOOKUP[unit]
			local aim_target = nil
			local attack_pattern_data = data.blackboard.attack_pattern_data

			if attack_pattern_data and attack_pattern_data.shoot_direction_box then
				local shoot_direction = attack_pattern_data.shoot_direction_box:unbox()
				aim_target = unit_position + Vector3.normalize(shoot_direction) * 5
			else
				local look_direction = Quaternion.forward(Unit.local_rotation(unit, 0))
				aim_target = unit_position + look_direction * 5
			end

			Unit.animation_set_constraint_target(unit, data.constraint_target, aim_target)

			local game = Managers.state.network:game()
			local go_id = Managers.state.unit_storage:go_id(unit)

			if game and go_id then
				GameSession.set_game_object_field(game, go_id, "aim_target", aim_target)
			end
		end,
		leave = function (unit, data)
			return
		end
	},
	husk = {
		init = function (unit, data)
			data.constraint_target = Unit.animation_find_constraint_target(unit, "aim_target")
		end,
		update = function (unit, t, dt, data)
			local game = Managers.state.network:game()
			local go_id = Managers.state.unit_storage:go_id(unit)

			if game and go_id then
				local aim_target = GameSession.game_object_field(game, go_id, "aim_target")

				Unit.animation_set_constraint_target(unit, data.constraint_target, aim_target)
			else
				local look_direction = Quaternion.forward(Unit.local_rotation(unit, 0))
				local aim_target = POSITION_LOOKUP[unit] + look_direction * 5

				Unit.animation_set_constraint_target(unit, data.constraint_target, aim_target)
			end
		end,
		leave = function (unit, data)
			return
		end
	}
}
AimTemplates.warpfire_thrower = {
	owner = {
		init = function (unit, data)
			local blackboard = BLACKBOARDS[unit]
			data.blackboard = blackboard
			data.constraint_target = Unit.animation_find_constraint_target(unit, "aim_target")
		end,
		update = function (unit, t, dt, data)
			local unit_position = POSITION_LOOKUP[unit]
			local aim_target = nil
			local blackboard = data.blackboard
			local attack_pattern_data = blackboard.attack_pattern_data

			if attack_pattern_data and attack_pattern_data.shoot_direction_box then
				local shoot_direction = attack_pattern_data.shoot_direction_box:unbox()
				aim_target = unit_position + Vector3.normalize(shoot_direction) * 5
			else
				local look_direction = Quaternion.forward(Unit.local_rotation(unit, 0))
				aim_target = unit_position + look_direction * 5
			end

			Unit.animation_set_constraint_target(unit, data.constraint_target, aim_target)

			local game = Managers.state.network:game()
			local unit_storage = Managers.state.unit_storage
			local go_id = unit_storage:go_id(unit)

			if game and go_id then
				GameSession.set_game_object_field(game, go_id, "aim_target", aim_target)

				local target_unit = blackboard.target_unit
				local previous_target_unit = blackboard.previous_target_unit
				local have_new_target = target_unit ~= previous_target_unit
				local target_go_id = unit_storage:go_id(target_unit)

				if have_new_target and target_go_id then
					local warpfire_data = blackboard.warpfire_data
					local blob_unit = warpfire_data and warpfire_data.blob_unit
					local blob_id = blob_unit and unit_storage:go_id(blob_unit)

					if blob_id then
						target_go_id = blob_id
					end

					GameSession.set_game_object_field(game, go_id, "target_unit_id", target_go_id)
				end
			end
		end,
		leave = function (unit, data)
			return
		end
	},
	husk = {
		init = function (unit, data)
			data.constraint_target = Unit.animation_find_constraint_target(unit, "aim_target")
		end,
		update = function (unit, t, dt, data)
			local game = Managers.state.network:game()
			local go_id = Managers.state.unit_storage:go_id(unit)

			if game and go_id then
				local aim_target = GameSession.game_object_field(game, go_id, "aim_target")

				Unit.animation_set_constraint_target(unit, data.constraint_target, aim_target)
			else
				local look_direction = Quaternion.forward(Unit.local_rotation(unit, 0))
				local aim_target = POSITION_LOOKUP[unit] + look_direction * 5

				Unit.animation_set_constraint_target(unit, data.constraint_target, aim_target)
			end
		end,
		leave = function (unit, data)
			return
		end
	}
}
AimTemplates.chaos_warrior = {
	owner = {
		init = function (unit, data)
			local blackboard = BLACKBOARDS[unit]
			data.blackboard = blackboard
			data.constraint_target = Unit.animation_find_constraint_target(unit, "aim_target")
			data.previous_look_target = Vector3Box()
		end,
		update = function (unit, t, dt, data)
			if not Unit.has_animation_state_machine(unit) then
				return
			end

			local blackboard = data.blackboard
			local target_unit = blackboard.target_unit
			local previous_aim_target_unit = data.previous_aim_target_unit
			local constraint_target = data.constraint_target

			if not target_unit or not Unit.alive(target_unit) then
				AiUtils.set_default_anim_constraint(unit, constraint_target)

				return
			end

			local aim_target = nil

			if ScriptUnit.has_extension(target_unit, "first_person_system") then
				local first_person_extension = ScriptUnit.extension(target_unit, "first_person_system")
				aim_target = first_person_extension:current_position()
			else
				local head_index = Unit.node(target_unit, "j_head")
				aim_target = Unit.world_position(target_unit, head_index)
			end

			local target_distance = blackboard.target_dist
			local breed = blackboard.breed
			local use_head_constraint = nil
			local _, is_level_unit = Managers.state.network:game_object_or_level_id(target_unit)

			if not is_level_unit and target_distance < (breed.look_at_range or 30) then
				use_head_constraint = true
			end

			if not DEDICATED_SERVER and use_head_constraint then
				look_at_target_unit(unit, data, dt, target_unit, target_distance, constraint_target, true)
			end

			local have_new_target = target_unit ~= previous_aim_target_unit

			if have_new_target then
				local game = Managers.state.network:game()
				local go_id = Managers.state.unit_storage:go_id(unit)
				local target_go_id = Managers.state.unit_storage:go_id(target_unit)
				data.previous_aim_target_unit = target_unit

				if game and go_id and target_go_id then
					GameSession.set_game_object_field(game, go_id, "target_unit_id", target_go_id)
				end
			end
		end,
		leave = function (unit, data)
			return
		end
	},
	husk = {
		init = function (unit, data)
			data.constraint_target = Unit.animation_find_constraint_target(unit, "aim_target")
			data.previous_look_target = Vector3Box()
		end,
		update = function (unit, t, dt, data)
			if not Unit.has_animation_state_machine(unit) then
				return
			end

			local game = Managers.state.network:game()
			local go_id = Managers.state.unit_storage:go_id(unit)
			local constraint_target = data.constraint_target

			if game and go_id then
				local target_unit_id = GameSession.game_object_field(game, go_id, "target_unit_id")
				local target_unit = Managers.state.unit_storage:unit(target_unit_id)

				if not target_unit or not Unit.alive(target_unit) or target_unit_id <= 0 then
					AiUtils.set_default_anim_constraint(unit, constraint_target)

					return
				end

				local aim_target = nil

				if ScriptUnit.has_extension(target_unit, "first_person_system") then
					local first_person_extension = ScriptUnit.extension(target_unit, "first_person_system")
					aim_target = first_person_extension:current_position()
				else
					local has_head_index = Unit.has_node(target_unit, "j_head")

					if has_head_index then
						local head_index = Unit.node(target_unit, "j_head")
						aim_target = Unit.world_position(target_unit, head_index)
					else
						AiUtils.set_default_anim_constraint(unit, constraint_target)

						return
					end
				end

				local target_unit = Managers.state.unit_storage:unit(target_unit_id)
				local target_distance = target_unit and Vector3.distance(POSITION_LOOKUP[unit], POSITION_LOOKUP[target_unit])
				local use_head_constraint = nil

				if target_distance < 30 then
					use_head_constraint = true
				end

				if use_head_constraint then
					local head_constraint_target = data.constraint_target
					data.lerp_aiming_disabled = true

					look_at_target_unit(unit, data, dt, target_unit, target_distance, head_constraint_target, true)
				end
			else
				AiUtils.set_default_anim_constraint(unit, constraint_target)
			end
		end,
		leave = function (unit, data)
			return
		end
	}
}
AimTemplates.chaos_marauder = {
	owner = {
		init = function (unit, data)
			local blackboard = BLACKBOARDS[unit]
			data.blackboard = blackboard
			data.ai_extension = ScriptUnit.extension(unit, "ai_system")
			data.head_constraint_target = Unit.animation_find_constraint_target(unit, "head_aim_target")
			data.previous_look_target = Vector3Box()
		end,
		update = function (unit, t, dt, data)
			local blackboard = data.blackboard
			local ai_extension = data.ai_extension
			local current_action = ai_extension:current_action_name()
			local game = Managers.state.network:game()
			local go_id = Managers.state.unit_storage:go_id(unit)
			local use_head_constraint = false
			local target_distance = blackboard.target_dist
			local breed = blackboard.breed
			local target_unit = blackboard.target_unit
			local head_constraint_target = data.head_constraint_target

			if not target_unit or not Unit.alive(target_unit) then
				AiUtils.set_default_anim_constraint(unit, head_constraint_target)

				return
			end

			local _, is_level_unit = Managers.state.network:game_object_or_level_id(target_unit)
			local is_correct_action = current_action == "follow" or current_action == "combat_step"

			if not is_level_unit and is_correct_action and target_distance < (breed.look_at_range or 30) then
				use_head_constraint = true
			end

			local death_extension = ScriptUnit.has_extension(unit, "death_system")

			if death_extension and death_extension:has_death_started() then
				use_head_constraint = false
			end

			if use_head_constraint then
				local previous_aim_target_unit = data.previous_aim_target_unit
				data.lerp_aiming_disabled = true

				if not DEDICATED_SERVER then
					look_at_target_unit(unit, data, dt, target_unit, target_distance, head_constraint_target)
				end

				if target_unit ~= previous_aim_target_unit then
					local target_go_id = Managers.state.unit_storage:go_id(target_unit)

					if game and go_id and target_go_id then
						GameSession.set_game_object_field(game, go_id, "target_unit_id", target_go_id)

						data.previous_aim_target_unit = target_unit
					end
				end
			elseif data.is_using_head_constraint then
				data.is_using_head_constraint = false

				Unit.animation_event(unit, "look_at_off")
			end
		end,
		leave = function (unit, data)
			if data.is_using_head_constraint then
				data.is_using_head_constraint = false

				Unit.animation_event(unit, "look_at_off")
			end
		end
	},
	husk = {
		init = function (unit, data)
			data.head_constraint_target = Unit.animation_find_constraint_target(unit, "head_aim_target")
			data.previous_look_target = Vector3Box()
		end,
		update = function (unit, t, dt, data)
			local game = Managers.state.network:game()
			local unit_storage = Managers.state.unit_storage
			local go_id = unit_storage:go_id(unit)

			if game and go_id then
				local action_name_id = GameSession.game_object_field(game, go_id, "bt_action_name")
				local action_name = NetworkLookup.bt_action_names[action_name_id]
				local use_head_constraint = false

				if action_name == "follow" then
					use_head_constraint = true
				end

				if use_head_constraint then
					local target_unit_id = GameSession.game_object_field(game, go_id, "target_unit_id")

					if target_unit_id > 0 then
						local target_unit = unit_storage:unit(target_unit_id)

						if target_unit then
							local target_distance = Vector3.distance(POSITION_LOOKUP[unit], POSITION_LOOKUP[target_unit] or Unit.world_position(target_unit, 0))
						end

						local head_constraint_target = data.head_constraint_target
						data.lerp_aiming_disabled = true
						local has_head_index = target_unit and Unit.has_node(target_unit, "j_head")

						if has_head_index then
							look_at_target_unit(unit, data, dt, target_unit, target_distance, head_constraint_target)
						end
					end
				elseif data.is_using_head_constraint then
					data.is_using_head_constraint = false

					Unit.animation_event(unit, "look_at_off")
				end
			end
		end,
		leave = function (unit, data)
			if data.is_using_head_constraint then
				data.is_using_head_constraint = false

				Unit.animation_event(unit, "look_at_off")
			end
		end
	}
}
AimTemplates.stormfiend = {
	owner = {
		init = function (unit, data)
			local blackboard = BLACKBOARDS[unit]
			data.blackboard = blackboard
			data.ai_extension = ScriptUnit.extension(unit, "ai_system")
			data.head_constraint_target = Unit.animation_find_constraint_target(unit, "head_aim_target")
			data.previous_look_target = Vector3Box()
		end,
		update = function (unit, t, dt, data)
			local blackboard = data.blackboard
			local ai_extension = data.ai_extension
			local current_action = ai_extension:current_action_name()
			local game = Managers.state.network:game()
			local go_id = Managers.state.unit_storage:go_id(unit)
			local use_head_constraint = false

			if current_action == "shoot" then
				use_head_constraint = true
				local shoot_data = blackboard.shoot_data

				if shoot_data.attack_started then
					local start_position = shoot_data.aim_start_position:unbox()
					local current_aim_position = nil

					if shoot_data.is_firing then
						local end_position = nil

						if blackboard.weapon_setup == "ratling_gun" then
							end_position = POSITION_LOOKUP[blackboard.target_unit]
						else
							end_position = shoot_data.aim_end_position:unbox()
						end

						local firing_time = shoot_data.firing_time
						local remaining_t = shoot_data.stop_firing_t - t
						local anim_align_lerp = math.min((firing_time - remaining_t) / firing_time, 1)
						current_aim_position = Vector3.lerp(start_position, end_position, anim_align_lerp)
					else
						current_aim_position = start_position
					end

					shoot_data.current_aim_position:store(current_aim_position)

					local aim_constraint_target_var = shoot_data.aim_constraint_target_var

					Unit.animation_set_constraint_target(unit, aim_constraint_target_var, current_aim_position)

					if game and go_id then
						GameSession.set_game_object_field(game, go_id, "aim_target", current_aim_position)
					end
				end
			elseif current_action == "follow" then
				use_head_constraint = true
			elseif current_action == "target_unreachable" then
				use_head_constraint = true
			elseif current_action == "target_rage" then
				use_head_constraint = true
			end

			if use_head_constraint then
				local target_unit = blackboard.target_unit
				local previous_aim_target_unit = data.previous_aim_target_unit
				local target_distance = blackboard.target_dist
				local head_constraint_target = data.head_constraint_target

				if target_distance < 50 and not DEDICATED_SERVER then
					look_at_target_unit(unit, data, dt, target_unit, target_distance, head_constraint_target)
				end

				if target_unit ~= previous_aim_target_unit then
					local target_go_id = Managers.state.unit_storage:go_id(target_unit)
					data.previous_aim_target_unit = target_unit

					if game and go_id and target_go_id then
						GameSession.set_game_object_field(game, go_id, "target_unit_id", target_go_id)
					end
				end
			elseif data.is_using_head_constraint then
				data.is_using_head_constraint = false

				Unit.animation_event(unit, "look_at_off")
			end
		end,
		leave = function (unit, data)
			if data.is_using_head_constraint then
				data.is_using_head_constraint = false

				Unit.animation_event(unit, "look_at_off")
			end
		end
	},
	husk = {
		init = function (unit, data)
			data.shoot_constraint_targets = BreedActions.skaven_stormfiend.shoot.aim_constraint_target
			data.head_constraint_target = Unit.animation_find_constraint_target(unit, "head_aim_target")
			data.previous_look_target = Vector3Box()
		end,
		update = function (unit, t, dt, data)
			local game = Managers.state.network:game()
			local unit_storage = Managers.state.unit_storage
			local go_id = unit_storage:go_id(unit)

			if game and go_id then
				local action_name_id = GameSession.game_object_field(game, go_id, "bt_action_name")
				local action_name = NetworkLookup.bt_action_names[action_name_id]
				local use_head_constraint = false

				if action_name == "shoot" then
					use_head_constraint = true
					local network_aim_target = GameSession.game_object_field(game, go_id, "aim_target")
					local attack_arm_id = GameSession.game_object_field(game, go_id, "attack_arm")
					local attack_arm = NetworkLookup.attack_arm[attack_arm_id]
					local arm_constraint_target_name = data.shoot_constraint_targets[attack_arm]
					local arm_constraint_target_id = Unit.animation_find_constraint_target(unit, arm_constraint_target_name)
					local aim_target = nil

					if data.prev_aim_target then
						aim_target = Vector3.lerp(data.prev_aim_target:unbox(), network_aim_target, 0.5)

						data.prev_aim_target:store(aim_target)
					else
						aim_target = network_aim_target
						data.prev_aim_target = Vector3Box(network_aim_target)
					end

					Unit.animation_set_constraint_target(unit, arm_constraint_target_id, aim_target)
				else
					if data.prev_aim_target ~= nil then
						data.prev_aim_target = nil
					end

					if action_name == "follow" then
						use_head_constraint = true
					elseif action_name == "target_unreachable" then
						use_head_constraint = true
					elseif action_name == "target_rage" then
						use_head_constraint = true
					end
				end

				if use_head_constraint then
					local target_unit_id = GameSession.game_object_field(game, go_id, "target_unit_id")

					if target_unit_id > 0 then
						local target_unit = unit_storage:unit(target_unit_id)
						local target_distance = target_unit and Vector3.distance(POSITION_LOOKUP[unit], POSITION_LOOKUP[target_unit])
						local head_constraint_target = data.head_constraint_target

						look_at_target_unit(unit, data, dt, target_unit, target_distance, head_constraint_target)
					end
				elseif data.is_using_head_constraint then
					data.is_using_head_constraint = false

					Unit.animation_event(unit, "look_at_off")
				end
			end
		end,
		leave = function (unit, data)
			if data.is_using_head_constraint then
				data.is_using_head_constraint = false

				Unit.animation_event(unit, "look_at_off")
			end
		end
	}
}
AimTemplates.innkeeper = {
	owner = {
		init = function (unit, data)
			data.constraint_target = Unit.animation_find_constraint_target(unit, "lookat")
			data.current_target = nil
			data.interpolation_origin_position = Vector3Box()
			data.last_position = Vector3Box()
			data.interpolation_time = -math.huge
		end,
		update = function (unit, t, dt, data)
			local inn_keeper_position = Unit.local_position(unit, 0)
			local best_player = nil
			local best_dist_sq = 9
			local side = Managers.state.side:get_side_from_name("heroes")
			local player_units = side.PLAYER_UNITS
			local old_target = data.current_target
			local stickiness_multiplier = 0.9025

			for i = 1, #player_units, 1 do
				local player_unit = player_units[i]
				local dist_sq = Vector3.distance_squared(POSITION_LOOKUP[player_unit], inn_keeper_position)

				if player_unit == old_target then
					dist_sq = dist_sq * stickiness_multiplier
				end

				if best_dist_sq > dist_sq then
					best_dist_sq = dist_sq
					best_player = player_unit
				end
			end

			local interpolation_duration = 0.5

			if best_player and not old_target then
				Unit.animation_event(unit, "lookat_on")
			elseif not best_player and old_target then
				Unit.animation_event(unit, "lookat_off")

				data.interpolation_time = -math.huge
			elseif best_player ~= old_target then
				data.interpolation_time = t + interpolation_duration

				data.interpolation_origin_position:store(data.last_position:unbox())
			end

			local interpolation_time = data.interpolation_time

			if best_player then
				local aim_target = nil

				if ScriptUnit.has_extension(best_player, "first_person_system") then
					aim_target = ScriptUnit.extension(best_player, "first_person_system"):current_position()
				else
					local head_index = Unit.node(best_player, "j_head")
					aim_target = Unit.world_position(best_player, head_index)
				end

				if t < interpolation_time then
					local lerp_t = math.sin((1 - (interpolation_time - t) / interpolation_duration) * math.pi * 0.5)
					local from = data.interpolation_origin_position:unbox()
					aim_target = Vector3.lerp(from, aim_target, lerp_t)
				end

				data.last_position:store(aim_target)
				Unit.animation_set_constraint_target(unit, data.constraint_target, aim_target)
			end

			data.current_target = best_player
		end,
		leave = function (unit, data)
			return
		end
	}
}

DLCUtils.require_list("aim_templates_file_names")

return

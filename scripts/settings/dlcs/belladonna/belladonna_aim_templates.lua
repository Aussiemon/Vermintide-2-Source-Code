AimTemplates = AimTemplates or {}

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

AimTemplates.ungor_archer = {
	owner = {
		init = function (unit, data)
			local blackboard = BLACKBOARDS[unit]
			data.blackboard = blackboard
			data.ai_extension = ScriptUnit.extension(unit, "ai_system")
			data.head_constraint_target = Unit.animation_find_constraint_target(unit, "aim_bow_target")
			data.previous_look_target = Vector3Box()
			data.look_at_on_animation = "aim_bow_on"
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
			local is_correct_action = current_action == "fire_projectile"

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
						data.previous_aim_target_unit = target_unit
					end
				end
			elseif data.is_using_head_constraint then
				data.is_using_head_constraint = false

				Unit.animation_event(unit, "aim_bow_off")
			end
		end,
		leave = function (unit, data)
			if data.is_using_head_constraint then
				data.is_using_head_constraint = false

				Unit.animation_event(unit, "aim_bow_off")
			end
		end
	},
	husk = {
		init = function (unit, data)
			data.head_constraint_target = Unit.animation_find_constraint_target(unit, "aim_bow_target")
			data.previous_look_target = Vector3Box()
			data.look_at_on_animation = "aim_bow_on"
		end,
		update = function (unit, t, dt, data)
			local game = Managers.state.network:game()
			local unit_storage = Managers.state.unit_storage
			local go_id = unit_storage:go_id(unit)

			if game and go_id then
				local action_name_id = GameSession.game_object_field(game, go_id, "bt_action_name")
				local action_name = NetworkLookup.bt_action_names[action_name_id]
				local use_head_constraint = false

				if action_name == "fire_projectile" then
					use_head_constraint = true
				end

				if use_head_constraint then
					local target_unit_id = GameSession.game_object_field(game, go_id, "target_unit_id")

					if target_unit_id ~= NetworkConstants.invalid_game_object_id then
						local target_unit = unit_storage:unit(target_unit_id)
						local target_distance = target_unit and Vector3.distance(POSITION_LOOKUP[unit], POSITION_LOOKUP[target_unit])
						local head_constraint_target = data.head_constraint_target
						data.lerp_aiming_disabled = true
						local has_head_index = target_unit and Unit.has_node(target_unit, "j_head")

						if has_head_index then
							look_at_target_unit(unit, data, dt, target_unit, target_distance, head_constraint_target)
						end
					end
				elseif data.is_using_head_constraint then
					data.is_using_head_constraint = false

					Unit.animation_event(unit, "aim_bow_off")
				end
			end
		end,
		leave = function (unit, data)
			if data.is_using_head_constraint then
				data.is_using_head_constraint = false

				Unit.animation_event(unit, "aim_bow_off")
			end
		end
	}
}

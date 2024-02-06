-- chunkname: @scripts/settings/dlcs/belladonna/belladonna_animation_movement_templates.lua

AnimationMovementTemplates = AnimationMovementTemplates or {}

local BLACKBOARDS = BLACKBOARDS
local animation_set_variable = Unit.animation_set_variable

local function lean_towards_position(unit, dt, data, target_position, lerp_speed, lean_amount)
	local unit_position = Unit.local_position(unit, 0)
	local lean_direction = Vector3.normalize(target_position - unit_position)
	local rotation = Unit.world_rotation(unit, 0)
	local forward = Quaternion.forward(rotation)
	local right = Quaternion.right(rotation)
	local right_dot = Vector3.dot(right, lean_direction)
	local fwd_dot = Vector3.dot(forward, lean_direction)
	local abs_fwd_dot = math.abs(fwd_dot)
	local leaning_left = right_dot < 0
	local target_lean = (1 - abs_fwd_dot) * lean_amount

	target_lean = leaning_left and -target_lean or target_lean
	target_lean = math.clamp(target_lean, -1, 1)

	local current_lean = data.current_lean or 0
	local lean = math.lerp(current_lean, target_lean, lerp_speed * dt)
	local animation_variable_lean = data.animation_variable_lean

	animation_set_variable(unit, animation_variable_lean, lean)

	data.current_lean = lean
	data.current_lean_direction = leaning_left and "left" or "right"
	data.current_lean_value = lean
end

local function lean_downwards_over_time(unit, dt, data)
	if data.current_lean_value then
		local current_lean_value = data.current_lean_value
		local lerp_speed = 7

		data.current_lean_value = math.lerp(current_lean_value, 0, lerp_speed * dt)
		data.lean_variable = data.current_lean_value

		local compare_value = data.current_lean_value

		if data.current_lean_direction == "left" and compare_value >= -0.1 or data.current_lean_direction == "right" and compare_value <= 0.1 then
			data.current_lean_value = nil
			data.current_lean_direction = nil
			data.lean_variable = data.lean_downwards_min
		end
	else
		if not data.lean_variable then
			data.lean_variable = 0
		end

		local max = data.lean_downwards_max
		local lerp_speed = data.lean_downwards_speed

		data.lean_variable = math.lerp(data.lean_variable, max, lerp_speed * dt)
	end

	local animation_variable_lean = data.animation_variable_lean

	animation_set_variable(unit, animation_variable_lean, data.lean_variable)
end

AnimationMovementTemplates.beastmen_bestigor = {
	owner = {
		init = function (unit, data)
			local blackboard = BLACKBOARDS[unit]

			data.blackboard = blackboard
			data.ai_extension = ScriptUnit.extension(unit, "ai_system")
			data.animation_variable_lean = Unit.animation_find_variable(unit, "lean")
			data.lean_lerp_speed = 10
			data.lean_amount = 25
		end,
		update = function (unit, t, dt, data)
			local blackboard = data.blackboard

			if blackboard.lean_target_position_boxed then
				local lean_target_position = blackboard.lean_target_position_boxed:unbox()
				local lerp_speed = data.lean_lerp_speed
				local lean_amount = data.lean_amount

				lean_towards_position(unit, dt, data, lean_target_position, lerp_speed, lean_amount)

				local game = Managers.state.network:game()
				local go_id = Managers.state.unit_storage:go_id(unit)

				if game and go_id then
					local position_constant = NetworkConstants.position
					local min = position_constant.min
					local max = position_constant.max

					GameSession.set_game_object_field(game, go_id, "lean_target", Vector3.clamp(lean_target_position, min, max))
				end
			end
		end,
		leave = function (unit, data)
			local animation_variable_lean = data.animation_variable_lean

			if animation_variable_lean then
				animation_set_variable(unit, animation_variable_lean, 0)
			end
		end,
	},
	husk = {
		init = function (unit, data)
			data.animation_variable_lean = Unit.animation_find_variable(unit, "lean")
			data.old_lean_target_position_boxed = Vector3Box(Vector3.zero())
			data.lean_lerp_speed = 10
			data.lean_amount = 25
		end,
		update = function (unit, t, dt, data)
			local game = Managers.state.network:game()
			local go_id = Managers.state.unit_storage:go_id(unit)

			if game and go_id then
				local lean_target_position = GameSession.game_object_field(game, go_id, "lean_target")
				local old_lean_target_position = data.old_lean_target_position_boxed:unbox()

				if lean_target_position and lean_target_position ~= old_lean_target_position then
					local lerp_speed = data.lean_lerp_speed
					local lean_amount = data.lean_amount

					lean_towards_position(unit, dt, data, lean_target_position, lerp_speed, lean_amount)
					data.old_lean_target_position_boxed:store(lean_target_position)
				end
			end
		end,
		leave = function (unit, data)
			local animation_variable_lean = data.animation_variable_lean

			if animation_variable_lean then
				animation_set_variable(unit, animation_variable_lean, 0)
			end
		end,
	},
}
AnimationMovementTemplates.beastmen_minotaur = {
	owner = {
		init = function (unit, data)
			local blackboard = BLACKBOARDS[unit]

			data.blackboard = blackboard
			data.ai_extension = ScriptUnit.extension(unit, "ai_system")
			data.animation_variable_lean = Unit.animation_find_variable(unit, "lean")
			data.lean_lerp_speed = 10
			data.lean_amount = 25
			data.lean_downwards_speed = 2.25
			data.lean_downwards_min = 2
			data.lean_downwards_max = 3
			data.sent_downwards_lean = false
		end,
		update = function (unit, t, dt, data)
			local blackboard = data.blackboard

			if blackboard.lean_downwards then
				local game = Managers.state.network:game()
				local go_id = Managers.state.unit_storage:go_id(unit)

				lean_downwards_over_time(unit, dt, data)

				if game and go_id and not data.sent_downwards_lean then
					GameSession.set_game_object_field(game, go_id, "lean_downwards", true)

					data.sent_downwards_lean = true
				end
			elseif blackboard.lean_target_position_boxed then
				local lean_target_position = blackboard.lean_target_position_boxed:unbox()
				local lerp_speed = data.lean_lerp_speed
				local lean_amount = data.lean_amount

				lean_towards_position(unit, dt, data, lean_target_position, lerp_speed, lean_amount)

				local game = Managers.state.network:game()
				local go_id = Managers.state.unit_storage:go_id(unit)

				if game and go_id then
					GameSession.set_game_object_field(game, go_id, "lean_target", lean_target_position)

					if data.sent_downwards_lean then
						GameSession.set_game_object_field(game, go_id, "lean_downwards", false)

						data.sent_downwards_lean = nil
					end
				end

				blackboard.current_lean_direction = data.current_lean_direction
				blackboard.current_lean_value = data.current_lean_value
			end

			if not blackboard.lean_downwards and data.sent_downwards_lean then
				local game = Managers.state.network:game()
				local go_id = Managers.state.unit_storage:go_id(unit)

				if game and go_id then
					GameSession.set_game_object_field(game, go_id, "lean_downwards", false)

					data.sent_downwards_lean = nil
				end
			end
		end,
		leave = function (unit, data)
			local animation_variable_lean = data.animation_variable_lean

			if animation_variable_lean then
				animation_set_variable(unit, animation_variable_lean, 0)
			end

			local game = Managers.state.network:game()
			local go_id = Managers.state.unit_storage:go_id(unit)

			data.current_lean_value = nil
			data.lean_variable = nil

			if game and go_id and data.sent_downwards_lean then
				GameSession.set_game_object_field(game, go_id, "lean_downwards", false)

				data.sent_downwards_lean = nil
			end
		end,
	},
	husk = {
		init = function (unit, data)
			data.animation_variable_lean = Unit.animation_find_variable(unit, "lean")
			data.old_lean_target_position_boxed = Vector3Box(Vector3.zero())
			data.lean_lerp_speed = 10
			data.lean_amount = 25
			data.lean_downwards_speed = 2.25
			data.lean_downwards_min = 2
			data.lean_downwards_max = 3
		end,
		update = function (unit, t, dt, data)
			local game = Managers.state.network:game()
			local go_id = Managers.state.unit_storage:go_id(unit)

			if game and go_id then
				local lean_downwards = GameSession.game_object_field(game, go_id, "lean_downwards")
				local lean_target_position = GameSession.game_object_field(game, go_id, "lean_target")

				if lean_downwards then
					lean_downwards_over_time(unit, dt, data)
				elseif lean_target_position and lean_target_position ~= Vector3.zero() then
					local lerp_speed = data.lean_lerp_speed
					local lean_amount = data.lean_amount

					lean_towards_position(unit, dt, data, lean_target_position, lerp_speed, lean_amount)
					data.old_lean_target_position_boxed:store(lean_target_position)
				end
			end
		end,
		leave = function (unit, data)
			local animation_variable_lean = data.animation_variable_lean

			if animation_variable_lean then
				animation_set_variable(unit, animation_variable_lean, 0)
			end
		end,
	},
}

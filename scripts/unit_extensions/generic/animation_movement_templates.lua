-- chunkname: @scripts/unit_extensions/generic/animation_movement_templates.lua

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
	local abs_right_dot = math.abs(right_dot)
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
end

AnimationMovementTemplates.chaos_troll = {
	owner = {
		init = function (unit, data)
			local blackboard = BLACKBOARDS[unit]

			data.blackboard = blackboard
			data.ai_extension = ScriptUnit.extension(unit, "ai_system")
			data.animation_variable_lean = Unit.animation_find_variable(unit, "lean")
			data.lean_lerp_speed = 5
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
					GameSession.set_game_object_field(game, go_id, "lean_target", lean_target_position)
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
			data.lean_lerp_speed = 5
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

DLCUtils.require_list("animation_movement_templates_file_names")

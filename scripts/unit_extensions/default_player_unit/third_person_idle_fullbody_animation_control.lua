-- chunkname: @scripts/unit_extensions/default_player_unit/third_person_idle_fullbody_animation_control.lua

ThirdPersonIdleFullbodyAnimationControl = class(ThirdPersonIdleFullbodyAnimationControl)

local MOVE_TRANSITION_TIME = 0.12
local STOP_TRANSITION_TIME = 0.25
local CROUCH_TRANSITION_TIME = 0.25
local STOP_VALUE = 1
local MOVE_VALUE = 0

ThirdPersonIdleFullbodyAnimationControl.init = function (self, unit)
	self._unit = unit
	self._idle_fullbody_variable = Unit.animation_find_variable(unit, "idle_fullbody")
	self._progress = 1
	self._is_moving = false
	self._is_crouching = false
	self._is_moving_transition_start_t = 0
	self._crouch_t = 0
end

ThirdPersonIdleFullbodyAnimationControl.extensions_ready = function (self, world, unit)
	self._locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
	self._status_extension = ScriptUnit.extension(unit, "status_system")
end

ThirdPersonIdleFullbodyAnimationControl._total_time = function (self, moving)
	local total_time = moving and MOVE_TRANSITION_TIME or STOP_TRANSITION_TIME

	return total_time
end

ThirdPersonIdleFullbodyAnimationControl._calculate_start_time = function (self, moving, t)
	local total_time = self:_total_time(moving)

	return t - total_time * (1 - self._progress)
end

ThirdPersonIdleFullbodyAnimationControl._wanted_fullbody_value = function (self, time_passed, moving, crouching, time_since_crouch)
	local total_time = self:_total_time(moving)
	local lerp_t = math.clamp01(time_passed / total_time)
	local progress = lerp_t

	if not moving then
		lerp_t = 1 - lerp_t
	end

	local wanted_value = math.lerp(STOP_VALUE, MOVE_VALUE, lerp_t)
	local crouch_from = crouching and 1 or 0
	local crouch_to = 1 - crouch_from
	local crouch_multiplier = math.clamp01(math.inv_lerp(crouch_from, crouch_to, time_since_crouch / CROUCH_TRANSITION_TIME))

	wanted_value = wanted_value * crouch_multiplier

	return wanted_value, progress
end

ThirdPersonIdleFullbodyAnimationControl._percentage_done = function (self, current_value)
	local percentage_done = 0

	return percentage_done
end

ThirdPersonIdleFullbodyAnimationControl.update = function (self, t)
	if not self._idle_fullbody_variable then
		return
	end

	local unit = self._unit
	local is_crouching = self._status_extension:is_crouching()
	local move_speed_squared = Vector3.length_squared(self._locomotion_extension:current_velocity())

	if move_speed_squared < NetworkConstants.VELOCITY_EPSILON * NetworkConstants.VELOCITY_EPSILON then
		move_speed_squared = 0
	end

	local was_moving = self._is_moving

	if not was_moving and move_speed_squared > 0 then
		self._is_moving = true
		self._is_moving_transition_start_t = self:_calculate_start_time(self._is_moving, t)
	elseif was_moving and move_speed_squared == 0 then
		self._is_moving = false
		self._is_moving_transition_start_t = self:_calculate_start_time(self._is_moving, t)
	end

	local is_moving = self._is_moving
	local was_crouching = self._is_crouching

	if is_crouching ~= was_crouching then
		self._crouch_t = t
		self._is_crouching = is_crouching
	end

	local time_since_stop = t - self._is_moving_transition_start_t
	local idle_fullbody_value, progress = self:_wanted_fullbody_value(time_since_stop, is_moving, is_crouching, t - self._crouch_t)

	Unit.animation_set_variable(unit, self._idle_fullbody_variable, idle_fullbody_value)

	self._idle_fullbody_value = idle_fullbody_value
	self._progress = progress
end

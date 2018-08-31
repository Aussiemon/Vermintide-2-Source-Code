require("scripts/helpers/mover_helper")

local Unit_local_position = Unit.local_position
local DEFAULT_ROTATION_SPEED = 10
local LOCOMOTION_GRAVITY = 20
local ALLOWED_MOVER_MOVE_DISTANCE = 0.5
AILocomotionExtensionC = class(AILocomotionExtensionC)

AILocomotionExtensionC.init = function (self, extension_init_context, unit, extension_init_data)
	self._unit = unit
	local blackboard = BLACKBOARDS[unit]
	local locomotion_gravity = 20
	local breed = blackboard.breed
	self._breed = breed
	local breed_run_speed = breed.run_speed
	local unit_template = Managers.state.unit_spawner.unit_template_lut[breed.unit_template]
	local go_type = unit_template and unit_template.go_type
	local game_object_template = Managers.state.network:game_object_template(go_type)
	local should_sync_rotation = game_object_template and not game_object_template.syncs_rotation and false

	fassert(game_object_template.syncs_rotation or game_object_template.syncs_yaw, "AI Locomotion error. AI units must have syncs_rotation or syncs_yaw set in its game_object_template.")

	self._engine_extension_id = EngineOptimizedExtensions.ai_locomotion_register_extension(unit, locomotion_gravity, breed_run_speed, should_sync_rotation)
	self._mover_state = MoverHelper.create_mover_state()
	local collision_actor_name = "c_mover_collision"
	local has_collision_actor = Unit.actor(unit, collision_actor_name)

	if has_collision_actor then
		self._collision_state = MoverHelper.create_collision_state(unit, collision_actor_name)
	end

	MoverHelper.set_active_mover(unit, self._mover_state, "mover")

	self.bone_lod = true
end

AILocomotionExtensionC.ready = function (self, go_id, blackboard)
	EngineOptimizedExtensions.ai_locomotion_ai_ready(self._engine_extension_id, go_id)
end

AILocomotionExtensionC.destroy = function (self)
	if self._engine_extension_id then
		EngineOptimizedExtensions.ai_locomotion_destroy_extension(self._engine_extension_id)

		self._engine_extension_id = nil
	end
end

AILocomotionExtensionC.freeze = function (self)
	EngineOptimizedExtensions.ai_locomotion_destroy_extension(self._engine_extension_id)

	self._engine_extension_id = nil
end

AILocomotionExtensionC.unfreeze = function (self, unit)
	local locomotion_gravity = 20
	local blackboard = BLACKBOARDS[unit]
	local breed = blackboard.breed
	local breed_run_speed = breed.run_speed
	local unit_template = Managers.state.unit_spawner.unit_template_lut[breed.unit_template]
	local go_type = unit_template and unit_template.go_type
	local game_object_template = Managers.state.network:game_object_template(go_type)
	local should_sync_rotation = game_object_template and not game_object_template.syncs_rotation and false
	self._engine_extension_id = EngineOptimizedExtensions.ai_locomotion_register_extension(unit, locomotion_gravity, breed_run_speed, should_sync_rotation)

	MoverHelper.set_active_mover(unit, self._mover_state, "mover")
	self:teleport_to(POSITION_LOOKUP[unit], Unit.local_rotation(unit, 0))
end

AILocomotionExtensionC.hot_join_sync = function (self, sender)
	if FROZEN[self._unit] then
		return
	end

	local unit = self._unit

	if Unit.has_animation_state_machine(unit) then
		local game_object_id = Managers.state.network:unit_game_object_id(unit)
		local breed = Unit.get_data(unit, "breed")

		RPC[breed.animation_sync_rpc](sender, game_object_id, Unit.animation_get_state(unit))
	else
		local game_object_id = Managers.state.network:unit_game_object_id(unit)

		RPC.rpc_hot_join_nail_to_wall_fix(sender, game_object_id)
	end
end

AILocomotionExtensionC.set_mover_displacement = function (self, displacement, duration)
	EngineOptimizedExtensions.ai_locomotion_set_mover_displacement(self._engine_extension_id, displacement, duration)
end

AILocomotionExtensionC.teleport_to = function (self, position, rotation)
	EngineOptimizedExtensions.ai_locomotion_teleport_to(self._engine_extension_id, position, rotation)
end

local ANIMATION_DRIVEN_SCRIPT_DRIVEN_ROTATION_FUNCTION_NAME = "update_animation_driven_movement_script_driven_rotation"
local ANIMATION_DRIVEN_FUNCTION_NAME = "update_animation_driven"
local SCRIPT_DRIVEN_FUNCTION_NAME = "update_script_driven"

AILocomotionExtensionC.set_animation_driven = function (self, is_animation_driven, is_affected_by_gravity, script_driven_rotation)
	is_affected_by_gravity = is_affected_by_gravity or false
	local r, param1, param2, param3 = EngineOptimizedExtensions.ai_locomotion_set_animation_driven(self._engine_extension_id, is_animation_driven, is_affected_by_gravity, script_driven_rotation)

	if r == 1 then
		local network_transmit = Managers.state.network.network_transmit
		local game_object_id = param1
		local position = param2
		local rotation = param3

		network_transmit:send_rpc_clients("rpc_set_animation_driven_script_movement", game_object_id, position, rotation, is_affected_by_gravity)
	elseif r == 2 then
		local network_transmit = Managers.state.network.network_transmit
		local game_object_id = param1
		local position = param2
		local rotation = param3

		network_transmit:send_rpc_clients("rpc_set_animation_driven", game_object_id, position, rotation, is_affected_by_gravity)
	elseif r == 3 then
		local network_transmit = Managers.state.network.network_transmit
		local game_object_id = param1

		network_transmit:send_rpc_clients("rpc_set_script_driven", game_object_id, is_affected_by_gravity)
	elseif r == 4 then
		local network_transmit = Managers.state.network.network_transmit
		local game_object_id = param1

		network_transmit:send_rpc_clients("rpc_set_affected_by_gravity", game_object_id, is_affected_by_gravity)
	end
end

AILocomotionExtensionC.set_animation_translation_scale = function (self, animation_translation_scale)
	EngineOptimizedExtensions.ai_locomotion_set_animation_translation_scale(self._engine_extension_id, animation_translation_scale)
end

AILocomotionExtensionC.set_animation_rotation_scale = function (self, animation_rotation_scale)
	EngineOptimizedExtensions.ai_locomotion_set_animation_rotation_scale(self._engine_extension_id, animation_rotation_scale)
end

AILocomotionExtensionC.set_wanted_velocity_flat = function (self, wanted_velocity)
	EngineOptimizedExtensions.ai_locomotion_set_wanted_velocity_flat(self._engine_extension_id, wanted_velocity)
end

AILocomotionExtensionC.set_wanted_velocity = function (self, wanted_velocity)
	EngineOptimizedExtensions.ai_locomotion_set_wanted_velocity(self._engine_extension_id, wanted_velocity)
end

AILocomotionExtensionC.set_external_velocity = function (self, external_velocity)
	EngineOptimizedExtensions.ai_locomotion_set_external_velocity(self._engine_extension_id, external_velocity)
end

AILocomotionExtensionC.set_wanted_rotation = function (self, rotation)
	EngineOptimizedExtensions.ai_locomotion_set_wanted_rotation(self._engine_extension_id, rotation)
end

AILocomotionExtensionC.use_lerp_rotation = function (self, active)
	EngineOptimizedExtensions.ai_locomotion_use_lerp_rotation(self._engine_extension_id, active)
end

AILocomotionExtensionC.set_rotation_speed = function (self, rotation_speed)
	EngineOptimizedExtensions.ai_locomotion_set_rotation_speed(self._engine_extension_id, rotation_speed)
end

AILocomotionExtensionC.set_rotation_speed_modifier = function (self, rotation_speed_modifier, rotation_speed_modifier_lerp_time, start_time)
	EngineOptimizedExtensions.ai_locomotion_set_rotation_speed_modifier(self._engine_extension_id, rotation_speed_modifier, rotation_speed_modifier_lerp_time, start_time)
end

AILocomotionExtensionC.set_affected_by_gravity = function (self, affected_by_gravity)
	EngineOptimizedExtensions.ai_locomotion_set_affected_by_gravity(self._engine_extension_id, affected_by_gravity)
end

AILocomotionExtensionC.set_gravity = function (self, gravity)
	EngineOptimizedExtensions.ai_locomotion_set_gravity(self._engine_extension_id, gravity)
end

AILocomotionExtensionC.set_check_falling = function (self, state)
	EngineOptimizedExtensions.ai_locomotion_set_check_falling(self._engine_extension_id, state)
end

local movement_types = {
	script_driven = 0,
	snap_to_navmesh = 1,
	constrained_by_mover = 2,
	disabled = 3
}

AILocomotionExtensionC.set_movement_type = function (self, movement_type, override_mover_move_distance, ignore_forced_mover_kill)
	if movement_type == self.movement_type then
		return true
	end

	self.movement_type = movement_type

	if movement_type == "script_driven" then
		MoverHelper.set_disable_reason(self._unit, self._mover_state, "constrained_by_mover", true)
	elseif movement_type == "snap_to_navmesh" then
		MoverHelper.set_disable_reason(self._unit, self._mover_state, "constrained_by_mover", true)
	elseif movement_type == "constrained_by_mover" then
		MoverHelper.set_disable_reason(self._unit, self._mover_state, "constrained_by_mover", false)
	end

	local breed = self._breed
	local kill = EngineOptimizedExtensions.ai_locomotion_set_movement_type(self._engine_extension_id, movement_types[movement_type], override_mover_move_distance)

	if kill and not ignore_forced_mover_kill then
		local damage_type = "forced"
		local damage_direction = Vector3(0, 0, -1)

		AiUtils.kill_unit(self._unit, nil, nil, damage_type, damage_direction)
	end

	return not kill
end

AILocomotionExtensionC.current_velocity = function (self)
	return EngineOptimizedExtensions.ai_locomotion_get_velocity(self._engine_extension_id)
end

AILocomotionExtensionC.is_falling = function (self)
	return EngineOptimizedExtensions.ai_locomotion_is_falling(self._engine_extension_id)
end

AILocomotionExtensionC.get_rotation_speed = function (self)
	return EngineOptimizedExtensions.ai_locomotion_get_rotation_speed(self._engine_extension_id)
end

AILocomotionExtensionC.get_rotation_speed_modifier = function (self)
	return EngineOptimizedExtensions.ai_locomotion_get_rotation_speed_modifier(self._engine_extension_id)
end

AILocomotionExtensionC.set_disabled = function (self)
	EngineOptimizedExtensions.ai_locomotion_set_disabled(self._engine_extension_id)
	MoverHelper.set_disable_reason(unit, self._mover_state, "constrained_by_mover", true)
end

AILocomotionExtensionC.set_mover_disable_reason = function (self, reason, state)
	MoverHelper.set_disable_reason(self._unit, self._mover_state, reason, state)
end

AILocomotionExtensionC.set_collision_disabled = function (self, reason, state)
	if self._collision_state then
		MoverHelper.set_collision_disable_reason(self._unit, self._collision_state, reason, state)
	end
end

return

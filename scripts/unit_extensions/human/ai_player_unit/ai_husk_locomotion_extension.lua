require("scripts/helpers/mover_helper")

local ALLOWED_MOVER_MOVE_DISTANCE = 0.5
AiHuskLocomotionExtension = class(AiHuskLocomotionExtension)

AiHuskLocomotionExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._unit = unit
	self._system_data = extension_init_data.system_data
	self._game = extension_init_data.game
	self._go_id = extension_init_data.go_id

	Unit.set_animation_merge_options(unit)

	self._velocity = Vector3Box(0, 0, 0)
	self._breed = extension_init_data.breed
	local ai_system = Managers.state.entity:system("ai_system")
	local client_traverse_logic = ai_system:client_traverse_logic()
	self._nav_world = ai_system:nav_world()
	self._world = extension_init_context.world
	self._traverse_logic = client_traverse_logic
	self._move_speed_anim_var = Unit.animation_find_variable(unit, "move_speed")
	self._animation_translation_scale = Vector3Box(1, 1, 1)
	self._animation_rotation_scale = 1
	self.is_affected_by_gravity = false
	self.hit_wall = false
	local level_settings = LevelHelper:current_level_settings()
	local flow_event = level_settings.on_spawn_flow_event

	if flow_event then
		Unit.flow_event(unit, flow_event)
	end

	self.constrain_min = {
		0,
		0,
		0
	}
	self.constrain_max = {
		0,
		0,
		0
	}
	self.last_lerp_position = Vector3Box(Unit.local_position(unit, 0))
	self.last_lerp_position_offset = Vector3Box()
	self.accumulated_movement = Vector3Box()
	local has_teleported = GameSession.game_object_field(self._game, self._go_id, "has_teleported")
	self.has_teleported = has_teleported
	self._pos_lerp_time = 0
	self._update_function_name = "update_network_driven"
	self._mover_state = MoverHelper.create_mover_state()
	local collision_actor_name = "c_mover_collision"
	local has_collision_actor = Unit.actor(unit, collision_actor_name)

	if has_collision_actor then
		self._collision_state = MoverHelper.create_collision_state(unit, "c_mover_collision")
	end

	MoverHelper.set_active_mover(unit, self._mover_state, "mover")
	self:set_mover_disable_reason("not_constrained_by_mover", true)

	self._system_data.all_update_units[unit] = self
	self._system_data.pure_network_update_units[unit] = self
	local unit_template = Managers.state.unit_spawner.unit_template_lut[self._breed.unit_template]
	local go_type = unit_template and unit_template.go_type
	local game_object_template = Managers.state.network:game_object_template(go_type)
	local should_sync_rotation = game_object_template and not game_object_template.syncs_rotation and false
	self._engine_extension_id = EngineOptimizedExtensions.ai_husk_locomotion_register_extension(unit, self._go_id, has_teleported, client_traverse_logic, should_sync_rotation)

	EngineOptimizedExtensions.ai_husk_locomotion_set_is_network_driven(self._engine_extension_id, true)

	self.is_network_driven = true
end

AiHuskLocomotionExtension.destroy = function (self)
	self:_cleanup()
end

AiHuskLocomotionExtension.freeze = function (self)
	self:_cleanup()
end

AiHuskLocomotionExtension._cleanup = function (self)
	local unit = self._unit
	self._system_data.all_update_units[unit] = nil
	self._system_data.pure_network_update_units[unit] = nil
	self._system_data.other_update_units[unit] = nil

	if self._engine_extension_id then
		EngineOptimizedExtensions.ai_husk_locomotion_unregister_extension(self._engine_extension_id)

		self._engine_extension_id = nil
	end
end

AiHuskLocomotionExtension.unfreeze = function (self)
	local unit = self._unit

	Unit.set_animation_merge_options(unit)
	self._velocity:store(Vector3(0, 0, 0))
	self._animation_translation_scale:store(Vector3(1, 1, 1))

	self._animation_rotation_scale = 1
	self.is_affected_by_gravity = false
	self.hit_wall = false
	local level_settings = LevelHelper:current_level_settings()
	local flow_event = level_settings.on_spawn_flow_event

	if flow_event then
		Unit.flow_event(unit, flow_event)
	end

	self.constrain_min = {
		0,
		0,
		0
	}
	self.constrain_max = {
		0,
		0,
		0
	}

	self.last_lerp_position:store(Unit.local_position(unit, 0))
	self.last_lerp_position_offset:store(Vector3(0, 0, 0))
	self.accumulated_movement:store(Vector3(0, 0, 0))

	self._pos_lerp_time = 0
	self._update_function_name = "update_network_driven"
	self._mover_state = MoverHelper.create_mover_state()
	local collision_actor_name = "c_mover_collision"
	local has_collision_actor = Unit.actor(unit, collision_actor_name)

	if has_collision_actor then
		self._collision_state = MoverHelper.create_collision_state(unit, "c_mover_collision")
	end

	MoverHelper.set_active_mover(unit, self._mover_state, "mover")
	self:set_mover_disable_reason("not_constrained_by_mover", true)

	self._system_data.all_update_units[unit] = self
	self._system_data.pure_network_update_units[unit] = self
	local unit_template = Managers.state.unit_spawner.unit_template_lut[self._breed.unit_template]
	local go_type = unit_template and unit_template.go_type
	local game_object_template = Managers.state.network:game_object_template(go_type)
	local should_sync_rotation = game_object_template and not game_object_template.syncs_rotation and false
	self._engine_extension_id = EngineOptimizedExtensions.ai_husk_locomotion_register_extension(unit, self._go_id, self.has_teleported, self._client_traverse_logic, should_sync_rotation)

	EngineOptimizedExtensions.ai_husk_locomotion_set_is_network_driven(self._engine_extension_id, true)

	self.is_network_driven = true
end

AiHuskLocomotionExtension.set_animation_translation_scale = function (self, animation_translation_scale)
	self._animation_translation_scale = Vector3Box(animation_translation_scale)

	if self._engine_extension_id then
		EngineOptimizedExtensions.ai_husk_locomotion_set_animation_translation_scale(self._engine_extension_id, animation_translation_scale)
	end
end

AiHuskLocomotionExtension.set_animation_rotation_scale = function (self, animation_rotation_scale)
	self._animation_rotation_scale = animation_rotation_scale

	if self._engine_extension_id then
		EngineOptimizedExtensions.ai_husk_locomotion_set_animation_rotation_scale(self._engine_extension_id, animation_rotation_scale)
	end
end

AiHuskLocomotionExtension.set_affected_by_gravity = function (self, affected)
	self.is_affected_by_gravity = affected

	if self._engine_extension_id then
		EngineOptimizedExtensions.ai_husk_locomotion_set_is_affected_by_gravity(self._engine_extension_id, affected)
	end
end

AiHuskLocomotionExtension.set_animation_driven = function (self, is_animation_driven, is_affected_by_gravity, has_script_driven_rotation)
	if not self._engine_extension_id then
		return
	end

	is_affected_by_gravity = not not is_affected_by_gravity
	self.is_animation_driven = is_animation_driven
	self.has_network_driven_rotation = has_script_driven_rotation
	self.is_affected_by_gravity = is_affected_by_gravity
	self.hit_wall = false
	local network_driven = not is_animation_driven or not is_affected_by_gravity
	self.is_network_driven = network_driven

	self:set_mover_disable_reason("not_constrained_by_mover", true)

	local system_data = self._system_data

	if network_driven then
		system_data.other_update_units[self._unit] = nil
		system_data.pure_network_update_units[self._unit] = self
	else
		system_data.other_update_units[self._unit] = self
		system_data.pure_network_update_units[self._unit] = nil
	end

	EngineOptimizedExtensions.ai_husk_locomotion_set_has_network_driven_rotation(self._engine_extension_id, has_script_driven_rotation)
	EngineOptimizedExtensions.ai_husk_locomotion_set_is_network_driven(self._engine_extension_id, network_driven)
	EngineOptimizedExtensions.ai_husk_locomotion_set_is_affected_by_gravity(self._engine_extension_id, is_affected_by_gravity)
end

AiHuskLocomotionExtension.set_mover_disable_reason = function (self, reason, state)
	MoverHelper.set_disable_reason(self._unit, self._mover_state, reason, state)
end

AiHuskLocomotionExtension.set_constrained = function (self, constrain, min, max)
	if not self._engine_extension_id then
		return
	end

	self.is_constrained = constrain

	if constrain then
		Vector3Aux.box(self.constrain_min, min)
		Vector3Aux.box(self.constrain_max, max)
	end

	EngineOptimizedExtensions.ai_husk_locomotion_set_is_constrained(self._engine_extension_id, constrain, min, max)
end

AiHuskLocomotionExtension.teleport_to = function (self, position, rotation, velocity, dontseparate)
	if not self._engine_extension_id then
		return
	end

	self.hit_wall = false
	local unit = self._unit
	local mover = Unit.mover(unit)

	if mover and not dontseparate then
		local breed = self._breed
		local mover_move_distance = breed.override_mover_move_distance or ALLOWED_MOVER_MOVE_DISTANCE

		Mover.set_position(mover, position)
		LocomotionUtils.separate_mover_fallbacks(mover, mover_move_distance)

		position = Mover.position(mover)
	end

	velocity = velocity or Vector3.zero()

	Unit.set_local_position(unit, 0, position)
	Unit.set_local_rotation(unit, 0, rotation)
	self._velocity:store(velocity)

	self._pos_lerp_time = 0

	EngineOptimizedExtensions.ai_husk_locomotion_teleport_to(self._engine_extension_id, position, rotation, velocity)
end

AiHuskLocomotionExtension.set_collision_disabled = function (self, reason, state)
	if self._collision_state then
		MoverHelper.set_collision_disable_reason(self._unit, self._collision_state, reason, state)
	end
end

AiHuskLocomotionExtension.current_velocity = function (self)
	return self._velocity:unbox()
end

AiHuskLocomotionExtension.traverse_logic = function (self)
	return self._traverse_logic
end

AiHuskLocomotionExtension.hot_join_sync = function (self, sender)
	assert(false, "ai is never husk on server")
end

return

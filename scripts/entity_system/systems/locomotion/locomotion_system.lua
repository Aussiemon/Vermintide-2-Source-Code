LocomotionSystem = class(LocomotionSystem, ExtensionSystemBase)

require("scripts/unit_extensions/default_player_unit/player_unit_locomotion_extension")
require("scripts/unit_extensions/default_player_unit/player_husk_locomotion_extension")
require("scripts/entity_system/systems/locomotion/locomotion_templates_ai")
require("scripts/entity_system/systems/locomotion/locomotion_templates_ai_c")
require("scripts/entity_system/systems/locomotion/locomotion_templates_ai_husk")
require("scripts/entity_system/systems/locomotion/locomotion_templates_player")

local LocomotionTemplates = LocomotionTemplates
local RPCS = {
	"rpc_set_animation_driven_script_movement",
	"rpc_set_script_driven",
	"rpc_set_animation_driven",
	"rpc_set_animation_translation_scale",
	"rpc_set_animation_rotation_scale",
	"rpc_disable_locomotion",
	"rpc_teleport_unit_to",
	"rpc_enable_linked_movement",
	"rpc_disable_linked_movement",
	"rpc_add_external_velocity",
	"rpc_add_external_velocity_with_upper_limit",
	"rpc_constrain_ai",
	"rpc_set_on_moving_platform",
	"rpc_hot_join_nail_to_wall_fix",
	"rpc_set_forced_velocity"
}
local extensions = {
	"AiHuskLocomotionExtension",
	"AILocomotionExtension",
	"AILocomotionExtensionC",
	"PlayerHuskLocomotionExtension",
	"PlayerUnitLocomotionExtension"
}
LocomotionSystem.init = function (self, entity_system_creation_context, system_name)
	LocomotionSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	local network_event_delegate = entity_system_creation_context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate.register(network_event_delegate, self, unpack(RPCS))

	self.world = entity_system_creation_context.world
	self.animation_lod_units = {}
	self.animation_lod_unit_current = nil
	self.lod0 = 0
	self.lod1 = 0
	self.current_physics_test_unit = nil
	self.player_units = {}
	self.template_data = {}

	for template_name, template in pairs(LocomotionTemplates) do
		if template_name ~= "AILocomotionExtensionC" then
			local data = {}

			template.init(data, GLOBAL_AI_NAVWORLD)

			self.template_data[template_name] = data
		elseif template_name == "PlayerUnitLocomotionExtension" then
			local data = {}

			template.init(data, GLOBAL_AI_NAVWORLD)

			self.template_data[template_name] = data
		end
	end

	if EngineOptimizedExtensions.init_husk_extensions then
		EngineOptimizedExtensions.init_husk_extensions()

		if GameSettingsDevelopment.use_engine_optimized_ai_locomotion then
			local physics_world = World.get_data(self.world, "physics_world")
			local game_session = Managers.state.network:game()

			EngineOptimizedExtensions.init_extensions(physics_world, GLOBAL_AI_NAVWORLD, game_session)
		end
	else
		EngineOptimizedExtensions.init_extensions()
	end

	if not GameSettingsDevelopment.use_engine_optimized_ai_locomotion then
		extensions.AILocomotionExtensionC = nil
	end

	EngineOptimized.bone_lod_init(GameSettingsDevelopment.bone_lod_husks.lod_out_range_sq, GameSettingsDevelopment.bone_lod_husks.lod_in_range_sq, GameSettingsDevelopment.bone_lod_husks.lod_multiplier)

	return 
end
LocomotionSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)
	EngineOptimized.bone_lod_destroy()

	if EngineOptimizedExtensions.destroy_husk_extensions then
		EngineOptimizedExtensions.destroy_husk_extensions()

		if GameSettingsDevelopment.use_engine_optimized_ai_locomotion then
			EngineOptimizedExtensions.destroy_extensions()
		end
	else
		EngineOptimizedExtensions.destroy_extensions()
	end

	return 
end
LocomotionSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	if extension_name == "AILocomotionExtension" then
		local game_object_id = network_manager:unit_game_object_id(selected_unit)
		local blackboard = BLACKBOARDS[unit]
		local wanted_destination_boxed = blackboard.navigation_extension._wanted_destination
		local locomotion_gravity = 20
		local breed_run_speed = blackboard.breed.run_speed

		EngineOptimized.ai_locomotion_register_extension(unit, game_object_id, wanted_destination_boxed, locomotion_gravity, breed_run_speed, breed.sync_full_rotation)
	else
		extension_init_data.system_data = self.template_data[extension_name]
		local extension = LocomotionSystem.super.on_add_extension(self, world, unit, extension_name, extension_init_data)

		return extension
	end

	return 
end
LocomotionSystem.extensions_ready = function (self, world, unit, extension_name)
	local extension = ScriptUnit.extension(unit, "locomotion_system")

	if extension_name == "AILocomotionExtensionC" or extension_name == "AILocomotionExtension" or extension_name == "AiHuskLocomotionExtension" then
		local breed = ScriptUnit.extension(unit, "ai_system")._breed
		local bone_lod_level = breed.bone_lod_level

		if 0 < bone_lod_level and not script_data.bone_lod_disable then
			extension.bone_lod_extension_id = EngineOptimized.bone_lod_register_extension(unit)
			self.animation_lod_units[unit] = extension
			extension.bone_lod_level = bone_lod_level

			Unit.set_bones_lod(unit, 1)

			self.lod1 = self.lod1 + 1
		end

		extension.time_to_check = 0
	else
		self.player_units[unit] = extension
	end

	return 
end
LocomotionSystem.on_remove_extension = function (self, unit, extension_name)
	self.on_freeze_extension(self, unit, extension_name)
	LocomotionSystem.super.on_remove_extension(self, unit, extension_name)

	return 
end
LocomotionSystem.on_freeze_extension = function (self, unit, extension_name)
	if extension_name == "AILocomotionExtensionC" or extension_name == "AILocomotionExtension" or extension_name == "AiHuskLocomotionExtension" then
		local extension = self.animation_lod_units[unit]

		if extension then
			EngineOptimized.bone_lod_unregister_extension(extension.bone_lod_extension_id)

			self.animation_lod_units[unit] = nil
		end
	end

	return 
end
LocomotionSystem.update = function (self, context, t)
	self.update_extensions(self, context, t)
	self.update_animation_lods(self)
	self.update_actor_proximity_shapes(self)

	return 
end
LocomotionSystem.update_extensions = function (self, context, t)
	local dt = context.dt

	self.update_extension(self, "PlayerHuskLocomotionExtension", dt, context, t)
	self.update_extension(self, "PlayerUnitLocomotionExtension", dt, context, t)

	if GameSettingsDevelopment.use_engine_optimized_ai_locomotion then
		if self.is_server then
			LocomotionTemplates.AILocomotionExtensionC.update(nil, t, dt)
		else
			local data = self.template_data.AiHuskLocomotionExtension

			LocomotionTemplates.AiHuskLocomotionExtension.update(data, t, dt)
		end

		local data = self.template_data.PlayerUnitLocomotionExtension

		LocomotionTemplates.PlayerUnitLocomotionExtension.update(data, t, dt)
	else
		for template_name, data in pairs(self.template_data) do
			local template = LocomotionTemplates[template_name]

			template.update(data, t, dt)
		end
	end

	return 
end
LocomotionSystem.set_override_player = function (self, player)
	self._override_player = player

	return 
end
LocomotionSystem.update_animation_lods = function (self)
	if DEDICATED_SERVER then
		return 
	end

	local player = self._override_player or Managers.player:local_player()
	local viewport_name = player.viewport_name
	local viewport = ScriptWorld.viewport(self.world, viewport_name)
	local camera = ScriptViewport.camera(viewport)

	EngineOptimized.bone_lod_update(self.world, camera)

	return 
end
LocomotionSystem.update_actor_proximity_shapes = function (self)
	local POSITION_LOOKUP = POSITION_LOOKUP
	local player_manager = Managers.player
	local physics_world = World.get_data(self.world, "physics_world")
	local default_insta_hit_cone_angle = math.degrees_to_radians(17)
	local Quaternion_forward = Quaternion.forward
	local human_and_bot_players = player_manager.human_and_bot_players(player_manager)

	for id, player in pairs(human_and_bot_players) do
		local unit = player.player_unit

		if unit and not player.remote then
			local first_persion_system = ScriptUnit.extension(unit, "first_person_system")
			local inventory_extension = ScriptUnit.extension(unit, "inventory_system")
			local position = first_persion_system.current_position(first_persion_system)
			local direction = Quaternion_forward(first_persion_system.current_rotation(first_persion_system))
			local angle = nil
			local slot_name = inventory_extension.get_wielded_slot_name(inventory_extension)

			if slot_name == "slot_ranged" then
				local equipment = inventory_extension.equipment(inventory_extension)
				local weapon_unit = equipment.right_hand_wielded_unit or equipment.left_hand_wielded_unit

				if weapon_unit and ScriptUnit.has_extension(weapon_unit, "spread_system") then
					local spread_extension = ScriptUnit.extension(weapon_unit, "spread_system")
					local pitch, yaw = spread_extension.get_current_pitch_and_yaw(spread_extension)
					angle = math.degrees_to_radians(math.max(pitch, yaw))
				end
			end

			PhysicsWorld.commit_actor_proximity_shape(physics_world, position, direction, 36, angle, true)
		end
	end

	return 
end
LocomotionSystem.debug_draw = function (self)
	if script_data.show_engine_locomotion_debug and GameSettingsDevelopment.use_engine_optimized_ai_locomotion then
		local num_all, num_free, num_script_driven, num_get_to_navmesh, num_snap_to_navmesh, num_mover_constrained, num_animation_driven, num_affected_by_gravity, num_rotation_speed, num_animation_and_script = EngineOptimizedExtensions.ai_locomotion_get_debug_info()
		local s = self.stats

		if not s then
			s = {
				num_get_to_navmesh = 0,
				num_free = 0,
				num_affected_by_gravity = 0,
				num_snap_to_navmesh = 0,
				num_script_driven = 0,
				num_mover_constrained = 0,
				num_rotation_speed = 0,
				num_animation_and_script = 0,
				num_all = 0,
				num_animation_driven = 0
			}
			self.stats = s
		end

		s.num_all = math.max(num_all, s.num_all)
		s.num_free = math.max(num_free, s.num_free)
		s.num_script_driven = math.max(num_script_driven, s.num_script_driven)
		s.num_get_to_navmesh = math.max(num_get_to_navmesh, s.num_get_to_navmesh)
		s.num_snap_to_navmesh = math.max(num_snap_to_navmesh, s.num_snap_to_navmesh)
		s.num_mover_constrained = math.max(num_mover_constrained, s.num_mover_constrained)
		s.num_animation_driven = math.max(num_animation_driven, s.num_animation_driven)
		s.num_affected_by_gravity = math.max(num_affected_by_gravity, s.num_affected_by_gravity)
		s.num_rotation_speed = math.max(num_rotation_speed, s.num_rotation_speed)
		s.num_animation_and_script = math.max(num_animation_and_script, s.num_animation_and_script)

		Debug.text("EngineLocomotion amount for each category: right now/peak in game")
		Debug.text("Num all: %d/%d, free: %d/%d, script_driven: %d/%d, snap_to_navmesh: %d/%d, animation_driven: %d/%d, mover_constrained: %d/%d, get_to_navmesh %d/%d", num_all, s.num_all, num_free, s.num_free, num_script_driven, s.num_script_driven, num_snap_to_navmesh, s.num_snap_to_navmesh, num_animation_driven, s.num_animation_driven, num_mover_constrained, s.num_mover_constrained, num_get_to_navmesh, s.num_get_to_navmesh)
		Debug.text("Num affected_by_gravity: %d/%d, rotation_speed: %d/%d, animation_and_script: %d/%d", num_affected_by_gravity, s.num_affected_by_gravity, num_rotation_speed, s.num_rotation_speed, num_animation_and_script, s.num_animation_and_script)
	end

	local unit = script_data.debug_unit
	local locomotion_extension = ScriptUnit.has_extension(unit, "locomotion_system")

	if not Unit.alive(unit) or script_data.debug_ai_movement ~= "text_and_graphics" or not locomotion_extension then
		return 
	end

	Debug.text("AI LOCOMOTION DEBUG")
	Debug.text("  movement_type = %s", locomotion_extension.movement_type)
	Debug.text("  is_falling = %s", tostring((locomotion_extension.is_falling == nil and "?") or locomotion_extension.is_falling(locomotion_extension)))
	Debug.text("  current_velocity = %s", tostring(locomotion_extension.current_velocity(locomotion_extension)))

	return 
end
LocomotionSystem.rpc_set_affected_by_gravity = function (self, sender, game_object_id, affected)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit then
		printf("unit from game_object_id %d is nil", game_object_id)

		return 
	end

	local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

	locomotion_extension.set_affected_by_gravity(locomotion_extension, affected)

	return 
end
LocomotionSystem.rpc_set_animation_driven_movement = function (self, sender, game_object_id, animation_driven, script_driven_rotation, is_affected_by_gravity, position, rotation)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit then
		printf("unit from game_object_id %d is nil", game_object_id)

		return 
	end

	local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

	locomotion_extension.set_animation_driven(locomotion_extension, animation_driven, is_affected_by_gravity, script_driven_rotation)

	if animation_driven then
		locomotion_extension.teleport_to(locomotion_extension, position, rotation, locomotion_extension.current_velocity(locomotion_extension))
	end

	return 
end
LocomotionSystem.rpc_set_animation_driven_script_movement = function (self, sender, game_object_id, position, rotation, is_affected_by_gravity)
	self.rpc_set_animation_driven_movement(self, sender, game_object_id, true, true, is_affected_by_gravity, position, rotation)

	return 
end
LocomotionSystem.rpc_set_animation_driven = function (self, sender, game_object_id, position, rotation, is_affected_by_gravity)
	self.rpc_set_animation_driven_movement(self, sender, game_object_id, true, false, is_affected_by_gravity, position, rotation)

	return 
end
LocomotionSystem.rpc_set_script_driven = function (self, sender, game_object_id, position, rotation, is_affected_by_gravity)
	self.rpc_set_animation_driven_movement(self, sender, game_object_id, false, true, is_affected_by_gravity, nil)

	return 
end
LocomotionSystem.rpc_set_animation_translation_scale = function (self, sender, game_object_id, animation_translation_scale)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit then
		printf("unit from game_object_id %d is nil", game_object_id)

		return 
	end

	local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

	locomotion_extension.set_animation_translation_scale(locomotion_extension, animation_translation_scale)

	return 
end
LocomotionSystem.rpc_set_animation_rotation_scale = function (self, sender, game_object_id, animation_rotation_scale)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit then
		printf("unit from game_object_id %d is nil", game_object_id)

		return 
	end

	local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

	locomotion_extension.set_animation_rotation_scale(locomotion_extension, animation_rotation_scale)

	return 
end
LocomotionSystem.rpc_disable_locomotion = function (self, sender, game_object_id, disabled, update_func_id)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit then
		printf("unit from game_object_id %d is nil", game_object_id)

		return 
	end

	local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
	local func = LocomotionUtils[NetworkLookup.movement_funcs[update_func_id]]

	locomotion_extension.set_disabled(locomotion_extension, disabled, func)

	if self.is_server then
		self.network_transmit:send_rpc_clients_except("rpc_disable_locomotion", sender, game_object_id, disabled, update_func_id)
	end

	return 
end
LocomotionSystem.rpc_teleport_unit_to = function (self, sender, game_object_id, position, rotation)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit then
		printf("unit from game_object_id %d is nil", game_object_id)

		return 
	end

	local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

	locomotion_extension.teleport_to(locomotion_extension, position, rotation)

	return 
end
LocomotionSystem.rpc_enable_linked_movement = function (self, sender, game_object_id, parent_level_unit_index, parent_node_index, offset)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit then
		printf("unit from game_object_id %d is nil", game_object_id)

		return 
	end

	local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
	local level = LevelHelper:current_level(self.world)
	local parent_unit = Level.unit_by_index(level, parent_level_unit_index)

	locomotion_extension.enable_linked_movement(locomotion_extension, parent_unit, parent_node_index, offset)

	return 
end
LocomotionSystem.rpc_disable_linked_movement = function (self, sender, game_object_id)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit then
		printf("unit from game_object_id %d is nil", game_object_id)

		return 
	end

	local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

	locomotion_extension.disable_linked_movement(locomotion_extension)

	return 
end
LocomotionSystem.rpc_add_external_velocity = function (self, sender, game_object_id, velocity)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit then
		printf("unit from game_object_id %d is nil", game_object_id)

		return 
	end

	local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

	locomotion_extension.add_external_velocity(locomotion_extension, velocity)

	return 
end
LocomotionSystem.rpc_add_external_velocity_with_upper_limit = function (self, sender, game_object_id, velocity, upper_limit)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit then
		printf("unit from game_object_id %d is nil", game_object_id)

		return 
	end

	local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

	locomotion_extension.add_external_velocity(locomotion_extension, velocity, upper_limit)

	return 
end
LocomotionSystem.rpc_set_forced_velocity = function (self, sender, game_object_id, velocity)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit then
		printf("unit from game_object_id %d is nil", game_object_id)

		return 
	end

	local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

	locomotion_extension.set_forced_velocity(locomotion_extension, velocity)

	return 
end
LocomotionSystem.rpc_constrain_ai = function (self, sender, game_object_id, constrain, min, max)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit then
		printf("unit from game_object_id %d is nil", game_object_id)

		return 
	end

	local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

	locomotion_extension.set_constrained(locomotion_extension, constrain, min, max)

	return 
end
LocomotionSystem.rpc_set_on_moving_platform = function (self, sender, game_object_id, unit_index)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit then
		printf("unit from game_object_id %d is nil", game_object_id)

		return 
	end

	local level = LevelHelper:current_level(self.world)
	local platform_unit = Level.unit_by_index(level, unit_index)
	local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

	locomotion_extension.set_on_moving_platform(locomotion_extension, platform_unit)

	return 
end
LocomotionSystem.rpc_hot_join_nail_to_wall_fix = function (self, sender, game_object_id)
	local unit = self.unit_storage:unit(game_object_id)

	if Unit.has_animation_state_machine(unit) then
		Unit.animation_event(unit, "ragdoll")
	end

	return 
end

return 

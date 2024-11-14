-- chunkname: @scripts/entity_system/systems/locomotion/locomotion_system.lua

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
	"rpc_teleport_unit_with_yaw_rotation",
	"rpc_enable_linked_movement",
	"rpc_disable_linked_movement",
	"rpc_add_external_velocity",
	"rpc_add_external_velocity_with_upper_limit",
	"rpc_constrain_ai",
	"rpc_set_on_moving_platform",
	"rpc_hot_join_nail_to_wall_fix",
	"rpc_set_forced_velocity",
	"rpc_set_affected_by_gravity",
	"rpc_set_linked_transport_driven",
}
local extensions = {
	"AiHuskLocomotionExtension",
	"AILocomotionExtension",
	"AILocomotionExtensionC",
	"PlayerHuskLocomotionExtension",
	"PlayerUnitLocomotionExtension",
}

LocomotionSystem.init = function (self, entity_system_creation_context, system_name)
	LocomotionSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	local network_event_delegate = entity_system_creation_context.network_event_delegate

	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))

	self.world = entity_system_creation_context.world
	self.animation_lod_units = {}
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

	EngineOptimizedExtensions.init_husk_extensions()

	if GameSettingsDevelopment.use_engine_optimized_ai_locomotion then
		local physics_world = World.get_data(self.world, "physics_world")
		local game_session = Managers.state.network:game()

		EngineOptimizedExtensions.init_extensions(physics_world, GLOBAL_AI_NAVWORLD, game_session)
	end

	if not GameSettingsDevelopment.use_engine_optimized_ai_locomotion then
		extensions.AILocomotionExtensionC = nil
	end

	EngineOptimized.bone_lod_init(GameSettingsDevelopment.bone_lod_husks.lod_in_range_sq, GameSettingsDevelopment.bone_lod_husks.lod_out_range_sq, GameSettingsDevelopment.bone_lod_husks.lod_multiplier)
end

LocomotionSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)
	EngineOptimized.bone_lod_destroy()
	EngineOptimizedExtensions.destroy_husk_extensions()

	if GameSettingsDevelopment.use_engine_optimized_ai_locomotion then
		EngineOptimizedExtensions.destroy_extensions()
	end
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
end

LocomotionSystem.extensions_ready = function (self, world, unit, extension_name)
	local extension = ScriptUnit.extension(unit, "locomotion_system")

	if extension_name == "AILocomotionExtensionC" or extension_name == "AILocomotionExtension" or extension_name == "AiHuskLocomotionExtension" then
		local breed = extension.breed
		local bone_lod_level = breed.bone_lod_level

		if bone_lod_level > 0 and not script_data.bone_lod_disable then
			extension.bone_lod_extension_id = EngineOptimized.bone_lod_register_extension(unit)
			self.animation_lod_units[unit] = extension
		end
	else
		self.player_units[unit] = extension
	end
end

LocomotionSystem.on_remove_extension = function (self, unit, extension_name)
	self:_cleanup_extension(unit, extension_name)
	LocomotionSystem.super.on_remove_extension(self, unit, extension_name)
end

LocomotionSystem.on_freeze_extension = function (self, unit, extension_name)
	return
end

LocomotionSystem._cleanup_extension = function (self, unit, extension_name)
	if extension_name == "AILocomotionExtensionC" or extension_name == "AILocomotionExtension" or extension_name == "AiHuskLocomotionExtension" then
		local extension = self.animation_lod_units[unit]

		if extension then
			EngineOptimized.bone_lod_unregister_extension(extension.bone_lod_extension_id)

			extension.bone_lod_extension_id = nil
			self.animation_lod_units[unit] = nil
		end
	end
end

LocomotionSystem.freeze = function (self, unit, extension_name, reason)
	fassert(extension_name == "AILocomotionExtensionC" or extension_name == "AiHuskLocomotionExtension", "Unsupported freeze extension")
	self:_cleanup_extension(unit, extension_name)

	local extension = ScriptUnit.extension(unit, "locomotion_system")

	extension:freeze(reason)
end

LocomotionSystem.unfreeze = function (self, unit, extension_name)
	local extension = ScriptUnit.extension(unit, "locomotion_system")

	extension:unfreeze(unit)

	if extension_name == "AILocomotionExtensionC" or extension_name == "AILocomotionExtension" or extension_name == "AiHuskLocomotionExtension" then
		local breed = extension.breed
		local bone_lod_level = breed.bone_lod_level

		if bone_lod_level > 0 and not script_data.bone_lod_disable then
			extension.bone_lod_extension_id = EngineOptimized.bone_lod_register_extension(unit)
			self.animation_lod_units[unit] = extension
		end
	end
end

LocomotionSystem.update = function (self, context, t)
	self:update_extensions(context, t)
	self:update_animation_lods()
	self:update_actor_proximity_shapes()
end

LocomotionSystem.update_extensions = function (self, context, t)
	local dt = context.dt

	self:update_extension("PlayerHuskLocomotionExtension", dt, context, t)
	self:update_extension("PlayerUnitLocomotionExtension", dt, context, t)

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
end

LocomotionSystem.set_override_player = function (self, player)
	self._override_player = player
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
end

LocomotionSystem.update_actor_proximity_shapes = function (self)
	local POSITION_LOOKUP = POSITION_LOOKUP
	local player_manager = Managers.player
	local physics_world = World.get_data(self.world, "physics_world")
	local default_insta_hit_cone_angle = math.degrees_to_radians(17)
	local Quaternion_forward = Quaternion.forward
	local human_and_bot_players = player_manager:human_and_bot_players()

	for id, player in pairs(human_and_bot_players) do
		local unit = player.player_unit

		if Unit.alive(unit) and not player.remote then
			local first_persion_system = ScriptUnit.extension(unit, "first_person_system")
			local inventory_extension = ScriptUnit.extension(unit, "inventory_system")
			local position = first_persion_system:current_position()
			local direction = Quaternion_forward(first_persion_system:current_rotation())
			local angle
			local slot_name = inventory_extension:get_wielded_slot_name()

			if slot_name == "slot_ranged" then
				local equipment = inventory_extension:equipment()
				local weapon_unit = equipment.right_hand_wielded_unit or equipment.left_hand_wielded_unit

				if weapon_unit and ScriptUnit.has_extension(weapon_unit, "spread_system") then
					local spread_extension = ScriptUnit.extension(weapon_unit, "spread_system")
					local pitch, yaw = spread_extension:get_current_pitch_and_yaw()

					angle = math.degrees_to_radians(math.max(pitch, yaw))
				end
			end

			PhysicsWorld.commit_actor_proximity_shape(physics_world, position, direction, 36, angle, true)
		end
	end
end

LocomotionSystem.rpc_set_affected_by_gravity = function (self, channel_id, game_object_id, affected)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit then
		printf("unit from game_object_id %d is nil", game_object_id)

		return
	end

	local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

	locomotion_extension:set_affected_by_gravity(affected)
end

local MAX_ALLOWABLE_RESYNC_TELEPORT_DISTANCE_SQ = 9

LocomotionSystem.rpc_set_animation_driven_movement = function (self, channel_id, game_object_id, animation_driven, script_driven_rotation, is_affected_by_gravity, is_on_transport, position, rotation)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit then
		printf("unit from game_object_id %d is nil", game_object_id)

		return
	end

	local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

	locomotion_extension:set_animation_driven(animation_driven, is_affected_by_gravity, script_driven_rotation, is_on_transport)

	if animation_driven then
		local source_position = Unit.local_position(unit, 0)
		local distance_sq = Vector3.distance_squared(source_position, position)

		if distance_sq > MAX_ALLOWABLE_RESYNC_TELEPORT_DISTANCE_SQ then
			local breed = AiUtils.unit_breed(unit)
			local breed_name = breed and breed.name or "n/a"

			Managers.telemetry_events:breed_position_desync(source_position, position, distance_sq, breed_name)
		end

		locomotion_extension:teleport_to(position, rotation, locomotion_extension:current_velocity())
	end
end

LocomotionSystem.rpc_set_animation_driven_script_movement = function (self, channel_id, game_object_id, position, rotation, is_affected_by_gravity)
	self:rpc_set_animation_driven_movement(channel_id, game_object_id, true, true, is_affected_by_gravity, false, position, rotation)
end

LocomotionSystem.rpc_set_animation_driven = function (self, channel_id, game_object_id, position, rotation, is_affected_by_gravity)
	self:rpc_set_animation_driven_movement(channel_id, game_object_id, true, false, is_affected_by_gravity, false, position, rotation)
end

LocomotionSystem.rpc_set_script_driven = function (self, channel_id, game_object_id, is_affected_by_gravity)
	self:rpc_set_animation_driven_movement(channel_id, game_object_id, false, true, is_affected_by_gravity, false)
end

LocomotionSystem.rpc_set_linked_transport_driven = function (self, channel_id, game_object_id, is_affected_by_gravity)
	self:rpc_set_animation_driven_movement(channel_id, game_object_id, false, true, is_affected_by_gravity, true)
end

LocomotionSystem.rpc_set_animation_translation_scale = function (self, channel_id, game_object_id, animation_translation_scale)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit then
		printf("unit from game_object_id %d is nil", game_object_id)

		return
	end

	local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

	locomotion_extension:set_animation_translation_scale(animation_translation_scale)

	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self.network_transmit:send_rpc_clients_except("rpc_set_animation_translation_scale", peer_id, game_object_id, animation_translation_scale)
	end
end

LocomotionSystem.rpc_set_animation_rotation_scale = function (self, channel_id, game_object_id, animation_rotation_scale)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit then
		printf("unit from game_object_id %d is nil", game_object_id)

		return
	end

	local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

	locomotion_extension:set_animation_rotation_scale(animation_rotation_scale)
end

LocomotionSystem.rpc_disable_locomotion = function (self, channel_id, game_object_id, disabled, update_func_id)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit then
		printf("unit from game_object_id %d is nil", game_object_id)

		return
	end

	local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
	local func = LocomotionUtils[NetworkLookup.movement_funcs[update_func_id]]

	locomotion_extension:set_disabled(disabled, func)

	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self.network_transmit:send_rpc_clients_except("rpc_disable_locomotion", peer_id, game_object_id, disabled, update_func_id)
	end
end

LocomotionSystem.rpc_teleport_unit_to = function (self, channel_id, game_object_id, position, rotation)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit then
		printf("unit from game_object_id %d is nil", game_object_id)

		return
	end

	local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

	locomotion_extension:teleport_to(position, rotation)

	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self.network_transmit:send_rpc_clients_except("rpc_teleport_unit_to", peer_id, game_object_id, position, rotation)
	end
end

LocomotionSystem.rpc_teleport_unit_with_yaw_rotation = function (self, channel_id, game_object_id, position, yaw)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit then
		printf("unit from game_object_id %d is nil", game_object_id)

		return
	end

	local rotation = Quaternion(Vector3.up(), yaw)
	local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

	locomotion_extension:teleport_to(position, rotation)
end

LocomotionSystem.rpc_enable_linked_movement = function (self, channel_id, game_object_id, parent_level_unit_index, parent_node_index, offset)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit then
		printf("unit from game_object_id %d is nil", game_object_id)

		return
	end

	local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")
	local level = LevelHelper:current_level(self.world)
	local parent_unit = Level.unit_by_index(level, parent_level_unit_index)

	locomotion_extension:enable_linked_movement(parent_unit, parent_node_index, offset)
end

LocomotionSystem.rpc_disable_linked_movement = function (self, channel_id, game_object_id)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit then
		printf("unit from game_object_id %d is nil", game_object_id)

		return
	end

	local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

	locomotion_extension:disable_linked_movement()
end

LocomotionSystem.rpc_add_external_velocity = function (self, channel_id, game_object_id, velocity)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit then
		printf("unit from game_object_id %d is nil", game_object_id)

		return
	end

	local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

	locomotion_extension:add_external_velocity(velocity)
end

LocomotionSystem.rpc_add_external_velocity_with_upper_limit = function (self, channel_id, game_object_id, velocity, upper_limit)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit then
		printf("unit from game_object_id %d is nil", game_object_id)

		return
	end

	local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

	locomotion_extension:add_external_velocity(velocity, upper_limit)
end

LocomotionSystem.rpc_set_forced_velocity = function (self, channel_id, game_object_id, velocity)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit then
		printf("unit from game_object_id %d is nil", game_object_id)

		return
	end

	local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

	locomotion_extension:set_forced_velocity(velocity)
end

LocomotionSystem.rpc_constrain_ai = function (self, channel_id, game_object_id, constrain, position_array)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit then
		printf("unit from game_object_id %d is nil", game_object_id)

		return
	end

	local min, max = position_array[1], position_array[2]
	local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

	locomotion_extension:set_constrained(constrain, min, max)
end

LocomotionSystem.rpc_set_on_moving_platform = function (self, channel_id, game_object_id, unit_index)
	local unit = self.unit_storage:unit(game_object_id)

	if not unit then
		printf("unit from game_object_id %d is nil", game_object_id)

		return
	end

	local level = LevelHelper:current_level(self.world)
	local platform_unit = Level.unit_by_index(level, unit_index)
	local locomotion_extension = ScriptUnit.extension(unit, "locomotion_system")

	locomotion_extension:set_on_moving_platform(platform_unit)
end

LocomotionSystem.rpc_hot_join_nail_to_wall_fix = function (self, channel_id, game_object_id)
	local unit = self.unit_storage:unit(game_object_id)

	if Unit.has_animation_state_machine(unit) then
		Unit.animation_event(unit, "ragdoll")
	end
end

require("scripts/unit_extensions/weapons/projectiles/projectile_templates")
require("scripts/unit_extensions/weapons/projectiles/generic_impact_projectile_unit_extension")
require("scripts/unit_extensions/weapons/projectiles/player_projectile_unit_extension")
require("scripts/unit_extensions/weapons/projectiles/player_projectile_husk_extension")
require("scripts/unit_extensions/weapons/projectiles/projectile_true_flight_locomotion_extension")
require("scripts/settings/light_weight_projectile_particle_effects")

ProjectileSystem = class(ProjectileSystem, ExtensionSystemBase)
local RPCS = {
	"rpc_spawn_pickup_projectile",
	"rpc_spawn_pickup_projectile_limited",
	"rpc_spawn_explosive_pickup_projectile",
	"rpc_spawn_explosive_pickup_projectile_limited",
	"rpc_projectile_stopped",
	"rpc_drop_projectile",
	"rpc_generic_impact_projectile_impact",
	"rpc_generic_impact_projectile_force_impact",
	"rpc_player_projectile_impact_level",
	"rpc_player_projectile_impact_dynamic",
	"rpc_client_spawn_light_weight_projectile",
	"rpc_client_despawn_light_weight_projectile",
	"rpc_client_create_aoe"
}
local extensions = {
	"GenericImpactProjectileUnitExtension",
	"PlayerProjectileUnitExtension",
	"PlayerProjectileHuskExtension"
}
local PLAYER_PROJECTILE_LIFETIME = 10
ProjectileSystem.init = function (self, entity_system_creation_context, system_name)
	ProjectileSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	local network_event_delegate = entity_system_creation_context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate.register(network_event_delegate, self, unpack(RPCS))

	self.network_manager = entity_system_creation_context.network_manager
	self.player_projectile_units = {}
	self.owner_units_count = 0
	self.projectile_owner_destroy_callback = function (destroyed_projectile_owner_unit)
		for owner_unit, projectiles in pairs(self.player_projectile_units) do
			if owner_unit == destroyed_projectile_owner_unit then
				for projectile_unit, end_time in pairs(projectiles) do
					self:_remove_player_projectile_reference(projectile_unit)

					if Unit.alive(projectile_unit) then
						Managers.state.unit_spawner:mark_for_deletion(projectile_unit)
					end
				end
			end
		end

		self.player_projectile_units[destroyed_projectile_owner_unit] = nil
		self.owner_units_count = self.owner_units_count - 1

		return 
	end
	local max_index = NetworkConstants.light_weight_projectile_index.max
	self._light_weight = {
		current_index = 0,
		projectiles = Script.new_array(max_index),
		max_index = max_index
	}

	return 
end
ProjectileSystem.on_add_extension = function (self, world, unit, extension_name, ...)
	return ExtensionSystemBase.on_add_extension(self, world, unit, extension_name, ...)
end
ProjectileSystem.on_remove_extension = function (self, unit, extension_name)
	ExtensionSystemBase.on_remove_extension(self, unit, extension_name)

	return 
end
local projectiles_to_remove = {}
ProjectileSystem.update = function (self, context, t)
	ProjectileSystem.super.update(self, context, t)

	local player_projectile_units = self.player_projectile_units

	for owner_unit, projectiles in pairs(player_projectile_units) do
		for projectile_unit, end_time in pairs(projectiles) do
			local unit_alive = Unit.alive(projectile_unit)

			if end_time <= t or not unit_alive then
				projectiles_to_remove[projectile_unit] = unit_alive
			end
		end
	end

	for projectile_unit, alive in pairs(projectiles_to_remove) do
		self._remove_player_projectile_reference(self, projectile_unit)

		if alive then
			Managers.state.unit_spawner:mark_for_deletion(projectile_unit)
		end
	end

	table.clear(projectiles_to_remove)
	self._update_light_weight_projectiles(self, context.dt, t, self._light_weight)

	return 
end
ProjectileSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)

	return 
end
ProjectileSystem.spawn_flame_wave_projectile = function (self, owner_unit, scale, item_name, item_template_name, action_name, sub_action_name, position, flat_angle, lateral_speed, initial_forward_speed, age, neighbour_lateral_speed, distance_travelled)
	local action = Weapons[item_template_name].actions[action_name][sub_action_name]
	local projectile_info = action.projectile_info
	scale = scale/100
	local min = projectile_info.radius_min
	local max = projectile_info.radius_max
	local radius = projectile_info.radius or (min and max and math.lerp(projectile_info.radius_min, projectile_info.radius_max, scale)) or nil
	local time_initialized = Managers.time:time("game")
	local extension_init_data = {
		projectile_locomotion_system = {
			owner_unit = owner_unit,
			scale = scale,
			item_name = item_name,
			item_template_name = item_template_name,
			action_name = action_name,
			sub_action_name = sub_action_name,
			position = position,
			flat_angle = flat_angle,
			lateral_speed = lateral_speed,
			initial_forward_speed = initial_forward_speed,
			age = age,
			neighbour_lateral_speed = neighbour_lateral_speed,
			distance_travelled = distance_travelled
		},
		projectile_impact_system = {
			item_name = item_name,
			item_template_name = item_template_name,
			action_name = action_name,
			sub_action_name = sub_action_name,
			owner_unit = owner_unit,
			radius = radius
		},
		projectile_system = {
			item_name = item_name,
			item_template_name = item_template_name,
			action_name = action_name,
			sub_action_name = sub_action_name,
			owner_unit = owner_unit,
			time_initialized = time_initialized,
			scale = scale
		}
	}
	local projectile_unit_name = projectile_info.projectile_unit_name
	local rotation = Quaternion(Vector3.up(), flat_angle)
	local projectile_unit = Managers.state.unit_spawner:spawn_network_unit(projectile_unit_name, projectile_info.projectile_unit_template_name, extension_init_data, position, rotation)

	self._add_player_projectile_reference(self, owner_unit, projectile_unit)

	return 
end
ProjectileSystem.spawn_player_projectile = function (self, owner_unit, position, rotation, scale, angle, target_vector, speed, item_name, item_template_name, action_name, sub_action_name, fast_forward_time, is_critical_strike, power_level, gaze_settings)
	local action = Weapons[item_template_name].actions[action_name][sub_action_name]
	local projectile_info = action.projectile_info
	local gravity_settings = projectile_info.gravity_settings

	if gaze_settings and not projectile_info.gaze_override_gravity_settings then
	end

	local trajectory_template_name = projectile_info.trajectory_template_name
	local rotate_around = projectile_info.rotate_around
	scale = scale/100
	local min = projectile_info.radius_min
	local max = projectile_info.radius_max
	local radius = projectile_info.radius or (min and max and math.lerp(projectile_info.radius_min, projectile_info.radius_max, scale)) or nil
	local time_initialized = Managers.time:time("game")
	local extension_init_data = {
		projectile_locomotion_system = {
			angle = angle,
			speed = speed,
			initial_position = position,
			target_vector = target_vector,
			gravity_settings = gravity_settings,
			trajectory_template_name = trajectory_template_name,
			data = {
				owner_unit,
				position,
				rotation,
				scale,
				angle,
				target_vector,
				speed,
				item_name,
				item_template_name,
				action_name,
				sub_action_name
			},
			fast_forward_time = fast_forward_time,
			rotate_around = rotate_around
		},
		projectile_impact_system = {
			item_name = item_name,
			item_template_name = item_template_name,
			action_name = action_name,
			sub_action_name = sub_action_name,
			owner_unit = owner_unit,
			radius = radius
		},
		projectile_system = {
			item_name = item_name,
			item_template_name = item_template_name,
			action_name = action_name,
			sub_action_name = sub_action_name,
			owner_unit = owner_unit,
			time_initialized = time_initialized,
			scale = scale,
			fast_forward_time = fast_forward_time,
			is_critical_strike = is_critical_strike,
			power_level = power_level
		}
	}
	local projectile_unit_name = projectile_info.projectile_unit_name
	local projectile_unit = Managers.state.unit_spawner:spawn_network_unit(projectile_unit_name, projectile_info.projectile_unit_template_name or "player_projectile_unit", extension_init_data, position, rotation)

	self._add_player_projectile_reference(self, owner_unit, projectile_unit)

	return 
end
ProjectileSystem.rpc_projectile_stopped = function (self, sender, go_id)
	local unit = self.unit_storage:unit(go_id)
	local locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")

	locomotion_extension.stop(locomotion_extension)

	return 
end
ProjectileSystem.rpc_drop_projectile = function (self, sender, go_id)
	local unit = self.unit_storage:unit(go_id)
	local locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")

	locomotion_extension.drop(locomotion_extension)

	return 
end
ProjectileSystem.rpc_spawn_pickup_projectile = function (self, sender, projectile_unit_name_id, projectile_unit_template_name_id, network_position, network_rotation, network_velocity, network_angular_velocity, pickup_name_id, pickup_spawn_type_id)
	local projectile_unit_name = NetworkLookup.husks[projectile_unit_name_id]
	local projectile_unit_template_name = NetworkLookup.go_types[projectile_unit_template_name_id]
	local pickup_name = NetworkLookup.pickup_names[pickup_name_id]
	local pickup_spawn_type = NetworkLookup.pickup_spawn_types[pickup_spawn_type_id]
	local extension_init_data = {
		projectile_locomotion_system = {
			network_position = network_position,
			network_rotation = network_rotation,
			network_velocity = network_velocity,
			network_angular_velocity = network_angular_velocity
		},
		pickup_system = {
			has_physics = true,
			pickup_name = pickup_name,
			spawn_type = pickup_spawn_type
		}
	}
	local position = AiAnimUtils.position_network_scale(network_position)
	local rotation = AiAnimUtils.rotation_network_scale(network_rotation)
	local projectile_unit = Managers.state.unit_spawner:spawn_network_unit(projectile_unit_name, projectile_unit_template_name, extension_init_data, position, rotation)

	return 
end
ProjectileSystem.rpc_spawn_pickup_projectile_limited = function (self, sender, projectile_unit_name_id, projectile_unit_template_name_id, network_position, network_rotation, network_velocity, network_angular_velocity, pickup_name_id, spawner_unit_id, limited_item_id, pickup_spawn_type_id)
	local projectile_unit_name = NetworkLookup.husks[projectile_unit_name_id]
	local projectile_unit_template_name = NetworkLookup.go_types[projectile_unit_template_name_id]
	local pickup_name = NetworkLookup.pickup_names[pickup_name_id]
	local pickup_spawn_type = NetworkLookup.pickup_spawn_types[pickup_spawn_type_id]
	local level = LevelHelper:current_level(self.world)
	local spawner_unit = Level.unit_by_index(level, spawner_unit_id)
	local extension_init_data = {
		projectile_locomotion_system = {
			network_position = network_position,
			network_rotation = network_rotation,
			network_velocity = network_velocity,
			network_angular_velocity = network_angular_velocity
		},
		pickup_system = {
			has_physics = true,
			pickup_name = pickup_name,
			spawn_type = pickup_spawn_type
		},
		limited_item_track_system = {
			spawner_unit = spawner_unit,
			id = limited_item_id
		}
	}
	local position = AiAnimUtils.position_network_scale(network_position)
	local rotation = AiAnimUtils.rotation_network_scale(network_rotation)
	local projectile_unit = Managers.state.unit_spawner:spawn_network_unit(projectile_unit_name, projectile_unit_template_name, extension_init_data, position, rotation)

	return 
end
ProjectileSystem.rpc_spawn_explosive_pickup_projectile = function (self, sender, projectile_unit_name_id, projectile_unit_template_name_id, network_position, network_rotation, network_velocity, network_angular_velocity, pickup_name_id, damage, explode_time, fuse_time, item_name_id, pickup_spawn_type_id)
	local projectile_unit_name = NetworkLookup.husks[projectile_unit_name_id]
	local projectile_unit_template_name = NetworkLookup.go_types[projectile_unit_template_name_id]
	local pickup_name = NetworkLookup.pickup_names[pickup_name_id]
	local item_name = NetworkLookup.item_names[item_name_id]
	local pickup_spawn_type = NetworkLookup.pickup_spawn_types[pickup_spawn_type_id]
	local explosion_data = nil

	if explode_time ~= 0 then
		explosion_data = {
			explode_time = explode_time,
			fuse_time = fuse_time
		}
	end

	local extension_init_data = {
		projectile_locomotion_system = {
			network_position = network_position,
			network_rotation = network_rotation,
			network_velocity = network_velocity,
			network_angular_velocity = network_angular_velocity
		},
		pickup_system = {
			has_physics = true,
			pickup_name = pickup_name,
			spawn_type = pickup_spawn_type
		},
		death_system = {
			in_hand = false,
			item_name = item_name
		},
		health_system = {
			in_hand = false,
			item_name = item_name,
			damage = damage,
			health_data = explosion_data
		}
	}
	local position = AiAnimUtils.position_network_scale(network_position)
	local rotation = AiAnimUtils.rotation_network_scale(network_rotation)
	local projectile_unit = Managers.state.unit_spawner:spawn_network_unit(projectile_unit_name, projectile_unit_template_name, extension_init_data, position, rotation)

	return 
end
ProjectileSystem.rpc_spawn_explosive_pickup_projectile_limited = function (self, sender, projectile_unit_name_id, projectile_unit_template_name_id, network_position, network_rotation, network_velocity, network_angular_velocity, pickup_name_id, spawner_unit_id, limited_item_id, damage, explode_time, fuse_time, item_name_id, pickup_spawn_type_id)
	local projectile_unit_name = NetworkLookup.husks[projectile_unit_name_id]
	local projectile_unit_template_name = NetworkLookup.go_types[projectile_unit_template_name_id]
	local pickup_name = NetworkLookup.pickup_names[pickup_name_id]
	local level = LevelHelper:current_level(self.world)
	local spawner_unit = Level.unit_by_index(level, spawner_unit_id)
	local item_name = NetworkLookup.item_names[item_name_id]
	local pickup_spawn_type = NetworkLookup.pickup_spawn_types[pickup_spawn_type_id]
	local explosion_data = nil

	if explode_time ~= 0 then
		explosion_data = {
			explode_time = explode_time,
			fuse_time = fuse_time
		}
	end

	local extension_init_data = {
		projectile_locomotion_system = {
			network_position = network_position,
			network_rotation = network_rotation,
			network_velocity = network_velocity,
			network_angular_velocity = network_angular_velocity
		},
		pickup_system = {
			has_physics = true,
			pickup_name = pickup_name,
			spawn_type = pickup_spawn_type
		},
		death_system = {
			in_hand = false,
			death_data = explosion_data,
			item_name = item_name
		},
		health_system = {
			health_data = explosion_data,
			item_name = item_name,
			damage = damage
		},
		limited_item_track_system = {
			spawner_unit = spawner_unit,
			id = limited_item_id
		}
	}
	local position = AiAnimUtils.position_network_scale(network_position)
	local rotation = AiAnimUtils.rotation_network_scale(network_rotation)
	local projectile_unit = Managers.state.unit_spawner:spawn_network_unit(projectile_unit_name, projectile_unit_template_name, extension_init_data, position, rotation)

	return 
end
ProjectileSystem.spawn_true_flight_projectile = function (self, owner_unit, target_unit, true_flight_template_name, position, rotation, angle, target_vector, speed, item_name, item_template_name, action_name, sub_action_name, scale, is_critical_strike, power_level)
	local action = Weapons[item_template_name].actions[action_name][sub_action_name]
	local projectile_info = action.projectile_info
	local gravity_settings = projectile_info.gravity_settings
	local trajectory_template_name = projectile_info.trajectory_template_name
	scale = scale/100
	local min = projectile_info.radius_min
	local max = projectile_info.radius_max
	local radius = projectile_info.radius or (min and max and math.lerp(projectile_info.radius_min, projectile_info.radius_max, scale)) or nil
	local extension_init_data = {
		projectile_locomotion_system = {
			angle = angle,
			speed = speed,
			gravity_settings = gravity_settings,
			trajectory_template_name = trajectory_template_name,
			initial_position = position,
			target_vector = target_vector,
			true_flight_template_name = true_flight_template_name,
			target_unit = target_unit,
			owner_unit = owner_unit
		},
		projectile_impact_system = {
			item_name = item_name,
			item_template_name = item_template_name,
			action_name = action_name,
			sub_action_name = sub_action_name,
			owner_unit = owner_unit,
			radius = radius
		},
		projectile_system = {
			item_name = item_name,
			item_template_name = item_template_name,
			action_name = action_name,
			sub_action_name = sub_action_name,
			owner_unit = owner_unit,
			time_initialized = Managers.time:time("game"),
			scale = scale,
			is_critical_strike = is_critical_strike,
			power_level = power_level
		}
	}
	local projectile_unit_name = projectile_info.projectile_unit_name
	local projectile_unit = Managers.state.unit_spawner:spawn_network_unit(projectile_unit_name, "true_flight_projectile_unit", extension_init_data, position, rotation)

	self._add_player_projectile_reference(self, owner_unit, projectile_unit)

	return 
end
ProjectileSystem._add_player_projectile_reference = function (self, owner_unit, projectile_unit)
	local t = Managers.time:time("game")

	if not self.player_projectile_units[owner_unit] then
		self.player_projectile_units[owner_unit] = {}
		self.owner_units_count = self.owner_units_count + 1

		Managers.state.unit_spawner:add_destroy_listener(owner_unit, "projectile_owner_" .. self.owner_units_count, self.projectile_owner_destroy_callback)
	end

	self.player_projectile_units[owner_unit][projectile_unit] = t + PLAYER_PROJECTILE_LIFETIME

	return 
end
ProjectileSystem._remove_player_projectile_reference = function (self, projectile_unit)
	for owner_unit, projectiles in pairs(self.player_projectile_units) do
		projectiles[projectile_unit] = nil
	end

	return 
end
ProjectileSystem.rpc_generic_impact_projectile_impact = function (self, sender, unit_id, hit_go_unit_id, hit_level_unit_id, position, direction, normal, actor_index)
	if self.is_server then
		Managers.state.network.network_transmit:send_rpc_clients_except("rpc_generic_impact_projectile_impact", sender, unit_id, hit_go_unit_id, position, direction, normal, actor_index)
	end

	local unit_storage = self.unit_storage
	local unit = unit_storage.unit(unit_storage, unit_id)
	local hit_unit = nil

	if hit_go_unit_id == NetworkConstants.game_object_id_max then
		local current_level = LevelHelper:current_level(self.world)
		hit_unit = Level.unit_by_index(current_level, hit_level_unit_id)
	else
		hit_unit = unit_storage.unit(unit_storage, hit_go_unit_id)
	end

	if hit_unit then
		local actor = Unit.actor(hit_unit, actor_index)
		local projectile_extension = ScriptUnit.extension(unit, "projectile_system")

		projectile_extension.impact(projectile_extension, hit_unit, position, direction, normal, actor)
	end

	return 
end
ProjectileSystem.rpc_generic_impact_projectile_force_impact = function (self, sender, unit_id, position)
	if self.is_server then
		Managers.state.network.network_transmit:send_rpc_clients_except("rpc_generic_impact_projectile_force_impact", sender, unit_id, position)
	end

	local unit_storage = self.unit_storage
	local unit = unit_storage.unit(unit_storage, unit_id)
	local projectile_extension = ScriptUnit.extension(unit, "projectile_system")

	projectile_extension.force_impact(projectile_extension, unit, position)

	return 
end
ProjectileSystem.rpc_player_projectile_impact_level = function (self, sender, unit_id, hit_unit_id, position, direction, normal, actor_index)
	if self.is_server then
		Managers.state.network.network_transmit:send_rpc_clients_except("rpc_player_projectile_impact_level", sender, unit_id, hit_unit_id, position, direction, normal, actor_index)
	end

	local current_level = LevelHelper:current_level(self.world)
	local hit_unit = Level.unit_by_index(current_level, hit_unit_id)
	local unit = self.unit_storage:unit(unit_id)

	if hit_unit then
		local actor = Unit.actor(hit_unit, actor_index)
		local projectile_extension = ScriptUnit.extension(unit, "projectile_system")

		projectile_extension.impact_level(projectile_extension, hit_unit, position, direction, normal, actor, hit_unit_id)
	end

	return 
end
ProjectileSystem.rpc_player_projectile_impact_dynamic = function (self, sender, unit_id, hit_unit_id, position, direction, normal, actor_index)
	if self.is_server then
		Managers.state.network.network_transmit:send_rpc_clients_except("rpc_player_projectile_impact_dynamic", sender, unit_id, hit_unit_id, position, direction, normal, actor_index)
	end

	local unit_storage = self.unit_storage
	local unit = unit_storage.unit(unit_storage, unit_id)
	local hit_unit = unit_storage.unit(unit_storage, hit_unit_id)

	if hit_unit then
		local actor = Unit.actor(hit_unit, actor_index)
		local projectile_extension = ScriptUnit.extension(unit, "projectile_system")

		projectile_extension.impact_dynamic(projectile_extension, hit_unit, position, direction, normal, actor)
	end

	return 
end
ProjectileSystem.create_light_weight_projectile = function (self, damage_source, owner_unit, position, direction, speed, range, collision_filter, impact_data, effect_name)
	local world = self.world
	local is_server = self.is_server
	local rotation = Quaternion.look(direction, Vector3.up())
	local data = self._light_weight
	local new_index = data.current_index + 1
	local max_index = data.max_index

	if max_index < new_index then
		assert(is_server, "Client trying to spawn more projectiles light weight projectiles than there's room for.")
		print("light weight projectile overflow, removing random projectile")
		self._remove_light_weight_projectile(self, data, Math.random(1, max_index))

		new_index = max_index
	end

	local projectile = {
		damage_source = damage_source,
		position = Vector3Box(position),
		direction = Vector3Box(direction),
		rotation = QuaternionBox(rotation),
		speed = speed,
		index = new_index,
		owner_unit = owner_unit,
		particle_settings = {}
	}
	local effect = LightWeightProjectileParticleEffects[effect_name]

	for _, effect_settings in pairs(effect) do
		local particle_id = nil
		local effect_name = effect_settings.particle_name
		local link_node = effect_settings.link
		local sound_name = effect_settings.sound_event_name

		if link_node then
			local firing_unit = effect_settings.unit_function(owner_unit)
			local node = Unit.node(firing_unit, link_node)
			particle_id = ScriptWorld.create_particles_linked(world, effect_name, firing_unit, node, "destroy")

			if sound_name then
				WwiseUtils.trigger_unit_event(world, sound_name, firing_unit, node)
			end
		else
			particle_id = World.create_particles(world, effect_name, position, rotation)

			if sound_name then
				WwiseUtils.trigger_position_event(world, sound_name, position)
			end
		end

		projectile.particle_settings[particle_id] = effect_settings
	end

	if script_data.debug_light_weight_projectiles then
		QuickDrawer:sphere(position, 0.05, Color(0, 0, 255))
	end

	if is_server then
		local cb = callback(self, "physics_cb_light_weight_projectile_hit", projectile)
		local physics_world = World.get_data(world, "physics_world")

		Profiler.start("make_raycast")

		projectile.raycast = PhysicsWorld.make_raycast(physics_world, cb, "all", "types", "both", "collision_filter", collision_filter)

		Profiler.stop("make_raycast")

		projectile.distance_moved = 0
		projectile.range = range
		projectile.impact_data = impact_data
		projectile.owner_unit = owner_unit
		projectile.effect_name = effect_name
		local speed_constant = NetworkConstants.light_weight_projectile_speed
		local min = speed_constant.min
		local max = speed_constant.max

		fassert(min <= speed and speed <= max, "Trying to create particle with speed (%i) outside of global.network_config bounds (%i:%i), raise \"light_weight_projectile_speed\" max.", speed, min, max)

		local network_manager = Managers.state.network
		local owner_unit_id = network_manager.unit_game_object_id(network_manager, owner_unit)

		network_manager.network_transmit:send_rpc_clients("rpc_client_spawn_light_weight_projectile", NetworkLookup.damage_sources[damage_source], owner_unit_id, position, direction, speed, NetworkLookup.light_weight_projectile_particle_effects[effect_name])
	end

	data.projectiles[new_index] = projectile
	data.current_index = new_index

	return 
end
ProjectileSystem.hot_join_sync = function (self, joining_client)
	ProjectileSystem.super.hot_join_sync(self, joining_client)

	local network_manager = Managers.state.network
	local transmit = network_manager.network_transmit
	local data = self._light_weight
	local projectiles = data.projectiles

	for i = 1, data.current_index, 1 do
		local projectile = projectiles[i]
		local position = projectile.position:unbox()
		local direction = projectile.direction:unbox()
		local speed = projectile.speed
		local effect_name = projectile.effect_name
		local owner_unit_id = network_manager.unit_game_object_id(network_manager, projectile.owner_unit)

		transmit.send_rpc(transmit, "rpc_client_spawn_light_weight_projectile", joining_client, NetworkLookup.damage_sources[projectile.damage_source], owner_unit_id, position, direction, speed, NetworkLookup.light_weight_projectile_particle_effects[effect_name])
	end

	return 
end
ProjectileSystem.rpc_client_spawn_light_weight_projectile = function (self, sender, damage_source_id, owner_unit_id, position, direction, speed, effect_id)
	local effect_name = NetworkLookup.light_weight_projectile_particle_effects[effect_id]
	local owner_unit = self.unit_storage:unit(owner_unit_id)
	local damage_source = NetworkLookup.damage_sources[damage_source_id]

	self.create_light_weight_projectile(self, damage_source, owner_unit, position, direction, speed, nil, nil, nil, effect_name)

	return 
end
ProjectileSystem.rpc_client_despawn_light_weight_projectile = function (self, sender, index)
	local data = self._light_weight

	self._remove_light_weight_projectile(self, data, index)

	return 
end
ProjectileSystem.rpc_client_create_aoe = function (self, sender, owner_unit_id, position, damage_source_id, explosion_template_id)
	local world = self.world
	local owner_unit = self.unit_storage:unit(owner_unit_id)
	local damage_source = NetworkLookup.damage_sources[damage_source_id]
	local explosion_template_name = NetworkLookup.explosion_templates[explosion_template_id]
	local explosion_template = ExplosionTemplates[explosion_template_name]

	DamageUtils.create_aoe(world, owner_unit, position, damage_source, explosion_template)

	return 
end
ProjectileSystem._remove_light_weight_projectile = function (self, data, index)
	local world = self.world
	local projectiles = data.projectiles
	local proj_to_remove = projectiles[index]
	local current_index = data.current_index

	if script_data.debug_light_weight_projectiles then
		QuickDrawerStay:sphere(proj_to_remove.position:unbox(), 0.03, Color(255, 0, 255))
	end

	if index ~= current_index then
		local last_proj = projectiles[current_index]
		last_proj.index = index
		projectiles[current_index] = proj_to_remove
		projectiles[index] = last_proj
	end

	for id, settings in pairs(proj_to_remove.particle_settings) do
		if settings.kill_policy == "stop" then
			World.stop_spawning_particles(world, id)
		elseif settings.kill_policy == "destroy" then
			World.destroy_particles(world, id)
		end
	end

	projectiles[current_index] = nil
	data.current_index = current_index - 1

	if self.is_server then
		Managers.state.network.network_transmit:send_rpc_clients("rpc_client_despawn_light_weight_projectile", index)
	end

	return 
end
ProjectileSystem.physics_cb_light_weight_projectile_hit = function (self, projectile_data, hits)
	if not hits then
		return 
	end

	if not Unit.alive(projectile_data.owner_unit) then
		self._remove_light_weight_projectile(self, self._light_weight, projectile_data.index)

		return 
	end

	local impact_data = projectile_data.impact_data
	local hit_data = DamageUtils.process_projectile_hit(self.world, projectile_data.damage_source, projectile_data.owner_unit, true, hits, impact_data, projectile_data.direction:unbox(), false, nil, nil, false, projectile_data.impact_data.power_level)

	if hit_data.stop then
		self._remove_light_weight_projectile(self, self._light_weight, projectile_data.index)
	elseif impact_data.max_penetrations then
		impact_data.max_penetrations = impact_data.max_penetrations - hit_data.hits
	end

	return 
end
ProjectileSystem._update_light_weight_projectiles = function (self, dt, t, data)
	Profiler.start("update_light_weight_projectiles")

	if self.is_server then
		self._server_update_light_weight_projectiles(self, dt, t, data)
	else
		self._client_update_light_weight_projectiles(self, dt, t, data)
	end

	Profiler.stop("update_light_weight_projectiles")

	return 
end
local remove_list = {}
ProjectileSystem._server_update_light_weight_projectiles = function (self, dt, t, data)
	local projectiles = data.projectiles
	local index = data.current_index
	local world = self.world
	local remove_list = remove_list
	local debug = script_data.debug_light_weight_projectiles

	for i = 1, index, 1 do
		local projectile = projectiles[i]

		if projectile.distance_moved < projectile.range then
			local pos, dir, dist = self._move_light_weight_projectile(self, dt, world, projectile, debug)
			projectile.distance_moved = projectile.distance_moved + dist

			projectile.raycast:cast(pos, dir, dist)
		else
			if debug then
				QuickDrawerStay:sphere(projectile.position:unbox(), 0.05, Color(255, 0, 0))
			end

			remove_list[#remove_list + 1] = i
		end
	end

	table.reverse(remove_list)

	for _, index in ipairs(remove_list) do
		self._remove_light_weight_projectile(self, data, index)
	end

	table.clear(remove_list)

	return 
end
ProjectileSystem._client_update_light_weight_projectiles = function (self, dt, t, data)
	local projectiles = data.projectiles
	local index = data.current_index
	local world = self.world
	local debug = script_data.debug_light_weight_projectiles

	for i = 1, index, 1 do
		local projectile = projectiles[i]

		self._move_light_weight_projectile(self, dt, world, projectile, debug)
	end

	return 
end
ProjectileSystem._move_light_weight_projectile = function (self, dt, world, projectile, debug)
	local pos = projectile.position:unbox()
	local dir = projectile.direction:unbox()
	local rot = projectile.rotation:unbox()
	local dist = projectile.speed*dt
	local new_pos = pos + dir*dist

	for id, settings in pairs(projectile.particle_settings) do
		if not settings.link then
			World.move_particles(world, id, new_pos, rot)
		end
	end

	projectile.position:store(new_pos)

	if debug then
		QuickDrawer:sphere(new_pos, 0.05, Color(0, 255, 0))
		QuickDrawer:line(pos, new_pos)
	end

	return pos, dir, dist
end

return 

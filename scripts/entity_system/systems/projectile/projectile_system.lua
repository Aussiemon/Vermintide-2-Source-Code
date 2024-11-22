-- chunkname: @scripts/entity_system/systems/projectile/projectile_system.lua

require("scripts/unit_extensions/weapons/projectiles/projectile_templates")
require("scripts/unit_extensions/weapons/projectiles/generic_impact_projectile_unit_extension")
require("scripts/unit_extensions/weapons/projectiles/player_projectile_unit_extension")
require("scripts/unit_extensions/weapons/projectiles/player_projectile_husk_extension")
require("scripts/unit_extensions/weapons/projectiles/projectile_true_flight_locomotion_extension")
require("scripts/unit_extensions/weapons/projectiles/projectile_homing_skull_locomotion_extension")
require("scripts/unit_extensions/weapons/projectiles/projectile_extrapolated_husk_locomotion_extension")
require("scripts/unit_extensions/weapons/projectiles/projectile_ethereal_skull_locomotion_extension")
require("scripts/settings/light_weight_projectile_effects")
require("scripts/entity_system/systems/projectile/drone_templates")

ProjectileSystem = class(ProjectileSystem, ExtensionSystemBase)

local ProjectileUnits = ProjectileUnits
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
	"rpc_client_create_aoe",
	"rpc_spawn_globadier_globe",
	"rpc_spawn_globadier_globe_fixed_impact",
	"rpc_clients_continuous_shoot_start",
	"rpc_clients_continuous_shoot_stop",
	"rpc_projectile_event",
	"rpc_request_spawn_drones",
	"rpc_spawn_drones",
}
local extensions = {
	"GenericImpactProjectileUnitExtension",
	"PlayerProjectileUnitExtension",
	"PlayerProjectileHuskExtension",
}
local PLAYER_PROJECTILE_LIFETIME = 10
local TWO_PI = math.pi * 2

ProjectileSystem.init = function (self, entity_system_creation_context, system_name)
	ProjectileSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	local network_event_delegate = entity_system_creation_context.network_event_delegate

	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))

	self.network_manager = entity_system_creation_context.network_manager
	self.player_projectile_units = {}
	self.indexed_player_projectile_units = {}
	self.owner_units_count = 0
	self._current_id = 1

	self.projectile_owner_destroy_callback = function (destroyed_projectile_owner_unit)
		for owner_unit, projectiles in pairs(self.player_projectile_units) do
			if owner_unit == destroyed_projectile_owner_unit then
				for projectile_unit, _ in pairs(projectiles) do
					self:_remove_player_projectile_reference(projectile_unit, owner_unit)

					if Unit.alive(projectile_unit) then
						Managers.state.unit_spawner:mark_for_deletion(projectile_unit)
					end
				end
			end
		end

		self.player_projectile_units[destroyed_projectile_owner_unit] = nil
		self.owner_units_count = self.owner_units_count - 1
	end

	local max_index = NetworkConstants.light_weight_projectile_index.max

	self._light_weight = {
		husk_list = {},
		own_data = {
			current_index = 0,
			is_owner = true,
			projectiles = Script.new_array(max_index),
			max_index = max_index,
			owner_peer_id = Network.peer_id(),
		},
		husk_shoot_list = {},
	}
	self._wwise_world = Managers.world:wwise_world(self.world)
	self._projectile_linker_system = Managers.state.entity:system("projectile_linker_system")

	local seed_info = Network.type_info("rnd_seed")

	self._drone_seed_per_source = {
		min_seed = seed_info.min,
		max_seed = seed_info.max,
	}
end

ProjectileSystem.on_add_extension = function (self, world, unit, extension_name, ...)
	if self.is_server then
		Managers.level_transition_handler.transient_package_loader:add_projectile(unit)
	end

	return ExtensionSystemBase.on_add_extension(self, world, unit, extension_name, ...)
end

ProjectileSystem.on_remove_extension = function (self, unit, extension_name)
	ExtensionSystemBase.on_remove_extension(self, unit, extension_name)

	if self.is_server then
		Managers.level_transition_handler.transient_package_loader:remove_projectile(unit)
	end
end

local projectiles_to_remove = {}
local projectile_owners = {}

ProjectileSystem.update = function (self, context, t)
	ProjectileSystem.super.update(self, context, t)

	local player_projectile_units = self.player_projectile_units

	for owner_unit, projectiles in pairs(player_projectile_units) do
		for projectile_unit, end_time in pairs(projectiles) do
			local unit_alive = Unit.alive(projectile_unit)

			if end_time <= t or not unit_alive then
				projectiles_to_remove[projectile_unit] = unit_alive
				projectile_owners[projectile_unit] = owner_unit
			end
		end
	end

	for projectile_unit, alive in pairs(projectiles_to_remove) do
		local owner_unit = projectile_owners[projectile_unit]

		self:_remove_player_projectile_reference(projectile_unit, owner_unit)

		if alive then
			Managers.state.unit_spawner:mark_for_deletion(projectile_unit)
		end
	end

	table.clear(projectiles_to_remove)
	table.clear(projectile_owners)
	self:_update_shooting(context.dt, t, self._light_weight.husk_shoot_list)
	self:_update_light_weight_projectiles(context.dt, t, self._light_weight)
	self:_update_drones(context.dt, t)
end

ProjectileSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)
end

ProjectileSystem._get_projectile_units_names = function (self, projectile_info, owner_unit)
	local projectile_units_template = projectile_info.projectile_units_template

	if projectile_info.use_weapon_skin then
		local inventory_extension = ScriptUnit.has_extension(owner_unit, "inventory_system")

		if inventory_extension then
			local slot_name = "slot_ranged"
			local slot_data = inventory_extension:get_slot_data(slot_name)

			projectile_units_template = slot_data and slot_data.projectile_units_template or projectile_units_template
		end
	end

	local projectile_units = ProjectileUnits[projectile_units_template]

	return projectile_units
end

ProjectileSystem.spawn_player_projectile = function (self, owner_unit, position, rotation, scale, angle, target_vector, speed, item_name, item_template_name, action_name, sub_action_name, fast_forward_time, is_critical_strike, power_level, gaze_settings, charge_level)
	local weapon_template = WeaponUtils.get_weapon_template(item_template_name)
	local action = weapon_template.actions[action_name][sub_action_name]
	local projectile_info = action.projectile_info
	local gravity_settings = projectile_info.gravity_settings

	gravity_settings = gaze_settings and projectile_info.gaze_override_gravity_settings or gravity_settings

	local trajectory_template_name = projectile_info.trajectory_template_name
	local linear_dampening = projectile_info.linear_dampening
	local rotation_speed = projectile_info.rotation_speed or 0
	local rotation_offset = projectile_info.rotation_offset

	scale = scale / 100

	local min = projectile_info.radius_min
	local max = projectile_info.radius_max
	local radius = projectile_info.radius or min and max and math.lerp(projectile_info.radius_min, projectile_info.radius_max, scale) or nil
	local seed = action.generate_seed and action.generate_seed() or nil
	local time_initialized = Managers.time:time("game")
	local extension_init_data = {
		projectile_locomotion_system = {
			angle = angle,
			speed = speed,
			seed = seed,
			initial_position = position,
			target_vector = target_vector,
			gravity_settings = gravity_settings,
			linear_dampening = linear_dampening,
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
				sub_action_name,
			},
			fast_forward_time = fast_forward_time,
			rotation_speed = rotation_speed,
			rotation_offset = rotation_offset,
		},
		projectile_impact_system = {
			item_name = item_name,
			item_template_name = item_template_name,
			action_name = action_name,
			sub_action_name = sub_action_name,
			owner_unit = owner_unit,
			radius = radius,
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
			power_level = power_level,
			charge_level = charge_level,
		},
	}
	local projectile_units = self:_get_projectile_units_names(projectile_info, owner_unit)
	local projectile_unit_name = projectile_units.projectile_unit_name
	local projectile_unit = Managers.state.unit_spawner:spawn_network_unit(projectile_unit_name, projectile_info.projectile_unit_template_name or "player_projectile_unit", extension_init_data, position, rotation)

	self:_add_player_projectile_reference(owner_unit, projectile_unit, projectile_info)
	Managers.state.achievement:trigger_event("on_player_projectile_spawned", projectile_unit, owner_unit, item_template_name)
end

ProjectileSystem.spawn_globadier_globe = function (self, position, target_vector, angle, speed, initial_radius, radius, duration, owner_unit, damage_source, aoe_dot_damage, aoe_init_damage, aoe_dot_damage_interval, create_nav_tag_volume, instant_explosion, fixed_impact_data)
	if self.is_server then
		local nav_tag_volume_layer = create_nav_tag_volume and "bot_poison_wind" or nil
		local is_versus = Managers.mechanism:current_mechanism_name() == "versus"

		if instant_explosion then
			local extension_init_data = {
				area_damage_system = {
					area_ai_random_death_template = "area_poison_ai_random_death",
					damage_players = true,
					dot_effect_name = "fx/wpnfx_poison_wind_globe_impact",
					extra_dot_effect_name = "fx/chr_gutter_death",
					invisible_unit = true,
					player_screen_effect_name = "fx/screenspace_poison_globe_impact",
					aoe_dot_damage = aoe_dot_damage,
					aoe_init_damage = aoe_init_damage,
					aoe_dot_damage_interval = aoe_dot_damage_interval,
					radius = radius,
					initial_radius = initial_radius,
					life_time = duration,
					area_damage_template = is_versus and "globadier_area_dot_damage_vs" or "globadier_area_dot_damage",
					damage_source = damage_source,
					create_nav_tag_volume = create_nav_tag_volume,
					nav_tag_volume_layer = nav_tag_volume_layer,
					source_attacker_unit = owner_unit,
					threat_duration = duration,
				},
			}
			local aoe_unit_name = "units/weapons/projectile/poison_wind_globe/poison_wind_globe"
			local aoe_unit = Managers.state.unit_spawner:spawn_network_unit(aoe_unit_name, "aoe_unit", extension_init_data, position)
			local unit_id = Managers.state.unit_storage:go_id(aoe_unit)

			Unit.set_unit_visibility(aoe_unit, false)
			Managers.state.network.network_transmit:send_rpc_all("rpc_area_damage", unit_id, position)
		else
			local extension_init_data = {
				projectile_locomotion_system = {
					trajectory_template_name = "throw_trajectory",
					angle = angle,
					speed = speed,
					target_vector = target_vector,
					initial_position = position,
				},
				projectile_system = {
					damage_source = damage_source,
					impact_template_name = is_versus and "vs_globadier_impact" or "explosion_impact",
					owner_unit = owner_unit,
				},
				area_damage_system = {
					area_ai_random_death_template = "area_poison_ai_random_death",
					damage_players = true,
					invisible_unit = false,
					player_screen_effect_name = "fx/screenspace_poison_globe_impact",
					aoe_dot_damage = aoe_dot_damage,
					aoe_init_damage = aoe_init_damage,
					aoe_dot_damage_interval = aoe_dot_damage_interval,
					radius = radius,
					initial_radius = initial_radius,
					life_time = duration,
					dot_effect_name = is_versus and "fx/wpnfx_poison_wind_globe_impact_vs" or "fx/wpnfx_poison_wind_globe_impact",
					area_damage_template = is_versus and "globadier_area_dot_damage_vs" or "globadier_area_dot_damage",
					damage_source = damage_source,
					create_nav_tag_volume = create_nav_tag_volume,
					nav_tag_volume_layer = nav_tag_volume_layer,
					source_attacker_unit = owner_unit,
					owner_player = Managers.player:owner(owner_unit),
					threat_duration = duration,
				},
			}
			local unit_template

			if fixed_impact_data then
				extension_init_data.projectile_impact_system = {
					owner_unit = owner_unit,
					impact_data = fixed_impact_data,
				}
				unit_template = "aoe_projectile_unit_fixed_impact"
			else
				extension_init_data.projectile_impact_system = {
					collision_filter = "filter_enemy_ray_projectile",
					server_side_raycast = true,
					owner_unit = owner_unit,
				}
				unit_template = "aoe_projectile_unit"
			end

			local projectile_unit_name = "units/weapons/projectile/poison_wind_globe/poison_wind_globe"

			Managers.state.unit_spawner:spawn_network_unit(projectile_unit_name, unit_template, extension_init_data, position)
		end
	else
		local owner_unit_id = self.unit_storage:go_id(owner_unit)
		local damage_source_id = NetworkLookup.damage_sources[damage_source]
		local fixed_impact, hit_unit_id

		if fixed_impact_data then
			local hit_unit = fixed_impact_data.hit_unit

			hit_unit_id = self.network_manager:level_object_id(hit_unit)
			fixed_impact = hit_unit_id ~= nil
		end

		if fixed_impact then
			print("fixed impact!")

			local hit_position = fixed_impact_data.position:unbox()
			local direction = fixed_impact_data.direction:unbox()
			local hit_normal = fixed_impact_data.hit_normal:unbox()
			local actor_index = fixed_impact_data.actor_index
			local time = fixed_impact_data.time

			self.network_transmit:send_rpc_server("rpc_spawn_globadier_globe_fixed_impact", position, target_vector, angle, speed, initial_radius, radius, duration, owner_unit_id, damage_source_id, aoe_dot_damage, aoe_init_damage, aoe_dot_damage_interval, create_nav_tag_volume, instant_explosion, hit_unit_id, hit_position, direction, hit_normal, actor_index, time)
		else
			print("Standard impact!")
			self.network_transmit:send_rpc_server("rpc_spawn_globadier_globe", position, target_vector, angle, speed, initial_radius, radius, duration, owner_unit_id, damage_source_id, aoe_dot_damage, aoe_init_damage, aoe_dot_damage_interval, create_nav_tag_volume, instant_explosion)
		end
	end
end

ProjectileSystem.rpc_spawn_globadier_globe = function (self, channel_id, position, target_vector, angle, speed, initial_radius, radius, duration, owner_unit_id, damage_source_id, aoe_dot_damage, aoe_init_damage, aoe_dot_damage_interval, create_nav_tag_volume, instant_explosion)
	fassert(self.is_server, "Have to be server")

	local owner_unit = self.unit_storage:unit(owner_unit_id)
	local damage_source = NetworkLookup.damage_sources[damage_source_id]

	self:spawn_globadier_globe(position, target_vector, angle, speed, initial_radius, radius, duration, owner_unit, damage_source, aoe_dot_damage, aoe_init_damage, aoe_dot_damage_interval, create_nav_tag_volume, instant_explosion)
end

ProjectileSystem.rpc_spawn_globadier_globe_fixed_impact = function (self, channel_id, position, target_vector, angle, speed, initial_radius, radius, duration, owner_unit_id, damage_source_id, aoe_dot_damage, aoe_init_damage, aoe_dot_damage_interval, create_nav_tag_volume, instant_explosion, impact_hit_unit_id, impact_position, impact_direction, impact_normal, impact_actor_index, time)
	fassert(self.is_server, "Have to be server")

	local hit_unit = Managers.state.network:game_object_or_level_unit(impact_hit_unit_id, true)

	if not Unit.alive(hit_unit) then
		self:rpc_spawn_globadier_globe(channel_id, position, target_vector, angle, speed, initial_radius, radius, duration, owner_unit_id, damage_source_id, aoe_dot_damage, aoe_init_damage, aoe_dot_damage_interval, create_nav_tag_volume, instant_explosion)

		return
	end

	local owner_unit = self.unit_storage:unit(owner_unit_id)
	local damage_source = NetworkLookup.damage_sources[damage_source_id]
	local fixed_impact_data = {
		position = Vector3Box(impact_position),
		direction = Vector3Box(impact_direction),
		hit_unit = hit_unit,
		actor_index = impact_actor_index,
		hit_normal = Vector3Box(impact_normal),
		time = time,
	}

	self:spawn_globadier_globe(position, target_vector, angle, speed, initial_radius, radius, duration, owner_unit, damage_source, aoe_dot_damage, aoe_init_damage, aoe_dot_damage_interval, create_nav_tag_volume, instant_explosion, fixed_impact_data)
end

ProjectileSystem.rpc_projectile_stopped = function (self, channel_id, go_id)
	local unit = self.unit_storage:unit(go_id)
	local locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")

	locomotion_extension:stop()
end

ProjectileSystem.rpc_drop_projectile = function (self, channel_id, go_id)
	local unit = self.unit_storage:unit(go_id)
	local locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")

	locomotion_extension:drop()
end

ProjectileSystem.rpc_projectile_event = function (self, channel_id, go_id, event_id)
	local unit = self.unit_storage:unit(go_id)
	local projectile_extension = ScriptUnit.extension(unit, "projectile_system")
	local event_name = NetworkLookup.projectile_external_event[event_id]

	projectile_extension:trigger_external_event(event_name)

	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		Managers.state.network.network_transmit:send_rpc_clients_except("rpc_projectile_event", peer_id, go_id, event_id)
	end
end

ProjectileSystem.rpc_spawn_pickup_projectile = function (self, channel_id, projectile_unit_name_id, projectile_unit_template_name_id, network_position, network_rotation, network_velocity, network_angular_velocity, pickup_name_id, pickup_spawn_type_id, spawn_limit)
	if not Managers.state.network:game() then
		return
	end

	local owner_peer_id = channel_id and CHANNEL_TO_PEER_ID[channel_id] or Network.peer_id()
	local projectile_unit_name = NetworkLookup.husks[projectile_unit_name_id]
	local projectile_unit_template_name = NetworkLookup.go_types[projectile_unit_template_name_id]
	local pickup_name = NetworkLookup.pickup_names[pickup_name_id]
	local pickup_spawn_type = NetworkLookup.pickup_spawn_types[pickup_spawn_type_id]
	local extension_init_data = {
		projectile_locomotion_system = {
			network_position = network_position,
			network_rotation = network_rotation,
			network_velocity = network_velocity,
			network_angular_velocity = network_angular_velocity,
		},
		pickup_system = {
			has_physics = true,
			pickup_name = pickup_name,
			spawn_type = pickup_spawn_type,
			owner_peer_id = owner_peer_id,
			spawn_limit = spawn_limit or 1,
		},
	}
	local position = AiAnimUtils.position_network_scale(network_position)
	local rotation = AiAnimUtils.rotation_network_scale(network_rotation)
	local pickup_settings = AllPickups[pickup_name]
	local spawn_override_func = pickup_settings.spawn_override_func

	if spawn_override_func then
		spawn_override_func(pickup_settings, extension_init_data, position, rotation)
	else
		Managers.state.unit_spawner:spawn_network_unit(projectile_unit_name, projectile_unit_template_name, extension_init_data, position, rotation)
	end
end

ProjectileSystem.rpc_spawn_pickup_projectile_limited = function (self, channel_id, projectile_unit_name_id, projectile_unit_template_name_id, network_position, network_rotation, network_velocity, network_angular_velocity, pickup_name_id, spawner_unit_id, limited_item_id, pickup_spawn_type_id)
	if not Managers.state.network:game() then
		return
	end

	local owner_peer_id = CHANNEL_TO_PEER_ID[channel_id] or Network.peer_id()
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
			network_angular_velocity = network_angular_velocity,
		},
		pickup_system = {
			has_physics = true,
			pickup_name = pickup_name,
			owner_peer_id = owner_peer_id,
			spawn_type = pickup_spawn_type,
		},
		limited_item_track_system = {
			spawner_unit = spawner_unit,
			id = limited_item_id,
		},
	}
	local position = AiAnimUtils.position_network_scale(network_position)
	local rotation = AiAnimUtils.rotation_network_scale(network_rotation)

	Managers.state.unit_spawner:spawn_network_unit(projectile_unit_name, projectile_unit_template_name, extension_init_data, position, rotation)
end

ProjectileSystem.rpc_spawn_explosive_pickup_projectile = function (self, channel_id, projectile_unit_name_id, projectile_unit_template_name_id, network_position, network_rotation, network_velocity, network_angular_velocity, pickup_name_id, damage, explode_time, fuse_time, attacker_unit_id, item_name_id, pickup_spawn_type_id)
	if not Managers.state.network:game() then
		return
	end

	local projectile_unit_name = NetworkLookup.husks[projectile_unit_name_id]
	local projectile_unit_template_name = NetworkLookup.go_types[projectile_unit_template_name_id]
	local pickup_name = NetworkLookup.pickup_names[pickup_name_id]
	local item_name = NetworkLookup.item_names[item_name_id]
	local pickup_spawn_type = NetworkLookup.pickup_spawn_types[pickup_spawn_type_id]
	local explosion_data

	if explode_time ~= 0 then
		explosion_data = {
			explode_time = explode_time,
			fuse_time = fuse_time,
			attacker_unit_id = attacker_unit_id,
		}
	end

	local extension_init_data = {
		projectile_locomotion_system = {
			network_position = network_position,
			network_rotation = network_rotation,
			network_velocity = network_velocity,
			network_angular_velocity = network_angular_velocity,
		},
		pickup_system = {
			has_physics = true,
			pickup_name = pickup_name,
			spawn_type = pickup_spawn_type,
		},
		death_system = {
			in_hand = false,
			item_name = item_name,
		},
		health_system = {
			in_hand = false,
			item_name = item_name,
			damage = damage,
			health_data = explosion_data,
		},
	}
	local position = AiAnimUtils.position_network_scale(network_position)
	local rotation = AiAnimUtils.rotation_network_scale(network_rotation)

	Managers.state.unit_spawner:spawn_network_unit(projectile_unit_name, projectile_unit_template_name, extension_init_data, position, rotation)
end

ProjectileSystem.rpc_spawn_explosive_pickup_projectile_limited = function (self, channel_id, projectile_unit_name_id, projectile_unit_template_name_id, network_position, network_rotation, network_velocity, network_angular_velocity, pickup_name_id, spawner_unit_id, limited_item_id, damage, explode_time, fuse_time, attacker_unit_id, item_name_id, pickup_spawn_type_id)
	if not Managers.state.network:game() then
		return
	end

	local projectile_unit_name = NetworkLookup.husks[projectile_unit_name_id]
	local projectile_unit_template_name = NetworkLookup.go_types[projectile_unit_template_name_id]
	local pickup_name = NetworkLookup.pickup_names[pickup_name_id]
	local level = LevelHelper:current_level(self.world)
	local spawner_unit = Level.unit_by_index(level, spawner_unit_id)
	local item_name = NetworkLookup.item_names[item_name_id]
	local pickup_spawn_type = NetworkLookup.pickup_spawn_types[pickup_spawn_type_id]
	local explosion_data

	if explode_time ~= 0 then
		explosion_data = {
			explode_time = explode_time,
			fuse_time = fuse_time,
			attacker_unit_id = attacker_unit_id,
		}
	end

	local extension_init_data = {
		projectile_locomotion_system = {
			network_position = network_position,
			network_rotation = network_rotation,
			network_velocity = network_velocity,
			network_angular_velocity = network_angular_velocity,
		},
		pickup_system = {
			has_physics = true,
			pickup_name = pickup_name,
			spawn_type = pickup_spawn_type,
		},
		death_system = {
			in_hand = false,
			death_data = explosion_data,
			item_name = item_name,
		},
		health_system = {
			health_data = explosion_data,
			item_name = item_name,
			damage = damage,
		},
		limited_item_track_system = {
			spawner_unit = spawner_unit,
			id = limited_item_id,
		},
	}
	local position = AiAnimUtils.position_network_scale(network_position)
	local rotation = AiAnimUtils.rotation_network_scale(network_rotation)

	Managers.state.unit_spawner:spawn_network_unit(projectile_unit_name, projectile_unit_template_name, extension_init_data, position, rotation)
end

ProjectileSystem.spawn_true_flight_projectile = function (self, owner_unit, target_unit, true_flight_template_name, position, rotation, angle, target_vector, speed, item_name, item_template_name, action_name, sub_action_name, scale, is_critical_strike, power_level)
	local weapon_template = WeaponUtils.get_weapon_template(item_template_name)
	local action = weapon_template.actions[action_name][sub_action_name]
	local projectile_info = action.projectile_info
	local gravity_settings = projectile_info.gravity_settings
	local trajectory_template_name = projectile_info.trajectory_template_name
	local min = projectile_info.radius_min
	local max = projectile_info.radius_max
	local radius = projectile_info.radius or min and max and math.lerp(projectile_info.radius_min, projectile_info.radius_max, scale) or nil
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
			owner_unit = owner_unit,
		},
		projectile_impact_system = {
			item_name = item_name,
			item_template_name = item_template_name,
			action_name = action_name,
			sub_action_name = sub_action_name,
			owner_unit = owner_unit,
			radius = radius,
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
			power_level = power_level,
		},
	}
	local projectile_units = self:_get_projectile_units_names(projectile_info, owner_unit)
	local projectile_unit_name = projectile_units.projectile_unit_name
	local projectile_unit = Managers.state.unit_spawner:spawn_network_unit(projectile_unit_name, "true_flight_projectile_unit", extension_init_data, position, rotation)

	self:_add_player_projectile_reference(owner_unit, projectile_unit, projectile_info)
end

ProjectileSystem.spawn_ai_true_flight_projectile = function (self, owner_unit, target_unit, true_flight_template_name, position, rotation, angle, target_vector, speed, projectile_info, impact_template_name, scale, is_critical_strike, power_level)
	local gravity_settings = projectile_info.gravity_settings
	local trajectory_template_name = projectile_info.trajectory_template_name
	local true_flight_template = TrueFlightTemplates[true_flight_template_name]
	local dont_target_friendly = true_flight_template.dont_target_friendly
	local dont_target_patrols = true_flight_template.dont_target_patrols
	local ignore_dead = true_flight_template.ignore_dead
	local min = projectile_info.radius_min
	local max = projectile_info.radius_max
	local radius = projectile_info.radius or min and max and math.lerp(projectile_info.radius_min, projectile_info.radius_max, scale) or nil
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
			owner_unit = owner_unit,
		},
		projectile_impact_system = {
			owner_unit = owner_unit,
			radius = radius,
			dont_target_friendly = dont_target_friendly,
			dont_target_patrols = dont_target_patrols,
			ignore_dead = ignore_dead,
		},
		projectile_system = {
			owner_unit = owner_unit,
			time_initialized = Managers.time:time("game"),
			scale = scale,
			is_critical_strike = is_critical_strike,
			power_level = power_level,
			impact_template_name = impact_template_name,
		},
	}
	local projectile_units = self:_get_projectile_units_names(projectile_info, owner_unit)
	local projectile_unit_name = projectile_units.projectile_unit_name
	local unit_template_name = projectile_info.projectile_unit_template_name or "ai_true_flight_projectile_unit"
	local projectile_unit = Managers.state.unit_spawner:spawn_network_unit(projectile_unit_name, unit_template_name, extension_init_data, position, rotation)

	self:_add_player_projectile_reference(owner_unit, projectile_unit, projectile_info)
end

ProjectileSystem._add_player_projectile_reference = function (self, owner_unit, projectile_unit, projectile_info)
	local t = Managers.time:time("game")

	if not self.player_projectile_units[owner_unit] then
		self.player_projectile_units[owner_unit] = {}
		self.owner_units_count = self.owner_units_count + 1

		Managers.state.unit_spawner:add_destroy_listener(owner_unit, "projectile_owner_" .. self.owner_units_count, self.projectile_owner_destroy_callback)
	end

	self.player_projectile_units[owner_unit][projectile_unit] = t + (projectile_info.unit_life_time or PLAYER_PROJECTILE_LIFETIME)

	if projectile_info.indexed then
		if not self.indexed_player_projectile_units[owner_unit] then
			self.indexed_player_projectile_units[owner_unit] = {}
		end

		self.indexed_player_projectile_units[owner_unit][#self.indexed_player_projectile_units[owner_unit] + 1] = projectile_unit
	end
end

ProjectileSystem._remove_player_projectile_reference = function (self, projectile_unit, owner_unit)
	for _, projectiles in pairs(self.player_projectile_units) do
		projectiles[projectile_unit] = nil
	end

	local indexed_projectiles = self.indexed_player_projectile_units[owner_unit]

	if indexed_projectiles then
		local index = table.find(indexed_projectiles, projectile_unit)

		if index then
			table.remove(indexed_projectiles, index)
		end
	end
end

ProjectileSystem.get_indexed_projectile_count = function (self, owner_unit)
	local indexed_projectiles = self.indexed_player_projectile_units[owner_unit]

	if not indexed_projectiles then
		return 0
	end

	return #indexed_projectiles
end

ProjectileSystem.get_and_delete_indexed_projectile = function (self, owner_unit, index, skip_mark_delete)
	local indexed_projectiles = self.indexed_player_projectile_units[owner_unit]

	if not indexed_projectiles then
		return nil
	end

	local unit_spawner = Managers.state.unit_spawner
	local removed_unit = table.remove(indexed_projectiles, index)
	local is_alive = removed_unit and Unit.alive(removed_unit)

	if not is_alive or is_alive and unit_spawner:is_marked_for_deletion(removed_unit) then
		return nil
	end

	for _, projectiles in pairs(self.player_projectile_units) do
		projectiles[removed_unit] = nil
	end

	if Unit.alive(removed_unit) and not unit_spawner:is_marked_for_deletion(removed_unit) and not skip_mark_delete then
		unit_spawner:mark_for_deletion(removed_unit)
	end

	return removed_unit
end

ProjectileSystem.delete_indexed_projectiles = function (self, owner_unit)
	local indexed_projectiles = self.indexed_player_projectile_units[owner_unit]

	if not indexed_projectiles then
		return
	end

	local unit_spawner = Managers.state.unit_spawner
	local owner_projectiles = self.player_projectile_units[owner_unit]

	for i = 1, #indexed_projectiles do
		local unit = indexed_projectiles[i]

		if unit then
			if Unit.alive(unit) then
				unit_spawner:mark_for_deletion(unit)
			end

			if owner_projectiles then
				owner_projectiles[unit] = nil
			end
		end
	end

	self.indexed_player_projectile_units[owner_unit] = nil
end

ProjectileSystem.rpc_generic_impact_projectile_impact = function (self, channel_id, unit_id, hit_go_unit_id, hit_level_unit_id, position, direction, normal, actor_index, num_units_hits)
	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		Managers.state.network.network_transmit:send_rpc_clients_except("rpc_generic_impact_projectile_impact", peer_id, unit_id, hit_go_unit_id, hit_level_unit_id, position, direction, normal, actor_index, num_units_hits)
	end

	local unit_storage = self.unit_storage
	local unit = unit_storage:unit(unit_id)
	local hit_unit

	if hit_go_unit_id == NetworkConstants.game_object_id_max then
		local current_level = LevelHelper:current_level(self.world)

		hit_unit = Level.unit_by_index(current_level, hit_level_unit_id)
	else
		hit_unit = unit_storage:unit(hit_go_unit_id)
	end

	if not Unit.alive(hit_unit) then
		return
	end

	if not self.bufferd_impacts then
		self.bufferd_impacts = {}
	end

	self.bufferd_impacts[hit_unit] = {
		hit_unit,
		Vector3Box(position),
		Vector3Box(direction),
		Vector3Box(normal),
		actor_index,
	}
	self.impact_buffer_counter = self.impact_buffer_counter and self.impact_buffer_counter + 1 or 1

	if num_units_hits <= self.impact_buffer_counter then
		local impact_counter = 0

		for hit_unit, data in pairs(self.bufferd_impacts) do
			if Unit.alive(hit_unit) then
				impact_counter = impact_counter + 1

				local actor = Unit.actor(hit_unit, data[ProjectileImpactDataIndex.ACTOR_INDEX])
				local projectile_extension = ScriptUnit.extension(unit, "projectile_system")

				projectile_extension:impact(hit_unit, data[ProjectileImpactDataIndex.POSITION]:unbox(), data[ProjectileImpactDataIndex.DIRECTION]:unbox(), data[ProjectileImpactDataIndex.NORMAL]:unbox(), actor, impact_counter)
			end
		end

		self.bufferd_impacts = nil
		self.impact_buffer_counter = 0
	end
end

ProjectileSystem.rpc_generic_impact_projectile_force_impact = function (self, channel_id, unit_id, position)
	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		Managers.state.network.network_transmit:send_rpc_clients_except("rpc_generic_impact_projectile_force_impact", peer_id, unit_id, position)
	end

	local unit_storage = self.unit_storage
	local unit = unit_storage:unit(unit_id)
	local projectile_extension = ScriptUnit.extension(unit, "projectile_system")

	projectile_extension:force_impact(unit, position)
end

ProjectileSystem.rpc_player_projectile_impact_level = function (self, channel_id, unit_id, hit_unit_id, position, direction, normal, actor_index)
	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		Managers.state.network.network_transmit:send_rpc_clients_except("rpc_player_projectile_impact_level", peer_id, unit_id, hit_unit_id, position, direction, normal, actor_index)
	end

	local current_level = LevelHelper:current_level(self.world)
	local hit_unit = Level.unit_by_index(current_level, hit_unit_id)
	local unit = self.unit_storage:unit(unit_id)

	if hit_unit then
		local actor = Unit.actor(hit_unit, actor_index)
		local projectile_extension = ScriptUnit.extension(unit, "projectile_system")

		projectile_extension:impact_level(hit_unit, position, direction, normal, actor, hit_unit_id)
	end
end

ProjectileSystem.rpc_player_projectile_impact_dynamic = function (self, channel_id, unit_id, hit_unit_id, position, direction, normal, actor_index)
	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		Managers.state.network.network_transmit:send_rpc_clients_except("rpc_player_projectile_impact_dynamic", peer_id, unit_id, hit_unit_id, position, direction, normal, actor_index)
	end

	local unit_storage = self.unit_storage
	local unit = unit_storage:unit(unit_id)
	local hit_unit = unit_storage:unit(hit_unit_id)

	if hit_unit then
		local actor = Unit.actor(hit_unit, actor_index)
		local projectile_extension = ScriptUnit.extension(unit, "projectile_system")

		projectile_extension:impact_dynamic(hit_unit, position, direction, normal, actor)
	end
end

ProjectileSystem.create_light_weight_projectile = function (self, damage_source, owner_unit, position, direction, speed, gravity, flat_speed, range, collision_filter, action_data, effect_name, owner_peer_id, is_husk, skip_rpc, husk_projectile, projectile_list, id)
	local world = self.world
	local is_server = self.is_server
	local rotation = Quaternion.look(direction, Vector3.up())
	local owning_projectile = not is_husk
	local data
	local projectile_id = id

	if projectile_list then
		data = projectile_list
	elseif owning_projectile then
		data = self._light_weight.own_data
		projectile_id = self._current_id
		self._current_id = 1 + self._current_id % 65535
	else
		local husk_data = self._light_weight.husk_list[owner_peer_id]

		if not husk_data then
			local max_index = NetworkConstants.light_weight_projectile_index.max

			husk_data = {
				current_index = 0,
				is_owner = false,
				projectiles = Script.new_array(max_index),
				max_index = max_index,
				owner_peer_id = owner_peer_id,
			}
			self._light_weight.husk_list[owner_peer_id] = husk_data
		end

		data = husk_data
	end

	local new_index = data.current_index + 1
	local max_index = data.max_index

	if max_index < new_index then
		if not skip_rpc then
			assert(is_server, "Client trying to spawn more projectiles light weight projectiles than there's room for.")
		end

		self:_remove_light_weight_projectile(data, Math.random(1, max_index))

		new_index = max_index
	end

	local projectile = {
		damage_source = damage_source,
		position = Vector3Box(position),
		direction = Vector3Box(direction),
		rotation = QuaternionBox(rotation),
		speed = speed,
		flat_speed = flat_speed or 0,
		index = new_index,
		owner_unit = owner_unit,
		particle_settings = {},
		sound_settings = {},
		gravity = gravity or 0,
		skip_rpc = skip_rpc,
		husk_projectile = husk_projectile,
		projectile_list_reference = projectile_list,
		identifier = projectile_id,
	}
	local effect_settings = LightWeightProjectileEffects[effect_name]
	local vfx_settings = effect_settings and effect_settings.vfx

	if vfx_settings then
		for vfx_id = 1, #vfx_settings do
			local vfx = vfx_settings[vfx_id]
			local condition_function = vfx.condition_function

			if not condition_function or condition_function(owner_unit) then
				local particle_id
				local particle_effect_name = vfx.particle_name
				local link_node = vfx.link

				if link_node then
					local firing_unit = vfx.unit_function(owner_unit)
					local node = Unit.node(firing_unit, link_node)

					particle_id = ScriptWorld.create_particles_linked(world, particle_effect_name, firing_unit, node, "destroy")
				else
					particle_id = World.create_particles(world, particle_effect_name, position, rotation)
				end

				projectile.particle_settings[particle_id] = vfx
			end
		end
	end

	local sfx_settings = effect_settings and effect_settings.sfx

	if sfx_settings then
		for sfx_id = 1, #sfx_settings do
			local sfx = sfx_settings[sfx_id]
			local looping_sound_name = sfx.looping_sound_event_name
			local manual_source_id = WwiseWorld.make_manual_source(self._wwise_world, position)

			WwiseWorld.trigger_event(self._wwise_world, looping_sound_name, manual_source_id)

			projectile.sound_settings[manual_source_id] = sfx
		end
	end

	if owning_projectile then
		local cb = callback(self, "physics_cb_light_weight_projectile_hit", projectile)
		local physics_world = World.get_data(world, "physics_world")

		projectile.raycast = PhysicsWorld.make_raycast(physics_world, cb, "all", "types", "both", "collision_filter", collision_filter)
		projectile.distance_moved = 0
		projectile.range = range
		projectile.action_data = action_data
		projectile.owner_unit = owner_unit
		projectile.effect_name = effect_name

		local speed_constant = NetworkConstants.light_weight_projectile_speed
		local min = speed_constant.min
		local max = speed_constant.max

		fassert(min <= speed and speed <= max, "Trying to create particle with speed (%i) outside of global.network_config bounds (%i:%i), raise \"light_weight_projectile_speed\" max.", speed, min, max)

		local owner_unit_id, owner_is_level_unit = self.network_manager:game_object_or_level_id(owner_unit)

		if not skip_rpc then
			if self.is_server then
				self.network_transmit:send_rpc_clients("rpc_client_spawn_light_weight_projectile", NetworkLookup.damage_sources[damage_source], owner_unit_id, position, direction, speed, gravity or 0, flat_speed or 0, NetworkLookup.light_weight_projectile_effects[effect_name], owner_is_level_unit, owner_peer_id, projectile.identifier)
			else
				self.network_transmit:send_rpc_server("rpc_client_spawn_light_weight_projectile", NetworkLookup.damage_sources[damage_source], owner_unit_id, position, direction, speed, gravity or 0, flat_speed or 0, NetworkLookup.light_weight_projectile_effects[effect_name], owner_is_level_unit, owner_peer_id, projectile.identifier)
			end
		end
	elseif self.is_server and not skip_rpc then
		local owner_unit_id, owner_is_level_unit = self.network_manager:game_object_or_level_id(owner_unit)

		self.network_transmit:send_rpc_clients_except("rpc_client_spawn_light_weight_projectile", owner_peer_id, NetworkLookup.damage_sources[damage_source], owner_unit_id, position, direction, speed, gravity or 0, flat_speed or 0, NetworkLookup.light_weight_projectile_effects[effect_name], owner_is_level_unit, owner_peer_id, projectile.identifier)
	end

	data.projectiles[new_index] = projectile
	data.current_index = new_index
end

ProjectileSystem.hot_join_sync = function (self, joining_client)
	ProjectileSystem.super.hot_join_sync(self, joining_client)

	local network_manager = Managers.state.network
	local transmit = network_manager.network_transmit
	local data = self._light_weight.own_data
	local projectiles = data.projectiles
	local owner_peer_id = data.owner_peer_id

	for i = 1, data.current_index do
		local projectile = projectiles[i]
		local position = projectile.position:unbox()
		local direction = projectile.direction:unbox()
		local speed = projectile.speed
		local effect_name = projectile.effect_name
		local gravity = projectile.gravity
		local flat_speed = projectile.flat_speed
		local skip_rpc = projectile.skip_rpc
		local identifier = projectile.identifier

		if not skip_rpc then
			local owner_unit_id, owner_is_level_unit = network_manager:game_object_or_level_id(projectile.owner_unit)

			transmit:send_rpc("rpc_client_spawn_light_weight_projectile", joining_client, NetworkLookup.damage_sources[projectile.damage_source], owner_unit_id, position, direction, speed, gravity, flat_speed, NetworkLookup.light_weight_projectile_effects[effect_name], owner_is_level_unit, owner_peer_id, identifier)
		end
	end
end

ProjectileSystem.rpc_clients_continuous_shoot_start = function (self, channel_id, owner_unit_id, owner_is_level_unit, breed_id, breed_action_id, shoot_duration, owner_peer_id)
	local owner_unit = Managers.state.network:game_object_or_level_unit(owner_unit_id, owner_is_level_unit)
	local breed_name = NetworkLookup.breeds[breed_id]
	local breed = Breeds[breed_name]
	local inventory_template = breed.default_inventory_template
	local inventory_extension = ScriptUnit.extension(owner_unit, "ai_inventory_system")
	local ratling_gun_unit = inventory_extension:get_unit(inventory_template)
	local time = Managers.time:time("game")
	local breed_action_name = NetworkLookup.bt_action_names[breed_action_id]
	local breed_actions = BreedActions[breed_name]
	local breed_action = breed_actions[breed_action_name]
	local light_weight_projectile_template_name = breed_action.light_weight_projectile_template_name
	local light_weight_projectile_template = LightWeightProjectiles[light_weight_projectile_template_name]
	local time_between_shots_at_start = 1 / breed_action.fire_rate_at_start
	local time_between_shots_at_end = 1 / breed_action.fire_rate_at_end
	local max_fire_rate_at_percentage_modifier = 1 / breed_action.max_fire_rate_at_percentage
	local max_index = NetworkConstants.light_weight_projectile_index.max
	local husk_shoot_list = self._light_weight.husk_shoot_list

	husk_shoot_list[owner_unit_id] = {
		shots_fired = 0,
		owner_unit = owner_unit,
		owner_unit_id = owner_unit_id,
		light_weight_projectile_template = light_weight_projectile_template,
		shoot_start = time,
		shoot_duration = shoot_duration,
		max_fire_rate_at_percentage_modifier = max_fire_rate_at_percentage_modifier,
		time_between_shots_at_start = time_between_shots_at_start,
		time_between_shots_at_end = time_between_shots_at_end,
		ratling_gun_unit = ratling_gun_unit,
		owner_peer_id = owner_peer_id,
		breed = breed,
		projectile_list = {
			current_index = 0,
			is_owner = false,
			max_index = max_index,
			projectiles = Script.new_array(max_index),
			owner_peer_id = owner_peer_id,
		},
	}
end

ProjectileSystem._update_shooting = function (self, dt, t, husk_shooting_data)
	for owner_peer_id, data in pairs(husk_shooting_data) do
		local unit = data.owner_unit
		local time_in_shoot_action = t - data.shoot_start
		local percentage_in_shoot_action = math.clamp(time_in_shoot_action / data.shoot_duration * data.max_fire_rate_at_percentage_modifier, 0, 1)
		local current_time_between_shots = math.lerp(data.time_between_shots_at_start, data.time_between_shots_at_end, percentage_in_shoot_action)
		local shots_to_fire = math.floor(time_in_shoot_action / current_time_between_shots) + 1 - data.shots_fired
		local light_weight_projectile_template = data.light_weight_projectile_template

		for i = 1, shots_to_fire do
			data.shots_fired = data.shots_fired + 1

			self:_shoot(owner_peer_id, data, t, dt)
		end
	end
end

ProjectileSystem._fire_from_position_direction = function (self, ratling_gun_unit, go_id)
	local fire_node = Unit.node(ratling_gun_unit, "p_fx")
	local position = Unit.world_position(ratling_gun_unit, fire_node)
	local game = Managers.state.network:game()
	local aim_position = GameSession.game_object_field(game, go_id, "aim_position")
	local direction

	if aim_position then
		direction = aim_position - position
	else
		direction = Quaternion.forward(Unit.world_rotation(ratling_gun_unit, fire_node))
	end

	local fire_pos = position - Vector3.normalize(direction) * 0.25

	return fire_pos, direction
end

ProjectileSystem._shoot = function (self, owner_peer_id, data, t, dt)
	local from_position, direction = self:_fire_from_position_direction(data.ratling_gun_unit, data.owner_unit_id)
	local light_weight_projectile_template = data.light_weight_projectile_template
	local normalized_direction = Vector3.normalize(direction)
	local spread_angle = Math.random() * light_weight_projectile_template.spread
	local dir_rot = Quaternion.look(normalized_direction, Vector3.up())
	local pitch = Quaternion(Vector3.right(), spread_angle)
	local roll = Quaternion(Vector3.forward(), Math.random() * TWO_PI)
	local spread_rot = Quaternion.multiply(Quaternion.multiply(dir_rot, roll), pitch)
	local spread_direction = Quaternion.forward(spread_rot)
	local collision_filter = "filter_enemy_player_afro_ray_projectile"
	local difficulty_rank = Managers.state.difficulty:get_difficulty_rank()
	local power_level = light_weight_projectile_template.attack_power_level[difficulty_rank] or light_weight_projectile_template.attack_power_level[2]
	local action_data = {
		power_level = power_level,
		damage_profile = light_weight_projectile_template.damage_profile,
		hit_effect = light_weight_projectile_template.hit_effect,
		player_push_velocity = Vector3Box(normalized_direction * light_weight_projectile_template.impact_push_speed),
		projectile_linker = light_weight_projectile_template.projectile_linker,
		first_person_hit_flow_events = light_weight_projectile_template.first_person_hit_flow_events,
	}
	local peer_id = data.peer_id
	local skip_rpc = true
	local husk_projectile = true

	self:create_light_weight_projectile(data.breed.name, data.owner_unit, from_position, spread_direction, light_weight_projectile_template.projectile_speed, nil, nil, light_weight_projectile_template.projectile_max_range, collision_filter, action_data, light_weight_projectile_template.light_weight_projectile_effect, owner_peer_id, nil, skip_rpc, husk_projectile, data.projectile_list)
end

ProjectileSystem.rpc_clients_continuous_shoot_stop = function (self, channel_id, owner_unit_id)
	local husk_shoot_list = self._light_weight.husk_shoot_list
	local owner_husk_shoot_list = husk_shoot_list[owner_unit_id]

	if not owner_husk_shoot_list then
		return
	end

	local num_projectiles = #owner_husk_shoot_list.projectile_list.projectiles

	for i = num_projectiles, 1, -1 do
		self:_remove_light_weight_projectile(owner_husk_shoot_list.projectile_list, i)
	end

	husk_shoot_list[owner_unit_id] = nil
end

ProjectileSystem.rpc_client_spawn_light_weight_projectile = function (self, channel_id, damage_source_id, owner_unit_id, position, direction, speed, gravity, flat_speed, effect_id, owner_is_level_unit, owner_peer_id, id)
	local effect_name = NetworkLookup.light_weight_projectile_effects[effect_id]
	local owner_unit = self.network_manager:game_object_or_level_unit(owner_unit_id, owner_is_level_unit)
	local damage_source = NetworkLookup.damage_sources[damage_source_id]
	local is_husk = true

	self:create_light_weight_projectile(damage_source, owner_unit, position, direction, speed, gravity, flat_speed, nil, nil, nil, effect_name, owner_peer_id, is_husk, nil, nil, nil, id)
end

ProjectileSystem.rpc_client_despawn_light_weight_projectile = function (self, channel_id, owner_peer_id, index, id)
	local data = self._light_weight.husk_list[owner_peer_id]

	if data then
		for idx, projectile_data in pairs(data.projectiles) do
			if projectile_data.identifier == id then
				index = idx

				break
			end
		end

		self:_remove_light_weight_projectile(data, index)
	end
end

ProjectileSystem.rpc_client_create_aoe = function (self, channel_id, owner_unit_id, position, damage_source_id, explosion_template_id, radius)
	local world = self.world
	local owner_unit = self.unit_storage:unit(owner_unit_id)
	local damage_source = NetworkLookup.damage_sources[damage_source_id]
	local explosion_template_name = NetworkLookup.explosion_templates[explosion_template_id]
	local explosion_template = ExplosionUtils.get_template(explosion_template_name)

	DamageUtils.create_aoe(world, owner_unit, position, damage_source, explosion_template, radius)
end

ProjectileSystem.spawn_drones = function (self, source_unit, drone_template_name, num_drones, radius, side_relation, damage_profile_name)
	local buff_extension = ScriptUnit.has_extension(source_unit, "buff_system")

	if buff_extension then
		num_drones = buff_extension:apply_buffs_to_value(num_drones, "increased_drone_count")
	end

	local source_unit_id = self.unit_storage:go_id(source_unit)
	local drone_template_id = NetworkLookup.drone_templates[drone_template_name]

	radius = math.round(radius)

	local side_relation_id = SideRelationLookup[side_relation]
	local damage_profile_id = NetworkLookup.damage_profiles[damage_profile_name]

	self.network_transmit:send_rpc_server("rpc_request_spawn_drones", source_unit_id, drone_template_id, num_drones, radius, side_relation_id, damage_profile_id)
end

local DRONE_TARGETS = {}

ProjectileSystem.rpc_request_spawn_drones = function (self, channel_id, source_unit_id, drone_template_id, num_drones, radius, side_relation_id, damage_profile_id)
	local source_unit = self.unit_storage:unit(source_unit_id)

	if not Unit.alive(source_unit) then
		return
	end

	local side = Managers.state.side.side_by_unit[source_unit]
	local relation = SideRelationLookup[side_relation_id]
	local broadphase_categories = side:broadphase_categories_by_relation(relation)
	local num_ai = AiUtils.broadphase_query(Unit.local_position(source_unit, 0), radius, DRONE_TARGETS, broadphase_categories)
	local filtered_i = 0

	for i = 1, num_ai do
		local go_id = self.unit_storage:go_id(DRONE_TARGETS[i])

		if go_id then
			filtered_i = filtered_i + 1
			DRONE_TARGETS[filtered_i] = go_id
		end
	end

	num_ai = math.min(filtered_i, Network.type_info("game_object_id_array_8").max_size)

	if num_ai == 0 then
		return
	end

	local drone_seeds = self._drone_seed_per_source
	local existing_seed = drone_seeds[source_unit]

	if not existing_seed then
		drone_seeds[source_unit] = math.random(drone_seeds.min_seed, drone_seeds.max_seed)
	else
		drone_seeds[source_unit] = Math.next_random(existing_seed)
	end

	local picked_enemy_ids = {}

	for i = 1, num_drones do
		picked_enemy_ids[i] = DRONE_TARGETS[math.random(1, num_ai)]
	end

	self.network_transmit:send_rpc_all("rpc_spawn_drones", source_unit_id, drone_template_id, drone_seeds[source_unit], damage_profile_id, picked_enemy_ids)
end

local TIME_BETWEEN_DRONES_BASE = 0.1
local TIME_BETWEEN_DRONES_MIN = 0.025
local TIME_BETWEEN_DRONES_MIN_AT = 100
local DRONE_SPEED = 5
local DRONE_SPEED_MAX = 14
local DRONE_SPEED_MAX_AT = 3
local MIN_OUTWARD_ANGLE = 0
local MAX_OUTWARD_ANGLE = math.pi * 0.18
local MIN_OUTWARD_ANGLE_AT = 2
local MAX_OUTWARD_ANGLE_AT = 10
local MIN_UPWARD_ANGLE = -math.pi * 0.1
local MAX_UPWARD_ANGLE = math.pi * 0.3
local MIN_ANGULAR_VELOCITY = math.pi * 0.1
local MAX_ANGULAR_VELOCITY = math.pi * 2
local MIN_ANGULAR_VELOCITY_AT = MAX_OUTWARD_ANGLE_AT
local MAX_ANGULAR_VELOCITY_AT = MIN_OUTWARD_ANGLE_AT

ProjectileSystem.rpc_spawn_drones = function (self, channel_id, source_unit_id, drone_template_id, seed, damage_profile_id, target_units)
	local source_unit = self.unit_storage:unit(source_unit_id)

	if not Unit.alive(source_unit) then
		return
	end

	self._drones = self._drones or {}

	local drones = self._drones
	local drone_template_name = NetworkLookup.drone_templates[drone_template_id]
	local drone_template = DroneTemplates[drone_template_name]
	local damage_profile_name = NetworkLookup.damage_profiles[damage_profile_id]
	local vfx_seed = seed

	for i = 1, #target_units do
		repeat
			vfx_seed = Math.next_random(vfx_seed)

			local rnd_side

			vfx_seed, rnd_side = Math.next_random(vfx_seed, 0, 1)

			local rnd_upward_side = rnd_side * 2 - 1
			local target_unit = self.unit_storage:unit(target_units[i])

			if not ALIVE[target_unit] then
				break
			end

			drones[#drones + 1] = {
				source_unit = source_unit,
				time_to_spawn = TIME_BETWEEN_DRONES_BASE,
				target_unit = target_unit,
				drone_template = drone_template,
				last_known_target_pos = Vector3Box(POSITION_LOOKUP[target_unit]),
				source_pos = Vector3Box(),
				current_pos = Vector3Box(),
				current_rot = QuaternionBox(),
				damage_profile_name = damage_profile_name,
				drone_group_i = i,
				upward_side = rnd_upward_side,
				vfx_seed = vfx_seed,
			}
		until true
	end
end

local function _init_drone(drone, target_position, world)
	local source_unit = drone.source_unit

	if not Unit.alive(source_unit) then
		return nil
	end

	local source_pos = Unit.local_position(source_unit, 0)
	local distance_to_enemy = Vector3.length(target_position - source_pos)

	if distance_to_enemy < math.epsilon then
		return nil
	end

	local upward_side = drone.upward_side
	local forward_dir = Vector3.normalize(target_position - source_pos)
	local right_dir = Vector3.cross(Vector3.up(), forward_dir)
	local source_offset = Vector3(0, 0, 1) + right_dir * 0.75 * upward_side + forward_dir * -0.5

	source_pos = source_pos + source_offset

	local _, upward_angle_rnd = Math.next_random(drone.vfx_seed)
	local upward_angle = MIN_UPWARD_ANGLE + upward_angle_rnd * (MAX_UPWARD_ANGLE - MIN_UPWARD_ANGLE)
	local outward_angle = math.remap(MIN_OUTWARD_ANGLE_AT, MAX_OUTWARD_ANGLE_AT, MIN_OUTWARD_ANGLE, MAX_OUTWARD_ANGLE, distance_to_enemy)
	local dir = Vector3.normalize(target_position - source_pos)

	dir = Quaternion.rotate(Quaternion.axis_angle(Vector3.cross(dir, Vector3.up()), upward_angle), dir)
	dir = Quaternion.rotate(Quaternion.axis_angle(Vector3.up() * upward_side, outward_angle), dir)

	local rotation = Quaternion.look(dir)

	drone.source_pos:store(source_pos)
	drone.current_pos:store(source_pos)
	drone.current_rot:store(rotation)

	local drone_template = drone.drone_template

	if drone_template.spawn_sfx then
		WwiseUtils.trigger_position_event(world, drone_template.spawn_sfx, source_pos)
	end

	if drone_template.linked_vfx then
		return World.create_particles(world, drone_template.linked_vfx.name, source_pos, rotation)
	else
		return -1
	end
end

local function _update_drone(drone, target_position, world, dt, t)
	local source_pos = drone.source_pos:unbox()
	local drone_pos = drone.current_pos:unbox()
	local drone_rot = drone.current_rot:unbox()
	local drone_point_on_line = Geometry.closest_point_on_line(drone_pos, source_pos, target_position)
	local distance_from_drone_point = Vector3.distance(target_position, drone_point_on_line)
	local wanted_rot
	local angular_velocity = math.remap(MIN_ANGULAR_VELOCITY_AT, MAX_ANGULAR_VELOCITY_AT, MIN_ANGULAR_VELOCITY, MAX_ANGULAR_VELOCITY, distance_from_drone_point)
	local to_target = target_position - drone_pos
	local rot_to_target = Quaternion.look(to_target)
	local angle_movement = angular_velocity * dt
	local angle_to_target = Quaternion.angle(rot_to_target, drone_rot)

	if angular_velocity >= MAX_ANGULAR_VELOCITY or angle_to_target <= angle_movement * 1.05 then
		wanted_rot = rot_to_target
	else
		local move_dir = Quaternion.forward(drone_rot)
		local x_dir = Vector3.normalize(Vector3.cross(to_target, move_dir))

		if Vector3.length_squared(x_dir) <= math.epsilon then
			wanted_rot = Quaternion.look(to_target)
		else
			wanted_rot = Quaternion.multiply(Quaternion.axis_angle(x_dir, angle_movement), drone_rot)

			if angle_to_target < Quaternion.angle(rot_to_target, wanted_rot) then
				x_dir = Vector3.normalize(Vector3.cross(move_dir, to_target))
				wanted_rot = Quaternion.multiply(Quaternion.axis_angle(x_dir, angle_movement), drone_rot)
			end
		end
	end

	local time_in_flight = t - drone.spawn_t
	local drone_speed = math.lerp_clamped(DRONE_SPEED, DRONE_SPEED_MAX, time_in_flight / DRONE_SPEED_MAX_AT)
	local movement = Quaternion.forward(wanted_rot) * drone_speed * dt / math.clamp(math.cos(angle_to_target), 0.1, 1)

	if Vector3.length_squared(movement) >= distance_from_drone_point * distance_from_drone_point then
		return true
	end

	local wanted_pos = drone_pos + movement

	drone.current_pos:store(wanted_pos)
	drone.current_rot:store(wanted_rot)
	World.move_particles(world, drone.vfx_id, wanted_pos, wanted_rot)
end

local function _on_drone_done(drone, world, is_server)
	local drone_template = drone.drone_template
	local vfx_id = drone.vfx_id

	if vfx_id and vfx_id >= 0 then
		if drone_template.linked_vfx.destroy_policy == "stop" then
			World.stop_spawning_particles(world, vfx_id)
		else
			World.destroy_particles(world, vfx_id)
		end
	end

	local current_pos = drone.current_pos:unbox()

	if drone_template.impact_vfx then
		local current_rot = drone.current_rot:unbox()

		World.create_particles(world, drone_template.impact_vfx, current_pos, current_rot)
	end

	if drone_template.impact_sfx then
		WwiseUtils.trigger_position_event(world, drone_template.impact_sfx, current_pos)
	end

	if not is_server then
		return
	end

	local damage_profile = DamageProfileTemplates[drone.damage_profile_name]
	local target_unit = drone.target_unit
	local source_unit = HEALTH_ALIVE[drone.source_unit] and drone.source_unit or target_unit

	if HEALTH_ALIVE[target_unit] then
		local power_level = DefaultPowerLevel
		local career_extension = ScriptUnit.has_extension(drone.source_unit, "career_system")

		if career_extension then
			power_level = career_extension:get_career_power_level()
		end

		local hit_zone_name = "full"
		local hit_pos = drone.current_pos:unbox()
		local hit_direction = Quaternion.forward(drone.current_rot:unbox())
		local damage_source = "buff"
		local hit_ragdoll_actor = false
		local boost_curve_multiplier
		local is_critical_strike = false
		local added_dot = false
		local first_hit = false
		local total_hits = drone.drone_group_i + 1
		local backstab_multiplier

		DamageUtils.add_damage_network_player(damage_profile, drone.drone_group_i, power_level, target_unit, source_unit, hit_zone_name, hit_pos, hit_direction, damage_source, hit_ragdoll_actor, boost_curve_multiplier, is_critical_strike, added_dot, first_hit, total_hits, backstab_multiplier, source_unit)
	end
end

ProjectileSystem._update_drones = function (self, dt, t)
	local drones = self._drones

	if not drones then
		return
	end

	local time_between_spawns = math.remap(0, TIME_BETWEEN_DRONES_MIN_AT, TIME_BETWEEN_DRONES_BASE, TIME_BETWEEN_DRONES_MIN, math.clamp(#drones, 0, TIME_BETWEEN_DRONES_MIN_AT))
	local dt_modifier = TIME_BETWEEN_DRONES_BASE / time_between_spawns
	local i = 1

	while i <= #drones do
		local drone = drones[i]

		if not drone.spawn_t then
			drone.time_to_spawn = drone.time_to_spawn - dt * dt_modifier

			if drone.time_to_spawn > 0 then
				return
			else
				drone.spawn_t = t

				local next_drone = drones[i + 1]

				if next_drone then
					local spillover = math.abs(drone.time_to_spawn)

					next_drone.time_to_spawn = next_drone.time_to_spawn - spillover
				end
			end
		end

		local last_known_position_boxed = drone.last_known_target_pos
		local target_unit = drone.target_unit

		if Unit.alive(target_unit) then
			if Unit.has_node(target_unit, "j_spine") then
				last_known_position_boxed:store(Unit.world_position(target_unit, Unit.node(target_unit, "j_spine")))
			else
				local z_offset = Unit.get_data(target_unit, "breed") and AiUtils.breed_height(target_unit) * 0.6 or 0

				last_known_position_boxed:store(POSITION_LOOKUP[target_unit] + Vector3(0, 0, z_offset))
			end
		end

		local last_known_position = last_known_position_boxed:unbox()

		if not drone.vfx_id then
			drone.vfx_id = _init_drone(drone, last_known_position, self.world)

			if not drone.vfx_id then
				_on_drone_done(drone, self.world, self.is_server)
				table.remove(drones, i)

				i = i - 1
			end
		else
			local done = _update_drone(drone, last_known_position, self.world, dt, t)

			if done then
				_on_drone_done(drone, self.world, self.is_server)
				table.remove(drones, i)

				i = i - 1
			end
		end

		i = i + 1
	end
end

ProjectileSystem._remove_light_weight_projectile = function (self, data, index)
	local world = self.world
	local projectiles = data and data.projectiles
	local proj_to_remove = projectiles and projectiles[index]

	if not proj_to_remove then
		return
	end

	local current_index = data.current_index
	local id = proj_to_remove.identifier

	if index ~= current_index then
		local last_proj = projectiles[current_index]

		last_proj.index = index
		projectiles[current_index] = proj_to_remove
		projectiles[index] = last_proj
	end

	for particle_id, settings in pairs(proj_to_remove.particle_settings) do
		if settings.kill_policy == "stop" then
			World.stop_spawning_particles(world, particle_id)
		elseif settings.kill_policy == "destroy" then
			World.destroy_particles(world, particle_id)
		end
	end

	for manual_source_id, settings in pairs(proj_to_remove.sound_settings) do
		local sound_stop_event = settings.looping_sound_stop_event_name

		if sound_stop_event then
			WwiseWorld.trigger_event(self._wwise_world, sound_stop_event, manual_source_id)
		end

		WwiseWorld.destroy_manual_source(self._wwise_world, manual_source_id)
	end

	projectiles[current_index] = nil
	data.current_index = current_index - 1

	local is_server = self.is_server
	local skip_rpc = proj_to_remove.skip_rpc

	if skip_rpc then
		return
	end

	if data.is_owner then
		if is_server then
			Managers.state.network.network_transmit:send_rpc_clients("rpc_client_despawn_light_weight_projectile", data.owner_peer_id, index, id)
		else
			Managers.state.network.network_transmit:send_rpc_server("rpc_client_despawn_light_weight_projectile", data.owner_peer_id, index, id)
		end
	elseif is_server then
		Managers.state.network.network_transmit:send_rpc_clients_except("rpc_client_despawn_light_weight_projectile", data.owner_peer_id, data.owner_peer_id, index, id)
	end
end

ProjectileSystem.physics_cb_light_weight_projectile_hit = function (self, projectile_data, hits)
	if not hits then
		return
	end

	if not Unit.alive(projectile_data.owner_unit) then
		self:_remove_light_weight_projectile(self._light_weight.own_data, projectile_data.index)

		return
	end

	if projectile_data.projectile_list_reference then
		self:_remove_light_weight_projectile(projectile_data.projectile_list_reference, projectile_data.index)
	elseif projectile_data.husk_projectile then
		self:_remove_light_weight_projectile(self._light_weight.own_data, projectile_data.index)
	else
		local action_data = projectile_data.action_data
		local hit_data = DamageUtils.process_projectile_hit(self.world, projectile_data.damage_source, projectile_data.owner_unit, self.is_server, hits, action_data, projectile_data.direction:unbox(), false, nil, nil, false, action_data.power_level)

		if hit_data.stop then
			self:_remove_light_weight_projectile(self._light_weight.own_data, projectile_data.index)

			local hit_player = hit_data.hit_player

			if not hit_player and action_data.projectile_linker then
				self:_link_projectile(hit_data, action_data.projectile_linker)
			end

			local hit_unit = hit_data.hit_unit

			if hit_unit and hit_player and action_data.first_person_hit_flow_events and not hit_data.shield_blocked then
				local num_events = #action_data.first_person_hit_flow_events
				local event_name = action_data.first_person_hit_flow_events[Math.random(num_events)]
				local target_player = Managers.player:owner(hit_unit)
				local peer_id = target_player:network_id()
				local unit_id = Managers.state.unit_storage:go_id(hit_unit)
				local event_id = NetworkLookup.flow_events[event_name]

				Managers.state.network.network_transmit:send_rpc("rpc_first_person_flow_event", peer_id, unit_id, event_id)
			end
		end
	end
end

ProjectileSystem._redirect_shield_linking = function (self, hit_unit, node_index, link_position, depth_position_offset)
	local breed = AiUtils.unit_breed(hit_unit)
	local do_redirect = HEALTH_ALIVE[hit_unit] and breed and not breed.no_effects_on_shield_block and not breed.is_player

	if not do_redirect then
		return hit_unit, node_index, link_position
	end

	local hit_inventory_extension = ScriptUnit.extension(hit_unit, "ai_inventory_system")

	hit_unit = hit_inventory_extension.inventory_item_shield_unit

	local shield_index = Unit.node(hit_unit, "c_mesh")
	local shield_origo = Unit.world_position(hit_unit, shield_index) + depth_position_offset
	local shield_to_projectile_hit = link_position - shield_origo
	local shield_to_projectile_hit_distance = Vector3.length(shield_to_projectile_hit)
	local offset_distance = math.min(shield_to_projectile_hit_distance, 0.25)
	local shield_projectile_position = shield_origo + shield_to_projectile_hit * offset_distance

	link_position = shield_projectile_position
	node_index = shield_index

	return hit_unit, node_index, link_position
end

ProjectileSystem._link_projectile = function (self, hit_data, projectile_linker_data)
	local hit_unit = hit_data.hit_unit
	local hit_actor = hit_data.hit_actor
	local hit_position = hit_data.hit_position
	local hit_direction = hit_data.hit_direction
	local predicted_damage = hit_data.predicted_damage
	local shield_blocked = hit_data.shield_blocked
	local depth = projectile_linker_data.depth or 0.15
	local depth_offset = projectile_linker_data.depth_offset or 0.15
	local linker_unit_name = projectile_linker_data.unit
	local allow_link = true
	local unit_data_allow_link = Unit.get_data(hit_unit, "allow_link")

	if unit_data_allow_link ~= nil then
		allow_link = unit_data_allow_link
	end

	if not allow_link then
		return
	end

	if projectile_linker_data.broken_units then
		local broken_chance = Math.random()

		if predicted_damage and not shield_blocked then
			broken_chance = broken_chance * math.clamp(predicted_damage / 2, 0.75, 1.25)
		else
			broken_chance = broken_chance * 2
		end

		if broken_chance <= 0.5 then
			local num_variations = #projectile_linker_data.broken_units
			local random_pick = Math.random(1, num_variations)

			linker_unit_name = projectile_linker_data.broken_units[random_pick]

			if random_pick == 1 then
				depth = 0.05
				depth_offset = 0.1
			else
				depth_offset = 0.15
			end
		end
	elseif predicted_damage and not shield_blocked then
		depth = depth * math.clamp(predicted_damage, 1, 3)
	end

	if shield_blocked then
		depth = -0.1
	end

	depth = depth + depth_offset

	local random_bank = Math.random() * 2.14 - 0.5
	local normalized_direction = Vector3.normalize(hit_direction)
	local depth_position_offset = normalized_direction * depth
	local link_position = hit_position + depth_position_offset
	local link_rotation = Quaternion.multiply(Quaternion.look(normalized_direction), Quaternion(Vector3.forward(), random_bank))
	local node_index = Actor.node(hit_actor)

	if shield_blocked then
		hit_unit, node_index, link_position = self:_redirect_shield_linking(hit_unit, node_index, link_position, depth_position_offset)
	end

	local linker_unit_name_id = NetworkLookup.husks[linker_unit_name]
	local hit_unit_go_id, is_level_unit = self.network_manager:game_object_or_level_id(hit_unit)

	if not hit_unit_go_id and is_level_unit == nil then
		return
	end

	Managers.state.network.network_transmit:send_rpc_all("rpc_spawn_and_link_units", linker_unit_name_id, link_position, link_rotation, hit_unit_go_id, node_index, is_level_unit)
end

ProjectileSystem._update_light_weight_projectiles = function (self, dt, t, data)
	self:_server_update_light_weight_projectiles(dt, t, self._light_weight.own_data)

	for _, peer_data in pairs(self._light_weight.husk_list) do
		self:_client_update_light_weight_projectiles(dt, t, peer_data)
	end

	for _, peer_data in pairs(self._light_weight.husk_shoot_list) do
		self:_server_update_light_weight_projectiles(dt, t, peer_data.projectile_list)
	end
end

ProjectileSystem._print_debug = function (self)
	if Development.parameter("debug_light_weight_projectiles") then
		Debug.text("Own projectiles: " .. tostring(table.size(self._light_weight.own_data.projectiles)))
		Debug.text("Husk list: " .. tostring(table.size(self._light_weight.husk_list)))

		local cnt = 0

		for _, data in pairs(self._light_weight.husk_list) do
			cnt = cnt + table.size(data.projectiles)
		end

		Debug.text("Husk projectiles: " .. tostring(cnt))

		local cnt = 0

		for _, data in pairs(self._light_weight.husk_shoot_list) do
			cnt = cnt + table.size(data.projectile_list.projectiles)
		end

		Debug.text("Local husk projectiles: " .. tostring(cnt))
	end
end

local REMOVE_LIST = {}

ProjectileSystem._server_update_light_weight_projectiles = function (self, dt, t, data)
	local projectiles = data.projectiles
	local index = data.current_index
	local world = self.world
	local remove_list = REMOVE_LIST

	for i = 1, index do
		local projectile = projectiles[i]

		if projectile.distance_moved < projectile.range then
			local pos, dir, dist = self:_move_light_weight_projectile(dt, world, projectile)

			projectile.distance_moved = projectile.distance_moved + dist

			projectile.raycast:cast(pos, dir, dist)
		else
			remove_list[#remove_list + 1] = i
		end
	end

	table.reverse(remove_list)

	for _, remove_index in ipairs(remove_list) do
		self:_remove_light_weight_projectile(data, remove_index)
	end

	table.clear(remove_list)
end

ProjectileSystem._client_update_light_weight_projectiles = function (self, dt, t, data)
	local projectiles = data.projectiles
	local index = data.current_index
	local world = self.world

	for i = 1, index do
		local projectile = projectiles[i]

		self:_move_light_weight_projectile(dt, world, projectile, debug)
	end
end

ProjectileSystem._move_light_weight_projectile = function (self, dt, world, projectile, debug)
	local pos = projectile.position:unbox()
	local dir = projectile.direction:unbox()
	local rot = projectile.rotation:unbox()
	local dist = projectile.speed * dt
	local gravity = projectile.gravity
	local new_pos = pos + dir * dist

	if gravity ~= 0 then
		dist = projectile.flat_speed * dt
		new_pos = pos + dir * dist
		new_pos = new_pos - Vector3(0, 0, gravity) * dt * dt
		dir = Vector3.normalize(new_pos - pos)

		projectile.direction:store(dir)

		rot = Quaternion.look(dir, Vector3.up())

		projectile.rotation:store(rot)
	end

	for particle_id, settings in pairs(projectile.particle_settings) do
		if not settings.link then
			World.move_particles(world, particle_id, new_pos, rot)
		end
	end

	for manual_source_id, _ in pairs(projectile.sound_settings) do
		WwiseWorld.set_source_position(self._wwise_world, manual_source_id, new_pos)
	end

	projectile.position:store(new_pos)

	return pos, dir, dist
end

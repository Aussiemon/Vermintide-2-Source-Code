require("scripts/unit_extensions/weapons/projectiles/projectile_templates")
require("scripts/unit_extensions/weapons/projectiles/generic_impact_projectile_unit_extension")
require("scripts/unit_extensions/weapons/projectiles/player_projectile_unit_extension")
require("scripts/unit_extensions/weapons/projectiles/player_projectile_husk_extension")
require("scripts/unit_extensions/weapons/projectiles/projectile_true_flight_locomotion_extension")
require("scripts/settings/light_weight_projectile_effects")

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
	"rpc_clients_continuous_shoot_start",
	"rpc_clients_continuous_shoot_stop"
}
local extensions = {
	"GenericImpactProjectileUnitExtension",
	"PlayerProjectileUnitExtension",
	"PlayerProjectileHuskExtension"
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
			is_owner = true,
			current_index = 0,
			projectiles = Script.new_array(max_index),
			max_index = max_index,
			owner_peer_id = Network.peer_id()
		},
		husk_shoot_list = {}
	}
	self._wwise_world = Managers.world:wwise_world(self.world)
	self._projectile_linker_system = Managers.state.entity:system("projectile_linker_system")
end

ProjectileSystem.on_add_extension = function (self, world, unit, extension_name, ...)
	return ExtensionSystemBase.on_add_extension(self, world, unit, extension_name, ...)
end

ProjectileSystem.on_remove_extension = function (self, unit, extension_name)
	ExtensionSystemBase.on_remove_extension(self, unit, extension_name)
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
			projectile_units_template = slot_data.projectile_units_template or projectile_units_template
		end
	end

	local projectile_units = ProjectileUnits[projectile_units_template]

	return projectile_units
end

ProjectileSystem.spawn_player_projectile = function (self, owner_unit, position, rotation, scale, angle, target_vector, speed, item_name, item_template_name, action_name, sub_action_name, fast_forward_time, is_critical_strike, power_level, gaze_settings)
	local action = Weapons[item_template_name].actions[action_name][sub_action_name]
	local projectile_info = action.projectile_info
	local gravity_settings = projectile_info.gravity_settings

	if gaze_settings then
		gravity_settings = projectile_info.gaze_override_gravity_settings or gravity_settings
	end

	local trajectory_template_name = projectile_info.trajectory_template_name
	local linear_dampening = projectile_info.linear_dampening
	local rotation_speed = projectile_info.rotation_speed or 0
	scale = scale / 100
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
				sub_action_name
			},
			fast_forward_time = fast_forward_time,
			rotation_speed = rotation_speed
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
	local projectile_units = self:_get_projectile_units_names(projectile_info, owner_unit)
	local projectile_unit_name = projectile_units.projectile_unit_name
	local projectile_unit = Managers.state.unit_spawner:spawn_network_unit(projectile_unit_name, projectile_info.projectile_unit_template_name or "player_projectile_unit", extension_init_data, position, rotation)

	self:_add_player_projectile_reference(owner_unit, projectile_unit, projectile_info)
end

ProjectileSystem.spawn_globadier_globe = function (self, position, target_vector, angle, speed, initial_radius, radius, duration, owner_unit, damage_source, aoe_dot_damage, aoe_init_damage, aoe_dot_damage_interval, create_nav_tag_volume, instant_explosion)
	if self.is_server then
		local nav_tag_volume_layer = (create_nav_tag_volume and "bot_poison_wind") or nil

		if instant_explosion then
			local extension_init_data = {
				area_damage_system = {
					area_damage_template = "globadier_area_dot_damage",
					invisible_unit = true,
					player_screen_effect_name = "fx/screenspace_poison_globe_impact",
					area_ai_random_death_template = "area_poison_ai_random_death",
					dot_effect_name = "fx/wpnfx_poison_wind_globe_impact",
					extra_dot_effect_name = "fx/chr_gutter_death",
					damage_players = true,
					aoe_dot_damage = aoe_dot_damage,
					aoe_init_damage = aoe_init_damage,
					aoe_dot_damage_interval = aoe_dot_damage_interval,
					radius = radius,
					initial_radius = initial_radius,
					life_time = duration,
					damage_source = damage_source,
					create_nav_tag_volume = create_nav_tag_volume,
					nav_tag_volume_layer = nav_tag_volume_layer,
					source_attacker_unit = owner_unit
				}
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
					initial_position = position
				},
				projectile_impact_system = {
					server_side_raycast = true,
					collision_filter = "filter_enemy_ray_projectile",
					owner_unit = owner_unit
				},
				projectile_system = {
					impact_template_name = "explosion_impact",
					damage_source = damage_source,
					owner_unit = owner_unit
				},
				area_damage_system = {
					area_damage_template = "globadier_area_dot_damage",
					invisible_unit = false,
					player_screen_effect_name = "fx/screenspace_poison_globe_impact",
					area_ai_random_death_template = "area_poison_ai_random_death",
					dot_effect_name = "fx/wpnfx_poison_wind_globe_impact",
					damage_players = true,
					aoe_dot_damage = aoe_dot_damage,
					aoe_init_damage = aoe_init_damage,
					aoe_dot_damage_interval = aoe_dot_damage_interval,
					radius = radius,
					initial_radius = initial_radius,
					life_time = duration,
					damage_source = damage_source,
					create_nav_tag_volume = create_nav_tag_volume,
					nav_tag_volume_layer = nav_tag_volume_layer,
					source_attacker_unit = owner_unit,
					owner_player = Managers.player:owner(owner_unit)
				}
			}
			local projectile_unit_name = "units/weapons/projectile/poison_wind_globe/poison_wind_globe"

			Managers.state.unit_spawner:spawn_network_unit(projectile_unit_name, "aoe_projectile_unit", extension_init_data, position)
		end
	else
		local owner_unit_id = self.unit_storage:go_id(owner_unit)
		local damage_source_id = NetworkLookup.damage_sources[damage_source]

		self.network_transmit:send_rpc_server("rpc_spawn_globadier_globe", position, target_vector, angle, speed, initial_radius, radius, duration, owner_unit_id, damage_source_id, aoe_dot_damage, aoe_init_damage, aoe_dot_damage_interval, create_nav_tag_volume, instant_explosion)
	end
end

ProjectileSystem.rpc_spawn_globadier_globe = function (self, sender, position, target_vector, angle, speed, initial_radius, radius, duration, owner_unit_id, damage_source_id, aoe_dot_damage, aoe_init_damage, aoe_dot_damage_interval, create_nav_tag_volume, instant_explosion)
	fassert(self.is_server, "Have to be server")

	local owner_unit = self.unit_storage:unit(owner_unit_id)
	local damage_source = NetworkLookup.damage_sources[damage_source_id]

	self:spawn_globadier_globe(position, target_vector, angle, speed, initial_radius, radius, duration, owner_unit, damage_source, aoe_dot_damage, aoe_init_damage, aoe_dot_damage_interval, create_nav_tag_volume, instant_explosion)
end

ProjectileSystem.rpc_projectile_stopped = function (self, sender, go_id)
	local unit = self.unit_storage:unit(go_id)
	local locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")

	locomotion_extension:stop()
end

ProjectileSystem.rpc_drop_projectile = function (self, sender, go_id)
	local unit = self.unit_storage:unit(go_id)
	local locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")

	locomotion_extension:drop()
end

ProjectileSystem.rpc_spawn_pickup_projectile = function (self, sender, projectile_unit_name_id, projectile_unit_template_name_id, network_position, network_rotation, network_velocity, network_angular_velocity, pickup_name_id, pickup_spawn_type_id, spawn_limit)
	if not Managers.state.network:game() then
		return
	end

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
			spawn_type = pickup_spawn_type,
			owner_peer_id = sender or Network.peer_id(),
			spawn_limit = spawn_limit or 1
		}
	}
	local position = AiAnimUtils.position_network_scale(network_position)
	local rotation = AiAnimUtils.rotation_network_scale(network_rotation)

	Managers.state.unit_spawner:spawn_network_unit(projectile_unit_name, projectile_unit_template_name, extension_init_data, position, rotation)
end

ProjectileSystem.rpc_spawn_pickup_projectile_limited = function (self, sender, projectile_unit_name_id, projectile_unit_template_name_id, network_position, network_rotation, network_velocity, network_angular_velocity, pickup_name_id, spawner_unit_id, limited_item_id, pickup_spawn_type_id)
	if not Managers.state.network:game() then
		return
	end

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

	Managers.state.unit_spawner:spawn_network_unit(projectile_unit_name, projectile_unit_template_name, extension_init_data, position, rotation)
end

ProjectileSystem.rpc_spawn_explosive_pickup_projectile = function (self, sender, projectile_unit_name_id, projectile_unit_template_name_id, network_position, network_rotation, network_velocity, network_angular_velocity, pickup_name_id, damage, explode_time, fuse_time, attacker_unit_id, item_name_id, pickup_spawn_type_id)
	if not Managers.state.network:game() then
		return
	end

	local projectile_unit_name = NetworkLookup.husks[projectile_unit_name_id]
	local projectile_unit_template_name = NetworkLookup.go_types[projectile_unit_template_name_id]
	local pickup_name = NetworkLookup.pickup_names[pickup_name_id]
	local item_name = NetworkLookup.item_names[item_name_id]
	local pickup_spawn_type = NetworkLookup.pickup_spawn_types[pickup_spawn_type_id]
	local explosion_data = nil

	if explode_time ~= 0 then
		explosion_data = {
			explode_time = explode_time,
			fuse_time = fuse_time,
			attacker_unit_id = attacker_unit_id
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

	Managers.state.unit_spawner:spawn_network_unit(projectile_unit_name, projectile_unit_template_name, extension_init_data, position, rotation)
end

ProjectileSystem.rpc_spawn_explosive_pickup_projectile_limited = function (self, sender, projectile_unit_name_id, projectile_unit_template_name_id, network_position, network_rotation, network_velocity, network_angular_velocity, pickup_name_id, spawner_unit_id, limited_item_id, damage, explode_time, fuse_time, attacker_unit_id, item_name_id, pickup_spawn_type_id)
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
	local explosion_data = nil

	if explode_time ~= 0 then
		explosion_data = {
			explode_time = explode_time,
			fuse_time = fuse_time,
			attacker_unit_id = attacker_unit_id
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

	Managers.state.unit_spawner:spawn_network_unit(projectile_unit_name, projectile_unit_template_name, extension_init_data, position, rotation)
end

ProjectileSystem.spawn_true_flight_projectile = function (self, owner_unit, target_unit, true_flight_template_name, position, rotation, angle, target_vector, speed, item_name, item_template_name, action_name, sub_action_name, scale, is_critical_strike, power_level)
	local action = Weapons[item_template_name].actions[action_name][sub_action_name]
	local projectile_info = action.projectile_info
	local gravity_settings = projectile_info.gravity_settings
	local trajectory_template_name = projectile_info.trajectory_template_name
	scale = scale / 100
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
	local projectile_units = self:_get_projectile_units_names(projectile_info, owner_unit)
	local projectile_unit_name = projectile_units.projectile_unit_name
	local projectile_unit = Managers.state.unit_spawner:spawn_network_unit(projectile_unit_name, "true_flight_projectile_unit", extension_init_data, position, rotation)

	self:_add_player_projectile_reference(owner_unit, projectile_unit, projectile_info)
end

ProjectileSystem._add_player_projectile_reference = function (self, owner_unit, projectile_unit, projectile_info)
	local t = Managers.time:time("game")

	if not self.player_projectile_units[owner_unit] then
		self.player_projectile_units[owner_unit] = {}
		self.owner_units_count = self.owner_units_count + 1

		Managers.state.unit_spawner:add_destroy_listener(owner_unit, "projectile_owner_" .. self.owner_units_count, self.projectile_owner_destroy_callback)
	end

	self.player_projectile_units[owner_unit][projectile_unit] = t + PLAYER_PROJECTILE_LIFETIME

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

ProjectileSystem.get_and_delete_indexed_projectile = function (self, owner_unit, index)
	local indexed_projectiles = self.indexed_player_projectile_units[owner_unit]

	if not indexed_projectiles then
		return nil
	end

	local unit_spawner = Managers.state.unit_spawner
	local removed_unit = table.remove(indexed_projectiles, index)
	local is_alive = removed_unit and Unit.alive(removed_unit)

	if not is_alive or (is_alive and unit_spawner:is_marked_for_deletion(removed_unit)) then
		return nil
	end

	for _, projectiles in pairs(self.player_projectile_units) do
		projectiles[removed_unit] = nil
	end

	if Unit.alive(removed_unit) and not unit_spawner:is_marked_for_deletion(removed_unit) then
		unit_spawner:mark_for_deletion(removed_unit)
	end

	return removed_unit
end

ProjectileSystem.rpc_generic_impact_projectile_impact = function (self, sender, unit_id, hit_go_unit_id, hit_level_unit_id, position, direction, normal, actor_index)
	if self.is_server then
		Managers.state.network.network_transmit:send_rpc_clients_except("rpc_generic_impact_projectile_impact", sender, unit_id, hit_go_unit_id, position, direction, normal, actor_index)
	end

	local unit_storage = self.unit_storage
	local unit = unit_storage:unit(unit_id)
	local hit_unit = nil

	if hit_go_unit_id == NetworkConstants.game_object_id_max then
		local current_level = LevelHelper:current_level(self.world)
		hit_unit = Level.unit_by_index(current_level, hit_level_unit_id)
	else
		hit_unit = unit_storage:unit(hit_go_unit_id)
	end

	if hit_unit then
		local actor = Unit.actor(hit_unit, actor_index)
		local projectile_extension = ScriptUnit.extension(unit, "projectile_system")

		projectile_extension:impact(hit_unit, position, direction, normal, actor)
	end
end

ProjectileSystem.rpc_generic_impact_projectile_force_impact = function (self, sender, unit_id, position)
	if self.is_server then
		Managers.state.network.network_transmit:send_rpc_clients_except("rpc_generic_impact_projectile_force_impact", sender, unit_id, position)
	end

	local unit_storage = self.unit_storage
	local unit = unit_storage:unit(unit_id)
	local projectile_extension = ScriptUnit.extension(unit, "projectile_system")

	projectile_extension:force_impact(unit, position)
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

		projectile_extension:impact_level(hit_unit, position, direction, normal, actor, hit_unit_id)
	end
end

ProjectileSystem.rpc_player_projectile_impact_dynamic = function (self, sender, unit_id, hit_unit_id, position, direction, normal, actor_index)
	if self.is_server then
		Managers.state.network.network_transmit:send_rpc_clients_except("rpc_player_projectile_impact_dynamic", sender, unit_id, hit_unit_id, position, direction, normal, actor_index)
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
	local data = nil
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
				is_owner = false,
				current_index = 0,
				projectiles = Script.new_array(max_index),
				max_index = max_index,
				owner_peer_id = owner_peer_id
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
		identifier = projectile_id
	}
	local effect = LightWeightProjectileEffects[effect_name]

	for _, effect_settings in pairs(effect) do
		local vfx_settings = effect_settings.vfx
		local sfx_settings = effect_settings.sfx

		if vfx_settings then
			local particle_id = nil
			local particle_effect_name = vfx_settings.particle_name
			local link_node = vfx_settings.link

			if link_node then
				local firing_unit = vfx_settings.unit_function(owner_unit)
				local node = Unit.node(firing_unit, link_node)
				particle_id = ScriptWorld.create_particles_linked(world, particle_effect_name, firing_unit, node, "destroy")
			else
				particle_id = World.create_particles(world, particle_effect_name, position, rotation)
			end

			projectile.particle_settings[particle_id] = vfx_settings
		end

		if sfx_settings then
			local manual_source_id = nil
			local link_node = sfx_settings.link
			local sound_event_name = vfx_settings.sound_event_name
			local looping_sound_name = sfx_settings.looping_sound_event_name

			if link_node then
				local firing_unit = vfx_settings.unit_function(owner_unit)
				local node = Unit.node(firing_unit, link_node)

				if sound_event_name then
					WwiseUtils.trigger_unit_event(world, sound_event_name, firing_unit, node)
				end

				if looping_sound_name then
					manual_source_id = WwiseWorld.make_manual_source(self._wwise_world, firing_unit, node)

					WwiseWorld.trigger_event(self._wwise_world, looping_sound_name, manual_source_id)
				end
			else
				if sound_event_name then
					WwiseUtils.trigger_position_event(world, sound_event_name, position)
				end

				if looping_sound_name then
					manual_source_id = WwiseWorld.make_manual_source(self._wwise_world, position)

					WwiseWorld.trigger_event(self._wwise_world, looping_sound_name, manual_source_id)
				end
			end

			projectile.sound_settings[manual_source_id] = sfx_settings
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

	for i = 1, data.current_index, 1 do
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

ProjectileSystem.rpc_clients_continuous_shoot_start = function (self, sender, owner_unit_id, owner_is_level_unit, breed_id, breed_action_id, shoot_duration, owner_peer_id)
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
			is_owner = false,
			current_index = 0,
			max_index = max_index,
			projectiles = Script.new_array(max_index),
			owner_peer_id = owner_peer_id
		}
	}
end

ProjectileSystem._update_shooting = function (self, dt, t, husk_shooting_data)
	for owner_peer_id, data in pairs(husk_shooting_data) do
		local unit = data.owner_unit
		local time_in_shoot_action = t - data.shoot_start
		local percentage_in_shoot_action = math.clamp(time_in_shoot_action / data.shoot_duration * data.max_fire_rate_at_percentage_modifier, 0, 1)
		local current_time_between_shots = math.lerp(data.time_between_shots_at_start, data.time_between_shots_at_end, percentage_in_shoot_action)
		local shots_to_fire = (math.floor(time_in_shoot_action / current_time_between_shots) + 1) - data.shots_fired
		local light_weight_projectile_template = data.light_weight_projectile_template

		for i = 1, shots_to_fire, 1 do
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
	local direction = nil

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
	local power_level = light_weight_projectile_template.attack_power_level[difficulty_rank]
	local action_data = {
		power_level = power_level,
		damage_profile = light_weight_projectile_template.damage_profile,
		hit_effect = light_weight_projectile_template.hit_effect,
		player_push_velocity = Vector3Box(normalized_direction * light_weight_projectile_template.impact_push_speed),
		projectile_linker = light_weight_projectile_template.projectile_linker,
		first_person_hit_flow_events = light_weight_projectile_template.first_person_hit_flow_events
	}
	local peer_id = data.peer_id
	local skip_rpc = true
	local husk_projectile = true

	self:create_light_weight_projectile(data.breed.name, data.owner_unit, from_position, spread_direction, light_weight_projectile_template.projectile_speed, nil, nil, light_weight_projectile_template.projectile_max_range, collision_filter, action_data, light_weight_projectile_template.light_weight_projectile_effect, owner_peer_id, nil, skip_rpc, husk_projectile, data.projectile_list)
end

ProjectileSystem.rpc_clients_continuous_shoot_stop = function (self, sender, owner_unit_id)
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

ProjectileSystem.rpc_client_spawn_light_weight_projectile = function (self, sender, damage_source_id, owner_unit_id, position, direction, speed, gravity, flat_speed, effect_id, owner_is_level_unit, owner_peer_id, id)
	local effect_name = NetworkLookup.light_weight_projectile_effects[effect_id]
	local owner_unit = self.network_manager:game_object_or_level_unit(owner_unit_id, owner_is_level_unit)
	local damage_source = NetworkLookup.damage_sources[damage_source_id]
	local is_husk = true

	self:create_light_weight_projectile(damage_source, owner_unit, position, direction, speed, gravity, flat_speed, nil, nil, nil, effect_name, owner_peer_id, is_husk, nil, nil, nil, id)
end

ProjectileSystem.rpc_client_despawn_light_weight_projectile = function (self, sender, owner_peer_id, index, id)
	local data = self._light_weight.husk_list[owner_peer_id]

	for idx, projectile_data in pairs(data.projectiles) do
		if projectile_data.identifier == id then
			index = idx

			break
		end
	end

	self:_remove_light_weight_projectile(data, index)
end

ProjectileSystem.rpc_client_create_aoe = function (self, sender, owner_unit_id, position, damage_source_id, explosion_template_id)
	local world = self.world
	local owner_unit = self.unit_storage:unit(owner_unit_id)
	local damage_source = NetworkLookup.damage_sources[damage_source_id]
	local explosion_template_name = NetworkLookup.explosion_templates[explosion_template_id]
	local explosion_template = ExplosionTemplates[explosion_template_name]

	DamageUtils.create_aoe(world, owner_unit, position, damage_source, explosion_template)
end

ProjectileSystem._remove_light_weight_projectile = function (self, data, index)
	local world = self.world
	local projectiles = data.projectiles
	local proj_to_remove = projectiles[index]
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
	local do_redirect = AiUtils.unit_alive(hit_unit) and breed and not breed.no_effects_on_shield_block and not breed.is_player

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

	for i = 1, index, 1 do
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

	for i = 1, index, 1 do
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

return

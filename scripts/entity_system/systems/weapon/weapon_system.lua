require("scripts/unit_extensions/weapons/weapon_unit_extension")
require("scripts/unit_extensions/weapons/ai_weapon_unit_extension")

WeaponSystem = class(WeaponSystem, ExtensionSystemBase)
global_is_inside_inn = false
local RPCS = {
	"rpc_attack_hit",
	"rpc_alert_enemy",
	"rpc_ai_weapon_shoot_start",
	"rpc_ai_weapon_shoot",
	"rpc_ai_weapon_shoot_end",
	"rpc_start_beam",
	"rpc_end_beam",
	"rpc_start_flamethrower",
	"rpc_end_flamethrower",
	"rpc_start_geiser",
	"rpc_end_geiser",
	"rpc_weapon_blood",
	"rpc_play_fx"
}
local extensions = {
	"WeaponUnitExtension",
	"AiWeaponUnitExtension"
}
WeaponSystem.init = function (self, entity_system_creation_context, system_name)
	WeaponSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	local network_event_delegate = entity_system_creation_context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate.register(network_event_delegate, self, unpack(RPCS))

	global_is_inside_inn = entity_system_creation_context.startup_data.level_key == "inn_level"
	self.game = Managers.state.network:game()
	self.network_manager = Managers.state.network
	self.beam_particle_effects = {}
	self.geiser_particle_effects = {}
	self.flamethrower_particle_effects = {}

	return 
end
WeaponSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	extension_init_data.weapon_system = self
	local extension = WeaponSystem.super.on_add_extension(self, world, unit, extension_name, extension_init_data)
	extension_init_data.weapon_system = nil

	return extension
end
WeaponSystem.rpc_alert_enemy = function (self, sender, enemy_unit_id, player_unit_id)
	local unit = self.unit_storage:unit(enemy_unit_id)

	if not Unit.alive(unit) then
		return 
	end

	local player_unit = self.unit_storage:unit(player_unit_id)

	AiUtils.alert_unit_of_enemy(unit, player_unit)

	return 
end
local ARGS = {
	{
		default = 0,
		name = "power_level"
	},
	{
		default = 0,
		name = "hit_target_index"
	},
	{
		default = 0,
		name = "boost_curve_multiplier"
	},
	{
		default = false,
		name = "is_critical_strike"
	},
	{
		default = true,
		name = "can_damage"
	},
	{
		default = true,
		name = "can_stagger"
	},
	{
		default = 1,
		name = "hit_ragdoll_actor"
	},
	{
		default = false,
		name = "blocking"
	},
	{
		default = false,
		name = "shield_break_procced"
	},
	{
		default = 1,
		name = "backstab_multiplier"
	}
}

for i = 1, #ARGS, 1 do
	ARGS[ARGS[i].name] = i
end

local RPC_ATTACK_HIT_TEMP = {}
WeaponSystem.send_rpc_attack_hit = function (self, damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, attack_direction, damage_profile_id, ...)
	table.clear(RPC_ATTACK_HIT_TEMP)

	local num_args = select("#", ...)

	for i = 1, num_args, 2 do
		local arg = select(i, ...)
		local val = select(i + 1, ...)
		RPC_ATTACK_HIT_TEMP[ARGS[arg]] = val
	end

	for i = 1, #ARGS, 1 do
		local setting = ARGS[i]
		local val = RPC_ATTACK_HIT_TEMP[i] or setting.default
		RPC_ATTACK_HIT_TEMP[i] = val
	end

	if self.is_server or LEVEL_EDITOR_TEST then
		self.rpc_attack_hit(self, nil, damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, attack_direction, damage_profile_id, unpack(RPC_ATTACK_HIT_TEMP))
	else
		Managers.state.network.network_transmit:send_rpc_server("rpc_attack_hit", damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, attack_direction, damage_profile_id, unpack(RPC_ATTACK_HIT_TEMP))
	end

	return 
end
local BLACKBOARDS = BLACKBOARDS
WeaponSystem.rpc_attack_hit = function (self, sender, damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, attack_direction, damage_profile_id, power_level, target_index, boost_curve_multiplier, is_critical_strike, can_damage, can_stagger, hit_ragdoll_actor_id, blocking, shield_break_procced, backstab_multiplier)
	local hit_unit = self.unit_storage:unit(hit_unit_id)
	local attacker_unit = self.unit_storage:unit(attacker_unit_id)

	if not Unit.alive(hit_unit) or not Unit.alive(attacker_unit) then
		return 
	end

	if global_is_inside_inn and table.contains(PLAYER_AND_BOT_UNITS, hit_unit) and table.contains(PLAYER_AND_BOT_UNITS, attacker_unit) then
		return 
	end

	local damage_source = NetworkLookup.damage_sources[damage_source_id]
	local hit_zone_name = NetworkLookup.hit_zones[hit_zone_id]
	local blackboard = BLACKBOARDS[hit_unit]
	local uses_slot_system = ScriptUnit.has_extension(hit_unit, "ai_slot_system")
	local target_override_extension = (ScriptUnit.has_extension(attacker_unit, "target_override_system") and ScriptUnit.extension(attacker_unit, "target_override_system")) or nil
	local status_extension = (ScriptUnit.has_extension(attacker_unit, "status_system") and ScriptUnit.extension(attacker_unit, "status_system")) or nil
	local attacker_not_incapacitated = (status_extension and not status_extension.is_disabled(status_extension)) or nil
	local hit_unit_is_enemy = DamageUtils.is_enemy(hit_unit)
	local hit_ragdoll_actor = NetworkLookup.hit_ragdoll_actors[hit_ragdoll_actor_id]
	local damage_profile_name = NetworkLookup.damage_profiles[damage_profile_id]
	local damage_profile = DamageProfileTemplates[damage_profile_name]

	if hit_ragdoll_actor == "n/a" then
		hit_ragdoll_actor = nil
	end

	if target_index == 0 then
		target_index = nil
	end

	local shield_breaking_hit = false

	if blackboard and blackboard.breed then
		if hit_unit_is_enemy and uses_slot_system and target_override_extension and attacker_not_incapacitated then
			local has_override_targets = next(blackboard.override_targets)

			if has_override_targets and AiUtils.unit_alive(hit_unit) then
				local t = Managers.time:time("game")

				target_override_extension.add_to_override_targets(target_override_extension, hit_unit, attacker_unit, blackboard, t)
			end
		end

		local unbreakable_shield = blackboard.breed.unbreakable_shield
		shield_breaking_hit = not unbreakable_shield and (damage_profile.shield_break or shield_break_procced)
	end

	local t = self.t

	DamageUtils.server_apply_hit(t, attacker_unit, hit_unit, hit_zone_name or "full", attack_direction, hit_ragdoll_actor, damage_source, power_level, damage_profile, target_index, boost_curve_multiplier, is_critical_strike, can_damage, can_stagger, blocking, shield_breaking_hit, backstab_multiplier)

	return 
end
WeaponSystem.destroy = function (self)
	local world = self.world

	for unit, data in pairs(self.beam_particle_effects) do
		World.destroy_particles(world, data.beam_effect)
		World.destroy_particles(world, data.beam_end_effect)
	end

	self.beam_particle_effects = nil

	self.network_event_delegate:unregister(self)

	return 
end
WeaponSystem.update = function (self, context, t)
	WeaponSystem.super.update(self, context, t)

	self.t = t

	self.update_synced_beam_particle_effects(self)
	self.update_synced_geiser_particle_effects(self, context, t)
	self.update_synced_flamethrower_particle_effects(self)

	return 
end
local INDEX_POSITION = 1
local INDEX_DISTANCE = 2
local INDEX_NORMAL = 3
local INDEX_ACTOR = 4
WeaponSystem.update_synced_beam_particle_effects = function (self)
	local game = self.game
	local network_manager = self.network_manager
	local physics_world = World.get_data(self.world, "physics_world")

	for unit, data in pairs(self.beam_particle_effects) do
		local unit_id = network_manager.unit_game_object_id(network_manager, unit)
		local weapon_unit = data.weapon_unit

		if not unit_id or not Unit.alive(weapon_unit) then
			World.destroy_particles(self.world, data.beam_effect)
			World.destroy_particles(self.world, data.beam_end_effect)

			self.beam_particle_effects[unit] = nil
		else
			local aim_direction = GameSession.game_object_field(game, unit_id, "aim_direction")
			local aim_position = GameSession.game_object_field(game, unit_id, "aim_position")
			local range = data.range
			local result = PhysicsWorld.immediate_raycast_actors(physics_world, aim_position, aim_direction, range, "static_collision_filter", "filter_player_ray_projectile_static_only", "dynamic_collision_filter", "filter_player_ray_projectile_ai_only", "dynamic_collision_filter", "filter_player_ray_projectile_hitbox_only")
			local beam_end_position = aim_position + aim_direction * range
			local hit_position, hit_unit = nil

			if result then
				for index, hit in pairs(result) do
					local potential_hit_position = hit[INDEX_POSITION]
					local hit_actor = hit[INDEX_ACTOR]
					local potential_hit_unit = Actor.unit(hit_actor)

					if potential_hit_unit ~= unit then
						hit_position = potential_hit_position
						hit_unit = potential_hit_unit

						break
					end
				end
			end

			if hit_unit then
				beam_end_position = hit_position
			end

			local end_of_staff_position = Unit.world_position(weapon_unit, Unit.node(weapon_unit, "fx_muzzle"))
			local distance = Vector3.distance(end_of_staff_position, beam_end_position)
			local direction = Vector3.normalize(end_of_staff_position - beam_end_position)
			local rotation = Quaternion.look(direction)
			local world = self.world

			World.move_particles(world, data.beam_end_effect, beam_end_position)
			World.move_particles(world, data.beam_effect, beam_end_position, rotation)
			World.set_particles_variable(world, data.beam_effect, data.beam_effect_length_id, Vector3(0.3, distance, 0))
		end
	end

	return 
end

local function ballistic_raycast(physics_world, max_steps, max_time, position, velocity, gravity, collision_filter, visualize)
	local time_step = max_time / max_steps

	for i = 1, max_steps, 1 do
		local new_position = position + velocity * time_step
		local delta = new_position - position
		local direction = Vector3.normalize(delta)
		local distance = Vector3.length(delta)
		local result, hit_position, hit_distance, normal, actor = PhysicsWorld.immediate_raycast(physics_world, position, direction, distance, "closest", "collision_filter", collision_filter)

		if hit_position then
			return result, hit_position, hit_distance, normal, actor
		end

		velocity = velocity + gravity * time_step
		position = new_position
	end

	return false, position
end

WeaponSystem.update_synced_geiser_particle_effects = function (self, context, t)
	local game = self.game
	local network_manager = self.network_manager
	local world = self.world
	local physics_world = World.get_data(world, "physics_world")

	for unit, data in pairs(self.geiser_particle_effects) do
		local unit_id = network_manager.unit_game_object_id(network_manager, unit)

		if not unit_id then
			World.destroy_particles(world, data.geiser_effect)

			self.geiser_particle_effects[unit] = nil
		else
			local charge_value = (t - data.time_to_shoot) / data.charge_time
			local radius = math.min(data.max_radius, data.max_radius * charge_value + data.min_radius)
			local player_position = GameSession.game_object_field(game, unit_id, "aim_position")
			local up = Vector3(0, 0, 1)
			local player_rotation = Quaternion.look(GameSession.game_object_field(game, unit_id, "aim_direction"), up)
			local max_steps = 10
			local max_time = 1.5
			local speed = 15
			local angle = data.angle
			local velocity = Quaternion.forward(Quaternion.multiply(player_rotation, Quaternion(Vector3.right(), angle))) * speed
			local gravity = Vector3(0, 0, -9.82)
			local collision_filter = "filter_geiser_check"
			local result, hit_position, hit_distance, normal = ballistic_raycast(physics_world, max_steps, max_time, player_position, velocity, gravity, collision_filter, false)
			local position = hit_position

			World.move_particles(world, data.geiser_effect, position)
			World.set_particles_variable(world, data.geiser_effect, data.geiser_effect_variable, Vector3(radius * 2, radius * 2, 1))
		end
	end

	return 
end
WeaponSystem.update_synced_flamethrower_particle_effects = function (self)
	local game = self.game
	local network_manager = self.network_manager
	local physics_world = World.get_data(self.world, "physics_world")

	for unit, data in pairs(self.flamethrower_particle_effects) do
		local unit_id = network_manager.unit_game_object_id(network_manager, unit)
		local weapon_unit = data.weapon_unit

		if not unit_id or not Unit.alive(weapon_unit) then
			World.stop_spawning_particles(self.world, data.flamethrower_effect)

			self.flamethrower_particle_effects[unit] = nil
		else
			local muzzle_position = Unit.world_position(weapon_unit, Unit.node(weapon_unit, "fx_muzzle"))
			local muzzle_rotation = Unit.world_rotation(weapon_unit, Unit.node(weapon_unit, "fx_muzzle"))
			local world = self.world

			World.move_particles(world, data.flamethrower_effect, muzzle_position, muzzle_rotation)
		end
	end

	return 
end
WeaponSystem._update_debug = function (self)
	if script_data.player_mechanics_goodness_debug and not DEDICATED_SERVER then
		local player = Managers.player:player_from_peer_id(Network.peer_id())
		local unit = player.player_unit
		local is_server = Managers.player.is_server

		if DebugKeyHandler.key_pressed("b", "take some damage", "player") then
			DamageUtils.debug_deal_damage(unit, "basic_debug_damage_player")
		elseif DebugKeyHandler.key_pressed("v", "kill player", "player", "left ctrl") then
			local status_extension = ScriptUnit.extension(unit, "status_system")
			status_extension.wounds = 0

			DamageUtils.debug_deal_damage(unit, "basic_debug_damage_kill")
		elseif DebugKeyHandler.key_pressed("b", "revive player", "player", "left shift") then
			local network_manager = self.network_manager
			local unit_id = network_manager.unit_game_object_id(network_manager, unit)
			local status_extension = ScriptUnit.extension(unit, "status_system")

			if status_extension.is_knocked_down(status_extension) then
				network_manager.network_transmit:send_rpc_server("rpc_status_change_bool", NetworkLookup.statuses.revived, true, unit_id, unit_id)
				status_extension.set_respawned(status_extension, true)
			elseif status_extension.is_ready_for_assisted_respawn(status_extension) then
				network_manager.network_transmit:send_rpc_server("rpc_status_change_bool", NetworkLookup.statuses.assisted_respawning, true, unit_id, unit_id)
				status_extension.set_assisted_respawning(status_extension, true, unit)
			end
		elseif DebugKeyHandler.key_pressed("b", "heal player", "player", "left ctrl") then
			DamageUtils.debug_heal(unit, 20)
		elseif DebugKeyHandler.key_pressed("b", "block", "player", "left alt") then
			local status_extension = ScriptUnit.extension(unit, "status_system")
			local network_manager = self.network_manager
			local unit_id = network_manager.unit_game_object_id(network_manager, unit)

			network_manager.network_transmit:send_rpc_server("rpc_set_blocking", unit_id, true)
			status_extension.set_blocking(status_extension, true)
		end
	end

	if DebugKeyHandler.key_pressed("z", "clear weapon/material debug") then
		local drawer = Managers.state.debug:drawer({
			mode = "retained",
			name = "weapon_system"
		})

		drawer.reset(drawer)

		local drawer = Managers.state.debug:drawer({
			mode = "retained",
			name = "DEBUG_DRAW_IMPACT_DECAL_HIT"
		})

		drawer.reset(drawer)
	end

	return 
end
WeaponSystem.rpc_ai_weapon_shoot_start = function (self, sender, owner_unit_id, shoot_time)
	local owner_unit = Managers.state.unit_storage:unit(owner_unit_id)

	if not owner_unit then
		return 
	end

	local breed = Unit.get_data(owner_unit, "breed")
	local inventory_extension = ScriptUnit.extension(owner_unit, "ai_inventory_system")
	local inventory_template = breed.default_inventory_template
	local weapon_unit = inventory_extension.get_unit(inventory_extension, inventory_template)
	local ai_weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")

	ai_weapon_extension.shoot_start(ai_weapon_extension, owner_unit, shoot_time / 100)

	return 
end
WeaponSystem.rpc_ai_weapon_shoot = function (self, sender, owner_unit_id)
	local owner_unit = Managers.state.unit_storage:unit(owner_unit_id)

	if not owner_unit then
		return 
	end

	local breed = Unit.get_data(owner_unit, "breed")
	local inventory_extension = ScriptUnit.extension(owner_unit, "ai_inventory_system")
	local inventory_template = breed.default_inventory_template
	local weapon_unit = inventory_extension.get_unit(inventory_extension, inventory_template)
	local ai_weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")

	ai_weapon_extension.shoot(ai_weapon_extension, owner_unit)

	return 
end
WeaponSystem.rpc_ai_weapon_shoot_end = function (self, sender, owner_unit_id)
	local owner_unit = Managers.state.unit_storage:unit(owner_unit_id)

	if not owner_unit then
		return 
	end

	local breed = Unit.get_data(owner_unit, "breed")
	local inventory_extension = ScriptUnit.extension(owner_unit, "ai_inventory_system")
	local inventory_template = breed.default_inventory_template
	local weapon_unit = inventory_extension.get_unit(inventory_extension, inventory_template)
	local ai_weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")

	ai_weapon_extension.shoot_end(ai_weapon_extension, owner_unit)

	return 
end
WeaponSystem.rpc_start_beam = function (self, sender, unit_id, beam_effect_id, beam_end_effect_id, range)
	if not LEVEL_EDITOR_TEST then
		local unit = self.unit_storage:unit(unit_id)
		local beam_effect = NetworkLookup.effects[beam_effect_id]
		local beam_end_effect = NetworkLookup.effects[beam_end_effect_id]
		local inventory_extension = ScriptUnit.extension(unit, "inventory_system")
		local equipment = inventory_extension.equipment(inventory_extension)
		local weapon_unit = equipment.right_hand_wielded_unit_3p or equipment.left_hand_wielded_unit_3p
		local world = self.world
		self.beam_particle_effects[unit] = {
			beam_effect = World.create_particles(world, beam_effect, Vector3.zero()),
			beam_end_effect = World.create_particles(world, beam_end_effect, Vector3.zero()),
			beam_effect_length_id = World.find_particles_variable(world, beam_effect, "trail_length"),
			beam_effect_name = beam_effect,
			beam_end_effect_name = beam_end_effect,
			range = range,
			weapon_unit = weapon_unit
		}

		if self.is_server then
			self.network_transmit:send_rpc_clients_except("rpc_start_beam", sender, unit_id, beam_effect_id, beam_end_effect_id, range)
		end
	end

	return 
end
WeaponSystem.rpc_end_beam = function (self, sender, unit_id)
	if not LEVEL_EDITOR_TEST then
		local world = self.world
		local unit = self.unit_storage:unit(unit_id)
		local data = self.beam_particle_effects[unit]

		if data then
			World.destroy_particles(world, data.beam_effect)
			World.destroy_particles(world, data.beam_end_effect)

			self.beam_particle_effects[unit] = nil

			if self.is_server then
				self.network_transmit:send_rpc_clients_except("rpc_end_beam", sender, unit_id)
			end
		end
	end

	return 
end
WeaponSystem.rpc_start_geiser = function (self, sender, unit_id, geiser_effect_id, min_radius, max_radius, charge_time, angle)
	if not LEVEL_EDITOR_TEST then
		if self.is_server then
			self.network_transmit:send_rpc_clients_except("rpc_start_geiser", sender, unit_id, geiser_effect_id, min_radius, max_radius, charge_time, angle)
		end

		local unit = self.unit_storage:unit(unit_id)
		local geiser_effect_name = NetworkLookup.effects[geiser_effect_id]
		local world = self.world
		self.geiser_particle_effects[unit] = {
			geiser_effect = World.create_particles(world, geiser_effect_name, Vector3.zero()),
			geiser_effect_variable = World.find_particles_variable(world, geiser_effect_name, "charge_radius"),
			geiser_effect_name = geiser_effect_name,
			min_radius = min_radius,
			max_radius = max_radius,
			charge_time = charge_time,
			angle = angle,
			time_to_shoot = Managers.time:time("game"),
			start_time = Managers.time:time("game")
		}
	end

	return 
end
WeaponSystem.rpc_end_geiser = function (self, sender, unit_id)
	if not LEVEL_EDITOR_TEST then
		local world = self.world
		local unit = self.unit_storage:unit(unit_id)
		local data = self.geiser_particle_effects[unit]

		if data then
			World.destroy_particles(world, data.geiser_effect)

			self.geiser_particle_effects[unit] = nil

			if self.is_server then
				self.network_transmit:send_rpc_clients_except("rpc_end_geiser", sender, unit_id)
			end
		end
	end

	return 
end
WeaponSystem.rpc_start_flamethrower = function (self, sender, unit_id, flamethrower_effect_id)
	if not LEVEL_EDITOR_TEST then
		local unit = self.unit_storage:unit(unit_id)
		local flamethrower_effect = NetworkLookup.effects[flamethrower_effect_id]
		local inventory_extension = ScriptUnit.extension(unit, "inventory_system")
		local equipment = inventory_extension.equipment(inventory_extension)
		local weapon_unit = equipment.right_hand_wielded_unit_3p or equipment.left_hand_wielded_unit_3p
		local muzzle_position = Unit.world_position(weapon_unit, Unit.node(weapon_unit, "fx_muzzle"))
		local muzzle_rotation = Unit.world_rotation(weapon_unit, Unit.node(weapon_unit, "fx_muzzle"))
		local world = self.world
		self.flamethrower_particle_effects[unit] = {
			flamethrower_effect = World.create_particles(world, flamethrower_effect, muzzle_position, muzzle_rotation),
			flamethrower_effect_name = flamethrower_effect,
			weapon_unit = weapon_unit
		}

		if self.is_server then
			self.network_transmit:send_rpc_clients_except("rpc_start_flamethrower", sender, unit_id, flamethrower_effect_id)
		end
	end

	return 
end
WeaponSystem.rpc_end_flamethrower = function (self, sender, unit_id)
	if not LEVEL_EDITOR_TEST then
		local world = self.world
		local unit = self.unit_storage:unit(unit_id)
		local data = self.flamethrower_particle_effects[unit]

		if data then
			World.stop_spawning_particles(world, data.flamethrower_effect)

			self.flamethrower_particle_effects[unit] = nil

			if self.is_server then
				self.network_transmit:send_rpc_clients_except("rpc_end_flamethrower", sender, unit_id)
			end
		end
	end

	return 
end
WeaponSystem.rpc_weapon_blood = function (self, sender, attacker_unit_id, attack_template_damage_type_id)
	local world = self.world
	local attacker_unit = self.unit_storage:unit(attacker_unit_id)

	if not Unit.alive(attacker_unit) then
		return 
	end

	Managers.state.blood:add_weapon_blood(attacker_unit, NetworkLookup.attack_templates[attack_template_damage_type_id])

	if self.is_server then
		self.network_transmit:send_rpc_clients_except("rpc_weapon_blood", sender, attacker_unit_id, attack_template_damage_type_id)
	end

	return 
end
WeaponSystem.rpc_play_fx = function (self, sender, vfx_array, sfx_array, position_array)
	local world = self.world
	local World_create_particles = World.create_particles
	local vfx_lookup = NetworkLookup.effects
	local sfx_lookup = NetworkLookup.sound_events

	if 0 < #sfx_array then
		local wwise_world = Managers.world:wwise_world(world)
		local wwise_trigger_event = WwiseWorld.trigger_event
		local wwise_make_source = WwiseWorld.make_auto_source
		local sound_env_system = Managers.state.entity:system("sound_environment_system")
		local set_source_env = sound_env_system.set_source_environment

		for i = 1, #vfx_array, 1 do
			local vfx = vfx_lookup[vfx_array[i]]
			local sfx = sfx_lookup[sfx_array[i]]
			local pos = position_array[i]

			World_create_particles(world, vfx, pos)

			local source = wwise_make_source(wwise_world, pos)

			wwise_trigger_event(wwise_world, sfx, source)
			set_source_env(sound_env_system, source, pos)
		end
	else
		for i = 1, #vfx_array, 1 do
			local vfx = vfx_lookup[vfx_array[i]]

			World_create_particles(world, vfx, position_array[i])
		end
	end

	return 
end
WeaponSystem.hot_join_sync = function (self, sender)
	for unit, data in pairs(self.beam_particle_effects) do
		local unit_id = Managers.state.network:unit_game_object_id(unit)
		local beam_effect_id = NetworkLookup.effects[data.beam_effect_name]
		local beam_end_effect_id = NetworkLookup.effects[data.beam_end_effect_name]

		RPC.rpc_start_beam(sender, unit_id, beam_effect_id, beam_end_effect_id, data.range)
	end

	for unit, data in pairs(self.geiser_particle_effects) do
		local unit_id = Managers.state.network:unit_game_object_id(unit)
		local geiser_effect_id = NetworkLookup.effects[data.geiser_effect_name]
		local min_radius = data.min_radius
		local max_radius = data.max_radius
		local charge_time = data.charge_time
		local angle = data.angle
		local time_to_shoot = data.time_to_shoot - data.start_time

		RPC.rpc_start_geiser(sender, unit_id, geiser_effect_id, min_radius, max_radius, charge_time, angle, time_to_shoot)
	end

	return 
end

return 

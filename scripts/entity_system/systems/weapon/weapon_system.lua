require("scripts/unit_extensions/weapons/weapon_unit_extension")
require("scripts/unit_extensions/weapons/ai_weapon_unit_extension")
require("scripts/unit_extensions/weapons/single_weapon_unit_extension")

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
	"rpc_play_fx",
	"rpc_change_single_weapon_state",
	"rpc_summon_vortex"
}
local extensions = {
	"WeaponUnitExtension",
	"AiWeaponUnitExtension",
	"SingleWeaponUnitExtension"
}

WeaponSystem.init = function (self, entity_system_creation_context, system_name)
	WeaponSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	local network_event_delegate = entity_system_creation_context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))

	local level_setting = LevelSettings[entity_system_creation_context.startup_data.level_key]
	global_is_inside_inn = level_setting.hub_level or false
	self._player_damage_forbidden = Managers.state.game_mode:setting("player_damage_forbidden")
	self.game = Managers.state.network:game()
	self.network_manager = Managers.state.network
	self._beam_particle_effects = {}
	self._geiser_particle_effects = {}
	self._flamethrower_particle_effects = {}
end

WeaponSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	extension_init_data.weapon_system = self
	local extension = WeaponSystem.super.on_add_extension(self, world, unit, extension_name, extension_init_data)
	extension_init_data.weapon_system = nil

	return extension
end

WeaponSystem.rpc_alert_enemy = function (self, channel_id, enemy_unit_id, player_unit_id)
	local unit = self.unit_storage:unit(enemy_unit_id)

	if not Unit.alive(unit) then
		return
	end

	local player_unit = self.unit_storage:unit(player_unit_id)

	AiUtils.alert_unit_of_enemy(unit, player_unit)
end

local ARGS = {
	{
		default = 0,
		name = "power_level",
		min = MIN_POWER_LEVEL,
		max = MAX_POWER_LEVEL
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
	},
	{
		default = false,
		name = "attacker_is_level_unit"
	},
	{
		default = false,
		name = "first_hit"
	},
	{
		default = 0,
		name = "total_hits"
	}
}

for i = 1, #ARGS, 1 do
	ARGS[ARGS[i].name] = i
end

local RPC_ATTACK_HIT_TEMP = {}

WeaponSystem.send_rpc_attack_hit = function (self, damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, hit_position, attack_direction, damage_profile_id, ...)
	table.clear(RPC_ATTACK_HIT_TEMP)

	local num_args = select("#", ...)

	for i = 1, num_args, 2 do
		local arg = select(i, ...)
		local val = select(i + 1, ...)
		RPC_ATTACK_HIT_TEMP[ARGS[arg]] = val
	end

	for i = 1, #ARGS, 1 do
		local setting = ARGS[i]
		local val = RPC_ATTACK_HIT_TEMP[i]

		if val == nil then
			val = setting.default
		end

		if setting.min and setting.max then
			val = math.clamp(val, setting.min, setting.max)
		elseif setting.min then
			val = math.max(val, setting.min)
		elseif setting.max then
			val = math.min(val, setting.max)
		end

		RPC_ATTACK_HIT_TEMP[i] = val
	end

	if self.is_server or LEVEL_EDITOR_TEST then
		self:rpc_attack_hit(nil, damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, hit_position, attack_direction, damage_profile_id, unpack(RPC_ATTACK_HIT_TEMP))
	else
		Managers.state.network.network_transmit:send_rpc_server("rpc_attack_hit", damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, hit_position, attack_direction, damage_profile_id, unpack(RPC_ATTACK_HIT_TEMP))
	end

	local hit_unit = self.unit_storage:unit(hit_unit_id)
	local attacker_unit = self.unit_storage:unit(attacker_unit_id)

	if Managers.player:is_player_unit(attacker_unit) then
		local owner_player = Managers.player:owner(attacker_unit)

		if owner_player.local_player and not owner_player.bot_player then
			local breed = Unit.get_data(hit_unit, "breed")

			if breed and breed.boss then
				Managers.state.event:trigger("show_boss_health_bar", hit_unit)
			end
		end
	end
end

local BLACKBOARDS = BLACKBOARDS

WeaponSystem.rpc_attack_hit = function (self, channel_id, damage_source_id, attacker_unit_id, hit_unit_id, hit_zone_id, hit_position, attack_direction, damage_profile_id, power_level, target_index, boost_curve_multiplier, is_critical_strike, can_damage, can_stagger, hit_ragdoll_actor_id, blocking, shield_break_procced, backstab_multiplier, attacker_is_level_unit, first_hit, total_hits)
	local hit_unit = self.unit_storage:unit(hit_unit_id)
	local attacker_unit = self.network_manager:game_object_or_level_unit(attacker_unit_id, attacker_is_level_unit)

	if not Unit.alive(hit_unit) or not Unit.alive(attacker_unit) then
		return
	end

	if self._player_damage_forbidden then
		local player_manager = Managers.player

		if player_manager:is_player_unit(hit_unit) and player_manager:is_player_unit(attacker_unit) then
			return
		end
	end

	local damage_source = NetworkLookup.damage_sources[damage_source_id]
	local hit_zone_name = NetworkLookup.hit_zones[hit_zone_id]
	local blackboard = BLACKBOARDS[hit_unit]
	local uses_slot_system = ScriptUnit.has_extension(hit_unit, "ai_slot_system")
	local target_override_extension = (ScriptUnit.has_extension(attacker_unit, "target_override_system") and ScriptUnit.extension(attacker_unit, "target_override_system")) or nil
	local status_extension = (ScriptUnit.has_extension(attacker_unit, "status_system") and ScriptUnit.extension(attacker_unit, "status_system")) or nil
	local attacker_not_incapacitated = (status_extension and not status_extension:is_disabled()) or nil
	local hit_unit_is_enemy = DamageUtils.is_enemy(attacker_unit, hit_unit)
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

	if blackboard and blackboard.breed and blackboard.breed.is_ai then
		if hit_unit_is_enemy and uses_slot_system and target_override_extension and attacker_not_incapacitated then
			local has_override_targets = next(blackboard.override_targets)

			if has_override_targets and AiUtils.unit_alive(hit_unit) then
				local t = Managers.time:time("game")

				target_override_extension:add_to_override_targets(hit_unit, attacker_unit, blackboard, t)
			end
		end

		local unbreakable_shield = blackboard.breed.unbreakable_shield
		shield_breaking_hit = not unbreakable_shield and (damage_profile.shield_break or shield_break_procced)
	end

	local t = self.t

	DamageUtils.server_apply_hit(t, attacker_unit, hit_unit, hit_zone_name or "full", hit_position, attack_direction, hit_ragdoll_actor, damage_source, power_level, damage_profile, target_index, boost_curve_multiplier, is_critical_strike, can_damage, can_stagger, blocking, shield_breaking_hit, backstab_multiplier, first_hit, total_hits)
end

WeaponSystem.destroy = function (self)
	local world = self.world

	for _, data in pairs(self._beam_particle_effects) do
		World.destroy_particles(world, data.beam_effect)
		World.destroy_particles(world, data.beam_end_effect)
	end

	self._beam_particle_effects = nil

	self.network_event_delegate:unregister(self)
end

WeaponSystem.update = function (self, context, t)
	WeaponSystem.super.update(self, context, t)

	self.t = t

	self:update_synced_beam_particle_effects()
	self:update_synced_geiser_particle_effects(context, t)
	self:update_synced_flamethrower_particle_effects()
end

local INDEX_POSITION = 1
local INDEX_ACTOR = 4

WeaponSystem.update_synced_beam_particle_effects = function (self)
	local game = self.game
	local network_manager = self.network_manager
	local physics_world = World.get_data(self.world, "physics_world")

	for unit, data in pairs(self._beam_particle_effects) do
		local unit_id = network_manager:unit_game_object_id(unit)
		local weapon_unit = data.weapon_unit

		if not unit_id or not Unit.alive(weapon_unit) then
			World.destroy_particles(self.world, data.beam_effect)
			World.destroy_particles(self.world, data.beam_end_effect)

			self._beam_particle_effects[unit] = nil
		else
			local aim_direction = GameSession.game_object_field(game, unit_id, "aim_direction")
			local aim_position = GameSession.game_object_field(game, unit_id, "aim_position")
			local range = data.range
			local result = PhysicsWorld.immediate_raycast_actors(physics_world, aim_position, aim_direction, range, "static_collision_filter", "filter_player_ray_projectile_static_only", "dynamic_collision_filter", "filter_player_ray_projectile_ai_only", "dynamic_collision_filter", "filter_player_ray_projectile_hitbox_only")
			local beam_end_position = aim_position + aim_direction * range
			local hit_position, hit_unit = nil

			if result then
				for _, hit in pairs(result) do
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

	for unit, data in pairs(self._geiser_particle_effects) do
		local unit_id = network_manager:unit_game_object_id(unit)

		if not unit_id then
			World.destroy_particles(world, data.geiser_effect)

			self._geiser_particle_effects[unit] = nil
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
			local _, hit_position, _, _ = ballistic_raycast(physics_world, max_steps, max_time, player_position, velocity, gravity, collision_filter, false)
			local position = hit_position

			World.move_particles(world, data.geiser_effect, position)
			World.set_particles_variable(world, data.geiser_effect, data.geiser_effect_variable, Vector3(radius * 2, radius * 2, 1))
		end
	end
end

WeaponSystem.update_synced_flamethrower_particle_effects = function (self)
	local network_manager = self.network_manager

	for unit, data in pairs(self._flamethrower_particle_effects) do
		local unit_id = network_manager:unit_game_object_id(unit)
		local weapon_unit = data.weapon_unit

		if not unit_id or not Unit.alive(weapon_unit) then
			World.stop_spawning_particles(self.world, data.flamethrower_effect)

			self._flamethrower_particle_effects[unit] = nil
		else
			local world = self.world
			local muzzle_position = Unit.world_position(weapon_unit, Unit.node(weapon_unit, "fx_muzzle"))
			local muzzle_rotation = Unit.world_rotation(weapon_unit, Unit.node(weapon_unit, "fx_muzzle"))

			World.move_particles(world, data.flamethrower_effect, muzzle_position, muzzle_rotation)
		end
	end
end

WeaponSystem.rpc_ai_weapon_shoot_start = function (self, channel_id, owner_unit_id, shoot_time)
	local owner_unit = Managers.state.unit_storage:unit(owner_unit_id)

	if not owner_unit then
		return
	end

	local breed = Unit.get_data(owner_unit, "breed")
	local inventory_extension = ScriptUnit.extension(owner_unit, "ai_inventory_system")
	local inventory_template = breed.default_inventory_template
	local weapon_unit = inventory_extension:get_unit(inventory_template)
	local ai_weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")

	ai_weapon_extension:shoot_start(owner_unit, shoot_time / 100)
end

WeaponSystem.rpc_ai_weapon_shoot = function (self, channel_id, owner_unit_id)
	local owner_unit = Managers.state.unit_storage:unit(owner_unit_id)

	if not owner_unit then
		return
	end

	local breed = Unit.get_data(owner_unit, "breed")
	local inventory_extension = ScriptUnit.extension(owner_unit, "ai_inventory_system")
	local inventory_template = breed.default_inventory_template
	local weapon_unit = inventory_extension:get_unit(inventory_template)
	local ai_weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")

	ai_weapon_extension:shoot(owner_unit)
end

WeaponSystem.rpc_ai_weapon_shoot_end = function (self, channel_id, owner_unit_id)
	local owner_unit = Managers.state.unit_storage:unit(owner_unit_id)

	if not owner_unit then
		return
	end

	local breed = Unit.get_data(owner_unit, "breed")
	local inventory_extension = ScriptUnit.extension(owner_unit, "ai_inventory_system")
	local inventory_template = breed.default_inventory_template
	local weapon_unit = inventory_extension:get_unit(inventory_template)
	local ai_weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")

	ai_weapon_extension:shoot_end(owner_unit)
end

WeaponSystem.rpc_change_single_weapon_state = function (self, channel_id, owner_unit_id, state_id)
	local owner_unit = Managers.state.unit_storage:unit(owner_unit_id)

	if not owner_unit then
		return
	end

	local single_weapon_state = NetworkLookup.single_weapon_states[state_id]
	local received_via_network = true
	local peer_id = CHANNEL_TO_PEER_ID[channel_id]

	self:change_single_weapon_state(owner_unit, single_weapon_state, peer_id, received_via_network)
end

WeaponSystem.change_single_weapon_state = function (self, owner_unit, state, except_peer, received_via_network)
	local blackboard = BLACKBOARDS[owner_unit]

	if blackboard then
		local weapon_unit = blackboard.weapon_unit
		local single_weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")

		single_weapon_extension:change_state(state)
	end

	local owner_unit_id = Managers.state.unit_storage:go_id(owner_unit)
	local state_id = NetworkLookup.single_weapon_states[state]

	if self.is_server then
		self.network_transmit:send_rpc_clients_except("rpc_change_single_weapon_state", except_peer, owner_unit_id, state_id)
	elseif not received_via_network then
		self.network_transmit:send_rpc_server("rpc_change_single_weapon_state", owner_unit_id, state_id)
	end
end

WeaponSystem.rpc_start_beam = function (self, channel_id, unit_id, beam_effect_id, beam_end_effect_id, range)
	if not LEVEL_EDITOR_TEST then
		local unit = self.unit_storage:unit(unit_id)
		local beam_effect = NetworkLookup.effects[beam_effect_id]
		local beam_end_effect = NetworkLookup.effects[beam_end_effect_id]
		local inventory_extension = ScriptUnit.extension(unit, "inventory_system")
		local equipment = inventory_extension:equipment()
		local weapon_unit = equipment.right_hand_wielded_unit_3p or equipment.left_hand_wielded_unit_3p
		local world = self.world
		self._beam_particle_effects[unit] = {
			beam_effect = World.create_particles(world, beam_effect, Vector3.zero()),
			beam_end_effect = World.create_particles(world, beam_end_effect, Vector3.zero()),
			beam_effect_length_id = World.find_particles_variable(world, beam_effect, "trail_length"),
			beam_effect_name = beam_effect,
			beam_end_effect_name = beam_end_effect,
			range = range,
			weapon_unit = weapon_unit
		}

		if self.is_server then
			local peer_id = CHANNEL_TO_PEER_ID[channel_id]

			self.network_transmit:send_rpc_clients_except("rpc_start_beam", peer_id, unit_id, beam_effect_id, beam_end_effect_id, range)
		end
	end
end

WeaponSystem.rpc_end_beam = function (self, channel_id, unit_id)
	if not LEVEL_EDITOR_TEST then
		local world = self.world
		local unit = self.unit_storage:unit(unit_id)
		local data = self._beam_particle_effects[unit]

		if data then
			World.destroy_particles(world, data.beam_effect)
			World.destroy_particles(world, data.beam_end_effect)

			self._beam_particle_effects[unit] = nil

			if self.is_server then
				local peer_id = CHANNEL_TO_PEER_ID[channel_id]

				self.network_transmit:send_rpc_clients_except("rpc_end_beam", peer_id, unit_id)
			end
		end
	end
end

WeaponSystem.rpc_start_geiser = function (self, channel_id, unit_id, geiser_effect_id, min_radius, max_radius, charge_time, angle)
	if not LEVEL_EDITOR_TEST then
		if self.is_server then
			local side_manager = Managers.state.side
			local peer_id = CHANNEL_TO_PEER_ID[channel_id]
			local side = side_manager:get_side_from_player_unique_id(peer_id .. ":1")

			self.network_transmit:send_rpc_side_clients_except("rpc_start_geiser", side, true, peer_id, unit_id, geiser_effect_id, min_radius, max_radius, charge_time, angle)

			if DEDICATED_SERVER then
				return
			end

			local local_player = Managers.player:local_player()
			local local_side = side_manager:get_side_from_player_unique_id(local_player:unique_id())

			if side_manager:is_enemy_by_side(side, local_side) then
				return
			end
		end

		local unit = self.unit_storage:unit(unit_id)
		local geiser_effect_name = NetworkLookup.effects[geiser_effect_id]
		local world = self.world
		self._geiser_particle_effects[unit] = {
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
end

WeaponSystem.rpc_end_geiser = function (self, channel_id, unit_id)
	if not LEVEL_EDITOR_TEST then
		local world = self.world
		local unit = self.unit_storage:unit(unit_id)
		local data = self._geiser_particle_effects[unit]

		if data then
			World.destroy_particles(world, data.geiser_effect)

			self._geiser_particle_effects[unit] = nil

			if self.is_server then
				local peer_id = CHANNEL_TO_PEER_ID[channel_id]

				self.network_transmit:send_rpc_clients_except("rpc_end_geiser", peer_id, unit_id)
			end
		end
	end
end

WeaponSystem.rpc_start_flamethrower = function (self, channel_id, unit_id, flamethrower_effect_id)
	if not LEVEL_EDITOR_TEST then
		local unit = self.unit_storage:unit(unit_id)
		local flamethrower_effect = NetworkLookup.effects[flamethrower_effect_id]
		local inventory_extension = ScriptUnit.extension(unit, "inventory_system")
		local equipment = inventory_extension:equipment()
		local weapon_unit = equipment.right_hand_wielded_unit_3p or equipment.left_hand_wielded_unit_3p
		local muzzle_position = Unit.world_position(weapon_unit, Unit.node(weapon_unit, "fx_muzzle"))
		local muzzle_rotation = Unit.world_rotation(weapon_unit, Unit.node(weapon_unit, "fx_muzzle"))
		local world = self.world
		local current_data = self._flamethrower_particle_effects[unit]

		if current_data then
			World.stop_spawning_particles(world, current_data.flamethrower_effect)

			current_data.flamethrower_effect = World.create_particles(world, flamethrower_effect, muzzle_position, muzzle_rotation)
			current_data.flamethrower_effect_name = flamethrower_effect
			current_data.weapon_unit = weapon_unit
		else
			self._flamethrower_particle_effects[unit] = {
				flamethrower_effect = World.create_particles(world, flamethrower_effect, muzzle_position, muzzle_rotation),
				flamethrower_effect_name = flamethrower_effect,
				weapon_unit = weapon_unit
			}
		end

		if self.is_server then
			local peer_id = CHANNEL_TO_PEER_ID[channel_id]

			self.network_transmit:send_rpc_clients_except("rpc_start_flamethrower", peer_id, unit_id, flamethrower_effect_id)
		end
	end
end

WeaponSystem.rpc_end_flamethrower = function (self, channel_id, unit_id)
	if not LEVEL_EDITOR_TEST then
		local world = self.world
		local unit = self.unit_storage:unit(unit_id)
		local data = self._flamethrower_particle_effects[unit]

		if data then
			World.stop_spawning_particles(world, data.flamethrower_effect)

			self._flamethrower_particle_effects[unit] = nil

			if self.is_server then
				local peer_id = CHANNEL_TO_PEER_ID[channel_id]

				self.network_transmit:send_rpc_clients_except("rpc_end_flamethrower", peer_id, unit_id)
			end
		end
	end
end

WeaponSystem.rpc_summon_vortex = function (self, channel_id, owner_unit_id, target_unit_id)
	if not LEVEL_EDITOR_TEST then
		local world = self.world
		local unit = self.unit_storage:unit(owner_unit_id)
		local target_unit = self.unit_storage:unit(target_unit_id)
		local bb = BLACKBOARDS[target_unit]
		local vext = bb and bb.thornsister_vortex_ext

		if vext then
			vext:refresh_duration()
		else
			local storm_spawn_position = POSITION_LOOKUP[target_unit]

			Managers.state.unit_spawner:request_spawn_network_unit("vortex_unit", storm_spawn_position, Quaternion.identity(), unit, 0)
		end
	end
end

WeaponSystem.rpc_weapon_blood = function (self, channel_id, attacker_unit_id, attack_template_damage_type_id)
	local attacker_unit = self.unit_storage:unit(attacker_unit_id)

	if not Unit.alive(attacker_unit) then
		return
	end

	Managers.state.blood:add_weapon_blood(attacker_unit, NetworkLookup.attack_templates[attack_template_damage_type_id])

	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self.network_transmit:send_rpc_clients_except("rpc_weapon_blood", peer_id, attacker_unit_id, attack_template_damage_type_id)
	end
end

WeaponSystem.rpc_play_fx = function (self, channel_id, vfx_array, sfx_array, position_array)
	local world = self.world
	local World_create_particles = World.create_particles
	local vfx_lookup = NetworkLookup.effects
	local sfx_lookup = NetworkLookup.sound_events

	if #sfx_array > 0 then
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
end

WeaponSystem.hot_join_sync = function (self, peer_id)
	local channel_id = PEER_ID_TO_CHANNEL[peer_id]

	for unit, data in pairs(self._beam_particle_effects) do
		local unit_id = Managers.state.network:unit_game_object_id(unit)
		local beam_effect_id = NetworkLookup.effects[data.beam_effect_name]
		local beam_end_effect_id = NetworkLookup.effects[data.beam_end_effect_name]

		RPC.rpc_start_beam(channel_id, unit_id, beam_effect_id, beam_end_effect_id, data.range)
	end

	for unit, data in pairs(self._geiser_particle_effects) do
		local unit_id = Managers.state.network:unit_game_object_id(unit)
		local geiser_effect_id = NetworkLookup.effects[data.geiser_effect_name]
		local min_radius = data.min_radius
		local max_radius = data.max_radius
		local charge_time = data.charge_time
		local angle = data.angle
		local time_to_shoot = data.time_to_shoot - data.start_time

		RPC.rpc_start_geiser(channel_id, unit_id, geiser_effect_id, min_radius, max_radius, charge_time, angle, time_to_shoot)
	end
end

return

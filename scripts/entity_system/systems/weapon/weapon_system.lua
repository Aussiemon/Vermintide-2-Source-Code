-- chunkname: @scripts/entity_system/systems/weapon/weapon_system.lua

require("scripts/unit_extensions/weapons/weapon_unit_extension")
require("scripts/unit_extensions/weapons/husk_weapon_unit_extension")
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
	"rpc_set_stormfiend_beam",
	"rpc_start_geiser",
	"rpc_end_geiser",
	"rpc_weapon_blood",
	"rpc_play_fx",
	"rpc_change_single_weapon_state",
	"rpc_change_synced_weapon_state",
	"rpc_summon_vortex",
	"rpc_start_soul_rip",
	"rpc_stop_soul_rip",
	"rpc_soul_rip_burst",
}
local extensions = {
	"WeaponUnitExtension",
	"HuskWeaponUnitExtension",
	"AiWeaponUnitExtension",
	"SingleWeaponUnitExtension",
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
	self._soul_rip_spline_ids_lookup = {}
	self._soul_rip_particle_effects = {}
	self._chained_projectiles = {}
end

WeaponSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	extension_init_data.weapon_system = self

	local extension = WeaponSystem.super.on_add_extension(self, world, unit, extension_name, extension_init_data)

	extension_init_data.weapon_system = nil

	return extension
end

WeaponSystem.rpc_alert_enemy = function (self, channel_id, alert_unit_id, attacker_unit_id)
	local alert_unit = self.unit_storage:unit(alert_unit_id)

	if not HEALTH_ALIVE[alert_unit] then
		return
	end

	local attacker_unit = self.unit_storage:unit(attacker_unit_id)

	AiUtils.alert_unit_of_enemy(alert_unit, attacker_unit)
end

local ARGS = {
	{
		default = 0,
		name = "power_level",
		min = MIN_POWER_LEVEL,
		max = MAX_POWER_LEVEL,
	},
	{
		default = 0,
		name = "hit_target_index",
	},
	{
		default = 0,
		name = "boost_curve_multiplier",
	},
	{
		default = false,
		name = "is_critical_strike",
	},
	{
		default = true,
		name = "can_damage",
	},
	{
		default = true,
		name = "can_stagger",
	},
	{
		default = 1,
		name = "hit_ragdoll_actor",
	},
	{
		default = false,
		name = "blocking",
	},
	{
		default = false,
		name = "shield_break_procced",
	},
	{
		default = 1,
		name = "backstab_multiplier",
	},
	{
		default = false,
		name = "attacker_is_level_unit",
	},
	{
		default = false,
		name = "first_hit",
	},
	{
		default = 0,
		name = "total_hits",
	},
}

for i = 1, #ARGS do
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

	for i = 1, #ARGS do
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
			local ai_system = Managers.state.entity:system("ai_system")
			local attributes = ai_system:get_attributes(hit_unit)

			if breed and breed.show_health_bar or attributes.grudge_marked then
				Managers.state.event:trigger("boss_health_bar_register_unit", hit_unit, "damage_done")
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

	local damage_source = NetworkLookup.damage_sources[damage_source_id]
	local player_manager = Managers.player
	local attacker_player = player_manager:is_player_unit(attacker_unit)
	local hit_player = player_manager:is_player_unit(hit_unit)
	local player_hitting_player = hit_player and attacker_player

	if player_hitting_player then
		if self._player_damage_forbidden then
			return
		end

		if damage_source == "vs_ratling_gunner_gun" then
			local status_extension = ScriptUnit.extension(hit_unit, "status_system")

			if status_extension:is_grabbed_by_pack_master() then
				local dialogue_input = ScriptUnit.extension_input(attacker_unit, "dialogue_system")

				dialogue_input:trigger_dialogue_event("vs_shooting_hooked_hero")
			end
		end
	end

	local hit_zone_name = NetworkLookup.hit_zones[hit_zone_id]
	local blackboard = BLACKBOARDS[hit_unit]
	local uses_slot_system = ScriptUnit.has_extension(hit_unit, "ai_slot_system")
	local target_override_extension = ScriptUnit.has_extension(attacker_unit, "target_override_system") and ScriptUnit.extension(attacker_unit, "target_override_system") or nil
	local status_extension = ScriptUnit.has_extension(attacker_unit, "status_system") and ScriptUnit.extension(attacker_unit, "status_system") or nil
	local attacker_not_incapacitated = status_extension and not status_extension:is_disabled() or nil
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

	if player_hitting_player and blocking then
		local fatigue_type = damage_profile.fatigue_type
		local fatigue_point_costs_multiplier = 1
		local improved_block = true
		local enemy_weapon_direction = "left"
		local network_manager = Managers.state.network

		if self.is_server then
			local fatigue_type_id = NetworkLookup.fatigue_types[fatigue_type]

			network_manager.network_transmit:send_rpc_server("rpc_player_blocked_attack", hit_unit_id, fatigue_type_id, attacker_unit_id, fatigue_point_costs_multiplier, improved_block, enemy_weapon_direction, attacker_is_level_unit)
		end
	end

	local optional_predicted_damage
	local shield_breaking_hit = false

	if blackboard and blackboard.breed and blackboard.breed.is_ai then
		if blackboard.breed.use_predicted_damage_in_stagger_calculation then
			local target_settings = damage_profile.targets and damage_profile.targets[target_index] or damage_profile.default_target

			if target_settings then
				local boost_curve = BoostCurves[target_settings.boost_curve_type]

				optional_predicted_damage = DamageUtils.calculate_damage(DamageOutput, hit_unit, attacker_unit, hit_zone_name, power_level, boost_curve, boost_curve_multiplier, is_critical_strike, damage_profile, target_index, backstab_multiplier, damage_source)
			end
		end

		if hit_unit_is_enemy and uses_slot_system and target_override_extension and attacker_not_incapacitated then
			local has_override_targets = next(blackboard.override_targets)

			if has_override_targets and HEALTH_ALIVE[hit_unit] then
				local t = Managers.time:time("game")

				target_override_extension:add_to_override_targets(hit_unit, attacker_unit, blackboard, t)
			end
		end

		local unbreakable_shield = blackboard.breed.unbreakable_shield

		shield_breaking_hit = not unbreakable_shield and (damage_profile.shield_break or shield_break_procced)
	end

	local t = self.t

	DamageUtils.server_apply_hit(t, attacker_unit, hit_unit, hit_zone_name or "full", hit_position, attack_direction, hit_ragdoll_actor, damage_source, power_level, damage_profile, target_index, boost_curve_multiplier, is_critical_strike, can_damage, can_stagger, blocking, shield_breaking_hit, backstab_multiplier, first_hit, total_hits, nil, optional_predicted_damage)
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
	self:_update_chained_projectiles(t)
	self:update_synced_soul_rip_particle_effects()
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
			local hit_position, hit_unit

			if result then
				local difficulty_settings = Managers.state.difficulty:get_difficulty_settings()
				local player = Managers.player:owner(unit)
				local allow_friendly_fire = player and DamageUtils.allow_friendly_fire_ranged(difficulty_settings, player)

				for _, hit in pairs(result) do
					local potential_hit_position = hit[INDEX_POSITION]
					local hit_actor = hit[INDEX_ACTOR]
					local potential_hit_unit = Actor.unit(hit_actor)

					if potential_hit_unit ~= unit then
						local breed = Unit.get_data(potential_hit_unit, "breed")
						local valid_hit

						if breed then
							local is_enemy = DamageUtils.is_enemy(unit, potential_hit_unit)
							local node = Actor.node(hit_actor)
							local hit_zone = breed.hit_zones_lookup[node]
							local hit_zone_name = hit_zone.name

							valid_hit = (allow_friendly_fire and breed.is_player or is_enemy) and hit_zone_name ~= "afro"
						else
							valid_hit = true
						end

						if valid_hit then
							hit_position = potential_hit_position
							hit_unit = potential_hit_unit
						end

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

	for i = 1, max_steps do
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

	for unit_id, data in pairs(self._geiser_particle_effects) do
		repeat
			local unit = network_manager:game_object_or_level_unit(unit_id)

			if not ALIVE[unit] then
				if data.geiser_effect then
					World.destroy_particles(world, data.geiser_effect)
				end

				self._geiser_particle_effects[unit_id] = nil

				break
			end

			if not data.geiser_effect then
				break
			end

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
		until true
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

		if weapon_unit then
			local single_weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")

			single_weapon_extension:change_state(state)
		end
	end

	local owner_unit_id = Managers.state.unit_storage:go_id(owner_unit)
	local state_id = NetworkLookup.single_weapon_states[state]

	if self.is_server then
		self.network_transmit:send_rpc_clients_except("rpc_change_single_weapon_state", except_peer, owner_unit_id, state_id)
	elseif not received_via_network then
		self.network_transmit:send_rpc_server("rpc_change_single_weapon_state", owner_unit_id, state_id)
	end
end

WeaponSystem.rpc_change_synced_weapon_state = function (self, channel_id, owner_unit_id, state_id)
	local owner_unit = Managers.state.unit_storage:unit(owner_unit_id)

	if not owner_unit then
		return
	end

	local skip_sync = true
	local state_name = NetworkLookup.weapon_synced_states[state_id]

	if state_name == "n/a" then
		state_name = nil
	end

	local weapon_unit = self:_first_wielded_weapon_unit(owner_unit)
	local weapon_extension = ScriptUnit.has_extension(weapon_unit, "weapon_system")

	if not weapon_extension then
		return
	end

	weapon_extension:change_synced_state(state_name, skip_sync)

	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self.network_transmit:send_rpc_clients_except("rpc_change_synced_weapon_state", peer_id, owner_unit_id, state_id)
	end
end

WeaponSystem.get_synced_weapon_state = function (self, owner_unit)
	local weapon_unit = self:_first_wielded_weapon_unit(owner_unit)

	if not weapon_unit then
		return nil
	end

	local weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")

	if not weapon_extension.current_synced_state then
		return nil
	end

	return weapon_extension:current_synced_state()
end

WeaponSystem._first_wielded_weapon_unit = function (self, owner_unit)
	local inventory_extension = ScriptUnit.extension(owner_unit, "inventory_system")
	local equipment = inventory_extension:equipment()
	local weapon_unit = equipment.left_hand_wielded_unit or equipment.right_hand_wielded_unit or equipment.left_hand_wielded_unit_3p or equipment.right_hand_wielded_unit_3p

	return weapon_unit
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
			weapon_unit = weapon_unit,
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
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		if not peer_id then
			return
		end

		local side_manager = Managers.state.side
		local side = side_manager:get_side_from_player_unique_id(peer_id .. ":1")
		local geiser_effect_name = NetworkLookup.effects[geiser_effect_id]
		local geiser_data = {
			side = side,
			min_radius = min_radius,
			max_radius = max_radius,
			charge_time = charge_time,
			angle = angle,
			time_to_shoot = Managers.time:time("game"),
			start_time = Managers.time:time("game"),
			geiser_effect_name = geiser_effect_name,
		}

		self._geiser_particle_effects[unit_id] = geiser_data

		if self.is_server then
			self.network_transmit:send_rpc_side_clients_except("rpc_start_geiser", side, true, true, peer_id, unit_id, geiser_effect_id, min_radius, max_radius, charge_time, angle)

			if DEDICATED_SERVER then
				return
			end

			local local_player = Managers.player:local_player()
			local local_side = side_manager:get_side_from_player_unique_id(local_player:unique_id())

			if side_manager:is_enemy_by_side(side, local_side) then
				return
			end
		end

		local world = self.world

		geiser_data.geiser_effect = World.create_particles(world, geiser_effect_name, Vector3.zero())
		geiser_data.geiser_effect_variable = World.find_particles_variable(world, geiser_effect_name, "charge_radius")
	end
end

WeaponSystem.rpc_end_geiser = function (self, channel_id, unit_id)
	if not LEVEL_EDITOR_TEST then
		local world = self.world
		local data = self._geiser_particle_effects[unit_id]

		if data and data.geiser_effect then
			World.destroy_particles(world, data.geiser_effect)
		end

		self._geiser_particle_effects[unit_id] = nil

		if self.is_server then
			local peer_id = CHANNEL_TO_PEER_ID[channel_id]

			self.network_transmit:send_rpc_clients_except("rpc_end_geiser", peer_id, unit_id)
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
				weapon_unit = weapon_unit,
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
		local unit = self.unit_storage:unit(owner_unit_id)
		local target_unit = self.unit_storage:unit(target_unit_id)
		local bb = BLACKBOARDS[target_unit]

		if bb then
			local vext = bb.thornsister_vortex_ext

			if vext then
				vext:refresh_duration()
			else
				local storm_spawn_position = POSITION_LOOKUP[target_unit]

				if storm_spawn_position then
					self:_summon_vortex(storm_spawn_position, target_unit, unit)
				end
			end
		end
	end
end

WeaponSystem._summon_vortex = function (self, position, target_unit, owner_unit)
	local unit_name = "units/weapons/enemy/wpn_chaos_plague_vortex/wpn_chaos_plague_vortex"
	local vortex_template_name = "spirit_storm"
	local side_id = Managers.state.side.side_by_unit[owner_unit].side_id
	local UNIT_TEMPLATE_NAME = "vortex_unit"
	local extension_init_data = {
		area_damage_system = {
			vortex_template_name = vortex_template_name,
			owner_unit = owner_unit,
			side_id = side_id,
			target_unit = target_unit,
		},
	}

	Managers.state.unit_spawner:spawn_network_unit(unit_name, UNIT_TEMPLATE_NAME, extension_init_data, position, Quaternion.identity())
end

WeaponSystem.rpc_set_stormfiend_beam = function (self, channel_id, unit_id, arm_id, active)
	local unit = self.unit_storage:unit(unit_id)

	if ALIVE[unit] then
		local beam_extension = ScriptUnit.extension(unit, "ai_beam_effect_system")

		if beam_extension then
			local arm = NetworkLookup.attack_arm[arm_id]

			beam_extension:set_beam(arm, active)
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

		for i = 1, #vfx_array do
			local vfx = vfx_lookup[vfx_array[i]]
			local sfx = sfx_lookup[sfx_array[i]]
			local pos = position_array[i]

			World_create_particles(world, vfx, pos)

			local source = wwise_make_source(wwise_world, pos)

			wwise_trigger_event(wwise_world, sfx, source)
			set_source_env(sound_env_system, source, pos)
		end
	else
		for i = 1, #vfx_array do
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

	for unit_id, data in pairs(self._geiser_particle_effects) do
		local geiser_effect_id = NetworkLookup.effects[data.geiser_effect_name]
		local min_radius = data.min_radius
		local max_radius = data.max_radius
		local charge_time = data.charge_time
		local angle = data.angle
		local time_to_shoot = data.time_to_shoot - data.start_time

		RPC.rpc_start_geiser(channel_id, unit_id, geiser_effect_id, min_radius, max_radius, charge_time, angle, time_to_shoot)
	end
end

WeaponSystem.start_soul_rip = function (self, owner_unit, target_unit, target_node_id, seed, net_sync)
	local world = self.world
	local current_data = self._soul_rip_particle_effects[owner_unit]

	if current_data then
		self:cleanup_soul_rip(owner_unit)
	end

	current_data = Script.new_map(7)
	self._soul_rip_particle_effects[owner_unit] = current_data

	local owner_unit_id = self.unit_storage:go_id(owner_unit)

	current_data.owner_unit_id = owner_unit_id
	current_data.target_unit = target_unit
	current_data.target_node_id = target_node_id
	current_data.seed = seed

	local source_unit = owner_unit
	local first_person = false
	local fp_extension = ScriptUnit.has_extension(owner_unit, "first_person_system")

	if fp_extension then
		source_unit = fp_extension:get_first_person_unit()

		local anticipation_fx_name = "fx/wpnfx_necromancer_skullstaff_anticipation"
		local node = Unit.has_node(source_unit, "j_leftweaponattach") and Unit.node(source_unit, "j_leftweaponattach") or 0

		current_data.anticipation_fx = ScriptWorld.create_particles_linked(world, anticipation_fx_name, source_unit, node, "destroy")
		first_person = fp_extension:first_person_mode_active()
	end

	local hand_unit_name = first_person and "units/test_unit/cup_test" or "units/test_unit/cup_test_3p"

	current_data.weapon_unit = source_unit
	current_data.weapon_node_id = Unit.has_node(source_unit, "j_leftweaponattach") and Unit.node(source_unit, "j_leftweaponattach") or 0
	current_data.weapon_fx_unit = World.spawn_unit(world, hand_unit_name)
	current_data.target_node_id = Unit.has_node(target_unit, "j_spine") and Unit.node(target_unit, "j_spine") or 0
	current_data.target_fx_unit = World.spawn_unit(world, "units/test_unit/cup_test_3p")

	local anticipation_scale = Vector3(2, 2, 2)

	Unit.set_local_scale(current_data.weapon_fx_unit, 0, anticipation_scale)

	local target_fx_scale = Vector3(5, 5, 5)

	Unit.set_local_scale(current_data.target_fx_unit, 0, target_fx_scale)

	if net_sync then
		local target_unit_id = self.unit_storage:go_id(target_unit)

		if self.is_server then
			self.network_transmit:send_rpc_clients("rpc_start_soul_rip", owner_unit_id, target_unit_id, target_node_id, seed)
		else
			self.network_transmit:send_rpc_server("rpc_start_soul_rip", owner_unit_id, target_unit_id, target_node_id, seed)
		end
	end
end

WeaponSystem.update_synced_soul_rip_particle_effects = function (self)
	for owner_unit, data in pairs(self._soul_rip_particle_effects) do
		if not ALIVE[owner_unit] or not ALIVE[data.target_unit] then
			self:cleanup_soul_rip(owner_unit)
		else
			local position = Unit.world_position(data.target_unit, data.target_node_id)
			local directional_from = Unit.world_position(data.weapon_unit, data.weapon_node_id)
			local directional_to = position
			local dir = Vector3.normalize(directional_to - directional_from)
			local weapon_fx_unit = data.weapon_fx_unit
			local weapon_fx_pos = Unit.world_position(data.weapon_unit, data.weapon_node_id)

			Unit.set_local_position(weapon_fx_unit, 0, weapon_fx_pos)

			local weapon_fx_rot = Quaternion.look(dir)

			Unit.set_local_rotation(weapon_fx_unit, 0, weapon_fx_rot)

			local target_fx_unit = data.target_fx_unit
			local target_fx_pos = Unit.world_position(data.target_unit, data.target_node_id)

			Unit.set_local_position(target_fx_unit, 0, target_fx_pos)

			local target_fx_rot = Quaternion.look(-dir)

			Unit.set_local_rotation(target_fx_unit, 0, target_fx_rot)
		end
	end
end

WeaponSystem.stop_soul_rip = function (self, owner_unit, net_sync)
	local current_data = self._soul_rip_particle_effects[owner_unit]

	if current_data then
		self:cleanup_soul_rip(owner_unit)

		if net_sync then
			if self.is_server then
				self.network_transmit:send_rpc_clients("rpc_stop_soul_rip", current_data.owner_unit_id)
			else
				self.network_transmit:send_rpc_server("rpc_stop_soul_rip", current_data.owner_unit_id)
			end
		end
	end
end

WeaponSystem.cleanup_soul_rip = function (self, owner_unit)
	local current_data = self._soul_rip_particle_effects[owner_unit]

	if current_data then
		local world = self.world

		if current_data.anticipation_fx then
			World.destroy_particles(world, current_data.anticipation_fx)
		end

		World.destroy_unit(world, current_data.weapon_fx_unit)
		World.destroy_unit(world, current_data.target_fx_unit)

		self._soul_rip_particle_effects[owner_unit] = nil
	end
end

WeaponSystem.soul_rip_burst = function (self, owner_unit, target_unit, target_node_id, fx_name, seed, net_sync)
	local world = self.world
	local owner_unit_id = self.unit_storage:go_id(owner_unit)
	local position = Unit.world_position(target_unit, target_node_id)
	local aim_position = GameSession.game_object_field(self.game, owner_unit_id, "aim_position")
	local from_target = Vector3.normalize(aim_position - position)
	local rotation = Quaternion.look(from_target)
	local right = Quaternion.right(rotation)
	local forward = Quaternion.forward(rotation)
	local up = Vector3.up()
	local fx_id = World.create_particles(world, fx_name, position, Quaternion.look(up * 0.5 + right * 0.5))
	local spline_ids_lookup = self._soul_rip_spline_ids_lookup

	if not spline_ids_lookup[fx_name] then
		spline_ids_lookup[fx_name] = {
			World.find_particles_variable(world, fx_name, "spline_1"),
			World.find_particles_variable(world, fx_name, "spline_2"),
			World.find_particles_variable(world, fx_name, "spline_3"),
			World.find_particles_variable(world, fx_name, "spline_4"),
		}
	end

	local spline_pos_1 = position
	local spline_pos_2 = spline_pos_1 + up + right * 2
	local next_seed, rand_x, rand_y

	next_seed, rand_x = Math.next_random(seed)
	next_seed, rand_y = Math.next_random(next_seed)

	local spline_pos_3 = spline_pos_1 + forward + Vector3(rand_x * 2 - 1, rand_y * 2 - 1, 2) + right * 0.5

	next_seed, rand_x = Math.next_random(next_seed)
	next_seed, rand_y = Math.next_random(next_seed)

	local spline_pos_4 = spline_pos_1 + Vector3(rand_x * 2 - 1, rand_y * 2 - 1, 5) + right * 0.5
	local spline_ids = spline_ids_lookup[fx_name]

	World.set_particles_variable(world, fx_id, spline_ids[1], spline_pos_1)
	World.set_particles_variable(world, fx_id, spline_ids[2], spline_pos_2)
	World.set_particles_variable(world, fx_id, spline_ids[3], spline_pos_3)
	World.set_particles_variable(world, fx_id, spline_ids[4], spline_pos_4)

	if script_data.debug_soulrip then
		QuickDrawerStay:line(spline_pos_1, spline_pos_2, Color(255, 0, 0))
		QuickDrawerStay:line(spline_pos_2, spline_pos_3, Color(255, 0, 0))
		QuickDrawerStay:line(spline_pos_3, spline_pos_4, Color(255, 0, 0))
	end

	if net_sync then
		local target_unit_id = self.unit_storage:go_id(target_unit)
		local fx_name_id = NetworkLookup.effects[fx_name]

		if self.is_server then
			self.network_transmit:send_rpc_clients("rpc_soul_rip_burst", owner_unit_id, target_unit_id, target_node_id, fx_name_id, seed)
		else
			self.network_transmit:send_rpc_server("rpc_soul_rip_burst", owner_unit_id, target_unit_id, target_node_id, fx_name_id, seed)
		end
	end
end

WeaponSystem.rpc_start_soul_rip = function (self, channel_id, owner_unit_id, target_unit_id, target_node_id, seed)
	local owner_unit = self.unit_storage:unit(owner_unit_id)
	local target_unit = self.unit_storage:unit(target_unit_id)

	if not target_unit then
		return
	end

	self:start_soul_rip(owner_unit, target_unit, target_node_id, seed, false)

	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self.network_transmit:send_rpc_clients_except("rpc_start_soul_rip", peer_id, owner_unit_id, target_unit_id, target_node_id, seed)
	end
end

WeaponSystem.rpc_stop_soul_rip = function (self, channel_id, owner_unit_id)
	local owner_unit = self.unit_storage:unit(owner_unit_id)

	self:stop_soul_rip(owner_unit, false)

	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self.network_transmit:send_rpc_clients_except("rpc_stop_soul_rip", peer_id, owner_unit_id)
	end
end

WeaponSystem.rpc_soul_rip_burst = function (self, channel_id, owner_unit_id, target_unit_id, target_node_id, fx_name_id, seed)
	local target_unit = self.unit_storage:unit(target_unit_id)
	local owner_unit = self.unit_storage:unit(owner_unit_id)

	if not ALIVE[target_unit] or not ALIVE[owner_unit] then
		return
	end

	local fx_name = NetworkLookup.effects[fx_name_id]

	self:soul_rip_burst(owner_unit, target_unit, target_node_id, fx_name, seed, false)

	if self.is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self.network_transmit:send_rpc_clients_except("rpc_soul_rip_burst", peer_id, owner_unit_id, target_unit_id, target_node_id, fx_name_id, seed)
	end
end

WeaponSystem._update_chained_projectiles = function (self, t)
	local chained_projectiles = self._chained_projectiles
	local ai_broadphase = Managers.state.entity:system("ai_system").broadphase

	for projectile in pairs(chained_projectiles) do
		if not projectile.next_target_unit and t >= projectile.target_selection_t then
			local chain_next = self:_select_next_chained_projectile_target(projectile, ai_broadphase)

			if not chain_next then
				self._chained_projectiles[projectile] = nil
			end
		elseif t >= projectile.next_chain_t then
			local chain_next = self:_apply_chained_projectile_damage(projectile)

			if chain_next then
				projectile.next_target_unit = nil
				projectile.next_chain_t = t + projectile.settings.chain_delay
				projectile.target_selection_t = t + projectile.settings.target_selection_delay
			else
				self._chained_projectiles[projectile] = nil
			end
		end
	end
end

WeaponSystem.is_chained_projectile_active = function (self, projectile)
	return not not self._chained_projectiles[projectile]
end

local BROADPHASE_QUERY_TEMP = {}

WeaponSystem._select_next_chained_projectile_target = function (self, chain_data, ai_broadphase)
	local settings = chain_data.settings
	local hit_units = chain_data.hit_units
	local last_chain_pos = chain_data.last_chain_pos:unbox()
	local nearby_enemy_units = BROADPHASE_QUERY_TEMP
	local world = self.world
	local fx_spline_ids = {
		World.find_particles_variable(world, "fx/wpnfx_staff_death/curse_spirit", "spline_1"),
		World.find_particles_variable(world, "fx/wpnfx_staff_death/curse_spirit", "spline_2"),
		World.find_particles_variable(world, "fx/wpnfx_staff_death/curse_spirit", "spline_3"),
	}
	local side_manager = Managers.state.side
	local side_by_unit = side_manager.side_by_unit
	local side = side_by_unit[chain_data.owner_unit]
	local enemy_categories = side and side.enemy_broadphase_categories
	local num_enemies = Broadphase.query(ai_broadphase, last_chain_pos, settings.chain_distance, nearby_enemy_units, enemy_categories)

	for target_id = 1, num_enemies do
		local target_unit = nearby_enemy_units[target_id]

		if not hit_units[target_unit] and HEALTH_ALIVE[target_unit] then
			hit_units[target_unit] = true

			local node = Unit.has_node(target_unit, "j_spine") and Unit.node(target_unit, "j_spine") or 0
			local next_chain_pos = Unit.world_position(target_unit, node)
			local mid_offset = Vector3(math.lerp(-0.5, 0.5, math.random()), math.lerp(-0.5, 0.5, math.random()), math.lerp(-0.5, 0.5, math.random()))
			local mid_point = last_chain_pos + (next_chain_pos - last_chain_pos) / 2 + mid_offset

			self:_play_chained_projectile_fx("fx/wpnfx_staff_death/curse_spirit", fx_spline_ids, last_chain_pos, mid_point, next_chain_pos, true)

			chain_data.next_target_unit = target_unit

			return true
		end
	end

	return false
end

WeaponSystem._play_chained_projectile_fx = function (self, fx_name, fx_spline_ids, point_1, point_2, point_3)
	local fx_name_id = NetworkLookup.effects[fx_name]
	local spline_points = {
		point_1,
		point_2,
		point_3,
	}

	if self._fire_sound_event and self.first_person_extension then
		self.first_person_extension:play_hud_sound_event(self._fire_sound_event)
	end

	if self.is_server then
		Managers.state.network:rpc_play_particle_effect_spline(nil, fx_name_id, fx_spline_ids, spline_points)
	else
		Managers.state.network.network_transmit:send_rpc_server("rpc_play_particle_effect_spline", fx_name_id, fx_spline_ids, spline_points)
	end
end

WeaponSystem.try_fire_chained_projectile = function (self, chain_hit_settings, damage_source, is_critical_strike, power_level, boost_curve_multiplier, t, owner_unit, source_pos, optional_target_unit, optional_ignore_unit, target_index)
	local chain_data = {
		chain_count = 0,
		settings = chain_hit_settings,
		is_critical_strike = is_critical_strike,
		power_level = power_level,
		boost_curve_multiplier = boost_curve_multiplier,
		damage_source = damage_source,
		next_chain_t = t + (chain_hit_settings.chain_delay - chain_hit_settings.target_selection_delay),
		target_selection_t = math.huge,
		owner_unit = owner_unit,
		hit_units = {},
		last_chain_pos = Vector3Box(source_pos),
		base_target_index = target_index,
	}

	if optional_ignore_unit then
		chain_data.hit_units[optional_ignore_unit] = true
	end

	if not optional_target_unit then
		local ai_broadphase = Managers.state.entity:system("ai_system").broadphase

		optional_target_unit = self:_select_next_chained_projectile_target(chain_data, ai_broadphase)

		if not optional_target_unit then
			return
		end
	end

	chain_data.hit_units[optional_target_unit] = true
	self._chained_projectiles[chain_data] = true

	Managers.state.achievement:trigger_event("chained_projectile_fired", chain_data, owner_unit)
end

WeaponSystem._apply_chained_projectile_damage = function (self, chain_data)
	local settings = chain_data.settings
	local chain_count = chain_data.chain_count + 1
	local target_unit = chain_data.next_target_unit
	local target_index = chain_data.base_target_index + chain_count

	if HEALTH_ALIVE[target_unit] then
		local last_chain_pos = chain_data.last_chain_pos:unbox()
		local is_critical_strike = chain_data.is_critical_strike
		local power_level = chain_data.power_level
		local boost_curve_multiplier = chain_data.boost_curve_multiplier
		local damage_profile = settings.damage_profile
		local network_manager = Managers.state.network
		local attacker_unit_id = network_manager:unit_game_object_id(chain_data.owner_unit)

		if not attacker_unit_id then
			return
		end

		local damage_profile_id = NetworkLookup.damage_profiles[damage_profile]
		local target_unit_id, is_level_unit = network_manager:game_object_or_level_id(target_unit)
		local damage_source_id = NetworkLookup.damage_sources[chain_data.damage_source]
		local hit_zone_id = NetworkLookup.hit_zones.torso
		local hit_position = Unit.world_position(target_unit, 0) + Vector3.up()
		local attack_direction, attack_distance = Vector3.direction_length(hit_position - last_chain_pos)

		if is_level_unit then
			local hit_zone_name = "full"
			local target_index = 1
			local damage_source = self.item_name
			local damage_profile_template = DamageProfileTemplates[damage_profile]

			DamageUtils.damage_level_unit(target_unit, chain_data.owner_unit, hit_zone_name, power_level, self.melee_boost_curve_multiplier, is_critical_strike, damage_profile_template, target_index, attack_direction, damage_source)
		else
			self:send_rpc_attack_hit(damage_source_id, attacker_unit_id, target_unit_id, hit_zone_id, hit_position, attack_direction, damage_profile_id, "power_level", power_level, "hit_target_index", target_index, "blocking", false, "shield_break_procced", false, "boost_curve_multiplier", boost_curve_multiplier, "is_critical_strike", is_critical_strike, "can_damage", true, "can_stagger", true, "first_hit", target_index == 1)
		end

		local fx_id = NetworkLookup.effects["fx/wpnfx_staff_death/curse_spirit_impact"]
		local rotation = Quaternion.look(attack_direction)

		if self.is_server then
			Managers.state.network:rpc_play_particle_effect(nil, fx_id, NetworkConstants.invalid_game_object_id, 0, hit_position, rotation, false)
		else
			Managers.state.network.network_transmit:send_rpc_server("rpc_play_particle_effect", fx_id, NetworkConstants.invalid_game_object_id, 0, hit_position, rotation, false)
		end

		local audio_system = Managers.state.entity:system("audio_system")

		audio_system:play_audio_unit_event("Play_career_necro_passive_shadow_blood", target_unit)
	end

	if ALIVE[target_unit] and chain_count < settings.max_chain_count then
		local next_chain_pos

		if Unit.has_node(target_unit, "j_spine") then
			local node = Unit.node(target_unit, "j_spine")

			next_chain_pos = Unit.world_position(target_unit, node)
		else
			next_chain_pos = Unit.world_position(target_unit, 0) + Vector3.up() * 0.8
		end

		chain_data.chain_count = chain_count

		chain_data.last_chain_pos:store(next_chain_pos)

		return true
	else
		return false
	end
end

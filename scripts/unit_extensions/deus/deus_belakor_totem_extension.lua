require("scripts/settings/dlcs/belakor/belakor_balancing")

local STATE = {
	INITIAL = 0,
	COOLDOWN_FROM_SPAWN = 2,
	WAITING_TO_SPAWN_ENEMIES = 1,
	SPAWNING_ENEMIES = 4,
	DESPAWNED = 5,
	DECAL_SPAWNED = 3
}
local SPAWN_DECAL_UNIT_NAME = "units/decals/deus_decal_aoe_cursedchest_01"
local SPAWN_SCALE = 2
local DEFENSIVE_PUSH_RADIUS = 5
local DEFENSIVE_PUSH_SPEED = 8

local function is_totem_in_range(totem_position, player_positions, range)
	local range_sq = range * range

	for i = 1, #player_positions do
		local player_position = player_positions[i]

		if player_position and Vector3.distance_squared(totem_position, player_position) < range_sq then
			return true
		end
	end

	return false
end

local function check_if_should_spawn_enemies(totem_position, player_positions)
	return is_totem_in_range(totem_position, player_positions, BelakorBalancing.totem_spawns_distance)
end

local function is_local_player_seeing_totem(world, camera_forward, camera_position, totem_position)
	local raised_totem_position = totem_position + Vector3(0, 0, 1.5)
	local player_to_hb = Vector3.normalize(raised_totem_position - camera_position)
	local dot = Vector3.dot(camera_forward, player_to_hb)

	return dot > 0 and (not World.umbra_available(world) or World.umbra_has_line_of_sight(world, raised_totem_position, camera_position))
end

local function spawn_pre_spawn_decal(spawn_pos)
	local spawn_radius = SPAWN_SCALE
	local decal_spawn_pose = Matrix4x4.from_quaternion_position(Quaternion.identity(), spawn_pos)
	local decal_radius = spawn_radius

	Matrix4x4.set_scale(decal_spawn_pose, Vector3(decal_radius, decal_radius, decal_radius))

	local decal_unit, decal_unit_go_id = Managers.state.unit_spawner:spawn_network_unit(SPAWN_DECAL_UNIT_NAME, "network_synched_dummy_unit", nil, decal_spawn_pose)

	return decal_unit, decal_unit_go_id
end

local function totem_has_los(world, totem_position, player_positions)
	if not World.umbra_available(world) then
		return true
	end

	local up_offset = Vector3(0, 0, 1.5)

	for i = 1, #player_positions do
		local player_position = player_positions[i]

		if World.umbra_has_line_of_sight(world, player_position + up_offset, totem_position + up_offset) then
			return true
		end
	end

	return false
end

local function spawn_enemies(unit, seed, terror_event_name)
	local terror_event_id = nil
	terror_event_id = Managers.state.conflict:start_terror_event(terror_event_name, seed, unit)
	seed = Math.next_random(seed)

	return seed, terror_event_id
end

function push_players_away(unit_list, push_center, radius, push_speed)
	local angle = math.pi / 6
	local length = push_speed * math.cos(angle)
	local height = push_speed * math.sin(angle)
	local radius_sq = radius * radius

	for i = 1, #unit_list do
		local target_unit = unit_list[i]
		local target_position = POSITION_LOOKUP[target_unit]
		local towards_player = target_position - push_center

		if Vector3.length_squared(towards_player) <= radius_sq then
			local flat_towards_player = Vector3.normalize(Vector3.flat(towards_player))
			local push_velocity = flat_towards_player * length
			push_velocity.z = height

			StatusUtils.set_catapulted_network(target_unit, true, push_velocity)
		end
	end

	local effect_id = NetworkLookup.effects["fx/chr_kruber_shockwave"]
	local network_manager = Managers.state.network

	network_manager:rpc_play_particle_effect_no_rotation(nil, effect_id, NetworkConstants.invalid_game_object_id, 0, push_center, false)
end

DeusBelakorTotemExtension = class(DeusBelakorTotemExtension)

DeusBelakorTotemExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._unit = unit
	self.spawn_count = 0
	self._is_server = Managers.player.is_server
	self._world = extension_init_context.world
	local side = Managers.state.side:get_side_from_name("heroes")
	self._hero_side = side
	self._network_transmit = extension_init_context.network_transmit

	if self._is_server then
		self._current_state = STATE.INITIAL
		self._last_in_range_t = 0
	end

	self._dead = false
end

DeusBelakorTotemExtension.game_object_initialized = function (self, unit, go_id)
	self._current_state = STATE.COOLDOWN_FROM_SPAWN
	local level_seed = Managers.mechanism:get_level_seed()
	self._seed = HashUtils.fnv32_hash(go_id .. "_" .. level_seed)
end

DeusBelakorTotemExtension.extensions_ready = function (self, world, unit)
	self._health_ext = ScriptUnit.extension(unit, "health_system")
end

DeusBelakorTotemExtension.destroy = function (self)
	if ALIVE[self._decal_unit] then
		Unit.flow_event(self._decal_unit, "despawned")
		self._network_transmit:send_rpc_clients("rpc_flow_event", self._decal_unit_go_id, NetworkLookup.flow_events.despawned)

		self._decal_unit = nil
		self._decal_unit_go_id = nil
	end
end

DeusBelakorTotemExtension.is_despawned = function (self)
	return self._current_state == STATE.DESPAWNED
end

DeusBelakorTotemExtension.update = function (self, unit, input, dt, context, t)
	if not self._health_ext:is_alive() then
		if not self._dead then
			Managers.state.achievement:trigger_event("register_totem_state_change", self._unit, false)

			if self._is_server and self._decal_unit then
				Unit.flow_event(self._decal_unit, "despawned")
				self._network_transmit:send_rpc_clients("rpc_flow_event", self._decal_unit_go_id, NetworkLookup.flow_events.despawned)

				self._decal_unit = nil
				self._decal_unit_go_id = nil
			end

			local event_manager = Managers.state.event

			event_manager:trigger("tutorial_event_show_health_bar", self._unit, false)
			Unit.flow_event(unit, "lua_on_death")

			self._dead = true
		end

		return
	end

	if not self._totem_position then
		self._totem_position = Vector3Box(Unit.world_position(self._unit, 0))
	end

	local totem_position = self._totem_position:unbox()
	local player_seeing_totem = false
	local local_player_unit = Managers.player:local_player().player_unit

	if local_player_unit and ScriptUnit.has_extension(local_player_unit, "first_person_system") then
		local first_person_extension = ScriptUnit.extension(local_player_unit, "first_person_system")
		local camera_position = first_person_extension:current_position()
		local camera_rotation = first_person_extension:current_rotation()
		local camera_forward = Quaternion.forward(camera_rotation)
		player_seeing_totem = is_local_player_seeing_totem(self._world, camera_forward, camera_position, totem_position)
	end

	if self._player_seeing_totem == nil or player_seeing_totem ~= self._player_seeing_totem then
		local event_manager = Managers.state.event

		if player_seeing_totem then
			event_manager:trigger("tutorial_event_show_health_bar", self._unit, true)
		else
			event_manager:trigger("tutorial_event_show_health_bar", self._unit, false)
		end
	end

	self._player_seeing_totem = player_seeing_totem

	if self._is_server then
		local player_positions = self._hero_side.PLAYER_AND_BOT_POSITIONS

		if not self._totem_activated then
			if totem_has_los(self._world, totem_position, player_positions) then
				self._totem_activated = true

				Managers.state.achievement:trigger_event("register_totem_state_change", self._unit, true)
			end
		else
			if not self._panic_spawn_triggered and self._health_ext:current_health_percent() <= 0.5 then
				self._panic_spawn_triggered = true
				self._seed = spawn_enemies(self._unit, self._seed, "belakor_totem_panic_spawns")
			end

			local current_state = self._current_state

			if current_state == STATE.COOLDOWN_FROM_SPAWN then
				if not TerrorEventMixer.is_event_id_active_or_pending(self._totem_terror_event_id) then
					self._current_state = STATE.DECAL_SPAWNED
				end
			elseif current_state == STATE.DECAL_SPAWNED then
				if not self._spawn_decal_end_t then
					self._spawn_decal_end_t = t + BelakorBalancing.totem_decal_duration
				end

				if not self._decal_unit then
					self._decal_unit, self._decal_unit_go_id = spawn_pre_spawn_decal(totem_position)
				end

				if self._spawn_decal_end_t < t then
					Unit.flow_event(self._decal_unit, "despawned")
					self._network_transmit:send_rpc_clients("rpc_flow_event", self._decal_unit_go_id, NetworkLookup.flow_events.despawned)

					self._decal_unit = nil
					self._decal_unit_go_id = nil
					self._spawn_decal_end_t = nil

					if check_if_should_spawn_enemies(totem_position, player_positions) then
						self._current_state = STATE.SPAWNING_ENEMIES
					else
						self._current_state = STATE.WAITING_TO_SPAWN_ENEMIES
					end
				end
			elseif current_state == STATE.WAITING_TO_SPAWN_ENEMIES then
				if check_if_should_spawn_enemies(totem_position, player_positions) then
					self._current_state = STATE.DECAL_SPAWNED
				end
			elseif current_state == STATE.SPAWNING_ENEMIES then
				if BelakorBalancing.harder_spawn_interval <= self.spawn_count then
					self.spawn_count = 0
					self._seed, self._totem_terror_event_id = spawn_enemies(self._unit, self._seed, "belakor_hard_totem_spawns")
				else
					self.spawn_count = self.spawn_count + 1
					self._seed, self._totem_terror_event_id = spawn_enemies(self._unit, self._seed, "belakor_easy_totem_spawns")
				end

				self._current_state = STATE.COOLDOWN_FROM_SPAWN
			end
		end

		if is_totem_in_range(totem_position, player_positions, BelakorBalancing.totem_despawn_distance) then
			self._last_in_range_t = t
		elseif t >= self._last_in_range_t + BelakorBalancing.totem_distance_despawn_time then
			Managers.state.achievement:trigger_event("register_totem_state_change", self._unit, false)

			self._current_state = STATE.DESPAWNED
		end
	elseif not self._totem_activated then
		local player_positions = self._hero_side.PLAYER_AND_BOT_POSITIONS

		if totem_has_los(self._world, totem_position, player_positions) then
			self._totem_activated = true

			Managers.state.achievement:trigger_event("register_totem_state_change", self._unit, true)
		end
	end
end

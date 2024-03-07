-- chunkname: @scripts/entity_system/systems/ghost_mode/ghost_mode_system.lua

require("scripts/unit_extensions/default_player_unit/ghost_mode/player_unit_ghost_mode_extension")
require("scripts/unit_extensions/default_player_unit/ghost_mode/player_husk_ghost_mode_extension")

GhostModeSystem = class(GhostModeSystem, ExtensionSystemBase)

local RPCS = {
	"rpc_entered_ghost_mode",
	"rpc_left_ghost_mode",
	"rpc_allowed_to_leave_ghost_mode",
	"rpc_allowed_to_enter_ghost_mode",
	"rpc_request_leave_ghost_mode",
	"rpc_request_enter_ghost_mode",
	"rpc_set_safe_spot",
	"rpc_set_teleport_target_type",
}
local EXTENSIONS = {
	"PlayerUnitGhostModeExtension",
	"PlayerHuskGhostModeExtension",
}
local reasons_not_allowed_to_leave = table.mirror_table({
	[0] = "allowed",
	"w8_to_spawn",
	"transport",
	"start_zone",
	"los",
	"range",
	"in_safe_zone",
})
local reasons_allowed_to_enter = {
	"distance",
	"transport",
	distance = 1,
	transport = 2,
}
local teleport_target_types = {
	"disabled",
	"player",
	"safe_spot",
	disabled = 1,
	player = 2,
	safe_spot = 3,
}

GhostModeSystem.init = function (self, entity_system_creation_context, system_name)
	GhostModeSystem.super.init(self, entity_system_creation_context, system_name, EXTENSIONS)

	self._network_transmit = entity_system_creation_context.network_transmit
	self._is_server = entity_system_creation_context.is_server
	self._unit_extensions = {}

	local network_event_delegate = entity_system_creation_context.network_event_delegate

	self._network_event_delegate = network_event_delegate
	self._next_can_spawn_check = 0
	self._enter_ghost_mode_allowance_check_time = 0
	self._minimum_spawn_distance = GameModeSettings.versus.dark_pact_minimum_spawn_distance
	self._minimum_spawn_distance_vertical = GameModeSettings.versus.dark_pact_minimum_spawn_distance_vertical
	self._path_index = 0
	self._safe_spot = nil
	self._enemy_players_using_transport = false
	self._teleport_target_type = "disabled"

	network_event_delegate:register(self, unpack(RPCS))

	self._active = false
end

GhostModeSystem.destroy = function (self)
	self._network_event_delegate:unregister(self)

	self._network_event_delegate = nil
end

GhostModeSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local extension = GhostModeSystem.super.on_add_extension(self, world, unit, extension_name, extension_init_data)

	self._unit_extensions[unit] = extension

	extension:set_teleport_target_type(self._teleport_target_type)
	extension:set_safe_spot(self._safe_spot)

	return extension
end

GhostModeSystem.on_remove_extension = function (self, unit, extension_name)
	GhostModeSystem.super.on_remove_extension(self, unit, extension_name)

	self._unit_extensions[unit] = nil
end

GhostModeSystem.set_active = function (self, active)
	self._active = active
end

GhostModeSystem.update = function (self, context, t)
	if self._is_server and self._active then
		self:_update_safe_spot()
		self:_update_enemy_players_using_transport()
		self:_update_leave_ghost_mode_allowance(t)
		self:_update_enter_ghost_mode_allowance(t)
	end

	GhostModeSystem.super.update(self, context, t)
end

GhostModeSystem.in_line_of_sight_of_enemies = function (self, unit, enemy_positions, physics_world)
	local pos = POSITION_LOOKUP[unit]
	local z_offset = Vector3(0, 0, 1)
	local num_enemy_positions = #enemy_positions

	for i = 1, num_enemy_positions do
		local target_pos = enemy_positions[i]
		local in_los = PerceptionUtils.is_position_in_line_of_sight(nil, pos + z_offset, target_pos + z_offset, physics_world)

		if in_los then
			return true
		end
	end

	return false
end

GhostModeSystem.in_range_of_enemies = function (self, unit)
	local side_manager = Managers.state.side
	local side = side_manager.side_by_unit[unit]
	local enemy_positions = side.ENEMY_PLAYER_AND_BOT_POSITIONS
	local in_range = false
	local unit_position = POSITION_LOOKUP[unit]
	local min_dist = self._minimum_spawn_distance
	local min_dist_vertical = self._minimum_spawn_distance_vertical
	local min_dist_sq = min_dist^2

	for i = 1, #enemy_positions do
		local enemy_position = enemy_positions[i]
		local diff = enemy_position - unit_position
		local height_diff = math.abs(diff[3])

		if height_diff < min_dist_vertical then
			local dist_sq = Vector3.length_squared(Vector3.flat(diff))

			if dist_sq < min_dist_sq then
				in_range = true

				break
			end
		end
	end

	return in_range
end

GhostModeSystem.in_safe_zone = function (self, unit)
	local in_safe_zone
	local level = LevelHelper:current_level(Managers.world:world("level_world"))
	local versus_safe_zone_name = "versus_activator"

	if Level.has_volume(level, versus_safe_zone_name) then
		local pos = POSITION_LOOKUP[unit]

		in_safe_zone = Level.is_point_inside_volume(level, versus_safe_zone_name, pos)
	end

	return in_safe_zone
end

local IS_LOCAL_CALL = "is_local_call"

GhostModeSystem._update_safe_spot = function (self)
	local conflict_director = Managers.state.conflict
	local current_path_index = conflict_director.main_path_info.current_path_index

	if current_path_index > self._path_index then
		self._path_index = current_path_index

		local next_path_index = current_path_index + 1
		local main_paths = conflict_director.main_path_info.main_paths

		if not main_paths then
			return
		end

		local next_main_path = main_paths[next_path_index]

		if not next_main_path then
			return
		end

		local safe_spot = next_main_path.nodes[1]:unbox()

		self:rpc_set_safe_spot(IS_LOCAL_CALL, safe_spot)
		self._network_transmit:send_rpc_clients("rpc_set_safe_spot", safe_spot)
	end
end

GhostModeSystem._update_enemy_players_using_transport = function (self)
	local unit_extensions = self._unit_extensions
	local side_manager = Managers.state.side
	local enemy_players_using_transport = self._enemy_players_using_transport

	for unit, _ in pairs(unit_extensions) do
		if Unit.alive(unit) then
			local side = side_manager.side_by_unit[unit]
			local enemy_units = side.ENEMY_PLAYER_UNITS

			for _, unit in ipairs(enemy_units) do
				if Unit.alive(unit) then
					local status_extension = ScriptUnit.extension(unit, "status_system")

					if not status_extension:is_disabled() then
						enemy_players_using_transport = status_extension:is_using_transport()

						break
					end

					enemy_players_using_transport = false

					if false then
						enemy_players_using_transport = true
					end

					break
				end
			end

			break
		end
	end

	if enemy_players_using_transport ~= self._enemy_players_using_transport then
		self._enemy_players_using_transport = enemy_players_using_transport

		local teleport_target_type = enemy_players_using_transport and "safe_spot" or "player"

		if enemy_players_using_transport then
			printf("[GhostModeSystem] Enemy players using transport")
		else
			printf("[GhostModeSystem] Enemy players not using transport")
		end

		local teleport_target_type_id = teleport_target_types[teleport_target_type]

		self:rpc_set_teleport_target_type(IS_LOCAL_CALL, teleport_target_type_id)
		self._network_transmit:send_rpc_clients("rpc_set_teleport_target_type", teleport_target_type_id)
	end
end

GhostModeSystem._update_leave_ghost_mode_allowance = function (self, t)
	if t < self._next_can_spawn_check then
		return
	end

	local unit_extensions = self._unit_extensions
	local unit = next(unit_extensions, self._last_unit) or next(unit_extensions)

	self._last_unit = unit

	if not unit then
		self._next_can_spawn_check = t + 0.3

		return
	end

	local extension = unit_extensions[unit]

	if extension:is_in_ghost_mode() then
		local side_manager = Managers.state.side
		local side = side_manager.side_by_unit[unit]
		local enemy_positions = side.ENEMY_PLAYER_AND_BOT_POSITIONS
		local physics_world = World.get_data(self.world, "physics_world")
		local in_los = self:in_line_of_sight_of_enemies(unit, enemy_positions, physics_world)
		local in_range = self:in_range_of_enemies(unit)
		local prev_round_started = self._prev_round_started
		local round_started = Managers.state.game_mode:is_round_started()

		self._prev_round_started = round_started

		local in_safe_zone = self:in_safe_zone(unit)
		local always_allow_leave_ghost_mode = script_data.always_allow_leave_ghost_mode or Development.parameter("disable_ghost_mode")
		local update_teleport_target_type = prev_round_started ~= round_started

		if update_teleport_target_type then
			local tp_to_player = round_started
			local teleport_target_type_id = tp_to_player and teleport_target_types.player or teleport_target_types.disabled

			self._network_transmit:send_rpc_all("rpc_set_teleport_target_type", teleport_target_type_id)
		end

		local _, reason_prev = extension:allowed_to_leave()
		local owner = Managers.player:owner(unit)
		local status = Managers.party:get_player_status(owner.peer_id, owner:local_player_id())
		local spawn_timer = status and status.game_mode_data.spawn_timer or 0
		local enemy_players_using_transport = self._enemy_players_using_transport
		local reason = "allowed"

		if enemy_players_using_transport then
			reason = "transport"
		elseif in_los then
			reason = "los"
		elseif in_range then
			reason = "range"
		elseif spawn_timer - t > 0 then
			reason = "w8_to_spawn"
		elseif not round_started then
			reason = "start_zone"
		elseif in_safe_zone then
			reason = "in_safe_zone"
		end

		if reason ~= reason_prev then
			local allowed_to_leave = reason == "allowed"

			extension:set_allowed_to_leave(allowed_to_leave, reason)

			local unit_go_id = self.unit_storage:go_id(unit)
			local update_teleport_target_type = reason_prev == "start_zone"

			self._network_transmit:send_rpc_clients("rpc_allowed_to_leave_ghost_mode", unit_go_id, allowed_to_leave, reasons_not_allowed_to_leave[reason])
		end
	end
end

local allowed_enter_ghost_dist = 30

GhostModeSystem._update_enter_ghost_mode_allowance = function (self, t)
	if t < self._enter_ghost_mode_allowance_check_time then
		return
	end

	self._enter_ghost_mode_allowance_check_time = t + 0.25

	local unit_extensions = self._unit_extensions
	local main_path_player_info = Managers.state.conflict.main_path_player_info
	local enemy_players_using_transport = self._enemy_players_using_transport

	for unit, extension in pairs(unit_extensions) do
		if not extension:is_in_ghost_mode() then
			local my_pos = POSITION_LOOKUP[unit]
			local far_away_enough = true
			local side_manager = Managers.state.side
			local side = side_manager.side_by_unit[unit]
			local enemy_positions = side.ENEMY_PLAYER_AND_BOT_POSITIONS
			local num_enemy_positions = #enemy_positions

			for i = 1, num_enemy_positions do
				local target_pos = enemy_positions[i]
				local distance_to_hero = Vector3.distance(target_pos, my_pos)

				if distance_to_hero < allowed_enter_ghost_dist then
					far_away_enough = false

					break
				end
			end

			local status_extension = ScriptUnit.extension(unit, "status_system")
			local unit_alive = not not HEALTH_ALIVE[unit] and not status_extension:is_dead()
			local allowed_to_enter = unit_alive and (far_away_enough or enemy_players_using_transport) and extension:allowed_to_leave()
			local allowed_to_enter_prev, reason_allowed_to_enter_prev = extension:allowed_to_enter()
			local reason = far_away_enough and "distance" or enemy_players_using_transport and "transport"

			if allowed_to_enter ~= allowed_to_enter_prev or not allowed_to_enter and reason ~= reason_allowed_to_enter_prev then
				extension:set_allowed_to_enter(allowed_to_enter, reason)

				local unit_go_id = self.unit_storage:go_id(unit)
				local reason_id = reason and reasons_allowed_to_enter[reason] or 0

				self._network_transmit:send_rpc_clients("rpc_allowed_to_enter_ghost_mode", unit_go_id, allowed_to_enter, reason_id)
			end
		end
	end
end

GhostModeSystem.rpc_entered_ghost_mode = function (self, channel_id, unit_go_id)
	local unit = self.unit_storage:unit(unit_go_id)
	local ignore_send = false
	local teleport_player = true
	local ghost_mode_extension = ScriptUnit.extension(unit, "ghost_mode_system")

	ghost_mode_extension:enter_ghost_mode(ignore_send, teleport_player)

	if self._is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self._network_transmit:send_rpc_clients_except("rpc_entered_ghost_mode", peer_id, unit_go_id)
	end
end

GhostModeSystem.rpc_left_ghost_mode = function (self, channel_id, unit_go_id)
	local unit = self.unit_storage:unit(unit_go_id)
	local ghost_mode_extension = ScriptUnit.extension(unit, "ghost_mode_system")

	ghost_mode_extension:leave_ghost_mode()

	if self._is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self._network_transmit:send_rpc_clients_except("rpc_left_ghost_mode", peer_id, unit_go_id)
	end
end

GhostModeSystem.rpc_allowed_to_leave_ghost_mode = function (self, channel_id, unit_go_id, allowed_to_leave, reason_id)
	fassert(not self._is_server, "Should only be called on the clients")

	local unit = self.unit_storage:unit(unit_go_id)

	if not Unit.alive(unit) then
		return
	end

	local extension = ScriptUnit.extension(unit, "ghost_mode_system")
	local reason = reason_id > 0 and reasons_not_allowed_to_leave[reason_id]

	extension:set_allowed_to_leave(allowed_to_leave, reason)
end

GhostModeSystem.rpc_allowed_to_enter_ghost_mode = function (self, channel_id, unit_go_id, allowed_to_enter, reason_id)
	fassert(not self._is_server, "Should only be called on the clients")

	local unit = self.unit_storage:unit(unit_go_id)

	if not Unit.alive(unit) then
		return
	end

	local extension = ScriptUnit.extension(unit, "ghost_mode_system")
	local reason = reason_id > 0 and reasons_allowed_to_enter[reason_id]

	extension:set_allowed_to_enter(allowed_to_enter, reason)
end

GhostModeSystem.rpc_request_enter_ghost_mode = function (self, channel_id, unit_go_id)
	fassert(self._is_server, "Should only be called on server")

	local unit = self.unit_storage:unit(unit_go_id)
	local extension = ScriptUnit.extension(unit, "ghost_mode_system")

	if extension:is_in_ghost_mode() or not extension:allowed_to_enter() then
		return
	end

	local ignore_send = false
	local teleport_player = true

	extension:enter_ghost_mode(ignore_send, teleport_player)
	self._network_transmit:send_rpc_clients("rpc_entered_ghost_mode", unit_go_id)
end

GhostModeSystem.rpc_request_leave_ghost_mode = function (self, channel_id, unit_go_id, force_leave)
	fassert(self._is_server, "Should only be called on server")

	local unit = self.unit_storage:unit(unit_go_id)
	local extension = ScriptUnit.extension(unit, "ghost_mode_system")

	if not force_leave and (not extension:is_in_ghost_mode() or not extension:allowed_to_leave()) then
		return
	end

	extension:leave_ghost_mode()
	self._network_transmit:send_rpc_clients("rpc_left_ghost_mode", unit_go_id)
end

GhostModeSystem.rpc_set_safe_spot = function (self, sender, safe_spot_position)
	self._safe_spot = Vector3Box(safe_spot_position)

	local player = Managers.player:local_player()
	local unit = player and player.player_unit

	if not unit then
		return
	end

	local extension = self._unit_extensions[unit]

	if not extension then
		return
	end

	extension:set_safe_spot(self._safe_spot)
end

GhostModeSystem.rpc_set_teleport_target_type = function (self, sender, teleport_target_type_id)
	self._teleport_target_type = teleport_target_types[teleport_target_type_id]

	local player = Managers.player:local_player()
	local unit = player and player.player_unit

	if not unit then
		return
	end

	local extension = self._unit_extensions[unit]

	if not extension then
		return
	end

	extension:set_teleport_target_type(self._teleport_target_type)
end

GhostModeSystem.set_sweep_actors = function (unit, breed, enable)
	if enable then
		Unit.enable_proximity_unit(unit)
	else
		Unit.disable_proximity_unit(unit)
	end

	local hit_zones = breed.hit_zones

	for hit_zone_name, hit_zone in pairs(hit_zones) do
		local actor_names = hit_zone.actors

		if hit_zone_name ~= "afro" then
			for i = 1, #actor_names do
				local actor_name = actor_names[i]
				local actor = Unit.actor(unit, actor_name)

				Actor.set_scene_query_enabled(actor, enable)
			end
		end
	end
end

GhostModeSystem.test_actors = function (unit, breed)
	local hit_zones = breed.hit_zones

	for hit_zone_name, hit_zone in pairs(hit_zones) do
		local actor_names = hit_zone.actors

		if hit_zone_name ~= "afro" then
			for i = 1, #actor_names do
				local actor_name = actor_names[i]
				local actor = Unit.actor(unit, actor_name)

				if Actor.is_scene_query_enabled(actor) then
					Debug.text("Actor %s is ON", actor_name)
				end
			end
		end
	end
end

GhostModeSystem.hot_join_sync = function (self, sender)
	if not self._active then
		return
	end

	local teleport_target_type_id = teleport_target_types[self._teleport_target_type]

	self._network_transmit:send_rpc("rpc_set_teleport_target_type", sender, teleport_target_type_id)

	if self._safe_spot then
		self._network_transmit:send_rpc("rpc_set_safe_spot", sender, self._safe_spot:unbox())
	end

	local extensions = self._unit_extensions

	for unit, extension in pairs(extensions) do
		if not extension:is_in_ghost_mode() then
			local unit_go_id = self.unit_storage:go_id(unit)

			self._network_transmit:send_rpc("rpc_left_ghost_mode", sender, unit_go_id)
		end
	end
end

-- chunkname: @scripts/entity_system/systems/ghost_mode/ghost_mode_system.lua

require("scripts/unit_extensions/default_player_unit/ghost_mode/player_unit_ghost_mode_extension")
require("scripts/unit_extensions/default_player_unit/ghost_mode/player_husk_ghost_mode_extension")

GhostModeSystem = class(GhostModeSystem, ExtensionSystemBase)

local RPCS = {
	"rpc_entered_ghost_mode",
	"rpc_left_ghost_mode",
	"rpc_set_safe_spot",
}
local EXTENSIONS = {
	"PlayerUnitGhostModeExtension",
	"PlayerHuskGhostModeExtension",
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
	self._path_index = 0
	self._safe_spot = nil

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
	end

	GhostModeSystem.super.update(self, context, t)
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

GhostModeSystem.rpc_entered_ghost_mode = function (self, channel_id, unit_go_id)
	local unit = self.unit_storage:unit(unit_go_id)

	if not ALIVE[unit] then
		return
	end

	if CHANNEL_TO_PEER_ID[channel_id] ~= Network.peer_id() then
		local husk_ghost_mode_extension = ScriptUnit.extension(unit, "ghost_mode_system")

		husk_ghost_mode_extension:husk_enter_ghost_mode()
	end

	if self._is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self._network_transmit:send_rpc_clients_except("rpc_entered_ghost_mode", peer_id, unit_go_id)
	end
end

GhostModeSystem.rpc_left_ghost_mode = function (self, channel_id, unit_go_id)
	local unit = self.unit_storage:unit(unit_go_id)

	if not ALIVE[unit] then
		return
	end

	if CHANNEL_TO_PEER_ID[channel_id] ~= Network.peer_id() then
		local ghost_mode_extension = ScriptUnit.extension(unit, "ghost_mode_system")

		ghost_mode_extension:husk_leave_ghost_mode()
	end

	if self._is_server then
		local peer_id = CHANNEL_TO_PEER_ID[channel_id]

		self._network_transmit:send_rpc_clients_except("rpc_left_ghost_mode", peer_id, unit_go_id)
	end
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

	if self._safe_spot then
		self._network_transmit:send_rpc("rpc_set_safe_spot", sender, self._safe_spot:unbox())
	end

	local extensions = self._unit_extensions

	for unit, extension in pairs(extensions) do
		local unit_go_id = self.unit_storage:go_id(unit)

		if unit_go_id then
			if extension:is_in_ghost_mode() then
				self._network_transmit:send_rpc("rpc_entered_ghost_mode", sender, unit_go_id)
			else
				self._network_transmit:send_rpc("rpc_left_ghost_mode", sender, unit_go_id)
			end
		end
	end
end

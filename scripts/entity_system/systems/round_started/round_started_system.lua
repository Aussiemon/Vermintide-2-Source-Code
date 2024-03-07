﻿-- chunkname: @scripts/entity_system/systems/round_started/round_started_system.lua

RoundStartedSystem = class(RoundStartedSystem, ExtensionSystemBase)

local extensions = {
	"RoundStartedExtension",
}
local RPCS = {
	"rpc_round_started",
}

RoundStartedExtension = class(RoundStartedExtension)

RoundStartedExtension.init = function (self)
	return
end

RoundStartedExtension.destroy = function (self)
	return
end

RoundStartedSystem.init = function (self, context, system_name)
	local entity_manager = context.entity_manager

	entity_manager:register_system(self, system_name, extensions)

	self._is_server = context.is_server
	self._world = context.world
	self._network_event_delegate = context.network_event_delegate

	self._network_event_delegate:register(self, unpack(RPCS))

	self._start_area = "start_area"
	self._round_started = false
	self._player_spawned = false
	self._units = {}
	self._player_moved_positions = {}
end

RoundStartedSystem.destroy = function (self)
	self._network_event_delegate:unregister(self)
end

RoundStartedSystem.set_start_area = function (self, volume_name)
	local level = LevelHelper:current_level(self._world)
	local level_name = LevelHelper:current_level_settings(self._world).level_name

	self._start_area = volume_name
end

RoundStartedSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	ScriptUnit.add_extension(nil, unit, "RoundStartedExtension", self.NAME, extension_init_data)

	local ext = ScriptUnit.extension(unit, self.NAME)

	self._units[unit] = ext

	return ext
end

RoundStartedSystem.on_remove_extension = function (self, unit, extension_name)
	ScriptUnit.remove_extension(unit, self.NAME)

	self._units[unit] = nil
end

RoundStartedSystem.hot_join_sync = function (self, sender, player)
	return
end

RoundStartedSystem.update = function (self, context, t)
	if self._round_started then
		return
	end

	self:_update_player_moved()

	if not self._is_server then
		return
	end

	local started = self:_players_left_start_area()

	if started or self._force_start_round then
		Managers.state.game_mode:round_started()

		local level_settings = LevelHelper:current_level_settings()
		local score_type = level_settings.score_type

		if score_type then
			local start_data = {
				start_time = t,
			}
			local leaderboard_system = Managers.state.entity:system("leaderboard_system")

			leaderboard_system:round_started(score_type, start_data)
		end

		self:_on_round_started()
	end
end

RoundStartedSystem._players_left_start_area = function (self)
	local checkpoint_data = Managers.state.spawn:checkpoint_data()
	local volume_name = checkpoint_data and checkpoint_data.safe_zone_volume_name or self._start_area
	local level = LevelHelper:current_level(self._world)

	if not Level.has_volume(level, volume_name) then
		if script_data.debug_level then
			Application.warning("Level is missing start area.")
		end

		return self._player_spawned
	end

	for unit, _ in pairs(self._units) do
		local pos = POSITION_LOOKUP[unit]

		if not Level.is_point_inside_volume(level, volume_name, pos) then
			return true
		end
	end

	return false
end

RoundStartedSystem.player_spawned = function (self)
	self._player_spawned = true
end

RoundStartedSystem.player_has_moved = function (self)
	return self._player_moved
end

RoundStartedSystem.round_has_started = function (self)
	return self._round_started
end

RoundStartedSystem._update_player_moved = function (self)
	if self._player_moved then
		return true
	end

	local player_start_positions = self._player_moved_positions
	local move_dist = 2
	local players = Managers.player:human_players()

	for unique_id, player in pairs(players) do
		local player_unit = player.player_unit
		local player_pos = POSITION_LOOKUP[player_unit]

		if player_pos then
			player_start_positions[player_unit] = player_start_positions[player_unit] or Vector3Box(player_pos)

			if Vector3.distance_squared(player_pos, player_start_positions[player_unit]:unbox()) > move_dist^2 then
				self._player_moved = true

				return true
			end
		end
	end
end

RoundStartedSystem._on_round_started = function (self)
	self._round_started = true
	self._player_moved = true

	Managers.state.achievement:trigger_event("on_round_started")

	if self._is_server then
		Managers.state.network.network_transmit:send_rpc_clients("rpc_round_started")
	end
end

RoundStartedSystem.rpc_round_started = function (self)
	self:_on_round_started()
end

RoundStartedSystem.force_start_round = function (self)
	self._force_start_round = true
end

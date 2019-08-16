require("scripts/settings/player_unit_damage_settings")
require("scripts/managers/player/bulldozer_player")
require("scripts/managers/player/remote_player")
require("scripts/managers/player/player_bot")
require("scripts/managers/player/player_sync_data")

PlayerManager = class(PlayerManager)
PlayerManager.MAX_PLAYERS = 4

PlayerManager.init = function (self)
	self._players = {}
	self._players_by_peer = {}
	self._num_human_players = 0
	self._human_players = {}
	self._unit_owners = {}
	self._ui_id_increment = 0
end

local RPCS = {
	"rpc_to_client_spawn_player"
}

PlayerManager._unique_id = function (self, peer_id, local_player_id)
	return peer_id .. ":" .. local_player_id
end

PlayerManager.set_is_server = function (self, is_server, network_event_delegate, network_manager)
	self.is_server = is_server

	network_event_delegate:register(self, unpack(RPCS))

	self.network_event_delegate = network_event_delegate
	self.network_manager = network_manager

	for peer_id, player in pairs(self._players) do
		if not player.remote then
			player.is_server = is_server
		end

		player.network_manager = network_manager
	end
end

PlayerManager.set_statistics_db = function (self, statistics_db)
	self._statistics_db = statistics_db
end

PlayerManager.statistics_db = function (self)
	return self._statistics_db
end

PlayerManager.rpc_to_client_spawn_player = function (self, sender, local_player_id, profile_index, career_index, position, rotation, is_initial_spawn, ammo_melee_percent_int, ammo_ranged_percent_int, ability_cooldown_percent_int, healthkit_id, potion_id, grenade_id)
	if script_data.network_debug_connections then
		printf("PlayerManager:rpc_to_client_spawn_player(%s, %s, %s, %s)", tostring(sender), tostring(profile_index), tostring(position), tostring(rotation))
	end

	if self.is_server and not Managers.state.network:in_game_session() then
		return
	end

	local ammo_melee = ammo_melee_percent_int * 0.01
	local ammo_ranged = ammo_ranged_percent_int * 0.01
	local player = self:player(Network.peer_id(), local_player_id)

	player:set_profile_index(profile_index)
	player:set_career_index(career_index)
	player:spawn(position, rotation, is_initial_spawn, ammo_melee, ammo_ranged, NetworkLookup.item_names[healthkit_id], NetworkLookup.item_names[potion_id], NetworkLookup.item_names[grenade_id], ability_cooldown_percent_int)
end

PlayerManager.exit_ingame = function (self)
	if self.is_server then
		for _, player in pairs(self._players) do
			if player.remote then
				self:remove_player(player:network_id(), player:local_player_id())
			end
		end
	end

	self.network_event_delegate:unregister(self)

	self.network_event_delegate = nil
	self.is_server = nil
	self.network_manager = nil

	for _, player in pairs(self._players) do
		player.network_manager = nil
	end
end

PlayerManager.assign_unit_ownership = function (self, unit, player, is_player_unit)
	if script_data.network_debug_connections then
		printf("PlayerManager:assign_unit_ownership %s %s %i", player:name(), tostring(player:network_id()), player:local_player_id())
	end

	self._unit_owners[unit] = player
	player.owned_units[unit] = unit

	if is_player_unit then
		player:set_player_unit(unit)

		local party_manager = Managers.party
		local party = party_manager:get_party_from_player_id(player:network_id(), player:local_player_id())
		local side_manager = Managers.state.side
		local side = side_manager.side_by_party[party]

		side_manager:add_player_unit_to_side(unit, side.side_id)
	end

	Managers.state.unit_spawner:add_destroy_listener(unit, "player_manager", callback(self, "unit_destroy_callback"))
end

PlayerManager.unit_destroy_callback = function (self, unit)
	self:relinquish_unit_ownership(unit)
end

PlayerManager.unit_owner = function (self, unit)
	return self._unit_owners[unit]
end

PlayerManager.player_from_unique_id = function (self, unique_id)
	return self._players[unique_id]
end

PlayerManager.player_from_stats_id = function (self, stats_id)
	return self:player_from_unique_id(stats_id)
end

PlayerManager.player_from_game_object_id = function (self, game_object_id)
	for _, player in pairs(self._players) do
		if player.game_object_id == game_object_id then
			return player
		end
	end
end

PlayerManager.relinquish_unit_ownership = function (self, unit)
	fassert(self._unit_owners[unit], "[PlayerManager:relinquish_unit_ownership] Unit %s ownership cannot be relinquished, not owned.", unit)

	local unit_owner = self._unit_owners[unit]

	if unit == unit_owner.player_unit then
		Managers.state.side:remove_player_unit_from_side(unit)

		unit_owner.player_unit = nil
	end

	self._unit_owners[unit] = nil
	unit_owner.owned_units[unit] = nil

	Managers.state.unit_spawner:remove_destroy_listener(unit, "player_manager")
end

PlayerManager.add_player = function (self, input_source, viewport_name, viewport_world_name, local_player_id)
	if script_data.network_debug_connections then
		printf("PlayerManager:add_player %s", tostring(viewport_name))
	end

	local peer_id = Network.peer_id()
	local unique_id = self:_unique_id(peer_id, local_player_id)
	local ui_id = self:_create_ui_id()
	local backend_id = Managers.backend:player_id()
	local player = BulldozerPlayer:new(self.network_manager, input_source, viewport_name, viewport_world_name, self.is_server, local_player_id, unique_id, ui_id, backend_id)
	self._players[unique_id] = player
	self._num_human_players = self._num_human_players + 1
	self._human_players[unique_id] = player
	local player_table = self._players_by_peer
	player_table[peer_id] = player_table[peer_id] or {}
	player_table[peer_id][local_player_id] = player
	local stats = Managers.backend:get_interface("statistics"):get_stats()

	self._statistics_db:register(player:stats_id(), "player", stats)
	Managers.party:register_player(player, unique_id)

	return player
end

PlayerManager.add_remote_player = function (self, peer_id, player_controlled, local_player_id, clan_tag)
	if script_data.network_debug_connections then
		printf("PlayerManager:add_remote_player %s", tostring(peer_id))
	end

	local unique_id = self:_unique_id(peer_id, local_player_id)
	local ui_id = self:_create_ui_id()
	local player = RemotePlayer:new(self.network_manager, peer_id, player_controlled, self.is_server, local_player_id, unique_id, clan_tag, ui_id)
	self._players[unique_id] = player

	if player_controlled then
		self._num_human_players = self._num_human_players + 1
		self._human_players[unique_id] = player
	end

	local player_table = self._players_by_peer
	player_table[peer_id] = player_table[peer_id] or {}
	player_table[peer_id][local_player_id] = player

	self._statistics_db:register(player:stats_id(), "player")
	visual_assert(table.size(self._players) <= 4, "Too many players after remote player added.")
	Managers.party:register_player(player, unique_id)

	return player
end

PlayerManager.player_exists = function (self, peer_id, local_player_id)
	local peer_table = self._players_by_peer[peer_id]

	return (peer_table and peer_table[local_player_id or 1]) or false
end

PlayerManager.owner = function (self, unit)
	return self._unit_owners[unit]
end

PlayerManager.is_player_unit = function (self, unit)
	local owner = self._unit_owners[unit]

	if owner and owner.player_unit == unit then
		return true
	end

	return false
end

PlayerManager._create_ui_id = function (self)
	self._ui_id_increment = self._ui_id_increment % 1000 + 1

	return self._ui_id_increment
end

PlayerManager.add_bot_player = function (self, player_name, bot_player_peer_id, bot_profile_index, profile_index, career_index, local_player_id)
	local peer_id = Network.peer_id()
	local unique_id = self:_unique_id(peer_id, local_player_id)
	local ui_id = self:_create_ui_id()
	local player = PlayerBot:new(player_name, bot_profile_index, self.is_server, profile_index, career_index, local_player_id, unique_id, ui_id)
	self._players[unique_id] = player
	local player_table = self._players_by_peer
	player_table[peer_id] = player_table[peer_id] or {}
	player_table[peer_id][local_player_id] = player
	local stats_id = player:stats_id()

	self._statistics_db:register(stats_id, "player")
	Managers.party:register_player(player, unique_id)

	return player
end

PlayerManager.clear_all_players = function (self)
	for unique_id, player in pairs(self._players) do
		self:remove_player(player:network_id(), player:local_player_id())
	end
end

PlayerManager.remove_all_players_from_peer = function (self, peer_id)
	local peer_table = self._players_by_peer[peer_id]

	if peer_table then
		for local_player_id, player in pairs(peer_table) do
			self:remove_player(peer_id, local_player_id)
		end
	end
end

PlayerManager.set_stats_backend = function (self, player)
	if player.local_player then
		local backend_stats = {}

		self._statistics_db:generate_backend_stats(player:stats_id(), backend_stats)
		Managers.backend:set_stats(backend_stats)
	end
end

PlayerManager.remove_player = function (self, peer_id, local_player_id)
	if script_data.network_debug_connections then
		printf("PlayerManager:remove_player peer_id=%s %i", tostring(peer_id), local_player_id or -1)
	end

	local unique_id = self:_unique_id(peer_id, local_player_id)
	local player = self._players[unique_id]

	if player then
		local owned_units = player.owned_units

		for unit, _ in pairs(owned_units) do
			self:relinquish_unit_ownership(unit)
		end

		self._players[unique_id] = nil
		self._human_players[unique_id] = nil
		local peer_table = self._players_by_peer[peer_id]
		peer_table[local_player_id] = nil

		if table.is_empty(peer_table) then
			self._players_by_peer[peer_id] = nil
		end

		if player:is_player_controlled() then
			self._num_human_players = self._num_human_players - 1
		end

		self._statistics_db:unregister(player:stats_id())
		player:destroy()
	end
end

PlayerManager.player = function (self, peer_id, local_player_id)
	fassert(peer_id and local_player_id, "Required peer id and local player id.")

	return self:player_from_peer_id(peer_id, local_player_id)
end

PlayerManager.player_from_peer_id = function (self, peer_id, local_player_id)
	local player_table = self._players_by_peer[peer_id]

	if not player_table then
		return nil
	end

	return player_table[local_player_id or 1]
end

PlayerManager.players_at_peer = function (self, peer_id)
	return self._players_by_peer[peer_id]
end

PlayerManager.human_players = function (self)
	return self._human_players
end

PlayerManager.human_and_bot_players = function (self)
	return self._players
end

PlayerManager.players = function (self)
	return self._players
end

PlayerManager.num_human_players = function (self)
	return self._num_human_players
end

PlayerManager.num_alive_allies = function (self, player)
	local players = Managers.player:human_and_bot_players()
	local num_alive = 0

	for _, player_ally in pairs(players) do
		if player ~= player_ally then
			local unit = player_ally.player_unit

			if Unit.alive(unit) then
				local status_extension = ScriptUnit.extension(unit, "status_system")

				if not status_extension:is_disabled() then
					num_alive = num_alive + 1
				end
			end
		end
	end

	return num_alive
end

PlayerManager.server_player = function (self)
	local network_manager = Managers.state.network
	local network_transmit = network_manager.network_transmit
	local server_peer_id = network_transmit.server_peer_id
	local game_owner_peer_id = server_peer_id or network_transmit.peer_id

	return self:player_from_peer_id(game_owner_peer_id, 1)
end

PlayerManager.party_leader_player = function (self)
	if not Managers.party or not Managers.party.leader then
		Application.warning("[PlayerManager:party_leader_player] Could not get the party leader -> using local player")

		return Managers.player:local_player()
	else
		local leader_peer_id = Managers.party:leader()

		if not leader_peer_id then
			Application.warning("[PlayerManager:party_leader_player] Could not get the party leader -> using local player")

			return Managers.player:local_player()
		end

		local party_leader_player = self:player_from_peer_id(leader_peer_id, 1)

		if not party_leader_player then
			Application.warning("[PlayerManager:party_leader_player] Could not fetch party player from peer_id %s", leader_peer_id)
		end

		return party_leader_player
	end
end

PlayerManager.next_available_local_player_id = function (self, peer_id)
	local i = 2
	local player_table = self._players_by_peer[peer_id]

	if player_table then
		while player_table[i] do
			i = i + 1
		end
	end

	return i
end

PlayerManager.num_players = function (self)
	local i = 0

	for _, _ in pairs(self._players) do
		i = i + 1
	end

	return i
end

PlayerManager.local_player = function (self, local_player_id)
	return self:player(Network.peer_id(), local_player_id or 1)
end

PlayerManager.bots = function (self)
	local player_bots = {}

	for _, player in pairs(self._players) do
		if player.bot_player then
			player_bots[#player_bots + 1] = player
		end
	end

	return player_bots
end

function DEBUG_PLAYERS()
	local players = Managers.player:players()

	print("players -----------------------------------------------------------")

	for id, player in pairs(players) do
		print("PLAYER id:" .. tostring(id) .. ", unit:" .. tostring(player.player_unit) .. ", remote:" .. tostring(player.remote) .. ", peer_id:" .. tostring(player.peer_id))
	end

	print(" ")
end

return

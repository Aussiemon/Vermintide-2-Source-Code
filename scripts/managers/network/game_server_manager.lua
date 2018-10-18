require("scripts/managers/matchmaking/matchmaking_handshaker")

GameServerManager = class(GameServerManager)
local rpcs = {
	"rpc_set_player_name"
}

GameServerManager.init = function (self, level_transition_handler)
	self._level_transition_handler = level_transition_handler
	self._last_error_reason = ""
	self._player_names = {}
end

GameServerManager.setup_network_context = function (self, network_context)
	self._network_server = network_context.network_server
	self._network_transmit = network_context.network_transmit
	self._game_server = network_context.game_server
	self._profile_synchronizer = network_context.profile_synchronizer
end

GameServerManager.destroy = function (self)
	self._level_transition_handler = nil

	if self._network_transmit then
		self._network_transmit:destroy()

		self._network_transmit = nil
	end
end

GameServerManager.update = function (self, dt, t)
	if Keyboard.pressed(Keyboard.button_index("q")) then
		self:set_leader_peer_id(Network.peer_id())
		self:set_start_game_params(Network.peer_id(), "magnus", "adventure", "hard", false)
	end

	self:_notify_backend_errors()
end

GameServerManager.peer_name = function (self, peer_id)
	return self._player_names[peer_id]
end

GameServerManager.remove_peer = function (self, peer_id)
	self._game_server:remove_peer(peer_id)

	self._player_names[peer_id] = nil
end

GameServerManager._update_game_server = function (self, dt, t)
	self:_update_leader()
end

GameServerManager.register_rpcs = function (self, network_event_delegate)
	network_event_delegate:register(self, unpack(rpcs))

	self._network_event_delegate = network_event_delegate
end

GameServerManager.unregister_rpcs = function (self)
	fassert(self._network_event_delegate, "Rpcs have not been registered yet (%s) (%s)", self._network_event_delegate, self._network_transmit)
	self._network_event_delegate:unregister(self)

	self._network_event_delegate = nil
end

GameServerManager.set_leader_peer_id = function (self, leader_peer_id)
	local current_leader = Managers.party:leader()

	if leader_peer_id ~= nil and current_leader == nil then
		print(string.format("Start loading leader %s's characters and gear in the backend", leader_peer_id))
		Managers.backend:update_items(leader_peer_id)
	end

	Managers.party:set_leader(leader_peer_id)

	local members = self._game_server:members():get_members()

	for _, peer_id in ipairs(members) do
		RPC.rpc_game_server_set_group_leader(peer_id, leader_peer_id)
	end
end

GameServerManager.start_game_params = function (self)
	return self._start_game_params
end

GameServerManager.restart = function (self)
	self._wants_restart = true
end

GameServerManager.get_transition = function (self)
	if self._wants_restart then
		return "restart_game_server"
	end
end

GameServerManager.hot_join_sync = function (self, peer_id)
	RPC.rpc_game_server_set_group_leader(peer_id, Managers.party:leader())
end

GameServerManager.set_start_game_params = function (self, sender, level_key, game_mode, difficulty, private_game)
	local current_leader = Managers.party:leader()

	if sender ~= current_leader then
		mm_printf("Peer (%s) tried starting the game without being leader (%s)", sender, current_leader)

		return
	end

	local stored_lobby_data = self._game_server:get_stored_lobby_data()
	stored_lobby_data.level_key = level_key
	stored_lobby_data.difficulty = difficulty
	stored_lobby_data.game_mode = game_mode
	stored_lobby_data.is_private = (private_game and "true") or "false"

	self._game_server:set_lobby_data(stored_lobby_data)

	self._start_game_params = {
		level_key = level_key,
		game_mode = game_mode,
		difficulty = difficulty,
		private_game = private_game
	}
end

GameServerManager.rpc_set_player_name = function (self, sender, cropped_name)
	self._player_names[sender] = cropped_name
end

GameServerManager._notify_backend_errors = function (self)
	local backend = Managers.backend

	if backend ~= nil and backend:has_error() then
		local reason = backend:error_string()

		if self._last_error_reason ~= reason then
			self:_say(reason)

			self._last_error_reason = reason
		end
	end
end

GameServerManager._say = function (self, text)
	text = UTF8Utils.sub_string(text, 1, 128)
	local chat = Managers.chat

	if chat ~= nil and chat:has_channel(1) then
		local localize_parameters = false

		chat:send_system_chat_message(1, "backend_error_on_server", text, localize_parameters, true)
	end
end

return

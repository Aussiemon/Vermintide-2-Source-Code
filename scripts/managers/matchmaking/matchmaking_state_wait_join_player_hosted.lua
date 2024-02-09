-- chunkname: @scripts/managers/matchmaking/matchmaking_state_wait_join_player_hosted.lua

MatchmakingStateWaitJoinPlayerHosted = class(MatchmakingStateWaitJoinPlayerHosted)
MatchmakingStateWaitJoinPlayerHosted.NAME = "MatchmakingStateWaitJoinPlayerHosted"

MatchmakingStateWaitJoinPlayerHosted.init = function (self, params)
	self._lobby = params.lobby
	self._network_options = params.network_options
	self._matchmaking_manager = params.matchmaking_manager
	self._network_transmit = params.network_transmit
	self._is_server = params.is_server
end

MatchmakingStateWaitJoinPlayerHosted.destroy = function (self)
	return
end

MatchmakingStateWaitJoinPlayerHosted.on_enter = function (self, state_context)
	self._current_lobby = Managers.state.network:lobby()
	self._state_context = state_context
	self._search_config = state_context.search_config
	self._lobby_client = state_context.lobby_client

	self:_sync_player_data()
end

MatchmakingStateWaitJoinPlayerHosted._sync_player_data = function (self)
	local player = Managers.player:local_player()
	local name = player:name()
	local career_name = player:career_name()
	local profile_id = player:profile_index()
	local career_id = player:career_index()
	local party_id = self._state_context.party_id
	local slots = {
		"slot_frame",
		"slot_melee",
		"slot_ranged",
	}
	local items_interface = Managers.backend:get_interface("items")
	local versus_interface = Managers.backend:get_interface("versus")
	local slot_data = {}

	print("========================================")

	for _, slot_name in pairs(slots) do
		local item_id = versus_interface:get_loadout_item_id(career_name, slot_name)
		local item_key = items_interface:get_key(item_id)

		print(slot_name, item_key)

		slot_data[slot_name] = NetworkLookup.item_names[item_key]
	end

	print("----------------------------------------")
	table.dump(slot_data, "SLOT_SYNC_DATA", 2)
	print("========================================")

	local do_full_sync = true
	local fake_party_id = 0
	local peer_id = Network.peer_id()
	local host = self._lobby_client:lobby_host()

	self._network_transmit:send_rpc("rpc_matchmaking_sync_player_data", host, peer_id, name, profile_id, career_id, slot_data.slot_frame, slot_data.slot_melee, slot_data.slot_ranged, fake_party_id, do_full_sync)
end

MatchmakingStateWaitJoinPlayerHosted.on_exit = function (self)
	return
end

MatchmakingStateWaitJoinPlayerHosted.update = function (self, dt, t)
	self._lobby_client:update(dt)

	if self._lobby_client:failed() then
		return self:_lobby_failed()
	end
end

MatchmakingStateWaitJoinPlayerHosted._teardown_lobby = function (self)
	if self._lobby_client ~= nil then
		self._lobby_client:destroy()

		self._lobby_client = nil
	end

	self._matchmaking_manager:reset_joining()

	self._state_context.join_lobby_data = nil
end

MatchmakingStateWaitJoinPlayerHosted._lobby_failed = function (self)
	self:_teardown_lobby()

	return MatchmakingStateIdle
end

MatchmakingStateWaitJoinPlayerHosted.get_transition = function (self)
	if self._next_transition_state then
		local start_lobby_data = {
			lobby_client = self._lobby_client,
		}

		return self._next_transition_state, start_lobby_data
	end
end

MatchmakingStateWaitJoinPlayerHosted.rpc_matchmaking_join_game = function (self, channel_id)
	mm_printf_force("Transition from join due to rpc_matchmaking_join_game")
	self._matchmaking_manager:send_system_chat_message("matchmaking_status_joining_game")

	self._matchmaking_manager.debug.text = "starting_game"
	self._next_transition_state = "start_lobby"
end

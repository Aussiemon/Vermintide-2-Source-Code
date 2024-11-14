-- chunkname: @scripts/utils/profile_requester.lua

local RPCS = {
	"rpc_request_profile",
	"rpc_request_profile_reply",
}

ProfileRequester = class(ProfileRequester)
ProfileRequester.REQUEST_RESULTS = {
	"success",
	"failure",
	failure = 2,
	success = 1,
}

ProfileRequester.init = function (self, is_server, network_server, profile_synchronizer)
	self._is_server = is_server
	self._network_server = network_server
	self._profile_synchronizer = profile_synchronizer
	self._peer_id = Network.peer_id()
	self._request_id = 0
end

ProfileRequester.destroy = function (self)
	return
end

ProfileRequester.register_rpcs = function (self, network_event_delegate, network_transmit)
	network_event_delegate:register(self, unpack(RPCS))

	self._network_event_delegate = network_event_delegate
	self._network_transmit = network_transmit
end

ProfileRequester.unregister_rpcs = function (self)
	self._network_event_delegate:unregister(self)

	self._network_event_delegate = nil
	self._network_transmit = nil
end

ProfileRequester.profile_is_specator = function (self, profile_index)
	return profile_index == FindProfileIndex("spectator")
end

ProfileRequester.request_profile = function (self, peer_id, local_player_id, profile_name, career_name, force_respawn)
	self._request_id = self._request_id + 1
	self._request_result = nil

	local profile_index = FindProfileIndex(profile_name)
	local career_index = career_index_from_name(profile_index, career_name)

	if self._is_server then
		self:_request_profile(peer_id, local_player_id, self._request_id, profile_index, career_index, force_respawn)
	else
		self._network_transmit:send_rpc_server("rpc_request_profile", peer_id, local_player_id, self._request_id, profile_index, career_index, force_respawn)
	end
end

ProfileRequester._request_profile = function (self, peer_id, local_player_id, request_id, profile_index, career_index, force_respawn)
	local allowed_to_switch_to_profile

	force_respawn = not not force_respawn

	local party_id = Managers.mechanism:reserved_party_id_by_peer(peer_id)

	allowed_to_switch_to_profile = self:profile_is_specator() or Managers.mechanism:profile_available_for_peer(party_id, peer_id, profile_index)

	if allowed_to_switch_to_profile then
		local override_profile_index, override_career_index

		allowed_to_switch_to_profile, override_profile_index, override_career_index = Managers.mechanism:try_reserve_profile_for_peer_by_mechanism(peer_id, profile_index, career_index, force_respawn)

		if override_profile_index then
			profile_index = override_profile_index
			career_index = override_career_index
		end
	end

	local result_id

	if allowed_to_switch_to_profile then
		result_id = ProfileRequester.REQUEST_RESULTS.success

		Managers.party:set_selected_profile(peer_id, local_player_id, profile_index, career_index)

		local is_bot = false

		self._profile_synchronizer:assign_full_profile(peer_id, local_player_id, profile_index, career_index, is_bot)

		if force_respawn then
			Managers.state.game_mode:force_respawn(peer_id, local_player_id)
		end
	else
		result_id = ProfileRequester.REQUEST_RESULTS.failure
	end

	if self._peer_id == peer_id then
		local channel_id = PEER_ID_TO_CHANNEL[peer_id]

		self:rpc_request_profile_reply(channel_id, local_player_id, request_id, profile_index, career_index, force_respawn, result_id)
	else
		self._network_transmit:send_rpc("rpc_request_profile_reply", peer_id, local_player_id, request_id, profile_index, career_index, force_respawn, result_id)
	end
end

ProfileRequester._despawn_player_unit = function (self, player)
	local player_unit = player.player_unit

	self._despawning_player_unit = player_unit

	Managers.state.spawn:delayed_despawn(player)
end

ProfileRequester.update = function (self, dt)
	if self._despawning_player_unit and not Unit.alive(self._despawning_player_unit) then
		self._despawning_player_unit = nil
	end
end

ProfileRequester.result = function (self)
	return self._request_result
end

ProfileRequester.rpc_request_profile = function (self, channel_id, peer_id, local_player_id, request_id, profile_index, career_index, force_respawn)
	local peer = CHANNEL_TO_PEER_ID[channel_id]

	self:_request_profile(peer, local_player_id, request_id, profile_index, career_index, force_respawn)
end

ProfileRequester.rpc_request_profile_reply = function (self, channel_id, local_player_id, request_id, profile_index, career_index, force_respawn, result_id)
	if request_id < self._request_id then
		return
	end

	local result = ProfileRequester.REQUEST_RESULTS[result_id]

	self._request_result = result

	if result == "success" and force_respawn then
		local self_peer_id = self._peer_id
		local player = Managers.player:player(self_peer_id, local_player_id)

		if player then
			if player:needs_despawn() then
				self:_despawn_player_unit(player)
			end

			player:set_profile_index(profile_index)
			player:set_career_index(career_index)
			Managers.party:set_selected_profile(self_peer_id, local_player_id, profile_index, career_index)
		end
	end

	if script_data.testify then
		Testify:respond_to_request("set_player_profile")
	end
end

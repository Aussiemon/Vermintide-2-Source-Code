require("scripts/managers/voting/vote_templates")

VoteManager = class(VoteManager)
local VOTING_RPCS = {
	"rpc_server_request_start_vote_peer_id",
	"rpc_server_request_start_vote_lookup",
	"rpc_server_request_start_vote_deed",
	"rpc_client_start_vote_peer_id",
	"rpc_client_start_vote_lookup",
	"rpc_client_start_vote_deed",
	"rpc_client_add_vote",
	"rpc_vote",
	"rpc_client_complete_vote",
	"rpc_client_vote_kick_enabled",
	"rpc_update_voters_list",
	"rpc_client_check_dlc",
	"rpc_server_check_dlc_reply",
	"rpc_requirement_failed"
}

VoteManager.init = function (self, ingame_context)
	self.is_server = ingame_context.is_server
	self.network_event_delegate = ingame_context.network_event_delegate
	self.level_transition_handler = ingame_context.level_transition_handler
	self.input_manager = ingame_context.input_manager
	self.wwise_world = ingame_context.wwise_world
	self.ingame_context = ingame_context

	self.network_event_delegate:register(self, unpack(VOTING_RPCS))

	self._vote_kick_enabled = true
end

local DLC_DEPENDENCIES = {}

VoteManager._gather_dlc_dependencies = function (self, vote_data)
	table.clear(DLC_DEPENDENCIES)

	local game_mode = vote_data.game_mode

	if game_mode == "weave_find_group" then
		game_mode = "weave"
	end

	local game_mode_settings = game_mode and GameModeSettings[game_mode]

	if game_mode_settings and game_mode_settings.required_dlc then
		DLC_DEPENDENCIES[#DLC_DEPENDENCIES + 1] = NetworkLookup.dlcs[game_mode_settings.required_dlc]
	end

	local difficulty = vote_data.difficulty
	local difficulty_settings = DifficultySettings[difficulty]

	if difficulty_settings and difficulty_settings.dlc_requirement then
		DLC_DEPENDENCIES[#DLC_DEPENDENCIES + 1] = NetworkLookup.dlcs[difficulty_settings.dlc_requirement]
	end

	if #DLC_DEPENDENCIES > 0 then
		return DLC_DEPENDENCIES
	end
end

VoteManager.request_vote = function (self, name, vote_data, voter_peer_id, ignore_dlc_check)
	local vote_template = VoteTemplates[name]

	fassert(vote_template, "Could not find voting template by name: %q", name)
	fassert(voter_peer_id ~= nil, "No voter peer id sent")

	local vote_type_id = NetworkLookup.voting_types[name]
	vote_data = vote_data or {}
	vote_data.voter_peer_id = voter_peer_id

	if self.is_server then
		local start_new_voting = self:can_start_vote(name, vote_data)

		if start_new_voting then
			local dlc_dependencies = nil

			if not ignore_dlc_check then
				dlc_dependencies = self:_gather_dlc_dependencies(vote_data)
			end

			if dlc_dependencies then
				self._requirement_check_data = {
					vote_name = name,
					results = {},
					voters = self:_active_peers(),
					vote_data = vote_data,
					voter_peer_id = voter_peer_id or NetworkLookup.peer_id()
				}

				Managers.state.network.network_transmit:send_rpc_all("rpc_client_check_dlc", dlc_dependencies)

				return false
			else
				self:_server_abort_active_vote()
				self:_server_start_vote(name, nil, vote_data)

				local sync_data = vote_template.pack_sync_data(vote_data)
				local server_start_vote_rpc = vote_template.server_start_vote_rpc
				local voters = self.active_voting.voters

				Managers.state.network.network_transmit:send_rpc_clients(server_start_vote_rpc, vote_type_id, sync_data, voters)

				if vote_template.initial_vote_func then
					local votes = vote_template.initial_vote_func(vote_data)

					for peer_id, vote in pairs(votes) do
						self:rpc_vote(peer_id, vote)
					end
				end

				return true
			end
		end
	elseif Managers.state.network:game() then
		local client_start_vote_rpc = vote_template.client_start_vote_rpc
		local sync_data = vote_template.pack_sync_data(vote_data)

		Managers.state.network.network_transmit:send_rpc_server(client_start_vote_rpc, vote_type_id, sync_data)
	end
end

VoteManager._server_abort_active_vote = function (self)
	local active_voting = self.active_voting

	if active_voting then
		local ingame_context = self.ingame_context
		local vote_data = active_voting.data
		local result_data = active_voting.template.on_complete(0, ingame_context, vote_data)

		self:rpc_client_complete_vote(nil, 0)
		Managers.state.network.network_transmit:send_rpc_clients("rpc_client_complete_vote", 0)
	end
end

VoteManager._trigger_can_vote_fail_reply = function (self, vote_name, vote_data, message)
	local vote_id = NetworkLookup.voting_types[vote_name]
	local voter_peer_id = vote_data.voter_peer_id

	Managers.state.network.network_transmit:send_rpc("rpc_requirement_failed", voter_peer_id, vote_id, message)
end

VoteManager.can_start_vote = function (self, name, vote_data)
	local vote_template = VoteTemplates[name]

	if vote_template.can_start_vote then
		local success, message = vote_template.can_start_vote(vote_data)

		if not success then
			if message then
				self:_trigger_can_vote_fail_reply(name, vote_data, message)
			end

			return false
		end
	end

	local num_players = Managers.player:num_human_players()
	local min_required_voters = vote_template.min_required_voters or 1
	local enough_players = num_players >= min_required_voters

	if not enough_players then
		return false
	end

	local requirement_check_data = self._requirement_check_data

	if requirement_check_data then
		return false
	end

	local active_voting = self.active_voting

	if active_voting and vote_template.priority <= active_voting.template.priority then
		return false
	end

	return true
end

VoteManager.vote = function (self, vote)
	local valid_vote = vote ~= nil

	fassert(valid_vote, "Incorrect vote: %s. Casteted by: %s", vote, Network.peer_id())

	local is_server = self.is_server
	local network_manager = Managers.state.network

	if is_server then
		self:rpc_vote(Network.peer_id(), vote)
	elseif network_manager:in_game_session() then
		network_manager.network_transmit:send_rpc_server("rpc_vote", vote)
	end
end

VoteManager._number_of_votes = function (self)
	local active_voting = self.active_voting

	if active_voting then
		local current_vote_results = {}
		local vote_options = active_voting.template.vote_options

		for index, _ in ipairs(vote_options) do
			current_vote_results[index] = 0
		end

		local number_of_votes = 0

		for _, vote in pairs(active_voting.votes) do
			number_of_votes = number_of_votes + 1
			current_vote_results[vote] = current_vote_results[vote] + 1
		end

		return number_of_votes, current_vote_results
	end

	return 0, nil
end

VoteManager.has_voted = function (self, peer_id)
	local active_voting = self.active_voting

	return active_voting and active_voting.votes[peer_id] ~= nil
end

VoteManager.vote_in_progress = function (self)
	local active_voting = self.active_voting

	if active_voting then
		return active_voting.name
	end

	return nil
end

VoteManager.active_vote_template = function (self)
	return self.active_voting.template
end

VoteManager.active_vote_data = function (self)
	return self.active_voting.data
end

VoteManager.previous_vote_info = function (self)
	return self.previous_voting_info
end

VoteManager.is_ingame_vote = function (self)
	return self.active_voting.template.ingame_vote
end

VoteManager.is_mission_vote = function (self)
	return self.active_voting.template.mission_vote
end

VoteManager.allow_vote_input = function (self, enable)
	self._allow_vote_input = enable
end

VoteManager.vote_time_left = function (self)
	local network_time = Managers.state.network:network_time()
	local active_voting = self.active_voting

	if active_voting and active_voting.end_time then
		return math.max(active_voting.end_time - network_time, 0)
	end

	return nil
end

VoteManager._handle_popup_result = function (self, result)
	self._popup_id = nil
end

VoteManager.update = function (self, dt)
	local t = Managers.state.network:network_time()

	if self.is_server then
		self:_server_update(dt, t)
	else
		self:_client_update(dt, t)
	end

	if self._popup_id then
		local result = Managers.popup:query_result(self._popup_id)

		if result then
			self:_handle_popup_result(result)
		end
	end

	if self._allow_vote_input then
		local active_voting = self.active_voting

		if active_voting and active_voting.template.ingame_vote and not self:has_voted(Network.peer_id()) then
			local input_manager = self.input_manager
			local gamepad_active = input_manager:is_device_active("gamepad")
			local input_source = input_manager:get_service("ingame_menu")
			local vote_options = active_voting.template.vote_options
			local vote_options_n = #vote_options
			local input_hold_timer = active_voting.input_hold_timer or 0

			for i = 1, vote_options_n, 1 do
				local vote_option = vote_options[i]

				if gamepad_active then
					local input = vote_option.input

					if input_source:get(input, true) then
						if input ~= active_voting.current_hold_input then
							active_voting.current_hold_input = input
							input_hold_timer = 0
						end

						local input_hold_time = vote_option.input_hold_time

						if input_hold_timer == input_hold_time then
							active_voting.input_hold_timer = nil

							self:vote(vote_option.vote)
						else
							active_voting.input_hold_timer = math.min(input_hold_timer + dt, input_hold_time)
							active_voting.input_hold_progress = active_voting.input_hold_timer / input_hold_time
						end
					elseif input == active_voting.current_hold_input then
						active_voting.current_hold_input = nil
						active_voting.input_hold_timer = nil
						active_voting.input_hold_progress = nil
					end
				elseif input_source:get(vote_option.input, true) then
					self:vote(vote_option.vote)
				end
			end
		end
	end
end

VoteManager._time_ended = function (self, t)
	local active_voting = self.active_voting

	if active_voting.end_time and active_voting.end_time <= t then
		return true
	end

	return false
end

VoteManager._vote_result = function (self, vote_time_ended)
	local active_voting = self.active_voting
	local template = active_voting.template
	local num_of_votes, current_vote_results = self:_number_of_votes()
	local number_of_voters = #active_voting.voters
	local minimum_voter_percent = template.minimum_voter_percent
	local success_percent = template.success_percent or 0.51
	local min_required_voters = template.min_required_voters or 1

	if number_of_voters < min_required_voters then
		return 0
	end

	if vote_time_ended or num_of_votes == number_of_voters then
		for vote_option, vote_option_count in ipairs(current_vote_results) do
			local vote_success_ratio = vote_option_count / num_of_votes

			if success_percent <= vote_success_ratio then
				return vote_option
			end
		end
	end

	local num_of_votes_needed = (minimum_voter_percent and minimum_voter_percent <= num_of_votes / number_of_voters) or false

	if num_of_votes_needed or num_of_votes == number_of_voters then
		return 0
	end

	return nil
end

VoteManager.hot_join_sync = function (self, peer_id)
	if self.active_voting then
		local active_voting = self.active_voting
		local template = active_voting.template
		local name_id = NetworkLookup.voting_types[template.name]
		local sync_data = template.pack_sync_data(active_voting.data)
		local server_start_vote_rpc = template.server_start_vote_rpc
		local voters = active_voting.voters

		RPC[server_start_vote_rpc](peer_id, name_id, sync_data, voters)

		local votes = active_voting.votes

		for voter_peer_id, vote_option in pairs(votes) do
			RPC.rpc_client_add_vote(peer_id, voter_peer_id, vote_option)
		end
	end

	RPC.rpc_client_vote_kick_enabled(peer_id, self._vote_kick_enabled)
end

VoteManager.destroy = function (self)
	self.network_event_delegate:unregister(self)

	self.network_event_delegate = nil

	if self._popup_id then
		Managers.popup:cancel_popup(self._popup_id)

		self._popup_id = nil
	end
end

VoteManager._server_start_vote = function (self, name, ignore_peer_list, data)
	local vote_template = VoteTemplates[name]
	local network_time = Managers.state.network:network_time()
	self.active_voting = {
		name = name,
		template = vote_template,
		end_time = (vote_template.duration and network_time + vote_template.duration) or nil,
		votes = {},
		voters = self:_get_voter_start_list(ignore_peer_list),
		data = data
	}

	if vote_template.on_start then
		vote_template.on_start(self.ingame_context, data)
	end

	local start_sound_event = vote_template.start_sound_event

	if start_sound_event then
		self:play_sound(start_sound_event)
	end
end

VoteManager._get_voter_start_list = function (self, ignore_list)
	local ignore_peers = {}

	if ignore_list then
		for i = 1, #ignore_list, 1 do
			ignore_peers[ignore_list[i]] = true
		end
	end

	local voters = {}
	local human_players = Managers.player:human_players()

	for _, player in pairs(human_players) do
		local peer_id = player.peer_id

		if not ignore_peers[peer_id] then
			voters[#voters + 1] = peer_id
		end
	end

	return voters
end

local removed_peers = {}

VoteManager._update_voter_list_by_active_peers = function (self, active_peers, voter_list, votes)
	table.clear(removed_peers)

	local human_players = Managers.player:human_players()

	for _, player in pairs(human_players) do
		local peer_id = player.peer_id
		active_peers[peer_id] = true
	end

	local changed = false

	for i = #voter_list, 1, -1 do
		local voter_peer_id = voter_list[i]

		if not active_peers[voter_peer_id] then
			table.remove(voter_list, i)

			removed_peers[#removed_peers + 1] = voter_peer_id
			changed = true
		end
	end

	for i = 1, #removed_peers, 1 do
		local peer_id = removed_peers[i]

		if votes[peer_id] ~= nil then
			votes[peer_id] = nil
		end
	end

	return changed
end

VoteManager.rpc_vote = function (self, peer_id, vote_cast)
	local active_voting = self.active_voting

	if active_voting then
		if self:has_voted(peer_id) then
			return
		end

		Managers.state.network.network_transmit:send_rpc_clients("rpc_client_add_vote", peer_id, vote_cast)
		self:_server_add_vote(peer_id, vote_cast)
	end
end

VoteManager._server_add_vote = function (self, peer_id, vote_option)
	self.active_voting.votes[peer_id] = vote_option
end

VoteManager._handle_requirement_results = function (self, requirement_check_data)
	local is_done = true
	local success = true

	for peer_id, _ in pairs(requirement_check_data.voters) do
		if requirement_check_data.results[peer_id] == nil then
			is_done = false
		elseif not requirement_check_data.results[peer_id] then
			success = false
		end
	end

	return is_done, success
end

VoteManager._server_handle_requirement_check = function (self, dt, t)
	local requirement_check_data = self._requirement_check_data
	local active_peers = self:_active_peers()

	self:_update_voter_list_by_active_peers(active_peers, requirement_check_data.voters, requirement_check_data.results)

	local is_done, success = self:_handle_requirement_results(requirement_check_data)

	if is_done then
		self._requirement_check_data = nil

		if success then
			local ignore_dlc_check = true
			local vote_name = requirement_check_data.vote_name
			local vote_data = requirement_check_data.vote_data
			local voter_peer_id = requirement_check_data.voter_peer_id

			self:request_vote(vote_name, vote_data, voter_peer_id, ignore_dlc_check)
		else
			local vote_name = requirement_check_data.vote_name
			local vote_template = VoteTemplates[vote_name]
			local message = vote_template.requirement_failed_message or vote_template.requirement_failed_message_func(requirement_check_data) or ""
			local vote_id = NetworkLookup.voting_types[vote_name]
			local voter_peer_id = requirement_check_data.voter_peer_id

			Managers.state.network.network_transmit:send_rpc("rpc_requirement_failed", voter_peer_id, vote_id, message)
		end
	end
end

VoteManager._server_update = function (self, dt, t)
	local requirement_check_data = self._requirement_check_data

	if requirement_check_data then
		self:_server_handle_requirement_check(dt, t)

		return
	end

	local active_voting = self.active_voting

	if not active_voting then
		return
	end

	if not Managers.state.network:game() then
		return
	end

	local active_peers = self:_active_peers()
	local changed = self:_update_voter_list_by_active_peers(active_peers, active_voting.voters, active_voting.votes)

	if changed then
		Managers.state.network.network_transmit:send_rpc_clients("rpc_update_voters_list", active_voting.voters)
	end

	local vote_time_ended = self:_time_ended(t)

	if vote_time_ended then
		self:_handle_undecided_votes(active_voting)
	end

	local vote_result = self:_vote_result(vote_time_ended)

	if vote_result ~= nil then
		local result_data = active_voting.template.on_complete(vote_result, self.ingame_context, active_voting.data)

		Managers.state.network.network_transmit:send_rpc_all("rpc_client_complete_vote", vote_result)
	elseif vote_time_ended then
		local result_data = active_voting.template.on_complete(0, self.ingame_context, active_voting.data)

		Managers.state.network.network_transmit:send_rpc_all("rpc_client_complete_vote", 0)
	end
end

VoteManager._handle_undecided_votes = function (self, active_voting)
	local timeout_vote_option = active_voting.template.timeout_vote_option

	if not timeout_vote_option then
		return
	end

	local voters = active_voting.voters
	local votes = active_voting.votes

	for i = 1, #voters, 1 do
		local peer_id = voters[i]

		if not votes[peer_id] then
			self:rpc_vote(peer_id, timeout_vote_option)
		end
	end
end

VoteManager.rpc_server_request_start_vote_base = function (self, peer_id, vote_type_id, sync_data)
	local vote_type_name = NetworkLookup.voting_types[vote_type_id]
	local vote_template = VoteTemplates[vote_type_name]
	local vote_data = vote_template.extract_sync_data(sync_data)

	self:request_vote(vote_type_name, vote_data, peer_id)
end

VoteManager.rpc_server_request_start_vote_peer_id = function (self, peer_id, vote_type_id, sync_data)
	self:rpc_server_request_start_vote_base(peer_id, vote_type_id, sync_data)
end

VoteManager.rpc_server_request_start_vote_lookup = function (self, peer_id, vote_type_id, sync_data)
	self:rpc_server_request_start_vote_base(peer_id, vote_type_id, sync_data)
end

VoteManager.rpc_server_request_start_vote_deed = function (self, peer_id, vote_type_id, sync_data)
	self:rpc_server_request_start_vote_base(peer_id, vote_type_id, sync_data)
end

VoteManager._start_vote_base = function (self, peer_id, vote_type_id, sync_data, voters)
	local vote_type_name = NetworkLookup.voting_types[vote_type_id]
	local vote_template = VoteTemplates[vote_type_name]

	fassert(vote_template, "Could not find voting template by name: %q", vote_type_name)

	local network_time = Managers.state.network:network_time()
	local data = vote_template.extract_sync_data(sync_data)
	self.active_voting = {
		name = vote_type_name,
		template = vote_template,
		end_time = (vote_template.duration and network_time + vote_template.duration) or nil,
		voters = voters,
		votes = {},
		data = data
	}
end

VoteManager.rpc_client_start_vote_peer_id = function (self, peer_id, vote_type_id, sync_data, voters)
	self:_start_vote_base(peer_id, vote_type_id, sync_data, voters)
end

VoteManager.rpc_client_start_vote_lookup = function (self, peer_id, vote_type_id, sync_data, voters)
	self:_start_vote_base(peer_id, vote_type_id, sync_data, voters)
end

VoteManager.rpc_client_start_vote_deed = function (self, peer_id, vote_type_id, sync_data, voters)
	self:_start_vote_base(peer_id, vote_type_id, sync_data, voters)
end

VoteManager.rpc_client_add_vote = function (self, sender_id, peer_id, vote_option)
	local active_voting = self.active_voting

	if active_voting then
		active_voting.votes[peer_id] = vote_option
	end
end

VoteManager.rpc_client_complete_vote = function (self, sender_id, vote_result)
	if self.active_voting then
		local number_of_votes, vote_results = self:_number_of_votes()
		self.previous_voting_info = {
			text = self.active_voting.text,
			number_of_votes = number_of_votes,
			vote_results = vote_results,
			vote_result = vote_result,
			votes = self.active_voting.votes
		}
	end

	self.active_voting = nil
end

VoteManager.rpc_client_vote_kick_enabled = function (self, sender_id, is_enabled)
	self._vote_kick_enabled = is_enabled
end

VoteManager.rpc_update_voters_list = function (self, peer_id, voters)
	local active_voting = self.active_voting

	if active_voting then
		local active_peers = {}

		for i = 1, #voters, 1 do
			active_peers[voters[i]] = true
		end

		local changed = self:_update_voter_list_by_active_peers(active_peers, active_voting.voters, active_voting.votes)

		if not changed then
			table.dump(voters, "voters")
			table.dump(active_peers, "active_peers")
		end

		fassert(changed, "What?")
	end
end

VoteManager.rpc_client_check_dlc = function (self, sender, dlc_name_ids)
	local owns_dlc = true

	for _, dlc_id in ipairs(dlc_name_ids) do
		local dlc_name = NetworkLookup.dlcs[dlc_id]

		if not Managers.unlock:is_dlc_unlocked(dlc_name) then
			owns_dlc = false

			break
		end
	end

	Managers.state.network.network_transmit:send_rpc_server("rpc_server_check_dlc_reply", owns_dlc)
end

VoteManager.rpc_server_check_dlc_reply = function (self, sender, success)
	local requirement_check_data = self._requirement_check_data
	requirement_check_data.results[sender] = success
end

VoteManager.rpc_requirement_failed = function (self, sender, vote_id, message)
	local header = Localize("required_power_level_not_met_in_party")
	local vote_name = NetworkLookup.voting_types[vote_id]
	self._popup_id = Managers.popup:queue_popup(message, header, "ok", Localize("button_ok"))
end

VoteManager._client_update = function (self, dt, t)
	return
end

VoteManager.set_vote_kick_enabled = function (self, is_enabled)
	if self.is_server then
		self._vote_kick_enabled = is_enabled

		Managers.state.network.network_transmit:send_rpc_clients("rpc_client_vote_kick_enabled", is_enabled)
	end
end

VoteManager.vote_kick_enabled = function (self)
	if self._vote_kick_enabled then
		return Managers.player:num_human_players() > 2
	end

	return false
end

VoteManager.play_sound = function (self, event)
	WwiseWorld.trigger_event(self.wwise_world, event)
end

local current_voters = {}

VoteManager.get_current_voters = function (self)
	table.clear(current_voters)

	if self.active_voting then
		local votes = self.active_voting.votes
		local voters = self.active_voting.voters
		local num_voters = #voters

		for i = 1, num_voters, 1 do
			local peer_id = voters[i]
			local vote = votes[peer_id]

			if vote == nil then
				vote = "undecided"
			end

			current_voters[peer_id] = vote
		end
	end

	return current_voters
end

local peers_local = {}

VoteManager._active_peers = function (self)
	table.clear(peers_local)

	local human_players = Managers.player:human_players()

	for _, player in pairs(human_players) do
		local peer_id = player.peer_id
		peers_local[peer_id] = true
	end

	return peers_local
end

return

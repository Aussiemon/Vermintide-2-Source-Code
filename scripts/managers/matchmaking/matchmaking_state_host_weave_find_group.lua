MatchmakingStateHostFindWeaveGroup = class(MatchmakingStateHostFindWeaveGroup)
MatchmakingStateHostFindWeaveGroup.NAME = "MatchmakingStateHostFindWeaveGroup"
local GRACE_PERIOD = 2

MatchmakingStateHostFindWeaveGroup.init = function (self, params)
	self._lobby = params.lobby
	self._statistics_db = params.statistics_db
	self._stats_id = Managers.player:local_player():stats_id()
	self._network_transmit = params.network_transmit
	self._difficulty_manager = params.difficulty
	self._matchmaking_manager = params.matchmaking_manager
	self._handshaker_host = params.handshaker_host
	self._wwise_world = params.wwise_world
	self._host_timer = (Managers.time:time("main") + WeaveMatchmakingSettings.hosting_time) - GRACE_PERIOD
	self._hosting = true
end

MatchmakingStateHostFindWeaveGroup.destroy = function (self)
	return
end

MatchmakingStateHostFindWeaveGroup.on_enter = function (self, state_context)
	self.state_context = state_context
	self.search_config = state_context.search_config

	self:_fill_weave_matchmaing_data()
	self:_start_hosting_game()

	if not DEDICATED_SERVER then
		self:set_debug_info()

		local player = Managers.player:local_player()
		local connection_state = "started_hosting"
		local time_taken = Managers.time:time("main") - self.state_context.started_matchmaking_t
		local using_strict_matchmaking = self.search_config.strict_matchmaking

		Managers.telemetry.events:matchmaking_hosting(player, time_taken)

		self.state_context.started_hosting_t = Managers.time:time("main")
	end
end

MatchmakingStateHostFindWeaveGroup.set_debug_info = function (self)
	local search_config = self.search_config
	local level = search_config.level_key
	local difficulty = search_config.difficulty
	local peer_id = Network.peer_id()
	local player = Managers.player:player_from_peer_id(peer_id)
	local profile_index = player:profile_index()
	local profile = profile_index and SPProfiles[profile_index]
	local profile_name = (profile and profile.display_name) or "random"
	Managers.matchmaking.debug.state = "hosting game"
	Managers.matchmaking.debug.level = level
	Managers.matchmaking.debug.difficulty = difficulty
	Managers.matchmaking.debug.hero = profile_name
end

MatchmakingStateHostFindWeaveGroup.on_exit = function (self)
	self:_clear_weave_matchmaking_data()
end

MatchmakingStateHostFindWeaveGroup.update = function (self, dt, t)
	local lobby_members = self._lobby:members()
	local members = lobby_members:get_members()
	local num_players = #members

	if num_players >= 4 then
		self._matchmaking_manager:cancel_matchmaking()

		return nil
	elseif self._host_timer < t then
		if num_players < 2 then
			if self._hosting then
				self:_setup_grace_period(dt, t)

				return
			end

			self:_increase_expansion_rule()

			return MatchmakingStateSearchForWeaveGroup, self.state_context
		else
			self:_increase_expansion_rule()
			self:_continue_hosting(dt, t)
		end
	end
end

MatchmakingStateHostFindWeaveGroup._increase_expansion_rule = function (self)
	local current_expansion_rule_index = self.state_context.expansion_rule_index or 1
	local new_expansion_rule_index = current_expansion_rule_index + 1
	self.state_context.expansion_rule_index = new_expansion_rule_index
end

MatchmakingStateHostFindWeaveGroup._setup_grace_period = function (self, dt, t)
	self._host_timer = t + GRACE_PERIOD
	self._hosting = false
	local lobby_data = self._lobby:get_stored_lobby_data()
	lobby_data.matchmaking = "false"

	self._lobby:set_lobby_data(lobby_data)
end

MatchmakingStateHostFindWeaveGroup._continue_hosting = function (self, dt, t)
	self._host_timer = (t + WeaveMatchmakingSettings.hosting_time) - GRACE_PERIOD
	self._hosting = true

	self:_fill_weave_matchmaing_data()

	local lobby_data = self._lobby:get_stored_lobby_data()
	lobby_data.matchmaking = "true"

	self._lobby:set_lobby_data(lobby_data)
end

MatchmakingStateHostFindWeaveGroup._start_hosting_game = function (self)
	local state_context = self.state_context
	local search_config = self.search_config
	local level_key = search_config.level_key
	local act_key = search_config.act_key
	local difficulty = search_config.difficulty
	local game_mode = search_config.game_mode
	local private_game = false

	fassert(private_game ~= nil, "Private status variable wasn't set.")

	local quick_game = false
	local eac_authorized = false

	if PLATFORM == "win32" then
		if DEDICATED_SERVER then
			local eac_server = Managers.matchmaking.network_server:eac_server()
			eac_authorized = EACServer.state(eac_server, Network.peer_id()) == "trusted"
		else
			local eac_state = EAC.state()

			fassert(eac_state ~= nil, "EAC state wasn't set.")

			eac_authorized = eac_state == "trusted"
		end
	end

	local is_dedicated_server = self._lobby:is_dedicated_server()

	if not is_dedicated_server then
		Managers.party:set_leader(self._lobby:lobby_host())
	end

	local is_leader = Managers.party:is_leader(Network.peer_id())
	local is_leader_on_dedicated_server = is_leader and is_dedicated_server

	if not is_leader_on_dedicated_server then
		self._matchmaking_manager:set_matchmaking_data(level_key, difficulty, act_key, game_mode, private_game, quick_game, eac_authorized)
		self._matchmaking_manager:set_game_privacy(false)
	end
end

MatchmakingStateHostFindWeaveGroup._fill_weave_matchmaing_data = function (self)
	local lobby_data = self._lobby:get_stored_lobby_data()
	local expansion_rules = WeaveMatchmakingSettings.expansion_rules[1]
	local current_filter_rules = expansion_rules.near_filters

	for key, filter_data in pairs(current_filter_rules) do
		local value = filter_data.value or filter_data.fetch_function(self)
		lobby_data[key] = value
	end

	local expansion_rule_index = self.state_context.expansion_rule_index or 1
	lobby_data.expansion_rule_index = expansion_rule_index

	self._lobby:set_lobby_data(lobby_data)
end

MatchmakingStateHostFindWeaveGroup._clear_weave_matchmaking_data = function (self)
	local lobby_data = self._lobby:get_stored_lobby_data()
	local expansion_rules = WeaveMatchmakingSettings.expansion_rules[1]
	local current_filter_rules = expansion_rules.near_filters

	for key, filter_data in pairs(current_filter_rules) do
		lobby_data[key] = nil
	end

	lobby_data.expansion_rule_index = nil

	self._lobby:set_lobby_data(lobby_data)
end

return

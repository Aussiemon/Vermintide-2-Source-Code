-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
require("scripts/settings/twitch_settings")

DEBUG_TWITCH = false

local function debug_print(message, ...)
	if DEBUG_TWITCH then
		print("[TwitchManager] " .. string.format(message, ...))
	end

	return 
end

local RPCS = {
	"rpc_update_twitch_vote"
}
TwitchManager = class(TwitchManager)
TwitchManager.init = function (self)
	self._address = "irc.chat.twitch.tv"
	self._port = 6667
	self._votes = {}
	self._votes_lookup_table = {}
	self._vote_key_index = 1
	self._connecting = false
	self._connected = false
	self._twitch_user_name = ""
	self._game_object_ids = {}
	self._vote_key_to_go_id = {}
	local settings = Application.settings()
	self._twitch_settings = settings.twitch

	debug_print(Application.settings("twitch"))

	self._headers = {
		"Accept: application/vnd.twitchtv.v5+json",
		"Client-ID: " .. self._twitch_settings.client_id
	}
	TwitchSettings.default_downtime = Application.user_setting("twitch_time_between_votes")
	TwitchSettings.default_vote_time = Application.user_setting("twitch_vote_time")
	TwitchSettings.difficulty = Application.user_setting("twitch_difficulty")
	self._debug_vote_timer = 0.25

	return 
end
TwitchManager.connect = function (self, twitch_user_name, optional_connection_failure_callback, optional_connection_success_callback)
	fassert(twitch_user_name, "[TwitchManager] You need to provide a user name to connect")

	local url = "https://api.twitch.tv/kraken/users?login=" .. twitch_user_name
	local options = {
		[Managers.curl._curl.OPT_SSL_VERIFYPEER] = false
	}
	self._connecting = true
	self._connection_failure_callback = optional_connection_failure_callback
	self._connection_success_callback = optional_connection_success_callback
	self._twitch_user_name = twitch_user_name

	Managers.curl:get(url, self._headers, callback(self, "cb_on_user_info_received"), {
		"User Data",
		twitch_user_name
	}, options)

	return 
end
TwitchManager.cb_on_user_info_received = function (self, success, code, headers, data, userdata)
	self._show_result_info(self, success, code, headers, data, userdata)

	local result_data = cjson.decode(data)

	if success then
		if result_data then
			if result_data.error then
				local message = string.format(Localize("start_game_window_twitch_error_connection"), result_data.message, result_data.error, code)

				Application.error("[TwitchManager] " .. message)

				if self._connection_failure_callback then
					self._connection_failure_callback(message)
				end
			elseif 0 < result_data._total then
				local user_data = result_data.users[1]
				local user_id = user_data._id
				local twitch_user_name = user_data.name

				if self._connection_success_callback then
					self._connection_success_callback(user_data)
				end

				local url = "https://api.twitch.tv/kraken/streams/" .. user_id
				local options = {
					[Managers.curl._curl.OPT_SSL_VERIFYPEER] = false
				}

				Managers.curl:get(url, self._headers, callback(self, "cb_on_user_streams_received"), {
					"User Data",
					twitch_user_name
				}, options)

				return 
			else
				local message = string.format(Localize("start_game_window_twitch_error_no_user"), userdata[2])

				Application.error("[TwitchManager] " .. message)

				if self._connection_failure_callback then
					self._connection_failure_callback(message)
				end
			end
		else
			local message = Localize("start_game_window_twitch_error_parsing_results")

			Application.error("[TwitchManager] " .. message)

			if self._connection_failure_callback then
				self._connection_failure_callback(message)
			end
		end
	else
		local message = Localize("start_game_window_twitch_error_generic")

		Application.error("[TwitchManager] " .. message)

		if self._connection_failure_callback then
			self._connection_failure_callback(message)
		end
	end

	self._connecting = false
	self._connection_failure_callback = nil

	return 
end
TwitchManager.cb_on_user_streams_received = function (self, success, code, headers, data, userdata)
	self._show_result_info(self, success, code, headers, data, userdata)

	local result_data = cjson.decode(data)

	if result_data then
		local stream = result_data.stream

		if stream and type(stream) == "table" then
			local channel = stream.channel

			if channel then
				local channel_name = "#" .. channel.name
				local settings = {
					port = 6667,
					allow_send = false,
					address = "irc.chat.twitch.tv",
					channel_name = channel_name
				}

				Managers.irc:connect(nil, nil, settings, callback(self, "cb_on_notify_connected"))

				return 
			end
		end
	end

	local message = string.format(Localize("start_game_window_twitch_error_no_active_streams"), userdata[2], code)

	Application.error("[TwitchManager] " .. message)

	if self._connection_failure_callback then
		self._connection_failure_callback(message)
	end

	self._connecting = false
	self._connection_failure_callback = nil

	return 
end
TwitchManager.cb_on_notify_connected = function (self, connected)
	self._connected = connected
	self._connecting = false

	if not self._connected and self._twitch_game_mode then
		self._twitch_game_mode:destroy(true)

		self._twitch_game_mode = nil
	end

	Application.error(string.format("[TwitchManager] %s %s Twitch!", (connected and "Connected") or "Disconnected", (connected and "to") or "from"))

	local is_server = Managers.state.network and Managers.state.network.is_server

	if not connected and self._activated and is_server then
		self._popup_id = Managers.popup:queue_popup(Localize("popup_disconnected_from_twitch"), Localize("popup_header_error_twitch"), "return_to_inn", Localize("button_ok"))
		local network_manager = Managers.state.network

		if network_manager then
			local unnecessary_int = 0
			local unnecessary_index = 0
			local unnecessary_lookup = 1
			local unnecessary_user_name = ""

			network_manager.network_transmit:send_rpc_clients("rpc_update_twitch_vote", NetworkLookup.twitch_rpc_types.rpc_disconnected_from_twitch, unnecessary_int, unnecessary_user_name, unnecessary_index, unnecessary_lookup)
		end

		self._activated = false
	end

	return 
end
TwitchManager._show_result_info = function (self, success, code, headers, data, userdata)
	if not DEBUG_TWITCH then
		return 
	end

	if success then
		debug_print("")
		debug_print("RECEIVED: %s", userdata[1])

		local result_data = cjson.decode(data)

		table.dump(result_data, "DATA", 3, debug_print)
	else
		debug_print("")
		debug_print("FAILED RECEIVING: %s", userdata[1])
		debug_print("Error code: %s", code)
	end

	return 
end
TwitchManager.is_connected = function (self)
	return self._connected
end
TwitchManager.is_connecting = function (self)
	return self._connecting
end
TwitchManager.user_name = function (self)
	return self._twitch_user_name
end
TwitchManager.cb_game_session_disconnect = function (self)
	return 
end
TwitchManager.add_game_object_id = function (self, game_object_id)
	local game = Managers.state.network and Managers.state.network:game()

	if game then
		local vote_key = GameSession.game_object_field(game, game_object_id, "vote_key")
		self._game_object_ids[vote_key] = game_object_id
		self._vote_key_to_go_id[game_object_id] = vote_key

		self._register_networked_vote(self, game_object_id)
	end

	return 
end
TwitchManager.remove_game_object_id = function (self, game_object_id)
	local game = Managers.state.network and Managers.state.network:game()

	if game then
		local vote_key = self._vote_key_to_go_id[game_object_id]
		self._game_object_ids[vote_key] = nil
		self._vote_key_to_go_id[game_object_id] = nil

		self.unregister_vote(self, vote_key)
	end

	return 
end
TwitchManager._update_game_object = function (self, vote_key, vote_data)
	local network_manager = Managers.state.network
	local game = network_manager.game(network_manager)
	local time = math.ceil(vote_data.timer)

	if game then
		local go_id = self._game_object_ids[vote_key]

		if go_id then
			GameSession.set_game_object_field(game, go_id, "options", vote_data.options)
			GameSession.set_game_object_field(game, go_id, "time", math.max(math.ceil(vote_data.timer), 0))
		end
	end

	return 
end
TwitchManager._register_networked_vote = function (self, game_object_id)
	local network_manager = Managers.state.network
	local game = network_manager.game(network_manager)
	local vote_key = GameSession.game_object_field(game, game_object_id, "vote_key")
	local vote_type = NetworkLookup.twitch_vote_types[GameSession.game_object_field(game, game_object_id, "vote_type")]
	local option_strings = {
		TwitchSettings[vote_type].default_vote_a_str,
		TwitchSettings[vote_type].default_vote_b_str,
		TwitchSettings[vote_type].default_vote_c_str,
		TwitchSettings[vote_type].default_vote_d_str,
		TwitchSettings[vote_type].default_vote_e_str
	}
	local options = GameSession.game_object_field(game, game_object_id, "options")
	local networked_vote_templates = GameSession.game_object_field(game, game_object_id, "vote_templates")
	local vote_templates = {}

	for idx, template_lookup in ipairs(networked_vote_templates) do
		vote_templates[idx] = rawget(NetworkLookup.twitch_vote_templates, template_lookup) or "none"
	end

	local time = GameSession.game_object_field(game, game_object_id, "time")
	local show_vote_ui = GameSession.game_object_field(game, game_object_id, "show_vote_ui")
	self._votes[#self._votes + 1] = {
		activated = true,
		timer = time,
		option_strings = option_strings,
		options = options,
		vote_templates = vote_templates,
		vote_key = vote_key,
		vote_type = vote_type,
		show_vote_ui = show_vote_ui
	}
	self._votes_lookup_table[vote_key] = self._votes[#self._votes]

	Managers.irc:register_message_callback(vote_key, Irc.CHANNEL_MSG, callback(self, "on_client_message_received"))

	if self._votes[#self._votes].show_vote_ui then
		Managers.state.event:trigger("add_vote_ui", vote_key)
	end

	return 
end
TwitchManager.register_vote = function (self, time, vote_type, validation_func, vote_templates, show_vote_ui, cb)
	local network_manager = Managers.state.network

	fassert(self._connected, "[TwitchManager] You need to be connected to be able to trigger twitch votes")
	fassert(network_manager and network_manager.game(network_manager), "[TwitchManager] You need to have an active game session to be able to register votes")

	local option_strings = {
		TwitchSettings[vote_type].default_vote_a_str,
		TwitchSettings[vote_type].default_vote_b_str,
		TwitchSettings[vote_type].default_vote_c_str,
		TwitchSettings[vote_type].default_vote_d_str,
		TwitchSettings[vote_type].default_vote_e_str
	}
	local expanded_vote_templates = {
		0,
		0,
		0,
		0
	}

	for idx, vote_template in ipairs(vote_templates) do
		expanded_vote_templates[idx] = vote_template
	end

	local vote_key = self._vote_key_index
	self._votes[#self._votes + 1] = {
		activated = false,
		timer = time,
		option_strings = option_strings,
		validation_func = validation_func,
		vote_templates = expanded_vote_templates,
		options = {
			0,
			0,
			0,
			0,
			0
		},
		user_names = {},
		cb = cb,
		vote_key = vote_key,
		vote_type = vote_type,
		show_vote_ui = show_vote_ui
	}
	self._votes_lookup_table[vote_key] = self._votes[#self._votes]

	Managers.irc:register_message_callback(vote_key, Irc.CHANNEL_MSG, callback(self, "on_message_received"))

	if not self._current_vote then
		self._activate_next_vote(self)
	end

	self._vote_key_index = 1 + self._vote_key_index % 255

	return vote_key
end
TwitchManager.unregister_vote = function (self, vote_key)
	local network_manager = Managers.state.network
	local is_server = network_manager and network_manager.is_server

	Managers.irc:unregister_message_callback(vote_key)

	self._votes_lookup_table[vote_key] = nil

	for idx, vote_table in ipairs(self._votes) do
		if vote_table.vote_key == vote_key then
			table.remove(self._votes, idx)

			break
		end
	end

	if is_server then
		local go_id = self._game_object_ids[vote_key]

		if go_id then
			local game = network_manager.game(network_manager)

			if game then
				GameSession.destroy_game_object(game, go_id)
			end

			self._game_object_ids[vote_key] = nil
		end

		if not self._current_vote or self._current_vote.vote_key == vote_key then
			self._current_vote = nil

			self._activate_next_vote(self)
		end
	end

	return 
end
TwitchManager._activate_next_vote = function (self)
	self._current_vote = self._votes[1]

	if self._current_vote then
		if self._current_vote.show_vote_ui then
			Managers.state.event:trigger("add_vote_ui", self._current_vote.vote_key)
		end

		self._current_vote.activated = true
		local network_manager = Managers.state.network

		if network_manager and network_manager.is_server and network_manager.game(network_manager) then
			local networked_vote_templates = {}

			for idx, vote_template in ipairs(self._current_vote.vote_templates) do
				networked_vote_templates[idx] = rawget(NetworkLookup.twitch_vote_templates, vote_template) or 0
			end

			local game_object_data_table = {
				go_type = NetworkLookup.go_types.twitch_vote,
				vote_key = self._current_vote.vote_key,
				options = self._current_vote.options,
				vote_type = NetworkLookup.twitch_vote_types[self._current_vote.vote_type],
				vote_templates = networked_vote_templates,
				time = self._current_vote.timer,
				show_vote_ui = self._current_vote.show_vote_ui
			}
			local callback = callback(self, "cb_game_session_disconnect")
			self._game_object_ids[self._current_vote.vote_key] = network_manager.create_game_object(network_manager, "twitch_vote", game_object_data_table, callback)
		end
	end

	return 
end
TwitchManager.get_vote_data = function (self, vote_key)
	return self._votes_lookup_table[vote_key]
end
TwitchManager.on_client_message_received = function (self, vote_key, message_type, user_name, message, parameter)
	if string.find(message, "@") then
		return 
	end

	local vote_data = self._votes_lookup_table[vote_key]

	if not vote_data then
		Application.error("TwitchManager] Something went wrong. There is no vote with the vote_key: " .. tostring(vote_key))
		self.unregister_vote(self, vote_key)

		return 
	elseif not vote_data.activated then
		return 
	end

	local message = string.lower(message)

	if Development.parameter("twitch_randomize_votes") then
		message = vote_data.option_strings[Math.random(#vote_data.option_strings)]
	end

	for idx, option_string in ipairs(vote_data.option_strings) do
		if string.find(message, option_string) then
			local unnecessary_lookup = 1

			Managers.state.network.network_transmit:send_rpc_server("rpc_update_twitch_vote", NetworkLookup.twitch_rpc_types.rpc_add_client_twitch_vote, vote_key, user_name, idx, unnecessary_lookup)

			break
		end
	end

	return 
end
TwitchManager.rpc_update_twitch_vote = function (self, sender, twitch_rpc_type, vote_key, user_name, vote_index, vote_template_id)
	local rpc_type = NetworkLookup.twitch_rpc_types[twitch_rpc_type]

	self[rpc_type](self, sender, vote_key, user_name, vote_index, vote_template_id)

	return 
end
TwitchManager.rpc_add_client_twitch_vote = function (self, sender, vote_key, user_name, vote_index, vote_template_id)
	local vote_data = self._votes_lookup_table[vote_key]

	if not vote_data then
		Application.error("TwitchManager] Something went wrong. There is no vote with the vote_key: " .. tostring(vote_key))
		self.unregister_vote(self, vote_key)

		return 
	elseif not vote_data.activated then
		return 
	end

	if not Development.parameter("twitch_allow_multiple_votes") then
		if vote_data.user_names[user_name] then
			return 
		end

		vote_data.user_names[user_name] = true
	end

	if Development.parameter("twitch_randomize_votes") then
		local vote_index = Math.random(#vote_data.option_strings)
		vote_data.options[vote_index] = vote_data.options[vote_index] + 1
	else
		vote_data.options[vote_index] = vote_data.options[vote_index] + 1
	end

	self._update_game_object(self, vote_key, vote_data)

	return 
end
TwitchManager.rpc_finish_twitch_vote = function (self, sender, vote_key, user_name, vote_index, vote_template_id)
	local is_server = Managers.state.network and Managers.state.network.is_server
	local vote_template_name = NetworkLookup.twitch_vote_templates[vote_template_id]

	debug_print("Vote results:", vote_index, vote_template_name)

	local vote_data = self._votes_lookup_table[vote_key]

	if not vote_data then
		Application.error("TwitchManager] Something went wrong. There is no vote with the vote_key: " .. tostring(vote_key))
		self.unregister_vote(self, vote_key)

		return 
	end

	local vote_template = TwitchVoteTemplates[vote_template_name]

	if vote_template then
		vote_template.on_success(is_server, vote_index)
	end

	if vote_data.show_vote_ui then
		Managers.state.event:trigger("finish_vote_ui", vote_key, vote_index)
	end

	Managers.irc:unregister_message_callback(vote_key)

	self._votes_lookup_table[vote_key] = nil

	for idx, vote_table in ipairs(self._votes) do
		if vote_table.vote_key == vote_key then
			table.remove(self._votes, idx)

			break
		end
	end

	return 
end
TwitchManager.rpc_disconnected_from_twitch = function (self, sender, vote_key, user_name, vote_index, vote_template_id)
	self._loading_popup_message = "twitch_connection_failed"

	return 
end
TwitchManager.get_twitch_popup_message = function (self)
	local message = self._loading_popup_message
	self._loading_popup_message = nil

	return message
end
TwitchManager.on_message_received = function (self, vote_key, message_type, user_name, message, parameter)
	if string.find(message, "@") then
		return 
	end

	local vote_data = self._votes_lookup_table[vote_key]

	if not vote_data then
		Application.error("TwitchManager] Something went wrong. There is no vote with the vote_key: " .. tostring(vote_key))
		self.unregister_vote(self, vote_key)

		return 
	elseif not vote_data.activated then
		return 
	end

	if not Development.parameter("twitch_allow_multiple_votes") and vote_data.user_names[user_name] then
		return 
	end

	if Development.parameter("twitch_randomize_votes") then
		message = vote_data.option_strings[Math.random(#vote_data.option_strings)]
	end

	local message = string.lower(message)
	local options = vote_data.options

	for idx, option_string in ipairs(vote_data.option_strings) do
		if string.find(message, option_string) then
			options[idx] = options[idx] + 1

			if not Development.parameter("twitch_allow_multiple_votes") then
				vote_data.user_names[user_name] = true
			end

			break
		end
	end

	self._update_game_object(self, vote_key, vote_data)

	return 
end
TwitchManager.disconnect = function (self)
	if self._connected then
		Managers.irc:force_disconnect()

		if self._twitch_game_mode then
			self._twitch_game_mode:destroy()

			self._twitch_game_mode = nil
		end
	end

	self._activated = false
	self._connecting = false

	return 
end
TwitchManager.update = function (self, dt, t)
	Profiler.start("twitch_manager")
	self._handle_popup(self)
	self._validate_data(self, dt, t)
	self._update_vote_data(self, dt, t)
	self._update_twitch_game_mode(self, dt, t)
	Profiler.stop("twitch_manager")

	return 
end
TwitchManager._handle_popup = function (self)
	if self._popup_id then
		local result = Managers.popup:query_result(self._popup_id)

		if result then
			if result == "return_to_inn" then
				Managers.state.game_mode:start_specific_level("inn_level")
			else
				Application.error(string.format("[TwitchManager] Unknown result: %s", result))
			end

			self._popup_id = nil
		end
	end

	return 
end
TwitchManager._update_vote_data = function (self, dt, t)
	local network_manager = Managers.state.network
	local is_server = network_manager and network_manager.is_server

	if is_server then
		if not self._connected then
			return 
		end

		local current_vote = self._current_vote

		if current_vote then
			current_vote.timer = current_vote.timer - dt

			self._update_game_object(self, current_vote.vote_key, current_vote)

			if current_vote.timer <= 0 then
				self._handle_results(self, current_vote)

				local cb = current_vote.cb

				if cb then
					cb(current_vote)
				end

				self.unregister_vote(self, current_vote.vote_key)
			end
		end
	else
		for vote_key, go_id in pairs(self._game_object_ids) do
			local vote_data = self._votes_lookup_table[vote_key]

			if vote_data then
				local game = Managers.state.network:game()

				if game then
					local options = GameSession.game_object_field(game, go_id, "options")
					local time = GameSession.game_object_field(game, go_id, "time")
					vote_data.options = options
					vote_data.timer = time
				end
			end
		end
	end

	return 
end
TwitchManager._handle_results = function (self, vote_results)
	local network_manager = Managers.state.network
	local is_server = network_manager.is_server
	local best_option = -1
	local best_option_index = 0
	local current_vote = self._current_vote
	local vote_type = current_vote.vote_type
	local settings_options = TwitchSettings[vote_type]
	local num_options = table.size(settings_options)
	local options = vote_results.options

	for i = 1, num_options, 1 do
		if vote_type == "multiple_choice" then
			local valid_player_index = self._valid_player_index(self, i)
		else
			local option = options[i]

			if best_option < option then
				best_option_index = i
				best_option = option
			elseif option == best_option then
				local random_winner = math.random(2)

				if random_winner == 1 then
					best_option_index = i
					best_option = option
				end
			end
		end
	end

	local vote_template_name = vote_results.vote_templates[best_option_index]

	if not Development.parameter("twitch_disable_result") then
		TwitchVoteTemplates[vote_template_name].on_success(is_server, best_option_index)
	else
		vote_template_name = "none"
	end

	if vote_results.show_vote_ui then
		Managers.state.event:trigger("finish_vote_ui", vote_results.vote_key, best_option_index)
	end

	local unnecessary_user_name = ""

	Managers.state.network.network_transmit:send_rpc_clients("rpc_update_twitch_vote", NetworkLookup.twitch_rpc_types.rpc_finish_twitch_vote, vote_results.vote_key, unnecessary_user_name, best_option_index, NetworkLookup.twitch_vote_templates[vote_template_name])

	return 
end
TwitchManager._valid_player_index = function (self, index)
	local players = Managers.player:human_and_bot_players()

	for peer_id, player in pairs(players) do
		local profile_index = player.profile_index(player)

		if index == profile_index then
			return true
		end
	end

	return false
end
TwitchManager._validate_data = function (self, dt, t)
	local current_vote = self._current_vote

	if current_vote then
		local validation_func = current_vote.validation_func

		if validation_func then
			validation_func(current_vote)
		end
	end

	return 
end
TwitchManager.is_activated = function (self)
	return self._activated
end
TwitchManager.destroy = function (self)
	if Managers.state and Managers.state.event then
		Managers.state.event:trigger("reset_vote_ui")
	end

	self.disconnect(self)

	return 
end
TwitchManager.activate_twitch_game_mode = function (self, network_event_delegate, game_mode_key)
	if Development.parameter("twitch_debug_voting") then
		self._connected = true
	end

	local network_manager = Managers.state.network and Managers.state.network
	local is_server = network_manager and network_manager.is_server

	if game_mode_key == "adventure" then
		Managers.state.event:trigger("activate_twitch_game_mode")

		self._network_event_delegate = network_event_delegate

		network_event_delegate.register(network_event_delegate, self, unpack(RPCS))

		if is_server and self._connected then
			self._twitch_game_mode = TwitchGameMode:new(self)
		end

		local lobby = network_manager.lobby(network_manager)
		self._activated = (lobby.lobby_data(lobby, "twitch_enabled") == "true" and true) or false

		if Development.parameter("twitch_debug_voting") then
			self._activated = true
		end
	end

	return 
end
TwitchManager.debug_activate_twitch_game_mode = function (self)
	local twitch_debug_voting = Development.parameter("twitch_debug_voting")

	if twitch_debug_voting then
		Managers.state.event:trigger("activate_twitch_game_mode")

		self._twitch_game_mode = TwitchGameMode:new(self)
		self._activated = true
		self._connected = true
	else
		self.deactivate_twitch_game_mode(self)
	end

	return 
end
TwitchManager.deactivate_twitch_game_mode = function (self)
	if self._network_event_delegate then
		self._network_event_delegate:unregister(self)

		self._network_event_delegate = nil
	end

	if self._twitch_game_mode then
		self._twitch_game_mode:destroy()

		self._twitch_game_mode = nil
	end

	self._activated = false

	return 
end
TwitchManager._update_twitch_game_mode = function (self, dt, t)
	if not self._twitch_game_mode or not self._connected then
		return 
	end

	self._twitch_game_mode:update(dt, t)

	if Development.parameter("twitch_debug_voting") then
		self._update_debug_voting(self, dt)
	end

	return 
end
local debug_messages = {
	"default_vote_a_str",
	"default_vote_b_str",
	"default_vote_c_str",
	"default_vote_d_str",
	"default_vote_e_str"
}
TwitchManager._update_debug_voting = function (self, dt)
	self._debug_vote_timer = self._debug_vote_timer - dt

	if 0 < self._debug_vote_timer then
		return 
	end

	local current_vote = self._current_vote

	if not current_vote then
		return 
	end

	local message_index = nil
	local vote_type = current_vote.vote_type

	if vote_type == "standard_vote" then
		local debug_result = math.random(2)
		message_index = debug_messages[debug_result]
	else
		local debug_result = math.random(5)
		local valid_player_index = self._valid_player_index(self, debug_result)

		if not valid_player_index then
			return 
		end

		message_index = debug_messages[debug_result]
	end

	local message = TwitchSettings.multiple_choice[message_index]
	local options = current_vote.options
	local option_strings = current_vote.option_strings

	for idx, option_string in ipairs(option_strings) do
		if string.find(message, option_string) then
			options[idx] = options[idx] + 1

			break
		end
	end

	local vote_key = current_vote.vote_key

	self._update_game_object(self, vote_key, current_vote)

	self._debug_vote_timer = 0.25

	return 
end
TwitchGameMode = class(TwitchGameMode)
TwitchGameMode.init = function (self, parent)
	self._timer = TwitchSettings.initial_downtime
	self._max_diff = TwitchSettings.max_diff
	self._funds = TwitchSettings.funds
	self._parent = parent
	self._vote_keys = {}

	Debug.text("Activating Twitch Game Mode")

	return 
end
TwitchGameMode.update = function (self, dt, t)
	self._timer = self._timer - dt

	if 0 < self._timer then
		return 
	end

	local game = Managers.state.network and Managers.state.network:game()

	if game then
		self._trigger_new_vote(self)
	end

	return 
end
TwitchGameMode._decide_next_vote_templates = function (self)
	if math.random(3) % 3 == 0 then
		return self._next_multiple_choice_vote(self)
	else
		return self._next_standard_vote(self)
	end

	return 
end
TwitchGameMode._next_multiple_choice_vote = function (self)
	local vote_templates = {}
	local vote_template = TwitchMultipleChoiceVoteTemplatesLookup[Math.random(#TwitchMultipleChoiceVoteTemplatesLookup)]

	for idx = 1, 5, 1 do
		vote_templates[idx] = vote_template
	end

	local validation_func = TwitchVoteTemplates[vote_template].validation_func

	return "multiple_choice", vote_templates, validation_func
end
TwitchGameMode._get_first_option = function (self)
	local want_positive_effect = self._funds < TwitchSettings.cutoff_for_guaranteed_positive_vote
	local templates = nil

	if want_positive_effect then
		templates = TwitchPositiveStandardVoteTemplatesLookup
	elseif math.random(3) % 3 == 0 then
		templates = TwitchStandardVoteTemplatesLookup
	else
		templates = TwitchNegativeStandardVoteTemplatesLookup
	end

	local num_templates = #templates
	local random_template_index = Math.random(num_templates)
	local vote_template_name = templates[random_template_index]
	local selected_vote_info = TwitchVoteTemplates[vote_template_name]

	return selected_vote_info, vote_template_name
end
TwitchGameMode._next_standard_vote = function (self)
	self._selected_templates = self._selected_templates or {}
	local selected_templates = self._selected_templates
	local first_vote_info, first_template_name = self._get_first_option(self)
	local first_vote_cost = first_vote_info.cost
	local first_is_positive = first_vote_cost < 0
	local sign = math.sign(first_vote_cost)
	local sign_diff = (0 < sign and -1) or 1
	local best_template_diff = math.huge
	local best_template_name, total_cost = nil
	selected_templates[first_template_name] = true

	for selected_template_name, vote_info in pairs(TwitchVoteTemplates) do
		if not selected_templates[selected_template_name] and not vote_info.multiple_choice and selected_template_name ~= first_template_name then
			local second_vote_cost = vote_info.cost
			local second_is_positive = second_vote_cost < 0

			if first_is_positive ~= second_is_positive and 5 < math.random(1, 100) then
			else
				local diff = first_vote_cost - second_vote_cost * sign_diff

				if diff < best_template_diff then
					best_template_name = selected_template_name
					best_template_diff = diff
					total_cost = first_vote_cost + second_vote_cost
				end
			end
		end
	end

	if not best_template_name or self._max_diff < best_template_diff then
		table.clear(selected_templates)

		return self._next_standard_vote(self)
	else
		self._funds = self._funds - total_cost
		selected_templates[best_template_name] = true
		local vote_templates = {
			first_template_name,
			best_template_name
		}

		return "standard_vote", vote_templates, nil
	end

	return 
end
TwitchGameMode._trigger_new_vote = function (self)
	local vote_type, vote_templates, validation_func = self._decide_next_vote_templates(self)
	local time = TwitchSettings.default_vote_time
	local vote_key = self._parent:register_vote(time, vote_type, validation_func, vote_templates, true, callback(self, "cb_on_vote_complete"))
	self._vote_keys[vote_key] = true
	self._timer = TwitchSettings.default_downtime + time

	return 
end
TwitchGameMode.cb_on_vote_complete = function (self, current_vote)
	self._vote_keys[current_vote.vote_key] = nil

	return 
end
TwitchGameMode.destroy = function (self)
	debug_print("Destroying Twitch Game mode")

	for vote_key, _ in pairs(self._vote_keys) do
		if Managers.state and Managers.state.event then
			Managers.state.event:trigger("reset_vote_ui", vote_key)
		end

		self._parent:unregister_vote(vote_key)
		debug_print("Destroying Twitch Vote %s", vote_key)
	end

	if Managers.state and Managers.state.event then
		Managers.state.event:trigger("reset_vote_ui")
	end

	return 
end

return 

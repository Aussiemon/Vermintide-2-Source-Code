-- chunkname: @scripts/managers/twitch/twitch_manager.lua

require("scripts/settings/twitch_settings")

DEBUG_TWITCH = false

local NUM_ROUNDS_TO_DISABLE_USED_VOTES = 15
local MIN_VOTES_LEFT_IN_ROTATION = 2
local MAX_NUM_RETRIES = 6
local TIME_BETWEEN_RETRY = 5

local function debug_print(message, ...)
	if DEBUG_TWITCH then
		if type(message) == "table" then
			table.dump(message, "[TwitchManager]")
		else
			print("[TwitchManager] " .. string.format(message, ...))
		end
	end
end

local RPCS = {
	"rpc_update_twitch_vote",
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
	self._sound_bank_loaded = false
	self._twitch_user_name = ""
	self._game_object_ids = {}
	self._vote_key_to_go_id = {}
	self.locked_breed_packages = {}

	if not IS_WINDOWS then
		self._rest_interface = Managers.rest_transport
	else
		self._rest_interface = Managers.curl
	end

	local settings = Application.settings()

	self._twitch_settings = settings.twitch

	debug_print(Application.settings("twitch"))

	TwitchSettings.default_downtime = math.max(1, Application.user_setting("twitch_time_between_votes"))
	TwitchSettings.default_vote_time = math.max(1, Application.user_setting("twitch_vote_time"))
	TwitchSettings.difficulty = Application.user_setting("twitch_difficulty")

	local disable_positive_votes_setting = Application.user_setting("twitch_disable_positive_votes")

	TwitchSettings.disable_giving_items = disable_positive_votes_setting == TwitchSettings.positive_vote_options.disable_giving_items or disable_positive_votes_setting == TwitchSettings.positive_vote_options.disable_positive_votes
	TwitchSettings.disable_positive_votes = disable_positive_votes_setting == TwitchSettings.positive_vote_options.disable_positive_votes
	TwitchSettings.disable_mutators = Application.user_setting("twitch_disable_mutators")
	TwitchSettings.spawn_amount_multiplier = math.clamp(Application.user_setting("twitch_spawn_amount"), 1, 3)
	TwitchSettings.mutator_duration_multiplier = math.clamp(Application.user_setting("twitch_mutator_duration"), 1, 3)

	if TwitchSettings.default_downtime + TwitchSettings.default_vote_time < 5 then
		TwitchSettings.default_downtime = 1
		TwitchSettings.default_vote_time = 5
	end

	self._debug_vote_timer = 0.25
end

local twitch_difficulty_override = {
	cataclysm = true,
	cataclysm_2 = true,
	cataclysm_3 = true,
	hardest = true,
}

TwitchManager.game_mode_supported = function (self, game_mode, difficulty)
	local supported_game_modes = TwitchSettings.supported_game_modes[PLATFORM]
	local supported = not not supported_game_modes[game_mode] or not not twitch_difficulty_override[difficulty]

	return supported
end

TwitchManager.stream_type = function (self)
	return "twitch"
end

TwitchManager._load_sound_bank = function (self)
	if not self._sound_bank_loaded then
		local package_to_load = "resource_packages/ingame_sounds_twitch_mode"

		debug_print("Loading twitch mode sound bank resource package %s", package_to_load)
		Managers.package:load(package_to_load, "twitch", nil, true)

		self._sound_bank_loaded = true
	end
end

TwitchManager._unload_sound_bank = function (self)
	if self._sound_bank_loaded then
		local package_to_unload = "resource_packages/ingame_sounds_twitch_mode"

		debug_print("Unloading twitch mode sound bank resource package %s", package_to_unload)
		Managers.package:unload(package_to_unload, "twitch")

		self._sound_bank_loaded = false
	end
end

TwitchManager.connect = function (self, twitch_user_name, optional_connection_failure_callback, optional_connection_success_callback, is_retry)
	fassert(twitch_user_name, "[TwitchManager] You need to provide a user name to connect")

	local url = "https://api.twitch.tv/helix/users?login=" .. twitch_user_name
	local options = {}

	if IS_WINDOWS then
		options[Managers.curl._curl.OPT_SSL_OPTIONS] = Managers.curl._curl.SSLOPT_NO_REVOKE
	end

	local headers

	if IS_CONSOLE then
		headers = {
			"Content-Type",
			"application/json",
			"Client-ID",
			self._twitch_settings.client_id,
			"Authorization",
			"Bearer " .. Managers.backend:get_twitch_app_access_token(),
		}
	else
		headers = {
			"Content-Type: application/json",
			"Client-ID: " .. self._twitch_settings.client_id,
			"Authorization: Bearer " .. Managers.backend:get_twitch_app_access_token(),
		}
	end

	self._headers = headers
	self._connecting = true
	self._connection_failure_callback = optional_connection_failure_callback
	self._connection_success_callback = optional_connection_success_callback
	self._twitch_user_name = twitch_user_name

	if not is_retry then
		self._num_retries = 0
	end

	self._rest_interface:get(url, self._headers, callback(self, "cb_on_user_info_received"), {
		"User Data",
		twitch_user_name,
	}, options)
end

TwitchManager.cb_on_user_info_received = function (self, success, code, headers, data, userdata)
	self:_show_result_info(success, code, headers, data, userdata)

	if success then
		local result_data = cjson.decode(data)

		if result_data then
			if result_data.status == 401 and self._num_retries < MAX_NUM_RETRIES then
				self._should_retry = true
				self._next_retry_time = Managers.time:time("main") + TIME_BETWEEN_RETRY
			elseif result_data.error then
				local message = string.format(Localize("start_game_window_twitch_error_connection"), result_data.message, result_data.error, code)

				Application.error("[TwitchManager] " .. message)

				if self._connection_failure_callback then
					self._connection_failure_callback(message)
				end
			elseif result_data.data and #result_data.data > 0 then
				local user_data = result_data.data[1]
				local user_id = user_data.id
				local twitch_user_name = user_data.login

				if self._connection_success_callback then
					self._connection_success_callback(user_data)
				end

				local url = "https://api.twitch.tv/helix/streams?user_id=" .. user_id
				local options = {}

				self._rest_interface:get(url, self._headers, callback(self, "cb_on_user_streams_received"), {
					"User Data",
					twitch_user_name,
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
	elseif self._num_retries < MAX_NUM_RETRIES then
		self._should_retry = true
		self._next_retry_time = Managers.time:time("main") + TIME_BETWEEN_RETRY
	else
		local message = Localize("start_game_window_twitch_error_generic")

		Application.error("[TwitchManager] " .. message)

		if self._connection_failure_callback then
			self._connection_failure_callback(message)
		end
	end

	if not self._should_retry then
		self._connecting = false
		self._connection_failure_callback = nil
	end
end

TwitchManager.cb_request_twitch_access_token = function (self, token)
	self._num_retries = self._num_retries + 1

	if token then
		self:connect(self._twitch_user_name, self._connection_failure_callback, self._connection_success_callback, true)
	else
		local message = Localize("start_game_window_twitch_error_generic")

		Application.error("[TwitchManager] " .. message)

		if self._connection_failure_callback then
			self._connection_failure_callback(message)
		end

		self._connecting = false
		self._connection_failure_callback = nil
	end
end

TwitchManager.cb_on_user_streams_received = function (self, success, code, headers, data, userdata)
	self:_show_result_info(success, code, headers, data, userdata)

	if success then
		local result_data = cjson.decode(data)

		if result_data then
			local stream = result_data.data[1]

			if stream and type(stream) == "table" then
				local channel = stream.user_login

				if channel then
					local channel_name = "#" .. channel
					local settings = {
						address = "irc.chat.twitch.tv",
						allow_send = false,
						port = 6667,
						channel_name = channel_name,
					}

					Managers.irc:connect(nil, nil, settings, callback(self, "cb_on_notify_connected"))

					return
				end
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
end

TwitchManager.cb_on_notify_connected = function (self, connected)
	self._connected = connected
	self._connecting = false

	if not self._connected and self._twitch_game_mode then
		self._twitch_game_mode:destroy(true)

		self._twitch_game_mode = nil
	end

	Application.error(string.format("[TwitchManager] %s %s Twitch!", connected and "Connected" or "Disconnected", connected and "to" or "from"))

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

TwitchManager.cb_connection_error_callback = function (self, message)
	if not self._error_popup_id then
		self._error_popup_id = Managers.popup:queue_popup(message, Localize("popup_header_error_twitch"), "ok", Localize("popup_choice_ok"))
	end
end

TwitchManager.add_game_object_id = function (self, game_object_id)
	local game = Managers.state.network and Managers.state.network:game()

	if game then
		local vote_key = GameSession.game_object_field(game, game_object_id, "vote_key")

		self._game_object_ids[vote_key] = game_object_id
		self._vote_key_to_go_id[game_object_id] = vote_key

		self:_register_networked_vote(game_object_id)
	end
end

TwitchManager.remove_game_object_id = function (self, game_object_id)
	local game = Managers.state.network and Managers.state.network:game()

	if game then
		local vote_key = self._vote_key_to_go_id[game_object_id]

		self._game_object_ids[vote_key] = nil
		self._vote_key_to_go_id[game_object_id] = nil

		self:unregister_vote(vote_key)
	end
end

TwitchManager._update_game_object = function (self, vote_key, vote_data)
	local game = Managers.state.network and Managers.state.network:game()

	if game then
		local go_id = self._game_object_ids[vote_key]

		if go_id then
			GameSession.set_game_object_field(game, go_id, "options", vote_data.options)
			GameSession.set_game_object_field(game, go_id, "time", math.max(math.ceil(vote_data.timer), 0))
		end
	end
end

TwitchManager._register_networked_vote = function (self, game_object_id)
	local game = Managers.state.network and Managers.state.network:game()

	fassert(game, "[TwitchManager] You need to have an active game session to be able to register votes")

	local vote_key = GameSession.game_object_field(game, game_object_id, "vote_key")
	local vote_type = NetworkLookup.twitch_vote_types[GameSession.game_object_field(game, game_object_id, "vote_type")]
	local option_strings = {
		TwitchSettings[vote_type].default_vote_a_str,
		TwitchSettings[vote_type].default_vote_b_str,
		TwitchSettings[vote_type].default_vote_c_str,
		TwitchSettings[vote_type].default_vote_d_str,
		TwitchSettings[vote_type].default_vote_e_str,
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
		show_vote_ui = show_vote_ui,
	}
	self._votes_lookup_table[vote_key] = self._votes[#self._votes]

	Managers.irc:register_message_callback(vote_key, Irc.CHANNEL_MSG, callback(self, "on_client_message_received"))

	if self._votes[#self._votes].show_vote_ui then
		Managers.state.event:trigger("add_vote_ui", vote_key)
	end
end

TwitchManager.register_vote = function (self, time, vote_type, validation_func, vote_templates, show_vote_ui, cb)
	local network_manager = Managers.state.network

	fassert(self._connected, "[TwitchManager] You need to be connected to be able to trigger twitch votes")
	fassert(network_manager and network_manager:game(), "[TwitchManager] You need to have an active game session to be able to register votes")

	local option_strings = {
		TwitchSettings[vote_type].default_vote_a_str,
		TwitchSettings[vote_type].default_vote_b_str,
		TwitchSettings[vote_type].default_vote_c_str,
		TwitchSettings[vote_type].default_vote_d_str,
		TwitchSettings[vote_type].default_vote_e_str,
	}
	local expanded_vote_templates = {
		0,
		0,
		0,
		0,
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
			0,
		},
		user_names = {},
		cb = cb,
		vote_key = vote_key,
		vote_type = vote_type,
		show_vote_ui = show_vote_ui,
	}
	self._votes_lookup_table[vote_key] = self._votes[#self._votes]

	Managers.irc:register_message_callback(vote_key, Irc.CHANNEL_MSG, callback(self, "on_message_received"))

	if not self._current_vote then
		self:_activate_next_vote()
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
			local game = network_manager:game()

			if game then
				GameSession.destroy_game_object(game, go_id)
			end

			self._game_object_ids[vote_key] = nil
		end

		if not self._current_vote or self._current_vote.vote_key == vote_key then
			self._current_vote = nil

			self:_activate_next_vote()
		end
	end
end

TwitchManager._activate_next_vote = function (self)
	self._current_vote = self._votes[1]

	if self._current_vote then
		if self._current_vote.show_vote_ui then
			Managers.state.event:trigger("add_vote_ui", self._current_vote.vote_key)
		end

		self._current_vote.activated = true

		local network_manager = Managers.state.network

		if network_manager and network_manager.is_server and network_manager:game() then
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
				show_vote_ui = self._current_vote.show_vote_ui,
			}
			local callback = callback(self, "cb_game_session_disconnect")

			self._game_object_ids[self._current_vote.vote_key] = network_manager:create_game_object("twitch_vote", game_object_data_table, callback)
		end
	end
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
		self:unregister_vote(vote_key)

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
end

TwitchManager.rpc_update_twitch_vote = function (self, channel_id, twitch_rpc_type, vote_key, user_name, vote_index, vote_template_id)
	local rpc_type = NetworkLookup.twitch_rpc_types[twitch_rpc_type]

	self[rpc_type](self, channel_id, vote_key, user_name, vote_index, vote_template_id)
end

TwitchManager.rpc_add_client_twitch_vote = function (self, channel_id, vote_key, user_name, vote_index, vote_template_id)
	local vote_data = self._votes_lookup_table[vote_key]

	if not vote_data then
		Application.error("TwitchManager] Something went wrong. There is no vote with the vote_key: " .. tostring(vote_key))
		self:unregister_vote(vote_key)

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

	self:_update_game_object(vote_key, vote_data)
end

TwitchManager.rpc_finish_twitch_vote = function (self, channel_id, vote_key, user_name, vote_index, vote_template_id)
	local is_server = Managers.state.network and Managers.state.network.is_server
	local vote_template_name = NetworkLookup.twitch_vote_templates[vote_template_id]

	debug_print("Vote results:", vote_index, vote_template_name)

	local vote_data = self._votes_lookup_table[vote_key]

	if not vote_data then
		Application.error("TwitchManager] Something went wrong. There is no vote with the vote_key: " .. tostring(vote_key))
		self:unregister_vote(vote_key)

		return
	end

	local vote_template = TwitchVoteTemplates[vote_template_name]

	if vote_template then
		vote_template.on_success(is_server, vote_index, vote_template)
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
end

TwitchManager.rpc_disconnected_from_twitch = function (self, channel_id, vote_key, user_name, vote_index, vote_template_id)
	self._loading_popup_message = "twitch_connection_failed"
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
		self:unregister_vote(vote_key)

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

	self:_update_game_object(vote_key, vote_data)
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
end

TwitchManager.update = function (self, dt, t)
	self:_handle_disconnect_popup()
	self:_handle_popup()
	self:_validate_data(dt, t)
	self:_update_vote_data(dt, t)
	self:_update_twitch_game_mode(dt, t)

	if self._should_retry and t >= self._next_retry_time then
		self._should_retry = false

		local live_event_interface = Managers.backend:get_interface("live_events")

		live_event_interface:request_twitch_app_access_token(callback(self, "cb_request_twitch_access_token"))
	end
end

TwitchManager._handle_popup = function (self)
	if self._popup_id then
		local result = Managers.popup:query_result(self._popup_id)

		if result then
			if result == "return_to_inn" then
				local mechanism = Managers.mechanism:game_mechanism()
				local inn_level_name = mechanism:get_hub_level_key()

				Managers.state.game_mode:start_specific_level(inn_level_name)
			else
				Application.error(string.format("[TwitchManager] Unknown result: %s", result))
			end

			self._popup_id = nil
		end
	end
end

TwitchManager._handle_disconnect_popup = function (self)
	if self._error_popup_id then
		local result = Managers.popup:query_result(self._error_popup_id)

		if result then
			if result == "ok" then
				self._error_popup_id = nil
			elseif result then
				fassert(false, "[TwitchManager] The popup result doesn't exist (%s)", result)
			end
		end
	end
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

			self:_update_game_object(current_vote.vote_key, current_vote)

			if current_vote.timer <= 0 then
				self:_handle_results(current_vote)

				local cb = current_vote.cb

				if cb then
					cb(current_vote)
				end

				self:unregister_vote(current_vote.vote_key)
			end
		end
	else
		for vote_key, go_id in pairs(self._game_object_ids) do
			local vote_data = self._votes_lookup_table[vote_key]

			if vote_data then
				local game = Managers.state.network and Managers.state.network:game()

				if game then
					local options = GameSession.game_object_field(game, go_id, "options")
					local time = GameSession.game_object_field(game, go_id, "time")

					vote_data.options = options
					vote_data.timer = time
				end
			end
		end
	end
end

TwitchManager._handle_results = function (self, vote_results)
	local package_loader = Managers.level_transition_handler.enemy_package_loader
	local network_manager = Managers.state.network
	local is_server = network_manager.is_server
	local best_option = -1
	local best_option_index = 0
	local current_vote = self._current_vote
	local vote_type = current_vote.vote_type
	local settings_options = TwitchSettings[vote_type]
	local num_options = table.size(settings_options)
	local options = vote_results.options

	for i = 1, num_options do
		repeat
			if vote_type == "multiple_choice" then
				local valid_player_index = self:_valid_player_index(i)

				if not valid_player_index then
					break
				end
			end

			local option = options[i]

			if best_option < option then
				best_option_index = i
				best_option = option

				break
			end

			if option == best_option then
				local random_winner = math.random(2)

				if random_winner == 1 then
					best_option_index = i
					best_option = option
				end
			end
		until true
	end

	for i = 1, num_options do
		local vote_template_name = vote_results.vote_templates[i]
		local vote_template = TwitchVoteTemplates[vote_template_name]
		local breed_name = vote_template.breed_name

		if breed_name and self.locked_breed_packages[breed_name] then
			package_loader:unlock_breed_package(breed_name)

			self.locked_breed_packages[breed_name] = nil
		end
	end

	local override_template_name
	local vote_template_name = override_template_name or vote_results.vote_templates[best_option_index]

	vote_results.winning_template_name = vote_template_name

	local vote_template = TwitchVoteTemplates[vote_template_name]

	if not Development.parameter("twitch_disable_result") then
		vote_template.on_success(is_server, best_option_index, vote_template)
	else
		vote_template_name = "none"
	end

	if vote_results.show_vote_ui then
		Managers.state.event:trigger("finish_vote_ui", vote_results.vote_key, best_option_index)
	end

	local unnecessary_user_name = ""

	Managers.state.network.network_transmit:send_rpc_clients("rpc_update_twitch_vote", NetworkLookup.twitch_rpc_types.rpc_finish_twitch_vote, vote_results.vote_key, unnecessary_user_name, best_option_index, NetworkLookup.twitch_vote_templates[vote_template_name])
end

TwitchManager._valid_player_index = function (self, index)
	local players = Managers.player:human_and_bot_players()

	for peer_id, player in pairs(players) do
		local profile_index = player:profile_index()

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
end

TwitchManager.is_activated = function (self)
	return self._activated
end

TwitchManager.reset = function (self)
	self:destroy()
end

TwitchManager.destroy = function (self)
	if Managers.state and Managers.state.event then
		Managers.state.event:trigger("reset_vote_ui")
	end

	self:disconnect()
end

TwitchManager.activate_twitch_game_mode = function (self, network_event_delegate, game_mode_key)
	if Development.parameter("twitch_debug_voting") then
		self._connected = true
	end

	TwitchSettings.default_downtime = Application.user_setting("twitch_time_between_votes") or TwitchSettings.default_downtime
	TwitchSettings.default_vote_time = Application.user_setting("twitch_vote_time") or TwitchSettings.default_vote_time
	TwitchSettings.difficulty = Application.user_setting("twitch_difficulty") or TwitchSettings.difficulty

	local disable_positive_votes_setting = Application.user_setting("twitch_disable_positive_votes")

	TwitchSettings.disable_giving_items = disable_positive_votes_setting == TwitchSettings.positive_vote_options.disable_giving_items or disable_positive_votes_setting == TwitchSettings.positive_vote_options.disable_positive_votes
	TwitchSettings.disable_positive_votes = disable_positive_votes_setting == TwitchSettings.positive_vote_options.disable_positive_votes
	TwitchSettings.disable_mutators = Application.user_setting("twitch_disable_mutators")
	TwitchSettings.spawn_amount_multiplier = math.clamp(Application.user_setting("twitch_spawn_amount"), 1, 3)
	TwitchSettings.mutator_duration_multiplier = math.clamp(Application.user_setting("twitch_mutator_duration"), 1, 3)

	local network_manager = Managers.state.network and Managers.state.network
	local is_server = network_manager and network_manager.is_server

	if self:game_mode_supported(game_mode_key) then
		Managers.state.event:trigger("activate_twitch_game_mode")

		self._network_event_delegate = network_event_delegate

		network_event_delegate:register(self, unpack(RPCS))

		if self._connected then
			if is_server then
				self._twitch_game_mode = TwitchGameMode:new(self)
			end

			self:_load_sound_bank()
		end

		local lobby = network_manager:lobby()

		self._activated = lobby:lobby_data("twitch_enabled") == "true" and true or false

		if Development.parameter("twitch_debug_voting") then
			self._activated = true
		end

		if self._activated then
			Managers.telemetry_events:twitch_mode_activated()
		end
	end
end

TwitchManager.debug_activate_twitch_game_mode = function (self)
	local twitch_debug_voting = Development.parameter("twitch_debug_voting")

	if twitch_debug_voting then
		Managers.state.event:trigger("activate_twitch_game_mode")
		Managers.telemetry_events:twitch_mode_activated()

		self._twitch_game_mode = TwitchGameMode:new(self)

		self:_load_sound_bank()

		self._activated = true
		self._connected = true
	else
		self:deactivate_twitch_game_mode()
	end
end

TwitchManager.deactivate_twitch_game_mode = function (self)
	if self._current_vote then
		self:unregister_vote(self._current_vote.vote_key)
	end

	if self._network_event_delegate then
		self._network_event_delegate:unregister(self)

		self._network_event_delegate = nil
	end

	if self._twitch_game_mode then
		self._twitch_game_mode:destroy()

		self._twitch_game_mode = nil
	end

	self._activated = false

	self:_unload_sound_bank()
end

TwitchManager._update_twitch_game_mode = function (self, dt, t)
	if not self._twitch_game_mode or not self._connected then
		return
	end

	self._twitch_game_mode:update(dt, t)

	if Development.parameter("twitch_debug_voting") then
		self:_update_debug_voting(dt)
	end
end

local debug_messages = {
	"default_vote_a_str",
	"default_vote_b_str",
	"default_vote_c_str",
	"default_vote_d_str",
	"default_vote_e_str",
}

TwitchManager._update_debug_voting = function (self, dt)
	self._debug_vote_timer = self._debug_vote_timer - dt

	if self._debug_vote_timer > 0 then
		return
	end

	local current_vote = self._current_vote

	if not current_vote then
		return
	end

	local message_index
	local vote_type = current_vote.vote_type

	if vote_type == "standard_vote" then
		local debug_result = script_data.twitch_mode_force_vote_template and 1 or math.random(2)

		message_index = debug_messages[debug_result]
	else
		local debug_result = math.random(5)
		local valid_player_index = self:_valid_player_index(debug_result)

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

	self:_update_game_object(vote_key, current_vote)

	self._debug_vote_timer = 0.25
end

TwitchGameMode = class(TwitchGameMode)

TwitchGameMode.init = function (self, parent)
	self._timer = TwitchSettings.initial_downtime
	self._funds = TwitchSettings.starting_funds
	self._parent = parent
	self._vote_keys = {}
	self._used_vote_templates = {}

	Debug.text("Activating Twitch Game Mode")
end

TwitchGameMode.update = function (self, dt, t)
	self._timer = self._timer - dt

	if self._timer > 0 then
		return
	end

	local game = Managers.state.network and Managers.state.network:game()

	if game then
		self:_trigger_new_vote()
	end
end

TwitchGameMode._update_used_votes = function (self)
	local used_vote_templates = self._used_vote_templates

	for template_name, rounds_left in pairs(used_vote_templates) do
		if rounds_left - 1 == 0 then
			used_vote_templates[template_name] = nil
		else
			used_vote_templates[template_name] = rounds_left - 1
		end
	end

	self:_clear_used_votes()
end

TwitchGameMode._clear_used_votes = function (self, force_clear)
	local used_vote_templates = self._used_vote_templates
	local game_mode_whitelist = self:_get_game_mode_whitelist()
	local num_available_vote_templates = game_mode_whitelist and #game_mode_whitelist or #TwitchVoteTemplatesLookup

	if force_clear or num_available_vote_templates - table.size(used_vote_templates) <= MIN_VOTES_LEFT_IN_ROTATION then
		table.clear(used_vote_templates)
	end
end

TwitchGameMode._check_breed_package_loading = function (self, wanted_template, previous_template)
	local wanted_breed_name = wanted_template.breed_name

	if not wanted_breed_name then
		return wanted_template
	end

	local is_boss = wanted_template.boss
	local is_special = wanted_template.special

	if not is_boss and not is_special then
		return wanted_template
	end

	local package_loader = Managers.level_transition_handler.enemy_package_loader
	local request_success, replacement_breed_name = true

	if not package_loader:is_breed_processed(wanted_breed_name) then
		request_success = package_loader:request_breed(wanted_breed_name)
	end

	if request_success then
		package_loader:lock_breed_package(wanted_breed_name)

		self._parent.locked_breed_packages[wanted_breed_name] = true

		return wanted_template
	else
		local replacement_breeds = {}

		for breed_name, _ in pairs(package_loader:processed_breeds()) do
			replacement_breeds[#replacement_breeds + 1] = breed_name
		end

		table.shuffle(replacement_breeds)

		local templates = is_boss and TwitchBossesSpawnBreedNamesLookup or is_special and TwitchSpecialsSpawnBreedNamesLookup

		for i = 1, #replacement_breeds do
			local breed_name = replacement_breeds[i]

			if templates[breed_name] then
				replacement_breed_name = breed_name

				break
			end
		end
	end

	local use_boss_equivalent = is_boss and previous_template and previous_template.breed_name == replacement_breed_name
	local override_template
	local used_vote_templates = self._used_vote_templates

	if use_boss_equivalent then
		local best_diff = math.huge
		local templates = TwitchBossEquivalentSpawnTemplatesLookup

		table.shuffle(templates)

		for i = 1, #templates do
			local replacement_template_name = templates[i]

			if not used_vote_templates[replacement_template_name] then
				local replacement_template = TwitchVoteTemplates[replacement_template_name]

				if wanted_template.name ~= replacement_template.name then
					local diff = math.abs(math.abs(wanted_template.cost) - math.abs(replacement_template.cost))

					if diff < best_diff then
						override_template = replacement_template
						best_diff = diff
					end
				end
			end
		end
	elseif is_boss then
		local templates = TwitchBossesSpawnBreedNamesLookup
		local replacement_template = templates[replacement_breed_name]

		override_template = replacement_template
	elseif is_special then
		local templates = TwitchSpecialsSpawnBreedNamesLookup
		local replacement_template = templates[replacement_breed_name]

		if not used_vote_templates[replacement_template.name] and (previous_template == nil or previous_template and previous_template.name ~= replacement_template.name) and wanted_template.name ~= replacement_template.name then
			override_template = replacement_template
		end
	end

	if not override_template then
		self:_clear_used_votes(true)
		print("BREED PACKAGE LOADING FAILED")

		return self:_check_breed_package_loading(wanted_template, previous_template)
	end

	return override_template
end

TwitchGameMode._get_game_mode_whitelist = function (self)
	local game_mode_key = Managers.state.game_mode:game_mode_key()

	return TwitchVoteWhitelists[game_mode_key]
end

TwitchGameMode._in_whitelist = function (self, template_name)
	local game_mode_whitelist = self:_get_game_mode_whitelist()

	if game_mode_whitelist == nil then
		return true
	else
		return table.contains(game_mode_whitelist, template_name)
	end
end

TwitchGameMode._get_next_vote = function (self)
	self:_update_used_votes()

	local funds = self._funds
	local used_vote_templates = self._used_vote_templates
	local best_template

	if funds >= TwitchSettings.cutoff_for_guaranteed_positive_vote and not TwitchSettings.disable_positive_votes then
		local templates = table.clone(TwitchPositiveVoteTemplatesLookup)

		table.shuffle(templates)

		local best_diff = -math.huge

		for i = 1, #templates do
			local template_name = templates[i]

			if not used_vote_templates[template_name] then
				local template = TwitchVoteTemplates[template_name]
				local in_whitelist = self:_in_whitelist(template_name)
				local is_allowed = in_whitelist and (not template.condition_func or template.condition_func())

				if is_allowed then
					local cost = template.cost
					local diff = funds - cost

					if best_diff < diff then
						best_template = template
						best_diff = diff
					end
				end
			end
		end
	elseif funds <= TwitchSettings.cutoff_for_guaranteed_negative_vote then
		local templates = table.clone(TwitchNegativeVoteTemplatesLookup)

		table.shuffle(templates)

		local best_diff = math.huge

		for i = 1, #templates do
			local template_name = templates[i]

			if not used_vote_templates[template_name] then
				local template = TwitchVoteTemplates[template_name]
				local in_whitelist = self:_in_whitelist(template_name)
				local is_allowed = in_whitelist and (not template.condition_func or template.condition_func())

				if is_allowed then
					local cost = template.cost
					local diff = funds + cost

					if diff < best_diff then
						best_template = template
						best_diff = diff
					end
				end
			end
		end
	end

	if best_template == nil then
		local templates = table.clone(TwitchVoteTemplatesLookup)

		table.shuffle(templates)

		for i = 1, #templates do
			local template_name = templates[i]

			if not used_vote_templates[template_name] then
				local template = TwitchVoteTemplates[template_name]
				local in_whitelist = self:_in_whitelist(template_name)
				local is_allowed = in_whitelist and (not template.condition_func or template.condition_func())

				if is_allowed then
					best_template = template

					break
				end
			end
		end
	end

	if best_template == nil then
		return nil
	end

	if best_template.multiple_choice then
		return self:_next_multiple_choice_vote(best_template)
	else
		return self:_next_standard_vote(best_template)
	end
end

TwitchGameMode._next_multiple_choice_vote = function (self, template)
	local vote_templates = {}

	for i = 1, 5 do
		vote_templates[i] = template.name
	end

	local validation_func = template.validation_func

	return "multiple_choice", vote_templates, validation_func
end

TwitchGameMode._next_standard_vote = function (self, template_a)
	local used_vote_templates = self._used_vote_templates
	local template_a_name = template_a.name
	local cost_a = template_a.cost
	local templates = table.clone(TwitchStandardVoteTemplatesLookup)

	table.shuffle(templates)

	local best_template
	local best_diff = math.huge

	for i = 1, #templates do
		local template_b_name = templates[i]

		if template_a_name ~= template_b_name and not used_vote_templates[template_b_name] then
			local template_b = TwitchVoteTemplates[template_b_name]
			local is_allowed = not template_b.condition_func or template_b.condition_func()

			if is_allowed then
				local invalid_matchup = template_a.boss and not template_b.boss and not template_b.boss_equivalent

				if not invalid_matchup then
					local cost_b = template_b.cost
					local vote_cost_diff = math.abs(cost_a - cost_b)

					if vote_cost_diff <= TwitchSettings.max_a_b_vote_cost_diff and vote_cost_diff < best_diff then
						best_template = template_b
						best_diff = vote_cost_diff
					end
				end
			end
		end
	end

	if not best_template then
		self:_clear_used_votes(true)

		return self:_next_standard_vote(template_a)
	end

	template_a = self:_check_breed_package_loading(template_a)
	best_template = self:_check_breed_package_loading(best_template, template_a)

	local vote_templates = {
		template_a.name,
		best_template.name,
	}

	return "standard_vote", vote_templates, nil
end

TwitchGameMode._trigger_new_vote = function (self)
	local vote_type, vote_templates, validation_func = self:_get_next_vote()
	local vote_time = Application.user_setting("twitch_vote_time") or TwitchSettings.default_vote_time

	if vote_type then
		local vote_key = self._parent:register_vote(vote_time, vote_type, validation_func, vote_templates, true, callback(self, "cb_on_vote_complete"))

		self._vote_keys[vote_key] = true
	end

	local downtime = Application.user_setting("twitch_time_between_votes") or TwitchSettings.default_downtime

	self._timer = downtime + vote_time
end

TwitchGameMode.cb_on_vote_complete = function (self, current_vote)
	Managers.telemetry_events:twitch_poll_completed(current_vote)

	local winning_template = TwitchVoteTemplates[current_vote.winning_template_name]

	self._funds = self._funds + winning_template.cost
	self._used_vote_templates[winning_template.name] = NUM_ROUNDS_TO_DISABLE_USED_VOTES
	self._vote_keys[current_vote.vote_key] = nil
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

	local enemy_package_loader = Managers.level_transition_handler.enemy_package_loader

	for breed_name, _ in pairs(self._parent.locked_breed_packages) do
		enemy_package_loader:unlock_breed_package(breed_name)

		self._parent.locked_breed_packages[breed_name] = nil
	end

	if Managers.state and Managers.state.event then
		Managers.state.event:trigger("reset_vote_ui")
	end
end

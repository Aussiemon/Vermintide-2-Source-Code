require("scripts/settings/mixer_settings")
require("scripts/managers/twitch/script_mixer_token")

DEBUG_TWITCH = false
local NUM_ROUNDS_TO_DISABLE_USED_VOTES = 15
local MIN_VOTES_LEFT_IN_ROTATION = 2

local function debug_print(message, ...)
	if DEBUG_TWITCH then
		print("[MixerManager] " .. string.format(message, ...))
	end
end

local RPCS = {
	"rpc_update_twitch_vote"
}
MixerManager = class(MixerManager)

MixerManager.init = function (self)
	self._votes = {}
	self._votes_lookup_table = {}
	self._vote_key_index = 1
	self._connecting = false
	self._connected = false
	self._sound_bank_loaded = false
	self._game_object_ids = {}
	self._vote_key_to_go_id = {}
	self._registered_votes = {}
	self.locked_breed_packages = {}
	MixerSettings.default_downtime = Application.user_setting("twitch_time_between_votes") or MixerSettings.default_downtime
	MixerSettings.default_vote_time = Application.user_setting("twitch_vote_time") or MixerSettings.default_vote_time
	MixerSettings.difficulty = Application.user_setting("twitch_difficulty") or MixerSettings.difficulty
	local disable_positive_votes_setting = Application.user_setting("twitch_disable_positive_votes")
	MixerSettings.disable_giving_items = disable_positive_votes_setting == MixerSettings.positive_vote_options.disable_giving_items or disable_positive_votes_setting == MixerSettings.positive_vote_options.disable_positive_votes
	MixerSettings.disable_positive_votes = disable_positive_votes_setting == MixerSettings.positive_vote_options.disable_positive_votes
	MixerSettings.disable_mutators = Application.user_setting("twitch_disable_mutators")
	MixerSettings.spawn_amount_multiplier = math.min(Application.user_setting("twitch_spawn_amount"), 3)
	MixerSettings.mutator_duration_multiplier = math.min(Application.user_setting("twitch_mutator_duration"), 3)
	self._debug_vote_timer = 0.25
end

MixerManager.game_mode_supported = function (self, game_mode)
	return MixerSettings.supported_game_modes[game_mode]
end

MixerManager.stream_type = function (self)
	return "mixer"
end

MixerManager._load_sound_bank = function (self)
	if not self._sound_bank_loaded then
		local package_to_load = "resource_packages/ingame_sounds_twitch_mode"

		debug_print("Loading mixer mode sound bank resource package %s", package_to_load)
		Managers.package:load(package_to_load, "twitch", nil, true)

		self._sound_bank_loaded = true
	end
end

MixerManager._unload_sound_bank = function (self)
	if self._sound_bank_loaded then
		local package_to_unload = "resource_packages/ingame_sounds_twitch_mode"

		debug_print("Unloading mixer mode sound bank resource package %s", package_to_unload)
		Managers.package:unload(package_to_unload, "twitch")

		self._sound_bank_loaded = false
	end
end

MixerManager.connect = function (self, redundant_mixer_user_name, optional_connection_failure_callback, optional_connection_success_callback)
	local token = Mixer.open_session(Managers.account:user_id())
	local script_token = ScriptMixerToken:new(token)

	Managers.token:register_token(script_token, callback(self, "cb_open_session"))

	self._connecting = true
	self._connection_failure_callback = optional_connection_failure_callback
	self._connection_success_callback = optional_connection_success_callback
end

MixerManager.cb_open_session = function (self, result_data)
	if result_data.error_code or result_data.error_message then
		local error_code = "0x" .. string.sub(string.format("%02X", result_data.error_code), 9)
		local message = string.format(Localize("start_game_window_twitch_error_connection_xb1"), "Connection Failed", error_code)

		Application.error("[MixerManager] " .. message)

		if self._connection_failure_callback then
			self._connection_failure_callback(message)
		end

		self._connected = false
	else
		if self._connection_success_callback then
			self._connection_success_callback()
		end

		self._connected = true

		Mixer.set_ready(true)
	end

	self._connecting = false
	self._connection_success_callback = nil
	self._connection_failure_callback = nil
end

MixerManager.cb_close_session = function (self, result_data)
	if result_data.error_code or result_data.error_message then
		local error_code = "0x" .. string.sub(string.format("%02X", result_data.error_code), 9)
		local message = string.format(Localize("start_game_window_twitch_error_connection_xb1"), "Connection Failed", error_code)

		Application.error("[MixerManager] " .. message)

		if self._disconnect_failure_callback then
			self._disconnect_failure_callback(message)
		end
	elseif self._disconnect_success_callback then
		self._disconnect_success_callback()
	end

	self._connected = false
	self._connecting = false
end

MixerManager.is_connected = function (self)
	return self._connected
end

MixerManager.is_connecting = function (self)
	return self._connecting
end

MixerManager.user_name = function (self)
	return "Mixer"
end

MixerManager.cb_game_session_disconnect = function (self)
	return
end

MixerManager.cb_connection_error_callback = function (self, message)
	if not self._error_popup_id then
		self._error_popup_id = Managers.popup:queue_popup(message, Localize("popup_error_topic"), "ok", Localize("popup_choice_ok"))
	end
end

MixerManager.add_game_object_id = function (self, game_object_id)
	local game = Managers.state.network and Managers.state.network:game()

	if game then
		local vote_key = GameSession.game_object_field(game, game_object_id, "vote_key")
		self._game_object_ids[vote_key] = game_object_id
		self._vote_key_to_go_id[game_object_id] = vote_key

		self:_register_networked_vote(game_object_id)
	end
end

MixerManager.remove_game_object_id = function (self, game_object_id)
	local game = Managers.state.network and Managers.state.network:game()

	if game then
		local vote_key = self._vote_key_to_go_id[game_object_id]
		self._game_object_ids[vote_key] = nil
		self._vote_key_to_go_id[game_object_id] = nil

		self:unregister_vote(vote_key)
	end
end

MixerManager._update_game_object = function (self, vote_key, vote_data)
	local network_manager = Managers.state.network
	local game = network_manager:game()
	local time = math.ceil(vote_data.timer)

	if game then
		local go_id = self._game_object_ids[vote_key]

		if go_id then
			GameSession.set_game_object_field(game, go_id, "options", vote_data.options)
			GameSession.set_game_object_field(game, go_id, "time", math.max(math.ceil(vote_data.timer), 0))
		end
	end
end

MixerManager._register_networked_vote = function (self, game_object_id)
	local network_manager = Managers.state.network
	local game = network_manager:game()
	local vote_key = GameSession.game_object_field(game, game_object_id, "vote_key")
	local vote_type = NetworkLookup.twitch_vote_types[GameSession.game_object_field(game, game_object_id, "vote_type")]
	local option_strings = {
		MixerSettings[vote_type].default_vote_a_str,
		MixerSettings[vote_type].default_vote_b_str,
		MixerSettings[vote_type].default_vote_c_str,
		MixerSettings[vote_type].default_vote_d_str,
		MixerSettings[vote_type].default_vote_e_str
	}
	local sparks_option_strings = {
		MixerSettings[vote_type].sparks_vote_a_str,
		MixerSettings[vote_type].sparks_vote_b_str,
		MixerSettings[vote_type].sparks_vote_c_str,
		MixerSettings[vote_type].sparks_vote_d_str,
		MixerSettings[vote_type].sparks_vote_e_str
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
		sparks_option_strings = sparks_option_strings,
		options = options,
		vote_templates = vote_templates,
		vote_key = vote_key,
		vote_type = vote_type,
		show_vote_ui = show_vote_ui
	}
	self._votes_lookup_table[vote_key] = self._votes[#self._votes]

	self:_register_message_callback(vote_key, callback(self, "on_client_message_received"))

	if self._votes[#self._votes].show_vote_ui then
		Managers.state.event:trigger("add_vote_ui", vote_key)
	end
end

MixerManager.register_vote = function (self, time, vote_type, validation_func, vote_templates, show_vote_ui, cb)
	local network_manager = Managers.state.network

	fassert(self._connected, "[MixerManager] You need to be connected to be able to trigger twitch votes")
	fassert(network_manager and network_manager:game(), "[MixerManager] You need to have an active game session to be able to register votes")

	local option_strings = {
		MixerSettings[vote_type].default_vote_a_str,
		MixerSettings[vote_type].default_vote_b_str,
		MixerSettings[vote_type].default_vote_c_str,
		MixerSettings[vote_type].default_vote_d_str,
		MixerSettings[vote_type].default_vote_e_str
	}
	local sparks_option_strings = {
		MixerSettings[vote_type].sparks_vote_a_str,
		MixerSettings[vote_type].sparks_vote_b_str,
		MixerSettings[vote_type].sparks_vote_c_str,
		MixerSettings[vote_type].sparks_vote_d_str,
		MixerSettings[vote_type].sparks_vote_e_str
	}
	local expanded_vote_templates = {
		0,
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
		sparks_option_strings = sparks_option_strings,
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

	self:_register_message_callback(vote_key, callback(self, "on_message_received"))

	if not self._current_vote then
		self:_activate_next_vote()
	end

	self._vote_key_index = 1 + self._vote_key_index % 255

	return vote_key
end

MixerManager.unregister_vote = function (self, vote_key)
	local network_manager = Managers.state.network
	local is_server = network_manager and network_manager.is_server

	self:_unregister_message_callback(vote_key)

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

MixerManager._activate_next_vote = function (self)
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
				show_vote_ui = self._current_vote.show_vote_ui
			}
			local callback = callback(self, "cb_game_session_disconnect")
			self._game_object_ids[self._current_vote.vote_key] = network_manager:create_game_object("twitch_vote", game_object_data_table, callback)
		end
	end
end

MixerManager.get_vote_data = function (self, vote_key)
	return self._votes_lookup_table[vote_key]
end

MixerManager.on_client_message_received = function (self, vote_key, inputs)
	local vote_data = self._votes_lookup_table[vote_key]

	if not vote_data then
		Application.error("MixerManager] Something went wrong. There is no vote with the vote_key: " .. tostring(vote_key))
		self:unregister_vote(vote_key)

		return
	elseif not vote_data.activated then
		return
	end

	for index = 1, #inputs, 1 do
		local data = inputs[index]
		local message = string.lower(data.vote_str)
		local participation_id = string.lower(data.participation_id)

		if Development.parameter("twitch_randomize_votes") then
			message = vote_data.option_strings[Math.random(#vote_data.option_strings)]
		end

		if not string.find(message, "sparks") then
			for idx, option_string in ipairs(vote_data.option_strings) do
				if string.find(message, option_string) then
					local lookup_as_amount = 1
					local user_name = participation_id

					Managers.state.network.network_transmit:send_rpc_server("rpc_update_twitch_vote", NetworkLookup.twitch_rpc_types.rpc_add_client_twitch_vote, vote_key, user_name, idx, lookup_as_amount)

					break
				end
			end
		end

		for idx, sparks_option_string in ipairs(vote_data.sparks_option_strings) do
			if string.find(message, sparks_option_string) then
				local lookup_as_amount = 10
				local user_name = participation_id

				Managers.state.network.network_transmit:send_rpc_server("rpc_update_twitch_vote", NetworkLookup.twitch_rpc_types.rpc_add_client_twitch_vote, vote_key, user_name, idx, lookup_as_amount)

				break
			end
		end
	end
end

MixerManager.rpc_update_twitch_vote = function (self, sender, twitch_rpc_type, vote_key, user_name, vote_index, vote_template_id)
	local rpc_type = NetworkLookup.twitch_rpc_types[twitch_rpc_type]

	self[rpc_type](self, sender, vote_key, user_name, vote_index, vote_template_id)
end

MixerManager.rpc_add_client_twitch_vote = function (self, sender, vote_key, user_name, vote_index, lookup_as_amount)
	local vote_data = self._votes_lookup_table[vote_key]

	if not vote_data then
		Application.error("MixerManager] Something went wrong. There is no vote with the vote_key: " .. tostring(vote_key))
		self:unregister_vote(vote_key)

		return
	elseif not vote_data.activated then
		return
	end

	if not Development.parameter("twitch_allow_multiple_votes") and lookup_as_amount < 10 then
		if vote_data.user_names[user_name] then
			return
		end

		vote_data.user_names[user_name] = true
	end

	if Development.parameter("twitch_randomize_votes") then
		local vote_index = Math.random(#vote_data.option_strings)
		vote_data.options[vote_index] = vote_data.options[vote_index] + lookup_as_amount
	else
		vote_data.options[vote_index] = vote_data.options[vote_index] + lookup_as_amount
	end

	self:_update_game_object(vote_key, vote_data)
end

MixerManager.rpc_finish_twitch_vote = function (self, sender, vote_key, user_name, vote_index, vote_template_id)
	local is_server = Managers.state.network and Managers.state.network.is_server
	local vote_template_name = NetworkLookup.twitch_vote_templates[vote_template_id]

	debug_print("Vote results:", vote_index, vote_template_name)

	local vote_data = self._votes_lookup_table[vote_key]

	if not vote_data then
		Application.error("MixerManager] Something went wrong. There is no vote with the vote_key: " .. tostring(vote_key))
		self:unregister_vote(vote_key)

		return
	end

	local vote_template = TwitchVoteTemplates[vote_template_name]

	if vote_template then
		vote_template.on_success(is_server, vote_index)
	end

	if vote_data.show_vote_ui then
		Managers.state.event:trigger("finish_vote_ui", vote_key, vote_index)
	end

	self:_unregister_message_callback(vote_key)

	self._votes_lookup_table[vote_key] = nil

	for idx, vote_table in ipairs(self._votes) do
		if vote_table.vote_key == vote_key then
			table.remove(self._votes, idx)

			break
		end
	end
end

MixerManager.rpc_disconnected_from_twitch = function (self, sender, vote_key, user_name, vote_index, vote_template_id)
	self._loading_popup_message = "twitch_connection_failed"
end

MixerManager.get_twitch_popup_message = function (self)
	local message = self._loading_popup_message
	self._loading_popup_message = nil

	return message
end

MixerManager.on_message_received = function (self, vote_key, inputs)
	local vote_data = self._votes_lookup_table[vote_key]

	if not vote_data then
		Application.error("MixerManager] Something went wrong. There is no vote with the vote_key: " .. tostring(vote_key))
		self:unregister_vote(vote_key)

		return
	elseif not vote_data.activated then
		return
	end

	local allow_multiple_votes = Development.parameter("twitch_allow_multiple_votes")

	for index = 1, #inputs, 1 do
		local data = inputs[index]
		local message = string.lower(data.vote_str)
		local participation_id = string.lower(data.participation_id)
		local options = vote_data.options

		if not string.find(message, "sparks") then
			for idx, option_string in ipairs(vote_data.option_strings) do
				if string.find(message, option_string) and (allow_multiple_votes or not vote_data.user_names[participation_id]) then
					vote_data.user_names[participation_id] = true
					options[idx] = options[idx] + 1

					break
				end
			end
		end

		for idx, sparks_option_string in ipairs(vote_data.sparks_option_strings) do
			if string.find(message, sparks_option_string) then
				options[idx] = options[idx] + 10

				break
			end
		end
	end

	self:_update_game_object(vote_key, vote_data)
end

MixerManager.disconnect = function (self, optional_disconnect_success_callback, optional_disconnect_failure_callback)
	if self._connected then
		if self._twitch_game_mode then
			self._twitch_game_mode:destroy()

			self._twitch_game_mode = nil
		end

		local token = Mixer.close_session()
		local script_token = ScriptMixerToken:new(token)

		Managers.token:register_token(script_token, callback(self, "cb_close_session"))

		self._connecting = true
		self._disconnect_success_callback = optional_disconnect_success_callback
		self._disconnect_failure_callback = optional_disconnect_failure_callback
	end

	self._activated = false
	self._connected = false
end

MixerManager.update = function (self, dt, t)
	self:_handle_disconnect_popup()

	if not self._connected and not self._connecting and not self._activated then
		return
	end

	self:_update_mixer()
	self:_handle_votes()
	self:_validate_data(dt, t)
	self:_update_vote_data(dt, t)
	self:_update_twitch_game_mode(dt, t)
end

MixerManager._update_mixer = function (self)
	if self._connected or self._connecting then
		Mixer.update()
	end
end

MixerManager._handle_votes = function (self)
	if self._connected then
		local inputs = Mixer.get_inputs()

		if inputs then
			for vote_key, cb in pairs(self._registered_votes) do
				cb(vote_key, inputs)
			end
		end
	end
end

MixerManager._register_message_callback = function (self, vote_key, message_callback)
	self._registered_votes = self._registered_votes or {}
	self._registered_votes[vote_key] = message_callback
end

MixerManager._unregister_message_callback = function (self, vote_key)
	self._registered_votes = self._registered_votes or {}
	self._registered_votes[vote_key] = nil
end

MixerManager._handle_disconnect_popup = function (self)
	if self._error_popup_id then
		local result = Managers.popup:query_result(self._error_popup_id)

		if result then
			if result == "ok" then
				self._error_popup_id = nil
			elseif result then
				fassert(false, "[MixerManager] The popup result doesn't exist (%s)", result)
			end
		end
	end
end

MixerManager._update_vote_data = function (self, dt, t)
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
end

MixerManager._handle_results = function (self, vote_results)
	local package_loader = Managers.state.game_mode.level_transition_handler.enemy_package_loader
	local network_manager = Managers.state.network
	local is_server = network_manager.is_server
	local best_option = -1
	local best_option_index = 0
	local current_vote = self._current_vote
	local vote_type = current_vote.vote_type
	local settings_options = MixerSettings[vote_type]
	local num_options = settings_options.num_options
	local options = vote_results.options

	for i = 1, num_options, 1 do
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
			elseif option == best_option then
				local random_winner = math.random(2)

				if random_winner == 1 then
					best_option_index = i
					best_option = option
				end
			end
		until true
	end

	for i = 1, num_options, 1 do
		local vote_template_name = vote_results.vote_templates[i]
		local vote_template = TwitchVoteTemplates[vote_template_name]
		local breed_name = vote_template.breed_name

		if breed_name and self.locked_breed_packages[breed_name] then
			package_loader:unlock_breed_package(breed_name)

			self.locked_breed_packages[breed_name] = nil
		end
	end

	local vote_template_name = vote_results.vote_templates[best_option_index]
	vote_results.winning_template_name = vote_template_name

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
end

MixerManager._valid_player_index = function (self, index)
	local players = Managers.player:human_and_bot_players()

	for peer_id, player in pairs(players) do
		local profile_index = player:profile_index()

		if index == profile_index then
			return true
		end
	end

	return false
end

MixerManager._validate_data = function (self, dt, t)
	local current_vote = self._current_vote

	if current_vote then
		local validation_func = current_vote.validation_func

		if validation_func then
			validation_func(current_vote)
		end
	end
end

MixerManager.is_activated = function (self)
	return self._activated
end

MixerManager.reset = function (self)
	self:destroy()
end

MixerManager.destroy = function (self)
	if Managers.state and Managers.state.event then
		Managers.state.event:trigger("reset_vote_ui")
	end

	self:disconnect()
end

MixerManager.activate_twitch_game_mode = function (self, network_event_delegate, game_mode_key)
	if Development.parameter("twitch_debug_voting") then
		self._connected = true
	end

	MixerSettings.default_downtime = Application.user_setting("twitch_time_between_votes") or MixerSettings.default_downtime
	MixerSettings.default_vote_time = Application.user_setting("twitch_vote_time") or MixerSettings.default_vote_time
	MixerSettings.difficulty = Application.user_setting("twitch_difficulty") or MixerSettings.difficulty
	local network_manager = Managers.state.network and Managers.state.network
	local is_server = network_manager and network_manager.is_server

	if game_mode_key == "adventure" then
		print("Activating Twitch Mode")
		Managers.state.event:trigger("activate_twitch_game_mode")

		self._network_event_delegate = network_event_delegate

		network_event_delegate:register(self, unpack(RPCS))

		if is_server and self._connected then
			self._twitch_game_mode = MixerGameMode:new(self)
		end

		local lobby = network_manager:lobby()
		self._activated = (lobby:lobby_data("twitch_enabled") == "true" and true) or false

		if Development.parameter("twitch_debug_voting") then
			self._activated = true
		end

		self:_load_sound_bank()
	end
end

MixerManager.debug_activate_twitch_game_mode = function (self)
	local twitch_debug_voting = Development.parameter("twitch_debug_voting")

	if twitch_debug_voting then
		Managers.state.event:trigger("activate_twitch_game_mode")

		self._twitch_game_mode = MixerGameMode:new(self)
		self._activated = true
		self._connected = true
	else
		self:deactivate_twitch_game_mode()
	end
end

MixerManager.deactivate_twitch_game_mode = function (self)
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

MixerManager._update_twitch_game_mode = function (self, dt, t)
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
	"default_vote_e_str"
}

MixerManager._update_debug_voting = function (self, dt)
	self._debug_vote_timer = self._debug_vote_timer - dt

	if self._debug_vote_timer > 0 then
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
		local valid_player_index = self:_valid_player_index(debug_result)

		if not valid_player_index then
			return
		end

		message_index = debug_messages[debug_result]
	end

	local message = MixerSettings.multiple_choice[message_index]
	local options = current_vote.options
	local option_strings = current_vote.option_strings

	for idx, option_string in ipairs(option_strings) do
		if string.find(message, option_string) then
			options[idx] = options[idx] + 1

			break
		end
	end

	local sparks_option_strings = current_vote.sparks_option_strings

	for idx, option_string in ipairs(sparks_option_strings) do
		if string.find(message, option_string) then
			options[idx] = options[idx] + 10

			break
		end
	end

	local vote_key = current_vote.vote_key

	self:_update_game_object(vote_key, current_vote)

	self._debug_vote_timer = 0.25
end

MixerGameMode = class(MixerGameMode)

MixerGameMode.init = function (self, parent)
	self._timer = MixerSettings.initial_downtime
	self._funds = MixerSettings.starting_funds
	self._parent = parent
	self._vote_keys = {}
	self._used_vote_templates = {}

	Debug.text("Activating Mixer Game Mode")
end

MixerGameMode.update = function (self, dt, t)
	self._timer = self._timer - dt

	if self._timer > 0 then
		return
	end

	local game = Managers.state.network and Managers.state.network:game()

	if game then
		self:_trigger_new_vote()
	end
end

MixerGameMode._update_used_votes = function (self)
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

MixerGameMode._clear_used_votes = function (self, force_clear)
	local used_vote_templates = self._used_vote_templates

	if force_clear or #TwitchVoteTemplatesLookup - table.size(used_vote_templates) <= MIN_VOTES_LEFT_IN_ROTATION then
		table.clear(used_vote_templates)
	end
end

MixerGameMode._check_breed_package_loading = function (self, wanted_template, previous_template)
	local wanted_breed_name = wanted_template.breed_name

	if not wanted_breed_name then
		return wanted_template
	end

	local is_boss = wanted_template.boss
	local is_special = wanted_template.special

	if not is_boss and not is_special then
		return wanted_template
	end

	local package_loader = Managers.state.game_mode.level_transition_handler.enemy_package_loader
	local breed_processed = package_loader.breed_processed
	local request_success = true
	local replacement_breed_name = nil

	if not breed_processed[wanted_breed_name] then
		request_success = package_loader:request_breed(wanted_breed_name)
	end

	if request_success then
		package_loader:lock_breed_package(wanted_breed_name)

		self._parent.locked_breed_packages[wanted_breed_name] = true

		return wanted_template
	else
		local replacement_breeds = {}

		for breed_name, _ in pairs(breed_processed) do
			replacement_breeds[#replacement_breeds + 1] = breed_name
		end

		table.shuffle(replacement_breeds)

		local templates = (is_boss and TwitchBossesSpawnBreedNamesLookup) or (is_special and TwitchSpecialsSpawnBreedNamesLookup)

		for i = 1, #replacement_breeds, 1 do
			local breed_name = replacement_breeds[i]

			if templates[breed_name] then
				replacement_breed_name = breed_name

				break
			end
		end
	end

	local use_boss_equivalent = is_boss and previous_template and previous_template.breed_name == replacement_breed_name
	local override_template = nil
	local used_vote_templates = self._used_vote_templates

	if use_boss_equivalent then
		local best_diff = math.huge
		local templates = TwitchBossEquivalentSpawnTemplatesLookup

		table.shuffle(templates)

		for i = 1, #templates, 1 do
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

		if not used_vote_templates[replacement_template.name] and (previous_template == nil or (previous_template and previous_template.name ~= replacement_template.name)) and wanted_template.name ~= replacement_template.name then
			override_template = replacement_template
		end
	end

	if not override_template then
		self:_clear_used_votes(true)

		return self:_check_breed_package_loading(wanted_template, previous_template)
	end

	return override_template
end

MixerGameMode._get_next_vote = function (self)
	self:_update_used_votes()

	local funds = self._funds
	local used_vote_templates = self._used_vote_templates
	local best_template = nil

	if MixerSettings.cutoff_for_guaranteed_positive_vote <= funds then
		local templates = table.clone(TwitchPositiveVoteTemplatesLookup)

		table.shuffle(templates)

		local best_diff = -math.huge

		for i = 1, #templates, 1 do
			local template_name = templates[i]

			if not used_vote_templates[template_name] then
				local template = TwitchVoteTemplates[template_name]
				local is_allowed = not template.condition_func or template.condition_func()

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
	elseif funds <= MixerSettings.cutoff_for_guaranteed_negative_vote then
		local templates = table.clone(TwitchNegativeVoteTemplatesLookup)

		table.shuffle(templates)

		local best_diff = math.huge

		for i = 1, #templates, 1 do
			local template_name = templates[i]

			if not used_vote_templates[template_name] then
				local template = TwitchVoteTemplates[template_name]
				local is_allowed = not template.condition_func or template.condition_func()

				if is_allowed then
					local cost = template.cost
					local diff = funds + cost

					if best_diff > diff then
						best_template = template
						best_diff = diff
					end
				end
			end
		end
	else
		local templates = table.clone(TwitchVoteTemplatesLookup)

		table.shuffle(templates)

		local best_diff = math.huge

		for i = 1, #templates, 1 do
			local template_name = templates[i]

			if not used_vote_templates[template_name] then
				local template = TwitchVoteTemplates[template_name]
				local is_allowed = not template.condition_func or template.condition_func()

				if is_allowed then
					best_template = template
				end
			end
		end
	end

	if best_template.multiple_choice then
		return self:_next_multiple_choice_vote(best_template)
	else
		return self:_next_standard_vote(best_template)
	end
end

MixerGameMode._sorted_players = function (self)
	local human_and_bot_players = Managers.player:human_and_bot_players()
	local players = {}

	for peer_id, player in pairs(human_and_bot_players) do
		players[#players + 1] = player
	end

	local function sort_by_profile_index(player_a, player_b)
		local profile_index_a = player_a:profile_index()
		local profile_index_b = player_b:profile_index()

		return profile_index_a < profile_index_b
	end

	table.sort(players, sort_by_profile_index)

	return players
end

MixerGameMode._get_multiple_choice_scene_name = function (self)
	local scene_name = "multiple_choice_"
	local sorted_players = self:_sorted_players()

	for _, player in ipairs(sorted_players) do
		scene_name = scene_name .. MixerSettings.profile_index_to_letter_lookup[player:profile_index()]
	end

	if not MixerSettings.valid_multiple_choice_scenes[scene_name] then
		scene_name = "multiple_choice_abcd"
	end

	return scene_name
end

MixerGameMode._next_multiple_choice_vote = function (self, template)
	local vote_templates = {}

	for i = 1, 5, 1 do
		vote_templates[i] = template.name
	end

	local scene_name = self:_get_multiple_choice_scene_name()
	local validation_func = template.validation_func

	return "multiple_choice", vote_templates, validation_func, scene_name
end

MixerGameMode._next_standard_vote = function (self, template_a)
	local funds = self._funds
	local used_vote_templates = self._used_vote_templates
	local template_a_name = template_a.name
	local cost_a = template_a.cost
	local sign = math.sign(cost_a)
	local inverted_sign = (sign > 0 and -1) or 1
	local templates = table.clone(TwitchStandardVoteTemplatesLookup)

	table.shuffle(templates)

	local best_template = nil
	local best_diff = math.huge

	for i = 1, #templates, 1 do
		local template_b_name = templates[i]

		if template_a_name ~= template_b_name and not used_vote_templates[template_b_name] then
			local template_b = TwitchVoteTemplates[template_b_name]
			local is_allowed = not template_b.condition_func or template_b.condition_func()

			if is_allowed then
				local invalid_matchup = template_a.boss and not template_b.boss and not template_b.boss_equivalent

				if not invalid_matchup then
					local cost_b = template_b.cost
					local vote_cost_diff = math.abs(cost_a - cost_b)

					if vote_cost_diff <= MixerSettings.max_a_b_vote_cost_diff and vote_cost_diff < best_diff then
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
		best_template.name
	}

	return "standard_vote", vote_templates, nil
end

MixerGameMode._trigger_new_vote = function (self)
	local vote_type, vote_templates, validation_func, scene_name = self:_get_next_vote()

	if vote_type == "standard_vote" then
		Mixer.set_scene("choice")
	else
		Mixer.set_scene(scene_name)
	end

	local vote_time = Application.user_setting("twitch_vote_time") or MixerSettings.default_vote_time
	local time = vote_time
	local vote_key = self._parent:register_vote(time, vote_type, validation_func, vote_templates, true, callback(self, "cb_on_vote_complete"))
	self._vote_keys[vote_key] = true
	local downtime = Application.user_setting("twitch_time_between_votes") or MixerSettings.default_downtime
	self._timer = downtime + time
end

MixerGameMode.cb_on_vote_complete = function (self, current_vote)
	local winning_template = TwitchVoteTemplates[current_vote.winning_template_name]
	self._funds = self._funds + winning_template.cost
	self._used_vote_templates[winning_template.name] = NUM_ROUNDS_TO_DISABLE_USED_VOTES
	self._vote_keys[current_vote.vote_key] = nil

	Mixer.set_scene("default")
end

MixerGameMode.destroy = function (self)
	debug_print("Destroying Mixer Game mode")

	for vote_key, _ in pairs(self._vote_keys) do
		if Managers.state and Managers.state.event then
			Managers.state.event:trigger("reset_vote_ui", vote_key)
		end

		self._parent:unregister_vote(vote_key)
		debug_print("Destroying Mixer Vote %s", vote_key)
	end

	local game_mode_manager = Managers.state.game_mode

	if game_mode_manager then
		local enemy_package_loader = game_mode_manager.level_transition_handler.enemy_package_loader

		for breed_name, _ in pairs(self._parent.locked_breed_packages) do
			enemy_package_loader:unlock_breed_package(breed_name)

			self._parent.locked_breed_packages[breed_name] = nil
		end
	end

	if Managers.state and Managers.state.event then
		Managers.state.event:trigger("reset_vote_ui")
	end

	Mixer.set_scene("default")
end

return

-- chunkname: @scripts/managers/eac/eac_manager.lua

local EacState = table.enum("untrusted", "trusted", "banned", "undetermined")
local HANDSHAKE_TIMEOUT = 15

local function eac_printf(...)
	print("[EACManager] " .. string.format(...))
end

EacManager = class(EacManager)
USE_EOS = true

local function check_eac_supported()
	if not IS_WINDOWS and not DEDICATED_SERVER then
		return false, "unsupported platform: " .. tostring(PLATFORM)
	end

	if script_data["eac-untrusted"] then
		return false, "in modded realm"
	end

	if USE_EOS then
		if not rawget(_G, "EOS_EAC") then
			return false, "EOS_EAC not available"
		end

		if DEDICATED_SERVER then
			local has_server = EOS_EAC.has_eac_server()

			assert(has_server, "Dedicated server is running without EAC running in server mode")

			return true
		end

		local has_client = EOS_EAC.has_eac_client()

		return has_client, "EAC client not available"
	else
		if not rawget(_G, "EAC") then
			return false, "EAC not available"
		end

		return true
	end
end

EacManager.init = function (self)
	local eac_supported, disable_reason = check_eac_supported()

	if eac_supported then
		eac_printf("EAC enabled")
	else
		eac_printf("Disabling EAC due to reason: %s", disable_reason)
	end

	self._peer_data = {}
	self._eac_supported = eac_supported
	self._host_peer_id = nil
	self._local_role = nil
	self._network_model = nil
	self._user_id = "untrusted"
	self._suppress_popup = not eac_supported
	self._suppress_panel = not eac_supported
	self._popup_id = nil
	self._indicator_offset = 0
end

EacManager.challenge_response = function (self, challenge)
	if self._eac_supported then
		if USE_EOS then
			return EOS_EAC.challenge_response(challenge)
		else
			return EAC.challenge_response(challenge)
		end
	end

	return nil
end

EacManager.is_trusted = function (self)
	if self._eac_supported then
		if USE_EOS then
			if EOS_EAC.has_eac_server() then
				return true
			end

			return not EOS_EAC.get_integrity_violation()
		else
			local state = EAC.state()

			return state == EacState.trusted
		end
	end

	return false
end

EacManager.before_join = function (self, network_model)
	assert(self._local_role == nil, "Method called in incompatible state")
	assert(network_model == "client_server" or network_model == "peer_to_peer", "Invalid network_model argument")

	self._local_role = "client"
	self._network_model = network_model

	if self._eac_supported then
		if USE_EOS then
			EOS_EAC.begin_session(network_model)
		else
			EAC.before_join()
		end
	end
end

EacManager.after_leave = function (self)
	assert(self._local_role == "client", "Method called in incompatible state")

	if self._eac_supported then
		if USE_EOS then
			EOS_EAC.end_session()
			self:_pump_eos_actions()
		else
			EAC.after_leave()
		end
	end

	local host_peer_id = self._host_peer_id

	if host_peer_id then
		self._peer_data[host_peer_id] = nil
	else
		eac_printf("Left EAC session without setting the host.")
	end

	self._local_role = nil
	self._session_mode = nil
	self._host_peer_id = nil
end

EacManager.set_host = function (self, peer_id)
	assert(self._local_role == "client", "Method called in incompatible state")
	assert(self._host_peer_id == nil, "Host was already set and cannot be changed")

	local channel_id = PEER_ID_TO_CHANNEL[peer_id]

	assert(channel_id, "Must already be connected")

	self._host_peer_id = peer_id

	local data = {
		user_id = false,
		peer_id = peer_id,
		channel_id = channel_id,
	}

	self._peer_data[peer_id] = data

	if self._eac_supported then
		if USE_EOS then
			if self._network_model == "peer_to_peer" then
				self:_initiate_handshake(peer_id)
			elseif self._network_model == "client_server" then
				EOS_EAC.set_server_peer_id(peer_id)

				data.timeout_t = math.huge
				data.is_server = true
			end
		else
			EAC.set_host(channel_id)
			EAC.validate_host()
		end
	else
		self:_initiate_handshake(peer_id)
	end
end

EacManager.check_host = function (self)
	assert(self._local_role == "client", "Method called in incompatible state")
	assert(self._host_peer_id, "Cannot check the host before it has been set.")

	local state_determined, can_play

	if self._eac_supported then
		if USE_EOS then
			state_determined, can_play = self:_check_peer(self._host_peer_id)
		else
			local server_state = EAC.state(self._host_peer_id)
			local client_state = EAC.state()

			state_determined, can_play = self:_check_states_compatible(server_state, client_state)
		end
	else
		state_determined, can_play = self:_check_peer(self._host_peer_id)
	end

	return state_determined, can_play
end

EacManager._check_peer = function (self, peer_id)
	local data = self._peer_data[peer_id]

	if data.untrusted then
		return true, not self._eac_supported
	end

	if data.is_server then
		return true, true
	end

	if not data.user_id then
		return false, true
	end

	if USE_EOS and self._eac_supported then
		local status = EOS_EAC.peer_status(peer_id)

		if status == EOS_EAC_ACCCAS.RemoteAuthComplete then
			return true, true
		end
	end

	return false, true
end

EacManager._check_states_compatible = function (self, state1, state2)
	if state1 == EacState.banned or state2 == EacState.banned then
		return true, false
	end

	if state1 == EacState.undetermined or state2 == EacState.undetermined then
		return false, true
	end

	local can_play = state1 == state2

	return true, can_play
end

EacManager.is_initialized = function (self)
	if self._eac_supported then
		if USE_EOS then
			return self._eos_auth_complete, self._eos_auth_error
		else
			local is_initialized = EAC.is_initialized()

			if not is_initialized then
				return false, nil
			end

			local _, error_message = EAC.initialization_error()

			if error_message then
				return true, error_message
			end
		end
	end

	return true, nil
end

EacManager.server_create = function (self, server_name)
	assert(self._local_role == nil, "Method called in incompatible state")
	assert(server_name ~= nil, "Must provide a server_name")

	self._local_role = "server"

	if self._eac_supported then
		if USE_EOS then
			local network_model = EOS_EAC.has_eac_server() and "client_server" or "peer_to_peer"

			EOS_EAC.begin_session(network_model)
		else
			assert(self._eac_server == nil, "An EAC server already exists")

			self._eac_server = EACServer.create(server_name)
		end
	end

	eac_printf("Created EACServer with name %q", server_name)
end

EacManager.server_destroy = function (self)
	assert(self._local_role == "server", "Method called in incompatible state")

	self._local_role = nil

	if self._eac_supported then
		if USE_EOS then
			EOS_EAC.end_session()
			self:_pump_eos_actions()
		else
			EACServer.destroy(self._eac_server)

			self._eac_server = nil
		end
	end

	eac_printf("Destroyed EACServer (%d registered peers)", table.size(self._peer_data))
	table.clear(self._peer_data)
end

EacManager.server_add_peer = function (self, peer_id)
	assert(self._local_role == "server", "Method called in incompatible state")
	fassert(not self._peer_data[peer_id], "Peer %q was already added", peer_id)
	eac_printf("Adding peer %s", peer_id)

	local channel_id = PEER_ID_TO_CHANNEL[peer_id]

	assert(channel_id, "Must already be connected")

	local data = {
		peer_id = peer_id,
		channel_id = channel_id,
	}

	self._peer_data[peer_id] = data

	if self._eac_supported then
		if USE_EOS then
			self:_initiate_handshake(peer_id)
		else
			EACServer.add_peer(self._eac_server, channel_id)
		end
	else
		self:_initiate_handshake(peer_id)
	end
end

EacManager.server_remove_peer = function (self, peer_id)
	assert(self._local_role == "server", "Method called in incompatible state")
	fassert(self._peer_data[peer_id], "Peer %q was already removed", peer_id)
	eac_printf("Removing peer %s", peer_id)

	if self._eac_supported then
		if USE_EOS then
			local data = self._peer_data[peer_id]

			if data.added then
				EOS_EAC.remove_peer(peer_id)
			end
		else
			local channel_id = PEER_ID_TO_CHANNEL[peer_id]

			EACServer.remove_peer(self._eac_server, channel_id)
		end
	end

	self._peer_data[peer_id] = nil
end

EacManager.server_check_peer = function (self, peer_id)
	if peer_id == Network.peer_id() then
		return true, true
	end

	local state_determined, can_play

	if self._eac_supported then
		if USE_EOS then
			state_determined, can_play = self:_check_peer(peer_id)
		else
			local eac_server = self._eac_server
			local server_state = EACServer.state(eac_server, Network.peer_id())
			local client_state = EACServer.state(eac_server, peer_id)

			state_determined, can_play = self:_check_states_compatible(server_state, client_state)
		end
	else
		state_determined, can_play = self:_check_peer(peer_id)
	end

	return state_determined, can_play
end

EacManager.update = function (self, dt, t)
	if self._eac_server then
		EACServer.update(self._eac_server)
	end

	self:_handle_eos(t)

	if IS_WINDOWS then
		self:_handle_violations()
		self:_handle_popups()
	end
end

EacManager.register_network_event_delegate = function (self, network_event_delegate)
	network_event_delegate:register(self, "rpc_eac_handshake_request", "rpc_eac_handshake_reply")

	self._network_event_delegate = network_event_delegate
end

EacManager.unregister_network_event_delegate = function (self)
	self._network_event_delegate:unregister(self)

	self._network_event_delegate = nil
end

EacManager._initiate_handshake = function (self, peer_id)
	local data = self._peer_data[peer_id]

	RPC.rpc_eac_handshake_request(data.channel_id)

	data.timeout_t = Managers.time:time("main") + HANDSHAKE_TIMEOUT
	data.untrusted = false
end

EacManager.rpc_eac_handshake_request = function (self, channel_id)
	local user_id = self._user_id

	RPC.rpc_eac_handshake_reply(channel_id, user_id)
end

EacManager.rpc_eac_handshake_reply = function (self, channel_id, user_id)
	local peer_id = CHANNEL_TO_PEER_ID[channel_id]
	local data = self._peer_data[peer_id]

	if not data then
		eac_printf("Ignoring handshake reply from unknown peer %s", peer_id)

		return
	end

	if data.untrusted then
		eac_printf("Ignoring handshake reply from already untrusted peer %s", peer_id)

		return
	end

	if data.added then
		eac_printf("Ignoring handshake reply from already added peer %s", peer_id)

		return
	end

	if user_id == "untrusted" then
		data.untrusted = true
	else
		data.user_id = user_id
		data.timeout_t = math.huge

		if self._eac_supported and USE_EOS then
			EOS_EAC.add_peer(peer_id, user_id)

			data.added = true
		end
	end
end

EacManager._pump_eos_actions = function (self)
	while EOS_EAC.has_eac_action() do
		local a = EOS_EAC.next_eac_action()
		local action_str = table.find(EOS_EAC_ACCCA, a.action) or "?"
		local reason_str = table.find(EOS_EAC_ACCCAR, a.reason) or "?"

		eac_printf("Got action { action=%d %q, reason=%d %q, details=%q, peer=%q }", a.action, action_str, a.reason, reason_str, a.details, a.peer)

		local data = self._peer_data[a.peer]

		if data then
			if a.action == EOS_EAC_ACCCA.RemovePlayer then
				data.untrusted = true
			else
				eac_printf("Ignored action because it was unknown")
			end
		else
			eac_printf("Ignored action because peer %q is not registed", a.peer)
		end
	end
end

local AUTH_STATE_MACHINE = {
	init = function (self)
		return "retrieve_ticket"
	end,
	retrieve_ticket = function (self, t)
		eac_printf("Retrieving Steam auth session ticket...")

		self._steam_ticket_job = Steam.retrieve_auth_session_ticket("epiconlineservices")

		return "poll_ticket"
	end,
	poll_ticket = function (self)
		local auth_session_ticket = Steam.poll_auth_session_ticket(self._steam_ticket_job)

		if auth_session_ticket then
			self._steam_ticket_job = nil
			self._auth_session_ticket = auth_session_ticket

			return "start_authenticate"
		end
	end,
	start_authenticate = function (self)
		eac_printf("Authenticating with Steam as an identity provider...")
		EOS_EAC.authenticate_with_steam(self._auth_session_ticket)

		self._auth_session_ticket = nil

		return "poll_authenticate"
	end,
	poll_authenticate = function (self)
		local status, result = EOS_EAC.poll_authenticate_status()

		if status == "in_flight" then
			return
		end

		if status == "success" then
			self._user_id = EOS_EAC.user_id()
			self._eos_auth_error = nil
		else
			self._eos_auth_error = string.format("EOS auth status=%s, result=%s", status, table.find(EOS_Result, result) or "?")
		end

		self._eos_auth_complete = true

		eac_printf("Login complete. Error: %s", self._eos_auth_error or "none")

		return "poll_valid"
	end,
	poll_valid = function (self)
		if EOS_EAC.poll_authenticate_status() == "expired" then
			eac_printf("Refreshing user id ...")

			return "init"
		end
	end,
}

EacManager._handle_eos = function (self, t)
	if not USE_EOS or not self._eac_supported then
		return
	end

	if not DEDICATED_SERVER then
		local auth_state = self._auth_state or "init"
		local handler = AUTH_STATE_MACHINE[auth_state]
		local next_state = handler(self, t)

		if next_state then
			self._auth_state = next_state
		end

		if not self._user_id then
			return
		end
	end

	self:_pump_eos_actions()

	for _, data in pairs(self._peer_data) do
		if t > data.timeout_t then
			data.untrusted = true
		end
	end
end

local FILE_RELATED_VIOLATIONS = {}

if USE_EOS then
	FILE_RELATED_VIOLATIONS.IntegrityCatalogNotFound = true
	FILE_RELATED_VIOLATIONS.IntegrityCatalogError = true
	FILE_RELATED_VIOLATIONS.IntegrityCatalogMissingMainExecutable = true
	FILE_RELATED_VIOLATIONS.GameFileMismatch = true
	FILE_RELATED_VIOLATIONS.RequiredGameFileNotFound = true
	FILE_RELATED_VIOLATIONS.UnknownGameFileForbidden = true
else
	FILE_RELATED_VIOLATIONS.hash_catalogue_file_not_found = true
	FILE_RELATED_VIOLATIONS.hash_catalogue_error = true
	FILE_RELATED_VIOLATIONS.unknown_game_file_version = true
	FILE_RELATED_VIOLATIONS.required_game_file_not_found = true
end

EacManager._handle_violations = function (self)
	if self._eac_violation_type then
		return
	end

	if USE_EOS and rawget(_G, "EOS_EAC") then
		local violation, cause

		if not EOS_EAC.has_eac_client() then
			violation, cause = "NO_BOOTSTRAPPER", "NO_BOOTSTRAPPER"
		elseif self._eos_auth_error then
			violation, cause = "AUTH_ERROR", self._eos_auth_error
		else
			violation, cause = EOS_EAC.get_integrity_violation()
			violation = violation and (table.find(EOS_EAC_ACCVT, violation) or "UNKNOWN")
		end

		if violation then
			local KEYWORD_START = "{#color(193,91,36)}"
			local VALUE_START = "{#color(255,255,255)}: "
			local BODY_START = "{#reset()}"
			local message = KEYWORD_START .. Localize("eac_state") .. VALUE_START .. Localize("eac_state_untrusted") .. "\n" .. KEYWORD_START .. Localize("eac_violation_type") .. VALUE_START .. violation .. "\n" .. KEYWORD_START .. Localize("eac_cause") .. VALUE_START .. cause .. "\n" .. BODY_START .. Localize("eac_untrusted_explanation")

			self._eac_violation_message = message
			self._eac_violation_type = violation
		end
	elseif rawget(_G, "EAC") then
		local state, _, cause, violation = EAC.state()

		if state == EacState.untrusted or state == EacState.banned then
			local KEYWORD_START = "{#color(193,91,36)}"
			local VALUE_START = "{#color(255,255,255)}: "
			local BODY_START = "{#reset()}"
			local message = KEYWORD_START .. Localize("eac_state") .. VALUE_START .. Localize("eac_state_untrusted") .. "\n" .. KEYWORD_START .. Localize("eac_violation_type") .. VALUE_START .. violation .. "\n" .. KEYWORD_START .. Localize("eac_cause") .. VALUE_START .. cause .. "\n" .. BODY_START .. Localize(state == EacState.banned and "eac_banned_explanation" or "eac_untrusted_explanation")

			self._eac_violation_message = message
			self._eac_violation_type = violation
		end
	end

	if self._eac_violation_type then
		Crashify.print_exception("EAC", "Integrity violation: %s", self._eac_violation_type)
	end
end

EacManager._handle_popups = function (self)
	local popup_manager = Managers.popup

	if self._popup_id ~= nil and popup_manager:query_result(self._popup_id) == "quit" then
		self._popup_id = nil

		Application.quit()
	end

	if self._suppress_popup then
		return
	end

	if not FILE_RELATED_VIOLATIONS[self._eac_violation_type] then
		return
	end

	local body = Localize("eac_file_corruption_detected")
	local title = Localize("eac_file_corruption_topic")
	local quit_button_text = Localize("menu_quit")

	self._popup_id = popup_manager:queue_popup(body, title, "quit", quit_button_text)
	self._suppress_popup = true
end

EacManager.draw_panel = function (self, gui, dt)
	local message = self._eac_violation_message

	if not message or self._suppress_panel then
		return
	end

	local V2, V3, CC = Vector2, Vector3, Color
	local scale = math.max(RESOLUTION_LOOKUP.scale, 0.5)
	local screen_size = V2(RESOLUTION_LOOKUP.res_w, RESOLUTION_LOOKUP.res_h)
	local font = "materials/fonts/arial"
	local font_size = 14 * scale
	local line_height = 1.1 * font_size
	local border_color = CC(192, 91, 36)
	local background_color = CC(200, 0, 0, 0)
	local text_color = CC(180, 180, 180)
	local panel_width = 500 * scale
	local border_width = 1 * scale
	local padding = V2(15, 10) * scale
	local margin = V2(40, 20) * scale
	local panel_layer = 995
	local lines = Gui.word_wrap(gui, message, font, font_size, panel_width, " ", "_-+&/", "\n", true, Gui.FormatDirectives)
	local panel_size = 2 * padding + V2(panel_width, #lines * line_height)
	local panel_pos = screen_size - panel_size - margin + V3(0, 0, panel_layer)

	Gui.rect(gui, panel_pos, panel_size, background_color)
	Gui.rect(gui, panel_pos + V3(0, 0, 1), V2(border_width, panel_size.y), border_color)
	Gui.rect(gui, panel_pos + V3(0, 0, 1), V2(panel_size.x, border_width), border_color)
	Gui.rect(gui, panel_pos + V3(0, panel_size.y, 1), V2(panel_size.x, -border_width), border_color)
	Gui.rect(gui, panel_pos + V3(panel_size.x, 0, 1), V2(-border_width, panel_size.y), border_color)

	local line_pos = panel_pos + padding + V3(0, 0.18 * font_size, 2)

	for i = #lines, 1, -1 do
		Gui.text(gui, lines[i], font, font_size, nil, line_pos, text_color, Gui.FormatDirectives)

		line_pos.y = line_pos.y + line_height
	end
end

EacManager.eac_ready_locally = function (self)
	return not not self._local_role
end

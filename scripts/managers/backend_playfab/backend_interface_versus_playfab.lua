-- chunkname: @scripts/managers/backend_playfab/backend_interface_versus_playfab.lua

local FlexmatchQueueStatus = require("scripts/managers/backend_playfab/settings/flexmatch_queue_status")

BackendInterfaceVersusPlayFab = class(BackendInterfaceVersusPlayFab)

local LOADOUT_INTERFACE_OVERRIDES = {
	slot_frame = "versus",
	slot_hat = "versus",
	slot_melee = "versus",
	slot_necklace = "versus",
	slot_pose = "items",
	slot_ranged = "versus",
	slot_ring = "versus",
	slot_skin = "versus",
	slot_trinket_1 = "versus",
}

local function debug_printf(text, ...)
	text = "[BackendInterfaceVersusPlayFab] " .. text

	printf(text, ...)
end

local function print_error(data, code, text, ...)
	local error_msg

	if data.response then
		code = code or -1

		local status = data.status or "UNKNOWN_ERROR"
		local response = data.response

		error_msg = string.format("[%s] %s (%d)", status, response, code)
	elseif data.message then
		error_msg = data.message
	else
		error_msg = "Unknown Error"
	end

	debug_printf(error_msg)
	debug_printf(text, ...)
	table.dump(data, "BackendInterfaceVersusPlayFab", 5)
end

local function parse_response(data)
	local result, parsed_data = pcall(cjson.decode, data)

	if result then
		return parsed_data
	end

	return {
		response = tostring(data),
	}
end

BackendInterfaceVersusPlayFab.init = function (self, backend_mirror)
	self._backend_mirror = backend_mirror
	self._profile_data = {}
	self._items_interface = Managers.backend:get_interface("items")

	Managers.backend:add_loadout_interface_override("versus", LOADOUT_INTERFACE_OVERRIDES)
	Managers.backend:add_loadout_interface_override("inn_vs", LOADOUT_INTERFACE_OVERRIDES)

	self._dirty = true
	self._is_matchmaking = false
	self._backfilling_player_ids = {}
	self._matchmaking_status = nil
end

BackendInterfaceVersusPlayFab._refresh = function (self)
	local vs_profile_data = self._backend_mirror:get_read_only_data("vs_profile_data") or "{}"

	self._profile_data = cjson.decode(vs_profile_data)
	self._dirty = false
end

BackendInterfaceVersusPlayFab.make_dirty = function (self)
	self._dirty = true
end

BackendInterfaceVersusPlayFab.ready = function (self)
	return true
end

BackendInterfaceVersusPlayFab.get_profile_data = function (self, key)
	if self._dirty then
		self:_refresh()
	end

	return self._profile_data[key]
end

BackendInterfaceVersusPlayFab.get_loadout_item_id = function (self, career_name, slot_name, is_bot)
	if self._dirty then
		self:_refresh()
	end

	return self._items_interface:get_loadout_item_id(career_name, slot_name, is_bot)
end

BackendInterfaceVersusPlayFab.set_loadout_item = function (self, item_id, career_name, slot_name)
	if self._dirty then
		self:_refresh()
	end

	self._dirty = true

	return self._items_interface:set_loadout_item(item_id, career_name, slot_name)
end

local post_headers = {
	"Content-Type: application/json",
}
local get_headers = {
	"User-Agent: Warhammer: Vermintide 2",
	"Accept: application/json",
}

BackendInterfaceVersusPlayFab.request_regions = function (self, external_cb)
	fassert(external_cb ~= nil, "request_regions is missing external_cb")

	local request = {
		FunctionName = "getMatchMakingRegions",
		FunctionParameter = {},
	}
	local success_callback = callback(self, "request_matchmaking_regions_cb", external_cb)
	local request_queue = self._backend_mirror:request_queue()

	request_queue:enqueue(request, success_callback, true)
end

BackendInterfaceVersusPlayFab.request_matchmaking_regions_cb = function (self, external_cb, result)
	local function_result = result.FunctionResult

	external_cb(function_result)

	if not function_result.success or not function_result.regions then
		if type(result) == "table" then
			table.dump(result, "BackendInterfaceVersusPlayFab", 5)
		else
			print("getMatchmakingQueueTicket result: %s", tostring(result))
		end

		Crashify.print_exception("BackendInterfaceVersusPlayFab", "Failed to get matchmaking regions")
	end
end

BackendInterfaceVersusPlayFab.get_matchmaking_url = function (self)
	if self._base_url then
		return self._base_url
	end

	return self._backend_mirror:get_matchmaking_url()
end

BackendInterfaceVersusPlayFab.start_matchmaking = function (self, queue_tickets, external_cb)
	debug_printf("Starting matchmaking")

	local base_url = self:get_matchmaking_url()
	local url = string.format("%s/matchmaking/start", base_url)
	local cb = callback(self, "_start_matchmaking_cb", external_cb)
	local body = cjson.encode({
		queueTickets = table.values(queue_tickets),
	})

	Managers.curl:post(url, body, post_headers, cb)
end

BackendInterfaceVersusPlayFab._start_matchmaking_cb = function (self, external_cb, result, code, headers, data)
	local parsed_data = parse_response(data)

	if parsed_data.debug_msg then
		Managers.chat:add_local_system_message(1, parsed_data.debug_msg, true)
	end

	if not result or code ~= 200 then
		print_error(parsed_data, code, "Failed to start matchmaking. result: %s", tostring(result))
		Crashify.print_exception("BackendInterfaceVersusPlayFab", "Failed to start matchmaking")

		if external_cb then
			external_cb(result, code, headers, nil)
		end

		return
	end

	self._matchmaking_session_id = parsed_data.matchmakingSessionId
	self._is_matchmaking = true
	self._matchmaking_status = parsed_data.status

	debug_printf("Matchmaking started. matchmakingSessionId: %s", parsed_data.matchmakingSessionId)

	if external_cb then
		external_cb(result, code, headers, parsed_data)
	end
end

BackendInterfaceVersusPlayFab.cancel_matchmaking = function (self, external_cb)
	debug_printf("Cancelling matchmaking")

	if not self:is_matchmaking() then
		if external_cb then
			external_cb(true, 200)
		end

		return
	end

	if not self._matchmaking_session_id then
		debug_printf("Failed to cancel matchmaking. Reason: missing matchmaking_session_id")

		if external_cb then
			external_cb(false, 404)
		end

		return
	end

	local base_url = self:get_matchmaking_url()
	local url = string.format("%s/matchmaking/sessions/%s/cancel", base_url, self._matchmaking_session_id)
	local cb = callback(self, "_cancel_matchmaking_cb", external_cb)
	local body = cjson.encode({
		matchmakingSessionId = self._matchmaking_session_id,
	})

	Managers.curl:post(url, body, post_headers, cb)
end

BackendInterfaceVersusPlayFab._cancel_matchmaking_cb = function (self, external_cb, result, code, headers, data)
	self._matchmaking_session_id = nil
	self._is_matchmaking = nil

	local parsed_data = parse_response(data)

	if parsed_data.debug_msg then
		Managers.chat:add_local_system_message(1, parsed_data.debug_msg, true)
	end

	if not result or code ~= 200 then
		print_error(parsed_data, code, "Failed to cancel matchmaking. result: %s", tostring(result))

		if external_cb then
			external_cb(result, code, headers, nil)
		end

		return
	end

	debug_printf("Matchmaking cancelled")

	if external_cb then
		external_cb(result, code, headers, parsed_data)
	end
end

BackendInterfaceVersusPlayFab.fetch_matchmaking_session_data = function (self, external_cb)
	if not self._matchmaking_session_id then
		debug_printf("Failed to fetch matchmaking session data. Reason: missing matchmaking_session_id")

		if external_cb then
			external_cb(false, 404)
		end

		return false
	end

	local base_url = self:get_matchmaking_url()
	local url = string.format("%s/matchmaking/sessions/%s", base_url, self._matchmaking_session_id)
	local cb = callback(self, "_fetch_matchmaking_session_data_cb", external_cb)

	Managers.curl:get(url, get_headers, cb)
end

BackendInterfaceVersusPlayFab._fetch_matchmaking_session_data_cb = function (self, external_cb, result, code, headers, data)
	local parsed_data = parse_response(data)

	if parsed_data.debug_msg then
		Managers.chat:add_local_system_message(1, parsed_data.debug_msg, true)
	end

	if not result or code ~= 200 then
		print_error(parsed_data, code, "Failed to fetch matchmaking session data. result: %s", tostring(result))
		Crashify.print_exception("BackendInterfaceVersusPlayFab", "Failed to fetch matchmaking session data")

		if external_cb then
			external_cb(result, code, headers, nil)
		end

		return
	end

	if parsed_data.status ~= self._matchmaking_status then
		debug_printf("Matchmaking session data fetched. matchmakingSessionId: %s, status: %s", parsed_data.matchmakingSessionId, parsed_data.status)

		self._matchmaking_status = parsed_data.status
	end

	if parsed_data.status == FlexmatchQueueStatus.Succeeded then
		self._is_matchmaking = false
	elseif parsed_data.status == FlexmatchQueueStatus.Failed then
		print_error(parsed_data, code, "Matchmaking changed to unwanted status '%s'. result: %s", parsed_data.status, tostring(result))
		Crashify.print_exception("BackendInterfaceVersusPlayFab", "Matchmaking changed to unwanted status '%s'", parsed_data.status)
	end

	if external_cb then
		external_cb(result, code, headers, parsed_data)
	end
end

BackendInterfaceVersusPlayFab.is_matchmaking = function (self)
	return self._is_matchmaking
end

BackendInterfaceVersusPlayFab.request_matchmaking_ticket = function (self, latency_list, external_cb)
	debug_printf("Requesting matchmaking ticket")
	fassert(external_cb ~= nil, "request_matchmaking_ticket is missing external_cb")

	local request = {
		FunctionName = "getMatchmakingQueueTicket",
		FunctionParameter = {
			alias_type = "mission",
			matchmaking_type = "quickplay",
			peer_id = Steam.user_id(),
			latency_list = latency_list,
			network_hash = LobbySetup.network_hash(),
		},
	}
	local success_callback = callback(self, "request_matchmaking_ticket_cb", external_cb)
	local request_queue = self._backend_mirror:request_queue()

	request_queue:enqueue(request, success_callback, true)
end

BackendInterfaceVersusPlayFab.request_matchmaking_ticket_cb = function (self, external_cb, result)
	debug_printf("Matchmaking ticket response")

	local function_result = result.FunctionResult

	if function_result.ticket then
		self._base_url = function_result.url
	else
		if type(function_result) == "table" then
			table.dump(function_result, "BackendInterfaceVersusPlayFab", 5)
		else
			print("getMatchmakingQueueTicket result: %s", tostring(function_result))
		end

		Crashify.print_exception("BackendInterfaceVersusPlayFab", "Failed to get matchmaking queue ticket")
	end

	external_cb(function_result)
end

BackendInterfaceVersusPlayFab.reset_fetched_data = function (self)
	assert(DEDICATED_SERVER, "Dedicated server function only")

	self._matchmaking_session_id = false
	self._game_session_data = nil
	self._game_session_id = nil
end

BackendInterfaceVersusPlayFab.get_game_session_data = function (self)
	return self._game_session_data
end

BackendInterfaceVersusPlayFab.set_matchmaking_session_id = function (self, session_id)
	assert(not DEDICATED_SERVER, "player function only")

	self._matchmaking_session_id = session_id
	self._is_matchmaking = session_id ~= nil
end

BackendInterfaceVersusPlayFab.get_matchmaking_session_id = function (self)
	return self._matchmaking_session_id
end

BackendInterfaceVersusPlayFab.is_player_in_backfilling_data = function (self, player_id)
	return table.contains(self._backfilling_player_ids, player_id)
end

BackendInterfaceVersusPlayFab.matchmaking_enabled = function (self, matchmaking_type)
	local backend_manager = Managers.backend
	local title_settings = backend_manager:get_title_settings()
	local matchmaking_settings = title_settings.versus.matchmaking_settings

	if not matchmaking_settings then
		return true
	end

	local type_settings = matchmaking_settings[matchmaking_type]

	if not type_settings then
		return true
	end

	local enabled = type_settings.enabled

	if enabled == nil then
		return true
	end

	local reason = type_settings.disabled_reason

	return enabled, reason
end

-- chunkname: @scripts/managers/account/account_manager_ps4.lua

require("scripts/managers/account/script_web_api_psn")
require("scripts/utils/base64")
require("scripts/network/ps_restrictions")
require("scripts/network/script_tss_token")
require("scripts/managers/matchmaking/matchmaking_regions")

local PresenceSet = require("scripts/settings/presence_set")

AccountManager = class(AccountManager)
AccountManager.VERSION = "ps4"

local FRIEND_LIST_REQUEST_DELAY = 10
local FRIEND_LIST_REQUEST_LIMIT = 500

local function dprint(...)
	print("[AccountManager] ", ...)
end

local CONSOLE_TYPE_SETTINGS = {
	ps4 = {
		allow_dismemberment = false,
	},
	ps4_pro = {
		allow_dismemberment = false,
	},
	ps5 = {
		allow_dismemberment = true,
	},
	default = {
		allow_dismemberment = false,
	},
}

AccountManager.init = function (self)
	if self:is_online() then
		self:fetch_user_data()
	end

	self._web_api = ScriptWebApiPsn:new()
	self._initial_user_id = PS4.initial_user_id()

	if not script_data.settings.use_beta_mode then
		Trophies.create_context(self._initial_user_id)
	end

	self._country_code = PS4.user_country(self._initial_user_id)
	self._room_state = nil
	self._current_room = nil
	self._offline_mode = nil
	self._session = nil
	self._has_presence_game_data = false
	self._np_title_id = PS4.title_id()
	self._ps_restrictions = PSRestrictions:new()
	self._dialog_open = false
	self._realtime_multiplay = false
	self._realtime_multiplay_host = nil
	self._psn_client_error = nil
	self._friend_data = {}
	self._next_friend_list_request = 0
	self._fetching_friend_list = false
	self._fetching_matchmaking_data = false
	self._next_matchmaking_data_fetch = 0
	self._retrigger_popups_check = false
end

AccountManager.set_controller = function (self, controller)
	self._active_controller = controller
end

AccountManager.fetch_user_data = function (self)
	self._online_id = PS4.online_id()
	self._np_id = PS4.np_id()
	self._account_id = PS4.account_id()

	Crashify.print_property("ps4_online_id", self._online_id)
	Crashify.print_property("ps4_account_id", self._account_id)
	print("PSN_ID:", self._online_id)
end

AccountManager.np_title_id = function (self)
	return self._np_title_id
end

AccountManager.initial_user_id = function (self)
	return self._initial_user_id
end

AccountManager.user_id = function (self)
	return self._initial_user_id
end

AccountManager.user_detached = function (self)
	return self._user_detached
end

AccountManager.active_controller = function (self, user_id)
	return Managers.input:get_most_recent_device()
end

AccountManager.np_id = function (self)
	return self._np_id
end

AccountManager.online_id = function (self)
	return self._online_id
end

AccountManager.account_id = function (self)
	return self._account_id
end

AccountManager.add_restriction_user = function (self, user_id)
	self._ps_restrictions:add_user(user_id)
end

AccountManager.set_current_lobby = function (self, lobby)
	self._current_room = lobby
end

AccountManager.initiate_leave_game = function (self)
	self._leave_game = true

	if self:is_online() and self._has_presence_game_data then
		self:delete_presence_game_data()
	end
end

AccountManager.leaving_game = function (self)
	return self._leave_game
end

AccountManager.reset = function (self)
	if self._popup_id then
		Managers.popup:cancel_popup(self._popup_id)

		self._popup_info = nil
		self._popup_id = nil
	end

	self._signed_in = false
	self._offline_mode = nil
	self._leave_game = nil
	self._user_detached = nil
end

AccountManager.destroy = function (self)
	self._web_api:destroy()

	self._web_api = nil

	if self._has_presence_game_data then
		self:delete_presence_game_data()
	end

	local session = self._session

	if session then
		if session.is_owner then
			self:delete_session()
		else
			self:leave_session()
		end
	end
end

AccountManager.sign_in = function (self)
	self._signed_in = PS4.signed_in(self._initial_user_id)
end

AccountManager.is_online = function (self)
	return not self._offline_mode and PS4.signed_in()
end

AccountManager.offline_mode = function (self)
	return self._offline_mode
end

AccountManager.set_offline_mode = function (self, offline_mode)
	self._offline_mode = offline_mode
end

AccountManager.update = function (self, dt)
	self:_update_playtogether()
	self:_update_psn_client(dt)

	if self:is_online() then
		self:_update_psn()
	end

	self:_notify_plus()
	self:_verify_profile()
	self._web_api:update(dt)
	self:_update_profile_dialog()
	self:_check_trigger_popup()
	self:_check_popup()
end

AccountManager._check_trigger_popup = function (self)
	if not self._retrigger_popups_check then
		return
	end

	local popup_manager = Managers.popup

	if self._popup_id ~= nil and not popup_manager:has_popup_with_id(self._popup_id) then
		self._popup_id = popup_manager:queue_popup(self._popup_info.header, self._popup_info.text, self._popup_info.action1, self._popup_info.buttontext1)
	end

	self._retrigger_popups_check = false
end

AccountManager._check_popup = function (self)
	if self._popup_id then
		local result = Managers.popup:query_result(self._popup_id)

		if result then
			self._popup_id = nil

			if result == "retry_verify_profile" then
				self._user_detached = false

				self:_verify_profile()
			else
				fassert(false, "[AccountManager:_check_popup] No result trackedc called %q", result)
			end
		end
	end
end

AccountManager._verify_profile = function (self)
	if self._popup_id then
		return
	end

	if self._initial_user_id then
		local user_detached = false

		if not self._user_detached then
			user_detached = not PS4.signed_in(self._initial_user_id)

			if user_detached and self._signed_in then
				self:_queue_popup(Localize("profile_signed_out_header"), Localize("popup_xboxlive_profile_acquire_error_header"), "retry_verify_profile", Localize("button_retry"))

				self._user_detached = true
			elseif self._active_controller then
				local controller_changed = false
				local user_id = self._active_controller and self._active_controller.user_id()

				if not self._active_controller or not self._active_controller.user_id() or self._active_controller.disconnected() or controller_changed then
					self:_queue_popup(Localize("controller_disconnected"), Localize("controller_disconnected_header"), "retry_verify_profile", Localize("button_retry"))

					self._user_detached = true
				end
			end
		end
	end
end

AccountManager._queue_popup = function (self, header, text, action1, buttontext1)
	self._popup_info = {
		header = header,
		text = text,
		action1 = action1,
		buttontext1 = buttontext1,
	}
	self._popup_id = Managers.popup:queue_popup(header, text, action1, buttontext1)
end

AccountManager._update_playtogether = function (self)
	if self._session ~= nil then
		local invite_manager = Managers.invite
		local new_list = SessionInvitation.play_together_list()

		if new_list ~= nil then
			invite_manager:set_play_together_list(new_list)
		end

		local play_together_list = invite_manager:play_together_list()
		local can_invite = Managers.matchmaking ~= nil

		if play_together_list ~= nil and can_invite then
			print("[AccountManager] Play Together: sending invites")
			invite_manager:clear_play_together_list()
			self:send_session_invitation_multiple(play_together_list)
		end
	end
end

local PSN_CLIENT_READY_TIMEOUT = 20

AccountManager._update_psn_client = function (self, dt)
	if not rawget(_G, "LobbyInternal") or not LobbyInternal.client or LobbyInternal.TYPE ~= "psn" then
		self._psn_client_error = nil

		return
	end

	if self._psn_client_error then
		return
	end

	if not LobbyInternal.client_ready() then
		if LobbyInternal.client_lost_context() or LobbyInternal.client_failed() then
			self._psn_client_error = "lost_context"
		else
			self._psn_client_timeout_timer = (self._psn_client_timeout_timer or 0) + dt

			if self._psn_client_timeout_timer > PSN_CLIENT_READY_TIMEOUT then
				self._psn_client_error = "ready_timeout"
				self._psn_client_timeout_timer = 0
			end
		end
	else
		self._psn_client_timeout_timer = 0
	end
end

AccountManager.psn_client_error = function (self)
	return self._psn_client_error
end

AccountManager._update_psn = function (self)
	local current_room = self._current_room
	local previous_room = self._previous_room
	local room_state_current = current_room and current_room:state()
	local room_state_previous = self._room_state
	local room_joined, room_left = false, false

	if current_room ~= previous_room then
		room_joined = room_state_current == LobbyState.JOINED
		room_left = room_state_previous == LobbyState.JOINED
	else
		room_joined = room_state_previous ~= LobbyState.JOINED and room_state_current == LobbyState.JOINED
		room_left = room_state_previous == LobbyState.JOINED and room_state_current ~= LobbyState.JOINED
	end

	self:_update_psn_presence(room_joined, room_left)
	self:_update_psn_session(room_joined, room_left)

	self._previous_room = current_room
	self._room_state = room_state_current
end

AccountManager._update_psn_presence = function (self, room_joined, room_left)
	if room_left then
		-- Nothing
	end

	if room_joined then
		local room = self._current_room
		local room_id = room:sce_np_room_id()

		self:set_presence_game_data(room_id)
	end
end

AccountManager._update_psn_session = function (self, room_joined, room_left)
	local session = self._session

	if room_left and session then
		if session.is_owner then
			self:delete_session()
		else
			self:leave_session()
		end
	end

	if room_joined then
		local room = self._current_room
		local room_id = room:sce_np_room_id()

		if room:lobby_host() == Network.peer_id() then
			self:create_session(room_id)
		else
			local session_id = room:data("session_id")

			if session_id then
				self:join_session(session_id)
			end
		end
	end
end

AccountManager._notify_plus = function (self)
	if not self._realtime_multiplay then
		return
	end

	if not self._session then
		return
	end

	local initial_host = self._realtime_multiplay_host

	if not initial_host then
		return
	end

	local current_room = self._current_room
	local current_host = current_room and current_room:lobby_host()

	if not current_host then
		return
	end

	if initial_host ~= current_host then
		self._realtime_multiplay = false
		self._realtime_multiplay_host = nil

		return
	end

	local time_since_receive = Network.time_since_receive(current_host)

	if time_since_receive > GameSettingsDevelopment.network_silence_warning_delay then
		return
	end

	local initial_user_id = self:user_id()

	if PS4.signed_in(initial_user_id) then
		NpCheck.notify_plus(initial_user_id, NpCheck.REALTIME_MULTIPLAY)
	end
end

AccountManager.friends_list_initiated = function (self)
	return
end

AccountManager.region = function (self)
	return self._country_code
end

AccountManager._update_matchmaking_data = function (self, dt)
	local t = Managers.time:time("main")

	if not self._matchmaking_data and not self._fetching_matchmaking_data and t >= self._next_matchmaking_data_fetch then
		self:_fetch_matchmaking_data(t)
	end
end

AccountManager._fetch_matchmaking_data = function (self, t)
	print("FETCHING MATCHMAKING DATA")

	local matchmaking_data_slot = 0
	local token = Tss.get(matchmaking_data_slot)
	local script_token = ScriptTssToken:new(token)

	Managers.token:register_token(script_token, callback(self, "cb_matchmaking_data_fetched"))

	self._fetching_matchmaking_data = true
	self._next_matchmaking_data_fetch = t + 3
end

AccountManager.cb_matchmaking_data_fetched = function (self, info)
	self._fetching_matchmaking_data = false

	if info.result then
		print("MATCHMAKING DATA FETCHED")
		MatchmakingRegionsHelper.populate_matchmaking_data(info.result)

		self._matchmaking_data = true
	else
		Application.warning(string.format("[AccountManager] Failed fetching matchmaking data"))
	end
end

AccountManager.set_realtime_multiplay = function (self, active)
	self._realtime_multiplay = active

	if active then
		local room = self._current_room
		local host = room and room:lobby_host()

		self._realtime_multiplay_host = host
	else
		self._realtime_multiplay_host = nil
	end
end

AccountManager._update_profile_dialog = function (self)
	if not self._dialog_open then
		return
	end

	NpProfileDialog.update()

	local status = NpProfileDialog.status()

	if status == NpProfileDialog.FINISHED then
		NpProfileDialog.terminate()

		self._dialog_open = false
	end
end

AccountManager.current_psn_session = function (self)
	local session = self._session

	return session and session.id
end

AccountManager.all_sessions_cleaned_up = function (self)
	return true
end

AccountManager.has_access = function (self, restriction, user_id)
	local user_id = user_id or self:user_id()

	return self._ps_restrictions:has_access(user_id, restriction)
end

AccountManager.has_error = function (self, restriction, user_id)
	local user_id = user_id or self:user_id()

	return self._ps_restrictions:has_error(user_id, restriction)
end

AccountManager.restriction_access_fetched = function (self, restriction)
	local user_id = self:user_id()

	return self._ps_restrictions:restriction_access_fetched(user_id, restriction)
end

AccountManager.refetch_restriction_access = function (self, user_id, restrictions)
	local user_id = user_id or self:user_id()

	self._ps_restrictions:refetch_restriction_access(user_id, restrictions)
end

AccountManager.show_player_profile = function (self, user_id)
	if self._dialog_open then
		return
	end

	local own_user_id = self:user_id()

	user_id = user_id or self:user_id()

	NpProfileDialog.initialize()
	NpProfileDialog.open(own_user_id, user_id)

	self._dialog_open = true
end

AccountManager.show_player_profile_with_np_id = function (self, np_id)
	Application.error("[AccountManager:show_player_profile_with_np_id] This function is deprecated, use AccountManager:show_player_profile_with_account_id() instead")
end

AccountManager.show_player_profile_with_account_id = function (self, account_id)
	if self._dialog_open then
		return
	end

	local own_user_id = self:user_id()

	account_id = account_id or self:account_id()

	NpProfileDialog.initialize()
	NpProfileDialog.open_with_account_id(own_user_id, account_id)

	self._dialog_open = true
end

AccountManager.get_friends = function (self, num_friends_to_fetch, response_callback)
	local friend_data = self._friend_data
	local t = Managers.time:time("main")

	if self._fetching_friend_list or t < self._next_friend_list_request then
		response_callback(friend_data)
	elseif not self._account_id then
		response_callback(friend_data)
	else
		table.clear(friend_data)
		self:_fetch_friends(num_friends_to_fetch, 0, response_callback)

		self._next_friend_list_request = t + FRIEND_LIST_REQUEST_DELAY
	end
end

AccountManager._fetch_friends = function (self, num_to_fetch, offset, external_callback)
	local limit = FRIEND_LIST_REQUEST_LIMIT
	local account_id = Application.hex64_to_dec(self._account_id)
	local user_id = self:user_id()
	local api_group = "sdk:userProfile"
	local path = string.format("/v1/users/%s/friendList?friendStatus=friend&presenceType=primary&presenceDetail=true&limit=%s&offset=%s", account_id, tostring(limit), tostring(offset))
	local method = WebApi.GET
	local content
	local response_callback = callback(self, "cb_fetch_friends", num_to_fetch, offset, external_callback)

	self._web_api:send_request(user_id, api_group, path, method, content, response_callback)

	self._fetching_friend_list = true
end

AccountManager.cb_fetch_friends = function (self, num_to_fetch, offset, external_callback, result)
	local friend_data = self._friend_data

	if not result then
		self._fetching_friend_list = false

		external_callback(friend_data)

		return
	end

	local result_list = result.friendList

	for i = 1, #result_list do
		local entry = result_list[i]
		local user = entry.user
		local account_id = Application.dec64_to_hex(user.accountId)
		local online_id = user.onlineId
		local presence = entry.presence
		local primary_info = presence.primaryInfo
		local online_status = primary_info.onlineStatus
		local room_id = primary_info.gameData and from_base64(primary_info.gameData)
		local status, playing_this_game

		if online_status and online_status == "online" then
			status = "online"

			local game_title_info = primary_info.gameTitleInfo

			if game_title_info and game_title_info.npTitleId == self._np_title_id then
				playing_this_game = true
			else
				playing_this_game = false
			end
		else
			status = "offline"
			playing_this_game = false
		end

		friend_data[account_id] = {
			name = online_id,
			status = status,
			playing_this_game = playing_this_game,
			room_id = room_id,
		}
	end

	local limit = FRIEND_LIST_REQUEST_LIMIT

	if #result_list == limit and num_to_fetch > table.size(friend_data) then
		offset = offset + limit

		self:_fetch_friends(num_to_fetch, offset, external_callback)
	else
		self._fetching_friend_list = false

		external_callback(friend_data)
	end
end

AccountManager.get_user_presence = function (self, account_id, response_callback)
	local user_id = self:user_id()
	local api_group = "sdk:userProfile"
	local path = string.format("/v1/users/%s/presence?type=platform&platform=PS4", Application.hex64_to_dec(account_id))
	local method = WebApi.GET
	local content

	self._web_api:send_request(user_id, api_group, path, method, content, response_callback)
end

AccountManager.set_presence = function (self, presence, append_string)
	if not self:is_online() or not self._account_id then
		return
	end

	local account_id = Application.hex64_to_dec(self._account_id)
	local user_id = self:user_id()
	local api_group = "sdk:userProfile"
	local path = string.format("/v1/users/%s/presence/gameStatus", account_id)
	local method = WebApi.PUT
	local content = self:_set_presence_status_content(presence, append_string)

	self._web_api:send_request(user_id, api_group, path, method, content)
end

AccountManager.set_presence_game_data = function (self, room_id)
	local account_id = Application.hex64_to_dec(self._account_id)
	local user_id = self:user_id()
	local api_group = "sdk:userProfile"
	local path = string.format("/v1/users/%s/presence/gameData", account_id)
	local method = WebApi.PUT
	local game_data = to_base64(room_id)
	local content = {
		gameData = game_data,
	}

	self._web_api:send_request(user_id, api_group, path, method, content)

	self._has_presence_game_data = true
end

AccountManager.delete_presence_game_data = function (self)
	local account_id = Application.hex64_to_dec(self._account_id)
	local user_id = self:user_id()
	local api_group = "sdk:userProfile"
	local path = string.format("/v1/users/%s/presence/gameData", account_id)
	local method = WebApi.DELETE

	self._web_api:send_request(user_id, api_group, path, method)

	self._has_presence_game_data = false
end

AccountManager.create_session = function (self, room_id)
	assert(room_id, "[AccountManager] Tried to create psn session but parameter \"room_id\" is missing")

	local level_key = Managers.level_transition_handler:get_current_level_keys()
	local lock_flag = false

	if level_key and level_key == "tutorial" then
		lock_flag = true
	end

	local user_id = self:user_id()
	local session_parameters_table = {
		max_user = 4,
		platforms = "[\"PS4\"]",
		privacy = "public",
		type = "owner-bind",
		lock_flag = lock_flag,
	}
	local session_parameters = self:_format_session_parameters(session_parameters_table)
	local session_image = "/app0/content/session_images/session_image_default.jpg"
	local session_data = room_id
	local changable_session_data

	self._web_api:send_request_create_session(user_id, session_parameters, session_image, session_data, changable_session_data, callback(self, "_cb_session_created"))
end

AccountManager._cb_session_created = function (self, result)
	if result then
		local session_id = result.sessionId

		self._session = {
			is_owner = true,
			id = session_id,
		}

		local room = self._current_room

		if room then
			room:set_data("session_id", session_id)
		end
	else
		self._session = nil
	end
end

AccountManager.delete_session = function (self)
	local user_id = self:user_id()
	local session_id = self._session.id
	local api_group = "sessionInvitation"
	local path = string.format("/v1/sessions/%s", session_id)
	local method = WebApi.DELETE

	self._web_api:send_request(user_id, api_group, path, method)

	self._session = nil
end

AccountManager.join_session = function (self, session_id)
	local user_id = self:user_id()
	local api_group = "sessionInvitation"
	local path = string.format("/v1/sessions/%s/members", tostring(session_id))
	local method = WebApi.POST

	self._web_api:send_request(user_id, api_group, path, method)

	self._session = {
		is_owner = false,
		id = session_id,
	}
end

AccountManager.leave_session = function (self)
	local user_id = self:user_id()
	local session_id = self._session.id
	local api_group = "sessionInvitation"
	local path = string.format("/v1/sessions/%s/members/me", tostring(session_id))
	local method = WebApi.DELETE

	self._web_api:send_request(user_id, api_group, path, method)

	self._session = nil
end

AccountManager.get_session_data = function (self, session_id, response_callback)
	local user_id = self:user_id()
	local api_group = "sessionInvitation"
	local path = string.format("/v1/sessions/%s/sessionData", tostring(session_id))
	local method = WebApi.GET
	local content
	local response_format = WebApi.STRING

	self._web_api:send_request(user_id, api_group, path, method, content, response_callback, response_format)
end

AccountManager.send_session_invitation = function (self, to_account_id)
	local user_id = self:user_id()
	local session_id = self._session.id
	local message = Localize("ps4_session_invitation")
	local params = ""

	params = params .. "{\r\n"
	params = params .. "  \"to\":[\r\n"
	params = params .. string.format("    \"%s\"\r\n", Application.hex64_to_dec(to_account_id))
	params = params .. "  ],\r\n"
	params = params .. string.format("  \"message\":\"%s\"\r\n", message)
	params = params .. "}"

	self._web_api:send_request_session_invitation(user_id, params, session_id)
end

AccountManager.has_session = function (self)
	return self._session ~= nil and self._session.id ~= nil
end

AccountManager.send_session_invitation_multiple = function (self, to_account_ids)
	local user_id = self:user_id()
	local session_id = self._session.id
	local message = Localize("ps4_session_invitation")
	local params = ""

	params = params .. "{\r\n"
	params = params .. "  \"to\":[\r\n"

	for i = 1, #to_account_ids do
		if to_account_ids[i + 1] then
			params = params .. string.format("    \"%s\",\r\n", Application.hex64_to_dec(to_account_ids[i]))
		else
			params = params .. string.format("    \"%s\"\r\n", Application.hex64_to_dec(to_account_ids[i]))
		end
	end

	params = params .. "  ],\r\n"
	params = params .. string.format("  \"message\":\"%s\"\r\n", message)
	params = params .. "}"

	self._web_api:send_request_session_invitation(user_id, params, session_id)
end

AccountManager.activity_feed_post_mission_completed = function (self, level_display_name, difficulty_display_name)
	if not self:is_online() or not self._account_id then
		return
	end

	local user_id = self:user_id()
	local account_id = Application.hex64_to_dec(self._account_id)
	local title_id = self._np_title_id
	local api_group = "sdk:activityFeed"
	local path = string.format("/v1/users/%s/feed", account_id)
	local method = WebApi.POST
	local languages = {}
	local captions = {}
	local condensed = {}

	captions.default = string.format(Localize("activity_feed_finished_level_en"), Localize(level_display_name), Localize(difficulty_display_name))
	condensed.default = string.format(Localize("activity_feed_finished_level_condensed_en"), Localize(level_display_name))

	for _, language in ipairs(languages) do
		captions[language] = string.format(Localize("activity_feed_finished_level_" .. language), Localize(level_display_name), Localize(difficulty_display_name))
		condensed[language] = string.format(Localize("activity_feed_finished_level_condensed_" .. language), Localize(level_display_name))
	end

	local content = {
		storyType = "IN_GAME_POST",
		subType = 1,
		captions = captions,
		condensedCaptions = condensed,
		targets = {
			{
				type = "TITLE_ID",
				meta = title_id,
			},
		},
	}
	local content_json = cjson.encode(content)

	self._web_api:send_request(user_id, api_group, path, method, content_json)
end

AccountManager.get_entitlement = function (self, entitlement_label, optional_service_label, response_callback)
	local user_id = self:user_id()
	local api_group = "sdk:entitlement"
	local service_label = optional_service_label or 0
	local path = string.format("/v1/users/me/entitlements/%s?service_label=%s&fields=active_flag", entitlement_label, service_label)
	local method = WebApi.GET
	local content

	self._web_api:send_request(user_id, api_group, path, method, content, response_callback)
end

AccountManager.get_product_details = function (self, product_label, optional_service_label, response_callback)
	local user_id = self:user_id()
	local api_group = "sdk:commerce"
	local service_label = optional_service_label or 0
	local path = string.format("/v1/users/me/container/%s?flag=discounts&useCurrencySymbol=true&serviceLabel=%s", product_label, service_label)
	local method = WebApi.GET
	local content
	local response_format = WebApi.STRING

	self._web_api:send_request(user_id, api_group, path, method, content, response_callback, response_format)
end

AccountManager._format_session_parameters = function (self, params)
	local str = ""

	str = str .. "{\r\n"
	str = str .. string.format("  \"sessionType\":%q,\r\n", params.type)
	str = str .. string.format("  \"sessionPrivacy\":%q,\r\n", params.privacy)
	str = str .. string.format("  \"sessionMaxUser\":%s,\r\n", tostring(params.max_user))

	if params.name then
		str = str .. string.format("  \"sessionName\":%q,\r\n", params.name)
	end

	if params.status then
		str = str .. string.format("  \"sessionStatus\":%q,\r\n", params.status)
	end

	str = str .. string.format("  \"availablePlatforms\":%s,\r\n", params.platforms)
	str = str .. string.format("  \"sessionLockFlag\":%s\r\n", params.lock_flag and "true" or "false")
	str = str .. "}"

	return str
end

AccountManager._set_presence_status_content = function (self, presence, append)
	local append = append
	local presence_data = PresenceSet[presence] or {
		"en",
	}

	if not PresenceSet[presence] then
		Application.error(string.format("[AccountManager:set_presence] \"%s\" could not be found in PresenceSet - defaulting to english", presence))
	end

	local str = ""

	str = str .. "{\r\n"
	str = str .. string.format("  \"gameStatus\":%q,\r\n", Localize(presence .. "_en") .. (append and " " .. Localize(append) or ""))
	str = str .. "  \"localizedGameStatus\":[\r\n"

	if presence_data then
		for idx, language in ipairs(presence_data) do
			str = str .. "    {\r\n"
			str = str .. string.format("      \"npLanguage\":%q,\r\n", language)
			str = str .. string.format("      \"gameStatus\":%q\r\n", Localize(presence .. "_" .. language) .. (append and " " .. Localize(append) or ""))
			str = str .. (idx < #presence_data and "    },\r\n" or "    }\r\n")
		end
	end

	str = str .. "  ]\r\n"
	str = str .. "}"

	return str
end

AccountManager.force_exit_to_title_screen = function (self)
	self:initiate_leave_game()
end

AccountManager.check_popup_retrigger = function (self)
	self._retrigger_popups_check = true
end

AccountManager.set_should_teardown_xboxlive = function (self)
	return
end

AccountManager.has_fatal_error = function (self)
	return false
end

AccountManager.has_popup = function (self)
	return false
end

AccountManager.cancel_all_popups = function (self)
	return
end

AccountManager.update_presence = function (self)
	return
end

AccountManager.should_throttle = function (self)
	if PS4.is_ps5() then
		return false
	elseif PS4.is_pro() then
		return true
	else
		return true
	end
end

AccountManager.console_type = function (self)
	local console_type = "ps4"

	if PS4.is_ps5() then
		console_type = "ps5"
	elseif PS4.is_pro() then
		console_type = "ps4_pro"
	end

	return console_type
end

AccountManager.console_type_setting = function (self, setting)
	local console_type = self:console_type()
	local console_settings = CONSOLE_TYPE_SETTINGS[console_type] or CONSOLE_TYPE_SETTINGS.default

	return console_settings[setting]
end

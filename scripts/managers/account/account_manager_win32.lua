require("scripts/managers/account/presence/presence_helper")

AccountManager = class(AccountManager)
AccountManager.VERSION = "win32"
local debug_friends_list = Development.parameter("debug_friends_list")

local function dprint(...)
	print("[AccountManager] ", ...)
end

AccountManager.init = function (self)
	if HAS_STEAM then
		self._initial_user_id = Steam.user_id()
	end

	if DEDICATED_SERVER then
		self._country_code = string.lower(SteamGameServer.country_code())
	elseif HAS_STEAM then
		self._country_code = string.lower(Steam.user_country_code())
	end
end

AccountManager.user_id = function (self)
	return self._initial_user_id
end

AccountManager.update = function (self, dt)
	return
end

AccountManager.sign_in = function (self, user_id)
	Managers.state.event:trigger("account_user_signed_in")
end

AccountManager.num_signed_in_users = function (self)
	return 1
end

AccountManager.user_detached = function (self)
	return false
end

AccountManager.acitve_controller = function (self)
	return
end

AccountManager.leaving_game = function (self)
	return
end

AccountManager.reset = function (self)
	return
end

AccountManager.update_presence = function (self)
	if DEDICATED_SERVER or not rawget(_G, "Presence") then
		return
	end

	local is_in_hub_level = Managers.level_transition_handler:in_hub_level()
	local state = Managers.state
	local network = state and state.network
	local lobby = network and network:lobby()

	if not lobby then
		return
	end

	local is_server = Managers.player.is_server
	local lobby_data = is_server and lobby:get_stored_lobby_data() or LobbyInternal.get_lobby_data_from_id(lobby:id())

	if not lobby_data then
		return
	end

	if is_in_hub_level then
		Presence.set_presence("steam_display", to_boolean(script_data["eac-untrusted"]) and "#presence_modded_hub" or "#presence_official_hub")
		Presence.set_presence("steam_player_group_size", PresenceHelper.lobby_num_players())
		Presence.set_presence("hub_string", PresenceHelper.get_hub_presence())
		Presence.set_presence("level", PresenceHelper.lobby_level())
	else
		Presence.set_presence("steam_display", to_boolean(script_data["eac-untrusted"]) and "#presence_modded" or "#presence_official")
		Presence.set_presence("steam_player_group", lobby:id())
		Presence.set_presence("steam_player_group_size", PresenceHelper.lobby_num_players())
		Presence.set_presence("gamemode", PresenceHelper.lobby_gamemode(lobby_data))
		Presence.set_presence("difficulty", PresenceHelper.lobby_difficulty())
		Presence.set_presence("level", PresenceHelper.lobby_level())
	end
end

AccountManager.set_controller_disconnected = function (self, disconnected)
	return
end

AccountManager.controller_disconnected = function (self)
	return
end

AccountManager.get_friends = function (self, friends_list_limit, callback)
	if debug_friends_list then
		callback(SteamHelper.debug_friends())
	elseif rawget(_G, "Steam") and rawget(_G, "Friends") then
		callback(SteamHelper.friends())
	else
		callback(nil)
	end
end

AccountManager.set_current_lobby = function (self, lobby)
	return
end

AccountManager.all_lobbies_freed = function (self)
	return
end

AccountManager.send_session_invitation = function (self, id, invite_target)
	if rawget(_G, "Steam") and rawget(_G, "Friends") then
		Friends.invite(id, invite_target)
	end
end

AccountManager.show_player_profile = function (self, id)
	if rawget(_G, "Steam") then
		local dec_id = Steam.id_hex_to_dec(id)
		local url = "http://steamcommunity.com/profiles/" .. dec_id

		Steam.open_url(url)
	end
end

AccountManager.account_id = function (self)
	return Network.peer_id()
end

AccountManager.active_controller = function (self)
	local input_manager = Managers.input

	if input_manager:is_device_active("gamepad") then
		return input_manager:get_most_recent_device()
	end

	return nil
end

AccountManager.region = function (self)
	return self._country_code
end

AccountManager.friends_list_initiated = function (self)
	return
end

AccountManager.check_popup_retrigger = function (self)
	return
end

AccountManager.set_offline_mode = function (self, offline)
	return
end

AccountManager.is_online = function (self)
	return not GameSettingsDevelopment.use_offline_backend
end

AccountManager.offline_mode = function (self)
	return GameSettingsDevelopment.use_offline_backend == true
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

AccountManager.has_session = function (self)
	return true
end

AccountManager.has_access = function (self)
	return false
end

AccountManager.should_throttle = function (self)
	return false
end

AccountManager.console_type_setting = function (self)
	return true
end

AccountManager = class(AccountManager)
AccountManager.VERSION = "win32"
local debug_friends_list = Development.parameter("debug_friends_list")

local function dprint(...)
	print("[AccountManager] ", ...)
end

AccountManager.init = function (self)
	return
end

AccountManager.set_level_transition_handler = function (self, level_transition_handler)
	return
end

AccountManager.user_id = function (self)
	return
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

AccountManager.set_presence_menu = function (self)
	return
end

AccountManager.set_presence_idle = function (self)
	return
end

AccountManager.set_presence_credits = function (self)
	return
end

AccountManager.set_presence_ingame = function (self, level_key)
	return
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

AccountManager.friends_list_initiated = function (self)
	return
end

return

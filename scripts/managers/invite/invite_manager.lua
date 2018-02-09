InviteManager = class(InviteManager)
local REFRESH_TIME = 1
InviteManager.init = function (self)
	self.lobby_data = nil
	self.is_steam = (rawget(_G, "Steam") and rawget(_G, "Friends") and true) or false
	self.refresh_timer = REFRESH_TIME

	return 
end
InviteManager.update = function (self, dt)
	self._poll_invite(self)

	return 
end
InviteManager._poll_invite = function (self)
	if self.is_steam then
		local invite_type, lobby_id, params, invitee = Friends.next_invite()
		local illegal_combination = Development.parameter("use_lan_backend") and invite_type ~= Friends.NO_INVITE

		assert(not illegal_combination, "You cannot use Steam invites in combination with LAN backend.")

		if invite_type == Friends.INVITE_LOBBY then
			print("Got invite to lobby from " .. invitee)

			local lobby_data = SteamMisc.get_lobby_data(lobby_id)
			lobby_data.is_server_invite = false
			lobby_data.id = lobby_id
			self.lobby_data = lobby_data
		elseif invite_type == Friends.INVITE_SERVER then
			print("Got invite to server from " .. invitee)

			local lobby_data = {
				is_server_invite = true,
				id = lobby_id,
				server_info = {
					ip_port = lobby_id
				}
			}
			self.lobby_data = lobby_data
		end
	end

	return 
end
InviteManager.has_invitation = function (self)
	if self.lobby_data == nil then
		self._poll_invite(self)
	end

	return self.lobby_data ~= nil
end
InviteManager.get_invited_lobby_data = function (self)
	local lobby_data = self.lobby_data
	self.lobby_data = nil

	return lobby_data
end
InviteManager.set_invited_lobby_data = function (self, lobby_id)
	local lobby_data = LobbyInternal.get_lobby_data_from_id(lobby_id)
	lobby_data.id = lobby_id
	self.lobby_data = lobby_data

	return 
end
InviteManager.clear_invites = function (self)
	return 
end

return 

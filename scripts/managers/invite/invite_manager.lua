-- chunkname: @scripts/managers/invite/invite_manager.lua

InviteManager = class(InviteManager)

local REFRESH_TIME = 1

InviteManager.init = function (self)
	self.lobby_data = nil
	self._pending_lobby_data = {}
	self.is_steam = rawget(_G, "Steam") and rawget(_G, "Friends") and true or false
	self._refresh_timer = REFRESH_TIME
end

InviteManager.update = function (self, dt, t)
	self:_update_pending_lobby_data(dt, t)
	self:_poll_invite(dt, t)
end

InviteManager._poll_invite = function (self, dt, t)
	if self.is_steam then
		local invite_type, lobby_id, params, invitee = Friends.next_invite()

		if invite_type == Friends.INVITE_SERVER then
			self:_handle_invitation(invite_type, lobby_id, params, invitee)
		elseif invite_type == Friends.INVITE_LOBBY then
			print("Got invite to lobby from " .. invitee .. " - fetching lobby data")

			self._pending_lobby_data.invite_type = invite_type
			self._pending_lobby_data.lobby_id = lobby_id
			self._pending_lobby_data.params = params
			self._pending_lobby_data.invitee = invitee
			self._refresh_timer = t + REFRESH_TIME

			SteamLobby.request_lobby_data(lobby_id)
		end
	end
end

InviteManager._handle_invitation = function (self, invite_type, lobby_id, params, invitee, lobby_data)
	local illegal_combination = Development.parameter("use_lan_backend") and invite_type ~= Friends.NO_INVITE

	assert(not illegal_combination, "You cannot use Steam invites in combination with LAN backend.")

	if invite_type == Friends.INVITE_LOBBY then
		print("Got invite to lobby from " .. invitee)

		lobby_data.is_server_invite = false
		lobby_data.id = lobby_id
		self.lobby_data = lobby_data
	elseif invite_type == Friends.INVITE_SERVER then
		print("Got invite to server from " .. invitee)

		local lobby_data = {}

		lobby_data.is_server_invite = true
		lobby_data.id = lobby_id
		lobby_data.server_info = {
			ip_port = lobby_id,
			invitee = invitee,
		}
		self.lobby_data = lobby_data
	end
end

InviteManager._update_pending_lobby_data = function (self, dt, t)
	if not self._pending_lobby_data.lobby_id then
		return
	end

	local invite_type = self._pending_lobby_data.invite_type
	local lobby_id = self._pending_lobby_data.lobby_id
	local params = self._pending_lobby_data.params
	local invitee = self._pending_lobby_data.invitee
	local lobby_data = SteamMisc.get_lobby_data(lobby_id)

	if not table.is_empty(lobby_data) and t > self._refresh_timer then
		table.clear(self._pending_lobby_data)
		self:_handle_invitation(invite_type, lobby_id, params, invitee, lobby_data)
	end
end

InviteManager.has_invitation = function (self)
	if self.lobby_data == nil then
		local t, dt = Managers.time:time_and_delta("main")

		self:_poll_invite(dt, t)
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
end

InviteManager.clear_invites = function (self)
	return
end

InviteManager.invites_handled = function (self)
	return true
end

InviteManager.get_invite_error = function (self)
	return
end

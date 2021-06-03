LobbyMembers = class(LobbyMembers)

LobbyMembers.init = function (self, lobby)
	self.lobby = lobby
	self.members_joined = {}
	self.members_left = {}
	local current_members, member_count = lobby:members()
	member_count = member_count or #current_members
	self._member_buffer = current_members
	self.member_count = member_count
	local member_map = {}

	for i = 1, member_count, 1 do
		local peer_id = current_members[i]
		member_map[peer_id] = true
		self.members_joined[i] = peer_id
	end

	self.members = member_map
	self._members_changed = true

	if IS_CONSOLE and not Managers.account:offline_mode() then
		self.lobby:update_user_names()
	end
end

LobbyMembers.clear = function (self)
	return
end

LobbyMembers.update = function (self)
	local members_joined = self.members_joined
	local members_left = self.members_left

	table.clear(members_joined)
	table.clear(members_left)

	local member_buffer = self._member_buffer

	table.clear(member_buffer)

	local current_members, member_count = self.lobby:members(member_buffer)

	if not member_count then
		self._member_buffer = current_members
		member_count = #current_members
	end

	self.member_count = member_count
	local members = self.members

	for i = 1, member_count, 1 do
		local peer_id = current_members[i]

		if members[peer_id] == nil then
			members_joined[#members_joined + 1] = peer_id

			printf("[LobbyMembers] Member joined %s", tostring(peer_id))

			if IS_CONSOLE then
				local account_manager = Managers.account

				if IS_XB1 then
					account_manager:query_bandwidth()

					self._members_changed = true
				end

				if not account_manager:offline_mode() then
					self.lobby:update_user_names()
				end
			end
		end

		members[peer_id] = false
	end

	for peer_id, value in pairs(members) do
		if value == false then
			members[peer_id] = true
		else
			printf("[LobbyMembers] Member left %s", tostring(peer_id))

			members_left[#members_left + 1] = peer_id
			members[peer_id] = nil

			if IS_XB1 then
				if table.size(members) <= 1 then
					Managers.account:reset_bandwidth_query()
				end

				self._members_changed = true
			end
		end
	end
end

LobbyMembers.get_members_left = function (self)
	return self.members_left
end

LobbyMembers.get_members_joined = function (self)
	return self.members_joined
end

LobbyMembers.get_members = function (self)
	return self._member_buffer
end

LobbyMembers.get_member_count = function (self)
	return self.member_count
end

LobbyMembers.members_map = function (self)
	return self.members
end

if IS_XB1 then
	LobbyMembers.check_members_changed = function (self)
		local members_changed = self._members_changed
		self._members_changed = nil

		return members_changed
	end
end

return

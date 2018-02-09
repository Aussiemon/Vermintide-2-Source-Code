LobbyMembers = class(LobbyMembers)
LobbyMembers.init = function (self, lobby)
	self.lobby = lobby
	self.members_joined = {}
	self.members_left = {}
	local members = lobby.members(lobby)
	local my_members = {}

	for i, peer_id in ipairs(members) do
		my_members[peer_id] = true
		self.members_joined[i] = peer_id
	end

	self.members = my_members

	return 
end
LobbyMembers.clear = function (self)
	return 
end
LobbyMembers.update = function (self)
	local members_joined = self.members_joined
	local members_left = self.members_left

	table.clear(members_joined)
	table.clear(members_left)

	local current_members = self.lobby:members()
	local members = self.members

	for i, peer_id in ipairs(current_members) do
		if members[peer_id] == nil then
			members_joined[#members_joined + 1] = peer_id

			printf("[LobbyMembers] Member joined %s", tostring(peer_id))

			if PLATFORM == "xb1" then
				Managers.account:query_bandwidth()
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

			if PLATFORM == "xb1" and table.size(members) <= 1 then
				Managers.voice_chat:initate_voice_chat()
				Managers.account:reset_bandwidth_query()
			end
		end
	end

	return 
end
LobbyMembers.get_members_left = function (self)
	return self.members_left
end
LobbyMembers.get_members_joined = function (self)
	return self.members_joined
end
LobbyMembers.get_members = function (self)
	return self.lobby:members()
end
LobbyMembers.members_map = function (self)
	return self.members
end

return 

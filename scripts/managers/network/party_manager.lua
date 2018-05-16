PartyManager = class(PartyManager)

PartyManager.init = function (self)
	self._leader = nil
end

PartyManager.destroy = function (self)
	return
end

PartyManager.reset = function ()
	if Managers.party then
		Managers.party:destroy()
	end

	Managers.party = PartyManager:new()
end

PartyManager.set_leader = function (self, peer_id)
	if peer_id == nil then
		print("[PartyManager] Leader is cleared")
	else
		print("[PartyManager] Leader is set to " .. peer_id)
	end

	self._leader = peer_id
end

PartyManager.leader = function (self)
	return self._leader
end

PartyManager.is_leader = function (self, peer_id)
	return peer_id == self._leader
end

return

PartyManager = class(PartyManager)
PartyManager.init = function (self)
	self._leader = nil

	return 
end
PartyManager.destroy = function (self)
	return 
end
PartyManager.reset = function ()
	if Managers.party then
		Managers.party:destroy()
	end

	Managers.party = PartyManager:new()

	return 
end
PartyManager.set_leader = function (self, peer_id)
	if peer_id == nil then
		print("[PartyManager] Leader is cleared")
	else
		print("[PartyManager] Leader is set to " .. peer_id)
	end

	self._leader = peer_id

	return 
end
PartyManager.leader = function (self)
	return self._leader
end
PartyManager.is_leader = function (self, peer_id)
	return peer_id == self._leader
end

return 

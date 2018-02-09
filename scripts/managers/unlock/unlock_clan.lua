require("scripts/helpers/steam_helper")

UnlockClan = class(UnlockClan)
UnlockClan.init = function (self, name, clan_id, backend_id)
	self._name = name
	self._id = clan_id
	self._backend_id = backend_id
	self._unlocked = false

	if rawget(_G, "Steam") then
		local clans = SteamHelper.clans()

		if clans[clan_id] then
			self._unlocked = true
		end
	end

	return 
end
UnlockClan.id = function (self)
	return self._id
end
UnlockClan.backend_id = function (self)
	return self._backend_id
end
UnlockClan.unlocked = function (self)
	return self._unlocked
end

return 

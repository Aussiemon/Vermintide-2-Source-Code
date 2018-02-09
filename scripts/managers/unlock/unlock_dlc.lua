UnlockDlc = class(UnlockDlc)
UnlockDlc.init = function (self, name, app_id, backend_id)
	self._name = name
	self._id = app_id
	self._backend_id = backend_id
	self._unlocked = false

	if rawget(_G, "Steam") and Steam.is_installed(app_id) then
		self._unlocked = true
	end

	return 
end
UnlockDlc.id = function (self)
	return self._id
end
UnlockDlc.backend_id = function (self)
	return self._backend_id
end
UnlockDlc.unlocked = function (self)
	return self._unlocked
end

return 

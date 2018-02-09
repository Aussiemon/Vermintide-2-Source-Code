AlwaysUnlocked = class(AlwaysUnlocked)
AlwaysUnlocked.init = function (self, name, app_id, backend_id)
	self._name = name
	self._id = app_id or "0"
	self._backend_id = nil
	self._unlocked = true

	return 
end
AlwaysUnlocked.id = function (self)
	return self._id
end
AlwaysUnlocked.backend_id = function (self)
	return self._backend_id
end
AlwaysUnlocked.unlocked = function (self)
	return self._unlocked
end

return 

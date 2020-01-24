AlwaysUnlocked = class(AlwaysUnlocked)

AlwaysUnlocked.init = function (self, name, app_id, backend_reward_id, cosmetic)
	self._name = name
	self._id = app_id or "0"
	self._backend_reward_id = nil
	self._unlocked = true
	self._cosmetic = true
end

AlwaysUnlocked.ready = function (self)
	return true
end

AlwaysUnlocked.has_error = function (self)
	return false
end

AlwaysUnlocked.id = function (self)
	return self._id
end

AlwaysUnlocked.backend_reward_id = function (self)
	return self._backend_reward_id
end

AlwaysUnlocked.remove_backend_reward_id = function (self)
	self._backend_reward_id = nil
end

AlwaysUnlocked.unlocked = function (self)
	return self._unlocked
end

AlwaysUnlocked.is_cosmetic = function (self)
	return self._cosmetic
end

return

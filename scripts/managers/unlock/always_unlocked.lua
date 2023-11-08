AlwaysUnlocked = class(AlwaysUnlocked)

AlwaysUnlocked.init = function (self, name, app_id, backend_reward_id, cosmetic, fallback_id, requires_restart, is_legacy_console_dlc)
	self._name = name
	self._is_legacy_console_dlc = is_legacy_console_dlc
	self._id = app_id or "0"
end

AlwaysUnlocked.ready = function (self)
	return true
end

AlwaysUnlocked.is_legacy_console_dlc = function (self)
	return self._is_legacy_console_dlc
end

AlwaysUnlocked.has_error = function (self)
	return false
end

AlwaysUnlocked.id = function (self)
	return self._id
end

AlwaysUnlocked.set_status_changed = function (self, value)
	return
end

AlwaysUnlocked.backend_reward_id = function (self)
	return
end

AlwaysUnlocked.remove_backend_reward_id = function (self)
	return
end

AlwaysUnlocked.unlocked = function (self)
	return true
end

AlwaysUnlocked.installed = function (self)
	return true
end

AlwaysUnlocked.is_cosmetic = function (self)
	return true
end

AlwaysUnlocked.requires_restart = function (self)
	return false
end

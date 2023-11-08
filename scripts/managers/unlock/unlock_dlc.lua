UnlockDlc = class(UnlockDlc)

UnlockDlc.init = function (self, name, app_id, backend_reward_id, always_unlocked_game_app_ids, cosmetic, fallback_id, requires_restart)
	self._name = name
	self._id = app_id
	self._backend_reward_id = backend_reward_id
	self._installed = false
	self._owned = false
	self._cosmetic = cosmetic
	self._requires_restart = requires_restart
	self._status_changed = false

	if HAS_STEAM and always_unlocked_game_app_ids then
		local steam_app_id = Steam.app_id()

		if steam_app_id and table.contains(always_unlocked_game_app_ids, steam_app_id) then
			self._always_unlocked_for_app_id = true
			self._installed = true
		end
	end

	self:update_is_installed()
end

UnlockDlc.is_legacy_console_dlc = function (self)
	return false
end

UnlockDlc.ready = function (self)
	return true
end

UnlockDlc.has_error = function (self)
	return false
end

UnlockDlc.id = function (self)
	return self._id
end

UnlockDlc.backend_reward_id = function (self)
	return self._backend_reward_id
end

UnlockDlc.remove_backend_reward_id = function (self)
	self._backend_reward_id = nil
end

UnlockDlc.unlocked = function (self)
	return self._installed and self._owned
end

UnlockDlc.installed = function (self)
	return self._installed
end

UnlockDlc.set_owned = function (self, value, set_status_change)
	if set_status_change == nil or set_status_change then
		self._status_changed = self._status_changed or value ~= self._owned
	end

	self._owned = value
end

UnlockDlc.set_status_changed = function (self, value)
	self._status_changed = value
end

UnlockDlc.update_is_installed = function (self)
	if not HAS_STEAM then
		return self._installed
	end

	if self._always_unlocked_for_app_id then
		return self._installed
	end

	local installed = Steam.is_installed(self._id)

	if self._installed ~= installed then
		self._installed = installed

		return installed, true
	end

	return installed
end

UnlockDlc.is_cosmetic = function (self)
	return self._cosmetic
end

UnlockDlc.requires_restart = function (self)
	return self._status_changed and self._requires_restart
end

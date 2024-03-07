-- chunkname: @scripts/managers/unlock/unlock_dlc_bundle.lua

UnlockDlcBundle = class(UnlockDlcBundle)

UnlockDlcBundle.init = function (self, name, bundle_id, backend_reward_id, always_unlocked_game_app_ids, cosmetic, fallback_id, requires_restart, is_legacy_console_dlc, bundle_contains)
	self._name = name
	self._id = bundle_id
	self._backend_reward_id = backend_reward_id
	self._requires_restart = requires_restart
	self._status_changed = false
	self._bundle_contains = bundle_contains or {}
	self._installed = false

	if HAS_STEAM and always_unlocked_game_app_ids then
		local steam_app_id = Steam.app_id()

		if steam_app_id and table.contains(always_unlocked_game_app_ids, steam_app_id) then
			self._always_unlocked_for_app_id = true
			self._unlocked = true
			self._installed = true
		end
	end

	self:update_is_installed()
end

UnlockDlcBundle.is_legacy_console_dlc = function (self)
	return false
end

UnlockDlcBundle.ready = function (self)
	return true
end

UnlockDlcBundle.has_error = function (self)
	return false
end

UnlockDlcBundle.id = function (self)
	return self._id
end

UnlockDlcBundle.backend_reward_id = function (self)
	return self._backend_reward_id
end

UnlockDlcBundle.remove_backend_reward_id = function (self)
	self._backend_reward_id = nil
end

UnlockDlcBundle.unlocked = function (self)
	return self._unlocked
end

UnlockDlcBundle.installed = function (self)
	return self._installed
end

UnlockDlcBundle.check_all_children_dlc_owned = function (self)
	if self._always_unlocked_for_app_id then
		return
	end

	local all_dlcs_unlocked = true

	for i = 1, #self._bundle_contains do
		local bundle_item = self._bundle_contains[i]
		local dlc = Managers.unlock:get_dlc(bundle_item)

		if not dlc:unlocked() then
			all_dlcs_unlocked = false

			break
		end
	end

	self._unlocked = all_dlcs_unlocked
end

UnlockDlcBundle.set_status_changed = function (self, value)
	self._status_changed = value
end

UnlockDlcBundle.is_cosmetic = function (self)
	return false
end

UnlockDlcBundle.requires_restart = function (self)
	return self._status_changed and self._requires_restart
end

UnlockDlcBundle.update_is_installed = function (self)
	if not HAS_STEAM then
		return self._installed
	end

	if self._always_unlocked_for_app_id then
		return self._installed
	end

	local all_dlcs_installed = true

	for i = 1, #self._bundle_contains do
		local bundle_item = self._bundle_contains[i]
		local unlocks = UnlockSettings[1].unlocks
		local unlock_settings = unlocks[bundle_item]

		if not Steam.is_installed(unlock_settings.id) then
			all_dlcs_installed = false

			break
		end
	end

	if self._installed ~= all_dlcs_installed then
		self._installed = all_dlcs_installed

		return all_dlcs_installed, true
	end

	return all_dlcs_installed
end

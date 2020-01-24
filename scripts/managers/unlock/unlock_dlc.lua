UnlockDlc = class(UnlockDlc)

UnlockDlc.init = function (self, name, app_id, backend_reward_id, always_unlocked_game_app_ids, cosmetic)
	self._name = name
	self._id = app_id
	self._backend_reward_id = backend_reward_id
	self._unlocked = false
	self._cosmetic = cosmetic

	if rawget(_G, "Steam") then
		if Steam.is_installed(app_id) then
			self._unlocked = true
		elseif always_unlocked_game_app_ids then
			local steam_app_id = Steam.app_id()

			if steam_app_id and table.contains(always_unlocked_game_app_ids, steam_app_id) then
				self._unlocked = true
			end
		end
	end
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
	return self._unlocked
end

UnlockDlc.is_cosmetic = function (self)
	return self._cosmetic
end

return

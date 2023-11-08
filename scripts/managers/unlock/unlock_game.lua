UnlockGame = class(UnlockGame)

UnlockGame.init = function (self, name, app_id, backend_reward_id, always_unlocked_game_app_ids, cosmetic)
	return
end

UnlockGame.is_legacy_console_dlc = function (self)
	return false
end

UnlockGame.cb_get_inventory_items_done = function (self, info)
	return
end

UnlockGame.ready = function (self)
	return true
end

UnlockGame.has_error = function (self)
	return
end

UnlockGame.id = function (self)
	return
end

UnlockGame.backend_reward_id = function (self)
	return
end

UnlockGame.remove_backend_reward_id = function (self)
	return
end

UnlockGame.set_status_changed = function (self, value)
	return
end

UnlockGame.unlocked = function (self)
	return
end

UnlockGame.installed = function (self)
	return
end

UnlockGame.is_cosmetic = function (self)
	return false
end

UnlockGame.requires_restart = function (self)
	return false
end

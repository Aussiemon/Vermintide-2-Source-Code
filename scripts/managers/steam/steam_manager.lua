SteamManager = class(SteamManager)

SteamManager.init = function (self)
	self._overlay_active = false
end

SteamManager.destroy = function (self)
	return
end

SteamManager.update = function (self, dt, t)
	Steam.run_callbacks(self)
end

SteamManager.on_overlay_activated = function (self, enabled)
	self._overlay_active = enabled
end

SteamManager.is_overlay_active = function (self)
	return self._overlay_active
end

return

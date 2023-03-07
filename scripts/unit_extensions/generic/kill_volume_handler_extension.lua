KillVolumeHandlerExtension = class(KillVolumeHandlerExtension)

KillVolumeHandlerExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._callbacks = {}
end

KillVolumeHandlerExtension.game_object_initialized = function (self, unit, go_id)
	return
end

KillVolumeHandlerExtension.destroy = function (self)
	return
end

KillVolumeHandlerExtension.add_handler = function (self, on_hit_kill_volume_cb)
	self._callbacks[#self._callbacks + 1] = on_hit_kill_volume_cb
end

KillVolumeHandlerExtension.on_hit_kill_volume = function (self)
	local handled = false

	for i = 1, #self._callbacks do
		local cb = self._callbacks[i]
		handled = cb() or handled
	end

	return handled
end

WorldMarkerExtension = class(WorldMarkerExtension)

WorldMarkerExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._world = extension_init_context.world
	self._unit = unit
	self._visible = false
	self._id = nil
	self._event_manager = Managers.state.event
	self._marker_type = nil
	self._add_event_name = nil
	self._remove_event_name = nil
end

WorldMarkerExtension.extensions_ready = function (self)
	if self._extensions_ready then
		self:_extensions_ready()
	end
end

WorldMarkerExtension.destroy = function (self)
	if self._destroy then
		self:_destroy()
	end

	self:remove_marker()
end

WorldMarkerExtension.add_marker = function (self, cb_func)
	if self._adding_marker then
		return
	end

	self:remove_marker()

	self._adding_marker = true
	local cb = callback(self, "cb_add_marker", cb_func)

	self:_add_marker(cb)
end

WorldMarkerExtension.remove_marker = function (self)
	local id = self._id

	if id then
		local event_manager = self._event_manager
		local remove_event_name = self._remove_event_name

		event_manager:trigger(remove_event_name, id)

		self._id = nil
	elseif self._adding_marker then
		self._remove_marker_queued = true
	end
end

WorldMarkerExtension.hot_join_sync = function (self, sender)
	if self._hot_join_sync then
		self:_hot_join_sync(sender)
	end
end

WorldMarkerExtension.cb_add_marker = function (self, cb_func, id)
	self._id = id
	self._adding_marker = false

	if cb_func then
		cb_func(id)
	end

	if self._remove_marker_queued then
		self._remove_marker_queued = nil

		self:remove_marker()
	end
end

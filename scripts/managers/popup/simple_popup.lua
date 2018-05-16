SimplePopup = class(SimplePopup)

SimplePopup.init = function (self)
	self._tracked_popups = {}
end

SimplePopup.queue_popup = function (self, text, topic, ...)
	local id = Managers.popup:queue_popup(text, topic, ...)
	self._tracked_popups[#self._tracked_popups + 1] = id
end

SimplePopup.update = function (self, dt)
	local manager = Managers.popup
	local first = self._tracked_popups[1]

	if first and not manager:has_popup_with_id(first) then
		table.remove(self._tracked_popups, 1)
	end

	for i, v in ipairs(self._tracked_popups) do
		local result = manager:query_result(v)

		if result ~= nil then
			table.remove(self._tracked_popups, i)
		end
	end
end

SimplePopup.destroy = function (self)
	return
end

return

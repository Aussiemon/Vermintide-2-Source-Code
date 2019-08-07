ScrollBarLogic = class(ScrollBarLogic)

ScrollBarLogic.init = function (self, scrollbar_widget)
	self._scrollbar_widget = scrollbar_widget
	self._scroll_value = 0
	self._draw_length = 0
end

ScrollBarLogic.update = function (self, dt, t, disable_mouse_scroll)
	local scrollbar_enabled = self._scrollbar_enabled

	if not scrollbar_enabled then
		return
	end

	local scroll_bar_info = self:_get_scrollbar_info()

	if scroll_bar_info.on_pressed then
		scroll_bar_info.scroll_add = nil
	end

	local mouse_scroll_value = scroll_bar_info.scroll_value

	if not mouse_scroll_value or disable_mouse_scroll then
		return
	end

	local scroll_bar_value = scroll_bar_info.value
	local current_scroll_value = self._scroll_value

	if current_scroll_value ~= mouse_scroll_value then
		self:_set_scrollbar_value(mouse_scroll_value)
	elseif current_scroll_value ~= scroll_bar_value then
		self:_set_scrollbar_value(scroll_bar_value)
	end
end

ScrollBarLogic.set_scrollbar_values = function (self, draw_length, content_length, scrollbar_length, step_size, scroll_step_multiplier)
	local thumb_scale = math.min(scrollbar_length / content_length, 1)

	self:_set_thumb_scale(thumb_scale)

	local scroll_length = math.max(content_length - draw_length, 0)

	self:_set_scroll_length(scroll_length)

	scroll_step_multiplier = scroll_step_multiplier or 2
	local scroll_amount = math.max(step_size / scroll_length, 0) * scroll_step_multiplier

	self:_set_scroll_amount(scroll_amount)

	self._scrollbar_enabled = scroll_length > 0
	self._draw_length = draw_length
	self._initialized = true
end

ScrollBarLogic.set_scroll_percentage = function (self, percentage)
	self:_set_scrollbar_value(percentage or 0)
end

ScrollBarLogic.set_scroll_distance = function (self, distance)
	local percentage = distance / self:get_scroll_length()

	self:set_scroll_percentage(percentage)
end

ScrollBarLogic.scroll_to_fit = function (self, start, size)
	local scrolled_length = self:get_scrolled_length()
	local draw_length = self._draw_length

	if start < scrolled_length then
		self:set_scroll_distance(start)
	elseif start + size > scrolled_length + draw_length then
		self:set_scroll_distance((start + draw_length) - size)
	end
end

ScrollBarLogic.get_scroll_percentage = function (self)
	local value = self._scroll_value

	return value
end

ScrollBarLogic.get_scrolled_length = function (self)
	local value = self._scroll_value
	local length = self:get_scroll_length()

	return length * value
end

ScrollBarLogic.get_scroll_length = function (self)
	local scroll_bar_info = self:_get_scrollbar_info()
	local length = scroll_bar_info.total_scroll_length

	return length or 0
end

ScrollBarLogic.enabled = function (self)
	return self._scrollbar_enabled
end

ScrollBarLogic.is_scrolling = function (self)
	local scroll_bar_info = self:_get_scrollbar_info()
	local scrolling = scroll_bar_info.scroll_add ~= nil

	return scrolling
end

ScrollBarLogic._get_scrollbar_info = function (self)
	local scrollbar_widget = self._scrollbar_widget
	local content = scrollbar_widget.content
	local scroll_bar_info = content.scroll_bar_info

	return scroll_bar_info
end

ScrollBarLogic._set_thumb_scale = function (self, scale)
	local scroll_bar_info = self:_get_scrollbar_info()
	scroll_bar_info.bar_height_percentage = scale
end

ScrollBarLogic._set_scroll_amount = function (self, amount)
	local scroll_bar_info = self:_get_scrollbar_info()
	scroll_bar_info.scroll_amount = amount
end

ScrollBarLogic._set_scroll_length = function (self, length)
	local scroll_bar_info = self:_get_scrollbar_info()
	scroll_bar_info.total_scroll_length = length
end

ScrollBarLogic._set_scrollbar_value = function (self, value)
	if value then
		local scroll_bar_info = self:_get_scrollbar_info()
		scroll_bar_info.value = value
		scroll_bar_info.scroll_value = value
		self._scroll_value = value
	end
end

return

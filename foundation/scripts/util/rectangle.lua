Rectangle = class(Rectangle)

Rectangle.init = function (self, x, y, width, height)
	self.x = x
	self.y = y
	self.width = width
	self.height = height
end

Rectangle.split_horizontal = function (self)
	local half_height = self.height * 0.5
	local upper_rect = Rectangle:new(self.x, self.y, self.width, half_height)
	local lower_rect = Rectangle:new(self.x, self.y + half_height, self.width, half_height)

	return upper_rect, lower_rect
end

Rectangle.split_vertical = function (self)
	local half_width = self.width * 0.5
	local left_rect = Rectangle:new(self.x, self.y, half_width, self.height)
	local right_rect = Rectangle:new(self.x + half_width, self.y, half_width, self.height)

	return left_rect, right_rect
end

return

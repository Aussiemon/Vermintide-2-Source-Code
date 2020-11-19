BetaOverlay = class(BetaOverlay)

BetaOverlay.init = function (self, world, text)
	self._gui = World.create_screen_gui(world, "immediate")
	self._world = world
	self._text = text
end

BetaOverlay.update = function (self)
	local gui = self._gui
	local text = self._text
	local screen_width, screen_height = Gui.resolution()
	local scale = math.min(screen_width / 1920, screen_height / 1080, 1)
	local font = "materials/fonts/gw_head"
	local font_size = 75 * scale
	local _, _, car = Gui.text_extents(gui, text, font, font_size)

	Gui.text(gui, text, font, font_size, nil, Vector3(screen_width - car.x - scale * 35, screen_height - scale * 116, 1000), Color(100, 255, 255, 255))
end

BetaOverlay.destroy = function (self)
	if self._gui then
		World.destroy_gui(self._world, self._gui)

		self._gui = nil
	end
end

return

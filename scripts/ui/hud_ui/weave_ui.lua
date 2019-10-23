local definitions = local_require("scripts/ui/hud_ui/weave_ui_definitions")
WeaveUI = class(WeaveUI)

WeaveUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self.ui_renderer = ingame_ui_context.ui_renderer

	self:create_ui_elements()

	self.world = ingame_ui_context.world_manager:world("level_world")
	self.gui = World.create_screen_gui(self.world, "material", "materials/fonts/gw_fonts", "immediate")
end

WeaveUI.destroy = function (self)
	return
end

WeaveUI.create_ui_elements = function (self)
	return
end

WeaveUI.update = function (self, dt, t)
	self:_update_animations(dt, t)
	self:_draw(dt, t)
end

WeaveUI._update_animations = function (self, dt, t)
	return
end

WeaveUI._draw = function (self, dt, t)
	local bar_width = 40
	local bar_length = 400
	local padding = 6
	local res_x = RESOLUTION_LOOKUP.res_w
	local res_y = RESOLUTION_LOOKUP.res_h
	local weave_manager = Managers.weave

	if weave_manager:show_bar() then
		local score = weave_manager:current_bar_score()
		local percent = score / 100

		Gui.rect(self.gui, Vector3(res_x / 2 - bar_length / 2, res_y - 160, 100), Vector2(bar_length, bar_width), Color(150, 25, 25, 25))
		Gui.rect(self.gui, Vector3(res_x / 2 - bar_length / 2 + padding, res_y - 160 + padding, 100), Vector2((bar_length - padding * 2) * percent, bar_width - padding * 2), Color(150, 255, 238, 0))
	end

	if weave_manager:get_active_weave() then
		local remaining_time_in_seconds = weave_manager:get_time_left()
		local seconds = math.max(remaining_time_in_seconds, 0)
		local minutes = math.floor(seconds / 60)
		local hours = math.floor(minutes / 60)
		local time_text = string.format("%02d:%02d:%02d", hours, minutes - hours * 60, seconds % 60)
		local min, max = Gui.text_extents(self.gui, time_text, "materials/fonts/arial", 26)
		local width = max.x - min.x

		Gui.text(self.gui, time_text, "materials/fonts/arial", 26, "arial", Vector3(res_x / 2 - width / 2, res_y - 186, width), Color(255, 255, 255, 255))
	end
end

return

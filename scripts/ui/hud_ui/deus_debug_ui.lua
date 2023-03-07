DeusDebugUI = class(DeusDebugUI)

DeusDebugUI.init = function (self, parent, ingame_ui_context)
	self._world = ingame_ui_context.world_manager:world("level_world")
	self._gui = World.create_screen_gui(self._world, "immediate", "material", "materials/fonts/gw_fonts")
end

DeusDebugUI.destroy = function (self)
	World.destroy_gui(self._world, self._gui)

	self._gui = nil
end

DeusDebugUI.update = function (self, dt, t)
	self:_draw(dt, t)
end

DeusDebugUI._draw = function (self, dt, t)
	self:_draw_left_side(dt, t)
	self:_draw_right_side(dt, t)
end

DeusDebugUI._draw_right_side = function (self, dt, t)
	local font = "materials/fonts/arial"
	local font_material = "arial"
	local font_size = 12
	local width, height = Gui.resolution()
	local mid_x = width * 0.75
	local top_y = height
	local right_side_text = ""
	local deus_run_controller = Managers.mechanism:game_mechanism():get_deus_run_controller()

	if deus_run_controller then
		right_side_text = right_side_text .. "Run seed: " .. deus_run_controller:get_run_seed()
	end

	if IS_WINDOWS and rawget(_G, "Steam") then
		right_side_text = right_side_text .. " User: " .. Steam.user_name()
	end

	if right_side_text == "" then
		return
	end

	local min, max = Gui.text_extents(self._gui, right_side_text, font, font_size)
	local text_width = max.x - min.x
	local text_height = max.y
	local padding = 5
	local text_x = mid_x - text_width * 0.5 - padding
	local text_y = top_y - text_height - padding
	local bg_width = text_width + padding * 2
	local bg_height = text_height + padding * 2
	local bg_x = text_x - padding
	local bg_y = text_y - padding

	Gui.rect(self._gui, Vector2(bg_x, bg_y), Vector2(bg_width, bg_height), Color(128, 0, 0, 0))
	Gui.text(self._gui, right_side_text, font, font_size, font_material, Vector3(text_x, text_y, 0), Color(255, 255, 255, 0))
end

DeusDebugUI._draw_left_side = function (self, dt, t)
	local deus_run_controller = Managers.mechanism:game_mechanism():get_deus_run_controller()

	if not deus_run_controller then
		return
	end

	local font = "materials/fonts/arial"
	local font_material = "arial"
	local font_size = 12
	local width, height = Gui.resolution()
	local mid_x = width * 0.25
	local top_y = height
	local left_side_text = "Level: " .. deus_run_controller:get_current_node().level
	local min, max = Gui.text_extents(self._gui, left_side_text, font, font_size)
	local text_width = max.x - min.x
	local text_height = max.y
	local padding = 5
	local text_x = mid_x - text_width * 0.5 - padding
	local text_y = top_y - text_height - padding
	local bg_width = text_width + padding * 2
	local bg_height = text_height + padding * 2
	local bg_x = text_x - padding
	local bg_y = text_y - padding

	Gui.rect(self._gui, Vector2(bg_x, bg_y), Vector2(bg_width, bg_height), Color(128, 0, 0, 0))
	Gui.text(self._gui, left_side_text, font, font_size, font_material, Vector3(text_x, text_y, 0), Color(255, 255, 255, 0))
end

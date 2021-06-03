ImguiUITool = class(ImguiUITool)

ImguiUITool.init = function (self)
	self._ruler = false
	self._highlight_textures = false
	self._drawing_rect = false
	self._rect_y = 0
	self._rect_x = 0
	self._texture_buffer = {}
	self._texture_back_buffer = {}
end

ImguiUITool.update = function (self)
	self._texture_back_buffer = self._texture_buffer
	self._texture_buffer = self._texture_back_buffer

	table.clear(self._texture_back_buffer)
end

local WHITE = {
	255,
	255,
	255,
	255
}

ImguiUITool.draw_border = function (self, pos, size, color)
	local gui = self:get_gui()

	if not gui or not self._highlight_textures then
		return
	end

	local border = 2
	pos = pos + Vector3(0, 0, 1)
	local w = size[1]
	local h = size[2] - 2 * border

	Gui.rect(gui, Vector3(pos[1], pos[2], pos[3]), Vector2(w, border), color)
	Gui.rect(gui, Vector3(pos[1], (pos[2] + size[2]) - border, pos[3]), Vector2(w, border), color)
	Gui.rect(gui, Vector3(pos[1], pos[2] + border, pos[3]), Vector2(border, h), color)
	Gui.rect(gui, Vector3((pos[1] + size[1]) - border, pos[2] + border, pos[3]), Vector2(border, h), color)
end

ImguiUITool.texture = function (self, texture_type, texture, pos, size, color)
	local is_hovered = math.point_is_inside_2d_box(Mouse.axis(Mouse.axis_id("cursor")), pos, size)

	if is_hovered then
		color = color or WHITE
		local buffer = self._texture_back_buffer
		local settings = UIAtlasHelper._ui_atlas_settings[texture]
		buffer[#buffer + 1] = texture_type
		buffer[#buffer + 1] = tostring(texture)
		buffer[#buffer + 1] = (settings and settings.material_name) or "n/a"
		buffer[#buffer + 1] = string.format("Vector3(%d, %d, %d)", pos[1], pos[2], pos[3])
		buffer[#buffer + 1] = string.format("Vector2(%d, %d)", size[1], size[2])
		buffer[#buffer + 1] = string.format("Color(%d, %d, %d, %d)", color[1], color[2], color[3], color[4])
	end

	local color = nil

	if texture_type == "rect" then
		color = Color((is_hovered and 255) or 0, 0, 255, 0)
	elseif texture_type == "bitmap" then
		color = Color((is_hovered and 255) or 0, 255, 0, 0)
	elseif texture_type == "bitmap_uv" then
		color = Color((is_hovered and 255) or 0, 255, 0, 155)
	end

	self:draw_border(Vector3(pos[1], pos[2], pos[3]), Vector2(size[1], size[2]), color)
end

ImguiUITool.text = function (self, ui_renderer, text, font_material, font_size, pos, color)
	local te_min, te_max, te_caret = Gui.text_extents(ui_renderer.gui, text, font_material, font_size)
	local size = te_max - te_min
	pos = pos + te_min
	local is_hovered = math.point_is_inside_2d_box(Mouse.axis(Mouse.axis_id("cursor")), pos, size)

	if is_hovered then
		color = color or WHITE
		local buffer = self._texture_back_buffer
		buffer[#buffer + 1] = "text"
		buffer[#buffer + 1] = string.format("%10q", text)
		buffer[#buffer + 1] = font_material
		buffer[#buffer + 1] = string.format("Vector3(%d, %d, %d)", pos[1], pos[2], pos[3])
		buffer[#buffer + 1] = string.format("%d / Vector2(%d, %d)", font_size, size[1], size[2])
		buffer[#buffer + 1] = string.format("Color(%d, %d, %d, %d)", color[1], color[2], color[3], color[4])
	end

	local gui = self:get_gui()

	if not gui or not self._highlight_textures then
		return
	end

	self:draw_border(Vector3(pos[1], pos[2], pos[3]), Vector2(size[1], size[2]), Color((is_hovered and 255) or 0, 0, 100, (is_hovered and 255) or 0))
end

ImguiUITool.hook = function (self)
	Debug.hook(UIRenderer, "script_draw_bitmap", function (func, gui, render_settings, material, gui_position, gui_size, color, masked, saturated, retained_id)
		self:texture("bitmap", material, gui_position, gui_size, color)

		return func(gui, render_settings, material, gui_position, gui_size, color, masked, saturated, retained_id)
	end)
	Debug.hook(UIRenderer, "script_draw_bitmap_uv", function (func, gui, render_settings, material, uvs, gui_position, gui_size, color, masked, saturated, retained_id)
		self:texture("bitmap_uv", material, gui_position, gui_size, color)

		return func(gui, render_settings, material, uvs, gui_position, gui_size, color, masked, saturated, retained_id)
	end)
	Debug.hook(UIRenderer, "draw_rect", function (func, ui_renderer, lower_left_corner, size, color, retained_id)
		self:texture("rect", "n/a", UIScaleVectorToResolution(lower_left_corner), UIScaleVectorToResolution(size), color)

		return func(ui_renderer, lower_left_corner, size, color, retained_id)
	end)
	Debug.hook(UIRenderer, "draw_text", function (func, ui_renderer, text, font_material, font_size, font_name, position, color, retained_id, color_override)
		self:text(ui_renderer, text, font_material, font_size, UIScaleVectorToResolution(position), color)

		return func(ui_renderer, text, font_material, font_size, font_name, position, color, retained_id, color_override)
	end)
end

ImguiUITool.unhook = function (self)
	Debug.unhook(UIRenderer, "script_draw_bitmap", true)
	Debug.unhook(UIRenderer, "script_draw_bitmap_uv", true)
	Debug.unhook(UIRenderer, "draw_rect", true)
	Debug.unhook(UIRenderer, "draw_text", true)
end

ImguiUITool.get_gui = function (self)
	if self._gui then
		return self._gui
	end

	local world_manager = Managers.world

	if not world_manager then
		return
	end

	local world = Managers.world:world("top_ingame_view")

	if not world then
		return
	end

	self._gui = World.create_screen_gui(world, "immediate")
end

ImguiUITool._set_columns = function (self, num_columns, border, columns_width)
	border = border or false

	Imgui.columns(num_columns, border)

	if not columns_width then
		return
	end

	if type(columns_width) == "table" then
		for i, width in ipairs(columns_width) do
			Imgui.set_column_width(width, i - 1)
		end
	else
		for i = 0, num_columns - 1, 1 do
			Imgui.set_column_width(columns_width, i)
		end
	end
end

ImguiUITool.draw = function (self)
	Imgui.begin_window("UI tool")
	Imgui.set_window_size(1000, 800, "appearing")

	local gui = self:get_gui()

	if not gui then
		Imgui.text("top_ingame_view world is not available yet, please wait.")
		Imgui.end_window()

		return
	end

	local canvas_w = 1920
	local canvas_h = 1080
	local w, h = Gui.resolution()
	local scale = math.min(w / canvas_w, h / canvas_h)
	local offset_x = 0.5 * (w - canvas_w * scale)
	local offset_y = 0.5 * (h - canvas_h * scale)
	local cursor = Mouse.axis(Mouse.axis_id("cursor"))
	self._ruler = Imgui.checkbox("Ruler", self._ruler)

	if self._ruler then
		Gui.rect(gui, Vector3(offset_x, offset_y, 1000), Vector2(canvas_w * scale, canvas_w * scale), Color(16, 255, 255, 255))
		Gui.rect(gui, Vector3(cursor[1], 0, 1000), Vector2(1, h))
		Gui.rect(gui, Vector3(0, cursor[2], 1000), Vector2(w, 1))

		if Mouse.pressed(Mouse.button_index("left")) then
			self._drawing_rect = true
			self._rect_y = cursor[2]
			self._rect_x = cursor[1]
		elseif Mouse.released(Mouse.button_index("left")) then
			self._drawing_rect = false
		end

		if self._drawing_rect then
			Gui.rect(gui, Vector3(self._rect_x, self._rect_y, 1000), Vector2(cursor[1] - self._rect_x, cursor[2] - self._rect_y), Color(64, 255, 0, 0))
		end
	end

	Imgui.text(string.format("Cursor (screen units): (%d, %d)", cursor[1], cursor[2]))

	if self._ruler and self._drawing_rect then
		Imgui.same_line()
		Imgui.text(string.format("-> %dx%d", cursor[1] - self._rect_x, cursor[2] - self._rect_y))
	end

	Imgui.text(string.format("Cursor (canvas units): (%d, %d)", (cursor[1] - offset_x) / scale, (cursor[2] - offset_y) / scale))

	if self._ruler and self._drawing_rect then
		Imgui.same_line()
		Imgui.text(string.format("-> %dx%d", (cursor[1] - self._rect_x) / scale, (cursor[2] - self._rect_y) / scale))
	end

	Imgui.separator()
	Imgui.text("UI inspector")
	Imgui.same_line()

	if Imgui.small_button("Start") then
		self:hook()
	end

	Imgui.same_line()

	if Imgui.small_button("Stop") then
		self:unhook()
	end

	Imgui.same_line()

	self._highlight_textures = Imgui.checkbox("Highlight textures", self._highlight_textures)

	if Imgui.collapsing_header("Render objects", true) then
		local buffer = self._texture_buffer

		self:_set_columns(6, true)
		Imgui.text("Type")
		Imgui.set_column_width(80)
		Imgui.next_column()
		Imgui.text("Texture/String")
		Imgui.next_column()
		Imgui.text("Material/Font")
		Imgui.next_column()
		Imgui.text("Position")
		Imgui.next_column()
		Imgui.text("(Font) size")
		Imgui.next_column()
		Imgui.text("Color")
		Imgui.next_column()
		Imgui.separator()

		for i = 1, #buffer, 1 do
			if i % 6 == 0 then
				local a, r, g, b = string.match(buffer[i], "(%d+), (%d+), (%d+), (%d+)")

				Imgui.color_edit_4("", r / 255, g / 255, b / 255, a / 255)
			else
				Imgui.text(buffer[i])
			end

			Imgui.next_column()
		end

		self:_set_columns(1)
		Imgui.tree_pop()
	end

	Imgui.end_window()
end

ImguiUITool.is_persistent = function (self)
	return false
end

return

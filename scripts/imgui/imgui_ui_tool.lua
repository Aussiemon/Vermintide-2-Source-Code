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

ImguiUITool.texture = function (self, texture, pos, size)
	local is_hovered = math.point_is_inside_2d_box(Mouse.axis(Mouse.axis_id("cursor")), pos, size)

	if is_hovered then
		local buffer = self._texture_back_buffer
		local settings = UIAtlasHelper._ui_atlas_settings[texture]
		buffer[#buffer + 1] = tostring(texture)
		buffer[#buffer + 1] = (settings and settings.material_name) or "n/a"
		buffer[#buffer + 1] = string.format("Vector3(%d, %d, %d)", pos[1], pos[2], pos[3])
		buffer[#buffer + 1] = string.format("Vector2(%d, %d)", size[1], size[2])
	end

	local gui = self:get_gui()

	if not gui or not self._highlight_textures then
		return
	end

	Gui.rect(gui, Vector3(pos[1], pos[2], pos[3]), Vector2(size[1], size[2]), Color(64, (is_hovered and 255) or 0, 100, 0))
end

ImguiUITool.text = function (self, ui_renderer, text, font, font_size, pos)
	local size = UIRenderer.text_size(ui_renderer, text, font_material, font_size)
	local is_hovered = math.point_is_inside_2d_box(Mouse.axis(Mouse.axis_id("cursor")), pos, size)

	if is_hovered then
		local buffer = self._texture_back_buffer
		local settings = UIAtlasHelper._ui_atlas_settings[texture]
		buffer[#buffer + 1] = string.sub(sub, 1, 16) .. "..."
		buffer[#buffer + 1] = font
		buffer[#buffer + 1] = string.format("Vector3(%d, %d, %d)", pos[1], pos[2], pos[3])
		buffer[#buffer + 1] = string.format("Vector2(%d, %d)", size[1], size[2])
	end

	local gui = self:get_gui()

	if not gui or not self._highlight_textures then
		return
	end

	Gui.rect(gui, Vector3(pos[1], pos[2], pos[3]), Vector2(size[1], size[2]), Color(64, 0, 100, (is_hovered and 255) or 0))
end

ImguiUITool.hook = function (self)
	Debug.hook(UIRenderer, "script_draw_bitmap", function (func, gui, render_settings, material, gui_position, gui_size, color, masked, saturated, retained_id)
		self:texture(material, gui_position, gui_size)

		return func(gui, render_settings, material, gui_position, gui_size, color, masked, saturated, retained_id)
	end)
	Debug.hook(UIRenderer, "script_draw_bitmap_uv", function (func, gui, render_settings, material, uvs, gui_position, gui_size, color, masked, saturated, retained_id)
		self:texture(material, gui_position, gui_size)

		return func(gui, render_settings, material, uvs, gui_position, gui_size, color, masked, saturated, retained_id)
	end)
	Debug.hook(UIRenderer, "draw_rect", function (func, ui_renderer, lower_left_corner, size, color, retained_id)
		self:texture("rect", UIScaleVectorToResolution(lower_left_corner), UIScaleVectorToResolution(size))

		return func(ui_renderer, lower_left_corner, size, color, retained_id)
	end)
	Debug.hook(UIRenderer, "draw_text", function (func, ui_renderer, text, font_material, font_size, font_name, position, color, retained_id, color_override)
		self:text(ui_renderer, text, font_material, font_size, UIScaleVectorToResolution(position))

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

	Imgui.text(string.format("cursor (canvas units): (%d, %d)", (cursor[1] - offset_x) / scale, (cursor[2] - offset_y) / scale))

	if self._ruler and self._drawing_rect then
		Imgui.same_line()
		Imgui.text(string.format("-> %dx%d", (cursor[1] - self._rect_x) / scale, (cursor[2] - self._rect_y) / scale))
	end

	Imgui.separator()
	Imgui.text("Material inspector")
	Imgui.same_line()

	if Imgui.button("Hook") then
		self:hook()
	end

	Imgui.same_line()

	if Imgui.button("Unhook") then
		self:unhook()
	end

	self._highlight_textures = Imgui.checkbox("Highlight textures", self._highlight_textures)

	if Imgui.collapsing_header("Textures", false) then
		local buffer = self._texture_buffer

		self:_set_columns(4)
		Imgui.text("Texture")
		Imgui.next_column()
		Imgui.text("Material")
		Imgui.next_column()
		Imgui.text("Position")
		Imgui.next_column()
		Imgui.text("Size")
		Imgui.next_column()
		Imgui.separator()

		for i = 1, #buffer, 1 do
			Imgui.text(buffer[i])
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

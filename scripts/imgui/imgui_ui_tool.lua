ImguiUITool = class(ImguiUITool)
local format = string.format

local function tab2vec2(t)
	return Vector2(t[1], t[2])
end

local function settab(t, x, y)
	t[1] = x
	t[2] = y

	return t
end

ImguiUITool.init = function (self)
	self._active = false
	self._ruler = false
	self._highlight_textures = true
	self._drawing_rect = false
	self._rect_y = 0
	self._rect_x = 0
	self._data_buffer = {}
	self._data_back_buffer = {}
	self._scenegraph_search = ""
	self._cursor = {
		0,
		0
	}
	self._scale = 1
	self._offset = {
		0,
		0
	}
	self._tabs = {
		"Render objects",
		"Scenegraph"
	}
	self._selected_tab = self._tabs[1]
end

ImguiUITool.update = function (self)
	if self._active then
		self._data_back_buffer = self._data_buffer
		self._data_buffer = self._data_back_buffer

		table.clear(self._data_back_buffer)
	end

	local cursor_vec3 = Mouse.axis(Mouse.axis_id("cursor"))
	local canvas_w = 1920
	local canvas_h = 1080
	local w, h = Gui.resolution()
	local scale = math.min(w / canvas_w, h / canvas_h)
	local offset_x = 0.5 * (w - canvas_w * scale)
	local offset_y = 0.5 * (h - canvas_h * scale)
	local cursor = settab(self._cursor, cursor_vec3[1], cursor_vec3[2])
	self._scale = scale

	settab(self._offset, offset_x, offset_y)

	local gui = self:get_gui()

	if not gui then
		return
	end

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
end

local WHITE = {
	255,
	255,
	255,
	255
}
local border = 2

ImguiUITool.draw_border = function (self, pos, size, color, label)
	local gui = self:get_gui()

	if not gui or not self._highlight_textures then
		return
	end

	pos = pos + Vector3(0, 0, 1)
	local w = size[1]
	local h = size[2] - 2 * border

	Gui.rect(gui, Vector3(pos[1], pos[2], pos[3]), Vector2(w, border), color)
	Gui.rect(gui, Vector3(pos[1], (pos[2] + size[2]) - border, pos[3]), Vector2(w, border), color)
	Gui.rect(gui, Vector3(pos[1], pos[2] + border, pos[3]), Vector2(border, h), color)
	Gui.rect(gui, Vector3((pos[1] + size[1]) - border, pos[2] + border, pos[3]), Vector2(border, h), color)
end

ImguiUITool.draw_label = function (self, label, pos, color)
	local gui = self:get_gui()

	if not gui or not self._highlight_textures then
		return
	end

	Gui.text(gui, label, "materials/fonts/arial", 16, nil, pos + Vector2(border + 2, border + 2), color)
end

ImguiUITool.texture = function (self, texture_type, texture, pos, size, color)
	local is_hovered = math.point_is_inside_2d_box(self._cursor, pos, size)

	if is_hovered then
		color = color or WHITE
		local buffer = self._data_back_buffer
		local settings = UIAtlasHelper._ui_atlas_settings[texture]
		buffer[#buffer + 1] = texture_type
		buffer[#buffer + 1] = tostring(texture)
		buffer[#buffer + 1] = (settings and settings.material_name) or "n/a"
		buffer[#buffer + 1] = format("Vector3(%d, %d, %d)", pos[1], pos[2], pos[3])
		buffer[#buffer + 1] = format("Vector2(%d, %d)", size[1], size[2])
		buffer[#buffer + 1] = format("Color(%d, %d, %d, %d)", color[1], color[2], color[3], color[4])
	end

	local color = nil
	local alpha = (is_hovered and 200) or 30

	if texture_type == "rect" then
		color = Color(alpha, 0, 255, 0)
	elseif texture_type == "bitmap" then
		color = Color(alpha, 255, 0, 0)
	elseif texture_type == "bitmap_uv" then
		color = Color(alpha, 255, 0, 155)
	end

	self:draw_border(Vector3(pos[1], pos[2], 999), Vector2(size[1], size[2]), color)
end

ImguiUITool.text = function (self, ui_renderer, text, font_material, font_size, pos, color)
	local te_min, te_max, te_caret = Gui.text_extents(ui_renderer.gui, text, font_material, font_size)
	local size = te_max - te_min
	pos = pos + te_min
	local is_hovered = math.point_is_inside_2d_box(self._cursor, pos, size)

	if is_hovered then
		color = color or WHITE
		local buffer = self._data_back_buffer
		buffer[#buffer + 1] = "text"
		buffer[#buffer + 1] = format("%10q", text)
		buffer[#buffer + 1] = font_material
		buffer[#buffer + 1] = format("Vector3(%d, %d, %d)", pos[1], pos[2], pos[3])
		buffer[#buffer + 1] = format("%d / Vector2(%d, %d)", font_size, size[1], size[2])
		buffer[#buffer + 1] = format("Color(%d, %d, %d, %d)", color[1], color[2], color[3], color[4])
	end

	self:draw_border(Vector3(pos[1], pos[2], 999), Vector2(size[1], size[2]), Color((is_hovered and 200) or 30, 0, 100, 255))
end

local alignment_lookup = {
	center = "C",
	bottom = "B",
	top = "T",
	left = "L",
	right = "R"
}

ImguiUITool.node = function (self, node, file)
	if not string.find(file, self._scenegraph_search) then
		return false
	end

	local scale = self._scale
	local pos = node.world_position
	local size = node.size
	local screen_pos = Vector3(pos[1] * scale, pos[2] * scale, pos[3] * scale)
	local screen_size = Vector2(size[1] * scale, size[2] * scale)
	local is_hovered = math.point_is_inside_2d_box(self._cursor, screen_pos, screen_size)

	if is_hovered then
		local buffer = self._data_back_buffer
		buffer[#buffer + 1] = file or "n/a"
		buffer[#buffer + 1] = node.name

		if node.parent then
			buffer[#buffer + 1] = format("[%s-%s] %s", alignment_lookup[node.horizontal_alignment or "left"], alignment_lookup[node.vertical_alignment or "bottom"], node.parent)
		else
			buffer[#buffer + 1] = "n/a"
		end

		buffer[#buffer + 1] = format("Vector3(%d, %d, %d)", pos[1], pos[2], pos[3])
		buffer[#buffer + 1] = format("Vector2(%d, %d)", size[1], size[2])

		self:draw_label(node.name, Vector3(screen_pos[1], screen_pos[2], 999), Color((is_hovered and 200) or 55, 100, 100, 255))
	end

	self:draw_border(Vector3(screen_pos[1], screen_pos[2], 999), screen_size, Color((is_hovered and 200) or 55, 100, 100, 255))

	return is_hovered
end

ImguiUITool.scenegraph = function (self, scenegraph, parent_scenegraph, scenegraph_id)
	if parent_scenegraph or scenegraph_id then
		return
	end

	local info = debug.getinfo(4, "S")
	local file = info and info.short_src and string.match(info.short_src, "/([^/]+)%.lua$")
	local any_hovered = false

	for idx, node in pairs(scenegraph) do
		if type(idx) ~= "number" and self:node(node, file) then
			any_hovered = true
		end
	end

	if any_hovered then
		table.insert(self._data_back_buffer, false)
	end
end

ImguiUITool.hook = function (self)
	Debug.hook(UIRenderer, "script_draw_bitmap", function (func, gui, render_settings, material, gui_position, gui_size, color, masked, saturated, retained_id)
		if self._active and self._selected_tab == "Render objects" then
			self:texture("bitmap", material, gui_position, gui_size, color)
		end

		return func(gui, render_settings, material, gui_position, gui_size, color, masked, saturated, retained_id)
	end)
	Debug.hook(UIRenderer, "script_draw_bitmap_uv", function (func, gui, render_settings, material, uvs, gui_position, gui_size, color, masked, saturated, retained_id)
		if self._active and self._selected_tab == "Render objects" then
			self:texture("bitmap_uv", material, gui_position, gui_size, color)
		end

		return func(gui, render_settings, material, uvs, gui_position, gui_size, color, masked, saturated, retained_id)
	end)
	Debug.hook(UIRenderer, "draw_rect", function (func, ui_renderer, lower_left_corner, size, color, retained_id)
		if self._active and self._selected_tab == "Render objects" then
			self:texture("rect", "n/a", UIScaleVectorToResolution(lower_left_corner), UIScaleVectorToResolution(size), color)
		end

		return func(ui_renderer, lower_left_corner, size, color, retained_id)
	end)
	Debug.hook(UIRenderer, "draw_text", function (func, ui_renderer, text, font_material, font_size, font_name, position, color, retained_id, color_override)
		if self._active and self._selected_tab == "Render objects" then
			self:text(ui_renderer, text, font_material, font_size, UIScaleVectorToResolution(position), color)
		end

		return func(ui_renderer, text, font_material, font_size, font_name, position, color, retained_id, color_override)
	end)
	Debug.hook(UISceneGraph, "update_scenegraph", function (func, scenegraph, parent_scenegraph, scenegraph_id)
		if self._active and self._selected_tab == "Scenegraph" then
			self:scenegraph(scenegraph, parent_scenegraph, scenegraph_id)
		end

		return func(scenegraph, parent_scenegraph, scenegraph_id)
	end)

	self._active = true
end

ImguiUITool.unhook = function (self)
	Debug.unhook(UIRenderer, "script_draw_bitmap", true)
	Debug.unhook(UIRenderer, "script_draw_bitmap_uv", true)
	Debug.unhook(UIRenderer, "draw_rect", true)
	Debug.unhook(UIRenderer, "draw_text", true)

	self._active = false
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

ImguiUITool.do_render_objects = function (self)
	self:_set_columns(6, true)
	Imgui.text("Type")
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

	local buffer = self._data_buffer

	for i = 1, #buffer, 1 do
		local cell = buffer[i]
		local mod = i % 6

		if mod == 1 then
			if cell == "rect" then
				Imgui.text_colored(cell, 0, 255, 0, 255)
			elseif cell == "bitmap" then
				Imgui.text_colored(cell, 255, 0, 0, 255)
			elseif cell == "bitmap_uv" then
				Imgui.text_colored(cell, 255, 0, 155, 255)
			elseif cell == "text" then
				Imgui.text_colored(cell, 0, 100, 255, 255)
			else
				Imgui.text(cell)
			end
		elseif mod == 0 then
			local a, r, g, b = string.match(cell, "(%d+), (%d+), (%d+), (%d+)")

			Imgui.color_edit_4("##" .. i, r / 255, g / 255, b / 255, a / 255)
		else
			Imgui.text(cell)
		end

		Imgui.next_column()
	end

	self:_set_columns(1)
end

ImguiUITool.do_scenegraph = function (self)
	self:_set_columns(5, true)
	Imgui.text("File")
	Imgui.next_column()
	Imgui.text("Name")
	Imgui.next_column()
	Imgui.text("Parent")
	Imgui.next_column()
	Imgui.text("Position")
	Imgui.next_column()
	Imgui.text("Size")
	Imgui.next_column()
	Imgui.separator()

	local buffer = self._data_buffer

	for i = 1, #buffer, 1 do
		local cell = buffer[i]

		if cell ~= false then
			Imgui.text(cell)
			Imgui.next_column()
		else
			Imgui.separator()
		end
	end

	self:_set_columns(1)
end

ImguiUITool.draw = function (self)
	Imgui.begin_window("UI tool", true)

	if Imgui.begin_menu_bar() then
		for _, tab in ipairs(self._tabs) do
			local label = (self._selected_tab ~= tab and tab) or "[" .. tab .. "]"

			if Imgui.menu_item(label) then
				self._selected_tab = tab

				table.clear(self._data_buffer)
				table.clear(self._data_back_buffer)
			end
		end

		Imgui.end_menu_bar()
	end

	if Imgui.small_button("Start") then
		self:hook()
	end

	Imgui.same_line()

	if Imgui.small_button("Stop") then
		self:unhook()
	end

	Imgui.same_line()
	Imgui.text("// Pressing [space] will start/stop the inspector")

	if rawget(_G, "Keyboard") and Keyboard.pressed(Keyboard.button_id("space")) then
		self._inspector_render_objects_active = not self._inspector_render_objects_active

		if self._inspector_render_objects_active then
			self:hook()
		else
			self:unhook()
		end
	end

	local cursor = self._cursor
	local scale = self._scale
	local offset = self._offset

	Imgui.text(format("Screen: (%d, %d)", cursor[1], cursor[2]))

	if self._drawing_rect then
		Imgui.same_line()
		Imgui.text(format("+[%dx%d]", cursor[1] - self._rect_x, cursor[2] - self._rect_y))
	end

	Imgui.same_line(20)
	Imgui.text(format("Canvas: (%d, %d)", (cursor[1] - offset[1]) / scale, (cursor[2] - offset[2]) / scale))

	if self._drawing_rect then
		Imgui.same_line()
		Imgui.text(format("+ [%dx%d]", (cursor[1] - self._rect_x) / scale, (cursor[2] - self._rect_y) / scale))
	end

	self._ruler = Imgui.checkbox("Draw ruler", self._ruler)

	Imgui.text(format("Scale: x%f   Offset: Vector2(%f, %f)", scale, offset[1], offset[2]))

	self._scenegraph_search = Imgui.input_text("Search", self._scenegraph_search)

	Imgui.begin_child_window("child_window", 0, 0, true)

	if self._selected_tab == "Render objects" then
		self:do_render_objects()
	elseif self._selected_tab == "Scenegraph" then
		self:do_scenegraph()
	end

	Imgui.end_child_window()
	Imgui.end_window()
end

ImguiUITool.is_persistent = function (self)
	return true
end

return

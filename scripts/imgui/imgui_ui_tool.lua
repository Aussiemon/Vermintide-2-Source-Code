-- chunkname: @scripts/imgui/imgui_ui_tool.lua

ImguiUITool = class(ImguiUITool)

local Gui, Imgui = Gui, Imgui
local format = string.format

local function tab2vec2(t)
	return Vector2(t[1], t[2])
end

local function tab2col(t)
	return Color(t[1], t[2], t[3], t[4])
end

local function settab(t, x, y)
	t[1] = x
	t[2] = y

	return t
end

local select, find = select, string.find

local function do_search(needle, ...)
	for i = 1, select("#", ...) do
		local ok, i, j = pcall(find, select(i, ...), needle)

		if not ok then
			return false
		elseif i then
			return i, j
		end
	end
end

ImguiUITool.init = function (self)
	self._active = false
	self._draw_ruler = false
	self._draw_canvas = false
	self._ruler_color = {
		64,
		255,
		0,
		0,
	}
	self._highlight_textures = true
	self._drawing_rect = false
	self._hide_ui = false
	self._disable_localization = not not script_data.disable_localization
	self._rect_x, self._rect_y = 0, 0
	self._data_buffer = {}
	self._data_back_buffer = {}
	self._search = ""
	self._cursor = {
		0,
		0,
	}
	self._scale = 1
	self._offset = {
		0,
		0,
	}
	self._tabs = {
		"Render objects",
		"Scenegraph",
		"Atlas browser",
		"Settings",
		"Help",
	}
	self._selected_tab = self._tabs[1]
end

local DO_RELOAD = true

ImguiUITool.update = function (self)
	if DO_RELOAD then
		self:init()

		DO_RELOAD = false
	end

	if self._active then
		self._data_buffer, self._data_back_buffer = self._data_back_buffer, self._data_buffer

		table.clear(self._data_back_buffer)
	end

	local cursor_vec3 = Mouse.axis(Mouse.axis_id("cursor"))
	local canvas_w, canvas_h = 1920, 1080
	local w, h = Gui.resolution()
	local scale = math.min(w / canvas_w, h / canvas_h)
	local offset_x, offset_y = 0.5 * (w - canvas_w * scale), 0.5 * (h - canvas_h * scale)
	local cursor = settab(self._cursor, cursor_vec3[1], cursor_vec3[2])

	self._scale = scale

	settab(self._offset, offset_x, offset_y)

	local gui = self:get_gui()

	if not gui then
		return
	end

	if self._draw_canvas then
		local margin_color = Color(32, 255, 0, 255)

		Gui.rect(gui, Vector3(0, 0, 999), Vector2(offset_x, h), margin_color)
		Gui.rect(gui, Vector3(w, 0, 999), Vector2(-offset_x, h), margin_color)
		Gui.rect(gui, Vector3(offset_x, 0, 999), Vector2(w - offset_x, offset_y), margin_color)
		Gui.rect(gui, Vector3(offset_x, h, 999), Vector2(w - offset_x, -offset_y), margin_color)
	end

	if self._selected_tab ~= "Atlas browser" then
		if self._draw_ruler then
			Gui.rect(gui, Vector3(cursor[1], 0, 1000), Vector2(1, h))
			Gui.rect(gui, Vector3(0, cursor[2], 1000), Vector2(w, 1))
		end

		local mouse_button_idx = Mouse.button_index("right")

		if Mouse.pressed(mouse_button_idx) then
			self._drawing_rect = true
			self._rect_x, self._rect_y = cursor[1], cursor[2]
		elseif Mouse.released(mouse_button_idx) then
			self._drawing_rect = false
		end

		if self._drawing_rect then
			Gui.rect(gui, Vector3(self._rect_x, self._rect_y, 1000), Vector2(cursor[1] - self._rect_x, cursor[2] - self._rect_y), tab2col(self._ruler_color))
		end
	end
end

local WHITE = {
	255,
	255,
	255,
	255,
}
local BORDER = 2

local function inside_2d_box_lenient(cursor, box_pos, box_size)
	return box_pos[1] - BORDER <= cursor[1] and cursor[1] <= box_pos[1] + box_size[1] + BORDER and box_pos[2] - BORDER <= cursor[2] and cursor[2] <= box_pos[2] + box_size[2] + BORDER
end

local function draw_border(gui, pos, size, border, color)
	local w = size[1]
	local h = size[2] - 2 * BORDER

	Gui.rect(gui, Vector3(pos[1], pos[2], pos[3]), Vector2(w, border), color)
	Gui.rect(gui, Vector3(pos[1], pos[2] + size[2] - border, pos[3]), Vector2(w, border), color)
	Gui.rect(gui, Vector3(pos[1], pos[2] + border, pos[3]), Vector2(border, h), color)
	Gui.rect(gui, Vector3(pos[1] + size[1] - border, pos[2] + border, pos[3]), Vector2(border, h), color)
end

ImguiUITool.draw_border = function (self, pos, size, color, label)
	local gui = self:get_gui()

	if not gui or not self._highlight_textures then
		return
	end

	pos = pos + Vector3(0, 0, 1)

	return draw_border(gui, pos, size, BORDER, color)
end

ImguiUITool.draw_label = function (self, label, pos, color)
	local gui = self:get_gui()

	if not gui or not self._highlight_textures then
		return
	end

	Gui.text(gui, label, "materials/fonts/arial", 16, nil, pos + Vector2(BORDER + 2, BORDER + 2), color)
end

ImguiUITool.texture = function (self, texture_type, texture, pos, size, color)
	if not do_search(self._search, texture_type, texture) then
		return
	end

	local is_hovered = inside_2d_box_lenient(self._cursor, pos, size)

	if is_hovered then
		color = color or WHITE

		local buffer = self._data_back_buffer
		local settings = UIAtlasHelper._ui_atlas_settings[texture]

		buffer[#buffer + 1] = texture_type
		buffer[#buffer + 1] = tostring(texture)
		buffer[#buffer + 1] = settings and settings.material_name or "n/a"
		buffer[#buffer + 1] = format("Vector3(%d, %d, %d)", pos[1], pos[2], pos[3])
		buffer[#buffer + 1] = format("Vector2(%d, %d)", size[1], size[2])
		buffer[#buffer + 1] = format("Color(%d, %d, %d, %d)", color[1], color[2], color[3], color[4])
	end

	local color
	local alpha = is_hovered and 200 or 30

	if texture_type == "rect" or texture_type == "rounded_rect" then
		color = Color(alpha, 0, 255, 0)
	elseif texture_type == "bitmap" then
		color = Color(alpha, 255, 0, 0)
	elseif texture_type == "bitmap_uv" then
		color = Color(alpha, 255, 0, 155)
	end

	self:draw_border(Vector3(pos[1], pos[2], 999), Vector2(size[1], size[2]), color)
end

ImguiUITool.text = function (self, ui_renderer, text, font_material, font_size, pos, color)
	if not do_search(self._search, text, font_material) then
		return
	end

	local te_min, te_max, te_caret = Gui.text_extents(ui_renderer.gui, text, font_material, font_size)
	local size = te_max - te_min

	pos = pos + te_min

	local is_hovered = inside_2d_box_lenient(self._cursor, pos, size)

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

	self:draw_border(Vector3(pos[1], pos[2], 999), Vector2(size[1], size[2]), Color(is_hovered and 200 or 30, 0, 100, 255))
end

ImguiUITool.node = function (self, node, file)
	if not do_search(self._search, node.name or "n/a", file) then
		return
	end

	local scale = self._scale
	local pos = node.world_position
	local size = node.size
	local screen_pos = Vector3(pos[1] * scale, pos[2] * scale, pos[3] * scale)
	local screen_size = Vector2(size[1] * scale, size[2] * scale)
	local is_hovered = inside_2d_box_lenient(self._cursor, screen_pos, screen_size)

	if is_hovered then
		local buffer = self._data_back_buffer

		buffer[#buffer + 1] = file or "n/a"
		buffer[#buffer + 1] = node.name

		if node.parent then
			buffer[#buffer + 1] = node.parent
			buffer[#buffer + 1] = format("%s / %s", node.horizontal_alignment or "left", node.vertical_alignment or "bottom")
		else
			buffer[#buffer + 1] = "n/a"
			buffer[#buffer + 1] = "n/a"
		end

		buffer[#buffer + 1] = format("Vector3(%d, %d, %d)", pos[1], pos[2], pos[3])
		buffer[#buffer + 1] = format("Vector2(%d, %d)", size[1], size[2])

		self:draw_label(node.name, Vector3(screen_pos[1], screen_pos[2], 999), Color(is_hovered and 200 or 55, 100, 100, 255))
	end

	self:draw_border(Vector3(screen_pos[1], screen_pos[2], 999), screen_size, Color(is_hovered and 200 or 55, 100, 100, 255))

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

ImguiUITool.on_show = function (self)
	Debug.hook(UIRenderer, "script_draw_bitmap", function (func, gui, render_settings, material, gui_position, gui_size, color, masked, saturated, retained_id)
		if self._active and self._selected_tab == "Render objects" then
			self:texture("bitmap", material, gui_position, gui_size, color)
		end

		if self._hide_ui then
			return
		end

		return func(gui, render_settings, material, gui_position, gui_size, color, masked, saturated, retained_id)
	end)
	Debug.hook(UIRenderer, "script_draw_bitmap_uv", function (func, gui, render_settings, material, uvs, gui_position, gui_size, color, masked, saturated, retained_id)
		if self._active and self._selected_tab == "Render objects" then
			self:texture("bitmap_uv", material, gui_position, gui_size, color)
		end

		if self._hide_ui then
			return
		end

		return func(gui, render_settings, material, uvs, gui_position, gui_size, color, masked, saturated, retained_id)
	end)
	Debug.hook(UIRenderer, "draw_rect", function (func, ui_renderer, lower_left_corner, size, color, retained_id)
		if self._active and self._selected_tab == "Render objects" then
			self:texture("rect", "n/a", UIScaleVectorToResolution(lower_left_corner), UIScaleVectorToResolution(size), color)
		end

		if self._hide_ui then
			return
		end

		return func(ui_renderer, lower_left_corner, size, color, retained_id)
	end)
	Debug.hook(UIRenderer, "draw_rounded_rect", function (func, ui_renderer, position, size, radius, color)
		if self._active and self._selected_tab == "Render objects" then
			self:texture("rounded_rect", "n/a", UIScaleVectorToResolution(position), UIScaleVectorToResolution(size), color)
		end

		if self._hide_ui then
			return
		end

		return func(ui_renderer, position, size, radius, color)
	end)
	Debug.hook(UIRenderer, "draw_text", function (func, ui_renderer, text, font_material, font_size, font_name, position, color, retained_id, color_override)
		if self._active and self._selected_tab == "Render objects" then
			self:text(ui_renderer, text, font_material, font_size, UIScaleVectorToResolution(position), color)
		end

		if self._hide_ui then
			return
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

ImguiUITool.on_hide = function (self)
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
	Imgui.columns(num_columns, not not border)

	if not columns_width then
		return
	end

	if type(columns_width) == "table" then
		for i, width in ipairs(columns_width) do
			Imgui.set_column_width(width, i - 1)
		end
	else
		for i = 0, num_columns - 1 do
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

	for i = 1, #buffer do
		local cell = buffer[i]
		local mod = i % 6

		if mod == 1 then
			if cell == "rect" or cell == "rounded_rect" then
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
	self:_set_columns(6, true)
	Imgui.text("File")
	Imgui.next_column()
	Imgui.text("Name")
	Imgui.next_column()
	Imgui.text("Parent")
	Imgui.next_column()
	Imgui.text("Alignment")
	Imgui.next_column()
	Imgui.text("Position")
	Imgui.next_column()
	Imgui.text("Size")
	Imgui.next_column()
	Imgui.separator()

	local buffer = self._data_buffer

	for i = 1, #buffer do
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

local function get_texture_name(a)
	return a.texture_name
end

local function get_material_name(a)
	return a.material_name
end

local function get_area(a)
	local s = a.size

	return s[1] * s[2]
end

local function sorters(data, get, id)
	Imgui.same_line()

	if Imgui.small_button("^##ASC_" .. id) then
		table.sort(data, function (a, b)
			return get(a) < get(b)
		end)
		printf("[ImguiUITool] Sorted by %s in ASC order", id)
	end

	Imgui.same_line()

	if Imgui.small_button("v##DESC_" .. id) then
		table.sort(data, function (a, b)
			return get(a) > get(b)
		end)
		printf("[ImguiUITool] Sorted by %s in DESC order", id)
	end
end

ImguiUITool.do_asset_browser = function (self)
	local texture_registry = self._texture_registry

	if not texture_registry then
		texture_registry = table.values(UIAtlasHelper._ui_atlas_settings)
		self._texture_registry = texture_registry
	end

	self:_set_columns(3, true)
	Imgui.text("Texture")
	sorters(texture_registry, get_texture_name, "1")
	Imgui.next_column()
	Imgui.text("Material")
	sorters(texture_registry, get_material_name, "2")
	Imgui.next_column()
	Imgui.text("Size")
	sorters(texture_registry, get_area, "3")
	Imgui.next_column()
	Imgui.separator()

	local ingame_ui = Managers.ui._ingame_ui
	local gui = ingame_ui and ingame_ui.ui_top_renderer.gui
	local w, h = Gui.resolution()
	local needle = self._search
	local cursor = self._cursor
	local cell_size = Vector2(50, 50)
	local cols = math.floor(w / cell_size[1])
	local rows = math.floor(h / cell_size[2])
	local cell_index = cols * rows

	for i = 1, #texture_registry do
		local texture_settings = texture_registry[i]
		local texture_name = texture_settings.texture_name
		local material_name = texture_settings.material_name

		if do_search(needle, texture_name, material_name) then
			local size = texture_settings.size
			local is_hover = false

			if gui and cell_index > 0 then
				cell_index = cell_index - 1

				local cell_i = cols - 1 - cell_index % cols
				local cell_j = math.floor(cell_index / cols)
				local cell_pos = Vector3(cell_size[1] * cell_i, cell_size[2] * cell_j, 950)

				is_hover = math.point_is_inside_2d_box(cursor, cell_pos, cell_size)

				if Gui.material(gui, material_name) then
					local scale = math.min(cell_size[1] / size[1], cell_size[2] / size[2], 1)
					local tex_size = Vector2(size[1] * scale, size[2] * scale)
					local tex_pos = cell_pos + 0.5 * (cell_size - tex_size)

					Gui.rect(gui, cell_pos, cell_size, Color(127, 127, 127))
					Gui.bitmap_uv(gui, material_name, tab2vec2(texture_settings.uv00), tab2vec2(texture_settings.uv11), tex_pos, tex_size)

					if is_hover then
						draw_border(gui, cell_pos + Vector3(0, 0, 1), cell_size, BORDER, Color(255, 0, 0))
					end
				else
					Gui.rect(gui, cell_pos, cell_size, Color(255, 192, 203))
					Gui.text(gui, "No material", "materials/fonts/arial", 7.5, nil, cell_pos + Vector2(0, 0.5 * (cell_size[2] - 18)), cell_size, Color(0, 0, 0))
				end
			end

			if is_hover then
				Imgui.text_colored(texture_name, 255, 0, 0, 255)

				if Mouse.button(Mouse.button_id("right")) > 0.5 then
					Imgui.set_scroll_here()

					local y = math.min((h - size[2]) * 0.5, 100)

					if cursor[2] < h * 0.25 then
						y = math.max((h - size[2]) * 0.5, h - size[2] - 100)
					end

					local big_pos = Vector3((w - size[1]) * 0.5, y, 960)
					local big_size = tab2vec2(size)
					local border = Vector2(10, 10)

					Gui.bitmap(gui, "marching_ants", big_pos - border - Vector3(0, 0, 1), big_size + 2 * border, Color(255, 0, 0))
					Gui.rect(gui, big_pos - border - Vector3(0, 0, 2), big_size + 2 * border, Color(0, 0, 0))
					Gui.rect(gui, big_pos, big_size, Color(127, 127, 127))

					if Gui.material(gui, material_name) then
						Gui.bitmap_uv(gui, material_name, tab2vec2(texture_settings.uv00), tab2vec2(texture_settings.uv11), big_pos, big_size)
					else
						Gui.rect(gui, big_pos, big_size, Color(255, 192, 203))
						Gui.text(gui, "No material", "materials/fonts/arial", 7.5, nil, big_pos + Vector2(0, 0.5 * (big_size[2] - 18)), big_size, Color(0, 0, 0))
					end
				end
			else
				Imgui.text(texture_name)
			end

			Imgui.next_column()
			Imgui.text(material_name)
			Imgui.next_column()
			Imgui.text(format("%4d x %4d", size[1], size[2]))
			Imgui.next_column()
		end
	end

	self:_set_columns(1)
end

ImguiUITool._setting_checkbox = function (self, key, label)
	if do_search(self._search, label) then
		self[key] = Imgui.checkbox(label, self[key] or false)
	end
end

ImguiUITool._setting_color = function (self, key, label)
	if do_search(self._search, label) then
		local col = self[key] or {
			255,
			255,
			255,
			255,
		}

		Colors.set(col, ImguiX.color_edit_4(label, unpack(col)))

		self[key] = col
	end
end

ImguiUITool.do_settings = function (self)
	Imgui.text("Settings")
	Imgui.separator()
	self:_setting_checkbox("_draw_ruler", "Draw ruler crosshair")
	self:_setting_checkbox("_draw_canvas", "Draw canvas margins")
	self:_setting_checkbox("_disable_localization", "Disable localization")
	self:_setting_checkbox("_hide_ui", "Hide immediate-mode UIs")
	self:_setting_checkbox("_highlight_textures", "Highlight matching objects")
	self:_setting_color("_ruler_color", "Measurement tool color")

	script_data.disable_localization = self._disable_localization
end

local HELP_TEXT = "UITOOL(1)                    General Tools Manual                    UITOOL(1)\n \nNAME\n\tUI Tool - a suite of utilities to make UI development a wee bit easier\n \nINTRODUCTION\n\tThe UI tool is a collection of disjoint utilities that facilitate examining\n\tvarious UI systems at run time. It is comprised of the following tools:\n\t\tSome common elements.\n\t\tA render object inspector.\n\t\tA scenegraph inspector.\n\t\tAn atlas texture browser.\n\nCOMMON ELEMENTS\n\tThese elements are shared between all tools.\n \n\tThe current cursor position is shown both in screen and canvas coordinates.\n\tMeasurements can be taken by dragging with the RIGHT mouse button.\n \n\tThe search bar can be used to apply filters on any tab, including this one\n\t(try it!). All searches are CASE SENSITIVE and accept Lua string patterns.\n \nRENDER OBJECT INSPECTOR\n\tRender objects are pseudo-objects constructed when Lua code sends draw\n\trequests to the engine. That is to say that there's a 1-to-1 correspondence\n\tbetween render objects and calls to Gui.bitmap, Gui.rect, etc.\n\tRender objects are disposed of once they have been processed by the Gui.\n\tIt is currently not possible to inspect render objects that exist inside a\n\tGui object that was created in retained mode.\n \n\tRender objects are color coded according to the following table:\n\t\tred         Bitmaps\n\t\tpurple      Bitmap UV\n\t\tgreen       Rect\n\t\tblue        Text\n\t\n\tOther types of render objects are not supported at this time.\n \nSCENEGRAPH INSPECTOR\n\tThe scenegraph is a structure to help layout UI elements on the screen.\n\tInternally it is stored as a forest where every node is associated to a\n\tquad region on the screen.\n\tThis tool can be useful to identify the internal name of a UI.\n \nATLAS TEXTURE BROWSER\n\tTextures are packed into atlas to reduce the overhead of loading many\n\tsmall textures from disk to the GPU. For example, it would not be cost\n\teffective applying texture block compression methods on tiny textures, but\n\tby packing them together a reduction in total size can be achieved.\n \n\tThis tool provides a quick way of searching and visualizing all such\n\tatlased textures that are available to the UI systems. Results can be\n\tsorted by texture name, material name or area size with the little ^ and v\n\tbuttons on the header row.\n\tHolding right-click over a texture preview will render it at native size\n\tand scroll the listing results to that point.\n \n\tNOTE: The ruler is disabled while this mode is active.\n"

ImguiUITool.do_help = function (self)
	local needle = self._search
	local find, sub = string.find, string.sub
	local do_scroll = self._search ~= self._help_cached_search

	self._help_cached_search = self._search

	for line in string.gmatch(HELP_TEXT, "[^\n]+") do
		local i, j = do_search(needle, line)

		if not i or j == 0 then
			Imgui.text(line)
		else
			Imgui.text(sub(line, 1, i - 1))
			Imgui.same_line(0)
			Imgui.text_colored(sub(line, i, j), 255, 0, 0, 255)
			Imgui.same_line(0)
			Imgui.text(sub(line, j + 1))

			if do_scroll then
				Imgui.set_scroll_here()

				do_scroll = false
			end
		end
	end
end

ImguiUITool.draw = function (self)
	local do_close, is_open = Imgui.begin_window("UI Inspector", "menu_bar")

	if not is_open then
		return do_close
	end

	if Imgui.begin_menu_bar() then
		for i, tab in ipairs(self._tabs) do
			local label = self._selected_tab ~= tab and " " .. tab .. " " or "[" .. tab .. "]"

			if Imgui.menu_item(label) then
				self._selected_tab = tab

				table.clear(self._data_buffer)
				table.clear(self._data_back_buffer)
			end
		end

		Imgui.end_menu_bar()
	end

	local cursor = self._cursor
	local scale = self._scale
	local offset = self._offset

	ImguiX.heading("Screen cursor", "(%4d, %4d)", cursor[1], cursor[2])
	Imgui.same_line()

	if self._drawing_rect then
		Imgui.text(format("+ [%4dx%4d]", cursor[1] - self._rect_x, cursor[2] - self._rect_y))
	else
		Imgui.text(string.rep(" ", 13))
	end

	Imgui.same_line()
	ImguiX.heading("Scale", "x%f", scale)
	ImguiX.heading("Canvas cursor", "(%4d, %4d)", (cursor[1] - offset[1]) / scale, (cursor[2] - offset[2]) / scale)
	Imgui.same_line()

	if self._drawing_rect then
		Imgui.text(format("+ [%4dx%4d]", (cursor[1] - self._rect_x) / scale, (cursor[2] - self._rect_y) / scale))
	else
		Imgui.text(string.rep(" ", 13))
	end

	Imgui.same_line()
	ImguiX.heading("Offset", "Vector2(%f, %f)", offset[1], offset[2])

	self._search = Imgui.input_text("Search", self._search)

	Imgui.begin_child_window("child_window", 0, 0, true)

	if self._selected_tab == "Render objects" then
		self:do_render_objects()
	elseif self._selected_tab == "Scenegraph" then
		self:do_scenegraph()
	elseif self._selected_tab == "Atlas browser" then
		self:do_asset_browser()
	elseif self._selected_tab == "Settings" then
		self:do_settings()
	elseif self._selected_tab == "Help" then
		self:do_help()
	end

	Imgui.end_child_window()
	Imgui.end_window()

	return do_close
end

ImguiUITool.is_persistent = function (self)
	return true
end

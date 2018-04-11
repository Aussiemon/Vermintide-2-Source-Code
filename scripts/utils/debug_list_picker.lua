DebugListPicker = class(DebugListPicker)
local font_size = 22
local font = "gw_arial_32"
local font_mtrl = "materials/fonts/" .. font
local font_height = 22
local COLUMN_SPACING = 10
DebugListPicker.init = function (self, list, save_data_name, max_cols_seen)
	self.pick_list = list
	self.save_data_name = save_data_name
	self.row_index = 1
	self.column_index = 1
	self.move_cursor_timer = 0
	self.gui = Debug.gui
	self.font_mtrl = font_mtrl
	self.font = font
	self.font_size = font_size

	self.setup(self, save_data_name)

	self.column = self.pick_list[self.column_index]
	self.item = self.column[self.row_index]
	self.max_cols_seen = max_cols_seen or 3

	return 
end
DebugListPicker.destroy = function (self)
	return 
end
DebugListPicker.setup = function (self)
	local saved_item_name = SaveData[self.save_data_name] or self.pick_list[1][1]
	local start_item = nil
	local max_width = 0
	local max_height = 0
	local pick_list = self.pick_list
	local max_rows = 0

	for i = 1, #pick_list, 1 do
		local column = pick_list[i]
		local num_rows = #column

		if max_rows < num_rows then
			max_rows = num_rows
		end

		for j = 1, num_rows, 1 do
			local item = column[j]
			local text = item[1]

			if saved_item_name == text then
				self.column_index = i
				self.row_index = j
				self.column = self.pick_list[self.column_index]
				self.item = self.column[self.row_index]
			end

			local min, max = Gui.text_extents(self.gui, text.upper(text), self.font_mtrl, self.font_size)
			local width = max.x - min.x
			local height = max.y - min.y

			if max_width < width then
				max_width = width
			end

			if max_height < height then
				max_height = height
			end
		end
	end

	self.max_height = max_height
	self.max_width = max_width + 40
	self.max_rows = max_rows + 1

	return 
end
DebugListPicker.activate = function (self)
	self.active = not self.active

	DebugScreen.set_blocked(self.active)

	if not self.active and self.save_data_name then
		SaveData[self.save_data_name] = self.item[1]

		Managers.save:auto_save(SaveFileName, SaveData)
	end

	return 
end
DebugListPicker.current_item = function (self)
	return self.item
end
DebugListPicker.current_item_name = function (self)
	return self.item[1]
end
DebugListPicker.update = function (self, t, dt)
	if not self.active then
		return 
	end

	local wall_time = Application.time_since_launch()
	local pick_list = self.pick_list
	local column = self.column
	local item = self.item

	if DebugKeyHandler.key_pressed("right_key", "switch spawn category", "ai") then
		self.column_index = self.column_index + 1
		self.column_index = (self.column_index - 1) % #pick_list + 1
		self.column = self.pick_list[self.column_index]
		self.row_index = math.clamp(self.row_index, 1, #self.column)
		self.item = self.column[self.row_index]
	end

	if DebugKeyHandler.key_pressed("left_key", "switch spawn category", "ai") then
		self.column_index = self.column_index - 1
		self.column_index = (self.column_index - 1) % #pick_list + 1
		self.column = self.pick_list[self.column_index]
		self.row_index = math.clamp(self.row_index, 1, #self.column)
		self.item = self.column[self.row_index]
	end

	if DebugKeyHandler.key_pressed("up_key", "switch spawn category", "ai") and self.move_cursor_timer < wall_time then
		self.row_index = self.row_index - 1
		self.row_index = (self.row_index - 1) % #column + 1
		self.item = self.column[self.row_index]
		self.move_cursor_timer = wall_time + 0.1
	end

	if DebugKeyHandler.key_pressed("down_key", "switch spawn category", "ai") and self.move_cursor_timer < wall_time then
		self.row_index = self.row_index + 1
		self.row_index = (self.row_index - 1) % #column + 1
		self.item = self.column[self.row_index]
		self.move_cursor_timer = wall_time + 0.1
	end

	if not script_data.disable_debug_draw then
		local item = self.item
		local column = self.column
		local col_in = self.column_index
		local num_cols = #self.pick_list
		local c1 = col_in - 1
		local c2 = col_in + 1

		if col_in == 1 then
			c1 = 1
			c2 = c1 + self.max_cols_seen - 1
		elseif col_in == num_cols then
			c1 = num_cols - self.max_cols_seen - 1
			c2 = num_cols
		end

		local res_x = RESOLUTION_LOOKUP.res_w
		local res_y = RESOLUTION_LOOKUP.res_h
		local opacity = 0.85
		local height = self.max_height * self.max_rows
		local col_text = ""
		local header_color = nil
		local base_header_color = Color(200, 100, 0)
		local selected_header_color = Color(255, 155, 0)
		local upper_pos = Vector3(5, res_y - 80 - font_height, 900)
		local text_position = Vector3.copy(upper_pos)

		for i = c1, c2, 1 do
			local column_i = pick_list[i]

			if column == column_i then
				col_text = string.upper(column_i.name)
				header_color = selected_header_color
			else
				col_text = column_i.name
				header_color = base_header_color
			end

			Gui.text(self.gui, col_text, self.font_mtrl, self.font_size, self.font, text_position, header_color)

			local min_pos, max_pos = Gui.text_extents(self.gui, col_text, self.font_mtrl, self.font_size)
			local text_width = max_pos.x - min_pos.x + COLUMN_SPACING
			text_position.x = text_position.x + text_width
		end

		for i = 1, #column, 1 do
			local item_pos = upper_pos - Vector3(0, i * font_height, 0)

			if i == self.row_index then
				Gui.text(self.gui, " > " .. column[i][1]:upper(), self.font_mtrl, self.font_size, self.font, item_pos, Color(200, 200, 200))
			else
				Gui.text(self.gui, "     " .. column[i][1], self.font_mtrl, self.font_size, self.font, item_pos, Color(50, 200, 0))
			end
		end

		Gui.rect(self.gui, Vector3(5, res_y - height - 80, 899), Vector3(self.max_width, height, 899), Color(230 * opacity, 10, 10, 10))
	end

	return 
end

return 

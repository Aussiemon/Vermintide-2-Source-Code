-- chunkname: @scripts/utils/debug_list_picker.lua

DebugListPicker = class(DebugListPicker)

local font_size = 22
local font = "arial"
local font_mtrl = "materials/fonts/" .. font
local font_height = 22
local COLUMN_SPACING = 10
local max_display_items = 20

DebugListPicker.init = function (self, list, save_data_name, item_validation_func)
	self.pick_list = list
	self.save_data_name = save_data_name
	self._item_validation_func = item_validation_func or function ()
		return true
	end
	self.column_index, self.row_index = 1, 1
	self.move_cursor_timer = 0
	self.gui = Debug.gui
	self.font_mtrl = font_mtrl
	self.font = font
	self.font_size = font_size

	self:setup(save_data_name)

	self.column = self.pick_list[self.column_index]
	self.item = self.column[self.row_index] or "?"
	self.max_cols_seen = 3
	self._original_list_orders = table.select_map(list, function (_, v)
		return table.mirror_array(v)
	end)
end

DebugListPicker.destroy = function (self)
	return
end

DebugListPicker.setup = function (self)
	local save_data = SaveData[self.save_data_name]

	save_data = type(save_data) == "table" and save_data or {
		last_column_index = 1,
		columns = {},
	}
	self.save_data = save_data

	local columns = save_data.columns

	self.column_index = columns[save_data.last_column_index] and save_data.last_column_index or 1
	self.row_index = columns[self.column_index] and columns[self.column_index].row_index or 1

	local start_item
	local max_width, max_height = 0, 0
	local pick_list = self.pick_list
	local max_rows = 0

	self.column_index = pick_list[self.column_index] and self.column_index or 1
	self.column = pick_list[self.column_index]
	self.row_index = self.column[self.row_index] and self.row_index or 1
	self.item = self.column[self.row_index]

	for i = 1, #pick_list do
		local column = pick_list[i]

		column.last_row_index = columns[i] and columns[i].row_index or 1

		local num_rows = #column

		if max_rows < num_rows then
			max_rows = num_rows
		end

		for j = 1, num_rows do
			local item = column[j]
			local text = item[1] .. "(Enables Autoload)"
			local min, max = Gui.text_extents(self.gui, text:upper(), self.font_mtrl, self.font_size)
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
end

DebugListPicker.activate = function (self)
	self.active = not self.active

	DebugScreen.set_blocked(self.active)

	if not self.active and self.save_data_name then
		local pick_list = self.pick_list
		local save_data = self.save_data
		local columns = save_data.columns or {}

		save_data.columns = columns
		save_data.last_column_index = self.column_index

		for i = 1, #pick_list do
			local column = pick_list[i]

			columns[i] = columns[i] or {}
			columns[i].row_index = column.last_row_index
		end

		SaveData[self.save_data_name] = save_data

		Managers.save:auto_save(SaveFileName, SaveData)
	end
end

DebugListPicker.current_item = function (self)
	return self.item
end

DebugListPicker.current_item_name = function (self)
	return self.item[1]
end

DebugListPicker._sort_column = function (self, column)
	local column_index = table.index_of(self.pick_list, column)
	local original_order = self._original_list_orders[column_index]
	local valid = self._item_validation_func

	table.sort(column, function (a, b)
		local a_valid, b_valid = valid(a[1]), valid(b[1])

		if a_valid == b_valid then
			return original_order[a] < original_order[b]
		elseif a_valid then
			return true
		end

		return false
	end)
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
		self.row_index = math.clamp(self.column.last_row_index or self.row_index, 1, #self.column)
		self.item = self.column[self.row_index]
	end

	if DebugKeyHandler.key_pressed("left_key", "switch spawn category", "ai") then
		self.column_index = self.column_index - 1
		self.column_index = (self.column_index - 1) % #pick_list + 1
		self.column = self.pick_list[self.column_index]
		self.row_index = math.clamp(self.column.last_row_index or self.row_index, 1, #self.column)
		self.item = self.column[self.row_index]
	end

	if DebugKeyHandler.key_pressed("up_key", "switch spawn category", "ai") and wall_time > self.move_cursor_timer then
		self.row_index = self.row_index - 1
		self.row_index = (self.row_index - 1) % #column + 1
		self.item = self.column[self.row_index]
		self.move_cursor_timer = wall_time + 0.1
		column.last_row_index = self.row_index
	end

	if DebugKeyHandler.key_pressed("down_key", "switch spawn category", "ai") and wall_time > self.move_cursor_timer then
		self.row_index = self.row_index + 1
		self.row_index = (self.row_index - 1) % #column + 1
		self.item = self.column[self.row_index]
		self.move_cursor_timer = wall_time + 0.1
		column.last_row_index = self.row_index
	end

	if not script_data.disable_debug_draw then
		local item = self.item
		local column = self.column
		local col_in = self.column_index
		local num_cols = #self.pick_list
		local c1, c2 = col_in - 1, col_in + 1

		if col_in == 1 then
			c1 = 1
			c2 = c1 + (self.max_cols_seen - 1)
		elseif col_in == num_cols then
			c1 = num_cols - (self.max_cols_seen - 1)
			c2 = num_cols
		end

		local res_x, res_y = RESOLUTION_LOOKUP.res_w, RESOLUTION_LOOKUP.res_h
		local opacity = 0.85
		local height = self.font_size * (max_display_items + 1) + COLUMN_SPACING
		local col_text = ""
		local header_color
		local base_header_color = Color(200, 100, 0)
		local selected_header_color = Color(255, 155, 0)
		local upper_pos = Vector3(5, res_y - 80 - font_height, 900)
		local text_position = Vector3.copy(upper_pos)
		local curr_column

		for i = c1, c2 do
			local column_i = pick_list[i]

			if column == column_i then
				curr_column = column
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

		if curr_column.column_run_func then
			curr_column.column_run_func(self, item, text_position)
		end

		self:_sort_column(column)

		local start_idx = math.clamp(self.row_index - max_display_items + 1, 1, #column)
		local end_idx = math.min(#column, max_display_items) + (start_idx - 1)

		for i = start_idx, end_idx do
			local item_pos = upper_pos - Vector3(0, (i - start_idx + 1) * font_height, 0)
			local item_text = column[i][1]

			if curr_column.row_func then
				item_text = item_text .. curr_column.row_func(self, column[i])
			end

			local loaded = self._item_validation_func(item_text)

			if not loaded then
				item_text = item_text .. " (Enables Autoload)"
			end

			if i == self.row_index then
				Gui.text(self.gui, " > " .. item_text:upper(), self.font_mtrl, self.font_size, self.font, item_pos, loaded and Color(200, 200, 200) or Color(100, 50, 200, 0))
			else
				Gui.text(self.gui, "     " .. item_text, self.font_mtrl, self.font_size, self.font, item_pos, loaded and Color(50, 200, 0) or Color(100, 50, 200, 0))
			end
		end

		Gui.rect(self.gui, Vector3(5, res_y - height - 80, 899), Vector3(self.max_width, height, 899), Color(230 * opacity, 10, 10, 10))
	end
end

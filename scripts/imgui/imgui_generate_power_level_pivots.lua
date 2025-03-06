-- chunkname: @scripts/imgui/imgui_generate_power_level_pivots.lua

local serialize = require("scripts/utils/serialize")

ImguiGeneratePowerLevelPivots = class(ImguiGeneratePowerLevelPivots)

local GRAPH_STEPS = 80
local MAX_LEVEL = 30
local CURSOR_Y_OFFSET = 30
local pivot_data_passes = {
	{
		column_width = 85,
		key = "min",
		label = "Min:",
		precision = 0.25,
		type = "float",
	},
	{
		column_width = 85,
		key = "max",
		label = "Max:",
		precision = 0.25,
		type = "float",
	},
	{
		column_width = 210,
		key = "pivot_power",
		label = "Pivot Power:",
		min = 0.01,
		precision = 0.25,
		type = "slider_float",
		max = function (self, pivot_key, pivot_data, label, indent, color_key)
			return pivot_data.max * 2
		end,
	},
	{
		column_width = 140,
		key = "pivot_level",
		label = "Level:",
		max = 45,
		min = 1,
		type = "slider_int",
	},
	{
		column_width = 200,
		key = "easing_power",
		label = "Easing Power:",
		max = 2,
		min = 0.01,
		precision = 0.1,
		type = "slider_float",
	},
	{
		column_width = 205,
		label = "Color:",
		type = "text",
		data = function (self, pivot_key, pivot_data, label, indent, color_key)
			return self._colors
		end,
		key = function (self, pivot_key, pivot_data, label, indent, color_key)
			return pivot_key .. "." .. color_key
		end,
	},
}
local PIVOT_DATA_PASS_WIDTH = 0

for i = 1, #pivot_data_passes do
	PIVOT_DATA_PASS_WIDTH = PIVOT_DATA_PASS_WIDTH + pivot_data_passes[i].column_width
end

ImguiGeneratePowerLevelPivots.init = function (self)
	return
end

ImguiGeneratePowerLevelPivots._lazy_init = function (self)
	local power_level_settings = self:_power_level_settings()

	self._default_settings = self._default_settings or table.clone(power_level_settings)
	self._tabs = {
		"Graph",
		"Code",
	}
	self._selected_tab = self._selected_tab or "Graph"

	local max_power_level = 0
	local min_power_level = math.huge

	for _, pivots in pairs(self._default_settings.pivots) do
		if max_power_level < pivots.hi.max then
			max_power_level = pivots.hi.max
		end

		if min_power_level > pivots.hi.min then
			min_power_level = pivots.hi.min
		end

		if max_power_level < pivots.low.max then
			max_power_level = pivots.low.max
		end

		if min_power_level > pivots.low.min then
			min_power_level = pivots.low.min
		end
	end

	self._max_power_level = max_power_level
	self._min_power_level = min_power_level
	self._colors = {
		normal = {
			hi = "common",
			low = "common",
		},
		hard = {
			hi = "rare",
			low = "rare",
		},
		harder = {
			hi = "exotic",
			low = "exotic",
		},
		hardest = {
			hi = "unique",
			low = "unique",
		},
	}
	self._fallback_color = "pale_golden_rod"
	self._display_order = {
		hard = 2,
		harder = 3,
		hardest = 4,
		normal = 1,
	}
	self._easing_functions = {
		{
			ease = "easeOutCubic",
			inverse = "easeOutCubicInv",
		},
		{
			ease = "linear",
			inverse = "linear_inv",
		},
		{
			ease = "ease_out_quart",
			inverse = "ease_out_quart_inv",
		},
	}
	self._easing_as_array = table.select_array(self._easing_functions, function (k, v)
		return v.ease
	end)
	self._easing_func_index = self._easing_func_index or 1
	self._history = self._history or {
		table.clone(self._default_settings),
	}
	self._history_index = 1
	self._filter = ""
end

ImguiGeneratePowerLevelPivots.is_persistent = function (self)
	return false
end

ImguiGeneratePowerLevelPivots._power_level_settings = function (self)
	local loot_interface = Managers.backend:get_interface("loot")
	local power_level_settings = loot_interface:get_power_level_settings()

	return power_level_settings
end

local DO_RELOAD = true

ImguiGeneratePowerLevelPivots.update = function (self, t, dt)
	if DO_RELOAD then
		self:_lazy_init()

		DO_RELOAD = false
	end

	if Keyboard.button(Keyboard.button_index("left ctrl")) > 0 then
		if Keyboard.pressed(Keyboard.button_index("z")) then
			if self._history_index > 1 then
				self._history_index = self._history_index - 1

				local loot_interface = Managers.backend:get_interface("loot")

				loot_interface:debug_override_power_level_settings(table.clone(self._history[self._history_index]))
			end
		elseif Keyboard.pressed(Keyboard.button_index("y")) and self._history_index + 1 <= #self._history then
			self._history_index = self._history_index + 1

			local loot_interface = Managers.backend:get_interface("loot")

			loot_interface:debug_override_power_level_settings(table.clone(self._history[self._history_index]))
		end
	end
end

ImguiGeneratePowerLevelPivots.on_show = function (self)
	self:_lazy_init()
end

ImguiGeneratePowerLevelPivots.draw = function (self)
	local do_close, is_open = Imgui.begin_window("Generate Power Level Pivots", "always_auto_resize", "menu_bar")

	if not is_open then
		return do_close
	end

	self:_reset_control_id()

	self._menu_bar_height = 0

	if Imgui.begin_menu_bar() then
		for i, tab in ipairs(self._tabs) do
			local label = self._selected_tab ~= tab and " " .. tab .. " " or "[" .. tab .. "]"

			if Imgui.menu_item(label) then
				self._selected_tab = tab
			end
		end

		Imgui.end_menu_bar()

		self.asdf, self._menu_bar_height = Imgui.get_item_rect_size()
	end

	local graph_size = {
		PIVOT_DATA_PASS_WIDTH + 170,
		500,
	}
	local window_height = graph_size[2] + 290

	Imgui.begin_child_window("GraphEditor", graph_size[1], window_height, true, "always_auto_resize")

	local selected_tab = self._selected_tab

	if selected_tab == "Graph" then
		self:_draw_graph(graph_size)
	elseif selected_tab == "Code" then
		self:_draw_code(graph_size)
	end

	Imgui.end_child_window()
	Imgui.same_line()

	local summary_width = 800

	Imgui.begin_child_window("Summary", summary_width, window_height, true, "always_auto_resize")
	self:_draw_summary(summary_width)
	Imgui.end_child_window()
	Imgui.end_window()

	return do_close
end

ImguiGeneratePowerLevelPivots._reset_control_id = function (self)
	self._next_control_id_internal = 0
end

ImguiGeneratePowerLevelPivots._next_control_id = function (self)
	self._next_control_id_internal = self._next_control_id_internal + 1

	return tostring(self._next_control_id_internal)
end

ImguiGeneratePowerLevelPivots._nan_backup = function (self, v, has_any_nan, nan_context)
	if v ~= v then
		return 0, true, nan_context
	end

	return v, has_any_nan, nan_context
end

ImguiGeneratePowerLevelPivots._draw_graph = function (self, size)
	local node_color = Color(180, 100, 100, 100)
	local outline_color = Color(255, 255, 255, 255)
	local axis_color = Color(255, 255, 255, 255)
	local line_color = Color(255, 255, 255, 255)
	local val_line_color = Color(255, 255, 0, 0)
	local margin_x, margin_y = 0, 0
	local size_x, size_y = size[1], size[2]
	local axis_margin_x, axis_margin_y = 20, 20
	local axis_offset_x, axis_offset_y = 0, 0
	local line_thickness = 1
	local axis_thickness = 2
	local axis_oversize = 10

	Imgui.channel_split(2)
	Imgui.channel_set_current(0)

	local x, y = Imgui.get_cursor_screen_pos()

	Imgui.add_rect_filled(x + margin_x, y + margin_y, x + size_x - margin_x, y + size_y - margin_y, node_color, 3)
	Imgui.add_rect(x + margin_x, y + margin_y, x + size_x - margin_x, y + size_y - margin_y, outline_color, 3, 1)

	local axis_start_x = x + margin_x + axis_margin_x + axis_offset_x
	local axis_start_y = y + margin_y + axis_margin_y + axis_offset_y
	local axis_end_x = x - margin_x - axis_margin_x + size_x + axis_offset_x
	local axis_end_y = y - margin_y - axis_margin_y + size_y + axis_offset_y
	local axis_size_x = axis_end_x - axis_start_x
	local axis_size_y = axis_end_y - axis_start_y

	Imgui.add_line(axis_start_x - axis_oversize, axis_end_y, axis_end_x + axis_oversize, axis_end_y, axis_color, axis_thickness)
	Imgui.add_line(axis_start_x, axis_start_y - axis_oversize, axis_start_x, axis_end_y + axis_oversize, axis_color, axis_thickness)

	local threshold_color = Color(100, 255, 255, 255)

	Imgui.add_line(axis_start_x, axis_start_y, axis_start_x + axis_size_x, axis_start_y, threshold_color)
	Imgui.add_text("300", axis_start_x, axis_start_y - 15, Colors.get("white"))
	Imgui.add_line(axis_start_x, axis_start_y + axis_size_y * 0.3333333333333333, axis_start_x + axis_size_x, axis_start_y + axis_size_y * 0.3333333333333333, threshold_color)
	Imgui.add_text("200", axis_start_x, axis_start_y + axis_size_y * 0.3333333333333333 - 15, Colors.get("white"))
	Imgui.add_line(axis_start_x, axis_start_y + axis_size_y * 0.6666666666666666, axis_start_x + axis_size_x, axis_start_y + axis_size_y * 0.6666666666666666, threshold_color)
	Imgui.add_text("100", axis_start_x, axis_start_y + axis_size_y * 0.6666666666666666 - 15, Colors.get("white"))
	Imgui.channel_set_current(1)

	local min_x_pos, max_x_pos = axis_start_x + 1 / MAX_LEVEL * axis_size_x, axis_start_x + axis_size_x
	local min_y_pos, max_y_pos = axis_start_y, axis_start_y + axis_size_y - axis_size_y * self._min_power_level / self._max_power_level
	local num_errors = 0
	local key_has_nan
	local power_level_settings = self:_power_level_settings()
	local pivots = power_level_settings.pivots
	local old = table.clone(pivots)

	for pivot_key, pivot_data in pairs(pivots) do
		repeat
			if not string.find(pivot_key, self._filter) then
				break
			end

			local color_tbl = self:_graph_colors(pivot_key)
			local color_hi = Colors.color_definitions[color_tbl.hi] and Colors.get(color_tbl.hi) or Colors.get(self._fallback_color)
			local color_low = Colors.color_definitions[color_tbl.low] and Colors.get(color_tbl.low) or Colors.get(self._fallback_color)
			local low_min, low_max = pivot_data.low.min, pivot_data.low.max
			local hi_min, hi_max = pivot_data.hi.min, pivot_data.hi.max
			local last_x = 1 / MAX_LEVEL
			local last_low, last_hi = LootChestData.calculate_power_level(1, pivot_data)
			local last_low_y = last_low / self._max_power_level
			local last_hi_y = last_hi / self._max_power_level
			local any_nan_in_low, any_nan_in_hi
			local last_low_y, any_nan_in_low = self:_nan_backup(last_low_y, any_nan_in_low)
			local last_hi_y, any_nan_in_hi = self:_nan_backup(last_hi_y, any_nan_in_hi)

			for i = 1, GRAPH_STEPS do
				local x = i / GRAPH_STEPS

				if x * MAX_LEVEL > 1 then
					local pl_low, pl_hi = LootChestData.calculate_power_level(x * MAX_LEVEL, pivot_data)
					local low_y = pl_low / self._max_power_level
					local hi_y = pl_hi / self._max_power_level

					low_y, any_nan_in_low = self:_nan_backup(low_y, any_nan_in_low)
					hi_y, any_nan_in_hi = self:_nan_backup(hi_y, any_nan_in_hi)

					Imgui.add_line(axis_start_x + axis_size_x * last_x, axis_start_y + axis_size_y - axis_size_y * last_hi_y, axis_start_x + axis_size_x * x, axis_start_y + axis_size_y - axis_size_y * hi_y, color_hi, 1.5)
					Imgui.add_line(axis_start_x + axis_size_x * last_x, axis_start_y + axis_size_y - axis_size_y * last_low_y, axis_start_x + axis_size_x * x, axis_start_y + axis_size_y - axis_size_y * low_y, color_low, 1.5)

					last_x = x
					last_hi_y = hi_y
					last_low_y = low_y
				end
			end

			if any_nan_in_low then
				num_errors = num_errors + 1

				local cursor_pos_x, cursor_pos_y = Imgui.get_cursor_screen_pos()

				Imgui.set_cursor_screen_pos(axis_start_x + 10, axis_start_y + axis_size_y - 20 * num_errors)
				Imgui.push_style_color(Imgui.COLOR_TEXT, 255, 0, 0, 255)
				Imgui.text("Error: nan value detected in: " .. pivot_key .. "; low")
				Imgui.pop_style_color(1)
				Imgui.set_cursor_screen_pos(cursor_pos_x, cursor_pos_y)
			end

			if any_nan_in_hi then
				num_errors = num_errors + 1

				local cursor_pos_x, cursor_pos_y = Imgui.get_cursor_screen_pos()

				Imgui.set_cursor_screen_pos(axis_start_x + 10, axis_start_y + axis_size_y - 20 * num_errors)
				Imgui.push_style_color(Imgui.COLOR_TEXT, 255, 0, 0, 255)
				Imgui.text("Error: nan value detected in: " .. pivot_key .. "; high")
				Imgui.pop_style_color(1)
				Imgui.set_cursor_screen_pos(cursor_pos_x, cursor_pos_y)
			end
		until true
	end

	Imgui.channels_merge()
	Imgui.dummy(size_x, size_y)

	local graph_pos_x, graph_pos_y = Imgui.get_item_rect_min()

	if Imgui.is_item_hovered() then
		local cursor = Mouse.axis(Mouse.axis_id("cursor"))
		local x, y = Imgui.get_window_pos()
		local application_x, application_y = Application.resolution()
		local cursor_x = cursor.x
		local offset = math.clamp(cursor.x, min_x_pos, max_x_pos) - min_x_pos

		offset = math.round_to_closest_multiple(offset, 1 / MAX_LEVEL * axis_size_x)
		cursor_x = min_x_pos + offset

		local vertical_line_x = math.clamp(cursor_x, min_x_pos, max_x_pos)
		local horizontal_line_y = math.clamp(application_y - cursor.y + CURSOR_Y_OFFSET, min_y_pos, max_y_pos)

		Imgui.add_line(vertical_line_x, axis_start_y, vertical_line_x, axis_start_y + axis_size_y, Colors.get("white"))

		local mouse_multiplier = 1 - (horizontal_line_y - axis_start_y) / axis_size_y
		local mouse_power_level = mouse_multiplier * self._max_power_level
		local best_diff = math.huge
		local best_power_level = 0
		local best_color
		local level = math.round(offset / axis_size_x * MAX_LEVEL)

		for pivot_key, pivot_data in pairs(pivots) do
			repeat
				if not string.find(pivot_key, self._filter) then
					break
				end

				local color_tbl = self:_graph_colors(pivot_key)
				local color_hi = Colors.color_definitions[color_tbl.hi] and Colors.get(color_tbl.hi) or Colors.get(self._fallback_color)
				local color_low = Colors.color_definitions[color_tbl.low] and Colors.get(color_tbl.low) or Colors.get(self._fallback_color)
				local last_x = 1 / MAX_LEVEL
				local pl_low, pl_hi = LootChestData.calculate_power_level(level, pivot_data)

				pl_low, pl_hi = math.round(pl_low), math.round(pl_hi)

				if best_diff > math.abs(pl_low - mouse_power_level) then
					best_power_level = pl_low
					best_diff = math.abs(pl_low - mouse_power_level)
					best_color = color_low
				end

				if best_diff > math.abs(pl_hi - mouse_power_level) then
					best_power_level = pl_hi
					best_diff = math.abs(pl_hi - mouse_power_level)
					best_color = color_hi
				end
			until true
		end

		if best_power_level ~= 0 then
			local closest_y = axis_start_y + axis_size_y - best_power_level / self._max_power_level * axis_size_y

			Imgui.add_text(tostring(best_power_level), vertical_line_x + 5, closest_y - 15, best_color)
			Imgui.add_text(tostring(level), vertical_line_x, axis_start_y + axis_size_y, Colors.get("white"))
		end
	end

	Imgui.dummy(size_x, 5)
	Imgui.separator()
	Imgui.dummy(size_x, 5)
	Imgui.tree_push(self:_next_control_id())
	Imgui.unindent()
	Imgui.text("Easing Function")
	Imgui.same_line()

	self._easing_func_index = Imgui.combo("", self._easing_func_index, self._easing_as_array)

	Imgui.indent()
	Imgui.tree_pop()

	power_level_settings.easing_function = self._easing_functions[self._easing_func_index].ease
	power_level_settings.inverse_easing_function = self._easing_functions[self._easing_func_index].inverse

	Imgui.same_line()
	Imgui.indent(350)
	Imgui.tree_push(self:_next_control_id())
	Imgui.unindent()
	Imgui.text("Filter")
	Imgui.same_line()

	self._filter = Imgui.input_text("", self._filter)

	Imgui.indent()
	Imgui.tree_pop()
	Imgui.unindent(350)
	Imgui.dummy(size_x, 5)
	Imgui.separator()
	Imgui.dummy(size_x, 5)
	Imgui.columns(8)

	local keys = self:_sorted_pivot_keys(pivots)
	local last_pivot

	for i = 1, #keys do
		repeat
			local pivot_key = keys[i]

			if not string.find(pivot_key, self._filter) then
				break
			end

			local pivot_data = pivots[pivot_key]

			Imgui.set_column_width(123)
			Imgui.tree_push(self:_next_control_id())
			Imgui.unindent()

			if Imgui.button("x") then
				pivots[pivot_key] = nil

				Imgui.indent()
				Imgui.tree_pop()

				break
			end

			Imgui.same_line()
			Imgui.push_item_width(85)

			local new_key = Imgui.input_text("", self._pivot_key_original == pivot_key and self._pivot_key_edit or pivot_key)
			local focused = Imgui.is_item_active()

			Imgui.indent()
			Imgui.tree_pop()
			Imgui.pop_item_width()

			if (focused or pivot_key == self._pivot_key_original) and new_key ~= pivot_key then
				if focused then
					self._pivot_key_edit = new_key
					self._pivot_key_original = pivot_key
				else
					pivots[pivot_key] = nil
					pivots[new_key] = pivot_data
					self._pivot_key_edit = nil
					self._pivot_key_original = nil

					break
				end
			end

			self:_draw_pivot_edit_row(pivot_key, pivot_data.low, "low", 0, "low")
			self:_draw_pivot_edit_row(pivot_key, pivot_data.hi, "high", 1, "hi")
			Imgui.next_column()

			last_pivot = pivot_data
		until true
	end

	Imgui.columns(1)

	if Imgui.button("Add") then
		local name = ""

		while pivots[name] do
			name = name .. " "
		end

		pivots[name] = table.clone(last_pivot) or {
			max = 300,
			min = 10,
			pivot_level = 30,
			pivot_power = 300,
		}
	end

	Imgui.same_line()

	if Imgui.button("Reset") then
		local loot_interface = Managers.backend:get_interface("loot")

		loot_interface:debug_override_power_level_settings(self._default_settings)
	end

	if not table.deep_equal(old, pivots) then
		self._history_index = self._history_index + 1
		self._history[self._history_index] = table.clone(power_level_settings)

		for i = self._history_index + 1, #self._history do
			self._history[i] = nil
		end
	end
end

ImguiGeneratePowerLevelPivots._draw_pivot_edit_row = function (self, pivot_key, pivot_data, label, indent, color_key)
	for i = 1, indent do
		Imgui.next_column()
	end

	Imgui.next_column()
	Imgui.set_column_width(50)
	Imgui.text(label)

	for i = 1, #pivot_data_passes do
		Imgui.next_column()

		local pass = pivot_data_passes[i]
		local data = pass.data and pass.data(self, pivot_key, pivot_data, label, indent, color_key) or pivot_data
		local column_width = pass.column_width
		local label = pass.label or pass.key
		local key = type(pass.key) == "function" and pass.key(self, pivot_key, pivot_data, label, indent, color_key) or pass.key

		key = string.split(key, ".")

		local max = type(pass.max) == "function" and pass.max(self, pivot_key, pivot_data, label, indent, color_key) or pass.max
		local type = pass.type

		Imgui.set_column_width(column_width)

		local label_width = 0

		if label then
			label_width = Imgui.calculate_text_size(label)

			Imgui.text(label)
			Imgui.same_line()
		end

		if key then
			Imgui.tree_push(self:_next_control_id())
			Imgui.unindent()

			for i = 1, #key - 1 do
				data = data[key[i]]
			end

			key = key[#key]

			Imgui.dummy(label_width, 0)
			Imgui.same_line()
			Imgui.push_item_width(column_width - label_width)

			if type == "float" then
				data[key] = Imgui.input_text("", tostring(data[key] or 0))
				data[key] = tonumber(data[key]) or 0
			elseif type == "slider_float" then
				data[key] = Imgui.slider_float("", data[key], pass.min or 0, max or 1) or 0
			elseif type == "slider_int" then
				data[key] = Imgui.slider_int("", data[key], pass.min or 0, max or 1) or 0
			elseif type == "text" then
				data[key] = Imgui.input_text("", data[key]) or ""
			end

			Imgui.pop_item_width()

			if pass.precision then
				data[key] = math.round_to_closest_multiple(data[key], pass.precision)
			end

			Imgui.indent()
			Imgui.tree_pop()
		end
	end
end

ImguiGeneratePowerLevelPivots._draw_code = function (self, size)
	Imgui.push_item_width(size[1])

	local settings = self:_power_level_settings()
	local as_json = serialize.save_simple(settings)
	local edited = Imgui.input_text_multiline("", as_json, size[2])
	local compiles, result = pcall(function ()
		return cjson.decode(edited)
	end)

	if compiles then
		local loot_interface = Managers.backend:get_interface("loot")

		loot_interface:debug_override_power_level_settings(result)
	else
		local error_msg = "Error: " .. result

		Imgui.text(error_msg)
	end

	Imgui.text("Code doesn't support clipboard. Need to implement serializer.")
	Imgui.pop_item_width()
end

ImguiGeneratePowerLevelPivots._draw_summary = function (self, width)
	local pivots = self:_power_level_settings().pivots
	local pivot_keys = self:_sorted_pivot_keys(pivots)
	local level_column_width = 47
	local column_width = (width - 47) / #pivot_keys * 0.5

	Imgui.columns(1 + #pivot_keys * 2)
	Imgui.set_column_width(level_column_width)
	Imgui.text("Level")

	for i = 1, #pivot_keys do
		local pivot_key = pivot_keys[i]
		local pivot_data = pivots[pivot_key]
		local difficulty_settings = DifficultySettings[pivot_key]
		local name = difficulty_settings and difficulty_settings.display_name and Localize(difficulty_settings.display_name) or pivot_key

		Imgui.next_column()
		Imgui.set_column_width(column_width)
		Imgui.text(name .. " min")
		Imgui.next_column()
		Imgui.set_column_width(column_width)
		Imgui.text(name .. " max")
	end

	Imgui.separator()

	for level = 1, MAX_LEVEL do
		Imgui.next_column()
		Imgui.set_column_width(level_column_width)
		Imgui.text(level)

		for key_i = 1, #pivot_keys do
			local pivot_key = pivot_keys[key_i]
			local pivot_data = pivots[pivot_key]
			local colors = self:_graph_colors(pivot_key)
			local color_hi, color_low = colors.hi, colors.low
			local pl_low, pl_high = LootChestData.calculate_power_level(level, pivot_data)

			Imgui.push_style_color(Imgui.COLOR_TEXT, unpack(Colors.get_table_rgba(color_hi)))
			Imgui.next_column()
			Imgui.set_column_width(column_width)
			Imgui.text(math.round(pl_low))
			Imgui.push_style_color(Imgui.COLOR_TEXT, unpack(Colors.get_table_rgba(color_low)))
			Imgui.next_column()
			Imgui.set_column_width(column_width)
			Imgui.text(math.round(pl_high))
			Imgui.pop_style_color(2)
		end

		Imgui.separator()

		if level % 5 == 0 and level ~= MAX_LEVEL then
			Imgui.separator()
		end
	end
end

ImguiGeneratePowerLevelPivots._sorted_pivot_keys = function (self, pivots)
	local keys = table.keys(pivots)

	table.sort(keys, function (a, b)
		if self._display_order[a] then
			return self._display_order[a] < (self._display_order[b] or math.huge)
		elseif self._display_order[b] then
			return false
		end

		return a < b
	end)

	return keys
end

ImguiGeneratePowerLevelPivots._graph_colors = function (self, key)
	self._colors[key] = self._colors[key] or {
		hi = self._fallback_color,
		low = self._fallback_color,
	}

	local parsed = {
		hi = Colors.color_definitions[self._colors[key].hi] and self._colors[key].hi or self._fallback_color,
		low = Colors.color_definitions[self._colors[key].low] and self._colors[key].low or self._fallback_color,
	}

	return parsed
end

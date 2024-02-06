-- chunkname: @scripts/imgui/imgui_behavior_tree.lua

ImguiBehaviorTree = class(ImguiBehaviorTree)

ImguiBehaviorTree.init = function (self, world, ...)
	self._window_width = 1800
	self._window_height = 1000
	self._padding = 38
	self._show_graph_settings = false
	self._show_considerations = false
	self._left_panel_width = 600
	self._scrolling = {
		x = 0,
		y = 0,
	}
	self._node_size = {
		height = 0,
		width = 150,
	}
	self._grid_size = 64
	self._offset = {
		x = 0,
		y = 0,
	}
	self._zoom = 1
	self._node_inner_padding = {
		x = 5,
		y = 5,
	}
	self._node_font_size = 10
	self._node_text_distance = 10
	self._use_width_padding_zoom = true
	self._use_height_padding_zoom = true
	self._zoom_speed = 0.1
	self._original_font_size = Imgui.get_font_size()
	self._curve_in_offset = {
		x = -50,
		y = 0,
	}
	self._curve_out_offset = {
		x = 50,
		y = 0,
	}
	self._running_blackboard = nil
	self._last_leaf_node_run = nil
	self._running_leaf_history = {}
	self._max_history_quantity = 5
	self._history_id = 1
	self._use_history_slider = false
	self._history_stack = {}
end

ImguiBehaviorTree._update_leaf_history = function (self, running_node_name)
	self._running_leaf_history[#self._running_leaf_history + 1] = running_node_name

	if #self._running_leaf_history > self._max_history_quantity then
		local overflow_quantity = #self._running_leaf_history - self._max_history_quantity

		for i = 1, overflow_quantity do
			table.remove(self._running_leaf_history, i)
		end
	end
end

ImguiBehaviorTree._calculate_rect_box = function (self, txt_1, txt_2, txt_3)
	local txt_1_width, txt_1_height = Imgui.calculate_text_size(txt_1)
	local txt_2_width, txt_2_height = Imgui.calculate_text_size(txt_2)
	local txt_3_width, txt_3_height = Imgui.calculate_text_size(txt_3)
	local max_width = math.max(txt_1_width, txt_2_width, txt_3_width)
	local max_height = txt_1_height + txt_2_height + txt_3_height

	return max_width, max_height
end

ImguiBehaviorTree._draw_node = function (self, x, y, node, link_out)
	local node_name = node._identifier
	local class_name = node.name
	local enter_condition = node._condition_name
	local node_class_text_color = Color(500, 255, 255, 255)
	local node_name_text_color = Color(255, 0, 0, 0)
	local node_condition_text_color = Color(255, 0, 0, 200)
	local node_color = Color(255, 100, 100, 100)
	local node_outline_color = Color(255, 255, 255, 255)
	local line_color = Color(255, 255, 255, 255)
	local running_node_color = Color(255, 240, 130, 10)
	local node_outline_thickness = 1
	local line_thickness = 1

	if #self._history_stack > 0 then
		if not self._use_history_slider then
			self._history_id = #self._history_stack
		end

		local current_history_selected = self._history_stack[self._history_id]

		if table.contains(current_history_selected.blackboard.running_nodes, node) then
			node_color = running_node_color
			line_color = running_node_color
			line_thickness = 4
		end
	end

	Imgui.set_window_font_scale(self._node_font_size / self._original_font_size * self._zoom)
	Imgui.channel_set_current(1)

	local box_width, box_height = self:_calculate_rect_box(class_name, node_name, enter_condition)
	local text_padding = self._node_text_distance * self._zoom
	local txt_start_box_x = self._offset.x + x
	local txt_start_box_y = self._offset.y + y
	local txt_end_box_x = txt_start_box_x + box_width
	local txt_end_box_y = txt_start_box_y + box_height

	Imgui.add_text(class_name, txt_start_box_x, txt_start_box_y, node_class_text_color, self._node_font_size * self._zoom)
	Imgui.add_text(node_name, txt_start_box_x, txt_start_box_y + text_padding, node_name_text_color, self._node_font_size * self._zoom)
	Imgui.add_text(enter_condition, txt_start_box_x, txt_start_box_y + text_padding + text_padding, node_condition_text_color, self._node_font_size * self._zoom)

	local rect_start_box_x = txt_start_box_x - self._node_inner_padding.x
	local rect_start_box_y = txt_start_box_y - self._node_inner_padding.y
	local rect_end_box_x = txt_end_box_x + self._node_inner_padding.x
	local rect_end_box_y = txt_end_box_y + self._node_inner_padding.y

	Imgui.channel_set_current(0)
	Imgui.add_rect_filled(rect_start_box_x, rect_start_box_y, rect_end_box_x, rect_end_box_y, node_color, 5)
	Imgui.add_rect(rect_start_box_x, rect_start_box_y, rect_end_box_x, rect_end_box_y, node_outline_color, 5, node_outline_thickness)
	Imgui.channel_set_current(1)

	local link_in_x = rect_start_box_x
	local link_in_y = rect_start_box_y + (rect_end_box_y - rect_start_box_y) / 2

	if link_out ~= nil then
		Imgui.add_bezier_curve(link_out.x, link_out.y, link_in_x, link_in_y, self._curve_out_offset.x, self._curve_out_offset.y, self._curve_in_offset.x, self._curve_in_offset.y, line_color, line_thickness)
	end

	local next_link_out = {
		x = 0,
		y = 0,
	}

	next_link_out.x = txt_start_box_x + (rect_end_box_x - txt_start_box_x)
	next_link_out.y = rect_start_box_y + (rect_end_box_y - rect_start_box_y) / 2

	return rect_end_box_x - txt_start_box_x, next_link_out
end

ImguiBehaviorTree._draw_nodes = function (self, node, x, y, link_out)
	local node_width, link_out = self:_draw_node(x, y, node, link_out)
	local children_counter = 0

	if node._children then
		local padding = self._padding
		local use_width_padding_zoom = self._use_width_padding_zoom
		local zoom = self._zoom
		local width_padding_modifier = use_width_padding_zoom and zoom or 1
		local height_padding_modifier = use_width_padding_zoom and zoom or 1

		x = x + node_width + padding * width_padding_modifier

		for _, child in pairs(node._children) do
			y = self:_draw_nodes(child, x, y, link_out)
			children_counter = children_counter + 1

			if children_counter < table.size(node._children) then
				y = y + padding * height_padding_modifier
			end
		end
	end

	return y
end

ImguiBehaviorTree._get_blackboard_value_type = function (self, key, entry, out)
	for k, v in pairs(entry) do
		if k == key then
			out = entry[key]

			return out
		end

		if type(v) == "table" then
			out = self:_get_blackboard_value_type(key, v, out)

			if out ~= nil then
				return out
			end
		end
	end

	return out
end

ImguiBehaviorTree._draw_blackboard_element = function (self, key, value)
	local value_type = type(value)

	Imgui.indent(10)

	if value_type == "Vector3Box" then
		local vec = value:unbox()

		Imgui.text(tostring(key) .. ": " .. "X:" .. tostring(vec.x) .. " Y:" .. tostring(vec.y) .. " Z:" .. tostring(vec.z))
	elseif type(value) == "boolean" then
		Imgui.text(tostring(key) .. ": " .. tostring(value))
	elseif type(value) == "string" then
		Imgui.text(tostring(key) .. ": " .. tostring(value))
	elseif value_type == "number" then
		Imgui.text(tostring(key) .. ": " .. tostring(value))
	elseif value_type == "float" then
		Imgui.text(tostring(key) .. ": " .. tostring(value))
	elseif value_type == "Unit" then
		Imgui.text(key .. ": " .. tostring(value))
	end

	Imgui.unindent(10)
end

ImguiBehaviorTree._draw_blackboard_value = function (self, data)
	for key, value in pairs(data) do
		if key ~= "running_nodes" then
			local value_type = type(value)

			if value_type == "table" then
				Imgui.text_colored(key, 255, 153, 102, 255)

				for key, value in pairs(value) do
					self:_draw_blackboard_element(key, value)
				end
			else
				self:_draw_blackboard_element(key, value)
			end
		end
	end
end

ImguiBehaviorTree._save_history = function (self, brain, running_node_name)
	local leaf

	for _, value in pairs(brain._blackboard.running_nodes) do
		if value._identifier == running_node_name then
			leaf = value
		end
	end

	if leaf == nil then
		return
	end

	self._last_leaf_node_run = running_node_name

	local i = 1
	local node_iterator = leaf
	local running_hierarchy = {}

	if node_iterator ~= nil then
		while node_iterator do
			running_hierarchy[i] = node_iterator
			i = i + 1
			node_iterator = node_iterator._parent
		end
	end

	local blackboard_copy = {}

	for key, value in pairs(brain._blackboard) do
		blackboard_copy[key] = value

		if type(value) == "table" then
			for sub_key, sub_value in pairs(value) do
				if type(sub_value) ~= "table" then
					value[sub_key] = sub_value
				end
			end
		end
	end

	blackboard_copy.running_nodes = running_hierarchy

	local new_history_entry = {
		blackboard = blackboard_copy,
	}

	self._history_stack[#self._history_stack + 1] = new_history_entry
end

ImguiBehaviorTree.update = function (self)
	return
end

ImguiBehaviorTree.draw = function (self)
	local do_close = Imgui.begin_window("Behavior Tree")

	Imgui.set_window_size(self._window_width, self._window_height, "once")

	self._show_considerations = Imgui.checkbox("Show considerations", self._show_considerations)

	Imgui.same_line(10)

	self._use_history_slider = Imgui.checkbox("Use History Slider", self._use_history_slider)

	Imgui.same_line(10)

	self._history_id = Imgui.slider_int("", self._history_id, 1, table.size(self._history_stack))

	Imgui.begin_child_window("Settings", self._left_panel_width, 0, true)

	self._show_graph_settings = Imgui.checkbox("Show Graph Settings", self._show_graph_settings)

	if self._show_graph_settings then
		Imgui.text_colored("Graph Settings:", 255, 51, 204, 255)

		self._left_panel_width = Imgui.input_int("Panel width", self._left_panel_width)
		self._zoom = Imgui.input_float("Zoom", self._zoom)
		self._zoom_speed = Imgui.input_float("Zoom speed", self._zoom_speed)
		self._padding = Imgui.input_int("Node padding", self._padding)
		self._use_width_padding_zoom = Imgui.checkbox("Use width padding zoom", self._use_width_padding_zoom)
		self._use_height_padding_zoom = Imgui.checkbox("Use height padding zoom", self._use_height_padding_zoom)
		self._max_history_quantity = Imgui.input_int("#Max history", self._max_history_quantity)
		self._node_size.height = Imgui.input_int("Node Height", self._node_size.height)
		self._node_font_size = Imgui.input_int("Node font size", self._node_font_size)
		self._node_text_distance = Imgui.input_int("Node text distance", self._node_text_distance)
		self._node_inner_padding.x, self._node_inner_padding.y = Imgui.input_int_2("Inner Padding", self._node_inner_padding.x, self._node_inner_padding.y)
	end

	Imgui.text_colored("---------------------------------------------------------------------------------------", 255, 51, 204, 255)
	Imgui.text_colored("History leaf nodes:", 255, 51, 204, 255)
	Imgui.indent(10)

	local running_leaf_history = self._running_leaf_history

	for i = 1, self._max_history_quantity do
		local item = running_leaf_history[i]

		if item == nil then
			item = ""
		end

		Imgui.text_colored(item, 250, 250, 250, 250)
	end

	Imgui.unindent(10)
	Imgui.text_colored("---------------------------------------------------------------------------------------", 255, 51, 204, 255)
	Imgui.text_colored("Blackboard:", 255, 51, 204, 255)

	if #self._history_stack > 0 then
		if not self._use_history_slider then
			self._history_id = #self._history_stack
		end

		local current_history_selected = self._history_stack[self._history_id]

		if current_history_selected ~= nil then
			self:_draw_blackboard_value(current_history_selected.blackboard)
		end
	end

	Imgui.end_child_window()
	Imgui.same_line(10)
	Imgui.begin_child_window("Graph", 0, 0, true, "no_scroll_bar")
	Imgui.channel_split(2)

	local window_pos_x, window_pos_y = Imgui.get_cursor_screen_pos()
	local window_width, window_height = Imgui.get_window_size()

	self._offset.x = window_pos_x + self._scrolling.x
	self._offset.y = window_pos_y + self._scrolling.y

	local temp_x_grid = math.fmod(self._scrolling.x, self._grid_size * self._zoom)
	local temp_y_grid = math.fmod(self._scrolling.y, self._grid_size * self._zoom)
	local grid_color = Color(255, 100, 100, 100)

	while temp_x_grid < window_width do
		local x_start = temp_x_grid + window_pos_x
		local y_start = window_pos_y
		local x_end = temp_x_grid + window_pos_x
		local y_end = window_height + window_pos_y

		Imgui.add_line(x_start, y_start, x_end, y_end, grid_color, 1)

		temp_x_grid = temp_x_grid + self._grid_size * self._zoom
	end

	while temp_y_grid < window_height do
		local x_start = window_pos_x
		local y_start = window_pos_y + temp_y_grid
		local x_end = window_width + window_pos_x
		local y_end = window_pos_y + temp_y_grid

		Imgui.add_line(x_start, y_start, x_end, y_end, grid_color, 1)

		temp_y_grid = temp_y_grid + self._grid_size * self._zoom
	end

	local behavior_extension = ScriptUnit.has_extension(script_data.debug_unit, "ai_system")

	if behavior_extension then
		local brain = behavior_extension:brain()
		local behavior_tree = brain:bt()
		local root_node = behavior_tree:root()
		local blackboard = brain._blackboard

		if self._running_blackboard ~= blackboard then
			self._running_blackboard = blackboard

			table.clear(self._running_leaf_history)
			table.clear(self._history_stack)

			self._last_leaf_node_run = nil
			self._use_history_slider = false
		end

		local running_node_name = brain._leaf_node and brain._leaf_node._identifier or blackboard.btnode_name

		if running_node_name ~= nil and running_node_name ~= self._last_leaf_node_run then
			self:_save_history(brain, running_node_name)
			self:_update_leaf_history(running_node_name)
		end

		self:_draw_nodes(root_node, 0, 0)
	end

	if Imgui.is_window_hovered() and Imgui.is_mouse_dragging(2, 0) then
		local delta_x, delta_y = Imgui.get_mouse_delta()

		self._scrolling.x = self._scrolling.x + delta_x
		self._scrolling.y = self._scrolling.y + delta_y
	end

	local mouse_wheel = Imgui.get_mouse_wheel_value()

	if Imgui.is_window_hovered() and mouse_wheel ~= 0 then
		self._zoom = self._zoom * (1 + mouse_wheel * self._zoom_speed)
		self._zoom = math.clamp(self._zoom, 0.3, 10)
	end

	Imgui.channels_merge()
	Imgui.end_child_window()
	Imgui.same_line(10)
	Imgui.end_window()

	if self._show_considerations then
		Imgui.begin_window("Considerations")

		if behavior_extension then
			local brain = behavior_extension:brain()
			local behavior_tree = brain:bt()
			local action_data = behavior_tree:action_data()
			local blackboard = brain._blackboard

			self:_draw_action_data(action_data, blackboard)
		end

		Imgui.end_window()
	end

	return do_close
end

ImguiBehaviorTree._draw_graph = function (self, consideration_key, consideration_val, blackboard, action_data)
	local node_color = Color(180, 100, 100, 100)
	local outline_color = Color(255, 255, 255, 255)
	local axis_color = Color(255, 255, 255, 255)
	local line_color = Color(255, 255, 255, 255)
	local val_line_color = Color(255, 255, 0, 0)
	local margin_x, margin_y = 10, 10
	local size_x, size_y = 300, 150
	local axis_margin_x, axis_margin_y = 50, 20
	local axis_offset_x, axis_offset_y = -20, 0
	local line_thickness = 1
	local axis_thickness = 2
	local axis_oversize = 10
	local spline = consideration_val.spline
	local value_key = consideration_val.blackboard_input

	Imgui.text(value_key)
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

	local max_value = consideration_val.max_value
	local max_val_text = string.format("%.2f", max_value)
	local txt_width, text_height = Imgui.calculate_text_size(max_val_text)

	Imgui.add_text(max_val_text, axis_end_x + axis_thickness, axis_end_y - text_height, axis_color)
	Imgui.channel_set_current(1)

	local blackboard_value = action_data[value_key] or blackboard[value_key] or 0
	local blackboard_norm_value = math.clamp(blackboard_value / max_value, 0, 1)
	local blackboard_value_y = 0
	local line_start_x = axis_start_x + spline[1] * axis_size_x
	local line_start_y = axis_start_y + axis_size_y - spline[2] * axis_size_y

	for i = 3, #spline, 2 do
		local line_end_x = axis_start_x + spline[i] * axis_size_x
		local line_end_y = axis_start_y + axis_size_y - spline[i + 1] * axis_size_y

		Imgui.add_line(line_start_x, line_start_y, line_end_x, line_end_y, line_color, line_thickness)

		if blackboard_norm_value >= spline[i - 2] and blackboard_norm_value <= spline[i] then
			local spline_x_t = (blackboard_norm_value - spline[i - 2]) / (spline[i] - spline[i - 2])

			blackboard_value_y = spline[i - 1] + (spline[i + 1] - spline[i - 1]) * spline_x_t
		end

		line_start_x = line_end_x
		line_start_y = line_end_y
	end

	if blackboard_value then
		local current_val_x = axis_start_x + blackboard_norm_value * axis_size_x

		Imgui.add_line(current_val_x, axis_start_y, current_val_x, axis_end_y + axis_oversize, val_line_color, axis_thickness)

		local val_text = string.format("%.2f", blackboard_value)

		Imgui.add_text(val_text, current_val_x + axis_thickness, axis_end_y, val_line_color)

		local norm_text = string.format("%.2f", blackboard_value_y)

		Imgui.add_text(norm_text, current_val_x + axis_thickness, axis_start_y, val_line_color)
	end

	Imgui.channels_merge()
	Imgui.dummy(size_x, size_y)
end

ImguiBehaviorTree._draw_action_data = function (self, action_data, blackboard)
	if not action_data then
		return
	end

	local condition_pass = Color(255, 0, 255, 0)
	local condition_fail = Color(255, 255, 0, 0)

	for key, val in pairs(action_data) do
		local consideration = val.considerations

		if consideration and Imgui.tree_node(key) then
			for consideration_key, consideration_val in pairs(consideration) do
				if consideration_val.spline then
					self:_draw_graph(consideration_key, consideration_val, blackboard, action_data)
				elseif consideration_val.is_condition then
					local input_key = consideration_val.blackboard_input
					local blackboard_value = action_data[input_key] or blackboard[input_key]
					local is_inverted = consideration.invert

					if is_inverted then
						blackboard_value = not blackboard_value
					end

					local result = blackboard_value and "true" or "false"

					Imgui.text(consideration_key)

					if consideration_key ~= input_key then
						Imgui.same_line()
						Imgui.text("(")
						Imgui.text(input_key)
						Imgui.text(")")
					end

					Imgui.same_line()

					if blackboard_value then
						Imgui.text_colored("true", 0, 255, 0, 255)
					else
						Imgui.text_colored("false", 255, 0, 0, 255)
					end
				end

				Imgui.separator()
			end

			Imgui.tree_pop()
			Imgui.separator()
		end
	end
end

ImguiBehaviorTree.is_persistent = function (self)
	return true
end

return ImguiBehaviorTree

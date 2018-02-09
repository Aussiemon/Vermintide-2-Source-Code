local serialize = require("scripts/utils/serialize")
local font_size = 26
local font = "gw_arial_32"
local font_mtrl = "materials/fonts/" .. font
local tiny_font_size = 16
local tiny_font = "gw_arial_16"
local tiny_font_mtrl = "materials/fonts/" .. tiny_font
local status = {}
local resx, resy = Application.resolution()
local spline_window_size = {
	x = 300,
	y = 300
}
local pixels_between_windows = 30
local row_height = 30
local half_row_height = row_height*0.5
local cons_lookup = {}
local window_list = {}
local action_list = false
local action_list_layout = false
local drag_point_list = {}
local tool_pos = {
	x = 250,
	y = resy - spline_window_size.y - 200
}
local windows_x = 3
local windows_y = 2
local k = 1

for j = 0, windows_y - 1, 1 do
	for i = 0, windows_x - 1, 1 do
		local xpos = tool_pos.x + spline_window_size.x*i + i*pixels_between_windows
		local ypos = tool_pos.y - (spline_window_size.y*j + pixels_between_windows*j)
		window_list[k] = {
			x = xpos,
			y = ypos
		}
		drag_point_list[k] = {
			value = 0,
			index = k,
			x = (xpos + spline_window_size.x) - half_row_height/2,
			y = ypos - row_height/2
		}
		k = k + 1
	end
end

action_list = {}
local action_list_height = row_height

for action_name, data in pairs(UtilityConsiderations) do
	action_list[#action_list + 1] = action_name
	action_list_height = action_list_height + row_height
end

action_list_layout = {
	size_x = 200,
	x = 30,
	y = resy - action_list_height
}
considerations = considerations or false

local function pick_action(action_name)
	if not UtilityConsiderations[action_name] then
		print("No utility action named:", action_name)

		return 
	end

	cons_lookup = {}

	for name, data in pairs(UtilityConsiderations[action_name]) do
		if name ~= "name" then
			cons_lookup[#cons_lookup + 1] = name
		end
	end

	local num_condiditons = #cons_lookup

	fassert(num_condiditons <= 6, "only support for 6 edit windows, %s have %d conditions -> poke jocke w and tell him to fix this", action_name, num_condiditons)

	considerations = UtilityConsiderations[action_name]

	return 
end

if not considerations then
	local index = #action_list

	pick_action(action_list[index])

	status.selected_action = index
end

EditAiUtility = class(EditAiUtility)
EditAiUtility.init = function (self, world)
	self.world = world
	self.world_gui = World.create_world_gui(world, Matrix4x4.identity(), 1, 1, "immediate", "material", "materials/fonts/gw_fonts")
	self.screen_gui = World.create_screen_gui(self.world, "material", "materials/fonts/gw_fonts", "immediate")

	return 
end
EditAiUtility.activate = function (self)
	ShowCursorStack.push()

	return 
end
EditAiUtility.deactivate = function (self)
	ShowCursorStack.pop()

	return 
end
EditAiUtility.use_breed = function (self, breed)
	return 
end
EditAiUtility.update = function (self, unit, t, dt, input_service, blackboard)
	local mouse_pos = input_service.get(input_service, "cursor")
	status.left_pressed = input_service.get(input_service, "mouse_left_held")

	if not status.selected_drag_point then
		status.hover_win_name, status.win_pos = self.hover_win(self, t, mouse_pos, window_list, spline_window_size)
		local spline = status.hover_win_name and considerations[status.hover_win_name].spline
		local spline_id = nil

		if spline and spline == status.last_hover_spline then
			local spline_window_pos = status.win_pos
			status.hover_point = self.hover_spline_point(self, t, spline, spline_window_pos, spline_window_size, mouse_pos)

			if status.hover_point and status.left_pressed and not status.selected_point then
				status.selected_point = status.hover_point
				status.last_selected_point = status.hover_point
			elseif status.selected_point and not status.left_pressed then
				status.selected_point = nil
			end

			if status.selected_point then
				self.move_spline_point(self, t, spline, spline_window_pos, spline_window_size, status.selected_point, mouse_pos)
				self.draw_mouse_selection(self, t, spline, spline_window_pos, spline_window_size, status.selected_point, "selected", considerations[status.hover_win_name].max_value)
			elseif status.hover_point then
				self.draw_mouse_selection(self, t, spline, spline_window_pos, spline_window_size, status.hover_point, "hover", considerations[status.hover_win_name].max_value)
			end

			if status.hover_point and DebugKeyHandler.key_pressed("d", "remove selected point", "ai editor", "left ctrl") then
				self.remove_spline_point(self, spline, status.hover_point)

				status.last_selected_point = nil
				status.hover_point = nil

				return 
			end
		else
			status.selected_point = nil
			status.last_selected_point = nil
		end

		status.last_hover_spline = spline

		if not status.hover_point and status.hover_win_name and DebugKeyHandler.key_pressed("a", "insert spline point", "ai editor", "left ctrl") then
			self.insert_spline_point(self, spline, status.win_pos, spline_window_size, mouse_pos)
		end
	end

	status.hover_drag_point = self.hover_drag_points(self, t, drag_point_list, mouse_pos)

	if status.hover_drag_point and status.left_pressed and not status.selected_drag_point then
		status.selected_drag_point = status.hover_drag_point
	elseif status.selected_drag_point then
		local point = status.selected_drag_point
		local safe_drag_lane = 16

		self.draw_safe_drag_lane(self, point, safe_drag_lane)

		local con = considerations[cons_lookup[point.index]]

		if status.left_pressed then
			local original_max_value = con.max_value
			local xd, yd = EditAiUtility:drag_point_distance(t, point, mouse_pos)

			if math.abs(yd) < safe_drag_lane and 0 < math.abs(xd) then
				local value = nil

				if 0 < xd then
					value = math.pow(xd, 1.2)*0.01 + original_max_value
				else
					value = math.pow(-xd, 1.2)*-0.01 + original_max_value
				end

				value = math.floor(value*10)/10
				status.selected_drag_point.max_value = (0 <= value and value) or 0
			else
				status.selected_drag_point.max_value = nil
			end
		else
			local xd, yd = EditAiUtility:drag_point_distance(t, point, mouse_pos)

			if math.abs(yd) < safe_drag_lane and point.max_value then
				con.max_value = point.max_value
			end

			status.selected_drag_point = nil
		end
	end

	local k = 1
	local win_size = Vector2(spline_window_size.x, spline_window_size.y)
	local gui = self.screen_gui
	local utility_sum = 0
	local debug_considerations = considerations

	for name, data in pairs(considerations) do
		if type(data) == "table" and not data.is_condition then
			local pos = Vector2(window_list[k].x, window_list[k].y)
			local bk_color = (name == status.hover_win_name and Color(192, 28, 128, 44)) or Color(92, 28, 128, 44)
			local fade_factor = 1

			if status.selected_drag_point then
				local temp_max_value = status.selected_drag_point.max_value

				if status.selected_drag_point.index == k then
					EditAiUtility.draw_utility_spline(gui, t, data, temp_max_value, name, pos, win_size, bk_color, 1)
					EditAiUtility.draw_utility_info(gui, data, temp_max_value, name, pos, win_size, fade_factor)
				else
					EditAiUtility.draw_utility_spline(gui, t, data, nil, name, pos, win_size, bk_color, 0.25)
					EditAiUtility.draw_utility_info(gui, data, temp_max_value, name, pos, win_size, fade_factor)
				end
			else
				EditAiUtility.draw_utility_spline(gui, t, data, nil, name, pos, win_size, bk_color, 1)
				EditAiUtility.draw_utility_info(gui, data, nil, name, pos, win_size, fade_factor)
			end

			self.draw_utility_ruler(self, gui, data, pos, win_size, 1)

			if blackboard then
				local action = status.selected_action and action_list[status.selected_action]
				utility_sum = utility_sum + EditAiUtility.draw_realtime_utility(gui, action, data, pos, win_size, blackboard)
				local breed = blackboard.breed
				local breed_name = breed.name
				local breed_actions = BreedActions[breed_name]

				for i, breed_action in pairs(breed_actions) do
					local unit_considerations = breed_action.considerations

					if not unit_considerations then
					else
						local consideration_name = unit_considerations.name

						if consideration_name ~= action then
						else
							for unit_data_name, unit_data in pairs(unit_considerations) do
								local data_name = data.name

								if unit_data_name == data_name then
									unit_data.spline = table.clone(data.spline)
									unit_data.max_value = data.max_value
								end
							end
						end
					end
				end
			end
		end

		k = k + 1
	end

	if blackboard then
		slot12 = Vector2(window_list[1].x, window_list[1].y)
	end

	if DebugKeyHandler.key_pressed("s", "save to disk", "ai editor", "left ctrl") then
		self.save_considerations(self)
	end

	status.hover_action_window, status.hover_action = self.hover_action(self, t, action_list_layout, action_list, mouse_pos)

	if status.hover_action_window and status.left_pressed and status.hover_action then
		status.selected_action = status.hover_action

		pick_action(action_list[status.selected_action], status.selected_action)
	end

	local bk_color = (status.hover_action_window and Color(164, 28, 44, 100)) or Color(92, 28, 44, 100)

	self.draw_action_list(self, unit, t, "Actions", action_list_layout, action_list, bk_color, status.selected_action, blackboard)

	return 
end
EditAiUtility.insert_spline_point = function (self, spline, win_pos, win_size, mouse_pos)
	local x = (mouse_pos.x - win_pos.x)/win_size.x
	local y = (mouse_pos.y - win_pos.y)/win_size.y
	local insert_index = nil

	for i = 1, #spline, 2 do
		if x < spline[i] then
			insert_index = i

			break
		end
	end

	if insert_index then
		for i = #spline, insert_index, -1 do
			spline[i + 2] = spline[i]
		end

		spline[insert_index] = x
		spline[insert_index + 1] = y
	end

	return 
end
EditAiUtility.remove_spline_point = function (self, spline, point_index)
	local first_point_index = 1
	local last_point_index = #spline - 1

	if point_index == first_point_index or point_index == last_point_index then
		return 
	end

	for i = point_index, #spline - 2, 1 do
		spline[i] = spline[i + 2]
	end

	spline[#spline] = nil
	spline[#spline] = nil

	return 
end
EditAiUtility.hover_win = function (self, t, mouse_pos, window_list, win_size)
	local x = mouse_pos.x
	local y = mouse_pos.y
	local k = 1
	local border = 10

	for k = 1, #cons_lookup, 1 do
		if window_list[k].x - border <= x and x <= window_list[k].x + win_size.x + border and window_list[k].y - border <= y and y <= window_list[k].y + win_size.y + border then
			return cons_lookup[k], window_list[k]
		end

		k = k + 1
	end

	return 
end
EditAiUtility.move_spline_point = function (self, t, spline, win_pos, win_size, point_index, new_pos)
	local first_point_index = 1
	local last_point_index = #spline - 1
	local x = (new_pos.x - win_pos.x)/win_size.x
	local y = (new_pos.y - win_pos.y)/win_size.y

	if first_point_index < point_index and point_index < last_point_index and spline[point_index - 2] < x and x < spline[point_index + 2] then
		spline[point_index] = x
	end

	if 0 <= y and y <= 1 then
		spline[point_index + 1] = y
	end

	return 
end
local hover_dist = 20
EditAiUtility.hover_spline_point = function (self, t, spline, win_pos, win_size, mouse_pos)
	local gui = self.screen_gui
	local resx, resy = Application.resolution()
	local w = win_size.x
	local h = win_size.y

	for i = 1, #spline, 2 do
		local x1 = win_pos.x + w*spline[i]
		local y1 = win_pos.y + h*spline[i + 1]

		if math.abs(x1 - mouse_pos.x) < hover_dist and math.abs(y1 - mouse_pos.y) < hover_dist then
			return i, x1, y1
		end
	end

	return 
end
EditAiUtility.drag_point_distance = function (self, t, point, mouse_pos)
	local x = mouse_pos.x
	local y = mouse_pos.y
	local safe_zone = 10
	local x_dist = x - point.x

	if math.abs(x_dist) < safe_zone then
		x_dist = 0
	else
		x_dist = x_dist - ((0 < x_dist and safe_zone) or -safe_zone)
	end

	local y_dist = y - point.y

	if math.abs(y_dist) < safe_zone then
		y_dist = 0
	else
		y_dist = y_dist - ((0 < y_dist and safe_zone) or -safe_zone)
	end

	return x_dist, y_dist
end
EditAiUtility.hover_drag_points = function (self, t, point_list, mouse_pos)
	local gui = self.screen_gui
	local x = mouse_pos.x
	local y = mouse_pos.y
	local size = 15

	for i = 1, #point_list, 1 do
		local point = point_list[i]

		if point.x - size < x and x < point.x + size and point.y - size < y and y < point.y + size then
			EditAiUtility.draw_square(gui, t, Vector2(point.x, point.y), half_row_height, Color(255, 255, 255, 255), 3)

			return point
		end
	end

	return 
end
EditAiUtility.draw_mouse_selection = function (self, t, spline, win_pos, win_size, point_index, selected, max_value)
	local gui = self.screen_gui
	local resx, resy = Application.resolution()
	local w = win_size.x
	local h = win_size.y
	local color = Color(128, 45, 45, 196)
	local i = point_index
	local x1 = win_pos.x + w*spline[i]
	local y1 = win_pos.y + h*spline[i + 1]
	local width = (selected == "selected" and 20) or 30
	local thickness = (selected == "last_selected" and 2) or 5
	local point_pos = Vector2(x1, y1)

	EditAiUtility.draw_square(gui, t, point_pos, width, color, thickness)

	local pos_text = string.format("x:%.2f / %.2f y:%.2f ", spline[i], max_value*spline[i], spline[i + 1])
	local pos_text = string.format("x:%.2f (%.2f, %.2f) ", max_value*spline[i], spline[i], spline[i + 1])
	local pos = Vector3(x1 + 20, y1, 30)

	ScriptGUI.text(gui, pos_text, font_mtrl, 32, font, pos, Color(255, 0, 0, 0))

	return 
end
EditAiUtility.draw_square = function (gui, t, pos, width, color, thickness)
	thickness = thickness or 5
	width = width*0.5
	local x1 = pos.x - width
	local y1 = pos.y - width
	local x2 = pos.x + width
	local y2 = pos.y + width

	ScriptGUI.hud_line(gui, Vector2(x1, y1), Vector2(x2, y1), nil, thickness, color)
	ScriptGUI.hud_line(gui, Vector2(x2, y1), Vector2(x2, y2), nil, thickness, color)
	ScriptGUI.hud_line(gui, Vector2(x2, y2), Vector2(x1, y2), nil, thickness, color)
	ScriptGUI.hud_line(gui, Vector2(x1, y2), Vector2(x1, y1), nil, thickness, color)

	return 
end
EditAiUtility.hover_action = function (self, t, layout, action_list, mouse_pos)
	local height = #action_list*row_height
	local x = mouse_pos.x
	local y = mouse_pos.y
	local inside_window = layout.x <= x and x <= layout.x + layout.size_x and layout.y <= y and y <= layout.y + height

	for i = 1, #action_list, 1 do
		local pos = Vector3(layout.x + 10, layout.y + (i - 0.7)*row_height, 0)

		if math.abs(pos.y - mouse_pos.y) < half_row_height then
			return inside_window, i, action_list[i]
		end
	end

	return inside_window
end
EditAiUtility.draw_action_list = function (self, unit, t, name, layout, action_list, bk_color, selected_action, blackboard)
	local gui = self.screen_gui
	local resx, resy = Application.resolution()
	local color = nil
	local utility = 0

	for i = 1, #action_list, 1 do
		local text = action_list[i]
		local pos = Vector3(layout.x + 30, layout.y + (i - 0.7)*row_height, 100)
		local active_ai = blackboard and blackboard.utility_actions[text]

		if selected_action == i then
			EditAiUtility.draw_square(gui, t, pos + Vector3(-15, 6, 0), half_row_height, color, 3)

			color = (active_ai and Color(255, 240, 200, 10)) or Color(255, 255, 255, 255)
		else
			color = (active_ai and Color(128, 240, 200, 10)) or Color(128, 255, 255, 255)
		end

		ScriptGUI.text(gui, text, font_mtrl, font_size, font, pos, color)

		if active_ai then
			local ai_extension = ScriptUnit.extension(unit, "ai_system")
			local action_data = ai_extension.brain(ai_extension):bt():action_data()
			local breed_action = action_data[text]
			utility = math.floor(Utility.get_action_utility(breed_action, text, blackboard, t)*10)/10

			ScriptGUI.text(gui, utility, font_mtrl, font_size, font, pos + Vector3(-40, 0, 0), color)
		end
	end

	local height = #action_list*row_height

	Gui.rect(gui, Vector2(layout.x, layout.y), Vector2(layout.size_x, height), bk_color)

	return 
end
EditAiUtility.draw_safe_drag_lane = function (self, point, safe_distance)
	local x1 = point.x - 400
	local x2 = point.x + 400
	local y1 = point.y - safe_distance
	local y2 = point.y + safe_distance

	ScriptGUI.hud_line(self.screen_gui, Vector2(x1, y1), Vector2(x2, y1), 40, 3, Color(255, 240, 200, 10))
	ScriptGUI.hud_line(self.screen_gui, Vector2(x1, y2), Vector2(x2, y2), 40, 3, Color(255, 240, 200, 10))

	return 
end
EditAiUtility.draw_realtime_utility = function (gui, action_name, consideration, pos, win_size, blackboard)
	local blackboard_action_data = blackboard.utility_actions[action_name]

	if blackboard_action_data then
		local blackboard_value = blackboard_action_data[consideration.blackboard_input] or blackboard[consideration.blackboard_input]
		local norm_value = math.clamp(blackboard_value/consideration.max_value, 0, 1)
		local x = pos.x + win_size.x*norm_value
		local y1 = pos.y
		local y2 = pos.y + win_size.y
		local yellow = Color(255, 240, 200, 10)

		ScriptGUI.hud_line(gui, Vector2(x, y1), Vector2(x, y2), pos.z, 1, yellow)

		local y = Utility.GetUtilityValueFromSpline(consideration.spline, norm_value)*win_size.y + y1

		EditAiUtility.draw_square(gui, 0, Vector3(x, y, pos.z + 1), 14, yellow, 4)

		local text = math.floor(norm_value*consideration.max_value*10)/10

		ScriptGUI.text(gui, text, tiny_font_mtrl, tiny_font_size, tiny_font, Vector3(x + 10, y, pos.z + 1), yellow)

		return y
	end

	return 0
end
EditAiUtility.draw_utility_sum = function (gui, name, pos, size)
	return 
end
EditAiUtility.draw_utility_ruler = function (self, gui, consideration_data, pos, size)
	local font_size = 12
	local num_divides = 10
	local ruler_pos = pos + Vector3(0, 0, 3)
	local stride = num_divides/1
	local pixel_stride = stride*size.x
	local x = ruler_pos.x
	local y = ruler_pos.y
	local text_width = consideration_data.max_value
	local min, max, caret = Gui.text_extents(gui, consideration_data.max_value, font_mtrl, tiny_font_size)
	local extents = Vector2(max.x - min.x, max.y - min.y)
	local text_x_align = -extents.x/2
	local text_y_align = extents.y/2 + 10

	for i = 0, num_divides, 1 do
		ScriptGUI.hud_line(gui, Vector2(x, y), Vector2(x, y + 10), nil, 1)

		local text = consideration_data.max_value*i/num_divides

		ScriptGUI.text(gui, text, tiny_font_mtrl, tiny_font_size, tiny_font, Vector3(x + text_x_align, y + text_y_align, 10), Color(255, 255, 255, 255))

		x = x + pixel_stride
	end

	return 
end
EditAiUtility.draw_utility_info = function (gui, consideration_data, temp_max_value, name, pos, size, fade_factor, tiny)
	local font_size = font_size
	local font = font
	local font_mtrl = font_mtrl

	if tiny then
		font_size = tiny_font_size
		font = tiny_font
		font_mtrl = tiny_font_mtrl
	end

	local scale_text = temp_max_value or consideration_data.max_value or ""
	local scale_min, scale_max, caret = Gui.text_extents(gui, scale_text, font_mtrl, font_size)
	local scale_extents = Vector2(scale_max.x - scale_min.x, scale_max.y - scale_min.y)
	local axis_y = -font_size
	local min, max, caret = Gui.text_extents(gui, name, font_mtrl, font_size)
	local offset_x = math.min(0, size.x - (max.x + scale_extents.x))
	local scale_text_pos = pos + ((tiny and Vector3(size.x - scale_max.x, axis_y, 10)) or Vector3(size.x - scale_max.x - half_row_height*1.5, axis_y, 10))

	if temp_max_value then
		local scale_text_pos2 = scale_text_pos + Vector3(2, -1, -1)

		ScriptGUI.text(gui, scale_text, font_mtrl, font_size, font, scale_text_pos2, temp_max_value and Color(255, 0, 0, 0))
	end

	ScriptGUI.text(gui, scale_text, font_mtrl, font_size, font, scale_text_pos, (temp_max_value and Color(fade_factor*255, 240, 200, 10)) or Color(fade_factor*255, 255, 255, 255))
	ScriptGUI.text(gui, name, font_mtrl, font_size, font, pos + Vector3(offset_x, axis_y, 10), Color(fade_factor*255, 255, 255, 255))

	return 
end
EditAiUtility.draw_utility_spline = function (gui, t, consideration_data, temp_max_value, name, pos, size, bk_color, fade_factor, thickness)
	local spline = consideration_data.spline
	local resx, resy = Application.resolution()
	local w = size.x
	local h = size.y
	local line_color = Color(fade_factor*255, 255, 255, 255)
	thickness = thickness or 5

	for i = 1, #spline - 2, 2 do
		local x1 = pos.x + w*spline[i]
		local y1 = pos.y + h*spline[i + 1]
		local x2 = pos.x + w*spline[i + 2]
		local y2 = pos.y + h*spline[i + 3]

		ScriptGUI.hud_line(gui, Vector2(x1, y1), Vector2(x2, y2), nil, thickness, line_color)
	end

	Gui.rect(gui, pos, size, bk_color)

	return 
end
EditAiUtility.draw_utility_condition = function (gui, action_name, consideration, pos, win_size, blackboard, bk_color)
	local blackboard_action_data = blackboard.utility_actions[action_name]

	if blackboard_action_data then
		local blackboard_value = blackboard_action_data[consideration.blackboard_input] or blackboard[consideration.blackboard_input]
		local is_inverted = consideration.invert

		if is_inverted then
			blackboard_value = not blackboard_value
		end

		local result = (blackboard_value and "true") or "false"
		local x = (pos.x + win_size.x/2) - 24
		local y = (pos.y + win_size.y/2) - 6
		local color = (blackboard_value and Color(255, 240, 200, 10)) or Colors.get("white")
		local text = result

		ScriptGUI.text(gui, text, font_mtrl, font_size, font, Vector3(x, y, pos.z + 1), color)
	end

	Gui.rect(gui, pos, win_size, bk_color)

	return 
end
EditAiUtility.save_considerations = function (self)
	if not GameSettingsDevelopment.trunk_path then
		print("Cannot save! No run parameter \"-trunk-path <path to my bulldozer trunk>\" has been added")

		return 
	end

	print("SAVING CONSIDERATIONS!")

	local considerations_table_striped_names = table.clone(UtilityConsiderations)

	for name, consideration in pairs(considerations_table_striped_names) do
		consideration.name = nil

		for name, data in pairs(consideration) do
			if type(data) == "table" then
				data.name = nil
			end
		end
	end

	local write_string = "UtilityConsiderations = " .. serialize.save_simple(considerations_table_striped_names)

	print(write_string)

	local file_path = GameSettingsDevelopment.trunk_path .. "/scripts/entity_system/systems/behaviour/utility/utility_considerations.lua"
	local filehandle = io.open(file_path, "w+")

	assert(filehandle)
	filehandle.write(filehandle, write_string)
	io.close(filehandle)

	return 
end

return 

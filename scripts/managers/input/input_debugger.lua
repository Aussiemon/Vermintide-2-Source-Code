local font_size = 16
local font = "gw_arial_16"
local font_mtrl = "materials/fonts/" .. font
local serialize = require("scripts/utils/serialize")
script_data.input_debug_device_state = script_data.input_debug_device_state or Development.parameter("input_debug_device_state")
script_data.input_debug_filters = script_data.input_debug_filters or Development.parameter("input_debug_filters")
InputDebugger = InputDebugger or {}
InputDebugger.setup = function (self, world, input_manager)
	self.input_device_data = {}
	self.gui = World.create_screen_gui(world, "material", "materials/fonts/gw_fonts", "immediate")
	self.num_updated_devices = 0
	self.input_manager = input_manager
	self.hold_timer = 0
	self.current_selection = 1
	self.debug_edit_keymap = false
	self.enabled = true
	self.world = world

	return 
end
InputDebugger.clear = function (self)
	self.world = nil
	self.gui = nil
	self.input_manager = nil

	return 
end
InputDebugger.pre_update_device = function (self, input_device, device_data, dt)
	if script_data.input_debug_device_state then
	end

	return 
end
local x_spacing = 100
InputDebugger.post_update_device = function (self, input_device, device_data, dt)
	if not self.input_manager then
		return 
	end

	if not script_data.debug_enabled then
		return 
	end

	if script_data.input_debug_device_state then
		local gui = self.gui
		local white_color = Color(255, 255, 255)
		local blue_color = Color(128, 128, 255)
		local green_color = Color(128, 255, 128)
		local device_name = input_device.name(input_device)
		local s_w = RESOLUTION_LOOKUP.res_w
		local s_h = RESOLUTION_LOOKUP.res_h

		Gui.text(gui, device_name, font_mtrl, font_size, font, Vector3(100 + self.num_updated_devices * x_spacing, s_h - font_size, 900), white_color)

		local debug_device_data = self.input_device_data[device_name] or {}
		self.input_device_data[device_name] = debug_device_data

		for key, value in pairs(device_data) do
			local value_type = type(value)

			if value_type == "table" then
				local subtable = debug_device_data[key] or {}
				debug_device_data[key] = subtable

				for k, v in pairs(value) do
					local v_type = Script.type_name(v)

					if v_type == "number" and 0 < v then
						subtable[k] = 1
					elseif v_type == "Vector3" then
						if Vector3.distance(v, Vector3.zero()) < 0.1 then
							if subtable[k] and 0 < subtable[k] then
								subtable[k] = subtable[k] - dt
							end
						else
							subtable[k] = 1
						end
					elseif v_type ~= "number" and v then
						subtable[k] = 1
					elseif subtable[k] and 0 < subtable[k] then
						subtable[k] = subtable[k] - dt
					end
				end
			else
				debug_device_data[key] = value
			end
		end

		local i = 1

		for name, data in pairs(device_data) do
			local debug_data = debug_device_data[name]

			if type(data) == "table" then
				i = i + 1

				Gui.text(gui, "  " .. name, font_mtrl, font_size, font, Vector3(100 + self.num_updated_devices * x_spacing, s_h - font_size * i, 900), blue_color)

				for key, value in pairs(data) do
					if type(key) == "number" then
						local key_debug_data = debug_data[key]

						if key_debug_data and 0 < key_debug_data then
							local color = Color(255 * key_debug_data, 128, 255, 128)
							local button_name = (name == "axis" and input_device.axis_name(key)) or input_device.button_name(key)
							local text = string.format("    [%s]:%s", button_name, tostring(value))
							i = i + 1

							Gui.text(gui, text, font_mtrl, font_size, font, Vector3(100 + self.num_updated_devices * x_spacing, s_h - font_size * i, 900), color)
						end
					end
				end
			end
		end

		self.num_updated_devices = self.num_updated_devices + 1
	end

	return 
end

local function render_text(text, position, color)
	Gui.text(InputDebugger.gui, text, font_mtrl, font_size, font, position, color)

	return 
end

InputDebugger.debug_input_filters = function (self)
	local blue_color = Color(128, 128, 255)
	local green_color = Color(128, 255, 128)
	local i = 0
	local s_w = RESOLUTION_LOOKUP.res_w
	local s_h = RESOLUTION_LOOKUP.res_h

	for input_service_name, input_service in pairs(self.input_manager.input_services) do
		if input_service.input_filters then
			render_text(string.format("Filters: %s", input_service_name), Vector3(20, s_h / 2 - font_size * i, 900), blue_color)

			i = i + 1

			for filter_type, input_filter_data in pairs(input_service.input_filters) do
				local key = input_filter_data.filter_output
				local value = InputFilters[input_filter_data.function_data.filter_type].update(input_filter_data.function_data, input_service)

				render_text(string.format("[%s]:%s", key, tostring(value)), Vector3(20, s_h / 2 - font_size * i, 900), green_color)

				i = i + 1
			end
		end
	end

	return 
end
InputDebugger.update_input_service_data = function (self, input_service, t)
	local selected_color = Color(128, 128, 192)
	local normal_color = Color(255, 255, 255)
	local current_color = Color(192, 192, 64)
	local title_color = Color(64, 192, 64)

	if input_service.get(input_service, "esc") then
		if not self.selected_input_service then
			self.debug_edit_keymap = false

			self.input_manager:device_unblock_all_services("keyboard")
			self.input_manager:device_unblock_all_services("mouse")
		elseif not self.selected_keymap and not self.added_keymap then
			if self.selected_input_type then
				self.selected_input_type = nil
			else
				self.selected_input_service = nil
			end

			self.current_selection = 1

			return 
		end
	end

	local selected_input_service = self.selected_input_service
	local current_selection = self.current_selection
	local s_w = RESOLUTION_LOOKUP.res_w
	local s_h = RESOLUTION_LOOKUP.res_h
	local top = s_h - 20 - font_size
	local x_pos = s_w / 2
	local i = 0
	local current_input_service_data = nil

	if not selected_input_service then
		render_text("Select input service (press 's' to print it to console):", Vector3(x_pos, top, 900), title_color)
	else
		if self.selected_input_type then
			if self.selected_keymap or self.selected_input_filter_name then
				x_pos = x_pos - 360
			else
				x_pos = x_pos - 240
			end
		else
			x_pos = x_pos - 120
		end

		render_text("InputService", Vector3(x_pos, top, 900), title_color)
	end

	top = top - font_size

	for input_service_name, input_service_data in pairs(self.input_manager.input_services) do
		i = i + 1
		local color = normal_color

		if selected_input_service then
			if selected_input_service == input_service_name then
				current_input_service_data = input_service_data
				color = selected_color
			end
		elseif current_selection == i then
			color = current_color

			self.handle_edit_debug_keys(self, input_service, input_service_name, "selected_input_service", nil, table.size(self.input_manager.input_services), t)

			if DebugKeyHandler.key_pressed("s", "Save Keybinding", "Input") then
				local selected_real_input_service = self.input_manager:get_service(input_service_name)
				local new_keybinding = selected_real_input_service.generate_keybinding_setting(selected_real_input_service)
				local new_filters = selected_real_input_service.generate_filters_setting(selected_real_input_service)

				print("---------------> SNIP SNIP <-----------------")

				local text = serialize.save_simple(new_keybinding)

				print(text)
				print("---------------> SNIP SNIP <-----------------")

				PlayerData.controls = PlayerData.controls or {}
				local control_table = PlayerData.controls[input_service_name] or {}
				PlayerData.controls[input_service_name] = control_table
				control_table.keymap = new_keybinding
				control_table.filters = new_filters

				Managers.save:auto_save(SaveFileName, SaveData)
			end
		end

		render_text(input_service_name, Vector3(x_pos, top, 900), color)

		top = top - font_size
	end

	return current_input_service_data, x_pos
end
InputDebugger.update_selected_device = function (self, input_service, x_pos, top, t)
	local selected_color = Color(128, 128, 192)
	local normal_color = Color(255, 255, 255)
	local current_color = Color(192, 192, 64)
	local title_color = Color(64, 192, 64)
	local s_w = RESOLUTION_LOOKUP.res_w
	local s_h = RESOLUTION_LOOKUP.res_h
	local current_selection = self.current_selection

	render_text("Select button press type", Vector3(x_pos, top, 900), title_color)

	top = top - font_size
	local i = 0
	local selected_map_type = self.selected_map_type

	for map_type, _ in pairs(InputAux.input_map_types) do
		i = i + 1
		local color = normal_color

		if selected_map_type then
			if selected_map_type == map_type then
				color = selected_color
			end
		elseif current_selection == i then
			color = current_color

			self.handle_edit_debug_keys(self, input_service, map_type, "selected_map_type", "current_selected_device", table.size(InputAux.input_map_types), t)
		end

		render_text(map_type, Vector3(x_pos, top, 900), color)

		top = top - font_size
	end

	if selected_map_type and selected_map_type ~= "axis" then
		render_text("Please press key (escape to cancel).", Vector3(s_w / 2, s_h / 2, 900), normal_color)

		local device_type = self.current_selected_device
		local input_device = InputAux.input_device_mapping[device_type][1]
		local pressed_button = input_device.any_pressed()
		local last_pressed = self.last_pressed or pressed_button
		self.last_pressed = last_pressed

		if last_pressed then
			render_text(string.format("You pressed: %s (%d)", input_device.button_name(last_pressed), last_pressed), Vector3(s_w / 2, s_h / 2 - font_size * i, 900), normal_color)

			local time_for_complete = self.key_selected_wait or t + 1
			self.key_selected_wait = time_for_complete

			if time_for_complete < t then
				local current_keybinds = self.current_keybinds or {}
				self.current_keybinds = current_keybinds
				local n = #current_keybinds
				current_keybinds[n + 1] = device_type
				current_keybinds[n + 2] = last_pressed
				current_keybinds[n + 3] = selected_map_type
				self.key_selected_wait = nil
				self.last_pressed = nil
				self.selected_map_type = nil
				self.current_selected_device = nil
			end
		end
	elseif selected_map_type == "axis" then
	end

	return 
end
InputDebugger.update_input_modify_type = function (self, input_service, t, x_pos)
	local selected_color = Color(128, 128, 192)
	local normal_color = Color(255, 255, 255)
	local current_color = Color(192, 192, 64)
	local title_color = Color(64, 192, 64)
	local s_w = RESOLUTION_LOOKUP.res_w
	local s_h = RESOLUTION_LOOKUP.res_h
	local top = s_h - 20 - font_size
	x_pos = x_pos + 120
	local current_selection = self.current_selection

	if not self.selected_input_type then
		render_text("Select input filters to modify or keymap.", Vector3(x_pos, top, 900), title_color)
	end

	top = top - font_size

	if self.selected_input_type == "filters" then
		render_text("Input Filters", Vector3(x_pos, top, 900), selected_color)
		render_text("Input Keymap", Vector3(x_pos, top - font_size, 900), normal_color)
	elseif self.selected_input_type == "keymap" then
		render_text("Input Filters", Vector3(x_pos, top, 900), normal_color)
		render_text("Input Keymap", Vector3(x_pos, top - font_size, 900), selected_color)
	else
		render_text("Input Filters", Vector3(x_pos, top, 900), (current_selection == 1 and current_color) or normal_color)
		render_text("Input Keymap", Vector3(x_pos, top - font_size, 900), (current_selection == 2 and current_color) or normal_color)

		if input_service.get(input_service, "enter_key") then
			self.selected_input_type = (current_selection == 1 and "filters") or "keymap"
			self.current_selection = 1
		elseif input_service.get(input_service, "up_key") and self.hold_timer < t then
			self.current_selection = 3 - current_selection
			self.hold_timer = t + 0.1
		elseif input_service.get(input_service, "down_key") and self.hold_timer < t then
			self.current_selection = 3 - current_selection
			self.hold_timer = t + 0.1
		elseif input_service.get(input_service, "backspace") then
			self.selected_input_service = nil
			self.current_selection = 1
		end
	end

	top = top - font_size * 2

	return x_pos
end
InputDebugger.update_selected_keymap_edit = function (self, input_service, dt, t, x_pos, current_input_service_data)
	local selected_color = Color(128, 128, 192)
	local normal_color = Color(255, 255, 255)
	local current_color = Color(192, 192, 64)
	local title_color = Color(64, 192, 64)
	local s_w = RESOLUTION_LOOKUP.res_w
	local s_h = RESOLUTION_LOOKUP.res_h
	local current_selection = self.current_selection
	local top = s_h - 20 - font_size
	x_pos = x_pos + 120
	local selected_keymap = self.selected_keymap

	if not selected_keymap and not self.added_keymap then
		render_text("Select keymap to modify. Press 'a' to add, 'd' to delete.", Vector3(x_pos, top, 900), title_color)
	else
		render_text("Keymap", Vector3(x_pos, top, 900), title_color)
	end

	top = top - font_size
	local i = 0
	local added_keymap = self.added_keymap

	if added_keymap then
		if added_keymap.edit_mode == "device" then
			render_text(string.format("Keymap name: %s (press 'f' to finalize, 'esc' to cancel)", added_keymap.name), Vector3(x_pos, top, 900), title_color)
		else
			render_text("Keymap name: " .. added_keymap.name, Vector3(x_pos, top, 900), normal_color)
		end

		if input_service.get(input_service, "esc") then
			self.added_keymap = nil
			self.current_selection = 1

			return 
		end

		top = top - font_size

		if self.current_keybinds then
			render_text("Current buttons:", Vector3(x_pos, top, 900), title_color)

			top = top - font_size
			local current_keybinds = self.current_keybinds

			for i = 1, #current_keybinds / 3, 1 do
				local device_type = current_keybinds[i * 3 - 2]
				local button_name = InputAux.input_device_mapping[device_type][1].button_name(current_keybinds[i * 3 - 1])

				render_text(string.format("%s:%s[%d] (%s)", device_type, button_name, current_keybinds[i * 3 - 1], current_keybinds[i * 3]), Vector3(x_pos, top, 900), selected_color)

				top = top - font_size
			end

			if DebugKeyHandler.key_pressed("f", "Finalize Keybinding (store)", "Input") then
				local name = added_keymap.name
				local selected_input_service = self.input_manager:get_service(self.selected_input_service)

				selected_input_service.add_keymap(selected_input_service, name)
				selected_input_service.add_keybinding(selected_input_service, name, unpack(self.current_keybinds))

				self.current_keybinds = nil
				self.added_keymap = nil
				self.current_selection = 1
				self.current_selected_device = nil
				self.selected_map_type = nil
				self.key_selected_wait = nil
				self.last_pressed = nil

				return 
			end
		end

		local edit_mode = added_keymap.edit_mode

		if not edit_mode then
			local index = self.edit_index or 1
			local mode = self.edit_mode
			local keystrokes = Keyboard.keystrokes()
			local new_text, new_index, new_mode = KeystrokeHelper.parse_strokes(added_keymap.name, index, mode, keystrokes)
			self.edit_index = new_index
			self.edit_mode = new_mode
			added_keymap.name = new_text

			if input_service.get(input_service, "enter_key") then
				added_keymap.edit_mode = "device"
				self.current_selection = 1
			end
		end

		local current_selected_device = self.current_selected_device

		if edit_mode == "device" then
			render_text("Select device-type:", Vector3(x_pos, top, 900), title_color)

			top = top - font_size
			local num_device_types = 0

			for device_type, device_list in pairs(current_input_service_data.mapped_devices) do
				if 0 < #device_list then
					num_device_types = num_device_types + 1
				end
			end

			for device_type, device_list in pairs(current_input_service_data.mapped_devices) do
				if 0 < #device_list then
					local color = normal_color
					i = i + 1

					if current_selected_device then
						if current_selected_device == device_type then
							color = selected_color
						end
					elseif current_selection == i then
						color = current_color

						self.handle_edit_debug_keys(self, input_service, device_type, "selected_input_type", nil, num_device_types, t)
					end

					render_text(device_type, Vector3(x_pos, top, 900), color)

					top = top - font_size
				end
			end
		end

		if current_selected_device then
			self.update_selected_device(self, input_service, x_pos, top, t)
		end

		return 
	end

	local max_keymaps = 40
	local num_keymaps = table.size(current_input_service_data.keymaps)
	local last_render = math.min(num_keymaps, current_selection + 20)
	local first_render = math.max(1, last_render - 40)
	last_render = math.min(num_keymaps, first_render + 40)
	local current_keymap_data = nil

	for keymap_name, keymap_data in pairs(current_input_service_data.keymaps) do
		i = i + 1
		local color = normal_color

		if selected_keymap then
			if selected_keymap == keymap_name then
				current_keymap_data = keymap_data
				color = selected_color
			end
		elseif current_selection == i then
			color = current_color

			if DebugKeyHandler.key_pressed("a", "Add Keymap", "Input") then
				self.added_keymap = {
					name = ""
				}
			elseif DebugKeyHandler.key_pressed("d", "Delete Keymap", "Input") then
				self.input_manager:get_service(self.selected_input_service):remove_keymap(keymap_name)
			else
				self.handle_edit_debug_keys(self, input_service, keymap_name, "selected_keymap", "selected_input_type", num_keymaps, t)
			end
		end

		if first_render <= i and i <= last_render then
			render_text(keymap_name, Vector3(x_pos, top, 900), color)

			top = top - font_size
		end
	end

	if not current_keymap_data then
		return 
	end

	if input_service.get(input_service, "esc") then
		self.selected_input_type = nil
		self.current_selection = 1

		return 
	end

	x_pos = x_pos + 120
	top = s_h - 20 - font_size

	render_text("Select keybinding to modify. Press 'a' to add, 'enter' to edit.", Vector3(x_pos, top, 900), title_color)

	top = top - font_size

	render_text("   'del' to delete.", Vector3(x_pos, top, 900), title_color)

	top = top - font_size
	local selected_binding = self.selected_binding
	local binding_index, subkey_index, current_keymap = nil
	i = 0
	local num_choices = 0

	for _, keymap in ipairs(current_keymap_data.input_mappings) do
		num_choices = num_choices + keymap.n
	end

	for j, keymap in ipairs(current_keymap_data.input_mappings) do
		for k = 1, keymap.n, 3 do
			i = i + 1
			local device_type = keymap[k]
			local input_device_list = InputAux.input_device_mapping[device_type]
			local input_device = input_device_list[1]
			local button_index = keymap[k + 1]
			local color = normal_color

			if selected_binding then
				if selected_binding == i then
					color = selected_color
					current_keymap = keymap
					binding_index = j
					subkey_index = math.ceil(k / 3)
				end
			elseif current_selection == i then
				self.handle_edit_debug_keys(self, input_service, i, "selected_binding", "selected_keymap", num_choices / 3, t)

				color = current_color
			end

			local text = string.format("[%d.%d] %s [%d] %s (%s)", j, math.ceil(k / 3), device_type, button_index, input_device.button_name(button_index), keymap[k + 2])

			render_text(text, Vector3(x_pos, top, 900), color)

			top = top - font_size
		end
	end

	if not current_keymap then
		return 
	end

	render_text("Please press new key (escape to cancel).", Vector3(s_w / 2, s_h / 2, 900), normal_color)

	local device_type = current_keymap[subkey_index * 3 - 2]
	local input_device = InputAux.input_device_mapping[device_type][1]
	local pressed_button = input_device.any_pressed()
	self.last_pressed = self.last_pressed or pressed_button

	if self.last_pressed then
		render_text(string.format("You pressed: %s (%d)", input_device.button_name(self.last_pressed), self.last_pressed), Vector3(s_w / 2, s_h / 2 - font_size, 900), normal_color)

		local time_for_complete = self.key_selected_wait or t + 1
		self.key_selected_wait = time_for_complete

		if time_for_complete < t then
			local selected_input_service = self.selected_input_service

			self.input_manager:get_service(selected_input_service):change_keybinding(selected_keymap, binding_index, subkey_index, self.last_pressed)

			self.key_selected_wait = nil
			self.selected_binding = nil
			self.last_pressed = nil
		end
	end

	return 
end
InputDebugger.update_selected_filter_edit = function (self, input_service, dt, t, x_pos, current_input_service_data)
	local selected_color = Color(128, 128, 192)
	local normal_color = Color(255, 255, 255)
	local current_color = Color(192, 192, 64)
	local title_color = Color(64, 192, 64)
	local s_w = RESOLUTION_LOOKUP.res_w
	local s_h = RESOLUTION_LOOKUP.res_h
	local current_selection = self.current_selection
	local top = s_h - 20 - font_size
	x_pos = x_pos + 120
	local selected_input_filter_name = self.selected_input_filter_name

	if not selected_input_filter_name then
		render_text("Select filter to modify. Press 'a' to add, 'd' to delete.", Vector3(x_pos, top, 900), title_color)
	else
		render_text("Filter", Vector3(x_pos, top, 900), title_color)
	end

	top = top - font_size
	local input_filters = current_input_service_data.input_filters
	local selected_input_filter = nil
	local i = 0

	for name, input_filter in pairs(input_filters) do
		i = i + 1

		if selected_input_filter_name then
			render_text(name, Vector3(x_pos, top, 900), (selected_input_filter_name == name and selected_color) or normal_color)

			if selected_input_filter_name == name then
				selected_input_filter = input_filter
			end
		elseif i == current_selection then
			render_text(name, Vector3(x_pos, top, 900), current_color)
			self.handle_edit_debug_keys(self, input_service, name, "selected_input_filter_name", "selected_input_type", table.size(input_filters), t)
		else
			render_text(name, Vector3(x_pos, top, 900), normal_color)
		end

		top = top - font_size
	end

	if not selected_input_filter then
		return 
	end

	x_pos = x_pos + 120
	top = s_h - 20 - font_size

	render_text("Select filter-data to edit:", Vector3(x_pos, top, 900), title_color)

	top = top - font_size
	local selected_edit_type_index = self.selected_edit_type_index
	local filter_color = (selected_edit_type_index == 1 and selected_color) or (not selected_edit_type_index and current_selection == 1 and current_color) or normal_color

	render_text("Type: " .. selected_input_filter.filter_type, Vector3(x_pos, top, 900), filter_color)

	local edit_types = InputFilters[selected_input_filter.filter_type].edit_types

	if current_selection == 1 and not selected_edit_type_index then
		self.handle_edit_debug_keys(self, input_service, 1, "selected_edit_type_index", "selected_input_filter_name", #edit_types + 1, t)
	end

	top = top - font_size
	local selected_edit_type = nil

	for j, edit_type in ipairs(edit_types) do
		local color = normal_color

		if selected_edit_type_index then
			if selected_edit_type_index == j + 1 then
				selected_edit_type = edit_type
				color = selected_color
			end
		elseif current_selection == j + 1 then
			color = current_color

			self.handle_edit_debug_keys(self, input_service, j + 1, "selected_edit_type_index", "selected_input_filter_name", #edit_types + 1, t)
		end

		local filter_value = tostring((edit_type[4] and selected_input_filter.function_data[edit_type[4]][edit_type[1]]) or selected_input_filter.function_data[edit_type[1]])
		local text = string.format("%s [%s] (%s)", edit_type[1], edit_type[2], filter_value)

		render_text(text, Vector3(x_pos, top, 900), color)

		top = top - font_size
	end

	if not selected_edit_type_index then
		return 
	end

	top = s_h - 20 - font_size
	x_pos = x_pos + 120

	if selected_edit_type_index == 1 then
		render_text("Select new filter type", Vector3(x_pos, top, 900), title_color)

		top = top - font_size
		i = 0

		for name, filter_data in pairs(InputFilters) do
			i = i + 1
			local color = normal_color

			if current_selection == i then
				color = current_color

				self.handle_edit_debug_keys(self, input_service, name, "current_selected_filter_data_name", nil, table.size(InputFilters), t)
			end

			render_text(name, Vector3(x_pos, top, 900), color)

			top = top - font_size
		end

		local current_selected_filter_data_name = self.current_selected_filter_data_name

		if current_selected_filter_data_name then
			self.current_selected_filter_data_name = nil
			self.selected_edit_type_index = nil
			selected_input_filter.filter_type = current_selected_filter_data_name
			local new_filter_data = {}
			local new_filter_edit_types = InputFilters[current_selected_filter_data_name].edit_types
			local last_keymap_name = nil

			for i, edit_type in ipairs(new_filter_edit_types) do
				if edit_type[2] == "number" then
					new_filter_data[edit_type[1]] = 1
				elseif edit_type[2] == "keymap" then
					local keymap_name, keymap_data = next(current_input_service_data.keymaps, last_keymap_name)
					last_keymap_name = keymap_name
					new_filter_data[edit_type[1]] = keymap_name
				end
			end

			selected_input_filter.filter_data = InputFilters[current_selected_filter_data_name].init(new_filter_data)
			selected_input_filter.filter_function = InputFilters[current_selected_filter_data_name].update
		end
	elseif selected_edit_type[2] == "keymap" then
		local max_keymaps = 40
		local num_keymaps = 0
		local keymap_type = selected_edit_type[3]

		for _, keymap_data in pairs(current_input_service_data.keymaps) do
			if 0 < keymap_data.input_mappings.n and 0 < keymap_data.input_mappings[1].n and keymap_data.input_mappings[1][3] == keymap_type then
				num_keymaps = num_keymaps + 1
			end
		end

		local last_render = math.min(num_keymaps, current_selection + 20)
		local first_render = math.max(1, last_render - 40)
		last_render = math.min(num_keymaps, first_render + 40)
		local current_keymap_data = nil
		i = 0

		for keymap_name, keymap_data in pairs(current_input_service_data.keymaps) do
			if 0 < keymap_data.input_mappings.n and 0 < keymap_data.input_mappings[1].n and keymap_data.input_mappings[1][3] == keymap_type then
				i = i + 1
				local color = normal_color

				if current_selection == i then
					color = current_color

					self.handle_edit_debug_keys(self, input_service, keymap_name, "selected_keymap", "selected_edit_type_index", num_keymaps, t)
				end

				if first_render <= i and i <= last_render then
					render_text(keymap_name, Vector3(x_pos, top, 900), color)

					top = top - font_size
				end
			end
		end

		if self.selected_keymap then
			if selected_edit_type[4] then
				selected_input_filter.function_data[selected_edit_type[4]][selected_edit_type[1]] = self.selected_keymap
			else
				selected_input_filter.function_data[selected_edit_type[1]] = self.selected_keymap
			end

			self.selected_edit_type_index = nil
			self.selected_keymap = nil
		end
	elseif selected_edit_type[2] == "number" then
		local current_number_text = self.current_number_text or ""

		render_text("Enter new number: " .. current_number_text, Vector3(x_pos, top, 900), normal_color)

		local index = self.number_edit_index or 1
		local mode = self.number_edit_mode or ""
		local keystrokes = Keyboard.keystrokes()

		for i = #keystrokes, 1, -1 do
			local k = keystrokes[i]

			if (not tonumber(k) and k ~= ".") or (string.find(current_number_text, "%.") and k == ".") then
				table.remove(keystrokes, i)
			end
		end

		local new_text, new_index, new_mode = KeystrokeHelper.parse_strokes(current_number_text, index, mode, keystrokes)
		self.number_edit_index = new_index
		self.number_edit_mode = new_mode
		self.current_number_text = new_text

		if input_service.get(input_service, "enter_key") then
			self.current_selection = 1
			self.selected_edit_type_index = nil
			local number = tonumber(new_text)
			self.current_number_text = nil
			self.number_edit_mode = nil
			self.number_edit_index = nil

			if number then
				selected_input_filter.function_data[selected_edit_type[1]] = number
			end
		end
	end

	return 
end
InputDebugger.finalize_update = function (self, input_services, dt, t)
	if not self.input_manager then
		return 
	end

	if not script_data.debug_enabled then
		return 
	end

	self.num_updated_devices = 0
	local gui = self.gui

	if script_data.input_debug_filters then
		self.debug_input_filters(self)
	end

	if self.debug_edit_keymap then
		local input_service = self.input_manager:get_service("Debug")
		local selected_color = Color(128, 128, 192)
		local normal_color = Color(255, 255, 255)
		local current_color = Color(192, 192, 64)
		local title_color = Color(64, 192, 64)
		local s_w = RESOLUTION_LOOKUP.res_w
		local s_h = RESOLUTION_LOOKUP.res_h
		local current_selection = self.current_selection
		local current_input_service_data, x_pos = self.update_input_service_data(self, input_service, t)

		if not current_input_service_data then
			return 
		end

		local selected_input_type = self.selected_input_type
		x_pos = self.update_input_modify_type(self, input_service, t, x_pos)

		if not selected_input_type then
			return 
		end

		if selected_input_type == "keymap" then
			self.update_selected_keymap_edit(self, input_service, dt, t, x_pos, current_input_service_data)
		elseif selected_input_type == "filters" then
			self.update_selected_filter_edit(self, input_service, dt, t, x_pos, current_input_service_data)
		end
	elseif self.input_device_data and DebugKeyHandler.key_pressed("f4", "Enable keymap editor.", "Input", "left ctrl") then
		self.debug_edit_keymap = true

		self.input_manager:block_device_except_service("Debug", "keyboard")
		self.input_manager:block_device_except_service("Debug", "mouse")
	end

	return 
end
InputDebugger.handle_edit_debug_keys = function (self, input_service, current_choice_name, choice_store, back_clear, max_nr_choices, t)
	local current_selection = self.current_selection

	if input_service.get(input_service, "enter_key") then
		self[choice_store] = current_choice_name
		self.current_selection = 1
	elseif input_service.get(input_service, "up_key") and self.hold_timer < t then
		self.current_selection = (0 < current_selection - 1 and current_selection - 1) or max_nr_choices
		self.hold_timer = t + 0.1
	elseif input_service.get(input_service, "down_key") and self.hold_timer < t then
		self.current_selection = (max_nr_choices < current_selection + 1 and 1) or current_selection + 1
		self.hold_timer = t + 0.1
	elseif input_service.get(input_service, "backspace") and back_clear then
		self[back_clear] = nil
		self.current_selection = 1
	end

	return 
end

return 

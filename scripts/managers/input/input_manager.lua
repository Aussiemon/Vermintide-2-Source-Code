require("scripts/managers/input/input_service")
require("scripts/managers/input/play_recording_input_device")
require("scripts/managers/input/network_input_device")
require("scripts/managers/input/input_aux")
require("scripts/managers/input/input_filters")
require("scripts/managers/input/input_debugger")

local most_recent_input_device = most_recent_input_device or (PLATFORM == "win32" and Keyboard) or Pad1
local most_recent_input_device_type = most_recent_input_device_type or (PLATFORM == "win32" and "keyboard") or "gamepad"
local gamepad_disabled = Development.parameter("disable_gamepad")

local function dprint(...)
	if script_data.input_debug_filters then
		printf(...)
	end

	return 
end

InputManager = class(InputManager)
InputManager.init = function (self)
	self.platform = PLATFORM
	self.input_services = {}
	self.input_devices = {}
	self.stored_keymaps_data = {}
	self.stored_filters_data = {}
	self.blocked_gamepad_services = {}
	local device_list = InputAux.input_device_mapping.gamepad

	for _, input_device in ipairs(device_list) do
		input_device.set_down_threshold(0.25)
	end

	return 
end
InputManager.destroy = function (self)
	self.input_services = nil
	self.input_devices = nil

	return 
end
InputManager.initialize_device = function (self, input_device_type, input_device_slot)
	if gamepad_disabled and input_device_type == "gamepad" then
		return 
	end

	if self.platform ~= "win32" and (input_device_type == "keyboard" or input_device_type == "mouse") then
		return 
	end

	local device_list = InputAux.input_device_mapping[input_device_type]

	assert(device_list, "No such input device type: %s", input_device_type)

	if input_device_type == "gamepad" then
		for input_device_slot, input_device in ipairs(device_list) do
			assert(not self.input_devices[input_device], "Input device already initialized %s %d.", input_device_type, input_device_slot)

			self.input_devices[input_device] = {
				pressed = {},
				released = {},
				held = {},
				soft_button = {},
				num_buttons = input_device.num_buttons(),
				axis = {},
				num_axes = input_device.num_axes(),
				blocked_access = {},
				consumed_input = {}
			}
		end
	else
		input_device_slot = input_device_slot or 1
		local input_device = device_list[input_device_slot]

		assert(input_device, "No input device %s with index %d", input_device_type, input_device_slot)
		assert(not self.input_devices[input_device], "Input device already initialized %s %d.", input_device_type, input_device_slot)

		self.input_devices[input_device] = {
			pressed = {},
			released = {},
			held = {},
			soft_button = {},
			num_buttons = input_device.num_buttons(),
			axis = {},
			num_axes = input_device.num_axes(),
			blocked_access = {},
			consumed_input = {}
		}
	end

	return 
end
InputManager.remove_all_devices = function (self, input_device_type)
	local device_list = InputAux.input_device_mapping[input_device_type]

	if not device_list then
		return 
	end

	for _, old_input_device in ipairs(device_list) do
		for name, service in pairs(self.input_services) do
			service.unmap_device(service, input_device_type, old_input_device)
		end

		self.input_devices[old_input_device] = nil
	end

	local num_devices = #device_list

	for i = num_devices, 1, -1 do
		local old_input_device = device_list[i]

		InputAux.remove_device(input_device_type, old_input_device)
	end

	return 
end
InputManager.set_exclusive_gamepad = function (self, input_device)
	local input_device_type = "gamepad"

	self.remove_all_devices(self, input_device_type)
	InputAux.add_device(input_device_type, input_device)
	self.initialize_device(self, input_device_type)

	local device_data = self.input_devices[input_device]

	for name, service in pairs(self.input_services) do
		service.map_device(service, input_device_type, input_device, self.input_devices[input_device])

		if self.blocked_gamepad_services[name] then
			device_data.blocked_access[name] = true
		end
	end

	return 
end
InputManager.set_all_gamepads_available = function (self)
	local input_device_type = "gamepad"

	self.remove_all_devices(self, input_device_type)

	local device_list = {
		rawget(_G, "Pad1"),
		rawget(_G, "Pad2"),
		rawget(_G, "Pad3"),
		rawget(_G, "Pad4"),
		rawget(_G, "Pad5"),
		rawget(_G, "Pad6"),
		rawget(_G, "Pad7"),
		rawget(_G, "Pad8")
	}

	for i, input_device in ipairs(device_list) do
		local input_device = device_list[i]

		InputAux.add_device(input_device_type, input_device)
	end

	self.initialize_device(self, input_device_type)

	for _, input_device in ipairs(device_list) do
		local device_data = self.input_devices[input_device]

		for name, service in pairs(self.input_services) do
			service.map_device(service, input_device_type, input_device, self.input_devices[input_device])

			if self.blocked_gamepad_services[name] then
				device_data.blocked_access[name] = true
			end
		end
	end

	return 
end
InputManager.block_device_except_service = function (self, service_exception, device_type, device_index, block_reason)
	if gamepad_disabled and device_type == "gamepad" then
		return 
	end

	device_index = device_index or 1
	local device_list = InputAux.input_device_mapping[device_type]

	if not device_list then
		return 
	end

	if device_type == "gamepad" then
		for _, input_device in ipairs(device_list) do
			local device_data = self.input_devices[input_device]

			for name, service in pairs(self.input_services) do
				if service.block_reasons and service.block_reasons[block_reason] then
					device_data.blocked_access[name] = true

					service.set_blocked(service, true)
				elseif not service.block_reasons then
					device_data.blocked_access[name] = true

					service.set_blocked(service, true)
				end

				self.blocked_gamepad_services[name] = true
			end

			if service_exception and device_data.blocked_access[service_exception] then
				self.input_services[service_exception]:set_blocked(nil)

				device_data.blocked_access[service_exception] = nil
			end

			if service_exception then
				self.blocked_gamepad_services[service_exception] = nil
			end
		end
	else
		local input_device = device_list[device_index]
		local device_data = self.input_devices[input_device]

		if device_data then
			for name, service in pairs(self.input_services) do
				if service.block_reasons and service.block_reasons[block_reason] then
					device_data.blocked_access[name] = true

					service.set_blocked(service, true)
				elseif not service.block_reasons then
					device_data.blocked_access[name] = true

					service.set_blocked(service, true)
				end
			end

			if service_exception and device_data.blocked_access[service_exception] then
				self.input_services[service_exception]:set_blocked(nil)

				device_data.blocked_access[service_exception] = nil
			end
		end
	end

	return 
end
InputManager.device_unblock_all_services = function (self, device_type, device_index)
	if gamepad_disabled and device_type == "gamepad" then
		return 
	end

	local device_list = InputAux.input_device_mapping[device_type]

	if not device_list then
		return 
	end

	if device_type == "gamepad" then
		for _, input_device in ipairs(device_list) do
			local device_data = self.input_devices[input_device]
			local input_services = self.input_services

			for name, _ in pairs(device_data.blocked_access) do
				input_services[name]:set_blocked(nil)

				device_data.blocked_access[name] = nil
			end
		end

		self.blocked_gamepad_services = {}
	else
		device_index = device_index or 1
		local input_device = device_list[device_index]
		local device_data = self.input_devices[input_device]

		if device_data then
			local input_services = self.input_services

			for name, _ in pairs(device_data.blocked_access) do
				input_services[name]:set_blocked(nil)

				device_data.blocked_access[name] = nil
			end
		end
	end

	return 
end
InputManager.device_block_service = function (self, device_type, device_index, service_name, block_reason)
	if gamepad_disabled and device_type == "gamepad" then
		return 
	end

	local input_service = self.input_services[service_name]

	if input_service.block_reasons and not input_service.block_reasons[block_reason] then
		return 
	end

	local device_list = InputAux.input_device_mapping[device_type]

	if not device_list then
		return 
	end

	if device_type == "gamepad" then
		for _, input_device in ipairs(device_list) do
			local device_data = self.input_devices[input_device]
			device_data.blocked_access[service_name] = true

			input_service.set_blocked(input_service, true)
		end

		self.blocked_gamepad_services[service_name] = true
	else
		device_index = device_index or 1
		local input_device = device_list[device_index]
		local device_data = self.input_devices[input_device]

		if device_data then
			device_data.blocked_access[service_name] = true

			input_service.set_blocked(input_service, true)
		end
	end

	return 
end
InputManager.device_unblock_service = function (self, device_type, device_index, service_name)
	if gamepad_disabled and device_type == "gamepad" then
		return 
	end

	local device_list = InputAux.input_device_mapping[device_type]

	if not device_list then
		return 
	end

	if device_type == "gamepad" then
		for _, input_device in ipairs(device_list) do
			local device_data = self.input_devices[input_device]
			device_data.blocked_access[service_name] = nil

			self.input_services[service_name]:set_blocked(nil)
		end

		self.blocked_gamepad_services[service_name] = nil
	else
		device_index = device_index or 1
		local input_device = device_list[device_index]
		local device_data = self.input_devices[input_device]

		if device_data then
			device_data.blocked_access[service_name] = nil

			self.input_services[service_name]:set_blocked(nil)
		end
	end

	return 
end
InputManager.get_unblocked_services = function (self, device_type, device_index, services_dest)
	local services_n = 0

	for service_name, service in pairs(self.input_services) do
		if not service.is_blocked(service) then
			services_n = services_n + 1
			services_dest[services_n] = service_name
		end
	end

	return services_n
end
InputManager.get_blocked_services = function (self, device_type, device_index, services_dest)
	local services_n = 0

	for service_name, service in pairs(self.input_services) do
		if service.is_blocked(service) then
			services_n = services_n + 1
			services_dest[services_n] = service_name
		end
	end

	return services_n
end
InputManager.device_block_services = function (self, device_type, device_index, services, services_n, block_reason)
	device_index = device_index or 1

	for i = 1, services_n, 1 do
		local service_name = services[i]

		self.device_block_service(self, device_type, device_index, service_name, block_reason)
	end

	return 
end
InputManager.device_unblock_services = function (self, device_type, device_index, services, services_n)
	device_index = device_index or 1

	for i = 1, services_n, 1 do
		local service_name = services[i]

		self.device_unblock_service(self, device_type, device_index, service_name)
	end

	return 
end
InputManager.create_input_service = function (self, input_service_name, keymaps_name, filters_name, block_reasons)
	local keymaps = rawget(_G, keymaps_name)

	fassert(keymaps, "[InputManager] - No keymaps found for %s", keymaps_name)

	if not self.stored_keymaps_data[keymaps_name] then
		self.add_keymaps_data(self, keymaps, keymaps_name)
	end

	if filters_name then
		local filters = rawget(_G, filters_name)

		fassert(filters, "[InputManager] - No filters found for %s", filters_name)

		if not self.stored_filters_data[filters_name] then
			self.add_filters_data(self, filters, filters_name)
		end
	end

	self.input_services[input_service_name] = InputService:new(input_service_name, keymaps_name, filters_name, block_reasons)

	return 
end
InputManager.get_input_service = function (self, input_service_name)
	return self.input_services[input_service_name]
end
InputManager.get_active_input_service_by_device = function (self, device_name)
	for service_name, service in pairs(self.input_services) do
		if not service.is_blocked(service) then
			local mapped_devices = service.mapped_devices

			if mapped_devices then
				for name, _ in pairs(mapped_devices) do
					if name == device_name then
						return service
					end
				end
			end
		end
	end

	return 
end
InputManager.map_device_to_service = function (self, input_service_name, input_device_type, input_device_slot)
	if gamepad_disabled and input_device_type == "gamepad" then
		return 
	end

	if self.platform ~= "win32" and (input_device_type == "keyboard" or input_device_type == "mouse") then
		return 
	end

	local input_service = self.input_services[input_service_name]

	assert(input_service, "No such input service name: %s", input_service_name)

	local device_list = InputAux.input_device_mapping[input_device_type]

	assert(device_list, "No such input device type: %s", input_device_type)

	if input_device_type == "gamepad" then
		for _, input_device in ipairs(device_list) do
			local input_device_data = self.input_devices[input_device]

			input_service.map_device(input_service, input_device_type, input_device, input_device_data)
		end
	else
		input_device_slot = input_device_slot or 1
		local input_device = device_list[input_device_slot]

		assert(input_device, "No input device %s with index %d", input_device_type, input_device_slot)

		local input_device_data = self.input_devices[input_device]

		input_service.map_device(input_service, input_device_type, input_device, input_device_data)
	end

	return 
end
InputManager.update = function (self, dt, t)
	Profiler.start("InputManager")

	InputAux.default_values_for_types.Vector3 = Vector3.zero()
	self._hovering = self._frame_hovering
	self._frame_hovering = false

	Profiler.start("device_updates")
	self.update_devices(self, dt, t)
	Profiler.stop("device_updates")
	InputDebugger:finalize_update(self.input_services, dt, t)
	Profiler.stop("InputManager")

	return 
end
InputManager.update_devices = function (self, dt, t)
	local input_devices = self.input_devices
	self.any_device_input_pressed = nil
	self.any_device_input_axis_moved = nil

	for input_device, device_data in pairs(input_devices) do
		InputDebugger:pre_update_device(input_device, device_data, dt)

		local pressed = device_data.pressed
		local held = device_data.held
		local soft_button = device_data.soft_button
		local num_buttons = device_data.num_buttons - 1

		for key = 0, num_buttons, 1 do
			local button_value = input_device.button(key)
			soft_button[key] = button_value
			held[key] = 0.5 < button_value
		end

		local any_pressed = input_device.any_pressed()

		if any_pressed then
			for key = 0, num_buttons, 1 do
				pressed[key] = input_device.pressed(key)
			end
		else
			for key = 0, num_buttons, 1 do
				pressed[key] = false
			end
		end

		local any_released = input_device.any_released()
		local released = device_data.released

		if any_released then
			for key = 0, num_buttons, 1 do
				released[key] = input_device.released(key)
			end
		else
			for key = 0, num_buttons, 1 do
				released[key] = false
			end
		end

		local any_device_input_axis_moved = false
		local axis = device_data.axis

		for key = 0, device_data.num_axes - 1, 1 do
			axis[key] = input_device.axis(key)
			local button_name = input_device.axis_name(key)

			if input_device.axis_name(key) ~= "cursor" and Vector3.length(axis[key]) ~= 0 then
				any_device_input_axis_moved = true
			end
		end

		InputDebugger:post_update_device(input_device, device_data, dt)

		if any_pressed then
			self.any_device_input_pressed = true
		end

		if any_device_input_axis_moved then
			self.any_device_input_axis_moved = true
		end

		if any_pressed or any_device_input_axis_moved then
			self.last_active_time = t

			if most_recent_input_device ~= input_device then
				most_recent_input_device = input_device
				most_recent_input_device_type = InputAux.input_device_type_lookup[input_device]
				local device_name = input_device._name
				local allow_cursor_rendering = device_name == "Keyboard" or device_name == "Mouse"

				ShowCursorStack.render_cursor(allow_cursor_rendering)
			end
		end

		table.clear(device_data.consumed_input)
	end

	return 
end
InputManager.get_service = function (self, input_service_name)
	return self.input_services[input_service_name]
end
local disabled_gamepad_dummy = {
	active = function ()
		return false
	end
}
InputManager.get_device = function (self, input_device_type, input_device_slot)
	if gamepad_disabled and input_device_type == "gamepad" then
		return disabled_gamepad_dummy
	end

	local device_list = InputAux.input_device_mapping[input_device_type]

	assert(device_list, "No such input device type: %s", input_device_type)

	input_device_slot = input_device_slot or 1

	return device_list[input_device_slot]
end
InputManager.any_input_pressed = function (self)
	return self.any_device_input_pressed
end
InputManager.any_input_axis_moved = function (self)
	return self.any_device_input_axis_moved
end
InputManager.get_most_recent_device = function (self)
	return most_recent_input_device
end
InputManager.get_most_recent_device_type = function (self)
	return most_recent_input_device_type
end
InputManager.is_device_active = function (self, input_device_type)
	if gamepad_disabled and input_device_type == "gamepad" then
		return false
	end

	return most_recent_input_device_type == input_device_type
end
InputManager.add_filters_data = function (self, filters, name)
	local stored_filters_data = self.stored_filters_data

	fassert(not stored_filters_data[name], "[InputManager] - filters already stored with name: %s", name)

	local new_filters_data = {}

	for filters_name, filters_table in pairs(filters) do
		local new_filters = self.setup_filters(self, filters_table)
		new_filters_data[filters_name] = new_filters
	end

	stored_filters_data[name] = new_filters_data

	dprint("[InputManager] - Add filters data for name: %s", name)

	return 
end
InputManager.update_filters_data = function (self, filters, name)
	local stored_filters_data = self.stored_filters_data
	local current_filters_table = stored_filters_data[name]

	fassert(stored_filters_data[name], "[InputManager] - no filters stored with name: %s", name)

	for filters_name, filters_table in pairs(filters) do
		local current_filters = current_filters_table[filters_name]
		local new_filters = self.setup_filters(self, filters_table)

		table.merge_recursive(current_filters, new_filters)
	end

	dprint("[InputManager] - Updated filters data for name: %s", name)

	return 
end
InputManager.setup_filters = function (self, filters)
	local input_filters = {}

	if filters then
		for filter_output, filter_data in pairs(filters) do
			local filter_type = filter_data.filter_type
			local new_filter_data = {
				function_data = InputFilters[filter_type].init(filter_data) or true,
				filter_output = filter_output,
				filter_type = filter_type,
				filter_function = InputFilters[filter_type].update
			}
			input_filters[filter_output] = new_filter_data
		end
	end

	return input_filters
end
InputManager.filters_data = function (self, name)
	local stored_filters_data = self.stored_filters_data
	local filters_data = stored_filters_data[name]

	fassert(filters_data, "[InputManager] - No filters found by name %s", name)

	return filters_data
end
InputManager.apply_saved_keymaps = function (self, specific_table_name)
	local stored_keymaps_data = self.stored_keymaps_data

	if self.platform == "win32" then
		local keymaps = PlayerData.controls or {}

		for keybinding_table_name, keybinding_table in pairs(keymaps) do
			if (not specific_table_name or specific_table_name == keybinding_table_name) and stored_keymaps_data[keybinding_table_name] then
				self.update_keymaps_data(self, keybinding_table, keybinding_table_name)
			end
		end
	end

	local gamepad_layout = Application.user_setting("gamepad_layout")

	if gamepad_layout then
		local using_left_handed_option = Application.user_setting("gamepad_left_handed")
		local gamepad_keymaps_layout = nil

		if using_left_handed_option then
			gamepad_keymaps_layout = AlternatateGamepadKeymapsLayoutsLeftHanded
		else
			gamepad_keymaps_layout = AlternatateGamepadKeymapsLayouts
		end

		local gamepad_keymaps = gamepad_keymaps_layout[gamepad_layout]

		for keybinding_table_name, keybinding_table in pairs(gamepad_keymaps) do
			if (not specific_table_name or specific_table_name == keybinding_table_name) and stored_keymaps_data[keybinding_table_name] then
				self.update_keymaps_data(self, keybinding_table, keybinding_table_name)
			end
		end
	end

	return 
end
InputManager.set_hovering = function (self, is_hovering)
	self._hovering = self._hovering or is_hovering
	self._frame_hovering = self._frame_hovering or is_hovering

	return 
end
InputManager.is_hovering = function (self)
	return self._hovering
end
InputManager.is_frame_hovering = function (self)
	return self._frame_hovering
end
InputManager.add_keymaps_data = function (self, keymaps, name)
	local stored_keymaps_data = self.stored_keymaps_data
	local save_loaded = SaveData.save_loaded
	local saved_keymaps = PlayerData.controls

	fassert(not stored_keymaps_data[name], "[InputManager] - keymaps already stored with name: %s", name)

	local new_keymaps_data = {}
	stored_keymaps_data[name] = new_keymaps_data

	for keymaps_name, keymaps_table in pairs(keymaps) do
		local new_keymaps, default_data_types = self.setup_keymaps(self, keymaps_table)
		new_keymaps_data[keymaps_name] = {
			keymaps = new_keymaps,
			default_data_types = default_data_types
		}
	end

	if save_loaded then
		self.apply_saved_keymaps(self, name)
	end

	dprint("[InputManager] - Add keymaps data for name: %s", name)

	return 
end
InputManager.update_keymaps_data = function (self, keymaps, name)
	local stored_keymaps_data = self.stored_keymaps_data
	local current_keymaps_table = stored_keymaps_data[name]

	fassert(current_keymaps_table, "[InputManager] - no keymaps stored with name: %s", name)

	for keymaps_name, keymaps_table in pairs(keymaps) do
		local current_keymaps = current_keymaps_table[keymaps_name]
		local new_keymaps, default_data_types = self.setup_keymaps(self, keymaps_table)

		table.merge_recursive(current_keymaps.keymaps, new_keymaps)
		table.merge_recursive(current_keymaps.default_data_types, default_data_types)
	end

	dprint("[InputManager] - Updated keymaps data for name: %s", name)

	return 
end
InputManager.keymaps_data = function (self, name)
	local stored_keymaps_data = self.stored_keymaps_data
	local keymaps_data = stored_keymaps_data[name]

	fassert(keymaps_data, "[InputManager] - No keymaps found by name %s", name)

	return keymaps_data
end
InputManager.setup_keymaps = function (self, keymaps)
	local input_map_types = InputAux.input_map_types
	local input_device_mapping = InputAux.input_device_mapping
	local default_data_types = {}
	local new_keymaps = table.clone(keymaps)

	for name, keymap in pairs(new_keymaps) do
		local n_keymap = #keymap
		keymap.n = n_keymap

		assert(n_keymap/3 == math.floor(n_keymap/3), "An input mapping must be paired by three arguments: device-type, button-name, operation")

		local input_map_type = nil

		for j = 1, n_keymap, 3 do
			local input_device_type = keymap[j]
			local input_device_list = input_device_mapping[input_device_type]
			local input_device = input_device_list[1]
			local current_input_map_type = input_map_types[keymap[j + 2]]

			assert(not input_map_type or input_map_type == current_input_map_type, "Bad input map combination for %q. Combinations must have the same result (%s vs %s)", name, current_input_map_type, input_map_type)

			input_map_type = current_input_map_type
			local key_index = nil
			local input_type = keymap[j + 2]
			local input_key_name = keymap[j + 1]

			if input_key_name ~= UNASSIGNED_KEY then
				if self.platform == "ps4" or self.platform == "xb1" then
					if input_type == "axis" then
						key_index = input_device.axis_index(input_key_name)
					else
						key_index = input_device.button_index(input_key_name)
					end

					if not key_index then
						printf("No such %q %q in input device type %q.", tostring(input_type), input_key_name, input_device_type)
					end
				elseif input_type == "axis" then
					key_index = input_device.axis_index(input_key_name)

					assert(key_index, "No such axis %q in input device type %q.", input_key_name, input_device_type)
				else
					key_index = input_device.button_index(input_key_name)

					assert(key_index, "No such key %q in input device type %q.", input_key_name, input_device_type)
				end
			end

			keymap[j + 1] = key_index or UNASSIGNED_KEY
		end

		default_data_types[name] = input_map_type
	end

	return new_keymaps, default_data_types
end
InputManager.clear_keybinding = function (self, keybinding_table_name, keybinding_table_key, keymap_name)
	local keymaps_data = self.keymaps_data(self, keybinding_table_name)

	assert(keymaps_data, "No keymaps data found under table_name: %s", keybinding_table_name)

	local keymaps_sub_data = keymaps_data[keybinding_table_key]

	assert(keymaps_sub_data, "No keymaps data found under table_key: %s", keybinding_table_key)

	local keymaps = keymaps_sub_data.keymaps

	assert(keymaps, "No keymaps found under %s with table_key: %s", keybinding_table_name, keybinding_table_key)

	local keymap = keymaps[keymap_name]

	assert(keymap, "No such keymap name %s", keymap_name)

	keymap[2] = UNASSIGNED_KEY

	return 
end
InputManager.change_keybinding = function (self, keybinding_table_name, keybinding_table_key, keymap_name, new_button_index, new_device_type)
	assert(type(new_button_index) == "number", "New button index must be a number.")

	local keymaps_data = self.keymaps_data(self, keybinding_table_name)

	assert(keymaps_data, "No keymaps data found under table_name: %s", keybinding_table_name)

	local keymaps_sub_data = keymaps_data[keybinding_table_key]

	assert(keymaps_sub_data, "No keymaps data found under table_key: %s", keybinding_table_key)

	local keymaps = keymaps_sub_data.keymaps

	assert(keymaps, "No keymaps found under %s with table_key: %s", keybinding_table_name, keybinding_table_key)

	local keymapping = keymaps[keymap_name]

	assert(keymapping, "No such keymap name %s", keymap_name)
	assert(InputAux.input_device_mapping[new_device_type], "No such input device type %s", new_device_type)

	keymapping[1] = new_device_type
	keymapping[2] = new_button_index

	return 
end
InputManager.add_keybinding = function (self, keybinding_table_name, keybinding_table_key, keymap_name, ...)
	assert(type(new_button_index) == "number", "New button index must be a number.")

	local keymaps_data = self.keymaps_data(self, keybinding_table_name)

	assert(keymaps_data, "No keymaps data found under table_name: %s", keybinding_table_name)

	local keymaps_sub_data = keymaps_data[keybinding_table_key]

	assert(keymaps_sub_data, "No keymaps data found under table_key: %s", keybinding_table_key)

	local keymaps = keymaps_sub_data.keymaps

	assert(keymaps, "No keymaps found under %s with table_key: %s", keybinding_table_name, keybinding_table_key)

	local keymapping = keymaps[keymap_name]

	assert(keymapping, "No such keymap name %s", keymap_name)

	local n_varargs = select("#", ...)

	assert(n_varargs/3 == math.floor(n_varargs/3), "Bad amount of arguments (%d) to :add_keybinding(). Must supply input device type, keymap button index and keymap type for every key.", n_varargs)

	local new_mapping = {
		n = 0
	}
	keymaps[keymap_name] = new_mapping

	for i = 1, n_varargs/3, 1 do
		local n = new_mapping.n
		local input_device_type = select(i*3 - 2, ...)
		local keymap_button_index = select(i*3 - 1, ...)
		local keymap_type = select(i*3, ...)

		assert(type(keymap_button_index) == "number", "New button index must be a number.")

		local input_device_list = InputAux.input_device_mapping[input_device_type]

		assert(input_device_list, "No such input device type %s", input_device_type)

		local input_device = input_device_list[1]

		if keymap_type ~= "axis" then
			assert(input_device.button_name(keymap_button_index), "No such button index %d in device type %s", keymap_button_index, input_device_type)
		else
			assert(input_device.axis_name(keymap_button_index), "No such axis index %d in device type %s", keymap_button_index, input_device_type)
		end

		assert(InputAux.input_map_types[keymap_type], "Bad keymap type %s to add_keybinding() at vararg %d", keymap_type, i*3)

		new_mapping[n + 1] = input_device_type
		new_mapping[n + 2] = keymap_button_index
		new_mapping[n + 3] = keymap_type
		new_mapping.n = n + 3
	end

	return 
end

return 

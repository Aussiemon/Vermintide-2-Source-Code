InputService = class(InputService)

InputService.init = function (self, input_service_name, keymaps_name, filters_name, block_reasons)
	self.platform = PLATFORM
	self.mapped_devices = {
		gamepad = {},
		mouse = {},
		keyboard = {},
		network = {},
		recording = {}
	}
	self.input_devices_data = {}
	self.name = input_service_name
	self.controller_select = Vector3Box()
	self.block_reasons = block_reasons
	self.keymaps_name = keymaps_name
	self.filters_name = filters_name
	self.input_manager = Managers.input
end

InputService.map_device = function (self, input_device_type, input_device, input_device_data)
	local input_device_type_list = self.mapped_devices[input_device_type]
	input_device_type_list[#input_device_type_list + 1] = input_device
	input_device_type_list.n = #input_device_type_list
	self.input_devices_data[input_device] = input_device_data
end

InputService.unmap_device = function (self, input_device_type, input_device)
	local input_device_type_list = self.mapped_devices[input_device_type]
	local index = table.find(input_device_type_list, input_device)

	if not index then
		Application.warning("[InputService] No mapped input called %s for input service %s", input_device.name(), self.name)

		return
	end

	table.remove(input_device_type_list, index)

	input_device_type_list.n = #input_device_type_list
end

InputService.get = function (self, input_data_name, consume)
	local keymaps, default_data_types = self:get_active_keymaps()
	local keymap_binding = keymaps[input_data_name]
	local input_filters = self:get_active_filters()
	local filter_binding = input_filters and input_filters[input_data_name]

	if keymap_binding then
		local mapped_devices = self.mapped_devices
		local input_devices_data = self.input_devices_data
		local name = self.name
		local action_value = nil
		local n = keymap_binding.n

		if n then
			for j = 1, n, 3 do
				local device_type = keymap_binding[j]
				local key_index = keymap_binding[j + 1]
				local key_action_type = keymap_binding[j + 2]

				if key_index ~= UNASSIGNED_KEY then
					local device_list = mapped_devices[device_type]

					if device_list and device_list.n then
						for k = 1, device_list.n, 1 do
							local input_device = device_list[k]
							local input_device_data = input_devices_data[input_device]

							if input_device:active() and not input_device_data.blocked_access[name] then
								action_value = action_value or input_device_data[key_action_type][key_index]

								if action_value == true then
									if input_device_data.consumed_input[key_index] then
										action_value = nil
									elseif consume then
										input_device_data.consumed_input[key_index] = true
									end
								end
							elseif input_device:active() then
								action_value = nil

								break
							end
						end

						action_value = (device_list.n > 0 and action_value) or nil

						if not action_value then
							break
						end
					end
				end
			end
		end

		if action_value == nil then
			action_value = InputAux.default_values_for_types[default_data_types[input_data_name]]
		end

		return action_value
	elseif filter_binding then
		local function_data = filter_binding.function_data
		local value = InputFilters[function_data.filter_type].update(function_data, self)

		return value
	end
end

InputService.get_controller_cursor_position = function (self)
	return self.controller_select:unbox()
end

InputService.set_controller_cursor_position = function (self, x, y, z)
	self.controller_select:store(x, y, z)
end

InputService.get_active_keymaps = function (self, optional_platform)
	local platform = optional_platform or self.platform

	if not optional_platform and platform == "win32" and self.input_manager:is_device_active("gamepad") then
		platform = "xb1"
	end

	local keymaps_name = self.keymaps_name
	local keymaps_data = self.input_manager:keymaps_data(keymaps_name)
	local data = keymaps_data[platform]

	return data.keymaps, data.default_data_types
end

InputService.get_active_filters = function (self, optional_platform)
	local filters_name = self.filters_name

	if not filters_name then
		return
	end

	local platform = optional_platform or self.platform

	if not optional_platform and platform == "win32" and self.input_manager:is_device_active("gamepad") then
		platform = "xb1"
	end

	local filters_data = self.input_manager:filters_data(filters_name)
	local filters = filters_data[platform]

	return filters
end

InputService.get_keymapping = function (self, keymap_name, optional_platform)
	local keymaps = self:get_active_keymaps(optional_platform)

	return keymaps[keymap_name]
end

InputService.add_keymap = function (self, keymap_name)
	local keymaps = self:get_active_keymaps()
	local keymapping = not keymaps[keymap_name]

	fassert(keymapping, "Keymap already exists: name %s in service %s", keymap_name, input_service_name)

	keymaps[keymap_name] = {
		input_mappings = {
			n = 0
		}
	}
end

InputService.remove_keymap = function (self, keymap_name)
	local keymaps = self:get_active_keymaps()
	local keymapping = keymaps[keymap_name]

	fassert(keymapping, "No such keymap name %s in service %s", keymap_name, self.name)

	keymaps[keymap_name] = nil
end

InputService.generate_keybinding_setting = function (self)
	local new_keymaps = {}
	local keymaps = self:get_active_keymaps()

	for keymap_name, keymap_data in pairs(keymaps) do
		local new_keymap_data = {}
		new_keymaps[keymap_name] = {
			input_mappings = new_keymap_data,
			combination_type = keymap_data.combination_type
		}

		for i = 1, keymap_data.input_mappings.n, 1 do
			local new_binding = {}
			new_keymap_data[i] = new_binding
			local current_binding = keymap_data.input_mappings[i]

			for j = 1, current_binding.n, 3 do
				local device_type = current_binding[j]
				new_binding[j] = device_type
				local input_device = InputAux.input_device_mapping[device_type][1]
				local key_name = nil

				if current_binding[j + 2] == "axis" then
					key_name = input_device.axis_name(current_binding[j + 1])
				else
					key_name = input_device.button_name(current_binding[j + 1])

					assert(current_binding[j + 1] == input_device.button_index(key_name))
				end

				new_binding[j + 1] = key_name
				new_binding[j + 2] = current_binding[j + 2]
			end
		end
	end

	return new_keymaps
end

InputService.generate_filters_setting = function (self)
	local new_filters = {}
	local input_filters = self:get_active_filters()

	if input_filters then
		for filter_output, filter_data in pairs(input_filters) do
			local new_filter_data = table.clone(filter_data.function_data)
			new_filter_data.filter_type = filter_data.filter_type
			new_filters[filter_output] = new_filter_data
		end
	end

	return new_filters
end

InputService.has = function (self, keymap_name)
	local keymaps = self:get_active_keymaps()
	local input_filters = self:get_active_filters()

	return keymaps[keymap_name] or (input_filters and input_filters[keymap_name] and true) or false
end

InputService.is_blocked = function (self)
	return self.service_is_blocked
end

InputService.set_blocked = function (self, is_blocked)
	self.service_is_blocked = is_blocked
end

InputService.set_hover = function (self, hover)
	self.hovering = self.hovering or hover
end

InputService.is_hovering = function (self)
	return self.hovering
end

return

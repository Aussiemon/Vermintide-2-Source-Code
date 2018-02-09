InputAux = InputAux or {}
local InputAux = InputAux

local function synergy_wrapper(device_name)
	local wrapper = {}
	local device = rawget(_G, device_name)

	if not device then
		return nil
	end

	for k, v in pairs(device) do
		wrapper[k] = v
	end

	wrapper.button_index = function (key)
		local index = device.button_index(key)

		if index == nil then
			index = 1
		end

		return index
	end
	wrapper.pressed = function (key)
		local pressed = device.pressed(key)

		if pressed and key ~= 0 and key ~= 22 then
		end

		return pressed
	end

	return wrapper
end

InputAux.input_device_mapping = InputAux.input_device_mapping or {
	gamepad = {
		rawget(_G, "Pad1"),
		rawget(_G, "Pad2"),
		rawget(_G, "Pad3"),
		rawget(_G, "Pad4"),
		rawget(_G, "Pad5"),
		rawget(_G, "Pad6"),
		rawget(_G, "Pad7"),
		rawget(_G, "Pad8")
	},
	mouse = {
		rawget(_G, "Mouse")
	},
	keyboard = {
		rawget(_G, "Keyboard")
	},
	network = {
		NetworkInputDevice
	},
	recording = {
		PlayRecordingInputDevice
	},
	synergy_mouse = {
		rawget(_G, "SynergyMouse")
	},
	synergy_keyboard = {
		synergy_wrapper("SynergyKeyboard")
	}
}

if not InputAux.input_device_type_lookup then
	InputAux.input_device_type_lookup = {}

	for device_type, device_list in pairs(InputAux.input_device_mapping) do
		for _, device in ipairs(device_list) do
			InputAux.input_device_type_lookup[device] = device_type
		end
	end
end

InputAux.input_map_types = {
	soft_button = "number",
	released = "boolean",
	axis = "Vector3",
	pressed = "boolean",
	held = "boolean"
}
InputAux.get_device_type = function (device)
	if not type(device) == "table" then
		assert(false, "[InputAux.get_device_type] You need to pass a table")
	end

	fassert(InputAux.input_device_type_lookup[device], "[InputAux.get_device_type] There is no mapping for device %s", (device and device.type and device.type(device)) or device)

	return InputAux.input_device_type_lookup[device]
end
InputAux.remove_device = function (input_device_type, input_device)
	local index = table.find(InputAux.input_device_mapping[input_device_type], input_device)

	fassert(index, "[InputAux] There is no controller with the name %s available", input_device.name())
	table.remove(InputAux.input_device_mapping[input_device_type], index)

	return 
end
InputAux.add_device = function (input_device_type, input_device)
	InputAux.input_device_mapping[input_device_type][#InputAux.input_device_mapping[input_device_type] + 1] = input_device

	return 
end
InputAux.combination_functions = {
	max = math.max,
	min = math.min,
	add = function (lhs, rhs)
		return lhs + rhs
	end,
	sub = function (lhs, rhs)
		return lhs - rhs
	end,
	mul = function (lhs, rhs)
		return lhs*rhs
	end,
	avg = function (lhs, rhs)
		return (lhs + rhs)/2
	end,
	or = function (lhs, rhs)
		return lhs or rhs
	end,
	and = function (lhs, rhs)
		return lhs and rhs
	end
}
InputAux.default_values_for_types = {
	boolean = false,
	number = 0
}
TestKeyMap = {
	super_attack = {
		input_mappings = {
			{
				"keyboard",
				"left shift",
				"held",
				"mouse",
				"right",
				"pressed"
			}
		}
	},
	weak_attack = {
		input_mappings = {
			{
				"keyboard",
				"k",
				"held"
			}
		}
	},
	move_up = {
		combination_type = "max",
		input_mappings = {
			{
				"keyboard",
				"oem_comma (< ,)",
				"soft_button"
			},
			{
				"mouse",
				"right",
				"soft_button"
			}
		}
	},
	move_down = {
		input_mappings = {
			{
				"keyboard",
				"o",
				"soft_button"
			}
		}
	},
	move_left = {
		input_mappings = {
			{
				"keyboard",
				"e",
				"soft_button"
			}
		}
	},
	move_right = {
		input_mappings = {
			{
				"keyboard",
				"a",
				"soft_button"
			}
		}
	}
}
TestFilters = {
	move = {
		filter_type = "virtual_axis",
		input_mappings = {
			down = "move_down",
			up = "move_up",
			left = "move_left",
			right = "move_right"
		}
	}
}

return 

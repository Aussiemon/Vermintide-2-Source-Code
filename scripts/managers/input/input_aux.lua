-- chunkname: @scripts/managers/input/input_aux.lua

InputAux = InputAux or {}

local InputAux = InputAux

InputAux.input_device_mapping = InputAux.input_device_mapping or {
	gamepad = {
		rawget(_G, "Pad1"),
		rawget(_G, "Pad2"),
		rawget(_G, "Pad3"),
		rawget(_G, "Pad4"),
		rawget(_G, "Pad5"),
		rawget(_G, "Pad6"),
		rawget(_G, "Pad7"),
		rawget(_G, "Pad8"),
	},
	mouse = {
		rawget(_G, "Mouse"),
	},
	keyboard = {
		rawget(_G, "Keyboard"),
	},
	network = {
		NetworkInputDevice,
	},
	recording = {
		PlayRecordingInputDevice,
	},
}

if not InputAux.input_device_mapping.ps_pad then
	InputAux.input_device_mapping.ps_pad = {}

	local device_list = InputAux.input_device_mapping.gamepad

	for _, device in ipairs(device_list) do
		local controller_type = device.type()

		if controller_type == "sce_pad" then
			InputAux.input_device_mapping.ps_pad[#InputAux.input_device_mapping.ps_pad + 1] = device
		end
	end
end

if not InputAux.input_device_type_lookup then
	InputAux.input_device_type_lookup = {}

	for device_type, device_list in pairs(InputAux.input_device_mapping) do
		for _, device in ipairs(device_list) do
			InputAux.input_device_type_lookup[device] = device_type
		end
	end
end

InputAux.input_map_types = {
	axis = "Vector3",
	held = "boolean",
	pressed = "boolean",
	released = "boolean",
	soft_button = "number",
}

InputAux.get_device_type = function (device)
	return InputAux.input_device_type_lookup[device]
end

InputAux.remove_device = function (input_device_type, input_device)
	local index = table.find(InputAux.input_device_mapping[input_device_type], input_device)

	fassert(index, "[InputAux] There is no controller with the name %s available", input_device.name())
	table.remove(InputAux.input_device_mapping[input_device_type], index)
end

InputAux.add_device = function (input_device_type, input_device)
	InputAux.input_device_mapping[input_device_type][#InputAux.input_device_mapping[input_device_type] + 1] = input_device
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
		return lhs * rhs
	end,
	avg = function (lhs, rhs)
		return (lhs + rhs) / 2
	end,
	["or"] = function (lhs, rhs)
		return lhs or rhs
	end,
	["and"] = function (lhs, rhs)
		return lhs and rhs
	end,
}
InputAux.default_values_for_types = {
	boolean = false,
	number = 0,
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
				"pressed",
			},
		},
	},
	weak_attack = {
		input_mappings = {
			{
				"keyboard",
				"k",
				"held",
			},
		},
	},
	move_up = {
		combination_type = "max",
		input_mappings = {
			{
				"keyboard",
				"oem_comma (< ,)",
				"soft_button",
			},
			{
				"mouse",
				"right",
				"soft_button",
			},
		},
	},
	move_down = {
		input_mappings = {
			{
				"keyboard",
				"o",
				"soft_button",
			},
		},
	},
	move_left = {
		input_mappings = {
			{
				"keyboard",
				"e",
				"soft_button",
			},
		},
	},
	move_right = {
		input_mappings = {
			{
				"keyboard",
				"a",
				"soft_button",
			},
		},
	},
}
TestFilters = {
	move = {
		filter_type = "virtual_axis",
		input_mappings = {
			down = "move_down",
			left = "move_left",
			right = "move_right",
			up = "move_up",
		},
	},
}

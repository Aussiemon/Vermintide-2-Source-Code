-- chunkname: @scripts/utils/debug_keymap.lua

require("scripts/utils/input_helper")

DebugKeymap = {}
DebugInputFilters = {}

local valid_debug_build = BUILD == "dev" or BUILD == "debug"
local keyboard_device = "keyboard"
local keyboard_keymaps = {
	f1 = {
		keyboard_device,
		"f1",
		"pressed",
	},
	f2 = {
		keyboard_device,
		"f2",
		"pressed",
	},
	f3 = {
		keyboard_device,
		"f3",
		"pressed",
	},
	f4 = {
		keyboard_device,
		"f4",
		"pressed",
	},
	f5 = {
		keyboard_device,
		"f5",
		"pressed",
	},
	f6 = {
		keyboard_device,
		"f6",
		"pressed",
	},
	f7 = {
		keyboard_device,
		"f7",
		"pressed",
	},
	f8 = {
		keyboard_device,
		"f8",
		"pressed",
	},
	f9 = {
		keyboard_device,
		"f9",
		"pressed",
	},
	f10 = {
		keyboard_device,
		"f10",
		"pressed",
	},
	f11 = {
		keyboard_device,
		"f11",
		"pressed",
	},
	f12 = {
		keyboard_device,
		"f12",
		"pressed",
	},
	["page up"] = {
		keyboard_device,
		"page up",
		"pressed",
	},
	["page down"] = {
		keyboard_device,
		"page down",
		"pressed",
	},
	home = {
		keyboard_device,
		"home",
		"pressed",
	},
	["end"] = {
		keyboard_device,
		"end",
		"pressed",
	},
	["left ctrl"] = {
		keyboard_device,
		"left ctrl",
		"held",
	},
	["left shift"] = {
		keyboard_device,
		"left shift",
		"held",
	},
	["right ctrl"] = {
		keyboard_device,
		"right ctrl",
		"held",
	},
	["left alt"] = {
		keyboard_device,
		"left alt",
		"held",
	},
	right_key = {
		keyboard_device,
		"right",
		"pressed",
	},
	left_key = {
		keyboard_device,
		"left",
		"pressed",
	},
	up_key = {
		keyboard_device,
		"up",
		"held",
	},
	down_key = {
		keyboard_device,
		"down",
		"held",
	},
	enter_key = {
		keyboard_device,
		"enter",
		"pressed",
	},
	backspace = {
		keyboard_device,
		"backspace",
		"pressed",
	},
	numpad_plus = {
		keyboard_device,
		"numpad +",
		"pressed",
	},
	numpad_minus = {
		keyboard_device,
		"num -",
		"pressed",
	},
	a = {
		keyboard_device,
		"a",
		"pressed",
	},
	b = {
		keyboard_device,
		"b",
		"pressed",
	},
	c = {
		keyboard_device,
		"c",
		"pressed",
	},
	d = {
		keyboard_device,
		"d",
		"pressed",
	},
	e = {
		keyboard_device,
		"e",
		"pressed",
	},
	f = {
		keyboard_device,
		"f",
		"pressed",
	},
	g = {
		keyboard_device,
		"g",
		"pressed",
	},
	h = {
		keyboard_device,
		"h",
		"pressed",
	},
	h_held = {
		keyboard_device,
		"h",
		"held",
	},
	i = {
		keyboard_device,
		"i",
		"pressed",
	},
	j = {
		keyboard_device,
		"j",
		"pressed",
	},
	k = {
		keyboard_device,
		"k",
		"pressed",
	},
	l = {
		keyboard_device,
		"l",
		"pressed",
	},
	m = {
		keyboard_device,
		"m",
		"pressed",
	},
	n = {
		keyboard_device,
		"n",
		"pressed",
	},
	o = {
		keyboard_device,
		"o",
		"pressed",
	},
	p = {
		keyboard_device,
		"p",
		"pressed",
	},
	q = {
		keyboard_device,
		"q",
		"pressed",
	},
	r = {
		keyboard_device,
		"r",
		"pressed",
	},
	s = {
		keyboard_device,
		"s",
		"pressed",
	},
	t = {
		keyboard_device,
		"t",
		"pressed",
	},
	u = {
		keyboard_device,
		"u",
		"pressed",
	},
	v = {
		keyboard_device,
		"v",
		"pressed",
	},
	w = {
		keyboard_device,
		"w",
		"pressed",
	},
	x = {
		keyboard_device,
		"x",
		"pressed",
	},
	y = {
		keyboard_device,
		"y",
		"pressed",
	},
	z = {
		keyboard_device,
		"z",
		"pressed",
	},
	esc = {
		keyboard_device,
		"esc",
		"pressed",
	},
	activate_chat_input = {
		keyboard_device,
		"y",
		"pressed",
	},
	console_open_key = {
		keyboard_device,
		"end",
		"pressed",
	},
	console_favorite_key = {
		keyboard_device,
		"f",
		"pressed",
	},
	console_search_key = {
		keyboard_device,
		"backspace",
		"pressed",
	},
	cursor = {
		"mouse",
		"cursor",
		"axis",
	},
	look = {
		"mouse",
		"mouse",
		"axis",
	},
	mouse_left_held = {
		"mouse",
		"left",
		"held",
	},
	mouse_middle_held = {
		"mouse",
		"middle",
		"held",
	},
	mouse_right_held = {
		"mouse",
		"right",
		"held",
	},
}

DebugKeymap.win32 = InputUtils.keymaps_key_approved("win32") and keyboard_keymaps
DebugInputFilters.win32 = InputUtils.keymaps_key_approved("win32") and {
	console_mod_key = {
		filter_type = "or",
		input_mappings = {
			["left ctrl"] = "left ctrl",
			["right ctrl"] = "right ctrl",
		},
	},
}
DebugKeymap.xb1 = InputUtils.keymaps_key_approved("xb1") and {
	left_thumb = {
		"gamepad",
		"left_thumb",
		"held",
	},
	right_thumb = {
		"gamepad",
		"right_thumb",
		"held",
	},
	right_trigger = {
		"gamepad",
		"right_trigger",
		"held",
	},
	right_trigger_soft = {
		"gamepad",
		"right_trigger",
		"soft_button",
	},
	right_shoulder = {
		"gamepad",
		"right_shoulder",
		"held",
	},
	left_trigger = {
		"gamepad",
		"left_trigger",
		"held",
	},
	left_trigger_soft = {
		"gamepad",
		"left_trigger",
		"soft_button",
	},
	left_shoulder = {
		"gamepad",
		"left_shoulder",
		"held",
	},
	d_down = {
		"gamepad",
		"d_down",
		"pressed",
	},
	d_left = {
		"gamepad",
		"d_left",
		"pressed",
	},
	d_right = {
		"gamepad",
		"d_right",
		"pressed",
	},
	d_up = {
		"gamepad",
		"d_up",
		"pressed",
	},
	x = {
		"gamepad",
		"x",
		"pressed",
	},
	y = {
		"gamepad",
		"y",
		"pressed",
	},
	b = {
		"gamepad",
		"b",
		"pressed",
	},
	exclusive_right_key = {
		"gamepad",
		"d_right",
		"pressed",
	},
	left_key = {
		"gamepad",
		"d_left",
		"pressed",
	},
	up_key = {
		"gamepad",
		"d_up",
		"held",
	},
	down_key = {
		"gamepad",
		"d_down",
		"held",
	},
	right_shoulder_held = {
		"gamepad",
		"right_shoulder",
		"held",
	},
	look_raw = {
		"gamepad",
		"right",
		"axis",
	},
	console_favorite_key = {
		"gamepad",
		"y",
		"pressed",
	},
	["left ctrl"] = {},
	["left shift"] = {},
}
DebugInputFilters.xb1 = InputUtils.keymaps_key_approved("xb1") and {
	n_switch = {
		filter_type = "and",
		input_mappings = {
			d_left = "d_left",
			left_thumb = "left_thumb",
			right_trigger = "right_trigger",
		},
	},
	n = {
		filter_type = "and",
		input_mappings = {
			d_up = "d_up",
			left_thumb = "left_thumb",
			right_trigger = "right_trigger",
		},
	},
	o = {
		filter_type = "and",
		input_mappings = {
			d_left = "d_left",
			left_thumb = "left_thumb",
			left_trigger = "left_trigger",
		},
	},
	p = {
		filter_type = "and",
		input_mappings = {
			d_up = "d_up",
			left_thumb = "left_thumb",
			left_trigger = "left_trigger",
		},
	},
	l = {
		filter_type = "and",
		input_mappings = {
			d_down = "d_down",
			left_thumb = "left_thumb",
		},
	},
	u = {
		filter_type = "and",
		input_mappings = {
			d_down = "d_down",
			left_thumb = "left_thumb",
			left_trigger = "left_trigger",
		},
	},
	c = {
		filter_type = "and",
		input_mappings = {
			d_up = "d_up",
			left_thumb = "left_thumb",
		},
	},
	home = {
		filter_type = "and",
		input_mappings = {
			right_thumb = "right_thumb",
			x = "x",
		},
	},
	v = {
		filter_type = "and",
		input_mappings = {
			right_thumb = "right_thumb",
			y = "y",
		},
	},
	show_behaviour = {
		filter_type = "and",
		input_mappings = {
			b = "b",
			right_thumb = "right_thumb",
		},
	},
	right_key = {
		filter_type = "and",
		input_mappings = {
			d_right = "d_right",
			left_thumb = "left_thumb",
		},
	},
	time_scale = {
		filter_type = "and",
		input_mappings = {
			left_thumb = "left_thumb",
			right_thumb = "right_thumb",
		},
	},
	time_scale_axis = {
		filter_type = "sub",
		input_mappings = {
			left_trigger_soft = "left_trigger_soft",
			right_trigger_soft = "right_trigger_soft",
		},
	},
}
DebugKeymap.ps4 = InputUtils.keymaps_key_approved("ps4") and {
	l3 = {
		"gamepad",
		"l3",
		"held",
	},
	r3 = {
		"gamepad",
		"r3",
		"held",
	},
	l2 = {
		"gamepad",
		"l2",
		"held",
	},
	r2 = {
		"gamepad",
		"r2",
		"held",
	},
	l1 = {
		"gamepad",
		"l1",
		"held",
	},
	r1 = {
		"gamepad",
		"r1",
		"held",
	},
	l2_soft = {
		"gamepad",
		"l2",
		"soft_button",
	},
	r2_soft = {
		"gamepad",
		"r2",
		"soft_button",
	},
	left = {
		"gamepad",
		"left",
		"pressed",
	},
	right = {
		"gamepad",
		"right",
		"pressed",
	},
	up = {
		"gamepad",
		"up",
		"pressed",
	},
	down = {
		"gamepad",
		"down",
		"pressed",
	},
	circle = {
		"gamepad",
		"circle",
		"pressed",
	},
	b = {
		"gamepad",
		"b",
		"pressed",
	},
	mouse_middle_held = {
		"gamepad",
		"l2",
		"held",
	},
	exclusive_right_key = {
		"gamepad",
		"right",
		"pressed",
	},
	left_key = {
		"gamepad",
		"left",
		"pressed",
	},
	up_key = {
		"gamepad",
		"up",
		"held",
	},
	down_key = {
		"gamepad",
		"down",
		"held",
	},
	right_shoulder_held = {
		"gamepad",
		"right_shoulder",
		"held",
	},
	look_raw = {
		"gamepad",
		"right",
		"axis",
	},
	console_favorite_key = {
		"gamepad",
		"triangle",
		"pressed",
	},
}
DebugKeymap.ps_pad = InputUtils.keymaps_key_approved("ps_pad") and {
	l3 = {
		"ps_pad",
		"l3",
		"held",
	},
	r3 = {
		"ps_pad",
		"r3",
		"held",
	},
	l2 = {
		"ps_pad",
		"l2",
		"held",
	},
	r2 = {
		"ps_pad",
		"r2",
		"held",
	},
	l1 = {
		"ps_pad",
		"l1",
		"held",
	},
	r1 = {
		"ps_pad",
		"r1",
		"held",
	},
	l2_soft = {
		"ps_pad",
		"l2",
		"soft_button",
	},
	r2_soft = {
		"ps_pad",
		"r2",
		"soft_button",
	},
	left = {
		"ps_pad",
		"left",
		"pressed",
	},
	right = {
		"ps_pad",
		"right",
		"pressed",
	},
	up = {
		"ps_pad",
		"up",
		"pressed",
	},
	down = {
		"ps_pad",
		"down",
		"pressed",
	},
	circle = {
		"ps_pad",
		"circle",
		"pressed",
	},
	b = {
		"ps_pad",
		"circle",
		"pressed",
	},
	mouse_middle_held = {
		"ps_pad",
		"l2",
		"held",
	},
	exclusive_right_key = {
		"ps_pad",
		"right",
		"pressed",
	},
	left_key = {
		"ps_pad",
		"left",
		"pressed",
	},
	up_key = {
		"ps_pad",
		"up",
		"held",
	},
	down_key = {
		"ps_pad",
		"down",
		"held",
	},
	right_shoulder_held = {
		"ps_pad",
		"r1",
		"held",
	},
	look_raw = {
		"ps_pad",
		"right",
		"axis",
	},
	console_favorite_key = {
		"ps_pad",
		"triangle",
		"pressed",
	},
}

local DebugInputFilters_ps4 = {
	n_switch = {
		filter_type = "and",
		input_mappings = {
			l3 = "l3",
			left = "left",
			r2 = "r2",
		},
	},
	n = {
		filter_type = "and",
		input_mappings = {
			l3 = "l3",
			r2 = "r2",
			up = "up",
		},
	},
	o = {
		filter_type = "and",
		input_mappings = {
			l2 = "l2",
			l3 = "l3",
			left = "left",
		},
	},
	p = {
		filter_type = "and",
		input_mappings = {
			l2 = "l2",
			l3 = "l3",
			up = "up",
		},
	},
	l = {
		filter_type = "and",
		input_mappings = {
			down = "down",
			l3 = "l3",
		},
	},
	u = {
		filter_type = "and",
		input_mappings = {
			down = "down",
			l2 = "l2",
			l3 = "l3",
		},
	},
	c = {
		filter_type = "and",
		input_mappings = {
			l3 = "l3",
			up = "up",
		},
	},
	v = {
		filter_type = "or",
		input_mappings = {
			r3 = "r3",
		},
	},
	b = {
		filter_type = "and",
		input_mappings = {
			l2 = "l2",
			left = "left",
		},
	},
	h = {
		filter_type = "and",
		input_mappings = {
			circle = "circle",
			l3 = "l3",
			r3 = "r3",
		},
	},
	right_key = {
		filter_type = "and",
		input_mappings = {
			l3 = "l3",
			right = "right",
		},
	},
	time_scale = {
		filter_type = "and",
		input_mappings = {
			l3 = "l3",
			r3 = "r3",
		},
	},
	time_scale_axis = {
		filter_type = "sub",
		input_mappings = {
			l2_soft = "l2_soft",
			r2_soft = "r2_soft",
		},
	},
	look = {
		filter_type = "scale_vector3",
		input_mapping = "look_raw",
		multiplier = 10,
	},
}

DebugInputFilters.ps4 = InputUtils.keymaps_key_approved("ps4") and DebugInputFilters_ps4
DebugInputFilters.ps_pad = InputUtils.keymaps_key_approved("ps_pad") and DebugInputFilters_ps4

-- chunkname: @foundation/scripts/managers/free_flight/free_flight_controller_settings.lua

FreeFlightControllerSettings = FreeFlightControllerSettings or {}
FreeFlightControllerSettings.keyboard_mouse = {
	quit_game = {
		controller_type = "keyboard",
		func = "pressed",
		key = "esc",
	},
	exit_freeflight = {
		controller_type = "keyboard",
		func = "pressed",
		key = "f9",
	},
	enter_top_down = {
		controller_type = "keyboard",
		func = "pressed",
		key = "f8",
	},
	set_drop_position = {
		controller_type = "keyboard",
		func = "pressed",
		key = "enter",
	},
	toggle_debug_info = {
		controller_type = "keyboard",
		func = "pressed",
		key = "f12",
	},
	move_forward = {
		controller_type = "keyboard",
		func = "button",
		key = "w",
	},
	move_left = {
		controller_type = "keyboard",
		func = "button",
		key = "d",
	},
	move_right = {
		controller_type = "keyboard",
		func = "button",
		key = "a",
	},
	move_back = {
		controller_type = "keyboard",
		func = "button",
		key = "s",
	},
	move_down = {
		controller_type = "keyboard",
		func = "button",
		key = "q",
	},
	move_up = {
		controller_type = "keyboard",
		func = "button",
		key = "e",
	},
	look = {
		controller_type = "mouse",
		func = "axis",
		key = "mouse",
	},
	increase_fov = {
		controller_type = "keyboard",
		func = "pressed",
		key = "numpad +",
	},
	decrease_fov = {
		controller_type = "keyboard",
		func = "pressed",
		key = "num -",
	},
	move = {
		controller_type = "mouse",
		func = "filter",
		type = "FilterVirtualAxis",
		input = {
			neg_x = "move_right",
			neg_y = "move_back",
			neg_z = "move_down",
			pos_x = "move_left",
			pos_y = "move_forward",
			pos_z = "move_up",
		},
	},
	speed_change = {
		controller_type = "mouse",
		func = "axis",
		key = "wheel",
	},
	ray = {
		controller_type = "mouse",
		func = "pressed",
		key = "left",
	},
	toggle_mouse_focus = {
		controller_type = "mouse",
		func = "pressed",
		key = "right",
	},
	cursor = {
		input_mappings = {
			{
				"mouse",
				"cursor",
				"axis",
			},
		},
	},
}
FreeFlightControllerSettings.pad360 = {
	quit_game = {
		controller_type = "pad",
		func = "pressed",
		key = "back",
	},
	exit_freeflight = {
		controller_type = "pad",
		func = "pressed",
		key = "right_thumb",
	},
	set_drop_position = {
		controller_type = "pad",
		func = "pressed",
		key = "a",
	},
	toggle_debug_info = {
		controller_type = "pad",
		func = "pressed",
		key = "y",
	},
	move_down = {
		controller_type = "pad",
		func = "button",
		key = "left_shoulder",
	},
	move_up = {
		controller_type = "pad",
		func = "button",
		key = "right_shoulder",
	},
	look_inv = {
		controller_type = "pad",
		func = "axis",
		key = "right",
	},
	look = {
		controller_type = "pad",
		func = "filter",
		type = "FilterInvertAxisY",
		input = {
			axis = "look_inv",
			scale = 5,
		},
	},
	speed_inc = {
		controller_type = "pad",
		func = "button",
		key = "left_trigger",
	},
	speed_dec = {
		controller_type = "pad",
		func = "button",
		key = "right_trigger",
	},
	speed_change = {
		controller_type = "pad",
		func = "filter",
		type = "FilterVirtualAxis",
		input = {
			neg_y = "speed_dec",
			pos_y = "speed_inc",
			scale = 0.25,
		},
	},
	move = {
		controller_type = "pad",
		func = "axis",
		key = "left",
	},
	increase_fov = {
		controller_type = "pad",
		func = "pressed",
		key = "up",
	},
	decrease_fov = {
		controller_type = "pad",
		func = "pressed",
		key = "down",
	},
}
FreeFlightControllerSettings.padps3 = {
	exit_freeflight = {
		controller_type = "pad",
		func = "pressed",
		key = "right_thumb",
	},
	set_drop_position = {
		controller_type = "pad",
		func = "pressed",
		key = "cross",
	},
	toggle_debug_info = {
		controller_type = "pad",
		func = "pressed",
		key = "triangle",
	},
	move_down = {
		controller_type = "pad",
		func = "button",
		key = "l1_trigger",
	},
	move_up = {
		controller_type = "pad",
		func = "button",
		key = "r1_trigger",
	},
	look_inv = {
		controller_type = "pad",
		func = "axis",
		key = "right",
	},
	look = {
		controller_type = "pad",
		func = "filter",
		type = "FilterInvertAxisY",
		input = {
			axis = "look_inv",
			scale = 5,
		},
	},
	speed_inc = {
		controller_type = "pad",
		func = "button",
		key = "l2_trigger",
	},
	speed_dec = {
		controller_type = "pad",
		func = "button",
		key = "r2_trigger",
	},
	speed_change = {
		controller_type = "pad",
		func = "filter",
		type = "FilterVirtualAxis",
		input = {
			neg_y = "speed_dec",
			pos_y = "speed_inc",
			scale = 0.25,
		},
	},
	move = {
		controller_type = "pad",
		func = "axis",
		key = "left",
	},
	increase_fov = {
		controller_type = "pad",
		func = "pressed",
		key = "up",
	},
	decrease_fov = {
		controller_type = "pad",
		func = "pressed",
		key = "down",
	},
}

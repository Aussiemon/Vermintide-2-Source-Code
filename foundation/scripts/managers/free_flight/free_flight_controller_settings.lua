FreeFlightControllerSettings = FreeFlightControllerSettings or {}
FreeFlightControllerSettings.keyboard_mouse = {
	quit_game = {
		controller_type = "keyboard",
		key = "esc",
		func = "pressed"
	},
	exit_freeflight = {
		controller_type = "keyboard",
		key = "f9",
		func = "pressed"
	},
	enter_top_down = {
		controller_type = "keyboard",
		key = "f8",
		func = "pressed"
	},
	set_drop_position = {
		controller_type = "keyboard",
		key = "enter",
		func = "pressed"
	},
	toggle_debug_info = {
		controller_type = "keyboard",
		key = "f12",
		func = "pressed"
	},
	move_forward = {
		controller_type = "keyboard",
		key = "w",
		func = "button"
	},
	move_left = {
		controller_type = "keyboard",
		key = "d",
		func = "button"
	},
	move_right = {
		controller_type = "keyboard",
		key = "a",
		func = "button"
	},
	move_back = {
		controller_type = "keyboard",
		key = "s",
		func = "button"
	},
	move_down = {
		controller_type = "keyboard",
		key = "q",
		func = "button"
	},
	move_up = {
		controller_type = "keyboard",
		key = "e",
		func = "button"
	},
	look = {
		controller_type = "mouse",
		key = "mouse",
		func = "axis"
	},
	increase_fov = {
		controller_type = "keyboard",
		key = "numpad +",
		func = "pressed"
	},
	decrease_fov = {
		controller_type = "keyboard",
		key = "num -",
		func = "pressed"
	},
	move = {
		type = "FilterVirtualAxis",
		controller_type = "mouse",
		func = "filter",
		input = {
			neg_y = "move_back",
			pos_x = "move_left",
			neg_x = "move_right",
			pos_z = "move_up",
			neg_z = "move_down",
			pos_y = "move_forward"
		}
	},
	speed_change = {
		controller_type = "mouse",
		key = "wheel",
		func = "axis"
	},
	ray = {
		controller_type = "mouse",
		key = "left",
		func = "pressed"
	},
	toggle_mouse_focus = {
		controller_type = "mouse",
		key = "right",
		func = "pressed"
	},
	cursor = {
		input_mappings = {
			{
				"mouse",
				"cursor",
				"axis"
			}
		}
	}
}
FreeFlightControllerSettings.pad360 = {
	quit_game = {
		controller_type = "pad",
		key = "back",
		func = "pressed"
	},
	exit_freeflight = {
		controller_type = "pad",
		key = "right_thumb",
		func = "pressed"
	},
	set_drop_position = {
		controller_type = "pad",
		key = "a",
		func = "pressed"
	},
	toggle_debug_info = {
		controller_type = "pad",
		key = "y",
		func = "pressed"
	},
	move_down = {
		controller_type = "pad",
		key = "left_shoulder",
		func = "button"
	},
	move_up = {
		controller_type = "pad",
		key = "right_shoulder",
		func = "button"
	},
	look_inv = {
		controller_type = "pad",
		key = "right",
		func = "axis"
	},
	look = {
		type = "FilterInvertAxisY",
		controller_type = "pad",
		func = "filter",
		input = {
			scale = 5,
			axis = "look_inv"
		}
	},
	speed_inc = {
		controller_type = "pad",
		key = "left_trigger",
		func = "button"
	},
	speed_dec = {
		controller_type = "pad",
		key = "right_trigger",
		func = "button"
	},
	speed_change = {
		type = "FilterVirtualAxis",
		controller_type = "pad",
		func = "filter",
		input = {
			neg_y = "speed_dec",
			scale = 0.25,
			pos_y = "speed_inc"
		}
	},
	move = {
		controller_type = "pad",
		key = "left",
		func = "axis"
	},
	increase_fov = {
		controller_type = "pad",
		key = "up",
		func = "pressed"
	},
	decrease_fov = {
		controller_type = "pad",
		key = "down",
		func = "pressed"
	}
}
FreeFlightControllerSettings.padps3 = {
	exit_freeflight = {
		controller_type = "pad",
		key = "right_thumb",
		func = "pressed"
	},
	set_drop_position = {
		controller_type = "pad",
		key = "cross",
		func = "pressed"
	},
	toggle_debug_info = {
		controller_type = "pad",
		key = "triangle",
		func = "pressed"
	},
	move_down = {
		controller_type = "pad",
		key = "l1_trigger",
		func = "button"
	},
	move_up = {
		controller_type = "pad",
		key = "r1_trigger",
		func = "button"
	},
	look_inv = {
		controller_type = "pad",
		key = "right",
		func = "axis"
	},
	look = {
		type = "FilterInvertAxisY",
		controller_type = "pad",
		func = "filter",
		input = {
			scale = 5,
			axis = "look_inv"
		}
	},
	speed_inc = {
		controller_type = "pad",
		key = "l2_trigger",
		func = "button"
	},
	speed_dec = {
		controller_type = "pad",
		key = "r2_trigger",
		func = "button"
	},
	speed_change = {
		type = "FilterVirtualAxis",
		controller_type = "pad",
		func = "filter",
		input = {
			neg_y = "speed_dec",
			scale = 0.25,
			pos_y = "speed_inc"
		}
	},
	move = {
		controller_type = "pad",
		key = "left",
		func = "axis"
	},
	increase_fov = {
		controller_type = "pad",
		key = "up",
		func = "pressed"
	},
	decrease_fov = {
		controller_type = "pad",
		key = "down",
		func = "pressed"
	}
}

return

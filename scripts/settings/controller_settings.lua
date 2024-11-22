-- chunkname: @scripts/settings/controller_settings.lua

require("scripts/utils/input_helper")

UNASSIGNED_KEY = "unassigned_keymap"
PlayerControllerKeymaps = {}
PlayerControllerKeymaps.win32 = InputUtils.keymaps_key_approved("win32") and {
	toggle_input_helper = {
		"keyboard",
		"f1",
		"pressed",
	},
	action_one = {
		"mouse",
		"left",
		"pressed",
	},
	action_one_hold = {
		"mouse",
		"left",
		"held",
	},
	action_one_release = {
		"mouse",
		"left",
		"released",
	},
	action_two = {
		"mouse",
		"right",
		"pressed",
	},
	action_two_hold = {
		"mouse",
		"right",
		"held",
	},
	action_two_release = {
		"mouse",
		"right",
		"released",
	},
	action_three = {
		"keyboard",
		"v",
		"pressed",
	},
	action_three_hold = {
		"keyboard",
		"v",
		"held",
	},
	action_three_release = {
		"keyboard",
		"v",
		"released",
	},
	action_middle = {
		"mouse",
		"middle",
		"pressed",
	},
	action_inspect = {
		"keyboard",
		"z",
		"pressed",
	},
	action_inspect_hold = {
		"keyboard",
		"z",
		"held",
	},
	action_inspect_release = {
		"keyboard",
		"z",
		"released",
	},
	action_career = {
		"keyboard",
		"f",
		"pressed",
	},
	action_career_hold = {
		"keyboard",
		"f",
		"held",
	},
	action_career_release = {
		"keyboard",
		"f",
		"released",
	},
	action_one_softbutton_gamepad = {},
	action_one_mouse = {
		"mouse",
		"left",
		"pressed",
	},
	weapon_reload = {
		"keyboard",
		"r",
		"pressed",
	},
	weapon_reload_hold = {
		"keyboard",
		"r",
		"held",
	},
	character_inspecting = {
		"keyboard",
		"x",
		"held",
	},
	wield_1 = {
		"keyboard",
		"1",
		"pressed",
	},
	wield_2 = {
		"keyboard",
		"2",
		"pressed",
	},
	wield_3 = {
		"keyboard",
		"3",
		"pressed",
	},
	wield_4 = IS_XB1 and {
		"keyboard",
		"5",
		"pressed",
	} or {
		"keyboard",
		"4",
		"pressed",
	},
	wield_4_alt = {
		"keyboard",
		UNASSIGNED_KEY,
		"pressed",
	},
	wield_5 = IS_XB1 and {
		"keyboard",
		"4",
		"pressed",
	} or {
		"keyboard",
		"5",
		"pressed",
	},
	wield_6 = {
		"keyboard",
		"6",
		"pressed",
	},
	wield_7 = {
		"keyboard",
		"7",
		"pressed",
	},
	wield_8 = {
		"keyboard",
		"8",
		"pressed",
	},
	wield_9 = {
		"keyboard",
		"9",
		"pressed",
	},
	wield_0 = {
		"keyboard",
		"0",
		"pressed",
	},
	wield_switch = {
		"keyboard",
		"q",
		"pressed",
	},
	wield_switch_1 = {
		"keyboard",
		"q",
		"pressed",
	},
	wield_switch_2 = {},
	wield_scroll = {
		"mouse",
		"wheel",
		"axis",
	},
	wield_next = {
		"mouse",
		"wheel_down",
		"pressed",
	},
	wield_prev = {
		"mouse",
		"wheel_up",
		"pressed",
	},
	walk = {
		"keyboard",
		"left alt",
		"held",
	},
	interact = {
		"keyboard",
		"e",
		"pressed",
	},
	interacting = {
		"keyboard",
		"e",
		"held",
	},
	jump_1 = {
		"keyboard",
		"space",
		"pressed",
	},
	jump_2 = {},
	jump_only = {
		"keyboard",
		UNASSIGNED_KEY,
		"pressed",
	},
	dodge_hold = {
		"keyboard",
		"space",
		"held",
	},
	dodge = {
		"keyboard",
		UNASSIGNED_KEY,
		"pressed",
	},
	crouch = {
		"keyboard",
		"left ctrl",
		"pressed",
	},
	crouching = {
		"keyboard",
		"left ctrl",
		"held",
	},
	look_raw = {
		"mouse",
		"mouse",
		"axis",
	},
	look_raw_controller = {
		"gamepad",
		"right",
		"axis",
	},
	move_controller = {
		"gamepad",
		"left",
		"axis",
	},
	ping = {
		"keyboard",
		"t",
		"pressed",
	},
	ping_hold = {
		"keyboard",
		"t",
		"held",
	},
	ping_release = {
		"keyboard",
		"t",
		"released",
	},
	angular_velocity = {},
	social_wheel_only = {
		"keyboard",
		UNASSIGNED_KEY,
		"pressed",
	},
	social_wheel_only_hold = {
		"keyboard",
		UNASSIGNED_KEY,
		"held",
	},
	social_wheel_only_release = {
		"keyboard",
		UNASSIGNED_KEY,
		"released",
	},
	photomode_only = {
		"keyboard",
		"u",
		"pressed",
	},
	photomode_only_hold = {
		"keyboard",
		"u",
		"held",
	},
	photomode_only_release = {
		"keyboard",
		"u",
		"released",
	},
	social_wheel_page = {
		"keyboard",
		"e",
		"pressed",
	},
	ping_only = {
		"keyboard",
		UNASSIGNED_KEY,
		"pressed",
	},
	move_left = {
		"keyboard",
		"a",
		"soft_button",
	},
	move_right = {
		"keyboard",
		"d",
		"soft_button",
	},
	move_forward = {
		"keyboard",
		"w",
		"soft_button",
	},
	move_back = {
		"keyboard",
		"s",
		"soft_button",
	},
	move_left_pressed = {
		"keyboard",
		"a",
		"pressed",
	},
	move_right_pressed = {
		"keyboard",
		"d",
		"pressed",
	},
	move_forward_pressed = {
		"keyboard",
		"w",
		"pressed",
	},
	move_back_pressed = {
		"keyboard",
		"s",
		"pressed",
	},
	cursor = {
		"mouse",
		"cursor",
		"axis",
	},
	show_career_help = {
		"keyboard",
		"f1",
		"held",
	},
	next_observer_target = {
		"mouse",
		"left",
		"pressed",
	},
	previous_observer_target = {
		"mouse",
		"right",
		"pressed",
	},
	observer_change_offset = {
		"mouse",
		"wheel",
		"axis",
	},
	previous_observer_view = {
		"keyboard",
		"q",
		"pressed",
	},
	next_observer_view = {
		"keyboard",
		"e",
		"pressed",
	},
	next_observer_rotation_state = {
		"keyboard",
		"l",
		"pressed",
	},
	previous_observer_rotation_state = {
		"keyboard",
		"k",
		"pressed",
	},
	ghost_mode_enter = {
		"keyboard",
		"q",
		"pressed",
	},
	ghost_mode_exit = {
		"mouse",
		"right",
		"pressed",
	},
	emote_camera_zoom = {
		"mouse",
		"wheel",
		"axis",
	},
	emote_toggle_hud_visibility = {
		"keyboard",
		"h",
		"pressed",
	},
	versus_horde_ability = {
		"keyboard",
		"f",
		"pressed",
	},
}
PlayerControllerKeymaps.xb1 = InputUtils.keymaps_key_approved("xb1") and {
	toggle_input_helper = {},
	action_one = {
		"gamepad",
		"right_trigger",
		"pressed",
	},
	action_one_hold = {
		"gamepad",
		"right_trigger",
		"held",
	},
	action_one_release = {
		"gamepad",
		"right_trigger",
		"released",
	},
	action_two = {
		"gamepad",
		"left_trigger",
		"pressed",
	},
	action_two_hold = {
		"gamepad",
		"left_trigger",
		"held",
	},
	action_two_release = {
		"gamepad",
		"left_trigger",
		"released",
	},
	action_three = {
		"gamepad",
		"right_thumb",
		"pressed",
	},
	action_three_hold = {
		"gamepad",
		"right_thumb",
		"held",
	},
	action_three_release = {
		"gamepad",
		"right_thumb",
		"released",
	},
	action_inspect = {
		"gamepad",
		"left_thumb",
		"pressed",
	},
	action_inspect_hold = {
		"gamepad",
		"left_thumb",
		"held",
	},
	action_inspect_release = {
		"gamepad",
		"left_thumb",
		"released",
	},
	active_ability_left_pressed = {
		"gamepad",
		"left_shoulder",
		"pressed",
	},
	active_ability_right_pressed = {
		"gamepad",
		"right_shoulder",
		"pressed",
	},
	active_ability_left_held = {
		"gamepad",
		"left_shoulder",
		"held",
	},
	active_ability_right_held = {
		"gamepad",
		"right_shoulder",
		"held",
	},
	active_ability_left_release = {
		"gamepad",
		"left_shoulder",
		"released",
	},
	active_ability_right_release = {
		"gamepad",
		"right_shoulder",
		"released",
	},
	action_one_softbutton_gamepad = {
		"gamepad",
		"right_trigger",
		"soft_button",
	},
	action_one_mouse = {},
	weapon_reload_input = {
		"gamepad",
		"x",
		"pressed",
	},
	weapon_reload_hold_input = {
		"gamepad",
		"x",
		"held",
	},
	character_inspecting = {
		"gamepad",
		"d_down",
		"held",
	},
	wield_1 = {},
	wield_2 = {},
	wield_3 = {
		"gamepad",
		"d_left",
		"pressed",
	},
	wield_4 = {
		"gamepad",
		"d_right",
		"pressed",
	},
	wield_4_alt = {},
	wield_5 = {
		"gamepad",
		"d_up",
		"pressed",
	},
	wield_6 = {},
	wield_7 = {},
	wield_8 = {},
	wield_9 = {},
	wield_0 = {},
	wield_switch_1 = {
		"gamepad",
		"y",
		"pressed",
	},
	wield_switch_2 = {},
	wield_scroll = {
		"mouse",
		"wheel",
		"axis",
	},
	wield_next = {},
	wield_prev = {},
	walk = {},
	interact = {
		"gamepad",
		"x",
		"pressed",
	},
	interacting = {
		"gamepad",
		"x",
		"held",
	},
	jump_1 = {
		"gamepad",
		"a",
		"pressed",
	},
	jump_2 = {},
	jump_only = {},
	dodge_1 = {
		"gamepad",
		"a",
		"held",
	},
	dodge_2 = {},
	dodge = {},
	crouch = {
		"gamepad",
		"b",
		"pressed",
	},
	crouching = {
		"gamepad",
		"b",
		"held",
	},
	ability = {
		"gamepad",
		"left_shoulder",
		"pressed",
	},
	ability_hold = {
		"gamepad",
		"left_shoulder",
		"held",
	},
	ability_release = {
		"gamepad",
		"left_shoulder",
		"released",
	},
	look_raw = {},
	look_raw_controller = {
		"gamepad",
		"right",
		"axis",
	},
	move_controller = {
		"gamepad",
		"left",
		"axis",
	},
	cursor = {
		"gamepad",
		"left",
		"axis",
	},
	ping = {
		"gamepad",
		"right_shoulder",
		"pressed",
	},
	ping_hold = {
		"gamepad",
		"right_shoulder",
		"held",
	},
	ping_release = {
		"gamepad",
		"right_shoulder",
		"released",
	},
	angular_velocity = {},
	social_wheel_only = {},
	social_wheel_only_hold = {},
	social_wheel_only_release = {},
	photomode_only = {},
	photomode_only_hold = {},
	photomode_only_release = {},
	social_wheel_page = {
		"gamepad",
		"x",
		"pressed",
	},
	ping_only = {},
	move_left = {},
	move_right = {},
	move_forward = {},
	move_back = {},
	move_left_pressed = {},
	move_right_pressed = {},
	move_forward_pressed = {},
	move_back_pressed = {},
	next_observer_target = {
		"gamepad",
		"a",
		"pressed",
	},
	previous_observer_target = {
		"gamepad",
		"b",
		"pressed",
	},
	ghost_mode_enter = {
		"gamepad",
		"y",
		"pressed",
	},
	ghost_mode_exit = {
		"gamepad",
		"x",
		"pressed",
	},
	emote_camera_zoom_in = {
		"gamepad",
		"right_trigger",
		"soft_button",
	},
	emote_camera_zoom_out = {
		"gamepad",
		"left_trigger",
		"soft_button",
	},
	emote_toggle_hud_visibility = {
		"gamepad",
		"x",
		"pressed",
	},
	versus_horde_ability = {
		"gamepad",
		"d_up",
		"pressed",
	},
}
PlayerControllerKeymaps.ps4 = InputUtils.keymaps_key_approved("ps4") and {
	toggle_input_helper = {
		"keyboard",
		"f1",
		"pressed",
	},
	action_one = {
		"gamepad",
		"r2",
		"pressed",
	},
	action_one_hold = {
		"gamepad",
		"r2",
		"held",
	},
	action_one_release = {
		"gamepad",
		"r2",
		"released",
	},
	action_two = {
		"gamepad",
		"l2",
		"pressed",
	},
	action_two_hold = {
		"gamepad",
		"l2",
		"held",
	},
	action_two_release = {
		"gamepad",
		"l2",
		"released",
	},
	action_three = {
		"gamepad",
		"r3",
		"pressed",
	},
	action_three_hold = {
		"gamepad",
		"r3",
		"held",
	},
	action_three_release = {
		"gamepad",
		"r3",
		"released",
	},
	action_inspect = {
		"gamepad",
		"l3",
		"pressed",
	},
	action_inspect_hold = {
		"gamepad",
		"l3",
		"held",
	},
	action_inspect_release = {
		"gamepad",
		"l3",
		"released",
	},
	reset_view = {
		"gamepad",
		"l3",
		"pressed",
	},
	active_ability_left_pressed = {
		"gamepad",
		"l1",
		"pressed",
	},
	active_ability_right_pressed = {
		"gamepad",
		"r1",
		"pressed",
	},
	active_ability_left_held = {
		"gamepad",
		"l1",
		"held",
	},
	active_ability_right_held = {
		"gamepad",
		"r1",
		"held",
	},
	active_ability_left_release = {
		"gamepad",
		"l1",
		"released",
	},
	active_ability_right_release = {
		"gamepad",
		"r1",
		"released",
	},
	action_one_softbutton_gamepad = {
		"gamepad",
		"r2",
		"soft_button",
	},
	action_one_mouse = {},
	weapon_reload_input = {
		"gamepad",
		"square",
		"pressed",
	},
	weapon_reload_hold_input = {
		"gamepad",
		"square",
		"held",
	},
	character_inspecting = {
		"gamepad",
		"down",
		"held",
	},
	wield_1 = {},
	wield_2 = {},
	wield_3 = {
		"gamepad",
		"left",
		"pressed",
	},
	wield_4 = {
		"gamepad",
		"right",
		"pressed",
	},
	wield_4_alt = {},
	wield_5 = {
		"gamepad",
		"up",
		"pressed",
	},
	wield_6 = {},
	wield_7 = {},
	wield_8 = {},
	wield_9 = {},
	wield_0 = {},
	wield_switch_1 = {
		"gamepad",
		"triangle",
		"pressed",
	},
	wield_switch_2 = {},
	wield_scroll = {
		"mouse",
		"wheel",
		"axis",
	},
	wield_next = {},
	wield_prev = {},
	walk = {},
	interact = {
		"gamepad",
		"square",
		"pressed",
	},
	interacting = {
		"gamepad",
		"square",
		"held",
	},
	jump_1 = {
		"gamepad",
		"cross",
		"pressed",
	},
	jump_2 = {},
	jump_only = {},
	dodge_1 = {
		"gamepad",
		"cross",
		"held",
	},
	dodge_2 = {},
	dodge = {},
	crouch = {
		"gamepad",
		"circle",
		"pressed",
	},
	crouching = {
		"gamepad",
		"circle",
		"held",
	},
	ability = {
		"gamepad",
		"l1",
		"pressed",
	},
	ability_hold = {
		"gamepad",
		"l1",
		"held",
	},
	ability_release = {
		"gamepad",
		"l1",
		"released",
	},
	look_raw = {},
	look_raw_controller = {
		"gamepad",
		"right",
		"axis",
	},
	move_controller = {
		"gamepad",
		"left",
		"axis",
	},
	cursor = {
		"gamepad",
		"left",
		"axis",
	},
	ping = {
		"gamepad",
		"r1",
		"pressed",
	},
	ping_hold = {
		"gamepad",
		"r1",
		"held",
	},
	ping_release = {
		"gamepad",
		"r1",
		"released",
	},
	angular_velocity = {
		"gamepad",
		"angular_velocity",
		"axis",
	},
	social_wheel_only = {},
	social_wheel_only_hold = {},
	social_wheel_only_release = {},
	photomode_only = {},
	photomode_only_hold = {},
	photomode_only_release = {},
	social_wheel_page = {
		"gamepad",
		"square",
		"pressed",
	},
	ping_only = {},
	move_left = {},
	move_right = {},
	move_forward = {},
	move_back = {},
	move_left_pressed = {},
	move_right_pressed = {},
	move_forward_pressed = {},
	move_back_pressed = {},
	next_observer_target = {
		"gamepad",
		"cross",
		"pressed",
	},
	previous_observer_target = {
		"gamepad",
		"circle",
		"pressed",
	},
	ghost_mode_enter = {
		"gamepad",
		"triangle",
		"pressed",
	},
	ghost_mode_exit = {
		"gamepad",
		"square",
		"pressed",
	},
	emote_camera_zoom_in = {
		"gamepad",
		"r2",
		"soft_button",
	},
	emote_camera_zoom_out = {
		"gamepad",
		"l2",
		"soft_button",
	},
	emote_toggle_hud_visibility = {
		"gamepad",
		"square",
		"pressed",
	},
	versus_horde_ability = {
		"gamepad",
		"up",
		"pressed",
	},
}
PlayerControllerKeymaps.ps_pad = InputUtils.keymaps_key_approved("ps_pad") and {
	toggle_input_helper = {
		"keyboard",
		"f1",
		"pressed",
	},
	action_one = {
		"ps_pad",
		"r2",
		"pressed",
	},
	action_one_hold = {
		"ps_pad",
		"r2",
		"held",
	},
	action_one_release = {
		"ps_pad",
		"r2",
		"released",
	},
	action_two = {
		"ps_pad",
		"l2",
		"pressed",
	},
	action_two_hold = {
		"ps_pad",
		"l2",
		"held",
	},
	action_two_release = {
		"ps_pad",
		"l2",
		"released",
	},
	action_three = {
		"ps_pad",
		"r3",
		"pressed",
	},
	action_three_hold = {
		"ps_pad",
		"r3",
		"held",
	},
	action_three_release = {
		"ps_pad",
		"r3",
		"released",
	},
	action_inspect = {
		"ps_pad",
		"l3",
		"pressed",
	},
	action_inspect_hold = {
		"ps_pad",
		"l3",
		"held",
	},
	action_inspect_release = {
		"ps_pad",
		"l3",
		"released",
	},
	reset_view = {
		"ps_pad",
		"l3",
		"pressed",
	},
	active_ability_left_pressed = {
		"ps_pad",
		"l1",
		"pressed",
	},
	active_ability_right_pressed = {
		"ps_pad",
		"r1",
		"pressed",
	},
	active_ability_left_held = {
		"ps_pad",
		"l1",
		"held",
	},
	active_ability_right_held = {
		"ps_pad",
		"r1",
		"held",
	},
	active_ability_left_release = {
		"ps_pad",
		"l1",
		"released",
	},
	active_ability_right_release = {
		"ps_pad",
		"r1",
		"released",
	},
	action_one_softbutton_gamepad = {
		"ps_pad",
		"r2",
		"soft_button",
	},
	action_one_mouse = {},
	weapon_reload_input = {
		"ps_pad",
		"square",
		"pressed",
	},
	weapon_reload_hold_input = {
		"ps_pad",
		"square",
		"held",
	},
	character_inspecting = {
		"ps_pad",
		"down",
		"held",
	},
	wield_1 = {},
	wield_2 = {},
	wield_3 = {
		"ps_pad",
		"left",
		"pressed",
	},
	wield_4 = {
		"ps_pad",
		"right",
		"pressed",
	},
	wield_4_alt = {},
	wield_5 = {
		"ps_pad",
		"up",
		"pressed",
	},
	wield_6 = {},
	wield_7 = {},
	wield_8 = {},
	wield_9 = {},
	wield_0 = {},
	wield_switch_1 = {
		"ps_pad",
		"triangle",
		"pressed",
	},
	wield_switch_2 = {},
	wield_scroll = {
		"mouse",
		"wheel",
		"axis",
	},
	wield_next = {},
	wield_prev = {},
	walk = {},
	interact = {
		"ps_pad",
		"square",
		"pressed",
	},
	interacting = {
		"ps_pad",
		"square",
		"held",
	},
	jump_1 = {
		"ps_pad",
		"cross",
		"pressed",
	},
	jump_2 = {},
	jump_only = {},
	dodge_1 = {
		"ps_pad",
		"cross",
		"held",
	},
	dodge_2 = {},
	dodge = {},
	crouch = {
		"ps_pad",
		"circle",
		"pressed",
	},
	crouching = {
		"ps_pad",
		"circle",
		"held",
	},
	ability = {
		"ps_pad",
		"l1",
		"pressed",
	},
	ability_hold = {
		"ps_pad",
		"l1",
		"held",
	},
	ability_release = {
		"ps_pad",
		"l1",
		"released",
	},
	look_raw = {},
	look_raw_controller = {
		"ps_pad",
		"right",
		"axis",
	},
	move_controller = {
		"ps_pad",
		"left",
		"axis",
	},
	cursor = {
		"ps_pad",
		"left",
		"axis",
	},
	ping = {
		"ps_pad",
		"r1",
		"pressed",
	},
	ping_hold = {
		"ps_pad",
		"r1",
		"held",
	},
	ping_release = {
		"ps_pad",
		"r1",
		"released",
	},
	angular_velocity = {
		"ps_pad",
		"angular_velocity",
		"axis",
	},
	social_wheel_only = {},
	social_wheel_only_hold = {},
	social_wheel_only_release = {},
	photomode_only = {},
	photomode_only_hold = {},
	photomode_only_release = {},
	social_wheel_page = {
		"ps_pad",
		"square",
		"pressed",
	},
	ping_only = {},
	move_left = {},
	move_right = {},
	move_forward = {},
	move_back = {},
	move_left_pressed = {},
	move_right_pressed = {},
	move_forward_pressed = {},
	move_back_pressed = {},
	next_observer_target = {
		"ps_pad",
		"cross",
		"pressed",
	},
	previous_observer_target = {
		"ps_pad",
		"circle",
		"pressed",
	},
	ghost_mode_enter = {
		"ps_pad",
		"triangle",
		"pressed",
	},
	ghost_mode_exit = {
		"ps_pad",
		"square",
		"pressed",
	},
	emote_camera_zoom_in = {
		"ps_pad",
		"r2",
		"soft_button",
	},
	emote_camera_zoom_out = {
		"ps_pad",
		"l2",
		"soft_button",
	},
	emote_toggle_hud_visibility = {
		"ps_pad",
		"square",
		"pressed",
	},
	versus_horde_ability = {
		"ps_pad",
		"up",
		"pressed",
	},
}
TutorialPlayerControllerKeymaps = table.clone(PlayerControllerKeymaps)
PlayerControllerFilters = {}
PlayerControllerFilters.win32 = InputUtils.keymaps_key_approved("win32") and {
	move = {
		filter_type = "virtual_axis",
		input_mappings = {
			back = "move_back",
			forward = "move_forward",
			left = "move_left",
			right = "move_right",
		},
	},
	look = {
		filter_type = "scale_vector3_invert_y",
		input_mapping = "look_raw",
		multiplier = 0.0006,
	},
	jump = {
		filter_type = "or",
		input_mappings = {
			button_1 = "jump_1",
			button_2 = "jump_2",
		},
	},
	wield_switch = {
		filter_type = "or",
		input_mappings = {
			button_1 = "wield_switch_1",
		},
	},
	look_controller = {
		accelerate_time_ref = 0.5,
		acceleration_delay = 0.2,
		angle_to_slow_down_inside = 0.5,
		filter_type = "scale_vector3_xy_accelerated_x",
		input_mapping = "look_raw_controller",
		multiplier_min_x = 1.5,
		multiplier_return_y = 1.75,
		multiplier_x = 4,
		multiplier_y = 0.75,
		power_of = 1.75,
		threshold = 0.925,
	},
	look_controller_ranged = {
		accelerate_time_ref = 0.6,
		acceleration_delay = 0.2,
		angle_to_slow_down_inside = 0.5,
		filter_type = "scale_vector3_xy_accelerated_x",
		input_mapping = "look_raw_controller",
		multiplier_min_x = 1.25,
		multiplier_return_y = 1.75,
		multiplier_x = 4,
		multiplier_y = 0.75,
		power_of = 2,
		threshold = 0.925,
	},
	look_controller_melee = {
		accelerate_time_ref = 0.15,
		acceleration_delay = 0.2,
		angle_to_slow_down_inside = 0.5,
		filter_type = "scale_vector3_xy_accelerated_x",
		input_mapping = "look_raw_controller",
		multiplier_min_x = 2.5,
		multiplier_return_y = 2,
		multiplier_x = 2,
		multiplier_y = 1,
		power_of = 1.5,
		threshold = 0.65,
		turnaround_delay = 0.2,
		turnaround_multiplier_x = 3,
		turnaround_power_of = 2,
		turnaround_threshold = 0.925,
		turnaround_time_ref = 0.75,
	},
	look_controller_zoom = {
		accelerate_time_ref = 0.3,
		acceleration_delay = 0,
		angle_to_slow_down_inside = 0.5,
		filter_type = "scale_vector3_xy_accelerated_x",
		input_mapping = "look_raw_controller",
		multiplier_min_x = 0.5,
		multiplier_return_y = 1.5,
		multiplier_x = 1,
		multiplier_y = 0.5,
		power_of = 1.1,
		threshold = 0.95,
	},
	look_controller_3p = {
		accelerate_time_ref = 0.3,
		acceleration_delay = 0,
		filter_type = "scale_vector3_xy_accelerated_x",
		input_mapping = "look_raw_controller",
		multiplier_min_x = 0.5,
		multiplier_x = 1.5,
		multiplier_y = 0.5,
		power_of = 1.5,
		threshold = 0.95,
	},
	action_career_not_hold = {
		filter_type = "not",
		input_mappings = {
			button_1 = "action_career_hold",
		},
	},
}
PlayerControllerFilters.xb1 = InputUtils.keymaps_key_approved("xb1") and {
	look_controller = {
		accelerate_time_ref = 0.3,
		acceleration_delay = 0.01,
		angle_to_slow_down_inside = 0.5,
		filter_type = "scale_vector3_xy_accelerated_x",
		input_mapping = "look_raw_controller",
		multiplier_min_x = 1.5,
		multiplier_return_y = 1.75,
		multiplier_x = 5,
		multiplier_y = 0.75,
		power_of = 2,
		threshold = 0.925,
	},
	look_controller_ranged = {
		accelerate_time_ref = 0.3,
		acceleration_delay = 0.01,
		angle_to_slow_down_inside = 0.5,
		filter_type = "scale_vector3_xy_accelerated_x",
		input_mapping = "look_raw_controller",
		multiplier_min_x = 1.25,
		multiplier_return_y = 1.75,
		multiplier_x = 5,
		multiplier_y = 0.75,
		power_of = 1.25,
		threshold = 0.925,
	},
	look_controller_melee = {
		accelerate_time_ref = 0.15,
		acceleration_delay = 0.2,
		angle_to_slow_down_inside = 0.5,
		filter_type = "scale_vector3_xy_accelerated_x",
		input_mapping = "look_raw_controller",
		multiplier_min_x = 2.5,
		multiplier_return_y = 2,
		multiplier_x = 2,
		multiplier_y = 1,
		power_of = 1.5,
		threshold = 0.65,
		turnaround_delay = 0.01,
		turnaround_multiplier_x = 5,
		turnaround_power_of = 2,
		turnaround_threshold = 0.925,
		turnaround_time_ref = 0.15,
	},
	look_controller_zoom = {
		accelerate_time_ref = 0.3,
		acceleration_delay = 0,
		angle_to_slow_down_inside = 0.5,
		filter_type = "scale_vector3_xy_accelerated_x",
		input_mapping = "look_raw_controller",
		multiplier_min_x = 0.5,
		multiplier_return_y = 1.5,
		multiplier_x = 1,
		multiplier_y = 0.5,
		power_of = 1.1,
		threshold = 0.95,
	},
	look_controller_3p = {
		accelerate_time_ref = 0.3,
		acceleration_delay = 0,
		angle_to_slow_down_inside = 0.5,
		filter_type = "scale_vector3_xy_accelerated_x",
		input_mapping = "look_raw_controller",
		multiplier_min_x = 0.5,
		multiplier_return_y = 1.5,
		multiplier_x = 1.5,
		multiplier_y = 0.5,
		power_of = 1.5,
		threshold = 0.95,
	},
	move_controller_up = {
		axis_requirement = 0.7,
		filter_type = "axis_check",
		input_mapping = "move_controller",
		axis = {
			0,
			1,
			0,
		},
	},
	move_controller_down = {
		axis_requirement = 0.7,
		filter_type = "axis_check",
		input_mapping = "move_controller",
		axis = {
			0,
			-1,
			0,
		},
	},
	move_controller_left = {
		axis_requirement = 0.7,
		filter_type = "axis_check",
		input_mapping = "move_controller",
		axis = {
			-1,
			0,
			0,
		},
	},
	move_controller_right = {
		axis_requirement = 0.7,
		filter_type = "axis_check",
		input_mapping = "move_controller",
		axis = {
			1,
			0,
			0,
		},
	},
	wield_switch = {
		filter_type = "or",
		input_mappings = {
			button_1 = "wield_switch_1",
		},
	},
	jump = {
		filter_type = "or",
		input_mappings = {
			button_1 = "jump_1",
			button_2 = "jump_2",
		},
	},
	dodge_hold = {
		filter_type = "or",
		input_mappings = {
			button_1 = "dodge_1",
			button_2 = "dodge_2",
		},
	},
	dodge = {
		filter_type = "or",
		input_mappings = {
			button_1 = "dodge_1",
			button_2 = "dodge_2",
		},
	},
	action_career = {
		filter_type = "or",
		max_delay = 0.05,
		input_mappings = {
			button_1 = "ability",
		},
		held = {
			button_1 = "ability_hold",
		},
	},
	action_career_hold = {
		filter_type = "or",
		input_mappings = {
			button_1 = "ability_hold",
		},
	},
	action_career_not_hold = {
		filter_type = "not",
		input_mappings = {
			button_1 = "ability_hold",
		},
	},
	action_career_release = {
		filter_type = "or",
		input_mappings = {
			button_1 = "ability_release",
		},
	},
	weapon_reload_hold = {
		filter_type = "or",
		input_mappings = {
			button_1 = "weapon_reload_hold_input",
		},
	},
	weapon_reload = {
		filter_type = "or",
		input_mappings = {
			button_1 = "weapon_reload_input",
		},
	},
}

local PlayerControllerFilters_ps4 = {
	look_controller = {
		accelerate_time_ref = 0.5,
		acceleration_delay = 0.2,
		filter_type = "scale_vector3_xy_accelerated_x",
		input_mapping = "look_raw_controller",
		multiplier_min_x = 1.5,
		multiplier_x = 4,
		multiplier_y = 0.75,
		power_of = 1.75,
		threshold = 0.925,
	},
	look_controller_ranged = {
		accelerate_time_ref = 0.6,
		acceleration_delay = 0.2,
		filter_type = "scale_vector3_xy_accelerated_x",
		input_mapping = "look_raw_controller",
		multiplier_min_x = 1.25,
		multiplier_x = 4,
		multiplier_y = 0.75,
		power_of = 2,
		threshold = 0.925,
	},
	look_controller_melee = {
		accelerate_time_ref = 0.15,
		acceleration_delay = 0.2,
		filter_type = "scale_vector3_xy_accelerated_x",
		input_mapping = "look_raw_controller",
		multiplier_min_x = 2.5,
		multiplier_x = 2,
		multiplier_y = 1,
		power_of = 1.5,
		threshold = 0.65,
		turnaround_delay = 0.2,
		turnaround_multiplier_x = 3,
		turnaround_power_of = 2,
		turnaround_threshold = 0.925,
		turnaround_time_ref = 0.75,
	},
	look_controller_zoom = {
		accelerate_time_ref = 0.3,
		acceleration_delay = 0,
		filter_type = "scale_vector3_xy_accelerated_x",
		input_mapping = "look_raw_controller",
		multiplier_min_x = 0.5,
		multiplier_x = 1,
		multiplier_y = 0.5,
		power_of = 1.1,
		threshold = 0.95,
	},
	look_controller_3p = {
		accelerate_time_ref = 0.3,
		acceleration_delay = 0,
		filter_type = "scale_vector3_xy_accelerated_x",
		input_mapping = "look_raw_controller",
		multiplier_min_x = 0.5,
		multiplier_x = 1.5,
		multiplier_y = 0.5,
		power_of = 1.5,
		threshold = 0.95,
	},
	move_controller_up = {
		axis_requirement = 0.7,
		filter_type = "axis_check",
		input_mapping = "move_controller",
		axis = {
			0,
			1,
			0,
		},
	},
	move_controller_down = {
		axis_requirement = 0.7,
		filter_type = "axis_check",
		input_mapping = "move_controller",
		axis = {
			0,
			-1,
			0,
		},
	},
	move_controller_left = {
		axis_requirement = 0.7,
		filter_type = "axis_check",
		input_mapping = "move_controller",
		axis = {
			-1,
			0,
			0,
		},
	},
	move_controller_right = {
		axis_requirement = 0.7,
		filter_type = "axis_check",
		input_mapping = "move_controller",
		axis = {
			1,
			0,
			0,
		},
	},
	wield_switch = {
		filter_type = "or",
		input_mappings = {
			button_1 = "wield_switch_1",
		},
	},
	jump = {
		filter_type = "or",
		input_mappings = {
			button_1 = "jump_1",
			button_2 = "jump_2",
		},
	},
	dodge_hold = {
		filter_type = "or",
		input_mappings = {
			button_1 = "dodge_1",
			button_2 = "dodge_2",
		},
	},
	dodge = {
		filter_type = "or",
		input_mappings = {
			button_1 = "dodge_1",
			button_2 = "dodge_2",
		},
	},
	action_career = {
		filter_type = "or",
		max_delay = 0.05,
		input_mappings = {
			button_1 = "ability",
		},
		held = {
			button_1 = "ability_hold",
		},
	},
	action_career_hold = {
		filter_type = "or",
		input_mappings = {
			button_1 = "ability_hold",
		},
	},
	action_career_not_hold = {
		filter_type = "not",
		input_mappings = {
			button_1 = "ability_hold",
		},
	},
	action_career_release = {
		filter_type = "or",
		input_mappings = {
			button_1 = "ability_release",
		},
	},
	weapon_reload_hold = {
		filter_type = "exclusive_and",
		input_mappings = {
			button_1 = "weapon_reload_hold_input",
		},
		exclusive_input_mappings = {
			button_1 = "action_career",
			button_2 = "action_career_hold",
			button_3 = "action_career_release",
		},
	},
	weapon_reload = {
		filter_type = "exclusive_and",
		input_mappings = {
			button_1 = "weapon_reload_input",
		},
		exclusive_input_mappings = {
			button_1 = "action_career",
			button_2 = "action_career_hold",
			button_3 = "action_career_release",
		},
	},
}

PlayerControllerFilters.ps4 = InputUtils.keymaps_key_approved("ps4") and PlayerControllerFilters_ps4
PlayerControllerFilters.ps_pad = InputUtils.keymaps_key_approved("ps_pad") and PlayerControllerFilters_ps4
TutorialPlayerControllerFilters = table.clone(PlayerControllerFilters)
TwitchControllerSettings = {}
TwitchControllerSettings.win32 = InputUtils.keymaps_key_approved("win32") and {
	execute_login_1 = {
		"keyboard",
		"enter",
		"pressed",
	},
	execute_login_2 = {
		"keyboard",
		"numpad enter",
		"pressed",
	},
	back = {
		"keyboard",
		"esc",
		"pressed",
	},
	cursor = {
		"mouse",
		"cursor",
		"axis",
	},
	left_release = {
		"mouse",
		"left",
		"released",
	},
	left_press = {
		"mouse",
		"left",
		"pressed",
	},
	left_hold = {
		"mouse",
		"left",
		"held",
	},
}
TwitchControllerFilters = {}
TwitchControllerFilters.win32 = InputUtils.keymaps_key_approved("win32") and {
	execute_login = {
		filter_type = "or",
		input_mappings = {
			button_1 = "execute_login_1",
			button_2 = "execute_login_2",
		},
	},
}
ChatControllerSettings = {}
ChatControllerSettings.win32 = InputUtils.keymaps_key_approved("win32") and {
	activate_chat_input = {
		"keyboard",
		"y",
		"pressed",
	},
	execute_chat_input_1 = {
		"keyboard",
		"enter",
		"pressed",
	},
	execute_chat_input_2 = {
		"keyboard",
		"numpad enter",
		"pressed",
	},
	execute_chat_input_3 = {
		"keyboard",
		"left shift",
		"held",
	},
	deactivate_chat_input = {
		"keyboard",
		"esc",
		"pressed",
	},
	chat_left_alt_held = {
		"keyboard",
		"left alt",
		"held",
	},
	chat_left_alt_pressed = {
		"keyboard",
		"left alt",
		"pressed",
	},
	chat_left_alt_released = {
		"keyboard",
		"left alt",
		"released",
	},
	chat_scroll_up = {
		"keyboard",
		"page up",
		"held",
	},
	chat_scroll_down = {
		"keyboard",
		"page down",
		"held",
	},
	chat_scroll = {
		"mouse",
		"wheel",
		"axis",
	},
	chat_switch_channel = {
		"keyboard",
		"tab",
		"pressed",
	},
	chat_left_ctrl = {
		"keyboard",
		"left ctrl",
		"held",
	},
	chat_tab_pressed = {
		"keyboard",
		"tab",
		"pressed",
	},
	chat_backspace_pressed = {
		"keyboard",
		"backspace",
		"pressed",
	},
	chat_next_old_message = {
		"keyboard",
		"up",
		"pressed",
	},
	chat_previous_old_message = {
		"keyboard",
		"down",
		"pressed",
	},
	cursor = {
		"mouse",
		"cursor",
		"axis",
	},
	left_release = {
		"mouse",
		"left",
		"released",
	},
	left_press = {
		"mouse",
		"left",
		"pressed",
	},
	left_hold = {
		"mouse",
		"left",
		"held",
	},
	right_release = {
		"mouse",
		"right",
		"released",
	},
	right_press = {
		"mouse",
		"right",
		"pressed",
	},
	right_hold = {
		"mouse",
		"right",
		"held",
	},
	voip_push_to_talk = {
		"keyboard",
		"g",
		"held",
	},
}
ChatControllerSettings.xb1 = InputUtils.keymaps_key_approved("xb1") and {
	activate_chat_input = {
		"keyboard",
		"y",
		"pressed",
	},
	execute_chat_input = {
		"keyboard",
		"enter",
		"pressed",
	},
	deactivate_chat_input = {
		"keyboard",
		"esc",
		"pressed",
	},
	chat_left_alt_held = {
		"keyboard",
		"left alt",
		"held",
	},
	chat_left_alt_pressed = {
		"keyboard",
		"left alt",
		"pressed",
	},
	chat_left_alt_released = {
		"keyboard",
		"left alt",
		"released",
	},
	cursor = {
		"mouse",
		"cursor",
		"axis",
	},
	left_release = {
		"mouse",
		"left",
		"released",
	},
	left_press = {
		"mouse",
		"left",
		"pressed",
	},
	left_hold = {
		"mouse",
		"left",
		"held",
	},
	voip_push_to_talk = {},
}
ChatControllerSettings.ps4 = InputUtils.keymaps_key_approved("ps4") and {
	activate_chat_input = {
		"keyboard",
		"y",
		"pressed",
	},
	execute_chat_input = {
		"keyboard",
		"enter",
		"pressed",
	},
	deactivate_chat_input = {
		"keyboard",
		"esc",
		"pressed",
	},
	chat_left_alt_held = {
		"keyboard",
		"left alt",
		"held",
	},
	chat_left_alt_pressed = {
		"keyboard",
		"left alt",
		"pressed",
	},
	chat_left_alt_released = {
		"keyboard",
		"left alt",
		"released",
	},
	cursor = {
		"mouse",
		"cursor",
		"axis",
	},
	left_release = {
		"mouse",
		"left",
		"released",
	},
	left_press = {
		"mouse",
		"left",
		"pressed",
	},
	left_hold = {
		"mouse",
		"left",
		"held",
	},
	voip_push_to_talk = {},
}
ChatControllerSettings.ps_pad = InputUtils.keymaps_key_approved("ps_pad") and {
	activate_chat_input = {
		"keyboard",
		"y",
		"pressed",
	},
	execute_chat_input = {
		"keyboard",
		"enter",
		"pressed",
	},
	deactivate_chat_input = {
		"keyboard",
		"esc",
		"pressed",
	},
	chat_left_alt_held = {
		"keyboard",
		"left alt",
		"held",
	},
	chat_left_alt_pressed = {
		"keyboard",
		"left alt",
		"pressed",
	},
	chat_left_alt_released = {
		"keyboard",
		"left alt",
		"released",
	},
	cursor = {
		"mouse",
		"cursor",
		"axis",
	},
	left_release = {
		"mouse",
		"left",
		"released",
	},
	left_press = {
		"mouse",
		"left",
		"pressed",
	},
	left_hold = {
		"mouse",
		"left",
		"held",
	},
	voip_push_to_talk = {},
}
ChatControllerFilters = {}
ChatControllerFilters.win32 = InputUtils.keymaps_key_approved("win32") and {
	unallowed_activate_chat_input = {
		filter_type = "or",
		input_mappings = {
			button_1 = "chat_left_alt_held",
			button_2 = "chat_left_alt_pressed",
			button_3 = "chat_left_alt_released",
		},
	},
	execute_chat_input = {
		filter_type = "or",
		input_mappings = {
			button_1 = "execute_chat_input_1",
			button_2 = "execute_chat_input_2",
		},
	},
	execute_alt_chat_input = {
		filter_type = "and",
		input_mappings = {
			button_1 = "execute_chat_input_1",
			button_2 = "execute_chat_input_3",
		},
	},
	chat_switch_view = {
		filter_type = "and",
		input_mappings = {
			button_1 = "chat_left_ctrl",
			button_2 = "chat_tab_pressed",
		},
	},
	chat_backspace_word = {
		filter_type = "and",
		input_mappings = {
			button_1 = "chat_left_ctrl",
			button_2 = "chat_backspace_pressed",
		},
	},
	chat_switch_view = {
		filter_type = "and",
		input_mappings = {
			button_1 = "chat_left_ctrl",
			button_2 = "chat_tab_pressed",
		},
	},
}
ChatControllerFilters.xb1 = InputUtils.keymaps_key_approved("xb1") and {
	unallowed_activate_chat_input = {
		filter_type = "or",
		input_mappings = {
			button_1 = "chat_left_alt_held",
			button_2 = "chat_left_alt_pressed",
			button_3 = "chat_left_alt_released",
		},
	},
	execute_chat_input = {
		filter_type = "or",
		input_mappings = {
			button_1 = "execute_chat_input_1",
			button_2 = "execute_chat_input_2",
		},
	},
}

local ChatControllerFilters_ps4 = {
	unallowed_activate_chat_input = {
		filter_type = "or",
		input_mappings = {
			button_1 = "chat_left_alt_held",
			button_2 = "chat_left_alt_pressed",
			button_3 = "chat_left_alt_released",
		},
	},
	execute_chat_input = {
		filter_type = "or",
		input_mappings = {
			button_1 = "execute_chat_input_1",
			button_2 = "execute_chat_input_2",
		},
	},
}

ChatControllerFilters.ps4 = InputUtils.keymaps_key_approved("ps4") and ChatControllerFilters_ps4
ChatControllerFilters.ps_pad = InputUtils.keymaps_key_approved("ps_pad") and ChatControllerFilters_ps4
RconControllerSettings = {}
RconControllerSettings.win32 = InputUtils.keymaps_key_approved("win32") and {
	activate_menu = {
		"keyboard",
		"f2",
		"pressed",
	},
	send_input = {
		"keyboard",
		"enter",
		"pressed",
	},
	deactivate_menu = {
		"keyboard",
		"esc",
		"pressed",
	},
	cursor = {
		"mouse",
		"cursor",
		"axis",
	},
	left_release = {
		"mouse",
		"left",
		"released",
	},
	left_press = {
		"mouse",
		"left",
		"pressed",
	},
	left_hold = {
		"mouse",
		"left",
		"held",
	},
	right_release = {
		"mouse",
		"right",
		"released",
	},
	right_press = {
		"mouse",
		"right",
		"pressed",
	},
	right_hold = {
		"mouse",
		"right",
		"held",
	},
}
RconControllerSettings.xb1 = InputUtils.keymaps_key_approved("xb1") and {
	activate_menu = {
		"keyboard",
		"f2",
		"pressed",
	},
	send_input = {
		"keyboard",
		"enter",
		"pressed",
	},
	deactivate_menu = {
		"keyboard",
		"esc",
		"pressed",
	},
	cursor = {
		"mouse",
		"cursor",
		"axis",
	},
	left_release = {
		"mouse",
		"left",
		"released",
	},
	left_press = {
		"mouse",
		"left",
		"pressed",
	},
	left_hold = {
		"mouse",
		"left",
		"held",
	},
	right_release = {
		"mouse",
		"right",
		"released",
	},
	right_press = {
		"mouse",
		"right",
		"pressed",
	},
	right_hold = {
		"mouse",
		"right",
		"held",
	},
}
RconControllerFilters = {}
FreeFlightKeymaps = {}
FreeFlightKeymaps.win32 = InputUtils.keymaps_key_approved("win32") and {
	quit_game = {
		"keyboard",
		"esc",
		"pressed",
	},
	projection_mode = {
		"keyboard",
		"f7",
		"pressed",
	},
	free_flight_toggle = {
		"keyboard",
		"f8",
		"pressed",
	},
	global_free_flight_toggle = {
		"keyboard",
		"f9",
		"pressed",
	},
	frustum_freeze_toggle = {
		"keyboard",
		"right shift",
		"pressed",
	},
	player_controls_toggle = {
		"keyboard",
		"f10",
		"pressed",
	},
	set_drop_position = {
		"keyboard",
		"enter",
		"pressed",
	},
	increase_fov = {
		"keyboard",
		"numpad +",
		"pressed",
	},
	decrease_fov = {
		"keyboard",
		"num -",
		"pressed",
	},
	toggle_debug_info = {
		"keyboard",
		"f12",
		"pressed",
	},
	move_forward = {
		"keyboard",
		"w",
		"soft_button",
	},
	move_right = {
		"keyboard",
		"d",
		"soft_button",
	},
	move_left = {
		"keyboard",
		"a",
		"soft_button",
	},
	move_back = {
		"keyboard",
		"s",
		"soft_button",
	},
	move_down = {
		"keyboard",
		"q",
		"soft_button",
	},
	move_up = {
		"keyboard",
		"e",
		"soft_button",
	},
	mark = {
		"keyboard",
		"c",
		"pressed",
	},
	toggle_control_points = {
		"keyboard",
		"y",
		"pressed",
	},
	step_frame_1 = {
		"keyboard",
		"left shift",
		"held",
	},
	step_frame_2 = {
		"keyboard",
		"up",
		"pressed",
	},
	play_pause_1 = {
		"keyboard",
		"left shift",
		"held",
	},
	play_pause_2 = {
		"keyboard",
		"down",
		"pressed",
	},
	increase_frame_step_1 = {
		"keyboard",
		"left shift",
		"held",
	},
	increase_frame_step_2 = {
		"keyboard",
		"right",
		"pressed",
	},
	decrease_frame_step_1 = {
		"keyboard",
		"left shift",
		"held",
	},
	decrease_frame_step_2 = {
		"keyboard",
		"left",
		"pressed",
	},
	reset_toggle_mod = {
		"keyboard",
		"left ctrl",
		"held",
	},
	toggle_dof = {
		"keyboard",
		"f",
		"pressed",
	},
	inc_dof_distance = {
		"keyboard",
		"g",
		"held",
	},
	dec_dof_distance = {
		"keyboard",
		"b",
		"held",
	},
	inc_dof_region = {
		"keyboard",
		"h",
		"held",
	},
	dec_dof_region = {
		"keyboard",
		"n",
		"held",
	},
	inc_dof_padding = {
		"keyboard",
		"j",
		"held",
	},
	dec_dof_padding = {
		"keyboard",
		"m",
		"held",
	},
	inc_dof_scale = {
		"keyboard",
		"k",
		"held",
	},
	dec_dof_scale = {
		"keyboard",
		"oem_comma (< ,)",
		"held",
	},
	look = {
		"mouse",
		"mouse",
		"axis",
	},
	speed_change = {
		"mouse",
		"wheel",
		"axis",
	},
	ray = {
		"mouse",
		"left",
		"pressed",
	},
	toggle_mouse_focus = {
		"mouse",
		"right",
		"pressed",
	},
	cursor = {
		"mouse",
		"cursor",
		"axis",
	},
	action_one = {
		"mouse",
		"left",
		"pressed",
	},
	action_two = {
		"mouse",
		"right",
		"pressed",
	},
	k = {
		"keyboard",
		"k",
		"pressed",
	},
	l = {
		"keyboard",
		"l",
		"pressed",
	},
	x = {
		"keyboard",
		"x",
		"pressed",
	},
	m = {
		"keyboard",
		"m",
		"pressed",
	},
	comma = {
		"keyboard",
		"oem_comma (< ,)",
		"pressed",
	},
	period = {
		"keyboard",
		"oem_period (> .)",
		"pressed",
	},
	left_ctrl = {
		"keyboard",
		"left ctrl",
		"pressed",
	},
	keyboard_1 = {
		"keyboard",
		"1",
		"pressed",
	},
	keyboard_2 = {
		"keyboard",
		"2",
		"pressed",
	},
	keyboard_3 = {
		"keyboard",
		"3",
		"pressed",
	},
	keyboard_4 = {
		"keyboard",
		"4",
		"pressed",
	},
	keyboard_5 = {
		"keyboard",
		"5",
		"pressed",
	},
	keyboard_6 = {
		"keyboard",
		"6",
		"pressed",
	},
	keyboard_7 = {
		"keyboard",
		"7",
		"pressed",
	},
	keyboard_8 = {
		"keyboard",
		"8",
		"pressed",
	},
	keyboard_9 = {
		"keyboard",
		"9",
		"pressed",
	},
	keyboard_0 = {
		"keyboard",
		"0",
		"pressed",
	},
}
FreeFlightKeymaps.xb1 = InputUtils.keymaps_key_approved("xb1") and {
	quit_game = {
		"keyboard",
		"esc",
		"pressed",
	},
	projection_mode = {
		"keyboard",
		"f7",
		"pressed",
	},
	frustum_freeze_toggle = {
		"gamepad",
		"x",
		"pressed",
	},
	set_drop_position = {
		"gamepad",
		"a",
		"pressed",
	},
	increase_fov = {
		"keyboard",
		"numpad +",
		"pressed",
	},
	decrease_fov = {
		"keyboard",
		"num -",
		"pressed",
	},
	toggle_debug_info = {
		"keyboard",
		"f12",
		"pressed",
	},
	move_forward = {
		"keyboard",
		"w",
		"soft_button",
	},
	move_right = {
		"keyboard",
		"d",
		"soft_button",
	},
	move_left = {
		"keyboard",
		"a",
		"soft_button",
	},
	move_back = {
		"keyboard",
		"s",
		"soft_button",
	},
	move_down = {
		"keyboard",
		"q",
		"soft_button",
	},
	move_up = {
		"keyboard",
		"e",
		"soft_button",
	},
	move = {
		"gamepad",
		"left",
		"axis",
	},
	mark = {
		"keyboard",
		"c",
		"pressed",
	},
	toggle_control_points = {
		"keyboard",
		"t",
		"pressed",
	},
	step_frame = {
		"keyboard",
		"up",
		"pressed",
	},
	play_pause = {
		"keyboard",
		"down",
		"pressed",
	},
	increase_frame_step = {
		"keyboard",
		"right",
		"pressed",
	},
	decrease_frame_step = {
		"keyboard",
		"left",
		"pressed",
	},
	left_shoulder_held = {
		"gamepad",
		"left_shoulder",
		"held",
	},
	right_shoulder = {
		"gamepad",
		"right_shoulder",
		"pressed",
	},
	right_thumb_held = {
		"gamepad",
		"right_thumb",
		"held",
	},
	left_thumb_held = {
		"gamepad",
		"left_thumb",
		"held",
	},
	right_trigger = {
		"gamepad",
		"right_trigger",
		"held",
	},
	right_trigger_held = {
		"gamepad",
		"right_trigger",
		"held",
	},
	left_trigger_held = {
		"gamepad",
		"left_trigger",
		"held",
	},
	look_raw_controller = {
		"gamepad",
		"right",
		"axis",
	},
	speed_change = {
		"mouse",
		"wheel",
		"axis",
	},
	ray = {
		"mouse",
		"left",
		"pressed",
	},
	toggle_mouse_focus = {
		"mouse",
		"right",
		"pressed",
	},
	cursor = {
		"mouse",
		"cursor",
		"axis",
	},
	action_one = {
		"mouse",
		"left",
		"pressed",
	},
	action_two = {
		"mouse",
		"right",
		"pressed",
	},
	gamepad_x_pressed = {
		"gamepad",
		"x",
		"pressed",
	},
	gamepad_y_pressed = {
		"gamepad",
		"y",
		"pressed",
	},
	gamepad_b_pressed = {
		"gamepad",
		"b",
		"pressed",
	},
	gamepad_a_pressed = {
		"gamepad",
		"a",
		"pressed",
	},
	gamepad_x_held = {
		"gamepad",
		"x",
		"held",
	},
	gamepad_y_held = {
		"gamepad",
		"y",
		"held",
	},
	gamepad_b_held = {
		"gamepad",
		"b",
		"held",
	},
	gamepad_a_held = {
		"gamepad",
		"a",
		"held",
	},
	reset_toggle_mod = {
		"keyboard",
		"left ctrl",
		"held",
	},
	toggle_dof = {
		"gamepad",
		"right_shoulder",
		"pressed",
	},
	inc_dof_distance = {
		"gamepad",
		"right_trigger",
		"held",
	},
	dec_dof_distance = {
		"gamepad",
		"left_trigger",
		"held",
	},
	k = {
		"keyboard",
		"k",
		"pressed",
	},
	l = {
		"keyboard",
		"l",
		"pressed",
	},
	x = {
		"keyboard",
		"x",
		"pressed",
	},
	m = {
		"keyboard",
		"m",
		"pressed",
	},
	comma = {
		"keyboard",
		"oem_comma (< ,)",
		"pressed",
	},
	period = {
		"keyboard",
		"oem_period (> .)",
		"pressed",
	},
	left_ctrl = {
		"keyboard",
		"left ctrl",
		"pressed",
	},
}
FreeFlightKeymaps.ps4 = InputUtils.keymaps_key_approved("ps4") and {
	quit_game = {
		"keyboard",
		"esc",
		"pressed",
	},
	projection_mode = {
		"keyboard",
		"f7",
		"pressed",
	},
	frustum_freeze_toggle = {
		"gamepad",
		"square",
		"pressed",
	},
	set_drop_position = {
		"gamepad",
		"cross",
		"pressed",
	},
	increase_fov = {
		"keyboard",
		"numpad +",
		"pressed",
	},
	decrease_fov = {
		"keyboard",
		"num -",
		"pressed",
	},
	toggle_debug_info = {
		"keyboard",
		"f12",
		"pressed",
	},
	move_forward = {
		"keyboard",
		"w",
		"soft_button",
	},
	move_right = {
		"keyboard",
		"d",
		"soft_button",
	},
	move_left = {
		"keyboard",
		"a",
		"soft_button",
	},
	move_back = {
		"keyboard",
		"s",
		"soft_button",
	},
	move_down = {
		"keyboard",
		"q",
		"soft_button",
	},
	move_up = {
		"keyboard",
		"e",
		"soft_button",
	},
	move = {
		"gamepad",
		"left",
		"axis",
	},
	mark = {
		"keyboard",
		"c",
		"pressed",
	},
	toggle_control_points = {
		"keyboard",
		"t",
		"pressed",
	},
	step_frame = {
		"keyboard",
		"up",
		"pressed",
	},
	play_pause = {
		"keyboard",
		"down",
		"pressed",
	},
	increase_frame_step = {
		"keyboard",
		"right",
		"pressed",
	},
	decrease_frame_step = {
		"keyboard",
		"left",
		"pressed",
	},
	left_shoulder = {
		"gamepad",
		"l1",
		"pressed",
	},
	left_shoulder_held = {
		"gamepad",
		"l1",
		"held",
	},
	right_shoulder = {
		"gamepad",
		"r1",
		"pressed",
	},
	right_shoulder_held = {
		"gamepad",
		"r1",
		"held",
	},
	left_trigger = {
		"gamepad",
		"l2",
		"pressed",
	},
	left_trigger_held = {
		"gamepad",
		"l2",
		"held",
	},
	right_trigger = {
		"gamepad",
		"r2",
		"pressed",
	},
	right_trigger_held = {
		"gamepad",
		"r2",
		"held",
	},
	right_thumb = {
		"gamepad",
		"r3",
		"pressed",
	},
	right_thumb_held = {
		"gamepad",
		"r3",
		"held",
	},
	left_thumb = {
		"gamepad",
		"l3",
		"pressed",
	},
	left_thumb_held = {
		"gamepad",
		"l3",
		"held",
	},
	gamepad_cross_pressed = {
		"gamepad",
		"cross",
		"pressed",
	},
	gamepad_cross_held = {
		"gamepad",
		"cross",
		"held",
	},
	gamepad_square_pressed = {
		"gamepad",
		"square",
		"pressed",
	},
	gamepad_square_held = {
		"gamepad",
		"square",
		"held",
	},
	gamepad_triangle_pressed = {
		"gamepad",
		"triangle",
		"pressed",
	},
	gamepad_triangle_held = {
		"gamepad",
		"triangle",
		"held",
	},
	gamepad_circle_pressed = {
		"gamepad",
		"circle",
		"pressed",
	},
	gamepad_circle_held = {
		"gamepad",
		"circle",
		"held",
	},
	gamepad_left_stick = {
		"gamepad",
		"left",
		"axis",
	},
	gamepad_right_stick = {
		"gamepad",
		"right",
		"axis",
	},
	look_raw_controller = {
		"gamepad",
		"right",
		"axis",
	},
	speed_change = {
		"mouse",
		"wheel",
		"axis",
	},
	ray = {
		"mouse",
		"left",
		"pressed",
	},
	toggle_mouse_focus = {
		"mouse",
		"right",
		"pressed",
	},
	cursor = {
		"mouse",
		"cursor",
		"axis",
	},
	action_one = {
		"mouse",
		"left",
		"pressed",
	},
	action_two = {
		"mouse",
		"right",
		"pressed",
	},
	reset_toggle_mod = {
		"keyboard",
		"left ctrl",
		"held",
	},
	toggle_dof = {
		"gamepad",
		"right_shoulder",
		"pressed",
	},
	inc_dof_distance = {
		"gamepad",
		"right_trigger",
		"held",
	},
	dec_dof_distance = {
		"gamepad",
		"left_trigger",
		"held",
	},
	k = {
		"keyboard",
		"k",
		"pressed",
	},
	l = {
		"keyboard",
		"l",
		"pressed",
	},
	x = {
		"keyboard",
		"x",
		"pressed",
	},
	m = {
		"keyboard",
		"m",
		"pressed",
	},
	comma = {
		"keyboard",
		"oem_comma (< ,)",
		"pressed",
	},
	period = {
		"keyboard",
		"oem_period (> .)",
		"pressed",
	},
	left_ctrl = {
		"keyboard",
		"left ctrl",
		"pressed",
	},
}
FreeFlightKeymaps.ps_pad = InputUtils.keymaps_key_approved("ps_pad") and {
	quit_game = {
		"keyboard",
		"esc",
		"pressed",
	},
	projection_mode = {
		"keyboard",
		"f7",
		"pressed",
	},
	frustum_freeze_toggle = {
		"ps_pad",
		"square",
		"pressed",
	},
	set_drop_position = {
		"ps_pad",
		"cross",
		"pressed",
	},
	increase_fov = {
		"keyboard",
		"numpad +",
		"pressed",
	},
	decrease_fov = {
		"keyboard",
		"num -",
		"pressed",
	},
	toggle_debug_info = {
		"keyboard",
		"f12",
		"pressed",
	},
	move_forward = {
		"keyboard",
		"w",
		"soft_button",
	},
	move_right = {
		"keyboard",
		"d",
		"soft_button",
	},
	move_left = {
		"keyboard",
		"a",
		"soft_button",
	},
	move_back = {
		"keyboard",
		"s",
		"soft_button",
	},
	move_down = {
		"keyboard",
		"q",
		"soft_button",
	},
	move_up = {
		"keyboard",
		"e",
		"soft_button",
	},
	move = {
		"ps_pad",
		"left",
		"axis",
	},
	mark = {
		"keyboard",
		"c",
		"pressed",
	},
	toggle_control_points = {
		"keyboard",
		"t",
		"pressed",
	},
	step_frame = {
		"keyboard",
		"up",
		"pressed",
	},
	play_pause = {
		"keyboard",
		"down",
		"pressed",
	},
	increase_frame_step = {
		"keyboard",
		"right",
		"pressed",
	},
	decrease_frame_step = {
		"keyboard",
		"left",
		"pressed",
	},
	left_shoulder = {
		"ps_pad",
		"l1",
		"pressed",
	},
	left_shoulder_held = {
		"ps_pad",
		"l1",
		"held",
	},
	right_shoulder = {
		"ps_pad",
		"r1",
		"pressed",
	},
	right_shoulder_held = {
		"ps_pad",
		"r1",
		"held",
	},
	left_trigger = {
		"ps_pad",
		"l2",
		"pressed",
	},
	left_trigger_held = {
		"ps_pad",
		"l2",
		"held",
	},
	right_trigger = {
		"ps_pad",
		"r2",
		"pressed",
	},
	right_trigger_held = {
		"ps_pad",
		"r2",
		"held",
	},
	right_thumb = {
		"ps_pad",
		"r3",
		"pressed",
	},
	right_thumb_held = {
		"ps_pad",
		"r3",
		"held",
	},
	left_thumb = {
		"ps_pad",
		"l3",
		"pressed",
	},
	left_thumb_held = {
		"ps_pad",
		"l3",
		"held",
	},
	gamepad_cross_pressed = {
		"ps_pad",
		"cross",
		"pressed",
	},
	gamepad_cross_held = {
		"ps_pad",
		"cross",
		"held",
	},
	gamepad_square_pressed = {
		"ps_pad",
		"square",
		"pressed",
	},
	gamepad_square_held = {
		"ps_pad",
		"square",
		"held",
	},
	gamepad_triangle_pressed = {
		"ps_pad",
		"triangle",
		"pressed",
	},
	gamepad_triangle_held = {
		"ps_pad",
		"triangle",
		"held",
	},
	gamepad_circle_pressed = {
		"ps_pad",
		"circle",
		"pressed",
	},
	gamepad_circle_held = {
		"ps_pad",
		"circle",
		"held",
	},
	gamepad_left_stick = {
		"ps_pad",
		"left",
		"axis",
	},
	gamepad_right_stick = {
		"ps_pad",
		"right",
		"axis",
	},
	look_raw_controller = {
		"ps_pad",
		"right",
		"axis",
	},
	speed_change = {
		"mouse",
		"wheel",
		"axis",
	},
	ray = {
		"mouse",
		"left",
		"pressed",
	},
	toggle_mouse_focus = {
		"mouse",
		"right",
		"pressed",
	},
	cursor = {
		"mouse",
		"cursor",
		"axis",
	},
	action_one = {
		"mouse",
		"left",
		"pressed",
	},
	action_two = {
		"mouse",
		"right",
		"pressed",
	},
	reset_toggle_mod = {
		"keyboard",
		"left ctrl",
		"held",
	},
	toggle_dof = {
		"ps_pad",
		"r1",
		"pressed",
	},
	inc_dof_distance = {
		"ps_pad",
		"r2",
		"held",
	},
	dec_dof_distance = {
		"ps_pad",
		"l2",
		"held",
	},
	k = {
		"keyboard",
		"k",
		"pressed",
	},
	l = {
		"keyboard",
		"l",
		"pressed",
	},
	x = {
		"keyboard",
		"x",
		"pressed",
	},
	m = {
		"keyboard",
		"m",
		"pressed",
	},
	comma = {
		"keyboard",
		"oem_comma (< ,)",
		"pressed",
	},
	period = {
		"keyboard",
		"oem_period (> .)",
		"pressed",
	},
	left_ctrl = {
		"keyboard",
		"left ctrl",
		"pressed",
	},
}
FreeFlightFilters = {}
FreeFlightFilters.win32 = InputUtils.keymaps_key_approved("win32") and {
	move = {
		filter_type = "virtual_axis",
		input_mappings = {
			back = "move_back",
			down = "move_down",
			forward = "move_forward",
			left = "move_left",
			right = "move_right",
			up = "move_up",
		},
	},
	dof_reset = {
		filter_type = "and",
		input_mappings = {
			button_1 = "reset_toggle_mod",
			button_2 = "toggle_dof",
		},
	},
	step_frame = {
		filter_type = "and",
		input_mappings = {
			button_1 = "step_frame_1",
			button_2 = "step_frame_2",
		},
	},
	play_pause = {
		filter_type = "and",
		input_mappings = {
			button_1 = "play_pause_1",
			button_2 = "play_pause_2",
		},
	},
	increase_frame_step = {
		filter_type = "and",
		input_mappings = {
			button_1 = "increase_frame_step_1",
			button_2 = "increase_frame_step_2",
		},
	},
	decrease_frame_step = {
		filter_type = "and",
		input_mappings = {
			button_1 = "decrease_frame_step_1",
			button_2 = "decrease_frame_step_2",
		},
	},
}
FreeFlightFilters.xb1 = InputUtils.keymaps_key_approved("xb1") and {
	look = {
		accelerate_time_ref = 0.1,
		acceleration_delay = 0,
		filter_type = "scale_vector3_xy_accelerated_x",
		input_mapping = "look_raw_controller",
		multiplier_x = 600,
		multiplier_y = -400.5,
		power_of = 2,
		threshold = 0.925,
	},
	dof_reset = {
		filter_type = "and",
		input_mappings = {
			button_1 = "reset_toggle_mod",
			button_2 = "toggle_dof",
		},
	},
	inc_dof_region = {
		filter_type = "and",
		input_mappings = {
			button_1 = "right_trigger_held",
			button_2 = "gamepad_y_held",
		},
	},
	dec_dof_region = {
		filter_type = "and",
		input_mappings = {
			button_1 = "left_trigger_held",
			button_2 = "gamepad_y_held",
		},
	},
	inc_dof_padding = {
		filter_type = "and",
		input_mappings = {
			button_1 = "right_trigger_held",
			button_2 = "gamepad_b_held",
		},
	},
	dec_dof_padding = {
		filter_type = "and",
		input_mappings = {
			button_1 = "left_trigger_held",
			button_2 = "gamepad_b_held",
		},
	},
	inc_dof_scale = {
		filter_type = "and",
		input_mappings = {
			button_1 = "right_trigger_held",
			button_2 = "gamepad_x_held",
		},
	},
	dec_dof_scale = {
		filter_type = "and",
		input_mappings = {
			button_1 = "left_trigger_held",
			button_2 = "gamepad_x_held",
		},
	},
	free_flight_toggle = {
		filter_type = "and",
		name = "free_flight_toggle",
		input_mappings = {
			button_1 = "right_thumb_held",
			button_2 = "left_thumb_held",
			button_3 = "left_shoulder_held",
			button_4 = "right_shoulder",
		},
	},
	global_free_flight_toggle = {
		filter_type = "and",
		name = "global_free_flight_toggle",
		input_mappings = {
			button_1 = "left_thumb_held",
			button_2 = "gamepad_a_pressed",
		},
	},
}

local FreeFlightFilters_ps4 = {
	look = {
		accelerate_time_ref = 0.1,
		acceleration_delay = 0,
		filter_type = "scale_vector3_xy_accelerated_x",
		input_mapping = "look_raw_controller",
		multiplier_x = 600,
		multiplier_y = -400.5,
		power_of = 2,
		threshold = 0.925,
	},
	move = {
		filter_type = "virtual_axis",
		input_mappings = {
			back = "move_back",
			down = "move_down",
			forward = "move_forward",
			left = "move_left",
			right = "move_right",
			up = "move_up",
		},
	},
	dof_reset = {
		filter_type = "and",
		input_mappings = {
			button_1 = "reset_toggle_mod",
			button_2 = "toggle_dof",
		},
	},
	inc_dof_region = {
		filter_type = "and",
		input_mappings = {
			button_1 = "right_trigger_held",
			button_2 = "gamepad_triangle_held",
		},
	},
	dec_dof_region = {
		filter_type = "and",
		input_mappings = {
			button_1 = "left_trigger_held",
			button_2 = "gamepad_triangle_held",
		},
	},
	inc_dof_padding = {
		filter_type = "and",
		input_mappings = {
			button_1 = "right_trigger_held",
			button_2 = "gamepad_circle_held",
		},
	},
	dec_dof_padding = {
		filter_type = "and",
		input_mappings = {
			button_1 = "left_trigger_held",
			button_2 = "gamepad_circle_held",
		},
	},
	inc_dof_scale = {
		filter_type = "and",
		input_mappings = {
			button_1 = "right_trigger_held",
			button_2 = "gamepad_square_held",
		},
	},
	dec_dof_scale = {
		filter_type = "and",
		input_mappings = {
			button_1 = "left_trigger_held",
			button_2 = "gamepad_square_held",
		},
	},
	free_flight_toggle = {
		filter_type = "and",
		input_mappings = {
			button_1 = "right_thumb_held",
			button_2 = "left_thumb_held",
			button_3 = "left_shoulder_held",
			button_4 = "right_shoulder",
		},
	},
	global_free_flight_toggle = {
		filter_type = "and",
		input_mappings = {
			button_1 = "left_thumb_held",
			button_2 = "gamepad_cross_pressed",
		},
	},
}

FreeFlightFilters.ps4 = InputUtils.keymaps_key_approved("ps4") and FreeFlightFilters_ps4
FreeFlightFilters.ps_pad = InputUtils.keymaps_key_approved("ps_pad") and FreeFlightFilters_ps4
SplashScreenKeymaps = {}
SplashScreenKeymaps.win32 = InputUtils.keymaps_key_approved("win32") and {
	skip_splash_1 = {
		"keyboard",
		"enter",
		"pressed",
	},
	skip_splash_2 = {
		"keyboard",
		"space",
		"pressed",
	},
	skip_splash_3 = {
		"keyboard",
		"esc",
		"pressed",
	},
	skip_splash_4 = {
		"gamepad",
		"a",
		"pressed",
	},
	skip_splash_5 = {
		"mouse",
		"left",
		"pressed",
	},
	skip_splash_6 = {
		"mouse",
		"right",
		"pressed",
	},
}
SplashScreenKeymaps.xb1 = InputUtils.keymaps_key_approved("xb1") and {
	skip_splash = {
		"gamepad",
		"a",
		"pressed",
	},
}
SplashScreenKeymaps.ps4 = InputUtils.keymaps_key_approved("ps4") and {
	skip_splash = {
		"gamepad",
		"cross",
		"pressed",
	},
}
SplashScreenKeymaps.ps_pad = InputUtils.keymaps_key_approved("ps_pad") and {
	skip_splash = {
		"ps_pad",
		"cross",
		"pressed",
	},
}
SplashScreenFilters = {}
SplashScreenFilters.win32 = InputUtils.keymaps_key_approved("win32") and {
	skip_splash = {
		filter_type = "or",
		input_mappings = {
			button_1 = "skip_splash_1",
			button_2 = "skip_splash_2",
			button_3 = "skip_splash_3",
			button_4 = "skip_splash_4",
			button_5 = "skip_splash_5",
			button_6 = "skip_splash_6",
		},
	},
}
SplashScreenFilters.xb1 = InputUtils.keymaps_key_approved("xb1") and {}
SplashScreenFilters.ps4 = InputUtils.keymaps_key_approved("ps4") and {}
SplashScreenFilters.ps_pad = InputUtils.keymaps_key_approved("ps_pad") and {}
TitleLoadingKeyMaps = {}
TitleLoadingKeyMaps.win32 = InputUtils.keymaps_key_approved("win32") and {
	cancel_video_1 = {
		"keyboard",
		"space",
		"pressed",
	},
	cancel_video_2 = {
		"keyboard",
		"esc",
		"pressed",
	},
	cancel_video_3 = {
		"gamepad",
		"a",
		"pressed",
	},
	cursor = {
		"mouse",
		"cursor",
		"axis",
	},
	left_release = {
		"mouse",
		"left",
		"released",
	},
	left_press = {
		"mouse",
		"left",
		"pressed",
	},
	left_hold = {
		"mouse",
		"left",
		"held",
	},
	confirm = {
		"gamepad",
		"a",
		"released",
	},
	move_left = {
		"gamepad",
		"d_left",
		"pressed",
	},
	move_right = {
		"gamepad",
		"d_right",
		"pressed",
	},
	move_left_hold = {
		"gamepad",
		"d_left",
		"held",
	},
	move_right_hold = {
		"gamepad",
		"d_right",
		"held",
	},
	analog_input = {
		"gamepad",
		"left",
		"axis",
	},
}
TitleLoadingKeyMaps.xb1 = InputUtils.keymaps_key_approved("xb1") and {
	cancel_video_1 = {
		"gamepad",
		"a",
		"pressed",
	},
	confirm = {
		"gamepad",
		"a",
		"released",
	},
	move_left = {
		"gamepad",
		"d_left",
		"pressed",
	},
	move_right = {
		"gamepad",
		"d_right",
		"pressed",
	},
	move_left_hold = {
		"gamepad",
		"d_left",
		"held",
	},
	move_right_hold = {
		"gamepad",
		"d_right",
		"held",
	},
	analog_input = {
		"gamepad",
		"left",
		"axis",
	},
}
TitleLoadingKeyMaps.ps4 = InputUtils.keymaps_key_approved("ps4") and {
	cancel_video_1 = {
		"gamepad",
		"cross",
		"pressed",
	},
	confirm = {
		"gamepad",
		"cross",
		"released",
	},
	move_left = {
		"gamepad",
		"left",
		"pressed",
	},
	move_right = {
		"gamepad",
		"right",
		"pressed",
	},
	move_left_hold = {
		"gamepad",
		"left",
		"held",
	},
	move_right_hold = {
		"gamepad",
		"right",
		"held",
	},
	analog_input = {
		"gamepad",
		"left",
		"axis",
	},
}
TitleLoadingKeyMaps.ps_pad = InputUtils.keymaps_key_approved("ps_pad") and {
	cancel_video_1 = {
		"ps_pad",
		"cross",
		"pressed",
	},
	confirm = {
		"ps_pad",
		"cross",
		"released",
	},
	move_left = {
		"ps_pad",
		"left",
		"pressed",
	},
	move_right = {
		"ps_pad",
		"right",
		"pressed",
	},
	move_left_hold = {
		"ps_pad",
		"left",
		"held",
	},
	move_right_hold = {
		"ps_pad",
		"right",
		"held",
	},
	analog_input = {
		"ps_pad",
		"left",
		"axis",
	},
}
TitleLoadingFilters = {}
TitleLoadingFilters.win32 = InputUtils.keymaps_key_approved("win32") and {
	cancel_video = {
		filter_type = "or",
		input_mappings = {
			button_1 = "cancel_video_1",
			button_2 = "cancel_video_2",
			button_3 = "cancel_video_3",
		},
	},
}
TitleLoadingFilters.xb1 = InputUtils.keymaps_key_approved("xb1") and {
	cancel_video = {
		filter_type = "or",
		input_mappings = {
			button_1 = "cancel_video_1",
		},
	},
}

local TitleLoadingFilters_ps4 = {
	cancel_video = {
		filter_type = "or",
		input_mappings = {
			button_1 = "cancel_video_1",
		},
	},
}

TitleLoadingFilters.ps4 = InputUtils.keymaps_key_approved("ps4") and TitleLoadingFilters_ps4
TitleLoadingFilters.ps_pad = InputUtils.keymaps_key_approved("ps_pad") and TitleLoadingFilters_ps4
TitleScreenKeyMaps = {}
TitleScreenKeyMaps.win32 = InputUtils.keymaps_key_approved("win32") and {
	move_up_raw = {
		"keyboard",
		"up",
		"pressed",
	},
	move_down_raw = {
		"keyboard",
		"down",
		"pressed",
	},
	move_left_raw = {
		"keyboard",
		"left",
		"pressed",
	},
	move_right_raw = {
		"keyboard",
		"right",
		"pressed",
	},
	analog_input = {},
	move_up_alt_raw = {
		"keyboard",
		"w",
		"pressed",
	},
	move_down_alt_raw = {
		"keyboard",
		"s",
		"pressed",
	},
	move_left_alt_raw = {
		"keyboard",
		"a",
		"pressed",
	},
	move_right_alt_raw = {
		"keyboard",
		"d",
		"pressed",
	},
	cursor = {
		"mouse",
		"cursor",
		"axis",
	},
	left_press = {
		"mouse",
		"left",
		"pressed",
	},
	left_hold = {
		"mouse",
		"left",
		"held",
	},
	left_release = {
		"mouse",
		"left",
		"released",
	},
	back_1 = {
		"gamepad",
		"b",
		"pressed",
	},
	back_2 = {
		"keyboard",
		"esc",
		"pressed",
	},
	confirm_press = {},
	start_1 = {
		"keyboard",
		"enter",
		"pressed",
	},
	start_2 = {
		"keyboard",
		"space",
		"pressed",
	},
	start_3 = {
		"mouse",
		"left",
		"pressed",
	},
	start_4 = {
		"mouse",
		"right",
		"pressed",
	},
	start_5 = {
		"mouse",
		"extra_1",
		"pressed",
	},
	show_support_info_1 = {
		"keyboard",
		"left shift",
		"held",
	},
	show_support_info_2 = {
		"keyboard",
		"f12",
		"held",
	},
	previous = {},
	next = {},
	scroll_axis = {
		"mouse",
		"wheel",
		"axis",
	},
}
TitleScreenKeyMaps.xb1 = InputUtils.keymaps_key_approved("xb1") and {
	move_left_raw = {
		"gamepad",
		"d_left",
		"pressed",
	},
	move_right_raw = {
		"gamepad",
		"d_right",
		"pressed",
	},
	move_up_raw = {
		"gamepad",
		"d_up",
		"pressed",
	},
	move_down_raw = {
		"gamepad",
		"d_down",
		"pressed",
	},
	analog_input = {
		"gamepad",
		"left",
		"axis",
	},
	axis_cursor = {
		"gamepad",
		"left",
		"axis",
	},
	left_press = {
		"gamepad",
		"a",
		"pressed",
	},
	left_hold = {
		"gamepad",
		"a",
		"held",
	},
	left_release = {
		"gamepad",
		"a",
		"released",
	},
	confirm_press = {
		"gamepad",
		"a",
		"pressed",
	},
	special_1_press = {
		"gamepad",
		"x",
		"pressed",
	},
	start_1 = {
		"gamepad",
		"a",
		"pressed",
	},
	back_1 = {
		"gamepad",
		"b",
		"pressed",
	},
	delete_save = {
		"gamepad",
		"back",
		"pressed",
	},
	show_support_info_1 = {
		"gamepad",
		"left_shoulder",
		"held",
	},
	show_support_info_2 = {
		"gamepad",
		"right_shoulder",
		"held",
	},
	previous = {
		"gamepad",
		"left_shoulder",
		"pressed",
	},
	next = {
		"gamepad",
		"right_shoulder",
		"pressed",
	},
	scroll_axis = {
		"gamepad",
		"right",
		"axis",
	},
	gamepad_right_axis = {
		"gamepad",
		"right",
		"axis",
	},
	start_press = {
		"gamepad",
		"start",
		"pressed",
	},
}
TitleScreenKeyMaps.ps4 = InputUtils.keymaps_key_approved("ps4") and {
	move_left_raw = {
		"gamepad",
		"left",
		"pressed",
	},
	move_right_raw = {
		"gamepad",
		"right",
		"pressed",
	},
	move_up_raw = {
		"gamepad",
		"up",
		"pressed",
	},
	move_down_raw = {
		"gamepad",
		"down",
		"pressed",
	},
	analog_input = {
		"gamepad",
		"left",
		"axis",
	},
	axis_cursor = {
		"gamepad",
		"left",
		"axis",
	},
	left_press = {
		"gamepad",
		"cross",
		"pressed",
	},
	left_hold = {
		"gamepad",
		"cross",
		"held",
	},
	left_release = {
		"gamepad",
		"cross",
		"released",
	},
	confirm_press = {
		"gamepad",
		"cross",
		"pressed",
	},
	special_1_press = {
		"gamepad",
		"square",
		"pressed",
	},
	start_1 = {
		"gamepad",
		"cross",
		"pressed",
	},
	back_1 = {
		"gamepad",
		"circle",
		"pressed",
	},
	delete_save = {
		"gamepad",
		"touch",
		"pressed",
	},
	show_support_info_1 = {
		"gamepad",
		"l1",
		"held",
	},
	show_support_info_2 = {
		"gamepad",
		"r1",
		"held",
	},
	previous = {
		"gamepad",
		"l1",
		"pressed",
	},
	next = {
		"gamepad",
		"r1",
		"pressed",
	},
	scroll_axis = {
		"gamepad",
		"right",
		"axis",
	},
	gamepad_right_axis = {
		"gamepad",
		"right",
		"axis",
	},
	start_press = {
		"gamepad",
		"options",
		"pressed",
	},
}
TitleScreenKeyMaps.ps_pad = InputUtils.keymaps_key_approved("ps_pad") and {
	move_left_raw = {
		"ps_pad",
		"left",
		"pressed",
	},
	move_right_raw = {
		"ps_pad",
		"right",
		"pressed",
	},
	move_up_raw = {
		"ps_pad",
		"up",
		"pressed",
	},
	move_down_raw = {
		"ps_pad",
		"down",
		"pressed",
	},
	analog_input = {
		"ps_pad",
		"left",
		"axis",
	},
	axis_cursor = {
		"ps_pad",
		"left",
		"axis",
	},
	left_press = {
		"ps_pad",
		"cross",
		"pressed",
	},
	left_hold = {
		"ps_pad",
		"cross",
		"held",
	},
	left_release = {
		"ps_pad",
		"cross",
		"released",
	},
	confirm_press = {
		"ps_pad",
		"cross",
		"pressed",
	},
	special_1_press = {
		"ps_pad",
		"square",
		"pressed",
	},
	start_1 = {
		"ps_pad",
		"cross",
		"pressed",
	},
	back_1 = {
		"ps_pad",
		"circle",
		"pressed",
	},
	delete_save = {
		"ps_pad",
		"touch",
		"pressed",
	},
	show_support_info_1 = {
		"ps_pad",
		"l1",
		"held",
	},
	show_support_info_2 = {
		"ps_pad",
		"r1",
		"held",
	},
	previous = {
		"ps_pad",
		"l1",
		"pressed",
	},
	next = {
		"ps_pad",
		"r1",
		"pressed",
	},
	scroll_axis = {
		"ps_pad",
		"right",
		"axis",
	},
	gamepad_right_axis = {
		"ps_pad",
		"right",
		"axis",
	},
	start_press = {
		"ps_pad",
		"options",
		"pressed",
	},
}
TitleScreenFilters = {}
TitleScreenFilters.win32 = InputUtils.keymaps_key_approved("win32") and {
	start = {
		filter_type = "or",
		input_mappings = {
			button_1 = "start_1",
			button_2 = "start_2",
			button_3 = "start_3",
			button_4 = "start_4",
			button_5 = "start_5",
		},
	},
	back = {
		filter_type = "or",
		input_mappings = {
			button_1 = "back_1",
			button_2 = "back_2",
		},
	},
	down = {
		filter_type = "move_filter",
		threshold = 0.7,
		input_mappings = {
			"move_down_raw",
			"move_down_alt_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			0,
			-1,
			0,
		},
	},
	up = {
		filter_type = "move_filter",
		threshold = 0.7,
		input_mappings = {
			"move_up_raw",
			"move_up_alt_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			0,
			1,
			0,
		},
	},
	left = {
		filter_type = "move_filter",
		threshold = 0.7,
		input_mappings = {
			"move_left_raw",
			"move_left_altraw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			-1,
			0,
			0,
		},
	},
	right = {
		filter_type = "move_filter",
		threshold = 0.7,
		input_mappings = {
			"move_right_raw",
			"move_right_alt_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			1,
			0,
			0,
		},
	},
}
TitleScreenFilters.xb1 = InputUtils.keymaps_key_approved("xb1") and {
	start = {
		filter_type = "or",
		input_mappings = {
			button_1 = "start_1",
		},
	},
	back = {
		filter_type = "or",
		input_mappings = {
			button_1 = "back_1",
		},
	},
	cursor = {
		accelerate_time_ref = 1.2,
		acceleration_delay = 0.2,
		acceleration_threshold = 0.5,
		filter_type = "gamepad_cursor",
		hover_multiplier = 0.3,
		input_mapping = "axis_cursor",
		min_multiplier_x = 25,
		min_multiplier_y = 25,
		multiplier = 1000,
		multiplier_x = 40,
		multiplier_y = 40,
		threshold = 0.1,
	},
	down = {
		filter_type = "move_filter",
		threshold = 0.7,
		input_mappings = {
			"move_down_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			0,
			-1,
			0,
		},
	},
	up = {
		filter_type = "move_filter",
		threshold = 0.7,
		input_mappings = {
			"move_up_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			0,
			1,
			0,
		},
	},
	left = {
		filter_type = "move_filter",
		threshold = 0.7,
		input_mappings = {
			"move_left_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			-1,
			0,
			0,
		},
	},
	right = {
		filter_type = "move_filter",
		threshold = 0.7,
		input_mappings = {
			"move_right_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			1,
			0,
			0,
		},
	},
}

local TitleScreenFilters_ps4 = {
	start = {
		filter_type = "or",
		input_mappings = {
			button_1 = "start_1",
		},
	},
	back = {
		filter_type = "or",
		input_mappings = {
			button_1 = "back_1",
		},
	},
	cursor = {
		accelerate_time_ref = 1.2,
		acceleration_delay = 0.2,
		acceleration_threshold = 0.5,
		filter_type = "gamepad_cursor",
		hover_multiplier = 0.3,
		input_mapping = "axis_cursor",
		min_multiplier_x = 25,
		min_multiplier_y = 25,
		multiplier = 1000,
		multiplier_x = 40,
		multiplier_y = 40,
		threshold = 0.1,
	},
	down = {
		filter_type = "move_filter",
		threshold = 0.7,
		input_mappings = {
			"move_down_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			0,
			-1,
			0,
		},
	},
	up = {
		filter_type = "move_filter",
		threshold = 0.7,
		input_mappings = {
			"move_up_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			0,
			1,
			0,
		},
	},
	left = {
		filter_type = "move_filter",
		threshold = 0.7,
		input_mappings = {
			"move_left_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			-1,
			0,
			0,
		},
	},
	right = {
		filter_type = "move_filter",
		threshold = 0.7,
		input_mappings = {
			"move_right_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			1,
			0,
			0,
		},
	},
}

TitleScreenFilters.ps4 = InputUtils.keymaps_key_approved("ps4") and TitleScreenFilters_ps4
TitleScreenFilters.ps_pad = InputUtils.keymaps_key_approved("ps_pad") and TitleScreenFilters_ps4
DemoUIKeyMaps = {}
DemoUIKeyMaps.win32 = InputUtils.keymaps_key_approved("win32") and {
	left = {
		"gamepad",
		"d_left",
		"pressed",
	},
	right = {
		"gamepad",
		"d_right",
		"pressed",
	},
	up = {
		"gamepad",
		"d_up",
		"pressed",
	},
	down = {
		"gamepad",
		"d_down",
		"pressed",
	},
	back_1 = {
		"gamepad",
		"b",
		"pressed",
	},
	back_2 = {
		"keyboard",
		"esc",
		"pressed",
	},
	confirm_1 = {
		"keyboard",
		"enter",
		"pressed",
	},
	confirm_2 = {
		"keyboard",
		"space",
		"pressed",
	},
	confirm_3 = {
		"mouse",
		"left",
		"pressed",
	},
	confirm_4 = {
		"mouse",
		"right",
		"pressed",
	},
	confirm_5 = {
		"mouse",
		"extra_1",
		"pressed",
	},
}
DemoUIKeyMaps.xb1 = InputUtils.keymaps_key_approved("xb1") and {
	left = {
		"gamepad",
		"d_left",
		"pressed",
	},
	right = {
		"gamepad",
		"d_right",
		"pressed",
	},
	up = {
		"gamepad",
		"d_up",
		"pressed",
	},
	down = {
		"gamepad",
		"d_down",
		"pressed",
	},
	confirm = {
		"gamepad",
		"a",
		"released",
	},
	back = {
		"gamepad",
		"b",
		"pressed",
	},
}
DemoUIKeyMaps.ps4 = InputUtils.keymaps_key_approved("ps4") and {
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
	confirm = {
		"gamepad",
		"cross",
		"released",
	},
	back = {
		"gamepad",
		"circle",
		"pressed",
	},
}
DemoUIKeyMaps.ps_pad = InputUtils.keymaps_key_approved("ps_pad") and {
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
	confirm = {
		"ps_pad",
		"cross",
		"released",
	},
	back = {
		"ps_pad",
		"circle",
		"pressed",
	},
}
DemoUIFilters = {}
DemoUIFilters.win32 = InputUtils.keymaps_key_approved("win32") and {
	start = {
		filter_type = "or",
		input_mappings = {
			button_1 = "start_1",
			button_2 = "start_2",
			button_3 = "start_3",
			button_4 = "start_4",
			button_5 = "start_5",
		},
	},
	back = {
		filter_type = "or",
		input_mappings = {
			button_1 = "back_1",
			button_2 = "back_2",
		},
	},
}
DemoUIFilters.xb1 = InputUtils.keymaps_key_approved("xb1") and {}
DemoUIFilters.ps4 = InputUtils.keymaps_key_approved("ps4") and {}
DemoUIFilters.ps_pad = InputUtils.keymaps_key_approved("ps_pad") and {}
IngamePlayerListKeymaps = {}
IngamePlayerListKeymaps.win32 = InputUtils.keymaps_key_approved("win32") and {
	toggle_menu = {
		"keyboard",
		"esc",
		"pressed",
	},
	cursor = {
		"mouse",
		"cursor",
		"axis",
	},
	left_release = {
		"mouse",
		"left",
		"released",
	},
	left_hold = {
		"mouse",
		"left",
		"held",
	},
	left_press = {
		"mouse",
		"left",
		"pressed",
	},
	right_press = {
		"mouse",
		"right",
		"pressed",
	},
	ingame_player_list_pressed = {
		"keyboard",
		"tab",
		"pressed",
	},
	ingame_player_list_held = {
		"keyboard",
		"tab",
		"held",
	},
	ingame_player_list_toggle = {},
	ingame_player_list_exit_1 = {
		"keyboard",
		"tab",
		"pressed",
	},
	ingame_player_list_exit_2 = {
		"keyboard",
		"esc",
		"pressed",
	},
	close_ingame_player_list = {
		"keyboard",
		"tab",
		"released",
	},
	activate_ingame_player_list_1 = {
		"mouse",
		"right",
		"pressed",
	},
	activate_ingame_player_list_2 = {
		"keyboard",
		"enter",
		"pressed",
	},
	menu_scroll = {
		"mouse",
		"wheel",
		"axis",
	},
	versus_status_list_pressed_1 = {
		"keyboard",
		"left alt",
		"pressed",
	},
	versus_status_list_pressed_2 = {
		"keyboard",
		"right alt",
		"pressed",
	},
	versus_status_list_held_1 = {
		"keyboard",
		"left alt",
		"held",
	},
	versus_status_list_held_2 = {
		"keyboard",
		"right alt",
		"held",
	},
	versus_status_list_toggle = {},
	versus_status_list_exit_1 = {
		"keyboard",
		"left alt",
		"pressed",
	},
	versus_status_list_exit_2 = {
		"keyboard",
		"right alt",
		"pressed",
	},
	versus_status_list_exit_3 = {
		"keyboard",
		"esc",
		"pressed",
	},
	close_versus_status_list_1 = {
		"keyboard",
		"left alt",
		"released",
	},
	close_versus_status_list_2 = {
		"keyboard",
		"right alt",
		"released",
	},
	activate_versus_status_list_1 = {
		"mouse",
		"right",
		"pressed",
	},
	activate_versus_status_list_2 = {
		"keyboard",
		"enter",
		"pressed",
	},
	force_start = {},
	switch_team = {},
	move_up = {},
	move_down = {},
	mute_voice = {},
	mute_chat = {},
	kick_player = {},
	toggle_private = {},
	back = {},
	show_profile = {},
}
IngamePlayerListKeymaps.xb1 = InputUtils.keymaps_key_approved("xb1") and {
	toggle_menu = {
		"gamepad",
		"start",
		"pressed",
	},
	ingame_player_list_toggle = {
		"gamepad",
		"back",
		"pressed",
	},
	mute_voice = {
		"gamepad",
		"y",
		"released",
	},
	mute_chat = {
		"gamepad",
		"x",
		"released",
	},
	kick_player = {
		"gamepad",
		"right_thumb",
		"pressed",
	},
	toggle_private = {
		"gamepad",
		"left_thumb",
		"pressed",
	},
	back = {
		"gamepad",
		"b",
		"released",
	},
	show_profile = {
		"gamepad",
		"a",
		"pressed",
	},
	move_up = {
		"gamepad",
		"d_up",
		"pressed",
	},
	move_down = {
		"gamepad",
		"d_down",
		"pressed",
	},
	ingame_player_list_exit = {},
	activate_ingame_player_list = {},
	axis_cursor = {
		"gamepad",
		"left",
		"axis",
	},
	left_press = {
		"gamepad",
		"a",
		"pressed",
	},
	left_hold = {
		"gamepad",
		"a",
		"held",
	},
	left_release = {
		"gamepad",
		"a",
		"released",
	},
	right_press = {
		"gamepad",
		"right_shoulder",
		"pressed",
	},
	right_hold = {
		"gamepad",
		"right_shoulder",
		"held",
	},
	right_release = {
		"gamepad",
		"right_shoulder",
		"released",
	},
	versus_status_list_toggle = {
		"gamepad",
		"start",
		"pressed",
	},
	versus_status_list_exit = {},
	activate_versus_status_list = {},
	force_start = {
		"gamepad",
		"y",
		"pressed",
	},
	switch_team = {
		"gamepad",
		"x",
		"pressed",
	},
}
IngamePlayerListKeymaps.ps4 = InputUtils.keymaps_key_approved("ps4") and {
	toggle_menu = {
		"gamepad",
		"options",
		"pressed",
	},
	ingame_player_list_toggle = {
		"gamepad",
		"touch",
		"pressed",
	},
	mute_voice = {
		"gamepad",
		"triangle",
		"released",
	},
	mute_chat = {
		"gamepad",
		"square",
		"released",
	},
	kick_player = {
		"gamepad",
		"r3",
		"pressed",
	},
	toggle_private = {
		"gamepad",
		"l3",
		"pressed",
	},
	back = {
		"gamepad",
		"circle",
		"released",
	},
	show_profile = {
		"gamepad",
		"cross",
		"pressed",
	},
	move_up = {
		"gamepad",
		"up",
		"pressed",
	},
	move_down = {
		"gamepad",
		"down",
		"pressed",
	},
	ingame_player_list_exit = {},
	activate_ingame_player_list = {},
	axis_cursor = {
		"gamepad",
		"left",
		"axis",
	},
	left_press = {
		"gamepad",
		"cross",
		"pressed",
	},
	left_hold = {
		"gamepad",
		"cross",
		"held",
	},
	left_release = {
		"gamepad",
		"cross",
		"released",
	},
	right_press = {
		"gamepad",
		"r1",
		"pressed",
	},
	right_hold = {
		"gamepad",
		"r1",
		"held",
	},
	right_release = {
		"gamepad",
		"r1",
		"released",
	},
	versus_status_list_toggle = {
		"gamepad",
		"options",
		"pressed",
	},
	versus_status_list_exit = {},
	activate_versus_status_list = {},
	force_start = {
		"gamepad",
		"triangle",
		"pressed",
	},
	switch_team = {
		"gamepad",
		"square",
		"pressed",
	},
}
IngamePlayerListKeymaps.ps_pad = InputUtils.keymaps_key_approved("ps_pad") and {
	toggle_menu = {
		"ps_pad",
		"options",
		"pressed",
	},
	ingame_player_list_toggle = {
		"ps_pad",
		"touch",
		"pressed",
	},
	mute_voice = {
		"ps_pad",
		"triangle",
		"released",
	},
	mute_chat = {
		"ps_pad",
		"square",
		"released",
	},
	kick_player = {
		"ps_pad",
		"r3",
		"pressed",
	},
	toggle_private = {
		"ps_pad",
		"l3",
		"pressed",
	},
	back = {
		"ps_pad",
		"circle",
		"released",
	},
	show_profile = {
		"ps_pad",
		"cross",
		"pressed",
	},
	move_up = {
		"ps_pad",
		"up",
		"pressed",
	},
	move_down = {
		"ps_pad",
		"down",
		"pressed",
	},
	ingame_player_list_exit = {},
	activate_ingame_player_list = {},
	axis_cursor = {
		"ps_pad",
		"left",
		"axis",
	},
	left_press = {
		"ps_pad",
		"cross",
		"pressed",
	},
	left_hold = {
		"ps_pad",
		"cross",
		"held",
	},
	left_release = {
		"ps_pad",
		"cross",
		"released",
	},
	right_press = {
		"ps_pad",
		"r1",
		"pressed",
	},
	right_hold = {
		"ps_pad",
		"r1",
		"held",
	},
	right_release = {
		"ps_pad",
		"r1",
		"released",
	},
	versus_status_list_toggle = {
		"ps_pad",
		"options",
		"pressed",
	},
	versus_status_list_exit = {},
	activate_versus_status_list = {},
	force_start = {
		"ps_pad",
		"triangle",
		"pressed",
	},
	switch_team = {
		"ps_pad",
		"square",
		"pressed",
	},
}
IngamePlayerListFilters = {}
IngamePlayerListFilters.win32 = InputUtils.keymaps_key_approved("win32") and {
	ingame_player_list_exit = {
		filter_type = "or",
		input_mappings = {
			button_1 = "ingame_player_list_exit_1",
			button_2 = "ingame_player_list_exit_2",
		},
	},
	activate_ingame_player_list = {
		filter_type = "or",
		input_mappings = {
			button_1 = "activate_ingame_player_list_1",
			button_2 = "activate_ingame_player_list_2",
		},
	},
	versus_status_list_pressed = {
		filter_type = "or",
		input_mappings = {
			button_1 = "versus_status_list_pressed_1",
			button_2 = "versus_status_list_pressed_2",
		},
	},
	versus_status_list_held = {
		filter_type = "or",
		input_mappings = {
			button_1 = "versus_status_list_held_1",
			button_2 = "versus_status_list_held_2",
		},
	},
	close_versus_status_list = {
		filter_type = "or",
		input_mappings = {
			button_1 = "close_versus_status_list_1",
			button_2 = "close_versus_status_list_2",
		},
	},
	versus_status_list_exit = {
		filter_type = "or",
		input_mappings = {
			button_1 = "versus_status_list_exit_1",
			button_2 = "versus_status_list_exit_2",
			button_3 = "versus_status_list_exit_2",
		},
	},
	activate_versus_status_list = {
		filter_type = "or",
		input_mappings = {
			button_1 = "activate_versus_status_list_1",
			button_2 = "activate_versus_status_list_2",
		},
	},
}
IngamePlayerListFilters.xb1 = InputUtils.keymaps_key_approved("xb1") and {
	cursor = {
		accelerate_time_ref = 1.2,
		acceleration_delay = 0.2,
		acceleration_threshold = 0.5,
		filter_type = "gamepad_cursor",
		hover_multiplier = 0.3,
		input_mapping = "axis_cursor",
		min_multiplier_x = 25,
		min_multiplier_y = 25,
		multiplier = 1000,
		multiplier_x = 40,
		multiplier_y = 40,
		threshold = 0.1,
	},
}

local IngamePlayerListFilters_ps4 = {
	cursor = {
		accelerate_time_ref = 1.2,
		acceleration_delay = 0.2,
		acceleration_threshold = 0.5,
		filter_type = "gamepad_cursor",
		hover_multiplier = 0.3,
		input_mapping = "axis_cursor",
		min_multiplier_x = 25,
		min_multiplier_y = 25,
		multiplier = 1000,
		multiplier_x = 40,
		multiplier_y = 40,
		threshold = 0.1,
	},
}

IngamePlayerListFilters.ps4 = InputUtils.keymaps_key_approved("ps4") and IngamePlayerListFilters_ps4
IngamePlayerListFilters.ps_pad = InputUtils.keymaps_key_approved("ps_pad") and IngamePlayerListFilters_ps4
IngameMenuKeymaps = {}
IngameMenuKeymaps.win32 = InputUtils.keymaps_key_approved("win32") and {
	ingame_vote_yes = {
		"keyboard",
		"f5",
		"pressed",
	},
	ingame_vote_no = {
		"keyboard",
		"f6",
		"pressed",
	},
	ui_reload_debug = {
		"keyboard",
		"f5",
		"pressed",
	},
	ui_debug = {
		"keyboard",
		"f6",
		"pressed",
	},
	cancel_matchmaking = {
		"keyboard",
		IS_XB1 and "b" or "f10",
		"pressed",
	},
	xbox_cancel_matchmaking = {
		"keyboard",
		"esc",
		"pressed",
	},
	matchmaking_ready_instigate = {
		"keyboard",
		"f2",
		"pressed",
	},
	matchmaking_ready = {
		"keyboard",
		"f2",
		"pressed",
	},
	matchmaking_start = {
		"keyboard",
		"f3",
		"pressed",
	},
	toggle_menu = {
		"keyboard",
		"esc",
		"pressed",
	},
	back_menu = {
		"mouse",
		"right",
		"pressed",
	},
	back_menu_alt = {
		"mouse",
		"extra_1",
		"released",
	},
	move_up_raw = {
		"keyboard",
		"up",
		"pressed",
	},
	move_down_raw = {
		"keyboard",
		"down",
		"pressed",
	},
	move_left_raw = {
		"keyboard",
		"left",
		"pressed",
	},
	move_right_raw = {
		"keyboard",
		"right",
		"pressed",
	},
	move_up_hold_raw = {
		"keyboard",
		"up",
		"held",
	},
	move_down_hold_raw = {
		"keyboard",
		"down",
		"held",
	},
	move_left_hold_raw = {
		"keyboard",
		"left",
		"held",
	},
	move_right_hold_raw = {
		"keyboard",
		"right",
		"held",
	},
	move_up_alt_raw = {
		"keyboard",
		"w",
		"pressed",
	},
	move_down_alt_raw = {
		"keyboard",
		"s",
		"pressed",
	},
	move_left_alt_raw = {
		"keyboard",
		"a",
		"pressed",
	},
	move_right_alt_raw = {
		"keyboard",
		"d",
		"pressed",
	},
	move_up_alt_hold_raw = {
		"keyboard",
		"w",
		"held",
	},
	move_down_alt_hold_raw = {
		"keyboard",
		"s",
		"held",
	},
	move_left_alt_hold_raw = {
		"keyboard",
		"a",
		"held",
	},
	move_right_alt_hold_raw = {
		"keyboard",
		"d",
		"held",
	},
	versus_menu_toggle = {
		"keyboard",
		"left alt",
		"pressed",
	},
	analog_input = {},
	skip = {
		"keyboard",
		"space",
		"held",
	},
	skip_pressed = {
		"keyboard",
		"space",
		"pressed",
	},
	cursor = {
		"mouse",
		"cursor",
		"axis",
	},
	left_release = {
		"mouse",
		"left",
		"released",
	},
	left_hold = {
		"mouse",
		"left",
		"held",
	},
	left_press = {
		"mouse",
		"left",
		"pressed",
	},
	right_press = {
		"mouse",
		"right",
		"pressed",
	},
	mouse_middle_press = {
		"mouse",
		"middle",
		"pressed",
	},
	confirm = {
		"keyboard",
		"space",
		"released",
	},
	confirm_hold = {
		"keyboard",
		"space",
		"held",
	},
	confirm_press = {
		"keyboard",
		"space",
		"pressed",
	},
	back = {},
	refresh = {},
	refresh_hold = {},
	refresh_press = {},
	special_1 = {},
	special_1_hold = {},
	special_1_press = {},
	left_stick_press = {},
	right_stick_press = {},
	cycle_next_raw = {
		"keyboard",
		"tab",
		"pressed",
	},
	cycle_next_raw_hold = {
		"keyboard",
		"tab",
		"held",
	},
	cycle_next_alt_raw = {
		"keyboard",
		"e",
		"pressed",
	},
	cycle_next_alt_raw_hold = {
		"keyboard",
		"e",
		"held",
	},
	cycle_prev_raw = {
		"keyboard",
		"q",
		"pressed",
	},
	cycle_prev_raw_held = {
		"keyboard",
		"q",
		"held",
	},
	trigger_left_soft = {},
	trigger_right_soft = {},
	trigger_cycle_next = {},
	trigger_cycle_next_hold = {},
	trigger_cycle_previous = {},
	trigger_cycle_previous_hold = {},
	gamepad_left_axis = {},
	gamepad_right_axis = {},
	look_raw_controller = {},
	show_information = {
		"mouse",
		"left",
		"pressed",
	},
	hotkey_map = {
		"keyboard",
		"m",
		"pressed",
	},
	hotkey_weave_leaderboard = {
		"keyboard",
		"l",
		"pressed",
	},
	hotkey_weave_forge = {
		"keyboard",
		"k",
		"pressed",
	},
	hotkey_weave_play = {
		"keyboard",
		"j",
		"pressed",
	},
	hotkey_talents = {
		"keyboard",
		"t",
		"pressed",
	},
	hotkey_hero = {
		"keyboard",
		"h",
		"pressed",
	},
	hotkey_inventory = {
		"keyboard",
		"i",
		"pressed",
	},
	hotkey_altar = {
		"keyboard",
		"h",
		"pressed",
	},
	hotkey_quests = {
		"keyboard",
		"u",
		"pressed",
	},
	hotkey_achievements = {
		"keyboard",
		"o",
		"pressed",
	},
	hotkey_mark_favorite_item = {
		"keyboard",
		"f",
		"pressed",
	},
	hotkey_loot = {
		"keyboard",
		"c",
		"pressed",
	},
	item_compare_1 = {
		"keyboard",
		"left shift",
		"held",
	},
	item_compare_2 = {
		"keyboard",
		"right shift",
		"held",
	},
	item_detail_1 = {
		"keyboard",
		"left ctrl",
		"held",
	},
	item_detail_2 = {
		"keyboard",
		"right ctrl",
		"held",
	},
	keyboard_1 = {
		"keyboard",
		"1",
		"pressed",
	},
	keyboard_2 = {
		"keyboard",
		"2",
		"pressed",
	},
	keyboard_3 = {
		"keyboard",
		"3",
		"pressed",
	},
	keyboard_4 = {
		"keyboard",
		"4",
		"pressed",
	},
	keyboard_5 = {
		"keyboard",
		"5",
		"pressed",
	},
	keyboard_6 = {
		"keyboard",
		"6",
		"pressed",
	},
	keyboard_7 = {
		"keyboard",
		"7",
		"pressed",
	},
	keyboard_8 = {
		"keyboard",
		"8",
		"pressed",
	},
	keyboard_9 = {
		"keyboard",
		"9",
		"pressed",
	},
	keyboard_0 = {
		"keyboard",
		"0",
		"pressed",
	},
	scroll_axis = {
		"mouse",
		"wheel",
		"axis",
	},
	debug_pixeldistance_1 = {
		"keyboard",
		"left shift",
		"held",
	},
	debug_pixeldistance_2 = {
		"mouse",
		"right",
		"held",
	},
	execute_login_1 = {
		"keyboard",
		"enter",
		"pressed",
	},
	execute_login_2 = {
		"keyboard",
		"numpad enter",
		"pressed",
	},
	cancel_video_1 = {
		"keyboard",
		"space",
		"held",
	},
	cancel_video_2 = {
		"keyboard",
		"esc",
		"held",
	},
	cancel_video_3 = {
		"mouse",
		"left",
		"held",
	},
}
IngameMenuKeymaps.xb1 = InputUtils.keymaps_key_approved("xb1") and {
	ingame_vote_yes = {
		"gamepad",
		"back",
		"held",
	},
	ingame_vote_no = {
		"gamepad",
		"start",
		"held",
	},
	ui_reload_debug = {
		"gamepad",
		"y",
		"held",
	},
	ui_debug = {
		"gamepad",
		"y",
		"held",
	},
	cancel_matchmaking = {
		"gamepad",
		"back",
		"pressed",
	},
	matchmaking_ready_instigate = {
		"gamepad",
		"left_shoulder",
		"pressed",
	},
	matchmaking_ready = {
		"gamepad",
		"left_shoulder",
		"held",
	},
	matchmaking_start = {
		"gamepad",
		"left_shoulder",
		"held",
	},
	toggle_menu = {
		"gamepad",
		"start",
		"pressed",
	},
	back_menu = {
		"gamepad",
		"b",
		"pressed",
	},
	move_up_raw = {
		"gamepad",
		"d_up",
		"pressed",
	},
	move_down_raw = {
		"gamepad",
		"d_down",
		"pressed",
	},
	move_left_raw = {
		"gamepad",
		"d_left",
		"pressed",
	},
	move_right_raw = {
		"gamepad",
		"d_right",
		"pressed",
	},
	move_up_hold_raw = {
		"gamepad",
		"d_up",
		"held",
	},
	move_down_hold_raw = {
		"gamepad",
		"d_down",
		"held",
	},
	move_left_hold_raw = {
		"gamepad",
		"d_left",
		"held",
	},
	move_right_hold_raw = {
		"gamepad",
		"d_right",
		"held",
	},
	analog_input = {
		"gamepad",
		"left",
		"axis",
	},
	versus_menu_toggle = {
		"gamepad",
		"start",
		"pressed",
	},
	confirm = {
		"gamepad",
		"a",
		"released",
	},
	confirm_hold = {
		"gamepad",
		"a",
		"held",
	},
	confirm_press = {
		"gamepad",
		"a",
		"pressed",
	},
	back = {
		"gamepad",
		"b",
		"released",
	},
	refresh = {
		"gamepad",
		"y",
		"released",
	},
	refresh_hold = {
		"gamepad",
		"y",
		"held",
	},
	refresh_press = {
		"gamepad",
		"y",
		"pressed",
	},
	special_1 = {
		"gamepad",
		"x",
		"released",
	},
	special_1_hold = {
		"gamepad",
		"x",
		"held",
	},
	special_1_press = {
		"gamepad",
		"x",
		"pressed",
	},
	left_stick_press = {
		"gamepad",
		"left_thumb",
		"pressed",
	},
	right_stick_press = {
		"gamepad",
		"right_thumb",
		"pressed",
	},
	cycle_next = {
		"gamepad",
		"right_shoulder",
		"pressed",
	},
	cycle_next_alt_raw = {
		"gamepad",
		"right_shoulder",
		"pressed",
	},
	cycle_next_hold = {
		"gamepad",
		"right_shoulder",
		"held",
	},
	cycle_previous = {
		"gamepad",
		"left_shoulder",
		"pressed",
	},
	cycle_prev_raw = {
		"gamepad",
		"left_shoulder",
		"pressed",
	},
	cycle_previous_hold = {
		"gamepad",
		"left_shoulder",
		"held",
	},
	trigger_left_soft = {
		"gamepad",
		"left_trigger",
		"soft_button",
	},
	trigger_right_soft = {
		"gamepad",
		"right_trigger",
		"soft_button",
	},
	trigger_cycle_next = {
		"gamepad",
		"right_trigger",
		"pressed",
	},
	trigger_cycle_next_hold = {
		"gamepad",
		"right_trigger",
		"held",
	},
	trigger_cycle_previous = {
		"gamepad",
		"left_trigger",
		"pressed",
	},
	trigger_cycle_previous_hold = {
		"gamepad",
		"left_trigger",
		"held",
	},
	gamepad_left_axis = {
		"gamepad",
		"left",
		"axis",
	},
	gamepad_right_axis = {
		"gamepad",
		"right",
		"axis",
	},
	look_raw_controller = {
		"gamepad",
		"left",
		"axis",
	},
	show_gamercard = {
		"gamepad",
		"back",
		"pressed",
	},
	hotkey_mark_favorite_item = {
		"gamepad",
		"right_thumb",
		"pressed",
	},
	show_information = {
		"gamepad",
		"right_trigger",
		"pressed",
	},
	axis_cursor = {
		"gamepad",
		"left",
		"axis",
	},
	left_press = {
		"gamepad",
		"a",
		"pressed",
	},
	left_hold = {
		"gamepad",
		"a",
		"held",
	},
	left_release = {
		"gamepad",
		"a",
		"released",
	},
	right_press = {},
	right_hold = {},
	right_release = {},
	scroll_axis = {
		"gamepad",
		"right",
		"axis",
	},
	debug_pixeldistance_1 = {
		"gamepad",
		"left_trigger",
		"held",
	},
	debug_pixeldistance_2 = {
		"gamepad",
		"right_trigger",
		"held",
	},
	cancel_video_1 = {
		"gamepad",
		"a",
		"held",
	},
	cancel_video_2 = {
		"gamepad",
		"b",
		"held",
	},
}
IngameMenuKeymaps.ps4 = InputUtils.keymaps_key_approved("ps4") and {
	ingame_vote_yes = {
		"gamepad",
		"l1",
		"held",
	},
	ingame_vote_no = {
		"gamepad",
		"l2",
		"held",
	},
	ui_reload_debug = {
		"gamepad",
		"triangle",
		"held",
	},
	ui_debug = {
		"gamepad",
		"triangle",
		"held",
	},
	cancel_matchmaking = {
		"gamepad",
		"touch",
		"pressed",
	},
	matchmaking_ready_instigate = {
		"gamepad",
		"l1",
		"pressed",
	},
	matchmaking_ready = {
		"gamepad",
		"l1",
		"held",
	},
	matchmaking_start = {
		"gamepad",
		"l1",
		"held",
	},
	toggle_menu = {
		"gamepad",
		"options",
		"pressed",
	},
	back_menu = {
		"gamepad",
		"circle",
		"pressed",
	},
	move_up_raw = {
		"gamepad",
		"up",
		"pressed",
	},
	move_down_raw = {
		"gamepad",
		"down",
		"pressed",
	},
	move_left_raw = {
		"gamepad",
		"left",
		"pressed",
	},
	move_right_raw = {
		"gamepad",
		"right",
		"pressed",
	},
	move_up_hold_raw = {
		"gamepad",
		"up",
		"held",
	},
	move_down_hold_raw = {
		"gamepad",
		"down",
		"held",
	},
	move_left_hold_raw = {
		"gamepad",
		"left",
		"held",
	},
	move_right_hold_raw = {
		"gamepad",
		"right",
		"held",
	},
	analog_input = {
		"gamepad",
		"left",
		"axis",
	},
	versus_menu_toggle = {
		"gamepad",
		"options",
		"pressed",
	},
	confirm = {
		"gamepad",
		"cross",
		"released",
	},
	confirm_hold = {
		"gamepad",
		"cross",
		"held",
	},
	confirm_press = {
		"gamepad",
		"cross",
		"pressed",
	},
	back = {
		"gamepad",
		"circle",
		"released",
	},
	refresh = {
		"gamepad",
		"triangle",
		"released",
	},
	refresh_hold = {
		"gamepad",
		"triangle",
		"held",
	},
	refresh_press = {
		"gamepad",
		"triangle",
		"pressed",
	},
	special_1 = {
		"gamepad",
		"square",
		"released",
	},
	special_1_hold = {
		"gamepad",
		"square",
		"held",
	},
	special_1_press = {
		"gamepad",
		"square",
		"pressed",
	},
	left_stick_press = {
		"gamepad",
		"l3",
		"pressed",
	},
	right_stick_press = {
		"gamepad",
		"r3",
		"pressed",
	},
	cycle_next = {
		"gamepad",
		"r1",
		"pressed",
	},
	cycle_next_alt_raw = {
		"gamepad",
		"r1",
		"pressed",
	},
	cycle_next_hold = {
		"gamepad",
		"r1",
		"held",
	},
	cycle_previous = {
		"gamepad",
		"l1",
		"pressed",
	},
	cycle_prev_raw = {
		"gamepad",
		"l1",
		"pressed",
	},
	cycle_previous_hold = {
		"gamepad",
		"l1",
		"held",
	},
	trigger_left_soft = {
		"gamepad",
		"l2",
		"soft_button",
	},
	trigger_right_soft = {
		"gamepad",
		"r2",
		"soft_button",
	},
	trigger_cycle_next = {
		"gamepad",
		"r2",
		"pressed",
	},
	trigger_cycle_next_hold = {
		"gamepad",
		"r2",
		"held",
	},
	trigger_cycle_previous = {
		"gamepad",
		"l2",
		"pressed",
	},
	trigger_cycle_previous_hold = {
		"gamepad",
		"l2",
		"held",
	},
	axis_cursor = {
		"gamepad",
		"left",
		"axis",
	},
	left_press = {
		"gamepad",
		"cross",
		"pressed",
	},
	left_hold = {
		"gamepad",
		"cross",
		"held",
	},
	left_release = {
		"gamepad",
		"cross",
		"released",
	},
	right_press = {},
	right_hold = {},
	right_release = {},
	gamepad_left_axis = {
		"gamepad",
		"left",
		"axis",
	},
	gamepad_right_axis = {
		"gamepad",
		"right",
		"axis",
	},
	look_raw_controller = {
		"gamepad",
		"left",
		"axis",
	},
	show_gamercard = {
		"gamepad",
		"touch",
		"pressed",
	},
	hotkey_mark_favorite_item = {
		"gamepad",
		"r3",
		"pressed",
	},
	show_information = {
		"gamepad",
		"r2",
		"pressed",
	},
	scroll_axis = {
		"gamepad",
		"right",
		"axis",
	},
	debug_pixeldistance_1 = {
		"gamepad",
		"l2",
		"held",
	},
	debug_pixeldistance_2 = {
		"gamepad",
		"r2",
		"held",
	},
	cancel_video_1 = {
		"gamepad",
		"cross",
		"held",
	},
	cancel_video_2 = {
		"gamepad",
		"circle",
		"held",
	},
}
IngameMenuKeymaps.ps_pad = InputUtils.keymaps_key_approved("ps_pad") and {
	ingame_vote_yes = {
		"ps_pad",
		"l1",
		"held",
	},
	ingame_vote_no = {
		"ps_pad",
		"l2",
		"held",
	},
	ui_reload_debug = {
		"ps_pad",
		"triangle",
		"held",
	},
	ui_debug = {
		"ps_pad",
		"triangle",
		"held",
	},
	cancel_matchmaking = {
		"ps_pad",
		"touch",
		"pressed",
	},
	matchmaking_ready_instigate = {
		"ps_pad",
		"l1",
		"pressed",
	},
	matchmaking_ready = {
		"ps_pad",
		"l1",
		"held",
	},
	matchmaking_start = {
		"ps_pad",
		"l1",
		"held",
	},
	toggle_menu = {
		"ps_pad",
		"options",
		"pressed",
	},
	back_menu = {
		"ps_pad",
		"circle",
		"pressed",
	},
	move_up_raw = {
		"ps_pad",
		"up",
		"pressed",
	},
	move_down_raw = {
		"ps_pad",
		"down",
		"pressed",
	},
	move_left_raw = {
		"ps_pad",
		"left",
		"pressed",
	},
	move_right_raw = {
		"ps_pad",
		"right",
		"pressed",
	},
	move_up_hold_raw = {
		"ps_pad",
		"up",
		"held",
	},
	move_down_hold_raw = {
		"ps_pad",
		"down",
		"held",
	},
	move_left_hold_raw = {
		"ps_pad",
		"left",
		"held",
	},
	move_right_hold_raw = {
		"ps_pad",
		"right",
		"held",
	},
	analog_input = {
		"ps_pad",
		"left",
		"axis",
	},
	versus_menu_toggle = {
		"ps_pad",
		"options",
		"pressed",
	},
	confirm = {
		"ps_pad",
		"cross",
		"released",
	},
	confirm_hold = {
		"ps_pad",
		"cross",
		"held",
	},
	confirm_press = {
		"ps_pad",
		"cross",
		"pressed",
	},
	back = {
		"ps_pad",
		"circle",
		"released",
	},
	refresh = {
		"ps_pad",
		"triangle",
		"released",
	},
	refresh_hold = {
		"ps_pad",
		"triangle",
		"held",
	},
	refresh_press = {
		"ps_pad",
		"triangle",
		"pressed",
	},
	special_1 = {
		"ps_pad",
		"square",
		"released",
	},
	special_1_hold = {
		"ps_pad",
		"square",
		"held",
	},
	special_1_press = {
		"ps_pad",
		"square",
		"pressed",
	},
	left_stick_press = {
		"ps_pad",
		"l3",
		"pressed",
	},
	right_stick_press = {
		"ps_pad",
		"r3",
		"pressed",
	},
	cycle_next = {
		"ps_pad",
		"r1",
		"pressed",
	},
	cycle_next_alt_raw = {
		"ps_pad",
		"r1",
		"pressed",
	},
	cycle_next_hold = {
		"ps_pad",
		"r1",
		"held",
	},
	cycle_previous = {
		"ps_pad",
		"l1",
		"pressed",
	},
	cycle_prev_raw = {
		"ps_pad",
		"l1",
		"pressed",
	},
	cycle_previous_hold = {
		"ps_pad",
		"l1",
		"held",
	},
	trigger_left_soft = {
		"ps_pad",
		"l2",
		"soft_button",
	},
	trigger_right_soft = {
		"ps_pad",
		"r2",
		"soft_button",
	},
	trigger_cycle_next = {
		"ps_pad",
		"r2",
		"pressed",
	},
	trigger_cycle_next_hold = {
		"ps_pad",
		"r2",
		"held",
	},
	trigger_cycle_previous = {
		"ps_pad",
		"l2",
		"pressed",
	},
	trigger_cycle_previous_hold = {
		"ps_pad",
		"l2",
		"held",
	},
	axis_cursor = {
		"ps_pad",
		"left",
		"axis",
	},
	left_press = {
		"ps_pad",
		"cross",
		"pressed",
	},
	left_hold = {
		"ps_pad",
		"cross",
		"held",
	},
	left_release = {
		"ps_pad",
		"cross",
		"released",
	},
	right_press = {},
	right_hold = {},
	right_release = {},
	gamepad_left_axis = {
		"ps_pad",
		"left",
		"axis",
	},
	gamepad_right_axis = {
		"ps_pad",
		"right",
		"axis",
	},
	look_raw_controller = {
		"ps_pad",
		"left",
		"axis",
	},
	show_gamercard = {
		"ps_pad",
		"touch",
		"pressed",
	},
	hotkey_mark_favorite_item = {
		"ps_pad",
		"r3",
		"pressed",
	},
	show_information = {
		"ps_pad",
		"r2",
		"pressed",
	},
	scroll_axis = {
		"ps_pad",
		"right",
		"axis",
	},
	debug_pixeldistance_1 = {
		"ps_pad",
		"l2",
		"held",
	},
	debug_pixeldistance_2 = {
		"ps_pad",
		"r2",
		"held",
	},
	cancel_video_1 = {
		"ps_pad",
		"cross",
		"held",
	},
	cancel_video_2 = {
		"ps_pad",
		"circle",
		"held",
	},
}
IngameMenuFilters = {}
IngameMenuFilters.win32 = InputUtils.keymaps_key_approved("win32") and {
	debug_pixeldistance = {
		filter_type = "and",
		input_mappings = {
			button_1 = "debug_pixeldistance_1",
			button_2 = "debug_pixeldistance_2",
		},
	},
	show_support_info = {
		filter_type = "and",
		input_mappings = {
			button_1 = "show_support_info_1",
			button_2 = "show_support_info_2",
		},
	},
	start = {
		filter_type = "or",
		input_mappings = {
			button_1 = "start_1",
			button_2 = "start_2",
		},
	},
	move_down = {
		filter_type = "move_filter",
		threshold = 0.7,
		input_mappings = {
			"move_down_raw",
			"move_down_alt_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			0,
			-1,
			0,
		},
	},
	move_up = {
		filter_type = "move_filter",
		threshold = 0.7,
		input_mappings = {
			"move_up_raw",
			"move_up_alt_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			0,
			1,
			0,
		},
	},
	move_left = {
		filter_type = "move_filter",
		threshold = 0.7,
		input_mappings = {
			"move_left_raw",
			"move_left_alt_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			-1,
			0,
			0,
		},
	},
	move_right = {
		filter_type = "move_filter",
		threshold = 0.7,
		input_mappings = {
			"move_right_raw",
			"move_right_alt_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			1,
			0,
			0,
		},
	},
	move_down_hold = {
		filter_type = "move_filter",
		hold = true,
		threshold = 0.7,
		input_mappings = {
			"move_down_hold_raw",
			"move_down_alt_hold_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			0,
			-1,
			0,
		},
	},
	move_up_hold = {
		filter_type = "move_filter",
		hold = true,
		threshold = 0.7,
		input_mappings = {
			"move_up_hold_raw",
			"move_up_alt_hold_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			0,
			1,
			0,
		},
	},
	move_left_hold = {
		filter_type = "move_filter",
		hold = true,
		threshold = 0.7,
		input_mappings = {
			"move_left_hold_raw",
			"move_left_alt_hold_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			-1,
			0,
			0,
		},
	},
	move_right_hold = {
		filter_type = "move_filter",
		hold = true,
		threshold = 0.7,
		input_mappings = {
			"move_right_hold_raw",
			"move_right_alt_hold_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			1,
			0,
			0,
		},
	},
	move_down_hold_continuous = {
		filter_type = "move_filter_continuous",
		hold = true,
		threshold = 0.7,
		input_mappings = {
			"move_down_hold_raw",
			"move_down_alt_hold_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			0,
			-1,
			0,
		},
	},
	move_up_hold_continuous = {
		filter_type = "move_filter_continuous",
		hold = true,
		threshold = 0.7,
		input_mappings = {
			"move_up_hold_raw",
			"move_up_alt_hold_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			0,
			1,
			0,
		},
	},
	move_left_hold_continuous = {
		filter_type = "move_filter_continuous",
		hold = true,
		threshold = 0.7,
		input_mappings = {
			"move_left_hold_raw",
			"move_left_alt_hold_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			-1,
			0,
			0,
		},
	},
	move_right_hold_continuous = {
		filter_type = "move_filter_continuous",
		hold = true,
		threshold = 0.7,
		input_mappings = {
			"move_right_hold_raw",
			"move_right_alt_hold_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			1,
			0,
			0,
		},
	},
	item_compare = {
		filter_type = "or",
		input_mappings = {
			button_1 = "item_compare_1",
			button_2 = "item_compare_2",
		},
	},
	item_detail = {
		filter_type = "or",
		input_mappings = {
			button_1 = "item_detail_1",
			button_2 = "item_detail_2",
		},
	},
	execute_chat_input = {
		filter_type = "or",
		input_mappings = {
			button_1 = "execute_login_1",
			button_2 = "execute_login_2",
		},
	},
	cycle_next = {
		filter_type = "or",
		input_mappings = {
			button_1 = "cycle_next_raw",
			button_2 = "cycle_next_alt_raw",
		},
	},
	cycle_next_hold = {
		filter_type = "or",
		input_mappings = {
			button_1 = "cycle_next_raw_hold",
			button_2 = "cycle_next_alt_raw_hold",
		},
	},
	cycle_previous = {
		filter_type = "multiple_and",
		input_mappings = {
			{
				button_1 = "item_detail_1",
				button_2 = "cycle_next_raw",
			},
			{
				button_1 = "cycle_prev_raw",
			},
		},
	},
	cycle_previous_hold = {
		filter_type = "multiple_and",
		input_mappings = {
			{
				button_1 = "item_detail_1",
				button_2 = "cycle_next_raw_hold",
			},
			{
				button_1 = "cycle_prev_raw_held",
			},
		},
	},
	cancel_video = {
		filter_type = "or",
		input_mappings = {
			button_1 = "cancel_video_1",
			button_2 = "cancel_video_2",
			button_3 = "cancel_video_3",
		},
	},
}
IngameMenuFilters.xb1 = InputUtils.keymaps_key_approved("xb1") and {
	debug_pixeldistance = {
		filter_type = "and",
		input_mappings = {
			button_1 = "debug_pixeldistance_1",
			button_2 = "debug_pixeldistance_2",
		},
	},
	show_support_info = {
		filter_type = "and",
		input_mappings = {
			button_1 = "show_support_info_1",
			button_2 = "show_support_info_2",
		},
	},
	move_down = {
		filter_type = "move_filter",
		threshold = 0.7,
		input_mappings = {
			"move_down_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			0,
			-1,
			0,
		},
	},
	move_up = {
		filter_type = "move_filter",
		threshold = 0.7,
		input_mappings = {
			"move_up_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			0,
			1,
			0,
		},
	},
	move_left = {
		filter_type = "move_filter",
		threshold = 0.7,
		input_mappings = {
			"move_left_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			-1,
			0,
			0,
		},
	},
	move_right = {
		filter_type = "move_filter",
		threshold = 0.7,
		input_mappings = {
			"move_right_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			1,
			0,
			0,
		},
	},
	move_down_hold = {
		filter_type = "move_filter",
		hold = true,
		threshold = 0.7,
		input_mappings = {
			"move_down_hold_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			0,
			-1,
			0,
		},
	},
	move_up_hold = {
		filter_type = "move_filter",
		hold = true,
		threshold = 0.7,
		input_mappings = {
			"move_up_hold_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			0,
			1,
			0,
		},
	},
	move_left_hold = {
		filter_type = "move_filter",
		hold = true,
		threshold = 0.7,
		input_mappings = {
			"move_left_hold_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			-1,
			0,
			0,
		},
	},
	move_right_hold = {
		filter_type = "move_filter",
		hold = true,
		threshold = 0.7,
		input_mappings = {
			"move_right_hold_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			1,
			0,
			0,
		},
	},
	move_down_hold_continuous = {
		filter_type = "move_filter_continuous",
		hold = true,
		threshold = 0.7,
		input_mappings = {
			"move_down_hold_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			0,
			-1,
			0,
		},
	},
	move_up_hold_continuous = {
		filter_type = "move_filter_continuous",
		hold = true,
		threshold = 0.7,
		input_mappings = {
			"move_up_hold_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			0,
			1,
			0,
		},
	},
	move_left_hold_continuous = {
		filter_type = "move_filter_continuous",
		hold = true,
		threshold = 0.7,
		input_mappings = {
			"move_left_hold_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			-1,
			0,
			0,
		},
	},
	move_right_hold_continuous = {
		filter_type = "move_filter_continuous",
		hold = true,
		threshold = 0.7,
		input_mappings = {
			"move_right_hold_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			1,
			0,
			0,
		},
	},
	cursor = {
		accelerate_time_ref = 1.2,
		acceleration_delay = 0.2,
		acceleration_threshold = 0.5,
		filter_type = "gamepad_cursor",
		hover_multiplier = 0.3,
		input_mapping = "axis_cursor",
		min_multiplier_x = 25,
		min_multiplier_y = 25,
		multiplier = 1000,
		multiplier_x = 40,
		multiplier_y = 40,
		threshold = 0.1,
	},
	cancel_video = {
		filter_type = "or",
		input_mappings = {
			button_1 = "cancel_video_1",
			button_2 = "cancel_video_2",
		},
	},
}

local IngameMenuFilters_ps4 = {
	debug_pixeldistance = {
		filter_type = "and",
		input_mappings = {
			button_1 = "debug_pixeldistance_1",
			button_2 = "debug_pixeldistance_2",
		},
	},
	show_support_info = {
		filter_type = "and",
		input_mappings = {
			button_1 = "show_support_info_1",
			button_2 = "show_support_info_2",
		},
	},
	move_down = {
		filter_type = "move_filter",
		threshold = 0.7,
		input_mappings = {
			"move_down_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			0,
			-1,
			0,
		},
	},
	move_up = {
		filter_type = "move_filter",
		threshold = 0.7,
		input_mappings = {
			"move_up_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			0,
			1,
			0,
		},
	},
	move_left = {
		filter_type = "move_filter",
		threshold = 0.7,
		input_mappings = {
			"move_left_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			-1,
			0,
			0,
		},
	},
	move_right = {
		filter_type = "move_filter",
		threshold = 0.7,
		input_mappings = {
			"move_right_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			1,
			0,
			0,
		},
	},
	move_down_hold = {
		filter_type = "move_filter",
		hold = true,
		threshold = 0.7,
		input_mappings = {
			"move_down_hold_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			0,
			-1,
			0,
		},
	},
	move_up_hold = {
		filter_type = "move_filter",
		hold = true,
		threshold = 0.7,
		input_mappings = {
			"move_up_hold_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			0,
			1,
			0,
		},
	},
	move_left_hold = {
		filter_type = "move_filter",
		hold = true,
		threshold = 0.7,
		input_mappings = {
			"move_left_hold_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			-1,
			0,
			0,
		},
	},
	move_right_hold = {
		filter_type = "move_filter",
		hold = true,
		threshold = 0.7,
		input_mappings = {
			"move_right_hold_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			1,
			0,
			0,
		},
	},
	move_down_hold_continuous = {
		filter_type = "move_filter_continuous",
		hold = true,
		threshold = 0.7,
		input_mappings = {
			"move_down_hold_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			0,
			-1,
			0,
		},
	},
	move_up_hold_continuous = {
		filter_type = "move_filter_continuous",
		hold = true,
		threshold = 0.7,
		input_mappings = {
			"move_up_hold_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			0,
			1,
			0,
		},
	},
	move_left_hold_continuous = {
		filter_type = "move_filter_continuous",
		hold = true,
		threshold = 0.7,
		input_mappings = {
			"move_left_hold_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			-1,
			0,
			0,
		},
	},
	move_right_hold_continuous = {
		filter_type = "move_filter_continuous",
		hold = true,
		threshold = 0.7,
		input_mappings = {
			"move_right_hold_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			1,
			0,
			0,
		},
	},
	cursor = {
		accelerate_time_ref = 1.2,
		acceleration_delay = 0.2,
		acceleration_threshold = 0.5,
		filter_type = "gamepad_cursor",
		hover_multiplier = 0.3,
		input_mapping = "axis_cursor",
		min_multiplier_x = 25,
		min_multiplier_y = 25,
		multiplier = 1000,
		multiplier_x = 40,
		multiplier_y = 40,
		threshold = 0.1,
	},
	cancel_video = {
		filter_type = "or",
		input_mappings = {
			button_1 = "cancel_video_1",
			button_2 = "cancel_video_2",
		},
	},
}

IngameMenuFilters.ps4 = InputUtils.keymaps_key_approved("ps4") and IngameMenuFilters_ps4
IngameMenuFilters.ps_pad = InputUtils.keymaps_key_approved("ps_pad") and IngameMenuFilters_ps4
CutsceneKeymaps = {}
CutsceneKeymaps.win32 = InputUtils.keymaps_key_approved("win32") and {
	skip_cutscene_1 = {
		"keyboard",
		"enter",
		"pressed",
	},
	skip_cutscene_2 = {
		"keyboard",
		"space",
		"pressed",
	},
	skip_cutscene_3 = {
		"keyboard",
		"esc",
		"pressed",
	},
	gdc_skip = {
		"keyboard",
		"space",
		"pressed",
	},
	gdc_debug_skip_1 = {
		"keyboard",
		"left shift",
		"held",
	},
	gdc_debug_skip_2 = {
		"keyboard",
		"space",
		"pressed",
	},
}
CutsceneKeymaps.xb1 = InputUtils.keymaps_key_approved("xb1") and {
	skip_cutscene = {
		"gamepad",
		"a",
		"pressed",
	},
	gdc_skip = {
		"gamepad",
		"a",
		"pressed",
	},
	gdc_debug_skip = {},
}
CutsceneKeymaps.ps4 = InputUtils.keymaps_key_approved("ps4") and {
	skip_cutscene = {
		"gamepad",
		"cross",
		"pressed",
	},
	gdc_skip = {
		"gamepad",
		"cross",
		"pressed",
	},
	gdc_debug_skip = {},
}
CutsceneKeymaps.ps_pad = InputUtils.keymaps_key_approved("ps_pad") and {
	skip_cutscene = {
		"ps_pad",
		"cross",
		"pressed",
	},
	gdc_skip = {
		"ps_pad",
		"cross",
		"pressed",
	},
	gdc_debug_skip = {},
}
CutsceneFilters = {}
CutsceneFilters.win32 = InputUtils.keymaps_key_approved("win32") and {
	skip_cutscene = {
		filter_type = "or",
		input_mappings = {
			button_1 = "skip_cutscene_1",
			button_2 = "skip_cutscene_2",
			button_3 = "skip_cutscene_3",
		},
	},
	gdc_debug_skip = {
		filter_type = "and",
		input_mappings = {
			button_1 = "gdc_debug_skip_1",
			button_2 = "gdc_debug_skip_2",
		},
	},
}
CutsceneFilters.xb1 = InputUtils.keymaps_key_approved("xb1") and {}
CutsceneFilters.ps4 = InputUtils.keymaps_key_approved("ps4") and {}
CutsceneFilters.ps_pad = InputUtils.keymaps_key_approved("ps_pad") and {}
ControllerDisconnectKeymaps = {}
ControllerDisconnectKeymaps.xb1 = InputUtils.keymaps_key_approved("xb1") and {
	accept_held_1 = {
		"gamepad",
		"a",
		"held",
	},
	accept_held_2 = {
		"gamepad",
		"start",
		"held",
	},
	cancel_held_1 = {
		"gamepad",
		"b",
		"held",
	},
	cancel_held_2 = {
		"gamepad",
		"back",
		"held",
	},
	accept_1 = {
		"gamepad",
		"a",
		"released",
	},
	accept_2 = {
		"gamepad",
		"start",
		"released",
	},
	cancel_1 = {
		"gamepad",
		"b",
		"released",
	},
	cancel_2 = {
		"gamepad",
		"back",
		"released",
	},
}
ControllerDisconnectFilters = {}
ControllerDisconnectFilters.xb1 = InputUtils.keymaps_key_approved("xb1") and {
	accept_held = {
		filter_type = "or",
		input_mappings = {
			button_1 = "accept_held_1",
			button_2 = "accept_held_2",
		},
	},
	cancel_held = {
		filter_type = "or",
		input_mappings = {
			button_1 = "cancel_held_1",
			button_2 = "cancel_held_2",
		},
	},
	accept = {
		filter_type = "or",
		input_mappings = {
			button_1 = "accept_1",
			button_2 = "accept_2",
		},
	},
	cancel = {
		filter_type = "or",
		input_mappings = {
			button_1 = "cancel_1",
			button_2 = "cancel_2",
		},
	},
}
BenchmarkControllerSettings = {}
BenchmarkControllerSettings.win32 = InputUtils.keymaps_key_approved("win32") and {
	cycle_through_views = {
		"keyboard",
		"tab",
		"pressed",
	},
}
EndLevelViewKeymapsFilters = table.clone(IngameMenuFilters)

if EndLevelViewKeymapsFilters.xb1 then
	EndLevelViewKeymapsFilters.xb1.cursor = nil
end

if EndLevelViewKeymapsFilters.ps4 then
	EndLevelViewKeymapsFilters.ps4.cursor = nil
end

if EndLevelViewKeymapsFilters.ps_pad then
	EndLevelViewKeymapsFilters.ps_pad.cursor = nil
end

DarkPactSelectionUIKeymaps = {}
DarkPactSelectionUIKeymaps.win32 = InputUtils.keymaps_key_approved("win32") and {
	switch_dark_pact_profile = {
		"keyboard",
		"h",
		"pressed",
	},
	cursor = {
		"mouse",
		"cursor",
		"axis",
	},
	left_release = {
		"mouse",
		"left",
		"released",
	},
	left_hold = {
		"mouse",
		"left",
		"held",
	},
	left_press = {
		"mouse",
		"left",
		"pressed",
	},
	right_press = {
		"mouse",
		"right",
		"pressed",
	},
	next_observer_target = {
		"mouse",
		"left",
		"pressed",
	},
	previous_observer_target = {
		"mouse",
		"right",
		"pressed",
	},
	enable_camera_movement = {
		"keyboard",
		"left alt",
		"pressed",
	},
	camera_movement_held = {
		"keyboard",
		"left alt",
		"held",
	},
	confirm = {
		"keyboard",
		"space",
		"pressed",
	},
	move_left_alt_raw = {
		"keyboard",
		"a",
		"pressed",
	},
	move_right_alt_raw = {
		"keyboard",
		"d",
		"pressed",
	},
	move_left_raw = {
		"keyboard",
		"left",
		"pressed",
	},
	move_right_raw = {
		"keyboard",
		"right",
		"pressed",
	},
	analog_input = {},
}
DarkPactSelectionUIFilters = {}
DarkPactSelectionUIFilters.win32 = InputUtils.keymaps_key_approved("win32") and {
	move_left = {
		filter_type = "move_filter",
		threshold = 0.7,
		input_mappings = {
			"move_left_raw",
			"move_left_alt_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			-1,
			0,
			0,
		},
	},
	move_right = {
		filter_type = "move_filter",
		threshold = 0.7,
		input_mappings = {
			"move_right_raw",
			"move_right_alt_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			1,
			0,
			0,
		},
	},
}
DarkPactSelectionUIKeymaps.xb1 = InputUtils.keymaps_key_approved("xb1") and {
	confirm = {
		"gamepad",
		"a",
		"released",
	},
	move_left_raw = {
		"gamepad",
		"d_left",
		"pressed",
	},
	move_right_raw = {
		"gamepad",
		"d_right",
		"pressed",
	},
	move_left_hold = {
		"gamepad",
		"d_left",
		"held",
	},
	move_right_hold = {
		"gamepad",
		"d_right",
		"held",
	},
	analog_input = {
		"gamepad",
		"left",
		"axis",
	},
	next_observer_target = {
		"gamepad",
		"right_shoulder",
		"pressed",
	},
	previous_observer_target = {
		"gamepad",
		"left_shoulder",
		"pressed",
	},
}
DarkPactSelectionUIFilters.xb1 = InputUtils.keymaps_key_approved("xb1") and {
	move_left = {
		filter_type = "move_filter",
		threshold = 0.7,
		input_mappings = {
			"move_left_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			-1,
			0,
			0,
		},
	},
	move_right = {
		filter_type = "move_filter",
		threshold = 0.7,
		input_mappings = {
			"move_right_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			1,
			0,
			0,
		},
	},
}
DarkPactSelectionUIKeymaps.ps4 = InputUtils.keymaps_key_approved("ps4") and {
	confirm = {
		"gamepad",
		"cross",
		"released",
	},
	move_left_raw = {
		"gamepad",
		"left",
		"pressed",
	},
	move_right_raw = {
		"gamepad",
		"right",
		"pressed",
	},
	move_left_hold = {
		"gamepad",
		"left",
		"held",
	},
	move_right_hold = {
		"gamepad",
		"right",
		"held",
	},
	analog_input = {
		"gamepad",
		"left",
		"axis",
	},
	next_observer_target = {
		"gamepad",
		"r1",
		"pressed",
	},
	previous_observer_target = {
		"gamepad",
		"l1",
		"pressed",
	},
}
DarkPactSelectionUIFilters_ps4 = {
	move_left = {
		filter_type = "move_filter",
		threshold = 0.7,
		input_mappings = {
			"move_left_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			-1,
			0,
			0,
		},
	},
	move_right = {
		filter_type = "move_filter",
		threshold = 0.7,
		input_mappings = {
			"move_right_raw",
		},
		axis_mappings = {
			"analog_input",
		},
		axis = {
			1,
			0,
			0,
		},
	},
}
DarkPactSelectionUIKeymaps.ps_pad = InputUtils.keymaps_key_approved("ps_pad") and {
	confirm = {
		"ps_pad",
		"cross",
		"released",
	},
	move_left_raw = {
		"ps_pad",
		"left",
		"pressed",
	},
	move_right_raw = {
		"ps_pad",
		"right",
		"pressed",
	},
	move_left_hold = {
		"ps_pad",
		"left",
		"held",
	},
	move_right_hold = {
		"ps_pad",
		"right",
		"held",
	},
	analog_input = {
		"ps_pad",
		"left",
		"axis",
	},
	next_observer_target = {
		"ps_pad",
		"r1",
		"pressed",
	},
	previous_observer_target = {
		"ps_pad",
		"l1",
		"pressed",
	},
}
DarkPactSelectionUIFilters.ps4 = InputUtils.keymaps_key_approved("ps4") and table.clone(DarkPactSelectionUIFilters_ps4)
DarkPactSelectionUIFilters.ps_pad = InputUtils.keymaps_key_approved("ps_pad") and table.clone(DarkPactSelectionUIFilters_ps4)
GamepadSettings = {
	menu_analog_deadzone = 0.5,
	menu_cooldown = 0.25,
	menu_min_speed_multiplier = 0.5,
	menu_speed_multiplier_decrease = 1.3,
	menu_speed_multiplier_frame_decrease = 0.025,
	quest_menu_navigation_cooldown = 0.15,
}

for name, dlc in pairs(DLCSettings) do
	local controller_settings = dlc.controller_settings

	if controller_settings then
		for input_table_name, input_tables in pairs(controller_settings) do
			local input_table = rawget(_G, input_table_name)

			fassert(input_table, "controller_settings.lua - Could not find input table for: (%s)", input_table_name)

			for table_key, inputs in pairs(input_tables) do
				if InputUtils.keymaps_key_approved(table_key) then
					for action_name, input_settings in pairs(inputs) do
						input_table[table_key][action_name] = input_settings
					end
				end
			end
		end
	end
end

require("scripts/helpers/gamepad_alternate_layout_helper")

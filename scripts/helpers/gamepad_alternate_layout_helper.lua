local platform = PLATFORM
local default_keymaps_data = rawget(_G, GamepadLayoutKeymapsTableName)
local gamepad_platform_key = platform ~= "ps4" and "xb1" or platform
DefaultPlayerControllerKeymaps = PlayerControllerKeymaps[gamepad_platform_key]
DefaultPlayerControllerKeymapsPSPad = PlayerControllerKeymaps.ps_pad
DefaultGamepadLayoutKeymaps = {
	PlayerControllerKeymaps = {
		[gamepad_platform_key] = DefaultPlayerControllerKeymaps,
		ps_pad = IS_WINDOWS and PlayerControllerKeymaps.ps_pad or nil
	}
}

if IS_WINDOWS then
	local keymap_override_1 = table.clone(DefaultPlayerControllerKeymaps)
	keymap_override_1.action_one = {
		"gamepad",
		"right_shoulder",
		"pressed"
	}
	keymap_override_1.action_one_hold = {
		"gamepad",
		"right_shoulder",
		"held"
	}
	keymap_override_1.action_one_release = {
		"gamepad",
		"right_shoulder",
		"released"
	}
	keymap_override_1.action_two = {
		"gamepad",
		"left_shoulder",
		"pressed"
	}
	keymap_override_1.action_two_hold = {
		"gamepad",
		"left_shoulder",
		"held"
	}
	keymap_override_1.action_two_release = {
		"gamepad",
		"left_shoulder",
		"released"
	}
	keymap_override_1.action_one_softbutton_gamepad = {
		"gamepad",
		"right_shoulder",
		"soft_button"
	}
	keymap_override_1.ping = {
		"gamepad",
		"right_trigger",
		"pressed"
	}
	keymap_override_1.ping_hold = {
		"gamepad",
		"right_trigger",
		"held"
	}
	keymap_override_1.ability = {
		"gamepad",
		"left_trigger",
		"pressed"
	}
	keymap_override_1.ability_hold = {
		"gamepad",
		"left_trigger",
		"held"
	}
	keymap_override_1.ability_release = {
		"gamepad",
		"left_trigger",
		"released"
	}
	keymap_override_1.jump_1 = {
		"gamepad",
		"a",
		"pressed"
	}
	keymap_override_1.jump_2 = {}
	keymap_override_1.dodge_1 = {
		"gamepad",
		"a",
		"held"
	}
	keymap_override_1.dodge_2 = {}
	keymap_override_1.action_three = {
		"gamepad",
		"right_thumb",
		"pressed"
	}
	keymap_override_1.action_three_hold = {
		"gamepad",
		"right_thumb",
		"held"
	}
	keymap_override_1.action_three_release = {
		"gamepad",
		"right_thumb",
		"released"
	}
	KeymapOverride1 = {
		PlayerControllerKeymaps = {
			xb1 = keymap_override_1
		}
	}
	local keymap_override_2 = table.clone(DefaultPlayerControllerKeymaps)
	keymap_override_2.weapon_reload_input = {
		"gamepad",
		"a",
		"pressed"
	}
	keymap_override_2.weapon_reload_hold_input = {
		"gamepad",
		"a",
		"held"
	}
	keymap_override_2.jump_1 = {
		"gamepad",
		"right_shoulder",
		"pressed"
	}
	keymap_override_2.dodge_1 = {
		"gamepad",
		"right_shoulder",
		"held"
	}
	keymap_override_2.ping = {
		"gamepad",
		"left_thumb",
		"pressed"
	}
	keymap_override_2.ping_hold = {
		"gamepad",
		"left_thumb",
		"held"
	}
	KeymapOverride2 = {
		PlayerControllerKeymaps = {
			xb1 = keymap_override_2
		}
	}
	local keymap_override_3 = table.clone(DefaultPlayerControllerKeymaps)
	keymap_override_3.action_one = {
		"gamepad",
		"right_shoulder",
		"pressed"
	}
	keymap_override_3.action_one_hold = {
		"gamepad",
		"right_shoulder",
		"held"
	}
	keymap_override_3.action_one_release = {
		"gamepad",
		"right_shoulder",
		"released"
	}
	keymap_override_3.action_two = {
		"gamepad",
		"left_shoulder",
		"pressed"
	}
	keymap_override_3.action_two_hold = {
		"gamepad",
		"left_shoulder",
		"held"
	}
	keymap_override_3.action_two_release = {
		"gamepad",
		"left_shoulder",
		"released"
	}
	keymap_override_3.action_one_softbutton_gamepad = {
		"gamepad",
		"right_shoulder",
		"soft_button"
	}
	keymap_override_3.weapon_reload_input = {
		"gamepad",
		"a",
		"pressed"
	}
	keymap_override_3.weapon_reload_hold_input = {
		"gamepad",
		"a",
		"held"
	}
	keymap_override_3.ability = {
		"gamepad",
		"left_trigger",
		"pressed"
	}
	keymap_override_3.ability_hold = {
		"gamepad",
		"left_trigger",
		"held"
	}
	keymap_override_3.ability_release = {
		"gamepad",
		"left_trigger",
		"released"
	}
	keymap_override_3.jump_1 = {
		"gamepad",
		"right_trigger",
		"pressed"
	}
	keymap_override_3.dodge_1 = {
		"gamepad",
		"right_trigger",
		"held"
	}
	keymap_override_3.ping = {
		"gamepad",
		"left_thumb",
		"pressed"
	}
	keymap_override_3.ping_hold = {
		"gamepad",
		"left_thumb",
		"held"
	}
	KeymapOverride3 = {
		PlayerControllerKeymaps = {
			xb1 = keymap_override_3
		}
	}
	local keymap_override_7 = table.clone(DefaultPlayerControllerKeymaps)
	keymap_override_7.weapon_reload_input = {
		"gamepad",
		"a",
		"pressed"
	}
	keymap_override_7.weapon_reload_hold_input = {
		"gamepad",
		"a",
		"held"
	}
	keymap_override_7.jump_1 = {
		"gamepad",
		"left_shoulder",
		"pressed"
	}
	keymap_override_7.dodge_1 = {
		"gamepad",
		"left_shoulder",
		"held"
	}
	keymap_override_7.ping = {
		"gamepad",
		"left_thumb",
		"pressed"
	}
	keymap_override_7.ping_hold = {
		"gamepad",
		"left_thumb",
		"held"
	}
	keymap_override_7.ability = {
		"gamepad",
		"right_shoulder",
		"pressed"
	}
	keymap_override_7.ability_hold = {
		"gamepad",
		"right_shoulder",
		"held"
	}
	keymap_override_7.ability_release = {
		"gamepad",
		"right_shoulder",
		"released"
	}
	KeymapOverride7 = {
		PlayerControllerKeymaps = {
			xb1 = keymap_override_7
		}
	}
	local keymap_override_9 = table.clone(DefaultPlayerControllerKeymaps)
	keymap_override_9.action_one = {
		"gamepad",
		"right_shoulder",
		"pressed"
	}
	keymap_override_9.action_one_hold = {
		"gamepad",
		"right_shoulder",
		"held"
	}
	keymap_override_9.action_one_release = {
		"gamepad",
		"right_shoulder",
		"released"
	}
	keymap_override_9.action_two = {
		"gamepad",
		"left_trigger",
		"pressed"
	}
	keymap_override_9.action_two_hold = {
		"gamepad",
		"left_trigger",
		"held"
	}
	keymap_override_9.action_two_release = {
		"gamepad",
		"left_trigger",
		"released"
	}
	keymap_override_9.action_one_softbutton_gamepad = {
		"gamepad",
		"right_shoulder",
		"soft_button"
	}
	keymap_override_9.action_inspect = {
		"gamepad",
		"right_thumb",
		"pressed"
	}
	keymap_override_9.action_inspect_hold = {
		"gamepad",
		"right_thumb",
		"held"
	}
	keymap_override_9.action_inspect_release = {
		"gamepad",
		"right_thumb",
		"released"
	}
	keymap_override_9.action_three = {
		"gamepad",
		"right_thumb",
		"pressed"
	}
	keymap_override_9.action_three_hold = {
		"gamepad",
		"right_thumb",
		"held"
	}
	keymap_override_9.action_three_release = {
		"gamepad",
		"right_thumb",
		"released"
	}
	keymap_override_9.ability = {
		"gamepad",
		"right_trigger",
		"pressed"
	}
	keymap_override_9.ability_hold = {
		"gamepad",
		"right_trigger",
		"held"
	}
	keymap_override_9.ability_release = {
		"gamepad",
		"right_trigger",
		"released"
	}
	keymap_override_9.dodge_1 = {
		"gamepad",
		"left_shoulder",
		"held"
	}
	keymap_override_9.crouch = {
		"gamepad",
		"b",
		"pressed"
	}
	keymap_override_9.crouching = {
		"gamepad",
		"b",
		"held"
	}
	keymap_override_9.ping = {
		"gamepad",
		"left_thumb",
		"pressed"
	}
	keymap_override_9.ping_hold = {
		"gamepad",
		"left_thumb",
		"held"
	}
	KeymapOverride9 = {
		PlayerControllerKeymaps = {
			xb1 = keymap_override_9
		}
	}
	local keymap_override_left = table.clone(DefaultPlayerControllerKeymaps)
	keymap_override_left.look_raw_controller = {
		"gamepad",
		"left",
		"axis"
	}
	keymap_override_left.move_controller = {
		"gamepad",
		"right",
		"axis"
	}
	keymap_override_left.action_inspect = {
		"gamepad",
		"right_thumb",
		"pressed"
	}
	keymap_override_left.action_inspect_hold = {
		"gamepad",
		"right_thumb",
		"held"
	}
	keymap_override_left.action_inspect_release = {
		"gamepad",
		"right_thumb",
		"released"
	}
	keymap_override_left.ability = {
		"gamepad",
		"right_shoulder",
		"pressed"
	}
	keymap_override_left.ability_hold = {
		"gamepad",
		"right_shoulder",
		"held"
	}
	keymap_override_left.ability_release = {
		"gamepad",
		"right_shoulder",
		"released"
	}
	keymap_override_left.action_one = {
		"gamepad",
		"left_trigger",
		"pressed"
	}
	keymap_override_left.action_one_hold = {
		"gamepad",
		"left_trigger",
		"held"
	}
	keymap_override_left.action_one_release = {
		"gamepad",
		"left_trigger",
		"released"
	}
	keymap_override_left.action_two = {
		"gamepad",
		"right_trigger",
		"pressed"
	}
	keymap_override_left.action_two_hold = {
		"gamepad",
		"right_trigger",
		"held"
	}
	keymap_override_left.action_two_release = {
		"gamepad",
		"right_trigger",
		"released"
	}
	keymap_override_left.action_one_softbutton_gamepad = {
		"gamepad",
		"left_trigger",
		"soft_button"
	}
	keymap_override_left.ping = {
		"gamepad",
		"left_shoulder",
		"pressed"
	}
	keymap_override_left.ping_hold = {
		"gamepad",
		"left_shoulder",
		"held"
	}
	keymap_override_left.action_three = {
		"gamepad",
		"left_thumb",
		"pressed"
	}
	keymap_override_left.action_three_hold = {
		"gamepad",
		"left_thumb",
		"held"
	}
	keymap_override_left.action_three_release = {
		"gamepad",
		"left_thumb",
		"released"
	}
	KeymapOverrideLeft = {
		PlayerControllerKeymaps = {
			xb1 = keymap_override_left
		}
	}
	local keymap_override_4 = table.clone(keymap_override_left)
	keymap_override_4.action_one = {
		"gamepad",
		"left_shoulder",
		"pressed"
	}
	keymap_override_4.action_one_hold = {
		"gamepad",
		"left_shoulder",
		"held"
	}
	keymap_override_4.action_one_release = {
		"gamepad",
		"left_shoulder",
		"released"
	}
	keymap_override_4.action_two = {
		"gamepad",
		"right_shoulder",
		"pressed"
	}
	keymap_override_4.action_two_hold = {
		"gamepad",
		"right_shoulder",
		"held"
	}
	keymap_override_4.action_two_release = {
		"gamepad",
		"right_shoulder",
		"released"
	}
	keymap_override_4.action_one_softbutton_gamepad = {
		"gamepad",
		"left_shoulder",
		"soft_button"
	}
	keymap_override_4.ping = {
		"gamepad",
		"left_trigger",
		"pressed"
	}
	keymap_override_4.ping_hold = {
		"gamepad",
		"left_trigger",
		"held"
	}
	keymap_override_4.ability = {
		"gamepad",
		"right_trigger",
		"pressed"
	}
	keymap_override_4.ability_hold = {
		"gamepad",
		"right_trigger",
		"held"
	}
	keymap_override_4.ability_release = {
		"gamepad",
		"right_trigger",
		"released"
	}
	keymap_override_4.action_three = {
		"gamepad",
		"left_thumb",
		"pressed"
	}
	keymap_override_4.action_three_hold = {
		"gamepad",
		"left_thumb",
		"held"
	}
	keymap_override_4.action_three_release = {
		"gamepad",
		"left_thumb",
		"released"
	}
	KeymapOverride4 = {
		PlayerControllerKeymaps = {
			xb1 = keymap_override_4
		}
	}
	local keymap_override_5 = table.clone(keymap_override_left)
	keymap_override_5.action_one = {
		"gamepad",
		"left_trigger",
		"pressed"
	}
	keymap_override_5.action_one_hold = {
		"gamepad",
		"left_trigger",
		"held"
	}
	keymap_override_5.action_one_release = {
		"gamepad",
		"left_trigger",
		"released"
	}
	keymap_override_5.action_two = {
		"gamepad",
		"right_trigger",
		"pressed"
	}
	keymap_override_5.action_two_hold = {
		"gamepad",
		"right_trigger",
		"held"
	}
	keymap_override_5.action_two_release = {
		"gamepad",
		"right_trigger",
		"released"
	}
	keymap_override_5.action_one_softbutton_gamepad = {
		"gamepad",
		"left_trigger",
		"soft_button"
	}
	keymap_override_5.weapon_reload_input = {
		"gamepad",
		"a",
		"pressed"
	}
	keymap_override_5.weapon_reload_hold_input = {
		"gamepad",
		"a",
		"held"
	}
	keymap_override_5.jump_1 = {
		"gamepad",
		"left_shoulder",
		"pressed"
	}
	keymap_override_5.dodge_1 = {
		"gamepad",
		"left_shoulder",
		"held"
	}
	keymap_override_5.ping = {
		"gamepad",
		"right_thumb",
		"pressed"
	}
	keymap_override_5.ping_hold = {
		"gamepad",
		"right_thumb",
		"held"
	}
	keymap_override_5.ability = {
		"gamepad",
		"right_shoulder",
		"pressed"
	}
	keymap_override_5.ability_hold = {
		"gamepad",
		"right_shoulder",
		"held"
	}
	keymap_override_5.ability_release = {
		"gamepad",
		"right_shoulder",
		"released"
	}
	keymap_override_5.action_three = {
		"gamepad",
		"left_thumb",
		"pressed"
	}
	keymap_override_5.action_three_hold = {
		"gamepad",
		"left_thumb",
		"held"
	}
	keymap_override_5.action_three_release = {
		"gamepad",
		"left_thumb",
		"released"
	}
	KeymapOverride5 = {
		PlayerControllerKeymaps = {
			xb1 = keymap_override_5
		}
	}
	local keymap_override_6 = table.clone(keymap_override_left)
	keymap_override_6.action_one = {
		"gamepad",
		"left_shoulder",
		"pressed"
	}
	keymap_override_6.action_one_hold = {
		"gamepad",
		"left_shoulder",
		"held"
	}
	keymap_override_6.action_one_release = {
		"gamepad",
		"left_shoulder",
		"released"
	}
	keymap_override_6.action_two = {
		"gamepad",
		"right_shoulder",
		"pressed"
	}
	keymap_override_6.action_two_hold = {
		"gamepad",
		"right_shoulder",
		"held"
	}
	keymap_override_6.action_two_release = {
		"gamepad",
		"right_shoulder",
		"released"
	}
	keymap_override_6.action_one_softbutton_gamepad = {
		"gamepad",
		"left_shoulder",
		"soft_button"
	}
	keymap_override_6.weapon_reload_input = {
		"gamepad",
		"a",
		"pressed"
	}
	keymap_override_6.weapon_reload_hold_input = {
		"gamepad",
		"a",
		"held"
	}
	keymap_override_6.jump_1 = {
		"gamepad",
		"left_trigger",
		"pressed"
	}
	keymap_override_6.dodge_1 = {
		"gamepad",
		"left_trigger",
		"held"
	}
	keymap_override_6.ping = {
		"gamepad",
		"right_thumb",
		"pressed"
	}
	keymap_override_6.ping_hold = {
		"gamepad",
		"right_thumb",
		"held"
	}
	keymap_override_6.ability = {
		"gamepad",
		"right_trigger",
		"pressed"
	}
	keymap_override_6.ability_hold = {
		"gamepad",
		"right_trigger",
		"held"
	}
	keymap_override_6.ability_release = {
		"gamepad",
		"right_trigger",
		"released"
	}
	keymap_override_6.action_three = {
		"gamepad",
		"left_thumb",
		"pressed"
	}
	keymap_override_6.action_three_hold = {
		"gamepad",
		"left_thumb",
		"held"
	}
	keymap_override_6.action_three_release = {
		"gamepad",
		"left_thumb",
		"released"
	}
	KeymapOverride6 = {
		PlayerControllerKeymaps = {
			xb1 = keymap_override_6
		}
	}
	local keymap_override_8 = table.clone(keymap_override_left)
	keymap_override_8.action_one = {
		"gamepad",
		"left_trigger",
		"pressed"
	}
	keymap_override_8.action_one_hold = {
		"gamepad",
		"left_trigger",
		"held"
	}
	keymap_override_8.action_one_release = {
		"gamepad",
		"left_trigger",
		"released"
	}
	keymap_override_8.action_two = {
		"gamepad",
		"right_trigger",
		"pressed"
	}
	keymap_override_8.action_two_hold = {
		"gamepad",
		"right_trigger",
		"held"
	}
	keymap_override_8.action_two_release = {
		"gamepad",
		"right_trigger",
		"released"
	}
	keymap_override_8.action_one_softbutton_gamepad = {
		"gamepad",
		"left_trigger",
		"soft_button"
	}
	keymap_override_8.weapon_reload_input = {
		"gamepad",
		"a",
		"pressed"
	}
	keymap_override_8.weapon_reload_hold_input = {
		"gamepad",
		"a",
		"held"
	}
	keymap_override_8.jump_1 = {
		"gamepad",
		"right_shoulder",
		"pressed"
	}
	keymap_override_8.dodge_1 = {
		"gamepad",
		"right_shoulder",
		"held"
	}
	keymap_override_8.ping = {
		"gamepad",
		"right_thumb",
		"pressed"
	}
	keymap_override_8.ping_hold = {
		"gamepad",
		"right_thumb",
		"held"
	}
	keymap_override_8.ability = {
		"gamepad",
		"left_shoulder",
		"pressed"
	}
	keymap_override_8.ability_hold = {
		"gamepad",
		"left_shoulder",
		"held"
	}
	keymap_override_8.ability_release = {
		"gamepad",
		"left_shoulder",
		"released"
	}
	KeymapOverride8 = {
		PlayerControllerKeymaps = {
			xb1 = keymap_override_8
		}
	}
	local keymap_override_10 = table.clone(keymap_override_left)
	keymap_override_10.action_one = {
		"gamepad",
		"left_shoulder",
		"pressed"
	}
	keymap_override_10.action_one_hold = {
		"gamepad",
		"left_shoulder",
		"held"
	}
	keymap_override_10.action_one_release = {
		"gamepad",
		"left_shoulder",
		"released"
	}
	keymap_override_10.action_two = {
		"gamepad",
		"right_trigger",
		"pressed"
	}
	keymap_override_10.action_two_hold = {
		"gamepad",
		"right_trigger",
		"held"
	}
	keymap_override_10.action_two_release = {
		"gamepad",
		"right_trigger",
		"released"
	}
	keymap_override_10.action_one_softbutton_gamepad = {
		"gamepad",
		"left_shoulder",
		"soft_button"
	}
	keymap_override_10.action_inspect = {
		"gamepad",
		"left_thumb",
		"pressed"
	}
	keymap_override_10.action_inspect_hold = {
		"gamepad",
		"left_thumb",
		"held"
	}
	keymap_override_10.action_inspect_release = {
		"gamepad",
		"left_thumb",
		"released"
	}
	keymap_override_10.action_three = {
		"gamepad",
		"left_thumb",
		"pressed"
	}
	keymap_override_10.action_three_hold = {
		"gamepad",
		"left_thumb",
		"held"
	}
	keymap_override_10.action_three_release = {
		"gamepad",
		"left_thumb",
		"released"
	}
	keymap_override_10.ability = {
		"gamepad",
		"left_trigger",
		"pressed"
	}
	keymap_override_10.ability_hold = {
		"gamepad",
		"left_trigger",
		"held"
	}
	keymap_override_10.ability_release = {
		"gamepad",
		"left_trigger",
		"released"
	}
	keymap_override_10.dodge_1 = {
		"gamepad",
		"right_shoulder",
		"held"
	}
	keymap_override_10.crouch = {
		"gamepad",
		"b",
		"pressed"
	}
	keymap_override_10.crouching = {
		"gamepad",
		"b",
		"held"
	}
	keymap_override_10.ping = {
		"gamepad",
		"right_thumb",
		"pressed"
	}
	keymap_override_10.ping_hold = {
		"gamepad",
		"right_thumb",
		"held"
	}
	KeymapOverride10 = {
		PlayerControllerKeymaps = {
			xb1 = keymap_override_10
		}
	}
	local keymap_override_1 = table.clone(DefaultPlayerControllerKeymapsPSPad)
	keymap_override_1.action_one = {
		"ps_pad",
		"r1",
		"pressed"
	}
	keymap_override_1.action_one_hold = {
		"ps_pad",
		"r1",
		"held"
	}
	keymap_override_1.action_one_release = {
		"ps_pad",
		"r1",
		"released"
	}
	keymap_override_1.action_two = {
		"ps_pad",
		"l1",
		"pressed"
	}
	keymap_override_1.action_two_hold = {
		"ps_pad",
		"l1",
		"held"
	}
	keymap_override_1.action_two_release = {
		"ps_pad",
		"l1",
		"released"
	}
	keymap_override_1.action_one_softbutton_gamepad = {
		"ps_pad",
		"r1",
		"soft_button"
	}
	keymap_override_1.ping = {
		"ps_pad",
		"r2",
		"pressed"
	}
	keymap_override_1.ping_hold = {
		"ps_pad",
		"r2",
		"held"
	}
	keymap_override_1.ability = {
		"ps_pad",
		"l2",
		"pressed"
	}
	keymap_override_1.ability_hold = {
		"ps_pad",
		"l2",
		"held"
	}
	keymap_override_1.ability_release = {
		"ps_pad",
		"l2",
		"released"
	}
	keymap_override_1.action_three = {
		"ps_pad",
		"r3",
		"pressed"
	}
	keymap_override_1.action_three_hold = {
		"ps_pad",
		"r3",
		"held"
	}
	keymap_override_1.action_three_release = {
		"ps_pad",
		"r3",
		"released"
	}
	KeymapOverride1.PlayerControllerKeymaps.ps_pad = keymap_override_1
	local keymap_override_2 = table.clone(DefaultPlayerControllerKeymapsPSPad)
	keymap_override_2.weapon_reload_input = {
		"ps_pad",
		"cross",
		"pressed"
	}
	keymap_override_2.weapon_reload_hold_input = {
		"ps_pad",
		"cross",
		"held"
	}
	keymap_override_2.jump_1 = {
		"ps_pad",
		"r1",
		"pressed"
	}
	keymap_override_2.dodge_1 = {
		"ps_pad",
		"r1",
		"held"
	}
	keymap_override_2.ping = {
		"ps_pad",
		"l3",
		"pressed"
	}
	keymap_override_2.ping_hold = {
		"ps_pad",
		"l3",
		"held"
	}
	KeymapOverride2.PlayerControllerKeymaps.ps_pad = keymap_override_2
	local keymap_override_3 = table.clone(DefaultPlayerControllerKeymapsPSPad)
	keymap_override_3.action_one = {
		"ps_pad",
		"r1",
		"pressed"
	}
	keymap_override_3.action_one_hold = {
		"ps_pad",
		"r1",
		"held"
	}
	keymap_override_3.action_one_release = {
		"ps_pad",
		"r1",
		"released"
	}
	keymap_override_3.action_two = {
		"ps_pad",
		"l1",
		"pressed"
	}
	keymap_override_3.action_two_hold = {
		"ps_pad",
		"l1",
		"held"
	}
	keymap_override_3.action_two_release = {
		"ps_pad",
		"l1",
		"released"
	}
	keymap_override_3.action_one_softbutton_gamepad = {
		"ps_pad",
		"r1",
		"soft_button"
	}
	keymap_override_3.weapon_reload_input = {
		"ps_pad",
		"cross",
		"pressed"
	}
	keymap_override_3.weapon_reload_hold_input = {
		"ps_pad",
		"cross",
		"held"
	}
	keymap_override_3.ability = {
		"ps_pad",
		"l2",
		"pressed"
	}
	keymap_override_3.ability_hold = {
		"ps_pad",
		"l2",
		"held"
	}
	keymap_override_3.ability_release = {
		"ps_pad",
		"l2",
		"released"
	}
	keymap_override_3.jump_1 = {
		"ps_pad",
		"r2",
		"pressed"
	}
	keymap_override_3.dodge_1 = {
		"ps_pad",
		"r2",
		"held"
	}
	keymap_override_3.ping = {
		"ps_pad",
		"l3",
		"pressed"
	}
	keymap_override_3.ping_hold = {
		"ps_pad",
		"l3",
		"held"
	}
	KeymapOverride3.PlayerControllerKeymaps.ps_pad = keymap_override_3
	local keymap_override_7 = table.clone(DefaultPlayerControllerKeymapsPSPad)
	keymap_override_7.weapon_reload_input = {
		"ps_pad",
		"cross",
		"pressed"
	}
	keymap_override_7.weapon_reload_hold_input = {
		"ps_pad",
		"cross",
		"held"
	}
	keymap_override_7.jump_1 = {
		"ps_pad",
		"l1",
		"pressed"
	}
	keymap_override_7.dodge_1 = {
		"ps_pad",
		"l1",
		"held"
	}
	keymap_override_7.ping = {
		"ps_pad",
		"l3",
		"pressed"
	}
	keymap_override_7.ping_hold = {
		"ps_pad",
		"l3",
		"held"
	}
	keymap_override_7.ability = {
		"ps_pad",
		"r1",
		"pressed"
	}
	keymap_override_7.ability_hold = {
		"ps_pad",
		"r1",
		"held"
	}
	keymap_override_7.ability_release = {
		"ps_pad",
		"r1",
		"released"
	}
	KeymapOverride7.PlayerControllerKeymaps.ps_pad = keymap_override_7
	local keymap_override_9 = table.clone(DefaultPlayerControllerKeymapsPSPad)
	keymap_override_9.action_one = {
		"ps_pad",
		"r1",
		"pressed"
	}
	keymap_override_9.action_one_hold = {
		"ps_pad",
		"r1",
		"held"
	}
	keymap_override_9.action_one_release = {
		"ps_pad",
		"r1",
		"released"
	}
	keymap_override_9.action_two = {
		"ps_pad",
		"l2",
		"pressed"
	}
	keymap_override_9.action_two_hold = {
		"ps_pad",
		"l2",
		"held"
	}
	keymap_override_9.action_two_release = {
		"ps_pad",
		"l2",
		"released"
	}
	keymap_override_9.action_one_softbutton_gamepad = {
		"ps_pad",
		"r1",
		"soft_button"
	}
	keymap_override_9.action_inspect = {
		"ps_pad",
		"r3",
		"pressed"
	}
	keymap_override_9.action_inspect_hold = {
		"ps_pad",
		"r3",
		"held"
	}
	keymap_override_9.action_inspect_release = {
		"ps_pad",
		"r3",
		"released"
	}
	keymap_override_9.action_three = {
		"ps_pad",
		"r3",
		"pressed"
	}
	keymap_override_9.action_three_hold = {
		"ps_pad",
		"r3",
		"held"
	}
	keymap_override_9.action_three_release = {
		"ps_pad",
		"r3",
		"released"
	}
	keymap_override_9.ability = {
		"ps_pad",
		"r2",
		"pressed"
	}
	keymap_override_9.ability_hold = {
		"ps_pad",
		"r2",
		"held"
	}
	keymap_override_9.ability_release = {
		"ps_pad",
		"r2",
		"released"
	}
	keymap_override_9.dodge_1 = {
		"ps_pad",
		"l1",
		"held"
	}
	keymap_override_9.crouch = {
		"ps_pad",
		"circle",
		"pressed"
	}
	keymap_override_9.crouching = {
		"ps_pad",
		"circle",
		"held"
	}
	keymap_override_9.ping = {
		"ps_pad",
		"l3",
		"pressed"
	}
	keymap_override_9.ping_hold = {
		"ps_pad",
		"l3",
		"held"
	}
	KeymapOverride9.PlayerControllerKeymaps.ps_pad = keymap_override_9
	local keymap_override_left = table.clone(DefaultPlayerControllerKeymapsPSPad)
	keymap_override_left.look_raw_controller = {
		"ps_pad",
		"left",
		"axis"
	}
	keymap_override_left.move_controller = {
		"ps_pad",
		"right",
		"axis"
	}
	keymap_override_left.action_inspect = {
		"ps_pad",
		"r3",
		"pressed"
	}
	keymap_override_left.action_inspect_hold = {
		"ps_pad",
		"r3",
		"held"
	}
	keymap_override_left.action_inspect_release = {
		"ps_pad",
		"r3",
		"released"
	}
	keymap_override_left.ability = {
		"ps_pad",
		"r1",
		"pressed"
	}
	keymap_override_left.ability_hold = {
		"ps_pad",
		"r1",
		"held"
	}
	keymap_override_left.ability_release = {
		"ps_pad",
		"r1",
		"released"
	}
	keymap_override_left.action_one = {
		"ps_pad",
		"l2",
		"pressed"
	}
	keymap_override_left.action_one_hold = {
		"ps_pad",
		"l2",
		"held"
	}
	keymap_override_left.action_one_release = {
		"ps_pad",
		"l2",
		"released"
	}
	keymap_override_left.action_two = {
		"ps_pad",
		"r2",
		"pressed"
	}
	keymap_override_left.action_two_hold = {
		"ps_pad",
		"r2",
		"held"
	}
	keymap_override_left.action_two_release = {
		"ps_pad",
		"r2",
		"released"
	}
	keymap_override_left.action_one_softbutton_gamepad = {
		"ps_pad",
		"l2",
		"soft_button"
	}
	keymap_override_left.ping = {
		"ps_pad",
		"l1",
		"pressed"
	}
	keymap_override_left.ping_hold = {
		"ps_pad",
		"l1",
		"held"
	}
	keymap_override_left.action_three = {
		"ps_pad",
		"l3",
		"pressed"
	}
	keymap_override_left.action_three_hold = {
		"ps_pad",
		"l3",
		"held"
	}
	keymap_override_left.action_three_release = {
		"ps_pad",
		"l3",
		"released"
	}
	KeymapOverrideLeft.PlayerControllerKeymaps.ps_pad = keymap_override_left
	local keymap_override_4 = table.clone(keymap_override_left)
	keymap_override_4.action_one = {
		"ps_pad",
		"l1",
		"pressed"
	}
	keymap_override_4.action_one_hold = {
		"ps_pad",
		"l1",
		"held"
	}
	keymap_override_4.action_one_release = {
		"ps_pad",
		"l1",
		"released"
	}
	keymap_override_4.action_two = {
		"ps_pad",
		"r1",
		"pressed"
	}
	keymap_override_4.action_two_hold = {
		"ps_pad",
		"r1",
		"held"
	}
	keymap_override_4.action_two_release = {
		"ps_pad",
		"r1",
		"released"
	}
	keymap_override_4.action_one_softbutton_gamepad = {
		"ps_pad",
		"l1",
		"soft_button"
	}
	keymap_override_4.ping = {
		"ps_pad",
		"l2",
		"pressed"
	}
	keymap_override_4.ping_hold = {
		"ps_pad",
		"l2",
		"held"
	}
	keymap_override_4.ability = {
		"ps_pad",
		"r2",
		"pressed"
	}
	keymap_override_4.ability_hold = {
		"ps_pad",
		"r2",
		"held"
	}
	keymap_override_4.ability_release = {
		"ps_pad",
		"r2",
		"released"
	}
	keymap_override_4.action_three = {
		"ps_pad",
		"l3",
		"pressed"
	}
	keymap_override_4.action_three_hold = {
		"ps_pad",
		"l3",
		"held"
	}
	keymap_override_4.action_three_release = {
		"ps_pad",
		"l3",
		"released"
	}
	KeymapOverride4.PlayerControllerKeymaps.ps_pad = keymap_override_4
	local keymap_override_5 = table.clone(keymap_override_left)
	keymap_override_5.action_one = {
		"ps_pad",
		"l2",
		"pressed"
	}
	keymap_override_5.action_one_hold = {
		"ps_pad",
		"l2",
		"held"
	}
	keymap_override_5.action_one_release = {
		"ps_pad",
		"l2",
		"released"
	}
	keymap_override_5.action_two = {
		"ps_pad",
		"r2",
		"pressed"
	}
	keymap_override_5.action_two_hold = {
		"ps_pad",
		"r2",
		"held"
	}
	keymap_override_5.action_two_release = {
		"ps_pad",
		"r2",
		"released"
	}
	keymap_override_5.action_one_softbutton_gamepad = {
		"ps_pad",
		"l2",
		"soft_button"
	}
	keymap_override_5.weapon_reload_input = {
		"ps_pad",
		"cross",
		"pressed"
	}
	keymap_override_5.weapon_reload_hold_input = {
		"ps_pad",
		"cross",
		"held"
	}
	keymap_override_5.jump_1 = {
		"ps_pad",
		"l1",
		"pressed"
	}
	keymap_override_5.dodge_1 = {
		"ps_pad",
		"l1",
		"held"
	}
	keymap_override_5.ping = {
		"ps_pad",
		"r3",
		"pressed"
	}
	keymap_override_5.ping_hold = {
		"ps_pad",
		"r3",
		"held"
	}
	keymap_override_5.ability = {
		"ps_pad",
		"r1",
		"pressed"
	}
	keymap_override_5.ability_hold = {
		"ps_pad",
		"r1",
		"held"
	}
	keymap_override_5.ability_release = {
		"ps_pad",
		"r1",
		"released"
	}
	keymap_override_5.action_three = {
		"ps_pad",
		"l3",
		"pressed"
	}
	keymap_override_5.action_three_hold = {
		"ps_pad",
		"l3",
		"held"
	}
	keymap_override_5.action_three_release = {
		"ps_pad",
		"l3",
		"released"
	}
	KeymapOverride5.PlayerControllerKeymaps.ps_pad = keymap_override_5
	local keymap_override_6 = table.clone(keymap_override_left)
	keymap_override_6.action_one = {
		"ps_pad",
		"l1",
		"pressed"
	}
	keymap_override_6.action_one_hold = {
		"ps_pad",
		"l1",
		"held"
	}
	keymap_override_6.action_one_release = {
		"ps_pad",
		"l1",
		"released"
	}
	keymap_override_6.action_two = {
		"ps_pad",
		"r1",
		"pressed"
	}
	keymap_override_6.action_two_hold = {
		"ps_pad",
		"r1",
		"held"
	}
	keymap_override_6.action_two_release = {
		"ps_pad",
		"r1",
		"released"
	}
	keymap_override_6.action_one_softbutton_gamepad = {
		"ps_pad",
		"l1",
		"soft_button"
	}
	keymap_override_6.weapon_reload_input = {
		"ps_pad",
		"cross",
		"pressed"
	}
	keymap_override_6.weapon_reload_hold_input = {
		"ps_pad",
		"cross",
		"held"
	}
	keymap_override_6.jump_1 = {
		"ps_pad",
		"l2",
		"pressed"
	}
	keymap_override_6.dodge_1 = {
		"ps_pad",
		"l2",
		"held"
	}
	keymap_override_6.ping = {
		"ps_pad",
		"r3",
		"pressed"
	}
	keymap_override_6.ping_hold = {
		"ps_pad",
		"r3",
		"held"
	}
	keymap_override_6.ability = {
		"ps_pad",
		"r2",
		"pressed"
	}
	keymap_override_6.ability_hold = {
		"ps_pad",
		"r2",
		"held"
	}
	keymap_override_6.ability_release = {
		"ps_pad",
		"r2",
		"released"
	}
	keymap_override_6.action_three = {
		"ps_pad",
		"l3",
		"pressed"
	}
	keymap_override_6.action_three_hold = {
		"ps_pad",
		"l3",
		"held"
	}
	keymap_override_6.action_three_release = {
		"ps_pad",
		"l3",
		"released"
	}
	KeymapOverride6.PlayerControllerKeymaps.ps_pad = keymap_override_6
	local keymap_override_8 = table.clone(DefaultPlayerControllerKeymapsPSPad)
	keymap_override_8.action_one = {
		"ps_pad",
		"l2",
		"pressed"
	}
	keymap_override_8.action_one_hold = {
		"ps_pad",
		"l2",
		"held"
	}
	keymap_override_8.action_one_release = {
		"ps_pad",
		"l2",
		"released"
	}
	keymap_override_8.action_two = {
		"ps_pad",
		"r2",
		"pressed"
	}
	keymap_override_8.action_two_hold = {
		"ps_pad",
		"r2",
		"held"
	}
	keymap_override_8.action_two_release = {
		"ps_pad",
		"r2",
		"released"
	}
	keymap_override_8.action_one_softbutton_gamepad = {
		"ps_pad",
		"l2",
		"soft_button"
	}
	keymap_override_8.weapon_reload_input = {
		"ps_pad",
		"cross",
		"pressed"
	}
	keymap_override_8.weapon_reload_hold_input = {
		"ps_pad",
		"cross",
		"held"
	}
	keymap_override_8.jump_1 = {
		"ps_pad",
		"r1",
		"pressed"
	}
	keymap_override_8.dodge_1 = {
		"ps_pad",
		"r1",
		"held"
	}
	keymap_override_8.ping = {
		"ps_pad",
		"r3",
		"pressed"
	}
	keymap_override_8.ping_hold = {
		"ps_pad",
		"r3",
		"held"
	}
	keymap_override_8.ability = {
		"ps_pad",
		"l1",
		"pressed"
	}
	keymap_override_8.ability_hold = {
		"ps_pad",
		"l1",
		"held"
	}
	keymap_override_8.ability_release = {
		"ps_pad",
		"l1",
		"released"
	}
	KeymapOverride8.PlayerControllerKeymaps.ps_pad = keymap_override_8
	local keymap_override_10 = table.clone(keymap_override_left)
	keymap_override_10.action_one = {
		"ps_pad",
		"l1",
		"pressed"
	}
	keymap_override_10.action_one_hold = {
		"ps_pad",
		"l1",
		"held"
	}
	keymap_override_10.action_one_release = {
		"ps_pad",
		"l1",
		"released"
	}
	keymap_override_10.action_two = {
		"ps_pad",
		"r2",
		"pressed"
	}
	keymap_override_10.action_two_hold = {
		"ps_pad",
		"r2",
		"held"
	}
	keymap_override_10.action_two_release = {
		"ps_pad",
		"r2",
		"released"
	}
	keymap_override_10.action_one_softbutton_gamepad = {
		"ps_pad",
		"l1",
		"soft_button"
	}
	keymap_override_10.action_inspect = {
		"ps_pad",
		"l3",
		"pressed"
	}
	keymap_override_10.action_inspect_hold = {
		"ps_pad",
		"l3",
		"held"
	}
	keymap_override_10.action_inspect_release = {
		"ps_pad",
		"l3",
		"released"
	}
	keymap_override_10.action_three = {
		"ps_pad",
		"l3",
		"pressed"
	}
	keymap_override_10.action_three_hold = {
		"ps_pad",
		"l3",
		"held"
	}
	keymap_override_10.action_three_release = {
		"ps_pad",
		"l3",
		"released"
	}
	keymap_override_10.ability = {
		"ps_pad",
		"l2",
		"pressed"
	}
	keymap_override_10.ability_hold = {
		"ps_pad",
		"l2",
		"held"
	}
	keymap_override_10.ability_release = {
		"ps_pad",
		"l2",
		"released"
	}
	keymap_override_10.dodge_1 = {
		"ps_pad",
		"r1",
		"held"
	}
	keymap_override_10.crouch = {
		"ps_pad",
		"circle",
		"pressed"
	}
	keymap_override_10.crouching = {
		"ps_pad",
		"circle",
		"held"
	}
	keymap_override_10.ping = {
		"ps_pad",
		"r3",
		"pressed"
	}
	keymap_override_10.ping_hold = {
		"ps_pad",
		"r3",
		"held"
	}
	KeymapOverride10.PlayerControllerKeymaps.ps_pad = keymap_override_10
elseif IS_XB1 then
	local keymap_override_1 = table.clone(DefaultPlayerControllerKeymaps)
	keymap_override_1.action_one = {
		"gamepad",
		"right_shoulder",
		"pressed"
	}
	keymap_override_1.action_one_hold = {
		"gamepad",
		"right_shoulder",
		"held"
	}
	keymap_override_1.action_one_release = {
		"gamepad",
		"right_shoulder",
		"released"
	}
	keymap_override_1.action_two = {
		"gamepad",
		"left_shoulder",
		"pressed"
	}
	keymap_override_1.action_two_hold = {
		"gamepad",
		"left_shoulder",
		"held"
	}
	keymap_override_1.action_two_release = {
		"gamepad",
		"left_shoulder",
		"released"
	}
	keymap_override_1.action_one_softbutton_gamepad = {
		"gamepad",
		"right_shoulder",
		"soft_button"
	}
	keymap_override_1.ping = {
		"gamepad",
		"right_trigger",
		"pressed"
	}
	keymap_override_1.ping_hold = {
		"gamepad",
		"right_trigger",
		"held"
	}
	keymap_override_1.ability = {
		"gamepad",
		"left_trigger",
		"pressed"
	}
	keymap_override_1.ability_hold = {
		"gamepad",
		"left_trigger",
		"held"
	}
	keymap_override_1.ability_release = {
		"gamepad",
		"left_trigger",
		"released"
	}
	keymap_override_1.action_three = {
		"gamepad",
		"right_thumb",
		"pressed"
	}
	keymap_override_1.action_three_hold = {
		"gamepad",
		"right_thumb",
		"held"
	}
	keymap_override_1.action_three_release = {
		"gamepad",
		"right_thumb",
		"released"
	}
	KeymapOverride1 = {
		PlayerControllerKeymaps = {
			xb1 = keymap_override_1
		}
	}
	local keymap_override_2 = table.clone(DefaultPlayerControllerKeymaps)
	keymap_override_2.weapon_reload_input = {
		"gamepad",
		"a",
		"pressed"
	}
	keymap_override_2.weapon_reload_hold_input = {
		"gamepad",
		"a",
		"held"
	}
	keymap_override_2.jump_1 = {
		"gamepad",
		"right_shoulder",
		"pressed"
	}
	keymap_override_2.dodge_1 = {
		"gamepad",
		"right_shoulder",
		"held"
	}
	keymap_override_2.ping = {
		"gamepad",
		"left_thumb",
		"pressed"
	}
	keymap_override_2.ping_hold = {
		"gamepad",
		"left_thumb",
		"held"
	}
	KeymapOverride2 = {
		PlayerControllerKeymaps = {
			xb1 = keymap_override_2
		}
	}
	local keymap_override_3 = table.clone(DefaultPlayerControllerKeymaps)
	keymap_override_3.action_one = {
		"gamepad",
		"right_shoulder",
		"pressed"
	}
	keymap_override_3.action_one_hold = {
		"gamepad",
		"right_shoulder",
		"held"
	}
	keymap_override_3.action_one_release = {
		"gamepad",
		"right_shoulder",
		"released"
	}
	keymap_override_3.action_two = {
		"gamepad",
		"left_shoulder",
		"pressed"
	}
	keymap_override_3.action_two_hold = {
		"gamepad",
		"left_shoulder",
		"held"
	}
	keymap_override_3.action_two_release = {
		"gamepad",
		"left_shoulder",
		"released"
	}
	keymap_override_3.action_one_softbutton_gamepad = {
		"gamepad",
		"right_shoulder",
		"soft_button"
	}
	keymap_override_3.weapon_reload_input = {
		"gamepad",
		"a",
		"pressed"
	}
	keymap_override_3.weapon_reload_hold_input = {
		"gamepad",
		"a",
		"held"
	}
	keymap_override_3.ability = {
		"gamepad",
		"left_trigger",
		"pressed"
	}
	keymap_override_3.ability_hold = {
		"gamepad",
		"left_trigger",
		"held"
	}
	keymap_override_3.ability_release = {
		"gamepad",
		"left_trigger",
		"released"
	}
	keymap_override_3.jump_1 = {
		"gamepad",
		"right_trigger",
		"pressed"
	}
	keymap_override_3.dodge_1 = {
		"gamepad",
		"right_trigger",
		"held"
	}
	keymap_override_3.ping = {
		"gamepad",
		"left_thumb",
		"pressed"
	}
	keymap_override_3.ping_hold = {
		"gamepad",
		"left_thumb",
		"held"
	}
	KeymapOverride3 = {
		PlayerControllerKeymaps = {
			xb1 = keymap_override_3
		}
	}
	local keymap_override_7 = table.clone(DefaultPlayerControllerKeymaps)
	keymap_override_7.weapon_reload_input = {
		"gamepad",
		"a",
		"pressed"
	}
	keymap_override_7.weapon_reload_hold_input = {
		"gamepad",
		"a",
		"held"
	}
	keymap_override_7.jump_1 = {
		"gamepad",
		"left_shoulder",
		"pressed"
	}
	keymap_override_7.dodge_1 = {
		"gamepad",
		"left_shoulder",
		"held"
	}
	keymap_override_7.ping = {
		"gamepad",
		"left_thumb",
		"pressed"
	}
	keymap_override_7.ping_hold = {
		"gamepad",
		"left_thumb",
		"held"
	}
	keymap_override_7.ability = {
		"gamepad",
		"right_shoulder",
		"pressed"
	}
	keymap_override_7.ability_hold = {
		"gamepad",
		"right_shoulder",
		"held"
	}
	keymap_override_7.ability_release = {
		"gamepad",
		"right_shoulder",
		"released"
	}
	KeymapOverride7 = {
		PlayerControllerKeymaps = {
			xb1 = keymap_override_7
		}
	}
	local keymap_override_9 = table.clone(DefaultPlayerControllerKeymaps)
	keymap_override_9.action_one = {
		"gamepad",
		"right_shoulder",
		"pressed"
	}
	keymap_override_9.action_one_hold = {
		"gamepad",
		"right_shoulder",
		"held"
	}
	keymap_override_9.action_one_release = {
		"gamepad",
		"right_shoulder",
		"released"
	}
	keymap_override_9.action_two = {
		"gamepad",
		"left_trigger",
		"pressed"
	}
	keymap_override_9.action_two_hold = {
		"gamepad",
		"left_trigger",
		"held"
	}
	keymap_override_9.action_two_release = {
		"gamepad",
		"left_trigger",
		"released"
	}
	keymap_override_9.action_one_softbutton_gamepad = {
		"gamepad",
		"right_shoulder",
		"soft_button"
	}
	keymap_override_9.action_inspect = {
		"gamepad",
		"right_thumb",
		"pressed"
	}
	keymap_override_9.action_inspect_hold = {
		"gamepad",
		"right_thumb",
		"held"
	}
	keymap_override_9.action_inspect_release = {
		"gamepad",
		"right_thumb",
		"released"
	}
	keymap_override_9.action_three = {
		"gamepad",
		"right_thumb",
		"pressed"
	}
	keymap_override_9.action_three_hold = {
		"gamepad",
		"right_thumb",
		"held"
	}
	keymap_override_9.action_three_release = {
		"gamepad",
		"right_thumb",
		"released"
	}
	keymap_override_9.ability = {
		"gamepad",
		"right_trigger",
		"pressed"
	}
	keymap_override_9.ability_hold = {
		"gamepad",
		"right_trigger",
		"held"
	}
	keymap_override_9.ability_release = {
		"gamepad",
		"right_trigger",
		"released"
	}
	keymap_override_9.dodge_1 = {
		"gamepad",
		"left_shoulder",
		"held"
	}
	keymap_override_9.crouch = {
		"gamepad",
		"b",
		"pressed"
	}
	keymap_override_9.crouching = {
		"gamepad",
		"b",
		"held"
	}
	keymap_override_9.ping = {
		"gamepad",
		"left_thumb",
		"pressed"
	}
	keymap_override_9.ping_hold = {
		"gamepad",
		"left_thumb",
		"held"
	}
	KeymapOverride9 = {
		PlayerControllerKeymaps = {
			xb1 = keymap_override_9
		}
	}
	local keymap_override_left = table.clone(DefaultPlayerControllerKeymaps)
	keymap_override_left.look_raw_controller = {
		"gamepad",
		"left",
		"axis"
	}
	keymap_override_left.move_controller = {
		"gamepad",
		"right",
		"axis"
	}
	keymap_override_left.action_inspect = {
		"gamepad",
		"right_thumb",
		"pressed"
	}
	keymap_override_left.action_inspect_hold = {
		"gamepad",
		"right_thumb",
		"held"
	}
	keymap_override_left.action_inspect_release = {
		"gamepad",
		"right_thumb",
		"released"
	}
	keymap_override_left.ability = {
		"gamepad",
		"right_shoulder",
		"pressed"
	}
	keymap_override_left.ability_hold = {
		"gamepad",
		"right_shoulder",
		"held"
	}
	keymap_override_left.ability_release = {
		"gamepad",
		"right_shoulder",
		"released"
	}
	keymap_override_left.action_one = {
		"gamepad",
		"left_trigger",
		"pressed"
	}
	keymap_override_left.action_one_hold = {
		"gamepad",
		"left_trigger",
		"held"
	}
	keymap_override_left.action_one_release = {
		"gamepad",
		"left_trigger",
		"released"
	}
	keymap_override_left.action_two = {
		"gamepad",
		"right_trigger",
		"pressed"
	}
	keymap_override_left.action_two_hold = {
		"gamepad",
		"right_trigger",
		"held"
	}
	keymap_override_left.action_two_release = {
		"gamepad",
		"right_trigger",
		"released"
	}
	keymap_override_left.action_one_softbutton_gamepad = {
		"gamepad",
		"left_trigger",
		"soft_button"
	}
	keymap_override_left.ping = {
		"gamepad",
		"left_shoulder",
		"pressed"
	}
	keymap_override_left.ping_hold = {
		"gamepad",
		"left_shoulder",
		"held"
	}
	keymap_override_left.action_three = {
		"gamepad",
		"left_thumb",
		"pressed"
	}
	keymap_override_left.action_three_hold = {
		"gamepad",
		"left_thumb",
		"held"
	}
	keymap_override_left.action_three_release = {
		"gamepad",
		"left_thumb",
		"released"
	}
	KeymapOverrideLeft = {
		PlayerControllerKeymaps = {
			xb1 = keymap_override_left
		}
	}
	local keymap_override_4 = table.clone(keymap_override_left)
	keymap_override_4.action_one = {
		"gamepad",
		"left_shoulder",
		"pressed"
	}
	keymap_override_4.action_one_hold = {
		"gamepad",
		"left_shoulder",
		"held"
	}
	keymap_override_4.action_one_release = {
		"gamepad",
		"left_shoulder",
		"released"
	}
	keymap_override_4.action_two = {
		"gamepad",
		"right_shoulder",
		"pressed"
	}
	keymap_override_4.action_two_hold = {
		"gamepad",
		"right_shoulder",
		"held"
	}
	keymap_override_4.action_two_release = {
		"gamepad",
		"right_shoulder",
		"released"
	}
	keymap_override_4.action_one_softbutton_gamepad = {
		"gamepad",
		"left_shoulder",
		"soft_button"
	}
	keymap_override_4.ping = {
		"gamepad",
		"left_trigger",
		"pressed"
	}
	keymap_override_4.ping_hold = {
		"gamepad",
		"left_trigger",
		"held"
	}
	keymap_override_4.ability = {
		"gamepad",
		"right_trigger",
		"pressed"
	}
	keymap_override_4.ability_hold = {
		"gamepad",
		"right_trigger",
		"held"
	}
	keymap_override_4.ability_release = {
		"gamepad",
		"right_trigger",
		"released"
	}
	keymap_override_4.action_three = {
		"gamepad",
		"left_thumb",
		"pressed"
	}
	keymap_override_4.action_three_hold = {
		"gamepad",
		"left_thumb",
		"held"
	}
	keymap_override_4.action_three_release = {
		"gamepad",
		"left_thumb",
		"released"
	}
	KeymapOverride4 = {
		PlayerControllerKeymaps = {
			xb1 = keymap_override_4
		}
	}
	local keymap_override_5 = table.clone(keymap_override_left)
	keymap_override_5.action_one = {
		"gamepad",
		"left_trigger",
		"pressed"
	}
	keymap_override_5.action_one_hold = {
		"gamepad",
		"left_trigger",
		"held"
	}
	keymap_override_5.action_one_release = {
		"gamepad",
		"left_trigger",
		"released"
	}
	keymap_override_5.action_two = {
		"gamepad",
		"right_trigger",
		"pressed"
	}
	keymap_override_5.action_two_hold = {
		"gamepad",
		"right_trigger",
		"held"
	}
	keymap_override_5.action_two_release = {
		"gamepad",
		"right_trigger",
		"released"
	}
	keymap_override_5.action_one_softbutton_gamepad = {
		"gamepad",
		"left_trigger",
		"soft_button"
	}
	keymap_override_5.weapon_reload_input = {
		"gamepad",
		"a",
		"pressed"
	}
	keymap_override_5.weapon_reload_hold_input = {
		"gamepad",
		"a",
		"held"
	}
	keymap_override_5.jump_1 = {
		"gamepad",
		"left_shoulder",
		"pressed"
	}
	keymap_override_5.dodge_1 = {
		"gamepad",
		"left_shoulder",
		"held"
	}
	keymap_override_5.ping = {
		"gamepad",
		"right_thumb",
		"pressed"
	}
	keymap_override_5.ping_hold = {
		"gamepad",
		"right_thumb",
		"held"
	}
	keymap_override_5.ability = {
		"gamepad",
		"right_shoulder",
		"pressed"
	}
	keymap_override_5.ability_hold = {
		"gamepad",
		"right_shoulder",
		"held"
	}
	keymap_override_5.ability_release = {
		"gamepad",
		"right_shoulder",
		"released"
	}
	keymap_override_5.action_three = {
		"gamepad",
		"left_thumb",
		"pressed"
	}
	keymap_override_5.action_three_hold = {
		"gamepad",
		"left_thumb",
		"held"
	}
	keymap_override_5.action_three_release = {
		"gamepad",
		"left_thumb",
		"released"
	}
	KeymapOverride5 = {
		PlayerControllerKeymaps = {
			xb1 = keymap_override_5
		}
	}
	local keymap_override_6 = table.clone(keymap_override_left)
	keymap_override_6.action_one = {
		"gamepad",
		"left_shoulder",
		"pressed"
	}
	keymap_override_6.action_one_hold = {
		"gamepad",
		"left_shoulder",
		"held"
	}
	keymap_override_6.action_one_release = {
		"gamepad",
		"left_shoulder",
		"released"
	}
	keymap_override_6.action_two = {
		"gamepad",
		"right_shoulder",
		"pressed"
	}
	keymap_override_6.action_two_hold = {
		"gamepad",
		"right_shoulder",
		"held"
	}
	keymap_override_6.action_two_release = {
		"gamepad",
		"right_shoulder",
		"released"
	}
	keymap_override_6.action_one_softbutton_gamepad = {
		"gamepad",
		"left_shoulder",
		"soft_button"
	}
	keymap_override_6.weapon_reload_input = {
		"gamepad",
		"a",
		"pressed"
	}
	keymap_override_6.weapon_reload_hold_input = {
		"gamepad",
		"a",
		"held"
	}
	keymap_override_6.jump_1 = {
		"gamepad",
		"left_trigger",
		"pressed"
	}
	keymap_override_6.dodge_1 = {
		"gamepad",
		"left_trigger",
		"held"
	}
	keymap_override_6.ping = {
		"gamepad",
		"right_thumb",
		"pressed"
	}
	keymap_override_6.ping_hold = {
		"gamepad",
		"right_thumb",
		"held"
	}
	keymap_override_6.ability = {
		"gamepad",
		"right_trigger",
		"pressed"
	}
	keymap_override_6.ability_hold = {
		"gamepad",
		"right_trigger",
		"held"
	}
	keymap_override_6.ability_release = {
		"gamepad",
		"right_trigger",
		"released"
	}
	keymap_override_6.action_three = {
		"gamepad",
		"left_thumb",
		"pressed"
	}
	keymap_override_6.action_three_hold = {
		"gamepad",
		"left_thumb",
		"held"
	}
	keymap_override_6.action_three_release = {
		"gamepad",
		"left_thumb",
		"released"
	}
	KeymapOverride6 = {
		PlayerControllerKeymaps = {
			xb1 = keymap_override_6
		}
	}
	local keymap_override_8 = table.clone(keymap_override_left)
	keymap_override_8.action_one = {
		"gamepad",
		"left_trigger",
		"pressed"
	}
	keymap_override_8.action_one_hold = {
		"gamepad",
		"left_trigger",
		"held"
	}
	keymap_override_8.action_one_release = {
		"gamepad",
		"left_trigger",
		"released"
	}
	keymap_override_8.action_two = {
		"gamepad",
		"right_trigger",
		"pressed"
	}
	keymap_override_8.action_two_hold = {
		"gamepad",
		"right_trigger",
		"held"
	}
	keymap_override_8.action_two_release = {
		"gamepad",
		"right_trigger",
		"released"
	}
	keymap_override_8.action_one_softbutton_gamepad = {
		"gamepad",
		"left_trigger",
		"soft_button"
	}
	keymap_override_8.weapon_reload_input = {
		"gamepad",
		"a",
		"pressed"
	}
	keymap_override_8.weapon_reload_hold_input = {
		"gamepad",
		"a",
		"held"
	}
	keymap_override_8.jump_1 = {
		"gamepad",
		"right_shoulder",
		"pressed"
	}
	keymap_override_8.dodge_1 = {
		"gamepad",
		"right_shoulder",
		"held"
	}
	keymap_override_8.ping = {
		"gamepad",
		"right_thumb",
		"pressed"
	}
	keymap_override_8.ping_hold = {
		"gamepad",
		"right_thumb",
		"held"
	}
	keymap_override_8.ability = {
		"gamepad",
		"left_shoulder",
		"pressed"
	}
	keymap_override_8.ability_hold = {
		"gamepad",
		"left_shoulder",
		"held"
	}
	keymap_override_8.ability_release = {
		"gamepad",
		"left_shoulder",
		"released"
	}
	keymap_override_8.action_three = {
		"gamepad",
		"left_thumb",
		"pressed"
	}
	keymap_override_8.action_three_hold = {
		"gamepad",
		"left_thumb",
		"held"
	}
	keymap_override_8.action_three_release = {
		"gamepad",
		"left_thumb",
		"released"
	}
	KeymapOverride8 = {
		PlayerControllerKeymaps = {
			xb1 = keymap_override_8
		}
	}
	local keymap_override_10 = table.clone(keymap_override_left)
	keymap_override_10.action_one = {
		"gamepad",
		"left_shoulder",
		"pressed"
	}
	keymap_override_10.action_one_hold = {
		"gamepad",
		"left_shoulder",
		"held"
	}
	keymap_override_10.action_one_release = {
		"gamepad",
		"left_shoulder",
		"released"
	}
	keymap_override_10.action_two = {
		"gamepad",
		"right_trigger",
		"pressed"
	}
	keymap_override_10.action_two_hold = {
		"gamepad",
		"right_trigger",
		"held"
	}
	keymap_override_10.action_two_release = {
		"gamepad",
		"right_trigger",
		"released"
	}
	keymap_override_10.action_one_softbutton_gamepad = {
		"gamepad",
		"left_shoulder",
		"soft_button"
	}
	keymap_override_10.action_inspect = {
		"gamepad",
		"left_thumb",
		"pressed"
	}
	keymap_override_10.action_inspect_hold = {
		"gamepad",
		"left_thumb",
		"held"
	}
	keymap_override_10.action_inspect_release = {
		"gamepad",
		"left_thumb",
		"released"
	}
	keymap_override_10.action_three = {
		"gamepad",
		"left_thumb",
		"pressed"
	}
	keymap_override_10.action_three_hold = {
		"gamepad",
		"left_thumb",
		"held"
	}
	keymap_override_10.action_three_release = {
		"gamepad",
		"left_thumb",
		"released"
	}
	keymap_override_10.ability = {
		"gamepad",
		"left_trigger",
		"pressed"
	}
	keymap_override_10.ability_hold = {
		"gamepad",
		"left_trigger",
		"held"
	}
	keymap_override_10.ability_release = {
		"gamepad",
		"left_trigger",
		"released"
	}
	keymap_override_10.dodge_1 = {
		"gamepad",
		"right_shoulder",
		"held"
	}
	keymap_override_10.crouch = {
		"gamepad",
		"b",
		"pressed"
	}
	keymap_override_10.crouching = {
		"gamepad",
		"b",
		"held"
	}
	keymap_override_10.ping = {
		"gamepad",
		"right_thumb",
		"pressed"
	}
	keymap_override_10.ping_hold = {
		"gamepad",
		"right_thumb",
		"held"
	}
	KeymapOverride10 = {
		PlayerControllerKeymaps = {
			xb1 = keymap_override_10
		}
	}
elseif IS_PS4 then
	local keymap_override_1 = table.clone(DefaultPlayerControllerKeymaps)
	keymap_override_1.action_one = {
		"gamepad",
		"r1",
		"pressed"
	}
	keymap_override_1.action_one_hold = {
		"gamepad",
		"r1",
		"held"
	}
	keymap_override_1.action_one_release = {
		"gamepad",
		"r1",
		"released"
	}
	keymap_override_1.action_two = {
		"gamepad",
		"l1",
		"pressed"
	}
	keymap_override_1.action_two_hold = {
		"gamepad",
		"l1",
		"held"
	}
	keymap_override_1.action_two_release = {
		"gamepad",
		"l1",
		"released"
	}
	keymap_override_1.action_one_softbutton_gamepad = {
		"gamepad",
		"r1",
		"soft_button"
	}
	keymap_override_1.ping = {
		"gamepad",
		"r2",
		"pressed"
	}
	keymap_override_1.ping_hold = {
		"gamepad",
		"r2",
		"held"
	}
	keymap_override_1.ability = {
		"gamepad",
		"l2",
		"pressed"
	}
	keymap_override_1.ability_hold = {
		"gamepad",
		"l2",
		"held"
	}
	keymap_override_1.ability_release = {
		"gamepad",
		"l2",
		"released"
	}
	keymap_override_1.action_three = {
		"gamepad",
		"r3",
		"pressed"
	}
	keymap_override_1.action_three_hold = {
		"gamepad",
		"r3",
		"held"
	}
	keymap_override_1.action_three_release = {
		"gamepad",
		"r3",
		"released"
	}
	KeymapOverride1 = {
		PlayerControllerKeymaps = {
			ps4 = keymap_override_1
		}
	}
	local keymap_override_2 = table.clone(DefaultPlayerControllerKeymaps)
	keymap_override_2.weapon_reload_input = {
		"gamepad",
		"cross",
		"pressed"
	}
	keymap_override_2.weapon_reload_hold_input = {
		"gamepad",
		"cross",
		"held"
	}
	keymap_override_2.jump_1 = {
		"gamepad",
		"r1",
		"pressed"
	}
	keymap_override_2.dodge_1 = {
		"gamepad",
		"r1",
		"held"
	}
	keymap_override_2.ping = {
		"gamepad",
		"l3",
		"pressed"
	}
	keymap_override_2.ping_hold = {
		"gamepad",
		"l3",
		"held"
	}
	KeymapOverride2 = {
		PlayerControllerKeymaps = {
			ps4 = keymap_override_2
		}
	}
	local keymap_override_3 = table.clone(DefaultPlayerControllerKeymaps)
	keymap_override_3.action_one = {
		"gamepad",
		"r1",
		"pressed"
	}
	keymap_override_3.action_one_hold = {
		"gamepad",
		"r1",
		"held"
	}
	keymap_override_3.action_one_release = {
		"gamepad",
		"r1",
		"released"
	}
	keymap_override_3.action_two = {
		"gamepad",
		"l1",
		"pressed"
	}
	keymap_override_3.action_two_hold = {
		"gamepad",
		"l1",
		"held"
	}
	keymap_override_3.action_two_release = {
		"gamepad",
		"l1",
		"released"
	}
	keymap_override_3.action_one_softbutton_gamepad = {
		"gamepad",
		"r1",
		"soft_button"
	}
	keymap_override_3.weapon_reload_input = {
		"gamepad",
		"cross",
		"pressed"
	}
	keymap_override_3.weapon_reload_hold_input = {
		"gamepad",
		"cross",
		"held"
	}
	keymap_override_3.ability = {
		"gamepad",
		"l2",
		"pressed"
	}
	keymap_override_3.ability_hold = {
		"gamepad",
		"l2",
		"held"
	}
	keymap_override_3.ability_release = {
		"gamepad",
		"l2",
		"released"
	}
	keymap_override_3.jump_1 = {
		"gamepad",
		"r2",
		"pressed"
	}
	keymap_override_3.dodge_1 = {
		"gamepad",
		"r2",
		"held"
	}
	keymap_override_3.ping = {
		"gamepad",
		"l3",
		"pressed"
	}
	keymap_override_3.ping_hold = {
		"gamepad",
		"l3",
		"held"
	}
	KeymapOverride3 = {
		PlayerControllerKeymaps = {
			ps4 = keymap_override_3
		}
	}
	local keymap_override_7 = table.clone(DefaultPlayerControllerKeymaps)
	keymap_override_7.weapon_reload_input = {
		"gamepad",
		"cross",
		"pressed"
	}
	keymap_override_7.weapon_reload_hold_input = {
		"gamepad",
		"cross",
		"held"
	}
	keymap_override_7.jump_1 = {
		"gamepad",
		"l1",
		"pressed"
	}
	keymap_override_7.dodge_1 = {
		"gamepad",
		"l1",
		"held"
	}
	keymap_override_7.ping = {
		"gamepad",
		"l3",
		"pressed"
	}
	keymap_override_7.ping_hold = {
		"gamepad",
		"l3",
		"held"
	}
	keymap_override_7.ability = {
		"gamepad",
		"r1",
		"pressed"
	}
	keymap_override_7.ability_hold = {
		"gamepad",
		"r1",
		"held"
	}
	keymap_override_7.ability_release = {
		"gamepad",
		"r1",
		"released"
	}
	KeymapOverride7 = {
		PlayerControllerKeymaps = {
			ps4 = keymap_override_7
		}
	}
	local keymap_override_9 = table.clone(DefaultPlayerControllerKeymaps)
	keymap_override_9.action_one = {
		"gamepad",
		"r1",
		"pressed"
	}
	keymap_override_9.action_one_hold = {
		"gamepad",
		"r1",
		"held"
	}
	keymap_override_9.action_one_release = {
		"gamepad",
		"r1",
		"released"
	}
	keymap_override_9.action_two = {
		"gamepad",
		"l2",
		"pressed"
	}
	keymap_override_9.action_two_hold = {
		"gamepad",
		"l2",
		"held"
	}
	keymap_override_9.action_two_release = {
		"gamepad",
		"l2",
		"released"
	}
	keymap_override_9.action_one_softbutton_gamepad = {
		"gamepad",
		"r1",
		"soft_button"
	}
	keymap_override_9.action_inspect = {
		"gamepad",
		"r3",
		"pressed"
	}
	keymap_override_9.action_inspect_hold = {
		"gamepad",
		"r3",
		"held"
	}
	keymap_override_9.action_inspect_release = {
		"gamepad",
		"r3",
		"released"
	}
	keymap_override_9.action_three = {
		"gamepad",
		"r3",
		"pressed"
	}
	keymap_override_9.action_three_hold = {
		"gamepad",
		"r3",
		"held"
	}
	keymap_override_9.action_three_release = {
		"gamepad",
		"r3",
		"released"
	}
	keymap_override_9.ability = {
		"gamepad",
		"r2",
		"pressed"
	}
	keymap_override_9.ability_hold = {
		"gamepad",
		"r2",
		"held"
	}
	keymap_override_9.ability_release = {
		"gamepad",
		"r2",
		"released"
	}
	keymap_override_9.dodge_1 = {
		"gamepad",
		"l1",
		"held"
	}
	keymap_override_9.crouch = {
		"gamepad",
		"circle",
		"pressed"
	}
	keymap_override_9.crouching = {
		"gamepad",
		"circle",
		"held"
	}
	keymap_override_9.ping = {
		"gamepad",
		"l3",
		"pressed"
	}
	keymap_override_9.ping_hold = {
		"gamepad",
		"l3",
		"held"
	}
	KeymapOverride9 = {
		PlayerControllerKeymaps = {
			ps4 = keymap_override_9
		}
	}
	local keymap_override_left = table.clone(DefaultPlayerControllerKeymaps)
	keymap_override_left.look_raw_controller = {
		"gamepad",
		"left",
		"axis"
	}
	keymap_override_left.move_controller = {
		"gamepad",
		"right",
		"axis"
	}
	keymap_override_left.action_inspect = {
		"gamepad",
		"r3",
		"pressed"
	}
	keymap_override_left.action_inspect_hold = {
		"gamepad",
		"r3",
		"held"
	}
	keymap_override_left.action_inspect_release = {
		"gamepad",
		"r3",
		"released"
	}
	keymap_override_left.ability = {
		"gamepad",
		"r1",
		"pressed"
	}
	keymap_override_left.ability_hold = {
		"gamepad",
		"r1",
		"held"
	}
	keymap_override_left.ability_release = {
		"gamepad",
		"r1",
		"released"
	}
	keymap_override_left.action_one = {
		"gamepad",
		"l2",
		"pressed"
	}
	keymap_override_left.action_one_hold = {
		"gamepad",
		"l2",
		"held"
	}
	keymap_override_left.action_one_release = {
		"gamepad",
		"l2",
		"released"
	}
	keymap_override_left.action_two = {
		"gamepad",
		"r2",
		"pressed"
	}
	keymap_override_left.action_two_hold = {
		"gamepad",
		"r2",
		"held"
	}
	keymap_override_left.action_two_release = {
		"gamepad",
		"r2",
		"released"
	}
	keymap_override_left.action_one_softbutton_gamepad = {
		"gamepad",
		"l2",
		"soft_button"
	}
	keymap_override_left.ping = {
		"gamepad",
		"l1",
		"pressed"
	}
	keymap_override_left.ping_hold = {
		"gamepad",
		"l1",
		"held"
	}
	keymap_override_left.action_three = {
		"gamepad",
		"l3",
		"pressed"
	}
	keymap_override_left.action_three_hold = {
		"gamepad",
		"l3",
		"held"
	}
	keymap_override_left.action_three_release = {
		"gamepad",
		"l3",
		"released"
	}
	KeymapOverrideLeft = {
		PlayerControllerKeymaps = {
			ps4 = keymap_override_left
		}
	}
	local keymap_override_4 = table.clone(keymap_override_left)
	keymap_override_4.action_one = {
		"gamepad",
		"l1",
		"pressed"
	}
	keymap_override_4.action_one_hold = {
		"gamepad",
		"l1",
		"held"
	}
	keymap_override_4.action_one_release = {
		"gamepad",
		"l1",
		"released"
	}
	keymap_override_4.action_two = {
		"gamepad",
		"r1",
		"pressed"
	}
	keymap_override_4.action_two_hold = {
		"gamepad",
		"r1",
		"held"
	}
	keymap_override_4.action_two_release = {
		"gamepad",
		"r1",
		"released"
	}
	keymap_override_4.action_one_softbutton_gamepad = {
		"gamepad",
		"l1",
		"soft_button"
	}
	keymap_override_4.ping = {
		"gamepad",
		"l2",
		"pressed"
	}
	keymap_override_4.ping_hold = {
		"gamepad",
		"l2",
		"held"
	}
	keymap_override_4.ability = {
		"gamepad",
		"r2",
		"pressed"
	}
	keymap_override_4.ability_hold = {
		"gamepad",
		"r2",
		"held"
	}
	keymap_override_4.ability_release = {
		"gamepad",
		"r2",
		"released"
	}
	keymap_override_4.action_three = {
		"gamepad",
		"l3",
		"pressed"
	}
	keymap_override_4.action_three_hold = {
		"gamepad",
		"l3",
		"held"
	}
	keymap_override_4.action_three_release = {
		"gamepad",
		"l3",
		"released"
	}
	KeymapOverride4 = {
		PlayerControllerKeymaps = {
			ps4 = keymap_override_4
		}
	}
	local keymap_override_5 = table.clone(keymap_override_left)
	keymap_override_5.action_one = {
		"gamepad",
		"l2",
		"pressed"
	}
	keymap_override_5.action_one_hold = {
		"gamepad",
		"l2",
		"held"
	}
	keymap_override_5.action_one_release = {
		"gamepad",
		"l2",
		"released"
	}
	keymap_override_5.action_two = {
		"gamepad",
		"r2",
		"pressed"
	}
	keymap_override_5.action_two_hold = {
		"gamepad",
		"r2",
		"held"
	}
	keymap_override_5.action_two_release = {
		"gamepad",
		"r2",
		"released"
	}
	keymap_override_5.action_one_softbutton_gamepad = {
		"gamepad",
		"l2",
		"soft_button"
	}
	keymap_override_5.weapon_reload_input = {
		"gamepad",
		"cross",
		"pressed"
	}
	keymap_override_5.weapon_reload_hold_input = {
		"gamepad",
		"cross",
		"held"
	}
	keymap_override_5.jump_1 = {
		"gamepad",
		"l1",
		"pressed"
	}
	keymap_override_5.dodge_1 = {
		"gamepad",
		"l1",
		"held"
	}
	keymap_override_5.ping = {
		"gamepad",
		"r3",
		"pressed"
	}
	keymap_override_5.ping_hold = {
		"gamepad",
		"r3",
		"held"
	}
	keymap_override_5.ability = {
		"gamepad",
		"r1",
		"pressed"
	}
	keymap_override_5.ability_hold = {
		"gamepad",
		"r1",
		"held"
	}
	keymap_override_5.ability_release = {
		"gamepad",
		"r1",
		"released"
	}
	keymap_override_5.action_three = {
		"gamepad",
		"l3",
		"pressed"
	}
	keymap_override_5.action_three_hold = {
		"gamepad",
		"l3",
		"held"
	}
	keymap_override_5.action_three_release = {
		"gamepad",
		"l3",
		"released"
	}
	KeymapOverride5 = {
		PlayerControllerKeymaps = {
			ps4 = keymap_override_5
		}
	}
	local keymap_override_6 = table.clone(keymap_override_left)
	keymap_override_6.action_one = {
		"gamepad",
		"l1",
		"pressed"
	}
	keymap_override_6.action_one_hold = {
		"gamepad",
		"l1",
		"held"
	}
	keymap_override_6.action_one_release = {
		"gamepad",
		"l1",
		"released"
	}
	keymap_override_6.action_two = {
		"gamepad",
		"r1",
		"pressed"
	}
	keymap_override_6.action_two_hold = {
		"gamepad",
		"r1",
		"held"
	}
	keymap_override_6.action_two_release = {
		"gamepad",
		"r1",
		"released"
	}
	keymap_override_6.action_one_softbutton_gamepad = {
		"gamepad",
		"l1",
		"soft_button"
	}
	keymap_override_6.weapon_reload_input = {
		"gamepad",
		"cross",
		"pressed"
	}
	keymap_override_6.weapon_reload_hold_input = {
		"gamepad",
		"cross",
		"held"
	}
	keymap_override_6.jump_1 = {
		"gamepad",
		"l2",
		"pressed"
	}
	keymap_override_6.dodge_1 = {
		"gamepad",
		"l2",
		"held"
	}
	keymap_override_6.ping = {
		"gamepad",
		"r3",
		"pressed"
	}
	keymap_override_6.ping_hold = {
		"gamepad",
		"r3",
		"held"
	}
	keymap_override_6.ability = {
		"gamepad",
		"r2",
		"pressed"
	}
	keymap_override_6.ability_hold = {
		"gamepad",
		"r2",
		"held"
	}
	keymap_override_6.ability_release = {
		"gamepad",
		"r2",
		"released"
	}
	keymap_override_6.action_three = {
		"gamepad",
		"l3",
		"pressed"
	}
	keymap_override_6.action_three_hold = {
		"gamepad",
		"l3",
		"held"
	}
	keymap_override_6.action_three_release = {
		"gamepad",
		"l3",
		"released"
	}
	KeymapOverride6 = {
		PlayerControllerKeymaps = {
			ps4 = keymap_override_6
		}
	}
	local keymap_override_8 = table.clone(DefaultPlayerControllerKeymaps)
	keymap_override_8.action_one = {
		"gamepad",
		"l2",
		"pressed"
	}
	keymap_override_8.action_one_hold = {
		"gamepad",
		"l2",
		"held"
	}
	keymap_override_8.action_one_release = {
		"gamepad",
		"l2",
		"released"
	}
	keymap_override_8.action_two = {
		"gamepad",
		"r2",
		"pressed"
	}
	keymap_override_8.action_two_hold = {
		"gamepad",
		"r2",
		"held"
	}
	keymap_override_8.action_two_release = {
		"gamepad",
		"r2",
		"released"
	}
	keymap_override_8.action_one_softbutton_gamepad = {
		"gamepad",
		"l2",
		"soft_button"
	}
	keymap_override_8.weapon_reload_input = {
		"gamepad",
		"cross",
		"pressed"
	}
	keymap_override_8.weapon_reload_hold_input = {
		"gamepad",
		"cross",
		"held"
	}
	keymap_override_8.jump_1 = {
		"gamepad",
		"r1",
		"pressed"
	}
	keymap_override_8.dodge_1 = {
		"gamepad",
		"r1",
		"held"
	}
	keymap_override_8.ping = {
		"gamepad",
		"r3",
		"pressed"
	}
	keymap_override_8.ping_hold = {
		"gamepad",
		"r3",
		"held"
	}
	keymap_override_8.ability = {
		"gamepad",
		"l1",
		"pressed"
	}
	keymap_override_8.ability_hold = {
		"gamepad",
		"l1",
		"held"
	}
	keymap_override_8.ability_release = {
		"gamepad",
		"l1",
		"released"
	}
	KeymapOverride8 = {
		PlayerControllerKeymaps = {
			ps4 = keymap_override_8
		}
	}
	local keymap_override_10 = table.clone(keymap_override_left)
	keymap_override_10.action_one = {
		"gamepad",
		"l1",
		"pressed"
	}
	keymap_override_10.action_one_hold = {
		"gamepad",
		"l1",
		"held"
	}
	keymap_override_10.action_one_release = {
		"gamepad",
		"l1",
		"released"
	}
	keymap_override_10.action_two = {
		"gamepad",
		"r2",
		"pressed"
	}
	keymap_override_10.action_two_hold = {
		"gamepad",
		"r2",
		"held"
	}
	keymap_override_10.action_two_release = {
		"gamepad",
		"r2",
		"released"
	}
	keymap_override_10.action_one_softbutton_gamepad = {
		"gamepad",
		"l1",
		"soft_button"
	}
	keymap_override_10.action_inspect = {
		"gamepad",
		"l3",
		"pressed"
	}
	keymap_override_10.action_inspect_hold = {
		"gamepad",
		"l3",
		"held"
	}
	keymap_override_10.action_inspect_release = {
		"gamepad",
		"l3",
		"released"
	}
	keymap_override_10.action_three = {
		"gamepad",
		"l3",
		"pressed"
	}
	keymap_override_10.action_three_hold = {
		"gamepad",
		"l3",
		"held"
	}
	keymap_override_10.action_three_release = {
		"gamepad",
		"l3",
		"released"
	}
	keymap_override_10.ability = {
		"gamepad",
		"l2",
		"pressed"
	}
	keymap_override_10.ability_hold = {
		"gamepad",
		"l2",
		"held"
	}
	keymap_override_10.ability_release = {
		"gamepad",
		"l2",
		"released"
	}
	keymap_override_10.dodge_1 = {
		"gamepad",
		"r1",
		"held"
	}
	keymap_override_10.crouch = {
		"gamepad",
		"circle",
		"pressed"
	}
	keymap_override_10.crouching = {
		"gamepad",
		"circle",
		"held"
	}
	keymap_override_10.ping = {
		"gamepad",
		"r3",
		"pressed"
	}
	keymap_override_10.ping_hold = {
		"gamepad",
		"r3",
		"held"
	}
	KeymapOverride10 = {
		PlayerControllerKeymaps = {
			ps4 = keymap_override_10
		}
	}
end

AlternatateGamepadKeymapsOptionsMenu = {
	{
		text = "layout_default",
		value = "default"
	},
	{
		text = "layout_alternate_1",
		value = "alternate_1"
	},
	{
		text = "layout_alternate_2",
		value = "alternate_2"
	},
	{
		text = "layout_alternate_3",
		value = "alternate_3"
	},
	{
		text = "layout_alternate_4",
		value = "alternate_4"
	},
	{
		text = "layout_alternate_5",
		value = "alternate_5"
	}
}
AlternatateGamepadKeymapsLayouts = {
	default = DefaultGamepadLayoutKeymaps,
	alternate_1 = KeymapOverride1,
	alternate_2 = KeymapOverride2,
	alternate_3 = KeymapOverride3,
	alternate_4 = KeymapOverride7,
	alternate_5 = KeymapOverride9
}
AlternatateGamepadKeymapsLayoutsLeftHanded = {
	default = KeymapOverrideLeft,
	alternate_1 = KeymapOverride4,
	alternate_2 = KeymapOverride5,
	alternate_3 = KeymapOverride6,
	alternate_4 = KeymapOverride8,
	alternate_5 = KeymapOverride10
}

if IS_WINDOWS then
	AlternatateGamepadSettings = {
		default = {
			ignore_gamepad_action_names = {
				action_two_hold = true,
				dodge_2 = true,
				next_observer_target = true,
				active_ability_right_pressed = true,
				action_one_release = true,
				active_ability_right_held = true,
				wield_switch_1 = true,
				interacting = true,
				action_three_hold = true,
				action_three_release = true,
				previous_observer_target = true,
				ghost_mode_exit = true,
				crouching = true,
				move_left_pressed = true,
				ability_release = true,
				ghost_mode_enter = true,
				action_two_release = true,
				emote_camera_zoom = true,
				action_one_mouse = true,
				emote_toggle_hud_visibility = true,
				social_wheel_page = true,
				emote_camera_zoom_in = true,
				action_inspect_release = true,
				wield_switch = true,
				active_ability_left_release = true,
				weapon_reload_hold_input = true,
				wield_switch_2 = true,
				active_ability_right_release = true,
				action_inspect_hold = true,
				active_ability_left_pressed = true,
				active_ability_left_held = true,
				action_one_hold = true,
				emote_camera_zoom_out = true,
				ping_release = true,
				ping_hold = true,
				action_one_softbutton_gamepad = true,
				ability_hold = true,
				weapon_reload_hold_input_input = true
			},
			replace_gamepad_action_names = {
				dodge_1 = "mission_objective_prologue_dodge",
				jump_1 = "mission_objective_prologue_jumping",
				ping = "lb_ping"
			},
			default_gamepad_actions_by_key = {
				ls = "move_controller",
				start = "toggle_menu",
				y = "wield_switch",
				back = "ingame_player_list_toggle",
				rs = "look_raw_controller"
			}
		},
		left_handed = {
			ignore_gamepad_action_names = {
				active_ability_left_pressed = true,
				dodge_2 = true,
				next_observer_target = true,
				action_two_hold = true,
				action_one_release = true,
				active_ability_right_held = true,
				wield_switch_1 = true,
				interacting = true,
				action_three_hold = true,
				action_three_release = true,
				action_two_release = true,
				ghost_mode_exit = true,
				crouching = true,
				move_left_pressed = true,
				ability_release = true,
				ghost_mode_enter = true,
				emote_camera_zoom = true,
				emote_toggle_hud_visibility = true,
				action_one_mouse = true,
				social_wheel_page = true,
				emote_camera_zoom_in = true,
				action_inspect_release = true,
				wield_switch = true,
				active_ability_left_release = true,
				weapon_reload_hold_input = true,
				wield_switch_2 = true,
				active_ability_right_release = true,
				action_inspect_hold = true,
				active_ability_right_pressed = true,
				active_ability_left_held = true,
				action_one_hold = true,
				emote_camera_zoom_out = true,
				ping_release = true,
				ping_hold = true,
				action_one_softbutton_gamepad = true,
				ability_hold = true,
				previous_observer_target = true
			},
			replace_gamepad_action_names = {
				dodge_1 = "mission_objective_prologue_dodge",
				jump_1 = "mission_objective_prologue_jumping",
				ping = "lb_ping"
			},
			default_gamepad_actions_by_key = {
				ls = "look_raw_controller",
				start = "toggle_menu",
				y = "wield_switch",
				back = "ingame_player_list_toggle",
				rs = "move_controller"
			}
		}
	}
elseif IS_XB1 then
	AlternatateGamepadSettings = {
		default = {
			ignore_gamepad_action_names = {
				emote_camera_zoom = true,
				emote_toggle_hud_visibility = true,
				action_two_hold = true,
				next_observer_target = true,
				active_ability_right_pressed = true,
				active_ability_right_held = true,
				wield_switch_1 = true,
				action_one_release = true,
				dodge_2 = true,
				action_three_release = true,
				interacting = true,
				ghost_mode_exit = true,
				crouching = true,
				move_left_pressed = true,
				ability_release = true,
				ghost_mode_enter = true,
				action_three_hold = true,
				action_two_release = true,
				action_one_mouse = true,
				social_wheel_page = true,
				emote_camera_zoom_in = true,
				action_inspect_release = true,
				active_ability_left_release = true,
				weapon_reload_hold_input = true,
				wield_switch_2 = true,
				active_ability_right_release = true,
				action_inspect_hold = true,
				active_ability_left_pressed = true,
				active_ability_left_held = true,
				action_one_hold = true,
				emote_camera_zoom_out = true,
				ping_release = true,
				action_one_softbutton_gamepad = true,
				ability_hold = true,
				previous_observer_target = true
			},
			replace_gamepad_action_names = {
				dodge_1 = "mission_objective_prologue_dodge",
				jump_1 = "mission_objective_prologue_jumping",
				ping = "lb_ping"
			},
			default_gamepad_actions_by_key = {
				ls = "move_controller",
				start = "toggle_menu",
				y = "wield_switch",
				back = "ingame_player_list_toggle",
				rs = "look_raw_controller"
			}
		},
		left_handed = {
			ignore_gamepad_action_names = {
				action_inspect_release = true,
				dodge_2 = true,
				action_two_hold = true,
				next_observer_target = true,
				active_ability_left_pressed = true,
				active_ability_right_held = true,
				wield_switch_1 = true,
				action_one_release = true,
				interacting = true,
				action_three_release = true,
				action_three_hold = true,
				ghost_mode_exit = true,
				crouching = true,
				move_left_pressed = true,
				ability_release = true,
				ghost_mode_enter = true,
				action_two_release = true,
				emote_toggle_hud_visibility = true,
				action_one_mouse = true,
				social_wheel_page = true,
				emote_camera_zoom_in = true,
				emote_camera_zoom = true,
				wield_switch = true,
				active_ability_left_release = true,
				weapon_reload_hold_input = true,
				wield_switch_2 = true,
				active_ability_right_release = true,
				action_inspect_hold = true,
				active_ability_right_pressed = true,
				active_ability_left_held = true,
				action_one_hold = true,
				emote_camera_zoom_out = true,
				ping_release = true,
				action_one_softbutton_gamepad = true,
				ability_hold = true,
				previous_observer_target = true
			},
			replace_gamepad_action_names = {
				dodge_1 = "mission_objective_prologue_dodge",
				jump_1 = "mission_objective_prologue_jumping",
				ping = "lb_ping"
			},
			default_gamepad_actions_by_key = {
				ls = "look_raw_controller",
				start = "toggle_menu",
				y = "wield_switch",
				back = "ingame_player_list_toggle",
				rs = "move_controller"
			}
		}
	}
elseif IS_PS4 then
	AlternatateGamepadSettings = {
		default = {
			ignore_gamepad_action_names = {
				emote_camera_zoom = true,
				emote_toggle_hud_visibility = true,
				action_two_hold = true,
				next_observer_target = true,
				active_ability_right_pressed = true,
				active_ability_right_held = true,
				wield_switch_1 = true,
				action_one_release = true,
				dodge_2 = true,
				action_three_release = true,
				interacting = true,
				ghost_mode_exit = true,
				crouching = true,
				move_left_pressed = true,
				ability_release = true,
				ghost_mode_enter = true,
				action_three_hold = true,
				action_two_release = true,
				action_one_mouse = true,
				social_wheel_page = true,
				emote_camera_zoom_in = true,
				action_inspect_release = true,
				active_ability_left_release = true,
				weapon_reload_hold_input = true,
				wield_switch_2 = true,
				active_ability_right_release = true,
				action_inspect_hold = true,
				active_ability_left_pressed = true,
				active_ability_left_held = true,
				action_one_hold = true,
				emote_camera_zoom_out = true,
				ping_release = true,
				action_one_softbutton_gamepad = true,
				ability_hold = true,
				previous_observer_target = true
			},
			replace_gamepad_action_names = {
				dodge_1 = "mission_objective_prologue_dodge",
				jump_1 = "mission_objective_prologue_jumping",
				ping = "lb_ping"
			},
			default_gamepad_actions_by_key = {
				ls = "move_controller",
				triangle = "wield_switch",
				options = "toggle_menu",
				touch = "ingame_player_list_toggle",
				rs = "look_raw_controller"
			}
		},
		left_handed = {
			ignore_gamepad_action_names = {
				action_inspect_release = true,
				dodge_2 = true,
				action_two_hold = true,
				next_observer_target = true,
				active_ability_left_pressed = true,
				active_ability_right_held = true,
				wield_switch_1 = true,
				action_one_release = true,
				interacting = true,
				action_three_release = true,
				action_three_hold = true,
				ghost_mode_exit = true,
				crouching = true,
				move_left_pressed = true,
				ability_release = true,
				ghost_mode_enter = true,
				action_two_release = true,
				emote_toggle_hud_visibility = true,
				action_one_mouse = true,
				social_wheel_page = true,
				emote_camera_zoom_in = true,
				emote_camera_zoom = true,
				wield_switch = true,
				active_ability_left_release = true,
				weapon_reload_hold_input = true,
				wield_switch_2 = true,
				active_ability_right_release = true,
				action_inspect_hold = true,
				active_ability_right_pressed = true,
				active_ability_left_held = true,
				action_one_hold = true,
				emote_camera_zoom_out = true,
				ping_release = true,
				action_one_softbutton_gamepad = true,
				ability_hold = true,
				previous_observer_target = true
			},
			replace_gamepad_action_names = {
				dodge_1 = "mission_objective_prologue_dodge",
				jump_1 = "mission_objective_prologue_jumping",
				ping = "lb_ping"
			},
			default_gamepad_actions_by_key = {
				ls = "look_raw_controller",
				triangle = "wield_switch",
				options = "toggle_menu",
				touch = "ingame_player_list_toggle",
				rs = "move_controller"
			}
		}
	}
end

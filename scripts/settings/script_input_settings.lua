ScriptInputSettings = {
	melee = {
		{
			name = "move_forward",
			start = math.random(1, 16),
			duration = math.random(1, 2)
		},
		{
			name = "move_forward",
			start = math.random(1, 16),
			duration = math.random(1, 2)
		},
		{
			name = "move_back",
			start = math.random(1, 16),
			duration = math.random(1, 2)
		},
		{
			name = "move_back",
			start = math.random(1, 16),
			duration = math.random(1, 2)
		},
		{
			name = "move_left",
			start = math.random(1, 16),
			duration = math.random(1, 2)
		},
		{
			name = "move_left",
			start = math.random(1, 16),
			duration = math.random(1, 2)
		},
		{
			name = "move_right",
			start = math.random(1, 16),
			duration = math.random(1, 2)
		},
		{
			name = "move_right",
			start = math.random(1, 16),
			duration = math.random(1, 2)
		},
		{
			name = "jump",
			start = math.random(1, 16)
		},
		{
			name = "jump",
			start = math.random(1, 16)
		},
		{
			name = "jump",
			start = math.random(1, 16)
		},
		{
			name = "jump",
			start = math.random(1, 16)
		},
		{
			name = "crouch",
			start = math.random(1, 16)
		},
		{
			name = "crouch",
			start = math.random(1, 16)
		},
		{
			name = "crouch",
			start = math.random(1, 16)
		},
		{
			name = "crouch",
			start = math.random(1, 16)
		},
		{
			name = "wield_shield",
			start = math.random(1, 16)
		},
		{
			name = "wield_shield",
			start = math.random(1, 16)
		},
		{
			name = "wield_dagger",
			start = math.random(1, 16)
		},
		{
			name = "wield_dagger",
			start = math.random(1, 16)
		},
		{
			name = "wield_one_handed_weapon",
			start = math.random(1, 16)
		},
		{
			name = "wield_one_handed_weapon",
			start = math.random(1, 16)
		},
		{
			name = "wield_two_handed_weapon",
			start = math.random(1, 16)
		},
		{
			name = "wield_two_handed_weapon",
			start = math.random(1, 16)
		},
		{
			duration = 1,
			start = 1,
			name = "melee_pose"
		},
		{
			start = 1,
			name = "look_raw",
			duration = 1,
			value = {
				-1,
				0,
				0
			}
		},
		{
			name = "melee_swing",
			start = 2
		},
		{
			duration = 1,
			start = 3,
			name = "melee_pose"
		},
		{
			start = 3,
			name = "look_raw",
			duration = 1,
			value = {
				1,
				0,
				0
			}
		},
		{
			name = "melee_swing",
			start = 4
		},
		{
			duration = 1,
			start = 5,
			name = "melee_pose"
		},
		{
			start = 5,
			name = "look_raw",
			duration = 1,
			value = {
				0,
				-1,
				0
			}
		},
		{
			name = "melee_swing",
			start = 6
		},
		{
			duration = 1,
			start = 7,
			name = "melee_pose"
		},
		{
			start = 7,
			name = "look_raw",
			duration = 1,
			value = {
				0,
				1,
				0
			}
		},
		{
			name = "melee_swing",
			start = 8
		},
		{
			duration = 1,
			start = 9,
			name = "block"
		},
		{
			start = 9,
			name = "look_raw",
			duration = 1,
			value = {
				-1,
				0,
				0
			}
		},
		{
			name = "lower_block",
			start = 10
		},
		{
			duration = 1,
			start = 11,
			name = "block"
		},
		{
			start = 11,
			name = "look_raw",
			duration = 1,
			value = {
				1,
				0,
				0
			}
		},
		{
			name = "lower_block",
			start = 12
		},
		{
			duration = 1,
			start = 13,
			name = "block"
		},
		{
			start = 13,
			name = "look_raw",
			duration = 1,
			value = {
				0,
				-1,
				0
			}
		},
		{
			name = "lower_block",
			start = 14
		},
		{
			duration = 1,
			start = 15,
			name = "block"
		},
		{
			start = 15,
			name = "look_raw",
			duration = 1,
			value = {
				0,
				1,
				0
			}
		},
		{
			name = "lower_block",
			start = 16
		}
	},
	archer = {
		{
			name = "move_forward",
			start = math.random(1, 16),
			duration = math.random(1, 2)
		},
		{
			name = "move_forward",
			start = math.random(1, 16),
			duration = math.random(1, 2)
		},
		{
			name = "move_back",
			start = math.random(1, 16),
			duration = math.random(1, 2)
		},
		{
			name = "move_back",
			start = math.random(1, 16),
			duration = math.random(1, 2)
		},
		{
			name = "move_left",
			start = math.random(1, 16),
			duration = math.random(1, 2)
		},
		{
			name = "move_left",
			start = math.random(1, 16),
			duration = math.random(1, 2)
		},
		{
			name = "move_right",
			start = math.random(1, 16),
			duration = math.random(1, 2)
		},
		{
			name = "move_right",
			start = math.random(1, 16),
			duration = math.random(1, 2)
		},
		{
			duration = 5,
			start = 1,
			name = "ranged_weapon_aim"
		},
		{
			name = "ranged_weapon_fire",
			start = 4.5
		},
		{
			duration = 5,
			start = 10,
			name = "ranged_weapon_aim"
		},
		{
			name = "ranged_weapon_fire",
			start = 14.5
		}
	},
	mounted_melee = {
		{
			name = "mount_cruise_control_gear_up",
			start = math.random(1, 16),
			duration = math.random(1, 2)
		},
		{
			name = "mount_cruise_control_gear_up",
			start = math.random(1, 16),
			duration = math.random(1, 2)
		},
		{
			name = "mount_cruise_control_gear_up",
			start = math.random(1, 16),
			duration = math.random(1, 2)
		},
		{
			name = "mount_cruise_control_gear_down",
			start = math.random(1, 16),
			duration = math.random(1, 2)
		},
		{
			name = "mount_cruise_control_gear_down",
			start = math.random(1, 16),
			duration = math.random(1, 2)
		},
		{
			name = "mount_cruise_control_gear_down",
			start = math.random(1, 16),
			duration = math.random(1, 2)
		},
		{
			name = "mount_move_forward",
			start = math.random(1, 16),
			duration = math.random(1, 2)
		},
		{
			name = "mount_move_forward",
			start = math.random(1, 16),
			duration = math.random(1, 2)
		},
		{
			name = "mount_move_back",
			start = math.random(1, 16),
			duration = math.random(1, 2)
		},
		{
			name = "mount_move_back",
			start = math.random(1, 16),
			duration = math.random(1, 2)
		},
		{
			name = "mount_move_left",
			start = math.random(1, 16),
			duration = math.random(1, 2)
		},
		{
			name = "mount_move_left",
			start = math.random(1, 16),
			duration = math.random(1, 2)
		},
		{
			name = "mount_move_right",
			start = math.random(1, 16),
			duration = math.random(1, 2)
		},
		{
			name = "mount_move_right",
			start = math.random(1, 16),
			duration = math.random(1, 2)
		},
		{
			name = "wield_shield",
			start = math.random(1, 16)
		},
		{
			name = "wield_shield",
			start = math.random(1, 16)
		},
		{
			name = "wield_dagger",
			start = math.random(1, 16)
		},
		{
			name = "wield_dagger",
			start = math.random(1, 16)
		},
		{
			name = "wield_one_handed_weapon",
			start = math.random(1, 16)
		},
		{
			name = "wield_one_handed_weapon",
			start = math.random(1, 16)
		},
		{
			name = "wield_two_handed_weapon",
			start = math.random(1, 16)
		},
		{
			name = "wield_two_handed_weapon",
			start = math.random(1, 16)
		},
		{
			duration = 1,
			start = 1,
			name = "melee_pose"
		},
		{
			start = 1,
			name = "look_raw",
			duration = 1,
			value = {
				-1,
				0,
				0
			}
		},
		{
			name = "melee_swing",
			start = 2
		},
		{
			duration = 1,
			start = 3,
			name = "melee_pose"
		},
		{
			start = 3,
			name = "look_raw",
			duration = 1,
			value = {
				1,
				0,
				0
			}
		},
		{
			name = "melee_swing",
			start = 4
		},
		{
			duration = 1,
			start = 5,
			name = "melee_pose"
		},
		{
			start = 5,
			name = "look_raw",
			duration = 1,
			value = {
				0,
				-1,
				0
			}
		},
		{
			name = "melee_swing",
			start = 6
		},
		{
			duration = 1,
			start = 7,
			name = "melee_pose"
		},
		{
			start = 7,
			name = "look_raw",
			duration = 1,
			value = {
				0,
				1,
				0
			}
		},
		{
			name = "melee_swing",
			start = 8
		},
		{
			duration = 1,
			start = 9,
			name = "block"
		},
		{
			start = 9,
			name = "look_raw",
			duration = 1,
			value = {
				-1,
				0,
				0
			}
		},
		{
			name = "lower_block",
			start = 10
		},
		{
			duration = 1,
			start = 11,
			name = "block"
		},
		{
			start = 11,
			name = "look_raw",
			duration = 1,
			value = {
				1,
				0,
				0
			}
		},
		{
			name = "lower_block",
			start = 12
		},
		{
			duration = 1,
			start = 13,
			name = "block"
		},
		{
			start = 13,
			name = "look_raw",
			duration = 1,
			value = {
				0,
				-1,
				0
			}
		},
		{
			name = "lower_block",
			start = 14
		},
		{
			duration = 1,
			start = 15,
			name = "block"
		},
		{
			start = 15,
			name = "look_raw",
			duration = 1,
			value = {
				0,
				1,
				0
			}
		},
		{
			name = "lower_block",
			start = 16
		}
	}
}

return

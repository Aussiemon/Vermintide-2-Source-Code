-- chunkname: @scripts/settings/script_input_settings.lua

ScriptInputSettings = {
	melee = {
		{
			name = "move_forward",
			start = math.random(1, 16),
			duration = math.random(1, 2),
		},
		{
			name = "move_forward",
			start = math.random(1, 16),
			duration = math.random(1, 2),
		},
		{
			name = "move_back",
			start = math.random(1, 16),
			duration = math.random(1, 2),
		},
		{
			name = "move_back",
			start = math.random(1, 16),
			duration = math.random(1, 2),
		},
		{
			name = "move_left",
			start = math.random(1, 16),
			duration = math.random(1, 2),
		},
		{
			name = "move_left",
			start = math.random(1, 16),
			duration = math.random(1, 2),
		},
		{
			name = "move_right",
			start = math.random(1, 16),
			duration = math.random(1, 2),
		},
		{
			name = "move_right",
			start = math.random(1, 16),
			duration = math.random(1, 2),
		},
		{
			name = "jump",
			start = math.random(1, 16),
		},
		{
			name = "jump",
			start = math.random(1, 16),
		},
		{
			name = "jump",
			start = math.random(1, 16),
		},
		{
			name = "jump",
			start = math.random(1, 16),
		},
		{
			name = "crouch",
			start = math.random(1, 16),
		},
		{
			name = "crouch",
			start = math.random(1, 16),
		},
		{
			name = "crouch",
			start = math.random(1, 16),
		},
		{
			name = "crouch",
			start = math.random(1, 16),
		},
		{
			name = "wield_shield",
			start = math.random(1, 16),
		},
		{
			name = "wield_shield",
			start = math.random(1, 16),
		},
		{
			name = "wield_dagger",
			start = math.random(1, 16),
		},
		{
			name = "wield_dagger",
			start = math.random(1, 16),
		},
		{
			name = "wield_one_handed_weapon",
			start = math.random(1, 16),
		},
		{
			name = "wield_one_handed_weapon",
			start = math.random(1, 16),
		},
		{
			name = "wield_two_handed_weapon",
			start = math.random(1, 16),
		},
		{
			name = "wield_two_handed_weapon",
			start = math.random(1, 16),
		},
		{
			duration = 1,
			name = "melee_pose",
			start = 1,
		},
		{
			duration = 1,
			name = "look_raw",
			start = 1,
			value = {
				-1,
				0,
				0,
			},
		},
		{
			name = "melee_swing",
			start = 2,
		},
		{
			duration = 1,
			name = "melee_pose",
			start = 3,
		},
		{
			duration = 1,
			name = "look_raw",
			start = 3,
			value = {
				1,
				0,
				0,
			},
		},
		{
			name = "melee_swing",
			start = 4,
		},
		{
			duration = 1,
			name = "melee_pose",
			start = 5,
		},
		{
			duration = 1,
			name = "look_raw",
			start = 5,
			value = {
				0,
				-1,
				0,
			},
		},
		{
			name = "melee_swing",
			start = 6,
		},
		{
			duration = 1,
			name = "melee_pose",
			start = 7,
		},
		{
			duration = 1,
			name = "look_raw",
			start = 7,
			value = {
				0,
				1,
				0,
			},
		},
		{
			name = "melee_swing",
			start = 8,
		},
		{
			duration = 1,
			name = "block",
			start = 9,
		},
		{
			duration = 1,
			name = "look_raw",
			start = 9,
			value = {
				-1,
				0,
				0,
			},
		},
		{
			name = "lower_block",
			start = 10,
		},
		{
			duration = 1,
			name = "block",
			start = 11,
		},
		{
			duration = 1,
			name = "look_raw",
			start = 11,
			value = {
				1,
				0,
				0,
			},
		},
		{
			name = "lower_block",
			start = 12,
		},
		{
			duration = 1,
			name = "block",
			start = 13,
		},
		{
			duration = 1,
			name = "look_raw",
			start = 13,
			value = {
				0,
				-1,
				0,
			},
		},
		{
			name = "lower_block",
			start = 14,
		},
		{
			duration = 1,
			name = "block",
			start = 15,
		},
		{
			duration = 1,
			name = "look_raw",
			start = 15,
			value = {
				0,
				1,
				0,
			},
		},
		{
			name = "lower_block",
			start = 16,
		},
	},
	archer = {
		{
			name = "move_forward",
			start = math.random(1, 16),
			duration = math.random(1, 2),
		},
		{
			name = "move_forward",
			start = math.random(1, 16),
			duration = math.random(1, 2),
		},
		{
			name = "move_back",
			start = math.random(1, 16),
			duration = math.random(1, 2),
		},
		{
			name = "move_back",
			start = math.random(1, 16),
			duration = math.random(1, 2),
		},
		{
			name = "move_left",
			start = math.random(1, 16),
			duration = math.random(1, 2),
		},
		{
			name = "move_left",
			start = math.random(1, 16),
			duration = math.random(1, 2),
		},
		{
			name = "move_right",
			start = math.random(1, 16),
			duration = math.random(1, 2),
		},
		{
			name = "move_right",
			start = math.random(1, 16),
			duration = math.random(1, 2),
		},
		{
			duration = 5,
			name = "ranged_weapon_aim",
			start = 1,
		},
		{
			name = "ranged_weapon_fire",
			start = 4.5,
		},
		{
			duration = 5,
			name = "ranged_weapon_aim",
			start = 10,
		},
		{
			name = "ranged_weapon_fire",
			start = 14.5,
		},
	},
	mounted_melee = {
		{
			name = "mount_cruise_control_gear_up",
			start = math.random(1, 16),
			duration = math.random(1, 2),
		},
		{
			name = "mount_cruise_control_gear_up",
			start = math.random(1, 16),
			duration = math.random(1, 2),
		},
		{
			name = "mount_cruise_control_gear_up",
			start = math.random(1, 16),
			duration = math.random(1, 2),
		},
		{
			name = "mount_cruise_control_gear_down",
			start = math.random(1, 16),
			duration = math.random(1, 2),
		},
		{
			name = "mount_cruise_control_gear_down",
			start = math.random(1, 16),
			duration = math.random(1, 2),
		},
		{
			name = "mount_cruise_control_gear_down",
			start = math.random(1, 16),
			duration = math.random(1, 2),
		},
		{
			name = "mount_move_forward",
			start = math.random(1, 16),
			duration = math.random(1, 2),
		},
		{
			name = "mount_move_forward",
			start = math.random(1, 16),
			duration = math.random(1, 2),
		},
		{
			name = "mount_move_back",
			start = math.random(1, 16),
			duration = math.random(1, 2),
		},
		{
			name = "mount_move_back",
			start = math.random(1, 16),
			duration = math.random(1, 2),
		},
		{
			name = "mount_move_left",
			start = math.random(1, 16),
			duration = math.random(1, 2),
		},
		{
			name = "mount_move_left",
			start = math.random(1, 16),
			duration = math.random(1, 2),
		},
		{
			name = "mount_move_right",
			start = math.random(1, 16),
			duration = math.random(1, 2),
		},
		{
			name = "mount_move_right",
			start = math.random(1, 16),
			duration = math.random(1, 2),
		},
		{
			name = "wield_shield",
			start = math.random(1, 16),
		},
		{
			name = "wield_shield",
			start = math.random(1, 16),
		},
		{
			name = "wield_dagger",
			start = math.random(1, 16),
		},
		{
			name = "wield_dagger",
			start = math.random(1, 16),
		},
		{
			name = "wield_one_handed_weapon",
			start = math.random(1, 16),
		},
		{
			name = "wield_one_handed_weapon",
			start = math.random(1, 16),
		},
		{
			name = "wield_two_handed_weapon",
			start = math.random(1, 16),
		},
		{
			name = "wield_two_handed_weapon",
			start = math.random(1, 16),
		},
		{
			duration = 1,
			name = "melee_pose",
			start = 1,
		},
		{
			duration = 1,
			name = "look_raw",
			start = 1,
			value = {
				-1,
				0,
				0,
			},
		},
		{
			name = "melee_swing",
			start = 2,
		},
		{
			duration = 1,
			name = "melee_pose",
			start = 3,
		},
		{
			duration = 1,
			name = "look_raw",
			start = 3,
			value = {
				1,
				0,
				0,
			},
		},
		{
			name = "melee_swing",
			start = 4,
		},
		{
			duration = 1,
			name = "melee_pose",
			start = 5,
		},
		{
			duration = 1,
			name = "look_raw",
			start = 5,
			value = {
				0,
				-1,
				0,
			},
		},
		{
			name = "melee_swing",
			start = 6,
		},
		{
			duration = 1,
			name = "melee_pose",
			start = 7,
		},
		{
			duration = 1,
			name = "look_raw",
			start = 7,
			value = {
				0,
				1,
				0,
			},
		},
		{
			name = "melee_swing",
			start = 8,
		},
		{
			duration = 1,
			name = "block",
			start = 9,
		},
		{
			duration = 1,
			name = "look_raw",
			start = 9,
			value = {
				-1,
				0,
				0,
			},
		},
		{
			name = "lower_block",
			start = 10,
		},
		{
			duration = 1,
			name = "block",
			start = 11,
		},
		{
			duration = 1,
			name = "look_raw",
			start = 11,
			value = {
				1,
				0,
				0,
			},
		},
		{
			name = "lower_block",
			start = 12,
		},
		{
			duration = 1,
			name = "block",
			start = 13,
		},
		{
			duration = 1,
			name = "look_raw",
			start = 13,
			value = {
				0,
				-1,
				0,
			},
		},
		{
			name = "lower_block",
			start = 14,
		},
		{
			duration = 1,
			name = "block",
			start = 15,
		},
		{
			duration = 1,
			name = "look_raw",
			start = 15,
			value = {
				0,
				1,
				0,
			},
		},
		{
			name = "lower_block",
			start = 16,
		},
	},
}

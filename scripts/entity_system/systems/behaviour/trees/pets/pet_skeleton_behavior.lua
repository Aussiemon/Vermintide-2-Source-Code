local ACTIONS_DEFAULT = BreedActions.pet_skeleton
local ACTIONS_ARMORED = BreedActions.pet_skeleton_armored
local ACTIONS_DUAL_WIELD = BreedActions.pet_skeleton_dual_wield
local ACTIONS_SHIELD = BreedActions.pet_skeleton_with_shield
local COMMAND_COMBAT = {
	"BTSelector",
	{
		"BTUtilityNode",
		{
			"BTMeleeOverlapAttackAction",
			leave_hook = "command_attack_done",
			name = "running_command_attack",
			condition = "ask_target_before_attacking",
			action_data = ACTIONS_ARMORED.running_command_attack
		},
		{
			"BTMeleeOverlapAttackAction",
			leave_hook = "command_attack_done",
			name = "command_attack",
			condition = "ask_target_before_attacking",
			action_data = ACTIONS_ARMORED.command_attack
		},
		{
			"BTClanRatFollowAction",
			name = "command_follow",
			condition = "has_target",
			action_data = ACTIONS_DEFAULT.command_follow
		},
		condition = "pet_skeleton_is_armored",
		name = "armored_command_combat"
	},
	{
		"BTUtilityNode",
		{
			"BTMeleeOverlapAttackAction",
			leave_hook = "command_attack_done",
			name = "running_command_attack",
			condition = "ask_target_before_attacking",
			action_data = ACTIONS_DEFAULT.running_command_attack
		},
		{
			"BTMeleeOverlapAttackAction",
			leave_hook = "command_attack_done",
			name = "command_attack",
			condition = "ask_target_before_attacking",
			action_data = ACTIONS_DUAL_WIELD.command_attack
		},
		{
			"BTClanRatFollowAction",
			name = "command_follow",
			condition = "has_target",
			action_data = ACTIONS_DEFAULT.command_follow
		},
		condition = "pet_skeleton_is_dual_wield",
		name = "dual_wield_command_combat"
	},
	{
		"BTUtilityNode",
		{
			"BTMeleeOverlapAttackAction",
			leave_hook = "command_attack_done",
			name = "running_command_attack",
			condition = "ask_target_before_attacking",
			action_data = ACTIONS_DEFAULT.running_command_attack
		},
		{
			"BTMeleeOverlapAttackAction",
			leave_hook = "command_attack_done",
			name = "command_attack",
			condition = "ask_target_before_attacking",
			action_data = ACTIONS_DEFAULT.command_attack
		},
		{
			"BTClanRatFollowAction",
			name = "command_follow",
			condition = "has_target",
			action_data = ACTIONS_DEFAULT.command_follow
		},
		condition = "pet_skeleton_has_shield",
		name = "shield_command_combat"
	},
	{
		"BTUtilityNode",
		{
			"BTMeleeOverlapAttackAction",
			leave_hook = "command_attack_done",
			name = "running_command_attack",
			condition = "ask_target_before_attacking",
			action_data = ACTIONS_DEFAULT.running_command_attack
		},
		{
			"BTMeleeOverlapAttackAction",
			leave_hook = "command_attack_done",
			name = "command_attack",
			condition = "ask_target_before_attacking",
			action_data = ACTIONS_DEFAULT.command_attack
		},
		{
			"BTClanRatFollowAction",
			name = "command_follow",
			condition = "has_target",
			action_data = ACTIONS_DEFAULT.command_follow
		},
		condition = "pet_skeleton_default",
		name = "default_command_combat"
	},
	condition = "has_command_attack",
	name = "command_combat"
}
local ARMORED_COMBAT = {
	"BTUtilityNode",
	{
		"BTMeleeOverlapAttackAction",
		name = "running_sweep_attack",
		condition = "ask_target_before_attacking",
		action_data = ACTIONS_ARMORED.running_sweep_attack
	},
	{
		"BTRandom",
		{
			"BTMeleeOverlapAttackAction",
			weight = 1,
			name = "running_special_attack_sweep",
			condition = "ask_target_before_attacking",
			action_data = ACTIONS_ARMORED.moving_special_attack_sweep
		},
		{
			"BTMeleeOverlapAttackAction",
			weight = 1,
			name = "running_special_attack_cleave",
			condition = "ask_target_before_attacking",
			action_data = ACTIONS_ARMORED.moving_special_attack_cleave
		},
		name = "moving_attack",
		action_data = ACTIONS_ARMORED.moving_attack
	},
	{
		"BTRandom",
		{
			"BTMeleeOverlapAttackAction",
			weight = 1,
			name = "special_attack_sweep",
			condition = "ask_target_before_attacking",
			action_data = ACTIONS_ARMORED.special_attack_sweep
		},
		{
			"BTMeleeOverlapAttackAction",
			weight = 1,
			name = "special_attack_cleave",
			condition = "ask_target_before_attacking",
			action_data = ACTIONS_ARMORED.special_attack_cleave
		},
		name = "special_attack",
		action_data = ACTIONS_ARMORED.special_attack
	},
	{
		"BTStormVerminPushAction",
		name = "push_attack",
		action_data = ACTIONS_ARMORED.push_attack
	},
	{
		"BTMoveToGoalAction",
		enter_hook = "start_stand_ground",
		name = "hold_position",
		condition = "wants_stand_ground",
		action_data = ACTIONS_DEFAULT.follow
	},
	{
		"BTClanRatFollowAction",
		name = "follow",
		condition = "has_target",
		action_data = ACTIONS_DEFAULT.follow
	},
	name = "armored_combat",
	condition = "pet_skeleton_is_armored",
	action_data = ACTIONS_DEFAULT.utility_action
}
local DUAL_WIELD_COMBAT = {
	"BTUtilityNode",
	{
		"BTMeleeOverlapAttackAction",
		name = "running_sweep_attack",
		condition = "ask_target_before_attacking",
		action_data = ACTIONS_DEFAULT.running_sweep_attack
	},
	{
		"BTMeleeOverlapAttackAction",
		name = "sweep_attack",
		condition = "ask_target_before_attacking",
		action_data = ACTIONS_DUAL_WIELD.sweep_attack
	},
	{
		"BTMoveToGoalAction",
		enter_hook = "start_stand_ground",
		name = "hold_position",
		condition = "wants_stand_ground",
		action_data = ACTIONS_DEFAULT.follow
	},
	{
		"BTClanRatFollowAction",
		name = "follow",
		condition = "has_target",
		action_data = ACTIONS_DEFAULT.follow
	},
	name = "dual_wield_combat",
	condition = "pet_skeleton_is_dual_wield",
	action_data = ACTIONS_DEFAULT.utility_action
}
local SHIELD_COMBAT = {
	"BTUtilityNode",
	{
		"BTMeleeOverlapAttackAction",
		name = "running_sweep_attack",
		condition = "ask_target_before_attacking",
		action_data = ACTIONS_DEFAULT.running_sweep_attack
	},
	{
		"BTRandom",
		{
			"BTMeleeOverlapAttackAction",
			weight = 10,
			name = "sweep_attack",
			condition = "ask_target_before_attacking",
			action_data = ACTIONS_DEFAULT.sweep_attack
		},
		{
			"BTMeleeOverlapAttackAction",
			weight = 1,
			name = "shield_bash",
			condition = "ask_target_before_attacking",
			action_data = ACTIONS_SHIELD.shield_bash
		},
		name = "special_attack",
		action_data = ACTIONS_SHIELD.special_attack
	},
	{
		"BTCombatShoutAction",
		name = "combat_shout",
		action_data = ACTIONS_SHIELD.combat_shout
	},
	{
		"BTMoveToGoalAction",
		enter_hook = "start_stand_ground",
		name = "hold_position",
		condition = "wants_stand_ground",
		action_data = ACTIONS_DEFAULT.follow
	},
	{
		"BTClanRatFollowAction",
		name = "follow",
		condition = "has_target",
		action_data = ACTIONS_DEFAULT.follow
	},
	name = "shield_combat",
	condition = "pet_skeleton_has_shield",
	action_data = ACTIONS_DEFAULT.utility_action
}
local DEFAULT_COMBAT = {
	"BTUtilityNode",
	{
		"BTMeleeOverlapAttackAction",
		name = "running_sweep_attack",
		condition = "ask_target_before_attacking",
		action_data = ACTIONS_DEFAULT.running_sweep_attack
	},
	{
		"BTMeleeOverlapAttackAction",
		name = "sweep_attack",
		condition = "ask_target_before_attacking",
		action_data = ACTIONS_DEFAULT.sweep_attack
	},
	{
		"BTMoveToGoalAction",
		enter_hook = "start_stand_ground",
		name = "hold_position",
		condition = "wants_stand_ground",
		action_data = ACTIONS_DEFAULT.follow
	},
	{
		"BTClanRatFollowAction",
		name = "follow",
		condition = "has_target",
		action_data = ACTIONS_DEFAULT.follow
	},
	name = "default_combat",
	condition = "pet_skeleton_default",
	action_data = ACTIONS_DEFAULT.utility_action
}
BreedBehaviors.pet_skeleton = {
	"BTSelector",
	{
		"BTSpawningAction",
		enter_hook = "to_combat",
		name = "spawn",
		condition = "spawn",
		action_data = ACTIONS_DEFAULT.spawn
	},
	{
		"BTTransportedAction",
		condition = "is_transported",
		name = "transported_idle"
	},
	{
		"BTInVortexAction",
		condition = "in_vortex",
		name = "in_vortex"
	},
	{
		"BTFallAction",
		condition = "is_falling",
		name = "falling"
	},
	{
		"BTStaggerAction",
		name = "stagger",
		condition = "stagger",
		action_data = ACTIONS_DEFAULT.stagger
	},
	{
		"BTBlockedAction",
		name = "blocked",
		condition = "blocked",
		action_data = ACTIONS_DEFAULT.blocked
	},
	{
		"BTSelector",
		{
			"BTTeleportAction",
			condition = "at_teleport_smartobject",
			name = "teleport"
		},
		{
			"BTClimbAction",
			condition = "at_climb_smartobject",
			name = "climb"
		},
		{
			"BTJumpAcrossAction",
			condition = "at_jump_smartobject",
			name = "jump_across"
		},
		{
			"BTSmashDoorAction",
			name = "smash_door",
			condition = "at_door_smartobject",
			action_data = ACTIONS_DEFAULT.smash_door
		},
		condition = "at_smartobject",
		name = "smartobject"
	},
	{
		"BTTeleportToCommanderAction",
		condition = "should_teleport_to_commander",
		name = "teleport_out_of_range"
	},
	{
		"BTSelector",
		{
			"BTIdleAction",
			name = "commander_disabled_idle",
			leave_hook = "start_disabled_resume_timer",
			condition = "commander_disabled",
			enter_hook = "disable_perception",
			action_data = ACTIONS_DEFAULT.commander_disabled
		},
		{
			"BTFallbackIdleAction",
			name = "commander_disabled_idle_resume",
			leave_hook = "enable_perception",
			action_data = ACTIONS_DEFAULT.commander_disabled_resume
		},
		name = "commander_disabled",
		condition = "commander_disabled_or_resuming",
		action_data = ACTIONS_DEFAULT.utility_action
	},
	{
		"BTChargeAttackAction",
		leave_hook = "remove_charge_target",
		name = "ability_charge_attack",
		condition = "has_charge_target",
		action_data = ACTIONS_ARMORED.ability_charge
	},
	{
		"BTSelector",
		COMMAND_COMBAT,
		ARMORED_COMBAT,
		DUAL_WIELD_COMBAT,
		SHIELD_COMBAT,
		DEFAULT_COMBAT,
		{
			"BTCombatIdleAction",
			name = "idle",
			action_data = ACTIONS_DEFAULT.idle
		},
		condition = "confirmed_enemy_sighting_within_commander_sticky",
		name = "in_combat"
	},
	{
		"BTSelector",
		{
			"BTMoveToGoalAction",
			name = "hold_position",
			condition = "has_goal_destination",
			action_data = ACTIONS_DEFAULT.follow
		},
		{
			"BTFallbackIdleAction",
			name = "fallback_idle",
			action_data = ACTIONS_DEFAULT.fallback_idle
		},
		name = "stand_ground",
		condition = "wants_stand_ground",
		enter_hook = "start_stand_ground"
	},
	{
		"BTSelector",
		{
			"BTMoveToGoalAction",
			name = "hold_position",
			condition = "has_goal_destination",
			action_data = ACTIONS_DEFAULT.follow
		},
		{
			"BTFallbackIdleAction",
			name = "fallback_idle",
			action_data = ACTIONS_DEFAULT.fallback_idle
		},
		name = "follow",
		leave_hook = "stop_follow_commander",
		enter_hook = "start_follow_commander"
	},
	name = "pet_skeleton"
}

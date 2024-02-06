-- chunkname: @scripts/entity_system/systems/behaviour/trees/undead/ethereal_skeleton_with_hammer_behavior.lua

local ACTIONS = BreedActions.ethereal_skeleton_with_hammer
local COMBAT = {
	"BTUtilityNode",
	{
		"BTClanRatFollowAction",
		name = "follow",
		action_data = ACTIONS.follow,
	},
	{
		"BTStormVerminAttackAction",
		condition = "ask_target_before_attacking",
		name = "running_attack",
		action_data = ACTIONS.running_attack,
	},
	{
		"BTRandom",
		action_data = ACTIONS.moving_attack,
		{
			"BTStormVerminAttackAction",
			condition = "ask_target_before_attacking",
			name = "running_special_attack_sweep",
			weight = 1,
			action_data = ACTIONS.special_attack_sweep,
		},
		{
			"BTStormVerminAttackAction",
			condition = "ask_target_before_attacking",
			name = "running_special_attack_cleave",
			weight = 1,
			action_data = ACTIONS.special_attack_cleave,
		},
		name = "moving_attack",
	},
	{
		"BTRandom",
		action_data = ACTIONS.special_attack,
		{
			"BTStormVerminAttackAction",
			condition = "ask_target_before_attacking",
			name = "special_attack_cleave",
			weight = 1,
			action_data = ACTIONS.special_attack_cleave,
		},
		{
			"BTStormVerminAttackAction",
			condition = "ask_target_before_attacking",
			name = "special_attack_sweep",
			weight = 1,
			action_data = ACTIONS.special_attack_sweep,
		},
		name = "special_attack",
	},
	{
		"BTStormVerminPushAction",
		name = "push_attack",
		action_data = ACTIONS.push_attack,
	},
	condition = "confirmed_player_sighting",
	name = "in_combat",
}
local SMART_OBJECT = {
	"BTSelector",
	{
		"BTTeleportAction",
		condition = "at_teleport_smartobject",
		name = "teleport",
	},
	{
		"BTClimbAction",
		condition = "at_climb_smartobject",
		name = "climb",
	},
	{
		"BTJumpAcrossAction",
		condition = "at_jump_smartobject",
		name = "jump_across",
	},
	{
		"BTSmashDoorAction",
		condition = "at_door_smartobject",
		name = "smash_door",
		action_data = ACTIONS.smash_door,
	},
	condition = "at_smartobject",
	name = "smartobject",
}

BreedBehaviors.ethereal_skeleton_with_hammer = {
	"BTSelector",
	{
		"BTSpawningAction",
		condition = "spawn",
		name = "spawn",
	},
	{
		"BTInVortexAction",
		condition = "in_vortex",
		name = "in_vortex",
	},
	{
		"BTFallAction",
		condition = "is_falling",
		name = "falling",
	},
	{
		"BTStaggerAction",
		condition = "stagger",
		name = "stagger",
		action_data = ACTIONS.stagger,
	},
	{
		"BTBlockedAction",
		condition = "blocked",
		name = "blocked",
		action_data = ACTIONS.blocked,
	},
	SMART_OBJECT,
	COMBAT,
	{
		"BTAlertedAction",
		condition = "player_spotted",
		name = "alerted",
		action_data = ACTIONS.alerted,
	},
	{
		"BTMoveToGoalAction",
		condition = "has_goal_destination",
		name = "move_to_goal",
		action_data = ACTIONS.follow,
	},
	{
		"BTIdleAction",
		condition = "no_target",
		name = "idle",
	},
	{
		"BTFallbackIdleAction",
		name = "fallback_idle",
	},
	name = "horde",
}

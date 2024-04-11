-- chunkname: @scripts/entity_system/systems/behaviour/trees/chaos/chaos_bulwark_behavior.lua

local ACTIONS = BreedActions.chaos_bulwark

BreedBehaviors.chaos_bulwark = {
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
		condition = "stagger_activated",
		leave_hook = "bulwark_stagger_leave",
		name = "stagger",
		action_data = ACTIONS.stagger,
	},
	{
		"BTBlockedAction",
		condition = "blocked",
		name = "blocked",
		action_data = ACTIONS.blocked,
	},
	{
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
			"BTSmashDoorAction",
			condition = "at_door_smartobject",
			name = "smash_door",
			action_data = ACTIONS.smash_door,
		},
		{
			"BTJumpAcrossAction",
			condition = "at_jump_smartobject",
			name = "jump_across",
		},
		condition = "at_smartobject",
		name = "smartobject",
	},
	{
		"BTUtilityNode",
		{
			"BTTargetRageAction",
			name = "target_changed",
			action_data = ACTIONS.target_changed,
		},
		{
			"BTStormVerminAttackAction",
			condition = "ask_target_before_attacking",
			name = "special_attack_quick",
			action_data = ACTIONS.special_attack_quick,
		},
		{
			"BTMeleeOverlapAttackAction",
			condition = "ask_target_before_attacking",
			name = "running_attack_charging",
			action_data = ACTIONS.running_attack_charging,
		},
		{
			"BTMeleeOverlapAttackAction",
			condition = "ask_target_before_attacking",
			name = "running_attack_right",
			action_data = ACTIONS.running_attack_right,
		},
		{
			"BTStormVerminAttackAction",
			condition = "ask_target_before_attacking",
			name = "special_attack_sweep",
			action_data = ACTIONS.special_attack_sweep,
		},
		{
			"BTStormVerminAttackAction",
			condition = "ask_target_before_attacking",
			name = "special_attack_launch",
			action_data = ACTIONS.special_attack_launch,
		},
		{
			"BTBulwarkFollowAction",
			name = "follow",
			action_data = ACTIONS.follow,
		},
		condition = "confirmed_player_sighting",
		name = "in_combat",
	},
	{
		"BTAlertedAction",
		condition = "player_spotted",
		name = "alerted",
		action_data = ACTIONS.alerted,
	},
	{
		"BTMoveToGoalAction",
		condition = "has_goal_destination",
		leave_hook = "remove_goal_destination",
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

-- chunkname: @scripts/entity_system/systems/behaviour/trees/chaos/chaos_marauder_behavior.lua

local ACTIONS = BreedActions.chaos_marauder

BreedBehaviors.marauder = {
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
			action_data = ACTIONS.climb,
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
	},
	{
		"BTHesitateAction",
		condition = "is_alerted",
		name = "hesitate",
		action_data = ACTIONS.alerted,
	},
	{
		"BTUtilityNode",
		action_data = ACTIONS.utility_action,
		{
			"BTCombatStepAction",
			name = "combat_step",
			action_data = ACTIONS.combat_step,
		},
		{
			"BTClanRatFollowAction",
			name = "follow",
			action_data = ACTIONS.follow,
		},
		{
			"BTAttackAction",
			condition = "ask_target_before_attacking",
			name = "running_attack",
			action_data = ACTIONS.running_attack,
		},
		{
			"BTAttackAction",
			condition = "ask_target_before_attacking",
			name = "normal_attack",
			action_data = ACTIONS.normal_attack,
		},
		{
			"BTCombatShoutAction",
			name = "combat_shout",
			action_data = ACTIONS.combat_shout,
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
		name = "move_to_goal",
		action_data = ACTIONS.follow,
	},
	{
		"BTIdleAction",
		condition = "no_target",
		name = "idle",
		action_data = ACTIONS.idle,
	},
	{
		"BTFallbackIdleAction",
		name = "fallback_idle",
		action_data = ACTIONS.fallback_idle,
	},
	name = "marauder",
}
BreedBehaviors.marauder_tutorial = {
	"BTSelector",
	{
		"BTSpawningAction",
		condition = "spawn",
		name = "spawn",
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
			action_data = ACTIONS.climb,
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
	},
	{
		"BTHesitateAction",
		condition = "is_alerted",
		name = "hesitate",
		action_data = ACTIONS.alerted,
	},
	{
		"BTUtilityNode",
		action_data = ACTIONS.utility_action,
		{
			"BTClanRatFollowAction",
			name = "follow",
			action_data = ACTIONS.follow,
		},
		{
			"BTAttackAction",
			condition = "ask_target_before_attacking",
			name = "tutorial_attack",
			action_data = ACTIONS.tutorial_attack,
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
		name = "move_to_goal",
		action_data = ACTIONS.follow,
	},
	{
		"BTIdleAction",
		condition = "no_target",
		name = "idle",
		action_data = ACTIONS.idle,
	},
	{
		"BTFallbackIdleAction",
		name = "fallback_idle",
		action_data = ACTIONS.fallback_idle,
	},
	name = "marauder_tutorial",
}

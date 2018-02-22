local ACTIONS = BreedActions.chaos_marauder
BreedBehaviors.marauder = {
	"BTSelector",
	{
		"BTSpawningAction",
		condition = "spawn",
		name = "spawn"
	},
	{
		"BTInVortexAction",
		condition = "in_vortex",
		name = "in_vortex"
	},
	{
		"BTInGravityWellAction",
		condition = "in_gravity_well",
		name = "in_gravity_well"
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
		action_data = ACTIONS.stagger
	},
	{
		"BTBlockedAction",
		name = "blocked",
		condition = "blocked",
		action_data = ACTIONS.blocked
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
			name = "climb",
			condition = "at_climb_smartobject",
			action_data = ACTIONS.climb
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
			action_data = ACTIONS.smash_door
		},
		condition = "at_smartobject",
		name = "smartobject"
	},
	{
		"BTHesitateAction",
		name = "hesitate",
		condition = "is_alerted",
		action_data = ACTIONS.alerted
	},
	{
		"BTUtilityNode",
		{
			"BTCombatStepAction",
			name = "combat_step",
			action_data = ACTIONS.combat_step
		},
		{
			"BTClanRatFollowAction",
			name = "follow",
			action_data = ACTIONS.follow
		},
		{
			"BTAttackAction",
			name = "running_attack",
			condition = "ask_target_before_attacking",
			action_data = ACTIONS.running_attack
		},
		{
			"BTAttackAction",
			name = "normal_attack",
			condition = "ask_target_before_attacking",
			action_data = ACTIONS.normal_attack
		},
		name = "in_combat",
		condition = "confirmed_player_sighting",
		action_data = ACTIONS.utility_action
	},
	{
		"BTAlertedAction",
		name = "alerted",
		condition = "player_spotted",
		action_data = ACTIONS.alerted
	},
	{
		"BTMoveToGoalAction",
		name = "move_to_goal",
		condition = "has_goal_destination",
		action_data = ACTIONS.follow
	},
	{
		"BTIdleAction",
		name = "idle",
		condition = "no_target",
		action_data = ACTIONS.idle
	},
	{
		"BTFallbackIdleAction",
		name = "fallback_idle",
		action_data = ACTIONS.fallback_idle
	},
	name = "marauder"
}
BreedBehaviors.marauder_tutorial = {
	"BTSelector",
	{
		"BTSpawningAction",
		condition = "spawn",
		name = "spawn"
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
		action_data = ACTIONS.stagger
	},
	{
		"BTBlockedAction",
		name = "blocked",
		condition = "blocked",
		action_data = ACTIONS.blocked
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
			name = "climb",
			condition = "at_climb_smartobject",
			action_data = ACTIONS.climb
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
			action_data = ACTIONS.smash_door
		},
		condition = "at_smartobject",
		name = "smartobject"
	},
	{
		"BTHesitateAction",
		name = "hesitate",
		condition = "is_alerted",
		action_data = ACTIONS.alerted
	},
	{
		"BTUtilityNode",
		{
			"BTClanRatFollowAction",
			name = "follow",
			action_data = ACTIONS.follow
		},
		{
			"BTAttackAction",
			name = "tutorial_attack",
			condition = "ask_target_before_attacking",
			action_data = ACTIONS.tutorial_attack
		},
		name = "in_combat",
		condition = "confirmed_player_sighting",
		action_data = ACTIONS.utility_action
	},
	{
		"BTAlertedAction",
		name = "alerted",
		condition = "player_spotted",
		action_data = ACTIONS.alerted
	},
	{
		"BTMoveToGoalAction",
		name = "move_to_goal",
		condition = "has_goal_destination",
		action_data = ACTIONS.follow
	},
	{
		"BTIdleAction",
		name = "idle",
		condition = "no_target",
		action_data = ACTIONS.idle
	},
	{
		"BTFallbackIdleAction",
		name = "fallback_idle",
		action_data = ACTIONS.fallback_idle
	},
	name = "marauder_tutorial"
}

return 

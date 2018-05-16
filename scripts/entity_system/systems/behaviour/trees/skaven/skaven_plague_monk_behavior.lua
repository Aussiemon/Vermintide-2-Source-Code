local ACTIONS = BreedActions.skaven_plague_monk
BreedBehaviors.plague_monk = {
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
			"BTComboAttackAction",
			name = "frenzy_attack_ranged",
			action_data = ACTIONS.frenzy_attack_ranged
		},
		{
			"BTComboAttackAction",
			name = "frenzy_attack",
			action_data = ACTIONS.frenzy_attack
		},
		{
			"BTAttackAction",
			name = "normal_attack",
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
		condition = "no_target",
		name = "idle"
	},
	{
		"BTFallbackIdleAction",
		name = "fallback_idle"
	},
	name = "plague_monk"
}

return

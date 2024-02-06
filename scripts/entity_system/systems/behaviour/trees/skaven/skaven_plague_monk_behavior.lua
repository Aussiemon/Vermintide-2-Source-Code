-- chunkname: @scripts/entity_system/systems/behaviour/trees/skaven/skaven_plague_monk_behavior.lua

local ACTIONS = BreedActions.skaven_plague_monk

BreedBehaviors.plague_monk = {
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
			"BTComboAttackAction",
			condition = "ask_target_before_attacking",
			name = "frenzy_attack_ranged",
			action_data = ACTIONS.frenzy_attack_ranged,
		},
		{
			"BTComboAttackAction",
			condition = "ask_target_before_attacking",
			name = "frenzy_attack",
			action_data = ACTIONS.frenzy_attack,
		},
		{
			"BTAttackAction",
			condition = "ask_target_before_attacking",
			name = "normal_attack",
			action_data = ACTIONS.normal_attack,
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
	},
	{
		"BTFallbackIdleAction",
		name = "fallback_idle",
	},
	name = "plague_monk",
}

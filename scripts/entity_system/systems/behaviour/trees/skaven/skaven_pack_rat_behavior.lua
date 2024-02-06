-- chunkname: @scripts/entity_system/systems/behaviour/trees/skaven/skaven_pack_rat_behavior.lua

local ACTIONS = BreedActions.skaven_clan_rat

BreedBehaviors.pack_rat = {
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
		"BTSequence",
		{
			"BTInterestPointChooseAction",
			name = "interest_point_choose",
			action_data = ACTIONS.interest_point_choose,
		},
		{
			"BTInterestPointApproachAction",
			name = "interest_point_approach",
		},
		{
			"BTInterestPointUseAction",
			name = "interest_point_use",
			action_data = ACTIONS.interest_point_choose,
		},
		condition = "should_use_interest_point",
		name = "interest_point",
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
	},
	name = "pack",
}

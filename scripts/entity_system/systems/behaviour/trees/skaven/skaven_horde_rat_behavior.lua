-- chunkname: @scripts/entity_system/systems/behaviour/trees/skaven/skaven_horde_rat_behavior.lua

local ACTIONS = BreedActions.skaven_clan_rat

BreedBehaviors.horde_rat = {
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
		"BTUtilityNode",
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
		condition = "can_see_player",
		name = "in_combat",
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

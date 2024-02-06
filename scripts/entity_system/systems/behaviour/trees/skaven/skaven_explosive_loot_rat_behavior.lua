-- chunkname: @scripts/entity_system/systems/behaviour/trees/skaven/skaven_explosive_loot_rat_behavior.lua

local ACTIONS = BreedActions.skaven_explosive_loot_rat
local EXPLOSIVE_LOOT_RAT_BEHAVIOR = {
	"BTUtilityNode",
	action_data = ACTIONS.utility_action,
	{
		"BTClanRatFollowAction",
		name = "follow",
		action_data = ACTIONS.follow,
	},
	{
		"BTZombieExplodeAction",
		name = "explosion_attack",
		action_data = ACTIONS.explosion_attack,
	},
	condition = "can_see_player",
	name = "in_combat",
}

BreedBehaviors.explosive_loot_rat = {
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
	EXPLOSIVE_LOOT_RAT_BEHAVIOR,
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
	name = "horde",
}

-- chunkname: @scripts/entity_system/systems/behaviour/trees/skaven/skaven_loot_rat_behavior.lua

local ACTIONS = BreedActions.skaven_loot_rat

BreedBehaviors.loot_rat = {
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
		condition = "loot_rat_stagger",
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
	{
		"BTLootRatDodgeAction",
		condition = "loot_rat_dodge",
		name = "dodge",
		action_data = ACTIONS.dodge,
	},
	{
		"BTLootRatFleeAction",
		condition = "loot_rat_flee",
		name = "flee",
		action_data = ACTIONS.flee,
	},
	{
		"BTLootRatAlertedAction",
		condition = "can_see_player",
		name = "alerted",
	},
	{
		"BTIdleAction",
		name = "idle",
		action_data = ACTIONS.idle,
	},
	name = "horde",
}

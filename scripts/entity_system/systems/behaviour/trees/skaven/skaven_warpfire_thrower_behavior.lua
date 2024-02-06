-- chunkname: @scripts/entity_system/systems/behaviour/trees/skaven/skaven_warpfire_thrower_behavior.lua

local ACTIONS = BreedActions.skaven_warpfire_thrower

BreedBehaviors.skaven_warpfire_thrower = {
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
	{
		"BTSequence",
		{
			"BTPackMasterSkulkAroundAction",
			condition = "path_found",
			name = "skulk",
			action_data = ACTIONS.skulk,
		},
		{
			"BTPackMasterFollowAction",
			condition = "path_found",
			name = "follow",
			action_data = ACTIONS.follow,
		},
		{
			"BTWarpfireThrowerShootAction",
			name = "shoot_warpfire_thrower",
			action_data = ACTIONS.shoot_warpfire_thrower,
		},
		condition = "can_see_player",
		name = "enemy_spotted",
	},
	{
		"BTTriggerMoveToAction",
		condition = "can_trigger_move_to",
		name = "trigger_move_to",
	},
	{
		"BTIdleAction",
		name = "idle",
	},
	name = "skaven_warpfire_thrower",
}

local ACTIONS = BreedActions.skaven_warpfire_thrower
BreedBehaviors.skaven_warpfire_thrower = {
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
		"BTSelector",
		{
			"BTTeleportAction",
			condition = "at_teleport_smartobject",
			name = "teleport"
		},
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
		"BTSequence",
		{
			"BTPackMasterSkulkAroundAction",
			name = "skulk",
			condition = "path_found",
			action_data = ACTIONS.skulk
		},
		{
			"BTPackMasterFollowAction",
			name = "follow",
			condition = "path_found",
			action_data = ACTIONS.follow
		},
		{
			"BTWarpfireThrowerShootAction",
			name = "shoot_warpfire_thrower",
			action_data = ACTIONS.shoot_warpfire_thrower
		},
		condition = "can_see_player",
		name = "enemy_spotted"
	},
	{
		"BTTriggerMoveToAction",
		condition = "can_trigger_move_to",
		name = "trigger_move_to"
	},
	{
		"BTIdleAction",
		name = "idle"
	},
	name = "skaven_warpfire_thrower"
}

return 

local ACTIONS = BreedActions.skaven_pack_master
BreedBehaviors.pack_master = {
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
		"BTPackMasterGetHookAction",
		condition = "pack_master_needs_hook",
		name = "get_new_hook"
	},
	{
		"BTSequence",
		{
			"BTPackMasterSkulkAroundAction",
			name = "skulking",
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
			"BTPackMasterAttackAction",
			name = "attack",
			action_data = ACTIONS.grab_attack
		},
		{
			"BTPackMasterInitialPullAction",
			name = "pull",
			action_data = ACTIONS.initial_pull
		},
		{
			"BTPackMasterDragAction",
			name = "drag",
			action_data = ACTIONS.drag
		},
		{
			"BTPackMasterHoistAction",
			name = "hoist",
			action_data = ACTIONS.hoist
		},
		condition = "can_see_player",
		name = "enemy_spotted"
	},
	{
		"BTPackMasterEscortRatOgreAction",
		condition = "escorting_rat_ogre",
		name = "escorting_ogre"
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
	name = "pack_master"
}

return

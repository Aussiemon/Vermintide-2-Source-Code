local ACTIONS = BreedActions.skaven_loot_rat
local EXPLOSIVE_LOOT_RAT_BEHAVIOR = {
	"BTSequence",
	{
		"BTPackMasterFollowAction",
		name = "follow",
		action_data = ACTIONS.follow
	},
	{
		"BTZombieExplodeAction",
		name = "explosion_attack",
		action_data = ACTIONS.explosion_attack
	},
	condition = "explosive_loot_rat_combat",
	name = "in_combat"
}
BreedBehaviors.loot_rat = {
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
		condition = "loot_rat_stagger",
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
	EXPLOSIVE_LOOT_RAT_BEHAVIOR,
	{
		"BTLootRatDodgeAction",
		name = "dodge",
		condition = "loot_rat_dodge",
		action_data = ACTIONS.dodge
	},
	{
		"BTLootRatFleeAction",
		name = "flee",
		condition = "loot_rat_flee",
		action_data = ACTIONS.flee
	},
	{
		"BTLootRatAlertedAction",
		condition = "can_see_player",
		name = "alerted"
	},
	{
		"BTIdleAction",
		name = "idle",
		action_data = ACTIONS.idle
	},
	name = "horde"
}

return

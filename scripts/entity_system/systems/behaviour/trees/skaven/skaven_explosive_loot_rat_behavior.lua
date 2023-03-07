local ACTIONS = BreedActions.skaven_explosive_loot_rat
local EXPLOSIVE_LOOT_RAT_BEHAVIOR = {
	"BTUtilityNode",
	{
		"BTClanRatFollowAction",
		name = "follow",
		action_data = ACTIONS.follow
	},
	{
		"BTZombieExplodeAction",
		name = "explosion_attack",
		action_data = ACTIONS.explosion_attack
	},
	name = "in_combat",
	condition = "can_see_player",
	action_data = ACTIONS.utility_action
}
BreedBehaviors.explosive_loot_rat = {
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
	EXPLOSIVE_LOOT_RAT_BEHAVIOR,
	{
		"BTIdleAction",
		name = "idle",
		condition = "no_target",
		action_data = ACTIONS.idle
	},
	{
		"BTFallbackIdleAction",
		name = "fallback_idle"
	},
	name = "horde"
}

-- chunkname: @scripts/entity_system/systems/behaviour/trees/chaos/chaos_zombie_behavior.lua

local ACTIONS = BreedActions.chaos_zombie

BreedBehaviors.chaos_zombie = {
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
			"BTZombieExplodeAction",
			condition = "at_door_smartobject",
			name = "explosion_attack",
			action_data = ACTIONS.explosion_attack,
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
			"BTZombieExplodeAction",
			name = "explosion_attack",
			action_data = ACTIONS.explosion_attack,
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
		"BTIdleAction",
		condition = "no_target",
		name = "idle",
		action_data = ACTIONS.idle,
	},
	{
		"BTFallbackIdleAction",
		name = "fallback_idle",
		action_data = ACTIONS.fallback_idle,
	},
	name = "chaos_zombie",
}

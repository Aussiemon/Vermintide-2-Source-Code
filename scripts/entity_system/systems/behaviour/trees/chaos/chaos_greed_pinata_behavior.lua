-- chunkname: @scripts/entity_system/systems/behaviour/trees/chaos/chaos_greed_pinata_behavior.lua

local ACTIONS = BreedActions.chaos_greed_pinata

BreedBehaviors.chaos_greed_pinata = {
	"BTSelector",
	{
		"BTSpawningAction",
		condition = "spawn",
		name = "spawn",
	},
	{
		"BTSelector",
		{
			"BTTeleportAction",
			condition = "at_teleport_smartobject",
			name = "teleport",
			action_data = ACTIONS.teleport,
		},
		{
			"BTChaosSorcererTeleportAction",
			condition = "at_climb_smartobject",
			name = "climb_teleport",
			action_data = ACTIONS.teleport,
		},
		{
			"BTChaosSorcererTeleportAction",
			condition = "at_jump_smartobject",
			name = "jump_teleport",
			action_data = ACTIONS.teleport,
		},
		{
			"BTChaosSorcererTeleportAction",
			condition = "at_door_smartobject",
			name = "door_teleport",
			action_data = ACTIONS.teleport,
		},
		condition = "at_smartobject",
		name = "smartobject",
	},
	{
		"BTLootRatFleeAction",
		name = "flee",
		action_data = ACTIONS.flee,
	},
	{
		"BTIdleAction",
		name = "idle",
		action_data = ACTIONS.idle,
	},
	name = "horde",
}

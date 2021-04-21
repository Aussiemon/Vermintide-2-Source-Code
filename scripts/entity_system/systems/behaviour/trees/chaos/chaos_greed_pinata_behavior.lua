local ACTIONS = BreedActions.chaos_greed_pinata
BreedBehaviors.chaos_greed_pinata = {
	"BTSelector",
	{
		"BTSpawningAction",
		condition = "spawn",
		name = "spawn"
	},
	{
		"BTSelector",
		{
			"BTTeleportAction",
			name = "teleport",
			condition = "at_teleport_smartobject",
			action_data = ACTIONS.teleport
		},
		{
			"BTChaosSorcererTeleportAction",
			name = "climb_teleport",
			condition = "at_climb_smartobject",
			action_data = ACTIONS.teleport
		},
		{
			"BTChaosSorcererTeleportAction",
			name = "jump_teleport",
			condition = "at_jump_smartobject",
			action_data = ACTIONS.teleport
		},
		{
			"BTChaosSorcererTeleportAction",
			name = "door_teleport",
			condition = "at_door_smartobject",
			action_data = ACTIONS.teleport
		},
		condition = "at_smartobject",
		name = "smartobject"
	},
	{
		"BTLootRatFleeAction",
		name = "flee",
		action_data = ACTIONS.flee
	},
	{
		"BTIdleAction",
		name = "idle",
		action_data = ACTIONS.idle
	},
	name = "horde"
}

return

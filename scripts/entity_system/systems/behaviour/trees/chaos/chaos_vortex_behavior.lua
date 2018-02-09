local ACTIONS = BreedActions.chaos_vortex
BreedBehaviors.chaos_vortex = {
	"BTSelector",
	{
		"BTVortexSpawnAction",
		condition = "spawn",
		name = "spawn"
	},
	{
		"BTSelector",
		{
			"BTVortexFlyAction",
			condition = "vortex_at_climb_or_jump",
			name = "fly"
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
		"BTVortexWanderAction",
		name = "wander"
	},
	name = "chaos_vortex"
}

return 

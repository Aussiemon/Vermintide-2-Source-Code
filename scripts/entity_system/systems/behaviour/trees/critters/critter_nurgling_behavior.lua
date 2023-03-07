BreedBehaviors.critter_nurgling = {
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
		"BTCritterNurglingFleeAction",
		name = "flee_sequence",
		condition = "is_fleeing",
		action_data = BreedActions.critter_nurgling.flee
	},
	{
		"BTSequence",
		{
			"BTCritterNurglingRoamAction",
			name = "roam",
			action_data = BreedActions.critter_nurgling.roam
		},
		{
			"BTCritterNurglingWaitAction",
			name = "wait",
			action_data = BreedActions.critter_nurgling.wait
		},
		condition = "nurgling_spawned_by_altar",
		name = "roam_sequence"
	},
	{
		"BTIdleAction",
		name = "idle"
	},
	name = "critter_nurgling"
}

BreedBehaviors.critter_pig = {
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
		"BTIdleAction",
		name = "idle",
		action_data = BreedActions.critter_pig.idle
	},
	name = "critter_pig"
}

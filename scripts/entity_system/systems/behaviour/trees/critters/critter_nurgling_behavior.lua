-- chunkname: @scripts/entity_system/systems/behaviour/trees/critters/critter_nurgling_behavior.lua

BreedBehaviors.critter_nurgling = {
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
		"BTCritterNurglingFleeAction",
		condition = "is_fleeing",
		name = "flee_sequence",
		action_data = BreedActions.critter_nurgling.flee,
	},
	{
		"BTSequence",
		{
			"BTCritterNurglingRoamAction",
			name = "roam",
			action_data = BreedActions.critter_nurgling.roam,
		},
		{
			"BTCritterNurglingWaitAction",
			name = "wait",
			action_data = BreedActions.critter_nurgling.wait,
		},
		condition = "nurgling_spawned_by_altar",
		name = "roam_sequence",
	},
	{
		"BTIdleAction",
		name = "idle",
	},
	name = "critter_nurgling",
}

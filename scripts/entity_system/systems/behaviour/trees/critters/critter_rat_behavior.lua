﻿-- chunkname: @scripts/entity_system/systems/behaviour/trees/critters/critter_rat_behavior.lua

BreedBehaviors.critter_rat = {
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
		"BTCritterRatScurryUnderDoorAction",
		condition = "at_smart_object_and_door",
		name = "under_door",
		action_data = BreedActions.critter_rat.scurry_under_door,
	},
	{
		"BTSequence",
		{
			"BTCritterRatFleeAction",
			name = "flee",
			action_data = BreedActions.critter_rat.flee,
		},
		{
			"BTCritterRatDigAction",
			name = "dig",
		},
		condition = "is_fleeing",
		name = "flee_sequence",
	},
	{
		"BTIdleAction",
		name = "idle",
		action_data = BreedActions.critter_rat.idle,
	},
	name = "critter_rat",
}

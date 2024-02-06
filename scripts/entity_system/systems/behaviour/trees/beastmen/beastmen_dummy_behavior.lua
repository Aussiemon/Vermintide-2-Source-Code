-- chunkname: @scripts/entity_system/systems/behaviour/trees/beastmen/beastmen_dummy_behavior.lua

local ACTIONS = BreedActions.beastmen_gor

BreedBehaviors.beastmen_dummy = {
	"BTSelector",
	{
		"BTSpawningAction",
		condition = "spawn",
		name = "spawn",
	},
	{
		"BTFallAction",
		condition = "is_falling",
		name = "falling",
	},
	{
		"BTIdleAction",
		condition = "no_target",
		name = "idle",
		action_data = ACTIONS.dummy_idle,
	},
	{
		"BTFallbackIdleAction",
		name = "fallback_idle",
	},
	name = "beastmen_dummy",
}

-- chunkname: @scripts/entity_system/systems/behaviour/trees/chaos/chaos_dummy_sorcerer_behavior.lua

local ACTIONS = BreedActions.chaos_dummy_sorcerer

BreedBehaviors.dummy_sorcerer = {
	"BTSelector",
	{
		"BTTentacleSpawnAction",
		condition = "spawn",
		name = "spawn",
	},
	{
		"BTDummyIdleAction",
		enter_hook = "sorcerer_dummy_idle",
		name = "idle",
		action_data = ACTIONS.idle,
	},
	name = "chaos_dummy_sorcerer",
}

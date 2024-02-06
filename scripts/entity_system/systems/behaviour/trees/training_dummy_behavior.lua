-- chunkname: @scripts/entity_system/systems/behaviour/trees/training_dummy_behavior.lua

local ACTIONS = BreedActions.training_dummy

BreedBehaviors.training_dummy = {
	"BTSelector",
	{
		"BTDummyStaggerAction",
		condition = "stagger",
		name = "stagger",
		action_data = ACTIONS.stagger,
	},
	{
		"BTNilAction",
		name = "do_nothing",
	},
	name = "training_dummy",
}

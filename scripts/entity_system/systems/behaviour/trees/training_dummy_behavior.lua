local ACTIONS = BreedActions.training_dummy
BreedBehaviors.training_dummy = {
	"BTSelector",
	{
		"BTDummyStaggerAction",
		name = "stagger",
		condition = "stagger",
		action_data = ACTIONS.stagger
	},
	{
		"BTNilAction",
		name = "do_nothing"
	},
	name = "training_dummy"
}

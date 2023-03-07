local ACTIONS = BreedActions.beastmen_gor
BreedBehaviors.beastmen_dummy = {
	"BTSelector",
	{
		"BTSpawningAction",
		condition = "spawn",
		name = "spawn"
	},
	{
		"BTFallAction",
		condition = "is_falling",
		name = "falling"
	},
	{
		"BTIdleAction",
		name = "idle",
		condition = "no_target",
		action_data = ACTIONS.dummy_idle
	},
	{
		"BTFallbackIdleAction",
		name = "fallback_idle"
	},
	name = "beastmen_dummy"
}

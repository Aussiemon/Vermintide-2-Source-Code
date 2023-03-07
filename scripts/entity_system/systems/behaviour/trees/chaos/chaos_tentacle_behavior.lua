BreedBehaviors.chaos_tentacle = {
	"BTSelector",
	{
		"BTTentacleSpawnAction",
		condition = "spawn",
		name = "spawn"
	},
	{
		"BTTentacleAttackAction",
		name = "attack",
		condition = "tentacle_found_target",
		action_data = BreedActions.chaos_tentacle.attack
	},
	{
		"BTTentacleIdleAction",
		name = "idle",
		action_data = BreedActions.chaos_tentacle.idle
	},
	name = "chaos_tentacle"
}

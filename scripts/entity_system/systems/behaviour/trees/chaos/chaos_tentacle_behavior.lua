-- chunkname: @scripts/entity_system/systems/behaviour/trees/chaos/chaos_tentacle_behavior.lua

BreedBehaviors.chaos_tentacle = {
	"BTSelector",
	{
		"BTTentacleSpawnAction",
		condition = "spawn",
		name = "spawn",
	},
	{
		"BTTentacleAttackAction",
		condition = "tentacle_found_target",
		name = "attack",
		action_data = BreedActions.chaos_tentacle.attack,
	},
	{
		"BTTentacleIdleAction",
		name = "idle",
		action_data = BreedActions.chaos_tentacle.idle,
	},
	name = "chaos_tentacle",
}

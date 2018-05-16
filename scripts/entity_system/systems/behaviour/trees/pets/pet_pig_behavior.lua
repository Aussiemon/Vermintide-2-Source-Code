BreedBehaviors.pet_pig = {
	"BTSelector",
	{
		"BTSpawningAction",
		condition = "spawn",
		name = "spawn"
	},
	{
		"BTAlliedAvoidCombatAction",
		name = "avoid_combat",
		condition = "player_controller_is_in_combat",
		action_data = BreedActions.pet_pig.avoid_combat
	},
	{
		"BTUtilityNode",
		{
			"BTAlliedFollowAction",
			name = "follow",
			action_data = BreedActions.pet_pig.follow
		},
		condition = "player_controller_is_alive",
		name = "is_with_player"
	},
	{
		"BTIdleAction",
		name = "idle",
		action_data = BreedActions.pet_pig.idle
	},
	name = "pet_pig"
}

return

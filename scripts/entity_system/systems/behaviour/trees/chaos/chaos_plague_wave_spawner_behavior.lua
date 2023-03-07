BreedBehaviors.chaos_plague_wave_spawner = {
	"BTSelector",
	{
		"BTTentacleSpawnAction",
		condition = "spawn",
		name = "spawn"
	},
	{
		"BTSelector",
		{
			"BTChaosSorcererSummoningAction",
			name = "spawn_plague_wave",
			condition = "ready_to_summon",
			action_data = BreedActions.chaos_plague_wave_spawner.plague_wave_spawn
		},
		{
			"BTSequence",
			{
				"BTChaosPlagueWaveSpawnerSummoningAction",
				name = "spawning_pattern",
				action_data = BreedActions.chaos_plague_wave_spawner.spawning_pattern
			},
			name = "attack_pattern"
		},
		condition = "can_see_player",
		name = "in_combat"
	},
	name = "chaos_plague_wave_spawner"
}

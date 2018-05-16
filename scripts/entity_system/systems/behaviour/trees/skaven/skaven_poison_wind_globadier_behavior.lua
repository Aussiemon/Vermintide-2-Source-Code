local ACTIONS = BreedActions.skaven_poison_wind_globadier
BreedBehaviors.skaven_poison_wind_globadier = {
	"BTSelector",
	{
		"BTGlobadierSuicideStaggerAction",
		condition = "suiciding_whilst_staggering",
		name = "suicide_stagger"
	},
	{
		"BTStaggerAction",
		name = "stagger",
		condition = "stagger",
		action_data = ACTIONS.stagger
	},
	{
		"BTSpawningAction",
		condition = "spawn",
		name = "spawn"
	},
	{
		"BTInVortexAction",
		condition = "in_vortex",
		name = "in_vortex"
	},
	{
		"BTInGravityWellAction",
		condition = "in_gravity_well",
		name = "in_gravity_well"
	},
	{
		"BTSelector",
		{
			"BTTeleportAction",
			condition = "at_teleport_smartobject",
			name = "teleport"
		},
		{
			"BTClimbAction",
			condition = "at_climb_smartobject",
			name = "climb"
		},
		{
			"BTJumpAcrossAction",
			condition = "at_jump_smartobject",
			name = "jump_across"
		},
		{
			"BTSmashDoorAction",
			name = "smash_door",
			condition = "at_door_smartobject",
			action_data = ACTIONS.smash_door
		},
		condition = "at_smartobject",
		name = "smartobject"
	},
	{
		"BTSelector",
		{
			"BTSuicideRunAction",
			name = "suicide_run",
			condition = "suicide_run",
			action_data = ACTIONS.suicide_run
		},
		{
			"BTSequence",
			{
				"BTSelector",
				{
					"BTMoveToPlayersAction",
					name = "move_to_players",
					condition = "globadier_skulked_for_too_long",
					action_data = ACTIONS.move_to_players
				},
				{
					"BTSequence",
					{
						"BTSkulkApproachAction",
						name = "skulk_approach",
						action_data = ACTIONS.skulk_approach
					},
					{
						"BTAdvanceTowardsPlayersAction",
						name = "advance_towards_players",
						action_data = ACTIONS.advance_towards_players
					},
					condition = "always_true",
					name = "skulk_movement"
				},
				name = "movement_method"
			},
			{
				"BTThrowPoisonGlobeAction",
				name = "throw_poison_globe",
				action_data = ACTIONS.throw_poison_globe
			},
			{
				"BTObservePoisonWind",
				name = "observe_poison_wind"
			},
			name = "attack_pattern"
		},
		condition = "can_see_player",
		name = "in_combat"
	},
	{
		"BTIdleAction",
		name = "idle"
	},
	name = "skaven_poison_wind_globadier"
}

return

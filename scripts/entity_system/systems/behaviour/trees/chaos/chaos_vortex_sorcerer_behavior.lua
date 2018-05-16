local ACTIONS = BreedActions.chaos_vortex_sorcerer
BreedBehaviors.chaos_vortex_sorcerer = {
	"BTSelector",
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
		"BTFallAction",
		condition = "is_falling",
		name = "falling"
	},
	{
		"BTStaggerAction",
		name = "stagger",
		condition = "stagger",
		action_data = ACTIONS.stagger
	},
	{
		"BTSelector",
		{
			"BTTeleportAction",
			condition = "at_teleport_smartobject",
			name = "teleport"
		},
		{
			"BTChaosSorcererTeleportAction",
			condition = "at_climb_smartobject",
			name = "climb_teleport"
		},
		{
			"BTChaosSorcererTeleportAction",
			condition = "at_jump_smartobject",
			name = "jump_teleport"
		},
		{
			"BTChaosSorcererTeleportAction",
			condition = "at_door_smartobject",
			name = "door_teleport"
		},
		condition = "at_smartobject",
		name = "smartobject"
	},
	{
		"BTQuickTeleportAction",
		name = "quick_teleport",
		condition = "quick_teleport",
		action_data = ACTIONS.quick_teleport
	},
	{
		"BTChaosSorcererSummoningAction",
		name = "spawn_vortex",
		condition = "ready_to_summon",
		action_data = ACTIONS.spawn_vortex
	},
	{
		"BTChaosSorcererSkulkApproachAction",
		name = "skulk_approach",
		condition = "can_see_player",
		action_data = ACTIONS.skulk_approach
	},
	{
		"BTIdleAction",
		name = "idle"
	},
	name = "chaos_vortex_sorcerer"
}

return

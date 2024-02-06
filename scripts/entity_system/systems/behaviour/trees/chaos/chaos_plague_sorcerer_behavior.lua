-- chunkname: @scripts/entity_system/systems/behaviour/trees/chaos/chaos_plague_sorcerer_behavior.lua

local ACTIONS = BreedActions.chaos_plague_sorcerer

BreedBehaviors.chaos_plague_sorcerer = {
	"BTSelector",
	{
		"BTSpawningAction",
		condition = "spawn",
		name = "spawn",
	},
	{
		"BTInVortexAction",
		condition = "in_vortex",
		name = "in_vortex",
	},
	{
		"BTFallAction",
		condition = "is_falling",
		name = "falling",
	},
	{
		"BTStaggerAction",
		condition = "stagger",
		name = "stagger",
		action_data = ACTIONS.stagger,
	},
	{
		"BTSelector",
		{
			"BTTeleportAction",
			condition = "at_teleport_smartobject",
			name = "teleport",
		},
		{
			"BTChaosSorcererTeleportAction",
			condition = "at_climb_smartobject",
			name = "climb_teleport",
		},
		{
			"BTChaosSorcererTeleportAction",
			condition = "at_jump_smartobject",
			name = "jump_teleport",
		},
		{
			"BTChaosSorcererTeleportAction",
			condition = "at_door_smartobject",
			name = "door_teleport",
		},
		condition = "at_smartobject",
		name = "smartobject",
	},
	{
		"BTQuickTeleportAction",
		condition = "quick_teleport",
		name = "quick_teleport",
		action_data = ACTIONS.quick_teleport,
	},
	{
		"BTChaosSorcererSummoningAction",
		condition = "ready_to_summon",
		name = "spawn_plague_wave",
		action_data = ACTIONS.spawn_plague_wave,
	},
	{
		"BTSelector",
		{
			"BTChaosSorcererPlagueSkulkAction",
			name = "skulk_approach",
			action_data = ACTIONS.skulk_approach,
		},
		condition = "can_see_player",
		name = "in_combat",
	},
	{
		"BTIdleAction",
		name = "idle",
	},
	name = "chaos_plague_sorcerer",
}

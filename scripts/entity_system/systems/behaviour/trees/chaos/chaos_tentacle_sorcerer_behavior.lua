﻿-- chunkname: @scripts/entity_system/systems/behaviour/trees/chaos/chaos_tentacle_sorcerer_behavior.lua

BreedBehaviors.chaos_tentacle_sorcerer = {
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
		action_data = BreedActions.chaos_tentacle_sorcerer.stagger,
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
		action_data = BreedActions.chaos_tentacle_sorcerer.quick_teleport,
	},
	{
		"BTChaosSorcererSummoningAction",
		condition = "ready_to_summon",
		name = "spawn_portal",
		action_data = BreedActions.chaos_tentacle_sorcerer.spawn_portal,
	},
	{
		"BTSelector",
		{
			"BTSequence",
			{
				"BTChaosSorcererSkulkApproachAction",
				name = "skulk_approach",
				action_data = BreedActions.chaos_tentacle_sorcerer.skulk_approach,
			},
			name = "attack_pattern",
		},
		condition = "can_see_player",
		name = "in_combat",
	},
	{
		"BTIdleAction",
		name = "idle",
	},
	name = "chaos_tentacle_sorcerer",
}

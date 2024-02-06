﻿-- chunkname: @scripts/entity_system/systems/behaviour/trees/skaven/skaven_gutter_runner_behavior.lua

local ACTIONS = BreedActions.skaven_gutter_runner

BreedBehaviors.gutter_runner = {
	"BTSelector",
	{
		"BTFallAction",
		condition = "is_gutter_runner_falling",
		name = "falling",
	},
	{
		"BTStaggerAction",
		condition = "stagger",
		name = "stagger",
		action_data = ACTIONS.stagger,
	},
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
		"BTSelector",
		{
			"BTTeleportAction",
			condition = "at_teleport_smartobject",
			name = "teleport",
		},
		{
			"BTJumpAcrossAction",
			condition = "at_jump_smartobject",
			name = "jump_across",
		},
		{
			"BTSmashDoorAction",
			condition = "at_door_smartobject",
			name = "smash_door",
			action_data = ACTIONS.smash_door,
		},
		{
			"BTNinjaHighGroundAction",
			condition = "at_climb_smartobject",
			name = "climb",
		},
		condition = "gutter_runner_at_smartobject",
		name = "smartobject",
	},
	{
		"BTNinjaVanishAction",
		condition = "ninja_vanish",
		name = "ninja_vanish",
		action_data = ACTIONS.ninja_vanish,
	},
	{
		"BTSequence",
		{
			"BTCrazyJumpAction",
			name = "crazy_jump_x",
			action_data = ACTIONS.jump,
		},
		{
			"BTTargetPouncedAction",
			name = "target_pounced-x",
			action_data = ACTIONS.target_pounced,
		},
		condition = "quick_jump",
		name = "quick_jump",
	},
	{
		"BTSequence",
		{
			"BTNinjaApproachAction",
			name = "approaching",
		},
		{
			"BTPrepareForCrazyJumpAction",
			name = "prepare_crazy_jump",
			action_data = ACTIONS.prepare_crazy_jump,
		},
		{
			"BTCrazyJumpAction",
			name = "crazy_jump",
			action_data = ACTIONS.jump,
		},
		{
			"BTTargetPouncedAction",
			name = "target_pounced",
			action_data = ACTIONS.target_pounced,
		},
		condition = "comitted_to_target",
		name = "approach_target",
	},
	{
		"BTSequence",
		{
			"BTSkulkAroundAction",
			name = "skulk_around",
			action_data = ACTIONS.skulking,
		},
		{
			"BTSkulkIdleAction",
			name = "skulk_idle",
			action_data = ACTIONS.skulk_idle,
		},
		condition = "can_see_player",
		name = "skulking",
	},
	{
		"BTCirclePreyAction",
		condition = "secondary_target",
		name = "abide",
	},
	{
		"BTIdleAction",
		name = "idle",
	},
	name = "gutter_runner",
}

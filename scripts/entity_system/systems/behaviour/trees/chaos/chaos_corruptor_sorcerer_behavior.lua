﻿-- chunkname: @scripts/entity_system/systems/behaviour/trees/chaos/chaos_corruptor_sorcerer_behavior.lua

local ACTIONS = BreedActions.chaos_corruptor_sorcerer

BreedBehaviors.chaos_corruptor_sorcerer = {
	"BTSelector",
	{
		"BTSpawningAction",
		condition = "spawn",
		enter_hook = "corruptor_enter",
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
		"BTCorruptorGrabAction",
		condition = "ready_to_summon",
		name = "attack",
		action_data = ACTIONS.grab_attack,
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
	name = "chaos_corruptor_sorcerer",
}

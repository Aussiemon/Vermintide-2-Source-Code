-- chunkname: @scripts/entity_system/systems/behaviour/trees/chaos/chaos_tether_sorcerer_behavior.lua

local ACTIONS = BreedActions.chaos_tether_sorcerer

BreedBehaviors.chaos_tether_sorcerer = {
	"BTSelector",
	{
		"BTSpawningAction",
		condition = "spawn",
		enter_hook = "corruptor_enter",
		name = "spawn",
		action_data = ACTIONS.spawn,
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
		"BTSelector",
		{
			"BTChaosSorcererTetherSkulkAction",
			name = "skulk_tether",
			action_data = ACTIONS.skulk_tether,
		},
		name = "in_combat",
	},
	{
		"BTIdleAction",
		name = "idle",
	},
	name = "chaos_tether_sorcerer",
}

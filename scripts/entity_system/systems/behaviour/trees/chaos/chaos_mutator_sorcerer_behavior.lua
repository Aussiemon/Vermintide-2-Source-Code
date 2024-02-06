-- chunkname: @scripts/entity_system/systems/behaviour/trees/chaos/chaos_mutator_sorcerer_behavior.lua

local ACTIONS = BreedActions.chaos_mutator_sorcerer

BreedBehaviors.chaos_mutator_sorcerer = {
	"BTSelector",
	{
		"BTSpawningAction",
		condition = "spawn",
		enter_hook = "sorcerer_dummy_idle",
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
		"BTQuickTeleportAction",
		condition = "quick_teleport",
		leave_hook = "destroy_unit_leave_hook",
		name = "quick_teleport",
		action_data = ACTIONS.quick_teleport,
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
			"BTVortexFlyAction",
			condition = "vortex_at_climb_or_jump",
			name = "fly",
		},
		{
			"BTSmashDoorAction",
			condition = "at_door_smartobject",
			name = "smash_door",
			action_data = ACTIONS.smash_door,
		},
		condition = "at_smartobject",
		name = "smartobject",
	},
	{
		"BTSequence",
		{
			"BTMutatorSorcererFollowAction",
			name = "follow",
			action_data = ACTIONS.follow,
		},
		{
			"BTCorruptorGrabAction",
			enter_hook = "remove_invincibility",
			leave_hook = "mutator_sorcerer_activate_teleport",
			name = "attack",
			action_data = ACTIONS.grab_attack,
		},
		condition = "can_see_player",
		name = "in_combat",
	},
	{
		"BTIdleAction",
		name = "idle",
		action_data = ACTIONS.idle,
	},
	name = "chaos_mutator_sorcerer",
}

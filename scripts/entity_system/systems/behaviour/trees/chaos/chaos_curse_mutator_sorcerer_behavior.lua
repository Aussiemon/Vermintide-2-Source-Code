local ACTIONS = BreedActions.curse_mutator_sorcerer
BreedBehaviors.curse_mutator_sorcerer = {
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
		"BTFallAction",
		condition = "is_falling",
		name = "falling"
	},
	{
		"BTQuickTeleportAction",
		leave_hook = "destroy_unit_leave_hook",
		name = "quick_teleport",
		condition = "quick_teleport",
		action_data = ACTIONS.quick_teleport
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
			"BTVortexFlyAction",
			condition = "vortex_at_climb_or_jump",
			name = "fly"
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
		"BTSequence",
		{
			"BTMutatorSorcererFollowAction",
			name = "follow",
			action_data = ACTIONS.follow
		},
		{
			"BTCorruptorGrabAction",
			enter_hook = "on_skulking_sorcerer_grab",
			name = "attack",
			leave_hook = "mutator_sorcerer_force_teleport",
			action_data = ACTIONS.grab_attack
		},
		condition = "can_see_player",
		name = "in_combat"
	},
	{
		"BTIdleAction",
		name = "idle",
		action_data = ACTIONS.idle
	},
	name = "curse_mutator_sorcerer"
}

return

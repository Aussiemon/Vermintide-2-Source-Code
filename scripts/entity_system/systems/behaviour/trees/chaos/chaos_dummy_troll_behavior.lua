-- chunkname: @scripts/entity_system/systems/behaviour/trees/chaos/chaos_dummy_troll_behavior.lua

local ACTIONS = BreedActions.chaos_dummy_troll

BreedBehaviors.dummy_troll = {
	"BTSelector",
	{
		"BTSpawningAction",
		condition = "spawn",
		name = "spawn",
	},
	{
		"BTSelector",
		{
			"BTTeleportAction",
			condition = "at_teleport_smartobject",
			name = "teleport",
		},
		{
			"BTClimbAction",
			condition = "at_climb_smartobject",
			name = "climb",
			action_data = ACTIONS.climb,
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
		condition = "ratogre_at_smartobject",
		name = "smartobject",
	},
	{
		"BTTrollDownedAction",
		condition = "troll_downed",
		name = "downed",
		action_data = ACTIONS.downed,
	},
	{
		"BTStaggerAction",
		condition = "stagger",
		name = "stagger",
		action_data = ACTIONS.stagger,
	},
	{
		"BTMoveToGoalAction",
		condition = "has_goal_destination",
		enter_hook = "crouch_or_upright_on_enter",
		name = "move_to_goal",
		action_data = ACTIONS.follow,
	},
	{
		"BTIdleAction",
		enter_hook = "crouch_or_upright_on_enter",
		name = "idle",
	},
	name = "chaos_dummy_troll",
}

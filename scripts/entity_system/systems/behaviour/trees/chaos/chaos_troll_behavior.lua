-- chunkname: @scripts/entity_system/systems/behaviour/trees/chaos/chaos_troll_behavior.lua

local ACTIONS = BreedActions.chaos_troll

BreedBehaviors.troll = {
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
		"BTSelector",
		{
			"BTTargetRageAction",
			condition = "target_changed",
			enter_hook = "rage_on_enter",
			name = "target_rage",
			action_data = ACTIONS.target_rage,
		},
		{
			"BTUtilityNode",
			{
				"BTBossFollowAction",
				name = "follow_crouching",
				action_data = ACTIONS.follow_crouching,
			},
			{
				"BTMeleeOverlapAttackAction",
				name = "attack_crouch_sweep",
				action_data = ACTIONS.attack_crouch_sweep,
			},
			{
				"BTVomitAction",
				name = "vomit",
				action_data = ACTIONS.vomit,
			},
			condition = "needs_to_crouch",
			enter_hook = "crouch_on_enter",
			name = "in_combat_crouching",
		},
		{
			"BTUtilityNode",
			{
				"BTBossFollowAction",
				name = "follow",
				action_data = ACTIONS.follow,
			},
			{
				"BTMeleeOverlapAttackAction",
				name = "melee_shove",
				action_data = ACTIONS.melee_shove,
			},
			{
				"BTMeleeOverlapAttackAction",
				name = "melee_sweep",
				action_data = ACTIONS.melee_sweep,
			},
			{
				"BTVomitAction",
				name = "vomit",
				action_data = ACTIONS.vomit,
			},
			{
				"BTMeleeOverlapAttackAction",
				name = "attack_cleave",
				action_data = ACTIONS.attack_cleave,
			},
			condition = "ratogre_target_reachable",
			enter_hook = "upright_on_enter",
			name = "in_combat",
		},
		{
			"BTTargetUnreachableAction",
			name = "target_unreachable",
			action_data = ACTIONS.target_unreachable,
		},
		condition = "can_see_player",
		name = "has_target",
	},
	{
		"BTMoveToGoalAction",
		condition = "has_goal_destination",
		name = "move_to_goal",
		action_data = ACTIONS.follow,
	},
	{
		"BTIdleAction",
		enter_hook = "crouch_or_upright_on_enter",
		name = "idle",
	},
	name = "chaos_troll",
}

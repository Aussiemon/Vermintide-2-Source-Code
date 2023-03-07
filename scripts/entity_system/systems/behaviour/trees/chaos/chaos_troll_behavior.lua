local ACTIONS = BreedActions.chaos_troll
BreedBehaviors.troll = {
	"BTSelector",
	{
		"BTSpawningAction",
		condition = "spawn",
		name = "spawn"
	},
	{
		"BTSelector",
		{
			"BTTeleportAction",
			condition = "at_teleport_smartobject",
			name = "teleport"
		},
		{
			"BTClimbAction",
			name = "climb",
			condition = "at_climb_smartobject",
			action_data = ACTIONS.climb
		},
		{
			"BTJumpAcrossAction",
			condition = "at_jump_smartobject",
			name = "jump_across"
		},
		{
			"BTSmashDoorAction",
			name = "smash_door",
			condition = "at_door_smartobject",
			action_data = ACTIONS.smash_door
		},
		condition = "ratogre_at_smartobject",
		name = "smartobject"
	},
	{
		"BTTrollDownedAction",
		name = "downed",
		condition = "troll_downed",
		action_data = ACTIONS.downed
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
			"BTTargetRageAction",
			enter_hook = "rage_on_enter",
			name = "target_rage",
			condition = "target_changed",
			action_data = ACTIONS.target_rage
		},
		{
			"BTUtilityNode",
			{
				"BTBossFollowAction",
				name = "follow_crouching",
				action_data = ACTIONS.follow_crouching
			},
			{
				"BTMeleeOverlapAttackAction",
				name = "attack_crouch_sweep",
				action_data = ACTIONS.attack_crouch_sweep
			},
			{
				"BTVomitAction",
				name = "vomit",
				action_data = ACTIONS.vomit
			},
			name = "in_combat_crouching",
			condition = "needs_to_crouch",
			enter_hook = "crouch_on_enter"
		},
		{
			"BTUtilityNode",
			{
				"BTBossFollowAction",
				name = "follow",
				action_data = ACTIONS.follow
			},
			{
				"BTMeleeOverlapAttackAction",
				name = "melee_shove",
				action_data = ACTIONS.melee_shove
			},
			{
				"BTMeleeOverlapAttackAction",
				name = "melee_sweep",
				action_data = ACTIONS.melee_sweep
			},
			{
				"BTVomitAction",
				name = "vomit",
				action_data = ACTIONS.vomit
			},
			{
				"BTMeleeOverlapAttackAction",
				name = "attack_cleave",
				action_data = ACTIONS.attack_cleave
			},
			name = "in_combat",
			condition = "ratogre_target_reachable",
			enter_hook = "upright_on_enter"
		},
		{
			"BTTargetUnreachableAction",
			name = "target_unreachable",
			action_data = ACTIONS.target_unreachable
		},
		condition = "can_see_player",
		name = "has_target"
	},
	{
		"BTMoveToGoalAction",
		name = "move_to_goal",
		condition = "has_goal_destination",
		action_data = ACTIONS.follow
	},
	{
		"BTIdleAction",
		enter_hook = "crouch_or_upright_on_enter",
		name = "idle"
	},
	name = "chaos_troll"
}

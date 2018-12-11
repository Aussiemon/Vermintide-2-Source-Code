local ACTIONS = BreedActions.skaven_stormfiend
BreedBehaviors.stormfiend = {
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
			condition = "target_changed_and_distant",
			action_data = ACTIONS.target_rage
		},
		{
			"BTMeleeOverlapAttackAction",
			leave_hook = "reset_fling_skaven",
			name = "fling_skaven",
			condition = "fling_skaven",
			action_data = ACTIONS.fling_skaven
		},
		{
			"BTUtilityNode",
			{
				"BTMeleeOverlapAttackAction",
				name = "charge",
				leave_hook = "reset_stormfiend_charge",
				action_data = ACTIONS.charge
			},
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
				"BTStormfiendShootAction",
				name = "shoot",
				action_data = ACTIONS.shoot
			},
			{
				"BTTargetUnreachableAction",
				name = "target_unreachable",
				action_data = ACTIONS.target_unreachable
			},
			name = "in_combat"
		},
		condition = "can_see_player",
		name = "has_target"
	},
	{
		"BTIdleAction",
		name = "idle"
	},
	name = "stormfiend"
}

return

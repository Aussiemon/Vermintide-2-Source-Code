local ACTIONS = BreedActions.skaven_stormfiend_boss
BreedBehaviors.stormfiend_boss = {
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
		"BTMountUnitAction",
		leave_hook = "stormfiend_boss_mount_leave",
		name = "mount_unit",
		condition = "should_mount_unit",
		action_data = ACTIONS.mount_unit
	},
	{
		"BTMoveToGoalAction",
		name = "move_to_goal",
		condition = "has_goal_destination",
		action_data = ACTIONS.pick_up_grey_seer
	},
	{
		"BTStormfiendDualShootAction",
		name = "dual_shoot_intro",
		leave_hook = "stormfiend_boss_rage_leave",
		condition = "stormfiend_boss_rage",
		enter_hook = "rage_on_enter",
		action_data = ACTIONS.dual_shoot_intro
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
			"BTMeleeOverlapAttackAction",
			leave_hook = "reset_fling_skaven",
			name = "fling_skaven",
			condition = "fling_skaven",
			action_data = ACTIONS.fling_skaven
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
				"BTStormfiendShootAction",
				name = "shoot",
				action_data = ACTIONS.shoot
			},
			{
				"BTMeleeOverlapAttackAction",
				name = "charge",
				action_data = ACTIONS.charge
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
	name = "stormfiend_boss"
}

return 

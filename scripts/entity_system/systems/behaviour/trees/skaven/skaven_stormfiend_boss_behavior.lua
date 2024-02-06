-- chunkname: @scripts/entity_system/systems/behaviour/trees/skaven/skaven_stormfiend_boss_behavior.lua

local ACTIONS = BreedActions.skaven_stormfiend_boss

BreedBehaviors.stormfiend_boss = {
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
			leave_hook = "stormfiend_boss_jump_down_leave",
			name = "climb",
			action_data = ACTIONS.climb,
		},
		{
			"BTJumpAcrossAction",
			condition = "at_jump_smartobject",
			name = "jump_across",
		},
		condition = "stormfiend_boss_intro_jump_down",
		name = "smartobject",
	},
	{
		"BTMountUnitAction",
		condition = "should_mount_unit",
		leave_hook = "stormfiend_boss_mount_leave",
		name = "mount_unit",
		action_data = ACTIONS.mount_unit,
	},
	{
		"BTMoveToGoalAction",
		condition = "has_goal_destination",
		name = "move_to_goal",
		action_data = ACTIONS.pick_up_grey_seer,
	},
	{
		"BTStormfiendDualShootAction",
		condition = "stormfiend_boss_rage",
		enter_hook = "rage_on_enter",
		leave_hook = "stormfiend_boss_rage_leave",
		name = "dual_shoot_intro",
		action_data = ACTIONS.dual_shoot_intro,
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
			"BTMeleeOverlapAttackAction",
			condition = "fling_skaven",
			leave_hook = "reset_fling_skaven",
			name = "fling_skaven",
			action_data = ACTIONS.fling_skaven,
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
				"BTStormfiendShootAction",
				name = "shoot",
				action_data = ACTIONS.shoot,
			},
			{
				"BTMeleeOverlapAttackAction",
				enter_hook = "stormfiend_boss_charge_enter",
				name = "charge",
				action_data = ACTIONS.charge,
			},
			{
				"BTChampionAttackAction",
				name = "special_attack_aoe",
				action_data = ACTIONS.special_attack_aoe,
			},
			{
				"BTTargetUnreachableAction",
				name = "target_unreachable",
				action_data = ACTIONS.target_unreachable,
			},
			name = "in_combat",
		},
		condition = "can_see_player",
		name = "has_target",
	},
	{
		"BTIdleAction",
		name = "idle",
	},
	name = "stormfiend_boss",
}

-- chunkname: @scripts/entity_system/systems/behaviour/trees/skaven/skaven_stormfiend_demo_behavior.lua

local ACTIONS = BreedActions.skaven_stormfiend_demo

BreedBehaviors.stormfiend_demo = {
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
			"BTTargetRageAction",
			condition = "target_changed_and_distant",
			enter_hook = "rage_on_enter",
			name = "target_rage",
			action_data = ACTIONS.target_rage,
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
	name = "stormfiend_demo",
}

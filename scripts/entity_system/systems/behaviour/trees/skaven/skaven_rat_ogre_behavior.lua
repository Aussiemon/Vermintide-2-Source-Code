-- chunkname: @scripts/entity_system/systems/behaviour/trees/skaven/skaven_rat_ogre_behavior.lua

local ACTIONS = BreedActions.skaven_rat_ogre

BreedBehaviors.ogre = {
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
			condition = "target_changed",
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
				"BTMeleeSlamAction",
				name = "melee_slam",
				action_data = ACTIONS.melee_slam,
			},
			{
				"BTMeleeSlamAction",
				name = "anti_ladder_melee_slam",
				action_data = ACTIONS.anti_ladder_melee_slam,
			},
			{
				"BTMeleeOverlapAttackAction",
				name = "melee_shove",
				action_data = ACTIONS.melee_shove,
			},
			{
				"BTMeleeOverlapAttackAction",
				name = "combo_attack",
				action_data = ACTIONS.combo_attack,
			},
			{
				"BTSequence",
				action_data = ACTIONS.jump_slam,
				{
					"BTPrepareJumpSlamAction",
					name = "prepare_jump_slam",
				},
				{
					"BTJumpSlamAction",
					name = "attack_jump",
					action_data = ACTIONS.jump_slam,
				},
				{
					"BTJumpSlamImpactAction",
					name = "jump_slam_impact",
					action_data = ACTIONS.jump_slam_impact,
				},
				name = "jump_slam",
			},
			condition = "ratogre_target_reachable",
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
		"BTRatOgreWalkAction",
		condition = "ratogre_walking",
		name = "walking",
		action_data = ACTIONS.walking,
	},
	{
		"BTIdleAction",
		name = "idle",
	},
	name = "rat_ogre",
}

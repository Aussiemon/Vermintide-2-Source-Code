-- chunkname: @scripts/entity_system/systems/behaviour/trees/beastmen/beastmen_minotaur_behavior.lua

local ACTIONS = BreedActions.beastmen_minotaur

BreedBehaviors.minotaur = {
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
			"BTUtilityNode",
			{
				"BTBossFollowAction",
				name = "follow",
				action_data = ACTIONS.follow,
			},
			{
				"BTMeleeOverlapAttackAction",
				name = "headbutt_attack",
				action_data = ACTIONS.headbutt_attack,
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
				"BTChargeAttackAction",
				name = "charge_attack",
				action_data = ACTIONS.charge_attack,
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
		"BTIdleAction",
		name = "idle",
	},
	name = "minotaur",
}

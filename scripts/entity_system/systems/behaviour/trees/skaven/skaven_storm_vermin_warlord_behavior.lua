-- chunkname: @scripts/entity_system/systems/behaviour/trees/skaven/skaven_storm_vermin_warlord_behavior.lua

local ACTIONS = BreedActions.skaven_storm_vermin_warlord
local WARLORD_DEFENSIVE = {
	"BTUtilityNode",
	{
		"BTChampionAttackAction",
		condition = "can_see_player",
		name = "defensive_mode_spin",
		action_data = ACTIONS.defensive_mode_spin,
	},
	condition = "should_be_defensive",
	name = "in_defensive",
}
local WARLORD_OFFENSIVE = {
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
			enter_hook = "on_warlord_disable_blocking",
			name = "dual_combo_attack2",
			action_data = ACTIONS.dual_combo_attack2,
		},
		{
			"BTChampionAttackAction",
			enter_hook = "on_warlord_disable_blocking",
			name = "dual_attack_cleave",
			action_data = ACTIONS.dual_attack_cleave,
		},
		{
			"BTChampionAttackAction",
			enter_hook = "on_warlord_disable_blocking",
			name = "dual_lunge_attack",
			action_data = ACTIONS.dual_lunge_attack,
		},
		condition = "warlord_dual_wielding",
		enter_hook = "on_warlord_dual_wield",
		name = "dual_wield_combat",
	},
	{
		"BTUtilityNode",
		{
			"BTSequence",
			action_data = ACTIONS.spawn_sequence,
			{
				"BTChampionAttackAction",
				name = "special_attack_spin_pre_spawn",
				action_data = ACTIONS.special_attack_spin,
			},
			{
				"BTSpawnAllies",
				name = "spawn",
				action_data = ACTIONS.spawn_allies,
			},
			enter_hook = "warlord_defensive_on_enter",
			name = "spawn_sequence",
		},
		{
			"BTTargetRageAction",
			condition = "target_changed",
			name = "turn_to_face_target",
			action_data = ACTIONS.turn_to_face_target,
		},
		{
			"BTBossFollowAction",
			name = "follow",
			action_data = ACTIONS.follow,
		},
		{
			"BTChampionAttackAction",
			name = "special_running_attack",
			action_data = ACTIONS.special_running_attack,
		},
		{
			"BTChampionAttackAction",
			name = "special_lunge_attack",
			action_data = ACTIONS.special_lunge_attack,
		},
		{
			"BTRandom",
			action_data = ACTIONS.special_attack_champion,
			{
				"BTChampionAttackAction",
				name = "special_attack_cleave",
				weight = 1,
				action_data = ACTIONS.special_attack_cleave,
			},
			{
				"BTChampionAttackAction",
				name = "special_attack_sweep_left",
				weight = 0.5,
				action_data = ACTIONS.special_attack_sweep_left,
			},
			{
				"BTChampionAttackAction",
				name = "special_attack_sweep_right",
				weight = 0.5,
				action_data = ACTIONS.special_attack_sweep_right,
			},
			name = "special_attack_champion",
		},
		{
			"BTChampionAttackAction",
			name = "special_attack_spin",
			action_data = ACTIONS.special_attack_spin,
		},
		condition = "warlord_halberding",
		enter_hook = "on_warlord_halberd",
		name = "halberd_combat",
	},
	condition = "can_see_player",
	name = "has_target",
}

BreedBehaviors.storm_vermin_warlord = {
	"BTSelector",
	{
		"BTSpawningAction",
		condition = "spawn",
		enter_hook = "on_warlord_disable_blocking",
		name = "spawn",
	},
	{
		"BTSelector",
		action_data = ACTIONS.intro_sequence,
		{
			"BTMoveToGoalAction",
			condition = "has_goal_destination",
			name = "move_to_goal",
			action_data = ACTIONS.follow,
		},
		{
			"BTIdleAction",
			name = "intro_idle",
			action_data = ACTIONS.intro_idle,
		},
		condition = "lord_intro",
		enter_hook = "on_skaven_warlord_intro_enter",
		leave_hook = "on_lord_warlord_intro_leave",
		name = "intro_sequence",
	},
	{
		"BTSwitchWeaponsAction",
		condition = "switching_weapons",
		name = "switch_weapons",
		action_data = ACTIONS.switch_weapons,
	},
	{
		"BTJumpToPositionAction",
		condition = "warlord_jump_down",
		name = "jump_to_position",
		action_data = ACTIONS.jump_to_position,
	},
	{
		"BTFallAction",
		condition = "is_falling",
		name = "falling",
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
		condition = "at_smartobject",
		name = "smartobject",
	},
	{
		"BTStaggerAction",
		condition = "stagger",
		name = "stagger",
		action_data = ACTIONS.stagger,
	},
	WARLORD_DEFENSIVE,
	WARLORD_OFFENSIVE,
	{
		"BTIdleAction",
		name = "defensive_idle",
		action_data = ACTIONS.defensive_idle,
	},
	{
		"BTIdleAction",
		name = "idle",
	},
	name = "storm_vermin_warlord",
}

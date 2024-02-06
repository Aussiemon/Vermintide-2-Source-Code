-- chunkname: @scripts/entity_system/systems/behaviour/trees/skaven/skaven_storm_vermin_champion_behavior.lua

local ACTIONS = BreedActions.skaven_storm_vermin_champion

BreedBehaviors.storm_vermin_champion = {
	"BTSelector",
	{
		"BTSpawningAction",
		condition = "spawn",
		name = "spawn",
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
	{
		"BTIdleAction",
		condition = "should_defensive_idle",
		name = "defensive_idle",
		action_data = ACTIONS.defensive_idle,
	},
	{
		"BTSelector",
		{
			"BTUtilityNode",
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
			{
				"BTChampionAttackAction",
				name = "defensive_mode_spin",
				action_data = ACTIONS.defensive_mode_spin,
			},
			{
				"BTChampionAttackAction",
				name = "special_attack_shatter",
				action_data = ACTIONS.special_attack_shatter,
			},
			{
				"BTChampionAttackAction",
				name = "defensive_attack_shatter",
				action_data = ACTIONS.defensive_attack_shatter,
			},
			name = "combat",
		},
		condition = "can_see_player",
		name = "has_target",
	},
	{
		"BTIdleAction",
		name = "idle",
	},
	name = "storm_vermin_champion",
}

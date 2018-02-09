local ACTIONS = BreedActions.skaven_storm_vermin_warlord
BreedBehaviors.storm_vermin_warlord = {
	"BTSelector",
	{
		"BTSpawningAction",
		name = "spawn",
		condition = "spawn",
		enter_hook = "on_warlord_disable_blocking"
	},
	{
		"BTSelector",
		{
			"BTMoveToGoalAction",
			name = "move_to_goal",
			condition = "has_goal_destination",
			action_data = ACTIONS.follow
		},
		{
			"BTIdleAction",
			name = "intro_idle",
			action_data = ACTIONS.intro_idle
		},
		name = "intro_sequence",
		leave_hook = "on_lord_warlord_intro_leave",
		condition = "lord_intro",
		enter_hook = "on_skaven_warlord_intro_enter",
		action_data = ACTIONS.intro_sequence
	},
	{
		"BTJumpToPositionAction",
		name = "jump_to_position",
		condition = "warlord_jump_down",
		action_data = ACTIONS.jump_to_position
	},
	{
		"BTFallAction",
		condition = "is_falling",
		name = "falling"
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
			condition = "at_climb_smartobject",
			name = "climb"
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
		condition = "at_smartobject",
		name = "smartobject"
	},
	{
		"BTStaggerAction",
		name = "stagger",
		condition = "stagger",
		action_data = ACTIONS.stagger
	},
	{
		"BTIdleAction",
		name = "defensive_idle",
		condition = "should_defensive_idle",
		action_data = ACTIONS.defensive_idle
	},
	{
		"BTSwitchWeaponsAction",
		name = "switch_weapons",
		condition = "switching_weapons",
		action_data = ACTIONS.switch_weapons
	},
	{
		"BTSelector",
		{
			"BTUtilityNode",
			{
				"BTBossFollowAction",
				name = "follow",
				action_data = ACTIONS.follow
			},
			{
				"BTMeleeOverlapAttackAction",
				enter_hook = "on_warlord_disable_blocking",
				name = "dual_combo_attack2",
				action_data = ACTIONS.dual_combo_attack2
			},
			{
				"BTChampionAttackAction",
				enter_hook = "on_warlord_disable_blocking",
				name = "dual_attack_cleave",
				action_data = ACTIONS.dual_attack_cleave
			},
			{
				"BTChampionAttackAction",
				enter_hook = "on_warlord_disable_blocking",
				name = "dual_lunge_attack",
				action_data = ACTIONS.dual_lunge_attack
			},
			name = "dual_wield_combat",
			condition = "warlord_dual_wielding",
			enter_hook = "on_warlord_dual_wield"
		},
		{
			"BTUtilityNode",
			{
				"BTTargetRageAction",
				name = "turn_to_face_target",
				condition = "target_changed",
				action_data = ACTIONS.turn_to_face_target
			},
			{
				"BTSequence",
				{
					"BTChampionAttackAction",
					name = "special_attack_spin_pre_spawn",
					action_data = ACTIONS.special_attack_spin
				},
				{
					"BTSpawnAllies",
					name = "spawn",
					action_data = ACTIONS.spawn_allies
				},
				name = "spawn_sequence",
				action_data = ACTIONS.spawn_sequence
			},
			{
				"BTBossFollowAction",
				name = "follow",
				action_data = ACTIONS.follow
			},
			{
				"BTChampionAttackAction",
				name = "special_running_attack",
				action_data = ACTIONS.special_running_attack
			},
			{
				"BTChampionAttackAction",
				name = "special_lunge_attack",
				action_data = ACTIONS.special_lunge_attack
			},
			{
				"BTRandom",
				{
					"BTChampionAttackAction",
					name = "special_attack_cleave",
					weight = 1,
					action_data = ACTIONS.special_attack_cleave
				},
				{
					"BTChampionAttackAction",
					name = "special_attack_sweep_left",
					weight = 0.5,
					action_data = ACTIONS.special_attack_sweep_left
				},
				{
					"BTChampionAttackAction",
					name = "special_attack_sweep_right",
					weight = 0.5,
					action_data = ACTIONS.special_attack_sweep_right
				},
				name = "special_attack_champion",
				action_data = ACTIONS.special_attack_champion
			},
			{
				"BTChampionAttackAction",
				name = "special_attack_spin",
				action_data = ACTIONS.special_attack_spin
			},
			{
				"BTChampionAttackAction",
				name = "defensive_mode_spin",
				action_data = ACTIONS.defensive_mode_spin
			},
			name = "halberd_combat",
			condition = "warlord_halberding",
			enter_hook = "on_warlord_halberd"
		},
		condition = "can_see_player",
		name = "has_target"
	},
	{
		"BTIdleAction",
		name = "idle"
	},
	name = "storm_vermin_warlord"
}

return 

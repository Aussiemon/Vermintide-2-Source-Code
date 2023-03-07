local ACTIONS = BreedActions.chaos_exalted_sorcerer_drachenfels
BreedBehaviors.chaos_exalted_sorcerer_drachenfels = {
	"BTSelector",
	{
		"BTSpawningAction",
		condition = "spawn",
		name = "spawn"
	},
	{
		"BTSequence",
		{
			"BTDefensiveIdleAction",
			name = "intro_idle",
			leave_hook = "sorcerer_drachenfels_go_defensive",
			action_data = ACTIONS.intro_idle
		},
		name = "intro_sequence",
		leave_hook = "on_drachenfels_sorcerer_intro_leave",
		condition = "lord_intro",
		enter_hook = "on_chaos_exalted_sorcerer_drachenfels_intro_enter",
		action_data = ACTIONS.intro_sequence
	},
	{
		"BTSelector",
		{
			"BTTeleportAction",
			condition = "at_teleport_smartobject",
			name = "teleport"
		},
		{
			"BTChaosSorcererTeleportAction",
			condition = "at_climb_smartobject",
			name = "climb_teleport"
		},
		{
			"BTChaosSorcererTeleportAction",
			condition = "at_jump_smartobject",
			name = "jump_teleport"
		},
		{
			"BTChaosSorcererTeleportAction",
			condition = "at_door_smartobject",
			name = "door_teleport"
		},
		condition = "at_smartobject",
		name = "smartobject"
	},
	{
		"BTSelector",
		{
			"BTSelector",
			{
				"BTSequence",
				{
					"BTSpawnAllies",
					name = "spawn_wave_defensive_intense",
					leave_hook = "sorcerer_next_phase",
					action_data = ACTIONS.spawn_allies_devensive_intense
				},
				name = "defensive_mode_starts",
				condition = "defensive_mode_starts",
				enter_hook = "sorcerer_drachenfels_begin_defensive_mode"
			},
			{
				"BTSequence",
				{
					"BTDefensiveIdleAction",
					name = "defensive_idle",
					action_data = ACTIONS.defensive_idle
				},
				{
					"BTQuickTeleportAction",
					name = "teleport_to_float",
					leave_hook = "sorcerer_drachenfels_go_offensive_intense",
					action_data = ACTIONS.teleport_to_float
				},
				name = "defensive_mode_ends",
				condition = "spawned_allies_dead_or_time",
				enter_hook = "teleport_to_center_drachenfels"
			},
			{
				"BTSelector",
				{
					"BTCastMissileAction",
					enter_hook = "sorcerer_defensive_seeking_bomb",
					name = "defensive_seeking_bomb",
					action_data = ACTIONS.defensive_seeking_bomb
				},
				condition = "sorcerer_defensive_combat",
				name = "smartobject"
			},
			{
				"BTDefensiveIdleAction",
				name = "defensive_idle",
				action_data = ACTIONS.defensive_idle
			},
			condition = "transitioned_one_third_health",
			name = "defensive_mode_third"
		},
		{
			"BTSelector",
			{
				"BTSequence",
				{
					"BTSpawnAllies",
					name = "spawn_wave_defensive",
					leave_hook = "sorcerer_next_phase",
					action_data = ACTIONS.spawn_allies_defensive
				},
				name = "defensive_mode_starts",
				condition = "defensive_mode_starts",
				enter_hook = "sorcerer_drachenfels_begin_defensive_mode"
			},
			{
				"BTSequence",
				{
					"BTDefensiveIdleAction",
					name = "defensive_idle",
					leave_hook = "sorcerer_drachenfels_go_offensive",
					action_data = ACTIONS.defensive_idle
				},
				name = "defensive_mode_ends",
				condition = "spawned_allies_dead_or_time",
				enter_hook = "teleport_to_center_drachenfels"
			},
			{
				"BTSequence",
				{
					"BTCastMissileAction",
					enter_hook = "sorcerer_defensive_seeking_bomb",
					name = "defensive_seeking_bomb",
					action_data = ACTIONS.defensive_seeking_bomb
				},
				condition = "sorcerer_defensive_combat",
				name = "smartobject"
			},
			condition = "transitioned_two_thirds_health",
			name = "defensive_mode_second"
		},
		{
			"BTSelector",
			{
				"BTSequence",
				{
					"BTSpawnAllies",
					name = "spawn_wave_defensive",
					leave_hook = "sorcerer_next_phase",
					action_data = ACTIONS.spawn_allies_defensive
				},
				name = "defensive_mode_starts",
				condition = "defensive_mode_starts",
				enter_hook = "sorcerer_drachenfels_begin_defensive_mode"
			},
			{
				"BTSequence",
				{
					"BTDefensiveIdleAction",
					name = "defensive_idle",
					leave_hook = "sorcerer_drachenfels_go_offensive",
					action_data = ACTIONS.defensive_idle
				},
				name = "defensive_mode_ends",
				condition = "spawned_allies_dead_or_time",
				enter_hook = "teleport_to_center_drachenfels"
			},
			{
				"BTSequence",
				{
					"BTCastMissileAction",
					enter_hook = "sorcerer_defensive_seeking_bomb",
					name = "defensive_seeking_bomb",
					action_data = ACTIONS.defensive_seeking_bomb
				},
				condition = "sorcerer_defensive_combat",
				name = "smartobject"
			},
			name = "defensive_mode_first"
		},
		condition = "sorcerer_in_defensive_mode",
		name = "defensive_mode"
	},
	{
		"BTSelector",
		{
			"BTSelector",
			{
				"BTSequence",
				{
					"BTQuickTeleportAction",
					enter_hook = "drop_items",
					name = "teleport_to_death",
					action_data = ACTIONS.teleport_to_death
				},
				{
					"BTChampionAttackAction",
					name = "death_explosion",
					leave_hook = "unclamp_health",
					action_data = ACTIONS.death_explosion
				},
				leave_hook = "kill_unit",
				name = "death_sequence",
				condition = "less_than_one_health",
				enter_hook = "teleport_to_center_drachenfels"
			},
			{
				"BTUtilityNode",
				{
					"BTSequence",
					{
						"BTSpawnAllies",
						name = "spawn_allies_trickle",
						enter_hook = "trickle_spawn_drachenfels",
						action_data = ACTIONS.spawn_allies_trickle
					},
					name = "ring_spawn",
					condition = "sorcerer_allow_tricke_spawn",
					action_data = ACTIONS.ring_spawn
				},
				{
					"BTBossFollowAction",
					name = "follow",
					action_data = ACTIONS.follow
				},
				{
					"BTMeleeOverlapAttackAction",
					name = "swing_floating",
					action_data = ACTIONS.swing_floating
				},
				{
					"BTMeleeOverlapAttackAction",
					name = "combo_attack",
					action_data = ACTIONS.combo_attack
				},
				name = "combat"
			},
			condition = "transitioned_one_third_health",
			name = "final offense phase"
		},
		{
			"BTSelector",
			{
				"BTSequence",
				{
					"BTQuickTeleportAction",
					name = "defensive_teleport_init_p3",
					leave_hook = "sorcerer_drachenfels_re_enter_defensive",
					action_data = ACTIONS.defensive_escape_teleport
				},
				leave_hook = "transition_at_one_third",
				name = "back_to_defensive",
				condition = "can_transition_one_third_health",
				enter_hook = "sorcerer_drachenfels_re_enter_defensive_mode"
			},
			{
				"BTSequence",
				{
					"BTQuickTeleportAction",
					name = "defensive_teleport_init_p2",
					leave_hook = "sorcerer_drachenfels_re_enter_defensive",
					action_data = ACTIONS.defensive_escape_teleport
				},
				leave_hook = "transition_at_two_thirds",
				name = "back_to_defensive",
				condition = "can_transition_two_thirds_health",
				enter_hook = "sorcerer_drachenfels_re_enter_defensive_mode"
			},
			{
				"BTSequence",
				{
					"BTQuickTeleportAction",
					name = "defensive_teleport_p1",
					action_data = ACTIONS.teleport_to_aoe
				},
				{
					"BTChaosSorcererSummoningAction",
					name = "spawn_boss_rings_1",
					action_data = ACTIONS.spawn_boss_rings_1
				},
				{
					"BTDefensiveIdleAction",
					name = "exhausted_idle",
					leave_hook = "ring_summoning_ends",
					action_data = ACTIONS.exhausted_idle
				},
				name = "summon_rings",
				condition = "first_ring_summon",
				enter_hook = "teleport_to_center_drachenfels"
			},
			{
				"BTSequence",
				{
					"BTQuickTeleportAction",
					name = "defensive_teleport_p1",
					action_data = ACTIONS.teleport_to_aoe
				},
				{
					"BTRandom",
					{
						"BTChaosSorcererSummoningAction",
						name = "spawn_boss_rings_1",
						weight = 1,
						action_data = ACTIONS.spawn_boss_rings_1
					},
					{
						"BTChaosSorcererSummoningAction",
						name = "spawn_boss_rings_2",
						weight = 5,
						action_data = ACTIONS.spawn_boss_rings_2
					},
					{
						"BTChaosSorcererSummoningAction",
						name = "spawn_boss_rings_3",
						weight = 5,
						action_data = ACTIONS.spawn_boss_rings_3
					},
					{
						"BTChaosSorcererSummoningAction",
						name = "spawn_boss_rings_5",
						weight = 5,
						action_data = ACTIONS.spawn_boss_rings_5
					},
					name = "random_ring_summon"
				},
				{
					"BTDefensiveIdleAction",
					name = "exhausted_idle",
					action_data = ACTIONS.exhausted_idle
				},
				leave_hook = "ring_summoning_ends",
				name = "defensive_mode_ends",
				condition = "ready_to_summon_rings",
				enter_hook = "teleport_to_center_drachenfels"
			},
			{
				"BTUtilityNode",
				{
					"BTChampionAttackAction",
					name = "retaliation_aoe",
					action_data = ACTIONS.retaliation_aoe
				},
				{
					"BTStormVerminAttackAction",
					name = "overhead_downed",
					condition = "ask_target_before_attacking",
					action_data = ACTIONS.overhead_downed
				},
				{
					"BTStormVerminAttackAction",
					name = "cleave_downed",
					condition = "ask_target_before_attacking",
					action_data = ACTIONS.cleave_downed
				},
				{
					"BTSequence",
					{
						"BTQuickTeleportAction",
						enter_hook = "quick_teleport",
						name = "quick_teleport",
						leave_hook = "teleport_ends",
						action_data = ACTIONS.quick_teleport
					},
					{
						"BTSpawnAllies",
						name = "spawn_wave_offensive",
						enter_hook = "teleport_spawn_sequence_drachenfels",
						action_data = ACTIONS.spawn_allies_offensive
					},
					name = "spawn_trickle",
					action_data = ACTIONS.spawn_trickle
				},
				{
					"BTCastMissileAction",
					name = "defensive_magic_missile",
					action_data = ACTIONS.defensive_magic_missile
				},
				name = "attack_and_teleport"
			},
			name = "first offensive phase"
		},
		condition = "can_see_player",
		name = "has_target"
	},
	{
		"BTIdleAction",
		name = "idle"
	},
	name = "chaos_exalted_sorcerer_drachenfels"
}

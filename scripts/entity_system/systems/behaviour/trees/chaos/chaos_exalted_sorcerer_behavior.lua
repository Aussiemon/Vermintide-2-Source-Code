-- chunkname: @scripts/entity_system/systems/behaviour/trees/chaos/chaos_exalted_sorcerer_behavior.lua

local ACTIONS = BreedActions.chaos_exalted_sorcerer

BreedBehaviors.chaos_exalted_sorcerer = {
	"BTSelector",
	{
		"BTSpawningAction",
		condition = "spawn",
		name = "spawn",
	},
	{
		"BTSelector",
		action_data = ACTIONS.intro_sequence,
		{
			"BTQuickTeleportAction",
			condition = "quick_teleport",
			name = "defensive_teleport",
			action_data = ACTIONS.defensive_teleport,
		},
		{
			"BTDefensiveIdleAction",
			name = "intro_idle",
			action_data = ACTIONS.intro_idle,
		},
		condition = "lord_intro",
		enter_hook = "on_chaos_exalted_sorcerer_intro_enter",
		leave_hook = "on_lord_intro_leave",
		name = "intro_sequence",
	},
	{
		"BTFallAction",
		condition = "is_falling",
		name = "falling",
	},
	{
		"BTStaggerAction",
		condition = "stagger",
		enter_hook = "block_stagger_start",
		name = "stagger",
		action_data = ACTIONS.stagger,
	},
	{
		"BTSelector",
		{
			"BTTeleportAction",
			condition = "at_teleport_smartobject",
			name = "teleport",
		},
		{
			"BTChaosSorcererTeleportAction",
			condition = "at_climb_smartobject",
			name = "climb_teleport",
		},
		{
			"BTChaosSorcererTeleportAction",
			condition = "at_jump_smartobject",
			name = "jump_teleport",
		},
		{
			"BTChaosSorcererTeleportAction",
			condition = "at_door_smartobject",
			name = "door_teleport",
		},
		condition = "at_smartobject",
		name = "smartobject",
	},
	{
		"BTSequence",
		{
			"BTQuickTeleportAction",
			name = "defensive_teleport",
			action_data = ACTIONS.defensive_teleport,
		},
		{
			"BTChaosSorcererSummoningAction",
			leave_hook = "sorcerer_setup_done",
			name = "spawn_flower_wave",
			action_data = ACTIONS.spawn_flower_wave,
		},
		condition = "sorcerer_in_setup_mode",
		enter_hook = "teleport_to_center",
		name = "setup_mode",
	},
	{
		"BTSelector",
		{
			"BTSequence",
			{
				"BTQuickTeleportAction",
				name = "defensive_teleport",
				action_data = ACTIONS.defensive_teleport,
			},
			{
				"BTSpawnAllies",
				leave_hook = "sorcerer_next_phase",
				name = "spawn_wave",
				action_data = ACTIONS.spawn_allies,
			},
			condition = "defensive_mode_starts",
			enter_hook = "sorcerer_begin_defensive_mode",
			name = "defensive_mode_starts",
		},
		{
			"BTSelector",
			{
				"BTQuickTeleportAction",
				condition = "escape_teleport",
				enter_hook = "sorcerer_evade",
				leave_hook = "sorcerer_evade",
				name = "defensive_escape_teleport",
				action_data = ACTIONS.defensive_escape_teleport,
			},
			{
				"BTUtilityNode",
				{
					"BTCastMissileAction",
					enter_hook = "sorcerer_defensive_seeking_bomb",
					name = "defensive_seeking_bomb",
					action_data = ACTIONS.defensive_seeking_bomb,
				},
				{
					"BTCastMissileAction",
					name = "defensive_magic_missile",
					action_data = ACTIONS.defensive_magic_missile,
				},
				{
					"BTDefensiveIdleAction",
					name = "defensive_idle",
					action_data = ACTIONS.defensive_idle,
				},
				condition = "sorcerer_defensive_combat",
				name = "sorcerer_defensive_combat",
			},
			condition = "sorcerer_defensive_combat",
			name = "smartobject",
		},
		{
			"BTSequence",
			{
				"BTSpawnAllies",
				enter_hook = "sorcerer_spawn_horde",
				name = "spawn_allies_horde",
				action_data = ACTIONS.spawn_allies_horde,
			},
			{
				"BTQuickTeleportAction",
				name = "defensive_teleport",
				action_data = ACTIONS.defensive_teleport,
			},
			{
				"BTRandom",
				action_data = ACTIONS.mega_attack,
				{
					"BTChaosSorcererSummoningAction",
					name = "spawn_flower_wave",
					weight = 1,
					action_data = ACTIONS.spawn_flower_wave,
				},
				{
					"BTChaosSorcererSummoningAction",
					name = "spawn_boss_vortex",
					weight = 1,
					action_data = ACTIONS.spawn_boss_vortex,
				},
				name = "mega_attack",
			},
			{
				"BTDefensiveIdleAction",
				leave_hook = "sorcerer_next_phase",
				name = "defensive_idle",
				action_data = ACTIONS.defensive_idle,
			},
			condition = "defensive_mode_ends",
			enter_hook = "teleport_to_center",
			name = "defensive_mode_ends",
		},
		condition = "sorcerer_in_defensive_mode",
		name = "defensive_mode",
	},
	{
		"BTQuickTeleportAction",
		condition = "quick_teleport",
		name = "quick_teleport",
		action_data = ACTIONS.quick_teleport,
	},
	{
		"BTSelector",
		{
			"BTSelector",
			{
				"BTChaosSorcererSummoningAction",
				condition = "ready_to_summon_plague_wave",
				name = "spawn_multiple_wave",
				action_data = ACTIONS.spawn_multiple_wave,
			},
			{
				"BTCastMissileAction",
				condition = "ready_to_cast_missile",
				name = "cast_missile",
				action_data = ACTIONS.cast_missile,
			},
			{
				"BTCastMissileAction",
				condition = "ready_to_cast_seeking_bomb_missile",
				name = "cast_seeking_bomb_missile",
				action_data = ACTIONS.cast_seeking_bomb_missile,
			},
			condition = "ready_to_summon",
			enter_hook = "summoning_starts",
			leave_hook = "summoning_ends",
			name = "ready_to_summon",
		},
		{
			"BTUtilityNode",
			{
				"BTChaosExaltedSorcererSkulkAction",
				name = "plague_wave_skulking",
				action_data = ACTIONS.plague_wave_skulking,
			},
			{
				"BTChaosExaltedSorcererSkulkAction",
				name = "magic_missile_skulking",
				action_data = ACTIONS.magic_missile_skulking,
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
	name = "chaos_exalted_sorcerer",
}

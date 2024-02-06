-- chunkname: @scripts/entity_system/systems/behaviour/trees/skaven/skaven_grey_seer_behavior.lua

local ACTIONS = BreedActions.skaven_grey_seer

BreedBehaviors.grey_seer = {
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
			"BTDummyIdleAction",
			enter_hook = "to_combat",
			name = "intro_idle",
			action_data = ACTIONS.intro_idle,
		},
		condition = "lord_intro",
		enter_hook = "on_grey_seer_intro_enter",
		leave_hook = "on_grey_seer_intro_leave",
		name = "intro_sequence",
	},
	{
		"BTMountUnitAction",
		condition = "should_mount_unit",
		name = "mount_unit",
		action_data = ACTIONS.mount_unit,
	},
	{
		"BTIdleAction",
		condition = "grey_seer_waiting_for_pickup",
		name = "waiting_for_pickup_idle",
	},
	{
		"BTGreySeerMountedAction",
		condition = "is_mounted",
		name = "mounted_combat",
	},
	{
		"BTDummyIdleAction",
		condition = "grey_seer_waiting_death",
		name = "wounded_idle",
		action_data = ACTIONS.wounded_idle,
	},
	{
		"BTSequence",
		action_data = ACTIONS.grey_seer_death_sequence,
		{
			"BTQuickTeleportAction",
			enter_hook = "grey_seer_death_sequence_teleport",
			name = "quick_teleport",
			action_data = ACTIONS.quick_teleport_death,
		},
		{
			"BTQuickTeleportAction",
			enter_hook = "grey_seer_death_sequence_teleport",
			name = "quick_teleport",
			action_data = ACTIONS.quick_teleport_death,
		},
		{
			"BTQuickTeleportAction",
			enter_hook = "grey_seer_death_sequence_teleport",
			name = "quick_teleport",
			action_data = ACTIONS.quick_teleport_death,
		},
		{
			"BTQuickTeleportAction",
			enter_hook = "grey_seer_death_sequence_teleport",
			name = "quick_teleport",
			action_data = ACTIONS.quick_teleport_death,
		},
		{
			"BTQuickTeleportAction",
			enter_hook = "grey_seer_death_sequence_teleport",
			name = "quick_teleport",
			action_data = ACTIONS.quick_teleport_death,
		},
		{
			"BTQuickTeleportAction",
			enter_hook = "grey_seer_death_sequence_teleport",
			name = "quick_teleport",
			action_data = ACTIONS.quick_teleport_death,
		},
		{
			"BTQuickTeleportAction",
			enter_hook = "grey_seer_death_sequence_teleport",
			name = "quick_teleport",
			action_data = ACTIONS.quick_teleport_death,
		},
		{
			"BTQuickTeleportAction",
			enter_hook = "grey_seer_death_sequence_teleport",
			name = "quick_teleport",
			action_data = ACTIONS.quick_teleport_death,
		},
		{
			"BTQuickTeleportAction",
			enter_hook = "grey_seer_death_sequence_teleport",
			name = "quick_teleport",
			action_data = ACTIONS.quick_teleport_death,
		},
		{
			"BTQuickTeleportAction",
			enter_hook = "grey_seer_death_sequence_teleport",
			leave_hook = "on_grey_seer_death_sequence_leave",
			name = "quick_teleport",
			action_data = ACTIONS.quick_teleport_death,
		},
		condition = "grey_seer_death",
		name = "grey_seer_death_sequence",
	},
	{
		"BTSequence",
		{
			"BTQuickTeleportAction",
			enter_hook = "grey_seer_call_stormfiend_enter",
			name = "quick_teleport",
			action_data = ACTIONS.quick_teleport,
		},
		{
			"BTIdleAction",
			name = "defensive_idle",
			action_data = ACTIONS.defensive_idle,
		},
		condition = "grey_seer_call_stormfiend",
		name = "grey_seer_call_stormfiend",
	},
	{
		"BTStaggerAction",
		condition = "grey_seer_stagger",
		enter_hook = "grey_seer_stagger_enter",
		name = "stagger",
		action_data = ACTIONS.stagger,
	},
	{
		"BTSelector",
		{
			"BTQuickTeleportAction",
			condition = "grey_seer_teleport_spell",
			name = "quick_teleport",
			action_data = ACTIONS.quick_teleport,
		},
		{
			"BTChaosSorcererSummoningAction",
			condition = "grey_seer_vermintide_spell",
			name = "spawn_plague_wave",
			action_data = ACTIONS.spawn_plague_wave,
		},
		{
			"BTCastMissileAction",
			condition = "grey_seer_warp_lightning_spell",
			name = "cast_missile",
			action_data = ACTIONS.cast_missile,
		},
		condition = "ready_to_cast_spell",
		name = "spell_casting",
	},
	{
		"BTGreySeerGroundCombatAction",
		condition = "knocked_off_mount",
		name = "ground_combat",
		action_data = ACTIONS.ground_combat,
	},
	{
		"BTIdleAction",
		name = "defensive_idle",
		action_data = ACTIONS.defensive_idle,
	},
	{
		"BTIdleAction",
		name = "idle",
	},
	name = "grey_seer",
}

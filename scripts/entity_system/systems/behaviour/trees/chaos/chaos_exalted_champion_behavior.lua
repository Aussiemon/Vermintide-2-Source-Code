local ACTIONS = BreedActions.chaos_exalted_champion
local CHAOS_EXALTED_CHAMPION_WARCAMP_COMBAT = {
	"BTUtilityNode",
	{
		"BTSequence",
		{
			"BTChampionAttackAction",
			name = "special_attack_aoe",
			action_data = ACTIONS.special_attack_aoe_defensive
		},
		{
			"BTSpawnAllies",
			name = "spawn_allies",
			action_data = ACTIONS.spawn_allies
		},
		name = "spawn_sequence",
		action_data = ACTIONS.spawn_sequence
	},
	{
		"BTSequence",
		{
			"BTMeleeOverlapAttackAction",
			name = "angry_charge",
			action_data = ACTIONS.angry_charge
		},
		{
			"BTMeleeOverlapAttackAction",
			name = "angry_charge",
			action_data = ACTIONS.angry_charge
		},
		{
			"BTMeleeOverlapAttackAction",
			name = "angry_charge",
			action_data = ACTIONS.angry_charge
		},
		name = "angry_charge_sequence",
		action_data = ACTIONS.angry_charge_sequence
	},
	{
		"BTClanRatFollowAction",
		name = "follow",
		action_data = ACTIONS.follow
	},
	{
		"BTThrowWeaponAction",
		name = "throw_weapon",
		action_data = ACTIONS.throw_weapon
	},
	{
		"BTMeleeOverlapAttackAction",
		name = "charge",
		action_data = ACTIONS.charge
	},
	{
		"BTChampionAttackAction",
		name = "special_attack_aoe",
		action_data = ACTIONS.special_attack_aoe
	},
	{
		"BTStormVerminAttackAction",
		enter_hook = "keep_target",
		name = "special_attack_cleave",
		leave_hook = "reset_keep_target",
		action_data = ACTIONS.special_attack_cleave
	},
	{
		"BTStormVerminAttackAction",
		name = "special_attack_sweep",
		action_data = ACTIONS.special_attack_sweep
	},
	{
		"BTStormVerminAttackAction",
		name = "special_attack_launch",
		action_data = ACTIONS.special_attack_launch
	},
	{
		"BTStormVerminAttackAction",
		name = "special_attack_kick",
		action_data = ACTIONS.special_attack_kick
	},
	condition = "can_see_player",
	name = "in_combat"
}
local CHAOS_EXALTED_CHAMPION_WARCAMP_DEFENSIVE = {
	"BTUtilityNode",
	{
		"BTChampionAttackAction",
		name = "special_attack_aoe_defensive",
		action_data = ACTIONS.special_attack_aoe_defensive
	},
	{
		"BTThrowWeaponAction",
		name = "throw_weapon",
		action_data = ACTIONS.throw_weapon
	},
	{
		"BTStormVerminAttackAction",
		name = "special_attack_launch_defensive",
		action_data = ACTIONS.special_attack_launch_defensive
	},
	{
		"BTStormVerminAttackAction",
		name = "special_attack_kick",
		action_data = ACTIONS.special_attack_kick
	},
	condition = "should_be_defensive",
	name = "in_defensive"
}
local CHAOS_EXALTED_CHAMPION_NORSCA_COMBAT = {
	"BTUtilityNode",
	{
		"BTClanRatFollowAction",
		name = "follow",
		action_data = ACTIONS.follow
	},
	{
		"BTMeleeOverlapAttackAction",
		name = "charge",
		action_data = ACTIONS.charge
	},
	{
		"BTStormVerminAttackAction",
		name = "special_attack_cleave",
		action_data = ACTIONS.special_attack_cleave
	},
	{
		"BTStormVerminAttackAction",
		name = "special_attack_sweep",
		action_data = ACTIONS.special_attack_sweep
	},
	{
		"BTStormVerminAttackAction",
		name = "special_attack_launch",
		action_data = ACTIONS.special_attack_launch
	},
	condition = "can_see_player",
	name = "in_combat"
}
local CHAOS_EXALTED_CHAMPION_SMART_OBJECT = {
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
}
BreedBehaviors.chaos_exalted_champion_warcamp = {
	"BTSelector",
	{
		"BTSpawningAction",
		condition = "spawn",
		name = "spawn"
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
		leave_hook = "on_lord_intro_leave",
		condition = "lord_intro",
		enter_hook = "on_chaos_exalted_champion_intro_enter",
		action_data = ACTIONS.intro_sequence
	},
	{
		"BTFallAction",
		condition = "is_falling",
		name = "falling"
	},
	{
		"BTStaggerAction",
		name = "stagger",
		condition = "stagger",
		action_data = ACTIONS.stagger
	},
	CHAOS_EXALTED_CHAMPION_SMART_OBJECT,
	CHAOS_EXALTED_CHAMPION_WARCAMP_DEFENSIVE,
	CHAOS_EXALTED_CHAMPION_WARCAMP_COMBAT,
	{
		"BTIdleAction",
		name = "defensive_idle",
		action_data = ACTIONS.defensive_idle
	},
	{
		"BTIdleAction",
		condition = "no_target",
		name = "idle"
	},
	{
		"BTFallbackIdleAction",
		name = "fallback_idle"
	},
	name = "horde"
}
BreedBehaviors.chaos_exalted_champion_norsca = {
	"BTSelector",
	{
		"BTSpawningAction",
		condition = "spawn",
		name = "spawn"
	},
	{
		"BTFallAction",
		condition = "is_falling",
		name = "falling"
	},
	{
		"BTStaggerAction",
		name = "stagger",
		condition = "stagger",
		action_data = ACTIONS.stagger
	},
	{
		"BTTransformAction",
		name = "transform",
		condition = "boss_phase_two",
		action_data = ACTIONS.transform
	},
	CHAOS_EXALTED_CHAMPION_SMART_OBJECT,
	CHAOS_EXALTED_CHAMPION_NORSCA_COMBAT,
	{
		"BTIdleAction",
		condition = "no_target",
		name = "idle"
	},
	{
		"BTFallbackIdleAction",
		name = "fallback_idle"
	},
	name = "horde"
}

return 

local ACTIONS = BreedActions.chaos_raider
local CHAOS_RAIDER_COMBAT = {
	"BTUtilityNode",
	{
		"BTClanRatFollowAction",
		name = "follow",
		action_data = ACTIONS.follow
	},
	{
		"BTStormVerminAttackAction",
		name = "running_attack",
		condition = "ask_target_before_attacking",
		action_data = ACTIONS.running_attack
	},
	{
		"BTRandom",
		{
			"BTStormVerminAttackAction",
			weight = 1,
			name = "running_special_attack_sweep",
			condition = "ask_target_before_attacking",
			action_data = ACTIONS.special_attack_sweep
		},
		{
			"BTStormVerminAttackAction",
			weight = 1,
			name = "running_special_attack_cleave",
			condition = "ask_target_before_attacking",
			action_data = ACTIONS.special_attack_cleave
		},
		name = "moving_attack",
		action_data = ACTIONS.moving_attack
	},
	{
		"BTRandom",
		{
			"BTStormVerminAttackAction",
			weight = 1,
			name = "special_attack_cleave",
			condition = "ask_target_before_attacking",
			action_data = ACTIONS.special_attack_cleave
		},
		{
			"BTStormVerminAttackAction",
			weight = 1,
			name = "special_attack_sweep",
			condition = "ask_target_before_attacking",
			action_data = ACTIONS.special_attack_sweep
		},
		name = "special_attack",
		action_data = ACTIONS.special_attack
	},
	{
		"BTStormVerminPushAction",
		name = "push_attack",
		action_data = ACTIONS.push_attack
	},
	condition = "confirmed_player_sighting",
	name = "in_combat"
}
local CHAOS_RAIDER_SMART_OBJECT = {
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
BreedBehaviors.raider = {
	"BTSelector",
	{
		"BTSpawningAction",
		condition = "spawn",
		name = "spawn"
	},
	{
		"BTInVortexAction",
		condition = "in_vortex",
		name = "in_vortex"
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
		"BTBlockedAction",
		name = "blocked",
		condition = "blocked",
		action_data = ACTIONS.blocked
	},
	CHAOS_RAIDER_SMART_OBJECT,
	CHAOS_RAIDER_COMBAT,
	{
		"BTAlertedAction",
		name = "alerted",
		condition = "player_spotted",
		action_data = ACTIONS.alerted
	},
	{
		"BTMoveToGoalAction",
		name = "move_to_goal",
		condition = "has_goal_destination",
		action_data = ACTIONS.follow
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
BreedBehaviors.raider_tutorial = {
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
		"BTBlockedAction",
		name = "blocked",
		condition = "blocked",
		action_data = ACTIONS.blocked
	},
	CHAOS_RAIDER_SMART_OBJECT,
	{
		"BTUtilityNode",
		{
			"BTClanRatFollowAction",
			name = "follow",
			action_data = ACTIONS.follow
		},
		{
			"BTStormVerminAttackAction",
			weight = 1,
			name = "special_attack_cleave_tutorial",
			condition = "ask_target_before_attacking",
			action_data = ACTIONS.special_attack_cleave_tutorial
		},
		condition = "confirmed_player_sighting",
		name = "in_combat"
	},
	{
		"BTAlertedAction",
		name = "alerted",
		condition = "player_spotted",
		action_data = ACTIONS.alerted
	},
	{
		"BTMoveToGoalAction",
		name = "move_to_goal",
		condition = "has_goal_destination",
		action_data = ACTIONS.follow
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

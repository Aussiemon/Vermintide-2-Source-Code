local ACTIONS = BreedActions.skaven_storm_vermin
local ACTIONS_SHIELD = BreedActions.skaven_storm_vermin_with_shield
local STORM_VERMIN_COMBAT_DESTRUCTIBLE_STATIC = {
	"BTSelector",
	{
		"BTClanRatFollowAction",
		name = "move_to_destructible",
		action_data = ACTIONS.follow
	},
	{
		"BTStormVerminAttackAction",
		name = "cleave_destructible",
		action_data = ACTIONS.special_attack_cleave
	},
	condition = "has_destructible_as_target",
	name = "combat_destructible"
}
local STORM_VERMIN_COMBAT = {
	"BTUtilityNode",
	{
		"BTClanRatFollowAction",
		name = "follow",
		action_data = ACTIONS.follow
	},
	{
		"BTRandom",
		{
			"BTStormVerminAttackAction",
			name = "running_special_attack_sweep",
			weight = 1,
			action_data = ACTIONS.special_attack_sweep
		},
		name = "running_attack",
		action_data = ACTIONS.running_attack
	},
	{
		"BTRandom",
		{
			"BTStormVerminAttackAction",
			name = "special_attack_cleave",
			weight = 1,
			action_data = ACTIONS.special_attack_cleave
		},
		{
			"BTStormVerminAttackAction",
			name = "special_attack_sweep",
			weight = 1,
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
	{
		"BTCombatShoutAction",
		name = "combat_shout",
		action_data = ACTIONS.combat_shout
	},
	condition = "confirmed_player_sighting",
	name = "in_combat"
}
local STORM_VERMIN_SHIELD_COMBAT = {
	"BTUtilityNode",
	{
		"BTClanRatFollowAction",
		name = "follow",
		action_data = ACTIONS_SHIELD.follow
	},
	{
		"BTRandom",
		{
			"BTStormVerminAttackAction",
			name = "special_attack_sweep",
			weight = 1,
			action_data = ACTIONS_SHIELD.special_attack_sweep
		},
		name = "special_attack",
		action_data = ACTIONS_SHIELD.special_attack
	},
	{
		"BTStormVerminPushAction",
		name = "push_attack",
		action_data = ACTIONS_SHIELD.push_attack
	},
	{
		"BTStormVerminPushAction",
		name = "push_attack_wake_up",
		action_data = ACTIONS_SHIELD.push_attack_wake_up
	},
	{
		"BTComboAttackAction",
		name = "frenzy_attack_ranged",
		action_data = ACTIONS_SHIELD.frenzy_attack_ranged
	},
	{
		"BTComboAttackAction",
		name = "frenzy_attack",
		action_data = ACTIONS_SHIELD.frenzy_attack
	},
	{
		"BTCombatShoutAction",
		name = "combat_shout",
		action_data = ACTIONS_SHIELD.combat_shout
	},
	condition = "confirmed_player_sighting",
	name = "in_combat"
}
local STORM_VERMIN_SMART_OBJECT = {
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
BreedBehaviors.storm_vermin = {
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
	STORM_VERMIN_SMART_OBJECT,
	STORM_VERMIN_COMBAT,
	{
		"BTMoveToGoalAction",
		name = "move_to_goal",
		condition = "has_goal_destination",
		action_data = ACTIONS.follow
	},
	{
		"BTAlertedAction",
		name = "alerted",
		condition = "player_spotted",
		action_data = ACTIONS.alerted
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
	name = "storm_vermin"
}
BreedBehaviors.storm_vermin_commander = {
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
	STORM_VERMIN_SMART_OBJECT,
	STORM_VERMIN_COMBAT_DESTRUCTIBLE_STATIC,
	STORM_VERMIN_COMBAT,
	{
		"BTMoveToGoalAction",
		name = "move_to_goal",
		condition = "has_goal_destination",
		action_data = ACTIONS.follow
	},
	{
		"BTAlertedAction",
		name = "alerted",
		condition = "player_spotted",
		action_data = ACTIONS.alerted
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
BreedBehaviors.horde_vermin = {
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
	STORM_VERMIN_SMART_OBJECT,
	STORM_VERMIN_COMBAT_DESTRUCTIBLE_STATIC,
	STORM_VERMIN_COMBAT,
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
BreedBehaviors.shield_vermin = {
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
		action_data = ACTIONS_SHIELD.stagger
	},
	{
		"BTBlockedAction",
		name = "blocked",
		condition = "blocked",
		action_data = ACTIONS_SHIELD.blocked
	},
	STORM_VERMIN_SMART_OBJECT,
	STORM_VERMIN_SHIELD_COMBAT,
	{
		"BTMoveToGoalAction",
		name = "move_to_goal",
		condition = "has_goal_destination",
		action_data = ACTIONS_SHIELD.follow
	},
	{
		"BTAlertedAction",
		name = "alerted",
		condition = "player_spotted",
		action_data = ACTIONS_SHIELD.alerted
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
	name = "shield_vermin"
}

return

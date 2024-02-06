-- chunkname: @scripts/entity_system/systems/behaviour/trees/skaven/skaven_storm_vermin_behavior.lua

local ACTIONS = BreedActions.skaven_storm_vermin
local ACTIONS_SHIELD = BreedActions.skaven_storm_vermin_with_shield
local STORM_VERMIN_COMBAT_DESTRUCTIBLE_STATIC = {
	"BTSelector",
	{
		"BTClanRatFollowAction",
		name = "move_to_destructible",
		action_data = ACTIONS.follow,
	},
	{
		"BTStormVerminAttackAction",
		name = "cleave_destructible",
		action_data = ACTIONS.special_attack_cleave,
	},
	condition = "has_destructible_as_target",
	name = "combat_destructible",
}
local STORM_VERMIN_COMBAT = {
	"BTUtilityNode",
	{
		"BTClanRatFollowAction",
		name = "follow",
		action_data = ACTIONS.follow,
	},
	{
		"BTRandom",
		action_data = ACTIONS.running_attack,
		{
			"BTStormVerminAttackAction",
			condition = "ask_target_before_attacking",
			name = "running_special_attack_sweep",
			weight = 1,
			action_data = ACTIONS.special_attack_sweep,
		},
		name = "running_attack",
	},
	{
		"BTRandom",
		action_data = ACTIONS.special_attack,
		{
			"BTStormVerminAttackAction",
			condition = "ask_target_before_attacking",
			name = "special_attack_cleave",
			weight = 1,
			action_data = ACTIONS.special_attack_cleave,
		},
		{
			"BTStormVerminAttackAction",
			condition = "ask_target_before_attacking",
			name = "special_attack_sweep",
			weight = 1,
			action_data = ACTIONS.special_attack_sweep,
		},
		name = "special_attack",
	},
	{
		"BTStormVerminPushAction",
		condition = "ask_target_before_attacking",
		name = "push_attack",
		action_data = ACTIONS.push_attack,
	},
	{
		"BTCombatShoutAction",
		name = "combat_shout",
		action_data = ACTIONS.combat_shout,
	},
	condition = "confirmed_player_sighting",
	name = "in_combat",
}
local STORM_VERMIN_SHIELD_COMBAT = {
	"BTUtilityNode",
	{
		"BTClanRatFollowAction",
		name = "follow",
		action_data = ACTIONS_SHIELD.follow,
	},
	{
		"BTRandom",
		action_data = ACTIONS_SHIELD.special_attack,
		{
			"BTStormVerminAttackAction",
			condition = "ask_target_before_attacking",
			name = "special_attack_sweep",
			weight = 1,
			action_data = ACTIONS_SHIELD.special_attack_sweep,
		},
		name = "special_attack",
	},
	{
		"BTStormVerminPushAction",
		condition = "ask_target_before_attacking",
		name = "push_attack",
		action_data = ACTIONS_SHIELD.push_attack,
	},
	{
		"BTStormVerminPushAction",
		condition = "ask_target_before_attacking",
		name = "push_attack_wake_up",
		action_data = ACTIONS_SHIELD.push_attack_wake_up,
	},
	{
		"BTComboAttackAction",
		condition = "ask_target_before_attacking",
		name = "frenzy_attack_ranged",
		action_data = ACTIONS_SHIELD.frenzy_attack_ranged,
	},
	{
		"BTComboAttackAction",
		condition = "ask_target_before_attacking",
		name = "frenzy_attack",
		action_data = ACTIONS_SHIELD.frenzy_attack,
	},
	{
		"BTCombatShoutAction",
		name = "combat_shout",
		action_data = ACTIONS_SHIELD.combat_shout,
	},
	condition = "confirmed_player_sighting",
	name = "in_combat",
}
local STORM_VERMIN_SMART_OBJECT = {
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
}

BreedBehaviors.storm_vermin = {
	"BTSelector",
	{
		"BTSpawningAction",
		condition = "spawn",
		name = "spawn",
	},
	{
		"BTInVortexAction",
		condition = "in_vortex",
		name = "in_vortex",
	},
	{
		"BTFallAction",
		condition = "is_falling",
		name = "falling",
	},
	{
		"BTStaggerAction",
		condition = "stagger",
		name = "stagger",
		action_data = ACTIONS.stagger,
	},
	{
		"BTBlockedAction",
		condition = "blocked",
		name = "blocked",
		action_data = ACTIONS.blocked,
	},
	STORM_VERMIN_SMART_OBJECT,
	STORM_VERMIN_COMBAT,
	{
		"BTMoveToGoalAction",
		condition = "has_goal_destination",
		name = "move_to_goal",
		action_data = ACTIONS.follow,
	},
	{
		"BTAlertedAction",
		condition = "player_spotted",
		name = "alerted",
		action_data = ACTIONS.alerted,
	},
	{
		"BTIdleAction",
		condition = "no_target",
		name = "idle",
	},
	{
		"BTFallbackIdleAction",
		name = "fallback_idle",
	},
	name = "storm_vermin",
}
BreedBehaviors.storm_vermin_commander = {
	"BTSelector",
	{
		"BTSpawningAction",
		condition = "spawn",
		name = "spawn",
	},
	{
		"BTInVortexAction",
		condition = "in_vortex",
		name = "in_vortex",
	},
	{
		"BTFallAction",
		condition = "is_falling",
		name = "falling",
	},
	{
		"BTStaggerAction",
		condition = "stagger",
		name = "stagger",
		action_data = ACTIONS.stagger,
	},
	{
		"BTBlockedAction",
		condition = "blocked",
		name = "blocked",
		action_data = ACTIONS.blocked,
	},
	STORM_VERMIN_SMART_OBJECT,
	STORM_VERMIN_COMBAT_DESTRUCTIBLE_STATIC,
	STORM_VERMIN_COMBAT,
	{
		"BTMoveToGoalAction",
		condition = "has_goal_destination",
		name = "move_to_goal",
		action_data = ACTIONS.follow,
	},
	{
		"BTAlertedAction",
		condition = "player_spotted",
		name = "alerted",
		action_data = ACTIONS.alerted,
	},
	{
		"BTIdleAction",
		condition = "no_target",
		name = "idle",
	},
	{
		"BTFallbackIdleAction",
		name = "fallback_idle",
	},
	name = "horde",
}
BreedBehaviors.horde_vermin = {
	"BTSelector",
	{
		"BTSpawningAction",
		condition = "spawn",
		name = "spawn",
	},
	{
		"BTInVortexAction",
		condition = "in_vortex",
		name = "in_vortex",
	},
	{
		"BTFallAction",
		condition = "is_falling",
		name = "falling",
	},
	{
		"BTStaggerAction",
		condition = "stagger",
		name = "stagger",
		action_data = ACTIONS.stagger,
	},
	{
		"BTBlockedAction",
		condition = "blocked",
		name = "blocked",
		action_data = ACTIONS.blocked,
	},
	STORM_VERMIN_SMART_OBJECT,
	STORM_VERMIN_COMBAT_DESTRUCTIBLE_STATIC,
	STORM_VERMIN_COMBAT,
	{
		"BTMoveToGoalAction",
		condition = "has_goal_destination",
		name = "move_to_goal",
		action_data = ACTIONS.follow,
	},
	{
		"BTIdleAction",
		condition = "no_target",
		name = "idle",
	},
	{
		"BTFallbackIdleAction",
		name = "fallback_idle",
	},
	name = "horde",
}
BreedBehaviors.shield_vermin = {
	"BTSelector",
	{
		"BTSpawningAction",
		condition = "spawn",
		name = "spawn",
	},
	{
		"BTInVortexAction",
		condition = "in_vortex",
		name = "in_vortex",
	},
	{
		"BTFallAction",
		condition = "is_falling",
		name = "falling",
	},
	{
		"BTStaggerAction",
		condition = "stagger",
		name = "stagger",
		action_data = ACTIONS_SHIELD.stagger,
	},
	{
		"BTBlockedAction",
		condition = "blocked",
		name = "blocked",
		action_data = ACTIONS_SHIELD.blocked,
	},
	STORM_VERMIN_SMART_OBJECT,
	STORM_VERMIN_SHIELD_COMBAT,
	{
		"BTMoveToGoalAction",
		condition = "has_goal_destination",
		name = "move_to_goal",
		action_data = ACTIONS_SHIELD.follow,
	},
	{
		"BTAlertedAction",
		condition = "player_spotted",
		name = "alerted",
		action_data = ACTIONS_SHIELD.alerted,
	},
	{
		"BTIdleAction",
		condition = "no_target",
		name = "idle",
	},
	{
		"BTFallbackIdleAction",
		name = "fallback_idle",
	},
	name = "shield_vermin",
}

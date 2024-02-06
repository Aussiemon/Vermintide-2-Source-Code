-- chunkname: @scripts/entity_system/systems/behaviour/trees/chaos/chaos_warrior_behavior.lua

local ACTIONS = BreedActions.chaos_warrior
local CHAOS_WARRIOR_COMBAT = {
	"BTUtilityNode",
	{
		"BTCombatStepAction",
		name = "combat_step",
		action_data = ACTIONS.combat_step,
	},
	{
		"BTClanRatFollowAction",
		name = "follow",
		action_data = ACTIONS.follow,
	},
	{
		"BTStormVerminAttackAction",
		condition = "ask_target_before_attacking",
		name = "running_attack_right",
		action_data = ACTIONS.running_attack_right,
	},
	{
		"BTStormVerminAttackAction",
		condition = "ask_target_before_attacking",
		name = "special_attack_cleave",
		action_data = ACTIONS.special_attack_cleave,
	},
	{
		"BTStormVerminAttackAction",
		condition = "ask_target_before_attacking",
		name = "special_attack_sweep",
		action_data = ACTIONS.special_attack_sweep,
	},
	{
		"BTStormVerminAttackAction",
		condition = "ask_target_before_attacking",
		name = "special_attack_launch",
		action_data = ACTIONS.special_attack_launch,
	},
	{
		"BTStormVerminPushAction",
		condition = "ask_target_before_attacking",
		name = "push_attack",
		action_data = ACTIONS.push_attack,
	},
	{
		"BTStormVerminAttackAction",
		condition = "ask_target_before_attacking",
		name = "special_attack_quick",
		action_data = ACTIONS.special_attack_quick,
	},
	condition = "confirmed_player_sighting",
	name = "in_combat",
}
local CHAOS_WARRIOR_SMART_OBJECT = {
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

BreedBehaviors.chaos_warrior = {
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
	CHAOS_WARRIOR_SMART_OBJECT,
	CHAOS_WARRIOR_COMBAT,
	{
		"BTAlertedAction",
		condition = "player_spotted",
		name = "alerted",
		action_data = ACTIONS.alerted,
	},
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

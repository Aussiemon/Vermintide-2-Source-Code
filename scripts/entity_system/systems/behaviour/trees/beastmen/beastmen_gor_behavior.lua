-- chunkname: @scripts/entity_system/systems/behaviour/trees/beastmen/beastmen_gor_behavior.lua

local ACTIONS = BreedActions.beastmen_gor
local GOR_COMBAT = {
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
		"BTAttackAction",
		condition = "ask_target_before_attacking",
		name = "headbutt_attack",
		action_data = ACTIONS.headbutt_attack,
	},
	{
		"BTAttackAction",
		condition = "ask_target_before_attacking",
		name = "running_attack",
		action_data = ACTIONS.running_attack,
	},
	{
		"BTAttackAction",
		condition = "ask_target_before_attacking",
		name = "normal_attack",
		action_data = ACTIONS.normal_attack,
	},
	{
		"BTCombatShoutAction",
		name = "combat_shout",
		action_data = ACTIONS.combat_shout,
	},
	condition = "confirmed_player_sighting",
	name = "in_combat",
}
local GOR_SMART_OBJECT = {
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

BreedBehaviors.gor = {
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
		"BTInGravityWellAction",
		condition = "in_gravity_well",
		name = "in_gravity_well",
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
	GOR_SMART_OBJECT,
	{
		"BTHesitateAction",
		condition = "is_alerted",
		name = "hesitate",
		action_data = ACTIONS.alerted,
	},
	GOR_COMBAT,
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
		action_data = ACTIONS.idle,
	},
	{
		"BTFallbackIdleAction",
		name = "fallback_idle",
	},
	name = "gor",
}

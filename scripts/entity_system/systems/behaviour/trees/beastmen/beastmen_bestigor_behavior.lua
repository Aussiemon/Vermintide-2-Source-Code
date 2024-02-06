-- chunkname: @scripts/entity_system/systems/behaviour/trees/beastmen/beastmen_bestigor_behavior.lua

local ACTIONS = BreedActions.beastmen_bestigor
local BESTIGOR_COMBAT = {
	"BTUtilityNode",
	action_data = ACTIONS.utility_action,
	{
		"BTClanRatFollowAction",
		name = "follow",
		action_data = ACTIONS.follow,
	},
	{
		"BTCombatStepAction",
		name = "combat_step",
		action_data = ACTIONS.combat_step,
	},
	{
		"BTChargeAttackAction",
		condition = "ask_target_before_attacking",
		name = "charge_attack",
		action_data = ACTIONS.charge_attack,
	},
	{
		"BTRandom",
		action_data = ACTIONS.running_attack,
		{
			"BTStormVerminAttackAction",
			name = "running_special_attack_sweep",
			weight = 1,
			action_data = ACTIONS.special_attack_sweep,
		},
		name = "running_attack",
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
		"BTStormVerminPushAction",
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
local BESTIGOR_SMART_OBJECT = {
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
	condition = "bestigor_at_smartobject",
	name = "smartobject",
}

BreedBehaviors.bestigor = {
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
	BESTIGOR_SMART_OBJECT,
	BESTIGOR_COMBAT,
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
	name = "bestigor",
}

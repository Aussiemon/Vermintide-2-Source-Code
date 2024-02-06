-- chunkname: @scripts/entity_system/systems/behaviour/trees/beastmen/beastmen_ungor_archer_behavior.lua

local ACTIONS = BreedActions.beastmen_ungor_archer
local UNGOR_ARCHER_RANGED_COMBAT = {
	"BTUtilityNode",
	{
		"BTFindRangedPositionAction",
		name = "find_ranged_position",
		action_data = ACTIONS.find_ranged_position,
	},
	{
		"BTMoveToRangedPositionAction",
		name = "move_to_ranged_position",
		action_data = ACTIONS.move_to_ranged_position,
	},
	{
		"BTFireProjectileAction",
		name = "fire_projectile",
		weight = 2,
		action_data = ACTIONS.fire_projectile,
	},
	condition = "confirmed_player_sighting",
	name = "in_combat",
}
local UNGOR_ARCHER_MELEE_COMBAT = {
	"BTUtilityNode",
	{
		"BTClanRatFollowAction",
		name = "follow",
		action_data = ACTIONS.follow,
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
	condition = "ungor_archer_enter_melee_combat",
	name = "in_combat",
}
local UNGOR_ARCHER_SMART_OBJECT = {
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

BreedBehaviors.ungor_archer = {
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
	{
		"BTSwitchWeaponsAction",
		condition = "switch_to_melee_weapon",
		name = "switch_weapons",
		action_data = ACTIONS.switch_weapons,
	},
	UNGOR_ARCHER_SMART_OBJECT,
	UNGOR_ARCHER_MELEE_COMBAT,
	UNGOR_ARCHER_RANGED_COMBAT,
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
	name = "ungor_archer",
}

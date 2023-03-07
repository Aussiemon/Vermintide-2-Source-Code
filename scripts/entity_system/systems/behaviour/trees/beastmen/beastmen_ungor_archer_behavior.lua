local ACTIONS = BreedActions.beastmen_ungor_archer
local UNGOR_ARCHER_RANGED_COMBAT = {
	"BTUtilityNode",
	{
		"BTFindRangedPositionAction",
		name = "find_ranged_position",
		action_data = ACTIONS.find_ranged_position
	},
	{
		"BTMoveToRangedPositionAction",
		name = "move_to_ranged_position",
		action_data = ACTIONS.move_to_ranged_position
	},
	{
		"BTFireProjectileAction",
		name = "fire_projectile",
		weight = 2,
		action_data = ACTIONS.fire_projectile
	},
	condition = "confirmed_player_sighting",
	name = "in_combat"
}
local UNGOR_ARCHER_MELEE_COMBAT = {
	"BTUtilityNode",
	{
		"BTClanRatFollowAction",
		name = "follow",
		action_data = ACTIONS.follow
	},
	{
		"BTAttackAction",
		name = "running_attack",
		condition = "ask_target_before_attacking",
		action_data = ACTIONS.running_attack
	},
	{
		"BTAttackAction",
		name = "normal_attack",
		condition = "ask_target_before_attacking",
		action_data = ACTIONS.normal_attack
	},
	{
		"BTCombatShoutAction",
		name = "combat_shout",
		action_data = ACTIONS.combat_shout
	},
	condition = "ungor_archer_enter_melee_combat",
	name = "in_combat"
}
local UNGOR_ARCHER_SMART_OBJECT = {
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
BreedBehaviors.ungor_archer = {
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
	{
		"BTSwitchWeaponsAction",
		name = "switch_weapons",
		condition = "switch_to_melee_weapon",
		action_data = ACTIONS.switch_weapons
	},
	UNGOR_ARCHER_SMART_OBJECT,
	UNGOR_ARCHER_MELEE_COMBAT,
	UNGOR_ARCHER_RANGED_COMBAT,
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
	name = "ungor_archer"
}

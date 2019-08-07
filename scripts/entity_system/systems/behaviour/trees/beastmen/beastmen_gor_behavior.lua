local ACTIONS = BreedActions.beastmen_gor
local GOR_COMBAT = {
	"BTUtilityNode",
	{
		"BTCombatStepAction",
		name = "combat_step",
		action_data = ACTIONS.combat_step
	},
	{
		"BTClanRatFollowAction",
		name = "follow",
		action_data = ACTIONS.follow
	},
	{
		"BTAttackAction",
		name = "headbutt_attack",
		condition = "ask_target_before_attacking",
		action_data = ACTIONS.headbutt_attack
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
	condition = "confirmed_player_sighting",
	name = "in_combat"
}
local GOR_SMART_OBJECT = {
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
BreedBehaviors.gor = {
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
		"BTInGravityWellAction",
		condition = "in_gravity_well",
		name = "in_gravity_well"
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
	GOR_SMART_OBJECT,
	{
		"BTHesitateAction",
		name = "hesitate",
		condition = "is_alerted",
		action_data = ACTIONS.alerted
	},
	GOR_COMBAT,
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
		name = "idle",
		condition = "no_target",
		action_data = ACTIONS.idle
	},
	{
		"BTFallbackIdleAction",
		name = "fallback_idle"
	},
	name = "gor"
}

return

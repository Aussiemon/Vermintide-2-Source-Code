local ACTIONS = BreedActions.beastmen_bestigor
local BESTIGOR_COMBAT = {
	"BTUtilityNode",
	{
		"BTClanRatFollowAction",
		name = "follow",
		action_data = ACTIONS.follow
	},
	{
		"BTCombatStepAction",
		name = "combat_step",
		action_data = ACTIONS.combat_step
	},
	{
		"BTChargeAttackAction",
		name = "charge_attack",
		condition = "ask_target_before_attacking",
		action_data = ACTIONS.charge_attack
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
		"BTStormVerminAttackAction",
		name = "special_attack_cleave",
		condition = "ask_target_before_attacking",
		action_data = ACTIONS.special_attack_cleave
	},
	{
		"BTStormVerminAttackAction",
		name = "special_attack_sweep",
		condition = "ask_target_before_attacking",
		action_data = ACTIONS.special_attack_sweep
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
	name = "in_combat",
	condition = "confirmed_player_sighting",
	action_data = ACTIONS.utility_action
}
local BESTIGOR_SMART_OBJECT = {
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
	condition = "bestigor_at_smartobject",
	name = "smartobject"
}
BreedBehaviors.bestigor = {
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
	BESTIGOR_SMART_OBJECT,
	BESTIGOR_COMBAT,
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
	name = "bestigor"
}

return

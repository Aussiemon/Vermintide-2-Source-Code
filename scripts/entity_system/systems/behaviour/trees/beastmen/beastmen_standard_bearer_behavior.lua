local ACTIONS = BreedActions.beastmen_standard_bearer
local STANDARD_BEARER_COMBAT = {
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
	condition = "confirmed_player_sighting_standard_bearer",
	name = "in_combat"
}
local STANDARD_BEARER_SMART_OBJECT = {
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
local STANDARD_BEARER_MOVE_AND_PLANT_STANDARD = {
	"BTSelector",
	{
		"BTMoveToGoalAction",
		enter_hook = "add_invincibility",
		name = "move_to_goal",
		condition = "has_goal_destination",
		action_data = ACTIONS.follow
	},
	{
		"BTPlaceStandardAction",
		name = "place_standard_stagger_immune",
		leave_hook = "beastmen_standard_bearer_leave_move_and_plant_standard",
		action_data = ACTIONS.place_standard_stagger_immune
	},
	condition = "beastmen_standard_bearer_move_and_place_standard",
	name = "move_and_place_standard"
}
BreedBehaviors.standard_bearer = {
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
		"BTSwitchWeaponsAction",
		name = "switch_weapons",
		condition = "switching_weapons",
		action_data = ACTIONS.switch_weapons
	},
	STANDARD_BEARER_SMART_OBJECT,
	STANDARD_BEARER_MOVE_AND_PLANT_STANDARD,
	{
		"BTPickupStandardAction",
		name = "pick_up_standard",
		condition = "beastmen_standard_bearer_pickup_standard",
		action_data = ACTIONS.pick_up_standard
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
		"BTUtilityNode",
		{
			"BTClanRatFollowAction",
			name = "place_standard_follow",
			action_data = ACTIONS.place_standard_follow
		},
		{
			"BTPlaceStandardAction",
			name = "place_standard",
			action_data = ACTIONS.place_standard
		},
		condition = "beastmen_standard_bearer_place_standard",
		name = "enemy_spotted"
	},
	{
		"BTDefendStandardAction",
		condition = "standard_bearer_should_be_defensive",
		name = "defend_standard"
	},
	STANDARD_BEARER_COMBAT,
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
	name = "standard_bearer"
}

return

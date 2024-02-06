-- chunkname: @scripts/entity_system/systems/behaviour/trees/chaos/chaos_dummy_exalted_sorcerer_drachenfels_behavior.lua

local ACTIONS = BreedActions.chaos_dummy_exalted_sorcerer_drachenfels

BreedBehaviors.dummy_exalted_sorcerer_drachenfels = {
	"BTSelector",
	{
		"BTTentacleSpawnAction",
		condition = "spawn",
		name = "spawn",
		action_data = ACTIONS.spawn,
	},
	{
		"BTUtilityNode",
		{
			"BTCastMissileAction",
			name = "defensive_seeking_bomb",
			action_data = ACTIONS.defensive_seeking_bomb,
		},
		condition = "dummy_not_escaped",
		name = "cast_seeking_bomb",
	},
	{
		"BTDummyIdleAction",
		enter_hook = "sorcerer_dummy_idle",
		name = "idle",
		action_data = ACTIONS.idle,
	},
	name = "chaos_dummy_exalted_sorcerer_drachenfels",
}

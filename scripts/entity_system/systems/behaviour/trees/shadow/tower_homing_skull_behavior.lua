-- chunkname: @scripts/entity_system/systems/behaviour/trees/shadow/tower_homing_skull_behavior.lua

BreedBehaviors.tower_homing_skull = {
	"BTSelector",
	{
		"BTEtherealHomingFlightAction",
		condition = "can_see_player",
		name = "bt_ethereal_homing_flight_action",
	},
	name = "tower_homing_skull",
}

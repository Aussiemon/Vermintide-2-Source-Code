-- chunkname: @scripts/entity_system/systems/behaviour/trees/shadow/shadow_skull_behavior.lua

BreedBehaviors.shadow_skull = {
	"BTSelector",
	{
		"BTHomingFlightAction",
		condition = "can_see_player",
		name = "homing",
	},
	name = "shadow_skull",
}

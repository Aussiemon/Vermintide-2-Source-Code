-- chunkname: @scripts/unit_extensions/default_player_unit/careers/career_ability_warpfire_thrower.lua

CareerAbilityWarpfireThrower = class(CareerAbilityWarpfireThrower, CareerAbilityDarkPactBase)

CareerAbilityWarpfireThrower.ability_ready = function (self)
	self.super.ability_ready(self)

	local first_person_extension = self._first_person_extension

	if first_person_extension then
		local unit = self._unit
		local wwise_world = self._wwise_world

		WwiseWorld.trigger_event(wwise_world, "player_enemy_warpfire_steam_after_flame_stop", unit)
		CharacterStateHelper.play_animation_event_first_person(first_person_extension, "cooldown_ready")
		CharacterStateHelper.play_animation_event(unit, "cooldown_ready")
	end
end

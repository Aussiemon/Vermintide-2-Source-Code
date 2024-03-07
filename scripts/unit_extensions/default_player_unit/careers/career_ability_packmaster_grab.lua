-- chunkname: @scripts/unit_extensions/default_player_unit/careers/career_ability_packmaster_grab.lua

CareerAbilityPackmasterGrab = class(CareerAbilityPackmasterGrab, CareerAbilityDarkPactBase)

CareerAbilityPackmasterGrab._ability_available = function (self)
	local ability_available = self.super._ability_available(self)
	local status_extension = self._status_extension

	return ability_available and not status_extension:get_unarmed()
end

CareerAbilityPackmasterGrab._start = function (self)
	self.super._start(self)

	local career_extension = self._career_extension

	career_extension:start_activated_ability_cooldown(self._ability_data.ability_id)
	career_extension:set_activated_ability_cooldown_paused(self._ability_data.ability_id)
end

CareerAbilityPackmasterGrab.ability_ready = function (self)
	self.super.ability_ready(self)

	local first_person_extension = self._first_person_extension

	if first_person_extension then
		CharacterStateHelper.play_animation_event_first_person(first_person_extension, "cooldown_ready")
	end
end

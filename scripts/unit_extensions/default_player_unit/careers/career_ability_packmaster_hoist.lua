-- chunkname: @scripts/unit_extensions/default_player_unit/careers/career_ability_packmaster_hoist.lua

CareerAbilityPackmasterHoist = class(CareerAbilityPackmasterHoist, CareerAbilityDarkPactBase)

CareerAbilityPackmasterHoist._ability_available = function (self)
	local ability_available = self.super._ability_available(self)
	local status_extension = self._status_extension

	return ability_available and status_extension:get_is_packmaster_dragging()
end

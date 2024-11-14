-- chunkname: @scripts/unit_extensions/default_player_unit/careers/career_ability_dark_pact_horde.lua

CareerAbilityDarkPactHorde = class(CareerAbilityDarkPactHorde, CareerAbilityDarkPactBase)

CareerAbilityDarkPactHorde._ability_available = function (self)
	local status_extension = self._status_extension
	local ghost_mode_extension = self._ghost_mode_extension
	local in_ghost_mode = ghost_mode_extension:is_in_ghost_mode()
	local ability_available = not status_extension:is_disabled() and not in_ghost_mode

	return ability_available
end

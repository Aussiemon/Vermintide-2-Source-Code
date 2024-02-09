-- chunkname: @scripts/unit_extensions/default_player_unit/careers/career_ability_gutter_runner_pounce.lua

CareerAbilityGutterRunnerPounce = class(CareerAbilityGutterRunnerPounce, CareerAbilityDarkPactBase)

CareerAbilityGutterRunnerPounce._ability_available = function (self)
	local career_extension = self._career_extension
	local status_extension = self._status_extension
	local in_foff_invis = career_extension:get_state() == "vs_gutter_runner_smoke_bomb_invisible"
	local can_use = career_extension:can_use_activated_ability(1)
	local is_disabled = status_extension:is_disabled()
	local ability_available = not status_extension:is_disabled()

	return can_use and not is_disabled and not in_foff_invis and ability_available
end

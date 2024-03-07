-- chunkname: @scripts/unit_extensions/default_player_unit/careers/career_ability_gutter_runner_foff.lua

CareerAbilityGutterRunnerFoff = class(CareerAbilityGutterRunnerFoff, CareerAbilityDarkPactBase)

CareerAbilityGutterRunnerFoff._ability_available = function (self)
	local ability_available = self.super._ability_available(self)
	local career_extension = self._career_extension
	local in_foff_invis = career_extension:get_state() == "vs_gutter_runner_smoke_bomb_invisible"

	return ability_available and not in_foff_invis
end

CareerAbilityGutterRunnerFoff._start = function (self)
	self.super._start(self)

	local career_extension = self._career_extension
	local id = self._ability_data.ability_id

	career_extension:start_activated_ability_cooldown(id)
	career_extension:set_activated_ability_cooldown_paused(id)
end

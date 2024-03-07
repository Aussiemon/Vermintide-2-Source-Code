-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/gutter_runner/gutter_runner_state_standing.lua

GutterRunnerStateStanding = class(GutterRunnerStateStanding, EnemyCharacterStateStanding)

GutterRunnerStateStanding.init = function (self, character_state_init_context)
	GutterRunnerStateStanding.super.init(self, character_state_init_context)

	self._pounce_ability_id = self._career_extension:ability_id("pounce")
	self._foff_ability_id = self._career_extension:ability_id("foff")
end

GutterRunnerStateStanding.update = function (self, unit, input, dt, context, t)
	local handled = self:common_state_changes()

	if handled then
		return
	end

	local csm = self._csm
	local career_extension = self._career_extension

	if career_extension:ability_was_triggered(self._pounce_ability_id) then
		csm:change_state("gutter_runner_prowling")

		return
	end

	if career_extension:ability_was_triggered(self._foff_ability_id) then
		csm:change_state("gutter_runner_foff")

		return
	end

	if not self._status_extension:is_invisible() then
		self:_update_taunt_dialogue(t)
	end

	handled = self:common_movement(t)
end

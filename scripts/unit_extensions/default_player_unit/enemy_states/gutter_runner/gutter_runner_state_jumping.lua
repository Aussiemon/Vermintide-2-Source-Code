-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/gutter_runner/gutter_runner_state_jumping.lua

GutterRunnerStateJumping = class(GutterRunnerStateJumping, EnemyCharacterStateJumping)

GutterRunnerStateJumping.init = function (self, character_state_init_context)
	GutterRunnerStateJumping.super.init(self, character_state_init_context)
end

GutterRunnerStateJumping.update = function (self, unit, input, dt, context, t)
	local handled = self:common_state_changes()

	if handled then
		return
	end

	local ghost_mode_extension = self._ghost_mode_extension
	local in_ghost_mode = ghost_mode_extension:is_in_ghost_mode()

	handled = self:common_movement(in_ghost_mode, dt, unit)
end

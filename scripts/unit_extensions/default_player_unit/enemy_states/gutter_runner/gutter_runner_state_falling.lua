-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/gutter_runner/gutter_runner_state_falling.lua

GutterRunnerStateFalling = class(GutterRunnerStateFalling, EnemyCharacterStateFalling)

GutterRunnerStateFalling.init = function (self, character_state_init_context)
	GutterRunnerStateFalling.super.init(self, character_state_init_context)
end

GutterRunnerStateFalling.update = function (self, unit, input, dt, context, t)
	local ghost_mode_extension = self._ghost_mode_extension
	local in_ghost_mode = ghost_mode_extension:is_in_ghost_mode()
	local handled = self:common_movement(in_ghost_mode, dt, unit)
end

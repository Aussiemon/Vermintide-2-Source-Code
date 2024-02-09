-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/stormfiend/stormfiend_state_falling.lua

StormfiendStateFalling = class(StormfiendStateFalling, EnemyCharacterStateFalling)

StormfiendStateFalling.init = function (self, character_state_init_context)
	StormfiendStateFalling.super.init(self, character_state_init_context)
end

StormfiendStateFalling.update = function (self, unit, input, dt, context, t)
	local ghost_mode_extension = self._ghost_mode_extension
	local in_ghost_mode = ghost_mode_extension:is_in_ghost_mode()
	local handled = self:common_movement(in_ghost_mode, dt, unit)
end

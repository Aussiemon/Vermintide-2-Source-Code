-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/rat_ogre/rat_ogre_state_falling.lua

RatOgreStateFalling = class(RatOgreStateFalling, EnemyCharacterStateFalling)

RatOgreStateFalling.init = function (self, character_state_init_context)
	RatOgreStateFalling.super.init(self, character_state_init_context)
end

RatOgreStateFalling.update = function (self, unit, input, dt, context, t)
	local ghost_mode_extension = self._ghost_mode_extension
	local in_ghost_mode = ghost_mode_extension:is_in_ghost_mode()
	local handled = self:common_movement(in_ghost_mode, dt, unit)
end

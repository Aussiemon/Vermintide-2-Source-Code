-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/rat_ogre/rat_ogre_state_falling.lua

RatOgreStateFalling = class(RatOgreStateFalling, EnemyCharacterStateFalling)

RatOgreStateFalling.init = function (self, character_state_init_context)
	RatOgreStateFalling.super.init(self, character_state_init_context)
end

RatOgreStateFalling.on_exit = function (self, unit, input, dt, context, t, previous_state, params)
	RatOgreStateFalling.super.on_exit(self, unit, input, dt, context, t, previous_state, params)
end

RatOgreStateFalling.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	RatOgreStateFalling.super.on_enter(self, unit, input, dt, context, t, previous_state, params)
end

RatOgreStateFalling.update = function (self, unit, input, dt, context, t)
	local ghost_mode_extension = self._ghost_mode_extension
	local in_ghost_mode = ghost_mode_extension:is_in_ghost_mode()
	local handled = self:common_movement(in_ghost_mode, dt, unit)

	if not handled then
		CharacterStateHelper.update_weapon_actions(t, unit, self._input_extension, self._inventory_extension, self._health_extension)
	end
end

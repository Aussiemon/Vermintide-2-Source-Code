-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/chaos_troll/chaos_troll_state_falling.lua

ChaosTrollStateFalling = class(ChaosTrollStateFalling, EnemyCharacterStateFalling)

ChaosTrollStateFalling.init = function (self, character_state_init_context)
	ChaosTrollStateFalling.super.init(self, character_state_init_context)
end

ChaosTrollStateFalling.update = function (self, unit, input, dt, context, t)
	local ghost_mode_extension = self._ghost_mode_extension
	local in_ghost_mode = ghost_mode_extension:is_in_ghost_mode()
	local handled = self:common_movement(in_ghost_mode, dt, unit)

	if not handled then
		CharacterStateHelper.update_weapon_actions(t, unit, self._input_extension, self._inventory_extension, self._health_extension)
	end
end

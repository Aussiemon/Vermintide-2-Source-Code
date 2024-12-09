-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/rat_ogre/rat_ogre_state_jumping.lua

RatOgreStateJumping = class(RatOgreStateJumping, EnemyCharacterStateJumping)

RatOgreStateJumping.init = function (self, character_state_init_context)
	RatOgreStateJumping.super.init(self, character_state_init_context)
end

RatOgreStateJumping.update = function (self, unit, input, dt, context, t)
	local handled = self:common_state_changes()

	if handled then
		return
	end

	local ghost_mode_extension = self._ghost_mode_extension
	local in_ghost_mode = ghost_mode_extension:is_in_ghost_mode()

	handled = self:common_movement(in_ghost_mode, dt, unit)

	if not handled then
		CharacterStateHelper.update_weapon_actions(t, unit, self._input_extension, self._inventory_extension, self._health_extension)
	end
end

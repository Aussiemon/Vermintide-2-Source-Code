-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/warpfire_thrower/warpfire_thrower_state_falling.lua

WarpfireThrowerStateFalling = class(WarpfireThrowerStateFalling, EnemyCharacterStateFalling)

WarpfireThrowerStateFalling.init = function (self, character_state_init_context)
	WarpfireThrowerStateFalling.super.init(self, character_state_init_context)

	self._fire_ability_id = self._career_extension:ability_id("fire")
end

WarpfireThrowerStateFalling.update = function (self, unit, input, dt, context, t)
	local csm = self._csm
	local career_extension = self._career_extension

	if career_extension:ability_was_triggered(self._fire_ability_id) then
		csm:change_state("warpfire_firing")

		return
	end

	local ghost_mode_extension = self._ghost_mode_extension
	local in_ghost_mode = ghost_mode_extension:is_in_ghost_mode()
	local handled = self:common_movement(in_ghost_mode, dt, unit)
end

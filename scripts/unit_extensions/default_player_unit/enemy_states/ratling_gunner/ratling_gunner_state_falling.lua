-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/ratling_gunner/ratling_gunner_state_falling.lua

RatlingGunnerStateFalling = class(RatlingGunnerStateFalling, EnemyCharacterStateFalling)

RatlingGunnerStateFalling.init = function (self, character_state_init_context)
	RatlingGunnerStateFalling.super.init(self, character_state_init_context)

	self._fire_ability_id = self._career_extension:ability_id("fire")
	self._reload_ability_id = self._career_extension:ability_id("reload")
end

RatlingGunnerStateFalling.update = function (self, unit, input, dt, context, t)
	local csm = self._csm
	local career_extension = self._career_extension

	CharacterStateHelper.update_weapon_actions(t, unit, self._input_extension, self._inventory_extension, self._health_extension)

	local ghost_mode_extension = self._ghost_mode_extension
	local in_ghost_mode = ghost_mode_extension:is_in_ghost_mode()
	local handled = self:common_movement(in_ghost_mode, dt, unit)
end

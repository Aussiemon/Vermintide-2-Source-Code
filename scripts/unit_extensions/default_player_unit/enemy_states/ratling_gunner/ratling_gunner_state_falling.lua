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

	RatlingGunnerStateWalking.super:debug_display_ratling_gunner_ammo(unit)

	if career_extension:ability_was_triggered(self._reload_ability_id) then
		csm:change_state("ratling_gunner_reloading")

		return
	end

	if career_extension:ability_was_triggered(self._fire_ability_id) then
		csm:change_state("ratling_gunner_firing")

		return
	end

	local ghost_mode_extension = self._ghost_mode_extension
	local in_ghost_mode = ghost_mode_extension:is_in_ghost_mode()
	local handled = self:common_movement(in_ghost_mode, dt, unit)
end

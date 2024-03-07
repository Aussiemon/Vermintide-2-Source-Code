-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/packmaster/packmaster_state_jumping.lua

PackmasterStateJumping = class(PackmasterStateJumping, EnemyCharacterStateJumping)

PackmasterStateJumping.init = function (self, character_state_init_context)
	PackmasterStateJumping.super.init(self, character_state_init_context)

	self._grab_ability_id = self._career_extension:ability_id("grab")
end

PackmasterStateJumping.update = function (self, unit, input, dt, context, t)
	local handled = self:common_state_changes()

	if handled then
		return
	end

	local csm = self._csm
	local career_extension = self._career_extension

	if career_extension:ability_was_triggered(self._grab_ability_id) then
		csm:change_state("packmaster_grabbing")

		return
	end

	local ghost_mode_extension = self._ghost_mode_extension
	local in_ghost_mode = ghost_mode_extension:is_in_ghost_mode()

	handled = self:common_movement(in_ghost_mode, dt, unit)
end

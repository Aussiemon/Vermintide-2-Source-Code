-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/chaos_troll/chaos_troll_state_walking.lua

ChaosTrollStateWalking = class(ChaosTrollStateWalking, EnemyCharacterStateWalking)

ChaosTrollStateWalking.init = function (self, character_state_init_context)
	ChaosTrollStateWalking.super.init(self, character_state_init_context)

	self._vomit_ability_id = self._career_extension:ability_id("vomit")
end

ChaosTrollStateWalking.update = function (self, unit, input, dt, context, t)
	local handled = self:common_state_changes()

	if handled then
		return
	end

	local csm = self._csm
	local career_extension = self._career_extension

	if career_extension:ability_was_triggered(self._vomit_ability_id) then
		csm:change_state("troll_vomiting")

		return
	end

	self:_update_taunt_dialogue(t)

	local ghost_mode_extension = self._ghost_mode_extension
	local in_ghost_mode = ghost_mode_extension:is_in_ghost_mode()
	local input_extension = self._input_extension
	local status_extension = self._status_extension
	local first_person_extension = self._first_person_extension
	local is_crouching = status_extension:is_crouching()
	local toggle_crouch = input_extension.toggle_crouch

	CharacterStateHelper.check_crouch(unit, input_extension, status_extension, toggle_crouch, first_person_extension, t)

	handled = self:common_movement(in_ghost_mode, dt)

	if not handled then
		CharacterStateHelper.update_weapon_actions(t, unit, self._input_extension, self._inventory_extension, self._health_extension)
	end
end

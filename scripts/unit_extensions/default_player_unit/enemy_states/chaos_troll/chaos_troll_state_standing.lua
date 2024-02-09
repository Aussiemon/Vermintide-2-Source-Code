-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/chaos_troll/chaos_troll_state_standing.lua

ChaosTrollStateStanding = class(ChaosTrollStateStanding, EnemyCharacterStateStanding)

ChaosTrollStateStanding.init = function (self, character_state_init_context)
	ChaosTrollStateStanding.super.init(self, character_state_init_context)

	self._vomit_ability_id = self._career_extension:ability_id("vomit")
end

ChaosTrollStateStanding.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	ChaosTrollStateStanding.super.on_enter(self, unit, input, dt, context, t, previous_state, params)
end

ChaosTrollStateStanding.update = function (self, unit, input, dt, context, t)
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

	handled = self:common_movement(t)

	if not handled then
		CharacterStateHelper.update_weapon_actions(t, unit, self._input_extension, self._inventory_extension, self._health_extension)
	end
end

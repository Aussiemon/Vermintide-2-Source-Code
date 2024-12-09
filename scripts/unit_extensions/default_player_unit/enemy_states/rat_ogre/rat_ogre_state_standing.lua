-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/rat_ogre/rat_ogre_state_standing.lua

RatOgreStateStanding = class(RatOgreStateStanding, EnemyCharacterStateStanding)

RatOgreStateStanding.init = function (self, character_state_init_context)
	RatOgreStateStanding.super.init(self, character_state_init_context)

	self._ogre_jump_ability_id = self._career_extension:ability_id("ogre_jump")
end

RatOgreStateStanding.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	RatOgreStateStanding.super.on_enter(self, unit, input, dt, context, t, previous_state, params)
end

RatOgreStateStanding.update = function (self, unit, input, dt, context, t)
	local handled = self:common_state_changes()

	if handled then
		return
	end

	local csm = self._csm
	local status_extension = self._status_extension
	local career_extension = self._career_extension
	local ghost_mode_extension = self._ghost_mode_extension
	local in_ghost_mode = ghost_mode_extension:is_in_ghost_mode()

	self:_update_taunt_dialogue(t)

	handled = self:common_movement(t)

	if not handled then
		CharacterStateHelper.update_weapon_actions(t, unit, self._input_extension, self._inventory_extension, self._health_extension)
	end
end

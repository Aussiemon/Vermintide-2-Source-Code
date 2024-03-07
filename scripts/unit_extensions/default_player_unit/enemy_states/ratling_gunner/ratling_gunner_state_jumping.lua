-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/ratling_gunner/ratling_gunner_state_jumping.lua

RatlingGunnerStateJumping = class(RatlingGunnerStateJumping, EnemyCharacterStateJumping)

RatlingGunnerStateJumping.init = function (self, character_state_init_context)
	RatlingGunnerStateJumping.super.init(self, character_state_init_context)

	self._fire_ability_id = self._career_extension:ability_id("fire")
	self._reload_ability_id = self._career_extension:ability_id("reload")
end

RatlingGunnerStateJumping.update = function (self, unit, input, dt, context, t)
	local handled = self:common_state_changes()

	if handled then
		return
	end

	local csm = self._csm
	local career_extension = self._career_extension

	if not handled then
		CharacterStateHelper.update_weapon_actions(t, unit, self._input_extension, self._inventory_extension, self._health_extension)
	end

	local ghost_mode_extension = self._ghost_mode_extension
	local in_ghost_mode = ghost_mode_extension:is_in_ghost_mode()

	handled = self:common_movement(in_ghost_mode, dt, unit)
end

RatlingGunnerStateJumping.debug_display_ammo = function (self)
	local unit = self._unit
	local blackboard = BLACKBOARDS[unit]
	local data = blackboard.attack_pattern_data or {}
	local current_ammo = data.current_ammo or self._breed.max_ammo
	local screen_width = RESOLUTION_LOOKUP.res_w
	local screen_height = RESOLUTION_LOOKUP.res_h
	local pos_y = screen_height * 0.85
	local pos_x = screen_width * 0.87
	local color = Color(100, 255, 0)
	local text_pos = Vector3(pos_x, pos_y, 10)
	local font_size = 40
	local string_ammo = string.format("Ammo: %2d", current_ammo)

	Debug.draw_text(string_ammo, text_pos, font_size, color)
end

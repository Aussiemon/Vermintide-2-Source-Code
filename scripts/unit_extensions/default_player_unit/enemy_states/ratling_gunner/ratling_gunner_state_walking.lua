-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/ratling_gunner/ratling_gunner_state_walking.lua

RatlingGunnerStateWalking = class(RatlingGunnerStateWalking, EnemyCharacterStateWalking)

RatlingGunnerStateWalking.init = function (self, character_state_init_context)
	RatlingGunnerStateWalking.super.init(self, character_state_init_context)

	self._fire_ability_id = self._career_extension:ability_id("fire")
	self._reload_ability_id = self._career_extension:ability_id("reload")
end

RatlingGunnerStateWalking.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	RatlingGunnerStateWalking.super.on_enter(self, unit, input, dt, context, t, previous_state, params)
	CharacterStateHelper.play_animation_event(unit, "no_anim_upperbody")

	self._left_wpn_particle_node_name = "g_ratlinggun"
	self._left_wpn_particle_name = "fx/wpnfx_gunner_enemy_in_range_1p"

	self:check_enemies_in_range_vfx()
end

RatlingGunnerStateWalking.update = function (self, unit, input, dt, context, t)
	local handled = self:common_state_changes()

	if handled then
		return
	end

	local csm = self._csm
	local career_extension = self._career_extension

	self:check_enemies_in_range_vfx()
	RatlingGunnerStateWalking.super:debug_display_ratling_gunner_ammo(unit)

	if career_extension:ability_was_triggered(self._reload_ability_id) then
		csm:change_state("ratling_gunner_reloading")

		return
	end

	if career_extension:ability_was_triggered(self._fire_ability_id) then
		csm:change_state("ratling_gunner_firing")

		return
	end

	self:_update_taunt_dialogue(t)

	local ghost_mode_extension = self._ghost_mode_extension
	local in_ghost_mode = ghost_mode_extension:is_in_ghost_mode()

	handled = self:common_movement(in_ghost_mode, dt)
end

RatlingGunnerStateWalking.debug_display_ammo = function (self)
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

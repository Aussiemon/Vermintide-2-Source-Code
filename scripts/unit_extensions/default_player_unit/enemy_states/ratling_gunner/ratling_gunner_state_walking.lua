-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/ratling_gunner/ratling_gunner_state_walking.lua

RatlingGunnerStateWalking = class(RatlingGunnerStateWalking, EnemyCharacterStateWalking)

RatlingGunnerStateWalking.init = function (self, character_state_init_context)
	RatlingGunnerStateWalking.super.init(self, character_state_init_context)

	self._fire_ability_id = self._career_extension:ability_id("fire")
	self._reload_ability_id = self._career_extension:ability_id("reload")
end

RatlingGunnerStateWalking.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	RatlingGunnerStateWalking.super.on_enter(self, unit, input, dt, context, t, previous_state, params)

	self._left_wpn_particle_node_name = "g_ratlinggun"
	self._left_wpn_particle_name = "fx/wpnfx_gunner_enemy_in_range_1p"
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

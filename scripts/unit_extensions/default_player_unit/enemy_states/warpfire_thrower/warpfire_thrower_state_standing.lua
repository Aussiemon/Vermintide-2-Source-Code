-- chunkname: @scripts/unit_extensions/default_player_unit/enemy_states/warpfire_thrower/warpfire_thrower_state_standing.lua

WarpfireThrowerStateStanding = class(WarpfireThrowerStateStanding, EnemyCharacterStateStanding)

WarpfireThrowerStateStanding.on_enter = function (self, unit, input, dt, context, t, previous_state, params)
	WarpfireThrowerStateStanding.super.on_enter(self, unit, input, dt, context, t, previous_state, params)

	local breed = PlayerBreeds.vs_warpfire_thrower

	self.blackboard = BLACKBOARDS[self._unit]

	local data = self.blackboard.warpfire_data or {
		aim_rotation_dodge_multipler = 0.15,
		aim_rotation_override_distance = 3,
		aim_rotation_override_speed_multiplier = 1.5,
		buff_name_close = "vs_warpfire_thrower_short_distance_damage",
		buff_name_far = "vs_warpfire_thrower_long_distance_damage",
		muzzle_node = "p_fx",
		warpfire_follow_target_speed = 0.75,
		attack_range = breed.shoot_warpfire_attack_range,
		close_attack_range = breed.shoot_warpfire_close_attack_range,
		close_attack_cooldown = breed.shoot_warpfire_close_attack_cooldown,
		hit_radius = breed.shoot_warpfire_close_attack_hit_radius,
		target_position = Vector3Box(0, 0, 0),
	}

	data.is_firing = false
	self._is_firing = false
	data.peer_id = data.peer_id or Network.peer_id()
	self.blackboard.warpfire_data = data
	self._fire_ability_id = self._career_extension:ability_id("fire")
	self._left_wpn_particle_node_name = "p_fx"
	self._left_wpn_particle_name = "fx/wpnfx_gunner_enemy_in_range_1p"
end

WarpfireThrowerStateStanding.update = function (self, unit, input, dt, context, t)
	local handled = self:common_state_changes()

	if handled then
		return
	end

	local csm = self._csm

	self:_update_taunt_dialogue(t)

	handled = self:common_movement(t)

	if not handled then
		CharacterStateHelper.update_weapon_actions(t, unit, self._input_extension, self._inventory_extension, self._health_extension)
	end
end

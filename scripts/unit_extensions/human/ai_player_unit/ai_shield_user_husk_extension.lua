-- chunkname: @scripts/unit_extensions/human/ai_player_unit/ai_shield_user_husk_extension.lua

AIShieldUserHuskExtension = class(AIShieldUserHuskExtension)

AIShieldUserHuskExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._unit = unit
	self.is_blocking = extension_init_data.is_blocking
	self.is_dodging = extension_init_data.is_dodging
end

AIShieldUserHuskExtension.destroy = function (self)
	return
end

AIShieldUserHuskExtension.can_block_attack = function (self, attacker_unit, trueflight_blocking, hit_direction)
	assert(attacker_unit)

	local unit = self._unit
	local game_object_id = Managers.state.unit_storage:go_id(unit)
	local game = Managers.state.network:game()
	local can_block = GameSession.game_object_field(game, game_object_id, "is_blocking")

	if not can_block then
		return false
	end

	local attacker_unit_pos = Unit.world_position(attacker_unit, 0)
	local hit_unit_pos = Unit.world_position(unit, 0)
	local attacker_to_hit_dir = Vector3.normalize(hit_unit_pos - attacker_unit_pos)
	local hit_unit_direction = Quaternion.forward(Unit.local_rotation(unit, 0))
	local hit_angle, behind_target

	if trueflight_blocking then
		hit_angle = Vector3.dot(hit_unit_direction, hit_direction)
		behind_target = hit_angle >= -0.75 and hit_angle <= 1
	else
		hit_angle = Vector3.dot(hit_unit_direction, attacker_to_hit_dir)
		behind_target = hit_angle >= 0.55 and hit_angle <= 1
	end

	local can_block_attack = not behind_target

	return can_block_attack
end

AIShieldUserHuskExtension.get_is_blocking = function (self)
	local unit = self._unit
	local game_object_id = Managers.state.unit_storage:go_id(unit)
	local game = Managers.state.network:game()
	local is_blocking = GameSession.game_object_field(game, game_object_id, "is_blocking")

	return is_blocking
end

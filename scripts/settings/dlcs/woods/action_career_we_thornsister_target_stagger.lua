ActionCareerWEThornsisterTargetStagger = class(ActionCareerWEThornsisterTargetStagger, ActionBase)
local target_decal_unit_name = "units/decals/decal_arrow_kerillian"

ActionCareerWEThornsisterTargetStagger.init = function (self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)
	ActionCareerWEThornsisterTargetStagger.super.init(self, world, item_name, is_server, owner_unit, damage_unit, first_person_unit, weapon_unit, weapon_system)

	self._first_person_extension = ScriptUnit.has_extension(owner_unit, "first_person_system")
	self._decal_unit = nil
	self._unit_spawner = Managers.state.unit_spawner
end

ActionCareerWEThornsisterTargetStagger.client_owner_start_action = function (self, new_action, t, chain_action_data, power_level, action_init_data)
	action_init_data = action_init_data or {}

	ActionCareerWEThornsisterTargetStagger.super.client_owner_start_action(self, new_action, t, chain_action_data, power_level, action_init_data)

	self._is_flat_dir = new_action.is_flat_direction

	if not self.is_bot then
		self._decal_unit = self._unit_spawner:spawn_local_unit(target_decal_unit_name)
	end
end

ActionCareerWEThornsisterTargetStagger.client_owner_post_update = function (self, dt, t, world, can_damage, current_time_in_action)
	if self._decal_unit then
		local player_position = Unit.local_position(self.owner_unit, 0)
		local player_direction_flat = self:_get_direction(true)
		local player_rotation_flat = Quaternion.look(player_direction_flat, Vector3.up())

		Unit.set_local_position(self._decal_unit, 0, player_position)
		Unit.set_local_rotation(self._decal_unit, 0, player_rotation_flat)
	end
end

ActionCareerWEThornsisterTargetStagger.finish = function (self, reason)
	if self._decal_unit then
		self._unit_spawner:mark_for_deletion(self._decal_unit)

		self._decal_unit = nil
	end

	if reason == "new_interupting_action" then
		local final_target_direction = self:_get_direction()
		local targeting_data = {
			direction = Vector3Box(final_target_direction)
		}

		return targeting_data
	end
end

ActionCareerWEThornsisterTargetStagger._get_direction = function (self, force_flat)
	local player_rotation = self._first_person_extension:current_rotation()
	local player_direction_flat = Quaternion.forward(player_rotation)

	if self._is_flat_dir or force_flat then
		player_direction_flat = Vector3.flat(player_direction_flat)
	end

	return player_direction_flat
end

return

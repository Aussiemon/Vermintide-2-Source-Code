ActionMultiShoot = class(ActionMultiShoot, ActionShotgun)
local unit_set_flow_variable = Unit.set_flow_variable
local unit_flow_event = Unit.flow_event

ActionMultiShoot._use_ammo = function (self)
	local current_action = self.current_action
	local ammo_extension = self.ammo_extension
	local ammo_usage = current_action.ammo_usage
	local num_shots_total = self:_get_total_shots()

	if current_action.special_ammo_thing and not self.extra_buff_shot then
		ammo_usage = ammo_extension:current_ammo()
		num_shots_total = ammo_usage
	end

	if ammo_extension and not self.extra_buff_shot and not self.infinite_ammo then
		ammo_extension:use_ammo(ammo_usage)
	end

	self._num_shots_total = num_shots_total
end

ActionMultiShoot._get_barrel_data = function (self, shots_fired)
	local barrels = self.current_action.barrels
	local current_shot = 0

	for _, barrel_template in ipairs(barrels) do
		local shot_count = barrel_template.shot_count
		local upper_limit = current_shot + shot_count
		local shot_index_in_range = current_shot <= shots_fired and shots_fired <= upper_limit

		if shot_index_in_range then
			return barrel_template
		end

		current_shot = upper_limit
	end
end

ActionMultiShoot._get_total_shots = function (self)
	local total_shots = 0
	local shots = self.current_action.barrels

	for _, shot_template in ipairs(shots) do
		total_shots = total_shots + shot_template.shot_count
	end

	return total_shots
end

ActionMultiShoot._combine_rotations = function (self, yaw, pitch, current_rot)
	local yaw_rot = Quaternion(Vector3.up(), yaw)
	local pitch_rot = Quaternion(Vector3.right(), pitch)
	local combined_rotation = Quaternion.multiply(current_rot, yaw_rot)
	combined_rotation = Quaternion.multiply(combined_rotation, pitch_rot)

	return combined_rotation
end

ActionMultiShoot._get_spread_rotation = function (self, num_shots_total, current_rotation, num_layers_spread, bullseye, spread_pitch)
	local spread_extension = self.spread_extension

	if spread_extension then
		local barrel_data = self:_get_barrel_data(self._shots_fired)
		local yaw = math.degrees_to_radians(barrel_data.yaw)
		local pitch = math.degrees_to_radians(barrel_data.pitch)
		local base_rotation = self:_combine_rotations(yaw, pitch, current_rotation)

		return spread_extension:get_target_style_spread(self._shots_fired, num_shots_total, base_rotation, num_layers_spread, bullseye, spread_pitch)
	else
		return current_rotation
	end
end

ActionMultiShoot._shoot = function (self, num_shots_total, num_shots_this_frame)
	local current_action = self.current_action
	local current_position = self._fire_position:unbox()
	local current_rotation = self._fire_rotation:unbox()
	local world = self.world
	local physics_world = self.physics_world
	local check_buffs = self._check_buffs
	local num_layers_spread = current_action.num_layers_spread or 1
	local bullseye = current_action.bullseye or false
	local spread_pitch = current_action.spread_pitch or 0.8
	local weapon_unit = self.weapon_unit
	local item_name = self.item_name
	local owner_unit = self.owner_unit
	local is_server = self.is_server

	for i = 1, num_shots_this_frame, 1 do
		self._shots_fired = self._shots_fired + 1
		local rotation = self:_get_spread_rotation(num_shots_total, current_rotation, num_layers_spread, bullseye, spread_pitch)
		local direction = Quaternion.forward(rotation)
		local result = PhysicsWorld.immediate_raycast_actors(physics_world, current_position, direction, current_action.range, "static_collision_filter", "filter_player_ray_projectile_static_only", "dynamic_collision_filter", "filter_player_ray_projectile_ai_only", "dynamic_collision_filter", "filter_player_ray_projectile_hitbox_only")

		if result then
			local data = DamageUtils.process_projectile_hit(world, item_name, owner_unit, is_server, result, current_action, direction, check_buffs, nil, self.shield_users_blocking, self._is_critical_strike, self.power_level)

			if data.buffs_checked then
				check_buffs = check_buffs and false
			end

			if data.blocked_by_unit then
				self.shield_users_blocking[data.blocked_by_unit] = true
			end

			local hit_position = result[#result][1] or current_position + direction * current_action.range

			unit_set_flow_variable(weapon_unit, "hit_position", hit_position)
			unit_set_flow_variable(weapon_unit, "fire_position", current_position)
			unit_set_flow_variable(weapon_unit, "fire_direction", direction)
			unit_set_flow_variable(weapon_unit, "trail_life", Vector3.length(hit_position - current_position) * 0.1)
			unit_flow_event(weapon_unit, "lua_bullet_trail")
		end
	end

	self._check_buffs = check_buffs
end

ActionMultiShoot.finish = function (self, reason)
	ActionMultiShoot.super.finish(self, reason)

	local ammo_extension = self.ammo_extension
	local current_action = self.current_action
	local owner_unit = self.owner_unit

	if reason ~= "new_interupting_action" then
		local status_extension = ScriptUnit.extension(owner_unit, "status_system")

		status_extension:set_zooming(false)

		local reload_when_out_of_ammo_condition_func = current_action.reload_when_out_of_ammo_condition_func
		local do_out_of_ammo_reload = (not reload_when_out_of_ammo_condition_func and true) or reload_when_out_of_ammo_condition_func(owner_unit, reason)

		if ammo_extension and current_action.reload_when_out_of_ammo and do_out_of_ammo_reload and ammo_extension:ammo_count() == 0 and ammo_extension:can_reload() then
			ammo_extension:start_reload(true)
		end
	end
end

return

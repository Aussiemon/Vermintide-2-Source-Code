RotatingHazardExtension = class(RotatingHazardExtension)
local PI = math.pi
local PI_2 = PI * 2
local STATE_RUNNING = 1
local STATE_PAUSED = 2
local STATE_STOPPED = 3
local SETTINGS = {
	damage_entry = 40,
	random_direction = true,
	anticipation_delay = 5,
	random_start_rotation = true,
	damage_tick = 15,
	rotation_speed = 10,
	damage_tick_rate = 0.5,
	buffs_on_entry = {
		"wall_slow_debuff"
	},
	buffs_on_tick = {
		"wall_slow_debuff"
	},
	starting_state = STATE_STOPPED,
	areas = {
		{
			angle_offset = 0,
			height_min = -1,
			length = 35,
			height_max = 5,
			flow_name = "first",
			width = 10,
			length_offset = 1
		},
		{
			height_min = -1,
			length = 35,
			height_max = 5,
			flow_name = "second",
			width = 10,
			length_offset = 1,
			angle_offset = PI
		}
	},
	init_func = function ()
		return
	end
}

SETTINGS.update_func = function (world, unit, settings, state, is_activating, area_settings, area_data, angle, rotation_direction, t)
	if is_activating == true then
		return
	end

	local spawn_start_dist = 7
	local min_spawn_radius = 0.3
	local near_spawn_radius = 0.55
	local far_spawn_radius = 2
	local near_spawn_center_offset = 2
	local far_spawn_center_offset = 0
	local effect_spawn_cooldown = 0.3
	local close_spawn_penalty = 0.4
	local effect_spawn_rotation_offset_range = PI / 15
	local lead_time = state == STATE_RUNNING and 1 or 0
	local area_rotation = Quaternion.axis_angle(Vector3.up(), angle + area_settings.angle_offset + math.rad(settings.rotation_speed) * lead_time * rotation_direction)
	local area_dir = Quaternion.forward(area_rotation)
	local wall_pos = Unit.local_position(unit, 0)
	local wall_half_width = area_settings.width / 2
	local side = Managers.state.side:get_side_from_name("heroes")
	local player_units = side.PLAYER_UNITS
	local last_index = area_data.last_index or 1
	local hand_units_by_player = area_data.hand_units_by_player or {}
	area_data.hand_units_by_player = hand_units_by_player
	local num_players = #player_units
	local start_player_unit_idx = last_index >= num_players and 0 or last_index

	for i = 0, num_players - 1 do
		local player_unit_idx = (i + start_player_unit_idx) % num_players + 1
		local player_unit = player_units[player_unit_idx]
		local next_fx_t = area_data[player_unit]

		if ALIVE[player_unit] and (not next_fx_t or next_fx_t <= t) then
			local pos = POSITION_LOOKUP[player_unit]
			local distance_from_center = Vector3.length(pos - wall_pos)
			local distance_from_center_t = math.min(distance_from_center / area_settings.length, 1)
			local width_at_closest_point = wall_half_width * distance_from_center_t
			local closest_pos = Geometry.closest_point_on_line(pos, wall_pos + area_dir * area_settings.length_offset, wall_pos + area_dir * area_settings.length)
			local closest_to_player = pos - closest_pos
			local closest_to_player_dir = Vector3.normalize(closest_to_player)
			local closest_to_player_dist = Vector3.length(closest_to_player)

			if closest_to_player_dist <= width_at_closest_point + spawn_start_dist then
				local effect_center = closest_to_player_dist <= width_at_closest_point and pos or closest_pos + closest_to_player_dir * width_at_closest_point
				local wall_edge_dir = Vector3.normalize(wall_pos - effect_center)
				local wall_edge_dist = Vector3.length(wall_pos - effect_center)

				if area_settings.length < wall_edge_dist then
					local delta_adjustment = wall_edge_dist - area_settings.length
					effect_center = effect_center + wall_edge_dir * delta_adjustment
				end

				local nearness = math.clamp(1 - closest_to_player_dist / width_at_closest_point, 0, 1)
				local spawn_radius = math.min(math.lerp(near_spawn_radius, far_spawn_radius, nearness), math.max(width_at_closest_point, min_spawn_radius))
				local distance_from_closest_edge = math.min(math.max(wall_edge_dist - area_settings.length_offset, 0), math.max(area_settings.length - wall_edge_dist, 0))
				local spawn_center_offset = math.min(math.lerp(near_spawn_center_offset, far_spawn_center_offset, nearness), distance_from_closest_edge)
				effect_center = effect_center + wall_edge_dir * (math.random() - 0.5) * 2 * spawn_center_offset
				local nav_world = Managers.state.entity:system("ai_system"):nav_world()
				local nav_pos = ConflictUtils.get_spawn_pos_on_circle(nav_world, effect_center, 0.1, spawn_radius * 2, 1, false, nil, nil, 5, 5)

				if nav_pos then
					local up = Vector3.up()
					local effect_rot = Quaternion.multiply(Quaternion.look(pos - nav_pos, up), Quaternion.axis_angle(up, (math.random() - 0.5) * effect_spawn_rotation_offset_range))
					local fx_unit = World.spawn_unit(world, "units/beings/enemies/undead_skeleton_hand/chr_undead_skeleton_hand", nav_pos, effect_rot)
					local scale = 1.75

					Unit.set_local_scale(fx_unit, 0, Vector3(scale, scale, scale))

					area_data[player_unit] = t + math.max((0.3 - distance_from_center_t) / 0.3, 0) * close_spawn_penalty + effect_spawn_cooldown
					local hand_units = hand_units_by_player[player_unit] or {}
					hand_units_by_player[player_unit] = hand_units
					hand_units[fx_unit] = Unit.animation_find_constraint_target(fx_unit, "look_at")
					area_data.last_index = player_unit_idx

					break
				end
			end
		end
	end

	for player_unit, hand_units in pairs(hand_units_by_player) do
		local player_pos = POSITION_LOOKUP[player_unit]

		if player_pos then
			for hand_unit, constraint_target_var in pairs(hand_units) do
				if not Unit.alive(hand_unit) then
					hand_units[hand_unit] = nil
				else
					Unit.animation_set_constraint_target(hand_unit, constraint_target_var, player_pos)
				end
			end
		else
			hand_units_by_player[player_unit] = nil
		end
	end
end

RotatingHazardExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local settings = SETTINGS
	self._settings = settings
	self._unit = unit
	self._world = extension_init_context.world
	self._is_server = extension_init_context.is_server
	self._state = extension_init_data.state or settings.starting_state
	self._start_t = extension_init_data.start_network_time or Managers.state.network:network_time()
	self._pause_t = self._start_t
	self._next_damage_t = 0
	self._last_update_idx = 0
	self._num_areas = #settings.areas
	self._rotation_speed_rad = math.rad(settings.rotation_speed)
	self._start_rotation_offset = 0
	self._rotation_direction = 1
	self._current_seed = Managers.mechanism:get_level_seed()
	self._next_seed = self._current_seed
	self._area_data = {}

	for i = 1, self._num_areas do
		local area = settings.areas[i]
		area.angular_half_size = area.angular_half_size or math.atan2(area.width / 2, area.length)
		self._area_data[i] = {
			overlapping_units = {}
		}
	end
end

RotatingHazardExtension.hot_join_sync = function (self, peer_id)
	local network_manager = Managers.state.network
	local go_id, is_level_unit = network_manager:game_object_or_level_id(self._unit)

	if go_id then
		network_manager.network_transmit:send_rpc("rpc_sync_rotating_hazard", peer_id, go_id, is_level_unit, self._start_t, self._pause_t, self._state, self._current_seed)
	end
end

RotatingHazardExtension.network_sync = function (self, start_t, pause_t, state, seed)
	self._start_t = start_t
	self._pause_t = pause_t
	self._state = state
	self._is_activating = nil

	if state == STATE_RUNNING then
		for i = 1, self._num_areas do
			self._area_data[i].last_update_t = nil
		end

		self:_update_random_settings_from_seed(seed)
	end

	if state == STATE_STOPPED then
		Unit.flow_event(self._unit, "stop")
	elseif state == STATE_PAUSED then
		Unit.flow_event(self._unit, "pause")
	end
end

RotatingHazardExtension.destroy = function (self)
	return
end

RotatingHazardExtension.start = function (self, reset_rotation)
	if self._is_server and (self._state ~= STATE_RUNNING or reset_rotation) then
		self._state = STATE_RUNNING
		self._is_activating = nil

		if reset_rotation then
			self._start_t = Managers.state.network:network_time()
			self._pause_t = self._start_t

			for i = 1, self._num_areas do
				self._area_data[i].last_update_t = nil
			end

			self:_update_random_settings_from_seed(self._next_seed)
		else
			self._start_t = Managers.state.network:network_time() - (self._pause_t - self._start_t)
		end

		local go_id, is_level_unit = Managers.state.network:game_object_or_level_id(self._unit)

		Managers.state.network.network_transmit:send_rpc_clients("rpc_sync_rotating_hazard", go_id, is_level_unit, self._start_t, self._pause_t, self._state, self._current_seed)
	end
end

RotatingHazardExtension._update_random_settings_from_seed = function (self, seed)
	local new_seed = seed
	local random_number = nil
	local settings = self._settings

	if settings.random_start_rotation then
		new_seed, random_number = Math.next_random(new_seed)
		self._start_rotation_offset = PI_2 * random_number
	end

	if settings.random_direction then
		new_seed, random_number = Math.next_random(new_seed)
		self._rotation_direction = random_number >= 0.5 and 1 or -1
	end

	self._current_seed = seed
	self._next_seed = new_seed

	Unit.set_data(self._unit, "rotation_direction", self._rotation_direction)

	for i = 1, self._num_areas do
		local area = settings.areas[i]

		if area.flow_name then
			local angular_half_size = area.angular_half_size
			local angle_offset = area.angle_offset
			local rotation_offset_front = Quaternion.axis_angle(Vector3.up(), angle_offset + self._rotation_direction * angular_half_size)
			local rotation_offset_center = Quaternion.axis_angle(Vector3.up(), angle_offset)
			local rotation_offset_back = Quaternion.axis_angle(Vector3.up(), angle_offset - self._rotation_direction * angular_half_size)

			Unit.set_data(self._unit, "fx_rotation", "front", area.flow_name, rotation_offset_front)
			Unit.set_data(self._unit, "fx_rotation", "center", area.flow_name, rotation_offset_center)
			Unit.set_data(self._unit, "fx_rotation", "back", area.flow_name, rotation_offset_back)
		end
	end
end

RotatingHazardExtension.pause = function (self)
	if self._is_server and self._state == STATE_RUNNING then
		self._state = STATE_PAUSED
		self._is_activating = nil
		self._pause_t = Managers.state.network:network_time()
		local go_id, is_level_unit = Managers.state.network:game_object_or_level_id(self._unit)

		Managers.state.network.network_transmit:send_rpc_clients("rpc_sync_rotating_hazard", go_id, is_level_unit, self._start_t, self._pause_t, self._state, self._current_seed)
		Unit.flow_event(self._unit, "pause")
	end
end

RotatingHazardExtension.stop = function (self)
	if self._is_server and self._state ~= STATE_STOPPED then
		if self._state == STATE_RUNNING then
			self._pause_t = Managers.state.network:network_time()
		end

		self._state = STATE_STOPPED
		self._is_activating = nil
		local go_id, is_level_unit = Managers.state.network:game_object_or_level_id(self._unit)

		Managers.state.network.network_transmit:send_rpc_clients("rpc_sync_rotating_hazard", go_id, is_level_unit, self._start_t, self._pause_t, self._state, self._current_seed)
		Unit.flow_event(self._unit, "stop")
	end
end

RotatingHazardExtension.update = function (self, unit, input, dt, context, t)
	local state = self._state

	if state == STATE_STOPPED then
		return
	end

	local current_t = Managers.state.network:network_time()

	if state == STATE_PAUSED then
		current_t = self._pause_t
	end

	local settings = self._settings
	local anticipation_delay = settings.anticipation_delay
	local is_activating = current_t < anticipation_delay + self._start_t
	local real_start_t = is_activating and current_t or anticipation_delay + self._start_t
	local angle = (self._start_rotation_offset + (current_t - real_start_t) * self._rotation_speed_rad * self._rotation_direction) % PI_2

	Unit.set_local_rotation(unit, 0, Quaternion.axis_angle(Vector3.up(), angle))

	if state == STATE_RUNNING and self._is_activating ~= is_activating then
		self._is_activating = is_activating

		if is_activating then
			Unit.flow_event(self._unit, "start_anticipation")
		else
			Unit.flow_event(self._unit, "start_rotation")
		end
	end

	local current_idx = self._last_update_idx % self._num_areas + 1
	local area_data = self._area_data[current_idx]
	local area_settings = settings.areas[current_idx]

	if self._is_server and not is_activating then
		self:_update_damage(area_settings, area_data, angle, dt, current_t)
	end

	settings.update_func(self._world, unit, settings, state, is_activating, area_settings, area_data, angle, self._rotation_direction, t)

	self._last_update_idx = current_idx
end

local temp_overlap_table = {}

RotatingHazardExtension._update_damage = function (self, area_settings, area_data, angle, dt, t)
	local last_update_t = area_data.last_update_t or t
	local angle_offset = area_settings.angle_offset
	local angle_delta_since_last_t = (t - last_update_t) * self._rotation_speed_rad
	local mid_point_rotation = Quaternion.axis_angle(Vector3.up(), angle + angle_offset - angle_delta_since_last_t / 2)
	local mid_point_forward = Quaternion.forward(mid_point_rotation)
	local damage_angular_half_size = angle_delta_since_last_t / 2 + area_settings.angular_half_size
	local damage_angular_half_cos = math.cos(damage_angular_half_size)
	local settings = self._settings
	local overlapping_units = area_data.overlapping_units
	local players = Managers.player:human_players()
	local hazard_unit = self._unit
	local center_position = Unit.local_position(hazard_unit, 0)
	local distance_limit_sq = area_settings.length * area_settings.length
	local distance_offset_sq = area_settings.length_offset * area_settings.length_offset
	local buff_system = Managers.state.entity:system("buff_system")

	for _, player in pairs(players) do
		local player_unit = player.player_unit
		local player_position = POSITION_LOOKUP[player_unit]

		if player_position then
			local player_distance = Vector3.distance_squared(player_position, center_position)

			if distance_offset_sq <= player_distance and player_distance <= distance_limit_sq then
				local dir_to_player = Vector3.normalize(Vector3.flat(player_position - center_position))

				if damage_angular_half_cos <= Vector3.dot(mid_point_forward, dir_to_player) then
					temp_overlap_table[player_unit] = true

					if not overlapping_units[player_unit] then
						local damage_type = "kinetic"
						local hit_react_type = "heavy"

						DamageUtils.add_damage_network(player_unit, hazard_unit, settings.damage_entry, "full", damage_type, nil, dir_to_player, nil, nil, hazard_unit, nil, hit_react_type)

						local buffs_to_add = settings.buffs_on_entry

						for i = 1, #buffs_to_add do
							buff_system:add_buff_synced(player_unit, buffs_to_add[i], BuffSyncType.All)
						end

						overlapping_units[player_unit] = t
					else
						local last_tick_t = overlapping_units[player_unit]
						local damage_tick_rate = settings.damage_tick_rate

						if t >= last_tick_t + damage_tick_rate then
							local damage_type = "kinetic"
							local hit_react_type = "medium"

							DamageUtils.add_damage_network(player_unit, hazard_unit, settings.damage_tick, "full", damage_type, nil, dir_to_player, nil, nil, hazard_unit, nil, hit_react_type)

							local buffs_to_add = settings.buffs_on_tick

							for i = 1, #buffs_to_add do
								buff_system:add_buff_synced(player_unit, buffs_to_add[i], BuffSyncType.All)
							end

							last_tick_t = last_tick_t + damage_tick_rate
							overlapping_units[player_unit] = last_tick_t
						end
					end
				end
			end
		end
	end

	for unit in pairs(overlapping_units) do
		if not temp_overlap_table[unit] then
			overlapping_units[unit] = nil
		end
	end

	table.clear(temp_overlap_table)

	area_data.last_update_t = t
end

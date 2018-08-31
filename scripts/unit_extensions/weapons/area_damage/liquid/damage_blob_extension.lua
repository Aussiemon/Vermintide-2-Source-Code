DamageBlobExtension = class(DamageBlobExtension)
local unit_alive = Unit.alive
local player_and_bot_units = PLAYER_AND_BOT_UNITS
local position_lookup = POSITION_LOOKUP

DamageBlobExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local world = extension_init_context.world
	local entity_manager = Managers.state.entity
	local ai_system = entity_manager:system("ai_system")
	local network_manager = Managers.state.network
	self.world = world
	self.game = network_manager:game()
	self.unit = unit
	self.nav_world = ai_system:nav_world()
	self.ai_system = ai_system
	self.network_transmit = network_manager.network_transmit
	self.ai_blob_index = 1
	self.blobs = {}
	self.rim_nodes = {}
	self.fx_list = {}
	self.sfx_list = {}
	self.ai_units_inside = {}
	self.player_units_inside = {}
	local buff_system = entity_manager:system("buff_system")
	self.buff_system = buff_system
	self._source_unit = extension_init_data.source_unit
	local template_name = extension_init_data.damage_blob_template_name
	local template = DamageBlobTemplates.templates[template_name]
	self.template = template
	self.damage_blob_template_name = template_name
	self.immune_breeds = template.immune_breeds
	self.fx_name_filled = template.fx_name_filled
	self.fx_name_rim = template.fx_name_rim
	self.fx_size_variable = template.fx_size_variable
	self.fx_max_height = template.fx_max_height
	self.fx_max_radius = template.fx_max_radius
	self.buff_template_name = template.buff_template_name
	self.buff_template_type = template.buff_template_type
	self.blob_radius = template.blob_radius
	self.blob_separation_dist = template.blob_separation_dist
	self.fx_separation_dist = template.fx_separation_dist
	self.apply_buff_to_ai = template.apply_buff_to_ai
	self.apply_buff_to_player = template.apply_buff_to_player
	self.time_of_life = template.time_of_life
	self.blob_life_time = template.blob_life_time
	self._sfx_name_stop = template.sfx_name_stop
	self._sfx_name_start_remains = template.sfx_name_start_remains
	self._sfx_name_stop_remains = template.sfx_name_stop_remains
	local init_function = template.init_function

	if init_function then
		local t = Managers.time:time("game")

		DamageBlobTemplates[init_function](self, t)
	end

	local update_function = template.update_function

	if update_function then
		self._blob_update_function = DamageBlobTemplates[update_function]
	end

	local sfx_name_start = template.sfx_name_start

	if sfx_name_start then
		WwiseUtils.trigger_unit_event(world, sfx_name_start, unit, 0)
	end
end

DamageBlobExtension.start_placing_blobs = function (self, wait_time, t)
	self.state = "waiting"
	self.last_blob_pos = Vector3Box()
	self.last_blob_dist = 0
	self.last_fx_pos = Vector3Box()
	self.last_fx_dist = 0
	local unit = self.unit
	self.unit_id = Managers.state.network:unit_game_object_id(unit)
	self.wait_time = t + wait_time
	local template = self.template
	local use_nav_cost_map_volumes = template.use_nav_cost_map_volumes

	if use_nav_cost_map_volumes then
		local nav_cost_map_cost_type = template.nav_cost_map_cost_type
		local num_volumes_guess = 10
		local ai_system = self.ai_system
		self._nav_cost_map_id = ai_system:create_nav_cost_map(nav_cost_map_cost_type, num_volumes_guess)
	end

	self.use_nav_cost_map_volumes = use_nav_cost_map_volumes
end

local BLOB_EXTRA_SAFE_DISTANCE = 0.5

DamageBlobExtension.stop_placing_blobs = function (self, t)
	self.state = "lingering"
	self.linger_time = t + self.time_of_life
	local unit = self.unit
	local sfx_name_stop = self._sfx_name_stop

	if sfx_name_stop and unit_alive(unit) then
		WwiseUtils.trigger_unit_event(self.world, sfx_name_stop, unit, 0)
	end

	local blobs = self.blobs
	local num_blobs = #blobs

	if num_blobs > 0 then
		local rotation = Unit.local_rotation(unit, 0)
		local forward = Quaternion.forward(rotation)
		local last_blob = blobs[num_blobs]
		local position = Vector3(last_blob[1], last_blob[2], last_blob[3])
		local radius = last_blob[4]
		local rim_distance = radius + BLOB_EXTRA_SAFE_DISTANCE
		local rim_position_forward = position + forward * rim_distance
		local success_forward, altitude_forward = GwNavQueries.triangle_from_position(self.nav_world, rim_position_forward, 1.5, 1.5)

		if success_forward then
			local rim_nodes = self.rim_nodes
			rim_position_forward.z = altitude_forward
			rim_nodes[#rim_nodes + 1] = Vector3Box(rim_position_forward)
		end
	end

	self.aborted = true
end

DamageBlobExtension._remove_blob = function (self, blob, blob_index, blobs)
	local buff_system = self.buff_system
	local ai_units_inside = self.ai_units_inside
	local ai_units_inside_blob = blob[5]

	for target_unit, inside_id in pairs(ai_units_inside_blob) do
		if ALIVE[target_unit] then
			buff_system:remove_server_controlled_buff(target_unit, inside_id)
		end

		ai_units_inside[target_unit] = nil
	end

	local volume_id = blob[7]

	if volume_id then
		local ai_system = self.ai_system
		local cost_map_id = self._nav_cost_map_id

		ai_system:remove_nav_cost_map_volume(volume_id, cost_map_id)
	end

	table.remove(blobs, blob_index)
end

DamageBlobExtension.destroy = function (self)
	local unit = self.unit
	local buff_system = self.buff_system
	local player_units_inside = self.player_units_inside

	for target_unit, inside_id in pairs(player_units_inside) do
		if unit_alive(target_unit) then
			local status_extension = ScriptUnit.extension(target_unit, "status_system")

			if status_extension.in_liquid_unit == unit then
				StatusUtils.set_in_liquid_network(target_unit, false)
			end

			buff_system:remove_server_controlled_buff(target_unit, inside_id)
		end
	end

	local blobs = self.blobs
	local num_blobs = #blobs
	local ai_system = self.ai_system
	local cost_map_id = self._nav_cost_map_id

	for i = 1, num_blobs, 1 do
		local blob = blobs[i]
		local ai_units_inside_blob = blob[5]

		for target_unit, inside_id in pairs(ai_units_inside_blob) do
			if ALIVE[target_unit] then
				buff_system:remove_server_controlled_buff(target_unit, inside_id)
			end
		end

		local volume_id = blob[7]

		if volume_id then
			ai_system:remove_nav_cost_map_volume(volume_id, cost_map_id)
		end
	end

	if cost_map_id then
		ai_system:destroy_nav_cost_map(cost_map_id)
	end

	local world = self.world
	local fx_list = self.fx_list

	for i = 1, #fx_list, 1 do
		local fx_id = fx_list[i].id

		World.stop_spawning_particles(world, fx_id)

		fx_list[i] = nil
	end

	local unit = self.unit
	local sfx_name_stop = self._sfx_name_stop

	if sfx_name_stop and unit_alive(unit) then
		WwiseUtils.trigger_unit_event(world, sfx_name_stop, unit, 0)
	end

	local wwise_world = Managers.world:wwise_world(world)
	local sfx_list = self.sfx_list

	for i = 1, #sfx_list, 1 do
		local sfx_id = sfx_list[i].source
		local has_source = WwiseWorld.has_source(wwise_world, sfx_id)

		if has_source then
			WwiseWorld.trigger_event(wwise_world, self._sfx_name_stop_remains, sfx_id)
		end

		sfx_list[i] = nil
	end

	self.aborted = true
end

DamageBlobExtension.place_blobs = function (self, unit, t)
	local position = position_lookup[unit]
	local nav_world = self.nav_world
	local success, altitude, p1, p2, p3 = GwNavQueries.triangle_from_position(nav_world, position, 5, 5)

	if success then
		position = Vector3(position.x, position.y, altitude)
	end

	local last_blob_pos = self.last_blob_pos:unbox()
	local to_last_blob = last_blob_pos - position
	local blob_dist_sq = Vector3.length_squared(to_last_blob)
	local blob_separation_dist_sq = self.blob_separation_dist^2
	local rotation = Unit.local_rotation(unit, 0)

	if blob_separation_dist_sq <= blob_dist_sq then
		local blob_radius = self.blob_radius

		self:insert_blob(position, blob_radius, rotation, t, nav_world)

		if success then
			local id, source = WwiseUtils.trigger_position_event(self.world, self._sfx_name_start_remains, position)
			local sfx_list = self.sfx_list
			sfx_list[#sfx_list + 1] = {
				source = source,
				time = t + self.blob_life_time
			}
		end
	end

	local last_fx_pos = self.last_fx_pos:unbox()
	local to_last_fx = last_fx_pos - position
	local fx_dist_sq = Vector3.length_squared(to_last_fx)
	local fx_separation_dist_sq = self.fx_separation_dist^2

	if fx_dist_sq >= fx_separation_dist_sq then
		local rot = nil

		if p1 then
			local p1_to_p2 = p2 - p1
			local normal = Vector3.cross(p1_to_p2 - p1, p3 - p1)
			rot = Quaternion.look(p1_to_p2, normal)
		else
			rot = Quaternion.look(to_last_blob, Vector3(0, 0, 1))
		end

		self:insert_fx(position, rot, t)
	end

	local game = self.game
	local unit_id = self.unit_id

	GameSession.set_game_object_field(game, unit_id, "position", position)
	GameSession.set_game_object_field(game, unit_id, "rotation", rotation)
end

DamageBlobExtension.update = function (self, unit, input, dt, context, t)
	local state = self.state

	if state == "waiting" then
		if self.wait_time < t then
			self.state = "running"
		end
	elseif state == "running" then
		self:place_blobs(unit, t)
	elseif state == "lingering" and self.linger_time < t then
		Managers.state.unit_spawner:mark_for_deletion(unit)
	end

	self:update_blobs_fx_and_sfx(t, dt)
	self:update_blob_overlaps(t)

	local blob_update_function = self._blob_update_function

	if blob_update_function then
		local result = self:_blob_update_function(t, dt, unit)
		local unit_id = self.unit_id

		if not result and unit_id then
			self._blob_update_function = nil

			self.network_transmit:send_rpc_clients("rpc_abort_damage_blob", unit_id)
		end
	end

	if script_data.debug_damage_blobs then
		self:_debug_render_blobs()
	end
end

DamageBlobExtension.insert_blob = function (self, position, radius, rotation, t, nav_world)
	local nav_cost_map_volume_id = nil

	if self.use_nav_cost_map_volumes then
		local ai_system = self.ai_system
		local cost_map_id = self._nav_cost_map_id
		nav_cost_map_volume_id = ai_system:add_nav_cost_map_sphere_volume(position, radius, cost_map_id)
	end

	local blobs = self.blobs
	local blob_index = #blobs + 1
	blobs[blob_index] = {
		position[1],
		position[2],
		position[3],
		radius,
		{},
		t + self.blob_life_time,
		nav_cost_map_volume_id
	}

	self.last_blob_pos:store(position)

	local rim_nodes = self.rim_nodes
	local rim_distance = radius + BLOB_EXTRA_SAFE_DISTANCE
	local right = Quaternion.right(rotation)
	local rim_position_right = position + right * rim_distance
	local success_right, altitude_right = GwNavQueries.triangle_from_position(nav_world, rim_position_right, 1.5, 1.5)

	if success_right then
		rim_position_right.z = altitude_right
		rim_nodes[#rim_nodes + 1] = Vector3Box(rim_position_right)
	end

	local left = -right
	local rim_position_left = position + left * rim_distance
	local success_left, altitude_left = GwNavQueries.triangle_from_position(nav_world, rim_position_left, 1.5, 1.5)

	if success_left then
		rim_position_left.z = altitude_left
		rim_nodes[#rim_nodes + 1] = Vector3Box(rim_position_left)
	end

	if blob_index == 1 then
		local backward = -Quaternion.forward(rotation)
		local rim_position_backward = position + backward * rim_distance
		local success_backward, altitude_backward = GwNavQueries.triangle_from_position(nav_world, rim_position_backward, 1.5, 1.5)

		if success_backward then
			rim_position_backward.z = altitude_backward
			rim_nodes[#rim_nodes + 1] = Vector3Box(rim_position_backward)
		end
	end
end

DamageBlobExtension.insert_fx = function (self, position, rot, t)
	local world = self.world
	local fx_list = self.fx_list
	local blob_life_time = t + self.blob_life_time
	local fx_name_filled = self.fx_name_filled
	local fx_id_filled = World.create_particles(world, fx_name_filled, position, rot or Quaternion.identity())
	fx_list[#fx_list + 1] = {
		position = Vector3Box(position),
		id = fx_id_filled,
		time = blob_life_time,
		size = Vector3Box(0.6, 1.2, 0)
	}
	local fx_name_rim = self.fx_name_rim
	local fx_id_rim = World.create_particles(world, fx_name_rim, position, rot or Quaternion.identity())
	fx_list[#fx_list + 1] = {
		position = Vector3Box(position),
		id = fx_id_rim,
		time = blob_life_time
	}
	local unit_id = self.unit_id

	if unit_id then
		local life_time_percentage = 1

		self.network_transmit:send_rpc_clients("rpc_add_damage_blob_fx", unit_id, position, life_time_percentage)
	end

	self.last_fx_pos:store(position)
end

DamageBlobExtension.update_blobs_fx_and_sfx = function (self, t, dt)
	local world = self.world
	local fx_name_filled = self.fx_name_filled
	local fx_size_variable = self.fx_size_variable
	local fx_max_radius = self.fx_max_radius
	local fx_max_height = self.fx_max_height
	local fx_list = self.fx_list

	if #fx_list >= 1 then
		local index = next(self.fx_list, self.current_fx_index) or 1
		local fx_entry = fx_list[index]

		if fx_entry then
			self.current_fx_index = index
			local fx_id = fx_entry.id
			local fx_size = fx_entry.size

			if fx_size then
				local particle_size = fx_size:unbox()
				particle_size[1] = math.min(particle_size[1] + dt * 1.5, fx_max_radius)
				particle_size[2] = math.min(particle_size[2] + dt * 2, fx_max_height)
				local effect_variable_id = World.find_particles_variable(world, fx_name_filled, fx_size_variable)

				World.set_particles_variable(world, fx_id, effect_variable_id, particle_size)
				fx_size:store(particle_size)
			end

			local fx_time = fx_entry.time

			if fx_time < t then
				World.stop_spawning_particles(world, fx_id)
			end
		end
	end

	local sfx_list = self.sfx_list
	local sfx_name_stop_remains = self._sfx_name_stop_remains
	local wwise_world = Managers.world:wwise_world(world)

	for i = 1, #sfx_list, 1 do
		local sfx_entry = sfx_list[i]
		local sfx_source = sfx_entry.source
		local sfx_time = sfx_entry.time

		if sfx_time < t then
			local has_source = WwiseWorld.has_source(wwise_world, sfx_source)

			if has_source then
				WwiseWorld.trigger_event(wwise_world, sfx_name_stop_remains, sfx_source)
			end
		end
	end
end

DamageBlobExtension.update_blob_overlaps = function (self, t)
	local blobs = self.blobs
	local num_blobs = #blobs

	if num_blobs < 1 then
		return
	end

	local unit = self.unit
	local buff_system = self.buff_system
	local first_blob = blobs[1]
	local last_blob = blobs[num_blobs]
	local first_blob_position = Vector3(first_blob[1], first_blob[2], first_blob[3])
	local last_blob_position = Vector3(last_blob[1], last_blob[2], last_blob[3])

	if self.apply_buff_to_player then
		local blob_radius = self.blob_radius

		for i = 1, #player_and_bot_units, 1 do
			local target_unit = player_and_bot_units[i]

			self:check_overlap(unit, target_unit, blob_radius, first_blob_position, last_blob_position, buff_system, num_blobs)
		end
	end

	if not self.apply_buff_to_ai then
		return
	end

	local blobs_per_frame = 1
	local blob_index = self.ai_blob_index
	local amount = math.min(blobs_per_frame, num_blobs)
	local buff_template_name = self.buff_template_name
	local buff_template_type = self.buff_template_type
	local immune_breeds = self.immune_breeds
	local ai_units_inside = self.ai_units_inside
	local BLACKBOARDS = BLACKBOARDS
	local ai_units = FrameTable.alloc_table()
	local inside_this_frame = FrameTable.alloc_table()

	while amount > 0 do
		local blob = blobs[blob_index]
		local blob_position = Vector3(blob[1], blob[2], blob[3])
		local blob_radius = blob[4]
		local ai_units_inside_blob = blob[5]

		if blob[6] < t then
			self:_remove_blob(blob, blob_index, blobs)

			num_blobs = num_blobs - 1
		else
			local num_ai_units = AiUtils.broadphase_query(blob_position, blob_radius, ai_units)

			for i = 1, num_ai_units, 1 do
				local target_unit = ai_units[i]
				local inside_blob = ai_units_inside[target_unit]

				if AiUtils.unit_alive(target_unit) and (inside_blob == nil or inside_blob == blob) then
					local target_position = position_lookup[target_unit]
					local pos_projected_on_wave_line = Geometry.closest_point_on_line(target_position, first_blob_position, last_blob_position)
					local to_line_distance_sq = Vector3.distance_squared(target_position, pos_projected_on_wave_line)

					if to_line_distance_sq < blob_radius^2 then
						local target_blackboard = BLACKBOARDS[target_unit]
						local breed = target_blackboard.breed
						local breed_name = breed.name
						local buff_extension = ScriptUnit.has_extension(target_unit, "buff_system")

						if buff_extension and not immune_breeds[breed_name] and not buff_extension:has_buff_type(buff_template_type) then
							ai_units_inside_blob[target_unit] = buff_system:add_buff(target_unit, buff_template_name, unit, true)
						end

						ai_units_inside[target_unit] = blob
						inside_this_frame[target_unit] = true
					end
				end
			end

			for target_unit, inside_id in pairs(ai_units_inside_blob) do
				if not inside_this_frame[target_unit] then
					if ALIVE[target_unit] then
						buff_system:remove_server_controlled_buff(target_unit, inside_id)
					end

					ai_units_inside[target_unit] = nil
					ai_units_inside_blob[target_unit] = nil
				end
			end

			blob_index = blob_index + 1
		end

		if num_blobs < blob_index then
			blob_index = 1
		end

		amount = amount - 1
	end

	self.ai_blob_index = blob_index
end

DamageBlobExtension.check_overlap = function (self, unit, target_unit, blob_radius, p1, p2, buff_system, num_blobs)
	local player_units_inside = self.player_units_inside
	local test_pos = position_lookup[target_unit]
	local pos_projected_on_wave_line = Geometry.closest_point_on_line(test_pos, p1, p2)
	local to_line_flat = Vector3.flat(test_pos - pos_projected_on_wave_line)
	local dist_sq = Vector3.length_squared(to_line_flat)
	local blob_radius_sq = blob_radius^2
	local inside_id = player_units_inside[target_unit]
	local status_extension = ScriptUnit.extension(target_unit, "status_system")

	if inside_id then
		if blob_radius_sq < dist_sq then
			if status_extension.in_liquid_unit == unit then
				StatusUtils.set_in_liquid_network(target_unit, false)
			end

			buff_system:remove_server_controlled_buff(target_unit, inside_id)

			player_units_inside[target_unit] = nil
		end
	elseif dist_sq < blob_radius_sq then
		local line_dist = Vector3.distance(p1, pos_projected_on_wave_line)
		local blob_index = math.floor(0.5 + line_dist * num_blobs) + 1
		blob_index = math.clamp(blob_index, 1, num_blobs)
		local blob = self.blobs[blob_index]
		local z = blob[3]
		local buff_template_name = self.buff_template_name
		local buff_template_type = self.buff_template_type
		local buff_extension = ScriptUnit.extension(target_unit, "buff_system")

		if math.abs(test_pos.z - z) < blob_radius and not buff_extension:has_buff_type(buff_template_type) then
			if status_extension.in_liquid_unit ~= unit then
				StatusUtils.set_in_liquid_network(target_unit, true, unit)
			end

			player_units_inside[target_unit] = buff_system:add_buff(target_unit, buff_template_name, unit, true)
		end
	end
end

DamageBlobExtension.get_rim_nodes = function (self)
	return self.rim_nodes, true
end

DamageBlobExtension.is_position_inside = function (self, position, nav_cost_map_table)
	local blobs = self.blobs
	local num_blobs = #blobs

	if num_blobs == 0 then
		return false
	end

	local template = self.template
	local nav_cost_map_cost_type = template.nav_cost_map_cost_type

	if nav_cost_map_cost_type == nil or (nav_cost_map_table and nav_cost_map_table[nav_cost_map_cost_type] == 1) then
		return false
	end

	local first_blob = blobs[1]
	local last_blob = blobs[num_blobs]
	local first_blob_position = Vector3(first_blob[1], first_blob[2], first_blob[3])
	local last_blob_position = Vector3(last_blob[1], last_blob[2], last_blob[3])
	local pos_projected_on_wave_line = Geometry.closest_point_on_line(position, first_blob_position, last_blob_position)
	local distance_sq = Vector3.distance_squared(position, pos_projected_on_wave_line)
	local blob_radius_sq = self.blob_radius^2

	return distance_sq <= blob_radius_sq
end

DamageBlobExtension.hot_join_sync = function (self, sender)
	local fx_list = self.fx_list
	local unit_id = self.unit_id
	local network_transmit = self.network_transmit
	local t = Managers.time:time("game")
	local blob_life_time = self.blob_life_time

	for i = 1, #fx_list - 1, 2 do
		local fx_entry = fx_list[i]
		local position = fx_entry.position:unbox()
		local life_time_percentage = math.max(fx_entry.time - t, 0) / blob_life_time

		network_transmit:send_rpc("rpc_add_damage_blob_fx", sender, unit_id, position, life_time_percentage)
	end
end

DamageBlobExtension._debug_render_blobs = function (self)
	local blobs = self.blobs

	for i = 1, #blobs, 1 do
		local blob = blobs[i]
		local blob_pos = Vector3(blob[1], blob[2], blob[3])
		local radius = blob[4]

		QuickDrawer:circle(blob_pos, radius, Vector3(0, 0, 1), Color(255, 146, 60))

		local ai_units_inside_blob = blob[5]

		for unit, _ in pairs(ai_units_inside_blob) do
			if ALIVE[unit] then
				local pos = position_lookup[unit]

				QuickDrawer:sphere(pos, 0.5, Color(70, 146, 60))
				QuickDrawer:line(pos, blob_pos, Color(70, 146, 60))
			end
		end
	end

	local rim_nodes = self.rim_nodes

	for i = 1, #rim_nodes, 1 do
		local position = rim_nodes[i]:unbox()

		QuickDrawer:sphere(position, 0.05)
	end

	local player_units_inside = self.player_units_inside

	for unit, _ in pairs(player_units_inside) do
		if unit_alive(unit) then
			local pos = position_lookup[unit]

			QuickDrawer:sphere(pos, 0.3, Color(255, 0, 60))
		end
	end
end

return

DamageWaveExtension = class(DamageWaveExtension)
local unit_alive = Unit.alive
local player_and_bot_units = PLAYER_AND_BOT_UNITS
local position_lookup = POSITION_LOOKUP
local impact_hit_units = {}

DamageWaveExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local world = extension_init_context.world
	local entity_manager = Managers.state.entity
	local ai_system = entity_manager:system("ai_system")
	self.world = world
	self.game = Managers.state.network:game()
	self.unit = unit
	self.source_unit = extension_init_data.source_unit
	self.displaced_units = {}
	self.nav_world = ai_system:nav_world()
	self.network_manager = Managers.state.network
	self.network_transmit = self.network_manager.network_transmit
	self.ai_system = ai_system
	self.ai_blob_index = 1
	self.blobs = {}
	self.rim_nodes = {}
	self.fx_list = {}
	self.ai_units_inside = {}
	self.player_units_inside = {}
	self.ai_hit_by_wavefront = {}
	local buff_system = entity_manager:system("buff_system")
	self.buff_system = buff_system
	local template_name = extension_init_data.damage_wave_template_name
	local template = DamageWaveTemplates.templates[template_name]
	self.template = template
	self.damage_wave_template_name = template_name
	self.immune_breeds = template.immune_breeds
	self.buff_template_name = template.buff_template_name
	self.buff_template_type = template.buff_template_type
	self.buff_wave_impact_template_name = template.buff_wave_impact_name
	self.buff_wave_impact_impact_type = template.buff_wave_impact_type
	self.fx_name_filled = template.fx_name_filled
	self.fx_name_running = template.fx_name_running
	self.fx_name_impact = template.fx_name_impact
	self.fx_name_arrived = template.fx_name_arrived
	local fx_name_init = template.fx_name_init
	local init_effect_id = World.create_particles(world, fx_name_init, position_lookup[unit], Unit.local_rotation(unit, 0))

	World.link_particles(world, init_effect_id, unit, 0, Matrix4x4.identity(), template.particle_arrived_stop_mode)

	self.init_effect_id = init_effect_id
	self.blob_separation_dist = template.blob_separation_dist
	self.fx_separation_dist = template.fx_separation_dist
	self.max_height = template.max_height
	self.overflow_dist = template.overflow_dist
	self.launch_wave_sound = template.launch_wave_sound
	self.running_wave_sound = template.running_wave_sound
	self.stop_running_wave_sound = template.stop_running_wave_sound
	self.impact_wave_sound = template.impact_wave_sound
	self.start_speed = template.start_speed
	self.acceleration = template.acceleration
	self.max_speed = template.max_speed
	self.wavefront_radius = template.wave_width / 2
	self.wave_width = template.wave_width
	self.travel_dist = 0
	self.apply_buff_to_ai = template.apply_buff_to_ai
	self.apply_buff_to_player = template.apply_buff_to_player
	self.apply_impact_buff_to_player = template.apply_impact_buff_to_player
	self.apply_impact_buff_to_ai = template.apply_impact_buff_to_ai
	self.time_of_life = template.time_of_life
	self.launch_animation = template.launch_animation
end

DamageWaveExtension.set_update_func = function (self, update_func, init_func, t)
	self._update_func = update_func

	if init_func then
		init_func(self, t)
	end
end

DamageWaveExtension._calculate_oobb_collision = function (self, width, range, height, offset_forward, offset_up, self_pos, self_rot)
	local half_width = width * 0.5
	local half_range = range * 0.5
	local half_height = height * 0.5
	local size = Vector3(half_width, half_range, half_height)
	local forward = Quaternion.rotate(self_rot, Vector3.forward()) * (offset_forward + half_range)
	local up = Vector3.up() * (offset_up + half_height)
	local oobb_pos = self_pos + forward + up

	return oobb_pos, self_rot, size
end

DamageWaveExtension.launch_wave = function (self, target_unit, optional_target_pos)
	local target_pos = optional_target_pos
	target_pos = target_pos or position_lookup[target_unit]
	local start_speed = self.start_speed
	self.target_unit = target_unit
	self.target_pos = Vector3Box(target_pos)
	self.wave_speed = start_speed
	local unit = self.unit
	local position = position_lookup[unit]
	local to_target = target_pos - position
	local initial_dist = Vector3.length(to_target)
	self.initial_dist = initial_dist
	local direction = Vector3.normalize(to_target)
	local effect_rotation = Quaternion.look(direction)
	self.wave_direction = Vector3Box(direction)
	local template = self.template
	local use_nav_cost_map_volumes = template.use_nav_cost_map_volumes

	if use_nav_cost_map_volumes then
		local nav_cost_map_cost_type = template.nav_cost_map_cost_type
		local blob_separation_dist = self.blob_separation_dist
		local num_volumes_guess = math.max(math.floor(initial_dist / blob_separation_dist), 1)
		local ai_system = self.ai_system
		self._nav_cost_map_id = ai_system:create_nav_cost_map(nav_cost_map_cost_type, num_volumes_guess)
	end

	self.use_nav_cost_map_volumes = use_nav_cost_map_volumes
	local create_bot_aoe_threat = template.create_bot_aoe_threat

	if create_bot_aoe_threat then
		local threat_duration = (start_speed > 0 and initial_dist / start_speed) or initial_dist
		local width = self.wave_width * 2
		local range = initial_dist + self.overflow_dist
		local height = self.wave_width
		local offset_forward = 0
		local offset_up = 0
		local obstacle_position, obstacle_rotation, obstacle_size = self:_calculate_oobb_collision(width, range, height, offset_forward, offset_up, position, effect_rotation)

		Managers.state.entity:system("ai_bot_group_system"):aoe_threat_created(obstacle_position, "oobb", obstacle_size, obstacle_rotation, threat_duration)
	end

	self.last_dist = initial_dist
	self.last_fx_dist = initial_dist
	self.effect_id = World.create_particles(self.world, self.fx_name_running, position + Vector3.up() * 5, effect_rotation)

	World.link_particles(self.world, self.effect_id, self.unit, 0, Matrix4x4.identity(), template.particle_arrived_stop_mode)

	local launch_wave_sound = self.launch_wave_sound

	if launch_wave_sound then
		WwiseUtils.trigger_position_event(self.world, launch_wave_sound, position)
	end

	local running_wave_sound = self.running_wave_sound

	if running_wave_sound then
		local id, source = WwiseUtils.trigger_unit_event(self.world, running_wave_sound, self.unit)
		self.running_source_id = source
	end

	self.state = "running"
	local network_manager = self.network_manager
	local unit_id = network_manager:unit_game_object_id(unit)

	if unit_id then
		self.network_transmit:send_rpc_clients("rpc_damage_wave_set_state", unit_id, NetworkLookup.damage_wave_states.running)
	end

	self.unit_id = unit_id
	local launch_animation = self.launch_animation

	if launch_animation and Unit.has_animation_state_machine(unit) then
		network_manager:anim_event(unit, launch_animation)
	end

	self.is_launched = true
end

DamageWaveExtension.destroy = function (self)
	local unit = self.unit
	local player_units_inside = self.player_units_inside
	local buff_system = self.buff_system

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

		local volume_id = blob[6]

		if volume_id then
			ai_system:remove_nav_cost_map_volume(volume_id, cost_map_id)
		end
	end

	if cost_map_id then
		ai_system:destroy_nav_cost_map(cost_map_id)
	end

	local world = self.world
	local fx_list = self.fx_list
	local num_fx = #fx_list

	for i = 1, num_fx, 1 do
		local fx_entry = fx_list[i]
		local fx_id = fx_entry.id

		World.stop_spawning_particles(world, fx_id)
	end

	table.clear(impact_hit_units)
end

DamageWaveExtension.abort = function (self)
	if not unit_alive(self.unit) then
		return
	end

	local unit = self.unit
	local position = position_lookup[unit]
	local rotation = Quaternion.identity()

	Managers.state.unit_spawner:mark_for_deletion(unit)

	if self.impact_wave_sound then
		WwiseUtils.trigger_unit_event(self.world, self.impact_wave_sound, unit)
	end

	local network_manager = self.network_manager
	local effect_name_id = NetworkLookup.effects[self.fx_name_arrived]
	local node_id = 0

	network_manager:rpc_play_particle_effect(nil, effect_name_id, NetworkConstants.invalid_game_object_id, node_id, position, rotation, false)
end

DamageWaveExtension.move_wave = function (self, unit, t, dt, total_dist, grow)
	local acceleration = self.acceleration
	local current_speed = self.wave_speed

	if current_speed < self.max_speed then
		current_speed = current_speed + acceleration * dt
		self.wave_speed = current_speed
	end

	local position = position_lookup[unit]
	local target_pos = self.target_pos:unbox()
	local to_target = target_pos - position
	local to_target_dir = Vector3.normalize(to_target)
	local wave_dir = self.wave_direction:unbox()
	local frame_dist = current_speed * dt
	self.travel_dist = self.travel_dist + frame_dist
	position = position + wave_dir * frame_dist
	local nav_world = self.nav_world
	local above = 1.5
	local below = (self.template.ignore_obstacles and 15) or 1.5
	local success, altitude, p1, p2, p3 = GwNavQueries.triangle_from_position(nav_world, position, above, below)

	if success then
		position = Vector3(position.x, position.y, altitude)
	end

	Unit.set_local_position(unit, 0, position)

	local dist = Vector3.length(to_target)
	local current_rotation = Unit.local_rotation(unit, 0)

	if self.blob_separation_dist and self.blob_separation_dist <= self.last_dist - dist then
		self:insert_blob(position, self.wave_width, current_rotation, nav_world)

		self.last_dist = dist
	end

	if self.fx_separation_dist <= self.last_fx_dist - dist and self.fx_name_filled then
		local wave_rotation = Quaternion.look(wave_dir, Vector3(0, 0, 1))

		self:insert_fx(position, wave_rotation, 2)

		self.last_fx_dist = dist
	end

	local height_percentage = nil
	local p = (total_dist > 0 and dist / total_dist) or 0

	if grow then
		height_percentage = math.clamp(p, 0, 1)
	else
		height_percentage = math.clamp(1 - p, 0, 1)
	end

	GameSession.set_game_object_field(self.game, self.unit_id, "height_percentage", height_percentage)
	GameSession.set_game_object_field(self.game, self.unit_id, "position", position)
	GameSession.set_game_object_field(self.game, self.unit_id, "rotation", current_rotation)

	return to_target_dir, dist, success or self.template.ignore_obstacles
end

DamageWaveExtension.on_hit_by_wave = function (hit_unit, unit, parent)
	if impact_hit_units[hit_unit] then
		return
	end

	local world = parent.world
	local normal_rotation = Quaternion.look(Vector3.forward(), Vector3.up())

	World.create_particles(world, parent.fx_name_impact, position_lookup[unit], normal_rotation)

	local impact_wave_sound = parent.impact_wave_sound

	if impact_wave_sound then
		WwiseUtils.trigger_unit_event(world, impact_wave_sound, unit)
	end

	local unit_hit_is_player = DamageUtils.is_player_unit(hit_unit)

	if unit_hit_is_player and parent.apply_impact_buff_to_player then
		local buff_system = Managers.state.entity:system("buff_system")
		local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

		if not buff_extension:has_buff_type(parent.buff_wave_impact_impact_type) then
			buff_system:add_buff(hit_unit, parent.buff_wave_impact_template_name, unit)
		end

		if parent.template.trigger_dialogue_on_impact then
			local dialogue_input = ScriptUnit.extension_input(hit_unit, "dialogue_system")
			local event_data = FrameTable.alloc_table()
			event_data.distance = DialogueSettings.pounced_down_broadcast_range
			event_data.target = hit_unit
			event_data.target_name = ScriptUnit.extension(hit_unit, "dialogue_system").context.player_profile

			dialogue_input:trigger_dialogue_event("on_plague_wave_hit", event_data)
		end
	end

	local unit_id = parent.unit_id

	if unit_id then
		parent.network_transmit:send_rpc_clients("rpc_damage_wave_set_state", unit_id, NetworkLookup.damage_wave_states.impact)
	end

	impact_hit_units[hit_unit] = true
end

local BLOB_EXTRA_SAFE_DISTANCE = 0.5

DamageWaveExtension.wave_arrived = function (self, t, unit)
	self.state = "lingering"
	self.linger_time = t + self.time_of_life

	Unit.set_unit_visibility(unit, false)

	local world = self.world
	local wwise_world = Managers.world:wwise_world(world)
	local running_source_id = self.running_source_id
	local stop_running_wave_sound = self.stop_running_wave_sound

	if WwiseWorld.has_source(wwise_world, running_source_id) and stop_running_wave_sound then
		WwiseWorld.trigger_event(wwise_world, stop_running_wave_sound, running_source_id)
	end

	self.running_source_id = nil
	local impact_wave_sound = self.impact_wave_sound

	if impact_wave_sound then
		WwiseUtils.trigger_unit_event(world, impact_wave_sound, unit)
	end

	World.stop_spawning_particles(world, self.effect_id)
	World.create_particles(world, self.fx_name_arrived, position_lookup[unit], Quaternion.look(self.wave_direction:unbox()))

	local unit_id = self.unit_id

	if unit_id then
		self.network_transmit:send_rpc_clients("rpc_damage_wave_set_state", unit_id, NetworkLookup.damage_wave_states.arrived)
	end

	World.stop_spawning_particles(world, self.init_effect_id)

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
end

DamageWaveExtension.wavefront_impact = function (self, t, impact_position, radius, ai_push_data, attacker_unit, wave_dir)
	if not ai_push_data then
		return
	end

	local BLACKBOARDS = BLACKBOARDS
	local ai_hit_by_wavefront = self.ai_hit_by_wavefront
	local immune_breeds = self.immune_breeds
	local stagger_impact = ai_push_data.stagger_impact
	local duration_table = ai_push_data.stagger_duration
	local stagger_distance = ai_push_data.stagger_distance
	local push_along_wave_dir = ai_push_data.push_along_wave_direction
	local apply_impact_buff_to_ai = self.apply_impact_buff_to_ai
	local buff_system = self.buff_system
	local buff_wave_impact_impact_type = self.buff_wave_impact_impact_type
	local buff_wave_impact_template_name = self.buff_wave_impact_template_name
	local ai_units = FrameTable.alloc_table()
	local num_ai_units = AiUtils.broadphase_query(impact_position, radius, ai_units)

	for i = 1, num_ai_units, 1 do
		local hit_unit = ai_units[i]

		if not ai_hit_by_wavefront[hit_unit] then
			local health_extension = ScriptUnit.extension(hit_unit, "health_system")
			local is_alive = health_extension:is_alive()
			local hit_unit_blackboard = BLACKBOARDS[hit_unit]
			local breed_name = hit_unit_blackboard.breed.name
			local should_stagger = is_alive and not immune_breeds[breed_name]

			if should_stagger then
				local stagger_type, stagger_duration = DamageUtils.calculate_stagger(stagger_impact, duration_table, hit_unit, attacker_unit)

				if stagger_type > 0 then
					local hit_unit_pos = position_lookup[hit_unit]
					local direction = (push_along_wave_dir and wave_dir) or Vector3.normalize(hit_unit_pos - impact_position)

					AiUtils.stagger(hit_unit, hit_unit_blackboard, attacker_unit, direction, stagger_distance, stagger_type, stagger_duration, nil, t)

					if apply_impact_buff_to_ai then
						local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

						if not buff_extension:has_buff_type(buff_wave_impact_impact_type) then
							buff_system:add_buff(hit_unit, buff_wave_impact_template_name, attacker_unit)
						end
					end
				end
			end

			ai_hit_by_wavefront[hit_unit] = true
		end
	end
end

DamageWaveExtension.check_overlap = function (self, unit, target_unit, wave_radius, p1, p2, buff_system, num_blobs)
	local player_units_inside = self.player_units_inside
	local test_pos = position_lookup[target_unit]
	local pos_projected_on_wave_line = Geometry.closest_point_on_line(test_pos, p1, p2)
	local to_line_flat = Vector3.flat(test_pos - pos_projected_on_wave_line)
	local dist_sq = Vector3.length_squared(to_line_flat)
	local wave_radius_sq = wave_radius^2
	local inside_id = player_units_inside[target_unit]
	local status_extension = ScriptUnit.extension(target_unit, "status_system")

	if inside_id then
		if wave_radius_sq < dist_sq then
			if status_extension.in_liquid_unit == unit then
				StatusUtils.set_in_liquid_network(target_unit, false)
			end

			buff_system:remove_server_controlled_buff(target_unit, inside_id)

			player_units_inside[target_unit] = nil
		end
	elseif dist_sq < wave_radius_sq then
		local line_dist = Vector3.distance(p1, pos_projected_on_wave_line)
		local blob_index = math.floor(0.5 + line_dist / self.initial_dist * num_blobs) + 1
		blob_index = math.clamp(blob_index, 1, num_blobs)
		local blob = self.blobs[blob_index]
		local z = blob[3]
		local buff_template_name = self.buff_template_name
		local buff_template_type = self.buff_template_type
		local buff_extension = ScriptUnit.extension(target_unit, "buff_system")

		if math.abs(test_pos.z - z) < wave_radius and not buff_extension:has_buff_type(buff_template_type) then
			if status_extension.in_liquid_unit ~= unit then
				StatusUtils.set_in_liquid_network(target_unit, true, unit)
			end

			player_units_inside[target_unit] = buff_system:add_buff(target_unit, buff_template_name, unit, true)
		end
	end
end

DamageWaveExtension.update = function (self, unit, input, dt, context, t)
	if not AiUtils.unit_alive(self.source_unit) and not self.is_launched then
		self:abort()
	end

	if not self.is_launched then
		return
	end

	local state = self.state
	local position = position_lookup[unit]
	local wave_dir = self.wave_direction:unbox()

	if state == "running" then
		if self._update_func then
			self:_update_func(unit, position, t, dt)
		end

		local to_target_dir, dist, on_mesh = self:move_wave(unit, t, dt, self.initial_dist, true)

		if Vector3.dot(to_target_dir, wave_dir) < 0 or dist < 0.1 or not on_mesh then
			local overflow_dist = self.overflow_dist

			self.target_pos:store(position + wave_dir * overflow_dist)

			self.last_dist = self.last_dist + overflow_dist
			self.last_fx_dist = self.last_fx_dist + overflow_dist
			self.state = "arrived"
		end

		local player_push_data = self.template.player_push_data

		if player_push_data then
			AiUtils.push_intersecting_players(unit, self.displaced_units, player_push_data, t, dt, self.on_hit_by_wave, self)
		end

		self:wavefront_impact(t, position, self.wavefront_radius, self.template.ai_push_data, self.unit, wave_dir)
	elseif state == "arrived" then
		local to_target_dir, dist = self:move_wave(unit, t, dt, self.overflow_dist)

		if Vector3.dot(to_target_dir, wave_dir) < 0 or dist < 0.1 then
			self:wave_arrived(t, unit)
		end

		local player_push_data = self.template.player_push_data

		if player_push_data then
			AiUtils.push_intersecting_players(unit, self.displaced_units, player_push_data, t, dt, self.on_hit_by_wave, self)
		end
	elseif self.linger_time < t then
		Managers.state.unit_spawner:mark_for_deletion(unit)
	end

	Unit.set_local_rotation(unit, 0, Quaternion.look(self.wave_direction:unbox()))
	self:update_blob_overlaps()
end

DamageWaveExtension.insert_blob = function (self, position, radius, rotation, nav_world)
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
		nav_cost_map_volume_id
	}
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

DamageWaveExtension.insert_fx = function (self, position, rotation)
	local fx_list = self.fx_list
	local fx_id = World.create_particles(self.world, self.fx_name_filled, position, rotation)
	fx_list[#fx_list + 1] = {
		id = fx_id,
		position = Vector3Box(position)
	}
	local unit_id = self.unit_id

	if unit_id then
		self.network_transmit:send_rpc_clients("rpc_add_damage_wave_fx", unit_id, position)
	end
end

DamageWaveExtension.update_blob_overlaps = function (self)
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
		local wave_radius = self.wave_width

		for i = 1, #player_and_bot_units, 1 do
			local target_unit = player_and_bot_units[i]

			self:check_overlap(unit, target_unit, wave_radius, first_blob_position, last_blob_position, buff_system, num_blobs)
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
		local blob_pos = Vector3(blob[1], blob[2], blob[3])
		local blob_radius = blob[4]
		local ai_units_inside_blob = blob[5]
		local num_ai_units = AiUtils.broadphase_query(blob_pos, blob_radius, ai_units)

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

		if num_blobs < blob_index then
			blob_index = 1
		end

		amount = amount - 1
	end

	self.ai_blob_index = blob_index
end

DamageWaveExtension.get_rim_nodes = function (self)
	return self.rim_nodes, true
end

DamageWaveExtension.is_position_inside = function (self, position, nav_cost_map_table)
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
	local wave_radius_sq = self.wave_width^2

	return distance_sq <= wave_radius_sq
end

DamageWaveExtension.hot_join_sync = function (self, sender)
	local launched = self.is_launched

	if launched then
		local network_transmit = self.network_transmit
		local unit_id = self.unit_id
		local fx_list = self.fx_list
		local num_fx = #fx_list

		for i = 1, num_fx, 1 do
			local fx_entry = fx_list[i]
			local position = fx_entry.position:unbox()

			network_transmit:send_rpc("rpc_add_damage_wave_fx", sender, unit_id, position)
		end

		local state = self.state

		if state == "lingering" then
			network_transmit:send_rpc("rpc_damage_wave_set_state", sender, unit_id, NetworkLookup.damage_wave_states.hide)
		else
			network_transmit:send_rpc("rpc_damage_wave_set_state", sender, unit_id, NetworkLookup.damage_wave_states.running)
		end
	end
end

local segments = 20
local half_segments = segments / 2
local wave_length = 1

DamageWaveExtension.debug_render_wave = function (self, t, dt, pos, travel_dir, height)
	local k = 0

	for i = -half_segments, half_segments - 1, 1 do
		local size = math.sin(-math.pi + k / segments * math.pi) * self.max_height
		local p = (pos + travel_dir * i / segments * wave_length) - size * Vector3(0, 0, 1) - Vector3(0, 0, height * 2)

		QuickDrawer:circle(p, self.max_height, travel_dir, Colors.get("lime_green"))

		k = k + 1
	end
end

DamageWaveExtension.debug_render_blobs = function (self)
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

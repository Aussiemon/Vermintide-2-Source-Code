-- chunkname: @scripts/unit_extensions/weapons/area_damage/liquid/damage_wave_extension.lua

local stagger_types = require("scripts/utils/stagger_types")

DamageWaveExtension = class(DamageWaveExtension)

local unit_alive = Unit.alive
local position_lookup = POSITION_LOOKUP
local DEFAULT_STAGGER_REFRESH_TIME = {
	math.huge,
	math.huge,
	math.huge,
	math.huge,
	math.huge,
	math.huge,
}
local impact_hit_units = {}

DamageWaveExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local world = extension_init_context.world
	local entity_manager = Managers.state.entity
	local ai_system = entity_manager:system("ai_system")

	self.world = world
	self.game = Managers.state.network:game()
	self.unit = unit
	self.source_unit = extension_init_data.source_unit
	self._buff_params = {
		attacker_unit = unit,
		source_attacker_unit = extension_init_data.source_unit,
	}
	self._source_side = Managers.state.side.side_by_unit[self.source_unit]
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
	self.player_units_inside = extension_init_data.player_units_inside or {}
	self.ai_hit_by_wavefront = extension_init_data.ai_hit_by_wavefront or {}

	local buff_system = entity_manager:system("buff_system")

	self.buff_system = buff_system

	local template_name = extension_init_data.damage_wave_template_name
	local template = DamageWaveTemplates.templates[template_name]

	if template.is_transient then
		self.is_transient = true
		self.transient_name_override = template.transient_name_override
	end

	self.template = template
	self.damage_wave_template_name = template_name
	self.immune_breeds = template.immune_breeds
	self.buff_template_name = template.buff_template_name
	self.buff_template_type = template.buff_template_type
	self.leave_area_func = template.leave_area_func
	self.add_buff_func = template.add_buff_func
	self.buff_wave_impact_template_name = template.buff_wave_impact_name
	self.buff_wave_impact_impact_type = template.buff_wave_impact_type
	self.fx_name_filled = template.fx_name_filled
	self.fx_name_running = template.fx_name_running
	self.fx_name_impact = template.fx_name_impact
	self.fx_name_arrived = template.fx_name_arrived

	if template.running_spawn_config then
		self._running_spawn_configs = template.running_spawn_config
		self._running_spawn_datas = {}

		local t = Managers.time:time("game")

		for i = 1, #template.running_spawn_config do
			local config = template.running_spawn_config[i]

			self._running_spawn_datas[i] = {
				next_spawn_t = t + (config.start_delay or 0),
				next_seed = math.random_seed(),
			}
		end

		self._local_units = {}
	end

	local fx_name_init = template.fx_name_init

	if fx_name_init then
		local init_effect_id = World.create_particles(world, fx_name_init, position_lookup[unit], Unit.local_rotation(unit, 0))

		World.link_particles(world, init_effect_id, unit, 0, Matrix4x4.identity(), template.particle_arrived_stop_mode)

		self.init_effect_id = init_effect_id
	end

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
	self.player_query_distance = template.player_query_distance
	self.ai_query_distance = template.ai_query_distance
	self.travel_dist = 0
	self.apply_buff_to_ai = template.apply_buff_to_ai
	self.apply_buff_to_player = template.apply_buff_to_player
	self.apply_buff_to_owner = template.apply_buff_to_owner
	self.apply_impact_buff_to_player = template.apply_impact_buff_to_player
	self.apply_impact_buff_to_ai = template.apply_impact_buff_to_ai
	self.damage_friendly_ai = template.damage_friendly_ai
	self.time_of_life = template.time_of_life
	self.launch_animation = template.launch_animation
	self._on_arrive_func = template.on_arrive_func
	self._update_func = template.update_func

	local init_func = template.init_func

	if init_func then
		init_func(self)
	end
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

DamageWaveExtension.launch_wave = function (self, target_unit, optional_target_pos, optional_data)
	local unit = self.unit

	if not Unit.alive(unit) then
		return
	end

	self.optional_data = optional_data

	local target_pos = optional_target_pos

	target_pos = target_pos or position_lookup[target_unit]

	local start_speed = self.start_speed

	self.target_unit = target_unit
	self.target_pos = Vector3Box(target_pos)
	self.wave_speed = start_speed

	local position = position_lookup[unit]
	local to_target = target_pos - position
	local initial_dist = Vector3.length(to_target)

	self.initial_dist = initial_dist
	self.original_pos_z = position.z

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
		local threat_duration = start_speed > 0 and initial_dist / start_speed or initial_dist
		local width = self.player_query_distance * 2
		local range = initial_dist + self.overflow_dist
		local height = self.player_query_distance
		local offset_forward, offset_up = 0, 0
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

	for target_unit, _ in pairs(player_units_inside) do
		if unit_alive(target_unit) then
			local status_extension = ScriptUnit.extension(target_unit, "status_system")

			if status_extension.in_liquid_unit == unit then
				StatusUtils.set_in_liquid_network(target_unit, false)
			end

			if self.leave_area_func then
				self.leave_area_func(target_unit)
			end
		end
	end

	local blobs = self.blobs
	local num_blobs = #blobs
	local ai_system = self.ai_system
	local cost_map_id = self._nav_cost_map_id

	for i = 1, num_blobs do
		local blob = blobs[i]
		local volume_id = blob[6]

		if volume_id then
			ai_system:remove_nav_cost_map_volume(volume_id, cost_map_id)
		end
	end

	if self.leave_area_func then
		for target_unit, _ in pairs(self.ai_units_inside) do
			self.leave_area_func(target_unit)
		end
	end

	if cost_map_id then
		ai_system:destroy_nav_cost_map(cost_map_id)
	end

	local world = self.world
	local fx_list = self.fx_list
	local num_fx = #fx_list

	for i = 1, num_fx do
		local fx_entry = fx_list[i]
		local fx_id = fx_entry.id

		World.stop_spawning_particles(world, fx_id)
	end

	local local_units = self._local_units

	if local_units then
		for i = 1, #local_units do
			World.destroy_unit(world, local_units[i])

			local_units[i] = nil
		end
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

	if self.fx_name_arrived then
		local network_manager = self.network_manager
		local effect_name_id = NetworkLookup.effects[self.fx_name_arrived]
		local node_id = 0

		network_manager:rpc_play_particle_effect(nil, effect_name_id, NetworkConstants.invalid_game_object_id, node_id, position, rotation, false)
	end
end

DamageWaveExtension.move_wave = function (self, unit, t, dt, total_dist, grow)
	local acceleration = self.acceleration
	local current_speed = self.wave_speed

	if current_speed < self.max_speed then
		current_speed = current_speed + acceleration * dt
		self.wave_speed = current_speed
	end

	local position = position_lookup[unit]
	local current_rotation = Unit.local_rotation(unit, 0)

	position = Vector3(position.x, position.y, self.original_pos_z)

	local target_pos = self.target_pos:unbox()
	local to_target = target_pos - position
	local dist_to_target = Vector3.length(to_target)
	local to_target_dir = dist_to_target < 0.001 and Vector3.zero() or Vector3.divide(to_target, dist_to_target)
	local wave_dir = self.wave_direction:unbox()
	local frame_dist = math.min(current_speed * dt, dist_to_target)

	self.travel_dist = self.travel_dist + frame_dist
	position = position + wave_dir * frame_dist
	self.original_pos_z = position.z

	local nav_world = self.nav_world
	local above = 1.5
	local below = self.template.ignore_obstacles and 15 or 1.5
	local success, altitude, p1, p2, p3 = GwNavQueries.triangle_from_position(nav_world, position, above, below)

	if success then
		position = Vector3(position.x, position.y, altitude)
	end

	Unit.set_local_position(unit, 0, position)

	if self.blob_separation_dist and self.last_dist - dist_to_target >= self.blob_separation_dist then
		self:insert_blob(position, self.ai_query_distance, current_rotation, nav_world)

		self.last_dist = dist_to_target
	end

	if self.fx_name_filled and self.last_fx_dist - dist_to_target >= self.fx_separation_dist then
		local wave_rotation = Quaternion.look(wave_dir, Vector3(0, 0, 1))

		self:insert_fx(position, wave_rotation, 0)

		self.last_fx_dist = dist_to_target
	end

	local height_percentage
	local p = total_dist > 0 and dist_to_target / total_dist or 0

	if grow then
		height_percentage = math.clamp(p, 0, 1)
	else
		height_percentage = math.clamp(1 - p, 0, 1)
	end

	GameSession.set_game_object_field(self.game, self.unit_id, "height_percentage", height_percentage)
	GameSession.set_game_object_field(self.game, self.unit_id, "position", position)
	GameSession.set_game_object_field(self.game, self.unit_id, "rotation", current_rotation)

	return to_target_dir, dist_to_target, success or self.template.ignore_obstacles
end

DamageWaveExtension.on_hit_by_wave = function (hit_unit, unit, parent)
	if impact_hit_units[hit_unit] then
		return
	end

	local world = parent.world
	local normal_rotation = Quaternion.look(Vector3.forward(), Vector3.up())

	if parent.fx_name_impact then
		World.create_particles(world, parent.fx_name_impact, position_lookup[unit], normal_rotation)
	end

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

	local arrive_pos = position_lookup[unit]
	local arrive_rot = Quaternion.look(self.wave_direction:unbox())

	if self.fx_name_arrived then
		World.create_particles(world, self.fx_name_arrived, arrive_pos, arrive_rot)
	end

	local unit_id = self.unit_id

	if unit_id then
		self.network_transmit:send_rpc_clients("rpc_damage_wave_set_state", unit_id, NetworkLookup.damage_wave_states.arrived)
	end

	if self.init_effect_id then
		World.stop_spawning_particles(world, self.init_effect_id)
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

	if self._on_arrive_func then
		self._on_arrive_func(self, arrive_pos, arrive_rot)
	end
end

DamageWaveExtension.wavefront_impact = function (self, t, impact_position, radius, ai_push_data, attacker_unit, wave_dir, dt)
	if not ai_push_data then
		return
	end

	local BLACKBOARDS = BLACKBOARDS
	local ai_hit_by_wavefront = self.ai_hit_by_wavefront
	local immune_breeds = self.immune_breeds
	local stagger_impact = ai_push_data.stagger_impact
	local duration_table = ai_push_data.stagger_duration
	local stagger_distance = ai_push_data.stagger_distance
	local stagger_distance_table = ai_push_data.stagger_distance_table
	local push_along_wave_dir = ai_push_data.push_along_wave_direction
	local apply_impact_buff_to_ai = self.apply_impact_buff_to_ai
	local stagger_refresh_time = ai_push_data.stagger_refresh_time or DEFAULT_STAGGER_REFRESH_TIME
	local wave_drag_vector = ai_push_data.drag_along_wave and wave_dir * self.wave_speed
	local wave_drag_multiplier = ai_push_data.wave_drag_multiplier
	local wave_drag_multiplier_table = ai_push_data.wave_drag_multiplier_table
	local hit_half_extends = ai_push_data.hit_half_extends
	local impact_pose = Matrix4x4.from_quaternion_position(Quaternion.look(wave_dir), impact_position)
	local buff_system = self.buff_system
	local buff_wave_impact_impact_type = self.buff_wave_impact_impact_type
	local buff_wave_impact_template_name = self.buff_wave_impact_template_name
	local side = self._source_side
	local broadphase_categories = side and not self.damage_friendly_ai and side.enemy_broadphase_categories or nil
	local ai_units = FrameTable.alloc_table()
	local num_ai_units = AiUtils.broadphase_query(impact_position, radius, ai_units, broadphase_categories)

	for i = 1, num_ai_units do
		local hit_unit = ai_units[i]
		local is_alive = HEALTH_ALIVE[hit_unit]
		local hit_unit_blackboard = BLACKBOARDS[hit_unit]
		local breed_name = hit_unit_blackboard.breed.name

		if wave_drag_vector or t >= (ai_hit_by_wavefront[hit_unit] or 0) then
			local should_hit = is_alive and not immune_breeds[breed_name]

			if should_hit then
				local hit_position = POSITION_LOOKUP[hit_unit]
				local is_inside = not hit_half_extends or math.point_is_inside_box(hit_position, impact_pose, hit_half_extends)

				if is_inside then
					local breed = hit_unit_blackboard.breed
					local target_unit_armor = breed.stagger_armor_category or breed.primary_armor_category or breed.armor_category or 1

					if t >= (ai_hit_by_wavefront[hit_unit] or 0) then
						local stagger_type, stagger_duration = DamageUtils.calculate_stagger(stagger_impact, duration_table, hit_unit, attacker_unit)

						if stagger_type > stagger_types.none then
							local hit_unit_pos = position_lookup[hit_unit]
							local direction = push_along_wave_dir and wave_dir or Vector3.normalize(hit_unit_pos - impact_position)
							local distance = stagger_distance_table and stagger_distance_table[target_unit_armor] or stagger_distance

							AiUtils.stagger(hit_unit, hit_unit_blackboard, attacker_unit, direction, distance, stagger_type, stagger_duration, nil, t)
						end

						ai_hit_by_wavefront[hit_unit] = t + stagger_refresh_time[target_unit_armor] * (math.random() / 2 + 0.5)

						if apply_impact_buff_to_ai then
							local buff_extension = ScriptUnit.extension(hit_unit, "buff_system")

							if not buff_extension:has_buff_type(buff_wave_impact_impact_type) then
								buff_system:add_buff_synced(hit_unit, buff_wave_impact_template_name, BuffSyncType.All, self._buff_params)
							end
						end
					end

					if wave_drag_vector then
						local locomotion_extension = hit_unit_blackboard.locomotion_extension

						if locomotion_extension then
							local wave_drag_str = wave_drag_multiplier_table and wave_drag_multiplier_table[target_unit_armor] or wave_drag_multiplier

							if wave_drag_str > 0 then
								locomotion_extension:set_animation_external_velocity(wave_drag_vector * wave_drag_str)
							end
						end
					end
				end
			end
		end
	end
end

DamageWaveExtension.check_overlap = function (self, unit, target_unit, wave_radius, p1, p2, buff_system, num_blobs)
	local player_units_inside = self.player_units_inside
	local test_pos = position_lookup[target_unit]
	local pos_projected_on_wave_line = Geometry.closest_point_on_line(test_pos, p1, p2)
	local to_line_flat = Vector3.flat(test_pos - pos_projected_on_wave_line)
	local dist_sq = Vector3.length_squared(to_line_flat)
	local wave_radius_sq = wave_radius * wave_radius
	local unit_references = player_units_inside[target_unit]
	local status_extension = ScriptUnit.extension(target_unit, "status_system")

	if unit_references then
		unit_references[self] = true

		if wave_radius_sq < dist_sq then
			if status_extension.in_liquid_unit == unit then
				StatusUtils.set_in_liquid_network(target_unit, false)
			end

			unit_references[self] = nil

			if table.is_empty(unit_references) then
				player_units_inside[target_unit] = nil

				if self.leave_area_func then
					self.leave_area_func(target_unit)
				end
			end
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

		if wave_radius > math.abs(test_pos.z - z) then
			if status_extension.in_liquid_unit ~= unit then
				StatusUtils.set_in_liquid_network(target_unit, true, unit)
			end

			if self.add_buff_func then
				self.add_buff_func(self, target_unit, buff_template_name, unit, self.source_unit)
			else
				buff_system:add_buff(target_unit, buff_template_name, unit, false, nil, self.source_unit)
			end

			player_units_inside[target_unit] = {}
			player_units_inside[target_unit][self] = true
		end
	end
end

DamageWaveExtension.update = function (self, unit, input, dt, context, t)
	if not HEALTH_ALIVE[self.source_unit] and not self.is_launched then
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
			self._update_func(self, unit, position, t, dt)
		end

		local to_target_dir, dist, on_mesh = self:move_wave(unit, t, dt, self.initial_dist, true)

		if Vector3.dot(to_target_dir, wave_dir) < 0 or dist < 0.1 or not on_mesh then
			local overflow_dist = self.overflow_dist

			self.target_pos:store(position + wave_dir * overflow_dist)

			self.last_dist = self.last_dist + overflow_dist
			self.last_fx_dist = self.last_fx_dist + overflow_dist
			self.state = "arrived"
		end

		local running_spawn_config = self._running_spawn_configs

		if running_spawn_config then
			self:_update_running_spawn_datas(t)
		end

		local player_push_data = self.template.player_push_data

		if player_push_data then
			AiUtils.push_intersecting_players(unit, self.source_unit, self.displaced_units, player_push_data, t, dt, self.on_hit_by_wave, self)
		end

		self:wavefront_impact(t, position, self.ai_query_distance, self.template.ai_push_data, self.unit, wave_dir)
	elseif state == "arrived" then
		local to_target_dir, dist = self:move_wave(unit, t, dt, self.overflow_dist)

		if Vector3.dot(to_target_dir, wave_dir) < 0 or dist < 0.1 then
			self:wave_arrived(t, unit)
		end

		local player_push_data = self.template.player_push_data

		if player_push_data then
			AiUtils.push_intersecting_players(unit, self.source_unit, self.displaced_units, player_push_data, t, dt, self.on_hit_by_wave, self)
		end
	elseif t > self.linger_time then
		Managers.state.unit_spawner:mark_for_deletion(unit)
	end

	Unit.set_local_rotation(unit, 0, Quaternion.look(self.wave_direction:unbox()))
	self:update_blob_overlaps()
end

DamageWaveExtension.insert_blob = function (self, position, radius, rotation, nav_world)
	local nav_cost_map_volume_id

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
		nav_cost_map_volume_id,
		blob_index,
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

DamageWaveExtension.insert_fx = function (self, position, rotation, fx_idx)
	local config, name, name_idx

	if fx_idx == 0 then
		name_idx = 0
		name = self.fx_name_filled
	else
		config = self._running_spawn_configs[fx_idx]

		local data = self._running_spawn_datas[fx_idx]
		local names = config.names

		data.next_seed, name_idx = Math.next_random(data.next_seed, 1, #names)
		name = names[name_idx]
	end

	local unit_or_id

	if fx_idx == 0 or config.spawn_type == "effect" then
		unit_or_id = World.create_particles(self.world, name, position, rotation, Vector3(0.1, 0.1, 0.1))

		local fx_list = self.fx_list

		fx_list[#fx_list + 1] = {
			id = unit_or_id,
			position = Vector3Box(position),
			rotation = QuaternionBox(rotation),
			index = fx_idx,
			name_index = name_idx,
		}
	elseif config.spawn_type == "unit" then
		unit_or_id = World.spawn_unit(self.world, name, position, rotation)
		self._local_units[#self._local_units + 1] = unit_or_id
	end

	if fx_idx > 0 and config.on_spawn then
		config.on_spawn(self, config, name, unit_or_id, self.world)
	end

	local unit_id = self.unit_id

	if unit_id then
		self.network_transmit:send_rpc_clients("rpc_add_damage_wave_fx", unit_id, position, rotation, fx_idx, name_idx)
	end
end

DamageWaveExtension.update_blob_overlaps = function (self)
	local blobs = self.blobs
	local num_blobs = #blobs

	if num_blobs < 1 then
		return
	end

	local unit = self.unit
	local source_unit = self.source_unit
	local buff_system = self.buff_system
	local first_blob, last_blob = blobs[1], blobs[num_blobs]
	local first_blob_position = Vector3(first_blob[1], first_blob[2], first_blob[3])
	local last_blob_position = Vector3(last_blob[1], last_blob[2], last_blob[3])

	if self.apply_buff_to_player then
		local enemy_player_and_bot_units = self._source_side.ENEMY_PLAYER_AND_BOT_UNITS
		local wave_radius = self.player_query_distance

		for i = 1, #enemy_player_and_bot_units do
			local target_unit = enemy_player_and_bot_units[i]

			self:check_overlap(unit, target_unit, wave_radius, first_blob_position, last_blob_position, buff_system, num_blobs)
		end
	end

	if self.apply_buff_to_owner and ALIVE[self.source_unit] then
		local wave_radius = self.player_query_distance

		self:check_overlap(unit, self.source_unit, wave_radius, first_blob_position, last_blob_position, buff_system, num_blobs)
	end

	if not self.apply_buff_to_ai then
		return
	end

	local blobs_per_frame = 1
	local blob_index = self.ai_blob_index
	local amount = math.min(blobs_per_frame, num_blobs)
	local buff_template_name = self.buff_template_name
	local immune_breeds = self.immune_breeds
	local ai_units_inside = self.ai_units_inside
	local BLACKBOARDS = BLACKBOARDS
	local side = self._source_side
	local broadphase_categories = side and not self.damage_friendly_ai and side.enemy_broadphase_categories or nil
	local ai_units = FrameTable.alloc_table()
	local inside_this_frame = FrameTable.alloc_table()

	while amount > 0 do
		local blob = blobs[blob_index]
		local blob_pos = Vector3(blob[1], blob[2], blob[3])
		local blob_radius = blob[4]
		local ai_units_inside_blob = blob[5]
		local num_ai_units = AiUtils.broadphase_query(blob_pos, blob_radius, ai_units, broadphase_categories)

		for i = 1, num_ai_units do
			local target_unit = ai_units[i]
			local already_checked = inside_this_frame[target_unit] ~= nil
			local inside_blob = ai_units_inside[target_unit]

			if not already_checked and HEALTH_ALIVE[target_unit] then
				local target_position = position_lookup[target_unit]
				local pos_projected_on_wave_line = Geometry.closest_point_on_line(target_position, first_blob_position, last_blob_position)
				local to_line_distance_sq = Vector3.distance_squared(target_position, pos_projected_on_wave_line)

				if to_line_distance_sq < blob_radius * blob_radius then
					local target_blackboard = BLACKBOARDS[target_unit]
					local breed = target_blackboard.breed
					local breed_name = breed.name

					if not immune_breeds[breed_name] then
						if buff_template_name and not inside_blob then
							if self.add_buff_func then
								self.add_buff_func(self, target_unit, buff_template_name, unit, source_unit)
							else
								buff_system:add_buff(target_unit, buff_template_name, unit, false, nil, source_unit)
							end
						elseif inside_blob and inside_blob ~= blob then
							local ai_units_inside_other_blob = inside_blob[5]

							ai_units_inside_other_blob[target_unit] = nil
							ai_units_inside_blob[target_unit] = true
						end

						ai_units_inside[target_unit] = blob
						inside_this_frame[target_unit] = true
					end
				elseif ai_units_inside[target_unit] then
					if self.leave_area_func then
						self.leave_area_func(target_unit)
					end

					inside_this_frame[target_unit] = false
					ai_units_inside[target_unit] = nil
					ai_units_inside_blob[target_unit] = nil
				end
			end
		end

		for target_unit, _ in pairs(ai_units_inside_blob) do
			if not HEALTH_ALIVE[target_unit] then
				ai_units_inside_blob[target_unit] = nil
				ai_units_inside[target_unit] = nil
			elseif not inside_this_frame[target_unit] then
				local target_position = position_lookup[target_unit]
				local blob_index = blob[7]
				local pos_projected_on_wave_line = Geometry.closest_point_on_line(target_position, first_blob_position, last_blob_position)
				local to_line_distance_sq = Vector3.distance_squared(target_position, pos_projected_on_wave_line)
				local distance_from_start = Vector3.distance(first_blob_position, pos_projected_on_wave_line)
				local closest_blob_index = math.floor(distance_from_start / self.blob_separation_dist + 0.5) + 1

				closest_blob_index = math.clamp(closest_blob_index, 1, num_blobs)

				local closest_blob = blobs[closest_blob_index]
				local closest_blob_radius = closest_blob[4]
				local same_index = closest_blob_index == blob_index

				if to_line_distance_sq > closest_blob_radius * closest_blob_radius then
					ai_units_inside[target_unit] = nil
					ai_units_inside_blob[target_unit] = nil

					if self.leave_area_func then
						self.leave_area_func(target_unit)
					end
				elseif not same_index then
					local ai_units_inside_other_blob = closest_blob[5]

					ai_units_inside_other_blob[target_unit] = ai_units_inside_blob[target_unit]
					ai_units_inside[target_unit] = closest_blob
					ai_units_inside_blob[target_unit] = nil
				end
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

DamageWaveExtension.is_position_inside = function (self, position, nav_cost_map_table, is_player)
	local blobs = self.blobs
	local num_blobs = #blobs

	if num_blobs == 0 then
		return false
	end

	local template = self.template
	local nav_cost_map_cost_type = template.nav_cost_map_cost_type

	if nav_cost_map_cost_type == nil or nav_cost_map_table and nav_cost_map_table[nav_cost_map_cost_type] == 1 then
		return false
	end

	local first_blob = blobs[1]
	local last_blob = blobs[num_blobs]
	local first_blob_position = Vector3(first_blob[1], first_blob[2], first_blob[3])
	local last_blob_position = Vector3(last_blob[1], last_blob[2], last_blob[3])
	local pos_projected_on_wave_line = Geometry.closest_point_on_line(position, first_blob_position, last_blob_position)
	local distance_sq = Vector3.distance_squared(position, pos_projected_on_wave_line)
	local wave_radius = is_player and self.player_query_distance or self.ai_query_distance

	return distance_sq <= wave_radius * wave_radius
end

DamageWaveExtension.is_position_inside_blob = function (self, position, blob)
	local blob_pos = Vector3(blob[1], blob[2], blob[3])
	local sqr_dist = Vector3.distance_squared(position, blob_pos)
	local blob_radius = blob[4]

	return sqr_dist < blob_radius * blob_radius
end

DamageWaveExtension.hot_join_sync = function (self, peer_id)
	local launched = self.is_launched

	if launched then
		local network_transmit = self.network_transmit
		local unit_id = self.unit_id
		local fx_list = self.fx_list
		local num_fx = #fx_list

		for i = 1, num_fx do
			local fx_entry = fx_list[i]
			local position = fx_entry.position:unbox()
			local rotation = fx_entry.rotation:unbox()
			local fx_idx = fx_entry.index
			local name_idx = fx_entry.name_index

			network_transmit:send_rpc("rpc_add_damage_wave_fx", peer_id, unit_id, position, rotation, fx_idx, name_idx)
		end

		local state = self.state

		if state == "lingering" then
			network_transmit:send_rpc("rpc_damage_wave_set_state", peer_id, unit_id, NetworkLookup.damage_wave_states.hide)
		else
			network_transmit:send_rpc("rpc_damage_wave_set_state", peer_id, unit_id, NetworkLookup.damage_wave_states.running)
		end
	end
end

local segments = 20
local half_segments = segments / 2
local wave_length = 1

DamageWaveExtension.debug_render_wave = function (self, t, dt, pos, travel_dir, height)
	local k = 0

	for i = -half_segments, half_segments - 1 do
		local size = math.sin(-math.pi + k / segments * math.pi) * self.max_height
		local p = pos + travel_dir * (i / segments) * wave_length - size * Vector3(0, 0, 1) - Vector3(0, 0, height * 2)

		QuickDrawer:circle(p, self.max_height, travel_dir, Colors.get("lime_green"))

		k = k + 1
	end
end

DamageWaveExtension.debug_render_blobs = function (self)
	local blobs = self.blobs

	for i = 1, #blobs do
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

	for i = 1, #rim_nodes do
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

DamageWaveExtension._update_running_spawn_datas = function (self, t)
	local configs = self._running_spawn_configs
	local datas = self._running_spawn_datas
	local unit = self.unit
	local wave_position = position_lookup[unit]
	local wave_rotation = Quaternion.look(self.wave_direction:unbox())

	for i = 1, #configs do
		local config = configs[i]
		local data = datas[i]

		if t > data.next_spawn_t then
			data.next_seed = data.next_seed or Managers.state.unit_storage:go_id(unit) + i
			data.next_spawn_t = data.next_spawn_t + config.frequency

			local spawn_rot = wave_rotation
			local max_angle = config.max_random_angle

			if max_angle and max_angle > 0 then
				local up = Quaternion.up(wave_rotation)

				spawn_rot = Quaternion.multiply(spawn_rot, Quaternion.axis_angle(up, math.random(-max_angle, max_angle)))
			end

			local spawn_pos

			if config.separation_type == "box" then
				local bounds = config.bounds
				local box_pose = Matrix4x4.from_quaternion_position(wave_rotation, wave_position)

				data.next_seed, spawn_pos = math.get_random_point_inside_box_seeded(data.next_seed, box_pose, bounds)

				local offset = config.offset

				spawn_pos = spawn_pos + Quaternion.rotate(wave_rotation, Vector3(offset[1], offset[2], offset[3]))
			end

			self:insert_fx(spawn_pos, spawn_rot, i)
		end
	end
end

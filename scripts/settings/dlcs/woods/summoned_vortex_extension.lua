SummonedVortexExtension = class(SummonedVortexExtension)
local unit_alive = Unit.alive
local position_lookup = POSITION_LOOKUP
local BLACKBOARDS = BLACKBOARDS
local NUMBER_OF_RAYCASTS = 36
local RAYCAST_INVERAL_RAD = 2 * math.pi / NUMBER_OF_RAYCASTS
local NAV_COST_MAP_UPDATE_INTERVAL = 0.5
local sot_landing_breeds = {
	chaos_marauder_with_shield = true,
	chaos_raider = true,
	chaos_fanatic = true,
	skaven_slave = true,
	chaos_berzerker = true,
	skaven_clan_rat_with_shield = true,
	skaven_clan_rat = true,
	chaos_marauder = true
}

SummonedVortexExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local world = extension_init_context.world
	self.world = world
	self.unit = unit
	local ai_system = Managers.state.entity:system("ai_system")
	self.ai_system = ai_system
	self.nav_world = ai_system:nav_world()
	local vortex_template_name = extension_init_data.vortex_template_name
	local vortex_template = VortexTemplates[vortex_template_name]
	self.vortex_template_name = vortex_template_name
	self.vortex_template = vortex_template
	local inner_fx_name = vortex_template.inner_fx_name
	local position = position_lookup[unit]
	local inner_fx_id = World.create_particles(world, inner_fx_name, position)
	local rotation = Unit.local_rotation(unit, 0)
	local inner_pose = Matrix4x4.from_quaternion(rotation)
	local inner_scale_xy = vortex_template.full_inner_radius / vortex_template.full_fx_radius
	local inner_fx_z_scale_multiplier = vortex_template.inner_fx_z_scale_multiplier or 1

	Matrix4x4.set_scale(inner_pose, Vector3(inner_scale_xy, inner_scale_xy, inner_fx_z_scale_multiplier))
	World.link_particles(world, inner_fx_id, unit, 0, inner_pose, "stop")

	self._inner_fx_id = inner_fx_id
	local outer_fx_name = vortex_template.outer_fx_name
	local outer_fx_id = World.create_particles(world, outer_fx_name, position)
	local outer_pose = Matrix4x4.from_quaternion(rotation)
	local outer_scale_xy = vortex_template.full_outer_radius / vortex_template.full_fx_radius
	local outer_fx_z_scale_multiplier = vortex_template.outer_fx_z_scale_multiplier or 1

	Matrix4x4.set_scale(outer_pose, Vector3(outer_scale_xy, outer_scale_xy, outer_fx_z_scale_multiplier))
	World.link_particles(world, outer_fx_id, unit, 0, outer_pose, "stop")

	self._outer_fx_id = outer_fx_id
	self.current_height_lerp = 0
	local inner_decal_unit = extension_init_data.inner_decal_unit

	if inner_decal_unit then
		World.link_unit(world, inner_decal_unit, unit, 0)
		Unit.set_local_scale(inner_decal_unit, 0, Vector3(inner_scale_xy, inner_scale_xy, 1))
		Unit.flow_event(inner_decal_unit, "vortex_spawned")

		self._inner_decal_unit = inner_decal_unit
	end

	local outer_decal_unit = extension_init_data.outer_decal_unit

	if outer_decal_unit then
		World.link_unit(world, outer_decal_unit, unit, 0)
		Unit.set_local_scale(outer_decal_unit, 0, Vector3(outer_scale_xy, outer_scale_xy, 1))
		Unit.flow_event(outer_decal_unit, "vortex_spawned")

		self._outer_decal_unit = outer_decal_unit
	end

	local use_nav_cost_map_volumes = vortex_template.use_nav_cost_map_volumes

	if use_nav_cost_map_volumes then
		local full_outer_radius = vortex_template.full_outer_radius
		local high_cost_type = vortex_template.high_cost_nav_cost_map_cost_type
		local medium_cost_type = vortex_template.medium_cost_nav_cost_map_cost_type

		self:_create_nav_cost_maps(ai_system, position, full_outer_radius, high_cost_type, medium_cost_type)

		self._use_nav_cost_map_volumes = true
	end

	self._owner_unit = extension_init_data.owner_unit or unit
end

SummonedVortexExtension._create_nav_cost_maps = function (self, ai_system, position, full_outer_radius, high_cost_type, medium_cost_type)
	local function safe_navigation_callback()
		local num_volumes = 1
		local transform = Matrix4x4.from_translation(position)
		local scale_vector = Vector3(full_outer_radius, full_outer_radius, 1)
		local high_cost_map_id = ai_system:create_nav_cost_map(high_cost_type, num_volumes)
		self._high_cost_nav_cost_map_volume_id = ai_system:add_nav_cost_map_box_volume(transform, scale_vector, high_cost_map_id)
		self._high_cost_nav_cost_map_id = high_cost_map_id
		local medium_cost_map_id = ai_system:create_nav_cost_map(medium_cost_type, num_volumes)
		self._medium_cost_nav_cost_map_volume_id = ai_system:add_nav_cost_map_box_volume(transform, scale_vector, medium_cost_map_id)
		self._medium_cost_nav_cost_map_id = medium_cost_map_id
		local time_manager = Managers.time
		local t = time_manager:time("game")
		self._next_nav_cost_map_update_t = t + NAV_COST_MAP_UPDATE_INTERVAL
	end

	local ai_navigation_system = Managers.state.entity:system("ai_navigation_system")

	ai_navigation_system:add_safe_navigation_callback(safe_navigation_callback)
end

SummonedVortexExtension.extensions_ready = function (self, world, unit)
	local vortex_template = self.vortex_template
	local time_manager = Managers.time
	local t = time_manager:time("game")
	local max_size = NUMBER_OF_RAYCASTS
	self.vortex_data = {
		idle_time = 0,
		height = 5,
		start_lerp_height = 5,
		start_lerp_inner_radius = 2,
		start_lerp_fx_radius = 8,
		current_raycast_rad = 0,
		num_players_inside = 0,
		ai_units_inside = {},
		physics_world = World.get_data(world, "physics_world"),
		wanted_height = vortex_template.max_height,
		height_ring_buffer = {
			write_index = 1,
			buffer = Script.new_array(max_size),
			max_size = max_size
		},
		inner_radius = vortex_template.full_inner_radius,
		outer_radius = vortex_template.full_outer_radius,
		fx_radius = vortex_template.full_fx_radius,
		windup_time = t + vortex_template.windup_time,
		time_of_death = t + ConflictUtils.random_interval(vortex_template.time_of_life),
		vortex_template = vortex_template
	}
	local start_sound_event_name = vortex_template.start_sound_event_name or "Play_enemy_sorcerer_vortex_loop"

	WwiseUtils.trigger_unit_event(world, start_sound_event_name, unit)
end

SummonedVortexExtension.refresh_duration = function (self)
	local vortex_data = self.vortex_data

	if not vortex_data then
		return
	end

	local ai_units_inside = vortex_data.ai_units_inside
	local vortex_template = self.vortex_template
	local t = Managers.time:time("game")
	local life_time = ConflictUtils.random_interval(vortex_template.time_of_life)
	local found_multiplier = false

	for ai_unit, _ in pairs(ai_units_inside) do
		if ALIVE[ai_unit] then
			local breed_name = BLACKBOARDS[ai_unit].breed.name
			local reduce_duration_per_breed = vortex_template.reduce_duration_per_breed
			local multiplier = reduce_duration_per_breed and reduce_duration_per_breed[breed_name] or 1
			local time_to_add = math.clamp(life_time * multiplier, 0, math.huge)
			self.vortex_data.time_of_death = t + time_to_add
			found_multiplier = true
		end
	end

	if not found_multiplier then
		self.vortex_data.time_of_death = t + life_time
	end
end

SummonedVortexExtension.destroy = function (self)
	local vortex_data = self.vortex_data
	local ai_units_inside = vortex_data.ai_units_inside
	local BLACKBOARDS = BLACKBOARDS
	local unit = self.unit

	for ai_unit, _ in pairs(ai_units_inside) do
		if ALIVE[ai_unit] then
			local velocity = Vector3(0, 0, -6)
			local target_blackboard = BLACKBOARDS[ai_unit]

			if target_blackboard then
				local locomotion_extension = target_blackboard.locomotion_extension

				locomotion_extension:set_wanted_velocity(velocity)
				locomotion_extension:set_affected_by_gravity(true)
				locomotion_extension:set_movement_type("constrained_by_mover")

				local ejected_from_vortex = target_blackboard.ejected_from_vortex or Vector3Box()

				ejected_from_vortex:store(velocity)

				target_blackboard.ejected_from_vortex = ejected_from_vortex
				target_blackboard.in_vortex_state = "ejected_from_vortex"
			end
		end
	end

	local inner_decal_unit = self._inner_decal_unit

	if unit_alive(inner_decal_unit) then
		Unit.flow_event(inner_decal_unit, "vortex_despawned")
	end

	local outer_decal_unit = self._outer_decal_unit

	if unit_alive(outer_decal_unit) then
		Unit.flow_event(outer_decal_unit, "vortex_despawned")
	end

	table.clear(vortex_data)

	self.vortex_data = nil
	local world = self.world
	local stop_sound_event_name = self.vortex_template.stop_sound_event_name or "Stop_enemy_sorcerer_vortex_loop"

	WwiseUtils.trigger_unit_event(world, stop_sound_event_name, unit)

	if self._use_nav_cost_map_volumes then
		local ai_system = self.ai_system
		local high_cost_cost_map_id = self._high_cost_nav_cost_map_id
		local high_cost_volume_id = self._high_cost_nav_cost_map_volume_id

		ai_system:remove_nav_cost_map_volume(high_cost_volume_id, high_cost_cost_map_id)
		ai_system:destroy_nav_cost_map(high_cost_cost_map_id)

		local medium_cost_cost_map_id = self._medium_cost_nav_cost_map_id
		local medium_cost_volume_id = self._medium_cost_nav_cost_map_volume_id

		ai_system:remove_nav_cost_map_volume(medium_cost_volume_id, medium_cost_cost_map_id)
		ai_system:destroy_nav_cost_map(medium_cost_cost_map_id)
	end
end

local HEIGHT_FX_LERP = 2

SummonedVortexExtension.update = function (self, unit, input, dt, context, t)
	local vortex_template = self.vortex_template
	local vortex_data = self.vortex_data
	local nav_world = self.nav_world
	local position = position_lookup[unit]

	self:_update_height(unit, t, dt, vortex_template, vortex_data)

	local inner_radius = vortex_data.inner_radius
	local outer_radius = vortex_data.outer_radius
	local fx_radius = vortex_data.fx_radius

	if vortex_data.windup_time < t then
		self:attract(unit, t, dt, vortex_template, vortex_data, position, inner_radius, outer_radius)
	end

	local killed_all_enemies = nil

	if vortex_data.enemies_inside and vortex_data.enemies_killed and vortex_data.enemies_killed == vortex_data.enemies_inside then
		killed_all_enemies = true
	end

	if vortex_data.time_of_death < t or killed_all_enemies then
		Managers.state.unit_spawner:mark_for_deletion(self.unit)

		return
	end

	local height = vortex_data.height
	local height_percentage = height / vortex_template.max_height
	local current_height_lerp = self.current_height_lerp
	local height_lerp = math.lerp(current_height_lerp, height_percentage, math.min(dt * HEIGHT_FX_LERP, 1))
	self.current_height_lerp = height_lerp
	local scale_xy = vortex_data.fx_radius
	local scale_z = height_lerp * vortex_template.max_height

	Unit.set_local_scale(unit, 0, Vector3(scale_xy, scale_xy, scale_z))
end

local function position_aligned_on_navmesh_transform(nav_world, position, x_axis)
	local success, altitude, vertex_1, vertex_2, vertex_3 = GwNavQueries.triangle_from_position(nav_world, position, 3, 3)

	if success then
		local v1_to_v2 = Vector3.normalize(vertex_2 - vertex_1)
		local v1_to_v3 = Vector3.normalize(vertex_3 - vertex_1)
		local normal = Vector3.normalize(Vector3.cross(v1_to_v2, v1_to_v3))
		local y_axis = Vector3.cross(normal, x_axis)
		local rotation = Quaternion.look(y_axis, normal)
		local position_on_mesh = Vector3(position.x, position.y, altitude)
		local transform = Matrix4x4.from_quaternion_position(rotation, position_on_mesh)

		return transform, position_on_mesh, rotation, y_axis
	end
end

SummonedVortexExtension._update_nav_cost_map_volumes = function (self, position, full_outer_radius, nav_world, ai_system, navigation_extension, locomotion_extension)
	local velocity = locomotion_extension:current_velocity()
	local velocity_normalized = Vector3.normalize(velocity)
	local x_axis = Vector3.cross(velocity_normalized, Vector3.up())
	local high_cost_transform, high_cost_position, high_cost_rotation, high_cost_direction = position_aligned_on_navmesh_transform(nav_world, position, x_axis)

	if not high_cost_transform then
		return
	end

	local high_cost_map_id = self._high_cost_nav_cost_map_id
	local high_cost_volume_id = self._high_cost_nav_cost_map_volume_id

	ai_system:set_nav_cost_map_volume_transform(high_cost_volume_id, high_cost_map_id, high_cost_transform)

	local speed = Vector3.length(velocity)
	local max_speed = navigation_extension:get_max_speed()
	local lerp_value = speed / max_speed
	local scale_value = math.lerp(1, 2, lerp_value)
	local new_scale = Vector3(full_outer_radius, scale_value * full_outer_radius, 1)
	local medium_cost_map_id = self._medium_cost_nav_cost_map_id
	local medium_cost_volume_id = self._medium_cost_nav_cost_map_volume_id

	ai_system:set_nav_cost_map_volume_scale(medium_cost_volume_id, medium_cost_map_id, new_scale)

	local medium_cost_position = high_cost_position + high_cost_direction * 0.5 * full_outer_radius * scale_value
	local medium_cost_transform = Matrix4x4.from_quaternion_position(high_cost_rotation, medium_cost_position)

	ai_system:set_nav_cost_map_volume_transform(medium_cost_volume_id, medium_cost_map_id, medium_cost_transform)
end

local INCREASE_HEIGHT_LERP_PROGRESS_PER_SECOND = 0.25

SummonedVortexExtension._update_height = function (self, unit, t, dt, vortex_template, vortex_data)
	local check_z_offset = 1
	local current_raycast_rad = vortex_data.current_raycast_rad
	local check_radius = vortex_data.inner_radius
	local unit_position = position_lookup[unit]
	local ray_source = unit_position + Vector3(math.cos(current_raycast_rad) * check_radius, math.sin(current_raycast_rad) * check_radius, check_z_offset)
	local physics_world = vortex_data.physics_world
	local current_height = vortex_data.height
	local max_height = vortex_template.max_height - check_z_offset
	local hit, hit_position, hit_distance, _, _ = PhysicsWorld.immediate_raycast(physics_world, ray_source, Vector3.up(), max_height, "closest", "collision_filter", "filter_ai_mover")
	local new_height = hit and hit_distance or max_height
	new_height = math.max(new_height, 4)
	local height_ring_buffer = vortex_data.height_ring_buffer
	local buffer = height_ring_buffer.buffer
	local max_size = height_ring_buffer.max_size
	local minimum_height = new_height + check_z_offset

	for i = 1, max_size do
		local height = buffer[i]

		if height and height < minimum_height then
			minimum_height = height
		end
	end

	local write_index = height_ring_buffer.write_index
	buffer[write_index] = new_height + check_z_offset
	height_ring_buffer.write_index = write_index % max_size + 1

	if vortex_data.wanted_height ~= minimum_height then
		vortex_data.wanted_height = minimum_height
		vortex_data.start_lerp_height = current_height
	end

	local wanted_height = vortex_data.wanted_height

	if wanted_height < current_height then
		vortex_data.height = wanted_height
	elseif current_height < wanted_height then
		local start_lerp_height = vortex_data.start_lerp_height
		local current_lerp_value = math.abs(current_height - start_lerp_height) / math.abs(wanted_height - start_lerp_height)
		local new_lerp_value = math.clamp(current_lerp_value + dt * INCREASE_HEIGHT_LERP_PROGRESS_PER_SECOND, 0, 1)
		vortex_data.height = math.lerp(start_lerp_height, wanted_height, new_lerp_value)
	end
end

local ai_units = {}

SummonedVortexExtension._update_attract_outside_ai = function (self, vortex_data, vortex_template, center_pos, minimum_height_diff, inner_radius, outer_radius, falloff_radius)
	local vortex_height = vortex_data.height
	local ai_attract_speed = vortex_template.ai_attract_speed
	local ai_units_inside = vortex_data.ai_units_inside
	local num_ai_units = AiUtils.broadphase_query(center_pos, outer_radius, ai_units)

	if vortex_template.max_units and vortex_data.enemies_inside and vortex_template.max_units <= vortex_data.enemies_inside then
		return
	end

	for i = 1, num_ai_units do
		if vortex_template.max_units and vortex_data.enemies_inside and vortex_template.max_units <= vortex_data.enemies_inside then
			break
		end

		local ai_unit = ai_units[i]

		if not ai_units_inside[ai_unit] then
			local target_blackboard = BLACKBOARDS[ai_unit]

			if target_blackboard.breed.vortexable or target_blackboard.breed.controllable then
				local locomotion_extension = target_blackboard.locomotion_extension
				local is_alive = HEALTH_ALIVE[ai_unit]

				if locomotion_extension and is_alive then
					local unit_position = position_lookup[ai_unit]
					local suck_dir = center_pos - unit_position
					local height = -suck_dir.z

					Vector3.set_z(suck_dir, 0)

					if minimum_height_diff <= height and height < vortex_height then
						local ai_distance = Vector3.length(suck_dir)

						if inner_radius < ai_distance then
							local distance_to_inner_radius = ai_distance - inner_radius
							local k = math.clamp(1 - distance_to_inner_radius / falloff_radius, 0, 1)
							local speed = ai_attract_speed * k * k
							local dir = Vector3.normalize(suck_dir)
							local velocity = dir * speed

							locomotion_extension:set_external_velocity(velocity)
						else
							target_blackboard.in_vortex_state = "in_vortex_init"
							target_blackboard.in_vortex = true
							target_blackboard.thornsister_vortex = true
							target_blackboard.thornsister_vortex_ext = self
							local breed_name = target_blackboard.breed.name

							if sot_landing_breeds[breed_name] then
								target_blackboard.sot_landing = true
							end

							local t = Managers.time:time("game")
							local life_time = ConflictUtils.random_interval(vortex_template.time_of_life)
							local reduce_duration_per_breed = vortex_template.reduce_duration_per_breed
							local multiplier = reduce_duration_per_breed and reduce_duration_per_breed[breed_name] or 1
							local time_to_add = math.clamp(life_time * multiplier, 0, math.huge)
							self.vortex_data.time_of_death = t + time_to_add

							Managers.state.achievement:trigger_event("vortex_caught_unit", self._owner_unit, ai_unit)

							local ai_simple_extension = ScriptUnit.has_extension(ai_unit, "ai_system")

							if ai_simple_extension then
								target_blackboard.only_trust_your_own_eyes = false

								AiUtils.aggro_unit_of_enemy(ai_unit, self._owner_unit)
							end

							target_blackboard.eject_height = ConflictUtils.random_interval(vortex_template.ai_eject_height)
							ai_units_inside[ai_unit] = true

							if not vortex_data.enemies_inside then
								vortex_data.enemies_inside = 0
							end

							vortex_data.enemies_inside = vortex_data.enemies_inside + 1
						end
					end
				end
			end
		end
	end
end

SummonedVortexExtension._update_attract_inside_ai = function (self, vortex_data, vortex_template, dt, center_pos, inner_radius, allowed_distance)
	local ai_rotation_speed = vortex_template.ai_rotation_speed
	local ai_radius_change_speed = vortex_template.ai_radius_change_speed
	local ai_ascension_speed = vortex_template.ai_ascension_speed
	local ai_max_ascension_height = vortex_template.ai_max_ascension_height
	local ai_wanted_distance = inner_radius
	local vortex_height = vortex_data.height
	local up_direction = Vector3.up()
	local ai_units_inside = vortex_data.ai_units_inside

	for ai_unit, _ in pairs(ai_units_inside) do
		local is_alive = HEALTH_ALIVE[ai_unit]

		if is_alive then
			local target_blackboard = BLACKBOARDS[ai_unit]

			if target_blackboard.in_vortex_state == "in_vortex" then
				local unit_position = position_lookup[ai_unit]
				local velocity, new_radius, new_height = LocomotionUtils.get_vortex_spin_velocity(unit_position, center_pos, ai_wanted_distance, up_direction, ai_rotation_speed, ai_radius_change_speed, ai_ascension_speed, dt)
				local locomotion_extension = target_blackboard.locomotion_extension

				locomotion_extension:set_wanted_velocity(velocity)

				if target_blackboard.eject_height < new_height or vortex_height < new_height or allowed_distance < new_radius or ai_max_ascension_height < new_height then
					local new_vel = velocity * 0

					locomotion_extension:set_wanted_velocity(new_vel)
				end
			elseif target_blackboard.in_vortex_state == "landed" then
				ai_units_inside[ai_unit] = nil

				if not vortex_data.enemies_killed then
					vortex_data.enemies_killed = 0
				end

				vortex_data.enemies_killed = vortex_data.enemies_killed + 1
			end
		else
			ai_units_inside[ai_unit] = nil

			if not vortex_data.enemies_killed then
				vortex_data.enemies_killed = 0
			end

			vortex_data.enemies_killed = vortex_data.enemies_killed + 1
		end
	end
end

SummonedVortexExtension.attract = function (self, unit, t, dt, vortex_template, vortex_data, center_pos, inner_radius, outer_radius)
	local minimum_height_diff = -0.5
	local falloff_radius = outer_radius - inner_radius
	local max_allowed_inner_radius_dist = vortex_template.max_allowed_inner_radius_dist
	local allowed_distance = inner_radius + max_allowed_inner_radius_dist

	if vortex_template.ai_attractable then
		self:_update_attract_outside_ai(vortex_data, vortex_template, center_pos, minimum_height_diff, inner_radius, outer_radius, falloff_radius)
		self:_update_attract_inside_ai(vortex_data, vortex_template, dt, center_pos, inner_radius, allowed_distance)
	end
end

SummonedVortexExtension.is_position_inside = function (self, position, min_allowed_distance)
	local vortex_data = self.vortex_data
	local outer_radius = vortex_data.outer_radius
	local required_distance_sq = (outer_radius + (min_allowed_distance or 0))^2
	local self_unit = self.unit
	local self_position = POSITION_LOOKUP[self_unit]
	local distance_sq = Vector3.distance_squared(position, self_position)

	return distance_sq < required_distance_sq
end

local spiral = {}
local spiral_segments = 8
local spiral_lines = 10

SummonedVortexExtension.debug_render_vortex = function (self, t, dt, pos, fx_radius, inner_radius, outer_radius, spin_speed, height)
	fx_radius = fx_radius + math.sin(t * 1.7) * 0.4
	local step = 2 * math.pi / 6
	local col_delta = math.floor(155 / spiral_segments)
	local height_step = height / spiral_segments

	for j = 1, spiral_lines do
		local alpha = j * 2 * math.pi / spiral_lines

		for i = 1, spiral_segments do
			local r = fx_radius + 0.5 * i * i / spiral_segments
			local v = t * spin_speed + i * step + alpha
			spiral[i] = Vector3(math.sin(v) * r, math.cos(v) * r, (i - 1) * height_step)
		end

		local r = fx_radius + math.sin(t) * 0.2
		local v = t * spin_speed + alpha + 0 * step
		local pos1 = Vector3(math.sin(v) * r, math.cos(v) * r, 0)

		QuickDrawer:sphere(pos + pos1, (math.sin(v * 3) + 1) / 3, Color(155, 255, 155))

		for i = 1, spiral_segments do
			local pos2 = spiral[i]
			local color = Color(155 - col_delta * i, 255 - col_delta * i, 155 - col_delta * i)

			QuickDrawer:line(pos + pos1, pos + pos2, color)

			pos1 = pos2
		end
	end

	QuickDrawer:circle(pos, inner_radius, Vector3.up(), Colors.get("pink"))
	QuickDrawer:circle(pos, outer_radius, Vector3.up(), Colors.get("lime_green"))
end

VortexExtension = class(VortexExtension)
local unit_alive = Unit.alive
local position_lookup = POSITION_LOOKUP
local player_and_bot_units = PLAYER_AND_BOT_UNITS
local BLACKBOARDS = BLACKBOARDS
local NUMBER_OF_RAYCASTS = 36
local RAYCAST_INVERAL_RAD = (math.pi*2)/NUMBER_OF_RAYCASTS
local NAV_COST_MAP_UPDATE_INTERVAL = 0.5
VortexExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local world = extension_init_context.world
	self.world = world
	self.unit = unit
	local ai_system = Managers.state.entity:system("ai_system")
	self.ai_system = ai_system
	local vortex_template_name = extension_init_data.vortex_template_name
	local vortex_template = VortexTemplates[vortex_template_name]
	self.vortex_template_name = vortex_template_name
	self.vortex_template = vortex_template
	local inner_fx_name = vortex_template.inner_fx_name
	local position = position_lookup[unit]
	local inner_fx_id = World.create_particles(world, inner_fx_name, position)
	local rotation = Unit.local_rotation(unit, 0)
	local inner_pose = Matrix4x4.from_quaternion(rotation)
	local inner_scale_xy = vortex_template.full_inner_radius/vortex_template.full_fx_radius
	local inner_fx_z_scale_multiplier = vortex_template.inner_fx_z_scale_multiplier or 1

	Matrix4x4.set_scale(inner_pose, Vector3(inner_scale_xy, inner_scale_xy, inner_fx_z_scale_multiplier))
	World.link_particles(world, inner_fx_id, unit, 0, inner_pose, "stop")

	self._inner_fx_id = inner_fx_id
	local outer_fx_name = vortex_template.outer_fx_name
	local outer_fx_id = World.create_particles(world, outer_fx_name, position)
	local outer_pose = Matrix4x4.from_quaternion(rotation)
	local outer_scale_xy = vortex_template.full_outer_radius/vortex_template.full_fx_radius
	local outer_fx_z_scale_multiplier = vortex_template.outer_fx_z_scale_multiplier or 1

	Matrix4x4.set_scale(outer_pose, Vector3(outer_scale_xy, outer_scale_xy, outer_fx_z_scale_multiplier))
	World.link_particles(world, outer_fx_id, unit, 0, outer_pose, "stop")

	self._outer_fx_id = outer_fx_id
	self.current_height_lerp = 0
	local inner_decal_unit = extension_init_data.inner_decal_unit

	if inner_decal_unit then
		World.link_unit(world, inner_decal_unit, unit, 0)
		Unit.set_local_scale(inner_decal_unit, 0, Vector3(inner_scale_xy, inner_scale_xy, 1))

		self._inner_decal_unit = inner_decal_unit
	end

	local outer_decal_unit = extension_init_data.outer_decal_unit

	if outer_decal_unit then
		World.link_unit(world, outer_decal_unit, unit, 0)
		Unit.set_local_scale(outer_decal_unit, 0, Vector3(outer_scale_xy, outer_scale_xy, 1))

		self._outer_decal_unit = outer_decal_unit
	end

	local use_nav_cost_map_volumes = vortex_template.use_nav_cost_map_volumes

	if use_nav_cost_map_volumes then
		local full_outer_radius = vortex_template.full_outer_radius
		local high_cost_type = vortex_template.high_cost_nav_cost_map_cost_type
		local medium_cost_type = vortex_template.medium_cost_nav_cost_map_cost_type

		self._create_nav_cost_maps(self, ai_system, position, full_outer_radius, high_cost_type, medium_cost_type)

		self._use_nav_cost_map_volumes = true
	end

	return 
end
VortexExtension._create_nav_cost_maps = function (self, ai_system, position, full_outer_radius, high_cost_type, medium_cost_type)
	local num_volumes = 1
	local transform = Matrix4x4.from_translation(position)
	local scale_vector = Vector3(full_outer_radius, full_outer_radius, 1)
	local high_cost_map_id = ai_system.create_nav_cost_map(ai_system, high_cost_type, num_volumes)
	self._high_cost_nav_cost_map_volume_id = ai_system.add_nav_cost_map_box_volume(ai_system, transform, scale_vector, high_cost_map_id)
	self._high_cost_nav_cost_map_id = high_cost_map_id
	local medium_cost_map_id = ai_system.create_nav_cost_map(ai_system, medium_cost_type, num_volumes)
	self._medium_cost_nav_cost_map_volume_id = ai_system.add_nav_cost_map_box_volume(ai_system, transform, scale_vector, medium_cost_map_id)
	self._medium_cost_nav_cost_map_id = medium_cost_map_id
	local time_manager = Managers.time
	local t = time_manager.time(time_manager, "game")
	self._next_nav_cost_map_update_t = t + NAV_COST_MAP_UPDATE_INTERVAL

	return 
end
VortexExtension.extensions_ready = function (self, world, unit)
	local blackboard = BLACKBOARDS[unit]
	self.blackboard = blackboard
	local vortex_template = self.vortex_template
	local time_manager = Managers.time
	local t = time_manager.time(time_manager, "game")
	local max_size = NUMBER_OF_RAYCASTS
	blackboard.vortex_data = {
		idle_time = 0,
		height = 5,
		inner_radius = 2,
		start_lerp_height = 5,
		start_lerp_fx_radius = 8,
		wander_time = 0,
		start_lerp_inner_radius = 2,
		current_raycast_rad = 0,
		num_players_inside = 0,
		outer_radius = 8,
		ai_units_inside = {},
		players_inside = {},
		players_ejected = {},
		physics_world = World.get_data(world, "physics_world"),
		wander_state = (vortex_template.forced_standing_still and "forced_standing_still") or "recalc_path",
		wanted_height = vortex_template.max_height,
		height_ring_buffer = {
			write_index = 1,
			buffer = Script.new_array(max_size),
			max_size = max_size
		},
		fx_radius = vortex_template.start_radius,
		wanted_inner_radius = vortex_template.full_inner_radius,
		wanted_fx_radius = vortex_template.full_fx_radius,
		inner_radius_ring_buffer = {
			write_index = 1,
			buffer = Script.new_array(max_size),
			max_size = max_size
		},
		windup_time = t + vortex_template.windup_time,
		time_of_death = t + ConflictUtils.random_interval(vortex_template.time_of_life),
		vortex_template = vortex_template
	}
	local locomotion_extension = blackboard.locomotion_extension

	locomotion_extension.set_rotation_speed(locomotion_extension, 0)

	local navigation_extension = blackboard.navigation_extension

	navigation_extension.init_position(navigation_extension)
	WwiseUtils.trigger_unit_event(world, "Play_enemy_sorcerer_vortex_loop", unit)

	return 
end
VortexExtension.destroy = function (self)
	local blackboard = self.blackboard
	local vortex_data = blackboard.vortex_data
	local players_inside = vortex_data.players_inside
	local players_ejected = vortex_data.players_ejected
	local ai_units_inside = vortex_data.ai_units_inside
	local BLACKBOARDS = BLACKBOARDS
	local unit = self.unit
	local number_player_and_bots = #player_and_bot_units

	for i = 1, number_player_and_bots, 1 do
		local player_unit = player_and_bot_units[i]

		if unit_alive(player_unit) then
			if players_inside[player_unit] then
				StatusUtils.set_in_vortex_network(player_unit, false, nil)

				players_inside[player_unit] = nil
			elseif players_ejected[player_unit] then
				players_ejected[player_unit] = nil
			end

			local target_status_extension = ScriptUnit.extension(player_unit, "status_system")
			target_status_extension.smacked_into_wall = false

			if target_status_extension.near_vortex_unit == unit then
				StatusUtils.set_near_vortex_network(player_unit, false)
			end
		end
	end

	for ai_unit, _ in pairs(ai_units_inside) do
		if unit_alive(ai_unit) then
			local velocity = Vector3(0, 0, -6)
			local target_blackboard = BLACKBOARDS[ai_unit]

			if target_blackboard then
				local locomotion_extension = target_blackboard.locomotion_extension

				locomotion_extension.set_wanted_velocity(locomotion_extension, velocity)
				locomotion_extension.set_affected_by_gravity(locomotion_extension, true)
				locomotion_extension.set_movement_type(locomotion_extension, "constrained_by_mover")

				local ejected_from_vortex = target_blackboard.ejected_from_vortex or Vector3Box()

				ejected_from_vortex.store(ejected_from_vortex, velocity)

				target_blackboard.ejected_from_vortex = ejected_from_vortex
				target_blackboard.in_vortex_state = "ejected_from_vortex"
			end
		end
	end

	local unit_spawner = Managers.state.unit_spawner
	local inner_decal_unit = self._inner_decal_unit

	if unit_alive(inner_decal_unit) then
		unit_spawner.mark_for_deletion(unit_spawner, inner_decal_unit)
	end

	local outer_decal_unit = self._outer_decal_unit

	if unit_alive(outer_decal_unit) then
		unit_spawner.mark_for_deletion(unit_spawner, outer_decal_unit)
	end

	table.clear(vortex_data)

	blackboard.vortex_data = nil
	local world = self.world

	WwiseUtils.trigger_unit_event(world, "Stop_enemy_sorcerer_vortex_loop", unit)

	if self._use_nav_cost_map_volumes then
		local ai_system = self.ai_system
		local high_cost_cost_map_id = self._high_cost_nav_cost_map_id
		local high_cost_volume_id = self._high_cost_nav_cost_map_volume_id

		ai_system.remove_nav_cost_map_volume(ai_system, high_cost_volume_id, high_cost_cost_map_id)
		ai_system.destroy_nav_cost_map(ai_system, high_cost_cost_map_id)

		local medium_cost_cost_map_id = self._medium_cost_nav_cost_map_id
		local medium_cost_volume_id = self._medium_cost_nav_cost_map_volume_id

		ai_system.remove_nav_cost_map_volume(ai_system, medium_cost_volume_id, medium_cost_cost_map_id)
		ai_system.destroy_nav_cost_map(ai_system, medium_cost_cost_map_id)
	end

	return 
end
local HEIGHT_FX_LERP = 2
VortexExtension.update = function (self, unit, input, dt, context, t)
	local blackboard = self.blackboard
	local vortex_template = self.vortex_template
	local vortex_data = blackboard.vortex_data
	local nav_world = blackboard.nav_world
	local navigation_extension = blackboard.navigation_extension
	local traverse_logic = navigation_extension.traverse_logic(navigation_extension)
	local position = position_lookup[unit]
	local inner_radius, outer_radius, fx_radius = self.control_size(self, unit, t, dt, nav_world, traverse_logic, vortex_template, vortex_data)

	if vortex_data.windup_time < t then
		self.attract(self, unit, t, dt, blackboard, vortex_template, vortex_data, position, inner_radius, outer_radius)
	end

	if vortex_data.time_of_death < t then
		Managers.state.conflict:destroy_unit(unit, blackboard, "vortex")

		return 
	end

	if self._use_nav_cost_map_volumes and self._next_nav_cost_map_update_t < t then
		local ai_system = self.ai_system
		local locomotion_extension = blackboard.locomotion_extension
		local full_outer_radius = vortex_template.full_outer_radius

		self._update_nav_cost_map_volumes(self, position, full_outer_radius, nav_world, ai_system, navigation_extension, locomotion_extension)

		self._next_nav_cost_map_update_t = t + NAV_COST_MAP_UPDATE_INTERVAL
	end

	local fx_radius_percentage = fx_radius/vortex_template.full_fx_radius
	local height = vortex_data.height
	local height_percentage = height/vortex_template.max_height
	local current_height_lerp = self.current_height_lerp
	local height_lerp = math.lerp(current_height_lerp, height_percentage, math.min(dt*HEIGHT_FX_LERP, 1))
	self.current_height_lerp = height_lerp
	local scale_xy = fx_radius_percentage*vortex_template.full_fx_radius
	local scale_z = height_lerp*vortex_template.max_height

	Unit.set_local_scale(unit, 0, Vector3(scale_xy, scale_xy, scale_z))

	if script_data.debug_vortex then
		local spin_speed = vortex_template.ai_rotation_speed

		self.debug_render_vortex(self, t, dt, position, fx_radius, inner_radius, outer_radius, spin_speed, height)
		Debug.text(string.format("VORTEX : FX_RADIUS: %.2f INNER_RADIUS: %.2f OUTER_RADIUS: %.2f HEIGHT: %.2f SPIN_SPEED: %.2f HEIGHT_LERP: %.4f", fx_radius, inner_radius, outer_radius, height, spin_speed, height_lerp))
	end

	return 
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

	return 
end

VortexExtension._update_nav_cost_map_volumes = function (self, position, full_outer_radius, nav_world, ai_system, navigation_extension, locomotion_extension)
	local velocity = locomotion_extension.current_velocity(locomotion_extension)
	local velocity_normalized = Vector3.normalize(velocity)
	local x_axis = Vector3.cross(velocity_normalized, Vector3.up())
	local high_cost_transform, high_cost_position, high_cost_rotation, high_cost_direction = position_aligned_on_navmesh_transform(nav_world, position, x_axis)

	if not high_cost_transform then
		return 
	end

	local high_cost_map_id = self._high_cost_nav_cost_map_id
	local high_cost_volume_id = self._high_cost_nav_cost_map_volume_id

	ai_system.set_nav_cost_map_volume_transform(ai_system, high_cost_volume_id, high_cost_map_id, high_cost_transform)

	local speed = Vector3.length(velocity)
	local max_speed = navigation_extension.get_max_speed(navigation_extension)
	local lerp_value = speed/max_speed
	local scale_value = math.lerp(1, 2, lerp_value)
	local new_scale = Vector3(full_outer_radius, scale_value*full_outer_radius, 1)
	local medium_cost_map_id = self._medium_cost_nav_cost_map_id
	local medium_cost_volume_id = self._medium_cost_nav_cost_map_volume_id

	ai_system.set_nav_cost_map_volume_scale(ai_system, medium_cost_volume_id, medium_cost_map_id, new_scale)

	local medium_cost_position = high_cost_position + high_cost_direction*full_outer_radius*0.5*scale_value
	local medium_cost_transform = Matrix4x4.from_quaternion_position(high_cost_rotation, medium_cost_position)

	ai_system.set_nav_cost_map_volume_transform(ai_system, medium_cost_volume_id, medium_cost_map_id, medium_cost_transform)

	return 
end
local INCREASE_HEIGHT_LERP_PROGRESS_PER_SECOND = 0.25
VortexExtension._update_height = function (self, unit, t, dt, vortex_template, vortex_data)
	local check_z_offset = 1
	local current_raycast_rad = vortex_data.current_raycast_rad
	local check_radius = vortex_data.inner_radius
	local unit_position = position_lookup[unit]
	local ray_source = unit_position + Vector3(math.cos(current_raycast_rad)*check_radius, math.sin(current_raycast_rad)*check_radius, check_z_offset)
	local physics_world = vortex_data.physics_world
	local current_height = vortex_data.height
	local max_height = vortex_template.max_height - check_z_offset
	local hit, hit_position, hit_distance, _, _ = PhysicsWorld.immediate_raycast(physics_world, ray_source, Vector3.up(), max_height, "closest", "collision_filter", "filter_ai_mover")
	local new_height = (hit and hit_distance) or max_height
	new_height = math.max(new_height, 4)
	local height_ring_buffer = vortex_data.height_ring_buffer
	local buffer = height_ring_buffer.buffer
	local max_size = height_ring_buffer.max_size
	local minimum_height = new_height + check_z_offset

	for i = 1, max_size, 1 do
		local height = buffer[i]

		if height and height < minimum_height then
			minimum_height = height
		end
	end

	local write_index = height_ring_buffer.write_index
	buffer[write_index] = new_height + check_z_offset
	height_ring_buffer.write_index = write_index%max_size + 1

	if vortex_data.wanted_height ~= minimum_height then
		vortex_data.wanted_height = minimum_height
		vortex_data.start_lerp_height = current_height
	end

	local wanted_height = vortex_data.wanted_height

	if wanted_height < current_height then
		vortex_data.height = wanted_height
	elseif current_height < wanted_height then
		local start_lerp_height = vortex_data.start_lerp_height
		local current_lerp_value = math.abs(current_height - start_lerp_height)/math.abs(wanted_height - start_lerp_height)
		local new_lerp_value = math.clamp(current_lerp_value + dt*INCREASE_HEIGHT_LERP_PROGRESS_PER_SECOND, 0, 1)
		vortex_data.height = math.lerp(start_lerp_height, wanted_height, new_lerp_value)
	end

	if script_data.debug_vortex then
		local ray_end = ray_source + Vector3.up()*new_height
		local debug_color = (hit and Colors.get("red")) or Colors.get("green")

		QuickDrawer:line(ray_source, ray_end, debug_color)
		QuickDrawer:sphere(ray_source, 0.25, Colors.get("yellow"))
		QuickDrawer:sphere(ray_end, 0.25, debug_color)

		local current_height_top = unit_position + Vector3.up()*vortex_data.height
		local projected_height_top = Vector3(ray_end.x, ray_end.y, current_height_top.z)
		local wanted_height_top = unit_position + Vector3.up()*vortex_data.wanted_height
		local projected_wanted_height_top = Vector3(ray_end.x, ray_end.y, wanted_height_top.z)

		QuickDrawer:sphere(current_height_top, 0.125, Colors.get("pink"))
		QuickDrawer:sphere(wanted_height_top, 0.125, Colors.get("purple"))
		QuickDrawer:line(unit_position, current_height_top, Colors.get("pink"))
		QuickDrawer:line(current_height_top, projected_height_top, Colors.get("pink"))
		QuickDrawer:line(current_height_top, wanted_height_top, Colors.get("purple"))
		QuickDrawer:line(wanted_height_top, projected_wanted_height_top, Colors.get("purple"))
	end

	return 
end
local INCREASE_RADIUS_LERP_PROGRESS_PER_SECOND = 0.75
local DECREASE_RADIUS_LERP_PROGRESS_PER_SECOND = 1.5
VortexExtension._update_radius = function (self, unit, t, dt, nav_world, traverse_logic, vortex_template, vortex_data)
	local unit_position = position_lookup[unit]
	local current_inner_radius = vortex_data.inner_radius
	local current_fx_radius = vortex_data.fx_radius
	local radius_check_rad = vortex_data.current_raycast_rad
	local check_radius = vortex_template.full_inner_radius
	local ray_end = unit_position + Vector3(math.cos(radius_check_rad)*check_radius, math.sin(radius_check_rad)*check_radius, 0)
	local success, projected_start_pos, projected_end_pos, hit_position = LocomotionUtils.raycast_on_navmesh(nav_world, unit_position, ray_end, traverse_logic, 1, 1)

	if not projected_start_pos then
		return 
	end

	local hit_distance = Vector3.distance(projected_start_pos, hit_position)
	local inner_radius_ring_buffer = vortex_data.inner_radius_ring_buffer
	local buffer = inner_radius_ring_buffer.buffer
	local max_size = inner_radius_ring_buffer.max_size
	local minimum_inner_radius = math.min(hit_distance, vortex_template.full_inner_radius)

	for i = 1, max_size, 1 do
		local radius = buffer[i]

		if radius and radius < minimum_inner_radius then
			minimum_inner_radius = radius
		end
	end

	minimum_inner_radius = math.max(minimum_inner_radius, vortex_template.min_inner_radius)
	local write_index = inner_radius_ring_buffer.write_index
	buffer[write_index] = hit_distance
	inner_radius_ring_buffer.write_index = write_index%max_size + 1

	if vortex_data.wanted_inner_radius ~= minimum_inner_radius then
		local wanted_fx_radius_p = minimum_inner_radius/vortex_template.full_inner_radius
		local wanted_fx_radius = math.max(vortex_template.full_fx_radius*wanted_fx_radius_p, vortex_template.min_fx_radius)
		vortex_data.wanted_fx_radius = wanted_fx_radius
		vortex_data.wanted_inner_radius = minimum_inner_radius
		vortex_data.start_lerp_inner_radius = current_inner_radius
		vortex_data.start_lerp_fx_radius = current_fx_radius
	end

	local wanted_inner_radius = vortex_data.wanted_inner_radius

	if wanted_inner_radius < current_inner_radius then
		vortex_data.inner_radius = wanted_inner_radius
	elseif current_inner_radius < wanted_inner_radius then
		local start_lerp_inner_radius = vortex_data.start_lerp_inner_radius
		local current_lerp_value = math.abs(current_inner_radius - start_lerp_inner_radius)/math.abs(wanted_inner_radius - start_lerp_inner_radius)
		local new_lerp_value = math.clamp(current_lerp_value + dt*INCREASE_RADIUS_LERP_PROGRESS_PER_SECOND, 0, 1)
		vortex_data.inner_radius = math.lerp(start_lerp_inner_radius, wanted_inner_radius, new_lerp_value)
	end

	local wanted_fx_radius = vortex_data.wanted_fx_radius

	if wanted_fx_radius ~= current_fx_radius then
		local start_lerp_fx_radius = vortex_data.start_lerp_fx_radius
		local current_lerp_value = math.abs(current_fx_radius - start_lerp_fx_radius)/math.abs(wanted_fx_radius - start_lerp_fx_radius)
		local lerp_constant = (current_fx_radius < wanted_fx_radius and INCREASE_RADIUS_LERP_PROGRESS_PER_SECOND) or DECREASE_RADIUS_LERP_PROGRESS_PER_SECOND
		local new_lerp_value = math.clamp(current_lerp_value + dt*lerp_constant, 0, 1)
		vortex_data.fx_radius = math.lerp(start_lerp_fx_radius, wanted_fx_radius, new_lerp_value)
	end

	local inner_radius_p = vortex_data.inner_radius/vortex_template.full_inner_radius
	vortex_data.outer_radius = math.max(vortex_template.min_outer_radius, vortex_template.full_outer_radius*inner_radius_p)

	if script_data.debug_vortex then
		local debug_ray_color = (success and Colors.get("white")) or Colors.get("red")
		local debug_new_inner_radius = vortex_data.inner_radius

		QuickDrawer:line(unit_position, hit_position, debug_ray_color)
		QuickDrawer:circle(unit_position, debug_new_inner_radius, Vector3.up(), Colors.get("pink"))

		if debug_new_inner_radius ~= wanted_inner_radius then
			QuickDrawer:circle(unit_position, wanted_inner_radius, Vector3.up(), Colors.get("purple"))
		end
	end

	return 
end
VortexExtension.control_size = function (self, unit, t, dt, nav_world, traverse_logic, vortex_template, vortex_data)
	vortex_data.current_raycast_rad = math.fmod(vortex_data.current_raycast_rad + RAYCAST_INVERAL_RAD, math.pi*2)

	self._update_radius(self, unit, t, dt, nav_world, traverse_logic, vortex_template, vortex_data)
	self._update_height(self, unit, t, dt, vortex_template, vortex_data)

	local game = Managers.state.network:game()
	local go_id = Managers.state.unit_storage:go_id(unit)

	if game and go_id then
		local inner_radius_p = vortex_data.inner_radius/vortex_template.full_inner_radius
		local fx_radius_p = vortex_data.fx_radius/vortex_template.full_fx_radius
		local height_p = vortex_data.height/vortex_template.max_height

		GameSession.set_game_object_field(game, go_id, "inner_radius_percentage", inner_radius_p)
		GameSession.set_game_object_field(game, go_id, "fx_radius_percentage", fx_radius_p)
		GameSession.set_game_object_field(game, go_id, "height_percentage", height_p)
	end

	return vortex_data.inner_radius, vortex_data.outer_radius, vortex_data.fx_radius
end
local NUM_SEGMENTS = 4
local EJECT_SEGMENT_LIST = Script.new_array(NUM_SEGMENTS)
VortexExtension._update_attract_players = function (self, unit, blackboard, vortex_data, vortex_template, t, center_pos, minimum_height_diff, inner_radius, outer_radius, falloff_radius, allowed_distance)
	local nav_world = blackboard.nav_world
	local physics_world = vortex_data.physics_world
	local vortex_height = vortex_data.height
	local players_inside = vortex_data.players_inside
	local players_ejected = vortex_data.players_ejected
	local player_eject_speed = vortex_template.player_eject_speed
	local player_attract_speed = vortex_template.player_attract_speed
	local eject_distance = vortex_template.player_eject_distance
	local player_gravity = PlayerUnitMovementSettings.gravity_acceleration
	local player_collision_filter = "filter_player_mover"
	local land_test_above = 15
	local land_test_below = 15
	local epsilon_up = Vector3.up()*0.05
	local near_vortex_distance = outer_radius + 2
	local num_player_and_bots = #player_and_bot_units

	for i = 1, num_player_and_bots, 1 do
		local player_unit = player_and_bot_units[i]
		local target_status_extension = ScriptUnit.extension(player_unit, "status_system")
		local valid_vortex_target = target_status_extension.is_valid_vortex_target(target_status_extension)
		local locomotion_extension = ScriptUnit.extension(player_unit, "locomotion_system")
		local player_position = position_lookup[player_unit]
		local suck_dir = center_pos - player_position
		local height = -suck_dir.z

		Vector3.set_z(suck_dir, 0)

		local player_distance = Vector3.length(suck_dir)

		if not target_status_extension.near_vortex and player_distance < near_vortex_distance then
			StatusUtils.set_near_vortex_network(player_unit, true, unit)
		elseif target_status_extension.near_vortex_unit == unit and near_vortex_distance <= player_distance then
			StatusUtils.set_near_vortex_network(player_unit, false)
		end

		if players_inside[player_unit] then
			local vortex_eject_height = players_inside[player_unit].vortex_eject_height
			local vortex_eject_time = players_inside[player_unit].vortex_eject_time
			local mover = Unit.mover(player_unit)
			local side_collides = Mover.collides_sides(mover)

			if side_collides then
				if not target_status_extension.smacked_into_wall then
					target_status_extension.smacked_into_wall = t + 0.7
					local player_velocity = locomotion_extension.current_velocity(locomotion_extension)
					local player_velocity_normalized = Vector3.normalize(player_velocity)
					local breed_name = blackboard.breed.name
					local impact_damage = DamageUtils.calculate_damage(vortex_template.damage, player_unit, unit)

					DamageUtils.add_damage_network(player_unit, unit, impact_damage, "torso", "cutting", -player_velocity_normalized, breed_name, nil, nil, nil, vortex_template.hit_react_type)
				end
			elseif target_status_extension.smacked_into_wall and target_status_extension.smacked_into_wall < t then
				target_status_extension.smacked_into_wall = false
			end

			if not valid_vortex_target or allowed_distance < player_distance then
				StatusUtils.set_in_vortex_network(player_unit, false, nil)

				players_inside[player_unit] = nil
				vortex_data.num_players_inside = vortex_data.num_players_inside - 1
			elseif vortex_eject_height < height or vortex_height < height or vortex_eject_time < t then
				local current_velocity = locomotion_extension.current_velocity(locomotion_extension)
				local velocity_normalized = Vector3.normalize(current_velocity)
				local wanted_landing_position = LocomotionUtils.pos_on_mesh(nav_world, player_position + velocity_normalized*eject_distance, land_test_above, land_test_below)

				if wanted_landing_position then
					local success, velocity = WeaponHelper.test_angled_trajectory(physics_world, player_position, wanted_landing_position + epsilon_up, -player_gravity, player_eject_speed, nil, EJECT_SEGMENT_LIST, NUM_SEGMENTS, player_collision_filter)

					if success then
						StatusUtils.set_in_vortex_network(player_unit, false, nil)
						StatusUtils.set_catapulted_network(player_unit, true, velocity)

						players_inside[player_unit] = nil
						players_ejected[player_unit] = -1
						vortex_data.num_players_inside = vortex_data.num_players_inside - 1
					end
				end
			end
		elseif players_ejected[player_unit] then
			local bliss_time = players_ejected[player_unit]

			if bliss_time < 0 then
				if not target_status_extension.is_catapulted(target_status_extension) then
					if player_distance < outer_radius then
						local edge_distance = outer_radius - player_distance
						local time_multiplier = edge_distance/outer_radius
						players_ejected[player_unit] = t + 0.5 + vortex_template.player_ejected_bliss_time*0.5 + vortex_template.player_ejected_bliss_time*time_multiplier*0.5
					else
						players_ejected[player_unit] = t + 0.5 + vortex_template.player_ejected_bliss_time
					end
				end
			elseif bliss_time < t then
				players_ejected[player_unit] = nil
			end
		elseif valid_vortex_target and not target_status_extension.is_in_vortex(target_status_extension) and player_distance < outer_radius and minimum_height_diff <= height and height < vortex_height then
			if inner_radius < player_distance then
				local distance_to_inner_radius = player_distance - inner_radius
				local k = math.clamp(distance_to_inner_radius/falloff_radius - 1, 0, 1)
				local speed = player_attract_speed*k*k
				local dir = Vector3.normalize(suck_dir)

				locomotion_extension.add_external_velocity(locomotion_extension, dir*speed)
			else
				StatusUtils.set_in_vortex_network(player_unit, true, unit)

				local vortex_eject_height = ConflictUtils.random_interval(vortex_template.player_eject_height)
				players_inside[player_unit] = {
					vortex_eject_height = vortex_eject_height,
					vortex_eject_time = t + vortex_template.player_in_vortex_max_duration
				}
				vortex_data.num_players_inside = vortex_data.num_players_inside + 1
			end
		end
	end

	return 
end
local ai_units = {}
VortexExtension._update_attract_outside_ai = function (self, vortex_data, vortex_template, center_pos, minimum_height_diff, inner_radius, outer_radius, falloff_radius)
	local vortex_height = vortex_data.height
	local ai_attract_speed = vortex_template.ai_attract_speed
	local ai_units_inside = vortex_data.ai_units_inside
	local num_ai_units = AiUtils.broadphase_query(center_pos, outer_radius, ai_units)

	for i = 1, num_ai_units, 1 do
		local ai_unit = ai_units[i]

		if not ai_units_inside[ai_unit] then
			local target_blackboard = BLACKBOARDS[ai_unit]

			if target_blackboard.breed.vortexable then
				local locomotion_extension = target_blackboard.locomotion_extension
				local is_alive = AiUtils.unit_alive(ai_unit)

				if locomotion_extension and is_alive then
					local unit_position = position_lookup[ai_unit]
					local suck_dir = center_pos - unit_position
					local height = -suck_dir.z

					Vector3.set_z(suck_dir, 0)

					if minimum_height_diff <= height and height < vortex_height then
						local ai_distance = Vector3.length(suck_dir)

						if inner_radius < ai_distance then
							local distance_to_inner_radius = ai_distance - inner_radius
							local k = math.clamp(distance_to_inner_radius/falloff_radius - 1, 0, 1)
							local speed = ai_attract_speed*k*k
							local dir = Vector3.normalize(suck_dir)
							local velocity = dir*speed

							locomotion_extension.set_external_velocity(locomotion_extension, velocity)
						else
							target_blackboard.in_vortex_state = "in_vortex"
							target_blackboard.in_vortex = true
							target_blackboard.eject_height = ConflictUtils.random_interval(vortex_template.ai_eject_height)
							ai_units_inside[ai_unit] = true
						end
					end
				end
			end
		end
	end

	return 
end
VortexExtension._update_attract_inside_ai = function (self, blackboard, vortex_data, vortex_template, dt, center_pos, inner_radius, allowed_distance)
	local ai_rotation_speed = vortex_template.ai_rotation_speed
	local ai_radius_change_speed = vortex_template.ai_radius_change_speed
	local ai_ascension_speed = vortex_template.ai_ascension_speed
	local ai_wanted_distance = inner_radius
	local vortex_height = vortex_data.height
	local up_direction = Vector3.up()
	local ai_units_inside = vortex_data.ai_units_inside

	for ai_unit, _ in pairs(ai_units_inside) do
		local is_alive = AiUtils.unit_alive(ai_unit)

		if is_alive then
			local target_blackboard = BLACKBOARDS[ai_unit]

			if target_blackboard.in_vortex_state == "in_vortex" then
				local unit_position = position_lookup[ai_unit]
				local velocity, new_radius, new_height = LocomotionUtils.get_vortex_spin_velocity(unit_position, center_pos, ai_wanted_distance, up_direction, ai_rotation_speed, ai_radius_change_speed, ai_ascension_speed, dt)
				local locomotion_extension = target_blackboard.locomotion_extension

				locomotion_extension.set_wanted_velocity(locomotion_extension, velocity)

				if target_blackboard.eject_height < new_height or vortex_height < new_height or allowed_distance < new_radius then
					local ejected_from_vortex = target_blackboard.ejected_from_vortex or Vector3Box()

					ejected_from_vortex.store(ejected_from_vortex, velocity)

					target_blackboard.ejected_from_vortex = ejected_from_vortex
					target_blackboard.in_vortex_state = "ejected_from_vortex"

					AiUtils.aggro_unit_of_enemy(ai_unit, blackboard.target_unit)
					locomotion_extension.set_affected_by_gravity(locomotion_extension, true)
					locomotion_extension.set_movement_type(locomotion_extension, "constrained_by_mover")
				end
			elseif target_blackboard.in_vortex_state == "landed" then
				ai_units_inside[ai_unit] = nil
			end
		else
			ai_units_inside[ai_unit] = nil
		end
	end

	return 
end
VortexExtension.attract = function (self, unit, t, dt, blackboard, vortex_template, vortex_data, center_pos, inner_radius, outer_radius)
	local minimum_height_diff = -0.5
	local falloff_radius = outer_radius - inner_radius
	local max_allowed_inner_radius_dist = vortex_template.max_allowed_inner_radius_dist
	local allowed_distance = inner_radius + max_allowed_inner_radius_dist

	self._update_attract_players(self, unit, blackboard, vortex_data, vortex_template, t, center_pos, minimum_height_diff, inner_radius, outer_radius, falloff_radius, allowed_distance)
	self._update_attract_outside_ai(self, vortex_data, vortex_template, center_pos, minimum_height_diff, inner_radius, outer_radius, falloff_radius)
	self._update_attract_inside_ai(self, blackboard, vortex_data, vortex_template, dt, center_pos, inner_radius, allowed_distance)

	return 
end
VortexExtension.is_position_inside = function (self, position, min_allowed_distance)
	local blackboard = self.blackboard
	local vortex_data = blackboard.vortex_data
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
VortexExtension.debug_render_vortex = function (self, t, dt, pos, fx_radius, inner_radius, outer_radius, spin_speed, height)
	fx_radius = fx_radius + math.sin(t*1.7)*0.4
	local step = (math.pi*2)/6
	local col_delta = math.floor(spiral_segments/155)
	local height_step = height/spiral_segments

	for j = 1, spiral_lines, 1 do
		local alpha = (j*2*math.pi)/spiral_lines

		for i = 1, spiral_segments, 1 do
			local r = fx_radius + (i*i*0.5)/spiral_segments
			local v = t*spin_speed + i*step + alpha
			spiral[i] = Vector3(math.sin(v)*r, math.cos(v)*r, (i - 1)*height_step)
		end

		local r = fx_radius + math.sin(t)*0.2
		local v = t*spin_speed + alpha + step*0
		local pos1 = Vector3(math.sin(v)*r, math.cos(v)*r, 0)

		QuickDrawer:sphere(pos + pos1, (math.sin(v*3) + 1)/3, Color(155, 255, 155))

		for i = 1, spiral_segments, 1 do
			local pos2 = spiral[i]
			local color = Color(col_delta*i - 155, col_delta*i - 255, col_delta*i - 155)

			QuickDrawer:line(pos + pos1, pos + pos2, color)

			pos1 = pos2
		end
	end

	QuickDrawer:circle(pos, inner_radius, Vector3.up(), Colors.get("pink"))
	QuickDrawer:circle(pos, outer_radius, Vector3.up(), Colors.get("lime_green"))

	return 
end

return 

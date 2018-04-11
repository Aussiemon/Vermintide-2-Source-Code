require("core/gwnav/lua/safe_require")

local NavBot = safe_require_guard()
local NavClass = safe_require("core/gwnav/lua/runtime/navclass")
NavBot = NavClass(NavBot)
local NavDefaultSmartObjectFollower = safe_require("core/gwnav/lua/runtime/navdefaultsmartobjectfollower")
local Math = stingray.Math
local Vector3 = stingray.Vector3
local Vector3Box = stingray.Vector3Box
local Matrix4x4 = stingray.Matrix4x4
local Matrix4x4Box = stingray.Matrix4x4Box
local Quaternion = stingray.Quaternion
local QuaternionBox = stingray.QuaternionBox
local Gui = stingray.Gui
local World = stingray.World
local Unit = stingray.Unit
local Application = stingray.Application
local Color = stingray.Color
local LineObject = stingray.LineObject
local Level = stingray.Level
local Mover = stingray.Mover
local GwNavWorld = stingray.GwNavWorld
local GwNavBot = stingray.GwNavBot
local GwNavSmartObjectInterval = stingray.GwNavSmartObjectInterval
local GwNavQueries = stingray.GwNavQueries
local GwNavAStar = stingray.GwNavAStar
local GwNavSmartObject = stingray.GwNavSmartObject
local GwNavTagVolume = stingray.GwNavTagVolume
local GwNavBoxObstacle = stingray.GwNavBoxObstacle
local GwNavCylinderObstacle = stingray.GwNavCylinderObstacle
local GwNavGraph = stingray.GwNavGraph
local GwNavTraversal = stingray.GwNavTraversal
local _navbots = {}
NavBot.get_navbot = function (navbot_unit)
	return _navbots[navbot_unit]
end
NavBot.init = function (self, navworld, unit, config)
	self.navworld = navworld
	self.unit = unit
	self.config = config
	_navbots[self.unit] = self
	local p = Unit.local_position(self.unit, 1)
	self.route = {}
	self.arrival_distance = 1
	self.smartobjects = navworld.smartobjects
	self.next_smartobject_max_distance = 2
	self.is_smartobject_driven = false
	self.follower = NavDefaultSmartObjectFollower(self)
	self.gwnavbot = GwNavBot.create(navworld.gwnavworld, self.config.height, self.config.radius, self.config.speed, p)
	self.interval = GwNavSmartObjectInterval.create(self.navworld.gwnavworld)

	config.configure_bot(config, self)

	self.destination = Vector3Box(p)
	self.has_destination = false
	self.target_route_vertex = 1
	self.moving = false

	navworld.add_bot(navworld, self)

	return 
end
NavBot.set_use_avoidance = function (self, use_avoidance)
	GwNavBot.set_use_avoidance(self.gwnavbot, use_avoidance)

	return 
end
NavBot.set_navtag_layer_cost_table = function (self, navtag_layer_cost_table)
	GwNavBot.set_navtag_layer_cost_table(self.gwnavbot, navtag_layer_cost_table)

	return 
end
NavBot.set_use_channel = function (self, use_channel)
	GwNavBot.set_use_channel(self.gwnavbot, use_channel)

	return 
end
NavBot.get_target_group = function (self)
	return self.config.target_group
end
NavBot.set_destination = function (self, destination)
	if destination == self.destination:unbox() then
		self.on_recompute_path_to_similar_destination_for_crowd_dispersion(self)
	else
		self.on_compute_path_to_brand_new_destination_for_crowd_dispersion(self)
	end

	self.destination:store(destination)
	GwNavBot.compute_new_path(self.gwnavbot, destination)

	self.has_destination = true

	return 
end
NavBot.set_route = function (self, route)
	self.route = route

	return 
end
NavBot.velocity = function (self)
	return GwNavBot.velocity(self.gwnavbot)
end
NavBot.output_velocity = function (self)
	if not self.has_arrived(self) then
		return GwNavBot.output_velocity(self.gwnavbot)
	else
		return Vector3(0, 0, 0)
	end

	return 
end
NavBot.set_layer_cost_multiplier = function (self, layer, cost)
	local layer_cost_table = GwNavBot.navtag_layer_cost_table(self.gwnavbot)

	if layer_cost_table ~= nil then
		GwNavTagLayerCostTable.set_layer_cost_multiplier(layer_cost_table, layer, cost)
	end

	return 
end
NavBot.allow_layer = function (self, layer)
	local layer_cost_table = GwNavBot.navtag_layer_cost_table(self.gwnavbot)

	if layer_cost_table ~= nil then
		GwNavTagLayerCostTable.allow_layer(layer_cost_table, layer)
	end

	return 
end
NavBot.forbid_layer = function (self, layer)
	local layer_cost_table = GwNavBot.navtag_layer_cost_table(self.gwnavbot)

	if layer_cost_table ~= nil then
		GwNavTagLayerCostTable.forbid_layer(layer_cost_table, layer)
	end

	return 
end
NavBot.repath = function (self)
	self.set_destination(self, self.route[self.target_route_vertex + 1]:unbox())

	return 
end
NavBot.force_repath = function (self)
	if self.has_destination == true and self.is_smartobject_driven == false then
		self.repath(self)
	end

	return 
end
NavBot.set_avoidance_computer_config = function (self, angle_span, minimal_time_to_collision, sample_count)
	GwNavBot.set_avoidance_computer_configuration(self.gwnavbot, angle_span, minimal_time_to_collision, sample_count)

	return 
end
NavBot.set_avoidance_collider_collector_config = function (self, half_height, radius, frame_delay)
	GwNavBot.set_avoidance_collider_collector_configuration(self.gwnavbot, half_height, radius, frame_delay)

	return 
end
NavBot.set_avoidance_behavior = function (self, enable_slowing_down, enable_force_passage, enable_stop, stop_wait_time_s, force_passage_time_limit_s, wait_passage_time_limit_s)
	GwNavBot.set_avoidance_behavior(self.gwnavbot, enable_slowing_down, enable_force_passage, enable_stop, stop_wait_time_s, force_passage_time_limit_s, wait_passage_time_limit_s)

	return 
end
NavBot.set_channel_config = function (self, channel_radius, turn_sampling_angle, channel_smoothing_angle, min_distance_between_gates, max_distance_between_gates)
	GwNavBot.set_channel_computer_configuration(self.gwnavbot, channel_radius, turn_sampling_angle, channel_smoothing_angle, min_distance_between_gates, max_distance_between_gates)

	return 
end
NavBot.set_spline_trajectory_config = function (self, animation_driven, max_distance_to_spline_position, spline_length, spline_distance_to_borders, spline_recomputation_distance, target_on_spline_distance)
	GwNavBot.set_spline_trajectory_configuration(self.gwnavbot, animation_driven, max_distance_to_spline_position, spline_length, spline_distance_to_borders, spline_recomputation_distance, target_on_spline_distance)

	return 
end
NavBot.set_propagation_box = function (self, propagation_box_extent)
	GwNavBot.set_propagation_box(self.gwnavbot, propagation_box_extent)

	return 
end
NavBot.set_outside_navmesh_distance = function (self, from_outside_navmesh_distance, to_outside_navmesh_distance)
	GwNavBot.set_outside_navmesh_distance(self.gwnavbot, from_outside_navmesh_distance, to_outside_navmesh_distance)

	return 
end
NavBot.visual_debug_draw_line = function (self, displayListName, groupName, line_start, line_end, color, enabledByDefault)
	return 
end
NavBot.get_remaining_distance_from_progress_to_end_of_path = function (self)
	return GwNavBot.get_remaining_distance_from_progress_to_end_of_path(self.gwnavbot)
end
NavBot.shutdown = function (self)
	self.navworld:remove_bot(self)
	GwNavSmartObjectInterval.destroy(self.interval)
	GwNavBot.destroy(self.gwnavbot)

	self.gwnavworld = nil
	self.gwnavbot = nil
	self.interval = nil
	self.route = {}
	_navbots[self.unit] = nil

	return 
end
NavBot.update_crowd_dispersion = function (self)
	local crowd_dispersion_action = GwNavBot.update_logic_for_crowd_dispersion(self.gwnavbot)

	if crowd_dispersion_action == 1 then
		if not GwNavBot.is_computing_path(self.gwnavbot) then
			self.next_route_index(self)
			self.set_destination(self, self.route[self.target_route_vertex]:unbox())
		end
	elseif crowd_dispersion_action == 2 and GwNavBot.is_computing_path(self.gwnavbot) then
		print("self:cancel()")
	end

	return 
end
NavBot.on_recompute_path_to_similar_destination_for_crowd_dispersion = function (self)
	GwNavBot.on_recompute_path_to_similar_destination_for_crowd_dispersion(self.gwnavbot)

	return 
end
NavBot.on_compute_path_to_brand_new_destination_for_crowd_dispersion = function (self)
	GwNavBot.on_compute_path_to_brand_new_destination_for_crowd_dispersion(self.gwnavbot)

	return 
end
NavBot.next_route_index = function (self)
	self.target_route_vertex = math.max((self.target_route_vertex + 1) % (table.getn(self.route) + 1), 1)

	return 
end
NavBot.update_route = function (self)
	local route_point_count = table.getn(self.route)

	if route_point_count == 0 then
		return 
	end

	if not GwNavBot.is_computing_new_path(self.gwnavbot) and GwNavBot.is_path_recomputation_needed(self.gwnavbot) then
		self.set_destination(self, self.route[self.target_route_vertex]:unbox())
	end

	if self.has_destination == false then
		self.next_route_index(self)
		self.set_destination(self, self.route[self.target_route_vertex]:unbox())
	end

	if self.has_arrived(self) then
		if route_point_count == 1 then
			self.has_destination = false
			self.route = {}
		else
			self.next_route_index(self)
			self.set_destination(self, self.route[self.target_route_vertex]:unbox())
		end
	end

	return 
end
NavBot.has_arrived = function (self)
	return Vector3.distance(self.get_position(self), self.destination:unbox()) < self.arrival_distance
end
NavBot.visual_debug_next_smartobject = function (self, entrance_pos, entrance_is_at_bot_progress_on_path, exit_pos, exit_is_at_the_end_of_path)
	self.visual_debug_draw_line(self, "next_smart_object", "stingray", entrance_pos, exit_pos, Color(0, 255, 0, 0), true)

	if entrance_is_at_bot_progress_on_path == true then
		self.visual_debug_draw_line(self, "next_smart_object", "stingray", entrance_pos, entrance_pos + Vector3(0, 0, 3), Color(255, 100, 20, 0), true)
	else
		self.visual_debug_draw_line(self, "next_smart_object", "stingray", entrance_pos, entrance_pos + Vector3(0, 0, 3), Color(0, 255, 0, 0), true)
	end

	if exit_is_at_the_end_of_path == true then
		self.visual_debug_draw_line(self, "next_smart_object", "stingray", exit_pos, exit_pos + Vector3(0, 0, 3), Color(255, 100, 20, 0), true)
	else
		self.visual_debug_draw_line(self, "next_smart_object", "stingray", exit_pos, exit_pos + Vector3(0, 0, 3), Color(0, 255, 0, 0), true)
	end

	return 
end
NavBot.update_next_smartobject = function (self)
	if GwNavBot.current_or_next_smartobject_interval(self.gwnavbot, self.interval, self.next_smartobject_max_distance) == false then
		return 
	end

	local entrance_pos, entrance_is_at_bot_progress_on_path = GwNavSmartObjectInterval.entrance_position(self.interval)
	local exit_pos, exit_is_at_the_end_of_path = GwNavSmartObjectInterval.exit_position(self.interval)

	self.visual_debug_next_smartobject(self, entrance_pos, entrance_is_at_bot_progress_on_path, exit_pos, exit_is_at_the_end_of_path)
	self.follower:handle_next_smartobject(self.get_position(self), self.interval, entrance_pos, entrance_is_at_bot_progress_on_path, exit_pos, exit_is_at_the_end_of_path)

	return 
end
NavBot.verbose_smartobject_management = function (self, botpos, next_smartobject_interval, entrance_is_at_bot_progress_on_path, exit_is_at_the_end_of_path, entrance_pos, approachingDistance)
	if entrance_is_at_bot_progress_on_path == true then
		local smartobject_type = self.follower:get_smartobject_type(next_smartobject_interval)

		print("Inside smartobject", smartobject_type)

		if exit_is_at_the_end_of_path == true then
			print("End of path is inside this smartobject")
		end
	elseif Vector3.distance(entrance_pos, botpos) < approachingDistance then
		local smartobject_type = self.follower:get_smartobject_type(next_smartobject_interval)

		print("Approaching smartobject", smartobject_type)

		if exit_is_at_the_end_of_path == true then
			print("End of path is inside this smartobject")
		end
	end

	return 
end
NavBot.update = function (self, dt)
	self.update_next_smartobject(self)
	self.update_crowd_dispersion(self)
	self.update_route(self)

	if self.is_smartobject_driven == true then
		self.follower:update_follow(dt)
	end

	if self.custom_update then
		self.custom_update(self, dt)
	end

	if not GwNavBot.is_computing_new_path(self.gwnavbot) and GwNavBot.is_path_recomputation_needed(self.gwnavbot) then
		self.set_destination(self, self.destination:unbox())
	end

	GwNavBot.update_position(self.gwnavbot, self.get_position(self), dt)

	return 
end
NavBot.get_position = function (self)
	return Unit.local_position(self.unit, 1)
end
NavBot.debug_draw = function (self, line)
	if line == nil then
		return 
	end

	local transform = Unit.local_pose(self.unit, 1)
	local pos = Matrix4x4.translation(transform)

	LineObject.add_line(line, Color(255, 0, 0, 255), pos, pos + Matrix4x4.x(transform))
	LineObject.add_line(line, Color(255, 0, 255, 0), pos, pos + Matrix4x4.y(transform))
	LineObject.add_line(line, Color(255, 255, 0, 0), pos, pos + Matrix4x4.z(transform))

	return 
end
NavBot.compute_height_on_navmesh = function (self, pos)
	local altitude, tA, tB, tC = GwNavQueries.triangle_from_position(self.navworld.gwnavworld, pos)

	if altitude ~= nil then
		pos[3] = altitude
	end

	return pos
end
NavBot.update_pose = function (self, forward, translation)
	local pose = Unit.local_pose(self.unit, 1)

	if Vector3.length(forward) ~= 0 then
		Matrix4x4.set_forward(pose, forward)
		Matrix4x4.set_right(pose, Vector3.cross(forward, Matrix4x4.up(pose)))
	end

	Matrix4x4.set_translation(pose, translation)
	Unit.set_local_pose(self.unit, 1, pose)

	return 
end
NavBot.move_unit = function (self, dt)
	if self.is_smartobject_driven == false then
		local output_velocity = GwNavBot.output_velocity(self.gwnavbot)

		self.update_pose(self, Vector3.normalize(output_velocity), GwNavBot.compute_move_on_navmesh(self.gwnavbot, dt, output_velocity))
	else
		self.follower:move_unit(dt)
	end

	GwNavBot.update_position(self.gwnavbot, self.get_position(self), dt)

	return 
end
NavBot.animation_wanted_delta = function (self)
	if Unit.has_animation_state_machine(self.unit) and Unit.animation_root_mode(self.unit) == "ignore" then
		return Vector3.length(Matrix4x4.translation(Unit.animation_wanted_root_pose(self.unit)) - Unit.local_position(self.unit, 1))
	end

	return nil
end
NavBot.move_unit_with_mover = function (self, dt, gravity)
	if self.is_smartobject_driven == false then
		local mover = Unit.mover(self.unit)

		if mover == nil then
			return 
		end

		local output_velocity = GwNavBot.output_velocity(self.gwnavbot)
		local v = output_velocity * dt
		v.z = v.z - dt * gravity

		Mover.move(mover, v, dt)
		self.update_pose(self, Vector3.normalize(output_velocity), Mover.position(mover))
	else
		self.follower:move_unit_with_mover(dt, mover)
	end

	GwNavBot.update_position(self.gwnavbot, self.get_position(self), dt)

	return 
end

return NavBot

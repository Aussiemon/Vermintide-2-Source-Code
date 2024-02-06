-- chunkname: @scripts/unit_extensions/level/big_boy_destructible_extension.lua

BigBoyDestructibleExtension = class(BigBoyDestructibleExtension)

local SIMPLE_ANIMATION_FPS = 30
local NAVMESH_UPDATE_DELAY = 3
local unit_alive = Unit.alive

BigBoyDestructibleExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.unit = unit
	self.world = extension_init_context.world
	self.is_server = Managers.player.is_server

	local move_to_exit_when_opened = Unit.get_data(unit, "move_to_exit_when_opened")

	self.move_to_exit_when_opened = move_to_exit_when_opened == nil or move_to_exit_when_opened

	local door_state = Unit.get_data(unit, "door_state")

	self.current_state = door_state == 0 and "open_forward" or door_state == 1 and "closed" or door_state == 2 and "open_backward"
	self.state_to_nav_obstacle_map = {}
	self.animation_stop_time = 0
	self.dead = false
	self.breeds_failed_leaving_smart_object = {}
	self.frames_since_obstacle_update = nil
	self.num_attackers = 0
end

BigBoyDestructibleExtension.extensions_ready = function (self)
	self.health_extension = ScriptUnit.extension(self.unit, "health_system")
end

BigBoyDestructibleExtension.animation_played = function (self, frames, speed)
	local animation_length = frames / SIMPLE_ANIMATION_FPS / speed
	local t = Managers.time:time("game")

	self.animation_stop_time = t + animation_length
end

BigBoyDestructibleExtension.update_nav_obstacles = function (self)
	local current_state = self.current_state
	local obstacles = self.state_to_nav_obstacle_map

	if not obstacles[current_state] then
		local unit = self.unit
		local nav_world = GLOBAL_AI_NAVWORLD
		local obstacle, transform = NavigationUtils.create_exclusive_box_obstacle_from_unit_data(nav_world, unit)

		GwNavBoxObstacle.add_to_world(obstacle)
		GwNavBoxObstacle.set_transform(obstacle, transform)

		obstacles[current_state] = obstacle
	end

	for obstacle_state, obstacle in pairs(obstacles) do
		local does_trigger = obstacle_state == current_state

		GwNavBoxObstacle.set_does_trigger_tagvolume(obstacle, does_trigger)
	end

	self.frames_since_obstacle_update = 0
end

BigBoyDestructibleExtension._get_animation_flow_event = function (self, current_state, new_state)
	local event = self.animation_flow_events[current_state][new_state]

	fassert(event, "Door animation event from %s to %s unavailable", current_state, new_state)

	return event
end

BigBoyDestructibleExtension.update_nav_graphs = function (self)
	local unit = self.unit
	local nav_graph_system = Managers.state.entity:system("nav_graph_system")

	if self:is_open() or self.dead then
		nav_graph_system:remove_nav_graph(unit)
	else
		nav_graph_system:add_nav_graph(unit)
	end
end

BigBoyDestructibleExtension.update = function (self, unit, input, dt, context, t)
	local frames_since_obstacle_update = self.frames_since_obstacle_update

	if frames_since_obstacle_update then
		frames_since_obstacle_update = frames_since_obstacle_update + 1

		if frames_since_obstacle_update == NAVMESH_UPDATE_DELAY then
			self:update_nav_graphs()
			self:handle_breeds_failed_leaving_smart_object()

			self.frames_since_obstacle_update = nil
		else
			self.frames_since_obstacle_update = frames_since_obstacle_update
		end
	end

	if self.dead then
		return
	end

	local animation_stop_time = self.animation_stop_time

	if animation_stop_time and animation_stop_time <= t then
		self:update_nav_obstacles()

		self.animation_stop_time = nil
	end

	if not self.health_extension:is_alive() then
		self.dead = true

		self:destroy_box_obstacles()
	end
end

BigBoyDestructibleExtension.register_breed_failed_leaving_smart_object = function (self, unit)
	if self.breeds_failed_leaving_smart_object == nil then
		return
	end

	self.breeds_failed_leaving_smart_object[unit] = true
end

BigBoyDestructibleExtension.handle_breeds_failed_leaving_smart_object = function (self)
	if self.breeds_failed_leaving_smart_object == nil then
		return
	end

	for unit, _ in pairs(self.breeds_failed_leaving_smart_object) do
		if unit_alive(unit) then
			local navigation_extension = ScriptUnit.has_extension(unit, "ai_navigation_system")

			if navigation_extension then
				navigation_extension:reset_destination()
			end
		end
	end

	self.breeds_failed_leaving_smart_object = {}
end

BigBoyDestructibleExtension.destroy = function (self)
	self:destroy_box_obstacles()

	self.unit = nil
	self.world = nil
	self.health_extension = nil
	self.breeds_failed_leaving_smart_object = nil
end

BigBoyDestructibleExtension.destroy_box_obstacles = function (self)
	if self.state_to_nav_obstacle_map then
		for _, obstacle in pairs(self.state_to_nav_obstacle_map) do
			GwNavBoxObstacle.destroy(obstacle)
		end

		self.state_to_nav_obstacle_map = nil
	end

	self.frames_since_obstacle_update = 0
end

BigBoyDestructibleExtension.is_open = function (self)
	return self.dead
end

BigBoyDestructibleExtension.is_opening = function (self)
	return false
end

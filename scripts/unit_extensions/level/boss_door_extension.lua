BossDoorExtension = class(BossDoorExtension)
local SIMPLE_ANIMATION_FPS = 30
local NAVMESH_UPDATE_DELAY = 3
local flow_event_by_breed = {
	chaos_troll = "lua_closed_troll",
	skaven_stormfiend = "lua_closed_stormfiend"
}

BossDoorExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local world = extension_init_context.world
	self.unit = unit
	self.world = world
	self.is_server = Managers.player.is_server
	self.current_state = "open"
	self.state_to_nav_obstacle_map = {}
	self.ignore_umbra = not World.umbra_available(world)
	self.breeds_failed_leaving_smart_object = {}
	self.num_attackers = 0
	self.animation_stop_time = 0
end

BossDoorExtension.extensions_ready = function (self)
	return
end

BossDoorExtension.update_nav_obstacles = function (self)
	local current_state = self.current_state
	local obstacles = self.state_to_nav_obstacle_map

	for obstacle_state, obstacle in pairs(obstacles) do
		local does_trigger = obstacle_state == current_state

		GwNavBoxObstacle.set_does_trigger_tagvolume(obstacle, does_trigger)
	end
end

BossDoorExtension.set_door_state = function (self, new_state, breed_name)
	local current_state = self.current_state

	if current_state == new_state then
		return
	end

	local unit = self.unit
	local state_flow_event = (new_state == "closed" and "lua_close") or "lua_open"

	Unit.flow_event(unit, state_flow_event)

	local effect_flow_event = flow_event_by_breed[breed_name]

	if effect_flow_event then
		Unit.flow_event(unit, effect_flow_event)
	end

	local closed = new_state == "closed"
	self.current_state = new_state
	self.breed_name = breed_name
end

BossDoorExtension.get_current_state = function (self)
	return self.current_state
end

BossDoorExtension.update = function (self, unit, input, dt, context, t)
	local animation_stop_time = self.animation_stop_time

	if animation_stop_time and animation_stop_time <= t then
		self:update_nav_obstacles()

		self.animation_stop_time = nil
	end
end

BossDoorExtension.hot_join_sync = function (self, sender)
	local level = LevelHelper:current_level(self.world)
	local level_index = Level.unit_index(level, self.unit)
	local door_state = self.current_state
	local door_state_id = NetworkLookup.door_states[door_state]
	local breed_name = self.breed_name or "n/a"
	local breed_id = NetworkLookup.breeds[breed_name]

	RPC.rpc_sync_boss_door_state(sender, level_index, door_state_id, breed_id)
end

BossDoorExtension.destroy = function (self)
	self:destroy_box_obstacles()

	self.unit = nil
	self.world = nil
end

BossDoorExtension.destroy_box_obstacles = function (self)
	if self.state_to_nav_obstacle_map then
		for _, obstacle in pairs(self.state_to_nav_obstacle_map) do
			GwNavBoxObstacle.destroy(obstacle)
		end

		self.state_to_nav_obstacle_map = nil
	end
end

BossDoorExtension.animation_played = function (self, frames, speed)
	local animation_length = frames / SIMPLE_ANIMATION_FPS / speed
	local t = Managers.time:time("game")
	self.animation_stop_time = t + animation_length
end

BossDoorExtension.is_open = function (self)
	return self.current_state == "open"
end

return

SimpleDoorExtension = class(SimpleDoorExtension)
local SIMPLE_ANIMATION_FPS = 30
local unit_alive = Unit.alive
SimpleDoorExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local world = extension_init_context.world
	self.unit = unit
	self.world = world
	self.is_server = Managers.player.is_server
	self.ignore_umbra = not World.umbra_available(world)
	local door_state = Unit.get_data(unit, "door_state")
	self.current_state = (door_state == 0 and "open_forward") or (door_state == 1 and "closed")
	self.animation_stop_time = 0

	return 
end
SimpleDoorExtension.destroy = function (self)
	self.destroy_box_obstacle(self)

	self.unit = nil
	self.world = nil

	return 
end
SimpleDoorExtension.destroy_box_obstacle = function (self)
	local obstacle = self.obstacle

	if obstacle then
		GwNavBoxObstacle.destroy(obstacle)
	end

	return 
end
SimpleDoorExtension.extensions_ready = function (self)
	return 
end
SimpleDoorExtension.interacted_with = function (self, interacting_unit)
	return 
end
SimpleDoorExtension.is_opening = function (self)
	return self.current_state ~= "closed" and self.animation_stop_time
end
SimpleDoorExtension.is_open = function (self)
	return self.current_state ~= "closed"
end
SimpleDoorExtension.get_current_state = function (self)
	return self.current_state
end
SimpleDoorExtension.set_door_state_and_duration = function (self, new_state, frames, speed)
	local current_state = self.current_state

	if current_state == new_state then
		return 
	end

	local unit = self.unit
	local closed = new_state == "closed"

	if not closed and not self.ignore_umbra then
		World.umbra_set_gate_closed(self.world, unit, closed)
	end

	self.current_state = new_state
	local animation_length = frames/SIMPLE_ANIMATION_FPS/speed
	local t = Managers.time:time("game")
	self.animation_stop_time = t + animation_length

	return 
end
SimpleDoorExtension.hot_join_sync = function (self, sender)
	return 
end
SimpleDoorExtension.update_nav_obstacle = function (self)
	local current_state = self.current_state
	local obstacle = self.obstacle

	if obstacle == nil then
		local transform = nil
		local unit = self.unit
		local nav_world = GLOBAL_AI_NAVWORLD
		obstacle, transform = NavigationUtils.create_exclusive_box_obstacle_from_unit_data(nav_world, unit)

		GwNavBoxObstacle.add_to_world(obstacle)
		GwNavBoxObstacle.set_transform(obstacle, transform)

		self.obstacle = obstacle
	end

	does_trigger = current_state == "closed"

	GwNavBoxObstacle.set_does_trigger_tagvolume(obstacle, does_trigger)

	return 
end
SimpleDoorExtension.update = function (self, unit, input, dt, context, t)
	local animation_stop_time = self.animation_stop_time

	if animation_stop_time and animation_stop_time <= t then
		self.update_nav_obstacle(self)

		self.animation_stop_time = nil
		local closed = self.current_state == "closed"

		if closed and not self.ignore_umbra then
			World.umbra_set_gate_closed(self.world, unit, closed)
		end
	end

	return 
end

return 

EntitySystemBag = class()

EntitySystemBag.init = function (self)
	self.systems = {}
	self.num_systems = 0
	self.systems_update = {}
	self.systems_pre_update = {}
	self.systems_post_update = {}
	self.systems_physics_async_update = {}
end

EntitySystemBag.destroy = function (self)
	local systems = self.systems

	for i = 1, #systems, 1 do
		local system = systems[i]

		system:destroy()
		table.clear(system)
	end

	self.systems = nil
	self.systems_update = nil
	self.systems_pre_update = nil
	self.systems_post_update = nil
	self.systems_physics_async_update = nil
end

EntitySystemBag.add_system = function (self, system, block_pre_update, block_post_update)
	self.systems[#self.systems + 1] = system

	if system.update then
		self.systems_update[#self.systems_update + 1] = system
	end

	if system.pre_update and not block_pre_update then
		self.systems_pre_update[#self.systems_pre_update + 1] = system
	end

	if system.post_update and not block_post_update then
		self.systems_post_update[#self.systems_post_update + 1] = system
	end

	if system.physics_async_update then
		self.systems_physics_async_update[#self.systems_physics_async_update + 1] = system
	end
end

local list_name_by_function = {
	pre_update = "systems_pre_update",
	update = "systems_update",
	physics_async_update = "systems_physics_async_update",
	post_update = "systems_post_update"
}

EntitySystemBag.update = function (self, entity_system_update_context, update_function)
	local update_function_list_name = list_name_by_function[update_function]
	local update_list = self[update_function_list_name]
	local t = entity_system_update_context.t

	for i = 1, #update_list, 1 do
		local system = update_list[i]

		Profiler.start(system.NAME)
		system[update_function](system, entity_system_update_context, t)
		Profiler.stop(system.NAME)
	end
end

EntitySystemBag.hot_join_sync = function (self, sender)
	Profiler.start("EntitySystemBag")

	for i, system in ipairs(self.systems) do
		if system.hot_join_sync then
			Profiler.start(system.NAME)
			system:hot_join_sync(sender)
			Profiler.stop(system.NAME)
		end
	end

	Profiler.stop("EntitySystemBag")
end

return

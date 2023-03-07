require("foundation/scripts/util/script_world")

WorldManager = class(WorldManager)

WorldManager.init = function (self)
	self._worlds = {}
	self._disabled_worlds = {}
	self._update_queue = {}
	self._anim_update_callbacks = {}
	self._scene_update_callbacks = {}
	self._queued_worlds_to_release = {}
	self._wwise_worlds = {}
end

WorldManager.create_world = function (self, name, shading_environment, shading_callback, layer, ...)
	fassert(self._worlds[name] == nil, "World %q already exists", name)

	local has_physics_world = true
	local n_varargs = select("#", ...)

	for i = 1, n_varargs do
		if select(i, ...) == Application.DISABLE_PHYSICS then
			has_physics_world = false
		end
	end

	local world = Application.new_world(name, ...)

	World.set_data(world, "name", name)
	World.set_data(world, "layer", layer or 1)
	World.set_data(world, "active", true)
	World.set_data(world, "has_physics_world", has_physics_world)

	if has_physics_world then
		local physics_world = World.physics_world(world)

		World.set_data(world, "physics_world", physics_world)
	end

	if shading_environment then
		ScriptWorld.create_shading_environment(world, shading_environment, shading_callback, "default")
	end

	World.set_data(world, "levels", {})
	World.set_data(world, "viewports", {})
	World.set_data(world, "free_flight_viewports", {})
	World.set_data(world, "render_queue", {})

	self._worlds[name] = world
	self._wwise_worlds[world] = Wwise.wwise_world(world)

	self:_sort_update_queue()

	return world
end

WorldManager.wwise_world = function (self, world)
	return self._wwise_worlds[world]
end

WorldManager.destroy_world = function (self, world_or_name)
	if self.locked then
		self._queued_worlds_to_release[world_or_name] = true

		return
	end

	local name = nil

	if type(world_or_name) == "string" then
		name = world_or_name
	else
		name = World.get_data(world_or_name, "name")
	end

	local world = self._worlds[name]

	if world == nil then
		world = self._disabled_worlds[name]
	end

	assert(world, "World %q doesn't exist", name)

	local free_overlaps = PhysicsWorld.free_overlaps

	if free_overlaps and World.get_data(world, "has_physics_world") then
		local physics_world = World.get_data(world, "physics_world")

		free_overlaps(physics_world)
	end

	Application.release_world(world)

	self._worlds[name] = nil
	self._disabled_worlds[name] = nil
	self._anim_update_callbacks[world] = nil
	self._scene_update_callbacks[world] = nil
	self._wwise_worlds[world] = nil

	self:_sort_update_queue()
end

WorldManager.has_world = function (self, name)
	return self._worlds and self._worlds[name] ~= nil
end

WorldManager.world = function (self, name)
	fassert(self._worlds[name], "World %q doesn't exist", name)

	return self._worlds[name]
end

WorldManager.update = function (self, dt, t)
	self.locked = true

	for _, world in ipairs(self._update_queue) do
		ScriptWorld.update(world, dt, self._anim_update_callbacks[world], self._scene_update_callbacks[world])
	end

	self.locked = false

	for world_or_name, _ in pairs(self._queued_worlds_to_release) do
		self:destroy_world(world_or_name)

		self._queued_worlds_to_release[world_or_name] = nil
	end
end

WorldManager.render = function (self)
	for _, world in ipairs(self._update_queue) do
		ScriptWorld.render(world)
	end
end

WorldManager.enable_world = function (self, name, enabled)
	if enabled then
		local world = self._disabled_worlds[name]

		assert(world, "Tried to enable world %q that wasn't disabled", name)

		self._worlds[name] = world
		self._disabled_worlds[name] = nil
	else
		local world = self._worlds[name]

		assert(world, "Tried to disable world %q that wasn't enabled", name)

		self._disabled_worlds[name] = world
		self._worlds[name] = nil
	end

	self:_sort_update_queue()
end

WorldManager.destroy = function (self)
	for name, _ in pairs(self._worlds) do
		self:destroy_world(name)
	end
end

WorldManager._sort_update_queue = function (self)
	self._update_queue = {}

	for name, world in pairs(self._worlds) do
		self._update_queue[#self._update_queue + 1] = world
	end

	local function comparator(w1, w2)
		return World.get_data(w1, "layer") < World.get_data(w2, "layer")
	end

	table.sort(self._update_queue, comparator)
end

WorldManager.set_anim_update_callback = function (self, world, callback)
	self._anim_update_callbacks[world] = callback
end

WorldManager.set_scene_update_callback = function (self, world, callback)
	self._scene_update_callbacks[world] = callback
end

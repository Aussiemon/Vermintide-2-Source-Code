require("scripts/settings/breeds")

AISpawner = class(AISpawner)
AI_TEST_COUNTER = 0
AISpawner.init = function (self, world, unit)
	self._spawner_system = Managers.state.entity:system("spawner_system")
	self._config = {}
	self._world = world
	self._unit = unit
	self._spawned_units = 0
	self._max_amount = 0

	if Unit.has_data(unit, "spawner_settings") then
		local spawner_name = self.check_for_enabled(self)

		if spawner_name ~= nil then
			local terror_event_id = Unit.get_data(unit, "terror_event_id")

			if terror_event_id then
				if terror_event_id ~= "" then
				else
					terror_event_id = false

					if false then
						terror_event_id = true
					end
				end
			end

			local hidden = Unit.get_data(unit, "hidden")

			self._spawner_system:register_enabled_spawner(unit, terror_event_id, hidden)

			local i = 0
			local animation_events = {}

			while Unit.has_data(unit, "spawner_settings", spawner_name, "animation_events", i) do
				animation_events[#animation_events + 1] = Unit.get_data(unit, "spawner_settings", spawner_name, "animation_events", i)
				i = i + 1
			end

			self._config = {
				name = spawner_name,
				animation_events = animation_events,
				node = Unit.get_data(unit, "spawner_settings", spawner_name, "node"),
				spawn_rate = Unit.get_data(unit, "spawner_settings", spawner_name, "spawn_rate")
			}
			self._next_spawn = 0
		end
	else
		local terror_event_id = Unit.get_data(self._unit, "terror_event_id")

		if terror_event_id then
			if terror_event_id ~= "" then
			else
				terror_event_id = false

				if false then
					terror_event_id = true
				end
			end
		end

		self._spawner_system:register_raw_spawner(self._unit, terror_event_id)
	end

	return 
end
AISpawner.check_for_enabled = function (self)
	local i = 1
	local name = "spawner"
	name = "spawner" .. i

	if Unit.has_data(self._unit, "spawner_settings", name) then
		if Unit.get_data(self._unit, "spawner_settings", name, "enabled") then
			return name
		end
	else
		return nil
	end

	i = i + 1

	return 
end
AISpawner.add_breeds = function (self, breed_list)
	self._breed_list = self._breed_list or {}

	table.append(self._breed_list, breed_list)

	self._max_amount = #self._breed_list

	return 
end
AISpawner.on_activate = function (self, amount, breeds, breed_list)
	if breed_list then
		self.add_breeds(self, breed_list)
	else
		self._breed_list = nil
		self._breeds = breeds
		self._max_amount = self._max_amount + amount
	end

	return 
end
AISpawner.on_deactivate = function (self)
	self._max_amount = 0
	self._spawned_units = 0

	self._spawner_system:deactivate_spawner(self._unit)

	return 
end
AISpawner.update = function (self, unit, input, dt, context, t)
	if self._next_spawn < t then
		if self._spawned_units < self._max_amount then
			self.spawn_unit(self)

			self._next_spawn = t + 1 / self._config.spawn_rate
		else
			self.on_deactivate(self)
		end
	end

	return 
end
AISpawner.spawn_rate = function (self)
	return self._config.spawn_rate
end
AISpawner.spawn_unit = function (self)
	local breed, group_template, breed_name = nil

	if self._breed_list then
		local size = #self._breed_list
		local data = self._breed_list[size]

		if type(data) == "table" then
			breed_name = data[1]
			group_template = data[2]
		else
			breed_name = data
		end

		breed = Breeds[breed_name]
		self._breed_list[size] = nil
	else
		local index = math.random(1, #self._breeds)
		breed = self._breeds[index]
	end

	local unit = self._unit

	Unit.flow_event(unit, "lua_spawn")

	local conflict_director = Managers.state.conflict
	local spawn_category = "ai_spawner"
	local node = Unit.node(unit, self._config.node)
	local parent_index = Unit.scene_graph_parent(unit, node)
	local parent_world_rotation = Unit.world_rotation(unit, parent_index)
	local spawn_node_rotation = Unit.local_rotation(unit, node)
	local spawn_rotation = Quaternion.multiply(parent_world_rotation, spawn_node_rotation)
	local spawn_type = (Unit.get_data(self._unit, "hidden") and "horde_hidden") or "horde"
	local spawn_pos = Unit.world_position(unit, node)
	local animation_events = self._config.animation_events

	if spawn_type == "horde_hidden" and breed.use_regular_horde_spawning then
		spawn_type = "horde"
	end

	local spawn_animation = spawn_type == "horde" and animation_events[math.random(#animation_events)]
	local spawner_name = self.get_spawner_name(self)
	local optional_data = nil

	conflict_director.spawn_queued_unit(conflict_director, breed, Vector3Box(spawn_pos), QuaternionBox(spawn_rotation), spawn_category, spawn_animation, spawn_type, optional_data, group_template)
	conflict_director.add_horde(conflict_director, 1)

	self._spawned_units = self._spawned_units + 1

	self._spawner_system:add_waiting_to_spawn(-1)

	return 
end
AISpawner.spawn_rotation = function (self)
	local unit = self._unit

	return Unit.world_rotation(unit, Unit.node(unit, self._config.node))
end
AISpawner.spawn_position = function (self)
	local unit = self._unit

	return Unit.world_position(unit, Unit.node(unit, self._config.node))
end
AISpawner.get_spawner_name = function (self)
	return self._config.name
end
AISpawner.destroy = function (self)
	return 
end

return 

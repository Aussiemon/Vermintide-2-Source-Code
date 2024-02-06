-- chunkname: @scripts/entity_system/systems/spawner/spawner_system.lua

require("scripts/hub_elements/ai_spawner")

local function D(...)
	if script_data.debug_hordes then
		printf(...)
	end
end

SpawnerSystem = class(SpawnerSystem, ExtensionSystemBase)

local extensions = {
	"AISpawner",
}
local script_data = script_data

SpawnerSystem.init = function (self, context, system_name)
	SpawnerSystem.super.init(self, context, system_name, extensions)

	self._spawn_list = {}
	self._active_spawners = {}
	self._enabled_spawners = {}
	self._disabled_spawners = {}
	self._num_hidden_spawners = 0
	self._id_lookup = {}
	self._raw_id_lookup = {}
	self._hidden_spawners = {}
	self._disabled_hidden_spawners = {}
	self._spawner_broadphase_id = {}

	local event_manager = Managers.state.event

	event_manager:register(self, "spawn_horde", "spawn_horde")

	self.hidden_spawners_broadphase = Broadphase(40, 512)
	self._use_alt_horde_spawning = Managers.mechanism:setting("use_alt_horde_spawning")
	self._breed_limits = {}
end

local spawn_list = {
	"skaven_slave",
	"skaven_clan_rat",
	"skaven_slave",
	"skaven_clan_rat",
	"skaven_slave",
	"skaven_clan_rat",
	"skaven_slave",
	"skaven_clan_rat",
	"skaven_slave",
	"skaven_clan_rat",
}

SpawnerSystem.update_test_all_spawners = function (self, t)
	local spawner_units = self._enabled_spawners
	local index = self._test_data.index
	local j = 0
	local side_id = 2

	while index <= #spawner_units and self.tests_running < 6 and j < 10 do
		local spawner_unit = spawner_units[index]
		local group_template = {
			size = 10,
			template = "spawn_test",
			id = Managers.state.entity:system("ai_group_system"):generate_group_id(),
			spawner_unit = spawner_unit,
			group_data = {
				spawner_unit = spawner_unit,
			},
		}
		local pos = Unit.local_position(spawner_unit, 0)

		QuickDrawerStay:sphere(pos, 0.66, Color(60, 200, 0))
		Debug.world_sticky_text(pos, group_template.id, "green")
		print("START TEST for ", group_template.id)
		self:spawn_horde(spawner_unit, spawn_list, side_id, group_template)

		index = index + 1
		j = j + 1
		self.tests_running = self.tests_running + 1
	end

	if index > #spawner_units then
		print("All spawners tested")

		self._test_data = nil
	else
		self._test_data.index = index
	end
end

SpawnerSystem.test_all_spawners = function (self)
	self.tests_running = 0

	print("")
	print(string.format("Starting spawner test. Found %d spawners.", #self._enabled_spawners))

	self._test_data = {
		index = 1,
	}
end

SpawnerSystem.running_spawners = function (self)
	return self._active_spawners
end

SpawnerSystem.enabled_spawners = function (self)
	return self._enabled_spawners
end

SpawnerSystem.hidden_spawners_lookup = function (self)
	return self._hidden_spawners
end

SpawnerSystem.register_enabled_spawner = function (self, spawner, terror_event_id, hidden)
	self._enabled_spawners[#self._enabled_spawners + 1] = spawner

	if terror_event_id then
		local lookup = self._id_lookup[terror_event_id]

		if not lookup then
			lookup = {}
			self._id_lookup[terror_event_id] = lookup
		end

		lookup[#lookup + 1] = spawner
	end

	if hidden then
		self:_add_broadphase(spawner)
	end
end

SpawnerSystem.hibernate_spawner = function (self, spawner, hibernate)
	local enabled_spawners = self._enabled_spawners
	local num_enabled_spawners = #enabled_spawners
	local disabled_spawners = self._disabled_spawners
	local spawner_was_hibernating = disabled_spawners[spawner]
	local hidden_spawners = self._hidden_spawners
	local is_hidden_spawner = hidden_spawners[spawner]
	local disabled_hidden_spawners = self._disabled_hidden_spawners
	local hidden_spawner_was_hibernating = disabled_hidden_spawners[spawner]

	if hibernate then
		if not spawner_was_hibernating then
			self:_hibernate_spawner(num_enabled_spawners, enabled_spawners, disabled_spawners, spawner)
		end

		if is_hidden_spawner and not hidden_spawner_was_hibernating then
			self:_hibernate_hidden_spawner(hidden_spawners, disabled_hidden_spawners, spawner)
			self:_remove_broadphase(spawner)
		end
	else
		if spawner_was_hibernating then
			self:_awaken_spawner(enabled_spawners, disabled_spawners, spawner)
		end

		if hidden_spawner_was_hibernating then
			self:_awaken_hidden_spawner(hidden_spawners, disabled_hidden_spawners, spawner)
			self:_add_broadphase(spawner)
		end
	end
end

SpawnerSystem._hibernate_spawner = function (self, num_enabled_spawners, enabled_spawners, disabled_spawners, spawner)
	for i = 1, num_enabled_spawners do
		local spawn = enabled_spawners[i]

		if spawn == spawner then
			table.swap_delete(enabled_spawners, i)

			disabled_spawners[spawner] = true

			break
		end
	end
end

SpawnerSystem._hibernate_hidden_spawner = function (self, hidden_spawners, disabled_hidden_spawners, spawner)
	hidden_spawners[spawner] = nil
	disabled_hidden_spawners[spawner] = true
end

SpawnerSystem._awaken_spawner = function (self, enabled_spawners, disabled_spawners, spawner)
	disabled_spawners[spawner] = nil
	enabled_spawners[#enabled_spawners + 1] = spawner
end

SpawnerSystem._awaken_hidden_spawner = function (self, hidden_spawners, disabled_hidden_spawners, spawner)
	disabled_hidden_spawners[spawner] = nil
	hidden_spawners[spawner] = true
end

SpawnerSystem._add_broadphase = function (self, spawner)
	local pos = Unit.local_position(spawner, 0)
	local broadphase_id = Broadphase.add(self.hidden_spawners_broadphase, spawner, pos, 1)

	self._hidden_spawners[spawner] = true
	self._spawner_broadphase_id[spawner] = broadphase_id
	self._num_hidden_spawners = self._num_hidden_spawners + 1
end

SpawnerSystem._remove_broadphase = function (self, spawner)
	local broadphase_spawner_id = self._spawner_broadphase_id[spawner]

	Broadphase.remove(self.hidden_spawners_broadphase, broadphase_spawner_id)

	self._spawner_broadphase_id[spawner] = nil
	self._num_hidden_spawners = self._num_hidden_spawners - 1
end

SpawnerSystem.register_raw_spawner = function (self, spawner, terror_event_id)
	if terror_event_id then
		local lookup = self._raw_id_lookup[terror_event_id]

		if not lookup then
			lookup = {}
			self._raw_id_lookup[terror_event_id] = lookup
		end

		lookup[#lookup + 1] = spawner
	end
end

local spawn_list = {}
local spawn_list_hidden = {}
local copy_list = {}

SpawnerSystem.spawn_horde = function (self, spawner, breed_list, side_id, group_template, optional_data)
	local extension = ScriptUnit.extension(spawner, "spawner_system")

	self._active_spawners[spawner] = extension

	extension:on_activate(breed_list, side_id, group_template, optional_data)

	local spawn_rate = extension:spawn_rate()

	return spawn_rate
end

local function copy_array(source, index_a, index_b, dest)
	local j = 1

	for i = index_a, index_b do
		dest[j] = source[i]
		j = j + 1
	end
end

SpawnerSystem.set_breed_event_horde_spawn_limit = function (self, breed_name, limit)
	self._breed_limits[breed_name] = limit
end

local temp_spawn_list_per_breed = {}
local exchange_order = {}
local i = 1

for name, data in pairs(Breeds) do
	exchange_order[i] = name
	i = i + 1
end

table.sort(exchange_order, function (name1, name2)
	return Breeds[name1].exchange_order < Breeds[name2].exchange_order
end)
table.dump(exchange_order)

SpawnerSystem._try_spawn_breed = function (self, breed_name, spawn_list_per_breed, spawn_list, breed_limits, active_enemies, side_id, group_template)
	local amount = spawn_list_per_breed[breed_name]

	if amount then
		local limit = breed_limits[breed_name]

		if limit then
			local overflow = math.min(active_enemies + amount - limit.max_active_enemies, amount)
			local ratio = limit.exchange_ratio

			if ratio < overflow then
				local exchanged_amount = math.floor(overflow / ratio)

				amount = amount - exchanged_amount * ratio

				local exchange_breed = limit.spawn_breed

				if type(exchange_breed) == "table" then
					local num_breeds = #exchange_breed

					for i = 1, exchanged_amount do
						local breed_index = Math.random(1, num_breeds)
						local exchange_breed_name = exchange_breed[breed_index]

						spawn_list_per_breed[exchange_breed_name] = (spawn_list_per_breed[exchange_breed_name] or 0) + 1
					end

					for i = 1, num_breeds do
						active_enemies = active_enemies + self:_try_spawn_breed(exchange_breed[i], spawn_list_per_breed, spawn_list, breed_limits, active_enemies, side_id, group_template)
					end
				else
					spawn_list_per_breed[exchange_breed] = (spawn_list_per_breed[exchange_breed] or 0) + exchanged_amount
					active_enemies = active_enemies + self:_try_spawn_breed(exchange_breed, spawn_list_per_breed, spawn_list, breed_limits, active_enemies, side_id, group_template)
				end
			end
		end

		local start = #spawn_list + 1

		active_enemies = active_enemies + amount

		if group_template then
			group_template.size = group_template.size + amount
		end

		local ends = start + amount - 1

		for j = start, ends do
			spawn_list[j] = breed_name
		end
	end

	return active_enemies
end

SpawnerSystem._fill_spawners = function (self, spawn_list, spawners, limit_spawners, side_id, group_template, use_closest_spawners, source_unit, optional_data)
	local total_amount = #spawn_list

	if total_amount <= 0 then
		return total_amount
	end

	local num_spawners_to_use = #spawners

	table.shuffle(spawners)

	if limit_spawners then
		if use_closest_spawners then
			local source_pos = POSITION_LOOKUP[source_unit]

			while limit_spawners < #spawners do
				local furthest_index = 1
				local furthest_length = 0

				for i = 1, #spawners do
					local distance = Vector3.distance_squared(source_pos, Unit.local_position(spawners[i], 0))

					if furthest_length < distance then
						furthest_length = distance
						furthest_index = i
					end
				end

				table.swap_delete(spawners, furthest_index)
			end
		else
			for i = limit_spawners + 1, num_spawners_to_use do
				spawners[i] = nil
			end
		end

		num_spawners_to_use = #spawners
	end

	local start_index = 1

	for i = 1, num_spawners_to_use do
		local to_spawn = math.floor(total_amount / (num_spawners_to_use - i + 1))

		total_amount = total_amount - to_spawn

		local spawner = spawners[i]
		local extension = ScriptUnit.extension(spawner, "spawner_system")

		self._active_spawners[spawner] = extension

		table.clear_array(copy_list, #copy_list)
		copy_array(spawn_list, start_index, start_index + to_spawn - 1, copy_list)
		extension:on_activate(copy_list, side_id, group_template, optional_data)

		start_index = start_index + to_spawn
	end

	return #spawn_list
end

local ok_spawner_breeds = {
	skaven_clan_rat = true,
	skaven_slave = true,
}

SpawnerSystem.spawn_horde_from_terror_event_ids = function (self, event_ids, variant, limit_spawners, group_template, strictly_not_close_to_players, side_id, use_closest_spawners, source_unit, optional_data)
	local ConflictUtils = ConflictUtils
	local must_use_hidden_spawners = variant.must_use_hidden_spawners
	local spawners, hidden_spawners, event_spawn
	local dont_remove_this = math.random()

	if event_ids and #event_ids > 0 then
		spawners = {}
		hidden_spawners = {}

		for _, event_id in ipairs(event_ids) do
			local source_spawners = self._id_lookup[event_id]

			if source_spawners then
				for i = 1, #source_spawners do
					local source_spawner = source_spawners[i]

					if not self._disabled_spawners[source_spawner] then
						local hidden = Unit.get_data(source_spawner, "hidden")

						if hidden then
							hidden_spawners[#hidden_spawners + 1] = source_spawner
						end

						spawners[#spawners + 1] = source_spawner
					end
				end
			else
				fassert("No horde spawners found with terror_id %d ", event_id)

				return
			end
		end

		if #spawners == 0 then
			return
		end

		event_spawn = self._use_alt_horde_spawning ~= true
	else
		local side = Managers.state.side:get_side_from_name("heroes")
		local player_positions = side.PLAYER_POSITIONS

		if strictly_not_close_to_players then
			spawners, hidden_spawners = ConflictUtils.filter_horde_spawners_strictly(player_positions, self._enabled_spawners, self._hidden_spawners, 10, 35)
		else
			spawners, hidden_spawners = ConflictUtils.filter_horde_spawners(player_positions, self._enabled_spawners, self._hidden_spawners, 10, 35)
		end

		if must_use_hidden_spawners and #hidden_spawners == 0 then
			local pos = player_positions[1]

			if pos then
				local spawner = ConflictUtils.get_random_hidden_spawner(pos, 40)

				if spawner then
					hidden_spawners = {
						spawner,
					}
				end
			end

			if #hidden_spawners == 0 then
				print("Can't find any hidden spawners for this breed")

				return
			end
		end

		if not next(spawners) then
			return
		end
	end

	local num_spawners = #spawners

	if num_spawners == 0 then
		return
	end

	local difficulty = Managers.state.difficulty.difficulty
	local difficulty_breeds = variant.difficulty_breeds
	local breed_list = difficulty_breeds and difficulty_breeds[difficulty] or variant.breeds
	local spawn_list = spawn_list

	table.clear_array(spawn_list, #spawn_list)

	local spawn_list_hidden = spawn_list_hidden

	table.clear_array(spawn_list_hidden, #spawn_list_hidden)

	for i = 1, #breed_list, 2 do
		local breed_name = breed_list[i]
		local amount = breed_list[i + 1]
		local num_to_spawn

		if type(amount) == "table" then
			num_to_spawn = Math.random(amount[1], amount[2])
		else
			num_to_spawn = amount
		end

		temp_spawn_list_per_breed[breed_name] = num_to_spawn
	end

	local exchange_order = exchange_order
	local breed_limits = self._breed_limits
	local num_breeds = #exchange_order
	local active_enemies = Managers.state.performance:num_active_enemies()

	for i = 1, num_breeds do
		local breed_name = exchange_order[i]

		if event_spawn or ok_spawner_breeds[breed_name] then
			self:_try_spawn_breed(breed_name, temp_spawn_list_per_breed, spawn_list, breed_limits, active_enemies, side_id, group_template)
		else
			self:_try_spawn_breed(breed_name, temp_spawn_list_per_breed, spawn_list_hidden, breed_limits, active_enemies, side_id, group_template)
		end
	end

	table.clear(temp_spawn_list_per_breed)
	table.shuffle(spawn_list)

	local count, hidden_count = 0, 0

	count = self:_fill_spawners(spawn_list, spawners, limit_spawners, side_id, group_template, use_closest_spawners, source_unit, optional_data)

	if not event_spawn and must_use_hidden_spawners then
		hidden_count = self:_fill_spawners(spawn_list_hidden, hidden_spawners, limit_spawners, side_id, group_template, use_closest_spawners, source_unit, optional_data)

		if hidden_count > 0 then
			return "success", count + hidden_count
		end
	end

	if count > 0 then
		return "success", count
	end
end

SpawnerSystem.change_spawner_id = function (self, unit, spawner_id, new_spawner_id)
	if unit then
		local old_id = Unit.get_data(unit, "terror_event_id")

		if old_id ~= "" and old_id == new_spawner_id then
			return
		end

		local old_spawners = self._id_lookup[old_id]

		if old_spawners then
			local num_spawners = #old_spawners

			for i = 1, num_spawners do
				if old_spawners[i] == unit then
					old_spawners[i] = old_spawners[num_spawners]
					old_spawners[num_spawners] = nil

					break
				end
			end
		end

		local new_spawners = self._id_lookup[new_spawner_id]

		if not new_spawners then
			new_spawners = {}
			self._id_lookup[new_spawner_id] = new_spawners
		end

		new_spawners[#new_spawners + 1] = unit

		Unit.set_data(unit, "terror_event_id", new_spawner_id)

		return
	end

	local spawners = self._id_lookup[spawner_id]
	local new_spawners = self._id_lookup[new_spawner_id]

	if not new_spawners then
		new_spawners = {}
		self._id_lookup[new_spawner_id] = new_spawners
	end

	if spawners then
		local old_start_index = #spawners
		local new_start_index = #new_spawners

		for i = 1, old_start_index do
			new_spawners[new_start_index + i] = spawners[i]

			Unit.set_data(spawners[i], "terror_event_id", new_spawner_id)

			spawners[i] = nil
		end
	else
		print("Can't find spawners called: ", spawner_id, " so cannot rename any")
	end
end

SpawnerSystem.get_raw_spawner_unit = function (self, terror_id)
	local spawners = self._raw_id_lookup[terror_id] or self._id_lookup[terror_id]

	if spawners then
		local spawner_unit = spawners[math.random(1, #spawners)]
		local idle_animation = Unit.get_data(spawner_unit, "idle_animation")

		return spawner_unit, idle_animation
	end
end

SpawnerSystem.deactivate_spawner = function (self, spawner)
	self._active_spawners[spawner] = nil
end

SpawnerSystem.debug_show_spawners = function (self, t, spawners)
	local h = 70
	local add_height = Vector3(0, 0, h)
	local color = Color(255, 0, 200, 0)

	for unit, _ in pairs(spawners) do
		local pos = Unit.local_position(unit, 0)

		QuickDrawer:line(pos, pos + add_height, color)

		local d = 7 * (t % 10)

		QuickDrawer:sphere(pos + Vector3(0, 0, d), 0.5, color)
		QuickDrawer:sphere(pos + Vector3(0, 0, (d + 10) % h), 0.5, color)
		QuickDrawer:sphere(pos + Vector3(0, 0, (d + 20) % h), 0.5, color)
	end
end

SpawnerSystem.set_spawn_list = function (self, list)
	self._spawn_list = list
end

SpawnerSystem.pop_pawn_list = function (self)
	local spawn_list = self._spawn_list
	local size = #spawn_list

	if size <= 0 then
		return
	end

	local breed = spawn_list[size]

	spawn_list[size] = nil

	return breed
end

local dummy_input = {}
local found_hidden_spawners = {}

SpawnerSystem.update = function (self, context, t, dt)
	for unit, extension in pairs(self._active_spawners) do
		extension:update(unit, dummy_input, dt, context, t)
	end
end

SpawnerSystem.show_hidden_spawners = function (self, t)
	local unit_local_position = Unit.local_position
	local side = Managers.state.side:get_side_from_name("heroes")
	local PLAYER_POSITIONS = side.PLAYER_POSITIONS
	local center_pos = PLAYER_POSITIONS[1]
	local free_flight_manager = Managers.free_flight
	local in_free_flight = free_flight_manager:active("global")

	if in_free_flight then
		center_pos = free_flight_manager:camera_position_rotation()
	end

	local s = math.sin(t * 10)
	local color = Color(192 + 64 * s, 192 + 64 * s, 0)
	local fail_color = Color(192 + 64 * s, 0, 0)
	local amount = 0
	local bad = 0
	local radius = 40

	if center_pos then
		local nav_world = Managers.state.entity:system("ai_system"):nav_world()

		amount = Broadphase.query(self.hidden_spawners_broadphase, center_pos, radius, found_hidden_spawners)

		local spinn = math.sin(t * 5) * 0.33
		local spinn_vec = Vector3(spinn, spinn, 0)
		local h_pos = Vector3(spinn, spinn, 30)

		for i = 1, amount do
			local spawner_unit = found_hidden_spawners[i]
			local pos = unit_local_position(spawner_unit, 0)
			local is_position_on_navmesh = GwNavQueries.triangle_from_position(nav_world, pos, 0.5, 0.5)

			if is_position_on_navmesh then
				QuickDrawer:line(pos + spinn_vec, pos + h_pos, color)
				QuickDrawer:sphere(pos, 0.15, color)
			else
				QuickDrawer:line(pos + spinn_vec, pos + h_pos, fail_color)
				QuickDrawer:sphere(pos, 0.15, color)

				bad = bad + 1
			end
		end
	end

	if bad == 0 then
		Debug.text("This level has %d hidden spawners. (%d within %d meters)", self._num_hidden_spawners, amount, radius)

		if center_pos then
			QuickDrawer:circle(center_pos + Vector3(0, 0, 20), radius, Vector3.up(), color)
		end
	else
		Debug.text("This level has %d hidden spawners. (%d within %d meters, %d are not on nav-mesh)", self._num_hidden_spawners, amount, radius, bad)

		if center_pos then
			QuickDrawer:circle(center_pos + Vector3(0, 0, 20), radius, Vector3.up(), fail_color)
		end
	end
end

BreedFreezerSettings = {
	freezer_pos = {
		0,
		0,
		-600
	},
	freezer_offset = {
		0,
		0.05,
		0.05
	},
	freezer_pos_debug = {
		0,
		0,
		10
	},
	freezer_offset_debug = {
		0,
		2,
		3
	},
	freezer_size = {
		0,
		0,
		0
	},
	breeds = {
		skaven_clan_rat = {
			pool_size = 32
		},
		skaven_slave = {
			pool_size = 50
		},
		skaven_storm_vermin = {
			pool_size = 16
		},
		skaven_plague_monk = {
			pool_size = 8
		},
		chaos_marauder = {
			pool_size = 32
		},
		chaos_fanatic = {
			pool_size = 50
		},
		chaos_berzerker = {
			pool_size = 8
		},
		chaos_raider = {
			pool_size = 8
		},
		chaos_warrior = {
			pool_size = 6
		}
	},
	breeds_index_lookup = {}
}

fassert(BreedFreezerSettings.freezer_offset[2] > 0, "Must have positive offset so we can sort the units when hot joining")

local num_pools = table.size(BreedFreezerSettings.breeds)
local max_pool_size = 0
local breeds_index_lookup = BreedFreezerSettings.breeds_index_lookup

for breed_name, settings in pairs(BreedFreezerSettings.breeds) do
	max_pool_size = math.max(max_pool_size, settings.pool_size)
	breeds_index_lookup[#breeds_index_lookup + 1] = breed_name
end

local unit_templates = require("scripts/network/unit_extension_templates")
BreedFreezer = class(BreedFreezer)

BreedFreezer.init = function (self, world, entity_manager, network_event_delegate)
	local is_server = Managers.player.is_server
	self.is_server = is_server
	self.world = world
	self.entity_manager = entity_manager

	if network_event_delegate then
		self.network_event_delegate = network_event_delegate

		network_event_delegate:register(self, "rpc_breed_freeze_unit", "rpc_breed_unfreeze_breed", "rpc_breed_freezer_hot_join", "rpc_breed_freezer_sync_breeds")
	end

	self.breed_spawn_queues = {}
	self.extensions = {}
	self.systems_by_breed = {}
	self.extension_names_by_breed = {}
	self.count = 0
	self.units_to_freeze = {}
	self.num_to_freeze = 0
	self.breed_offsets = {}
	self.breed_template_units = {}

	if is_server then
		self:_setup_freeze_box()
	end

	for breed_name, settings in pairs(BreedFreezerSettings.breeds) do
		fassert(settings.pool_size <= NetworkConstants.max_breed_freezer_units_per_rpc, "Pool size too large to sync!")
	end
end

BreedFreezer._setup_freeze_box = function (self)
	local offset_z = 0
	local freezer_pos = (script_data.debug_breed_freeze and Vector3Aux.unbox(BreedFreezerSettings.freezer_pos_debug)) or Vector3Aux.unbox(BreedFreezerSettings.freezer_pos)
	local freezer_offset = (script_data.debug_breed_freeze and Vector3Aux.unbox(BreedFreezerSettings.freezer_offset_debug)) or Vector3Aux.unbox(BreedFreezerSettings.freezer_offset)
	self.freezer_pos = Vector3Box(freezer_pos)
	self.freezer_offset = Vector3Box(freezer_offset)
	local world = self.world
	local is_server = self.is_server
	local entity_manager = self.entity_manager

	for breed_name, settings in pairs(BreedFreezerSettings.breeds) do
		self.breed_offsets[breed_name] = offset_z
		self.units_to_freeze[breed_name] = {}
		self.breed_spawn_queues[breed_name] = CircularQueue:new(settings.pool_size)
		local breed = Breeds[breed_name]
		local is_husk = not is_server
		local extension_names, num_extension_names = unit_templates.get_extensions(breed.unit_template, is_husk, is_server)
		self.systems_by_breed[breed_name] = {}
		self.extension_names_by_breed[breed_name] = {}
		local systems = self.systems_by_breed[breed_name]
		local breed_extension_names = self.extension_names_by_breed[breed_name]

		for i = 1, num_extension_names, 1 do
			local ext_name = extension_names[i]
			local system = entity_manager:system_by_extension(ext_name)

			if system ~= nil then
				systems[#systems + 1] = system

				fassert(system.freeze, "System '%s' that should be able to freeze and unfreeze breed extensions doesn't have the required function(s).", system.NAME)

				breed_extension_names[#breed_extension_names + 1] = ext_name
			end
		end

		local base_unit = (script_data.use_optimized_breed_units and breed.opt_base_unit) or breed.base_unit
		local variants = 0

		if base_unit and type(base_unit) == "table" then
			for _, unit_name in ipairs(base_unit) do
				local template_pos = freezer_pos + Vector3(variants, -3, offset_z)

				self:_spawn_template_unit(world, unit_name, template_pos)
			end

			variants = variants + 1
		else
			local template_pos = freezer_pos + Vector3(0, -3, offset_z)

			self:_spawn_template_unit(world, base_unit, template_pos)
		end

		offset_z = offset_z + freezer_offset.z
	end

	BreedFreezerSettings.freezer_size[1] = 4
	BreedFreezerSettings.freezer_size[2] = freezer_offset[2] * (max_pool_size + 1)
	BreedFreezerSettings.freezer_size[3] = freezer_offset[3] * (num_pools + 1)
	self.spawn_data = {
		[2] = Vector3Box(),
		QuaternionBox()
	}
	self._freezer_initialized = true
end

BreedFreezer._spawn_template_unit = function (self, world, unit_name, pos)
	local unit = World.spawn_unit(world, unit_name, pos)
	self.breed_template_units[unit_name] = unit

	Unit.disable_animation_state_machine(unit)
	Unit.disable_physics(unit)
	Unit.set_unit_visibility(unit, false)

	if script_data.debug_breed_freeze then
		QuickDrawerStay:sphere(pos, 1, Color(0, 200, 0))
	end
end

BreedFreezer.destroy = function (self)
	if self.network_event_delegate then
		self.network_event_delegate:unregister(self)
	end
end

BreedFreezer.try_mark_unit_for_freeze = function (self, breed, unit)
	local breed_name = breed.name

	if BreedFreezerSettings.breeds[breed_name] == nil then
		return false
	end

	local units_to_freeze = self.units_to_freeze[breed_name]

	if self.breed_spawn_queues[breed_name]:available() <= #units_to_freeze then
		if script_data.debug_breed_freeze then
			Debug.sticky_text("Tried to freeze breed %s but pool is full!", breed_name)
		end

		return false
	end

	for i = 1, #units_to_freeze, 1 do
		if units_to_freeze[i] == unit then
			print("ERROR: Tried to freeze unit twice in the same frame.")

			return false
		end
	end

	local queue = self.breed_spawn_queues[breed_name]

	if queue:contains(unit) then
		print("ERROR: Tried to freeze unit twice (it was already in queue).")

		return false
	end

	self.num_to_freeze = self.num_to_freeze + 1
	units_to_freeze[#units_to_freeze + 1] = unit

	return true
end

BreedFreezer.rpc_breed_freeze_unit = function (self, peer_id, go_id)
	fassert(self._freezer_initialized, "Received freeze before freezer was initialized!")

	local unit = Managers.state.unit_storage:unit(go_id)
	local ai_extension = ScriptUnit.has_extension(unit, "ai_system")
	local breed = ai_extension:breed()
	local breed_name = breed.name

	fassert(BreedFreezerSettings.breeds[breed_name], "Can't freeze unit of breed %s", breed_name)

	local units_to_freeze = self.units_to_freeze[breed_name]

	fassert(self.breed_spawn_queues[breed_name]:available() > #units_to_freeze, "Breed freeze queue for breed %s is full.", breed_name)

	self.num_to_freeze = self.num_to_freeze + 1
	units_to_freeze[#units_to_freeze + 1] = unit

	self:commit_freezes()
end

local GameSession_set_game_object_field = GameSession.set_game_object_field

BreedFreezer.commit_freezes = function (self)
	Profiler.start("commit_freezes")

	if self.num_to_freeze == 0 then
		Profiler.stop("commit_freezes")

		return
	end

	local freezer_offset = self.freezer_offset:unbox()
	local freezer_pos = self.freezer_pos:unbox()
	local freezer_size = Vector3Aux.unbox(BreedFreezerSettings.freezer_size)

	for breed_name, units in pairs(self.units_to_freeze) do
		local queue = self.breed_spawn_queues[breed_name]

		for i = 1, #units, 1 do
			local unit = units[i]
			units[i] = nil

			if script_data.debug_breed_freeze then
			end

			queue:push_back(unit)
			Profiler.start("freeze_breed")
			Profiler.start("systems")

			local systems = self.systems_by_breed[breed_name]
			local breed_extension_names = self.extension_names_by_breed[breed_name]

			for i = 1, #systems, 1 do
				local system = systems[i]

				Profiler.start(system.name or "unknown")
				system:freeze(unit, breed_extension_names[i], "reason_unspawn")
				Profiler.stop(system.name or "unknown")
			end

			Profiler.stop("systems")
			Profiler.start("teardown")

			if Unit.has_animation_state_machine(unit) then
				Profiler.start("disable_animation_state_machine")
				Unit.disable_animation_state_machine(unit)
				Profiler.stop("disable_animation_state_machine")
			end

			Profiler.start("disable physics")
			Unit.disable_physics(unit)

			local unit_name = Unit.get_data(unit, "unit_name")
			local source_unit = self.breed_template_units[unit_name]

			Unit.copy_scene_graph_local_from(unit, source_unit)
			Profiler.stop("disable physics")

			if not script_data.debug_breed_freeze then
				Profiler.start("set_unit_visibility")
				Unit.set_unit_visibility(unit, false)
				Profiler.stop("set_unit_visibility")
			end

			local offset = Vector3(freezer_size[1] * 0.5, queue.last * freezer_offset[2], self.breed_offsets[breed_name] + freezer_offset[3] * 0.5)

			Unit.set_local_position(unit, 0, freezer_pos + offset)

			FROZEN[unit] = true
			POSITION_LOOKUP[unit] = nil

			Profiler.start("reload_flow")
			Unit.reload_flow(unit)
			Profiler.stop("reload_flow")
			Profiler.stop("teardown")

			self.count = self.count + 1

			Unit.set_frozen(unit, true)

			if Managers.player.is_server then
				Profiler.start("rpc_breed_freeze_unit")

				local network_manager = Managers.state.network
				local unit_id = network_manager:unit_game_object_id(unit)

				network_manager.network_transmit:send_rpc_clients("rpc_breed_freeze_unit", unit_id)

				local game = Managers.state.network:game()

				GameSession_set_game_object_field(game, unit_id, "position", freezer_pos + offset)
				Profiler.stop("rpc_breed_freeze_unit")
			end

			Managers.state.unit_storage:freeze(unit)
			Profiler.stop("freeze_breed")
		end
	end

	self.num_to_freeze = 0

	Profiler.stop("commit_freezes")
end

BreedFreezer.try_unfreeze_breed = function (self, breed, data)
	local breed_name = breed.name

	if BreedFreezerSettings.breeds[breed_name] == nil then
		return nil
	end

	local queue = self.breed_spawn_queues[breed_name]

	if queue:is_empty() then
		return nil
	end

	Profiler.start("pop queue")

	local unit = queue:pop_first()

	Profiler.stop("pop queue")
	Managers.state.unit_storage:unfreeze(unit)
	Profiler.start("rpc")

	local network_manager = Managers.state.network
	local unit_id = network_manager:unit_game_object_id(unit)

	network_manager.network_transmit:send_rpc_clients("rpc_breed_unfreeze_breed", NetworkLookup.breeds[breed_name], data[2]:unbox(), data[3]:unbox(), unit_id)
	Profiler.stop("rpc")
	self:unfreeze_unit(unit, breed_name, data)

	return unit
end

BreedFreezer.rpc_breed_unfreeze_breed = function (self, peer_id, breed_id, pos, rot, go_id)
	fassert(self._freezer_initialized, "Received unfreeze before freezer was initialized!")

	local breed_name = NetworkLookup.breeds[breed_id]
	local queue = self.breed_spawn_queues[breed_name]
	local unit = queue:pop_first()

	fassert(BreedFreezerSettings.breeds[breed_name], "Can't unfreeze unit of breed %s", breed_name)
	Managers.state.unit_storage:unfreeze(unit)

	local check_go_id = Managers.state.unit_storage:go_id(unit)

	fassert(go_id == check_go_id, "Server unfreeze unit didn't match local unit in spawn queue")

	local ai_extension = ScriptUnit.has_extension(unit, "ai_system")
	local breed = ai_extension:breed()
	local data = self.spawn_data
	data[1] = breed

	data[2]:store(pos)
	data[3]:store(rot)
	self:unfreeze_unit(unit, breed_name, data)
end

BreedFreezer.unfreeze_unit = function (self, unit, breed_name, data)
	if script_data.debug_breed_freeze then
	end

	Profiler.start("unfreeze_breed")
	Profiler.start("setup")
	Unit.set_frozen(unit, false)

	local pos = data[2]:unbox()
	local rot = data[3]:unbox()

	Unit.set_local_position(unit, 0, pos)
	Unit.set_local_rotation(unit, 0, rot)

	POSITION_LOOKUP[unit] = pos
	POSITION_LOOKUP_BACKUP[unit] = pos
	FROZEN[unit] = nil

	Profiler.start("enable_animation_state_machine")
	Unit.enable_animation_state_machine(unit)
	Profiler.stop("enable_animation_state_machine")
	Profiler.start("enable_physics")
	Unit.enable_physics(unit)
	Profiler.stop("enable_physics")
	Profiler.start("set_unit_visibility")
	Unit.set_unit_visibility(unit, true)
	Profiler.stop("set_unit_visibility")
	Profiler.start("clear_unit_decals")
	Managers.state.blood:clear_unit_decals(unit)
	Profiler.stop("clear_unit_decals")
	Profiler.start("trigger_flow_unit_spawned")
	Unit.trigger_flow_unit_spawned(unit)
	Profiler.stop("trigger_flow_unit_spawned")

	self.count = self.count - 1

	Profiler.stop("setup")
	Profiler.start("systems")

	local systems = self.systems_by_breed[breed_name]
	local breed_extension_names = self.extension_names_by_breed[breed_name]

	for i = 1, #systems, 1 do
		local system = systems[i]

		if system.unfreeze then
			Profiler.start(system.NAME)
			system:unfreeze(unit, breed_extension_names[i], data)
			Profiler.stop(system.NAME)
		end
	end

	Profiler.stop("systems")
	Profiler.stop("unfreeze_breed")

	return unit
end

BreedFreezer.rpc_breed_freezer_hot_join = function (self, peer_id, debug_breed_freeze)
	script_data.debug_breed_freeze = debug_breed_freeze
	self._current_synked_breed_index = 0

	self:_setup_freeze_box()
end

function store_go_ids_in_array_func(breed_go_ids, unit, frozen_goids)
	breed_go_ids[#breed_go_ids + 1] = frozen_goids[unit]
end

BreedFreezer.hot_join_sync = function (self, peer_id)
	print("Breedfreezer (server) starting a hot join sync")

	local starts = {}
	local breed_go_ids = {}
	local unit_count = 0
	local breed_index = 1
	local max_breed_freezer_units_per_rpc = NetworkConstants.max_breed_freezer_units_per_rpc

	RPC.rpc_breed_freezer_hot_join(peer_id, script_data.debug_breed_freeze or false)

	local frozen_goids = Managers.state.unit_storage.frozen_bimap_goid_unit
	local indexed_lookup = BreedFreezerSettings.breeds_index_lookup

	for i = 1, #indexed_lookup, 1 do
		local breed_name = indexed_lookup[i]
		local queue = self.breed_spawn_queues[breed_name]
		local num_units_of_breed = queue:size()

		if max_breed_freezer_units_per_rpc <= num_units_of_breed + unit_count then
			printf("\t--> rpc-package size reached, sending rpc now")
			RPC.rpc_breed_freezer_sync_breeds(peer_id, starts, breed_go_ids)
			table.clear(breed_go_ids)
			table.clear(starts)

			unit_count = 0
			breed_index = 1
		end

		starts[breed_index * 2 - 1] = queue.first
		starts[breed_index * 2 - 0] = num_units_of_breed

		printf("\tpacking %d units of breed %s", num_units_of_breed, breed_name)
		queue:foreach(breed_go_ids, store_go_ids_in_array_func, frozen_goids)

		unit_count = unit_count + num_units_of_breed
		breed_index = breed_index + 1
	end

	if #starts > 0 then
		printf("\t--> rpc-package size reached, sending rpc now (last package)")
		RPC.rpc_breed_freezer_sync_breeds(peer_id, starts, breed_go_ids)
		table.dump(starts, "starts")
		table.dump(breed_go_ids, "breed_go_ids")
	end
end

BreedFreezer.rpc_breed_freezer_sync_breeds = function (self, peer_id, starts, unit_go_ids)
	printf("Breedfreezer (client) received breed syncs num_breeds:%d, total_units:%d", #starts / 2, #unit_go_ids)

	local breed_index = self._current_synked_breed_index
	local unit_count = 1

	for i = 1, #starts, 2 do
		breed_index = breed_index + 1
		local breed_name = BreedFreezerSettings.breeds_index_lookup[breed_index]

		fassert(BreedFreezerSettings.breeds[breed_name], "Can't freeze unit of breed %s", breed_name)

		local queue_start = starts[i]
		local amount = starts[i + 1]
		local queue = self.breed_spawn_queues[breed_name]
		queue.first = queue_start
		queue.last = queue:index_before(queue.first)

		printf("-->\tgot %d of %s", amount, breed_name)
		fassert(queue:is_empty(), "Breed freeze queue for breed %s was not empty!", breed_name)

		local units_to_freeze = self.units_to_freeze[breed_name]

		for j = 1, amount, 1 do
			local go_id = unit_go_ids[unit_count]
			local unit = Managers.state.unit_storage:unit(go_id)
			units_to_freeze[#units_to_freeze + 1] = unit
			self.num_to_freeze = self.num_to_freeze + 1
			local ai_extension = ScriptUnit.has_extension(unit, "ai_system")
			local breed = ai_extension:breed()

			fassert(breed.name == breed_name, "Got wrong expected breed in rpc_breed_freezer_sync_breeds %q ~= %q", breed.name, breed_name)

			unit_count = unit_count + 1
		end
	end

	self._current_synked_breed_index = breed_index

	print("Breed freezer counts: ", self._current_synked_breed_index, #BreedFreezerSettings.breeds_index_lookup)

	if self._current_synked_breed_index == #BreedFreezerSettings.breeds_index_lookup then
		print("Comitting breed freezer frozen units")
		self:commit_freezes()
	end
end

local function unittostring(unit)
	return tostring(Managers.state.unit_storage.frozen_bimap_goid_unit[unit])
end

BreedFreezer.show_debug = function (self)
	if not script_data.debug_breed_freeze or not self._freezer_initialized then
		return
	end

	Debug.text("Frozen units:")

	for breed_name, _ in pairs(BreedFreezerSettings.breeds) do
		local queue = self.breed_spawn_queues[breed_name]
		local max_unit_count = Managers.state.conflict:count_units_by_breed_max(breed_name)

		Debug.text("  %-20s: %s (max=%d)", breed_name, queue:tostring2(unittostring), max_unit_count)

		local frozen_goid = Managers.state.unit_storage.frozen_bimap_goid_unit

		for _, unit in pairs(queue.queue) do
			Unit.set_frozen(unit, false)

			local pos = Unit.local_position(unit, 0)

			QuickDrawer:sphere(pos, 0.5, Color(255, 0, 255))
			Debug.world_text(pos - Vector3(0, 0, 2), tostring(frozen_goid[unit]), Color(255, 0, 255))
			Unit.set_frozen(unit, true)
		end
	end

	local freezer_pos = Vector3Aux.unbox(BreedFreezerSettings.freezer_pos)

	if script_data.debug_breed_freeze then
		freezer_pos = Vector3Aux.unbox(BreedFreezerSettings.freezer_pos_debug)
	end

	local half_extents = 0.5 * Vector3Aux.unbox(BreedFreezerSettings.freezer_size)
	freezer_pos = freezer_pos + half_extents
	local pose = Matrix4x4.from_translation(freezer_pos)

	QuickDrawer:box(pose, half_extents, Color(100, 100, 255))
end

return

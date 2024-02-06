-- chunkname: @scripts/unit_extensions/generic/timed_spawner_extension.lua

TimedSpawnerExtension = class(TimedSpawnerExtension)

local DESTROY_ON_LIMIT_REACHED = true
local RPCS = {
	"rpc_on_timed_spawn",
}

local function get_position_on_nav_mesh(nav_world, position)
	local nav_position = LocomotionUtils.pos_on_mesh(nav_world, position, 1, 1)

	nav_position = nav_position or GwNavQueries.inside_position_from_outside_position(nav_world, position, 6, 6, 8, 0.5)

	return nav_position
end

local function get_next_random_value(seed, t)
	local new_seed, random_index = Math.next_random(seed, 1, #t)

	return new_seed, t[random_index]
end

TimedSpawnerExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._is_server = extension_init_context.is_server
	self._world = extension_init_context.world
	self._unit = unit
	self._network_manager = Managers.state.network
	self._conflict_director = Managers.state.conflict

	local ai_system = Managers.state.entity:system("ai_system")

	self._nav_world = ai_system:nav_world()
	self._unit_storage = extension_init_context.unit_storage
	self.network_transmit = extension_init_context.network_transmit
	self.network_event_delegate = self.network_transmit.network_event_delegate

	self.network_event_delegate:register(self, unpack(RPCS))

	self._spawn_rate = extension_init_data.spawn_rate
	self._spawnable_breeds = extension_init_data.spawnable_breeds
	self._max_spawn_amount = extension_init_data.max_spawn_amount
	self._cb_unit_spawned_function = extension_init_data.cb_unit_spawned_function
	self._seed = Managers.mechanism:get_level_seed()

	local network_time = self._network_manager:network_time()

	self._timer = network_time + self._spawn_rate
	self._spawn_amount = 0
end

TimedSpawnerExtension.extensions_ready = function (self, world, unit)
	return
end

TimedSpawnerExtension.destroy = function (self)
	if self.network_event_delegate then
		self.network_event_delegate:unregister(self)

		self.network_event_delegate = nil
	end
end

TimedSpawnerExtension._can_spawn = function (self, network_time)
	local reached_limit = self._spawn_amount >= self._max_spawn_amount
	local timer_ended = network_time >= self._timer

	return not reached_limit and timer_ended
end

TimedSpawnerExtension.update = function (self, unit, input, dt, context, t)
	if not self._is_server then
		return
	end

	local network_time = self._network_manager:network_time()

	if self:_can_spawn(network_time) then
		self:_spawn_breed()

		local go_id = self._unit_storage:go_id(unit)

		self:rpc_on_timed_spawn(Network.peer_id(), go_id)
		self.network_transmit:send_rpc_clients("rpc_on_timed_spawn", go_id)

		self._spawn_amount = self._spawn_amount + 1
		self._timer = network_time + self._spawn_rate
	end

	local reached_limit = self._spawn_amount >= self._max_spawn_amount

	if DESTROY_ON_LIMIT_REACHED and reached_limit then
		Managers.state.unit_spawner:mark_for_deletion(unit)
	end
end

TimedSpawnerExtension._spawn_breed = function (self)
	local spawner_unit = self._unit
	local position = POSITION_LOOKUP[spawner_unit]
	local nav_position = position and get_position_on_nav_mesh(self._nav_world, position)

	if not position then
		return
	end

	local rotation = Unit.local_rotation(spawner_unit, 0)
	local breed_name

	self._seed, breed_name = get_next_random_value(self._seed, self._spawnable_breeds)

	local breed = Breeds[breed_name]
	local position_box = Vector3Box(nav_position)
	local rotation_box = QuaternionBox(rotation)
	local spawn_category = "misc"
	local spawn_type = "terror_event"
	local optional_data = {
		spawned_func = self._cb_unit_spawned_function,
	}

	self._conflict_director:spawn_queued_unit(breed, position_box, rotation_box, spawn_category, nil, spawn_type, optional_data)
	Managers.state.event:trigger("spawned_timed_breed", spawner_unit)
end

TimedSpawnerExtension.rpc_on_timed_spawn = function (self, sender, go_id)
	local unit = self._unit_storage:unit(go_id)

	if unit ~= self._unit then
		return
	end

	Unit.flow_event(unit, "on_timed_spawn")
end

TimedSpawnerExtension.get_spawn_rate = function (self)
	return self._spawn_rate
end

TimedSpawnerExtension.get_spawnable_breeds = function (self)
	return self._spawnable_breeds
end

TimedSpawnerExtension.get_max_spawn_amount = function (self)
	return self._max_spawn_amount
end

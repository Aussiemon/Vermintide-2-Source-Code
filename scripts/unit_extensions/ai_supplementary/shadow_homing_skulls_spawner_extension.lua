ShadowHomingSkullsSpawnerExtension = class(ShadowHomingSkullsSpawnerExtension)
local DESTROY_AFTER_IDLE_SECONDS = 10
local TARGET_ATTEMPT_COOLDOWN = 1
local LAUNCH_DELAY = 2
local MIN_LAUNCH_DELAY = 0
local MAX_LAUNCH_DELAY = 1.5
local LAUNCH_DELAY_DELTA = 0.3
local Z_OFFSET_RAYCAST = 1
local LINE_OF_SIGHT_COLLISION_FILTER = "filter_ai_line_of_sight_check"

local function spawn_skull(spawner_unit, from_position, direction, target_unit)
	local teleport_effect = "fx/blk_grey_wings_teleport_01"

	if teleport_effect then
		local effect_name_id = NetworkLookup.effects[teleport_effect]
		local node_id = 0
		local rotation_offset = Quaternion.identity()
		local network_manager = Managers.state.network

		network_manager:rpc_play_particle_effect(nil, effect_name_id, NetworkConstants.invalid_game_object_id, node_id, from_position, rotation_offset, false)
	end

	local spawn_pos = POSITION_LOOKUP[spawner_unit]
	local optional_data = {
		prepare_func = function (breed, extension_init_data)
			local is_husk = false

			breed:modify_extension_init_data(is_husk, extension_init_data)
		end
	}
	local rotation = Quaternion.look(direction, Vector3.up())

	return Managers.state.conflict:spawn_queued_unit(Breeds.shadow_skull, Vector3Box(from_position), QuaternionBox(rotation), "mutator", "spawn_idle", "terror_event", optional_data)
end

local function check_if_in_line_of_sight(physics_world, unit, from, to)
	local dir = to - from
	local dist = Vector3.length(dir)
	dir = Vector3.normalize(dir)
	local collision_filter = LINE_OF_SIGHT_COLLISION_FILTER
	local hit, hit_position, _, _, hit_actor = PhysicsWorld.raycast(physics_world, from, dir, dist, "closest", "collision_filter", collision_filter)
	local hit_unit = hit and Actor.unit(hit_actor)

	return not hit or hit_unit == unit
end

local function get_launch_position(target_position, own_position)
	return own_position
end

local function shuffled_players(side)
	local players = side.PLAYER_AND_BOT_UNITS
	local unit_list = {}

	for i = 1, #players, 1 do
		local unit = players[i]

		if ALIVE[unit] and ScriptUnit.extension(unit, "health_system"):is_alive() then
			unit_list[#unit_list + 1] = unit
		end
	end

	table.shuffle(unit_list)

	return unit_list
end

local STATES = {
	INITIAL = "INITIAL",
	COOLDOWN_FROM_TARGETTING = "COOLDOWN_FROM_TARGETTING",
	FINDING_TARGET = "FINDING_TARGET",
	DONE = "DONE",
	WAITING_TO_SPAWN_SKULLS = "WAITING_TO_SPAWN_SKULLS",
	SPAWNING_SKULL = "SPAWNING_SKULL"
}

ShadowHomingSkullsSpawnerExtension.init = function (self, extension_init_context, unit, extension_init_data)
	local world = extension_init_context.world
	self.world = world
	self.physics_world = World.get_data(world, "physics_world")
	self.unit = unit
	self.is_server = Managers.player.is_server
	self._limitted_spawner = extension_init_data.limitted_spawner
	self._hero_side = Managers.state.side:get_side_from_name("heroes")
	self._state = STATES.INITIAL
end

ShadowHomingSkullsSpawnerExtension.destroy = function (self)
	return
end

ShadowHomingSkullsSpawnerExtension.on_remove_extension = function (self, unit, extension_name)
	return
end

ShadowHomingSkullsSpawnerExtension.update = function (self, unit, input, dt, context, t)
	if self._done then
		return
	end

	if not self.is_server then
		return
	end

	if not self._own_position then
		self._own_position = Vector3Box(Unit.local_position(unit, 0))
	end

	if self._tracked_player and not ALIVE[self._tracked_player] then
		self._state = STATES.FINDING_TARGET
		self._finding_target_since = t
	end

	if self._state == STATES.INITIAL then
		self._state = STATES.FINDING_TARGET
		self._finding_target_since = t
	elseif self._state == STATES.COOLDOWN_FROM_TARGETTING then
		if self._next_t < t then
			self._state = STATES.FINDING_TARGET
		end
	elseif self._state == STATES.FINDING_TARGET then
		self._tracked_player = nil
		local players = shuffled_players(self._hero_side)

		for i = 1, #players, 1 do
			local random_player = players[i]
			local target_position = POSITION_LOOKUP[random_player] + Vector3(0, 0, Z_OFFSET_RAYCAST)
			local own_position = self._own_position
			local launch_position = get_launch_position(target_position, own_position:unbox())
			local physics_world = self.physics_world

			if check_if_in_line_of_sight(physics_world, random_player, launch_position, target_position) then
				self._tracked_player = random_player

				break
			end
		end

		if self._tracked_player then
			self._state = STATES.WAITING_TO_SPAWN_SKULLS
			self._next_t = t + LAUNCH_DELAY
		elseif t > self._finding_target_since + DESTROY_AFTER_IDLE_SECONDS then
			self._state = STATES.DONE
		else
			self._state = STATES.COOLDOWN_FROM_TARGETTING
			self._next_t = t + TARGET_ATTEMPT_COOLDOWN
		end
	elseif self._state == STATES.WAITING_TO_SPAWN_SKULLS then
		local target_position = POSITION_LOOKUP[self._tracked_player] + Vector3(0, 0, Z_OFFSET_RAYCAST)
		local own_position = self._own_position
		local launch_position = get_launch_position(target_position, own_position:unbox())
		self._launch_position = launch_position
		local physics_world = self.physics_world

		if not check_if_in_line_of_sight(physics_world, self._tracker_player, launch_position, target_position) then
			self._state = STATES.COOLDOWN_FROM_TARGETTING
			self._next_t = t + TARGET_ATTEMPT_COOLDOWN
			self._target_decal = nil
		end

		if self._next_t < t then
			local delay_range = MAX_LAUNCH_DELAY - MIN_LAUNCH_DELAY
			local delay_range_deltas = delay_range / LAUNCH_DELAY_DELTA
			local random_delay = math.floor(math.random() * delay_range_deltas) * LAUNCH_DELAY_DELTA
			self._next_t = t + MIN_LAUNCH_DELAY + random_delay
			self._state = STATES.SPAWNING_SKULL
		end
	elseif self._state == STATES.SPAWNING_SKULL then
		if self._next_t < t then
			local own_position = self._own_position
			local launch_position = own_position:unbox()
			local target_position = POSITION_LOOKUP[self._tracked_player] + Vector3(0, 0, Z_OFFSET_RAYCAST)
			local direction = target_position - launch_position
			direction = Vector3.normalize(direction)

			spawn_skull(self.unit, launch_position, direction)

			self._state = STATES.DONE
		end
	elseif self._state == STATES.DONE and not self._destroyed and Unit.alive(unit) then
		Managers.state.unit_spawner:mark_for_deletion(unit)

		self._destroyed = true
	end
end

return

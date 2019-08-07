require("scripts/utils/hero_spawner_handler")

SpawnManager = class(SpawnManager)
local NUM_PLAYERS = 8

SpawnManager.init = function (self, world, is_server, network_event_delegate, unit_spawner, profile_synchronizer, network_server, checkpoint_data)
	self.world = world
	self.spawn_points = {}
	self.last_spawn_point = 0
	self._is_server = is_server
	self._spawning = true
	self.new_spawns = {}
	self.unit_spawner = unit_spawner
	self.num_new_spawns = 0
	local game_mode_manager = Managers.state.game_mode
	self._game_mode = game_mode_manager:game_mode()
	self.hero_spawner_handler = HeroSpawnerHandler:new(is_server, profile_synchronizer, network_event_delegate)
	self._bot_profile_release_list = {}
	self._spawn_list = {}
	self._available_profile_order = {}
	self._available_profiles = {}
	self._bot_players = {}
	self._delayed_bot_despawn_list = {}
	self._game_objects_to_remove = {}
	self._profile_synchronizer = profile_synchronizer
	self._network_server = network_server
	self._network_event_delegate = network_event_delegate
	self._disable_spawning_reason_filter = {}
	self._checkpoint_data = nil
	self._respawns_enabled = true
	self._despawn_queue = {}
	self._despawn_queue_size = 0
end

SpawnManager.destroy = function (self)
	self.hero_spawner_handler:destroy()
	assert(self._despawn_queue_size == 0, "Players left to despawn when the spawn manager is destroyed")
end

SpawnManager._default_player_statuses = function (self)
	local game_mode_settings = Managers.state.game_mode:settings()
	local num_slots = game_mode_settings.team_a_num_slots or NUM_PLAYERS
	local statuses = {}

	for i = 1, num_slots, 1 do
		local status = {
			temporary_health_percentage = 0,
			spawn_state = "not_spawned",
			health_percentage = 1,
			health_state = "alive",
			last_update = -math.huge,
			consumables = {},
			ammo = {
				slot_ranged = 1,
				slot_melee = 1
			}
		}
		statuses[i] = status
	end

	return statuses
end

SpawnManager._spawn_pos_rot_from_index = function (self, index)
	local spawn_point = self.spawn_points[index]
	local position = spawn_point.pos:unbox()
	local rotation = spawn_point.rot:unbox()

	return position, rotation
end

SpawnManager.flow_callback_set_checkpoint = function (self, no_spawn_volume, safe_zone_volume_name, ...)
	if not self._is_server then
		print("calling flow_callback_set_checkpoint on client.")

		return
	end

	local mission_data = Managers.state.entity:system("mission_system"):create_checkpoint_data()
	local pickup_data = Managers.state.entity:system("pickup_system"):create_checkpoint_data()
	local level_analysis_data = Managers.state.conflict.level_analysis:create_checkpoint_data()
	local networked_flow_state_data = Managers.state.networked_flow_state:create_checkpoint_data()
	self._checkpoint_data = {
		player_statuses = self:_clone_player_status(self._player_statuses),
		spawns = self:_pack_spawn_unit_level_indices(...),
		no_spawn_volume = no_spawn_volume,
		safe_zone_volume_name = safe_zone_volume_name,
		pickup = pickup_data,
		level_analysis = level_analysis_data,
		mission = mission_data,
		networked_flow_state = networked_flow_state_data
	}
end

SpawnManager.load_checkpoint_data = function (self, data)
	self._checkpoint_data = data
	local statuses = self:_clone_player_status(data.player_statuses)
	local level = LevelHelper:current_level(self.world)

	for i, unit_index in ipairs(data.spawns) do
		local unit = Level.unit_by_index(level, unit_index)
		local pos = Unit.local_position(unit, 0)
		local rot = Unit.local_rotation(unit, 0)
		local status = statuses[i]

		if status.position and status.rotation then
			status.position:store(pos)
			status.rotation:store(rot)
		else
			status.position = Vector3Box(pos)
			status.rotation = QuaternionBox(rot)
		end
	end

	self._player_statuses = statuses
end

SpawnManager.checkpoint_data = function (self)
	return self._checkpoint_data
end

SpawnManager._clone_player_status = function (self, t)
	local clone = {}

	for key, value in pairs(t) do
		if type(value) == "table" then
			clone[key] = self:_clone_player_status(value)
		elseif key == "position" then
			clone[key] = Vector3Box(value:unbox())
		elseif key == "rotation" then
			clone[key] = QuaternionBox(value:unbox())
		else
			clone[key] = value
		end
	end

	return clone
end

SpawnManager._pack_spawn_unit_level_indices = function (self, ...)
	local return_table = {}
	local level = LevelHelper:current_level(self.world)

	for i, unit in ipairs({
		...
	}) do
		local level_index = Level.unit_index(level, unit)
		return_table[i] = level_index
	end

	return return_table
end

SpawnManager.pre_update = function (self, dt, t)
	if self._despawn_queue_size > 0 then
		self:_update_despawns()
	end
end

SpawnManager.delayed_despawn = function (self, player)
	local despawn_queue = self._despawn_queue
	self._despawn_queue_size = self._despawn_queue_size + 1
	despawn_queue[self._despawn_queue_size] = player

	player:mark_as_queued_for_despawn()
end

SpawnManager._update_despawns = function (self)
	local despawn_queue = self._despawn_queue

	for i = self._despawn_queue_size, 1, -1 do
		local player = despawn_queue[i]

		player:despawn()

		despawn_queue[i] = nil
	end

	self._despawn_queue_size = 0
end

return

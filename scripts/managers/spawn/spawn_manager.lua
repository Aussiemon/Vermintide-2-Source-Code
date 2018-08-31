require("scripts/utils/hero_spawner_handler")
require("scripts/managers/spawn/respawn_handler")

SpawnManager = class(SpawnManager)
local NUM_PLAYERS = 4
local NUM_PROFILE_INDICES = #SPProfiles
local CONSUMABLE_SLOTS = {
	"slot_healthkit",
	"slot_potion",
	"slot_grenade"
}
local NUM_CONSUMABLE_SLOTS = #CONSUMABLE_SLOTS
local CONSUMABLES_TEMP = {}

local function netpack_consumables(consumables, temp_table)
	for i = 1, NUM_CONSUMABLE_SLOTS, 1 do
		local slot_name = CONSUMABLE_SLOTS[i]
		temp_table[i] = NetworkLookup.item_names[consumables[slot_name] or "n/a"]
	end
end

local RPCS = {
	"rpc_to_client_respawn_player",
	"rpc_respawn_confirmed"
}

SpawnManager.init = function (self, world, is_server, network_event_delegate, unit_spawner, profile_synchronizer, network_server, checkpoint_data)
	self.world = world
	self.spawn_points = {}
	self.last_spawn_point = 0
	self._is_server = is_server
	self._spawning = true
	self.new_spawns = {}
	self.unit_spawner = unit_spawner
	self.num_new_spawns = 0
	self.hero_spawner_handler = HeroSpawnerHandler:new(is_server, profile_synchronizer, network_event_delegate)
	self._bot_profile_release_list = {}
	self._spawn_list = {}
	self._available_profile_order = {}
	self._available_profiles = {}
	self._bot_players = {}
	self._profile_synchronizer = profile_synchronizer
	self._network_server = network_server
	self._player_statuses = self:_default_player_statuses()
	self.respawn_handler = RespawnHandler:new(world)
	self._network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))

	self._disable_spawning_reason_filter = {}
	self._checkpoint_data = nil
	self._forced_bot_profile_index = nil

	self:_setup_bot_spawn_priority_lookup()

	self._respawns_enabled = true
	self._despawn_queue = {}
	self._despawn_queue_size = 0
end

SpawnManager._setup_bot_spawn_priority_lookup = function (self)
	local saved_priority = PlayerData.bot_spawn_priority
	local num_saved_priority = #saved_priority

	if LAUNCH_MODE == "game" then
		if num_saved_priority > 0 then
			self._bot_profile_id_to_priority_id = {}

			for i = 1, num_saved_priority, 1 do
				local profile_id = saved_priority[i]
				self._bot_profile_id_to_priority_id[profile_id] = i
			end
		else
			self._bot_profile_id_to_priority_id = ProfileIndexToPriorityIndex
		end
	elseif LAUNCH_MODE == "attract_benchmark" then
		self._bot_profile_id_to_priority_id = ProfileIndexToPriorityIndex
	else
		self._bot_profile_id_to_priority_id = ProfileIndexToPriorityIndex
	end
end

SpawnManager.disable_spawning = function (self, set, reason, safe_position, safe_rotation)
	local filter = self._disable_spawning_reason_filter

	if set then
		fassert(not filter[reason], "Trying to set reason already set.")

		filter[reason] = true
		self._spawning = false
	else
		fassert(filter[reason], "Trying to unset reason not set.")

		filter[reason] = nil
		self._spawning = table.is_empty(filter)

		self:_force_update_spawn_positions(safe_position, safe_rotation)
	end
end

SpawnManager._force_update_spawn_positions = function (self, safe_position, safe_rotation)
	local statuses = self._player_statuses

	for i = 1, NUM_PLAYERS, 1 do
		local status = statuses[i]

		status.position:store(safe_position)
		status.rotation:store(safe_rotation)
	end
end

SpawnManager.destroy = function (self)
	self.respawn_handler:destroy()
	self.hero_spawner_handler:destroy()

	if self._is_server then
		self:_clear_bots()
	end

	self._network_event_delegate:unregister(self)
end

SpawnManager._default_player_statuses = function (self)
	local settings = Managers.state.difficulty:get_difficulty_settings()
	local gamemode_settings = Managers.state.game_mode:settings()
	local statuses = {}

	for i = 1, NUM_PLAYERS, 1 do
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

		if not gamemode_settings.disable_difficulty_spawning_items then
			local consumables = status.consumables

			for i = 1, NUM_CONSUMABLE_SLOTS, 1 do
				local slot_name = CONSUMABLE_SLOTS[i]
				consumables[slot_name] = settings[slot_name]
			end
		end

		statuses[i] = status
	end

	return statuses
end

SpawnManager.flow_callback_add_spawn_point = function (self, unit)
	local pos = Unit.local_position(unit, 0)
	local rot = Unit.local_rotation(unit, 0)
	local spawn_point = {
		pos = Vector3Box(pos),
		rot = QuaternionBox(rot)
	}
	self.spawn_points[#self.spawn_points + 1] = spawn_point
	local statuses = self._player_statuses

	for i = 1, NUM_PLAYERS, 1 do
		local status = statuses[i]

		if not status.position then
			status.position = Vector3Box(pos)
			status.rotation = QuaternionBox(rot)

			break
		end
	end
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

SpawnManager.spawn_unit = function (self, spawn_data, position, rotation)
	if LEVEL_EDITOR_TEST then
		local pose = Application.get_data("camera")
		local pos = Matrix4x4.translation(pose)
		local rot = Matrix4x4.rotation(pose)

		return self:_spawn_unit_at_pos_rot(spawn_data, pos, rot)
	else
		local camera_fwd_vector = Quaternion.forward(rotation)
		local camera_flat_rot = Quaternion.look(Vector3.flat(camera_fwd_vector), Vector3.up())

		return self:_spawn_unit_at_pos_rot(spawn_data, position, camera_flat_rot)
	end
end

SpawnManager.set_forced_bot_profile_index = function (self, profile_index)
	self._forced_bot_profile_index = profile_index
end

SpawnManager._spawn_unit_at_pos_rot = function (self, spawn_data, pos, rot)
	local unit_name = spawn_data.unit_name
	local unit_template_name = spawn_data.unit_template_name
	local extension_init_data = spawn_data.extension_init_data
	local unit = nil
	local unit_spawner = Managers.state.unit_spawner

	if not LEVEL_EDITOR_TEST then
		unit = unit_spawner:spawn_network_unit(unit_name, unit_template_name, extension_init_data, pos, rot)

		if self._is_server then
			ScriptUnit.extension(unit, "health_system"):sync_health_state()
		end
	else
		unit = unit_spawner:spawn_local_unit_with_extensions(unit_name, unit_template_name, extension_init_data, pos, rot)
	end

	local world = self.world

	LevelHelper:flow_event(world, "player_unit_spawned")

	return unit
end

SpawnManager.update = function (self, dt, t)
	self.hero_spawner_handler:update(dt, t)

	if self._is_server and Managers.state.network:game() then
		self:_update_player_status(dt, t)

		local allow_respawns = Managers.state.difficulty:get_difficulty_settings().allow_respawns

		if self._respawns_enabled and allow_respawns then
			self.respawn_handler:update(dt, t, self._player_statuses)
		end

		local level_settings = LevelHelper:current_level_settings()

		if not level_settings.no_bots_allowed and not LEVEL_EDITOR_TEST then
			self:_update_bot_spawns(dt, t)
		end

		self:_update_spawning(dt, t)

		if self._respawns_enabled and allow_respawns then
			self:_update_respawns(dt, t)
		end
	end

	if self._despawn_queue_size > 0 then
		self:_update_despawns()
	end
end

SpawnManager.delayed_despawn = function (self, player)
	local despawn_queue = self._despawn_queue
	self._despawn_queue_size = self._despawn_queue_size + 1
	despawn_queue[self._despawn_queue_size] = player
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

SpawnManager._update_respawns = function (self, dt, t)
	local statuses = self._player_statuses
	local player_manager = Managers.player
	local network_manager = Managers.state.network
	local network_transmit = network_manager.network_transmit

	if self._network_server:has_all_peers_loaded_packages() then
		for i = 1, NUM_PLAYERS, 1 do
			local status = statuses[i]

			if status.health_state == "dead" and status.ready_for_respawn and status.peer_id then
				local respawn_unit = status.respawn_unit or self.respawn_handler:get_respawn_unit()

				if respawn_unit then
					local respawn_unit_id = network_manager:level_object_id(respawn_unit)

					netpack_consumables(status.consumables, CONSUMABLES_TEMP)
					network_transmit:send_rpc("rpc_to_client_respawn_player", status.peer_id, status.local_player_id, status.profile_index, respawn_unit_id, unpack(CONSUMABLES_TEMP))
					table.clear(CONSUMABLES_TEMP)

					status.health_state = "respawning"
					status.respawn_unit = respawn_unit
					status.health_percentage = Managers.state.difficulty:get_difficulty_settings().respawn.health_percentage
					status.temporary_health_percentage = Managers.state.difficulty:get_difficulty_settings().respawn.temporary_health_percentage
				end
			end
		end
	end
end

SpawnManager.rpc_to_client_respawn_player = function (self, sender, local_player_id, profile_index, respawn_unit_id, health_kit_id, potion_id, grenade_id)
	if not Managers.state.network:game() then
		return
	end

	printf("RespawnSystem:rpc_to_client_respawn_player(%s, %s)", tostring(sender), tostring(profile_index))

	local network_manager = Managers.state.network
	local respawn_unit = network_manager:game_object_or_level_unit(respawn_unit_id, true)
	local player_manager = Managers.player
	local player = player_manager:local_player(local_player_id)

	self:_respawn_player(player, profile_index, respawn_unit, NetworkLookup.item_names[health_kit_id], NetworkLookup.item_names[potion_id], NetworkLookup.item_names[grenade_id])
end

SpawnManager._respawn_player = function (self, player, profile_index, respawn_unit, health_kit, potion, grenade)
	player:set_profile_index(profile_index)

	local position = Unit.local_position(respawn_unit, 0)
	local rotation = Unit.local_rotation(respawn_unit, 0)
	local respawn_settings = Managers.state.difficulty:get_difficulty_settings().respawn
	local ammo_melee = respawn_settings.ammo_melee
	local ammo_ranged = respawn_settings.ammo_ranged
	local unit = player:spawn(position, rotation, false, ammo_melee, ammo_ranged, health_kit, potion, grenade)
	local status_extension = ScriptUnit.extension(unit, "status_system")

	status_extension:set_ready_for_assisted_respawn(true, respawn_unit)

	local network_manager = Managers.state.network
	local unit_id = network_manager:unit_game_object_id(unit)
	local respawn_unit_id = network_manager:level_object_id(respawn_unit)

	network_manager.network_transmit:send_rpc_server("rpc_status_change_bool", NetworkLookup.statuses.ready_for_assisted_respawn, true, unit_id, respawn_unit_id)
	network_manager.network_transmit:send_rpc_server("rpc_respawn_confirmed", player:local_player_id())
end

SpawnManager.rpc_respawn_confirmed = function (self, sender, local_player_id)
	local statuses = self._player_statuses

	for i = 1, NUM_PLAYERS, 1 do
		local status = statuses[i]

		if status.peer_id == sender and status.local_player_id == local_player_id then
			status.ready_for_respawn = false

			return
		end
	end
end

SpawnManager._update_player_status = function (self, dt, t)
	local player_manager = Managers.player
	local statuses = self._player_statuses
	local ScriptUnit_extension = ScriptUnit.extension

	for i = 1, NUM_PLAYERS, 1 do
		local status = statuses[i]
		local peer_id = status.peer_id
		local local_player_id = status.local_player_id
		local print_unit = nil

		if peer_id or local_player_id then
			local player = player_manager:player(peer_id, local_player_id)

			if player then
				local player_unit = player.player_unit
				print_unit = player_unit

				if player_unit then
					status.spawn_state = "spawned"
					local safe_position = ScriptUnit_extension(player_unit, "locomotion_system"):last_position_on_navmesh()

					status.position:store(safe_position)
					status.rotation:store(Unit.local_rotation(player_unit, 0))

					local status_extension = ScriptUnit_extension(player_unit, "status_system")
					local old_state = status.health_state
					local is_dead = status_extension:is_dead()

					if is_dead then
						if status.health_state ~= "respawning" then
							status.health_state = "dead"
						end
					elseif status_extension:is_ready_for_assisted_respawn() then
						status.health_state = "respawn"
					elseif status_extension:is_knocked_down() then
						status.health_state = "knocked_down"
					elseif status_extension:is_disabled() and not status_extension:is_in_vortex() and not status_extension:is_grabbed_by_corruptor() and not status_extension:is_grabbed_by_chaos_spawn() and not status_extension:is_overpowered() then
						status.health_state = "disabled"
					else
						status.health_state = "alive"
						local respawn_unit = status.respawn_unit

						if respawn_unit then
							self.respawn_handler:set_respawn_unit_available(respawn_unit)

							status.respawn_unit = nil
						end
					end

					local health_ext = ScriptUnit_extension(player_unit, "health_system")

					if not is_dead or status.health_state ~= "respawning" then
						status.health_percentage = health_ext:current_permanent_health_percent()
						status.temporary_health_percentage = health_ext:current_temporary_health_percent()
					end

					status.last_update = t
					local inventory = ScriptUnit_extension(player_unit, "inventory_system")
					local consumables = status.consumables

					for i = 1, NUM_CONSUMABLE_SLOTS, 1 do
						local slot_name = CONSUMABLE_SLOTS[i]
						local slot_data = inventory:get_slot_data(slot_name)
						local item_key = slot_data and slot_data.item_data.key

						if item_key ~= nil or consumables[slot_name] ~= nil then
							consumables[slot_name] = item_key
						end
					end
				end
			else
				self:_free_status_slot(i)
			end
		end
	end
end

SpawnManager._free_status_slot = function (self, slot_index)
	local status = self._player_statuses[slot_index]
	status.peer_id = nil
	status.local_player_id = nil
	status.respawn_sent = false
	local health_state = status.health_state

	if health_state == "respawning" or health_state == "respawn" then
		status.health_state = "dead"
		status.ready_for_respawn = true
	end

	local spawn_state = status.spawn_state

	if spawn_state == "spawned" or spawn_state == "spawning" or spawn_state == "spawn" then
		status.spawn_state = "despawned"
	else
		status.spawn_state = "not_spawned"
	end
end

SpawnManager._update_bot_spawns = function (self, dt, t)
	local player_manager = Managers.player
	local profile_synchronizer = self._profile_synchronizer
	local available_profile_order = self._available_profile_order
	local available_profiles = self._available_profiles
	local profile_release_list = self._bot_profile_release_list
	local delta, humans, bots = self:_update_available_profiles(profile_synchronizer, available_profile_order, available_profiles)

	for local_player_id, bot_player in pairs(self._bot_players) do
		local profile_index = bot_player:profile_index()

		if not available_profiles[profile_index] then
			local peer_id = bot_player:network_id()
			local local_player_id = bot_player:local_player_id()
			profile_release_list[profile_index] = true
			local bot_unit = bot_player.player_unit

			if bot_unit then
				bot_player:despawn()
			end

			local status_slot_index = bot_player.status_slot_index

			self:_free_status_slot(status_slot_index)
			player_manager:remove_player(peer_id, local_player_id)

			self._bot_players[local_player_id] = nil
		end
	end

	local allowed_bots = math.min(NUM_PLAYERS - humans, (script_data.ai_bots_disabled and 0) or script_data.cap_num_bots or NUM_PLAYERS)
	local bot_delta = allowed_bots - bots
	local local_peer_id = Network.peer_id()

	if bot_delta > 0 then
		local i = 1
		local bots_spawned = 0

		while bot_delta > bots_spawned do
			local profile_index = available_profile_order[i]
			local profile = SPProfiles[profile_index]

			if not profile.tutorial_profile then
				fassert(profile_index, "Tried to add more bots than there are profiles available")

				local owner_type = profile_synchronizer:owner_type(profile_index)

				if owner_type == "available" then
					local local_player_id = player_manager:next_available_local_player_id(local_peer_id)
					local bot_player = player_manager:add_bot_player(profile.display_name, local_peer_id, "default", profile_index, local_player_id)
					local is_initial_spawn, status_slot_index = self:_assign_status_slot(local_peer_id, local_player_id, profile_index)
					bot_player.status_slot_index = status_slot_index

					profile_synchronizer:set_profile_peer_id(profile_index, local_peer_id, local_player_id)
					bot_player:create_game_object()

					self._bot_players[local_player_id] = bot_player
					self._spawn_list[#self._spawn_list + 1] = bot_player
					bots_spawned = bots_spawned + 1
					self._forced_bot_profile_index = nil
				end
			end

			i = i + 1
		end
	elseif bot_delta < 0 then
		local bots_despawned = 0
		local i = 1

		while bots_despawned < -bot_delta do
			local profile_index = available_profile_order[i]

			fassert(profile_index, "Tried to remove more bots than there are profiles belonging to bots")

			local owner_type = profile_synchronizer:owner_type(profile_index)

			if owner_type == "bot" then
				local bot_player, bot_local_player_id = nil

				for local_player_id, player in pairs(self._bot_players) do
					if player:profile_index() == profile_index then
						bot_player = player
						bot_local_player_id = local_player_id

						break
					end
				end

				fassert(bot_player, "Did not find bot player with profile_index profile_index %i", profile_index)

				profile_release_list[profile_index] = true
				local bot_unit = bot_player.player_unit

				if bot_unit then
					bot_player:despawn()
				end

				local status_slot_index = bot_player.status_slot_index

				self:_free_status_slot(status_slot_index)
				player_manager:remove_player(local_peer_id, bot_local_player_id)

				self._bot_players[bot_local_player_id] = nil
				bots_despawned = bots_despawned + 1
			end

			i = i + 1
		end
	end

	if self._network_server:has_all_peers_loaded_packages() then
		local statuses = self._player_statuses
		local spawn_list = self._spawn_list
		local num_to_spawn = #spawn_list

		for i = 1, num_to_spawn, 1 do
			local bot_player = spawn_list[i]
			local bot_local_player_id = bot_player:local_player_id()
			local bot_peer_id = bot_player:network_id()

			if player_manager:player(bot_peer_id, bot_local_player_id) == bot_player then
				local status_slot_index = bot_player.status_slot_index
				local status = statuses[status_slot_index]
				local position = status.position:unbox()
				local rotation = status.rotation:unbox()
				local is_initial_spawn = false

				if status.health_state ~= "dead" and status.health_state ~= "respawn" and status.health_state ~= "respawning" then
					local consumables = status.consumables
					local ammo = status.ammo

					bot_player:spawn(position, rotation, is_initial_spawn, ammo.slot_melee, ammo.slot_ranged, consumables[CONSUMABLE_SLOTS[1]], consumables[CONSUMABLE_SLOTS[2]], consumables[CONSUMABLE_SLOTS[3]])
				end

				status.spawn_state = "spawned"
			end
		end

		table.clear(spawn_list)
	end
end

SpawnManager.post_unit_destroy_update = function (self)
	if self._is_server then
		local synchronizer = self._profile_synchronizer
		local release_list = self._bot_profile_release_list

		for profile_index, _ in pairs(release_list) do
			synchronizer:set_profile_peer_id(profile_index, nil)
		end

		table.clear(release_list)
	end
end

SpawnManager.all_humans_dead = function (self)
	local statuses = self._player_statuses
	local player_manager = Managers.player

	for i = 1, NUM_PLAYERS, 1 do
		local status = statuses[i]
		local health_state = status.health_state
		local peer_id = status.peer_id
		local local_player_id = status.local_player_id
		local player = peer_id and player_manager:player(peer_id, local_player_id)
		local is_bot = player and player.bot_player

		if health_state ~= "dead" and health_state ~= "respawn" and health_state ~= "respawning" and not is_bot then
			return false
		end
	end

	return true
end

SpawnManager.all_players_disabled = function (self)
	local statuses = self._player_statuses

	for i = 1, NUM_PLAYERS, 1 do
		local status = statuses[i]
		local health_state = status.health_state

		if health_state == "alive" then
			return false
		end
	end

	return true
end

SpawnManager.get_status = function (self, _player)
	local statuses = self._player_statuses
	local player_manager = Managers.player

	for i = 1, NUM_PLAYERS, 1 do
		local status = statuses[i]
		local peer_id = status.peer_id
		local local_player_id = status.local_player_id

		if peer_id or local_player_id then
			local player = player_manager:player(peer_id, local_player_id)

			if player == _player then
				return status.health_state, status.health_percentage, status.temporary_health_percentage, status.ammo.slot_melee, status.ammo.slot_ranged
			end
		end
	end

	return nil
end

SpawnManager.teleport_despawned_players = function (self, position)
	local statuses = self._player_statuses
	local player_manager = Managers.player

	for i = 1, NUM_PLAYERS, 1 do
		local status = statuses[i]
		local peer_id = status.peer_id
		local local_player_id = status.local_player_id
		local player = peer_id and local_player_id and player_manager:player(peer_id, local_player_id)

		if not player or not player.player_unit then
			status.position:store(position)
		end
	end
end

SpawnManager._update_available_profiles = function (self, profile_synchronizer, available_profile_order, available_profiles)
	local delta = 0
	local bots = 0
	local humans = 0
	local order_changed = false

	for profile_index = 1, NUM_PROFILE_INDICES, 1 do
		local owner_type = profile_synchronizer:owner_type(profile_index)

		if owner_type == "human" then
			humans = humans + 1

			if available_profiles[profile_index] then
				local index = table.find(available_profile_order, profile_index)

				table.remove(available_profile_order, index)

				available_profiles[profile_index] = false
				delta = delta - 1
				order_changed = true
			end
		elseif owner_type == "available" or owner_type == "bot" then
			if owner_type == "bot" then
				bots = bots + 1
			end

			if not available_profiles[profile_index] then
				table.insert(available_profile_order, 1, profile_index)

				available_profiles[profile_index] = true
				delta = delta + 1
				order_changed = true
			end
		end
	end

	if order_changed then
		local bot_profile_id_to_priority_id = self._bot_profile_id_to_priority_id

		table.sort(available_profile_order, function (a, b)
			return (bot_profile_id_to_priority_id[a] or math.huge) < (bot_profile_id_to_priority_id[b] or math.huge)
		end)
	end

	if self._forced_bot_profile_index then
		local forced_bot_profile_index = self._forced_bot_profile_index
		local index = table.find(available_profile_order, forced_bot_profile_index)
		local available = (index and profile_synchronizer:owner_type(forced_bot_profile_index) == "available") or false

		fassert(available, "Bot profile (%s) is not available!", SPProfilesAbbreviation[forced_bot_profile_index])

		if index ~= 1 then
			available_profile_order[index] = available_profile_order[1]
			available_profile_order[1] = available_profile_order[index]
		end
	end

	return delta, humans, bots
end

SpawnManager._take_status_slot = function (self, i, peer_id, local_player_id, profile_index)
	local status = self._player_statuses[i]
	local old_peer_id = status.peer_id
	local old_local_player_id = status.local_player_id

	fassert(not old_peer_id and not old_local_player_id, "Trying to take slot that already belongs to %q %q", old_peer_id, old_local_player_id)

	status.peer_id = peer_id
	status.local_player_id = local_player_id
	status.profile_index = profile_index
	status.last_update = 0

	if status.health_state == "disabled" then
		status.health_state = "knocked_down"
		status.health_percentage = 0
		status.temporary_health_percentage = 1
	end
end

SpawnManager._assign_status_slot = function (self, peer_id, local_player_id, profile_index)
	local latest_slot = nil
	local latest_time = -math.huge
	local first_empty, slot_index = nil
	local found_slot = false

	for i = 1, NUM_PLAYERS, 1 do
		local status = self._player_statuses[i]

		if status.peer_id == peer_id and status.local_player_id == local_player_id then
			status.profile_index = profile_index
			found_slot = true
			slot_index = i

			break
		end
	end

	if not found_slot then
		for i = 1, NUM_PLAYERS, 1 do
			local status = self._player_statuses[i]
			local last_update = status.last_update

			if status.profile_index == profile_index then
				fassert(not status.peer_id, "Trying to take slot for profile already in use. old player: %q:%q, new player: %q:%q", status.peer_id, status.local_player_id, peer_id, local_player_id)
				self:_take_status_slot(i, peer_id, local_player_id, profile_index)

				slot_index = i
				found_slot = true

				break
			elseif not first_empty and not status.profile_index then
				first_empty = i
			end

			if not status.peer_id and latest_time < last_update then
				latest_time = last_update
				latest_slot = i
			end
		end
	end

	if not found_slot then
		if latest_slot then
			self:_take_status_slot(latest_slot, peer_id, local_player_id, profile_index)

			slot_index = latest_slot
		elseif first_empty then
			self:_take_status_slot(first_empty, peer_id, local_player_id, profile_index)

			slot_index = first_empty
		end
	end

	if not slot_index then
		table.dump(self._player_statuses, "", 3)
	end

	assert(slot_index, "Did not find status slot index.")

	local ingame_time = Managers.time:time("client_ingame")
	local first_spawn = ingame_time == nil or ingame_time < 10

	return first_spawn, slot_index
end

SpawnManager._find_spawn_point = function (self, status)
	local position, rotation = nil
	local room_manager = Managers.state.room

	if room_manager then
		position, rotation = self:_spawn_pos_rot_from_index(room_manager:get_spawn_point_by_peer(status.peer_id))
	else
		fassert(status.position, "This level is missing spawn-points for the players.")

		position = status.position:unbox()
		rotation = status.rotation:unbox()
	end

	return position, rotation
end

SpawnManager._clear_bots = function (self)
	local local_peer_id = Network.peer_id()
	local synchronizer = self._profile_synchronizer
	local player_manager = Managers.player

	for local_player_id, player in pairs(self._bot_players) do
		local profile_index = player:profile_index()

		player_manager:remove_player(local_peer_id, local_player_id)
		synchronizer:set_profile_peer_id(profile_index, nil)
	end
end

SpawnManager._update_spawning = function (self, dt, t)
	if self._spawning then
		local statuses = self._player_statuses

		for i = 1, NUM_PLAYERS, 1 do
			local status = statuses[i]
			local spawn_state = status.spawn_state

			if spawn_state == "is_initial_spawn" or spawn_state == "spawn" then
				self:_spawn_player(status)
			end
		end
	end
end

SpawnManager._spawn_player = function (self, status)
	local peer_id = status.peer_id
	local local_player_id = status.local_player_id
	local profile_index = status.profile_index
	local position, rotation = self:_find_spawn_point(status)
	local is_initial_spawn = status.spawn_state == "is_initial_spawn"

	netpack_consumables(status.consumables, CONSUMABLES_TEMP)

	local ammo = status.ammo
	local ammo_melee_percent_int = math.floor(ammo.slot_melee * 100)
	local ammo_ranged_percent_int = math.floor(ammo.slot_ranged * 100)
	local session = Managers.state.network:game()

	if session then
		Managers.state.network.network_transmit:send_rpc("rpc_to_client_spawn_player", peer_id, local_player_id, profile_index, position, rotation, is_initial_spawn, ammo_melee_percent_int, ammo_ranged_percent_int, unpack(CONSUMABLES_TEMP))
	end

	table.clear(CONSUMABLES_TEMP)

	status.spawn_state = (is_initial_spawn and "initial_spawning") or "spawning"
end

SpawnManager.ready_to_spawn = function (self, peer_id, local_player_id)
	local spawn_index, position, rotation = nil
	local profile_index = self._profile_synchronizer:profile_by_peer(peer_id, local_player_id)
	local is_initial_spawn, status_slot_index = self:_assign_status_slot(peer_id, local_player_id, profile_index)
	local status = self._player_statuses[status_slot_index]

	if status.health_state == "dead" or status.health_state == "respawn" then
		status.spawn_state = "spawned"

		RPC.rpc_set_observer_camera(peer_id, local_player_id)

		status.respawn_timer = nil
		status.ready_for_respawn = true
	else
		status.spawn_state = (is_initial_spawn and "is_initial_spawn") or "spawn"
	end
end

SpawnManager.set_respawning_enabled = function (self, enabled)
	fassert(self._respawns_enabled ~= enabled, "Respawns already enabled=%s", tostring(enabled))

	self._respawns_enabled = enabled
end

return

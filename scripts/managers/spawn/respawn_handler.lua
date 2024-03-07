-- chunkname: @scripts/managers/spawn/respawn_handler.lua

RespawnHandler = class(RespawnHandler)

local RESPAWN_DISTANCE = 70
local END_OF_LEVEL_BUFFER = 35
local RESPAWN_TIME = 30
local RESPAWN_MOVE_TIME = 10
local RPCS = {
	"rpc_to_client_respawn_player",
	"rpc_respawn_confirmed",
}

RespawnHandler.init = function (self, profile_synchronizer, is_server)
	self._profile_synchronizer = profile_synchronizer
	self._respawn_units = {}
	self._respawn_gate_units = {}
	self._respawn_gate_units_n = 0
	self._respawner_groups = {}
	self._disabled_respawn_groups = {}
	self._active_overridden_units = {}
	self._active_overrides = {}
	self._delayed_respawn_queue = {}
	self._world = Managers.world:world("level_world")
	self._id = 0
	self._path_break_points = {}
	self._boss_door_dist_lookup = {}
	self._next_move_players_t = 0
	self._is_server = is_server
end

RespawnHandler.register_rpcs = function (self, network_event_delegate, network_transmit)
	network_event_delegate:register(self, unpack(RPCS))

	self._network_event_delegate = network_event_delegate
	self._network_transmit = network_transmit
end

RespawnHandler.unregister_rpcs = function (self)
	self._network_event_delegate:unregister(self)

	self._network_event_delegate = nil
	self._network_transmit = nil
end

RespawnHandler.set_respawn_unit_available = function (self, unit)
	local respawn_data = self:find_respawn_data_from_unit(unit)

	if respawn_data then
		respawn_data.available = true
	end
end

RespawnHandler.find_respawn_data_from_unit = function (self, unit)
	local respawn_units = self._respawn_units
	local num_respawn_units = #respawn_units

	for i = 1, num_respawn_units do
		local respawn_data = respawn_units[i]

		if unit == respawn_data.unit then
			return respawn_data
		end
	end

	return nil
end

local function comparator(a, b)
	local distance_a = a.distance_through_level
	local distance_b = b.distance_through_level

	fassert(distance_a, "ctrl-shift-l needs running on loaded level for respawn points")
	fassert(distance_b, "ctrl-shift-l needs running on loaded level for respawn points")

	return distance_a < distance_b
end

RespawnHandler.set_override_respawn_group = function (self, group_id, enable)
	local group_data = self._respawner_groups[group_id]

	if not group_data then
		print("WARNING: Override Player Respawning, bad group-id: '" .. tostring(group_id) .. "'' (not registered).")

		return
	end

	print("Override Player Respawning", group_id, enable)

	local active_overridden = self._active_overridden_units
	local active_overrides = self._active_overrides

	if enable then
		active_overrides[group_id] = true

		for unit, respawn_data in pairs(group_data) do
			active_overridden[unit] = respawn_data
		end
	else
		active_overrides[group_id] = nil

		for unit, respawn_data in pairs(group_data) do
			active_overridden[unit] = nil
		end
	end
end

RespawnHandler.set_respawn_group_enabled = function (self, respawn_group_name, enabled)
	print("Setting player respawning group enabled", respawn_group_name, enabled)

	local disabled_respawn_groups = self._disabled_respawn_groups

	if not enabled then
		disabled_respawn_groups[respawn_group_name] = true
	else
		disabled_respawn_groups[respawn_group_name] = nil
	end
end

RespawnHandler.set_respawn_gate_enabled = function (self, respawn_gate_unit, enabled)
	print("Setting player respawning gate enabled", enabled)

	local respawn_gate_units = self._respawn_gate_units

	for i = 1, self._respawn_gate_units_n do
		local gate = respawn_gate_units[i]

		if gate.unit == respawn_gate_unit then
			print("gate at travel distance set enabled", gate.distance_through_level, enabled)

			gate.enabled = enabled

			return
		end
	end
end

RespawnHandler.respawn_unit_spawned = function (self, unit)
	local distance_through_level = Unit.get_data(unit, "distance_through_level")
	local group_id = Unit.get_data(unit, "respawn_group_id")

	self._id = self._id + 1

	local respawn_data = {
		available = true,
		id = self._id,
		unit = unit,
		distance_through_level = distance_through_level,
		group_id = group_id,
	}

	self._respawn_units[#self._respawn_units + 1] = respawn_data

	table.sort(self._respawn_units, comparator)

	if group_id and group_id ~= "" then
		local group_data = self._respawner_groups[group_id]

		if not group_data then
			group_data = {}
			self._respawner_groups[group_id] = group_data
		end

		respawn_data.group_data = group_data
		group_data[unit] = respawn_data

		print("respawn_unit_spawned with group id:", group_id)
	end
end

RespawnHandler.respawn_gate_unit_spawned = function (self, unit)
	local distance_through_level = Unit.get_data(unit, "distance_through_level")
	local enabled = Unit.get_data(unit, "gate_enabled")
	local gate_data = {
		unit = unit,
		distance_through_level = distance_through_level,
		enabled = enabled,
	}

	self._respawn_gate_units_n = self._respawn_gate_units_n + 1
	self._respawn_gate_units[self._respawn_gate_units_n] = gate_data

	table.sort(self._respawn_gate_units, comparator)
end

RespawnHandler.remove_respawn_units_due_to_crossroads = function (self, removed_path_distances, total_main_path_length)
	local debug_respawners = script_data.debug_player_respawns
	local up = Vector3(0, 0, 1.5)
	local to_remove = {}
	local num_removed_dist_pairs = #removed_path_distances
	local respawners = self._respawn_units

	for i = 1, #respawners do
		local respawner = respawners[i]
		local travel_dist = respawner.distance_through_level

		for j = 1, num_removed_dist_pairs do
			local dist_pair = removed_path_distances[j]

			if travel_dist >= dist_pair[1] - 1 and travel_dist <= dist_pair[2] + 1 then
				to_remove[#to_remove + 1] = i

				if respawner.group_data then
					respawner.group_data[respawner.unit] = nil
					self._active_overridden_units[respawner.unit] = nil
				end

				break
			end
		end
	end

	local groups = self._respawner_groups

	for i = #to_remove, 1, -1 do
		if debug_respawners then
			local data = respawners[to_remove[i]]
			local pos = Unit.local_position(data.unit, 0) + up

			QuickDrawerStay:sphere(pos, 0.33, Color(255, 0, 70))

			local s = string.format("respawer removed, old-dist: %d", data.distance_through_level)

			Debug.world_sticky_text(pos + up, s, "yellow")
		end

		table.remove(respawners, to_remove[i])

		to_remove[i] = nil
	end
end

RespawnHandler.recalc_respawner_dist_due_to_crossroads = function (self)
	local respawners = self._respawn_units
	local unit_local_position = Unit.local_position

	for i = 1, #respawners do
		local respawner = respawners[i]
		local best_point, best_travel_dist, move_percent, best_sub_index, best_main_path = MainPathUtils.closest_pos_at_main_path(nil, unit_local_position(respawner.unit, 0))

		respawner.distance_through_level = best_travel_dist
	end
end

RespawnHandler.update = function (self, dt, t)
	local respawn_queue = self._delayed_respawn_queue
	local queue_size = #respawn_queue
	local is_server = self._is_server

	for i = queue_size, 1, -1 do
		local respawn_data = respawn_queue[i]
		local player = respawn_data[1]
		local status = respawn_data[9]
		local current_slot_player = is_server and Managers.player:player(status.peer_id, status.local_player_id)

		if is_server and current_slot_player ~= player then
			local data = status.game_mode_data

			data.health_state = "dead"

			table.swap_delete(respawn_queue, i)
			print("Player changed before respawn queue was being processed, resetting state to dead.", status.peer_id, status.local_player_id)
		elseif player then
			local player_unit = player.player_unit

			if player_unit == nil or not Unit.alive(player_unit) then
				self:_respawn_player(unpack(respawn_data))
				table.swap_delete(respawn_queue, i)
			end
		else
			table.swap_delete(respawn_queue, i)
		end
	end
end

RespawnHandler._check_all_synced = function (self)
	if not self._all_synced_checked then
		self._all_synced_checked = true
		self._all_synced = self._profile_synchronizer:all_synced()
	end

	return self._all_synced
end

RespawnHandler.server_update = function (self, dt, t, slots)
	self._all_synced_checked = false
	self._all_synced = false

	local any_player_respawned = false

	for i = 1, #slots do
		local status = slots[i]
		local data = status.game_mode_data
		local is_dead = data.health_state == "dead"

		if is_dead then
			if not data.ready_for_respawn and not data.respawn_timer then
				local peer_id = status.peer_id
				local local_player_id = status.local_player_id
				local respawn_time = Development.parameter("fast_respawns") and 2 or Managers.mechanism:setting("hero_respawn_time") or RESPAWN_TIME

				if peer_id and local_player_id then
					local player = Managers.player:player(peer_id, local_player_id)
					local player_unit = player.player_unit

					if player_unit and Unit.alive(player_unit) then
						local buff_extension = ScriptUnit.extension(player_unit, "buff_system")

						respawn_time = buff_extension:apply_buffs_to_value(respawn_time, "faster_respawn")
					end
				end

				data.respawn_timer = t + respawn_time
			elseif not data.ready_for_respawn and t > data.respawn_timer then
				data.respawn_timer = nil
				data.ready_for_respawn = true
			end
		elseif data.respawn_timer then
			data.respawn_timer = nil
		end

		if is_dead and data.ready_for_respawn and status.peer_id and self:_check_all_synced() then
			local data_respawn_unit = data.respawn_unit
			local respawn_unit_to_use

			if data_respawn_unit and Unit.alive(data_respawn_unit) then
				respawn_unit_to_use = data_respawn_unit
			else
				respawn_unit_to_use = self:find_best_respawn_point(true, false)
			end

			if respawn_unit_to_use then
				local own_peer_id = Network.peer_id()
				local difficulty_settings = Managers.state.difficulty:get_difficulty_settings()

				data.health_state = "respawning"
				data.respawn_unit = respawn_unit_to_use
				data.health_percentage = difficulty_settings.respawn.health_percentage
				data.temporary_health_percentage = difficulty_settings.respawn.temporary_health_percentage

				if own_peer_id == status.peer_id then
					local player = Managers.player:player(status.peer_id, status.local_player_id)
					local profile_index = status.profile_index
					local career_index = status.career_index
					local additional_items = data.additional_items
					local health_kit = data.consumables.slot_health_kit
					local potion = data.consumables.slot_potion
					local grenade = data.consumables.slot_grenade

					if data.spawn_state == "spawned" then
						self:_delayed_respawn_player(player, profile_index, career_index, respawn_unit_to_use, health_kit, potion, grenade, additional_items, status)
					else
						self:_respawn_player(player, profile_index, career_index, respawn_unit_to_use, health_kit, potion, grenade, additional_items)
					end
				else
					local respawn_unit_id = Managers.state.network:level_object_id(respawn_unit_to_use)
					local network_consumables = SpawningHelper.netpack_consumables(data.consumables)
					local healthkit_id, potion_id, grenade_id = unpack(network_consumables)
					local network_additional_items = SpawningHelper.netpack_additional_items(data.additional_items)

					Managers.state.network.network_transmit:send_rpc("rpc_to_client_respawn_player", status.peer_id, status.local_player_id, status.profile_index, status.career_index, respawn_unit_id, i, healthkit_id, potion_id, grenade_id, network_additional_items)
				end
			end
		elseif self._move_players and data.health_state == "respawn" and self:_check_all_synced() then
			local current_respawn_unit = data.respawn_unit
			local current_respawn_data = self:find_respawn_data_from_unit(current_respawn_unit)

			if current_respawn_data and not self:_is_respawn_reachable(current_respawn_data) or self._force_move then
				local peer_id = status.peer_id
				local local_player_id = status.local_player_id

				if peer_id and local_player_id then
					local player = Managers.player:player(peer_id, local_player_id)
					local player_unit = player.player_unit
					local player_unit_id = Managers.state.network:unit_game_object_id(player_unit)
					local locomotion_extension = ScriptUnit.extension(player_unit, "locomotion_system")
					local new_respawn_unit = self:find_best_respawn_point(true, false)
					local position = Unit.local_position(new_respawn_unit, 0)
					local rotation = Unit.local_rotation(new_respawn_unit, 0)

					LocomotionUtils.enable_linked_movement(self._world, player_unit, new_respawn_unit, 0, Vector3.zero())
					locomotion_extension:teleport_to(position, rotation)
					Managers.state.network.network_transmit:send_rpc_clients("rpc_teleport_unit_to", player_unit_id, position, rotation)
					self:set_respawn_unit_available(current_respawn_unit)

					data.respawn_unit = new_respawn_unit
				end
			end
		end

		any_player_respawned = any_player_respawned or data.health_state == "respawn"
	end

	if self._move_players and self:_check_all_synced() then
		self._move_players = false
		self._force_move = false
	elseif any_player_respawned and t > self._next_move_players_t then
		self._next_move_players_t = t + RESPAWN_MOVE_TIME
		self._move_players = true
	end
end

RespawnHandler.set_move_dead_players_to_next_respawn = function (self, value)
	self._move_players = value
end

RespawnHandler.queue_force_move_dead_players = function (self)
	self._move_players = true
	self._force_move = true
end

local BOSS_TERROR_EVENT_LOOKUP = {
	boss_event_chaos_spawn = true,
	boss_event_chaos_troll = true,
	boss_event_minotaur = true,
	boss_event_rat_ogre = true,
	boss_event_storm_fiend = true,
}

RespawnHandler.destroy = function (self)
	return
end

RespawnHandler.get_active_respawn_units = function (self)
	local respawn_units = self._respawn_units
	local active_respawn_units = {}

	for i = 1, #respawn_units do
		local respawn_data = respawn_units[i]

		if not respawn_data.available then
			active_respawn_units[#active_respawn_units + 1] = respawn_data.unit
		end
	end

	return active_respawn_units
end

RespawnHandler.rpc_to_client_respawn_player = function (self, channel_id, local_player_id, profile_index, career_index, respawn_unit_id, slot_index, health_kit_id, potion_id, grenade_id, network_additional_items)
	local peer_id = CHANNEL_TO_PEER_ID[channel_id]

	printf("RespawnSystem:rpc_to_client_respawn_player(%s, %s)", tostring(peer_id), tostring(profile_index))

	local network_manager = Managers.state.network
	local respawn_unit = network_manager:game_object_or_level_unit(respawn_unit_id, true)
	local player_manager = Managers.player
	local player = player_manager:local_player(local_player_id)
	local additional_items = SpawningHelper.unnetpack_additional_items(network_additional_items)

	if player:needs_despawn() or Unit.alive(player.player_unit) then
		Managers.state.spawn:delayed_despawn(player)
		self:_delayed_respawn_player(player, profile_index, career_index, respawn_unit, NetworkLookup.item_names[health_kit_id], NetworkLookup.item_names[potion_id], NetworkLookup.item_names[grenade_id], additional_items)
	else
		self:_respawn_player(player, profile_index, career_index, respawn_unit, NetworkLookup.item_names[health_kit_id], NetworkLookup.item_names[potion_id], NetworkLookup.item_names[grenade_id], additional_items)
	end
end

RespawnHandler._respawn_player = function (self, player, profile_index, career_index, respawn_unit, health_kit, potion, grenade, additional_items)
	player:set_profile_index(profile_index)
	player:set_career_index(career_index)

	local position = Unit.local_position(respawn_unit, 0)
	local rotation = Unit.local_rotation(respawn_unit, 0)
	local respawn_settings = Managers.state.difficulty:get_difficulty_settings().respawn
	local ammo_melee = respawn_settings.ammo_melee
	local ammo_ranged = respawn_settings.ammo_ranged
	local ability_cooldown_percent_int = 0
	local unit = player:spawn(position, rotation, false, ammo_melee, ammo_ranged, health_kit, potion, grenade, ability_cooldown_percent_int, additional_items)
	local status_extension = ScriptUnit.extension(unit, "status_system")

	status_extension:set_ready_for_assisted_respawn(true, respawn_unit)

	local network_manager = Managers.state.network
	local unit_id = network_manager:unit_game_object_id(unit)
	local respawn_unit_id = network_manager:level_object_id(respawn_unit)

	network_manager.network_transmit:send_rpc_server("rpc_status_change_bool", NetworkLookup.statuses.ready_for_assisted_respawn, true, unit_id, respawn_unit_id)
	network_manager.network_transmit:send_rpc_server("rpc_respawn_confirmed", player:local_player_id())
end

RespawnHandler.rpc_respawn_confirmed = function (self, channel_id, local_player_id)
	local peer_id = CHANNEL_TO_PEER_ID[channel_id]
	local status = Managers.party:get_player_status(peer_id, local_player_id)

	status.game_mode_data.ready_for_respawn = false
end

RespawnHandler.force_respawn_dead_players = function (self, party)
	local occupied_slots = party.occupied_slots

	for i = 1, #occupied_slots do
		local status = occupied_slots[i]
		local data = status.game_mode_data

		data.respawn_timer = 0
	end
end

RespawnHandler._delayed_respawn_player = function (self, player, profile_index, career_index, respawn_unit, health_kit, potion, grenade, additional_items, status)
	local respawn_entry = {
		player,
		profile_index,
		career_index,
		respawn_unit,
		health_kit,
		potion,
		grenade,
		additional_items,
		status,
	}

	table.insert(self._delayed_respawn_queue, respawn_entry)
end

RespawnHandler.is_respawn_enabled = function (self, respawn_point)
	local active_overridden = self._active_overridden_units

	if next(active_overridden) then
		return active_overridden[respawn_point.unit]
	end

	return not self._disabled_respawn_groups[respawn_point.group_id]
end

RespawnHandler.is_spawn_group_override_active = function (self, group_id)
	return self._active_overrides[group_id]
end

RespawnHandler.get_boss_door_dist = function (self, main_paths, door_unit)
	local door_dist = self._boss_door_dist_lookup[door_unit]

	if door_dist then
		return door_dist
	end

	local door_position = Unit.world_position(door_unit, 0)
	local _, door_travel_dist = MainPathUtils.closest_pos_at_main_path(main_paths, door_position)

	self._boss_door_dist_lookup[door_unit] = door_travel_dist

	return door_travel_dist
end

RespawnHandler.get_next_boss_door_dist = function (self, main_path_info, ahead_unit_travel_dist)
	local main_paths = main_path_info.main_paths
	local conflict = Managers.state.conflict
	local enemy_recycler = conflict.enemy_recycler
	local current_terror_event = enemy_recycler.main_path_events[enemy_recycler.current_main_path_event_id]
	local current_terror_event_type = current_terror_event and current_terror_event[3]
	local has_upcoming_boss_terror_event = BOSS_TERROR_EVENT_LOOKUP[current_terror_event_type]
	local current_terror_event_travel_dist = enemy_recycler.current_main_path_event_activation_dist
	local door_system = Managers.state.entity:system("door_system")
	local boss_door_units = door_system:get_boss_door_units()
	local closest_door_dist = math.huge
	local closest_boss_door_travel_dist = math.huge
	local closest_terror_door_dist = math.huge
	local closest_terror_door_travel_dist = math.huge

	for i = 1, #boss_door_units do
		local door_unit = boss_door_units[i]
		local door_travel_dist = self:get_boss_door_dist(main_paths, door_unit)
		local dist_to_door = door_travel_dist - ahead_unit_travel_dist

		if dist_to_door < closest_door_dist and dist_to_door >= 0 then
			local door_extension = ScriptUnit.extension(door_unit, "door_system")
			local door_state = door_extension.current_state

			if door_state and door_state == "closed" then
				closest_door_dist = dist_to_door
				closest_boss_door_travel_dist = door_travel_dist
			end
		end

		if has_upcoming_boss_terror_event then
			local dist_to_terror_door = door_travel_dist - current_terror_event_travel_dist

			if dist_to_terror_door >= 0 and dist_to_terror_door < closest_terror_door_dist then
				closest_terror_door_dist = dist_to_door
				closest_terror_door_travel_dist = door_travel_dist
			end
		end
	end

	return math.min(closest_boss_door_travel_dist, closest_terror_door_travel_dist)
end

RespawnHandler.get_next_respawn_gate_dist = function (self, ahead_unit_travel_dist)
	local respawn_gate_units = self._respawn_gate_units

	for i = 1, self._respawn_gate_units_n do
		local gate = respawn_gate_units[i]

		if gate.enabled and ahead_unit_travel_dist < gate.distance_through_level then
			return gate.distance_through_level
		end
	end

	return math.huge
end

RespawnHandler.get_main_path_segment_start = function (self, main_path_info)
	local current_path_index = main_path_info.current_path_index
	local current_path_segment = main_path_info.main_paths[current_path_index]
	local current_path_nodes_dist = current_path_segment.travel_dist

	return current_path_nodes_dist[1]
end

RespawnHandler.get_behind_unit_segment_start = function (self, main_path_info)
	local behind_unit = main_path_info.behind_unit

	if ALIVE[behind_unit] then
		local behind_unit_position = Unit.local_position(behind_unit, 0)
		local _, _, _, _, path_index = MainPathUtils.closest_pos_at_main_path(nil, behind_unit_position, nil)
		local behind_path_segment = main_path_info.main_paths[path_index]
		local behind_path_nodes_dist = behind_path_segment.travel_dist

		return behind_path_nodes_dist[1]
	end

	return 0
end

RespawnHandler.get_respawn_dist_range = function (self, main_path_info, ahead_unit_travel_dist)
	local min_dist = self:get_main_path_segment_start(main_path_info)
	local max_dist = math.huge
	local next_boss_door_dist = self:get_next_boss_door_dist(main_path_info, ahead_unit_travel_dist)

	max_dist = math.min(max_dist, next_boss_door_dist)

	local get_next_respawn_gate_dist = self:get_next_respawn_gate_dist(ahead_unit_travel_dist)

	max_dist = math.min(max_dist, get_next_respawn_gate_dist)

	return min_dist, max_dist
end

RespawnHandler._is_respawn_reachable = function (self, respawn_data)
	if not respawn_data then
		return false
	end

	local main_path_info = Managers.state.conflict.main_path_info
	local min_dist = self:get_behind_unit_segment_start(main_path_info)
	local respawn_unit_dist = respawn_data.distance_through_level

	return respawn_unit_dist >= min_dist - 0.01
end

RespawnHandler.find_best_respawn_point = function (self, reserve_best, evaluate_all)
	local main_path_info = Managers.state.conflict.main_path_info
	local ahead_unit_travel_dist = main_path_info.ahead_travel_dist
	local preferred_spawn_travel_dist = ahead_unit_travel_dist + RESPAWN_DISTANCE
	local min_dist, max_dist = self:get_respawn_dist_range(main_path_info, ahead_unit_travel_dist)
	local respawn_units = self._respawn_units
	local override_respawn_units = self._active_overridden_units
	local has_overrides = next(override_respawn_units) ~= nil
	local disabled_respawn_groups = self._disabled_respawn_groups
	local best_respawn
	local best_score = 0

	for i = 1, #respawn_units do
		local respawn_data = respawn_units[i]
		local respawn_dist = respawn_data.distance_through_level
		local score = 0

		if respawn_data.available then
			if override_respawn_units[respawn_data.unit] then
				score = 3
			elseif not disabled_respawn_groups[respawn_data.group_id] and respawn_dist <= max_dist then
				if not has_overrides and preferred_spawn_travel_dist <= respawn_dist then
					score = 3
				elseif ahead_unit_travel_dist <= respawn_dist then
					score = 2
				elseif min_dist <= respawn_dist then
					score = 1
				end
			end
		end

		if not best_respawn or best_score < score or best_score == score and (score < 3 and respawn_dist > best_respawn.distance_through_level and respawn_dist < preferred_spawn_travel_dist or score >= 3 and respawn_dist < best_respawn.distance_through_level) then
			best_score = score
			best_respawn = respawn_data

			if not evaluate_all and (score >= 3 or max_dist < respawn_dist) then
				break
			end
		end
	end

	if best_respawn then
		if reserve_best then
			best_respawn.available = false
		end

		local best_respawn_unit = best_respawn.unit

		if has_overrides and not override_respawn_units[best_respawn_unit] then
			print("[RespawnHandler] Overrides active, but no respawn units available, falling back to noraml respawn point.")
			print(string.format("[RespawnHandler] min_dist %.2f, max_dist %.2f, ahead_unit_travel_dist %.2f", min_dist, max_dist, ahead_unit_travel_dist))
			print("[RespawnHandler] Active Override:")

			for name in pairs(self._active_overrides) do
				print(name)
			end
		end

		if not evaluate_all then
			print(string.format("[RespawnHandler] Picking spawn point at %.2f, params: min_dist %.2f, max_dist %.2f, ahead_unit_travel_dist %.2f", best_respawn.distance_through_level, min_dist, max_dist, ahead_unit_travel_dist))

			local ahead_unit = main_path_info.ahead_unit

			print("[RespawnHandler] Ahead player position", POSITION_LOOKUP[ahead_unit])
		end

		return best_respawn_unit
	end

	return nil
end

RespawnHandler = class(RespawnHandler)
local RESPAWN_DISTANCE = 70
local END_OF_LEVEL_BUFFER = 35
local RESPAWN_TIME = 30
local RPCS = {
	"rpc_to_client_respawn_player",
	"rpc_respawn_confirmed"
}

RespawnHandler.init = function (self, profile_synchronizer)
	self._profile_synchronizer = profile_synchronizer
	self._respawn_units = {}
	self._respawner_groups = {}
	self._active_overridden_units = {}
	self._delayed_respawn_queue = {}
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
	local respawn_units = self._respawn_units
	local num_respawn_units = #respawn_units

	for i = 1, num_respawn_units, 1 do
		local respawn_data = respawn_units[i]

		if unit == respawn_data.unit then
			respawn_data.available = true

			break
		end
	end
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

	if enable then
		for unit, respawn_data in pairs(group_data) do
			active_overridden[unit] = respawn_data
		end
	else
		for unit, respawn_data in pairs(group_data) do
			active_overridden[unit] = nil
		end
	end
end

RespawnHandler.respawn_unit_spawned = function (self, unit)
	local distance_through_level = Unit.get_data(unit, "distance_through_level")
	local group_id = Unit.get_data(unit, "respawn_group_id")
	local respawn_data = {
		available = true,
		unit = unit,
		distance_through_level = distance_through_level
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

RespawnHandler.debug_draw_respaners = function (self)
	local up = Vector3(0, 0, 1)
	local respawners = self._respawn_units
	local unit_local_position = Unit.local_position

	for i = 1, #respawners, 1 do
		local respawner = respawners[i]
		local best_point, best_travel_dist, move_percent, best_sub_index, best_main_path = MainPathUtils.closest_pos_at_main_path(nil, unit_local_position(respawner.unit, 0))
		local pos = unit_local_position(respawner.unit, 0) + up

		QuickDrawerStay:sphere(pos, 0.53, Color(255, 200, 0))

		local s = string.format("respawer %d, dist: %.1f, newdist: %.1f", i, respawner.distance_through_level, best_travel_dist)

		Debug.world_sticky_text(pos, s, "yellow")
	end
end

RespawnHandler.remove_respawn_units_due_to_crossroads = function (self, removed_path_distances, total_main_path_length)
	local debug_respawners = script_data.debug_player_respawns
	local up = Vector3(0, 0, 1.5)
	local to_remove = {}
	local num_removed_dist_pairs = #removed_path_distances
	local respawners = self._respawn_units

	for i = 1, #respawners, 1 do
		local respawner = respawners[i]
		local travel_dist = respawner.distance_through_level

		for j = 1, num_removed_dist_pairs, 1 do
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

	for i = 1, #respawners, 1 do
		local respawner = respawners[i]
		local best_point, best_travel_dist, move_percent, best_sub_index, best_main_path = MainPathUtils.closest_pos_at_main_path(nil, unit_local_position(respawner.unit, 0))
		respawner.distance_through_level = best_travel_dist
	end
end

RespawnHandler.update = function (self, dt, t)
	local respawn_queue = self._delayed_respawn_queue
	local queue_size = #respawn_queue

	for i = queue_size, 1, -1 do
		local respawn_data = respawn_queue[i]
		local player = respawn_data[1]

		if player then
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

RespawnHandler.server_update = function (self, dt, t, slots)
	local profile_synchronizer = self._profile_synchronizer
	local all_synced = profile_synchronizer:all_synced()

	for i = 1, #slots, 1 do
		local status = slots[i]
		local data = status.game_mode_data

		if data.health_state == "dead" and not data.ready_for_respawn and not data.respawn_timer then
			local peer_id = status.peer_id
			local local_player_id = status.local_player_id
			local respawn_time = (Development.parameter("fast_respawns") and 2) or RESPAWN_TIME

			if peer_id or local_player_id then
				local player = Managers.player:player(peer_id, local_player_id)
				local player_unit = player.player_unit

				if Unit.alive(player_unit) then
					local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
					respawn_time = buff_extension:apply_buffs_to_value(respawn_time, "faster_respawn")
				end
			end

			data.respawn_timer = t + respawn_time
		elseif data.health_state == "dead" and not data.ready_for_respawn and data.respawn_timer < t then
			data.respawn_timer = nil
			data.ready_for_respawn = true
		elseif data.health_state ~= "dead" and data.respawn_timer then
			data.respawn_timer = nil
		end

		if all_synced and data.health_state == "dead" and data.ready_for_respawn and status.peer_id then
			local data_respawn_unit = data.respawn_unit
			local respawn_unit = self:get_respawn_unit()
			local respawn_unit_to_use = nil

			if data_respawn_unit and Unit.alive(data_respawn_unit) then
				respawn_unit_to_use = data_respawn_unit
			else
				respawn_unit_to_use = respawn_unit
			end

			if respawn_unit_to_use then
				local respawn_unit_id = Managers.state.network:level_object_id(respawn_unit_to_use)
				local network_consumables = SpawningHelper.netpack_consumables(data.consumables)

				Managers.state.network.network_transmit:send_rpc("rpc_to_client_respawn_player", status.peer_id, status.local_player_id, status.profile_index, status.career_index, respawn_unit_id, unpack(network_consumables))

				data.health_state = "respawning"
				data.respawn_unit = respawn_unit_to_use
				data.health_percentage = Managers.state.difficulty:get_difficulty_settings().respawn.health_percentage
				data.temporary_health_percentage = Managers.state.difficulty:get_difficulty_settings().respawn.temporary_health_percentage
			end
		end
	end
end

local BOSS_TERROR_EVENT_LOOKUP = {
	boss_event_chaos_spawn = true,
	boss_event_storm_fiend = true,
	boss_event_chaos_troll = true,
	boss_event_minotaur = true,
	boss_event_rat_ogre = true
}

RespawnHandler.get_respawn_unit = function (self)
	local respawn_units = self._respawn_units
	local active_overridden = self._active_overridden_units

	if next(active_overridden) then
		for unit, respawn_data in pairs(active_overridden) do
			if respawn_data.available then
				respawn_data.available = false

				print("Returning override respawn unit")

				return respawn_data.unit
			end
		end

		print("No available overriden respawning units found!")

		return nil
	end

	local conflict = Managers.state.conflict
	local level_analysis = conflict.level_analysis
	local main_paths = level_analysis:get_main_paths()
	local ahead_position = POSITION_LOOKUP[conflict.main_path_info.ahead_unit]

	if not ahead_position then
		return
	end

	local _, ahead_unit_travel_dist = MainPathUtils.closest_pos_at_main_path(main_paths, ahead_position)
	local total_path_dist = MainPathUtils.total_path_dist()
	local ahead_pos = MainPathUtils.point_on_mainpath(main_paths, ahead_unit_travel_dist + RESPAWN_DISTANCE)

	if not ahead_pos then
		print("respawner: far ahead not found, using spawner behind")

		ahead_pos = MainPathUtils.point_on_mainpath(main_paths, total_path_dist - END_OF_LEVEL_BUFFER)

		fassert(ahead_pos, "Cannot find point on mainpath to respawn cage")
	end

	local path_pos, wanted_respawn_travel_dist = MainPathUtils.closest_pos_at_main_path(main_paths, ahead_pos)
	local door_system = Managers.state.entity:system("door_system")
	local boss_door_units = door_system:get_boss_door_units()
	local enemy_recycler = conflict.enemy_recycler
	local current_terror_event = enemy_recycler.main_path_events[enemy_recycler.current_main_path_event_id]
	local current_terror_event_type = current_terror_event and current_terror_event[3]
	local has_upcoming_boss_terror_event = BOSS_TERROR_EVENT_LOOKUP[current_terror_event_type]
	local current_terror_event_travel_dist = enemy_recycler.current_main_path_event_activation_dist
	local boss_door_between_travel_dist = nil
	local closest_boss_door_travel_dist = 0
	local closest_door_dist = math.huge
	local has_close_boss_door = nil

	for i = 1, #boss_door_units, 1 do
		local door_unit = boss_door_units[i]
		local door_position = Unit.world_position(door_unit, 0)
		local door_extension = ScriptUnit.extension(door_unit, "door_system")
		local door_state = door_extension.current_state
		local _, door_travel_dist = MainPathUtils.closest_pos_at_main_path(main_paths, door_position)
		local dist_to_door = door_travel_dist - ahead_unit_travel_dist

		if closest_door_dist > dist_to_door and dist_to_door >= 0 and ((door_state and door_state == "closed") or (has_upcoming_boss_terror_event and current_terror_event_travel_dist < door_travel_dist)) then
			closest_door_dist = dist_to_door
			closest_boss_door_travel_dist = door_travel_dist
			has_close_boss_door = true
		end
	end

	local num_spawners = #respawn_units
	local greatest_distance = 0
	local selected_unit_index = nil

	for i = 1, num_spawners, 1 do
		local respawn_data = respawn_units[i]

		if respawn_data.available then
			local distance_through_level = respawn_data.distance_through_level

			if has_close_boss_door then
				if wanted_respawn_travel_dist <= distance_through_level and distance_through_level < closest_boss_door_travel_dist then
					selected_unit_index = i

					break
				elseif greatest_distance < distance_through_level and distance_through_level < closest_boss_door_travel_dist then
					selected_unit_index = i
					greatest_distance = distance_through_level
				end
			elseif wanted_respawn_travel_dist <= distance_through_level then
				selected_unit_index = i

				break
			elseif greatest_distance < distance_through_level then
				selected_unit_index = i
				greatest_distance = distance_through_level
			end
		end
	end

	if not selected_unit_index then
		return nil
	end

	local respawn_data = respawn_units[selected_unit_index]
	local selected_unit = respawn_data.unit
	respawn_data.available = false

	return selected_unit
end

RespawnHandler.destroy = function (self)
	return
end

RespawnHandler.get_active_respawn_units = function (self)
	local respawn_units = self._respawn_units
	local active_respawn_units = {}

	for i = 1, #respawn_units, 1 do
		local respawn_data = respawn_units[i]

		if not respawn_data.available then
			active_respawn_units[#active_respawn_units + 1] = respawn_data.unit
		end
	end

	return active_respawn_units
end

RespawnHandler.rpc_to_client_respawn_player = function (self, sender, local_player_id, profile_index, career_index, respawn_unit_id, health_kit_id, potion_id, grenade_id)
	if not Managers.state.network:game() then
		return
	end

	printf("RespawnSystem:rpc_to_client_respawn_player(%s, %s)", tostring(sender), tostring(profile_index))

	local network_manager = Managers.state.network
	local respawn_unit = network_manager:game_object_or_level_unit(respawn_unit_id, true)
	local player_manager = Managers.player
	local player = player_manager:local_player(local_player_id)

	if player:needs_despawn() or Unit.alive(player.player_unit) then
		Managers.state.spawn:delayed_despawn(player)
		self:_delayed_respawn_player(player, profile_index, career_index, respawn_unit, NetworkLookup.item_names[health_kit_id], NetworkLookup.item_names[potion_id], NetworkLookup.item_names[grenade_id])
	else
		self:_respawn_player(player, profile_index, career_index, respawn_unit, NetworkLookup.item_names[health_kit_id], NetworkLookup.item_names[potion_id], NetworkLookup.item_names[grenade_id])
	end
end

RespawnHandler._respawn_player = function (self, player, profile_index, career_index, respawn_unit, health_kit, potion, grenade)
	player:set_profile_index(profile_index)
	player:set_career_index(career_index)

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

RespawnHandler.rpc_respawn_confirmed = function (self, sender, local_player_id)
	local status = Managers.party:get_player_status(sender, local_player_id)
	status.game_mode_data.ready_for_respawn = false
end

RespawnHandler.force_respawn_dead_players = function (self, party)
	local occupied_slots = party.occupied_slots

	for i = 1, #occupied_slots, 1 do
		local status = occupied_slots[i]
		local data = status.game_mode_data
		data.respawn_timer = 0
	end
end

RespawnHandler._delayed_respawn_player = function (self, player, profile_index, career_index, respawn_unit, health_kit, potion, grenade)
	local respawn_entry = {
		player,
		profile_index,
		career_index,
		respawn_unit,
		health_kit,
		potion,
		grenade
	}

	table.insert(self._delayed_respawn_queue, respawn_entry)
end

return

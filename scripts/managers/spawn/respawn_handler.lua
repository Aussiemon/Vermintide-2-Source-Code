RespawnHandler = class(RespawnHandler, ExtensionSystemBase)
local RESPAWN_DISTANCE = 70
local END_OF_LEVEL_BUFFER = 35
local RESPAWN_TIME = 30

RespawnHandler.init = function (self)
	self._respawnable_players = {}
	self._respawn_units = {}
	self._respawner_groups = {}
	self._active_overridden_units = {}
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

local ready_players = {}

RespawnHandler.update = function (self, dt, t, player_statuses)
	for _, status in ipairs(player_statuses) do
		if status.health_state == "dead" and not status.ready_for_respawn and not status.respawn_timer then
			local peer_id = status.peer_id
			local local_player_id = status.local_player_id
			local respawn_time = (Development.parameter("fast_respawns") and 2) or RESPAWN_TIME

			if peer_id or local_player_id then
				local player = Managers.player:player(peer_id, local_player_id)
				local player_unit = player.player_unit

				if Unit.alive(player_unit) then
					local buff_extension = ScriptUnit.extension(player_unit, "buff_system")
					respawn_time = buff_extension:apply_buffs_to_value(respawn_time, StatBuffIndex.FASTER_RESPAWN)
				end
			end

			status.respawn_timer = t + respawn_time
		elseif status.health_state == "dead" and not status.ready_for_respawn and status.respawn_timer < t then
			status.respawn_timer = nil
			status.ready_for_respawn = true
		end
	end
end

RespawnHandler.get_respawn_unit = function (self)
	local respawn_units = self._respawn_units
	local active_overridden = self._active_overridden_units

	if next(active_overridden) then
		for unit, respawn_data in pairs(active_overridden) do
			if respawn_data.available then
				respawn_data.available = false

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

	local path_pos, travel_dist = MainPathUtils.closest_pos_at_main_path(main_paths, ahead_position)
	local total_path_dist = MainPathUtils.total_path_dist()
	local ahead_pos = MainPathUtils.point_on_mainpath(main_paths, travel_dist + RESPAWN_DISTANCE)

	if not ahead_pos then
		print("respawner: far ahead not found, using spawner behind")

		ahead_pos = MainPathUtils.point_on_mainpath(main_paths, total_path_dist - END_OF_LEVEL_BUFFER)

		fassert(ahead_pos, "Cannot find point on mainpath to respawn cage")
	end

	path_pos, travel_dist = MainPathUtils.closest_pos_at_main_path(main_paths, ahead_pos)
	local num_spawners = #respawn_units
	local greatest_distance = 0
	local selected_unit_index = nil

	for i = 1, num_spawners, 1 do
		local respawn_data = respawn_units[i]

		if respawn_data.available then
			local distance_through_level = respawn_data.distance_through_level

			if travel_dist <= distance_through_level then
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

return

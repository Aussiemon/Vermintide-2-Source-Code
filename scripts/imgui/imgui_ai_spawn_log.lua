﻿-- chunkname: @scripts/imgui/imgui_ai_spawn_log.lua

ImguiAISpawnLog = class(ImguiAISpawnLog)

local SHOULD_RELOAD = false

local function format_timestamp(time)
	return string.format("%06.3f", time)
end

local EVENT_TYPE_ID = 1
local TIMESTAMP_ID = 2
local LOCATION_ID = 3
local BREED_ID = 6
local SPAWN_CATEGORY_ID = 7
local SPAWN_TYPE_ID = 8
local QUEUE_ID_ID = 9

ImguiAISpawnLog.init = function (self)
	self._log = {}
	self._player_positions = {}
	self._timeline_slice_size = 1
	self._timeline_slice_end = 1
	self._show_totals = false
	self._visualize_locations = false
	self._sticky_hover = false
	self._keep_on_screen = false
	self._live_log = true
	self._live_log_size = 20
	self._segment_distance_sq = 25
	self._event_type_names = {
		"queued",
		"canceled",
		"spawned",
	}
	self._specials_only = false
	self._drawer = nil
	self._hero_side = nil
	self._totals = {}
	self._hovered_id = -1
	self._hovered_time = -1

	self:register_events()
end

ImguiAISpawnLog.register_events = function (self)
	local event_manager = Managers.state.event

	if event_manager then
		event_manager:register(self, "spawn_log_queue", "log_queue")
		event_manager:register(self, "spawn_log_spawn", "log_spawn")
	end
end

ImguiAISpawnLog.unregister_events = function (self)
	local event_manager = Managers.state.event

	if event_manager then
		event_manager:unregister("spawn_log_queue", self)
		event_manager:unregister("spawn_log_spawn", self)
	end
end

ImguiAISpawnLog.update = function (self)
	if SHOULD_RELOAD then
		self:unregister_events()
		self:init()

		SHOULD_RELOAD = false
	end

	local game_time = Managers.time:time("game")

	if not game_time then
		self:_reset()

		return
	end

	if not self._drawer then
		self:_init_session()
	end

	self:_log_player_positions(game_time)

	if self._visualize_locations and self._drawer then
		self:_visualise_player_pos()
	end
end

ImguiAISpawnLog.is_persistent = function (self)
	return self._keep_on_screen
end

ImguiAISpawnLog.draw = function (self)
	local game_time = Managers.time:time("game")

	if not game_time then
		return
	end

	local do_close = Imgui.begin_window("AI Spawn Log")

	if Imgui.button("Export Log") then
		self:_export_log_data()
	end

	self._show_totals = Imgui.checkbox("Show Totals", self._show_totals)
	self._keep_on_screen = Imgui.checkbox("Keep On Screen", self._keep_on_screen)
	self._visualize_locations = Imgui.checkbox("Visualize Locaitons", self._visualize_locations)
	self._sticky_hover = Imgui.checkbox("Sticky Hover", self._sticky_hover)
	self._live_log = Imgui.checkbox("Live Log", self._live_log)
	self._specials_only = Imgui.checkbox("Specials Only", self._specials_only)

	if self._live_log then
		self._timeline_end = game_time
	end

	self._timeline_slice_size = Imgui.slider_float("Capture Size", self._timeline_slice_size, 1, 120)
	self._timeline_end = math.max(self._timeline_end, self._timeline_slice_size)
	self._timeline_end = Imgui.slider_float("Capture Location", self._timeline_end, self._timeline_slice_size, game_time)

	if self._show_totals then
		Imgui.begin_window("AI Spawn Totals")

		if Imgui.button("Export") then
			self:_export_recap_data()
		end

		local arg_c = #self._event_type_names
		local legend_format = "Legend -" .. string.rep(" %s,", arg_c)

		Imgui.text(string.format(legend_format, unpack(self._event_type_names)))

		local format = "%32s -" .. string.rep(" %d,", arg_c)

		for name, counts in pairs(self._totals) do
			Imgui.text(string.format(format, name, unpack(counts)))
		end

		Imgui.end_window()
	end

	if Imgui.button("Clear") then
		self:_clear()
	end

	Imgui.separator()

	local type_names = self._event_type_names
	local vislualize = self._visualize_locations
	local visualize_color = Color(255, 0, 0)
	local normal_color = {
		255,
		255,
		255,
	}
	local selected_color = {
		255,
		0,
		0,
	}
	local filter_specials = self._specials_only
	local segment_start = self._timeline_end - self._timeline_slice_size
	local segment_end = self._timeline_end
	local hovered_id = self._sticky_hover and self._hovered_id or -1
	local hovered_time = self._sticky_hover and self._hovered_time or -1
	local last_hovered_id = self._hovered_id

	for line_id = 1, #self._log do
		local line = self._log[line_id]
		local timestamp = line[TIMESTAMP_ID]

		if segment_start <= timestamp and timestamp <= segment_end then
			local breed = line[BREED_ID]

			if not filter_specials or breed and breed.special then
				local text = format_timestamp(timestamp)
				local type_id = line[EVENT_TYPE_ID]
				local type = type_names[type_id]

				text = text .. " " .. type

				local breed_name = breed and breed.name

				text = text .. " " .. tostring(breed_name)

				local spawn_category = line[SPAWN_CATEGORY_ID]

				text = text .. " " .. tostring(spawn_category)

				local spawn_type = line[SPAWN_TYPE_ID]

				text = text .. " " .. tostring(spawn_type)

				local queue_id = line[QUEUE_ID_ID]

				text = text .. " " .. tostring(queue_id)

				local is_selected = last_hovered_id == queue_id
				local color = is_selected and selected_color or normal_color

				Imgui.text_colored(text, color[1], color[2], color[3], 255)

				if Imgui.is_item_hovered() then
					hovered_id = queue_id
					hovered_time = timestamp
				end

				if vislualize and self._drawer and (last_hovered_id == -1 or hovered_id == queue_id) then
					local location = Vector3(line[LOCATION_ID], line[LOCATION_ID + 1], line[LOCATION_ID + 2])

					self._drawer:sphere(location, 1, visualize_color)

					if is_selected then
						self._drawer:line(location, location + Vector3(0, 0, 25), visualize_color)
					end
				end
			end
		end
	end

	self._hovered_id = hovered_id
	self._hovered_time = hovered_time

	Imgui.end_window("AI Spawn Log")

	return do_close
end

ImguiAISpawnLog.log_queue = function (self, ...)
	self:_log_event(1, ...)
end

ImguiAISpawnLog.log_queue_cancel = function (self, ...)
	self:_log_event(2, ...)
end

ImguiAISpawnLog.log_spawn = function (self, ...)
	self:_log_event(3, ...)
end

ImguiAISpawnLog._log_event = function (self, event_type, boxed_location, breed, spawn_category, spawn_type, spawn_queue_id)
	local location = boxed_location and boxed_location:unbox()
	local game_time = Managers.time:time("game")
	local entry = {
		event_type,
		game_time,
		location and location.x or 0,
		location and location.y or 0,
		location and location.z or 0,
		breed,
		spawn_category,
		spawn_type,
		spawn_queue_id,
	}

	if breed then
		if not self._totals[breed.name] then
			self._totals[breed.name] = {}

			for i = 1, #self._event_type_names do
				self._totals[breed.name][i] = 0
			end
		end

		self._totals[breed.name][event_type] = self._totals[breed.name][event_type] + 1
	end

	table.insert(self._log, 1, entry)
end

ImguiAISpawnLog._clear = function (self)
	self._log = {}
	self._player_positions = {}
	self._totals = {}
end

ImguiAISpawnLog._reset = function (self)
	self._drawer = nil
	self._hero_side = nil

	self:_clear()
end

ImguiAISpawnLog._init_session = function (self)
	local state = Managers.state

	if state then
		self:register_events()

		self._drawer = state.debug:drawer({
			mode = "immediate",
			name = "ImguiAISpawnLog",
		})

		local side = state.side:get_side_from_name("heroes")

		self._hero_side = side
	end
end

ImguiAISpawnLog._log_player_positions = function (self, game_time)
	local hero_side = self._hero_side

	if hero_side then
		local hero_units = hero_side.PLAYER_AND_BOT_UNITS
		local hero_positions = hero_side.PLAYER_AND_BOT_POSITIONS
		local dist_tolerence = self._segment_distance_sq

		for i = 1, #hero_units do
			local unit = hero_units[i]
			local position = hero_positions[i]

			if not self._player_positions[unit] then
				self._player_positions[unit] = {
					game_time,
					position.x,
					position.y,
					position.z,
				}
			else
				local recorded_player_pos = self._player_positions[unit]
				local last_pos_id = #recorded_player_pos
				local x, y, z = recorded_player_pos[last_pos_id - 2], recorded_player_pos[last_pos_id - 1], recorded_player_pos[last_pos_id]
				local dist_sq = Vector3.distance_squared(position, Vector3(x, y, z))

				if dist_tolerence <= dist_sq then
					recorded_player_pos[last_pos_id + 1] = game_time
					recorded_player_pos[last_pos_id + 2] = position.x
					recorded_player_pos[last_pos_id + 3] = position.y
					recorded_player_pos[last_pos_id + 4] = position.z
				end
			end
		end
	end
end

ImguiAISpawnLog._visualise_player_pos = function (self)
	local segment_start = self._timeline_end - self._timeline_slice_size
	local segment_end = self._timeline_end
	local player_color = Color(0, 255, 0)
	local hovered_player_color = Color(255, 255, 0)
	local hovered_time = self._hovered_time

	for unit, positions in pairs(self._player_positions) do
		local start_id = 1
		local end_id = 1

		for i = 1, #positions, 4 do
			local timestamp = positions[i]

			if timestamp < segment_start then
				start_id = i
				end_id = i
			elseif segment_end < timestamp then
				end_id = i

				break
			else
				end_id = i
			end
		end

		for i = start_id, end_id, 4 do
			local location = Vector3(positions[i + 1], positions[i + 2], positions[i + 3])

			self._drawer:sphere(location, 1, player_color)

			if end_id >= i + 4 then
				local next_location = Vector3(positions[i + 5], positions[i + 6], positions[i + 7])

				self._drawer:arrow_2d(location, next_location, player_color)

				if hovered_time >= positions[i] and hovered_time <= positions[i + 4] then
					local interp_t = (hovered_time - positions[i]) / (positions[i + 4] - positions[i])
					local interp_loc = Vector3.lerp(location, next_location, interp_t)

					self._drawer:sphere(interp_loc, 1, hovered_player_color)
					self._drawer:line(interp_loc, interp_loc + Vector3(0, 0, 25), hovered_player_color)
				end
			end
		end
	end
end

ImguiAISpawnLog._export_recap_data = function (self)
	local output = "Breed,Faction,Count"

	for name, counts in pairs(self._totals) do
		local breed = Breeds[name]
		local faction = breed and breed.race or "unknown"

		output = output .. "\n"
		output = output .. name .. ","
		output = output .. faction .. ","
		output = output .. tostring(counts[3])
	end

	Clipboard.put(output)
end

ImguiAISpawnLog._export_log_data = function (self)
	local type_names = self._event_type_names
	local output = "Breed,Faction,Spawn Category,Spawn Type"

	for line_id = 1, #self._log do
		local line = self._log[line_id]
		local type_id = line[EVENT_TYPE_ID]
		local type = type_names[type_id]

		if type == "spawned" then
			output = output .. "\n"

			local breed = line[BREED_ID]
			local breed_name = breed and breed.name or "unknown"
			local faction = breed and breed.race or "unknown"

			output = output .. breed_name .. ","
			output = output .. faction .. ","

			local spawn_category = line[SPAWN_CATEGORY_ID]

			output = output .. tostring(spawn_category) .. ","

			local spawn_type = line[SPAWN_TYPE_ID]

			output = output .. tostring(spawn_type)
		end
	end

	Clipboard.put(output)
end

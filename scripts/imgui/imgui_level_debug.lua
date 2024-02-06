-- chunkname: @scripts/imgui/imgui_level_debug.lua

ImguiLevelDebug = class(ImguiLevelDebug)

local RESPAWN_DISTANCE = 70
local respawn_colors_by_score = {
	{
		255,
		0,
		0,
	},
	{
		255,
		128,
		0,
	},
	{
		255,
		255,
		0,
	},
	{
		0,
		255,
		0,
	},
}
local color_red = {
	255,
	0,
	0,
}
local color_green = {
	0,
	255,
	0,
}
local color_white = {
	255,
	255,
	255,
}
local respawner_text_category = "imgui_respawn_point"

local function text_colored(text, color)
	Imgui.text_colored(text, color[1], color[2], color[3], 255)
end

ImguiLevelDebug.init = function (self)
	self._error = ""
	self._index = 1
	self._search_results = {}
	self._search_text = ""
	self._data = {}
	self._prev_best = {}
	self._unit_level_index = 0
	self._draw_respawn_points = true
	self._show_valid_points_only = false
	self._selected_respawn_unit = nil
end

ImguiLevelDebug.is_persistent = function (self)
	return true
end

ImguiLevelDebug._load_flow_events = function (self)
	local level_transition_handler = Managers.level_transition_handler
	local level_key = level_transition_handler:get_current_level_keys()

	printf("[ImguiLevelDebug] Loading flow events for %s", level_key)

	local level_settings = LevelSettings[level_key]

	if not level_settings then
		return string.format("Level %q not found in LevelSettings.", level_key)
	end

	local base_path = script_data.source_dir

	if not base_path then
		return "script_data.source_dir is nil. Not running from Toolcenter?"
	end

	local path = base_path .. "/" .. level_settings.level_name .. ".level"
	local file, err = io.open(path, "r")

	if not file then
		return "Error opening the file: " .. err
	end

	local lookup = {}

	for line in file:lines() do
		local event_name = string.match(line, "event_name = \"([^\"]+)\"")

		if event_name then
			lookup[event_name] = event_name
		end
	end

	if next(lookup) == nil then
		return "No events found in the level."
	else
		local data = self._data

		table.clear(data)
		table.keys(lookup, data)
		table.sort(data)

		self._data = data
		self._search_results = data
	end

	file:close()

	return ""
end

ImguiLevelDebug.update = function (self)
	return
end

ImguiLevelDebug.draw = function (self)
	local do_close = Imgui.begin_window("Level helper")
	local state = Managers.state
	local game_mode_manager = state and state.game_mode
	local game_mode = game_mode_manager and game_mode_manager:game_mode()
	local respawn_handler = game_mode and game_mode:get_respawn_handler()

	if respawn_handler then
		if Imgui.tree_node("Debug Respawn Points") then
			self:draw_respawn_debug(respawn_handler)
			Imgui.tree_pop()
		else
			Managers.state.debug_text:clear_world_text(respawner_text_category)
		end
	end

	Imgui.end_window()

	return do_close
end

ImguiLevelDebug.draw_flow_debug = function (self)
	if Imgui.button("Load flow events for the current level") then
		self._error = self:_load_flow_events()
	end

	Imgui.same_line()
	Imgui.text_colored(self._error, 255, 100, 100, 255)
	Imgui.separator()

	self._index, self._search_results, self._search_text = ImguiX.combo_search(self._index, self._search_results, self._search_text, self._data)

	if Imgui.button("Run selected flow event") then
		local event_name = self._data[self._index]

		if event_name then
			print("[ImguiLevelDebug] Running event %s", event_name)
			LevelHelper:flow_event(Application.main_world(), event_name)
		end
	end
end

local function get_unit_by_index(idx)
	local world = Managers.world:world("level_world")

	if not world then
		return nil
	end

	local level = LevelHelper:current_level(world)

	if not level then
		return nil
	end

	return Level.unit_by_index(level, idx)
end

ImguiLevelDebug.draw_unit_finder = function (self)
	self._unit_level_index = Imgui.input_int("Level index", self._unit_level_index)

	local ok, unit = pcall(get_unit_by_index, self._unit_level_index)

	if ok and unit and Unit.alive(unit) then
		local Unit = Unit
		local pos_str = tostring(Unit.local_position(unit, 0))

		ImguiX.heading("ID string", "%s", Unit.id_string(unit))
		ImguiX.heading("Level ID", "%s", Unit.level_id_string(unit))
		ImguiX.heading("Debug name", "%q", Unit.debug_name(unit))
		ImguiX.heading("Position", "%s", pos_str)
		Imgui.same_line()

		if Imgui.small_button("Copy to clipboard") then
			Clipboard.put(pos_str)
		end

		ImguiX.heading("Rotation", "%s", tostring(Unit.local_rotation(unit, 0)))
		ImguiX.heading("Scale", "%s", tostring(Unit.local_scale(unit, 0)))
	else
		text_colored("Unit not found or not alive.", color_red)
	end
end

ImguiLevelDebug.draw_respawn_debug = function (self, respawn_handler)
	self._draw_respawn_points = Imgui.checkbox("Draw Respawn Points", self._draw_respawn_points)
	self._show_valid_points_only = Imgui.checkbox("Show Valid Points Only", self._show_valid_points_only)

	local main_path_info = Managers.state.conflict.main_path_info
	local current_path_index = main_path_info.current_path_index
	local ahead_unit_travel_dist = main_path_info.ahead_travel_dist
	local preferred_spawn_travel_dist = ahead_unit_travel_dist + RESPAWN_DISTANCE
	local segment_start_dist = respawn_handler:get_main_path_segment_start(main_path_info, preferred_spawn_travel_dist)
	local next_boss_door = respawn_handler:get_next_boss_door_dist(main_path_info, ahead_unit_travel_dist)
	local next_respawn_gate = respawn_handler:get_next_respawn_gate_dist(ahead_unit_travel_dist)
	local min_dist, max_dist = respawn_handler:get_respawn_dist_range(main_path_info, ahead_unit_travel_dist, preferred_spawn_travel_dist)

	Imgui.separator()
	Imgui.text("Respawn limits:")
	Imgui.separator()
	ImguiX.heading("Segment start", "%.2f", segment_start_dist)
	ImguiX.heading("Next boss door", "%.2f", next_boss_door)
	ImguiX.heading("Next respawn gate", "%.2f", next_respawn_gate)
	ImguiX.heading("Respawn range", "%.2f - %.2f", min_dist, max_dist)
	ImguiX.heading("Ahead dist", "%.2f", ahead_unit_travel_dist)
	ImguiX.heading("Preferred spawn dist", "%.2f", preferred_spawn_travel_dist)
	Imgui.separator()

	if Imgui.tree_node("Active Overrides") then
		local active_respawn_overrides = respawn_handler._active_overrides

		if active_respawn_overrides and next(active_respawn_overrides) then
			for name in pairs(active_respawn_overrides) do
				Imgui.text(name)
			end
		end

		Imgui.tree_pop()
	end

	Imgui.separator()

	if Imgui.tree_node("Disabled Respawner Groups") then
		local disabled_respawn_groups = respawn_handler._disabled_respawn_groups

		if disabled_respawn_groups and next(disabled_respawn_groups) then
			for name in pairs(disabled_respawn_groups) do
				Imgui.text(name)
			end
		end

		Imgui.tree_pop()
	end

	Imgui.separator()
	Imgui.columns(5, true)
	Imgui.text("ID")
	Imgui.next_column()
	Imgui.text("distance")
	Imgui.next_column()
	Imgui.text("group id")
	Imgui.next_column()
	Imgui.text("free")
	Imgui.next_column()
	Imgui.text("reachable")
	Imgui.next_column()
	Imgui.separator()

	local respawn_units = respawn_handler._respawn_units

	if respawn_units then
		local up = Vector3(0, 0, 1)
		local current_best_spawn = respawn_handler:find_best_respawn_point(false, true)
		local respawn_gates = respawn_handler._respawn_gate_units
		local respawn_gates_n = #respawn_gates
		local current_gate_idx = 1
		local boss_door_consumed = false

		if current_best_spawn then
			self._prev_best[current_best_spawn] = true
		end

		for i = 1, #respawn_units do
			local respawn_unit = respawn_units[i]
			local is_best = current_best_spawn == respawn_unit.unit

			if current_gate_idx <= respawn_gates_n then
				local gate = respawn_gates[current_gate_idx]
				local gate_dist = gate.distance_through_level

				if gate_dist < respawn_unit.distance_through_level then
					Imgui.separator()
					Imgui.text("Respawn Gate")
					Imgui.next_column()
					Imgui.text(tostring(gate_dist))
					Imgui.next_column()
					text_colored(tostring(gate.enabled), gate.enabled and color_green or color_red)
					Imgui.next_column()
					Imgui.tree_push(i)

					if Imgui.button("Toggle") then
						Managers.state.game_mode:set_respawn_gate_enabled(gate.unit, not gate.enabled)
					end

					Imgui.tree_pop()
					Imgui.next_column()
					Imgui.separator()

					current_gate_idx = current_gate_idx + 1
				end
			end

			if not boss_door_consumed and next_boss_door < respawn_unit.distance_through_level then
				Imgui.separator()
				Imgui.text("BOSS DOOR")
				Imgui.next_column()
				Imgui.text(tostring(next_boss_door))
				Imgui.next_column()
				Imgui.next_column()
				Imgui.next_column()
				Imgui.next_column()
				Imgui.separator()

				boss_door_consumed = true
			end

			if not self._show_valid_points_only or respawn_unit._score > 0 then
				local was_best = self._prev_best[respawn_unit.unit]

				Imgui.tree_push(i)

				if self._selected_respawn_unit == respawn_unit.unit then
					if Imgui.small_button("-") then
						self._selected_respawn_unit = nil
					end
				elseif Imgui.small_button("+") then
					self._selected_respawn_unit = respawn_unit.unit
				end

				Imgui.tree_pop()
				Imgui.same_line()
				Imgui.text(tostring(respawn_unit.id) .. (is_best and " BEST" or "") .. (was_best and "*" or ""))
				Imgui.next_column()

				local is_free = respawn_unit.available
				local is_enabled = respawn_handler:is_respawn_enabled(respawn_unit)
				local group_active = respawn_handler:is_spawn_group_override_active(respawn_unit.group_id)
				local is_reachable = respawn_handler:_is_respawn_reachable(respawn_unit)
				local spawn_preference_color = respawn_colors_by_score[respawn_unit._score + 1]

				text_colored(tostring(respawn_unit.distance_through_level), spawn_preference_color)
				Imgui.next_column()
				text_colored(tostring(respawn_unit.group_id), group_active and color_green or is_enabled and color_white or color_red)
				Imgui.next_column()
				text_colored(tostring(respawn_unit.available), respawn_unit.available and color_green or color_red)
				Imgui.next_column()
				text_colored(tostring(is_reachable), is_reachable and color_green or color_red)
				Imgui.next_column()
			end

			if self._draw_respawn_points then
				local pos = Unit.local_position(respawn_unit.unit, 0) + up
				local color = is_best and Color(0, 255, 0) or Color(255, 200, 0)

				QuickDrawer:sphere(pos, 0.5, color)

				if self._selected_respawn_unit == respawn_unit.unit then
					local local_player = Managers.player:local_player()
					local player_unit = local_player.player_unit

					if ALIVE[player_unit] then
						QuickDrawer:line(POSITION_LOOKUP[player_unit], pos, Color(255, 0, 255))
					end
				end

				if not self._spawn_point_ids_drawn then
					local text_size = 0.4
					local color_vector = Vector3(255, 255, 255)

					Managers.state.debug_text:output_world_text(string.format("%d %s", respawn_unit.id, respawn_unit.group_id), text_size, pos, nil, respawner_text_category, color_vector)
				end
			elseif self._spawn_point_ids_drawn then
				Managers.state.debug_text:clear_world_text(respawner_text_category)
			end
		end

		self._spawn_point_ids_drawn = self._draw_respawn_points

		Imgui.columns(1)
	end
end

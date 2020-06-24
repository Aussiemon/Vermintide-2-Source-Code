ImguiTeleportTool = class(ImguiTeleportTool)
local SHOULD_RELOAD = true
local EMPTY_LIST = {}

ImguiTeleportTool.init = function (self)
	self._current_level = nil
	self._teleport_name_map = {}
	self._teleport_point_map = {}
	self._filter_text = ""
	self._filtered_teleport_names = {}
	self._filtered_teleport_ids = {}
	self._selected_teleport = 0
	self._register_point_name = ""
	self._register_point_active = false
	self._is_persistent = false
	self._key_bindings = {
		select_down = "down",
		teleport = "home",
		quick_teleport = "home",
		teleport_from_clipboard = "numpad enter",
		confirm = "enter",
		register_new = "insert",
		delete = "delete",
		select_up = "up",
		save_to_clipboatd = "numpad 0"
	}
	self._key_states = {}
	self._rebind_action = nil

	self:_load_points()
	self:_refresh_filter()
end

ImguiTeleportTool.update = function (self)
	if SHOULD_RELOAD then
		self:init()

		SHOULD_RELOAD = false
	end

	local game_mode_manager = Managers.state.game_mode
	local level_key = game_mode_manager and game_mode_manager:level_key()

	if (self._current_level == nil and level_key) or level_key ~= self._current_level then
		self._current_level = level_key

		self:_refresh_filter()
	end
end

ImguiTeleportTool.is_persistent = function (self)
	return self._is_persistent
end

ImguiTeleportTool.draw = function (self, is_open)
	local config_keybinds_popup = false

	Imgui.Begin("Teleport Tool", "always_auto_resize")

	if Imgui.MenuItem("Keybinds") then
		Imgui.OpenPopup("config_keybinds_popup")
	end

	Imgui.Dummy(300, 1)
	Imgui.Text("Current level: ")
	Imgui.SameLine()
	Imgui.Text(tostring(self._current_level))

	self._is_persistent = Imgui.Checkbox("Keep on screen", self._is_persistent)
	local old_filter = self._filter_text
	self._filter_text = Imgui.InputText("Search", self._filter_text)

	if self._filter_text ~= old_filter then
		self:_refresh_filter()
	end

	self._selected_teleport = Imgui.ListBox("", self._selected_teleport, self._filtered_teleport_names) - 1

	if Imgui.Button("Register Point") or self._key_states.register_new then
		Imgui.OpenPopup("register_point_popup")
	end

	Imgui.SameLine()

	if Imgui.Button("Teleport") or (self._key_states.teleport and not Imgui.IsPopupOpen("register_point_popup")) then
		local local_player = Managers.player:local_player()
		local player_unit = local_player and local_player.player_unit

		self:_teleport_to_selected(player_unit)
	end

	Imgui.SameLine()

	if Imgui.Button("Save To Clipboard") or self._key_states.save_to_clipboatd then
		local local_player = Managers.player:local_player()
		local unit = local_player and local_player.player_unit
		local data_point = self:_get_unit_location(unit)

		self:_save_point_to_clipboard(data_point)
	end

	Imgui.SameLine()

	if Imgui.Button("Teleport Custom") or self._key_states.teleport_from_clipboard then
		local local_player = Managers.player:local_player()
		local unit = local_player and local_player.player_unit
		local data_point = self:_get_point_from_clipboard()

		self:_teleport_to_point(unit, data_point)
	end

	if Imgui.BeginPopup("register_point_popup") then
		self._register_point_name = Imgui.InputText("Name", self._register_point_name)

		if Imgui.Button("Confirm") or self._key_states.confirm then
			self:_register_point(self._register_point_name)
			self:_refresh_filter()
			Imgui.CloseCurrentPopup()
		end

		Imgui.SameLine()

		if Imgui.Button("Cancel") then
			Imgui.CloseCurrentPopup()
		end

		Imgui.EndPopup()
	else
		self._register_point_name = ""
	end

	if Imgui.BeginPopup("config_keybinds_popup") then
		for name, val in pairs(self._key_bindings) do
			Imgui.TreePush(name)

			local selected_for_rebind = self._rebind_action == name
			local button_name = (selected_for_rebind and "<?>") or val

			if Imgui.Button(button_name, 100, 20) then
				self._rebind_action = name
			end

			Imgui.SameLine()
			Imgui.Text(name)
			Imgui.TreePop()
		end

		if self._rebind_action then
			local input = Keyboard.any_pressed()

			if input then
				local input_name = Keyboard.button_name(input)
				self._key_bindings[self._rebind_action] = (input_name == "esc" and "") or input_name
				self._rebind_action = nil

				self:_save_points()
			end
		end

		Imgui.EndPopup()
	else
		self._rebind_action = nil
	end

	config_keybinds_popup = Imgui.IsPopupOpen("config_keybinds_popup")

	Imgui.End()

	if not config_keybinds_popup then
		self:_update_input()
		self:_handle_input()
	end
end

ImguiTeleportTool._update_input = function (self)
	for name, val in pairs(self._key_bindings) do
		local key_index = Keyboard.button_index(val)
		self._key_states[name] = key_index and Keyboard.pressed(key_index)
	end
end

ImguiTeleportTool._handle_input = function (self)
	if self._key_states.delete then
		local id = self:_get_selected_teleport_id()
		local level_key = self._current_level
		local names = self._teleport_name_map[level_key]
		local points = self._teleport_point_map[level_key]
		local num_names = #names
		local num_points = #points

		if id <= num_names then
			fassert(num_names == num_points, "Missaligned num names and points")
			table.remove(names, id)
			table.remove(points, id)
			self:_refresh_filter()
			self:_save_points()
		end
	end

	if self._key_states.select_up then
		self._selected_teleport = math.max(math.min(self._selected_teleport - 1, #self._filtered_teleport_names - 1), 0)
	end

	if self._key_states.select_down then
		self._selected_teleport = math.max(math.min(self._selected_teleport + 1, #self._filtered_teleport_names - 1), 0)
	end

	if self._key_states.quick_teleport then
		local local_player = Managers.player:local_player()
		local player_unit = local_player and local_player.player_unit

		self:_teleport_to_selected(player_unit)
	end
end

ImguiTeleportTool._refresh_filter = function (self)
	local teleport_names = self:_get_teleport_names(self._current_level)
	self._filtered_teleport_names, self._filtered_teleport_ids = self:_apply_filter(self._filter_text, teleport_names)
	self._selected_teleport = math.max(math.min(self._selected_teleport, #self._filtered_teleport_names) - 1, 0)
end

ImguiTeleportTool._apply_filter = function (self, filter_text, names)
	if filter_text == "" then
		return names
	end

	local filtered_list = {}
	local filtered_map = {}
	local search_string = string.gsub(filter_text, "[_ ]", "")

	for i = 1, #names, 1 do
		local name = names[i]
		local search_buff_name = string.gsub(name, "[_ ]", "")

		if search_buff_name:find(search_string, 1, true) then
			table.insert(filtered_list, name)
			table.insert(filtered_map, i)
		end
	end

	return filtered_list, filtered_map
end

ImguiTeleportTool._register_point = function (self, name)
	local level_key = self._current_level

	if not level_key then
		return
	end

	local local_player = Managers.player:local_player()
	local unit = local_player and local_player.player_unit
	local data_point = self:_get_unit_location(unit)

	if data_point then
		if not self._teleport_name_map[level_key] then
			self._teleport_name_map[level_key] = {}
			self._teleport_point_map[level_key] = {}
		end

		table.insert(self._teleport_name_map[level_key], name)
		table.insert(self._teleport_point_map[level_key], data_point)
		self:_save_points()
	end
end

ImguiTeleportTool._get_unit_location = function (self, unit)
	if Unit.alive(unit) then
		local pos = Unit.world_position(unit, 0)
		local rot = Unit.world_rotation(unit, 0)
		local pos_x, pos_y, pos_z = Vector3.to_elements(pos)
		local rot_x, rot_y, rot_z, rot_w = Quaternion.to_elements(rot)
		local data_point = {
			pos_x,
			pos_y,
			pos_z,
			rot_x,
			rot_y,
			rot_z,
			rot_w
		}

		return data_point
	end

	return nil
end

ImguiTeleportTool._get_selected_teleport_coords = function (self)
	local level_key = self._current_level
	local teleport_id = self:_get_selected_teleport_id()

	if level_key and teleport_id then
		local point_map = self._teleport_point_map[level_key]
		local point = point_map and point_map[teleport_id]

		return point
	end

	return nil
end

ImguiTeleportTool._teleport_to_selected = function (self, unit)
	local coords = self:_get_selected_teleport_coords()

	self:_teleport_to_point(unit, coords)
end

ImguiTeleportTool._teleport_to_point = function (self, unit, point)
	if point and Unit.alive(unit) then
		local pos = Vector3(point[1], point[2], point[3])
		local rot = Quaternion.from_elements(point[4], point[5], point[6], point[7])
		local locomotion = ScriptUnit.extension(unit, "locomotion_system")

		if locomotion then
			locomotion:teleport_to(pos, rot)
		end
	end
end

ImguiTeleportTool._get_teleport_names = function (self, level_key)
	return (level_key and self._teleport_name_map[level_key]) or EMPTY_LIST
end

ImguiTeleportTool._get_selected_teleport_id = function (self)
	local selected_num = self._selected_teleport + 1
	local filtered_ids = self._filtered_teleport_ids

	if selected_num and selected_num > 0 and filtered_ids then
		local id = filtered_ids[selected_num]

		return id
	end

	return selected_num
end

ImguiTeleportTool._save_points = function (self)
	Development.set_setting("ImguiTeleportTool_names", self._teleport_name_map)
	Development.set_setting("ImguiTeleportTool_points", self._teleport_point_map)
	Development.set_setting("ImguiTeleportTool_keybinds", self._key_bindings)
	Application.save_user_settings()
end

ImguiTeleportTool._load_points = function (self)
	self._teleport_name_map = Development.setting("ImguiTeleportTool_names") or self._teleport_name_map
	self._teleport_point_map = Development.setting("ImguiTeleportTool_points") or self._teleport_point_map
	self._key_bindings = Development.setting("ImguiTeleportTool_keybinds") or self._key_bindings
end

ImguiTeleportTool._save_point_to_clipboard = function (self, data_point)
	if data_point then
		local output = "ITT##" .. tostring(self._current_level) .. "##" .. cjson.encode(data_point) .. "##END"

		Clipboard.put(output)
	end
end

ImguiTeleportTool._get_point_from_clipboard = function (self)
	local input = Clipboard.get()
	local data = string.split(input, "##")
	local is_valid = true
	is_valid = is_valid and #data == 4
	is_valid = is_valid and data[1] == "ITT"
	is_valid = is_valid and data[2] == self._current_level
	is_valid = is_valid and string.sub(data[4], 1, 3) == "END"

	if is_valid then
		local point = cjson.decode(data[3])

		if point then
			local local_player = Managers.player:local_player()
			local unit = local_player and local_player.player_unit

			self:_teleport_to_point(unit, point)
		end
	end
end

return

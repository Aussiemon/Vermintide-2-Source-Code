-- chunkname: @scripts/imgui/imgui_sound_debug.lua

ImguiSoundDebug = class(ImguiSoundDebug)

local SHOULD_RELOAD = false
local DEFAULT_WINDOW_X = 820
local DEFAULT_WINDOW_Y = 500

local function format_timestamp(time)
	local miliseconds = time % 60
	local seconds = math.floor(time)

	return os.date("%H:%M", seconds) .. string.format(":%06.3f", miliseconds)
end

ImguiSoundDebug.init = function (self)
	self._event_name = "pwe_activate_ability_handmaiden_03"
	self._music_players = {}
	self._music_flags = {}
	self._is_persistent = false
	self._indent_counter = 0
	self._history = {}
	self._history_running = false
	self._sort_history_by = "timestamp"
	self._sort_direction = "asc"
	self._first_run = true

	self:register_events()

	SHOULD_RELOAD = false
end

ImguiSoundDebug.destroy = function (self)
	self:unregister_events()
end

ImguiSoundDebug.register_events = function (self)
	local event_manager = Managers.state.event

	if event_manager then
		event_manager:register(self, "music_flag_change", "on_music_flag_change")
		event_manager:register(self, "music_player_state_change", "on_music_player_state_change")
	end
end

ImguiSoundDebug.unregister_events = function (self)
	local event_manager = Managers.state.event

	if event_manager then
		event_manager:unregister("music_flag_change", self)
		event_manager:unregister("music_player_state_change", self)
	end
end

ImguiSoundDebug.is_persistent = function (self)
	return self._is_persistent
end

ImguiSoundDebug.update = function (self)
	if SHOULD_RELOAD then
		self:unregister_events()
		self:init()
	end

	self:_update_music_flags()
	self:_update_music_players()
end

ImguiSoundDebug._update_music_flags = function (self)
	local music_manager = Managers.music
	local flags = music_manager._flags
	local flags_update_disabled = music_manager.flags_update_disabled

	for key, value in pairs(flags) do
		self._music_flags[key] = {
			value = value,
			update_disabled = flags_update_disabled[key] or false,
		}
	end
end

ImguiSoundDebug._update_music_players = function (self)
	local music_manager = Managers.music
	local music_players = music_manager._music_players

	for name, player in pairs(music_players) do
		local playing = player._playing
		local states = playing and playing._group_states or {}
		local parsed_states = {}

		for key, value in pairs(states) do
			parsed_states[key] = {
				value = value,
				update_disabled = playing and playing.states_update_disabled[key],
			}
		end

		self._music_players[name] = {
			is_playing = player:is_playing(),
			states = parsed_states,
		}
	end
end

ImguiSoundDebug.draw = function (self)
	if self._first_run then
		Imgui.set_next_window_size(DEFAULT_WINDOW_X, DEFAULT_WINDOW_Y)

		self._first_run = false
	end

	local do_close = Imgui.begin_window("Sound Debug")

	self._is_persistent = Imgui.checkbox("Keep Window Open", self._is_persistent)

	Imgui.separator()
	self:_draw_music_player()
	Imgui.separator()
	self:_draw_music_flags()
	Imgui.separator()
	self:_draw_music_players()
	Imgui.separator()
	self:_draw_history()
	Imgui.separator()
	self:_verify_indent()
	Imgui.end_window()

	return do_close
end

ImguiSoundDebug._draw_music_player = function (self)
	self._event_name = Imgui.input_text("Event", self._event_name)

	Imgui.same_line()

	if Imgui.small_button("Play") then
		local world = Managers.world:world("level_world")
		local wwise_world = Managers.world:wwise_world(world)

		WwiseWorld.trigger_event(wwise_world, self._event_name)
	end
end

ImguiSoundDebug._draw_music_flags = function (self)
	Imgui.text("Music Flags")
	Imgui.dummy(0, 2)
	self:_set_columns(3, true, 300)

	local flags = self._music_flags

	for key, data in pairs(flags) do
		Imgui.tree_push(key)
		Imgui.text(key)
		Imgui.next_column()

		local new_value, enter_pressed = Imgui.input_text("", tostring(data.value))

		if enter_pressed and new_value ~= tostring(data.value) then
			local string_lower = string.lower(new_value)

			if string_lower == "true" then
				new_value = true
			elseif string_lower == "false" then
				new_value = false
			end

			local updates_disabled = Managers.music.flags_update_disabled

			updates_disabled[key] = nil

			Managers.music:set_flag(key, new_value)

			updates_disabled[key] = true
		end

		if type(data.value) == "boolean" then
			Imgui.same_line()
			Imgui.text("(Boolean)")
		end

		Imgui.next_column()

		new_value = Imgui.checkbox("Update Disabled", data.update_disabled)

		if new_value ~= data.update_disabled then
			Managers.music.flags_update_disabled[key] = new_value
		end

		Imgui.next_column()
		Imgui.tree_pop()
	end

	self:_reset_columns()
end

ImguiSoundDebug._draw_music_players = function (self)
	Imgui.text("Music Players")
	Imgui.dummy(0, 2)

	if not self._music_players then
		return
	end

	self:_indent()

	for name, data in pairs(self._music_players) do
		Imgui.text(string.format("Player: %s", name))
		self:_indent()
		Imgui.text(string.format("Is Playing: %s", data.is_playing))
		Imgui.text("States: ")
		self:_set_columns(3, true, 300)

		for key, state_data in pairs(data.states) do
			Imgui.tree_push(key)
			Imgui.text(key)
			Imgui.next_column()

			local new_value, enter_pressed = Imgui.input_text("", tostring(state_data.value))

			if enter_pressed and new_value ~= tostring(state_data.value) then
				local updates_disabled = Managers.music._music_players[name]._playing.states_update_disabled

				updates_disabled[key] = nil

				Managers.music._music_players[name]:set_group_state(key, new_value)

				updates_disabled[key] = true
			end

			Imgui.next_column()

			new_value = Imgui.checkbox("Update Disabled", state_data.update_disabled or false)

			if new_value ~= state_data.update_disabled then
				Managers.music._music_players[name]._playing.states_update_disabled[key] = new_value
			end

			Imgui.next_column()
			Imgui.tree_pop()
		end

		self:_unindent()
	end

	self:_unindent()
	self:_reset_columns()
end

local keys = {
	"timestamp",
	"name",
	"key",
	"old_value",
	"new_value",
}

ImguiSoundDebug._draw_history = function (self)
	local history_text = self._history_running and "Stop" or "Start"

	if Imgui.button(history_text) then
		if self._history_running then
			self:unregister_events()
		else
			self:register_events()
		end

		self._history_running = not self._history_running
	end

	Imgui.same_line()

	if Imgui.button("Clear History") then
		self._history = {}
	end

	self:_set_columns(5)

	for _, key in pairs(keys) do
		if self:_draw_sort_button(key) then
			self._history_sorted = false

			break
		end

		Imgui.next_column()
	end

	self:_reset_columns()

	if not self._history_sorted then
		for _, data in pairs(self._history) do
			table.sort(self._history, function (a, b)
				if self._sort_direction == "asc" then
					return a[self._sort_history_by]:lower() < b[self._sort_history_by]:lower()
				else
					return a[self._sort_history_by]:lower() > b[self._sort_history_by]:lower()
				end
			end)
		end

		self._history_sorted = true
	end

	local width, height = Imgui.get_window_size()

	Imgui.begin_child_window("Log:", width, height * 0.4, false)
	self:_set_columns(5)

	for _, data in pairs(self._history) do
		for _, key in pairs(keys) do
			Imgui.text(tostring(data[key]))
			Imgui.next_column()
		end
	end

	self:_reset_columns()
	Imgui.end_child_window()
end

ImguiSoundDebug._draw_sort_button = function (self, text)
	local final_text

	if self._sort_history_by == text then
		final_text = string.format("%s %s", text, self._sort_direction == "asc" and "/\\" or "\\/")
	else
		final_text = text
	end

	if Imgui.button(final_text) then
		self._sort_history_by = text
		self._sort_direction = self._sort_direction == "asc" and "desc" or "asc"

		return true
	end
end

ImguiSoundDebug.on_music_flag_change = function (self, flag, old_value, new_value)
	local data = {
		name = "flag",
		timestamp = format_timestamp(os.time()),
		key = flag,
		old_value = old_value or "",
		new_value = new_value or "",
	}

	self._history[#self._history + 1] = data
	self._history_sorted = false
end

ImguiSoundDebug.on_music_player_state_change = function (self, music_player_name, state_name, old_value, new_value)
	local data = {
		timestamp = format_timestamp(os.time()),
		name = music_player_name,
		key = state_name,
		old_value = old_value or "",
		new_value = new_value or "",
	}

	self._history[#self._history + 1] = data
	self._history_sorted = false
end

ImguiSoundDebug._set_columns = function (self, num_columns, border, columns_width)
	border = border or false

	Imgui.columns(num_columns, border)

	if not columns_width then
		return
	end

	if type(columns_width) == "table" then
		for i, width in ipairs(columns_width) do
			Imgui.set_column_width(width, i - 1)
		end
	else
		for i = 0, num_columns - 1 do
			Imgui.set_column_width(columns_width, i)
		end
	end
end

ImguiSoundDebug._reset_columns = function (self)
	self:_set_columns(1)
end

local indent_width = 8

ImguiSoundDebug._indent = function (self)
	self._indent_counter = self._indent_counter + 1

	Imgui.indent(indent_width)
end

ImguiSoundDebug._unindent = function (self)
	self._indent_counter = self._indent_counter - 1

	Imgui.unindent(indent_width)
end

ImguiSoundDebug._verify_indent = function (self)
	fassert(self._indent_counter == 0, tostring(self._indent_counter))
end

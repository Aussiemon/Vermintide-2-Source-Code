-- chunkname: @scripts/imgui/imgui_versus_character_picking_debug.lua

local SHOULD_RELOAD = true

ImguiVersusCharacterPickingDebug = class(ImguiVersusCharacterPickingDebug)

ImguiVersusCharacterPickingDebug.init = function (self)
	self._initialized = false
end

ImguiVersusCharacterPickingDebug._initialize = function (self)
	local mechanism = Managers.mechanism:game_mechanism()

	if mechanism.name ~= "Versus" then
		return
	end

	self._mechanism = mechanism

	local game_mode = Managers.state.game_mode:game_mode()

	self._party_selection_logic = game_mode.party_selection_logic and game_mode:party_selection_logic()

	if not self._party_selection_logic then
		return
	end

	local settings = GameModeSettings.versus

	self._timer = 0
	self._timer_paused = false
	self._startup_time = settings.character_picking_settings.startup_time
	self._player_pick_time = settings.character_picking_settings.player_pick_time
	self._closing_time = settings.character_picking_settings.closing_time
	self._is_server = Managers.mechanism:is_server()
	self._pick_data_per_party = {}
	self._same_hero_allowed = not not settings.duplicate_hero_profiles_allowed
	self._same_career_allowed = not not settings.duplicate_hero_careers_allowed
	self._initialized = true
end

ImguiVersusCharacterPickingDebug.update = function (self)
	if SHOULD_RELOAD then
		self:init()

		SHOULD_RELOAD = false
	end

	if not self._initialized then
		self:_initialize()

		return
	end

	self._timer = self._party_selection_logic._timer
	self._pick_data_per_party = self._party_selection_logic._pick_data_per_party
end

ImguiVersusCharacterPickingDebug.is_persistent = function (self)
	return true
end

ImguiVersusCharacterPickingDebug._same_line_dummy = function (self, x, y)
	Imgui.same_line()
	Imgui.dummy(x, y)
	Imgui.same_line()
end

ImguiVersusCharacterPickingDebug.draw = function (self, is_open)
	local do_close = Imgui.begin_window("Versus Character Picking Debug", "always_auto_resize")

	self:_draw_settings()
	Imgui.separator()
	self:_draw_timer()

	if self._party_selection_logic._picking_started then
		Imgui.separator()
		self:_draw_party_data()
		Imgui.separator()
		self:_draw_player_data()
	end

	Imgui.end_window()

	return do_close
end

ImguiVersusCharacterPickingDebug._draw_settings = function (self)
	Imgui.text("Settings")
	Imgui.indent()
	self:_draw_selection_settings()
	Imgui.dummy(0, 4)
	self:_draw_time_settings()
	Imgui.unindent()
end

ImguiVersusCharacterPickingDebug._draw_time_settings = function (self)
	local startup_time = Imgui.slider_float("Startup Time", self._startup_time, 0, 60)

	if self._is_server and startup_time ~= self._startup_time then
		self._startup_time = startup_time
		GameModeSettings.versus.character_picking_settings.startup_time = startup_time

		if self._party_selection_logic._picking_started then
			self._party_selection_logic._picking_settings.startup_time = startup_time
		end
	end

	local player_pick_time = Imgui.slider_float("Player Picking Time", self._player_pick_time, 0, 60)

	if self._is_server and player_pick_time ~= self._player_pick_time then
		self._player_pick_time = player_pick_time
		GameModeSettings.versus.character_picking_settings.player_pick_time = player_pick_time

		if self._party_selection_logic._picking_started then
			self._party_selection_logic._picking_settings.player_pick_time = player_pick_time
		end
	end

	local closing_time = Imgui.slider_float("Closing Time", self._closing_time, 0, 60)

	if self._is_server and closing_time ~= self._closing_time then
		self._closing_time = closing_time
		GameModeSettings.versus.character_picking_settings.closing_time = closing_time

		if self._party_selection_logic._picking_started then
			self._party_selection_logic._picking_settings.closing_time = closing_time
		end
	end
end

ImguiVersusCharacterPickingDebug._draw_timer = function (self)
	Imgui.text("Timer")
	Imgui.indent()

	local timer = Imgui.slider_float("Timer", self._timer, 0, 60)

	if self._is_server and timer ~= self._timer then
		self._timer = timer
		self._party_selection_logic._timer = timer
	end

	Imgui.same_line()

	local paused = Imgui.checkbox("Pause", self._timer_paused)

	if self._is_server and paused ~= self._timer_paused then
		self._timer_paused = paused
		self._party_selection_logic._timer_paused = paused
	end

	Imgui.unindent()
end

ImguiVersusCharacterPickingDebug._draw_selection_settings = function (self)
	local same_hero_allowed = Imgui.checkbox("Same Hero Allowed", self._same_hero_allowed)

	if self._is_server and same_hero_allowed ~= self._same_hero_allowed then
		self._same_hero_allowed = same_hero_allowed
		GameModeSettings.versus.duplicate_hero_profiles_allowed = same_hero_allowed
	end

	local same_career_allowed = Imgui.checkbox("Same Career Allowed", self._same_career_allowed)

	if self._is_server and same_career_allowed ~= self._same_career_allowed then
		self._same_career_allowed = same_career_allowed
		GameModeSettings.versus.duplicate_hero_careers_allowed = same_career_allowed
	end
end

ImguiVersusCharacterPickingDebug._draw_party_data = function (self)
	local pick_data_per_party = self._pick_data_per_party

	Imgui.text("Party Data")

	for party_id, party_data in ipairs(pick_data_per_party) do
		Imgui.tree_push(party_id)

		local party = Managers.party:get_party(party_id)

		if Imgui.tree_node(string.format("Party %d", party_id)) then
			Imgui.indent()
			Imgui.text(string.format("State: %s", party_data.state))
			Imgui.text(string.format("Slider Timer: %s", party_data.slider_timer))
			Imgui.text(string.format("Timer Finish: %s", party_data.time_finished))
			Imgui.text(string.format("Current Picker Index: %d", party_data.current_picker_index))
			Imgui.text(string.format("Prev Picker Index: %s", party_data.prev_picker_index))
			Imgui.text(string.format("Party Size: %d", party.num_slots))
			Imgui.text(string.format("Number of Players: %d", party.num_used_slots))

			if Imgui.tree_node("Available Characters") then
				Imgui.indent()

				local available_characters = party_data.available_characters

				for profile_id, available_careers in pairs(available_characters) do
					local profile = SPProfiles[profile_id]

					if Imgui.tree_node(profile.display_name) then
						Imgui.indent()

						for _, career_id in pairs(available_careers) do
							local career = profile.careers[career_id]

							Imgui.text(career.display_name)
						end

						Imgui.unindent()
						Imgui.tree_pop()
					end
				end

				Imgui.unindent()
				Imgui.tree_pop()
			end

			Imgui.unindent()
			Imgui.tree_pop()
		end

		Imgui.tree_pop()
	end
end

ImguiVersusCharacterPickingDebug._draw_player_data = function (self)
	local pick_data_per_party = self._pick_data_per_party

	Imgui.text("Player Data")

	for party_id, party_data in ipairs(pick_data_per_party) do
		Imgui.tree_push(party_id .. "1")

		if Imgui.tree_node(string.format("Party %d", party_id)) then
			Imgui.indent()

			local picker_list = party_data.picker_list

			for picker_id, picker_data in pairs(picker_list) do
				local status = picker_data.status
				local player = status.player
				local is_player = status.is_player
				local is_player_string = is_player and "True" or "False"
				local player_name = is_player and player:name() or string.format("Bot #%d", picker_id)

				if Imgui.tree_node(player_name) then
					Imgui.indent()

					local profile_index = status.selected_profile_index
					local career_index = status.selected_career_index
					local profile_string, career_string

					if profile_index and profile_index > 0 then
						local profile = SPProfiles[profile_index]
						local career = profile.careers[career_index]

						profile_string = string.format("%s (%d)", profile.display_name, profile_index)
						career_string = string.format("%s (%d)", career.display_name, career_index)
					else
						profile_string = "nil"
						career_string = "nil"
					end

					Imgui.text(string.format("State: %s", picker_data.state))
					Imgui.text(string.format("Picker Index: %d", picker_data.picker_index))
					Imgui.text(string.format("Slot Index: %d", picker_data.slot_id))
					Imgui.text(string.format("Profile Index: %s", profile_string))
					Imgui.text(string.format("Career Index: %s", career_string))
					Imgui.unindent()
					Imgui.tree_pop()
				end
			end

			Imgui.unindent()
			Imgui.tree_pop()
		end

		Imgui.tree_pop()
	end
end

ImguiVersusCharacterPickingDebug._draw_pick_data = function (self)
	local pick_data_per_party = self._pick_data_per_party

	Imgui.unindent()

	for party_id, data in ipairs(pick_data_per_party) do
		Imgui.tree_push(party_id)
		Imgui.dummy(360, 8)

		local party = Managers.party:get_party(data.party_id)
		local slots_data = party.slots_data

		Imgui.text("Party " .. data.party_id)
		Imgui.text("State: " .. data.state)
		Imgui.text("Current Picker Index: " .. data.current_picker_index)

		if Imgui.tree_node("Available Characters") then
			Imgui.unindent()

			local available_characters = data.available_characters

			for profile_id, available_careers in pairs(available_characters) do
				Imgui.tree_push(profile_id)

				local profile = SPProfiles[profile_id]
				local profile_name = profile.display_name

				if Imgui.tree_node(profile_name) then
					for career_index, career in pairs(available_careers) do
						Imgui.text(profile.careers[career_index].display_name)
					end

					Imgui.tree_pop()
				end

				Imgui.tree_pop()
			end

			for profile_id, careers in ipairs(available_characters) do
				-- Nothing
			end

			Imgui.tree_pop()
			Imgui.indent()
		end

		if Imgui.tree_node("Picker List") then
			for picker_id, picker_data in ipairs(data.picker_list) do
				Imgui.tree_push(picker_id)

				local status = picker_data.status
				local slot_data = slots_data[picker_data.slot_id]
				local is_player = status.is_player
				local is_player_string = status.is_player and "True" or "False"
				local player_name = is_player and status.player:name() or "Bot #" .. tostring(picker_data.picker_index)
				local state = "State: " .. picker_data.state .. (self._is_server and " (server)" or " (client)")

				Imgui.text(player_name)
				Imgui.text("Is Player: " .. is_player_string)
				Imgui.text("State: " .. state)
				Imgui.text("Picker Index: " .. tostring(picker_data.picker_index))
				Imgui.text("Slot Id: " .. tostring(picker_data.slot_id))

				if Imgui.tree_node("Status Data") then
					Imgui.text("Selected Profile Index: " .. tostring(status.selected_profile_index))
					Imgui.text("Selected Career Index: " .. tostring(status.selected_career_index))
					Imgui.text("Profile Index: " .. tostring(status.profile_index))
					Imgui.text("Career Index: " .. tostring(status.career_index))
					Imgui.tree_pop()
				end

				if Imgui.tree_node("Slot Data") then
					Imgui.text("Slot Melee: " .. tostring(slot_data.slot_melee))
					Imgui.text("Slot Ranged: " .. tostring(slot_data.slot_ranged))
					Imgui.text("Slot Skin: " .. tostring(slot_data.slot_skin))
					Imgui.text("Slot Hat: " .. tostring(slot_data.slot_hat))
					Imgui.tree_pop()
				end

				Imgui.tree_pop()
			end

			Imgui.tree_pop()
		end

		Imgui.tree_pop()
	end
end

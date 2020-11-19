local SHOULD_RELOAD = true
ImguiVersusCharacterPickingDebug = class(ImguiVersusCharacterPickingDebug)

ImguiVersusCharacterPickingDebug.init = function (self)
	self._initialized = false
end

ImguiVersusCharacterPickingDebug._initialize = function (self)
	local mechanism = Managers.mechanism:game_mechanism()

	if not mechanism.name == "Versus" then
		return
	end

	self._mechanism = mechanism
	self._party_selection_logic = mechanism._party_selection_logic

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
	self._same_hero_allowed = settings.duplicate_hero_profiles_allowed
	self._same_career_allowed = settings.duplicate_hero_careers_allowed
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
	Imgui.SameLine()
	Imgui.Dummy(x, y)
	Imgui.SameLine()
end

ImguiVersusCharacterPickingDebug.draw = function (self, is_open)
	Imgui.Begin("Versus Character Picking Debug", "always_auto_resize")
	self:_draw_settings()
	Imgui.Separator()
	self:_draw_timer()

	if self._party_selection_logic._picking_started then
		Imgui.Separator()
		self:_draw_party_data()
		Imgui.Separator()
		self:_draw_player_data()
	end

	Imgui.End()
end

ImguiVersusCharacterPickingDebug._draw_settings = function (self)
	Imgui.Text("Settings")
	Imgui.Indent()
	self:_draw_selection_settings()
	Imgui.Dummy(0, 4)
	self:_draw_time_settings()
	Imgui.Unindent()
end

ImguiVersusCharacterPickingDebug._draw_time_settings = function (self)
	local startup_time = Imgui.SliderFloat("Startup Time", self._startup_time, 0, 60)

	if self._is_server and startup_time ~= self._startup_time then
		self._startup_time = startup_time
		GameModeSettings.versus.character_picking_settings.startup_time = startup_time

		if self._party_selection_logic._picking_started then
			self._party_selection_logic._picking_settings.startup_time = startup_time
		end
	end

	local player_pick_time = Imgui.SliderFloat("Player Picking Time", self._player_pick_time, 0, 60)

	if self._is_server and player_pick_time ~= self._player_pick_time then
		self._player_pick_time = player_pick_time
		GameModeSettings.versus.character_picking_settings.player_pick_time = player_pick_time

		if self._party_selection_logic._picking_started then
			self._party_selection_logic._picking_settings.player_pick_time = player_pick_time
		end
	end

	local closing_time = Imgui.SliderFloat("Closing Time", self._closing_time, 0, 60)

	if self._is_server and closing_time ~= self._closing_time then
		self._closing_time = closing_time
		GameModeSettings.versus.character_picking_settings.closing_time = closing_time

		if self._party_selection_logic._picking_started then
			self._party_selection_logic._picking_settings.closing_time = closing_time
		end
	end
end

ImguiVersusCharacterPickingDebug._draw_timer = function (self)
	Imgui.Text("Timer")
	Imgui.Indent()

	local timer = Imgui.SliderFloat("Timer", self._timer, 0, 60)

	if self._is_server and timer ~= self._timer then
		self._timer = timer
		self._party_selection_logic._timer = timer
	end

	Imgui.SameLine()

	local paused = Imgui.Checkbox("Pause", self._timer_paused)

	if self._is_server and paused ~= self._timer_paused then
		self._timer_paused = paused
		self._party_selection_logic._timer_paused = paused
	end

	Imgui.Unindent()
end

ImguiVersusCharacterPickingDebug._draw_selection_settings = function (self)
	local same_hero_allowed = Imgui.Checkbox("Same Hero Allowed", self._same_hero_allowed)

	if self._is_server and same_hero_allowed ~= self._same_hero_allowed then
		self._same_hero_allowed = same_hero_allowed
		GameModeSettings.versus.duplicate_hero_profiles_allowed = same_hero_allowed
	end

	local same_career_allowed = Imgui.Checkbox("Same Career Allowed", self._same_career_allowed)

	if self._is_server and same_career_allowed ~= self._same_career_allowed then
		self._same_career_allowed = same_career_allowed
		GameModeSettings.versus.duplicate_hero_careers_allowed = same_career_allowed
	end
end

ImguiVersusCharacterPickingDebug._draw_party_data = function (self)
	local pick_data_per_party = self._pick_data_per_party

	Imgui.Text("Party Data")

	for party_id, party_data in ipairs(pick_data_per_party) do
		Imgui.TreePush(party_id)

		local party = Managers.party:get_party(party_id)

		if Imgui.TreeNode(string.format("Party %d", party_id)) then
			Imgui.Indent()
			Imgui.Text(string.format("State: %s", party_data.state))
			Imgui.Text(string.format("Slider Timer: %s", party_data.slider_timer))
			Imgui.Text(string.format("Timer Finish: %s", party_data.time_finished))
			Imgui.Text(string.format("Current Picker Index: %d", party_data.current_picker_index))
			Imgui.Text(string.format("Prev Picker Index: %s", party_data.prev_picker_index))
			Imgui.Text(string.format("Party Size: %d", party.num_slots))
			Imgui.Text(string.format("Number of Players: %d", party.num_used_slots))

			if Imgui.TreeNode("Available Characters") then
				Imgui.Indent()

				local available_characters = party_data.available_characters

				for profile_id, available_careers in pairs(available_characters) do
					local profile = SPProfiles[profile_id]

					if Imgui.TreeNode(profile.display_name) then
						Imgui.Indent()

						for _, career_id in pairs(available_careers) do
							local career = profile.careers[career_id]

							Imgui.Text(career.display_name)
						end

						Imgui.Unindent()
						Imgui.TreePop()
					end
				end

				Imgui.Unindent()
				Imgui.TreePop()
			end

			Imgui.Unindent()
			Imgui.TreePop()
		end

		Imgui.TreePop()
	end
end

ImguiVersusCharacterPickingDebug._draw_player_data = function (self)
	local pick_data_per_party = self._pick_data_per_party

	Imgui.Text("Player Data")

	for party_id, party_data in ipairs(pick_data_per_party) do
		Imgui.TreePush(party_id .. "1")

		if Imgui.TreeNode(string.format("Party %d", party_id)) then
			Imgui.Indent()

			local picker_list = party_data.picker_list

			for picker_id, picker_data in pairs(picker_list) do
				local status = picker_data.status
				local player = status.player
				local is_player = status.is_player
				local is_player_string = (is_player and "True") or "False"
				local player_name = (is_player and player:name()) or string.format("Bot #%d", picker_id)

				if Imgui.TreeNode(player_name) then
					Imgui.Indent()

					local profile_index = status.selected_profile_index
					local career_index = status.selected_career_index
					local profile_string, career_string = nil

					if profile_index and profile_index > 0 then
						local profile = SPProfiles[profile_index]
						local career = profile.careers[career_index]
						profile_string = string.format("%s (%d)", profile.display_name, profile_index)
						career_string = string.format("%s (%d)", career.display_name, career_index)
					else
						profile_string = "nil"
						career_string = "nil"
					end

					Imgui.Text(string.format("State: %s", picker_data.state))
					Imgui.Text(string.format("Picker Index: %d", picker_data.picker_index))
					Imgui.Text(string.format("Slot Index: %d", picker_data.slot_id))
					Imgui.Text(string.format("Profile Index: %s", profile_string))
					Imgui.Text(string.format("Career Index: %s", career_string))
					Imgui.Unindent()
					Imgui.TreePop()
				end
			end

			Imgui.Unindent()
			Imgui.TreePop()
		end

		Imgui.TreePop()
	end
end

ImguiVersusCharacterPickingDebug._draw_pick_data = function (self)
	local pick_data_per_party = self._pick_data_per_party

	Imgui.Unindent()

	for party_id, data in ipairs(pick_data_per_party) do
		Imgui.TreePush(party_id)
		Imgui.Dummy(360, 8)

		local party = Managers.party:get_party(data.party_id)
		local slots_data = party.slots_data

		Imgui.Text("Party " .. data.party_id)
		Imgui.Text("State: " .. data.state)
		Imgui.Text("Current Picker Index: " .. data.current_picker_index)

		if Imgui.TreeNode("Available Characters") then
			Imgui.Unindent()

			local available_characters = data.available_characters

			for profile_id, available_careers in pairs(available_characters) do
				Imgui.TreePush(profile_id)

				local profile = SPProfiles[profile_id]
				local profile_name = profile.display_name

				if Imgui.TreeNode(profile_name) then
					for career_index, career in pairs(available_careers) do
						Imgui.Text(profile.careers[career_index].display_name)
					end

					Imgui.TreePop()
				end

				Imgui.TreePop()
			end

			for slot13, slot14 in ipairs(available_characters) do
			end

			Imgui.TreePop()
			Imgui.Indent()
		end

		if Imgui.TreeNode("Picker List") then
			for picker_id, picker_data in ipairs(data.picker_list) do
				Imgui.TreePush(picker_id)

				local status = picker_data.status
				local slot_data = slots_data[picker_data.slot_id]
				local is_player = status.is_player
				local is_player_string = (status.is_player and "True") or "False"
				local player_name = (is_player and status.player:name()) or "Bot #" .. tostring(picker_data.picker_index)
				local state = "State: " .. picker_data.state .. ((self._is_server and " (server)") or " (client)")

				Imgui.Text(player_name)
				Imgui.Text("Is Player: " .. is_player_string)
				Imgui.Text("State: " .. state)
				Imgui.Text("Picker Index: " .. tostring(picker_data.picker_index))
				Imgui.Text("Slot Id: " .. tostring(picker_data.slot_id))

				if Imgui.TreeNode("Status Data") then
					Imgui.Text("Selected Profile Index: " .. tostring(status.selected_profile_index))
					Imgui.Text("Selected Career Index: " .. tostring(status.selected_career_index))
					Imgui.Text("Profile Index: " .. tostring(status.profile_index))
					Imgui.Text("Career Index: " .. tostring(status.career_index))
					Imgui.TreePop()
				end

				if Imgui.TreeNode("Slot Data") then
					Imgui.Text("Slot Melee: " .. tostring(slot_data.slot_melee))
					Imgui.Text("Slot Ranged: " .. tostring(slot_data.slot_ranged))
					Imgui.Text("Slot Skin: " .. tostring(slot_data.slot_skin))
					Imgui.Text("Slot Hat: " .. tostring(slot_data.slot_hat))
					Imgui.TreePop()
				end

				Imgui.TreePop()
			end

			Imgui.TreePop()
		end

		Imgui.TreePop()
	end
end

return

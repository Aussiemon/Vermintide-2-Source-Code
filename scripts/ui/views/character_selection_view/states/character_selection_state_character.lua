require("scripts/settings/profiles/sp_profiles")

local definitions = local_require("scripts/ui/views/character_selection_view/states/definitions/character_selection_state_character_definitions")
local character_selection_widget_definitions = definitions.character_selection_widgets
local widget_definitions = definitions.widgets
local info_widget_definitions = definitions.info_widgets
local bot_selection_widget_definitions = definitions.bot_selection_widgets
local hero_widget_definition = definitions.hero_widget
local empty_hero_widget_definition = definitions.empty_hero_widget
local hero_icon_widget_definition = definitions.hero_icon_widget
local generic_input_actions = definitions.generic_input_actions
local animation_definitions = definitions.animation_definitions
local scenegraph_definition = definitions.scenegraph_definition
local DO_RELOAD = false
local VIDEO_REFERENCE_NAME = "CharacterSelectionStateCharacter"
CharacterSelectionStateCharacter = class(CharacterSelectionStateCharacter)
CharacterSelectionStateCharacter.NAME = "CharacterSelectionStateCharacter"

CharacterSelectionStateCharacter.on_enter = function (self, params)
	self.parent:clear_wanted_state()
	print("[HeroViewState] Enter Substate CharacterSelectionStateCharacter")

	local state_params = params.state_params
	self._hero_name = params.hero_name
	local ingame_ui_context = params.ingame_ui_context
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.statistics_db = ingame_ui_context.statistics_db
	self.render_settings = {
		snap_pixel_positions = true
	}
	self.profile_synchronizer = ingame_ui_context.profile_synchronizer
	self.is_server = ingame_ui_context.is_server
	self._close_on_successful_profile_request = true
	self.world_previewer = params.world_previewer
	self.wwise_world = params.wwise_world
	self.platform = PLATFORM
	self.allow_back_button = params.allow_back_button

	if params.pick_time then
		self.pick_time = params.pick_time
	end

	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	self._stats_id = local_player:stats_id()
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self.local_player_id = ingame_ui_context.local_player_id
	self.local_player = local_player
	self._animations = {}
	self._ui_animations = {}
	self._available_profiles = {}
	local network_handler = ingame_ui_context.network_server or ingame_ui_context.network_client
	self._profile_requester = network_handler:profile_requester()
	local parent = self.parent
	local input_service = self:input_service()
	local gui_layer = UILayer.default + 130
	local input_description_input_service = parent:input_service(true)
	self.menu_input_description = MenuInputDescriptionUI:new(ingame_ui_context, self.ui_top_renderer, input_description_input_service, 6, gui_layer, (params.allow_back_button and generic_input_actions.default_back) or generic_input_actions.default, true)

	self.menu_input_description:set_input_description(nil)
	self:create_ui_elements(params)
	self:_start_transition_animation("on_enter", "on_enter")

	self._hero_preview_skin = nil
	self.use_user_skins = true
	local hero_name = self._hero_name
	local profile_id = params.profile_id

	if profile_id and profile_id > 0 then
		self._career_index = params.career_id
		self._close_on_successful_profile_request = false

		self:_select_hero(profile_id, self._career_index, true)
		self:_change_profile(profile_id, self._career_index)
	else
		local profile_index, career_index = self.profile_synchronizer:profile_by_peer(self.peer_id, self.local_player_id)

		if profile_index and hero_name then
			local hero_attributes = Managers.backend:get_interface("hero_attributes")
			self._career_index = career_index

			self:_select_hero(profile_index, self._career_index, true)
		end
	end

	self.parent:set_input_blocked(false)
end

CharacterSelectionStateCharacter._update_video_player_settings = function (self)
	local is_character_visible = self.world_previewer:character_visible()

	if is_character_visible and not self._video_widget then
		local material_name = self._current_video_settings.material_name
		local resource = self._current_video_settings.resource

		if material_name and resource then
			self:_setup_video_player(material_name, resource)

			self._draw_video_next_frame = true
		end
	elseif not is_character_visible then
		self:_destroy_video_player()
	end
end

CharacterSelectionStateCharacter._setup_video_player = function (self, material_name, resource)
	self:_destroy_video_player()

	local ui_top_renderer = self.ui_top_renderer
	local set_loop = true
	local world, viewport = self.parent:get_background_world()

	UIRenderer.create_video_player(ui_top_renderer, VIDEO_REFERENCE_NAME, world, resource, set_loop)

	local scenegraph_id = "info_window_video"
	local widget_definition = UIWidgets.create_video(scenegraph_id, material_name, VIDEO_REFERENCE_NAME)
	local widget = UIWidget.init(widget_definition)
	self._video_widget = widget
	self._video_created = true
end

CharacterSelectionStateCharacter._destroy_video_player = function (self)
	local ui_top_renderer = self.ui_top_renderer
	local widget = self._video_widget

	if widget then
		UIWidget.destroy(ui_top_renderer, widget)

		self._video_widget = nil
	end

	if ui_top_renderer and ui_top_renderer.video_players[VIDEO_REFERENCE_NAME] then
		local world, viewport = self.parent:get_background_world()

		UIRenderer.destroy_video_player(ui_top_renderer, VIDEO_REFERENCE_NAME, world)
	end

	self._video_created = nil
end

CharacterSelectionStateCharacter.create_ui_elements = function (self, params)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local widgets = {}
	local info_widgets = {}
	local bot_selection_widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	for name, widget_definition in pairs(info_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		info_widgets[#info_widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	for name, widget_definition in pairs(bot_selection_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		bot_selection_widgets[#bot_selection_widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets
	self._info_widgets = info_widgets
	self._bot_selection_widgets = bot_selection_widgets
	self._widgets_by_name = widgets_by_name

	self:_setup_hero_selection_widgets()
	UIRenderer.clear_scenegraph_queue(self.ui_top_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)
end

CharacterSelectionStateCharacter._set_hero_icon_selected = function (self, index)
	for icon_index, widget in ipairs(self._hero_icon_widgets) do
		widget.content.selected = icon_index == index
	end
end

CharacterSelectionStateCharacter._setup_hero_selection_widgets = function (self)
	local hero_widgets = {}
	self._hero_widgets = hero_widgets
	local hero_icon_widgets = {}
	self._hero_icon_widgets = hero_icon_widgets
	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local backend_dlcs = Managers.backend:get_interface("dlcs")
	local num_max_rows = #SPProfilesAbbreviation
	local profiles = ProfilePriority
	local profiles = PlayerData.bot_spawn_priority

	if not profiles[1] then
		profiles = ProfileIndexToPriorityIndex
	end

	self._num_hero_columns = {}

	for i, profile_index in ipairs(profiles) do
		local profile_settings = SPProfiles[profile_index]
		local hero_name = profile_settings.display_name
		local hero_experience = hero_attributes:get(hero_name, "experience") or 0
		local hero_level = ExperienceSettings.get_level(hero_experience)
		local careers = profile_settings.careers
		local icon_widget = UIWidget.init(hero_icon_widget_definition)
		hero_icon_widgets[#hero_icon_widgets + 1] = icon_widget
		local hero_icon_offset = icon_widget.offset
		hero_icon_offset[2] = -((i - 1) * 144)
		icon_widget.content.bot_order_texture_id = "bot_order_" .. tostring(i)
		local hero_icon_texture = "hero_icon_large_" .. hero_name
		icon_widget.content.icon = hero_icon_texture
		icon_widget.content.icon_selected = hero_icon_texture .. "_glow"
		local valid_career_count = 0

		for j = 1, 4, 1 do
			local career = careers[j]

			if career and not backend_dlcs:is_unreleased_career(career.name) then
				valid_career_count = valid_career_count + 1
				local widget = UIWidget.init(hero_widget_definition)
				hero_widgets[#hero_widgets + 1] = widget
				local offset = widget.offset
				local content = widget.content
				content.career_settings = career
				local portrait_image = career.portrait_image
				content.portrait = "medium_" .. portrait_image
				local is_career_unlocked, reason, dlc_name, localized = career:is_unlocked_function(hero_name, hero_level)
				content.locked = not is_career_unlocked
				content.locked_reason = not is_career_unlocked and ((localized and reason) or Localize(reason))
				content.dlc_name = dlc_name

				if reason == "dlc_not_owned" then
					content.lock_texture = content.lock_texture .. "_gold"
					content.frame = content.frame .. "_gold"
				end

				local career_index = hero_attributes:get(hero_name, "career")
				local bot_career_index = hero_attributes:get(hero_name, "bot_career") or career_index or 1
				local bot_priority = table.find(profiles, profile_index)

				if bot_career_index == j and bot_priority <= 5 then
					content.bot_priority = bot_priority
					content.bot_selected = true
				end

				offset[1] = (j - 1) * 124
				offset[2] = -((i - 1) * 144)
			else
				local offset = (j - 1) * 124
				icon_widget.style.bg.offset[1] = icon_widget.style.bg.offset[1] + offset
				icon_widget.style.hourglass_icon.offset[1] = icon_widget.style.hourglass_icon.offset[1] + offset
				icon_widget.content.use_empty_icon = true
			end
		end

		self._num_hero_columns[i] = valid_career_count
	end

	self._num_max_hero_rows = num_max_rows
end

CharacterSelectionStateCharacter._update_available_profiles = function (self)
	local available_profiles = self._available_profiles
	local hero_widgets = self._hero_widgets
	local player = Managers.player:local_player()
	local profile_synchronizer = self.profile_synchronizer
	local own_player_profile_index = player ~= nil and player:profile_index()
	local own_player_career_index = player ~= nil and player:career_index()
	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local profiles = ProfilePriority
	local profiles = PlayerData.bot_spawn_priority

	if not profiles[1] then
		profiles = ProfileIndexToPriorityIndex
	end

	local widget_index = 1
	local selected_career_index = self._selected_career_index
	local selected_profile_index = self._selected_profile_index
	local mechanism_manager = Managers.mechanism

	for i, profile_index in ipairs(profiles) do
		local profile_settings = SPProfiles[profile_index]
		local profile_name = profile_settings.display_name
		local is_profile_available = false

		if player then
			local peer_id = player:network_id()
			local local_player_id = player:local_player_id()
			local profile_name = profile_settings.display_name
			is_profile_available = mechanism_manager:profile_available_for_peer(peer_id, local_player_id, profile_name)
		end

		local is_currently_played_profile = own_player_profile_index == profile_index
		local can_play_profile = is_currently_played_profile or is_profile_available
		local careers = profile_settings.careers

		for j, career in ipairs(careers) do
			local widget = hero_widgets[widget_index]

			if widget then
				local content = widget.content
				local is_career_locked = content.locked
				content.taken = not can_play_profile

				if j == selected_career_index and selected_profile_index == profile_index then
					self:_set_select_button_enabled(can_play_profile and not is_career_locked, is_career_locked and content.dlc_name, content.dlc_name)
				end
			end

			widget_index = widget_index + 1
		end
	end
end

CharacterSelectionStateCharacter._handle_mouse_selection = function (self)
	local hero_widgets = self._hero_widgets
	local num_max_rows = self._num_max_hero_rows
	local selected_row = self._selected_hero_row
	local selected_column = self._selected_hero_column
	local profiles = ProfilePriority
	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	profiles = PlayerData.bot_spawn_priority
	local widget_index = 1

	for i = 1, num_max_rows, 1 do
		local num_max_columns = self._num_hero_columns[i]

		for j = 1, num_max_columns, 1 do
			local widget = hero_widgets[widget_index]
			local content = widget.content
			local button_hotspot = content.button_hotspot

			if button_hotspot.on_pressed and (i ~= selected_row or j ~= selected_column) then
				local profile_index = profiles[i]
				local career_index = j

				self:_select_hero(profile_index, career_index)

				return
			end

			widget_index = widget_index + 1
		end
	end
end

CharacterSelectionStateCharacter._update_equipped_bots = function (self)
	local bot_spawn_priority = PlayerData.bot_spawn_priority

	if not bot_spawn_priority[1] then
		bot_spawn_priority = ProfileIndexToPriorityIndex
	end

	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local hero_widgets = self._hero_widgets
	local widget_index = 1

	for i, profile_index in ipairs(bot_spawn_priority) do
		local profile_settings = SPProfiles[profile_index]
		local hero_name = profile_settings.display_name
		local careers = profile_settings.careers

		for career_index, career in ipairs(careers) do
			local widget = self._hero_widgets[widget_index]
			local content = widget.content
			local heor_career_index = hero_attributes:get(hero_name, "career")
			local bot_career_index = hero_attributes:get(hero_name, "bot_career") or career_index or 1
			local bot_priority = table.find(bot_spawn_priority, profile_index)

			if bot_career_index == career_index and bot_priority <= 5 then
				content.bot_priority = nil
				content.bot_selected = true
			else
				content.bot_priority = nil
				content.bot_selected = nil
			end

			widget_index = widget_index + 1
		end
	end
end

CharacterSelectionStateCharacter._exit_bot_selection = function (self)
	self.parent:set_input_blocked(false)
	self:_setup_hero_selection_widgets()
	self:_select_hero(self._selected_profile_index, self._selected_career_index, true)

	for _, widget in pairs(self._hero_icon_widgets) do
		widget.content.bot_selection_active = false
	end

	self._spawn_hero = true
	self._bot_selection = nil
	self._bot_priority_copy = nil
	self._current_selected_bot_index = nil
	self._current_selected_row = nil
	self._x_offset = nil
	self._base_y_offset = nil
	local widgets_by_name = self._widgets_by_name
	local background_widget = widgets_by_name.background
	local background_widget_style = background_widget.style
	self._ui_animations.background = UIAnimation.init(UIAnimation.function_by_time, background_widget_style.rect.color, 1, background_widget_style.rect.color[1], 0, 0.4, math.easeOutCubic)

	self.menu_input_description:change_generic_actions((self.allow_back_button and generic_input_actions.default_back) or generic_input_actions.default)

	self.render_settings.info_alpha_multiplier = 0
	self.render_settings.bot_selection_alpha_multiplier = 0

	if self.parent.show_hero_panel then
		self.parent:show_hero_panel()
		self.parent:set_input_blocked(false)
	end

	self:_start_transition_animation("fade_out", "on_exit_bot_selection")
	self:_play_sound("Play_hud_button_close")
end

CharacterSelectionStateCharacter._enter_bot_selection = function (self, selected_row)
	self._bot_selection = true
	self._bot_priority_copy = table.clone(PlayerData.bot_spawn_priority)
	local hero_widgets = self._hero_widgets
	local hero_widget_index = 1

	for row = 1, #PlayerData.bot_spawn_priority, 1 do
		local index = PlayerData.bot_spawn_priority[row]
		local profile = SPProfiles[index]
		local num_careers = #profile.careers

		for column = 1, num_careers, 1 do
			local widget = hero_widgets[hero_widget_index]
			widget.content.bot_selection_active = true
			hero_widget_index = hero_widget_index + 1
		end
	end

	for _, widget in pairs(self._hero_icon_widgets) do
		widget.content.bot_selection_active = true
	end

	local widgets_by_name = self._widgets_by_name
	local background_widget = widgets_by_name.background
	local background_widget_style = background_widget.style
	self._ui_animations.background = UIAnimation.init(UIAnimation.function_by_time, background_widget_style.rect.color, 1, background_widget_style.rect.color[1], 128, 0.4, math.easeOutCubic)

	self.menu_input_description:change_generic_actions(generic_input_actions.prioritize_bots)

	self.render_settings.main_alpha_multiplier = 1
	self.render_settings.info_alpha_multiplier = 0
	self.render_settings.bot_selection_alpha_multiplier = 0

	if self.parent.hide_hero_panel then
		self.parent:hide_hero_panel()
		self.parent:set_input_blocked(false)
	end

	self:_start_transition_animation("fade_in", "on_enter_bot_selection")
	self:_play_sound("Play_hud_button_open")
end

CharacterSelectionStateCharacter._handle_gamepad_selection = function (self, input_service)
	local selected_row = self._selected_hero_row
	local selected_column = self._selected_hero_column
	local num_max_rows = self._num_max_hero_rows
	local profile_index = ProfilePriority[selected_row]
	profile_index = PlayerData.bot_spawn_priority[selected_row]
	local profile = SPProfiles[profile_index]
	local num_max_columns = #profile.careers
	local allow_movement = true

	if input_service:get("refresh") and not self._bot_selection then
		self:_enter_bot_selection(self._selected_hero_row)
	else
		allow_movement = not self._current_selected_row

		if selected_row and selected_column and allow_movement then
			local modified = false

			if selected_column > 1 and input_service:get("move_left_hold_continuous") then
				selected_column = selected_column - 1
				modified = true
			elseif selected_column < num_max_columns and input_service:get("move_right_hold_continuous") then
				selected_column = selected_column + 1
				modified = true
			end

			if selected_row > 1 and input_service:get("move_up_hold_continuous") then
				selected_row = selected_row - 1
				num_max_columns = self._num_hero_columns[selected_row]
				modified = true
			elseif selected_row < num_max_rows and input_service:get("move_down_hold_continuous") then
				selected_row = selected_row + 1
				num_max_columns = self._num_hero_columns[selected_row]
				modified = true
			end

			if num_max_columns < selected_column then
				selected_column = num_max_columns
				modified = true
			end

			if modified then
				local profile_index = ProfilePriority[selected_row]
				local disable_hero_spawn = false
				profile_index = PlayerData.bot_spawn_priority[selected_row]
				disable_hero_spawn = self._bot_selection
				local career_index = selected_column

				self:_select_hero(profile_index, career_index, nil, disable_hero_spawn)
			end
		end
	end
end

CharacterSelectionStateCharacter._is_selected_hero_unlocked = function (self)
	local selected_row = self._selected_hero_row
	local selected_column = self._selected_hero_column
	local num_max_rows = self._num_max_hero_rows
	local widget_index = 1

	for i = 1, num_max_rows, 1 do
		local num_max_columns = self._num_hero_columns[i]

		for j = 1, num_max_columns, 1 do
			if selected_row == i and selected_column == j then
				local widget = self._hero_widgets[widget_index]
				local content = widget.content

				return not content.locked_reason or not content.locked
			end

			widget_index = widget_index + 1
		end
	end

	return false
end

CharacterSelectionStateCharacter._handle_gamepad_bot_selection = function (self, input_service)
	self:_handle_gamepad_selection(input_service)

	if input_service:get("confirm_press", true) and self:_is_selected_hero_unlocked() then
		local selected_row = self._selected_hero_row
		local selected_column = self._selected_hero_column
		local profile_index = PlayerData.bot_spawn_priority[selected_row]
		local hero_name = SPProfiles[profile_index].display_name
		local career_index = selected_column
		local hero_attributes = Managers.backend:get_interface("hero_attributes")

		hero_attributes:set(hero_name, "bot_career", career_index)
		self:_play_sound("play_gui_equipment_equip")
		self:_update_equipped_bots()
	elseif input_service:get("refresh") then
		if self._current_selected_row then
			self:_reset_bot_selection(true)
			self:_play_sound("hud_bot_order_release")
		else
			self:_set_bot_selection(self._selected_hero_row)
		end
	else
		local selected_row = self._current_selected_row
		local num_max_rows = self._num_max_hero_rows
		local modified = false

		if not selected_row then
			return
		end

		if selected_row > 1 and input_service:get("move_up_hold_continuous") then
			selected_row = selected_row - 1
			modified = true
		elseif selected_row < num_max_rows and input_service:get("move_down_hold_continuous") then
			selected_row = selected_row + 1
			modified = true
		end

		if modified then
			self:_play_sound("play_gui_equipment_inventory_hover")
			self:_update_bot_order(selected_row)
		end
	end
end

CharacterSelectionStateCharacter._update_bot_order = function (self, new_row, reset_x_offset)
	local old_row = self._current_selected_row

	table.remove(self._bot_priority_copy, old_row)
	table.insert(self._bot_priority_copy, new_row, self._current_selected_bot_index)

	self._current_selected_row = new_row
	local hero_widgets = self._hero_widgets
	local hero_icon_widgets = self._hero_icon_widgets
	local hero_widget_index = 1

	for row = 1, #PlayerData.bot_spawn_priority, 1 do
		local index = PlayerData.bot_spawn_priority[row]
		local profile = SPProfiles[index]
		local num_careers = #profile.careers
		local new_hero_row = table.find(self._bot_priority_copy, index)
		local offset = -((new_hero_row - 1) * 144)
		local is_old_row = row == old_row

		for column = 1, num_careers, 1 do
			local hero_widget = hero_widgets[hero_widget_index]
			local hero_widget_content = hero_widget.content
			self._ui_animations[index .. ":" .. column] = UIAnimation.init(UIAnimation.function_by_time, hero_widget.offset, 2, hero_widget.offset[2], offset, 0.25, math.easeOutCubic)

			if hero_widget_content.bot_order_selection and reset_x_offset then
				self._ui_animations[index .. ":" .. column .. "_x"] = UIAnimation.init(UIAnimation.function_by_time, hero_widget.offset, 1, hero_widget.offset[1], hero_widget.offset[1] - self._x_offset, 0.25, math.easeOutCubic)
			end

			hero_widget_index = hero_widget_index + 1
		end

		local row_diff = row - new_hero_row
		local icon_offset = row_diff * 144 + 7
		local hero_icon_widget = hero_icon_widgets[row]
		local hero_icon_widget_style = hero_icon_widget.style
		self._ui_animations["hero_icon_" .. index .. "_bg"] = UIAnimation.init(UIAnimation.function_by_time, hero_icon_widget_style.bg.offset, 2, hero_icon_widget_style.bg.offset[2], hero_icon_widget_style.bg.offset[2] * 0 + icon_offset, 0.25, math.easeOutCubic)
		self._ui_animations["hero_icon_" .. index .. "_hourglass_icon"] = UIAnimation.init(UIAnimation.function_by_time, hero_icon_widget_style.hourglass_icon.offset, 2, hero_icon_widget_style.hourglass_icon.offset[2], hero_icon_widget_style.hourglass_icon.offset[2] * 0 + icon_offset, 0.25, math.easeOutCubic)

		if hero_icon_widget.content.bot_order_selection and reset_x_offset then
			self._ui_animations["hero_icon_" .. index .. "_bg_x"] = UIAnimation.init(UIAnimation.function_by_time, hero_icon_widget_style.bg.offset, 1, hero_icon_widget_style.bg.offset[1], hero_icon_widget_style.bg.offset[1] - self._x_offset, 0.25, math.easeOutCubic)
			self._ui_animations["hero_icon_" .. index .. "_hourglass_icon_x"] = UIAnimation.init(UIAnimation.function_by_time, hero_icon_widget_style.hourglass_icon.offset, 1, hero_icon_widget_style.hourglass_icon.offset[1], hero_icon_widget_style.hourglass_icon.offset[1] - self._x_offset, 0.25, math.easeOutCubic)
		end
	end
end

CharacterSelectionStateCharacter._set_bot_selection = function (self, index)
	self._current_selected_bot_index = PlayerData.bot_spawn_priority[index]
	self._current_selected_row = index
	self._x_offset = 50
	self._base_y_offset = nil
	self._base_icon_y_offset = nil
	local input_service = self:input_service()
	local cursor = input_service:get("cursor")
	self._base_cursor_y_offset = cursor and cursor[2] * RESOLUTION_LOOKUP.inv_scale
	local hero_widget_index = 1

	for row = 1, #PlayerData.bot_spawn_priority, 1 do
		local index = PlayerData.bot_spawn_priority[row]
		local profile = SPProfiles[index]
		local num_careers = #profile.careers

		for column = 1, num_careers, 1 do
			if row == self._current_selected_row then
				self._hero_widgets[hero_widget_index].offset[1] = self._hero_widgets[hero_widget_index].offset[1] + self._x_offset
				self._hero_widgets[hero_widget_index].offset[3] = 100
				self._hero_widgets[hero_widget_index].content.bot_order_selection = true
				self._base_y_offset = self._hero_widgets[hero_widget_index].offset[2]
			end

			hero_widget_index = hero_widget_index + 1
		end
	end

	for index, widget in ipairs(self._hero_icon_widgets) do
		widget.content.bot_change_order_active = true

		if index == self._current_selected_row then
			widget.style.bg.offset[1] = widget.style.bg.offset[1] + self._x_offset
			widget.style.hourglass_icon.offset[1] = widget.style.hourglass_icon.offset[1] + self._x_offset
			widget.content.bot_order_selection = true
			self._base_icon_y_offset = widget.style.hourglass_icon.offset[2]
		end
	end

	self:_play_sound("hud_bot_order_grab")
end

CharacterSelectionStateCharacter._reset_bot_selection = function (self, select_hero)
	self._current_selected_bot_index = nil
	self._current_selected_row = nil
	self._x_offset = nil
	self._base_y_offset = nil
	self._base_icon_y_offset = nil
	self._base_cursor_y_offset = nil
	PlayerData.bot_spawn_priority = self._bot_priority_copy
	self._bot_priority_copy = table.clone(PlayerData.bot_spawn_priority)

	self.parent:set_input_blocked(false)
	self:_setup_hero_selection_widgets()

	if select_hero then
		local disable_hero_spawn = true
		local ignore_sound = true

		self:_select_hero(self._selected_profile_index, self._selected_career_index, ignore_sound, disable_hero_spawn)
	end

	local hero_widgets = self._hero_widgets
	local hero_widget_index = 1

	for row = 1, #PlayerData.bot_spawn_priority, 1 do
		local index = PlayerData.bot_spawn_priority[row]
		local profile = SPProfiles[index]
		local num_careers = #profile.careers

		for column = 1, num_careers, 1 do
			local widget = hero_widgets[hero_widget_index]
			widget.content.bot_selection = true
			widget.content.bot_order_selection = false
			hero_widget_index = hero_widget_index + 1
		end
	end

	for _, widget in pairs(self._hero_icon_widgets) do
		widget.content.bot_selection_active = true
		widget.content.bot_order_selection = false
	end
end

CharacterSelectionStateCharacter._handle_mouse_bot_selection = function (self, input_service)
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if gamepad_active then
		return
	end

	if not self.parent:input_blocked() then
		if self._current_selected_row then
			if not self._base_cursor_y_offset then
				local reset_x_offset = true

				self:_update_bot_order(self._current_selected_row, reset_x_offset)
				self.parent:set_input_blocked(true)

				return
			end

			local cursor = input_service:get("cursor")
			local y_offset = cursor[2] * RESOLUTION_LOOKUP.inv_scale
			local diff = y_offset - self._base_cursor_y_offset
			local max_offset = -((#PlayerData.bot_spawn_priority - 1) * 144)
			local offset_y = math.clamp(self._base_y_offset + diff, max_offset, 0)
			local icon_clamp = (self._base_y_offset + diff) - offset_y
			local hero_widgets = self._hero_widgets
			local hero_widget_index = 1

			for row = 1, #self._bot_priority_copy, 1 do
				local index = self._bot_priority_copy[row]
				local profile = SPProfiles[index]
				local num_careers = #profile.careers

				for column = 1, num_careers, 1 do
					local hero_widget = hero_widgets[hero_widget_index]
					local hero_widget_content = hero_widget.content

					if hero_widget_content.bot_order_selection then
						hero_widgets[hero_widget_index].offset[2] = offset_y
					end

					hero_widget_index = hero_widget_index + 1
				end
			end

			for i, hero_icon_widget in ipairs(self._hero_icon_widgets) do
				local content = hero_icon_widget.content

				if content.bot_order_selection then
					local style = hero_icon_widget.style
					style.bg.offset[2] = self._base_icon_y_offset + diff - icon_clamp
					style.hourglass_icon.offset[2] = self._base_icon_y_offset + diff - icon_clamp
				end
			end
		end

		local reset_x_offset = true

		for index, hero_icon_widget in ipairs(self._hero_icon_widgets) do
			if UIUtils.is_button_hover_enter(hero_icon_widget, "bot_change_order_hotspot") then
				if self._current_selected_row then
					self:_update_bot_order(index, false)
				end
			elseif UIUtils.is_button_held(hero_icon_widget, "bot_change_order_hotspot") then
				if not self._current_selected_row then
					self:_set_bot_selection(index)
				end
			elseif UIUtils.is_left_button_released(hero_icon_widget, "bot_change_order_hotspot") and self._current_selected_row then
				self:_update_bot_order(index, reset_x_offset)
				self.parent:set_input_blocked(true)
				self:_play_sound("hud_bot_order_release")

				break
			end
		end

		local hero_attributes = Managers.backend:get_interface("hero_attributes")
		local profiles = PlayerData.bot_spawn_priority
		local hero_widgets = self._hero_widgets
		local widget_index = 1

		for i = 1, self._num_max_hero_rows, 1 do
			local num_max_columns = self._num_hero_columns[i]

			for j = 1, num_max_columns, 1 do
				local widget = hero_widgets[widget_index]
				local content = widget.content
				local button_hotspot = content.button_hotspot

				if not content.locked and button_hotspot.on_right_click then
					local profile_index = profiles[i]
					local career_index = j
					local hero_name = SPProfiles[profile_index].display_name

					hero_attributes:set(hero_name, "bot_career", career_index)
					self:_play_sound("play_gui_equipment_equip")
					self:_update_equipped_bots()

					return
				end

				widget_index = widget_index + 1
			end
		end
	elseif table.size(self._ui_animations) == 0 then
		self:_reset_bot_selection()
	end
end

CharacterSelectionStateCharacter._select_hero = function (self, profile_index, career_index, ignore_sound, disable_hero_spawn)
	if not ignore_sound then
		self:_play_sound("play_gui_hero_select_career_click")
	end

	local profile_settings = SPProfiles[profile_index]
	local career_settings = profile_settings.careers[career_index]
	local hero_name = profile_settings.display_name
	local character_name = profile_settings.character_name
	local character_career_name = career_settings.display_name
	local hero_display_name = Localize(character_name)
	local career_display_name = Localize(character_career_name)
	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local hero_experience = hero_attributes:get(hero_name, "experience") or 0
	local level = ExperienceSettings.get_level(hero_experience)

	self:_set_hero_info(hero_display_name, career_display_name, level)
	self:_populate_career_info(profile_index, career_index)

	local hero_widgets = self._hero_widgets
	local num_max_rows = self._num_max_hero_rows
	self._spawn_hero = true

	if disable_hero_spawn then
		self._spawn_hero = false
	end

	self._selected_career_index = career_index
	self._selected_profile_index = profile_index
	self._selected_hero_name = hero_name
	self._selected_hero_row = table.find(PlayerData.bot_spawn_priority, profile_index)
	self._selected_hero_column = career_index

	self:_set_hero_icon_selected(self._selected_hero_row)

	local widget_index = 1

	for i = 1, num_max_rows, 1 do
		local num_max_columns = self._num_hero_columns[i]

		for j = 1, num_max_columns, 1 do
			local is_selected = i == self._selected_hero_row and j == self._selected_hero_column
			local widget = hero_widgets[widget_index]
			local content = widget.content
			content.button_hotspot.is_selected = is_selected

			if is_selected then
				local locked_info_text_content = self._widgets_by_name.locked_info_text.content
				local message = nil

				if content.locked_reason or content.locked then
					message = content.locked_reason
				end

				locked_info_text_content.locked = content.locked_reason or content.locked
				locked_info_text_content.text = message
				locked_info_text_content.visible = message ~= nil
			end

			widget_index = widget_index + 1
		end
	end
end

CharacterSelectionStateCharacter._get_skin_item_data = function (self, index, career_index)
	local profile_settings = SPProfiles[index]
	local skin_name = profile_settings.careers[career_index].base_skin

	return Cosmetics[skin_name]
end

CharacterSelectionStateCharacter._wanted_state = function (self)
	local new_state = self.parent:wanted_state()

	return new_state
end

CharacterSelectionStateCharacter.on_exit = function (self, params)
	if self.menu_input_description then
		self.menu_input_description:destroy()

		self.menu_input_description = nil
	end

	self:_destroy_video_player()
	self:_respawn_player()

	self.ui_animator = nil

	self.parent:set_input_blocked(false)
	print("[HeroViewState] Exit Substate CharacterSelectionStateCharacter")
end

CharacterSelectionStateCharacter._respawn_player = function (self)
	if self._respawn_player_unit then
		if self.is_server then
			Managers.state.network.network_server:peer_respawn_player(self.peer_id)
		else
			Managers.state.network.network_transmit:send_rpc_server("rpc_client_respawn_player")
		end

		self._respawn_player_unit = nil
	end
end

CharacterSelectionStateCharacter._update_transition_timer = function (self, dt)
	if not self._transition_timer then
		return
	end

	if self._transition_timer == 0 then
		self._transition_timer = nil
	else
		self._transition_timer = math.max(self._transition_timer - dt, 0)
	end
end

CharacterSelectionStateCharacter.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	for name, animation in pairs(self._ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			self._ui_animations[name] = nil
		end
	end

	self:_update_available_profiles()
	self:_update_profile_request()
	self:_update_video_player_settings()

	if not self._prepare_exit then
		self:_handle_input(dt, t)
	end

	local wanted_state = self:_wanted_state()

	if not self._transition_timer and not self:pending_profile_request() and (wanted_state or self._new_state) then
		if self.world_previewer:has_units_spawned() then
			self._prepare_exit = true
		elseif not self._prepare_exit then
			return wanted_state or self._new_state
		end
	end

	self:draw(dt)
end

CharacterSelectionStateCharacter.post_update = function (self, dt, t)
	self.ui_animator:update(dt)
	self:_update_animations(dt)

	local transitioning = self.parent:transitioning()

	if not transitioning and not self._transition_timer then
		if self._prepare_exit then
			self._prepare_exit = false

			self.world_previewer:prepare_exit()
		elseif self._spawn_hero then
			self._spawn_hero = nil
			local hero_name = self._selected_hero_name or self._hero_name

			self:_spawn_hero_unit(hero_name)
		end
	end

	local profile_synchronizer = Managers.state.network.profile_synchronizer
	local peer_id = self.local_player:network_id()
	local local_player_id = self.local_player:local_player_id()

	if self._despawning_player_unit_career_change and not Unit.alive(self._despawning_player_unit_career_change) and profile_synchronizer:all_ingame_synced_for_peer(peer_id, local_player_id) then
		local position = self._respawn_position:unbox()
		local rotation = self._respawn_rotation:unbox()

		self.local_player:spawn(position, rotation)

		self._despawning_player_unit_career_change = nil
		self._resyncing_loadout = nil

		self.parent:close_menu()
	end
end

CharacterSelectionStateCharacter.draw = function (self, dt)
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_manager = self.input_manager
	local parent = self.parent
	local input_service = self:input_service()
	local render_settings = self.render_settings
	local gamepad_active = Managers.input:is_device_active("gamepad")
	self._widgets_by_name.bottom_panel.content.visible = gamepad_active

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	render_settings.alpha_multiplier = render_settings.main_alpha_multiplier

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	for _, widget in ipairs(self._hero_widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	for _, widget in ipairs(self._hero_icon_widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	if not self._draw_video_next_frame then
		if self._video_widget and not self._prepare_exit then
			if not self._video_created then
				UIRenderer.draw_widget(ui_top_renderer, self._video_widget)
			else
				self._video_created = nil
			end
		end
	elseif self._draw_video_next_frame then
		self._draw_video_next_frame = nil
	end

	render_settings.alpha_multiplier = render_settings.info_alpha_multiplier

	for _, widget in ipairs(self._info_widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	render_settings.alpha_multiplier = render_settings.bot_selection_alpha_multiplier

	for _, widget in ipairs(self._bot_selection_widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	UIRenderer.end_pass(ui_top_renderer)

	if gamepad_active then
		self.menu_input_description:draw(ui_top_renderer, dt)
	end
end

CharacterSelectionStateCharacter._update_animations = function (self, dt)
	local select_button = self._widgets_by_name.select_button

	UIWidgetUtils.animate_default_button(select_button, dt)

	local bot_priority_button = self._widgets_by_name.bot_priority_button
	local back_button = self._widgets_by_name.back_button

	UIWidgetUtils.animate_default_button(bot_priority_button, dt)
	UIWidgetUtils.animate_default_button(back_button, dt)

	if self.pick_time then
		self.pick_time = math.clamp(self.pick_time - dt, 0, 100)
		select_button.content.title_text = string.format("Confirm %.1f", self.pick_time)
		select_button.element.dirty = true
	end

	if self:_is_button_hover_enter(select_button) then
		self:_play_sound("play_gui_start_menu_button_hover")
	end

	if self:_is_button_hover_enter(bot_priority_button) then
		self:_play_sound("play_gui_start_menu_button_hover")
	end

	local animations = self._animations
	local ui_animator = self.ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end
end

CharacterSelectionStateCharacter._spawn_hero_unit = function (self, hero_name)
	local world_previewer = self.world_previewer
	local career_index = self._selected_career_index
	local callback = callback(self, "cb_hero_unit_spawned", hero_name)

	world_previewer:request_spawn_hero_unit(hero_name, career_index, not self.use_user_skins, callback, nil, 0.5)
end

CharacterSelectionStateCharacter.cb_hero_unit_spawned = function (self, hero_name)
	local world_previewer = self.world_previewer
	local career_index = self._selected_career_index
	local profile_index = FindProfileIndex(hero_name)
	local profile = SPProfiles[profile_index]
	local careers = profile.careers
	local career_settings = careers[career_index]
	local preview_animation = career_settings.preview_animation
	local preview_wield_slot = career_settings.preview_wield_slot
	local preview_items = career_settings.preview_items

	if preview_items then
		for _, item_data in ipairs(preview_items) do
			local item_name = item_data.item_name
			local item_template = ItemMasterList[item_name]
			local slot_type = item_template.slot_type
			local slot_names = InventorySettings.slot_names_by_type[slot_type]
			local slot_name = slot_names[1]
			local slot = InventorySettings.slots_by_name[slot_name]

			world_previewer:equip_item(item_name, slot)
		end

		if preview_wield_slot then
			world_previewer:wield_weapon_slot(preview_wield_slot)
		end
	end

	if self.use_user_skins then
		local career_name = career_settings.name
		local item = BackendUtils.get_loadout_item(career_name, "slot_hat")

		if item then
			local item_data = item.data
			local item_name = item_data.name
			local backend_id = item.backend_id
			local slot = InventorySettings.slots_by_name.slot_hat

			world_previewer:equip_item(item_name, slot, backend_id)
		end

		local skin_item = BackendUtils.get_loadout_item(career_name, "slot_skin")
		local skin_item_data = skin_item and skin_item.data

		if skin_item_data then
			preview_animation = skin_item_data.career_select_preview_animation or preview_animation
		end
	end

	if preview_animation then
		self.world_previewer:play_character_animation(preview_animation)
	end
end

CharacterSelectionStateCharacter._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

CharacterSelectionStateCharacter._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

CharacterSelectionStateCharacter._is_button_hover_exit = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_exit
end

CharacterSelectionStateCharacter._populate_career_info = function (self, profile_index, career_index)
	local ui_scenegraph = self.ui_scenegraph
	local ui_top_renderer = self.ui_top_renderer
	local widgets_by_name = self._widgets_by_name
	local profile = SPProfiles[profile_index]
	local hero_name = profile.display_name
	local career_settings = profile.careers[career_index]
	local career_name = career_settings.name
	local passive_ability_data = career_settings.passive_ability
	local activated_ability_data = career_settings.activated_ability[1]
	local passive_display_name = passive_ability_data.display_name
	local passive_description = passive_ability_data.description
	local passive_icon = passive_ability_data.icon
	local activated_display_name = activated_ability_data.display_name
	local activated_description = activated_ability_data.description
	local activated_icon = activated_ability_data.icon
	widgets_by_name.passive_title_text.content.text = Localize(passive_display_name)
	widgets_by_name.passive_description_text.content.text = Localize(passive_description)
	widgets_by_name.passive_icon.content.texture_id = passive_icon
	widgets_by_name.active_title_text.content.text = Localize(activated_display_name)
	widgets_by_name.active_description_text.content.text = Localize(activated_description)
	widgets_by_name.active_icon.content.texture_id = activated_icon
	local passive_perks = passive_ability_data.perks
	local total_perks_height = 0
	local perks_height_spacing = 0

	for i = 1, 3, 1 do
		local widget = widgets_by_name["career_perk_" .. i]
		local content = widget.content
		local style = widget.style
		local scenegraph_id = widget.scenegraph_id
		local scenegraph = ui_scenegraph[scenegraph_id]
		local size = scenegraph.size
		local offset = widget.offset
		offset[2] = -total_perks_height
		local data = passive_perks[i]

		if data then
			local display_name = Localize(data.display_name)
			local description = Localize(data.description)
			local title_text_style = style.title_text
			local description_text_style = style.description_text
			local description_text_shadow_style = style.description_text_shadow
			content.title_text = display_name
			content.description_text = description
			local title_height = UIUtils.get_text_height(ui_top_renderer, size, title_text_style, display_name)
			local description_height = UIUtils.get_text_height(ui_top_renderer, size, description_text_style, description)
			description_text_style.offset[2] = -description_height
			description_text_shadow_style.offset[2] = -(description_height + 2)
			total_perks_height = total_perks_height + title_height + description_height + perks_height_spacing
		end

		content.visible = data ~= nil
	end

	local video = career_settings.video
	local material_name = video.material_name
	local resource = video.resource
	self._current_video_settings = {
		video = video,
		material_name = material_name,
		resource = resource
	}

	self:_destroy_video_player()
end

CharacterSelectionStateCharacter._handle_input = function (self, dt, t)
	local input_service = self:input_service()
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if self._bot_selection then
		self:_handle_gamepad_bot_selection(input_service)
		self:_handle_mouse_bot_selection(input_service)

		local back_button = self._widgets_by_name.back_button
		local back_pressed = (gamepad_active and input_service:get("back_menu_alt", true)) or input_service:get("toggle_menu", true) or input_service:get("back", true)

		if back_pressed or UIUtils.is_button_pressed(back_button) then
			self:_exit_bot_selection()
		end
	else
		self:_handle_gamepad_selection(input_service)
		self:_handle_mouse_selection()

		local current_profile_index, current_career_index = self.profile_synchronizer:profile_by_peer(self.peer_id, self.local_player_id)
		local select_button = self._widgets_by_name.select_button
		local confirm_available = not select_button.content.button_hotspot.disable_button
		local bot_priority_button = self._widgets_by_name.bot_priority_button
		local confirm_pressed = confirm_available and input_service:get("confirm_press", true)
		local back_pressed = (self.allow_back_button and input_service:get("back_menu_alt", true)) or input_service:get("back", true)

		if self:_is_button_pressed(select_button) or confirm_pressed then
			self:_play_sound("play_gui_start_menu_button_click")

			if select_button.content.dlc_name then
				Managers.state.event:trigger("ui_show_popup", select_button.content.dlc_name, "upsell")
			elseif current_profile_index ~= self._selected_profile_index or current_career_index ~= self._selected_career_index then
				local dlc_name = select_button.content.verify_dlc_name

				if dlc_name and Managers.unlock:dlc_requires_restart(dlc_name) then
					self.parent:close_menu()

					return
				end

				self:_change_profile(self._selected_profile_index, self._selected_career_index)
				self.parent:set_input_blocked(true)
			else
				self.parent:close_menu()
			end
		elseif back_pressed then
			self.parent:close_menu()
		elseif self:_is_button_pressed(bot_priority_button) then
			self:_enter_bot_selection()
		end
	end
end

CharacterSelectionStateCharacter._set_hero_info = function (self, hero_name, career_name, level)
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.info_hero_name.content.text = hero_name
	widgets_by_name.info_career_name.content.text = career_name
	widgets_by_name.info_hero_level.content.text = level
end

CharacterSelectionStateCharacter._set_select_button_enabled = function (self, enabled, required_dlc_name, dlc_name)
	if self._bot_selection then
		local button_content = self._widgets_by_name.select_button.content

		if enabled then
			self.menu_input_description:set_input_description(generic_input_actions.bot_selection_available)
		else
			self.menu_input_description:set_input_description(nil)
		end
	else
		local button_content = self._widgets_by_name.select_button.content

		if enabled then
			button_content.title_text = Localize("input_description_confirm")
			button_content.button_hotspot.disable_button = false
			button_content.verify_dlc_name = dlc_name
			button_content.dlc_name = nil

			self.menu_input_description:set_input_description(generic_input_actions.available)
		elseif required_dlc_name then
			button_content.title_text = Localize("menu_store_purchase_button_unlock")
			button_content.button_hotspot.disable_button = false
			button_content.dlc_name = required_dlc_name
			button_content.verify_dlc_name = nil

			self.menu_input_description:set_input_description(generic_input_actions.purchase)
		else
			button_content.title_text = Localize("dlc1_2_difficulty_unavailable")
			button_content.button_hotspot.disable_button = true
			button_content.dlc_name = nil
			button_content.verify_dlc_name = nil

			self.menu_input_description:set_input_description(nil)
		end
	end
end

CharacterSelectionStateCharacter._play_sound = function (self, event)
	self.parent:play_sound(event)
end

CharacterSelectionStateCharacter.get_camera_position = function (self)
	local world, viewport = self.parent:get_background_world()
	local camera = ScriptViewport.camera(viewport)

	return ScriptCamera.position(camera)
end

CharacterSelectionStateCharacter.get_camera_rotation = function (self)
	local world, viewport = self.parent:get_background_world()
	local camera = ScriptViewport.camera(viewport)

	return ScriptCamera.rotation(camera)
end

CharacterSelectionStateCharacter.trigger_unit_flow_event = function (self, unit, event_name)
	if unit and Unit.alive(unit) then
		Unit.flow_event(unit, event_name)
	end
end

CharacterSelectionStateCharacter._start_transition_animation = function (self, key, animation_name)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings
	}
	local widgets = self._widgets_by_name
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[key] = anim_id
end

CharacterSelectionStateCharacter._change_profile = function (self, profile_index, career_index)
	local peer_id = self.peer_id
	local local_player_id = 1
	local profile = SPProfiles[profile_index]
	local profile_name = profile.display_name
	local career_name = profile.careers[career_index].display_name
	local force_respawn = true

	self._profile_requester:request_profile(peer_id, local_player_id, profile_name, career_name, force_respawn)

	self._pending_profile_request = true
	self._requested_profile_index = profile_index
	self._requested_career_index = career_index
end

CharacterSelectionStateCharacter._change_career = function (self, profile_index, career_index)
	local player = self.local_player
	local player_unit = player.player_unit

	if player.player_unit then
		self._despawning_player_unit_career_change = player_unit

		Managers.state.spawn:delayed_despawn(player)

		self._respawn_position = Vector3Box(POSITION_LOOKUP[player_unit])
		self._respawn_rotation = QuaternionBox(Unit.local_rotation(player_unit, 0))
	end

	local profile_settings = SPProfiles[profile_index]
	local hero_name = profile_settings.display_name

	self:_save_selected_profile(profile_index)

	local peer_id = player:network_id()
	local local_player_id = player:local_player_id()

	self._profile_synchronizer:resync_loadout(peer_id, local_player_id)
	CosmeticUtils.sync_local_player_cosmetics(player, profile_index, career_index)

	self._resyncing_loadout = true
end

CharacterSelectionStateCharacter.pending_profile_request = function (self)
	return self._pending_profile_request
end

CharacterSelectionStateCharacter._save_selected_profile = function (self, profile_index)
	if not SaveData.first_hero_selection_made then
		SaveData.first_hero_selection_made = true
	end

	SaveData.wanted_profile_index = profile_index

	Managers.save:auto_save(SaveFileName, SaveData, nil)
end

CharacterSelectionStateCharacter._update_profile_request = function (self)
	if self._pending_profile_request then
		local profile_requester = self._profile_requester
		local result = profile_requester:result()

		if result == "success" then
			self._pending_profile_request = nil
			local profile_index = self._requested_profile_index
			local career_index = self._requested_career_index

			self:_save_selected_profile(profile_index)
			self.parent:set_current_hero(profile_index)

			if self._close_on_successful_profile_request then
				self.parent:close_menu()
			end

			self._close_on_successful_profile_request = true
		elseif result == "failure" then
			self._pending_profile_request = nil

			self.parent:set_input_blocked(false)
		end
	end
end

CharacterSelectionStateCharacter._on_option_button_hover = function (self, widget, style_id)
	local ui_animations = self._ui_animations
	local animation_name = "option_button_" .. style_id
	local widget_style = widget.style
	local pass_style = widget_style[style_id]
	local current_color_value = pass_style.color[2]
	local target_color_value = 255
	local total_time = UISettings.scoreboard.topic_hover_duration
	local animation_duration = (1 - current_color_value / target_color_value) * total_time

	for i = 2, 4, 1 do
		if animation_duration > 0 then
			ui_animations[animation_name .. "_hover_" .. i] = self:_animate_element_by_time(pass_style.color, i, current_color_value, target_color_value, animation_duration)
		else
			pass_style.color[i] = target_color_value
		end
	end
end

CharacterSelectionStateCharacter._on_option_button_dehover = function (self, widget, style_id)
	local ui_animations = self._ui_animations
	local animation_name = "option_button_" .. style_id
	local widget_style = widget.style
	local pass_style = widget_style[style_id]
	local current_color_value = pass_style.color[1]
	local target_color_value = 100
	local total_time = UISettings.scoreboard.topic_hover_duration
	local animation_duration = current_color_value / 255 * total_time

	for i = 2, 4, 1 do
		if animation_duration > 0 then
			ui_animations[animation_name .. "_hover_" .. i] = self:_animate_element_by_time(pass_style.color, i, current_color_value, target_color_value, animation_duration)
		else
			pass_style.color[1] = target_color_value
		end
	end
end

CharacterSelectionStateCharacter.play_sound = function (self, event)
	return
end

CharacterSelectionStateCharacter._animate_element_by_time = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.function_by_time, target, target_index, from, to, time, math.ease_out_quad)

	return new_animation
end

CharacterSelectionStateCharacter._animate_element_by_catmullrom = function (self, target, target_index, target_value, p0, p1, p2, p3, time)
	local new_animation = UIAnimation.init(UIAnimation.catmullrom, target, target_index, target_value, p0, p1, p2, p3, time)

	return new_animation
end

CharacterSelectionStateCharacter.input_service = function (self)
	return ((self._pending_profile_request or self._resyncing_loadout or self.parent:input_blocked()) and FAKE_INPUT_SERVICE) or self.parent:input_service(true)
end

return

require("scripts/settings/profiles/sp_profiles")

local definitions = local_require("scripts/ui/views/character_selection_view/states/definitions/character_selection_state_character_definitions")
local character_selection_widget_definitions = definitions.character_selection_widgets
local widget_definitions = definitions.widgets
local hero_widget_definition = definitions.hero_widget
local hero_icon_widget_definition = definitions.hero_icon_widget
local generic_input_actions = definitions.generic_input_actions
local animation_definitions = definitions.animation_definitions
local scenegraph_definition = definitions.scenegraph_definition
local DO_RELOAD = false
local VIDEO_REFERENCE_NAME = "CharacterSelectionStateCharacter"
local fake_input_service = {
	get = function ()
		return
	end,
	has = function ()
		return
	end
}
CharacterSelectionStateCharacter = class(CharacterSelectionStateCharacter)
CharacterSelectionStateCharacter.NAME = "CharacterSelectionStateCharacter"

CharacterSelectionStateCharacter.on_enter = function (self, params)
	self.parent:clear_wanted_state()
	print("[HeroViewState] Enter Substate CharacterSelectionStateCharacter")

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
	local gui_layer = UILayer.default + 30
	local input_description_input_service = parent:input_service(true)
	self.menu_input_description = MenuInputDescriptionUI:new(ingame_ui_context, self.ui_top_renderer, input_description_input_service, 3, gui_layer, (params.allow_back_button and generic_input_actions.default_back) or generic_input_actions.default, true)

	self.menu_input_description:set_input_description(nil)
	self:create_ui_elements(params)
	self:_start_transition_animation("on_enter", "on_enter")

	self._hero_preview_skin = nil
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
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets
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
	local num_max_rows = #SPProfilesAbbreviation
	local num_max_columns = 0

	for i, profile_index in ipairs(ProfilePriority) do
		local profile_settings = SPProfiles[profile_index]
		local hero_name = profile_settings.display_name
		local hero_experience = hero_attributes:get(hero_name, "experience") or 0
		local hero_level = ExperienceSettings.get_level(hero_experience)
		local careers = profile_settings.careers
		num_max_columns = math.max(num_max_columns, #careers)
		local icon_widget = UIWidget.init(hero_icon_widget_definition)
		hero_icon_widgets[#hero_icon_widgets + 1] = icon_widget
		local hero_icon_offset = icon_widget.offset
		hero_icon_offset[2] = -((i - 1) * 144)
		local hero_icon_texture = "hero_icon_large_" .. hero_name
		icon_widget.content.icon = hero_icon_texture
		icon_widget.content.icon_selected = hero_icon_texture .. "_glow"

		for j, career in ipairs(careers) do
			local widget = UIWidget.init(hero_widget_definition)
			hero_widgets[#hero_widgets + 1] = widget
			local offset = widget.offset
			local content = widget.content
			content.career_settings = career
			local portrait_image = career.portrait_image
			content.portrait = "medium_" .. portrait_image
			local is_career_unlocked = career.is_unlocked_function(hero_name, hero_level)
			content.locked = not is_career_unlocked
			offset[1] = (j - 1) * 124
			offset[2] = -((i - 1) * 144)
		end
	end

	self._num_max_hero_rows = num_max_rows
	self._num_max_hero_columns = num_max_columns
end

CharacterSelectionStateCharacter._update_available_profiles = function (self)
	local available_profiles = self._available_profiles
	local hero_widgets = self._hero_widgets
	local player = Managers.player:local_player()
	local profile_synchronizer = self.profile_synchronizer
	local own_player_profile_index = player ~= nil and player:profile_index()
	local own_player_career_index = player ~= nil and player:career_index()
	local widget_index = 1
	local is_button_enabled = true
	local selected_career_index = self._selected_career_index
	local selected_profile_index = self._selected_profile_index
	local mechanism_manager = Managers.mechanism

	for i, profile_index in ipairs(ProfilePriority) do
		local profile_settings = SPProfiles[profile_index]
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
			local content = widget.content
			local is_career_locked = content.locked
			content.taken = not can_play_profile

			if j == selected_career_index and selected_profile_index == profile_index then
				is_button_enabled = can_play_profile and not is_career_locked
			end

			widget_index = widget_index + 1
		end
	end

	self:_set_select_button_enabled(is_button_enabled)
end

CharacterSelectionStateCharacter._handle_mouse_selection = function (self)
	local hero_widgets = self._hero_widgets
	local num_max_rows = self._num_max_hero_rows
	local num_max_columns = self._num_max_hero_columns
	local selected_row = self._selected_hero_row
	local selected_column = self._selected_hero_column
	local widget_index = 1

	for i = 1, num_max_rows, 1 do
		for j = 1, num_max_columns, 1 do
			local widget = hero_widgets[widget_index]
			local content = widget.content
			local button_hotspot = content.button_hotspot

			if button_hotspot.on_pressed and (i ~= selected_row or j ~= selected_column) then
				local profile_index = ProfilePriority[i]
				local career_index = j

				self:_select_hero(profile_index, career_index)

				return
			end

			widget_index = widget_index + 1
		end
	end
end

CharacterSelectionStateCharacter._handle_gamepad_selection = function (self, input_service)
	local num_max_rows = self._num_max_hero_rows
	local num_max_columns = self._num_max_hero_columns
	local selected_row = self._selected_hero_row
	local selected_column = self._selected_hero_column

	if selected_row and selected_column then
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
			modified = true
		elseif selected_row < num_max_rows and input_service:get("move_down_hold_continuous") then
			selected_row = selected_row + 1
			modified = true
		end

		if modified then
			local profile_index = ProfilePriority[selected_row]
			local career_index = selected_column

			self:_select_hero(profile_index, career_index)
		end
	end
end

CharacterSelectionStateCharacter._select_hero = function (self, profile_index, career_index, ignore_sound)
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
	local num_max_columns = self._num_max_hero_columns
	self._spawn_hero = true
	self._selected_career_index = career_index
	self._selected_profile_index = profile_index
	self._selected_hero_name = hero_name
	self._selected_hero_row = ProfileIndexToPriorityIndex[profile_index]
	self._selected_hero_column = career_index

	self:_set_hero_icon_selected(self._selected_hero_row)

	local widget_index = 1
	local is_career_locked = false

	for i = 1, num_max_rows, 1 do
		for j = 1, num_max_columns, 1 do
			local is_selected = i == self._selected_hero_row and j == self._selected_hero_column
			local widget = hero_widgets[widget_index]
			local content = widget.content
			content.button_hotspot.is_selected = is_selected

			if is_selected then
				is_career_locked = content.locked
			end

			widget_index = widget_index + 1
		end
	end

	local locked_info_text = self._widgets_by_name.locked_info_text

	if is_career_locked then
		local required_level = career_settings.unlocked_at_level_function(hero_name)
		locked_info_text.content.text = Localize("career_locked_info") .. " " .. tostring(required_level)
	end

	locked_info_text.content.visible = is_career_locked
end

CharacterSelectionStateCharacter._get_skin_item_data = function (self, index, career_index)
	local profile_settings = SPProfiles[index]
	local skin_name = profile_settings.careers[career_index].base_skin

	return Cosmetics[skin_name]
end

CharacterSelectionStateCharacter._align_hero_selection_frames = function (self)
	local widgets_by_name = self._widgets_by_name
	local spacing = 100

	for index, profile_index in ipairs(ProfilePriority) do
		local widget_name = "hero_selection_frame_" .. index
		local widget = widgets_by_name[widget_name]
		local scenegraph_id = widget.scenegraph_id
		local size = scenegraph_definition[scenegraph_id].size
		widget.offset[2] = -(size[2] * (index - 1) + spacing * (index - 1))
	end
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

	if self._despawning_player_unit_career_change and not Unit.alive(self._despawning_player_unit_career_change) and self.profile_synchronizer:all_clients_have_loaded_sync_id(self._resync_id) then
		local player_manager = self.player_manager
		local peer_id = self.peer_id
		local player = player_manager:player_from_peer_id(peer_id)
		local position = self._respawn_position:unbox()
		local rotation = self._respawn_rotation:unbox()

		player:spawn(position, rotation)

		self._despawning_player_unit_career_change = nil
		self._resync_id = nil

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

	UIRenderer.end_pass(ui_top_renderer)

	if gamepad_active then
		self.menu_input_description:draw(ui_top_renderer, dt)
	end
end

CharacterSelectionStateCharacter._update_animations = function (self, dt)
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

	world_previewer:request_spawn_hero_unit(hero_name, career_index, true, callback, nil, 0.5)
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

	self:_handle_gamepad_selection(input_service)
	self:_handle_mouse_selection()

	local current_profile_index, current_career_index = self.profile_synchronizer:profile_by_peer(self.peer_id, self.local_player_id)
	local select_button = self._widgets_by_name.select_button

	UIWidgetUtils.animate_default_button(select_button, dt)

	if self.pick_time then
		self.pick_time = math.clamp(self.pick_time - dt, 0, 100)
		select_button.content.title_text = string.format("Confirm %.1f", self.pick_time)
		select_button.element.dirty = true
	end

	if self:_is_button_hover_enter(select_button) then
		self:_play_sound("play_gui_start_menu_button_hover")
	end

	local gamepad_active = Managers.input:is_device_active("gamepad")
	local confirm_available = not select_button.content.button_hotspot.disable_button
	local confirm_pressed = gamepad_active and confirm_available and input_service:get("confirm_press", true)
	local back_pressed = gamepad_active and self.allow_back_button and input_service:get("back_menu", true)

	if self:_is_button_pressed(select_button) or confirm_pressed then
		self:_play_sound("play_gui_start_menu_button_click")

		if current_profile_index ~= self._selected_profile_index or current_career_index ~= self._selected_career_index then
			self:_change_profile(self._selected_profile_index, self._selected_career_index)
			self.parent:set_input_blocked(true)
		else
			self.parent:close_menu()
		end
	elseif back_pressed then
		self.parent:close_menu()
	end
end

CharacterSelectionStateCharacter._set_hero_info = function (self, hero_name, career_name, level)
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.info_hero_name.content.text = hero_name
	widgets_by_name.info_career_name.content.text = career_name
	widgets_by_name.info_hero_level.content.text = level
end

CharacterSelectionStateCharacter._set_select_button_enabled = function (self, enabled)
	local button_content = self._widgets_by_name.select_button.content
	button_content.title_text = (enabled and Localize("input_description_confirm")) or Localize("dlc1_2_difficulty_unavailable")
	button_content.button_hotspot.disable_button = not enabled

	if enabled then
		self.menu_input_description:set_input_description(generic_input_actions.available)
	else
		self.menu_input_description:set_input_description(nil)
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
	local widgets = {}
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
	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local hero_name = profile_settings.display_name

	hero_attributes:set(hero_name, "career", career_index)
	self:_save_selected_profile(profile_index)

	self._resync_id = self.profile_synchronizer:resync_loadout(self._selected_profile_index, career_index, player)
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
			local hero_attributes = Managers.backend:get_interface("hero_attributes")
			local hero_name = SPProfiles[profile_index].display_name

			hero_attributes:set(hero_name, "career", career_index)
			self:_save_selected_profile(profile_index)

			if self.parent.last_hero_picked then
				self.parent:last_hero_picked(profile_index, career_index)
			end

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
	return ((self._pending_profile_request or self._resync_id or self.parent:input_blocked()) and fake_input_service) or self.parent:input_service(true)
end

return

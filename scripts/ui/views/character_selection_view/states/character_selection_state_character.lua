require("scripts/settings/profiles/sp_profiles")

local definitions = local_require("scripts/ui/views/character_selection_view/states/definitions/character_selection_state_character_definitions")
local character_selection_widget_definitions = definitions.character_selection_widgets
local widget_definitions = definitions.widgets
local generic_input_actions = definitions.generic_input_actions
local animation_definitions = definitions.animation_definitions
local scenegraph_definition = definitions.scenegraph_definition
local DO_RELOAD = false
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
	self.world_previewer = params.world_previewer
	self.wwise_world = params.wwise_world
	self.platform = PLATFORM
	local player_manager = Managers.player
	local local_player = player_manager.local_player(player_manager)
	self._stats_id = local_player.stats_id(local_player)
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self.local_player_id = ingame_ui_context.local_player_id
	self.local_player = local_player
	self._animations = {}
	self._ui_animations = {}
	self._available_profiles = {}
	local parent = self.parent
	local input_service = parent.input_service(parent)
	local gui_layer = UILayer.default + 30
	self.menu_input_description = MenuInputDescriptionUI:new(ingame_ui_context, self.ui_top_renderer, input_service, 3, gui_layer, generic_input_actions.default)

	self.menu_input_description:set_input_description(nil)
	self.create_ui_elements(self, params)
	self._start_transition_animation(self, "on_enter", "on_enter")

	self._hero_preview_skin = nil
	local profile_index = self.profile_synchronizer:profile_by_peer(self.peer_id, self.local_player_id)

	self._select_hero_tab_by_profile_index(self, profile_index)

	return 
end
CharacterSelectionStateCharacter._setup_video_player = function (self, material_name, resource)
	self._destroy_video_player(self)

	local ui_top_renderer = self.ui_top_renderer
	local set_loop = true
	local world, viewport = self.parent:get_background_world()

	UIRenderer.create_video_player(ui_top_renderer, world, resource, set_loop)

	local scenegraph_id = "info_window_video"
	local widget_definition = UIWidgets.create_video(scenegraph_id, material_name)
	local widget = UIWidget.init(widget_definition)
	self._video_widget = widget
	self._video_created = true

	return 
end
CharacterSelectionStateCharacter._destroy_video_player = function (self)
	local ui_top_renderer = self.ui_top_renderer
	local widget = self._video_widget

	if widget then
		UIWidget.destroy(ui_top_renderer, widget)

		self._video_widget = nil
	end

	if ui_top_renderer and ui_top_renderer.video_player then
		local world, viewport = self.parent:get_background_world()

		UIRenderer.destroy_video_player(ui_top_renderer, world)
	end

	self._video_created = nil

	return 
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

	UIRenderer.clear_scenegraph_queue(self.ui_top_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	self._assign_hero_portraits(self)

	return 
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
		widget.offset[2] = -(size[2]*(index - 1) + spacing*(index - 1))
	end

	return 
end
CharacterSelectionStateCharacter._assign_hero_portraits = function (self)
	local widget = self._widgets_by_name.hero_tabs
	local content = widget.content
	local style = widget.style
	local gui = self.ui_top_renderer.gui

	for index, profile_index in ipairs(ProfilePriority) do
		local name_sufix = "_" .. tostring(index)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = content[hotspot_name]
		local profile_settings = SPProfiles[profile_index]
		local hero_selection_image = profile_settings.hero_selection_image
		local icon_name = "icon" .. name_sufix
		hotspot_content[icon_name] = hero_selection_image
		local icon_size = style[icon_name].size
		local selection_glow_texture = "hero_icon_glow"
		local selection_glow_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(selection_glow_texture)
		local selection_glow_texture_size = selection_glow_texture_settings.size
		local selection_icon_name = "selection_icon" .. name_sufix
		hotspot_content[selection_icon_name] = selection_glow_texture
		local selection_style = style[selection_icon_name]
		local selection_texture_size = selection_style.size
		local selection_offset = selection_style.offset
		local selection_default_offset = selection_style.default_offset
		selection_texture_size[1] = selection_glow_texture_size[1]
		selection_texture_size[2] = selection_glow_texture_size[2]
		selection_offset[1] = (selection_default_offset[1] + icon_size[1]/2) - selection_texture_size[1]/2
		selection_offset[2] = (selection_default_offset[2] + icon_size[2]/2) - selection_texture_size[2]/2
	end

	return 
end
CharacterSelectionStateCharacter._assign_career_data_by_hero = function (self, hero_name)
	local widget = self._widgets_by_name.career_tabs
	local content = widget.content
	local style = widget.style
	local amount = content.amount
	local gui = self.ui_top_renderer.gui
	local profile_index = FindProfileIndex(hero_name)
	local profile = SPProfiles[profile_index]
	local careers = profile.careers
	local selection_texture = "portrait_glow"
	local selection_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(selection_texture)
	local selection_texture_size = selection_texture_settings.size
	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local hero_experience = hero_attributes.get(hero_attributes, hero_name, "experience") or 0
	local hero_level = ExperienceSettings.get_level(hero_experience)

	for i = 1, amount, 1 do
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = content[hotspot_name]
		local career_settings = careers[i]
		local is_career_unlocked = career_settings.is_unlocked_function(hero_name, hero_level)
		hotspot_content.locked = not is_career_unlocked
		local portrait_image = career_settings.portrait_image
		local character_selection_image = career_settings.character_selection_image
		local display_name = career_settings.display_name
		local image_name = "icon" .. name_sufix
		hotspot_content[image_name] = portrait_image
		local icon_size = style[image_name].size
		local title_text_name = "title_text" .. name_sufix
		hotspot_content[title_text_name] = display_name
		local selection_image = "selection_icon" .. name_sufix
		hotspot_content[selection_image] = selection_texture
		local selection_style = style[selection_image]
		local selection_size = selection_style.size
		local selection_offset = selection_style.offset
		local selection_default_offset = selection_style.default_offset
		selection_size[1] = selection_texture_size[1]
		selection_size[2] = selection_texture_size[2]
		selection_offset[1] = (selection_default_offset[1] + icon_size[1]/2) - selection_size[1]/2
		selection_offset[2] = (selection_default_offset[2] + icon_size[2]/2) - selection_size[2]/2
	end

	return 
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

	self._destroy_video_player(self)
	self._respawn_player(self)

	self.ui_animator = nil

	print("[HeroViewState] Exit Substate CharacterSelectionStateCharacter")

	return 
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

	return 
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

	return 
end
CharacterSelectionStateCharacter.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self.create_ui_elements(self)
	end

	for name, animation in pairs(self._ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			self._ui_animations[name] = nil
		end
	end

	self._update_available_profiles(self)
	self._update_profile_request(self)

	if not self._prepare_exit then
		self._handle_input(self, dt, t)
	end

	local wanted_state = self._wanted_state(self)

	if not self._transition_timer and not self.pending_profile_request(self) and (wanted_state or self._new_state) then
		if self.world_previewer:has_units_spawned() then
			self._prepare_exit = true
		elseif not self._prepare_exit then
			return wanted_state or self._new_state
		end
	end

	self.draw(self, dt)

	return 
end
CharacterSelectionStateCharacter.post_update = function (self, dt, t)
	self.ui_animator:update(dt)
	self._update_animations(self, dt)

	local transitioning = self.parent:transitioning()

	if not transitioning and not self._transition_timer then
		if self._prepare_exit then
			self._prepare_exit = false

			self.world_previewer:prepare_exit()
		elseif self._spawn_hero then
			self._spawn_hero = nil
			local hero_name = self._selected_hero_name or self._hero_name

			self._spawn_hero_unit(self, hero_name)
		end
	end

	if self._despawning_player_unit_career_change and not Unit.alive(self._despawning_player_unit_career_change) and self.profile_synchronizer:all_clients_have_loaded_sync_id(self._resync_id) then
		local player_manager = self.player_manager
		local peer_id = self.peer_id
		local player = player_manager.player_from_peer_id(player_manager, peer_id)
		local position = self._respawn_position:unbox()
		local rotation = self._respawn_rotation:unbox()

		player.spawn(player, position, rotation)

		self._despawning_player_unit_career_change = nil
		self._resync_id = nil

		self.parent:close_menu()
	end

	return 
end
CharacterSelectionStateCharacter.draw = function (self, dt)
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_manager = self.input_manager
	local parent = self.parent
	local input_service = parent.input_service(parent)
	local render_settings = self.render_settings

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in ipairs(self._widgets) do
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

	return 
end
CharacterSelectionStateCharacter._update_animations = function (self, dt)
	local animations = self._animations
	local ui_animator = self.ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator.is_animation_completed(ui_animator, animation_id) then
			ui_animator.stop_animation(ui_animator, animation_id)

			animations[animation_name] = nil
		end
	end

	return 
end
CharacterSelectionStateCharacter._spawn_hero_unit = function (self, hero_name)
	local world_previewer = self.world_previewer
	local career_index = self.career_index
	local callback = callback(self, "cb_hero_unit_spawned", hero_name)

	world_previewer.spawn_hero_unit(world_previewer, hero_name, career_index, true, callback, nil, 0.5)

	return 
end
CharacterSelectionStateCharacter.cb_hero_unit_spawned = function (self, hero_name)
	local world_previewer = self.world_previewer
	local career_index = self.career_index
	local profile_index = FindProfileIndex(hero_name)
	local profile = SPProfiles[profile_index]
	local careers = profile.careers
	local career_settings = careers[career_index]
	local preview_animation = career_settings.preview_animation
	local preview_wield_slot = career_settings.preview_wield_slot
	local preview_items = career_settings.preview_items

	if preview_items then
		for _, item_name in ipairs(preview_items) do
			local item_template = ItemMasterList[item_name]
			local slot_type = item_template.slot_type
			local slot_names = InventorySettings.slot_names_by_type[slot_type]
			local slot_name = slot_names[1]
			local slot = InventorySettings.slots_by_name[slot_name]

			world_previewer.equip_item(world_previewer, item_name, slot)
		end

		if preview_wield_slot then
			world_previewer.wield_weapon_slot(world_previewer, preview_wield_slot)
		end
	end

	if preview_animation then
		self.world_previewer:play_character_animation(preview_animation)
	end

	return 
end
CharacterSelectionStateCharacter._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end

	return 
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
CharacterSelectionStateCharacter._is_hero_tab_selected = function (self)
	local widget = self._widgets_by_name.hero_tabs
	local widget_content = widget.content
	local amount = widget_content.amount

	for i = 1, amount, 1 do
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = widget_content[hotspot_name]

		if hotspot_content.on_pressed then
			return i
		end
	end

	return 
end
CharacterSelectionStateCharacter._is_tab_hovered = function (self, widget)
	local widget_content = widget.content
	local amount = widget_content.amount

	for i = 1, amount, 1 do
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = widget_content[hotspot_name]

		if hotspot_content.on_hover_enter and not hotspot_content.is_selected then
			return i
		end
	end

	return 
end
CharacterSelectionStateCharacter._is_tab_dehovered = function (self, widget)
	local widget_content = widget.content
	local amount = widget_content.amount

	for i = 1, amount, 1 do
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = widget_content[hotspot_name]

		if hotspot_content.on_hover_exit and not hotspot_content.is_selected then
			return i
		end
	end

	return 
end
CharacterSelectionStateCharacter._is_career_tab_selected = function (self)
	local widget = self._widgets_by_name.career_tabs
	local widget_content = widget.content
	local amount = widget_content.amount

	for i = 1, amount, 1 do
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = widget_content[hotspot_name]

		if hotspot_content.on_pressed then
			return i
		end
	end

	return 
end
CharacterSelectionStateCharacter._select_hero_tab_by_profile_index = function (self, profile_index)
	self._select_hero_tab_by_index(self, ProfileIndexToPriorityIndex[profile_index])

	return 
end
CharacterSelectionStateCharacter._select_hero_tab_by_index = function (self, index, play_sound)
	if self._hero_tab_index == index then
		return 
	end

	if play_sound then
		self._play_sound(self, "play_gui_hero_select_hero_click")
	end

	local gui = self.ui_top_renderer.gui
	local widget = self._widgets_by_name.hero_tabs
	local widget_content = widget.content
	local widget_style = widget.style
	local amount = widget_content.amount

	for i = 1, amount, 1 do
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = widget_content[hotspot_name]
		local icon_name = "icon" .. name_sufix
		local selected = i == index
		hotspot_content.is_selected = selected
		local icon_style = widget_style[icon_name]
		local icon_color = icon_style.color
		icon_color[2] = (selected and 255) or 100
		icon_color[3] = (selected and 255) or 100
		icon_color[4] = (selected and 255) or 100
	end

	local profile_index = ProfilePriority[index]
	local profile_settings = SPProfiles[profile_index]
	local hero_name = profile_settings.display_name
	local character_name = profile_settings.character_name
	self._selected_hero_name = hero_name
	self._selected_profile_index = profile_index
	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local exp = hero_attributes.get(hero_attributes, hero_name, "experience") or 0
	local level = ExperienceSettings.get_level(exp)

	self._set_hero_info(self, Localize(character_name), level)

	local career_index = hero_attributes.get(hero_attributes, hero_name, "career") or 1
	self._hero_tab_index = index

	self._select_career_tab_by_index(self, career_index, true)

	return 
end
CharacterSelectionStateCharacter._select_career_tab_by_index = function (self, career_index, force_set, play_sound)
	if not force_set and self.career_index == career_index then
		return 
	end

	if play_sound then
		self._play_sound(self, "play_gui_hero_select_career_click")
	end

	local gui = self.ui_top_renderer.gui
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.career_tabs
	local widget_content = widget.content
	local widget_style = widget.style
	local amount = widget_content.amount
	local hero_name = self._selected_hero_name or self._hero_name

	self._populate_career_page(self, hero_name, career_index)
	self._assign_career_data_by_hero(self, hero_name)

	local is_career_locked = false

	for i = 1, amount, 1 do
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = widget_content[hotspot_name]
		local image_name = "icon" .. name_sufix
		local selected = i == career_index
		hotspot_content.is_selected = selected

		if selected then
			is_career_locked = hotspot_content.locked
		end

		local image_style = widget_style[image_name]
		local image_color = image_style.color
		image_color[2] = (selected and 255) or 100
		image_color[3] = (selected and 255) or 100
		image_color[4] = (selected and 255) or 100
	end

	self._spawn_hero = true
	self.career_index = career_index

	if is_career_locked then
		local profile_index = FindProfileIndex(hero_name)
		local profile_settings = SPProfiles[profile_index]
		local careers = profile_settings.careers
		local career_settings = careers[career_index]
		local required_level = career_settings.unlocked_at_level_function(hero_name)
		widgets_by_name.locked_info_text.content.text = Localize("career_locked_info") .. " " .. tostring(required_level)
	end

	widgets_by_name.locked_info_text.content.visible = is_career_locked

	return 
end
CharacterSelectionStateCharacter._populate_career_page = function (self, hero_name, career_index)
	local profile_index = FindProfileIndex(hero_name)
	local profile_settings = SPProfiles[profile_index]
	local careers = profile_settings.careers
	local career_settings = careers[career_index]
	local name = career_settings.name
	local display_name = career_settings.display_name
	local description = career_settings.description
	local icon = career_settings.icon
	local passive_ability_data = career_settings.passive_ability
	local activated_ability_data = career_settings.activated_ability
	local passive_display_name = passive_ability_data.display_name
	local passive_description = passive_ability_data.description
	local passive_icon = passive_ability_data.icon
	local activated_display_name = activated_ability_data.display_name
	local activated_description = activated_ability_data.description
	local activated_icon = activated_ability_data.icon
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.info_passive_icon.content.texture_id = passive_icon
	widgets_by_name.info_ability_icon.content.texture_id = activated_icon
	widgets_by_name.info_passive_title.content.text = Localize(passive_display_name)
	widgets_by_name.info_passive_description.content.text = Localize(passive_description)
	widgets_by_name.info_ability_title.content.text = Localize(activated_display_name)
	widgets_by_name.info_ability_description.content.text = Localize(activated_description)
	widgets_by_name.info_career_name.content.text = display_name
	local video = career_settings.video
	local material_name = video.material_name
	local resource = video.resource

	self._setup_video_player(self, material_name, resource)

	self._draw_video_next_frame = true

	return 
end
CharacterSelectionStateCharacter._handle_tab_hover = function (self, widget, style_prefix)
	local hover_index = self._is_tab_hovered(self, widget)

	if hover_index then
		self._on_option_button_hover(self, widget, style_prefix .. "_" .. hover_index)
	end

	local dehover_index = self._is_tab_dehovered(self, widget)

	if dehover_index then
		self._on_option_button_dehover(self, widget, style_prefix .. "_" .. dehover_index)
	end

	return 
end
CharacterSelectionStateCharacter._handle_input = function (self, dt, t)
	if self._is_tab_hovered(self, self._widgets_by_name.hero_tabs) then
		self._play_sound(self, "play_gui_hero_select_hero_hover")
	end

	if self._is_tab_hovered(self, self._widgets_by_name.career_tabs) then
		self._play_sound(self, "play_gui_hero_select_career_hover")
	end

	local hero_index = self._is_hero_tab_selected(self)

	if hero_index then
		self._select_hero_tab_by_index(self, hero_index, true)
	end

	local career_index = self._is_career_tab_selected(self)

	if career_index then
		self._select_career_tab_by_index(self, career_index, nil, true)
	end

	local current_profile_index = self.profile_synchronizer:profile_by_peer(self.peer_id, self.local_player_id)
	local select_button = self._widgets_by_name.select_button

	UIWidgetUtils.animate_default_button(select_button, dt)

	if self._is_button_hover_enter(self, select_button) then
		self._play_sound(self, "play_gui_start_menu_button_hover")
	end

	if self._is_button_pressed(self, select_button) then
		self._play_sound(self, "play_gui_start_menu_button_click")

		if current_profile_index ~= self._selected_profile_index then
			self._change_profile(self, self._selected_profile_index, self.career_index)
		else
			self._change_career(self, self._selected_profile_index, self.career_index)
		end
	end

	local widgets_by_name = self._widgets_by_name

	self._handle_tab_hover(self, widgets_by_name.hero_tabs, "icon")
	self._handle_tab_hover(self, widgets_by_name.career_tabs, "icon")

	return 
end
CharacterSelectionStateCharacter._set_hero_info = function (self, name, level)
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.info_hero_name.content.text = name
	widgets_by_name.info_hero_level.content.text = Localize("level") .. ": " .. level

	return 
end
CharacterSelectionStateCharacter._set_select_button_enabled = function (self, enabled)
	local button_content = self._widgets_by_name.select_button.content
	button_content.title_text = (enabled and Localize("input_description_confirm")) or Localize("dlc1_2_difficulty_unavailable")
	button_content.button_hotspot.disable_button = not enabled

	return 
end
CharacterSelectionStateCharacter._play_sound = function (self, event)
	self.parent:play_sound(event)

	return 
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

	return 
end
CharacterSelectionStateCharacter._start_transition_animation = function (self, key, animation_name)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[key] = anim_id

	return 
end
CharacterSelectionStateCharacter._change_profile = function (self, profile_index, career_index)
	local peer_id = self.peer_id
	local player = self.player_manager:player_from_peer_id(peer_id)

	if player.player_unit then
		self._despawning_player_unit_profile_change = player.player_unit

		player.despawn(player)
	else
		self.profile_synchronizer:request_select_profile(profile_index, self.local_player_id)
	end

	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local hero_name = self._selected_hero_name

	hero_attributes.set(hero_attributes, hero_name, "career", career_index)

	self._pending_profile_request = true
	self._requested_profile_index = profile_index
	self._requested_career_index = career_index

	return 
end
CharacterSelectionStateCharacter._change_career = function (self, profile_index, career_index)
	local player = self.local_player
	local player_unit = player.player_unit

	if player.player_unit then
		self._despawning_player_unit_career_change = player_unit

		player.despawn(player)

		self._respawn_position = Vector3Box(POSITION_LOOKUP[player_unit])
		self._respawn_rotation = QuaternionBox(Unit.local_rotation(player_unit, 0))
	end

	local profile_settings = SPProfiles[profile_index]
	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local hero_name = profile_settings.display_name

	hero_attributes.set(hero_attributes, hero_name, "career", career_index)
	self._save_selected_profile(self, profile_index)

	self._resync_id = self.profile_synchronizer:resync_loadout(self._selected_profile_index, career_index, player)

	return 
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

	return 
end
CharacterSelectionStateCharacter._update_profile_request = function (self)
	if self._pending_profile_request then
		local synchronizer = self.profile_synchronizer

		if self._despawning_player_unit_profile_change then
			if not Unit.alive(self._despawning_player_unit_profile_change) then
				synchronizer.request_select_profile(synchronizer, self._requested_profile_index, self.local_player_id)

				self._requested_profile_index = nil
				self._despawning_player_unit_profile_change = nil

				if self.is_server then
					Managers.state.network.network_server:peer_despawned_player(self.peer_id)
				end
			end
		else
			local result, result_local_player_id = synchronizer.profile_request_result(synchronizer)
			local local_player_id = self.local_player_id

			assert(not result or local_player_id == result_local_player_id, "Local player id mismatch between ui and request.")

			if result == "success" then
				local peer_id = self.peer_id
				local profile_index = synchronizer.profile_by_peer(synchronizer, peer_id, local_player_id)
				local player = self.player_manager:player(peer_id, local_player_id)

				player.set_profile_index(player, profile_index)
				synchronizer.clear_profile_request_result(synchronizer)
				self._save_selected_profile(self, profile_index)

				self._respawn_player_unit = nil
				self._pending_profile_request = nil
				self._requested_career_index = nil

				self.parent:set_current_hero(self._selected_profile_index)
				self.parent:close_menu()
			end
		end
	end

	return 
end
CharacterSelectionStateCharacter._update_available_profiles = function (self)
	local available_profiles = self._available_profiles
	local player = Managers.player:local_player()
	local profile_synchronizer = self.profile_synchronizer
	local own_player_profile_index = player ~= nil and player.profile_index(player)
	local own_player_career_index = player ~= nil and player.career_index(player)

	for _, profile_index in ipairs(ProfilePriority) do
		local is_profile_available = not profile_synchronizer.owner(profile_synchronizer, profile_index)
		available_profiles[profile_index] = is_profile_available

		if profile_index == self._selected_profile_index then
			local profile = SPProfiles[profile_index]
			local careers = profile.careers
			local selected_career_index = self.career_index
			local selected_career_settings = careers[selected_career_index]
			local hero_name = profile.display_name
			local hero_attributes = Managers.backend:get_interface("hero_attributes")
			local hero_experience = hero_attributes.get(hero_attributes, hero_name, "experience") or 0
			local hero_level = ExperienceSettings.get_level(hero_experience)
			local is_career_unlocked = selected_career_settings.is_unlocked_function(hero_name, hero_level)
			local button_enabled = (own_player_profile_index == profile_index or is_profile_available) and is_career_unlocked

			self._set_select_button_enabled(self, button_enabled)
		end
	end

	return 
end
CharacterSelectionStateCharacter._on_option_button_hover = function (self, widget, style_id)
	local ui_animations = self._ui_animations
	local animation_name = "option_button_" .. style_id
	local widget_style = widget.style
	local pass_style = widget_style[style_id]
	local current_color_value = pass_style.color[2]
	local target_color_value = 255
	local total_time = UISettings.scoreboard.topic_hover_duration
	local animation_duration = (current_color_value/target_color_value - 1)*total_time

	for i = 2, 4, 1 do
		if 0 < animation_duration then
			ui_animations[animation_name .. "_hover_" .. i] = self._animate_element_by_time(self, pass_style.color, i, current_color_value, target_color_value, animation_duration)
		else
			pass_style.color[i] = target_color_value
		end
	end

	return 
end
CharacterSelectionStateCharacter._on_option_button_dehover = function (self, widget, style_id)
	local ui_animations = self._ui_animations
	local animation_name = "option_button_" .. style_id
	local widget_style = widget.style
	local pass_style = widget_style[style_id]
	local current_color_value = pass_style.color[1]
	local target_color_value = 100
	local total_time = UISettings.scoreboard.topic_hover_duration
	local animation_duration = current_color_value/255*total_time

	for i = 2, 4, 1 do
		if 0 < animation_duration then
			ui_animations[animation_name .. "_hover_" .. i] = self._animate_element_by_time(self, pass_style.color, i, current_color_value, target_color_value, animation_duration)
		else
			pass_style.color[1] = target_color_value
		end
	end

	return 
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

return 

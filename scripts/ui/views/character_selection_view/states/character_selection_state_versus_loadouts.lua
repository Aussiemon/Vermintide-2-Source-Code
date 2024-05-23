-- chunkname: @scripts/ui/views/character_selection_view/states/character_selection_state_versus_loadouts.lua

local definitions = local_require("scripts/ui/views/character_selection_view/states/definitions/character_selection_state_versus_loadouts_definitions")
local widget_definitions = definitions.widget_definitions
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local hero_icon_widget_definition = definitions.hero_icon_widget
local hero_widget_definition = definitions.hero_widget
local info_window_widgets_definitions = definitions.info_window_widgets_definitions
local weapon_slots = definitions.weapon_slots
local tag_scenegraph_id = definitions.tag_scenegraph_id
local tag_widget_func = definitions.tag_widget_func
local loadout_button_widget_definitions = definitions.loadout_button_widget_definitions
local console_cursor_definition = definitions.console_cursor_definition
local generic_input_actions = definitions.generic_input_actions

CharacterSelectionStateVersusLoadouts = class(CharacterSelectionStateVersusLoadouts, CharacterSelectionStateCharacter)
CharacterSelectionStateVersusLoadouts.NAME = "CharacterSelectionStateVersusLoadouts"

local LOADOUT_SLOTS = {
	slot_frame = true,
	slot_hat = true,
	slot_melee = true,
	slot_necklace = true,
	slot_ranged = true,
	slot_ring = true,
	slot_skin = true,
	slot_trinket_1 = true,
}

CharacterSelectionStateVersusLoadouts.on_enter = function (self, params)
	print("[HeroViewState] Enter Substate CharacterSelectionStateVersusLoadouts")

	local ingame_ui_context = params.ingame_ui_context

	self._ingame_ui_context = ingame_ui_context
	self._parent = params.parent
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._is_in_inn = ingame_ui_context.is_in_inn
	self._force_ingame_menu = params.force_ingame_menu
	self._world = ingame_ui_context.world
	self._statistics_db = ingame_ui_context.statistics_db
	self._profile_synchronizer = ingame_ui_context.profile_synchronizer
	self.peer_id = ingame_ui_context.peer_id
	self._local_player_id = ingame_ui_context.local_player_id

	local network_handler = ingame_ui_context.network_server or ingame_ui_context.network_client

	self._profile_requester = network_handler:profile_requester()
	self.world_previewer = params.world_previewer
	self._wwise_world = params.wwise_world
	self.local_player = Managers.player:local_player()
	self._stats_id = self.local_player:stats_id()
	self.use_user_skins = true

	local profile_index, career_index = self._profile_synchronizer:profile_by_peer(self.peer_id, self._local_player_id)
	local hero_name = params.hero_name

	self._career_index = career_index
	self._profile_index = profile_index

	local profile = SPProfiles[self._profile_index]
	local career_data = profile.careers[self._career_index]
	local career_name = career_data.name

	self._render_settings = {
		snap_pixel_positions = false,
	}
	self._animations = {}
	self._ui_animations = {}

	self:_create_ui_elements(params)
	self:_store_selected_loadout_index(career_name)
	self:_setup_rarity_indices()
	self:_start_animation("on_enter")

	if profile_index and career_index then
		local force_update = true

		self:_select_hero(self._profile_index, self._career_index, true, nil, force_update)
	end

	self.parent:set_input_blocked(false)
	Managers.input:enable_gamepad_cursor()

	local gui_layer = UILayer.default + 130
	local input_description_input_service = self._parent:input_service(true)

	self._menu_input_description = MenuInputDescriptionUI:new(ingame_ui_context, self.ui_top_renderer, input_description_input_service, 6, gui_layer, generic_input_actions.default, true)

	self._menu_input_description:set_input_description(nil)
end

CharacterSelectionStateVersusLoadouts.on_exit = function (self, params)
	self.super.on_exit(self, params)

	if not self._new_loadout_confirmed then
		local profile = SPProfiles[self._profile_index]
		local career_data = profile.careers[self._career_index]
		local career_name = career_data.name
		local stored_loadout_index = self._stored_selected_loadout_index
		local loadout_settings = InventorySettings.loadouts[stored_loadout_index]
		local loadout_type = loadout_settings.loadout_type
		local button_widget = self._loadout_button_widgets[stored_loadout_index]
		local content = button_widget.content
		local loadout = content.loadout
		local force_update = true

		self:_set_loadout(loadout, loadout_type, stored_loadout_index, career_name, force_update)
	end
end

CharacterSelectionStateVersusLoadouts._store_selected_loadout_index = function (self, career_name)
	local mechanism_name = Managers.mechanism:current_mechanism_name()
	local loadout_selection = PlayerData.loadout_selection and PlayerData.loadout_selection[mechanism_name]
	local loadout_index = loadout_selection and loadout_selection[career_name]
	local loadout_settings = loadout_index and InventorySettings.loadouts[loadout_index]

	if loadout_settings and loadout_settings.loadout_type == "default" then
		self._stored_selected_loadout_index = loadout_settings.loadout_index
	else
		local backend_items = Managers.backend:get_interface("items")
		local custom_loadout_index = backend_items:get_selected_career_loadout(career_name)

		for idx, loadout_setting in ipairs(InventorySettings.loadouts) do
			if loadout_setting.loadout_type == "custom" and loadout_setting.loadout_index == custom_loadout_index then
				self._stored_selected_loadout_index = idx

				return
			end
		end
	end

	fassert(self._stored_selected_loadout_index, "[CharacterSelectionStateVersusLoadouts] Couldn't find any stored loadout index")
end

CharacterSelectionStateVersusLoadouts._setup_rarity_indices = function (self)
	self._rarity_indices = {}

	for name, rarity_settings in pairs(RaritySettings) do
		self._rarity_indices[name] = rarity_settings.order
	end
end

CharacterSelectionStateVersusLoadouts._create_ui_elements = function (self)
	self:_inject_additional_scenegraph_definitions(scenegraph_definition)

	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)

	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)

		widgets_by_name[name] = widget
		widgets[#widgets + 1] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name

	local info_window_widgets = {}

	for name, widget_definition in pairs(info_window_widgets_definitions) do
		local widget = UIWidget.init(widget_definition)

		widgets_by_name[name] = widget
		info_window_widgets[#info_window_widgets + 1] = widget
	end

	self._info_window_widgets = info_window_widgets

	local loadout_button_widgets = {}

	for idx, widget_definition in ipairs(loadout_button_widget_definitions) do
		local widget = UIWidget.init(widget_definition)

		widgets_by_name["loadout_button_" .. idx] = widget
		loadout_button_widgets[#loadout_button_widgets + 1] = widget
	end

	self._loadout_button_widgets = loadout_button_widgets
	self._console_cursor = UIWidget.init(console_cursor_definition)
	self._additional_widgets = {}
	self._additional_widgets_by_name = {}

	UIRenderer.clear_scenegraph_queue(self.ui_top_renderer)

	for idx, loadout_data in ipairs(InventorySettings.loadouts) do
		if loadout_data.loadout_type == "custom" then
			self._default_loadout_index = idx

			break
		end
	end

	fassert(self._default_loadout_index, "[CharacterSelectionStateVersusLoadouts] There is no custom loadout slots in InventorySettings.loadouts")
	self:_populate_hero_info()
	self:_populate_career_info()
	self:_populate_loadout()
	self:_populate_loadout_buttons()
	self:_setup_hero_widgets()
	self:_populate_tags()
end

CharacterSelectionStateVersusLoadouts._setup_hero_widgets = function (self)
	local hero_widgets = {}
	local hero_icon_widgets = {}

	self._hero_widgets = hero_widgets
	self._hero_icon_widgets = hero_icon_widgets

	local profile_settings = SPProfiles[self._profile_index]
	local career_settings = profile_settings.careers[self._career_index]
	local hero_name = profile_settings.display_name
	local backend_dlcs = Managers.backend:get_interface("dlcs")
	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local hero_experience = hero_attributes:get(hero_name, "experience") or 0
	local hero_level = ExperienceSettings.get_level(hero_experience)
	local careers = profile_settings.careers
	local icon_widget = UIWidget.init(hero_icon_widget_definition)

	hero_icon_widgets[#hero_icon_widgets + 1] = icon_widget

	local hero_icon_texture = "hero_icon_large_" .. hero_name

	icon_widget.content.icon = hero_icon_texture
	icon_widget.content.icon_selected = hero_icon_texture .. "_glow"
	icon_widget.content.selected = true

	for i = 1, 4 do
		local career = careers[i]

		if career and not backend_dlcs:is_unreleased_career(career.name) then
			local widget = UIWidget.init(hero_widget_definition)

			hero_widgets[#hero_widgets + 1] = widget

			local offset = widget.offset
			local content = widget.content

			content.career_settings = career

			local portrait_image = career.portrait_image

			content.portrait = "medium_" .. portrait_image

			local is_career_unlocked, reason, dlc_name, localized = career:is_unlocked_function(hero_name, hero_level)

			content.locked = not is_career_unlocked
			content.locked_reason = not is_career_unlocked and (localized and reason or Localize(reason))
			content.dlc_name = dlc_name

			if reason == "dlc_not_owned" then
				content.lock_texture = content.lock_texture .. "_gold"
				content.frame = content.frame .. "_gold"
			end

			content.locked = not is_career_unlocked
			content.button_hotspot.is_selected = self._career_index == i
			offset[1] = (i - 1) * 124
		else
			local offset = (i - 1) * 124

			icon_widget.style.bg.offset[1] = icon_widget.style.bg.offset[1] + offset
			icon_widget.style.hourglass_icon.offset[1] = icon_widget.style.hourglass_icon.offset[1] + offset
			icon_widget.content.use_empty_icon = true
		end
	end
end

CharacterSelectionStateVersusLoadouts._populate_hero_info = function (self)
	local profile_settings = SPProfiles[self._profile_index]
	local career_settings = profile_settings.careers[self._career_index]
	local hero_name = profile_settings.display_name
	local character_name = profile_settings.character_name
	local character_career_name = career_settings.display_name
	local hero_display_name = Localize(character_name)
	local career_display_name = Localize(character_career_name)
	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local hero_experience = hero_attributes:get(hero_name, "experience") or 0
	local level = ExperienceSettings.get_level(hero_experience)
	local hero_name_widget = self._widgets_by_name.info_hero_name

	hero_name_widget.content.text = hero_display_name

	local career_name_widget = self._widgets_by_name.info_career_name

	career_name_widget.content.text = career_display_name

	local hero_level_widget = self._widgets_by_name.info_hero_level

	hero_level_widget.content.text = level
end

CharacterSelectionStateVersusLoadouts._start_animation = function (self, animation_name)
	local params = {
		render_settings = self._render_settings,
		ui_scenegraph = self._ui_scenegraph,
	}
	local widgets = self._widgets_by_name
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)

	self._animations[animation_name] = anim_id
end

CharacterSelectionStateVersusLoadouts._update_animations = function (self, dt, t)
	local ui_animations = self._ui_animations
	local animations = self._animations
	local ui_animator = self._ui_animator

	for name, animation in pairs(self._ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			self._ui_animations[name] = nil
		end
	end

	ui_animator:update(dt)

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	for _, widget in ipairs(self._loadout_button_widgets) do
		UIWidgetUtils.animate_default_button(widget, dt)
	end

	local confirm_button_widget = self._widgets_by_name.confirm_button

	UIWidgetUtils.animate_default_button(confirm_button_widget, dt)
end

CharacterSelectionStateVersusLoadouts.post_update = function (self, dt, t)
	self:_update_animations(dt, t)
	self:_handle_spawn(dt, t)
end

CharacterSelectionStateVersusLoadouts._handle_spawn = function (self, dt, t)
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
	local local_player = Managers.player:local_player()
	local peer_id = local_player:network_id()
	local local_player_id = local_player:local_player_id()

	if self._despawning_player_unit_career_change and not Unit.alive(self._despawning_player_unit_career_change) and profile_synchronizer:all_ingame_synced_for_peer(peer_id, local_player_id) then
		local position = self._respawn_position:unbox()
		local rotation = self._respawn_rotation:unbox()

		local_player:spawn(position, rotation)

		self._despawning_player_unit_career_change = nil
		self._resyncing_loadout = nil

		self.parent:close_menu()
	end
end

CharacterSelectionStateVersusLoadouts.update = function (self, dt, t)
	self:_handle_input(dt, t)
	self:_update_profile_request()
	self:_update_video_player_settings()
	self:_draw(dt, t)

	return self:_handle_transitions()
end

CharacterSelectionStateVersusLoadouts._handle_input = function (self, dt, t)
	if self._prepare_exit then
		return
	end

	local input_service = self:input_service()
	local gamepad_active = Managers.input:is_device_active("gamepad")

	self:_handle_keyboard_selection(input_service)
	self:_handle_mouse_selection(input_service)
	self:_handle_gamepad_selection(input_service)
end

CharacterSelectionStateVersusLoadouts._handle_keyboard_selection = function (self, input_service)
	if not Managers.input:is_device_active("keyboard") then
		return
	end

	if input_service:get("move_up") then
		local old_loadout_index = self._selected_loadout_index
		local new_loadout_index = math.max(old_loadout_index - 1, 1)

		if new_loadout_index ~= old_loadout_index then
			local loadout_button_widget = self._loadout_button_widgets[new_loadout_index]

			if loadout_button_widget.content.visible then
				self:_change_loadout(new_loadout_index)
			end
		end
	elseif input_service:get("move_down") then
		local old_loadout_index = self._selected_loadout_index
		local new_loadout_index = math.min(old_loadout_index + 1, #self._loadout_button_widgets)

		if new_loadout_index ~= old_loadout_index then
			local loadout_button_widget = self._loadout_button_widgets[new_loadout_index]

			if loadout_button_widget.content.visible then
				self:_change_loadout(new_loadout_index)
			end
		end
	elseif input_service:get("move_left") then
		local old_career_index = self._selected_career_index
		local new_career_index = math.clamp(self._selected_career_index - 1, 1, #self._hero_widgets)

		if new_career_index ~= old_career_index then
			self:_select_hero(self._profile_index, new_career_index)
		end
	elseif input_service:get("move_right") then
		local old_career_index = self._selected_career_index
		local new_career_index = math.clamp(self._selected_career_index + 1, 1, #self._hero_widgets)

		if new_career_index ~= old_career_index then
			self:_select_hero(self._profile_index, new_career_index)
		end
	elseif input_service:get("confirm") then
		self:_confirm_loadout()
	elseif input_service:get("back", true) then
		self.parent:close_menu()
	end
end

CharacterSelectionStateVersusLoadouts._handle_gamepad_selection = function (self, input_service)
	if not Managers.input:is_device_active("gamepad") then
		return
	end

	if input_service:get("move_up_raw") then
		local old_loadout_index = self._selected_loadout_index
		local new_loadout_index = math.max(old_loadout_index - 1, 1)

		if new_loadout_index ~= old_loadout_index then
			local loadout_button_widget = self._loadout_button_widgets[new_loadout_index]

			if loadout_button_widget.content.visible then
				self:_change_loadout(new_loadout_index)
			end
		end
	elseif input_service:get("move_down_raw") then
		local old_loadout_index = self._selected_loadout_index
		local new_loadout_index = math.min(old_loadout_index + 1, #self._loadout_button_widgets)

		if new_loadout_index ~= old_loadout_index then
			local loadout_button_widget = self._loadout_button_widgets[new_loadout_index]

			if loadout_button_widget.content.visible then
				self:_change_loadout(new_loadout_index)
			end
		end
	elseif input_service:get("cycle_previous") then
		local old_career_index = self._selected_career_index
		local new_career_index = math.clamp(self._selected_career_index - 1, 1, #self._hero_widgets)

		if new_career_index ~= old_career_index then
			self:_select_hero(self._profile_index, new_career_index)
		end
	elseif input_service:get("cycle_next") then
		local old_career_index = self._selected_career_index
		local new_career_index = math.clamp(self._selected_career_index + 1, 1, #self._hero_widgets)

		if new_career_index ~= old_career_index then
			self:_select_hero(self._profile_index, new_career_index)
		end
	elseif input_service:get("refresh") then
		self:_confirm_loadout()
	elseif input_service:get("back", true) then
		self.parent:close_menu()
	end
end

CharacterSelectionStateVersusLoadouts._handle_mouse_selection = function (self, input_service)
	if Managers.input:is_device_active("keyboard") then
		return
	end

	for career_index, widget in ipairs(self._hero_widgets) do
		local content = widget.content
		local hotspot = content.button_hotspot

		if hotspot and hotspot.on_pressed then
			self:_select_hero(self._profile_index, career_index)
		end
	end

	for idx, button_widget in ipairs(self._loadout_button_widgets) do
		if UIUtils.is_button_pressed(button_widget) then
			self:_change_loadout(idx)

			break
		end
	end

	local confirm_button = self._widgets_by_name.confirm_button

	if UIUtils.is_button_pressed(confirm_button) then
		self:_confirm_loadout()
	end
end

CharacterSelectionStateVersusLoadouts._confirm_loadout = function (self)
	self:_play_sound("play_gui_start_menu_button_click")

	local current_profile_index, current_career_index = self._profile_synchronizer:profile_by_peer(self.peer_id, self._local_player_id)
	local profile = SPProfiles[self._selected_profile_index]
	local career_settings = profile.careers[self._selected_career_index]
	local career_name = career_settings.name
	local career_settings = CareerSettings[career_name]
	local loadout_changed = self:_set_loadout(self._selected_loadout, self._selected_loadout_type, self._selected_loadout_index, career_name)

	if current_profile_index ~= self._selected_profile_index or current_career_index ~= self._selected_career_index or loadout_changed then
		local dlc_name = career_settings.required_dlc

		if dlc_name and Managers.unlock:dlc_requires_restart(dlc_name) then
			self._parent:close_menu()

			return
		end

		self._close_on_successful_profile_request = true

		self:_change_profile(self._selected_profile_index, self._selected_career_index)
		self._parent:set_input_blocked(true)

		self._new_loadout_confirmed = true
	else
		self._parent:close_menu()
	end
end

CharacterSelectionStateVersusLoadouts._set_loadout = function (self, loadout, loadout_type, loadout_index, career_name, force_update)
	if not loadout or not loadout_type or not loadout_index then
		return false
	end

	local mechanism_name = Managers.mechanism:current_mechanism_name()
	local loadout_selection = PlayerData.loadout_selection and PlayerData.loadout_selection[mechanism_name]
	local selected_loadout_index = loadout_selection and loadout_selection[career_name] or self._stored_selected_loadout_index

	if not force_update and loadout_index == selected_loadout_index then
		return selected_loadout_index ~= self._stored_selected_loadout_index
	end

	local player = Managers.player:player_from_peer_id(self.peer_id)
	local unit = player.player_unit

	if not unit or not Unit.alive(unit) then
		return false
	end

	if not Managers.state.network:game() then
		return false
	end

	local loadout_settings = InventorySettings.loadouts[loadout_index]

	if not force_update then
		self:_save_loadout_index(career_name, loadout_index)
	end

	local talents_interface = Managers.backend:get_interface("talents")
	local item_interface = Managers.backend:get_interface("items")

	if loadout_type == "default" then
		item_interface:set_default_override(career_name, loadout_settings.loadout_index)
	else
		item_interface:set_loadout_index(career_name, loadout_settings.loadout_index)

		for slot_name, backend_id in pairs(loadout) do
			if LOADOUT_SLOTS[slot_name] then
				if CosmeticUtils.is_cosmetic_slot(slot_name) then
					backend_id = item_interface:get_backend_id_from_cosmetic_item(backend_id)
				end

				local item = item_interface:get_item_from_id(backend_id)

				if not LoadoutUtils.is_item_disabled(item.ItemId) then
					local slot = InventorySettings.slots_by_name[slot_name]
					local slot_type = slot.type
					local highest_rarity = self._statistics_db:get_persistent_stat(self._stats_id, "highest_equipped_rarity", slot_type)
					local item_rarity = self._rarity_indices[item.rarity]

					if item_rarity and highest_rarity < item_rarity then
						self._statistics_db:set_stat(self._stats_id, "highest_equipped_rarity", slot_type, item_rarity)
					end
				end
			end
		end
	end

	item_interface:make_dirty()
	talents_interface:make_dirty()
	Managers.state.event:trigger("event_set_loadout_items")

	return selected_loadout_index ~= self._stored_selected_loadout_index
end

CharacterSelectionStateVersusLoadouts._save_loadout_index = function (self, career_name, loadout_index)
	local mechanism_name = Managers.mechanism:current_mechanism_name()

	PlayerData.loadout_selection = PlayerData.loadout_selection or {}
	PlayerData.loadout_selection[mechanism_name] = PlayerData.loadout_selection[mechanism_name] or {}
	PlayerData.loadout_selection[mechanism_name][career_name] = loadout_index

	Managers.save:auto_save(SaveFileName, SaveData, nil)
end

CharacterSelectionStateVersusLoadouts._change_loadout = function (self, idx, force_update)
	local frame_widget = self._widgets_by_name.loadout_frame
	local selected_loadout_header_widget = self._widgets_by_name.selected_loadout_header
	local selected_loadout_desc_widget = self._widgets_by_name.selected_loadout_desc
	local selected_loadout_icon_widget = self._widgets_by_name.selected_loadout_icon

	if not self._loadout_button_widgets[idx] then
		idx = self._default_loadout_index
	end

	local profile_index = self._selected_profile_index or self._profile_index
	local career_index = self._selected_career_index or self._career_index
	local profile = SPProfiles[profile_index]
	local career_settings = profile.careers[career_index]
	local career_name = career_settings.name
	local header, desc, icon
	local loadout_settings = InventorySettings.loadouts[idx]

	if loadout_settings.loadout_type == "default" then
		header = career_name .. "_default_loadout_" .. loadout_settings.loadout_index .. "_title"
		desc = career_name .. "_default_loadout_" .. loadout_settings.loadout_index .. "_desc"

		local career_ui_settings = UISettings.default_loadout_settings[career_name]
		local loadout_ui_settings = career_ui_settings[loadout_settings.loadout_index]

		icon = loadout_ui_settings.icon
	else
		header = "custom_loadout_" .. loadout_settings.loadout_index .. "_title"
		desc = "custom_loadout_desc"
		icon = loadout_settings.loadout_icon or "icons_placeholder"
	end

	selected_loadout_header_widget.content.text = Localize(header)
	selected_loadout_desc_widget.content.text = Localize(desc)
	selected_loadout_icon_widget.content.texture_id = icon

	local button_widget = self._loadout_button_widgets[idx]

	frame_widget.offset = button_widget.offset

	local content = button_widget.content
	local loadout = content.loadout
	local talents = content.talents

	self._selected_loadout = content.loadout
	self._selected_loadout_type = content.loadout_type
	self._selected_loadout_index = content.loadout_index

	self:_populate_tags()
	self:_populate_loadout(self._selected_profile_index, self._selected_career_index, loadout, talents)
	self:_set_loadout(self._selected_loadout, self._selected_loadout_type, self._selected_loadout_index, career_name, force_update)

	self._spawn_hero = true
end

CharacterSelectionStateVersusLoadouts._draw = function (self, dt, t)
	local ui_scenegraph = self._ui_scenegraph
	local ui_renderer = self.ui_top_renderer
	local render_settings = self._render_settings
	local input_service = self:input_service()
	local gamepad_active = Managers.input:is_device_active("gamepad")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	for _, widget in ipairs(self._hero_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	for _, widget in ipairs(self._hero_icon_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	for _, widget in ipairs(self._info_window_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	for _, widget in ipairs(self._tag_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	for _, widget in ipairs(self._additional_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	for _, widget in ipairs(self._loadout_button_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	if gamepad_active then
		UIRenderer.draw_widget(ui_renderer, self._console_cursor)
	end

	self:_draw_video(ui_renderer, dt, t)
	UIRenderer.end_pass(ui_renderer)

	if gamepad_active then
		self._menu_input_description:draw(ui_renderer, dt)
	end

	if self._scrollbar then
		render_settings.alpha_multiplier = render_settings.main_alpha_multiplier

		self._scrollbar:update(dt, t, ui_renderer, input_service, render_settings)
	end
end

CharacterSelectionStateVersusLoadouts._populate_loadout_buttons = function (self)
	local profile_index = self._selected_profile_index or self._profile_index
	local career_index = self._selected_career_index or self._career_index
	local profile = SPProfiles[profile_index]
	local career_settings = profile.careers[career_index]
	local career_name = career_settings.name
	local career_settings = CareerSettings[career_name]
	local backend_interface_items = Managers.backend:get_interface("items")
	local backend_interface_talents = Managers.backend:get_interface("talents")
	local career_loadouts = backend_interface_items:get_career_loadouts(career_name)
	local default_loadouts = backend_interface_items:get_default_loadouts(career_name)
	local career_talents = backend_interface_talents:get_career_talents(career_name)
	local default_talents = backend_interface_talents:get_default_talents(career_name)
	local default_career_ui_settings = UISettings.default_loadout_settings[career_name]

	for i = 1, #self._loadout_button_widgets do
		local widget = self._loadout_button_widgets[i]
		local content = widget.content
		local loadout_setting = InventorySettings.loadouts[i]
		local loadout_type = loadout_setting.loadout_type
		local loadout_index = loadout_setting.loadout_index

		content.loadout_type = loadout_type

		if loadout_type == "default" then
			local loadout_ui_setting = default_career_ui_settings[loadout_index]
			local loadout = default_loadouts[loadout_index]
			local talents = default_talents[loadout_index]

			content.loadout = loadout
			content.loadout_index = i
			content.talents = talents
			content.visible = loadout ~= nil
			content.background.texture_id = loadout_ui_setting.icon
		elseif loadout_type == "custom" then
			local loadout = career_loadouts[loadout_index]
			local talents = career_talents[loadout_index]

			content.loadout_index = i
			content.loadout = loadout
			content.talents = talents
			content.visible = loadout ~= nil
			content.background.texture_id = loadout_setting.loadout_icon or "icons_placeholder"
		end
	end
end

CharacterSelectionStateVersusLoadouts._populate_tags = function (self)
	local profile_index = self._selected_profile_index or self._profile_index
	local career_index = self._selected_career_index or self._career_index
	local profile = SPProfiles[profile_index]
	local career_settings = profile.careers[career_index]
	local career_name = career_settings.name
	local loadout_index = self._selected_loadout_index or self._default_loadout_index
	local loadout_settings = InventorySettings.loadouts[loadout_index]
	local tags = {}

	if loadout_settings.loadout_type == "default" then
		local default_loadout_settings = UISettings.default_loadout_settings[career_name]
		local ui_loadout_settings = default_loadout_settings[loadout_settings.loadout_index]

		tags = string.split(ui_loadout_settings.tags, ",")
	else
		tags[#tags + 1] = "loadout_tag_custom"
	end

	local tag_widgets = {}
	local num_tags = #tags
	local offset_x = 0
	local spacing = 10

	local function sort_tags(a, b)
		return Localize(a) < Localize(b)
	end

	table.sort(tags, sort_tags)

	for i = 1, num_tags do
		local tag = tags[i]
		local widget_definition = tag_widget_func(tag_scenegraph_id, Localize(tag), nil, nil, nil, {
			nil,
			30,
		})
		local widget = UIWidget.init(widget_definition)

		offset_x = offset_x + widget.content.size[1] * 0.5
		widget.offset[1] = offset_x
		tag_widgets[#tag_widgets + 1] = widget
		offset_x = offset_x + widget.content.size[1] * 0.5 + spacing
	end

	self._tag_widgets = tag_widgets
end

local EMPTY_TABLE = {}

CharacterSelectionStateVersusLoadouts._populate_loadout = function (self, profile_index, career_index, optional_loadout, optional_talents)
	local profile_index = self._selected_profile_index or self._profile_index
	local career_index = self._selected_career_index or self._career_index
	local profile = SPProfiles[profile_index]
	local career_settings = profile.careers[career_index]
	local profile_name = profile.display_name
	local career_name = career_settings.name
	local selected_talents = EMPTY_TABLE
	local talent_ids = EMPTY_TABLE
	local talent_interface = Managers.backend:get_interface("talents")

	if optional_talents then
		local selected_talents = optional_talents

		talent_ids = talent_interface:get_talent_ids(career_name, selected_talents)
	else
		talent_ids = talent_interface:get_talent_ids(career_name)
		selected_talents = talent_interface:get_talents(career_name)
	end

	local widget = self._widgets_by_name.loadout_talents
	local content = widget.content
	local talent_num = 1

	for i = 1, MaxTalentPoints do
		local talent_id = "talent_" .. i
		local talent_content = content[talent_id]

		if selected_talents[i] ~= 0 then
			local id = talent_ids[talent_num]
			local talent = TalentUtils.get_talent_by_id(profile_name, id)
			local talent_icon = talent and talent.icon

			if not talent_icon then
				talent = nil
			end

			talent_content.icon = talent_icon
			talent_content.talent = talent
			talent_num = talent_num + 1
		else
			talent_content.talent = nil
		end
	end

	local item_interface = Managers.backend:get_interface("items")
	local widget = self._widgets_by_name.loadout_weapons
	local content = widget.content

	for i, weapon_slot in ipairs(weapon_slots) do
		local item

		if optional_loadout then
			local backend_id = optional_loadout[weapon_slot]

			item = item_interface:get_item_from_id(backend_id)
		else
			item = BackendUtils.get_loadout_item(career_name, weapon_slot)
		end

		content[weapon_slot].item = item
		content[weapon_slot].icon = item.data.inventory_icon
	end
end

CharacterSelectionStateVersusLoadouts._populate_career_info = function (self)
	local profile_index = self._selected_profile_index or self._profile_index
	local career_index = self._selected_career_index or self._career_index
	local ui_scenegraph = self._ui_scenegraph
	local ui_renderer = self.ui_top_renderer
	local widgets_by_name = self._widgets_by_name
	local profile = SPProfiles[profile_index]
	local hero_name = profile.display_name
	local career_settings = profile.careers[career_index]
	local career_name = career_settings.name
	local passive_ability_data = career_settings.passive_ability
	local activated_ability_data = career_settings.activated_ability[1]
	local passive_display_name = passive_ability_data.display_name
	local passive_icon = passive_ability_data.icon
	local activated_display_name = activated_ability_data.display_name
	local activated_icon = activated_ability_data.icon

	widgets_by_name.passive_title_text.content.text = Localize(passive_display_name)
	widgets_by_name.passive_description_text.content.text = UIUtils.get_ability_description(passive_ability_data)
	widgets_by_name.passive_icon.content.texture_id = passive_icon
	widgets_by_name.active_title_text.content.text = Localize(activated_display_name)
	widgets_by_name.active_description_text.content.text = UIUtils.get_ability_description(activated_ability_data)
	widgets_by_name.active_icon.content.texture_id = activated_icon

	local passive_perks = passive_ability_data.perks
	local total_perks_height = 0
	local perks_height_spacing = 0

	for i = 1, 3 do
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
			local description = UIUtils.get_perk_description(data)
			local title_text_style = style.title_text
			local description_text_style = style.description_text
			local description_text_shadow_style = style.description_text_shadow

			content.title_text = display_name
			content.description_text = description

			local title_height = UIUtils.get_text_height(ui_renderer, size, title_text_style, display_name)
			local description_height = UIUtils.get_text_height(ui_renderer, size, description_text_style, description)

			description_text_style.offset[2] = -description_height
			description_text_shadow_style.offset[2] = -(description_height + 2)
			total_perks_height = total_perks_height + title_height + description_height + perks_height_spacing
		end

		content.visible = data ~= nil
	end

	self:_setup_additional_career_info(career_settings)

	local video = career_settings.video
	local material_name = video.material_name
	local resource = video.resource

	self._current_video_settings = {
		video = video,
		material_name = material_name,
		resource = resource,
	}

	self:_destroy_video_player()
end

CharacterSelectionStateVersusLoadouts._draw_video = function (self, ui_renderer, dt, t)
	if not self._draw_video_next_frame then
		if self._video_widget and not self._prepare_exit then
			if not self._video_created then
				UIRenderer.draw_widget(ui_renderer, self._video_widget)
			else
				self._video_created = nil
			end
		end
	elseif self._draw_video_next_frame then
		self._draw_video_next_frame = nil
	end
end

CharacterSelectionStateVersusLoadouts._select_hero = function (self, profile_index, career_index, ignore_sound, disable_hero_spawn, force_update)
	local profile_settings = SPProfiles[profile_index]
	local career_settings = profile_settings.careers[career_index]
	local hero_name = profile_settings.display_name
	local character_name = profile_settings.character_name
	local career_name = career_settings.display_name
	local required_dlc = career_settings.required_dlc

	if required_dlc and not Managers.unlock:is_dlc_unlocked(required_dlc) then
		return
	end

	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local hero_experience = hero_attributes:get(hero_name, "experience") or 0
	local hero_level = ExperienceSettings.get_level(hero_experience)
	local is_career_unlocked, reason, dlc_name, localized = career_settings:is_unlocked_function(hero_name, hero_level)
	local widget = self._widgets_by_name.locked_info_text
	local widget_content = widget.content

	widget_content.text = not is_career_unlocked and reason or ""
	widget_content.visible = not is_career_unlocked

	if not ignore_sound then
		self:_play_sound("play_gui_hero_select_career_click")
	end

	GlobalShaderFlags.set_global_shader_flag("NECROMANCER_CAREER_REMAP", career_name == "bw_necromancer")

	self._spawn_hero = true

	if disable_hero_spawn then
		self._spawn_hero = false
	end

	self._selected_career_index = career_index
	self._selected_profile_index = profile_index
	self._selected_hero_name = hero_name

	self:_populate_career_info()
	self:_populate_loadout()
	self:_populate_tags()
	self:_populate_loadout_buttons()

	for career_index, widget in ipairs(self._hero_widgets) do
		local content = widget.content
		local button_hotspot = content.button_hotspot

		button_hotspot.is_selected = career_index == self._selected_career_index
	end

	local mechanism_name = Managers.mechanism:current_mechanism_name()
	local loadout_selection = PlayerData.loadout_selection and PlayerData.loadout_selection[mechanism_name]
	local selected_loadout_index = loadout_selection and loadout_selection[career_name] or self._stored_selected_loadout_index

	self:_change_loadout(selected_loadout_index, force_update)
end

CharacterSelectionStateVersusLoadouts._spawn_hero_unit = function (self, hero_name)
	local world_previewer = self.world_previewer
	local career_index = self._selected_career_index
	local callback = callback(self, "cb_hero_unit_spawned", hero_name)
	local state_character = false

	world_previewer:request_spawn_hero_unit(hero_name, career_index, state_character, callback, nil, 0.5)
end

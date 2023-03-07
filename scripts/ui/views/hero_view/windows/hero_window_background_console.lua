require("scripts/ui/views/menu_world_previewer")
require("scripts/settings/hero_statistics_template")

local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_background_console_definitions")
local widget_definitions = definitions.widgets
local background_rect = definitions.background_rect
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local camera_position_by_character = definitions.camera_position_by_character
local loading_overlay_widget_definitions = definitions.loading_overlay_widgets
local DO_RELOAD = false
local object_sets_per_layout = {
	equipment = {
		equipment_view = true
	},
	talents = {
		talents_view = true
	},
	forge = {
		crafting_view = true
	},
	cosmetics = {
		cosmetics_view = true
	},
	crafting_recipe = {
		crafting_view = true
	},
	equipment_selection = {
		equipment_view = true
	},
	cosmetics_selection = {
		cosmetics_view = true
	},
	system = {
		main_menu = true
	},
	character_selection = {
		keep_current_object_set = true
	},
	item_customization = {
		keep_current_object_set = true
	}
}
local level_events_per_layout = {
	equipment = {
		"equipment_view"
	},
	talents = {
		"talents_view"
	},
	forge = {
		"crafting_view"
	},
	cosmetics = {
		"cosmetics_view"
	},
	crafting_recipe = {
		"crafting_view"
	},
	equipment_selection = {
		"equipment_view"
	},
	cosmetics_selection = {
		"cosmetics_view"
	},
	system = {
		"main_menu"
	},
	character_selection = {
		"equipment_view",
		"main_menu",
		"cosmetics_view",
		"crafting_view"
	}
}
local character_visibility_per_layout = {
	cosmetics_selection = true,
	equipment_selection = true,
	forge = false,
	cosmetics = true,
	system = false,
	equipment = true,
	character_selection = true,
	crafting_recipe = false,
	talents = false
}
local camera_move_duration_per_layout = {
	character_selection = UISettings.console_menu_camera_move_duration
}
local disable_camera_position_per_layout = {}
HeroWindowBackgroundConsole = class(HeroWindowBackgroundConsole)
HeroWindowBackgroundConsole.NAME = "HeroWindowBackgroundConsole"

HeroWindowBackgroundConsole.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate HeroWindowBackgroundConsole")

	self.params = params
	self.parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self.ingame_ui_context = ingame_ui_context
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.statistics_db = ingame_ui_context.statistics_db
	self.render_settings = {
		snap_pixel_positions = true
	}
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	self._stats_id = local_player:stats_id()
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self.is_in_inn = ingame_ui_context.is_in_inn
	self.force_ingame_menu = params.force_ingame_menu
	self.hero_name = params.hero_name
	self.career_index = params.career_index
	self.skin_sync_id = self.parent.skin_sync_id
	self._camera_move_duration = not IS_WINDOWS and UISettings.console_menu_camera_move_duration
	self._animations = {}

	self:create_ui_elements(params, offset)
	Managers.state.event:register(self, "respawn_hero", "respawn_hero")
	Managers.state.event:register(self, "despawn_hero", "despawn_hero")
end

HeroWindowBackgroundConsole._create_viewport_definition = function (self)
	return {
		scenegraph_id = "screen",
		element = UIElements.Viewport,
		style = {
			viewport = {
				layer = 960,
				viewport_name = "character_preview_viewport",
				clear_screen_on_create = true,
				level_name = "levels/ui_keep_menu/world",
				enable_sub_gui = false,
				fov = 50,
				world_name = "character_preview",
				world_flags = {
					Application.DISABLE_SOUND,
					Application.DISABLE_ESRAM,
					Application.ENABLE_VOLUMETRICS
				},
				object_sets = LevelResource.object_set_names("levels/ui_keep_menu/world"),
				camera_position = {
					0,
					0,
					0
				},
				camera_lookat = {
					0,
					0,
					0
				}
			}
		},
		content = {
			button_hotspot = {
				allow_multi_hover = true
			}
		}
	}
end

HeroWindowBackgroundConsole.create_ui_elements = function (self, params, offset)
	if self._viewport_widget then
		UIWidget.destroy(self.ui_renderer, self._viewport_widget)

		self._viewport_widget = nil
	end

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
	local loading_overlay_widgets = {}
	local loading_overlay_widgets_by_name = {}

	for name, widget_definition in pairs(loading_overlay_widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		loading_overlay_widgets[#loading_overlay_widgets + 1] = widget
		loading_overlay_widgets_by_name[name] = widget
	end

	self._loading_overlay_widgets = loading_overlay_widgets
	self._loading_overlay_widgets_by_name = loading_overlay_widgets_by_name

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self.ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end

	if self.is_in_inn and not self.force_ingame_menu then
		self._viewport_widget_definition = self:_create_viewport_definition()

		self:_setup_object_sets()
	else
		self._background_widget = UIWidget.init(background_rect)
	end

	if not Development.parameter("hero_statistics") then
		widgets_by_name.detailed.content.visible = false
	end
end

HeroWindowBackgroundConsole._setup_object_sets = function (self)
	local level_name = self._viewport_widget_definition.style.viewport.level_name
	local object_set_names = LevelResource.object_set_names(level_name)
	self._object_sets = {}

	for _, object_set_name in ipairs(object_set_names) do
		self._object_sets[object_set_name] = LevelResource.unit_indices_in_object_set(level_name, object_set_name)
	end
end

HeroWindowBackgroundConsole.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate HeroWindowBackgroundConsole")

	self.ui_animator = nil

	Managers.state.event:unregister("respawn_hero", self)
	Managers.state.event:unregister("despawn_hero", self)

	if self.world_previewer then
		self.world_previewer:prepare_exit()
		self.world_previewer:on_exit()
		self.world_previewer:destroy()
	end

	if self._viewport_widget then
		UIWidget.destroy(self.ui_renderer, self._viewport_widget)

		self._viewport_widget = nil
	end
end

HeroWindowBackgroundConsole.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	if self.world_previewer and self.hero_unit_spawned then
		local input_service = self.parent:window_input_service()

		self:_handle_input(input_service, dt, t)
		self:_update_statistics_widget(input_service, dt)
	end

	self:_update_animations(dt)
	self:draw(dt)

	if self.world_previewer then
		local statistics_activate = self:_statistics_activate()
		local disable_hero_unit_input = statistics_activate

		self.world_previewer:update(dt, t, disable_hero_unit_input)
	end
end

HeroWindowBackgroundConsole._update_character_visibility = function (self, layout_name)
	local draw_character = character_visibility_per_layout[layout_name] or false
	local camera_move_duration = camera_move_duration_per_layout[layout_name]
	local disable_camera_position_update = disable_camera_position_per_layout[layout_name]

	if self._draw_character ~= draw_character then
		self.world_previewer:_set_character_visibility(draw_character, camera_move_duration, disable_camera_position_update)
	end

	self._draw_character = draw_character

	if not draw_character and self.params.hero_statistics_active then
		self:_handle_statistics_pressed()
	end
end

local EMPTY_TABLE = {}

HeroWindowBackgroundConsole._update_level_events = function (self, layout_name)
	local level_events_to_trigger = level_events_per_layout[layout_name] or EMPTY_TABLE

	for _, event_name in ipairs(level_events_to_trigger) do
		self.world_previewer:trigger_level_event(event_name)
	end
end

HeroWindowBackgroundConsole._update_object_sets = function (self, layout_name)
	local object_set_to_enable = object_sets_per_layout[layout_name]

	if object_set_to_enable.keep_current_object_set then
		return
	end

	for object_set_name, object_set_units in pairs(self._object_sets) do
		local enable_visibility = object_set_to_enable and object_set_to_enable[object_set_name] or false

		self.world_previewer:show_level_units(object_set_units, enable_visibility)
	end
end

HeroWindowBackgroundConsole.post_update = function (self, dt, t)
	if self._viewport_widget_definition and not self._viewport_widget then
		self._viewport_widget = UIWidget.init(self._viewport_widget_definition)
		self._fadeout_loading_overlay = true
	end

	self:_update_loading_overlay_fadeout_animation(dt)

	if not self.initialized and self._viewport_widget then
		local world_previewer = MenuWorldPreviewer:new(self.ingame_ui_context, camera_position_by_character, "HeroWindowBackgroundConsole")

		local function callback()
			self.hero_unit_spawned = true
		end

		self.hero_unit_spawned = false

		world_previewer:on_enter(self._viewport_widget, self.hero_name)
		world_previewer:request_spawn_hero_unit(self.hero_name, self.career_index, false, callback, nil, self._camera_move_duration)

		self.world_previewer = world_previewer
		self.initialized = true
	end

	if self.world_previewer then
		local layout_name = self.parent:get_layout_name()

		if layout_name ~= self._current_layout_name then
			self:_update_object_sets(layout_name)
			self:_update_level_events(layout_name)
			self:_update_character_visibility(layout_name)

			self._current_layout_name = layout_name
		end

		if self.hero_unit_spawned then
			self:_update_skin_sync()
			self:_update_loadout_sync()
			self:_update_wielded_slot()
		end

		self.world_previewer:post_update(dt, t)
	end
end

local FORCE_RESYNC = -1

HeroWindowBackgroundConsole.respawn_hero = function (self, optional_params, override_camera_movement)
	if optional_params then
		self.hero_name = optional_params.hero_name
		self.career_index = optional_params.career_index
	end

	local world_previewer = self.world_previewer

	if not world_previewer then
		return
	end

	self.hero_unit_spawned = false

	local function callback()
		self.hero_unit_spawned = true
		self._loadout_sync_id = FORCE_RESYNC

		self:_update_loadout_sync()

		self._selected_loadout_slot_index = FORCE_RESYNC

		self:_update_wielded_slot()
	end

	world_previewer:respawn_hero_unit(self.hero_name, self.career_index, false, callback, self._camera_move_duration)
end

HeroWindowBackgroundConsole.despawn_hero = function (self)
	local world_previewer = self.world_previewer

	if not world_previewer then
		return
	end

	world_previewer:hide_character()
end

HeroWindowBackgroundConsole._update_animations = function (self, dt)
	self.ui_animator:update(dt)

	local animations = self._animations
	local ui_animator = self.ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	local widgets_by_name = self._widgets_by_name
end

HeroWindowBackgroundConsole._update_loadout_sync = function (self)
	local parent = self.parent
	local loadout_sync_id = parent.loadout_sync_id

	if loadout_sync_id ~= self._loadout_sync_id then
		self:_populate_loadout()

		self._loadout_sync_id = loadout_sync_id

		self:_sync_statistics()
	end
end

HeroWindowBackgroundConsole._update_skin_sync = function (self)
	local parent = self.parent
	local parent_skin_sync_id = parent.skin_sync_id

	if parent_skin_sync_id ~= self.skin_sync_id then
		self:respawn_hero()

		self.skin_sync_id = parent_skin_sync_id
	end
end

HeroWindowBackgroundConsole._update_wielded_slot = function (self)
	local parent = self.parent
	local selected_loadout_slot_index = parent:get_selected_loadout_slot_index()

	if selected_loadout_slot_index ~= self._selected_loadout_slot_index then
		local slots = InventorySettings.slots_by_slot_index

		for _, slot in pairs(slots) do
			if slot.slot_index == selected_loadout_slot_index then
				local slot_type = slot.type

				if slot_type == "melee" or slot_type == "ranged" then
					if self.world_previewer:wielded_slot_type() ~= slot_type then
						self.world_previewer:wield_weapon_slot(slot_type)
					end

					break
				end
			end
		end

		if not self.world_previewer:wielded_slot_type() then
			self.world_previewer:wield_weapon_slot("melee")
		end

		self._selected_loadout_slot_index = selected_loadout_slot_index
	end
end

HeroWindowBackgroundConsole._populate_loadout = function (self)
	local world_previewer = self.world_previewer
	local hero_name = self.hero_name
	local slots = InventorySettings.slots_by_slot_index
	local career_index = self.career_index
	local profile_index = FindProfileIndex(hero_name)
	local profile = SPProfiles[profile_index]
	local career_data = profile.careers[career_index]
	local career_name = career_data.name
	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local hero_experience = hero_attributes:get(hero_name, "experience") or 0
	local hero_level = ExperienceSettings.get_level(hero_experience)
	local is_career_unlocked, reason, dlc_name, localized = career_data:is_unlocked_function(hero_name, hero_level)
	local is_dlc = not is_career_unlocked and dlc_name

	if is_dlc then
		local preview_items = career_data.preview_items
		local preview_wield_slot = career_data.preview_wield_slot
		local preview_animation = career_data.preview_animation

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

		local career_name = career_data.name
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

		if preview_animation then
			self.world_previewer:play_character_animation(preview_animation)
		end
	else
		local post_crashify_exception = false

		for _, slot in pairs(slots) do
			local slot_name = slot.name
			local item = BackendUtils.get_loadout_item(career_name, slot_name)

			if item then
				local item_data = item.data
				local item_name = item_data.name
				local item_slot_type = slot.type
				local current_item_name = world_previewer:item_name_by_slot_type(item_slot_type)

				if item_name ~= current_item_name or item_slot_type == "melee" or item_slot_type == "ranged" then
					local backend_id = item.backend_id
					local item_info = world_previewer:get_equipped_item_info(slot)

					if not item_info or item_info.backend_id ~= backend_id then
						world_previewer:equip_item(item_name, slot, backend_id)
					end
				end
			else
				printf("[Cosmetic] Failed to equip slot %q for career %q in hero previewer", slot_name, career_name)

				post_crashify_exception = true
			end
		end

		if post_crashify_exception then
			Crashify.print_exception("[Cosmetic] Failed to equip slot for career in hero previewer")
		end
	end
end

HeroWindowBackgroundConsole._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

HeroWindowBackgroundConsole._is_stepper_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot_left = content.button_hotspot_left
	local hotspot_right = content.button_hotspot_right

	if hotspot_left.on_release then
		hotspot_left.on_release = false

		return true, -1
	elseif hotspot_right.on_release then
		hotspot_right.on_release = false

		return true, 1
	end
end

HeroWindowBackgroundConsole._handle_input = function (self, input_service, dt, t)
	local widgets_by_name = self._widgets_by_name
	local detailed_widget = widgets_by_name.detailed

	if self._draw_character then
		-- Nothing
	end
end

HeroWindowBackgroundConsole._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level
end

HeroWindowBackgroundConsole.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	if self._show_loading_overlay then
		for _, widget in ipairs(self._loading_overlay_widgets) do
			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_top_renderer)

	if self._viewport_widget then
		UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)
		UIRenderer.draw_widget(ui_renderer, self._viewport_widget)
		UIRenderer.end_pass(ui_renderer)
	elseif self._background_widget then
		UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)
		UIRenderer.draw_widget(ui_renderer, self._background_widget)
		UIRenderer.end_pass(ui_renderer)
	end
end

HeroWindowBackgroundConsole._play_sound = function (self, event)
	self.parent:play_sound(event)
end

HeroWindowBackgroundConsole._update_loading_overlay_fadeout_animation = function (self, dt)
	if not self._fadeout_loading_overlay then
		return
	end

	local loading_overlay_widgets_by_name = self._loading_overlay_widgets_by_name
	local start = 255
	local target = 0
	local speed = 9
	local progress = math.min(1, (self._fadeout_progress or 0) + speed * dt)
	local alpha = math.lerp(start, target, math.easeInCubic(progress))
	local loading_overlay = loading_overlay_widgets_by_name.loading_overlay
	local loading_overlay_loading_glow = loading_overlay_widgets_by_name.loading_overlay_loading_glow
	local loading_overlay_loading_frame = loading_overlay_widgets_by_name.loading_overlay_loading_frame
	loading_overlay.style.rect.color[1] = alpha
	loading_overlay_loading_glow.style.texture_id.color[1] = alpha
	loading_overlay_loading_frame.style.texture_id.color[1] = alpha
	self._fadeout_progress = progress

	if progress == 1 then
		self._fadeout_loading_overlay = nil
		self._fadeout_progress = nil
		self._show_loading_overlay = false
	end
end

HeroWindowBackgroundConsole._handle_statistics_pressed = function (self)
	local statistics_activate = self:_statistics_activate()
	self.params.hero_statistics_active = not statistics_activate

	if statistics_activate then
		self:_deactivate_statistics()
	else
		self:_activate_statistics()
	end
end

HeroWindowBackgroundConsole._statistics_activate = function (self)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.detailed

	return widget.content.active
end

HeroWindowBackgroundConsole._activate_statistics = function (self)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.detailed
	widget.content.active = true
	widget.content.list_content.active = true

	if widget.content.scrollbar.percentage < 1 then
		widget.content.scrollbar.active = true
	else
		widget.content.scrollbar.active = false
	end

	local drop_down_arrow = widget.style.drop_down_arrow
	drop_down_arrow.angle = math.pi

	self:_sync_statistics()
end

HeroWindowBackgroundConsole._sync_statistics = function (self)
	if not self:_statistics_activate() then
		return
	end

	local template = HeroStatisticsTemplate
	local layout = UIUtils.get_hero_statistics_by_template(template)

	self:_populate_statistics(layout)
end

HeroWindowBackgroundConsole._deactivate_statistics = function (self)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.detailed
	widget.content.active = false
	widget.content.list_content.active = false
	widget.content.scrollbar.active = false
	local drop_down_arrow = widget.style.drop_down_arrow
	drop_down_arrow.angle = 0
end

HeroWindowBackgroundConsole._update_statistics_widget = function (self, input_service, dt)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.detailed

	if not widget.content.active then
		return
	end

	local gamepad_input_axis = input_service:get("gamepad_right_axis")

	if gamepad_input_axis and Vector3.length(gamepad_input_axis) > 0.01 then
		local current_scroll_value = widget.content.scrollbar.scroll_value
		widget.content.scrollbar.scroll_value = math.clamp(current_scroll_value + gamepad_input_axis.y * dt * 5, 0, 1)
	end

	local detailed_button_size = scenegraph_definition.detailed_button.size
	local detailed_list_size = scenegraph_definition.detailed_list.size
	local list_style = widget.style.list_style
	local list_member_offset_y = list_style.list_member_offset[2]
	local num_draws = list_style.num_draws
	local total_size = nil

	if num_draws == 0 then
		total_size = math.abs(list_member_offset_y)
	else
		total_size = math.abs(list_member_offset_y * num_draws)
	end

	local scroll_height = math.max(total_size - detailed_list_size[2], 0)
	local list_scenegraph_id = list_style.scenegraph_id
	local scenegraph_node = self.ui_scenegraph[list_scenegraph_id]
	local scenegraph_pos = scenegraph_node.local_position
	local value = 1 - widget.content.scrollbar.scroll_value
	scenegraph_pos[2] = -detailed_button_size[2] + scroll_height * value
end

HeroWindowBackgroundConsole._populate_statistics = function (self, layout)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.detailed
	local content = widget.content
	local style = widget.style.list_style
	local list_content = content.list_content
	local item_styles = style.item_styles
	local num_entries = #layout

	for i = 1, num_entries do
		local entry = layout[i]
		local title = ""
		local name = ""
		local value = ""
		local entry_type = entry.type

		if entry_type == "title" then
			title = entry.display_name
		elseif entry_type == "entry" then
			name = entry.display_name
			value = entry.value
		end

		local content = list_content[i]
		content.name = UIRenderer.crop_text_width(self.ui_renderer, name, 300, item_styles[i].name)
		content.title = UIRenderer.crop_text_width(self.ui_renderer, title, 300, item_styles[i].title)
		content.value = value
	end

	style.num_draws = num_entries

	self:_setup_tab_scrollbar(widget)
end

HeroWindowBackgroundConsole._setup_tab_scrollbar = function (self, widget)
	local detailed_button_size = scenegraph_definition.detailed_button.size
	local detailed_list_size = scenegraph_definition.detailed_list.size
	local list_style = widget.style.list_style
	local list_member_offset_y = list_style.list_member_offset[2]
	local num_draws = list_style.num_draws
	local total_size = nil

	if num_draws == 0 then
		total_size = math.abs(list_member_offset_y)
	else
		total_size = math.abs(list_member_offset_y * num_draws)
	end

	local percentage = math.min(detailed_list_size[2] / total_size, 1)
	local scrollbar_content = widget.content.scrollbar

	if percentage < 1 then
		scrollbar_content.percentage = percentage
		scrollbar_content.scroll_value = 1
		local scroll_step_multiplier = 2
		scrollbar_content.scroll_amount = list_member_offset_y / (total_size - detailed_list_size[2]) * scroll_step_multiplier
	else
		scrollbar_content.percentage = 1
		scrollbar_content.scroll_value = 1
	end
end

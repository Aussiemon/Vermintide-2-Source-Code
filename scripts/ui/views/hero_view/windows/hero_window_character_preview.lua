require("scripts/ui/views/menu_world_previewer")
require("scripts/settings/hero_statistics_template")

local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_character_preview_definitions")
local widget_definitions = definitions.widgets
local viewport_widget_definition = definitions.viewport_widget
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local camera_position_by_character = definitions.camera_position_by_character
local loading_overlay_widget_definitions = definitions.loading_overlay_widgets
local DO_RELOAD = false
HeroWindowCharacterPreview = class(HeroWindowCharacterPreview)
HeroWindowCharacterPreview.NAME = "HeroWindowCharacterPreview"

HeroWindowCharacterPreview.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate HeroWindowCharacterPreview")

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
	self.hero_name = params.hero_name
	self.career_index = params.career_index
	self.skin_sync_id = self.parent.skin_sync_id
	self._animations = {}

	self:create_ui_elements(params, offset)
	self:_show_weapon_disclaimer(false)

	if Managers.mechanism:mechanism_setting("should_display_weapon_disclaimer") then
		self:_show_weapon_disclaimer(true)
	end
end

HeroWindowCharacterPreview.create_ui_elements = function (self, params, offset)
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

	self._level_package_name = viewport_widget_definition.style.viewport.level_package_name
	local callback = nil
	local asynchronous = true

	Managers.package:load(self._level_package_name, "HeroWindowCharacterPreview", callback, asynchronous)

	self._show_loading_overlay = true

	if not Development.parameter("hero_statistics") then
		widgets_by_name.detailed.content.visible = false
	end
end

HeroWindowCharacterPreview.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate HeroWindowCharacterPreview")

	self.ui_animator = nil

	if self.world_previewer then
		self.world_previewer:prepare_exit()
		self.world_previewer:on_exit()
		self.world_previewer:destroy()
	end

	if self._viewport_widget then
		UIWidget.destroy(self.ui_renderer, self._viewport_widget)

		self._viewport_widget = nil
	end

	Managers.package:unload(self._level_package_name, "HeroWindowCharacterPreview")

	self._level_package_name = nil
end

HeroWindowCharacterPreview.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	if self.world_previewer and self.hero_unit_spawned then
		self:_handle_input(dt, t)

		local input_service = self.parent:window_input_service()

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

HeroWindowCharacterPreview.post_update = function (self, dt, t)
	if not self._viewport_widget and Managers.package:has_loaded(self._level_package_name, "HeroWindowCharacterPreview") then
		self._viewport_widget = UIWidget.init(viewport_widget_definition)
		self._fadeout_loading_overlay = true
	end

	self:_update_loading_overlay_fadeout_animation(dt)

	if not self.initialized and self._viewport_widget then
		local world_previewer = MenuWorldPreviewer:new(self.ingame_ui_context, camera_position_by_character, "HeroWindowCharacterPreview")

		local function callback()
			self.hero_unit_spawned = true
		end

		self.hero_unit_spawned = false

		world_previewer:on_enter(self._viewport_widget, self.hero_name)
		world_previewer:request_spawn_hero_unit(self.hero_name, self.career_index, false, callback)

		self.world_previewer = world_previewer
		self.initialized = true
	end

	if self.world_previewer then
		if self.hero_unit_spawned then
			self:_update_skin_sync()
			self:_update_loadout_sync()
			self:_update_wielded_slot()
		end

		self.world_previewer:post_update(dt, t)
	end
end

local FORCE_RESYNC = -1

HeroWindowCharacterPreview.respawn_hero = function (self)
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

	world_previewer:respawn_hero_unit(self.hero_name, self.career_index, false, callback)
end

HeroWindowCharacterPreview._update_animations = function (self, dt)
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

HeroWindowCharacterPreview._update_loadout_sync = function (self)
	local parent = self.parent
	local loadout_sync_id = parent.loadout_sync_id

	if loadout_sync_id ~= self._loadout_sync_id then
		self:_populate_loadout()

		self._loadout_sync_id = loadout_sync_id

		self:_sync_statistics()
	end
end

HeroWindowCharacterPreview._update_skin_sync = function (self)
	local parent = self.parent
	local parent_skin_sync_id = parent.skin_sync_id

	if parent_skin_sync_id ~= self.skin_sync_id then
		self:respawn_hero()

		self.skin_sync_id = parent_skin_sync_id
	end
end

HeroWindowCharacterPreview._update_wielded_slot = function (self)
	local parent = self.parent
	local selected_loadout_slot_index = parent:get_selected_loadout_slot_index()

	if selected_loadout_slot_index ~= self._selected_loadout_slot_index then
		local slots = InventorySettings.slots_by_slot_index

		for _, slot in pairs(slots) do
			if slot.slot_index == selected_loadout_slot_index then
				local slot_type = slot.type

				if slot_type == "melee" or slot_type == "ranged" then
					self.world_previewer:wield_weapon_slot(slot_type)

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

HeroWindowCharacterPreview._populate_loadout = function (self)
	local world_previewer = self.world_previewer
	local hero_name = self.hero_name
	local slots = InventorySettings.slots_by_slot_index
	local career_index = self.career_index
	local profile_index = FindProfileIndex(hero_name)
	local profile = SPProfiles[profile_index]
	local career_data = profile.careers[career_index]
	local career_name = career_data.name

	for _, slot in pairs(slots) do
		local slot_name = slot.name
		local item = BackendUtils.get_loadout_item(career_name, slot_name)

		if item then
			local item_data = item.data
			local item_name = item_data.name
			local item_slot_type = slot.type
			local current_item_name = world_previewer:item_name_by_slot_type(item_slot_type)

			if (item_name and item_name ~= current_item_name) or item_slot_type == "melee" or item_slot_type == "ranged" then
				local backend_id = item.backend_id

				world_previewer:equip_item(item_name, slot, backend_id)
			end
		end
	end
end

HeroWindowCharacterPreview._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

HeroWindowCharacterPreview._is_stepper_button_pressed = function (self, widget)
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

HeroWindowCharacterPreview._handle_input = function (self, dt, t)
	local widgets_by_name = self._widgets_by_name
	local detailed_widget = widgets_by_name.detailed

	if self:_is_button_pressed(detailed_widget) then
		self:_handle_statistics_pressed()
	end
end

HeroWindowCharacterPreview._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level
end

HeroWindowCharacterPreview.draw = function (self, dt)
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
	end
end

HeroWindowCharacterPreview._play_sound = function (self, event)
	self.parent:play_sound(event)
end

HeroWindowCharacterPreview._update_loading_overlay_fadeout_animation = function (self, dt)
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

HeroWindowCharacterPreview._handle_statistics_pressed = function (self)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.detailed

	if widget.content.active then
		self:_deactivate_statistics()
	else
		self:_activate_statistics(widget)
	end
end

HeroWindowCharacterPreview._statistics_activate = function (self)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.detailed

	return widget.content.active
end

HeroWindowCharacterPreview._activate_statistics = function (self)
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

HeroWindowCharacterPreview._sync_statistics = function (self)
	if not self:_statistics_activate() then
		return
	end

	local template = HeroStatisticsTemplate
	local layout = UIUtils.get_hero_statistics_by_template(template)

	self:_populate_statistics(layout)
end

HeroWindowCharacterPreview._deactivate_statistics = function (self)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.detailed
	widget.content.active = false
	widget.content.list_content.active = false
	widget.content.scrollbar.active = false
	local drop_down_arrow = widget.style.drop_down_arrow
	drop_down_arrow.angle = 0
end

HeroWindowCharacterPreview._update_statistics_widget = function (self, input_service, dt)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.detailed

	if not widget.content.active then
		return
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

HeroWindowCharacterPreview._populate_statistics = function (self, layout)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.detailed
	local content = widget.content
	local style = widget.style.list_style
	local list_content = content.list_content
	local item_styles = style.item_styles
	local num_entries = #layout

	for i = 1, num_entries, 1 do
		local entry = layout[i]
		local title = ""
		local name = ""
		local value = ""
		local tooltip_title = ""
		local tooltip_description = ""
		local entry_type = entry.type

		if entry_type == "title" then
			title = entry.display_name
		elseif entry_type == "entry" then
			name = entry.display_name
			value = entry.value
			tooltip_title = entry.display_name
			tooltip_description = entry.description_name
		end

		local content = list_content[i]
		content.name = UIRenderer.crop_text_width(self.ui_renderer, name, 300, item_styles[i].name)
		content.title = UIRenderer.crop_text_width(self.ui_renderer, title, 300, item_styles[i].title)
		content.value = value
		content.tooltip.title = tooltip_title
		content.tooltip.description = tooltip_description
	end

	style.num_draws = num_entries

	self:_setup_tab_scrollbar(widget)
end

HeroWindowCharacterPreview._setup_tab_scrollbar = function (self, widget)
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

HeroWindowCharacterPreview._show_weapon_disclaimer = function (self, should_show)
	local disclaimer_text_content = self._widgets_by_name.disclaimer_text.content
	local disclaimer_text_background_content = self._widgets_by_name.disclaimer_text_background.content
	disclaimer_text_background_content.visible = should_show
	disclaimer_text_content.visible = should_show
end

return

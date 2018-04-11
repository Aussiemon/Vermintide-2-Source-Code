require("scripts/ui/views/menu_world_previewer")

local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_character_preview_definitions")
local widget_definitions = definitions.widgets
local viewport_widget_definition = definitions.viewport_widget
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local camera_position_by_character = definitions.camera_position_by_character
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
	local local_player = player_manager.local_player(player_manager)
	self._stats_id = local_player.stats_id(local_player)
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self.hero_name = params.hero_name
	self.career_index = params.career_index
	self.skin_sync_id = self.parent.skin_sync_id
	self._animations = {}

	self.create_ui_elements(self, params, offset)

	return 
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

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self.ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end

	self._viewport_widget = UIWidget.init(viewport_widget_definition)

	return 
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

	return 
end
HeroWindowCharacterPreview.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self.create_ui_elements(self)
	end

	if self.world_previewer and self.hero_unit_spawned then
		self._handle_input(self, dt, t)
	end

	self._update_animations(self, dt)
	self.draw(self, dt)

	if self.world_previewer then
		self.world_previewer:update(dt, t)
	end

	return 
end
HeroWindowCharacterPreview.post_update = function (self, dt, t)
	if not self.initialized then
		local world_previewer = MenuWorldPreviewer:new(self.ingame_ui_context, camera_position_by_character)

		local function callback()
			self.hero_unit_spawned = true

			return 
		end

		self.hero_unit_spawned = false

		world_previewer.on_enter(world_previewer, self._viewport_widget, self.hero_name)
		world_previewer.spawn_hero_unit(world_previewer, self.hero_name, self.career_index, false, callback)

		self.world_previewer = world_previewer
		self.initialized = true
	end

	if self.world_previewer and self.hero_unit_spawned then
		self._update_loadout_sync(self)
		self._update_wielded_slot(self)
		self._update_skin_sync(self)
		self.world_previewer:post_update(dt, t)
	end

	return 
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

		return 
	end

	world_previewer.respawn_hero_unit(world_previewer, self.hero_name, self.career_index, false, callback)

	return 
end
HeroWindowCharacterPreview._update_animations = function (self, dt)
	self.ui_animator:update(dt)

	local animations = self._animations
	local ui_animator = self.ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator.is_animation_completed(ui_animator, animation_id) then
			ui_animator.stop_animation(ui_animator, animation_id)

			animations[animation_name] = nil
		end
	end

	local widgets_by_name = self._widgets_by_name

	return 
end
HeroWindowCharacterPreview._update_loadout_sync = function (self)
	local parent = self.parent
	local loadout_sync_id = parent.loadout_sync_id

	if loadout_sync_id ~= self._loadout_sync_id then
		self._populate_loadout(self)

		self._loadout_sync_id = loadout_sync_id
	end

	return 
end
HeroWindowCharacterPreview._update_skin_sync = function (self)
	local parent = self.parent
	local parent_skin_sync_id = parent.skin_sync_id

	if parent_skin_sync_id ~= self.skin_sync_id then
		self.respawn_hero(self)

		self.skin_sync_id = parent_skin_sync_id
	end

	return 
end
HeroWindowCharacterPreview._update_wielded_slot = function (self)
	local parent = self.parent
	local selected_loadout_slot_index = parent.get_selected_loadout_slot_index(parent)

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

	return 
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
			local current_item_name = world_previewer.item_name_by_slot_type(world_previewer, item_slot_type)

			if item_name ~= current_item_name or item_slot_type == "melee" or item_slot_type == "ranged" then
				local backend_id = item.backend_id

				world_previewer.equip_item(world_previewer, item_name, slot, backend_id)
			end
		end
	end

	return 
end
HeroWindowCharacterPreview._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end

	return 
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

	return 
end
HeroWindowCharacterPreview._handle_input = function (self, dt, t)
	return 
end
HeroWindowCharacterPreview._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level

	return 
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

	UIRenderer.end_pass(ui_top_renderer)

	if self._viewport_widget then
		UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)
		UIRenderer.draw_widget(ui_renderer, self._viewport_widget)
		UIRenderer.end_pass(ui_renderer)
	end

	return 
end
HeroWindowCharacterPreview._play_sound = function (self, event)
	self.parent:play_sound(event)

	return 
end
HeroWindowCharacterPreview._get_preview_world = function (self)
	local previewer_pass_data = self._viewport_widget.element.pass_data[1]
	local viewport = previewer_pass_data.viewport
	local world = previewer_pass_data.world

	return world, viewport
end

return 

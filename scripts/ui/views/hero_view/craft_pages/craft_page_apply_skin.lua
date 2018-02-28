require("scripts/ui/views/menu_world_previewer")

local crafting_recipes, crafting_recipes_by_name, crafting_recipes_lookup = dofile("scripts/settings/crafting/crafting_recipes")
local definitions = local_require("scripts/ui/views/hero_view/craft_pages/definitions/craft_page_apply_skin_definitions")
local widget_definitions = definitions.widgets
local category_settings = definitions.category_settings
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local DO_RELOAD = false
local NUM_CRAFT_SLOTS = 1
CraftPageApplySkin = class(CraftPageApplySkin)
CraftPageApplySkin.NAME = "CraftPageApplySkin"
CraftPageApplySkin.on_enter = function (self, params, settings)
	print("[HeroWindowCraft] Enter Substate CraftPageApplySkin")

	self.parent = params.parent
	self.super_parent = self.parent.parent
	local ingame_ui_context = params.ingame_ui_context
	self.ingame_ui_context = ingame_ui_context
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.statistics_db = ingame_ui_context.statistics_db
	self.render_settings = {
		snap_pixel_positions = true
	}
	self.crafting_manager = Managers.state.crafting
	local player_manager = Managers.player
	local local_player = player_manager.local_player(player_manager)
	self._stats_id = local_player.stats_id(local_player)
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self.hero_name = params.hero_name
	self.career_index = params.career_index
	self.profile_index = params.profile_index
	self.wwise_world = params.wwise_world
	self.settings = settings
	self._animations = {}

	self.create_ui_elements(self, params)

	self._item_grid = ItemGridUI:new(category_settings, self._widgets_by_name.item_grid, self.hero_name, self.career_index)

	self._item_grid:disable_locked_items(true)
	self._item_grid:mark_locked_items(true)
	self._item_grid:hide_slots(true)
	self._item_grid:disable_item_drag()

	self._item_grid_2 = ItemGridUI:new(category_settings, self._widgets_by_name.item_grid_2, self.hero_name, self.career_index)

	self._item_grid_2:disable_item_drag()
	self._item_grid_2:mark_locked_items(true)
	self._item_grid_2:hide_slots(true)
	self._item_grid_2:disable_item_drag()
	self.super_parent:clear_disabled_backend_ids()
	self._weapon_slot_updated(self)

	return 
end
CraftPageApplySkin.create_ui_elements = function (self, params)
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

	self._set_craft_button_disabled(self, true)
	self._handle_craft_input_progress(self, 0)

	return 
end
CraftPageApplySkin._weapon_slot_updated = function (self)
	local item_interface = Managers.backend:get_interface("items")
	local added_backend_id = self._craft_item
	local item_data = added_backend_id and item_interface.get_item_masterlist_data(item_interface, added_backend_id)
	local added_item_slot_type = item_data and item_data.slot_type

	if item_data then
		local weapon_skin_name = item_data.key .. "_skin"
		local item_filter = "item_key == " .. weapon_skin_name

		self.parent.parent:set_craft_optional_item_filter(item_filter)
	else
		self.parent.parent:set_craft_optional_item_filter(nil)
	end

	return 
end
CraftPageApplySkin.on_exit = function (self, params)
	self.parent.parent:set_craft_optional_item_filter(nil)
	print("[HeroWindowCraft] Exit Substate CraftPageApplySkin")

	self.ui_animator = nil

	return 
end
CraftPageApplySkin.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self.create_ui_elements(self)
	end

	self._handle_input(self, dt, t)
	self._update_animations(self, dt)
	self._update_craft_items(self)
	self.draw(self, dt)

	return 
end
CraftPageApplySkin.post_update = function (self, dt, t)
	return 
end
CraftPageApplySkin._update_animations = function (self, dt)
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

	UIWidgetUtils.animate_default_button(widgets_by_name.craft_button, dt)

	return 
end
CraftPageApplySkin._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end

	return 
end
CraftPageApplySkin._is_button_hovered = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_hover_enter then
		return true
	end

	return 
end
CraftPageApplySkin._is_button_held = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.is_clicked then
		return hotspot.is_clicked
	end

	return 
end
CraftPageApplySkin._handle_input = function (self, dt, t)
	local parent = self.parent

	if parent.waiting_for_craft(parent) or self._craft_result then
		return 
	end

	local widgets_by_name = self._widgets_by_name
	local super_parent = self.super_parent
	local craft_input = self._is_button_held(self, widgets_by_name.craft_button)
	local craft_input_accepted = false

	if craft_input == 0 and self._craft_item and self._skin_item then
		if not self._craft_input_time then
			self._craft_input_time = 0

			self._play_sound(self, "play_gui_craft_forge_button_begin")
		else
			self._craft_input_time = self._craft_input_time + dt
		end

		local max_time = 2
		local progress = math.min(self._craft_input_time/max_time, 1)
		craft_input_accepted = self._handle_craft_input_progress(self, progress)

		WwiseWorld.set_global_parameter(self.wwise_world, "craft_forge_button_progress", progress)
	elseif self._craft_input_time then
		self._craft_input_time = nil

		self._handle_craft_input_progress(self, 0)
		self._play_sound(self, "play_gui_craft_forge_button_aborted")
	end

	if craft_input_accepted then
		local craft_item = self._craft_item
		local skin_item = self._skin_item
		local items = {
			craft_item,
			skin_item
		}
		local recipe_available = parent.craft(parent, items)

		if recipe_available then
			self._set_craft_button_disabled(self, true)
			self._item_grid:lock_item_by_id(craft_item, true)
			self._item_grid:update_items_status()
			self._item_grid_2:lock_item_by_id(skin_item, true)
			self._item_grid_2:update_items_status()
			self._play_sound(self, "play_gui_craft_forge_button_completed")
			self._play_sound(self, "play_gui_craft_forge_begin")
		end
	end

	return 
end
CraftPageApplySkin._handle_craft_input_progress = function (self, progress)
	local has_progress = progress ~= 0
	local bard_default_width = scenegraph_definition.craft_bar.size[1]
	self.ui_scenegraph.craft_bar.size[1] = bard_default_width*progress

	if progress == 1 then
		return true
	end

	return 
end
CraftPageApplySkin.craft_result = function (self, result, error, reset_slots)
	if not error then
		self._craft_result = result
	end

	return 
end
CraftPageApplySkin.reset = function (self)
	local item_grid = self._item_grid
	local item_grid_2 = self._item_grid_2

	item_grid.clear_locked_items(item_grid)
	item_grid.update_items_status(item_grid)
	item_grid_2.clear_locked_items(item_grid_2)
	item_grid_2.update_items_status(item_grid_2)
	self._weapon_slot_updated(self)

	return 
end
CraftPageApplySkin.on_craft_completed = function (self)
	local result = self._craft_result
	local item_grid = self._item_grid
	local item_grid_2 = self._item_grid_2

	item_grid.clear_item_grid(item_grid)
	item_grid_2.clear_item_grid(item_grid_2)
	self.super_parent:clear_disabled_backend_ids()
	self.super_parent:update_inventory_items()

	local ignore_sound = true
	local craft_item_backend_id = self._craft_item

	self._add_item(self, item_grid, craft_item_backend_id, ignore_sound)
	item_grid.lock_item_by_id(item_grid, craft_item_backend_id, true)
	item_grid.update_items_status(item_grid)
	self._set_craft_button_disabled(self, true)

	self._craft_result = nil
	self._craft_item = nil
	self._skin_item = nil
	self._presenting_reward = true

	return 
end
CraftPageApplySkin._update_craft_items = function (self)
	local super_parent = self.super_parent
	local item_grid = self._item_grid
	local item_grid_2 = self._item_grid_2
	local pressed_backend_id, is_drag_item = super_parent.get_pressed_item_backend_id(super_parent)

	if pressed_backend_id and not self._presenting_reward then
		if not self._craft_item then
			self._add_item(self, item_grid, pressed_backend_id)

			self._craft_item = pressed_backend_id

			self._weapon_slot_updated(self)
		else
			self._add_item(self, item_grid_2, pressed_backend_id)

			self._skin_item = pressed_backend_id

			self._weapon_slot_updated(self)
			self._set_craft_button_disabled(self, false)
		end
	end

	local weapon_grid_item_pressed = item_grid.is_item_pressed(item_grid)

	if weapon_grid_item_pressed then
		local backend_id = weapon_grid_item_pressed.backend_id

		self._remove_item(self, item_grid, backend_id)

		self._craft_item = nil

		if self._presenting_reward then
			self._presenting_reward = nil
		end

		if self._skin_item then
			self._remove_item(self, item_grid_2, self._skin_item)

			self._skin_item = nil
		end

		self._weapon_slot_updated(self)
		self._set_craft_button_disabled(self, true)
	end

	local skin_grid_item_pressed = item_grid_2.is_item_pressed(item_grid_2)

	if skin_grid_item_pressed then
		local backend_id = skin_grid_item_pressed.backend_id

		self._remove_item(self, item_grid_2, backend_id)

		self._skin_item = nil

		self._weapon_slot_updated(self)
		self._set_craft_button_disabled(self, true)
	end

	return 
end
CraftPageApplySkin._remove_item = function (self, item_grid, backend_id)
	self.super_parent:set_disabled_backend_id(backend_id, false)
	item_grid.add_item_to_slot_index(item_grid, 1, nil)
	self._set_craft_button_disabled(self, true)
	self._play_sound(self, "play_gui_craft_item_drag")

	return 
end
CraftPageApplySkin._add_item = function (self, item_grid, backend_id, ignore_sound)
	item_grid.clear_item_grid(item_grid)

	local slot_index = 1

	if slot_index then
		local item_interface = Managers.backend:get_interface("items")
		local item = backend_id and item_interface.get_item_from_id(item_interface, backend_id)

		item_grid.add_item_to_slot_index(item_grid, slot_index, item)
		self.super_parent:set_disabled_backend_id(backend_id, true)

		if backend_id and not ignore_sound then
			self._play_sound(self, "play_gui_craft_item_drop")
		end
	end

	return 
end
CraftPageApplySkin._set_craft_button_disabled = function (self, disabled)
	self._widgets_by_name.craft_button.content.button_hotspot.disable_button = disabled

	return 
end
CraftPageApplySkin._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level

	return 
end
CraftPageApplySkin.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.super_parent:window_input_service()

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	UIRenderer.end_pass(ui_top_renderer)

	return 
end
CraftPageApplySkin._play_sound = function (self, event)
	self.super_parent:play_sound(event)

	return 
end
CraftPageApplySkin._set_craft_button_text = function (self, text, localize)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.craft_button
	widget.content.button_text = (localize and Localize(text)) or text

	return 
end

return 

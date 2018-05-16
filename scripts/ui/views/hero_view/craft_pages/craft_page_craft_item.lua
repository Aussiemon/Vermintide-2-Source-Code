require("scripts/ui/views/menu_world_previewer")

local crafting_recipes, crafting_recipes_by_name, crafting_recipes_lookup = dofile("scripts/settings/crafting/crafting_recipes")
local definitions = local_require("scripts/ui/views/hero_view/craft_pages/definitions/craft_page_craft_item_definitions")
local widget_definitions = definitions.widgets
local category_settings = definitions.category_settings
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local DO_RELOAD = false
local NUM_CRAFT_SLOTS = 1
CraftPageCraftItem = class(CraftPageCraftItem)
CraftPageCraftItem.NAME = "CraftPageCraftItem"

CraftPageCraftItem.on_enter = function (self, params, settings)
	print("[HeroWindowCraft] Enter Substate CraftPageCraftItem")

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
	local local_player = player_manager:local_player()
	self._stats_id = local_player:stats_id()
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self.hero_name = params.hero_name
	self.career_index = params.career_index
	self.profile_index = params.profile_index
	self.wwise_world = params.wwise_world
	self.settings = settings
	self._animations = {}

	self:create_ui_elements(params)

	self._craft_items = {}
	self._material_items = {}
	self._item_grid = ItemGridUI:new(category_settings, self._widgets_by_name.item_grid, self.hero_name, self.career_index)

	self._item_grid:disable_locked_items(true)
	self._item_grid:mark_locked_items(true)
	self._item_grid:hide_slots(true)
	self._item_grid:disable_item_drag()
	self.super_parent:clear_disabled_backend_ids()
	self.parent:set_input_description(nil)
	self:setup_recipe_requirements()
end

CraftPageCraftItem.setup_recipe_requirements = function (self)
	local settings = self.settings
	local recipe_name = settings.name
	local added_backend_id = self._craft_items[1]
	local item_interface = Managers.backend:get_interface("items")
	local item_data = added_backend_id and item_interface:get_item_masterlist_data(added_backend_id)
	local added_item_slot_type = item_data and item_data.slot_type
	local rarity = added_backend_id and item_interface:get_item_rarity(added_backend_id)
	local can_use_added_item = not added_backend_id or rarity == "default"

	if added_backend_id then
		if added_item_slot_type == "ranged" or added_item_slot_type == "melee" then
			recipe_name = "craft_weapon"
		elseif added_item_slot_type == "trinket" or added_item_slot_type == "ring" or added_item_slot_type == "necklace" then
			recipe_name = "craft_jewellery"
		end
	end

	self._recipe_name = recipe_name
	local recipe = crafting_recipes_by_name[recipe_name]
	local ingredients = recipe.ingredients
	local num_required_ingredients = 0

	for index, data in ipairs(ingredients) do
		if not data.catergory then
			num_required_ingredients = num_required_ingredients + 1
		end
	end

	self:create_recipe_grid_by_amount(num_required_ingredients)

	local material_items = self._material_items

	table.clear(material_items)

	local item_interface = Managers.backend:get_interface("items")
	local crafting_material_items = item_interface:get_filtered_items("item_type == crafting_material")
	local has_all_requirements = true
	local grid_index = 1
	local recipe_grid = self._recipe_grid

	for index, data in ipairs(ingredients) do
		if not data.catergory then
			local item_key = data.name
			local required_amount = data.amount
			local amount_owned = 0
			local required_backend_id = nil

			for _, item in ipairs(crafting_material_items) do
				local backend_id = item.backend_id
				local item_data = item.data

				if item_data.key == item_key then
					required_backend_id = backend_id
					amount_owned = item_interface:get_item_amount(backend_id)

					break
				end
			end

			local has_required_amount = required_amount <= amount_owned
			local presentation_amount = ((amount_owned < UISettings.max_craft_material_presentation_amount and tostring(amount_owned)) or "*") .. "/" .. tostring(required_amount)
			local fake_item = {
				data = table.clone(ItemMasterList[item_key]),
				amount = presentation_amount,
				insufficient_amount = not has_required_amount
			}

			recipe_grid:add_item_to_slot_index(grid_index, fake_item)

			grid_index = grid_index + 1

			if has_required_amount then
				material_items[#material_items + 1] = required_backend_id
			else
				has_all_requirements = false
			end
		end
	end

	self._has_all_requirements = has_all_requirements and can_use_added_item

	self:_set_craft_button_disabled(not self._has_all_requirements)
end

CraftPageCraftItem.create_recipe_grid_by_amount = function (self, amount)
	if self._recipe_grid then
		self._recipe_grid:destroy()

		self._recipe_grid = nil
	end

	local definition = UIWidgets.create_recipe_grid("recipe_grid", scenegraph_definition.recipe_grid.size, 1, amount, 30, 30)
	local recipe_grid_widget = UIWidget.init(definition)

	for i, widget in ipairs(self._widgets) do
		if widget == self._widgets_by_name.recipe_grid then
			self._widgets[i] = recipe_grid_widget
			self._widgets_by_name.recipe_grid = recipe_grid_widget

			break
		end
	end

	self._recipe_grid = ItemGridUI:new(category_settings, self._widgets_by_name.recipe_grid, self.hero_name, self.career_index)

	self._recipe_grid:disable_item_drag()
end

CraftPageCraftItem.create_ui_elements = function (self, params)
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

	self:_handle_craft_input_progress(0)
end

CraftPageCraftItem.on_exit = function (self, params)
	print("[HeroWindowCraft] Exit Substate CraftPageCraftItem")

	self.ui_animator = nil

	if self._craft_input_time then
		self:_play_sound("play_gui_craft_forge_button_aborted")
	end
end

CraftPageCraftItem.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	self:_handle_input(dt, t)
	self:_update_animations(dt)
	self:_update_craft_items()
	self:draw(dt)
end

CraftPageCraftItem.post_update = function (self, dt, t)
	return
end

CraftPageCraftItem._update_animations = function (self, dt)
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

	UIWidgetUtils.animate_default_button(widgets_by_name.craft_button, dt)
end

CraftPageCraftItem._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

CraftPageCraftItem._is_button_hovered = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_hover_enter then
		return true
	end
end

CraftPageCraftItem._is_button_held = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.is_clicked then
		return hotspot.is_clicked
	end
end

CraftPageCraftItem._handle_input = function (self, dt, t)
	local parent = self.parent

	if parent:waiting_for_craft() or self._craft_result then
		return
	end

	local widgets_by_name = self._widgets_by_name
	local super_parent = self.super_parent
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local input_service = self.super_parent:window_input_service()
	local widget = widgets_by_name.craft_button
	local is_button_enabled = not widget.content.button_hotspot.disable_button
	local craft_input = self:_is_button_held(widgets_by_name.craft_button)
	local craft_input_gamepad = is_button_enabled and gamepad_active and input_service:get("refresh_hold")
	local craft_input_accepted = false

	if (craft_input == 0 or craft_input_gamepad) and self._has_all_requirements then
		if not self._craft_input_time then
			self._craft_input_time = 0

			self:_play_sound("play_gui_craft_forge_button_begin")
		else
			self._craft_input_time = self._craft_input_time + dt
		end

		local max_time = 2
		local progress = math.min(self._craft_input_time / max_time, 1)
		craft_input_accepted = self:_handle_craft_input_progress(progress)

		WwiseWorld.set_global_parameter(self.wwise_world, "craft_forge_button_progress", progress)
	elseif self._craft_input_time then
		self._craft_input_time = nil

		self:_handle_craft_input_progress(0)
		self:_play_sound("play_gui_craft_forge_button_aborted")
	end

	if craft_input_accepted then
		local craft_items = self._craft_items
		local material_items = self._material_items
		local items = {}

		for _, backend_id in ipairs(craft_items) do
			items[#items + 1] = backend_id
		end

		for _, backend_id in ipairs(material_items) do
			items[#items + 1] = backend_id
		end

		local recipe_available = parent:craft(items)

		if recipe_available then
			self:_set_craft_button_disabled(true)

			local item_grid = self._item_grid

			for _, backend_id in pairs(items) do
				item_grid:lock_item_by_id(backend_id, true)
			end

			item_grid:update_items_status()
			self:_play_sound("play_gui_craft_forge_button_completed")
			self:_play_sound("play_gui_craft_forge_begin")
		end
	end
end

CraftPageCraftItem._handle_craft_input_progress = function (self, progress)
	local has_progress = progress ~= 0
	local bard_default_width = scenegraph_definition.craft_bar.size[1]
	self.ui_scenegraph.craft_bar.size[1] = bard_default_width * progress

	if progress == 1 then
		return true
	end
end

CraftPageCraftItem.craft_result = function (self, result, error, reset_slots)
	if not error then
		self._craft_result = result
	end
end

CraftPageCraftItem.reset = function (self)
	local item_grid = self._item_grid

	item_grid:clear_locked_items()
	item_grid:update_items_status()
	self:_set_craft_button_disabled(not self._has_all_requirements)
end

CraftPageCraftItem.on_craft_completed = function (self)
	local result = self._craft_result
	local item_grid = self._item_grid

	table.clear(self._craft_items)

	for i = 1, NUM_CRAFT_SLOTS, 1 do
		self._craft_items[i] = nil
	end

	item_grid:clear_item_grid()
	self.super_parent:clear_disabled_backend_ids()
	self.super_parent:update_inventory_items()

	local num_reward_items = 0

	for index, data in pairs(result) do
		num_reward_items = num_reward_items + 1
	end

	local ignore_sound = true

	for index, data in pairs(result) do
		local backend_id = data[1]
		local amount = data[3]

		self:_add_craft_item(backend_id, index, ignore_sound)
	end

	item_grid:clear_locked_items()

	for _, backend_id in pairs(self._craft_items) do
		item_grid:lock_item_by_id(backend_id, true)
	end

	item_grid:update_items_status()

	self._num_craft_items = 0

	self:_set_craft_button_disabled(true)

	self._craft_result = nil

	self:setup_recipe_requirements()
end

CraftPageCraftItem._update_craft_items = function (self)
	local super_parent = self.super_parent
	local item_grid = self._item_grid
	local is_dragging_craft_item = item_grid:is_dragging_item() or item_grid:is_item_dragged() ~= nil
	local pressed_backend_id, is_drag_item = super_parent:get_pressed_item_backend_id()

	if pressed_backend_id then
		if is_drag_item then
			if not is_dragging_craft_item then
				local slot_index = item_grid:is_slot_hovered()

				if slot_index then
					self:_add_craft_item(pressed_backend_id, slot_index)
					self:setup_recipe_requirements()
				end
			end
		else
			self:_add_craft_item(pressed_backend_id)
			self:setup_recipe_requirements()
		end
	end

	local grid_item_pressed = item_grid:is_item_pressed()

	if grid_item_pressed then
		local backend_id = grid_item_pressed.backend_id

		self:_remove_craft_item(backend_id)
	end
end

CraftPageCraftItem._remove_craft_item = function (self, backend_id, slot_index)
	local craft_items = self._craft_items

	if slot_index then
		if craft_items[slot_index] then
			backend_id = craft_items[slot_index]
		end
	else
		for item_slot_index, slot_item_backend_id in pairs(craft_items) do
			if slot_item_backend_id == backend_id then
				slot_index = item_slot_index

				break
			end
		end
	end

	if backend_id and slot_index then
		self.super_parent:set_disabled_backend_id(backend_id, false)
		self._item_grid:add_item_to_slot_index(slot_index, nil)

		craft_items[slot_index] = nil
		self._num_craft_items = math.max((self._num_craft_items or 0) - 1, 0)

		self:_play_sound("play_gui_craft_item_drag")
		self:setup_recipe_requirements()

		self._widgets_by_name.item_grid_random_icon.content.visible = true
	end
end

CraftPageCraftItem._add_craft_item = function (self, backend_id, slot_index, ignore_sound)
	if self._num_craft_items == 0 then
		self._item_grid:clear_item_grid()
		table.clear(self._craft_items)
	end

	local craft_items = self._craft_items

	if not slot_index then
		for i = 1, NUM_CRAFT_SLOTS, 1 do
			if not craft_items[i] then
				slot_index = i

				break
			end
		end
	end

	if slot_index then
		craft_items[slot_index] = backend_id
		local item_interface = Managers.backend:get_interface("items")
		local item = backend_id and item_interface:get_item_from_id(backend_id)

		self._item_grid:add_item_to_slot_index(slot_index, item)
		self.super_parent:set_disabled_backend_id(backend_id, true)

		self._num_craft_items = math.min((self._num_craft_items or 0) + 1, NUM_CRAFT_SLOTS)

		if backend_id and not ignore_sound then
			self:_play_sound("play_gui_craft_item_drop")
		end

		self._widgets_by_name.item_grid_random_icon.content.visible = false
	end
end

CraftPageCraftItem._set_craft_button_disabled = function (self, disabled)
	self._widgets_by_name.craft_button.content.button_hotspot.disable_button = disabled

	self.parent:set_input_description((not disabled and self.settings.name) or nil)
end

CraftPageCraftItem._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level
end

CraftPageCraftItem.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.super_parent:window_input_service()

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	UIRenderer.end_pass(ui_top_renderer)
end

CraftPageCraftItem._play_sound = function (self, event)
	self.super_parent:play_sound(event)
end

CraftPageCraftItem._set_craft_button_text = function (self, text, localize)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.craft_button
	widget.content.button_text = (localize and Localize(text)) or text
end

return

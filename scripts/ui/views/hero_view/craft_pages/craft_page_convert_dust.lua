-- chunkname: @scripts/ui/views/hero_view/craft_pages/craft_page_convert_dust.lua

require("scripts/ui/views/menu_world_previewer")

local crafting_recipes, crafting_recipes_by_name, crafting_recipes_lookup = dofile("scripts/settings/crafting/crafting_recipes")
local definitions = local_require("scripts/ui/views/hero_view/craft_pages/definitions/craft_page_convert_dust_definitions")
local widget_definitions = definitions.widgets
local category_settings = definitions.category_settings
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local DO_RELOAD = false
local NUM_CRAFT_SLOTS = 1

CraftPageConvertDust = class(CraftPageConvertDust)
CraftPageConvertDust.NAME = "CraftPageConvertDust"

CraftPageConvertDust.on_enter = function (self, params, settings)
	print("[HeroWindowCraft] Enter Substate CraftPageConvertDust")

	self.parent = params.parent
	self.super_parent = self.parent.parent

	local ingame_ui_context = params.ingame_ui_context

	self.ingame_ui_context = ingame_ui_context
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.statistics_db = ingame_ui_context.statistics_db
	self.render_settings = {
		snap_pixel_positions = true,
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
	self._recipe_name = settings.name
	self._animations = {}

	self:create_ui_elements(params)

	self._craft_items = {}
	self._item_grid = ItemGridUI:new(category_settings, self._widgets_by_name.item_grid, self.hero_name, self.career_index)

	self._item_grid:disable_locked_items(true)
	self._item_grid:mark_locked_items(true)
	self._item_grid:hide_slots(true)
	self._item_grid:disable_item_drag()
	self.super_parent:clear_disabled_backend_ids()
	self:setup_recipe_requirements()
end

CraftPageConvertDust._has_required_item_amount = function (self, backend_id)
	local recipe_name = self:_get_recipe_by_backend_id(backend_id)
	local recipe = crafting_recipes_by_name[recipe_name]
	local recipe_item_filter = recipe.item_filter
	local ingredients = recipe.ingredients
	local item_interface = Managers.backend:get_interface("items")
	local crafting_material_items = item_interface:get_filtered_items(recipe_item_filter)
	local amount_owned = item_interface:get_item_amount(backend_id)
	local item = item_interface:get_item_from_id(backend_id)

	for index, data in ipairs(ingredients) do
		if not data.catergory then
			local item_key = data.name
			local required_amount = data.amount

			if item.key == item_key then
				return required_amount <= amount_owned
			end
		end
	end

	return false
end

CraftPageConvertDust._get_recipe_by_backend_id = function (self, backend_id)
	local item_interface = Managers.backend:get_interface("items")
	local item_key = item_interface:get_key(backend_id)
	local recipe_name

	if item_key == "crafting_material_dust_2" then
		recipe_name = "convert_blue_dust"
	elseif item_key == "crafting_material_dust_3" then
		recipe_name = "convert_orange_dust"
	end

	return recipe_name
end

CraftPageConvertDust.setup_recipe_requirements = function (self)
	local settings = self.settings
	local recipe_name
	local item_filter = settings.item_filter
	local added_backend_id = self._craft_items[1]

	if added_backend_id then
		recipe_name = self:_get_recipe_by_backend_id(added_backend_id)
	end

	self._recipe_name = recipe_name or settings.name

	local has_all_requirements = true

	if not recipe_name then
		has_all_requirements = false

		self:reset_requirements(0)
	else
		local recipe = crafting_recipes_by_name[recipe_name]
		local recipe_item_filter = recipe.item_filter
		local ingredients = recipe.ingredients
		local presentation_ingredients = recipe.presentation_ingredients
		local num_required_ingredients = 0

		for index, data in ipairs(presentation_ingredients) do
			if not data.catergory then
				num_required_ingredients = num_required_ingredients + 1
			end
		end

		self:reset_requirements(num_required_ingredients)

		for index, data in ipairs(presentation_ingredients) do
			local item_key = data.name
			local required_amount = data.amount
			local presentation_amount = tostring(required_amount)

			self:_add_crafting_material_requirement(index, item_key, presentation_amount, true)
		end

		local item_interface = Managers.backend:get_interface("items")
		local crafting_material_items = item_interface:get_filtered_items(recipe_item_filter)

		for index, data in ipairs(ingredients) do
			if not data.catergory then
				local item_key = data.name
				local required_amount = data.amount
				local amount_owned = 0
				local required_backend_id

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

				if not has_required_amount then
					has_all_requirements = false
				end
			end
		end
	end

	self._has_all_requirements = added_backend_id and has_all_requirements

	if self._has_all_requirements then
		self:_set_craft_button_disabled(false)
	else
		self:_set_craft_button_disabled(true)
	end
end

CraftPageConvertDust.reset_requirements = function (self, num_required_ingredients)
	local widgets_by_name = self._widgets_by_name
	local widget_width = 60
	local spacing = 94
	local start_position_x = -((widget_width + spacing) * (num_required_ingredients - 1)) / 2

	for i = 1, 2 do
		local widget = widgets_by_name["material_text_" .. i]
		local visible = i <= num_required_ingredients

		widget.content.visible = visible
		widget.content.draw_background = false

		if visible then
			local offset = widget.offset

			offset[1] = start_position_x
			start_position_x = start_position_x + widget_width + spacing
		end
	end
end

CraftPageConvertDust._add_crafting_material_requirement = function (self, index, item_key, amount_text, has_required_amount)
	local material_textures = UISettings.crafting_material_icons_small
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name["material_text_" .. index]
	local content = widget.content
	local texture = material_textures[item_key]

	content.text = amount_text
	content.icon = texture
	content.warning = not has_required_amount
	content.item = {
		data = table.clone(ItemMasterList[item_key]),
	}
end

CraftPageConvertDust.create_ui_elements = function (self, params)
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

	self:_set_craft_button_disabled(true)
	self:_handle_craft_input_progress(0)
end

CraftPageConvertDust.on_exit = function (self, params)
	print("[HeroWindowCraft] Exit Substate CraftPageConvertDust")

	self.ui_animator = nil

	if self._craft_input_time then
		self:_play_sound("play_gui_craft_forge_button_aborted")
	end
end

CraftPageConvertDust.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	self:_handle_input(dt, t)
	self:_update_animations(dt)
	self:_update_craft_items()
	self:draw(dt)
end

CraftPageConvertDust.post_update = function (self, dt, t)
	return
end

CraftPageConvertDust._update_animations = function (self, dt)
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

CraftPageConvertDust._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

CraftPageConvertDust._is_button_hovered = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_hover_enter then
		return true
	end
end

CraftPageConvertDust._is_button_held = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.is_clicked then
		return hotspot.is_clicked
	end
end

CraftPageConvertDust._handle_input = function (self, dt, t)
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

		local max_time = UISettings.crafting_progress_time
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
		local items = {}

		for _, backend_id in ipairs(craft_items) do
			items[#items + 1] = backend_id
		end

		local recipe_available = parent:craft(items, self._recipe_name)

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

CraftPageConvertDust._handle_craft_input_progress = function (self, progress)
	local has_progress = progress ~= 0
	local bard_default_width = scenegraph_definition.craft_bar.size[1]

	self.ui_scenegraph.craft_bar.size[1] = bard_default_width * progress

	if progress == 1 then
		return true
	end
end

CraftPageConvertDust.craft_result = function (self, result, error, reset_slots)
	if not error then
		self._craft_result = result
	end
end

CraftPageConvertDust.reset = function (self)
	local item_grid = self._item_grid

	item_grid:clear_locked_items()
	item_grid:update_items_status()
end

CraftPageConvertDust.on_craft_completed = function (self)
	local result = self._craft_result
	local item_grid = self._item_grid

	self.super_parent:clear_disabled_backend_ids()
	self.super_parent:update_inventory_items()

	local add_item = false

	self._num_craft_items = 0

	local craft_item_backend_id = self._craft_items[1]
	local item_interface = Managers.backend:get_interface("items")

	if item_interface:get_item_from_id(craft_item_backend_id) then
		add_item = true
	end

	if add_item then
		local ignore_sound = true

		self:_add_craft_item(craft_item_backend_id, 1, ignore_sound)
	else
		item_grid:clear_item_grid()
		table.clear(self._craft_items)
	end

	item_grid:clear_locked_items()

	for _, backend_id in pairs(self._craft_items) do
		item_grid:lock_item_by_id(backend_id, true)
	end

	item_grid:update_items_status()
	self:_set_craft_button_disabled(true)

	self._craft_result = nil

	self:setup_recipe_requirements()
end

CraftPageConvertDust._update_craft_items = function (self)
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

CraftPageConvertDust._remove_craft_item = function (self, backend_id, slot_index)
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

		if self._num_craft_items == 0 then
			self:_set_craft_button_disabled(true)
		end

		self:_play_sound("play_gui_craft_item_drag")
		self:setup_recipe_requirements()
	end
end

CraftPageConvertDust._add_craft_item = function (self, backend_id, slot_index, ignore_sound)
	if self._num_craft_items == 0 then
		self._item_grid:clear_item_grid()
		table.clear(self._craft_items)
	end

	local craft_items = self._craft_items

	if not slot_index then
		for i = 1, 1 do
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

		if item then
			item = table.clone(item)

			local has_required_amount = self:_has_required_item_amount(backend_id)

			item.insufficient_amount = not has_required_amount
		end

		self._item_grid:add_item_to_slot_index(slot_index, item)
		self.super_parent:set_disabled_backend_id(backend_id, true)

		self._num_craft_items = math.min((self._num_craft_items or 0) + 1, NUM_CRAFT_SLOTS)

		if backend_id and not ignore_sound then
			self:_play_sound("play_gui_craft_item_drop")
		end
	end
end

CraftPageConvertDust._set_craft_button_disabled = function (self, disabled)
	self._widgets_by_name.craft_button.content.button_hotspot.disable_button = disabled
end

CraftPageConvertDust._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level
end

CraftPageConvertDust.draw = function (self, dt)
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

CraftPageConvertDust._play_sound = function (self, event)
	self.super_parent:play_sound(event)
end

CraftPageConvertDust._set_craft_button_text = function (self, text, localize)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.craft_button

	widget.content.button_text = localize and Localize(text) or text
end

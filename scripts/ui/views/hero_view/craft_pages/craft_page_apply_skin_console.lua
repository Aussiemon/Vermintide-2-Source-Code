-- chunkname: @scripts/ui/views/hero_view/craft_pages/craft_page_apply_skin_console.lua

require("scripts/ui/views/menu_world_previewer")

local crafting_recipes, crafting_recipes_by_name, crafting_recipes_lookup = dofile("scripts/settings/crafting/crafting_recipes")
local definitions = local_require("scripts/ui/views/hero_view/craft_pages/definitions/craft_page_apply_skin_console_definitions")
local widget_definitions = definitions.widgets
local category_settings = definitions.category_settings
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local DO_RELOAD = false
local NUM_CRAFT_SLOTS = 1

CraftPageApplySkinConsole = class(CraftPageApplySkinConsole)
CraftPageApplySkinConsole.NAME = "CraftPageApplySkinConsole"

CraftPageApplySkinConsole.on_enter = function (self, params, settings)
	print("[HeroWindowCraft] Enter Substate CraftPageApplySkinConsole")

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

	local hero_data = SPProfiles[self.profile_index]
	local career_data = hero_data.careers[self.career_index]

	self.career_name = career_data.name
	self.settings = settings
	self._recipe_name = settings.name
	self._animations = {}

	self:create_ui_elements(params)

	self._material_items = {}
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
	self:_weapon_slot_updated()
	self:setup_recipe_requirements()
end

CraftPageApplySkinConsole.setup_recipe_requirements = function (self)
	local settings = self.settings
	local recipe_name = settings.name
	local recipe = crafting_recipes_by_name[recipe_name]
	local ingredients = recipe.ingredients
	local ingredients = recipe.ingredients
	local num_required_ingredients = 0

	for index, data in ipairs(ingredients) do
		if not data.catergory then
			num_required_ingredients = num_required_ingredients + 1
		end
	end

	self:reset_requirements(num_required_ingredients)

	local material_items = self._material_items

	table.clear(material_items)

	local item_interface = Managers.backend:get_interface("items")
	local crafting_material_items = item_interface:get_filtered_items("item_type == crafting_material")
	local has_all_requirements = true
	local requirement_index = 1

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
			local presentation_amount = (amount_owned < UISettings.max_craft_material_presentation_amount and tostring(amount_owned) or "*") .. "/" .. tostring(required_amount)

			self:_add_crafting_material_requirement(requirement_index, item_key, presentation_amount, has_required_amount)

			requirement_index = requirement_index + 1

			if has_required_amount then
				material_items[#material_items + 1] = required_backend_id
			else
				has_all_requirements = false
			end
		end
	end

	self._has_all_requirements = has_all_requirements
end

CraftPageApplySkinConsole.reset_requirements = function (self, num_required_ingredients)
	local widgets_by_name = self._widgets_by_name
	local widget_width = 60
	local spacing = 10
	local start_position_x = -((widget_width + spacing) * (num_required_ingredients - 1)) / 2
	local num_crafting_materials = #UISettings.crafting_material_order

	for i = 1, num_crafting_materials do
		local widget = widgets_by_name["material_text_" .. i]
		local visible = i <= num_required_ingredients

		widget.content.visible = visible

		if visible then
			local offset = widget.offset

			offset[1] = start_position_x
			start_position_x = start_position_x + widget_width + spacing
		end
	end
end

CraftPageApplySkinConsole.create_ui_elements = function (self, params)
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

CraftPageApplySkinConsole._weapon_slot_updated = function (self)
	local item_interface = Managers.backend:get_interface("items")
	local added_backend_id = self._craft_item
	local item_data = added_backend_id and item_interface:get_item_masterlist_data(added_backend_id)
	local added_item_slot_type = item_data and item_data.slot_type

	if item_data then
		local weapon_skin_name = item_data.key .. "_skin"
		local item_filter = "item_key == " .. weapon_skin_name

		self.parent.parent:set_craft_optional_item_filter(item_filter)
		self.parent.parent:disable_filter(true)
		self.parent.parent:disable_search(true)
	else
		self.parent.parent:set_craft_optional_item_filter(nil)
		self.parent.parent:disable_filter(false)
		self.parent.parent:disable_search(false)
	end
end

CraftPageApplySkinConsole.on_exit = function (self, params)
	self.parent.parent:set_craft_optional_item_filter(nil)
	self.parent.parent:disable_filter(false)
	self.parent.parent:disable_search(false)
	print("[HeroWindowCraft] Exit Substate CraftPageApplySkinConsole")

	self.ui_animator = nil

	if self._craft_input_time then
		self:_play_sound("play_gui_craft_forge_button_aborted")
	end
end

CraftPageApplySkinConsole.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	self:_handle_input(dt, t)
	self:_update_animations(dt)
	self:_update_craft_items()
	self:draw(dt)
end

CraftPageApplySkinConsole.post_update = function (self, dt, t)
	return
end

CraftPageApplySkinConsole._update_animations = function (self, dt)
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

CraftPageApplySkinConsole._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

CraftPageApplySkinConsole._is_button_hovered = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_hover_enter then
		return true
	end
end

CraftPageApplySkinConsole._is_button_held = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.is_clicked then
		return hotspot.is_clicked
	end
end

CraftPageApplySkinConsole._handle_input = function (self, dt, t)
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
	local craft_input_keyboard = is_button_enabled and not gamepad_active and input_service:get("skip")
	local craft_input_accepted = false

	if input_service:get("special_1") or self._craft_item and input_service:get("toggle_menu", true) then
		self:reset()
	elseif (craft_input == 0 or craft_input_gamepad or craft_input_keyboard) and self._craft_item and self._skin_item and self._has_all_requirements then
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
		local craft_item = self._craft_item
		local skin_item = self._skin_item
		local items = {
			craft_item,
			skin_item,
		}
		local material_items = self._material_items

		for _, backend_id in ipairs(material_items) do
			items[#items + 1] = backend_id
		end

		local recipe_available = parent:craft(items, self._recipe_name)

		if recipe_available then
			self:_set_craft_button_disabled(true)
			self._item_grid:lock_item_by_id(craft_item, true)
			self._item_grid:update_items_status()
			self._item_grid_2:lock_item_by_id(skin_item, true)
			self._item_grid_2:update_items_status()
			self:_play_sound("play_gui_craft_forge_button_completed")
			self:_play_sound("play_gui_craft_forge_begin")
		end
	end
end

CraftPageApplySkinConsole._handle_craft_input_progress = function (self, progress)
	return self.parent:_set_input_progress(progress)
end

CraftPageApplySkinConsole.craft_result = function (self, result, error, reset_slots)
	if not error then
		self._craft_result = result
	end
end

CraftPageApplySkinConsole.reset = function (self)
	local item_grid = self._item_grid
	local item_grid_2 = self._item_grid_2

	if self._craft_item then
		self:_remove_item(item_grid, self._craft_item)

		self._craft_item = nil
	end

	if self._skin_item then
		self:_remove_item(item_grid_2, self._skin_item)

		self._skin_item = nil
	end

	item_grid:clear_locked_items()
	item_grid:update_items_status()
	item_grid_2:clear_locked_items()
	item_grid_2:update_items_status()
	self:_weapon_slot_updated()
end

CraftPageApplySkinConsole.present_results = function (self)
	self.super_parent:clear_disabled_backend_ids()
	self.super_parent:update_inventory_items()
	self:_weapon_slot_updated()
	self:setup_recipe_requirements()
end

CraftPageApplySkinConsole.on_craft_completed = function (self)
	local item_grid = self._item_grid
	local item_grid_2 = self._item_grid_2
	local craft_item_backend_id = self._craft_item
	local item_interface = Managers.backend:get_interface("items")
	local item = item_interface:get_item_from_id(craft_item_backend_id)

	self.parent:set_reward_tooltip_item(item)

	if self._craft_item then
		self:_remove_item(item_grid, self._craft_item)

		self._craft_item = nil
	end

	if self._skin_item then
		self:_remove_item(item_grid_2, self._skin_item)

		self._skin_item = nil
	end

	self._craft_result = nil

	if craft_item_backend_id and ItemHelper.is_equiped_backend_id(craft_item_backend_id, self.career_name) then
		local item_interface = Managers.backend:get_interface("items")
		local craft_item = item_interface:get_item_from_id(craft_item_backend_id)
		local equipped_slots, num_slots = ItemHelper.get_equipped_slots(craft_item_backend_id, self.career_name)

		for i = 1, num_slots do
			self.super_parent:_set_loadout_item(craft_item, equipped_slots[i])
		end

		local item_data = craft_item.data
		local slot_type = item_data.slot_type

		if slot_type == "skin" then
			self.super_parent:update_skin_sync()
		end
	end
end

CraftPageApplySkinConsole._update_craft_items = function (self)
	local super_parent = self.super_parent
	local item_grid = self._item_grid
	local item_grid_2 = self._item_grid_2
	local pressed_backend_id, is_drag_item = super_parent:get_pressed_item_backend_id()

	if pressed_backend_id then
		if not self._craft_item then
			self:_add_item(item_grid, pressed_backend_id)

			self._craft_item = pressed_backend_id

			self:_weapon_slot_updated()
		else
			if self._skin_item then
				self.super_parent:set_disabled_backend_id(self._skin_item, false)
			end

			local add_item = true

			if self._skin_item == pressed_backend_id then
				self:_remove_item(item_grid_2, pressed_backend_id)

				self._skin_item = nil
				add_item = false
			end

			if add_item then
				self:_add_item(item_grid_2, pressed_backend_id)

				self._skin_item = pressed_backend_id
			end

			self:_weapon_slot_updated()

			if self._has_all_requirements then
				self:_set_craft_button_disabled(false)
			end
		end
	end

	local weapon_grid_item_pressed = item_grid:is_item_pressed()

	if weapon_grid_item_pressed then
		local backend_id = weapon_grid_item_pressed.backend_id

		self:_remove_item(item_grid, backend_id)

		self._craft_item = nil

		if self._skin_item then
			self:_remove_item(item_grid_2, self._skin_item)

			self._skin_item = nil
		end

		self:_weapon_slot_updated()
		self:_set_craft_button_disabled(true)
	end

	local skin_grid_item_pressed = item_grid_2:is_item_pressed()

	if skin_grid_item_pressed then
		local backend_id = skin_grid_item_pressed.backend_id

		self:_remove_item(item_grid_2, backend_id)

		self._skin_item = nil

		self:_weapon_slot_updated()
		self:_set_craft_button_disabled(true)
	end
end

CraftPageApplySkinConsole._remove_item = function (self, item_grid, backend_id)
	self.super_parent:set_disabled_backend_id(backend_id, false)
	item_grid:add_item_to_slot_index(1, nil)
	self:_set_craft_button_disabled(true)
	self:_play_sound("play_gui_craft_item_drag")
end

CraftPageApplySkinConsole._add_item = function (self, item_grid, backend_id, ignore_sound)
	item_grid:clear_item_grid()

	local slot_index = 1

	if slot_index then
		local item_interface = Managers.backend:get_interface("items")
		local item = backend_id and item_interface:get_item_from_id(backend_id)

		item_grid:add_item_to_slot_index(slot_index, item)
		self.super_parent:set_disabled_backend_id(backend_id, true)

		if backend_id and not ignore_sound then
			self:_play_sound("play_gui_craft_item_drop")
		end
	end
end

CraftPageApplySkinConsole._set_craft_button_disabled = function (self, disabled)
	self._widgets_by_name.craft_button.content.button_hotspot.disable_button = disabled

	self.parent:set_input_description(not disabled and self.settings.name or "disabled")
end

CraftPageApplySkinConsole._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level
end

CraftPageApplySkinConsole.draw = function (self, dt)
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

CraftPageApplySkinConsole._play_sound = function (self, event)
	self.super_parent:play_sound(event)
end

CraftPageApplySkinConsole._set_craft_button_text = function (self, text, localize)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.craft_button

	widget.content.button_text = localize and Localize(text) or text
end

CraftPageApplySkinConsole._add_crafting_material_requirement = function (self, index, item_key, amount_text, has_required_amount)
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

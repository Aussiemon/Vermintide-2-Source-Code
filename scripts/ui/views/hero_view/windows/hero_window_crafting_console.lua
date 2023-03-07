require("scripts/ui/views/hero_view/craft_pages/craft_page_salvage_console")
require("scripts/ui/views/hero_view/craft_pages/craft_page_roll_trait_console")
require("scripts/ui/views/hero_view/craft_pages/craft_page_roll_properties_console")
require("scripts/ui/views/hero_view/craft_pages/craft_page_craft_item_console")
require("scripts/ui/views/hero_view/craft_pages/craft_page_apply_skin_console")
require("scripts/ui/views/hero_view/craft_pages/craft_page_upgrade_item_console")
require("scripts/ui/views/hero_view/craft_pages/craft_page_convert_dust_console")

local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_crafting_console_definitions")
local crafting_recipes, crafting_recipes_by_name, crafting_recipes_lookup = dofile("scripts/settings/crafting/crafting_recipes")
local widget_definitions = definitions.widgets
local category_settings = definitions.category_settings
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local generic_input_actions = definitions.generic_input_actions
local input_actions = definitions.input_actions
local DO_RELOAD = false
local page_settings = {
	{
		sound_event_enter = "play_gui_equipment_button",
		name = "salvage",
		class_name = "CraftPageSalvageConsole",
		sound_event_exit = "play_gui_equipment_close"
	},
	{
		sound_event_enter = "play_gui_equipment_button",
		name = "craft_random_item",
		class_name = "CraftPageCraftItemConsole",
		sound_event_exit = "play_gui_equipment_close"
	},
	{
		sound_event_enter = "play_gui_equipment_button",
		name = "reroll_weapon_properties",
		class_name = "CraftPageRollPropertiesConsole",
		sound_event_exit = "play_gui_equipment_close"
	},
	{
		sound_event_enter = "play_gui_equipment_button",
		name = "reroll_weapon_traits",
		class_name = "CraftPageRollTraitConsole",
		sound_event_exit = "play_gui_equipment_close"
	},
	{
		sound_event_enter = "play_gui_equipment_button",
		name = "upgrade_item_rarity_common",
		class_name = "CraftPageUpgradeItemConsole",
		sound_event_exit = "play_gui_equipment_close"
	},
	{
		sound_event_enter = "play_gui_equipment_button",
		name = "apply_weapon_skin",
		class_name = "CraftPageApplySkinConsole",
		sound_event_exit = "play_gui_equipment_close"
	},
	{
		sound_event_enter = "play_gui_equipment_button",
		name = "convert_blue_dust",
		class_name = "CraftPageConvertDustConsole",
		sound_event_exit = "play_gui_equipment_close"
	}
}
HeroWindowCraftingConsole = class(HeroWindowCraftingConsole)
HeroWindowCraftingConsole.NAME = "HeroWindowCraftingConsole"

HeroWindowCraftingConsole.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate HeroWindowCraftingConsole")

	self.parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.statistics_db = ingame_ui_context.statistics_db
	self.render_settings = {
		snap_pixel_positions = true
	}
	self.crafting_manager = Managers.state.crafting
	self.wwise_world = params.wwise_world
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	self._stats_id = local_player:stats_id()
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self._animations = {}

	self:create_ui_elements(params, offset)
	self:_set_crafting_glow_progress(0)

	self.hero_name = params.hero_name
	self.career_index = params.career_index
	self.profile_index = params.profile_index
	self._page_params = {
		wwise_world = self.wwise_world,
		ingame_ui_context = ingame_ui_context,
		parent = self,
		hero_name = self.hero_name,
		career_index = self.career_index,
		profile_index = self.profile_index
	}
	self.unblocked_services = {}
	self.unblocked_services_n = 0
	local recipe_index = params.recipe_index or 1

	self:_change_recipe_page(recipe_index)
	self:_start_transition_animation("on_enter")
	self:_start_transition_animation("reset_crafting")
end

HeroWindowCraftingConsole._start_transition_animation = function (self, animation_name)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings
	}
	local widgets = self._widgets_by_name
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[animation_name] = anim_id
end

HeroWindowCraftingConsole.create_ui_elements = function (self, params, offset)
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
	local input_service = Managers.input:get_service("hero_view")
	local gui_layer = UILayer.default + 30
	self._menu_input_description = MenuInputDescriptionUI:new(nil, self.ui_top_renderer, input_service, 7, gui_layer, generic_input_actions.default, true)

	self._menu_input_description:set_input_description(nil)
	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self.ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end
end

HeroWindowCraftingConsole.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate HeroWindowCraftingConsole")

	self.ui_animator = nil

	if self._active_page then
		local params = self._page_params

		self._active_page:on_exit(params)
	end
end

HeroWindowCraftingConsole.set_input_description = function (self, input_desc_name)
	if not input_desc_name or input_actions[input_desc_name] then
		self._menu_input_description:set_input_description(input_desc_name and input_actions[input_desc_name])
	else
		Application.warning("[HeroWindowCraftingConsole:set_input_description] Could not set input desc: " .. tostring(input_desc_name))
	end
end

HeroWindowCraftingConsole.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	local craft_id = self._current_craft_id
	local animations = self._animations

	if craft_id then
		local crafting_interface = Managers.backend:get_interface("crafting")
		local craft_complete = crafting_interface:is_craft_complete(craft_id)

		if craft_complete then
			local craft_result = crafting_interface:get_craft_result(craft_id)

			self:craft_complete(craft_result)

			self._current_craft_id = nil
		end
	end

	if self._can_start_craft_exit_animation and not animations.craft_enter then
		self:_start_transition_animation("craft_exit")

		self._can_start_craft_exit_animation = nil

		if self._active_page then
			self._active_page:on_craft_completed()
		end
	end

	if self._active_page then
		self._active_page:update(dt, t)
	end

	self:_update_animations(dt)
	self:_handle_input(dt, t)
	self:draw(dt)
end

HeroWindowCraftingConsole.post_update = function (self, dt, t)
	if self._active_page and self._active_page.post_update then
		self._active_page:post_update(dt, t)
	end
end

HeroWindowCraftingConsole._update_animations = function (self, dt)
	self.ui_animator:update(dt)

	local animations = self._animations
	local ui_animator = self.ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil

			if animation_name == "craft_exit" then
				self:on_craft_ended()
			end
		end
	end
end

HeroWindowCraftingConsole._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

HeroWindowCraftingConsole._is_button_hovered = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_hover_enter then
		return true
	end
end

HeroWindowCraftingConsole._is_button_held = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.is_clicked then
		return hotspot.is_clicked
	end
end

HeroWindowCraftingConsole.set_focus = function (self, focused)
	self._focused = focused
end

HeroWindowCraftingConsole._handle_input = function (self, dt, t)
	local input_service = self.parent:window_input_service()

	if input_service:get("back") then
		self.parent:set_layout_by_name("forge")
	end

	self:_handle_tooltip_skip_input(input_service)
end

HeroWindowCraftingConsole._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level
end

HeroWindowCraftingConsole.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()
	local gamepad_active = Managers.input:is_device_active("gamepad")

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	local active_node_widgets = self._active_node_widgets

	if active_node_widgets then
		for _, widget in ipairs(active_node_widgets) do
			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_top_renderer)

	if gamepad_active then
		self._menu_input_description:draw(ui_top_renderer, dt)
	end
end

HeroWindowCraftingConsole._play_sound = function (self, event)
	self.parent:play_sound(event)
end

HeroWindowCraftingConsole._change_recipe_page = function (self, current_page)
	local total_pages = #page_settings
	local current_page_settings = page_settings[current_page]
	local page_name = current_page_settings.name
	local recipe = crafting_recipes_by_name[page_name]
	local ingredients = recipe.ingredients
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.title_text.content.text = Localize(recipe.display_name)
	widgets_by_name.description_text.content.text = Localize(recipe.description_text)

	if current_page ~= self._current_page or total_pages ~= self._total_pages then
		self._total_pages = total_pages
		self._current_page = current_page
		current_page = current_page or 1

		self:_set_page_index(current_page)
	end

	self._selected_page_index = current_page
end

HeroWindowCraftingConsole.window_input_service = function (self)
	return
end

HeroWindowCraftingConsole._set_page_index = function (self, page_index)
	local active_page = self._active_page
	local params = self._page_params
	local new_page_settings = page_settings[page_index]
	local page_name = new_page_settings.name
	local page_class_name = new_page_settings.class_name

	if active_page then
		if active_page.NAME == page_class_name then
			return
		end

		if active_page.on_exit then
			active_page:on_exit(params)
		end
	end

	local page_class = rawget(_G, page_class_name)
	local page = page_class:new()

	self.parent:set_selected_craft_page(page_name)

	if page.on_enter then
		page:on_enter(params, new_page_settings)
	end

	self._active_page = page
end

HeroWindowCraftingConsole._set_crafting_glow_progress = function (self, progress)
	local widgets_by_name = self._widgets_by_name
	local crafting_glow = widgets_by_name.crafting_glow
	local style = crafting_glow.style.texture_id
	style.color[1] = 255 * progress
end

HeroWindowCraftingConsole.on_craft_ended = function (self)
	local active_page = self._active_page

	if active_page and active_page.present_results then
		active_page:present_results()
	end

	self:unlock_input()
end

HeroWindowCraftingConsole.craft = function (self, items, recipe_override)
	local craft_id = self.crafting_manager:craft(items, recipe_override)

	if craft_id then
		self._waiting_for_craft = true

		self:_start_transition_animation("craft_enter")
		self:lock_input()

		self._current_craft_id = craft_id

		return true
	end

	return false
end

HeroWindowCraftingConsole.craft_complete = function (self, result)
	self._waiting_for_craft = false
	self._can_start_craft_exit_animation = true

	if self._active_page then
		self._active_page:craft_result(result)
	end
end

HeroWindowCraftingConsole.waiting_for_craft = function (self)
	return self._waiting_for_craft
end

HeroWindowCraftingConsole.lock_input = function (self)
	local input_manager = self.input_manager

	self:unlock_input(true)

	self.unblocked_services_n = input_manager:get_unblocked_services(nil, nil, self.unblocked_services)

	input_manager:device_block_services("keyboard", 1, self.unblocked_services, self.unblocked_services_n, "crafting")
	input_manager:device_block_services("gamepad", 1, self.unblocked_services, self.unblocked_services_n, "crafting")
	input_manager:device_block_services("mouse", 1, self.unblocked_services, self.unblocked_services_n, "crafting")
end

HeroWindowCraftingConsole.unlock_input = function (self)
	local input_manager = self.input_manager

	input_manager:device_unblock_services("keyboard", 1, self.unblocked_services, self.unblocked_services_n)
	input_manager:device_unblock_services("gamepad", 1, self.unblocked_services, self.unblocked_services_n)
	input_manager:device_unblock_services("mouse", 1, self.unblocked_services, self.unblocked_services_n)
	table.clear(self.unblocked_services)

	self.unblocked_services_n = 0
end

HeroWindowCraftingConsole._set_input_progress = function (self, progress)
	local starting_degrees = 43
	local degrees = 360 - starting_degrees * 2
	local alpha = 255 * math.min(progress * 2, 1)
	local current_degrees = starting_degrees + degrees * progress
	local degrees_progress = current_degrees / 360
	local angle = -math.degrees_to_radians(starting_degrees + degrees * progress)
	local widgets_by_name = self._widgets_by_name
	local craft_bar = widgets_by_name.craft_bar
	craft_bar.style.texture_id.gradient_threshold = degrees_progress
	craft_bar.style.texture_id.color[1] = 255

	if progress == 1 then
		return true
	end
end

HeroWindowCraftingConsole.set_reward_tooltip_item = function (self, item)
	local widget = self._widgets_by_name.item_tooltip
	widget.content.item = item
	self._tooltip_item_id = item
end

HeroWindowCraftingConsole.has_active_reward_tooltip = function (self)
	return self._tooltip_item_id
end

local item_tooltip_skip_inputs = {
	"confirm_press",
	"refresh_press",
	"special_1_press",
	"back_menu",
	"move_up",
	"move_down",
	"move_left",
	"move_right"
}

HeroWindowCraftingConsole._handle_tooltip_skip_input = function (self, input_service)
	if self:has_active_reward_tooltip() then
		local input_made = false

		for _, input in ipairs(item_tooltip_skip_inputs) do
			if input_service:get(input) then
				input_made = true

				break
			end
		end

		if input_made then
			self:set_reward_tooltip_item(nil)
		end
	end
end

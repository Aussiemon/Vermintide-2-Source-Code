require("scripts/ui/views/hero_view/craft_pages/craft_page_salvage")
require("scripts/ui/views/hero_view/craft_pages/craft_page_roll_trait")
require("scripts/ui/views/hero_view/craft_pages/craft_page_roll_properties")
require("scripts/ui/views/hero_view/craft_pages/craft_page_craft_item")
require("scripts/ui/views/hero_view/craft_pages/craft_page_apply_skin")
require("scripts/ui/views/hero_view/craft_pages/craft_page_extract_skin")
require("scripts/ui/views/hero_view/craft_pages/craft_page_upgrade_item")
require("scripts/ui/views/hero_view/craft_pages/craft_page_convert_dust")

local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_crafting_definitions")
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
		class_name = "CraftPageSalvage",
		sound_event_exit = "play_gui_equipment_close"
	},
	{
		sound_event_enter = "play_gui_equipment_button",
		name = "craft_random_item",
		class_name = "CraftPageCraftItem",
		sound_event_exit = "play_gui_equipment_close"
	},
	{
		sound_event_enter = "play_gui_equipment_button",
		name = "reroll_weapon_properties",
		class_name = "CraftPageRollProperties",
		sound_event_exit = "play_gui_equipment_close"
	},
	{
		sound_event_enter = "play_gui_equipment_button",
		name = "reroll_weapon_traits",
		class_name = "CraftPageRollTrait",
		sound_event_exit = "play_gui_equipment_close"
	},
	{
		sound_event_enter = "play_gui_equipment_button",
		name = "upgrade_item_rarity_common",
		class_name = "CraftPageUpgradeItem",
		sound_event_exit = "play_gui_equipment_close"
	},
	{
		sound_event_enter = "play_gui_equipment_button",
		name = "extract_weapon_skin",
		class_name = "CraftPageExtractSkin",
		sound_event_exit = "play_gui_equipment_close"
	},
	{
		sound_event_enter = "play_gui_equipment_button",
		name = "apply_weapon_skin",
		class_name = "CraftPageApplySkin",
		sound_event_exit = "play_gui_equipment_close"
	},
	{
		sound_event_enter = "play_gui_equipment_button",
		name = "convert_blue_dust",
		class_name = "CraftPageConvertDust",
		sound_event_exit = "play_gui_equipment_close"
	}
}
HeroWindowCrafting = class(HeroWindowCrafting)
HeroWindowCrafting.NAME = "HeroWindowCrafting"

HeroWindowCrafting.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate HeroWindowCrafting")

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
	self:_set_crafting_fg_progress(0)

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

	self:_change_recipe_page(1)
end

HeroWindowCrafting.create_ui_elements = function (self, params, offset)
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
	self._menu_input_description = MenuInputDescriptionUI:new(nil, self.ui_top_renderer, input_service, 5, gui_layer, generic_input_actions.default)

	self._menu_input_description:set_input_description(nil)
	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self.ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end

	self._widgets_by_name.crafting_fg_glow.style.texture_id.color[1] = 0
end

HeroWindowCrafting.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate HeroWindowCrafting")

	self.ui_animator = nil

	if self._active_page then
		local params = self._page_params

		self._active_page:on_exit(params)
	end
end

HeroWindowCrafting.set_input_description = function (self, input_desc_name)
	if not input_desc_name or input_actions[input_desc_name] then
		self._menu_input_description:set_input_description(input_desc_name and input_actions[input_desc_name])
	else
		Application.warning("[HeroWindowCrafting:set_input_description] Could not set input desc: " .. tostring(input_desc_name))
	end
end

HeroWindowCrafting.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	local craft_id = self._current_craft_id

	if craft_id then
		local crafting_interface = Managers.backend:get_interface("crafting")
		local craft_complete = crafting_interface:is_craft_complete(craft_id)

		if craft_complete then
			local craft_result = crafting_interface:get_craft_result(craft_id)

			self:craft_complete(craft_result)

			self._current_craft_id = nil
		end
	end

	if self._active_page then
		self._active_page:update(dt, t)
	end

	self:_update_craft_start_time(dt, t)
	self:_update_craft_end_time(dt, t)
	self:_update_craft_glow_wait_time(dt, t)
	self:_update_craft_glow_in_time(dt, t)
	self:_update_craft_glow_out_time(dt, t)
	self:_update_animations(dt)
	self:_handle_input(dt, t)
	self:draw(dt)
end

HeroWindowCrafting.post_update = function (self, dt, t)
	if self._active_page and self._active_page.post_update then
		self._active_page:post_update(dt, t)
	end
end

HeroWindowCrafting._update_animations = function (self, dt)
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

HeroWindowCrafting._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

HeroWindowCrafting._is_button_hovered = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_hover_enter then
		return true
	end
end

HeroWindowCrafting._is_button_held = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.is_clicked then
		return hotspot.is_clicked
	end
end

HeroWindowCrafting._handle_input = function (self, dt, t)
	local widgets_by_name = self._widgets_by_name
	local page_button_next = widgets_by_name.page_button_next
	local page_button_previous = widgets_by_name.page_button_previous

	UIWidgetUtils.animate_default_button(page_button_next, dt)
	UIWidgetUtils.animate_default_button(page_button_previous, dt)

	if self:_is_button_hovered(page_button_next) or self:_is_button_hovered(page_button_previous) then
		self:_play_sound("play_gui_inventory_next_hover")
	end

	local total_pages = self._total_pages
	local current_page = self._current_page

	if self:_is_button_pressed(page_button_next) then
		local next_page_index = current_page % total_pages + 1

		self:_change_recipe_page(next_page_index)
		self:_play_sound("play_gui_craft_recipe_next")
	elseif self:_is_button_pressed(page_button_previous) then
		local next_page_index = (current_page > 1 and current_page - 1) or total_pages

		self:_change_recipe_page(next_page_index)
		self:_play_sound("play_gui_craft_recipe_next")
	elseif Managers.input:is_device_active("gamepad") then
		local input_service = Managers.input:get_service("hero_view")
		local total_pages = #page_settings

		if input_service:get("cycle_next") then
			local next_page_index = current_page % total_pages + 1

			if total_pages >= next_page_index then
				self:_change_recipe_page(next_page_index)
				self:_play_sound("play_gui_craft_recipe_next")
			end
		elseif input_service:get("cycle_previous") then
			local next_page_index = (current_page > 1 and current_page - 1) or total_pages

			if next_page_index > 0 then
				self:_change_recipe_page(next_page_index)
				self:_play_sound("play_gui_craft_recipe_next")
			end
		end
	end
end

HeroWindowCrafting._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level
end

HeroWindowCrafting.draw = function (self, dt)
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

HeroWindowCrafting._play_sound = function (self, event)
	self.parent:play_sound(event)
end

HeroWindowCrafting._change_recipe_page = function (self, current_page)
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
		total_pages = total_pages or 1
		local widgets_by_name = self._widgets_by_name
		widgets_by_name.page_text_left.content.text = tostring(current_page)
		widgets_by_name.page_text_right.content.text = tostring(total_pages)

		self:_set_page_index(current_page)
	end

	self._selected_page_index = current_page
end

HeroWindowCrafting.window_input_service = function (self)
	return
end

HeroWindowCrafting._set_page_index = function (self, page_index)
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

HeroWindowCrafting._update_craft_start_time = function (self, dt, t)
	local craft_start_duration = self._craft_start_duration

	if not craft_start_duration then
		return
	end

	craft_start_duration = craft_start_duration + dt
	local animation_time = UISettings.crafting_animation_in_time
	local progress = math.min(craft_start_duration / animation_time, 1)
	local animation_progress = math.easeInCubic(progress)

	self:_set_crafting_fg_progress(animation_progress)

	if progress == 1 then
		self._craft_start_duration = nil
		self._craft_glow_in_duration = 0

		self:_play_sound("play_gui_craft_forge_fire_begin")
	else
		self._craft_start_duration = craft_start_duration
	end
end

HeroWindowCrafting._update_craft_glow_in_time = function (self, dt, t)
	local craft_glow_in_duration = self._craft_glow_in_duration

	if not craft_glow_in_duration then
		return
	end

	craft_glow_in_duration = craft_glow_in_duration + dt
	local animation_time = UISettings.crafting_animation_in_time
	local progress = math.min(craft_glow_in_duration / animation_time, 1)
	local animation_progress = math.easeInCubic(progress)
	local widget = self._widgets_by_name.crafting_fg_glow
	widget.style.texture_id.color[1] = animation_progress * 255

	if progress == 1 then
		self._craft_glow_in_duration = nil
		self._craft_glow_wait_duration = 0
	else
		self._craft_glow_in_duration = craft_glow_in_duration
	end
end

HeroWindowCrafting._update_craft_glow_wait_time = function (self, dt, t)
	local craft_glow_wait_duration = self._craft_glow_wait_duration

	if not craft_glow_wait_duration then
		return
	end

	craft_glow_wait_duration = craft_glow_wait_duration + dt
	local animation_wait_time = UISettings.crafting_animation_wait_time
	local progress = math.min(craft_glow_wait_duration / animation_wait_time, 1)
	local animation_progress = math.ease_pulse(1 - progress)

	if progress == 1 then
		self._craft_glow_wait_duration = nil
	else
		self._craft_glow_wait_duration = craft_glow_wait_duration
	end
end

HeroWindowCrafting._update_craft_glow_out_time = function (self, dt, t)
	local craft_glow_out_duration = self._craft_glow_out_duration

	if not craft_glow_out_duration or self._craft_glow_in_duration or self._craft_start_duration or self._craft_glow_wait_duration then
		return
	end

	craft_glow_out_duration = craft_glow_out_duration + dt
	local animation_time = UISettings.crafting_animation_out_time
	local progress = math.min(craft_glow_out_duration / animation_time, 1)
	local animation_progress = math.easeOutCubic(1 - progress)
	local widget = self._widgets_by_name.crafting_fg_glow
	widget.style.texture_id.color[1] = animation_progress * 255

	if progress == 1 then
		self._craft_end_duration = 0
		self._craft_glow_out_duration = nil

		self:_play_sound("play_gui_craft_forge_end")
	else
		if self._craft_glow_out_duration == 0 and self._active_page then
			self._active_page:on_craft_completed()
		end

		self._craft_glow_out_duration = craft_glow_out_duration
	end
end

HeroWindowCrafting._set_crafting_fg_progress = function (self, progress)
	local widgets_by_name = self._widgets_by_name
	local crafting_fg = widgets_by_name.crafting_fg
	local uvs = crafting_fg.content.texture_id.uvs
	local scenegraph_id = crafting_fg.scenegraph_id
	local ui_scenegraph = self.ui_scenegraph
	local current_size = ui_scenegraph[scenegraph_id].size
	local default_size = scenegraph_definition[scenegraph_id].size
	current_size[2] = default_size[2] * progress
	uvs[1][2] = 1 - progress
	uvs[2][2] = 1
end

HeroWindowCrafting._update_craft_end_time = function (self, dt, t)
	local craft_end_duration = self._craft_end_duration

	if not craft_end_duration then
		return
	end

	craft_end_duration = craft_end_duration + dt
	local progress = math.min(craft_end_duration / 0.8, 1)
	local animation_progress = math.easeCubic(1 - progress)

	self:_set_crafting_fg_progress(animation_progress)

	if progress == 1 then
		self._craft_end_duration = nil

		if self._active_page then
			self._active_page:reset()
		end

		self:unlock_input()
	else
		self._craft_end_duration = craft_end_duration
	end
end

HeroWindowCrafting.craft = function (self, items, recipe_override)
	local craft_id = self.crafting_manager:craft(items, recipe_override)

	if craft_id then
		self._waiting_for_craft = true
		self._craft_start_duration = 0

		self:lock_input()

		self._current_craft_id = craft_id

		return true
	end

	return false
end

HeroWindowCrafting.craft_complete = function (self, result)
	self._waiting_for_craft = false
	self._craft_glow_out_duration = 0

	if self._active_page then
		self._active_page:craft_result(result)
	end
end

HeroWindowCrafting.waiting_for_craft = function (self)
	return self._waiting_for_craft
end

HeroWindowCrafting.lock_input = function (self)
	local input_manager = self.input_manager

	self:unlock_input(true)

	self.unblocked_services_n = input_manager:get_unblocked_services(nil, nil, self.unblocked_services)

	input_manager:device_block_services("keyboard", 1, self.unblocked_services, self.unblocked_services_n, "crafting")
	input_manager:device_block_services("gamepad", 1, self.unblocked_services, self.unblocked_services_n, "crafting")
	input_manager:device_block_services("mouse", 1, self.unblocked_services, self.unblocked_services_n, "crafting")
end

HeroWindowCrafting.unlock_input = function (self)
	local input_manager = self.input_manager

	input_manager:device_unblock_services("keyboard", 1, self.unblocked_services, self.unblocked_services_n)
	input_manager:device_unblock_services("gamepad", 1, self.unblocked_services, self.unblocked_services_n)
	input_manager:device_unblock_services("mouse", 1, self.unblocked_services, self.unblocked_services_n)
	table.clear(self.unblocked_services)

	self.unblocked_services_n = 0
end

return

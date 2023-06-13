local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_crafting_list_console_definitions")
local crafting_recipes, crafting_recipes_by_name, crafting_recipes_lookup = dofile("scripts/settings/crafting/crafting_recipes")
local widget_definitions = definitions.widgets
local title_button_definitions = definitions.title_button_definitions
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local generic_input_actions = definitions.generic_input_actions
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
local INPUT_ACTION_NEXT = "move_down_hold_continuous"
local INPUT_ACTION_PREVIOUS = "move_up_hold_continuous"
local DO_RELOAD = false
HeroWindowCraftingListConsole = class(HeroWindowCraftingListConsole)
HeroWindowCraftingListConsole.NAME = "HeroWindowCraftingListConsole"

HeroWindowCraftingListConsole.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate HeroWindowCraftingListConsole")

	self._params = params
	self.parent = params.parent
	local ingame_ui_context = params.ingame_ui_context
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.statistics_db = ingame_ui_context.statistics_db
	self.render_settings = {
		snap_pixel_positions = true
	}
	self._animation_settings = {
		entry_alignment_progress = 0
	}
	local player_manager = Managers.player
	local local_player = player_manager:local_player()
	self._stats_id = local_player:stats_id()
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self.hero_name = params.hero_name
	self.career_index = params.career_index
	self.profile_index = params.profile_index
	local hero_name = self.hero_name
	local career_index = self.career_index
	local profile_index = FindProfileIndex(hero_name)
	local profile = SPProfiles[profile_index]
	local career_data = profile.careers[career_index]
	local career_name = career_data.name
	self._animations = {}
	self._ui_animations = {}

	self:create_ui_elements(params, offset)

	self.conditions_params = {
		hero_name = self.hero_name,
		career_name = career_name,
		rarities_to_ignore = table.enum_safe("magic")
	}

	self:_populate_buttons(page_settings)

	local recipe_index = params.recipe_index or 1
	local ignore_sound = true

	self:_on_button_selected(recipe_index, ignore_sound)
	self:_start_transition_animation("on_enter")
end

HeroWindowCraftingListConsole._start_transition_animation = function (self, animation_name)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings,
		animation_settings = self._animation_settings
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)
	self._animations[animation_name] = anim_id
end

HeroWindowCraftingListConsole.create_ui_elements = function (self, params, offset)
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
	local title_button_widgets = {}

	for name, widget_definition in pairs(title_button_definitions) do
		local widget = UIWidget.init(widget_definition)
		title_button_widgets[#title_button_widgets + 1] = widget
	end

	self._title_button_widgets = title_button_widgets

	UIRenderer.clear_scenegraph_queue(self.ui_top_renderer)

	self.ui_animator = UIAnimator:new(self.ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self.ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end

	local input_service = Managers.input:get_service("hero_view")
	local gui_layer = UILayer.default + 30
	self._menu_input_description = MenuInputDescriptionUI:new(nil, self.ui_top_renderer, input_service, 4, gui_layer, generic_input_actions.default, true)

	self._menu_input_description:set_input_description(nil)
end

HeroWindowCraftingListConsole.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate HeroWindowCraftingListConsole")

	self.ui_animator = nil

	self._menu_input_description:destroy()

	self._menu_input_description = nil
end

HeroWindowCraftingListConsole._input_service = function (self)
	local parent = self.parent

	if parent:is_friends_list_active() then
		return FAKE_INPUT_SERVICE
	end

	return parent:window_input_service()
end

HeroWindowCraftingListConsole.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	self:_update_animations(dt)
	self:draw(dt)
end

HeroWindowCraftingListConsole.post_update = function (self, dt, t)
	self:_handle_input(dt, t)
end

HeroWindowCraftingListConsole._update_animations = function (self, dt)
	local ui_animations = self._ui_animations
	local animations = self._animations
	local ui_animator = self.ui_animator

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

	local entry_alignment_progress = self._animation_settings.entry_alignment_progress

	self:_set_alignment_progress(entry_alignment_progress)

	local title_button_widgets = self._title_button_widgets

	for i, widget in ipairs(title_button_widgets) do
		self:_animate_entry(widget, dt)
	end
end

HeroWindowCraftingListConsole._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.button_text

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

HeroWindowCraftingListConsole._is_stepper_button_pressed = function (self, widget)
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

HeroWindowCraftingListConsole._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter and not hotspot.is_selected
end

HeroWindowCraftingListConsole._is_button_hover_exit = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_exit and not hotspot.is_selected
end

HeroWindowCraftingListConsole._is_button_selected = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.is_selected
end

HeroWindowCraftingListConsole._handle_input = function (self, dt, t)
	local parent = self.parent
	local widgets_by_name = self._widgets_by_name
	local input_service = self:_input_service()
	local current_index = self:_selected_button_index()
	local input_made = false
	local title_button_widgets = self._title_button_widgets

	for i, widget in ipairs(title_button_widgets) do
		if i ~= current_index and self:_is_button_hover_enter(widget) then
			self:_on_button_selected(i)

			input_made = true
		end

		if self:_is_button_pressed(widget) then
			input_made = true

			self:_open_recipe_page(i)
		end
	end

	if input_service:get("confirm") then
		self:_open_recipe_page(current_index)

		input_made = true
	end

	if not input_made then
		if input_service:get(INPUT_ACTION_PREVIOUS) and current_index > 1 then
			self:_on_button_selected(current_index - 1)
		elseif input_service:get(INPUT_ACTION_NEXT) and current_index < #page_settings then
			self:_on_button_selected(current_index + 1)
		end
	end
end

HeroWindowCraftingListConsole._open_recipe_page = function (self, index)
	self._params.recipe_index = index

	self.parent:set_layout_by_name("crafting_recipe")
end

HeroWindowCraftingListConsole._selected_button_index = function (self)
	local title_button_widgets = self._title_button_widgets

	for i, widget in ipairs(title_button_widgets) do
		if widget.content.button_hotspot.is_selected then
			return i
		end
	end
end

HeroWindowCraftingListConsole._on_button_selected = function (self, index, ignore_sound)
	local title_button_widgets = self._title_button_widgets

	for i, widget in ipairs(title_button_widgets) do
		widget.content.button_hotspot.is_selected = i == index
	end

	local page_setting = page_settings[index]
	local recipe_name = page_setting.name
	local recipe = crafting_recipes_by_name[recipe_name]
	local description_text = recipe.description_text
	local display_name = recipe.display_name
	local widgets_by_name = self._widgets_by_name
	local description_widget = widgets_by_name.description_text
	local title_widget = widgets_by_name.tite_text
	description_widget.content.text = Localize(description_text)
	title_widget.content.text = Localize(display_name)

	if not ignore_sound then
		self:_play_sound("play_gui_craft_hover_items")
	end
end

HeroWindowCraftingListConsole.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self:_input_service()
	local gamepad_active = Managers.input:is_device_active("gamepad")

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	for _, widget in ipairs(self._title_button_widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	UIRenderer.end_pass(ui_top_renderer)

	if gamepad_active and self._menu_input_description then
		self._menu_input_description:draw(ui_top_renderer, dt)
	end
end

HeroWindowCraftingListConsole._play_sound = function (self, event)
	self.parent:play_sound(event)
end

HeroWindowCraftingListConsole._populate_buttons = function (self, page_settings)
	local title_button_widgets = self._title_button_widgets

	for index, widget in ipairs(title_button_widgets) do
		local page_setting = page_settings[index]
		local content = widget.content
		local style = widget.style
		content.visible = page_setting ~= nil

		if page_setting then
			local recipe_name = page_setting.name
			local recipe = crafting_recipes_by_name[recipe_name]
			local display_icon = recipe.display_icon_console
			content.icon = display_icon
		end
	end
end

HeroWindowCraftingListConsole._set_alignment_progress = function (self, progress)
	local title_button_widgets = self._title_button_widgets
	local num_recipies = #page_settings
	local spacing = 100
	local total_height = num_recipies * spacing
	local start_height = total_height / 2 - spacing / 2
	local layer_index = 1
	local num_layers = 6

	for index, widget in ipairs(title_button_widgets) do
		local page_setting = page_settings[index]
		local content = widget.content
		local style = widget.style
		local offset = widget.offset
		offset[2] = start_height * progress
		offset[1] = -0.00055 * offset[2]^2
		local angle = 0.001 * offset[2]
		style.holder.angle = -(angle * progress)
		start_height = start_height - spacing
		layer_index = math.ceil(num_recipies / 2) < index and layer_index - 1 or layer_index + 1

		if content.button_hotspot.is_selected then
			offset[3] = (num_recipies + 1) * num_layers
		else
			offset[3] = index * num_layers
		end
	end
end

HeroWindowCraftingListConsole._setup_text_button_size = function (self, widget)
	local scenegraph_id = widget.scenegraph_id
	local content = widget.content
	local style = widget.style
	local text_style = style.text
	local text = content.text_field or content.text

	if text_style.localize then
		text = Localize(text)
	end

	if text_style.upper_case then
		text = TextToUpper(text)
	end

	local ui_scenegraph = self.ui_scenegraph
	local ui_top_renderer = self.ui_top_renderer
	local font, scaled_font_size = UIFontByResolution(text_style)
	local text_width, text_height, min = UIRenderer.text_size(ui_top_renderer, text, font[1], scaled_font_size)
	ui_scenegraph[scenegraph_id].size[1] = text_width

	return text_width
end

HeroWindowCraftingListConsole._set_text_button_horizontal_position = function (self, widget, x_position)
	local ui_scenegraph = self.ui_scenegraph
	local scenegraph_id = widget.scenegraph_id
	ui_scenegraph[scenegraph_id].local_position[1] = x_position
end

HeroWindowCraftingListConsole._animate_entry = function (self, widget, dt)
	local content = widget.content
	local style = widget.style
	local hotspot = content.button_hotspot
	local is_hover = hotspot.is_hover
	local is_selected = hotspot.is_selected
	local input_pressed = not is_selected and hotspot.is_clicked and hotspot.is_clicked == 0
	local input_progress = hotspot.input_progress or 0
	local hover_progress = hotspot.hover_progress or 0
	local selection_progress = hotspot.selection_progress or 0
	local speed = 8
	local input_speed = 20

	if input_pressed then
		input_progress = math.min(input_progress + dt * input_speed, 1)
	else
		input_progress = math.max(input_progress - dt * input_speed, 0)
	end

	local input_easing_out_progress = math.easeOutCubic(input_progress)
	local input_easing_in_progress = math.easeInCubic(input_progress)

	if is_hover then
		hover_progress = math.min(hover_progress + dt * speed, 1)
	else
		hover_progress = math.max(hover_progress - dt * speed, 0)
	end

	local hover_easing_out_progress = math.easeOutCubic(hover_progress)
	local hover_easing_in_progress = math.easeInCubic(hover_progress)

	if is_selected then
		selection_progress = math.min(selection_progress + dt * speed, 1)
	else
		selection_progress = math.max(selection_progress - dt * speed, 0)
	end

	local select_easing_out_progress = math.easeOutCubic(selection_progress)
	local select_easing_in_progress = math.easeInCubic(selection_progress)
	local combined_progress = math.max(hover_progress, selection_progress)
	local combined_out_progress = math.max(select_easing_out_progress, hover_easing_out_progress)
	local combined_in_progress = math.max(hover_easing_in_progress, select_easing_in_progress)
	local hover_alpha = 255 * combined_progress
	style.selection.color[1] = hover_alpha
	local icon_color_value = 100 + 155 * combined_progress
	style.icon.color[2] = icon_color_value
	style.icon.color[3] = icon_color_value
	style.icon.color[4] = icon_color_value
	hotspot.hover_progress = hover_progress
	hotspot.input_progress = input_progress
	hotspot.selection_progress = selection_progress
end

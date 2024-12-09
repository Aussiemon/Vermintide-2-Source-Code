-- chunkname: @scripts/ui/views/hero_view/windows/hero_window_dark_pact_character_selection_console.lua

local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_dark_pact_character_selection_console_definitions")
local widget_definitions = definitions.widget_definitions
local generic_input_actions = definitions.generic_input_actions
local animation_definitions = definitions.animation_definitions
local scenegraph_definition = definitions.scenegraph_definition
local MAX_COLUMNS = 5
local HOVER_PROGRESS_SPEED = 5

HeroWindowDarkPactCharacterSelectionConsole = class(HeroWindowDarkPactCharacterSelectionConsole)
HeroWindowDarkPactCharacterSelectionConsole.NAME = "HeroWindowDarkPactCharacterSelectionConsole"

HeroWindowDarkPactCharacterSelectionConsole.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate HeroWindowDarkPactCharacterSelectionConsole")

	local ingame_ui_context = params.ingame_ui_context

	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._profile_synchronizer = ingame_ui_context.profile_synchronizer
	self._ingame_ui = ingame_ui_context.ingame_ui
	self._parent = params.parent
	self._wwise_world = params.wwise_world
	self._render_settings = {
		snap_pixel_positions = true,
	}
	self._hero_name = params.hero_name
	self._career_index = params.career_index or 0
	self._profile_index = params.profile_index or 0
	self._profile_selectable = false
	self._animations = {}
	self._ui_animations = {}

	local local_player = Managers.player:local_player()

	self._peer_id = local_player:network_id()
	self._local_player_id = local_player:local_player_id()
	self._player_stats_id = local_player:stats_id()
	self._statistics_db = ingame_ui_context.statistics_db

	local gui_layer = UILayer.default + 300
	local input_description_input_service = self._parent:window_input_service()

	self._menu_input_description = MenuInputDescriptionUI:new(ingame_ui_context, self._ui_top_renderer, input_description_input_service, 4, gui_layer + 100, generic_input_actions.default, true)

	self._menu_input_description:set_input_description(nil)

	self._dark_pact_profiles = self:_get_dark_pact_selectable_profiles()

	self:_create_ui_elements(params, offset)
	self:_start_transition_animation("on_enter", "on_enter")
	self:_first_pactsworn_setup(self._profile_index, self._career_index)

	local mood_settings = DLCSettings.carousel and DLCSettings.carousel.hero_window_mood_settings
	local mood_setting = mood_settings.pactsworn or "default"

	self._parent:set_background_mood(mood_setting)
end

HeroWindowDarkPactCharacterSelectionConsole._first_pactsworn_setup = function (self, profile_index, career_index)
	local profile_settings = SPProfiles[profile_index]
	local row, column = 1, 1

	if profile_settings.affiliation ~= "dark_pact" then
		row = Math.random(1, self._num_max_rows)

		local max_columns_per_row = self._num_hero_columns[row] or 1

		column = Math.random(1, max_columns_per_row)
		self._selected_row = row
		self._selected_column = column
		profile_index, career_index = self:_get_selected_dark_pact_profile_and_career_indx(row, column)
	end

	self._selected_dark_pact_profile_index = profile_index
	self._selected_dark_pact_career_index = career_index

	self:_set_selected_portrait(profile_index, career_index)

	if self._selected_dark_pact_profile_index > 0 and self._selected_dark_pact_career_index > 0 then
		self:_select_hero(self._selected_dark_pact_profile_index, self._selected_dark_pact_career_index)
	end
end

HeroWindowDarkPactCharacterSelectionConsole._set_selected_portrait = function (self, profile_index, career_index)
	for row = 1, self._num_max_rows do
		for column = 1, self._num_hero_columns[row] do
			local widget = self._selection_widget_lookup[row][column]
			local content = widget.content
			local is_selected = profile_index == content.profile_index and career_index == content.career_index

			content.selected = is_selected

			if is_selected then
				self._selected_row = row
				self._selected_column = column
			end
		end
	end
end

HeroWindowDarkPactCharacterSelectionConsole._get_selected_dark_pact_profile_and_career_indx = function (self, row, column)
	if not self._selection_widget_lookup then
		return self._dark_pact_profiles[1], 1
	end

	if column > self._num_hero_columns[row] then
		column = self._num_hero_columns[row]
	end

	local widget = self._selection_widget_lookup[row][column]
	local content = widget.content
	local profile_index = content.profile_index
	local career_index = content.career_index

	return profile_index, career_index
end

HeroWindowDarkPactCharacterSelectionConsole._select_hero = function (self, profile_index, career_index, initial_selection)
	if not initial_selection then
		self:_play_sound("play_gui_hero_select_career_click")
	end

	local profile_settings = SPProfiles[profile_index]
	local career_settings = profile_settings.careers[career_index]
	local hero_name = profile_settings.display_name
	local character_name = profile_settings.character_name
	local character_career_name = career_settings.display_name

	GlobalShaderFlags.set_global_shader_flag("NECROMANCER_CAREER_REMAP", character_career_name == "bw_necromancer")

	local hero_display_name = Localize(character_name)
	local career_display_name = Localize(character_career_name)

	self._selected_dark_pact_career_index = career_index
	self._selected_dark_pact_profile_index = profile_index
	self._selected_hero_name = hero_name

	Managers.state.event:trigger("respawn_hero", {
		hero_name = hero_name,
		career_index = career_index,
	})
	self:_setup_dark_pact_loadut_data(profile_index, career_index)
	self._parent:change_profile(profile_index, career_index)
end

local NUM_VISIBLE_STATS = 2

HeroWindowDarkPactCharacterSelectionConsole._setup_dark_pact_loadut_data = function (self, profile_index, career_index)
	local profile = SPProfiles[profile_index]
	local career = profile.careers[career_index]
	local pactsworn_name = self._widgets_by_name.pactsworn_name
	local character_career_name = career.display_name
	local career_name = career.name

	pactsworn_name.content.text = Localize(character_career_name)

	local cosmetic_slot = "slot_skin"
	local item = BackendUtils.get_loadout_item(career_name, cosmetic_slot)
	local settings = DLCSettings.carousel
	local dark_pact_stats = settings.hero_window_pactsworn_stats_by_name[career_name] or settings.hero_window_pactsworn_stats_by_name.default

	for i = 1, NUM_VISIBLE_STATS do
		local stat_text = self._widgets_by_name["pactsworn_stat_" .. i]
		local content = stat_text.content
		local stat_id = dark_pact_stats[i]
		local stat_value = math.round(self._statistics_db:get_persistent_stat(self._player_stats_id, unpack(stat_id)))
		local stat_name = Localize(settings.stats_string_lookup[stat_id[1]])

		content.text = "{#color(160,146,101,255)}" .. stat_name .. "{#reset()} : " .. stat_value

		local stat_text_shadow = self._widgets_by_name["pactsworn_stat_shadow_" .. i]
		local content = stat_text_shadow.content

		content.text = stat_name .. " : " .. stat_value

		local stat_icon = self._widgets_by_name["pactsworn_stat_" .. i .. "_icon"]
		local content = stat_icon.content

		content.texture_id = settings.stats_icons_lookup[stat_id[1]]
	end

	local description = self._widgets_by_name.pactsworn_description
	local description_content = description.content

	description_content.text = Localize(career.description)

	local button_widget = self._widgets_by_name.equipment_skin
	local button_content = button_widget.content

	if item then
		button_content[cosmetic_slot].item = item
		button_content[cosmetic_slot].icon = item.data.inventory_icon
		button_content[cosmetic_slot].profile_index = self._selected_dark_pact_profile_index
		button_content[cosmetic_slot].career_index = self._selected_dark_pact_career_index
		button_content[cosmetic_slot].rarity = UISettings.item_rarity_textures[item.rarity]
	end

	button_content.is_dark_pact = true
end

HeroWindowDarkPactCharacterSelectionConsole._update_selectable = function (self, selectable, dlc_name)
	return
end

HeroWindowDarkPactCharacterSelectionConsole._start_transition_animation = function (self, key, animation_name)
	local params = {
		wwise_world = self._wwise_world,
		render_settings = self._render_settings,
	}
	local widgets = {}
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)

	self._animations[key] = anim_id
end

HeroWindowDarkPactCharacterSelectionConsole._create_ui_elements = function (self, params, offset)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)

		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name

	self:_setup_dark_pact_selection_widgets()
	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self._ui_scenegraph.window.local_position

		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end
end

HeroWindowDarkPactCharacterSelectionConsole._setup_dark_pact_selection_widgets = function (self)
	local pactsworn_widgets = {}

	self._pactsworn_widgets = pactsworn_widgets

	local selection_widget_lookup = {}

	self._selection_widget_lookup = selection_widget_lookup
	self._num_hero_columns = {}

	local num_max_columns = 5
	local column, rows = 1, 1

	for i, profile_index in ipairs(self._dark_pact_profiles) do
		local profile_settings = SPProfiles[profile_index]
		local dark_pact_name = profile_settings.display_name
		local career = profile_settings.careers[1]
		local widget_definition = UIWidgets.create_dark_pact_selection_widget("selection_anchor")
		local widget = UIWidget.init(widget_definition)

		pactsworn_widgets[#pactsworn_widgets + 1] = widget
		self._widgets_by_name["selection_widget_" .. i] = widget

		local content = widget.content

		content.portrait = career.picking_image_square
		content.career_settings = career
		content.profile_index = profile_index
		content.career_index = 1

		if profile_settings.enemy_role == "boss" then
			content.portrait_frame = "pactsworn_frame_gold"
		end

		if not selection_widget_lookup[rows] then
			selection_widget_lookup[rows] = {}
		end

		selection_widget_lookup[rows][column] = widget

		local even_row = rows % 2 == 0
		local x = 140 * column - 1 + 10 * column - 1
		local y = 140 * rows - 1 + 10 * rows - 1

		widget.offset[1] = even_row and x + 70 or x
		widget.offset[2] = even_row and -y + 35 or -y
		widget.offset[3] = -i * 10
		self._num_hero_columns[rows] = column

		if column == 5 then
			rows = rows + 1
			column = 0
		end

		column = column + 1
	end

	self._num_max_columns = num_max_columns
	self._num_max_rows = rows
end

HeroWindowDarkPactCharacterSelectionConsole._get_dark_pact_selectable_profiles = function (self)
	local dark_pact_profiles = {}

	for profile_index, settings in ipairs(SPProfiles) do
		if settings.affiliation == "dark_pact" and settings.role ~= nil then
			dark_pact_profiles[#dark_pact_profiles + 1] = profile_index
		end
	end

	return dark_pact_profiles
end

HeroWindowDarkPactCharacterSelectionConsole.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate HeroWindowDarkPactCharacterSelectionConsole")

	self._ui_animator = nil

	local profile_index, career_index, hero_name = self._parent:currently_selected_profile()

	if self._selected_profile_index ~= profile_index or self._selected_career_index ~= career_index then
		Managers.state.event:trigger("respawn_hero", {
			hero_name = hero_name,
			career_index = career_index,
		})

		local profile = SPProfiles[profile_index]
		local career = profile.careers[career_index]
		local career_name = career.name

		GlobalShaderFlags.set_global_shader_flag("NECROMANCER_CAREER_REMAP", career_name == "bw_necromancer")
	end
end

HeroWindowDarkPactCharacterSelectionConsole.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:_create_ui_elements()
	end

	self:_update_animations(dt)
	self:_update_portraits(dt)
	self:_update_input(dt)
	self:_draw(dt)
end

HeroWindowDarkPactCharacterSelectionConsole.post_update = function (self, dt, t)
	return
end

HeroWindowDarkPactCharacterSelectionConsole._update_animations = function (self, dt)
	local ui_animations = self._ui_animations
	local animations = self._animations
	local ui_animator = self._ui_animator

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
end

HeroWindowDarkPactCharacterSelectionConsole._update_input = function (self, dt)
	local input_service = self._parent:window_input_service()
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if gamepad_active then
		self:_handle_gamepad_selection(input_service)
	else
		self:_handle_mouse_selection()
	end

	local slot_skin_widget = self._widgets_by_name.equipment_skin
	local slot_skin_widget_content = slot_skin_widget.content
	local slot_skin_widget_hotspot = slot_skin_widget_content.slot_skin

	slot_skin_widget_hotspot.highlight = self._higlight_inventory_selection and gamepad_active
end

HeroWindowDarkPactCharacterSelectionConsole._handle_mouse_selection = function (self)
	local hero_widgets = self._hero_widgets
	local num_max_rows = self._num_max_rows
	local num_max_columns = self._num_max_columns
	local selected_profile_index = self._selected_dark_pact_profile_index
	local selected_career_index = self._selected_dark_pact_career_index
	local widget_index = 1

	for row = 1, num_max_rows do
		for column = 1, num_max_columns do
			local widget = self._selection_widget_lookup[row][column]

			if not widget then
				break
			end

			local content = widget.content
			local button_hotspot = content.hotspot
			local profile_index = content.profile_index
			local career_index = content.career_index

			if button_hotspot.on_pressed and (profile_index ~= selected_profile_index or career_index ~= selected_career_index) then
				self:_select_hero(profile_index, career_index)
				self:_set_selected_portrait(profile_index, career_index)
			end
		end
	end

	local slot_skin_widget = self._widgets_by_name.equipment_skin

	if UIUtils.is_button_pressed(slot_skin_widget, "slot_skin") then
		self:_play_sound("play_gui_equipment_selection_click")
		self._parent:set_selected_cosmetic_slot_index(2)
		self._parent:set_layout_by_name("cosmetics_selection_dark_pact")
	end
end

HeroWindowDarkPactCharacterSelectionConsole._handle_gamepad_selection = function (self, input_service)
	local selected_row = self._selected_row
	local selected_column = self._selected_column
	local num_max_rows = self._num_max_rows
	local num_max_columns = self._num_hero_columns[selected_row]

	if selected_row and selected_column and not self._higlight_inventory_selection then
		local modified = false

		if selected_column > 1 and input_service:get("move_left_hold_continuous") then
			selected_column = selected_column - 1
			modified = true
		elseif selected_column < num_max_columns and input_service:get("move_right_hold_continuous") then
			selected_column = selected_column + 1
			modified = true
		end

		if selected_row > 1 and input_service:get("move_up_hold_continuous") then
			selected_row = selected_row - 1
			num_max_columns = self._num_hero_columns[selected_row]
			modified = true
		elseif selected_row < num_max_rows and input_service:get("move_down_hold_continuous") then
			selected_row = selected_row + 1
			num_max_columns = self._num_hero_columns[selected_row]
			modified = true
		end

		if num_max_columns < selected_column then
			selected_column = num_max_columns
			modified = true
		end

		if modified then
			local profile_index, career_index = self:_get_selected_dark_pact_profile_and_career_indx(selected_row, selected_column)

			self:_set_selected_portrait(profile_index, career_index)
		end
	end

	if self._higlight_inventory_selection and input_service:get("confirm") then
		self._higlight_inventory_selection = nil

		self._parent:pause_input(false)
		self:_play_sound("play_gui_equipment_selection_click")
		self._parent:set_selected_cosmetic_slot_index(2)
		self._parent:set_layout_by_name("cosmetics_selection_dark_pact")

		return
	elseif self._higlight_inventory_selection and input_service:get("back") then
		self._higlight_inventory_selection = nil

		self._menu_input_description:change_generic_actions(generic_input_actions.default)
		self._parent:pause_input(false)
	end

	local profile_index, career_index = self:_get_selected_dark_pact_profile_and_career_indx(self._selected_row, self._selected_column)

	if profile_index and career_index and not self._higlight_inventory_selection and input_service:get("confirm") then
		self._higlight_inventory_selection = true

		self:_select_hero(profile_index, career_index)
		self._parent:pause_input(true)
		self._menu_input_description:change_generic_actions(generic_input_actions.select_inventory)
	end
end

HeroWindowDarkPactCharacterSelectionConsole.set_focus = function (self, focused)
	self._focused = focused
end

HeroWindowDarkPactCharacterSelectionConsole._exit = function (self, selected_level)
	self.exit = true
	self.exit_level_id = selected_level
end

HeroWindowDarkPactCharacterSelectionConsole._draw = function (self, dt)
	local ui_renderer = self._ui_renderer
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._parent:window_input_service()
	local gamepad_active = Managers.input:is_device_active("gamepad")

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self._render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	if self._pactsworn_widgets then
		UIRenderer.draw_all_widgets(ui_top_renderer, self._pactsworn_widgets)
	end

	UIRenderer.end_pass(ui_top_renderer)

	if gamepad_active then
		self._menu_input_description:draw(ui_top_renderer, dt)
	end
end

HeroWindowDarkPactCharacterSelectionConsole._play_sound = function (self, event)
	self._parent:play_sound(event)
end

HeroWindowDarkPactCharacterSelectionConsole._update_portraits = function (self, dt)
	local portrait_widgets = self._pactsworn_widgets
	local selected_profile_index = self._selected_dark_pact_profile_index
	local selected_career_index = self._selected_dark_pact_career_index
	local gamepad_active = Managers.input:is_device_active("gamepad")

	for i = 1, #portrait_widgets do
		local widget = portrait_widgets[i]
		local content = widget.content
		local hotspot = content.hotspot
		local hover_progress = hotspot.hover_progress or 0
		local selection_progress = hotspot.selection_progress or 0
		local is_selected, is_hover

		if gamepad_active then
			is_selected = content.profile_index == selected_profile_index and content.career_index == selected_career_index and self._higlight_inventory_selection
			is_hover = content.selected
		else
			is_selected = content.profile_index == selected_profile_index and content.career_index == selected_career_index
			is_hover = hotspot.is_hover or content.selected
		end

		if is_hover then
			hover_progress = math.min(hover_progress + dt * HOVER_PROGRESS_SPEED, 1)
		else
			hover_progress = math.max(hover_progress - dt * HOVER_PROGRESS_SPEED, 0)
		end

		if is_selected then
			selection_progress = math.min(selection_progress + dt * HOVER_PROGRESS_SPEED, 1)
		else
			selection_progress = math.max(selection_progress - dt * HOVER_PROGRESS_SPEED, 0)
		end

		local style = widget.style
		local portrait_frame_style = style.portrait_frame
		local portrait_style = style.portrait
		local selected_frame_style = style.portrait_frame_selected
		local portrait_frame_texture_size = portrait_frame_style.texture_size
		local portrait_frame_default_size = portrait_frame_style.default_size
		local portrait_frame_offset = portrait_frame_style.offset
		local portrait_frame_default_offset = portrait_frame_style.default_offset
		local portrait_texture_size = portrait_style.texture_size
		local portrait_default_size = portrait_style.default_size
		local portrait_offset = portrait_style.offset
		local portrait_default_offset = portrait_style.default_offset
		local selected_frame_texture_size = selected_frame_style.texture_size
		local selected_frame_default_size = selected_frame_style.default_size
		local selected_frame_offset = selected_frame_style.offset
		local selected_frame_default_offset = selected_frame_style.default_offset
		local size_multiplier = 0.125
		local portrait_size_multiplier = 0.2
		local ease_progress = math.easeOutCubic(selection_progress)

		portrait_frame_texture_size[1] = portrait_frame_default_size[1] + portrait_frame_default_size[1] * size_multiplier * ease_progress
		portrait_frame_texture_size[2] = portrait_frame_default_size[2] + portrait_frame_default_size[2] * size_multiplier * ease_progress
		portrait_frame_offset[1] = portrait_frame_default_offset[1] - portrait_frame_default_size[1] * size_multiplier * ease_progress * 0.5
		portrait_texture_size[1] = portrait_default_size[1] + portrait_default_size[1] * portrait_size_multiplier * ease_progress
		portrait_texture_size[2] = portrait_default_size[2] + portrait_default_size[2] * portrait_size_multiplier * ease_progress
		portrait_offset[1] = portrait_default_offset[1] - portrait_default_size[1] * portrait_size_multiplier * ease_progress * 0.5
		selected_frame_texture_size[1] = selected_frame_default_size[1] + selected_frame_default_size[1] * size_multiplier * ease_progress
		selected_frame_texture_size[2] = selected_frame_default_size[2] + selected_frame_default_size[2] * size_multiplier * ease_progress
		selected_frame_offset[1] = selected_frame_default_offset[1] - selected_frame_default_size[1] * size_multiplier * ease_progress * 0.5
		selected_frame_style.color[1] = 255 * hover_progress
		hotspot.hover_progress = hover_progress
		hotspot.selection_progress = selection_progress
	end
end

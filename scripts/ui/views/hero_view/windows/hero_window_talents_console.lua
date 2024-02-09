-- chunkname: @scripts/ui/views/hero_view/windows/hero_window_talents_console.lua

require("scripts/ui/hud_ui/scrollbar_ui")

local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_talents_console_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local generic_input_actions = definitions.generic_input_actions
local DO_RELOAD = false

HeroWindowTalentsConsole = class(HeroWindowTalentsConsole)
HeroWindowTalentsConsole.NAME = "HeroWindowTalentsConsole"

HeroWindowTalentsConsole.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate HeroWindowTalentsConsole")

	self.parent = params.parent

	local ingame_ui_context = params.ingame_ui_context

	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.statistics_db = ingame_ui_context.statistics_db
	self.render_settings = {
		snap_pixel_positions = true,
	}

	local player_manager = Managers.player
	local local_player = player_manager:local_player()

	self._stats_id = local_player:stats_id()
	self.player_manager = player_manager
	self.player = local_player
	self.peer_id = ingame_ui_context.peer_id
	self._animations = {}

	self:create_ui_elements(params, offset)

	self.hero_name = params.hero_name
	self.career_index = params.career_index

	local profile_index = FindProfileIndex(self.hero_name)

	self._career_name = SPProfiles[profile_index].careers[self.career_index].name

	local experience = ExperienceSettings.get_experience(self.hero_name)

	self.hero_level = ExperienceSettings.get_level(experience)

	self:_initialize_talents()
	self:_start_transition_animation("on_enter")
end

HeroWindowTalentsConsole._start_transition_animation = function (self, animation_name)
	local params = {
		wwise_world = self.wwise_world,
		render_settings = self.render_settings,
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)

	self._animations[animation_name] = anim_id
end

HeroWindowTalentsConsole.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate HeroWindowTalentsConsole")

	self.ui_animator = nil

	local talent_interface = self._talent_interface
	local career_name = self._career_name

	talent_interface:set_talents(career_name, self._selected_talents)

	local player = self.player
	local player_unit = player.player_unit

	if Unit.alive(player_unit) then
		local talent_extension = ScriptUnit.extension(player_unit, "talent_system")

		talent_extension:talents_changed()

		local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")

		inventory_extension:apply_buffs_to_ammo()
	end
end

HeroWindowTalentsConsole._inject_additional_scenegraph_definitions = function (self, scenegraph_definition)
	for _, career_settings in pairs(CareerSettings) do
		if career_settings.additional_ui_info_file then
			local additional_ui_definitions = local_require(career_settings.additional_ui_info_file)

			for name, data in pairs(additional_ui_definitions.scenegraph_definition_to_inject) do
				scenegraph_definition[name] = data
			end
		end
	end
end

HeroWindowTalentsConsole.create_ui_elements = function (self, params, offset)
	self:_inject_additional_scenegraph_definitions(scenegraph_definition)

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
	self._additional_widgets = {}
	self._additional_widgets_by_name = {}

	local input_service = Managers.input:get_service("hero_view")
	local gui_layer = UILayer.default + 30

	self._menu_input_description = MenuInputDescriptionUI:new(nil, self.ui_top_renderer, input_service, 5, gui_layer, generic_input_actions.default, true)

	self._menu_input_description:set_input_description(nil)
	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)

	if offset then
		local window_position = self._ui_scenegraph.window.local_position

		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end
end

HeroWindowTalentsConsole._initialize_talents = function (self)
	local career_name = self._career_name
	local talent_interface = Managers.backend:get_interface("talents")
	local current_talents = talent_interface:get_talents(career_name)

	self._selected_talents = table.clone(current_talents)
	self._talent_interface = talent_interface

	self:_update_talent_sync(true)

	self._initialized = true
end

HeroWindowTalentsConsole._input_service = function (self)
	local parent = self.parent

	if parent:is_friends_list_active() then
		return FAKE_INPUT_SERVICE
	end

	return parent:window_input_service()
end

HeroWindowTalentsConsole.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

	self:_update_animations(dt)
	self:_handle_gamepad_input(dt, t)
	self:_handle_input(dt, t)
	self:draw(dt, t)
end

HeroWindowTalentsConsole.post_update = function (self, dt, t)
	return
end

HeroWindowTalentsConsole._update_talent_sync = function (self, initialize)
	self:_populate_talents_by_hero(initialize)
	self:_populate_career_info(initialize)
end

HeroWindowTalentsConsole._update_animations = function (self, dt)
	self.ui_animator:update(dt)

	local animations = self._animations
	local ui_animator = self.ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end
end

HeroWindowTalentsConsole._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_pressed then
		hotspot.on_pressed = false

		return true
	end
end

HeroWindowTalentsConsole._is_button_released = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

HeroWindowTalentsConsole._is_stepper_button_pressed = function (self, widget)
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

HeroWindowTalentsConsole._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter and not hotspot.is_selected
end

HeroWindowTalentsConsole._handle_gamepad_input = function (self, dt, t)
	local input_service = self:_input_service()
	local focused_row = self._focused_row
	local focused_column = self._focused_column

	if focused_row and focused_column then
		local modified = false

		if focused_column > 1 and input_service:get("move_left_hold_continuous") then
			focused_column = focused_column - 1
			modified = true
		elseif focused_column < NumTalentColumns and input_service:get("move_right_hold_continuous") then
			focused_column = focused_column + 1
			modified = true
		end

		if focused_row > 1 and input_service:get("move_up_hold_continuous") then
			focused_row = focused_row - 1
			modified = true
		elseif focused_row < NumTalentRows and input_service:get("move_down_hold_continuous") then
			focused_row = focused_row + 1
			modified = true
		end

		if modified then
			self:_set_talent_focused(focused_row, focused_column)
			self:_play_sound("play_gui_talents_selection_hover")
		end

		local can_press, is_selected = self:_can_press_talent(focused_row, focused_column)

		if can_press then
			if not is_selected and input_service:get("confirm", true) then
				self:_set_talent_selected(focused_row, focused_column)
			elseif input_service:get("refresh", true) then
				self:_set_talent_selected(focused_row, 0)
			end
		end
	end
end

HeroWindowTalentsConsole._handle_input = function (self, dt, t)
	local parent = self.parent
	local widgets_by_name = self._widgets_by_name
	local hover_row, hover_column = self:_is_talent_hovered()

	if hover_row and hover_column then
		self:_play_sound("play_gui_talents_selection_hover")
		self:_set_talent_focused(hover_row, hover_column)
	end

	if self:_is_disabled_talent_hovered() then
		self:_play_sound("play_gui_talents_selection_hover_disabled")
	end

	local row, column = self:_is_talent_pressed()

	if row and column then
		self:_set_talent_selected(row, column)
	end
end

HeroWindowTalentsConsole._set_talent_selected = function (self, row, column)
	local selected_talents = self._selected_talents

	if not selected_talents[row] or selected_talents[row] == 0 then
		self:_play_sound("play_gui_talent_unlock")
	else
		self:_play_sound("play_gui_talents_selection_click")
	end

	selected_talents[row] = column

	self:_update_talent_sync()
	self.parent:update_talent_sync()
end

HeroWindowTalentsConsole.draw = function (self, dt, t)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self:_input_service()
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

	for _, widget in ipairs(self._additional_widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	UIRenderer.end_pass(ui_top_renderer)

	if gamepad_active then
		self._menu_input_description:draw(ui_top_renderer, dt)
	end

	if self._scrollbar then
		self._scrollbar:update(dt, t, ui_top_renderer, input_service, self.render_settings)
	end
end

HeroWindowTalentsConsole._play_sound = function (self, event)
	self.parent:play_sound(event)
end

HeroWindowTalentsConsole._populate_talents_by_hero = function (self, initialize)
	self:_clear_talents()

	local widgets_by_name = self._widgets_by_name
	local hero_name = self.hero_name
	local career_index = self.career_index
	local profile_index = FindProfileIndex(hero_name)
	local profile = SPProfiles[profile_index]
	local career_settings = profile.careers[career_index]
	local start_index = (career_index - 1) * NumTalentRows
	local tree = TalentTrees[hero_name][career_settings.talent_tree_index]
	local talents = self._selected_talents
	local override_talents = PlayerUtils.get_talent_overrides_by_career(career_settings.display_name)

	for i = 1, NumTalentRows do
		local widget = widgets_by_name["talent_row_" .. i]

		if widget then
			local content = widget.content
			local style = widget.style
			local selected_column = talents[i]
			local no_talent_selected = not selected_column or selected_column == 0
			local unlock_name = "talent_point_" .. i
			local talent_unlock_level = TalentUnlockLevels[unlock_name]
			local row_unlocked = ProgressionUnlocks.is_unlocked(unlock_name, self.hero_level)
			local level_text_color = row_unlocked and Colors.get_color_table_with_alpha("green", 255) or Colors.get_color_table_with_alpha("red", 255)

			content.level_text = tostring(talent_unlock_level)
			style.level_text.text_color = level_text_color

			if row_unlocked and not no_talent_selected then
				local animations = widget.animations

				table.clear(animations)
			end

			local glow_frame_style = style.glow_frame

			glow_frame_style.color[1] = 0

			if initialize and row_unlocked and no_talent_selected then
				local anim = self:_animate_pulse(glow_frame_style.color, 1, 255, 100, 2)

				UIWidget.animate(widget, anim)
			end

			for j = 1, NumTalentColumns do
				local is_selected = selected_column == j
				local talent_name = tree[i][j]
				local id = TalentIDLookup[talent_name].talent_id
				local talent_data = TalentUtils.get_talent_by_id(hero_name, id)
				local name_suffix = "_" .. tostring(j)
				local icon_name = "icon" .. name_suffix
				local hotspot_name = "hotspot" .. name_suffix
				local title_text_name = "title_text" .. name_suffix
				local background_glow_name = "background_glow" .. name_suffix
				local hotspot = content[hotspot_name]
				local talent_locked = not row_unlocked

				talent_locked = talent_locked or override_talents and override_talents[talent_name] == false

				if is_selected or no_talent_selected and not talent_locked then
					style[icon_name].saturated = false
				else
					style[icon_name].saturated = true
				end

				content[icon_name] = talent_data and talent_data.icon or "icons_placeholder"
				content[title_text_name] = talent_data and Localize(talent_data.name) or "Undefined"
				hotspot.is_selected = is_selected
				hotspot.talent = talent_data
				hotspot.talent_id = id
				hotspot.disabled = talent_locked

				if not talent_locked then
					style[background_glow_name].saturated = false
				else
					style[background_glow_name].saturated = true
				end
			end
		end
	end

	self:_set_talent_focused(self._focused_row or 1, self._focused_column or 1)
end

HeroWindowTalentsConsole._clear_talents = function (self)
	local widgets_by_name = self._widgets_by_name

	for i = 1, NumTalentRows do
		local widget = widgets_by_name["talent_row_" .. i]

		if widget then
			local content = widget.content
			local style = widget.style

			for j = 1, NumTalentColumns do
				local name_suffix = "_" .. tostring(j)
				local icon_name = "icon" .. name_suffix
				local hotspot_name = "hotspot" .. name_suffix
				local title_text_name = "title_text" .. name_suffix

				content[icon_name] = "icons_placeholder"
				content[title_text_name] = "Undefined"
				content[hotspot_name].is_selected = false
				content[hotspot_name].disabled = true
			end
		end
	end
end

HeroWindowTalentsConsole._set_talent_focused = function (self, row, column)
	local widgets_by_name = self._widgets_by_name

	for i = 1, NumTalentRows do
		local widget = widgets_by_name["talent_row_" .. i]

		if widget then
			local content = widget.content

			for j = 1, NumTalentColumns do
				local name_suffix = "_" .. tostring(j)
				local hotspot_name = "hotspot" .. name_suffix
				local hotspot = content[hotspot_name]
				local focused = i == row and j == column

				hotspot.focused = focused

				if focused then
					local talent = hotspot.talent
					local locked = hotspot.disabled
					local selected = hotspot.is_selected

					self:_set_talent_tooltip(talent, selected, locked)
				end
			end
		end
	end

	self._focused_row = row
	self._focused_column = column
end

HeroWindowTalentsConsole._can_press_talent = function (self, row, column)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name["talent_row_" .. row]
	local content = widget.content
	local hotspot = content["hotspot_" .. column]

	return not hotspot.disabled, hotspot.is_selected
end

HeroWindowTalentsConsole._is_talent_pressed = function (self)
	local widgets_by_name = self._widgets_by_name

	for i = 1, NumTalentRows do
		local widget = widgets_by_name["talent_row_" .. i]

		if widget then
			local content = widget.content

			for j = 1, NumTalentColumns do
				local name_suffix = "_" .. tostring(j)
				local hotspot_name = "hotspot" .. name_suffix
				local hotspot = content[hotspot_name]

				if not hotspot.disabled then
					if hotspot.on_pressed and not hotspot.is_selected then
						return i, j
					elseif hotspot.on_right_click then
						return i, 0
					end
				end
			end
		end
	end
end

HeroWindowTalentsConsole._is_talent_hovered = function (self)
	local widgets_by_name = self._widgets_by_name

	for i = 1, NumTalentRows do
		local widget = widgets_by_name["talent_row_" .. i]

		if widget then
			local content = widget.content

			for j = 1, NumTalentColumns do
				local name_suffix = "_" .. tostring(j)
				local hotspot_name = "hotspot" .. name_suffix
				local hotspot = content[hotspot_name]

				if hotspot.on_hover_enter and not hotspot.disabled then
					return i, j
				end
			end
		end
	end
end

HeroWindowTalentsConsole._is_disabled_talent_hovered = function (self)
	local widgets_by_name = self._widgets_by_name

	for i = 1, NumTalentRows do
		local widget = widgets_by_name["talent_row_" .. i]

		if widget then
			local content = widget.content

			for j = 1, NumTalentColumns do
				local name_suffix = "_" .. tostring(j)
				local hotspot_name = "hotspot" .. name_suffix
				local hotspot = content[hotspot_name]

				if hotspot.on_hover_enter and hotspot.disabled then
					return i, j
				end
			end
		end
	end
end

HeroWindowTalentsConsole._populate_career_info = function (self, initialize)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local hero_name = self.hero_name
	local career_index = self.career_index
	local profile_index = FindProfileIndex(hero_name)
	local profile = SPProfiles[profile_index]
	local career_settings = profile.careers[career_index]
	local career_name = career_settings.name
	local character_selection_image = career_settings.character_selection_image
	local display_name = career_settings.display_name
	local widgets_by_name = self._widgets_by_name
	local career_color = Colors.color_definitions[career_name] and Colors.get_color_table_with_alpha(career_name, 255) or {
		255,
		255,
		255,
		255,
	}
	local passive_ability_data = career_settings.passive_ability
	local activated_ability_data = career_settings.activated_ability[1]
	local passive_display_name = passive_ability_data.display_name
	local passive_icon = passive_ability_data.icon
	local activated_display_name = activated_ability_data.display_name
	local activated_icon = activated_ability_data.icon

	widgets_by_name.passive_title_text.content.text = Localize(passive_display_name)
	widgets_by_name.passive_description_text.content.text = UIUtils.get_ability_description(passive_ability_data)
	widgets_by_name.passive_icon.content.texture_id = passive_icon
	widgets_by_name.active_title_text.content.text = Localize(activated_display_name)
	widgets_by_name.active_description_text.content.text = UIUtils.get_ability_description(activated_ability_data)
	widgets_by_name.active_icon.content.texture_id = activated_icon

	local passive_perks = passive_ability_data.perks
	local total_perks_height = 0
	local perks_height_spacing = 0

	for i = 1, 3 do
		local widget = widgets_by_name["career_perk_" .. i]
		local content = widget.content
		local style = widget.style
		local scenegraph_id = widget.scenegraph_id
		local scenegraph = ui_scenegraph[scenegraph_id]
		local size = scenegraph.size
		local offset = widget.offset

		offset[2] = -total_perks_height

		local data = passive_perks[i]

		if data then
			local display_name = Localize(data.display_name)
			local description = UIUtils.get_perk_description(data)
			local title_text_style = style.title_text
			local description_text_style = style.description_text
			local description_text_shadow_style = style.description_text_shadow

			content.title_text = display_name
			content.description_text = description

			local title_height = UIUtils.get_text_height(ui_renderer, size, title_text_style, display_name)
			local description_height = UIUtils.get_text_height(ui_renderer, size, description_text_style, description)

			description_text_style.offset[2] = -description_height
			description_text_shadow_style.offset[2] = -(description_height + 2)
			total_perks_height = total_perks_height + title_height + description_height + perks_height_spacing
		end

		content.visible = data ~= nil
	end

	self:_setup_additional_career_info(career_settings, total_perks_height)
end

HeroWindowTalentsConsole._setup_additional_career_info = function (self, career_settings)
	if career_settings.additional_ui_info_file then
		local additional_info_definitions = local_require(career_settings.additional_ui_info_file)
		local scroll_area_scenegraph_id = "scrollbar_window"
		local scroll_area_anchor_scenegraph_id = "scrollbar_anchor"
		local height = self._ui_scenegraph[scroll_area_scenegraph_id].size[2]
		local base_offset = {
			0,
			-height,
			0,
		}
		local scroll_height = 0

		self._additional_widgets, self._additional_widgets_by_name, scroll_height = additional_info_definitions.setup(scroll_area_scenegraph_id, base_offset)

		local optional_scroll_area_hotspot_widget
		local enable_auto_scroll = true

		self._scrollbar = ScrollbarUI:new(self._ui_scenegraph, scroll_area_scenegraph_id, scroll_area_anchor_scenegraph_id, scroll_height, enable_auto_scroll, optional_scroll_area_hotspot_widget)
	else
		table.clear(self._additional_widgets)
		table.clear(self._additional_widgets_by_name)

		if self._scrollbar then
			self._scrollbar:destroy(self._ui_scenegraph)
		end

		self._scrollbar = nil
	end
end

HeroWindowTalentsConsole._animate_pulse = function (self, target, target_index, from, to, speed)
	local new_animation = UIAnimation.init(UIAnimation.pulse_animation, target, target_index, from, to, speed)

	return new_animation
end

HeroWindowTalentsConsole._set_talent_tooltip = function (self, talent, selected, locked)
	local widgets_by_name = self._widgets_by_name
	local title_widget = widgets_by_name.tooltip_title
	local description_widget = widgets_by_name.tooltip_description
	local info_widget = widgets_by_name.tooltip_info
	local display_name = Localize(talent.name)
	local description = UIUtils.get_talent_description(talent)
	local requirement_text, information_text

	if locked then
		requirement_text = Localize("talent_locked_desc")
	elseif not selected then
		-- Nothing
	end

	title_widget.content.text = display_name
	description_widget.content.text = description
	info_widget.content.text = requirement_text or information_text or ""
end

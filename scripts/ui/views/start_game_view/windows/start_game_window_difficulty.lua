-- chunkname: @scripts/ui/views/start_game_view/windows/start_game_window_difficulty.lua

local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_difficulty_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local create_difficulty_button = definitions.create_difficulty_button
local create_dlc_difficulty_divider = definitions.create_dlc_difficulty_divider
local animation_definitions = definitions.animation_definitions
local STARTING_DIFFICULTY_INDEX = 1

StartGameWindowDifficulty = class(StartGameWindowDifficulty)
StartGameWindowDifficulty.NAME = "StartGameWindowDifficulty"

StartGameWindowDifficulty.on_enter = function (self, params, offset)
	print("[StartGameWindow] Enter Substate StartGameWindowDifficulty")

	self.parent = params.parent

	local ingame_ui_context = params.ingame_ui_context

	self.ui_renderer = ingame_ui_context.ui_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.statistics_db = ingame_ui_context.statistics_db
	self.render_settings = {
		snap_pixel_positions = true,
	}
	self._has_exited = false

	local player_manager = Managers.player
	local local_player = player_manager:local_player()

	self._stats_id = local_player:stats_id()
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self._animations = {}

	self:create_ui_elements(params, offset)
	self:_setup_difficulties()

	local difficulty_key = self.parent:get_difficulty_option() or Managers.state.difficulty:get_difficulty()

	self:_update_selected_difficulty_option(difficulty_key)
	self.parent:set_input_description("select_difficulty")
end

StartGameWindowDifficulty.create_ui_elements = function (self, params, offset)
	local ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	self.ui_scenegraph = ui_scenegraph

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

	self.ui_animator = UIAnimator:new(ui_scenegraph, animation_definitions)

	if offset then
		local window_position = ui_scenegraph.window.local_position

		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end
end

StartGameWindowDifficulty._setup_difficulties = function (self)
	local difficulty_widgets = {}
	local dlc_difficulty_widgets = {}
	local difficulties = self:_get_difficulty_options()
	local widgets = self._widgets
	local widgets_by_name = self._widgets_by_name
	local widget_index_counter = 1
	local widget_prefix = "difficulty_option_"
	local spacing = 16
	local scenegraph_id = "difficulty_option"
	local size = scenegraph_definition[scenegraph_id].size
	local widget_definition = create_difficulty_button(scenegraph_id, size)
	local current_offset = 0
	local dlc_difficulties = {}

	for i = STARTING_DIFFICULTY_INDEX, #difficulties do
		local difficulty_key = difficulties[i]
		local difficulty_settings = DifficultySettings[difficulty_key]

		if difficulty_settings.dlc_requirement then
			dlc_difficulties[#dlc_difficulties + 1] = difficulty_key
		else
			local display_name = difficulty_settings.display_name
			local display_image = difficulty_settings.display_image
			local widget = UIWidget.init(widget_definition)
			local widget_name = widget_prefix .. widget_index_counter

			widgets_by_name[widget_name] = widget
			widgets[#widgets + 1] = widget
			difficulty_widgets[#difficulty_widgets + 1] = widget

			local offset = widget.offset
			local content = widget.content

			content.difficulty_key = difficulty_key
			content.title_text = Localize(display_name)
			content.icon = display_image
			offset[2] = current_offset
			current_offset = current_offset - (size[2] + spacing)
			widget_index_counter = widget_index_counter + 1
		end
	end

	self.ui_scenegraph.game_options_left_chain.size[2] = math.abs(current_offset) - spacing
	self.ui_scenegraph.game_options_right_chain.size[2] = math.abs(current_offset) - spacing

	if #dlc_difficulties > 0 then
		local scenegraph_id = "dlc_difficulty_divider"
		local difficulty_divider_widget = UIWidget.init(create_dlc_difficulty_divider("divider_01_top", scenegraph_id))

		widgets_by_name.dlc_difficulty_divider = difficulty_divider_widget
		widgets[#widgets + 1] = difficulty_divider_widget
		difficulty_divider_widget.style.texture_id.offset[2] = current_offset + size[2] * 0.5 + spacing * 1.5
		current_offset = current_offset - size[2] + spacing * 2

		local scenegraph_id = "difficulty_option"
		local size = scenegraph_definition[scenegraph_id].size

		for _, difficulty_key in ipairs(dlc_difficulties) do
			local difficulty_settings = DifficultySettings[difficulty_key]
			local display_name = difficulty_settings.display_name
			local display_image = difficulty_settings.display_image
			local dlc_key = difficulty_settings.dlc_requirement
			local dlc_locked = not Managers.unlock:is_dlc_unlocked(dlc_key)
			local difficulty_button_textures = difficulty_settings.button_textures
			local widget_definition = create_difficulty_button(scenegraph_id, size, difficulty_button_textures.lit_texture, difficulty_button_textures.unlit_texture, difficulty_button_textures.background, dlc_locked)
			local widget = UIWidget.init(widget_definition)
			local widget_name = widget_prefix .. widget_index_counter

			widgets_by_name[widget_name] = widget
			widgets[#widgets + 1] = widget
			difficulty_widgets[#difficulty_widgets + 1] = widget

			local offset = widget.offset
			local content = widget.content

			content.difficulty_key = difficulty_key
			content.title_text = Localize(display_name)
			content.icon = display_image
			offset[2] = current_offset
			current_offset = current_offset - (size[2] + spacing)
		end
	end

	self._difficulty_widgets = difficulty_widgets
end

StartGameWindowDifficulty._get_difficulty_options = function (self)
	return Managers.state.difficulty:get_default_difficulties()
end

StartGameWindowDifficulty.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowDifficulty")

	self.ui_animator = nil

	self.parent:set_input_description(nil)

	self._has_exited = true
end

StartGameWindowDifficulty.update = function (self, dt, t)
	self:_update_animations(dt)
	self:_handle_input(dt, t)
	self:_update_difficulty_lock()
	self:draw(dt)
end

StartGameWindowDifficulty.post_update = function (self, dt, t)
	return
end

StartGameWindowDifficulty._update_animations = function (self, dt)
	local ui_animator = self.ui_animator

	ui_animator:update(dt)

	local animations = self._animations

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	local difficulty_widgets = self._difficulty_widgets

	for i = 1, #difficulty_widgets do
		local widget = difficulty_widgets[i]

		self:_animate_difficulty_option_button(widget, dt)
	end
end

StartGameWindowDifficulty._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_pressed then
		hotspot.on_pressed = false

		return true
	end
end

StartGameWindowDifficulty._is_button_released = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StartGameWindowDifficulty._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter and not hotspot.is_selected
end

StartGameWindowDifficulty._handle_input = function (self, dt, t)
	local difficulty_widgets = self._difficulty_widgets

	for i = 1, #difficulty_widgets do
		local widget = difficulty_widgets[i]

		if self:_is_button_hover_enter(widget) then
			self:_play_sound("play_gui_lobby_button_01_difficulty_select_hover")
		end

		if self:_is_button_pressed(widget) then
			local content = widget.content
			local difficulty_key = content.difficulty_key

			self:_update_selected_difficulty_option(difficulty_key)

			local difficulties_select_sounds = UISettings.difficulties_select_sounds
			local sound_event = difficulties_select_sounds[i] or difficulties_select_sounds[#difficulties_select_sounds]

			self:_play_sound(sound_event)
		end
	end

	local widgets_by_name = self._widgets_by_name
	local select_button = widgets_by_name.select_button

	UIWidgetUtils.animate_default_button(select_button, dt)

	local widgets_by_name = self._widgets_by_name
	local buy_button = widgets_by_name.buy_button

	UIWidgetUtils.animate_default_button(buy_button, dt)

	local parent = self.parent

	if self:_is_button_hover_enter(select_button) then
		self:_play_sound("play_gui_lobby_button_01_difficulty_confirm_hover")
	end

	if self:_is_button_hover_enter(buy_button) then
		self:_play_sound("play_gui_lobby_button_01_difficulty_confirm_hover")
	end

	if self:_is_button_released(select_button) then
		if self._selected_difficulty_key then
			parent:set_difficulty_option(self._selected_difficulty_key)
			self:_play_sound("play_gui_lobby_button_01_difficulty_confirm_click")
		end

		local game_mode_layout_name = parent:get_selected_game_mode_layout_name()

		parent:set_layout_by_name(game_mode_layout_name)
	elseif self:_is_button_released(buy_button) then
		local dlc_name = buy_button.content.dlc_name
		local area_settings = AreaSettings[dlc_name]
		local store_page_url = area_settings.store_page_url

		self:_show_storepage(store_page_url)
	end
end

StartGameWindowDifficulty._set_selected_difficulty_option = function (self, new_difficulty_key)
	local difficulty_widgets = self._difficulty_widgets

	for i = 1, #difficulty_widgets do
		local widget = difficulty_widgets[i]
		local content = widget.content
		local difficulty_key = content.difficulty_key
		local is_selected = difficulty_key == new_difficulty_key

		content.button_hotspot.is_selected = is_selected
	end
end

StartGameWindowDifficulty._set_info_window = function (self, difficulty_key)
	local difficulty_settings = DifficultySettings[difficulty_key]
	local description = difficulty_settings.description
	local display_name = difficulty_settings.display_name
	local display_image = difficulty_settings.display_image
	local xp_multiplier_number = difficulty_settings.xp_multiplier
	local chest_max_powerlevel = difficulty_settings.max_chest_power_level
	local widgets_by_name = self._widgets_by_name

	widgets_by_name.difficulty_title.content.text = Localize(display_name)
	widgets_by_name.difficulty_texture.content.texture_id = display_image
	widgets_by_name.description_text.content.text = Localize(description)
	widgets_by_name.difficulty_chest_info.content.text = Localize("difficulty_chest_max_powerlevel") .. ": " .. tostring(chest_max_powerlevel)
end

StartGameWindowDifficulty._update_difficulty_lock = function (self)
	local widgets_by_name = self._widgets_by_name
	local select_button = widgets_by_name.select_button
	local buy_button = widgets_by_name.buy_button
	local extreme_difficulty_bg = widgets_by_name.extreme_difficulty_bg
	local extremely_hard_text = widgets_by_name.extremely_hard_text
	local dlc_lock_text = widgets_by_name.dlc_lock_text
	local selected_difficulty_key = self._selected_difficulty_key

	if selected_difficulty_key then
		local difficulty_settings = DifficultySettings[selected_difficulty_key]
		local approved, extra_requirement_failed, dlc_locked, below_power_level = self.parent:is_difficulty_approved(selected_difficulty_key)

		if not approved then
			if dlc_locked then
				buy_button.content.button_hotspot.disable_button = false
				buy_button.content.visible = true
				buy_button.content.dlc_name = dlc_locked
				select_button.content.visible = false
				dlc_lock_text.content.visible = true
			else
				buy_button.content.button_hotspot.disable_button = true
				buy_button.content.visible = false
				buy_button.content.dlc_name = nil
				select_button.content.visible = true
				dlc_lock_text.content.visible = false
			end

			select_button.content.button_hotspot.disable_button = true

			if below_power_level or extra_requirement_failed then
				widgets_by_name.difficulty_is_locked_text.content.text = Localize("required_power_level_not_met_in_party")

				if below_power_level then
					local required_power_level = difficulty_settings.required_power_level
					local difficulty_lock_text = Localize("required_power_level")

					widgets_by_name.difficulty_lock_text.content.text = string.format("%s: %s", difficulty_lock_text, tostring(UIUtils.presentable_hero_power_level(required_power_level)))
					widgets_by_name.difficulty_second_lock_text.content.text = extra_requirement_failed and Localize(extra_requirement_failed) or ""
				else
					widgets_by_name.difficulty_lock_text.content.text = extra_requirement_failed and Localize(extra_requirement_failed) or ""
				end
			end

			if not self._has_exited then
				self.parent:set_input_description(nil)
			end
		else
			select_button.content.button_hotspot.disable_button = false
			select_button.content.visible = true
			buy_button.content.button_hotspot.disable_button = true
			buy_button.content.visible = false
			buy_button.content.dlc_name = nil
			dlc_lock_text.content.visible = false
			widgets_by_name.difficulty_lock_text.content.text = ""
			widgets_by_name.difficulty_second_lock_text.content.text = ""
			widgets_by_name.difficulty_is_locked_text.content.text = ""

			if not self._has_exited then
				self.parent:set_input_description("select_difficulty")
			end
		end

		extreme_difficulty_bg.content.visible = difficulty_settings.show_warning or false
		extremely_hard_text.content.visible = difficulty_settings.show_warning or false
	else
		select_button.content.button_hotspot.disable_button = true
		buy_button.content.button_hotspot.disable_button = true
		buy_button.content.visible = false
		buy_button.content.dlc_name = nil
		extreme_difficulty_bg.content.visible = false
		extremely_hard_text.content.visible = false
		dlc_lock_text.content.visible = false

		if not self._has_exited then
			self.parent:set_input_description(nil)
		end
	end
end

StartGameWindowDifficulty._update_selected_difficulty_option = function (self, difficulty_key)
	difficulty_key = difficulty_key or Managers.state.difficulty:get_difficulty()

	if difficulty_key ~= self._selected_difficulty_key then
		self:_set_selected_difficulty_option(difficulty_key)

		self._selected_difficulty_key = difficulty_key

		self:_set_info_window(difficulty_key)
	end
end

StartGameWindowDifficulty.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	local widgets = self._widgets

	for i = 1, #widgets do
		local widget = widgets[i]

		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)
end

StartGameWindowDifficulty._play_sound = function (self, event)
	self.parent:play_sound(event)
end

StartGameWindowDifficulty._animate_difficulty_option_button = function (self, widget, dt)
	local content = widget.content
	local style = widget.style
	local hotspot = content.button_hotspot
	local has_focus = content.has_focus
	local is_hover = hotspot.is_hover or has_focus
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
	local input_alpha = 255 * input_progress

	style.button_clicked_rect.color[1] = 100 * input_progress
	style.hover_glow.color[1] = 255 * combined_progress

	local select_alpha = 255 * selection_progress

	style.select_glow.color[1] = select_alpha
	style.skull_select_glow.color[1] = select_alpha
	style.icon_bg_glow.color[1] = select_alpha

	local text_disabled_style = style.title_text_disabled
	local disabled_default_text_color = text_disabled_style.default_text_color
	local disabled_text_color = text_disabled_style.text_color

	disabled_text_color[2] = disabled_default_text_color[2] * 0.4
	disabled_text_color[3] = disabled_default_text_color[3] * 0.4
	disabled_text_color[4] = disabled_default_text_color[4] * 0.4

	local title_text_style = style.title_text
	local title_text_color = title_text_style.text_color
	local default_text_color = title_text_style.default_text_color
	local select_text_color = title_text_style.select_text_color

	Colors.lerp_color_tables(default_text_color, select_text_color, combined_progress, title_text_color)

	local icon_color = style.icon.color

	icon_color[2] = title_text_color[2]
	icon_color[3] = title_text_color[3]
	icon_color[4] = title_text_color[4]

	local background_icon_style = style.background_icon
	local background_icon_color = background_icon_style.color
	local background_icon_default_color = background_icon_style.default_color

	background_icon_color[2] = background_icon_default_color[2] + combined_progress * (255 - background_icon_default_color[2])
	background_icon_color[3] = background_icon_default_color[3] + combined_progress * (255 - background_icon_default_color[3])
	background_icon_color[4] = background_icon_default_color[4] + combined_progress * (255 - background_icon_default_color[4])
	hotspot.hover_progress = hover_progress
	hotspot.input_progress = input_progress
	hotspot.selection_progress = selection_progress
end

StartGameWindowDifficulty._show_storepage = function (self, store_page_url)
	local platform = PLATFORM

	if IS_WINDOWS and rawget(_G, "Steam") then
		Steam.open_url(store_page_url)
	end
end

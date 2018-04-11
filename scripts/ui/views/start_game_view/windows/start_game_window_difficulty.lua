local definitions = local_require("scripts/ui/views/start_game_view/windows/definitions/start_game_window_difficulty_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local DO_RELOAD = false
local STARTING_DIFFICULTY_INDEX = 1
local DEBUG_NUM_VISIBLE_DIFFICULTIES = nil
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
		snap_pixel_positions = true
	}
	local player_manager = Managers.player
	local local_player = player_manager.local_player(player_manager)
	self._stats_id = local_player.stats_id(local_player)
	self.player_manager = player_manager
	self.peer_id = ingame_ui_context.peer_id
	self._animations = {}

	self.create_ui_elements(self, params, offset)
	self._setup_difficulties(self)

	local difficulty_key = self.parent:get_difficulty_option() or Managers.state.difficulty:get_difficulty()

	self._update_selected_difficulty_option(self, difficulty_key)

	return 
end
StartGameWindowDifficulty.create_ui_elements = function (self, params, offset)
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

	if offset then
		local window_position = self.ui_scenegraph.window.local_position
		window_position[1] = window_position[1] + offset[1]
		window_position[2] = window_position[2] + offset[2]
		window_position[3] = window_position[3] + offset[3]
	end

	return 
end
StartGameWindowDifficulty._setup_difficulties = function (self)
	local difficulties = self._get_difficulty_options(self)
	local widgets_by_name = self._widgets_by_name
	local widget_index_counter = 1
	local widget_prefix = "difficulty_option_"

	for i = STARTING_DIFFICULTY_INDEX, #difficulties, 1 do
		local difficulty_key = difficulties[i]
		local difficulty_settings = DifficultySettings[difficulty_key]
		local display_name = difficulty_settings.display_name
		local display_image = difficulty_settings.display_image
		local widget_name = widget_prefix .. widget_index_counter
		local widget = widgets_by_name[widget_name]
		local content = widget.content
		content.difficulty_key = difficulty_key
		content.title_text = Localize(display_name)
		content.icon = display_image

		if DEBUG_NUM_VISIBLE_DIFFICULTIES then
			content.visible = i <= DEBUG_NUM_VISIBLE_DIFFICULTIES
		end

		widget_index_counter = widget_index_counter + 1
	end

	return 
end
StartGameWindowDifficulty._get_difficulty_options = function (self)
	return Managers.state.difficulty:get_level_difficulties()
end
StartGameWindowDifficulty.on_exit = function (self, params)
	print("[StartGameWindow] Exit Substate StartGameWindowDifficulty")

	self.ui_animator = nil

	return 
end
StartGameWindowDifficulty.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self.create_ui_elements(self)
	end

	self._update_animations(self, dt)
	self._handle_input(self, dt, t)
	self._update_difficulty_lock(self)
	self.draw(self, dt)

	return 
end
StartGameWindowDifficulty.post_update = function (self, dt, t)
	return 
end
StartGameWindowDifficulty._update_animations = function (self, dt)
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

	self._animate_difficulty_option_button(self, widgets_by_name.difficulty_option_1, dt)
	self._animate_difficulty_option_button(self, widgets_by_name.difficulty_option_2, dt)
	self._animate_difficulty_option_button(self, widgets_by_name.difficulty_option_3, dt)
	self._animate_difficulty_option_button(self, widgets_by_name.difficulty_option_4, dt)

	return 
end
StartGameWindowDifficulty._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_pressed then
		hotspot.on_pressed = false

		return true
	end

	return 
end
StartGameWindowDifficulty._is_button_released = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end

	return 
end
StartGameWindowDifficulty._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter and not hotspot.is_selected
end
StartGameWindowDifficulty._is_stepper_button_pressed = function (self, widget)
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

	return 
end
local difficulties_select_sounds = {
	"play_gui_lobby_button_01_difficulty_select_normal",
	"play_gui_lobby_button_01_difficulty_select_hard",
	"play_gui_lobby_button_01_difficulty_select_nightmare",
	"play_gui_lobby_button_01_difficulty_select_cataclysm"
}
StartGameWindowDifficulty._handle_input = function (self, dt, t)
	local widgets_by_name = self._widgets_by_name
	local widget_prefix = "difficulty_option_"

	for i = 1, 4, 1 do
		local widget_name = widget_prefix .. i
		local widget = widgets_by_name[widget_name]

		if self._is_button_hover_enter(self, widget) then
			self._play_sound(self, "play_gui_lobby_button_01_difficulty_select_hover")
		end

		if self._is_button_pressed(self, widget) then
			local content = widget.content
			local difficulty_key = content.difficulty_key

			self._update_selected_difficulty_option(self, difficulty_key)

			local sound_event = difficulties_select_sounds[i]

			self._play_sound(self, sound_event)
		end
	end

	local select_button = widgets_by_name.select_button

	UIWidgetUtils.animate_default_button(select_button, dt)

	local parent = self.parent

	if self._is_button_hover_enter(self, select_button) then
		self._play_sound(self, "play_gui_lobby_button_01_difficulty_confirm_hover")
	end

	if self._is_button_released(self, select_button) then
		if self._selected_difficulty_key then
			parent.set_difficulty_option(parent, self._selected_difficulty_key)
			self._play_sound(self, "play_gui_lobby_button_01_difficulty_confirm_click")
		end

		local previous_game_mode_index = parent.get_previous_selected_game_mode_index(parent)

		parent.set_layout(parent, previous_game_mode_index)
	end

	return 
end
StartGameWindowDifficulty._set_selected_difficulty_option = function (self, new_difficulty_key)
	local difficulties = self._get_difficulty_options(self)
	local widgets_by_name = self._widgets_by_name
	local widget_index_counter = 1
	local widget_prefix = "difficulty_option_"

	for i = STARTING_DIFFICULTY_INDEX, #difficulties, 1 do
		local difficulty_key = difficulties[i]
		local widget_name = widget_prefix .. widget_index_counter
		local widget = widgets_by_name[widget_name]
		local content = widget.content
		content.button_hotspot.is_selected = difficulty_key == new_difficulty_key
		widget_index_counter = widget_index_counter + 1
	end

	return 
end
StartGameWindowDifficulty._set_info_window = function (self, difficulty_key)
	local widgets_by_name = self._widgets_by_name
	local difficulty_settings = DifficultySettings[difficulty_key]
	local description = difficulty_settings.description
	local display_name = difficulty_settings.display_name
	local display_image = difficulty_settings.display_image
	local xp_multiplier_number = difficulty_settings.xp_multiplier
	local chest_max_powerlevel = difficulty_settings.max_chest_power_level
	widgets_by_name.difficulty_title.content.text = Localize(display_name)
	widgets_by_name.difficulty_texture.content.texture_id = display_image
	widgets_by_name.description_text.content.text = Localize(description)
	widgets_by_name.difficulty_chest_info.content.text = Localize("difficulty_chest_max_powerlevel") .. ": " .. tostring(chest_max_powerlevel)
	widgets_by_name.xp_multiplier.content.text = Localize("difficulty_xp_multiplier") .. ": " .. tostring(xp_multiplier_number * 100) .. "%"

	return 
end
StartGameWindowDifficulty._update_difficulty_lock = function (self)
	local difficulties = self._get_difficulty_options(self)
	local widgets_by_name = self._widgets_by_name
	local select_button = widgets_by_name.select_button
	local selected_difficulty_key = self._selected_difficulty_key

	if selected_difficulty_key then
		local approved = self.parent:is_difficulty_approved(selected_difficulty_key)

		if not approved then
			select_button.content.button_hotspot.disable_button = true
			local difficulty_settings = DifficultySettings[selected_difficulty_key]
			local required_power_level = difficulty_settings.required_power_level
			local difficulty_lock_text = Localize("required_power_level")
			widgets_by_name.difficulty_lock_text.content.text = string.format("%s: %s", difficulty_lock_text, tostring(UIUtils.presentable_hero_power_level(required_power_level)))
			widgets_by_name.difficulty_is_locked_text.content.text = Localize("required_power_level_not_met_in_party")
		else
			select_button.content.button_hotspot.disable_button = false
			widgets_by_name.difficulty_lock_text.content.text = ""
			widgets_by_name.difficulty_is_locked_text.content.text = ""
		end
	else
		select_button.content.button_hotspot.disable_button = true
	end

	return 
end
StartGameWindowDifficulty._set_blocking_peers = function (self, players_below_power_level)
	local ui_renderer = self.ui_renderer
	local blocking_peers = self._widgets_by_name.blocking_peers
	local blocking_peers_style = blocking_peers.style
	local num_players_below_power_level = #players_below_power_level
	local width = definitions.scenegraph_definition.blocking_peers.size[1]
	local text_width = width / num_players_below_power_level
	local text = "(%s"

	for i = 1, num_players_below_power_level, 1 do
		local player = players_below_power_level[i]
		local player_name = UIRenderer.crop_text_width(ui_renderer, player.name(player), text_width, blocking_peers_style.text)
		text = string.format(text, player_name)

		if players_below_power_level[i + 1] == nil then
			text = string.format("%s)", text)
		else
			text = text .. ", %s"
		end
	end

	if num_players_below_power_level == 0 then
		text = ""
	end

	return 
end
StartGameWindowDifficulty._update_selected_difficulty_option = function (self, difficulty_key)
	local parent = self.parent
	local difficulty_key = difficulty_key or Managers.state.difficulty:get_difficulty()

	if difficulty_key ~= self._selected_difficulty_key then
		self._set_selected_difficulty_option(self, difficulty_key)

		self._selected_difficulty_key = difficulty_key

		self._set_info_window(self, difficulty_key)
	end

	return 
end
StartGameWindowDifficulty.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.parent:window_input_service()

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	local active_node_widgets = self._active_node_widgets

	if active_node_widgets then
		for _, widget in ipairs(active_node_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_renderer)

	return 
end
StartGameWindowDifficulty._play_sound = function (self, event)
	self.parent:play_sound(event)

	return 
end
StartGameWindowDifficulty._animate_difficulty_option_button = function (self, widget, dt)
	local ui_renderer = self.ui_renderer
	local scenegraph_id = widget.scenegraph_id
	local content = widget.content
	local style = widget.style
	local hotspot = content.button_hotspot
	local is_hover = hotspot.is_hover
	local hover_progress = hotspot.hover_progress or 0
	local image_hover_progress = hotspot.image_hover_progress or 0
	local image_select_progress = hotspot.image_select_progress or 0
	local image_speed = 6
	local speed = 8

	if is_hover then
		hover_progress = math.min(hover_progress + dt * speed, 1)
		image_hover_progress = math.min(image_hover_progress + dt * image_speed, 1)
	else
		hover_progress = math.max(hover_progress - dt * speed, 0)
		image_hover_progress = math.max(image_hover_progress - dt * image_speed, 0)
	end

	local hover_easing_out_progress = math.easeOutCubic(hover_progress)
	local hover_easing_in_progress = math.easeInCubic(hover_progress)
	local image_hover_easing_out_progress = math.easeOutCubic(image_hover_progress)
	local image_hover_easing_in_progress = math.easeInCubic(image_hover_progress)
	local is_selected = hotspot.is_selected
	local selection_progress = hotspot.selection_progress or 0
	local speed = 10

	if is_selected then
		selection_progress = math.min(selection_progress + dt * speed, 1)
		image_select_progress = math.min(image_select_progress + dt * image_speed, 1)
	else
		selection_progress = math.max(selection_progress - dt * speed, 0)
		image_select_progress = math.max(image_select_progress - dt * image_speed, 0)
	end

	local select_easing_out_progress = math.easeOutCubic(selection_progress)
	local select_easing_in_progress = math.easeInCubic(selection_progress)
	local combined_image_progress = math.max(image_hover_progress, image_select_progress)
	local combined_progress = math.max(hover_progress, selection_progress)
	local combined_out_progress = math.max(select_easing_out_progress, hover_easing_out_progress)
	local combined_in_progress = math.max(hover_easing_in_progress, select_easing_in_progress)
	local alpha = 255 * hover_easing_out_progress
	local text_style = style.title_text
	local default_text_color = text_style.default_text_color
	local text_color = text_style.text_color
	local text_disabled_style = style.title_text_disabled
	local disabled_default_text_color = text_disabled_style.default_text_color
	local disabled_text_color = text_disabled_style.text_color
	disabled_text_color[2] = disabled_default_text_color[2] * 0.4
	disabled_text_color[3] = disabled_default_text_color[3] * 0.4
	disabled_text_color[4] = disabled_default_text_color[4] * 0.4
	widget.snap_pixel_positions = combined_progress == 0 or combined_progress == 1 or combined_image_progress == 0 or combined_image_progress == 1
	hotspot.hover_progress = hover_progress
	hotspot.image_hover_progress = image_hover_progress
	hotspot.image_select_progress = image_select_progress
	hotspot.selection_progress = selection_progress
	local title_text_style = style.title_text
	local title_text_color = title_text_style.text_color
	local title_default_text_color = title_text_style.default_text_color
	title_text_color[2] = title_default_text_color[2] * 0.6 + combined_progress * title_default_text_color[2] * 0.4
	title_text_color[3] = title_default_text_color[3] * 0.6 + combined_progress * title_default_text_color[3] * 0.4
	title_text_color[4] = title_default_text_color[4] * 0.6 + combined_progress * title_default_text_color[4] * 0.4
	local icon_style = style.icon
	local icon_color = icon_style.color
	icon_color[2] = 153 + combined_progress * 102
	icon_color[3] = 153 + combined_progress * 102
	icon_color[4] = 153 + combined_progress * 102
	local background_style = style.background
	local background_color = background_style.color
	background_color[2] = 153 + combined_progress * 102
	background_color[3] = 153 + combined_progress * 102
	background_color[4] = 153 + combined_progress * 102
	local select_style = style.select
	local select_color = select_style.color
	select_color[2] = select_easing_out_progress * 255
	select_color[3] = select_easing_out_progress * 255
	select_color[4] = select_easing_out_progress * 255
	local icon_glow_style = style.icon_glow
	local icon_glow_color = icon_glow_style.color
	icon_glow_color[2] = combined_progress * 255
	icon_glow_color[3] = combined_progress * 255
	icon_glow_color[4] = combined_progress * 255

	return 
end
StartGameWindowDifficulty._get_text_height = function (self, ui_renderer, size, ui_style, text, ui_style_global)
	local widget_scale = nil

	if ui_style_global then
		widget_scale = ui_style_global.scale
	end

	local font_material, font_size, font_name = nil

	if ui_style.font_type then
		local font, size_of_font = UIFontByResolution(ui_style, widget_scale)
		font_name = font[3]
		font_size = font[2]
		font_material = font[1]
		font_size = size_of_font
	else
		local font = ui_style.font
		font_name = font[3]
		font_size = font[2]
		font_material = font[1]

		if not ui_style.font_size then
		end
	end

	if ui_style.localize then
		text = Localize(text)
	end

	local font_height, font_min, font_max = UIGetFontHeight(ui_renderer.gui, font_name, font_size)
	local texts = UIRenderer.word_wrap(ui_renderer, text, font_material, font_size, size[1])
	local text_start_index = 1
	local max_texts = #texts
	local num_texts = math.min(#texts - text_start_index - 1, max_texts)
	local inv_scale = RESOLUTION_LOOKUP.inv_scale
	local full_font_height = (font_max + math.abs(font_min)) * inv_scale * num_texts

	return full_font_height
end

return 

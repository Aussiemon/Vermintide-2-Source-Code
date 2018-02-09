-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
local definitions = local_require("scripts/ui/views/hero_view/windows/definitions/hero_window_talents_definitions")
local widget_definitions = definitions.widgets
local scenegraph_definition = definitions.scenegraph_definition
local animation_definitions = definitions.animation_definitions
local DO_RELOAD = false
HeroWindowTalents = class(HeroWindowTalents)
HeroWindowTalents.NAME = "HeroWindowTalents"
HeroWindowTalents.on_enter = function (self, params, offset)
	print("[HeroViewWindow] Enter Substate HeroWindowTalents")

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
	self.player = local_player
	self.peer_id = ingame_ui_context.peer_id
	self._animations = {}

	self.create_ui_elements(self, params, offset)

	self.hero_name = params.hero_name
	self.career_index = params.career_index
	local profile_index = FindProfileIndex(self.hero_name)
	self._career_name = SPProfiles[profile_index].careers[self.career_index].name
	local experience = ExperienceSettings.get_experience(self.hero_name)
	self.hero_level = ExperienceSettings.get_level(experience)

	self._initialize_talents(self)

	return 
end
HeroWindowTalents.on_exit = function (self, params)
	print("[HeroViewWindow] Exit Substate HeroWindowTalents")

	self.ui_animator = nil
	local talent_interface = self._talent_interface
	local career_name = self._career_name

	talent_interface.set_talents(talent_interface, career_name, self._selected_talents)

	local player = self.player
	local player_unit = player.player_unit

	if Unit.alive(player_unit) then
		local talent_extension = ScriptUnit.extension(player_unit, "talent_system")

		talent_extension.talents_changed(talent_extension)

		local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")

		inventory_extension.apply_buffs_to_ammo(inventory_extension)
	end

	return 
end
HeroWindowTalents.create_ui_elements = function (self, params, offset)
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
HeroWindowTalents._initialize_talents = function (self)
	local career_name = self._career_name
	local talent_interface = Managers.backend:get_interface("talents")
	local current_talents = talent_interface.get_talents(talent_interface, career_name)
	self._selected_talents = table.clone(current_talents)
	self._talent_interface = talent_interface

	self._update_talent_sync(self, true)

	self._initialized = true

	return 
end
HeroWindowTalents.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self.create_ui_elements(self)
	end

	self._update_animations(self, dt)
	self._handle_input(self, dt, t)
	self.draw(self, dt)

	return 
end
HeroWindowTalents.post_update = function (self, dt, t)
	return 
end
HeroWindowTalents._update_talent_sync = function (self, initialize)
	self._populate_talents_by_hero(self, initialize)
	self._populate_career_info(self, initialize)

	return 
end
HeroWindowTalents._update_animations = function (self, dt)
	self.ui_animator:update(dt)

	local animations = self._animations
	local ui_animator = self.ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator.is_animation_completed(ui_animator, animation_id) then
			ui_animator.stop_animation(ui_animator, animation_id)

			animations[animation_name] = nil
		end
	end

	return 
end
HeroWindowTalents._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_pressed then
		hotspot.on_pressed = false

		return true
	end

	return 
end
HeroWindowTalents._is_button_released = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end

	return 
end
HeroWindowTalents._is_stepper_button_pressed = function (self, widget)
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
HeroWindowTalents._handle_input = function (self, dt, t)
	local parent = self.parent
	local widgets_by_name = self._widgets_by_name

	if self._is_talent_hovered(self) then
		self._play_sound(self, "play_gui_talents_selection_hover")
	end

	if self._is_disabled_talent_hovered(self) then
		self._play_sound(self, "play_gui_talents_selection_hover_disabled")
	end

	local row, column = self._is_talent_pressed(self)

	if row and column then
		self._selected_talents[row] = column

		self._play_sound(self, "play_gui_talents_selection_click")
		self._update_talent_sync(self)
	end

	return 
end
HeroWindowTalents.draw = function (self, dt)
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
HeroWindowTalents._play_sound = function (self, event)
	self.parent:play_sound(event)

	return 
end
HeroWindowTalents._get_text_height = function (self, ui_renderer, size, ui_style, text, ui_style_global)
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
	local full_font_height = (font_max + math.abs(font_min))*inv_scale*num_texts

	return full_font_height
end
HeroWindowTalents._populate_talents_by_hero = function (self, initialize)
	self._clear_talents(self)

	local widgets_by_name = self._widgets_by_name
	local hero_name = self.hero_name
	local career_index = self.career_index
	local profile_index = FindProfileIndex(hero_name)
	local profile = SPProfiles[profile_index]
	local career_settings = profile.careers[career_index]
	local start_index = (career_index - 1)*NumTalentRows
	local tree = TalentTrees[hero_name][career_settings.talent_tree_index]
	local talents = self._selected_talents
	local all_talents = Talents[hero_name]

	for i = 1, NumTalentRows, 1 do
		local widget = widgets_by_name["talent_row_" .. i]
		local content = widget.content
		local style = widget.style
		local selected_column = talents[i]
		local no_talent_selected = not selected_column or selected_column == 0
		local unlock_name = "talent_point_" .. i
		local talent_unlock_level = TalentUnlockLevels[unlock_name]
		local row_unlocked = ProgressionUnlocks.is_unlocked(unlock_name, self.hero_level)
		local level_text_color = (row_unlocked and Colors.get_color_table_with_alpha("green", 255)) or Colors.get_color_table_with_alpha("red", 255)
		content.level_text = tostring(talent_unlock_level)
		style.level_text.text_color = level_text_color

		if row_unlocked and not no_talent_selected then
			local animations = widget.animations

			table.clear(animations)
		end

		local glow_frame_style = style.glow_frame
		glow_frame_style.color[1] = 0

		if initialize and row_unlocked and no_talent_selected then
			local anim = self._animate_pulse(self, glow_frame_style.color, 1, 255, 100, 2)

			UIWidget.animate(widget, anim)
		end

		for j = 1, NumTalentColumns, 1 do

			-- decompilation error in this vicinity
			local is_selected = selected_column == j
			local talent_name = tree[i][j]
			local id = TalentIDLookup[talent_name]
			local talent_data = all_talents[id]
			local name_suffix = "_" .. tostring(j)
			local icon_name = "icon" .. name_suffix
			local hotspot_name = "hotspot" .. name_suffix
			local title_text_name = "title_text" .. name_suffix
			local background_glow_name = "background_glow" .. name_suffix
			local hotspot = content[hotspot_name]

			if is_selected or (no_talent_selected and row_unlocked) then
				style[icon_name].saturated = false
			else
				style[icon_name].saturated = true
			end

			content[icon_name] = (talent_data and talent_data.icon) or "icons_placeholder"
			content[title_text_name] = (talent_data and Localize(talent_data.name)) or "Undefined"
			hotspot.is_selected = is_selected
			hotspot.talent = talent_data
			hotspot.talent_id = id
			hotspot.disabled = not row_unlocked

			if row_unlocked then
				style[background_glow_name].saturated = false
			else
				style[background_glow_name].saturated = true
			end
		end
	end

	return 
end
HeroWindowTalents._clear_talents = function (self)
	local widgets_by_name = self._widgets_by_name

	for i = 1, NumTalentRows, 1 do
		local widget = widgets_by_name["talent_row_" .. i]
		local content = widget.content
		local style = widget.style

		for j = 1, NumTalentColumns, 1 do
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

	return 
end
HeroWindowTalents._is_talent_pressed = function (self)
	local widgets_by_name = self._widgets_by_name

	for i = 1, NumTalentRows, 1 do
		local widget = widgets_by_name["talent_row_" .. i]
		local content = widget.content

		for j = 1, NumTalentColumns, 1 do
			local name_suffix = "_" .. tostring(j)
			local hotspot_name = "hotspot" .. name_suffix
			local hotspot = content[hotspot_name]

			if hotspot.on_pressed and not hotspot.disabled and not hotspot.is_selected then
				return i, j
			end
		end
	end

	return 
end
HeroWindowTalents._is_talent_hovered = function (self)
	local widgets_by_name = self._widgets_by_name

	for i = 1, NumTalentRows, 1 do
		local widget = widgets_by_name["talent_row_" .. i]
		local content = widget.content

		for j = 1, NumTalentColumns, 1 do
			local name_suffix = "_" .. tostring(j)
			local hotspot_name = "hotspot" .. name_suffix
			local hotspot = content[hotspot_name]

			if hotspot.on_hover_enter and not hotspot.disabled then
				return i, j
			end
		end
	end

	return 
end
HeroWindowTalents._is_disabled_talent_hovered = function (self)
	local widgets_by_name = self._widgets_by_name

	for i = 1, NumTalentRows, 1 do
		local widget = widgets_by_name["talent_row_" .. i]
		local content = widget.content

		for j = 1, NumTalentColumns, 1 do
			local name_suffix = "_" .. tostring(j)
			local hotspot_name = "hotspot" .. name_suffix
			local hotspot = content[hotspot_name]

			if hotspot.on_hover_enter and hotspot.disabled then
				return i, j
			end
		end
	end

	return 
end
HeroWindowTalents._populate_career_info = function (self, initialize)
	local hero_name = self.hero_name
	local career_index = self.career_index
	local profile_index = FindProfileIndex(hero_name)
	local profile = SPProfiles[profile_index]
	local career_settings = profile.careers[career_index]
	local character_selection_image = career_settings.character_selection_image
	local display_name = career_settings.display_name
	local widget_by_name = self._widgets_by_name
	local passive_ability_data = career_settings.passive_ability
	local activated_ability_data = career_settings.activated_ability
	local passive_display_name = passive_ability_data.display_name
	local passive_description = passive_ability_data.description
	local passive_icon = passive_ability_data.icon
	local activated_display_name = activated_ability_data.display_name
	local activated_description = activated_ability_data.description
	local activated_icon = activated_ability_data.icon
	widget_by_name.passive_title_text.content.text = Localize(passive_display_name)
	widget_by_name.passive_description_text.content.text = Localize(passive_description)
	widget_by_name.passive_icon.content.texture_id = passive_icon
	widget_by_name.active_title_text.content.text = Localize(activated_display_name)
	widget_by_name.active_description_text.content.text = Localize(activated_description)
	widget_by_name.active_icon.content.texture_id = activated_icon

	return 
end
HeroWindowTalents._animate_pulse = function (self, target, target_index, from, to, speed)
	local new_animation = UIAnimation.init(UIAnimation.pulse_animation, target, target_index, from, to, speed)

	return new_animation
end

return 

-- chunkname: @scripts/ui/hud_ui/career_help_ui_vs.lua

local definitions = local_require("scripts/ui/hud_ui/career_help_ui_vs_definitions")
local scenegraph_definition = definitions.scenegraph
local widget_definitions = definitions.widgets

CareerHelpUI = class(CareerHelpUI)

local ability_offsets = {
	base = -150,
	center = 0,
}
local header_colors = {
	heroes = Colors.get_color_table_with_alpha("white", 255),
	dark_pact = Colors.get_color_table_with_alpha("white", 255),
}

CareerHelpUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._render_settings = {
		snap_pixel_positions = true,
	}
	self._player_manager = ingame_ui_context.player_manager
	self._profile_synchronizer = ingame_ui_context.profile_synchronizer

	local player = ingame_ui_context.player

	self._player = player
	self._peer_id = player:network_id()
	self._local_player_id = player:local_player_id()
	self._local_player = self._player_manager:local_player()
	self._side = Managers.state.side:get_side_from_player_unique_id(player:unique_id())
	self._gamepad_active = self._input_manager:is_device_active("gamepad")

	self:_create_ui_elements()
end

CareerHelpUI._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	local widgets = {}
	local widgets_by_name = {}

	for name, definition in pairs(widget_definitions) do
		local widget = UIWidget.init(definition)

		widgets_by_name[name] = widget
		widgets[#widgets + 1] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)
end

CareerHelpUI.destroy = function (self)
	return
end

CareerHelpUI._reset_ability_widgets = function (self)
	local widgets_by_name = self._widgets_by_name

	for i = 1, 2 do
		local index_string = tostring(i)
		local ability_info_widget = widgets_by_name["ability_widget_" .. index_string]

		ability_info_widget.content.visible = false
	end

	widgets_by_name.ability_widget_1.offset[1] = ability_offsets.base
end

CareerHelpUI._populate_ability_widget = function (self, index, career_info, widgets_by_name, only_one_ability)
	local gamepad_active = self._input_manager:is_device_active("gamepad")
	local index_string = tostring(index)
	local ability_info_widget = widgets_by_name["ability_widget_" .. index]

	if only_one_ability and index == 1 then
		ability_info_widget.offset[1] = ability_offsets.center
	elseif not only_one_ability and index == 1 then
		ability_info_widget.offset[1] = ability_offsets.base
	end

	ability_info_widget.content.ability_icon = career_info.icon
	ability_info_widget.content.ability_title = career_info.title
	ability_info_widget.content.ability_description = career_info.description
	ability_info_widget.content.ability_type = career_info.ability_type and career_info.ability_type or ""

	local has_keybind = career_info.keybind ~= nil

	if has_keybind then
		ability_info_widget.content.has_keybind = true

		local input = career_info.keybind

		if gamepad_active then
			ability_info_widget.content.key_icon = input.texture

			local size = input.size

			ability_info_widget.style.key_icon.size[1] = size[1]
			ability_info_widget.style.key_icon.size[2] = size[2]
			ability_info_widget.style.key_icon.offset[1] = -size[1] / 2
		else
			ability_info_widget.content.keybind = string.format("[{#color(255,168,0)}%s{#reset()}]", input)
		end
	end

	ability_info_widget.content.visible = true
end

CareerHelpUI._setup_career_info_widget = function (self, profile_index, career_index)
	if not self._should_draw then
		return
	end

	self:_reset_ability_widgets()

	self._incomplete_info = false
	self._current_profile_index = profile_index
	self._current_career_index = career_index

	local is_hero_side = self:_is_hero_side()
	local profile_settings, info_settings, career_settings

	if profile_index and career_index then
		profile_settings = SPProfiles[profile_index]
		career_settings = profile_settings.careers[career_index]
		info_settings = is_hero_side and self:_get_hero_side_info(career_settings) or career_settings.career_info_settings
	end

	if info_settings then
		local widgets_by_name = self._widgets_by_name
		local only_one_ability = #info_settings < 2 and true or false

		for i = 1, #info_settings do
			local info = info_settings[i]

			self:_populate_ability_widget(i, info, widgets_by_name, only_one_ability)
		end

		local player = self._local_player
		local player_level = ExperienceSettings.get_player_level(player)
		local player_level_text = player_level and tostring(player_level) or "-"
		local portrait_image = career_settings.portrait_image
		local portrait_frame = CosmeticUtils.get_cosmetic_slot(player, "slot_frame")
		local portrait_frame_name = portrait_frame and portrait_frame.item_name or "default"

		if not player_level_text then
			self._incomplete_info = true
		end

		self:_create_player_portrait(portrait_frame_name, portrait_image, player_level_text)
		self:_set_career_and_class_text(profile_settings, career_settings)
		self:_set_side_text_color(is_hero_side)
	end

	self._has_info_settings = info_settings ~= nil
end

CareerHelpUI._set_widget_dirty = function (self, widget)
	widget.element.dirty = true
end

CareerHelpUI._update_career_status = function (self)
	local profile_index, career_index = self._profile_synchronizer:profile_by_peer(self._peer_id, self._local_player_id)

	if profile_index ~= self._current_profile_index or career_index ~= self._current_career_index then
		self:_setup_career_info_widget(profile_index, career_index)
	end
end

CareerHelpUI._update_visibility = function (self)
	local should_draw = true
	local input_service = self._input_manager:get_service("Player")
	local held = input_service:get("show_career_help")

	if not held then
		should_draw = false
	end

	if should_draw ~= self._should_draw then
		self._should_draw = should_draw
	end
end

CareerHelpUI.update = function (self, t, dt)
	self:_handle_gamepad()
	self:_update_visibility()
	self:_update_career_status()
	self:_draw(dt)
end

CareerHelpUI._draw = function (self, dt)
	if not self._should_draw then
		return
	end

	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._input_manager:get_service("ingame_menu")
	local render_settings = self._render_settings

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	local player_portrait_widget = self._player_portrait_widget

	if player_portrait_widget then
		UIRenderer.draw_widget(ui_renderer, player_portrait_widget)
	end

	UIRenderer.end_pass(ui_renderer)
end

CareerHelpUI._get_hero_side_info = function (self, career_settings)
	local gamepad_active = self._input_manager:is_device_active("gamepad")
	local info_settings = {}
	local career_skill_data = {}
	local career_name = career_settings.name
	local profile = PROFILES_BY_CAREER_NAMES[career_name]
	local profile_index = profile.index
	local career_index = career_index_from_name(profile_index, career_name)
	local activated_ability_data = CareerUtils.get_ability_data(profile_index, career_index, 1)

	career_skill_data.title = activated_ability_data.display_name or "PLACEHOLDER"
	career_skill_data.description = UIUtils.get_ability_description(activated_ability_data) or Localize("PLACEHOLDER")
	career_skill_data.icon = activated_ability_data.icon or "icons_placeholder"
	career_skill_data.ability_type = Localize("hero_view_activated_ability")

	local input_action = gamepad_active and "ability" or "action_career"
	local button_texture_data, button_name = self:get_input_texture_data(input_action, gamepad_active)

	career_skill_data.keybind = gamepad_active and button_texture_data or button_name

	local passive_skill_data = {}
	local passive_ability_data = CareerUtils.get_passive_ability_by_career(career_settings)

	passive_skill_data.title = passive_ability_data.display_name or "PLACEHOLDER"
	passive_skill_data.description = UIUtils.get_ability_description(passive_ability_data) or Localize("PLACEHOLDER")
	passive_skill_data.icon = passive_ability_data.icon or "icons_placeholder"
	passive_skill_data.ability_type = Localize("hero_view_passive_ability")

	table.insert(info_settings, career_skill_data)
	table.insert(info_settings, passive_skill_data)

	return info_settings
end

CareerHelpUI._is_hero_side = function (self)
	return self._side and self._side:name() == "heroes"
end

CareerHelpUI._create_player_portrait = function (self, portrait_frame, portrait_image, player_level_text)
	local definition = UIWidgets.create_portrait_frame("portrait", portrait_frame, player_level_text, 1, nil, portrait_image)
	local widget = UIWidget.init(definition, self._ui_renderer)

	self._player_portrait_widget = widget
end

CareerHelpUI._set_career_and_class_text = function (self, profile_settings, career_settings)
	local career_name_widget = self._widgets_by_name.player_info_career
	local character_name_widget = self._widgets_by_name.player_info_name

	career_name_widget.content.text = career_settings.display_name
	character_name_widget.content.text = profile_settings.ingame_display_name
end

CareerHelpUI._set_side_text_color = function (self, is_hero_side)
	local text_color = is_hero_side and header_colors.heroes or header_colors.dark_pact
	local career_name_widget = self._widgets_by_name.player_info_career
	local title_text_widget = self._widgets_by_name.title_text

	career_name_widget.style.text.text_color = text_color
	title_text_widget.style.text.text_color = text_color

	for i = 1, 2 do
		local index = tostring(i)
		local widget = self._widgets_by_name["ability_widget_" .. index]

		widget.style.ability_title.text_color = text_color
	end
end

CareerHelpUI.get_input_texture_data = function (self, input_action, gamepad_active)
	local input_manager = self._input_manager
	local input_service = input_manager:get_service("Player")

	return UISettings.get_gamepad_input_texture_data(input_service, input_action, gamepad_active)
end

CareerHelpUI._handle_gamepad = function (self)
	local gamepad_active = self._input_manager:is_device_active("gamepad")

	if self._gamepad_active ~= gamepad_active then
		self:_setup_career_info_widget(self._current_profile_index, self._current_career_index)

		self._gamepad_active = gamepad_active
	end
end

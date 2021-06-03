require("scripts/helpers/ui_atlas_helper")

DeusMapUI = class(DeusMapUI)
local DEFINITIONS = local_require("scripts/ui/views/deus_menu/deus_map_ui_definitions")

local function setup_ui(definitions, ui_renderer)
	local scenegraph_definition = definitions.scenegraph_definition
	local ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	local widgets = {}
	local widget_index_by_name = {}

	for name, definition in pairs(definitions.widget_definitions) do
		local widget = UIWidget.init(definition)
		widgets[#widgets + 1] = widget
		widget_index_by_name[name] = #widgets
	end

	local render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = true
	}
	local draw_flags = {
		alpha_multiplier = 1
	}

	return {
		render_content = false,
		render_full_screen_rect = false,
		ui_scenegraph = ui_scenegraph,
		ui_renderer = ui_renderer,
		widgets = widgets,
		widget_index_by_name = widget_index_by_name,
		draw_flags = draw_flags,
		render_settings = render_settings
	}
end

local function update_ui_animations(dt, t, ui_data)
	if not ui_data.alpha_multiplier_animation_duration then
		return
	end

	if not ui_data.alpha_multiplier_animation_start_time then
		ui_data.alpha_multiplier_animation_start_time = t
		ui_data.alpha_multiplier_animation_end_time = t + ui_data.alpha_multiplier_animation_duration
	end

	local progress = nil
	local interpolation_time = ui_data.alpha_multiplier_animation_end_time - ui_data.alpha_multiplier_animation_start_time

	if interpolation_time <= 0.001 then
		progress = 1
	else
		progress = math.clamp((t - ui_data.alpha_multiplier_animation_start_time) / interpolation_time, 0, 1)
	end

	local new_value = math.lerp(ui_data.source_alpha_multiplier, ui_data.target_alpha_multiplier, progress)
	ui_data.draw_flags.alpha_multiplier = new_value

	for _, widget in ipairs(ui_data.widgets) do
		widget.element.dirty = true
	end

	if progress == 1 then
		ui_data.alpha_multiplier_animation_duration = nil
		ui_data.alpha_multiplier_animation_start_time = nil
		ui_data.alpha_multiplier_animation_end_time = nil
		ui_data.source_alpha_multiplier = nil
		ui_data.target_alpha_multiplier = nil
	end
end

local function draw_ui(dt, t, ui_data, input_service)
	local ui_renderer = ui_data.ui_renderer
	local ui_scenegraph = ui_data.ui_scenegraph
	local render_settings = ui_data.render_settings
	local draw_flags = ui_data.draw_flags
	local parent_scenegraph_id = nil

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, parent_scenegraph_id, render_settings)

	render_settings.alpha_multiplier = draw_flags.alpha_multiplier or 0

	if ui_data.render_full_screen_rect then
		UIRenderer.draw_rect(ui_renderer, {
			0,
			0
		}, UISceneGraph.get_size_scaled(ui_scenegraph, "screen"), Colors.get_table("black"))
	end

	if ui_data.render_content then
		local widgets = ui_data.widgets

		for i = 1, #widgets, 1 do
			local widget = widgets[i]

			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	render_settings.alpha_multiplier = 1

	UIRenderer.end_pass(ui_renderer)
end

local function hide_all_player_units(ui_data)
	for i = 1, 4, 1 do
		local player_portrait_index = ui_data.widget_index_by_name["player_" .. i .. "_portrait"]
		local player_texts_index = ui_data.widget_index_by_name["player_" .. i .. "_texts"]
		local player_portrait = ui_data.widgets[player_portrait_index]
		local player_texts = ui_data.widgets[player_texts_index]
		player_portrait.content.visible = false
		player_texts.content.visible = false

		UIRenderer.set_element_visible(ui_data.ui_renderer, player_portrait.element, false)
	end
end

local function get_color_for_consumable_item(item_key)
	local default_color = UISettings.inventory_consumable_slot_colors.default

	return (item_key and UISettings.inventory_consumable_slot_colors[item_key]) or default_color
end

local function update_player_data(ui_data, player_data)
	hide_all_player_units(ui_data)

	for i, data in ipairs(player_data) do
		local player_portrait_index = ui_data.widget_index_by_name["player_" .. i .. "_portrait"]
		local player_texts_index = ui_data.widget_index_by_name["player_" .. i .. "_texts"]
		local player_portrait = ui_data.widgets[player_portrait_index]
		local player_texts = ui_data.widgets[player_texts_index]
		local frame_settings_name = data.frame or "default"
		local level = data.level or "-"

		if player_portrait.content.frame_settings_name ~= frame_settings_name or player_portrait.content.level ~= level then
			UIRenderer.set_element_visible(ui_data.ui_renderer, player_portrait.element, false)

			player_portrait = UIWidget.init(UIWidgets.create_deus_player_status_portrait(player_portrait.scenegraph_id, data.frame or "default", data.level or "-", DEFINITIONS.retained_mode))
			ui_data.widgets[player_portrait_index] = player_portrait
		end

		player_portrait.content.visible = true
		player_texts.content.visible = true
		player_portrait.element.dirty = true
		player_texts.element.dirty = true
		player_texts.content.name_text = data.name or ""
		player_texts.content.vote_text = (data.vote and data.vote .. "_title") or "deus_map_vote_not_cast"

		if data.profile_index ~= 0 then
			local profile_data = SPProfiles[data.profile_index]
			local careers = profile_data.careers
			local career_data = careers[data.career_index]
			player_portrait.content.character_portrait = career_data.portrait_image
		else
			player_portrait.content.character_portrait = "unit_frame_portrait_default"
		end

		player_portrait.content.hp_bar.bar_value = data.health_percentage
		player_portrait.content.ammo_percentage = data.ammo_percentage
		player_texts.content.coins_text = string.format("%d", data.soft_currency)
		local healthkit_item = data.healthkit_consumable
		player_portrait.content.healthkit_slot = healthkit_item and ItemMasterList[healthkit_item].hud_icon
		player_portrait.style.healthkit_slot_bg.color = get_color_for_consumable_item(healthkit_item)
		local potion_item = data.potion_consumable
		player_portrait.content.potion_slot = potion_item and ItemMasterList[potion_item].hud_icon
		player_portrait.style.potion_slot_bg.color = get_color_for_consumable_item(potion_item)
		local grenade_item = data.grenade_consumable
		player_portrait.content.grenade_slot = grenade_item and ItemMasterList[grenade_item].hud_icon
		player_portrait.style.grenade_slot_bg.color = get_color_for_consumable_item(grenade_item)
	end
end

local function fade_in(ui_data, duration)
	ui_data.source_alpha_multiplier = ui_data.draw_flags.alpha_multiplier
	ui_data.target_alpha_multiplier = 1
	ui_data.alpha_multiplier_animation_duration = duration
	ui_data.alpha_multiplier_animation_start_time = nil
	ui_data.alpha_multiplier_animation_end_time = nil
end

local function fade_out(ui_data, duration)
	ui_data.source_alpha_multiplier = ui_data.draw_flags.alpha_multiplier
	ui_data.target_alpha_multiplier = 0
	ui_data.alpha_multiplier_animation_duration = duration
	ui_data.alpha_multiplier_animation_start_time = nil
	ui_data.alpha_multiplier_animation_end_time = nil
end

DeusMapUI.init = function (self, renderer)
	self._ui_data = setup_ui(DEFINITIONS, renderer)
end

DeusMapUI.on_enter = function (self, input_service)
	self._input_service = input_service
end

DeusMapUI.on_exit = function (self)
	return
end

DeusMapUI.update = function (self, dt, t)
	if RESOLUTION_LOOKUP.modified then
		self:_on_resolution_changed()
	end

	update_ui_animations(dt, t, self._ui_data)
	draw_ui(dt, t, self._ui_data, self._input_service)
end

DeusMapUI.enable_hover_text = function (self, screen_pos, type, level, theme, minor_modifier_group, director_name, terror_event_power_up, selected, selectable)
	local ui_pos = UIInverseScaleVectorToResolution(screen_pos)
	local scene_graph_position = self._ui_data.ui_scenegraph.node_info_pivot.position
	scene_graph_position[1] = ui_pos[1]
	scene_graph_position[2] = ui_pos[2]
	local widget_index = self._ui_data.widget_index_by_name.node_info
	local widget = self._ui_data.widgets[widget_index]
	widget.content.visible = true

	if level then
		widget.content.node_info.title = Localize(level .. "_title")
		widget.content.node_info.description = Localize(level .. "_desc")
	else
		widget.content.node_info.title = Localize("undiscovered_level_title")
		widget.content.node_info.description = Localize("undiscovered_level_desc")
	end

	if not theme or theme == "wastes" then
		widget.content.node_info.curse_text = ""
	else
		widget.content.node_info.curse_text = Localize("deus_map_node_info_god_" .. theme)
		widget.content.node_info.curse_icon = "deus_icons_map_" .. theme
		widget.style.node_info.curse_section.curse_icon.color = Colors.get_color_table_with_alpha(theme, 255)
		widget.style.node_info.curse_section.curse_text.text_color = Colors.get_color_table_with_alpha(theme, 255)
	end

	if minor_modifier_group then
		widget.content.node_info.minor_modifier_1_section.text = (minor_modifier_group[1] and Localize("mutator_" .. minor_modifier_group[1] .. "_name")) or ""
		widget.content.node_info.minor_modifier_2_section.text = (minor_modifier_group[2] and Localize("mutator_" .. minor_modifier_group[2] .. "_name")) or ""
		widget.content.node_info.minor_modifier_3_section.text = (minor_modifier_group[3] and Localize("mutator_" .. minor_modifier_group[3] .. "_name")) or ""
	else
		widget.content.node_info.minor_modifier_1_section.text = ""
		widget.content.node_info.minor_modifier_2_section.text = ""
		widget.content.node_info.minor_modifier_3_section.text = ""
	end

	if terror_event_power_up then
		local power_up_template = DeusPowerUpTemplates[terror_event_power_up]
		widget.content.node_info.terror_event_power_up_text = (terror_event_power_up and Localize("terror_event_power_up_" .. terror_event_power_up .. "_name")) or ""
		widget.content.node_info.terror_event_power_up_icon = power_up_template.icon
	else
		widget.content.node_info.terror_event_power_up_text = ""
	end

	widget.content.node_info.shrine_text = ""
	local conflict_director = ConflictDirectors[director_name]
	local conflict_director_description = conflict_director and conflict_director.description

	if conflict_director_description then
		widget.content.node_info.breed_text = Localize(conflict_director_description) or ""
	else
		widget.content.node_info.breed_text = ""
	end

	widget.content.node_info.click_to_vote = (selectable and "deus_map_node_info_click_to_vote") or ""
	widget.content.node_info.frame_settings_name = (selected and "menu_frame_12_gold") or "menu_frame_12"
end

DeusMapUI.update_player_data = function (self, player_data)
	self._last_player_data = player_data

	update_player_data(self._ui_data, self._last_player_data)
end

DeusMapUI.set_journey_name = function (self, journey_name)
	local widget_index = self._ui_data.widget_index_by_name.top_info
	local widget = self._ui_data.widgets[widget_index]
	widget.content.journey_name_label = journey_name .. "_name"
end

DeusMapUI.set_general_info = function (self, title, description)
	local widget_index = self._ui_data.widget_index_by_name.general_info
	local widget = self._ui_data.widgets[widget_index]
	widget.content.title = title
	widget.content.description = description
	widget.element.dirty = true
end

DeusMapUI._on_resolution_changed = function (self)
	for _, widget in ipairs(self._ui_data.widgets) do
		widget.element.dirty = true
	end

	if self._last_player_data then
		self:update_player_data(self._last_player_data)
	end
end

DeusMapUI.update_timer = function (self, timeleft)
	local widget_index = self._ui_data.widget_index_by_name.general_info
	local widget = self._ui_data.widgets[widget_index]
	local floor = math.floor
	local timer_text = string.format("%.2d:%.2d", floor(timeleft / 60) % 60, floor(timeleft) % 60)
	widget.content.time = timer_text
	widget.element.dirty = true
end

DeusMapUI.hide_timer = function (self)
	local widget_index = self._ui_data.widget_index_by_name.general_info
	local widget = self._ui_data.widgets[widget_index]
	widget.content.time = ""
	widget.element.dirty = true
end

DeusMapUI.disable_hover_text = function (self)
	local widget_index = self._ui_data.widget_index_by_name.node_info
	local widget = self._ui_data.widgets[widget_index]
	widget.content.visible = false
	widget.element.dirty = true
end

DeusMapUI.set_alpha_multiplier = function (self, alpha)
	self._ui_data.draw_flags.alpha_multiplier = alpha
end

DeusMapUI.show_full_screen_rect = function (self)
	self._ui_data.render_full_screen_rect = true
end

DeusMapUI.hide_full_screen_rect = function (self)
	self._ui_data.render_full_screen_rect = false
end

DeusMapUI.show_content = function (self)
	self:_show_content()
end

DeusMapUI.hide_content = function (self)
	self:_hide_content()
end

DeusMapUI._show_content = function (self)
	self._ui_data.render_content = true

	for i = 1, #self._ui_data.widgets, 1 do
		local widget = self._ui_data.widgets[i]

		UIRenderer.set_element_visible(self._ui_data.ui_renderer, widget.element, true)
	end
end

DeusMapUI._hide_content = function (self)
	self._ui_data.render_content = false

	for i = 1, #self._ui_data.widgets, 1 do
		local widget = self._ui_data.widgets[i]

		UIRenderer.set_element_visible(self._ui_data.ui_renderer, widget.element, false)
	end
end

DeusMapUI.fade_out = function (self, duration)
	fade_out(self._ui_data, duration)
end

DeusMapUI.fade_in = function (self, duration)
	fade_in(self._ui_data, duration)
end

DeusMapUI.destroy = function (self)
	return
end

return

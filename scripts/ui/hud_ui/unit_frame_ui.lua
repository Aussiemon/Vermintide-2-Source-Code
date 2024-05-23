-- chunkname: @scripts/ui/hud_ui/unit_frame_ui.lua

local PLAYER_NAME_MAX_LENGTH = 10

UnitFrameUI = class(UnitFrameUI)

UnitFrameUI.init = function (self, ingame_ui_context, definitions, data, frame_index, player_data, frame_type)
	self.definitions = definitions
	self.features_list = definitions.features_list
	self.widget_name_by_feature = definitions.widget_name_by_feature
	self.inventory_consumable_icons = definitions.inventory_consumable_icons
	self.inventory_index_by_slot = definitions.inventory_index_by_slot
	self.weapon_slot_widget_settings = definitions.weapon_slot_widget_settings
	self.render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = true,
	}
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.input_manager = ingame_ui_context.input_manager
	self.peer_id = ingame_ui_context.peer_id
	self.player_manager = ingame_ui_context.player_manager
	self.ui_animations = {}
	self._damage_events = {}
	self._dmg_part_pool = {}
	self._hash_order = {}
	self._hash_widget_lookup = {}
	self.world = ingame_ui_context.world_manager:world("level_world")
	self._show_respawn_ui = false
	self.data = data
	self._frame_type = frame_type

	self:_create_ui_elements(frame_index)

	self._ammo_ui_data = {}
	self.weapon_changed = false

	if player_data.is_player_darkpact then
		Managers.state.event:register(self, "enter_ghostmode", "on_enter_ghostmode")
	end
end

UnitFrameUI.on_enter_ghostmode = function (self, in_ghostmode, player_unit)
	self:show_main_healthbar(not in_ghostmode)
end

UnitFrameUI._create_ui_elements = function (self, frame_index)
	local definitions = self.definitions
	local scenegraph_definition = self.definitions.scenegraph_definition

	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	local widgets = {}

	for name, definition in pairs(definitions.widget_definitions) do
		widgets[name] = UIWidget.init(definition)
	end

	self._widgets = widgets
	self._default_widgets = {
		default_dynamic = widgets.default_dynamic,
		default_static = widgets.default_static,
	}
	self._damage_widgets = {}

	if self.features_list.damage then
		for _, widget in pairs(definitions.damage_widget_definitions) do
			self._damage_widgets[#self._damage_widgets + 1] = UIWidget.init(widget)
		end
	end

	self._portrait_widgets = {
		portrait_static = widgets.portrait_static,
	}
	self._equipment_widgets = {
		loadout_dynamic = widgets.loadout_dynamic,
		loadout_static = widgets.loadout_static,
	}
	self._health_widgets = {
		health_dynamic = widgets.health_dynamic,
	}
	self._ability_widgets = {
		ability_dynamic = widgets.ability_dynamic,
	}
	self._respawn_widgets = {
		respawn_dynamic = widgets.respawn_dynamic,
	}

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.slot_equip_animations = {}
	self.bar_animations = {}

	self:reset()

	if frame_index then
		self:_widget_by_name("health_dynamic").content.hp_bar.texture_id = "teammate_hp_bar_color_tint_" .. frame_index
		self:_widget_by_name("health_dynamic").content.total_health_bar.texture_id = "teammate_hp_bar_" .. frame_index
	end

	self:set_visible(false)
	self:set_dirty()
end

UnitFrameUI._widget_by_name = function (self, name)
	return self._widgets[name]
end

UnitFrameUI._widget_by_feature = function (self, feature_name, list_name)
	local widget_name = self.widget_name_by_feature[list_name][feature_name]

	return self:_widget_by_name(widget_name)
end

UnitFrameUI.set_position = function (self, x, y)
	local position = self.ui_scenegraph.pivot.local_position

	position[1] = x
	position[2] = y

	for _, widget in pairs(self._widgets) do
		self:_set_widget_dirty(widget)
	end

	self:set_dirty()
end

UnitFrameUI.destroy = function (self)
	self:set_visible(false)
	Managers.state.event:unregister("enter_ghostmode", self)
end

UnitFrameUI.is_visible = function (self)
	return self._is_visible
end

UnitFrameUI.set_visible = function (self, visible)
	self._is_visible = visible

	local ui_renderer = self.ui_renderer

	for _, widget in pairs(self._widgets) do
		UIRenderer.set_element_visible(ui_renderer, widget.element, visible)
	end

	self:set_dirty()
end

UnitFrameUI.set_alpha = function (self, alpha)
	self.render_settings.alpha_multiplier = alpha

	for _, widget in pairs(self._widgets) do
		self:_set_widget_dirty(widget)
	end

	self:set_dirty()
end

UnitFrameUI.set_default_alpha = function (self, alpha)
	self._default_alpha_multiplier = alpha

	for _, widget in pairs(self._default_widgets) do
		self:_set_widget_dirty(widget)
	end

	self:set_dirty()
end

UnitFrameUI.set_portrait_alpha = function (self, alpha)
	self._portrait_alpha_multiplier = alpha

	for _, widget in pairs(self._portrait_widgets) do
		self:_set_widget_dirty(widget)
	end

	self:set_dirty()
end

UnitFrameUI.set_damage_alpha = function (self, alpha)
	self._damage_alpha_multiplier = alpha

	for _, widget in pairs(self._damage_widgets) do
		self:_set_widget_dirty(widget)
	end

	self:set_dirty()
end

UnitFrameUI.set_equipment_alpha = function (self, alpha)
	self._equipment_alpha_multiplier = alpha

	for _, widget in pairs(self._equipment_widgets) do
		self:_set_widget_dirty(widget)
	end

	self:set_dirty()
end

UnitFrameUI.set_health_alpha = function (self, alpha)
	self._health_alpha_multiplier = alpha

	for _, widget in pairs(self._health_widgets) do
		self:_set_widget_dirty(widget)
	end

	self:set_dirty()
end

UnitFrameUI.set_ability_alpha = function (self, alpha)
	self._ability_alpha_multiplier = alpha

	for _, widget in pairs(self._ability_widgets) do
		self:_set_widget_dirty(widget)
	end

	self:set_dirty()
end

UnitFrameUI.set_respawn_alpha = function (self, alpha)
	self._respawn_alpha_multiplier = alpha

	for _, widget in pairs(self._respawn_widgets) do
		self:_set_widget_dirty(widget)
	end

	self:set_dirty()
end

UnitFrameUI.show_main_healthbar = function (self, show)
	self._widgets.health_dynamic.content.visible = show
	self._widgets.default_static.content.show_health_bar = show

	self:set_dirty()
end

UnitFrameUI.update = function (self, dt, t)
	local features_list = self.features_list
	local update_equipment = features_list.equipment
	local update_weapons = features_list.weapons
	local update_damage = features_list.damage
	local dirty = false
	local data = self.data
	local is_dead = data.is_dead
	local is_talking = data.is_talking
	local is_knocked_down = data.is_knocked_down
	local assisted_respawn = data.assisted_respawn
	local needs_help = data.needs_help

	self.overlay_time = (self.overlay_time or 0) + dt * 1.4

	if self:_update_portrait_opacity(is_dead, is_knocked_down, needs_help, assisted_respawn) then
		dirty = true
	end

	if self:_update_voice_animation(dt, t, is_talking) then
		dirty = true
	end

	if self:_update_bar_animations(dt, t) then
		dirty = true
	end

	if self:_update_health_bar_animation(dt, t) then
		dirty = true
	end

	if self:_update_total_health_bar_animation(dt, t) then
		dirty = true
	end

	if update_weapons and self:_update_overcharge_animation(dt, t) then
		dirty = true
	end

	if update_equipment and self:_update_slot_equip_animations(dt, t) then
		dirty = true
	end

	if self:_update_connection_animation(dt, t) then
		dirty = true
	end

	if update_damage and self:_update_damage_feedback(dt, t) then
		dirty = true
	end

	if dirty then
		self:set_dirty()
	end
end

UnitFrameUI.on_resolution_modified = function (self)
	self:set_player_name(self._player_name or "")

	for _, widget in pairs(self._widgets) do
		self:_set_widget_dirty(widget)
	end

	self:set_dirty()
end

local customizer_data_player_portrait = {
	drag_scenegraph_id = "portrait_pivot_dragger",
	label = "You",
	registry_key = "player_portrait",
	root_scenegraph_id = "portrait_pivot",
}
local customizer_data_player_status = {
	is_child = true,
	registry_key = "player_status",
	root_scenegraph_id = "player_status",
}
local customizer_data_teammate_status = {
	drag_scenegraph_id = "pivot_dragger",
	label = "Team",
	registry_key = "teammate_portrait",
	root_scenegraph_id = "pivot",
}

UnitFrameUI.draw = function (self, dt)
	if not self._is_visible then
		return
	end

	if self._frame_type == "player" then
		if HudCustomizer.run(self.ui_renderer, self.ui_scenegraph, customizer_data_player_portrait) then
			UIUtils.mark_dirty(self._portrait_widgets)
			UIUtils.mark_dirty(self._default_widgets)
			UIUtils.mark_dirty(self._damage_widgets)

			self._dirty = true
		elseif HudCustomizer.run(self.ui_renderer, self.ui_scenegraph, customizer_data_player_status) then
			UIUtils.mark_dirty(self._health_widgets)
			UIUtils.mark_dirty(self._ability_widgets)
			UIUtils.mark_dirty(self._damage_widgets)

			self._dirty = true
		end
	elseif self._frame_type == "team" and HudCustomizer.run(self.ui_renderer, self.ui_scenegraph, customizer_data_teammate_status) then
		UIUtils.mark_dirty(self._portrait_widgets)
		UIUtils.mark_dirty(self._default_widgets)
		UIUtils.mark_dirty(self._health_widgets)
		UIUtils.mark_dirty(self._ability_widgets)
		UIUtils.mark_dirty(self._damage_widgets)

		self._dirty = true
	end

	if not self._dirty then
		return
	end

	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("ingame_menu")
	local render_settings = self.render_settings
	local alpha_multiplier = render_settings.alpha_multiplier

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	render_settings.alpha_multiplier = self._default_alpha_multiplier or alpha_multiplier

	for _, widget in pairs(self._default_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	render_settings.alpha_multiplier = self._damage_alpha_multiplier or alpha_multiplier

	for _, widget in pairs(self._damage_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	render_settings.alpha_multiplier = self._portrait_alpha_multiplier or alpha_multiplier

	for _, widget in pairs(self._portrait_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	render_settings.alpha_multiplier = self._equipment_alpha_multiplier or alpha_multiplier

	for _, widget in pairs(self._equipment_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	render_settings.alpha_multiplier = self._health_alpha_multiplier or alpha_multiplier

	for _, widget in pairs(self._health_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	render_settings.alpha_multiplier = self._ability_alpha_multiplier or alpha_multiplier

	for _, widget in pairs(self._ability_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	render_settings.alpha_multiplier = self._respawn_alpha_multiplier or alpha_multiplier

	for _, widget in pairs(self._respawn_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)

	self._dirty = false
end

UnitFrameUI.set_dirty = function (self)
	self._dirty = true
end

UnitFrameUI._set_widget_dirty = function (self, widget)
	widget.element.dirty = true
end

UnitFrameUI.reset = function (self)
	self:set_player_name("")
	self:set_talking(false)
	self:set_icon_visibility(false)
	self:set_connecting_status(true)
	self:_reset_voice_animation()

	local show_health_bar, is_knocked_down, is_wounded = true, false, false

	self:set_health_bar_status(show_health_bar, is_knocked_down, is_wounded)

	if self.features_list.equipment then
		for slot_name, _ in pairs(self.inventory_index_by_slot) do
			self:set_inventory_slot_data(slot_name, false)
		end
	end

	self:set_dirty()
end

UnitFrameUI.set_portrait_frame = function (self, frame_settings_name, level_text)
	local widgets = self._widgets
	local portrait_widgets = self._portrait_widgets
	local previous_widget = widgets.portrait_static

	if previous_widget.content.frame_settings_name == frame_settings_name and previous_widget.content.level_text == level_text then
		return
	end

	local scale = previous_widget.content.scale or 1

	UIWidget.destroy(self.ui_renderer, previous_widget)

	local retained_mode = true
	local widget_definition = UIWidgets.create_portrait_frame("portrait_pivot", frame_settings_name, level_text, scale, retained_mode)
	local widget = UIWidget.init(widget_definition, self.ui_renderer)

	widgets.portrait_static = widget
	portrait_widgets.portrait_static = widgets.portrait_static

	local widget_content = widget.content

	widget_content.frame_settings_name = frame_settings_name
	widget_content.level_text = level_text

	self:_set_widget_dirty(widget)
end

UnitFrameUI.set_portrait = function (self, portrait_texture)
	local widget = self:_widget_by_feature("default", "static")
	local widget_content = widget.content

	widget_content.character_portrait = portrait_texture

	self:_set_widget_dirty(widget)
end

UnitFrameUI.set_host_status = function (self, is_host)
	local widget = self:_widget_by_feature("default", "static")
	local widget_content = widget.content

	widget_content.is_host = is_host

	self:_set_widget_dirty(widget)
end

UnitFrameUI.set_talking = function (self, is_talking)
	local widget = self:_widget_by_feature("default", "dynamic")
	local widget_content = widget.content

	widget_content.is_talking = is_talking

	self:_set_widget_dirty(widget)
end

UnitFrameUI.set_status_icon = function (self, icon_texture, alpha)
	local widget = self:_widget_by_feature("status_icon", "dynamic")
	local widget_content = widget.content
	local widget_style = widget.style

	widget_content.portrait_icon = icon_texture
	widget_style.portrait_icon.color[1] = alpha or 255

	self:_set_widget_dirty(widget)
end

UnitFrameUI.set_connecting_status = function (self, is_connecting)
	local widget = self:_widget_by_feature("default", "dynamic")
	local widget_content = widget.content

	widget_content.connecting = is_connecting

	self:_set_widget_dirty(widget)
end

UnitFrameUI.set_icon_visibility = function (self, show_icon)
	local widget = self:_widget_by_feature("status_icon", "dynamic")
	local widget_content = widget.content

	widget_content.display_portrait_icon = show_icon

	self:_set_widget_dirty(widget)
end

UnitFrameUI.set_portrait_status = function (self, is_knocked_down, needs_help, is_dead, assisted_respawn)
	local widget = self:_widget_by_feature("default", "static")
	local portrait_texture = widget.content.character_portrait
	local gui = self.ui_renderer.gui_retained
	local gui_material = Gui.material(gui, portrait_texture)

	if is_knocked_down or needs_help or is_dead then
		Material.set_vector2(gui_material, "saturate_params", Vector2(0.7, 1))
	else
		Material.set_vector2(gui_material, "saturate_params", Vector2(0, 1))
	end

	if needs_help then
		self:set_status_icon("status_icon_needs_assist", 150)
	elseif assisted_respawn then
		self:set_status_icon("status_icon_respawn", 150)
	elseif is_dead then
		self:set_status_icon("status_icon_dead", 255)
	end

	self:_set_widget_dirty(widget)
end

UnitFrameUI.set_player_name = function (self, name_text)
	local widget = self:_widget_by_feature("player_name", "static")

	if widget then
		local widget_content = widget.content
		local display_name = name_text
		local max_width = 170 * RESOLUTION_LOOKUP.scale

		if IS_PS4 then
			local player_name_style = widget.style.player_name
			local player_name_shadow_style = widget.style.player_name_shadow

			player_name_style.font_size = 18
			player_name_shadow_style.font_size = 18

			local player_name_font_size = UIRenderer.scaled_font_size_by_width(self.ui_renderer, display_name, max_width, player_name_style)

			widget.style.player_name.font_size = player_name_font_size

			local player_name_shadow_font_size = UIRenderer.scaled_font_size_by_width(self.ui_renderer, display_name, max_width, player_name_shadow_style)

			player_name_shadow_style.font_size = player_name_shadow_font_size
		else
			display_name = widget.style.player_name and UTF8Utils.string_length(name_text) > PLAYER_NAME_MAX_LENGTH and UIRenderer.crop_text_width(self.ui_renderer, name_text, max_width, widget.style.player_name) or name_text
		end

		widget_content.player_name = display_name

		self:_set_widget_dirty(widget)
	end

	self._player_name = name_text
end

local item_count_slot_names = {
	"item_count_1",
	"item_count_2",
	"item_count_3",
}

UnitFrameUI.set_inventory_slot_data = function (self, slot_name, slot_visible, item_data, item_count)
	local item_name = slot_visible and item_data.name
	local hud_icon = slot_visible and item_data.hud_icon
	local widget = self:_widget_by_feature("equipment", "dynamic")
	local widget_content = widget.content
	local widget_style = widget.style
	local inventory_consumable_slot_colors = UISettings.inventory_consumable_slot_colors
	local slot_index = self.inventory_index_by_slot[slot_name]

	if slot_index then
		local widget_slot_name = "item_slot_" .. slot_index
		local widget_slot_bg_name = "item_slot_bg_" .. slot_index
		local widget_slot_frame_name = "item_slot_frame_" .. slot_index
		local icon_texture = slot_visible and hud_icon or "icons_placeholder"

		widget_content[widget_slot_name] = icon_texture
		widget_style[widget_slot_name].color[1] = slot_visible and 255 or 0
		widget_style[widget_slot_bg_name].color[1] = slot_visible and 255 or 100
		widget_style[widget_slot_frame_name].color[1] = slot_visible and 255 or 100

		local item_count_slot_name = item_count_slot_names[slot_index]

		if item_count_slot_name then
			if item_count and item_count > 0 then
				widget_content[item_count_slot_name] = item_count
			else
				widget_content[item_count_slot_name] = nil
			end
		end

		if inventory_consumable_slot_colors then
			local default_slot_background_color = inventory_consumable_slot_colors.default
			local slot_background_color = slot_visible and (inventory_consumable_slot_colors[item_name] or default_slot_background_color) or default_slot_background_color
			local slot_bg_style = widget_style[widget_slot_bg_name]
			local slot_bg_color = slot_bg_style.color

			slot_bg_color[2] = slot_background_color[2]
			slot_bg_color[3] = slot_background_color[3]
			slot_bg_color[4] = slot_background_color[4]
		end

		if slot_visible then
			self:_add_slot_equip_animation(slot_name .. "_equip_anim", widget, widget_style["item_slot_highlight_" .. slot_index])
		end
	end

	self:_set_widget_dirty(widget)
end

UnitFrameUI.set_equipped_weapon_info = function (self, slot_name, wielded, item_name, hud_icon)
	local widget = self:_widget_by_feature("weapons", "dynamic")
	local widget_content = widget.content
	local widget_style = widget.style

	if wielded then
		widget_content.equipped_weapon = hud_icon
		widget_content.equipped_weapon_slot = slot_name
	elseif widget_content.equipped_weapon_slot ~= slot_name and not widget_content.equipped_weapon then
		widget_content.equipped_weapon = hud_icon
	end

	for name, field_name in pairs(self.weapon_slot_widget_settings.ammo_fields) do
		if slot_name == name then
			local alpha = wielded and 255 or 100

			widget_style[field_name].text_color[1] = alpha
			widget_style[field_name .. "_2"].text_color[1] = alpha
			widget_style[field_name .. "_3"].text_color[1] = alpha
		end
	end

	self:_set_widget_dirty(widget)
end

local ammo_prefix = " "

UnitFrameUI.set_ammo_for_slot = function (self, slot_name, ammo_count, remaining_ammo, using_single_clip)
	local widget = self:_widget_by_feature("weapons", "dynamic")
	local widget_content = widget.content
	local text_field_name = self.weapon_slot_widget_settings.ammo_fields[slot_name]

	if not ammo_count or not remaining_ammo then
		widget_content[text_field_name] = " "
		widget_content[text_field_name .. "_2"] = " "
		widget_content[text_field_name .. "_3"] = " "
	else
		widget_content[text_field_name] = ammo_prefix .. tostring(ammo_count)
		widget_content[text_field_name .. "_2"] = using_single_clip and ammo_prefix or "|"
		widget_content[text_field_name .. "_3"] = using_single_clip and ammo_prefix or tostring(remaining_ammo)
	end

	self:_set_widget_dirty(widget)
end

UnitFrameUI.set_ammo_percentage = function (self, ammo_percent)
	local widget = self:_widget_by_feature("ammo", "dynamic")
	local widget_content = widget.content

	widget_content.ammo_percent = ammo_percent

	self:_set_widget_dirty(widget)
	self:set_dirty()
end

UnitFrameUI.set_ability_percentage = function (self, ability_percent)
	local widget = self:_widget_by_feature("ability", "dynamic")
	local widget_content = widget.content

	widget_content.actual_ability_percent = ability_percent

	self:_on_player_ability_changed("ability", widget, ability_percent)
	self:_set_widget_dirty(widget)
end

UnitFrameUI.set_overcharge_percentage = function (self, has_overcharge, overcharge_percent)
	local widget = self:_widget_by_feature("weapons", "dynamic")
	local widget_content = widget.content

	widget_content.has_overcharge = has_overcharge
	widget_content.overcharge_fill.has_overcharge = has_overcharge
	widget_content.overcharge_fill.overcharge_percent = overcharge_percent or 0

	self:_set_widget_dirty(widget)
end

UnitFrameUI.set_active_percentage = function (self, active_percentage)
	local widget = self:_widget_by_feature("health", "dynamic")
	local widget_content = widget.content

	widget_content.actual_active_percentage = active_percentage

	self:_set_widget_dirty(widget)
end

UnitFrameUI.set_health_percentage = function (self, health_percentage, health_multiplier)
	local widget = self:_widget_by_feature("health", "dynamic")
	local widget_content = widget.content

	widget_content.actual_health_percent = health_percentage

	local name = widget_content.is_playing_boss and "boss_health" or "health"

	self:_on_player_health_changed(name, widget, health_percentage * health_multiplier)
	self:_set_widget_dirty(widget)
end

UnitFrameUI.set_total_health_percentage = function (self, total_health_percentage, health_multiplier)
	local widget = self:_widget_by_feature("health", "dynamic")
	local widget_content = widget.content

	widget_content.actual_total_health_percent = total_health_percentage

	local name = widget_content.is_playing_boss and "boss_total_health" or "total_health"

	self:_on_player_total_health_changed(name, widget, total_health_percentage * health_multiplier)
	self:_set_widget_dirty(widget)
end

UnitFrameUI.set_health_bar_status = function (self, show_health_bar, is_knocked_down, is_wounded)
	local widget = self:_widget_by_feature("health", "dynamic")
	local widget_style = widget.style
	local widget_content = widget.content
	local total_health_bar_content = widget_content.total_health_bar
	local hp_bar_content = widget_content.hp_bar
	local total_health_bar_style = widget_style.total_health_bar

	if widget_content.is_playing_boss then
		total_health_bar_content = widget_content.boss_total_health_bar
		hp_bar_content = widget_content.boss_hp_bar
		total_health_bar_style = widget_style.boss_total_health_bar
	end

	if not total_health_bar_content then
		return
	end

	total_health_bar_content.draw_health_bar = show_health_bar
	total_health_bar_content.is_knocked_down = is_knocked_down
	total_health_bar_content.is_wounded = is_wounded

	local features_list = self.features_list
	local update_equipment = features_list.equipment

	if update_equipment then
		local equipment_widget = self:_widget_by_feature("equipment", "dynamic")

		equipment_widget.content.draw_health_bar = show_health_bar
	end

	local color = total_health_bar_style.color

	if is_knocked_down then
		color[2] = 255
		color[3] = 0
		color[4] = 0
		hp_bar_content.hide = true
	else
		color[2] = 255
		color[3] = 255
		color[4] = 255
		hp_bar_content.hide = false
	end

	self:_set_widget_dirty(widget)
end

UnitFrameUI.set_health_bar_divider_amount = function (self, health_bar_divider_count)
	local widget = self:_widget_by_feature("health", "dynamic")
	local widget_style = widget.style

	widget_style.hp_bar_divider.texture_amount = health_bar_divider_count

	self:_set_widget_dirty(widget)
end

UnitFrameUI._update_portrait_opacity = function (self, is_dead, is_knocked_down, needs_help, assisted_respawn)
	local alpha
	local widget = self:_widget_by_feature("default", "static")
	local color = widget.style.character_portrait.color

	if is_knocked_down or needs_help or assisted_respawn then
		local i = math.sirp(0.6, 1, self.overlay_time)

		alpha = 255 * i
	elseif is_dead then
		alpha = 0
	elseif color[1] ~= 255 then
		alpha = 255
	end

	if alpha then
		color[1] = alpha

		self:_set_widget_dirty(widget)

		return true
	end
end

UnitFrameUI._reset_voice_animation = function (self)
	local widget = self:_widget_by_feature("default", "dynamic")
	local style = widget.style
	local talk_indicator_color = style.talk_indicator.color
	local talk_indicator_glow_color = style.talk_indicator_glow.color
	local talk_indicator_highlight_color = style.talk_indicator_highlight.color
	local talk_indicator_highlight_glow_color = style.talk_indicator_highlight_glow.color

	talk_indicator_color[1] = 0
	talk_indicator_glow_color[1] = 0
	talk_indicator_highlight_color[1] = 0
	talk_indicator_highlight_glow_color[1] = 0

	self:_set_widget_dirty(widget)
end

UnitFrameUI._update_voice_animation = function (self, dt, t, is_talking)
	local widget = self:_widget_by_feature("default", "dynamic")
	local style = widget.style
	local talk_indicator_color = style.talk_indicator.color
	local talk_indicator_glow_color = style.talk_indicator_glow.color
	local highlight_style = widget.style.talk_indicator_highlight
	local color = highlight_style.color
	local old_talk_indicator_alpha = talk_indicator_color[1]
	local new_talk_indicator_alpha = old_talk_indicator_alpha + (is_talking and 1 or -1) * 255 * dt
	local old_alpha = color[1]

	old_alpha = old_alpha + (is_talking and 1 or -1) * 255 * dt

	if is_talking then
		old_alpha = old_alpha + math.sin(t * 3) * 20
		old_alpha = old_alpha + math.cos((t + 1) * 13) * 20
	end

	old_alpha = math.clamp(old_alpha, 0, 255)
	new_talk_indicator_alpha = math.clamp(new_talk_indicator_alpha, 0, 255)

	if old_alpha ~= color[1] or old_talk_indicator_alpha ~= new_talk_indicator_alpha then
		talk_indicator_color[1] = new_talk_indicator_alpha
		talk_indicator_glow_color[1] = new_talk_indicator_alpha
		color[1] = old_alpha
		style.talk_indicator_highlight_glow.color[1] = old_alpha

		self:_set_widget_dirty(widget)

		return true
	end
end

UnitFrameUI._update_health_bar_animation = function (self, dt, t)
	local widget = self:_widget_by_feature("health", "dynamic")
	local widget_content = widget.content
	local content = widget_content.is_playing_boss and widget_content.boss_hp_bar or widget_content.hp_bar
	local bar_value = content.bar_value

	if bar_value ~= content.internal_bar_value then
		content.internal_bar_value = bar_value

		return true
	end
end

UnitFrameUI._update_total_health_bar_animation = function (self, dt, t)
	local widget = self:_widget_by_feature("health", "dynamic")
	local widget_content = widget.content
	local content = widget_content.is_playing_boss and widget_content.boss_total_health_bar or widget_content.total_health_bar
	local bar_value = content.bar_value

	if bar_value ~= content.internal_bar_value then
		content.internal_bar_value = bar_value

		return true
	end
end

UnitFrameUI.show_respawn_ui = function (self)
	return self._show_respawn_ui
end

UnitFrameUI.show_respawn_countdown = function (self, player, is_local_player, spawn_timer)
	self._show_respawn_ui = true

	local widget = self._frame_type == "player" and self:_widget_by_name("respawn_dynamic") or self:_widget_by_name("default_dynamic")
	local widget_content = widget.content

	widget_content.respawn_timer = spawn_timer
	widget_content.total_countdown_time = spawn_timer
	widget_content.state = "countdown"
	widget_content.respawn_info_text = "Respawn in"

	local widget_style = widget.style
	local style_n = widget_style.respawn_countdown_text

	if style_n then
		style_n.text_color[1] = 255
	end
end

UnitFrameUI.update_respawn_countdown = function (self, dt, t)
	t, dt = Managers.time:time_and_delta("game")

	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("Player")
	local player_frame = self._frame_type == "player"
	local widget = player_frame and self:_widget_by_name("respawn_dynamic") or self:_widget_by_name("default_dynamic")
	local widget_content = widget.content
	local state = widget_content.state
	local fallback_fadeout_time = 0.66

	if state == "countdown" then
		local respawn_delta = widget_content.respawn_timer - Managers.time:time("game")

		if respawn_delta <= 0 then
			local total_fadeout_time = widget_content.total_fadeout_time

			widget_content.fadeout_time = total_fadeout_time or fallback_fadeout_time
			state = "fadeout"
			respawn_delta = 0
		end

		widget_content.respawn_countdown_text = string.format("%d", math.abs(respawn_delta))
	elseif state == "fadeout" then
		local widget_style = widget.style
		local fadeout_time = (widget_content.fadeout_time or fallback_fadeout_time) - dt
		local normalized_alpha = math.max(fadeout_time, 0) / (widget_content.total_fadeout_time or fallback_fadeout_time)
		local alpha = normalized_alpha * 255
		local style_n = widget_style.respawn_countdown_text

		style_n.text_color[1] = alpha

		if player_frame then
			local style_t = widget_style.respawn_info_text

			style_t.text_color[1] = alpha
		end

		widget_content.fadeout_time = fadeout_time

		if fadeout_time <= 0 then
			state = "hidden"
			self._show_respawn_ui = false
			widget_content.respawn_countdown_text = ""

			if player_frame then
				widget_content.respawn_info_text = ""
			end
		end
	end

	widget_content.state = state

	Debug.text("RESPAWN GUI UPDATED")
	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)
	UIRenderer.draw_widget(ui_renderer, widget)
	UIRenderer.end_pass(ui_renderer)
	self:set_dirty()

	return true
end

UnitFrameUI._update_overcharge_animation = function (self, dt, t)
	local widget = self:_widget_by_feature("weapons", "dynamic")
	local widget_content = widget.content
	local widget_style = widget.style

	if not widget_content.has_overcharge then
		return
	end

	local style = widget_style.overcharge_fill
	local content = widget_content.overcharge_fill
	local overcharge_percent = content.overcharge_percent
	local overcharge_changed = content.internal_overcharge_percent ~= overcharge_percent

	if overcharge_changed then
		local bar_start_side = widget_content.bar_start_side
		local uv_start_pixels = style.uv_start_pixels
		local uv_scale_pixels = style.uv_scale_pixels
		local uv_scale_axis = style.scale_axis
		local offset = style.offset
		local size = style.size
		local uvs = content.uvs
		local overcharge_offset = uv_scale_pixels
		local uv_pixels = uv_start_pixels + uv_scale_pixels
		local bar_size = uv_start_pixels + uv_scale_pixels * overcharge_percent

		size[uv_scale_axis] = bar_size

		if bar_start_side == "left" then
			uvs[2][uv_scale_axis] = uv_pixels / (uv_start_pixels + uv_scale_pixels)

			local start_offset = style.start_offset
			local position_x = math.max(start_offset + overcharge_offset, start_offset + uv_scale_pixels - bar_size)

			offset[uv_scale_axis] = position_x
		else
			uvs[2][uv_scale_axis] = uv_pixels / (uv_start_pixels + uv_scale_pixels)

			local start_offset = style.start_offset
			local position_x = start_offset + overcharge_offset - bar_size

			offset[uv_scale_axis] = position_x
		end

		content.internal_overcharge_percent = overcharge_percent

		return true
	end
end

UnitFrameUI._on_num_grimoires_changed = function (self, name, widget, health_debuff_percent)
	if not self.bar_animations then
		self.bar_animations = {}
	end

	local bar_animation = self.bar_animations[name] or {}

	if health_debuff_percent ~= bar_animation.current_health_debuff then
		local current_bar_health_debuff = widget.content.grimoire_debuff.bar_value
		local current_bar_health_debuff_style = widget.style.grimoire_debuff
		local current_bar_health_style = widget.style.hp_bar
		local lerp_time = UISettings.unit_frames.health_bar_lerp_time
		local anim_time

		if current_bar_health_debuff < health_debuff_percent then
			anim_time = (health_debuff_percent - current_bar_health_debuff) * lerp_time
		else
			anim_time = (current_bar_health_debuff - health_debuff_percent) * lerp_time
		end

		local length_difference = current_bar_health_debuff_style.uv_scale_pixels - current_bar_health_style.uv_scale_pixels
		local hp_bar_percentage_length = current_bar_health_style.uv_scale_pixels * health_debuff_percent
		local actual_debuff_length = hp_bar_percentage_length + length_difference * 0.5
		local actual_debuff_percent = actual_debuff_length / current_bar_health_debuff_style.uv_scale_pixels

		health_debuff_percent = actual_debuff_percent
		bar_animation.animate = true
		bar_animation.new_value = actual_debuff_percent
		bar_animation.previous_value = current_bar_health_debuff
		bar_animation.time = 0
		bar_animation.total_time = anim_time
		bar_animation.widget = widget
		bar_animation.bar = widget.content.grimoire_debuff
	end

	bar_animation.current_health_debuff = health_debuff_percent
	self.bar_animations[name] = bar_animation
end

UnitFrameUI._on_overcharge_changed = function (self, name, widget, overcharge_percent)
	if not self.bar_animations then
		self.bar_animations = {}
	end

	local bar_animation = self.bar_animations[name] or {}

	if overcharge_percent ~= bar_animation.current_overcharge_percent then
		local current_overcharge_percent = widget.content.overcharge_fill.bar_value
		local lerp_time = UISettings.unit_frames.health_bar_lerp_time
		local anim_time

		if current_overcharge_percent < overcharge_percent then
			anim_time = (overcharge_percent - current_overcharge_percent) * lerp_time
		else
			anim_time = (current_overcharge_percent - overcharge_percent) * lerp_time
		end

		bar_animation.animate = true
		bar_animation.new_value = overcharge_percent
		bar_animation.previous_value = current_overcharge_percent
		bar_animation.time = 0
		bar_animation.total_time = anim_time
		bar_animation.widget = widget
		bar_animation.bar = widget.content.overcharge_fill
	end

	bar_animation.current_overcharge_percent = overcharge_percent
	self.bar_animations[name] = bar_animation
end

UnitFrameUI._on_player_ammo_changed = function (self, name, widget, ammo_percent)
	local bar_animation = self.bar_animations[name] or {}

	self.bar_animations[name] = bar_animation

	local ammo_percent_current = bar_animation.current_health

	bar_animation.current_health = ammo_percent

	if ammo_percent <= 1 and ammo_percent ~= ammo_percent_current then
		local current_bar_ammo = widget.content.ammo_bar.bar_value
		local lerp_time = UISettings.unit_frames.health_bar_lerp_time
		local anim_time

		if current_bar_ammo < ammo_percent then
			anim_time = (ammo_percent - current_bar_ammo) * lerp_time
		else
			anim_time = (current_bar_ammo - ammo_percent) * lerp_time
		end

		bar_animation.animate = true
		bar_animation.new_value = ammo_percent
		bar_animation.previous_value = current_bar_ammo
		bar_animation.time = 0
		bar_animation.total_time = anim_time
		bar_animation.widget = widget
		bar_animation.content = widget.content.ammo_bar
		bar_animation.style = widget.style.ammo_bar

		return true
	end
end

UnitFrameUI._on_player_ability_changed = function (self, name, widget, ability_percent)
	local bar_animation = self.bar_animations[name] or {}

	self.bar_animations[name] = bar_animation

	local ability_percent_current = bar_animation.current_health

	bar_animation.current_health = ability_percent

	if ability_percent <= 1 and ability_percent ~= ability_percent_current then
		local current_bar_ability = widget.content.ability_bar.bar_value
		local lerp_time = UISettings.unit_frames.health_bar_lerp_time
		local anim_time

		if current_bar_ability < ability_percent then
			anim_time = (ability_percent - current_bar_ability) * lerp_time
		else
			anim_time = (current_bar_ability - ability_percent) * lerp_time
		end

		bar_animation.animate = true
		bar_animation.new_value = ability_percent
		bar_animation.previous_value = current_bar_ability
		bar_animation.time = 0
		bar_animation.total_time = anim_time
		bar_animation.widget = widget
		bar_animation.content = widget.content.ability_bar
		bar_animation.style = widget.style.ability_bar

		return true
	end
end

UnitFrameUI._on_player_health_changed = function (self, name, widget, health_percent)
	local bar_animation = self.bar_animations[name] or {}

	self.bar_animations[name] = bar_animation

	local health_percent_current = bar_animation.current_health

	bar_animation.current_health = health_percent

	if health_percent <= 1 and health_percent ~= health_percent_current then
		local widget_content = widget.content
		local widget_style = widget.style
		local hp_bar_content = widget_content.is_playing_boss and widget_content.boss_hp_bar or widget_content.hp_bar
		local hp_bar_style = widget_content.is_playing_boss and widget_style.boss_hp_bar or widget_style.hp_bar
		local is_knocked_down = hp_bar_content.is_knocked_down
		local current_bar_health = hp_bar_content.bar_value
		local lerp_time = UISettings.unit_frames.health_bar_lerp_time
		local anim_time

		if current_bar_health < health_percent then
			anim_time = (health_percent - current_bar_health) * lerp_time
		else
			anim_time = (current_bar_health - health_percent) * lerp_time
		end

		local animate_damage_highlight = not is_knocked_down and health_percent < (health_percent_current or 1) or false

		bar_animation.animate_damage_highlight = animate_damage_highlight and 0 or bar_animation.animate_damage_highlight
		bar_animation.animate = true
		bar_animation.new_value = health_percent
		bar_animation.previous_value = current_bar_health
		bar_animation.time = 0
		bar_animation.total_time = anim_time
		bar_animation.widget = widget
		bar_animation.content = hp_bar_content
		bar_animation.style = hp_bar_style

		return true
	end
end

UnitFrameUI._on_player_total_health_changed = function (self, name, widget, total_health_percent)
	local bar_animation = self.bar_animations[name] or {}

	self.bar_animations[name] = bar_animation

	local total_health_percent_current = bar_animation.current_health

	bar_animation.current_health = total_health_percent

	if total_health_percent <= 1 and total_health_percent ~= total_health_percent_current then
		local widget_content = widget.content
		local widget_style = widget.style
		local total_health_bar_content = widget_content.is_playing_boss and widget_content.boss_total_health_bar or widget_content.total_health_bar
		local total_health_bar_style = widget_content.is_playing_boss and widget_style.boss_total_health_bar or widget_style.total_health_bar
		local is_knocked_down = total_health_bar_content.is_knocked_down
		local current_bar_total_health = total_health_bar_content.bar_value
		local lerp_time = UISettings.unit_frames.health_bar_lerp_time
		local anim_time

		if current_bar_total_health < total_health_percent then
			anim_time = (total_health_percent - current_bar_total_health) * lerp_time
		else
			anim_time = (current_bar_total_health - total_health_percent) * lerp_time
		end

		local animate_bar_flash = not is_knocked_down and total_health_percent < (total_health_percent_current or 1) or false

		bar_animation.animate_bar_flash = animate_bar_flash and 0 or bar_animation.animate_bar_flash
		bar_animation.animate = true
		bar_animation.new_value = total_health_percent
		bar_animation.previous_value = current_bar_total_health
		bar_animation.time = 0
		bar_animation.total_time = anim_time
		bar_animation.widget = widget
		bar_animation.content = total_health_bar_content
		bar_animation.style = total_health_bar_style

		return true
	end
end

UnitFrameUI._update_bar_animations = function (self, dt)
	local dirty = false
	local bar_animations = self.bar_animations

	if bar_animations then
		for _, animation_data in pairs(bar_animations) do
			local widget_dirty = false
			local widget = animation_data.widget
			local content = animation_data.content
			local style = animation_data.style

			if content and content.low_health then
				UIAnimation.update(animation_data.low_health_animation, dt)

				dirty = true
				widget_dirty = true
			end

			if animation_data.animate_damage_highlight then
				animation_data.animate_damage_highlight = self:_update_damage_highlight(widget, animation_data.animate_damage_highlight, dt)
				dirty = true
				widget_dirty = true
			end

			if animation_data.animate_bar_flash then
				animation_data.animate_bar_flash = self:_update_bar_flash(widget, style, animation_data.animate_bar_flash, dt)
				dirty = true
				widget_dirty = true
			end

			if animation_data.animate then
				local time = animation_data.time
				local total_time = animation_data.total_time
				local new_value = animation_data.new_value
				local previous_value = animation_data.previous_value
				local time_left = self:_update_player_bar_animation(content, style, time, total_time, previous_value, new_value, dt)

				widget_dirty = true

				if time_left then
					animation_data.time = time_left
				else
					animation_data.animate = nil
				end

				dirty = true
			end

			if widget_dirty then
				self:_set_widget_dirty(widget)
			end
		end
	end

	return dirty
end

UnitFrameUI._update_bar_flash = function (self, widget, style, time, dt)
	local total_time = 0.3

	time = time + dt

	if total_time > 0 then
		local progress = math.min(time / total_time, 1)
		local anim_progress = math.max(1 - math.ease_pulse(progress), 0)
		local highlight_alpha = 155 + 100 * anim_progress

		style.color[1] = highlight_alpha

		self:_set_widget_dirty(widget)

		return progress < 1 and time or nil
	end

	return nil
end

UnitFrameUI._update_damage_highlight = function (self, widget, time, dt)
	local total_time = 0.2

	time = time + dt

	if total_time > 0 then
		local style = widget.style
		local progress = math.min(time / total_time, 1)
		local catmullrom_value = math.catmullrom(progress, -8, 0, 0, -8)
		local highlight_alpha = 255 * catmullrom_value
		local content = widget.content
		local highlight_style = content.is_playing_boss and style.boss_hp_bar_highlight or style.hp_bar_highlight

		highlight_style.color[1] = highlight_alpha

		self:_set_widget_dirty(widget)

		return progress < 1 and time or nil
	end

	return nil
end

UnitFrameUI._update_player_bar_animation = function (self, content, style, time, total_time, anim_start_value, anim_end_value, dt)
	time = time + dt

	if total_time > 0 then
		local progress = math.min(time / total_time, 1)
		local weight = 7
		local weighted_average = (progress * (weight - 1) + 1) / weight
		local bar_fraction

		if anim_start_value < anim_end_value then
			bar_fraction = anim_start_value + (anim_end_value - anim_start_value) * weighted_average
		else
			bar_fraction = anim_start_value - (anim_start_value - anim_end_value) * weighted_average
		end

		content.bar_value = bar_fraction

		if style.gradient_threshold then
			style.gradient_threshold = bar_fraction
		end

		return progress < 1 and time or nil
	end

	content.bar_value = anim_end_value

	return nil
end

UnitFrameUI._add_slot_equip_animation = function (self, name, widget, style)
	local animations = self.slot_equip_animations
	local inventory_hud_settings = UISettings.inventory_hud
	local total_time = inventory_hud_settings.equip_animation_duration
	local animation = animations[name]

	if animation then
		animation.total_time = total_time
		animation.time = 0
	else
		animations[name] = {
			time = 0,
			total_time = total_time,
			style = style,
			widget = widget,
		}
	end
end

UnitFrameUI._animate_slot_equip = function (self, animation_data, dt)
	local style = animation_data.style
	local total_time = animation_data.total_time
	local time = animation_data.time

	time = time + dt

	local progress = math.min(time / total_time, 1)
	local catmullrom_value = math.catmullrom(progress, -10, 0, 0, -4)

	style.color[1] = 255 * catmullrom_value
	animation_data.time = time

	return progress < 1 and animation_data or nil
end

UnitFrameUI._update_slot_equip_animations = function (self, dt)
	local animations = self.slot_equip_animations
	local dirty = false

	for name, animation_data in pairs(animations) do
		animations[name] = self:_animate_slot_equip(animation_data, dt)

		local widget = animation_data.widget

		self:_set_widget_dirty(widget)

		dirty = true
	end

	return dirty
end

UnitFrameUI._update_connection_animation = function (self, dt)
	if not self._is_visible then
		return false
	end

	local widget = self:_widget_by_feature("default", "dynamic")
	local widget_content = widget.content

	if widget_content.connecting then
		local connecting_icon_style = widget.style.connecting_icon
		local connecting_rotation_speed = 400
		local connecting_rotation_angle = dt * connecting_rotation_speed % 360
		local connecting_radians = math.degrees_to_radians(connecting_rotation_angle)

		connecting_icon_style.angle = connecting_icon_style.angle + connecting_radians

		self:_set_widget_dirty(widget)

		return true
	end
end

UnitFrameUI.update_numeric_ui_health = function (self, player_data)
	local widget = self:_widget_by_feature("health", "dynamic")
	local player = player_data.player
	local player_unit = player and player.player_unit

	if not ALIVE[player_unit] then
		widget.content.numeric_health = ""

		return
	end

	local extensions = player_data.extensions
	local health_extension = extensions and extensions.health

	if not health_extension then
		return
	end

	local max_health = math.ceil(health_extension:get_max_health())
	local current_permanent_health = math.ceil(health_extension:current_permanent_health())
	local current_temporary_health = math.ceil(health_extension:current_temporary_health())

	if not widget.content.numeric_health then
		return
	end

	local is_player = self._frame_type == "player"

	if is_player then
		widget.content.numeric_health = string.format("%d(%d)/%d", current_permanent_health, current_temporary_health, max_health)
	else
		widget.content.numeric_health = string.format("%d/%d", current_permanent_health, max_health)
	end

	self:_set_widget_dirty(widget)
end

UnitFrameUI.update_numeric_ui_ammo = function (self, player_data)
	if self._frame_type == "player" then
		return
	end

	local ammo_ui_data = self._ammo_ui_data
	local widget = self:_widget_by_name("default_dynamic")
	local player = player_data.player
	local player_unit = player and player.player_unit

	if not ALIVE[player_unit] then
		widget.content.has_ranged_weapon = false

		return
	end

	local extensions = player_data.extensions
	local inventory_extension = extensions and extensions.inventory

	if not inventory_extension then
		return
	end

	if self._frame_type == "team" then
		local equipment = inventory_extension:equipment()
		local equipment_slots = equipment.slots
		local slot = InventorySettings.slots_by_name.slot_ranged
		local slot_name = slot.name

		if slot_name == "slot_ranged" then
			local slot_data = equipment_slots[slot_name]

			if not slot_data then
				widget.content.has_ranged_weapon = false

				return
			end

			local item_template = slot_data.item_template

			if not item_template then
				return
			end

			local ammo_data = item_template.ammo_data

			if ammo_data and ammo_data.hide_ammo_ui then
				return
			end

			local current_ammo, max_ammo = inventory_extension:ammo_status()

			if ammo_data and current_ammo and max_ammo then
				widget.content.has_ranged_weapon = true
				widget.content.ammo_count = string.format("%d / %d", current_ammo, max_ammo)

				if ammo_ui_data[player.peer_id] ~= item_template.name then
					ammo_ui_data[player.peer_id] = item_template.name
					self.weapon_changed = true
				else
					self.weapon_changed = false
				end
			else
				widget.content.has_ranged_weapon = false
			end
		end
	end

	self:_set_widget_dirty(widget)
end

UnitFrameUI.update_numeric_ui_career_ability = function (self, game, go_id, player_data)
	local widget = self:_widget_by_name("default_dynamic")
	local player = player_data.player
	local player_unit = player and player.player_unit

	if not ALIVE[player_unit] then
		widget.content.ability_cooldown = ""

		return
	end

	if not widget.content.ability_cooldown then
		return
	end

	local extensions = player_data.extensions
	local career_extension = extensions and extensions.career

	if not career_extension then
		return
	end

	local career_name = career_extension:career_name()
	local ability_percentage = GameSession.game_object_field(game, go_id, "ability_percentage")
	local on_cooldown = ability_percentage > 0.01 and true or false

	widget.content.on_cooldown = on_cooldown

	if not on_cooldown then
		return
	end

	local settings = CareerSettings[career_name]
	local playfab_name = settings.playfab_name
	local max_cooldown

	if not playfab_name then
		_, max_cooldown = career_extension:current_ability_cooldown()
	else
		max_cooldown = ActivatedAbilitySettings[playfab_name][1].cooldown
	end

	local ability_cooldown = max_cooldown * ability_percentage

	widget.content.ability_cooldown = UIUtils.format_time(ability_cooldown)

	self:_set_widget_dirty(widget)
end

UnitFrameUI.set_is_playing_dark_pact_boss = function (self, value)
	local widget = self:_widget_by_name("health_dynamic")
	local content = widget.content

	content.is_playing_boss = value
	self._widgets.default_static.content.is_playing_boss = value
end

local pop_time_between_dmg = 0.01
local pop_dmg_time = 0.7
local pop_dmg_life_time = 2
local dmg_lookup1 = {
	[0] = ".00",
	[25] = ".25",
	[50] = ".50",
	[75] = ".75",
	[100] = ".00",
}
local dmg_lookup2 = {
	[0] = " ",
	[25] = "¼",
	[50] = "½",
	[75] = "¾",
	[100] = " ",
}
local dmg_decimals_lookup = dmg_lookup1
local MAX_NUMBER_OF_DAMAGE_MESSAGES = 4

UnitFrameUI.add_damage_feedback = function (self, hash, is_local_player, event_type, attacker_player, target_player, damage_amount)
	local events = self._damage_events
	local full_hash = hash .. event_type
	local hash_order = self._hash_order
	local dmg_part_pool = self._dmg_part_pool
	local t = Managers.time:time("game")
	local existing_event = events[full_hash]
	local target_name = target_player:cached_name() or target_player.character_name

	if not existing_event then
		existing_event = {
			first_index = 0,
			last_index = 0,
			num_dmg_parts = 0,
			running_parts = 0,
			shown_amount = 0,
			shown_amount_decimal = "",
			text = "",
			text_width = 0,
			event_type = event_type,
			dmg_parts = Script.new_array(32),
			next_increment = t - pop_time_between_dmg,
			remove_time = math.huge,
			local_player = is_local_player,
			target_name = target_name,
		}
		events[full_hash] = existing_event

		local order_index = #hash_order + 1

		hash_order[order_index] = full_hash
		existing_event.hash_order = order_index

		local widget = self._damage_widgets[order_index]

		self._hash_widget_lookup[full_hash] = widget
		widget.content.visible = true
	elseif existing_event.disabled then
		existing_event.disabled = false

		local order_index = #hash_order + 1

		hash_order[order_index] = full_hash
		existing_event.hash_order = order_index

		local widget = self._damage_widgets[order_index]

		self._hash_widget_lookup[full_hash] = widget
		widget.content.visible = true
	end

	local dmg_parts = existing_event.dmg_parts

	existing_event.num_dmg_parts = existing_event.num_dmg_parts + 1

	local integer = math.floor(damage_amount)
	local dec = damage_amount - integer
	local dec_lookup = math.floor((dec + 0.125) * 4) * 25
	local parts = dmg_decimals_lookup[dec_lookup] or "  "
	local damage_amount_txt = integer .. parts

	dmg_parts[existing_event.num_dmg_parts] = {
		damage_amount,
		0,
		"no_id_yet",
		damage_amount_txt,
		0,
	}
	existing_event.remove_time = math.huge

	if #hash_order > MAX_NUMBER_OF_DAMAGE_MESSAGES then
		fassert(false)

		local first_hash = hash_order[1]

		events[first_hash] = nil

		table.remove(hash_order, 1)
		table.remove(self._hash_widget_lookup, 1)
	end
end

local damage_templates = {
	dealing_damage = {
		text_function = function (total_amount, target_name, last_amount)
			return string.format("%s", target_name), total_amount, last_amount
		end,
		sound_function = function ()
			return
		end,
	},
	other_dealing_damage = {
		text_function = function (total_amount, target_name, last_amount)
			return string.format("%s  ", target_name), total_amount, last_amount
		end,
		sound_function = function ()
			return "versus_ui_team_damage_indicator"
		end,
	},
}
local dmg_history_style_lookup = {
	"text_last_dmg",
	"text_last_dmg_2",
	"text_last_dmg_3",
	"text_last_dmg_4",
	"text_last_dmg_5",
	"text_last_dmg_6",
	"text_last_dmg_7",
	"text_last_dmg_8",
	"text_last_dmg_9",
	"text_last_dmg_10",
}

UnitFrameUI._cleanup_damage_event = function (self, event, full_hash)
	event.num_dmg_parts = 0
	event.shown_amount = 0
	event.shown_amount_decimal = ""
	event.last_index = 0
	event.first_index = 0
	event.remove_time = math.huge
	event.text = ""
	event.running_parts = 0
	event.disabled = true

	local widget = self._hash_widget_lookup[full_hash]
	local widget_style = widget.style
	local dmg_parts = event.dmg_parts

	for i = 1, #dmg_parts do
		local dmg_part = dmg_parts[i]

		dmg_part[1] = 0
		dmg_part[2] = math.huge

		local damage_id = dmg_part[3]
		local style = widget_style[damage_id]

		if style then
			style.text_color[1] = 0
		end
	end
end

UnitFrameUI._update_damage_feedback = function (self, dt, t)
	local hash_order = self._hash_order
	local num_rows = #hash_order

	if num_rows <= 0 then
		return
	end

	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("Player")

	for i = num_rows, 1, -1 do
		local full_hash = hash_order[i]
		local widget = self._hash_widget_lookup[full_hash]
		local widget_content = widget.content
		local widget_style = widget.style
		local event = self._damage_events[full_hash]
		local template = damage_templates[event.event_type]

		if t > event.remove_time then
			self:_cleanup_damage_event(event, full_hash)
			table.remove(hash_order, i)

			widget_content.visible = false
		elseif t > event.next_increment and event.last_index < event.num_dmg_parts then
			event.last_index = event.last_index + 1

			local dmg_part = event.dmg_parts[event.last_index]

			dmg_part[2] = t + pop_dmg_life_time

			local index = (event.last_index - 1) % 10 + 1
			local damage_id = dmg_history_style_lookup[index]

			dmg_part[3] = damage_id
			dmg_part[5] = index
			event.old_shown_amount = event.shown_amount
			event.shown_amount = event.shown_amount + dmg_part[1]
			event.old_shown_amount_decimal = event.shown_amount_decimal

			local dec = event.shown_amount - math.floor(event.shown_amount)
			local dec_lookup = math.floor((dec + 0.125) * 4) * 25

			event.shown_amount_decimal = dmg_decimals_lookup[dec_lookup] or ".??"

			if event.running_parts == 0 then
				event.first_index = 1
			end

			event.running_parts = event.running_parts + 1
			event.next_increment = t + pop_time_between_dmg
			event.scale_timer = t + pop_dmg_time

			local wwise_world = Managers.world:wwise_world(self.world)
			local sound_event = template.sound_function()

			if sound_event then
				WwiseWorld.trigger_event(wwise_world, sound_event)
			end

			event.text = event.target_name
			event.remove_time = t + pop_dmg_life_time

			local font, scaled_font_size = UIFontByResolution(widget_style.text)

			event.text_width = UIRenderer.text_size(ui_renderer, event.text, font[1], scaled_font_size)
		end

		local time_left = event.remove_time - t
		local fade_duration = UISettings.damage_feedback.fade_duration
		local alpha = 255 * math.clamp(time_left / fade_duration, 0, 1)

		widget_content.text = event.text
		widget_content.icon_texture = event.icon_texture
		widget_style.text.text_color[1] = alpha
		widget_style.text.offset[1] = event.text_width * 0.5

		local v, v2, scale = 0, 0, 0

		if event.scale_timer then
			if t <= event.scale_timer then
				v = math.clamp((event.scale_timer - t) / pop_dmg_time, 0, 1)
				v2 = v > 0.5 and 0.7 or 0
				scale = math.ease_pulse(v)
			else
				event.scale_timer = nil
			end
		end

		event.text_total_sum = v > 0.5 and event.old_shown_amount or event.shown_amount

		local font, scaled_font_size = UIFontByResolution(widget.style.text_total_sum)
		local text_width = UIRenderer.text_size(ui_renderer, math.floor(event.text_total_sum), font[1], scaled_font_size)

		event.text_width_total_sum = text_width

		local tcol = DamageUtils.get_color_from_damage(event.text_total_sum)
		local DAMAGE_FONT_SIZE = 24

		widget_style.text_total_sum.font_size = DAMAGE_FONT_SIZE + 10 * scale

		local total_dmg_width = DAMAGE_FONT_SIZE * #tostring("99.99") * 0.2
		local total_dmg_offset = widget_style.text.offset[1] + event.text_width * 0.5 + total_dmg_width

		widget_style.text_total_sum.offset[1] = total_dmg_offset
		widget_style.text_total_sum.text_color = tcol
		widget_style.text_total_sum.text_color[1] = math.clamp(alpha, 1, 254)

		local damage_icon = widget_style.damage_icon

		damage_icon.color = tcol

		local icon_scale = 24 + 10 * scale * v2

		damage_icon.size[1] = icon_scale
		damage_icon.size[2] = icon_scale
		widget.content.text_total_sum = math.floor(event.text_total_sum)
		event.text_total_sum_decimal_part = v > 0.5 and event.old_shown_amount_decimal or event.shown_amount_decimal
		widget.content.text_total_sum_decimal_part = event.text_total_sum_decimal_part
		widget_style.text_total_sum_decimal_part.offset[1] = total_dmg_offset + event.text_width_total_sum * 0.5
		widget_style.text_total_sum_decimal_part.text_color = widget_style.text_total_sum.text_color

		local last_dmg_start_offset = total_dmg_offset + total_dmg_width
		local dmg_parts = event.dmg_parts
		local first_index = event.first_index

		if event.running_parts > 0 then
			local end_time = dmg_parts[first_index][2]

			if end_time < t then
				local remove_part = dmg_parts[first_index]
				local damage_id = remove_part[3]
				local style = widget_style[damage_id]

				style.text_color[1] = 0
				remove_part[2] = math.huge
				first_index = first_index + 1
				event.first_index = first_index
				event.running_parts = event.running_parts - 1
			end

			local from = first_index
			local to = event.last_index
			local k = 1

			for i = from, to do
				local dmg_part = dmg_parts[i]
				local part_damage = dmg_part[4]
				local part_time = dmg_part[2]
				local damage_id = dmg_part[3]
				local style = widget_style[damage_id]
				local z = math.clamp((part_time - t) / pop_dmg_life_time, 0, 1)

				style.offset[1] = last_dmg_start_offset + math.easeOutCubic(1 - z) * 200
				style.text_color[2] = tcol[2]
				style.text_color[3] = tcol[3]
				style.text_color[4] = tcol[4]
				style.text_color[1] = z * z * 255
				widget_content[damage_id] = part_damage
				k = k + 1
			end
		end
	end

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)

	for _, widget in pairs(self._hash_widget_lookup) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)

	return true
end

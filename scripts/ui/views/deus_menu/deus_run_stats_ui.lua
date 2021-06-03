local definitions = local_require("scripts/ui/views/deus_menu/deus_run_stats_ui_definitions")
local animations_definitions = definitions.animations_definitions
local reminder_widgets_definitions = definitions.reminder_widgets
local generic_input_actions = definitions.generic_input_actions
DeusRunStatsUi = class(DeusRunStatsUi)

DeusRunStatsUi.init = function (self, ingame_ui_context, parent)
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._wwise_world = ingame_ui_context.wwise_world
	self._render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = true
	}
	self._ingame_ui_context = ingame_ui_context
	self._parent = parent
	self._gamepad_row_index = 1
	self._gamepad_column_index = 1
	self._active = false
	self._blessing_widgets = {}
	self._power_up_widgets = {}
	self._reminders = {}
	self._animations = {}

	self:_create_ui_elements()
	Managers.state.event:register(self, "present_rewards", "show_info_message")
end

DeusRunStatsUi.show_info_message = function (self, rewards)
	for i = 1, #rewards, 1 do
		local reward = rewards[i]

		if table.size(self._animations) == 0 then
			self:_start_animation("reminder", reward.type)
		else
			self._reminders[#self._reminders + 1] = reward.type
		end
	end
end

DeusRunStatsUi._start_animation = function (self, animation_name, info_type)
	local params = {}
	local widget = self._reminder_widgets_by_name.reminder_text
	widget.content.info_type = info_type
	local anim_id = self._ui_animator:start_animation(animation_name, widget, definitions.scenegraph, params)
	self._animations[animation_name] = anim_id
end

DeusRunStatsUi._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph)
	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(definitions.widgets) do
		if widget_definition then
			local widget = UIWidget.init(widget_definition)
			widgets[#widgets + 1] = widget
			widgets_by_name[name] = widget
		end
	end

	local equipment_widgets = {}
	local equipment_widgets_by_name = {}

	for name, widget_definition in pairs(definitions.equipment_widgets) do
		if widget_definition then
			local widget = UIWidget.init(widget_definition)
			equipment_widgets[#equipment_widgets + 1] = widget
			equipment_widgets_by_name[name] = widget
		end
	end

	local reminder_widgets = {}
	local reminder_widgets_by_name = {}

	for name, widget_definition in pairs(reminder_widgets_definitions) do
		if widget_definition then
			local widget = UIWidget.init(widget_definition)
			reminder_widgets[#reminder_widgets + 1] = widget
			reminder_widgets_by_name[name] = widget
		end
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name
	self._reminder_widgets = reminder_widgets
	self._reminder_widgets_by_name = reminder_widgets_by_name
	self._equipment_widgets = equipment_widgets
	self._equipment_widgets_by_name = equipment_widgets_by_name

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)
	UIRenderer.clear_scenegraph_queue(self._ui_top_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animations_definitions)
	local input_service = self._parent:input_service()
	self._menu_input_description = MenuInputDescriptionUI:new(self._ingame_ui_context, self._ui_top_renderer, input_service, 6, nil, generic_input_actions.default, false)

	self._menu_input_description:set_input_description(nil)
end

DeusRunStatsUi.update = function (self, dt, t)
	self:_update_animations(dt, t)
	self:_handle_gamepad_input(dt, t)
	self:_handle_input(dt, t)
	self:_draw(dt, t)
	self:_draw_reminder(dt, t)
end

DeusRunStatsUi._update_animations = function (self, dt, t)
	self._ui_animator:update(dt)

	local animations = self._animations
	local ui_animator = self._ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end
end

DeusRunStatsUi.lock = function (self, lock)
	local locked = self._locked
	self._locked = lock
	local input_manager = Managers.input

	if not locked and lock then
		ShowCursorStack.push()
		input_manager:block_device_except_service("deus_run_stats_view", "keyboard")
		input_manager:block_device_except_service("deus_run_stats_view", "mouse")
		input_manager:block_device_except_service("deus_run_stats_view", "gamepad")
	elseif locked and not lock then
		ShowCursorStack.pop()
		input_manager:device_unblock_all_services("keyboard")
		input_manager:device_unblock_all_services("mouse")
		input_manager:device_unblock_all_services("gamepad")

		self._gamepad_row_index = 1
		self._gamepad_column_index = 1
	end
end

DeusRunStatsUi.locked = function (self)
	return self._locked
end

DeusRunStatsUi.set_active = function (self, active)
	self._active = active
end

DeusRunStatsUi.active = function (self)
	return self._active
end

DeusRunStatsUi._handle_input = function (self, dt, t)
	if not self._active then
		return
	end

	local input_service = self._parent:input_service()
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if (not gamepad_active and input_service:get("hotkey_inventory", false)) or input_service:get("toggle_menu") or input_service:get("back") then
		self:lock(false)
	end

	local ui_scenegraph = self._ui_scenegraph
	local power_up_widgets = self._power_up_widgets
	local power_up_description_widget = self._widgets_by_name.power_up_description
	local current_power_up = nil
	local extend_left = false
	local gamepad_selection_index = gamepad_active and self._gamepad_row_index + definitions.max_power_up_amount * 0.5 * (self._gamepad_column_index - 1)

	for i = 1, #power_up_widgets, 1 do
		local widget = self._power_up_widgets[i]

		if UIUtils.is_button_hover(widget) or gamepad_selection_index == i then
			local scenegraph_id = widget.scenegraph_id
			local world_position = UISceneGraph.get_world_position(ui_scenegraph, scenegraph_id)
			ui_scenegraph.power_up_description_root.local_position[1] = world_position[1]
			ui_scenegraph.power_up_description_root.local_position[2] = world_position[2]
			power_up_description_widget.content.visible = true
			current_power_up = widget.content.power_up
			extend_left = i > definitions.max_power_up_amount * 0.5

			break
		end
	end

	if current_power_up ~= self._current_power_up then
		self:_populate_power_up(current_power_up, power_up_description_widget, extend_left)
	end

	self._current_power_up = current_power_up
end

DeusRunStatsUi._handle_gamepad_input = function (self, dt, t)
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if not gamepad_active or not self._active then
		return
	end

	local input_service = self._parent:input_service()
	local num_power_ups = #self._power_up_widgets
	local items_in_a_column = definitions.max_power_up_amount * 0.5
	local num_columns = math.ceil(num_power_ups / items_in_a_column)

	if input_service:get("move_down") then
		local items_in_this_column = math.min(num_power_ups - items_in_a_column * (self._gamepad_column_index - 1), items_in_a_column)
		self._gamepad_row_index = math.min(self._gamepad_row_index + 1, items_in_this_column)
	elseif input_service:get("move_up") then
		self._gamepad_row_index = math.max(self._gamepad_row_index - 1, 1)
	elseif input_service:get("move_right") then
		self._gamepad_column_index = math.min(self._gamepad_column_index + 1, num_columns)
		self._gamepad_row_index = math.min(self._gamepad_row_index, num_power_ups - items_in_a_column * (self._gamepad_column_index - 1))
	elseif input_service:get("move_left") then
		self._gamepad_column_index = math.max(self._gamepad_column_index - 1, 1)
		self._gamepad_row_index = math.min(self._gamepad_row_index, num_power_ups - items_in_a_column * (self._gamepad_column_index - 1))
	end
end

DeusRunStatsUi._populate_power_up = function (self, power_up_instance, power_up_description_widget, extend_left)
	if not power_up_instance then
		power_up_description_widget.content.visible = false

		return
	end

	local power_up = DeusPowerUps[power_up_instance.rarity][power_up_instance.name]
	local content = power_up_description_widget.content
	local style = power_up_description_widget.style
	local player = Managers.player:local_player()
	local profile_index = player:profile_index()
	local career_index = player:career_index()
	local rarity = power_up.rarity
	content.title_text = DeusPowerUpUtils.get_power_up_name_text(power_up.name, power_up.talent_index, power_up.talent_tier, profile_index, career_index)
	content.rarity_text = Localize(RaritySettings[rarity].display_name)
	content.description_text = DeusPowerUpUtils.get_power_up_description(power_up, profile_index, career_index)
	content.icon = DeusPowerUpUtils.get_power_up_icon(power_up, profile_index, career_index)
	content.extend_left = true
	local power_up_template = DeusPowerUpTemplates[power_up.name]
	content.is_rectangular_icon = power_up_template.rectangular_icon
	local style = power_up_description_widget.style
	local rarity_color = Colors.get_table(rarity)
	style.rarity_text.text_color = rarity_color
	power_up_description_widget.content.visible = true
end

DeusRunStatsUi._draw_reminder = function (self, dt, t)
	if self._active or table.size(self._animations) == 0 then
		return
	end

	local ui_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local render_settings = self._render_settings
	local input_service = self._parent:input_service()

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local widgets = self._reminder_widgets

	for i = 1, #widgets, 1 do
		local widget = widgets[i]

		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)
end

DeusRunStatsUi._draw = function (self, dt, t)
	if not self._active then
		return
	end

	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local render_settings = self._render_settings
	local input_service = self._parent:input_service()

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local snap_pixel_positions = render_settings.snap_pixel_positions
	local blessing_widgets = self._blessing_widgets

	for i = 1, #blessing_widgets, 1 do
		local widget = blessing_widgets[i]

		if widget.snap_pixel_positions ~= nil then
			render_settings.snap_pixel_positions = widget.snap_pixel_positions
		end

		UIRenderer.draw_widget(ui_renderer, widget)

		render_settings.snap_pixel_positions = snap_pixel_positions
	end

	local power_up_widgets = self._power_up_widgets

	for i = 1, #power_up_widgets, 1 do
		local widget = power_up_widgets[i]

		if widget.snap_pixel_positions ~= nil then
			render_settings.snap_pixel_positions = widget.snap_pixel_positions
		end

		UIRenderer.draw_widget(ui_renderer, widget)

		render_settings.snap_pixel_positions = snap_pixel_positions
	end

	local widgets = self._widgets

	for i = 1, #widgets, 1 do
		local widget = widgets[i]

		if widget.snap_pixel_positions ~= nil then
			render_settings.snap_pixel_positions = widget.snap_pixel_positions
		end

		UIRenderer.draw_widget(ui_renderer, widget)

		render_settings.snap_pixel_positions = snap_pixel_positions
	end

	local widgets = self._equipment_widgets

	for i = 1, #widgets, 1 do
		local widget = widgets[i]

		if widget.snap_pixel_positions ~= nil then
			render_settings.snap_pixel_positions = widget.snap_pixel_positions
		end

		UIRenderer.draw_widget(ui_renderer, widget)

		render_settings.snap_pixel_positions = snap_pixel_positions
	end

	UIRenderer.end_pass(ui_renderer)

	local gamepad_active = Managers.input:is_device_active("gamepad")

	if gamepad_active then
		self._menu_input_description:draw(self._ui_top_renderer, dt)
	end
end

DeusRunStatsUi._play_sound = function (self, event)
	WwiseWorld.trigger_event(self._wwise_world, event)
end

DeusRunStatsUi.destroy = function (self)
	self:lock(false)
end

DeusRunStatsUi.update_dynamic_values = function (self, data)
	self:_update_blessings(data.blessings)
	self:_update_power_ups(data.party_power_ups, data.power_ups, data.profile_index, data.career_index)
end

DeusRunStatsUi._update_blessings = function (self, blessings)
	local has_blessings = #blessings > 0
	local no_blessings_text_widget = self._widgets_by_name.no_blessings_text
	no_blessings_text_widget.content.text = (has_blessings and "") or Localize("no_active_blessings_text")
	local widget_prefix = "blessing_"

	for name, _ in pairs(self._widgets_by_name) do
		if string.starts_with(name, widget_prefix) then
			self._widgets_by_name[name] = nil
		end
	end

	local blessings_widgets = {}

	if has_blessings then
		local widget_data = definitions.blessing_widget_data
		local num_blessings = math.min(#blessings, widget_data.max_blessing_amount)

		for i = 1, num_blessings, 1 do
			local blessing_name = blessings[i]
			local blessing = DeusBlessingSettings[blessing_name]
			local title_text = Localize(blessing.display_name)
			local info_text = Localize(blessing.description)
			local icon = blessing.icon
			local scenegraph_id = "blessing_" .. i
			local widget_definition = UIWidgets.create_framed_info_box(scenegraph_id, widget_data.title_frame_name, widget_data.info_frame_name, nil, nil, icon, widget_data.icon_size, widget_data.icon_frame_name, title_text, info_text, widget_data.bottom_panel_size)
			local widget = UIWidget.init(widget_definition)
			blessings_widgets[i] = widget
			self._widgets_by_name[widget_prefix .. i] = widget
		end
	end

	self._blessing_widgets = blessings_widgets
end

DeusRunStatsUi._update_power_ups = function (self, party_power_ups, power_ups, profile_index, career_index)
	local has_power_ups = #power_ups > 0 or #party_power_ups > 0
	local power_up_widgets = {}

	if has_power_ups then
		local rarity_settings = RaritySettings

		table.sort(power_ups, function (a, b)
			local rarity_order_a = rarity_settings[a.rarity].order
			local rarity_order_b = rarity_settings[b.rarity].order

			if rarity_order_a == rarity_order_b then
				return a.name < b.name
			else
				return rarity_order_b < rarity_order_a
			end
		end)

		local power_up_templates = DeusPowerUpTemplates
		local num_power_ups = math.min(#power_ups + #party_power_ups, definitions.max_power_up_amount)

		for i = 1, num_power_ups, 1 do
			local power_up_instance = nil

			if i <= #power_ups then
				power_up_instance = power_ups[i]
			else
				power_up_instance = party_power_ups[i - #power_ups]
			end

			local power_up = DeusPowerUps[power_up_instance.rarity][power_up_instance.name]
			local title_text, sub_text = DeusPowerUpUtils.get_power_up_name_text(power_up.name, power_up.talent_index, power_up.talent_tier, profile_index, career_index)
			local icon = DeusPowerUpUtils.get_power_up_icon(power_up, profile_index, career_index)
			local text_color = Colors.get_table(power_up.rarity)
			local power_up_template = power_up_templates[power_up.name]
			local is_rectangular_icon = power_up_template.rectangular_icon
			local widget_data = (is_rectangular_icon and definitions.rectangular_power_up_widget_data) or definitions.round_power_up_widget_data
			local hide_text = true
			local idx = #power_up_widgets + 1
			local scenegraph_id = "power_up_" .. idx
			local widget_definition = UIWidgets.create_icon_info_box(scenegraph_id, icon, widget_data.icon_size, widget_data.icon_offset, widget_data.background_icon, widget_data.background_icon_size, widget_data.background_icon_offset, sub_text, title_text, text_color, widget_data.width, power_up, is_rectangular_icon, hide_text)
			local widget = UIWidget.init(widget_definition)
			power_up_widgets[#power_up_widgets + 1] = widget
			self._widgets_by_name[scenegraph_id] = widget
		end
	end

	self._power_up_widgets = power_up_widgets
	self._power_ups = power_ups
	self._party_power_ups = party_power_ups
end

DeusRunStatsUi.set_loadout = function (self, melee, ranged, healing_slot, potion_slot, grenade_slot)
	self._equipment_widgets_by_name.weapon_melee.content.item = melee
	self._equipment_widgets_by_name.weapon_ranged.content.item = ranged
	local healing_widget = self._equipment_widgets_by_name.healing_slot
	local potion_widget = self._equipment_widgets_by_name.potion_slot
	local grenade_widget = self._equipment_widgets_by_name.grenade_slot
	local healing_item = healing_slot and ItemMasterList[healing_slot]
	healing_widget.content.icon = (healing_item and healing_item.hud_icon) or "consumables_empty_medpack"
	healing_widget.content.title_text = (healing_item and Localize(healing_slot)) or Localize("deus_weapon_inspect_title_unavailable")
	healing_widget.content.info_text = (healing_item and Localize(healing_item.description)) or Localize("deus_weapon_inspect_info_unavailable")
	healing_widget.content.visible = healing_item ~= nil
	local potion_item = potion_slot and ItemMasterList[potion_slot]
	local potion_icon = "consumables_empty_potion"
	local potion_title_text = Localize("deus_weapon_inspect_title_unavailable")
	local potion_info_text = Localize("deus_weapon_inspect_info_unavailable")

	if potion_item then
		potion_icon = potion_item.hud_icon or potion_icon
		potion_title_text = Localize(potion_slot)
		potion_info_text = UIUtils.format_localized_description(potion_item.description, potion_item.description_values)
	end

	potion_widget.content.icon = potion_icon
	potion_widget.content.title_text = potion_title_text
	potion_widget.content.info_text = potion_info_text
	potion_widget.content.visible = potion_item ~= nil
	local grenade_item = grenade_slot and ItemMasterList[grenade_slot]
	grenade_widget.content.icon = (grenade_item and grenade_item.hud_icon) or "consumables_empty_grenade"
	grenade_widget.content.title_text = (grenade_item and Localize(grenade_slot)) or Localize("deus_weapon_inspect_title_unavailable")
	grenade_widget.content.info_text = (grenade_item and Localize(grenade_item.description)) or Localize("deus_weapon_inspect_info_unavailable")
	grenade_widget.content.visible = grenade_item ~= nil
end

DeusRunStatsUi._create_player_portrait = function (self, portrait_frame, portrait_image, player_level_text)
	local definition = UIWidgets.create_portrait_frame("player_portrait", portrait_frame, player_level_text, 1, nil, portrait_image)
	local widget = UIWidget.init(definition)

	table.insert(self._widgets, widget)

	self._widgets_by_name.player_portrait = widget
end

DeusRunStatsUi._set_widget_text = function (self, widget_name, text)
	local widget = self._widgets_by_name[widget_name]
	widget.content.text = text
end

return

-- chunkname: @scripts/ui/views/deus_menu/deus_run_stats_ui.lua

local definitions = local_require("scripts/ui/views/deus_menu/deus_run_stats_ui_definitions")
local animations_definitions = definitions.animations_definitions
local reminder_widgets_definitions = definitions.reminder_widgets
local generic_input_actions = definitions.generic_input_actions
local ALLOW_BOON_REMOVAL = definitions.allow_boon_removal

DeusRunStatsUi = class(DeusRunStatsUi)

DeusRunStatsUi.init = function (self, ingame_ui_context, parent)
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._wwise_world = ingame_ui_context.wwise_world
	self._render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = true,
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
	self._ui_animations = {}
	self._force_update_power_ups = false

	self:_create_ui_elements()
	Managers.state.event:register(self, "present_rewards", "show_info_message")
end

DeusRunStatsUi.show_info_message = function (self, rewards)
	for i = 1, #rewards do
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

	local ui_animations = self._ui_animations

	for name, animation in pairs(ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			self._ui_animations[name] = nil
		end
	end

	if self._ui_animations.move_scrollbar and self._scrollbar_ui then
		self._scrollbar_ui:force_update_progress(2)
	end
end

DeusRunStatsUi.lock = function (self, lock, show_fullscreen_fade)
	local locked = self._locked

	self._locked = lock
	self._widgets_by_name.fullscreen_fade.content.visible = show_fullscreen_fade

	local input_manager = Managers.input

	if not locked and lock then
		ShowCursorStack.show("DeusRunStatsUi")
		input_manager:block_device_except_service("deus_run_stats_view", "keyboard")
		input_manager:block_device_except_service("deus_run_stats_view", "mouse")
		input_manager:block_device_except_service("deus_run_stats_view", "gamepad")
	elseif locked and not lock then
		ShowCursorStack.hide("DeusRunStatsUi")
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
	if active ~= self._active then
		Managers.state.event:trigger("ingame_player_list_enabled", active)
	end

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

	if not gamepad_active and input_service:get("hotkey_inventory", false) or input_service:get("toggle_menu") or input_service:get("back") then
		self:lock(false)
	end

	local ui_scenegraph = self._ui_scenegraph
	local power_up_widgets = self._power_up_widgets
	local power_up_description_widget = self._widgets_by_name.power_up_description
	local current_power_up_name, power_up_rarity
	local extend_left = true

	for i = 1, #power_up_widgets do
		local widget = self._power_up_widgets[i]
		local row_index = math.ceil(i / 2)
		local column_index = i % 2 == 0 and 2 or 1

		if UIUtils.is_button_hover(widget) or gamepad_active and self._gamepad_row_index == row_index and self._gamepad_column_index == column_index then
			local scenegraph_id = widget.scenegraph_id
			local world_position = UISceneGraph.get_world_position(ui_scenegraph, scenegraph_id)
			local offset = widget.offset

			ui_scenegraph.power_up_description_root.local_position[1] = world_position[1] + offset[1]
			ui_scenegraph.power_up_description_root.local_position[2] = world_position[2] + offset[2]
			current_power_up_name = widget.content.power_up_name
			power_up_rarity = widget.content.power_up_rarity

			local locked = widget.content.locked
			local locked_text_id = widget.content.locked_text_id
			local content = power_up_description_widget.content
			local style = power_up_description_widget.style

			content.visible = true
			content.locked = locked
			content.locked_text_id = locked_text_id or content.locked_text_id

			if locked then
				content.end_time = nil
				content.progress = nil
				content.input_made = false
				style.remove_frame.color[1] = 0

				break
			end

			if ALLOW_BOON_REMOVAL then
				if input_service:get("mouse_middle_press") or input_service:get("special_1_press") then
					content.input_made = true
					style.remove_frame.color[1] = 0

					self:_play_sound("Play_gui_boon_removal_start")

					break
				end

				if content.input_made and (input_service:get("mouse_middle_held") or input_service:get("special_1_hold")) then
					do
						local end_time = content.end_time or t + content.remove_interaction_duration
						local progress = (end_time - t) / content.remove_interaction_duration

						style.remove_frame.color[1] = 255 * (1 - progress)

						local done = progress <= 0

						if done then
							content.end_time = nil
							content.progress = nil
							content.input_made = false

							local mechanism = Managers.mechanism:game_mechanism()
							local deus_run_controller = mechanism:get_deus_run_controller()
							local player = Managers.player:local_player()
							local local_player_id = player:local_player_id()

							self._force_update_power_ups = deus_run_controller:remove_power_ups(current_power_up_name, local_player_id)

							self:_play_sound("Play_gui_boon_removal_end")

							break
						end

						content.end_time = end_time
						content.progress = progress
					end

					break
				end

				if content.input_made then
					self:_play_sound("Stop_gui_boon_removal_start")
				end

				content.end_time = nil
				content.progress = nil
				content.input_made = false
				style.remove_frame.color[1] = 0
			end

			break
		end
	end

	if current_power_up_name ~= self._current_power_up_name then
		self:_populate_power_up(current_power_up_name, power_up_rarity, power_up_description_widget, extend_left)
	end

	self._current_power_up_name = current_power_up_name
end

local POWER_UP_SLOTS = {}

DeusRunStatsUi._handle_gamepad_input = function (self, dt, t)
	local gamepad_was_active = self._gamepad_active
	local gamepad_active = Managers.input:is_device_active("gamepad")

	self._gamepad_active = gamepad_active

	if not gamepad_active or not self._active then
		return
	end

	local input_service = self._parent:input_service()
	local num_power_ups = #self._power_up_widgets
	local num_columns = 2

	table.clear(POWER_UP_SLOTS)

	POWER_UP_SLOTS[1] = math.ceil(num_power_ups / num_columns)
	POWER_UP_SLOTS[2] = math.floor(num_power_ups / num_columns)

	local old_gamepad_row_index = self._gamepad_row_index
	local old_gamepad_column_index = self._gamepad_column_index

	if input_service:get("move_down_hold_continuous") then
		self._gamepad_row_index = math.min(self._gamepad_row_index + 1, POWER_UP_SLOTS[self._gamepad_column_index])
	elseif input_service:get("move_up_hold_continuous") then
		self._gamepad_row_index = math.max(self._gamepad_row_index - 1, 1)
	elseif input_service:get("move_right") then
		local column_index = math.min(self._gamepad_column_index + 1, num_columns)

		if POWER_UP_SLOTS[column_index] >= self._gamepad_row_index then
			self._gamepad_column_index = column_index
		end
	elseif input_service:get("move_left") then
		self._gamepad_column_index = math.max(self._gamepad_column_index - 1, 1)
	end

	if old_gamepad_column_index ~= self._gamepad_column_index or old_gamepad_row_index ~= self._gamepad_row_index or gamepad_was_active ~= gamepad_active then
		local window_height = self._ui_scenegraph.power_up_window.size[2]
		local offset = math.min(self._gamepad_row_index + 3, POWER_UP_SLOTS[1]) * (definitions.power_up_widget_size[2] + definitions.power_up_widget_spacing[2])
		local excess = math.max(offset - window_height, 0)

		self._ui_animations.move_scrollbar = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.power_up_anchor.local_position, 2, self._ui_scenegraph.power_up_anchor.local_position[2], excess, 0.5, math.easeOutCubic)
	end
end

DeusRunStatsUi._populate_power_up = function (self, power_up_name, power_up_rarity, power_up_description_widget, extend_left)
	if not power_up_name then
		power_up_description_widget.content.visible = false

		return
	end

	local power_up = DeusPowerUps[power_up_rarity][power_up_name]
	local content = power_up_description_widget.content
	local player = Managers.player:local_player()
	local profile_index, career_index = player:profile_index(), player:career_index()
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

	style.rarity_text_left.text_color = rarity_color
	power_up_description_widget.content.visible = true

	local power_up_sets = DeusPowerUpSetLookup[rarity] and DeusPowerUpSetLookup[rarity][power_up.name]
	local is_part_of_set = false

	if power_up_sets then
		local set = power_up_sets[1]
		local piece_count = 0
		local pieces = set.pieces
		local mechanism = Managers.mechanism:game_mechanism()
		local deus_run_controller = mechanism:get_deus_run_controller()

		for _, piece in ipairs(pieces) do
			local name, rarity = piece.name, piece.rarity
			local local_peer_id = deus_run_controller:get_own_peer_id()

			if deus_run_controller:has_power_up_by_name(local_peer_id, name, rarity) then
				piece_count = piece_count + 1
			end
		end

		is_part_of_set = true

		local num_required_pieces = set.num_required_pieces or #pieces

		content.set_progression = Localize("set_bonus_boons") .. " " .. string.format(Localize("set_counter_boons"), piece_count, num_required_pieces)

		if #pieces == piece_count then
			style.set_progression.text_color = style.set_progression.progression_colors.complete
		end
	end

	content.is_part_of_set = is_part_of_set
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

	for i = 1, #widgets do
		local widget = widgets[i]

		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)
end

DeusRunStatsUi._draw = function (self, dt, t)
	if not self._active then
		return
	end

	local ui_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local render_settings = self._render_settings
	local input_service = self._parent:input_service()

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local snap_pixel_positions = render_settings.snap_pixel_positions
	local blessing_widgets = self._blessing_widgets

	for i = 1, #blessing_widgets do
		local widget = blessing_widgets[i]

		if widget.snap_pixel_positions ~= nil then
			render_settings.snap_pixel_positions = widget.snap_pixel_positions
		end

		UIRenderer.draw_widget(ui_renderer, widget)

		render_settings.snap_pixel_positions = snap_pixel_positions
	end

	local power_up_widgets = self._power_up_widgets

	for i = 1, #power_up_widgets do
		local widget = power_up_widgets[i]

		if widget.snap_pixel_positions ~= nil then
			render_settings.snap_pixel_positions = widget.snap_pixel_positions
		end

		UIRenderer.draw_widget(ui_renderer, widget)

		render_settings.snap_pixel_positions = snap_pixel_positions
	end

	local widgets = self._widgets

	for i = 1, #widgets do
		local widget = widgets[i]

		if widget.snap_pixel_positions ~= nil then
			render_settings.snap_pixel_positions = widget.snap_pixel_positions
		end

		UIRenderer.draw_widget(ui_renderer, widget)

		render_settings.snap_pixel_positions = snap_pixel_positions
	end

	local widgets = self._equipment_widgets

	for i = 1, #widgets do
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

	if self._scrollbar_ui then
		self._scrollbar_ui:update(dt, t, ui_renderer, input_service, render_settings)
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

	self._force_update_power_ups = false
end

DeusRunStatsUi.force_update_power_ups = function (self)
	return self._force_update_power_ups
end

DeusRunStatsUi._update_blessings = function (self, blessings)
	local has_blessings = #blessings > 0
	local no_blessings_text_widget = self._widgets_by_name.no_blessings_text

	no_blessings_text_widget.content.text = has_blessings and "" or Localize("no_active_blessings_text")

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

		for i = 1, num_blessings do
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
		local mechanism = Managers.mechanism:game_mechanism()
		local deus_run_controller = mechanism:get_deus_run_controller()
		local initial_talents = deus_run_controller:get_own_initial_talents()
		local profile = SPProfiles[profile_index]
		local career_name = profile.careers[career_index].name
		local initial_talents_for_career = initial_talents[career_name]
		local talent_power_ups = {}

		for tier = 1, #initial_talents_for_career do
			local column = initial_talents_for_career[tier]

			if column ~= 0 then
				local power_up, _ = DeusPowerUpUtils.get_talent_power_up_from_tier_and_column(tier, column)

				talent_power_ups[power_up.name] = true
			end
		end

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
		local num_power_ups = #power_ups + #party_power_ups

		for i = 1, num_power_ups do
			local power_up_instance
			local is_party_power_up = false

			if i <= #power_ups then
				power_up_instance = power_ups[i]
			else
				power_up_instance = party_power_ups[i - #power_ups]
				is_party_power_up = true
			end

			local power_up = DeusPowerUps[power_up_instance.rarity][power_up_instance.name]
			local title_text, sub_text = DeusPowerUpUtils.get_power_up_name_text(power_up.name, power_up.talent_index, power_up.talent_tier, profile_index, career_index)
			local icon = DeusPowerUpUtils.get_power_up_icon(power_up, profile_index, career_index)
			local text_color = Colors.get_table(power_up.rarity)
			local power_up_template = power_up_templates[power_up.name]
			local is_rectangular_icon = power_up_template.rectangular_icon
			local widget_data = is_rectangular_icon and definitions.rectangular_power_up_widget_data or definitions.round_power_up_widget_data
			local hide_text = true
			local masked = true
			local icon_hotspot = {
				color = {
					255,
					138,
					172,
					235,
				},
				offset = definitions.rectangular_power_up_widget_data.icon_offset,
				texture_size = definitions.rectangular_power_up_widget_data.icon_size,
			}
			local scenegraph_id = "power_up_anchor"
			local widget_definition = UIWidgets.create_icon_info_box(scenegraph_id, icon, widget_data.icon_size, widget_data.icon_offset, widget_data.background_icon, widget_data.background_icon_size, widget_data.background_icon_offset, sub_text, title_text, text_color, widget_data.width, is_rectangular_icon, hide_text, masked, icon_hotspot)
			local widget = UIWidget.init(widget_definition)

			widget.content.power_up_name = power_up.name
			widget.content.power_up_rarity = power_up.rarity
			widget.content.locked = is_party_power_up or talent_power_ups[power_up.name]
			widget.content.locked_text_id = is_party_power_up and "party_locked" or talent_power_ups[power_up.name] and "talent_locked" or "search_filter_locked"

			local column = (i - 1) % 2

			widget.offset[1] = column * (definitions.power_up_widget_size[1] + definitions.power_up_widget_spacing[1])
			widget.offset[2] = -math.floor((i - 1) / 2) * (definitions.power_up_widget_size[2] + definitions.power_up_widget_spacing[2])
			power_up_widgets[#power_up_widgets + 1] = widget
			self._widgets_by_name[scenegraph_id] = widget
		end

		local num_columns = 2
		local gamepad_index = (self._gamepad_row_index - 1) * num_columns + self._gamepad_column_index

		if num_power_ups < gamepad_index then
			self._gamepad_row_index = math.ceil(num_power_ups / num_columns)
			self._gamepad_column_index = num_columns - num_power_ups % num_columns
		end

		if Managers.input:is_device_active("gamepad") then
			local window_height = self._ui_scenegraph.power_up_window.size[2]
			local offset = self._gamepad_row_index * (definitions.power_up_widget_size[2] + definitions.power_up_widget_spacing[2])
			local excess = math.max(offset - window_height, 0)

			self._ui_animations.move_scrollbar = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.power_up_anchor.local_position, 2, self._ui_scenegraph.power_up_anchor.local_position[2], excess, 0.5, math.easeOutCubic)
		end

		local excess = math.ceil(num_power_ups / 2) * (definitions.power_up_widget_size[2] + definitions.power_up_widget_spacing[2]) - self._ui_scenegraph.power_up_window.size[2]

		if excess > 0 then
			local ui_scenegraph = self._ui_scenegraph
			local scroll_area_scenegraph_id = "power_up_anchor"
			local scroll_area_anchor_scenegraph_id = "power_up_window"
			local excess_area = excess
			local enable_auto_scroll = false
			local optional_scroll_area_hotspot_widget, horizontal_scrollbar
			local left_aligned = false

			self._scrollbar_ui = ScrollbarUI:new(ui_scenegraph, scroll_area_scenegraph_id, scroll_area_anchor_scenegraph_id, excess_area, enable_auto_scroll, optional_scroll_area_hotspot_widget, horizontal_scrollbar, left_aligned)

			self._scrollbar_ui:disable_gamepad_input(true)
		else
			self._scrollbar_ui = nil
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

	healing_widget.content.icon = healing_item and healing_item.hud_icon or "consumables_empty_medpack"
	healing_widget.content.title_text = healing_item and Localize(healing_slot) or Localize("deus_weapon_inspect_title_unavailable")
	healing_widget.content.info_text = healing_item and Localize(healing_item.description) or Localize("deus_weapon_inspect_info_unavailable")
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

	grenade_widget.content.icon = grenade_item and grenade_item.hud_icon or "consumables_empty_grenade"
	grenade_widget.content.title_text = grenade_item and Localize(grenade_slot) or Localize("deus_weapon_inspect_title_unavailable")
	grenade_widget.content.info_text = grenade_item and Localize(grenade_item.description) or Localize("deus_weapon_inspect_info_unavailable")
	grenade_widget.content.visible = grenade_item ~= nil
end

DeusRunStatsUi._create_player_portrait = function (self, portrait_frame, portrait_image, player_level_text)
	local definition = UIWidgets.create_portrait_frame("player_portrait", portrait_frame, player_level_text, 1, nil, portrait_image)
	local widget = UIWidget.init(definition, self._ui_top_renderer)

	table.insert(self._widgets, widget)

	self._widgets_by_name.player_portrait = widget
end

DeusRunStatsUi._set_widget_text = function (self, widget_name, text)
	local widget = self._widgets_by_name[widget_name]

	widget.content.text = text
end

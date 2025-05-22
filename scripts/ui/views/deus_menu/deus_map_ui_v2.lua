-- chunkname: @scripts/ui/views/deus_menu/deus_map_ui_v2.lua

require("scripts/helpers/ui_atlas_helper")

DeusMapUI = class(DeusMapUI)

local REAL_PLAYER_LOCAL_ID = 1
local definitions = local_require("scripts/ui/views/deus_menu/deus_map_ui_definitions_v2")
local ALLOW_BOON_REMOVAL = definitions.allow_boon_removal

DeusMapUI.init = function (self, context)
	self._context = context
	self._ui_renderer = context.ui_renderer
	self._render_content = false
	self._render_full_screen_rect = false
	self._deus_run_controller = context.deus_run_controller
	self._wwise_world = context.wwise_world

	self:_create_ui_elements()
	Managers.state.event:register(self, "ingame_player_list_enabled", "event_ingame_player_list_enabled")
end

DeusMapUI.event_ingame_player_list_enabled = function (self, enabled, override_disable_cursor)
	local cursor_widget = self._widgets_by_name.console_cursor
	local cursor_widget_content = cursor_widget.content

	if enabled then
		cursor_widget_content.visible = false

		if not override_disable_cursor then
			Managers.input:disable_gamepad_cursor()
		end
	else
		cursor_widget_content.visible = true

		Managers.input:enable_gamepad_cursor()
	end
end

DeusMapUI._create_ui_elements = function (self)
	local scenegraph_definition = definitions.scenegraph_definition
	local ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	self._ui_animator = UIAnimator:new(ui_scenegraph, definitions.animations_definitions)

	local widgets, widgets_by_name = UIUtils.create_widgets(definitions.widget_definitions)
	local render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = false,
	}
	local anim_data = {
		alpha_multiplier = 1,
	}
	local peers = table.shallow_copy(self._deus_run_controller:get_peers(), true)
	local own_peer_idx = table.index_of(peers, Network.peer_id())

	if own_peer_idx > 0 then
		table.remove(peers, own_peer_idx)
	end

	table.insert(peers, 1, Network.peer_id())

	local portrait_frame_widgets = {}
	local insignia_widgets = {}

	for i = 1, 4 do
		local name = "player_portrait_frame_" .. i
		local widget_definition, widget
		local insignia_name = "player_insignia_" .. i
		local insignia_widget_definition, insignia_widget

		if peers[i] then
			local profile_index, career_index = self._deus_run_controller:get_player_profile(peers[i], REAL_PLAYER_LOCAL_ID)
			local level_text = self._deus_run_controller:get_player_level(peers[i], profile_index) or "-"
			local frame_settings_name = self._deus_run_controller:get_player_frame(peers[i], profile_index, career_index)

			widget_definition = UIWidgets.deus_create_player_portraits_frame("player_" .. i .. "_portrait", frame_settings_name, level_text, false)

			local versus_level = self._deus_run_controller:get_versus_player_level(peers[i])

			insignia_widget_definition = UIWidgets.create_small_insignia("player_" .. i .. "_insignia", versus_level)

			local server_peer_id = self._deus_run_controller:get_server_peer_id()

			if peers[i] == server_peer_id then
				local host_icon_widget_def = UIWidgets.create_simple_texture("host_icon", "player_" .. i .. "_portrait", nil, nil, nil, {
					-60,
					-8,
					50,
				}, {
					40,
					40,
				})
				local host_icon_widget = UIWidget.init(host_icon_widget_def)

				widgets_by_name.host_icon = host_icon_widget
				widgets[#widgets + 1] = host_icon_widget
			end
		else
			widget_definition = UIWidgets.deus_create_player_portraits_frame("player_" .. i .. "_portrait", "default", " ", false)
			insignia_widget_definition = UIWidgets.create_small_insignia("player_" .. i .. "_insignia", 0)
		end

		widget = UIWidget.init(widget_definition)
		portrait_frame_widgets[#portrait_frame_widgets + 1] = widget
		widgets_by_name[name] = widget
		widgets[#widgets + 1] = widget
		insignia_widget = UIWidget.init(insignia_widget_definition)
		insignia_widgets[#insignia_widgets + 1] = insignia_widget
		widgets_by_name[insignia_name] = widget
	end

	self._portrait_frame_widgets = portrait_frame_widgets
	self._insignia_widgets = insignia_widgets
	self._ui_scenegraph = ui_scenegraph
	self._widgets_by_name = widgets_by_name
	self._widgets = widgets
	self._anim_data = anim_data
	self._render_settings = render_settings
	self._portrait_mode = true

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._total_num_power_ups = nil

	self:_update_power_ups()
end

DeusMapUI.on_enter = function (self, input_service)
	self._input_service = input_service
end

DeusMapUI.on_exit = function (self)
	return
end

DeusMapUI._play_sound = function (self, event)
	WwiseWorld.trigger_event(self._wwise_world, event)
end

DeusMapUI.update = function (self, dt, t)
	if RESOLUTION_LOOKUP.modified then
		self:_on_resolution_changed()
	end

	self:_update_animations(dt, t)
	self:_update_power_ups()
	self:_handle_mode_input(dt, t)
	self:_handle_owned_power_up_input(dt, t)
	self:_update_input_helper_text(dt, t)
	self:_draw(dt, t)
end

DeusMapUI._update_input_helper_text = function (self)
	local glow_progress = 0.5 + math.sin(Managers.time:time("ui") * 5) * 0.5
	local widgets_by_name = self._widgets_by_name
	local portrait_input_helper_widget = widgets_by_name.portrait_input_helper_text
	local portrait_input_helper_style = portrait_input_helper_widget.style.text
	local boon_input_helper_widget = widgets_by_name.boon_input_helper_text
	local boon_input_helper_style = boon_input_helper_widget.style.text

	portrait_input_helper_style.text_color[1] = 100 + 155 * glow_progress
	boon_input_helper_style.text_color[1] = 100 + 155 * glow_progress
	portrait_input_helper_widget.content.visible = not self._portrait_mode
	boon_input_helper_widget.content.visible = self._portrait_mode
end

DeusMapUI._handle_owned_power_up_input = function (self, dt, t)
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self._input_service
	local power_up_widgets = self._power_up_widgets
	local power_up_description_widget = self._widgets_by_name.power_up_description
	local current_power_up_name, power_up_rarity

	if self._portrait_mode or not ALLOW_BOON_REMOVAL then
		power_up_description_widget.content.visible = false
		self._current_power_up_name = nil

		return
	end

	local content = power_up_description_widget.content
	local style = power_up_description_widget.style
	local is_hovering = false

	for i = 1, #power_up_widgets do
		local widget = power_up_widgets[i]

		if UIUtils.is_button_hover(widget) then
			local scenegraph_id = widget.scenegraph_id
			local world_position = UISceneGraph.get_world_position(ui_scenegraph, scenegraph_id)
			local offset = widget.offset

			ui_scenegraph.power_up_description_root.local_position[1] = world_position[1] + offset[1]
			ui_scenegraph.power_up_description_root.local_position[2] = world_position[2] + offset[2]
			current_power_up_name = widget.content.power_up_name
			power_up_rarity = widget.content.power_up_rarity

			local locked = widget.content.locked
			local locked_text_id = widget.content.locked_text_id

			content.visible = true
			content.locked = locked
			content.locked_text_id = locked_text_id or content.locked_text_id
			is_hovering = true

			if locked then
				content.end_time = nil
				content.progress = nil
				content.input_made = false
				style.remove_frame.color[1] = 0

				break
			end

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

			break
		end
	end

	if not is_hovering then
		content.end_time = nil
		content.progress = nil
		content.input_made = false
		style.remove_frame.color[1] = 0
	end

	if current_power_up_name ~= self._current_power_up_name then
		self:_populate_power_up(current_power_up_name, power_up_rarity, power_up_description_widget)
	end

	self._current_power_up_name = current_power_up_name
end

DeusMapUI._populate_power_up = function (self, power_up_name, power_up_rarity, power_up_description_widget)
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
	content.extend_left = false

	local power_up_template = DeusPowerUpTemplates[power_up.name]

	content.is_rectangular_icon = power_up_template.rectangular_icon

	local style = power_up_description_widget.style
	local rarity_color = Colors.get_table(rarity)

	style.rarity_text.text_color = rarity_color
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

local empty_power_ups_array = {}

DeusMapUI._update_power_ups = function (self)
	local run_controller = self._deus_run_controller
	local peer_id = run_controller:get_own_peer_id()
	local profile_index, career_index = run_controller:get_player_profile(peer_id, REAL_PLAYER_LOCAL_ID)
	local party_power_ups = run_controller:get_party_power_ups()
	local power_ups = empty_power_ups_array
	local total_num_power_ups = 0
	local power_up_widgets = self._power_up_widgets or {}

	if profile_index ~= 0 and career_index ~= 0 then
		power_ups = run_controller:get_player_power_ups(peer_id, REAL_PLAYER_LOCAL_ID)
		total_num_power_ups = #power_ups + #party_power_ups

		if total_num_power_ups ~= self._total_num_power_ups then
			table.clear(power_up_widgets)

			if total_num_power_ups > 0 then
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
					local scenegraph_id = "own_power_up_anchor"
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
			end
		end
	end

	self._total_num_power_ups = total_num_power_ups
	self._power_up_widgets = power_up_widgets
	self._power_ups = power_ups
	self._party_power_ups = party_power_ups

	local excess = math.ceil(self._total_num_power_ups / 2) * (definitions.power_up_widget_size[2] + definitions.power_up_widget_spacing[2]) - self._ui_scenegraph.own_power_up_window.size[2]

	if excess > 0 then
		local ui_scenegraph = self._ui_scenegraph
		local scroll_area_scenegraph_id = "own_power_up_anchor"
		local scroll_area_anchor_scenegraph_id = "own_power_up_window"
		local excess_area = excess
		local enable_auto_scroll = false
		local optional_scroll_area_hotspot_widget, horizontal_scrollbar
		local left_aligned = true

		self._scrollbar_ui = ScrollbarUI:new(ui_scenegraph, scroll_area_scenegraph_id, scroll_area_anchor_scenegraph_id, excess_area, enable_auto_scroll, optional_scroll_area_hotspot_widget, horizontal_scrollbar, left_aligned)
	else
		self._scrollbar_ui = nil
	end
end

DeusMapUI._handle_mode_input = function (self, dt, t)
	local input_service = self._input_service

	if input_service:get("cycle_next_raw") then
		if not self._ui_animator:is_animation_completed(self._anim_id) then
			self._ui_animator:stop_animation(self._anim_id)
		end

		self._anim_id = self._ui_animator:start_animation(self._portrait_mode and "switch_to_boons" or "switch_to_portraits", self._widgets_by_name, definitions.scenegraph_definition)
		self._portrait_mode = not self._portrait_mode
	end
end

DeusMapUI._update_animations = function (self, dt, t)
	local ui_animator = self._ui_animator

	ui_animator:update(dt)

	local anim_data = self._anim_data

	if not anim_data.alpha_multiplier_animation_duration then
		return
	end

	if not anim_data.alpha_multiplier_animation_start_time then
		anim_data.alpha_multiplier_animation_start_time = t
		anim_data.alpha_multiplier_animation_end_time = t + anim_data.alpha_multiplier_animation_duration
	end

	local progress
	local interpolation_time = anim_data.alpha_multiplier_animation_end_time - anim_data.alpha_multiplier_animation_start_time

	progress = interpolation_time <= 0.001 and 1 or math.clamp((t - anim_data.alpha_multiplier_animation_start_time) / interpolation_time, 0, 1)

	local new_value = math.lerp(anim_data.source_alpha_multiplier, anim_data.target_alpha_multiplier, progress)

	anim_data.alpha_multiplier = new_value

	if progress == 1 then
		anim_data.alpha_multiplier_animation_duration = nil
		anim_data.alpha_multiplier_animation_start_time = nil
		anim_data.alpha_multiplier_animation_end_time = nil
		anim_data.source_alpha_multiplier = nil
		anim_data.target_alpha_multiplier = nil
	end
end

DeusMapUI._draw = function (self, dt, t)
	local input_service = self._input_service
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local render_settings = self._render_settings
	local anim_data = self._anim_data
	local parent_scenegraph_id

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, parent_scenegraph_id, render_settings)

	render_settings.alpha_multiplier = anim_data.alpha_multiplier or 0

	if self._render_full_screen_rect then
		UIRenderer.draw_rect(ui_renderer, Vector2(0, 0), UISceneGraph.get_size_scaled(ui_scenegraph, "screen"), Colors.color_definitions.black)
	end

	if self._render_content then
		UIRenderer.draw_all_widgets(ui_renderer, self._widgets)
	end

	render_settings.alpha_multiplier = 1

	self:_draw_boons(dt, t)
	UIRenderer.end_pass(ui_renderer)

	if self._scrollbar_ui and not self._portrait_mode then
		self._scrollbar_ui:update(dt, t, ui_renderer, input_service, render_settings)
	end
end

DeusMapUI._draw_boons = function (self, dt, t)
	local ui_scenegraph = self._ui_scenegraph
	local ui_renderer = self._ui_renderer
	local anchor_scenegraph_id = "own_power_up_anchor"
	local window_scenegraph_id = "own_power_up_window"
	local anchor_world_position = UISceneGraph.get_world_position(ui_scenegraph, anchor_scenegraph_id)
	local window_world_position = UISceneGraph.get_world_position(ui_scenegraph, window_scenegraph_id)
	local window_height = ui_scenegraph[window_scenegraph_id].size[2]
	local boon_widgets = self._power_up_widgets

	for i = 1, #boon_widgets do
		local widget = boon_widgets[i]
		local content = widget.content
		local hotspot = content.hotspot
		local offset = widget.offset
		local pos_y = anchor_world_position[2] + offset[2]
		local size_y = definitions.power_up_widget_size[2]

		if pos_y > window_world_position[2] + window_height then
			table.clear(hotspot)
		elseif pos_y + size_y < window_world_position[2] then
			table.clear(hotspot)

			break
		else
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end
end

DeusMapUI.enable_hover_text = function (self, screen_pos, type, level, theme, minor_modifier_group, director_name, terror_event_power_up, grant_random_power_up_count, terror_event_power_up_rarity, selected, selectable, profile_index, career_index)
	local ui_pos = UIInverseScaleVectorToResolution(screen_pos)
	local scene_graph_position = self._ui_scenegraph.node_info_pivot.position

	scene_graph_position[1] = ui_pos[1]
	scene_graph_position[2] = ui_pos[2]

	local widget = self._widgets_by_name.node_info

	widget.content.visible = true

	local content_node_info = widget.content.node_info

	if level then
		content_node_info.none_modifier_info.title = Localize(level .. "_title")
		content_node_info.none_modifier_info.description = Localize(level .. "_desc")
	else
		content_node_info.none_modifier_info.title = Localize("undiscovered_level_title")
		content_node_info.none_modifier_info.description = Localize("undiscovered_level_desc")
	end

	if not theme or theme == "wastes" then
		content_node_info.curse_text = ""
	else
		content_node_info.curse_text = Localize("deus_map_node_info_god_" .. theme)
		content_node_info.curse_icon = "deus_icons_map_" .. theme
		widget.style.node_info.curse_section.curse_icon.color = Colors.get_color_table_with_alpha(theme, 255)
		widget.style.node_info.curse_section.curse_text.text_color = Colors.get_color_table_with_alpha(theme, 255)
	end

	if minor_modifier_group then
		content_node_info.minor_modifier_1_section.text = minor_modifier_group[1] and Localize("mutator_" .. minor_modifier_group[1] .. "_name") or ""
		content_node_info.minor_modifier_2_section.text = minor_modifier_group[2] and Localize("mutator_" .. minor_modifier_group[2] .. "_name") or ""
		content_node_info.minor_modifier_3_section.text = minor_modifier_group[3] and Localize("mutator_" .. minor_modifier_group[3] .. "_name") or ""
	else
		content_node_info.minor_modifier_1_section.text = ""
		content_node_info.minor_modifier_2_section.text = ""
		content_node_info.minor_modifier_3_section.text = ""
	end

	if terror_event_power_up then
		local power_up = DeusPowerUpTemplates[terror_event_power_up]
		local power_up_text_name = DeusPowerUpUtils.get_power_up_name_text(terror_event_power_up, power_up.talent_index, power_up.talent_tier, profile_index, career_index)
		local suffix = Localize("terror_event_power_up_prefix_suffix")
		local terror_event_power_up_text = string.format(suffix, power_up_text_name)

		widget.content.node_info.terror_event_power_up_text = terror_event_power_up_text
		widget.content.node_info.terror_event_power_up_icon = power_up.icon
	elseif grant_random_power_up_count then
		if grant_random_power_up_count > 1 then
			local base_text = Localize("end_of_level_reward_hover_text_random_power_up_multiple")
			local rarity_settings = RaritySettings[terror_event_power_up_rarity]
			local rarity_display_name = Localize(rarity_settings.display_name)
			local formatted_text = string.format(base_text, grant_random_power_up_count, rarity_display_name)

			content_node_info.terror_event_power_up_text = formatted_text
		else
			local base_text = Localize("end_of_level_reward_hover_text_random_power_up_singular")
			local rarity_settings = RaritySettings[terror_event_power_up_rarity]
			local rarity_display_name = Localize(rarity_settings.display_name)
			local formatted_text = string.format(base_text, rarity_display_name)

			content_node_info.terror_event_power_up_text = formatted_text
		end
	else
		content_node_info.terror_event_power_up_text = ""
	end

	content_node_info.shrine_text = ""

	local conflict_director = ConflictDirectors[director_name]
	local conflict_director_description = conflict_director and conflict_director.description

	if conflict_director_description then
		content_node_info.breed_text = Localize(conflict_director_description) or ""
	else
		content_node_info.breed_text = ""
	end

	content_node_info.none_modifier_info.click_to_vote = selectable and "deus_map_node_info_click_to_vote" or ""
	content_node_info.frame_settings_name = selected and "menu_frame_12_gold" or "menu_frame_12"
end

DeusMapUI._update_portrait_frame = function (self, frame_name, level_text, index)
	local new_frame_widget_definition = UIWidgets.deus_create_player_portraits_frame("player_" .. index .. "_portrait", frame_name, level_text, false)
	local new_frame_widget = UIWidget.init(new_frame_widget_definition)

	self._portrait_frame_widgets[index] = new_frame_widget
	self._widgets_by_name["player_portrait_frame_" .. index] = new_frame_widget
end

DeusMapUI._update_insignia = function (self, versus_level, index)
	local insignia_widget_definition = UIWidgets.create_small_insignia("player_" .. index .. "_insignia", versus_level)
	local insignia_widget = UIWidget.init(insignia_widget_definition)

	self._insignia_widgets[index] = insignia_widget
	self._widgets_by_name["player_insignia_" .. index] = insignia_widget
end

DeusMapUI.update_player_data = function (self, player_data)
	self._player_data = player_data

	local widgets_by_name = self._widgets_by_name

	for i = 1, 4 do
		local data = player_data[i]
		local player_portrait = widgets_by_name["player_" .. i .. "_portrait"]
		local player_texts = widgets_by_name["player_" .. i .. "_texts"]
		local player_portrait_frame = widgets_by_name["player_portrait_frame_" .. i]
		local player_insignia = widgets_by_name["player_insignia_" .. i]
		local should_be_visible = not not data

		player_portrait.content.visible = should_be_visible
		player_texts.content.visible = should_be_visible
		player_portrait_frame.content.visible = should_be_visible

		if should_be_visible then
			local frame_settings_name = data.frame or "default"
			local level = data.level or "-"

			if player_portrait_frame.content.frame_settings_name ~= frame_settings_name or player_portrait_frame.content.level ~= level then
				self:_update_portrait_frame(frame_settings_name, level, i)

				player_portrait_frame.content.level = level
			end

			local versus_level = data.versus_level

			if player_insignia.content.level ~= versus_level then
				self:_update_insignia(versus_level, i)
			end

			player_texts.content.name_text = data.name or ""
			player_portrait.content.show_token_icon = not data.vote

			if data.profile_index ~= 0 then
				local profile_data = SPProfiles[data.profile_index]
				local careers = profile_data.careers
				local career_data = careers[data.career_index]

				player_portrait.content.character_portrait = career_data.portrait_image
				player_portrait.content.token_icon = profile_data.hero_selection_image
			else
				player_portrait.content.character_portrait = "unit_frame_portrait_default"
				player_portrait.content.token_icon = nil
			end

			player_portrait.content.hp_bar.bar_value = data.health_percentage
			player_portrait.content.ammo_percentage = data.ammo_percentage
			player_texts.content.coins_text = string.format("%d", data.soft_currency)

			local healthkit_item = data.healthkit_consumable

			player_portrait.content.healthkit_slot = healthkit_item and ItemMasterList[healthkit_item].hud_icon
			player_portrait.style.healthkit_slot_bg.color = UIUtils.get_color_for_consumable_item(healthkit_item)

			local potion_item = data.potion_consumable

			player_portrait.content.potion_slot = potion_item and ItemMasterList[potion_item].hud_icon
			player_portrait.style.potion_slot_bg.color = UIUtils.get_color_for_consumable_item(potion_item)

			local grenade_item = data.grenade_consumable

			player_portrait.content.grenade_slot = grenade_item and ItemMasterList[grenade_item].hud_icon
			player_portrait.style.grenade_slot_bg.color = UIUtils.get_color_for_consumable_item(grenade_item)
		end
	end
end

DeusMapUI.set_journey_name = function (self, journey_name)
	local widget = self._widgets_by_name.top_info

	widget.content.journey_name_label = journey_name .. "_name"
end

DeusMapUI.set_general_info = function (self, title, description)
	local widget = self._widgets_by_name.general_info

	widget.content.title = title
	widget.content.description = description
end

DeusMapUI._on_resolution_changed = function (self)
	local player_data = self._player_data

	if player_data then
		self:update_player_data(player_data)
	end
end

DeusMapUI.update_timer = function (self, time_left, optional_override_text)
	local widget = self._widgets_by_name.general_info

	if optional_override_text then
		widget.content.time = optional_override_text
	else
		local timer_text = string.format("%.2d:%.2d", time_left / 60 % 60, time_left % 60)

		widget.content.time = timer_text
	end
end

DeusMapUI.hide_timer = function (self)
	local widget = self._widgets_by_name.general_info

	widget.content.time = ""
end

DeusMapUI.disable_hover_text = function (self)
	local widget = self._widgets_by_name.node_info

	widget.content.visible = false
end

DeusMapUI.set_alpha_multiplier = function (self, alpha)
	self._anim_data.alpha_multiplier = alpha
end

DeusMapUI.show_full_screen_rect = function (self)
	return self:set_full_screen_rect_visibility(true)
end

DeusMapUI.hide_full_screen_rect = function (self)
	return self:set_full_screen_rect_visibility(false)
end

DeusMapUI.set_full_screen_rect_visibility = function (self, is_visible)
	self._render_full_screen_rect = is_visible
end

DeusMapUI.show_content = function (self)
	self:_set_content_visibility(true)
end

DeusMapUI.hide_content = function (self)
	self:_set_content_visibility(false)
end

DeusMapUI._set_content_visibility = function (self, is_visible)
	self._render_content = is_visible

	local ui_renderer = self._ui_renderer

	for _, widget in pairs(self._widgets_by_name) do
		UIRenderer.set_element_visible(ui_renderer, widget.element, is_visible)
	end
end

DeusMapUI.fade_out = function (self, duration)
	local anim_data = self._anim_data

	anim_data.source_alpha_multiplier = anim_data.alpha_multiplier
	anim_data.target_alpha_multiplier = 0
	anim_data.alpha_multiplier_animation_duration = duration
	anim_data.alpha_multiplier_animation_start_time = nil
	anim_data.alpha_multiplier_animation_end_time = nil
end

DeusMapUI.fade_in = function (self, duration)
	local anim_data = self._anim_data

	anim_data.source_alpha_multiplier = anim_data.alpha_multiplier
	anim_data.target_alpha_multiplier = 1
	anim_data.alpha_multiplier_animation_duration = duration
	anim_data.alpha_multiplier_animation_start_time = nil
	anim_data.alpha_multiplier_animation_end_time = nil
end

DeusMapUI.destroy = function (self)
	Managers.state.event:unregister("ingame_player_list_enabled", self)
end

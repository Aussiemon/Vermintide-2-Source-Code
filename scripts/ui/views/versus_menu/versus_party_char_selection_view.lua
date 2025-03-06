-- chunkname: @scripts/ui/views/versus_menu/versus_party_char_selection_view.lua

require("scripts/ui/views/versus_menu/ui_widgets_vs")
require("scripts/ui/views/team_previewer")

local definitions = local_require("scripts/ui/views/versus_menu/versus_party_char_selection_view_definitions")
local settings = DLCSettings.carousel
local widget_definitions = definitions.widget_definitions
local create_progress_marker = definitions.create_progress_marker
local generic_input_actions = definitions.generic_input_actions
local animation_definitions = definitions.animation_definitions
local scenegraph_definition = definitions.scenegraph_definition
local other_definitions = definitions.other_definitions
local top_detail_widgets_definitions = definitions.top_detail_widgets_definitions
local create_player_name_box_widgets = definitions.create_player_name_box_widgets
local EMPTY_TABLE = {}
local PICKING_STATES_STRINGS_LOOKUP = {
	done = "versus_hero_selection_view_done",
	picking = "versus_hero_selection_view_picking",
	waiting = "versus_hero_selection_view_waiting",
}
local ClientStateLookup = VersusPartySelectionLogicUtility.ClientStateLookup

VersusPartyCharSelectionView = class(VersusPartyCharSelectionView, BaseView)

VersusPartyCharSelectionView.init = function (self, ingame_ui_context)
	local player = ingame_ui_context.player

	self._player = player
	self._peer_id = player:network_id()
	self._local_player_id = player:local_player_id()
	self._unique_id = self._peer_id .. ":" .. self._local_player_id
	self._game_mode = Managers.state.game_mode:game_mode()
	self._ingame_ui = ingame_ui_context.ingame_ui
	self._profile_synchronizer = ingame_ui_context.profile_synchronizer

	local network_handler = ingame_ui_context.network_server or ingame_ui_context.network_client

	self._profile_requester = network_handler:profile_requester()
	self._ingame_ui_context = ingame_ui_context
	self._is_server = ingame_ui_context.is_server
	self._cam_anim_indx = 1
	self._camera_animations = {}
	self._team_heroes = {}
	self._team_previewer = nil
	self._voip = ingame_ui_context.voip

	self.super.init(self, ingame_ui_context, definitions)
end

VersusPartyCharSelectionView.on_enter = function (self, params)
	print("[VersusPartyCharSelectionView] Enter character selection view")
	self.super.on_enter(self)

	self._party_selection_logic = Managers.state.game_mode:game_mode():party_selection_logic()

	self._party_selection_logic:set_ingame_ui(self._ingame_ui)

	self._party = Managers.party:get_party_from_player_id(self._peer_id, self._local_player_id)
	self._side = Managers.state.side.side_by_party[self._party]
	self._status = Managers.party:get_player_status(self._peer_id, self._local_player_id)

	self:_setup_roster_widgets_definitions()
	self:_setup_background_world()
	self:_activate_viewport()

	self.render_settings = {
		snap_pixel_positions = true,
	}
	self._animations = {}

	local gui_layer = UILayer.default + 100

	self._menu_input_description = MenuInputDescriptionUI:new(self._ingame_ui_context, self._ui_top_renderer, self:input_service(), 4, gui_layer, generic_input_actions.default, true)

	self._menu_input_description:set_input_description(nil)
	self:create_ui_elements(params)

	self._params = params
	self._prev_timer_value = 0

	self:play_sound("vs_mute_all")
	self:play_sound("menu_versus_character_amb_loop_start")

	if IS_WINDOWS and not Window.has_focus() then
		Window.flash_window(nil, "start", 3)
	end
end

VersusPartyCharSelectionView._setup_roster_widgets_definitions = function (self)
	local hero_group_widgets_defs, hero_roster_detail_widgets_defs = definitions.create_hero_roster_widget_defitions()

	self._hero_group_widgets_defs = hero_group_widgets_defs
	self._hero_roster_detail_widgets_defs = hero_roster_detail_widgets_defs
end

VersusPartyCharSelectionView._is_hovering_item = function (self, profile_index, career_index)
	return self._hovered_profile_index == profile_index and self._hovered_career_index == career_index
end

VersusPartyCharSelectionView._set_item_hovered = function (self, peer_id, local_player_id, profile_index, career_index)
	profile_index = profile_index or 0
	career_index = career_index or 0
	self._hovered_profile_index = profile_index
	self._hovered_career_index = career_index

	self._party_selection_logic:sync_hovered_item(peer_id, local_player_id, profile_index, career_index)
end

VersusPartyCharSelectionView.on_exit = function (self)
	print("[VersusPartyCharSelectionView] Exit character selection view")

	if self._team_previewer then
		self:_destroy_team_previewer()
	end

	if self._team_world_viewport then
		ScriptWorld.destroy_viewport(self._background_world, self._team_world_viewport_name)

		self._team_world_viewport = nil
		self._team_world_viewport_name = nil
	end

	if self._background_world then
		self:_destroy_world()
	end

	self.super.on_exit(self)

	if not Managers.state.game_mode:setting("display_parading_view") then
		self:play_sound("vs_unmute_reset_all")
	end

	local event_manager = Managers.state.event

	if event_manager then
		event_manager:unregister("party_selection_logic_state_set", self)
	end
end

VersusPartyCharSelectionView.post_update = function (self, dt, t)
	self.ui_animator:update(dt)
	self:_update_animations(dt, t)
	self:_update_camera(t)
	self:_update_player_party(dt, t)
	self:_handle_input(dt, t)

	if self._team_previewer then
		self:_update_team_previewer(dt, t)
	end
end

VersusPartyCharSelectionView.update = function (self, dt, t)
	if not self._is_spectator then
		self:draw(dt)
	end

	self.super.update(self, dt, t)
end

VersusPartyCharSelectionView._update_hero_picking_progress = function (self, party, party_data, num_slots)
	local picker_list = party_data.picker_list
	local party_id = party.party_id

	for _, careers in pairs(self._hero_group_widgets_lookup) do
		for _, widget in pairs(careers) do
			widget.content.taken = nil
			widget.content.taken_id = nil
		end
	end

	for i = 1, num_slots do
		local picking_progress_data = self._picking_progress_data[i]
		local player_data = picker_list[i]
		local slot_id = player_data.slot_id
		local is_picking = ClientStateLookup[player_data.state] == ClientStateLookup.player_picking_character
		local has_picked = ClientStateLookup[player_data.state] >= ClientStateLookup.player_has_picked_character
		local is_bot = VersusPartySelectionLogicUtility.picker_index_is_bot(party_data, slot_id)
		local profile_index, career_index

		if is_bot then
			if has_picked or is_picking then
				profile_index, career_index = self._profile_synchronizer:get_bot_profile(party_id, slot_id)
			end
		else
			local peer_id = player_data.status.peer_id

			profile_index, career_index = self._profile_synchronizer:get_persistent_profile_index_reservation(peer_id)
		end

		local careers = self._hero_group_widgets_lookup[profile_index]

		if careers then
			for career_i, widget in pairs(careers) do
				if is_picking then
					widget.content.taken = nil
				elseif has_picked then
					widget.content.taken = true
					widget.content.has_picked = true
				end

				if career_i == career_index then
					widget.taken_id = slot_id
				end
			end
		end

		profile_index, career_index = profile_index or 0, career_index or 0

		if picking_progress_data.profile_index ~= profile_index or picking_progress_data.career_index ~= career_index then
			picking_progress_data.profile_index = profile_index
			picking_progress_data.career_index = career_index
		end
	end
end

VersusPartyCharSelectionView._update_timer_progress_bar = function (self, party_data, local_player_is_picking, num_slots)
	if party_data.slider_timer then
		local bar_scenegraph_id = "progress_bar"
		local ui_scenegraph = self._ui_scenegraph
		local default_scenegraph_size = scenegraph_definition[bar_scenegraph_id].size
		local slider_timer = party_data.slider_timer
		local time_finished = party_data.time_finished
		local total_slider_time = party_data.total_slider_time
		local slider_percent = math.clamp((time_finished - slider_timer) / total_slider_time, 0, 1)
		local slider_x = slider_percent * default_scenegraph_size[1]

		for i = 1, num_slots do
			local picking_progress_data = self._picking_progress_data[i]
			local bar_distance = picking_progress_data.bar_distance
			local step_size = picking_progress_data.step_size
			local highlight = step_size > bar_distance - slider_x
			local done = bar_distance < slider_x
			local point_widget = picking_progress_data.point_widget

			if point_widget then
				point_widget.content.highlight = highlight
				point_widget.content.done = done
			end

			local progress_bar_size = ui_scenegraph[bar_scenegraph_id].size

			progress_bar_size[1] = slider_x
		end
	end
end

VersusPartyCharSelectionView._update_background_music = function (self, party_state)
	if not self._background_music_triggered and party_state ~= "setup" then
		self._background_music_triggered = true

		self:play_sound("menu_versus_character_selection_start")
	end
end

VersusPartyCharSelectionView._update_party_state_startup = function (self, party_state, picker_list, party)
	if party_state ~= "startup" then
		return
	end

	local timer = self._party_selection_logic:timer()

	if not self._start_timer_value then
		self._start_timer_value = timer
	end

	if timer <= self._start_timer_value - GameSettings.transition_fade_out_speed then
		local rounded_time = math.ceil(timer)
		local countdown_timer = self._widgets_by_name.countdown_timer

		countdown_timer.content.text = tostring(rounded_time)

		if rounded_time ~= self._prev_timer_value then
			if rounded_time > 0 then
				local tick_sound = settings.versus_character_selection_clock_tick[rounded_time]

				self:play_sound(tick_sound)
			end

			self._prev_timer_value = rounded_time
		end
	end
end

VersusPartyCharSelectionView._update_party_state_player_picking_character = function (self, party_state, picker_list, current_picker_index, party)
	local party_data = self._party_selection_logic:get_party_data(self._party_id)

	if not party_data then
		return
	end

	local data_by_pick_index = self._data_by_pick_index

	for pick_id = 1, #data_by_pick_index do
		local pick_index_data = data_by_pick_index[pick_id]
		local is_bot = VersusPartySelectionLogicUtility.picker_index_is_bot(party_data, pick_id)

		if pick_index_data.is_bot ~= is_bot then
			pick_index_data.is_bot = is_bot

			self:_update_player_name_box_widget(party_data, pick_id)
		end
	end

	if party_state ~= "player_picking_character" then
		return
	end

	self._next_character_update_idx = math.index_wrapper((self._next_character_update_idx or 0) + 1, current_picker_index)

	local pick_id = self._next_character_update_idx
	local player_data = picker_list[pick_id]
	local local_player_is_picking = self:local_player_is_picking()
	local local_player_picking_frame = self._widgets_by_name.local_player_picking_frame

	local_player_picking_frame.content.visible = local_player_is_picking

	local status = player_data.status
	local profile_index = status.selected_profile_index
	local career_index = status.selected_career_index
	local pick_index_data = self._data_by_pick_index[pick_id]

	if profile_index and career_index then
		local slot_id = player_data.slot_id
		local slot_data = party.slots_data[slot_id]
		local has_synced_cosmetics = slot_data.slot_skin ~= "n/a"

		if has_synced_cosmetics and (profile_index ~= pick_index_data.profile_index or career_index ~= pick_index_data.career_index) then
			self:_spawn_selected_hero(pick_id)

			pick_index_data.profile_index = profile_index
			pick_index_data.career_index = career_index

			if pick_id == current_picker_index then
				self:_set_selected_hero_and_career_text(profile_index, career_index)
				self:_update_selcted_career_passive_and_career_skill(profile_index, career_index)
			end
		end
	end

	local hero_group_widgets_lookup = self._hero_group_widgets_lookup

	if hero_group_widgets_lookup then
		for i = 1, #hero_group_widgets_lookup do
			local carrer_widgets = hero_group_widgets_lookup[i]

			if carrer_widgets then
				for j = 1, #carrer_widgets do
					local roster_hero_widget = carrer_widgets[j]

					roster_hero_widget.content.other_picking = not local_player_is_picking
				end
			end
		end
	end
end

VersusPartyCharSelectionView._setup_local_picker_data = function (self, peer_id, local_player_id)
	local party, party_id = Managers.party:get_party_from_player_id(peer_id, local_player_id)

	if party_id == 0 then
		return
	end

	local player_status = Managers.party:get_player_status(peer_id, local_player_id)

	self._slot_id = player_status.slot_id
	self._party = party
	self._party_id = party_id
	self._is_spectator = party.name == "spectators"

	local party_data = self._party_selection_logic:get_party_data(self._party_id)

	if not party_data then
		return
	end

	self._data_by_pick_index = {}

	for i = 1, party.num_slots do
		self._data_by_pick_index[i] = {}
	end

	self._party_data = party_data

	local picker_list = party_data.picker_list

	for i = 1, #picker_list do
		local curr_picker_list = picker_list[i]

		if curr_picker_list.slot_id == self._slot_id then
			self._local_player_data = curr_picker_list
			self._picker_list_id = i

			break
		end
	end

	if not self._is_spectator then
		self:_setup_character_selection_widgets()
		self:_update_all_player_name_box_widgets()
	end
end

VersusPartyCharSelectionView._update_player_party = function (self, dt, t)
	if not self._party_id then
		local peer_id, local_player_id = self._peer_id, self._local_player_id

		self:_setup_local_picker_data(peer_id, local_player_id)
	end

	local party_data = self._party_selection_logic:get_party_data(self._party_id)

	if not party_data then
		return
	end

	if #self._team_heroes == 0 and not self._team_previewer then
		self:_setup_team_heroes()
		self:_setup_team_previewer()
		self:_update_all_player_name_box_widgets()
		self:_set_your_turn_text_position()
		self:_set_top_detail_widgets_visible(false)
		Managers.state.event:register(self, "party_selection_logic_state_set", "on_party_selection_logic_state_set")
		self:on_party_selection_logic_state_set(party_data.state, self._party_id, party_data.current_picker_index)
	end

	local party = self._party
	local party_state = party_data.state
	local num_slots = party.num_slots
	local picker_list = party_data.picker_list
	local current_picker_index = party_data.current_picker_index
	local local_player_is_picking = self:local_player_is_picking()

	self:_update_background_music(party_state)
	self:_update_party_state_startup(party_state, picker_list, party)
	self:_update_party_state_player_picking_character(party_state, picker_list, current_picker_index, party)
	self:_update_hero_picking_progress(party, party_data, num_slots)
	self:_update_timer_progress_bar(party_data, local_player_is_picking, num_slots)
end

VersusPartyCharSelectionView._update_roster_widgets_animations = function (self, dt, t)
	local party_data = self._party_selection_logic:get_party_data(self._party_id)

	if not party_data then
		return
	end

	local party_state = party_data.state
	local picker_data = party_data.picker_list[self._picker_list_id]
	local is_inactive = false
	local hero_group_widgets_lookup = self._hero_group_widgets_lookup

	if hero_group_widgets_lookup then
		for i = 1, #hero_group_widgets_lookup do
			local carrer_widgets = hero_group_widgets_lookup[i]

			if carrer_widgets then
				for j = 1, #carrer_widgets do
					local roster_hero_widget = carrer_widgets[j]
					local content = roster_hero_widget.content
					local style = roster_hero_widget.style
					local offset = roster_hero_widget.offset
					local hotspot = content.button_hotspot
					local taken = content.taken
					local locked = content.locked
					local other_picking = content.other_picking
					local gamepad_selected = content.gamepad_selected
					local is_hover = (hotspot.is_hover or gamepad_selected) and not other_picking and not locked
					local profile_index = content.profile_index
					local career_index = content.career_index
					local is_selected = self:_is_item_selected(profile_index, career_index)
					local hover_progress = hotspot.hover_progress or 0
					local selection_progress = hotspot.selection_progress or 0
					local inactive_progress = hotspot.inactive_progress or 0
					local taken_progress = hotspot.taken_progress or 0

					content.party_state = party_state

					if party_state == "startup" then
						style.local_player_selected_texture.color[1] = 0
						style.other_player_selected_texture.color[1] = 0
						is_inactive = true
					elseif party_state ~= "startup" and party_state ~= "parading" then
						is_inactive = (picker_data.state == "player_has_picked_character" or locked) and not is_selected

						local speed = 15
						local selected_speed = 5

						if is_hover then
							hover_progress = math.min(hover_progress + dt * speed, 1)
						else
							hover_progress = math.max(hover_progress - dt * speed, 0)
						end

						if is_inactive then
							inactive_progress = math.min(inactive_progress + dt * speed, 1)
						else
							inactive_progress = math.max(inactive_progress - dt * speed, 0)
						end

						if is_selected then
							selection_progress = math.min(selection_progress + dt * selected_speed, 1)
						else
							selection_progress = 0
						end

						if taken then
							taken_progress = math.min(taken_progress + dt * speed, 1)
						else
							taken_progress = math.max(taken_progress - dt * speed, 0)
						end

						local select_easing_progress = math.easeCubic(selection_progress)

						offset[3] = hover_progress > 0 and 10 or 0

						local taken_color = 55 + 200 * (1 - taken_progress)

						style.portrait.color = {
							255,
							taken_color,
							taken_color,
							taken_color,
						}
						style.local_player_selected_texture.color[1] = not other_picking and 255 * select_easing_progress or 0
						style.other_player_selected_texture.color[1] = other_picking and 255 * select_easing_progress or 0

						for style_name, pass_style in pairs(style) do
							local default_size = pass_style.default_size

							if default_size then
								local size = pass_style.size or pass_style.texture_size or pass_style.area_size
								local additional_size_multiplier = 0

								if style_name == "local_player_selected_texture" or style_name == "other_player_selected_texture" then
									additional_size_multiplier = -0.5 + 0.5 * select_easing_progress
								end

								local size_multiplier = 0.2 + additional_size_multiplier
								local max_increase_width = math.ceil(default_size[1] * size_multiplier)
								local max_increase_height = math.ceil(default_size[2] * size_multiplier)
								local increase_width = max_increase_width * hover_progress
								local increase_height = max_increase_height * hover_progress

								size[1] = default_size[1] + increase_width
								size[2] = default_size[2] + increase_height

								local default_offset = pass_style.default_offset

								if default_offset then
									local pass_offset = pass_style.offset

									pass_offset[1] = default_offset[1] - increase_width * 0.5
									pass_offset[2] = default_offset[2] - increase_height * 0.5
								end
							end
						end
					end

					style.portrait.saturated = is_inactive
					hotspot.taken_progress = taken_progress
					hotspot.hover_progress = hover_progress
					hotspot.inactive_progress = inactive_progress
					hotspot.selection_progress = selection_progress
				end
			end
		end
	end
end

VersusPartyCharSelectionView._get_player_name_by_status = function (self, status, status_slot_id)
	local player_name

	if status then
		if status.is_player then
			local peer_id, local_player_id = status.peer_id, status.local_player_id
			local player = Managers.player:player(peer_id, local_player_id)

			if player then
				player_name = player:name() .. " "
			end
		elseif status.is_bot then
			player_name = "Bot " .. status.slot_id
		end
	end

	player_name = player_name or "Bot " .. status_slot_id

	return player_name
end

VersusPartyCharSelectionView._handle_input = function (self, dt, t)
	local party_data = self._party_selection_logic:get_party_data(self._party_id)

	if not party_data then
		return
	end

	local gamepad_active = Managers.input:is_device_active("gamepad")

	if gamepad_active then
		self:_handle_gamepad_selection()
	else
		self:_handle_mouse_selection()
		self:_handle_hover_sync()
	end
end

VersusPartyCharSelectionView._handle_hover_sync = function (self)
	local hero_group_widgets_lookup = self._hero_group_widgets_lookup

	if hero_group_widgets_lookup then
		for i = 1, #hero_group_widgets_lookup do
			local carrer_widgets = hero_group_widgets_lookup[i]

			if carrer_widgets then
				for j = 1, #carrer_widgets do
					local roster_hero_widget = carrer_widgets[j]
					local is_career_hovered_by_other = self:_is_item_hovered_by_other(i, j)

					roster_hero_widget.content.hovered_by_other = is_career_hovered_by_other
				end
			end
		end
	end
end

VersusPartyCharSelectionView.draw = function (self, dt)
	if not self._party_id then
		return
	end

	local ui_renderer = self._ui_renderer
	local ui_top_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = self:input_service()
	local render_settings = self.render_settings
	local party_data = self._party_selection_logic:get_party_data(self._party_id)
	local party_state = party_data.state
	local alpha_multiplier = render_settings.alpha_multiplier or 1

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, render_settings)
	self:_draw_widgets(self._other_widgets, render_settings, ui_top_renderer, alpha_multiplier)

	if party_state ~= "closing" then
		self:_draw_widgets(self._hero_group_widgets, render_settings, ui_top_renderer, alpha_multiplier)
		self:_draw_widgets(self._hero_group_detail_widgets, render_settings, ui_top_renderer, alpha_multiplier)
	end

	self:_draw_widgets(self._top_detail_widgets, render_settings, ui_top_renderer, alpha_multiplier)
	self:_draw_widgets(self._player_name_box_widgets, render_settings, ui_top_renderer, alpha_multiplier)
	UIRenderer.end_pass(ui_top_renderer)

	render_settings.alpha_multiplier = alpha_multiplier

	local gamepad_active = Managers.input:is_device_active("gamepad")

	if self._menu_input_description and gamepad_active then
		self._menu_input_description:draw(ui_top_renderer, dt)
	end
end

VersusPartyCharSelectionView._draw_widgets = function (self, widgets, render_settings, ui_renderer, alpha_multiplier)
	if not widgets then
		return
	end

	for _, widget in ipairs(widgets) do
		render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

		UIRenderer.draw_widget(ui_renderer, widget)
	end
end

VersusPartyCharSelectionView._update_animations = function (self, dt, t)
	local animations = self._animations
	local ui_animator = self.ui_animator

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	self:_update_roster_widgets_animations(dt, t)
end

VersusPartyCharSelectionView._start_transition_animation = function (self, key, animation_name)
	local params = {
		wwise_world = self._wwise_world,
		render_settings = self.render_settings,
	}
	local widgets = {}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)

	self._animations[key] = anim_id
end

VersusPartyCharSelectionView.create_ui_elements = function (self, params)
	if self._team_previewer then
		self:_destroy_team_previewer()
	end

	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	local widgets_by_name = self._widgets_by_name

	self._other_widgets = {}
	self._player_name_box_widgets = {}
	self._top_detail_widgets = {}

	UIUtils.create_widgets(widget_definitions, self._other_widgets, widgets_by_name)
	UIUtils.create_widgets(other_definitions, self._other_widgets, widgets_by_name)
	UIUtils.create_widgets(top_detail_widgets_definitions, self._top_detail_widgets, widgets_by_name)

	local player_name_box_widgets = create_player_name_box_widgets()

	UIUtils.create_widgets(player_name_box_widgets, self._player_name_box_widgets, widgets_by_name)
	UIRenderer.clear_scenegraph_queue(self._ui_top_renderer)
	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self.ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)

	self:_setup_picking_progress_bar(4)

	widgets_by_name.local_player_picking_frame.content.visible = false

	self._menu_input_description:set_input_description(generic_input_actions.default)
end

VersusPartyCharSelectionView._setup_character_selection_widgets = function (self, affiliation)
	local hero_group_widgets = {}

	self._hero_group_widgets = hero_group_widgets

	local hero_group_detail_widgets = {}

	self._hero_group_detail_widgets = hero_group_detail_widgets

	local hero_group_widgets_lookup = {}

	self._hero_group_widgets_lookup = hero_group_widgets_lookup

	self:_setup_hero_party_selection_widgets(hero_group_widgets, hero_group_detail_widgets, hero_group_widgets_lookup)
end

VersusPartyCharSelectionView._update_all_player_name_box_widgets = function (self)
	local party_data = self._party_selection_logic:get_party_data(self._party_id)

	if not party_data then
		return
	end

	local picker_list = party_data.picker_list

	for pick_id = 1, #picker_list do
		self:_update_player_name_box_widget(party_data, pick_id)
	end
end

VersusPartyCharSelectionView._update_player_name_box_widget = function (self, party_data, pick_id)
	local picker_list = party_data.picker_list
	local picker = picker_list[pick_id]
	local status = picker.status

	if status then
		local player = status.player
		local widget = self._player_name_box_widgets[pick_id]
		local content = widget.content
		local player_name = player and self:_set_player_name(player) or "BOT"
		local picking_progress_text

		if picker.state == "player_picking_character" then
			if pick_id == party_data.current_picker_index then
				picking_progress_text = Localize(PICKING_STATES_STRINGS_LOOKUP.picking)
			end
		elseif picker.state == "player_has_picked_character" then
			picking_progress_text = Localize(PICKING_STATES_STRINGS_LOOKUP.done)
		else
			picking_progress_text = Localize(PICKING_STATES_STRINGS_LOOKUP.waiting)
		end

		local template_string = "{#color(%d,%d,%d,%d)}%s {#reset()} %s"
		local is_local_player = self._picker_list_id == pick_id
		local name_color = is_local_player and Colors.get_color_table_with_alpha("local_player_picking", 255) or Colors.get_color_table_with_alpha("other_player_picking", 255)

		content.player_name = string.format(template_string, name_color[2], name_color[3], name_color[4], name_color[1], player_name, picking_progress_text)
		content.is_player = player ~= nil
		content.peer_id = status.peer_id
		content.is_local_player = is_local_player
	end
end

VersusPartyCharSelectionView._setup_hero_party_selection_widgets = function (self, hero_group_widgets, hero_group_detail_widgets, hero_group_widgets_lookup)
	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local profiles = {}
	local profile_indices = {}

	for _, index in ipairs(ProfilePriority) do
		profiles[index] = SPProfiles[index]
		profile_indices[#profile_indices + 1] = index
	end

	self._profile_indices = profile_indices

	local num_max_rows = #profile_indices
	local num_max_columns = 0

	for i, profile_index in pairs(profile_indices) do
		local profile_settings = profiles[profile_index]
		local hero_name = profile_settings.display_name
		local hero_experience = hero_attributes:get(hero_name, "experience") or 0
		local hero_level = ExperienceSettings.get_level(hero_experience)
		local careers = profile_settings.careers
		local columns = 0

		hero_group_widgets_lookup[profile_index] = {}

		local detail_widget_def = self._hero_roster_detail_widgets_defs[i]
		local detail_widget = UIWidget.init(detail_widget_def)

		detail_widget.content.hero_name = Localize(profile_settings.ingame_short_display_name)
		detail_widget.content.profile_index = profile_index
		hero_group_detail_widgets[#hero_group_detail_widgets + 1] = detail_widget

		for j = 1, #careers do
			local career = careers[j]
			local wname = self._hero_group_widgets_defs[i][j]
			local widget = UIWidget.init(wname)

			hero_group_widgets[#hero_group_widgets + 1] = widget
			hero_group_widgets_lookup[profile_index][j] = widget

			local content = widget.content

			content.group_index = i
			content.career_index = j

			if career and career:override_available_for_mechanism() then
				content.career_settings = career
				content.profile_index = profile_index
				content.portrait = career.picking_image

				local is_career_unlocked = career:is_unlocked_function(hero_name, hero_level)

				content.locked = not is_career_unlocked
				content.taken = false
			else
				content.career_settings = career
				content.profile_index = profile_index
				content.portrait = career.picking_image
				content.locked = true
			end

			local style = widget.style

			style.local_player_select_frame.color = Colors.get_color_table_with_alpha("local_player_picking", 255)
			columns = columns + 1
		end

		num_max_columns = math.max(num_max_columns, columns)
	end

	assert(num_max_rows <= 5 and num_max_columns <= 4, "Too many rows or columns in VersusPartyCharSelectionView")

	self._num_max_hero_rows = num_max_rows
	self._num_max_hero_columns = num_max_columns
end

VersusPartyCharSelectionView._is_item_selected = function (self, profile_index, career_index)
	local party_data = self._party_selection_logic:get_party_data(self._party_id)

	if not party_data then
		return false
	end

	local current_picker_index = party_data.current_picker_index

	for i = 1, current_picker_index do
		local pick_data = self._data_by_pick_index[i]

		if pick_data.profile_index == profile_index and pick_data.career_index == career_index then
			return true
		end
	end

	return false
end

VersusPartyCharSelectionView.local_player_is_picking = function (self)
	return self:_is_slot_picking(self._picker_list_id)
end

VersusPartyCharSelectionView._is_slot_picking = function (self, slot_id)
	local party_data = self._party_selection_logic:get_party_data(self._party_id)

	if not party_data then
		return
	end

	local current_picker_index = party_data.current_picker_index

	if current_picker_index <= 0 then
		return false
	end

	local is_picking = current_picker_index == slot_id

	return is_picking
end

VersusPartyCharSelectionView._local_player_has_picked = function (self)
	return self:_has_slot_picked(self:_get_local_player_picker_index())
end

VersusPartyCharSelectionView._has_slot_picked = function (self, slot_id)
	local party_data = self._party_selection_logic:get_party_data(self._party_id)

	if not party_data then
		return false
	end

	local current_picker_index = party_data.current_picker_index

	if current_picker_index <= 0 then
		return false
	end

	local has_picked = slot_id < current_picker_index

	return has_picked
end

VersusPartyCharSelectionView._get_local_player_picker_index = function (self)
	return self._picker_list_id
end

VersusPartyCharSelectionView._handle_gamepad_selection = function (self)
	local is_picking = self:local_player_is_picking()
	local gamepad_selected_index = self._gamepad_selected_index or 1
	local input_service = self:input_service()

	if input_service:get("move_right") then
		self:play_sound("Play_hud_hover")

		if gamepad_selected_index < #self._hero_group_widgets then
			gamepad_selected_index = gamepad_selected_index + 1
		end
	elseif input_service:get("move_left") then
		self:play_sound("Play_hud_hover")

		if gamepad_selected_index > 1 then
			gamepad_selected_index = gamepad_selected_index - 1
		end
	elseif input_service:get("cycle_next") then
		self:play_sound("Play_hud_hover")

		if gamepad_selected_index < #self._hero_group_widgets - 3 then
			gamepad_selected_index = bit.bor(gamepad_selected_index - 1, 3) + 1 + 1
		end
	elseif input_service:get("cycle_previous") and gamepad_selected_index > 4 then
		gamepad_selected_index = math.max(0, bit.bor(gamepad_selected_index - 1, 3) + 1 - 4) + -3
	end

	if gamepad_selected_index ~= self._gamepad_selected_index then
		local current_selcted_widget = self._hero_group_widgets[gamepad_selected_index]
		local previous_selected_widget = self._hero_group_widgets[self._gamepad_selected_index or 1]
		local current_content = current_selcted_widget.content

		current_content.gamepad_selected = true

		if self._gamepad_selected_index then
			local previous_content = previous_selected_widget.content

			previous_content.gamepad_selected = false
		end
	end

	if input_service:get("confirm") and is_picking then
		local current_selcted_widget = self._hero_group_widgets[gamepad_selected_index]
		local current_content = current_selcted_widget.content

		if not current_content.taken and not current_content.other_picking and not current_content.locked then
			local profile_index = current_content.profile_index
			local career_index = current_content.career_index

			self._party_selection_logic:select_character(profile_index, career_index)
			self:play_sound("play_gui_hero_select_career_click")
		end
	end

	self._gamepad_selected_index = gamepad_selected_index
end

VersusPartyCharSelectionView._reset_selection = function (self)
	if not self._gamepad_selected_index then
		return
	end

	local widget = self._hero_group_widgets[self._gamepad_selected_index]
	local content = widget.content

	content.gamepad_selected = false
end

VersusPartyCharSelectionView._handle_mouse_selection = function (self)
	self:_reset_selection()

	local is_picking = self:local_player_is_picking()
	local hero_group_widgets = self._hero_group_widgets
	local num_max_rows = self._num_max_hero_rows
	local num_max_columns = self._num_max_hero_columns
	local picked_profile_index, picked_career_index
	local local_picker_index = self:_get_local_player_picker_index()

	if local_picker_index then
		picked_profile_index = self._data_by_pick_index[local_picker_index].profile_index
		picked_career_index = self._data_by_pick_index[local_picker_index].career_index
	end

	local hover_dirty = false
	local hovered_profile, hovered_career
	local widget_index = 1

	for i = 1, num_max_rows do
		for j = 1, num_max_columns do
			local widget = hero_group_widgets[widget_index]

			if widget then
				local content = widget.content
				local profile_index = content.profile_index
				local career_index = content.career_index
				local button_hotspot = content.button_hotspot

				if not self:_local_player_has_picked() then
					if button_hotspot.on_hover_enter then
						hovered_profile = self._profile_indices[i]
						hovered_career = j
						hover_dirty = true
					elseif not hover_dirty and self:_is_hovering_item(self._profile_indices[i], j) and not button_hotspot.is_hover then
						hover_dirty = true
					end
				end

				if (profile_index ~= picked_profile_index or career_index ~= picked_career_index) and not content.taken and not content.other_picking and not content.locked then
					if button_hotspot.on_hover_enter then
						self:play_sound("Play_hud_hover")
					end

					if button_hotspot.on_pressed and is_picking then
						local selected_profile_index = self._profile_indices[i]
						local selected_career_index = j

						self._party_selection_logic:select_character(selected_profile_index, selected_career_index)
						self:play_sound("play_gui_hero_select_career_click")

						return
					end
				end
			end

			widget_index = widget_index + 1
		end
	end

	if hover_dirty then
		self:_set_item_hovered(self._peer_id, self._local_player_id, hovered_profile, hovered_career)
	end

	self:_update_mute_buttons()
end

VersusPartyCharSelectionView._setup_picking_progress_bar = function (self, num_player)
	local other_widgets = self._other_widgets
	local picking_end_maker_scenegraph_id = "progress_point"
	local picking_end_marker_definition = create_progress_marker(picking_end_maker_scenegraph_id)
	local spacing = 5
	local bar_bg_scenegraph_id = "progress_bar_rect"
	local total_bar_length = scenegraph_definition[bar_bg_scenegraph_id].size[1]
	local amount = num_player
	local step_size = math.ceil(total_bar_length / amount)
	local offset_x = -2
	local picking_progress_data = {}

	for i = 1, amount do
		offset_x = offset_x + step_size + spacing / 2

		local point_widget

		if i < amount then
			point_widget = UIWidget.init(picking_end_marker_definition)
			other_widgets[#other_widgets + 1] = point_widget
			point_widget.offset[1] = math.ceil(offset_x)
		end

		picking_progress_data[i] = {
			point_widget = point_widget,
			bar_distance = offset_x,
			step_size = step_size,
			bar_distance_fraction = offset_x / total_bar_length,
		}
	end

	self._picking_progress_data = picking_progress_data

	local ui_scenegraph = self._ui_scenegraph
	local progress_bar_size = ui_scenegraph.progress_bar.size
	local progress_bar_passive_size = ui_scenegraph.progress_bar_passive.size

	progress_bar_size[1] = 0
	progress_bar_passive_size[1] = 0
end

VersusPartyCharSelectionView._start_step_transtion_animation = function (self, animation_name)
	local widgets = EMPTY_TABLE
	local params = {
		self = self,
	}
	local anim_id = self.ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)

	self._animations[animation_name] = anim_id
end

VersusPartyCharSelectionView._start_widget_animation = function (self, animation_name, widget)
	local params = EMPTY_TABLE
	local anim_id = self.ui_animator:start_animation(animation_name, widget, scenegraph_definition, params)

	self._animations[animation_name] = anim_id
end

VersusPartyCharSelectionView._set_top_detail_widgets_visible = function (self, visible)
	local alpha_multiplier = visible and 1 or 0

	for _, widget in ipairs(self._top_detail_widgets) do
		widget.alpha_multiplier = alpha_multiplier
	end
end

VersusPartyCharSelectionView._is_item_hovered_by_other = function (self, profile_index, career_index)
	local party = self._party
	local party_data = self._party_selection_logic:get_party_data(self._party_id)
	local num_slots = party.num_slots
	local picker_list = party_data.picker_list

	for i = 1, num_slots do
		local player_data = picker_list[i]
		local status = player_data.status
		local hovered_profile_index = status.hovered_profile_index or 0
		local hovered_career_index = status.hovered_career_index or 0

		if hovered_profile_index == profile_index and hovered_career_index == career_index then
			if status.slot_id == self._slot_id or self:_has_slot_picked(i) then
				return false, nil
			else
				return true, i
			end
		end
	end

	return false, nil
end

VersusPartyCharSelectionView._set_player_name = function (self, player)
	local player_name = player:name()
	local player_name_length = UTF8Utils.string_length(player_name)

	if player_name_length > 18 then
		player_name = string.sub(player_name, 1, 18) .. "..."
	end

	return player_name
end

VersusPartyCharSelectionView._set_your_turn_text_position = function (self)
	local your_turn_indicator = self._widgets_by_name.your_turn_indicator_text
	local new_scenegraph_id = "player_name_box_" .. self._picker_list_id

	your_turn_indicator.scenegraph_id = new_scenegraph_id
end

VersusPartyCharSelectionView._set_selected_hero_and_career_text = function (self, profile_index, career_index)
	local widget = self._widgets_by_name.hero_career_name_text
	local template_string = "%s - %s"
	local profile_settings = SPProfiles[profile_index]
	local hero_name_short = Localize(profile_settings.ingame_short_display_name)
	local career_settings = profile_settings.careers[career_index]
	local career_name = Localize(career_settings.display_name)

	widget.content.text = Utf8.upper(string.format(template_string, hero_name_short, career_name))
end

VersusPartyCharSelectionView._set_current_picker_text = function (self, current_picker_index)
	local widget = self._widgets_by_name.player_picking_text
	local is_local_player = current_picker_index == self._picker_list_id

	if is_local_player then
		local color = Colors.get_color_table_with_alpha("local_player_picking", 255)

		widget.content.text = string.format(Localize("versus_hero_selection_view_local_player_picking"), color[2], color[3], color[4], color[1])
	else
		local party_data = self._party_selection_logic:get_party_data(self._party_id)
		local picker_list = party_data.picker_list
		local player_data = picker_list[current_picker_index]
		local status = player_data.status
		local player = status.player
		local player_name = player and player:name() or "BOT"
		local color = Colors.get_color_table_with_alpha("other_player_picking", 255)

		widget.content.text = string.format(Localize("versus_hero_selection_view_other_player_picking"), color[2], color[3], color[4], color[1], player_name)
	end
end

VersusPartyCharSelectionView._update_selcted_career_passive_and_career_skill = function (self, profile_index, career_index)
	local passive_skill_widget = self._widgets_by_name.passive_skill
	local career_skill_widget = self._widgets_by_name.career_skill
	local hero_career_widget = self._widgets_by_name.hero_career_name_text
	local passive_content = passive_skill_widget.content
	local career_content = career_skill_widget.content
	local profile_settings = SPProfiles[profile_index]
	local career_settings = profile_settings.careers[career_index]
	local passive_skill_settings = CareerUtils.get_passive_ability_by_career(career_settings)
	local career_skill_settings = CareerUtils.get_ability_data_by_career(career_settings, 1)
	local career_skill_icon = career_skill_settings.icon
	local career_skill_name = Localize(career_skill_settings.display_name)
	local career_skill_title = Localize("ability")
	local passive_skill_icon = passive_skill_settings.icon
	local passive_skill_name = Localize(passive_skill_settings.display_name)
	local passive_skill_title = Localize("hero_view_passive_ability")

	career_content.skill_icon = career_skill_icon
	career_content.skill_type = career_skill_title
	career_content.skill_name = career_skill_name
	passive_content.skill_icon = passive_skill_icon
	passive_content.skill_type = passive_skill_title
	passive_content.skill_name = passive_skill_name

	local hero_career_text_style = hero_career_widget.style.text
	local hero_career_text = hero_career_widget.content.text
	local hero_career_text_width = UIUtils.get_text_width(self._ui_renderer, hero_career_text_style, hero_career_text)
	local career_skill_title_style = career_skill_widget.style.skill_type
	local skill_title_text_width = UIUtils.get_text_width(self._ui_renderer, career_skill_title_style, career_skill_title)
	local career_skill_name_style = career_skill_widget.style.skill_name
	local skill_text_width = UIUtils.get_text_width(self._ui_renderer, career_skill_name_style, career_skill_name)
	local careers_skill_title_text_width = 85 + skill_title_text_width > 150 and 85 + skill_title_text_width or 200
	local careers_skill_name_text_width = 85 + skill_text_width > 150 and 85 + skill_text_width or 200
	local careers_skill_text_width

	if careers_skill_name_text_width < careers_skill_title_text_width then
		careers_skill_text_width = careers_skill_title_text_width
	else
		careers_skill_text_width = careers_skill_name_text_width
	end

	local career_skill_x_offset = hero_career_text_width + 25
	local passive_skill_x_offset = hero_career_text_width + 25 + careers_skill_text_width + 25

	passive_skill_widget.offset[1] = passive_skill_x_offset
	career_skill_widget.offset[1] = career_skill_x_offset
end

VersusPartyCharSelectionView._setup_world = function (self)
	if self._background_world then
		self:_destroy_world()
	end

	local world_name = "versus_char_selection"
	local shading_environment = "environment/ui_end_screen"
	local layer = 2
	local flags = {
		Application.DISABLE_SOUND,
		Application.DISABLE_ESRAM,
		Application.ENABLE_VOLUMETRICS,
	}
	local world = Managers.world:create_world(world_name, shading_environment, nil, layer, unpack(flags))

	World.set_data(world, "avoid_blend", true)

	local top_world = Managers.world:world("top_ingame_view")

	return world, top_world
end

VersusPartyCharSelectionView._create_viewport = function (self, world)
	local viewport_name = "versus_char_selection_ui"
	local viewport_type = "default"
	local layer = 960
	local viewport = ScriptWorld.create_viewport(world, viewport_name, viewport_type, layer)

	self._team_world_viewport_name = viewport_name

	return viewport
end

VersusPartyCharSelectionView._spawn_level = function (self, world)
	local level_name = "levels/carousel_podium/world"
	local object_sets = {}
	local position, rotation, shading_callback, mood_setting
	local time_sliced_spawn = false
	local level = ScriptWorld.spawn_level(world, level_name, object_sets, position, rotation, shading_callback, mood_setting, time_sliced_spawn)

	Level.spawn_background(level)
	Level.trigger_level_loaded(level)

	return level
end

local level_name = "levels/carousel_podium/world"

VersusPartyCharSelectionView._setup_background_world = function (self)
	local world, top_world = self:_setup_world()
	local level = self:_spawn_level(world)
	local viewport = self:_create_viewport(world)

	self._background_world = world
	self._top_world = top_world
	self._team_world_viewport = viewport
	self._level = level

	self:_setup_camera_nodes_data(level)
	self:_setup_initial_camera(world, viewport)
end

VersusPartyCharSelectionView._get_heroes_spawn_locations = function (self, party_id)
	local spawn_point_unit_prefix = party_id == self._party_id and "character_slot_0" or "character_slot_enemy_0"
	local unit = "units/hub_elements/versus_podium_character_spawn"
	local unit_indices = LevelResource.unit_indices(level_name, unit)
	local hero_locations = {}

	for i = 1, 4 do
		for _, index in pairs(unit_indices) do
			local unit_data = LevelResource.unit_data(level_name, index)
			local name = DynamicData.get(unit_data, "name")

			if name and name == spawn_point_unit_prefix .. i then
				local position = LevelResource.unit_position(level_name, index)
				local x, y, z = Vector3.to_elements(position)
				local table_vector = {
					x,
					y,
					z,
				}

				hero_locations[#hero_locations + 1] = table_vector
			end
		end
	end

	fassert(#hero_locations ~= 0, "[VersusPartyCharSelectionView:_get_heroes_spawn_locations], No hero locations have been found. Check if unit: %s is present in level: %s and has the script data varaible \"name\" set to the correct name.", unit, level_name)

	return hero_locations
end

VersusPartyCharSelectionView._activate_viewport = function (self)
	ScriptWorld.activate_viewport(self._background_world, self._team_world_viewport)
end

VersusPartyCharSelectionView.set_camera_position = function (self, position)
	local camera = ScriptViewport.camera(self._team_world_viewport)

	return ScriptCamera.set_local_position(camera, position)
end

VersusPartyCharSelectionView.set_camera_rotation = function (self, rotation)
	local camera = ScriptViewport.camera(self._team_world_viewport)

	ScriptCamera.set_local_rotation(camera, rotation)

	local world = self:_get_viewport_world()

	ScriptCamera.force_update(world, camera)
end

VersusPartyCharSelectionView._setup_initial_camera = function (self, world, viewport)
	local ref_camera_data = self._cameras.initial_camera
	local camera = ScriptViewport.camera(viewport)

	self._camera = camera

	local fov = Camera.vertical_fov(ref_camera_data.camera)

	Camera.set_vertical_fov(camera, fov)
	ScriptCamera.set_local_pose(camera, ref_camera_data.camera_pose:unbox())
	ScriptCamera.force_update(world, camera)
end

VersusPartyCharSelectionView._setup_camera_nodes_data = function (self, level)
	local data = {}
	local init_camera_unit = Level.flow_variable(level, "initial_camera")
	local parading_camera_01_unit = Level.flow_variable(level, "parading_position_01")
	local parading_camera_02_unit = Level.flow_variable(level, "parading_position_02")
	local init_camera_pose = Matrix4x4Box(Unit.local_pose(init_camera_unit, 0))
	local parading_camera_01_pose = Matrix4x4Box(Unit.local_pose(parading_camera_01_unit, 0))
	local parading_camera_02_pose = Matrix4x4Box(Unit.local_pose(parading_camera_02_unit, 0))
	local init_camera = Unit.camera(init_camera_unit, "camera")
	local parading_camera_01 = Unit.camera(parading_camera_01_unit, "camera")
	local parading_camera_02 = Unit.camera(parading_camera_02_unit, "camera")

	self._inital_camera_position = Vector3Box(Unit.local_position(init_camera_unit, 0))
	data.initial_camera = {
		camera_unit = init_camera_unit,
		camera_pose = init_camera_pose,
		camera = init_camera,
	}
	data.parading_camera_01 = {
		camera_unit = parading_camera_01_unit,
		camera_pose = parading_camera_01_pose,
		camera = parading_camera_01,
	}
	data.parading_camera_02 = {
		camera_unit = parading_camera_02_unit,
		camera_pose = parading_camera_02_pose,
		camera = parading_camera_02,
	}
	self._cameras = data
end

VersusPartyCharSelectionView._destroy_world = function (self)
	Managers.world:destroy_world(self._background_world)

	self._background_world = nil
	self._top_world = nil
end

VersusPartyCharSelectionView._setup_team_previewer = function (self, spawn_on_setup)
	if self._team_previewer then
		return
	end

	spawn_on_setup = spawn_on_setup or false
	self._team_previewer = TeamPreviewer:new(self._ingame_ui_context, self._background_world, self._team_world_viewport)

	local team_data = self._team_heroes
	local hero_locations = self:_get_heroes_spawn_locations(self._party_id)

	self._team_previewer:setup_team(team_data, hero_locations, spawn_on_setup)

	self._hero_locations = hero_locations
end

VersusPartyCharSelectionView._setup_team_heroes = function (self)
	local party_data = self._party_selection_logic:get_party_data(self._party_id)
	local picker_list = party_data.picker_list
	local team_heroes = self._team_heroes

	table.clear(team_heroes)

	for _, picker in ipairs(picker_list) do
		local hero_data = self:_get_hero_previewer_data(picker, self._party)

		team_heroes[#team_heroes + 1] = hero_data or true
	end
end

VersusPartyCharSelectionView._get_hero_previewer_data = function (self, picker, party_data)
	local status = picker.status
	local profile_index = status.selected_profile_index
	local career_index = status.selected_career_index
	local profile_data = SPProfiles[profile_index]

	if not profile_data or profile_data.affiliation == "dark_pact" then
		return nil
	end

	local slot_id = picker.slot_id
	local slot_data = party_data.slots_data[slot_id]

	if profile_data then
		local careers = profile_data.careers
		local career_settings = careers[career_index]
		local preview_animation = career_settings.versus_preview_animation or career_settings.preview_animation
		local preview_wield_slot = career_settings.preview_wield_slot
		local hero_name = career_settings.profile_name
		local hat = slot_data.slot_hat
		local preview_items = {
			career_settings.preview_items[1],
			{
				item_name = hat ~= "n/a" and hat or career_settings.preview_items[2].item_name,
			},
		}
		local skin_name = slot_data.slot_skin ~= "n/a" and slot_data.slot_skin or career_settings.base_skin

		return {
			profile_index = profile_index,
			career_index = career_index,
			skin_name = skin_name,
			hero_name = hero_name,
			weapon_slot = preview_wield_slot,
			preview_items = preview_items,
			preview_animation = preview_animation,
		}
	end

	return nil
end

VersusPartyCharSelectionView._update_team_previewer = function (self, dt, t)
	local team_previewer = self._team_previewer

	if team_previewer then
		team_previewer:update(dt, t)
		team_previewer:post_update(dt, t)
	end
end

VersusPartyCharSelectionView._destroy_team_previewer = function (self)
	if self._team_previewer then
		self._team_previewer:on_exit()

		self._team_previewer = nil
	end
end

VersusPartyCharSelectionView._spawn_selected_hero = function (self, picker_index)
	local party_data = self._party_selection_logic:get_party_data(self._party_id)
	local picker_list = party_data.picker_list
	local picker = picker_list[picker_index]
	local hero_data = self:_get_hero_previewer_data(picker, self._party)

	if hero_data then
		local hero_previewer = self._team_previewer:get_hero_previewer(picker_index)

		self._team_previewer:_spawn_hero(hero_previewer, hero_data)

		self._team_heroes[picker_index] = hero_data
	end
end

VersusPartyCharSelectionView._play_selected_hero_sound = function (self, career_index, profile_index)
	if profile_index and career_index then
		local profile = SPProfiles[profile_index]
		local careers = profile.careers
		local career_settings = careers[career_index]
		local career_name = career_settings.display_name
		local sound_event = "menu_versus_character_selection_" .. career_name

		self:play_sound(sound_event)
	end
end

VersusPartyCharSelectionView._level_flow_event = function (self, event_name)
	local level = self._level

	Level.trigger_event(level, event_name)
end

local function animate_camera(camera, fov, source_pose, target_pose, start_time, end_time, time)
	local progress
	local interpolation_time = end_time - start_time

	if interpolation_time <= 0.001 then
		progress = 1
	else
		progress = math.clamp((time - start_time) / interpolation_time, 0, 1)
		progress = (3 - 2 * progress) * progress^2
	end

	local new_pose = Matrix4x4.lerp(source_pose, target_pose, progress)

	ScriptCamera.set_local_pose(camera, new_pose)
	Camera.set_vertical_fov(camera, fov)
end

VersusPartyCharSelectionView._update_camera = function (self, t)
	if not self._camera_anim_id then
		return
	end

	local camera = self._camera
	local anim_data = self._camera_animations[self._camera_anim_id]

	if anim_data.animation_end_time and t > anim_data.animation_end_time then
		self._camera_animations[self._camera_anim_id] = nil
		self._camera_anim_id = nil

		return
	end

	if not anim_data.animation_start_time then
		anim_data.animation_start_time = t
		anim_data.animation_end_time = t + 2
	end

	animate_camera(camera, anim_data.fov, anim_data.source_pose:unbox(), anim_data.target_pose:unbox(), anim_data.animation_start_time, anim_data.animation_end_time, t)
	ScriptCamera.force_update(self._background_world, camera)
end

VersusPartyCharSelectionView._set_on_selection_complete_camera_animation = function (self)
	local anim_data = {}
	local fov = Camera.vertical_fov(self._cameras.initial_camera.camera)

	anim_data.fov = fov
	anim_data.source_pose = self._cameras.initial_camera.camera_pose
	anim_data.target_pose = self._cameras.parading_camera_01.camera_pose

	local id = self._cam_anim_indx

	self._camera_anim_id = id
	self._camera_animations[id] = anim_data
	self._cam_anim_indx = self._cam_anim_indx + 1
end

VersusPartyCharSelectionView._muted_peer_id = function (self, peer_id)
	if IS_XB1 then
		if Managers.voice_chat then
			return Managers.voice_chat:is_peer_muted(peer_id)
		else
			return false
		end
	else
		return self._voip:peer_muted(peer_id)
	end
end

VersusPartyCharSelectionView._ignore_voice_message_from_peer_id = function (self, peer_id)
	if IS_XB1 then
		if Managers.voice_chat then
			Managers.voice_chat:mute_peer(peer_id)
		end
	else
		self._voip:mute_member(peer_id)
	end
end

VersusPartyCharSelectionView._remove_ignore_voice_message_from_peer_id = function (self, peer_id)
	if IS_XB1 then
		if Managers.voice_chat then
			Managers.voice_chat:unmute_peer(peer_id)
		end
	else
		self._voip:unmute_member(peer_id)
	end
end

VersusPartyCharSelectionView._update_mute_buttons = function (self)
	for i = 1, #self._player_name_box_widgets do
		local widget = self._player_name_box_widgets[i]
		local content = widget.content
		local peer_id = content.peer_id

		if peer_id and UIUtils.is_button_pressed(widget) then
			local is_peer_muted = self:_muted_peer_id(peer_id)

			if is_peer_muted then
				self:_remove_ignore_voice_message_from_peer_id(peer_id)

				content.muted = false
			else
				self:_ignore_voice_message_from_peer_id(peer_id)

				content.muted = true
			end
		end
	end
end

VersusPartyCharSelectionView.on_party_selection_logic_state_set = function (self, new_state, party_id, picker_id)
	if self._party_id ~= party_id then
		return
	end

	if new_state == "startup" then
		-- Nothing
	elseif new_state == "player_picking_character" then
		if not self._initial_selection_transition_done then
			self._initial_selection_transition_done = true

			self:_start_step_transtion_animation("transition_to_selection")
		end

		self:_start_widget_animation("name_box_fade_to_black", self._player_name_box_widgets[picker_id])
		self:_level_flow_event("chr_" .. picker_id .. "_selected")
		self:_set_current_picker_text(picker_id)
		self:_update_all_player_name_box_widgets()

		local local_player_is_picking = self:local_player_is_picking()

		if local_player_is_picking then
			self:play_sound("menu_versus_character_selection_your_turn_indicator")
			self:play_sound("menu_versus_character_selection_meter_start")
		end
	elseif new_state == "player_has_picked_character" then
		self:play_sound("menu_versus_character_selection_locked")

		local local_player_is_picking = self:local_player_is_picking()

		if local_player_is_picking then
			self:play_sound("menu_versus_character_selection_meter_stop")
		end

		self:_play_selected_hero_sound(self._data_by_pick_index[picker_id].career_index, self._data_by_pick_index[picker_id].profile_index)
		self:_start_widget_animation("name_box_fade_to_gray", self._player_name_box_widgets[picker_id])
		self:_level_flow_event("chr_" .. picker_id .. "_unselected")
	elseif new_state == "parading" then
		self:_level_flow_event("vs_team_heroes_selected")
		self:play_sound("menu_versus_character_selection_start_game_buildup")

		self._prev_timer_value = 0

		self:_set_on_selection_complete_camera_animation()
		self:_start_step_transtion_animation("transition_to_team_parading")
		self:play_sound("Play_menu_versus_parading_start_transition")
	end
end

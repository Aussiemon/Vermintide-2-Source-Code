-- chunkname: @scripts/ui/hud_ui/versus_slot_status_ui.lua

local definitions = local_require("scripts/ui/hud_ui/versus_slot_status_ui_definitions")
local animation_definitions = definitions.animation_definitions
local scenegraph_definition = definitions.scenegraph_definition
local generic_input_actions = definitions.generic_input_actions
local NUM_MAX_TEAMS = 2
local NUM_TEAMS_SIZE = 4
local DO_RELOAD = false
local ALLOW_TEAM_SWITCH = false
local buttons = {}

VersusSlotStatusUI = class(VersusSlotStatusUI)

VersusSlotStatusUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._voip = ingame_ui_context.voip

	local world = ingame_ui_context.world_manager:world("level_world")

	self._wwise_world = Managers.world:wwise_world(world)
	self._is_in_inn = ingame_ui_context.is_in_inn
	self._ingame_ui_context = ingame_ui_context

	local input_manager = self._input_manager

	input_manager:create_input_service("versus_status_list_input", "IngamePlayerListKeymaps", "IngamePlayerListFilters")
	input_manager:map_device_to_service("versus_status_list_input", "keyboard")
	input_manager:map_device_to_service("versus_status_list_input", "mouse")
	input_manager:map_device_to_service("versus_status_list_input", "gamepad")

	self._animations = {}
	self._render_settings = {
		alpha_multiplier = 0,
		snap_pixel_positions = true,
	}
	self._menu_input_description = MenuInputDescriptionUI:new(nil, self._ui_renderer, self:input_service(), 5, 900, generic_input_actions.default)
	self._current_input_desc = nil

	self._menu_input_description:set_input_description(self._current_input_desc)
	self:_create_ui_elements()
end

VersusSlotStatusUI._create_ui_elements = function (self)
	UIRenderer.clear_scenegraph_queue(self._ui_renderer)
	UIRenderer.clear_scenegraph_queue(self._ui_top_renderer)

	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)

	local widgets = {}
	local widgets_by_name = {}
	local widget_definitions = definitions.widget_definitions

	for name, definition in pairs(widget_definitions) do
		local widget = UIWidget.init(definition)

		widgets_by_name[name] = widget
		widgets[#widgets + 1] = widget
	end

	local host_widgets = {}
	local widget_definitions = definitions.host_widget_definitions

	for name, definition in pairs(widget_definitions) do
		local widget = UIWidget.init(definition)

		widgets_by_name[name] = widget
		host_widgets[#host_widgets + 1] = widget
	end

	self._widgets = widgets
	self._host_widgets = host_widgets
	self._widgets_by_name = widgets_by_name
	DO_RELOAD = false

	self:_create_player_slots()

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
end

VersusSlotStatusUI.destroy = function (self)
	self._ui_animator = nil
end

VersusSlotStatusUI.update = function (self, dt, t)
	if DO_RELOAD then
		self:_create_ui_elements()
	end

	local matchmaking_manager = Managers.matchmaking

	self._force_starting = Managers.matchmaking:is_player_hosting() and self._force_starting

	local is_versus_matchmaking = matchmaking_manager:is_matchmaking_versus()

	if not is_versus_matchmaking then
		if self._active then
			self:_set_active(false)
		end

		return
	end

	self:_handle_input(dt, t)

	if self._active then
		self:_update_animations(dt, t)
		self:_update_input_desc()
		self:_update_custom_lobby_slots()
		self:_draw(dt)
	end
end

VersusSlotStatusUI._update_animations = function (self, dt, t)
	local animations = self._animations
	local ui_animator = self._ui_animator

	ui_animator:update(dt)

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end

	local is_player_hosting = Managers.matchmaking:is_player_hosting()

	if is_player_hosting then
		local widget = self._widgets_by_name.force_start_button
		local game_mechanism = Managers.mechanism:game_mechanism()
		local slot_reservation_handler = game_mechanism:get_slot_reservation_handler()

		widget.content.button_hotspot.disable_button = not slot_reservation_handler:all_teams_have_members()
		widget.content.button_hotspot.disable_button = not Development.parameter("allow_versus_force_start_single_player")

		UIWidgetUtils.animate_default_button(widget, dt)
	end
end

VersusSlotStatusUI._update_input_desc = function (self)
	local game_mechanism = Managers.mechanism:game_mechanism()
	local slot_reservation_handler = game_mechanism:get_slot_reservation_handler()
	local is_player_hosting = Managers.matchmaking:is_player_hosting()
	local force_start_available = slot_reservation_handler:all_teams_have_members()
	local input_desc

	if is_player_hosting then
		if force_start_available then
			if ALLOW_TEAM_SWITCH then
				input_desc = "force_start_switch_team"
			else
				input_desc = "force_start"
			end
		elseif ALLOW_TEAM_SWITCH then
			input_desc = "switch_team"
		end
	elseif ALLOW_TEAM_SWITCH then
		input_desc = "switch_team"
	end

	if self._current_input_desc ~= input_desc then
		self._menu_input_description:set_input_description(generic_input_actions[input_desc])

		self._current_input_desc = input_desc
	end
end

VersusSlotStatusUI._draw = function (self, dt)
	local ui_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_manager = self._input_manager
	local input_service = input_manager:get_service("versus_status_list_input")
	local render_settings = self._render_settings
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local alpha_multiplier = render_settings.alpha_multiplier or 1

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local widgets = self._widgets

	if widgets then
		for i = 1, #widgets do
			local widget = widgets[i]

			render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	local is_player_hosting = Managers.matchmaking:is_player_hosting()

	if is_player_hosting then
		local widgets = self._host_widgets

		if widgets then
			for i = 1, #widgets do
				local widget = widgets[i]

				render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

				UIRenderer.draw_widget(ui_renderer, widget)
			end
		end
	end

	if gamepad_active then
		self._menu_input_description:draw(ui_renderer, dt)
	end

	local custom_game_slots = self._custom_game_slots

	if custom_game_slots then
		for i = 1, #custom_game_slots do
			local team_slots = custom_game_slots[i]

			for j = 1, #team_slots do
				local player_slot = team_slots[j]
				local empty = player_slot.empty
				local is_player = player_slot.is_player
				local peer_id = player_slot.peer_id

				if not empty then
					local portrait_widget = player_slot.portrait_widget

					if portrait_widget then
						UIRenderer.draw_widget(ui_renderer, portrait_widget)
					end

					if is_player then
						local button_panel_widget = player_slot.button_panel_widget

						if button_panel_widget then
							UIRenderer.draw_widget(ui_renderer, button_panel_widget)

							local content = button_panel_widget.content
							local num_buttons = content.num_buttons

							for k = 1, num_buttons do
								local button_data_name = "button_data_" .. k
								local button_data = content[button_data_name]
								local hotspot_name = "hotspot_" .. k
								local hotspot = content[hotspot_name]
								local functions = button_data.functions
								local status_function = functions.status
								local update_status = false

								if status_function and hotspot.blocked == nil then
									update_status = true
								end

								if hotspot.on_pressed then
									local trigger_function = functions.trigger

									if trigger_function then
										self[trigger_function](self, peer_id)
									else
										local allow_function = functions.allow
										local block_function = functions.block

										if hotspot.blocked then
											if allow_function then
												self[allow_function](self, peer_id)
											end
										elseif block_function then
											self[block_function](self, peer_id)
										end

										update_status = true
									end
								end

								if update_status then
									local status = self[status_function](self, peer_id)

									hotspot.blocked = status and true or false
								end
							end
						end
					end
				end

				local panel_widget = player_slot.panel_widget

				if panel_widget then
					UIRenderer.draw_widget(ui_renderer, panel_widget)
				end

				local ready_widget = player_slot.ready_widget

				if ready_widget then
					UIRenderer.draw_widget(ui_renderer, ready_widget)
				end
			end
		end
	end

	UIRenderer.end_pass(ui_renderer)

	render_settings.alpha_multiplier = alpha_multiplier
end

VersusSlotStatusUI._set_level_name = function (self, text)
	local widget = self._widgets_by_name.level_name

	widget.content.text = text
end

VersusSlotStatusUI._set_sub_title = function (self, text)
	local widget = self._widgets_by_name.sub_title

	widget.content.text = text
end

VersusSlotStatusUI.input_service = function (self)
	local input_manager = self._input_manager

	return input_manager:get_service("versus_status_list_input")
end

VersusSlotStatusUI.is_focused = function (self)
	return self._active and self.cursor_active
end

VersusSlotStatusUI.is_active = function (self)
	return self._active
end

VersusSlotStatusUI._set_active = function (self, active)
	local chat_gui = Managers.chat.chat_gui

	if active then
		local anim_params = {
			render_settings = self._render_settings,
		}

		self._ui_animator:start_animation("on_enter", self._widgets_by_name, scenegraph_definition, anim_params)
		Managers.input:enable_gamepad_cursor()
	else
		chat_gui:hide_chat()
		Managers.input:disable_gamepad_cursor()
	end

	self._active = active

	if active then
		self._fade_in_duration = 0
	end

	self:_deactivate_cursor()
end

VersusSlotStatusUI._deactivate_cursor = function (self)
	if self.cursor_active then
		ShowCursorStack.pop()

		local input_manager = self._input_manager

		input_manager:device_unblock_all_services("keyboard")
		input_manager:device_unblock_all_services("mouse")
		input_manager:device_unblock_all_services("gamepad")

		self.cursor_active = false
		self._widgets_by_name.input_description_text.content.visible = true
	end
end

VersusSlotStatusUI._activate_cursor = function (self)
	if not self.cursor_active then
		ShowCursorStack.push()

		local input_manager = self._input_manager

		input_manager:block_device_except_service("versus_status_list_input", "keyboard")
		input_manager:block_device_except_service("versus_status_list_input", "mouse")
		input_manager:block_device_except_service("versus_status_list_input", "gamepad")

		self.cursor_active = true
		self._widgets_by_name.input_description_text.content.visible = false
	end
end

VersusSlotStatusUI._handle_input = function (self, dt)
	local input_manager = self._input_manager
	local in_fade_active = Managers.transition:in_fade_active()
	local input_service = input_manager:get_service("versus_status_list_input")

	if not in_fade_active and (input_service:get("versus_status_list_exit") or input_service:get("versus_status_list_toggle") or input_service:get("back") or input_service:get("toggle_menu")) and self._active and self.cursor_active then
		self:_set_active(false)
	elseif not self.cursor_active then
		if not in_fade_active and input_service:get("versus_status_list_toggle") then
			if not self:is_active() then
				self:_set_active(true)
				self:_activate_cursor()
			end
		elseif input_service:get("versus_status_list_pressed") then
			if not self._active then
				self:_set_active(true)
			end
		elseif self._active and not input_service:get("versus_status_list_held") then
			self:_set_active(false)
		end
	end

	if self._active then
		if input_service:get("activate_versus_status_list") then
			self:_activate_cursor()
		end

		input_service:get("ingame_player_list_pressed", true)
		input_service:get("ingame_player_list_held", true)

		local game_mechanism = Managers.mechanism:game_mechanism()
		local slot_reservation_handler = game_mechanism:get_slot_reservation_handler()
		local all_teams_have_members = slot_reservation_handler:all_teams_have_members()

		if all_teams_have_members or Development.parameter("allow_versus_force_start_single_player") then
			local widget = self._widgets_by_name.force_start_button

			if UIUtils.is_button_pressed(widget) or input_service:get("force_start") then
				self:_deactivate_cursor()
				Managers.matchmaking:force_start_game()

				self._force_starting = true
			end
		end
	end
end

VersusSlotStatusUI._create_player_slots = function (self)
	local ui_scenegraph = self._ui_scenegraph
	local create_player_button_panel = definitions.create_player_button_panel
	local custom_game_slots = {}

	for i = 1, NUM_MAX_TEAMS do
		local team_slots = {}

		custom_game_slots[i] = team_slots

		for j = 1, NUM_TEAMS_SIZE do
			local slot_data = {}

			team_slots[j] = slot_data

			local player_panel_scenegraph_id = "team_" .. i .. "_player_panel_" .. j
			local player_panel_scenegraph = ui_scenegraph[player_panel_scenegraph_id]

			if player_panel_scenegraph then
				local size = ui_scenegraph[player_panel_scenegraph_id].size
				local left_aligned = i == 1
				local widget_definition = UIWidgets.create_player_panel_widget(player_panel_scenegraph_id, size, left_aligned)
				local widget = UIWidget.init(widget_definition)

				widget.content.open_slot_text = ""
				widget.style.unready_texture.color[1] = 0
				slot_data.panel_widget = widget

				local num_buttons = #buttons
				local button_panel_scenegraph_id = player_panel_scenegraph_id
				local button_panel_widget_definition = create_player_button_panel(button_panel_scenegraph_id, num_buttons, left_aligned)
				local button_panel_widget = UIWidget.init(button_panel_widget_definition)

				slot_data.button_panel_widget = button_panel_widget

				local button_panel_content = button_panel_widget.content

				button_panel_content.num_buttons = num_buttons

				for k = 1, #buttons do
					local button = buttons[k]
					local icon = button.icon
					local icon_name = "icon_" .. k

					button_panel_content[icon_name] = icon

					local button_data_name = "button_data_" .. k

					button_panel_content[button_data_name] = button
				end
			end
		end
	end

	self._custom_game_slots = custom_game_slots
end

local FORMATTED_SYNC_DATA = {}
local TEAM_ONE = {}
local TEAM_TWO = {}

VersusSlotStatusUI._format_sync_data = function (self, sync_data)
	table.clear(FORMATTED_SYNC_DATA)
	table.clear(TEAM_ONE)
	table.clear(TEAM_TWO)

	FORMATTED_SYNC_DATA[1] = TEAM_ONE
	FORMATTED_SYNC_DATA[2] = TEAM_TWO

	for peer_id, data in pairs(sync_data) do
		local party_id = data.party_id
		local team_data = FORMATTED_SYNC_DATA[party_id]

		team_data[#team_data + 1] = data
	end

	return FORMATTED_SYNC_DATA
end

local EMPTY_TABLE = {}

VersusSlotStatusUI._update_custom_lobby_slots = function (self)
	local sync_data = Managers.matchmaking:get_sync_data() or EMPTY_TABLE
	local formatted_sync_data = self:_format_sync_data(sync_data)

	for i = 1, NUM_MAX_TEAMS do
		local team_sync_data = formatted_sync_data[i]
		local team_slots = self._custom_game_slots[i]

		for j = 1, NUM_TEAMS_SIZE do
			local player_sync_data = team_sync_data[j] or EMPTY_TABLE
			local player_slot = team_slots[j]
			local panel_widget = player_slot.panel_widget
			local panel_content = panel_widget.content
			local panel_style = panel_widget.style
			local button_hotspot = panel_content.button_hotspot

			if table.is_empty(player_sync_data) then
				panel_content.empty = true
				player_slot.empty = true
			else
				local slot_changed = false
				local slot_filled = true
				local ready = true
				local peer_id = player_sync_data.peer_id
				local player_name = player_sync_data.player_name
				local career_name = player_sync_data.career_name
				local profile_index = player_sync_data.profile_index
				local career_index = player_sync_data.career_index
				local slot_melee_name = player_sync_data.slot_melee
				local slot_ranged_name = player_sync_data.slot_ranged
				local slot_frame_name = player_sync_data.slot_frame

				if player_slot.peer_id ~= peer_id then
					player_slot.peer_id = peer_id
					slot_changed = true
				end

				if player_slot.ready ~= ready then
					player_slot.ready = ready
					panel_content.ready = ready
				end

				local profile_updated = false

				if player_slot.profile_index ~= profile_index or player_slot.career_index ~= career_index or slot_changed then
					player_slot.profile_index = profile_index
					player_slot.career_index = career_index
					profile_updated = true
				end

				if profile_updated then
					local player_portrait_frame = self:_get_portrait_frame(slot_frame_name)
					local power_level_text = ""
					local portrait_texture = self:_get_hero_portrait(profile_index, career_index)
					local player_frame_scenegraph_id = "team_" .. i .. "_player_frame_" .. j
					local portrait_widget = self:_create_portrait_frame(player_frame_scenegraph_id, player_portrait_frame, power_level_text, portrait_texture)

					player_slot.portrait_widget = portrait_widget
				end

				if player_slot.player_name ~= player_name then
					player_slot.player_name = player_name
					panel_content.player_name = player_name
				end

				if career_name and player_slot.career_name ~= career_name then
					player_slot.career_name = career_name
					panel_content.career_name = Localize(career_name)

					self:_apply_color_values(panel_style.background.color, Colors.color_definitions[career_name])
				end

				if slot_melee_name then
					self:_set_player_custom_panel_loadout_icon(panel_widget, slot_melee_name, 1)
				end

				if slot_ranged_name then
					self:_set_player_custom_panel_loadout_icon(panel_widget, slot_ranged_name, 2)
				end

				panel_content.empty = not slot_filled
				panel_content.is_local_player = true
				player_slot.empty = not slot_filled
				player_slot.is_player = true
				player_slot.peer_id = peer_id
			end
		end
	end
end

VersusSlotStatusUI._set_player_custom_panel_loadout_icon = function (self, widget, item_name, name_sufix)
	local item_icon_name = "item_icon_" .. name_sufix
	local hotspot_name = "item_hotspot_" .. name_sufix
	local item_tooltip_name = "item_tooltip_" .. name_sufix
	local content = widget.content
	local style = widget.style

	if item_name then
		local item = {
			data = ItemMasterList[item_name],
		}
		local inventory_icon, display_name, _ = UIUtils.get_ui_information_from_item(item)

		content[item_tooltip_name] = display_name
		content["item" .. name_sufix] = item
		content[item_icon_name] = inventory_icon
	end
end

VersusSlotStatusUI._get_hero_portrait = function (self, profile_index, career_index)
	local default_portrait = "eor_empty_player"

	if profile_index == nil or career_index == nil then
		return default_portrait
	end

	local profile = SPProfiles[profile_index]
	local career = profile.careers[career_index]
	local portrait_texture = career.portrait_image

	return portrait_texture or default_portrait
end

VersusSlotStatusUI._get_portrait_frame = function (self, frame_name)
	local item = ItemMasterList[frame_name]

	if not item then
		return "default"
	end

	local frame_name = item.temporary_template

	return frame_name or "default"
end

VersusSlotStatusUI._create_portrait_frame = function (self, scenegraph_id, frame_settings_name, level_text, portrait_texture, optional_scale)
	local scale = optional_scale or 1
	local retained_mode = false
	local widget_definition = UIWidgets.create_portrait_frame(scenegraph_id, frame_settings_name, level_text, scale, retained_mode, portrait_texture)
	local widget = UIWidget.init(widget_definition)
	local widget_content = widget.content

	widget_content.frame_settings_name = frame_settings_name
	widget_content.level_text = level_text

	return widget
end

VersusSlotStatusUI._apply_color_values = function (self, target, source, include_alpha)
	if include_alpha then
		target[1] = source[1]
	end

	target[2] = source[2]
	target[3] = source[3]
	target[4] = source[4]
end

VersusSlotStatusUI._show_profile_by_peer_id = function (self, peer_id)
	if IS_WINDOWS and rawget(_G, "Steam") then
		local id = Steam.id_hex_to_dec(peer_id)
		local url = "http://steamcommunity.com/profiles/" .. id

		Steam.open_url(url)
	elseif IS_XB1 then
		local xuid = self.network_lobby.lobby:xuid(peer_id)

		if xuid then
			XboxLive.show_gamercard(Managers.account:user_id(), xuid)
		end
	elseif IS_PS4 then
		Managers.account:show_player_profile_with_account_id(peer_id)
	end
end

VersusSlotStatusUI._muted_peer_id = function (self, peer_id)
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

VersusSlotStatusUI._ignore_voice_message_from_peer_id = function (self, peer_id)
	if IS_XB1 then
		if Managers.voice_chat then
			Managers.voice_chat:mute_peer(peer_id)
		end
	else
		self._voip:mute_member(peer_id)
	end
end

VersusSlotStatusUI._remove_ignore_voice_message_from_peer_id = function (self, peer_id)
	if IS_XB1 then
		if Managers.voice_chat then
			Managers.voice_chat:unmute_peer(peer_id)
		end
	else
		self._voip:unmute_member(peer_id)
	end
end

VersusSlotStatusUI._ignoring_chat_peer_id = function (self, peer_id)
	if IS_WINDOWS then
		local chat_gui = Managers.chat.chat_gui

		return chat_gui:ignoring_peer_id(peer_id)
	elseif IS_XB1 then
		return Managers.chat:ignoring_peer_id(peer_id)
	end
end

VersusSlotStatusUI._ignore_chat_message_from_peer_id = function (self, peer_id)
	if IS_WINDOWS then
		local chat_gui = Managers.chat.chat_gui

		chat_gui:ignore_peer_id(peer_id)
	elseif IS_XB1 then
		Managers.chat:ignore_peer_id(peer_id)
	end
end

VersusSlotStatusUI._remove_ignore_chat_message_from_peer_id = function (self, peer_id)
	if IS_WINDOWS then
		local chat_gui = Managers.chat.chat_gui

		chat_gui:remove_ignore_peer_id(peer_id)
	elseif IS_XB1 then
		Managers.chat:remove_ignore_peer_id(peer_id)
	end
end

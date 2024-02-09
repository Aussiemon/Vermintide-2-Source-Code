-- chunkname: @scripts/ui/hud_ui/versus_tab_ui.lua

local definitions = local_require("scripts/ui/hud_ui/versus_tab_ui_definitions")
local animation_definitions = definitions.animation_definitions
local scenegraph_definition = definitions.scenegraph_definition
local NUM_MAX_TEAMS = 2
local NUM_TEAMS_SIZE = 4
local DO_RELOAD = false
local buttons = {
	{
		icon = "tab_menu_icon_01",
		toggle = true,
		used_by_local_player = false,
		functions = {
			allow = "_remove_ignore_voice_message_from_peer_id",
			block = "_ignore_voice_message_from_peer_id",
			status = "_muted_peer_id",
		},
	},
	{
		icon = "tab_menu_icon_02",
		toggle = true,
		used_by_local_player = false,
		functions = {
			allow = "_remove_ignore_chat_message_from_peer_id",
			block = "_ignore_chat_message_from_peer_id",
			status = "_ignoring_chat_peer_id",
		},
	},
	{
		icon = "tab_menu_icon_05",
		toggle = false,
		used_by_local_player = false,
		functions = {
			trigger = "_show_profile_by_peer_id",
		},
	},
}

VersusTabUI = class(VersusTabUI)

VersusTabUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._input_manager = ingame_ui_context.input_manager
	self._voip = ingame_ui_context.voip

	local player = ingame_ui_context.player

	self._player = player
	self._peer_id = player:network_id()
	self._local_player_id = player:local_player_id()
	self._context = ingame_ui_context

	local world = ingame_ui_context.world_manager:world("level_world")

	self._wwise_world = Managers.world:wwise_world(world)

	local input_manager = self._input_manager

	input_manager:create_input_service("player_list_input", "IngamePlayerListKeymaps", "IngamePlayerListFilters")
	input_manager:map_device_to_service("player_list_input", "keyboard")
	input_manager:map_device_to_service("player_list_input", "mouse")
	input_manager:map_device_to_service("player_list_input", "gamepad")

	self._animations = {}
	self._render_settings = {
		alpha_multiplier = 0,
		snap_pixel_positions = true,
	}
	self._selected_objective_index = 0
	self._selected_sub_objective_index = 0

	self:_create_ui_elements()

	self._objective_system = Managers.state.entity:system("versus_objective_system")
	self._objectives_initialized = false
	self._win_conditions = Managers.mechanism:game_mechanism():win_conditions()

	local level_key = Managers.level_transition_handler:get_current_level_keys()
	local level_settings = LevelSettings[level_key]
	local level_name_localized = Localize(level_settings.display_name)

	self:_set_level_name(level_name_localized)
end

VersusTabUI._create_ui_elements = function (self)
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

	self._widgets_by_name = widgets_by_name
	self._widgets = widgets
	DO_RELOAD = false

	self:_create_player_slots()

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
end

VersusTabUI.destroy = function (self)
	self._ui_animator = nil
end

VersusTabUI.update = function (self, dt, t)
	if DO_RELOAD then
		self:_create_ui_elements()
	end

	self:_handle_input(dt, t)

	if self._active then
		local mechanism_manager = Managers.mechanism
		local current_set = mechanism_manager:game_mechanism():get_current_set()
		local level_key = Managers.level_transition_handler:get_current_level_key()
		local max_rounds = VersusObjectiveSettings[level_key].num_sets

		if current_set ~= self._round_id then
			self._round_id = current_set

			local temp_string = Localize("versus_round_count")

			self:_set_sub_title(string.format(temp_string, current_set, max_rounds))
		end

		local party_manager = Managers.party
		local _, party_id = party_manager:get_party_from_player_id(self._peer_id, self._local_player_id)
		local opponent_party_id = self:_get_opponent_party_id()

		self:_set_team_name(party_id, opponent_party_id)
		self:_set_team_textures(party_id, opponent_party_id)
		self:_set_side_text(party_manager, party_id, opponent_party_id)

		if not self._party_id then
			self._party_id = party_id
			self._opponent_party_id = opponent_party_id
		end

		local world = self._ui_renderer.world
		local shading_env = World.get_data(world, "shading_environment")

		if shading_env then
			ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", 1)
			ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", 0.75)
			ShadingEnvironment.apply(shading_env)
		end

		self:_update_score(party_id, opponent_party_id)
		self:_update_animations(dt, t)
		self:_update_custom_lobby_slots()
		self:_draw(dt)
	end
end

VersusTabUI._update_animations = function (self, dt, t)
	local animations = self._animations
	local ui_animator = self._ui_animator

	ui_animator:update(dt)

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end
end

VersusTabUI._draw = function (self, dt)
	local ui_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_manager = self._input_manager
	local input_service = input_manager:get_service("player_list_input")
	local render_settings = self._render_settings
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

VersusTabUI._set_team_name = function (self, local_player_party_id, opponent_party_id)
	local local_team_ui_settings, opponent_team_ui_settings = self:_get_teams_ui_settings(local_player_party_id, opponent_party_id)
	local team_1_name = self._widgets_by_name.team_1_name

	team_1_name.content.text = Localize(local_team_ui_settings.display_name)

	local team_2_name = self._widgets_by_name.team_2_name

	team_2_name.content.text = Localize(opponent_team_ui_settings.display_name)
end

VersusTabUI._set_team_textures = function (self, local_player_party_id, opponent_party_id)
	local local_team_ui_settings, opponent_team_ui_settings = self:_get_teams_ui_settings(local_player_party_id, opponent_party_id)
	local team_1_icon = self._widgets_by_name.team_1_icon

	team_1_icon.content.team_icon = local_team_ui_settings.team_icon

	local team_2_icon = self._widgets_by_name.team_2_icon

	team_2_icon.content.team_icon = opponent_team_ui_settings.team_icon
end

VersusTabUI._set_side_text = function (self, party_manager, local_player_party_id, opponent_party_id)
	local settings = DLCSettings.carousel
	local local_player_party = party_manager:get_party(local_player_party_id)

	if local_player_party then
		local side = Managers.state.side.side_by_party[local_player_party]
		local side_name = side:name()
		local side_name_text = self._widgets_by_name.team_1_side_text
		local side_localization_key = settings.sides_localization_lookup[side_name]

		side_name_text.content.text = Localize(side_localization_key)
	end

	local opponent_party = party_manager:get_party(opponent_party_id)

	if opponent_party then
		local side = Managers.state.side.side_by_party[opponent_party]
		local side_name = side:name()
		local side_name_text = self._widgets_by_name.team_2_side_text
		local side_localization_key = settings.sides_localization_lookup[side_name]

		side_name_text.content.text = side_localization_key and Localize(side_localization_key) or Localize("not_assigned")
	end
end

VersusTabUI._update_score = function (self, local_player_party_id, opponent_party_id)
	local local_player_team_score = self._win_conditions:get_total_score(local_player_party_id)
	local opponent_team_score = self._win_conditions:get_total_score(opponent_party_id)
	local local_player_party = Managers.party:get_party(local_player_party_id)
	local local_player_team_side = Managers.state.side.side_by_party[local_player_party]
	local local_player_team_side_name = local_player_team_side:name()
	local team_1_score = self._widgets_by_name.team_1_score
	local team_2_score = self._widgets_by_name.team_2_score

	team_1_score.content.score_text = local_player_team_score
	team_1_score.content.is_hero = local_player_team_side_name == "heroes"
	team_2_score.content.score_text = opponent_team_score
	team_2_score.content.is_hero = local_player_team_side_name ~= "heroes"
end

VersusTabUI._get_teams_ui_settings = function (self, local_player_party_id, opponent_party_id)
	local local_player_team_name_key = Managers.state.game_mode:setting("party_names_lookup_by_id")[local_player_party_id]
	local opponent_team_name_key = Managers.state.game_mode:setting("party_names_lookup_by_id")[opponent_party_id]
	local dlc_settings = DLCSettings.carousel
	local local_team_ui_settings = dlc_settings.teams_ui_assets[local_player_team_name_key]
	local opponent_ui_settings = dlc_settings.teams_ui_assets[opponent_team_name_key]

	return local_team_ui_settings, opponent_ui_settings
end

VersusTabUI._set_level_name = function (self, text)
	local widget = self._widgets_by_name.level_name

	widget.content.text = text
end

VersusTabUI._set_sub_title = function (self, text)
	local widget = self._widgets_by_name.sub_title

	widget.content.text = text
end

VersusTabUI.input_service = function (self)
	local input_manager = self._input_manager

	return input_manager:get_service("player_list_input")
end

VersusTabUI.is_focused = function (self)
	return self._active and self.cursor_active
end

VersusTabUI.is_active = function (self)
	return self._active
end

VersusTabUI.set_active = function (self, active)
	local chat_gui = Managers.chat.chat_gui

	if active then
		local anim_params = {
			render_settings = self._render_settings,
		}

		self._ui_animator:start_animation("on_enter", self._widgets_by_name, scenegraph_definition, anim_params)

		local world = self._ui_renderer.world
		local shading_env = World.get_data(world, "shading_environment")

		if shading_env then
			ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", 1)
			ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", 0.75)
			ShadingEnvironment.apply(shading_env)
		end

		Managers.input:enable_gamepad_cursor()
	else
		local world = self._ui_renderer.world
		local shading_env = World.get_data(world, "shading_environment")

		if shading_env then
			ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", 0)
			ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", 0)
			ShadingEnvironment.apply(shading_env)
		end

		chat_gui:hide_chat()
		Managers.input:disable_gamepad_cursor()
	end

	self._active = active

	if active then
		self._fade_in_duration = 0
	end

	self:_deactivate_cursor()
end

VersusTabUI._deactivate_cursor = function (self)
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

VersusTabUI._activate_cursor = function (self)
	if not self.cursor_active then
		ShowCursorStack.push()

		local input_manager = self._input_manager

		input_manager:block_device_except_service("player_list_input", "keyboard")
		input_manager:block_device_except_service("player_list_input", "mouse")
		input_manager:block_device_except_service("player_list_input", "gamepad")

		self.cursor_active = true
		self._widgets_by_name.input_description_text.content.visible = false
	end
end

VersusTabUI._handle_input = function (self, dt)
	local input_manager = self._input_manager
	local in_fade_active = Managers.transition:in_fade_active()
	local input_service = input_manager:get_service("player_list_input")

	if not in_fade_active and (input_service:get("ingame_player_list_exit") or input_service:get("ingame_player_list_toggle") or input_service:get("back")) and self._active and self.cursor_active then
		self:set_active(false)
	elseif not self.cursor_active then
		if not in_fade_active and input_service:get("ingame_player_list_toggle") then
			self:_activate_cursor()
		elseif input_service:get("ingame_player_list_pressed") then
			if not self._active then
				self:set_active(true)
			end
		elseif self._active and not input_service:get("ingame_player_list_held") then
			self:set_active(false)
		end
	end

	if self._active and input_service:get("activate_ingame_player_list") then
		self:_activate_cursor()
	end
end

VersusTabUI._create_player_slots = function (self)
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

VersusTabUI._update_custom_lobby_slots = function (self)
	local party_manager = Managers.party
	local player_manager = Managers.player
	local pre_game_logic = self._pre_game_logic
	local players = player_manager:human_and_bot_players()
	local custom_game_slots = self._custom_game_slots

	if not custom_game_slots then
		return
	end

	local local_player_team_slots = custom_game_slots[1]

	self:_update_party_slots_data(self._party_id, local_player_team_slots, 1, party_manager, player_manager, pre_game_logic, players)

	local opponent_team_slots = custom_game_slots[2]
	local opponent_party_id = self:_get_opponent_party_id()

	self:_update_party_slots_data(opponent_party_id, opponent_team_slots, 2, party_manager, player_manager, pre_game_logic, players)
end

VersusTabUI._update_party_slots_data = function (self, party_id, team_slots, team, party_manager, player_manager, pre_game_logic, players)
	local party = party_manager:get_party(party_id)

	if party then
		local side = Managers.state.side.side_by_party[party]
		local is_dark_pact = side and side:name() == "dark_pact"
		local slots = party.slots

		for j = 1, #team_slots do
			local player_slot = team_slots[j]
			local status = slots[j]
			local slot_changed = false
			local slot_filled = false
			local panel_widget = player_slot.panel_widget
			local panel_content = panel_widget.content
			local panel_style = panel_widget.style
			local button_hotspot = panel_content.button_hotspot

			if player_slot.unique_id ~= status.unique_id then
				player_slot.unique_id = status.unique_id
				slot_changed = true
			end

			local peer_id, local_player_id = status.peer_id, status.local_player_id
			local player
			local is_player = false
			local ready = false
			local profile_index, career_index, melee_name, ranged_name

			if peer_id and local_player_id then
				profile_index = status.profile_index
				career_index = status.career_index
				player = status.player
				is_player = status.is_player
				slot_filled = true
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

			local is_local_player = false
			local unique_id = player and player:unique_id()
			local player_exists = player and players[unique_id]

			if player_exists then
				if profile_updated then
					local is_player_controlled = player:is_player_controlled()
					local player_portrait_frame = self:_get_portrait_frame(profile_index, career_index)
					local level_text = player and (is_player_controlled and "-" or UISettings.bots_level_display_text) or ""
					local portrait_texture = is_dark_pact and "eor_empty_player" or self:_get_hero_portrait(profile_index, career_index)
					local player_frame_scenegraph_id = "team_" .. team .. "_player_frame_" .. j
					local portrait_widget = self:_create_portrait_frame(player_frame_scenegraph_id, player_portrait_frame, level_text, portrait_texture)

					player_slot.portrait_widget = portrait_widget
				end

				is_local_player = player.local_player

				local player_name = player:name()
				local career_name = player:career_name()

				if player_slot.player_name ~= player_name then
					player_slot.player_name = player_name
					panel_content.player_name = player_name
				end

				if career_name and player_slot.career_name ~= career_name then
					player_slot.career_name = career_name
					panel_content.career_name = is_dark_pact and "???" or Localize(career_name)

					self:_apply_color_values(panel_style.background.color, Colors.color_definitions[career_name] or Colors.color_definitions.white)
				end

				local player_unit = player.player_unit

				if Unit.alive(player_unit) then
					local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
					local equipment = inventory_extension:equipment()
					local slots = equipment.slots
					local slot_1 = slots.slot_melee
					local slot_2 = slots.slot_ranged
					local slot_1_item_data = slot_1 and slot_1.item_data
					local slot_2_item_data = slot_2 and slot_2.item_data
					local slot_1_item_name = slot_1_item_data and slot_1_item_data.name
					local slot_2_item_name = slot_2_item_data and slot_2_item_data.name

					if slot_1_item_name then
						self:_set_player_custom_panel_loadout_icon(panel_widget, slot_1_item_name, 1)
					end

					if slot_2_item_name then
						self:_set_player_custom_panel_loadout_icon(panel_widget, slot_2_item_name, 2)
					end
				end
			end

			panel_content.empty = not slot_filled
			panel_content.is_local_player = not is_dark_pact and player ~= nil
			player_slot.empty = not slot_filled
			player_slot.is_player = is_player
			player_slot.peer_id = peer_id
			player_slot.is_dark_pact = is_dark_pact

			if ready or self:_button_pressed(button_hotspot) then
				-- Nothing
			elseif is_local_player and not self._inventory_grid then
				-- Nothing
			end
		end
	end
end

VersusTabUI._set_player_custom_panel_loadout_icon = function (self, widget, item_name, name_sufix)
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

VersusTabUI._button_pressed = function (self, button_hotspot)
	if button_hotspot.on_release then
		button_hotspot.on_release = false

		return true
	end

	return false
end

VersusTabUI._get_hero_portrait = function (self, profile_index, career_index)
	local default_portrait = "eor_empty_player"

	if profile_index == nil or career_index == nil then
		return default_portrait
	end

	local profile = SPProfiles[profile_index]
	local career = profile.careers[career_index]
	local portrait_texture = career.portrait_image

	return portrait_texture or default_portrait
end

VersusTabUI._get_portrait_frame = function (self, profile_index, career_index)
	local profile = SPProfiles[profile_index]
	local career_data = profile and profile.careers[career_index]
	local career_name = career_data and career_data.name

	if career_name == "vs_undecided" then
		return "default"
	end

	local item = career_name and BackendUtils.get_loadout_item(career_name, "slot_frame")

	if not item then
		return "default"
	end

	local item_data = item.data
	local frame_name = item_data.temporary_template

	return frame_name or "default"
end

VersusTabUI._create_portrait_frame = function (self, scenegraph_id, frame_settings_name, level_text, portrait_texture, optional_scale)
	local scale = optional_scale or 1
	local retained_mode = false
	local widget_definition = UIWidgets.create_portrait_frame(scenegraph_id, frame_settings_name, level_text, scale, retained_mode, portrait_texture)
	local widget = UIWidget.init(widget_definition)
	local widget_content = widget.content

	widget_content.frame_settings_name = frame_settings_name
	widget_content.level_text = level_text

	return widget
end

VersusTabUI._apply_color_values = function (self, target, source, include_alpha)
	if include_alpha then
		target[1] = source[1]
	end

	target[2] = source[2]
	target[3] = source[3]
	target[4] = source[4]
end

VersusTabUI._show_profile_by_peer_id = function (self, peer_id)
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

VersusTabUI._muted_peer_id = function (self, peer_id)
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

VersusTabUI._ignore_voice_message_from_peer_id = function (self, peer_id)
	if IS_XB1 then
		if Managers.voice_chat then
			Managers.voice_chat:mute_peer(peer_id)
		end
	else
		self._voip:mute_member(peer_id)
	end
end

VersusTabUI._remove_ignore_voice_message_from_peer_id = function (self, peer_id)
	if IS_XB1 then
		if Managers.voice_chat then
			Managers.voice_chat:unmute_peer(peer_id)
		end
	else
		self._voip:unmute_member(peer_id)
	end
end

VersusTabUI._ignoring_chat_peer_id = function (self, peer_id)
	if IS_WINDOWS then
		local chat_gui = Managers.chat.chat_gui

		return chat_gui:ignoring_peer_id(peer_id)
	elseif IS_XB1 then
		return Managers.chat:ignoring_peer_id(peer_id)
	end
end

VersusTabUI._ignore_chat_message_from_peer_id = function (self, peer_id)
	if IS_WINDOWS then
		local chat_gui = Managers.chat.chat_gui

		chat_gui:ignore_peer_id(peer_id)
	elseif IS_XB1 then
		Managers.chat:ignore_peer_id(peer_id)
	end
end

VersusTabUI._get_opponent_party_id = function (self)
	return self._party_id == 1 and 2 or 1
end

VersusTabUI._remove_ignore_chat_message_from_peer_id = function (self, peer_id)
	if IS_WINDOWS then
		local chat_gui = Managers.chat.chat_gui

		chat_gui:remove_ignore_peer_id(peer_id)
	elseif IS_XB1 then
		Managers.chat:remove_ignore_peer_id(peer_id)
	end
end

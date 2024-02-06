-- chunkname: @scripts/ui/views/ingame_view_layout_logic.lua

IngameViewLayoutLogic = class(IngameViewLayoutLogic)

IngameViewLayoutLogic.init = function (self, ingame_ui_context, params, menu_layouts, full_access_layout)
	self._menu_layouts = menu_layouts
	self._full_access_layout = full_access_layout
	self.ingame_ui = ingame_ui_context.ingame_ui
	self._params = params

	local is_in_inn = ingame_ui_context.is_in_inn

	self.is_server = ingame_ui_context.is_server
	self.layout_list = is_in_inn and menu_layouts.in_menu or menu_layouts.in_game
end

IngameViewLayoutLogic.setup_button_layout = function (self, layout_data)
	local active_button_data = self.active_button_data

	if active_button_data then
		table.clear(active_button_data)
	else
		self.active_button_data = {}
		active_button_data = self.active_button_data
	end

	local params = self._params

	for index, data in ipairs(layout_data) do
		if not data.can_add_function or data.can_add_function(params) then
			local display_name = data.display_name
			local display_name_func = data.display_name_func
			local url = data.url
			local callback = data.callback
			local transition = data.transition
			local transition_state = data.transition_state
			local transition_sub_state = data.transition_sub_state
			local disable_when_matchmaking = data.disable_when_matchmaking
			local disable_when_matchmaking_ready = data.disable_when_matchmaking_ready
			local requires_player_unit = data.requires_player_unit
			local fade = data.fade
			local force_open = data.force_open

			active_button_data[#active_button_data + 1] = {
				display_name = display_name,
				display_name_func = display_name_func,
				url = url,
				callback = callback,
				transition = transition,
				transition_state = transition_state,
				transition_sub_state = transition_sub_state,
				disable_when_matchmaking = disable_when_matchmaking,
				disable_when_matchmaking_ready = disable_when_matchmaking_ready,
				requires_player_unit = requires_player_unit,
				fade = fade,
				force_open = force_open,
			}
		end
	end
end

IngameViewLayoutLogic._update_menu_options = function (self)
	if script_data.pause_menu_full_access then
		if not self.pause_menu_full_access then
			self.pause_menu_full_access = true

			self:setup_button_layout(self._full_access_layout)
		end
	else
		local num_human_players = Managers.player:num_human_players()
		local update_layout = self.pause_menu_full_access or self.num_players ~= num_human_players

		self.pause_menu_full_access = nil

		if update_layout then
			self.num_players = num_human_players

			local layout_list = self.layout_list
			local new_menu_layout
			local level_key = Managers.state.game_mode:level_key()
			local is_offline = Managers.account:offline_mode()

			if script_data.honduras_demo then
				new_menu_layout = layout_list.demo
			elseif level_key == "prologue" then
				new_menu_layout = layout_list.tutorial
			elseif is_offline then
				new_menu_layout = layout_list.offline
			elseif num_human_players == 1 then
				new_menu_layout = layout_list.alone
			elseif self.is_server then
				new_menu_layout = layout_list.host
			else
				new_menu_layout = layout_list.client
			end

			self:setup_button_layout(new_menu_layout)
		end
	end
end

IngameViewLayoutLogic._update_menu_options_enabled_states = function (self)
	local active_button_data = self.active_button_data

	if active_button_data then
		local player_ready_for_game = self.ingame_ui:is_local_player_ready_for_game()
		local is_game_matchmaking = Managers.matchmaking:is_game_matchmaking()
		local is_server = self.is_server
		local player_manager = Managers.player
		local local_player = player_manager:local_player()
		local has_player = local_player and local_player.player_unit ~= nil

		for index, menu_option in ipairs(active_button_data) do
			local disable_when_matchmaking = menu_option.disable_when_matchmaking
			local disable_when_matchmaking_ready = menu_option.disable_when_matchmaking_ready
			local requires_player_unit = menu_option.requires_player_unit
			local transition_not_allowed = player_ready_for_game and disable_when_matchmaking_ready or is_game_matchmaking and disable_when_matchmaking or requires_player_unit and not has_player

			if transition_not_allowed and not menu_option.disabled then
				menu_option.disabled = true
			elseif not transition_not_allowed and menu_option.disabled then
				menu_option.disabled = false
			end
		end
	end
end

IngameViewLayoutLogic.execute_layout_option = function (self, index)
	local active_button_data = self.active_button_data
	local ingame_ui = self.ingame_ui
	local data = active_button_data[index]

	if data then
		local url = data.url

		if url then
			Application.open_url_in_browser(url)
		else
			local callback = data.callback

			if callback then
				callback()
			end

			local transition = data.transition
			local transition_state = data.transition_state
			local transition_sub_state = data.transition_sub_state
			local fade = data.fade
			local force_open = data.force_open
			local transition_params = {
				menu_state_name = transition_state,
				menu_sub_state_name = transition_sub_state,
				force_open = force_open,
			}

			if fade then
				ingame_ui:transition_with_fade(transition, transition_params)
			else
				ingame_ui:handle_transition(transition, transition_params)
			end
		end
	end
end

IngameViewLayoutLogic.update = function (self)
	self:_update_menu_options()
	self:_update_menu_options_enabled_states()
end

IngameViewLayoutLogic.layout_data = function (self)
	return self.active_button_data
end

IngameViewLayoutLogic.destroy = function (self)
	return
end

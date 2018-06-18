local definitions = local_require("scripts/ui/views/friends_ui_component_definitions")
local DO_RELOAD = true
FriendsUIComponent = class(FriendsUIComponent)

FriendsUIComponent.init = function (self, ingame_ui_context)
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._render_settings = {
		snap_pixel_positions = true
	}
	self._network_lobby = ingame_ui_context.network_lobby
	self._invite_cooldown = {}

	self:_create_ui_elements()
end

FriendsUIComponent._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	local widget_definitions = definitions.widget_definitions
	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		if name ~= "friends_button" then
			local widget = UIWidget.init(widget_definition)
			widgets[#widgets + 1] = widget
			widgets_by_name[name] = widget
		end
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name
	self._friends_button_widget = UIWidget.init(definitions.widget_definitions.friends_button)
end

FriendsUIComponent.is_active = function (self)
	return self._active
end

FriendsUIComponent.activate_friends_ui = function (self)
	if PLATFORM == "xb1" and not Managers.account:friends_list_initiated() then
		Managers.account:setup_friendslist()
	end

	self._active = true

	self:_refresh_friends_list()

	self._widgets_by_name.hotspot_area.content.disregard_exit = nil
end

FriendsUIComponent.deactivate_friends_ui = function (self)
	self._active = false
end

FriendsUIComponent._refresh_friends_list = function (self)
	local empty_list = {}
	local widgets_by_name = self._widgets_by_name

	self:_populate_tab(widgets_by_name.online_tab, empty_list)
	self:_populate_tab(widgets_by_name.offline_tab, empty_list)

	local friend_list_limit = definitions.scenegraph_info.friend_list_limit

	Managers.account:get_friends(friend_list_limit, callback(self, "cb_refresh_friends_done"))
end

FriendsUIComponent.join_lobby_data = function (self)
	local join_lobby_data = self._join_lobby_data
	self._join_lobby_data = nil

	return join_lobby_data
end

local EMPTY_TABLE = {}

FriendsUIComponent.cb_refresh_friends_done = function (self, friend_list)
	friend_list = friend_list or EMPTY_TABLE
	local playing_friends = {}
	local online_friends = {}
	local offline_friends = {}

	for id, friend in pairs(friend_list) do
		friend.id = id

		if friend.status == "offline" then
			offline_friends[#offline_friends + 1] = friend
		elseif friend.playing_this_game then
			playing_friends[#playing_friends + 1] = friend
		else
			online_friends[#online_friends + 1] = friend
		end
	end

	local function sort(a, b)
		return a.name < b.name
	end

	table.sort(playing_friends, sort)
	table.sort(online_friends, sort)
	table.sort(offline_friends, sort)

	for i = 1, #online_friends, 1 do
		local friend = online_friends[i]
		playing_friends[#playing_friends + 1] = friend
	end

	local widgets_by_name = self._widgets_by_name

	self:_populate_tab(widgets_by_name.online_tab, playing_friends, true)
	self:_populate_tab(widgets_by_name.offline_tab, offline_friends, false)
end

FriendsUIComponent._button_pressed = function (self, hotspot_content)
	if hotspot_content.on_release then
		hotspot_content.on_release = false

		return true
	end

	return false
end

FriendsUIComponent.update = function (self, dt, input_service)
	if DO_RELOAD then
		DO_RELOAD = false

		self:_create_ui_elements()
	end

	self:_update_invite_cooldown(dt)
	self:_update_animations(dt)
	self:_handle_input(input_service, dt)
	self:_update_active_tab(input_service, dt)
	self:_draw(input_service, dt)
end

FriendsUIComponent._update_invite_cooldown = function (self, dt)
	local invite_cooldown = self._invite_cooldown

	for id, cooldown in pairs(invite_cooldown) do
		cooldown = cooldown - dt

		if cooldown < 0 then
			invite_cooldown[id] = nil
		else
			invite_cooldown[id] = cooldown
		end
	end
end

FriendsUIComponent._update_animations = function (self, dt)
	self:_update_refresh_animations(dt)
end

FriendsUIComponent._update_refresh_animations = function (self, dt)
	local refresh_button = self._widgets_by_name.refresh_button
	local content = refresh_button.content

	if content.animate then
		local start = 0
		local target = math.pi
		local speed = 20
		local rotate_progress = content.rotate_progress or start
		rotate_progress = math.min(rotate_progress + dt * speed, target)

		if rotate_progress == target then
			rotate_progress = start
			content.animate = false
		end

		content.rotate_progress = rotate_progress
		local style = refresh_button.style
		style.button_texture.angle = rotate_progress
		style.button_texture_hover.angle = rotate_progress
	end
end

FriendsUIComponent._handle_input = function (self, input_service, dt)
	local widgets_by_name = self._widgets_by_name
	local active = self._active

	if self:_button_pressed(self._friends_button_widget.content.button_hotspot) then
		if active then
			self:deactivate_friends_ui()
		else
			self:activate_friends_ui()
		end
	end

	if active then
		local hotspot_area_content = widgets_by_name.hotspot_area.content

		if input_service:get("left_press") and (hotspot_area_content.is_hover or self._friends_button_widget.content.button_hotspot.is_hover) then
			hotspot_area_content.disregard_exit = true
		end

		if input_service:get("left_release") then
			if hotspot_area_content.disregard_exit or hotspot_area_content.is_hover or self._friends_button_widget.content.button_hotspot.is_hover then
				hotspot_area_content.disregard_exit = nil
			else
				self:deactivate_friends_ui()
			end
		end

		if self:_button_pressed(widgets_by_name.exit_button.content) then
			self:deactivate_friends_ui()
		end

		if self:_button_pressed(widgets_by_name.refresh_button.content) then
			self:_animate_refresh_button(widgets_by_name.refresh_button)
			self:_refresh_friends_list()
		end

		if self:_button_pressed(widgets_by_name.online_tab.content.button_hotspot) then
			self:_tab_pressed(widgets_by_name.online_tab)
		end

		if self:_button_pressed(widgets_by_name.offline_tab.content.button_hotspot) then
			self:_tab_pressed(widgets_by_name.offline_tab)
		end
	end
end

FriendsUIComponent._update_active_tab = function (self, input_service, dt)
	local active_tab = self._active_tab

	if not active_tab then
		return
	end

	local tabs_size = definitions.scenegraph_info.tabs_size
	local tabs_active_size = definitions.scenegraph_info.tabs_active_size
	local list_style = active_tab.style.list_style
	local size_y = list_style.list_member_offset[2] * list_style.num_draws - (tabs_active_size[2] - tabs_size[2] - 10)
	local list_scenegraph_id = list_style.scenegraph_id
	local scenegraph_node = self._ui_scenegraph[list_scenegraph_id]
	local scenegraph_pos = scenegraph_node.position
	local value = 1 - active_tab.content.scrollbar.scroll_value
	scenegraph_pos[2] = -tabs_size[2] + size_y * value

	self:_update_list(active_tab)
	self:_handle_list_input(active_tab)
end

FriendsUIComponent._animate_refresh_button = function (self, widget)
	widget.content.animate = true
end

local _update_list_temp_pos_table = {
	0,
	0
}

FriendsUIComponent._update_list = function (self, active_tab)
	local list_style = active_tab.style.list_style
	local mask_pos, mask_size = self:_get_mask_position_and_size(active_tab)
	local list_pos = UISceneGraph.get_world_position(self._ui_scenegraph, list_style.scenegraph_id)
	local list_size = UISceneGraph.get_size(self._ui_scenegraph, list_style.scenegraph_id)
	local item_contents = active_tab.content.list_content
	local item_styles = list_style.item_styles
	local num_draws = list_style.num_draws

	for i = 1, num_draws, 1 do
		local content = item_contents[i]
		local style = item_styles[i]
		local size = style.size
		local offset = style.list_member_offset
		_update_list_temp_pos_table[1] = list_pos[1] + offset[1] * i + size[1] / 2
		_update_list_temp_pos_table[2] = list_pos[2] + list_size[2] + offset[2] * i
		local lower_visible = math.point_is_inside_2d_box(_update_list_temp_pos_table, mask_pos, mask_size)
		_update_list_temp_pos_table[2] = _update_list_temp_pos_table[2] + size[2] / 2
		local middle_visible = math.point_is_inside_2d_box(_update_list_temp_pos_table, mask_pos, mask_size)
		_update_list_temp_pos_table[2] = _update_list_temp_pos_table[2] + size[2] / 2
		local top_visible = math.point_is_inside_2d_box(_update_list_temp_pos_table, mask_pos, mask_size)
		local visible = lower_visible or top_visible
		content.visible = visible
		content.invite_button.visible = visible
		content.profile_button.visible = visible
		content.invite_button.visible = visible
	end
end

FriendsUIComponent._handle_list_input = function (self, active_tab)
	local item_contents = active_tab.content.list_content
	local list_style = active_tab.style.list_style
	local num_draws = list_style.num_draws

	for i = 1, num_draws, 1 do
		local content = item_contents[i]

		if self:_button_pressed(content.invite_button) then
			self:_send_invite(content)
		end

		if self:_button_pressed(content.profile_button) then
			self:_open_player_profile(content)
		end

		if self:_button_pressed(content.join_button) then
			self:_join_player(content)
		end
	end
end

FriendsUIComponent._draw = function (self, input_service, dt)
	local ui_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, self._render_settings)
	UIRenderer.draw_widget(ui_renderer, self._friends_button_widget)

	if self._active then
		local widgets = self._widgets

		for _, widget in ipairs(widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_renderer)
end

FriendsUIComponent._tab_pressed = function (self, widget)
	if self._active_tab == widget then
		self:_deactivate_active_tab()
	else
		if self._active_tab then
			self:_deactivate_active_tab()
		end

		self:_activate_tab(widget)
	end
end

FriendsUIComponent._activate_tab = function (self, widget)
	self._active_tab = widget
	local scenegraph_id = widget.scenegraph_id
	local scenegraph_node = self._ui_scenegraph[scenegraph_id]
	local tabs_active_size = definitions.scenegraph_info.tabs_active_size
	scenegraph_node.size[1] = tabs_active_size[1]
	scenegraph_node.size[2] = tabs_active_size[2]
	scenegraph_node.position[2] = -tabs_active_size[2]
	widget.content.active = true
	widget.content.list_content.active = true
	local drop_down_arrow = widget.style.drop_down_arrow
	drop_down_arrow.angle = math.pi
	local tabs_size = definitions.scenegraph_info.tabs_size
	widget.style.hotspot.offset[2] = tabs_active_size[2] - tabs_size[2]

	if widget.content.scrollbar.percentage < 1 then
		widget.content.scrollbar.active = true
	else
		widget.content.scrollbar.active = false
	end
end

FriendsUIComponent._deactivate_active_tab = function (self)
	local widget = self._active_tab
	self._active_tab = nil
	local scenegraph_id = widget.scenegraph_id
	local scenegraph_node = self._ui_scenegraph[scenegraph_id]
	local tabs_size = definitions.scenegraph_info.tabs_size
	scenegraph_node.size[1] = tabs_size[1]
	scenegraph_node.size[2] = tabs_size[2]
	scenegraph_node.position[2] = -tabs_size[2]
	widget.content.active = false
	widget.content.list_content.active = false
	widget.content.scrollbar.active = false
	local drop_down_arrow = widget.style.drop_down_arrow
	drop_down_arrow.angle = 0
	widget.style.hotspot.offset[2] = 0
end

FriendsUIComponent._populate_tab = function (self, widget, list, allow_invite)
	local content = widget.content
	local style = widget.style.list_style
	local list_content = content.list_content
	local item_styles = style.item_styles
	local allowed_to_initiate_join_lobby = Managers.matchmaking:allowed_to_initiate_join_lobby()
	local num_friends = #list

	for i = 1, num_friends, 1 do
		local friend = list[i]
		local content = list_content[i]
		content.name = UIRenderer.crop_text_width(self._ui_top_renderer, friend.name, 200, item_styles[i].name)
		content.id = friend.id
		local can_join = false
		local playing_this_game = friend.playing_this_game

		if allowed_to_initiate_join_lobby and playing_this_game then
			local playing_game = friend.playing_game

			if playing_game and playing_game.lobby then
				can_join = true
			end
		end

		content.invite_button.allow_invite = allow_invite
		content.join_button.allow_join = can_join

		if can_join then
			content.playing_game_info = friend.playing_game
		end

		local style = item_styles[i]

		if playing_this_game then
			style.name.text_color = Colors.get_color_table_with_alpha("online_green", 255)
		elseif friend.status ~= "offline" then
			style.name.text_color = Colors.get_color_table_with_alpha("white", 255)
		else
			style.name.text_color = Colors.get_color_table_with_alpha("font_default", 255)
		end
	end

	content.real_text = string.format("%s (%s)", content.text, tostring(num_friends))
	style.num_draws = num_friends

	self:_setup_tab_scrollbar(widget)
end

FriendsUIComponent._setup_tab_scrollbar = function (self, widget)
	local tabs_size = definitions.scenegraph_info.tabs_size
	local tabs_active_size = definitions.scenegraph_info.tabs_active_size
	local focus_size = tabs_active_size[2] - tabs_size[2]
	local list_style = widget.style.list_style
	local list_member_offset_y = list_style.list_member_offset[2]
	local num_draws = list_style.num_draws
	local total_size = nil

	if num_draws == 0 then
		total_size = list_member_offset_y
	else
		total_size = list_member_offset_y * num_draws
	end

	local percentage = focus_size / total_size
	local scrollbar_content = widget.content.scrollbar

	if percentage < 1 then
		scrollbar_content.percentage = percentage
		scrollbar_content.scroll_value = 1
		scrollbar_content.scroll_amount = list_member_offset_y / total_size
	else
		scrollbar_content.scroll_value = 1
	end
end

local _get_mask_size_temp = {
	0,
	0
}
local _get_mask_position_temp = {
	0,
	0,
	0
}

FriendsUIComponent._get_mask_position_and_size = function (self, widget)
	local mask_style = widget.style.mask
	local size = mask_style.size
	_get_mask_size_temp[1] = size[1]
	_get_mask_size_temp[2] = size[2]
	local scenegraph_pos = UISceneGraph.get_world_position(self._ui_scenegraph, widget.scenegraph_id)
	local offset = mask_style.offset
	_get_mask_position_temp[1] = scenegraph_pos[1] + offset[1]
	_get_mask_position_temp[2] = scenegraph_pos[2] + offset[2]
	_get_mask_position_temp[3] = scenegraph_pos[3] + offset[3]

	return _get_mask_position_temp, _get_mask_size_temp
end

FriendsUIComponent._send_invite = function (self, content)
	if self._invite_cooldown[content.id] then
		return
	end

	local id = content.id
	local invite_target = self._network_lobby:invite_target()

	Managers.account:send_session_invitation(id, invite_target)

	self._invite_cooldown[id] = 5
end

FriendsUIComponent._open_player_profile = function (self, content)
	local id = content.id

	Managers.account:show_player_profile(id)
end

FriendsUIComponent._join_player = function (self, content)
	local playing_game_info = content.playing_game_info
	local lobby_id = playing_game_info.lobby

	if lobby_id then
		local lobby_data = LobbyInternal.get_lobby_data_from_id(lobby_id)
		lobby_data.id = lobby_id
		self._join_lobby_data = lobby_data
	end
end

return

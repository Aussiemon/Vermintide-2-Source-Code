local definitions = local_require("scripts/ui/views/friends_ui_component_definitions")
local DO_RELOAD = true
FriendsUIComponent = class(FriendsUIComponent)
FriendsUIComponent.init = function (self, ingame_ui_context)
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._render_settings = {
		snap_pixel_positions = true
	}
	self._network_lobby = ingame_ui_context.network_lobby
	self._invite_cooldown = {}

	self._create_ui_elements(self)

	return 
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

	return 
end
FriendsUIComponent._toggle_active = function (self)
	if self._active then
		self.deactivate_friends_ui(self)
	else
		self.activate_friends_ui(self)
	end

	return 
end
FriendsUIComponent.activate_friends_ui = function (self)
	self._active = true

	self._refresh_friends_list(self)

	return 
end
FriendsUIComponent.deactivate_friends_ui = function (self)
	self._active = false

	return 
end
FriendsUIComponent._refresh_friends_list = function (self)
	local friend_list_limit = definitions.scenegraph_info.friend_list_limit

	Managers.account:get_friends(friend_list_limit, callback(self, "cb_refresh_friends_done"))

	return 
end
local EMPTY_TABLE = {}
FriendsUIComponent.cb_refresh_friends_done = function (self, friend_list)
	friend_list = friend_list or EMPTY_TABLE
	local online_friends = {}
	local offline_friends = {}

	for id, friend in pairs(friend_list) do
		friend.id = id

		if friend.status == "offline" then
			offline_friends[#offline_friends + 1] = friend
		else
			online_friends[#online_friends + 1] = friend
		end
	end

	local widgets_by_name = self._widgets_by_name

	self._populate_tab(self, widgets_by_name.online_tab, online_friends, true)
	self._populate_tab(self, widgets_by_name.offline_tab, offline_friends, false)

	return 
end
FriendsUIComponent._button_pressed = function (self, hotspot_content)
	if hotspot_content.on_release then
		hotspot_content.on_release = false

		return true
	end

	return false
end
FriendsUIComponent.update = function (self, input_service, dt)
	if DO_RELOAD then
		DO_RELOAD = false

		self._create_ui_elements(self)
	end

	self._update_invite_cooldown(self, dt)
	self._handle_input(self, input_service, dt)
	self._update_active_tab(self, input_service, dt)
	self._draw(self, input_service, dt)

	return 
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

	return 
end
FriendsUIComponent._handle_input = function (self, input_service, dt)
	local widgets_by_name = self._widgets_by_name

	if self._button_pressed(self, self._friends_button_widget.content.button_hotspot) then
		self._toggle_active(self)
	end

	if self._button_pressed(self, widgets_by_name.exit_button.content) then
		self.deactivate_friends_ui(self)
	end

	if self._button_pressed(self, widgets_by_name.refresh_button.content) then
		self._refresh_friends_list(self)
	end

	if self._button_pressed(self, widgets_by_name.online_tab.content.button_hotspot) then
		self._tab_pressed(self, widgets_by_name.online_tab)
	end

	if self._button_pressed(self, widgets_by_name.offline_tab.content.button_hotspot) then
		self._tab_pressed(self, widgets_by_name.offline_tab)
	end

	return 
end
FriendsUIComponent._update_active_tab = function (self, input_service, dt)
	local active_tab = self._active_tab

	if not active_tab then
		return 
	end

	local tabs_size = definitions.scenegraph_info.tabs_size
	local tabs_active_size = definitions.scenegraph_info.tabs_active_size
	local list_style = active_tab.style.list_style
	local size_y = list_style.list_member_offset[2]*list_style.num_draws - tabs_active_size[2] - tabs_size[2] - 10
	local list_scenegraph_id = list_style.scenegraph_id
	local scenegraph_node = self._ui_scenegraph[list_scenegraph_id]
	local scenegraph_pos = scenegraph_node.position
	local value = active_tab.content.scrollbar.scroll_value - 1
	scenegraph_pos[2] = -tabs_size[2] + size_y*value

	self._update_list(self, active_tab)
	self._handle_list_input(self, active_tab)

	return 
end
local _update_list_temp_pos_table = {
	x = 0,
	y = 0
}
FriendsUIComponent._update_list = function (self, active_tab)
	local list_style = active_tab.style.list_style
	local mask_pos, mask_size = self._get_mask_position_and_size(self, active_tab)
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
		_update_list_temp_pos_table.x = list_pos[1] + offset[1]*i + size[1]/2
		_update_list_temp_pos_table.y = list_pos[2] + list_size[2] + offset[2]*i
		local lower_visible = math.point_is_inside_2d_box(_update_list_temp_pos_table, mask_pos, mask_size)
		_update_list_temp_pos_table.y = _update_list_temp_pos_table.y + size[2]/2
		local middle_visible = math.point_is_inside_2d_box(_update_list_temp_pos_table, mask_pos, mask_size)
		_update_list_temp_pos_table.y = _update_list_temp_pos_table.y + size[2]/2
		local top_visible = math.point_is_inside_2d_box(_update_list_temp_pos_table, mask_pos, mask_size)
		local visible = lower_visible or top_visible
		content.visible = visible
		content.invite_button.visible = visible
		content.profile_button.visible = visible
	end

	return 
end
FriendsUIComponent._handle_list_input = function (self, active_tab)
	local item_contents = active_tab.content.list_content
	local list_style = active_tab.style.list_style
	local num_draws = list_style.num_draws

	for i = 1, num_draws, 1 do
		local content = item_contents[i]

		if self._button_pressed(self, content.invite_button) then
			self._send_invite(self, content)
		end

		if self._button_pressed(self, content.profile_button) then
			self._open_player_profile(self, content)
		end
	end

	return 
end
FriendsUIComponent._draw = function (self, input_service, dt)
	local ui_renderer = self._ui_renderer
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

	return 
end
FriendsUIComponent._tab_pressed = function (self, widget)
	if self._active_tab == widget then
		self._deactivate_active_tab(self)
	else
		if self._active_tab then
			self._deactivate_active_tab(self)
		end

		self._activate_tab(self, widget)
	end

	return 
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
	drop_down_arrow.angle = 0
	local tabs_size = definitions.scenegraph_info.tabs_size
	widget.style.hotspot.offset[2] = tabs_active_size[2] - tabs_size[2]

	if widget.content.scrollbar.percentage < 1 then
		widget.content.scrollbar.active = true
	else
		widget.content.scrollbar.active = false
	end

	return 
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
	drop_down_arrow.angle = math.pi*1.5
	widget.style.hotspot.offset[2] = 0

	return 
end
FriendsUIComponent._populate_tab = function (self, widget, list, allow_invite)
	local content = widget.content
	local style = widget.style.list_style
	local list_content = content.list_content
	local item_styles = style.item_styles

	local function sort(a, b)
		return a.name < b.name
	end

	table.sort(list, sort)

	local num_friends = #list

	for i = 1, num_friends, 1 do
		local friend = list[i]
		local content = list_content[i]
		content.name = UIRenderer.crop_text_width(self._ui_renderer, friend.name, 200, item_styles[i].name)
		content.id = friend.id
		content.invite_button.allow_invite = allow_invite
	end

	content.real_text = string.format("%s (%s)", content.text, tostring(num_friends))
	style.num_draws = num_friends

	self._setup_tab_scrollbar(self, widget)

	return 
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
		total_size = list_member_offset_y*num_draws
	end

	local percentage = focus_size/total_size
	local scrollbar_content = widget.content.scrollbar

	if percentage < 1 then
		scrollbar_content.percentage = percentage
		scrollbar_content.scroll_value = 1
		scrollbar_content.scroll_amount = list_member_offset_y/total_size
	else
		scrollbar_content.scroll_value = 1
	end

	return 
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

	return 
end
FriendsUIComponent._open_player_profile = function (self, content)
	local id = content.id

	Managers.account:show_player_profile(id)

	return 
end

return 

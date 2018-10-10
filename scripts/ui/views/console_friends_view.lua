local definitions = local_require("scripts/ui/views/console_friends_view_definitions")
local scenegraph_definition = definitions.scenegraph_definition
local widget_definitions = definitions.widget_definitions
local generic_input_actions = definitions.generic_input_actions
local entry_definitions = definitions.entry_definitions
local DO_RELOAD = true
local INVITE_COOLDOWN = 5
ConsoleFriendsView = class(ConsoleFriendsView)

ConsoleFriendsView.init = function (self, ingame_ui_context)
	self._ingame_ui_context = ingame_ui_context
	self._ingame_ui = ingame_ui_context.ingame_ui
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._render_settings = {
		snap_pixel_positions = true
	}
	self._network_lobby = ingame_ui_context.network_lobby
	self._invite_cooldown = {}
	self._cursor_position = 1

	if GLOBAL_MUSIC_WORLD then
		self._wwise_world = MUSIC_WWISE_WORLD
	else
		local world = ingame_ui_context.world_manager:world("music_world")
		self._wwise_world = Managers.world:wwise_world(world)
	end

	self:_setup_input(ingame_ui_context)
	self:_create_ui_elements()

	self._menu_input_description = MenuInputDescriptionUI:new(ingame_ui_context, self._ui_top_renderer, self:input_service(), 7, 900, generic_input_actions.default, true)

	self._menu_input_description:set_input_description(nil)

	self._current_input_desc = nil
end

ConsoleFriendsView.on_enter = function (self)
	self._input_manager:block_device_except_service("console_friends_view", "keyboard", 1)
	self._input_manager:block_device_except_service("console_friends_view", "mouse", 1)
	self._input_manager:block_device_except_service("console_friends_view", "gamepad", 1)

	local world = Managers.world:has_world("character_preview") and Managers.world:world("character_preview")
	local shading_env = world and World.get_data(world, "shading_environment")

	if shading_env then
		World.set_data(world, "avoid_blend", true)
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", 1)
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", 0.7)
		ShadingEnvironment.apply(shading_env)
	end

	local world = Managers.world:world("top_ingame_view")

	World.set_data(world, "avoid_blend", false)

	self._active = true

	if PLATFORM == "xb1" and not Managers.account:friends_list_initiated() then
		Managers.account:setup_friendslist()
	end

	self:_create_ui_elements()
	self:_setup_party_entries()
	self:_refresh_friends()
end

ConsoleFriendsView._refresh_friends = function (self)
	self._is_refreshing = true

	Managers.account:get_friends(1000, callback(self, "cb_friends_collected"))

	local loading_icon = self._widgets_by_name.loading_icon
	loading_icon.style.loading_icon.color[1] = 255
end

local empty_friend_list = {}

ConsoleFriendsView.cb_friends_collected = function (self, friend_data)
	friend_data = friend_data or empty_friend_list
	self._friend_list_widgets = {}
	local playing_friends = {}
	local online_friends = {}
	local offline_friends = {}

	for id, friend in pairs(friend_data) do
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

	local base_offset = entry_definitions.friend_entry_size[2]
	local offset = -base_offset

	for idx, friend in pairs(playing_friends) do
		self._friend_list_widgets[#self._friend_list_widgets + 1] = UIWidget.init(entry_definitions.create_friend_entry(friend.name, true, offset, friend))
		offset = offset - base_offset
	end

	for idx, friend in pairs(online_friends) do
		self._friend_list_widgets[#self._friend_list_widgets + 1] = UIWidget.init(entry_definitions.create_friend_entry(friend.name, true, offset, friend))
		offset = offset - base_offset
	end

	for idx, friend in pairs(offline_friends) do
		self._friend_list_widgets[#self._friend_list_widgets + 1] = UIWidget.init(entry_definitions.create_friend_entry(friend.name, false, offset, friend))
		offset = offset - base_offset
	end

	print(string.format("Added %s friends", #self._friend_list_widgets))

	local widget = self._widgets_by_name.loading_icon
	self._ui_animations.loading_icon_fade = UIAnimation.init(UIAnimation.function_by_time, widget.style.loading_icon.color, 1, 255, 0, 0.5, math.easeOutCubic)
	self._is_refreshing = false
end

ConsoleFriendsView.on_exit = function (self)
	self._input_manager:device_unblock_all_services("keyboard", 1)
	self._input_manager:device_unblock_all_services("mouse", 1)
	self._input_manager:device_unblock_all_services("gamepad", 1)

	local world = Managers.world:has_world("character_preview") and Managers.world:world("character_preview")

	if world then
		World.set_data(world, "avoid_blend", false)
	end

	self._exiting = nil
	self._active = nil
end

ConsoleFriendsView.exit = function (self)
	local exit_transition = "ingame_menu"

	self._ingame_ui:transition_with_fade(exit_transition)
	WwiseWorld.trigger_event(self._wwise_world, "Play_hud_button_close")

	self._exiting = true
end

ConsoleFriendsView.transitioning = function (self)
	if self._exiting then
		return true
	else
		return not self._active
	end
end

ConsoleFriendsView._setup_input = function (self, ingame_ui_context)
	local input_manager = ingame_ui_context.input_manager

	input_manager:create_input_service("console_friends_view", "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager:map_device_to_service("console_friends_view", "keyboard")
	input_manager:map_device_to_service("console_friends_view", "mouse")
	input_manager:map_device_to_service("console_friends_view", "gamepad")

	self._input_manager = input_manager
end

ConsoleFriendsView._create_ui_elements = function (self)
	UIRenderer.clear_scenegraph_queue(self._ui_top_renderer)

	self._wanted_pos = scenegraph_definition.friends_base.position[2]
	self._current_friend_index = 1
	self._ui_animations = {}
	self._ui_animations = {}
	self._cursor_position = 1
	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name
	local friends_bg = self._widgets_by_name.friends_bg
	friends_bg.style.background.color = {
		255,
		128,
		128,
		128
	}

	self:_setup_party_entries()

	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	DO_RELOAD = false
end

ConsoleFriendsView._sorted_players = function (self)
	local human_and_bot_players = Managers.player:human_players()
	local players = {}

	for peer_id, player in pairs(human_and_bot_players) do
		players[#players + 1] = player
	end

	local function sort_by_profile_index(player_a, player_b)
		local profile_index_a = player_a:profile_index()
		local profile_index_b = player_b:profile_index()

		return profile_index_a < profile_index_b
	end

	table.sort(players, sort_by_profile_index)

	return players
end

ConsoleFriendsView._setup_party_entries = function (self)
	self._party_entries = {}
	local sorted_players = self:_sorted_players()
	local offset = -40

	for idx, player in ipairs(sorted_players) do
		local name = player:name()
		local career = nil

		if player.local_player then
			local career_name = player:career_name()
			career = CareerSettings[career_name]
		else
			local player_unit = player.player_unit

			if Unit.alive(player_unit) then
				local career_ext = ScriptUnit.extension(player_unit, "career_system")
				local career_name = career_ext:career_name()
				career = CareerSettings[career_name]
			end
		end

		self._party_entries[#self._party_entries + 1] = UIWidget.init(entry_definitions.create_party_entry(name, career, offset * idx))
	end

	local empty_entries = 4 - #self._party_entries

	for i = 1, empty_entries, 1 do
		self._party_entries[#self._party_entries + 1] = UIWidget.init(entry_definitions.create_party_entry(nil, nil, offset * (#self._party_entries + 1)))
	end
end

ConsoleFriendsView.update = function (self, dt, t)
	if DO_RELOAD then
		self:_create_ui_elements()
	end

	self:_handle_input(dt, t)
	self:_update_animations(dt, t)
	self:_update_input_descriptions(dt, t)
	self:_draw(dt, t)
end

ConsoleFriendsView._update_input_descriptions = function (self, dt, t)
	local friends_widget = self._friend_list_widgets[self._current_friend_index]

	if friends_widget then
		local friend_widget_content = friends_widget.content
		local friend = friend_widget_content.friend
		local friend_id = friend.xbox_user_id
		local friend_online = friend.status == "online"
		local invite = ((not self._invite_cooldown[friend_id] or self._invite_cooldown[friend_id] < t) and friend_online and "invite") or nil
		local refresh = not self._is_refreshing and "refresh"
		local input = nil

		if invite then
			input = invite

			if refresh then
				input = input .. "_" .. refresh
			end
		elseif refresh then
			input = "refresh"
		end

		if input then
			self._menu_input_description:set_input_description(generic_input_actions[input])
		else
			self._menu_input_description:set_input_description(nil)
		end

		self._current_input_desc = input
	else
		local input = not self._is_refreshing and "only_refresh"

		if self._current_input_desc ~= input then
			local input_actions = input and generic_input_actions[input]

			self._menu_input_description:set_input_description(input_actions)

			self._current_input_desc = input
		end
	end
end

ConsoleFriendsView._handle_input = function (self, dt, t)
	if self._exiting then
		return
	end

	local input_service = self:input_service()
	self._ui_animations = self._ui_animations or {}
	local entry_size_y = entry_definitions.friend_entry_size[2]
	local base_pos_y = scenegraph_definition.friends_base.position[2]
	self._wanted_pos = self._wanted_pos or base_pos_y
	self._current_friend_index = self._current_friend_index or 1
	local old_index = self._current_friend_index
	local hold_down_timer = 0
	local hold_up_timer = 0

	if input_service:get("move_up_hold") then
		hold_up_timer = self._hold_up_timer + dt
	elseif input_service:get("move_down_hold") then
		hold_down_timer = self._hold_down_timer + dt
	end

	self._hold_down_timer = hold_down_timer
	self._hold_up_timer = hold_up_timer
	local num_friends = #self._friend_list_widgets
	local num_visible_friends = definitions.num_visible_friends

	if input_service:get("back", true) then
		self:exit()
	elseif input_service:get("refresh") then
		local friend_widget = self._friend_list_widgets[self._current_friend_index]

		if friend_widget then
			self:_send_invite(friend_widget, t)
		end
	elseif input_service:get("special_1") and not self._is_refreshing then
		self:_refresh_friends()
	elseif input_service:get("confirm_press") then
		local friend_widget = self._friend_list_widgets[self._current_friend_index]

		if friend_widget then
			self:_open_profile(friend_widget)
		end
	elseif input_service:get("move_down") or self._hold_down_timer > 0.5 then
		if self._hold_down_timer > 0.5 then
			self._hold_down_timer = 0.4
		end

		self._current_friend_index = math.clamp(self._current_friend_index + 1, 1, num_friends)
		self._cursor_position = math.clamp(self._cursor_position + 1, 1, math.min(num_visible_friends, num_friends))

		if self._cursor_position == num_visible_friends then
			local old_wanted_pos = self._wanted_pos
			self._wanted_pos = math.clamp(self._wanted_pos + entry_size_y, base_pos_y, num_friends * entry_size_y + entry_size_y)
			self._ui_animations.move = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.friends_base.position, 2, self._ui_scenegraph.friends_base.position[2], self._wanted_pos, 0.3, math.easeOutCubic)

			if self._wanted_pos ~= old_wanted_pos then
				self._cursor_position = math.clamp(self._cursor_position - 1, 1, num_visible_friends)
			end
		end
	elseif input_service:get("move_up") or self._hold_up_timer > 0.5 then
		if self._hold_up_timer > 0.5 then
			self._hold_up_timer = 0.4
		end

		self._current_friend_index = math.clamp(self._current_friend_index - 1, 1, num_friends)
		self._cursor_position = math.clamp(self._cursor_position - 1, 1, math.min(num_visible_friends, num_friends))

		if self._cursor_position <= 2 and num_visible_friends < num_friends then
			local old_wanted_pos = self._wanted_pos
			self._wanted_pos = math.clamp(self._wanted_pos - entry_size_y, base_pos_y, num_friends * entry_size_y + entry_size_y)
			self._ui_animations.move = UIAnimation.init(UIAnimation.function_by_time, self._ui_scenegraph.friends_base.position, 2, self._ui_scenegraph.friends_base.position[2], self._wanted_pos, 0.3, math.easeOutCubic)

			if self._wanted_pos ~= old_wanted_pos then
				self._cursor_position = math.clamp(self._cursor_position + 1, 1, num_visible_friends)
			end
		end
	end

	local old_friend_widget = self._friend_list_widgets[old_index]

	if old_friend_widget then
		old_friend_widget.content.selected = false
	end

	local friend_widget = self._friend_list_widgets[self._current_friend_index]

	if friend_widget then
		friend_widget.content.selected = true
	end
end

ConsoleFriendsView._update_animations = function (self, dt, t)
	local animations = self._ui_animations

	for animation_name, animation in pairs(animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			animations[animation_name] = nil
		end
	end
end

ConsoleFriendsView._draw = function (self, dt, t)
	local ui_scenegraph = self._ui_scenegraph
	local ui_top_renderer = self._ui_top_renderer
	local input_service = self:input_service()
	local gamepad_active = self._input_manager:is_device_active("gamepad")

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self._render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	for _, widget in ipairs(self._party_entries) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	if self._friend_list_widgets then
		local scenegraph_position = table.clone(ui_scenegraph.friends_mask.world_position)
		local friends_mask_scenegraph_start_pos = scenegraph_position[2]
		local mask_start = friends_mask_scenegraph_start_pos + entry_definitions.friend_entry_size[2]
		local mask_end = friends_mask_scenegraph_start_pos - (definitions.num_visible_friends + 1) * entry_definitions.friend_entry_size[2]

		for _, widget in ipairs(self._friend_list_widgets) do
			local widget_position = ui_scenegraph.friends_base.position[2] + widget.offset[2]

			if mask_start >= widget_position and mask_end <= widget_position then
				UIRenderer.draw_widget(ui_top_renderer, widget)
			end
		end
	end

	UIRenderer.end_pass(ui_top_renderer)

	if gamepad_active then
		self._menu_input_description:draw(ui_top_renderer, dt)
	end
end

ConsoleFriendsView.destroy = function (self)
	return
end

ConsoleFriendsView.input_service = function (self)
	return self._input_manager:get_service("console_friends_view")
end

ConsoleFriendsView._open_profile = function (self, widget)
	local content = widget.content
	local id = content.friend.id

	Managers.account:show_player_profile(id)
end

ConsoleFriendsView._send_invite = function (self, widget, t)
	local content = widget.content
	local friend_id = content.friend.id
	local cooldown = self._invite_cooldown[friend_id]

	if self._invite_cooldown[friend_id] and t < self._invite_cooldown[friend_id] then
		return
	end

	self._network_lobby = self._ingame_ui_context.network_lobby
	local invite_target = self._network_lobby:invite_target()

	Managers.account:send_session_invitation(friend_id, invite_target)

	self._invite_cooldown[friend_id] = t + INVITE_COOLDOWN
	self._ui_animations["fade_invite_" .. friend_id] = UIAnimation.init(UIAnimation.function_by_time, widget.style.invite_texture.color, 1, 255, 0, 1, math.easeInCubic)
	self._ui_animations["move_invite_" .. friend_id] = UIAnimation.init(UIAnimation.function_by_time, widget.style.invite_texture.offset, 1, 40, 70, 1, math.easeInCubic)
end

ConsoleFriendsView.cleanup_popups = function (self)
	return
end

return

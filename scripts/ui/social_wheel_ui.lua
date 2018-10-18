require("scripts/ui/social_wheel_ui_settings")

local definitions = local_require("scripts/ui/social_wheel_ui_definitions")
local scenegraph_definition = definitions.scenegraph_definition
SocialWheelUI = class(SocialWheelUI)
local RPCS = {
	"rpc_social_wheel_event"
}
local STOP_LERP_TIME = 0.125
local STOP_LERP_TIME_CONTROLLER = 0.25
local START_LERP_TIME = 0.01
local START_LERP_TIME_CONTROLLER = 0.125
local MAX_FREE_EVENTS = 5
local EVENT_REFRESH_RATE = 4
local ANIMATION_TIMES = {
	OPEN = {
		MOVE_Y = 1.5,
		SIZE = 1.5,
		MOVE_X = 1.5,
		ALPHA = 0.45
	},
	CLOSE = {
		MOVE_Y = 0.2,
		SIZE = 0.25,
		MOVE_X = 0.2,
		ALPHA = 0.1
	}
}

SocialWheelUI.init = function (self, ingame_ui_context)
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._render_settings = {
		alpha_multiplier = 0
	}
	self._is_visible = true
	self._state = "update_closed"
	self._states = {
		update_closed = true,
		update_open = true
	}
	self._ingame_ui_context = ingame_ui_context
	self._peer_id = ingame_ui_context.peer_id
	self._player = ingame_ui_context.player
	self._wwise_world = ingame_ui_context.wwise_world

	if PLATFORM ~= "win32" then
		self._default_social_wheel_category = (ingame_ui_context.is_in_inn and "general_inn") or "general"
	end

	self._current_context = nil
	self._active_context = nil
	self._num_free_events = MAX_FREE_EVENTS
	self._last_update_t = 0

	self:_create_ui_elements()
	self:_register_rpcs()
end

SocialWheelUI._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._animations = {}
	self._animation_callbacks = {}
	self._selection_widgets = {}
	self._social_event_widgets = {}
	self._queued_social_wheel_events = {}
	self._event_index = 0
	self._select_timer = 0
	self._selected_widget = nil

	local function get_active_context_func()
		return self._active_context
	end

	for category_name, category_settings in pairs(SocialWheelSettings) do
		local num_category_settings = #category_settings
		local category_widgets = Script.new_array(num_category_settings)
		self._selection_widgets[category_name] = category_widgets

		for i = 1, num_category_settings, 1 do
			local widget = definitions.create_social_widget(category_settings[i], self:_widget_angle(category_settings.angle, num_category_settings, i), category_settings, get_active_context_func)
			category_widgets[i] = UIWidget.init(widget)
		end
	end

	self._arrow_widget = UIWidget.init(definitions.arrow_widget)
	self._bg_widget = UIWidget.init(definitions.create_bg_widget())

	UIRenderer.clear_scenegraph_queue(self._ui_top_renderer)
end

SocialWheelUI._register_rpcs = function (self)
	local ingame_ui_context = self._ingame_ui_context
	local network_event_delegate = ingame_ui_context.network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))
end

SocialWheelUI._unregister_rpcs = function (self)
	local ingame_ui_context = self._ingame_ui_context
	local network_event_delegate = ingame_ui_context.network_event_delegate

	network_event_delegate:unregister(self)
end

SocialWheelUI.destroy = function (self)
	self:_unregister_rpcs()
end

SocialWheelUI._widget_angle = function (self, total_angle, num_elements, i)
	local pi = math.pi
	local segment = total_angle / num_elements
	local radial_offset = (pi * 0.5 + pi) - total_angle * 0.5 + segment * 0.5
	local widget_angle = -radial_offset - (i - 1) * segment

	return widget_angle
end

SocialWheelUI._select_widget = function (self, total_angle, num_elements, angle)
	local pi = math.pi
	local segment = total_angle / num_elements
	local radial_offset = (pi * 0.5 + pi) - total_angle * 0.5
	local angle_offset = (-angle - radial_offset) % (2 * pi)
	local selected_index = math.floor(angle_offset / segment) + 1

	if selected_index > 0 and selected_index <= num_elements then
		return selected_index
	end
end

local GARBAGE = {
	0,
	0,
	0
}

SocialWheelUI._add_social_wheel_event = function (self, player, social_wheel_event, target_unit, play_notification_sound)
	local social_wheel_event_settings = SocialWheelSettingsLookup[social_wheel_event]
	local text = social_wheel_event_settings.event_text
	local text_func = social_wheel_event_settings.event_text_func
	local event_text = text
	local localization_parameters = nil

	if text_func then
		event_text, localization_parameters = text_func(target_unit, social_wheel_event_settings)
	end

	if event_text then
		if PLATFORM == "win32" then
			if self._num_free_events >= 1 then
				local localize = true
				local localize_parameters = true

				Managers.chat:send_chat_message(1, player:local_player_id(), event_text, localize, localization_parameters, localize_parameters)
			else
				local error_message = Localize("social_wheel_too_many_messages_warning")

				Managers.chat:add_local_system_message(1, error_message, true)
			end
		else
			local is_local_player = player.peer_id == Network.peer_id()
			local player_unit = player.player_unit

			if Unit.alive(player_unit) then
				local career_ext = ScriptUnit.extension(player_unit, "career_system")
				local career_name = career_ext:career_name()
				local career_settings = CareerSettings[career_name]
				local widget = UIWidget.init(definitions.create_social_text_event(social_wheel_event_settings, career_settings.portrait_image, event_text, is_local_player))

				if #self._social_event_widgets < 6 then
					self:_add_social_wheel_event_animation(widget)
				else
					self._queued_social_wheel_events[#self._queued_social_wheel_events + 1] = widget
				end
			end
		end

		if play_notification_sound then
			self:_play_sound("Play_hud_socialwheel_notification")
		end
	end
end

SocialWheelUI._add_social_wheel_event_animation = function (self, widget, is_local_player)
	local widget_content = widget.content
	local is_local_player = widget_content.is_local_player
	self._social_event_widgets[#self._social_event_widgets + 1] = widget
	self._event_index = self._event_index + 1
	local event_index = self._event_index
	self._animations["social_event_" .. event_index] = UIAnimation.init(UIAnimation.function_by_time, widget.offset, 1, 500, -60, 0.25, math.easeOutCubic)

	self._animation_callbacks["social_event_" .. event_index] = function ()
		local color = (is_local_player and Colors.get_color_table_with_alpha("medium_purple", 255)) or Colors.get_color_table_with_alpha("light_sky_blue", 255)
		self._animations["social_event_color_" .. event_index] = UIAnimation.init(UIAnimation.linear_scale_color, widget.style.text.text_color, 255, 255, 255, color[2], color[3], color[4], 2)
		self._animations["timer_" .. event_index] = UIAnimation.init(UIAnimation.function_by_time, GARBAGE, 1, 0, 0, 5, math.easeInCubic)

		self._animation_callbacks["timer_" .. event_index] = function ()
			self._animations["social_event_alpha_" .. event_index] = UIAnimation.init(UIAnimation.function_by_time, widget.style.text.text_color, 1, 255, 0, 1, math.easeInCubic)
			self._animations["social_event_texture_alpha_" .. event_index] = UIAnimation.init(UIAnimation.function_by_time, widget.style.texture.color, 1, 255, 0, 1, math.easeInCubic)

			self._animation_callbacks["social_event_alpha_" .. event_index] = function ()
				self._animations["spacing_" .. event_index] = UIAnimation.init(UIAnimation.function_by_time, widget.content, "spacing", widget.content.spacing, 0, 0.5, math.easeOutCubic)

				self._animation_callbacks["spacing_" .. event_index] = function ()
					table.remove(self._social_event_widgets, 1)

					if #self._social_event_widgets < 6 then
						local new_social_wheel_event = self._queued_social_wheel_events[1]

						if new_social_wheel_event then
							table.remove(self._queued_social_wheel_events, 1)
							self:_add_social_wheel_event_animation(new_social_wheel_event)
						end
					end
				end
			end
		end
	end
end

SocialWheelUI.rpc_social_wheel_event = function (self, sender, peer_id, social_wheel_event_id, target_unit_id)
	if PLATFORM == "xb1" and Managers.chat:ignoring_peer_id(peer_id) then
		return
	end

	local player = Managers.player:player_from_peer_id(peer_id)

	if player then
		local target_unit = Managers.state.unit_storage:unit(target_unit_id)

		if not target_unit or Unit.alive(target_unit) then
			local social_wheel_event = NetworkLookup.social_wheel_events[social_wheel_event_id]

			self:_add_social_wheel_event(player, social_wheel_event, target_unit, true)

			local network_manager = Managers.state.network

			if network_manager.is_server then
				network_manager.network_transmit:send_rpc_clients_except("rpc_social_wheel_event", sender, peer_id, social_wheel_event_id)
			end
		end
	end
end

local DO_RELOAD = true

SocialWheelUI.update = function (self, dt, t)
	if DO_RELOAD then
		self:_create_ui_elements()

		DO_RELOAD = false
	end

	if self._num_free_events < MAX_FREE_EVENTS then
		local free_events_to_add = (t - self._last_update_t) / EVENT_REFRESH_RATE
		self._num_free_events = math.min(self._num_free_events + free_events_to_add, MAX_FREE_EVENTS)
	end

	self:_update_animations(dt, t)
	self:_update_input(dt, t)
	self:_draw(dt, t)

	self._last_update_t = t
end

SocialWheelUI._update_animations = function (self, dt)
	local animations = self._animations
	local animation_callbacks = self._animation_callbacks

	for anmation_name, anmation in pairs(animations) do
		UIAnimation.update(anmation, dt)

		if UIAnimation.completed(anmation) then
			animations[anmation_name] = nil

			if animation_callbacks[anmation_name] then
				animation_callbacks[anmation_name]()

				animation_callbacks[anmation_name] = nil
			end
		end
	end
end

SocialWheelUI._update_input = function (self, dt, t)
	local input_service = Managers.input:get_service("Player")

	self[self._state](self, dt, t, input_service)

	self.previous_ping_held = input_service:get("ping_hold")
	self.previous_social_wheel_only_held = input_service:get("social_wheel_only_hold")
end

SocialWheelUI._draw = function (self, dt, t)
	if not self._is_visible then
		return
	end

	local ui_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = Managers.input:get_service("ingame_menu")
	local selection_widgets = self._current_selection_widgets

	if selection_widgets then
		local render_settings = self._render_settings

		UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

		local num_selection_widgets = #selection_widgets

		for i = 1, num_selection_widgets, 1 do
			local widget = selection_widgets[i]

			UIRenderer.draw_widget(ui_renderer, widget)
		end

		UIRenderer.draw_widget(ui_renderer, self._arrow_widget)

		if not self._current_selection_widget_settings.individual_bg then
			UIRenderer.draw_widget(ui_renderer, self._bg_widget)
		end

		UIRenderer.end_pass(ui_renderer)
	end

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)

	if self._selected_widget then
		UIRenderer.draw_widget(ui_renderer, self._selected_widget)
	end

	local offset = 0
	local social_event_widgets = self._social_event_widgets
	local num_social_event_widgets = #social_event_widgets

	for i = 1, num_social_event_widgets, 1 do
		local widget = social_event_widgets[i]
		local widget_offset = widget.offset
		widget_offset[2] = offset

		UIRenderer.draw_widget(ui_renderer, widget)

		local widget_content = widget.content
		offset = offset - widget_content.spacing
	end

	UIRenderer.end_pass(ui_renderer)
end

SocialWheelUI.set_visible = function (self, visible)
	self._is_visible = visible
end

SocialWheelUI._execute_selection = function (self)
	local current_index = self._current_index

	if current_index and self._num_free_events >= 1 then
		local current_selection_widgets = self._current_selection_widgets
		local widget = current_selection_widgets[current_index]
		local widget_content = widget.content
		local settings = widget_content.settings
		local func = settings.execute_func

		if func then
			local context = self._active_context
			local player = self._player

			func(settings.data, context.unit, player, self._current_selection_widget_settings)
		end

		if PLATFORM == "win32" then
			self._num_free_events = self._num_free_events - 1
		end
	end
end

SocialWheelUI._set_player_input_scale = function (self, scale, lerp_time)
	local player = self._player
	local player_unit = player.player_unit

	if Unit.alive(player_unit) then
		local input_extension = ScriptUnit.extension(player_unit, "input_system")

		input_extension:set_input_key_scale("look", scale, lerp_time)
		input_extension:set_input_key_scale("look_controller", scale, lerp_time)
		input_extension:set_input_key_scale("look_controller_zoom", scale, lerp_time)
		input_extension:set_input_key_scale("look_controller_3p", scale, lerp_time)
		input_extension:set_input_key_scale("look_controller_ranged", scale, lerp_time)
		input_extension:set_input_key_scale("look_controller_melee", scale, lerp_time)
	end
end

SocialWheelUI._ping_attempt = function (self, target_unit)
	local player = self._player
	local player_unit = player.player_unit

	if Unit.alive(player_unit) and Unit.alive(target_unit) then
		local game_time = Managers.time:time("game")
		local context_aware_ping_extension = ScriptUnit.extension(player_unit, "ping_system")

		context_aware_ping_extension:ping_attempt(player_unit, target_unit, game_time)
	end
end

SocialWheelUI._play_sound = function (self, sound_event)
	WwiseWorld.trigger_event(self._wwise_world, sound_event)
end

SocialWheelUI._change_state = function (self, new_state)
	fassert(self._states[new_state], "[SocialWheelUI:_change_state] There is no state called %s", tostring(new_state))

	self._state = new_state
end

SocialWheelUI.update_closed = function (self, dt, t, input_service)
	local player = self._player
	local player_unit = player.player_unit

	if Unit.alive(player_unit) then
		local context_aware_ping_extension = ScriptUnit.extension(player_unit, "ping_system")
		local current_context = context_aware_ping_extension:social_wheel_context()

		self:_set_current_context(current_context)

		local game_t = Managers.time:time("game")

		if current_context and current_context.min_t < game_t then
			self:_open_menu(dt, t, input_service)
			self:_set_pulsing(current_context, true)
		elseif current_context then
			self:_update_pointer(input_service, false, t)
		else
			local screen_center = Vector3(RESOLUTION_LOOKUP.res_w / 2, RESOLUTION_LOOKUP.res_h / 2, 0)
			local arrow_widget = self._arrow_widget
			local arrow_content = arrow_widget.content

			arrow_content.pointing_point:store(screen_center)
		end
	end
end

SocialWheelUI._set_pulsing = function (self, context, enable)
	local unit = context.unit

	if Unit.alive(unit) then
		if enable then
			local id = Managers.state.entity:system("outline_system"):set_pulsing(unit, true, "pulse")
			context.id = id
		elseif not enable and context.id then
			Managers.state.entity:system("outline_system"):set_pulsing(unit, false, context.id)

			context.id = nil
		end
	end
end

SocialWheelUI._set_current_context = function (self, new_context)
	local old_context = self._current_context

	if new_context ~= old_context then
		if old_context then
			self:_set_pulsing(old_context, false)
		end

		if new_context and self._state == "open" then
			self:_set_pulsing(new_context, true)
		end

		self._current_context = new_context
	end
end

SocialWheelUI._open_menu = function (self, dt, t, input_service)
	local animation_times = ANIMATION_TIMES.OPEN
	local animations = self._animations
	self._animations.update_alpha = UIAnimation.init(UIAnimation.function_by_time, self._render_settings, "alpha_multiplier", 0, 1, animation_times.ALPHA, math.easeOutCubic)
	self._active_context = self._current_context
	local active_context = self._active_context
	local social_wheel_unit = active_context.unit

	if not Unit.alive(social_wheel_unit) then
		social_wheel_unit = nil
	end

	local category = self._default_social_wheel_category
	category = category or ((PLATFORM ~= "win32" or false) and "general")

	for i = 1, #SocialWheelPriority, 1 do
		local data = SocialWheelPriority[i]
		local selected_category = data[1]
		local condition_function = data[2]

		if condition_function(active_context, self._player, social_wheel_unit) then
			category = selected_category

			break
		end
	end

	self._current_selection_widgets = self._selection_widgets[category]
	local settings = SocialWheelSettings[category]

	fassert(settings, "No settings for category %q.", category)

	self._current_selection_widget_settings = settings
	local selection_widgets = self._current_selection_widgets
	local num_selection_widgets = #selection_widgets

	for i = 1, num_selection_widgets, 1 do
		local widget = selection_widgets[i]
		local widget_content = widget.content
		local final_offset = widget_content.final_offset
		local dir = widget_content.dir:unbox()
		local offset = widget.offset
		animations["animation_x_" .. i] = UIAnimation.init(UIAnimation.function_by_time, offset, 1, dir[1] * final_offset[1] * 0.5, dir[1] * final_offset[1], animation_times.MOVE_X, math.ease_out_elastic)
		animations["animation_y_" .. i] = UIAnimation.init(UIAnimation.function_by_time, offset, 2, dir[2] * final_offset[2] * 0.5, dir[2] * final_offset[2], animation_times.MOVE_Y, math.ease_out_elastic)
		animations["animation_divider_size_" .. i] = UIAnimation.init(UIAnimation.function_by_time, widget_content, "size_multiplier", widget_content.final_size_multiplier * 0.5, widget_content.final_size_multiplier, animation_times.SIZE, math.ease_out_elastic)
	end

	local bg_widget = self._bg_widget
	local widget_content = bg_widget.content
	animations.animation_bg_size = UIAnimation.init(UIAnimation.function_by_time, widget_content, "size_multiplier", widget_content.final_size_multiplier * 0.5, widget_content.final_size_multiplier, animation_times.SIZE, math.ease_out_elastic)
	local gamepad_enabled = PLATFORM ~= "win32" or Managers.input:is_device_active("gamepad")
	local stop_lerp_time = (gamepad_enabled and STOP_LERP_TIME_CONTROLLER) or STOP_LERP_TIME
	self._selected_widget = nil
	self._open_start_t = t

	self:_set_player_input_scale(0, stop_lerp_time)
	self:_change_state("update_open")
end

SocialWheelUI.update_open = function (self, dt, t, input_service)
	local ping_held = input_service:get("ping_hold")
	local ping_released = input_service:get("ping_release") or (self.previous_ping_held and not ping_held)
	local social_wheel_only_held = input_service:get("social_wheel_only_hold")
	local social_wheel_only_released = input_service:get("social_wheel_only_release") or (self.previous_social_wheel_only_held and not social_wheel_only_held)

	if ping_released or social_wheel_only_released then
		self:_close_menu(dt, t, input_service)

		return
	end

	self:_update_pointer(input_service, true, t)
end

SocialWheelUI._update_pointer = function (self, input_service, enabled, t)
	local arrow_widget = self._arrow_widget
	local arrow_content = arrow_widget.content
	local arrow_widget_style = arrow_widget.style
	local arrow_style = arrow_widget_style.arrow
	local cursor_style = arrow_widget_style.cursor
	local settings = self._current_selection_widget_settings
	local angle = 0
	local can_select = false
	local gamepad_enabled = Managers.input:is_device_active("gamepad")

	if gamepad_enabled then
		local gamepad_axis = input_service:get("look_raw_controller")
		local axis_length = Vector3.length_squared(gamepad_axis)

		if axis_length < 0.5 then
			arrow_style.angle = 0
			arrow_style.offset = {
				0,
				0,
				0
			}
			arrow_content.visible = false

			if t < self._select_timer then
				enabled = false
			end
		else
			gamepad_axis = Vector3.normalize(gamepad_axis)
			angle = math.atan2(gamepad_axis[2], gamepad_axis[1])
			arrow_style.angle = math.pi - angle
			arrow_style.offset = {
				90 * gamepad_axis[1],
				90 * gamepad_axis[2],
				0
			}
			arrow_content.visible = enabled
			can_select = enabled
			self._select_timer = t + 0.4
		end
	else
		local mouse_offset = input_service:get("look_raw")
		local screen_center = Vector3(RESOLUTION_LOOKUP.res_w / 2, RESOLUTION_LOOKUP.res_h / 2, 0)
		local prev_position = arrow_content.pointing_point:unbox()
		local new_position = prev_position + Vector3(mouse_offset.x, -mouse_offset.y, 0)
		local offset = new_position - screen_center
		local offset_length = Vector3.length(offset)
		local new_length = math.min(offset_length, 200)
		local direction = Vector3.normalize(offset)
		new_position = screen_center + direction * new_length
		local aspect_ratio = (enabled and settings.size[1] / settings.size[2]) or 1

		if new_length < 100 then
			angle = math.atan2(direction[2] * aspect_ratio, direction[1])
			arrow_style.angle = math.pi - angle
			arrow_style.offset = {
				0,
				0,
				0
			}
			arrow_style.color[1] = 0
			cursor_style.color[1] = 255
			cursor_style.offset = {
				offset.x,
				offset.y
			}
			arrow_content.visible = enabled

			arrow_content.pointing_point:store(new_position)
		else
			angle = math.atan2(direction[2] * aspect_ratio, direction[1])
			arrow_style.angle = math.pi - angle
			arrow_style.offset = {
				100 * direction[1],
				100 * direction[2],
				0
			}
			arrow_style.color[1] = 255
			cursor_style.color[1] = 0
			arrow_content.visible = enabled

			arrow_content.pointing_point:store(new_position)

			can_select = enabled
		end
	end

	if enabled then
		self:_update_selection(can_select, settings.angle, angle)
	end
end

SocialWheelUI._update_selection = function (self, enabled, total_angle, angle)
	local selection_widgets = self._current_selection_widgets

	local function reset_selection()
		local widget = selection_widgets[self._current_index]
		widget.content.selected = false
		self._current_index = nil
		local bg_widget = self._bg_widget
		local bg_widget_content = bg_widget.content
		bg_widget_content.text_id = Localize("tutorial_no_text")
	end

	if not enabled then
		if self._current_index then
			reset_selection()
		end

		return
	end

	local selection_index = self:_select_widget(total_angle, #selection_widgets, angle)

	if not selection_index and self._current_index then
		reset_selection()

		return
	end

	local old_index = self._current_index

	if old_index then
		local old_widget = selection_widgets[old_index]
		local old_widget_content = old_widget.content

		if not old_widget_content.is_valid then
			reset_selection()

			return
		end
	end

	if selection_index == old_index then
		return
	end

	if old_index then
		local old_widget = selection_widgets[old_index]
		old_widget.content.selected = false
		self._current_index = nil
	end

	local new_widget = selection_widgets[selection_index]
	local new_widget_content = new_widget.content

	if new_widget_content.is_valid then
		new_widget.content.selected = true
		self._current_index = selection_index

		if PLATFORM ~= "win32" then
			local active_context = self._active_context
			local target_unit = active_context.unit

			if not target_unit or Unit.alive(target_unit) then
				local social_wheel_event = new_widget.content.settings.name
				local social_wheel_event_settings = SocialWheelSettingsLookup[social_wheel_event]
				local event_text_func = social_wheel_event_settings.event_text_func
				local event_text = event_text_func(target_unit, social_wheel_event_settings)
				local bg_widget = self._bg_widget
				local bg_widget_content = bg_widget.content
				bg_widget_content.text_id = event_text
			end
		end

		self:_play_sound("Play_hud_socialwheel_hover")
	end
end

SocialWheelUI._close_menu = function (self, dt, t, input_service)
	local animation_times = ANIMATION_TIMES.CLOSE
	local animations = self._animations
	self._animations.update_alpha = UIAnimation.init(UIAnimation.function_by_time, self._render_settings, "alpha_multiplier", self._render_settings.alpha_multiplier, 0, animation_times.ALPHA, math.easeOutCubic)
	local bg_widget = self._bg_widget
	local bg_widget_content = bg_widget.content
	bg_widget_content.text_id = Localize("tutorial_no_text")
	animations.animation_bg_size = UIAnimation.init(UIAnimation.function_by_time, bg_widget_content, "size_multiplier", bg_widget_content.size_multiplier, 0, animation_times.SIZE, math.easeOutCubic)
	local active_context = self._active_context
	local target_unit = active_context.unit
	local selection_widgets = self._current_selection_widgets
	local num_selection_widgets = #selection_widgets

	for i = 1, num_selection_widgets, 1 do
		local widget = selection_widgets[i]
		local widget_content = widget.content
		local offset = widget.offset
		animations["animation_x_" .. i] = UIAnimation.init(UIAnimation.function_by_time, offset, 1, offset[1], 0, animation_times.MOVE_X, math.easeOutCubic)
		animations["animation_y_" .. i] = UIAnimation.init(UIAnimation.function_by_time, offset, 2, offset[2], 0, animation_times.MOVE_Y, math.easeOutCubic)
		animations["animation_divider_size_" .. i] = UIAnimation.init(UIAnimation.function_by_time, widget_content, "size_multiplier", widget_content.size_multiplier, 0, animation_times.SIZE, math.easeOutCubic)

		if i == self._current_index then
			local social_wheel_event_settings = widget_content.settings
			widget_content.selected = false

			local function get_active_context_func()
				return active_context
			end

			local category_settings = widget.content.category_settings
			local selected_widget = UIWidget.init(definitions.create_social_widget(social_wheel_event_settings, self:_widget_angle(category_settings.angle, num_selection_widgets, i), category_settings, get_active_context_func))
			self._selected_widget = selected_widget
			local selected_widget_content = selected_widget.content
			selected_widget_content.selected = true
			selected_widget_content.activated = true
			local selected_widget_style = selected_widget.style
			local icon_color = selected_widget_style.icon.color
			local icon_shadow_color = selected_widget_style.icon_shadow.color
			local icon_bg_color = selected_widget_style.icon_bg.color
			local texture_size = selected_widget_style.icon.texture_size
			local shadow_texture_size = selected_widget_style.icon_shadow.texture_size
			local base_texture_size = selected_widget_style.icon.base_texture_size
			local shadow_base_texture_size = selected_widget_style.icon_shadow.base_texture_size
			local text_color = selected_widget_style.text.selected_color
			local text_shadow_color = selected_widget_style.text_shadow.selected_color
			animations["icon_color_a_" .. i] = UIAnimation.init(UIAnimation.pulse_animation3, icon_color, 1, icon_color[1], icon_color[1] * 0.5, 10, 0.5)
			animations["icon_size_x_" .. i] = UIAnimation.init(UIAnimation.pulse_animation3, texture_size, 1, base_texture_size[1], base_texture_size[1] * 0.75, 10, 0.5)
			animations["icon_size_y_" .. i] = UIAnimation.init(UIAnimation.pulse_animation3, texture_size, 2, base_texture_size[2], base_texture_size[2] * 0.75, 10, 0.5)
			animations["icon_shadow_color_a_" .. i] = UIAnimation.init(UIAnimation.pulse_animation3, icon_shadow_color, 1, icon_shadow_color[1], icon_shadow_color[1] * 0.5, 10, 0.5)
			animations["icon_shadow_size_x_" .. i] = UIAnimation.init(UIAnimation.pulse_animation3, shadow_texture_size, 1, shadow_base_texture_size[1], shadow_base_texture_size[1] * 0.75, 10, 0.5)
			animations["icon_shadow_size_y_" .. i] = UIAnimation.init(UIAnimation.pulse_animation3, shadow_texture_size, 2, shadow_base_texture_size[2], shadow_base_texture_size[2] * 0.75, 10, 0.5)

			self._animation_callbacks["icon_color_a_" .. i] = function ()
				animations["fade_text_color_a_" .. i] = UIAnimation.init(UIAnimation.function_by_time, text_color, 1, text_color[1], 0, 0.25, math.easeOutCubic)
				animations["fade_text_shadow_color_a_" .. i] = UIAnimation.init(UIAnimation.function_by_time, text_shadow_color, 1, text_shadow_color[1], 0, 0.25, math.easeOutCubic)
				animations["fade_icon_color_a_" .. i] = UIAnimation.init(UIAnimation.function_by_time, icon_color, 1, icon_color[1], 0, 0.25, math.easeOutCubic)
				animations["fade_icon_shadow_color_a_" .. i] = UIAnimation.init(UIAnimation.function_by_time, icon_shadow_color, 1, icon_shadow_color[1], 0, 0.25, math.easeOutCubic)
				animations["fade_icon_bg_color_a_" .. i] = UIAnimation.init(UIAnimation.function_by_time, icon_bg_color, 1, icon_bg_color[1], 0, 0.25, math.easeOutCubic)

				self._animation_callbacks["fade_icon_color_a_" .. i] = function ()
					self._selected_widget = nil
					selected_widget_content.activated = false
				end
			end

			if not target_unit or Unit.alive(target_unit) then
				local social_wheel_event = social_wheel_event_settings.name

				self:_play_sound("Play_hud_socialwheel_select")
				self:_add_social_wheel_event(self._player, social_wheel_event, target_unit, false)

				if PLATFORM ~= "win32" then
					local peer_id = self._peer_id
					local social_wheel_event_id = NetworkLookup.social_wheel_events[social_wheel_event_settings.name]
					local network_manager = Managers.state.network
					local target_unit_id = network_manager:unit_game_object_id(target_unit) or NetworkConstants.invalid_game_object_id

					if network_manager.is_server then
						network_manager.network_transmit:send_rpc_clients("rpc_social_wheel_event", peer_id, social_wheel_event_id, target_unit_id)
					else
						network_manager.network_transmit:send_rpc_server("rpc_social_wheel_event", peer_id, social_wheel_event_id, target_unit_id)
					end
				end
			end
		end
	end

	if PLATFORM ~= "win32" then
		self._default_social_wheel_category = (self._ingame_ui_context.is_in_inn and "general_inn") or "general"
	end

	local gamepad_enabled = PLATFORM ~= "win32" or Managers.input:is_device_active("gamepad")
	local start_lerp_time = (gamepad_enabled and START_LERP_TIME_CONTROLLER) or START_LERP_TIME

	if not target_unit or Unit.alive(target_unit) then
		self:_execute_selection()
	end

	if self._current_index == nil then
		local time_since_open = t - self._open_start_t
		local _, open_animation_duration = table.max(ANIMATION_TIMES.OPEN)

		if time_since_open < open_animation_duration then
			self:_ping_attempt(active_context.ping_context_unit)
		end
	end

	self._active_context = nil

	self:_set_current_context(nil)

	self._open_start_t = nil
	self._current_index = nil

	self:_set_player_input_scale(1, start_lerp_time)
	self:_change_state("update_closed")
end

return

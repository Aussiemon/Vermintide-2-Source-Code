-- chunkname: @scripts/ui/social_wheel/versus_social_wheel_ui.lua

require("scripts/ui/social_wheel/social_wheel_ui_settings")

local definitions = require("scripts/ui/social_wheel/versus_social_wheel_ui_definitions")
local social_wheel_settings = require("scripts/ui/social_wheel/versus_social_wheel_ui_settings")
local scenegraph_definition = definitions.scenegraph_definition

VersusSocialWheelUI = class(VersusSocialWheelUI)

local RPCS = {
	"rpc_social_wheel_event",
}
local STOP_LERP_TIME = 0.125
local STOP_LERP_TIME_CONTROLLER = 0.25
local START_LERP_TIME = 0.01
local START_LERP_TIME_CONTROLLER = 0.125
local max_free_events = social_wheel_settings.max_free_events
local ANIMATION_TIMES = IS_WINDOWS and social_wheel_settings.animation_times or social_wheel_settings.animation_times_controller
local mt = {
	__index = function (t, key, value)
		return t.default
	end,
}
local SFX_EVENTS = {
	default = {
		HOVER = "Play_hud_socialwheel_hover",
		OPEN = "Play_hud_socialwheel_open",
		SELECT = "Play_hud_socialwheel_select",
	},
	heroes = {
		HOVER = "Play_hud_socialwheel_hover",
		OPEN = "Play_hud_socialwheel_open",
		SELECT = "Play_hud_socialwheel_select",
	},
}

for _, dlc in pairs(DLCSettings) do
	local sfx_events = dlc.social_wheel_sfx_events

	if sfx_events then
		table.merge_recursive(SFX_EVENTS, sfx_events)
	end
end

setmetatable(SFX_EVENTS, mt)

VersusSocialWheelUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self._ui_top_renderer = ingame_ui_context.ui_top_renderer
	self._render_settings = {
		alpha_multiplier = 0,
	}
	self._is_visible = true
	self._state = "update_closed"
	self._states = {
		update_closed = true,
		update_open = true,
	}
	self._ingame_ui_context = ingame_ui_context
	self._peer_id = ingame_ui_context.peer_id
	self._player = ingame_ui_context.player
	self._wwise_world = ingame_ui_context.wwise_world
	self._console_extension = ingame_ui_context.is_in_inn and "_inn" or ""
	self._current_context = nil
	self._active_context = nil
	self._num_free_events = max_free_events
	self._valid_selection = true

	local settings = Managers.state.game_mode:settings()
	local ping_mode = settings.ping_mode

	if ping_mode then
		self._world_markers_enabled = ping_mode.world_markers
	else
		self._world_markers_enabled = false
	end

	self:_create_ui_elements()
	self:_register_rpcs()
	Managers.state.event:register(self, "on_player_joined_side", "on_player_joined_side")
end

VersusSocialWheelUI._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._animations = {}
	self._animation_callbacks = {}
	self._selection_widgets = {}
	self._social_event_widgets = {}
	self._queued_social_wheel_events = {}
	self._icon_widgets = {}
	self._event_index = 0
	self._select_timer = 0
	self._selected_widget = nil

	local function get_active_context_func()
		return self._active_context
	end

	local max_entries = social_wheel_settings.max_entries

	for i = 1, max_entries do
		local angle, offset_x, offset_y = self:_claculate_entry_angle_and_offset(i, max_entries)
		local widget_def = definitions.create_social_wheel_entry_button(angle, offset_x, offset_y, i)
		local widget = UIWidget.init(widget_def)

		self._selection_widgets[#self._selection_widgets + 1] = widget
	end

	self._widgets, self._widgets_by_name = UIUtils.create_widgets(definitions.widget_definitions)
	self._arrow_widget = self._widgets_by_name.pointer
	self._ping_info_text = self._widgets_by_name.ping_info_text

	UIRenderer.clear_scenegraph_queue(self._ui_top_renderer)
end

VersusSocialWheelUI._register_rpcs = function (self)
	local ingame_ui_context = self._ingame_ui_context
	local network_event_delegate = ingame_ui_context.network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))
end

VersusSocialWheelUI._unregister_rpcs = function (self)
	local ingame_ui_context = self._ingame_ui_context
	local network_event_delegate = ingame_ui_context.network_event_delegate

	network_event_delegate:unregister(self)
end

VersusSocialWheelUI._populate_social_wheel_entries = function (self, category)
	local layout_settings = SocialWheelSettings[category]
	local validation_function = layout_settings.validation_function

	if not validation_function or validation_function() then
		local entry_widgets = self._selection_widgets

		for i = 1, #entry_widgets do
			local widget = entry_widgets[i]
			local entry_data = layout_settings[i]
			local content = widget.content

			content.settings = entry_data and entry_data or {}
			content.entry_icon = entry_data and entry_data.icon or "radial_chat_icon_unavailable"

			local is_valid = entry_data and true or false

			content.is_valid = is_valid
			content.active_context = self._active_context

			if is_valid and entry_data.is_valid_func then
				local valid_target = entry_data.is_valid_func(entry_data.data, self._active_context)

				content.has_valid_target = valid_target
			else
				content.has_valid_target = true
			end
		end
	end
end

VersusSocialWheelUI._claculate_entry_angle_and_offset = function (self, entry_index, max_entries)
	local pi = math.pi
	local base_angle = social_wheel_settings.base_angle
	local radians_per_entry = pi * 2 / max_entries
	local radius = social_wheel_settings.radius
	local radial_offset = pi * 0.5 + pi - base_angle * 0.5 + radians_per_entry
	local angle = (-radial_offset - (entry_index - 1) * radians_per_entry) % (2 * pi)
	local offset_x = math.cos(angle) * radius
	local offset_y = math.sin(angle) * radius

	return angle, offset_x, offset_y
end

VersusSocialWheelUI.destroy = function (self)
	self:_unregister_rpcs()

	local player_interactor_ext = ScriptUnit.has_extension(self._player.player_unit, "interactor_system")

	if player_interactor_ext then
		player_interactor_ext:enable_interactions(true)
	end

	Managers.state.event:unregister("on_player_joined_side", self)
end

VersusSocialWheelUI._widget_angle = function (self, total_angle, num_elements, i)
	local pi = math.pi
	local segment = total_angle / num_elements
	local radial_offset = pi * 0.5 + pi - total_angle * 0.5 + segment * 0.5
	local widget_angle = -radial_offset - (i - 1) * segment

	return widget_angle
end

VersusSocialWheelUI._select_widget = function (self, total_angle, num_elements, angle)
	local pi = math.pi
	local segment = pi * 2 / num_elements
	local radial_offset = pi * 0.5 + (pi - total_angle * 0.5) + segment * 0.5
	local angle_offset = (-angle - radial_offset) % (2 * pi)
	local selected_index = math.floor(angle_offset / segment) + 1

	if selected_index > 0 and selected_index <= num_elements then
		return selected_index
	end
end

local GARBAGE = {
	0,
	0,
	0,
}

VersusSocialWheelUI._add_social_wheel_event = function (self, player, social_wheel_event, target_unit, play_notification_sound)
	local social_wheel_event_settings = SocialWheelSettingsLookup[social_wheel_event]
	local text = social_wheel_event_settings.event_text
	local text_func = social_wheel_event_settings.event_text_func
	local event_text, localization_parameters = text

	if text_func then
		event_text, localization_parameters = text_func(target_unit, social_wheel_event_settings)
	end

	if event_text then
		if IS_WINDOWS then
			if self._num_free_events >= 1 then
				local localize, localize_parameters = true, true

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
				local icon_widget

				if not is_local_player then
					local world = Managers.world:world("level_world")
					local viewport = ScriptWorld.viewport(world, "player_1")
					local camera = ScriptViewport.camera(viewport)

					icon_widget = UIWidget.init(definitions.create_social_icon(social_wheel_event_settings, player.peer_id, camera, world, Managers.time:time("game") + 5, 1))
					self._icon_widgets[player.peer_id] = icon_widget
				end
			end
		end

		if play_notification_sound then
			self:_play_sound("Play_hud_socialwheel_notification")
		end
	end
end

VersusSocialWheelUI._add_social_wheel_event_animation = function (self, widget, is_local_player)
	local widget_content = widget.content
	local is_local_player = widget_content.is_local_player

	self._social_event_widgets[#self._social_event_widgets + 1] = widget
	self._event_index = self._event_index + 1

	local event_index = self._event_index

	self._animations["social_event_" .. event_index] = UIAnimation.init(UIAnimation.function_by_time, widget.offset, 1, 500, -60, 0.25, math.easeOutCubic)
	self._animation_callbacks["social_event_" .. event_index] = function ()
		local color = is_local_player and Colors.get_color_table_with_alpha("medium_purple", 255) or Colors.get_color_table_with_alpha("light_sky_blue", 255)

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

VersusSocialWheelUI.rpc_social_wheel_event = function (self, channel_id, peer_id, social_wheel_event_id, target_unit_id)
	if IS_XB1 and Managers.chat:ignoring_peer_id(peer_id) then
		return
	end

	local player = Managers.player:player_from_peer_id(peer_id)

	if player then
		local target_unit = Managers.state.unit_storage:unit(target_unit_id)

		if not target_unit or Unit.alive(target_unit) then
			local social_wheel_event = NetworkLookup.social_wheel_events[social_wheel_event_id]

			self:_add_social_wheel_event(player, social_wheel_event, target_unit, true)
		end
	end
end

VersusSocialWheelUI.post_update = function (self, dt)
	self:_post_update_remove_icon(dt)
	self:_post_update_render(dt)
end

local TO_REMOVE = {}

VersusSocialWheelUI._post_update_remove_icon = function (self, dt)
	table.clear(TO_REMOVE)

	local time = Managers.time:time("game")

	for key, widget in pairs(self._icon_widgets) do
		local widget_content = widget.content

		if time > widget_content.end_time then
			TO_REMOVE[#TO_REMOVE + 1] = key
		end
	end

	for _, key in ipairs(TO_REMOVE) do
		self._icon_widgets[key] = nil
	end
end

local EMPTY_RENDER_SETTINGS = {}

VersusSocialWheelUI._post_update_render = function (self, dt)
	if not self._is_visible then
		return
	end

	local ui_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = Managers.input:get_service("ingame_menu")

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, EMPTY_RENDER_SETTINGS)

	for _, widget in pairs(self._icon_widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	UIRenderer.end_pass(ui_renderer)
end

VersusSocialWheelUI.update = function (self, dt, t)
	self:_update_animations(dt, t)
	self:_update_input(dt, t)
	self:_draw(dt, t)
end

VersusSocialWheelUI._update_animations = function (self, dt)
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

VersusSocialWheelUI._update_input = function (self, dt, t)
	local input_service = Managers.input:get_service("Player")

	self[self._state](self, dt, t, input_service)

	self.previous_ping_held = input_service:get("ping_hold")
	self.previous_social_wheel_only_held = input_service:get("social_wheel_only_hold")
	self.previous_photomode_only_held = input_service:get("photomode_only_hold")
end

VersusSocialWheelUI._draw = function (self, dt, t)
	if not self._is_visible then
		return
	end

	local ui_renderer = self._ui_top_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = Managers.input:get_service("ingame_menu")
	local selection_widgets = self._selection_widgets
	local render_settings = self._render_settings

	if selection_widgets and render_settings.alpha_multiplier > 0 then
		UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

		local num_selection_widgets = #selection_widgets

		for i = 1, num_selection_widgets do
			local widget = selection_widgets[i]

			UIRenderer.draw_widget(ui_renderer, widget)
		end

		UIRenderer.draw_widget(ui_renderer, self._arrow_widget)
		UIRenderer.draw_widget(ui_renderer, self._ping_info_text)

		if self._selected_widget then
			UIRenderer.draw_widget(ui_renderer, self._selected_widget)
		end

		UIRenderer.end_pass(ui_renderer)
	end
end

VersusSocialWheelUI.set_visible = function (self, visible)
	self._is_visible = visible
end

VersusSocialWheelUI._set_player_input_scale = function (self, scale, lerp_time)
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

	local input_service = Managers.input:get_service("Player")

	if input_service then
		local block = scale == 0

		input_service:set_input_blocked("look_controller_3p", block)
		input_service:set_input_blocked("look", block)
	end
end

VersusSocialWheelUI._ping_unit_attempt = function (self, target_unit, ping_type, social_wheel_event_id)
	local player = self._player
	local player_unit = player.player_unit

	if Unit.alive(player_unit) and Unit.alive(target_unit) then
		local game_time = Managers.time:time("game")
		local context_aware_ping_extension = ScriptUnit.extension(player_unit, "ping_system")

		return context_aware_ping_extension:ping_attempt(player_unit, target_unit, game_time, ping_type, social_wheel_event_id)
	end
end

VersusSocialWheelUI._ping_world_position_attempt = function (self, position, ping_type, social_wheel_event_id)
	local player = self._player
	local player_unit = player.player_unit

	if Unit.alive(player_unit) then
		local game_time = Managers.time:time("game")
		local context_aware_ping_extension = ScriptUnit.extension(player_unit, "ping_system")

		return context_aware_ping_extension:ping_world_position_attempt(player_unit, position:unbox(), game_time, ping_type, social_wheel_event_id)
	end
end

VersusSocialWheelUI._social_message_attempt = function (self, social_wheel_event_id, target_unit)
	local player = self._player
	local player_unit = player.player_unit

	if Unit.alive(player_unit) then
		local game_time = Managers.time:time("game")
		local context_aware_ping_extension = ScriptUnit.extension(player_unit, "ping_system")

		return context_aware_ping_extension:social_message_attempt(player_unit, social_wheel_event_id, target_unit)
	end
end

VersusSocialWheelUI._local_ping_attempt = function (self, social_wheel_event_id, target_unit)
	local player = self._player
	local player_unit = player.player_unit

	if Unit.alive(player_unit) then
		local ping_system = Managers.state.entity:system("ping_system")

		ping_system:handle_local_ping(PingTypes.LOCAL_ONLY, social_wheel_event_id, player, player_unit, target_unit, nil)
	end
end

VersusSocialWheelUI._play_sound = function (self, sound_event)
	if not sound_event then
		return
	end

	WwiseWorld.trigger_event(self._wwise_world, sound_event)
end

VersusSocialWheelUI._change_state = function (self, new_state)
	fassert(self._states[new_state], "[VersusSocialWheelUI:_change_state] There is no state called %s", tostring(new_state))

	self._state = new_state
end

VersusSocialWheelUI.update_closed = function (self, dt, t, input_service)
	local player = self._player
	local player_unit = player.player_unit

	if Unit.alive(player_unit) then
		local context_aware_ping_extension = ScriptUnit.extension(player_unit, "ping_system")
		local current_context = context_aware_ping_extension:social_wheel_context()

		self:_set_current_context(current_context)

		local game_t = Managers.time:time("game")

		if current_context and game_t > current_context.min_t then
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

VersusSocialWheelUI._set_pulsing = function (self, context, enable)
	local unit = context.unit

	if Unit.alive(unit) then
		if enable then
			Managers.state.entity:system("outline_system"):set_pulsing(unit, true, "pulse")

			context.id = true
		elseif not enable and context.id then
			Managers.state.entity:system("outline_system"):set_pulsing(unit, false)

			context.id = nil
		end
	end
end

VersusSocialWheelUI._set_current_context = function (self, new_context)
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

VersusSocialWheelUI._open_menu = function (self, dt, t, input_service, increment_page)
	self._block_next_input = false

	local animation_times = ANIMATION_TIMES.open
	local animations = self._animations

	self._animations.update_alpha = UIAnimation.init(UIAnimation.function_by_time, self._render_settings, "alpha_multiplier", 0, 1, animation_times.alpha, math.easeOutCubic)
	self._active_context = self._current_context

	local active_context = self._active_context
	local social_wheel_unit = active_context.unit or active_context.ping_context_unit

	if not Unit.alive(social_wheel_unit) then
		social_wheel_unit = nil
	end

	local unique_id = self._player:unique_id()
	local side_name = self._side_name
	local side_settings = Managers.state.game_mode:setting("social_wheel_by_side")
	local category

	if side_settings then
		category = side_settings[side_name] or "versus_heroes"
	else
		category = "versus_heroes"
	end

	for i = 1, #SocialWheelPriority do
		local data = SocialWheelPriority[i]
		local selected_category = data[1]
		local condition_function = data[2]

		if condition_function(active_context, self._player, social_wheel_unit) then
			category = selected_category

			break
		end
	end

	self:_populate_social_wheel_entries(category)

	self._block_next_input = true
	self._current_selection_category = category

	local settings = SocialWheelSettings[category]

	fassert(settings, "No settings for category %q.", category)

	self._current_selection_widget_settings = settings

	local selection_widgets = self._selection_widgets
	local num_selection_widgets = #selection_widgets

	for i = 1, num_selection_widgets do
		local widget = selection_widgets[i]
		local widget_content = widget.content
		local final_offset = widget_content.final_offset
		local dir = widget_content.dir:unbox()
		local offset = widget.offset
		local entry_size = social_wheel_settings.entry_size
		local wheel_size = social_wheel_settings.wheel_size
		local from_offset = {
			(dir[1] * wheel_size[1] - entry_size[1] * 0.5) * 0.5,
			(dir[2] * wheel_size[2] - entry_size[2] * 0.5) * 0.5,
		}
		local to_offset = {
			dir[1] * wheel_size[1] - entry_size[1] * 0.5,
			dir[2] * wheel_size[2] - entry_size[2] * 0.5,
		}

		animations["animation_x_" .. i] = UIAnimation.init(UIAnimation.function_by_time, offset, 1, from_offset[1], to_offset[1], animation_times.move_x, math.ease_out_elastic)
		animations["animation_y_" .. i] = UIAnimation.init(UIAnimation.function_by_time, offset, 2, from_offset[2], to_offset[2], animation_times.move_y, math.ease_out_elastic)
	end

	local gamepad_enabled = not IS_WINDOWS or Managers.input:is_device_active("gamepad")
	local stop_lerp_time = gamepad_enabled and STOP_LERP_TIME_CONTROLLER or STOP_LERP_TIME

	self._valid_selection = true
	self._selected_widget = nil
	self._open_start_t = t

	self:_set_player_input_scale(0, stop_lerp_time)
	self:_change_state("update_open")

	local player_interactor_ext = ScriptUnit.extension(self._player.player_unit, "interactor_system")

	player_interactor_ext:enable_interactions(false)

	if self._world_markers_enabled then
		local function cb(id, widget)
			if self._world_marker_preview_id then
				Managers.state.event:trigger("remove_world_marker", self._world_marker_preview_id)
			end

			self._world_marker_preview_id = id
			widget.style.text.localize = false
		end

		local position = active_context.position and active_context.position:unbox()

		if position then
			local ping_system = Managers.state.entity:system("ping_system")
			local _, new_position, _ = ping_system:is_ping_response(nil, unique_id, position)

			if not self._world_marker_preview_id or new_position and Vector3.distance_squared(new_position, position) == 0 then
				local final_position = new_position or position

				Managers.state.event:trigger("add_world_marker_position", "ping", final_position, cb)
			end
		end
	end

	local event = SFX_EVENTS[self._side_name].OPEN

	self:_play_sound(event)
end

VersusSocialWheelUI.update_open = function (self, dt, t, input_service)
	local ping_held = input_service:get("ping_hold")
	local ping_released = input_service:get("ping_release") or self.previous_ping_held and not ping_held
	local photomode_only_held = input_service:get("photomode_only_hold")
	local photomode_only_released = input_service:get("photomode_only_release") or self.previous_photomode_only_held and not photomode_only_held
	local social_wheel_only_held = input_service:get("social_wheel_only_hold")
	local social_wheel_only_released = input_service:get("social_wheel_only_release") or self.previous_social_wheel_only_held and not social_wheel_only_held

	if ping_released or photomode_only_released or social_wheel_only_released then
		self:_close_menu(dt, t, input_service)

		return
	end

	self:_update_pointer(input_service, true, t)
end

VersusSocialWheelUI._update_pointer = function (self, input_service, enabled, t)
	local arrow_widget = self._arrow_widget
	local arrow_content = arrow_widget.content
	local arrow_widget_style = arrow_widget.style
	local arrow_style = arrow_widget_style.arrow_pointer
	local settings = social_wheel_settings
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
				0,
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
				0,
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

		local aspect_ratio = enabled and settings.entry_size[1] / settings.entry_size[2] or 1

		if new_length < 100 then
			angle = math.atan2(direction[2] * aspect_ratio, direction[1])
			arrow_style.angle = math.pi - angle
			arrow_style.offset = {
				0,
				0,
				0,
			}
			arrow_style.color[1] = 0
			arrow_content.visible = enabled

			arrow_content.pointing_point:store(new_position)
		else
			angle = math.atan2(direction[2] * aspect_ratio, direction[1])
			arrow_style.angle = math.pi - angle
			arrow_style.offset = {
				100 * direction[1],
				100 * direction[2],
				0,
			}
			arrow_style.color[1] = 255
			arrow_content.visible = enabled

			arrow_content.pointing_point:store(new_position)

			can_select = enabled
		end
	end

	if enabled then
		self:_update_selection(can_select, settings.base_angle, angle)
	end
end

VersusSocialWheelUI._update_selection = function (self, enabled, total_angle, angle)
	local selection_widgets = self._selection_widgets

	local function reset_selection()
		local widget = selection_widgets[self._current_index]

		widget.content.selected = false
		self._ping_info_text.content.text = ""
		self._current_index = nil
		self._valid_selection = true
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

	if new_widget_content.is_valid and new_widget_content.has_valid_target then
		new_widget.content.selected = true
		self._current_index = selection_index
		self._valid_selection = true

		local entry_data = new_widget_content.settings
		local ping_info_text = Localize(entry_data.text)

		self._ping_info_text.content.text = ping_info_text

		local event = SFX_EVENTS[self._side_name].HOVER

		self:_play_sound(event)
	else
		self._valid_selection = false
	end
end

VersusSocialWheelUI._close_menu = function (self, dt, t, input_service, page_only)
	local animation_times = ANIMATION_TIMES.close
	local animations = self._animations

	self._animations.update_alpha = UIAnimation.init(UIAnimation.function_by_time, self._render_settings, "alpha_multiplier", self._render_settings.alpha_multiplier, 0, animation_times.alpha, math.easeOutCubic)

	local active_context = self._active_context
	local target_unit = active_context.unit or active_context.ping_context_unit
	local selection_widgets = self._selection_widgets
	local num_selection_widgets = #selection_widgets

	for i = 1, num_selection_widgets do
		local widget = selection_widgets[i]
		local widget_content = widget.content
		local entry_size = social_wheel_settings.entry_size
		local offset = widget.offset

		animations["animation_x_" .. i] = UIAnimation.init(UIAnimation.function_by_time, offset, 1, offset[1], -(entry_size[1] * 0.5), animation_times.move_x, math.easeOutCubic)
		animations["animation_y_" .. i] = UIAnimation.init(UIAnimation.function_by_time, offset, 2, offset[2], -(entry_size[2] * 0.5), animation_times.move_y, math.easeOutCubic)

		if i == self._current_index then
			local social_wheel_event_settings = widget_content.settings

			widget_content.selected = false

			local function get_active_context_func()
				return active_context
			end

			local category_settings = widget.content.category_settings
			local category = self._current_selection_category
			local selected_category_widgets = self._selection_widgets
			local angle = self:_claculate_entry_angle_and_offset(i, 8)
			local selected_widget = UIWidget.init(definitions.create_social_wheel_entry_button(angle))

			self._selected_widget = selected_widget

			local selected_widget_content = selected_widget.content

			selected_widget_content.selected = true
			selected_widget_content.activated = true

			local selected_widget_style = selected_widget.style
			local icon_color = selected_widget_style.entry_icon.color
			local texture_size = selected_widget_style.entry_icon.texture_size
			local base_texture_size = selected_widget_style.entry_icon.base_texture_size

			animations["icon_color_a_" .. i] = UIAnimation.init(UIAnimation.pulse_animation3, icon_color, 1, icon_color[1], icon_color[1] * 0.5, 10, 0.5)
			animations["icon_size_x_" .. i] = UIAnimation.init(UIAnimation.pulse_animation3, texture_size, 1, base_texture_size[1], base_texture_size[1] * 0.75, 10, 0.5)
			animations["icon_size_y_" .. i] = UIAnimation.init(UIAnimation.pulse_animation3, texture_size, 2, base_texture_size[2], base_texture_size[2] * 0.75, 10, 0.5)
			self._animation_callbacks["icon_color_a_" .. i] = function ()
				animations["fade_icon_color_a_" .. i] = UIAnimation.init(UIAnimation.function_by_time, icon_color, 1, icon_color[1], 0, 0.25, math.easeOutCubic)
				self._animation_callbacks["fade_icon_color_a_" .. i] = function ()
					self._selected_widget = nil
					selected_widget_content.activated = false
				end
			end
		end
	end

	if page_only then
		self._open_start_t = nil
		self._current_index = nil

		return
	end

	if not IS_WINDOWS then
		self._console_extension = self._ingame_ui_context.is_in_inn and "_inn" or ""
	end

	local gamepad_enabled = not IS_WINDOWS or Managers.input:is_device_active("gamepad")
	local start_lerp_time = gamepad_enabled and START_LERP_TIME_CONTROLLER or START_LERP_TIME
	local social_message_sent

	if self._world_marker_preview_id then
		Managers.state.event:trigger("remove_world_marker", self._world_marker_preview_id)

		self._world_marker_preview_id = nil
	end

	if self._valid_selection then
		if self._current_index == nil then
			local time_since_open = t - self._open_start_t
			local _, open_animation_duration = table.max(ANIMATION_TIMES.open)

			if time_since_open < open_animation_duration then
				social_message_sent = self:_ping_unit_attempt(target_unit, PingTypes.CONTEXT)
			end
		else
			local widget = self._selection_widgets[self._current_index]
			local widget_content = widget.content
			local settings = widget_content.settings
			local ping_type = settings.ping_type or PingTypes.CHAT_ONLY
			local social_wheel_event_id = NetworkLookup.social_wheel_events[settings.name]

			if target_unit and (self._world_markers_enabled or ping_type == PingTypes.PLAYER_PICK_UP) then
				social_message_sent = self:_ping_unit_attempt(target_unit, ping_type, social_wheel_event_id)
			elseif active_context.position and self._world_markers_enabled then
				social_message_sent = self:_ping_world_position_attempt(active_context.position, ping_type, social_wheel_event_id)
			elseif ping_type == PingTypes.LOCAL_ONLY then
				social_message_sent = self:_local_ping_attempt(social_wheel_event_id, target_unit)
			else
				social_message_sent = self:_social_message_attempt(social_wheel_event_id, target_unit)
			end
		end
	end

	if not social_message_sent then
		local event = SFX_EVENTS[self._side_name].CLOSE

		self:_play_sound(event)
	end

	self._active_context = nil

	self:_set_current_context(nil)

	self._open_start_t = nil
	self._current_index = nil

	self:_set_player_input_scale(1, start_lerp_time)
	self:_change_state("update_closed")

	local player_interactor_ext = ScriptUnit.extension(self._player.player_unit, "interactor_system")

	player_interactor_ext:enable_interactions(true)
end

VersusSocialWheelUI.is_active = function (self)
	return self._active_context ~= nil
end

VersusSocialWheelUI.on_player_joined_side = function (self, unique_id, local_player_id, side_id)
	local player = Managers.player:player_from_unique_id(unique_id)

	if player.local_player then
		local side = Managers.state.side:get_side(side_id)

		self._side_name = side:name()
	end
end

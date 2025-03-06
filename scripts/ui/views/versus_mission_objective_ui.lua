-- chunkname: @scripts/ui/views/versus_mission_objective_ui.lua

local definitions = local_require("scripts/ui/views/versus_mission_objective_ui_definitions")
local settings = DLCSettings.carousel
local animation_definitions = definitions.animation_definitions
local scenegraph_definition = definitions.scenegraph_definition
local side_colors = definitions.side_colors
local OBJECTIVE_MOVE_DURATION = 0.8
local MAX_VISIBLE_OBJECTIVE = 3
local OBJECTIVE_WIDTH_SPACING = 120
local BONUS_TIME_DURATION = 1
local DO_RELOAD = false
local RPCS = {
	"rpc_update_start_round_countdown_timer",
	"rpc_ui_round_started",
}

VersusMissionObjectiveUI = class(VersusMissionObjectiveUI)

VersusMissionObjectiveUI.init = function (self, parent, ingame_ui_context)
	local game_mode = Managers.state.game_mode:game_mode()

	self._active = Managers.state.game_mode:game_mode_key() == "versus" and not game_mode:in_training_mode()

	if not self._active then
		return
	end

	self._parent = parent
	self._ingame_ui_context = ingame_ui_context
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._input_manager = ingame_ui_context.input_manager

	local world = ingame_ui_context.world_manager:world("level_world")

	self._world = world
	self._wwise_world = Managers.world:wwise_world(world)
	self._animations = {}
	self._render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = true,
	}
	self._world_markers = {}
	self._selected_objective_index = 0
	self._objectives_widgets = {}

	self:_create_ui_elements()

	self._round_started = false
	self._objective_system = Managers.state.entity:system("objective_system")
	self._objectives_initialized = false

	self:_register_rpcs()
	self:_register_events()

	local _, custom_round_time_limit, custom_settings_enabled = Managers.mechanism:mechanism_try_call("get_custom_game_setting", "round_time_limit")

	if custom_settings_enabled and custom_round_time_limit then
		self._custom_round_timer_active = true
	end

	self._win_conditions = Managers.mechanism:game_mechanism():win_conditions()

	local game_mode_state = Managers.state.game_mode:game_mode():game_mode_state()
	local round_has_started = game_mode_state == "match_running_state" and true or nil

	if round_has_started then
		self:_on_round_started()
	end

	self._round_has_started = round_has_started
end

VersusMissionObjectiveUI._register_rpcs = function (self)
	local ingame_ui_context = self._ingame_ui_context
	local network_event_delegate = ingame_ui_context.network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))
end

VersusMissionObjectiveUI._unregister_rpcs = function (self)
	local ingame_ui_context = self._ingame_ui_context
	local network_event_delegate = ingame_ui_context.network_event_delegate

	network_event_delegate:unregister(self)
end

VersusMissionObjectiveUI._is_dark_pact = function (self)
	local party_id = self:_get_local_player_party_id()
	local party_manager = Managers.party
	local party = party_manager:get_party(party_id)
	local side = Managers.state.side.side_by_party[party]
	local is_dark_pact = side and side:name() == "dark_pact"

	return is_dark_pact
end

VersusMissionObjectiveUI._start_transition_animation = function (self, key, animation_name)
	local params = {
		wwise_world = self._wwise_world,
		render_settings = self._render_settings,
	}
	local widgets = self._widgets_by_name
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)

	self._animations[key] = anim_id
end

VersusMissionObjectiveUI._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)

	local widgets = {}
	local widgets_by_name = {}
	local widget_definitions = definitions.widget_definitions

	for name, definition in pairs(widget_definitions) do
		local widget = UIWidget.init(definition)

		widgets_by_name[name] = widget
		widgets[#widgets + 1] = widget
	end

	self._objective_text_widget = UIWidget.init(definitions.objective_text)
	self._widgets_by_name = widgets_by_name
	self._widgets = widgets
	self._objective_text_widget.content.visible = false
	DO_RELOAD = false

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
end

VersusMissionObjectiveUI.destroy = function (self)
	self:_unregister_rpcs()
	self:_unregister_events()

	self._ui_animator = nil
end

VersusMissionObjectiveUI.update = function (self, dt, t)
	if DO_RELOAD then
		self:_create_ui_elements()
	end

	if self._active then
		self:_update_round_start_timer(dt, t)
		self:_update_objectives(dt, t)
		self:_update_animations(dt, t)
		self:_update_score()
		self:_draw(dt)
	end
end

VersusMissionObjectiveUI._update_objectives = function (self, dt, t)
	if not self._objective_system:is_active() then
		return
	end

	self:_update_world_markers(dt, t)

	if not self._objectives_initialized then
		local local_player_party_id = self:_get_local_player_party_id()
		local side_name = self:_get_party_side_name(local_player_party_id)
		local is_hero = side_name == "heroes"
		local num_main_objectives = self._objective_system:num_main_objectives()

		self._num_main_objective = num_main_objectives

		self:_set_active_scoring_side_color(is_hero)

		self._objectives_initialized = true
	end

	local current_objective_index = self._objective_system:current_objective_index()
	local num_completed_main_objectives = self._objective_system:num_completed_main_objectives()

	if current_objective_index > self._selected_objective_index then
		self._selected_objective_index = current_objective_index

		self:_update_current_objective(current_objective_index)

		local description = "n/a"

		if not self:_is_dark_pact() then
			description = self._objective_system:first_active_objective_description()

			self:_set_objective_text(description)

			local params = {
				render_settings = self._render_settings,
			}
			local objective_widget = self._objective_text_widget

			self._ui_animator:start_animation("mission_start", objective_widget, scenegraph_definition, params)
		else
			description = Localize("level_objective_pactsworn")

			self:_set_objective_text(description)
		end
	end

	self:_update_objective_progress()
end

VersusMissionObjectiveUI._set_active_scoring_side_color = function (self, is_hero)
	local active_side_color = is_hero and Colors.get_color_table_with_alpha("local_player_team_lighter", 255) or Colors.get_color_table_with_alpha("opponent_team_lighter", 255)
	local objective_widget = self._widgets_by_name.objective

	objective_widget.content.is_hero = is_hero
	objective_widget.style.progress_bar.color = active_side_color
	objective_widget.style.objective_icon.color = active_side_color
end

VersusMissionObjectiveUI._update_current_objective = function (self)
	local objective_widget = self._widgets_by_name.objective
	local objective_icon = self._objective_system:current_objective_icon()

	objective_widget.content.objective_icon = objective_icon
end

VersusMissionObjectiveUI._update_objective_status = function (self, current_objective_index)
	if self._objectives_widgets then
		for i = 1, #self._objectives_widgets do
			local is_current_objective = i == current_objective_index
			local is_completed = i < current_objective_index
			local is_inactive = current_objective_index < i
			local widget = self._objectives_widgets[i]
			local style = widget.style
			local content = widget.content
			local objective_progress = is_current_objective and self._objective_system:current_objective_progress() or 0

			content.objective_progress = objective_progress
			content.current_objective = is_current_objective
			content.is_inactive = is_inactive
			content.completed = is_completed
		end
	end
end

VersusMissionObjectiveUI._set_round_text = function (self)
	local round_text = self._widgets_by_name.round_text
	local content = round_text.content
	local rounds = self:_get_round_count()

	content.text = string.format("Round: %d", rounds)
end

VersusMissionObjectiveUI._get_round_count = function (self)
	local mechanism = Managers.mechanism:game_mechanism()
	local win_conditions = mechanism:win_conditions()
	local round_count = win_conditions:get_current_round()

	return round_count
end

VersusMissionObjectiveUI._update_score = function (self)
	local local_player_party_id = self:_get_local_player_party_id()
	local opponent_party_id = self:_get_opponent_party_id()
	local objective_widget = self._widgets_by_name.objective

	objective_widget.content.team_1_score = self._win_conditions:get_total_score(local_player_party_id)
	objective_widget.content.team_2_score = self._win_conditions:get_total_score(opponent_party_id)
end

VersusMissionObjectiveUI._get_party_side_name = function (self, party_id)
	local local_player_party = Managers.party:get_party(party_id)
	local side = Managers.state.side.side_by_party[local_player_party]
	local side_name = side:name()

	return side_name
end

VersusMissionObjectiveUI._get_local_player_party_id = function (self)
	local peer_id = Network.peer_id()
	local party_manager = Managers.party
	local local_player_id = 1
	local player_status = party_manager:get_player_status(peer_id, local_player_id)
	local party_id = player_status.party_id

	return party_id
end

VersusMissionObjectiveUI._get_opponent_party_id = function (self)
	return self:_get_local_player_party_id() == 1 and 2 or 1
end

VersusMissionObjectiveUI._reset_timer_size = function (self)
	local timer_widget = self._widgets_by_name.timer_text
	local timer_widget_style = timer_widget.style
	local default_font_size = timer_widget_style.text.default_font_size

	timer_widget_style.text.font_size = default_font_size
	timer_widget_style.text_shadow.font_size = default_font_size
end

VersusMissionObjectiveUI._set_objective_bar_end = function (self, fraction)
	self._widgets_by_name.progress_bar.content.disabled_progress_bar = fraction
end

VersusMissionObjectiveUI._play_sound = function (self, event)
	WwiseWorld.trigger_event(self._wwise_world, event)
end

VersusMissionObjectiveUI._update_animations = function (self, dt, t)
	local animations = self._animations
	local ui_animator = self._ui_animator

	ui_animator:update(dt)

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil

			if animation_name == "announcement" then
				self._bonus_time_timer = BONUS_TIME_DURATION
			end
		end
	end
end

VersusMissionObjectiveUI._update_round_start_timer = function (self, dt, t)
	if self._round_has_started then
		return
	end

	if self._countdown_timer and self._countdown_timer <= 0 then
		self:_set_round_starting_text()
	end
end

VersusMissionObjectiveUI._set_pre_round_timer = function (self, time_left)
	local widget = self._widgets_by_name.objective

	widget.content.pre_round_timer = time_left

	if time_left <= 10 and time_left > 0 then
		local tick_sound = settings.versus_round_start_safe_zone_countdown_tick[time_left]

		self:_play_sound(tick_sound)
	end

	self._countdown_timer = time_left
end

VersusMissionObjectiveUI.set_round_timer = function (self, time_left)
	local widget = self._widgets_by_name.objective

	widget.content.pre_round_timer = time_left
end

VersusMissionObjectiveUI._set_round_starting_text = function (self)
	local widget = self._widgets_by_name.round_starting_text

	widget.content.text = "Round Starting..."
end

VersusMissionObjectiveUI._draw = function (self, dt)
	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_manager = self._input_manager
	local input_service = input_manager:get_service("ingame_menu")
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

	if self._objectives_widgets and self._round_has_started then
		UIRenderer.draw_all_widgets(ui_renderer, self._objectives_widgets)
	end

	if self._objective_text_widget then
		render_settings.alpha_multiplier = self._objective_text_widget.alpha_multiplier or alpha_multiplier

		UIRenderer.draw_widget(ui_renderer, self._objective_text_widget)
	end

	UIRenderer.end_pass(ui_renderer)

	render_settings.alpha_multiplier = alpha_multiplier
end

VersusMissionObjectiveUI._set_objective_text = function (self, text)
	local widgets_by_name = self._widgets_by_name
	local widget = self._objective_text_widget
	local content = widget.content
	local style = widget.style

	content.area_text_content = text

	local ui_renderer = self.ui_renderer
	local max_width, max_height = 287.5, 40

	content.text_height = 45
end

VersusMissionObjectiveUI._format_timer = function (self, time)
	if not time and not (time <= 0) then
		return "00:00"
	end

	return string.format("%02d:%02d", math.floor(time / 60), time % 60)
end

local new_world_marker_targets = {}
local handled_marker_targets_this_frame = {}

VersusMissionObjectiveUI._update_world_markers = function (self, dt, t)
	local selected_objective_index = self._selected_objective_index

	if selected_objective_index < 1 then
		return
	end

	if not self._round_has_started then
		return
	end

	table.clear(handled_marker_targets_this_frame)

	local current_world_markers = self._world_markers
	local new_world_marker_n = self:_get_world_marker_targets(new_world_marker_targets)

	for i = 1, new_world_marker_n do
		local unit = new_world_marker_targets[i]

		handled_marker_targets_this_frame[unit] = true

		if not current_world_markers[unit] then
			self:_request_world_marker(unit)
		end
	end

	for unit, marker_id in pairs(current_world_markers) do
		if not handled_marker_targets_this_frame[unit] then
			current_world_markers[unit] = nil

			self:_remove_world_marker(marker_id)
		end
	end
end

VersusMissionObjectiveUI._get_world_marker_targets = function (self, out_tbl)
	local local_player = Managers.player:local_player()
	local viewport_name = local_player.viewport_name
	local viewport = ScriptWorld.viewport(self._world, viewport_name)
	local camera = ScriptViewport.camera(viewport)
	local camera_position = ScriptCamera.position(camera)
	local target_n = 0
	local closest_unit
	local closest_dist = math.huge
	local objective_system = self._objective_system
	local leaf_objectives = objective_system:active_leaf_objectives()

	for i = 1, #leaf_objectives do
		local objective_name = leaf_objectives[i]
		local extension = objective_system:extension_by_objective_name(objective_name)
		local unit = extension:unit()

		if Unit.alive(unit) then
			local unit_position = Unit.local_position(unit, 0)
			local distance = Vector3.distance_squared(camera_position, unit_position)

			if distance < closest_dist then
				closest_unit = unit
				closest_dist = distance
			end

			if extension:always_show_objective_marker() then
				target_n = target_n + 1
				out_tbl[target_n] = unit
			end
		end
	end

	local has_closest_already = false

	for i = 1, target_n do
		if out_tbl[i] == closest_unit then
			has_closest_already = true

			break
		end
	end

	if closest_unit and not has_closest_already then
		target_n = target_n + 1
		out_tbl[target_n] = closest_unit
	end

	return target_n
end

VersusMissionObjectiveUI._remove_world_marker = function (self, world_maker_id)
	Managers.state.event:trigger("remove_world_marker", world_maker_id)
end

VersusMissionObjectiveUI._request_world_marker = function (self, objective_unit)
	local event_manager = Managers.state.event
	local marker_type = "versus_objective"
	local cb = callback(self, "cb_world_marker_spawned", objective_unit)

	if ScriptUnit.has_extension(objective_unit, "payload_system") then
		event_manager:trigger("add_world_marker_unit", marker_type, objective_unit, cb)
	else
		local position = Unit.world_position(objective_unit, 0)

		event_manager:trigger("add_world_marker_position", marker_type, position, cb)
	end
end

VersusMissionObjectiveUI.cb_world_marker_spawned = function (self, objective_unit, marker_id)
	self._world_markers[objective_unit] = marker_id
end

VersusMissionObjectiveUI.rpc_update_start_round_countdown_timer = function (self, channel_id, time_left)
	time_left = math.round(time_left)

	Managers.state.event:trigger("ui_update_start_round_counter", time_left)
	Managers.state.event:trigger("ui_tab_update_start_round_counter", time_left)
end

VersusMissionObjectiveUI.rpc_ui_round_started = function (self, channel_id)
	self:_on_round_started()
	Managers.state.event:trigger("ui_tab_round_started")
end

VersusMissionObjectiveUI._on_round_started = function (self)
	self._round_has_started = true

	local round_start_timer_widget = self._widgets_by_name.round_start_timer
	local round_starting_text_widget = self._widgets_by_name.round_starting_text
	local obj_text_widget = self._objective_text_widget
	local objective_widget = self._widgets_by_name.objective
	local remove_timer = not self._custom_round_timer_active

	round_start_timer_widget.content.visible = false
	round_starting_text_widget.content.visible = false
	obj_text_widget.content.visible = true
	objective_widget.content.pre_round_timer_done = remove_timer
	objective_widget.style.pre_round_timer.font_size = remove_timer and 50 or 32

	if not remove_timer then
		local widget = self._widgets_by_name.objective

		widget.content.pre_round_timer = ""
	end

	local params = {
		wwise_world = self._wwise_world,
		render_settings = self._render_settings,
	}

	self._ui_animator:start_animation("mission_start", obj_text_widget, scenegraph_definition, params)
	self:_play_sound("menu_versus_match_start")
end

VersusMissionObjectiveUI._register_events = function (self)
	local event_manager = Managers.state.event

	if event_manager then
		event_manager:register(self, "ui_update_start_round_counter", "update_start_round_counter")
		event_manager:register(self, "ui_update_round_timer", "set_round_timer")
		event_manager:register(self, "ui_round_started", "round_started")
	end
end

VersusMissionObjectiveUI._unregister_events = function (self)
	local event_manager = Managers.state.event

	if event_manager then
		event_manager:unregister("ui_update_start_round_counter", self)
		event_manager:unregister("ui_update_round_timer", self)
		event_manager:unregister("ui_round_started", self)
	end
end

VersusMissionObjectiveUI.update_start_round_counter = function (self, time_left)
	self:_set_pre_round_timer(time_left)
end

VersusMissionObjectiveUI.round_started = function (self)
	self:_on_round_started()
end

VersusMissionObjectiveUI._update_objective_progress = function (self)
	local progress = self._objective_system:current_objective_progress() or 0
	local starting_degrees = 0
	local degrees = 360 - starting_degrees * 2
	local alpha = 255 * math.min(progress * 2, 1)
	local current_degrees = starting_degrees + degrees * progress
	local degrees_progress = current_degrees / 360
	local widgets_by_name = self._widgets_by_name
	local objective_widget = widgets_by_name.objective

	objective_widget.style.progress_bar.gradient_threshold = degrees_progress

	if progress == 1 then
		return true
	end
end

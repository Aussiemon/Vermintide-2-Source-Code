-- chunkname: @scripts/ui/hud_ui/gameplay_info_ui.lua

local definitions = local_require("scripts/ui/hud_ui/gameplay_info_ui_definitions")
local scenegraph_definition = definitions.scenegraph
local widget_definitions = definitions.widgets
local spawn_info_widgets_defintions = definitions.spawn_info_widgets
local animation_definitions = definitions.animation_definitions

GameplayInfoUI = class(GameplayInfoUI)

GameplayInfoUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self._ui_renderer = ingame_ui_context.ui_renderer
	self._render_settings = {
		alpha_multiplier = 1,
		snap_pixel_positions = true,
	}
	self._first_time = true
	self._world = ingame_ui_context.world_manager:world("level_world")
	self._wwise_world = Managers.world:wwise_world(self._world)

	self:_create_ui_elements()

	local event_manager = Managers.state.event

	event_manager:register(self, "add_gameplay_info_event", "add_gameplay_info_event", "update_range_to_spawn", "on_update_range_to_spawn")
end

GameplayInfoUI.add_gameplay_info_event = function (self, event_type, show, reason, target_unit)
	self._active_event = event_type
	self._active_reason = reason
	self._show = show
	self._target_unit = target_unit

	self:_update_button_prompts()

	if self._first_time then
		-- Nothing
	end
end

GameplayInfoUI._update_spawn_info_texts = function (self, state_text, sub_text, frame_color)
	local spawn_text = self._widgets_by_name.spawn_text
	local spawn_reason = self._widgets_by_name.spawn_reason

	spawn_text.content.text = state_text and state_text or ""
	spawn_text.content.visible = state_text ~= nil
	spawn_reason.content.text = sub_text and sub_text or ""
	spawn_reason.content.visible = sub_text ~= nil
end

GameplayInfoUI._update_selected_career_data = function (self)
	local career_name, picking_image = self:_get_current_selected_career_data()
	local widget = self._widgets_by_name.spawn_help
	local content = widget.content

	content.portrait = picking_image
	content.pick_name = Localize(career_name)
end

GameplayInfoUI._update_button_prompts = function (self)
	local event = self._active_event
	local reason = self._active_reason

	if not self._show then
		return
	end

	if not event then
		return
	end

	local input_service_name, input_action, spawn_state_text, prefix_color, frame_color, sub_text
	local hide = false

	if event == "ghost_spawn" then
		input_service_name = "Player"
		input_action = "ghost_mode_exit"

		local input_text_format = "$KEY;%s__%s:"
		local input_service = Managers.input:get_service(input_service_name)
		local _, input_text, keymap_binding = UISettings.get_gamepad_input_texture_data(input_service, input_action, self._gamepad_active)
		local spawn_input_text = ""

		if self._gamepad_active then
			spawn_input_text = string.format(input_text_format, input_service_name, input_action)
		elseif keymap_binding and keymap_binding[1] == "mouse" or self._gamepad_active then
			spawn_input_text = string.format(input_text_format, input_service_name, input_action)
		else
			spawn_input_text = input_text and "{#color(193,91,36)}[" .. input_text .. "] {#reset()}" or ""
		end

		spawn_state_text = string.format(Localize("versus_gameplay_info_spawn_here"), spawn_input_text)
		frame_color = {
			175,
			0,
			255,
			0,
		}
	elseif event == "ghost_cantspawn" then
		prefix_color = {
			175,
			141,
			141,
			141,
		}
		frame_color = {
			175,
			141,
			141,
			141,
		}
		spawn_state_text = string.format(Localize("versus_gameplay_info_unable_to_spawn"), prefix_color[2], prefix_color[3], prefix_color[4], prefix_color[1])

		if reason == "range" then
			sub_text = Localize("vs_spawning_hero_range")
			sub_text = sub_text .. self._range or 20
		elseif reason == "los" then
			sub_text = Localize("vs_spawning_hero_los")
		elseif reason == "start_zone" then
			sub_text = Localize("vs_spawning_hero_start_zone")
		elseif reason == "transport" then
			sub_text = Localize("vs_spawning_hero_transport")
		elseif reason == "w8_to_spawn" then
			sub_text = Localize("vs_spawning_w8_to_spawn")
		elseif reason == "in_safe_zone" then
			sub_text = "Can't spawn in hero safe zone"
		else
			sub_text = Localize("vs_spawning_w8_to_spawn")
		end
	elseif event == "ghost_catchup" then
		self:_update_catchup_tele_prompt()

		return
	elseif event == "hide_teleport" then
		hide = true
		input_service_name = "Player"
		input_action = "ghost_mode_enter"

		local tele_text = ""

		self:_set_tele_prompt(input_service_name, input_action, tele_text, nil, prefix_color, hide)

		return
	elseif event == "hide_text" then
		hide = true
	end

	self:_update_spawn_info_texts(spawn_state_text, sub_text, frame_color)
end

GameplayInfoUI._set_sub_text = function (self, text)
	local widgets_by_name = self._widgets_by_name
	local widget = widgets_by_name.ghost_mode_text_sub

	widget.content.text = text or ""
	widget.content.visible = text ~= nil
end

GameplayInfoUI._create_ui_elements = function (self)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
	self._animations = {}

	local widgets = {}
	local widgets_by_name = {}
	local spawn_info_widgets = {}

	for name, definition in pairs(widget_definitions) do
		local widget = UIWidget.init(definition)

		widgets_by_name[name] = widget
		widgets[#widgets + 1] = widget
	end

	for name, definition in pairs(spawn_info_widgets_defintions) do
		local widget = UIWidget.init(definition)

		widgets_by_name[name] = widget
		spawn_info_widgets[#spawn_info_widgets + 1] = widget
	end

	self._widgets = widgets
	self._spawn_info_widgets = spawn_info_widgets
	self._widgets_by_name = widgets_by_name

	UIRenderer.clear_scenegraph_queue(self._ui_renderer)
end

GameplayInfoUI.destroy = function (self)
	local event_manager = Managers.state.event

	event_manager:unregister("add_gameplay_info_event", self)
	event_manager:unregister("update_range_to_spawn", self)
end

GameplayInfoUI.on_update_range_to_spawn = function (self, range)
	range = math.max(range, 1)
	self._range = string.format("%2dm", range)

	self:_update_button_prompts()
end

GameplayInfoUI.update = function (self, dt, t)
	local animations = self._animations
	local ui_animator = self._ui_animator
	local gamepad_active = Managers.input:is_device_active("gamepad")

	if gamepad_active ~= self._gamepad_active then
		self._gamepad_active = gamepad_active

		self:_update_button_prompts()
		self:_update_catchup_tele_prompt()
	end

	ui_animator:update(dt)

	for event_id, animation_data in pairs(animations) do
		local animation_id = animation_data.id

		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			self._animations[event_id] = nil
		end
	end

	self:_draw(dt)
end

GameplayInfoUI._draw = function (self, dt)
	if not self._show then
		return
	end

	local ui_renderer = self._ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local input_service = Managers.input:get_service("ingame_menu")
	local render_settings = self._render_settings

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	for _, widget in ipairs(self._widgets) do
		UIRenderer.draw_widget(ui_renderer, widget)
	end

	local player_unit = Managers.player:local_player().player_unit
	local ghost_mode_extension = player_unit and ScriptUnit.has_extension(player_unit, "ghost_mode_system")
	local is_in_ghost_mode = ghost_mode_extension and ghost_mode_extension:is_in_ghost_mode()

	if is_in_ghost_mode then
		for _, widget in ipairs(self._spawn_info_widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_renderer)
end

GameplayInfoUI._set_tele_prompt = function (self, input_service_name, input_action, suffix_text, prefix_text, prefix_color, hide)
	local widgets_by_name = self._widgets_by_name
	local ui_scenegraph = self._ui_scenegraph
	local input_manager = Managers.input
	local ui_renderer = self._ui_renderer
	local input_service = input_service_name and input_manager:get_service(input_service_name)
	local gamepad_active = input_manager:is_device_active("gamepad")
	local teleport_text_widget = widgets_by_name.teleport_text
	local texture_data, input_text

	if input_action and not hide then
		texture_data, input_text = UISettings.get_gamepad_input_texture_data(input_service, input_action, gamepad_active)
	end

	local str = " %s %s "
	local input_string = ""

	if gamepad_active then
		input_string = "$KEY;" .. input_service_name .. "__" .. input_action .. ":"
	else
		input_string = input_text and "{#color(193,91,36)}[" .. input_text .. "] {#reset()}" or ""
	end

	teleport_text_widget.content.text = string.format(str, input_string, suffix_text)
	teleport_text_widget.content.visible = not hide
end

GameplayInfoUI._start_animation = function (self, animation_name, id, widget)
	local params = {
		wwise_world = self._wwise_world,
		render_settings = self._render_settings,
		ui_scenegraph = self._ui_scenegraph,
	}
	local animation_id = self._ui_animator:start_animation(animation_name, widget, scenegraph_definition, params)

	self._animations[id] = {
		id = animation_id,
		name = animation_name,
	}
end

GameplayInfoUI._update_catchup_tele_prompt = function (self)
	local input_service_name = "Player"
	local input_action = "ghost_mode_enter"
	local tele_text = Localize("vs_spawning_ghost_catchup")

	self:_set_tele_prompt(input_service_name, input_action, tele_text)
end

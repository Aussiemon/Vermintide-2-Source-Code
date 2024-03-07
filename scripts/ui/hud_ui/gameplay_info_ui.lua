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
	self._input_manager = ingame_ui_context.input_manager
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
	self:_update_selected_career_data()

	if self._first_time then
		local info_help = self._widgets_by_name.info_help

		self:_start_animation("on_enter", "help_widget_on_enter", info_help)

		self._first_time = false
	end
end

GameplayInfoUI._update_spawn_info_texts = function (self, state_text, sub_text, frame_color)
	local widget = self._widgets_by_name.spawn_help
	local content = widget.content
	local style = widget.style

	content.spawn_state_text = state_text and state_text or ""
	style.spawn_state_text.text_color[1] = state_text ~= nil and 255 or 0
	content.fail_reason_text = sub_text and sub_text or ""
	style.fail_reason_text.text_color[1] = sub_text ~= nil and 255 or 0
	style.glow_frame.color = frame_color and frame_color or {
		255,
		255,
		255,
		255,
	}
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

		local input_text = "$KEY;" .. input_service_name .. "__" .. input_action .. ":"

		spawn_state_text = string.format(Localize("versus_gameplay_info_spawn_here"), input_text)
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
		end
	elseif event == "ghost_catchup" then
		if not self._target_unit then
			return false
		end

		local career_name = ScriptUnit.extension(self._target_unit, "career_system"):career_name()

		input_service_name = "Player"
		input_action = "ghost_mode_enter"

		local tele_text = string.format(Localize("vs_spawning_ghost_catchup"), Localize(career_name))

		self:_set_tele_prompt(input_service_name, input_action, tele_text)

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
	local input_manager = self._input_manager
	local gamepad_active = input_manager:is_device_active("gamepad")

	if gamepad_active ~= self._gamepad_active then
		self._gamepad_active = gamepad_active

		self:_update_button_prompts()
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
	local input_service = self._input_manager:get_service("ingame_menu")
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
	local input_manager = self._input_manager
	local ui_renderer = self._ui_renderer
	local input_service = input_service_name and input_manager:get_service(input_service_name)
	local gamepad_active = input_manager:is_device_active("gamepad")
	local widget_input = widgets_by_name.teleport_text_input
	local widget_suffix = widgets_by_name.teleport_text
	local widget_background = widgets_by_name.teleport_background
	local texture_data, input_text

	if input_action and not hide then
		texture_data, input_text = UISettings.get_gamepad_input_texture_data(input_service, input_action, gamepad_active)

		if texture_data and is_array(texture_data) then
			texture_data = nil
		end
	end

	widget_suffix.content.text = suffix_text or ""

	if not texture_data then
		widget_input.content.text = input_text and " [" .. input_text .. "] " or ""
	elseif texture_data.texture then
		widget_input.content.text = ""
		widget_suffix.content.text = " " .. widget_suffix.content.text
	end

	local font_input, scaled_font_input_size = UIFontByResolution(widget_input.style.text)
	local font_suffix, scaled_font_size_suffix = UIFontByResolution(widget_suffix.style.text)
	local text_input = widget_input.content.text
	local text_suffix = widget_suffix.content.text
	local text_width_input = UIRenderer.text_size(ui_renderer, text_input, font_input[1], scaled_font_input_size)
	local text_width_suffix = UIRenderer.text_size(ui_renderer, text_suffix, font_suffix[1], scaled_font_size_suffix)
	local total_length = text_width_input + text_width_suffix
	local offset = -(total_length * 0.5)
	local suffix_offset = offset + text_width_input

	widget_suffix.style.text.offset[1] = suffix_offset
	widget_suffix.style.text_shadow.offset[1] = suffix_offset + 2

	if not texture_data then
		widget_input.style.text.offset[1] = offset
		widget_input.style.text_shadow.offset[1] = offset + 2
	end

	local background_scenegraph_id = widget_background.scenegraph_id

	ui_scenegraph[background_scenegraph_id].size[1] = hide and 0 or total_length + 20
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

GameplayInfoUI._get_current_selected_career_data = function (self)
	if not Managers then
		return nil
	end

	if not Managers.player then
		return nil
	end

	if not SPProfiles then
		return nil
	end

	local local_player = Managers.player:local_player()

	if not local_player then
		return nil
	end

	local career_index = local_player:career_index()
	local profile_index = local_player:profile_index()
	local current_profile = SPProfiles[profile_index]
	local current_career = current_profile.careers[career_index]
	local display_name = current_career.display_name or "not_assigned"
	local picking_image = current_career.picking_image or "icons_placeholder"

	return display_name, picking_image
end

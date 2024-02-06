-- chunkname: @scripts/ui/hud_ui/floating_icon_ui.lua

local definitions = local_require("scripts/ui/hud_ui/floating_icon_ui_definitions")
local animation_definitions = definitions.animation_definitions
local widget_definitions = definitions.widget_definitions
local scenegraph_definition = definitions.scenegraph_definition

FloatingIconUI = class(FloatingIconUI)

FloatingIconUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.input_manager = ingame_ui_context.input_manager
	self.world_manager = ingame_ui_context.world_manager
	self.camera_manager = ingame_ui_context.camera_manager
	self.player_manager = ingame_ui_context.player_manager
	self.peer_id = ingame_ui_context.peer_id

	local world = self.world_manager:world("level_world")

	self.wwise_world = Managers.world:wwise_world(world)
	self._animations = {}
	self.render_settings = {
		snap_pixel_positions = true,
	}

	self:create_ui_elements()
	Managers.state.event:register(self, "start_progression_zone", "show_progression_bar")
	Managers.state.event:register(self, "stop_progression_zone", "hide_progression_bar")
end

local DO_RELOAD = true

FloatingIconUI.create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)

	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		if widget_definition then
			local widget = UIWidget.init(widget_definition)

			widgets[#widgets + 1] = widget
			widgets_by_name[name] = widget
		end
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name

	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	DO_RELOAD = false
end

FloatingIconUI.destroy = function (self)
	self.ui_animator = nil

	if Managers.state.event then
		Managers.state.event:unregister("start_progression_zone", self)
		Managers.state.event:unregister("stop_progression_zone", self)
	end
end

FloatingIconUI.show_progression_bar = function (self, unit, extension)
	if self._progress_unit and self._progress_unit == unit then
		return
	end

	self._progress_unit = unit
	self._progress_extension = extension
end

FloatingIconUI.hide_progression_bar = function (self, unit)
	if self._progress_unit == unit then
		self._progress_unit = nil
		self._progress_extension = nil
	end
end

FloatingIconUI.update = function (self, dt)
	if DO_RELOAD then
		self:create_ui_elements()
	end

	if self._progress_unit then
		self:_draw_progressbar(dt)
	end
end

FloatingIconUI._draw_progressbar = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("ingame_menu")
	local render_settings = self.render_settings

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local fulfill_show_bar_personal = self._progress_extension:progress_bar_personal() and self._progress_extension:player_been_in_zone()
	local fulfill_show_bar = self._progress_extension:progress_bar_global() or fulfill_show_bar_personal

	if fulfill_show_bar_personal or fulfill_show_bar then
		local progress = self._progress_extension:progress()

		if self._progress_extension:should_progress_count_down() then
			progress = 1 - self._progress_extension:progress()
		end

		self:_draw(self._progress_unit, progress, dt)
	end

	UIRenderer.end_pass(ui_renderer)
end

FloatingIconUI._get_camera = function (self)
	local viewport_name = "player_1"

	if self.camera_manager:has_viewport(viewport_name) then
		local world_name = "level_world"
		local world_manager = self.world_manager

		if world_manager:has_world(world_name) then
			local world = world_manager:world(world_name)
			local viewport = ScriptWorld.viewport(world, viewport_name)

			return ScriptViewport.camera(viewport)
		end
	end
end

FloatingIconUI._get_player_rotation_and_position = function (self)
	local first_person_extension = self:get_player_first_person_extension()
	local player_position = first_person_extension:current_position()
	local player_rotation = first_person_extension:current_rotation()

	return player_position, player_rotation
end

FloatingIconUI._set_widget_position = function (self, widget, x, y)
	local offset = widget.offset

	offset[1] = x
	offset[2] = y
end

FloatingIconUI._set_bar_progress = function (self, widget, progress, dt)
	local style = widget.style
	local foreground_style = style.foreground
	local default_foreground_size = foreground_style.default_size
	local foreground_size = foreground_style.texture_size

	foreground_size[1] = math.floor(default_foreground_size[1] * progress)
end

FloatingIconUI._draw = function (self, unit, progress, dt)
	local ui_renderer = self.ui_renderer
	local widget = self._widgets_by_name.progress_bar

	self:_set_bar_progress(widget, progress, dt)

	local position_x = 100
	local position_y = 100

	self:_set_widget_position(widget, position_x, position_y)
	UIRenderer.draw_widget(ui_renderer, widget)
end

FloatingIconUI.convert_world_to_screen_position = function (self, camera, world_position)
	if camera then
		local world_to_screen = Camera.world_to_screen(camera, world_position)

		return world_to_screen.x, world_to_screen.y
	end
end

FloatingIconUI.get_floating_icon_position = function (self, screen_pos_x, screen_pos_y, forward_dot, right_dot, tooltip_settings)
	local root_size = UISceneGraph.get_size_scaled(self.ui_scenegraph, "screen")
	local scale = RESOLUTION_LOOKUP.scale
	local scaled_root_size_x = root_size[1] * scale
	local scaled_root_size_y = root_size[2] * scale
	local scaled_root_size_x_half = scaled_root_size_x * 0.5
	local scaled_root_size_y_half = scaled_root_size_y * 0.5
	local screen_width, screen_height = RESOLUTION_LOOKUP.res_w, RESOLUTION_LOOKUP.res_h
	local center_pos_x = screen_width / 2
	local center_pos_y = screen_height / 2
	local x_diff = screen_pos_x - center_pos_x
	local y_diff = center_pos_y - screen_pos_y
	local is_x_clamped = false
	local is_y_clamped = false

	if math.abs(x_diff) > scaled_root_size_x_half * 0.9 then
		is_x_clamped = true
	end

	if math.abs(y_diff) > scaled_root_size_y_half * 0.9 then
		is_y_clamped = true
	end

	local clamped_x_pos = screen_pos_x
	local clamped_y_pos = screen_pos_y
	local is_behind = forward_dot < 0 and true or false
	local is_clamped = not (not is_x_clamped and not is_y_clamped) and true or false
	local screen_pos_diff_x = screen_width - scaled_root_size_x
	local screen_pos_diff_y = screen_height - scaled_root_size_y

	clamped_x_pos = clamped_x_pos - screen_pos_diff_x / 2
	clamped_y_pos = clamped_y_pos - screen_pos_diff_y / 2

	local inverse_scale = RESOLUTION_LOOKUP.inv_scale

	clamped_x_pos = clamped_x_pos * inverse_scale
	clamped_y_pos = clamped_y_pos * inverse_scale

	return clamped_x_pos, clamped_y_pos, is_clamped, is_behind
end

FloatingIconUI.get_icon_size = function (self, position, player_position, current_size, original_size, tooltip_settings)
	local size = original_size
	local start_scale_distance = tooltip_settings.start_scale_distance
	local end_scale_distance = tooltip_settings.end_scale_distance
	local distance = Vector3.distance(position, player_position)
	local icon_scale = 1

	if start_scale_distance < distance then
		icon_scale = self:icon_scale_by_distance(distance - start_scale_distance, end_scale_distance)
		size = math.lerp(current_size, icon_scale * original_size, 0.2)
	end

	return size, icon_scale
end

FloatingIconUI.icon_scale_by_distance = function (self, current_distance, max_distance)
	local distance = math.min(max_distance, current_distance)

	distance = math.max(0, distance)

	local min_scale = UISettings.tutorial.mission_tooltip.minimum_icon_scale
	local scale = math.max(min_scale, 1 - distance / max_distance)

	return scale
end

FloatingIconUI.get_player_first_person_extension = function (self)
	if self._first_person_extension then
		return self._first_person_extension
	else
		local peer_id = self.peer_id
		local my_player = self.player_manager:player_from_peer_id(peer_id)
		local player_unit = my_player.player_unit

		if player_unit and ScriptUnit.has_extension(player_unit, "first_person_system") then
			local first_person_extension = ScriptUnit.extension(player_unit, "first_person_system")

			self._first_person_extension = first_person_extension

			return first_person_extension
		end
	end
end

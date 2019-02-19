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
	self.saved_mission_objectives = {}
	self.completed_mission_objectives = {}
	self.current_mission_objective = nil
	self.index_count = 0
	self._animations = {}
	self.render_settings = {
		snap_pixel_positions = true
	}

	self:create_ui_elements()
	rawset(_G, "floating_icon_ui", self)
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

	rawset(_G, "floating_icon_ui", nil)
end

FloatingIconUI.update = function (self, dt)
	if DO_RELOAD then
		self:create_ui_elements()

		self.active_floating_name = nil
		self.mission_tooltip_animation_in_time = nil
	end

	self:draw(dt)
end

FloatingIconUI.draw = function (self, dt)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("ingame_menu")
	local render_settings = self.render_settings

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local widgets = self._widgets

	if widgets then
		for _, widget in ipairs(widgets) do
			UIRenderer.draw_widget(ui_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_renderer)
end

FloatingIconUI.sync_active_missions = function (self, dt)
	local peer_id = self.peer_id
	local my_player = self.player_manager:player_from_peer_id(peer_id)
	local player_unit = my_player.player_unit

	if not player_unit then
		return
	end

	local tutorial_extension = ScriptUnit.extension(player_unit, "tutorial_system")
	self.mission_tutorial_tooltip_to_update = nil

	if tutorial_extension then
		local objective_tooltips = tutorial_extension.objective_tooltips

		self:update_objective_icon(objective_tooltips, player_unit, dt)
	end
end

local center_position = {
	scenegraph_definition.screen.size[1] * 0.5,
	scenegraph_definition.screen.size[2] * 0.5
}

FloatingIconUI.update_objective_icon = function (self, data, player_unit, dt)
	local ui_scenegraph = self.ui_scenegraph
	local widget = self._widgets_by_name.default
	local content = widget.content
	local style = widget.style
	local mission_tooltip_settings = UISettings.tutorial.mission_tooltip
	local tooltip_name = data.name
	local active_floating_name = self.active_floating_name
	local first_update = false

	if not active_floating_name or active_floating_name ~= tooltip_name then
		local active_template = TutorialTemplates[tooltip_name]
		local text = (active_template.text and Localize(active_template.text)) or ""
		content.text = "yolo"
		self.active_floating_name = tooltip_name
		content.texture_id = (active_template.icon and active_template.icon) or "hud_tutorial_icon_info"
		style.texture_id.color[1] = 255
		style.arrow.color[1] = 255
		first_update = true
	end

	local objective_unit = data.unit

	if not objective_unit or not Unit.alive(objective_unit) or not Unit.alive(player_unit) then
		return
	end

	local objective_unit_position = Unit.world_position(objective_unit, 0) + Vector3.up()
	local first_person_extension = self:get_player_first_person_extension()
	local player_position = first_person_extension:current_position()
	local player_rotation = first_person_extension:current_rotation()
	local player_direction_forward = Quaternion.forward(player_rotation)
	player_direction_forward = Vector3.normalize(Vector3.flat(player_direction_forward))
	local player_direction_right = Quaternion.right(player_rotation)
	player_direction_right = Vector3.normalize(Vector3.flat(player_direction_right))
	local offset = objective_unit_position - player_position
	local direction = Vector3.normalize(Vector3.flat(offset))
	local forward_dot = Vector3.dot(player_direction_forward, direction)
	local right_dot = Vector3.dot(player_direction_right, direction)
	local x_pos, y_pos = self:convert_world_to_screen_position(camera, objective_unit_position)
	local x, y, is_clamped, is_behind = self:get_floating_icon_position(x_pos, y_pos, forward_dot, right_dot, objective_tooltip_settings)

	if is_clamped or is_behind then
		if not self.mission_tooltip_animation_in_time then
			local arrow_size = ui_scenegraph.tooltip_mission_arrow.size
			local icon_size = ui_scenegraph.tooltip_mission_icon.size
			local height_from_center = y_pos - center_position[2]
			local arrow_angle, offset_x, offset_y, offset_z = self:get_arrow_angle_and_offset(forward_dot, right_dot, arrow_size, icon_size, height_from_center)

			if offset_x ~= nil then
				local offset = style.arrow.offset
				offset[1] = offset_x
				offset[2] = offset_y
				offset[3] = offset_z
			end

			style.arrow.angle = arrow_angle
		end
	else
		style.arrow.color[1] = 0
	end

	local use_screen_position = not is_clamped and not is_behind

	if use_screen_position then
		local current_size = ui_scenegraph.tooltip_mission_icon.size[1]
		local original_size = definitions.FLOATING_ICON_SIZE[1]
		local new_icon_size = self:get_icon_size(objective_unit_position, player_position, current_size, original_size, mission_tooltip_settings)
		ui_scenegraph.tooltip_mission_icon.size[1] = new_icon_size
		ui_scenegraph.tooltip_mission_icon.size[2] = new_icon_size
	else
		local original_size = definitions.FLOATING_ICON_SIZE[1]
		ui_scenegraph.tooltip_mission_icon.size[1] = original_size
		ui_scenegraph.tooltip_mission_icon.size[2] = original_size
	end

	local ui_local_position = ui_scenegraph.pivot.local_position
	local used_screen_position_last_frame = self.mission_tooltip_use_screen_position

	if (used_screen_position_last_frame and not use_screen_position) or (not used_screen_position_last_frame and use_screen_position) then
		self.mission_tooltip_lerp_speed = 0
	end

	if not first_update and self.mission_tooltip_lerp_speed then
		local lerp_speed = self.mission_tooltip_lerp_speed
		lerp_speed = math.min(lerp_speed + dt, 1)
		ui_local_position[1] = math.lerp(ui_local_position[1], clamped_x_pos, lerp_speed)
		ui_local_position[2] = math.lerp(ui_local_position[2], clamped_y_pos, lerp_speed)

		if lerp_speed == 1 then
			self.mission_tooltip_lerp_speed = nil
		else
			self.mission_tooltip_lerp_speed = lerp_speed
		end
	else
		ui_local_position[1] = clamped_x_pos
		ui_local_position[2] = clamped_y_pos
	end

	self.mission_tooltip_use_screen_position = use_screen_position
	self.active_tooltip_widget = widget
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
	local screen_width = RESOLUTION_LOOKUP.res_w
	local screen_height = RESOLUTION_LOOKUP.res_h
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
	local is_behind = (forward_dot < 0 and true) or false
	local is_clamped = ((is_x_clamped or is_y_clamped) and true) or false

	if is_clamped or is_behind then
		local distance_from_center = tooltip_settings.distance_from_center
		clamped_x_pos = scaled_root_size_x_half + right_dot * distance_from_center.width * scale
		clamped_y_pos = scaled_root_size_y_half + forward_dot * distance_from_center.height * scale
	else
		local screen_pos_diff_x = screen_width - scaled_root_size_x
		local screen_pos_diff_y = screen_height - scaled_root_size_y
		clamped_x_pos = clamped_x_pos - screen_pos_diff_x / 2
		clamped_y_pos = clamped_y_pos - screen_pos_diff_y / 2
	end

	local inverse_scale = RESOLUTION_LOOKUP.inv_scale
	clamped_x_pos = clamped_x_pos * inverse_scale
	clamped_y_pos = clamped_y_pos * inverse_scale

	return clamped_x_pos, clamped_y_pos, is_clamped, is_behind
end

FloatingIconUI.get_arrow_angle_and_offset = function (self, forward_dot, right_dot, arrow_size, icon_size, height_from_center)
	local static_angle_value = 1.57079633
	local offset_x = 0
	local offset_y = 0
	local offset_z = 0
	local angle = math.atan2(right_dot, forward_dot)

	if height_from_center < -400 and forward_dot > 0.6 then
		offset_y = -(icon_size[2] * 0.5 + arrow_size[2])
		static_angle_value = static_angle_value * 2
	elseif height_from_center > 400 and forward_dot > 0.6 then
		offset_y = icon_size[2] * 0.5 + arrow_size[2]
		static_angle_value = 0
	elseif angle > 0 then
		offset_x = icon_size[2] * 0.5 + arrow_size[2]
	elseif angle < 0 then
		offset_x = -(icon_size[2] * 0.5 + arrow_size[2])
		static_angle_value = -static_angle_value
	else
		offset_x, offset_y, offset_z = nil
		static_angle_value = 0
	end

	return static_angle_value, offset_x, offset_y, offset_z
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

return

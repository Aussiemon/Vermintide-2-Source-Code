local definitions = local_require("scripts/ui/views/crosshair_ui_definitions")
local MAX_SIZE = definitions.MAX_SIZE
CrosshairUI = class(CrosshairUI)
local CROSSHAIR_STYLE_FUNCTIONS = {
	default = "draw_default_style_crosshair",
	circle = "draw_circle_style_crosshair",
	shotgun = "draw_shotgun_style_crosshair",
	dot = "draw_dot_style_crosshair",
	arrows = "draw_arrows_style_crosshair",
	projectile = "draw_projectile_style_crosshair"
}
local MELEE_CROSSHAIR_STYLES = {
	dot = true
}
local RANGED_CROSSHAIR_STYLES = {
	default = true,
	circle = true,
	shotgun = true,
	arrows = true,
	projectile = true
}

CrosshairUI.init = function (self, ingame_ui_context)
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.input_manager = ingame_ui_context.input_manager
	self.render_settings = {
		snap_pixel_positions = false
	}
	self.local_player = Managers.player:local_player()

	self:create_ui_elements()
	self:update_enabled_crosshair_styles()
	rawset(_G, "crosshair_ui", self)
end

CrosshairUI.create_ui_elements = function (self)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self.crosshair_projectile = UIWidget.init(definitions.widget_definitions.crosshair_projectile)
	self.crosshair_shotgun = UIWidget.init(definitions.widget_definitions.crosshair_shotgun)
	self.crosshair_dot = UIWidget.init(definitions.widget_definitions.crosshair_dot)
	self.crosshair_line = UIWidget.init(definitions.widget_definitions.crosshair_line)
	self.crosshair_arrow = UIWidget.init(definitions.widget_definitions.crosshair_arrow)
	self.crosshair_circle = UIWidget.init(definitions.widget_definitions.crosshair_circle)
	self._hit_armored_markers = {
		damage = UIWidget.init(definitions.widget_definitions.crosshair_hit_armored_damage),
		no_damage = UIWidget.init(definitions.widget_definitions.crosshair_hit_armored_no_damage),
		armor_break = UIWidget.init(definitions.widget_definitions.crosshair_hit_armored_break),
		armor_open = UIWidget.init(definitions.widget_definitions.crosshair_hit_armored_open)
	}
	local hit_markers = {}
	local hit_markers_n = 4

	for i = 1, hit_markers_n, 1 do
		local widget_definition_name = "crosshair_hit_" .. i
		hit_markers[i] = UIWidget.init(definitions.widget_definitions[widget_definition_name])
	end

	self.hit_markers = hit_markers
	self.hit_markers_n = hit_markers_n
	self.hit_marker_animations = {}
	self.hit_markers_orig_size = hit_markers[1].size
end

CrosshairUI.destroy = function (self)
	rawset(_G, "crosshair_ui", nil)
end

CrosshairUI.update = function (self, dt)
	local player_unit = self.local_player.player_unit
	local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
	local equipment = inventory_extension:equipment()

	self:update_enabled_crosshair_styles()
	self:update_crosshair_style(equipment)
	self:update_hit_markers(dt)
	self:update_spread(dt, equipment)
end

local crosshairs = {}

CrosshairUI.update_enabled_crosshair_styles = function (self)
	local enabled_style = Application.user_setting("enabled_crosshairs")

	if self._enabled_style ~= enabled_style then
		table.clear(crosshairs)

		if enabled_style == "melee" then
			for style, value in pairs(MELEE_CROSSHAIR_STYLES) do
				crosshairs[style] = value
			end
		elseif enabled_style == "ranged" then
			for style, value in pairs(RANGED_CROSSHAIR_STYLES) do
				crosshairs[style] = value
			end
		elseif enabled_style == "all" then
			for style, value in pairs(MELEE_CROSSHAIR_STYLES) do
				crosshairs[style] = value
			end

			for style, value in pairs(RANGED_CROSSHAIR_STYLES) do
				crosshairs[style] = value
			end
		end

		self._enabled_style = enabled_style
		self._enabled_crosshair_styles = crosshairs
	end
end

CrosshairUI.update_crosshair_style = function (self, equipment)
	local wielded_item_data = equipment.wielded
	local item_template = BackendUtils.get_item_template(wielded_item_data)
	local crosshair_style = item_template.crosshair_style
	local weapon_unit = equipment.right_hand_wielded_unit or equipment.left_hand_wielded_unit
	local fire_at_gaze_setting = item_template.fire_at_gaze_setting

	if Unit.alive(weapon_unit) then
		local weapon_extension = ScriptUnit.extension(weapon_unit, "weapon_system")

		if weapon_extension:has_current_action() then
			local action_settings = weapon_extension:get_current_action_settings()
			local current_action = weapon_extension:get_current_action()

			if current_action and current_action.crosshair_style then
				crosshair_style = current_action.crosshair_style
			elseif action_settings.crosshair_style then
				crosshair_style = action_settings.crosshair_style
			end

			if action_settings.fire_at_gaze_setting then
				fire_at_gaze_setting = action_settings.fire_at_gaze_setting
			end
		end
	end

	local has_tobii = rawget(_G, "Tobii")

	if has_tobii then
		local tobii_connected = Tobii.get_is_connected()
		local is_tobii_enabled = Application.user_setting("tobii_eyetracking")
		local fire_at_gaze_enabled = Application.user_setting("tobii_fire_at_gaze")

		if tobii_connected and is_tobii_enabled and fire_at_gaze_enabled and fire_at_gaze_setting then
			crosshair_style = "dot"
		end
	end

	self.crosshair_style = crosshair_style
end

CrosshairUI.apply_crosshair_position = function (self, x, y)
	local scenegraph_id = "pivot"
	local position = self.ui_scenegraph[scenegraph_id].local_position
	position[1] = x
	position[2] = y
end

CrosshairUI.update_hit_markers = function (self, dt)
	local hit_markers = self.hit_markers
	local hit_markers_n = self.hit_markers_n
	local hit_marker_animations = self.hit_marker_animations
	local player_unit = self.local_player.player_unit
	local hud_extension = ScriptUnit.extension(player_unit, "hud_system")
	local hit_marker_data = hud_extension.hit_marker_data

	if hit_marker_data.hit_enemy then
		hit_marker_data.hit_enemy = nil

		self:set_hit_marker_animation(hit_markers, hit_markers_n, hit_marker_animations, hit_marker_data)
	end

	if hit_marker_animations[1] then
		self:update_hit_marker_animation(hit_markers, hit_markers_n, hit_marker_animations, hit_marker_data, dt)
	end
end

CrosshairUI.set_hit_marker_animation = function (self, hit_markers, hit_markers_n, hit_marker_animations, hit_marker_data)
	for i = 1, hit_markers_n, 1 do
		local hit_marker = hit_markers[i]
		local additional_hit_icon = self:configure_hit_marker_color_and_size(hit_marker, hit_marker_data)
		hit_marker_animations[i] = UIAnimation.init(UIAnimation.function_by_time, hit_marker.style.rotating_texture.color, 1, 255, 0, UISettings.crosshair.hit_marker_fade, math.easeInCubic)

		if i == hit_markers_n and additional_hit_icon then
			hit_marker_animations[5] = UIAnimation.init(UIAnimation.function_by_time, additional_hit_icon.style.color, 1, 255, 0, UISettings.crosshair.hit_marker_fade, math.easeInCubic)
			self.hit_marker_armored = additional_hit_icon
		end
	end
end

local HIT_MARKER_FREQ = 0.1

CrosshairUI.configure_hit_marker_color_and_size = function (self, hit_marker, hit_marker_data)
	local damage_amount = hit_marker_data.damage_amount
	local damage_type = hit_marker_data.damage_type
	local hit_zone = hit_marker_data.hit_zone
	local hit_critical = hit_marker_data.hit_critical
	local has_armor = hit_marker_data.has_armor
	local hit_player = hit_marker_data.hit_player
	local added_dot = hit_marker_data.added_dot
	local shield_break = hit_marker_data.shield_break
	local shield_open = hit_marker_data.shield_open
	local is_critical = false
	local is_armored = false
	local friendly_fire = false
	local additional_hit_icon = nil
	local hit_armored_markers = self._hit_armored_markers
	local hit_marker_config = definitions.hit_marker_configurations

	if damage_amount <= 0 and has_armor and not added_dot then
		is_armored = true
	elseif hit_player then
		friendly_fire = true
	elseif hit_critical then
		is_critical = true
	end

	local target_color, target_size = nil

	if is_armored then
		if shield_break then
			additional_hit_icon = hit_armored_markers.armor_break
		elseif shield_open then
			additional_hit_icon = hit_armored_markers.armor_open
		elseif damage_amount > 0 then
			additional_hit_icon = hit_armored_markers.damage
		else
			additional_hit_icon = hit_armored_markers.no_damage
		end
	end

	if is_critical then
		target_color = hit_marker_config.critical.color
		target_size = hit_marker_config.critical.size
	elseif friendly_fire then
		target_size = hit_marker_config.friendly.size
		target_color = hit_marker_config.friendly.color
	elseif is_armored then
		target_size = hit_marker_config.armored.size
		target_color = hit_marker_config.armored.color
	else
		target_size = hit_marker_config.normal.size
		target_color = hit_marker_config.normal.color
	end

	if target_color then
		local hit_marker_color = hit_marker.style.rotating_texture.color
		local hit_marker_size = hit_marker.style.rotating_texture.size
		hit_marker_color[2] = target_color[2]
		hit_marker_color[3] = target_color[3]
		hit_marker_color[4] = target_color[4]
	end

	return additional_hit_icon
end

CrosshairUI.update_hit_marker_animation = function (self, hit_markers, hit_markers_n, hit_marker_animations, hud_extension, dt)
	for i = 1, hit_markers_n, 1 do
		local animation = hit_marker_animations[i]

		UIAnimation.update(animation, dt)
	end

	if hit_marker_animations[5] then
		local animation = hit_marker_animations[5]

		UIAnimation.update(animation, dt)
	end

	if UIAnimation.completed(hit_marker_animations[1]) then
		for i = 1, hit_markers_n, 1 do
			hit_marker_animations[i] = nil
		end

		hit_marker_animations[5] = nil
	end
end

CrosshairUI.update_spread = function (self, dt, equipment)
	local wielded_item_data = equipment.wielded
	local item_template = BackendUtils.get_item_template(wielded_item_data)
	local pitch = 0
	local yaw = 0

	if item_template.default_spread_template then
		local weapon_unit = equipment.right_hand_wielded_unit or equipment.left_hand_wielded_unit

		if weapon_unit and ScriptUnit.has_extension(weapon_unit, "spread_system") then
			local spread_extension = ScriptUnit.extension(weapon_unit, "spread_system")
			pitch, yaw = spread_extension:get_current_pitch_and_yaw()
		end
	end

	local maximum_pitch = SpreadTemplates.maximum_pitch
	local maximum_yaw = SpreadTemplates.maximum_yaw
	local pitch_percentage = pitch / maximum_pitch
	local yaw_percentage = yaw / maximum_yaw
	local pitch_offset = math.lerp(0, definitions.max_spread_pitch, pitch_percentage)
	local yaw_offset = math.lerp(0, definitions.max_spread_yaw, yaw_percentage)

	self:draw(dt, pitch_percentage, yaw_percentage)
end

CrosshairUI.draw = function (self, dt, pitch_percentage, yaw_percentage)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("ingame_menu")
	local render_settings = self.render_settings

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local crosshair_style = self.crosshair_style

	if self._enabled_crosshair_styles[crosshair_style] then
		local draw_func_name = CROSSHAIR_STYLE_FUNCTIONS[crosshair_style]

		self[draw_func_name](self, ui_renderer, pitch_percentage, yaw_percentage)
	end

	local hit_markers = self.hit_markers
	local hit_markers_n = self.hit_markers_n

	for i = 1, hit_markers_n, 1 do
		local hit_marker = hit_markers[i]

		UIRenderer.draw_widget(ui_renderer, hit_marker)
	end

	if self.hit_marker_armored then
		UIRenderer.draw_widget(ui_renderer, self.hit_marker_armored)
	end

	UIRenderer.end_pass(ui_renderer)
end

CrosshairUI.draw_default_style_crosshair = function (self, ui_renderer, pitch_percentage, yaw_percentage)
	UIRenderer.draw_widget(ui_renderer, self.crosshair_dot)

	local num_points = 4
	local start_degrees = 45
	local pitch_offset = 5
	local yaw_offset = 5
	pitch_percentage = math.max(0.0001, pitch_percentage)
	yaw_percentage = math.max(0.0001, yaw_percentage)

	for i = 1, num_points, 1 do
		self:_set_widget_point_offset(self.crosshair_line, i, num_points, pitch_percentage, yaw_percentage, start_degrees, pitch_offset, yaw_offset)
		UIRenderer.draw_widget(ui_renderer, self.crosshair_line)
	end
end

CrosshairUI.draw_arrows_style_crosshair = function (self, ui_renderer, pitch_percentage, yaw_percentage)
	UIRenderer.draw_widget(ui_renderer, self.crosshair_dot)

	local num_points = 4
	local start_degrees = 45
	local pitch_offset = 5
	local yaw_offset = 5
	pitch_percentage = math.max(0.0001, pitch_percentage)
	yaw_percentage = math.max(0.0001, yaw_percentage)

	for i = 1, num_points, 1 do
		self:_set_widget_point_offset(self.crosshair_arrow, i, num_points, pitch_percentage, yaw_percentage, start_degrees, pitch_offset, yaw_offset)
		UIRenderer.draw_widget(ui_renderer, self.crosshair_arrow)
	end
end

CrosshairUI.draw_shotgun_style_crosshair = function (self, ui_renderer, pitch_percentage, yaw_percentage)
	UIRenderer.draw_widget(ui_renderer, self.crosshair_dot)

	local num_points = 4
	local start_degrees = 45
	local pitch_offset = 0
	local yaw_offset = 0
	pitch_percentage = math.max(0.0001, pitch_percentage)
	yaw_percentage = math.max(0.0001, yaw_percentage)

	for i = 1, num_points, 1 do
		self:_set_widget_point_offset(self.crosshair_shotgun, i, num_points, pitch_percentage, yaw_percentage, start_degrees, pitch_offset, yaw_offset)
		UIRenderer.draw_widget(ui_renderer, self.crosshair_shotgun)
	end
end

CrosshairUI.draw_projectile_style_crosshair = function (self, ui_renderer, pitch_percentage, yaw_percentage)
	UIRenderer.draw_widget(ui_renderer, self.crosshair_dot)
	UIRenderer.draw_widget(ui_renderer, self.crosshair_projectile)

	local num_points = 2
	local start_degrees = 0
	local pitch_offset = 6
	local yaw_offset = 0
	pitch_percentage = math.max(0.0001, pitch_percentage)
	yaw_percentage = math.max(0.0001, yaw_percentage)

	for i = 1, num_points, 1 do
		self:_set_widget_point_offset(self.crosshair_line, i, num_points, pitch_percentage, yaw_percentage, start_degrees, pitch_offset, yaw_offset)
		UIRenderer.draw_widget(ui_renderer, self.crosshair_line)
	end
end

CrosshairUI.draw_dot_style_crosshair = function (self, ui_renderer, pitch_percentage, yaw_percentage)
	UIRenderer.draw_widget(ui_renderer, self.crosshair_dot)
end

CrosshairUI.draw_circle_style_crosshair = function (self, ui_renderer, pitch_percentage, yaw_percentage)
	UIRenderer.draw_widget(ui_renderer, self.crosshair_circle)
end

CrosshairUI._set_widget_point_offset = function (self, widget, point_index, max_points, pitch_percentage, yaw_percentage, start_degrees, pitch_offset, yaw_offset)
	local ptx, pty, angle = self:_get_point_offset(point_index, max_points, pitch_percentage, yaw_percentage, start_degrees)
	local widget_style = widget.style
	local offset = widget_style.offset
	local pivot = widget_style.pivot
	pitch_offset = pitch_offset or 0
	yaw_offset = yaw_offset or 0
	offset[1] = ptx + pitch_offset * math.sign(ptx)
	offset[2] = pty + yaw_offset * math.sign(pty)
	widget_style.angle = -angle
end

CrosshairUI._get_point_offset = function (self, point_index, max_points, pitch_percentage, yaw_percentage, start_degrees)
	local max_radius = MAX_SIZE
	local x = 0
	local y = 0
	local pitch_radius = max_radius * pitch_percentage
	local yaw_radius = max_radius * yaw_percentage
	local start_progress = ((start_degrees or 0) / 360) % 1
	local real_index = point_index - 1
	local fraction = real_index / max_points
	local rotation_progress = (start_progress + fraction) % 1
	local degress = rotation_progress * 360
	local angle = -((degress * math.pi) / 180)
	local pty = y + pitch_radius * math.sin(angle)
	local ptx = x + yaw_radius * math.cos(angle)

	return ptx, pty, angle
end

return

UICleanUI = class(UICleanUI)
local fade_delay = 1
local fade_duration = 1.5
local fade_min = 0.1
local margin = 50
local lost_gaze_threshhold = 1
local DEBUG_BOUNDING_BOXES = false
UICleanUI.create = function ()
	return {
		dirty = true,
		off_window_clock = 0,
		was_enabled = false,
		areas = {},
		widget_area_map = {},
		clocks = {}
	}
end

local function get_world_bounding_box(bounding_boxes)
	local rx, ry = Application.resolution()
	local x = rx
	local y = ry
	local xx = 0
	local yy = 0

	for _, bounding_box in ipairs(bounding_boxes) do
		x = math.min(x, bounding_box[1][1])
		y = math.min(y, bounding_box[1][2])
		xx = math.max(xx, bounding_box[1][1] + bounding_box[2][1])
		yy = math.max(yy, bounding_box[1][2] + bounding_box[2][2])
	end

	local ui_scale = RESOLUTION_LOOKUP.scale

	return {
		x * ui_scale,
		y * ui_scale,
		xx * ui_scale,
		yy * ui_scale
	}
end

local function pad_bounding_box(bounding_box, margin)
	return {
		bounding_box[1] - margin,
		bounding_box[2] - margin,
		bounding_box[3] + margin,
		bounding_box[4] + margin
	}
end

local function point_in_bounding_box(x, y, bounding_box)
	return bounding_box[1] < x and x < bounding_box[3] and bounding_box[2] < y and y < bounding_box[4]
end

UICleanUI.update = function (self, dt, context)
	local tobii_active = false

	if ScriptUnit.has_extension(context.player.player_unit, "eyetracking_system") then
		local eyetracking_extension = ScriptUnit.extension(context.player.player_unit, "eyetracking_system")
		tobii_active = eyetracking_extension.get_is_feature_enabled(eyetracking_extension, "tobii_clean_ui")
	end

	local gaze_x, gaze_y = Tobii.get_gaze_point()
	gaze_x = gaze_x * 0.5 + 0.5
	gaze_y = gaze_y * 0.5 + 0.5
	local res_x, res_y = Application.resolution()
	local gaze_gx = gaze_x * res_x
	local gaze_gy = gaze_y * res_y
	local ability_ui = self.hud.ability_ui
	local equipment_background = self.hud.equipment_ui
	local gamepad_equipment_background = self.hud.gamepad_equipment_ui
	local portrait_size = {
		86,
		108
	}
	local on_window = 0 <= gaze_x and gaze_x <= 1 and 0 <= gaze_y and gaze_y <= 1
	local off_window_override = false

	if on_window then
		self.off_window_clock = 0
	else
		self.off_window_clock = self.off_window_clock + dt
		off_window_override = lost_gaze_threshhold < self.off_window_clock

		if off_window_override then
			self.off_window_clock = lost_gaze_threshhold
		end
	end

	local portrait_bounding_boxes = {}

	for unit_index, unit_frame in ipairs(self.hud.unit_frames_handler._unit_frames) do
		local centre_pos = unit_frame.widget.ui_scenegraph.portrait_pivot.world_position
		portrait_bounding_boxes[unit_index] = {
			{
				centre_pos[1] - portrait_size[1] * 0.5,
				centre_pos[2] - portrait_size[2]
			},
			portrait_size
		}
	end

	local equipment_world_position = equipment_background.ui_scenegraph.background_panel.world_position
	local gamepad_equipment_world_position = gamepad_equipment_background.ui_scenegraph.background_panel.world_position
	local equipment_size = equipment_background.ui_scenegraph.background_panel.size
	local gamepad_equipment_size = gamepad_equipment_background.ui_scenegraph.background_panel.size
	local bottom_bounding_boxes = {
		{
			{
				(gamepad_equipment_world_position[1] < equipment_world_position[1] and equipment_world_position[1]) or gamepad_equipment_world_position[1],
				(gamepad_equipment_world_position[2] < equipment_world_position[2] and equipment_world_position[2]) or gamepad_equipment_world_position[2],
				(gamepad_equipment_world_position[3] < equipment_world_position[3] and equipment_world_position[3]) or gamepad_equipment_world_position[3]
			},
			{
				(gamepad_equipment_size[1] < equipment_size[1] and equipment_size[1]) or gamepad_equipment_size[1],
				(gamepad_equipment_size[2] < equipment_size[2] and equipment_size[2]) or gamepad_equipment_size[2]
			}
		}
	}
	local left_portrait_bounding_boxes = {
		portrait_bounding_boxes[2],
		portrait_bounding_boxes[3],
		portrait_bounding_boxes[4]
	}
	local bottom_left_bounding_boxes = {
		portrait_bounding_boxes[1]
	}

	if not self.clusters or RESOLUTION_LOOKUP.modified or self.dirty then
		local hud = self.hud

		if self.clusters then
			self.clusters.bottom.bounding_box = pad_bounding_box(get_world_bounding_box(bottom_bounding_boxes), margin)
			self.clusters.left.bounding_box = pad_bounding_box(get_world_bounding_box(left_portrait_bounding_boxes), margin)
			self.clusters.bottom_left.bounding_box = pad_bounding_box(get_world_bounding_box(bottom_left_bounding_boxes), margin)
		else
			self.clusters = {
				mission = {
					bounding_box = {
						0,
						0,
						10,
						10
					},
					widgets = {}
				},
				bottom = {
					bounding_box = pad_bounding_box(get_world_bounding_box(bottom_bounding_boxes), margin),
					widgets = {
						{
							alpha = -1,
							widget = hud.equipment_ui
						},
						{
							alpha = -1,
							widget = hud.gamepad_equipment_ui
						},
						{
							set_alpha_function = "set_equipment_alpha",
							alpha = -1,
							widget = hud.unit_frames_handler:get_unit_widget(1)
						},
						{
							set_alpha_function = "set_health_alpha",
							alpha = -1,
							widget = hud.unit_frames_handler:get_unit_widget(1)
						},
						{
							set_alpha_function = "set_ability_alpha",
							alpha = -1,
							widget = hud.unit_frames_handler:get_unit_widget(1)
						},
						{
							alpha = -1,
							widget = hud.ability_ui
						}
					}
				},
				left = {
					bounding_box = pad_bounding_box(get_world_bounding_box(left_portrait_bounding_boxes), margin),
					widgets = {
						{
							alpha = 1,
							widget = hud.unit_frames_handler:get_unit_widget(2)
						},
						{
							alpha = -1,
							widget = hud.unit_frames_handler:get_unit_widget(3)
						},
						{
							alpha = -1,
							widget = hud.unit_frames_handler:get_unit_widget(4)
						}
					}
				},
				bottom_left = {
					bounding_box = pad_bounding_box(get_world_bounding_box(left_portrait_bounding_boxes), margin),
					widgets = {
						{
							set_alpha_function = "set_default_alpha",
							alpha = -1,
							widget = hud.unit_frames_handler:get_unit_widget(1)
						},
						{
							set_alpha_function = "set_portrait_alpha",
							alpha = -1,
							widget = hud.unit_frames_handler:get_unit_widget(1)
						},
						{
							alpha = -1,
							widget = hud.buff_ui
						}
					}
				}
			}
		end
	end

	local clocks_empty = true

	for clock, time in pairs(self.clocks) do
		clocks_empty = false
	end

	local cutscene_system = Managers.state.entity:system("cutscene_system")
	local in_cutscene = cutscene_system and cutscene_system.active_camera
	local clocks = self.clocks
	local clusters = self.clusters

	for name, cluster in pairs(clusters) do
		local clock = clocks[name]
		local visibility = point_in_bounding_box(gaze_gx, gaze_gy, cluster.bounding_box)
		cluster.visible = visibility

		if visibility or clocks_empty or off_window_override or in_cutscene then
			clock = fade_delay + fade_duration
		else
			clock = math.max(0, clock - dt)
		end

		local alpha = clock / fade_duration
		alpha = alpha * (1 - fade_min) + fade_min
		alpha = math.clamp(alpha, 0, 1)
		local widgets = cluster.widgets

		for _, box in pairs(widgets) do
			if not tobii_active then
				if box.alpha ~= 1 then
					if box.widget.set_panel_alpha then
						box.widget:set_panel_alpha(1)
					end

					if box.widget.set_alpha then
						box.widget:set_alpha(1)
					end

					box.alpha = 1
				end
			elseif box.alpha ~= alpha then
				if box.set_alpha_function then
					box.widget[box.set_alpha_function](box.widget, alpha)
				else
					if box.widget.set_panel_alpha then
						box.widget:set_panel_alpha(alpha)
					end

					if box.widget.set_alpha then
						box.widget:set_alpha(alpha)
					end
				end

				box.alpha = alpha
			end
		end

		clocks[name] = clock
	end

	if DEBUG_BOUNDING_BOXES then
		local gui = self.hud.ui_renderer.gui
		local clusters = self.clusters

		for name, cluster in pairs(clusters) do
			local color = Color(100, 0, 255, 255)

			if cluster.visible then
				color = Color(100, 255, 0, 255)
			end

			ScriptGUI.icrect(gui, res_x, res_y, cluster.bounding_box[1], res_y - cluster.bounding_box[2], cluster.bounding_box[3], res_y - cluster.bounding_box[4], 1, color)
		end
	end

	return 
end

return 

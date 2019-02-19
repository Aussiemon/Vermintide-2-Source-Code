UICleanUI = class(UICleanUI)
local fade_delay = 1
local fade_duration = 1.5
local fade_min = 0.1
local margin = 50
local lost_gaze_threshhold = 1

UICleanUI.create = function (peer_id)
	return {
		dirty = true,
		off_window_clock = 0,
		was_enabled = false,
		areas = {},
		widget_area_map = {},
		clocks = {},
		peer_id = peer_id
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

UICleanUI.update = function (self, dt)
	local tobii_active = false
	local peer_id = self.peer_id
	local player_manager = Managers.player
	local player = player_manager:player_from_peer_id(peer_id)
	local player_unit = player and player.player_unit

	if Unit.alive(player_unit) and ScriptUnit.has_extension(player_unit, "eyetracking_system") then
		local eyetracking_extension = ScriptUnit.extension(player_unit, "eyetracking_system")
		tobii_active = eyetracking_extension:get_is_feature_enabled("tobii_clean_ui")
	end

	local gaze_x, gaze_y = Tobii.get_gaze_point()
	gaze_x = gaze_x * 0.5 + 0.5
	gaze_y = gaze_y * 0.5 + 0.5
	local res_x, res_y = Application.resolution()
	local gaze_gx = gaze_x * res_x
	local gaze_gy = gaze_y * res_y
	local on_window = gaze_x >= 0 and gaze_x <= 1 and gaze_y >= 0 and gaze_y <= 1
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

	local hud = self.hud
	local portrait_size = {
		86,
		108
	}
	local portrait_bounding_boxes = {}
	local unit_frames_handler = hud:component("UnitFramesHandler")
	local unit_frame_amount = unit_frames_handler:unit_frame_amount()

	for i = 1, unit_frame_amount, 1 do
		local widget = unit_frames_handler:get_unit_widget(i)
		local centre_pos = widget.ui_scenegraph.portrait_pivot.world_position
		portrait_bounding_boxes[i] = {
			{
				centre_pos[1] - portrait_size[1] * 0.5,
				centre_pos[2] - portrait_size[2]
			},
			portrait_size
		}
	end

	local equipment_background = hud:component("EquipmentUI")
	local gamepad_equipment_background = hud:component("GamePadEquipmentUI")
	local ammo_world_position = equipment_background.ui_scenegraph.ammo_background.world_position
	local ammo_background_size = equipment_background.ui_scenegraph.ammo_background.size
	local equipment_world_position = equipment_background.ui_scenegraph.background_panel.world_position
	local gamepad_equipment_world_position = gamepad_equipment_background.ui_scenegraph.background_panel.world_position
	local equipment_size = equipment_background.ui_scenegraph.background_panel.size
	local gamepad_equipment_size = gamepad_equipment_background.ui_scenegraph.background_panel.size
	local bottom_bounding_boxes = {
		{
			{
				equipment_world_position[1],
				equipment_world_position[2],
				equipment_world_position[3]
			},
			{
				equipment_size[1],
				equipment_size[2]
			}
		}
	}
	local bottom_right_bounding_boxes = {
		{
			{
				ammo_world_position[1],
				ammo_world_position[2],
				ammo_world_position[3]
			},
			{
				ammo_background_size[1],
				ammo_background_size[2]
			}
		}
	}
	local gamepad_bottom_bounding_boxes = {
		{
			{
				gamepad_equipment_world_position[1],
				gamepad_equipment_world_position[2],
				gamepad_equipment_world_position[3]
			},
			{
				gamepad_equipment_size[1],
				gamepad_equipment_size[2]
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

		if self.gamepadclusters then
			self.gamepadclusters.bottom.bounding_box = pad_bounding_box(get_world_bounding_box(gamepad_bottom_bounding_boxes), margin)
			self.gamepadclusters.left.bounding_box = pad_bounding_box(get_world_bounding_box(left_portrait_bounding_boxes), margin)
			self.gamepadclusters.bottom_left.bounding_box = pad_bounding_box(get_world_bounding_box(bottom_left_bounding_boxes), margin)
			self.gamepadclusters.bottom_right.bounding_box = pad_bounding_box(get_world_bounding_box(bottom_right_bounding_boxes), margin)
		else
			self.gamepadclusters = {
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
							set_alpha_function = "set_health_alpha",
							get_widget_function = function (self)
								local hud = self.hud
								local unit_frames_handler = hud:component("UnitFramesHandler")
								local widget = unit_frames_handler:get_unit_widget(1)

								return widget
							end
						},
						{
							set_alpha_function = "set_frame_alpha",
							alpha = -1,
							widget = hud:component("GamepadEquipmentUI")
						}
					}
				},
				left = {
					bounding_box = pad_bounding_box(get_world_bounding_box(left_portrait_bounding_boxes), margin),
					widgets = {
						{
							alpha = 1,
							get_widget_function = function (self)
								local hud = self.hud
								local unit_frames_handler = hud:component("UnitFramesHandler")
								local widget = unit_frames_handler:get_unit_widget(2)

								return widget
							end
						},
						{
							alpha = -1,
							get_widget_function = function (self)
								local hud = self.hud
								local unit_frames_handler = hud:component("UnitFramesHandler")
								local widget = unit_frames_handler:get_unit_widget(3)

								return widget
							end
						},
						{
							alpha = -1,
							get_widget_function = function (self)
								local hud = self.hud
								local unit_frames_handler = hud:component("UnitFramesHandler")
								local widget = unit_frames_handler:get_unit_widget(4)

								return widget
							end
						}
					}
				},
				bottom_left = {
					bounding_box = pad_bounding_box(get_world_bounding_box(left_portrait_bounding_boxes), margin),
					widgets = {
						{
							alpha = -1,
							set_alpha_function = "set_default_alpha",
							get_widget_function = function (self)
								local hud = self.hud
								local unit_frames_handler = hud:component("UnitFramesHandler")
								local widget = unit_frames_handler:get_unit_widget(1)

								return widget
							end
						},
						{
							alpha = -1,
							set_alpha_function = "set_portrait_alpha",
							get_widget_function = function (self)
								local hud = self.hud
								local unit_frames_handler = hud:component("UnitFramesHandler")
								local widget = unit_frames_handler:get_unit_widget(1)

								return widget
							end
						},
						{
							alpha = -1,
							widget = hud:component("BuffUI")
						}
					}
				},
				bottom_right = {
					bounding_box = pad_bounding_box(get_world_bounding_box(bottom_right_bounding_boxes), margin),
					widgets = {
						{
							set_alpha_function = "set_panel_alpha",
							alpha = -1,
							widget = hud:component("GamePadEquipmentUI")
						},
						{
							alpha = -1,
							set_alpha_function = "set_ability_alpha",
							get_widget_function = function (self)
								local hud = self.hud
								local unit_frames_handler = hud:component("UnitFramesHandler")
								local widget = unit_frames_handler:get_unit_widget(1)

								return widget
							end
						},
						{
							alpha = -1,
							widget = hud:component("GamePadAbilityUI")
						}
					}
				}
			}
		end

		if self.clusters then
			self.clusters.bottom.bounding_box = pad_bounding_box(get_world_bounding_box(bottom_bounding_boxes), margin)
			self.clusters.left.bounding_box = pad_bounding_box(get_world_bounding_box(left_portrait_bounding_boxes), margin)
			self.clusters.bottom_left.bounding_box = pad_bounding_box(get_world_bounding_box(bottom_left_bounding_boxes), margin)
			self.clusters.bottom_right.bounding_box = pad_bounding_box(get_world_bounding_box(bottom_right_bounding_boxes), margin)
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
							set_alpha_function = "set_panel_alpha",
							alpha = -1,
							widget = hud:component("EquipmentUI")
						},
						{
							alpha = -1,
							set_alpha_function = "set_equipment_alpha",
							get_widget_function = function (self)
								local hud = self.hud
								local unit_frames_handler = hud:component("UnitFramesHandler")
								local widget = unit_frames_handler:get_unit_widget(1)

								return widget
							end
						},
						{
							alpha = -1,
							set_alpha_function = "set_health_alpha",
							get_widget_function = function (self)
								local hud = self.hud
								local unit_frames_handler = hud:component("UnitFramesHandler")
								local widget = unit_frames_handler:get_unit_widget(1)

								return widget
							end
						},
						{
							alpha = -1,
							set_alpha_function = "set_ability_alpha",
							get_widget_function = function (self)
								local hud = self.hud
								local unit_frames_handler = hud:component("UnitFramesHandler")
								local widget = unit_frames_handler:get_unit_widget(1)

								return widget
							end
						},
						{
							alpha = -1,
							widget = hud:component("AbilityUI")
						}
					}
				},
				left = {
					bounding_box = pad_bounding_box(get_world_bounding_box(left_portrait_bounding_boxes), margin),
					widgets = {
						{
							alpha = 1,
							get_widget_function = function (self)
								local hud = self.hud
								local unit_frames_handler = hud:component("UnitFramesHandler")
								local widget = unit_frames_handler:get_unit_widget(2)

								return widget
							end
						},
						{
							alpha = -1,
							get_widget_function = function (self)
								local hud = self.hud
								local unit_frames_handler = hud:component("UnitFramesHandler")
								local widget = unit_frames_handler:get_unit_widget(3)

								return widget
							end
						},
						{
							alpha = -1,
							get_widget_function = function (self)
								local hud = self.hud
								local unit_frames_handler = hud:component("UnitFramesHandler")
								local widget = unit_frames_handler:get_unit_widget(4)

								return widget
							end
						}
					}
				},
				bottom_left = {
					bounding_box = pad_bounding_box(get_world_bounding_box(left_portrait_bounding_boxes), margin),
					widgets = {
						{
							alpha = -1,
							set_alpha_function = "set_default_alpha",
							get_widget_function = function (self)
								local hud = self.hud
								local unit_frames_handler = hud:component("UnitFramesHandler")
								local widget = unit_frames_handler:get_unit_widget(1)

								return widget
							end
						},
						{
							alpha = -1,
							set_alpha_function = "set_portrait_alpha",
							get_widget_function = function (self)
								local hud = self.hud
								local unit_frames_handler = hud:component("UnitFramesHandler")
								local widget = unit_frames_handler:get_unit_widget(1)

								return widget
							end
						},
						{
							alpha = -1,
							widget = hud:component("BuffUI")
						}
					}
				},
				bottom_right = {
					bounding_box = pad_bounding_box(get_world_bounding_box(bottom_right_bounding_boxes), margin),
					widgets = {
						{
							set_alpha_function = "set_ammo_alpha",
							alpha = -1,
							widget = hud:component("EquipmentUI")
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
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local clusters = self.clusters

	if gamepad_active then
		clusters = self.gamepadclusters
	end

	local clocks = self.clocks

	for name, cluster in pairs(clusters) do
		local clock = clocks[name]
		local visibility = point_in_bounding_box(gaze_gx, gaze_gy, cluster.bounding_box)
		cluster.visible = visibility

		if visibility or clocks_empty or off_window_override or in_cutscene then
			clock = fade_delay + fade_duration
		else
			clock = math.max(0, clock - dt)
		end

		local alpha = 1

		if tobii_active then
			alpha = clock / fade_duration
			alpha = alpha * (1 - fade_min) + fade_min
			alpha = math.clamp(alpha, 0, 1)
		end

		local widgets = cluster.widgets

		for _, box in pairs(widgets) do
			local widget = box.widget
			local get_widget_function = box.get_widget_function

			if get_widget_function then
				widget = get_widget_function(self)
			end

			if box.alpha ~= alpha then
				if widget then
					local set_alpha_function = box.set_alpha_function

					if set_alpha_function then
						if widget[set_alpha_function] then
							widget[set_alpha_function](widget, alpha)
						end
					else
						if widget.set_panel_alpha then
							widget:set_panel_alpha(alpha)
						end

						if widget.set_alpha then
							widget:set_alpha(alpha)
						end
					end
				end

				box.alpha = alpha
			end
		end

		clocks[name] = clock
	end
end

return

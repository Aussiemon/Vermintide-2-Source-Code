UICleanUI = class(UICleanUI)
local fade_delay = 1
local fade_duration = 1.5
local fade_min = 0.1
local margin = 50
local lost_gaze_threshhold = 1
local dbg_bbs = false
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

function get_world_bb(bbs)
	local rx, ry = Application.resolution()
	local x = rx
	local y = ry
	local xx = 0
	local yy = 0

	for _, bb in ipairs(bbs) do
		x = math.min(x, bb[1][1])
		y = math.min(y, bb[1][2])
		xx = math.max(xx, bb[1][1] + bb[2][1])
		yy = math.max(yy, bb[1][2] + bb[2][2])
	end

	local ui_scale = RESOLUTION_LOOKUP.scale

	return {
		x*ui_scale,
		y*ui_scale,
		xx*ui_scale,
		yy*ui_scale
	}
end

function pad_bb(bb, margin)
	return {
		bb[1] - margin,
		bb[2] - margin,
		bb[3] + margin,
		bb[4] + margin
	}
end

function point_in_bb(bb, p)
	return bb[1] < p[1] and p[1] < bb[3] and bb[2] < p[2] and p[2] < bb[4]
end

UICleanUI.update = function (self, dt, context)
	local tobii_active = false

	if ScriptUnit.has_extension(context.player.player_unit, "eyetracking_system") then
		local eyetracking_extension = ScriptUnit.extension(context.player.player_unit, "eyetracking_system")
		tobii_active = eyetracking_extension.get_is_feature_enabled(eyetracking_extension, "tobii_clean_ui")
	end

	local gaze_x, gaze_y = Tobii.get_gaze_point()
	gaze_x = gaze_x*0.5 + 0.5
	gaze_y = gaze_y*0.5 + 0.5
	local res_x, res_y = Application.resolution()
	local gaze_gx = gaze_x*res_x
	local gaze_gy = gaze_y*res_y
	local ability_ui = self.hud.ability_ui
	local equipment_background = self.hud.equipment_ui
	local portrait_size = {
		96,
		112
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

	local portrait_bbs = {}

	for unit_index, unit_frame in ipairs(self.hud.unit_frames_handler._unit_frames) do
		local centre_pos = unit_frame.widget.ui_scenegraph.portrait_pivot.world_position
		portrait_bbs[unit_index] = {
			{
				centre_pos[1] - portrait_size[1]*0.5,
				centre_pos[2] - portrait_size[2]
			},
			portrait_size
		}
	end

	local bottom_bbs = {
		{
			equipment_background.ui_scenegraph.background_panel.world_position,
			equipment_background.ui_scenegraph.background_panel.size
		},
		portrait_bbs[1]
	}
	local left_portrait_bbs = {
		portrait_bbs[2],
		portrait_bbs[3],
		portrait_bbs[4]
	}

	if not self.clusters or RESOLUTION_LOOKUP.modified or self.dirty then
		if self.clusters then
			self.clusters.bottom.bb = pad_bb(get_world_bb(bottom_bbs), margin)
			self.clusters.left.bb = pad_bb(get_world_bb(left_portrait_bbs), margin)
		else
			self.clusters = {
				mission = {
					bb = {
						0,
						0,
						10,
						10
					},
					widgets = {}
				},
				bottom = {
					bb = pad_bb(get_world_bb(bottom_bbs), margin),
					widgets = {
						{
							alpha = -1,
							widget = self.hud.equipment_ui
						},
						{
							alpha = -1,
							widget = self.hud.ability_ui
						},
						{
							alpha = -1,
							widget = self.hud.unit_frames_handler:get_unit_widget(1)
						}
					}
				},
				left = {
					bb = pad_bb(get_world_bb(left_portrait_bbs), margin),
					widgets = {
						{
							alpha = 1,
							widget = self.hud.unit_frames_handler:get_unit_widget(2)
						},
						{
							alpha = -1,
							widget = self.hud.unit_frames_handler:get_unit_widget(3)
						},
						{
							alpha = -1,
							widget = self.hud.unit_frames_handler:get_unit_widget(4)
						}
					}
				}
			}
		end

		self.dirty = false
	end

	local clocksEmpty = true

	for clock, time in pairs(self.clocks) do
		clocksEmpty = false
	end

	for name, cluster in pairs(self.clusters) do
		local visibility = point_in_bb(cluster.bb, {
			gaze_gx,
			gaze_gy
		})
		cluster.visible = visibility

		if visibility or clocksEmpty or off_window_override then
			self.clocks[name] = fade_delay + fade_duration
		else
			self.clocks[name] = math.max(0, self.clocks[name] - dt)
		end

		local alpha = self.clocks[name]/fade_duration
		alpha = alpha*(fade_min - 1) + fade_min
		alpha = math.clamp(alpha, 0, 1)

		for _, box in pairs(cluster.widgets) do
			if not tobii_active then
				if box.alpha ~= 1 then
					if box.widget.set_panel_alpha then
						box.widget:set_panel_alpha(1)
					else
						box.widget:set_alpha(1)
					end

					box.alpha = 1
				end
			elseif box.alpha ~= alpha then
				if box.widget.set_panel_alpha then
					box.widget:set_panel_alpha(alpha)
				else
					box.widget:set_alpha(alpha)
				end

				box.alpha = alpha
			end
		end
	end

	if dbg_bbs then
		local gui = self.hud.ui_renderer.gui

		for name, cluster in pairs(self.clusters) do
			local col = Color(100, 0, 255, 255)

			if cluster.visible then
				col = Color(100, 255, 0, 255)
			end

			ScriptGUI.icrect(gui, res_x, res_y, cluster.bb[1], res_y - cluster.bb[2], cluster.bb[3], res_y - cluster.bb[4], 1, col)
		end
	end

	return 
end

return 

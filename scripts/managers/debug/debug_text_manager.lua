DebugTextManager = class(DebugTextManager)

DebugTextManager.init = function (self, world, gui, is_server, network_event_delegate)
	self._world = world
	self._gui = gui
	self._world_gui = World.create_world_gui(world, Matrix4x4.identity(), 1, 1, "material", "materials/fonts/gw_fonts", "immediate")
	self._time = 0
	self._screen_text_size = 50
	self._screen_text_time = 5
	self._screen_text_bgr = nil
	self._screen_text = nil
	self._unit_text_size = 0.2
	self._unit_text_time = math.huge
	self._unit_texts = {}
	self._world_text_size = 0.6
	self._world_text_time = math.huge
	self._world_texts = {}
end

DebugTextManager.update = function (self, dt, viewport_name)
	self._time = self._time + dt

	if script_data and script_data.disable_debug_draw then
		return
	end

	self:_update_unit_texts(viewport_name, dt)
	self:_update_world_texts(viewport_name)
	self:_update_screen_text()
end

DebugTextManager._update_unit_texts = function (self, viewport_name, dt)
	local camera_rotation = Managers.state.camera:camera_rotation(viewport_name)
	local world_gui = self._world_gui
	local material = "arial"
	local text_size = self._unit_text_size
	local font = "materials/fonts/" .. material

	for unit, categories in pairs(self._unit_texts) do
		if Unit.alive(unit) then
			for category, gui_texts in pairs(categories) do
				for i, gui_text in ipairs(gui_texts) do
					if gui_text.time < self._time then
						Gui.destroy_text_3d(self._world_gui, gui_text.id)
						table.remove(gui_texts, i)
					else
						local offset = Vector3(gui_text.offset.x, gui_text.offset.y, gui_text.offset.z)
						local tm = Matrix4x4.from_quaternion_position(camera_rotation, Unit.world_position(unit, gui_text.node_index) + offset)
						local text_offset = Vector3(gui_text.text_offset.x, gui_text.text_offset.y, gui_text.text_offset.z)
						local color = nil
						local fade = gui_text.fade

						if fade then
							local time_left = gui_text.time - self._time
							local total_time = gui_text.time - gui_text.starting_time
							local alpha = time_left / total_time * 255
							color = Color(alpha, gui_text.color.r, gui_text.color.g, gui_text.color.b)
						else
							color = Color(gui_text.color.r, gui_text.color.g, gui_text.color.b)
						end

						local floating_position_box = gui_text.floating_position_box

						if floating_position_box then
							local floating_position = floating_position_box:unbox()
							floating_position = floating_position + Vector3.forward() * dt * 0.5
							text_offset = text_offset + floating_position

							gui_text.floating_position_box:store(floating_position)
						end

						Gui.update_text_3d(world_gui, gui_text.id, gui_text.text, font, gui_text.text_size, material, tm, text_offset, 0, color)
					end
				end
			end
		else
			self:_destroy_unit_texts(unit)
		end
	end
end

DebugTextManager._update_world_texts = function (self, viewport_name)
	local camera_rotation = Managers.state.camera:camera_rotation(viewport_name)
	local world_gui = self._world_gui
	local text_size = self._world_text_size
	local material = "arial"
	local font = "materials/fonts/" .. material

	for category, gui_texts in pairs(self._world_texts) do
		for i, gui_text in ipairs(gui_texts) do
			if gui_text.time < self._time then
				Gui.destroy_text_3d(self._world_gui, gui_text.id)
				table.remove(gui_texts, i)
			else
				local position = Vector3(gui_text.position.x, gui_text.position.y, gui_text.position.z)
				local text_offset = Vector3(gui_text.text_offset.x, gui_text.text_offset.y, gui_text.text_offset.z)
				local tm = Matrix4x4.from_quaternion_position(camera_rotation, position)
				local color = Color(gui_text.color.r, gui_text.color.g, gui_text.color.b)

				Gui.update_text_3d(world_gui, gui_text.id, gui_text.text, font, gui_text.text_size, material, tm, text_offset, 0, color)
			end
		end
	end
end

DebugTextManager._update_screen_text = function (self)
	if self._screen_text and self._screen_text.time < self._time then
		Gui.destroy_text(self._gui, self._screen_text.text_id)
		Gui.destroy_rect(self._gui, self._screen_text.bgr_id)

		self._screen_text = nil
	end
end

DebugTextManager.output_unit_text = function (self, text, text_size, unit, node_index, offset, time, category, color, viewport_name, floating, fade)
	if script_data and script_data.disable_debug_draw then
		return
	end

	node_index = node_index or 0
	text_size = text_size or self._unit_text_size
	local gui = self._world_gui
	local material = "arial"
	local font = "materials/fonts/" .. material
	local tm = nil

	if viewport_name then
		local camera_rotation = Managers.state.camera:camera_rotation(viewport_name)
		tm = Matrix4x4.from_quaternion_position(camera_rotation, Unit.world_position(unit, node_index) + offset)
	else
		tm = Unit.world_pose(unit, node_index)
	end

	local text_extent_min, text_extent_max = Gui.text_extents(gui, text, font, text_size)
	local text_width = text_extent_max[1] - text_extent_min[1]
	local text_height = text_extent_max[2] - text_extent_min[2]
	local text_offset = Vector3(-text_width / 2, -text_height / 2, 0)
	offset = offset or Vector3(0, 0, 0)
	category = category or "none"
	color = color or Vector3(255, 255, 255)
	local floating_position_box = nil

	if floating then
		floating_position_box = Vector3Box(Vector3.zero())
	end

	local new_text = {
		alpha = 255,
		id = Gui.text_3d(gui, text, font, text_size, material, tm, text_offset, 0, Color(color.x, color.y, color.z)),
		text = text,
		text_size = text_size,
		node_index = node_index,
		offset = {
			x = offset.x,
			y = offset.y,
			z = offset.z
		},
		text_offset = {
			x = text_offset.x,
			y = text_offset.y,
			z = text_offset.z
		},
		color = {
			r = color.x,
			g = color.y,
			b = color.z
		},
		time = self._time + (time or self._unit_text_time),
		floating_position_box = floating_position_box,
		fade = fade,
		starting_time = self._time
	}
	self._unit_texts[unit] = self._unit_texts[unit] or {}
	self._unit_texts[unit][category] = self._unit_texts[unit][category] or {}
	self._unit_texts[unit][category][#self._unit_texts[unit][category] + 1] = new_text
end

DebugTextManager.clear_unit_text = function (self, clear_unit, clear_category)
	for unit, categories in pairs(self._unit_texts) do
		if not clear_unit or clear_unit == unit then
			for category, gui_texts in pairs(categories) do
				if not clear_category or category == "none" or clear_category == category then
					local num_gui_texts = #gui_texts

					for i = num_gui_texts, 1, -1 do
						local gui_text = gui_texts[i]

						Gui.destroy_text_3d(self._world_gui, gui_text.id)
						table.remove(gui_texts, i)
					end
				end
			end
		end
	end
end

DebugTextManager.output_world_text = function (self, text, text_size, position, time, category, color, viewport_name)
	if script_data and script_data.disable_debug_draw then
		return
	end

	text_size = text_size or self._world_text_size
	local gui = self._world_gui
	local material = "arial"
	local font = "materials/fonts/" .. material
	local tm = nil

	if viewport_name then
		local camera_rotation = Managers.state.camera:camera_rotation(viewport_name)
		tm = Matrix4x4.from_quaternion_position(camera_rotation, position)
	else
		tm = Matrix4x4.from_quaternion_position(Quaternion.identity(), position)
	end

	local text_extent_min, text_extent_max = Gui.text_extents(gui, text, font, text_size)
	local text_width = text_extent_max[1] - text_extent_min[1]
	local text_height = text_extent_max[2] - text_extent_min[2]
	local text_offset = Vector3(-text_width / 2, -text_height / 2, 0)
	category = category or "none"
	color = color or Vector3(255, 255, 255)
	local new_text = {
		id = Gui.text_3d(gui, text, font, text_size, material, tm, text_offset, 0, Color(color.x, color.y, color.z)),
		text = text,
		text_size = text_size,
		position = {
			x = position.x,
			y = position.y,
			z = position.z
		},
		text_offset = {
			x = text_offset.x,
			y = text_offset.y,
			z = text_offset.z
		},
		color = {
			r = color.x,
			g = color.y,
			b = color.z
		},
		time = self._time + (time or self._world_text_time)
	}
	self._world_texts[category] = self._world_texts[category] or {}
	self._world_texts[category][#self._world_texts[category] + 1] = new_text
end

DebugTextManager.clear_world_text = function (self, clear_category)
	for category, gui_texts in pairs(self._world_texts) do
		if not clear_category or category == "none" or clear_category == category then
			for i = #gui_texts, 1, -1 do
				local gui_text = gui_texts[i]

				Gui.destroy_text_3d(self._world_gui, gui_text.id)
				table.remove(gui_texts, i)
			end
		end
	end
end

DebugTextManager.output_screen_text = function (self, text, text_size, time, color)
	if script_data and script_data.disable_debug_draw then
		return
	end

	text_size = text_size or self._screen_text_size
	color = color or Vector3(255, 255, 255)
	local gui = self._gui
	local resolution = Vector2(RESOLUTION_LOOKUP.res_w, RESOLUTION_LOOKUP.res_h)
	local material = "arial"
	local font = "materials/fonts/" .. material
	local text_extent_min, text_extent_max = Gui.text_extents(gui, text, font, text_size)
	local text_w = text_extent_max[1] - text_extent_min[1]
	local text_h = text_extent_max[2] - text_extent_min[2]
	local text_position = Vector3(resolution.x / 2 - text_w / 2, resolution.y / 2 - text_h / 2, 11)
	local bgr_margin = 10
	local bgr_x = text_position.x - bgr_margin
	local bgr_y = text_position.y - bgr_margin
	local bgr_w = text_w + bgr_margin * 2
	local bgr_h = text_h + bgr_margin * 2
	local bgr_position = Vector3(bgr_x, bgr_y, 10)
	local bgr_size = Vector2(bgr_w, bgr_h)

	if self._screen_text then
		Gui.update_text(gui, self._screen_text.text_id, text, font, text_size, material, text_position, Color(color.x, color.y, color.z))
		Gui.update_rect(gui, self._screen_text.bgr_id, bgr_position, bgr_size, Color(120, 0, 0, 0))

		self._screen_text.time = self._time + (time or self._screen_text_time)
	else
		local screen_text = {
			text_id = Gui.text(gui, text, font, text_size, material, text_position, Color(color.x, color.y, color.z)),
			bgr_id = Gui.rect(gui, bgr_position, bgr_size, Color(120, 0, 0, 0)),
			time = self._time + (time or self._screen_text_time)
		}
		self._screen_text = screen_text
	end
end

DebugTextManager.destroy = function (self)
	if self._screen_text then
		Gui.destroy_text(self._gui, self._screen_text.text_id)
		Gui.destroy_rect(self._gui, self._screen_text.bgr_id)

		self._screen_text = nil
	end

	for unit, categories in pairs(self._unit_texts) do
		self:_destroy_unit_texts(unit)
	end

	for category, gui_texts in pairs(self._world_texts) do
		for i, gui_text in ipairs(gui_texts) do
			Gui.destroy_text_3d(self._world_gui, gui_text.id)
		end
	end
end

DebugTextManager._destroy_unit_texts = function (self, unit)
	local categories = self._unit_texts[unit]

	for category, gui_texts in pairs(categories) do
		for i, gui_text in ipairs(gui_texts) do
			Gui.destroy_text_3d(self._world_gui, gui_text.id)
		end
	end

	self._unit_texts[unit] = nil
end

return

local array = require("foundation/scripts/util/array")
GraphDrawer = class(GraphDrawer)
GraphDrawer.init = function (self, world, input_manager)
	self.world = world
	self.input_manager = input_manager
	self.gui = World.create_screen_gui(world, "material", "materials/fonts/gw_fonts", "material", "materials/menu/debug_screen", "immediate")
	self.graphs = {}
	self.unblocked_services = {}
	self.unblocked_services_n = 0
	self.active = false

	return 
end
GraphDrawer.create_graph = function (self, graph_name, axis_names)
	local graph = Graph:new(graph_name, axis_names)
	self.graphs[graph_name] = graph

	return graph
end
GraphDrawer.destroy_graph = function (self, graph)
	self.graphs[graph.name] = nil

	return 
end
GraphDrawer.graph = function (self, graph_name)
	return self.graphs[graph_name]
end
GraphDrawer.update = function (self, input_service, t)
	if input_service.get(input_service, "f11") then
		if not self.active then
			self.unblocked_services_n = self.input_manager:get_unblocked_services(nil, nil, self.unblocked_services)

			self.input_manager:device_block_services("mouse", 1, self.unblocked_services, self.unblocked_services_n)
			self.input_manager:device_unblock_service("mouse", 1, "Debug")
			Window.set_show_cursor(true)
		else
			self.input_manager:device_block_service("mouse", 1, "Debug")
			self.input_manager:device_unblock_services("mouse", 1, self.unblocked_services, self.unblocked_services_n)
			Window.set_show_cursor(false)
		end

		self.active = not self.active
	end

	if self.active then
		Debug.text("GraphDrawer active, other mouse input disabled")
	end

	Profiler.start("GraphDrawer")

	local res_x = RESOLUTION_LOOKUP.res_w
	local res_y = RESOLUTION_LOOKUP.res_h
	local gui = self.gui

	for graph_name, graph in pairs(self.graphs) do
		if graph.active then
			Profiler.start("update")

			if self.active then
				graph.update(graph, input_service, t)
			end

			Profiler.stop("update")
			Profiler.start("draw")
			graph.draw(graph, gui, input_service, t)
			Profiler.stop("draw")
		end
	end

	Profiler.stop("GraphDrawer")

	return 
end
Graph = class(Graph)
Graph.init = function (self, name, axis_names)
	self.name = name
	self.axis_names = axis_names
	self.circle_index = 0
	self.active = true
	self.range_x = {
		math.huge,
		-math.huge
	}
	self.range_y = {
		math.huge,
		-math.huge
	}
	self.visual_frame = {
		x_min = 0,
		x_max = 0,
		y_min = 0,
		y_max = 0
	}
	self.plots = {}
	self.annotations_x = array.new()
	self.annotations_data = array.new()
	self.scroll_lock = {
		vertical = true,
		left = true,
		right = true
	}
	self.valid = false
	self.zoom_window = nil

	return 
end
Graph.reset = function (self)
	self.plots = {}

	array.set_empty(self.annotations_x)
	array.set_empty(self.annotations_data)

	self.range_x = {
		math.huge,
		-math.huge
	}
	self.range_y = {
		math.huge,
		-math.huge
	}
	self.visual_frame = {
		x_min = 0,
		x_max = 0,
		y_min = 0,
		y_max = 0
	}
	self.valid = false
	self.scroll_lock = {
		vertical = true,
		left = true,
		right = true
	}
	self.zoom_window = nil
	self.state = nil

	return 
end
Graph.set_active = function (self, active)
	self.active = active

	return 
end
Graph.set_plot_color = function (self, plot_name, point_color, line_color)
	local plot = self.plots[plot_name]

	if plot == nil then
		plot = {
			points_x = array.new(),
			points_y = array.new()
		}
		self.plots[plot_name] = plot
	end

	plot.point_color = point_color
	plot.line_color = line_color

	return 
end
Graph.add_point = function (self, x, y, plot_name)
	plot_name = plot_name or "default"
	local plot = self.plots[plot_name]

	if plot == nil then
		plot = {
			points_x = array.new(),
			points_y = array.new()
		}
		self.plots[plot_name] = plot
	end

	self.range_x[1] = math.min(x, self.range_x[1])
	self.range_x[2] = math.max(x, self.range_x[2])
	self.range_y[1] = math.min(y, self.range_y[1])
	self.range_y[2] = math.max(y, self.range_y[2])
	local index = array.binary_insert(plot.points_x, x)

	array.insert_at(plot.points_y, y, index)

	local num_points = array.num_items(plot.points_x)

	if self.scroll_lock.left then
		self.visual_frame.x_min = self.range_x[1]
	end

	if self.scroll_lock.right then
		self.visual_frame.x_max = self.range_x[2]
	end

	if self.scroll_lock.vertical then
		self.visual_frame.y_min = self.range_y[1]
		self.visual_frame.y_max = self.range_y[2]
	end

	self.valid = self.valid or (1 < num_points and 1e-05 < math.abs(self.range_x[2] - self.range_x[1]) and 1e-05 < math.abs(self.range_y[2] - self.range_y[1]))

	return 
end
Graph.add_annotation = function (self, annotation)
	local index = array.binary_insert(self.annotations_x, annotation.x)

	array.insert_at(self.annotations_data, annotation, index)

	return 
end
Graph.move_annotation = function (self, annotation, new_x)
	if new_x == annotation.x then
		return 
	end

	local item, old_index = array.pop_item_ordered(self.annotations_data, annotation)

	if item then
		array.pop_item_ordered(self.annotations_x, annotation.x)

		annotation.x = new_x
		local index = array.binary_insert(self.annotations_x, new_x)

		array.insert_at(self.annotations_data, annotation, index)
	end

	return 
end
Graph.set_visual_range = function (self, x_min, x_max, y_min, y_max)
	self.visual_frame = {
		x_min = x_min,
		x_max = x_max,
		y_min = y_min,
		y_max = y_max
	}

	return 
end
Graph.update = function (self, input_service, t)
	if not self.valid then
		return 
	end

	local mouse = input_service.get(input_service, "cursor")
	local origin = Vector3(100, 100, 0)
	local graph_size_x = 800
	local graph_size_y = 400
	self.state = self.state or "waiting_for_zoom_window"

	if self.state == "waiting_for_zoom_window" then
		if input_service.get(input_service, "mouse_left_held") then
			self.state = "drawing_zoom_window"
		end

		if input_service.get(input_service, "mouse_middle_held") then
			self.state = "panning"
		end

		if input_service.get(input_service, "mouse_right_held") then
			self.zoom_window = {}
			local zoom_factor_x_min = (self.visual_frame.x_max - self.range_x[1]) / (self.visual_frame.x_max - self.visual_frame.x_min)
			local zoom_factor_x_max = (self.range_x[2] - self.visual_frame.x_min) / (self.visual_frame.x_max - self.visual_frame.x_min)
			local zoom_factor_y_min = (self.visual_frame.y_max - self.range_y[1]) / (self.visual_frame.y_max - self.visual_frame.y_min)
			local zoom_factor_y_max = (self.range_y[2] - self.visual_frame.y_min) / (self.visual_frame.y_max - self.visual_frame.y_min)
			self.zoom_window.x_min = (origin.x + graph_size_x) - graph_size_x * zoom_factor_x_min
			self.zoom_window.x_max = origin.x + graph_size_x * zoom_factor_x_max
			self.zoom_window.y_min = (origin.y + graph_size_y) - graph_size_y * zoom_factor_y_min
			self.zoom_window.y_max = origin.y + graph_size_y * zoom_factor_y_max
			self.zoom_window.min_size = 100
			self.scroll_lock.right = true
			self.scroll_lock.left = true
			self.scroll_lock.vertical = true
			self.state = "zoom_prepare"
		end
	end

	if self.state == "drawing_zoom_window" then
		if input_service.get(input_service, "mouse_left_held") then
			if self.zoom_window == nil then
				local x_inside = true
				local y_inside = true

				if origin.x + graph_size_x < mouse.x then
					local zoom_factor = (self.range_x[2] - self.visual_frame.x_min) / (self.visual_frame.x_max - self.visual_frame.x_min)
					self.zoom_window = {
						x_min = origin.x,
						x_max = origin.x + graph_size_x * zoom_factor,
						y_min = origin.y,
						y_max = origin.y + graph_size_y,
						min_size = 100
					}
					self.scroll_lock.right = true
					self.state = "zoom_prepare"

					return 
				elseif mouse.x < origin.x then
					local zoom_factor = (self.visual_frame.x_max - self.range_x[1]) / (self.visual_frame.x_max - self.visual_frame.x_min)
					self.zoom_window = {
						x_min = (origin.x + graph_size_x) - graph_size_x * zoom_factor,
						x_max = origin.x + graph_size_x,
						y_min = origin.y,
						y_max = origin.y + graph_size_y,
						min_size = 100
					}
					self.scroll_lock.left = true
					self.state = "zoom_prepare"

					return 
				end

				if origin.y + graph_size_y < mouse.y then
					local zoom_factor_min = (self.visual_frame.y_max - self.range_y[1]) / (self.visual_frame.y_max - self.visual_frame.y_min)
					local zoom_factor_max = (self.range_y[2] - self.visual_frame.y_min) / (self.visual_frame.y_max - self.visual_frame.y_min)
					self.zoom_window = {
						x_min = (origin.x + graph_size_x) - graph_size_x,
						x_max = origin.x + graph_size_x,
						y_min = (origin.y + graph_size_y) - graph_size_y * zoom_factor_min,
						y_max = origin.y + graph_size_y * zoom_factor_max,
						min_size = 100
					}
					self.scroll_lock.vertical = true
					self.state = "zoom_prepare"

					return 
				end

				self.zoom_window = {
					x_start = mouse.x,
					y_start = mouse.y
				}
			end

			self.zoom_window.x_end = mouse.x
			self.zoom_window.y_end = mouse.y
			self.zoom_window.x_min = math.min(self.zoom_window.x_end, self.zoom_window.x_start)
			self.zoom_window.x_max = math.max(self.zoom_window.x_end, self.zoom_window.x_start)
			self.zoom_window.y_min = math.min(self.zoom_window.y_end, self.zoom_window.y_start)
			self.zoom_window.y_max = math.max(self.zoom_window.y_end, self.zoom_window.y_start)
			self.zoom_window.min_size = math.min(self.zoom_window.x_max - self.zoom_window.x_min, self.zoom_window.y_max - self.zoom_window.y_min)
		elseif self.zoom_window ~= nil and self.zoom_window.min_size < 20 then
			self.zoom_window = nil
			self.state = "waiting_for_zoom_window"
		elseif self.zoom_window then
			self.state = "zoom_prepare"
			self.scroll_lock.left = false
			self.scroll_lock.right = false
			self.scroll_lock.vertical = false
		end
	end

	if self.state == "panning" then
		if not input_service.get(input_service, "mouse_middle_held") then
			self.state = "waiting_for_zoom_window"
			self.pan_previous = nil

			return 
		end

		if self.pan_previous == nil then
			self.pan_previous = {
				x = mouse.x,
				y = mouse.y
			}
		end

		local pan = Vector2(self.pan_previous.x - mouse.x, self.pan_previous.y - mouse.y)
		local scale_x = (self.visual_frame.x_max - self.visual_frame.x_min) / graph_size_x
		local scale_y = (self.visual_frame.y_max - self.visual_frame.y_min) / graph_size_y

		if not self.scroll_lock.left then
			self.visual_frame.x_min = self.visual_frame.x_min + pan.x * scale_x
		end

		if not self.scroll_lock.right then
			self.visual_frame.x_max = self.visual_frame.x_max + pan.x * scale_x
		end

		if not self.scroll_lock.vertical then
			self.visual_frame.y_min = self.visual_frame.y_min + pan.y * scale_y
			self.visual_frame.y_max = self.visual_frame.y_max + pan.y * scale_y
		end

		self.pan_previous = {
			x = mouse.x,
			y = mouse.y
		}
	end

	if self.state == "zoom_prepare" then
		local x_min_percentage = (self.zoom_window.x_min - origin.x) / graph_size_x
		local x_max_percentage = (self.zoom_window.x_max - origin.x) / graph_size_x
		local y_min_percentage = (self.zoom_window.y_min - origin.x) / graph_size_y
		local y_max_percentage = (self.zoom_window.y_max - origin.x) / graph_size_y
		self.visual_frame.x_min = math.max(self.range_x[1], self.visual_frame.x_min)
		self.visual_frame.x_max = math.min(self.range_x[2], self.visual_frame.x_max)
		self.visual_frame.y_min = math.max(self.range_y[1], self.visual_frame.y_min)
		self.visual_frame.y_max = math.min(self.range_y[2], self.visual_frame.y_max)
		local visual_x_min = self.visual_frame.x_min
		local visual_x_max = self.visual_frame.x_max
		local visual_y_min = self.visual_frame.y_min
		local visual_y_max = self.visual_frame.y_max
		local x_min = math.lerp(visual_x_min, visual_x_max, x_min_percentage)
		local x_max = math.lerp(visual_x_min, visual_x_max, x_max_percentage)
		local y_min = math.lerp(visual_y_min, visual_y_max, y_min_percentage)
		local y_max = math.lerp(visual_y_min, visual_y_max, y_max_percentage)
		self.zoom_window.target_x_min = x_min
		self.zoom_window.target_x_max = x_max
		self.zoom_window.target_y_min = y_min
		self.zoom_window.target_y_max = y_max
		self.anim_done_t = t + 1
		self.state = "zooming"
	end

	if self.state == "zooming" then
		Debug.text("zooming")

		self.zoom_window.x_min = math.lerp(self.zoom_window.x_min, origin.x, 0.2)
		self.zoom_window.x_max = math.lerp(self.zoom_window.x_max, origin.x + graph_size_x, 0.2)
		self.zoom_window.y_min = math.lerp(self.zoom_window.y_min, origin.y, 0.2)
		self.zoom_window.y_max = math.lerp(self.zoom_window.y_max, origin.y + graph_size_y, 0.2)
		local target_x_min = self.zoom_window.target_x_min
		local target_x_max = self.zoom_window.target_x_max
		local target_y_min = self.zoom_window.target_y_min
		local target_y_max = self.zoom_window.target_y_max
		self.visual_frame.x_min = math.lerp(self.visual_frame.x_min, target_x_min, 0.2)
		self.visual_frame.x_max = math.lerp(self.visual_frame.x_max, target_x_max, 0.2)
		self.visual_frame.y_min = math.lerp(self.visual_frame.y_min, target_y_min, 0.2)
		self.visual_frame.y_max = math.lerp(self.visual_frame.y_max, target_y_max, 0.2)

		Debug.text(self.visual_frame.x_min)

		if self.anim_done_t < t then
			self.visual_frame.x_min = target_x_min
			self.visual_frame.x_max = target_x_max
			self.visual_frame.y_min = target_y_min
			self.visual_frame.y_max = target_y_max
			self.anim_done_t = nil
			self.zoom_window = nil
			self.state = "waiting_for_zoom_window"
		end
	end

	return 
end
Graph.draw = function (self, gui, input_service, t)
	local mouse = input_service.get(input_service, "cursor")
	local layer = 1
	local line_width = 2
	local font_size = 26
	local font = "gw_arial_32"
	local font_mtrl = "materials/fonts/" .. font
	local color_bg = Colors.get_color_with_alpha("navy", (Window.show_cursor() and 100) or 50)
	local color_point_line = Colors.get("aqua_marine")
	local color_point_bg = Colors.get("white")
	local color_point_fg = Colors.get("black")
	local color_annotation_box = Colors.get("white")
	local color_annotation_line = Colors.get_color_with_alpha("yellow", 100)
	local color_annotation_line_hot = Colors.get("yellow")
	local color_annotation_text_bg = Colors.get_color_with_alpha("black", 100)
	local color_annotation_bg = Colors.get_color_with_alpha("black", 150)
	local color_axis = Colors.get("white")
	local color_zoom_window = Colors.get_color_with_alpha("white", (self.anim_done_t == nil and 100) or math.lerp(100, 0, 1 - self.anim_done_t - t))
	local color_zoom_window_too_small = Colors.get_color_with_alpha("red", 100)
	local origin = Vector3(100, 100, 0)
	local graph_size_x = 800
	local graph_size_y = 400

	Gui.rect(gui, origin, Vector2(graph_size_x, graph_size_y), color_bg)

	local axis_x_p1 = Vector3(origin.x + graph_size_x + 5, 0, origin.y + 5)
	local axis_x_p2 = Vector3(origin.x + graph_size_x + 5, 0, origin.y - 5)
	local axis_x_p3 = Vector3(origin.x + graph_size_x + 15, 0, origin.y)

	Gui.triangle(gui, axis_x_p1, axis_x_p2, axis_x_p3, layer, color_axis)

	local axis_y_p1 = Vector3(origin.x + 5, 0, origin.y + graph_size_y + 5)
	local axis_y_p2 = Vector3(origin.x - 5, 0, origin.y + graph_size_y + 5)
	local axis_y_p3 = Vector3(origin.x, 0, origin.y + graph_size_y + 15)

	Gui.triangle(gui, axis_y_p1, axis_y_p2, axis_y_p3, layer, color_axis)
	ScriptGUI.hud_line(gui, origin, origin + Vector3(graph_size_x + 10, 0, 0), layer, 1, color_axis)
	ScriptGUI.hud_line(gui, origin, origin + Vector3(0, graph_size_y + 10, 0), layer, 1, color_axis)
	Gui.text(gui, self.axis_names[1], font_mtrl, font_size, font, origin + Vector3(-50 + graph_size_x, -20, 0), color_axis)
	Gui.text(gui, self.axis_names[2], font_mtrl, font_size, font, origin + Vector3(-50, graph_size_y + 20, 0), color_axis)

	local visual_x_min = self.visual_frame.x_min
	local visual_x_max = self.visual_frame.x_max
	local visual_y_min = self.visual_frame.y_min
	local visual_y_max = self.visual_frame.y_max

	if visual_x_max == visual_x_min or visual_y_max == visual_y_min then
		return 
	end

	Gui.text(gui, string.format("(%.2f, %.2f)", visual_x_min, visual_y_min), font_mtrl, font_size, font, origin + Vector3(-50, -20, 0), color_axis)
	Gui.text(gui, string.format("(%.2f, %.2f)", visual_x_max, visual_y_max), font_mtrl, font_size, font, origin + Vector3(-50 + graph_size_x, 10 + graph_size_y, 0), color_axis)

	if not self.valid then
		return 
	end

	local scale_x = graph_size_x / (visual_x_max - visual_x_min)
	local scale_y = graph_size_y / (visual_y_max - visual_y_min)

	for plot_name, plot in pairs(self.plots) do
		local line_color = (plot.line_color and Colors.get(plot.line_color)) or color_point_line
		local point_color = (plot.line_color and Colors.get(plot.line_color)) or color_point_bg
		local xs = array.items(plot.points_x)
		local ys = array.items(plot.points_y)
		local p1 = Vector3((xs[1] - visual_x_min) * scale_x, (ys[1] - visual_y_min) * scale_y, 0)
		local num_points = array.num_items(plot.points_x)

		for i = 2, num_points, 1 do
			local p2 = Vector3((xs[i] - visual_x_min) * scale_x, (ys[i] - visual_y_min) * scale_y, 0)
			local p1_x_inside = 0 <= p1.x and p1.x <= graph_size_x
			local p1_y_inside = 0 <= p1.y and p1.y <= graph_size_y
			local p2_x_inside = 0 <= p2.x and p2.x <= graph_size_x
			local p2_y_inside = 0 <= p2.y and p2.y <= graph_size_y

			if (p1_x_inside and p1_y_inside) or (p2_x_inside and p2_y_inside) then
				ScriptGUI.hud_line(gui, p1 + origin, p2 + origin, layer, line_width, line_color)
				Gui.rect(gui, p2 + origin + Vector3(-3, -3, 100), Vector3(6, 6, 0), point_color)
			end

			p1 = p2
		end
	end

	local annotations = array.items(self.annotations_data)
	local num_annotations = array.num_items(self.annotations_data)
	local last_x = -10
	local annotation_y_offset = -10
	local annotation_text_y_offset = 0

	for i = 1, num_annotations, 1 do
		local annotation = annotations[i]
		local pos = Vector3((annotation.x - visual_x_min) * scale_x, 0, 0)
		local x_inside = 0 <= pos.x and pos.x <= graph_size_x

		if x_inside then
			if pos.x < last_x + 8 then
				annotation_y_offset = annotation_y_offset - 10
			else
				annotation_y_offset = -10
			end

			last_x = pos.x
			pos.y = pos.y + annotation_y_offset

			if Vector3.distance_squared(pos + origin, mouse) < 64 then
				Gui.rect(gui, pos + origin + Vector3(-5, -5, 10), Vector3(10, 10, 0), color_annotation_box)

				local color_annotation_line_hot = Colors.get(annotation.color)

				ScriptGUI.hud_line(gui, pos + origin + Vector3(0, -annotation_text_y_offset, 0), pos + origin + Vector3(0, graph_size_y, 0), layer, 2, color_annotation_line_hot)

				local text_min, text_max, caret = Gui.text_extents(gui, annotation.text, font_mtrl, font_size)
				local text_width = text_max.x - text_min.x + 10
				local color_annotation_box = Colors.get(annotation.color)

				Gui.rect(gui, origin + Vector3(0, -70 - annotation_text_y_offset, 0), Vector3(text_width, 30, 0), color_annotation_text_bg)
				Gui.rect(gui, origin + Vector3(0, -70 - annotation_text_y_offset, 0), Vector3(text_width, 5, 0), color_annotation_box)
				Gui.text(gui, annotation.text, font_mtrl, font_size, font, origin + Vector3(5, -60 - annotation_text_y_offset, 0), color_point_bg)

				local pos_graph = Vector3(pos.x, (annotation.y - visual_y_min) * scale_y, 0)

				Gui.rect(gui, pos_graph + origin + Vector3(-5, -5, 101), Vector3(10, 10, 0), color_annotation_box)
				Gui.rect(gui, pos_graph + origin + Vector3(-6, -6, 100), Vector3(12, 12, 0), color_point_bg)

				annotation_text_y_offset = annotation_text_y_offset + 30
			else
				local color_annotation_line_hot = Colors.get_color_with_alpha(annotation.color, 50)

				ScriptGUI.hud_line(gui, pos + origin, pos + origin + Vector3(0, graph_size_y, 0), layer, 1, color_annotation_line_hot)

				local color_annotation_box_hot = Colors.get_color_with_alpha(annotation.color, 150)
				local pos_graph = Vector3(pos.x, (annotation.y - visual_y_min) * scale_y, 0)

				Gui.rect(gui, pos_graph + origin + Vector3(-3, -3, 100), Vector3(6, 6, 0), color_annotation_box_hot)
			end

			local color_annotation_box = Colors.get(annotation.color)

			Gui.rect(gui, pos + origin + Vector3(-4, -4, 100), Vector3(8, 8, 0), color_annotation_box)
			ScriptGUI.hud_line(gui, pos + origin, pos + origin + Vector3(0, graph_size_y, 0), layer, 1, color_annotation_line)

			if annotation.live then
				local pos_graph = Vector3(pos.x, (annotation.y - visual_y_min) * scale_y, 0) + origin + Vector3(-3, -3, 100)

				Gui.text(gui, annotation.text, font_mtrl, font_size, font, pos_graph, color_annotation_box)
			end
		end
	end

	Gui.rect(gui, origin + Vector3(0, -40, 0), Vector3(graph_size_x, 40, 0), color_annotation_bg)

	if self.zoom_window then
		local bottom_left = Vector3(self.zoom_window.x_min, self.zoom_window.y_min, 0)
		local size = Vector3(self.zoom_window.x_max - self.zoom_window.x_min, self.zoom_window.y_max - self.zoom_window.y_min, 0)

		if self.zoom_window.min_size < 20 then
			Gui.rect(gui, bottom_left, size, color_zoom_window_too_small)
		else
			Gui.rect(gui, bottom_left, size, color_zoom_window)
		end
	else
		if origin.x + graph_size_x < mouse.x then
			Gui.rect(gui, origin + Vector3(graph_size_x, 0, 0), Vector2(50, graph_size_y), color_zoom_window)
		elseif mouse.x < origin.x then
			Gui.rect(gui, origin + Vector3(-50, 0, 0), Vector2(50, graph_size_y), color_zoom_window)
		end

		if origin.y + graph_size_y < mouse.y then
			Gui.rect(gui, origin + Vector3(0, -50, 0), Vector2(graph_size_x, 50), color_zoom_window)
			Gui.rect(gui, origin + Vector3(0, graph_size_y, 0), Vector2(graph_size_x, 50), color_zoom_window)
		end
	end

	return 
end

return 

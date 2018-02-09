local definitions = local_require("scripts/ui/views/keep_decoration_view_definitions")
local widget_definitions = definitions.widgets_definitions
local scenegraph_definition = definitions.scenegraph_definition
KeepDecorationView = class(KeepDecorationView)
local DO_RELOAD = false
KeepDecorationView.init = function (self, ingame_ui_context)
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	local input_manager = ingame_ui_context.input_manager
	self.input_manager = input_manager

	input_manager.create_input_service(input_manager, "keep_decoration_view", "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager.map_device_to_service(input_manager, "keep_decoration_view", "keyboard")
	input_manager.map_device_to_service(input_manager, "keep_decoration_view", "mouse")
	input_manager.map_device_to_service(input_manager, "keep_decoration_view", "gamepad")
	self.create_ui_elements(self)

	return 
end
KeepDecorationView.create_ui_elements = function (self, params)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
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

	return 
end
KeepDecorationView.input_service = function (self)
	return self.input_manager:get_service("keep_decoration_view")
end
KeepDecorationView.on_enter = function (self)
	ShowCursorStack.push()
	self.input_manager:block_device_except_service("keep_decoration_view", "keyboard", 1)
	self.input_manager:block_device_except_service("keep_decoration_view", "mouse", 1)
	self.input_manager:block_device_except_service("keep_decoration_view", "gamepad", 1)

	self.active = true
	self.viewport_widget = UIWidget.init(definitions.viewport_definition)
	local viewport_widget = self.viewport_widget
	local viewport_widget_pass_data = viewport_widget.element.pass_data[1]
	local viewport = viewport_widget_pass_data.viewport
	local world = viewport_widget_pass_data.world
	self.background_world = world
	self.background_viewport = viewport
	self.loaded_packages = {}
	self.packages_to_load = {}

	return 
end
KeepDecorationView.on_exit = function (self)
	self.input_manager:device_unblock_all_services("keyboard", 1)
	self.input_manager:device_unblock_all_services("mouse", 1)
	self.input_manager:device_unblock_all_services("gamepad", 1)

	self.active = nil
	self.exiting = nil

	self._destroy_units(self)
	self._unload_packages(self)
	table.clear(self.loaded_packages)
	table.clear(self.packages_to_load)

	if self.viewport_widget then
		UIWidget.destroy(self.ui_top_renderer, self.viewport_widget)
	end

	return 
end
KeepDecorationView.exit = function (self, return_to_game)
	ShowCursorStack.pop()

	local exit_transition = (return_to_game and "exit_menu") or "ingame_menu"

	self.ingame_ui:handle_transition(exit_transition)

	self.exiting = nil

	return 
end
KeepDecorationView.suspend = function (self)
	self.suspended = true

	self.input_manager:device_unblock_all_services("keyboard", 1)
	self.input_manager:device_unblock_all_services("mouse", 1)
	self.input_manager:device_unblock_all_services("gamepad", 1)

	return 
end
KeepDecorationView.unsuspend = function (self)
	self.input_manager:block_device_except_service("keep_decoration_view", "keyboard", 1)
	self.input_manager:block_device_except_service("keep_decoration_view", "mouse", 1)
	self.input_manager:block_device_except_service("keep_decoration_view", "gamepad", 1)

	self.suspended = nil

	return 
end
KeepDecorationView.post_update = function (self, dt)
	local widgets_by_name = self._widgets_by_name
	local widgets_by_name = self._widgets_by_name
	local next_button = widgets_by_name.next_button
	local previous_button = widgets_by_name.previous_button

	if self._is_button_pressed(self, next_button) then
		self.spawn_unit(self, "units/gameplay/loot_chests/gameplay_loot_chest_d1_t1")
		self._trigger_unit_flow_event(self, self.spawned_unit, "loot_chest_enter")
	elseif self._is_button_pressed(self, previous_button) then
		self.spawn_unit(self, "units/gameplay/loot_chests/gameplay_loot_chest_d4_t6")
		self._trigger_unit_flow_event(self, self.spawned_unit, "loot_chest_enter")
	end

	local input_manager = self.input_manager
	local input_service = self.input_manager:get_service("keep_decoration_view")
	local gamepad_active = input_manager.is_device_active(input_manager, "gamepad")
	local close_button = widgets_by_name.close_button

	if input_service.get(input_service, "toggle_menu", true) or (gamepad_active and input_service.get(input_service, "back", true)) or self._is_button_pressed(self, close_button) then
		self.exit(self)

		return 
	end

	return 
end
KeepDecorationView.update = function (self, dt)
	if DO_RELOAD then
		DO_RELOAD = false

		self.create_ui_elements(self)
	end

	if self.suspended then
		return 
	end

	local input_manager = self.input_manager
	local input_service = self.input_manager:get_service("keep_decoration_view")
	local gamepad_active = input_manager.is_device_active(input_manager, "gamepad")
	local input_axis = (gamepad_active and input_service.get(input_service, "gamepad_left_axis")) or input_service.get(input_service, "scroll_axis")
	local ui_top_renderer = self.ui_top_renderer

	UIRenderer.begin_pass(ui_top_renderer, self.ui_scenegraph, input_service, dt)

	if self.viewport_widget then
		UIRenderer.draw_widget(ui_top_renderer, self.viewport_widget)
	end

	local widgets = self._widgets

	if widgets then
		for _, widget in ipairs(widgets) do
			UIRenderer.draw_widget(ui_top_renderer, widget)
		end
	end

	UIRenderer.end_pass(ui_top_renderer)

	return 
end
KeepDecorationView._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end

	return 
end
KeepDecorationView._destroy_units = function (self)
	local world = self.background_world

	if self.spawned_unit and Unit.alive(self.spawned_unit) then
		World.destroy_unit(world, self.spawned_unit)

		self.spawned_unit = nil
	end

	return 
end
KeepDecorationView._trigger_unit_flow_event = function (self, unit, event_name)
	if unit and Unit.alive(unit) then
		Unit.flow_event(unit, event_name)
	end

	return 
end
KeepDecorationView._get_world = function (self)
	return self.background_world, self.background_viewport
end
KeepDecorationView._get_camera_position = function (self)
	local background_viewport = self.background_viewport
	local camera = ScriptViewport.camera(background_viewport)

	return ScriptCamera.position(camera)
end
KeepDecorationView._get_camera_rotation = function (self)
	local background_viewport = self.background_viewport
	local camera = ScriptViewport.camera(background_viewport)

	return ScriptCamera.rotation(camera)
end
KeepDecorationView._packages_loaded = function (self)
	local units_to_spawn = self.units_to_spawn
	local loaded_packages = self.loaded_packages

	for package_index, package_list in ipairs(units_to_spawn) do
		for index, package_data in ipairs(package_list) do
			if not loaded_packages[package_data.unit_name] then
				return false
			end
		end
	end

	return true
end
KeepDecorationView.load_package = function (self, package_name)
	if self.package_to_load ~= package_name then
		return 
	end

	self.package_name_loaded = nil
	self.package_to_load = package_name
	local package_manager = Managers.package
	local cb = callback(self, "_on_load_complete", package_name)
	local reference_name = "KeepDecorationView"

	if self.unique_id then
		reference_name = reference_name .. tostring(self.unique_id)
	end

	package_manager.load(package_manager, package_name, reference_name, cb, true)

	return 
end
KeepDecorationView._on_load_complete = function (self, package_name)
	self.package_name_loaded = package_name
	self.package_to_load = nil

	self.spawn_unit(self, package_name)

	return 
end
KeepDecorationView._unload_packages = function (self)
	local reference_name = "KeepDecorationView"

	if self.unique_id then
		reference_name = reference_name .. tostring(self.unique_id)
	end

	local package_manager = Managers.package

	if self.package_name_loaded then
		package_manager.unload(package_manager, self.package_name_loaded, reference_name)
	elseif self.package_to_load then
		package_manager.unload(package_manager, self.package_to_load, reference_name)
	end

	self.package_to_load = nil
	self.package_name_loaded = nil

	return 
end
KeepDecorationView.spawn_unit = function (self, unit_name)
	local world = self.background_world

	if self.spawned_unit and Unit.alive(self.spawned_unit) then
		World.destroy_unit(world, self.spawned_unit)

		self.spawned_unit = nil
	end

	local camera_rotation = self._get_camera_rotation(self)
	local camera_forward_vector = Quaternion.forward(camera_rotation)
	local camera_look_rotation = Quaternion.look(camera_forward_vector, Vector3.up())
	local horizontal_rotation = Quaternion.axis_angle(Vector3.up(), math.pi*1)
	local unit_spawn_rotation = Quaternion.multiply(camera_look_rotation, horizontal_rotation)
	local camera_position = self._get_camera_position(self)
	local unit_spawn_position = camera_position + camera_forward_vector
	local unit = World.spawn_unit(world, unit_name, unit_spawn_position, unit_spawn_rotation)

	Unit.set_unit_visibility(unit, true)

	local unit_box, box_dimension = Unit.box(unit)
	local unit_center_position = Matrix4x4.translation(unit_box)
	local unit_root_position = Unit.world_position(unit, 0)
	local offset = unit_center_position - unit_root_position

	if box_dimension then
		local max_value = 0.3
		local largest_value = 0

		if largest_value < box_dimension.x then
			largest_value = box_dimension.x
		end

		if largest_value < box_dimension.z then
			largest_value = box_dimension.z
		end

		if largest_value < box_dimension.y then
			largest_value = box_dimension.y
		end

		if max_value < largest_value then
			local diff = largest_value - max_value
			local scale_fraction = diff/largest_value - 1
			local scale = Vector3(scale_fraction, scale_fraction, scale_fraction)

			Unit.set_local_scale(unit, 0, scale)

			offset = offset*scale_fraction
		end

		local display_position = unit_spawn_position - offset

		Unit.set_local_position(unit, 0, display_position)
	end

	self.spawned_unit = unit

	return unit
end

return 

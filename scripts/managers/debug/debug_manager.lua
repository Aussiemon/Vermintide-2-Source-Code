require("scripts/managers/debug/debug_drawer")
require("scripts/managers/debug/debug_drawer_release")
require("scripts/managers/debug/debug")
require("scripts/managers/debug/profiler_scopes")

DebugManager = class(DebugManager)
QuickDrawer = QuickDrawer or true
QuickDrawerStay = QuickDrawerStay or true
local RPCS = {
	"rpc_debug_command"
}
GLOBAL_TIME_SCALE = GLOBAL_TIME_SCALE or 1
local time_scale_list = {
	1e-05,
	0.0001,
	0.001,
	0.01,
	0.1,
	1,
	5,
	10,
	20,
	30,
	50,
	75,
	100,
	125,
	150,
	175,
	200,
	250,
	300,
	500,
	750,
	1000,
	5000,
	10000
}
local speed_scale_list = {
	10,
	20,
	30,
	40,
	50,
	75,
	100,
	150,
	200,
	250,
	300,
	500,
	750,
	1000,
	2000,
	3000,
	5000
}
local NOT_USED = 0

DebugManager.init = function (self, world, free_flight_manager, input_manager, network_event_delegate, is_server)
	self._world = world
	self._drawers = {}
	self.free_flight_manager = free_flight_manager
	self.input_manager = input_manager
	self.input_service = self.input_manager:get_service("Debug")
	self.is_server = is_server
	self._actor_draw = {}
	self._paused = false
	self._visualize_units = {}
	QuickDrawer = self:drawer({
		name = "quick_debug",
		mode = "immediate"
	})
	QuickDrawerStay = self:drawer({
		name = "quick_debug_stay",
		mode = "retained"
	})
	self.time_paused = false
	self.time_scale_index = table.find(time_scale_list, 100)
	self.time_scale_accumulating_value = 0
	self.speed_scale_index = table.find(speed_scale_list, 100)
	self.graph_drawer = GraphDrawer:new(world, input_manager)
	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))

	self.time_scale_list = time_scale_list
	self._debug_updates = {}
end

DebugManager.drawer = function (self, options)
	options = options or {}
	local drawer_name = options.name
	local drawer = nil
	local drawer_api = (BUILD == "release" and DebugDrawerRelease) or DebugDrawer

	if drawer_name == nil then
		local line_object = World.create_line_object(self._world)
		drawer = drawer_api:new(line_object, options.mode)
		self._drawers[#self._drawers + 1] = drawer
	elseif self._drawers[drawer_name] == nil then
		local line_object = World.create_line_object(self._world)
		drawer = drawer_api:new(line_object, options.mode)
		self._drawers[drawer_name] = drawer
	else
		drawer = self._drawers[drawer_name]
	end

	return drawer
end

DebugManager.reset_drawer = function (self, drawer_name)
	if self._drawers[drawer_name] then
		self._drawers[drawer_name]:reset()
	end
end

DebugManager.update = function (self, dt, t)
	local dt = dt / (time_scale_list[self.time_scale_index] / 100)

	self:update_time_scale(dt)

	if Development.parameter("player_mechanics_goodness_debug") then
		self:_adjust_player_speed()
	end

	local gamepad_active = Managers.input:is_device_active("gamepad")

	if gamepad_active then
		self:_adjust_gamepad_player_speed()
	end

	local speed_scale = speed_scale_list[self.speed_scale_index]

	if speed_scale ~= 100 then
		if math.ceil(speed_scale) == speed_scale then
			Debug.text("Player speed scaled by " .. tostring(speed_scale) .. "%%")
		else
			local speed_scale_string = string.format("Speed scaled by %f", speed_scale)
			speed_scale_string = speed_scale_string:gsub("^(.-)0*$", "%1") .. "%%"

			Debug.text(speed_scale_string)
		end
	end

	if script_data.debug_wwise_timestamp then
		local timestamp = Wwise.get_timestamp()
		local hours = math.floor(timestamp / 3600000)
		local remaining = timestamp - hours * 1000 * 60 * 60
		local minutes = math.floor(remaining / 60000)
		remaining = remaining - minutes * 1000 * 60
		local seconds = math.floor(remaining / 1000)
		remaining = remaining - seconds * 1000

		Debug.text("Wwise Timestamp: %.2d:%.2d:%.2d.%.3d", hours, minutes, seconds, remaining)
	end

	if script_data.debug_particle_simulation then
		Debug.text("Particles simulated: " .. World.num_particles(self._world))
	end

	if script_data.debug_enemy_package_loader then
		Managers.state.game_mode.level_transition_handler.enemy_package_loader:debug_loaded_breeds()
	end

	self:_update_actor_draw(dt)

	for drawer_name, drawer in pairs(self._drawers) do
		Profiler.start(drawer_name)
		drawer:update(self._world)
		Profiler.stop(drawer_name)
	end

	self.graph_drawer:update(self.input_service, t)

	if DebugKeyHandler.key_pressed("f7", "cycle patched weapons") then
		self:cycle_patched_items(t)
	end

	local cycle_patch_items_at = self._cycle_patch_items_at

	if cycle_patch_items_at and cycle_patch_items_at < t then
		self:_cycle_patched_items()

		self._cycle_patch_items_at = nil
	end

	if script_data.debug_unit and script_data.debug_behaviour_trees then
		local debug_unit = script_data.debug_unit

		if Unit.alive(debug_unit) then
			local blackboard = ScriptUnit.extension(debug_unit, "ai_system"):blackboard()
			local action = blackboard.action

			if action then
				Debug.text(action.name)
			end
		end
	end

	local in_free_flight = self.free_flight_manager:active("global")

	if not in_free_flight and self._in_free_flight and script_data.has_mouse then
		self:_toggle_debug_mouse_cursor(false)
	end

	for _, func in pairs(self._debug_updates) do
		func(dt, t)
	end

	self._in_free_flight = in_free_flight

	if not in_free_flight then
		return
	end

	local player = Managers.player:player_from_peer_id(Network.peer_id())
	local controller = player.input_source
	local debug_mouse_cursor = controller and controller:has("debug_mouse_cursor") and controller:get("debug_mouse_cursor")

	if debug_mouse_cursor and script_data.has_mouse then
		local set = not self._debug_mouse_cursor

		self:_toggle_debug_mouse_cursor(set)
	end

	self:_update_paused_game(controller, dt)
end

DebugManager.register_update = function (self, name, func)
	self._debug_updates[name] = func
end

DebugManager.unregister_update = function (self, name)
	self._debug_updates[name] = nil
end

DebugManager.update_time_scale = function (self, dt)
	local time_paused = self.time_paused
	local time_scale_index = self.time_scale_index
	local input_manager = Managers.input

	if Keyboard.button(Keyboard.button_index("left shift")) > 0.5 then
		local wheel_axis = Mouse.axis_index("wheel")

		if Vector3.y(Mouse.axis(wheel_axis)) > 0 then
			time_scale_index = math.min(time_scale_index + 1, #time_scale_list)

			self:set_time_scale(time_scale_index)
		elseif Vector3.y(Mouse.axis(wheel_axis)) < 0 and GLOBAL_TIME_SCALE > 0.0001 then
			time_scale_index = math.max(time_scale_index - 1, 1)

			self:set_time_scale(time_scale_index)
		end
	elseif input_manager:is_device_active("gamepad") then
		local service = input_manager:get_service("Debug")

		if service and service:get("time_scale") then
			self.time_scale_accumulating_value = self.time_scale_accumulating_value + service:get("time_scale_axis") * dt * 5

			if self.time_scale_accumulating_value > 1 then
				time_scale_index = math.min(time_scale_index + 1, #time_scale_list)

				self:set_time_scale(time_scale_index)

				self.time_scale_accumulating_value = self.time_scale_accumulating_value - 1
			elseif self.time_scale_accumulating_value < -1 then
				time_scale_index = math.max(time_scale_index - 1, 1)

				self:set_time_scale(time_scale_index)

				self.time_scale_accumulating_value = self.time_scale_accumulating_value + 1
			end
		else
			self.time_scale_accumulating_value = 0
		end
	end

	if DebugKeyHandler.key_pressed("page up", "speed up time", "time") then
		time_scale_index = math.min(time_scale_index + 1, #time_scale_list)

		self:set_time_scale(time_scale_index)
	elseif DebugKeyHandler.key_pressed("page down", "slow down time", "time") then
		time_scale_index = math.max(time_scale_index - 1, 1)

		self:set_time_scale(time_scale_index)
	elseif DebugKeyHandler.key_pressed("home", "pause", "time") then
		time_paused = not time_paused

		if time_paused then
			self:set_time_paused()
		else
			self:set_time_scale(time_scale_index)
		end
	end

	if time_paused then
		Debug.text("Time paused. (press home to unpause)")
	else
		local time_scale = time_scale_list[time_scale_index]

		if time_scale ~= 100 then
			if math.ceil(time_scale) == time_scale then
				Debug.text("Time scaled by " .. tostring(time_scale) .. "%%")
			else
				local time_string = string.format("Time scaled by %f", time_scale)
				time_string = time_string:gsub("^(.-)0*$", "%1") .. "%%"

				Debug.text(time_string)
			end
		end
	end

	self.time_paused = time_paused
	self.time_scale_index = time_scale_index
end

DebugManager._adjust_player_speed = function (self)
	if Keyboard.button(Keyboard.button_index("left alt")) > 0.5 then
		local wheel_axis = Mouse.axis_index("wheel")
		local speed_scale_index = self.speed_scale_index

		if Vector3.y(Mouse.axis(wheel_axis)) > 0 then
			speed_scale_index = math.min(speed_scale_index + 1, #speed_scale_list)
			local units = PlayerUnitMovementSettings.get_active_units_in_movement_settings()

			for __, unit in pairs(units) do
				PlayerUnitMovementSettings.get_movement_settings_table(unit).player_speed_scale = speed_scale_list[speed_scale_index] * 0.01
			end
		elseif Vector3.y(Mouse.axis(wheel_axis)) < 0 then
			speed_scale_index = math.max(speed_scale_index - 1, 1)
			local units = PlayerUnitMovementSettings.get_active_units_in_movement_settings()

			for __, unit in pairs(units) do
				PlayerUnitMovementSettings.get_movement_settings_table(unit).player_speed_scale = speed_scale_list[speed_scale_index] * 0.01
			end
		end

		self.speed_scale_index = speed_scale_index
	end
end

DebugManager._adjust_gamepad_player_speed = function (self)
	local active_controller = Managers.account:active_controller()

	if not active_controller then
		return
	end

	local right_held = nil

	if PLATFORM ~= "ps4" then
		right_held = active_controller.button(active_controller.button_index("right_thumb")) > 0.5
	else
		right_held = active_controller.button(active_controller.button_index("r3")) > 0.5
	end

	if right_held then
		local up_pressed, down_pressed = nil

		if PLATFORM ~= "ps4" then
			up_pressed = active_controller.pressed(active_controller.button_index("d_up"))
			down_pressed = active_controller.pressed(active_controller.button_index("d_down"))
		else
			up_pressed = active_controller.pressed(active_controller.button_index("up"))
			down_pressed = active_controller.pressed(active_controller.button_index("down"))
		end

		local speed_scale_index = self.speed_scale_index

		if up_pressed then
			speed_scale_index = math.min(speed_scale_index + 1, #speed_scale_list)
			local units = PlayerUnitMovementSettings.get_active_units_in_movement_settings()

			for __, unit in pairs(units) do
				PlayerUnitMovementSettings.get_movement_settings_table(unit).player_speed_scale = speed_scale_list[speed_scale_index] * 0.01
			end
		elseif down_pressed then
			speed_scale_index = math.max(speed_scale_index - 1, 1)
			local units = PlayerUnitMovementSettings.get_active_units_in_movement_settings()

			for __, unit in pairs(units) do
				PlayerUnitMovementSettings.get_movement_settings_table(unit).player_speed_scale = speed_scale_list[speed_scale_index] * 0.01
			end
		end

		self.speed_scale_index = speed_scale_index
	end
end

DebugManager._update_actor_draw = function (self, dt)
	local world = self._world
	local physics_world = World.get_data(world, "physics_world")
	local pose = World.debug_camera_pose(world)

	for _, data in pairs(self._actor_draw) do
		PhysicsWorld.overlap(physics_world, function (...)
			self:_actor_draw_overlap_callback(data, ...)
		end, "shape", "sphere", "size", data.range, "pose", pose, "types", "both", "collision_filter", data.collision_filter)

		if data.actors then
			local drawer = self._actor_drawer

			for _, actor in ipairs(data.actors) do
				local box = ActorBox(actor)
				local unboxed = box:unbox()

				if unboxed then
					drawer:actor(actor, data.color:unbox(), pose)
				end
			end
		end
	end
end

DebugManager._actor_draw_overlap_callback = function (self, data, actors)
	data.actors = actors
end

DebugManager.enable_actor_draw = function (self, collision_filter, color, range)
	local world = self._world
	local physics_world = World.physics_world(world)

	PhysicsWorld.immediate_overlap(physics_world, "shape", "sphere", "size", 0.1, "position", Vector3(0, 0, 0), "types", "both", "collision_filter", collision_filter)

	self._actor_drawer = self:drawer({
		mode = "immediate",
		name = "_actor_drawer"
	})
	self._actor_draw[collision_filter] = {
		color = QuaternionBox(color),
		range = range,
		collision_filter = collision_filter
	}
end

DebugManager.disable_actor_draw = function (self, collision_filter)
	self._actor_draw[collision_filter] = nil
end

DebugManager.color = function (self, unit, alpha)
	fassert(Unit.alive(unit), "Trying to get color from a destroyed unit")

	local alpha = alpha or 255
	self._unit_color_list = self._unit_color_list or {}

	if not self._unit_color_list[unit] then
		self._unit_color_list[unit] = self:_get_next_color_index()
	end

	local color_index = self._unit_color_list[unit]
	local color_table = GameSettingsDevelopment.debug_unit_colors[color_index]
	local color = Color(alpha, color_table[1], color_table[2], color_table[3])

	return color, color_index
end

DebugManager._get_next_color_index = function (self)
	for unit, color_index in pairs(self._unit_color_list) do
		if not Unit.alive(unit) then
			self._unit_color_list[unit] = nil
		end
	end

	for index, color in pairs(GameSettingsDevelopment.debug_unit_colors) do
		if not self:_color_index_in_use(index) then
			return index
		end
	end

	return 1
end

DebugManager._color_index_in_use = function (self, index)
	for unit, color_index in pairs(self._unit_color_list) do
		if index == color_index then
			return true
		end
	end

	return false
end

DebugManager._toggle_debug_mouse_cursor = function (self, set)
	Window.set_show_cursor(set)

	if set then
		self._free_flight_update_global_free_flight = self.free_flight_manager._update_global_free_flight

		self.free_flight_manager._update_global_free_flight = function ()
			return
		end
	else
		self.free_flight_manager._update_global_free_flight = self._free_flight_update_global_free_flight
	end

	self._debug_mouse_cursor = set
end

DebugManager._update_paused_game = function (self, input, dt)
	local mouse_released = input:get("action_one")

	if not script_data.disable_debug_draw then
		self:_update_visuals(dt)
	end
end

DebugManager._update_visuals = function (self)
	local drawer = Managers.state.debug:drawer({
		name = "mouse_ray_hit",
		mode = "immediate"
	})

	if self._selected_unit then
		local color = self:color(self._selected_unit)
		local position = Unit.world_position(self._selected_unit, 0)

		drawer:sphere(position, 0.2, color)

		local move_to_position = self._visualize_units[self._selected_unit]

		if move_to_position then
			local position = move_to_position:unbox()

			drawer:sphere(position, 0.2, color)
		end
	end

	for unit, position_boxed in pairs(self._visualize_units) do
		local color = self:color(unit, 100)
		local position = Unit.world_position(unit, 0)

		drawer:sphere(position, 0.2, color)

		if position_boxed then
			local position = position_boxed:unbox()

			drawer:sphere(position, 0.2, color)
		end
	end
end

DebugManager.selected_unit = function (self)
	return self._selected_unit
end

DebugManager._create_screen_gui = function (self)
	self._screen_gui = World.create_screen_gui(self._world, "material", "materials/fonts/gw_fonts", "immediate")
end

DebugManager.draw_screen_rect = function (self, x, y, z, w, h, color)
	if not self._screen_gui then
		self:_create_screen_gui()
	end

	Gui.rect(self._screen_gui, Vector3(x, y, z or 1), Vector2(w, h), color or Color(255, 255, 255, 255))
end

DebugManager.draw_screen_text = function (self, x, y, z, text, size, color, font)
	if not self._screen_gui then
		self:_create_screen_gui()
	end

	local font_type = font or "hell_shark"
	local font_by_resolution = UIFontByResolution({
		dynamic_font = true,
		font_type = font_type,
		font_size = size
	})
	local font, size, material = unpack(font_by_resolution)

	Gui.text(self._screen_gui, text, font, size, material, Vector3(x, y, z), color or Color(255, 255, 255, 255))
end

DebugManager.screen_text_extents = function (self, text, size)
	if not self._screen_gui then
		self:_create_screen_gui()
	end

	local min, max = Gui.text_extents(self._screen_gui, text, GameSettings.ingame_font.font, size)
	local width = max[1] - min[1]
	local height = max[3] - min[3]

	return width, height
end

DebugManager.destroy = function (self)
	if self._screen_gui then
		World.destroy_gui(self._world, self._screen_gui)

		self._screen_gui = nil
	end

	self.network_event_delegate:unregister(self)
end

DebugManager.set_time_scale = function (self, time_scale_index)
	local time_scale = time_scale_list[time_scale_index] * 0.01

	Application.set_time_step_policy("external_multiplier", time_scale)

	GLOBAL_TIME_SCALE = time_scale

	if self.is_server then
		local debug_command_lookup = NetworkLookup.debug_commands.set_time_scale

		Managers.state.network.network_transmit:send_rpc_clients("rpc_debug_command", debug_command_lookup, time_scale_index)
	end

	self.time_scale_index = time_scale_index
	self.time_paused = false
end

DebugManager.set_time_paused = function (self)
	local time_scale = 1e-08

	Application.set_time_step_policy("external_multiplier", time_scale)

	GLOBAL_TIME_SCALE = time_scale

	if self.is_server then
		local debug_command_lookup = NetworkLookup.debug_commands.set_time_paused

		Managers.state.network.network_transmit:send_rpc_clients("rpc_debug_command", debug_command_lookup, NOT_USED)
	end

	self.time_paused = true
end

DebugManager.hot_join_sync = function (self, peer_id)
	local debug_command_lookup = NetworkLookup.debug_commands.set_time_scale

	Managers.state.network.network_transmit:send_rpc_clients("rpc_debug_command", debug_command_lookup, self.time_scale_index)
end

DebugManager.cycle_patched_items = function (self, t)
	local backend_manager = Managers.backend
	local is_local_backend = backend_manager:is_local()

	if not is_local_backend then
		Debug.sticky_text("patching of ItemMasterList only works with local backend")

		return
	end

	local patched_items_list = self._patched_items_list

	if not patched_items_list then
		patched_items_list = self:_load_patched_items_into_backend()
		self._patched_items_list = patched_items_list
		local session = Network.game_session()
		local other_peers = GameSession.other_peers(session)
		local rpc = RPC.rpc_debug_command
		local debug_command = NetworkLookup.debug_commands.load_patched_items_into_backend

		for _, peer_id in ipairs(other_peers) do
			rpc(peer_id, debug_command, NOT_USED)
		end

		if #other_peers > 0 then
			self._cycle_patch_items_at = t + 1

			return
		end
	end

	self:_cycle_patched_items()
end

DebugManager._cycle_patched_items = function (self)
	local patched_items_list = self._patched_items_list
	local current_index = self._current_patch_item_index
	local index, next_item_id = next(patched_items_list, current_index)

	if next_item_id == nil then
		index, next_item_id = next(patched_items_list)
	end

	local backend_items = Managers.backend:get_interface("items")
	local backend_common = Managers.backend:get_interface("common")
	local item_key = backend_items:get_key(next_item_id)
	local item_data = ItemMasterList[item_key]
	local player = Managers.player:local_player()
	local profile_index = player:profile_index()
	local career_index = player:career_index()
	local profile = SPProfiles[profile_index]
	local careers = profile.careers
	local career_data = careers[career_index]
	local career_name = career_data.name
	local can_wield = backend_common:can_wield(career_name, item_data)

	if can_wield then
		local slot_type = item_data.slot_type
		local slot_names = InventorySettings.slot_names_by_type[slot_type]
		local slot_name = slot_names[1]
		local unit = player.player_unit
		local inventory_extension = ScriptUnit.extension(unit, "inventory_system")

		inventory_extension:create_equipment_in_slot(slot_name, next_item_id)
		Debug.sticky_text("template:%s", item_data.template, "delay", 7)

		if item_data.right_hand_unit then
			Debug.sticky_text("right_hand_unit:%s", item_data.right_hand_unit, "delay", 7)
		end

		if item_data.left_hand_unit then
			Debug.sticky_text("left_hand_unit:%s", item_data.left_hand_unit, "delay", 7)
		end
	else
		Debug.sticky_text("%s can't use %s", career_name, item_key)
	end

	self._current_patch_item_index = index
end

DebugManager.rpc_debug_command = function (self, sender, debug_command_lookup, optional_parameter)
	local debug_command = NetworkLookup.debug_commands[debug_command_lookup]

	if debug_command == "load_patched_items_into_backend" then
		self._patched_items_list = self:_load_patched_items_into_backend()
	elseif debug_command == "set_time_scale" then
		local time_scale_index = optional_parameter

		self:set_time_scale(time_scale_index)
	elseif debug_command == "set_time_paused" then
		self:set_time_paused()
	end
end

DebugManager._load_patched_items_into_backend = function (self)
	local backend_manager = Managers.backend
	local is_local_backend = backend_manager:is_local()

	if not is_local_backend then
		Debug.sticky_text("patching of ItemMasterList only works with local backend")

		return
	end

	local added_items = {}
	local item_master_list_debug_patch = dofile("scripts/settings/equipment/item_master_list_debug_patch")

	for name, data in pairs(item_master_list_debug_patch) do
		repeat
			local already_exists = rawget(ItemMasterList, name)

			if already_exists then
				Debug.sticky_text("name %s already exists in ItemMasterList", name)
			else
				data.name = name
				ItemMasterList[name] = data
				local item_name_index = #NetworkLookup.item_names + 1
				NetworkLookup.item_names[item_name_index] = name
				NetworkLookup.item_names[name] = item_name_index
				local damage_source_index = #NetworkLookup.damage_sources + 1
				NetworkLookup.damage_sources[damage_source_index] = name
				NetworkLookup.damage_sources[name] = damage_source_index
				local right_hand_unit_name = data.right_hand_unit

				if right_hand_unit_name then
					self:_load_resource(right_hand_unit_name)
				end

				local left_hand_unit_name = data.left_hand_unit

				if left_hand_unit_name then
					self:_load_resource(left_hand_unit_name)
				end

				local backend_items = Managers.backend:get_interface("items")
				local backend_id = backend_items:award_item(name)

				table.insert(added_items, backend_id)
				printf("added %s: to ItemMasterList", name)
				printf("awarded %s: to player", name)
			end
		until true
	end

	return added_items
end

DebugManager._load_resource = function (self, unit_name)
	local husks_index = #NetworkLookup.husks + 1
	NetworkLookup.husks[husks_index] = unit_name
	NetworkLookup.husks[unit_name] = husks_index
	local NO_CALLBACK = nil
	local SYNCHRONOUS = false
	local PRIORITIZE = true
	local unit_name_3p = unit_name .. "_3p"

	Managers.package:load(unit_name, "debug_patch", NO_CALLBACK, SYNCHRONOUS, PRIORITIZE)
	Managers.package:load(unit_name_3p, "debug_patch", NO_CALLBACK, SYNCHRONOUS, PRIORITIZE)
end

return

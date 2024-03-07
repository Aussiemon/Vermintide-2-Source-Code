-- chunkname: @scripts/ui/hud_ui/dark_pact_climbing_ui.lua

local BROADPHASE_SEARCH_RADIUS = 50
local BROADPHASE_CELLS = 250
local DISTANCE_CHECK_DELAY = 0.5
local UPDATE_DISTANCE_SQ = 400

DarkPactClimbingUI = class(DarkPactClimbingUI)

DarkPactClimbingUI.init = function (self, parent, ingame_ui_context)
	self._local_player = ingame_ui_context.player
	self._raycast_frame_counter = 0
	self._world_markers_spawned = {}
	self._next_distance_check_time = -math.huge
	self._previous_position_box = Vector3Box(math.huge, math.huge, math.huge)
	self._broadphase_results = {}
	self._keep_marker_lookup = {}
	self._visible = true
	self._are_climb_units_registered = false

	self:_initialize_broadphase()
	self:_initialize_camera()
end

DarkPactClimbingUI.destroy = function (self)
	if not self._markers_cleared then
		self:_clear_world_markers()
	end
end

DarkPactClimbingUI._register_climb_units = function (self)
	local entity_system = Managers.state.entity
	local door_system = entity_system:system("door_system")

	self:_add_units_to_broadphase("tunneling", door_system:get_crawl_space_tunnel_units())
	self:_add_units_to_broadphase("spawning", door_system:get_crawl_space_spawner_units())

	local level_jump_units = entity_system:system("nav_graph_system"):level_jump_units()

	if level_jump_units then
		self:_add_units_to_broadphase("climbing", table.keys(level_jump_units))
	end

	self._are_climb_units_registered = true
end

DarkPactClimbingUI._add_units_to_broadphase = function (self, unit_type, unit_list)
	if not unit_list then
		return
	end

	for _, unit in ipairs(unit_list) do
		if Unit.alive(unit) and not self._broadphase_types[unit] then
			Broadphase.add(self._broadphase, unit, Unit.world_position(unit, 0), 1)

			self._broadphase_types[unit] = unit_type
		end
	end
end

DarkPactClimbingUI._initialize_broadphase = function (self)
	self._broadphase = Broadphase(BROADPHASE_SEARCH_RADIUS, BROADPHASE_CELLS)
	self._broadphase_types = {}
end

DarkPactClimbingUI._initialize_camera = function (self)
	local viewport_name = "player_1"
	local world = Managers.world:world("level_world")

	if Managers.state.camera:has_viewport(viewport_name) then
		self._camera = ScriptViewport.camera(ScriptWorld.viewport(world, viewport_name))
	end
end

DarkPactClimbingUI._broadphase_check = function (self, position)
	local broadphase_results = self._broadphase_results

	table.clear(broadphase_results)

	local num_hits = Broadphase.query(self._broadphase, position, BROADPHASE_SEARCH_RADIUS, broadphase_results)

	return broadphase_results, num_hits
end

DarkPactClimbingUI.update = function (self, dt, t)
	if not self._are_climb_units_registered then
		return
	end

	if not self._visible or not Unit.alive(self._local_player.player_unit) then
		if not self._markers_cleared then
			self:_clear_world_markers()
		end

		return
	end

	local camera = self._camera

	if not camera then
		return
	end

	if t < self._next_distance_check_time then
		return
	end

	self._next_distance_check_time = t + DISTANCE_CHECK_DELAY

	local camera_position = Camera.local_position(camera)
	local previous_position_box = self._previous_position_box

	if Vector3.distance_squared(previous_position_box:unbox(), camera_position) < UPDATE_DISTANCE_SQ then
		return
	end

	previous_position_box:store(camera_position)

	local broadphase_results, num_hits = self:_broadphase_check(camera_position)
	local event_manager = Managers.state.event

	for i = 1, num_hits do
		local unit = broadphase_results[i]

		if not self:_has_marker_for_unit(unit) then
			event_manager:trigger("add_world_marker_unit", self._broadphase_types[unit], unit, callback(self, "cb_world_marker_spawned", unit))
		end

		self._keep_marker_lookup[unit] = true
	end

	self:_clear_world_markers_except(self._keep_marker_lookup)
	table.clear(self._keep_marker_lookup)
end

DarkPactClimbingUI._has_marker_for_unit = function (self, unit)
	return self._world_markers_spawned[unit]
end

DarkPactClimbingUI._clear_world_markers = function (self)
	local world_markers_spawned = self._world_markers_spawned
	local event_manager = Managers.state.event

	for unit, id in pairs(world_markers_spawned) do
		event_manager:trigger("event_remove_world_marker", id)

		world_markers_spawned[unit] = nil
	end

	self._markers_cleared = true
end

DarkPactClimbingUI._clear_world_markers_except = function (self, blacklist)
	local world_markers_spawned = self._world_markers_spawned
	local event_manager = Managers.state.event

	for unit, id in pairs(world_markers_spawned) do
		if not blacklist[unit] then
			event_manager:trigger("event_remove_world_marker", world_markers_spawned[unit])

			world_markers_spawned[unit] = nil
		end
	end
end

DarkPactClimbingUI.cb_world_marker_spawned = function (self, unit, marker_id)
	self._world_markers_spawned[unit] = marker_id
	self._markers_cleared = false
end

DarkPactClimbingUI.set_visible = function (self, visible)
	self._visible = visible

	if visible then
		self:_initialize_camera()
		self:_initialize_broadphase()
		self:_register_climb_units()
	end
end

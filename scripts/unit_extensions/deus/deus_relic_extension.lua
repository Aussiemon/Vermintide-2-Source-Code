DeusRelicExtension = class(DeusRelicExtension)
local LOST_DISTANCE_THRESHOLD = 30
local LOST_TIME_THRESHOLD = 30
local OUT_OF_BOUNDS_DISTANCE_THRESHOLD = 5
local OUT_OF_BOUNDS_TIME_THRESHOLD = 5
local OBJECTIVE_MARKER_TIME = 10
local AHEAD_DISTANCE_RESPAWN = 5
local OUT_OF_BOUNDS_DISTANCE_TO_OBSTACLE = 0.5

local function get_squared_distance_to_nav_mesh(nav_world, position, search_radius)
	local nearest_nav_mesh_point = nil
	local success, altitude = GwNavQueries.triangle_from_position(nav_world, position, search_radius, search_radius)

	if success then
		nearest_nav_mesh_point = Vector3(position.x, position.y, altitude)
	else
		local inside_position = GwNavQueries.inside_position_from_outside_position(nav_world, position, search_radius, search_radius, search_radius, OUT_OF_BOUNDS_DISTANCE_TO_OBSTACLE)

		if inside_position then
			nearest_nav_mesh_point = inside_position
		end
	end

	if not nearest_nav_mesh_point then
		return nil
	else
		return Vector3.length_squared(position - nearest_nav_mesh_point)
	end
end

local function get_nearest_player_distance_squared(player_positions, position)
	local lowest_distance_squared = math.huge

	for _, player_position in ipairs(player_positions) do
		local distance_squared = Vector3.length_squared(position - player_position)
		lowest_distance_squared = math.min(distance_squared, lowest_distance_squared)
	end

	return lowest_distance_squared
end

local function reset_relic_position(unit)
	local conflict_director = Managers.state.conflict
	local main_paths = conflict_director.level_analysis:get_main_paths()
	local main_path_info = conflict_director.main_path_info
	local max_distance = MainPathUtils.total_path_dist()
	local ahead_player_travel_dist = nil

	if not main_path_info.ahead_unit then
		ahead_player_travel_dist = max_distance
	else
		local ahead_player_info = conflict_director.main_path_player_info[main_path_info.ahead_unit]
		ahead_player_travel_dist = ahead_player_info.travel_dist
	end

	local dist = ahead_player_travel_dist + AHEAD_DISTANCE_RESPAWN
	dist = math.clamp(dist, 0, MainPathUtils.total_path_dist() - 0.1)
	local position = MainPathUtils.point_on_mainpath(main_paths, dist)
	local locomotion_extension = ScriptUnit.extension(unit, "projectile_locomotion_system")

	Actor.teleport_position(locomotion_extension.physics_actor, position)
end

DeusRelicExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._unit = unit
	self._is_server = Managers.player.is_server
	self._nav_world = Managers.state.entity:system("ai_system"):nav_world()
end

DeusRelicExtension.game_object_initialized = function (self, unit, go_id)
	self._go_id = go_id
end

DeusRelicExtension.destroy = function (self)
	local unit_spawner = Managers.state.unit_spawner
	local objective_unit = self._objective_unit

	if ALIVE[objective_unit] and not unit_spawner:is_marked_for_deletion(objective_unit) then
		unit_spawner:mark_for_deletion(objective_unit)

		self._objective_unit = nil
	end
end

DeusRelicExtension.update = function (self, unit, input, dt, context, t)
	self:_update_position_resetting(unit, t)
	self:_update_objective_marker(unit, t)
end

DeusRelicExtension._update_position_resetting = function (self, unit, t)
	local relic_position = POSITION_LOOKUP[unit]
	local squared_distance_to_nav_mesh = get_squared_distance_to_nav_mesh(self._nav_world, relic_position, OUT_OF_BOUNDS_DISTANCE_THRESHOLD)
	local out_of_bounds_distance_threshold_squared = OUT_OF_BOUNDS_DISTANCE_THRESHOLD * OUT_OF_BOUNDS_DISTANCE_THRESHOLD

	if not squared_distance_to_nav_mesh or out_of_bounds_distance_threshold_squared < squared_distance_to_nav_mesh then
		if not self._out_of_bounds_since then
			self._out_of_bounds_since = t
		end

		if OUT_OF_BOUNDS_TIME_THRESHOLD < t - self._out_of_bounds_since then
			reset_relic_position(unit)

			self._out_of_bounds_since = nil
		end
	else
		self._out_of_bounds_since = nil
		local side = Managers.state.side:get_side_from_name("heroes")
		local other_player_positions = side.PLAYER_AND_BOT_POSITIONS
		local squared_distance_to_nearest_player = get_nearest_player_distance_squared(other_player_positions, relic_position)
		local lost_distance_threshold_squared = LOST_DISTANCE_THRESHOLD * LOST_DISTANCE_THRESHOLD

		if squared_distance_to_nearest_player > lost_distance_threshold_squared then
			if not self._far_away_since then
				self._far_away_since = t
			end

			if LOST_TIME_THRESHOLD < t - self._far_away_since then
				reset_relic_position(unit)

				self._far_away_since = nil
			end
		else
			self._far_away_since = nil
		end
	end
end

DeusRelicExtension._update_objective_marker = function (self, unit, t)
	if self._objective_unit then
		return
	end

	if not self._alive_since then
		self._alive_since = t
	end

	if OBJECTIVE_MARKER_TIME < t - self._alive_since then
		local unit_name = "units/hub_elements/objective_unit"
		local objective_unit = Managers.state.unit_spawner:spawn_network_unit(unit_name, "objective_unit", nil, POSITION_LOOKUP[unit])
		local objective_unit_extension = ScriptUnit.extension(objective_unit, "tutorial_system")

		objective_unit_extension:set_active(true)
		World.link_unit(Unit.world(unit), objective_unit, 0, unit, 0)

		local network_manager = Managers.state.network
		local child_unit_id = network_manager:unit_game_object_id(objective_unit)
		local parent_unit_id = network_manager:unit_game_object_id(unit)

		network_manager.network_transmit:send_rpc_clients("rpc_link_unit", child_unit_id, 0, parent_unit_id, 0)

		self._objective_unit = objective_unit
	end
end

return

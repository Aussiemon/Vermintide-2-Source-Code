require("scripts/entity_system/systems/ai/ai_group_templates/ai_group_templates")
require("scripts/entity_system/systems/ai/ai_group_templates/ai_group_templates_storm_vermin")
require("scripts/entity_system/systems/ai/ai_group_templates/ai_group_templates_patrol")

AIGroupSystem = class(AIGroupSystem, ExtensionSystemBase)
local AIGroupTemplates = AIGroupTemplates
local extensions = {
	"AIGroupMember"
}

local function readonlytable(table)
	return setmetatable({}, {
		__metatable = false,
		__index = table,
		__newindex = function (table, key, value)
			error("Coder trying to modify a AI group system read-only empty table. Don't do it!")

			return 
		end
	})
end

local EMPTY_TABLE = readonlytable({})
AIGroupSystem.init = function (self, context, system_name)
	local entity_manager = context.entity_manager

	entity_manager.register_system(entity_manager, self, system_name, extensions)

	self.entity_manager = entity_manager
	self.is_server = context.is_server
	self._world = context.world
	self.unit_storage = context.unit_storage
	self.nav_world = Managers.state.entity:system("ai_system"):nav_world()
	self.groups = {}
	self.groups_to_initialize = {}
	self.groups_to_update = {}
	self.unit_extension_data = {}
	self.dummy_extension = readonlytable({})
	self.group_uid = 0
	self._spline_properties = {}
	self._spline_lookup = {}
	self._last_recycler_group_id = nil

	return 
end

function boxify_table_pos_array(array)
	for i = 1, #array, 1 do
		local p = array[i]
		array[i] = Vector3Box(p[1], p[2], p[3])
	end

	return 
end

function remove_duplicates(spline_points)
	local num_spline_points = #spline_points
	local Vector3_equal = Vector3.equal

	for i = num_spline_points, 2, -1 do
		local point_1 = spline_points[i]:unbox()
		local point_2 = spline_points[i - 1]:unbox()

		if Vector3_equal(point_1, point_2) then
			table.remove(spline_points, i)
		end
	end

	return 
end

AIGroupSystem.add_ready_splines = function (self, waypoint_list, spline_type)
	if not waypoint_list then
		return 
	end

	for i = 1, #waypoint_list, 1 do
		local data = waypoint_list[i]
		local spline_points = data.astar_points

		if spline_points then
			boxify_table_pos_array(spline_points)
			remove_duplicates(spline_points)

			local start_position_boxed = spline_points[1]
			local start_position = start_position_boxed.unbox(start_position_boxed)

			if #spline_points == 2 then
				table.insert(spline_points, 2, Vector3Box((start_position + spline_points[2]:unbox()) / 2))
			end

			local start_direction = Vector3.normalize(spline_points[3]:unbox() - start_position)
			local spline_data = {
				start_position = start_position_boxed,
				start_direction = Vector3Box(start_direction),
				spline_points = spline_points
			}

			self._add_spline(self, data.id, spline_data, spline_type)
		end
	end

	return 
end
AIGroupSystem.destroy = function (self)
	return 
end
AIGroupSystem.ai_ready = function (self, patrol_analysis)
	self.patrol_analysis = patrol_analysis

	return 
end
local dummy_input = readonlytable({})
AIGroupSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local id = extension_init_data.id

	if id == nil then
		ScriptUnit.set_extension(unit, "ai_group_system", self.dummy_extension, dummy_input)

		self.unit_extension_data[unit] = self.dummy_extension

		return self.dummy_extension
	end

	local template = extension_init_data.template
	local extension = {}
	local group = self.groups[id]
	local formation = extension_init_data.formation
	local formation_settings = (formation and formation.settings) or PatrolFormationSettings.default_settings
	local group_data = extension_init_data.group_data
	local despawn_at_end = group_data and group_data.despawn_at_end

	if group == nil then
		group = {
			members_n = 0,
			start_forward = true,
			num_spawned_members = 0,
			id = id,
			members = {},
			size = extension_init_data.size,
			template = template,
			group_data = group_data,
			spline_name = extension_init_data.spline_name,
			formation = formation,
			formation_settings = formation_settings,
			group_type = extension_init_data.group_type,
			group_start_position = extension_init_data.group_start_position,
			despawn_at_end = despawn_at_end
		}
		local spline_name = group.spline_name
		local spline = self._patrol_splines[spline_name] or self._roaming_splines[spline_name] or self._event_splines[spline_name]

		if spline then
			local spline_points = spline.spline_points
			group.spline_points = spline_points
			local spline_properties = self._spline_properties[spline_name]

			if spline_properties then
				local despawn_patrol_at_end_of_spline = spline_properties.despawn_patrol_at_end_of_spline

				if despawn_patrol_at_end_of_spline ~= nil then
					group.despawn_at_end = despawn_patrol_at_end_of_spline
				end
			end
		end

		assert(group.size, "Created group without size!")
		assert(template, "Created group without template!")

		self.groups[id] = group
		self.groups_to_initialize[id] = group

		if script_data.ai_group_debug then
			Unit.set_animation_logging(unit, true)
		end

		local setup_group = AIGroupTemplates[template].setup_group

		if setup_group then
			setup_group(world, self.nav_world, group, unit)
		end
	end

	local breed = extension_init_data.breed
	local formation = group.formation

	if breed and formation then
		local group_position = extension_init_data.group_position
		extension.group_row = group_position.row
		extension.group_column = group_position.column
	end

	group.members[unit] = extension
	group.members_n = group.members_n + 1
	group.num_spawned_members = group.num_spawned_members + 1
	extension.group = group
	extension.template = template
	extension.id = id
	extension.frozen = false
	local template_data = AIGroupTemplates[template]
	local in_patrol = template_data.in_patrol
	local use_patrol_perception = template_data.use_patrol_perception
	extension.in_patrol = in_patrol
	extension.use_patrol_perception = extension_init_data.group_type == "spline_patrol"

	assert(group.num_spawned_members <= group.size, "An AI group was initialized with size=%d but %d AIs was assigned to it.", group.size, group.num_spawned_members)
	ScriptUnit.set_extension(unit, "ai_group_system", extension, dummy_input)

	self.unit_extension_data[unit] = extension
	local pre_unit_init = AIGroupTemplates[template].pre_unit_init

	if pre_unit_init then
		pre_unit_init(unit, group.template)
	end

	return extension
end
AIGroupSystem.on_remove_extension = function (self, unit, extension_name)
	local extension = self.unit_extension_data[unit]

	if extension == self.dummy_extension then
		fassert(next(extension) == nil, "No extension data for unit %s", unit)
		ScriptUnit.remove_extension(unit, self.NAME)

		return 
	end

	self.on_freeze_extension(self, unit, extension_name)
	ScriptUnit.remove_extension(unit, self.NAME)

	return 
end
AIGroupSystem.on_freeze_extension = function (self, unit, extension_name)
	local extension = self.unit_extension_data[unit]

	if extension == self.dummy_extension or extension == nil or extension.frozen then
		return 
	end

	local id = extension.id
	local group = self.groups[id]

	fassert(group ~= nil, "Trying to remove group extension for unit %s that does not belong to a group.", unit)

	group.members[unit] = nil
	group.members_n = group.members_n - 1

	if group.members_n == 0 and group.num_spawned_members == group.size then
		local world = self._world
		local nav_world = self.nav_world

		if self.groups_to_initialize[id] == nil then
			local template = group.template
			local template_destroy = AIGroupTemplates[template].destroy

			template_destroy(world, nav_world, group, unit)
		end

		self.groups[id] = nil
		self.groups_to_initialize[id] = nil
		self.groups_to_update[id] = nil

		if id == self._last_recycler_group_id then
			self._last_recycler_group_id = nil
		end
	end

	extension.frozen = true

	return 
end
local MAX_PATROL_SPLINES = 100
local MAX_ROAMING_SPLINES = 100
local MAX_EVENT_SPLINES = 100
local PATROL_SPLINE_PREFIX = "patrol_"
local ROAMING_SPLINE_PREFIX = "roaming_"
local EVENT_SPLINE_PREFIX = "event_"
AIGroupSystem.set_level = function (self, level)
	self._level = level
	self._patrol_splines = {}
	self._roaming_splines = {}
	self._event_splines = {}
	local world = self._world

	for i = 1, MAX_PATROL_SPLINES, 1 do
		local spline_name = PATROL_SPLINE_PREFIX .. i
		local spline_points = Level.spline(level, spline_name)

		if #spline_points == 0 then
		else
			local start_position = spline_points[1]
			local start_direction = Vector3.normalize(spline_points[3] - spline_points[1])
			local data = {
				start_position = Vector3Box(start_position),
				start_direction = Vector3Box(start_direction)
			}
			self._patrol_splines[spline_name] = data
			self._spline_lookup[spline_name] = data
		end
	end

	for i = 1, MAX_ROAMING_SPLINES, 1 do
		local spline_name = ROAMING_SPLINE_PREFIX .. i
		local spline_points = Level.spline(level, spline_name)

		if #spline_points == 0 then
		else
			local start_position = spline_points[1]
			local start_direction = Vector3.normalize(spline_points[3] - spline_points[1])
			local data = {
				start_position = Vector3Box(start_position),
				start_direction = Vector3Box(start_direction)
			}
			self._roaming_splines[spline_name] = data
			self._spline_lookup[spline_name] = data
		end
	end

	for i = 1, MAX_EVENT_SPLINES, 1 do
		local spline_name = EVENT_SPLINE_PREFIX .. i
		local spline_points = Level.spline(level, spline_name)

		if #spline_points == 0 then
		else
			local start_position = spline_points[1]
			local start_direction = Vector3.normalize(spline_points[3] - spline_points[1])
			local data = {
				start_position = Vector3Box(start_position),
				start_direction = Vector3Box(start_direction)
			}
			self._event_splines[spline_name] = data
			self._spline_lookup[spline_name] = data
		end
	end

	return 
end
local MAX_RANDOM_DISTANCE_MODIFIER = 25
local MAX_DISTANCE_ROAMING_SPLINE = 25
AIGroupSystem.get_best_spline = function (self, position, spline_type)
	local best_spline, best_spline_data = nil
	local best_distance = math.huge
	local splines, max_distance = nil

	if spline_type == "patrol" then
		splines = self._patrol_splines
		max_distance = math.huge
	elseif spline_type == "roaming" then
		splines = self._roaming_splines
		max_distance = MAX_DISTANCE_ROAMING_SPLINE
	elseif spline_type == "event" then
		splines = self._event_splines
		max_distance = math.huge
	end

	for spline_name, spline_data in pairs(splines) do
		local random_distance_modifier = math.random(1, MAX_RANDOM_DISTANCE_MODIFIER)
		local start_position = spline_data.start_position:unbox()
		local distance = Vector3.distance(position, start_position)

		if max_distance < distance then
		else
			distance = distance - random_distance_modifier

			if best_distance < distance then
			else
				best_distance = distance
				best_spline = spline_name
				best_spline_data = spline_data
			end
		end
	end

	return best_spline, best_spline_data
end
AIGroupSystem.spline_start_position = function (self, spline_name)
	local spline = self._spline_lookup[spline_name]
	local start_position = spline.start_position:unbox()

	return start_position
end
AIGroupSystem.spline_start_direction = function (self, spline_name)
	local spline = self._spline_lookup[spline_name]
	local start_direction = spline.start_direction:unbox()

	return start_direction
end
AIGroupSystem.spline = function (self, spline_name)
	return self._spline_lookup[spline_name]
end
AIGroupSystem.level_has_splines = function (self, spline_type)
	local splines = nil

	if spline_type == "patrol" then
		splines = self._patrol_splines
	elseif spline_type == "roaming" then
		splines = self._roaming_splines
	elseif spline_type == "event" then
		splines = self._event_splines
	else
		error("no such spline_type: " .. spline_type)
	end

	local size = table.size(splines)
	local has_splines = 0 < size

	return has_splines
end
AIGroupSystem.get_available_spline_type = function (self)
	local splines = nil

	if self._patrol_splines then
		splines = self._patrol_splines
	elseif self._roaming_splines then
		splines = self._roaming_splines
	elseif self._event_splines then
		splines = self._event_splines
	end

	local spline_type = (next(self._patrol_splines) and "patrol") or (next(self._roaming_splines) and "roaming") or (next(self._event_splines) and "event")

	return spline_type
end
AIGroupSystem.hot_join_sync = function (self, sender, player)
	return 
end
local position_lookup = POSITION_LOOKUP
AIGroupSystem.check_recycler_despawn = function (self, player_positions, player_zones, use_player_zones)
	local groups = self.groups_to_update
	local group_id, group = next(groups, self._last_recycler_group_id)
	self._last_recycler_group_id = group_id

	if not group_id or group.group_type ~= "roaming_patrol" or group.patrol_in_combat then
		if script_data.debug_group_recycling and group and group.patrol_in_combat then
			local indexed_members = group.indexed_members
			local unit = indexed_members[1]
			local pos = position_lookup[unit]

			QuickDrawer:sphere(pos, 2, Color(175, 40, 200))
		end

		return 
	end

	local indexed_members = group.indexed_members
	local unit = indexed_members[1]
	local pos = position_lookup[unit]

	if not pos then
		return 
	end

	if script_data.debug_group_recycling then
		QuickDrawer:sphere(pos, 2, Color(75, 200, 200))
	end

	local conflict_director = Managers.state.conflict
	local navigation_group_manager = conflict_director.navigation_group_manager
	local patrol_zone = navigation_group_manager.get_group_from_position(navigation_group_manager, pos)

	if not patrol_zone then
		return 
	end

	local roaming_settings = CurrentRoamingSettings
	local path_distance_threshold = roaming_settings.despawn_path_distance
	local wakeup_distance = roaming_settings.despawn_distance + 8
	local wakeup_distance_z = roaming_settings.despawn_distance_z or 8
	local seen_by_player = false
	local num_players = #player_positions
	local math_abs = math.abs

	if 0 <= num_players then
		for j = 1, num_players, 1 do
			local to_dir = pos - player_positions[j]
			local h = to_dir.z

			Vector3.set_z(to_dir, 0)

			local dist = Vector3.length(to_dir)

			if script_data.debug_group_recycling then
				local pos = player_positions[j]

				QuickDrawer:cylinder(pos + Vector3(0, 0, -wakeup_distance_z), pos + Vector3(0, 0, wakeup_distance_z), wakeup_distance, Color(0, 250, 225), 8)
			end

			if dist < wakeup_distance and math_abs(h) < wakeup_distance_z then
				local zone = player_zones[j]

				if use_player_zones and zone then
					local _, path_dist, cached = navigation_group_manager.a_star_cached(navigation_group_manager, zone, patrol_zone)

					if not path_dist or path_dist < path_distance_threshold then
						seen_by_player = true

						break
					end
				else
					seen_by_player = true

					break
				end
			end
		end
	else
		seen_by_player = true
	end

	if not seen_by_player then
		local indexed_members = group.indexed_members
		local num_indexed_members = group.num_indexed_members

		if script_data.debug_group_recycling then
			QuickDrawerStay:sphere(POSITION_LOOKUP[indexed_members[1]], 1.3, Color(225, 40, 0))
			print("removed group since it was out of range and not seen by a player")
		end

		local enemy_recycler = conflict_director.enemy_recycler
		local BLACKBOARDS = BLACKBOARDS

		for i = 1, num_indexed_members, 1 do
			local member_unit = indexed_members[i]
			local blackboard = BLACKBOARDS[member_unit]
			local boxed_pos = Vector3Box(POSITION_LOOKUP[member_unit])
			local boxed_rot = QuaternionBox(Unit.local_rotation(member_unit, 0))

			enemy_recycler.add_breed(enemy_recycler, blackboard.breed.name, boxed_pos, boxed_rot)
			Managers.state.conflict:destroy_unit(member_unit, blackboard, "patrol_finished")
		end
	end

	return 
end
local debug_drawer_info = {
	mode = "retained",
	name = "AIGroupTemplates_retained"
}
AIGroupSystem.update = function (self, context, t)
	if not self.is_server then
		return 
	end

	local world = self._world
	local nav_world = self.nav_world
	local AIGroupTemplates = AIGroupTemplates

	Profiler.start("initalizing groups")

	for id, group in pairs(self.groups_to_initialize) do
		if group.num_spawned_members == group.size then
			if 0 < group.members_n then
				local template = group.template
				local template_init = AIGroupTemplates[template].init

				template_init(world, nav_world, group, t)

				self.groups_to_initialize[group.id] = nil
				self.groups_to_update[group.id] = group
			else
				self.groups_to_initialize[group.id] = nil
			end
		end
	end

	Profiler.stop("initalizing groups")
	Profiler.start("updating groups")

	for id, group in pairs(self.groups_to_update) do
		local template = group.template
		local template_update = AIGroupTemplates[template].update

		template_update(world, nav_world, group, t, context.dt)
	end

	Profiler.stop("updating groups")

	if not script_data.ai_group_debug then
		local drawer = Managers.state.debug:drawer(debug_drawer_info)

		drawer.reset(drawer)
	end

	if self.patrol_analysis and self._computing_splines then
		Profiler.start("patrol_analysis")
		self.patrol_analysis:run()
		Profiler.stop("patrol_analysis")
		Profiler.start("computing splines")

		for spline_name, spline_type in pairs(self._computing_splines) do
			local spline_ready = self._spline_ready(self, spline_name)

			if not spline_ready then
			else
				local spline = self.patrol_analysis:spline(spline_name)
				local spline_points = spline.spline_points
				local start_position_boxed = spline_points[1]

				if not start_position_boxed then
					ScriptApplication.send_to_crashify("AiGroupSystem", "Tried to spawn a patrol but could not generate a path. (Most likely nav-mesh is missing) Patrol-id: %s", spline_name)
					self._add_spline(self, spline_name, "failed", spline_type)

					self._computing_splines[spline_name] = nil
				else
					local start_position = start_position_boxed.unbox(start_position_boxed)

					if #spline_points == 2 then
						table.insert(spline_points, 2, Vector3Box((start_position + spline_points[2]:unbox()) / 2))
					end

					local start_direction = Vector3.normalize(spline_points[3]:unbox() - start_position)
					local num_spline_points = #spline_points

					for i = num_spline_points, 2, -1 do
						local point_1 = spline_points[i]:unbox()
						local point_2 = spline_points[i - 1]:unbox()

						if Vector3.equal(point_1, point_2) then
							table.remove(spline_points, i)
						end
					end

					local spline_data = {
						start_position = start_position_boxed,
						start_direction = Vector3Box(start_direction),
						spline_points = spline_points
					}

					self._add_spline(self, spline_name, spline_data, spline_type)

					self._computing_splines[spline_name] = nil
				end
			end
		end

		Profiler.stop("computing splines")
	end

	local conflict_director = Managers.state.conflict

	if self._update_recycler then
		Profiler.start("check recycler")
		self.check_recycler_despawn(self, self._player_positions, self._player_areas, self._use_player_areas)
		Profiler.stop("check recycler")
	end

	self._update_recycler = false

	return 
end
AIGroupSystem.prepare_update_recycler = function (self, player_positions, player_areas, use_player_areas)
	self._update_recycler = true
	self._player_positions = player_positions
	self._player_areas = player_areas
	self._use_player_areas = use_player_areas

	return 
end
AIGroupSystem.get_ai_group = function (self, id)
	local groups = self.groups

	return groups[id]
end
AIGroupSystem.run_func_on_all_members = function (self, group, func, ...)
	local members = group.members

	for unit, extension in pairs(members) do
		func(unit, extension, ...)
	end

	return 
end
AIGroupSystem.generate_group_id = function (self)
	self.group_uid = self.group_uid + 1

	return self.group_uid
end
AIGroupSystem.set_allowed_layer = function (self, layer_name, allowed)
	local layer_id = LAYER_ID_MAPPING[layer_name]

	for id, group in pairs(self.groups_to_update) do
		if group.nav_data and group.nav_data.navtag_layer_cost_table then
			if allowed then
				GwNavTagLayerCostTable.allow_layer(group.nav_data.navtag_layer_cost_table, layer_id)
			else
				GwNavTagLayerCostTable.forbid_layer(group.nav_data.navtag_layer_cost_table, layer_id)
			end
		end
	end

	return 
end
AIGroupSystem.create_spline_from_way_points = function (self, spline_name, spline_way_points, spline_type)
	local USING_EDITOR = false
	local navbot_kind = (spline_type == "roaming" and "roaming") or "standard"

	self.patrol_analysis:compute_spline_path(spline_name, spline_way_points, navbot_kind)

	self._computing_splines = self._computing_splines or {}
	self._computing_splines[spline_name] = spline_type

	return 
end
AIGroupSystem.spline_ready = function (self, spline_name)
	return self._spline_lookup[spline_name]
end
AIGroupSystem._spline_ready = function (self, spline_name)
	local patrol_analysis = self.patrol_analysis

	if not patrol_analysis then
		return false
	end

	local spline = patrol_analysis.spline(patrol_analysis, spline_name)

	return spline
end
AIGroupSystem._add_spline = function (self, spline_name, spline_data, spline_type)
	self._spline_lookup[spline_name] = spline_data
	local is_patrol_spline = spline_type == "patrol" or string.find(spline_name, PATROL_SPLINE_PREFIX)

	if is_patrol_spline then
		self._patrol_splines[spline_name] = spline_data

		return 
	end

	local is_roaming_spline = spline_type == "roaming" or string.find(spline_name, ROAMING_SPLINE_PREFIX)

	if is_roaming_spline then
		self._roaming_splines[spline_name] = spline_data

		return 
	end

	local is_event_spline = spline_type == "event" or string.find(spline_name, EVENT_SPLINE_PREFIX)

	if is_event_spline then
		self._event_splines[spline_name] = spline_data

		return 
	end

	error("unsupported spline type for spline: " .. spline_name .. ". Spline name should start with 'patrol_', 'roaming_' or 'event_' which defines the spline type")

	return 
end
AIGroupSystem.draw_active_spline_paths = function (self)
	local drawer = QuickDrawerStay
	local splines1 = self._patrol_splines
	local color1 = Color(255, 255, 0)

	for spline_name, spline_data in pairs(splines1) do
		self.draw_spline(self, spline_data.spline_points, drawer, color1)
	end

	local splines2 = self._roaming_splines
	local color2 = Color(255, 255, 0)

	for spline_name, spline_data in pairs(splines2) do
		self.draw_spline(self, spline_data.spline_points, drawer, color2)
	end

	local splines3 = self._event_splines
	local color3 = Color(255, 255, 0)

	for spline_name, spline_data in pairs(splines3) do
		self.draw_spline(self, spline_data.spline_points, drawer, color3)
	end

	return 
end
AIGroupSystem.draw_spline = function (self, spline, drawer, color)
	local p1 = spline[1]:unbox()
	local h = Vector3(0, 0, 1)

	for i = 2, #spline, 1 do
		local waypoint = spline[i]
		local p2 = spline[i]:unbox()

		drawer.line(drawer, p1 + h, p2 + h, color)

		p1 = p2
	end

	return 
end
AIGroupSystem.create_formation_data = function (self, position, formation, spline_name)
	local anchor_offset_y = PatrolFormationSettings.default_settings.offsets.ANCHOR_OFFSET.y
	local anchor_offset_x = PatrolFormationSettings.default_settings.speeds.SPLINE_SPEED
	local start_direction = self.spline_start_direction(self, spline_name)
	local formation_data = table.clone(formation)
	local num_rows = #formation
	local formation_length = (num_rows - 1) * anchor_offset_x
	local group_size = 0
	local spline = self._spline_lookup[spline_name]
	local spline_curve = nil

	if spline.spline_points then
		local source_spline_points = spline.spline_points
		local spline_points = AiUtils.remove_bad_boxed_spline_points(source_spline_points, spline_name)
		spline_curve = SplineCurve:new(spline_points, "Hermite", "SplineMovementHermiteInterpolatedMetered", spline_name, 3)
	else
		local level = self._level
		local source_spline_points = Level.spline(level, spline_name)
		local spline_points = AiUtils.remove_bad_spline_points(source_spline_points, spline_name)
		spline_curve = SplineCurve:new(spline_points, "Bezier", "SplineMovementHermiteInterpolatedMetered", spline_name, 10)
	end

	local start_spline_index = NavigationUtils.get_closest_index_on_spline(spline_curve, position)

	for row, columns in ipairs(formation) do
		for column, breed_name in ipairs(columns) do
			local num_columns_in_row = #columns
			local distance = formation_length - (row - 1) * anchor_offset_x
			local position_on_spline, direction_on_spline = self._get_position_on_spline_by_distance(self, distance, spline_curve, start_spline_index)

			if position_on_spline == nil then
				position_on_spline = position
				direction_on_spline = start_direction
			end

			local direction_on_spline_normal = Vector3(direction_on_spline.y, -direction_on_spline.x, 0)
			local column_length = (num_columns_in_row - 1) * anchor_offset_y * 2
			local offset_y = direction_on_spline_normal * (-column_length / 2 + anchor_offset_y * 2 * (column - 1))
			local offset = offset_y
			local wanted_spawn_position = position_on_spline + offset
			local start_direction = Vector3.flat(direction_on_spline)

			if script_data.debug_storm_vermin_patrol then
				QuickDrawerStay:sphere(wanted_spawn_position, 0.2, Colors.get("dark_orchid"))
				QuickDrawerStay:sphere(position_on_spline, 0.24, Colors.get("yellow"))
			end

			if Breeds[breed_name] then
				local spawn_pos = LocomotionUtils.pos_on_mesh(self.nav_world, wanted_spawn_position)
				spawn_pos = spawn_pos or LocomotionUtils.pos_on_mesh(self.nav_world, position_on_spline)

				if spawn_pos then
					formation_data[row][column] = {
						slot_taken = false,
						breed_name = breed_name,
						start_position = Vector3Box(spawn_pos),
						start_direction = Vector3Box(start_direction)
					}
					group_size = group_size + 1
				elseif script_data.debug_storm_vermin_patrol then
					QuickDrawerStay:sphere(wanted_spawn_position, 1, Colors.get("red"))
				end
			else
				formation_data[row][column] = {
					slot_taken = false,
					start_position = Vector3Box(wanted_spawn_position),
					start_direction = Vector3Box(start_direction)
				}
			end
		end
	end

	formation_data.group_size = group_size

	return formation_data
end
AIGroupSystem._get_position_on_spline_by_distance = function (self, distance, spline_curve, start_spline_index)
	local total_distance = 0
	local movement = spline_curve.movement(spline_curve)

	movement.reset_to_start(movement)
	movement.set_speed(movement, 2)

	if start_spline_index then
		movement.set_current_spline_index(movement, start_spline_index)
	end

	fassert(movement._t == movement._t, "Nan in spline: %s", spline_curve._name)

	local start_position = movement.current_position(movement)
	local previous_position = start_position
	local dt = 0.1

	while true do
		local a, b, c = Script.temp_count()
		local status = movement.update(movement, dt)

		if status == "end" then
			return nil
		end

		fassert(movement._t == movement._t, "Nan in spline: %s", spline_curve._name)

		local current_position = movement.current_position(movement)
		local current_distance = Vector3.distance(current_position, previous_position)
		total_distance = current_distance + total_distance

		if distance <= total_distance or current_distance <= 0 then
			local direction = Vector3.normalize(current_position - previous_position)

			return current_position, direction
		end

		Vector3.set_xyz(previous_position, current_position.x, current_position.y, current_position.z)
		Script.set_temp_count(a, b, c)
	end

	return 
end
AIGroupSystem.register_spline_properties = function (self, spline_name, properties)
	self._spline_properties[spline_name] = properties

	return 
end

return 

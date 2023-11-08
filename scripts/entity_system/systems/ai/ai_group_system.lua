require("scripts/entity_system/systems/ai/ai_group_templates/ai_group_templates")
require("scripts/entity_system/systems/ai/ai_group_templates/ai_group_templates_patrol")

AIGroupSystem = class(AIGroupSystem, ExtensionSystemBase)
local AIGroupTemplates = AIGroupTemplates
local extensions = {
	"AIGroupMember"
}

AIGroupSystem.init = function (self, context, system_name)
	local entity_manager = context.entity_manager

	entity_manager:register_system(self, system_name, extensions)

	self.entity_manager = entity_manager
	self.is_server = context.is_server
	self._world = context.world
	self.unit_storage = context.unit_storage
	self.nav_world = Managers.state.entity:system("ai_system"):nav_world()
	self.groups = {}
	self.groups_to_initialize = {}
	self.groups_to_update = {}
	self.unit_extension_data = {}
	self.frozen_unit_extension_data = {}
	self.group_uid = 0
	self._spline_properties = {}
	self._spline_lookup = {}
	self._cached_splines = {}
	self._last_recycler_group_id = nil
end

function boxify_table_pos_array(array)
	for i = 1, #array do
		local p = array[i]
		array[i] = Vector3Box(p[1], p[2], p[3])
	end
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
end

AIGroupSystem.add_ready_splines = function (self, waypoint_list, spline_type)
	if not waypoint_list then
		return
	end

	for i = 1, #waypoint_list do
		local data = waypoint_list[i]
		local spline_points = data.astar_points

		if spline_points then
			boxify_table_pos_array(spline_points)
			remove_duplicates(spline_points)

			local start_position_boxed = spline_points[1]
			local start_position = start_position_boxed:unbox()

			if #spline_points == 2 then
				table.insert(spline_points, 2, Vector3Box((start_position + spline_points[2]:unbox()) / 2))
			end

			local start_direction = Vector3.normalize(spline_points[3]:unbox() - start_position)
			local spline_data = {
				start_position = start_position_boxed,
				start_direction = Vector3Box(start_direction),
				spline_points = spline_points
			}

			self:_add_spline(data.id, spline_data, spline_type)
		end
	end
end

AIGroupSystem.destroy = function (self)
	return
end

AIGroupSystem.ai_ready = function (self, patrol_analysis)
	self.patrol_analysis = patrol_analysis
end

AIGroupSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local extension = {}

	if extension_init_data.id ~= nil then
		self:init_extension(unit, extension, extension_init_data)
	end

	ScriptUnit.set_extension(unit, "ai_group_system", extension)

	self.unit_extension_data[unit] = extension

	return extension
end

AIGroupSystem.init_extension = function (self, unit, extension, extension_init_data)
	local id = extension_init_data.id
	local template = extension_init_data.template
	local group = self.groups[id]
	local formation = extension_init_data.formation
	local formation_settings = formation and formation.settings or PatrolFormationSettings.default_settings
	local despawn_at_end = extension_init_data.despawn_at_end

	if group == nil then
		group = {
			members_n = 0,
			start_forward = true,
			num_spawned_members = 0,
			id = id,
			members = {},
			size = extension_init_data.size,
			template = template,
			spline_name = extension_init_data.spline_name,
			formation = formation,
			formation_settings = formation_settings,
			group_type = extension_init_data.group_type,
			group_start_position = extension_init_data.group_start_position,
			despawn_at_end = despawn_at_end,
			side_id = extension_init_data.side_id,
			side = extension_init_data.side,
			commanding_player = extension_init_data.commanding_player,
			group_data = extension_init_data.group_data
		}
		local spline_name = group.spline_name
		local spline = self._patrol_splines[spline_name] or self._roaming_splines[spline_name] or self._event_splines[spline_name]

		if spline then
			local spline_points = spline.spline_points
			group.spline_points = spline_points
			group.cached_splines = self._cached_splines[spline_name]
		end

		fassert(group.size, "Created group without size!")
		fassert(template, "Created group without template!")

		self.groups[id] = group
		self.groups_to_initialize[id] = group
		local setup_group = AIGroupTemplates[template].setup_group

		if setup_group then
			setup_group(self.world, self.nav_world, group, unit)
		end
	elseif extension_init_data.insert_into_group then
		group.size = group.size + 1
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
	local template_data = AIGroupTemplates[template]
	local in_patrol = template_data.in_patrol
	local use_patrol_perception = template_data.use_patrol_perception
	extension.in_patrol = in_patrol
	extension.use_patrol_perception = extension_init_data.group_type == "spline_patrol"

	fassert(group.num_spawned_members <= group.size, "An AI group was initialized with size=%d but %d AIs was assigned to it.", group.size, group.num_spawned_members)
end

AIGroupSystem.extensions_ready = function (self, world, unit, extension_name)
	local extension = self.unit_extension_data[unit]
	local pre_unit_init = AIGroupTemplates[extension.template] and AIGroupTemplates[extension.template].pre_unit_init

	if pre_unit_init then
		pre_unit_init(unit, extension.group)
	end
end

AIGroupSystem.on_remove_extension = function (self, unit, extension_name)
	self.frozen_unit_extension_data[unit] = nil

	self:_cleanup_extension(unit, extension_name)
	ScriptUnit.remove_extension(unit, self.NAME)
end

AIGroupSystem.on_freeze_extension = function (self, unit, extension_name)
	local extension = self.unit_extension_data[unit]

	fassert(extension, "Unit was already frozen.")

	if extension == nil then
		return
	end

	self.frozen_unit_extension_data[unit] = extension

	self:_cleanup_extension(unit, extension_name)
end

AIGroupSystem.freeze = function (self, unit, extension_name, reason)
	local frozen_extensions = self.frozen_unit_extension_data

	if frozen_extensions[unit] then
		return
	end

	local extension = self.unit_extension_data[unit]

	fassert(extension, "Unit to freeze didn't have unfrozen extension")
	self:_cleanup_extension(unit, extension_name)

	self.unit_extension_data[unit] = nil
	frozen_extensions[unit] = extension
end

AIGroupSystem.unfreeze = function (self, unit, extension_name, data)
	local extension = self.frozen_unit_extension_data[unit]

	fassert(extension, "Unit to unfreeze didn't have frozen extension")

	self.frozen_unit_extension_data[unit] = nil
	self.unit_extension_data[unit] = extension
	local extension_init_data = data[8]

	if extension_init_data and extension_init_data.id then
		self:init_extension(unit, extension, extension_init_data)
	end
end

AIGroupSystem._cleanup_extension = function (self, unit, extension_name)
	local extension = self.unit_extension_data[unit]

	if extension == nil then
		return
	end

	self.unit_extension_data[unit] = nil
	local id = extension.id

	if not id then
		return
	end

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

	extension.id = nil
	extension.group = nil
	extension.template = nil
	extension.in_patrol = nil
	extension.use_patrol_perception = nil
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

	for i = 1, MAX_PATROL_SPLINES do
		repeat
			local spline_name = PATROL_SPLINE_PREFIX .. i
			local spline_points = Level.spline(level, spline_name)

			if #spline_points == 0 then
				break
			end

			local start_position = spline_points[1]
			local start_direction = Vector3.normalize(spline_points[3] - spline_points[1])
			local data = {
				start_position = Vector3Box(start_position),
				start_direction = Vector3Box(start_direction)
			}
			self._patrol_splines[spline_name] = data
			self._spline_lookup[spline_name] = data
		until true
	end

	for i = 1, MAX_ROAMING_SPLINES do
		repeat
			local spline_name = ROAMING_SPLINE_PREFIX .. i
			local spline_points = Level.spline(level, spline_name)

			if #spline_points == 0 then
				break
			end

			local start_position = spline_points[1]
			local start_direction = Vector3.normalize(spline_points[3] - spline_points[1])
			local data = {
				start_position = Vector3Box(start_position),
				start_direction = Vector3Box(start_direction)
			}
			self._roaming_splines[spline_name] = data
			self._spline_lookup[spline_name] = data
		until true
	end

	for i = 1, MAX_EVENT_SPLINES do
		repeat
			local spline_name = EVENT_SPLINE_PREFIX .. i
			local spline_points = Level.spline(level, spline_name)

			if #spline_points == 0 then
				break
			end

			local start_position = spline_points[1]
			local start_direction = Vector3.normalize(spline_points[3] - spline_points[1])
			local data = {
				start_position = Vector3Box(start_position),
				start_direction = Vector3Box(start_direction)
			}
			self._event_splines[spline_name] = data
			self._spline_lookup[spline_name] = data
		until true
	end
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
		repeat
			local random_distance_modifier = math.random(1, MAX_RANDOM_DISTANCE_MODIFIER)
			local start_position = spline_data.start_position:unbox()
			local distance = Vector3.distance(position, start_position)

			if max_distance < distance then
				break
			end

			distance = distance - random_distance_modifier

			if best_distance < distance then
				break
			end

			best_distance = distance
			best_spline = spline_name
			best_spline_data = spline_data
		until true
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
	local has_splines = size > 0

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

	local spline_type = next(self._patrol_splines) and "patrol" or next(self._roaming_splines) and "roaming" or next(self._event_splines) and "event"

	return spline_type
end

AIGroupSystem.hot_join_sync = function (self, peer_id, player)
	return
end

local position_lookup = POSITION_LOOKUP

AIGroupSystem.check_recycler_despawn = function (self, player_positions, player_zones, use_player_zones)
	local groups = self.groups_to_update
	local group_id, group = next(groups, self._last_recycler_group_id)
	self._last_recycler_group_id = group_id

	if not group_id or group.group_type ~= "roaming_patrol" or group.patrol_in_combat then
		return
	end

	local indexed_members = group.indexed_members
	local unit = indexed_members[1]
	local pos = position_lookup[unit]

	if not pos then
		return
	end

	local conflict_director = Managers.state.conflict
	local navigation_group_manager = conflict_director.navigation_group_manager
	local patrol_zone = navigation_group_manager:get_group_from_position(pos)

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

	if num_players >= 0 then
		for j = 1, num_players do
			local to_dir = pos - player_positions[j]
			local h = to_dir.z

			Vector3.set_z(to_dir, 0)

			local dist = Vector3.length(to_dir)

			if dist < wakeup_distance and math_abs(h) < wakeup_distance_z then
				local zone = player_zones[j]

				if use_player_zones and zone then
					local _, path_dist, cached = navigation_group_manager:a_star_cached(zone, patrol_zone)

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
		local enemy_recycler = conflict_director.enemy_recycler
		local BLACKBOARDS = BLACKBOARDS

		for i = 1, num_indexed_members do
			local member_unit = indexed_members[i]
			local blackboard = BLACKBOARDS[member_unit]
			local boxed_pos = Vector3Box(POSITION_LOOKUP[member_unit])
			local boxed_rot = QuaternionBox(Unit.local_rotation(member_unit, 0))

			enemy_recycler:add_breed(blackboard.breed.name, boxed_pos, boxed_rot)
			Managers.state.conflict:destroy_unit(member_unit, blackboard, "patrol_finished")
		end
	end
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

	for id, group in pairs(self.groups_to_initialize) do
		if group.num_spawned_members == group.size then
			if group.members_n > 0 then
				local template = group.template
				local template_init = AIGroupTemplates[template].init

				printf("Init group template: %s", template)
				template_init(world, nav_world, group, t)

				self.groups_to_initialize[group.id] = nil
				self.groups_to_update[group.id] = group
			else
				self.groups_to_initialize[group.id] = nil
			end
		end
	end

	for id, group in pairs(self.groups_to_update) do
		local template = group.template
		local template_update = AIGroupTemplates[template].update

		template_update(world, nav_world, group, t, context.dt)
	end

	if self.patrol_analysis and self._computing_splines then
		self.patrol_analysis:run()

		for spline_name, spline_type in pairs(self._computing_splines) do
			repeat
				local spline_ready = self:_spline_ready(spline_name)

				if not spline_ready then
					break
				end

				local spline = self.patrol_analysis:spline(spline_name)
				local spline_points = spline.spline_points
				local start_position_boxed = spline_points[1]

				fassert(start_position_boxed, "missing starting spline point, for spline %s", spline.id)

				local start_position = start_position_boxed:unbox()

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
					spline_points = spline_points,
					failed = spline.failed
				}

				self:_add_spline(spline_name, spline_data, spline_type)

				self._computing_splines[spline_name] = nil
			until true
		end
	end

	local conflict_director = Managers.state.conflict

	if self._update_recycler then
		self:check_recycler_despawn(self._player_positions, self._player_areas, self._use_player_areas)
	end

	self._update_recycler = false
end

AIGroupSystem.prepare_update_recycler = function (self, player_positions, player_areas, use_player_areas)
	self._update_recycler = true
	self._player_positions = player_positions
	self._player_areas = player_areas
	self._use_player_areas = use_player_areas
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
end

AIGroupSystem.create_spline_from_way_points = function (self, spline_name, spline_way_points, spline_type)
	local navbot_kind = spline_type == "roaming" and "roaming" or "standard"

	self.patrol_analysis:compute_spline_path(spline_name, spline_way_points, navbot_kind)

	self._computing_splines = self._computing_splines or {}
	self._computing_splines[spline_name] = spline_type
end

AIGroupSystem.spline_ready = function (self, spline_name)
	return self._spline_lookup[spline_name]
end

AIGroupSystem._spline_ready = function (self, spline_name)
	local patrol_analysis = self.patrol_analysis

	if not patrol_analysis then
		return false
	end

	local spline = patrol_analysis:spline(spline_name)

	return spline
end

AIGroupSystem._add_spline = function (self, spline_name, spline_data, spline_type)
	self._spline_lookup[spline_name] = spline_data

	if GameSettingsDevelopment.pre_calculate_patrol_splines then
		self._cached_splines[spline_name] = self:_calculate_splines(spline_name, spline_data)
	end

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
end

AIGroupSystem._calculate_splines = function (self, spline_name, spline_data)
	if not spline_data.spline_points then
		return
	end

	local cached_spline_data = {}
	local source_spline_points = spline_data.spline_points
	local spline_points = AiUtils.remove_bad_boxed_spline_points(source_spline_points, spline_name)
	local spline_curve = SplineCurve:new(spline_points, "Hermite", "SplineMovementHermiteInterpolatedMetered", spline_name, 3)

	return spline_curve:splines()
end

AIGroupSystem.draw_active_spline_paths = function (self)
	local drawer = QuickDrawerStay
	local splines1 = self._patrol_splines
	local color1 = Color(255, 255, 0)

	for spline_name, spline_data in pairs(splines1) do
		self:draw_spline(spline_data.spline_points, drawer, color1)
	end

	local splines2 = self._roaming_splines
	local color2 = Color(255, 255, 0)

	for spline_name, spline_data in pairs(splines2) do
		self:draw_spline(spline_data.spline_points, drawer, color2)
	end

	local splines3 = self._event_splines
	local color3 = Color(255, 255, 0)

	for spline_name, spline_data in pairs(splines3) do
		self:draw_spline(spline_data.spline_points, drawer, color3)
	end
end

AIGroupSystem.draw_spline = function (self, spline, drawer, color)
	local p1 = spline[1]:unbox()
	local h = Vector3(0, 0, 1)

	for i = 2, #spline do
		local waypoint = spline[i]
		local p2 = spline[i]:unbox()

		drawer:line(p1 + h, p2 + h, color)

		p1 = p2
	end
end

AIGroupSystem.create_formation_data = function (self, position, formation, spline_name, spawn_all_at_same_position, group_data)
	local anchor_offset_y = PatrolFormationSettings.default_settings.offsets.ANCHOR_OFFSET.y
	local anchor_offset_x = PatrolFormationSettings.default_settings.speeds.SPLINE_SPEED
	local start_direction = self:spline_start_direction(spline_name)
	local formation_data = table.clone(formation)
	local num_rows = #formation
	local formation_length = (num_rows - 1) * anchor_offset_x
	local group_size = 0
	local spline = self._spline_lookup[spline_name]
	local spline_curve = nil

	if spline.spline_points then
		local cached_spline = self._cached_splines[spline_name]
		local source_spline_points = spline.spline_points
		local spline_points = AiUtils.remove_bad_boxed_spline_points(source_spline_points, spline_name)
		spline_curve = SplineCurve:new(spline_points, "Hermite", "SplineMovementHermiteInterpolatedMetered", spline_name, 3, cached_spline)
	else
		local level = self._level
		local source_spline_points = Level.spline(level, spline_name)
		local spline_points = AiUtils.remove_bad_spline_points(source_spline_points, spline_name)
		spline_curve = SplineCurve:new(spline_points, "Bezier", "SplineMovementHermiteInterpolatedMetered", spline_name, 10)
	end

	local start_spline_index = NavigationUtils.get_closest_index_on_spline(spline_curve, position)
	local above = 1
	local below = 1
	local inside_position_from_outside_position = GwNavQueries.inside_position_from_outside_position
	local nav_world = self.nav_world
	local position_on_spline, direction_on_spline, flat_start_direction, direction_on_spline_normal = nil

	if spawn_all_at_same_position then
		position_on_spline, direction_on_spline = self:_get_position_on_spline_by_distance(0, spline_curve, start_spline_index)

		if position_on_spline == nil then
			position_on_spline = position
			direction_on_spline = start_direction
		end

		direction_on_spline_normal = Vector3(direction_on_spline.y, -direction_on_spline.x, 0)
		flat_start_direction = Vector3.flat(direction_on_spline)
	end

	local current_row = 1

	for row, columns in ipairs(formation) do
		table.clear(formation_data[row])

		if not spawn_all_at_same_position then
			local distance = formation_length - (current_row - 1) * anchor_offset_x
			position_on_spline, direction_on_spline = self:_get_position_on_spline_by_distance(distance, spline_curve, start_spline_index)

			if position_on_spline == nil then
				position_on_spline = position
				direction_on_spline = start_direction
			end

			direction_on_spline_normal = Vector3(direction_on_spline.y, -direction_on_spline.x, 0)
			flat_start_direction = Vector3.flat(direction_on_spline)
		end

		for column, breed_name in ipairs(columns) do
			local num_columns_in_row = #columns
			local column_length = (num_columns_in_row - 1) * anchor_offset_y * 2
			local offset = direction_on_spline_normal * (-column_length / 2 + anchor_offset_y * 2 * (column - 1))
			local wanted_spawn_position = position_on_spline + offset

			if Breeds[breed_name] then
				local spawn_pos = LocomotionUtils.pos_on_mesh(nav_world, wanted_spawn_position, above, below)
				spawn_pos = spawn_pos or LocomotionUtils.pos_on_mesh(nav_world, position_on_spline, above, below)
				spawn_pos = spawn_pos or inside_position_from_outside_position(nav_world, wanted_spawn_position, above, below, 0.5, 0.2)

				if spawn_pos then
					formation_data[current_row][column] = {
						breed_name = breed_name,
						start_position = Vector3Box(spawn_pos),
						start_direction = Vector3Box(flat_start_direction)
					}
					group_size = group_size + 1
				else
					if group_data then
						printf("Patrol formation outside navmesh. template_name: %s, spline_name: %s group_type: %s, wanted_spawn_pos: %s", group_data.template, spline_name, group_data.group_type, tostring(wanted_spawn_position))
					end

					formation_data[current_row][column] = {
						start_position = Vector3Box(wanted_spawn_position),
						start_direction = Vector3Box(flat_start_direction)
					}
				end
			else
				formation_data[current_row][column] = {
					start_position = Vector3Box(wanted_spawn_position),
					start_direction = Vector3Box(flat_start_direction)
				}
			end
		end

		if #formation_data[current_row] > 0 then
			current_row = current_row + 1
		end
	end

	for i = current_row, num_rows do
		local columns = formation_data[i]
		formation_data[i] = nil
	end

	formation_data.group_size = group_size

	return formation_data
end

AIGroupSystem._get_position_on_spline_by_distance = function (self, distance, spline_curve, start_spline_index)
	local total_distance = 0
	local movement = spline_curve:movement()

	movement:reset_to_start()
	movement:set_speed(2)

	if start_spline_index then
		movement:set_spline_index(start_spline_index, 1, 0)
	end

	local start_position = movement:current_position()
	local previous_spline_curve_distance = movement:current_spline_curve_distance()
	local previous_position = start_position
	local dt = 0.1

	while true do
		local a, b, c = Script.temp_count()
		local status = movement:update(dt)

		if status == "end" then
			return nil
		end

		local current_position = movement:current_position()
		local current_spline_curve_distance = movement:current_spline_curve_distance()
		local current_distance = math.abs(current_spline_curve_distance - previous_spline_curve_distance)
		total_distance = current_distance + total_distance

		if distance <= total_distance or current_distance <= 0 then
			local direction = Vector3.normalize(current_position - previous_position)

			return current_position, direction
		end

		Vector3.set_xyz(previous_position, current_position.x, current_position.y, current_position.z)

		previous_spline_curve_distance = current_spline_curve_distance

		Script.set_temp_count(a, b, c)
	end
end

AIGroupSystem.register_spline_properties = function (self, spline_name, properties)
	self._spline_properties[spline_name] = properties
end

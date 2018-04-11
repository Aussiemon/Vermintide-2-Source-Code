require("scripts/unit_extensions/human/ai_player_unit/ai_utils")
require("scripts/settings/slot_settings")

local DEFAULT_SLOT_TYPE = "normal"
local extensions = {
	"AIEnemySlotExtension",
	"AIPlayerSlotExtension",
	"AIAggroableSlotExtension"
}
AISlotSystem = class(AISlotSystem, ExtensionSystemBase)
local global_ai_target_units = AI_TARGET_UNITS
AISlotSystem.init = function (self, context, system_name)
	local entity_manager = context.entity_manager

	entity_manager.register_system(entity_manager, self, system_name, extensions)

	self.entity_manager = entity_manager
	self.is_server = context.is_server
	self.world = context.world
	self.unit_storage = context.unit_storage
	self.nav_world = Managers.state.entity:system("ai_system"):nav_world()
	self.unit_extension_data = {}
	self.update_slots_ai_units = {}
	self.update_slots_ai_units_prioritized = {}
	self.target_units = {}
	self.current_ai_index = 1
	self.next_total_slot_count_update = 0
	self.next_disabled_slot_count_update = 0
	self.next_slot_sound_update = 0
	self.network_transmit = context.network_transmit
	self.num_total_enemies = 0
	self.num_occupied_slots = 0
	local nav_tag_layer_costs = {
		bot_poison_wind = 1,
		bot_ratling_gun_fire = 1,
		fire_grenade = 1
	}

	table.merge(nav_tag_layer_costs, NAV_TAG_VOLUME_LAYER_COST_AI)

	local navtag_layer_cost_table = GwNavTagLayerCostTable.create()
	self._navtag_layer_cost_table = navtag_layer_cost_table

	AiUtils.initialize_cost_table(navtag_layer_cost_table, nav_tag_layer_costs)

	local nav_cost_map_cost_table = GwNavCostMap.create_tag_cost_table()
	self._nav_cost_map_cost_table = nav_cost_map_cost_table

	AiUtils.initialize_nav_cost_map_cost_table(nav_cost_map_cost_table, nil, 1)

	self._traverse_logic = GwNavTraverseLogic.create(self.nav_world, nav_cost_map_cost_table)

	GwNavTraverseLogic.set_navtag_layer_cost_table(self._traverse_logic, navtag_layer_cost_table)

	return 
end
local SLOT_COLORS = nil
AISlotSystem.destroy = function (self)
	if self._traverse_logic ~= nil then
		GwNavTagLayerCostTable.destroy(self._navtag_layer_cost_table)
		GwNavCostMap.destroy_tag_cost_table(self._nav_cost_map_cost_table)
		GwNavTraverseLogic.destroy(self._traverse_logic)
	end

	return 
end
local SLOT_RADIUS = 0.5
local SLOT_POSITION_CHECK_INDEX = {
	CHECK_LEFT = 0,
	CHECK_RIGHT = 2,
	CHECK_MIDDLE = 1
}
local SLOT_POSITION_CHECK_INDEX_SIZE = table.size(SLOT_POSITION_CHECK_INDEX)
local SLOT_POSITION_CHECK_RADIANS = {
	[SLOT_POSITION_CHECK_INDEX.CHECK_LEFT] = math.degrees_to_radians(-90),
	[SLOT_POSITION_CHECK_INDEX.CHECK_RIGHT] = math.degrees_to_radians(90)
}

local function create_target_slots(target_unit, target_unit_extension, color_index)
	local all_slots = target_unit_extension.all_slots

	for slot_type, slot_data in pairs(all_slots) do
		local total_slots_count = slot_data.total_slots_count
		local slots = slot_data.slots
		local use_wait_slots = slot_data.use_wait_slots

		for i = 1, total_slots_count, 1 do
			local slot = {
				target_unit = target_unit,
				queue = {},
				original_absolute_position = Vector3Box(0, 0, 0),
				absolute_position = Vector3Box(0, 0, 0),
				ghost_position = Vector3Box(0, 0, 0),
				queue_direction = Vector3Box(0, 0, 0),
				position_right = Vector3Box(0, 0, 0),
				position_left = Vector3Box(0, 0, 0),
				index = i,
				anchor_weight = 0,
				type = slot_type,
				radians = math.degrees_to_radians(360 / total_slots_count),
				priority = slot_data.priority,
				position_check_index = SLOT_POSITION_CHECK_INDEX.CHECK_MIDDLE
			}
			local j = (i - 1) % 9 + 1
			slot.debug_color_name = SLOT_COLORS[color_index][j]
			slots[i] = slot
		end
	end

	return 
end

local function delete_slot(slot, unit_extension_data)
	if not slot then
		return 
	end

	local ai_unit = slot.ai_unit

	if ai_unit then
		local ai_unit_extension = unit_extension_data[ai_unit]

		if ai_unit_extension then
			ai_unit_extension.slot = nil
		end

		Managers.state.debug_text:clear_unit_text(ai_unit, "slot_index")
	end

	local queue = slot.queue
	local queue_n = #queue

	for i = 1, queue_n, 1 do
		local ai_unit_waiting = queue[i]
		local ai_unit_waiting_extension = unit_extension_data[ai_unit_waiting]

		if ai_unit_waiting_extension then
			ai_unit_waiting_extension.waiting_on_slot = nil
		end
	end

	local target_unit = slot.target_unit
	local target_unit_extension = unit_extension_data[target_unit]

	if target_unit_extension then
		local all_slots = target_unit_extension.all_slots

		for slot_type, slot_data in pairs(all_slots) do
			local target_slots = slot_data.slots
			local target_slots_n = #target_slots

			for i = 1, target_slots_n, 1 do
				if target_slots[i] == slot then
					target_slots[i] = target_slots[target_slots_n]
					target_slots[i].index = i
					target_slots[target_slots_n] = nil

					break
				end
			end
		end
	end

	slot = nil

	return 
end

local function disable_slot(slot, unit_extension_data)
	local ai_unit = slot.ai_unit

	if ai_unit then
		local ai_unit_extension = unit_extension_data[ai_unit]
		ai_unit_extension.slot = nil
		slot.ai_unit = nil
	end

	slot.disabled = true
	slot.released = false

	return 
end

local function enable_slot(slot)
	slot.disabled = false

	return 
end

local function slots_count(target_unit, unit_extension_data, wanted_slot_type)
	local target_unit_extension = unit_extension_data[target_unit]
	local all_slots = target_unit_extension.all_slots
	local slots_n = 0
	local slot_data = all_slots[wanted_slot_type]
	local target_slots = slot_data.slots
	local total_slots_count = slot_data.total_slots_count

	for i = 1, total_slots_count, 1 do
		local slot = target_slots[i]

		if slot.ai_unit then
			slots_n = slots_n + 1
		end

		slots_n = slots_n + #slot.queue
	end

	return slots_n
end

local unit_alive = AiUtils.unit_alive
local unit_knocked_down = AiUtils.unit_knocked_down

local function detach_ai_unit_from_slot(ai_unit, unit_extension_data)
	local ai_unit_extension = unit_extension_data[ai_unit]

	if not ai_unit_extension then
		return 
	end

	local slot = ai_unit_extension.slot
	local waiting_on_slot = ai_unit_extension.waiting_on_slot

	if slot then
		local queue = slot.queue
		local queue_n = #queue

		if 0 < queue_n then
			local ai_unit_waiting = queue[queue_n]
			local ai_unit_waiting_extension = unit_extension_data[ai_unit_waiting]
			slot.ai_unit = ai_unit_waiting
			ai_unit_waiting_extension.slot = slot
			ai_unit_waiting_extension.waiting_on_slot = nil
			queue[queue_n] = nil
		else
			slot.ai_unit = nil
		end

		Managers.state.debug_text:clear_unit_text(ai_unit, "slot_index")

		local target_unit = slot.target_unit

		if Unit.alive(target_unit) then
			local target_unit_extension = unit_extension_data[target_unit]
			local slot_type = slot.type
			local slot_data = target_unit_extension.all_slots[slot_type]
			slot_data.slots_count = slots_count(target_unit, unit_extension_data, slot_type)
		end
	elseif waiting_on_slot then
		local queue = waiting_on_slot.queue
		local queue_n = #queue

		for i = 1, queue_n, 1 do
			local ai_unit_waiting = queue[i]
			local ai_unit_waiting_extension = unit_extension_data[ai_unit_waiting]

			if ai_unit_waiting == ai_unit then
				queue[i] = queue[queue_n]
				queue[queue_n] = nil
			end
		end
	end

	ai_unit_extension.waiting_on_slot = nil
	ai_unit_extension.slot = nil

	return 
end

AISlotSystem.hot_join_sync = function (self, sender, player)
	return 
end
local AI_UPDATES_PER_FRAME = 1
local SLOT_QUEUE_RADIUS = 1.75
local SLOT_QUEUE_RADIUS_SQ = SLOT_QUEUE_RADIUS * SLOT_QUEUE_RADIUS
local SLOT_QUEUE_RANDOM_POS_MAX_UP = 1.5
local SLOT_QUEUE_RANDOM_POS_MAX_DOWN = 2
local SLOT_QUEUE_RANDOM_POS_MAX_HORIZONTAL = 3
local SLOT_Z_MAX_DOWN = 7.5
local SLOT_Z_MAX_UP = 4
local TARGET_MOVED = 0.5
local TARGET_SLOTS_UPDATE = 0.25
local TARGET_SLOTS_UPDATE_LONG = 1
local Z_MAX_DIFFERENCE = 1.5
local NAVMESH_DISTANCE_FROM_WALL = 0.5
local MOVER_RADIUS = 0.6
local RAYCANGO_OFFSET = NAVMESH_DISTANCE_FROM_WALL + MOVER_RADIUS
AISlotSystem.do_slot_search = function (self, ai_unit, set)
	local ai_unit_extension = self.unit_extension_data[ai_unit]
	ai_unit_extension.do_search = set

	return 
end
local TARGET_OUTSIDE_NAVMESH_TIMEOUT = 2
AISlotSystem.has_target_been_outside_navmesh_too_long = function (self, target_unit, t)
	local unit_extension_data = self.unit_extension_data
	local target_unit_extension = unit_extension_data[target_unit]
	local outside_navmesh_at_t = target_unit_extension and target_unit_extension.outside_navmesh_at_t
	local intervention_time = math.max(CurrentSpecialsSettings.outside_navmesh_intervention.intervention_time, TARGET_OUTSIDE_NAVMESH_TIMEOUT)
	local has_target_been_outside_navmesh_too_long = outside_navmesh_at_t and outside_navmesh_at_t + intervention_time < t

	return has_target_been_outside_navmesh_too_long
end

local function clamp_position_on_navmesh(position, nav_world, above, below)
	below = below or Z_MAX_DIFFERENCE
	above = above or Z_MAX_DIFFERENCE
	local position_on_navmesh = nil
	local is_on_navmesh, altitude = GwNavQueries.triangle_from_position(nav_world, position, above, below)

	if is_on_navmesh then
		position_on_navmesh = Vector3.copy(position)
		position_on_navmesh.z = altitude
	end

	return (is_on_navmesh and position_on_navmesh) or nil
end

function get_target_pos_on_navmesh(target_position, nav_world)
	local position_on_navmesh = clamp_position_on_navmesh(target_position, nav_world)

	if position_on_navmesh then
		return position_on_navmesh
	end

	local above_limit = Z_MAX_DIFFERENCE
	local below_limit = Z_MAX_DIFFERENCE
	local horizontal_limit = 1
	local distance_from_nav_border = 0.05
	local border_position = GwNavQueries.inside_position_from_outside_position(nav_world, target_position, above_limit, below_limit, horizontal_limit, distance_from_nav_border)

	if border_position then
		return border_position
	end

	above_limit = Z_MAX_DIFFERENCE
	below_limit = SLOT_Z_MAX_DOWN
	position_on_navmesh = clamp_position_on_navmesh(target_position, nav_world, above_limit, below_limit)

	if position_on_navmesh then
		return position_on_navmesh
	end

	return nil
end

local PENALTY_TERM = 100

local function get_slot_queue_position(unit_extension_data, slot, nav_world, distance_modifier)
	local target_unit = slot.target_unit
	local ai_unit = slot.ai_unit

	if not unit_alive(target_unit) or not unit_alive(ai_unit) then
		return 
	end

	local slot_type = slot.type
	local slot_distance = SlotSettings[slot_type].distance
	local target_unit_extension = unit_extension_data[target_unit]
	local target_unit_position = target_unit_extension.position:unbox()
	local ai_unit_position = POSITION_LOOKUP[ai_unit]
	local slot_queue_direction = slot.queue_direction:unbox()
	local slot_queue_distance_modifier = distance_modifier or 0
	local target_to_ai_distance = Vector3.distance(target_unit_position, ai_unit_position)
	local queue_distance = SlotSettings[slot_type].queue_distance
	local slot_queue_distance = target_to_ai_distance + queue_distance + slot_queue_distance_modifier
	local slot_queue_position = target_unit_position + slot_queue_direction * slot_queue_distance
	local slot_queue_position_on_navmesh = clamp_position_on_navmesh(slot_queue_position, nav_world)
	local max_tries = 5
	local i = 1

	while not slot_queue_position_on_navmesh and i <= max_tries do
		slot_queue_distance = math.max(target_to_ai_distance * (1 - i / max_tries), slot_distance) + queue_distance + slot_queue_distance_modifier
		slot_queue_position = target_unit_position + slot_queue_direction * slot_queue_distance
		slot_queue_position_on_navmesh = clamp_position_on_navmesh(slot_queue_position, nav_world)
		i = i + 1
	end

	local penalty_term = 0

	if not slot_queue_position_on_navmesh then
		penalty_term = PENALTY_TERM
		slot_queue_position = target_unit_position + slot_queue_direction * queue_distance

		return slot_queue_position, penalty_term
	else
		return slot_queue_position_on_navmesh, penalty_term
	end

	return 
end

local function offset_slot(target_unit, slot_absolute_position, target_unit_position)
	local target_velocity = nil

	if ScriptUnit.has_extension(target_unit, "locomotion_system") then
		target_velocity = ScriptUnit.extension(target_unit, "locomotion_system"):current_velocity()
	else
		target_velocity = Vector3(0, 0, 0)
	end

	if 0.1 < Vector3.length(target_velocity) then
		local speed = Vector3.length(target_velocity)
		local move_direction = Vector3.normalize(target_velocity)
		local wanted_slot_offset = move_direction * speed
		local slot_to_target_dir = Vector3.normalize(target_unit_position - slot_absolute_position)
		local dot = Vector3.dot(slot_to_target_dir, move_direction)
		local predict_time = math.max(2 * (dot - 0.5), 0)
		local current_slot_offset = wanted_slot_offset * predict_time
		local slot_offset_position = slot_absolute_position + current_slot_offset

		return slot_offset_position
	else
		return slot_absolute_position
	end

	return 
end

AISlotSystem.improve_slot_position = function (self, ai_unit, t)
	if not unit_alive(ai_unit) then
		return 
	end

	local ai_unit_position = POSITION_LOOKUP[ai_unit]
	local ai_unit_extension = self.unit_extension_data[ai_unit]
	local slot = ai_unit_extension.slot
	local waiting_on_slot = ai_unit_extension.waiting_on_slot
	local position = nil

	if slot then
		if slot.ghost_position.x ~= 0 then
			position = slot.ghost_position:unbox()
		else
			position = slot.absolute_position:unbox()
		end
	elseif waiting_on_slot and ai_unit_extension.improve_wait_slot_position_t < t then
		local nav_world = self.nav_world
		local queue = waiting_on_slot.queue
		local distance_modifier = (queue[1] == ai_unit and -0.5) or 0.5
		local slot_queue_position = get_slot_queue_position(self.unit_extension_data, waiting_on_slot, nav_world, distance_modifier)
		local above_limit = SLOT_QUEUE_RANDOM_POS_MAX_UP
		local below_limit = SLOT_QUEUE_RANDOM_POS_MAX_DOWN
		local horizontal_limit = SLOT_QUEUE_RANDOM_POS_MAX_HORIZONTAL
		local min_dist = 0
		local max_dist = SLOT_QUEUE_RADIUS
		local max_tries = 2
		local random_goal_function = LocomotionUtils.new_random_goal_uniformly_distributed_with_inside_from_outside_on_last
		local random_slot_position = (slot_queue_position and random_goal_function(nav_world, nil, slot_queue_position, min_dist, max_dist, max_tries, nil, above_limit, below_limit, horizontal_limit)) or nil
		local z_diff = (random_slot_position and math.abs(ai_unit_position.z - random_slot_position.z)) or 0
		local z_diff_exceded = Z_MAX_DIFFERENCE < z_diff
		local distance = (random_slot_position and Vector3.distance(random_slot_position, ai_unit_position)) or math.huge
		local close_distance = distance < 5
		position = random_slot_position

		if z_diff_exceded and close_distance then
			position = nil
		end

		ai_unit_extension.wait_slot_distance = distance
		ai_unit_extension.improve_wait_slot_position_t = t + Math.random() * 0.4
	else
		return 
	end

	if not position then
		return 
	end

	local distance_sq = Vector3.distance_squared(ai_unit_position, position)
	local navigation_extension = ScriptUnit.extension(ai_unit, "ai_navigation_system")
	local previous_destination = navigation_extension.destination(navigation_extension)

	if 1 < distance_sq or Vector3.dot(position - ai_unit_position, previous_destination - ai_unit_position) < 0 then
		navigation_extension.move_to(navigation_extension, position)
	end

	return 
end
AISlotSystem.ai_unit_have_slot = function (self, ai_unit)
	local ai_unit_extension = self.unit_extension_data[ai_unit]

	if not ai_unit_extension then
		return false
	end

	local slot = ai_unit_extension.slot

	if not slot then
		return false
	end

	return true
end
AISlotSystem.ai_unit_wait_slot_distance = function (self, ai_unit)
	local ai_unit_extension = self.unit_extension_data[ai_unit]

	if not ai_unit_extension then
		return math.huge
	end

	local slot = ai_unit_extension.slot

	if slot then
		return math.huge
	end

	local waiting_on_slot = ai_unit_extension.waiting_on_slot

	if not waiting_on_slot then
		return math.huge
	end

	local distance = ai_unit_extension.wait_slot_distance or math.huge

	return distance
end
AISlotSystem.ai_unit_slot_position = function (self, ai_unit)
	local ai_unit_extension = self.unit_extension_data[ai_unit]

	if not ai_unit_extension then
		return nil
	end

	local slot = ai_unit_extension.slot or ai_unit_extension.waiting_on_slot

	if slot then
		return slot.absolute_position:unbox()
	end

	return nil
end
AISlotSystem.get_target_unit_slot_data = function (self, target_unit, slot_type)
	local target_unit_extension = self.unit_extension_data[target_unit]
	local slot_data = target_unit_extension.all_slots[slot_type]

	if not slot_data then
		return 
	end

	local slots = slot_data.slots

	return slots
end
AISlotSystem.slots_count = function (self, unit, slot_type)
	local unit_extension = self.unit_extension_data[unit]
	local slot_type = slot_type or DEFAULT_SLOT_TYPE
	local slot_data = unit_extension.all_slots[slot_type]
	local slots_count = slot_data.slots_count

	return slots_count
end
AISlotSystem.total_slots_count = function (self, unit, slot_type)
	local unit_extension = self.unit_extension_data[unit]
	local slot_type = slot_type or DEFAULT_SLOT_TYPE
	local slot_data = unit_extension.all_slots[slot_type]
	local total_slots_count = slot_data.total_slots_count

	return total_slots_count
end
AISlotSystem.disabled_slots_count = function (self, unit, slot_type)
	local unit_extension = self.unit_extension_data[unit]
	local slot_type = slot_type or DEFAULT_SLOT_TYPE
	local slot_data = unit_extension.all_slots[slot_type]
	local disabled_slots_count = slot_data.disabled_slots_count

	return disabled_slots_count
end

local function update_target(target_unit, ai_unit, ai_blackboard, unit_extension_data, t)
	local ai_unit_extension = unit_extension_data[ai_unit]

	if not Unit.alive(target_unit) then
		ai_unit_extension.target = nil

		ai_unit_extension.target_position:store(0, 0, 0)

		if ai_unit_extension.slot then
			detach_ai_unit_from_slot(ai_unit, unit_extension_data)
		end

		return 
	end

	local target_unit_position = POSITION_LOOKUP[target_unit]

	ai_unit_extension.target_position:store(target_unit_position)

	return 
end

local function rotate_position_from_origin(origin, position, radians, distance)
	local direction_vector = Vector3.normalize(Vector3.flat(position - origin))
	local rotation = Quaternion(-Vector3.up(), radians)
	local vector = Quaternion.rotate(rotation, direction_vector)
	local position_rotated = origin + vector * distance

	return position_rotated
end

local function set_slot_edge_positions(slot, target_unit_extension)
	local target_unit = slot.target_unit
	local unit_position = target_unit_extension.position:unbox()
	local slot_absolute_position = slot.original_absolute_position:unbox()
	local slot_type = slot.type
	local slot_distance = SlotSettings[slot_type].distance
	local slot_radians = slot.radians
	local position_right = rotate_position_from_origin(unit_position, slot_absolute_position, slot_radians, slot_distance)
	local position_left = rotate_position_from_origin(unit_position, slot_absolute_position, -slot_radians, slot_distance)

	slot.position_right:store(position_right)
	slot.position_left:store(position_left)

	return 
end

local function set_slot_absolute_position(slot, position, target_unit_extension)
	local target_unit = slot.target_unit
	local target_position = target_unit_extension.position:unbox()
	local direction_vector = Vector3.normalize(Vector3.flat(position - target_position))

	slot.absolute_position:store(position)
	slot.queue_direction:store(direction_vector)
	set_slot_edge_positions(slot, target_unit_extension)

	return 
end

function get_slot_position_on_navmesh(target_unit, target_position, wanted_position, radians, distance, should_offset_slot, nav_world, above, below)
	local original_position = (radians and rotate_position_from_origin(target_position, wanted_position, radians, distance)) or wanted_position
	local offsetted_position = (should_offset_slot and offset_slot(target_unit, original_position, target_position)) or original_position
	local position_on_navmesh = clamp_position_on_navmesh(offsetted_position, nav_world, above, below)

	return position_on_navmesh, original_position
end

local function get_slot_position_on_navmesh_from_outside_target(target_position, slot_direction, radians, distance, nav_world, above, below)
	local position_on_navmesh = nil
	local max_tries = 10
	local dist_per_try = 0.15

	if radians then
		local rotation = Quaternion(-Vector3.up(), radians)
		slot_direction = Quaternion.rotate(rotation, slot_direction)
	end

	for i = 0, max_tries - 1, 1 do
		local wanted_position = target_position + slot_direction * (i * dist_per_try + distance)
		position_on_navmesh = clamp_position_on_navmesh(wanted_position, nav_world, above, below)

		if position_on_navmesh then
			break
		end
	end

	return position_on_navmesh, position_on_navmesh
end

local function get_reachable_slot_position_on_navmesh(slot, target_unit, target_position, wanted_position, radians, distance, should_offset_slot, nav_world, traverse_logic, above, below)
	local position_on_navmesh, original_position = get_slot_position_on_navmesh(target_unit, target_position, wanted_position, radians, distance, should_offset_slot, nav_world, above, below)
	local check_index = slot.position_check_index
	local is_using_middle_check = check_index == SLOT_POSITION_CHECK_INDEX.CHECK_MIDDLE
	local check_radians = (not is_using_middle_check and SLOT_POSITION_CHECK_RADIANS[check_index]) or nil
	local raycango_offset = RAYCANGO_OFFSET

	if position_on_navmesh then
		local check_position = nil

		if is_using_middle_check then
			check_position = position_on_navmesh
		else
			check_position = rotate_position_from_origin(position_on_navmesh, target_position, check_radians, SLOT_RADIUS)
		end

		local ray_target_pos = target_position + Vector3.normalize(check_position - target_position) * raycango_offset
		local ray_can_go = GwNavQueries.raycango(nav_world, check_position, ray_target_pos, traverse_logic)

		if not ray_can_go then
			position_on_navmesh = nil
		end
	elseif not is_using_middle_check then
		local check_position = rotate_position_from_origin(wanted_position, target_position, check_radians, SLOT_RADIUS)
		position_on_navmesh, original_position = get_slot_position_on_navmesh(target_unit, target_position, check_position, radians, distance, should_offset_slot, nav_world, above, below)

		if position_on_navmesh then
			local ray_target_pos = target_position + Vector3.normalize(position_on_navmesh - target_position) * raycango_offset
			local ray_can_go = GwNavQueries.raycango(nav_world, position_on_navmesh, ray_target_pos, traverse_logic)

			if ray_can_go then
				slot.position_check_index = SLOT_POSITION_CHECK_INDEX.CHECK_MIDDLE
			else
				position_on_navmesh = nil
			end
		end
	end

	if not position_on_navmesh then
		slot.position_check_index = (slot.position_check_index + 1) % SLOT_POSITION_CHECK_INDEX_SIZE
	end

	return position_on_navmesh, original_position
end

local function overlap_with_other_target_slot(slot, target_units, unit_extension_data)
	local slot_target_unit = slot.target_unit
	local slot_position = slot.absolute_position:unbox()
	local target_units_n = #target_units

	for i = 1, target_units_n, 1 do
		local target_unit = target_units[i]

		if target_unit == slot_target_unit then
		else
			local target_unit_extension = unit_extension_data[target_unit]
			local all_slots = target_unit_extension.all_slots

			for slot_type, slot_data in pairs(all_slots) do
				local radius = SlotSettings[slot_type].radius
				local overlap_distance_sq = radius * radius
				local target_slots = slot_data.slots
				local total_slots_count = slot_data.total_slots_count

				for j = 1, total_slots_count, 1 do
					local target_slot = target_slots[j]

					if target_slot.disabled then
					else
						local target_slot_position = target_slot.absolute_position:unbox()
						local distance_squared = Vector3.distance_squared(slot_position, target_slot_position)

						if distance_squared < overlap_distance_sq then
							return target_slot
						end
					end
				end
			end
		end
	end

	return false
end

local function overlap_with_own_slots(slot, unit_extension_data)
	local slot_a_radius = slot.radius
	local slot_a_position = slot.absolute_position:unbox()
	local slot_a_priority = slot.priority
	local slot_a_type = slot.type
	local slot_a_radius = slot.radius
	local target_unit = slot.target_unit
	local target_unit_extension = unit_extension_data[target_unit]
	local all_slots = target_unit_extension.all_slots

	for slot_b_type, slot_data in pairs(all_slots) do
		if slot_a_type == slot_b_type then
		else
			local slot_b_radius = SlotSettings[slot_b_type].radius
			local overlap_distance_sq = slot_b_radius * slot_b_radius
			local slots = slot_data.slots
			local num_slots = slot_data.total_slots_count

			for j = 1, num_slots, 1 do
				local slot_b = slots[j]

				if slot_b.disabled then
				else
					local ai_unit_b = slot_b.ai_unit

					if not ai_unit_b then
					else
						local slot_b_position = slot_b.absolute_position:unbox()
						local distance_squared = Vector3.distance_squared(slot_a_position, slot_b_position)

						if distance_squared < overlap_distance_sq then
							return slot_b
						end
					end
				end
			end
		end
	end

	return false
end

local OVERLAP_SLOT_TO_TARGET_DISTANCE = 1.2
local OVERLAP_SLOT_TO_TARGET_DISTANCE_SQ = OVERLAP_SLOT_TO_TARGET_DISTANCE * OVERLAP_SLOT_TO_TARGET_DISTANCE

local function overlap_with_other_target(slot, target_units, unit_extension_data)
	local slot_target_unit = slot.target_unit
	local slot_position = slot.absolute_position:unbox()
	local target_units_n = #target_units

	for i = 1, target_units_n, 1 do
		local target_unit = target_units[i]

		if target_unit == slot_target_unit then
		else
			local target_unit_position = unit_extension_data[target_unit].position:unbox()
			local distance_squared = Vector3.distance_squared(slot_position, target_unit_position)

			if distance_squared < OVERLAP_SLOT_TO_TARGET_DISTANCE_SQ then
				return true
			end
		end
	end

	return false
end

local function disable_overlaping_slot(slot, overlap_slot, unit_extension_data, t)
	local slot_priority = slot.priority
	local overlap_slot_priority = overlap_slot.priority
	local target_unit = slot.target_unit
	local target_unit_extension = unit_extension_data[target_unit]
	local target_index = target_unit_extension.index
	local slot_index = slot.index
	local overlap_target_unit = overlap_slot.target_unit
	local overlap_target_unit_extension = unit_extension_data[overlap_target_unit]
	local overlap_target_index = overlap_target_unit_extension.index
	local overlap_slot_index = overlap_slot.index

	if slot_priority < overlap_slot_priority and not slot.ai_unit then
		return 
	elseif overlap_slot_priority < slot_priority and not overlap_slot.ai_unit then
		return 
	end

	if slot_priority < overlap_slot_priority then
		disable_slot(overlap_slot, unit_extension_data)

		return false
	elseif overlap_slot_priority < slot_priority then
		disable_slot(slot, unit_extension_data)

		return true
	end

	if overlap_slot_index < slot_index then
		disable_slot(slot, unit_extension_data)

		return true
	end

	if slot_index < overlap_slot_index then
		disable_slot(overlap_slot, unit_extension_data)

		return false
	end

	if overlap_target_index < target_index then
		disable_slot(slot, unit_extension_data)

		return true
	else
		disable_slot(overlap_slot, unit_extension_data)

		return false
	end

	return 
end

local function slot_is_behind_target(slot, ai_unit, target_unit_extension)
	local slot_position = slot.original_absolute_position:unbox()
	local ai_unit_position = POSITION_LOOKUP[ai_unit]
	local target_unit = slot.target_unit
	local target_unit_position = target_unit_extension.position:unbox()
	local flat_target_unit_to_slot_vector = Vector3.flat(slot_position - target_unit_position)
	local normalized_target_unit_to_slot_vector = Vector3.normalize(flat_target_unit_to_slot_vector)
	local flat_target_unit_to_ai_unit_vector = Vector3.flat(ai_unit_position - target_unit_position)
	local normalized_target_unit_to_ai_unit_vector = Vector3.normalize(flat_target_unit_to_ai_unit_vector)
	local dot_value = Vector3.dot(normalized_target_unit_to_slot_vector, normalized_target_unit_to_ai_unit_vector)

	return dot_value < 0.6
end

local function clear_ghost_position(slot)
	slot.ghost_position:store(Vector3(0, 0, 0))

	return 
end

local GHOST_ANGLE = 90
local GHOST_RADIANS = math.degrees_to_radians(GHOST_ANGLE)

local function set_ghost_position(target_unit_extension, slot, nav_world, traverse_logic)
	local slot_position = slot.absolute_position:unbox()
	local ai_unit = slot.ai_unit
	local ai_unit_position = POSITION_LOOKUP[ai_unit]
	local target_unit_position = target_unit_extension.position:unbox()
	local target_unit_to_ai_unit_vector = Vector3.normalize(ai_unit_position - target_unit_position)
	local distance = math.min(Vector3.distance(target_unit_position, ai_unit_position), 8)
	local ghost_position_left = rotate_position_from_origin(slot_position, ai_unit_position, -GHOST_RADIANS, distance)
	local ghost_position_right = rotate_position_from_origin(slot_position, ai_unit_position, GHOST_RADIANS, distance)
	local distance_ghost_position_left = Vector3.distance_squared(target_unit_position, ghost_position_left)
	local distance_ghost_position_right = Vector3.distance_squared(target_unit_position, ghost_position_right)
	local use_ghost_position_left = distance_ghost_position_right < distance_ghost_position_left
	local ghost_position = (use_ghost_position_left and ghost_position_left) or ghost_position_right
	local ghost_position_on_navmesh = clamp_position_on_navmesh(ghost_position, nav_world)
	local ghost_position_direction = nil

	if ghost_position_on_navmesh then
		ghost_position_direction = Vector3.normalize(ghost_position_on_navmesh - slot_position)
	else
		ghost_position_direction = Vector3.normalize(ghost_position - slot_position)
	end

	local max_tries = 5

	for i = 1, max_tries, 1 do
		if ghost_position_on_navmesh then
			local ray_can_go = GwNavQueries.raycango(nav_world, ghost_position_on_navmesh, slot_position, traverse_logic)

			if ray_can_go then
				slot.ghost_position:store(ghost_position_on_navmesh)

				return 
			end
		end

		local slot_type = slot.type
		local slot_distance = SlotSettings[slot_type].distance
		local ghost_position_distance = slot_distance + ((distance - slot_distance) * (max_tries - i)) / max_tries
		ghost_position = target_unit_position + ghost_position_direction * ghost_position_distance
		ghost_position_on_navmesh = clamp_position_on_navmesh(ghost_position, nav_world)
	end

	clear_ghost_position(slot)

	return 
end

local function update_slot_anchor_weight(slot, target_unit, unit_extension_data)
	local target_unit_extension = unit_extension_data[target_unit]
	local slot_type = slot.type
	local slot_data = target_unit_extension.all_slots[slot_type]
	local target_slots = slot_data.slots
	local slot_index = slot.index
	local total_slots_count = slot_data.total_slots_count
	local score = 128
	local slot_valid = slot.ai_unit and not slot.released
	slot.anchor_weight = (slot_valid and 256) or 0

	for i = 1, total_slots_count, 1 do
		local index = slot_index + i

		if total_slots_count < index then
			index = index - total_slots_count
		end

		local slot_right = target_slots[index]
		local slot_disabled = slot_right.disabled
		local slot_released = slot_right.released
		local ai_unit = slot_right.ai_unit

		if not slot_disabled and not ai_unit then
			break
		end

		if not slot_released then
			slot.anchor_weight = slot.anchor_weight + score
			score = score / 2
		end
	end

	score = 128

	for i = 1, total_slots_count, 1 do
		local index = slot_index - i

		if index < 1 then
			index = index + total_slots_count
		end

		local slot_left = target_slots[index]
		local slot_disabled = slot_left.disabled
		local slot_released = slot_left.released
		local ai_unit = slot_left.ai_unit

		if not slot_disabled and not ai_unit then
			break
		end

		if not slot_released then
			slot.anchor_weight = slot.anchor_weight + score
			score = score / 2
		end
	end

	return 
end

local function update_anchor_weights(target_unit, unit_extension_data)
	local target_unit_extension = unit_extension_data[target_unit]
	local all_slots = target_unit_extension.all_slots

	for slot_data, slot_data in pairs(all_slots) do
		local target_slots = slot_data.slots
		local total_slots_count = slot_data.total_slots_count

		for i = 1, total_slots_count, 1 do
			local slot = target_slots[i]

			update_slot_anchor_weight(slot, target_unit, unit_extension_data)
		end
	end

	return 
end

local RELEASE_SLOT_DISTANCE = 3
local RELEASE_SLOT_DISTANCE_SQ = RELEASE_SLOT_DISTANCE * RELEASE_SLOT_DISTANCE

local function check_to_release_slot(slot)
	if slot.disabled then
		return 
	end

	local ai_unit = slot.ai_unit

	if not ai_unit then
		slot.released = false

		return 
	end

	local ai_unit_position = POSITION_LOOKUP[ai_unit]
	local slot_position = slot.absolute_position:unbox()
	local distance_to_slot_position = Vector3.distance_squared(ai_unit_position, slot_position)
	local slot_released = RELEASE_SLOT_DISTANCE_SQ < distance_to_slot_position
	slot.released = slot_released

	return 
end

local function get_anchor_slot(slot_type, target_unit, unit_extension_data)
	local target_unit_extension = unit_extension_data[target_unit]
	local slot_data = target_unit_extension.all_slots[slot_type]
	local target_slots = slot_data.slots
	local total_slots_count = slot_data.total_slots_count
	local best_slot = target_slots[1]
	local best_anchor_weight = best_slot.anchor_weight

	for i = 1, total_slots_count, 1 do
		local slot = target_slots[i]
		local slot_disabled = slot.disabled

		if slot_disabled then
		else
			local slot_anchor_weight = slot.anchor_weight

			if best_anchor_weight < slot_anchor_weight or (slot_anchor_weight == best_anchor_weight and slot.index < best_slot.index) then
				best_slot = slot
				best_anchor_weight = slot_anchor_weight
			end
		end
	end

	return best_slot
end

local MAX_GET_SLOT_POSITION_TRIES = 24

local function update_anchor_slot_position(slot, unit_extension_data, should_offset_slot, nav_world, traverse_logic, above, below, target_outside_navmesh)
	local target_unit = slot.target_unit
	local target_unit_extension = unit_extension_data[target_unit]
	local target_position = target_unit_extension.position:unbox()
	local ai_unit = slot.ai_unit
	local ai_position = ai_unit and POSITION_LOOKUP[ai_unit]
	local direction_vector = (ai_unit and Vector3.normalize(ai_position - target_position)) or Vector3.forward()
	local slot_type = slot.type
	local slot_distance = SlotSettings[slot_type].distance
	local wanted_position = target_position + direction_vector * slot_distance
	local position_on_navmesh, original_position = nil

	if target_outside_navmesh then
		position_on_navmesh, original_position = get_slot_position_on_navmesh_from_outside_target(target_position, direction_vector, nil, slot_distance, nav_world, above, below)
	else
		position_on_navmesh, original_position = get_reachable_slot_position_on_navmesh(slot, target_unit, target_position, wanted_position, nil, nil, should_offset_slot, nav_world, traverse_logic, above, below)
	end

	local i = 0

	while i <= MAX_GET_SLOT_POSITION_TRIES and not position_on_navmesh do
		local sign = (0 < i % 2 and -1) or 1
		local radians = math.ceil(i / 2) * sign

		if target_outside_navmesh then
			position_on_navmesh, original_position = get_slot_position_on_navmesh_from_outside_target(target_position, direction_vector, radians, slot_distance, nav_world, above, below)
		else
			position_on_navmesh, original_position = get_reachable_slot_position_on_navmesh(slot, target_unit, target_position, wanted_position, radians, slot_distance, should_offset_slot, nav_world, traverse_logic, above, below)
		end

		i = i + 1
	end

	if position_on_navmesh then
		slot.original_absolute_position:store(original_position)
		set_slot_absolute_position(slot, position_on_navmesh, target_unit_extension)

		return true, position_on_navmesh
	else
		slot.original_absolute_position:store(wanted_position)
		set_slot_absolute_position(slot, wanted_position, target_unit_extension)

		return false, wanted_position
	end

	return 
end

local function update_slot_position(target_unit, slot, slot_position, unit_extension_data, should_offset_slot, nav_world, traverse_logic, above, below, target_outside_navmesh)
	local target_unit_extension = unit_extension_data[target_unit]
	local target_position = target_unit_extension.position:unbox()
	local position_on_navmesh, original_position = nil
	local slot_type = slot.type
	local slot_distance = SlotSettings[slot_type].distance

	if target_outside_navmesh then
		position_on_navmesh, original_position = get_slot_position_on_navmesh_from_outside_target(target_position, Vector3.normalize(slot_position - target_position), nil, slot_distance, nav_world, above, below)
	else
		position_on_navmesh, original_position = get_reachable_slot_position_on_navmesh(slot, target_unit, target_position, slot_position, nil, nil, should_offset_slot, nav_world, traverse_logic, above, below)
	end

	if position_on_navmesh then
		slot.original_absolute_position:store(original_position)
		set_slot_absolute_position(slot, position_on_navmesh, target_unit_extension)

		return true, position_on_navmesh
	else
		slot.original_absolute_position:store(slot_position)
		set_slot_absolute_position(slot, slot_position, target_unit_extension)

		return false, slot_position
	end

	return 
end

local function disable_all_slots(target_unit, unit_extension_data)
	local target_unit_extension = unit_extension_data[target_unit]
	local all_slots = target_unit_extension.all_slots

	for slot_type, slot_data in pairs(all_slots) do
		local target_slots = slot_data.slots
		local total_slots_count = slot_data.total_slots_count

		for i = 1, total_slots_count, 1 do
			local slot = target_slots[i]

			disable_slot(slot, unit_extension_data)
		end
	end

	return 
end

local function update_slot_status(slot, is_on_navmesh, target_units, unit_extension_data)
	if is_on_navmesh then
		enable_slot(slot)
	else
		disable_slot(slot, unit_extension_data)

		return false
	end

	local overlaps_with_other_target = overlap_with_other_target(slot, target_units, unit_extension_data)

	if not overlaps_with_other_target then
		enable_slot(slot)
	else
		disable_slot(slot, unit_extension_data)

		return false
	end

	local overlap_slot = overlap_with_other_target_slot(slot, target_units, unit_extension_data)

	if overlap_slot then
		local disabled = disable_overlaping_slot(slot, overlap_slot, unit_extension_data)

		if not disabled then
			enable_slot(slot)
		else
			return false
		end
	end

	local overlap_own_slot = overlap_with_own_slots(slot, unit_extension_data)

	if overlap_own_slot then
		local disabled = disable_overlaping_slot(slot, overlap_own_slot, unit_extension_data)

		if not disabled then
			enable_slot(slot)
		else
			return false
		end
	end

	check_to_release_slot(slot)

	return true
end

local function update_target_slots_status(target_unit, target_units, unit_extension_data, nav_world, traverse_logic, outside_navmesh)
	local target_unit_extension = unit_extension_data[target_unit]
	local all_slots = target_unit_extension.all_slots

	for slot_type, slot_data in pairs(all_slots) do
		local target_slots = slot_data.slots
		local total_slots_count = slot_data.total_slots_count
		local should_offset_slot = false

		for i = 1, total_slots_count, 1 do
			local slot = target_slots[i]
			local slot_position = slot.absolute_position:unbox()
			local is_on_navmesh = update_slot_position(target_unit, slot, slot_position, unit_extension_data, should_offset_slot, nav_world, traverse_logic, nil, nil, outside_navmesh)

			update_slot_status(slot, is_on_navmesh, target_units, unit_extension_data)
		end

		update_anchor_weights(target_unit, unit_extension_data)
	end

	return 
end

local function update_target_slots_positions_on_ladder(target_unit, target_units, unit_extension_data, should_offset_slot, nav_world, traverse_logic, ladder_unit, bottom, top)
	local target_unit_extension = unit_extension_data[target_unit]
	local all_slots = target_unit_extension.all_slots

	for slot_type, slot_data in pairs(all_slots) do
		local target_slots = slot_data.slots
		local total_slots_count = slot_data.total_slots_count
		local slot_offset_dist = 1
		local ladder_dir = Vector3.normalize(Vector3.flat(Quaternion.forward(Unit.world_rotation(ladder_unit, 0))))
		local ladder_right = Vector3.cross(ladder_dir, Vector3.up())
		local top_half = math.floor(total_slots_count / 2)
		local top_anchor_index = math.ceil(top_half / 2)
		local top_anchor_slot = target_slots[top_anchor_index]

		top_anchor_slot.original_absolute_position:store(top)
		set_slot_absolute_position(top_anchor_slot, top, target_unit_extension)
		update_slot_status(top_anchor_slot, true, target_units, unit_extension_data)

		local last_pos = top
		local success = true

		for i = top_anchor_index - 1, 1, -1 do
			local slot = target_slots[i]
			local new_wanted_pos = last_pos - ladder_right * slot_offset_dist
			success = success and GwNavQueries.raycango(nav_world, last_pos, new_wanted_pos, traverse_logic)

			slot.original_absolute_position:store(new_wanted_pos)
			set_slot_absolute_position(slot, new_wanted_pos, target_unit_extension)
			update_slot_status(slot, success, target_units, unit_extension_data)

			last_pos = new_wanted_pos
		end

		last_pos = top
		success = true

		for i = top_anchor_index + 1, top_half, 1 do
			local slot = target_slots[i]
			local new_wanted_pos = last_pos + ladder_right * slot_offset_dist
			success = success and GwNavQueries.raycango(nav_world, last_pos, new_wanted_pos, traverse_logic)

			slot.original_absolute_position:store(new_wanted_pos)
			set_slot_absolute_position(slot, new_wanted_pos, target_unit_extension)
			update_slot_status(slot, success, target_units, unit_extension_data)
		end

		local bottom_anchor_index = top_half + math.ceil((total_slots_count - top_half) / 2)
		local bottom_anchor_slot = target_slots[bottom_anchor_index]

		bottom_anchor_slot.original_absolute_position:store(bottom)
		set_slot_absolute_position(bottom_anchor_slot, bottom, target_unit_extension)
		update_slot_status(bottom_anchor_slot, true, target_units, unit_extension_data)

		last_pos = bottom
		local above = 1
		local below = 1
		local circle_radius = 1
		local center = bottom + circle_radius * ladder_dir
		local right_amount = bottom_anchor_index - 1 - top_half
		local angle_increment = math.pi / 2.5 / right_amount
		local increment = 1

		for i = bottom_anchor_index - 1, top_half + 1, -1 do
			local slot = target_slots[i]
			local angle = math.pi * 1.5 + increment * angle_increment
			local new_wanted_pos = center + circle_radius * (ladder_right * math.cos(angle) + ladder_dir * math.sin(angle))
			local z = nil
			success, z = GwNavQueries.triangle_from_position(nav_world, last_pos, above, below)

			if success then
				new_wanted_pos.z = z
			end

			slot.original_absolute_position:store(new_wanted_pos)
			set_slot_absolute_position(slot, new_wanted_pos, target_unit_extension)
			update_slot_status(slot, success, target_units, unit_extension_data)

			increment = increment + 1
		end

		local left_amount = total_slots_count - bottom_anchor_index
		angle_increment = math.pi / 2.5 / left_amount
		increment = 1
		last_pos = bottom

		for i = bottom_anchor_index + 1, total_slots_count, 1 do
			local slot = target_slots[i]
			local angle = math.pi * 1.5 - increment * angle_increment
			local new_wanted_pos = center + circle_radius * (ladder_right * math.cos(angle) + ladder_dir * math.sin(angle))
			local z = nil
			success, z = GwNavQueries.triangle_from_position(nav_world, last_pos, above, below)

			if success then
				new_wanted_pos.z = z
			end

			slot.original_absolute_position:store(new_wanted_pos)
			set_slot_absolute_position(slot, new_wanted_pos, target_unit_extension)
			update_slot_status(slot, success, target_units, unit_extension_data)

			increment = increment + 1
		end

		update_anchor_weights(target_unit, unit_extension_data)
	end

	return 
end

local function update_target_slots_positions(target_unit, target_units, unit_extension_data, should_offset_slot, nav_world, traverse_logic, is_on_ladder, ladder_unit, bottom, top, target_outside_navmesh)
	if is_on_ladder then
		update_target_slots_positions_on_ladder(target_unit, target_units, unit_extension_data, should_offset_slot, nav_world, traverse_logic, ladder_unit, bottom, top)

		return 
	end

	local above, below = nil

	if target_outside_navmesh then
		below = SLOT_Z_MAX_DOWN
		above = SLOT_Z_MAX_UP
	else
		below = Z_MAX_DIFFERENCE
		above = Z_MAX_DIFFERENCE
	end

	local target_unit_extension = unit_extension_data[target_unit]
	local all_slots = target_unit_extension.all_slots

	for slot_type, slot_data in pairs(all_slots) do
		local target_slots = slot_data.slots
		local anchor_slot = get_anchor_slot(slot_type, target_unit, unit_extension_data)
		local total_slots_count = slot_data.total_slots_count
		local slot_index = anchor_slot.index
		local is_on_navmesh = update_anchor_slot_position(anchor_slot, unit_extension_data, should_offset_slot, nav_world, traverse_logic, above, below, target_outside_navmesh)

		update_slot_status(anchor_slot, is_on_navmesh, target_units, unit_extension_data)

		for i = slot_index + 1, total_slots_count, 1 do
			local slot = target_slots[i]
			local slot_left = target_slots[i - 1]
			local position = slot_left.position_right:unbox()
			local is_on_navmesh = update_slot_position(target_unit, slot, position, unit_extension_data, should_offset_slot, nav_world, traverse_logic, above, below, target_outside_navmesh)

			update_slot_status(slot, is_on_navmesh, target_units, unit_extension_data)
		end

		for i = slot_index - 1, 1, -1 do
			local slot = target_slots[i]
			local slot_right = target_slots[i + 1]
			local position = slot_right.position_left:unbox()
			local is_on_navmesh = update_slot_position(target_unit, slot, position, unit_extension_data, should_offset_slot, nav_world, traverse_logic, above, below, target_outside_navmesh)

			update_slot_status(slot, is_on_navmesh, target_units, unit_extension_data)
		end

		update_anchor_weights(target_unit, unit_extension_data)
	end

	update_anchor_weights(target_unit, unit_extension_data)

	return 
end

local OWNER_STICKY_VALUE = -3
local RELEASED_OWNER_DISTANCE_MODIFIER = -2

local function get_best_slot(target_unit, target_units, ai_unit, unit_extension_data, nav_world, t, skip_slots_behind_target)
	local ai_unit_position = POSITION_LOOKUP[ai_unit]
	local ai_unit_extension = unit_extension_data[ai_unit]
	local target_unit_extension = unit_extension_data[target_unit]
	local slot_type = ai_unit_extension.use_slot_type or DEFAULT_SLOT_TYPE
	local slot_data = target_unit_extension.all_slots[slot_type]
	local target_slots = slot_data.slots
	local total_slots_count = slot_data.total_slots_count
	local best_slot = nil
	local best_score = math.huge
	local previous_slot = ai_unit_extension.slot

	for i = 1, total_slots_count, 1 do
		local slot = target_slots[i]
		local disabled = slot.disabled

		if disabled then
		elseif skip_slots_behind_target and slot_is_behind_target(slot, ai_unit, target_unit_extension) then
		else
			local slot_owner = slot.ai_unit
			local slot_released = slot.released
			local slot_position = slot.original_absolute_position:unbox()
			local slot_distance = Vector3.distance_squared(slot_position, ai_unit_position)
			local slot_score = math.huge

			if slot_owner then
				if slot_owner == ai_unit then
					slot_score = slot_distance + OWNER_STICKY_VALUE
				elseif slot_released then
					local owner_position = POSITION_LOOKUP[slot_owner]
					local owner_distance = Vector3.distance_squared(slot_position, owner_position) + RELEASED_OWNER_DISTANCE_MODIFIER

					if slot_distance < owner_distance then
						slot_score = slot_distance
					end
				end
			else
				slot_score = slot_distance
			end

			if slot_score < best_score then
				best_slot = slot
				best_score = slot_score
			end
		end
	end

	if best_slot then
		ai_unit_extension.temporary_wait_position = nil
		local current_slot = ai_unit_extension.slot

		if current_slot and current_slot == best_slot then
		else
			local waiting_on_slot = ai_unit_extension.waiting_on_slot

			if current_slot or waiting_on_slot then
				detach_ai_unit_from_slot(ai_unit, unit_extension_data)
			end

			local previous_slot_owner = best_slot.ai_unit

			if previous_slot_owner then
				local previous_slot_owner_extension = unit_extension_data[previous_slot_owner]
				previous_slot_owner_extension.slot = nil

				Managers.state.debug_text:clear_unit_text(previous_slot_owner, "slot_index")
			end

			best_slot.ai_unit = ai_unit
			ai_unit_extension.slot = best_slot

			update_anchor_weights(target_unit, unit_extension_data)
		end
	end

	if previous_slot ~= ai_unit_extension.slot then
		slot_data.slots_count = slots_count(target_unit, unit_extension_data, slot_type)
	elseif not best_slot and previous_slot and skip_slots_behind_target and slot_is_behind_target(previous_slot, ai_unit, target_unit_extension) then
		detach_ai_unit_from_slot(ai_unit, unit_extension_data)

		slot_data.slots_count = slots_count(target_unit, unit_extension_data, slot_type)
		local dialogue_input = ScriptUnit.extension_input(ai_unit, "dialogue_system")
		local event_data = FrameTable.alloc_table()

		dialogue_input.trigger_networked_dialogue_event(dialogue_input, "flanking", event_data)
	end

	return 
end

SLOT_QUEUE_PENALTY_MULTIPLIER = 3

local function get_best_slot_to_wait_on(target_unit, ai_unit, unit_extension_data, nav_world, skip_slots_behind_target)
	local ai_unit_extension = unit_extension_data[ai_unit]
	local waiting_on_slot = ai_unit_extension.waiting_on_slot
	local target_unit_extension = unit_extension_data[target_unit]

	if waiting_on_slot then
		if waiting_on_slot.disabled or (skip_slots_behind_target and slot_is_behind_target(waiting_on_slot, ai_unit, target_unit_extension)) then
			detach_ai_unit_from_slot(ai_unit, unit_extension_data)

			waiting_on_slot = nil
		else
			return 
		end
	end

	local ai_unit_position = POSITION_LOOKUP[ai_unit]
	local slot_type = ai_unit_extension.use_slot_type or DEFAULT_SLOT_TYPE
	local slot_data = target_unit_extension.all_slots[slot_type]
	local target_slots = slot_data.slots
	local target_slots_n = #target_slots
	local best_distance = math.huge
	local best_slot = nil

	for i = 1, target_slots_n, 1 do
		local slot = target_slots[i]
		local queue = slot.queue
		local queue_n = #queue

		if slot.disabled then
		elseif skip_slots_behind_target and slot_is_behind_target(slot, ai_unit, target_unit_extension) then
		else
			local slot_queue_position, additional_penalty = get_slot_queue_position(unit_extension_data, slot, nav_world)

			if not slot_queue_position then
			else
				local slot_queue_distance = Vector3.distance_squared(slot_queue_position, ai_unit_position) + queue_n * queue_n * SLOT_QUEUE_PENALTY_MULTIPLIER + additional_penalty

				if slot_queue_distance < best_distance then
					best_distance = slot_queue_distance
					best_slot = slot
				end
			end
		end
	end

	if best_slot then
		local queue = best_slot.queue
		local queue_n = #queue
		queue[queue_n + 1] = ai_unit
		ai_unit_extension.waiting_on_slot = best_slot
	end

	return 
end

local function update_disabled_slots_count(target_units, unit_extension_data)
	local target_units = target_units
	local target_units_n = #target_units

	for i = 1, target_units_n, 1 do
		local target_unit = target_units[i]
		local target_unit_extension = unit_extension_data[target_unit]
		local all_slots = target_unit_extension.all_slots

		for slot_type, slot_data in pairs(all_slots) do
			local target_slots = slot_data.slots
			local target_slots_n = #target_slots
			local disabled_count = 0

			for slot_i = 1, target_slots_n, 1 do
				local slot = target_slots[slot_i]

				if slot.disabled then
					disabled_count = disabled_count + 1
				end
			end

			slot_data.disabled_slots_count = disabled_count
		end
	end

	return 
end

local function update_slot_sound(is_server, network_transmit, target_units, unit_extension_data)
	local target_units = target_units
	local target_units_n = #target_units
	local target_unit_extensions = unit_extension_data
	local player_manager = Managers.player
	local audio_system = Managers.state.entity:system("audio_system")
	local parameter_id = NetworkLookup.global_parameter_names.occupied_slots_percentage

	for unit_i = 1, target_units_n, 1 do
		local target_unit = target_units[unit_i]
		local target_unit_extension = target_unit_extensions[target_unit]
		local all_slots = target_unit_extension.all_slots
		local player = player_manager.owner(player_manager, target_unit)
		local is_server_player = is_server and player and player.is_player_controlled(player)
		local largest_percentage_taken = 0

		for slot_type, slot_data in pairs(all_slots) do
			local slot_settings = SlotSettings[slot_type]
			local dialogue_surrounded_count = slot_settings.dialogue_surrounded_count
			local taken_slots = slot_data.slots_count

			if is_server_player then
				local disabled_slots_count = slot_data.disabled_slots_count
				local total_slots_count = slot_data.total_slots_count
				local enabled_slots_count = total_slots_count - disabled_slots_count
				local percentage_taken = (0 < enabled_slots_count and taken_slots / enabled_slots_count) or 0
				percentage_taken = math.clamp(percentage_taken, 0, 1)

				if largest_percentage_taken < percentage_taken then
					largest_percentage_taken = percentage_taken
				end
			end

			if dialogue_surrounded_count <= taken_slots and ScriptUnit.has_extension(target_unit, "dialogue_system") then
				local dialogue_input = ScriptUnit.extension_input(target_unit, "dialogue_system")
				local event_data = FrameTable.alloc_table()
				event_data.current_amount = taken_slots
				event_data.has_shield = DialogueSystem:PlayerShieldCheck(target_unit)

				dialogue_input.trigger_networked_dialogue_event(dialogue_input, "surrounded", event_data)
			end
		end

		if is_server_player then
			if player.local_player then
				audio_system.set_global_parameter_with_lerp(audio_system, "occupied_slots_percentage", largest_percentage_taken * 100)
			else
				local peer_id = player.network_id(player)

				network_transmit.send_rpc(network_transmit, "rpc_client_audio_set_global_parameter_with_lerp", peer_id, parameter_id, largest_percentage_taken)
			end
		end
	end

	return 
end

AISlotSystem.update = function (self, context, t, dt)
	if not script_data.navigation_thread_disabled then
		local nav_world = self.nav_world

		GwNavWorld.join_async_update(nav_world)

		NAVIGATION_RUNNING_IN_THREAD = false
	end

	return 
end
local debug_draw_slots, debug_print_slots_count = nil
local SLOT_STATUS_UPDATE_INTERVAL = 0.5
local TOTAL_SLOTS_COUNT_UPDATE_INTERVAL = 1
local DISABLED_SLOTS_COUNT_UPDATE_INTERVAL = 1
local SLOT_SOUND_UPDATE_INTERVAL = 1
local TARGET_STOPPED_MOVING_SPEED_SQ = 0.25
AISlotSystem.physics_async_update = function (self, context, t)
	local dt = context.dt
	self.t = t
	local target_units = self.target_units
	local target_units_n = #target_units

	if target_units_n == 0 then
		return 
	end

	local nav_world = self.nav_world
	local unit_extension_data = self.unit_extension_data

	for i_target = 1, target_units_n, 1 do
		local target_unit = target_units[i_target]
		local target_unit_extension = unit_extension_data[target_unit]
		local successful = self.update_target_slots(self, t, target_unit, target_units, unit_extension_data, target_unit_extension, nav_world, self._traverse_logic)

		if successful then
			break
		end
	end

	if self.next_total_slot_count_update < t then
		self.update_total_slots_count(self)

		self.next_total_slot_count_update = t + TOTAL_SLOTS_COUNT_UPDATE_INTERVAL
	end

	if self.next_disabled_slot_count_update < t then
		update_disabled_slots_count(target_units, unit_extension_data)

		self.next_disabled_slot_count_update = t + DISABLED_SLOTS_COUNT_UPDATE_INTERVAL
	end

	if self.next_slot_sound_update < t then
		update_slot_sound(self.is_server, self.network_transmit, target_units, unit_extension_data)

		self.next_slot_sound_update = t + SLOT_SOUND_UPDATE_INTERVAL
	end

	local update_slots_ai_units_prioritized = self.update_slots_ai_units_prioritized
	local update_slots_ai_units_prioritized_n = #update_slots_ai_units_prioritized

	for i = 1, update_slots_ai_units_prioritized_n, 1 do
		local ai_unit = update_slots_ai_units_prioritized[i]

		self.update_ai_unit_slot(self, ai_unit, target_units, unit_extension_data, nav_world, t)

		update_slots_ai_units_prioritized[i] = nil
	end

	local update_slots_ai_units = self.update_slots_ai_units
	local update_slots_ai_units_n = #update_slots_ai_units

	if update_slots_ai_units_n < self.current_ai_index then
		self.current_ai_index = 1
	end

	local start_index = self.current_ai_index
	local end_index = math.min((start_index + AI_UPDATES_PER_FRAME) - 1, update_slots_ai_units_n)
	self.current_ai_index = end_index + 1

	for i = start_index, end_index, 1 do
		local ai_unit = update_slots_ai_units[i]

		self.update_ai_unit_slot(self, ai_unit, target_units, unit_extension_data, nav_world, t)
	end

	if script_data.ai_debug_slots and self.is_server then
		debug_draw_slots(unit_extension_data, nav_world, t)
		debug_print_slots_count(target_units, unit_extension_data)
	end

	return 
end
AISlotSystem.update_ai_unit_slot = function (self, ai_unit, target_units, unit_extension_data, nav_world, t)
	local ai_unit_dead = not unit_alive(ai_unit)

	if ai_unit_dead then
		detach_ai_unit_from_slot(ai_unit, unit_extension_data)

		return 
	end

	local ai_unit_extension = unit_extension_data[ai_unit]
	local ai_system_extension = ScriptUnit.extension(ai_unit, "ai_system")
	local blackboard = ai_system_extension.blackboard(ai_system_extension)
	local target_unit = blackboard.target_unit or blackboard.SVP_target_unit

	update_target(target_unit, ai_unit, blackboard, unit_extension_data, t)

	if not target_unit then
		return 
	end

	local target_unit_extension = unit_extension_data[target_unit]

	if not target_unit_extension then
		return 
	end

	if not ai_unit_extension.do_search then
		return 
	end

	local skip_slots_behind_target = blackboard.using_override_target

	get_best_slot(target_unit, target_units, ai_unit, unit_extension_data, nav_world, t, skip_slots_behind_target)

	local slot = ai_unit_extension.slot

	if slot then
		check_to_release_slot(slot)

		local slot_behind_target = slot_is_behind_target(slot, ai_unit, target_unit_extension)

		if slot_behind_target then
			set_ghost_position(target_unit_extension, slot, nav_world, self._traverse_logic)
		else
			clear_ghost_position(slot)
		end
	else
		get_best_slot_to_wait_on(target_unit, ai_unit, unit_extension_data, nav_world, skip_slots_behind_target)
	end

	if not blackboard.disable_improve_slot_position then
		self.improve_slot_position(self, ai_unit, t)
	end

	return 
end
AISlotSystem.update_target_slots = function (self, t, target_unit, target_units, unit_extension_data, target_unit_extension, nav_world, traverse_logic)
	local dist_sq = 0
	local is_on_ladder, ladder_unit, bottom, top = nil
	local was_on_ladder = target_unit_extension.was_on_ladder
	local status_ext = ScriptUnit.has_extension(target_unit, "status_system")

	if status_ext then
		is_on_ladder, ladder_unit = status_ext.get_is_on_ladder(status_ext)

		if is_on_ladder then
			local failed_ladder = nil
			bottom, top, failed_ladder = Managers.state.bot_nav_transition:get_ladder_coordinates(ladder_unit)
			is_on_ladder = not failed_ladder
		end

		target_unit_extension.was_on_ladder = is_on_ladder
	end

	local real_target_unit_position = POSITION_LOOKUP[target_unit]
	local target_unit_position = (is_on_ladder and real_target_unit_position) or get_target_pos_on_navmesh(real_target_unit_position, nav_world)
	local target_unit_position_known = target_unit_extension.position:unbox()
	local outside_navmesh_at_t = target_unit_extension.outside_navmesh_at_t
	local outside_navmesh = false

	if target_unit_position then
		dist_sq = Vector3.distance_squared(target_unit_position, target_unit_position_known)
		target_unit_extension.outside_navmesh_at_t = nil
	elseif outside_navmesh_at_t == nil or t < outside_navmesh_at_t + TARGET_OUTSIDE_NAVMESH_TIMEOUT then
		if outside_navmesh_at_t == nil then
			target_unit_extension.outside_navmesh_at_t = t
		end

		target_unit_position = target_unit_position_known
	else
		outside_navmesh = true
		target_unit_position = POSITION_LOOKUP[target_unit]
		dist_sq = Vector3.distance_squared(target_unit_position, target_unit_position_known)
	end

	if TARGET_MOVED < dist_sq or is_on_ladder ~= was_on_ladder or (is_on_ladder and target_unit_extension.next_slot_status_update_at < t) then
		local should_offset_slot = true

		target_unit_extension.position:store(target_unit_position)
		update_target_slots_positions(target_unit, target_units, unit_extension_data, should_offset_slot, nav_world, traverse_logic, is_on_ladder, ladder_unit, bottom, top, outside_navmesh)

		target_unit_extension.moved_at = t
		target_unit_extension.next_slot_status_update_at = t + SLOT_STATUS_UPDATE_INTERVAL

		return true
	end

	local moved_at = target_unit_extension.moved_at
	local target_locomotion = ScriptUnit.has_extension(target_unit, "locomotion_system") and ScriptUnit.extension(target_unit, "locomotion_system")
	local target_speed_sq = (target_locomotion and Vector3.length_squared(target_locomotion.current_velocity(target_locomotion))) or 0

	if not is_on_ladder and moved_at and TARGET_SLOTS_UPDATE < t - moved_at and (target_speed_sq <= TARGET_STOPPED_MOVING_SPEED_SQ or TARGET_SLOTS_UPDATE_LONG < t - moved_at) then
		local should_offset_slot = false

		update_target_slots_positions(target_unit, target_units, unit_extension_data, should_offset_slot, nav_world, traverse_logic, is_on_ladder, ladder_unit, bottom, top, outside_navmesh)

		target_unit_extension.moved_at = nil
		target_unit_extension.next_slot_status_update_at = t + SLOT_STATUS_UPDATE_INTERVAL

		return true
	end

	if target_unit_extension.next_slot_status_update_at < t then
		update_target_slots_status(target_unit, target_units, unit_extension_data, nav_world, traverse_logic, outside_navmesh)

		target_unit_extension.next_slot_status_update_at = t + SLOT_STATUS_UPDATE_INTERVAL

		return true
	end

	return false
end
AISlotSystem.update_total_slots_count = function (self)
	local target_units = self.target_units
	local target_units_n = #target_units
	local target_unit_extensions = self.unit_extension_data
	local slots_n = 0
	local slots_occupied_n = 0

	for i = 1, target_units_n, 1 do
		local target_unit = target_units[i]
		local target_unit_extension = target_unit_extensions[target_unit]
		local all_slots = target_unit_extension.all_slots

		for slot_type, slot_data in pairs(all_slots) do
			local target_unit_slots = slot_data.slots_count
			slots_n = slots_n + target_unit_slots
			local target_slots = slot_data.slots
			local total_slots_count = slot_data.total_slots_count

			for i = 1, total_slots_count, 1 do
				local slot = target_slots[i]
				local occupied = not slot.released and slot.ai_unit

				if occupied then
					slots_occupied_n = slots_occupied_n + 1
				end
			end
		end
	end

	self.num_total_enemies = slots_n
	self.num_occupied_slots = slots_occupied_n

	return 
end
AISlotSystem.register_prioritized_ai_unit_update = function (self, unit)
	local update_slots_ai_units_prioritized = self.update_slots_ai_units_prioritized
	local update_slots_ai_units_prioritized_n = #update_slots_ai_units_prioritized
	update_slots_ai_units_prioritized[update_slots_ai_units_prioritized_n + 1] = unit

	return 
end
local AGGROABLE_SLOT_COLOR_INDEX = 5
local dummy_input = {}
AISlotSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local extension = {}

	ScriptUnit.set_extension(unit, "ai_slot_system", extension, dummy_input)

	self.unit_extension_data[unit] = extension

	if extension_name == "AIPlayerSlotExtension" or extension_name == "AIAggroableSlotExtension" then
		local debug_color_index = nil

		if extension_name == "AIPlayerSlotExtension" then
			debug_color_index = extension_init_data.profile_index
		elseif extension_name == "AIAggroableSlotExtension" then
			debug_color_index = AGGROABLE_SLOT_COLOR_INDEX
			local _, is_level_unit = Managers.state.network:game_object_or_level_id(unit)

			if is_level_unit then
				POSITION_LOOKUP[unit] = Unit.world_position(unit, 0)
			end
		end

		extension.all_slots = {}

		for slot_type, setting in pairs(SlotSettings) do
			local unit_data_var_name = (slot_type == "normal" and "ai_slots_count") or "ai_slots_count_" .. slot_type
			local total_slots_count = Unit.get_data(unit, unit_data_var_name) or setting.count
			local slot_data = {
				total_slots_count = total_slots_count,
				slot_radians = math.degrees_to_radians(360 / total_slots_count),
				slots_count = 0,
				use_wait_slots = setting.use_wait_slots,
				priority = setting.priority,
				disabled_slots_count = 0,
				slots = {}
			}
			extension.all_slots[slot_type] = slot_data
		end

		local target_index = #self.target_units + 1
		extension.dogpile = 0
		extension.position = Vector3Box(POSITION_LOOKUP[unit])
		extension.moved_at = 0
		extension.next_slot_status_update_at = 0
		extension.valid_target = true
		extension.index = target_index
		extension.debug_color_name = SLOT_COLORS[debug_color_index][1]

		create_target_slots(unit, extension, debug_color_index)

		self.target_units[target_index] = unit
		local target_units = self.target_units
		local nav_world = self.nav_world
		local traverse_logic = self._traverse_logic
		local unit_extension_data = self.unit_extension_data

		self.update_target_slots(self, 0, unit, target_units, unit_extension_data, extension, nav_world, traverse_logic)
	end

	if extension_name == "AIEnemySlotExtension" then
		extension.target = nil
		extension.target_position = Vector3Box()
		extension.improve_wait_slot_position_t = 0
		self.update_slots_ai_units[#self.update_slots_ai_units + 1] = unit
	end

	return extension
end
AISlotSystem.extensions_ready = function (self, world, unit, extension_name)
	if extension_name == "AIEnemySlotExtension" then
		local extension = self.unit_extension_data[unit]
		local ai_base_extension = ScriptUnit.extension(unit, "ai_system")
		local breed = ai_base_extension.breed(ai_base_extension)
		extension.breed = breed
		extension.use_slot_type = breed.use_slot_type
	end

	return 
end
AISlotSystem.on_remove_extension = function (self, unit, extension_name)
	self.on_freeze_extension(self, unit, extension_name)
	ScriptUnit.remove_extension(unit, self.NAME)

	return 
end
AISlotSystem.on_freeze_extension = function (self, unit, extension_name)
	local extension = self.unit_extension_data[unit]

	if extension == nil then
		return 
	end

	local world = self.world
	local update_slots_ai_units = self.update_slots_ai_units
	local update_slots_ai_units_n = #update_slots_ai_units
	local update_slots_ai_units_prioritized = self.update_slots_ai_units_prioritized
	local update_slots_ai_units_prioritized_n = #update_slots_ai_units_prioritized
	local slots = self.slots

	if extension_name == "AIEnemySlotExtension" then
		if extension.slot or extension.waiting_on_slot then
			detach_ai_unit_from_slot(unit, self.unit_extension_data)
		end

		for i = 1, update_slots_ai_units_prioritized_n, 1 do
			local ai_unit = update_slots_ai_units_prioritized[i]

			if ai_unit == unit then
				update_slots_ai_units_prioritized[i] = update_slots_ai_units_prioritized[update_slots_ai_units_prioritized_n]
				update_slots_ai_units_prioritized[update_slots_ai_units_prioritized_n] = nil

				break
			end
		end

		for i = 1, update_slots_ai_units_n, 1 do
			local ai_unit = update_slots_ai_units[i]

			if ai_unit == unit then
				update_slots_ai_units[i] = update_slots_ai_units[update_slots_ai_units_n]
				update_slots_ai_units[update_slots_ai_units_n] = nil

				break
			end
		end
	end

	if extension_name == "AIPlayerSlotExtension" or extension_name == "AIAggroableSlotExtension" then
		if extension.slots then
			local target_slots = extension.slots
			local target_slots_n = #target_slots

			for i = target_slots_n, 0, -1 do
				local slot = target_slots[i]

				delete_slot(slot, self.unit_extension_data)
			end
		end

		local target_units_n = #self.target_units

		for i = 1, target_units_n, 1 do
			if self.target_units[i] == unit then
				self.target_units[i] = self.target_units[target_units_n]
				self.target_units[target_units_n] = nil

				break
			end
		end

		for i = 1, update_slots_ai_units_n, 1 do
			local extension = self.unit_extension_data[update_slots_ai_units[i]]

			if extension.target == unit then
				extension.target = nil
			end
		end
	end

	self.unit_extension_data[unit] = nil

	return 
end

function debug_draw_slots(unit_extension_data, nav_world, t)
	local drawer = Managers.state.debug:drawer({
		mode = "immediate",
		name = "AISlotSystem_immediate"
	})
	local targets = global_ai_target_units
	local z = Vector3.up() * 0.1

	for i_target, target_unit in pairs(targets) do
		if not unit_alive(target_unit) then
		else
			local target_unit_extension = unit_extension_data[target_unit]

			if target_unit_extension then
				if not target_unit_extension.valid_target then
				else
					local all_slots = target_unit_extension.all_slots

					for slot_type, slot_data in pairs(all_slots) do
						local target_slots = slot_data.slots
						local target_slots_n = #target_slots
						local target_position = target_unit_extension.position:unbox()
						local target_color = Colors.get(target_unit_extension.debug_color_name)

						drawer.circle(drawer, target_position + z, 0.5, Vector3.up(), target_color)
						drawer.circle(drawer, target_position + z, 0.45, Vector3.up(), target_color)

						if target_unit_extension.next_slot_status_update_at then
							local percent = (t - target_unit_extension.next_slot_status_update_at) / SLOT_STATUS_UPDATE_INTERVAL

							drawer.circle(drawer, target_position + z, 0.45 * percent, Vector3.up(), target_color)
						end

						for i = 1, target_slots_n, 1 do
							local slot = target_slots[i]
							local anchor_slot = get_anchor_slot(slot_type, target_unit, unit_extension_data)
							local is_anchor_slot = slot == anchor_slot
							local ai_unit = slot.ai_unit
							local ai_unit_extension = nil
							local alpha = (ai_unit and 255) or 150
							local color = (slot.disabled and Colors.get_color_with_alpha("gray", alpha)) or Colors.get_color_with_alpha(slot.debug_color_name, alpha)

							if slot.absolute_position then
								local slot_absolute_position = slot.absolute_position:unbox()

								if unit_alive(ai_unit) then
									local ai_unit_position = POSITION_LOOKUP[ai_unit]
									local ai_unit_extension = unit_extension_data[ai_unit]

									drawer.circle(drawer, ai_unit_position + z, 0.35, Vector3.up(), color)
									drawer.circle(drawer, ai_unit_position + z, 0.3, Vector3.up(), color)

									local head_node = Unit.node(ai_unit, "c_head")
									local viewport_name = "player_1"
									local color_table = (slot.disabled and Colors.get_table("gray")) or Colors.get_table(slot.debug_color_name)
									local color_vector = Vector3(color_table[2], color_table[3], color_table[4])
									local offset_vector = Vector3(0, 0, -1)
									local text_size = 0.4
									local text = slot.index
									local category = "slot_index"

									Managers.state.debug_text:clear_unit_text(ai_unit, category)
									Managers.state.debug_text:output_unit_text(text, text_size, ai_unit, head_node, offset_vector, nil, category, color_vector, viewport_name)

									if slot.ghost_position.x ~= 0 and not slot.disable_at then
										local ghost_position = slot.ghost_position:unbox()

										drawer.line(drawer, ghost_position + z, slot_absolute_position + z, color)
										drawer.sphere(drawer, ghost_position + z, 0.3, color)
										drawer.line(drawer, ghost_position + z, ai_unit_position + z, color)
									else
										drawer.line(drawer, slot_absolute_position + z, ai_unit_position + z, color)
									end
								end

								local text_size = 0.4
								local color_table = (slot.disabled and Colors.get_table("gray")) or Colors.get_table(slot.debug_color_name)
								local color_vector = Vector3(color_table[2], color_table[3], color_table[4])
								local category = "slot_index_" .. slot_type .. "_" .. slot.index .. "_" .. i_target

								Managers.state.debug_text:clear_world_text(category)
								Managers.state.debug_text:output_world_text(slot.index, text_size, slot_absolute_position + z, nil, category, color_vector)

								local slot_radius = SlotSettings[slot_type].radius

								drawer.circle(drawer, slot_absolute_position + z, slot_radius, Vector3.up(), color)
								drawer.circle(drawer, slot_absolute_position + z, slot_radius - 0.05, Vector3.up(), color)

								local slot_queue_position = get_slot_queue_position(unit_extension_data, slot, nav_world)

								if slot_queue_position then
									drawer.circle(drawer, slot_queue_position + z, SLOT_QUEUE_RADIUS, Vector3.up(), color)
									drawer.circle(drawer, slot_queue_position + z, SLOT_QUEUE_RADIUS - 0.05, Vector3.up(), color)
									drawer.line(drawer, slot_absolute_position + z, slot_queue_position + z, color)

									local queue = slot.queue
									local queue_n = #queue

									for i = 1, queue_n, 1 do
										local ai_unit_waiting = queue[i]
										local ai_unit_position = POSITION_LOOKUP[ai_unit_waiting]

										drawer.circle(drawer, ai_unit_position + z, 0.35, Vector3.up(), color)
										drawer.circle(drawer, ai_unit_position + z, 0.3, Vector3.up(), color)
										drawer.line(drawer, slot_queue_position + z, ai_unit_position, color)
									end
								end

								if slot.released then
									local color = Colors.get("green")

									drawer.sphere(drawer, slot_absolute_position + z, 0.2, color)
								end

								if is_anchor_slot then
									local color = Colors.get("red")

									drawer.sphere(drawer, slot_absolute_position + z, 0.3, color)
								end

								local check_index = slot.position_check_index
								local check_position = slot_absolute_position

								if check_index == SLOT_POSITION_CHECK_INDEX.CHECK_MIDDLE then
								else
									local radians = SLOT_POSITION_CHECK_RADIANS[check_index]
									check_position = rotate_position_from_origin(check_position, target_position, radians, SLOT_RADIUS)
								end

								local ray_from_pos = target_position + Vector3.normalize(check_position - target_position) * RAYCANGO_OFFSET

								drawer.line(drawer, ray_from_pos + z, check_position + z, color)
								drawer.circle(drawer, check_position + z, 0.1, Vector3.up(), Color(255, 0, 255))
							end
						end
					end
				end
			end
		end
	end

	return 
end

function debug_print_slots_count(target_units, unit_extension_data)
	local target_slots = target_units
	local target_slots_n = #target_units
	local target_unit_extensions = unit_extension_data

	Debug.text("OCCUPIED SLOTS")

	for unit_i = 1, target_slots_n, 1 do
		local target_unit = target_units[unit_i]
		local target_unit_extension = target_unit_extensions[target_unit]
		local player_manager = Managers.player
		local owner_player = player_manager.owner(player_manager, target_unit)
		local display_name = nil

		if owner_player then
			display_name = owner_player.profile_display_name(owner_player)
		else
			display_name = tostring(target_unit)
		end

		local debug_text = display_name .. "-> "
		local all_slots = target_unit_extension.all_slots

		for slot_type, slot_data in pairs(all_slots) do
			local disabled_slots_count = slot_data.disabled_slots_count
			local occupied_slots = slot_data.slots_count
			local total_slots_count = slot_data.total_slots_count
			local enabled_slots_count = total_slots_count - disabled_slots_count
			debug_text = debug_text .. string.format("%s: [%d|%d(%d)]. ", slot_type, occupied_slots, enabled_slots_count, total_slots_count)
		end

		Debug.text(debug_text)
	end

	return 
end

AISlotSystem.set_allowed_layer = function (self, layer_name, allowed)
	local layer_id = LAYER_ID_MAPPING[layer_name]

	if allowed then
		GwNavTagLayerCostTable.allow_layer(self._navtag_layer_cost_table, layer_id)
	else
		GwNavTagLayerCostTable.forbid_layer(self._navtag_layer_cost_table, layer_id)
	end

	return 
end
SLOT_COLORS = {
	{
		"aqua_marine",
		"cadet_blue",
		"corn_flower_blue",
		"dodger_blue",
		"sky_blue",
		"midnight_blue",
		"medium_purple",
		"blue_violet",
		"dark_slate_blue"
	},
	{
		"dark_green",
		"green",
		"lime",
		"light_green",
		"dark_sea_green",
		"spring_green",
		"sea_green",
		"medium_aqua_marine",
		"light_sea_green"
	},
	{
		"maroon",
		"dark_red",
		"brown",
		"firebrick",
		"crimson",
		"red",
		"tomato",
		"coral",
		"indian_red",
		"light_coral"
	},
	{
		"orange",
		"gold",
		"dark_golden_rod",
		"golden_rod",
		"pale_golden_rod",
		"dark_khaki",
		"khaki",
		"olive",
		"yellow"
	},
	{
		"orange",
		"gold",
		"dark_golden_rod",
		"golden_rod",
		"pale_golden_rod",
		"dark_khaki",
		"khaki",
		"olive",
		"yellow"
	},
	{
		"orange",
		"gold",
		"dark_golden_rod",
		"golden_rod",
		"pale_golden_rod",
		"dark_khaki",
		"khaki",
		"olive",
		"yellow"
	}
}

return 

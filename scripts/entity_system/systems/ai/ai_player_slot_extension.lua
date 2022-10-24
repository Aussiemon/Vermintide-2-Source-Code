AIPlayerSlotExtension = class(AIPlayerSlotExtension)
local AISlotUtils = require("scripts/entity_system/systems/ai/ai_slot_utils")
local unit_alive = AiUtils.unit_alive
local Vector3_distance = Vector3.distance
local Vector3_distance_sq = Vector3.distance_squared
local Vector3_length = Vector3.length
local Vector3_length_squared = Vector3.length_squared
local Vector3_normalize = Vector3.normalize
local Vector3_dot = Vector3.dot
local Vector3_flat = Vector3.flat
local GwNavQueries_triangle_from_position = GwNavQueries.triangle_from_position
local GwNavQueries_raycango = GwNavQueries.raycango
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
local NAVMESH_DISTANCE_FROM_WALL = 0.5
local MOVER_RADIUS = 0.6
local RAYCANGO_OFFSET = NAVMESH_DISTANCE_FROM_WALL + MOVER_RADIUS
local SLOT_Z_MAX_DOWN = 7.5
local SLOT_Z_MAX_UP = 4
local TARGET_MOVED = 0.5
local TARGET_SLOTS_UPDATE = 0.25
local TARGET_SLOTS_UPDATE_LONG = 1
local Z_MAX_DIFFERENCE_ABOVE = 1.5
local Z_MAX_DIFFERENCE_BELOW = 1.5
local TARGET_OUTSIDE_NAVMESH_TIMEOUT = 2
local SLOT_STATUS_UPDATE_INTERVAL = 0.5
local TARGET_STOPPED_MOVING_SPEED_SQ = 0.25
local AGGROABLE_SLOT_COLOR_INDEX = 9
local DELAYED_SLOT_COUT_DEGRADE_SPEED = 5
local SLOT_QUEUE_RANDOM_POS_MAX_UP = 1.5
local SLOT_QUEUE_RANDOM_POS_MAX_DOWN = 2
local SLOT_QUEUE_RANDOM_POS_MAX_HORIZONTAL = 3
local SLOT_QUEUE_PENALTY_MULTIPLIER = 3
local SLOT_COLORS = {
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
local slot_types = {}
local SlotTypeSettings = SlotTypeSettings

for slot_type, _ in pairs(SlotTypeSettings) do
	slot_types[#slot_types + 1] = slot_type
end

local num_slot_types = #slot_types

AIPlayerSlotExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.unit = unit
	self.all_slots = {}

	for slot_type, setting in pairs(SlotTypeSettings) do
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
		self.all_slots[slot_type] = slot_data
	end

	local debug_color_index = extension_init_data.profile_index or AGGROABLE_SLOT_COLOR_INDEX
	self.dogpile = 0
	self.position = Vector3Box(POSITION_LOOKUP[unit])
	self.moved_at = 0
	self.next_slot_status_update_at = 0
	self.valid_target = true
	self.debug_color_name = SLOT_COLORS[debug_color_index][1]
	self.num_occupied_slots = 0
	self.delayed_num_occupied_slots = 0
	self.delayed_slot_decay_t = 0
	self.full_slots_at_t = {}

	self:_create_target_slots(unit, debug_color_index)

	self._is_server = extension_init_context.is_server
	self._network_transmit = extension_init_context.network_transmit
	self._audio_system = Managers.state.entity:system("audio_system")
	self._audio_parameter_id = NetworkLookup.global_parameter_names.occupied_slots_percentage
	local player = Managers.player:unit_owner(unit)

	self:_update_assigned_player(player, unit)

	self.belongs_to_player = true
end

AIPlayerSlotExtension._create_target_slots = function (self, self_unit, color_index)
	local all_slots = self.all_slots

	for slot_type, slot_data in pairs(all_slots) do
		local total_slots_count = slot_data.total_slots_count
		local slots = slot_data.slots

		for i = 1, total_slots_count, 1 do
			local slot = {
				target_unit = self_unit,
				owner_extension = self,
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
				position_check_index = SLOT_POSITION_CHECK_INDEX.CHECK_MIDDLE,
				debug_color_name = SlotTypeSettings[slot_type].debug_color
			}
			slots[i] = slot
		end
	end
end

AIPlayerSlotExtension._update_assigned_player = function (self, player, unit, unique_id)
	if self.unit ~= unit then
		return
	end

	if player then
		self._is_server_player = self._is_server and player:is_player_controlled()
		self._is_local_player = player.local_player
		self._peer_id = player:network_id()

		if self._waiting_for_player then
			Managers.state.event:unregister("new_player_unit", self)

			self._waiting_for_player = nil
		end
	elseif not self._waiting_for_player then
		Managers.state.event:register(self, "new_player_unit", "_update_assigned_player")

		self._waiting_for_player = true
	end
end

AIPlayerSlotExtension.extensions_ready = function (self, world, unit)
	self._status_ext = ScriptUnit.has_extension(unit, "status_system")
	self._locomotion_ext = ScriptUnit.has_extension(unit, "locomotion_system")
end

local function delete_slot(slot)
	local ai_unit = slot.ai_unit

	if ai_unit then
		local ai_unit_extension = slot.ai_unit_slot_extension

		if ai_unit_extension then
			ai_unit_extension.slot = nil
		end
	end

	local queue = slot.queue
	local queue_n = #queue

	for i = 1, queue_n, 1 do
		local ai_unit_waiting_extension = queue[i]

		if ai_unit_waiting_extension then
			ai_unit_waiting_extension:on_slot_lost()
		end
	end

	local target_unit_extension = slot.owner_extension

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
end

AIPlayerSlotExtension.cleanup_extension = function (self, unit, update_slots_ai_units, update_slots_ai_units_n, all_extensions)
	if self.slots then
		local target_slots = self.slots
		local target_slots_n = #target_slots

		for i = target_slots_n, 1, -1 do
			local slot = target_slots[i]

			delete_slot(slot)
		end
	end

	for i = 1, update_slots_ai_units_n, 1 do
		local unit_extension = all_extensions[update_slots_ai_units[i]]

		if unit_extension.target == unit then
			unit_extension.target = nil
		end
	end

	if self._waiting_for_player then
		Managers.state.event:unregister("new_player_unit", self)

		self._waiting_for_player = nil
	end
end

AIPlayerSlotExtension.update_total_slots_count = function (self, t)
	local all_slots = self.all_slots
	local num_slots = 0
	local num_occupied = 0

	for i = 1, num_slot_types, 1 do
		local slot_type = slot_types[i]
		local slot_data = all_slots[slot_type]
		local target_unit_slots = slot_data.slots_count
		num_slots = num_slots + target_unit_slots
		local target_slots = slot_data.slots
		local total_slots_count = slot_data.total_slots_count

		for k = 1, total_slots_count, 1 do
			local slot = target_slots[k]
			local occupied = not slot.released and slot.ai_unit

			if occupied then
				num_occupied = num_occupied + 1
			end
		end
	end

	if self.delayed_num_occupied_slots <= num_occupied then
		self.delayed_num_occupied_slots = num_occupied
		self.delayed_slot_decay_t = t + DELAYED_SLOT_COUT_DEGRADE_SPEED
	elseif self.delayed_slot_decay_t <= t then
		self.delayed_num_occupied_slots = num_occupied
	end

	self.num_occupied_slots = num_occupied

	return num_slots, num_occupied
end

AIPlayerSlotExtension.update_disabled_slots_count = function (self, t)
	local all_slots = self.all_slots

	for j = 1, num_slot_types, 1 do
		local slot_type = slot_types[j]
		local slot_data = all_slots[slot_type]
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

AIPlayerSlotExtension.update_slot_sound = function (self, t)
	local unit = self.unit
	local all_slots = self.all_slots
	local is_server_player = self._is_server_player
	local largest_percentage_taken = 0

	for i = 1, num_slot_types, 1 do
		local slot_type = slot_types[i]
		local slot_data = all_slots[slot_type]
		local slot_settings = SlotTypeSettings[slot_type]
		local dialogue_surrounded_count = slot_settings.dialogue_surrounded_count
		local taken_slots = slot_data.slots_count

		if is_server_player then
			local disabled_slots_count = slot_data.disabled_slots_count
			local total_slots_count = slot_data.total_slots_count
			local enabled_slots_count = total_slots_count - disabled_slots_count
			local percentage_taken = (enabled_slots_count > 0 and taken_slots / enabled_slots_count) or 0
			percentage_taken = math.clamp(percentage_taken, 0, 1)

			if largest_percentage_taken < percentage_taken then
				largest_percentage_taken = percentage_taken
			end
		end

		if dialogue_surrounded_count <= taken_slots and ScriptUnit.has_extension(unit, "dialogue_system") then
			local dialogue_input = ScriptUnit.extension_input(unit, "dialogue_system")
			local event_data = FrameTable.alloc_table()
			event_data.current_amount = taken_slots
			event_data.has_shield = DialogueSystem:player_shield_check(unit)

			dialogue_input:trigger_networked_dialogue_event("surrounded", event_data)
		end
	end

	if is_server_player then
		if self._is_local_player then
			self._audio_system:set_global_parameter_with_lerp("occupied_slots_percentage", largest_percentage_taken * 100)
		else
			self._network_transmit:send_rpc("rpc_client_audio_set_global_parameter_with_lerp", self._peer_id, self._audio_parameter_id, largest_percentage_taken)
		end
	end
end

local function get_anchor_slot(slot_data)
	local target_slots = slot_data.slots
	local total_slots_count = slot_data.total_slots_count
	local best_slot = target_slots[1]
	local best_anchor_weight = best_slot.anchor_weight

	for i = 1, total_slots_count, 1 do
		repeat
			local slot = target_slots[i]
			local slot_disabled = slot.disabled

			if slot_disabled then
				break
			end

			local slot_anchor_weight = slot.anchor_weight

			if best_anchor_weight < slot_anchor_weight or (slot_anchor_weight == best_anchor_weight and slot.index < best_slot.index) then
				best_slot = slot
				best_anchor_weight = slot_anchor_weight
			end
		until true
	end

	return best_slot
end

local Quaternion_rotate = Quaternion.rotate

local function rotate_position_from_origin(origin, position, radians, distance)
	local direction_vector = Vector3_normalize(Vector3_flat(position - origin))
	local rotation = Quaternion(-Vector3.up(), radians)
	local vector = Quaternion_rotate(rotation, direction_vector)
	local position_rotated = origin + vector * distance

	return position_rotated
end

local function set_slot_edge_positions(slot, unit_position)
	local slot_absolute_position = slot.original_absolute_position:unbox()
	local slot_type = slot.type
	local slot_distance = SlotTypeSettings[slot_type].distance
	local slot_radians = slot.radians
	local position_right = rotate_position_from_origin(unit_position, slot_absolute_position, slot_radians, slot_distance)
	local position_left = rotate_position_from_origin(unit_position, slot_absolute_position, -slot_radians, slot_distance)

	slot.position_right:store(position_right)
	slot.position_left:store(position_left)
end

local function enable_slot(slot)
	slot.disabled = false
end

local function disable_slot(slot)
	local ai_unit_extension = slot.ai_unit_slot_extension

	if ai_unit_extension then
		ai_unit_extension:on_slot_lost()
	end

	slot.ai_unit = nil
	slot.ai_unit_slot_extension = nil
	local queue = slot.queue

	for i = 1, #queue, 1 do
		local waiting_ai = queue[i]

		waiting_ai:on_slot_lost()
	end

	table.clear(slot.queue)

	slot.disabled = true
	slot.released = false
end

local function overlap_with_other_target_slot(slot, all_slot_proviers)
	local slot_owner_extension = slot.owner_extension
	local slot_position = slot.absolute_position:unbox()
	local target_units_n = #all_slot_proviers

	for i = 1, target_units_n, 1 do
		repeat
			local target_extension = all_slot_proviers[i]

			if target_extension == slot_owner_extension then
				break
			end

			local all_slots = target_extension.all_slots

			for j = 1, num_slot_types, 1 do
				local slot_type = slot_types[j]
				local slot_data = all_slots[slot_type]
				local radius = SlotTypeSettings[slot_type].radius
				local overlap_distance_sq = radius * radius
				local target_slots = slot_data.slots
				local total_slots_count = slot_data.total_slots_count

				for k = 1, total_slots_count, 1 do
					repeat
						local target_slot = target_slots[k]

						if target_slot.disabled then
							break
						end

						local target_slot_position = target_slot.absolute_position:unbox()
						local distance_squared = Vector3_distance_sq(slot_position, target_slot_position)

						if distance_squared < overlap_distance_sq then
							return target_slot
						end
					until true
				end
			end
		until true
	end

	return false
end

local OVERLAP_SLOT_TO_TARGET_DISTANCE = 1.2
local OVERLAP_SLOT_TO_TARGET_DISTANCE_SQ = OVERLAP_SLOT_TO_TARGET_DISTANCE * OVERLAP_SLOT_TO_TARGET_DISTANCE

local function overlap_with_other_target(slot, all_slot_proviers)
	local slot_owner_extension = slot.owner_extension
	local slot_position = slot.absolute_position:unbox()
	local target_units_n = #all_slot_proviers
	local Vector3_distance_squared = Vector3_distance_sq

	for i = 1, target_units_n, 1 do
		repeat
			local target_extension = all_slot_proviers[i]

			if target_extension == slot_owner_extension then
				break
			end

			local target_unit_position = target_extension.position:unbox()
			local distance_squared = Vector3_distance_squared(slot_position, target_unit_position)

			if distance_squared < OVERLAP_SLOT_TO_TARGET_DISTANCE_SQ then
				return true
			end
		until true
	end

	return false
end

local function disable_overlaping_slot(slot, overlap_slot)
	local slot_priority = slot.priority
	local overlap_slot_priority = overlap_slot.priority
	local target_unit_extension = slot.owner_extension
	local target_index = target_unit_extension.index
	local slot_index = slot.index
	local overlap_target_unit_extension = overlap_slot.owner_extension
	local overlap_target_index = overlap_target_unit_extension.index
	local overlap_slot_index = overlap_slot.index

	if slot_priority < overlap_slot_priority and not slot.ai_unit then
		return
	elseif overlap_slot_priority < slot_priority and not overlap_slot.ai_unit then
		return
	end

	if slot_priority < overlap_slot_priority then
		disable_slot(overlap_slot)

		return false
	elseif overlap_slot_priority < slot_priority then
		disable_slot(slot)

		return true
	end

	if overlap_slot_index < slot_index then
		disable_slot(slot)

		return true
	end

	if slot_index < overlap_slot_index then
		disable_slot(overlap_slot)

		return false
	end

	if overlap_target_index < target_index then
		disable_slot(slot)

		return true
	else
		disable_slot(overlap_slot)

		return false
	end
end

local function overlap_with_own_slots(slot)
	local slot_a_position = slot.absolute_position:unbox()
	local slot_a_type = slot.type
	local target_unit_extension = slot.owner_extension
	local all_slots = target_unit_extension.all_slots
	local Vector3_distance_squared = Vector3_distance_sq

	for i = 1, num_slot_types, 1 do
		repeat
			local slot_b_type = slot_types[i]
			local slot_data = all_slots[slot_b_type]

			if slot_a_type == slot_b_type then
				break
			end

			local slot_b_radius = SlotTypeSettings[slot_b_type].radius
			local overlap_distance_sq = slot_b_radius * slot_b_radius
			local slots = slot_data.slots
			local num_slots = slot_data.total_slots_count

			for j = 1, num_slots, 1 do
				repeat
					local slot_b = slots[j]

					if slot_b.disabled then
						break
					end

					local ai_unit_b = slot_b.ai_unit

					if not ai_unit_b then
						break
					end

					local slot_b_position = slot_b.absolute_position:unbox()
					local distance_squared = Vector3_distance_squared(slot_a_position, slot_b_position)

					if distance_squared < overlap_distance_sq then
						return slot_b
					end
				until true
			end
		until true
	end

	return false
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

	local ai_unit_extension = slot.ai_unit_slot_extension
	local release_slot_lock = ai_unit_extension.release_slot_lock

	if not release_slot_lock then
		local ai_unit_position = POSITION_LOOKUP[ai_unit]

		if ai_unit_position then
			local slot_position = slot.absolute_position:unbox()
			local distance_to_slot_position = Vector3_distance_sq(ai_unit_position, slot_position)
			local slot_released = RELEASE_SLOT_DISTANCE_SQ < distance_to_slot_position
			slot.released = slot_released
		else
			slot.released = true
		end
	else
		slot.released = false
	end
end

local function update_slot_status(slot, is_on_navmesh, all_slot_proviers)
	if is_on_navmesh then
		enable_slot(slot)
	else
		disable_slot(slot)

		return false
	end

	local overlaps_with_other_target = overlap_with_other_target(slot, all_slot_proviers)

	if not overlaps_with_other_target then
		enable_slot(slot)
	else
		disable_slot(slot)

		return false
	end

	local overlap_slot = overlap_with_other_target_slot(slot, all_slot_proviers)

	if overlap_slot then
		local disabled = disable_overlaping_slot(slot, overlap_slot)

		if not disabled then
			enable_slot(slot)
		else
			return false
		end
	end

	local overlap_own_slot = overlap_with_own_slots(slot)

	if overlap_own_slot then
		local disabled = disable_overlaping_slot(slot, overlap_own_slot)

		if not disabled then
			enable_slot(slot)
		else
			return false
		end
	end

	check_to_release_slot(slot)

	return true
end

local function update_slot_anchor_weight(slot, slot_data)
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

		if slot_disabled or not ai_unit then
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

		if slot_disabled or not ai_unit then
			break
		end

		if not slot_released then
			slot.anchor_weight = slot.anchor_weight + score
			score = score / 2
		end
	end
end

local function update_anchor_weights(all_slots)
	for i = 1, num_slot_types, 1 do
		local slot_type = slot_types[i]
		local slot_data = all_slots[slot_type]
		local target_slots = slot_data.slots
		local total_slots_count = slot_data.total_slots_count

		for j = 1, total_slots_count, 1 do
			local slot = target_slots[j]

			update_slot_anchor_weight(slot, slot_data)
		end
	end
end

local function get_slot_position_on_navmesh_from_outside_target(target_position, slot_direction, radians, distance, nav_world, above, below)
	local position_on_navmesh = nil
	local max_tries = 10
	local dist_per_try = 0.15

	if radians then
		local rotation = Quaternion(-Vector3.up(), radians)
		slot_direction = Quaternion_rotate(rotation, slot_direction)
	end

	for i = 0, max_tries - 1, 1 do
		local wanted_position = target_position + slot_direction * (i * dist_per_try + distance)
		position_on_navmesh = AISlotUtils.clamp_position_on_navmesh(wanted_position, nav_world, above, below)

		if position_on_navmesh then
			break
		end
	end

	return position_on_navmesh, position_on_navmesh
end

local function offset_slot(locomotion_ext, slot_absolute_position, target_unit_position)
	local target_velocity = nil

	if locomotion_ext then
		target_velocity = locomotion_ext:current_velocity()
	else
		target_velocity = Vector3(0, 0, 0)
	end

	if Vector3_length(target_velocity) > 0.1 then
		local speed = Vector3_length(target_velocity)
		local move_direction = Vector3_normalize(target_velocity)
		local wanted_slot_offset = move_direction * speed
		local slot_to_target_dir = Vector3_normalize(target_unit_position - slot_absolute_position)
		local dot = Vector3_dot(slot_to_target_dir, move_direction)
		local predict_time = math.max(2 * (dot - 0.5), 0)
		local current_slot_offset = wanted_slot_offset * predict_time
		local slot_offset_position = slot_absolute_position + current_slot_offset

		return slot_offset_position
	else
		return slot_absolute_position
	end
end

local function get_slot_position_on_navmesh(locomotion_ext, target_position, wanted_position, radians, distance, should_offset_slot, nav_world, above, below)
	local original_position = (radians and rotate_position_from_origin(target_position, wanted_position, radians, distance)) or wanted_position
	local offsetted_position = (should_offset_slot and offset_slot(locomotion_ext, original_position, target_position)) or original_position
	local position_on_navmesh = AISlotUtils.clamp_position_on_navmesh(offsetted_position, nav_world, above, below)

	return position_on_navmesh, original_position
end

local function get_reachable_slot_position_on_navmesh(slot, locomotion_ext, target_position, wanted_position, radians, distance, should_offset_slot, nav_world, traverse_logic, above, below)
	local position_on_navmesh, original_position = get_slot_position_on_navmesh(locomotion_ext, target_position, wanted_position, radians, distance, should_offset_slot, nav_world, above, below)
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

		local ray_target_pos = target_position + Vector3_normalize(check_position - target_position) * raycango_offset
		local ray_can_go = GwNavQueries_raycango(nav_world, check_position, ray_target_pos, traverse_logic)

		if not ray_can_go then
			position_on_navmesh = nil
		end
	elseif not is_using_middle_check then
		local check_position = rotate_position_from_origin(wanted_position, target_position, check_radians, SLOT_RADIUS)
		position_on_navmesh, original_position = get_slot_position_on_navmesh(locomotion_ext, target_position, check_position, radians, distance, should_offset_slot, nav_world, above, below)

		if position_on_navmesh then
			local ray_target_pos = target_position + Vector3_normalize(position_on_navmesh - target_position) * raycango_offset
			local ray_can_go = GwNavQueries_raycango(nav_world, position_on_navmesh, ray_target_pos, traverse_logic)

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

AIPlayerSlotExtension.update_target_slots = function (self, t, all_slot_proviers, nav_world, traverse_logic)
	local is_on_ladder, ladder_unit, bottom, top = nil
	local was_on_ladder = self.was_on_ladder
	local status_ext = self._status_ext

	if status_ext then
		is_on_ladder, ladder_unit = status_ext:get_is_on_ladder()

		if is_on_ladder then
			local failed_ladder = nil
			bottom, top, failed_ladder = Managers.state.bot_nav_transition:get_ladder_coordinates(ladder_unit)
			is_on_ladder = not failed_ladder
		end

		self.was_on_ladder = is_on_ladder
	end

	local self_unit = self.unit
	local real_target_unit_position = POSITION_LOOKUP[self_unit]
	local target_unit_position = (is_on_ladder and real_target_unit_position) or AISlotUtils.get_target_pos_on_navmesh(real_target_unit_position, nav_world)
	local target_unit_position_known = self.position:unbox()
	local outside_navmesh_at_t = self.outside_navmesh_at_t
	local outside_navmesh = false
	local dist_sq = 0

	if target_unit_position then
		dist_sq = Vector3_distance_sq(target_unit_position, target_unit_position_known)
		self.outside_navmesh_at_t = nil
	elseif outside_navmesh_at_t == nil or t < outside_navmesh_at_t + TARGET_OUTSIDE_NAVMESH_TIMEOUT then
		if outside_navmesh_at_t == nil then
			self.outside_navmesh_at_t = t
		end

		target_unit_position = target_unit_position_known
	else
		outside_navmesh = true
		target_unit_position = real_target_unit_position
		dist_sq = Vector3_distance_sq(target_unit_position, target_unit_position_known)
	end

	if TARGET_MOVED < dist_sq or is_on_ladder ~= was_on_ladder or (is_on_ladder and self.next_slot_status_update_at < t) then
		local should_offset_slot = true

		self.position:store(target_unit_position)
		self:_update_target_slots_positions(all_slot_proviers, should_offset_slot, nav_world, traverse_logic, is_on_ladder, ladder_unit, bottom, top, outside_navmesh)

		self.moved_at = t
		self.next_slot_status_update_at = t + SLOT_STATUS_UPDATE_INTERVAL

		return true
	end

	local moved_at = self.moved_at
	local target_locomotion = self._locomotion_ext
	local target_speed_sq = (target_locomotion and Vector3_length_squared(target_locomotion:current_velocity())) or 0

	if not is_on_ladder and moved_at and TARGET_SLOTS_UPDATE < t - moved_at and (target_speed_sq <= TARGET_STOPPED_MOVING_SPEED_SQ or TARGET_SLOTS_UPDATE_LONG < t - moved_at) then
		local should_offset_slot = false

		self:_update_target_slots_positions(all_slot_proviers, should_offset_slot, nav_world, traverse_logic, is_on_ladder, ladder_unit, bottom, top, outside_navmesh)

		self.moved_at = nil
		self.next_slot_status_update_at = t + SLOT_STATUS_UPDATE_INTERVAL

		return true
	end

	if self.next_slot_status_update_at < t then
		self:_update_target_slots_status(all_slot_proviers, nav_world, traverse_logic, outside_navmesh, t)

		self.next_slot_status_update_at = t + SLOT_STATUS_UPDATE_INTERVAL

		return true
	end

	return false
end

AIPlayerSlotExtension._set_slot_absolute_position = function (self, slot, position)
	local unit_position = self.position:unbox()
	local direction_vector = Vector3_normalize(Vector3_flat(position - unit_position))

	slot.absolute_position:store(position)
	slot.queue_direction:store(direction_vector)
	set_slot_edge_positions(slot, unit_position)
end

AIPlayerSlotExtension._update_target_slots_status = function (self, all_slot_provier_units, nav_world, traverse_logic, outside_navmesh, t)
	Profiler.start("update_target_slots_status")

	local all_slots = self.all_slots

	for i = 1, num_slot_types, 1 do
		local slot_type = slot_types[i]
		local slot_data = all_slots[slot_type]
		local target_slots = slot_data.slots
		local total_slots_count = slot_data.total_slots_count
		local should_offset_slot = false

		for k = 1, total_slots_count, 1 do
			local slot = target_slots[k]
			local slot_position = slot.absolute_position:unbox()
			local is_on_navmesh = self:_update_slot_position(slot, slot_position, should_offset_slot, nav_world, traverse_logic, nil, nil, outside_navmesh)

			update_slot_status(slot, is_on_navmesh, all_slot_provier_units)
		end

		update_anchor_weights(all_slots)

		local disabled_slots_count = slot_data.disabled_slots_count
		local occupied_slots = self.num_occupied_slots
		local enabled_slots_count = total_slots_count - disabled_slots_count
		local has_all_slots_occupied = occupied_slots >= enabled_slots_count

		if has_all_slots_occupied and not self.full_slots_at_t[slot_type] then
			self.full_slots_at_t[slot_type] = t
		elseif not has_all_slots_occupied then
			self.full_slots_at_t[slot_type] = nil
		end
	end

	Profiler.stop("update_target_slots_status")
end

AIPlayerSlotExtension._update_target_slots_positions = function (self, all_slot_proviers, should_offset_slot, nav_world, traverse_logic, is_on_ladder, ladder_unit, bottom, top, target_outside_navmesh)
	Profiler.start("update_target_slots_positions")

	if is_on_ladder then
		self:_update_target_slots_positions_on_ladder(all_slot_proviers, should_offset_slot, nav_world, traverse_logic, ladder_unit, bottom, top)
		Profiler.stop("update_target_slots_positions")

		return
	end

	local above, below = nil

	if target_outside_navmesh then
		below = SLOT_Z_MAX_DOWN
		above = SLOT_Z_MAX_UP
	else
		below = Z_MAX_DIFFERENCE_BELOW
		above = Z_MAX_DIFFERENCE_ABOVE
	end

	local all_slots = self.all_slots

	for k = 1, num_slot_types, 1 do
		local slot_type = slot_types[k]
		local slot_data = all_slots[slot_type]
		local target_slots = slot_data.slots
		local anchor_slot = get_anchor_slot(slot_data)
		local total_slots_count = slot_data.total_slots_count
		local slot_index = anchor_slot.index
		local is_on_navmesh = self:_update_anchor_slot_position(anchor_slot, should_offset_slot, nav_world, traverse_logic, above, below, target_outside_navmesh)

		update_slot_status(anchor_slot, is_on_navmesh, all_slot_proviers)

		for i = slot_index + 1, total_slots_count, 1 do
			local slot = target_slots[i]
			local slot_left = target_slots[i - 1]
			local position = slot_left.position_right:unbox()
			is_on_navmesh = self:_update_slot_position(slot, position, should_offset_slot, nav_world, traverse_logic, above, below, target_outside_navmesh)

			update_slot_status(slot, is_on_navmesh, all_slot_proviers)
		end

		for i = slot_index - 1, 1, -1 do
			local slot = target_slots[i]
			local slot_right = target_slots[i + 1]
			local position = slot_right.position_left:unbox()
			is_on_navmesh = self:_update_slot_position(slot, position, should_offset_slot, nav_world, traverse_logic, above, below, target_outside_navmesh)

			update_slot_status(slot, is_on_navmesh, all_slot_proviers)
		end

		update_anchor_weights(all_slots)
	end

	update_anchor_weights(all_slots)
	Profiler.stop("update_target_slots_positions")
end

AIPlayerSlotExtension._update_slot_position = function (self, slot, slot_position, should_offset_slot, nav_world, traverse_logic, above, below, target_outside_navmesh)
	local locomotion_ext = self._locomotion_ext
	local target_position = self.position:unbox()
	local position_on_navmesh, original_position = nil
	local slot_type = slot.type
	local slot_distance = SlotTypeSettings[slot_type].distance

	if target_outside_navmesh then
		position_on_navmesh, original_position = get_slot_position_on_navmesh_from_outside_target(target_position, Vector3_normalize(slot_position - target_position), nil, slot_distance, nav_world, above, below)
	else
		position_on_navmesh, original_position = get_reachable_slot_position_on_navmesh(slot, locomotion_ext, target_position, slot_position, nil, nil, should_offset_slot, nav_world, traverse_logic, above, below)
	end

	if position_on_navmesh then
		slot.original_absolute_position:store(original_position)
		self:_set_slot_absolute_position(slot, position_on_navmesh)

		return true, position_on_navmesh
	else
		slot.original_absolute_position:store(slot_position)
		self:_set_slot_absolute_position(slot, slot_position)

		return false, slot_position
	end
end

local MAX_GET_SLOT_POSITION_TRIES = 24

AIPlayerSlotExtension._update_anchor_slot_position = function (self, slot, should_offset_slot, nav_world, traverse_logic, above, below, target_outside_navmesh)
	local locomotion_ext = self._locomotion_ext
	local target_position = self.position:unbox()
	local ai_unit = slot.ai_unit
	local ai_position = ai_unit and POSITION_LOOKUP[ai_unit]
	local direction_vector = (ai_unit and Vector3_normalize(ai_position - target_position)) or Vector3.forward()
	local slot_type = slot.type
	local slot_distance = SlotTypeSettings[slot_type].distance
	local wanted_position = target_position + direction_vector * slot_distance
	local position_on_navmesh, original_position = nil

	if target_outside_navmesh then
		position_on_navmesh, original_position = get_slot_position_on_navmesh_from_outside_target(target_position, direction_vector, nil, slot_distance, nav_world, above, below)
	else
		position_on_navmesh, original_position = get_reachable_slot_position_on_navmesh(slot, locomotion_ext, target_position, wanted_position, nil, nil, should_offset_slot, nav_world, traverse_logic, above, below)
	end

	local i = 0

	while i <= MAX_GET_SLOT_POSITION_TRIES and not position_on_navmesh do
		local sign = (i % 2 > 0 and -1) or 1
		local radians = math.ceil(i / 2) * sign

		if target_outside_navmesh then
			position_on_navmesh, original_position = get_slot_position_on_navmesh_from_outside_target(target_position, direction_vector, radians, slot_distance, nav_world, above, below)
		else
			position_on_navmesh, original_position = get_reachable_slot_position_on_navmesh(slot, locomotion_ext, target_position, wanted_position, radians, slot_distance, should_offset_slot, nav_world, traverse_logic, above, below)
		end

		i = i + 1
	end

	if position_on_navmesh then
		slot.original_absolute_position:store(original_position)
		self:_set_slot_absolute_position(slot, position_on_navmesh)

		return true, position_on_navmesh
	else
		slot.original_absolute_position:store(wanted_position)
		self:_set_slot_absolute_position(slot, wanted_position)

		return false, wanted_position
	end
end

AIPlayerSlotExtension._update_target_slots_positions_on_ladder = function (self, all_slot_proviers, should_offset_slot, nav_world, traverse_logic, ladder_unit, bottom, top)
	local all_slots = self.all_slots

	for _, slot_data in pairs(all_slots) do
		local target_slots = slot_data.slots
		local total_slots_count = slot_data.total_slots_count
		local slot_offset_dist = 1
		local ladder_dir = Vector3_normalize(Vector3_flat(Quaternion.forward(Unit.world_rotation(ladder_unit, 0))))
		local ladder_right = Vector3.cross(ladder_dir, Vector3.up())
		local top_half = math.floor(total_slots_count / 2)
		local top_anchor_index = math.ceil(top_half / 2)
		local top_anchor_slot = target_slots[top_anchor_index]

		top_anchor_slot.original_absolute_position:store(top)
		self:_set_slot_absolute_position(top_anchor_slot, top)
		update_slot_status(top_anchor_slot, true, all_slot_proviers)

		local last_pos = top
		local success = true

		for i = top_anchor_index - 1, 1, -1 do
			local slot = target_slots[i]
			local new_wanted_pos = last_pos - ladder_right * slot_offset_dist
			success = success and GwNavQueries_raycango(nav_world, last_pos, new_wanted_pos, traverse_logic)

			slot.original_absolute_position:store(new_wanted_pos)
			self:_set_slot_absolute_position(slot, new_wanted_pos)
			update_slot_status(slot, success, all_slot_proviers)

			last_pos = new_wanted_pos
		end

		last_pos = top
		success = true

		for i = top_anchor_index + 1, top_half, 1 do
			local slot = target_slots[i]
			local new_wanted_pos = last_pos + ladder_right * slot_offset_dist
			success = success and GwNavQueries_raycango(nav_world, last_pos, new_wanted_pos, traverse_logic)

			slot.original_absolute_position:store(new_wanted_pos)
			self:_set_slot_absolute_position(slot, new_wanted_pos)
			update_slot_status(slot, success, all_slot_proviers)
		end

		local bottom_anchor_index = top_half + math.ceil((total_slots_count - top_half) / 2)
		local bottom_anchor_slot = target_slots[bottom_anchor_index]

		bottom_anchor_slot.original_absolute_position:store(bottom)
		self:_set_slot_absolute_position(bottom_anchor_slot, bottom)
		update_slot_status(bottom_anchor_slot, true, all_slot_proviers)

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
			success, z = GwNavQueries_triangle_from_position(nav_world, last_pos, above, below)

			if success then
				new_wanted_pos.z = z
			end

			slot.original_absolute_position:store(new_wanted_pos)
			self:_set_slot_absolute_position(slot, new_wanted_pos)
			update_slot_status(slot, success, all_slot_proviers)

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
			success, z = GwNavQueries_triangle_from_position(nav_world, last_pos, above, below)

			if success then
				new_wanted_pos.z = z
			end

			slot.original_absolute_position:store(new_wanted_pos)
			self:_set_slot_absolute_position(slot, new_wanted_pos)
			update_slot_status(slot, success, all_slot_proviers)

			increment = increment + 1
		end

		update_anchor_weights(all_slots)
	end
end

local MIN_WAIT_QUEUE_DISTANCE = 3
local MAX_QUEUE_Z_DIFF_ABOVE = 2
local MAX_QUEUE_Z_DIFF_BELOW = 3
local SLOT_QUEUE_RADIUS = 1.75
local PENALTY_TERM = 100

local function get_slot_queue_position(slot, nav_world, distance_modifier, t)
	local target_unit = slot.target_unit
	local ai_unit = slot.ai_unit

	if not unit_alive(target_unit) or not ALIVE[ai_unit] then
		return
	end

	local ai_unit_extension = slot.ai_unit_slot_extension
	local slot_template = ai_unit_extension.slot_template
	local slot_type = slot.type
	local slot_distance = SlotTypeSettings[slot_type].distance
	local target_unit_extension = slot.owner_extension
	local all_slots_occupied_at_t = target_unit_extension.full_slots_at_t[slot_type]
	local min_wait_queue_distance = slot_template.min_wait_queue_distance or MIN_WAIT_QUEUE_DISTANCE
	local min_wait_queue_distance_sq = min_wait_queue_distance * min_wait_queue_distance
	local offset_distance = 0

	if all_slots_occupied_at_t and slot_template.min_queue_offset_distance then
		local min_queue_offset_distance = slot_template.min_queue_offset_distance
		local full_offset_at_t = slot_template.full_offset_time
		local t_diff = t - all_slots_occupied_at_t
		local queue_offset_scale = math.min(t_diff / full_offset_at_t, 1)
		offset_distance = min_queue_offset_distance * queue_offset_scale
	end

	local target_unit_position = target_unit_extension.position:unbox()
	local ai_unit_position = POSITION_LOOKUP[ai_unit]
	local slot_queue_direction = slot.queue_direction:unbox()
	local slot_queue_distance_modifier = distance_modifier or 0
	local target_to_ai_distance = Vector3_distance(target_unit_position, ai_unit_position)
	local queue_distance = SlotTypeSettings[slot_type].queue_distance
	local slot_queue_distance = math.max((target_to_ai_distance + queue_distance + slot_queue_distance_modifier) - offset_distance, min_wait_queue_distance)
	local slot_queue_position = target_unit_position + slot_queue_direction * slot_queue_distance
	local slot_queue_position_on_navmesh = AISlotUtils.clamp_position_on_navmesh(slot_queue_position, nav_world, MAX_QUEUE_Z_DIFF_ABOVE, MAX_QUEUE_Z_DIFF_BELOW)
	local max_tries = 5
	local i = 1

	while not slot_queue_position_on_navmesh and i <= max_tries do
		slot_queue_distance = math.max((math.max(target_to_ai_distance * (1 - i / max_tries), slot_distance) + queue_distance + slot_queue_distance_modifier) - offset_distance, min_wait_queue_distance)
		slot_queue_position = target_unit_position + slot_queue_direction * math.max(slot_queue_distance, 0.5)
		slot_queue_position_on_navmesh = AISlotUtils.clamp_position_on_navmesh(slot_queue_position, nav_world, MAX_QUEUE_Z_DIFF_ABOVE, MAX_QUEUE_Z_DIFF_BELOW)
		i = i + 1
	end

	local penalty_term = 0
	local can_go = nil

	if slot_queue_position_on_navmesh then
		local target_position_on_navmesh = AISlotUtils.clamp_position_on_navmesh(target_unit_position, nav_world, MAX_QUEUE_Z_DIFF_ABOVE, MAX_QUEUE_Z_DIFF_BELOW)

		if target_position_on_navmesh then
			can_go = GwNavQueries_raycango(nav_world, slot_queue_position_on_navmesh, target_position_on_navmesh)
		end
	end

	if not slot_queue_position_on_navmesh or not can_go then
		penalty_term = PENALTY_TERM
		slot_queue_position = target_unit_position + slot_queue_direction * queue_distance

		if slot_template.restricted_queue_distance then
			local slot_queue_distance_from_target_sq = Vector3_distance_sq(target_unit_position, slot_queue_position)

			if min_wait_queue_distance_sq <= slot_queue_distance_from_target_sq then
				return slot_queue_position, penalty_term
			else
				local fallback_queue_position_on_navmesh = nil
				local target_unit_to_ai_direction = Vector3_normalize(ai_unit_position - target_unit_position)
				i = 1

				while not fallback_queue_position_on_navmesh and i <= max_tries do
					slot_queue_distance = math.max((math.max(target_to_ai_distance * (1 - i / max_tries), slot_distance) + queue_distance + slot_queue_distance_modifier) - offset_distance, min_wait_queue_distance)
					slot_queue_position = target_unit_position + target_unit_to_ai_direction * math.max(slot_queue_distance, 0.5)
					fallback_queue_position_on_navmesh = AISlotUtils.clamp_position_on_navmesh(slot_queue_position, nav_world, MAX_QUEUE_Z_DIFF_ABOVE, MAX_QUEUE_Z_DIFF_BELOW)
					i = i + 1
				end

				if fallback_queue_position_on_navmesh then
					return fallback_queue_position_on_navmesh, 0
				else
					return slot_queue_position, penalty_term
				end
			end
		else
			return slot_queue_position, penalty_term
		end
	else
		return slot_queue_position_on_navmesh, penalty_term
	end
end

AIPlayerSlotExtension.debug_draw = function (self, drawer, t, nav_world, i_target)
	local z = Vector3.up() * 0.1
	local all_slots = self.all_slots

	for slot_type, slot_data in pairs(all_slots) do
		local target_slots = slot_data.slots
		local target_slots_n = #target_slots
		local target_position = self.position:unbox()
		local target_color = Colors.get(self.debug_color_name)

		drawer:circle(target_position + z, 0.5, Vector3.up(), target_color)
		drawer:circle(target_position + z, 0.45, Vector3.up(), target_color)

		if self.next_slot_status_update_at then
			local percent = (t - self.next_slot_status_update_at) / SLOT_STATUS_UPDATE_INTERVAL

			drawer:circle(target_position + z, 0.45 * percent, Vector3.up(), target_color)
		end

		for i = 1, target_slots_n, 1 do
			repeat
				local slot = target_slots[i]
				local anchor_slot = get_anchor_slot(slot_data)
				local is_anchor_slot = slot == anchor_slot
				local ai_unit = slot.ai_unit
				local alpha = (ai_unit and 255) or 150
				local color = (slot.disabled and Colors.get_color_with_alpha("gray", alpha)) or Colors.get_color_with_alpha(slot.debug_color_name, alpha)

				if slot.absolute_position then
					local slot_absolute_position = slot.absolute_position:unbox()
					local slot_position = slot.original_absolute_position:unbox()

					if ALIVE[ai_unit] then
						local ai_unit_position = POSITION_LOOKUP[ai_unit]

						drawer:circle(ai_unit_position + z, 0.35, Vector3.up(), color)
						drawer:circle(ai_unit_position + z, 0.3, Vector3.up(), color)

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

							drawer:line(ghost_position + z, slot_absolute_position + z, color)
							drawer:sphere(ghost_position + z, 0.3, color)
							drawer:line(ghost_position + z, ai_unit_position + z, color)
						else
							drawer:line(slot_absolute_position + z, ai_unit_position + z, color)
						end
					end

					local text_size = 0.4
					local color_table = (slot.disabled and Colors.get_table("gray")) or Colors.get_table(slot.debug_color_name)
					local color_vector = Vector3(color_table[2], color_table[3], color_table[4])
					local category = "slot_index_" .. slot_type .. "_" .. slot.index .. "_" .. self.index

					Managers.state.debug_text:clear_world_text(category)
					Managers.state.debug_text:output_world_text(slot.index, text_size, slot_absolute_position + z, nil, category, color_vector)

					local slot_radius = SlotTypeSettings[slot_type].radius

					drawer:circle(slot_absolute_position + z, slot_radius, Vector3.up(), color)
					drawer:circle(slot_absolute_position + z, slot_radius - 0.05, Vector3.up(), color)

					local slot_queue_position = get_slot_queue_position(slot, nav_world, nil, t)

					if slot_queue_position then
						drawer:circle(slot_queue_position + z, SLOT_QUEUE_RADIUS, Vector3.up(), color)
						drawer:circle(slot_queue_position + z, SLOT_QUEUE_RADIUS - 0.05, Vector3.up(), color)
						drawer:line(slot_absolute_position + z, slot_queue_position + z, color)

						local queue = slot.queue
						local queue_n = #queue

						for k = 1, queue_n, 1 do
							local ai_unit_waiting = queue[k].unit
							local ai_unit_position = POSITION_LOOKUP[ai_unit_waiting]

							if ai_unit_position then
								drawer:circle(ai_unit_position + z, 0.35, Vector3.up(), color)
								drawer:circle(ai_unit_position + z, 0.3, Vector3.up(), color)
								drawer:line(slot_queue_position + z, ai_unit_position, color)
							end
						end
					end

					local text_size = 0.2
					local color_table = (slot.disabled and Colors.get_table("gray")) or Colors.get_table(slot.debug_color_name)
					local color_vector = Vector3(color_table[2], color_table[3], color_table[4])
					local category = "wait_slot_index_" .. slot_type .. "_" .. slot.index .. "_" .. i

					Managers.state.debug_text:clear_world_text(category)

					if slot_queue_position then
						Managers.state.debug_text:output_world_text("wait " .. slot.index, text_size, slot_queue_position + z, nil, category, color_vector)
					end

					local check_index = slot.position_check_index
					local check_position = slot_absolute_position

					if check_index == SLOT_POSITION_CHECK_INDEX.CHECK_MIDDLE then
					else
						local radians = SLOT_POSITION_CHECK_RADIANS[check_index]
						check_position = rotate_position_from_origin(check_position, target_position, radians, SLOT_RADIUS)
					end

					local ray_from_pos = target_position + Vector3_normalize(check_position - target_position) * RAYCANGO_OFFSET

					drawer:line(ray_from_pos + z, check_position + z, color)
					drawer:circle(check_position + z, 0.1, Vector3.up(), Color(255, 0, 255))
				else
					local category = "wait_slot_index_" .. slot_type .. "_" .. slot.index .. "_" .. i

					Managers.state.debug_text:clear_world_text(category)
				end
			until true
		end
	end
end

local function calculate_slots_count(slot_data)
	local slots_n = 0
	local target_slots = slot_data.slots
	local total_slots_count = slot_data.total_slots_count

	for i = 1, total_slots_count, 1 do
		local slot = target_slots[i]

		if slot.ai_unit then
			slots_n = slots_n + 1
		end

		slots_n = slots_n + #slot.queue
	end

	slot_data.slots_count = slots_n

	return slots_n
end

local function slot_is_behind_target(slot, ai_unit_position, target_unit_position)
	local slot_position = slot.original_absolute_position:unbox()
	local flat_target_unit_to_slot_vector = Vector3_flat(slot_position - target_unit_position)
	local normalized_target_unit_to_slot_vector = Vector3_normalize(flat_target_unit_to_slot_vector)
	local flat_target_unit_to_ai_unit_vector = Vector3_flat(ai_unit_position - target_unit_position)
	local normalized_target_unit_to_ai_unit_vector = Vector3_normalize(flat_target_unit_to_ai_unit_vector)
	local dot_value = Vector3_dot(normalized_target_unit_to_slot_vector, normalized_target_unit_to_ai_unit_vector)

	return dot_value < 0.6, dot_value
end

local OWNER_STICKY_VALUE = -3
local RELEASED_OWNER_DISTANCE_MODIFIER = -2

local function is_slot_overwhelmed(slot_data)
	local disabled_slots_count = slot_data.disabled_slots_count
	local occupied_slots = slot_data.slots_count
	local total_slots_count = slot_data.total_slots_count
	local enabled_slots_count = total_slots_count - disabled_slots_count

	return disabled_slots_count >= 2 and enabled_slots_count <= occupied_slots
end

local function clear_ghost_position(slot)
	slot.ghost_position:store(Vector3(0, 0, 0))
end

local GHOST_ANGLE = 90
local GHOST_RADIANS = math.degrees_to_radians(GHOST_ANGLE)

local function set_ghost_position(ai_unit_position, target_unit_position, slot, nav_world, traverse_logic)
	local slot_position = slot.absolute_position:unbox()
	local distance = math.min(Vector3_distance(target_unit_position, ai_unit_position), 8)
	local ghost_position_left = rotate_position_from_origin(slot_position, ai_unit_position, -GHOST_RADIANS, distance)
	local ghost_position_right = rotate_position_from_origin(slot_position, ai_unit_position, GHOST_RADIANS, distance)
	local distance_ghost_position_left = Vector3_distance_sq(target_unit_position, ghost_position_left)
	local distance_ghost_position_right = Vector3_distance_sq(target_unit_position, ghost_position_right)
	local use_ghost_position_left = distance_ghost_position_right < distance_ghost_position_left
	local ghost_position = (use_ghost_position_left and ghost_position_left) or ghost_position_right
	local ghost_position_on_navmesh = AISlotUtils.clamp_position_on_navmesh(ghost_position, nav_world)
	local ghost_position_direction = nil

	if ghost_position_on_navmesh then
		ghost_position_direction = Vector3_normalize(ghost_position_on_navmesh - slot_position)
	else
		ghost_position_direction = Vector3_normalize(ghost_position - slot_position)
	end

	local max_tries = 5

	for i = 1, max_tries, 1 do
		if ghost_position_on_navmesh then
			local ray_can_go = GwNavQueries_raycango(nav_world, ghost_position_on_navmesh, slot_position, traverse_logic)

			if ray_can_go then
				slot.ghost_position:store(ghost_position_on_navmesh)

				return
			end
		end

		local slot_type = slot.type
		local slot_distance = SlotTypeSettings[slot_type].distance
		local ghost_position_distance = slot_distance + ((distance - slot_distance) * (max_tries - i)) / max_tries
		ghost_position = target_unit_position + ghost_position_direction * ghost_position_distance
		ghost_position_on_navmesh = AISlotUtils.clamp_position_on_navmesh(ghost_position, nav_world)
	end

	clear_ghost_position(slot)
end

TEST_SLOT = 0

AIPlayerSlotExtension._get_best_slot = function (self, attacker_unit, slot_type, skip_slots_behind_target, avoid_slots_behind_overwhelmed_target)
	local ai_unit_position = POSITION_LOOKUP[attacker_unit]
	local target_unit_position = self.position:unbox()
	local slot_data = self.all_slots[slot_type]
	local target_slots = slot_data.slots
	local total_slots_count = slot_data.total_slots_count
	local is_overwhelmed = avoid_slots_behind_overwhelmed_target and is_slot_overwhelmed(slot_data)
	local best_slot = nil
	local best_score = math.huge

	if TEST_SLOT > 0 then
		return target_slots[TEST_SLOT]
	end

	for i = 1, total_slots_count, 1 do
		local slot = target_slots[i]
		local disabled = slot.disabled

		if disabled then
		elseif skip_slots_behind_target or is_overwhelmed then
			local is_behind_target = slot_is_behind_target(slot, ai_unit_position, target_unit_position)

			if is_behind_target then
			end
		else
			local slot_owner = slot.ai_unit
			local slot_position = slot.original_absolute_position:unbox()
			local slot_distance = Vector3_distance_sq(slot_position, ai_unit_position)
			local slot_score = math.huge

			if ALIVE[slot_owner] then
				if slot_owner == attacker_unit then
					slot_score = slot_distance + OWNER_STICKY_VALUE
				elseif slot.released then
					local current_owner_position = POSITION_LOOKUP[slot_owner]
					local owner_distance = Vector3_distance_sq(slot_position, current_owner_position) + RELEASED_OWNER_DISTANCE_MODIFIER

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

	return best_slot
end

AIPlayerSlotExtension._get_best_slot_to_wait_on = function (self, attacker_unit, slot_type, skip_slots_behind_target, avoid_slots_behind_overwhelmed_target, nav_world, t)
	local ai_unit_position = POSITION_LOOKUP[attacker_unit]
	local target_unit_position = self.position:unbox()
	local all_slots = self.all_slots
	local slot_data = all_slots[slot_type]
	local is_overwhelmed = avoid_slots_behind_overwhelmed_target and is_slot_overwhelmed(slot_data)
	local best_distance = math.huge
	local best_slot = nil

	for i = 1, num_slot_types, 1 do
		local other_slot_type = slot_types[i]
		local other_slot_data = all_slots[other_slot_type]
		local target_slots = other_slot_data.slots
		local count = other_slot_data.total_slots_count

		for j = 1, count, 1 do
			local slot = target_slots[j]
			local queue = slot.queue
			local queue_n = #queue
			local slot_is_behind_penalty = 0

			if (skip_slots_behind_target or is_overwhelmed) and slot_is_behind_target(slot, ai_unit_position, target_unit_position) then
				slot_is_behind_penalty = 100
			end

			local slot_queue_position, additional_penalty = get_slot_queue_position(slot, nav_world, 0, t)

			if not slot_queue_position then
			else
				local slot_queue_distance = Vector3_distance_sq(slot_queue_position, ai_unit_position) + queue_n * queue_n * SLOT_QUEUE_PENALTY_MULTIPLIER + additional_penalty + slot_is_behind_penalty

				if best_distance > slot_queue_distance then
					best_distance = slot_queue_distance
					best_slot = slot
				end
			end
		end
	end

	return best_slot
end

AIPlayerSlotExtension._update_slot = function (self, slot, attacker_unit, nav_world, traverse_logic)
	check_to_release_slot(slot)
	Profiler.start("set_ghost_position")

	local ai_unit_position = POSITION_LOOKUP[attacker_unit]
	local target_unit_position = self.position:unbox()
	local slot_behind_target = slot_is_behind_target(slot, ai_unit_position, target_unit_position)

	if slot_behind_target then
		set_ghost_position(ai_unit_position, target_unit_position, slot, nav_world, traverse_logic)
	else
		clear_ghost_position(slot)
	end

	Profiler.stop("set_ghost_position")
end

AIPlayerSlotExtension._assign_slot = function (self, slot, slot_consumer_ext)
	if slot.ai_unit_slot_extension == slot_consumer_ext then
		return
	end

	print("[AIPlayerSlotExtension] assigning slot", slot_consumer_ext._debug_id, slot.index)

	local previous_owner = slot.ai_unit_slot_extension

	if previous_owner then
		previous_owner:on_slot_lost()
	end

	slot.ai_unit = slot_consumer_ext.unit
	slot.ai_unit_slot_extension = slot_consumer_ext

	slot_consumer_ext:on_slot_gained(self, slot)

	local all_slots = self.all_slots
	local slot_type = slot.type
	local slot_data = all_slots[slot_type]
	slot_data.slots_count = calculate_slots_count(slot_data)

	update_anchor_weights(all_slots)
end

AIPlayerSlotExtension.request_best_slot = function (self, slot_consumer_ext, skip_slots_behind_target, avoid_slots_behind_overwhelmed_target, nav_world, traverse_logic, t)
	local in_queue = false
	local slot_type = slot_consumer_ext:get_preferred_slot_type()
	local attacker_unit = slot_consumer_ext.unit
	local slot = self:_get_best_slot(attacker_unit, slot_type, skip_slots_behind_target, avoid_slots_behind_overwhelmed_target)

	if slot then
		self:_assign_slot(slot, slot_consumer_ext)
		self:_update_slot(slot, attacker_unit, nav_world, traverse_logic)
	else
		local previous_slot, currently_in_queue = slot_consumer_ext:get_current_slot()
		local ai_unit_position = POSITION_LOOKUP[attacker_unit]
		local target_unit_position = self.position:unbox()
		local currently_holds_a_slot = not currently_in_queue and previous_slot and previous_slot.owner_extension == self
		local is_behind_target = previous_slot and slot_is_behind_target(previous_slot, ai_unit_position, target_unit_position)

		if currently_holds_a_slot and skip_slots_behind_target and is_behind_target then
			print("[AIPlayerSlotExtension] force releaseing slot", slot_consumer_ext._debug_id, previous_slot.index)
			self:free_slot(slot_consumer_ext, previous_slot, false)

			local dialogue_input = ScriptUnit.extension_input(attacker_unit, "dialogue_system")
			local event_data = FrameTable.alloc_table()

			dialogue_input:trigger_networked_dialogue_event("flanking", event_data)
		elseif not currently_in_queue then
			slot = self:_get_best_slot_to_wait_on(attacker_unit, slot_type, skip_slots_behind_target, avoid_slots_behind_overwhelmed_target, nav_world, t)
			in_queue = true

			if slot then
				local queue = slot.queue
				local queue_n = #queue
				queue[queue_n + 1] = slot_consumer_ext

				slot_consumer_ext:on_entered_slot_queue(self, slot)
			end
		elseif is_behind_target then
			local slot_data = self.all_slots[slot_type]
			local is_overwhelmed = avoid_slots_behind_overwhelmed_target and is_slot_overwhelmed(slot_data)

			if is_overwhelmed or skip_slots_behind_target then
				self:free_slot(slot_consumer_ext, previous_slot, true)
			end
		end
	end

	return slot, in_queue
end

AIPlayerSlotExtension.get_destination = function (self, slot_consumer_ext, slot, in_queue, nav_world, t)
	local position = nil

	if not in_queue then
		if slot.ghost_position.x ~= 0 then
			position = slot.ghost_position:unbox()
		else
			position = slot.absolute_position:unbox()

			if script_data.ai_debug_slots then
				QuickDrawer:sphere(position, 0.3, Color(255, 255, 255))
			end
		end
	else
		local ai_unit = slot_consumer_ext.unit
		local ai_unit_position = POSITION_LOOKUP[ai_unit]
		local distance_modifier = (slot.queue[1] == slot_consumer_ext and -0.5) or 0.5
		local slot_queue_position = get_slot_queue_position(slot, nav_world, distance_modifier, t)
		local above_limit = SLOT_QUEUE_RANDOM_POS_MAX_UP
		local below_limit = SLOT_QUEUE_RANDOM_POS_MAX_DOWN
		local horizontal_limit = SLOT_QUEUE_RANDOM_POS_MAX_HORIZONTAL
		local min_dist = 0
		local max_dist = SLOT_QUEUE_RADIUS
		local max_tries = 2
		local random_goal_function = LocomotionUtils.new_random_goal_uniformly_distributed_with_inside_from_outside_on_last
		local random_slot_position = (slot_queue_position and random_goal_function(nav_world, nil, slot_queue_position, min_dist, max_dist, max_tries, nil, above_limit, below_limit, horizontal_limit)) or nil
		local z_diff = (random_slot_position and math.abs(ai_unit_position.z - random_slot_position.z)) or 0
		local z_diff_exceded = Z_MAX_DIFFERENCE_ABOVE < z_diff
		local distance = (random_slot_position and Vector3_distance(random_slot_position, ai_unit_position)) or math.huge
		local close_distance = distance < 5
		position = random_slot_position

		if z_diff_exceded and close_distance then
			position = nil
		end
	end

	return position
end

AIPlayerSlotExtension.free_slot = function (self, slot_consumer_ext, slot, in_queue)
	print("[AIPlayerSlotExtension] slot freed", slot_consumer_ext._debug_id, slot.index)
	slot_consumer_ext:on_slot_lost()

	if in_queue then
		print("[AIPlayerSlotExtension] left queue", slot_consumer_ext._debug_id, slot.index)

		local queue = slot.queue
		local queue_n = #queue

		for i = queue_n, 1, -1 do
			local waiting_ai = queue[i]

			if waiting_ai == slot_consumer_ext then
				queue[i] = queue[queue_n]
				queue[queue_n] = nil

				break
			end
		end
	else
		fassert(slot.target_unit == self.unit, "this slot is does not belog here")
		fassert(slot.ai_unit_slot_extension == slot_consumer_ext, "wrong unit tried to leave slot %d, current slot owner id %d, but freed by %d", slot.index, slot.ai_unit_slot_extension._debug_id, slot_consumer_ext._debug_id)

		local queue = slot.queue
		local queue_n = #queue

		if queue_n > 0 then
			local queued_unit_ext = queue[queue_n]
			local ai_unit_waiting = queued_unit_ext.unit

			if queued_unit_ext:get_preferred_slot_type() == slot.type then
				slot.ai_unit = ai_unit_waiting
				slot.ai_unit_slot_extension = queued_unit_ext
				queue[queue_n] = nil

				print("[AIPlayerSlotExtension] from queue", slot.index)
				queued_unit_ext:on_slot_lost()
				queued_unit_ext:on_slot_gained(self, slot)
			else
				print("[AIPlayerSlotExtension] dispersing queue due to wrong slot type preference got -> expected", slot.index, slot.type, queued_unit_ext:get_preferred_slot_type())

				for i = #queue, 1, -1 do
					local next_queued_unit_ext = queue[i]

					next_queued_unit_ext:on_slot_lost()

					queue[i] = nil
				end

				slot.ai_unit = nil
				slot.ai_unit_slot_extension = nil
			end
		else
			slot.ai_unit = nil
			slot.ai_unit_slot_extension = nil
		end
	end

	local slot_type = slot.type
	local slot_data = self.all_slots[slot_type]
	slot_data.slots_count = calculate_slots_count(slot_data)
end

return

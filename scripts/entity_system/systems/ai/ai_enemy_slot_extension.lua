AIEnemySlotExtension = class(AIEnemySlotExtension)
local SlotTemplates = SlotTemplates
local SlotTypeSettings = SlotTypeSettings
local Vector3_distance_sq = Vector3.distance_squared
local Vector3_distance = Vector3.distance
local Vector3_dot = Vector3.dot
local DEFAULT_SLOT_TYPE = "normal"
local debug_id = 1

AIEnemySlotExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.unit = unit
	self.target = nil
	self.target_position = Vector3Box()
	self.improve_wait_slot_position_t = 0
	self._debug_id = debug_id
	debug_id = debug_id + 1
	self.belongs_to_ai = true

	self:_reroll_preferred_ai_slot_distance()
end

AIEnemySlotExtension._reroll_preferred_ai_slot_distance = function (self)
	self._ai_random_slot_dist = 0.4 + math.random() * 0.2
end

AIEnemySlotExtension.extensions_ready = function (self, world, unit)
	local breed = BLACKBOARDS[unit].breed
	self.breed = breed
	local slot_template_name = breed.slot_template
	local slot_template_difficulty = Managers.state.difficulty:get_difficulty_value_from_table(SlotTemplates)
	local slot_template = slot_template_difficulty[slot_template_name]

	fassert(slot_template_name, "Breed " .. breed.name .. " that uses slot system does not have a slot_template set in its breed.")
	fassert(slot_template, "Breed " .. breed.name .. " that uses slot system does not have a slot_template setup in SlotTemplates.")

	self.slot_template = slot_template
	self.slot_type_settings = SlotTypeSettings[slot_template.slot_type]
	self.use_slot_type = slot_template.slot_type
	self._navigation_ext = ScriptUnit.extension(unit, "ai_navigation_system")
end

AIEnemySlotExtension.cleanup_extension = function (self, unit, update_slots_ai_units, update_slots_ai_units_n)
	self:_detach_from_slot()
	self:_detach_from_ai_slot()

	for i = 1, update_slots_ai_units_n do
		local ai_unit = update_slots_ai_units[i]

		if ai_unit == unit then
			update_slots_ai_units[i] = update_slots_ai_units[update_slots_ai_units_n]
			update_slots_ai_units[update_slots_ai_units_n] = nil

			break
		end
	end
end

AIEnemySlotExtension._improve_slot_position = function (self, self_unit, t, nav_world)
	if not ALIVE[self_unit] then
		return
	end

	local slot, in_queue = self:get_current_slot()

	if not slot then
		return
	end

	if in_queue then
		if self.improve_wait_slot_position_t < t then
			self.improve_wait_slot_position_t = t + Math.random() * 0.4
		else
			return
		end
	end

	local new_position = nil
	local slot_owner_extension = slot.owner_extension

	if slot_owner_extension then
		new_position = slot_owner_extension:get_destination(self, slot, in_queue, nav_world, t)
	end

	if not new_position then
		return
	end

	local ai_unit_position = POSITION_LOOKUP[self_unit]

	if in_queue then
		self.wait_slot_distance = Vector3_distance(new_position, ai_unit_position) or math.huge
	end

	local navigation_extension = self._navigation_ext
	local previous_destination = navigation_extension:destination()
	local distance_sq = Vector3_distance_sq(ai_unit_position, new_position)

	if distance_sq > 1 or Vector3_dot(new_position - ai_unit_position, previous_destination - ai_unit_position) < 0 then
		navigation_extension:move_to(new_position)
	end
end

THE_SPARSE_GRID = {}
local cell_size_xy = 0.3
local cell_size_z = 0.3

local function sparse_hash(pos)
	local floor = math.floor
	local xp = floor(pos.x / cell_size_xy + 0.5)
	local yp = floor(pos.y / cell_size_xy + 0.5)
	local zp = floor(pos.z / cell_size_z + 0.5)
	local hash = xp * 0.0001 + yp + zp * 10000

	return THE_SPARSE_GRID[hash], hash, xp, yp, zp
end

local function book_sparse_grid(unit, hash, x, y, z)
	THE_SPARSE_GRID[hash] = {
		u = unit,
		x = x,
		y = y,
		z = z
	}
end

AIEnemySlotExtension._improve_ai_slot_position = function (self, self_unit, t, nav_world, target_unit)
	local attacker_blackboard = BLACKBOARDS[self_unit]

	if not ALIVE[self_unit] or not attacker_blackboard.slot_position_boxed then
		return
	end

	if self.improve_wait_slot_position_t < t then
		self.improve_wait_slot_position_t = t + 0.2 + Math.random() * 0.4
	else
		return
	end

	local ai_unit_position = POSITION_LOOKUP[self_unit]
	local new_position = attacker_blackboard.slot_position_boxed:unbox()
	local navigation_extension = self._navigation_ext
	local previous_destination = navigation_extension:destination()
	local distance_sq = Vector3_distance_sq(ai_unit_position, new_position)

	if distance_sq > 1 or Vector3_dot(new_position - ai_unit_position, previous_destination - ai_unit_position) < 0 then
		navigation_extension:move_to(new_position)
	end
end

AIEnemySlotExtension._improve_ai_slot_position_with_sparse_grid = function (self, self_unit, t, nav_world, target_unit)
	if not ALIVE[self_unit] then
		return
	end

	local target_blackboard = BLACKBOARDS[target_unit]
	local p1 = POSITION_LOOKUP[target_unit]
	local p2 = POSITION_LOOKUP[self_unit]
	local dir = Vector3.normalize(p2 - p1)
	local new_position = p1 + dir
	local occupied, hash, x, y, z = sparse_hash(new_position)

	if not occupied then
		self._navigation_ext:move_to(new_position)
		book_sparse_grid(self_unit, hash, x, y, z)
	elseif occupied.u ~= self_unit then
		local p3 = POSITION_LOOKUP[occupied.u]
		local new_position = p3 + dir

		self._navigation_ext:move_to(new_position)
	end
end

AIEnemySlotExtension.freeze = function (self, unit)
	self:_detach_from_slot()
	self:_detach_from_ai_slot()
end

AIEnemySlotExtension.unfreeze = function (self, unit)
	self.target = nil
	self.improve_wait_slot_position_t = 0
end

AIEnemySlotExtension.update = function (self, self_unit, all_extensions, nav_world, t, traverse_logic, system)
	local ai_unit_dead = not ALIVE[self_unit]

	if ai_unit_dead then
		print("[AIEnemySlotExtension] lol wut, please remove this")
		self:_detach_from_slot()

		return
	end

	local blackboard = BLACKBOARDS[self_unit]
	local target_unit = blackboard.target_unit

	self:_update_target(target_unit)

	if not target_unit then
		return
	end

	local target_unit_extension = all_extensions[target_unit]

	if not target_unit_extension then
		return
	end

	if target_unit_extension.belongs_to_player then
		if not self.do_search then
			return
		end

		local skip_slots_behind_target = blackboard.using_override_target
		local avoid_slots_behind_overwhelmed_target = self.slot_template.avoid_slots_behind_overwhelmed_target

		target_unit_extension:request_best_slot(self, skip_slots_behind_target, avoid_slots_behind_overwhelmed_target, nav_world, traverse_logic, t)

		if not blackboard.disable_improve_slot_position then
			self:_improve_slot_position(self_unit, t, nav_world)
		end

		local delayed_priotized_time = self.delayed_prioritized_ai_unit_update_time

		if delayed_priotized_time and delayed_priotized_time < t then
			self:_detach_from_slot()
			system:register_prioritized_ai_unit_update(self_unit)

			self.delayed_prioritized_ai_unit_update_time = nil
		end
	else
		local success = target_unit_extension:request_best_slot(self)

		if success and not self.ai_target_slot_extension then
			self:on_ai_slot_gained(target_unit_extension)
		end

		self:_improve_ai_slot_position(self_unit, t, nav_world, target_unit)
	end
end

AIEnemySlotExtension.on_unit_blocked_attack = function (self, ai_unit, system)
	if self.waiting_on_slot then
		return
	end

	local slot = self.slot

	if not slot then
		return nil
	end

	local slot_template = self.slot_template

	if slot_template.abandon_slot_when_blocked then
		if slot_template.abandon_slot_when_blocked_time then
			local t = Managers.time:time("game")
			self.delayed_prioritized_ai_unit_update_time = t + slot_template.abandon_slot_when_blocked_time
		else
			self:_detach_from_slot()
			system:register_prioritized_ai_unit_update(ai_unit)
		end
	end
end

AIEnemySlotExtension.ai_unit_staggered = function (self, ai_unit, system)
	if self.waiting_on_slot then
		return
	end

	local slot = self.slot

	if not slot then
		return nil
	end

	local slot_template = self.slot_template

	if slot_template.abandon_slot_when_staggered then
		if slot_template.abandon_slot_when_staggered_time then
			local t = Managers.time:time("game")
			self.delayed_prioritized_ai_unit_update_time = t + slot_template.abandon_slot_when_staggered_time
		else
			self:_detach_from_slot()
			system:register_prioritized_ai_unit_update(ai_unit)
		end
	end
end

AIEnemySlotExtension._detach_from_slot = function (self)
	local slot = self.slot or self.waiting_on_slot
	local waiting_on_slot = self.waiting_on_slot
	local slot_owner_extension = slot and slot.owner_extension

	if slot_owner_extension then
		slot_owner_extension:free_slot(self, slot, waiting_on_slot ~= nil)
	end

	self.waiting_on_slot = nil
	self.slot = nil

	self:_detach_from_ai_slot()
end

AIEnemySlotExtension._detach_from_ai_slot = function (self)
	local ai_target_slot_extension = self.ai_target_slot_extension

	if ai_target_slot_extension then
		ai_target_slot_extension:free_slot(self)

		self.ai_target_slot_extension = nil
	end
end

AIEnemySlotExtension._update_target = function (self, target_unit)
	if self.slot and self.slot.target_unit ~= target_unit then
		self:_detach_from_slot()
	end

	local ai_target_slot_extension = self.ai_target_slot_extension

	if ai_target_slot_extension and ai_target_slot_extension.unit ~= target_unit then
		self:_detach_from_ai_slot()
	end

	if not Unit.alive(target_unit) then
		self.target = nil

		self.target_position:store(0, 0, 0)

		if self.slot then
			self:_detach_from_slot()
		end

		self:_detach_from_ai_slot()

		return
	end

	local target_unit_position = POSITION_LOOKUP[target_unit]

	self.target_position:store(target_unit_position)
end

AIEnemySlotExtension.on_slot_lost = function (self)
	local slot = self.slot
	self.waiting_on_slot = nil
	self.slot = nil
end

AIEnemySlotExtension.on_slot_gained = function (self, slot_provider_ext, slot)
	local queue_slot = self.waiting_on_slot
	local previous_slot = self.slot

	if queue_slot then
		local slot_extension = queue_slot.owner_extension

		slot_extension:free_slot(self, queue_slot, true)
	end

	if previous_slot then
		local slot_extension = previous_slot.owner_extension

		slot_extension:free_slot(self, previous_slot, false)
	end

	self.waiting_on_slot = nil
	self.slot = slot
end

AIEnemySlotExtension.on_entered_slot_queue = function (self, slot_provider_ext, slot)
	local queue_slot = self.waiting_on_slot
	local previous_slot = self.slot

	if queue_slot then
		local slot_extension = queue_slot.owner_extension

		slot_extension:free_slot(self, queue_slot, true)
	end

	if previous_slot then
		local slot_extension = previous_slot.owner_extension

		slot_extension:free_slot(self, previous_slot, false)
	end

	self.waiting_on_slot = slot
	self.slot = nil
end

AIEnemySlotExtension.get_current_slot = function (self)
	return self.slot or self.waiting_on_slot, self.waiting_on_slot ~= nil
end

AIEnemySlotExtension.get_preferred_slot_type = function (self)
	return self.use_slot_type or DEFAULT_SLOT_TYPE
end

local AMOUNT_LEAN_SLOTS = 8

local function find_free_lean_slot(lean_slots, unit)
	if lean_slots[unit] and lean_slots[unit] > 0 then
		return lean_slots[unit]
	end

	if not lean_slots[1] then
		return 1
	end

	local start_idx = math.random(2, AMOUNT_LEAN_SLOTS)

	for i = start_idx, start_idx + AMOUNT_LEAN_SLOTS do
		local idx = i % AMOUNT_LEAN_SLOTS + 1

		if not lean_slots[idx] then
			return idx
		end
	end

	return nil
end

local SLOT_SPREAD_ANGLE = math.pi * 2 / AMOUNT_LEAN_SLOTS

AIEnemySlotExtension.request_best_slot = function (self, attacker_slot_extension)
	local unit = self.unit
	local target_blackboard = BLACKBOARDS[unit]
	local attacker_unit = attacker_slot_extension.unit
	local attacker_blackboard = BLACKBOARDS[attacker_unit]
	local lean_slots = target_blackboard.lean_slots
	local slot_index = attacker_blackboard.lean_slot_index or find_free_lean_slot(lean_slots, attacker_unit)

	if not slot_index then
		return false
	end

	lean_slots[attacker_unit] = slot_index
	lean_slots[slot_index] = attacker_unit
	attacker_blackboard.lean_slot_index = slot_index
	local target_position = POSITION_LOOKUP[unit]
	local attacker_position = POSITION_LOOKUP[attacker_unit]
	local dist = target_blackboard.breed.radius

	if not lean_slots.center_angle then
		lean_slots.center_angle = math.atan2(attacker_position.y - target_position.y, attacker_position.x - target_position.x)
	end

	local angle = lean_slots.center_angle + (slot_index - 1) * SLOT_SPREAD_ANGLE
	local slot_dist = dist + attacker_slot_extension._ai_random_slot_dist
	local x = math.cos(angle) * slot_dist + target_position.x
	local y = math.sin(angle) * slot_dist + target_position.y
	local z = target_position.z
	local slot_position = Vector3(x, y, z)
	local success, z = GwNavQueries.triangle_from_position(attacker_blackboard.nav_world, slot_position, 30, 30)

	if not success then
		return
	end

	slot_position.z = z
	local previous_slot_pos = attacker_blackboard.slot_position_boxed and attacker_blackboard.slot_position_boxed:unbox()

	if not previous_slot_pos or Vector3.distance_squared(slot_position, previous_slot_pos) > 1 then
		if attacker_blackboard.slot_position_boxed then
			attacker_blackboard.slot_position_boxed:store(slot_position)
		else
			attacker_blackboard.slot_position_boxed = Vector3Box(slot_position)
		end
	end

	return true
end

AIEnemySlotExtension.on_ai_slot_gained = function (self, slot_provider_ext)
	self.ai_target_slot_extension = slot_provider_ext
	local target_unit = slot_provider_ext.unit
	local target_blackboard = BLACKBOARDS[target_unit]
	target_blackboard.lean_dogpile = target_blackboard.lean_dogpile + 1
	local unit = self.unit
	local blackboard = BLACKBOARDS[unit]
	target_blackboard.lean_slots[self.unit] = blackboard.lean_slot_index
end

AIEnemySlotExtension.on_ai_slot_lost = function (self, slot_provier_ext)
	self.ai_target_slot_extension = nil
	local unit = self.unit
	local blackboard = BLACKBOARDS[unit]

	if blackboard then
		blackboard.lean_slot_index = nil

		self:_reroll_preferred_ai_slot_distance()
	end
end

AIEnemySlotExtension.free_slot = function (self, slot_consumer_ext)
	local unit = self.unit
	local blackboard = BLACKBOARDS[unit]

	if blackboard then
		local prev_attacker = slot_consumer_ext.unit
		local old_slot_id = blackboard.lean_slots[prev_attacker]

		if old_slot_id and old_slot_id > 0 then
			blackboard.lean_slots[old_slot_id] = nil
		end

		blackboard.lean_slots[prev_attacker] = nil
		blackboard.lean_dogpile = blackboard.lean_dogpile - 1
	end

	slot_consumer_ext:on_ai_slot_lost(self)
end

AIEnemySlotExtension.get_destination = function (self)
	return
end

AIEnemySlotExtension.debug_draw = function (self, drawer, t, nav_world, i_target)
	local unit = self.unit
	local blackboard = BLACKBOARDS[unit]
	local slot_position_boxed = blackboard and blackboard.slot_position_boxed

	if slot_position_boxed then
		local debug_color = script_data.debug_unit == unit and Color(255, 0, 255) or Color(255, 255, 255)

		drawer:sphere(slot_position_boxed:unbox(), 0.2, debug_color)

		local unit_position = POSITION_LOOKUP[self.unit]
		local center_angle = blackboard.lean_slots.center_angle or 0
		local breed_radius = blackboard.breed.radius
		local lean_slot_center_height = 0.2
		local center_x = math.cos(center_angle) * breed_radius
		local center_y = math.sin(center_angle) * breed_radius

		drawer:line(unit_position, unit_position + Vector3(center_x, center_y, 0), debug_color)
		drawer:line(unit_position + Vector3(center_x, center_y, 0), unit_position + Vector3(center_x, center_y, lean_slot_center_height), debug_color)
		drawer:line(unit_position, unit_position + Vector3(center_x, center_y, lean_slot_center_height), debug_color)
		drawer:circle(unit_position, breed_radius, Vector3.up(), debug_color)
		drawer:arrow_2d(unit_position, self.target_position:unbox(), debug_color)
		drawer:arrow_2d(unit_position, slot_position_boxed:unbox(), debug_color)

		if script_data.debug_unit == unit then
			for i = 1, AMOUNT_LEAN_SLOTS do
				local occupied = blackboard.lean_slots[i]
				local slot_color = occupied and Color(255, 0, 0) or Color(255, 255, 0)
				local slot_angle = center_angle + (i - 1) * SLOT_SPREAD_ANGLE
				local x = math.cos(slot_angle) * (breed_radius + 1)
				local y = math.sin(slot_angle) * (breed_radius + 1)

				drawer:circle(unit_position + Vector3(x, y, 0.1), 0.35, Vector3.up(), slot_color)
			end
		end
	end
end

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
	self.gathering = Managers.state.conflict.gathering
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
	self:_detach_from_ai_slot("cleanup_extension")

	if USE_ENGINE_SLOID_SYSTEM then
		notify_attackers(unit, Managers.state.conflict.dogpiled_attackers_on_unit)
	else
		self.gathering:notify_attackers(unit)
	end

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

AIEnemySlotExtension._improve_ai_slot_position = function (self, self_unit, t, nav_world, target_unit)
	local ai_unit_position = POSITION_LOOKUP[self_unit]
	local new_position = nil

	if USE_ENGINE_SLOID_SYSTEM then
		if not self.sloid_id then
			return
		end

		local sloid_pos = EngineOptimized.get_sloid_position(self.sloid_id)
		new_position = Vector3(sloid_pos[1], sloid_pos[2], sloid_pos[3])
	else
		local ball = self.gathering_ball

		if not ball then
			return
		end

		local ball_pos = ball.pos
		new_position = Vector3(ball_pos[1], ball_pos[2], ball_pos[3])
	end

	local navigation_extension = self._navigation_ext
	local previous_destination = navigation_extension:destination()
	local distance_sq = Vector3_distance_sq(ai_unit_position, new_position)

	if distance_sq > 1 or Vector3_dot(new_position - ai_unit_position, previous_destination - ai_unit_position) < 0 then
		navigation_extension:move_to(new_position)
	end
end

AIEnemySlotExtension.freeze = function (self, unit)
	self:_detach_from_slot()
	self:_detach_from_ai_slot("freeze")
end

AIEnemySlotExtension.unfreeze = function (self, unit)
	self.target = nil
	self.improve_wait_slot_position_t = 0
end

AIEnemySlotExtension.update = function (self, self_unit, all_slot_extensions, nav_world, t, traverse_logic, system)
	local blackboard = BLACKBOARDS[self_unit]
	local target_unit = blackboard.target_unit

	if self.gathering_ball then
		self:_update_ai_target(target_unit)
	elseif self.sloid_id then
		self:_engine_update_ai_target(target_unit)
	else
		self:_update_target(target_unit)
	end

	if not target_unit then
		return
	end

	local target_unit_extension = all_slot_extensions[target_unit]
	local target_is_player = target_unit_extension and target_unit_extension.belongs_to_player

	if not target_is_player and not AiUtils.unit_breed(target_unit) then
		return
	end

	if target_is_player then
		if not self.do_search or self.slot_template.disable_slot_search then
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
	elseif USE_ENGINE_SLOID_SYSTEM then
		if not self.sloid_id then
			local success = self:ai_has_slot(target_unit)

			if success then
				self:on_ai_slot_gained(target_unit, system)
				self:_improve_ai_slot_position(self_unit, t, nav_world, target_unit)
			end
		else
			self:_improve_ai_slot_position(self_unit, t, nav_world, target_unit)
		end
	elseif not self.gathering_ball then
		local success = self:ai_has_slot(target_unit)

		if success then
			self:on_ai_slot_gained(target_unit, system)
			self:_improve_ai_slot_position(self_unit, t, nav_world, target_unit)
		end
	else
		self:_improve_ai_slot_position(self_unit, t, nav_world, target_unit)
	end
end

AIEnemySlotExtension.ai_has_slot = function (self, target_unit)
	local target_blackboard = BLACKBOARDS[target_unit]
	local infighting = target_blackboard.breed.infighting or InfightingSettings.small
	local num_slots = infighting.crowded_slots

	return target_blackboard.lean_dogpile < num_slots
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
			self:_detach_from_ai_slot("on_unit_blocked_attack")
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
			self:_detach_from_ai_slot("ai_unit_staggered")
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
end

AIEnemySlotExtension._detach_from_ai_slot = function (self, reason)
	local target_unit = nil

	if USE_ENGINE_SLOID_SYSTEM then
		if not self.sloid_id then
			return
		end

		target_unit = self.target_unit
	else
		local gathering_ball = self.gathering_ball

		if not gathering_ball then
			return
		end

		target_unit = gathering_ball.target_unit
	end

	local blackboard = BLACKBOARDS[target_unit]

	if blackboard then
		blackboard.lean_dogpile = blackboard.lean_dogpile - 1
	end

	self:on_ai_slot_lost(target_unit)
end

AIEnemySlotExtension._update_target = function (self, target_unit)
	if self.slot and self.slot.target_unit ~= target_unit then
		self:_detach_from_slot()
	end

	if not Unit.alive(target_unit) then
		self.target = nil

		self.target_position:store(0, 0, 0)

		if self.slot then
			self:_detach_from_slot()
		end

		return
	end

	local target_unit_position = POSITION_LOOKUP[target_unit]

	self.target_position:store(target_unit_position)
end

AIEnemySlotExtension._update_ai_target = function (self, target_unit)
	if self.gathering_ball.target_unit ~= target_unit then
		self:_detach_from_ai_slot("new_target_unit")
	end
end

AIEnemySlotExtension._engine_update_ai_target = function (self, target_unit)
	if self.target_unit ~= target_unit then
		self:_detach_from_ai_slot("new_target_unit")
	end
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

AIEnemySlotExtension.on_ai_slot_gained = function (self, defender_unit, system)
	local target_blackboard = BLACKBOARDS[defender_unit]
	target_blackboard.lean_dogpile = target_blackboard.lean_dogpile + 1
	local unit = self.unit
	local blackboard = BLACKBOARDS[unit]
	local defender_pos = POSITION_LOOKUP[defender_unit]
	local attacker_pos = POSITION_LOOKUP[unit]
	local infighting = target_blackboard.breed.infighting or InfightingSettings.small
	local distance = USE_ENGINE_SLOID_SYSTEM and 3 or infighting.distance or 2
	local attacker_infighting = blackboard.breed.infighting or InfightingSettings.small
	local boid_radius = attacker_infighting.boid_radius or 0.3
	local to_attacker = Vector3.normalize(attacker_pos - defender_pos) * (distance + boid_radius)

	if USE_ENGINE_SLOID_SYSTEM then
		self.sloid_id = EngineOptimized.add_sloid(defender_pos + to_attacker, boid_radius, blackboard.side.side_id, unit, defender_unit, tonumber(Unit.get_data(unit, "unique_id") or "?"))
		local dogpiled_attackers = Managers.state.conflict.dogpiled_attackers_on_unit[defender_unit]

		if not dogpiled_attackers then
			Managers.state.conflict.dogpiled_attackers_on_unit[defender_unit] = {
				[unit] = self.sloid_id
			}
		else
			dogpiled_attackers[unit] = self.sloid_id
		end

		self.target_unit = defender_unit
	else
		self.gathering_ball = self.gathering:add_ball(defender_pos + to_attacker, boid_radius, unit, defender_unit)
	end
end

AIEnemySlotExtension.on_ai_slot_lost = function (self, target_unit)
	if USE_ENGINE_SLOID_SYSTEM then
		local attacker_list = Managers.state.conflict.dogpiled_attackers_on_unit[target_unit]

		fassert(attacker_list[self.unit], "missing dogpiled_attackers_on_unit, can't remove", target_unit)

		attacker_list[self.unit] = nil

		print("on_ai_slot_lost, sloid_id:", self.sloid_id)

		local sloid_id_changed, affected_unit = EngineOptimized.remove_sloid(self.sloid_id, self.unit)

		if sloid_id_changed then
			printf("\t-> sloid_id was changed: %s, unit-id: %s, sloid_id: %s", affected_unit, Unit.get_data(affected_unit, "unique_id"), sloid_id_changed)

			local slot_ext = ScriptUnit.has_extension(affected_unit, "ai_slot_system")
			slot_ext.sloid_id = sloid_id_changed
		end

		self.sloid_id = nil
	else
		if not self.gathering_ball then
			return
		end

		self.gathering:remove_ball(self.gathering_ball)

		self.gathering_ball = nil
	end
end

AIEnemySlotExtension.free_slot = function (self, slot_consumer_ext)
	local unit = self.unit
	local blackboard = BLACKBOARDS[unit]

	if blackboard then
		blackboard.lean_dogpile = blackboard.lean_dogpile - 1
	end

	slot_consumer_ext:on_ai_slot_lost(self)
end

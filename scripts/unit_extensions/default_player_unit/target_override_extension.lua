﻿-- chunkname: @scripts/unit_extensions/default_player_unit/target_override_extension.lua

local stagger_types = require("scripts/utils/stagger_types")

TargetOverrideExtension = class(TargetOverrideExtension)

local OVERRIDE_RADIUS = 0.75
local OVERRIDE_LIFETIME = 5

TargetOverrideExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._unit = unit
	self._result_table = {}
	self._stagger_impact = {
		stagger_types.medium,
		stagger_types.weak,
		stagger_types.explosion,
		stagger_types.none,
		stagger_types.medium,
	}
	self._side = extension_init_data.side
	self._broadphase_categories = self._side.enemy_broadphase_categories
end

TargetOverrideExtension.destroy = function (self)
	return
end

TargetOverrideExtension.taunt = function (self, radius, duration, do_stagger, taunt_bosses)
	local self_unit = self._unit
	local t = Managers.time:time("game")
	local taunt_end_time = t + duration
	local position = POSITION_LOOKUP[self_unit]
	local result_table = self._result_table
	local num_ai_units = AiUtils.broadphase_query(position, radius, result_table, self._broadphase_categories)

	for i = 1, num_ai_units do
		local ai_unit = result_table[i]
		local ai_extension = ScriptUnit.extension(ai_unit, "ai_system")
		local ai_blackboard = ai_extension:blackboard()
		local ai_breed = ai_extension:breed()
		local taunt_target = not ai_breed.ignore_taunts and (not ai_breed.boss or taunt_bosses)

		if taunt_target then
			if ai_blackboard.target_unit == self_unit then
				ai_blackboard.no_taunt_hesitate = true
			end

			ai_blackboard.taunt_unit = self_unit
			ai_blackboard.taunt_end_time = taunt_end_time
			ai_blackboard.target_unit = self_unit
			ai_blackboard.target_unit_found_time = t

			if do_stagger then
				local stagger_direction = POSITION_LOOKUP[ai_unit] - position

				AiUtils.stagger_target(self_unit, ai_unit, 1, self._stagger_impact, stagger_direction, t)
			end
		end
	end
end

TargetOverrideExtension.update = function (self, unit, input, dt, context, t)
	local position = POSITION_LOOKUP[unit] or Unit.world_position(unit, 0)
	local radius = OVERRIDE_RADIUS
	local result_table = self._result_table
	local override_time = t + OVERRIDE_LIFETIME
	local status_extension = ScriptUnit.extension(unit, "status_system")
	local is_disabled = status_extension:is_disabled()
	local is_invisible = status_extension:is_invisible()

	if not is_disabled and not is_invisible then
		local ai_system = Managers.state.entity:system("ai_system")
		local ai_slot_system = Managers.state.entity:system("ai_slot_system")
		local num_ai_units = AiUtils.broadphase_query(position, radius, result_table, self._broadphase_categories)

		for i = 1, num_ai_units do
			local ai_unit = result_table[i]

			if ScriptUnit.has_extension(ai_unit, "ai_slot_system") then
				local ai_extension = ScriptUnit.extension(ai_unit, "ai_system")
				local ai_blackboard = ai_extension:blackboard()
				local previous_override_time = ai_blackboard.override_targets[unit]

				ai_blackboard.override_targets[unit] = override_time

				if previous_override_time == nil or previous_override_time < t then
					ai_system:register_prioritized_perception_unit_update(ai_unit, ai_extension)
					ai_slot_system:register_prioritized_ai_unit_update(ai_unit)
				end
			end
		end
	end
end

TargetOverrideExtension.add_to_override_targets = function (self, ai_unit, target_unit, ai_unit_blackboard, t)
	local override_time = t + OVERRIDE_LIFETIME
	local previous_override_time = ai_unit_blackboard.override_targets[target_unit]

	ai_unit_blackboard.override_targets[target_unit] = override_time

	if previous_override_time == nil or previous_override_time < t then
		local ai_system = Managers.state.entity:system("ai_system")
		local ai_slot_system = Managers.state.entity:system("ai_slot_system")
		local ai_extension = ScriptUnit.extension(ai_unit, "ai_system")

		ai_system:register_prioritized_perception_unit_update(ai_unit, ai_extension)
		ai_slot_system:register_prioritized_ai_unit_update(ai_unit)
	end
end

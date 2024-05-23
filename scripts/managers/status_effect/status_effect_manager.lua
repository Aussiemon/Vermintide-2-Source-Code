-- chunkname: @scripts/managers/status_effect/status_effect_manager.lua

require("scripts/managers/status_effect/status_effect_templates")

StatusEffectManager = class(StatusEffectManager)

StatusEffectManager.init = function (self, world)
	self._world = world
	self._statuses_by_unit = {}
	self._timed_status_datas = {}
	self._blacklisted_units = {}

	self._on_unit_destroyed_cb = function (unit)
		self:_cleanup_unit(unit)
	end
end

StatusEffectManager.destroy = function (self)
	for unit in pairs(self._statuses_by_unit) do
		self:remove_all_statuses(unit)
	end
end

StatusEffectManager.update = function (self, dt, t)
	self:_update_timed_statuses(dt, t)
end

local EMPTY_TABLE = {}

StatusEffectManager.set_status = function (self, unit, status_name, reason, value)
	if value then
		if self._blacklisted_units[unit] then
			return false
		end

		local breed = Unit.get_data(unit, "breed")

		if breed then
			local status_settings = breed.status_effect_settings
			local ignored_statuses = status_settings and status_settings.ignored_statuses or EMPTY_TABLE
			local is_critter = CRITTER[breed.name]

			if ignored_statuses[status_name] or is_critter then
				return false
			end
		end
	end

	local status_template = StatusEffectTemplates[status_name]
	local had_status = self:has_status(unit, status_name)
	local status_by_unit = self._statuses_by_unit
	local statuses = status_by_unit[unit]

	if value then
		if not statuses then
			Managers.state.unit_spawner:add_destroy_listener(unit, "StatusEffectManager", self._on_unit_destroyed_cb)
			Managers.state.event:register_referenced(unit, self, "on_unit_freeze", "_cleanup_unit")

			statuses = {}
			status_by_unit[unit] = statuses
		end

		statuses[status_name] = statuses[status_name] or {
			reasons = {},
			frame_index = GLOBAL_FRAME_INDEX,
		}

		local status_data = statuses[status_name]

		status_data.reasons[reason] = true

		if not had_status and status_template.on_applied then
			status_data.apply_data = status_template.on_applied(unit, reason, status_template, self._world)
		end

		if status_template.on_increment then
			status_template.on_increment(unit, reason, status_template, self._world, status_data.apply_data)
		end
	elseif statuses then
		local status_data = statuses[status_name] or EMPTY_TABLE
		local reasons = status_data.reasons or EMPTY_TABLE

		if reasons[reason] then
			reasons[reason] = nil

			local apply_data = status_data.apply_data

			if status_template.on_decrement then
				status_template.on_decrement(unit, reason, status_template, self._world, apply_data)
			end

			if table.is_empty(reasons) then
				statuses[status_name] = nil

				if status_template.on_removed then
					status_template.on_removed(unit, reason, status_template, self._world, apply_data)
				end
			end
		end

		if table.is_empty(statuses) then
			status_by_unit[unit] = nil

			if not self._blacklisted_units[unit] then
				Managers.state.unit_spawner:remove_destroy_listener(unit, "StatusEffectManager")
				Managers.state.event:unregister_referenced("on_unit_freeze", unit, self)
			end
		end
	end

	return true
end

StatusEffectManager.add_timed_status = function (self, unit, status_name, optional_duration)
	local duration = optional_duration or StatusEffectTemplates[status_name].default_timed_duration
	local t = Managers.time:time("game")
	local timed_data = {
		_is_timed = true,
		status_name = status_name,
		remove_t = t + duration,
	}

	if self:set_status(unit, status_name, timed_data, true) then
		self._timed_status_datas[timed_data] = unit
	end

	return timed_data
end

StatusEffectManager._remove_timed_status = function (self, unit, handle)
	if Unit.alive(unit) then
		local status_name = handle.status_name

		self:set_status(unit, status_name, handle, false)
	end

	self._timed_status_datas[handle] = nil
end

StatusEffectManager.has_status = function (self, unit, status_name)
	local unit_statuses = self._statuses_by_unit[unit]

	if unit_statuses then
		local status = unit_statuses[status_name]
		local applied_this_frame = status and status.frame_index == GLOBAL_FRAME_INDEX

		return status, applied_this_frame
	end

	return false, false
end

StatusEffectManager.remove_all_statuses = function (self, unit, disable_further_statuses)
	if disable_further_statuses then
		self._blacklisted_units[unit] = true
	end

	local statuses = self._statuses_by_unit[unit] or EMPTY_TABLE

	for status_name, apply_data in pairs(statuses) do
		for handle in pairs(apply_data.reasons) do
			if type(handle) == "table" and handle._is_timed then
				self:_remove_timed_status(unit, handle)
			else
				self:set_status(unit, status_name, handle, false)
			end
		end
	end
end

StatusEffectManager._update_timed_statuses = function (self, dt, t)
	for timed_data, unit in pairs(self._timed_status_datas) do
		if t > timed_data.remove_t then
			self:_remove_timed_status(unit, timed_data)
		end
	end
end

StatusEffectManager._cleanup_unit = function (self, unit)
	Managers.state.unit_spawner:remove_destroy_listener(unit, "StatusEffectManager")
	Managers.state.event:unregister_referenced("on_unit_freeze", unit, self)
	self:remove_all_statuses(unit)

	self._blacklisted_units[unit] = nil
end

StatusEffectManager.unit_is_burning = function (self, unit)
	local burning_normal, applied_this_frame_normal = self:has_status(unit, StatusEffectNames.burning)
	local burning_balefire, applied_this_frame_balefire = self:has_status(unit, StatusEffectNames.burning_balefire)
	local burning_elven, applied_this_frame_elven = self:has_status(unit, StatusEffectNames.burning_elven_magic)
	local burning_warpfire, applied_this_frame_warpfire = self:has_status(unit, StatusEffectNames.burning_warpfire)
	local burning = burning_normal or burning_balefire or burning_elven or burning_warpfire
	local applied_this_frame = burning and (not burning_normal or applied_this_frame_normal) and (not burning_balefire or applied_this_frame_balefire) and (not burning_elven or applied_this_frame_elven) and (not burning_warpfire or applied_this_frame_warpfire)

	return burning, applied_this_frame
end

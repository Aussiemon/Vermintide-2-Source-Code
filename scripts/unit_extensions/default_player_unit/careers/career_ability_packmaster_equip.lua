-- chunkname: @scripts/unit_extensions/default_player_unit/careers/career_ability_packmaster_equip.lua

CareerAbilityPackmasterEquip = class(CareerAbilityPackmasterEquip, CareerAbilityDarkPactBase)

CareerAbilityPackmasterEquip.init = function (self, extension_init_context, unit, extension_init_data, ability_data)
	self.super.init(self, extension_init_context, unit, extension_init_data, ability_data)

	self._ability_default_startup_delay_time = self._ability_data.startup_delay_time

	self:freeze()
end

CareerAbilityPackmasterEquip.update = function (self, unit, input, dt, context, t)
	if self._freezed then
		return
	end

	if not self._equip_ready then
		if not self._equip_startup_delay_time then
			if self:_ability_available() then
				self._equip_startup_delay_time = t + self._ability_default_startup_delay_time
			end
		elseif not self._equip_ready and t >= self._equip_startup_delay_time then
			self._equip_ready = true
		end
	end

	local startup_delay_time = self._equip_startup_delay_time

	if startup_delay_time then
		local default_delay_time = self._ability_default_startup_delay_time
		local fraction = math.clamp((startup_delay_time - t) / default_delay_time, 0, 1)

		self._startup_delay_fraction = fraction
	end
end

CareerAbilityPackmasterEquip.was_triggered = function (self)
	if self:_ability_available() and self._equip_ready then
		self:_start()

		return true
	end

	return false
end

CareerAbilityPackmasterEquip.startup_delay_fraction = function (self)
	return self._startup_delay_fraction
end

CareerAbilityPackmasterEquip.startup_delay_time = function (self)
	return self._equip_startup_delay_time
end

CareerAbilityPackmasterEquip._start = function (self)
	self.super._start(self)
	self:freeze()

	self._equip_ready = nil
	self._startup_delay_fraction = nil
	self._equip_startup_delay_time = nil
end

CareerAbilityPackmasterEquip.unfreeze = function (self)
	self._freezed = false
end

CareerAbilityPackmasterEquip.freeze = function (self)
	self._freezed = true
end

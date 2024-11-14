-- chunkname: @scripts/unit_extensions/weapons/husk_weapon_unit_extension.lua

HuskWeaponUnitExtension = class(HuskWeaponUnitExtension)

HuskWeaponUnitExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.world = extension_init_context.world
	self.unit = unit
	self.owner_unit = extension_init_data.owner_unit

	local item_name = extension_init_data.item_name
	local item_data = rawget(ItemMasterList, item_name)
	local weapon_template_name = item_data and item_data.template

	if weapon_template_name then
		local template = WeaponUtils.get_weapon_template(weapon_template_name)

		self._synced_weapon_state = nil
		self._synced_weapon_states = template and template.synced_states

		if self._synced_weapon_states then
			self._synced_weapon_state_data = {}
		end
	end
end

HuskWeaponUnitExtension.destroy = function (self)
	if self._synced_weapon_states then
		for synced_state, weapon_state in pairs(self._synced_weapon_states) do
			if weapon_state.leave then
				weapon_state:leave(self.owner_unit, self.unit, self._synced_weapon_state_data, self:_is_local_player(), self.world, nil, true)
			end
		end
	end
end

HuskWeaponUnitExtension.update = function (self, unit, input, dt, context, t)
	if self._synced_weapon_state then
		local weapon_state = self._synced_weapon_states[self._synced_weapon_state]

		if weapon_state.update then
			weapon_state:update(self.owner_unit, self.unit, self._synced_weapon_state_data, false, self.world, dt)
		end
	end
end

HuskWeaponUnitExtension._is_local_player = function (self)
	return false
end

HuskWeaponUnitExtension.change_synced_state = function (self, state_name)
	if self._synced_weapon_state then
		local weapon_state = self._synced_weapon_states[self._synced_weapon_state]

		if weapon_state.leave then
			weapon_state:leave(self.owner_unit, self.unit, self._synced_weapon_state_data, false, self.world, state_name, false)
		end
	end

	self._synced_weapon_state = state_name

	if state_name then
		local weapon_state = self._synced_weapon_states[state_name]

		if weapon_state.clear_data_on_enter then
			table.clear(self._synced_weapon_state_data)
		end

		if weapon_state.enter then
			weapon_state:enter(self.owner_unit, self.unit, self._synced_weapon_state_data, false, self.world)
		end
	end
end

HuskWeaponUnitExtension.current_synced_state = function (self)
	return self._synced_weapon_state
end

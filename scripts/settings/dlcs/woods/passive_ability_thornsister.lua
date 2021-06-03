PassiveAbilityThornsister = class(PassiveAbilityThornsister)

PassiveAbilityThornsister.init = function (self, extension_init_context, unit, extension_init_data, ability_init_data)
	self._owner_unit = unit
	self._ability_init_data = ability_init_data
	self._cooldown_buff = nil
	self._stack_buffs = {}
	self._num_stack_buffs = 0
end

PassiveAbilityThornsister.extensions_ready = function (self, world, unit)
	self._career_extension = ScriptUnit.has_extension(unit, "career_system")
	self._buff_extension = ScriptUnit.has_extension(unit, "buff_system")
	local ability_init_data = self._ability_init_data

	self._career_extension:setup_extra_ability_uses(0, ability_init_data.cooldown, ability_init_data.starting_stack_count, ability_init_data.max_stacks)

	local talent_extension = ScriptUnit.has_extension(unit, "talent_system")

	self:_update_max_extra_abilities(talent_extension)
	self:_register_events()
end

PassiveAbilityThornsister.destroy = function (self)
	self:_unregister_events()
end

PassiveAbilityThornsister._register_events = function (self)
	Managers.state.event:register(self, "on_talents_changed", "on_talents_changed")
end

PassiveAbilityThornsister._unregister_events = function (self)
	local event_manager = Managers.state.event

	if event_manager then
		Managers.state.event:unregister("on_talents_changed", self)
	end
end

PassiveAbilityThornsister.update = function (self, dt, t)
	local career_ext = self._career_extension

	if not career_ext then
		return
	end

	career_ext:modify_extra_ability_charge(dt)

	local buff_extension = self._buff_extension

	if buff_extension then
		local extra_ability_uses, extra_ability_uses_max = career_ext:get_extra_ability_uses()
		local extra_ability_use_charge, extra_ability_use_required_charge = career_ext:get_extra_ability_charge()
		local cooldown_buff = self._cooldown_buff

		if cooldown_buff and cooldown_buff.is_stale then
			cooldown_buff = nil
		end

		if extra_ability_uses < extra_ability_uses_max then
			if not cooldown_buff then
				local buff_id = buff_extension:add_buff("kerillian_thorn_sister_free_ability_cooldown")
				cooldown_buff = buff_extension:get_buff_by_id(buff_id)
				self._cooldown_buff = cooldown_buff
			end

			cooldown_buff.start_time = t - extra_ability_use_charge
			cooldown_buff.duration = extra_ability_use_required_charge
		elseif cooldown_buff then
			buff_extension:remove_buff(cooldown_buff.id)

			self._cooldown_buff = nil
		end

		local stack_buffs = self._stack_buffs
		local num_stacks = self._num_stack_buffs

		if num_stacks < extra_ability_uses then
			for i = 1, extra_ability_uses - num_stacks, 1 do
				stack_buffs[num_stacks + i] = buff_extension:add_buff("kerillian_thorn_sister_free_ability_stack")
			end
		elseif extra_ability_uses < num_stacks then
			for i = 1, num_stacks - extra_ability_uses, 1 do
				local index = num_stacks - i + 1

				buff_extension:remove_buff(stack_buffs[index])

				stack_buffs[index] = nil
			end
		end

		self._num_stack_buffs = extra_ability_uses
	end
end

PassiveAbilityThornsister.on_talents_changed = function (self, unit, talent_extension)
	if unit ~= self._owner_unit then
		return
	end

	local buff_extension = self._buff_extension

	if buff_extension then
		local cooldown_buff = self._cooldown_buff

		if cooldown_buff and not cooldown_buff.is_stale then
			buff_extension:remove_buff(cooldown_buff.id)
		end

		self._cooldown_buff = nil
		local stack_buffs = self._stack_buffs
		local num_stacks = self._num_stack_buffs

		for i = 1, num_stacks, 1 do
			local index = num_stacks - i + 1

			buff_extension:remove_buff(stack_buffs[index])

			stack_buffs[index] = nil
		end

		self._num_stack_buffs = 0
	end

	self:_update_max_extra_abilities(talent_extension)
end

PassiveAbilityThornsister._update_max_extra_abilities = function (self, talent_extension)
	if not talent_extension then
		return
	end

	local career_ext = self._career_extension

	if not career_ext then
		return
	end

	local max_uses = self._ability_init_data.max_stacks

	if talent_extension:has_talent("kerillian_double_passive") then
		max_uses = max_uses + 1
	end

	career_ext:update_extra_ability_uses_max(max_uses)
end

return

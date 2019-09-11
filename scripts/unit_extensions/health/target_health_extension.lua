TargetHealthExtension = class(TargetHealthExtension)

TargetHealthExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.unit = unit
	self.is_server = Managers.player.is_server
	self._dead = false
	self._out_of_combat_timer = 0
	self._health_regen_timer = 0
	self._damage_per_hit = extension_init_data.damage_per_hit or 1
	self._health = extension_init_data.health or Unit.get_data(unit, "health") or 1
	self._max_health = self._health
	self._health_regen = {
		interval = 1,
		out_of_combat_only = false,
		out_of_combat_delay = 0,
		amount = 0
	}
	slot4 = pairs
	slot5 = extension_init_data.health_regen or {}

	for key, value in slot4(slot5) do
		self._health_regen[key] = value
	end

	self.damage_buffers = {
		pdArray.new(),
		pdArray.new()
	}
end

TargetHealthExtension.update = function (self, dt, t)
	local heal_amount = self._health_regen.amount
	local heal_interval = self._health_regen.interval

	if heal_amount <= 0 or heal_interval < 0 then
		return
	end

	local out_of_combat_only = self._health_regen.out_of_combat_only
	local out_of_combat_delay = self._health_regen.out_of_combat_delay
	self._out_of_combat_timer = math.min(self._out_of_combat_timer + dt, out_of_combat_delay)

	if out_of_combat_only and self._out_of_combat_timer < out_of_combat_delay then
		return
	end

	if heal_interval <= self._health_regen_timer then
		self:add_heal(heal_amount)

		self._health_regen_timer = 0
	else
		self._health_regen_timer = math.min(self._health_regen_timer + dt, heal_interval)
	end
end

TargetHealthExtension.add_damage = function (self, ...)
	if not self:is_dead() then
		self._health = math.max(self._health - self._damage_per_hit, 0)
		self._out_of_combat_timer = 0

		if self:_should_die() then
			self:set_dead()
		end
	end
end

TargetHealthExtension.add_heal = function (self, amount)
	if not self:is_dead() then
		self._health = math.min(self._health + amount, self._max_health)
	end
end

TargetHealthExtension.is_dead = function (self)
	return self._dead
end

TargetHealthExtension.is_alive = function (self)
	return not self._dead
end

TargetHealthExtension.set_dead = function (self)
	self._dead = true
	self._health = 0
end

TargetHealthExtension._should_die = function (self)
	return self._health <= 0
end

TargetHealthExtension.current_health = function (self)
	return self._health
end

TargetHealthExtension.current_health_percent = function (self)
	return 1
end

TargetHealthExtension.current_max_health_percent = function (self)
	return 1
end

TargetHealthExtension.get_is_invincible = function (self)
	return false
end

TargetHealthExtension.has_assist_shield = function (self)
	return false
end

TargetHealthExtension.get_damage_taken = function (self)
	return self._max_health - self._health
end

TargetHealthExtension.get_health_regen = function (self)
	return self._health_regen
end

TargetHealthExtension.client_predicted_is_alive = function (self)
	return not self:is_dead()
end

TargetHealthExtension.apply_client_predicted_damage = function (self, predicted_damage)
	return
end

return

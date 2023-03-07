InvincibleHealthExtension = class(InvincibleHealthExtension, GenericHealthExtension)

InvincibleHealthExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.unit = unit
	self.is_server = Managers.player.is_server
	self.system_data = extension_init_context.system_data
	self.statistics_db = extension_init_context.statistics_db
	self.damage_buffers = {
		pdArray.new(),
		pdArray.new()
	}
	self.network_transmit = extension_init_context.network_transmit
	self.is_invincible = true
	self.health = NetworkConstants.health.max
	self.damage = 0
	self.state = "alive"
end

InvincibleHealthExtension.destroy = function (self)
	return
end

InvincibleHealthExtension.reset = function (self)
	return
end

InvincibleHealthExtension.hot_join_sync = function (self, sender)
	return
end

InvincibleHealthExtension.is_alive = function (self)
	return true
end

InvincibleHealthExtension.current_health_percent = function (self)
	return 1
end

InvincibleHealthExtension.current_health = function (self)
	return self.health
end

InvincibleHealthExtension.get_max_health = function (self)
	return self.health
end

InvincibleHealthExtension.set_max_health = function (self, health, update_unmodfied)
	return
end

InvincibleHealthExtension.get_damage_taken = function (self)
	return 0
end

InvincibleHealthExtension.set_current_damage = function (self, damage)
	return
end

InvincibleHealthExtension.die = function (self, damage_type)
	fassert(false, "Tried to kill InvincibleHealthExtension")
end

InvincibleHealthExtension.set_dead = function (self)
	return
end

InvincibleHealthExtension.apply_client_predicted_damage = function (self, predicted_damage)
	return
end

OverpoweredBlobHealthExtension = class(OverpoweredBlobHealthExtension, GenericHealthExtension)

OverpoweredBlobHealthExtension.init = function (self, extension_init_context, unit, extension_init_data, ...)
	OverpoweredBlobHealthExtension.super.init(self, extension_init_context, unit, extension_init_data, ...)

	self.target_unit = extension_init_data.target_unit
	local t = Managers.time:time("game")
	self.death_time = t + (extension_init_data.life_time or math.huge)
	self.bots_can_do_damage = true
end

OverpoweredBlobHealthExtension.update = function (self, dt, context, t)
	local target_status_ext = ScriptUnit.has_extension(self.target_unit, "status_system")

	if not target_status_ext or not target_status_ext.overpowered or self.death_time < t then
		Managers.state.unit_spawner:mark_for_deletion(self.unit)
	end
end

OverpoweredBlobHealthExtension.destroy = function (self)
	if not Unit.alive(self.target_unit) then
		return
	end

	local target_status_ext = ScriptUnit.has_extension(self.target_unit, "status_system")

	if target_status_ext then
		StatusUtils.set_overpowered_network(self.target_unit, false)
	end
end

return

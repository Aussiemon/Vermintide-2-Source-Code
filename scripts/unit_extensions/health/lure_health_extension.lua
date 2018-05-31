local data_fields = {
	"DAMAGE_AMOUNT",
	"DAMAGE_TYPE",
	"ATTACKER",
	"HIT_ZONE",
	"DIRECTION",
	"DAMAGE_SOURCE_NAME",
	"HIT_RAGDOLL_ACTOR_NAME",
	"DAMAGING_UNIT",
	"HIT_REACT_TYPE",
	"CRITICAL_HIT"
}
DamageDataIndex = {}
local DamageDataIndex = DamageDataIndex

for index, field_name in ipairs(data_fields) do
	DamageDataIndex[field_name] = index
end

DamageDataIndex.STRIDE = #data_fields
data_fields = nil
LureHealthExtension = class(LureHealthExtension)

LureHealthExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._unit = unit
	self._is_server = Managers.player.is_server
	self._attached_unit = extension_init_data.attached_unit
	self._lifetime = Managers.time:time("game") + extension_init_data.duration
	self.damage_buffers = {
		pdArray.new(),
		pdArray.new()
	}
	self._network_transmit = extension_init_context.network_transmit
	self._is_dead = false
end

LureHealthExtension.destroy = function (self)
	return
end

LureHealthExtension.hot_join_sync = function (self, sender)
	return
end

LureHealthExtension.is_alive = function (self)
	return not self._is_dead
end

LureHealthExtension.current_health_percent = function (self)
	return (self._is_dead and 0) or 1
end

LureHealthExtension.current_health = function (self)
	return 1
end

LureHealthExtension.get_damage_taken = function (self)
	return 0
end

LureHealthExtension.get_max_health = function (self)
	return 1
end

LureHealthExtension.add_damage = function (self, ...)
	if self._is_server and not self._is_dead and Unit.alive(self._attached_unit) then
		ScriptUnit.extension(self._attached_unit, "health_system"):add_damage(...)
	end
end

LureHealthExtension.update = function (self, dt, context, t)
	if self._is_server and not self._is_dead and self._lifetime < t then
		local death_system = Managers.state.entity:system("death_system")

		death_system:kill_unit(self._unit, {})
	end
end

LureHealthExtension.add_heal = function (self, ...)
	return
end

LureHealthExtension.set_dead = function (self)
	self._is_dead = true
end

LureHealthExtension.has_assist_shield = function (self)
	return false
end

return

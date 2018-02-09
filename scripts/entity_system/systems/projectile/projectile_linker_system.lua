require("scripts/unit_extensions/weapons/projectiles/projectile_linker_extension")

ProjectileLinkerSystem = class(ProjectileLinkerSystem, ExtensionSystemBase)
local extensions = {
	"ProjectileLinkerExtension"
}
local LINKED_PROJECTILE_LIFETIME = 30
ProjectileLinkerSystem.init = function (self, entity_system_creation_context, system_name)
	ProjectileLinkerSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	self.linked_projectile_units = {}
	self.owner_units_count = 0
	self.linked_projectile_owner_destroy_callback = function (destroyed_linked_projectile_owner_unit)
		for owner_unit, linked_projectiles in pairs(self.linked_projectile_units) do
			if owner_unit == destroyed_linked_projectile_owner_unit then
				for linked_projectile_unit, end_time in pairs(linked_projectiles) do
					self:_remove_linked_projectile_reference(linked_projectile_unit)

					if Unit.alive(linked_projectile_unit) then
						Managers.state.unit_spawner:mark_for_deletion(linked_projectile_unit)
					end
				end
			end
		end

		self.linked_projectile_units[destroyed_linked_projectile_owner_unit] = nil
		self.owner_units_count = self.owner_units_count - 1

		return 
	end

	return 
end
ProjectileLinkerSystem.on_remove_extension = function (self, unit, extension_name)
	self.clear_linked_projectiles(self, unit)

	return ProjectileLinkerSystem.super.on_remove_extension(self, unit, extension_name)
end
ProjectileLinkerSystem.clear_linked_projectiles = function (self, unit)
	local extension = ScriptUnit.extension(unit, "projectile_linker_system")
	local linked_projectiles = extension.linked_projectiles
	local num_linked_projectiles = #linked_projectiles
	local unit_spawner = Managers.state.unit_spawner

	for i = 1, num_linked_projectiles, 1 do
		local linked_projectile_unit = linked_projectiles[i]

		if self._has_reference(self, linked_projectile_unit) then
			self._remove_linked_projectile_reference(self, linked_projectile_unit)
			unit_spawner.mark_for_deletion(unit_spawner, linked_projectile_unit)
		end
	end

	return 
end
local linked_projectiles_to_remove = {}
ProjectileLinkerSystem.update = function (self, context, t)
	ProjectileLinkerSystem.super.update(self, context, t)

	local linked_projectile_units = self.linked_projectile_units

	for owner_unit, linked_projectiles in pairs(linked_projectile_units) do
		for linked_projectile_unit, end_time in pairs(linked_projectiles) do
			if end_time <= t then
				linked_projectiles_to_remove[linked_projectile_unit] = true
			end
		end
	end

	local unit_spawner = Managers.state.unit_spawner

	for linked_projectile_unit, alive in pairs(linked_projectiles_to_remove) do
		self._remove_linked_projectile_reference(self, linked_projectile_unit)
		unit_spawner.mark_for_deletion(unit_spawner, linked_projectile_unit)
	end

	table.clear(linked_projectiles_to_remove)

	return 
end
ProjectileLinkerSystem.destroy = function (self)
	return 
end
ProjectileLinkerSystem.add_linked_projectile_reference = function (self, owner_unit, linked_projectile_unit)
	local t = Managers.time:time("game")

	if not self.linked_projectile_units[owner_unit] then
		self.linked_projectile_units[owner_unit] = {}
		self.owner_units_count = self.owner_units_count + 1
		local unit_spawner = Managers.state.unit_spawner

		unit_spawner.add_destroy_listener(unit_spawner, owner_unit, "linked_projectile_owner_" .. self.owner_units_count, self.linked_projectile_owner_destroy_callback)
	end

	local num_linked_projectile_units = #self.linked_projectile_units[owner_unit]
	self.linked_projectile_units[owner_unit][linked_projectile_unit] = t + LINKED_PROJECTILE_LIFETIME

	return 
end
ProjectileLinkerSystem._remove_linked_projectile_reference = function (self, linked_projectile_unit)
	for owner_unit, linked_projectiles in pairs(self.linked_projectile_units) do
		linked_projectiles[linked_projectile_unit] = nil
	end

	return 
end
ProjectileLinkerSystem._has_reference = function (self, linked_projectile_unit)
	for owner_unit, linked_projectiles in pairs(self.linked_projectile_units) do
		if linked_projectiles[linked_projectile_unit] then
			return true
		end
	end

	return false
end

return 

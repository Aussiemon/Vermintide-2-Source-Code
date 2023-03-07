ProjectileLinkerExtension = class(ProjectileLinkerExtension)

ProjectileLinkerExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self._world = extension_init_context.world
	self._owner_unit = unit
	self.linked_projectiles = {}
end

ProjectileLinkerExtension.extensions_ready = function (self)
	return
end

ProjectileLinkerExtension.link_projectile = function (self, projectile_unit, offset_position, rotation, actor_node)
	local owner_unit = self._owner_unit
	local world = self._world
	local hit_node_rot = Unit.world_rotation(owner_unit, actor_node)
	local local_rot = Quaternion.multiply(Quaternion.inverse(hit_node_rot), rotation)

	World.link_unit(world, projectile_unit, 0, owner_unit, actor_node)
	Unit.set_local_position(projectile_unit, 0, offset_position)
	Unit.set_local_rotation(projectile_unit, 0, local_rot)
	World.update_unit(world, projectile_unit)

	self.linked_projectiles[#self.linked_projectiles + 1] = projectile_unit
end

ProjectileLinkerExtension.unlink_projectile = function (self, projectile_unit)
	if not Unit.alive(projectile_unit) then
		return
	end

	local index = table.index_of(self.linked_projectiles, projectile_unit)

	if index == -1 then
		return
	end

	local world = self._world

	World.unlink_unit(world, projectile_unit)

	if Unit.find_actor(projectile_unit, "throw") then
		Unit.create_actor(projectile_unit, "throw")
	end

	Unit.set_local_position(projectile_unit, 0, Unit.world_position(projectile_unit, 0))
	Unit.set_local_rotation(projectile_unit, 0, Unit.world_rotation(projectile_unit, 0))
	World.update_unit(world, projectile_unit)
	table.remove(self.linked_projectiles, table.index_of(self.linked_projectiles, projectile_unit))
end

ProjectileLinkerExtension.destroy = function (self)
	return
end

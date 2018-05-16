ProjectileLinkerExtension = class(ProjectileLinkerExtension)

ProjectileLinkerExtension.init = function (self, extension_init_context, unit, extension_init_data)
	self.world = extension_init_context.world
	self.unit = unit
	self.linked_projectiles = {}
end

ProjectileLinkerExtension.extensions_ready = function (self)
	return
end

ProjectileLinkerExtension.link_projectile = function (self, projectile_unit, offset_position, rotation, actor_node)
	local unit = self.unit
	local hit_node_rot = Unit.world_rotation(unit, actor_node)
	local local_rot = Quaternion.multiply(Quaternion.inverse(hit_node_rot), rotation)

	World.link_unit(self.world, projectile_unit, 0, unit, actor_node)
	Unit.set_local_position(projectile_unit, 0, offset_position)
	Unit.set_local_rotation(projectile_unit, 0, local_rot)
	World.update_unit(self.world, projectile_unit)

	self.linked_projectiles[#self.linked_projectiles + 1] = projectile_unit
end

ProjectileLinkerExtension.destroy = function (self)
	return
end

return

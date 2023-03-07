HitReactionSystem = class(HitReactionSystem, ExtensionSystemBase)
local extensions = {
	"GenericHitReactionExtension"
}

HitReactionSystem.init = function (self, entity_system_creation_context, system_name)
	HitReactionSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	self.unit_extensions = {}
	self.frozen_unit_extensions = {}
end

HitReactionSystem.destroy = function (self)
	return
end

HitReactionSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local extension = ScriptUnit.add_extension(self.extension_init_context, unit, extension_name, self.NAME, extension_init_data)
	self.unit_extensions[unit] = extension

	return extension
end

HitReactionSystem.extensions_ready = function (self, world, unit, extension_name)
	return
end

HitReactionSystem.on_remove_extension = function (self, unit, extension_name)
	self.frozen_unit_extensions[unit] = nil

	self:_cleanup_extension(unit, extension_name)
	ScriptUnit.remove_extension(unit, self.NAME)
end

HitReactionSystem.on_freeze_extension = function (self, unit, extension_name)
	local extension = self.unit_extensions[unit]

	fassert(extension, "Unit was already frozen.")

	if extension == nil then
		return
	end

	self.frozen_unit_extensions[unit] = extension

	self:_cleanup_extension(unit, extension_name)
end

HitReactionSystem._cleanup_extension = function (self, unit, extension_name)
	self.unit_extensions[unit] = nil
end

HitReactionSystem.freeze = function (self, unit, extension_name, reason)
	fassert(self.frozen_unit_extensions[unit] == nil, "Tried to freeze an already frozen unit.")

	local extension = self.unit_extensions[unit]

	fassert(extension, "Unit to freeze didn't have unfrozen extension")

	self.unit_extensions[unit] = nil
	self.frozen_unit_extensions[unit] = extension
end

HitReactionSystem.unfreeze = function (self, unit)
	local extension = self.frozen_unit_extensions[unit]

	fassert(extension, "Unit to unfreeze didn't have frozen extension")

	self.frozen_unit_extensions[unit] = nil
	self.unit_extensions[unit] = extension

	extension:unfreeze()
end

HitReactionSystem.hot_join_sync = function (self, sender)
	return
end

HitReactionSystem.update = function (self, context, t)
	local dt = context.dt

	for unit, extension in pairs(self.unit_extensions) do
		extension:update(unit, nil, dt, context, t)
	end
end

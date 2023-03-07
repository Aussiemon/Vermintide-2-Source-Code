WhereaboutsSystem = class(WhereaboutsSystem, ExtensionSystemBase)
local extensions = {
	"PlayerWhereaboutsExtension",
	"LureWhereaboutsExtension"
}

WhereaboutsSystem.init = function (self, context, system_name)
	WhereaboutsSystem.super.init(self, context, system_name, extensions)

	local world = context.world
end

WhereaboutsSystem.destroy = function (self)
	return
end

WhereaboutsSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local extension = WhereaboutsSystem.super.on_add_extension(self, world, unit, extension_name, extension_init_data)

	return extension
end

WhereaboutsSystem.extensions_ready = function (self, world, unit, extension_name)
	return
end

WhereaboutsSystem.hot_join_sync = function (self, sender, player)
	return
end

WhereaboutsSystem.update = function (self, context, t)
	WhereaboutsSystem.super.update(self, context, t)
end

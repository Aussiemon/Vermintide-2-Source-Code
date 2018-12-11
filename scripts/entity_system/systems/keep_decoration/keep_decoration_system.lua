require("scripts/settings/keep_decoration_settings")
require("scripts/unit_extensions/level/keep_decoration_painting_extension")

KeepDecorationSystem = class(KeepDecorationSystem, ExtensionSystemBase)
local extensions = {
	"KeepDecorationPaintingExtension"
}

KeepDecorationSystem.init = function (self, entity_system_creation_context, system_name)
	KeepDecorationSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	self._extensions = {}
	self._unit_extensions = {}
	self._used_settings_keys = {}
	self._used_backend_keys = {}
	self._update_index = 0
end

KeepDecorationSystem.destroy = function (self)
	self._extensions = nil
	self._unit_extensions = nil
end

KeepDecorationSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data, ...)
	local settings_key = Unit.get_data(unit, "decoration_settings_key")
	local used_settings_keys = self._used_settings_keys
	local used_backend_keys = self._used_backend_keys

	fassert(not used_settings_keys[settings_key], "Multiple units has the same decoration_settings_key \"" .. tostring(settings_key) .. "\". Fix it in the unit data!")

	local settings = KeepDecorationSettings[settings_key]

	fassert(settings, "No settings found for decoration_settings_key \"" .. tostring(settings_key) .. "\". Fix it in keep_decoration_settings.lua!")

	local backend_key = settings.backend_key

	fassert(not used_backend_keys[backend_key], "Multiple decoration settings has the same backend_key \"" .. tostring(backend_key) .. "\". Fix it in keep_decoration_settings.lua!")

	local extension = KeepDecorationSystem.super.on_add_extension(self, world, unit, extension_name, extension_init_data, ...)
	self._extensions[#self._extensions + 1] = extension
	self._unit_extensions[unit] = extension
	self._used_settings_keys[settings_key] = true
	self._used_backend_keys[backend_key] = true

	return extension
end

KeepDecorationSystem.update = function (self, context, t)
	local extensions = self._extensions
	local num_extensions = #extensions

	if num_extensions == 0 then
		return
	end

	local update_index = self._update_index + 1

	if num_extensions < update_index then
		update_index = 1
	end

	local extension_to_update = extensions[update_index]

	extension_to_update:distributed_update()

	self._update_index = update_index
end

KeepDecorationSystem.hot_join_sync = function (self)
	return
end

return

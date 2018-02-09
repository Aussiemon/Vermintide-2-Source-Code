require("scripts/unit_extensions/default_player_unit/cosmetic/player_unit_cosmetic_extension")

CosmeticSystem = class(CosmeticSystem, ExtensionSystemBase)
local RPCS = {}
local extension_list = {
	"PlayerUnitCosmeticExtension"
}
CosmeticSystem.init = function (self, entity_system_creation_context, system_name)
	CosmeticSystem.super.init(self, entity_system_creation_context, system_name, extension_list)

	self.profile_synchronizer = entity_system_creation_context.profile_synchronizer

	return 
end
CosmeticSystem.destroy = function (self)
	return 
end
CosmeticSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	extension_init_data.is_server = self.is_server

	return CosmeticSystem.super.on_add_extension(self, world, unit, extension_name, extension_init_data)
end

return 

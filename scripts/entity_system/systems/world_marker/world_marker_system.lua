require("scripts/unit_extensions/world_markers/player_equipment_world_marker_extension")
require("scripts/unit_extensions/world_markers/store_world_marker_extension")

WorldMarkerSystem = class(WorldMarkerSystem, ExtensionSystemBase)
local extensions = {
	"PlayerEquipmentWorldMarkerExtension",
	"StoreWorldMarkerExtension"
}

WorldMarkerSystem.init = function (self, entity_system_creation_context, system_name)
	self.super.init(self, entity_system_creation_context, system_name, extensions)
end

WorldMarkerSystem.destroy = function (self)
	return
end

require("scripts/unit_extensions/weapons/projectiles/projectile_impact/projectile_base_impact_unit_extension")
require("scripts/unit_extensions/weapons/projectiles/projectile_impact/projectile_raycast_impact_unit_extension")
require("scripts/unit_extensions/weapons/projectiles/projectile_impact/player_projectile_impact_unit_extension")

ProjectileImpactSystem = class(ProjectileImpactSystem, ExtensionSystemBase)
local RPCS = {}
local extensions = {
	"ProjectileBaseImpactUnitExtension",
	"ProjectileRaycastImpactUnitExtension",
	"PlayerProjectileImpactUnitExtension"
}

ProjectileImpactSystem.init = function (self, entity_system_creation_context, system_name)
	ProjectileImpactSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	local network_event_delegate = entity_system_creation_context.network_event_delegate
	self.network_event_delegate = network_event_delegate

	network_event_delegate:register(self, unpack(RPCS))

	self.network_transmit = Managers.state.network.network_transmit
end

ProjectileImpactSystem.destroy = function (self)
	self.network_event_delegate:unregister(self)

	self.network_event_delegate = nil
	self.network_transmit = nil
end

return

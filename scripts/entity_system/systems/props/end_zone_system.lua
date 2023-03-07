EndZoneSystem = class(EndZoneSystem, ExtensionSystemBase)
local extensions = {
	"EndZoneExtension"
}

EndZoneSystem.init = function (self, entity_system_creation_context, system_name)
	PropsSystem.super.init(self, entity_system_creation_context, system_name, extensions)
end

EndZoneSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	return PropsSystem.super.on_add_extension(self, world, unit, extension_name, extension_init_data)
end

EndZoneSystem.on_remove_extension = function (self, unit, extension_name)
	PropsSystem.super.on_remove_extension(self, unit, extension_name)
end

EndZoneSystem.update = function (self, context, t)
	PropsSystem.super.update(self, context, t)
end

EndZoneSystem.activate_end_zone_by_name = function (self, name)
	if not Managers.player.is_server then
		return
	end

	local units = Managers.state.entity:get_entities("EndZoneExtension")
	local get_data = Unit.get_data

	for unit, end_zone_extension in pairs(units) do
		local ez_name = get_data(unit, "activation_name")

		if ez_name and ez_name == name then
			local position = Unit.world_position(unit, 0)
			local unit_name = "units/hub_elements/objective_unit"
			local objective_unit = Managers.state.unit_spawner:spawn_network_unit(unit_name, "objective_unit", nil, position)
			local objective_unit_extension = ScriptUnit.extension(objective_unit, "tutorial_system")

			objective_unit_extension:set_active(true)
			end_zone_extension:activation_allowed(true)
		end
	end
end

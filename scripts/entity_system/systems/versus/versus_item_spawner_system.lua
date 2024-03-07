-- chunkname: @scripts/entity_system/systems/versus/versus_item_spawner_system.lua

require("scripts/settings/dlcs/carousel/carousel_objective_unit_templates")
require("scripts/entity_system/systems/objective/objective_item_spawner_system")

VersusItemSpawnerSystem = class(VersusItemSpawnerSystem, ObjectiveItemSpawnerSystem)

local extensions = {}

VersusItemSpawnerSystem.init = function (self, entity_system_creation_context, system_name)
	VersusItemSpawnerSystem.super.init(self, entity_system_creation_context, system_name, extensions)
end

VersusItemSpawnerSystem._get_unit_template = function (self, unit)
	local spawn_id = Unit.get_data(unit, "versus_objective_id")
	local unit_template_name = Unit.get_data(unit, "versus_unit_template")
	local versus_unit_template = CarouselObjectiveUnitTemplates[unit_template_name]

	return spawn_id, versus_unit_template
end

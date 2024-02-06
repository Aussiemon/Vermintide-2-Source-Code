-- chunkname: @scripts/entity_system/systems/weaves/weave_item_spawner_system.lua

require("scripts/settings/weave_unit_templates")
require("scripts/entity_system/systems/objective/objective_item_spawner_system")

WeaveItemSpawnerSystem = class(WeaveItemSpawnerSystem, ObjectiveItemSpawnerSystem)

local extensions = {}

WeaveItemSpawnerSystem.init = function (self, entity_system_creation_context, system_name)
	WeaveItemSpawnerSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	self._item_spawners = {
		kill_enemies = {
			unit_template = WeaveUnitTemplates.weave_kill_enemies,
		},
	}
	self._spawned_items = {}
end

WeaveItemSpawnerSystem._get_unit_template = function (self, unit)
	local spawn_id = Unit.get_data(unit, "weave_objective_id")
	local unit_template_name = Unit.get_data(unit, "weave_unit_template")
	local unit_template = WeaveUnitTemplates[unit_template_name]

	return spawn_id, unit_template
end

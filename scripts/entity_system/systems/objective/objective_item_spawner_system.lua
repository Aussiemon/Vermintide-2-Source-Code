-- chunkname: @scripts/entity_system/systems/objective/objective_item_spawner_system.lua

require("scripts/settings/objective_unit_templates")

ObjectiveItemSpawnerSystem = class(ObjectiveItemSpawnerSystem, ExtensionSystemBase)

ObjectiveItemSpawnerSystem.init = function (self, entity_system_creation_context, system_name, extensions)
	ObjectiveItemSpawnerSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	self._item_spawners = {}
	self._spawned_items = {}

	local static_item_spawners = Managers.state.game_mode:setting("static_objective_item_spawners")

	if static_item_spawners then
		for spawn_id, spawner_data in pairs(static_item_spawners) do
			self._item_spawners[spawn_id] = spawner_data
		end
	end

	self._spawn_id = ""
	self._unit_template_id = ""
end

ObjectiveItemSpawnerSystem.item_gizmo_spawned = function (self, unit)
	local unit_template, spawn_id = self:template_by_unit(unit)

	fassert(unit_template, "[ObjectiveItemSpawnerSystem] All item spawners need a unit template")

	self._item_spawners[spawn_id] = {
		unit = unit,
		unit_template = unit_template,
	}
end

ObjectiveItemSpawnerSystem.template_by_unit = function (self, unit)
	local spawn_id = Unit.get_data(unit, "objective_id")
	local unit_template_name = Unit.get_data(unit, "unit_template")

	spawn_id = spawn_id or Unit.get_data(unit, "versus_objective_id") or Unit.get_data(unit, "weave_objective_id")
	unit_template_name = unit_template_name or Unit.get_data(unit, "versus_unit_template") or Unit.get_data(unit, "weave_unit_template")

	local unit_template = ObjectiveUnitTemplates[unit_template_name]

	return unit_template, spawn_id
end

ObjectiveItemSpawnerSystem.spawn_item = function (self, objective_name, objective_data)
	local item_spawner_data = self._item_spawners[objective_name]

	if item_spawner_data then
		local spawned_unit, game_object_id = self:_trigger_spawn(item_spawner_data, objective_name, objective_data)

		if spawned_unit then
			self._spawned_items[objective_name] = {
				unit = spawned_unit,
				game_object_id = game_object_id,
			}
		end
	end
end

ObjectiveItemSpawnerSystem._trigger_spawn = function (self, item_spawner_data, objective_id, objective_data)
	local item_spawner_unit = item_spawner_data.unit
	local item_spawner_template = item_spawner_data.unit_template
	local position = item_spawner_unit and Unit.local_position(item_spawner_unit, 0) or Vector3(0, 0, 0)
	local rotation = item_spawner_unit and Unit.local_rotation(item_spawner_unit, 0) or Quaternion(Vector3(0, 0, 0), -1)
	local extension_init_data = item_spawner_template.create_extension_init_data_func(objective_id, objective_data, item_spawner_unit)
	local spawned_unit, go_id = self:_spawn_unit(item_spawner_template, extension_init_data, position, rotation)

	return spawned_unit, go_id
end

ObjectiveItemSpawnerSystem._spawn_unit = function (self, item_spawner_template, extension_init_data, position, rotation)
	local unit_template_name = item_spawner_template.unit_template_name
	local unit_name = item_spawner_template.unit_name
	local spawned_unit, game_object_id = Managers.state.unit_spawner:spawn_network_unit(unit_name, unit_template_name, extension_init_data, position, rotation)

	return spawned_unit, game_object_id
end

ObjectiveItemSpawnerSystem.destroy_objective = function (self, objective_id)
	local objective_data = self._spawned_items[objective_id]

	if objective_data then
		Managers.state.unit_spawner:mark_for_deletion(objective_data.unit)
	end
end

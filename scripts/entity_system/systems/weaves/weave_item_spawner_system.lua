require("scripts/settings/weave_unit_templates")

WeaveItemSpawnerSystem = class(WeaveItemSpawnerSystem, ExtensionSystemBase)
local extensions = {}

WeaveItemSpawnerSystem.init = function (self, entity_system_creation_context, system_name)
	WeaveItemSpawnerSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	self._weave_item_spawners = {
		kill_enemies = {
			weave_unit_template = WeaveUnitTemplates.weave_kill_enemies
		}
	}
	self._spawned_items = {}
end

WeaveItemSpawnerSystem.item_gizmo_spawned = function (self, unit)
	local spawn_id = Unit.get_data(unit, "weave_objective_id")
	local weave_unit_template_name = Unit.get_data(unit, "weave_unit_template")
	local weave_unit_template = WeaveUnitTemplates[weave_unit_template_name]

	fassert(weave_unit_template, "[WeaveItemSpawnerSystem] All weave item spawners need a weave unit template")

	self._weave_item_spawners[spawn_id] = {
		unit = unit,
		weave_unit_template = weave_unit_template
	}
end

WeaveItemSpawnerSystem.spawn_items = function (self, spawn_ids)
	for spawn_id, weave_objective_data in pairs(spawn_ids) do
		local item_spawner_data = self._weave_item_spawners[spawn_id]

		if item_spawner_data then
			local spawned_unit, game_object_id = self:_trigger_spawn(item_spawner_data, spawn_id, weave_objective_data)

			if spawned_unit then
				self._spawned_items[spawn_id] = {
					unit = spawned_unit,
					game_object_id = game_object_id
				}
			end
		end
	end
end

WeaveItemSpawnerSystem._trigger_spawn = function (self, item_spawner_data, weave_objective_id, weave_objective_data)
	local item_spawner_unit = item_spawner_data.unit
	local item_spawner_template = item_spawner_data.weave_unit_template
	local position = (item_spawner_unit and Unit.local_position(item_spawner_unit, 0)) or Vector3(0, 0, 0)
	local rotation = (item_spawner_unit and Unit.local_rotation(item_spawner_unit, 0)) or Quaternion(Vector3(0, 0, 0), -1)
	local extension_init_data = item_spawner_template.create_extension_init_data_func(weave_objective_id, weave_objective_data, item_spawner_unit)
	local spawned_unit, weave_go_id = self:_spawn_unit(item_spawner_template, extension_init_data, position, rotation)

	return spawned_unit, weave_go_id
end

WeaveItemSpawnerSystem._spawn_unit = function (self, item_spawner_template, extension_init_data, position, rotation)
	local unit_template_name = item_spawner_template.unit_template_name
	local unit_name = item_spawner_template.unit_name
	local spawned_unit, game_object_id = Managers.state.unit_spawner:spawn_network_unit(unit_name, unit_template_name, extension_init_data, position, rotation)

	return spawned_unit, game_object_id
end

WeaveItemSpawnerSystem.destroy_objective = function (self, weave_objective_id)
	local objective_data = self._spawned_items[weave_objective_id]

	if objective_data then
		Managers.state.unit_spawner:mark_for_deletion(objective_data.unit)
	end
end

return

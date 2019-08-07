require("scripts/settings/weave_objective_settings")

WeaveObjectiveSystem = class(WeaveObjectiveSystem, ExtensionSystemBase)
local extensions = {
	"WeaveCapturePointExtension",
	"WeaveTargetExtension",
	"WeaveItemExtension",
	"WeaveLimitedItemSpawnerExtension",
	"WeaveDoomWheelExtension",
	"WeaveInteractionExtension",
	"WeaveKillEnemiesExtension",
	"WeaveSocketExtension"
}

WeaveObjectiveSystem.init = function (self, entity_system_creation_context, system_name)
	WeaveObjectiveSystem.super.init(self, entity_system_creation_context, system_name, extensions)

	self._game_session = Network.game_session()
	self._entity_system_creation_context = entity_system_creation_context
	self._is_server = entity_system_creation_context.is_server
	self._world = entity_system_creation_context.world
	self._current_objective_index = 1
	self._objectives_by_name = {}
	self._update_list = {}
	self._activated = false
	self._spawn_essence_units = true
	self._objectives_completed = 0
	self._num_objectives = 0
	self._weave_manager = Managers.weave
	self._initial_activation_done = false
	self._essence_unit_names = {
		"units/fx/essence_unit",
		"units/fx/essence_unit"
	}
	self._essence_sound_events = {
		"Play_hud_wind_collect_essence",
		"Play_hud_wind_collect_essence_chunk"
	}
	self._essence_unit_data = {}

	for i = 1, 20, 1 do
		self._essence_unit_data[i] = {}
	end

	self._essence_life_time = 3
	self._collecting_essence = false
end

WeaveObjectiveSystem.activate_objectives = function (self, objective_lists)
	if self._is_server then
		self:_server_activate_objectives(objective_lists)
	else
		self:_client_activate_objectives(objective_lists)
	end
end

WeaveObjectiveSystem._server_activate_objectives = function (self, objective_lists)
	fassert(self._is_server, "[WeaveObjectiveSystem] Only the server should call _server_activate_objectives")

	self._activated = true
	local num_objectives = 0

	for _, objective_list in ipairs(objective_lists) do
		for objective_name, objective_data in pairs(objective_list) do
			num_objectives = num_objectives + 1
		end
	end

	self._num_objectives = num_objectives
	self._objective_lists = objective_lists
	local current_objectives = self._objective_lists[self._current_objective_index]

	self:_activate_next_objectives(current_objectives)
end

WeaveObjectiveSystem._client_activate_objectives = function (self, objective_lists)
	local update_list = self._update_list

	if not update_list then
		return
	end

	for go_id, extension in pairs(update_list) do
		extension:activate(go_id)
	end

	self._initial_activation_done = true
end

WeaveObjectiveSystem._activate_next_objectives = function (self, objectives)
	local weave_item_spawner_system = Managers.state.entity:system("weave_item_spawner_system")

	weave_item_spawner_system:spawn_items(objectives)

	for objective_name, objective_data in pairs(objectives) do
		local objective_extension = self._objectives_by_name[objective_name]

		fassert(objective_extension, "[WeaveObjectiveSystem] There is no objective called %q in the current level", objective_name)

		if objective_extension.activate then
			objective_extension:activate(nil, objective_data)
		end

		local audio_system = Managers.state.entity:system("audio_system")

		audio_system:play_2d_audio_event("Play_hud_wind_objective_start")

		self._update_list[#self._update_list + 1] = objective_extension
	end
end

WeaveObjectiveSystem.on_add_extension = function (self, world, unit, extension_name, extension_init_data)
	local extension_alias = self.NAME
	local extension_pool_table = nil
	local extension = ScriptUnit.add_extension(self.extension_init_context, unit, extension_name, extension_alias, extension_init_data, extension_pool_table)
	self.extensions[extension_name] = (self.extensions[extension_name] or 0) + 1
	local objective_name = extension:objective_name()
	self._objectives_by_name[objective_name] = extension

	return extension
end

WeaveObjectiveSystem.update = function (self, context, t)
	local dt = context.dt

	if self._is_server then
		self:_update_server(dt, t)
	else
		self:_update_client(dt, t)
	end
end

WeaveObjectiveSystem._update_server = function (self, dt, t)
	self:_collect_dropped_essence(dt)

	if not self._activated then
		return
	end

	local update_list = self._update_list

	for _, extension in ipairs(update_list) do
		extension:update(dt, t)
	end

	local objects_to_remove = {}

	for idx, extension in ipairs(update_list) do
		if extension:is_done() then
			self:_complete_objective(idx, extension, objects_to_remove)
		end
	end

	if #objects_to_remove == 0 then
		return
	end

	for i = #objects_to_remove, 1, -1 do
		local index = objects_to_remove[i]

		table.remove(self._update_list, index)
	end

	local only_kill_objective_left = #self._update_list == 1 and self._update_list[1]:objective_name() == "kill_enemies"

	if #self._update_list == 0 or only_kill_objective_left then
		local next_objective_index = self._current_objective_index + 1
		local next_objectives = self._objective_lists[next_objective_index]
		local mission_system = Managers.state.entity:system("mission_system")
		local active_missions = mission_system:get_missions()

		if active_missions and active_missions.weave_collect_limited_item_objective then
			mission_system:end_mission("weave_collect_limited_item_objective", true)
		end

		if next_objectives then
			table.clear(self._update_list)
			self:_activate_next_objectives(next_objectives)

			self._current_objective_index = next_objective_index
		elseif not only_kill_objective_left then
			self._activated = false
		end
	end
end

WeaveObjectiveSystem._complete_objective = function (self, id, extension, objects_to_remove)
	local objective_name = extension:objective_name()

	self._weave_manager:increase_bar_score(extension:get_score())
	extension:complete()

	if not extension.keep_alive then
		local weave_item_spawner_system = Managers.state.entity:system("weave_item_spawner_system")

		weave_item_spawner_system:destroy_objective(objective_name)
	end

	objects_to_remove[#objects_to_remove + 1] = id
end

WeaveObjectiveSystem._update_client = function (self, dt, t)
	self:_collect_dropped_essence(dt)

	for _, extension in pairs(self._update_list) do
		extension:update(dt, t)
	end
end

WeaveObjectiveSystem.current_objectives = function (self)
	return self._update_list
end

WeaveObjectiveSystem.game_object_created = function (self, game_object_id)
	local game_session = Network.game_session()

	if game_session then
		local objective_name_id = GameSession.game_object_field(game_session, game_object_id, "objective_name")
		local objective_name = NetworkLookup.weave_objective_names[objective_name_id]
		local extension = self._objectives_by_name[objective_name]

		if not extension then
			return
		end

		if self._initial_activation_done then
			extension:activate(game_object_id)
		end

		self._update_list[game_object_id] = extension
	end
end

WeaveObjectiveSystem.game_object_destroyed = function (self, game_object_id)
	local extension = self._update_list[game_object_id]

	extension:deactivate()

	self._deactivated_objective = true
	self._update_list[game_object_id] = nil
end

WeaveObjectiveSystem.destroy = function (self)
	return
end

WeaveObjectiveSystem.deactivate = function (self)
	local objects_to_remove = {}
	self._spawn_essence_units = false

	for idx, extension in pairs(self._update_list) do
		if extension.should_disable and extension:should_disable() then
			extension:disable()
		else
			extension:deactivate()

			if not extension.keep_alive then
				local objective_name = extension:objective_name()
				local weave_item_spawner_system = Managers.state.entity:system("weave_item_spawner_system")

				weave_item_spawner_system:destroy_objective(objective_name)
			end

			objects_to_remove[#objects_to_remove + 1] = idx
		end
	end

	for i = #objects_to_remove, 1, -1 do
		local index = objects_to_remove[i]

		table.remove(self._update_list, index)
	end

	local essence_unit_data = self._essence_unit_data

	for i = 1, #essence_unit_data, 1 do
		local data = essence_unit_data[i]
		local unit = data.unit

		if Unit.alive(unit) then
			Managers.state.unit_spawner:mark_for_deletion(unit)
			table.clear(data)
		end
	end
end

WeaveObjectiveSystem.hot_join_sync = function (self, sender)
	return
end

WeaveObjectiveSystem.add_score = function (self, score)
	self._weave_manager:increase_bar_score(score)
end

WeaveObjectiveSystem.on_ai_killed = function (self, killed_unit, killer_unit, death_data, killing_blow)
	local update_list = self._update_list
	local killed_unit_position = POSITION_LOOKUP[killed_unit]

	self:spawn_essence_unit(killed_unit_position + Vector3(0, 0, 0.2))

	for _, extension in pairs(update_list) do
		if extension.on_ai_killed then
			extension:on_ai_killed(killed_unit, killer_unit, death_data, killing_blow)
		end
	end
end

WeaveObjectiveSystem.spawn_essence_unit = function (self, position, size)
	local essence_unit_data = self._essence_unit_data
	local index = nil

	for i = 1, #essence_unit_data, 1 do
		local data = essence_unit_data[i]
		local unit = data.unit

		if not Unit.alive(unit) then
			index = i

			break
		end
	end

	if not self._spawn_essence_units or not index then
		return
	end

	local essence_unit_name = self._essence_unit_names[size or 1]
	local essence_unit = Managers.state.unit_spawner:spawn_local_unit(essence_unit_name, position, Quaternion.identity())
	local data = self._essence_unit_data[index]
	data.unit = essence_unit
	data.life_time = self._essence_life_time
	data.spawn_pos = Vector3Box(position)
	data.right_vector_multiplier = 1 - math.random() * 2
	data.forward_vector_multiplier = 1 - math.random() * 2
	data.sound_event = self._essence_sound_events[size or 1]
end

WeaveObjectiveSystem._collect_dropped_essence = function (self, dt)
	local local_player_unit = Managers.player:local_player().player_unit

	if not local_player_unit then
		return
	end

	local unit_spawner = Managers.state.unit_spawner
	local player_position = POSITION_LOOKUP[local_player_unit] + Vector3(0, 0, 0.5)
	local up_vector = Vector3.up()
	local right_vector = Vector3.right()
	local forward_vector = Vector3.forward()
	local essence_rest_time = 0
	local collect_essence_time = 0.8
	local essence_unit_data = self._essence_unit_data
	local unit_alive = Unit.alive

	for i = 1, #essence_unit_data, 1 do
		local data = essence_unit_data[i]
		local unit = data.unit

		if unit_alive(unit) then
			local unit_position = POSITION_LOOKUP[unit]
			local distance = Vector3.distance(unit_position, player_position)
			local remaining_time = data.life_time - dt

			if remaining_time <= 0 or distance <= 1 then
				unit_spawner:mark_for_deletion(unit)

				if data.sound_event then
					local wwise_world = Managers.world:wwise_world(self._world)

					WwiseWorld.trigger_event(wwise_world, data.sound_event)
				end

				table.clear(data)
			else
				if remaining_time <= collect_essence_time then
					local direction_vector = Vector3.normalize(player_position - unit_position)
					local move_vector = direction_vector * dt * math.max(30, distance / (collect_essence_time / 2))
					local new_position = unit_position + move_vector

					Unit.set_local_position(unit, 0, new_position)
				elseif remaining_time >= collect_essence_time + essence_rest_time then
					local time = (remaining_time - collect_essence_time - essence_rest_time) / (self._essence_life_time - collect_essence_time - essence_rest_time)
					local value = 1 - math.easeInCubic(time)
					local spawn_pos = data.spawn_pos:unbox()
					local up = up_vector * 2 * value
					local right = right_vector * data.right_vector_multiplier * (1 - time)
					local forward = forward_vector * data.forward_vector_multiplier * (1 - time)
					local offset = up + right + forward
					local new_position = spawn_pos + offset

					Unit.set_local_position(unit, 0, new_position)
				end

				data.life_time = remaining_time
			end
		end
	end
end

return

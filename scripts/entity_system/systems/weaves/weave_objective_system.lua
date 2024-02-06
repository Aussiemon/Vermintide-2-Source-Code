﻿-- chunkname: @scripts/entity_system/systems/weaves/weave_objective_system.lua

require("scripts/entity_system/systems/objective/objective_system")
require("scripts/settings/weave_objective_settings")

WeaveObjectiveSystem = class(WeaveObjectiveSystem, ObjectiveSystem)

local extensions = {
	"WeaveCapturePointExtension",
	"WeaveTargetExtension",
	"WeaveItemExtension",
	"WeaveLimitedItemSpawnerExtension",
	"WeaveDoomWheelExtension",
	"WeaveInteractionExtension",
	"WeaveKillEnemiesExtension",
	"WeaveSocketExtension",
}

WeaveObjectiveSystem.init = function (self, entity_system_creation_context, system_name)
	self.super.init(self, entity_system_creation_context, system_name, extensions)

	self._item_spawner = Managers.state.entity:system("weave_item_spawner_system")
	self._spawn_essence_units = true
	self._weave_manager = Managers.weave
	self._essence_unit_names = {
		"units/fx/essence_unit",
		"units/fx/essence_unit",
	}
	self._essence_sound_events = {
		"Play_hud_wind_collect_essence",
		"Play_hud_wind_collect_essence_chunk",
	}
	self._essence_unit_data = {}

	for i = 1, 20 do
		self._essence_unit_data[i] = {}
	end

	self._essence_life_time = 3
	self._collecting_essence = false
end

WeaveObjectiveSystem._activate_objectives = function (self, objectives)
	self.super._activate_objectives(self, objectives)

	for _, _ in pairs(objectives) do
		local audio_system = Managers.state.entity:system("audio_system")

		audio_system:play_2d_audio_event("Play_hud_wind_objective_start")
	end
end

WeaveObjectiveSystem.update = function (self, context, t)
	local dt = context.dt

	self:_collect_dropped_essence(dt)

	if not self._activated then
		return
	end

	self.super.update(self, context, t)
end

WeaveObjectiveSystem._update_activate_objectives = function (self)
	local num_update_list = #self._main_objectives
	local only_kill_objective_left = num_update_list == 1 and self._main_objectives[1]:objective_name() == "kill_enemies"

	if num_update_list == 0 or only_kill_objective_left then
		local next_objective_index = self._current_objective_index + 1
		local next_objectives = self._objective_lists[next_objective_index]
		local mission_system = Managers.state.entity:system("mission_system")
		local active_missions = mission_system:get_missions()

		if active_missions and active_missions.weave_collect_limited_item_objective then
			mission_system:end_mission("weave_collect_limited_item_objective", true)
		end

		if next_objectives then
			table.clear(self._main_objectives)
			self:_activate_objectives(next_objectives)

			self._current_objective_index = next_objective_index
		elseif not only_kill_objective_left then
			self._activated = false
		end
	end
end

WeaveObjectiveSystem._complete_objective = function (self, id, extension, objects_to_remove)
	self._weave_manager:increase_bar_score(extension:get_score())
	self.super._complete_objective(self, id, extension, objects_to_remove)
end

WeaveObjectiveSystem.deactivate = function (self)
	self.super.deactivate(self)

	local essence_unit_data = self._essence_unit_data

	for i = 1, #essence_unit_data do
		local data = essence_unit_data[i]
		local unit = data.unit

		if Unit.alive(unit) then
			Managers.state.unit_spawner:mark_for_deletion(unit)
			table.clear(data)
		end
	end
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

		self._current_objective_index = self._num_completed_main_objectives + 1

		if self._initial_activation_done then
			extension:activate(game_object_id)
		end

		self._main_objectives[game_object_id] = extension
		self._current_num_sub_objectives = self._current_num_sub_objectives + 1

		if extension.is_optional and extension:is_optional() then
			self._current_num_optional_sub_objectives = self._current_num_optional_sub_objectives + 1
		end
	end
end

WeaveObjectiveSystem.add_score = function (self, score)
	self._weave_manager:increase_bar_score(score)
end

WeaveObjectiveSystem.on_ai_killed = function (self, killed_unit, killer_unit, death_data, killing_blow)
	local update_list = self._main_objectives

	if not death_data or not death_data.despawned then
		local killed_unit_position = POSITION_LOOKUP[killed_unit]

		self:spawn_essence_unit(killed_unit_position + Vector3(0, 0, 0.2))
	end

	for _, extension in pairs(update_list) do
		if extension.on_ai_killed then
			extension:on_ai_killed(killed_unit, killer_unit, death_data, killing_blow)
		end
	end
end

WeaveObjectiveSystem.spawn_essence_unit = function (self, position, size)
	local essence_unit_data = self._essence_unit_data
	local index

	for i = 1, #essence_unit_data do
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
	local local_player = Managers.player:local_player()

	if not local_player or not local_player.player_unit then
		return
	end

	local local_player_unit = local_player.player_unit
	local unit_spawner = Managers.state.unit_spawner
	local player_position = POSITION_LOOKUP[local_player_unit] + Vector3(0, 0, 0.5)
	local up_vector = Vector3.up()
	local right_vector = Vector3.right()
	local forward_vector = Vector3.forward()
	local essence_rest_time = 0
	local collect_essence_time = 0.8
	local essence_unit_data = self._essence_unit_data
	local unit_alive = Unit.alive

	for i = 1, #essence_unit_data do
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

WeaveObjectiveSystem.only_kill_objective = function (self)
	local num_update_list = #self._main_objectives
	local current_objective_name = self._main_objectives[1]:objective_name()
	local only_kill_objective_left = num_update_list == 1 and current_objective_name == "kill_enemies"

	return only_kill_objective_left
end

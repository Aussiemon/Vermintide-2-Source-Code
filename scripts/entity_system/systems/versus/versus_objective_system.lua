-- chunkname: @scripts/entity_system/systems/versus/versus_objective_system.lua

require("scripts/entity_system/systems/objective/objective_system")
require("scripts/settings/objective_templates_vs")

VersusObjectiveSystem = class(VersusObjectiveSystem, ObjectiveSystem)

local extensions = {
	"VersusVolumeObjectiveExtension",
	"VersusInteractObjectiveExtension",
	"VersusPayloadObjectiveExtension",
	"VersusSocketObjectiveExtension",
	"VersusTargetObjectiveExtension",
	"VersusMissionObjectiveExtension",
	"VersusCapturePointObjectiveExtension",
}

VersusObjectiveSystem.init = function (self, entity_system_creation_context, system_name)
	self.super.init(self, entity_system_creation_context, system_name, extensions)

	self._item_spawner = Managers.state.entity:system("versus_item_spawner_system")
end

VersusObjectiveSystem.destroy = function (self)
	self.super.destroy(self)

	self._item_spawner = nil
end

VersusObjectiveSystem.game_object_created = function (self, game_object_id)
	local game_session = Network.game_session()

	if game_session then
		self._game_object_created = true

		local objective_name_id = GameSession.game_object_field(game_session, game_object_id, "objective_name")
		local parent_objective_name_id = GameSession.game_object_field(game_session, game_object_id, "parent_objective_name")
		local objective_name = NetworkLookup.versus_objective_names[objective_name_id]
		local parent_objective_name = NetworkLookup.versus_objective_names[parent_objective_name_id]
		local extension = self._objectives_by_name[objective_name]

		if not extension then
			return
		end

		self._current_objective_index = self._num_completed_main_objectives + 1

		local is_sub_objective = parent_objective_name ~= "n/a"

		if self._initial_activation_done and self._activated then
			local objective_data

			if not is_sub_objective then
				objective_data = self._objective_lists[self._current_objective_index][objective_name]
			else
				local tree = {}
				local parent_name = parent_objective_name

				repeat
					table.insert(tree, 1, parent_name)

					parent_name = self._parent_container_lookup[parent_name]
				until parent_name == nil

				local parent_data
				local container = self._objective_lists[self._current_objective_index]

				for i = 1, #tree do
					parent_data = container[tree[i]]
					container = parent_data.sub_objectives
				end

				objective_data = parent_data.sub_objectives[objective_name]
			end

			extension:activate(game_object_id, objective_data)
		elseif extension.set_game_object_id then
			extension:set_game_object_id(game_object_id)
		end

		if is_sub_objective then
			self._sub_objectives[game_object_id] = extension
			self._current_num_sub_objectives = self._current_num_sub_objectives + 1

			if extension.is_optional and extension:is_optional() then
				self._current_num_optional_sub_objectives = self._current_num_optional_sub_objectives + 1
			end
		else
			self._main_objectives[game_object_id] = extension
		end
	end
end

VersusObjectiveSystem._complete_objective = function (self, id, extension, objects_to_remove, is_sub_objective)
	local game_mode = Managers.state.game_mode:game_mode()

	if game_mode.about_to_lose then
		return
	end

	self.super._complete_objective(self, id, extension, objects_to_remove, is_sub_objective)

	local game_mode_manager = Managers.state.game_mode
	local settings = game_mode_manager:settings()

	if settings.move_dead_players_after_objective_completed then
		local adventure_spawning = game_mode:adventure_spawning()

		adventure_spawning:set_move_dead_players_to_next_respawn(true)
	end
end

VersusObjectiveSystem._complete_main_objective = function (self, extension)
	VersusObjectiveSystem.super._complete_main_objective(self, extension)

	local parent_name = extension:get_parent_name()

	if not parent_name or parent_name == "n/a" then
		self._last_main_objective_completed = extension

		Managers.state.event:trigger("obj_main_objective_completed", self._num_completed_main_objectives, self._current_num_completed_main_objectives, extension)
	end
end

VersusObjectiveSystem.add_time = function (self, value)
	local win_conditions = Managers.mechanism:game_mechanism():win_conditions()

	win_conditions:add_time(value)
end

VersusObjectiveSystem.previous_objective_bonus_time = function (self)
	local objective = self:_get_current_objective()

	if not objective then
		return 0
	end

	return objective:get_time() or 0
end

VersusObjectiveSystem.current_objective_bonus_time = function (self)
	local objective = self:_get_current_objective()

	if not objective then
		return 0
	end

	return objective:get_time()
end

VersusObjectiveSystem.current_objective_unit = function (self)
	local objective, _, objective_data = self:_get_current_objective()

	if not objective then
		if objective_data and objective_data.unit then
			return objective_data.unit
		end

		return nil
	end

	return objective._unit
end

VersusObjectiveSystem.current_objective_description = function (self)
	local objective, _, objective_data = self:_get_current_objective()
	local description

	if objective then
		description = objective:description()
	elseif objective_data.description then
		description = objective_data.description
	end

	return description and Localize(description) or string.format("<MISSING DESCRIPTION FOR OBJECTIVE '%s'>", objective:objective_name())
end

VersusObjectiveSystem.current_objective_progress = function (self)
	local objective, objective_name, objective_data = self:_get_current_objective()
	local progress

	if objective then
		if objective.get_percentage_done then
			progress = objective:get_percentage_done()
		else
			progress = objective:is_done() and 1 or 0
		end
	elseif self._current_num_sub_objectives > 0 then
		progress = self._current_num_completed_sub_objectives / self._current_num_sub_objectives
	end

	return progress or 0
end

VersusObjectiveSystem.current_objective_icon = function (self)
	local objective, objective_name, objective_data = self:_get_current_objective()
	local objective_icon

	if objective then
		objective_icon = objective:objective_icon()
	elseif objective_data then
		objective_icon = objective_data.objective_type
	end

	objective_icon = objective_icon or "icons_placeholder"

	return objective_icon
end

VersusObjectiveSystem.current_objectives_position = function (self)
	if not self._objective_lists then
		return
	end

	local objective_list = self._objective_lists[self._current_objective_index]
	local positions = {}

	for name, data in pairs(objective_list) do
		if data.sub_objectives then
			for sub_name, sub_data in pairs(data.sub_objectives) do
				local unit = data.unit and data.unit or self._objectives_by_name[sub_name]._unit

				positions[#positions + 1] = Unit.world_position(unit, 0)
			end
		else
			local unit = data.unit and data.unit or self._objectives_by_name[name]._unit
			local position = Unit.world_position(unit, 0)

			positions[#positions + 1] = position
		end
	end

	return positions
end

VersusObjectiveSystem._get_current_objective = function (self)
	local objective_list = self._objective_lists[self._current_objective_index]
	local objective_name, objective_data = next(objective_list)
	local objective = self._objectives_by_name[objective_name]

	return objective, objective_name, objective_data
end

VersusObjectiveSystem.objective_started_telemetry = function (self, objective_id)
	local match_id = Managers.mechanism:game_mechanism():match_id()
	local objective_list = self._objective_lists[objective_id]
	local objective_name = next(objective_list)
	local game_round = Managers.mechanism:game_mechanism():total_rounds_started()

	Managers.telemetry_events:versus_objective_started(match_id, objective_id, game_round, objective_name)
end

VersusObjectiveSystem.objective_section_completed_telemetry = function (self, current_section, total_sections)
	current_section = current_section or 1
	total_sections = total_sections or 1

	local match_id = Managers.mechanism:game_mechanism():match_id()
	local objective_id = self._current_objective_index
	local objective_list = self._objective_lists[objective_id]
	local objective_name = next(objective_list)
	local game_round = Managers.mechanism:game_mechanism():total_rounds_started()

	Managers.telemetry_events:versus_objective_section_completed(match_id, objective_id, game_round, objective_name, current_section, total_sections)
end

VersusObjectiveSystem.rpc_sync_objectives = function (self, sender, total_num_main_objectives, num_completed_main_objectives, num_completed_sub_objectives, current_num_completed_sub_objectives, current_num_sub_objectives)
	VersusObjectiveSystem.super.rpc_sync_objectives(self, sender, total_num_main_objectives, num_completed_main_objectives, num_completed_sub_objectives, current_num_completed_sub_objectives, current_num_sub_objectives)

	if not self._activated and self._game_object_created then
		Managers.state.game_mode:game_mode():_start_objective()
	end

	self._current_num_completed_sub_objectives = current_num_completed_sub_objectives
	self._current_num_sub_objectives = current_num_sub_objectives
end

VersusObjectiveSystem.game_object_destroyed = function (self, game_object_id)
	local game_mode_manager = Managers.state.game_mode
	local game_mode = game_mode_manager and game_mode_manager:game_mode()
	local game_mode_state = game_mode and game_mode:game_mode_state()

	if game_mode_state == "match_running_state" then
		VersusObjectiveSystem.super.game_object_destroyed(self, game_object_id)
	end
end

-- chunkname: @scripts/entity_system/systems/objective/objective_system_testify.lua

local ObjectiveSystemTestify = {
	versus_objective_add_time = function (objective_system, time)
		objective_system:add_time(time)
	end,
	versus_current_objective_position = function (objective_system)
		local _, extension = next(objective_system._main_objectives)

		if not extension then
			return
		end

		local objective_data = {}
		local objective_positions = objective_system:current_objectives_position()
		local _, objective_position = next(objective_positions)
		local x = Math.random_range(-10, 10)
		local y = Math.random_range(-10, 10)
		local pos = objective_position + Vector3(x, y, 0)
		local main_path_pos, _, _, _, _ = EngineOptimized.closest_pos_at_main_path(pos)

		objective_data.objective_position = objective_position
		objective_data.random_position = pos
		objective_data.main_path_position = main_path_pos

		return objective_data
	end,
	versus_complete_objectives = function (objective_system)
		local _, extension = next(objective_system._main_objectives)

		if extension then
			extension._completed = true
		end

		local _, sub_objectives_container = next(objective_system._sub_objectives)

		if sub_objectives_container and sub_objectives_container.extensions then
			local extensions = sub_objectives_container.extensions

			for _, extension in ipairs(extensions) do
				extension._completed = true
			end
		end
	end,
	versus_objective_name = function (objective_system)
		local _, extension = next(objective_system._main_objectives)

		return extension:objective_name()
	end,
	versus_objective_type = function (objective_system)
		local _, extension = next(objective_system._main_objectives)

		if not extension then
			local _, extension_data = next(objective_system._objective_lists[#objective_system._objective_lists])

			if not extension then
				return "objective_not_supported"
			end
		end

		local name = extension.NAME

		if name == "VersusCapturePointObjectiveExtension" then
			return "objective_capture_point"
		end

		if name == "VersusInteractObjectiveExtension" then
			return "objective_interact"
		end

		if name == "VersusVolumeObjectiveExtension" then
			return "objective_volume"
		end

		return "objective_not_supported"
	end,
	weave_spawn_essence_on_first_bot_position = function (objective_system)
		local first_bot_unit = Managers.player:bots()[1].player_unit

		if first_bot_unit then
			local player_position = Unit.local_position(first_bot_unit, 0) + Vector3(0, 0, 0.2)

			objective_system:spawn_essence_unit(player_position)
		end

		objective_system:add_score(2)
	end,
	get_num_main_objectives = function (objective_system)
		return objective_system:num_main_objectives()
	end,
	get_current_main_objective = function (objective_system)
		local index = objective_system:current_objective_index()

		if index < objective_system:num_main_objectives() then
			return index
		end

		local name = next(objective_system._objective_lists[index])
		local extension = objective_system._objectives_by_name[name]

		if extension:is_done() then
			return
		end

		return index
	end,
	wait_for_objectives_to_activate = function (objective_system)
		return objective_system:is_active()
	end,
}

return ObjectiveSystemTestify

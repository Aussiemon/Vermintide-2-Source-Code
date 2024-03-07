-- chunkname: @scripts/managers/game_mode/game_mode_helper.lua

GameModeHelper = class(GameModeHelper)

GameModeHelper.side_is_dead = function (side_name, ignore_bots)
	local party = Managers.state.side:get_party_from_side_name(side_name)
	local occupied_slots = party.occupied_slots

	for i = 1, #occupied_slots do
		local status = occupied_slots[i]
		local data = status.game_mode_data
		local health_state = data.health_state
		local is_alive = health_state ~= "dead" and health_state ~= "respawn" and health_state ~= "respawning"
		local should_ignore = ignore_bots and status.is_bot

		if is_alive and not should_ignore then
			return false
		end
	end

	return true
end

GameModeHelper.side_is_disabled = function (side_name)
	local party = Managers.state.side:get_party_from_side_name(side_name)
	local occupied_slots = party.occupied_slots

	for i = 1, #occupied_slots do
		local status = occupied_slots[i]
		local data = status.game_mode_data
		local health_state = data.health_state

		if not health_state or health_state == "alive" then
			return false
		end
	end

	return true
end

GameModeHelper.side_delaying_loss = function (side_name)
	local side = Managers.state.side:get_side_from_name(side_name)
	local player_units = side.PLAYER_AND_BOT_UNITS
	local num_human_players = #player_units

	for i = 1, num_human_players do
		local player_unit = player_units[i]
		local buff_extension = ScriptUnit.has_extension(player_unit, "buff_system")

		if buff_extension and buff_extension:has_buff_perk("invulnerable") then
			return true
		end
	end

	return false
end

GameModeHelper.get_object_sets = function (level_name, game_mode_key)
	local game_mode_object_sets = GameModeSettings[game_mode_key].object_sets
	local spawned_object_sets = {}
	local object_sets = {}
	local num_nested_levels = LevelResource.nested_level_count(level_name)

	if num_nested_levels > 0 then
		local available_level_sets = LevelResource.nested_level_object_set_names(level_name, 1)

		for key, set in ipairs(available_level_sets) do
			local object_set_table = {
				type = "",
				key = key,
				units = LevelResource.nested_level_unit_indices_in_object_set(level_name, 1, set),
			}

			if game_mode_object_sets[set] or set == "shadow_lights" then
				spawned_object_sets[#spawned_object_sets + 1] = set
			elseif string.sub(set, 1, 5) == "flow_" then
				spawned_object_sets[#spawned_object_sets + 1] = set
				object_set_table.type = "flow"
			elseif string.sub(set, 1, 5) == "team_" then
				spawned_object_sets[#spawned_object_sets + 1] = set
				object_set_table.type = "team"
			end

			object_sets[set] = object_set_table
		end
	else
		local available_level_sets = LevelResource.object_set_names(level_name)

		for key, set in ipairs(available_level_sets) do
			local object_set_table = {
				type = "",
				key = key,
				units = LevelResource.unit_indices_in_object_set(level_name, set),
			}

			if game_mode_object_sets[set] or set == "shadow_lights" then
				spawned_object_sets[#spawned_object_sets + 1] = set
			elseif string.sub(set, 1, 5) == "flow_" then
				spawned_object_sets[#spawned_object_sets + 1] = set
				object_set_table.type = "flow"
			elseif string.sub(set, 1, 5) == "team_" then
				spawned_object_sets[#spawned_object_sets + 1] = set
				object_set_table.type = "team"
			end

			object_sets[set] = object_set_table
		end
	end

	return object_sets, spawned_object_sets
end

GameModeHelper = class(GameModeHelper)

GameModeHelper.side_is_dead = function (side_name, ignore_bots)
	local party = Managers.state.side:get_party_from_side_name(side_name)
	local occupied_slots = party.occupied_slots

	for i = 1, #occupied_slots, 1 do
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

	for i = 1, #occupied_slots, 1 do
		local status = occupied_slots[i]
		local data = status.game_mode_data
		local health_state = data.health_state

		if not health_state or health_state == "alive" then
			return false
		end
	end

	return true
end

GameModeHelper.change_player_to_selected_profile = function (profile_synchronizer, peer_id, local_player_id)
	local status = Managers.party:get_player_status(peer_id, local_player_id)
	local selected_profile_index = status.selected_profile_index
	local selected_career_index = status.selected_career_index

	if selected_profile_index and selected_career_index then
		local current_profile_index, current_career_index = profile_synchronizer:profile_by_peer(peer_id, local_player_id)

		if current_profile_index ~= selected_profile_index or current_career_index ~= selected_career_index then
			profile_synchronizer:select_profile(peer_id, local_player_id, selected_profile_index, selected_career_index)
		end
	end
end

return

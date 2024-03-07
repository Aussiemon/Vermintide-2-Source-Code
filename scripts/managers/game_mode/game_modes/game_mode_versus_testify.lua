-- chunkname: @scripts/managers/game_mode/game_modes/game_mode_versus_testify.lua

local GameModeVersusTestify = {
	versus_has_lost = function (game_mode_versus)
		return game_mode_versus.about_to_lose
	end,
	versus_wait_for_local_player_hero_picking_turn = function (game_mode_versus)
		local party_selection_logic = game_mode_versus:party_selection_logic()

		if not party_selection_logic then
			return Testify.RETRY
		end

		local peer_id = Network.peer_id()
		local local_player_id = 1
		local party_manager = Managers.party
		local party, party_id = party_manager:get_party_from_player_id(peer_id, local_player_id)

		if not party or party_id < 1 then
			return Testify.RETRY
		end

		local party_data = party_selection_logic:get_party_data(party_id)

		if not party_data then
			return Testify.RETRY
		end

		local current_picker_index = party_data.current_picker_index

		if current_picker_index <= 0 then
			return Testify.RETRY
		end

		local player_status = party_manager:get_player_status(peer_id, local_player_id)
		local picker_list = party_data.picker_list
		local player_data = picker_list[current_picker_index]
		local status = player_data.status
		local is_picking = party_id == party_data.party_id and player_status.slot_id == status.slot_id

		if not is_picking then
			return Testify.RETRY
		end
	end,
	versus_set_time = function (_, time)
		local win_conditions = Managers.mechanism:game_mechanism():win_conditions()

		win_conditions:set_time(time)
	end,
	versus_wait_for_initial_peers_spawned = function (game_mode_versus)
		if not game_mode_versus:initial_peers_spawned() then
			return Testify.RETRY
		end
	end,
}

return GameModeVersusTestify

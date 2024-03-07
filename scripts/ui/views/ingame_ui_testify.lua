-- chunkname: @scripts/ui/views/ingame_ui_testify.lua

local IngameUITestify = {
	transition_with_fade = function (ingame_ui, params)
		ingame_ui:transition_with_fade(params.transition, params.transition_params)
	end,
	wait_for_active_view = function (ingame_ui, view)
		if ingame_ui.current_view ~= view then
			return Testify.RETRY
		end
	end,
	versus_select_random_available_hero = function (ingame_ui)
		fassert(ingame_ui.current_view == "versus_party_char_selection_view", "TODO")

		local current_view = ingame_ui.views[ingame_ui.current_view]
		local peer_id = Network.peer_id()
		local local_player_id = 1
		local party, party_id = Managers.party:get_party_from_player_id(peer_id, local_player_id)

		if not party or party_id < 1 then
			return Testify.RETRY
		end

		local game_mode = Managers.state.game_mode and Managers.state.game_mode:game_mode()

		if not game_mode then
			return Testify.RETRY
		end

		local party_selection_logic = game_mode:party_selection_logic()

		if not party_selection_logic then
			return Testify.RETRY
		end

		local party_data = party_selection_logic:get_party_data(party_id)

		if not party_data then
			return Testify.RETRY
		end

		local profile_index, career_index = party_selection_logic:get_random_available_character(party_data.available_characters)

		current_view:_select_character(party_id, nil, profile_index, career_index)
		current_view:_change_profile(profile_index, career_index)
	end,
}

return IngameUITestify

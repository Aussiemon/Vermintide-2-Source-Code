PlayerData = PlayerData or {
	mission_selection_version = 2,
	controls_version = 13,
	new_item_data_version = 5,
	new_sign_in_rewards_data_version = 1,
	mission_selection = {},
	new_item_ids = {},
	new_item_ids_by_career = {},
	new_sign_in_rewards = {},
	controls = {},
	recent_irc_channels = {}
}

function populate_player_data_from_save(save_data, id, version_match)
	if not save_data.player_data then
		save_data.player_data = {}
	end

	if not save_data.player_data[id] then
		local new_player_data = table.clone(PlayerData)

		if save_data.controls then
			new_player_data.controls = save_data.controls
			save_data.controls = nil
		end

		if save_data.new_item_ids then
			new_player_data.new_item_ids = save_data.new_item_ids
			save_data.new_item_ids = nil
		end

		if save_data.recent_irc_channels then
			new_player_data.recent_irc_channels = save_data.recent_irc_channels
			save_data.recent_irc_channels = nil
		end

		save_data.player_data[id] = new_player_data
	end

	local player_save_data = save_data.player_data[id]

	if version_match then
		if PlayerData.mission_selection_version ~= player_save_data.mission_selection_version then
			player_save_data.mission_selection = {}

			print("Wrong mission_selection_version for save file, saved: ", player_save_data.mission_selection_version, " current: ", PlayerData.mission_selection_version)

			player_save_data.mission_selection_version = PlayerData.mission_selection_version
		end

		if PlayerData.controls_version ~= player_save_data.controls_version then
			player_save_data.controls = {}

			print("Wrong controls_version for save file, saved: ", player_save_data.controls_version, " current: ", PlayerData.controls_version)

			player_save_data.controls_version = PlayerData.controls_version
		end

		if PlayerData.new_item_data_version ~= player_save_data.new_item_data_version then
			print("Wrong new_item_data_version for save file, saved: ", player_save_data.new_item_data_version, " current: ", PlayerData.new_item_data_version)

			player_save_data.new_item_ids = {}
			player_save_data.new_item_ids_by_career = {}
			player_save_data.new_item_data_version = PlayerData.new_item_data_version
		end

		if PlayerData.new_sign_in_rewards_data_version ~= player_save_data.new_sign_in_rewards_data_version then
			print("Wrong new_sign_in_rewards_data_version for save file, saved: ", player_save_data.new_sign_in_rewards_data_version, " current: ", PlayerData.new_sign_in_rewards_data_version)

			player_save_data.new_sign_in_rewards = {}
			player_save_data.new_sign_in_rewards_data_version = PlayerData.new_sign_in_rewards_data_version
		end
	end

	PlayerData = player_save_data
	local input_manager = Managers.input

	if input_manager then
		input_manager.apply_saved_keymaps(input_manager)
	end

	return 
end

return 

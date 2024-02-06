-- chunkname: @scripts/settings/player_data.lua

require("scripts/settings/profiles/sp_profiles")

DefaultPlayerData = {
	bot_spawn_priority_version = 2,
	controls_version = 18,
	favorite_item_data_version = 1,
	level_preferences_version = 1,
	mission_selection_version = 3,
	new_item_data_version = 6,
	new_keep_decoration_version = 1,
	new_sign_in_rewards_data_version = 2,
	seen_shop_items_version = 1,
	viewed_dialogues_version = 1,
	mission_selection = {},
	favorite_item_ids = {},
	favorite_item_ids_by_career = {},
	new_item_ids = {},
	new_item_ids_by_career = {},
	new_sign_in_rewards = {},
	controls = {},
	recent_irc_channels = {},
	bot_spawn_priority = table.clone(ProfilePriority),
	viewed_dialogues = {},
	new_keep_decoration_ids = {},
	level_preferences = {
		{},
		{},
	},
	seen_shop_items = {},
}
PlayerData = PlayerData or table.clone(DefaultPlayerData)

function populate_player_data_from_save(save_data, id, version_match)
	if not save_data.player_data then
		save_data.player_data = {}
	end

	if not save_data.player_data[id] then
		local new_player_data = table.clone(DefaultPlayerData)

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
		if DefaultPlayerData.mission_selection_version ~= player_save_data.mission_selection_version then
			player_save_data.mission_selection = {}

			print("Wrong mission_selection_version for save file, saved: ", player_save_data.mission_selection_version, " current: ", DefaultPlayerData.mission_selection_version)

			player_save_data.mission_selection_version = DefaultPlayerData.mission_selection_version
		end

		if DefaultPlayerData.controls_version ~= player_save_data.controls_version then
			player_save_data.controls = {}

			print("Wrong controls_version for save file, saved: ", player_save_data.controls_version, " current: ", DefaultPlayerData.controls_version)

			player_save_data.controls_version = DefaultPlayerData.controls_version
		end

		if DefaultPlayerData.new_keep_decoration_version ~= player_save_data.new_keep_decoration_version then
			print("Wrong new_keep_decoration_version for save file, saved: ", player_save_data.new_keep_decoration_version, " current: ", DefaultPlayerData.new_keep_decoration_version)

			player_save_data.new_keep_decoration_ids = {}
			player_save_data.new_keep_decoration_version = DefaultPlayerData.new_keep_decoration_version
		end

		if DefaultPlayerData.favorite_item_data_version ~= player_save_data.favorite_item_data_version then
			print("Wrong favorite_item_data_version for save file, saved: ", player_save_data.favorite_item_data_version, " current: ", DefaultPlayerData.favorite_item_data_version)

			player_save_data.favorite_item_ids = {}
			player_save_data.favorite_item_ids_by_career = {}
			player_save_data.favorite_item_data_version = DefaultPlayerData.favorite_item_data_version
		end

		if DefaultPlayerData.new_item_data_version ~= player_save_data.new_item_data_version then
			print("Wrong new_item_data_version for save file, saved: ", player_save_data.new_item_data_version, " current: ", DefaultPlayerData.new_item_data_version)

			player_save_data.new_item_ids = {}
			player_save_data.new_item_ids_by_career = {}
			player_save_data.new_item_data_version = DefaultPlayerData.new_item_data_version
		end

		if DefaultPlayerData.new_sign_in_rewards_data_version ~= player_save_data.new_sign_in_rewards_data_version then
			print("Wrong new_sign_in_rewards_data_version for save file, saved: ", player_save_data.new_sign_in_rewards_data_version, " current: ", DefaultPlayerData.new_sign_in_rewards_data_version)

			player_save_data.new_sign_in_rewards = {}
			player_save_data.new_sign_in_rewards_data_version = DefaultPlayerData.new_sign_in_rewards_data_version
		end

		if DefaultPlayerData.bot_spawn_priority_version ~= player_save_data.bot_spawn_priority_version then
			player_save_data.bot_spawn_priority = table.clone(ProfilePriority)

			print("Wrong bot_spawn_priority_version for save file, saved: ", player_save_data.bot_spawn_priority_version, " current: ", DefaultPlayerData.bot_spawn_priority_version)

			player_save_data.bot_spawn_priority_version = DefaultPlayerData.bot_spawn_priority_version
		end

		if DefaultPlayerData.viewed_dialogues_version ~= player_save_data.viewed_dialogues_version then
			player_save_data.viewed_dialogues = {}

			print("Wrong viewed_dialogues_version for save file, saved: ", player_save_data.viewed_dialogues_version, " current: ", DefaultPlayerData.viewed_dialogues_version)

			player_save_data.viewed_dialogues_version = DefaultPlayerData.viewed_dialogues_version
		end

		if DefaultPlayerData.level_preferences_version ~= player_save_data.level_preferences_version then
			player_save_data.level_preferences = {
				{},
				{},
			}

			print("Wrong level_preferences_version for save file, saved: ", tostring(player_save_data.level_preferences_version), " current: ", DefaultPlayerData.level_preferences_version)

			player_save_data.level_preferences_version = DefaultPlayerData.level_preferences_version
		end

		if DefaultPlayerData.seen_shop_items_version ~= player_save_data.seen_shop_items_version then
			player_save_data.seen_shop_items = {}

			print("Wrong seen_shop_items_version for save file, saved: ", player_save_data.seen_shop_items_version, " current: ", DefaultPlayerData.seen_shop_items_version)

			player_save_data.seen_shop_items_version = DefaultPlayerData.seen_shop_items_version
		end
	end

	PlayerData = player_save_data

	local input_manager = Managers.input

	if input_manager then
		input_manager:apply_saved_keymaps()
	end
end

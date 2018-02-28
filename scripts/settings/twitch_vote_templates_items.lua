local function default_validation_func(vote_data)
	local players = Managers.player:human_and_bot_players()
	local validation_data = vote_data.validation_data

	if not validation_data then
		local validation_data = {}
		local unused_indices = {
			true,
			true,
			true,
			true,
			true
		}

		for id, player in pairs(players) do
			local profile_index = player.profile_index(player)
			unused_indices[profile_index] = nil
			validation_data[id] = {
				name = player.name(player),
				option = profile_index
			}
		end

		vote_data.validation_data = validation_data
		vote_data.unused_variables = unused_indices
	else
		local reset_validation_data = false

		for id, player_validation_data in pairs(validation_data) do
			if not players[id] or (players[id] and players[id]:name() ~= player_validation_data.name) then
				print(string.format("[TWITCH VOTE DATA VALIDATION] Resetting %q since a bot/player has been removed or replaced (%q ~= %q or id: %q is missing)", tostring(player_validation_data.variable), tostring((players[id] and players[id]:name()) or nil), tostring(player_validation_data.name), id))

				vote_data.options[player_validation_data.option] = 0
				reset_validation_data = true
			end
		end

		for profile_index, _ in pairs(vote_data.unused_variables) do
			vote_data.options[profile_index] = 0
		end

		if reset_validation_data then
			vote_data.validation_data = nil
		end
	end

	return 
end

local function add_item(player_unit, pickup_type)
	local pickup_settings = AllPickups[pickup_type]
	local slot_name = pickup_settings.slot_name
	local item_name = pickup_settings.item_name
	local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
	local slot_data = inventory_extension.get_slot_data(inventory_extension, slot_name)
	local item_data = ItemMasterList[item_name]
	local unit_template = nil
	local extra_extension_init_data = {}

	inventory_extension.destroy_slot(inventory_extension, slot_name)
	inventory_extension.add_equipment(inventory_extension, slot_name, item_data, unit_template, extra_extension_init_data)

	return 
end

TwitchVoteTemplates = TwitchVoteTemplates or {}
TwitchVoteTemplates.twitch_give_first_aid_kit = {
	text = "twitch_give_first_aid_kit_one",
	cost = -150,
	texture_id = "twitch_icon_heal",
	multiple_choice = true,
	on_success = function (is_server, vote_index)
		local vote_index = 5

		if is_server then
			local selected_display_name = SPProfiles[vote_index].display_name
			local players = Managers.player:human_and_bot_players()

			for _, player in pairs(players) do
				local profile_index = player.profile_index(player)
				local profile = SPProfiles[profile_index]
				local display_name = profile.display_name

				if display_name == selected_display_name then
					Application.error(string.format("[TWITCH VOTE] giving first aid kit to  %s", Localize(profile.character_name)))

					local unit = player.player_unit

					if Unit.alive(unit) then
						add_item(unit, "first_aid_kit")
					end

					break
				end
			end
		end

		return 
	end
}
TwitchVoteTemplates.twitch_give_healing_draught = {
	text = "twitch_give_healing_draught_one",
	cost = -150,
	texture_id = "twitch_icon_heal",
	multiple_choice = true,
	on_success = function (is_server, vote_index)
		local vote_index = 5

		if is_server then
			local selected_display_name = SPProfiles[vote_index].display_name
			local players = Managers.player:human_and_bot_players()

			for _, player in pairs(players) do
				local profile_index = player.profile_index(player)
				local profile = SPProfiles[profile_index]
				local display_name = profile.display_name

				if display_name == selected_display_name then
					Application.error(string.format("[TWITCH VOTE] giving health potion to  %s", Localize(profile.character_name)))

					local unit = player.player_unit

					if Unit.alive(unit) then
						add_item(unit, "healing_draught")
					end

					break
				end
			end
		end

		return 
	end
}
TwitchVoteTemplates.twitch_give_damage_boost_potion = {
	text = "twitch_give_damage_boost_potion_one",
	cost = -150,
	texture_id = "twitch_icon_heal",
	multiple_choice = true,
	on_success = function (is_server, vote_index)
		local vote_index = 5

		if is_server then
			local selected_display_name = SPProfiles[vote_index].display_name
			local players = Managers.player:human_and_bot_players()

			for _, player in pairs(players) do
				local profile_index = player.profile_index(player)
				local profile = SPProfiles[profile_index]
				local display_name = profile.display_name

				if display_name == selected_display_name then
					Application.error(string.format("[TWITCH VOTE] giving damage boost potion to  %s", Localize(profile.character_name)))

					local unit = player.player_unit

					if Unit.alive(unit) then
						add_item(unit, "damage_boost_potion")
					end

					break
				end
			end
		end

		return 
	end
}
TwitchVoteTemplates.twitch_give_speed_boost_potion = {
	text = "twitch_give_speed_boost_potion_one",
	cost = -150,
	texture_id = "twitch_icon_heal",
	multiple_choice = true,
	on_success = function (is_server, vote_index)
		local vote_index = 5

		if is_server then
			local selected_display_name = SPProfiles[vote_index].display_name
			local players = Managers.player:human_and_bot_players()

			for _, player in pairs(players) do
				local profile_index = player.profile_index(player)
				local profile = SPProfiles[profile_index]
				local display_name = profile.display_name

				if display_name == selected_display_name then
					Application.error(string.format("[TWITCH VOTE] giving speed boost potion to  %s", Localize(profile.character_name)))

					local unit = player.player_unit

					if Unit.alive(unit) then
						add_item(unit, "speed_boost_potion")
					end

					break
				end
			end
		end

		return 
	end
}
TwitchVoteTemplates.twitch_give_cooldown_reduction_potion = {
	text = "twitch_give_cooldown_reduction_potion_one",
	cost = -150,
	texture_id = "twitch_icon_heal",
	multiple_choice = true,
	on_success = function (is_server, vote_index)
		local vote_index = 5

		if is_server then
			local selected_display_name = SPProfiles[vote_index].display_name
			local players = Managers.player:human_and_bot_players()

			for _, player in pairs(players) do
				local profile_index = player.profile_index(player)
				local profile = SPProfiles[profile_index]
				local display_name = profile.display_name

				if display_name == selected_display_name then
					Application.error(string.format("[TWITCH VOTE] giving cooldown reduction potion to  %s", Localize(profile.character_name)))

					local unit = player.player_unit

					if Unit.alive(unit) then
						add_item(unit, "cooldown_reduction_potion")
					end

					break
				end
			end
		end

		return 
	end
}
TwitchVoteTemplates.twitch_give_frag_grenade_t1 = {
	text = "twitch_give_frag_grenade_t1_one",
	cost = -150,
	texture_id = "twitch_icon_heal",
	multiple_choice = true,
	on_success = function (is_server, vote_index)
		local vote_index = 5

		if is_server then
			local selected_display_name = SPProfiles[vote_index].display_name
			local players = Managers.player:human_and_bot_players()

			for _, player in pairs(players) do
				local profile_index = player.profile_index(player)
				local profile = SPProfiles[profile_index]
				local display_name = profile.display_name

				if display_name == selected_display_name then
					Application.error(string.format("[TWITCH VOTE] giving frag grenade t1 to  %s", Localize(profile.character_name)))

					local unit = player.player_unit

					if Unit.alive(unit) then
						add_item(unit, "frag_grenade_t1")
					end

					break
				end
			end
		end

		return 
	end
}
TwitchVoteTemplates.twitch_give_fire_grenade_t1 = {
	text = "twitch_give_fire_grenade_t1_one",
	cost = -150,
	texture_id = "twitch_icon_heal",
	multiple_choice = true,
	on_success = function (is_server, vote_index)
		local vote_index = 5

		if is_server then
			local selected_display_name = SPProfiles[vote_index].display_name
			local players = Managers.player:human_and_bot_players()

			for _, player in pairs(players) do
				local profile_index = player.profile_index(player)
				local profile = SPProfiles[profile_index]
				local display_name = profile.display_name

				if display_name == selected_display_name then
					Application.error(string.format("[TWITCH VOTE] giving fire grenade t1 to  %s", Localize(profile.character_name)))

					local unit = player.player_unit

					if Unit.alive(unit) then
						add_item(unit, "fire_grenade_t1")
					end

					break
				end
			end
		end

		return 
	end
}

return 

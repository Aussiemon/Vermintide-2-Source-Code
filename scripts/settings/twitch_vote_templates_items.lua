-- chunkname: @scripts/settings/twitch_vote_templates_items.lua

local twitch_settings = TwitchSettings

local function debug_print(message, ...)
	if DEBUG_TWITCH then
		print("[Twitch] " .. string.format(message, ...))
	end
end

local function default_condition_func(vote_data)
	local players = Managers.player:human_and_bot_players()
	local validation_data = vote_data.validation_data

	if not validation_data then
		local validation_data = {}
		local unused_indices = {
			true,
			true,
			true,
			true,
			true,
		}

		for id, player in pairs(players) do
			local profile_index = player:profile_index()

			unused_indices[profile_index] = nil
			validation_data[id] = {
				name = player:name(),
				option = profile_index,
			}
		end

		vote_data.validation_data = validation_data
		vote_data.unused_variables = unused_indices
	else
		local reset_validation_data = false

		for id, player_validation_data in pairs(validation_data) do
			if not players[id] or players[id] and players[id]:name() ~= player_validation_data.name then
				debug_print(string.format("[TWITCH VOTE DATA VALIDATION] Resetting %q since a bot/player has been removed or replaced (%q ~= %q or id: %q is missing)", tostring(player_validation_data.variable), tostring(players[id] and players[id]:name() or nil), tostring(player_validation_data.name), id))

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
end

local function add_item(is_server, player_unit, pickup_type)
	local player_manager = Managers.player
	local player = player_manager:owner(player_unit)

	if player then
		local local_bot_or_human = not player.remote

		if local_bot_or_human then
			local network_manager = Managers.state.network
			local network_transmit = network_manager.network_transmit
			local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
			local career_extension = ScriptUnit.extension(player_unit, "career_system")
			local pickup_settings = AllPickups[pickup_type]
			local slot_name = pickup_settings.slot_name
			local item_name = pickup_settings.item_name
			local slot_data = inventory_extension:get_slot_data(slot_name)
			local can_store_additional_item = inventory_extension:can_store_additional_item(slot_name)
			local has_additional_items = inventory_extension:has_additional_items(slot_name)

			if slot_data and not can_store_additional_item then
				local item_data = slot_data.item_data
				local item_template = BackendUtils.get_item_template(item_data)
				local pickup_item_to_spawn

				if item_template.name == "wpn_side_objective_tome_01" then
					pickup_item_to_spawn = "tome"
				elseif item_template.name == "wpn_grimoire_01" then
					pickup_item_to_spawn = "grimoire"
				end

				if pickup_item_to_spawn then
					local pickup_spawn_type = "dropped"
					local pickup_name_id = NetworkLookup.pickup_names[pickup_item_to_spawn]
					local pickup_spawn_type_id = NetworkLookup.pickup_spawn_types[pickup_spawn_type]
					local position = POSITION_LOOKUP[player_unit]
					local rotation = Unit.local_rotation(player_unit, 0)

					network_transmit:send_rpc_server("rpc_spawn_pickup", pickup_name_id, position, rotation, pickup_spawn_type_id)
				end
			end

			local item_data = ItemMasterList[item_name]
			local unit_template
			local extra_extension_init_data = {}

			if can_store_additional_item and slot_data then
				inventory_extension:store_additional_item(slot_name, item_data)
			elseif has_additional_items and slot_data then
				local has_droppable, is_stored, drop_item_data = inventory_extension:has_droppable_item(slot_name)

				if is_stored then
					inventory_extension:remove_additional_item(slot_name, drop_item_data)
					inventory_extension:store_additional_item(slot_name, item_data)
				else
					inventory_extension:destroy_slot(slot_name)
					inventory_extension:add_equipment(slot_name, item_data, unit_template, extra_extension_init_data)
				end
			else
				inventory_extension:destroy_slot(slot_name)
				inventory_extension:add_equipment(slot_name, item_data, unit_template, extra_extension_init_data)
			end

			local go_id = Managers.state.unit_storage:go_id(player_unit)
			local slot_id = NetworkLookup.equipment_slots[slot_name]
			local item_id = NetworkLookup.item_names[item_name]
			local weapon_skin_id = NetworkLookup.weapon_skins["n/a"]

			if is_server then
				network_transmit:send_rpc_clients("rpc_add_equipment", go_id, slot_id, item_id, weapon_skin_id)
			else
				network_transmit:send_rpc_server("rpc_add_equipment", go_id, slot_id, item_id, weapon_skin_id)
			end

			local wielded_slot_name = inventory_extension:get_wielded_slot_name()

			if wielded_slot_name == slot_name then
				CharacterStateHelper.stop_weapon_actions(inventory_extension, "picked_up_object")
				CharacterStateHelper.stop_career_abilities(career_extension, "picked_up_object")
				inventory_extension:wield(slot_name)
			end
		end
	end
end

TwitchVoteTemplates = TwitchVoteTemplates or {}
TwitchVoteTemplates.twitch_give_first_aid_kit = {
	cost = -100,
	multiple_choice = true,
	text = "twitch_give_first_aid_kit_one",
	texture_id = "twitch_icon_medical_supplies",
	use_frame_texture = true,
	texture_size = {
		70,
		70,
	},
	condition_func = function ()
		return not twitch_settings.disable_giving_items and not twitch_settings.disable_positive_votes
	end,
	on_success = function (is_server, vote_index)
		local selected_display_name = SPProfiles[vote_index].display_name
		local players = Managers.player:human_and_bot_players()

		for _, player in pairs(players) do
			local profile_index = player:profile_index()
			local profile = SPProfiles[profile_index]
			local display_name = profile.display_name

			if display_name == selected_display_name then
				debug_print(string.format("[TWITCH VOTE] giving first aid kit to  %s", Localize(profile.character_name)))

				local unit = player.player_unit

				if Unit.alive(unit) then
					add_item(is_server, unit, "first_aid_kit")
				end

				break
			end
		end
	end,
}
TwitchVoteTemplates.twitch_give_healing_draught = {
	cost = -100,
	multiple_choice = true,
	text = "twitch_give_healing_draught_one",
	texture_id = "twitch_icon_healing_draught",
	use_frame_texture = true,
	texture_size = {
		70,
		70,
	},
	condition_func = function ()
		return not twitch_settings.disable_giving_items and not twitch_settings.disable_positive_votes
	end,
	on_success = function (is_server, vote_index)
		local selected_display_name = SPProfiles[vote_index].display_name
		local players = Managers.player:human_and_bot_players()

		for _, player in pairs(players) do
			local profile_index = player:profile_index()
			local profile = SPProfiles[profile_index]
			local display_name = profile.display_name

			if display_name == selected_display_name then
				debug_print(string.format("[TWITCH VOTE] giving health potion to  %s", Localize(profile.character_name)))

				local unit = player.player_unit

				if Unit.alive(unit) then
					add_item(is_server, unit, "healing_draught")
				end

				break
			end
		end
	end,
}
TwitchVoteTemplates.twitch_give_damage_boost_potion = {
	cost = -50,
	multiple_choice = true,
	text = "twitch_give_damage_boost_potion_one",
	texture_id = "twitch_icon_potion_of_strength",
	use_frame_texture = true,
	texture_size = {
		70,
		70,
	},
	condition_func = function ()
		return not twitch_settings.disable_giving_items and not twitch_settings.disable_positive_votes
	end,
	on_success = function (is_server, vote_index)
		local selected_display_name = SPProfiles[vote_index].display_name
		local players = Managers.player:human_and_bot_players()

		for _, player in pairs(players) do
			local profile_index = player:profile_index()
			local profile = SPProfiles[profile_index]
			local display_name = profile.display_name

			if display_name == selected_display_name then
				debug_print(string.format("[TWITCH VOTE] giving damage boost potion to  %s", Localize(profile.character_name)))

				local unit = player.player_unit

				if Unit.alive(unit) then
					add_item(is_server, unit, "damage_boost_potion")
				end

				break
			end
		end
	end,
}
TwitchVoteTemplates.twitch_give_speed_boost_potion = {
	cost = -50,
	multiple_choice = true,
	text = "twitch_give_speed_boost_potion_one",
	texture_id = "twitch_icon_potion_of_speed",
	use_frame_texture = true,
	texture_size = {
		70,
		70,
	},
	condition_func = function ()
		return not twitch_settings.disable_giving_items and not twitch_settings.disable_positive_votes
	end,
	on_success = function (is_server, vote_index)
		local selected_display_name = SPProfiles[vote_index].display_name
		local players = Managers.player:human_and_bot_players()

		for _, player in pairs(players) do
			local profile_index = player:profile_index()
			local profile = SPProfiles[profile_index]
			local display_name = profile.display_name

			if display_name == selected_display_name then
				debug_print(string.format("[TWITCH VOTE] giving speed boost potion to  %s", Localize(profile.character_name)))

				local unit = player.player_unit

				if Unit.alive(unit) then
					add_item(is_server, unit, "speed_boost_potion")
				end

				break
			end
		end
	end,
}
TwitchVoteTemplates.twitch_give_cooldown_reduction_potion = {
	cost = -50,
	multiple_choice = true,
	text = "twitch_give_cooldown_reduction_potion_one",
	texture_id = "twitch_icon_potion_of_concentration",
	use_frame_texture = true,
	texture_size = {
		70,
		70,
	},
	condition_func = function ()
		return not twitch_settings.disable_giving_items and not twitch_settings.disable_positive_votes
	end,
	on_success = function (is_server, vote_index)
		local selected_display_name = SPProfiles[vote_index].display_name
		local players = Managers.player:human_and_bot_players()

		for _, player in pairs(players) do
			local profile_index = player:profile_index()
			local profile = SPProfiles[profile_index]
			local display_name = profile.display_name

			if display_name == selected_display_name then
				debug_print(string.format("[TWITCH VOTE] giving cooldown reduction potion to  %s", Localize(profile.character_name)))

				local unit = player.player_unit

				if Unit.alive(unit) then
					add_item(is_server, unit, "cooldown_reduction_potion")
				end

				break
			end
		end
	end,
}
TwitchVoteTemplates.twitch_give_frag_grenade_t1 = {
	cost = -100,
	multiple_choice = true,
	text = "twitch_give_frag_grenade_t1_one",
	texture_id = "twitch_icon_bomb",
	use_frame_texture = true,
	texture_size = {
		70,
		70,
	},
	condition_func = function ()
		return not twitch_settings.disable_giving_items and not twitch_settings.disable_positive_votes
	end,
	on_success = function (is_server, vote_index)
		local selected_display_name = SPProfiles[vote_index].display_name
		local players = Managers.player:human_and_bot_players()

		for _, player in pairs(players) do
			local profile_index = player:profile_index()
			local profile = SPProfiles[profile_index]
			local display_name = profile.display_name

			if display_name == selected_display_name then
				debug_print(string.format("[TWITCH VOTE] giving frag grenade t1 to  %s", Localize(profile.character_name)))

				local unit = player.player_unit

				if Unit.alive(unit) then
					add_item(is_server, unit, "frag_grenade_t1")
				end

				break
			end
		end
	end,
}
TwitchVoteTemplates.twitch_give_fire_grenade_t1 = {
	cost = -100,
	multiple_choice = true,
	text = "twitch_give_fire_grenade_t1_one",
	texture_id = "twitch_icon_incediary_bomb",
	use_frame_texture = true,
	texture_size = {
		70,
		70,
	},
	condition_func = function ()
		return not twitch_settings.disable_giving_items and not twitch_settings.disable_positive_votes
	end,
	on_success = function (is_server, vote_index)
		local selected_display_name = SPProfiles[vote_index].display_name
		local players = Managers.player:human_and_bot_players()

		for _, player in pairs(players) do
			local profile_index = player:profile_index()
			local profile = SPProfiles[profile_index]
			local display_name = profile.display_name

			if display_name == selected_display_name then
				debug_print(string.format("[TWITCH VOTE] giving fire grenade t1 to  %s", Localize(profile.character_name)))

				local unit = player.player_unit

				if Unit.alive(unit) then
					add_item(is_server, unit, "fire_grenade_t1")
				end

				break
			end
		end
	end,
}

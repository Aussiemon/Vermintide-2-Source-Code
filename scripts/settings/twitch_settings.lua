TwitchSettings = {
	max_diff = 200,
	initial_downtime = 60,
	default_vote_time = 30,
	default_downtime = 30,
	default_draw_vote = "It's a Draw!",
	funds = 0,
	standard_vote = {
		default_vote_a_str = "#a",
		default_vote_b_str = "#b"
	},
	multiple_choice = {
		default_vote_b_str = "#b",
		default_vote_c_str = "#c",
		default_vote_d_str = "#d",
		default_vote_a_str = "#a",
		default_vote_e_str = "#e"
	}
}
TwitchVoteTemplates = {
	rat_ogre = {
		cost = 200,
		text = "Summoning Rat Ogre!",
		texture_id = "twitch_rat_ogre",
		on_success = function (is_server)
			if is_server then
				Managers.state.conflict:spawn_one(Breeds.skaven_rat_ogre)
			end

			return 
		end
	},
	stormfiend = {
		cost = 200,
		text = "Summoning Storm Fiend!",
		texture_id = "twitch_rat_ogre",
		on_success = function (is_server)
			if is_server then
				Managers.state.conflict:spawn_one(Breeds.skaven_stormfiend)
			end

			return 
		end
	},
	chaos_troll = {
		cost = 200,
		text = "Summoning Chaos Troll!",
		texture_id = "twitch_rat_ogre",
		on_success = function (is_server)
			if is_server then
				Managers.state.conflict:spawn_one(Breeds.chaos_troll)
			end

			return 
		end
	},
	chaos_spawn = {
		cost = 200,
		text = "Summoning Chaos Spawn!",
		texture_id = "twitch_rat_ogre",
		on_success = function (is_server)
			if is_server then
				Managers.state.conflict:spawn_one(Breeds.chaos_spawn)
			end

			return 
		end
	},
	add_damage = {
		cost = 100,
		text = "Damage all players",
		texture_id = "twitch_icon_damage",
		on_success = function (is_server)
			if is_server then
				Application.error("[TWITCH VOTE] Adding damage to all players")

				local players = Managers.player:human_and_bot_players()

				for _, player in pairs(players) do
					local unit = player.player_unit

					if Unit.alive(unit) then
						DamageUtils.add_damage_network(unit, unit, 25, "full", "undefined", Vector3.up())
					end
				end
			end

			return 
		end
	},
	add_heal = {
		cost = -200,
		text = "Heal all players",
		texture_id = "twitch_icon_heal",
		on_success = function (is_server)
			if is_server then
				Application.error("[TWITCH VOTE] Healing all players")

				local players = Managers.player:human_and_bot_players()

				for _, player in pairs(players) do
					local unit = player.player_unit

					if Unit.alive(unit) then
						DamageUtils.heal_network(unit, unit, 25, "twitch")
					end
				end
			end

			return 
		end
	},
	add_heal_multiple_choice = {
		text = "Replenish health",
		cost = -200,
		texture_id = "twitch_icon_heal",
		multiple_choice = true,
		validation_func = function (vote_data)
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
		end,
		on_success = function (is_server, vote_index)
			if is_server then
				local selected_display_name = SPProfiles[vote_index].display_name
				local players = Managers.player:human_and_bot_players()

				for _, player in pairs(players) do
					local profile_index = player.profile_index(player)
					local profile = SPProfiles[profile_index]
					local display_name = profile.display_name

					if display_name == selected_display_name then
						Application.error(string.format("[TWITCH VOTE] Healing %s", Localize(profile.character_name)))

						local unit = player.player_unit

						if Unit.alive(unit) then
							DamageUtils.heal_network(unit, unit, 150, "twitch")
						end
					end
				end
			end

			return 
		end
	},
	add_damage_multiple_choice = {
		text = "Add Damage to player",
		cost = 200,
		texture_id = "twitch_icon_damage",
		multiple_choice = true,
		validation_func = function (vote_data)
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
		end,
		on_success = function (is_server, vote_index)
			if is_server then
				local selected_display_name = SPProfiles[vote_index].display_name
				local players = Managers.player:human_and_bot_players()

				for _, player in pairs(players) do
					local profile_index = player.profile_index(player)
					local profile = SPProfiles[profile_index]
					local display_name = profile.display_name

					if display_name == selected_display_name then
						Application.error(string.format("[TWITCH VOTE] Hurting %s", Localize(profile.character_name)))

						local unit = player.player_unit

						if Unit.alive(unit) then
							DamageUtils.add_damage_network(unit, unit, 50, "full", "undefined", Vector3.up())
						end
					end
				end
			end

			return 
		end
	},
	add_speed_boost = {
		cost = -100,
		text = "Speed boost all players",
		texture_id = "twitch_speed_boost",
		on_success = function (is_server)
			if is_server then
				Application.error("[TWITCH VOTE] Speed boosting all players")

				local players = Managers.player:human_and_bot_players()

				for _, player in pairs(players) do
					local unit = player.player_unit

					if Unit.alive(unit) then
						Managers.state.entity:system("buff_system"):add_buff(unit, "speed_boost_potion", unit, false)
					end
				end
			end

			return 
		end
	},
	add_damage_boost = {
		cost = -100,
		text = "Damage boost all players",
		texture_id = "twitch_damage_boost",
		on_success = function (is_server)
			if is_server then
				Application.error("[TWITCH VOTE] Damage boosting all players")

				local players = Managers.player:human_and_bot_players()

				for _, player in pairs(players) do
					local unit = player.player_unit

					if Unit.alive(unit) then
						Managers.state.entity:system("buff_system"):add_buff(unit, "damage_boost_potion", unit, false)
					end
				end
			end

			return 
		end
	},
	add_ammo = {
		cost = 0,
		text = "Ammo replenished",
		texture_id = "twitch_icon_ammo",
		on_success = function (is_server)
			Application.error("[TWITCH VOTE] Replenish ammo for all players")

			local local_player = Managers.player:local_player()
			local player_unit = local_player.player_unit

			if Unit.alive(player_unit) then
				local inventory_ext = ScriptUnit.has_extension(player_unit, "inventory_system")

				inventory_ext.add_ammo_from_pickup(inventory_ext)
			end

			return 
		end
	}
}
local TEMP_TABLE = {}
local min_diff = math.huge

for name, template in pairs(TwitchVoteTemplates) do
	TEMP_TABLE[name] = name

	for compare_name, compare_template in pairs(TwitchVoteTemplates) do
		if not TEMP_TABLE[compare_name] then
			local diff = math.abs(compare_template.cost + template.cost)

			if diff < min_diff then
				min_diff = diff
			end
		end
	end
end

fassert(min_diff <= TwitchSettings.max_diff, "[TwitchSettings] The minimum difference between vote templates exceeeds %s", TwitchSettings.max_diff)

TwitchVoteTemplatesLookup = {}
TwitchMultipleChoiceVoteTemplatesLookup = {}
TwitchStandardVoteTemplatesLookup = {}

for name, template in pairs(TwitchVoteTemplates) do
	TwitchVoteTemplatesLookup[#TwitchVoteTemplatesLookup + 1] = name
	TwitchVoteTemplatesLookup[name] = #TwitchVoteTemplatesLookup

	if template.multiple_choice then
		TwitchMultipleChoiceVoteTemplatesLookup[#TwitchMultipleChoiceVoteTemplatesLookup + 1] = name
		TwitchMultipleChoiceVoteTemplatesLookup[name] = #TwitchMultipleChoiceVoteTemplatesLookup
	else
		TwitchStandardVoteTemplatesLookup[#TwitchStandardVoteTemplatesLookup + 1] = name
		TwitchStandardVoteTemplatesLookup[name] = #TwitchStandardVoteTemplatesLookup
	end
end

return 

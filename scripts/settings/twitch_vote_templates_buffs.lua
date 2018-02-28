TwitchVoteTemplates = TwitchVoteTemplates or {}
TwitchVoteTemplates.add_speed_potion_buff = {
	cost = -100,
	text = "twitch_vote_speed_potion_buff_all",
	texture_id = "twitch_speed_boost",
	on_success = function (is_server)
		if is_server then
			Application.error("[TWITCH VOTE] Speed boosting all players")

			local players = Managers.player:human_and_bot_players()

			for _, player in pairs(players) do
				local unit = player.player_unit

				if Unit.alive(unit) then
					local buff_extension = Managers.state.entity:system("buff_system")
					local server_controlled = false

					buff_extension.add_buff(buff_extension, unit, "speed_boost_potion", unit, server_controlled)
				end
			end
		end

		return 
	end
}
TwitchVoteTemplates.add_damage_potion_buff = {
	cost = -100,
	text = "twitch_vote_damage_potion_buff_all",
	texture_id = "twitch_damage_boost",
	on_success = function (is_server)
		if is_server then
			Application.error("[TWITCH VOTE] Damage boosting all players")

			local players = Managers.player:human_and_bot_players()

			for _, player in pairs(players) do
				local unit = player.player_unit

				if Unit.alive(unit) then
					local buff_extension = Managers.state.entity:system("buff_system")
					local server_controlled = false

					buff_extension.add_buff(buff_extension, unit, "damage_boost_potion", unit, server_controlled)
				end
			end
		end

		return 
	end
}
TwitchVoteTemplates.add_cooldown_potion_buff = {
	cost = -100,
	text = "twitch_vote_cooldown_potion_buff_all",
	texture_id = "twitch_damage_boost",
	on_success = function (is_server)
		if is_server then
			Application.error("[TWITCH VOTE] Cooldown boosting all players")

			local players = Managers.player:human_and_bot_players()

			for _, player in pairs(players) do
				local unit = player.player_unit

				if Unit.alive(unit) then
					local buff_extension = Managers.state.entity:system("buff_system")
					local server_controlled = false

					buff_extension.add_buff(buff_extension, unit, "cooldown_reduction_potion", unit, server_controlled)
				end
			end
		end

		return 
	end
}
TwitchVoteTemplates.twitch_grimoire_health_debuff = {
	cost = 150,
	text = "twitch_vote_grimoire_health_debuff_all",
	texture_id = "twitch_damage_boost",
	on_success = function (is_server)
		if is_server then
			Application.error("[TWITCH VOTE] Adding grimoire health debuff")

			local players = Managers.player:human_and_bot_players()

			for _, player in pairs(players) do
				local unit = player.player_unit

				if Unit.alive(unit) then
					local buff_extension = Managers.state.entity:system("buff_system")
					local server_controlled = false

					buff_extension.add_buff(buff_extension, unit, "twitch_grimoire_health_debuff", unit, server_controlled)
				end
			end
		end

		return 
	end
}
TwitchVoteTemplates.twitch_no_overcharge_no_ammo_reloads = {
	cost = -200,
	text = "twitch_vote_twitch_no_overcharge_no_ammo_reloads_all",
	texture_id = "twitch_damage_boost",
	on_success = function (is_server)
		if is_server then
			Application.error("[TWITCH VOTE] Adding no overcharge/no ammo reloads buff")

			local players = Managers.player:human_and_bot_players()

			for _, player in pairs(players) do
				local unit = player.player_unit

				if Unit.alive(unit) then
					local buff_extension = Managers.state.entity:system("buff_system")
					local server_controlled = false

					buff_extension.add_buff(buff_extension, unit, "twitch_no_overcharge_no_ammo_reloads", unit, server_controlled)
				end
			end
		end

		return 
	end
}
TwitchVoteTemplates.twitch_health_regen = {
	cost = -200,
	text = "twitch_vote_health_regen_all",
	texture_id = "twitch_damage_boost",
	on_success = function (is_server)
		if is_server then
			Application.error("[TWITCH VOTE] Adding health regen for all")

			local players = Managers.player:human_and_bot_players()

			for _, player in pairs(players) do
				local unit = player.player_unit

				if Unit.alive(unit) then
					local buff_extension = Managers.state.entity:system("buff_system")
					local server_controlled = true

					buff_extension.add_buff(buff_extension, unit, "twitch_health_regen", unit, server_controlled)
				end
			end
		end

		return 
	end
}
TwitchVoteTemplates.twitch_health_degen = {
	cost = -200,
	text = "twitch_vote_health_degen_all",
	texture_id = "twitch_damage_boost",
	on_success = function (is_server)
		if is_server then
			Application.error("[TWITCH VOTE] Adding health degen for all")

			local players = Managers.player:human_and_bot_players()

			for _, player in pairs(players) do
				local unit = player.player_unit

				if Unit.alive(unit) then
					local buff_extension = Managers.state.entity:system("buff_system")
					local server_controlled = false

					buff_extension.add_buff(buff_extension, unit, "twitch_health_degen", unit, server_controlled)
				end
			end
		end

		return 
	end
}
TwitchVoteTemplates.twitch_power_boost_dismember = {
	cost = -200,
	text = "twitch_vote_power_boost_dismember_all",
	texture_id = "twitch_damage_boost",
	on_success = function (is_server)
		if is_server then
			Application.error("[TWITCH VOTE] Adding power boost and bloody mess for all")

			local players = Managers.player:human_and_bot_players()

			for _, player in pairs(players) do
				local unit = player.player_unit

				if Unit.alive(unit) then
					local buff_extension = Managers.state.entity:system("buff_system")
					local server_controlled = false

					buff_extension.add_buff(buff_extension, unit, "twitch_power_boost_dismember", unit, server_controlled)
				end
			end
		end

		return 
	end
}

return 

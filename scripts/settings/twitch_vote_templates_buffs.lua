local function debug_print(message, ...)
	if DEBUG_TWITCH then
		print("[Twitch] " .. string.format(message, ...))
	end

	return 
end

TwitchVoteTemplates = TwitchVoteTemplates or {}
TwitchVoteTemplates.twitch_add_speed_potion_buff = {
	cost = -200,
	use_frame_texture = true,
	texture_id = "potion_buff_02",
	text = "twitch_vote_speed_potion_buff_all",
	texture_size = {
		70,
		70
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Speed boosting all players")

			local players = Managers.player:human_and_bot_players()

			for _, player in pairs(players) do
				local unit = player.player_unit

				if Unit.alive(unit) then
					local buff_extension = Managers.state.entity:system("buff_system")
					local server_controlled = false

					buff_extension.add_buff(buff_extension, unit, "twitch_speed_boost", unit, server_controlled)
				end
			end
		end

		return 
	end
}
TwitchVoteTemplates.twitch_add_damage_potion_buff = {
	cost = -200,
	use_frame_texture = true,
	texture_id = "potion_buff_01",
	text = "twitch_vote_damage_potion_buff_all",
	texture_size = {
		70,
		70
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Damage boosting all players")

			local players = Managers.player:human_and_bot_players()

			for _, player in pairs(players) do
				local unit = player.player_unit

				if Unit.alive(unit) then
					local buff_extension = Managers.state.entity:system("buff_system")
					local server_controlled = false

					buff_extension.add_buff(buff_extension, unit, "twitch_damage_boost", unit, server_controlled)
				end
			end
		end

		return 
	end
}
TwitchVoteTemplates.twitch_add_cooldown_potion_buff = {
	cost = -200,
	use_frame_texture = true,
	texture_id = "potion_buff_03",
	text = "twitch_vote_cooldown_potion_buff_all",
	texture_size = {
		70,
		70
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Cooldown boosting all players")

			local players = Managers.player:human_and_bot_players()

			for _, player in pairs(players) do
				local unit = player.player_unit

				if Unit.alive(unit) then
					local buff_extension = Managers.state.entity:system("buff_system")
					local server_controlled = false

					buff_extension.add_buff(buff_extension, unit, "twitch_cooldown_reduction_boost", unit, server_controlled)
				end
			end
		end

		return 
	end
}
TwitchVoteTemplates.twitch_grimoire_health_debuff = {
	cost = 200,
	use_frame_texture = true,
	texture_id = "victor_witchhunter_increased_damage_on_grimoire_picked_up",
	text = "twitch_vote_grimoire_health_debuff_all",
	texture_size = {
		70,
		70
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Adding grimoire health debuff")

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
	use_frame_texture = true,
	texture_id = "victor_bountyhunter_passive_infinite_ammo",
	text = "twitch_vote_twitch_no_overcharge_no_ammo_reloads_all",
	texture_size = {
		70,
		70
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Adding no overcharge/no ammo reloads buff")

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
	use_frame_texture = true,
	texture_id = "bardin_ranger_activated_ability_heal",
	text = "twitch_vote_health_regen_all",
	texture_size = {
		70,
		70
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Adding health regen for all")

			local players = Managers.player:human_and_bot_players()

			for _, player in pairs(players) do
				local unit = player.player_unit

				if Unit.alive(unit) then
					local buff_extension = Managers.state.entity:system("buff_system")
					local server_controlled = false

					buff_extension.add_buff(buff_extension, unit, "twitch_health_regen", unit, server_controlled)
				end
			end
		end

		return 
	end
}
TwitchVoteTemplates.twitch_health_degen = {
	cost = 200,
	use_frame_texture = true,
	texture_id = "bardin_slayer_crit_chance",
	text = "twitch_vote_health_degen_all",
	texture_size = {
		70,
		70
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Adding health degen for all")

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
	use_frame_texture = true,
	texture_id = "markus_huntsman_activated_ability",
	text = "twitch_vote_power_boost_dismember_all",
	texture_size = {
		70,
		70
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Adding power boost and bloody mess for all")

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

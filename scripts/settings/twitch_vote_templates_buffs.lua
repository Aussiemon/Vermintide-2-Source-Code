local function debug_print(message, ...)
	if DEBUG_TWITCH then
		print("[Twitch] " .. string.format(message, ...))
	end
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

					buff_extension:add_buff(unit, "twitch_speed_boost", unit, server_controlled)
				end
			end
		end
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

					buff_extension:add_buff(unit, "twitch_damage_boost", unit, server_controlled)
				end
			end
		end
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

					buff_extension:add_buff(unit, "twitch_cooldown_reduction_boost", unit, server_controlled)
				end
			end
		end
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

					buff_extension:add_buff(unit, "twitch_grimoire_health_debuff", unit, server_controlled)
				end
			end
		end
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

					buff_extension:add_buff(unit, "twitch_no_overcharge_no_ammo_reloads", unit, server_controlled)

					local weapon_slot = "slot_ranged"
					local ammo_amount = 1
					local inventory_extension = ScriptUnit.extension(unit, "inventory_system")
					local slot_data = inventory_extension:get_slot_data(weapon_slot)
					local right_unit_1p = slot_data.right_unit_1p
					local left_unit_1p = slot_data.left_unit_1p
					local right_hand_ammo_extension = ScriptUnit.has_extension(right_unit_1p, "ammo_system")
					local left_hand_ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system")
					local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension

					if ammo_extension then
						ammo_extension:add_ammo(ammo_amount)
					end
				end
			end
		end
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

					buff_extension:add_buff(unit, "twitch_health_regen", unit, server_controlled)
				end
			end
		end
	end
}
TwitchVoteTemplates.twitch_health_degen = {
	cost = 100,
	use_frame_texture = true,
	texture_id = "bardin_slayer_crit_chance",
	multiple_choice = true,
	text = "twitch_vote_health_degen_all",
	texture_size = {
		70,
		70
	},
	on_success = function (is_server, vote_index)
		if is_server then
			debug_print("[TWITCH VOTE] Adding health degen for one")

			local players = Managers.player:human_and_bot_players()
			local selected_display_name = SPProfiles[vote_index].display_name

			for _, player in pairs(players) do
				local profile_index = player:profile_index()
				local profile = SPProfiles[profile_index]
				local display_name = profile.display_name

				if display_name == selected_display_name then
					local unit = player.player_unit

					if Unit.alive(unit) then
						local buff_extension = Managers.state.entity:system("buff_system")
						local server_controlled = false

						buff_extension:add_buff(unit, "twitch_health_degen", unit, server_controlled)
					end
				end
			end
		end
	end
}

return

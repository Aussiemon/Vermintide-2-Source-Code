-- chunkname: @scripts/settings/twitch_vote_templates_buffs.lua

local function debug_print(message, ...)
	if DEBUG_TWITCH then
		print("[Twitch] " .. string.format(message, ...))
	end
end

TwitchVoteTemplates = TwitchVoteTemplates or {}

local twitch_settings = TwitchSettings

TwitchVoteTemplates.twitch_add_speed_potion_buff = {
	cost = -200,
	text = "twitch_vote_speed_potion_buff_all",
	texture_id = "twitch_icon_boon_of_speed",
	use_frame_texture = true,
	texture_size = {
		70,
		70,
	},
	condition_func = function ()
		return not twitch_settings.disable_positive_votes
	end,
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Speed boosting all players")

			local players = Managers.player:human_and_bot_players()

			for _, player in pairs(players) do
				local unit = player.player_unit

				if Unit.alive(unit) then
					local buff_system = Managers.state.entity:system("buff_system")
					local server_controlled = false

					buff_system:add_buff(unit, "twitch_speed_boost", unit, server_controlled)
				end
			end
		end
	end,
}
TwitchVoteTemplates.twitch_add_damage_potion_buff = {
	cost = -200,
	text = "twitch_vote_damage_potion_buff_all",
	texture_id = "twitch_icon_boon_of_strength",
	use_frame_texture = true,
	texture_size = {
		70,
		70,
	},
	condition_func = function ()
		return not twitch_settings.disable_positive_votes
	end,
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Damage boosting all players")

			local players = Managers.player:human_and_bot_players()

			for _, player in pairs(players) do
				local unit = player.player_unit

				if Unit.alive(unit) then
					local buff_system = Managers.state.entity:system("buff_system")
					local server_controlled = false

					buff_system:add_buff(unit, "twitch_damage_boost", unit, server_controlled)
				end
			end
		end
	end,
}
TwitchVoteTemplates.twitch_add_cooldown_potion_buff = {
	cost = -200,
	text = "twitch_vote_cooldown_potion_buff_all",
	texture_id = "twitch_icon_boon_of_concentration",
	use_frame_texture = true,
	texture_size = {
		70,
		70,
	},
	condition_func = function ()
		return not twitch_settings.disable_positive_votes
	end,
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Cooldown boosting all players")

			local players = Managers.player:human_and_bot_players()

			for _, player in pairs(players) do
				local unit = player.player_unit

				if Unit.alive(unit) then
					local buff_system = Managers.state.entity:system("buff_system")
					local server_controlled = false

					buff_system:add_buff(unit, "twitch_cooldown_reduction_boost", unit, server_controlled)
				end
			end
		end
	end,
}
TwitchVoteTemplates.twitch_grimoire_health_debuff = {
	cost = 200,
	text = "twitch_vote_grimoire_health_debuff_all",
	texture_id = "twitch_icon_curse_of_the_rat",
	use_frame_texture = true,
	texture_size = {
		70,
		70,
	},
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Adding grimoire health debuff")

			local players = Managers.player:human_and_bot_players()

			for _, player in pairs(players) do
				local unit = player.player_unit

				if Unit.alive(unit) then
					local buff_system = Managers.state.entity:system("buff_system")
					local server_controlled = false

					buff_system:add_buff(unit, "twitch_grimoire_health_debuff", unit, server_controlled)
				end
			end
		end
	end,
}
TwitchVoteTemplates.twitch_no_overcharge_no_ammo_reloads = {
	cost = -200,
	text = "twitch_vote_twitch_no_overcharge_no_ammo_reloads_all",
	texture_id = "twitch_icon_guns_blazing",
	use_frame_texture = true,
	texture_size = {
		70,
		70,
	},
	condition_func = function ()
		return not twitch_settings.disable_positive_votes
	end,
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Adding no overcharge/no ammo reloads buff")

			local players = Managers.player:human_and_bot_players()

			for _, player in pairs(players) do
				local unit = player.player_unit

				if Unit.alive(unit) then
					local buff_system = Managers.state.entity:system("buff_system")
					local server_controlled = false

					buff_system:add_buff(unit, "twitch_no_overcharge_no_ammo_reloads", unit, server_controlled)

					local weapon_slot = "slot_ranged"
					local ammo_amount = 1
					local inventory_extension = ScriptUnit.extension(unit, "inventory_system")
					local slot_data = inventory_extension:get_slot_data(weapon_slot)
					local right_unit_1p = slot_data.right_unit_1p
					local left_unit_1p = slot_data.left_unit_1p
					local right_hand_ammo_extension = ScriptUnit.has_extension(right_unit_1p, "ammo_system")
					local left_hand_ammo_extension = ScriptUnit.has_extension(left_unit_1p, "ammo_system")
					local ammo_extension = right_hand_ammo_extension or left_hand_ammo_extension

					if ammo_extension and not inventory_extension:is_ammo_blocked() then
						ammo_extension:add_ammo(ammo_amount)
					end
				end
			end
		end
	end,
}
TwitchVoteTemplates.twitch_health_regen = {
	cost = -200,
	text = "twitch_vote_health_regen_all",
	texture_id = "twitch_icon_blessing_of_regeneration",
	use_frame_texture = true,
	texture_size = {
		70,
		70,
	},
	condition_func = function ()
		return not twitch_settings.disable_positive_votes
	end,
	on_success = function (is_server)
		if is_server then
			debug_print("[TWITCH VOTE] Adding health regen for all")

			local players = Managers.player:human_and_bot_players()

			for _, player in pairs(players) do
				local unit = player.player_unit

				if Unit.alive(unit) then
					local buff_system = Managers.state.entity:system("buff_system")
					local server_controlled = false

					buff_system:add_buff(unit, "twitch_health_regen", unit, server_controlled)
				end
			end
		end
	end,
}
TwitchVoteTemplates.twitch_health_degen = {
	cost = 100,
	multiple_choice = true,
	text = "twitch_vote_health_degen_all",
	texture_id = "twitch_icon_blood_loss",
	use_frame_texture = true,
	texture_size = {
		70,
		70,
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
						local buff_system = Managers.state.entity:system("buff_system")
						local server_controlled = false

						buff_system:add_buff(unit, "twitch_health_degen", unit, server_controlled)
					end
				end
			end
		end
	end,
}
TwitchVoteTemplates.twitch_vote_activate_root_all = {
	cost = 200,
	text = "display_name_twitch_root_all",
	texture_id = "twitch_icon_root_all_players",
	use_frame_texture = true,
	texture_size = {
		70,
		70,
	},
	condition_func = function ()
		local total_intensity = Managers.state.conflict.pacing:get_pacing_intensity()

		return total_intensity >= 80
	end,
	on_success = function (is_server, vote_index)
		if is_server then
			debug_print("[TWITCH VOTE] Adding root for all")

			local players = Managers.player:human_and_bot_players()

			for _, player in pairs(players) do
				local unit = player.player_unit

				if Unit.alive(unit) then
					local buff_system = Managers.state.entity:system("buff_system")
					local server_controlled = false

					buff_system:add_buff(unit, "twitch_vote_buff_root", unit, server_controlled)
				end
			end
		end
	end,
}
TwitchVoteTemplates.twitch_vote_activate_root = {
	cost = 100,
	multiple_choice = true,
	text = "display_name_twitch_root",
	texture_id = "twitch_icon_root_player",
	use_frame_texture = true,
	texture_size = {
		70,
		70,
	},
	condition_func = function ()
		local total_intensity = Managers.state.conflict.pacing:get_pacing_intensity()

		return total_intensity >= 80
	end,
	on_success = function (is_server, vote_index)
		if is_server then
			debug_print("[TWITCH VOTE] Adding root for one")

			local players = Managers.player:human_and_bot_players()
			local selected_display_name = SPProfiles[vote_index].display_name

			for _, player in pairs(players) do
				local profile_index = player:profile_index()
				local profile = SPProfiles[profile_index]
				local display_name = profile.display_name

				if display_name == selected_display_name then
					local unit = player.player_unit

					if Unit.alive(unit) then
						local buff_system = Managers.state.entity:system("buff_system")
						local server_controlled = false

						buff_system:add_buff(unit, "twitch_vote_buff_root", unit, server_controlled)
					end
				end
			end
		end
	end,
}
TwitchVoteTemplates.twitch_vote_hemmoraghe = {
	cost = 200,
	multiple_choice = true,
	text = "display_name_hemmoraghe",
	texture_id = "twitch_icon_hemmohage",
	use_frame_texture = true,
	texture_size = {
		70,
		70,
	},
	on_success = function (is_server, vote_index)
		if is_server then
			debug_print("[TWITCH VOTE] Adding hemmoraghe for one")

			local players = Managers.player:human_and_bot_players()
			local selected_display_name = SPProfiles[vote_index].display_name

			for _, player in pairs(players) do
				local profile_index = player:profile_index()
				local profile = SPProfiles[profile_index]
				local display_name = profile.display_name

				if display_name == selected_display_name then
					local unit = player.player_unit

					if Unit.alive(unit) then
						local buff_system = Managers.state.entity:system("buff_system")
						local server_controlled = false

						buff_system:add_buff(unit, "twitch_vote_buff_hemmoraghe", unit, server_controlled)
					end
				end
			end
		end
	end,
}
TwitchVoteTemplates.twitch_vote_full_temp_hp = {
	cost = -200,
	text = "display_name_twitch_full_temp_hp",
	texture_id = "twitch_icon_shield",
	use_frame_texture = true,
	texture_size = {
		70,
		70,
	},
	condition_func = function ()
		return not twitch_settings.disable_positive_votes
	end,
	on_success = function (is_server, vote_index)
		if is_server then
			debug_print("[TWITCH VOTE] Adding twitch_vote_full_temp_hp")

			local players = Managers.player:human_and_bot_players()

			for _, player in pairs(players) do
				local unit = player.player_unit

				if Unit.alive(unit) then
					local health_extension = ScriptUnit.extension(unit, "health_system")
					local heal_amount = health_extension:get_max_health()

					DamageUtils.heal_network(unit, unit, heal_amount, "healing_draught_temp_health")
				end
			end
		end
	end,
}
TwitchVoteTemplates.twitch_vote_critical_strikes = {
	cost = -200,
	text = "display_name_twitch_critical_strikes",
	texture_id = "twitch_icon_critical_senses",
	use_frame_texture = true,
	texture_size = {
		70,
		70,
	},
	condition_func = function ()
		return not twitch_settings.disable_positive_votes
	end,
	on_success = function (is_server, vote_index)
		if is_server then
			debug_print("[TWITCH VOTE] Adding twitch_vote_invisibility")

			local players = Managers.player:human_and_bot_players()

			for _, player in pairs(players) do
				local unit = player.player_unit

				if Unit.alive(unit) then
					local buff_system = Managers.state.entity:system("buff_system")
					local server_controlled = false

					buff_system:add_buff(unit, "twitch_vote_buff_critical_strikes", unit, server_controlled)
				end
			end
		end
	end,
}
TwitchVoteTemplates.twitch_vote_infinite_bombs = {
	cost = -200,
	multiple_choice = true,
	text = "display_name_twitch_infinite_bombs",
	texture_id = "twitch_icon_infinite_bomb",
	use_frame_texture = true,
	texture_size = {
		70,
		70,
	},
	condition_func = function ()
		return not twitch_settings.disable_positive_votes
	end,
	on_success = function (is_server, vote_index)
		if is_server then
			debug_print("[TWITCH VOTE] Adding twitch_vote_infinite_bombs for one")

			local players = Managers.player:human_and_bot_players()
			local selected_display_name = SPProfiles[vote_index].display_name

			for _, player in pairs(players) do
				local profile_index = player:profile_index()
				local profile = SPProfiles[profile_index]
				local display_name = profile.display_name

				if display_name == selected_display_name then
					local unit = player.player_unit

					if Unit.alive(unit) then
						local buff_system = Managers.state.entity:system("buff_system")
						local server_controlled = false

						buff_system:add_buff(unit, "twitch_vote_buff_infinite_bombs", unit, server_controlled)
					end
				end
			end
		end
	end,
}
TwitchVoteTemplates.twitch_vote_invincibility = {
	cost = -200,
	multiple_choice = true,
	text = "display_name_twitch_invincibility",
	texture_id = "twitch_icon_invincibility",
	use_frame_texture = true,
	texture_size = {
		70,
		70,
	},
	condition_func = function ()
		local total_intensity = Managers.state.conflict.pacing:get_pacing_intensity()

		return not twitch_settings.disable_positive_votes and total_intensity >= 100
	end,
	on_success = function (is_server, vote_index)
		if is_server then
			debug_print("[TWITCH VOTE] Adding twitch_vote_invincibility for one")

			local players = Managers.player:human_and_bot_players()
			local selected_display_name = SPProfiles[vote_index].display_name

			for _, player in pairs(players) do
				local profile_index = player:profile_index()
				local profile = SPProfiles[profile_index]
				local display_name = profile.display_name

				if display_name == selected_display_name then
					local unit = player.player_unit

					if Unit.alive(unit) then
						local buff_system = Managers.state.entity:system("buff_system")
						local server_controlled = false

						buff_system:add_buff(unit, "twitch_vote_buff_invincibility", unit, server_controlled)
					end
				end
			end
		end
	end,
}

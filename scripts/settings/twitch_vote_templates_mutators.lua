local twitch_settings = TwitchSettings

local function debug_print(message, ...)
	if DEBUG_TWITCH then
		print("[Twitch] " .. string.format(message, ...))
	end
end

TwitchVoteTemplates = TwitchVoteTemplates or {}

local function add_buff_to_all_players(buff_name)
	local players = Managers.player:human_and_bot_players()

	for _, player in pairs(players) do
		local unit = player.player_unit

		if Unit.alive(unit) then
			local buff_system = Managers.state.entity:system("buff_system")
			local server_controlled = false

			buff_system:add_buff(unit, buff_name, unit, server_controlled)
		end
	end
end

TwitchVoteTemplates.twitch_vote_activate_splitting_enemies = {
	text = "display_name_mutator_splitting_enemies",
	cost = 200,
	texture_id = "twitch_icon_splitting_enemies",
	description = "description_mutator_splitting_enemies",
	texture_size = {
		60,
		70
	},
	condition_func = function (current_vote)
		return not Managers.state.game_mode._mutator_handler:has_activated_mutator("splitting_enemies") and not twitch_settings.disable_mutators
	end,
	on_success = function (is_server)
		if is_server then
			local mutator_handler = Managers.state.game_mode._mutator_handler
			local mutator_name = "splitting_enemies"
			local duration = 30 * twitch_settings.mutator_duration_multiplier

			debug_print(string.format("[TWITCH VOTE] Activating mutator %s", mutator_name))
			mutator_handler:initialize_mutators({
				mutator_name
			})
			mutator_handler:activate_mutator(mutator_name, duration, "activated_by_twitch")
			add_buff_to_all_players("twitch_mutator_buff_splitting_enemies")
		end
	end
}
TwitchVoteTemplates.twitch_vote_activate_leash = {
	text = "display_name_mutator_leash",
	cost = 200,
	texture_id = "twitch_icon_leash",
	description = "description_mutator_leash",
	texture_size = {
		60,
		70
	},
	condition_func = function (current_vote)
		local num_human_players = Managers.player:num_human_players()

		return num_human_players > 1 and not Managers.state.game_mode._mutator_handler:has_activated_mutator("leash") and not twitch_settings.disable_mutators
	end,
	on_success = function (is_server)
		if is_server then
			local mutator_handler = Managers.state.game_mode._mutator_handler
			local mutator_name = "leash"
			local duration = 30 * twitch_settings.mutator_duration_multiplier

			debug_print(string.format("[TWITCH VOTE] Activating mutator %s", mutator_name))
			mutator_handler:initialize_mutators({
				mutator_name
			})
			mutator_handler:activate_mutator(mutator_name, duration, "activated_by_twitch")
			add_buff_to_all_players("twitch_mutator_buff_leash")
		end
	end
}
TwitchVoteTemplates.twitch_vote_activate_slayer_curse = {
	text = "display_name_mutator_slayer_curse",
	cost = 200,
	texture_id = "twitch_icon_slayer_curse",
	description = "description_mutator_slayer_curse",
	texture_size = {
		60,
		70
	},
	condition_func = function (current_vote)
		return not Managers.state.game_mode._mutator_handler:has_activated_mutator("slayer_curse") and not twitch_settings.disable_mutators
	end,
	on_success = function (is_server)
		if is_server then
			local mutator_handler = Managers.state.game_mode._mutator_handler
			local mutator_name = "slayer_curse"
			local duration = 30 * twitch_settings.mutator_duration_multiplier

			debug_print(string.format("[TWITCH VOTE] Activating mutator %s", mutator_name))
			mutator_handler:initialize_mutators({
				mutator_name
			})
			mutator_handler:activate_mutator(mutator_name, duration, "activated_by_twitch")
			add_buff_to_all_players("twitch_mutator_buff_slayers_curse")
		end
	end
}
TwitchVoteTemplates.twitch_vote_activate_bloodlust = {
	text = "display_name_mutator_bloodlust",
	cost = 200,
	texture_id = "twitch_icon_bloodlust",
	description = "description_mutator_bloodlust",
	texture_size = {
		60,
		70
	},
	condition_func = function (current_vote)
		return not Managers.state.game_mode._mutator_handler:has_activated_mutator("bloodlust") and not twitch_settings.disable_mutators
	end,
	on_success = function (is_server)
		if is_server then
			local mutator_handler = Managers.state.game_mode._mutator_handler
			local mutator_name = "bloodlust"
			local duration = 30 * twitch_settings.mutator_duration_multiplier

			debug_print(string.format("[TWITCH VOTE] Activating mutator %s", mutator_name))
			mutator_handler:initialize_mutators({
				mutator_name
			})
			mutator_handler:activate_mutator(mutator_name, duration, "activated_by_twitch")
			add_buff_to_all_players("twitch_mutator_buff_bloodlust")
		end
	end
}
TwitchVoteTemplates.twitch_vote_activate_realism = {
	text = "display_name_mutator_realism",
	cost = 200,
	texture_id = "twitch_icon_realism",
	description = "description_mutator_realism",
	texture_size = {
		60,
		70
	},
	condition_func = function (current_vote)
		return not Managers.state.game_mode._mutator_handler:has_activated_mutator("realism") and not twitch_settings.disable_mutators
	end,
	on_success = function (is_server)
		if is_server then
			local mutator_handler = Managers.state.game_mode._mutator_handler
			local mutator_name = "realism"
			local duration = 60 * twitch_settings.mutator_duration_multiplier

			debug_print(string.format("[TWITCH VOTE] Activating mutator %s", mutator_name))
			mutator_handler:initialize_mutators({
				mutator_name
			})
			mutator_handler:activate_mutator(mutator_name, duration, "activated_by_twitch")
		end
	end
}
TwitchVoteTemplates.twitch_vote_activate_darkness = {
	text = "display_name_mutator_darkness",
	cost = 200,
	texture_id = "twitch_icon_darkness",
	description = "description_mutator_darkness",
	texture_size = {
		60,
		70
	},
	condition_func = function (current_vote)
		return not Managers.state.game_mode._mutator_handler:has_activated_mutator("darkness") and not Managers.state.game_mode._mutator_handler:has_activated_mutator("twitch_darkness") and not Managers.state.game_mode._mutator_handler:has_activated_mutator("night_mode") and Managers.level_transition_handler:get_current_environment_variation_id() ~= 0 and not twitch_settings.disable_mutators
	end,
	on_success = function (is_server)
		if is_server then
			local mutator_handler = Managers.state.game_mode._mutator_handler
			local mutator_name = "twitch_darkness"
			local duration = 30 * twitch_settings.mutator_duration_multiplier

			debug_print(string.format("[TWITCH VOTE] Activating mutator %s", mutator_name))
			mutator_handler:initialize_mutators({
				mutator_name
			})
			mutator_handler:activate_mutator(mutator_name, duration, "activated_by_twitch")
		end
	end
}
TwitchVoteTemplates.twitch_vote_activate_ticking_bomb = {
	text = "display_name_mutator_ticking_bomb",
	cost = 100,
	texture_id = "twitch_icon_ticking_bomb",
	description = "description_mutator_ticking_bomb",
	texture_size = {
		60,
		70
	},
	condition_func = function (current_vote)
		return not Managers.state.game_mode._mutator_handler:has_activated_mutator("ticking_bomb") and not twitch_settings.disable_mutators
	end,
	on_success = function (is_server)
		if is_server then
			local mutator_handler = Managers.state.game_mode._mutator_handler
			local mutator_name = "ticking_bomb"
			local duration = 30 * twitch_settings.mutator_duration_multiplier

			debug_print(string.format("[TWITCH VOTE] Activating mutator %s", mutator_name))
			mutator_handler:initialize_mutators({
				mutator_name
			})
			mutator_handler:activate_mutator(mutator_name, duration, "activated_by_twitch")
			add_buff_to_all_players("twitch_mutator_buff_ticking_bomb")
		end
	end
}
TwitchVoteTemplates.twitch_vote_activate_lightning_strike = {
	text = "display_name_lightning_strike",
	cost = 100,
	texture_id = "twitch_icon_heavens_lightning",
	description = "description_mutator_lightning_strike",
	texture_size = {
		60,
		70
	},
	condition_func = function (current_vote)
		return not Managers.state.game_mode._mutator_handler:has_activated_mutator("lightning_strike") and not twitch_settings.disable_mutators
	end,
	on_success = function (is_server)
		if is_server then
			local mutator_handler = Managers.state.game_mode._mutator_handler
			local mutator_name = "lightning_strike"
			local duration = 33 * twitch_settings.mutator_duration_multiplier

			debug_print(string.format("[TWITCH VOTE] Activating mutator %s", mutator_name))
			mutator_handler:initialize_mutators({
				mutator_name
			})
			mutator_handler:activate_mutator(mutator_name, duration, "activated_by_twitch")
			add_buff_to_all_players("twitch_mutator_buff_lightning_strike")
		end
	end
}
TwitchVoteTemplates.twitch_vote_activate_chasing_spirits = {
	text = "display_name_chasing_spirits",
	cost = 100,
	texture_id = "twitch_icon_death_spirits",
	description = "description_mutator_chasing_spirits",
	texture_size = {
		60,
		70
	},
	condition_func = function (current_vote)
		return not Managers.state.game_mode._mutator_handler:has_activated_mutator("chasing_spirits") and not twitch_settings.disable_mutators
	end,
	on_success = function (is_server)
		if is_server then
			local mutator_handler = Managers.state.game_mode._mutator_handler
			local mutator_name = "chasing_spirits"
			local duration = 30 * twitch_settings.mutator_duration_multiplier

			debug_print(string.format("[TWITCH VOTE] Activating mutator %s", mutator_name))
			mutator_handler:initialize_mutators({
				mutator_name
			})
			mutator_handler:activate_mutator(mutator_name, duration, "activated_by_twitch")
			add_buff_to_all_players("twitch_mutator_buff_chasing_spirits")
		end
	end
}
TwitchVoteTemplates.twitch_vote_activate_flames = {
	text = "display_name_flames",
	cost = 100,
	texture_id = "twitch_icon_fire_burn",
	description = "description_mutator_flames",
	texture_size = {
		60,
		70
	},
	condition_func = function (current_vote)
		return not Managers.state.game_mode._mutator_handler:has_activated_mutator("flames") and not twitch_settings.disable_mutators
	end,
	on_success = function (is_server)
		if is_server then
			local mutator_handler = Managers.state.game_mode._mutator_handler
			local mutator_name = "flames"
			local duration = 30 * twitch_settings.mutator_duration_multiplier

			debug_print(string.format("[TWITCH VOTE] Activating mutator %s", mutator_name))
			mutator_handler:initialize_mutators({
				mutator_name
			})
			mutator_handler:activate_mutator(mutator_name, duration, "activated_by_twitch")
			add_buff_to_all_players("twitch_mutator_buff_flames")
		end
	end
}

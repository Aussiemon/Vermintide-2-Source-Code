-- chunkname: @scripts/ui/views/ingame_view_menu_layout.lua

local function player_stuck_cb()
	local level_key = Managers.state.game_mode:level_key()
	local player = Managers.player:local_player()

	if player and Unit.alive(player.player_unit) then
		Managers.telemetry_events:player_stuck(player, level_key)
	end
end

local default_disable_for_mechanism = {
	adventure = {
		matchmaking = false,
		matchmaking_ready = true,
		not_matchmaking = false,
	},
	versus = {
		matchmaking = false,
		matchmaking_ready = true,
		not_matchmaking = false,
	},
	deus = {
		matchmaking = false,
		matchmaking_ready = true,
		not_matchmaking = false,
	},
}
local disable_for_mechanism_versus_disabled = {
	adventure = {
		matchmaking = false,
		matchmaking_ready = true,
		not_matchmaking = false,
	},
	versus = {
		matchmaking = true,
		matchmaking_ready = true,
		not_matchmaking = true,
	},
	deus = {
		matchmaking = false,
		matchmaking_ready = true,
		not_matchmaking = false,
	},
}
local tobii_contest_url = "https://vermintide2beta.com/?utm_medium=referral&utm_campaign=vermintide2beta&utm_source=ingame#challenge"
local leave_party_button_text = IS_XB1 and "leave_party_menu_button_name_xb1" or "leave_party_menu_button_name"
local disband_party_button_text = IS_XB1 and "disband_party_menu_button_name_xb1" or "disband_party_menu_button_name"
local quit_menu_button_text = IS_XB1 and "quit_menu_button_name_xb1" or "quit_menu_button_name_ps4"
local menu_layouts = {}

if IS_PS4 then
	menu_layouts = {
		in_menu = {
			alone = {
				{
					display_name = "return_to_game_button_name",
					fade = false,
					transition = "exit_menu",
				},
				{
					display_name = "profile_menu_button_name",
					fade = true,
					requires_player_unit = true,
					transition = "character_selection",
					transition_state = "character",
					disable_for_mechanism = default_disable_for_mechanism,
				},
				{
					display_name = "interact_open_inventory_chest",
					fade = true,
					requires_player_unit = true,
					transition = "hero_view_force",
					transition_state = "overview",
				},
				{
					display_name = "options_menu_button_name",
					fade = true,
					transition = "options_menu",
					disable_for_mechanism = default_disable_for_mechanism,
				},
				{
					fade = false,
					transition = "return_to_title_screen",
					display_name = quit_menu_button_text,
				},
			},
			host = {
				{
					display_name = "return_to_game_button_name",
					fade = false,
					transition = "exit_menu",
				},
				{
					display_name = "profile_menu_button_name",
					fade = true,
					requires_player_unit = true,
					transition = "character_selection",
					transition_state = "character",
					disable_for_mechanism = default_disable_for_mechanism,
				},
				{
					display_name = "interact_open_inventory_chest",
					fade = true,
					requires_player_unit = true,
					transition = "hero_view_force",
					transition_state = "overview",
				},
				{
					display_name = "options_menu_button_name",
					fade = true,
					transition = "options_menu",
					disable_for_mechanism = default_disable_for_mechanism,
				},
				{
					fade = false,
					transition = "leave_group",
					display_name = disband_party_button_text,
				},
				{
					fade = false,
					transition = "return_to_title_screen",
					display_name = quit_menu_button_text,
				},
			},
			client = {
				{
					display_name = "return_to_game_button_name",
					fade = false,
					transition = "exit_menu",
				},
				{
					display_name = "profile_menu_button_name",
					fade = true,
					requires_player_unit = true,
					transition = "character_selection",
					transition_state = "character",
					disable_for_mechanism = default_disable_for_mechanism,
				},
				{
					display_name = "interact_open_inventory_chest",
					fade = true,
					requires_player_unit = true,
					transition = "hero_view_force",
					transition_state = "overview",
				},
				{
					display_name = "options_menu_button_name",
					fade = true,
					transition = "options_menu",
					disable_for_mechanism = default_disable_for_mechanism,
				},
				{
					fade = false,
					transition = "leave_group",
					display_name = leave_party_button_text,
				},
				{
					fade = false,
					transition = "return_to_title_screen",
					display_name = quit_menu_button_text,
				},
			},
			demo = {
				{
					display_name = "return_to_game_button_name",
					transition = "exit_menu",
				},
				{
					display_name = "menu_restart",
					transition = "restart_demo",
				},
				{
					display_name = "menu_invert_controls",
					transition = "demo_invert_controls",
				},
				{
					display_name = "menu_return_to_title_screen",
					transition = "return_to_demo_title_screen",
				},
			},
		},
		in_game = {
			alone = {
				{
					display_name = "return_to_game_button_name",
					fade = false,
					transition = "exit_menu",
				},
				{
					display_name = "options_menu_button_name",
					fade = true,
					transition = "options_menu",
					disable_for_mechanism = default_disable_for_mechanism,
				},
				{
					display_name = "leave_game_menu_button_name",
					fade = false,
					transition = "leave_group",
				},
				{
					fade = false,
					transition = "return_to_title_screen",
					display_name = quit_menu_button_text,
				},
			},
			host = {
				{
					display_name = "return_to_game_button_name",
					fade = false,
					transition = "exit_menu",
				},
				{
					display_name = "options_menu_button_name",
					fade = true,
					transition = "options_menu",
					disable_for_mechanism = default_disable_for_mechanism,
				},
				{
					fade = false,
					transition = "leave_group",
					display_name = disband_party_button_text,
				},
				{
					fade = false,
					transition = "return_to_title_screen",
					display_name = quit_menu_button_text,
				},
			},
			client = {
				{
					display_name = "return_to_game_button_name",
					fade = false,
					transition = "exit_menu",
				},
				{
					display_name = "options_menu_button_name",
					fade = true,
					transition = "options_menu",
					disable_for_mechanism = default_disable_for_mechanism,
				},
				{
					fade = false,
					transition = "leave_group",
					display_name = leave_party_button_text,
				},
				{
					fade = false,
					transition = "return_to_title_screen",
					display_name = quit_menu_button_text,
				},
			},
			tutorial = {
				{
					display_name = "return_to_game_button_name",
					transition = "exit_menu",
				},
				{
					display_name = "options_menu_button_name",
					transition = "options_menu",
				},
				{
					display_name = "leave_game_menu_button_name",
					fade = false,
					transition = "leave_group",
				},
				{
					transition = "return_to_title_screen",
					display_name = quit_menu_button_text,
				},
			},
			demo = {
				{
					display_name = "return_to_game_button_name",
					transition = "exit_menu",
				},
				{
					display_name = "menu_restart",
					transition = "restart_demo",
				},
				{
					display_name = "menu_invert_controls",
					transition = "demo_invert_controls",
				},
				{
					display_name = "menu_return_to_title_screen",
					transition = "return_to_demo_title_screen",
				},
			},
		},
	}
elseif IS_XB1 then
	menu_layouts = {
		in_menu = {
			alone = {
				{
					display_name = "return_to_game_button_name",
					fade = false,
					transition = "exit_menu",
				},
				{
					display_name = "profile_menu_button_name",
					fade = true,
					requires_player_unit = true,
					transition = "character_selection",
					transition_state = "character",
					disable_for_mechanism = default_disable_for_mechanism,
				},
				{
					display_name = "interact_open_inventory_chest",
					fade = true,
					requires_player_unit = true,
					transition = "hero_view_force",
					transition_state = "overview",
				},
				{
					display_name = "options_menu_button_name",
					fade = true,
					transition = "options_menu",
					disable_for_mechanism = default_disable_for_mechanism,
				},
				{
					display_name = "leave_game_menu_button_name",
					fade = false,
					transition = "leave_group",
				},
				{
					fade = false,
					transition = "return_to_title_screen",
					display_name = quit_menu_button_text,
				},
			},
			host = {
				{
					display_name = "return_to_game_button_name",
					fade = false,
					transition = "exit_menu",
				},
				{
					display_name = "profile_menu_button_name",
					fade = true,
					requires_player_unit = true,
					transition = "character_selection",
					transition_state = "character",
					disable_for_mechanism = default_disable_for_mechanism,
				},
				{
					display_name = "interact_open_inventory_chest",
					fade = true,
					requires_player_unit = true,
					transition = "hero_view_force",
					transition_state = "overview",
				},
				{
					display_name = "options_menu_button_name",
					fade = true,
					transition = "options_menu",
					disable_for_mechanism = default_disable_for_mechanism,
				},
				{
					fade = false,
					transition = "leave_group",
					display_name = disband_party_button_text,
				},
				{
					fade = false,
					transition = "return_to_title_screen",
					display_name = quit_menu_button_text,
				},
			},
			client = {
				{
					display_name = "return_to_game_button_name",
					fade = false,
					transition = "exit_menu",
				},
				{
					display_name = "profile_menu_button_name",
					fade = true,
					requires_player_unit = true,
					transition = "character_selection",
					transition_state = "character",
					disable_for_mechanism = default_disable_for_mechanism,
				},
				{
					display_name = "interact_open_inventory_chest",
					fade = true,
					requires_player_unit = true,
					transition = "hero_view_force",
					transition_state = "overview",
				},
				{
					display_name = "options_menu_button_name",
					fade = true,
					transition = "options_menu",
					disable_for_mechanism = default_disable_for_mechanism,
				},
				{
					fade = false,
					transition = "leave_group",
					display_name = leave_party_button_text,
				},
				{
					fade = false,
					transition = "return_to_title_screen",
					display_name = quit_menu_button_text,
				},
			},
			demo = {
				{
					display_name = "return_to_game_button_name",
					transition = "exit_menu",
				},
				{
					display_name = "menu_restart",
					transition = "restart_demo",
				},
				{
					display_name = "menu_invert_controls",
					transition = "demo_invert_controls",
				},
				{
					display_name = "menu_return_to_title_screen",
					transition = "return_to_demo_title_screen",
				},
			},
		},
		in_game = {
			alone = {
				{
					display_name = "return_to_game_button_name",
					fade = false,
					transition = "exit_menu",
				},
				{
					display_name = "options_menu_button_name",
					fade = true,
					transition = "options_menu",
					disable_for_mechanism = default_disable_for_mechanism,
				},
				{
					display_name = "leave_game_menu_button_name",
					fade = false,
					transition = "leave_group",
				},
				{
					fade = false,
					transition = "return_to_title_screen",
					display_name = quit_menu_button_text,
				},
			},
			host = {
				{
					display_name = "return_to_game_button_name",
					fade = false,
					transition = "exit_menu",
				},
				{
					display_name = "options_menu_button_name",
					fade = true,
					transition = "options_menu",
					disable_for_mechanism = default_disable_for_mechanism,
				},
				{
					fade = false,
					transition = "leave_group",
					display_name = disband_party_button_text,
				},
				{
					fade = false,
					transition = "return_to_title_screen",
					display_name = quit_menu_button_text,
				},
			},
			client = {
				{
					display_name = "return_to_game_button_name",
					fade = false,
					transition = "exit_menu",
				},
				{
					display_name = "options_menu_button_name",
					fade = true,
					transition = "options_menu",
					disable_for_mechanism = default_disable_for_mechanism,
				},
				{
					fade = false,
					transition = "leave_group",
					display_name = leave_party_button_text,
				},
				{
					fade = false,
					transition = "return_to_title_screen",
					display_name = quit_menu_button_text,
				},
			},
			tutorial = {
				{
					display_name = "return_to_game_button_name",
					transition = "exit_menu",
				},
				{
					display_name = "options_menu_button_name",
					transition = "options_menu",
				},
				{
					display_name = "leave_game_menu_button_name",
					fade = false,
					transition = "leave_group",
				},
				{
					transition = "return_to_title_screen",
					display_name = quit_menu_button_text,
				},
			},
			demo = {
				{
					display_name = "return_to_game_button_name",
					transition = "exit_menu",
				},
				{
					display_name = "menu_restart",
					transition = "restart_demo",
				},
				{
					display_name = "menu_invert_controls",
					transition = "demo_invert_controls",
				},
				{
					display_name = "menu_return_to_title_screen",
					transition = "return_to_demo_title_screen",
				},
			},
		},
	}
else
	menu_layouts = {
		in_menu = {
			alone = {
				{
					display_name = "return_to_game_button_name",
					fade = false,
					transition = "exit_menu",
				},
				{
					display_name = "profile_menu_button_name",
					fade = true,
					requires_player_unit = true,
					transition = "character_selection",
					transition_state = "character",
					disable_for_mechanism = default_disable_for_mechanism,
				},
				{
					display_name = "interact_open_inventory_chest",
					fade = true,
					requires_player_unit = true,
					transition = "hero_view_force",
					transition_state = "overview",
				},
				{
					display_name = "options_menu_button_name",
					fade = true,
					transition = "options_menu",
					disable_for_mechanism = default_disable_for_mechanism,
				},
				{
					display_name = "leave_game_menu_button_name",
					fade = false,
					transition = "leave_group",
				},
				{
					display_name = "menu_return_to_title_screen",
					fade = false,
					transition = "return_to_title_screen",
				},
				{
					display_name = "quit_menu_button_name",
					fade = false,
					transition = "quit_game_hero_view_legacy",
				},
			},
			host = {
				{
					display_name = "return_to_game_button_name",
					fade = false,
					transition = "exit_menu",
				},
				{
					display_name = "profile_menu_button_name",
					fade = true,
					requires_player_unit = true,
					transition = "character_selection",
					transition_state = "character",
					disable_for_mechanism = default_disable_for_mechanism,
				},
				{
					display_name = "interact_open_inventory_chest",
					fade = true,
					requires_player_unit = true,
					transition = "hero_view_force",
					transition_state = "overview",
				},
				{
					display_name = "options_menu_button_name",
					fade = true,
					transition = "options_menu",
					disable_for_mechanism = default_disable_for_mechanism,
				},
				{
					fade = false,
					transition = "leave_group",
					display_name = disband_party_button_text,
				},
				{
					display_name = "menu_return_to_title_screen",
					fade = false,
					transition = "return_to_title_screen",
				},
				{
					display_name = "quit_menu_button_name",
					fade = false,
					transition = "quit_game_hero_view_legacy",
				},
			},
			client = {
				{
					display_name = "return_to_game_button_name",
					fade = false,
					transition = "exit_menu",
				},
				{
					display_name = "profile_menu_button_name",
					fade = true,
					requires_player_unit = true,
					transition = "character_selection",
					transition_state = "character",
					disable_for_mechanism = default_disable_for_mechanism,
				},
				{
					display_name = "interact_open_inventory_chest",
					fade = true,
					requires_player_unit = true,
					transition = "hero_view_force",
					transition_state = "overview",
				},
				{
					display_name = "options_menu_button_name",
					fade = true,
					transition = "options_menu",
					disable_for_mechanism = default_disable_for_mechanism,
				},
				{
					fade = false,
					transition = "leave_group",
					display_name = leave_party_button_text,
				},
				{
					display_name = "menu_return_to_title_screen",
					fade = false,
					transition = "return_to_title_screen",
				},
				{
					display_name = "quit_menu_button_name",
					fade = false,
					transition = "quit_game_hero_view_legacy",
				},
			},
			demo = {
				{
					display_name = "return_to_game_button_name",
					transition = "exit_menu",
				},
				{
					display_name = "menu_restart",
					transition = "restart_demo",
				},
				{
					display_name = "menu_invert_controls",
					transition = "demo_invert_controls",
				},
				{
					display_name = "menu_return_to_title_screen",
					transition = "return_to_demo_title_screen",
				},
			},
		},
		in_game = {
			alone = {
				{
					display_name = "return_to_game_button_name",
					fade = false,
					transition = "exit_menu",
				},
				{
					display_name = "options_menu_button_name",
					fade = true,
					transition = "options_menu",
					disable_for_mechanism = default_disable_for_mechanism,
				},
				{
					display_name = "leave_game_menu_button_name",
					fade = false,
					transition = "leave_group",
				},
				{
					display_name = "menu_return_to_title_screen",
					fade = false,
					transition = "return_to_title_screen",
				},
				{
					display_name = "quit_menu_button_name",
					fade = false,
					transition = "quit_game_hero_view_legacy",
				},
			},
			host = {
				{
					display_name = "return_to_game_button_name",
					fade = false,
					transition = "exit_menu",
				},
				{
					display_name = "options_menu_button_name",
					fade = true,
					transition = "options_menu",
					disable_for_mechanism = default_disable_for_mechanism,
				},
				{
					fade = false,
					transition = "leave_group",
					display_name = disband_party_button_text,
				},
				{
					display_name = "menu_return_to_title_screen",
					fade = false,
					transition = "return_to_title_screen",
				},
				{
					display_name = "quit_menu_button_name",
					fade = false,
					transition = "quit_game_hero_view_legacy",
				},
			},
			client = {
				{
					display_name = "return_to_game_button_name",
					fade = false,
					transition = "exit_menu",
				},
				{
					display_name = "options_menu_button_name",
					fade = true,
					transition = "options_menu",
					disable_for_mechanism = default_disable_for_mechanism,
				},
				{
					fade = false,
					transition = "leave_group",
					display_name = leave_party_button_text,
				},
				{
					display_name = "menu_return_to_title_screen",
					fade = false,
					transition = "return_to_title_screen",
				},
				{
					display_name = "quit_menu_button_name",
					fade = false,
					transition = "quit_game_hero_view_legacy",
				},
			},
			tutorial = {
				{
					display_name = "return_to_game_button_name",
					transition = "exit_menu",
				},
				{
					display_name = "options_menu_button_name",
					transition = "options_menu",
				},
				{
					display_name = "leave_game_menu_button_name",
					fade = false,
					transition = "leave_group",
				},
				{
					display_name = "menu_return_to_title_screen",
					transition = "return_to_title_screen",
				},
				{
					display_name = "quit_menu_button_name",
					fade = false,
					transition = "quit_game_hero_view_legacy",
				},
			},
			demo = {
				{
					display_name = "return_to_game_button_name",
					transition = "exit_menu",
				},
				{
					display_name = "menu_restart",
					transition = "restart_demo",
				},
				{
					display_name = "menu_invert_controls",
					transition = "demo_invert_controls",
				},
				{
					display_name = "menu_return_to_title_screen",
					transition = "return_to_demo_title_screen",
				},
				{
					display_name = "quit_menu_button_name",
					fade = false,
					transition = "quit_game_hero_view_legacy",
				},
			},
		},
	}
end

if GameSettingsDevelopment.use_global_chat and IS_WINDOWS then
	table.insert(menu_layouts.in_menu.host, 4, {
		display_name = "chat_menu_button_name",
		fade = false,
		transition = "chat_view",
	})
	table.insert(menu_layouts.in_menu.client, 4, {
		display_name = "chat_menu_button_name",
		fade = false,
		transition = "chat_view",
	})
	table.insert(menu_layouts.in_menu.alone, 4, {
		display_name = "chat_menu_button_name",
		fade = false,
		transition = "chat_view",
	})
	table.insert(menu_layouts.in_game.host, 4, {
		display_name = "chat_menu_button_name",
		fade = false,
		transition = "chat_view",
	})
	table.insert(menu_layouts.in_game.client, 4, {
		display_name = "chat_menu_button_name",
		fade = false,
		transition = "chat_view",
	})
	table.insert(menu_layouts.in_game.alone, 4, {
		display_name = "chat_menu_button_name",
		fade = false,
		transition = "chat_view",
	})
end

local full_access_layout = {
	{
		display_name = "return_to_game_button_name",
		fade = false,
		transition = "exit_menu",
	},
	{
		display_name = "profile_menu_button_name",
		fade = true,
		requires_player_unit = true,
		transition = "character_selection",
		transition_state = "character",
		disable_for_mechanism = default_disable_for_mechanism,
	},
	{
		display_name = "inventory_menu_button_name",
		fade = true,
		requires_player_unit = true,
		transition = "hero_view",
		transition_state = "overview",
	},
	{
		display_name = "start_menu_view",
		fade = true,
		requires_player_unit = true,
		transition = "start_menu_view",
	},
	{
		display_name = "options_menu_button_name",
		fade = true,
		transition = "options_menu",
		disable_for_mechanism = default_disable_for_mechanism,
	},
	{
		display_name = "leave_game_menu_button_name",
		fade = false,
		transition = "leave_group",
	},
	{
		display_name = "quit_menu_button_name",
		fade = false,
		transition = "quit_game",
	},
}

return {
	menu_layouts = menu_layouts,
	full_access_layout = full_access_layout,
}

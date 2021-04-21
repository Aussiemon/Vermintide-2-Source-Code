local function player_stuck_cb()
	local level_key = Managers.state.game_mode:level_key()
	local player = Managers.player:local_player()

	if player and Unit.alive(player.player_unit) then
		Managers.telemetry.events:player_stuck(player, level_key)
	end
end

local tobii_contest_url = "https://vermintide2beta.com/?utm_medium=referral&utm_campaign=vermintide2beta&utm_source=ingame#challenge"
local leave_party_button_text = (IS_XB1 and "leave_party_menu_button_name_xb1") or "leave_party_menu_button_name"
local disband_party_button_text = (IS_XB1 and "disband_party_menu_button_name_xb1") or "disband_party_menu_button_name"
local quit_menu_button_text = (IS_XB1 and "quit_menu_button_name_xb1") or "quit_menu_button_name_ps4"
local menu_layouts = {}

if IS_PS4 then
	menu_layouts = {
		in_menu = {
			alone = {
				{
					fade = false,
					transition = "exit_menu",
					display_name = "return_to_game_button_name"
				},
				{
					disable_when_matchmaking_ready = true,
					display_name = "profile_menu_button_name",
					requires_player_unit = true,
					fade = true,
					transition_state = "character",
					transition = "character_selection"
				},
				{
					display_name = "interact_open_inventory_chest",
					requires_player_unit = true,
					fade = true,
					transition_state = "overview",
					transition = "hero_view_force"
				},
				{
					fade = true,
					transition = "options_menu",
					display_name = "options_menu_button_name",
					disable_when_matchmaking_ready = true
				},
				{
					fade = false,
					transition = "return_to_title_screen",
					display_name = quit_menu_button_text
				}
			},
			host = {
				{
					fade = false,
					transition = "exit_menu",
					display_name = "return_to_game_button_name"
				},
				{
					disable_when_matchmaking_ready = true,
					display_name = "profile_menu_button_name",
					requires_player_unit = true,
					fade = true,
					transition_state = "character",
					transition = "character_selection"
				},
				{
					display_name = "interact_open_inventory_chest",
					requires_player_unit = true,
					fade = true,
					transition_state = "overview",
					transition = "hero_view_force"
				},
				{
					fade = true,
					transition = "options_menu",
					display_name = "options_menu_button_name",
					disable_when_matchmaking_ready = true
				},
				{
					fade = false,
					transition = "leave_group",
					display_name = disband_party_button_text
				},
				{
					fade = false,
					transition = "return_to_title_screen",
					display_name = quit_menu_button_text
				}
			},
			client = {
				{
					fade = false,
					transition = "exit_menu",
					display_name = "return_to_game_button_name"
				},
				{
					disable_when_matchmaking_ready = true,
					display_name = "profile_menu_button_name",
					requires_player_unit = true,
					fade = true,
					transition_state = "character",
					transition = "character_selection"
				},
				{
					display_name = "interact_open_inventory_chest",
					requires_player_unit = true,
					fade = true,
					transition_state = "overview",
					transition = "hero_view_force"
				},
				{
					fade = true,
					transition = "options_menu",
					display_name = "options_menu_button_name",
					disable_when_matchmaking_ready = true
				},
				{
					fade = false,
					transition = "leave_group",
					display_name = leave_party_button_text
				},
				{
					fade = false,
					transition = "return_to_title_screen",
					display_name = quit_menu_button_text
				}
			},
			demo = {
				{
					transition = "exit_menu",
					display_name = "return_to_game_button_name"
				},
				{
					transition = "restart_demo",
					display_name = "menu_restart"
				},
				{
					transition = "demo_invert_controls",
					display_name = "menu_invert_controls"
				},
				{
					transition = "return_to_demo_title_screen",
					display_name = "menu_return_to_title_screen"
				}
			}
		},
		in_game = {
			alone = {
				{
					fade = false,
					transition = "exit_menu",
					display_name = "return_to_game_button_name"
				},
				{
					fade = true,
					transition = "options_menu",
					display_name = "options_menu_button_name",
					disable_when_matchmaking_ready = true
				},
				{
					fade = false,
					transition = "leave_group",
					display_name = "leave_game_menu_button_name"
				},
				{
					fade = false,
					transition = "return_to_title_screen",
					display_name = quit_menu_button_text
				}
			},
			host = {
				{
					fade = false,
					transition = "exit_menu",
					display_name = "return_to_game_button_name"
				},
				{
					fade = true,
					transition = "options_menu",
					display_name = "options_menu_button_name",
					disable_when_matchmaking_ready = true
				},
				{
					fade = false,
					transition = "leave_group",
					display_name = disband_party_button_text
				},
				{
					fade = false,
					transition = "return_to_title_screen",
					display_name = quit_menu_button_text
				}
			},
			client = {
				{
					fade = false,
					transition = "exit_menu",
					display_name = "return_to_game_button_name"
				},
				{
					fade = true,
					transition = "options_menu",
					display_name = "options_menu_button_name",
					disable_when_matchmaking_ready = true
				},
				{
					fade = false,
					transition = "leave_group",
					display_name = leave_party_button_text
				},
				{
					fade = false,
					transition = "return_to_title_screen",
					display_name = quit_menu_button_text
				}
			},
			tutorial = {
				{
					transition = "exit_menu",
					display_name = "return_to_game_button_name"
				},
				{
					transition = "options_menu",
					display_name = "options_menu_button_name"
				},
				{
					fade = false,
					transition = "leave_group",
					display_name = "leave_game_menu_button_name"
				},
				{
					transition = "return_to_title_screen",
					display_name = quit_menu_button_text
				}
			},
			demo = {
				{
					transition = "exit_menu",
					display_name = "return_to_game_button_name"
				},
				{
					transition = "restart_demo",
					display_name = "menu_restart"
				},
				{
					transition = "demo_invert_controls",
					display_name = "menu_invert_controls"
				},
				{
					transition = "return_to_demo_title_screen",
					display_name = "menu_return_to_title_screen"
				}
			}
		}
	}
elseif IS_XB1 then
	menu_layouts = {
		in_menu = {
			alone = {
				{
					fade = false,
					transition = "exit_menu",
					display_name = "return_to_game_button_name"
				},
				{
					disable_when_matchmaking_ready = true,
					display_name = "profile_menu_button_name",
					requires_player_unit = true,
					fade = true,
					transition_state = "character",
					transition = "character_selection"
				},
				{
					display_name = "interact_open_inventory_chest",
					requires_player_unit = true,
					fade = true,
					transition_state = "overview",
					transition = "hero_view_force"
				},
				{
					fade = true,
					transition = "options_menu",
					display_name = "options_menu_button_name",
					disable_when_matchmaking_ready = true
				},
				{
					fade = false,
					transition = "leave_group",
					display_name = "leave_game_menu_button_name"
				},
				{
					fade = false,
					transition = "return_to_title_screen",
					display_name = quit_menu_button_text
				}
			},
			host = {
				{
					fade = false,
					transition = "exit_menu",
					display_name = "return_to_game_button_name"
				},
				{
					disable_when_matchmaking_ready = true,
					display_name = "profile_menu_button_name",
					requires_player_unit = true,
					fade = true,
					transition_state = "character",
					transition = "character_selection"
				},
				{
					display_name = "interact_open_inventory_chest",
					requires_player_unit = true,
					fade = true,
					transition_state = "overview",
					transition = "hero_view_force"
				},
				{
					fade = true,
					transition = "options_menu",
					display_name = "options_menu_button_name",
					disable_when_matchmaking_ready = true
				},
				{
					fade = false,
					transition = "leave_group",
					display_name = disband_party_button_text
				},
				{
					fade = false,
					transition = "return_to_title_screen",
					display_name = quit_menu_button_text
				}
			},
			client = {
				{
					fade = false,
					transition = "exit_menu",
					display_name = "return_to_game_button_name"
				},
				{
					disable_when_matchmaking_ready = true,
					display_name = "profile_menu_button_name",
					requires_player_unit = true,
					fade = true,
					transition_state = "character",
					transition = "character_selection"
				},
				{
					display_name = "interact_open_inventory_chest",
					requires_player_unit = true,
					fade = true,
					transition_state = "overview",
					transition = "hero_view_force"
				},
				{
					fade = true,
					transition = "options_menu",
					display_name = "options_menu_button_name",
					disable_when_matchmaking_ready = true
				},
				{
					fade = false,
					transition = "leave_group",
					display_name = leave_party_button_text
				},
				{
					fade = false,
					transition = "return_to_title_screen",
					display_name = quit_menu_button_text
				}
			},
			demo = {
				{
					transition = "exit_menu",
					display_name = "return_to_game_button_name"
				},
				{
					transition = "restart_demo",
					display_name = "menu_restart"
				},
				{
					transition = "demo_invert_controls",
					display_name = "menu_invert_controls"
				},
				{
					transition = "return_to_demo_title_screen",
					display_name = "menu_return_to_title_screen"
				}
			}
		},
		in_game = {
			alone = {
				{
					fade = false,
					transition = "exit_menu",
					display_name = "return_to_game_button_name"
				},
				{
					fade = true,
					transition = "options_menu",
					display_name = "options_menu_button_name",
					disable_when_matchmaking_ready = true
				},
				{
					fade = false,
					transition = "leave_group",
					display_name = "leave_game_menu_button_name"
				},
				{
					fade = false,
					transition = "return_to_title_screen",
					display_name = quit_menu_button_text
				}
			},
			host = {
				{
					fade = false,
					transition = "exit_menu",
					display_name = "return_to_game_button_name"
				},
				{
					fade = true,
					transition = "options_menu",
					display_name = "options_menu_button_name",
					disable_when_matchmaking_ready = true
				},
				{
					fade = false,
					transition = "leave_group",
					display_name = disband_party_button_text
				},
				{
					fade = false,
					transition = "return_to_title_screen",
					display_name = quit_menu_button_text
				}
			},
			client = {
				{
					fade = false,
					transition = "exit_menu",
					display_name = "return_to_game_button_name"
				},
				{
					fade = true,
					transition = "options_menu",
					display_name = "options_menu_button_name",
					disable_when_matchmaking_ready = true
				},
				{
					fade = false,
					transition = "leave_group",
					display_name = leave_party_button_text
				},
				{
					fade = false,
					transition = "return_to_title_screen",
					display_name = quit_menu_button_text
				}
			},
			tutorial = {
				{
					transition = "exit_menu",
					display_name = "return_to_game_button_name"
				},
				{
					transition = "options_menu",
					display_name = "options_menu_button_name"
				},
				{
					fade = false,
					transition = "leave_group",
					display_name = "leave_game_menu_button_name"
				},
				{
					transition = "return_to_title_screen",
					display_name = quit_menu_button_text
				}
			},
			demo = {
				{
					transition = "exit_menu",
					display_name = "return_to_game_button_name"
				},
				{
					transition = "restart_demo",
					display_name = "menu_restart"
				},
				{
					transition = "demo_invert_controls",
					display_name = "menu_invert_controls"
				},
				{
					transition = "return_to_demo_title_screen",
					display_name = "menu_return_to_title_screen"
				}
			}
		}
	}
else
	menu_layouts = {
		in_menu = {
			alone = {
				{
					fade = false,
					transition = "exit_menu",
					display_name = "return_to_game_button_name"
				},
				{
					disable_when_matchmaking_ready = true,
					display_name = "profile_menu_button_name",
					requires_player_unit = true,
					fade = true,
					transition_state = "character",
					transition = "character_selection"
				},
				{
					disable_when_matchmaking_ready = true,
					display_name = "inventory_menu_button_name",
					requires_player_unit = true,
					fade = true,
					transition_state = "overview",
					transition = "hero_view"
				},
				{
					fade = true,
					transition = "options_menu",
					display_name = "options_menu_button_name",
					disable_when_matchmaking_ready = true
				},
				{
					fade = false,
					transition = "return_to_pc_menu",
					display_name = "menu_return_to_title_screen"
				},
				{
					fade = false,
					transition = "quit_game",
					display_name = "quit_menu_button_name"
				}
			},
			host = {
				{
					fade = false,
					transition = "exit_menu",
					display_name = "return_to_game_button_name"
				},
				{
					disable_when_matchmaking_ready = true,
					display_name = "profile_menu_button_name",
					requires_player_unit = true,
					fade = true,
					transition_state = "character",
					transition = "character_selection"
				},
				{
					disable_when_matchmaking_ready = true,
					display_name = "inventory_menu_button_name",
					requires_player_unit = true,
					fade = true,
					transition_state = "overview",
					transition = "hero_view"
				},
				{
					fade = true,
					transition = "options_menu",
					display_name = "options_menu_button_name",
					disable_when_matchmaking_ready = true
				},
				{
					fade = false,
					transition = "leave_group",
					display_name = disband_party_button_text
				},
				{
					fade = false,
					transition = "return_to_pc_menu",
					display_name = "menu_return_to_title_screen"
				},
				{
					fade = false,
					transition = "quit_game",
					display_name = "quit_menu_button_name"
				}
			},
			client = {
				{
					fade = false,
					transition = "exit_menu",
					display_name = "return_to_game_button_name"
				},
				{
					disable_when_matchmaking_ready = true,
					display_name = "profile_menu_button_name",
					requires_player_unit = true,
					fade = true,
					transition_state = "character",
					transition = "character_selection"
				},
				{
					disable_when_matchmaking_ready = true,
					display_name = "inventory_menu_button_name",
					requires_player_unit = true,
					fade = true,
					transition_state = "overview",
					transition = "hero_view"
				},
				{
					fade = true,
					transition = "options_menu",
					display_name = "options_menu_button_name",
					disable_when_matchmaking_ready = true
				},
				{
					fade = false,
					transition = "leave_group",
					display_name = leave_party_button_text
				},
				{
					fade = false,
					transition = "return_to_pc_menu",
					display_name = "menu_return_to_title_screen"
				},
				{
					fade = false,
					transition = "quit_game",
					display_name = "quit_menu_button_name"
				}
			},
			demo = {
				{
					transition = "exit_menu",
					display_name = "return_to_game_button_name"
				},
				{
					transition = "restart_demo",
					display_name = "menu_restart"
				},
				{
					transition = "demo_invert_controls",
					display_name = "menu_invert_controls"
				},
				{
					transition = "return_to_demo_title_screen",
					display_name = "menu_return_to_title_screen"
				}
			}
		},
		in_game = {
			alone = {
				{
					fade = false,
					transition = "exit_menu",
					display_name = "return_to_game_button_name"
				},
				{
					fade = true,
					transition = "options_menu",
					display_name = "options_menu_button_name",
					disable_when_matchmaking_ready = true
				},
				{
					fade = false,
					transition = "leave_group",
					display_name = "leave_game_menu_button_name"
				},
				{
					fade = false,
					transition = "quit_game",
					display_name = "quit_menu_button_name"
				}
			},
			host = {
				{
					fade = false,
					transition = "exit_menu",
					display_name = "return_to_game_button_name"
				},
				{
					fade = true,
					transition = "options_menu",
					display_name = "options_menu_button_name",
					disable_when_matchmaking_ready = true
				},
				{
					fade = false,
					transition = "leave_group",
					display_name = disband_party_button_text
				},
				{
					fade = false,
					transition = "quit_game",
					display_name = "quit_menu_button_name"
				}
			},
			client = {
				{
					fade = false,
					transition = "exit_menu",
					display_name = "return_to_game_button_name"
				},
				{
					fade = true,
					transition = "options_menu",
					display_name = "options_menu_button_name",
					disable_when_matchmaking_ready = true
				},
				{
					fade = false,
					transition = "leave_group",
					display_name = leave_party_button_text
				},
				{
					fade = false,
					transition = "quit_game",
					display_name = "quit_menu_button_name"
				}
			},
			tutorial = {
				{
					transition = "exit_menu",
					display_name = "return_to_game_button_name"
				},
				{
					transition = "options_menu",
					display_name = "options_menu_button_name"
				},
				{
					fade = false,
					transition = "leave_group",
					display_name = "leave_game_menu_button_name"
				},
				{
					transition = "quit_game",
					display_name = "quit_menu_button_name"
				}
			},
			demo = {
				{
					transition = "exit_menu",
					display_name = "return_to_game_button_name"
				},
				{
					transition = "restart_demo",
					display_name = "menu_restart"
				},
				{
					transition = "demo_invert_controls",
					display_name = "menu_invert_controls"
				},
				{
					transition = "return_to_demo_title_screen",
					display_name = "menu_return_to_title_screen"
				}
			}
		}
	}
end

if GameSettingsDevelopment.use_global_chat and IS_WINDOWS then
	table.insert(menu_layouts.in_menu.host, 4, {
		fade = false,
		transition = "chat_view",
		display_name = "chat_menu_button_name"
	})
	table.insert(menu_layouts.in_menu.client, 4, {
		fade = false,
		transition = "chat_view",
		display_name = "chat_menu_button_name"
	})
	table.insert(menu_layouts.in_menu.alone, 4, {
		fade = false,
		transition = "chat_view",
		display_name = "chat_menu_button_name"
	})
	table.insert(menu_layouts.in_game.host, 4, {
		fade = false,
		transition = "chat_view",
		display_name = "chat_menu_button_name"
	})
	table.insert(menu_layouts.in_game.client, 4, {
		fade = false,
		transition = "chat_view",
		display_name = "chat_menu_button_name"
	})
	table.insert(menu_layouts.in_game.alone, 4, {
		fade = false,
		transition = "chat_view",
		display_name = "chat_menu_button_name"
	})
end

local full_access_layout = {
	{
		fade = false,
		transition = "exit_menu",
		display_name = "return_to_game_button_name"
	},
	{
		display_name = "profile_menu_button_name",
		requires_player_unit = true,
		fade = true,
		transition_state = "character",
		transition = "character_selection",
		disable_when_matchmaking = false
	},
	{
		display_name = "inventory_menu_button_name",
		requires_player_unit = true,
		fade = true,
		transition_state = "overview",
		transition = "hero_view"
	},
	{
		fade = true,
		transition = "start_menu_view",
		display_name = "start_menu_view",
		requires_player_unit = true
	},
	{
		fade = true,
		transition = "options_menu",
		display_name = "options_menu_button_name",
		disable_when_matchmaking_ready = true
	},
	{
		fade = false,
		transition = "leave_group",
		display_name = "leave_game_menu_button_name"
	},
	{
		fade = false,
		transition = "quit_game",
		display_name = "quit_menu_button_name"
	}
}

return {
	menu_layouts = menu_layouts,
	full_access_layout = full_access_layout
}

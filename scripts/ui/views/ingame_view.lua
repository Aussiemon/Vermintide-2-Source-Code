require("scripts/ui/views/ingame_view_definitions")
require("scripts/ui/views/menu_input_description_ui")

local generic_input_actions = {
	{
		input_action = "confirm",
		priority = 2,
		description_text = "input_description_open"
	},
	{
		input_action = "back",
		priority = 3,
		description_text = "input_description_close"
	}
}
local tobii_contest_url = "https://vermintide2beta.com/?utm_medium=referral&utm_campaign=vermintide2beta&utm_source=ingame#challenge"
local leave_party_button_text = (PLATFORM == "xb1" and "leave_party_menu_button_name_xb1") or "leave_party_menu_button_name"
local disband_party_button_text = (PLATFORM == "xb1" and "disband_party_menu_button_name_xb1") or "disband_party_menu_button_name"
local menu_layouts = {}

local function player_stuck_cb()
	local level_key = Managers.state.game_mode:level_key()
	local player = Managers.player:local_player()

	if player and Unit.alive(player.player_unit) then
		Managers.telemetry.events:player_stuck(player, level_key)
	end
end

if PLATFORM == "ps4" then
	menu_layouts = {
		in_menu = {
			alone = {
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
					disable_when_matchmaking = true
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
					display_name = "quit_menu_button_name_xb1"
				}
			},
			host = {
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
					disable_when_matchmaking = true
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
					display_name = "quit_menu_button_name_xb1"
				}
			},
			client = {
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
					disable_when_matchmaking = true
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
					display_name = "quit_menu_button_name_xb1"
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
					display_name = "quit_menu_button_name_xb1"
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
					display_name = "quit_menu_button_name_xb1"
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
					display_name = "quit_menu_button_name_xb1"
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
					transition = "return_to_title_screen",
					display_name = "quit_menu_button_name_xb1"
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
elseif PLATFORM == "xb1" then
	menu_layouts = {
		in_menu = {
			alone = {
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
					disable_when_matchmaking = true
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
					display_name = "quit_menu_button_name_xb1"
				}
			},
			host = {
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
					disable_when_matchmaking = true
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
					display_name = "quit_menu_button_name_xb1"
				}
			},
			client = {
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
					disable_when_matchmaking = true
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
					display_name = "quit_menu_button_name_xb1"
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
					display_name = "quit_menu_button_name_xb1"
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
					display_name = "quit_menu_button_name_xb1"
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
					display_name = "quit_menu_button_name_xb1"
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
					transition = "return_to_title_screen",
					display_name = "quit_menu_button_name_xb1"
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
					display_name = "profile_menu_button_name",
					requires_player_unit = true,
					fade = true,
					transition_state = "character",
					transition = "character_selection",
					disable_when_matchmaking = true
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
					display_name = "profile_menu_button_name",
					requires_player_unit = true,
					fade = true,
					transition_state = "character",
					transition = "character_selection",
					disable_when_matchmaking = true
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
					display_name = "profile_menu_button_name",
					requires_player_unit = true,
					fade = true,
					transition_state = "character",
					transition = "character_selection",
					disable_when_matchmaking = true
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
					transition = "quit_game",
					display_name = "quit_menu_button_name_xb1"
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

if GameSettingsDevelopment.use_global_chat and PLATFORM == "win32" then
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

IngameView = class(IngameView)

IngameView.init = function (self, ingame_ui_context)
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.menu_active = false
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.render_settings = {
		snap_pixel_positions = true
	}
	self.network_lobby = ingame_ui_context.network_lobby
	local is_in_inn = ingame_ui_context.is_in_inn
	self.is_server = ingame_ui_context.is_server
	self.layout_list = (is_in_inn and menu_layouts.in_menu) or menu_layouts.in_game
	self.menu_definition = IngameViewDefinitions

	self:create_ui_elements()

	self.ui_animations = {}
	self.controller_grid_index = {
		x = 1,
		y = 1
	}
	self.controller_cooldown = 0
	local input_service = self.input_manager:get_service("ingame_menu")
	local number_of_actvie_descriptions = 3
	local world = Managers.world:world("level_world")
	self.wwise_world = Managers.world:wwise_world(world)
	self._friends_component_ui = FriendsUIComponent:new(ingame_ui_context)
	local gui_layer = self.menu_definition.scenegraph_definition.root.position[3]
	self.menu_input_description = MenuInputDescriptionUI:new(ingame_ui_context, self.ui_top_renderer, input_service, number_of_actvie_descriptions, gui_layer, generic_input_actions)

	self.menu_input_description:set_input_description(nil)
end

local MENU_ANIMATION_TIME = 0.3

IngameView.on_enter = function (self, menu_to_enter)
	assert(menu_to_enter ~= "MainMenu")

	local had_menu = self.active_menu
	self.active_menu = menu_to_enter
	self.controller_cooldown = 0.2

	self:update_menu_options()
	self:update_menu_options_enabled_states()
	self.input_manager:block_device_except_service("ingame_menu", "keyboard", 1)
	self.input_manager:block_device_except_service("ingame_menu", "mouse", 1)
	self.input_manager:block_device_except_service("ingame_menu", "gamepad", 1)
	ShowCursorStack.push()
	self:play_sound("Play_hud_button_open")

	local world = self.ui_renderer.world
	local shading_env = World.get_data(world, "shading_environment")

	if shading_env then
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", 1)
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", 0.75)
		ShadingEnvironment.apply(shading_env)
	end
end

IngameView.on_exit = function (self)
	if self._friends_component_ui:is_active() then
		self._friends_component_ui:deactivate_friends_ui()
	end

	ShowCursorStack.pop()
	self.input_manager:device_unblock_all_services("keyboard", 1)
	self.input_manager:device_unblock_all_services("mouse", 1)
	self.input_manager:device_unblock_all_services("gamepad", 1)

	MOOD_BLACKBOARD.menu = false

	self:play_sound("Play_hud_button_close")

	local world = self.ui_renderer.world
	local shading_env = World.get_data(world, "shading_environment")

	if shading_env then
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", 0)
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", 0)
		ShadingEnvironment.apply(shading_env)
	end
end

IngameView.input_service = function (self)
	return self.input_manager:get_service("ingame_menu")
end

IngameView.create_ui_elements = function (self)
	local widgets = self.menu_definition.widgets
	self.stored_buttons = {
		UIWidget.init(widgets.button_1),
		UIWidget.init(widgets.button_2),
		UIWidget.init(widgets.button_3),
		UIWidget.init(widgets.button_4),
		UIWidget.init(widgets.button_5),
		UIWidget.init(widgets.button_6),
		UIWidget.init(widgets.button_7),
		UIWidget.init(widgets.button_8),
		UIWidget.init(widgets.button_9)
	}

	for _, button_widget in ipairs(self.stored_buttons) do
		button_widget.style.title_text.localize = true
		button_widget.style.title_text_disabled.localize = true
		button_widget.style.title_text_shadow.localize = true
	end

	self.static_widgets = {
		UIWidget.init(widgets.background),
		UIWidget.init(widgets.top_panel),
		UIWidget.init(widgets.left_chain_end)
	}
	self.left_chain_widget = UIWidget.init(widgets.left_chain)
	self.right_chain_widget = UIWidget.init(widgets.right_chain)
	self.console_cursor_widget = UIWidget.init(widgets.console_cursor)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(self.menu_definition.scenegraph_definition)
end

IngameView.update_menu_options = function (self)
	if script_data.pause_menu_full_access then
		if not self.pause_menu_full_access then
			self.pause_menu_full_access = true
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
					fade = false,
					transition = "keep_decoration_view",
					display_name = "keep_decoration_view",
					requires_player_unit = true
				},
				{
					fade = false,
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

			if Development.parameter("v2_achievements") then
				full_access_layout[#full_access_layout + 1] = {
					display_name = "achievements",
					requires_player_unit = true,
					fade = true,
					transition_state = "achievements",
					transition = "hero_view"
				}
			end

			self:setup_button_layout(full_access_layout)
		end
	else
		self.pause_menu_full_access = nil
		local num_human_players = Managers.player:num_human_players()

		if self.num_players ~= num_human_players then
			self.num_players = num_human_players
			local layout_list = self.layout_list
			local new_menu_layout = nil
			local level_key = Managers.state.game_mode:level_key()

			if script_data.honduras_demo then
				new_menu_layout = layout_list.demo
			elseif level_key == "tutorial" then
				new_menu_layout = layout_list.tutorial
			elseif num_human_players == 1 then
				new_menu_layout = layout_list.alone
			elseif self.is_server then
				new_menu_layout = layout_list.host
			else
				new_menu_layout = layout_list.client
			end

			self:setup_button_layout(new_menu_layout)
		end
	end
end

IngameView.update_menu_options_enabled_states = function (self)
	local active_button_data = self.active_button_data

	if active_button_data then
		local player_ready_for_game = self.ingame_ui:is_local_player_ready_for_game()
		local is_game_matchmaking = Managers.matchmaking:is_game_matchmaking()
		local is_server = self.is_server
		local player_manager = Managers.player
		local local_player = player_manager:local_player()
		local has_player = local_player and local_player.player_unit ~= nil

		for index, menu_option in ipairs(active_button_data) do
			local transition = menu_option.transition
			local disable_when_matchmaking = menu_option.disable_when_matchmaking
			local disable_when_matchmaking_ready = menu_option.disable_when_matchmaking_ready
			local requires_player_unit = menu_option.requires_player_unit
			local transition_not_allowed = (player_ready_for_game and disable_when_matchmaking_ready) or (is_game_matchmaking and disable_when_matchmaking) or (requires_player_unit and not has_player)
			local widget = menu_option.widget
			local widget_button_hotspot = widget.content.button_hotspot

			if transition_not_allowed and not widget_button_hotspot.disable_button then
				widget_button_hotspot.disable_button = true
				widget_button_hotspot.on_release = nil
			elseif not transition_not_allowed and widget_button_hotspot.disable_button then
				widget_button_hotspot.disable_button = false
			end
		end
	end
end

IngameView.setup_button_layout = function (self, layout_data)
	local active_button_data = self.active_button_data

	if active_button_data then
		table.clear(active_button_data)
	else
		self.active_button_data = {}
		active_button_data = self.active_button_data
	end

	local stored_buttons = self.stored_buttons

	for index, data in ipairs(layout_data) do
		local button_widget = stored_buttons[index]
		local display_name = data.display_name
		local url = data.url
		local callback = data.callback
		local transition = data.transition
		local transition_state = data.transition_state
		local transition_sub_state = data.transition_sub_state
		local disable_when_matchmaking = data.disable_when_matchmaking
		local disable_when_matchmaking_ready = data.disable_when_matchmaking_ready
		local requires_player_unit = data.requires_player_unit
		local fade = data.fade
		button_widget.content.title_text = display_name
		active_button_data[index] = {
			widget = button_widget,
			url = url,
			callback = callback,
			transition = transition,
			transition_state = transition_state,
			transition_sub_state = transition_sub_state,
			disable_when_matchmaking = disable_when_matchmaking,
			disable_when_matchmaking_ready = disable_when_matchmaking_ready,
			requires_player_unit = requires_player_unit,
			fade = fade
		}
	end

	local controller_selection_index = self.controller_selection_index

	if controller_selection_index and controller_selection_index > #active_button_data then
		self:controller_select_button_index(#active_button_data, true)
	end

	self:set_background_height(#active_button_data)
end

IngameView.destroy = function (self)
	self.menu_input_description:destroy()

	self.menu_input_description = nil
end

IngameView.set_background_height = function (self, num_buttons)
	local button_spacing = self.menu_definition.MENU_BUTTON_SPACING
	local button_size = self.menu_definition.MENU_BUTTON_SIZE
	local button_height = button_size[2]
	local total_button_height = num_buttons * (button_height + button_spacing)
	local ui_scenegraph = self.ui_scenegraph
	local background_size = ui_scenegraph.window.size
	background_size[2] = total_button_height
	local left_chain_widget = self.left_chain_widget
	local left_chain_scenegraph_id = left_chain_widget.scenegraph_id
	ui_scenegraph[left_chain_scenegraph_id].size[2] = total_button_height + 40
	local right_chain_widget = self.right_chain_widget
	local right_chain_scenegraph_id = right_chain_widget.scenegraph_id
	ui_scenegraph[right_chain_scenegraph_id].size[2] = total_button_height + 100
end

IngameView.update = function (self, dt)
	self:update_menu_options()
	self:update_menu_options_enabled_states()

	if self._reinit_menu_input_description_next_update then
		self._reinit_menu_input_description_next_update = nil

		self.menu_input_description:set_input_description(generic_input_actions)
	end

	local ui_top_renderer = self.ui_top_renderer
	local input_manager = self.input_manager
	local input_service = input_manager:get_service("ingame_menu")
	local gamepad_active = input_manager:is_device_active("gamepad")

	self._friends_component_ui:update(dt, input_service)

	local ui_animations = self.ui_animations

	for name, ui_animation in pairs(ui_animations) do
		UIAnimation.update(ui_animation, dt)
	end

	local ui_scenegraph = self.ui_scenegraph

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)
	UIRenderer.draw_widget(ui_top_renderer, self.left_chain_widget)
	UIRenderer.draw_widget(ui_top_renderer, self.right_chain_widget)

	for _, widget in ipairs(self.static_widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	if gamepad_active then
		UIRenderer.draw_widget(ui_top_renderer, self.console_cursor_widget)
	end

	local active_button_data = self.active_button_data
	local ingame_ui = self.ingame_ui

	if active_button_data then
		for index, data in ipairs(active_button_data) do
			local widget = data.widget

			UIWidgetUtils.animate_default_button(widget, dt)
			UIRenderer.draw_widget(ui_top_renderer, widget)

			if widget.content.button_hotspot.on_hover_enter then
				self:play_sound("Play_hud_hover")
			end

			if not ingame_ui:pending_transition() then
				local mouse_input_approved = widget.content.button_hotspot.on_release
				local gamepad_input_approved = self.controller_cooldown < 0 and self.controller_selection_index == index and input_service:get("confirm", true)

				if mouse_input_approved or gamepad_input_approved then
					widget.content.button_hotspot.on_release = nil

					self:play_sound("Play_hud_select")

					local url = data.url

					if url then
						Application.open_url_in_browser(url)
					else
						local callback = data.callback

						if callback then
							callback()
						end

						local transition = data.transition
						local transition_state = data.transition_state
						local transition_sub_state = data.transition_sub_state
						local fade = data.fade

						if fade then
							ingame_ui:transition_with_fade(transition, transition_state, transition_sub_state)
						else
							ingame_ui:handle_transition(transition, transition_state, transition_sub_state)
						end
					end

					self._reinit_menu_input_description_next_update = true
					self.controller_cooldown = GamepadSettings.menu_cooldown
				end
			end
		end
	end

	UIRenderer.end_pass(ui_top_renderer)

	self.gamepad_active_last_frame = gamepad_active
	local join_lobby_data = self._friends_component_ui:join_lobby_data()

	if join_lobby_data and Managers.matchmaking:allowed_to_initiate_join_lobby() then
		Managers.matchmaking:request_join_lobby(join_lobby_data)
		ingame_ui:handle_transition("exit_menu")
	end

	if (input_service:get("toggle_menu", true) or input_service:get("back", true)) and not ingame_ui:pending_transition() then
		ingame_ui:handle_transition("exit_menu")
	end
end

IngameView.setup_controller_selection = function (self)
	local selection_index = 1

	self:controller_select_button_index(selection_index, true)
end

IngameView.controller_select_button_index = function (self, index, ignore_sound)
	local selection_accepted = false
	local active_button_data = self.active_button_data
	local new_selection_data = active_button_data[index]

	if not new_selection_data or new_selection_data.widget.content.button_hotspot.disable_button then
		return selection_accepted
	end

	local gamepad_selection_scenegraph_id = self.gamepad_button_selection_widget.scenegraph_id
	local gamepad_selection_default_position = self.menu_definition.scenegraph_definition[gamepad_selection_scenegraph_id].position
	local gamepad_selection_current_position = self.ui_scenegraph[gamepad_selection_scenegraph_id].local_position

	for i, data in ipairs(active_button_data) do
		local widget = data.widget
		local is_selected = i == index
		widget.content.button_hotspot.is_selected = is_selected

		if is_selected then
			local widget_scenegraph_id = widget.scenegraph_id
			local widget_current_position = self.ui_scenegraph[widget_scenegraph_id].local_position
			gamepad_selection_current_position[2] = gamepad_selection_default_position[2] - i * 84
		end
	end

	if not ignore_sound and index ~= self.controller_selection_index then
		self:play_sound("Play_hud_hover")
	end

	self.controller_selection_index = index
	selection_accepted = true

	return selection_accepted
end

IngameView.clear_controller_selection = function (self)
	local active_button_data = self.active_button_data

	for i, data in ipairs(active_button_data) do
		local widget = data.widget
		widget.content.button_hotspot.is_selected = false
	end
end

IngameView.update_controller_input = function (self, input_service, dt)
	local num_buttons = #self.active_button_data

	if self.controller_cooldown > 0 then
		self.controller_cooldown = self.controller_cooldown - dt
		local speed_multiplier = self.speed_multiplier or 1
		local decrease = GamepadSettings.menu_speed_multiplier_frame_decrease
		local min_multiplier = GamepadSettings.menu_min_speed_multiplier
		self.speed_multiplier = math.max(speed_multiplier - decrease, min_multiplier)

		return
	else
		speed_multiplier = self.speed_multiplier or 1

		repeat
			local move_up = input_service:get("move_up")
			local move_up_hold = input_service:get("move_up_hold")
			local controller_selection_index = self.controller_selection_index or 0

			if move_up or move_up_hold then
				local new_index = math.max(controller_selection_index - 1, 1)
				local selection_accepted = self:controller_select_button_index(new_index)

				while not selection_accepted do
					new_index = math.max(new_index - 1, 1)
					selection_accepted = self:controller_select_button_index(new_index)
				end

				self.controller_cooldown = GamepadSettings.menu_cooldown * speed_multiplier

				return
			end

			local move_down = input_service:get("move_down")
			local move_down_hold = input_service:get("move_down_hold")

			if move_down or move_down_hold then
				local new_index = math.min(controller_selection_index + 1, num_buttons)
				local selection_accepted = self:controller_select_button_index(new_index)

				while not selection_accepted do
					new_index = math.min(new_index + 1, num_buttons)
					selection_accepted = self:controller_select_button_index(new_index)
				end

				self.controller_cooldown = GamepadSettings.menu_cooldown * speed_multiplier

				return
			end
		until true
	end

	self.speed_multiplier = 1
end

IngameView.get_transition = function (self)
	if self.leave_game then
		return "leave_game"
	end
end

IngameView.play_sound = function (self, event)
	WwiseWorld.trigger_event(self.wwise_world, event)
end

return

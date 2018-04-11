local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			UILayer.default + 50
		},
		size = {
			1920,
			1080
		}
	},
	console_cursor = {
		vertical_alignment = "center",
		parent = "root",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			-50
		},
		size = {
			1920,
			1080
		}
	},
	dead_space_filler = {
		scale = "fit",
		position = {
			0,
			0,
			0
		},
		size = {
			1920,
			1080
		}
	},
	logo = {
		vertical_alignment = "top",
		parent = "root",
		horizontal_alignment = "left",
		position = {
			45,
			-45,
			0
		},
		size = {
			280,
			200
		}
	},
	background = {
		vertical_alignment = "center",
		parent = "root",
		horizontal_alignment = "center",
		size = {
			938,
			720
		},
		position = {
			0,
			0,
			1
		}
	},
	background_statue_left = {
		parent = "background",
		size = {
			68,
			206
		},
		position = {
			0,
			0,
			10
		}
	},
	title = {
		vertical_alignment = "top",
		parent = "background",
		horizontal_alignment = "left",
		size = {
			420,
			22
		},
		position = {
			42,
			-115,
			1
		}
	},
	info_title = {
		vertical_alignment = "top",
		parent = "background",
		horizontal_alignment = "right",
		size = {
			420,
			22
		},
		position = {
			-42,
			-115,
			1
		}
	},
	friend_list_window = {
		vertical_alignment = "top",
		parent = "background",
		horizontal_alignment = "left",
		size = {
			425,
			540
		},
		position = {
			40,
			-145,
			1
		}
	},
	friend_list = {
		vertical_alignment = "top",
		parent = "friend_list_window",
		horizontal_alignment = "left",
		size = {
			355,
			25
		},
		position = {
			0,
			-10,
			1
		}
	},
	friend_list_scrollbar_root = {
		vertical_alignment = "bottom",
		parent = "friend_list_window",
		horizontal_alignment = "right",
		position = {
			-2,
			0,
			10
		},
		size = {
			22,
			540
		}
	},
	friend_info_window = {
		vertical_alignment = "top",
		parent = "background",
		horizontal_alignment = "left",
		size = {
			425,
			540
		},
		position = {
			472,
			-145,
			1
		}
	},
	update_friend_info_icon = {
		vertical_alignment = "center",
		parent = "friend_info_window",
		horizontal_alignment = "center",
		size = {
			50,
			50
		},
		position = {
			0,
			0,
			1
		}
	},
	friends_info_player_name_line_breaker = {
		vertical_alignment = "top",
		parent = "friend_info_window",
		horizontal_alignment = "center",
		size = {
			386,
			22
		},
		position = {
			0,
			-45,
			2
		}
	},
	level_image = {
		vertical_alignment = "top",
		parent = "friends_info_player_name_line_breaker",
		horizontal_alignment = "center",
		position = {
			0,
			-90,
			2
		},
		size = {
			300,
			170
		}
	},
	friend_info_title_text = {
		vertical_alignment = "top",
		parent = "level_image",
		horizontal_alignment = "center",
		position = {
			0,
			60,
			2
		},
		size = {
			400,
			40
		}
	},
	disable_image = {
		vertical_alignment = "center",
		parent = "friend_info_window",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			2
		},
		size = {
			378,
			378
		}
	},
	button_1 = {
		vertical_alignment = "bottom",
		parent = "friend_info_window",
		horizontal_alignment = "center",
		size = {
			188,
			50
		},
		position = {
			95,
			10,
			1
		}
	},
	button_2 = {
		vertical_alignment = "bottom",
		parent = "friend_info_window",
		horizontal_alignment = "center",
		size = {
			188,
			50
		},
		position = {
			0,
			10,
			1
		}
	},
	button_3 = {
		vertical_alignment = "bottom",
		parent = "friend_info_window",
		horizontal_alignment = "center",
		size = {
			188,
			50
		},
		position = {
			-95,
			10,
			1
		}
	},
	join_button = {
		vertical_alignment = "bottom",
		parent = "friend_info_window",
		horizontal_alignment = "center",
		size = {
			188,
			50
		},
		position = {
			95,
			10,
			1
		}
	},
	invite_button = {
		vertical_alignment = "bottom",
		parent = "friend_info_window",
		horizontal_alignment = "center",
		size = {
			188,
			50
		},
		position = {
			-95,
			10,
			1
		}
	},
	close_button = {
		vertical_alignment = "top",
		parent = "background",
		horizontal_alignment = "right",
		size = {
			35,
			35
		},
		position = {
			-7,
			-70,
			1
		}
	},
	eye_glow = {
		vertical_alignment = "top",
		parent = "background",
		horizontal_alignment = "center",
		size = {
			59,
			59
		},
		position = {
			0,
			-41,
			1
		}
	}
}
local widget_definitions = {
	scroll_field = {
		scenegraph_id = "friend_list_window",
		element = {
			passes = {
				{
					pass_type = "scroll",
					scroll_function = function (ui_scenegraph, ui_style, ui_content, input_service, scroll_axis)
						local scroll_step = ui_content.scroll_step or 0.1
						local current_scroll_value = ui_content.internal_scroll_value
						current_scroll_value = current_scroll_value + scroll_step * -scroll_axis.y
						ui_content.internal_scroll_value = math.clamp(current_scroll_value, 0, 1)

						return 
					end
				}
			}
		},
		content = {
			scroll_step = 0.05,
			internal_scroll_value = 0
		}
	},
	logo = UIWidgets.create_simple_texture("hero_view_home_logo", "logo"),
	dead_space_filler = {
		scenegraph_id = "dead_space_filler",
		element = UIElements.SimpleTexture,
		content = {
			texture_id = "gradient_dice_game_reward"
		},
		style = {
			color = {
				255,
				255,
				255,
				255
			}
		}
	},
	background = {
		scenegraph_id = "background",
		element = UIElements.SimpleTexture,
		content = {
			texture_id = "friends_list_bg"
		},
		style = {
			color = {
				255,
				255,
				255,
				255
			}
		}
	},
	background_statue_left = UIWidgets.create_simple_uv_texture("friends_list_bg_statue", {
		{
			1,
			0
		},
		{
			0,
			1
		}
	}, "background_statue_left"),
	title = {
		scenegraph_id = "title",
		element = UIElements.StaticText,
		content = {
			text_field = "friend_list_friends"
		},
		style = {
			text = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				localize = true,
				font_size = 28,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
				offset = {
					0,
					0,
					2
				}
			}
		}
	},
	info_title = {
		scenegraph_id = "info_title",
		element = UIElements.StaticText,
		content = {
			text_field = "friend_list_info_title"
		},
		style = {
			text = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				localize = true,
				font_size = 28,
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
				offset = {
					0,
					0,
					2
				}
			}
		}
	}
}
local button_widgets = {
	close_button = {
		scenegraph_id = "close_button",
		element = UIElements.Simple3StatesButton,
		content = {
			texture_hover_id = "tabs_icon_close_glow",
			texture_click_id = "tabs_icon_close",
			texture_id = "tabs_icon_close",
			button_hotspot = {}
		},
		style = {}
	},
	join_button = UIWidgets.create_default_button("join_button", scenegraph_definition.join_button.size, nil, nil, Localize("friend_list_join"), 24),
	invite_button = UIWidgets.create_default_button("invite_button", scenegraph_definition.invite_button.size, nil, nil, Localize("friend_list_invite"), 24)
}
local friend_list_definition = {
	scenegraph_id = "friend_list",
	element = {
		passes = {
			{
				style_id = "list_style",
				pass_type = "list_pass",
				content_id = "list_content",
				passes = {
					{
						pass_type = "hotspot",
						content_id = "button_hotspot"
					},
					{
						pass_type = "controller_hotspot",
						content_id = "controller_button_hotspot"
					},
					{
						style_id = "name",
						pass_type = "text",
						text_id = "name"
					},
					{
						pass_type = "texture",
						style_id = "hover_texture",
						texture_id = "hover_texture",
						content_check_function = function (content)
							local button_hotspot = content.button_hotspot

							return (button_hotspot.gamepad_active and content.selected) or button_hotspot.is_hover or content.controller_button_hotspot.is_hover
						end
					}
				}
			}
		}
	},
	content = {
		list_content = {}
	},
	style = {
		list_style = {
			start_index = 1,
			num_draws = 0,
			item_styles = {}
		}
	}
}
local friend_info_widget_definitions = {
	update_friend_info_icon = UIWidgets.create_simple_rotated_texture("matchmaking_connecting_icon", 0, {
		25,
		25
	}, "update_friend_info_icon"),
	controller_invite_text = {
		scenegraph_id = "friend_info_window",
		element = {
			passes = {
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text"
				}
			}
		},
		content = {
			text = Localize("friend_list_invitation_sent")
		},
		style = {
			text = {
				vertical_alignment = "bottom",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 0),
				offset = {
					0,
					35,
					2
				}
			}
		}
	},
	friend_info_title = {
		scenegraph_id = "friend_info_window",
		element = {
			passes = {
				{
					style_id = "status",
					pass_type = "text",
					text_id = "status"
				},
				{
					pass_type = "texture",
					style_id = "player_name_line_breaker",
					texture_id = "line_breaker"
				}
			}
		},
		content = {
			line_breaker = "summary_screen_line_breaker",
			name = "n/a",
			status = "n/a"
		},
		style = {
			player_name_line_breaker = {
				scenegraph_id = "friends_info_player_name_line_breaker"
			},
			status = {
				vertical_alignment = "top",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					-12,
					2
				}
			},
			name = {
				vertical_alignment = "top",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					-110,
					-12,
					2
				}
			}
		}
	},
	friend_info = {
		scenegraph_id = "friend_info_window",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "disable_image",
					texture_id = "disable_image",
					content_check_function = function (content)
						return not content.display_game_info and not content.in_idle
					end
				},
				{
					style_id = "info_title",
					pass_type = "text",
					text_id = "info_title"
				},
				{
					pass_type = "texture",
					style_id = "level_image",
					texture_id = "level_image",
					content_check_function = function (content)
						return content.display_game_info or content.in_idle
					end
				},
				{
					style_id = "level_prefix",
					pass_type = "text",
					text_id = "level_prefix",
					content_check_function = function (content)
						return content.display_game_info
					end
				},
				{
					style_id = "level_name",
					pass_type = "text",
					text_id = "level_name",
					content_check_function = function (content)
						return content.display_game_info
					end
				},
				{
					style_id = "difficulty_prefix",
					pass_type = "text",
					text_id = "difficulty_prefix",
					content_check_function = function (content)
						return content.display_game_info
					end
				},
				{
					style_id = "difficulty_name",
					pass_type = "text",
					text_id = "difficulty_name",
					content_check_function = function (content)
						return content.display_game_info
					end
				},
				{
					style_id = "players_prefix",
					pass_type = "text",
					text_id = "players_prefix",
					content_check_function = function (content)
						return content.display_game_info
					end
				},
				{
					style_id = "difficulty_name",
					pass_type = "text",
					text_id = "difficulty_name",
					content_check_function = function (content)
						return content.display_game_info
					end
				},
				{
					style_id = "num_players",
					pass_type = "text",
					text_id = "num_players",
					content_check_function = function (content)
						return content.display_game_info
					end
				}
			}
		},
		content = {
			disable_image = "friendslist_image_01",
			difficulty_name = "n/a",
			level_name = "n/a",
			info_title = "n/a",
			num_players = "1/4",
			display_game_info = false,
			in_idle = false,
			level_image = "level_image_any",
			level_prefix = Localize("map_level_setting") .. ":",
			difficulty_prefix = Localize("prefix_difficulty") .. ":",
			players_prefix = Localize("friend_list_players") .. ":"
		},
		style = {
			disable_image = {
				scenegraph_id = "disable_image"
			},
			level_image = {
				scenegraph_id = "level_image"
			},
			level_prefix = {
				vertical_alignment = "bottom",
				scenegraph_id = "level_image",
				horizontal_alignment = "left",
				font_type = "hell_shark",
				font_size = 18,
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
				offset = {
					-45,
					-35,
					2
				}
			},
			level_name = {
				vertical_alignment = "bottom",
				scenegraph_id = "level_image",
				horizontal_alignment = "right",
				font_type = "hell_shark",
				font_size = 18,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					45,
					-35,
					2
				}
			},
			difficulty_prefix = {
				vertical_alignment = "bottom",
				scenegraph_id = "level_image",
				horizontal_alignment = "left",
				font_type = "hell_shark",
				font_size = 18,
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
				offset = {
					-45,
					-60,
					2
				}
			},
			difficulty_name = {
				vertical_alignment = "bottom",
				scenegraph_id = "level_image",
				horizontal_alignment = "right",
				font_type = "hell_shark",
				font_size = 18,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					45,
					-60,
					2
				}
			},
			players_prefix = {
				vertical_alignment = "bottom",
				scenegraph_id = "level_image",
				horizontal_alignment = "left",
				font_type = "hell_shark",
				font_size = 18,
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
				offset = {
					-45,
					-85,
					2
				}
			},
			num_players = {
				vertical_alignment = "bottom",
				scenegraph_id = "level_image",
				horizontal_alignment = "right",
				debug_draw_box = false,
				font_size = 18,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					45,
					-85,
					2
				}
			},
			info_title = {
				vertical_alignment = "center",
				scenegraph_id = "friend_info_title_text",
				horizontal_alignment = "center",
				font_type = "hell_shark",
				font_size = 18,
				word_wrap = true,
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
				offset = {
					0,
					0,
					2
				}
			}
		}
	}
}
LEVEL_TRANSLATIONS = {
	merchant = {
		"Supply and Demand",
		"Poda\u017c i popyt",
		"Oferta y demanda",
		"\u0421\u043f\u0440\u043e\u0441 \u0438 \u043f\u0440\u0435\u0434\u043b\u043e\u0436\u0435\u043d\u0438\u0435",
		"Oferta e Procura",
		"L'offre et la demande",
		"Angebot und Nachfrage",
		"Domanda e offerta"
	},
	dlc_survival_magnus = {
		"Town Meeting",
		"Spotkanie",
		"Reunión de la ciudad",
		"\u0412\u0441\u0442\u0440\u0435\u0447\u0430 \u0432 \u0433\u043e\u0440\u043e\u0434\u0435",
		"Reunião do burgo",
		"Réunion municipale",
		"Bürgerversammlung",
		"Consiglio cittadino"
	},
	sewers_short = {
		"Smuggler's Run",
		"Ucieczka przemytnika",
		"La carrera del contrabandista",
		"\u041a\u043e\u043d\u0442\u0440\u0430\u0431\u0430\u043d\u0434\u0430",
		"Fuga do contrabandista",
		"La course du contrebandier",
		"Hineingeschmuggelt",
		"Contrabbando"
	},
	inn_level = {
		"Wartet im Gasthaus Roter Mond",
		"Esperando en la Posada Luna Roja",
		"En attente à la Lune rouge",
		"In attesa alla Locanda della Luna Rossa",
		"Czekam w karczmie Pod Czerwonym Ksi\u0119\u017cycem",
		"Aguardando na Estalagem Lua Vermelha",
		"\u0424\u043e\u0440\u043c\u0430\u0442 \u0441\u0442\u0440\u043e\u043a\u0438 \u0441 \u0440\u0430\u0441\u0448\u0438\u0440\u0435\u043d\u043d\u044b\u043c\u0438 \u0432\u043e\u0437\u043c\u043e\u0436\u043d\u043e\u0441\u0442\u044f\u043c\u0438 \u043f\u0440\u0438\u0441\u0443\u0442\u0441\u0442\u0432\u0438\u044f",
		"Waiting at the Red Moon Inn",
		"Red Moon Inn",
		"Karczma Pod Czerwonym Ksi\u0119\u017cycem",
		"Posada Luna Roja",
		"«\u041a\u0440\u0430\u0441\u043d\u0430\u044f \u043b\u0443\u043d\u0430»",
		"Estalagem Lua Vermelha",
		"Auberge de la Lune rouge",
		"Zum Roten Mond",
		"Locanda della Luna Rossa"
	},
	forest_ambush = {
		"Engines of War",
		"Machiny wojny",
		"Máquinas de guerra",
		"\u041c\u0430\u0448\u0438\u043d\u044b \u0432\u043e\u0439\u043d\u044b",
		"Mecanismos da Guerra",
		"Machines de guerre",
		"Kriegsmaschinen",
		"Macchine da guerra"
	},
	city_wall = {
		"Man the Ramparts",
		"\u017bo\u0142nierze na sza\u0144cach",
		"Defended las murallas",
		"\u041a \u043a\u0440\u0435\u043f\u043e\u0441\u0442\u043d\u043e\u043c\u0443 \u0432\u0430\u043b\u0443",
		"Defenda as muralhas",
		"Aux remparts",
		"Bemannt die Schutzwälle",
		"Ai bastioni"
	},
	wizard = {
		"The Wizard's Tower",
		"Wie\u017ca czarodzieja",
		"La torre del Hechicero",
		"\u0411\u0430\u0448\u043d\u044f \u041c\u0430\u0433\u0430",
		"A Torre dos Magos",
		"Tour de sorcier",
		"Der Magierturm",
		"La Torre del Mago"
	},
	dlc_castle_dungeon = {
		"The Dungeons",
		"Lochy",
		"Las mazmorras",
		"\u041f\u043e\u0434\u0437\u0435\u043c\u0435\u043b\u044c\u044f",
		"As masmorras",
		"Les Donjons",
		"Das Verlies",
		"I Dungeon"
	},
	dlc_portals = {
		"Summoner's Peak",
		"Szczyt Przywo\u0142ywacza",
		"Pico del Invocador",
		"\u041f\u0438\u043a \u041f\u0440\u0438\u0437\u044b\u0432\u0430\u0442\u0435\u043b\u044f",
		"Pico do Invocador",
		"Pic de l'invocateur",
		"Gipfel des Beschwörers",
		"Picco dell'Evocatore"
	},
	dlc_castle = {
		"Castle Drachenfels",
		"Zamek Drachenfels",
		"Castillo Drachenfels",
		"\u0417\u0430\u043c\u043e\u043a \u0414\u0440\u0430\u0445\u0435\u043d\u0444\u0435\u043b\u044c\u0441",
		"Castelo Drachenfels",
		"Château Drachenfels",
		"Burg Drachenfels",
		"Castel Drachenfels"
	},
	courtyard_level = {
		"Well Watch",
		"W obronie studni",
		"Protección de pozos",
		"\u0421\u0442\u0440\u0430\u0436\u0430 \u043a\u043e\u043b\u043e\u0434\u0446\u0435\u0432",
		"Vigia dos poços",
		"Surveillance de puits",
		"Brunnenwache",
		"Guardia ai pozzi"
	},
	bridge = {
		"Black Powder",
		"Czarny proch",
		"Pólvora",
		"\u0427\u0435\u0440\u043d\u044b\u0439 \u043f\u043e\u0440\u043e\u0445",
		"Pólvora",
		"La poudre noire",
		"Schwarzpulver",
		"Polvere nera"
	},
	cemetery = {
		"Garden of Morr",
		"Ogród Morra",
		"Jardín de Morr",
		"\u0421\u0430\u0434 \u041c\u043e\u0440\u0440\u0430",
		"Jardins de Morr",
		"Jardin de Morr",
		"Morrs Garten",
		"Giardino di Morr"
	},
	tunnels = {
		"The Enemy Below",
		"Wróg spod ziemi",
		"Enemigo enterrado",
		"\u0412\u0440\u0430\u0433 \u0438\u0437 \u0433\u043b\u0443\u0431\u0438\u043d",
		"O Inimigo Profundo",
		"L'ennemi souterrain",
		"Den Feind zu Füßen",
		"Il nemico sottoterra"
	},
	magnus = {
		"The Horn of Magnus",
		"Róg Magnusa",
		"El Cuerno de Magnus",
		"\u0420\u043e\u0433 \u041c\u0430\u0433\u043d\u0430",
		"A Trompa de Magnus",
		"La corne de Magnus",
		"Das Horn des Magnus",
		"Il Corno di Magnus"
	},
	end_boss = {
		"The White Rat",
		"Bia\u0142y szczur",
		"La rata blanca",
		"\u0411\u0435\u043b\u0430\u044f \u041a\u0440\u044b\u0441\u0430",
		"O Rato Branco",
		"Le rat blanc",
		"Die Weiße Ratte",
		"Il ratto bianco"
	},
	dlc_survival_ruins = {
		"The Fall",
		"Upadek",
		"La caída",
		"\u041f\u0430\u0434\u0435\u043d\u0438\u0435",
		"A queda",
		"La Chute",
		"Der Fall",
		"La Caduta"
	},
	farm = {
		"Wheat and Chaff",
		"Ziarna i plewy",
		"Trigo y pienso",
		"\u0417\u0435\u0440\u043d\u0430 \u0438 \u043f\u043b\u0435\u0432\u0435\u043b\u0430",
		"Joio e trigo",
		"Blé et paille",
		"Spreu und Weizen",
		"Grano e pula"
	},
	docks_short_level = {
		"Waterfront",
		"Na nabrze\u017cu",
		"Ribera",
		"\u041d\u0430\u0431\u0435\u0440\u0435\u0436\u043d\u0430\u044f",
		"Orla",
		"Quais",
		"Das Ufer",
		"Riva"
	}
}
DIFFICULTY_TRANSLATIONS = {
	easy = {
		"Easy",
		"Facile",
		"\u0141atwy",
		"Einfach",
		"Fácil",
		"Facile",
		"\u041f\u0440\u043e\u0441\u0442\u043e\u0439",
		"Fácil"
	},
	normal = {
		"Normal",
		"Normale",
		"Normalny",
		"Normal",
		"Normal",
		"Normale",
		"\u0421\u0440\u0435\u0434\u043d\u0438\u0439",
		"Normal"
	},
	hard = {
		"Hard",
		"Difficile",
		"Trudny",
		"Schwer",
		"Difícil",
		"Difficile",
		"\u0421\u043b\u043e\u0436\u043d\u044b\u0439",
		"Difícil"
	},
	harder = {
		"Nightmare",
		"Cauchemardesque",
		"Koszmar",
		"Albtraum",
		"Pesadilla",
		"Incubo",
		"\u041a\u043e\u0448\u043c\u0430\u0440",
		"Pesadelo"
	},
	hardest = {
		"Cataclysm",
		"Cataclysmique",
		"Kataklizm",
		"Kataklysmus",
		"Cataclismo",
		"Cataclisma",
		"\u041a\u0430\u0442\u0430\u043a\u043b\u0438\u0437\u043c",
		"Cataclismo"
	},
	survival_hard = {
		"Veteran",
		"Vétéran",
		"Weteran",
		"Veteran",
		"Veterano",
		"Veterano",
		"\u0412\u0435\u0442\u0435\u0440\u0430\u043d",
		"Veterano"
	},
	survival_harder = {
		"Champion",
		"Champion",
		"Czempion",
		"Champion",
		"Campeón",
		"Campione",
		"\u0412\u043e\u0438\u0442\u0435\u043b\u044c",
		"Campeão"
	},
	survival_hardest = {
		"Héros",
		"Heroic",
		"Heroiczny",
		"Heldenhaft",
		"Héroe",
		"Eroica",
		"\u0413\u0435\u0440\u043e\u0439",
		"Heroico"
	}
}

return {
	scenegraph_definition = scenegraph_definition,
	widget_definitions = widget_definitions,
	button_widgets = button_widgets,
	friend_list_definition = friend_list_definition,
	friend_info_widget_definitions = friend_info_widget_definitions,
	console_cursor_definition = UIWidgets.create_console_cursor("console_cursor")
}

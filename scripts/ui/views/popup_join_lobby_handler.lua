PopupJoinLobbyHandler = class(PopupJoinLobbyHandler)
local hero_entry_width = 108
local hero_entry_height = 108
local hero_entry_spacing = 20
local career_entry_width = 86
local career_entry_height = 108
local career_entry_spacing = 40
local scenegraph_definition = {
	screen = {
		scale = "fit",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			UILayer.matchmaking
		}
	},
	window = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			900,
			940
		},
		position = {
			0,
			10,
			1
		}
	},
	inner_window = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			606,
			530
		},
		position = {
			0,
			60,
			3
		}
	},
	title = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			658,
			60
		},
		position = {
			0,
			34,
			22
		}
	},
	title_bg = {
		vertical_alignment = "top",
		parent = "title",
		horizontal_alignment = "center",
		size = {
			410,
			40
		},
		position = {
			0,
			-15,
			-1
		}
	},
	title_text = {
		vertical_alignment = "center",
		parent = "title",
		horizontal_alignment = "center",
		size = {
			350,
			50
		},
		position = {
			0,
			-3,
			2
		}
	},
	window_sub_title = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			500,
			50
		},
		position = {
			0,
			-75,
			3
		}
	},
	hero_info_panel = {
		vertical_alignment = "bottom",
		parent = "inner_window",
		horizontal_alignment = "left",
		size = {
			441,
			118
		},
		position = {
			55,
			-130,
			1
		}
	},
	hero_info_level_bg = {
		vertical_alignment = "center",
		parent = "hero_info_panel",
		horizontal_alignment = "left",
		size = {
			124,
			138
		},
		position = {
			-62,
			0,
			2
		}
	},
	info_career_name = {
		vertical_alignment = "top",
		parent = "hero_info_panel",
		horizontal_alignment = "left",
		size = {
			480,
			25
		},
		position = {
			76,
			-40,
			1
		}
	},
	info_hero_name = {
		vertical_alignment = "top",
		parent = "info_career_name",
		horizontal_alignment = "left",
		size = {
			480,
			25
		},
		position = {
			0,
			-16,
			1
		}
	},
	info_hero_level = {
		vertical_alignment = "center",
		parent = "hero_info_level_bg",
		horizontal_alignment = "center",
		size = {
			450,
			25
		},
		position = {
			0,
			0,
			1
		}
	},
	hero_root = {
		vertical_alignment = "top",
		parent = "inner_window",
		horizontal_alignment = "left",
		size = {
			110,
			130
		},
		position = {
			0,
			-100,
			1
		}
	},
	hero_icon_root = {
		vertical_alignment = "top",
		parent = "hero_root",
		horizontal_alignment = "center",
		size = {
			48,
			144
		},
		position = {
			0,
			100,
			1
		}
	},
	hero_icon_edge_left = {
		vertical_alignment = "center",
		parent = "hero_icon_root",
		horizontal_alignment = "center",
		size = {
			28,
			22
		},
		position = {
			-82,
			-10,
			1
		}
	},
	hero_icon_edge_right = {
		vertical_alignment = "center",
		parent = "hero_icon_root",
		horizontal_alignment = "center",
		size = {
			28,
			22
		},
		position = {
			578,
			-10,
			1
		}
	},
	timer_title_text = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "right",
		size = {
			500,
			20
		},
		position = {
			-30,
			-20,
			1
		}
	},
	timer_text = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "right",
		size = {
			500,
			20
		},
		position = {
			-30,
			-50,
			1
		}
	},
	select_button = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			300,
			70
		},
		position = {
			-170,
			40,
			3
		}
	},
	cancel_button = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			300,
			70
		},
		position = {
			170,
			40,
			3
		}
	},
	center_button = {
		vertical_alignment = "bottom",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			300,
			70
		},
		position = {
			0,
			40,
			3
		}
	}
}
local title_text_style = {
	use_shadow = true,
	upper_case = true,
	localize = false,
	font_size = 28,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local window_sub_title_text_style = {
	font_size = 24,
	upper_case = false,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		1
	}
}
local hero_career_style = {
	font_size = 40,
	upper_case = true,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "left",
	vertical_alignment = "bottom",
	dynamic_font_size = true,
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		2
	}
}
local hero_name_style = {
	word_wrap = true,
	font_size = 30,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local hero_level_style = {
	word_wrap = true,
	font_size = 52,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2
	}
}
local locked_info_text_style = {
	word_wrap = true,
	font_size = 26,
	localize = false,
	use_shadow = true,
	horizontal_alignment = "left",
	vertical_alignment = "top",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("red", 255),
	offset = {
		0,
		0,
		2
	}
}
local timer_text_style = {
	font_size = 46,
	upper_case = false,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "right",
	vertical_alignment = "top",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		1
	}
}
local timer_title_text_style = {
	font_size = 28,
	upper_case = false,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "right",
	vertical_alignment = "top",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		1
	}
}
local generic_input_actions = {
	{
		input_action = "confirm",
		priority = 2,
		description_text = "input_description_select"
	},
	{
		input_action = "back",
		priority = 3,
		description_text = "popup_keep_searching"
	}
}

local function create_gamepad_button(input_action, text, scenegraph_id)
	return {
		element = {
			passes = {
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text",
					content_check_function = function (content)
						return content.is_gamepad_active
					end
				},
				{
					pass_type = "texture",
					style_id = "icon",
					texture_id = "icon",
					content_check_function = function (content)
						return content.is_gamepad_active
					end
				}
			}
		},
		content = {
			input_action = input_action,
			text = text or ""
		},
		style = {
			text = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 28,
				horizontal_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					1
				}
			},
			icon = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					34,
					34
				},
				offset = {
					0,
					0,
					1
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

local function create_hero_icon_widget(scenegraph_id, size)
	local icon_size = {
		80,
		80
	}

	return {
		element = {
			passes = {
				{
					texture_id = "icon",
					style_id = "icon",
					pass_type = "texture",
					content_check_function = function (content)
						return not content.selected
					end
				},
				{
					texture_id = "icon_selected",
					style_id = "icon_selected",
					pass_type = "texture",
					content_check_function = function (content)
						return content.selected
					end
				},
				{
					texture_id = "holder",
					style_id = "holder",
					pass_type = "rotated_texture"
				}
			}
		},
		content = {
			icon = "hero_icon_large_bright_wizard",
			holder = "divider_vertical_hero_decoration",
			icon_selected = "hero_icon_large_bright_wizard"
		},
		style = {
			icon = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = icon_size,
				color = {
					200,
					80,
					80,
					80
				},
				offset = {
					0,
					40,
					1
				}
			},
			icon_selected = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = icon_size,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					40,
					1
				}
			},
			holder = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				angle = math.pi / 2,
				pivot = {
					size[1] / 2,
					size[2] / 2
				},
				texture_size = size,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					1
				}
			}
		},
		offset = {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}
end

local function create_hero_widget(scenegraph_id, size)
	local frame_style = "menu_frame_12"
	local frame_settings = UIFrameSettings[frame_style]
	local hover_frame_style = "frame_outer_glow_01"
	local hover_frame_settings = UIFrameSettings[hover_frame_style]
	local hover_frame_width = hover_frame_settings.texture_sizes.horizontal[2]

	return {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					texture_id = "portrait",
					style_id = "portrait",
					pass_type = "texture"
				},
				{
					pass_type = "rect",
					style_id = "rect"
				},
				{
					texture_id = "lock_texture",
					style_id = "lock_texture",
					pass_type = "texture",
					content_check_function = function (content)
						return content.locked
					end
				},
				{
					texture_id = "taken_texture",
					style_id = "taken_texture",
					pass_type = "texture",
					content_check_function = function (content)
						return content.taken and not content.locked
					end
				},
				{
					pass_type = "texture_frame",
					style_id = "frame",
					texture_id = "frame"
				},
				{
					style_id = "overlay",
					pass_type = "rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.is_hover and not button_hotspot.is_selected and not content.locked
					end
				},
				{
					style_id = "overlay_locked",
					pass_type = "rect",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return content.locked
					end
				},
				{
					pass_type = "texture_frame",
					style_id = "hover_frame",
					texture_id = "hover_frame",
					content_check_function = function (content)
						return content.button_hotspot.is_selected
					end
				}
			}
		},
		content = {
			portrait = "icons_placeholder",
			locked = false,
			lock_texture = "hero_icon_locked",
			taken = false,
			taken_texture = "hero_icon_unavailable",
			button_hotspot = {},
			frame = frame_settings.texture,
			hover_frame = hover_frame_settings.texture
		},
		style = {
			rect = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = size,
				color = {
					200,
					0,
					0,
					0
				},
				offset = {
					0,
					0,
					0
				}
			},
			portrait = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = size,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					1
				}
			},
			lock_texture = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					76,
					87
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					5
				}
			},
			taken_texture = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					112,
					112
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					6
				}
			},
			overlay = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = size,
				color = {
					80,
					0,
					0,
					0
				},
				offset = {
					0,
					0,
					2
				}
			},
			overlay_locked = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = size,
				color = {
					200,
					0,
					0,
					0
				},
				offset = {
					0,
					0,
					2
				}
			},
			frame = {
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					4
				}
			},
			hover_frame = {
				size = {
					size[1] + hover_frame_width * 2,
					size[2] + hover_frame_width * 2
				},
				texture_size = hover_frame_settings.texture_size,
				texture_sizes = hover_frame_settings.texture_sizes,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-hover_frame_width,
					-hover_frame_width,
					0
				}
			}
		},
		offset = {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}
end

local hero_widget_definition = create_hero_widget("hero_root", scenegraph_definition.hero_root.size)
local hero_icon_widget_definition = create_hero_icon_widget("hero_icon_root", scenegraph_definition.hero_icon_root.size)
local disable_with_gamepad = true
local widget_definitions = {
	window = UIWidgets.create_background_with_frame("window", scenegraph_definition.window.size, "menu_frame_bg_02", "menu_frame_11"),
	window_shadow = UIWidgets.create_simple_texture("options_window_fade_01", "window", nil, nil, nil, 1),
	title = UIWidgets.create_simple_texture("frame_title_bg", "title"),
	title_bg = UIWidgets.create_background("title_bg", scenegraph_definition.title_bg.size, "menu_frame_bg_02"),
	title_text = UIWidgets.create_simple_text(Localize("join_popup_title"), "title_text", nil, nil, title_text_style),
	window_sub_title = UIWidgets.create_simple_text(Localize("join_popup_sub_title"), "window_sub_title", nil, nil, window_sub_title_text_style),
	select_button = UIWidgets.create_default_button("select_button", scenegraph_definition.select_button.size, nil, nil, Localize("input_description_confirm"), nil, nil, nil, nil, disable_with_gamepad),
	cancel_button = UIWidgets.create_default_button("cancel_button", scenegraph_definition.cancel_button.size, nil, nil, Localize("input_description_cancel"), nil, nil, nil, nil, disable_with_gamepad),
	gamepad_select_button = create_gamepad_button("confirm", Localize("input_description_confirm"), "select_button"),
	gamepad_cancel_button = create_gamepad_button("back", Localize("input_description_cancel"), "cancel_button"),
	hero_info_panel = UIWidgets.create_simple_texture("item_slot_side_fade", "hero_info_panel", nil, nil, {
		255,
		0,
		0,
		0
	}),
	hero_info_panel_glow = UIWidgets.create_simple_texture("item_slot_side_effect", "hero_info_panel", nil, nil, Colors.get_color_table_with_alpha("font_title", 255), 1),
	hero_info_level_bg = UIWidgets.create_simple_texture("hero_level_bg", "hero_info_level_bg"),
	info_career_name = UIWidgets.create_simple_text("n/a", "info_career_name", nil, nil, hero_career_style),
	info_hero_name = UIWidgets.create_simple_text("n/a", "info_hero_name", nil, nil, hero_name_style),
	info_hero_level = UIWidgets.create_simple_text("n/a", "info_hero_level", nil, nil, hero_level_style),
	timer_text = UIWidgets.create_simple_text("00:00", "timer_text", nil, nil, timer_text_style),
	timer_title_text = UIWidgets.create_simple_text(Localize("join_popup_timer_title"), "timer_title_text", nil, nil, timer_title_text_style),
	hero_icon_edge_left = UIWidgets.create_simple_rotated_texture("divider_vertical_hero_end", math.pi / 2, {
		14,
		11
	}, "hero_icon_edge_left"),
	hero_icon_edge_right = UIWidgets.create_simple_rotated_texture("divider_vertical_hero_end", -math.pi / 2, {
		14,
		11
	}, "hero_icon_edge_right")
}
local DO_RELOAD = true

PopupJoinLobbyHandler.init = function (self, ingame_ui_context)
	self.network_event_delegate = ingame_ui_context.network_event_delegate
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.world_manager = ingame_ui_context.world_manager
	local world = self.world_manager:world("level_world")
	self.wwise_world = Managers.world:wwise_world(world)
	self.render_settings = {
		snap_pixel_positions = true
	}
	self.peer_id = Network:peer_id()
	local input_manager = ingame_ui_context.input_manager
	self.input_manager = input_manager

	input_manager:create_input_service("popup_join_lobby_handler", "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager:map_device_to_service("popup_join_lobby_handler", "keyboard")
	input_manager:map_device_to_service("popup_join_lobby_handler", "mouse")
	input_manager:map_device_to_service("popup_join_lobby_handler", "gamepad")

	local input_service = Managers.input:get_service("popup_join_lobby_handler")
	local gui_layer = scenegraph_definition.window.position[3]
	self._difficulty = nil

	rawset(_G, "GLOBAL_MM_JL_UI", self)
	self:create_ui_elements()

	DO_RELOAD = false
end

PopupJoinLobbyHandler.create_ui_elements = function (self)
	self._ui_animations = {}
	local widgets = {}
	local widgets_by_name = {}

	for name, widget_definition in pairs(widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name

	self:_setup_hero_selection_widgets()

	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	UIRenderer.clear_scenegraph_queue(self.ui_top_renderer)
end

PopupJoinLobbyHandler._setup_hero_selection_widgets = function (self)
	local hero_widgets = {}
	self._hero_widgets = hero_widgets
	local hero_icon_widgets = {}
	self._hero_icon_widgets = hero_icon_widgets
	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local num_max_rows = 0
	local num_max_columns = #SPProfilesAbbreviation

	for i, profile_index in ipairs(ProfilePriority) do
		local profile_settings = SPProfiles[profile_index]
		local hero_name = profile_settings.display_name
		local hero_experience = hero_attributes:get(hero_name, "experience") or 0
		local hero_level = ExperienceSettings.get_level(hero_experience)
		local careers = profile_settings.careers
		num_max_rows = math.max(num_max_rows, #careers)
		local icon_widget = UIWidget.init(hero_icon_widget_definition)
		hero_icon_widgets[#hero_icon_widgets + 1] = icon_widget
		local hero_icon_offset = icon_widget.offset
		hero_icon_offset[1] = (i - 1) * 124
		local hero_icon_texture = "hero_icon_large_" .. hero_name
		icon_widget.content.icon = hero_icon_texture
		icon_widget.content.icon_selected = hero_icon_texture .. "_glow"

		for j, career in ipairs(careers) do
			local widget = UIWidget.init(hero_widget_definition)
			hero_widgets[#hero_widgets + 1] = widget
			local offset = widget.offset
			local content = widget.content
			content.career_settings = career
			local portrait_image = career.portrait_image
			content.portrait = "medium_" .. portrait_image
			local is_career_unlocked = career.is_unlocked_function(hero_name, hero_level)
			content.locked = not is_career_unlocked
			offset[1] = (i - 1) * 124
			offset[2] = -(j - 1) * 144
		end
	end

	self._num_max_hero_rows = num_max_rows
	self._num_max_hero_columns = num_max_columns
end

PopupJoinLobbyHandler._get_widget = function (self, name)
	return self._widgets_by_name[name]
end

PopupJoinLobbyHandler.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()

		local profile_index = self._selected_hero_column or 1
		local career_index = self._selected_hero_row or 1
		local ignore_sound = true

		self:_select_hero(profile_index, career_index, ignore_sound)
	end

	self:_update_occupied_profiles()
	self:_update_gamepad_input_buttons()

	local ui_top_renderer = self.ui_top_renderer
	local input_service = self:input_service()

	if self.cancel_timer then
		self.cancel_timer = math.max(self.cancel_timer - dt, 0)
		local timer_text = tostring(math.ceil(self.cancel_timer))

		self:_set_timer_text(timer_text)

		if self.cancel_timer <= 0 then
			local accepted = false

			self:set_result(accepted)
		end
	end

	self:_handle_input(dt, t)

	for name, animation in pairs(self._ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			animation = nil
		end
	end

	self:draw(ui_top_renderer, input_service, dt)
end

PopupJoinLobbyHandler.show = function (self, current_profile_index, current_career_index, time_until_cancel, join_by_lobby_browser, difficulty)
	self.join_lobby_result = nil
	self._difficulty = difficulty
	local transition = (join_by_lobby_browser and "exit_menu") or "close_active"

	self.ingame_ui:handle_transition(transition)
	ShowCursorStack.push()

	local profile_index = current_profile_index or 1
	local career_index = current_career_index or 1
	local ignore_sound = true

	self:_select_hero(profile_index, career_index, ignore_sound)

	self.cancel_timer = time_until_cancel
	local input_manager = self.input_manager

	input_manager:capture_input({
		"keyboard",
		"gamepad",
		"mouse"
	}, 1, "popup_join_lobby_handler", "PopupJoinLobbyHandler")
end

PopupJoinLobbyHandler.hide = function (self)
	local input_manager = self.input_manager

	input_manager:release_input({
		"keyboard",
		"gamepad",
		"mouse"
	}, 1, "popup_join_lobby_handler", "PopupJoinLobbyHandler")
	ShowCursorStack.pop()

	self._selected_hero_name = nil
	self._selected_career_name = nil
end

PopupJoinLobbyHandler.input_service = function (self)
	return self.input_manager:get_service("popup_join_lobby_handler")
end

PopupJoinLobbyHandler.draw = function (self, ui_top_renderer, input_service, dt)
	local swap_hero_active = self.swap_hero_active
	local gamepad_active = Managers.input:is_device_active("gamepad")

	UIRenderer.begin_pass(ui_top_renderer, self.ui_scenegraph, input_service, dt, nil, self.render_settings)

	local widgets = self._widgets

	for _, widget in ipairs(widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	for _, widget in ipairs(self._hero_widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	for _, widget in ipairs(self._hero_icon_widgets) do
		UIRenderer.draw_widget(ui_top_renderer, widget)
	end

	UIRenderer.end_pass(ui_top_renderer)
end

PopupJoinLobbyHandler.set_result = function (self, accepted)
	local selected_hero_name = accepted and self._selected_hero_name
	local selected_career_name = accepted and self._selected_career_name
	self.join_lobby_result = {
		accepted = accepted,
		selected_hero_name = selected_hero_name,
		selected_career_name = selected_career_name
	}
end

PopupJoinLobbyHandler.query_result = function (self)
	return self.join_lobby_result
end

PopupJoinLobbyHandler.destroy = function (self)
	rawset(_G, "GLOBAL_MM_JL_UI", nil)
	self.network_event_delegate:unregister(self)
end

PopupJoinLobbyHandler._handle_input = function (self, dt, t)
	local widgets_by_name = self._widgets_by_name
	local input_service = Managers.input:get_service("popup_join_lobby_handler")

	self:_handle_mouse_selection()
	self:_handle_gamepad_selection(input_service)

	local select_button = widgets_by_name.select_button
	local cancel_button = widgets_by_name.cancel_button

	UIWidgetUtils.animate_default_button(select_button, dt)
	UIWidgetUtils.animate_default_button(cancel_button, dt)

	if self:_is_button_hover_enter(select_button) or self:_is_button_hover_enter(cancel_button) then
		self:_play_sound("play_gui_start_menu_button_hover")
	end

	if self._selection_approved and (self:_is_button_pressed(widgets_by_name.select_button) or input_service:get("confirm", true)) then
		self:_play_sound("play_gui_start_menu_button_click")
		self:set_result(true)
	elseif self:_is_button_pressed(widgets_by_name.cancel_button) or input_service:get("back_menu", true) then
		self:_play_sound("play_gui_start_menu_button_click")
		self:set_result(false)
	end
end

PopupJoinLobbyHandler._handle_mouse_selection = function (self)
	local hero_widgets = self._hero_widgets
	local num_max_rows = self._num_max_hero_rows
	local num_max_columns = self._num_max_hero_columns
	local selected_row = self._selected_hero_row
	local selected_column = self._selected_hero_column

	if selected_row and selected_column then
		local widget_index = 1

		for i = 1, num_max_columns, 1 do
			for j = 1, num_max_rows, 1 do
				local widget = hero_widgets[widget_index]
				local content = widget.content
				local button_hotspot = content.button_hotspot

				if button_hotspot.on_hover_enter then
					self:_play_sound("play_gui_hero_select_hero_hover")
				end

				if not content.taken and button_hotspot.on_pressed and (i ~= selected_column or j ~= selected_row) then
					local profile_index = ProfilePriority[i]
					local career_index = j

					self:_select_hero(profile_index, career_index)

					return
				end

				widget_index = widget_index + 1
			end
		end
	end
end

PopupJoinLobbyHandler._handle_gamepad_selection = function (self, input_service)
	local num_max_rows = self._num_max_hero_rows
	local num_max_columns = self._num_max_hero_columns
	local selected_row = self._selected_hero_row
	local selected_column = self._selected_hero_column

	if selected_row and selected_column then
		local modified = false

		if selected_column > 1 and input_service:get("move_left_hold_continuous") then
			selected_column = selected_column - 1
			modified = true
		elseif selected_column < num_max_columns and input_service:get("move_right_hold_continuous") then
			selected_column = selected_column + 1
			modified = true
		end

		if selected_row > 1 and input_service:get("move_up_hold_continuous") then
			selected_row = selected_row - 1
			modified = true
		elseif selected_row < num_max_rows and input_service:get("move_down_hold_continuous") then
			selected_row = selected_row + 1
			modified = true
		end

		if modified then
			local profile_index = ProfilePriority[selected_column]
			local career_index = selected_row

			self:_select_hero(profile_index, career_index)
		end
	end
end

PopupJoinLobbyHandler._select_hero = function (self, profile_index, career_index, ignore_sound)
	if not ignore_sound then
		self:_play_sound("play_gui_hero_select_hero_click")
	end

	local profile_settings = SPProfiles[profile_index]
	local career_settings = profile_settings.careers[career_index]
	local hero_name = profile_settings.display_name
	local character_name = profile_settings.character_name
	local career_name = career_settings.name
	local career_display_name = career_settings.display_name
	local hero_display_text = Localize(character_name)
	local career_display_text = Localize(career_display_name)
	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local hero_experience = hero_attributes:get(hero_name, "experience") or 0
	local level = ExperienceSettings.get_level(hero_experience)

	self:_set_hero_info(hero_display_text, career_display_text, level)

	local hero_widgets = self._hero_widgets
	local num_max_rows = self._num_max_hero_rows
	local num_max_columns = self._num_max_hero_columns
	self._selected_career_index = career_index
	self._selected_profile_index = profile_index
	self._selected_hero_name = hero_name
	self._selected_career_name = career_name
	self._selected_hero_row = career_index
	self._selected_hero_column = ProfileIndexToPriorityIndex[profile_index]

	self:_set_hero_icon_selected(self._selected_hero_column)

	local widget_index = 1
	local is_career_locked = false

	for i = 1, num_max_columns, 1 do
		for j = 1, num_max_rows, 1 do
			local is_selected = i == self._selected_hero_column and j == self._selected_hero_row
			local widget = hero_widgets[widget_index]
			local content = widget.content
			content.button_hotspot.is_selected = is_selected

			if is_selected then
				is_career_locked = content.locked
			end

			widget_index = widget_index + 1
		end
	end
end

PopupJoinLobbyHandler._set_hero_icon_selected = function (self, index)
	for icon_index, widget in ipairs(self._hero_icon_widgets) do
		widget.content.selected = icon_index == index
	end
end

PopupJoinLobbyHandler._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

PopupJoinLobbyHandler._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot

	return hotspot.on_hover_enter
end

PopupJoinLobbyHandler._set_hero_info = function (self, hero_name, career_name, level)
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.info_hero_name.content.text = hero_name
	widgets_by_name.info_career_name.content.text = career_name
	widgets_by_name.info_hero_level.content.text = level
end

PopupJoinLobbyHandler._set_timer_text = function (self, timer_text)
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.timer_text.content.text = timer_text
end

PopupJoinLobbyHandler.set_unavailable_heroes = function (self, occupied_heroes)
	self._occupied_heroes = occupied_heroes

	self:_update_occupied_profiles()
end

PopupJoinLobbyHandler.set_difficulty = function (self, difficulty)
	self._difficulty = difficulty
end

PopupJoinLobbyHandler._update_occupied_profiles = function (self)
	local occupied_heroes = self._occupied_heroes

	if not occupied_heroes then
		return
	end

	local hero_widgets = self._hero_widgets
	local num_max_rows = self._num_max_hero_rows
	local num_max_columns = self._num_max_hero_columns
	local is_button_enabled = false
	local widget_index = 1

	for i = 1, num_max_columns, 1 do
		local profile_index = ProfilePriority[i]
		local occupied = occupied_heroes[profile_index]

		for j = 1, num_max_rows, 1 do
			local widget = hero_widgets[widget_index]
			local content = widget.content
			local button_hotspot = content.button_hotspot
			content.taken = occupied

			if button_hotspot.is_selected then
				is_button_enabled = not occupied and not content.locked
			end

			widget_index = widget_index + 1
		end
	end

	self:set_select_button_enable_state(is_button_enabled)
end

PopupJoinLobbyHandler._animate_element_by_time = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.function_by_time, target, target_index, from, to, time, math.ease_out_quad)

	return new_animation
end

PopupJoinLobbyHandler.set_select_button_enable_state = function (self, enabled)
	local button_content = self._widgets_by_name.select_button.content
	button_content.title_text = (enabled and Localize("input_description_confirm")) or Localize("dlc1_2_difficulty_unavailable")
	button_content.button_hotspot.disable_button = not enabled
	local widgets_by_name = self._widgets_by_name
	local gamepad_select_button = widgets_by_name.gamepad_select_button
	local gamepad_cancel_button = widgets_by_name.gamepad_cancel_button
	gamepad_select_button.content.visible = enabled
	gamepad_cancel_button.scenegraph_id = (enabled and "cancel_button") or "center_button"
	self._selection_approved = enabled
end

PopupJoinLobbyHandler._play_sound = function (self, event)
	WwiseWorld.trigger_event(self.wwise_world, event)
end

PopupJoinLobbyHandler._get_gamepad_input_texture_data = function (self, input_service, input_action, ignore_keybinding)
	local platform = PLATFORM

	if platform == "win32" then
		platform = "xb1"
	end

	if ignore_keybinding then
		return ButtonTextureByName(input_action, platform)
	else
		return UISettings.get_gamepad_input_texture_data(input_service, input_action, true)
	end
end

PopupJoinLobbyHandler._update_gamepad_input_buttons = function (self)
	local ui_renderer = self.ui_renderer
	local widgets_by_name = self._widgets_by_name
	local gamepad_select_button = widgets_by_name.gamepad_select_button
	local gamepad_cancel_button = widgets_by_name.gamepad_cancel_button
	local input_service = Managers.input:get_service("popup_join_lobby_handler")
	local select_action_texture_data = self:_get_gamepad_input_texture_data(input_service, gamepad_select_button.content.input_action)
	local cancel_action_texture_data = self:_get_gamepad_input_texture_data(input_service, gamepad_cancel_button.content.input_action)
	gamepad_select_button.content.icon = select_action_texture_data.texture
	gamepad_cancel_button.content.icon = cancel_action_texture_data.texture
	local select_button_text = gamepad_select_button.content.text
	local cancel_button_text = gamepad_cancel_button.content.text
	local button_style = gamepad_select_button.style
	local text_style = button_style.text
	local font, scaled_font_size = UIFontByResolution(text_style)
	local select_text_width = UIRenderer.text_size(ui_renderer, select_button_text, font[1], scaled_font_size)
	local cancel_text_width = UIRenderer.text_size(ui_renderer, cancel_button_text, font[1], scaled_font_size)
	gamepad_select_button.style.icon.offset[1] = -(select_text_width * 0.5) - 40
	gamepad_cancel_button.style.icon.offset[1] = -(cancel_text_width * 0.5) - 40
end

return

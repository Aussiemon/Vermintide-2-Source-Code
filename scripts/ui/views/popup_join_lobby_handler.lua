-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
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
	console_cursor = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			-10
		}
	},
	window = {
		vertical_alignment = "center",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			800,
			820
		},
		position = {
			0,
			50,
			1
		}
	},
	inner_window = {
		vertical_alignment = "center",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			680,
			430
		},
		position = {
			0,
			25,
			3
		}
	},
	window_title = {
		vertical_alignment = "top",
		parent = "window",
		horizontal_alignment = "center",
		size = {
			800,
			50
		},
		position = {
			0,
			-35,
			3
		}
	},
	window_sub_title = {
		vertical_alignment = "center",
		parent = "window_title",
		horizontal_alignment = "center",
		size = {
			800,
			50
		},
		position = {
			0,
			-70,
			1
		}
	},
	selection_divider = {
		vertical_alignment = "center",
		parent = "inner_window",
		horizontal_alignment = "center",
		size = {
			264,
			21
		},
		position = {
			0,
			-5,
			1
		}
	},
	hero_tabs = {
		vertical_alignment = "center",
		parent = "selection_divider",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			45,
			1
		}
	},
	career_tabs = {
		vertical_alignment = "bottom",
		parent = "selection_divider",
		horizontal_alignment = "center",
		size = {
			0,
			0
		},
		position = {
			0,
			-(career_entry_height + 60),
			1
		}
	},
	hero_text = {
		vertical_alignment = "bottom",
		parent = "selection_divider",
		horizontal_alignment = "center",
		size = {
			500,
			20
		},
		position = {
			0,
			5,
			1
		}
	},
	career_text = {
		vertical_alignment = "top",
		parent = "selection_divider",
		horizontal_alignment = "center",
		size = {
			500,
			20
		},
		position = {
			0,
			-20,
			1
		}
	},
	timer_title_text = {
		vertical_alignment = "bottom",
		parent = "inner_window",
		horizontal_alignment = "center",
		size = {
			500,
			20
		},
		position = {
			0,
			-30,
			1
		}
	},
	timer_text = {
		vertical_alignment = "bottom",
		parent = "inner_window",
		horizontal_alignment = "center",
		size = {
			500,
			20
		},
		position = {
			0,
			-65,
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
	}
}
local window_title_text_style = {
	font_size = 52,
	upper_case = true,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "center",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		1
	}
}
local window_sub_title_text_style = {
	font_size = 24,
	upper_case = false,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "bottom",
	font_type = "hell_shark",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		1
	}
}
local hero_text_style = {
	font_size = 28,
	upper_case = false,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "bottom",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		1
	}
}
local career_text_style = {
	font_size = 36,
	upper_case = false,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
	vertical_alignment = "top",
	font_type = "hell_shark_header",
	text_color = Colors.get_color_table_with_alpha("font_title", 255),
	offset = {
		0,
		0,
		1
	}
}
local timer_text_style = {
	font_size = 46,
	upper_case = false,
	localize = false,
	use_shadow = true,
	word_wrap = true,
	horizontal_alignment = "center",
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
	horizontal_alignment = "center",
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
local hero_icons = {}

for index, profile_index in ipairs(ProfilePriority) do
	hero_icons[#hero_icons + 1] = "unit_frame_portrait_default"
end

local career_images = {
	"icons_placeholder",
	"icons_placeholder",
	"icons_placeholder"
}
local widget_definitions = {
	window = UIWidgets.create_background_with_frame("window", scenegraph_definition.window.size, "menu_frame_bg_02", "menu_frame_11"),
	window_shadow = UIWidgets.create_simple_texture("options_window_fade_01", "window", nil, nil, nil, 1),
	inner_window = UIWidgets.create_rect_with_frame("inner_window", scenegraph_definition.inner_window.size, {
		150,
		5,
		5,
		5
	}, "menu_frame_06"),
	window_title = UIWidgets.create_simple_text(Localize("join_popup_title"), "window_title", nil, nil, window_title_text_style),
	window_sub_title = UIWidgets.create_simple_text(Localize("join_popup_sub_title"), "window_sub_title", nil, nil, window_sub_title_text_style),
	hero_tabs = UIWidgets.create_icon_selector("hero_tabs", {
		hero_entry_width,
		hero_entry_height
	}, hero_icons, hero_entry_spacing),
	career_tabs = UIWidgets.create_icon_selector("career_tabs", {
		career_entry_width,
		career_entry_height
	}, career_images, career_entry_spacing, true),
	select_button = UIWidgets.create_default_button("select_button", scenegraph_definition.select_button.size, nil, nil, Localize("input_description_confirm")),
	cancel_button = UIWidgets.create_default_button("cancel_button", scenegraph_definition.cancel_button.size, nil, nil, Localize("input_description_cancel")),
	selection_divider = UIWidgets.create_simple_texture("divider_01_bottom", "selection_divider"),
	hero_text = UIWidgets.create_simple_text("n/a", "hero_text", nil, nil, hero_text_style),
	career_text = UIWidgets.create_simple_text("n/a", "career_text", nil, nil, career_text_style),
	timer_text = UIWidgets.create_simple_text("00:00", "timer_text", nil, nil, timer_text_style),
	timer_title_text = UIWidgets.create_simple_text(Localize("join_popup_timer_title"), "timer_title_text", nil, nil, timer_title_text_style)
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

	self.unblocked_services = {}
	self.unblocked_services_n = 0
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
	local console_cursor_definition = UIWidgets.create_console_cursor("console_cursor")
	self._console_cursor = UIWidget.init(console_cursor_definition)
	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	UIRenderer.clear_scenegraph_queue(self.ui_top_renderer)
	self:_assign_hero_portraits()
end

PopupJoinLobbyHandler._get_widget = function (self, name)
	return self._widgets_by_name[name]
end

PopupJoinLobbyHandler.update = function (self, dt, t)
	if DO_RELOAD then
		DO_RELOAD = false

		self:create_ui_elements()
	end

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

	disable_select_button = self._selected_career_locked or self._selected_hero_disabled

	if self._disable_select_button ~= disable_select_button then
		self._disable_select_button = disable_select_button

		self:set_select_button_enable_state(not disable_select_button)
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
	self._selected_hero_disabled = nil
	self._selected_career_locked = nil
	self._disable_select_button = nil
	self._difficulty = difficulty
	local transition = (join_by_lobby_browser and "exit_menu") or "close_active"

	self.ingame_ui:handle_transition(transition)
	ShowCursorStack.push()

	local profile_index = current_profile_index or 1
	local career_index = current_career_index or 1

	self:_select_hero_and_career(profile_index, career_index)

	self.cancel_timer = time_until_cancel
	local input_manager = self.input_manager
	self.unblocked_services_n = input_manager:get_unblocked_services(nil, nil, self.unblocked_services)

	input_manager:device_block_services("keyboard", 1, self.unblocked_services, self.unblocked_services_n, "popup_join_lobby_handler")
	input_manager:device_block_services("gamepad", 1, self.unblocked_services, self.unblocked_services_n, "popup_join_lobby_handler")
	input_manager:device_block_services("mouse", 1, self.unblocked_services, self.unblocked_services_n, "popup_join_lobby_handler")
	input_manager:device_unblock_service("keyboard", 1, "popup_join_lobby_handler")
	input_manager:device_unblock_service("gamepad", 1, "popup_join_lobby_handler")
	input_manager:device_unblock_service("mouse", 1, "popup_join_lobby_handler")
end

PopupJoinLobbyHandler.hide = function (self)
	local input_manager = self.input_manager

	input_manager:device_block_service("keyboard", 1, "popup_join_lobby_handler")
	input_manager:device_block_service("gamepad", 1, "popup_join_lobby_handler")
	input_manager:device_block_service("mouse", 1, "popup_join_lobby_handler")
	input_manager:device_unblock_services("keyboard", 1, self.unblocked_services, self.unblocked_services_n)
	input_manager:device_unblock_services("gamepad", 1, self.unblocked_services, self.unblocked_services_n)
	input_manager:device_unblock_services("mouse", 1, self.unblocked_services, self.unblocked_services_n)
	table.clear(self.unblocked_services)

	self.unblocked_services_n = 0

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

	if gamepad_active then
		UIRenderer.draw_widget(ui_top_renderer, self._console_cursor)
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

	if self:_is_tab_hovered(widgets_by_name.hero_tabs) then
		self:_play_sound("play_gui_hero_select_hero_hover")
	end

	if self:_is_tab_hovered(widgets_by_name.career_tabs) then
		self:_play_sound("play_gui_hero_select_career_hover")
	end

	self:_handle_tab_hover(widgets_by_name.hero_tabs, "icon")
	self:_handle_tab_hover(widgets_by_name.career_tabs, "icon")

	local hero_index = self:_is_hero_tab_selected()

	if hero_index then
		self:_select_hero_tab_by_index(hero_index, nil, true)
	end

	local career_index = self:_is_career_tab_selected()

	if career_index then
		self:_select_career_tab_by_index(career_index, nil, true)
	end

	local select_button = widgets_by_name.select_button
	local cancel_button = widgets_by_name.cancel_button

	UIWidgetUtils.animate_default_button(select_button, dt)
	UIWidgetUtils.animate_default_button(cancel_button, dt)

	if self:_is_button_hover_enter(select_button) or self:_is_button_hover_enter(cancel_button) then
		self:_play_sound("play_gui_start_menu_button_hover")
	end

	if self:_is_button_pressed(widgets_by_name.select_button) and not self._selected_career_locked then
		self:_play_sound("play_gui_start_menu_button_click")
		self:set_result(true)
	elseif self:_is_button_pressed(widgets_by_name.cancel_button) then
		self:_play_sound("play_gui_start_menu_button_click")
		self:set_result(false)
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

PopupJoinLobbyHandler._is_hero_tab_selected = function (self)
	local widget = self._widgets_by_name.hero_tabs
	local widget_content = widget.content
	local amount = widget_content.amount

	for i = 1, amount, 1 do
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = widget_content[hotspot_name]

		if hotspot_content.on_pressed then
			return i
		end
	end
end

PopupJoinLobbyHandler._is_tab_hovered = function (self, widget)
	local widget_content = widget.content
	local amount = widget_content.amount

	for i = 1, amount, 1 do
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = widget_content[hotspot_name]

		if hotspot_content.on_hover_enter and not hotspot_content.is_selected then
			return i
		end
	end
end

PopupJoinLobbyHandler._is_tab_dehovered = function (self, widget)
	local widget_content = widget.content
	local amount = widget_content.amount

	for i = 1, amount, 1 do
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = widget_content[hotspot_name]

		if hotspot_content.on_hover_exit and not hotspot_content.is_selected then
			return i
		end
	end
end

PopupJoinLobbyHandler._is_career_tab_selected = function (self)
	local widget = self._widgets_by_name.career_tabs
	local widget_content = widget.content
	local amount = widget_content.amount

	for i = 1, amount, 1 do
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = widget_content[hotspot_name]

		if hotspot_content.on_pressed then
			return i
		end
	end
end

PopupJoinLobbyHandler._handle_tab_hover = function (self, widget, style_prefix)
	local hover_index = self:_is_tab_hovered(widget)

	if hover_index then
		self:_on_option_button_hover(widget, style_prefix .. "_" .. hover_index)
	end

	local dehover_index = self:_is_tab_dehovered(widget)

	if dehover_index then
		self:_on_option_button_dehover(widget, style_prefix .. "_" .. dehover_index)
	end
end

PopupJoinLobbyHandler._on_option_button_hover = function (self, widget, style_id)
	local ui_animations = self._ui_animations
	local animation_name = "option_button_" .. style_id
	local widget_style = widget.style
	local pass_style = widget_style[style_id]
	local current_color_value = pass_style.color[2]
	local target_color_value = 255
	local total_time = UISettings.scoreboard.topic_hover_duration
	local animation_duration = (1 - current_color_value / target_color_value) * total_time

	for i = 2, 4, 1 do
		if animation_duration > 0 then
			ui_animations[animation_name .. "_hover_" .. i] = self:_animate_element_by_time(pass_style.color, i, current_color_value, target_color_value, animation_duration)
		else
			pass_style.color[i] = target_color_value
		end
	end
end

PopupJoinLobbyHandler._on_option_button_dehover = function (self, widget, style_id)
	local ui_animations = self._ui_animations
	local animation_name = "option_button_" .. style_id
	local widget_style = widget.style
	local pass_style = widget_style[style_id]
	local current_color_value = pass_style.color[1]
	local target_color_value = 100
	local total_time = UISettings.scoreboard.topic_hover_duration
	local animation_duration = current_color_value / 255 * total_time

	for i = 2, 4, 1 do
		if animation_duration > 0 then
			ui_animations[animation_name .. "_hover_" .. i] = self:_animate_element_by_time(pass_style.color, i, current_color_value, target_color_value, animation_duration)
		else
			pass_style.color[1] = target_color_value
		end
	end
end

PopupJoinLobbyHandler._select_hero_and_career = function (self, profile_index, career_index)
	local profile_order_index = ProfileIndexToPriorityIndex[profile_index]

	self:_select_hero_tab_by_index(profile_order_index, career_index)
end

PopupJoinLobbyHandler._select_hero_tab_by_index = function (self, index, optional_career_index, play_sound)
	if self._hero_tab_index == index then
		return
	end

	if play_sound then
		self:_play_sound("play_gui_hero_select_hero_click")
	end

	local gui = self.ui_top_renderer.gui
	local widget = self._widgets_by_name.hero_tabs
	local widget_content = widget.content
	local widget_style = widget.style
	local amount = widget_content.amount

	for i = 1, amount, 1 do
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = widget_content[hotspot_name]
		local icon_name = "icon" .. name_sufix
		local selected = i == index
		hotspot_content.is_selected = selected
		local icon_style = widget_style[icon_name]
		local icon_color = icon_style.color
		icon_color[2] = (selected and 255) or 100
		icon_color[3] = (selected and 255) or 100
		icon_color[4] = (selected and 255) or 100
	end

	local profile_index = ProfilePriority[index]
	local profile_settings = SPProfiles[profile_index]
	local hero_name = profile_settings.display_name
	local character_name = profile_settings.character_name
	self._selected_hero_name = hero_name
	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local exp = hero_attributes:get(hero_name, "experience") or 0
	local level = ExperienceSettings.get_level(exp)

	self:_set_hero_info(Localize(character_name), level)

	local career_index = optional_career_index or hero_attributes:get(hero_name, "career") or 1
	self._hero_tab_index = index

	self:_select_career_tab_by_index(career_index, true)
	self:enable_career_selection()

	self._selected_hero_disabled = false
end

PopupJoinLobbyHandler._select_career_tab_by_index = function (self, career_index, force_set, play_sound)
	if not force_set and self.career_index == career_index then
		return
	end

	if play_sound then
		self:_play_sound("play_gui_hero_select_career_click")
	end

	local gui = self.ui_top_renderer.gui
	local widget = self._widgets_by_name.career_tabs
	local widget_content = widget.content
	local widget_style = widget.style
	local amount = widget_content.amount
	local hero_name = self._selected_hero_name

	self:_assign_career_data_by_hero(hero_name)

	local selected_career_locked = false

	for i = 1, amount, 1 do
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = widget_content[hotspot_name]
		local image_name = "icon" .. name_sufix
		local selected = i == career_index
		hotspot_content.is_selected = selected

		if selected then
			selected_career_locked = hotspot_content.locked
		end

		local image_style = widget_style[image_name]
		local image_color = image_style.color
		image_color[2] = (selected and 255) or 100
		image_color[3] = (selected and 255) or 100
		image_color[4] = (selected and 255) or 100
	end

	local profile_index = FindProfileIndex(hero_name)
	local profile = SPProfiles[profile_index]
	local careers = profile.careers
	local career_settings = careers[career_index]
	local career_display_name = career_settings.display_name
	local career_name = career_settings.name

	self:_set_career_info(Localize(career_display_name))

	self.career_index = career_index
	self._selected_career_name = career_name
	self._selected_career_locked = selected_career_locked
end

PopupJoinLobbyHandler._assign_career_data_by_hero = function (self, hero_name)
	local widget = self._widgets_by_name.career_tabs
	local content = widget.content
	local style = widget.style
	local amount = content.amount
	local gui = self.ui_top_renderer.gui
	local profile_index = FindProfileIndex(hero_name)
	local profile = SPProfiles[profile_index]
	local careers = profile.careers
	local hero_attributes = Managers.backend:get_interface("hero_attributes")
	local hero_experience = hero_attributes:get(hero_name, "experience") or 0
	local hero_level = ExperienceSettings.get_level(hero_experience)
	local selection_texture = "portrait_glow"
	local selection_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(selection_texture)
	local selection_texture_size = selection_texture_settings.size
	local difficulty = self._difficulty

	for i = 1, amount, 1 do
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = content[hotspot_name]
		local career_settings = careers[i]
		local is_career_unlocked = career_settings.is_unlocked_function(hero_name, hero_level)
		hotspot_content.locked = not is_career_unlocked
		local display_name = career_settings.display_name
		local portrait_image = career_settings.portrait_image
		local title_text_name = "title_text" .. name_sufix
		hotspot_content[title_text_name] = display_name
		local image_name = "icon" .. name_sufix
		hotspot_content[image_name] = portrait_image
		local icon_size = style[image_name].size
		local selection_image = "selection_icon" .. name_sufix
		hotspot_content[selection_image] = selection_texture
		local selection_style = style[selection_image]
		local selection_size = selection_style.size
		local selection_offset = selection_style.offset
		local selection_default_offset = selection_style.default_offset
		selection_size[1] = selection_texture_size[1]
		selection_size[2] = selection_texture_size[2]
		selection_offset[1] = (selection_default_offset[1] + icon_size[1] / 2) - selection_size[1] / 2
		selection_offset[2] = (selection_default_offset[2] + icon_size[2] / 2) - selection_size[2] / 2
	end
end

PopupJoinLobbyHandler._assign_hero_portraits = function (self)
	local widget = self._widgets_by_name.hero_tabs
	local content = widget.content
	local style = widget.style
	local gui = self.ui_top_renderer.gui
	local selection_texture = "hero_icon_glow"
	local selection_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(selection_texture)
	local selection_texture_size = selection_texture_settings.size

	for index, profile_index in ipairs(ProfilePriority) do
		local name_sufix = "_" .. tostring(index)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = content[hotspot_name]
		local icon_name = "icon" .. name_sufix
		local selection_image = "selection_icon" .. name_sufix
		local profile_settings = SPProfiles[profile_index]
		local hero_selection_image = profile_settings.hero_selection_image
		hotspot_content[icon_name] = hero_selection_image
		hotspot_content[selection_image] = selection_texture
		local selection_style = style[selection_image]
		local selection_size = selection_style.size
		local selection_offset = selection_style.offset
		local selection_default_offset = selection_style.default_offset
		selection_size[1] = selection_texture_size[1]
		selection_size[2] = selection_texture_size[2]
		local icon_size = style[icon_name].size
		selection_offset[1] = (selection_default_offset[1] + icon_size[1] / 2) - selection_size[1] / 2
		selection_offset[2] = (selection_default_offset[2] + icon_size[2] / 2) - selection_size[2] / 2
	end
end

PopupJoinLobbyHandler._set_hero_info = function (self, name, level)
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.hero_text.content.text = name
end

PopupJoinLobbyHandler._set_career_info = function (self, name, power_level)
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.career_text.content.text = name
end

PopupJoinLobbyHandler._set_timer_text = function (self, timer_text)
	local widgets_by_name = self._widgets_by_name
	widgets_by_name.timer_text.content.text = timer_text
end

PopupJoinLobbyHandler.set_unavailable_heroes = function (self, occupied_heroes)
	local widget = self._widgets_by_name.hero_tabs
	local content = widget.content
	local gui = self.ui_top_renderer.gui
	local selected_hero_disabled = false

	for index, profile_index in ipairs(ProfilePriority) do
		local name_sufix = "_" .. tostring(index)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = content[hotspot_name]
		local disable = occupied_heroes[profile_index]
		hotspot_content.disable_button = disable

		if disable and hotspot_content.is_selected then
			selected_hero_disabled = true
		end
	end

	if selected_hero_disabled then
		self:disable_career_selection()

		self._selected_hero_disabled = true
	else
		self._selected_hero_disabled = false

		self:enable_career_selection()
	end
end

PopupJoinLobbyHandler.set_difficulty = function (self, difficulty)
	self._difficulty = difficulty
end

PopupJoinLobbyHandler.enable_career_selection = function (self)
	local widget = self._widgets_by_name.career_tabs
	local content = widget.content
	local amount = content.amount

	for i = 1, amount, 1 do
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = content[hotspot_name]
		hotspot_content.disable_button = false
	end
end

PopupJoinLobbyHandler.disable_career_selection = function (self)
	local widget = self._widgets_by_name.career_tabs
	local content = widget.content
	local amount = content.amount

	for i = 1, amount, 1 do

		-- Decompilation error in this vicinity:
		local name_sufix = "_" .. tostring(i)
		local hotspot_name = "hotspot" .. name_sufix
		local hotspot_content = content[hotspot_name]

		if hotspot_content.locked then
			hotspot_content.disable_button = false
		else
			hotspot_content.disable_button = true
		end
	end
end

PopupJoinLobbyHandler._animate_element_by_time = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.function_by_time, target, target_index, from, to, time, math.ease_out_quad)

	return new_animation
end

PopupJoinLobbyHandler.set_select_button_enable_state = function (self, enabled)
	local button_content = self._widgets_by_name.select_button.content
	button_content.title_text = (enabled and Localize("input_description_confirm")) or Localize("dlc1_2_difficulty_unavailable")
	button_content.button_hotspot.disable_button = not enabled
end

PopupJoinLobbyHandler._play_sound = function (self, event)
	WwiseWorld.trigger_event(self.wwise_world, event)
end

return

-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
require("scripts/ui/views/ui_calibration_view")

OptionsView = class(OptionsView)
local definitions = local_require("scripts/ui/views/options_view_definitions")
local settings_definitions = local_require("scripts/ui/views/options_view_settings")
local gamepad_frame_widget_definitions = definitions.gamepad_frame_widget_definitions
local background_widget_definitions = definitions.background_widget_definitions
local widget_definitions = definitions.widget_definitions
local title_button_definitions = settings_definitions.title_button_definitions
local button_definitions = definitions.button_definitions
local child_input_services = definitions.child_input_services
local console_cursor_definition = definitions.console_cursor_definition
local SettingsMenuNavigation = SettingsMenuNavigation
local SettingsWidgetTypeTemplate = SettingsWidgetTypeTemplate

local function get_slider_value(min, max, value)
	local range = max - min
	local norm_value = math.clamp(value, min, max) - min

	return norm_value/range
end

local function assigned(a, b)
	if a == nil then
		return b
	else
		return a
	end

	return 
end

local generic_input_actions = {
	main_menu = {
		default = {
			{
				input_action = "confirm",
				priority = 49,
				description_text = "input_description_select"
			},
			{
				input_action = "back",
				priority = 50,
				description_text = "input_description_close"
			}
		},
		reset = {
			{
				input_action = "special_1",
				priority = 48,
				description_text = "input_description_reset"
			},
			{
				input_action = "confirm",
				priority = 49,
				description_text = "input_description_select"
			},
			{
				input_action = "back",
				priority = 50,
				description_text = "input_description_close"
			}
		},
		reset_and_apply = {
			{
				input_action = "special_1",
				priority = 47,
				description_text = "input_description_reset"
			},
			{
				input_action = "refresh",
				priority = 48,
				description_text = "input_description_apply"
			},
			{
				input_action = "confirm",
				priority = 49,
				description_text = "input_description_select"
			},
			{
				input_action = "back",
				priority = 50,
				description_text = "input_description_close"
			}
		},
		apply = {
			{
				input_action = "refresh",
				priority = 49,
				description_text = "input_description_apply"
			},
			{
				input_action = "back",
				priority = 50,
				description_text = "input_description_close"
			}
		}
	},
	sub_menu = {
		default = {
			{
				input_action = "cycle_previous",
				priority = 49,
				description_text = "input_description_information"
			},
			{
				input_action = "back",
				priority = 50,
				description_text = "input_description_back"
			}
		},
		reset = {
			{
				input_action = "cycle_previous",
				priority = 48,
				description_text = "input_description_information"
			},
			{
				input_action = "special_1",
				priority = 49,
				description_text = "input_description_reset"
			},
			{
				input_action = "back",
				priority = 50,
				description_text = "input_description_back"
			}
		},
		reset_and_apply = {
			{
				input_action = "cycle_previous",
				priority = 47,
				description_text = "input_description_information"
			},
			{
				input_action = "special_1",
				priority = 48,
				description_text = "input_description_reset"
			},
			{
				input_action = "refresh",
				priority = 49,
				description_text = "input_description_apply"
			},
			{
				input_action = "back",
				priority = 50,
				description_text = "input_description_back"
			}
		},
		apply = {
			{
				input_action = "cycle_previous",
				priority = 48,
				description_text = "input_description_information"
			},
			{
				input_action = "refresh",
				priority = 49,
				description_text = "input_description_apply"
			},
			{
				input_action = "back",
				priority = 50,
				description_text = "input_description_back"
			}
		}
	}
}
local disabled_mouse_input_table = {
	activate_chat_input = {
		"left",
		"right",
		"left_double",
		"right_double"
	}
}

local function mouse_input_allowed(content_actions, mouse_input)
	for _, content_action in ipairs(content_actions) do
		local disabled_mouse_inputs = disabled_mouse_input_table[content_action]

		if disabled_mouse_inputs then
			for _, disabled_mouse_input in ipairs(disabled_mouse_inputs) do
				if disabled_mouse_input == mouse_input then
					return false
				end
			end
		end
	end

	return true
end

OptionsView.init = function (self, ingame_ui_context)
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.ui_top_renderer = ingame_ui_context.ui_top_renderer
	self.ingame_ui = ingame_ui_context.ingame_ui
	self.level_transition_handler = ingame_ui_context.level_transition_handler
	self.voip = ingame_ui_context.voip
	self.render_settings = {
		snap_pixel_positions = true
	}
	self.platform = PLATFORM
	local input_manager = ingame_ui_context.input_manager

	input_manager.create_input_service(input_manager, "options_menu", "IngameMenuKeymaps", "IngameMenuFilters")
	input_manager.map_device_to_service(input_manager, "options_menu", "keyboard")
	input_manager.map_device_to_service(input_manager, "options_menu", "mouse")
	input_manager.map_device_to_service(input_manager, "options_menu", "gamepad")

	self.input_manager = input_manager
	self.controller_cooldown = 0
	local world = ingame_ui_context.world_manager:world("music_world")
	self.wwise_world = Managers.world:wwise_world(world)
	self.ui_animations = {}

	self.reset_changed_settings(self)
	self.create_ui_elements(self)

	local input_service = input_manager.get_service(input_manager, "options_menu")
	local gui_layer = definitions.scenegraph_definition.root.position[3]
	self.menu_input_description = MenuInputDescriptionUI:new(ingame_ui_context, self.ui_renderer, input_service, 6, gui_layer, generic_input_actions.main_menu.reset)
	self._input_functions = {
		checkbox = function (widget, input_source, dt)
			if widget.content.hotspot.on_release then
				WwiseWorld.trigger_event(self.wwise_world, "Play_hud_select")
				widget.content.callback(widget.content)
			end

			return 
		end,
		option = function (widget, input_source, dt)
			local content = widget.content
			local num_options = content.num_options
			local current_selection = content.current_selection

			for i = 1, num_options, 1 do
				local hotspot_id = "option_" .. i
				local hotspot = content[hotspot_id]

				if hotspot.on_release and current_selection ~= i then
					WwiseWorld.trigger_event(self.wwise_world, "Play_hud_select")

					content.current_selection = i

					content.callback(widget.content)

					return 
				end
			end

			return 
		end,
		slider = function (widget, input_source, dt)
			local content = widget.content
			local left_hotspot = content.left_hotspot
			local right_hotspot = content.right_hotspot
			local callback_on_release = content.callback_on_release

			if content.changed then
				content.changed = nil

				content.callback(content)
			end

			local left_hold = input_source.get(input_source, "left_hold")

			if left_hold then
				content.altering_value = true
			else
				content.altering_value = nil
			end

			local input_cooldown = content.input_cooldown
			local input_cooldown_multiplier = content.input_cooldown_multiplier
			local on_cooldown_last_frame = false

			if input_cooldown then
				on_cooldown_last_frame = true
				local new_cooldown = math.max(input_cooldown - dt, 0)
				input_cooldown = (0 < new_cooldown and new_cooldown) or nil
				content.input_cooldown = input_cooldown
			end

			local internal_value = content.internal_value
			local num_decimals = content.num_decimals
			local min = content.min
			local max = content.max
			local diff = max - min
			local total_step = diff*10^num_decimals
			local step = total_step/1
			local input_been_made = false

			if left_hotspot.is_clicked == 0 or left_hotspot.on_release then
				internal_value = math.clamp(internal_value - step, 0, 1)
				input_been_made = true
			elseif right_hotspot.is_clicked == 0 or right_hotspot.on_release then
				internal_value = math.clamp(internal_value + step, 0, 1)
				input_been_made = true
			end

			if input_been_made then
				if not input_cooldown then
					content.internal_value = internal_value

					if not callback_on_release or left_hotspot.on_release or right_hotspot.on_release then
						content.changed = true
					end

					if on_cooldown_last_frame then
						input_cooldown_multiplier = math.max(input_cooldown_multiplier - 0.1, 0.1)
						content.input_cooldown = math.ease_in_exp(input_cooldown_multiplier)*0.2
						content.input_cooldown_multiplier = input_cooldown_multiplier
					else
						input_cooldown_multiplier = 1
						content.input_cooldown = math.ease_in_exp(input_cooldown_multiplier)*0.2
						content.input_cooldown_multiplier = input_cooldown_multiplier
					end

					WwiseWorld.trigger_event(self.wwise_world, "Play_hud_select")
				elseif callback_on_release and (left_hotspot.on_release or right_hotspot.on_release) then
					content.internal_value = internal_value
					content.changed = true
				end
			end

			return 
		end,
		drop_down = function (widget, input_source, dt)
			local content = widget.content
			local style = widget.style

			if not content.active then
				local hotspot = content.hotspot

				if hotspot.on_hover_enter then
					WwiseWorld.trigger_event(self.wwise_world, "Play_hud_hover")
				end

				if hotspot.on_release then
					content.active = true
					style.list_style.active = true
					self.disable_all_input = true

					WwiseWorld.trigger_event(self.wwise_world, "Play_hud_select")
				end
			else
				local list_style = style.list_style
				local item_contents = content.list_content
				local item_styles = list_style.item_styles
				local num_draws = list_style.num_draws
				local options_texts = content.options_texts

				for i = 1, num_draws, 1 do
					local item_content = item_contents[i]
					local hotspot = item_content.hotspot

					if hotspot.on_hover_enter then
						WwiseWorld.trigger_event(self.wwise_world, "Play_hud_hover")
					end

					if hotspot.on_release then
						WwiseWorld.trigger_event(self.wwise_world, "Play_hud_select")

						content.current_selection = i

						content.callback(content)

						content.active = false
						list_style.active = false
						self.disable_all_input = false

						break
					end
				end

				if content.active and input_source.get(input_source, "left_release") then
					content.active = false
					list_style.active = false
					self.disable_all_input = false

					WwiseWorld.trigger_event(self.wwise_world, "Play_hud_select")
				end
			end

			return 
		end,
		stepper = function (widget, input_source, dt)
			local content = widget.content
			local current_selection = content.current_selection or 0
			local new_selection = current_selection
			local left_hotspot = content.left_hotspot
			local right_hotspot = content.right_hotspot

			if left_hotspot.on_release or content.controller_on_release_left then
				content.controller_on_release_left = nil
				new_selection = new_selection - 1

				if new_selection == 0 then
					new_selection = content.num_options
				end
			end

			if right_hotspot.on_release or content.controller_on_release_right then
				content.controller_on_release_right = nil
				new_selection = new_selection + 1

				if content.num_options < new_selection then
					new_selection = 1
				end
			end

			if new_selection ~= current_selection then
				WwiseWorld.trigger_event(self.wwise_world, "Play_hud_select")

				content.current_selection = new_selection

				content.callback(content)
			end

			return 
		end,
		keybind = function (widget, input_source, dt)
			local gamepad_active = Managers.input:is_device_active("gamepad")

			if gamepad_active then
				return 
			end

			local content = widget.content

			if not content.active then
				if content.hotspot.on_release then
					content.active = true
					content.active_t = 0
					self.disable_all_input = true

					self.input_manager:block_device_except_service("options_menu", "keyboard", 1, "keybind")
					self.input_manager:block_device_except_service("options_menu", "mouse", 1, "keybind")
					self.input_manager:block_device_except_service("options_menu", "gamepad", 1, "keybind")
					WwiseWorld.trigger_event(self.wwise_world, "Play_hud_select")
				end
			else
				local stop = false

				if content.controller_input_pressed then
					stop = true
				end

				local button = Keyboard.any_released()

				if not stop and button == 27 then
					stop = true
				end

				if not stop and button ~= nil then
					local new_key = Keyboard.button_name(button)

					if new_key and new_key ~= "" then
						content.callback(new_key, "keyboard", content)

						stop = true
					end
				end

				button = Mouse.any_released()

				if not stop and button ~= nil then
					local new_key = Mouse.button_name(button)
					local input_allowed = mouse_input_allowed(content.actions, new_key)

					if input_allowed then
						content.callback(new_key, "mouse", content)

						stop = true
					end
				end

				if stop then
					content.controller_input_pressed = nil
					content.active = false
					self.disable_all_input = false

					self.input_manager:device_unblock_all_services("keyboard", 1)
					self.input_manager:device_unblock_all_services("mouse", 1)
					self.input_manager:device_unblock_all_services("gamepad", 1)
					self.input_manager:block_device_except_service("options_menu", "keyboard", 1)
					self.input_manager:block_device_except_service("options_menu", "mouse", 1)
					self.input_manager:block_device_except_service("options_menu", "gamepad", 1)
				end
			end

			return 
		end,
		text_link = function (widget, input_source, dt)
			if widget.content.hotspot.on_release then
				local url = widget.content.url

				if url then
					WwiseWorld.trigger_event(self.wwise_world, "Play_hud_select")
					Application.open_url_in_browser(url)
				end
			end

			return 
		end,
		image = function ()
			return 
		end,
		title = function ()
			return 
		end,
		gamepad_layout = function ()
			return 
		end
	}

	return 
end
OptionsView.input_service = function (self)
	return self.input_manager:get_service("options_menu")
end
OptionsView.cleanup_popups = function (self)
	if self.save_data_error_popup_id then
		Managers.popup:cancel_popup(self.save_data_error_popup_id)

		self.save_data_error_popup_id = nil
	end

	if self.apply_popup_id then
		Managers.popup:cancel_popup(self.apply_popup_id)

		self.apply_popup_id = nil

		self.handle_apply_popup_results(self, "revert_changes")
	end

	if self.title_popup_id then
		Managers.popup:cancel_popup(self.title_popup_id)

		self.title_popup_id = nil
	end

	if self.exit_popup_id then
		Managers.popup:cancel_popup(self.exit_popup_id)

		self.exit_popup_id = nil
	end

	return 
end
OptionsView.destroy = function (self)
	self.cleanup_popups(self)
	self.menu_input_description:destroy()

	self.menu_input_description = nil

	GarbageLeakDetector.register_object(self, "OptionsView")

	return 
end
RELOAD_OPTIONS_VIEW = true
OptionsView.create_ui_elements = function (self)
	self.background_widgets = {}
	local background_widgets_n = 0

	for name, definition in pairs(background_widget_definitions) do
		background_widgets_n = background_widgets_n + 1
		self.background_widgets[background_widgets_n] = UIWidget.init(definition)

		if name == "right_frame" then
			self.scroll_field_widget = self.background_widgets[background_widgets_n]
		end
	end

	self.background_widgets_n = background_widgets_n
	self.gamepad_tooltip_text_widget = UIWidget.init(gamepad_frame_widget_definitions.gamepad_tooltip_text)
	self.title_buttons = {}
	local title_buttons_n = 0

	for i, definition in ipairs(title_button_definitions) do
		title_buttons_n = title_buttons_n + 1
		self.title_buttons[title_buttons_n] = UIWidget.init(definition)
	end

	self.title_buttons_n = title_buttons_n
	self.exit_button = UIWidget.init(button_definitions.exit_button)
	self.apply_button = UIWidget.init(button_definitions.apply_button)
	self.reset_to_default = UIWidget.init(button_definitions.reset_to_default)
	self.scrollbar = UIWidget.init(definitions.scrollbar_definition)
	self.scrollbar.content.disable_frame = true
	self._console_cursor = UIWidget.init(console_cursor_definition)
	local calibrate_ui_settings_list_dummy = {
		hide_reset = true,
		widgets_n = 0,
		scenegraph_id_start = "calibrate_ui_dummy",
		widgets = {}
	}
	local settings_lists = {}

	if PLATFORM == "win32" then
		if rawget(_G, "Tobii") then
			local tobii_settings_definition = nil
			local tobii_is_connected = Tobii.get_is_connected()
			self._tobii_is_connected = tobii_is_connected

			if tobii_is_connected then
				tobii_settings_definition = settings_definitions.tobii_settings_definition
			else
				tobii_settings_definition = {
					{
						text = "settings_view_header_eyetracker_not_found",
						url = "http://tobiigaming.com/",
						widget_type = "text_link"
					}
				}
			end

			local tobii_settings_list = self.build_settings_list(self, tobii_settings_definition, "tobii_eyetracking_settings_list")
			settings_lists.tobii_eyetracking_settings = tobii_settings_list
			tobii_settings_list.on_enter = function (settings_list)
				local players = Managers.player:players()

				for _, player in pairs(players) do
					local player_unit = player.player_unit

					if player.local_player and ScriptUnit.has_extension(player_unit, "eyetracking_system") then
						local eyetracking_extension = ScriptUnit.extension(player_unit, "eyetracking_system")

						eyetracking_extension.set_eyetracking_options_opened(eyetracking_extension, true)
					end
				end

				return 
			end
			tobii_settings_list.on_exit = function ()
				local players = Managers.player:players()

				for _, player in pairs(players) do
					local player_unit = player.player_unit

					if player.local_player and ScriptUnit.has_extension(player_unit, "eyetracking_system") then
						local eyetracking_extension = ScriptUnit.extension(player_unit, "eyetracking_system")

						eyetracking_extension.set_eyetracking_options_opened(eyetracking_extension, false)
					end
				end

				return 
			end
		end

		settings_lists.video_settings = self.build_settings_list(self, settings_definitions.video_settings_definition, "video_settings_list")
		settings_lists.audio_settings = self.build_settings_list(self, settings_definitions.audio_settings_definition, "audio_settings_list")
		settings_lists.gameplay_settings = self.build_settings_list(self, settings_definitions.gameplay_settings_definition, "gameplay_settings_list")
		settings_lists.display_settings = self.build_settings_list(self, settings_definitions.display_settings_definition, "display_settings_list")
		settings_lists.keybind_settings = self.build_settings_list(self, settings_definitions.keybind_settings_definition, "keybind_settings_list")
		settings_lists.gamepad_settings = self.build_settings_list(self, settings_definitions.gamepad_settings_definition, "gamepad_settings_list")
		settings_lists.network_settings = self.build_settings_list(self, settings_definitions.network_settings_definition, "network_settings_list")
		settings_lists.video_settings.hide_reset = true
		settings_lists.video_settings.needs_apply_confirmation = true
	else
		if (Managers.voice_chat and Managers.voice_chat:initiated()) or self.voip then
			settings_lists.audio_settings = self.build_settings_list(self, settings_definitions.audio_settings_definition, "audio_settings_list")
		else
			settings_lists.audio_settings = self.build_settings_list(self, settings_definitions.audio_settings_definition_without_voip, "audio_settings_list")
		end

		settings_lists.gameplay_settings = self.build_settings_list(self, settings_definitions.gameplay_settings_definition, "gameplay_settings_list")
		settings_lists.display_settings = self.build_settings_list(self, settings_definitions.display_settings_definition, "display_settings_list")
		settings_lists.gamepad_settings = self.build_settings_list(self, settings_definitions.gamepad_settings_definition, "gamepad_settings_list")
	end

	self.settings_lists = settings_lists
	self.selected_widget = nil
	self.selected_title = nil
	self.ui_scenegraph = UISceneGraph.init_scenegraph(definitions.scenegraph_definition)
	self.ui_calibration_view = UICalibrationView:new()
	RELOAD_OPTIONS_VIEW = false

	self._setup_text_buttons_width(self)

	return 
end
OptionsView._setup_text_buttons_width = function (self)
	local button_width = self._setup_text_button_size(self, self.apply_button)

	self._setup_text_button_size(self, self.reset_to_default)
	self._set_text_button_horizontal_position(self, self.reset_to_default, -(button_width + 50))

	local total_menu_panel_length = 0

	for _, widget in ipairs(self.title_buttons) do
		local width = self._setup_text_button_size(self, widget)

		self._set_text_button_horizontal_position(self, widget, total_menu_panel_length)

		total_menu_panel_length = total_menu_panel_length + width + 20
	end

	return 
end
OptionsView._setup_text_button_size = function (self, widget)
	local scenegraph_id = widget.scenegraph_id
	local content = widget.content
	local style = widget.style
	local text_style = style.text
	local text = content.text_field or content.text

	if text_style.localize then
		text = Localize(text)
	end

	if text_style.upper_case then
		text = string.upper(text)
	end

	local ui_scenegraph = self.ui_scenegraph
	local ui_renderer = self.ui_renderer
	local font, scaled_font_size = UIFontByResolution(text_style)
	local text_width, text_height, min = UIRenderer.text_size(ui_renderer, text, font[1], scaled_font_size)
	ui_scenegraph[scenegraph_id].size[1] = text_width

	return text_width
end
OptionsView._set_text_button_horizontal_position = function (self, widget, x_position)
	local ui_scenegraph = self.ui_scenegraph
	local scenegraph_id = widget.scenegraph_id
	ui_scenegraph[scenegraph_id].local_position[1] = x_position

	return 
end
OptionsView.build_settings_list = function (self, definition, scenegraph_id)
	local scenegraph_definition = definitions.scenegraph_definition
	local scenegraph_id_start = scenegraph_id .. "start"
	local list_size_y = 0
	local widgets = {}
	local widgets_n = 0
	local definition_n = #definition

	for i = 1, definition_n, 1 do
		local element = definition[i]
		local base_offset = {
			0,
			-list_size_y,
			0
		}
		local widget = nil
		local size_y = 0
		local widget_type = element.widget_type

		if widget_type == "drop_down" then
			widget = self.build_drop_down_widget(self, element, scenegraph_id_start, base_offset)
		elseif widget_type == "option" then
			widget = self.build_option_widget(self, element, scenegraph_id_start, base_offset)
		elseif widget_type == "slider" then
			widget = self.build_slider_widget(self, element, scenegraph_id_start, base_offset)
		elseif widget_type == "checkbox" then
			widget = self.build_checkbox_widget(self, element, scenegraph_id_start, base_offset)
		elseif widget_type == "stepper" then
			widget = self.build_stepper_widget(self, element, scenegraph_id_start, base_offset)
		elseif widget_type == "keybind" then
			widget = self.build_keybind_widget(self, element, scenegraph_id_start, base_offset)
		elseif widget_type == "image" then
			widget = self.build_image(self, element, scenegraph_id_start, base_offset)
		elseif widget_type == "gamepad_layout" then
			widget = self.build_gamepad_layout(self, element, scenegraph_id_start, base_offset)
			self.gamepad_layout_widget = widget
			local using_left_handed_option = assigned(self.changed_user_settings.gamepad_left_handed, Application.user_setting("gamepad_left_handed"))

			self.update_gamepad_layout_widget(self, DefaultGamepadLayoutKeymaps, using_left_handed_option)
		elseif widget_type == "empty" then
			size_y = element.size_y
		elseif widget_type == "title" then
			widget = self.build_title(self, element, scenegraph_id_start, base_offset)
		elseif widget_type == "text_link" then
			widget = self.build_text_link(self, element, scenegraph_id_start, base_offset)
		else
			error("[OptionsView] Unsupported widget type")
		end

		if widget then
			local name = element.callback
			size_y = widget.style.size[2]
			widget.type = widget_type
			widget.name = name
			widget.ui_animations = {}
		end

		list_size_y = list_size_y + size_y

		if widget then
			if element.name then
				widget.name = element.name
			end

			widgets_n = widgets_n + 1
			widgets[widgets_n] = widget
		end
	end

	local mask_size = scenegraph_definition.list_mask.size
	local size_x = mask_size[1]
	scenegraph_definition[scenegraph_id] = {
		vertical_alignment = "top",
		parent = "list_mask",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			-1
		},
		offset = {
			0,
			0,
			0
		},
		size = {
			size_x,
			list_size_y
		}
	}
	scenegraph_definition[scenegraph_id_start] = {
		vertical_alignment = "top",
		horizontal_alignment = "left",
		parent = scenegraph_id,
		position = {
			30,
			0,
			10
		},
		size = {
			1,
			1
		}
	}
	local scrollbar = false
	local max_offset_y = 0

	if mask_size[2] < list_size_y then
		scrollbar = true
		max_offset_y = list_size_y - mask_size[2]
	end

	local widget_list = {
		visible_widgets_n = 0,
		scenegraph_id = scenegraph_id,
		scenegraph_id_start = scenegraph_id_start,
		scrollbar = scrollbar,
		max_offset_y = max_offset_y,
		widgets = widgets,
		widgets_n = widgets_n
	}

	return widget_list
end
OptionsView.make_callback = function (self, callback_name)
	local function new_callback(...)
		self[callback_name](self, ...)

		local changed_user_settings = self.changed_user_settings
		local original_user_settings = self.original_user_settings

		for setting, value in pairs(changed_user_settings) do
			if not original_user_settings[setting] then
				original_user_settings[setting] = Application.user_setting(setting)
			end

			if value == original_user_settings[setting] then
				changed_user_settings[setting] = nil
			end
		end

		local changed_render_settings = self.changed_render_settings
		local original_render_settings = self.original_render_settings

		for setting, value in pairs(self.changed_render_settings) do
			if not original_render_settings[setting] then
				original_render_settings[setting] = Application.user_setting("render_settings", setting)
			end

			if value == original_render_settings[setting] then
				changed_render_settings[setting] = nil
			end
		end

		return 
	end

	return new_callback
end
OptionsView.build_stepper_widget = function (self, element, scenegraph_id, base_offset)
	local callback_name = element.callback
	local callback_func = self.make_callback(self, callback_name)
	local saved_value_cb_name = element.saved_value
	local saved_value_cb = callback(self, saved_value_cb_name)
	local setup_name = element.setup
	local selected_option, options, text, default_value = self[setup_name](self)
	local widget = definitions.create_stepper_widget(text, options, selected_option, element.tooltip_text, scenegraph_id, base_offset)
	local content = widget.content
	content.callback = callback_func
	content.saved_value_cb = saved_value_cb
	content.on_hover_enter_callback = callback(self, "on_stepper_arrow_hover", widget)
	content.on_hover_exit_callback = callback(self, "on_stepper_arrow_dehover", widget)
	content.on_pressed_callback = callback(self, "on_stepper_arrow_pressed", widget)
	content.default_value = default_value

	return widget
end
OptionsView.build_option_widget = function (self, element, scenegraph_id, base_offset)
	local callback_name = element.callback
	local callback_func = self.make_callback(self, callback_name)
	local saved_value_cb_name = element.saved_value
	local saved_value_cb = callback(self, saved_value_cb_name)
	local setup_name = element.setup
	local selected_option, options, text, default_value = self[setup_name](self)
	local ui_renderer = self.ui_renderer
	local widget = definitions.create_option_widget(ui_renderer, text, options, selected_option, element.tooltip_text, scenegraph_id, base_offset)
	local content = widget.content
	content.callback = callback_func
	content.saved_value_cb = saved_value_cb
	content.default_value = default_value

	return widget
end
OptionsView.build_drop_down_widget = function (self, element, scenegraph_id, base_offset)
	local callback_name = element.callback
	local callback_func = self.make_callback(self, callback_name)
	local saved_value_cb_name = element.saved_value
	local saved_value_cb = callback(self, saved_value_cb_name)
	local setup_name = element.setup
	local selected_option, options, text, default_value = self[setup_name](self)
	local widget = definitions.create_drop_down_widget(text, options, selected_option, element.tooltip_text, scenegraph_id, base_offset)
	local content = widget.content
	content.callback = callback_func
	content.saved_value_cb = saved_value_cb
	content.default_value = default_value

	return widget
end
OptionsView.build_slider_widget = function (self, element, scenegraph_id, base_offset)
	local callback_name = element.callback
	local callback_func = self.make_callback(self, callback_name)
	local callback_on_release = element.callback_on_release
	local saved_value_cb_name = element.saved_value
	local saved_value_cb = callback(self, saved_value_cb_name)
	local setup_name = element.setup
	local slider_image = element.slider_image
	local value, min, max, num_decimals, text, default_value = self[setup_name](self)

	fassert(type(value) == "number", "Value type is wrong, need number, got %q", type(value))

	local widget = definitions.create_slider_widget(text, element.tooltip_text, scenegraph_id, base_offset, slider_image)
	local content = widget.content
	content.min = min
	content.max = max
	content.internal_value = value
	content.num_decimals = num_decimals
	content.callback = callback_func
	content.callback_on_release = callback_on_release
	content.on_hover_enter_callback = callback(self, "on_stepper_arrow_hover", widget)
	content.on_hover_exit_callback = callback(self, "on_stepper_arrow_dehover", widget)
	content.on_pressed_callback = callback(self, "on_stepper_arrow_pressed", widget)
	content.saved_value_cb = saved_value_cb
	content.default_value = default_value

	return widget
end
OptionsView.build_image = function (self, element, scenegraph_id, base_offset)
	local widget = definitions.create_simple_texture_widget(element.image, element.image_size, scenegraph_id, base_offset)
	local content = widget.content
	content.callback = function ()
		return 
	end
	content.saved_value_cb = function ()
		return 
	end
	content.disabled = true

	return widget
end
OptionsView.build_title = function (self, element, scenegraph_id, base_offset)
	local widget = definitions.create_title_widget(element.text, element.font_size, element.color, element.horizontal_alignment, scenegraph_id, base_offset)
	local content = widget.content
	content.callback = function ()
		return 
	end
	content.saved_value_cb = function ()
		return 
	end
	content.disabled = true

	return widget
end
OptionsView.build_text_link = function (self, element, scenegraph_id, base_offset)
	local widget = definitions.create_text_link_widget(element.text, element.url, element.font_size, element.color, element.horizontal_alignment, scenegraph_id, base_offset)
	local content = widget.content
	content.callback = function ()
		return 
	end
	content.saved_value_cb = function ()
		return 
	end

	return widget
end
OptionsView.clear_gamepad_layout_widget = function (self)
	local using_left_handed_option = assigned(self.changed_user_settings.gamepad_left_handed, Application.user_setting("gamepad_left_handed"))
	local default_gamepad_actions_by_key = (using_left_handed_option and AlternatateGamepadSettings.left_handed.default_gamepad_actions_by_key) or AlternatateGamepadSettings.default.default_gamepad_actions_by_key
	local widget = self.gamepad_layout_widget
	local widget_content = widget.content
	local background_texture = widget_content.background
	local background1_texture = widget_content.background1
	local background2_texture = widget_content.background2
	local saved_value_cb = widget_content.saved_value_cb

	table.clear(widget_content)

	widget_content.background = background_texture
	widget_content.background1 = background1_texture
	widget_content.background2 = background2_texture
	widget_content.saved_value_cb = saved_value_cb

	if PLATFORM == "win32" then
		local gamepad_use_ps4_style_input_icons = assigned(self.changed_user_settings.gamepad_use_ps4_style_input_icons, Application.user_setting("gamepad_use_ps4_style_input_icons"))
		widget_content.use_texture2_layout = gamepad_use_ps4_style_input_icons
	end

	for input_key, action_name in pairs(default_gamepad_actions_by_key) do
		widget_content[input_key] = Localize(action_name)
	end

	return 
end
OptionsView.update_gamepad_layout_widget = function (self, keymaps, using_left_handed_option)
	local widget = self.gamepad_layout_widget
	local widget_content = widget.content
	local display_keybinds = {}

	self.clear_gamepad_layout_widget(self)

	local ignore_gamepad_action_names = (using_left_handed_option and AlternatateGamepadSettings.left_handed.ignore_gamepad_action_names) or AlternatateGamepadSettings.default.ignore_gamepad_action_names

	for keymaps_table_name, keymaps_table in pairs(keymaps) do
		for keybindings_name, keybindings in pairs(keymaps_table) do
			for action_name, keybind in pairs(keybindings) do
				if not settings_definitions.ignore_keybind[action_name] then
					if ignore_gamepad_action_names and ignore_gamepad_action_names[action_name] then
					else
						local num_variables = #keybind

						if num_variables < 3 then
						else
							local button_name = keybind[2]
							local actions = display_keybinds[button_name] or {}
							display_keybinds[button_name] = actions
							actions[#actions + 1] = action_name
						end
					end
				end
			end
		end
	end

	for button_name, actions in pairs(display_keybinds) do
		for i = 1, #actions, 1 do
			local action_name = actions[i]

			if not widget_content[button_name] then
				widget_content[button_name] = Localize(action_name)
			else
				local display_text = widget_content[button_name] .. "/" .. Localize(action_name)
				widget_content[button_name] = display_text
			end
		end
	end

	return 
end
OptionsView.build_gamepad_layout = function (self, element, scenegraph_id, base_offset)
	local widget = definitions.create_gamepad_layout_widget(element.bg_image, element.bg_image_size, element.bg_image2, element.bg_image_size2, scenegraph_id, base_offset)
	local widget_content = widget.content
	widget_content.callback = function ()
		return 
	end
	widget_content.saved_value_cb = function ()
		return 
	end
	widget_content.disabled = true

	return widget
end
OptionsView.build_checkbox_widget = function (self, element, scenegraph_id, base_offset)
	local callback_name = element.callback
	local callback_func = self.make_callback(self, callback_name)
	local saved_value_cb_name = element.saved_value
	local saved_value_cb = callback(self, saved_value_cb_name)
	local setup_name = element.setup
	local flag, text, default_value = self[setup_name](self)

	fassert(type(flag) == "boolean", "Flag type is wrong, need boolean, got %q", type(flag))

	local widget = definitions.create_checkbox_widget(text, scenegraph_id, base_offset)
	local content = widget.content
	content.flag = flag
	content.callback = callback_func
	content.saved_value_cb = saved_value_cb
	content.default_value = default_value

	return widget
end
OptionsView.build_keybind_widget = function (self, element, scenegraph_id, base_offset)
	local callback_func = callback(self, "cb_keybind_changed")
	local saved_value_cb = callback(self, "cb_keybind_saved_value")
	local selected_key, actions_info, default_value = self.cb_keybind_setup(self, element.keymappings_key, element.keymappings_table_key, element.actions)
	local widget = definitions.create_keybind_widget(selected_key, element.keybind_description, element.actions, actions_info, scenegraph_id, base_offset)
	local content = widget.content
	content.callback = callback_func
	content.saved_value_cb = saved_value_cb
	content.default_value = default_value
	content.keymappings_key = element.keymappings_key
	content.keymappings_table_key = element.keymappings_table_key

	return widget
end
OptionsView.widget_from_name = function (self, name)
	local selected_settings_list = self.selected_settings_list

	fassert(selected_settings_list, "[OptionsView] Trying to set disable on widget without a selected settings list.")

	local widgets = selected_settings_list.widgets
	local widgets_n = selected_settings_list.widgets_n

	for i = 1, widgets_n, 1 do
		local widget = widgets[i]

		if widget.name and widget.name == name then
			return widget
		end
	end

	return 
end
OptionsView.force_set_widget_value = function (self, name, value)
	local widget = self.widget_from_name(self, name)

	fassert(widget, "No widget with name %q in current settings list", name)

	local widget_type = widget.type

	if widget_type == "stepper" or widget_type == "option" then
		local content = widget.content
		local options_values = content.options_values

		for i = 1, #options_values, 1 do
			if value == options_values[i] then
				content.current_selection = i
			end
		end

		content.callback(content)
	else
		fassert(false, "Force set widget value not supported for widget type %q yet", wiget_type)
	end

	return 
end
OptionsView.set_widget_disabled = function (self, name, disable)
	local widget = self.widget_from_name(self, name)

	if widget then
		widget.content.disabled = disable
	end

	return 
end
OptionsView.on_enter = function (self)
	ShowCursorStack.push()
	self.set_original_settings(self)
	self.reset_changed_settings(self)
	self.select_settings_title(self, 1)

	self.in_settings_sub_menu = false
	self.gamepad_active_generic_actions_name = nil
	self.gamepad_tooltip_available = nil
	local input_manager = self.input_manager
	local gamepad_active = input_manager.is_device_active(input_manager, "gamepad")

	if gamepad_active then
		self.selected_title = nil

		self.set_console_title_selection(self, 1, true)
	end

	WwiseWorld.trigger_event(self.wwise_world, "Play_hud_button_open")

	self.active = true

	self.input_manager:block_device_except_service("options_menu", "keyboard", 1)
	self.input_manager:block_device_except_service("options_menu", "mouse", 1)
	self.input_manager:block_device_except_service("options_menu", "gamepad", 1)

	local world = self.ui_renderer.world
	local shading_env = World.get_data(world, "shading_environment")

	if shading_env then
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", 1)
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", 0.75)
		ShadingEnvironment.apply(shading_env)
	end

	return 
end
OptionsView.on_exit = function (self)
	ShowCursorStack.pop()
	self.input_manager:device_unblock_all_services("keyboard", 1)
	self.input_manager:device_unblock_all_services("mouse", 1)
	self.input_manager:device_unblock_all_services("gamepad", 1)

	self.exiting = nil
	self.active = nil
	local world = self.ui_renderer.world
	local shading_env = World.get_data(world, "shading_environment")

	if shading_env then
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", 0)
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", 0)
		ShadingEnvironment.apply(shading_env)
	end

	return 
end
OptionsView.exit = function (self, return_to_game)
	self.cleanup_popups(self)

	if self.selected_title then
		self.deselect_title(self, self.selected_title)

		self.in_settings_sub_menu = false
	end

	self.gamepad_active_generic_actions_name = nil
	self.gamepad_tooltip_available = nil
	local exit_transition = (return_to_game and "exit_menu") or "ingame_menu"

	self.ingame_ui:transition_with_fade(exit_transition)
	WwiseWorld.trigger_event(self.wwise_world, "Play_hud_button_close")

	self.exiting = true

	return 
end
OptionsView.transitioning = function (self)
	if self.exiting then
		return true
	else
		return not self.active
	end

	return 
end
OptionsView.get_keymaps = function (self, include_saved_keybinds, optional_platform_key)
	local keybindings_mappings = {}
	local kebindings_definitions = settings_definitions.keybind_settings_definition

	if not kebindings_definitions then
		return 
	end

	for index, kebinding_definition in ipairs(kebindings_definitions) do
		local keymappings_key = kebinding_definition.keymappings_key
		local actions = kebinding_definition.actions

		if actions then
			local keymappings_table_key = kebinding_definition.keymappings_table_key

			if not keybindings_mappings[keymappings_key] then
				keybindings_mappings[keymappings_key] = {}
			end

			local keymapping_table = keybindings_mappings[keymappings_key]
			local keymaps_table = rawget(_G, keymappings_key)

			for keymaps_table_key, keymaps in pairs(keymaps_table) do
				if not optional_platform_key or optional_platform_key == keymaps_table_key then
					if not keymapping_table[keymaps_table_key] then
						keymapping_table[keymaps_table_key] = {}
					end

					local keymaps_sub_table = keymapping_table[keymaps_table_key]

					for action, keybinding in pairs(keymaps) do
						if table.contains(actions, action) then
							keymaps_sub_table[action] = table.clone(keybinding)
						end
					end
				end
			end
		end
	end

	if include_saved_keybinds then
		local saved_controls = PlayerData.controls or {}

		for keymappings_key, keymappings in pairs(keybindings_mappings) do
			local saved_keybindings_table = saved_controls[keymappings_key]

			if saved_keybindings_table then
				for saved_keybinding_table_key, saved_keybindings in pairs(saved_keybindings_table) do
					if not optional_platform_key or optional_platform_key == saved_keybinding_table_key then
						for action, keybinding in pairs(saved_keybindings) do
							local original_keymappings = keymappings[saved_keybinding_table_key]

							if original_keymappings and original_keymappings[action] then
								local saved_action_keybind = table.clone(keybinding)
								original_keymappings[action] = saved_action_keybind
							end
						end
					end
				end
			end
		end
	end

	return keybindings_mappings
end
OptionsView.reset_changed_settings = function (self)
	self.changed_user_settings = {}
	self.changed_render_settings = {}
	local include_saved_keybinds = true
	self.session_keymaps = self.get_keymaps(self, include_saved_keybinds, "win32")
	self.changed_keymaps = false

	return 
end
OptionsView.set_original_settings = function (self)
	self.original_user_settings = {}
	self.original_render_settings = {}
	local include_saved_keybinds = true
	self.original_keymaps = self.get_keymaps(self, include_saved_keybinds, "win32")

	return 
end
OptionsView.set_wwise_parameter = function (self, name, value)
	WwiseWorld.set_global_parameter(self.wwise_world, name, value)

	return 
end
OptionsView.changes_been_made = function (self)
	return 0 < table.size(self.changed_user_settings) or 0 < table.size(self.changed_render_settings) or self.changed_keymaps
end
local needs_reload_settings = settings_definitions.needs_reload_settings
OptionsView.apply_changes = function (self, user_settings, render_settings, pending_user_settings)
	local needs_reload = false

	for setting, value in pairs(user_settings) do
		Application.set_user_setting(setting, value)

		if table.contains(needs_reload_settings, setting) then
			needs_reload = true
		end
	end

	for setting, value in pairs(render_settings) do
		Application.set_user_setting("render_settings", setting, value)

		if table.contains(needs_reload_settings, setting) then
			needs_reload = true
		end
	end

	local char_texture_quality = user_settings.char_texture_quality

	if char_texture_quality then
		local char_texture_settings = TextureQuality.characters[char_texture_quality]

		for id, setting in ipairs(char_texture_settings) do
			Application.set_user_setting("texture_settings", setting.texture_setting, setting.mip_level)
		end
	end

	local env_texture_quality = user_settings.env_texture_quality

	if env_texture_quality then
		local char_texture_settings = TextureQuality.environment[env_texture_quality]

		for id, setting in ipairs(char_texture_settings) do
			Application.set_user_setting("texture_settings", setting.texture_setting, setting.mip_level)
		end
	end

	if PLATFORM == "win32" then
		local max_fps = user_settings.max_fps

		if max_fps then
			if max_fps == 0 then
				Application.set_time_step_policy("no_throttle")
			else
				Application.set_time_step_policy("throttle", max_fps)
			end
		end
	end

	local max_upload = user_settings.max_upload_speed
	local network_manager = Managers.state.network

	if max_upload and network_manager then
		network_manager.set_max_upload_speed(network_manager, max_upload)
	end

	local max_stacking_frames = user_settings.max_stacking_frames

	if max_stacking_frames then
		Application.set_max_frame_stacking(max_stacking_frames)
	end

	local use_hud_screen_fit = user_settings.use_hud_screen_fit

	if use_hud_screen_fit ~= nil then
		UISettings.use_hud_screen_fit = use_hud_screen_fit
	end

	local use_subtitles = user_settings.use_subtitles

	if use_subtitles ~= nil then
		UISettings.use_subtitles = use_subtitles
	end

	local master_bus_volume = user_settings.master_bus_volume

	if master_bus_volume then
		self.set_wwise_parameter(self, "master_bus_volume", master_bus_volume)
	end

	local music_bus_volume = user_settings.music_bus_volume

	if music_bus_volume then
		Managers.music:set_music_volume(music_bus_volume)
	end

	local sfx_bus_volume = user_settings.sfx_bus_volume

	if sfx_bus_volume then
		self.set_wwise_parameter(self, "sfx_bus_volume", sfx_bus_volume)
	end

	local voice_bus_volume = user_settings.voice_bus_volume

	if voice_bus_volume then
		self.set_wwise_parameter(self, "voice_bus_volume", voice_bus_volume)
	end

	local voip_bus_volume = user_settings.voip_bus_volume

	if voip_bus_volume then
		self.voip:set_volume(voip_bus_volume)
	end

	local voip_enabled = user_settings.voip_is_enabled

	if voip_enabled ~= nil then
		self.voip:set_enabled(voip_enabled)

		if PLATFORM == "xb1" then
			Managers.voice_chat:set_enabled(voip_enabled)
		end
	end

	local voip_push_to_talk = user_settings.voip_push_to_talk

	if voip_push_to_talk then
		self.voip:set_push_to_talk(voip_push_to_talk)
	end

	local dynamic_range_sound = user_settings.dynamic_range_sound

	if dynamic_range_sound then
		local setting = 1

		if dynamic_range_sound == "high" then
			setting = 0
		end

		self.set_wwise_parameter(self, "dynamic_range_sound", setting)
	end

	local sound_panning_rule = user_settings.sound_panning_rule

	if sound_panning_rule then
		local value = (sound_panning_rule == "headphones" and "PANNING_RULE_HEADPHONES") or "PANNING_RULE_SPEAKERS"

		Managers.music:set_panning_rule(value)
	end

	local sound_quality = user_settings.sound_quality

	if sound_quality then
		SoundQualitySettings.set_sound_quality(self.wwise_world, sound_quality)
	end

	local fov = render_settings.fov

	if fov then
		local base_fov = CameraSettings.first_person._node.vertical_fov
		local fov_multiplier = fov/base_fov
		local camera_manager = Managers.state.camera

		if camera_manager then
			camera_manager.set_fov_multiplier(camera_manager, fov_multiplier)
		end
	end

	local enabled_crosshairs = user_settings.enabled_crosshairs

	if enabled_crosshairs and self.ingame_ui and self.ingame_ui.ingame_hud and self.ingame_ui.ingame_hud.crosshair then
		self.ingame_ui.ingame_hud.crosshair:set_enabled_crosshair_styles(enabled_crosshairs)
	end

	local player_input_service = self.input_manager:get_service("Player")
	local mouse_look_sensitivity = user_settings.mouse_look_sensitivity

	if mouse_look_sensitivity then
		local platform_key = "win32"
		local base_filter = InputUtils.get_platform_filters(PlayerControllerFilters, platform_key)
		local base_look_multiplier = base_filter.look.multiplier
		local input_filters = player_input_service.get_active_filters(player_input_service, platform_key)
		local look_filter = input_filters.look
		local function_data = look_filter.function_data
		function_data.multiplier = base_look_multiplier*0.85^(-mouse_look_sensitivity)
	end

	local mouse_look_invert_y = user_settings.mouse_look_invert_y

	if mouse_look_invert_y ~= nil then
		local platform_key = "win32"
		local input_filters = player_input_service.get_active_filters(player_input_service, platform_key)
		local look_filter = input_filters.look
		local function_data = look_filter.function_data
		function_data.filter_type = (mouse_look_invert_y and "scale_vector3") or "scale_vector3_invert_y"
	end

	local gamepad_look_sensitivity = user_settings.gamepad_look_sensitivity

	if gamepad_look_sensitivity then
		local platform_key = (self.platform == "win32" and "xb1") or self.platform
		local base_filter = InputUtils.get_platform_filters(PlayerControllerFilters, platform_key)
		local base_look_multiplier = base_filter.look_controller.multiplier_x
		local base_melee_look_multiplier = base_filter.look_controller_melee.multiplier_x
		local base_ranged_look_multiplier = base_filter.look_controller_ranged.multiplier_x
		local input_filters = player_input_service.get_active_filters(player_input_service, platform_key)
		local look_filter = input_filters.look_controller
		local function_data = look_filter.function_data
		function_data.multiplier_x = base_look_multiplier*0.85^(-gamepad_look_sensitivity)
		function_data.min_multiplier_x = (base_filter.look_controller.multiplier_min_x and base_filter.look_controller.multiplier_min_x*0.85^(-gamepad_look_sensitivity)) or function_data.multiplier_x*0.25
		local melee_look_filter = input_filters.look_controller_melee
		local function_data = melee_look_filter.function_data
		function_data.multiplier_x = base_melee_look_multiplier*0.85^(-gamepad_look_sensitivity)
		function_data.min_multiplier_x = (base_filter.look_controller_melee.multiplier_min_x and base_filter.look_controller_melee.multiplier_min_x*0.85^(-gamepad_look_sensitivity)) or function_data.multiplier_x*0.25
		local ranged_look_filter = input_filters.look_controller_ranged
		local function_data = ranged_look_filter.function_data
		function_data.multiplier_x = base_ranged_look_multiplier*0.85^(-gamepad_look_sensitivity)
		function_data.min_multiplier_x = (base_filter.look_controller_ranged.multiplier_min_x and base_filter.look_controller_ranged.multiplier_min_x*0.85^(-gamepad_look_sensitivity)) or function_data.multiplier_x*0.25
	end

	local gamepad_look_sensitivity_y = user_settings.gamepad_look_sensitivity_y

	if gamepad_look_sensitivity_y then
		local platform_key = (self.platform == "win32" and "xb1") or self.platform
		local base_filter = InputUtils.get_platform_filters(PlayerControllerFilters, platform_key)
		local base_look_multiplier = base_filter.look_controller.multiplier_y
		local base_melee_look_multiplier = base_filter.look_controller.multiplier_y
		local base_ranged_look_multiplier = base_filter.look_controller.multiplier_y
		local input_filters = player_input_service.get_active_filters(player_input_service, platform_key)
		local look_filter = input_filters.look_controller
		local function_data = look_filter.function_data
		function_data.multiplier_y = base_look_multiplier*0.85^(-gamepad_look_sensitivity_y)
		local melee_look_filter = input_filters.look_controller_melee
		local function_data = melee_look_filter.function_data
		function_data.multiplier_y = base_melee_look_multiplier*0.85^(-gamepad_look_sensitivity_y)
		local ranged_look_filter = input_filters.look_controller_ranged
		local function_data = ranged_look_filter.function_data
		function_data.multiplier_y = base_ranged_look_multiplier*0.85^(-gamepad_look_sensitivity_y)
	end

	local gamepad_zoom_sensitivity = user_settings.gamepad_zoom_sensitivity

	if gamepad_zoom_sensitivity then
		local platform_key = (self.platform == "win32" and "xb1") or self.platform
		local base_filter = InputUtils.get_platform_filters(PlayerControllerFilters, platform_key)
		local base_look_multiplier = base_filter.look_controller_zoom.multiplier_x
		local input_filters = player_input_service.get_active_filters(player_input_service, platform_key)
		local look_filter = input_filters.look_controller_zoom
		local function_data = look_filter.function_data
		function_data.multiplier_x = base_look_multiplier*0.85^(-gamepad_zoom_sensitivity)
		function_data.min_multiplier_x = (base_filter.look_controller_zoom.multiplier_min_x and base_filter.look_controller_zoom.multiplier_min_x*0.85^(-gamepad_zoom_sensitivity)) or function_data.multiplier_x*0.25
	end

	local gamepad_zoom_sensitivity_y = user_settings.gamepad_zoom_sensitivity_y

	if gamepad_zoom_sensitivity_y then
		local platform_key = (self.platform == "win32" and "xb1") or self.platform
		local base_filter = InputUtils.get_platform_filters(PlayerControllerFilters, platform_key)
		local base_look_multiplier = base_filter.look_controller_zoom.multiplier_y
		local input_filters = player_input_service.get_active_filters(player_input_service, platform_key)
		local look_filter = input_filters.look_controller_zoom
		local function_data = look_filter.function_data
		function_data.multiplier_y = base_look_multiplier*0.85^(-gamepad_zoom_sensitivity_y)
	end

	local gamepad_look_invert_y = user_settings.gamepad_look_invert_y

	if gamepad_look_invert_y ~= nil then
		local platform_key = (self.platform == "win32" and "xb1") or self.platform
		local input_filters = player_input_service.get_active_filters(player_input_service, platform_key)
		local look_filter = input_filters.look_controller
		local function_data = look_filter.function_data
		function_data.filter_type = (gamepad_look_invert_y and "scale_vector3_xy_accelerated_x_inverted") or "scale_vector3_xy_accelerated_x"
		local look_filter = input_filters.look_controller_melee
		local function_data = look_filter.function_data
		function_data.filter_type = (gamepad_look_invert_y and "scale_vector3_xy_accelerated_x_inverted") or "scale_vector3_xy_accelerated_x"
		local look_filter = input_filters.look_controller_ranged
		local function_data = look_filter.function_data
		function_data.filter_type = (gamepad_look_invert_y and "scale_vector3_xy_accelerated_x_inverted") or "scale_vector3_xy_accelerated_x"
		local look_filter = input_filters.look_controller_zoom
		local function_data = look_filter.function_data
		function_data.filter_type = (gamepad_look_invert_y and "scale_vector3_xy_accelerated_x_inverted") or "scale_vector3_xy_accelerated_x"
	end

	local gamepad_use_ps4_style_input_icons = user_settings.gamepad_use_ps4_style_input_icons

	if gamepad_use_ps4_style_input_icons ~= nil then
		UISettings.use_ps4_input_icons = gamepad_use_ps4_style_input_icons
	end

	local changed_gamepad_layout = user_settings.gamepad_layout ~= nil
	local changed_gamepad_left_handed = user_settings.gamepad_left_handed ~= nil

	if changed_gamepad_layout or changed_gamepad_left_handed then
		local default_value = DefaultUserSettings.get("user_settings", "gamepad_layout") or "default"
		local gamepad_layout = assigned(user_settings.gamepad_layout, Application.user_setting("gamepad_layout")) or default_value

		if gamepad_layout then
			local using_left_handed_option = assigned(user_settings.gamepad_left_handed, Application.user_setting("gamepad_left_handed"))
			local gamepad_keymaps_layout = nil

			if using_left_handed_option then
				gamepad_keymaps_layout = AlternatateGamepadKeymapsLayoutsLeftHanded
			else
				gamepad_keymaps_layout = AlternatateGamepadKeymapsLayouts
			end

			local gamepad_keymaps = gamepad_keymaps_layout[gamepad_layout]

			self.apply_gamepad_changes(self, gamepad_keymaps, using_left_handed_option)
		end
	end

	local animation_lod_distance_multiplier = user_settings.animation_lod_distance_multiplier

	if animation_lod_distance_multiplier then
		GameSettingsDevelopment.bone_lod_husks.lod_multiplier = animation_lod_distance_multiplier
	end

	local player_outlines = user_settings.player_outlines

	if player_outlines then
		local players = Managers.player:players()

		for _, player in pairs(players) do
			local player_unit = player.player_unit

			if not player.local_player and Unit.alive(player_unit) then
				local outline_extension = ScriptUnit.extension(player_unit, "outline_system")

				outline_extension.update_override_method_player_setting()
			end
		end
	end

	local toggle_crouch = user_settings.toggle_crouch

	if toggle_crouch ~= nil then
		local units = (Managers.state.entity and Managers.state.entity:get_entities("PlayerInputExtension")) or {}

		for unit, extension in pairs(units) do
			local player = Managers.player:owner(unit)

			if player.local_player and not player.bot_player then
				local input_extension = ScriptUnit.extension(unit, "input_system")
				input_extension.toggle_crouch = toggle_crouch
			end
		end
	end

	local double_tap_dodge = user_settings.double_tap_dodge

	if double_tap_dodge ~= nil then
		local units = Managers.state.entity:get_entities("PlayerInputExtension")

		for unit, extension in pairs(units) do
			local player = Managers.player:owner(unit)

			if player.local_player and not player.bot_player then
				local input_extension = ScriptUnit.extension(unit, "input_system")
				input_extension.double_tap_dodge = double_tap_dodge
			end
		end
	end

	local toggle_alternate_attack = user_settings.toggle_alternate_attack

	if toggle_alternate_attack ~= nil then
		local units = Managers.state.entity:get_entities("PlayerInputExtension")

		for unit, extension in pairs(units) do
			local player = Managers.player:owner(unit)

			if player.local_player and not player.bot_player then
				local input_extension = ScriptUnit.extension(unit, "input_system")
				input_extension.toggle_alternate_attack = toggle_alternate_attack
			end
		end
	end

	local overcharge_opacity = user_settings.overcharge_opacity
	local player_manager = Managers.player

	if overcharge_opacity and player_manager then
		local local_player = player_manager.local_player(player_manager)
		local player_unit = local_player.player_unit
		local overcharge_extension = ScriptUnit.extension(player_unit, "overcharge_system")

		overcharge_extension.set_screen_particle_opacity_modifier(overcharge_extension, overcharge_opacity)
	end

	local chat_enabled = user_settings.chat_enabled
	local chat_manager = Managers.chat

	if chat_enabled ~= nil and chat_manager then
		chat_manager.set_chat_enabled(chat_manager, chat_enabled)
	end

	local chat_font_size = user_settings.chat_font_size
	local chat_manager = Managers.chat

	if chat_font_size and chat_manager then
		chat_manager.set_font_size(chat_manager, chat_font_size)
	end

	local language_id = user_settings.language_id

	if language_id then
		self.reload_language(self, language_id)
	end

	local ui_scale = user_settings.ui_scale

	if ui_scale ~= nil then
		UISettings.ui_scale = ui_scale
		local force_update = true

		UPDATE_RESOLUTION_LOOKUP(force_update)
		self._setup_text_buttons_width(self)
		self.setup_scrollbar(self, self.selected_settings_list, self.scroll_value)
	end

	if rawget(_G, "Tobii") then
		local tobii_extended_view_sensitivity = user_settings.tobii_extended_view_sensitivity

		if tobii_extended_view_sensitivity ~= nil then
			Tobii.set_extended_view_responsiveness(tobii_extended_view_sensitivity/100)
		end

		local tobii_extended_view_use_head_tracking = user_settings.tobii_extended_view_use_head_tracking

		if tobii_extended_view_use_head_tracking ~= nil then
			Tobii.set_extended_view_use_head_tracking(tobii_extended_view_use_head_tracking)
		end
	end

	if PLATFORM == "win32" then
		Application.save_user_settings()
	else
		Managers.save:auto_save(SaveFileName, SaveData, callback(self, "cb_save_done"))
	end

	if needs_reload then
		Application.apply_user_settings()
		Renderer.bake_static_shadows()
	end

	ShowCursorStack.update_clip_cursor()

	return 
end
OptionsView.apply_keymap_changes = function (self, keymaps_data, save_keymaps)
	if not PlayerData.controls then
		PlayerData.controls = {}
	end

	local saved_controls = save_keymaps and PlayerData.controls

	for keybinding_table_name, keybinding_table in pairs(keymaps_data) do
		for keybindings_table_key, keybindings in pairs(keybinding_table) do
			for action, keybind in pairs(keybindings) do
				if save_keymaps then
					if not saved_controls[keybinding_table_name] then
						saved_controls[keybinding_table_name] = {}
					end

					local saved_keybinding_data = saved_controls[keybinding_table_name]

					if not saved_keybinding_data[keybindings_table_key] then
						saved_keybinding_data[keybindings_table_key] = {}
					end

					local saved_keybindings = saved_keybinding_data[keybindings_table_key]
					local changed = keybind.changed

					if changed then
						saved_keybindings[action] = table.clone(keybind)
					else
						saved_keybindings[action] = nil
					end
				end

				self._apply_keybinding_changes(self, keybinding_table_name, keybindings_table_key, action, keybind)
			end
		end
	end

	if save_keymaps then
		if PLATFORM == "win32" then
			Managers.save:auto_save(SaveFileName, SaveData)
		else
			Managers.save:auto_save(SaveFileName, SaveData, callback(self, "cb_save_done"))
		end
	end

	Managers.state.event:trigger("input_changed")

	return 
end
OptionsView._apply_keybinding_changes = function (self, keybinding_table_name, keybinding_table_key, action, keybind)
	local input_manager = Managers.input

	if 3 <= #keybind then
		local device = keybind[1]
		local button_name = keybind[2]
		local input_type = keybind[3]
		local button_index = nil

		if device == "gamepad" then
			if input_type == "axis" then
				button_index = Pad1.axis_index(button_name)
			else
				button_index = Pad1.button_index(button_name)
			end
		elseif device == "keyboard" then
			button_index = Keyboard.button_index(button_name)
		elseif device == "mouse" then
			if input_type == "axis" then
				button_index = Mouse.axis_index(button_name)
			else
				button_index = Mouse.button_index(button_name)
			end
		else
			assert(device, "[OptionsView] - Trying to keybind unrecognized device for action %s in keybinds %s, %s", action, keybinding_table_name, keybinding_table_key)
		end

		if button_index then
			input_manager.change_keybinding(input_manager, keybinding_table_name, keybinding_table_key, action, button_index, device)
		else
			input_manager.clear_keybinding(input_manager, keybinding_table_name, keybinding_table_key, action)
		end
	else
		input_manager.clear_keybinding(input_manager, keybinding_table_name, keybinding_table_key, action)
	end

	return 
end
OptionsView.cb_save_done = function (self, result)
	Managers.transition:hide_loading_icon()

	self.disable_all_input = false

	return 
end
OptionsView.apply_gamepad_changes = function (self, keymaps, using_left_handed_option)
	local save_keymaps = false

	self.apply_keymap_changes(self, keymaps, save_keymaps)
	self.update_gamepad_layout_widget(self, keymaps, using_left_handed_option)

	return 
end
OptionsView.has_popup = function (self)
	return self.exit_popup_id or self.title_popup_id or self.apply_popup_id
end
OPTIONS_VIEW_PRINT_ORIGINAL_VALUES = false
local HAS_TOBII = rawget(_G, "Tobii")
OptionsView.update = function (self, dt)
	if self.suspended then
		return 
	end

	local disable_all_input = self.disable_all_input
	local reload_options = RELOAD_OPTIONS_VIEW

	if HAS_TOBII then
		local tobii_is_connected = Tobii.get_is_connected()

		if self._tobii_is_connected ~= tobii_is_connected then
			self._tobii_is_connected = tobii_is_connected
			reload_options = true
		end
	end

	if reload_options then
		local selected_title = self.selected_title

		self.create_ui_elements(self)

		if selected_title then
			self.select_settings_title(self, selected_title)
		end
	end

	local transitioning = self.transitioning(self)

	for name, ui_animation in pairs(self.ui_animations) do
		UIAnimation.update(ui_animation, dt)

		if UIAnimation.completed(ui_animation) then
			self.ui_animations[name] = nil
		end
	end

	if not self.active then
		return 
	end

	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_manager = self.input_manager
	local input_service = input_manager.get_service(input_manager, "options_menu")
	local gamepad_active = input_manager.is_device_active(input_manager, "gamepad")
	local selected_widget = self.selected_widget

	self.update_apply_button(self)

	if gamepad_active and not self.has_popup(self) and not transitioning and not disable_all_input then
		self.handle_controller_navigation_input(self, dt, input_service)
	end

	if not transitioning then
		self.update_mouse_scroll_input(self, disable_all_input)

		local allow_gamepad_input = gamepad_active and not self.draw_gamepad_tooltip and not disable_all_input

		self.handle_apply_button(self, input_service, allow_gamepad_input)

		if self.selected_settings_list then
			self.handle_reset_to_default_button(self, input_service, allow_gamepad_input)
		end
	end

	self.draw_widgets(self, dt, disable_all_input)

	if self.save_data_error_popup_id then
		local result = Managers.popup:query_result(self.save_data_error_popup_id)

		if result then
			if result == "delete" then
				Managers.save:delete_save(SaveFileName, callback(self, "cb_delete_save"))

				self.disable_all_input = true
			end

			Managers.popup:cancel_popup(self.save_data_error_popup_id)

			self.save_data_error_popup_id = nil
		end
	end

	if self.title_popup_id then
		local result = Managers.popup:query_result(self.title_popup_id)

		if result then
			Managers.popup:cancel_popup(self.title_popup_id)

			self.title_popup_id = nil

			self.handle_title_buttons_popup_results(self, result)
		end
	end

	if self.apply_popup_id then
		local result = Managers.popup:query_result(self.apply_popup_id)

		if result then
			Managers.popup:cancel_popup(self.apply_popup_id)

			self.apply_popup_id = nil

			self.handle_apply_popup_results(self, result)
		end
	end

	if self.exit_popup_id then
		local result = Managers.popup:query_result(self.exit_popup_id)

		if result then
			Managers.popup:cancel_popup(self.exit_popup_id)

			self.exit_popup_id = nil

			self.handle_exit_button_popup_results(self, result)
		end
	end

	if OPTIONS_VIEW_PRINT_ORIGINAL_VALUES then
		print("------------------------")
		print("ORIGINAL USER SETTINGS")

		local original_user_settings = self.original_user_settings

		for setting, value in pairs(original_user_settings) do
			printf("  - %s  %s", setting, tostring(value))
		end

		print("ORIGINAL RENDER SETTINGS")

		local original_render_settings = self.original_render_settings

		for setting, value in pairs(original_render_settings) do
			printf("  - %s  %s", setting, tostring(value))
		end

		print("/-----------------------")

		OPTIONS_VIEW_PRINT_ORIGINAL_VALUES = false
	end

	if not transitioning then
		local exit_button_hotspot = self.exit_button.content.button_hotspot

		if exit_button_hotspot.on_hover_enter then
			WwiseWorld.trigger_event(self.wwise_world, "Play_hud_hover")
		end

		if not disable_all_input and not self.has_popup(self) and not self.draw_gamepad_tooltip and ((not selected_widget and input_service.get(input_service, "toggle_menu")) or (exit_button_hotspot.is_hover and exit_button_hotspot.on_release)) then
			WwiseWorld.trigger_event(self.wwise_world, "Play_hud_select")
			self.on_exit_pressed(self)
		end
	end

	return 
end
OptionsView.cb_delete_save = function (self, result)
	if result.error then
		Application.warning(string.format("[StateTitleScreenLoadSave] Error when overriding save data %q", result.error))
	end

	self.disable_all_input = false

	return 
end
OptionsView.on_gamepad_activated = function (self)
	local title_buttons = self.title_buttons
	local title_buttons_n = self.title_buttons_n

	for i = 1, title_buttons_n, 1 do
		local widget = title_buttons[i]
		widget.content.disable_side_textures = true
	end

	return 
end
OptionsView.on_gamepad_deactivated = function (self)
	local title_buttons = self.title_buttons
	local title_buttons_n = self.title_buttons_n

	for i = 1, title_buttons_n, 1 do
		local widget = title_buttons[i]
		widget.content.disable_side_textures = false
	end

	return 
end
OptionsView.on_exit_pressed = function (self)
	if self.changes_been_made(self) then
		local text = Localize("unapplied_changes_popup_text")
		self.exit_popup_id = Managers.popup:queue_popup(text, Localize("popup_discard_changes_topic"), "revert_changes", Localize("popup_choice_discard"), "cancel", Localize("popup_choice_cancel"))
	else
		self.exit(self)
	end

	return 
end
local needs_restart_settings = settings_definitions.needs_restart_settings
OptionsView.handle_apply_popup_results = function (self, result)
	if result == "keep_changes" then
		local needs_restart = false

		for setting, value in pairs(self.changed_user_settings) do
			if table.contains(needs_restart_settings, setting) then
				needs_restart = true

				break
			end
		end

		for setting, value in pairs(self.changed_render_settings) do
			if table.contains(needs_restart_settings, setting) then
				needs_restart = true

				break
			end
		end

		if needs_restart then
			local text = Localize("changes_need_restart_popup_text")
			self.apply_popup_id = Managers.popup:queue_popup(text, Localize("popup_needs_restart_topic"), "continue", Localize("popup_choice_continue"), "restart", Localize("popup_choice_restart_now"))
		elseif self.delayed_title_change then
			self.select_settings_title(self, self.delayed_title_change)

			self.delayed_title_change = nil
		end

		self.set_original_settings(self)
		self.reset_changed_settings(self)
	elseif result == "revert_changes" then
		if self.changed_keymaps then
			self.apply_keymap_changes(self, self.original_keymaps, true)
		else
			self.apply_changes(self, self.original_user_settings, self.original_render_settings)
		end

		if self.delayed_title_change then
			self.select_settings_title(self, self.delayed_title_change)

			self.delayed_title_change = nil
		else
			self.set_original_settings(self)
			self.reset_changed_settings(self)
			self.set_widget_values(self, self.selected_settings_list)
		end
	elseif result == "restart" then
		self.restart(self)
	elseif result == "continue" then
		if self.delayed_title_change then
			self.select_settings_title(self, self.delayed_title_change)

			self.delayed_title_change = nil
		end
	else
		print(result)
	end

	return 
end
OptionsView.restart = function (self)
	self.level_transition_handler:set_next_level("inn_level")
	self.ingame_ui:handle_transition("restart_game")

	return 
end
OptionsView.handle_title_buttons_popup_results = function (self, result)
	if result == "revert_changes" then
		if self.changed_keymaps then
			self.apply_keymap_changes(self, self.original_keymaps, true)
		else
			self.apply_changes(self, self.original_user_settings, self.original_render_settings)
		end

		self.reset_changed_settings(self)

		if self.delayed_title_change then
			self.select_settings_title(self, self.delayed_title_change)

			self.delayed_title_change = nil
		else
			self.set_original_settings(self)
			self.set_widget_values(self, self.selected_settings_list)
		end
	elseif result == "apply_changes" then
		self.handle_apply_changes(self)
	else
		print(result)
	end

	return 
end
OptionsView.handle_exit_button_popup_results = function (self, result)
	if result == "revert_changes" then
		if self.changed_keymaps then
			self.apply_keymap_changes(self, self.original_keymaps, true)
		else
			self.apply_changes(self, self.original_user_settings, self.original_render_settings)
		end

		self.set_original_settings(self)
		self.reset_changed_settings(self)
		self.exit(self)
	elseif result == "cancel" then
	else
		print(result)
	end

	return 
end
OptionsView.update_apply_button = function (self)

	-- decompilation error in this vicinity
	local widget = self.apply_button

	if self.changes_been_made(self) then
		widget.content.button_text.disabled = false
	else
		widget.content.button_text.disabled = true
	end

	return 
end
OptionsView.handle_apply_changes = function (self)
	if PLATFORM == "win32" then
		self._handle_apply_changes(self)
	else
		Managers.transition:show_loading_icon()

		self.disable_all_input = true

		Managers.save:auto_load(SaveFileName, callback(self, "cb_load_done"))
	end

	return 
end
OptionsView.cb_load_done = function (self, result)
	if result.error and result.error ~= "NOT_FOUND" then
		self.save_data_error_popup_id = Managers.popup:queue_popup(Localize("ps4_save_error_broken"), Localize("popup_error_topic"), "delete", Localize("button_delete_save"), "back_to_title", Localize("button_back_to_title"))

		Managers.transition:hide_loading_icon()

		self.disable_all_input = false
	else
		self._handle_apply_changes(self)
	end

	return 
end
OptionsView._handle_apply_changes = function (self)
	if self.changed_keymaps then
		self.apply_keymap_changes(self, self.session_keymaps, true)
	else
		self.apply_changes(self, self.changed_user_settings, self.changed_render_settings)
	end

	if self.selected_settings_list.needs_apply_confirmation then
		local text = Localize("keep_changes_popup_text")
		self.apply_popup_id = Managers.popup:queue_popup(text, Localize("popup_keep_changes_topic"), "keep_changes", Localize("popup_choice_keep"), "revert_changes", Localize("popup_choice_revert"))

		Managers.popup:activate_timer(self.apply_popup_id, 15, "revert_changes")
	else
		self.handle_apply_popup_results(self, "keep_changes")

		if self.delayed_title_change then
			self.select_settings_title(self, self.delayed_title_change)

			self.delayed_title_change = nil
		end
	end

	return 
end
OptionsView.handle_apply_button = function (self, input_service, allow_gamepad_input)
	if self.apply_button.content.button_text.disabled then
		return 
	end

	local apply_button_hotspot = self.apply_button.content.button_text

	if apply_button_hotspot.on_hover_enter then
		WwiseWorld.trigger_event(self.wwise_world, "Play_hud_hover")
	end

	if (apply_button_hotspot.is_hover and apply_button_hotspot.on_release) or (allow_gamepad_input and input_service.get(input_service, "refresh")) then
		WwiseWorld.trigger_event(self.wwise_world, "Play_hud_select")

		if self.apply_popup_id then
			local gamepad_active = self.input_manager:is_device_active("gamepad")
			local changes_been_made = self.changes_been_made(self)
			local num_popups = Managers.popup._handler.n_popups

			table.dump(Managers.popup._handler.popups, "popups", 2)

			local blocked_input_services = {}

			self.input_manager:get_blocked_services(nil, nil, blocked_input_services)
			table.dump(blocked_input_services, "blocked_input_services", 2)
			ScriptApplication.send_to_crashify("OptionsView", "Apply button wasn't disabled, even though we had an apply popup...")
		else
			self.handle_apply_changes(self)
		end
	end

	return 
end
OptionsView.reset_to_default_drop_down = function (self, widget)
	local content = widget.content
	local default_value = content.default_value
	content.current_selection = default_value
	content.selected_option = content.options_texts[default_value]

	content.callback(content, default_value)

	return 
end
OptionsView.reset_to_default_slider = function (self, widget)
	local content = widget.content
	local default_value = content.default_value
	content.value = default_value
	content.internal_value = get_slider_value(content.min, content.max, default_value)

	content.callback(content)

	return 
end
OptionsView.reset_to_default_checkbox = function (self, widget)
	local content = widget.content
	local default_value = content.default_value
	content.flag = default_value

	content.callback(content)

	return 
end
OptionsView.reset_to_default_stepper = function (self, widget)
	local content = widget.content
	local default_value = content.default_value
	content.current_selection = default_value

	content.callback(content)

	return 
end
OptionsView.reset_to_default_option = function (self, widget)
	local content = widget.content
	local default_value = content.default_value
	content.current_selection = default_value

	content.callback(content)

	return 
end
OptionsView.reset_to_default_keybind = function (self, widget)
	local content = widget.content
	local default_value = content.default_value

	content.callback(default_value.key, default_value.controller, content)

	return 
end
OptionsView.reset_current_settings_list_to_default = function (self)
	local selected_settings_list = self.selected_settings_list
	local widgets = selected_settings_list.widgets
	local widgets_n = selected_settings_list.widgets_n

	for i = 1, widgets_n, 1 do
		local widget = widgets[i]

		if widget.content.default_value then
			local widget_type = widget.type

			if widget_type == "drop_down" then
				self.reset_to_default_drop_down(self, widget)
			elseif widget_type == "slider" then
				self.reset_to_default_slider(self, widget)
			elseif widget_type == "checkbox" then
				self.reset_to_default_checkbox(self, widget)
			elseif widget_type == "stepper" then
				self.reset_to_default_stepper(self, widget)
			elseif widget_type == "option" then
				self.reset_to_default_option(self, widget)
			elseif widget_type == "keybind" then
				self.reset_to_default_keybind(self, widget)
			else
				error("Not supported widget type..")
			end
		end
	end

	return 
end
OptionsView.handle_reset_to_default_button = function (self, input_service, allow_gamepad_input)
	local reset_to_default_content = self.reset_to_default.content

	if reset_to_default_content.button_text.disabled or reset_to_default_content.hidden then
		return 
	end

	local reset_to_default_hotspot = self.reset_to_default.content.button_text

	if reset_to_default_hotspot.on_hover_enter then
		WwiseWorld.trigger_event(self.wwise_world, "Play_hud_hover")
	end

	if reset_to_default_hotspot.on_release or (allow_gamepad_input and input_service.get(input_service, "special_1")) then
		WwiseWorld.trigger_event(self.wwise_world, "Play_hud_select")
		self.reset_current_settings_list_to_default(self)
	end

	return 
end
OptionsView.draw_widgets = function (self, dt, disable_all_input)
	local ui_renderer = self.ui_renderer
	local ui_top_renderer = self.ui_top_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_manager = self.input_manager
	local input_service = input_manager.get_service(input_manager, "options_menu")
	local gamepad_active = input_manager.is_device_active(input_manager, "gamepad")
	local draw_gamepad_tooltip = self.draw_gamepad_tooltip

	UIRenderer.begin_pass(ui_top_renderer, ui_scenegraph, input_service, dt, nil, self.render_settings)

	local background_widgets = self.background_widgets
	local background_widgets_n = self.background_widgets_n

	for i = 1, background_widgets_n, 1 do
		UIRenderer.draw_widget(ui_top_renderer, background_widgets[i])
	end

	if self.selected_settings_list and not draw_gamepad_tooltip then
		self.update_settings_list(self, self.selected_settings_list, ui_top_renderer, ui_scenegraph, input_service, dt, disable_all_input)
	end

	self.handle_title_buttons(self, ui_top_renderer, disable_all_input)

	self.reset_to_default.content.button_text.disable_button = disable_all_input
	self.apply_button.content.button_text.disable_button = disable_all_input
	self.exit_button.content.button_hotspot.disable_button = disable_all_input

	if not gamepad_active then
		if not self.reset_to_default.content.hidden then
			UIRenderer.draw_widget(ui_top_renderer, self.reset_to_default)
		end

		UIRenderer.draw_widget(ui_top_renderer, self.apply_button)
		UIRenderer.draw_widget(ui_top_renderer, self.exit_button)
	else
		if draw_gamepad_tooltip then
			UIRenderer.draw_widget(ui_top_renderer, self.gamepad_tooltip_text_widget)
		end

		UIRenderer.draw_widget(ui_top_renderer, self._console_cursor)
	end

	UIRenderer.end_pass(ui_top_renderer)

	local selected_title_name = SettingsMenuNavigation[self.selected_title]

	if selected_title_name == "calibrate_ui" then
		self.ui_calibration_view:update(self.ui_top_renderer, input_service, dt)
	end

	if gamepad_active then
		local popup_active = self.save_data_error_popup_id or self.exit_popup_id or self.title_popup_id or self.apply_popup_id

		if not popup_active and not self.disable_all_input then
			self.menu_input_description:draw(ui_top_renderer, dt)
		end
	end

	return 
end
local temp_pos_table = {
	x = 0,
	y = 0
}
OptionsView.update_settings_list = function (self, settings_list, ui_renderer, ui_scenegraph, input_service, dt, disable_all_input)
	if settings_list.scrollbar then
		local scrollbar = self.scrollbar
		local content = scrollbar.content
		content.button_up_hotspot.disable_button = disable_all_input
		content.button_down_hotspot.disable_button = disable_all_input
		content.scroll_bar_info.disable_button = disable_all_input

		UIRenderer.draw_widget(ui_renderer, self.scrollbar)
		self.update_scrollbar(self, settings_list, ui_scenegraph)
	end

	local scenegraph_id_start = settings_list.scenegraph_id_start
	local list_position = UISceneGraph.get_world_position(ui_scenegraph, scenegraph_id_start)
	local mask_pos = Vector3.deprecated_copy(UISceneGraph.get_world_position(ui_scenegraph, "list_mask"))
	local mask_size = UISceneGraph.get_size(ui_scenegraph, "list_mask")
	local selected_widget = self.selected_widget
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local widgets = settings_list.widgets
	local widgets_n = settings_list.widgets_n
	local visible_widgets_n = 0
	local setting_has_changed = false

	for i = 1, widgets_n, 1 do
		local widget = widgets[i]
		local style = widget.style
		local widget_name = widget.name
		local size = style.size
		local offset = style.offset
		temp_pos_table.x = list_position[1] + offset[1]
		temp_pos_table.y = list_position[2] + offset[2]
		local lower_visible = math.point_is_inside_2d_box(temp_pos_table, mask_pos, mask_size)
		temp_pos_table.y = temp_pos_table.y + size[2]/2
		local middle_visible = math.point_is_inside_2d_box(temp_pos_table, mask_pos, mask_size)
		temp_pos_table.y = temp_pos_table.y + size[2]/2
		local top_visible = math.point_is_inside_2d_box(temp_pos_table, mask_pos, mask_size)
		local visible = lower_visible or top_visible
		widget.content.visible = visible

		if visible then
			visible_widgets_n = visible_widgets_n + 1
		end

		local disable_widget_input = true

		if gamepad_active then
			disable_widget_input = false
		elseif widget.content.is_highlighted then
			disable_widget_input = false
		end

		if widget.content.disabled then
			disable_widget_input = true
		end

		if not middle_visible then
			disable_widget_input = true
		end

		local content = widget.content
		local hotspot_content_ids = content.hotspot_content_ids

		if hotspot_content_ids then
			for i = 1, #hotspot_content_ids, 1 do
				content[hotspot_content_ids[i]].disable_button = disable_widget_input
			end
		end

		if content.highlight_hotspot then
			content.highlight_hotspot.disable_button = disable_all_input
		end

		local ui_animations = widget.ui_animations

		for name, animation in pairs(ui_animations) do
			UIAnimation.update(animation, dt)

			if UIAnimation.completed(animation) then
				ui_animations[name] = nil
			end
		end

		UIRenderer.draw_widget(ui_renderer, widget)

		if widget.content.is_highlighted or gamepad_active then
			self.handle_mouse_widget_input(self, widget, input_service, dt)
		end

		if content.highlight_hotspot then
			if content.highlight_hotspot.on_hover_enter then
				if setting_has_changed then
					local allow_multi_hover = content.highlight_hotspot.allow_multi_hover

					table.clear(content.highlight_hotspot)

					content.highlight_hotspot.allow_multi_hover = allow_multi_hover
				else
					widget.content.is_highlighted = true
					setting_has_changed = true

					self.select_settings_list_widget(self, i)
				end
			elseif content.highlight_hotspot.is_hover then
				setting_has_changed = true
			end
		end
	end

	settings_list.visible_widgets_n = visible_widgets_n

	return 
end
OptionsView.update_scrollbar = function (self, settings_list, ui_scenegraph)
	local scrollbar = self.scrollbar
	local value = scrollbar.content.scroll_bar_info.value
	local max_offset_y = settings_list.max_offset_y
	local offset_y = max_offset_y*value
	local scenegraph = ui_scenegraph[settings_list.scenegraph_id]
	scenegraph.offset[2] = offset_y

	return 
end
OptionsView.handle_title_buttons = function (self, ui_renderer, disable_all_input)
	local title_buttons = self.title_buttons
	local title_buttons_n = self.title_buttons_n

	for i = 1, title_buttons_n, 1 do
		local widget = title_buttons[i]
		widget.content.button_text.disable_button = disable_all_input

		UIRenderer.draw_widget(ui_renderer, widget)

		if self.selected_title ~= i then
			local on_release = false
			local button_hotspot = widget.content.button_text

			if button_hotspot and button_hotspot.on_hover_enter then
				WwiseWorld.trigger_event(self.wwise_world, "Play_hud_hover")
			end

			if button_hotspot and button_hotspot.on_release then
				WwiseWorld.trigger_event(self.wwise_world, "Play_hud_select")

				button_hotspot.is_selected = true
				on_release = true
			end

			if widget.content.controller_button_hotspot and widget.content.controller_button_hotspot.on_release then
				widget.content.controller_button_hotspot.is_selected = true
				on_release = true
			end

			if on_release then
				if self.changes_been_made(self) then
					local text = Localize("unapplied_changes_popup_text")
					self.title_popup_id = Managers.popup:queue_popup(text, Localize("popup_discard_changes_topic"), "apply_changes", Localize("menu_settings_apply"), "revert_changes", Localize("popup_choice_discard"))
					self.delayed_title_change = i
				else
					self.select_settings_title(self, i)

					self.in_settings_sub_menu = true
				end
			end
		end
	end

	return 
end
OptionsView.set_widget_values = function (self, settings_list)
	local widgets = settings_list.widgets
	local widgets_n = settings_list.widgets_n

	for i = 1, widgets_n, 1 do
		local widget = widgets[i]
		local saved_value_cb = widget.content.saved_value_cb

		saved_value_cb(widget)
	end

	return 
end
OptionsView.select_settings_list_widget = function (self, i)
	local selected_settings_list = self.selected_settings_list

	if not selected_settings_list then
		return 
	end

	local selected_list_index = selected_settings_list.selected_index
	local list_widgets = selected_settings_list.widgets

	if selected_list_index then
		local deselect_widget = list_widgets[selected_list_index]

		self.deselect_settings_list_widget(self, deselect_widget)
	else
		self.gamepad_active_generic_actions_name = nil

		self.change_gamepad_generic_input_action(self)
	end

	local widget = list_widgets[i]
	widget.content.is_highlighted = true
	selected_settings_list.selected_index = i
	self.gamepad_tooltip_text_widget.content.text = widget.content.tooltip_text
	self.gamepad_tooltip_available = widget.content.tooltip_text ~= nil
	self.in_settings_sub_menu = true
	local widget_type = widget.type
	local widget_type_template = SettingsWidgetTypeTemplate[widget_type]
	local widget_input_description = widget_type_template.input_description

	if widget.content.disabled then
		self.menu_input_description:set_input_description(nil)
	else
		self.menu_input_description:set_input_description(widget_input_description)
	end

	return 
end
OptionsView.deselect_settings_list_widget = function (self, widget)
	widget.content.is_highlighted = false

	if widget.content.highlight_hotspot then
		local allow_multi_hover = widget.content.highlight_hotspot.allow_multi_hover

		table.clear(widget.content.highlight_hotspot)

		widget.content.highlight_hotspot.allow_multi_hover = allow_multi_hover
	end

	self.menu_input_description:set_input_description(nil)

	return 
end
OptionsView.settings_list_widget_enter = function (self, i)
	local selected_settings_list = self.selected_settings_list

	if not selected_settings_list then
		return 
	end

	local list_widgets = selected_settings_list.widgets
	local widget = list_widgets[i]
	widget.content.is_active = true

	return 
end
OptionsView.select_settings_title = function (self, i)
	self.menu_input_description:set_input_description(nil)

	if self.selected_title then
		self.deselect_title(self, self.selected_title)
	end

	local title_buttons = self.title_buttons
	local widget = title_buttons[i]
	local widget_scenegraph_id = widget.scenegraph_id
	local widget_current_position = self.ui_scenegraph[widget_scenegraph_id].local_position
	widget.content.button_text.is_selected = true
	self.selected_title = i
	local settings_list_name = SettingsMenuNavigation[i]

	fassert(self.settings_lists[settings_list_name], "No settings list called %q", settings_list_name)

	local settings_list = self.settings_lists[settings_list_name]

	if settings_list.scrollbar then
		self.setup_scrollbar(self, settings_list)
	end

	if settings_list.hide_reset then
		self.reset_to_default.content.hidden = true
	else
		self.reset_to_default.content.hidden = false
	end

	if settings_list_name == "calibrate_ui" then
		self.disable_all_input = true
	else
		self.disable_all_input = false
	end

	if settings_list.on_enter then
		settings_list.on_enter(settings_list)
	end

	self.set_widget_values(self, settings_list)

	self.selected_settings_list = settings_list

	return 
end
OptionsView.deselect_title = function (self, i)
	local settings_list_name = SettingsMenuNavigation[i]
	local settings_list = self.settings_lists and self.settings_lists[settings_list_name]

	if settings_list and settings_list.on_exit then
		settings_list.on_exit()
	end

	self.selected_title = nil
	local selected_settings_list = self.selected_settings_list
	local selected_list_index = selected_settings_list.selected_index
	local list_widgets = selected_settings_list.widgets

	if selected_list_index then
		local deselect_widget = list_widgets[selected_list_index]

		self.deselect_settings_list_widget(self, deselect_widget)
	end

	self.selected_settings_list.selected_index = nil
	self.selected_settings_list = nil
	local widget = self.title_buttons[i]
	local button_hotspot = widget.content.button_text
	button_hotspot.is_selected = false

	return 
end
OptionsView.handle_dropdown_lists = function (self, dropdown_lists, dropdown_lists_n)
	for i = 1, dropdown_lists_n, 1 do
		local ddl = dropdown_lists[i]
		local ddl_content = ddl.content
		local list_content = content.list_content

		for i = 1, #list_content, 1 do
			local content = list_content[i]

			if content.selected then
				ddl_content.callback(ddl_content.options, i)

				break
			end
		end
	end

	return 
end
OptionsView.setup_scrollbar = function (self, settings_list, optional_value)
	local scrollbar = self.scrollbar
	local scenegraph_id = settings_list.scenegraph_id
	local settings_list_size_y = self.ui_scenegraph[scenegraph_id].size[2]
	local mask_size_y = self.ui_scenegraph.list_mask.size[2]
	local percentage = mask_size_y/settings_list_size_y
	scrollbar.content.scroll_bar_info.bar_height_percentage = percentage

	self.set_scrollbar_value(self, optional_value or 0)

	return 
end
OptionsView.update_mouse_scroll_input = function (self, disable_all_input)
	local selected_settings_list = self.selected_settings_list
	local using_scrollbar = selected_settings_list and selected_settings_list.scrollbar

	if using_scrollbar then
		local scrollbar = self.scrollbar
		local scroll_bar_value = scrollbar.content.scroll_bar_info.value

		if disable_all_input then
			self.scroll_field_widget.content.internal_scroll_value = scroll_bar_value
		end

		local mouse_scroll_value = self.scroll_field_widget.content.internal_scroll_value

		if not mouse_scroll_value then
			return 
		end

		local current_scroll_value = self.scroll_value

		if current_scroll_value ~= mouse_scroll_value then
			self.set_scrollbar_value(self, mouse_scroll_value)
		elseif current_scroll_value ~= scroll_bar_value then
			self.set_scrollbar_value(self, scroll_bar_value)
		end
	end

	return 
end
OptionsView.set_scrollbar_value = function (self, value)
	local current_scroll_value = self.scroll_value

	if not current_scroll_value or value ~= current_scroll_value then
		local widget_scroll_bar_info = self.scrollbar.content.scroll_bar_info
		widget_scroll_bar_info.value = value
		self.scroll_field_widget.content.internal_scroll_value = value
		self.scroll_value = value
	end

	return 
end
OptionsView.change_gamepad_generic_input_action = function (self, reset_input_description)
	local in_settings_sub_menu = self.in_settings_sub_menu
	local actions_name_to_use = "default"
	local menu_name_to_use = (in_settings_sub_menu and "sub_menu") or "main_menu"
	local reset_disabled = self.reset_to_default.content.hidden or self.reset_to_default.content.button_text.disabled
	local apply_disabled = self.apply_button.content.button_text.disabled

	if not reset_disabled then
		if not apply_disabled then
			actions_name_to_use = "reset_and_apply"
		else
			actions_name_to_use = "reset"
		end
	elseif not apply_disabled then
		actions_name_to_use = "apply"
	end

	if not self.gamepad_active_generic_actions_name or self.gamepad_active_generic_actions_name ~= actions_name_to_use then
		self.gamepad_active_generic_actions_name = actions_name_to_use
		local actions_table = generic_input_actions[menu_name_to_use]
		local generic_actions = actions_table[actions_name_to_use]

		self.menu_input_description:change_generic_actions(generic_actions)
	end

	if reset_input_description then
		self.menu_input_description:set_input_description(nil)
	end

	return 
end
OptionsView.handle_controller_navigation_input = function (self, dt, input_service)
	self.change_gamepad_generic_input_action(self)

	if 0 < self.controller_cooldown then
		self.controller_cooldown = self.controller_cooldown - dt
		local speed_multiplier = self.speed_multiplier or 1
		local decrease = GamepadSettings.menu_speed_multiplier_frame_decrease
		local min_multiplier = GamepadSettings.menu_min_speed_multiplier
		self.speed_multiplier = math.max(speed_multiplier - decrease, min_multiplier)

		return 
	else
		local in_settings_sub_menu = self.in_settings_sub_menu

		if in_settings_sub_menu then
			self.draw_gamepad_tooltip = self.gamepad_tooltip_available and input_service.get(input_service, "cycle_previous_hold")

			if self.draw_gamepad_tooltip then
				return 
			end
		elseif input_service.get(input_service, "confirm") then
			in_settings_sub_menu = true
			self.in_settings_sub_menu = in_settings_sub_menu

			self.set_console_setting_list_selection(self, 1, true, false)
		end

		if input_service.get(input_service, "back", true) then
			WwiseWorld.trigger_event(self.wwise_world, "Play_hud_select")
			self.on_exit_pressed(self)
		end
	end

	self.speed_multiplier = 1

	return 
end
OptionsView.handle_mouse_widget_input = function (self, widget, input_service, dt)
	local widget_type = widget.type

	self._input_functions[widget_type](widget, input_service, dt)

	return 
end
OptionsView.handle_settings_list_widget_input = function (self, input_service, dt)
	local selected_settings_list = self.selected_settings_list
	local widgets = selected_settings_list.widgets
	local selected_list_index = selected_settings_list.selected_index or 1
	local selected_widget = widgets[selected_list_index]
	local widgets_n = selected_settings_list.widgets_n

	if widgets_n == 0 or selected_widget.content.disabled then
		return false
	end

	local widget_type = selected_widget.type
	local widget_type_template = SettingsWidgetTypeTemplate[widget_type]
	local input_function = widget_type_template.input_function

	return input_function(selected_widget, input_service, dt)
end
OptionsView.set_console_title_selection = function (self, index, ignore_sound)
	local selected_title_index = self.selected_title

	if selected_title_index == index then
		return 
	elseif not selected_title_index then
		index = 1
	end

	local number_of_menu_entries = #SettingsMenuNavigation

	if number_of_menu_entries < index or index <= 0 then
		return 
	end

	if not ignore_sound then
		WwiseWorld.trigger_event(self.wwise_world, "Play_hud_select")
	end

	self.select_settings_title(self, index)

	return 
end
OptionsView.set_console_setting_list_selection = function (self, index, increment_if_disabled, ignore_sound)
	local selected_settings_list = self.selected_settings_list
	local selected_list_index = selected_settings_list.selected_index
	local list_widgets = selected_settings_list.widgets
	local widgets_n = selected_settings_list.widgets_n
	local new_index = index
	local widget = list_widgets[new_index]
	local is_valid_index = self.is_widget_selectable(self, widget)

	while not is_valid_index do
		if increment_if_disabled then
			new_index = math.min(new_index + 1, widgets_n + 1)
		else
			new_index = math.max(new_index - 1, 0)
		end

		if new_index < 1 or widgets_n < new_index then
			return 
		end

		widget = list_widgets[new_index]
		is_valid_index = self.is_widget_selectable(self, widget)
	end

	if not ignore_sound then
		WwiseWorld.trigger_event(self.wwise_world, "Play_hud_select")
	end

	local using_scrollbar = selected_settings_list.scrollbar

	if using_scrollbar then
		self.move_scrollbar_based_on_selection(self, new_index)
	end

	self.select_settings_list_widget(self, new_index)

	return 
end
OptionsView.is_widget_selectable = function (self, widget)
	return widget and widget.type ~= "image" and widget.type ~= "gamepad_layout"
end
OptionsView.clear_console_setting_list_selection = function (self)
	local selected_settings_list = self.selected_settings_list

	if not selected_settings_list then
		return 
	end

	local selected_list_index = selected_settings_list.selected_index

	if selected_list_index then
		local list_widgets = selected_settings_list.widgets
		local deselect_widget = list_widgets[selected_list_index]

		self.deselect_settings_list_widget(self, deselect_widget)

		selected_settings_list.selected_index = nil
	end

	return 
end
OptionsView.move_scrollbar_based_on_selection = function (self, index)
	local selected_settings_list = self.selected_settings_list
	local selected_list_index = selected_settings_list.selected_index
	local going_downwards = (not selected_list_index and true) or selected_list_index < index
	local widgets = selected_settings_list.widgets
	local base_widget = (going_downwards and widgets[index + 1]) or widgets[index - 1]

	if base_widget then
		local max_offset_y = selected_settings_list.max_offset_y
		local ui_scenegraph = self.ui_scenegraph
		local scenegraph_id_start = selected_settings_list.scenegraph_id_start
		local mask_pos = Vector3.deprecated_copy(UISceneGraph.get_world_position(ui_scenegraph, "list_mask"))
		local mask_size = UISceneGraph.get_size(ui_scenegraph, "list_mask")
		local list_position = UISceneGraph.get_world_position(ui_scenegraph, scenegraph_id_start)

		if selected_list_index then
			local selected_widget = widgets[selected_list_index]
			local selected_widget_offset = selected_widget.style.offset
			local selected_widget_size = selected_widget.style.size
			temp_pos_table.x = list_position[1] + selected_widget_offset[1]
			temp_pos_table.y = list_position[2] + selected_widget_offset[2]
			local selected_widget_visible = math.point_is_inside_2d_box(temp_pos_table, mask_pos, mask_size)
			temp_pos_table.y = temp_pos_table.y + selected_widget_size[2]
			selected_widget_visible = selected_widget_visible and math.point_is_inside_2d_box(temp_pos_table, mask_pos, mask_size)

			if not selected_widget_visible then
				local below_baseline = nil

				if list_position[2] + selected_widget_offset[2] < mask_pos[2] then
					below_baseline = true
				else
					below_baseline = false
				end

				if (not going_downwards and below_baseline) or (going_downwards and not below_baseline) then
					going_downwards = not going_downwards
					base_widget = selected_widget
				end
			end
		end

		local base_widget_style = base_widget.style
		local base_widget_size = base_widget_style.size
		local base_widget_offset = base_widget_style.offset
		temp_pos_table.x = list_position[1] + base_widget_offset[1]
		temp_pos_table.y = list_position[2] + base_widget_offset[2]
		local widget_visible = math.point_is_inside_2d_box(temp_pos_table, mask_pos, mask_size)
		temp_pos_table.y = temp_pos_table.y + base_widget_size[2]
		widget_visible = widget_visible and math.point_is_inside_2d_box(temp_pos_table, mask_pos, mask_size)

		if not widget_visible then
			local step = 0

			if going_downwards then
				local mask_pos_y = mask_pos[2]
				local widget_pos_y = list_position[2] + base_widget_offset[2]
				local diff = math.abs(mask_pos_y - widget_pos_y)
				step = diff/max_offset_y
			else
				local mask_upper_pos_y = mask_pos[2] + mask_size[2]
				local widget_upper_pos_y = temp_pos_table.y
				local diff = math.abs(mask_upper_pos_y - widget_upper_pos_y)
				step = -(diff/max_offset_y)
			end

			local scrollbar = self.scrollbar
			local value = scrollbar.content.scroll_bar_info.value

			self.set_scrollbar_value(self, math.clamp(value + step, 0, 1))
		end
	else
		local scrollbar = self.scrollbar

		if going_downwards then
			self.set_scrollbar_value(self, 1)
		else
			self.set_scrollbar_value(self, 0)
		end
	end

	return 
end
OptionsView.set_selected_input_description_by_active = function (self, is_active)
	local selected_settings_list = self.selected_settings_list

	if not selected_settings_list then
		return 
	end

	local selected_list_index = selected_settings_list.selected_index
	local list_widgets = selected_settings_list.widgets
	local widget = list_widgets[selected_list_index]
	local is_disabled = widget.content.disabled
	local widget_type = widget.type
	local widget_type_template = SettingsWidgetTypeTemplate[widget_type]
	local widget_input_description = (is_active and widget_type_template.active_input_description) or widget_type_template.input_description

	if is_disabled then
		self.menu_input_description:set_input_description(nil)
	else
		self.menu_input_description:set_input_description(widget_input_description)
	end

	return 
end
OptionsView.animate_element_by_time = function (self, target, target_index, from, to, time)
	local new_animation = UIAnimation.init(UIAnimation.function_by_time, target, target_index, from, to, time, math.ease_out_quad)

	return new_animation
end
OptionsView.animate_element_by_catmullrom = function (self, target, target_index, target_value, p0, p1, p2, p3, time)
	local new_animation = UIAnimation.init(UIAnimation.catmullrom, target, target_index, target_value, p0, p1, p2, p3, time)

	return new_animation
end
OptionsView.on_stepper_arrow_pressed = function (self, widget, style_id)
	local widget_animations = widget.ui_animations
	local widget_style = widget.style
	local pass_style = widget_style[style_id]
	local default_size = {
		28,
		34
	}
	local current_alpha = pass_style.color[1]
	local target_alpha = 255
	local total_time = UISettings.scoreboard.topic_hover_duration
	local animation_duration = total_time

	if 0 < animation_duration then
		local animation_name_hover = "stepper_widget_arrow_hover_" .. style_id
		local animation_name_width = "stepper_widget_arrow_width_" .. style_id
		local animation_name_height = "stepper_widget_arrow_height_" .. style_id
		widget_animations[animation_name_hover] = self.animate_element_by_time(self, pass_style.color, 1, current_alpha, target_alpha, animation_duration)
		widget_animations[animation_name_width] = self.animate_element_by_catmullrom(self, pass_style.size, 1, default_size[1], 0.7, 1, 1, 0.7, animation_duration)
		widget_animations[animation_name_height] = self.animate_element_by_catmullrom(self, pass_style.size, 2, default_size[2], 0.7, 1, 1, 0.7, animation_duration)
	else
		pass_style.color[1] = target_alpha
	end

	return 
end
OptionsView.on_stepper_arrow_hover = function (self, widget, style_id)
	local widget_animations = widget.ui_animations
	local widget_style = widget.style
	local pass_style = widget_style[style_id]
	local current_alpha = pass_style.color[1]
	local target_alpha = 255
	local total_time = UISettings.scoreboard.topic_hover_duration
	local animation_duration = (current_alpha/target_alpha - 1)*total_time

	if 0 < animation_duration then
		local animation_name_hover = "stepper_widget_arrow_hover_" .. style_id
		widget_animations[animation_name_hover] = self.animate_element_by_time(self, pass_style.color, 1, current_alpha, target_alpha, animation_duration)
	else
		pass_style.color[1] = target_alpha
	end

	return 
end
OptionsView.on_stepper_arrow_dehover = function (self, widget, style_id)
	local widget_animations = widget.ui_animations
	local widget_style = widget.style
	local pass_style = widget_style[style_id]
	local current_alpha = pass_style.color[1]
	local target_alpha = 0
	local total_time = UISettings.scoreboard.topic_hover_duration
	local animation_duration = current_alpha/255*total_time

	if 0 < animation_duration then
		local animation_name_hover = "stepper_widget_arrow_hover_" .. style_id
		widget_animations[animation_name_hover] = self.animate_element_by_time(self, pass_style.color, 1, current_alpha, target_alpha, animation_duration)
	else
		pass_style.color[1] = target_alpha
	end

	return 
end
OptionsView.checkbox_test_setup = function (self)
	return false, "test"
end
OptionsView.checkbox_test_saved_value = function (self, widget)
	widget.content.flag = false

	return 
end
OptionsView.checkbox_test = function (self, content)
	local flag = content.flag

	print("OptionsView:checkbox_test(flag)", self, flag)

	return 
end
OptionsView.slider_test_setup = function (self)
	return 0.5, 5, 500, 0, "Music Volume"
end
OptionsView.slider_test_saved_value = function (self, widget)
	widget.content.value = 0.5

	return 
end
OptionsView.slider_test = function (self, content)
	local value = content.value

	print("OptionsView:slider_test(flag)", self, value)

	return 
end
OptionsView.drop_down_test_setup = function (self)
	local options = {
		{
			text = "1920x1080",
			value = {
				1920,
				1080
			}
		},
		{
			text = "1680x1050",
			value = {
				1680,
				1050
			}
		},
		{
			text = "1680x1050",
			value = {
				1680,
				1050
			}
		}
	}

	return 1, options, "Resolution"
end
OptionsView.drop_down_test_saved_value = function (self, widget)
	local options_values = widget.content.options_values
	local options_texts = widget.content.options_texts
	widget.content.selected_option = options_texts[1]

	return 
end
OptionsView.drop_down_test = function (self, content, i)
	print("OptionsView:dropdown_test(flag)", self, content, i)

	return 
end
OptionsView.cb_stepper_test_setup = function (self)
	local options = {
		{
			text = "value_1",
			value = 1
		},
		{
			text = "value_2_maddafakkaaa",
			value = 2
		},
		{
			text = "value_3_yobro",
			value = 3
		}
	}

	return 1, options, "stepper_test"
end
OptionsView.cb_stepper_test_saved_value = function (self, widget)
	widget.content.current_selection = 1

	return 
end
OptionsView.cb_stepper_test = function (self, content)
	local options_values = content.options_values
	local current_selection = content.current_selection
	local value = options_values[current_selection]

	print(value)

	return 
end
OptionsView.cb_vsync_setup = function (self)
	local options = {
		{
			value = false,
			text = Localize("menu_settings_off")
		},
		{
			value = true,
			text = Localize("menu_settings_on")
		}
	}
	local vsync = Application.user_setting("vsync") or false
	local selection = (vsync and 2) or 1
	local default_value = (DefaultUserSettings.get("user_settings", "vsync") and 2) or 1

	return selection, options, "settings_menu_vsync", default_value
end
OptionsView.cb_vsync_saved_value = function (self, widget)
	local vsync = assigned(self.changed_user_settings.vsync, Application.user_setting("vsync"))
	widget.content.current_selection = (vsync and 2) or 1

	return 
end
OptionsView.cb_vsync = function (self, content)
	local options_values = content.options_values
	local current_selection = content.current_selection
	self.changed_user_settings.vsync = options_values[current_selection]

	return 
end
OptionsView.cb_hud_screen_fit_setup = function (self)
	local options = {
		{
			value = false,
			text = Localize("menu_settings_off")
		},
		{
			value = true,
			text = Localize("menu_settings_on")
		}
	}
	local use_hud_screen_fit = Application.user_setting("use_hud_screen_fit") or false
	local selection = (use_hud_screen_fit and 2) or 1
	local default_value = (DefaultUserSettings.get("user_settings", "use_hud_screen_fit") and 2) or 1

	return selection, options, "settings_menu_hud_screen_fit", default_value
end
OptionsView.cb_hud_screen_fit_saved_value = function (self, widget)
	local use_hud_screen_fit = assigned(self.changed_user_settings.use_hud_screen_fit, Application.user_setting("use_hud_screen_fit"))
	widget.content.current_selection = (use_hud_screen_fit and 2) or 1

	return 
end
OptionsView.cb_hud_screen_fit = function (self, content)
	local options_values = content.options_values
	local current_selection = content.current_selection
	self.changed_user_settings.use_hud_screen_fit = options_values[current_selection]

	return 
end
OptionsView.cb_fullscreen_setup = function (self)
	local options = {
		{
			value = "fullscreen",
			text = Localize("menu_settings_fullscreen")
		},
		{
			value = "borderless_fullscreen",
			text = Localize("menu_settings_borderless_window")
		},
		{
			value = "windowed",
			text = Localize("menu_settings_windowed")
		}
	}
	local fullscreen = Application.user_setting("fullscreen")
	local borderless_fullscreen = Application.user_setting("borderless_fullscreen")
	local windowed = not fullscreen and not borderless_fullscreen
	local selected_option = (fullscreen and 1) or (borderless_fullscreen and 2) or 3
	local default_fullscreen = DefaultUserSettings.get("user_settings", "fullscreen")
	local default_borderless_fullscreen = DefaultUserSettings.get("user_settings", "borderless_fullscreen")
	local default_option = (default_fullscreen and 1) or (borderless_fullscreen and 2) or 3

	return selected_option, options, "menu_settings_windowed_mode", default_option
end
OptionsView.cb_fullscreen_saved_value = function (self, widget)
	local options_values = widget.content.options_values
	local options_texts = widget.content.options_texts
	local fullscreen = assigned(self.changed_user_settings.fullscreen, Application.user_setting("fullscreen"))
	local borderless_fullscreen = assigned(self.changed_user_settings.borderless_fullscreen, Application.user_setting("borderless_fullscreen"))
	local windowed = not fullscreen and not borderless_fullscreen
	local selected_option = (fullscreen and 1) or (borderless_fullscreen and 2) or 3
	widget.content.current_selection = selected_option

	return 
end
OptionsView.cb_fullscreen = function (self, content)
	local selected_index = content.current_selection
	local options_values = content.options_values
	local value = options_values[selected_index]
	local changed_user_settings = self.changed_user_settings

	if value == "fullscreen" then
		changed_user_settings.fullscreen = true
		changed_user_settings.borderless_fullscreen = false
	elseif value == "borderless_fullscreen" then
		changed_user_settings.fullscreen = false
		changed_user_settings.borderless_fullscreen = true
	elseif value == "windowed" then
		changed_user_settings.fullscreen = false
		changed_user_settings.borderless_fullscreen = false
	end

	if value == "borderless_fullscreen" then
		self.set_widget_disabled(self, "resolutions", true)
	else
		self.set_widget_disabled(self, "resolutions", false)
	end

	return 
end
OptionsView.cb_adapter_setup = function (self)
	local num_adapters = DisplayAdapter.num_adapters()
	local options = {}

	for i = 0, num_adapters - 1, 1 do
		options[#options + 1] = {
			text = tostring(i),
			value = i
		}
	end

	local adapter_index = Application.user_setting("adapter_index")
	local selected_option = adapter_index + 1
	local default_adapter = DefaultUserSettings.get("user_settings", "adapter_index")
	local default_option = default_adapter + 1

	return selected_option, options, "menu_settings_adapter", default_option
end
OptionsView.cb_adapter_saved_value = function (self, widget)
	local options_values = widget.content.options_values
	local adapter_index = assigned(self.changed_user_settings.adapter_index, Application.user_setting("adapter_index"))
	local selected_option = adapter_index + 1
	widget.content.current_selection = selected_option

	return 
end
OptionsView.cb_adapter = function (self, content, selected_index)
	local options_values = content.options_values
	local value = options_values[content.current_selection]
	local changed_user_settings = self.changed_user_settings
	changed_user_settings.adapter_index = value

	return 
end
OptionsView.cb_graphics_quality_setup = function (self)
	local options = {
		{
			value = "custom",
			text = Localize("menu_settings_custom")
		},
		{
			value = "lowest",
			text = Localize("menu_settings_lowest")
		},
		{
			value = "low",
			text = Localize("menu_settings_low")
		},
		{
			value = "medium",
			text = Localize("menu_settings_medium")
		},
		{
			value = "high",
			text = Localize("menu_settings_high")
		},
		{
			value = "extreme",
			text = Localize("menu_settings_extreme")
		}
	}
	local graphics_quality = Application.user_setting("graphics_quality")
	local selected_option = 1

	for i, step in ipairs(options) do
		if graphics_quality == step.value then
			selected_option = i

			break
		end
	end

	return selected_option, options, "menu_settings_graphics_quality", "high"
end
OptionsView.cb_graphics_quality_saved_value = function (self, widget)
	local graphics_quality = assigned(self.changed_user_settings.graphics_quality, Application.user_setting("graphics_quality"))
	local options_values = widget.content.options_values
	local selected_option = 1

	for i, value in ipairs(options_values) do
		if graphics_quality == value then
			selected_option = i

			break
		end
	end

	widget.content.current_selection = selected_option

	return 
end
OptionsView.cb_graphics_quality = function (self, content)
	local options_values = content.options_values
	local value = options_values[content.current_selection]
	self.changed_user_settings.graphics_quality = value

	if value == "custom" then
		return 
	end

	local settings = GraphicsQuality[value]
	local user_settings = settings.user_settings

	for setting, value in pairs(user_settings) do
		self.changed_user_settings[setting] = value
	end

	local render_settings = settings.render_settings

	for setting, value in pairs(render_settings) do
		self.changed_render_settings[setting] = value
	end

	local widgets = self.selected_settings_list.widgets
	local widgets_n = self.selected_settings_list.widgets_n

	for i = 1, widgets_n, 1 do
		local widget = widgets[i]

		if widget.name ~= "graphics_quality_settings" then
			local content = widget.content

			content.saved_value_cb(widget)
			content.callback(content, true)
		end
	end

	return 
end
OptionsView.cb_resolutions_setup = function (self)
	local screen_resolution = Application.user_setting("screen_resolution")
	local output_screen = Application.user_setting("fullscreen_output")
	local adapter_index = Application.user_setting("adapter_index")

	if DisplayAdapter.num_outputs(adapter_index) < 1 then
		local num_adapters = DisplayAdapter.num_adapters()

		for i = 0, num_adapters - 1, 1 do
			if 0 < DisplayAdapter.num_outputs(i) then
				adapter_index = i

				break
			end
		end
	end

	local options = {}
	local num_modes = DisplayAdapter.num_modes(adapter_index, output_screen)

	for i = 0, num_modes - 1, 1 do
		local width, height = DisplayAdapter.mode(adapter_index, output_screen, i)

		if width < GameSettingsDevelopment.lowest_resolution then
		else
			local text = tostring(width) .. "x" .. tostring(height)
			options[#options + 1] = {
				text = text,
				value = {
					width,
					height
				}
			}
		end
	end

	local function comparator(a, b)
		return b.value[1] < a.value[1]
	end

	table.sort(options, comparator)

	local selected_option = nil

	for i = 1, #options, 1 do
		local resolution = options[i]

		if resolution.value[1] == screen_resolution[1] and resolution.value[2] == screen_resolution[2] then
			selected_option = i

			break
		end
	end

	return selected_option, options, "menu_settings_resolution"
end
OptionsView.cb_resolutions_saved_value = function (self, widget)
	local options_values = widget.content.options_values
	local options_texts = widget.content.options_texts
	local resolution = assigned(self.changed_user_settings.screen_resolution, Application.user_setting("screen_resolution"))
	local selected_option = nil

	for i = 1, #options_values, 1 do
		local value = options_values[i]

		if value[1] == resolution[1] and value[2] == resolution[2] then
			selected_option = i

			break
		end
	end

	widget.content.current_selection = selected_option
	local fullscreen = assigned(self.changed_user_settings.fullscreen, Application.user_setting("fullscreen"))
	local borderless_fullscreen = assigned(self.changed_user_settings.borderless_fullscreen, Application.user_setting("borderless_fullscreen"))

	if not fullscreen and borderless_fullscreen then
		widget.content.disabled = true
	else
		widget.content.disabled = false
	end

	return 
end
OptionsView.cb_resolutions = function (self, content)
	local selected_index = content.current_selection
	local options_values = content.options_values
	local value = options_values[selected_index]

	if value then
		self.changed_user_settings.screen_resolution = table.clone(value)
	end

	return 
end
OptionsView.cb_lock_framerate_setup = function (self)
	local options = {
		{
			value = 0,
			text = Localize("menu_settings_off")
		},
		{
			text = "30",
			value = 30
		},
		{
			text = "60",
			value = 60
		},
		{
			text = "90",
			value = 90
		},
		{
			text = "120",
			value = 120
		}
	}
	local default_value = DefaultUserSettings.get("user_settings", "max_fps")
	local default_option = nil
	local selected_option = 1
	local max_fps = Application.user_setting("max_fps") or 0

	for i = 1, #options, 1 do
		if max_fps == options[i].value then
			selected_option = i
		end

		if default_value == options[i].value then
			default_option = i
		end
	end

	return selected_option, options, "menu_settings_lock_framerate", default_option
end
OptionsView.cb_lock_framerate_saved_value = function (self, widget)
	local options_values = widget.content.options_values
	local options_texts = widget.content.options_texts
	local selected_option = nil
	local max_fps = assigned(self.changed_user_settings.max_fps, Application.user_setting("max_fps")) or 0

	for i = 1, #options_values, 1 do
		if max_fps == options_values[i] then
			selected_option = i

			break
		end
	end

	widget.content.current_selection = selected_option

	return 
end
OptionsView.cb_lock_framerate = function (self, content)
	local selected_index = content.current_selection
	local value = content.options_values[selected_index]
	self.changed_user_settings.max_fps = value

	return 
end
OptionsView.cb_max_stacking_frames_setup = function (self)
	local options = {
		{
			value = -1,
			text = Localize("menu_settings_auto")
		},
		{
			text = "1",
			value = 1
		},
		{
			text = "2",
			value = 2
		},
		{
			text = "3",
			value = 3
		},
		{
			text = "4",
			value = 4
		}
	}
	local default_value = DefaultUserSettings.get("user_settings", "max_stacking_frames")
	local default_option = nil
	local selected_option = 1
	local max_stacking_frames = Application.user_setting("max_stacking_frames") or -1

	for i = 1, #options, 1 do
		if max_stacking_frames == options[i].value then
			selected_option = i
		end

		if default_value == options[i].value then
			default_option = i
		end
	end

	return selected_option, options, "menu_settings_max_stacking_frames", default_option
end
OptionsView.cb_max_stacking_frames_saved_value = function (self, widget)
	local options_values = widget.content.options_values
	local current_selection = nil
	local max_stacking_frames = assigned(self.changed_user_settings.max_stacking_frames, Application.user_setting("max_stacking_frames")) or -1

	for i = 1, #options_values, 1 do
		if max_stacking_frames == options_values[i] then
			current_selection = i

			break
		end
	end

	widget.content.current_selection = current_selection

	return 
end
OptionsView.cb_max_stacking_frames = function (self, content)
	self.changed_user_settings.max_stacking_frames = content.options_values[content.current_selection]

	return 
end
OptionsView.cb_anti_aliasing_setup = function (self)
	local options = {
		{
			value = "none",
			text = Localize("menu_settings_none")
		},
		{
			value = "FXAA",
			text = Localize("menu_settings_fxaa")
		},
		{
			value = "TAA",
			text = Localize("menu_settings_taa")
		}
	}
	local fxaa_enabled = Application.user_setting("render_settings", "fxaa_enabled")
	local taa_enabled = Application.user_setting("render_settings", "taa_enabled")
	local selected_option = (fxaa_enabled and 2) or (taa_enabled and 3) or 1
	local default_fxaa_enabled = DefaultUserSettings.get("render_settings", "fxaa_enabled")
	local default_taa_enabled = DefaultUserSettings.get("render_settings", "taa_enabled")
	local default_option = (default_fxaa_enabled and 2) or (default_taa_enabled and 3) or 1

	return selected_option, options, "menu_settings_anti_aliasing", default_option
end
OptionsView.cb_anti_aliasing_saved_value = function (self, widget)
	local fxaa_enabled = assigned(self.changed_render_settings.fxaa_enabled, Application.user_setting("render_settings", "fxaa_enabled"))
	local taa_enabled = assigned(self.changed_render_settings.taa_enabled, Application.user_setting("render_settings", "taa_enabled"))
	local selected_option = (fxaa_enabled and 2) or (taa_enabled and 3) or 1
	widget.content.current_selection = selected_option

	return 
end
OptionsView.cb_anti_aliasing = function (self, content, called_from_graphics_quality)
	local selected_index = content.current_selection
	local value = content.options_values[selected_index]

	if value == "FXAA" then
		self.changed_render_settings.fxaa_enabled = true
		self.changed_render_settings.taa_enabled = false
	elseif value == "TAA" then
		self.changed_render_settings.fxaa_enabled = false
		self.changed_render_settings.taa_enabled = true
	else
		self.changed_render_settings.fxaa_enabled = false
		self.changed_render_settings.taa_enabled = false
	end

	if not called_from_graphics_quality then
		self.force_set_widget_value(self, "graphics_quality_settings", "custom")
	end

	return 
end
OptionsView.cb_gamma_setup = function (self)
	local min = 1.5
	local max = 5
	local gamma = Application.user_setting("render_settings", "gamma") or 2.2
	local value = get_slider_value(min, max, gamma)
	local default_value = math.clamp(DefaultUserSettings.get("render_settings", "gamma"), min, max)

	Application.set_render_setting("gamma", gamma)

	return value, min, max, 1, "menu_settings_gamma", default_value
end
OptionsView.cb_gamma_saved_value = function (self, widget)
	local content = widget.content
	local min = content.min
	local max = content.max
	local gamma = assigned(self.changed_render_settings.gamma, Application.user_setting("render_settings", "gamma")) or 2.2
	gamma = math.clamp(gamma, min, max)
	content.internal_value = get_slider_value(min, max, gamma)
	content.value = gamma

	return 
end
OptionsView.cb_gamma = function (self, content)
	self.changed_render_settings.gamma = content.value

	Application.set_render_setting("gamma", content.value)

	return 
end
OptionsView.cb_sun_shadows_setup = function (self)
	local options = {
		{
			value = "off",
			text = Localize("menu_settings_off")
		},
		{
			value = "low",
			text = Localize("menu_settings_low")
		},
		{
			value = "medium",
			text = Localize("menu_settings_medium")
		},
		{
			value = "high",
			text = Localize("menu_settings_high")
		},
		{
			value = "extreme",
			text = Localize("menu_settings_extreme")
		}
	}
	local sun_shadows = Application.user_setting("render_settings", "sun_shadows")
	local sun_shadow_quality = Application.user_setting("sun_shadow_quality")
	local selection = nil

	if sun_shadows then
		if sun_shadow_quality == "low" then
			selection = 2
		elseif sun_shadow_quality == "medium" then
			selection = 3
		elseif sun_shadow_quality == "high" then
			selection = 4
		elseif sun_shadow_quality == "extreme" then
			selection = 5
		end
	else
		selection = 1
	end

	return selection, options, "menu_settings_sun_shadows"
end
OptionsView.cb_sun_shadows_saved_value = function (self, widget)
	local sun_shadows = assigned(self.changed_render_settings.sun_shadows, Application.user_setting("render_settings", "sun_shadows"))
	local sun_shadow_quality = assigned(self.changed_user_settings.sun_shadow_quality, Application.user_setting("sun_shadow_quality"))
	local selection = nil

	if sun_shadows then
		if sun_shadow_quality == "low" then
			selection = 2
		elseif sun_shadow_quality == "medium" then
			selection = 3
		elseif sun_shadow_quality == "high" then
			selection = 4
		elseif sun_shadow_quality == "extreme" then
			selection = 5
		end
	else
		selection = 1
	end

	widget.content.current_selection = selection

	return 
end
OptionsView.cb_sun_shadows = function (self, content, called_from_graphics_quality)
	local options_values = content.options_values
	local current_selection = content.current_selection
	local sun_shadow_quality = nil
	local value = options_values[current_selection]

	if value == "off" then
		self.changed_render_settings.sun_shadows = false
		sun_shadow_quality = "low"
	else
		self.changed_render_settings.sun_shadows = true
		sun_shadow_quality = value
	end

	self.changed_user_settings.sun_shadow_quality = sun_shadow_quality
	local sun_shadow_quality_settings = SunShadowQuality[sun_shadow_quality]

	for setting, key in pairs(sun_shadow_quality_settings) do
		self.changed_render_settings[setting] = key
	end

	if not called_from_graphics_quality then
		self.force_set_widget_value(self, "graphics_quality_settings", "custom")
	end

	return 
end
OptionsView.cb_lod_quality_setup = function (self)
	local options = {
		{
			value = 0.6,
			text = Localize("menu_settings_low")
		},
		{
			value = 0.8,
			text = Localize("menu_settings_medium")
		},
		{
			value = 1,
			text = Localize("menu_settings_high")
		}
	}
	local default_value = DefaultUserSettings.get("render_settings", "lod_object_multiplier")
	local default_option = nil
	local saved_option = Application.user_setting("render_settings", "lod_object_multiplier") or 1
	local selected_option = 1

	for i = 1, #options, 1 do
		if saved_option == options[i].value then
			selected_option = i
		end

		if default_value == options[i].value then
			default_option = i
		end
	end

	return selected_option, options, "menu_settings_lod_quality", default_option
end
OptionsView.cb_lod_quality_saved_value = function (self, widget)
	local options_values = widget.content.options_values
	local selected_option = 1
	local lod_object_multiplier = assigned(self.changed_render_settings.lod_object_multiplier, Application.user_setting("render_settings", "lod_object_multiplier")) or 1

	for i = 1, #options_values, 1 do
		if lod_object_multiplier == options_values[i] then
			selected_option = i

			break
		end
	end

	widget.content.current_selection = selected_option

	return 
end
OptionsView.cb_lod_quality = function (self, content)
	local value = content.options_values[content.current_selection] or 1
	self.changed_render_settings.lod_object_multiplier = value

	return 
end
OptionsView.cb_scatter_density_setup = function (self)
	local options = {
		{
			value = 0,
			text = Localize("menu_settings_off")
		},
		{
			text = "25%",
			value = 0.25
		},
		{
			text = "50%",
			value = 0.5
		},
		{
			text = "75%",
			value = 0.75
		},
		{
			text = "100%",
			value = 1
		}
	}
	local default_value = DefaultUserSettings.get("render_settings", "lod_scatter_density")
	local default_option = nil
	local saved_option = Application.user_setting("render_settings", "lod_scatter_density") or 1
	local selected_option = 1

	for i = 1, #options, 1 do
		if saved_option == options[i].value then
			selected_option = i
		end

		if default_value == options[i].value then
			default_option = i
		end
	end

	return selected_option, options, "menu_settings_scatter_density", default_option
end
OptionsView.cb_scatter_density_saved_value = function (self, widget)
	local options_values = widget.content.options_values
	local selected_option = 1
	local lod_scatter_density = assigned(self.changed_render_settings.lod_scatter_density, Application.user_setting("render_settings", "lod_scatter_density")) or 1

	for i = 1, #options_values, 1 do
		if lod_scatter_density == options_values[i] then
			selected_option = i

			break
		end
	end

	widget.content.current_selection = selected_option

	return 
end
OptionsView.cb_scatter_density = function (self, content, called_from_graphics_quality)
	local value = content.options_values[content.current_selection] or 1
	self.changed_render_settings.lod_scatter_density = value

	if not called_from_graphics_quality then
		self.force_set_widget_value(self, "graphics_quality_settings", "custom")
	end

	return 
end
OptionsView.cb_decoration_density_setup = function (self)
	local options = {
		{
			value = 0,
			text = Localize("menu_settings_off")
		},
		{
			text = "25%",
			value = 0.25
		},
		{
			text = "50%",
			value = 0.5
		},
		{
			text = "75%",
			value = 0.75
		},
		{
			text = "100%",
			value = 1
		}
	}
	local saved_option = Application.user_setting("render_settings", "lod_decoration_density") or 1
	local selected_option = 1

	for i = 1, #options, 1 do
		if saved_option == options[i].value then
			selected_option = i

			break
		end
	end

	return selected_option, options, "menu_settings_decoration_density"
end
OptionsView.cb_decoration_density_saved_value = function (self, widget)
	local options_values = widget.content.options_values
	local selected_option = 1
	local lod_decoration_density = assigned(self.changed_render_settings.lod_decoration_density, Application.user_setting("render_settings", "lod_decoration_density")) or 1

	for i = 1, #options_values, 1 do
		if lod_decoration_density == options_values[i] then
			selected_option = i

			break
		end
	end

	widget.content.current_selection = selected_option

	return 
end
OptionsView.cb_decoration_density = function (self, content)
	local value = content.options_values[content.current_selection] or 1
	self.changed_render_settings.lod_decoration_density = value

	return 
end
OptionsView.cb_maximum_shadow_casting_lights_setup = function (self)
	local min = 1
	local max = 10
	local max_shadow_casting_lights = Application.user_setting("render_settings", "max_shadow_casting_lights")
	local value = get_slider_value(min, max, max_shadow_casting_lights)

	return value, min, max, 0, "menu_settings_maximum_shadow_casting_lights"
end
OptionsView.cb_maximum_shadow_casting_lights_saved_value = function (self, widget)
	local content = widget.content
	local min = content.min
	local max = content.max
	local max_shadow_casting_lights = assigned(self.changed_render_settings.max_shadow_casting_lights, Application.user_setting("render_settings", "max_shadow_casting_lights"))
	max_shadow_casting_lights = math.clamp(max_shadow_casting_lights, min, max)
	content.internal_value = get_slider_value(min, max, max_shadow_casting_lights)
	content.value = max_shadow_casting_lights

	return 
end
OptionsView.cb_maximum_shadow_casting_lights = function (self, content, called_from_graphics_quality)
	self.changed_render_settings.max_shadow_casting_lights = content.value

	print("max_shadow_casting_lights", content.value)

	if not called_from_graphics_quality then
		self.force_set_widget_value(self, "graphics_quality_settings", "custom")
	end

	return 
end
OptionsView.cb_local_light_shadow_quality_setup = function (self)
	local options = {
		{
			value = "off",
			text = Localize("menu_settings_off")
		},
		{
			value = "low",
			text = Localize("menu_settings_low")
		},
		{
			value = "medium",
			text = Localize("menu_settings_medium")
		},
		{
			value = "high",
			text = Localize("menu_settings_high")
		},
		{
			value = "extreme",
			text = Localize("menu_settings_extreme")
		}
	}
	local local_light_shadow_quality = Application.user_setting("local_light_shadow_quality")
	local deferred_local_lights_cast_shadows = Application.user_setting("render_settings", "deferred_local_lights_cast_shadows")
	local forward_local_lights_cast_shadows = Application.user_setting("render_settings", "forward_local_lights_cast_shadows")
	local selection = nil

	if not deferred_local_lights_cast_shadows or not forward_local_lights_cast_shadows then
		selection = 1
	elseif local_light_shadow_quality == "low" then
		selection = 2
	elseif local_light_shadow_quality == "medium" then
		selection = 3
	elseif local_light_shadow_quality == "high" then
		selection = 4
	elseif local_light_shadow_quality == "extreme" then
		selection = 5
	end

	return selection, options, "menu_settings_local_light_shadow_quality"
end
OptionsView.cb_local_light_shadow_quality_saved_value = function (self, widget)
	local local_light_shadow_quality = assigned(self.changed_user_settings.local_light_shadow_quality, Application.user_setting("local_light_shadow_quality"))
	local deferred_local_lights_cast_shadows = assigned(self.changed_render_settings.deferred_local_lights_cast_shadows, Application.user_setting("render_settings", "deferred_local_lights_cast_shadows"))
	local forward_local_lights_cast_shadows = assigned(self.changed_render_settings.forward_local_lights_cast_shadows, Application.user_setting("render_settings", "forward_local_lights_cast_shadows"))
	local selection = nil

	if not deferred_local_lights_cast_shadows or not forward_local_lights_cast_shadows then
		selection = 1
	elseif local_light_shadow_quality == "low" then
		selection = 2
	elseif local_light_shadow_quality == "medium" then
		selection = 3
	elseif local_light_shadow_quality == "high" then
		selection = 4
	elseif local_light_shadow_quality == "extreme" then
		selection = 5
	end

	widget.content.current_selection = selection

	return 
end
OptionsView.cb_local_light_shadow_quality = function (self, content, called_from_graphics_quality)
	local value = content.options_values[content.current_selection]
	local local_light_shadow_quality = nil

	if value == "off" then
		self.changed_render_settings.deferred_local_lights_cast_shadows = false
		self.changed_render_settings.forward_local_lights_cast_shadows = false
		local_light_shadow_quality = "low"
	else
		self.changed_render_settings.deferred_local_lights_cast_shadows = true
		self.changed_render_settings.forward_local_lights_cast_shadows = true
		local_light_shadow_quality = value
	end

	self.changed_user_settings.local_light_shadow_quality = local_light_shadow_quality
	local local_light_shadow_quality_settings = LocalLightShadowQuality[local_light_shadow_quality]

	for setting, key in pairs(local_light_shadow_quality_settings) do
		self.changed_render_settings[setting] = key
	end

	if not called_from_graphics_quality then
		self.force_set_widget_value(self, "graphics_quality_settings", "custom")
	end

	return 
end
OptionsView.cb_motion_blur_setup = function (self)
	local options = {
		{
			value = false,
			text = Localize("menu_settings_off")
		},
		{
			value = true,
			text = Localize("menu_settings_on")
		}
	}
	local motion_blur_enabled = Application.user_setting("render_settings", "motion_blur_enabled") or true
	local selected_option = (motion_blur_enabled and 2) or 1

	return selected_option, options, "menu_settings_motion_blur"
end
OptionsView.cb_motion_blur_saved_value = function (self, widget)
	local motion_blur_enabled = assigned(self.changed_render_settings.motion_blur_enabled, Application.user_setting("render_settings", "motion_blur_enabled"))
	local selected_option = (motion_blur_enabled and 2) or 1
	widget.content.current_selection = selected_option

	return 
end
OptionsView.cb_motion_blur = function (self, content, called_from_graphics_quality)
	local value = content.options_values[content.current_selection]
	self.changed_render_settings.motion_blur_enabled = value

	if PLATFORM == "win32" and not called_from_graphics_quality then
		self.force_set_widget_value(self, "graphics_quality_settings", "custom")
	end

	return 
end
OptionsView.cb_dof_setup = function (self)
	local options = {
		{
			value = false,
			text = Localize("menu_settings_off")
		},
		{
			value = true,
			text = Localize("menu_settings_on")
		}
	}
	local dof_enabled = Application.user_setting("render_settings", "dof_enabled")
	local selected_option = (dof_enabled and 2) or 1

	return selected_option, options, "menu_settings_dof"
end
OptionsView.cb_dof_saved_value = function (self, widget)
	local dof_enabled = assigned(self.changed_render_settings.dof_enabled, Application.user_setting("render_settings", "dof_enabled"))
	local selected_option = (dof_enabled and 2) or 1
	widget.content.current_selection = selected_option

	return 
end
OptionsView.cb_dof = function (self, content, called_from_graphics_quality)
	local value = content.options_values[content.current_selection]
	self.changed_render_settings.dof_enabled = value

	if not called_from_graphics_quality then
		self.force_set_widget_value(self, "graphics_quality_settings", "custom")
	end

	return 
end
OptionsView.cb_bloom_setup = function (self)
	local options = {
		{
			value = false,
			text = Localize("menu_settings_off")
		},
		{
			value = true,
			text = Localize("menu_settings_on")
		}
	}
	local bloom_enabled = Application.user_setting("render_settings", "bloom_enabled") or false
	local default_value = DefaultUserSettings.get("render_settings", "bloom_enabled")
	local selection = (bloom_enabled and 2) or 1
	local default_option = (default_value and 2) or 1

	return selection, options, "menu_settings_bloom", default_option
end
OptionsView.cb_bloom_saved_value = function (self, widget)
	local bloom_enabled = assigned(self.changed_render_settings.bloom_enabled, Application.user_setting("render_settings", "bloom_enabled")) or false
	widget.content.current_selection = (bloom_enabled and 2) or 1

	return 
end
OptionsView.cb_bloom = function (self, content, called_from_graphics_quality)
	local options_values = content.options_values
	local current_selection = content.current_selection
	self.changed_render_settings.bloom_enabled = options_values[current_selection]

	if not called_from_graphics_quality then
		self.force_set_widget_value(self, "graphics_quality_settings", "custom")
	end

	return 
end
OptionsView.cb_light_shafts_setup = function (self)
	local options = {
		{
			value = false,
			text = Localize("menu_settings_off")
		},
		{
			value = true,
			text = Localize("menu_settings_on")
		}
	}
	local light_shafts_enabled = Application.user_setting("render_settings", "light_shafts_enabled") or false
	local default_value = DefaultUserSettings.get("render_settings", "light_shafts_enabled")
	local selection = (light_shafts_enabled and 2) or 1
	local default_option = (default_value and 2) or 1

	return selection, options, "menu_settings_light_shafts", default_option
end
OptionsView.cb_light_shafts_saved_value = function (self, widget)
	local light_shafts_enabled = assigned(self.changed_render_settings.light_shafts_enabled, Application.user_setting("render_settings", "light_shafts_enabled")) or false
	widget.content.current_selection = (light_shafts_enabled and 2) or 1

	return 
end
OptionsView.cb_light_shafts = function (self, content, called_from_graphics_quality)
	local options_values = content.options_values
	local current_selection = content.current_selection
	self.changed_render_settings.light_shafts_enabled = options_values[current_selection]

	if not called_from_graphics_quality then
		self.force_set_widget_value(self, "graphics_quality_settings", "custom")
	end

	return 
end
OptionsView.cb_sun_flare_setup = function (self)
	local options = {
		{
			value = false,
			text = Localize("menu_settings_off")
		},
		{
			value = true,
			text = Localize("menu_settings_on")
		}
	}
	local sun_flare_enabled = Application.user_setting("render_settings", "sun_flare_enabled") or false
	local default_value = DefaultUserSettings.get("render_settings", "sun_flare_enabled")
	local selection = (sun_flare_enabled and 2) or 1
	local default_option = (default_value and 2) or 1

	return selection, options, "menu_settings_sun_flare", default_option
end
OptionsView.cb_sun_flare_saved_value = function (self, widget)
	local sun_flare_enabled = assigned(self.changed_render_settings.sun_flare_enabled, Application.user_setting("render_settings", "sun_flare_enabled")) or false
	widget.content.current_selection = (sun_flare_enabled and 2) or 1

	return 
end
OptionsView.cb_sun_flare = function (self, content, called_from_graphics_quality)
	local options_values = content.options_values
	local current_selection = content.current_selection
	self.changed_render_settings.sun_flare_enabled = options_values[current_selection]

	if not called_from_graphics_quality then
		self.force_set_widget_value(self, "graphics_quality_settings", "custom")
	end

	return 
end
OptionsView.cb_sharpen_setup = function (self)
	local options = {
		{
			value = false,
			text = Localize("menu_settings_off")
		},
		{
			value = true,
			text = Localize("menu_settings_on")
		}
	}
	local sharpen_enabled = Application.user_setting("render_settings", "sharpen_enabled") or false
	local default_value = DefaultUserSettings.get("render_settings", "sharpen_enabled")
	local selection = (sharpen_enabled and 2) or 1
	local default_option = (default_value and 2) or 1

	return selection, options, "menu_settings_sharpen", default_option
end
OptionsView.cb_sharpen_saved_value = function (self, widget)
	local sharpen_enabled = assigned(self.changed_render_settings.sharpen_enabled, Application.user_setting("render_settings", "sharpen_enabled")) or false
	widget.content.current_selection = (sharpen_enabled and 2) or 1

	return 
end
OptionsView.cb_sharpen = function (self, content, called_from_graphics_quality)
	local options_values = content.options_values
	local current_selection = content.current_selection
	self.changed_render_settings.sharpen_enabled = options_values[current_selection]

	if not called_from_graphics_quality then
		self.force_set_widget_value(self, "graphics_quality_settings", "custom")
	end

	return 
end
OptionsView.cb_lens_quality_setup = function (self)
	local options = {
		{
			value = false,
			text = Localize("menu_settings_off")
		},
		{
			value = true,
			text = Localize("menu_settings_on")
		}
	}
	local lens_quality_enabled = Application.user_setting("render_settings", "lens_quality_enabled") or false
	local default_value = DefaultUserSettings.get("render_settings", "lens_quality_enabled")
	local selection = (lens_quality_enabled and 2) or 1
	local default_option = (default_value and 2) or 1

	return selection, options, "menu_settings_lens_quality", default_option
end
OptionsView.cb_lens_quality_saved_value = function (self, widget)
	local lens_quality_enabled = assigned(self.changed_render_settings.lens_quality_enabled, Application.user_setting("render_settings", "lens_quality_enabled")) or false
	widget.content.current_selection = (lens_quality_enabled and 2) or 1

	return 
end
OptionsView.cb_lens_quality = function (self, content, called_from_graphics_quality)
	local options_values = content.options_values
	local current_selection = content.current_selection
	self.changed_render_settings.lens_quality_enabled = options_values[current_selection]

	if not called_from_graphics_quality then
		self.force_set_widget_value(self, "graphics_quality_settings", "custom")
	end

	return 
end
OptionsView.cb_skin_shading_setup = function (self)
	local options = {
		{
			value = false,
			text = Localize("menu_settings_off")
		},
		{
			value = true,
			text = Localize("menu_settings_on")
		}
	}
	local skin_material_enabled = Application.user_setting("render_settings", "skin_material_enabled") or false
	local default_value = DefaultUserSettings.get("render_settings", "skin_material_enabled")
	local selection = (skin_material_enabled and 2) or 1
	local default_option = (default_value and 2) or 1

	return selection, options, "menu_settings_skin_shading", default_option
end
OptionsView.cb_skin_shading_saved_value = function (self, widget)
	local skin_material_enabled = assigned(self.changed_render_settings.skin_material_enabled, Application.user_setting("render_settings", "skin_material_enabled")) or false
	widget.content.current_selection = (skin_material_enabled and 2) or 1

	return 
end
OptionsView.cb_skin_shading = function (self, content, called_from_graphics_quality)
	local options_values = content.options_values
	local current_selection = content.current_selection
	self.changed_render_settings.skin_material_enabled = options_values[current_selection]

	if not called_from_graphics_quality then
		self.force_set_widget_value(self, "graphics_quality_settings", "custom")
	end

	return 
end
OptionsView.cb_ssao_setup = function (self)
	local options = {
		{
			value = "off",
			text = Localize("menu_settings_off")
		},
		{
			value = "medium",
			text = Localize("menu_settings_medium")
		},
		{
			value = "high",
			text = Localize("menu_settings_high")
		},
		{
			value = "extreme",
			text = Localize("menu_settings_extreme")
		}
	}
	local ao_quality = Application.user_setting("ao_quality")
	local default_value = DefaultUserSettings.get("user_settings", "ao_quality")
	local selected_option = 1
	local default_option = nil

	for i = 1, #options, 1 do
		if options[i].value == ao_quality then
			selected_option = i
		end

		if default_value == options[i].value then
			default_option = i
		end
	end

	return selected_option, options, "menu_settings_ssao", default_option
end
OptionsView.cb_ssao_saved_value = function (self, widget)
	local ao_quality = assigned(self.changed_user_settings.ao_quality, Application.user_setting("ao_quality"))
	local options_values = widget.content.options_values
	local selected_option = 1

	for i = 1, #options_values, 1 do
		if ao_quality == options_values[i] then
			selected_option = i
		end
	end

	widget.content.current_selection = selected_option

	return 
end
OptionsView.cb_ssao = function (self, content, called_from_graphics_quality)
	local value = content.options_values[content.current_selection]
	self.changed_user_settings.ao_quality = value
	local ao_quality_settings = AmbientOcclusionQuality[value]

	for setting, key in pairs(ao_quality_settings) do
		self.changed_render_settings[setting] = key
	end

	if not called_from_graphics_quality then
		self.force_set_widget_value(self, "graphics_quality_settings", "custom")
	end

	return 
end
OptionsView.cb_char_texture_quality_setup = function (self)
	local options = {
		{
			value = "low",
			text = Localize("menu_settings_low")
		},
		{
			value = "medium",
			text = Localize("menu_settings_medium")
		},
		{
			value = "high",
			text = Localize("menu_settings_high")
		}
	}
	local char_texture_quality = Application.user_setting("char_texture_quality")
	local default_value = DefaultUserSettings.get("user_settings", "char_texture_quality")
	local selected_option = 1
	local default_option = nil

	for i = 1, #options, 1 do
		if char_texture_quality == options[i].value then
			selected_option = i
		end

		if default_value == options[i].value then
			default_option = i
		end
	end

	return selected_option, options, "menu_settings_char_texture_quality", default_option
end
OptionsView.cb_char_texture_quality_saved_value = function (self, widget)
	local char_texture_quality = assigned(self.changed_user_settings.char_texture_quality, Application.user_setting("char_texture_quality"))
	local options_values = widget.content.options_values
	local selected_option = 1

	for i = 1, #options_values, 1 do
		if char_texture_quality == options_values[i] then
			selected_option = i
		end
	end

	widget.content.current_selection = selected_option

	print("OptionsView:cb_char_texture_quality_saved_value", selected_option, char_texture_quality)

	return 
end
OptionsView.cb_char_texture_quality = function (self, content, called_from_graphics_quality)
	local value = content.options_values[content.current_selection]
	self.changed_user_settings.char_texture_quality = value

	if not called_from_graphics_quality then
		self.force_set_widget_value(self, "graphics_quality_settings", "custom")
	end

	return 
end
OptionsView.cb_env_texture_quality_setup = function (self)
	local options = {
		{
			value = "low",
			text = Localize("menu_settings_low")
		},
		{
			value = "medium",
			text = Localize("menu_settings_medium")
		},
		{
			value = "high",
			text = Localize("menu_settings_high")
		}
	}
	local env_texture_quality = Application.user_setting("env_texture_quality")
	local default_value = DefaultUserSettings.get("user_settings", "env_texture_quality")
	local selected_option = 1
	local default_option = nil

	for i = 1, #options, 1 do
		if env_texture_quality == options[i].value then
			selected_option = i
		end

		if default_value == options[i].value then
			default_option = i
		end
	end

	return selected_option, options, "menu_settings_env_texture_quality", default_option
end
OptionsView.cb_env_texture_quality_saved_value = function (self, widget)
	local env_texture_quality = assigned(self.changed_user_settings.env_texture_quality, Application.user_setting("env_texture_quality"))
	local options_values = widget.content.options_values
	local selected_option = 1

	for i = 1, #options_values, 1 do
		if env_texture_quality == options_values[i] then
			selected_option = i
		end
	end

	widget.content.current_selection = selected_option

	print("OptionsView:cb_env_texture_quality_saved_value", selected_option, env_texture_quality)

	return 
end
OptionsView.cb_env_texture_quality = function (self, content, called_from_graphics_quality)
	local value = content.options_values[content.current_selection]
	self.changed_user_settings.env_texture_quality = value

	if not called_from_graphics_quality then
		self.force_set_widget_value(self, "graphics_quality_settings", "custom")
	end

	return 
end
OptionsView.cb_subtitles_setup = function (self)
	local options = {
		{
			value = false,
			text = Localize("menu_settings_off")
		},
		{
			value = true,
			text = Localize("menu_settings_on")
		}
	}
	local use_subtitles = Application.user_setting("use_subtitles") or false
	local selection = (use_subtitles and 2) or 1
	local default_value = (DefaultUserSettings.get("user_settings", "use_subtitles") and 2) or 1

	return selection, options, "menu_settings_subtitles", default_value
end
OptionsView.cb_subtitles_saved_value = function (self, widget)
	local use_subtitles = assigned(self.changed_user_settings.use_subtitles, Application.user_setting("use_subtitles")) or false
	widget.content.current_selection = (use_subtitles and 2) or 1

	return 
end
OptionsView.cb_subtitles = function (self, content)
	local options_values = content.options_values
	local current_selection = content.current_selection
	self.changed_user_settings.use_subtitles = options_values[current_selection]

	return 
end
OptionsView.cb_language_setup = function (self)
	local options = {
		{
			value = "en",
			text = Localize("english")
		},
		{
			value = "fr",
			text = Localize("french")
		},
		{
			value = "pl",
			text = Localize("polish")
		},
		{
			value = "es",
			text = Localize("spanish")
		},
		{
			value = "tr",
			text = Localize("turkish")
		},
		{
			value = "de",
			text = Localize("german")
		},
		{
			value = "br-pt",
			text = Localize("brazilian")
		},
		{
			value = "ru",
			text = Localize("russian")
		}
	}
	local language_id = Application.user_setting("language_id") or (rawget(_G, "Steam") and Steam.language()) or "en"
	local default_value = DefaultUserSettings.get("user_settings", "language_id") or "en"
	local selection = 1

	for idx, option in ipairs(options) do
		if option.value == language_id then
			selection = idx
		end

		if option.value == default_value then
			default_value = idx
		end
	end

	return selection, options, "menu_settings_language", default_value
end
OptionsView.cb_language_saved_value = function (self, widget)
	local language_id = assigned(self.changed_user_settings.language_id, Application.user_setting("language_id")) or "en"
	local options_values = widget.content.options_values
	local selected_option = 1

	for i = 1, #options_values, 1 do
		if language_id == options_values[i] then
			selected_option = i
		end
	end

	widget.content.current_selection = selected_option

	return 
end
OptionsView.cb_language = function (self, content)
	local options_values = content.options_values
	local current_selection = content.current_selection
	self.changed_user_settings.language_id = options_values[current_selection]

	return 
end
OptionsView.reload_language = function (self, language_id)
	if Managers.package:has_loaded("resource_packages/strings", "boot") then
		Managers.package:unload("resource_packages/strings", "boot")
	end

	Application.set_resource_property_preference_order(language_id)
	Managers.package:load("resource_packages/strings", "boot")
	Managers.package:load("resource_packages/post_localization_boot", "boot")

	Managers.localizer = LocalizationManager:new("localization/game", language_id)

	local function tweak_parser(tweak_name)
		return LocalizerTweakData[tweak_name] or "<missing LocalizerTweakData \"" .. tweak_name .. "\">"
	end

	Managers.localizer:add_macro("TWEAK", tweak_parser)

	local function key_parser(input_service_and_key_name)
		local split_start, split_end = string.find(input_service_and_key_name, "__")

		assert(split_start and split_end, "[key_parser] You need to specify a key using this format $KEY;<input_service>__<key>. Example: $KEY;options_menu__back (note the dubbel underline separating input service and key")

		local input_service_name = string.sub(input_service_and_key_name, 1, split_start - 1)
		local key_name = string.sub(input_service_and_key_name, split_end + 1)
		local input_service = Managers.input:get_service(input_service_name)

		fassert(input_service, "[key_parser] No input service with the name %s", input_service_name)

		local key = input_service.get_keymapping(input_service, key_name)

		fassert(key, "[key_parser] There is no such key: %s in input service: %s", key_name, input_service_name)

		local device = Managers.input:get_most_recent_device()
		local device_type = InputAux.get_device_type(device)
		local button_index = nil

		for _, mapping in ipairs(key.input_mappings) do
			if mapping[1] == device_type then
				button_index = mapping[2]

				break
			end
		end

		local key_locale_name = nil

		if button_index then
			key_locale_name = device.button_name(button_index)

			if device_type == "keyboard" and not device.button_locale_name(button_index) then
			end

			if device_type == "mouse" then
				key_locale_name = string.format("%s %s", "mouse", key_locale_name)
			end
		else
			local button_index = nil
			local default_device_type = "keyboard"

			for _, mapping in ipairs(key.input_mappings) do
				if mapping[1] == default_device_type then
					button_index = mapping[2]

					break
				end
			end

			if button_index then
				key_locale_name = Keyboard.button_name(button_index)

				if not Keyboard.button_locale_name(button_index) then
				end
			else
				key_locale_name = Localize(unassigned_keymap)
			end
		end

		return key_locale_name
	end

	Managers.localizer:add_macro("KEY", key_parser)

	return 
end
OptionsView.cb_mouse_look_sensitivity_setup = function (self)
	local min = -10
	local max = 10
	local sensitivity = Application.user_setting("mouse_look_sensitivity") or 0
	local default_value = DefaultUserSettings.get("user_settings", "mouse_look_sensitivity")
	local value = get_slider_value(min, max, sensitivity)
	sensitivity = math.clamp(sensitivity, min, max)
	local platform_key = "win32"
	local base_filter = InputUtils.get_platform_filters(PlayerControllerFilters, platform_key)
	local base_look_multiplier = base_filter.look.multiplier
	local input_service = self.input_manager:get_service("Player")
	local input_filters = input_service.get_active_filters(input_service, platform_key)
	local look_filter = input_filters.look
	local function_data = look_filter.function_data
	function_data.multiplier = base_look_multiplier*0.85^(-sensitivity)

	return value, min, max, 1, "menu_settings_mouse_look_sensitivity", default_value
end
OptionsView.cb_mouse_look_sensitivity_saved_value = function (self, widget)
	local content = widget.content
	local min = content.min
	local max = content.max
	local sensitivity = assigned(self.changed_user_settings.mouse_look_sensitivity, Application.user_setting("mouse_look_sensitivity")) or 0
	sensitivity = math.clamp(sensitivity, min, max)
	content.internal_value = get_slider_value(min, max, sensitivity)
	content.value = sensitivity

	return 
end
OptionsView.cb_mouse_look_sensitivity = function (self, content)
	self.changed_user_settings.mouse_look_sensitivity = content.value

	return 
end
OptionsView.cb_ui_scale_setup = function (self)
	local min = 70
	local max = 100
	local ui_scale = Application.user_setting("ui_scale") or 100
	local value = get_slider_value(min, max, ui_scale)
	local default_value = math.clamp(DefaultUserSettings.get("user_settings", "ui_scale"), min, max)

	return value, min, max, 0, "settings_menu_ui_scale", default_value
end
OptionsView.cb_ui_scale_saved_value = function (self, widget)
	local content = widget.content
	local min = content.min
	local max = content.max
	local ui_scale = assigned(self.changed_user_settings.ui_scale, Application.user_setting("ui_scale")) or 100
	ui_scale = math.clamp(ui_scale, min, max)
	content.internal_value = get_slider_value(min, max, ui_scale)
	content.value = ui_scale

	return 
end
OptionsView.cb_ui_scale = function (self, content)
	local value = content.value
	self.changed_user_settings.ui_scale = value
	UISettings.ui_scale = value

	print("cb_ui_scale", value)

	local force_update = true

	UPDATE_RESOLUTION_LOOKUP(force_update)
	self._setup_text_buttons_width(self)

	return 
end
OptionsView.cb_gamepad_look_sensitivity_setup = function (self)
	local min = -10
	local max = 10
	local sensitivity = Application.user_setting("gamepad_look_sensitivity") or 0
	local default_value = DefaultUserSettings.get("user_settings", "gamepad_look_sensitivity")
	local value = get_slider_value(min, max, sensitivity)
	sensitivity = math.clamp(sensitivity, min, max)
	local platform_key = (self.platform == "win32" and "xb1") or self.platform
	local base_filter = InputUtils.get_platform_filters(PlayerControllerFilters, platform_key)
	local base_look_multiplier = base_filter.look_controller.multiplier_x
	local base_melee_look_multiplier = base_filter.look_controller_melee.multiplier_x
	local base_ranged_look_multiplier = base_filter.look_controller_ranged.multiplier_x
	local input_service = self.input_manager:get_service("Player")
	local input_filters = input_service.get_active_filters(input_service, platform_key)
	local look_filter = input_filters.look_controller
	local function_data = look_filter.function_data
	function_data.multiplier_x = base_look_multiplier*0.85^(-sensitivity)
	function_data.min_multiplier_x = (base_filter.look_controller.multiplier_min_x and base_filter.look_controller.multiplier_min_x*0.85^(-sensitivity)) or function_data.multiplier_x*0.25
	local melee_look_filter = input_filters.look_controller_melee
	local function_data = melee_look_filter.function_data
	function_data.multiplier_x = base_melee_look_multiplier*0.85^(-sensitivity)
	function_data.min_multiplier_x = (base_filter.look_controller_melee.multiplier_min_x and base_filter.look_controller_melee.multiplier_min_x*0.85^(-sensitivity)) or function_data.multiplier_x*0.25
	local ranged_look_filter = input_filters.look_controller_ranged
	local function_data = ranged_look_filter.function_data
	function_data.multiplier_x = base_ranged_look_multiplier*0.85^(-sensitivity)
	function_data.min_multiplier_x = (base_filter.look_controller_ranged.multiplier_min_x and base_filter.look_controller_ranged.multiplier_min_x*0.85^(-sensitivity)) or function_data.multiplier_x*0.25

	return value, min, max, 1, "menu_settings_gamepad_look_sensitivity", default_value
end
OptionsView.cb_gamepad_look_sensitivity_saved_value = function (self, widget)
	local content = widget.content
	local min = content.min
	local max = content.max
	local sensitivity = assigned(self.changed_user_settings.gamepad_look_sensitivity, Application.user_setting("gamepad_look_sensitivity")) or 0
	sensitivity = math.clamp(sensitivity, min, max)
	content.internal_value = get_slider_value(min, max, sensitivity)
	content.value = sensitivity

	return 
end
OptionsView.cb_gamepad_look_sensitivity = function (self, content)
	self.changed_user_settings.gamepad_look_sensitivity = content.value

	return 
end
OptionsView.cb_gamepad_look_sensitivity_y_setup = function (self)
	local min = -10
	local max = 10
	local sensitivity = Application.user_setting("gamepad_look_sensitivity_y") or 0
	local default_value = DefaultUserSettings.get("user_settings", "gamepad_look_sensitivity_y")
	local value = get_slider_value(min, max, sensitivity)
	sensitivity = math.clamp(sensitivity, min, max)
	local platform_key = (self.platform == "win32" and "xb1") or self.platform
	local base_filter = InputUtils.get_platform_filters(PlayerControllerFilters, platform_key)
	local base_look_multiplier = base_filter.look_controller.multiplier_y
	local base_melee_look_multiplier = base_filter.look_controller_melee.multiplier_y
	local base_ranged_look_multiplier = base_filter.look_controller_ranged.multiplier_y
	local input_service = self.input_manager:get_service("Player")
	local input_filters = input_service.get_active_filters(input_service, platform_key)
	local look_filter = input_filters.look_controller
	local function_data = look_filter.function_data
	function_data.multiplier_y = base_look_multiplier*0.85^(-sensitivity)
	local melee_look_filter = input_filters.look_controller_melee
	local function_data = melee_look_filter.function_data
	function_data.multiplier_y = base_melee_look_multiplier*0.85^(-sensitivity)
	local ranged_look_filter = input_filters.look_controller_ranged
	local function_data = ranged_look_filter.function_data
	function_data.multiplier_y = base_ranged_look_multiplier*0.85^(-sensitivity)

	return value, min, max, 1, "menu_settings_gamepad_look_sensitivity_y", default_value
end
OptionsView.cb_gamepad_look_sensitivity_y_saved_value = function (self, widget)
	local content = widget.content
	local min = content.min
	local max = content.max
	local sensitivity = assigned(self.changed_user_settings.gamepad_look_sensitivity_y, Application.user_setting("gamepad_look_sensitivity_y")) or 0
	sensitivity = math.clamp(sensitivity, min, max)
	content.internal_value = get_slider_value(min, max, sensitivity)
	content.value = sensitivity

	return 
end
OptionsView.cb_gamepad_look_sensitivity_y = function (self, content)
	self.changed_user_settings.gamepad_look_sensitivity_y = content.value

	return 
end
OptionsView.cb_gamepad_zoom_sensitivity_setup = function (self)
	local min = -10
	local max = 10
	local sensitivity = Application.user_setting("gamepad_zoom_sensitivity") or 0
	local default_value = DefaultUserSettings.get("user_settings", "gamepad_zoom_sensitivity")
	local value = get_slider_value(min, max, sensitivity)
	sensitivity = math.clamp(sensitivity, min, max)
	local platform_key = (self.platform == "win32" and "xb1") or self.platform
	local base_filter = InputUtils.get_platform_filters(PlayerControllerFilters, platform_key)
	local base_look_multiplier = base_filter.look_controller_zoom.multiplier_x
	local input_service = self.input_manager:get_service("Player")
	local input_filters = input_service.get_active_filters(input_service, platform_key)
	local look_filter = input_filters.look_controller_zoom
	local function_data = look_filter.function_data
	function_data.multiplier_x = base_look_multiplier*0.85^(-sensitivity)
	function_data.min_multiplier_x = (base_filter.look_controller_zoom.multiplier_min_x and base_filter.look_controller_zoom.multiplier_min_x*0.85^(-sensitivity)) or function_data.multiplier_x*0.25

	return value, min, max, 1, "menu_settings_gamepad_zoom_sensitivity", default_value
end
OptionsView.cb_gamepad_zoom_sensitivity_saved_value = function (self, widget)
	local content = widget.content
	local min = content.min
	local max = content.max
	local sensitivity = assigned(self.changed_user_settings.gamepad_zoom_sensitivity, Application.user_setting("gamepad_zoom_sensitivity")) or 0
	sensitivity = math.clamp(sensitivity, min, max)
	content.internal_value = get_slider_value(min, max, sensitivity)
	content.value = sensitivity

	return 
end
OptionsView.cb_gamepad_zoom_sensitivity = function (self, content)
	self.changed_user_settings.gamepad_zoom_sensitivity = content.value

	return 
end
OptionsView.cb_gamepad_zoom_sensitivity_y_setup = function (self)
	local min = -10
	local max = 10
	local sensitivity = Application.user_setting("gamepad_zoom_sensitivity_y") or 0
	local default_value = DefaultUserSettings.get("user_settings", "gamepad_zoom_sensitivity_y")
	local value = get_slider_value(min, max, sensitivity)
	sensitivity = math.clamp(sensitivity, min, max)
	local platform_key = (self.platform == "win32" and "xb1") or self.platform
	local base_filter = InputUtils.get_platform_filters(PlayerControllerFilters, platform_key)
	local base_look_multiplier = base_filter.look_controller_zoom.multiplier_y
	local input_service = self.input_manager:get_service("Player")
	local input_filters = input_service.get_active_filters(input_service, platform_key)
	local look_filter = input_filters.look_controller_zoom
	local function_data = look_filter.function_data
	function_data.multiplier_y = base_look_multiplier*0.85^(-sensitivity)

	return value, min, max, 1, "menu_settings_gamepad_zoom_sensitivity_y", default_value
end
OptionsView.cb_gamepad_zoom_sensitivity_y_saved_value = function (self, widget)
	local content = widget.content
	local min = content.min
	local max = content.max
	local sensitivity = assigned(self.changed_user_settings.gamepad_zoom_sensitivity_y, Application.user_setting("gamepad_zoom_sensitivity_y")) or 0
	sensitivity = math.clamp(sensitivity, min, max)
	content.internal_value = get_slider_value(min, max, sensitivity)
	content.value = sensitivity

	return 
end
OptionsView.cb_gamepad_zoom_sensitivity_y = function (self, content)
	self.changed_user_settings.gamepad_zoom_sensitivity_y = content.value

	return 
end
OptionsView.cb_max_upload_speed = function (self, content)
	local options_values = content.options_values
	local current_selection = content.current_selection
	self.changed_user_settings.max_upload_speed = options_values[current_selection]

	return 
end
OptionsView.cb_max_upload_speed_setup = function (self)
	local options = {
		{
			value = 256,
			text = Localize("menu_settings_256kbit")
		},
		{
			value = 512,
			text = Localize("menu_settings_512kbit")
		},
		{
			value = 1024,
			text = Localize("menu_settings_1mbit")
		},
		{
			value = 2048,
			text = Localize("menu_settings_2mbit_plus")
		}
	}
	local default_value = DefaultUserSettings.get("user_settings", "max_upload_speed")
	local user_settings_value = Application.user_setting("max_upload_speed")
	local default_option, selected_option = nil

	for i, option in ipairs(options) do
		if option.value == user_settings_value then
			selected_option = i
		end

		if option.value == default_value then
			default_option = i
		end
	end

	fassert(default_option, "default option %i does not exist in cb_max_upload_speed_setup options table", default_value)

	return selected_option or default_option, options, "menu_settings_max_upload", default_option
end
OptionsView.cb_max_upload_speed_saved_value = function (self, widget)
	local value = assigned(self.changed_user_settings.max_upload_speed, Application.user_setting("max_upload_speed")) or DefaultUserSettings.get("user_settings", "max_upload_speed")
	local options_values = widget.content.options_values
	local selected_option = 1

	for i = 1, #options_values, 1 do
		if value == options_values[i] then
			selected_option = i

			break
		end
	end

	widget.content.current_selection = selected_option

	return 
end
OptionsView.cb_mouse_look_invert_y_setup = function (self)
	local options = {
		{
			value = false,
			text = Localize("menu_settings_off")
		},
		{
			value = true,
			text = Localize("menu_settings_on")
		}
	}
	local default_value = DefaultUserSettings.get("user_settings", "mouse_look_invert_y")
	local invert_mouse_y = Application.user_setting("mouse_look_invert_y")
	local input_service = self.input_manager:get_service("Player")
	local platform_key = "win32"
	local input_filters = input_service.get_active_filters(input_service, platform_key)
	local look_filter = input_filters.look
	local function_data = look_filter.function_data
	function_data.filter_type = (invert_mouse_y and "scale_vector3") or "scale_vector3_invert_y"
	local selection = (invert_mouse_y and 2) or 1
	local default_option = (default_value and 2) or 1

	return selection, options, "menu_settings_mouse_look_invert_y", default_option
end
OptionsView.cb_mouse_look_invert_y_saved_value = function (self, widget)
	local invert_mouse_y = assigned(self.changed_user_settings.mouse_look_invert_y, Application.user_setting("mouse_look_invert_y")) or false
	widget.content.current_selection = (invert_mouse_y and 2) or 1

	return 
end
OptionsView.cb_mouse_look_invert_y = function (self, content)
	local options_values = content.options_values
	local current_selection = content.current_selection
	self.changed_user_settings.mouse_look_invert_y = options_values[current_selection]

	return 
end
OptionsView.cb_gamepad_look_invert_y_setup = function (self)
	local options = {
		{
			value = false,
			text = Localize("menu_settings_off")
		},
		{
			value = true,
			text = Localize("menu_settings_on")
		}
	}
	local default_value = DefaultUserSettings.get("user_settings", "gamepad_look_invert_y") or false
	local invert_gamepad_y = Application.user_setting("gamepad_look_invert_y")
	local input_service = self.input_manager:get_service("Player")
	local platform_key = (self.platform == "win32" and "xb1") or self.platform
	local input_filters = input_service.get_active_filters(input_service, platform_key)
	local look_filter = input_filters.look_controller
	local function_data = look_filter.function_data
	function_data.filter_type = (invert_gamepad_y and "scale_vector3_xy_accelerated_x_inverted") or "scale_vector3_xy_accelerated_x"
	local look_filter = input_filters.look_controller_ranged
	local function_data = look_filter.function_data
	function_data.filter_type = (invert_gamepad_y and "scale_vector3_xy_accelerated_x_inverted") or "scale_vector3_xy_accelerated_x"
	local look_filter = input_filters.look_controller_melee
	local function_data = look_filter.function_data
	function_data.filter_type = (invert_gamepad_y and "scale_vector3_xy_accelerated_x_inverted") or "scale_vector3_xy_accelerated_x"
	local look_filter = input_filters.look_controller_zoom
	local function_data = look_filter.function_data
	function_data.filter_type = (invert_gamepad_y and "scale_vector3_xy_accelerated_x_inverted") or "scale_vector3_xy_accelerated_x"
	local selection = (invert_gamepad_y and 2) or 1
	local default_option = (default_value and 2) or 1

	return selection, options, "menu_settings_gamepad_look_invert_y", default_option
end
OptionsView.cb_gamepad_look_invert_y_saved_value = function (self, widget)
	local invert_gamepad_y = assigned(self.changed_user_settings.gamepad_look_invert_y, Application.user_setting("gamepad_look_invert_y")) or false
	widget.content.current_selection = (invert_gamepad_y and 2) or 1

	return 
end
OptionsView.cb_gamepad_look_invert_y = function (self, content)
	local options_values = content.options_values
	local current_selection = content.current_selection
	self.changed_user_settings.gamepad_look_invert_y = options_values[current_selection]

	return 
end
OptionsView.cb_gamepad_auto_aim_enabled_setup = function (self)
	local options = {
		{
			value = true,
			text = Localize("menu_settings_on")
		},
		{
			value = false,
			text = Localize("menu_settings_off")
		}
	}
	local default_value = DefaultUserSettings.get("user_settings", "gamepad_auto_aim_enabled") or true
	local enable_auto_aim = Application.user_setting("gamepad_auto_aim_enabled")
	local selection = (enable_auto_aim and 1) or 2
	local default_option = (default_value and 1) or 2

	return selection, options, "menu_settings_gamepad_auto_aim_enabled", default_option
end
OptionsView.cb_gamepad_auto_aim_enabled_saved_value = function (self, widget)
	local gamepad_auto_aim_enabled = assigned(self.changed_user_settings.gamepad_auto_aim_enabled, Application.user_setting("gamepad_auto_aim_enabled"))
	widget.content.current_selection = (gamepad_auto_aim_enabled and 1) or 2

	return 
end
OptionsView.cb_gamepad_auto_aim_enabled = function (self, content)
	local options_values = content.options_values
	local current_selection = content.current_selection
	self.changed_user_settings.gamepad_auto_aim_enabled = options_values[current_selection]

	return 
end
OptionsView.cb_gamepad_rumble_enabled_setup = function (self)
	local options = {
		{
			value = true,
			text = Localize("menu_settings_on")
		},
		{
			value = false,
			text = Localize("menu_settings_off")
		}
	}
	local default_value = DefaultUserSettings.get("user_settings", "gamepad_rumble_enabled") or true
	local enable_rumble = Application.user_setting("gamepad_rumble_enabled")
	local selection = (enable_rumble and 1) or 2
	local default_option = (default_value and 1) or 2

	return selection, options, "menu_settings_gamepad_rumble_enabled", default_option
end
OptionsView.cb_gamepad_rumble_enabled_saved_value = function (self, widget)
	local gamepad_rumble_enabled = assigned(self.changed_user_settings.gamepad_rumble_enabled, Application.user_setting("gamepad_rumble_enabled"))
	widget.content.current_selection = (gamepad_rumble_enabled and 1) or 2

	return 
end
OptionsView.cb_gamepad_rumble_enabled = function (self, content)
	local options_values = content.options_values
	local current_selection = content.current_selection
	self.changed_user_settings.gamepad_rumble_enabled = options_values[current_selection]

	return 
end
OptionsView.cb_gamepad_use_ps4_style_input_icons_setup = function (self)
	local options = {
		{
			value = false,
			text = Localize("menu_settings_xb1_input_icons")
		},
		{
			value = true,
			text = Localize("menu_settings_ps4_input_icons")
		}
	}
	local default_value = DefaultUserSettings.get("user_settings", "gamepad_use_ps4_style_input_icons") or false
	local use_ps4_style_icons = Application.user_setting("gamepad_use_ps4_style_input_icons")
	local selection = (use_ps4_style_icons and 2) or 1
	local default_option = (default_value and 2) or 1

	return selection, options, "menu_settings_gamepad_use_ps4_style_input_icons", default_option
end
OptionsView.cb_gamepad_use_ps4_style_input_icons_saved_value = function (self, widget)
	local gamepad_use_ps4_style_input_icons = assigned(self.changed_user_settings.gamepad_use_ps4_style_input_icons, Application.user_setting("gamepad_use_ps4_style_input_icons"))
	widget.content.current_selection = (gamepad_use_ps4_style_input_icons and 2) or 1

	return 
end
OptionsView.cb_gamepad_use_ps4_style_input_icons = function (self, content)
	local options_values = content.options_values
	local current_selection = content.current_selection
	self.changed_user_settings.gamepad_use_ps4_style_input_icons = options_values[current_selection]
	local gamepad_layout_widget = self.gamepad_layout_widget
	local gamepad_use_ps4_style_input_icons = assigned(self.changed_user_settings.gamepad_use_ps4_style_input_icons, Application.user_setting("gamepad_use_ps4_style_input_icons"))
	gamepad_layout_widget.content.use_texture2_layout = gamepad_use_ps4_style_input_icons

	return 
end
OptionsView.cb_gamepad_layout_setup = function (self)
	local options = AlternatateGamepadKeymapsOptionsMenu
	local default_value = DefaultUserSettings.get("user_settings", "gamepad_layout") or "default"
	local gamepad_layout = Application.user_setting("gamepad_layout")
	local selected_option = 1
	local default_option = nil

	for i = 1, #options, 1 do
		local option = options[i]

		if gamepad_layout == option.value then
			selected_option = i
		end

		if default_value == option.value then
			default_option = i
		end

		if not option.localized then
			option.localized = true
			option.text = Localize(option.text)
		end
	end

	return selected_option, options, "menu_settings_gamepad_layout", default_option
end
OptionsView.cb_gamepad_layout_saved_value = function (self, widget)
	local gamepad_layout = assigned(self.changed_user_settings.gamepad_layout, Application.user_setting("gamepad_layout"))
	local options_values = widget.content.options_values
	local selected_option = 1

	for i = 1, #options_values, 1 do
		if gamepad_layout == options_values[i] then
			selected_option = i
		end
	end

	widget.content.current_selection = selected_option

	return 
end
OptionsView.cb_gamepad_layout = function (self, content)
	local value = content.options_values[content.current_selection]
	self.changed_user_settings.gamepad_layout = value
	local using_left_handed_option = assigned(self.changed_user_settings.gamepad_left_handed, Application.user_setting("gamepad_left_handed"))
	local gamepad_keymaps_layout = nil

	if using_left_handed_option then
		gamepad_keymaps_layout = AlternatateGamepadKeymapsLayoutsLeftHanded
	else
		gamepad_keymaps_layout = AlternatateGamepadKeymapsLayouts
	end

	local gamepad_keymaps = gamepad_keymaps_layout[value]

	self.update_gamepad_layout_widget(self, gamepad_keymaps, using_left_handed_option)

	return 
end
OptionsView.using_left_handed_gamepad_layout = function (self)
	local default_left_handed_option = Application.user_setting("gamepad_left_handed")
	local changed_left_handed_option = self.changed_user_settings.gamepad_left_handed
	local using_left_handed_option = nil

	if changed_left_handed_option ~= nil then
		using_left_handed_option = changed_left_handed_option
	else
		using_left_handed_option = default_left_handed_option
	end

	return using_left_handed_option
end
OptionsView.cb_gamepad_left_handed_enabled_setup = function (self)
	local options = {
		{
			value = true,
			text = Localize("menu_settings_on")
		},
		{
			value = false,
			text = Localize("menu_settings_off")
		}
	}
	local default_value = DefaultUserSettings.get("user_settings", "gamepad_left_handed") or false
	local enable_left_handed = Application.user_setting("gamepad_left_handed")
	local selection = (enable_left_handed and 1) or 2
	local default_option = (default_value and 1) or 2

	return selection, options, "menu_settings_gamepad_left_handed_enabled", default_option
end
OptionsView.cb_gamepad_left_handed_enabled_saved_value = function (self, widget)
	local gamepad_left_handed = assigned(self.changed_user_settings.gamepad_left_handed, Application.user_setting("gamepad_left_handed"))
	widget.content.current_selection = (gamepad_left_handed and 1) or 2

	return 
end
OptionsView.cb_gamepad_left_handed_enabled = function (self, content)
	local options_values = content.options_values
	local current_selection = content.current_selection
	self.changed_user_settings.gamepad_left_handed = options_values[current_selection]
	local gamepad_layout = assigned(self.changed_user_settings.gamepad_layout, Application.user_setting("gamepad_layout"))

	self.force_set_widget_value(self, "gamepad_layout", gamepad_layout)

	return 
end
OptionsView.cb_toggle_crouch_setup = function (self)
	local options = {
		{
			value = true,
			text = Localize("menu_settings_on")
		},
		{
			value = false,
			text = Localize("menu_settings_off")
		}
	}
	local default_value = DefaultUserSettings.get("user_settings", "toggle_crouch")
	local toggle_crouch = Application.user_setting("toggle_crouch")
	local selection = (toggle_crouch and 1) or 2
	local default_option = (default_value and 1) or 2

	return selection, options, "menu_settings_toggle_crouch", default_option
end
OptionsView.cb_toggle_crouch_saved_value = function (self, widget)
	local toggle_crouch = assigned(self.changed_user_settings.toggle_crouch, Application.user_setting("toggle_crouch"))
	widget.content.current_selection = (toggle_crouch and 1) or 2

	return 
end
OptionsView.cb_toggle_crouch = function (self, content)
	local options_values = content.options_values
	local current_selection = content.current_selection
	self.changed_user_settings.toggle_crouch = options_values[current_selection]

	return 
end
OptionsView.cb_toggle_stationary_dodge_setup = function (self)
	local options = {
		{
			value = true,
			text = Localize("menu_settings_on")
		},
		{
			value = false,
			text = Localize("menu_settings_off")
		}
	}
	local default_value = DefaultUserSettings.get("user_settings", "toggle_stationary_dodge")
	local toggle_stationary_dodge = Application.user_setting("toggle_stationary_dodge")
	local selection = (toggle_stationary_dodge and 1) or 2
	local default_option = (default_value and 1) or 2

	return selection, options, "menu_settings_toggle_stationary_dodge", default_option
end
OptionsView.cb_toggle_stationary_dodge_saved_value = function (self, widget)
	local toggle_stationary_dodge = assigned(self.changed_user_settings.toggle_stationary_dodge, Application.user_setting("toggle_stationary_dodge"))
	widget.content.current_selection = (toggle_stationary_dodge and 1) or 2

	return 
end
OptionsView.cb_toggle_stationary_dodge = function (self, content)
	local options_values = content.options_values
	local current_selection = content.current_selection
	self.changed_user_settings.toggle_stationary_dodge = options_values[current_selection]

	return 
end
OptionsView.cb_matchmaking_region_setup = function (self)
	local temp = {}

	for region_type, regions in pairs(MatchmakingRegions) do
		for region, _ in pairs(regions) do
			temp[region] = true
		end
	end

	local options = {
		{
			value = "auto",
			text = Localize("menu_settings_auto")
		}
	}

	for region, _ in pairs(temp) do
		options[#options + 1] = {
			text = Localize(region),
			value = region
		}
	end

	local default_value = DefaultUserSettings.get("user_settings", "matchmaking_region")
	local saved_value = Application.user_setting("matchmaking_region")
	local default_option = 1
	local selected_option = 1

	for i, option in ipairs(options) do
		if option.value == saved_value then
			selected_option = i

			break
		end
	end

	return selected_option, options, "menu_settings_matchmaking_region", default_option
end
OptionsView.cb_matchmaking_region_saved_value = function (self, widget)
	local matchmaking_region = assigned(self.changed_user_settings.matchmaking_region, Application.user_setting("matchmaking_region"))
	local current_selection = 1

	for i, value in ipairs(widget.content.options_values) do
		if value == matchmaking_region then
			current_selection = i

			break
		end
	end

	widget.content.current_selection = current_selection

	return 
end
OptionsView.cb_matchmaking_region = function (self, content)
	local selected_index = content.current_selection
	local options_values = content.options_values
	local value = options_values[selected_index]
	self.changed_user_settings.matchmaking_region = value

	return 
end
OptionsView.cb_overcharge_opacity_setup = function (self)
	local min = 0
	local max = 100
	local overcharge_opacity = Application.user_setting("overcharge_opacity") or DefaultUserSettings.get("user_settings", "overcharge_opacity")
	local default_value = DefaultUserSettings.get("user_settings", "overcharge_opacity")
	local value = get_slider_value(min, max, overcharge_opacity)

	return value, min, max, 0, "menu_settings_overcharge_opacity", default_value
end
OptionsView.cb_overcharge_opacity_saved_value = function (self, widget)
	local content = widget.content
	local min = content.min
	local max = content.max
	local overcharge_opacity = assigned(self.changed_user_settings.overcharge_opacity, Application.user_setting("overcharge_opacity") or DefaultUserSettings.get("user_settings", "overcharge_opacity"))
	overcharge_opacity = math.clamp(overcharge_opacity, min, max)
	content.internal_value = get_slider_value(min, max, overcharge_opacity)
	content.value = overcharge_opacity

	return 
end
OptionsView.cb_overcharge_opacity = function (self, content)
	self.changed_user_settings.overcharge_opacity = content.value

	return 
end
OptionsView.cb_weapon_scroll_type_setup = function (self)
	local options = {
		{
			value = "scroll_wrap",
			text = Localize("menu_settings_scroll_type_wrap")
		},
		{
			value = "scroll_clamp",
			text = Localize("menu_settings_scroll_type_clamp")
		},
		{
			value = "scroll_disabled",
			text = Localize("menu_settings_off")
		}
	}
	local default_value = DefaultUserSettings.get("user_settings", "weapon_scroll_type")
	local scroll_type = Application.user_setting("weapon_scroll_type") or "scroll_wrap"
	local selection = (scroll_type == "scroll_clamp" and 2) or (scroll_type == "scroll_disabled" and 3) or 1
	local default_option = (default_value == "scroll_clamp" and 2) or (default_value == "scroll_disabled" and 3) or 1

	return selection, options, "menu_settings_weapon_scroll_type", default_option
end
OptionsView.cb_weapon_scroll_type_saved_value = function (self, widget)
	local scroll_type = assigned(self.changed_user_settings.weapon_scroll_type, Application.user_setting("weapon_scroll_type")) or "scroll_wrap"
	widget.content.current_selection = (scroll_type == "scroll_clamp" and 2) or (scroll_type == "scroll_disabled" and 3) or 1

	return 
end
OptionsView.cb_weapon_scroll_type = function (self, content)
	local options_values = content.options_values
	local current_selection = content.current_selection
	self.changed_user_settings.weapon_scroll_type = options_values[current_selection]

	return 
end
OptionsView.cb_double_tap_dodge = function (self, content)
	local options_values = content.options_values
	local current_selection = content.current_selection
	self.changed_user_settings.double_tap_dodge = options_values[current_selection]

	return 
end
OptionsView.cb_double_tap_dodge_setup = function (self)
	local options = {
		{
			value = true,
			text = Localize("menu_settings_on")
		},
		{
			value = false,
			text = Localize("menu_settings_off")
		}
	}
	local default_value = DefaultUserSettings.get("user_settings", "double_tap_dodge")
	local enabled = Application.user_setting("double_tap_dodge")

	if enabled == nil then
		enabled = default_value
	end

	local selection = (enabled and 1) or 2
	local default_option = (default_value and 1) or 2

	return selection, options, "menu_settings_double_tap_dodge", default_option
end
OptionsView.cb_double_tap_dodge_saved_value = function (self, widget)
	local enabled = assigned(self.changed_user_settings.double_tap_dodge, Application.user_setting("double_tap_dodge"))

	if enabled == nil then
		enabled = DefaultUserSettings.get("user_settings", "double_tap_dodge")
	end

	widget.content.current_selection = (enabled and 1) or 2

	return 
end
OptionsView.cb_tutorials_enabled_setup = function (self)
	local options = {
		{
			value = true,
			text = Localize("menu_settings_on")
		},
		{
			value = false,
			text = Localize("menu_settings_off")
		}
	}
	local default_value = DefaultUserSettings.get("user_settings", "tutorials_enabled")
	local tutorials_enabled = Application.user_setting("tutorials_enabled")

	if tutorials_enabled == nil then
		tutorials_enabled = true
	end

	local selection = (tutorials_enabled and 1) or 2
	local default_option = (default_value and 1) or 2

	return selection, options, "menu_settings_tutorials_enabled", default_option
end
OptionsView.cb_tutorials_enabled_saved_value = function (self, widget)
	local tutorials_enabled = assigned(self.changed_user_settings.tutorials_enabled, Application.user_setting("tutorials_enabled"))

	if tutorials_enabled == nil then
		tutorials_enabled = true
	end

	widget.content.current_selection = (tutorials_enabled and 1) or 2

	return 
end
OptionsView.cb_tutorials_enabled = function (self, content)
	local options_values = content.options_values
	local current_selection = content.current_selection
	self.changed_user_settings.tutorials_enabled = options_values[current_selection]

	return 
end
OptionsView.cb_master_volume_setup = function (self)
	local min = 0
	local max = 100
	local master_bus_volume = Application.user_setting("master_bus_volume") or 90
	local value = get_slider_value(min, max, master_bus_volume)

	return value, min, max, 0, "menu_settings_master_volume", DefaultUserSettings.get("user_settings", "master_bus_volume")
end
OptionsView.cb_master_volume_saved_value = function (self, widget)
	local content = widget.content
	local min = content.min
	local max = content.max
	local master_bus_volume = assigned(self.changed_user_settings.master_bus_volume, Application.user_setting("master_bus_volume")) or 90
	content.internal_value = get_slider_value(min, max, master_bus_volume)
	content.value = master_bus_volume

	return 
end
OptionsView.cb_master_volume = function (self, content)
	local value = content.value
	self.changed_user_settings.master_bus_volume = value

	self.set_wwise_parameter(self, "master_bus_volume", value)
	Managers.music:set_master_volume(value)

	return 
end
OptionsView.cb_music_bus_volume_setup = function (self)
	local min = 0
	local max = 100
	local music_bus_volume = Application.user_setting("music_bus_volume") or 90
	local value = get_slider_value(min, max, music_bus_volume)

	return value, min, max, 0, "menu_settings_music_volume", DefaultUserSettings.get("user_settings", "music_bus_volume")
end
OptionsView.cb_music_bus_volume_saved_value = function (self, widget)
	local content = widget.content
	local min = content.min
	local max = content.max
	local music_bus_volume = assigned(self.changed_user_settings.music_bus_volume, Application.user_setting("music_bus_volume")) or 90
	content.internal_value = get_slider_value(min, max, music_bus_volume)
	content.value = music_bus_volume

	return 
end
OptionsView.cb_music_bus_volume = function (self, content)
	local value = content.value
	self.changed_user_settings.music_bus_volume = value

	Managers.music:set_music_volume(value)

	return 
end
OptionsView.cb_sfx_bus_volume_setup = function (self)
	local min = 0
	local max = 100
	local sfx_bus_volume = Application.user_setting("sfx_bus_volume") or 90
	local value = get_slider_value(min, max, sfx_bus_volume)

	return value, min, max, 0, "menu_settings_sfx_volume", DefaultUserSettings.get("user_settings", "sfx_bus_volume")
end
OptionsView.cb_sfx_bus_volume_saved_value = function (self, widget)
	local content = widget.content
	local min = content.min
	local max = content.max
	local sfx_bus_volume = assigned(self.changed_user_settings.sfx_bus_volume, Application.user_setting("sfx_bus_volume")) or 90
	content.internal_value = get_slider_value(min, max, sfx_bus_volume)
	content.value = sfx_bus_volume

	return 
end
OptionsView.cb_sfx_bus_volume = function (self, content)
	local value = content.value
	self.changed_user_settings.sfx_bus_volume = value

	self.set_wwise_parameter(self, "sfx_bus_volume", value)

	return 
end
OptionsView.cb_voice_bus_volume_setup = function (self)
	local min = 0
	local max = 100
	local voice_bus_volume = Application.user_setting("voice_bus_volume") or 90
	local value = get_slider_value(min, max, voice_bus_volume)

	return value, min, max, 0, "menu_settings_voice_volume", DefaultUserSettings.get("user_settings", "voice_bus_volume")
end
OptionsView.cb_voice_bus_volume_saved_value = function (self, widget)
	local content = widget.content
	local min = content.min
	local max = content.max
	local voice_bus_volume = assigned(self.changed_user_settings.voice_bus_volume, Application.user_setting("voice_bus_volume")) or 90
	content.internal_value = get_slider_value(min, max, voice_bus_volume)
	content.value = voice_bus_volume

	return 
end
OptionsView.cb_voice_bus_volume = function (self, content)
	local value = content.value
	self.changed_user_settings.voice_bus_volume = value

	self.set_wwise_parameter(self, "voice_bus_volume", value)

	return 
end
OptionsView.cb_voip_bus_volume_setup = function (self)
	local min = 0
	local max = 100
	local voip_bus_volume = Application.user_setting("voip_bus_volume") or 0
	local value = get_slider_value(min, max, voip_bus_volume)

	return value, min, max, 0, "menu_settings_voip_volume", DefaultUserSettings.get("user_settings", "voip_bus_volume")
end
OptionsView.cb_voip_bus_volume_saved_value = function (self, widget)
	local content = widget.content
	local min = content.min
	local max = content.max
	local voip_bus_volume = assigned(self.changed_user_settings.voip_bus_volume, Application.user_setting("voip_bus_volume")) or 90
	content.internal_value = get_slider_value(min, max, voip_bus_volume)
	content.value = voip_bus_volume

	return 
end
OptionsView.cb_voip_bus_volume = function (self, content)
	local value = content.value
	self.changed_user_settings.voip_bus_volume = value

	self.voip:set_volume(value)

	return 
end
OptionsView.cb_voip_enabled_setup = function (self)
	local options = {
		{
			value = true,
			text = Localize("menu_settings_on")
		},
		{
			value = false,
			text = Localize("menu_settings_off")
		}
	}
	local voip_enabled = Application.user_setting("voip_is_enabled")
	local default_value = DefaultUserSettings.get("user_settings", "voip_is_enabled")

	if voip_enabled == nil then
		voip_enabled = default_value
	end

	if self.voip then
		self.voip:set_enabled(voip_enabled)
	end

	local selected_option = 1

	if not voip_enabled then
		selected_option = 2
	end

	local default_option = 1

	if not default_value then
		default_option = 2
	end

	return selected_option, options, "menu_settings_voip_enabled", default_option
end
OptionsView.cb_voip_enabled_saved_value = function (self, widget)
	local options_values = widget.content.options_values
	local voip_enabled = assigned(self.changed_user_settings.voip_is_enabled, Application.user_setting("voip_is_enabled"))

	if voip_enabled == nil then
		voip_enabled = true
	end

	local selected_option = 1

	for idx, value in pairs(options_values) do
		if value == voip_enabled then
			selected_option = idx

			break
		end
	end

	widget.content.current_selection = selected_option
	widget.content.selected_option = selected_option

	return 
end
OptionsView.cb_voip_enabled = function (self, content)
	local value = content.options_values[content.current_selection]
	self.changed_user_settings.voip_is_enabled = value

	self.voip:set_enabled(value)

	return 
end
OptionsView.cb_voip_push_to_talk_setup = function (self)
	local options = {
		{
			value = true,
			text = Localize("menu_settings_on")
		},
		{
			value = false,
			text = Localize("menu_settings_off")
		}
	}
	local voip_push_to_talk = Application.user_setting("voip_push_to_talk")
	local default_value = DefaultUserSettings.get("user_settings", "voip_push_to_talk")

	if voip_push_to_talk == nil then
		voip_push_to_talk = default_value
	end

	self.voip:set_push_to_talk(voip_push_to_talk)

	local selected_option = 1

	if not voip_push_to_talk then
		selected_option = 2
	end

	local default_option = 1

	if not default_value then
		default_option = 2
	end

	return selected_option, options, "menu_settings_voip_push_to_talk", default_option
end
OptionsView.cb_voip_push_to_talk_saved_value = function (self, widget)
	local options_values = widget.content.options_values
	local voip_push_to_talk = assigned(self.changed_user_settings.voip_push_to_talk, Application.user_setting("voip_push_to_talk"))

	if voip_push_to_talk == nil then
		voip_push_to_talk = true
	end

	local selected_option = 1

	for idx, value in pairs(options_values) do
		if value == voip_push_to_talk then
			selected_option = idx

			break
		end
	end

	widget.content.current_selection = selected_option
	widget.content.selected_option = selected_option

	return 
end
OptionsView.cb_voip_push_to_talk = function (self, content)
	local value = content.options_values[content.current_selection]
	self.changed_user_settings.voip_push_to_talk = value

	self.voip:set_push_to_talk(value)

	return 
end
OptionsView.cb_particles_resolution_setup = function (self)
	local options = {
		{
			value = false,
			text = Localize("menu_settings_high")
		},
		{
			value = true,
			text = Localize("menu_settings_low")
		}
	}
	local low_res_transparency = Application.user_setting("render_settings", "low_res_transparency")
	local selected_option = (low_res_transparency and 2) or 1

	return selected_option, options, "menu_settings_low_res_transparency"
end
OptionsView.cb_particles_resolution_saved_value = function (self, widget)
	local low_res_transparency = assigned(self.changed_render_settings.low_res_transparency, Application.user_setting("render_settings", "low_res_transparency"))
	local selected_option = (low_res_transparency and 2) or 1
	widget.content.current_selection = selected_option

	return 
end
OptionsView.cb_particles_resolution = function (self, content, called_from_graphics_quality)
	local value = content.options_values[content.current_selection]
	self.changed_render_settings.low_res_transparency = value

	if not called_from_graphics_quality then
		self.force_set_widget_value(self, "graphics_quality_settings", "custom")
	end

	return 
end
OptionsView.cb_particles_quality_setup = function (self)
	local options = {
		{
			value = "lowest",
			text = Localize("menu_settings_lowest")
		},
		{
			value = "low",
			text = Localize("menu_settings_low")
		},
		{
			value = "medium",
			text = Localize("menu_settings_medium")
		},
		{
			value = "high",
			text = Localize("menu_settings_high")
		},
		{
			value = "extreme",
			text = Localize("menu_settings_extreme")
		}
	}
	local particles_quality = Application.user_setting("particles_quality")
	local default_value = DefaultUserSettings.get("user_settings", "particles_quality")
	local selected_option = 1
	local default_option = nil

	for i = 1, #options, 1 do
		if options[i].value == particles_quality then
			selected_option = i
		end

		if default_value == options[i].value then
			default_option = i
		end
	end

	return selected_option, options, "menu_settings_particles_quality", default_option
end
OptionsView.cb_particles_quality_saved_value = function (self, widget)
	local particles_quality = assigned(self.changed_user_settings.particles_quality, Application.user_setting("particles_quality"))
	local options_values = widget.content.options_values
	local selected_option = 1

	for i = 1, #options_values, 1 do
		if particles_quality == options_values[i] then
			selected_option = i
		end
	end

	widget.content.current_selection = selected_option

	return 
end
OptionsView.cb_particles_quality = function (self, content, called_from_graphics_quality)
	local value = content.options_values[content.current_selection]
	self.changed_user_settings.particles_quality = value
	local particle_quality_settings = ParticlesQuality[value]

	for setting, key in pairs(particle_quality_settings) do
		self.changed_render_settings[setting] = key
	end

	if not called_from_graphics_quality then
		self.force_set_widget_value(self, "graphics_quality_settings", "custom")
	end

	return 
end
OptionsView.cb_ambient_light_quality_setup = function (self)
	local options = {
		{
			value = "low",
			text = Localize("menu_settings_low")
		},
		{
			value = "medium",
			text = Localize("menu_settings_medium")
		},
		{
			value = "high",
			text = Localize("menu_settings_high")
		}
	}
	local ambient_light_quality = Application.user_setting("ambient_light_quality")
	local default_value = DefaultUserSettings.get("user_settings", "ambient_light_quality")
	local selected_option = 1
	local default_option = nil

	for i = 1, #options, 1 do
		if options[i].value == ambient_light_quality then
			selected_option = i
		end

		if default_value == options[i].value then
			default_option = i
		end
	end

	return selected_option, options, "menu_settings_ambient_light_quality", default_option
end
OptionsView.cb_ambient_light_quality_saved_value = function (self, widget)
	local ambient_light_quality = assigned(self.changed_user_settings.ambient_light_quality, Application.user_setting("ambient_light_quality"))
	local options_values = widget.content.options_values
	local selected_option = 1

	for i = 1, #options_values, 1 do
		if ambient_light_quality == options_values[i] then
			selected_option = i
		end
	end

	widget.content.current_selection = selected_option

	return 
end
OptionsView.cb_ambient_light_quality = function (self, content, called_from_graphics_quality)
	local value = content.options_values[content.current_selection]
	self.changed_user_settings.ambient_light_quality = value
	local ambient_light_quality_settings = AmbientLightQuality[value]

	for setting, key in pairs(ambient_light_quality_settings) do
		self.changed_render_settings[setting] = key
	end

	if not called_from_graphics_quality then
		self.force_set_widget_value(self, "graphics_quality_settings", "custom")
	end

	return 
end
OptionsView.cb_volumetric_fog_quality_setup = function (self)
	local options = {
		{
			value = "off",
			text = Localize("menu_settings_off")
		},
		{
			value = "low",
			text = Localize("menu_settings_low")
		},
		{
			value = "medium",
			text = Localize("menu_settings_medium")
		},
		{
			value = "high",
			text = Localize("menu_settings_high")
		},
		{
			value = "extreme",
			text = Localize("menu_settings_extreme")
		}
	}
	local volumetric_fog_quality = Application.user_setting("volumetric_fog_quality")
	local default_value = DefaultUserSettings.get("user_settings", "volumetric_fog_quality")
	local selected_option = 1
	local default_option = nil

	for i = 1, #options, 1 do
		if options[i].value == volumetric_fog_quality then
			selected_option = i
		end

		if default_value == options[i].value then
			default_option = i
		end
	end

	return selected_option, options, "menu_settings_volumetric_fog_quality", default_option
end
OptionsView.cb_volumetric_fog_quality_saved_value = function (self, widget)
	local volumetric_fog_quality = assigned(self.changed_user_settings.volumetric_fog_quality, Application.user_setting("volumetric_fog_quality"))
	local options_values = widget.content.options_values
	local selected_option = 1

	for i = 1, #options_values, 1 do
		if volumetric_fog_quality == options_values[i] then
			selected_option = i
		end
	end

	widget.content.current_selection = selected_option

	return 
end
OptionsView.cb_volumetric_fog_quality = function (self, content, called_from_graphics_quality)
	local value = content.options_values[content.current_selection]
	self.changed_user_settings.volumetric_fog_quality = value
	local volumetric_fog_quality_settings = VolumetricFogQuality[value]

	for setting, key in pairs(volumetric_fog_quality_settings) do
		self.changed_render_settings[setting] = key
	end

	if not called_from_graphics_quality then
		self.force_set_widget_value(self, "graphics_quality_settings", "custom")
	end

	return 
end
OptionsView.cb_physic_debris_setup = function (self)
	local options = {
		{
			value = false,
			text = Localize("menu_settings_off")
		},
		{
			value = true,
			text = Localize("menu_settings_on")
		}
	}
	local use_physic_debris = Application.user_setting("use_physic_debris")

	if use_physic_debris == nil then
		use_physic_debris = true
	end

	local selection = (use_physic_debris and 2) or 1
	local default_selection = (DefaultUserSettings.get("user_settings", "use_physic_debris") and 2) or 1

	return selection, options, "menu_settings_physic_debris", default_selection
end
OptionsView.cb_physic_debris_saved_value = function (self, widget)
	local use_physic_debris = assigned(self.changed_user_settings.use_physic_debris, Application.user_setting("use_physic_debris"))

	if use_physic_debris == nil then
		use_physic_debris = true
	end

	widget.content.current_selection = (use_physic_debris and 2) or 1

	return 
end
OptionsView.cb_physic_debris = function (self, content, called_from_graphics_quality)
	local options_values = content.options_values
	local current_selection = content.current_selection
	self.changed_user_settings.use_physic_debris = options_values[current_selection]

	if not called_from_graphics_quality then
		self.force_set_widget_value(self, "graphics_quality_settings", "custom")
	end

	return 
end
OptionsView.cb_high_quality_fur_setup = function (self)
	local options = {
		{
			value = false,
			text = Localize("menu_settings_off")
		},
		{
			value = true,
			text = Localize("menu_settings_on")
		}
	}
	local use_high_quality_fur = Application.user_setting("use_high_quality_fur")

	if use_high_quality_fur == nil then
		use_high_quality_fur = true
	end

	local selection = (use_high_quality_fur and 2) or 1
	local default_selection = (DefaultUserSettings.get("user_settings", "use_high_quality_fur") and 2) or 1

	return selection, options, "menu_settings_high_quality_fur", default_selection
end
OptionsView.cb_high_quality_fur_saved_value = function (self, widget)
	local use_high_quality_fur = assigned(self.changed_user_settings.use_high_quality_fur, Application.user_setting("use_high_quality_fur"))

	if use_high_quality_fur == nil then
		use_high_quality_fur = true
	end

	widget.content.current_selection = (use_high_quality_fur and 2) or 1

	return 
end
OptionsView.cb_high_quality_fur = function (self, content, called_from_graphics_quality)
	local options_values = content.options_values
	local current_selection = content.current_selection
	self.changed_user_settings.use_high_quality_fur = options_values[current_selection]
	GameSettingsDevelopment.use_high_quality_fur = options_values[current_selection]
	local entity_manager = Managers.state.entity
	local ai_units = (Managers.player.is_server and entity_manager.get_entities(entity_manager, "AISimpleExtension")) or entity_manager.get_entities(entity_manager, "AiHuskBaseExtension")

	for unit, extension in pairs(ai_units) do
		if Unit.alive(unit) then
			Unit.flow_event(unit, "lua_settings_updated")
		end
	end

	if not called_from_graphics_quality then
		self.force_set_widget_value(self, "graphics_quality_settings", "custom")
	end

	return 
end
OptionsView.cb_alien_fx_setup = function (self)
	local options = {
		{
			value = false,
			text = Localize("menu_settings_off")
		},
		{
			value = true,
			text = Localize("menu_settings_on")
		}
	}
	local use_alien_fx = Application.user_setting("use_alien_fx")

	if use_alien_fx == nil then
		use_alien_fx = true
	end

	local selection = (use_alien_fx and 2) or 1
	local default_selection = (DefaultUserSettings.get("user_settings", "use_alien_fx") and 2) or 1
	GameSettingsDevelopment.use_alien_fx = use_alien_fx

	return selection, options, "menu_settings_alien_fx", default_selection
end
OptionsView.cb_alien_fx_saved_value = function (self, widget)
	local use_alien_fx = assigned(self.changed_user_settings.use_alien_fx, Application.user_setting("use_alien_fx"))

	if use_alien_fx == nil then
		use_alien_fx = true
	end

	widget.content.current_selection = (use_alien_fx and 2) or 1

	return 
end
OptionsView.cb_alien_fx = function (self, content)
	local options_values = content.options_values
	local current_selection = content.current_selection
	self.changed_user_settings.use_alien_fx = options_values[current_selection]
	GameSettingsDevelopment.use_alien_fx = options_values[current_selection]

	return 
end
OptionsView.cb_ssr_setup = function (self)
	local options = {
		{
			value = false,
			text = Localize("menu_settings_off")
		},
		{
			value = true,
			text = Localize("menu_settings_on")
		}
	}
	local ssr_enabled = Application.user_setting("render_settings", "ssr_enabled") or false
	local default_value = DefaultUserSettings.get("render_settings", "ssr_enabled")
	local selection = (ssr_enabled and 2) or 1
	local default_option = (default_value and 2) or 1

	return selection, options, "menu_settings_ssr", default_option
end
OptionsView.cb_ssr_saved_value = function (self, widget)
	local ssr_enabled = assigned(self.changed_render_settings.ssr_enabled, Application.user_setting("render_settings", "ssr_enabled")) or false
	widget.content.current_selection = (ssr_enabled and 2) or 1

	return 
end
OptionsView.cb_ssr = function (self, content, called_from_graphics_quality)
	local options_values = content.options_values
	local current_selection = content.current_selection
	self.changed_render_settings.ssr_enabled = options_values[current_selection]

	if not called_from_graphics_quality then
		self.force_set_widget_value(self, "graphics_quality_settings", "custom")
	end

	return 
end
OptionsView.cb_fov_setup = function (self)
	local min = 45
	local max = 120
	local base_fov = CameraSettings.first_person._node.vertical_fov
	local fov = Application.user_setting("render_settings", "fov") or base_fov
	local value = get_slider_value(min, max, fov)
	fov = math.clamp(fov, min, max)
	local fov_multiplier = fov/base_fov
	local camera_manager = Managers.state.camera

	if camera_manager then
		camera_manager.set_fov_multiplier(camera_manager, fov_multiplier)
	end

	local default_value = math.clamp(DefaultUserSettings.get("render_settings", "fov"), min, max)

	return value, min, max, 0, "menu_settings_fov", default_value
end
OptionsView.cb_fov_saved_value = function (self, widget)
	local content = widget.content
	local min = content.min
	local max = content.max
	local base_fov = CameraSettings.first_person._node.vertical_fov
	local fov = assigned(self.changed_render_settings.fov, Application.user_setting("render_settings", "fov")) or base_fov
	fov = math.clamp(fov, min, max)
	content.internal_value = get_slider_value(min, max, fov)
	content.value = fov

	return 
end
OptionsView.cb_fov = function (self, content)
	self.changed_render_settings.fov = content.value

	return 
end
OptionsView.cb_enabled_crosshairs = function (self, content)
	local options_values = content.options_values
	local current_selection = content.current_selection
	self.changed_user_settings.enabled_crosshairs = options_values[current_selection]

	return 
end
OptionsView.cb_enabled_crosshairs_setup = function (self)
	local options = {
		{
			value = "all",
			text = Localize("menu_settings_crosshair_all")
		},
		{
			value = "melee",
			text = Localize("menu_settings_crosshair_melee")
		},
		{
			value = "ranged",
			text = Localize("menu_settings_crosshair_ranged")
		},
		{
			value = "none",
			text = Localize("menu_settings_crosshair_none")
		}
	}
	local default_value = DefaultUserSettings.get("user_settings", "enabled_crosshairs")
	local user_settings_value = Application.user_setting("enabled_crosshairs")
	local default_option, selected_option = nil

	for i, option in ipairs(options) do
		if option.value == user_settings_value then
			selected_option = i
		end

		if option.value == default_value then
			default_option = i
		end
	end

	fassert(default_option, "default option %i does not exist in cb_enabled_crosshairs_setup options table", default_value)

	return selected_option or default_option, options, "menu_settings_enabled_crosshairs", default_option
end
OptionsView.cb_enabled_crosshairs_saved_value = function (self, widget)
	local value = assigned(self.changed_user_settings.enabled_crosshairs, Application.user_setting("enabled_crosshairs")) or DefaultUserSettings.get("user_settings", "enabled_crosshairs")
	local options_values = widget.content.options_values
	local selected_option = 1

	for i = 1, #options_values, 1 do
		if value == options_values[i] then
			selected_option = i

			break
		end
	end

	widget.content.current_selection = selected_option

	return 
end
OptionsView.cb_blood_enabled_setup = function (self)
	local options = {
		{
			value = true,
			text = Localize("menu_settings_on")
		},
		{
			value = false,
			text = Localize("menu_settings_off")
		}
	}
	local blood_enabled = Application.user_setting("blood_enabled")
	local default_value = DefaultUserSettings.get("user_settings", "blood_enabled")

	if blood_enabled == nil then
		blood_enabled = default_value
	end

	local selected_option = 1

	if not blood_enabled then
		selected_option = 2
	end

	local default_option = 1

	if not default_value then
		default_option = 2
	end

	return selected_option, options, "menu_settings_blood_enabled", default_option
end
OptionsView.cb_blood_enabled_saved_value = function (self, widget)
	local options_values = widget.content.options_values
	local blood_enabled = assigned(self.changed_user_settings.blood_enabled, Application.user_setting("blood_enabled"))

	if blood_enabled == nil then
		blood_enabled = true
	end

	local selected_option = 1

	for idx, value in pairs(options_values) do
		if value == blood_enabled then
			selected_option = idx

			break
		end
	end

	widget.content.current_selection = selected_option
	widget.content.selected_option = selected_option

	return 
end
OptionsView.cb_blood_enabled = function (self, content)
	local value = content.options_values[content.current_selection]
	self.changed_user_settings.blood_enabled = value

	return 
end
OptionsView.cb_chat_enabled_setup = function (self)
	local options = {
		{
			value = true,
			text = Localize("menu_settings_on")
		},
		{
			value = false,
			text = Localize("menu_settings_off")
		}
	}
	local chat_enabled = Application.user_setting("chat_enabled")
	local default_value = DefaultUserSettings.get("user_settings", "chat_enabled")

	if chat_enabled == nil then
		chat_enabled = default_value
	end

	local selected_option = 1

	if not chat_enabled then
		selected_option = 2
	end

	local default_option = 1

	if not default_value then
		default_option = 2
	end

	return selected_option, options, "menu_settings_chat_enabled", default_option
end
OptionsView.cb_chat_enabled_saved_value = function (self, widget)
	local options_values = widget.content.options_values
	local chat_enabled = assigned(self.changed_user_settings.chat_enabled, Application.user_setting("chat_enabled"))

	if chat_enabled == nil then
		chat_enabled = true
	end

	local selected_option = 1

	for idx, value in pairs(options_values) do
		if value == chat_enabled then
			selected_option = idx

			break
		end
	end

	widget.content.current_selection = selected_option
	widget.content.selected_option = selected_option

	return 
end
OptionsView.cb_chat_enabled = function (self, content)
	local value = content.options_values[content.current_selection]
	self.changed_user_settings.chat_enabled = value

	return 
end
OptionsView.cb_chat_font_size = function (self, content)
	local options_values = content.options_values
	local current_selection = content.current_selection
	self.changed_user_settings.chat_font_size = options_values[current_selection]

	return 
end
OptionsView.cb_chat_font_size_setup = function (self)
	local options = {
		{
			text = "16",
			value = 16
		},
		{
			text = "20",
			value = 20
		},
		{
			text = "24",
			value = 24
		},
		{
			text = "28",
			value = 28
		},
		{
			text = "32",
			value = 32
		}
	}
	local default_value = DefaultUserSettings.get("user_settings", "chat_font_size")
	local user_settings_value = Application.user_setting("chat_font_size")
	local default_option, selected_option = nil

	for i, option in ipairs(options) do
		if option.value == user_settings_value then
			selected_option = i
		end

		if option.value == default_value then
			default_option = i
		end
	end

	fassert(default_option, "default option %i does not exist in cb_chat_font_size_setup options table", default_value)

	return selected_option or default_option, options, "menu_settings_chat_font_size", default_option
end
OptionsView.cb_chat_font_size_saved_value = function (self, widget)
	local value = assigned(self.changed_user_settings.chat_font_size, Application.user_setting("chat_font_size")) or DefaultUserSettings.get("user_settings", "chat_font_size")
	local options_values = widget.content.options_values
	local selected_option = 1

	for i = 1, #options_values, 1 do
		if value == options_values[i] then
			selected_option = i

			break
		end
	end

	widget.content.current_selection = selected_option

	return 
end
OptionsView.cb_clan_tag_setup = function (self)
	local options = {
		{
			value = "0",
			text = Localize("menu_settings_none")
		}
	}
	local clan_tag = Application.user_setting("clan_tag")
	local clans = SteamHelper.clans_short()
	local i = 2
	local default_option = 1
	local selected_option = default_option

	for id, clan_name in pairs(clans) do
		if clan_name ~= "" then
			options[i] = {
				text = clan_name,
				value = id
			}

			if id == clan_tag then
				selected_option = i
			end

			i = i + 1
		end
	end

	return selected_option, options, "menu_settings_clan_tag", default_option
end
OptionsView.cb_clan_tag_saved_value = function (self, widget)
	local options_values = widget.content.options_values
	local clan_tag = assigned(self.changed_user_settings.clan_tag, Application.user_setting("clan_tag"))

	if clan_tag == nil then
		clan_tag = "0"
	end

	local selected_option = 1

	for idx, value in pairs(options_values) do
		if value == clan_tag then
			selected_option = idx

			break
		end
	end

	widget.content.current_selection = selected_option
	widget.content.selected_option = selected_option

	return 
end
OptionsView.cb_clan_tag = function (self, content)
	local value = content.options_values[content.current_selection]
	self.changed_user_settings.clan_tag = value

	return 
end
OptionsView.cb_blood_decals_setup = function (self)
	local min = 0
	local max = 500
	local num_blood_decals = Application.user_setting("num_blood_decals") or BloodSettings.blood_decals.num_decals
	local default_value = DefaultUserSettings.get("user_settings", "num_blood_decals")
	local value = get_slider_value(min, max, num_blood_decals)
	num_blood_decals = math.clamp(num_blood_decals, min, max)
	BloodSettings.blood_decals.num_decals = num_blood_decals

	return value, min, max, 0, "menu_settings_num_blood_decals", default_value
end
OptionsView.cb_blood_decals_saved_value = function (self, widget)
	local content = widget.content
	local min = content.min
	local max = content.max
	local num_blood_decals = assigned(self.changed_user_settings.num_blood_decals, Application.user_setting("num_blood_decals")) or BloodSettings.blood_decals.num_decals
	num_blood_decals = math.clamp(num_blood_decals, min, max)
	content.internal_value = get_slider_value(min, max, num_blood_decals)
	content.value = num_blood_decals

	return 
end
OptionsView.cb_blood_decals = function (self, content, called_from_graphics_quality)
	self.changed_user_settings.num_blood_decals = content.value

	if not called_from_graphics_quality then
		self.force_set_widget_value(self, "graphics_quality_settings", "custom")
	end

	return 
end
OptionsView.cb_dynamic_range_sound_setup = function (self)
	local options = {
		{
			value = "high",
			text = Localize("menu_settings_high")
		},
		{
			value = "medium",
			text = Localize("menu_settings_medium")
		},
		{
			value = "low",
			text = Localize("menu_settings_low")
		}
	}
	local default_value = DefaultUserSettings.get("user_settings", "dynamic_range_sound")
	local dynamic_range_sound = Application.user_setting("dynamic_range_sound") or default_value
	local selected_option = 1

	if dynamic_range_sound == "high" then
		selected_option = 1
	elseif dynamic_range_sound == "medium" then
		selected_option = 2
	elseif dynamic_range_sound == "low" then
		selected_option = 3
	end

	local default_option = 1

	return selected_option, options, "menu_settings_dynamic_range_sound", default_option
end
OptionsView.cb_dynamic_range_sound_saved_value = function (self, widget)
	local dynamic_range_sound = assigned(self.changed_user_settings.dynamic_range_sound, Application.user_setting("dynamic_range_sound")) or "low"
	local selected_option = 1

	if dynamic_range_sound == "high" then
		selected_option = 1
	elseif dynamic_range_sound == "medium" then
		selected_option = 2
	elseif dynamic_range_sound == "low" then
		selected_option = 3
	end

	widget.content.current_selection = selected_option

	return 
end
OptionsView.cb_dynamic_range_sound = function (self, content)
	local value = content.options_values[content.current_selection]
	self.changed_user_settings.dynamic_range_sound = value
	local setting = nil

	if value == "high" then
		setting = 0
	elseif value == "medium" then
		setting = 0.5
	elseif value == "low" then
		setting = 1
	end

	self.set_wwise_parameter(self, "dynamic_range_sound", setting)

	return 
end
OptionsView.cb_sound_panning_rule_setup = function (self)
	local options = {
		{
			value = "headphones",
			text = Localize("menu_settings_headphones")
		},
		{
			value = "speakers",
			text = Localize("menu_settings_speakers")
		}
	}
	local selected_option = 1
	local default_option = nil
	local default_value = DefaultUserSettings.get("user_settings", "sound_panning_rule")
	local sound_panning_rule = Application.user_setting("sound_panning_rule") or default_value

	if sound_panning_rule == "headphones" then
		selected_option = 1
	elseif sound_panning_rule == "speakers" then
		selected_option = 2
	end

	if default_value == "headphones" then
		default_option = 1
	elseif default_value == "speakers" then
		default_option = 2
	end

	return selected_option, options, "menu_settings_sound_panning_rule", default_option
end
OptionsView.cb_sound_panning_rule_saved_value = function (self, widget)
	local selected_option = 1
	local sound_panning_rule = assigned(self.changed_user_settings.sound_panning_rule, Application.user_setting("sound_panning_rule")) or "headphones"

	if sound_panning_rule == "headphones" then
		selected_option = 1
	elseif sound_panning_rule == "speakers" then
		selected_option = 2
	end

	widget.content.current_selection = selected_option

	return 
end
OptionsView.cb_sound_panning_rule = function (self, content)
	local value = content.options_values[content.current_selection]
	self.changed_user_settings.sound_panning_rule = value

	if value == "headphones" then
		Managers.music:set_panning_rule("PANNING_RULE_HEADPHONES")
	elseif value == "speakers" then
		Managers.music:set_panning_rule("PANNING_RULE_SPEAKERS")
	end

	return 
end
OptionsView.cb_sound_quality_setup = function (self)
	local options = {
		{
			value = "low",
			text = Localize("menu_settings_low")
		},
		{
			value = "medium",
			text = Localize("menu_settings_medium")
		},
		{
			value = "high",
			text = Localize("menu_settings_high")
		}
	}
	local sound_quality = Application.user_setting("sound_quality")
	local default_option = DefaultUserSettings.get("user_settings", "sound_quality")
	local selected_option = nil

	for i = 1, #options, 1 do
		local value = options[i].value

		if sound_quality == value then
			selected_option = i
		end

		if default_option == value then
			default_option = i
		end
	end

	return selected_option, options, "menu_settings_sound_quality", default_option
end
OptionsView.cb_sound_quality_saved_value = function (self, widget)
	local sound_quality = assigned(self.changed_user_settings.sound_quality, Application.user_setting("sound_quality"))
	local options_values = widget.content.options_values
	local selected_option = nil

	for i = 1, #options_values, 1 do
		if sound_quality == options_values[i] then
			selected_option = i
		end
	end

	widget.content.current_selection = selected_option

	return 
end
OptionsView.cb_sound_quality = function (self, content)
	local value = content.options_values[content.current_selection]
	self.changed_user_settings.sound_quality = value

	return 
end
OptionsView.cb_animation_lod_distance_setup = function (self)
	local min = 0
	local max = 1
	local animation_lod_distance_multiplier = Application.user_setting("animation_lod_distance_multiplier") or GameSettingsDevelopment.bone_lod_husks.lod_multiplier
	local value = get_slider_value(min, max, animation_lod_distance_multiplier)

	return value, min, max, 1, "menu_settings_animation_lod_multiplier"
end
OptionsView.cb_animation_lod_distance_saved_value = function (self, widget)
	local content = widget.content
	local min = content.min
	local max = content.max
	local animation_lod_distance_multiplier = assigned(self.changed_user_settings.animation_lod_distance_multiplier, Application.user_setting("animation_lod_distance_multiplier")) or GameSettingsDevelopment.bone_lod_husks.lod_multiplier
	animation_lod_distance_multiplier = math.clamp(animation_lod_distance_multiplier, min, max)
	content.internal_value = get_slider_value(min, max, animation_lod_distance_multiplier)
	content.value = animation_lod_distance_multiplier

	return 
end
OptionsView.cb_animation_lod_distance = function (self, content, called_from_graphics_quality)
	self.changed_user_settings.animation_lod_distance_multiplier = content.value

	if not called_from_graphics_quality then
		self.force_set_widget_value(self, "graphics_quality_settings", "custom")
	end

	return 
end
OptionsView.cb_player_outlines_setup = function (self)
	local options = {
		{
			value = "off",
			text = Localize("menu_settings_off")
		},
		{
			value = "on",
			text = Localize("menu_settings_on")
		},
		{
			value = "always_on",
			text = Localize("menu_settings_always_on")
		}
	}
	local player_outlines = Application.user_setting("player_outlines")
	local default_value = DefaultUserSettings.get("user_settings", "player_outlines")
	local selection, default_selection = nil

	for i, option in ipairs(options) do
		if player_outlines == option.value then
			selection = i
		end

		if default_value == option.value then
			default_selection = i
		end
	end

	return selection, options, "menu_settings_player_outlines", default_selection
end
OptionsView.cb_player_outlines_saved_value = function (self, widget)
	local player_outlines = assigned(self.changed_user_settings.player_outlines, Application.user_setting("player_outlines"))
	local selection = nil
	local options_values = widget.content.options_values

	for i = 1, #options_values, 1 do
		local value = options_values[i]

		if player_outlines == value then
			selection = i
		end
	end

	widget.content.current_selection = selection

	return 
end
OptionsView.cb_player_outlines = function (self, content)
	local current_selection = content.current_selection
	local options_values = content.options_values
	local value = options_values[current_selection]
	self.changed_user_settings.player_outlines = value

	return 
end

local function AddStepperSetting(setting_name, setter_cb)
	local value_set_name = "cb_" .. setting_name
	local value_setup_name = value_set_name .. "_setup"
	OptionsView[value_setup_name] = function (self)
		local options = {
			{
				value = false,
				text = Localize("menu_settings_off")
			},
			{
				value = true,
				text = Localize("menu_settings_on")
			}
		}
		local use_tobii = Application.user_setting(setting_name)

		if use_tobii == nil then
			use_tobii = true
		end

		local selection = (use_tobii and 2) or 1
		local default_selection = (DefaultUserSettings.get("user_settings", setting_name) and 2) or 1
		GameSettingsDevelopment[setting_name] = use_tobii

		return selection, options, "menu_settings_" .. setting_name, default_selection
	end
	OptionsView[value_set_name] = function (self, content)
		local options_values = content.options_values
		local current_selection = content.current_selection
		self.changed_user_settings[setting_name] = options_values[current_selection]
		GameSettingsDevelopment[setting_name] = options_values[current_selection]

		if setter_cb ~= nil then
			setter_cb(content.current_selection == 2)
		end

		return 
	end
	local value_saved_name = value_set_name .. "_saved_value"
	OptionsView[value_saved_name] = function (self, widget)
		local use_tobii = assigned(self.changed_user_settings[setting_name], Application.user_setting(setting_name))

		if use_tobii == nil then
			use_tobii = true
		end

		widget.content.current_selection = (use_tobii and 2) or 1

		return 
	end

	return 
end

tobii_custom_callbacks = {
	responsiveness = function (value)
		Tobii.set_extended_view_responsiveness(value)

		return 
	end,
	use_head_tracking = function (value)
		Tobii.set_extended_view_use_head_tracking(value)

		return 
	end
}

AddStepperSetting("tobii_eyetracking")
AddStepperSetting("tobii_extended_view")
AddStepperSetting("tobii_extended_view_use_head_tracking", tobii_custom_callbacks.use_head_tracking)
AddStepperSetting("tobii_aim_at_gaze")
AddStepperSetting("tobii_fire_at_gaze")
AddStepperSetting("tobii_clean_ui")

local function AddSliderSetting(setting_name, setting_min, setting_max, num_decimals, setter_cb)
	local value_set_name = "cb_" .. setting_name
	local value_setup_name = value_set_name .. "_setup"
	OptionsView[value_setup_name] = function (self)
		local value = Application.user_setting(setting_name) or DefaultUserSettings[setting_name]
		local default_value = DefaultUserSettings.get("user_settings", setting_name)
		local new_value = get_slider_value(setting_min, setting_max, value)

		return new_value, setting_min, setting_max, num_decimals, "menu_settings_" .. setting_name, default_value
	end
	OptionsView[value_set_name] = function (self, content)
		self.changed_user_settings[setting_name] = content.value

		if setter_cb ~= nil then
			setter_cb(content.internal_value)
		end

		return 
	end
	local value_saved_name = value_set_name .. "_saved_value"
	OptionsView[value_saved_name] = function (self, widget)
		local content = widget.content
		local new_value = assigned(self.changed_user_settings[setting_name], Application.user_setting(setting_name))
		new_value = math.clamp(new_value, setting_min, setting_max)
		content.internal_value = get_slider_value(setting_min, setting_max, new_value)
		content.value = new_value

		return 
	end

	return 
end

AddSliderSetting("tobii_extended_view_sensitivity", 1, 100, 0, tobii_custom_callbacks.responsiveness)

local function get_button_locale_name(controller_type, button_name)
	local button_locale_name = nil

	if button_name == "unassigned_keymap" then
		button_locale_name = Localize(button_name)
	elseif controller_type == "keyboard" then
		local button_index = Keyboard.button_index(button_name)
		button_locale_name = Keyboard.button_locale_name(button_index)
	elseif controller_type == "mouse" then
		button_locale_name = string.format("%s %s", "mouse", button_name)
	elseif controller_type == "gamepad" then
		local button_index = Pad1.button_index(button_name)
		button_locale_name = Pad1.button_locale_name(button_index) ~= "" or button_name
	end

	return (button_locale_name ~= "" and button_locale_name) or string.upper(button_name)
end

OptionsView.cb_keybind_setup = function (self, keymappings_key, keymappings_table_key, actions)
	local session_keymaps = self.session_keymaps
	local session_keybindings = session_keymaps[keymappings_key][keymappings_table_key]
	local actions_info = {}

	for i, action in ipairs(actions) do
		local keybind = session_keybindings[action]
		actions_info[i] = {
			action = action,
			keybind = table.clone(keybind)
		}
	end

	local controller_type = actions_info[1].keybind[1]
	local mapped_key = actions_info[1].keybind[2]
	local button_locale_name = get_button_locale_name(controller_type, mapped_key)
	local default_keymappings_data = rawget(_G, keymappings_key)
	local default_keymappings = default_keymappings_data[keymappings_table_key]
	local default_keybind = default_keymappings[actions[1]]
	local default_value = {
		controller = default_keybind[1],
		key = default_keybind[2]
	}

	return button_locale_name, actions_info, default_value
end
OptionsView.cb_keybind_saved_value = function (self, widget)
	local actions = widget.content.actions

	if not actions then
		return 
	end

	local keymappings_key = widget.content.keymappings_key
	local keymappings_table_key = widget.content.keymappings_table_key
	local keymaps = self.original_keymaps
	local keybindings = keymaps[keymappings_key][keymappings_table_key]
	local actions_info = {}

	for i, action in ipairs(actions) do
		local keybind = keybindings[action]
		actions_info[i] = {
			action = action,
			keybind = table.clone(keybind)
		}
	end

	local controller_type = actions_info[1].keybind[1]
	local mapped_key = actions_info[1].keybind[2]
	widget.content.selected_key = get_button_locale_name(controller_type, mapped_key)
	widget.content.actions_info = actions_info

	return 
end
OptionsView.cleanup_duplicates = function (self, new_key, device)
	local selected_settings_list = self.selected_settings_list
	local widgets = selected_settings_list.widgets
	local widgets_n = selected_settings_list.widgets_n

	for i = 1, widgets_n, 1 do
		local widget = widgets[i]
		local widget_type = widget.type

		if widget_type == "keybind" then
			local content = widget.content
			local actions_info = content.actions_info
			local mapped_device = actions_info[1].keybind[1]
			local mapped_key = actions_info[1].keybind[2]

			if mapped_key == new_key and mapped_device == device then
				content.callback("unassigned_keymap", device, content)
			end
		end
	end

	return 
end
OptionsView.cb_keybind_changed = function (self, new_key, device, content)
	local actions_info = content.actions_info

	if not actions_info then
		return 
	end

	local session_keymaps = self.session_keymaps
	local keymappings_key = content.keymappings_key
	local keymappings_table_key = content.keymappings_table_key

	if new_key ~= "unassigned_keymap" then
		self.cleanup_duplicates(self, new_key, device)
	end

	local input_manager = Managers.input

	for i, info in ipairs(actions_info) do
		local keybind = info.keybind
		local action = info.action
		keybind[1] = device
		keybind[2] = new_key
		keybind.changed = true
		local session_keybind = session_keymaps[keymappings_key][keymappings_table_key][action]
		session_keybind[1] = device
		session_keybind[2] = new_key
		session_keybind.changed = true
	end

	self.changed_keymaps = true
	content.selected_key = get_button_locale_name(device, new_key)

	return 
end

return 

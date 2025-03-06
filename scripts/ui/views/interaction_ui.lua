-- chunkname: @scripts/ui/views/interaction_ui.lua

InteractionUI = class(InteractionUI)

local scenegraph_definition = {
	root = {
		is_root = true,
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			UILayer.interaction,
		},
	},
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.interaction,
		},
		size = {
			1920,
			1080,
		},
	},
	pivot = {
		horizontal_alignment = "center",
		parent = "screen",
		vertical_alignment = "center",
		position = {
			0,
			0,
			0,
		},
		size = {
			1,
			1,
		},
	},
	interaction = {
		horizontal_alignment = "left",
		parent = "pivot",
		vertical_alignment = "center",
		size = {
			274,
			82,
		},
		position = {
			60,
			0,
			10,
		},
	},
	text_pivot = {
		parent = "interaction",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			14,
			-22,
			2,
		},
	},
	tooltip_icon = {
		horizontal_alignment = "left",
		parent = "interaction",
		vertical_alignment = "center",
		size = {
			62,
			62,
		},
		position = {
			14,
			-22,
			1,
		},
	},
	title_text_pivot = {
		parent = "tooltip_icon",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			0,
			22,
			2,
		},
	},
	interaction_bar = {
		horizontal_alignment = "left",
		parent = "interaction",
		vertical_alignment = "center",
		size = {
			217,
			35,
		},
		position = {
			4,
			-1,
			4,
		},
	},
	interaction_bar_fill = {
		horizontal_alignment = "left",
		parent = "interaction_bar",
		vertical_alignment = "center",
		size = {
			217,
			35,
		},
		position = {
			0,
			0,
			1,
		},
	},
}

if not IS_WINDOWS then
	scenegraph_definition.screen.scale = "hud_fit"
end

local widget_definitions = {
	tooltip = {
		scenegraph_id = "interaction",
		element = {
			passes = {
				{
					pass_type = "multi_texture",
					style_id = "icon_styles",
					texture_id = "icon_textures",
				},
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background",
				},
				{
					pass_type = "texture",
					style_id = "background_interaction_bar",
					texture_id = "background_interaction_bar",
				},
				{
					pass_type = "text",
					style_id = "button_text",
					text_id = "button_text",
					content_check_function = function (content)
						return content.text ~= ""
					end,
				},
				{
					pass_type = "text",
					style_id = "button_text_shadow",
					text_id = "button_text",
					content_check_function = function (content)
						return content.text ~= ""
					end,
				},
				{
					pass_type = "text",
					style_id = "text",
					text_id = "text",
					content_check_function = function (content)
						return content.text and content.text ~= ""
					end,
				},
				{
					pass_type = "text",
					style_id = "text_shadow",
					text_id = "text",
					content_check_function = function (content)
						return content.text and content.text ~= ""
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text",
					text_id = "title_text",
					content_check_function = function (content)
						return content.title_text
					end,
				},
				{
					pass_type = "text",
					style_id = "title_text_shadow",
					text_id = "title_text",
					content_check_function = function (content)
						return content.title_text
					end,
				},
				{
					pass_type = "text",
					style_id = "hotkey_text",
					text_id = "hotkey_text",
					content_check_function = function (content)
						return content.has_hotkey and not content.gamepad_active
					end,
				},
				{
					pass_type = "text",
					style_id = "hotkey_text_shadow",
					text_id = "hotkey_text",
					content_check_function = function (content)
						return content.has_hotkey and not content.gamepad_active
					end,
				},
			},
		},
		content = {
			background = "interaction_pop_up",
			background_interaction_bar = "interaction_pop_up_bar_border",
			button_text = "",
			gamepad_active = false,
			has_hotkey = false,
			hotkey_text = " ",
			text = "tooltip_text",
			title_text = "title_text",
			icon_textures = {},
		},
		style = {
			background = {
				offset = {
					0,
					-5,
					-1,
				},
				size = {
					274,
					82,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			background_interaction_bar = {
				scenegraph_id = "interaction_bar",
				offset = {
					10,
					12,
					0,
				},
				size = {
					212,
					10,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
			title_text = {
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				scenegraph_id = "title_text_pivot",
				upper_case = true,
				vertical_alignment = "bottom",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					2,
				},
			},
			title_text_shadow = {
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				scenegraph_id = "title_text_pivot",
				upper_case = true,
				vertical_alignment = "bottom",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-2,
					1,
				},
			},
			text = {
				dynamic_font = true,
				font_size = 30,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				pixel_perfect = true,
				scenegraph_id = "text_pivot",
				upper_case = true,
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				default_text_color = Colors.get_color_table_with_alpha("white", 255),
				disabled_text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					0,
					0,
					2,
				},
			},
			text_shadow = {
				dynamic_font = true,
				font_size = 30,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				pixel_perfect = true,
				scenegraph_id = "text_pivot",
				skip_button_rendering = true,
				upper_case = true,
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-2,
					1,
				},
			},
			hotkey_text = {
				dynamic_font = true,
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				pixel_perfect = true,
				scenegraph_id = "text_pivot",
				upper_case = true,
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				default_text_color = Colors.get_color_table_with_alpha("white", 255),
				disabled_text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					-30,
					-30,
					2,
				},
			},
			hotkey_text_shadow = {
				dynamic_font = true,
				font_size = 20,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				pixel_perfect = true,
				scenegraph_id = "text_pivot",
				skip_button_rendering = true,
				upper_case = true,
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					-32,
					-32,
					1,
				},
			},
			button_text = {
				dynamic_font = true,
				font_size = 30,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				pixel_perfect = true,
				scenegraph_id = "tooltip_icon",
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					0,
					0,
					2,
				},
			},
			button_text_shadow = {
				dynamic_font = true,
				font_size = 30,
				font_type = "hell_shark",
				horizontal_alignment = "left",
				pixel_perfect = true,
				scenegraph_id = "tooltip_icon",
				vertical_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					2,
					-2,
					1,
				},
			},
			icon_styles = {
				draw_count = 0,
				scenegraph_id = "tooltip_icon",
				texture_sizes = {
					{
						20,
						36,
					},
				},
				offset = {
					0,
					3,
					1,
				},
				color = {
					255,
					255,
					255,
					255,
				},
			},
		},
	},
	interaction_bar = {
		scenegraph_id = "interaction_bar",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "glow",
					texture_id = "glow",
				},
				{
					content_id = "bar",
					pass_type = "texture_uv_dynamic_color_uvs_size_offset",
					style_id = "bar",
					dynamic_function = function (content, style, size, dt)
						local bar_value = content.bar_value
						local uv_start_pixels = style.uv_start_pixels
						local uv_scale_pixels = style.uv_scale_pixels
						local uv_pixels = uv_start_pixels + uv_scale_pixels * bar_value
						local uvs = style.uvs
						local uv_scale_axis = style.scale_axis
						local offset_scale = style.offset_scale
						local offset = style.offset

						uvs[2][uv_scale_axis] = uv_pixels / (uv_start_pixels + uv_scale_pixels)
						size[uv_scale_axis] = uv_pixels

						return content.color, uvs, size, offset
					end,
				},
			},
		},
		content = {
			glow = "interaction_pop_up_glow_2",
			bar = {
				bar_value = 1,
				texture_id = "interaction_pop_up_glow_1",
			},
		},
		style = {
			glow = {
				scenegraph_id = "interaction_bar_fill",
				size = {
					57,
					111,
				},
				color = {
					255,
					255,
					255,
					255,
				},
				offset = {
					0,
					-35.5,
					1,
				},
			},
			bar = {
				offset_scale = 1,
				scale_axis = 1,
				scenegraph_id = "interaction_bar_fill",
				uv_scale_pixels = 217,
				uv_start_pixels = 0,
				offset = {
					0,
					0,
					0,
				},
				color = {
					0,
					255,
					255,
					255,
				},
				uvs = {
					{
						0,
						0,
					},
					{
						1,
						1,
					},
				},
			},
		},
	},
}
local extended_components = {}

for _, dlc in pairs(DLCSettings) do
	local interaction_ui_components = dlc.interaction_ui_components

	if interaction_ui_components then
		for name, component in pairs(interaction_ui_components) do
			fassert(not extended_components[name], "[InternactionUi] There is already a component with the name %q", name)
			local_require(component.filename)

			extended_components[name] = component.class_name
		end
	end
end

local function contains_key(table, element)
	for key, value in pairs(table) do
		if key == element then
			return true
		end
	end

	return false
end

InteractionUI.init = function (self, parent, ingame_ui_context)
	self._parent = parent
	self.ui_renderer = ingame_ui_context.ui_renderer
	self.input_manager = ingame_ui_context.input_manager
	self.player_manager = ingame_ui_context.player_manager
	self.peer_id = ingame_ui_context.peer_id
	self.profile_synchronizer = ingame_ui_context.profile_synchronizer
	self.world = ingame_ui_context.world
	self._ingame_ui_context = ingame_ui_context
	self.platform = PLATFORM
	self.interaction_animations = {}

	self:create_ui_elements()

	self.localized_texts = {
		hold = Localize("interaction_prefix_hold"),
		press = Localize("interaction_prefix_press"),
		to = Localize("interaction_to"),
	}
end

InteractionUI.create_ui_elements = function (self)
	UIRenderer.clear_scenegraph_queue(self.ui_renderer)

	self.ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)
	self.interaction_widget = UIWidget.init(widget_definitions.tooltip)
	self.interaction_bar_widget = UIWidget.init(widget_definitions.interaction_bar)
	self._components = {}

	for component_name, component_class_name in pairs(extended_components) do
		local component_class = rawget(_G, component_class_name)

		self._components[component_name] = component_class:new(self, self._ingame_ui_context)
	end
end

InteractionUI.destroy = function (self)
	GarbageLeakDetector.register_object(self, "interaction_gui")

	for name, component in pairs(self._components) do
		component:destroy()
	end
end

InteractionUI.button_texture_data_by_input_action = function (self, input_action)
	local input_manager = self.input_manager
	local input_service = input_manager:get_service("Player")
	local gamepad_active = input_manager:is_device_active("gamepad")

	return UISettings.get_gamepad_input_texture_data(input_service, input_action, gamepad_active)
end

InteractionUI._animate_in_progress_bar = function (self)
	local widget_content = self.interaction_bar_widget.content
	local widget_style = self.interaction_bar_widget.style
	local fade_in_time = UISettings.interaction.bar.fade_in

	self.interaction_animations.interaction_bar_glow_fade = UIAnimation.init(UIAnimation.function_by_time, widget_style.glow.color, 1, 0, 255, 0.3, math.easeInCubic)
	self.interaction_animations.interaction_bar_fill_fade = UIAnimation.init(UIAnimation.function_by_time, widget_style.bar.color, 1, 0, 255, fade_in_time, math.easeInCubic)
end

InteractionUI._animate_out_progress_bar = function (self)
	local fade_out_time = UISettings.interaction.bar.fade_out
	local widget_style = self.interaction_bar_widget.style

	self.interaction_animations.interaction_bar_glow_fade = UIAnimation.init(UIAnimation.function_by_time, widget_style.glow.color, 1, widget_style.glow.color[1], 0, fade_out_time, math.easeInCubic)
	self.interaction_animations.interaction_bar_fill_fade = UIAnimation.init(UIAnimation.function_by_time, widget_style.bar.color, 1, widget_style.bar.color[1], 0, fade_out_time, math.easeInCubic)
end

InteractionUI._handle_interaction_progress = function (self, progress)
	if progress and progress ~= 0 then
		local widget_content = self.interaction_bar_widget.content
		local widget_style = self.interaction_bar_widget.style

		if not self.draw_interaction_bar then
			self.draw_interaction_bar = true

			self:_animate_in_progress_bar()
		end

		widget_content.bar.bar_value = progress

		local glow_style = widget_style.glow
		local glow_size = glow_style.size
		local glow_offset = glow_style.offset

		glow_offset[1] = -(glow_size[1] / 2) + 217 * progress

		return true
	end
end

local customizer_data = {
	drag_scenegraph_id = "interaction",
	label = "Interact",
	registry_key = "interact",
	root_scenegraph_id = "pivot",
}
local DO_RELOAD = false
local BASE_OFFSET = {
	0,
	0,
	0,
}

InteractionUI.update = function (self, dt, t, my_player)
	if DO_RELOAD then
		self:create_ui_elements()
	end

	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local input_service = self.input_manager:get_service("Player")
	local gamepad_active = self.input_manager:is_device_active("gamepad")
	local player_unit = my_player.player_unit

	if not player_unit then
		return
	end

	customizer_data.registry_key = InteractionHelper.interaction_action_names(my_player.player_unit)

	HudCustomizer.run(self.ui_renderer, self.ui_scenegraph, customizer_data)

	for name, ui_animation in pairs(self.interaction_animations) do
		UIAnimation.update(ui_animation, dt)

		if UIAnimation.completed(ui_animation) then
			self.interaction_animations[name] = nil
		end
	end

	local interactor_extension = ScriptUnit.extension(player_unit, "interactor_system")
	local interaction_bar_active = false
	local title_text, action_text, interact_action, failed_reason, is_channeling, override_text_color, interaction_component, hotkey_text
	local is_interacting = interactor_extension:is_interacting()
	local is_waiting_for_interaction_approval = interactor_extension:is_waiting_for_interaction_approval()
	local interaction_in_progress = is_interacting and not is_waiting_for_interaction_approval and not interactor_extension:is_aborting_interaction()

	if interaction_in_progress then
		local t = Managers.time:time("game")
		local progress = interactor_extension:get_progress(t)

		interaction_bar_active = self:_handle_interaction_progress(progress)

		if interaction_bar_active then
			is_channeling = true
		end
	end

	title_text, action_text, interact_action, failed_reason, override_text_color, interaction_component, hotkey_text = self:_get_interaction_text(player_unit, is_channeling)

	if action_text then
		title_text = title_text and Localize(title_text) or ""

		if failed_reason == "ammo_blocked" or failed_reason == "throwing_axe" then
			local hold_to_reload_key = Managers.input:is_device_active("gamepad") and "$KEY;Player__weapon_reload_hold_input:" or "$KEY;Player__weapon_reload_hold:"

			action_text = action_text and TextToUpper(Localize(action_text)) .. hold_to_reload_key or ""
		else
			action_text = action_text and Localize(action_text) or ""
		end

		self:_assign_button_info(interact_action, failed_reason, is_channeling, override_text_color)

		local widget_style = self.interaction_widget.style
		local widget_content = self.interaction_widget.content

		widget_content.gamepad_active = gamepad_active
		widget_content.text = action_text
		widget_content.title_text = title_text

		local can_interact, failed_reason, interaction_type = interactor_extension:can_interact()
		local has_hotkey = not not UISettings.interaction_hotkey_lookup[interaction_type]

		self:_update_interaction_widget_size(has_hotkey, gamepad_active)

		widget_content.hotkey_text = hotkey_text

		if not self.draw_interaction_tooltip then
			local icon_style = widget_style.icon_styles
			local button_text_style = widget_style.button_text
			local button_text_shadow_style = widget_style.button_text_shadow
			local text_style = widget_style.text
			local text_shadow_style = widget_style.text_shadow
			local title_text_style = widget_style.title_text
			local title_text_shadow_style = widget_style.title_text_shadow
			local background_style = widget_style.background
			local hotkey_text_style = widget_style.hotkey_text
			local hotkey_text_shadow_style = widget_style.hotkey_text_shadow
			local background_interaction_bar_style = widget_style.background_interaction_bar
			local fade_in_time = 0.1
			local target_alpha = 255

			self.interaction_animations.tooltip_icon_fade = UIAnimation.init(UIAnimation.function_by_time, icon_style.color, 1, 0, target_alpha, fade_in_time, math.easeInCubic)
			self.interaction_animations.tooltip_button_text_fade = UIAnimation.init(UIAnimation.function_by_time, button_text_style.text_color, 1, 0, target_alpha, fade_in_time, math.easeInCubic)
			self.interaction_animations.tooltip_button_text_shadow_fade = UIAnimation.init(UIAnimation.function_by_time, button_text_shadow_style.text_color, 1, 0, target_alpha, fade_in_time, math.easeInCubic)
			self.interaction_animations.tooltip_text_fade = UIAnimation.init(UIAnimation.function_by_time, text_style.text_color, 1, 0, target_alpha, fade_in_time, math.easeInCubic)
			self.interaction_animations.tooltip_text_shadow_fade = UIAnimation.init(UIAnimation.function_by_time, text_shadow_style.text_color, 1, 0, target_alpha, fade_in_time, math.easeInCubic)
			self.interaction_animations.tooltip_title_text_fade = UIAnimation.init(UIAnimation.function_by_time, title_text_style.text_color, 1, 0, target_alpha, fade_in_time, math.easeInCubic)
			self.interaction_animations.tooltip_title_text_shadow_fade = UIAnimation.init(UIAnimation.function_by_time, title_text_shadow_style.text_color, 1, 0, target_alpha, fade_in_time, math.easeInCubic)
			self.interaction_animations.tooltip_background_fade = UIAnimation.init(UIAnimation.function_by_time, background_style.color, 1, 0, target_alpha, fade_in_time, math.easeInCubic)
			self.interaction_animations.hotkey_text_fade = UIAnimation.init(UIAnimation.function_by_time, hotkey_text_style.text_color, 1, 0, target_alpha, fade_in_time, math.easeInCubic)
			self.interaction_animations.hotkey_text_shadow_fade = UIAnimation.init(UIAnimation.function_by_time, hotkey_text_shadow_style.text_color, 1, 0, target_alpha, fade_in_time, math.easeInCubic)
			self.interaction_animations.background_interaction_bar_fade = UIAnimation.init(UIAnimation.function_by_time, background_interaction_bar_style.color, 1, 0, target_alpha, fade_in_time, math.easeInCubic)
		end

		self.draw_interaction_tooltip = true
	elseif self.draw_interaction_tooltip then
		self.draw_interaction_tooltip = nil
	end

	if not interaction_bar_active and self.draw_interaction_bar then
		self.draw_interaction_bar = nil

		self:_animate_out_progress_bar()
	end

	local interaction_component = self._components[interaction_component]

	if interaction_component then
		local optional_offset = interaction_component:update(player_unit, dt, t)

		ui_scenegraph.pivot.local_position = optional_offset or BASE_OFFSET
	end

	UIRenderer.begin_pass(ui_renderer, ui_scenegraph, input_service, dt)

	if self.draw_interaction_bar or self.interaction_animations.interaction_bar_bg_fade then
		UIRenderer.draw_widget(ui_renderer, self.interaction_bar_widget)
	end

	if self.draw_interaction_tooltip then
		UIRenderer.draw_widget(ui_renderer, self.interaction_widget)
	end

	UIRenderer.end_pass(ui_renderer)

	ui_scenegraph.pivot.local_position = BASE_OFFSET
end

InteractionUI._update_interaction_widget_size = function (self, has_hotkey, gamepad_active)
	local interaction_widget = self.interaction_widget

	interaction_widget.content.has_hotkey = has_hotkey

	local style = interaction_widget.style

	if has_hotkey and not gamepad_active then
		style.background.size[2] = 112
		style.background.offset[2] = -32.5
	else
		style.background.size[2] = 82
		style.background.offset[2] = -5
	end
end

InteractionUI._get_interaction_text = function (self, player_unit, is_channeling)
	local interactor_extension = ScriptUnit.extension(player_unit, "interactor_system")
	local interactable_unit = interactor_extension:interactable_unit()
	local title_text, action_text, interact_action, interaction_component, override_text_color, hotkey_text
	local can_interact, failed_reason, interaction_type = interactor_extension:can_interact()
	local is_interacting, current_interaction_type = interactor_extension:is_interacting()

	interaction_type = interaction_type or current_interaction_type

	local active_interaction = can_interact or is_channeling or failed_reason

	if active_interaction and interaction_type ~= "heal" and interaction_type ~= "give_item" then
		if not title_text or not action_text or not interact_action then
			if can_interact then
				interact_action = InteractionHelper.interaction_action_names(player_unit, interactable_unit)
			end

			if can_interact or is_interacting then
				title_text, action_text, interaction_component = interactor_extension:interaction_description()
			elseif failed_reason then
				title_text, action_text, interaction_component = interactor_extension:interaction_description(failed_reason)
			end
		end
	else
		title_text, action_text, interact_action, override_text_color, interaction_component = self:_get_wielded_interaction_text(player_unit)
	end

	local has_hotkey = not not UISettings.interaction_hotkey_lookup[interaction_type]

	if has_hotkey then
		local hotkey = UISettings.interaction_hotkey_lookup[interaction_type]
		local key_text = string.format("$KEY;ingame_menu__%s:", hotkey)

		hotkey_text = TextToUpper(Localize("hotkey_reminder")) .. key_text
	end

	if GameSettingsDevelopment.disabled_interactions[interaction_type] then
		title_text = "Currently Disabled"
	end

	return title_text, action_text, interact_action, failed_reason, override_text_color, interaction_component, hotkey_text
end

InteractionUI._get_wielded_interaction_text = function (self, player_unit)
	local item_data = self:_get_wielded_item_data(player_unit)

	if not item_data then
		return
	end

	local title_text, action_text, interact_action, override_text_color, interaction_component
	local highest_prio = 0
	local best_action_name, best_sub_action_name
	local interactor_extension = ScriptUnit.extension(player_unit, "interactor_system")
	local is_interacting, interaction_type = interactor_extension:is_interacting()
	local item_template = BackendUtils.get_item_template(item_data)

	for action_name, sub_actions in pairs(item_template.actions) do
		for sub_action_name, action_settings in pairs(sub_actions) do
			local interaction_priority = action_settings.interaction_priority or -1000

			if action_settings.interaction_type ~= nil and highest_prio < interaction_priority then
				local show_interaction_ui = action_settings.show_interaction_ui and action_settings.show_interaction_ui(player_unit)

				if show_interaction_ui or action_settings.condition_func(player_unit) or is_interacting and action_settings.interaction_type == interaction_type then
					local input_device_supports_action = self:button_texture_data_by_input_action(action_settings.hold_input or action_name)

					if input_device_supports_action then
						highest_prio = action_settings.interaction_priority
						best_action_name = action_name
						best_sub_action_name = sub_action_name
					end
				end
			end
		end
	end

	if best_action_name then
		local action_settings = item_template.actions[best_action_name][best_sub_action_name]
		local interaction_type = action_settings.interaction_type
		local interaction_template = InteractionDefinitions[interaction_type]
		local interactable_unit = interactor_extension:interactable_unit()
		local interaction_context = interactor_extension.interaction_context
		local interaction_data = interaction_context.data

		if Unit.alive(interactable_unit) then
			local can_interact_func = interaction_template.client.can_interact
			local can_interact = can_interact_func(player_unit, interactable_unit, interaction_data, interaction_template.config, self.world)

			if can_interact then
				title_text, action_text, override_text_color, interaction_component = interaction_template.client.hud_description(interactable_unit, interaction_data, interaction_template.config, nil, player_unit)
			else
				title_text, action_text, override_text_color, interaction_component = interaction_template.client.hud_description(nil, interaction_data, interaction_template.config, nil, player_unit)
			end
		else
			title_text, action_text, override_text_color, interaction_component = interaction_template.client.hud_description(nil, interaction_data, interaction_template.config, nil, player_unit)
		end

		interact_action = action_settings.hold_input or best_action_name
	end

	return title_text, action_text, interact_action, override_text_color, interaction_component
end

InteractionUI._get_wielded_item_data = function (self, player_unit)
	local inventory_extension = ScriptUnit.extension(player_unit, "inventory_system")
	local equipment = inventory_extension:equipment()
	local item_data = equipment.wielded

	return item_data
end

InteractionUI._assign_button_info = function (self, interact_action, failed_reason, channeling, override_text_color)
	local ui_renderer = self.ui_renderer
	local ui_scenegraph = self.ui_scenegraph
	local widget_style = self.interaction_widget.style
	local widget_content = self.interaction_widget.content
	local texture_size_x = 0
	local texture_size_y = 0
	local text_color = widget_style.text.text_color
	local new_text_color

	if interact_action and not failed_reason and not channeling then
		local button_texture_data, button_text = self:button_texture_data_by_input_action(interact_action)

		if button_texture_data and button_texture_data.texture then
			widget_content.button_text = ""
			widget_content.icon_textures[1] = button_texture_data.texture

			local size = {
				button_texture_data.size[1] / button_texture_data.size[2] * button_texture_data.size[1],
				button_texture_data.size[1],
			}

			widget_style.icon_styles.texture_sizes[1] = size
			widget_style.icon_styles.draw_count = 1
			texture_size_x = button_texture_data.size[1]
			texture_size_y = button_texture_data.size[2]
		else
			button_text = "[" .. TextToUpper(button_text) .. "]"

			local button_text_style = widget_style.button_text
			local font, scaled_font_size = UIFontByResolution(button_text_style)
			local text_width, text_height, min = UIRenderer.text_size(ui_renderer, button_text, font[1], scaled_font_size)

			texture_size_x = text_width
			texture_size_y = -8
			widget_content.button_text = button_text
			widget_style.icon_styles.draw_count = 0
		end

		ui_scenegraph.text_pivot.local_position[1] = scenegraph_definition.text_pivot.position[1] + texture_size_x
		ui_scenegraph.tooltip_icon.size[1] = texture_size_x
		ui_scenegraph.tooltip_icon.size[2] = texture_size_y
		new_text_color = widget_style.text.default_text_color
	else
		widget_style.icon_styles.draw_count = 0
		widget_content.button_text = ""
		ui_scenegraph.tooltip_icon.size[1] = 0
		ui_scenegraph.text_pivot.local_position[1] = scenegraph_definition.text_pivot.position[1]

		if failed_reason then
			new_text_color = widget_style.text.disabled_text_color
		elseif channeling then
			new_text_color = widget_style.text.disabled_text_color
		else
			new_text_color = widget_style.text.default_text_color
		end
	end

	if override_text_color then
		new_text_color = override_text_color
	end

	text_color[2] = new_text_color[2]
	text_color[3] = new_text_color[3]
	text_color[4] = new_text_color[4]
end

InteractionUI.external_interact_ui_description = function (self, player_unit)
	local overcharge_extension = ScriptUnit.extension(player_unit, "overcharge_system")

	if overcharge_extension:is_above_critical_limit() and not overcharge_extension:are_you_exploding() then
		return "interaction_overheat", "interaction_action_vent", "weapon_reload"
	end
end

local function setup_ui_definitions(window_width, list_width, list_height)
	local list_size = {
		list_width,
		math.min(list_height, 400)
	}
	local window_size = {
		window_width,
		list_size[2] + 350
	}
	local list_entry_size = {
		list_width - 50,
		50
	}
	local list_scrollbar_size = {
		5,
		list_size[2]
	}
	local animation_definitions = {
		on_enter = {
			{
				name = "fade_in",
				start_progress = 0,
				end_progress = 0.5,
				init = function (ui_scenegraph, scenegraph_definition, widgets, params)
					params.render_settings.alpha_multiplier = 0
				end,
				update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
					local anim_progress = math.easeOutCubic(progress)
					params.render_settings.alpha_multiplier = anim_progress
					ui_scenegraph.window.position[2] = scenegraph_definition.window.position[2] + 100 * (1 - anim_progress)
				end,
				on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
					return
				end
			}
		}
	}
	local scenegraph_definition = {
		root = {
			is_root = true,
			size = {
				1920,
				1080
			},
			position = {
				0,
				0,
				UILayer.default
			}
		},
		screen = {
			scale = "fit",
			size = {
				1920,
				1080
			},
			position = {
				0,
				0,
				UILayer.default
			}
		},
		screen_overlay = {
			scale = "fit",
			size = {
				1920,
				1080
			},
			position = {
				0,
				0,
				900
			}
		},
		window = {
			vertical_alignment = "center",
			parent = "screen_overlay",
			horizontal_alignment = "center",
			size = window_size,
			position = {
				0,
				0,
				1
			}
		},
		window_button = {
			vertical_alignment = "bottom",
			parent = "window",
			horizontal_alignment = "center",
			size = {
				300,
				70
			},
			position = {
				0,
				-32,
				10
			}
		},
		window_title = {
			vertical_alignment = "top",
			parent = "window",
			horizontal_alignment = "center",
			size = {
				window_size[1] - 40,
				50
			},
			position = {
				0,
				-40,
				1
			}
		},
		currency_area = {
			vertical_alignment = "bottom",
			parent = "window",
			horizontal_alignment = "center",
			size = {
				window_size[1] + 20,
				64
			},
			position = {
				0,
				100,
				3
			}
		},
		currency_area_frame = {
			vertical_alignment = "center",
			parent = "currency_area",
			horizontal_alignment = "center",
			size = {
				window_size[1] + 20 + 12,
				76
			},
			position = {
				0,
				0,
				0
			}
		},
		currency_text = {
			vertical_alignment = "center",
			parent = "currency_area",
			horizontal_alignment = "right",
			size = {
				64,
				200
			},
			position = {
				-40,
				-2,
				1
			}
		},
		currency_title = {
			vertical_alignment = "center",
			parent = "currency_area",
			horizontal_alignment = "left",
			size = {
				64,
				200
			},
			position = {
				40,
				-2,
				1
			}
		},
		currency_icon = {
			vertical_alignment = "center",
			parent = "currency_text",
			horizontal_alignment = "left",
			size = {
				64,
				64
			},
			position = {
				-64,
				0,
				1
			}
		},
		currency_area_detail_left = {
			vertical_alignment = "center",
			parent = "currency_area",
			horizontal_alignment = "left",
			size = {
				84,
				112
			},
			position = {
				-40,
				0,
				10
			}
		},
		currency_area_detail_right = {
			vertical_alignment = "center",
			parent = "currency_area",
			horizontal_alignment = "right",
			size = {
				84,
				112
			},
			position = {
				40,
				0,
				10
			}
		},
		list_window = {
			vertical_alignment = "top",
			parent = "window",
			horizontal_alignment = "center",
			size = list_size,
			position = {
				0,
				-115,
				1
			}
		},
		list = {
			vertical_alignment = "top",
			parent = "list_window",
			horizontal_alignment = "right",
			size = list_size,
			position = {
				0,
				-list_size[2],
				0
			}
		},
		list_scrollbar = {
			vertical_alignment = "center",
			parent = "list_window",
			horizontal_alignment = "right",
			size = list_scrollbar_size,
			position = {
				-20,
				0,
				1
			}
		},
		list_root = {
			vertical_alignment = "top",
			parent = "list",
			horizontal_alignment = "left",
			size = {
				0,
				0
			},
			position = {
				0,
				0,
				1
			}
		}
	}
	local title_text_style = {
		use_shadow = true,
		upper_case = false,
		localize = true,
		font_size = 52,
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
	local currency_text_style = {
		word_wrap = false,
		upper_case = true,
		localize = false,
		use_shadow = true,
		font_size = 32,
		horizontal_alignment = "right",
		vertical_alignment = "center",
		dynamic_font_size = false,
		font_type = "hell_shark_header",
		text_color = Colors.get_color_table_with_alpha("white", 255),
		offset = {
			0,
			0,
			2
		}
	}
	local currency_title_style = {
		word_wrap = false,
		upper_case = false,
		localize = false,
		use_shadow = true,
		font_size = 32,
		horizontal_alignment = "left",
		vertical_alignment = "center",
		dynamic_font_size = false,
		font_type = "hell_shark_header",
		text_color = Colors.get_color_table_with_alpha("white", 255),
		offset = {
			0,
			0,
			2
		}
	}

	local function create_list_mask(scenegraph_id, list_scenegraph_id, size)
		local fade_distance = 10
		local element = {
			passes = {
				{
					style_id = "hotspot",
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					style_id = "list_hotspot",
					pass_type = "hotspot",
					content_id = "list_hotspot"
				},
				{
					pass_type = "texture",
					style_id = "mask",
					texture_id = "mask_texture"
				},
				{
					pass_type = "texture",
					style_id = "mask_top",
					texture_id = "mask_edge"
				},
				{
					pass_type = "rotated_texture",
					style_id = "mask_bottom",
					texture_id = "mask_edge"
				}
			}
		}
		local content = {
			mask_edge = "mask_rect_edge_fade",
			mask_texture = "mask_rect",
			list_hotspot = {},
			button_hotspot = {},
			scrollbar = {
				scroll_amount = 0.1,
				percentage = 0.1,
				scroll_value = 1
			}
		}
		local style = {
			hotspot = {
				size = {
					size[1],
					size[2]
				},
				offset = {
					0,
					0,
					0
				}
			},
			list_hotspot = {
				size = {
					size[1],
					size[2] + fade_distance * 2
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					-fade_distance,
					0
				}
			},
			mask = {
				size = {
					size[1],
					size[2]
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
					0
				}
			},
			mask_top = {
				size = {
					size[1],
					fade_distance
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2],
					0
				}
			},
			mask_bottom = {
				size = {
					size[1],
					fade_distance
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					-fade_distance,
					0
				},
				angle = math.pi,
				pivot = {
					size[1] / 2,
					fade_distance / 2
				}
			}
		}
		local widget = {
			element = element,
			content = content,
			style = style,
			offset = {
				0,
				0,
				0
			},
			scenegraph_id = scenegraph_id
		}

		return widget
	end

	local disable_with_gamepad = true
	local frame_name = "shadow_frame_02"
	local frame_settings = UIFrameSettings[frame_name]
	local frame_height = frame_settings.texture_sizes.horizontal[2]
	local window_background_color = {
		220,
		10,
		10,
		10
	}
	local window_dop_shadow_color = {
		220,
		0,
		0,
		0
	}
	local widget_definitions = {
		screen_overlay = UIWidgets.create_simple_rect("screen_overlay", {
			50,
			10,
			10,
			10
		}),
		window_background = UIWidgets.create_simple_rect("window", window_background_color),
		window_drop_shadow = UIWidgets.create_frame("window", scenegraph_definition.window.size, frame_name, 0, window_dop_shadow_color, {
			-frame_height,
			-frame_height
		}),
		window_frame = UIWidgets.create_frame("window", scenegraph_definition.window.size, "menu_frame_12_gold", 1, {
			255,
			255,
			255,
			255
		}),
		window_button = UIWidgets.create_default_button("window_button", scenegraph_definition.window_button.size, "button_frame_02_gold", nil, Localize("welcome_currency_popup_button_claim"), 30, nil, "button_detail_01_gold", nil, disable_with_gamepad),
		window_title = UIWidgets.create_simple_text("interact_open_store", "window_title", scenegraph_definition.window_title.size, nil, title_text_style),
		currency_icon = UIWidgets.create_simple_texture("store_icon_currency_ingame_big", "currency_icon"),
		currency_title = UIWidgets.create_simple_text(Localize("welcome_currency_popup_amount_summary_title"), "currency_title", nil, nil, currency_title_style),
		currency_text = UIWidgets.create_simple_text("-", "currency_text", nil, nil, currency_text_style),
		currency_area = UIWidgets.create_tiled_texture("currency_area", "menu_frame_bg_07", {
			512,
			256
		}, nil, nil, {
			255,
			255,
			255,
			255
		}),
		currency_area_frame = UIWidgets.create_frame("currency_area_frame", scenegraph_definition.currency_area_frame.size, "button_frame_01_gold", 1),
		currency_area_detail_left = UIWidgets.create_simple_uv_texture("button_detail_08_gold", {
			{
				0,
				0
			},
			{
				1,
				1
			}
		}, "currency_area_detail_left"),
		currency_area_detail_right = UIWidgets.create_simple_uv_texture("button_detail_08_gold", {
			{
				1,
				0
			},
			{
				0,
				1
			}
		}, "currency_area_detail_right"),
		list = create_list_mask("list_window", "list", list_size, list_entry_size),
		list_scrollbar = UIWidgets.create_scrollbar("list_scrollbar", list_scrollbar_size, "window", {
			255,
			120,
			120,
			120
		}, {
			255,
			30,
			30,
			30
		})
	}

	return scenegraph_definition, widget_definitions, animation_definitions
end

local fake_input_service = {
	get = function ()
		return
	end,
	has = function ()
		return
	end
}
local LIST_SPACING = 10
local LIST_MAX_WIDTH = 800
StoreWelcomePopup = class(StoreWelcomePopup)

StoreWelcomePopup.init = function (self, ingame_ui, layout, total_amount)
	self._ingame_ui = ingame_ui
	self._top_world = ingame_ui.top_world
	self._render_settings = {
		alpha_multiplier = 1
	}
	self._animations = {}
	self._ui_animations = {}

	self:_setup_renderers()

	local world = Managers.world:world("level_world")
	self._wwise_world = Managers.world:wwise_world(world)
	self._level_world = world
	local window_width = 700
	local list_width = window_width - 70
	self._entry_size = {
		list_width - 50,
		50
	}

	self:_setup_list_widgets(layout)

	self._scenegraph_definition, self._widget_definitions, self._animation_definitions = setup_ui_definitions(window_width, list_width, self._total_list_height)

	self:_create_ui_elements()

	self._blur_progress = 1

	self:_initialize_scrollbar()

	self._list_initialized = true

	self:_set_total_amount(total_amount)
	self:_start_transition_animation("on_enter", "on_enter")
end

StoreWelcomePopup._setup_renderers = function (self)
	local world_name = "store_welcome_ui_world"
	local layer = 999
	self._welcome_ui_world_viewport_name = "store_welcome_ui_world_viewport"
	self._welcome_ui_world = Managers.world:create_world(world_name, GameSettingsDevelopment.default_environment, nil, layer, Application.DISABLE_PHYSICS, Application.DISABLE_APEX_CLOTH)

	ScriptWorld.create_viewport(self._welcome_ui_world, self._welcome_ui_world_viewport_name, "overlay", 1)

	self._welcome_ui_renderer = self._ingame_ui:create_ui_renderer(self._welcome_ui_world, false, true)
	local blur_layer = 998
	local blur_world_name = "store_welcome_ui_blur_world"
	local blur_shading_environment = "environment/ui_store_default"
	self._blur_welcome_ui_world_viewport_name = "store_welcome_ui_blur_world_viewport"
	self._blur_welcome_ui_world = Managers.world:create_world(blur_world_name, blur_shading_environment, nil, blur_layer, Application.DISABLE_PHYSICS, Application.DISABLE_APEX_CLOTH)

	ScriptWorld.create_viewport(self._blur_welcome_ui_world, self._blur_welcome_ui_world_viewport_name, "overlay", 1)

	self._blur_welcome_ui_renderer = self._ingame_ui:create_ui_renderer(self._blur_welcome_ui_world, false, true)
end

StoreWelcomePopup._destroy_renderers = function (self)
	UIRenderer.destroy(self._welcome_ui_renderer, self._welcome_ui_world)
	ScriptWorld.destroy_viewport(self._welcome_ui_world, self._welcome_ui_world_viewport_name)
	Managers.world:destroy_world(self._welcome_ui_world)

	self._welcome_ui_world = nil
	self._welcome_ui_renderer = nil
	self._welcome_ui_world_viewport_name = nil

	UIRenderer.destroy(self._blur_welcome_ui_renderer, self._blur_welcome_ui_world)
	ScriptWorld.destroy_viewport(self._blur_welcome_ui_world, self._blur_welcome_ui_world_viewport_name)
	Managers.world:destroy_world(self._blur_welcome_ui_world)

	self._blur_welcome_ui_world = nil
	self._blur_welcome_ui_renderer = nil
	self._blur_welcome_ui_world_viewport_name = nil
end

StoreWelcomePopup._start_transition_animation = function (self, key, animation_name, optional_widgets)
	local params = {
		wwise_world = self._wwise_world,
		render_settings = self._render_settings
	}
	local widgets = optional_widgets or self._widgets_by_name
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, self._scenegraph_definition, params)
	self._animations[key] = anim_id

	return params
end

StoreWelcomePopup.completed = function (self)
	return self._done
end

StoreWelcomePopup._create_gamepad_input_description = function (self, input_service)
	local generic_input_actions = {
		{
			input_action = "confirm",
			priority = 2,
			description_text = "welcome_currency_popup_button_claim"
		}
	}
	self._menu_input_description = MenuInputDescriptionUI:new(nil, self._welcome_ui_renderer, input_service, 6, nil, generic_input_actions, true)

	self._menu_input_description:set_input_description(nil)
end

StoreWelcomePopup._set_fullscreen_effect_enable_state = function (self, enabled, progress, world)
	local shading_env = World.get_data(world, "shading_environment")
	progress = progress or (enabled and 1) or 0

	if shading_env then
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", (enabled and 1) or 0)
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", (enabled and progress * 0.8) or 0)
		ShadingEnvironment.apply(shading_env)
	end

	self._fullscreen_effect_enabled = enabled
end

StoreWelcomePopup.is_complete = function (self)
	return self._state == "exit"
end

StoreWelcomePopup.destroy = function (self)
	if self._blur_welcome_ui_world and self._fullscreen_effect_enabled then
		self:_set_fullscreen_effect_enable_state(false, 0, self._blur_welcome_ui_world)
	end

	self:_destroy_renderers()
end

StoreWelcomePopup._create_ui_elements = function (self, params)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(self._scenegraph_definition)
	local widgets_by_name = {}
	local widgets_by_state = {}
	local widgets = {}

	for name, widget_definition in pairs(self._widget_definitions) do
		local widget = UIWidget.init(widget_definition)
		widgets[#widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	self._widgets = widgets
	self._widgets_by_name = widgets_by_name
	self._widgets_by_state = widgets_by_state

	UIRenderer.clear_scenegraph_queue(self._welcome_ui_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, self._animation_definitions)
end

StoreWelcomePopup._draw = function (self, input_service, dt)
	local welcome_ui_renderer = self._welcome_ui_renderer
	local blur_welcome_ui_renderer = self._blur_welcome_ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local render_settings = self._render_settings
	local gamepad_active = Managers.input:is_device_active("gamepad")

	UIRenderer.begin_pass(welcome_ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local snap_pixel_positions = render_settings.snap_pixel_positions
	local alpha_multiplier = render_settings.alpha_multiplier or 1

	for _, widget in ipairs(self._widgets) do
		if widget.snap_pixel_positions ~= nil then
			render_settings.snap_pixel_positions = widget.snap_pixel_positions
		end

		render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

		UIRenderer.draw_widget(welcome_ui_renderer, widget)

		render_settings.snap_pixel_positions = snap_pixel_positions
	end

	if self._list_initialized then
		local list_widgets = self._list_widgets

		if list_widgets then
			self:_update_visible_list_entries()

			for _, widget in ipairs(list_widgets) do
				render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

				UIRenderer.draw_widget(welcome_ui_renderer, widget)
			end
		end
	end

	render_settings.alpha_multiplier = alpha_multiplier

	UIRenderer.end_pass(welcome_ui_renderer)

	if gamepad_active then
		self._menu_input_description:draw(welcome_ui_renderer, dt)
	end
end

StoreWelcomePopup._handle_input = function (self, input_service, dt, t)
	local gamepad_active = Managers.input:is_device_active("gamepad")
	local confirm_pressed = gamepad_active and input_service:get("confirm", true)
	local widgets_by_name = self._widgets_by_name
	local window_button = widgets_by_name.window_button

	UIWidgetUtils.animate_default_button(window_button, dt)

	if self:_is_button_hover_enter(window_button) then
		self:_play_sound("Play_hud_hover")
	end

	if self:_is_button_pressed(window_button) or confirm_pressed then
		self:_play_sound("Play_hud_store_button_buy")

		self._done = true
	end
end

StoreWelcomePopup.update = function (self, input_service, dt, t)
	if not self._menu_input_description then
		self:_create_gamepad_input_description(input_service)
	end

	if self._list_initialized then
		local scrollbar_logic = self._scrollbar_logic

		if scrollbar_logic then
			scrollbar_logic:update(dt, t)
			self:_update_scroll_position()
		end
	end

	self:_handle_input(input_service, dt, t)

	local blur_progress = self._blur_progress or self._render_settings.alpha_multiplier

	if blur_progress then
		self:_set_fullscreen_effect_enable_state(true, blur_progress, self._blur_welcome_ui_world)
	elseif self._fullscreen_effect_enabled then
		self:_set_fullscreen_effect_enable_state(false, 0, self._blur_welcome_ui_world)
	end

	self:_update_animations(dt)
	self:_draw(input_service, dt)
end

StoreWelcomePopup._update_animations = function (self, dt)
	for name, animation in pairs(self._ui_animations) do
		UIAnimation.update(animation, dt)

		if UIAnimation.completed(animation) then
			self._ui_animations[name] = nil
		end
	end

	local animations = self._animations
	local ui_animator = self._ui_animator

	ui_animator:update(dt)

	for animation_name, animation_id in pairs(animations) do
		if ui_animator:is_animation_completed(animation_id) then
			ui_animator:stop_animation(animation_id)

			animations[animation_name] = nil
		end
	end
end

StoreWelcomePopup._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot

	return hotspot.on_hover_enter
end

StoreWelcomePopup._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StoreWelcomePopup._play_sound = function (self, event)
	WwiseWorld.trigger_event(self._wwise_world, event)
end

StoreWelcomePopup._setup_list_widgets = function (self, layout)
	local widgets = {}
	local scenegraph_id = "list_root"
	local masked = true
	local entry_size = self._entry_size

	for i, entry in ipairs(layout) do
		local entry_type = entry.type
		local settings = entry.settings
		local widget = nil

		if entry_type == "body" then
			local height_spacing = 5
			local widget_definition = UIWidgets.create_store_body_text_definition(scenegraph_id, entry_size, masked)
			widget = UIWidget.init(widget_definition)

			self:_populate_text_widget(widget, settings, height_spacing)
		elseif entry_type == "summary_title" then
			local height_spacing = 5
			local widget_definition = UIWidgets.create_store_currency_summary_title_definition(scenegraph_id, entry_size, masked)
			widget = UIWidget.init(widget_definition)

			self:_populate_text_widget(widget, settings, height_spacing)
			self:_populate_currency_title_widget(widget, settings)
		elseif entry_type == "summary_entry" then
			local widget_definition = UIWidgets.create_store_currency_summary_entry_definition(scenegraph_id, entry_size, masked)
			local height_spacing = -5
			widget = UIWidget.init(widget_definition)

			self:_populate_text_widget(widget, settings, height_spacing)
			self:_populate_currency_entry_widget(widget, settings)
		end

		widgets[#widgets + 1] = widget
	end

	self._list_widgets = widgets

	self:_align_dlc_widgets()
end

StoreWelcomePopup._populate_text_widget = function (self, widget, settings, height_spacing)
	local content = widget.content
	local style = widget.style
	local text = settings.text

	if settings.localize then
		text = Localize(text)
	end

	local text_style = style.text
	local text_size = text_style.size
	local text_offset = text_style.offset
	local welcome_ui_renderer = self._welcome_ui_renderer
	local text_height = UIUtils.get_text_height(welcome_ui_renderer, text_size, text_style, text)

	if height_spacing then
		text_size[2] = text_height + height_spacing
	else
		text_size[2] = text_height
	end

	text_offset[2] = -text_size[2]
	content.size[2] = text_size[2]
	local text_shadow_style = style.text_shadow
	text_shadow_style.size[2] = text_size[2]
	text_shadow_style.offset[2] = -(text_size[2] + 2)
	content.text = text
end

StoreWelcomePopup._populate_currency_title_widget = function (self, widget, settings)
	local content = widget.content
	local style = widget.style
	local text_style = style.text
	local text_size = text_style.size
	local divider_style = style.divider
	local divider_offset = divider_style.offset
	divider_offset[2] = -text_size[2]
	local divider_shadow_style = style.divider_shadow
	local divider_shadow_offset = divider_shadow_style.offset
	divider_shadow_offset[2] = -(text_size[2] + 2)
	local text2_style = style.text2
	local text2_size = text2_style.size
	local text2_offset = text2_style.offset
	text2_size[2] = text_size[2]
	text2_offset[2] = -text_size[2]
	local text2_shadow_style = style.text2_shadow
	text2_shadow_style.size[2] = text_size[2]
	text2_shadow_style.offset[2] = -(text_size[2] + 2)
	local text2 = settings.text2

	if settings.localize then
		text2 = Localize(text2)
	end

	content.text2 = text2
end

StoreWelcomePopup._populate_currency_entry_widget = function (self, widget, settings)
	local content = widget.content
	local style = widget.style
	local text_style = style.text
	local text_size = text_style.size
	local text2_style = style.text2
	local text2_size = text2_style.size
	local text2_offset = text2_style.offset
	text2_size[2] = text_size[2]
	text2_offset[2] = -text_size[2]
	local text2_shadow_style = style.text2_shadow
	text2_shadow_style.size[2] = text_size[2]
	text2_shadow_style.offset[2] = -(text_size[2] + 2)
	local value = settings.value
	local value_text = UIUtils.comma_value(value)
	content.text2 = value_text
end

StoreWelcomePopup._align_dlc_widgets = function (self)
	local total_height = 0
	local widget_position_x = 0
	local widget_position_y = 0
	local row = 1
	local column = 1
	local previous_height = 0
	local row_heighest_height = 0
	local widgets = self._list_widgets
	local num_widgets = #widgets

	for index, widget in ipairs(widgets) do
		local offset = widget.offset
		local content = widget.content
		local size = content.size
		local width = size[1]
		local height = size[2]
		local change_row = LIST_MAX_WIDTH < widget_position_x + width

		if change_row then
			column = 1
			row = row + 1
			widget_position_x = 0
			widget_position_y = widget_position_y - (row_heighest_height + LIST_SPACING)
			row_heighest_height = 0
		end

		offset[1] = widget_position_x
		offset[2] = widget_position_y
		widget.default_offset = table.clone(offset)
		content.row = row
		content.column = column
		widget_position_x = widget_position_x + width + LIST_SPACING

		if index == num_widgets then
			total_height = math.abs(widget_position_y - height)
		end

		column = column + 1
		previous_height = height

		if row_heighest_height < height then
			row_heighest_height = height
		end
	end

	self._total_list_height = total_height
end

StoreWelcomePopup._initialize_scrollbar = function (self)
	local scrollbar_widget = self._widgets_by_name.list_scrollbar
	self._scrollbar_logic = ScrollBarLogic:new(scrollbar_widget)
	local list_window_size = self._scenegraph_definition.list_window.size
	local list_scrollbar_size = self._scenegraph_definition.list_scrollbar.size
	local draw_length = list_window_size[2]
	local content_length = self._total_list_height
	local scrollbar_length = list_scrollbar_size[2]
	local step_size = 220 + LIST_SPACING * 1.5
	local scroll_step_multiplier = 1
	local scrollbar_logic = self._scrollbar_logic

	scrollbar_logic:set_scrollbar_values(draw_length, content_length, scrollbar_length, step_size, scroll_step_multiplier)
	scrollbar_logic:set_scroll_percentage(0)

	scrollbar_widget.content.visible = draw_length < content_length
end

StoreWelcomePopup._update_scroll_position = function (self)
	local scrollbar_logic = self._scrollbar_logic
	local length = scrollbar_logic:get_scrolled_length()

	if length ~= self._scrolled_length then
		self._ui_scenegraph.list.local_position[2] = length
		self._scrolled_length = length
	end
end

StoreWelcomePopup._update_visible_list_entries = function (self)
	local scrollbar_logic = self._scrollbar_logic
	local enabled = scrollbar_logic:enabled()

	if not enabled then
		return
	end

	local scroll_percentage = scrollbar_logic:get_scroll_percentage()
	local scrolled_length = scrollbar_logic:get_scrolled_length()
	local scroll_length = scrollbar_logic:get_scroll_length()
	local list_window_size = self._scenegraph_definition.list_window.size
	local draw_padding = LIST_SPACING * 2
	local draw_length = list_window_size[2] + draw_padding
	local widgets = self._list_widgets
	local num_widgets = #widgets

	for index, widget in ipairs(widgets) do
		local offset = widget.offset
		local content = widget.content
		local size = content.size
		local widget_position = math.abs(offset[2]) + size[2]
		local is_outside = false

		if widget_position < scrolled_length - draw_padding then
			is_outside = true
		elseif draw_length < math.abs(offset[2]) - scrolled_length then
			is_outside = true
		end

		content.visible = not is_outside
	end
end

StoreWelcomePopup._set_total_amount = function (self, total_amount)
	local widgets_by_name = self._widgets_by_name
	local widget_currency_icon = widgets_by_name.currency_icon
	local widget_currency_text = widgets_by_name.currency_text
	local currency_text = UIUtils.comma_value(tostring(total_amount))
	widget_currency_text.content.text = currency_text
	local welcome_ui_renderer = self._welcome_ui_renderer
	local text_width = UIUtils.get_text_width(welcome_ui_renderer, widget_currency_text.style.text, currency_text)
	local icon_width = self._scenegraph_definition.currency_icon.size[1]
	local text_spacing = 5
	local total_length = text_width + text_spacing
	local ui_scenegraph = self._ui_scenegraph
	local text_scenegraph_id = widget_currency_text.scenegraph_id
	ui_scenegraph[text_scenegraph_id].size[1] = total_length
end

return

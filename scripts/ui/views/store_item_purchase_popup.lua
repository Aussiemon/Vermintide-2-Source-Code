-- chunkname: @scripts/ui/views/store_item_purchase_popup.lua

local window_size = {
	800,
	750,
}
local inner_window_size = {
	window_size[1] - 158,
	window_size[2] - 158,
}
local animation_definitions = {
	approved = {
		{
			end_progress = 0.3,
			name = "product_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local product_widget = params.product_widget
				local product_widget_content = product_widget.content
				local product_widget_style = product_widget.style

				product_widget.alpha_multiplier = 0
				product_widget_style.owned_icon.color[1] = 0
				product_widget_style.owned_icon_bg.color[1] = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local product_widget = params.product_widget

				product_widget.alpha_multiplier = progress

				local product_widget_size = product_widget.content.size
				local product_widget_style = product_widget.style
				local height_offset = 25

				product_widget.offset[2] = product_widget_size[2] / 2 + height_offset - height_offset * anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.3,
			name = "text_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local widget = widgets.approved

				widget.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local widget = widgets.approved
				local height_offset = 25

				widget.offset[2] = -height_offset + height_offset * anim_progress
				widget.alpha_multiplier = progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.6,
			name = "stamp",
			start_progress = 0.1,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.ease_in_exp(math.ease_exp(progress))
				local alpha = 255 * progress
				local product_widget = params.product_widget
				local product_widget_size = product_widget.content.size
				local product_widget_style = product_widget.style

				product_widget_style.owned_icon.color[1] = 255 * progress
				product_widget_style.owned_icon_bg.color[1] = 255 * math.ease_in_exp(progress)

				local size_multiplier = 3
				local owned_icon = product_widget_style.owned_icon

				if owned_icon then
					local color = owned_icon.color
					local default_size = owned_icon.default_texture_size
					local size = owned_icon.texture_size
					local size_increase_width = default_size[1] * size_multiplier * anim_progress
					local size_increase_height = default_size[2] * size_multiplier * anim_progress

					size[1] = default_size[1] * (size_multiplier + 1) - size_increase_width
					size[2] = default_size[2] * (size_multiplier + 1) - size_increase_height

					local default_offset = owned_icon.default_offset
					local offset = owned_icon.offset

					offset[1] = default_offset[1] - (default_size[1] * size_multiplier - size_increase_width) * 0.5
					offset[2] = default_offset[2] - (default_size[2] * size_multiplier - size_increase_height) * 0.5
				end

				local owned_icon_bg = product_widget_style.owned_icon_bg

				if owned_icon_bg then
					local color = owned_icon_bg.color
					local default_size = owned_icon_bg.default_texture_size
					local size = owned_icon_bg.texture_size
					local size_increase_width = default_size[1] * size_multiplier * anim_progress
					local size_increase_height = default_size[2] * size_multiplier * anim_progress

					size[1] = default_size[1] * (size_multiplier + 1) - size_increase_width
					size[2] = default_size[2] * (size_multiplier + 1) - size_increase_height

					local default_offset = owned_icon_bg.default_offset
					local offset = owned_icon_bg.offset

					offset[1] = default_offset[1] - (default_size[1] * size_multiplier - size_increase_width) * 0.5
					offset[2] = default_offset[2] - (default_size[2] * size_multiplier - size_increase_height) * 0.5
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 1.9,
			name = "frame_glow",
			start_progress = 0.4,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local widget = widgets.approved
				local style = widget.style
				local frame_write_mask_style = style.frame_write_mask
				local frame_write_mask_size = frame_write_mask_style.texture_size
				local frame_write_mask_offset = frame_write_mask_style.offset

				frame_write_mask_offset[1] = -frame_write_mask_size[1]
				frame_write_mask_offset[2] = -frame_write_mask_size[2]
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local widget = widgets.approved
				local style = widget.style
				local frame_write_mask_style = style.frame_write_mask
				local frame_write_mask_size = frame_write_mask_style.texture_size
				local frame_write_mask_offset = frame_write_mask_style.offset

				frame_write_mask_offset[1] = -frame_write_mask_size[1] + frame_write_mask_size[1] * 2 * anim_progress
				frame_write_mask_offset[2] = -frame_write_mask_size[2] + frame_write_mask_size[2] * 2 * anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 2.2,
			name = "fade_out",
			start_progress = 1.8,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = 1 - math.easeInCubic(progress)
				local widget = widgets.approved

				widget.alpha_multiplier = anim_progress

				local product_widget = params.product_widget

				product_widget.alpha_multiplier = anim_progress

				local product_widget_style = product_widget.style

				product_widget_style.owned_icon_bg.color[1] = 255 * math.ease_out_quad(1 - progress)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 2.3,
			name = "blur_progress_out",
			start_progress = 1.9,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = 1 - math.easeInCubic(progress)

				params.blur_progress = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	on_enter = {
		{
			end_progress = 0.3,
			name = "fade_in",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				params.render_settings.alpha_multiplier = anim_progress
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
}
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
			UILayer.default,
		},
	},
	screen = {
		scale = "fit",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			UILayer.default,
		},
	},
	purchase_overlay = {
		scale = "fit",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			900,
		},
	},
	purchase_background = {
		horizontal_alignment = "center",
		parent = "purchase_overlay",
		vertical_alignment = "center",
		size = window_size,
		position = {
			0,
			0,
			1,
		},
	},
	purchase_background_fade = {
		horizontal_alignment = "center",
		parent = "purchase_background",
		vertical_alignment = "center",
		size = inner_window_size,
		position = {
			0,
			0,
			1,
		},
	},
	background_edge_top = {
		horizontal_alignment = "center",
		parent = "purchase_background",
		vertical_alignment = "top",
		size = {
			window_size[1],
			79,
		},
		position = {
			0,
			0,
			2,
		},
	},
	background_edge_bottom = {
		horizontal_alignment = "center",
		parent = "purchase_background",
		vertical_alignment = "bottom",
		size = {
			window_size[1],
			79,
		},
		position = {
			0,
			0,
			2,
		},
	},
	background_edge_left = {
		horizontal_alignment = "left",
		parent = "purchase_background",
		vertical_alignment = "center",
		size = {
			79,
			window_size[2],
		},
		position = {
			0,
			0,
			2,
		},
	},
	background_edge_right = {
		horizontal_alignment = "right",
		parent = "purchase_background",
		vertical_alignment = "center",
		size = {
			79,
			window_size[2],
		},
		position = {
			0,
			0,
			2,
		},
	},
	corner_bottom_left = {
		horizontal_alignment = "left",
		parent = "purchase_background",
		vertical_alignment = "bottom",
		size = {
			385,
			381,
		},
		position = {
			-25,
			-25,
			3,
		},
	},
	corner_bottom_right = {
		horizontal_alignment = "right",
		parent = "purchase_background",
		vertical_alignment = "bottom",
		size = {
			385,
			381,
		},
		position = {
			29,
			-23,
			3,
		},
	},
	corner_top_left = {
		horizontal_alignment = "left",
		parent = "purchase_background",
		vertical_alignment = "top",
		size = {
			385,
			381,
		},
		position = {
			-27,
			23,
			3,
		},
	},
	corner_top_right = {
		horizontal_alignment = "right",
		parent = "purchase_background",
		vertical_alignment = "top",
		size = {
			385,
			381,
		},
		position = {
			27,
			25,
			3,
		},
	},
	purchase_confirmation_approved = {
		horizontal_alignment = "center",
		parent = "purchase_overlay",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			0,
			100,
			1,
		},
	},
	purchase_confirmation_declined = {
		horizontal_alignment = "center",
		parent = "purchase_overlay",
		vertical_alignment = "center",
		size = {
			256,
			512,
		},
		position = {
			0,
			0,
			1,
		},
	},
	purchase_confirmation_loading = {
		horizontal_alignment = "center",
		parent = "purchase_overlay",
		vertical_alignment = "center",
		size = {
			314,
			33,
		},
		position = {
			0,
			0,
			1,
		},
	},
	item_name_text = {
		horizontal_alignment = "center",
		parent = "purchase_background_fade",
		vertical_alignment = "top",
		size = {
			inner_window_size[1] - 30,
			60,
		},
		position = {
			0,
			-80,
			2,
		},
	},
	item_name_text_edge_top = {
		horizontal_alignment = "center",
		parent = "item_name_text",
		vertical_alignment = "top",
		size = {
			inner_window_size[1] - 30,
			4,
		},
		position = {
			0,
			4,
			1,
		},
	},
	item_name_text_edge_bottom = {
		horizontal_alignment = "center",
		parent = "item_name_text",
		vertical_alignment = "bottom",
		size = {
			inner_window_size[1] - 30,
			4,
		},
		position = {
			0,
			-4,
			1,
		},
	},
	item_type_text = {
		horizontal_alignment = "center",
		parent = "item_name_text",
		vertical_alignment = "top",
		size = {
			inner_window_size[1] - 30,
			50,
		},
		position = {
			0,
			-65,
			2,
		},
	},
	purchase_button = {
		horizontal_alignment = "center",
		parent = "purchase_background_fade",
		vertical_alignment = "bottom",
		size = {
			350,
			68,
		},
		position = {
			0,
			55,
			10,
		},
	},
	currency_background = {
		horizontal_alignment = "center",
		parent = "purchase_button",
		vertical_alignment = "bottom",
		size = {
			250,
			100,
		},
		position = {
			0,
			90,
			0,
		},
	},
	purchase_item_root = {
		horizontal_alignment = "center",
		parent = "item_name_text_edge_bottom",
		vertical_alignment = "top",
		size = {
			0,
			0,
		},
		position = {
			0,
			-290,
			2,
		},
	},
	currency_current = {
		horizontal_alignment = "right",
		parent = "currency_background",
		vertical_alignment = "top",
		size = {
			180,
			20,
		},
		position = {
			-10,
			-20,
			2,
		},
	},
	currency_cost = {
		horizontal_alignment = "right",
		parent = "currency_background",
		vertical_alignment = "top",
		size = {
			180,
			20,
		},
		position = {
			-10,
			-50,
			2,
		},
	},
	currency_cost_edge = {
		horizontal_alignment = "right",
		parent = "currency_background",
		vertical_alignment = "bottom",
		size = {
			210,
			2,
		},
		position = {
			-10,
			40,
			2,
		},
	},
	currency_balance = {
		horizontal_alignment = "right",
		parent = "currency_background",
		vertical_alignment = "bottom",
		size = {
			180,
			20,
		},
		position = {
			-10,
			10,
			2,
		},
	},
	currency_icon = {
		horizontal_alignment = "left",
		parent = "currency_cost_edge",
		vertical_alignment = "center",
		size = {
			64,
			64,
		},
		position = {
			-32,
			0,
			1,
		},
	},
	close_button = {
		horizontal_alignment = "center",
		parent = "purchase_background",
		vertical_alignment = "bottom",
		size = {
			260,
			42,
		},
		position = {
			0,
			-80,
			1,
		},
	},
}
local item_type_text_style = {
	dynamic_font_size = true,
	font_size = 28,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = true,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "bottom",
	text_color = Colors.get_color_table_with_alpha("font_default", 255),
	offset = {
		0,
		0,
		2,
	},
}
local item_name_text_style = {
	dynamic_font_size = false,
	font_size = 42,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "center",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
	offset = {
		0,
		2,
		2,
	},
}
local disable_with_gamepad = true
local static_widget_definitions = {
	purchase_overlay = UIWidgets.create_simple_rect("purchase_overlay", {
		50,
		10,
		10,
		10,
	}),
}
local widget_definitions_by_state = {
	popup = {
		item_type_text = UIWidgets.create_simple_text("", "item_type_text", nil, nil, item_type_text_style),
		item_name_text = UIWidgets.create_simple_text("n/a", "item_name_text", nil, nil, item_name_text_style),
		item_name_text_background = UIWidgets.create_simple_texture("store_preview_info_text_backdrop", "item_name_text"),
		item_name_text_edge_top = UIWidgets.create_simple_texture("store_preview_info_backdrop_border", "item_name_text_edge_top"),
		item_name_text_edge_bottom = UIWidgets.create_simple_texture("store_preview_info_backdrop_border", "item_name_text_edge_bottom"),
		background_edge_top = UIWidgets.create_tiled_texture("background_edge_top", "store_frame_side_01", {
			128,
			79,
		}),
		background_edge_bottom = UIWidgets.create_tiled_texture("background_edge_bottom", "store_frame_side_03", {
			128,
			79,
		}),
		background_edge_left = UIWidgets.create_tiled_texture("background_edge_left", "store_frame_side_04", {
			79,
			128,
		}),
		background_edge_right = UIWidgets.create_tiled_texture("background_edge_right", "store_frame_side_02", {
			79,
			128,
		}),
		purchase_background = UIWidgets.create_tiled_texture("purchase_background", "menu_frame_bg_03", {
			256,
			256,
		}),
		purchase_background_fade = UIWidgets.create_simple_texture("options_window_fade_01", "purchase_background_fade"),
		corner_bottom_left = UIWidgets.create_simple_rotated_texture("store_frame_corner", 0, {
			192.5,
			190.5,
		}, "corner_bottom_left"),
		corner_bottom_right = UIWidgets.create_simple_rotated_texture("store_frame_corner", -math.pi / 2, {
			192.5,
			190.5,
		}, "corner_bottom_right"),
		corner_top_left = UIWidgets.create_simple_rotated_texture("store_frame_corner", math.pi / 2, {
			192.5,
			190.5,
		}, "corner_top_left"),
		corner_top_right = UIWidgets.create_simple_rotated_texture("store_frame_corner", math.pi, {
			192.5,
			190.5,
		}, "corner_top_right"),
		purchase_button = UIWidgets.create_store_purchase_button("purchase_button", scenegraph_definition.purchase_button.size, Localize("menu_store_purchase_button_unlock"), 32, disable_with_gamepad),
		close_button = UIWidgets.create_default_button("close_button", scenegraph_definition.close_button.size, "button_frame_01_gold", "menu_frame_bg_06", Localize("interaction_action_close"), 28, nil, "button_detail_03_gold", nil, disable_with_gamepad),
	},
	poll_result = {
		loading_icon = {
			scenegraph_id = "purchase_confirmation_loading",
			element = {
				passes = {
					{
						pass_type = "texture",
						style_id = "background",
						texture_id = "background",
						content_change_function = function (content, style, _, dt)
							local progress = style.progress or 0
							local speed = 0.5

							progress = (progress + dt * speed) % 1

							local anim_progress = math.smoothstep(progress, 0, 1)

							style.progress = progress

							local fade_out = content.fade_out
							local alpha = 255 * math.ease_pulse(anim_progress)

							style.color[1] = fade_out and math.min(style.color[1], alpha) or alpha
						end,
					},
					{
						pass_type = "texture",
						style_id = "glow",
						texture_id = "glow",
						content_change_function = function (content, style, _, dt)
							local progress = style.progress or 0
							local speed = 0.5

							progress = (progress + dt * speed) % 1

							local anim_progress = math.smoothstep(progress, 0, 1)

							style.progress = progress

							local fade_out = content.fade_out
							local alpha = 255 * math.ease_pulse(anim_progress)

							style.color[1] = fade_out and math.min(style.color[1], alpha) or alpha
						end,
					},
				},
			},
			content = {
				background = "loading_title_divider_background",
				fade_out = false,
				glow = "loading_title_divider",
			},
			style = {
				background = {
					progress = 0,
					color = {
						255,
						255,
						255,
						255,
					},
					offset = {
						0,
						0,
						0,
					},
				},
				glow = {
					progress = 0,
					color = {
						255,
						255,
						255,
						255,
					},
					offset = {
						0,
						0,
						1,
					},
				},
			},
			offset = {
				0,
				0,
				0,
			},
		},
	},
	approved = {
		approved = {
			scenegraph_id = "purchase_confirmation_approved",
			element = {
				passes = {
					{
						pass_type = "text",
						style_id = "text",
						text_id = "text",
					},
					{
						pass_type = "text",
						style_id = "text_shadow",
						text_id = "text",
					},
					{
						pass_type = "text",
						style_id = "description_text",
						text_id = "description_text",
					},
					{
						pass_type = "text",
						style_id = "description_text_shadow",
						text_id = "description_text",
					},
					{
						pass_type = "texture_frame",
						style_id = "frame",
						texture_id = "frame",
					},
					{
						pass_type = "texture",
						style_id = "frame_write_mask",
						texture_id = "frame_write_mask",
					},
					{
						pass_type = "rect",
						style_id = "title_divider",
					},
				},
			},
			content = {
				description_text = "inventory_item_added",
				frame = "menu_frame_16_white",
				frame_write_mask = "diagonal_center_fade_write_mask",
				text = "menu_store_purchase_confirmation_approved",
			},
			style = {
				frame = {
					horizontal_alignment = "center",
					masked = true,
					vertical_alignment = "center",
					area_size = {
						260,
						220,
					},
					texture_size = UIFrameSettings.menu_frame_16.texture_size,
					texture_sizes = UIFrameSettings.menu_frame_16.texture_sizes,
					frame_margins = {
						0,
						0,
					},
					color = {
						100,
						255,
						255,
						255,
					},
					offset = {
						0,
						0,
						9,
					},
				},
				frame_write_mask = {
					horizontal_alignment = "center",
					vertical_alignment = "center",
					texture_size = {
						520,
						440,
					},
					color = {
						255,
						255,
						255,
						255,
					},
					offset = {
						0,
						0,
						2,
					},
				},
				title_divider = {
					horizontal_alignment = "center",
					vertical_alignment = "center",
					texture_size = {
						350,
						2,
					},
					color = {
						50,
						255,
						255,
						255,
					},
					offset = {
						0,
						-210,
						6,
					},
				},
				text = {
					font_size = 52,
					font_type = "hell_shark_header",
					horizontal_alignment = "center",
					localize = true,
					upper_case = true,
					vertical_alignment = "center",
					text_color = Colors.get_color_table_with_alpha("white", 255),
					offset = {
						0,
						-180,
						2,
					},
				},
				text_shadow = {
					font_size = 52,
					font_type = "hell_shark_header",
					horizontal_alignment = "center",
					localize = true,
					upper_case = true,
					vertical_alignment = "center",
					text_color = Colors.get_color_table_with_alpha("black", 255),
					offset = {
						2,
						-182,
						1,
					},
				},
				description_text = {
					font_size = 20,
					font_type = "hell_shark",
					horizontal_alignment = "center",
					localize = true,
					upper_case = true,
					vertical_alignment = "top",
					text_color = {
						255,
						200,
						200,
						200,
					},
					offset = {
						-350,
						-320,
						2,
					},
					size = {
						700,
						100,
					},
				},
				description_text_shadow = {
					font_size = 20,
					font_type = "hell_shark",
					horizontal_alignment = "center",
					localize = true,
					upper_case = true,
					vertical_alignment = "top",
					text_color = Colors.get_color_table_with_alpha("black", 255),
					offset = {
						-352,
						-322,
						1,
					},
					size = {
						700,
						100,
					},
				},
			},
			offset = {
				0,
				0,
				0,
			},
		},
	},
	declined = {},
}
local PRODUCT_PLACEHOLDER_TEXTURE_PATH = "gui/1080p/single_textures/generic/transparent_placeholder_texture"

StoreItemPurchasePopup = class(StoreItemPurchasePopup)

StoreItemPurchasePopup.init = function (self, ingame_ui, product, state)
	self._product = product
	self._ingame_ui = ingame_ui
	self._top_world = ingame_ui.top_world
	self._cloned_materials_by_reference = {}
	self._loaded_package_names = {}
	self._render_settings = {
		alpha_multiplier = 1,
	}
	self._animations = {}
	self._ui_animations = {}

	self:_setup_renderers()

	local world = Managers.world:world("level_world")

	self._wwise_world = Managers.world:wwise_world(world)
	self._level_world = world

	self:_create_ui_elements()
	self:_change_state(state or "popup")
end

StoreItemPurchasePopup._setup_renderers = function (self)
	local world_name = "store_purchase_ui_world"
	local layer = 999

	self._purchase_ui_world_viewport_name = "store_purchase_ui_world_viewport"
	self._purchase_ui_world = Managers.world:create_world(world_name, GameSettingsDevelopment.default_environment, nil, layer, Application.DISABLE_PHYSICS, Application.DISABLE_APEX_CLOTH)

	ScriptWorld.create_viewport(self._purchase_ui_world, self._purchase_ui_world_viewport_name, "overlay", 1)

	self._purchase_ui_renderer = self._ingame_ui:create_ui_renderer(self._purchase_ui_world, false, true)

	local blur_layer = 998
	local blur_world_name = "store_purchase_ui_blur_world"
	local blur_shading_environment = "environment/ui_store_default"

	self._blur_purchase_ui_world_viewport_name = "store_purchase_ui_blur_world_viewport"
	self._blur_purchase_ui_world = Managers.world:create_world(blur_world_name, blur_shading_environment, nil, blur_layer, Application.DISABLE_PHYSICS, Application.DISABLE_APEX_CLOTH)

	ScriptWorld.create_viewport(self._blur_purchase_ui_world, self._blur_purchase_ui_world_viewport_name, "overlay", 1)

	self._blur_purchase_ui_renderer = self._ingame_ui:create_ui_renderer(self._blur_purchase_ui_world, false, true)
end

StoreItemPurchasePopup._destroy_renderers = function (self)
	UIRenderer.destroy(self._purchase_ui_renderer, self._purchase_ui_world)
	ScriptWorld.destroy_viewport(self._purchase_ui_world, self._purchase_ui_world_viewport_name)
	Managers.world:destroy_world(self._purchase_ui_world)

	self._purchase_ui_world = nil
	self._purchase_ui_renderer = nil
	self._purchase_ui_world_viewport_name = nil

	UIRenderer.destroy(self._blur_purchase_ui_renderer, self._blur_purchase_ui_world)
	ScriptWorld.destroy_viewport(self._blur_purchase_ui_world, self._blur_purchase_ui_world_viewport_name)
	Managers.world:destroy_world(self._blur_purchase_ui_world)

	self._blur_purchase_ui_world = nil
	self._blur_purchase_ui_renderer = nil
	self._blur_purchase_ui_world_viewport_name = nil
end

StoreItemPurchasePopup._create_gamepad_input_description = function (self, input_service)
	local generic_input_actions = {
		{
			description_text = "menu_store_purchase_button_unlock",
			input_action = "confirm",
			priority = 2,
		},
		{
			description_text = "input_description_close",
			input_action = "back",
			priority = 3,
		},
	}

	self._menu_input_description = MenuInputDescriptionUI:new(nil, self._purchase_ui_renderer, input_service, 6, nil, generic_input_actions, false)

	self._menu_input_description:set_input_description(nil)
end

StoreItemPurchasePopup._change_state = function (self, state)
	if self._state then
		local on_exit_function = "_" .. self._state .. "_on_exit"

		if self[on_exit_function] then
			self[on_exit_function](self)
		end
	end

	if state then
		local on_enter_function = "_" .. state .. "_on_enter"

		if self[on_enter_function] then
			self[on_enter_function](self)
		end
	end

	print("[StoreItemPurchasePopup] - New State:", state, " Previous State:", self._state)

	self._state = state
end

StoreItemPurchasePopup._set_fullscreen_effect_enable_state = function (self, enabled, progress, world)
	local shading_env = World.get_data(world, "shading_environment")

	progress = progress or enabled and 1 or 0

	if shading_env then
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_enabled", enabled and 1 or 0)
		ShadingEnvironment.set_scalar(shading_env, "fullscreen_blur_amount", enabled and progress * 0.8 or 0)
		ShadingEnvironment.apply(shading_env)
	end

	self._fullscreen_effect_enabled = enabled
end

StoreItemPurchasePopup.is_complete = function (self)
	return self._state == "exit"
end

StoreItemPurchasePopup.is_aborted = function (self)
	return self._state == "aborted"
end

StoreItemPurchasePopup.destroy = function (self)
	if self._blur_purchase_ui_world and self._fullscreen_effect_enabled then
		self:_set_fullscreen_effect_enable_state(false, 0, self._blur_purchase_ui_world)
	end

	self:_destroy_renderers()

	self._destroyed = true
end

StoreItemPurchasePopup._create_ui_elements = function (self, params)
	self._ui_scenegraph = UISceneGraph.init_scenegraph(scenegraph_definition)

	local widgets_by_name = {}
	local widgets_by_state = {}
	local static_widgets = {}

	for name, widget_definition in pairs(static_widget_definitions) do
		local widget = UIWidget.init(widget_definition)

		static_widgets[#static_widgets + 1] = widget
		widgets_by_name[name] = widget
	end

	for state_name, widget_definitions in pairs(widget_definitions_by_state) do
		local state_widgets = {}

		for name, widget_definition in pairs(widget_definitions) do
			local widget = UIWidget.init(widget_definition)

			widgets_by_name[name] = widget
			state_widgets[#state_widgets + 1] = widget
		end

		widgets_by_state[state_name] = state_widgets
	end

	self._static_widgets = static_widgets
	self._widgets_by_name = widgets_by_name
	self._widgets_by_state = widgets_by_state

	UIRenderer.clear_scenegraph_queue(self._purchase_ui_renderer)

	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)
end

StoreItemPurchasePopup._draw = function (self, input_service, dt)
	local purchase_ui_renderer = self._purchase_ui_renderer
	local blur_purchase_ui_renderer = self._blur_purchase_ui_renderer
	local ui_scenegraph = self._ui_scenegraph
	local render_settings = self._render_settings
	local gamepad_active = Managers.input:is_device_active("gamepad")

	UIRenderer.begin_pass(blur_purchase_ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local snap_pixel_positions = render_settings.snap_pixel_positions
	local alpha_multiplier = render_settings.alpha_multiplier or 1

	for _, widget in ipairs(self._static_widgets) do
		if widget.snap_pixel_positions ~= nil then
			render_settings.snap_pixel_positions = widget.snap_pixel_positions
		end

		render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

		UIRenderer.draw_widget(blur_purchase_ui_renderer, widget)

		render_settings.snap_pixel_positions = snap_pixel_positions
	end

	render_settings.alpha_multiplier = alpha_multiplier

	UIRenderer.end_pass(blur_purchase_ui_renderer)
	UIRenderer.begin_pass(purchase_ui_renderer, ui_scenegraph, input_service, dt, nil, render_settings)

	local snap_pixel_positions = render_settings.snap_pixel_positions
	local alpha_multiplier = render_settings.alpha_multiplier or 1
	local product_widget = self._product_widget

	if product_widget then
		render_settings.alpha_multiplier = product_widget.alpha_multiplier or alpha_multiplier

		UIRenderer.draw_widget(purchase_ui_renderer, product_widget)
	end

	local state = self._state

	if state then
		local widgets_by_state = self._widgets_by_state
		local state_widgets = widgets_by_state[state]

		if state_widgets then
			for _, widget in ipairs(state_widgets) do
				if widget.snap_pixel_positions ~= nil then
					render_settings.snap_pixel_positions = widget.snap_pixel_positions
				end

				render_settings.alpha_multiplier = widget.alpha_multiplier or alpha_multiplier

				UIRenderer.draw_widget(purchase_ui_renderer, widget)

				render_settings.snap_pixel_positions = snap_pixel_positions
			end
		end
	end

	render_settings.alpha_multiplier = alpha_multiplier

	UIRenderer.end_pass(purchase_ui_renderer)

	if gamepad_active then
		self._menu_input_description:draw(purchase_ui_renderer, dt)
	end
end

StoreItemPurchasePopup.update = function (self, input_service, dt, t)
	if not self._menu_input_description then
		self:_create_gamepad_input_description(input_service)
	end

	local state = self._state

	if state then
		local state_update_function = "_" .. state .. "_update"

		if self[state_update_function] then
			self[state_update_function](self, input_service, dt, t)
		end
	end

	local blur_progress = self._blur_progress or self._render_settings.alpha_multiplier

	if blur_progress then
		self:_set_fullscreen_effect_enable_state(true, blur_progress, self._blur_purchase_ui_world)
	elseif self._fullscreen_effect_enabled then
		self:_set_fullscreen_effect_enable_state(false, 0, self._blur_purchase_ui_world)
	end

	self:_update_animations(dt)
	self:_draw(input_service, dt)
end

StoreItemPurchasePopup._update_animations = function (self, dt)
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

StoreItemPurchasePopup._is_button_hover_enter = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot

	return hotspot.on_hover_enter
end

StoreItemPurchasePopup._is_button_pressed = function (self, widget)
	local content = widget.content
	local hotspot = content.button_hotspot or content.hotspot

	if hotspot.on_release then
		hotspot.on_release = false

		return true
	end
end

StoreItemPurchasePopup._play_sound = function (self, event)
	WwiseWorld.trigger_event(self._wwise_world, event)
end

StoreItemPurchasePopup._destroy_product_widget = function (self, widget, product)
	local content = widget.content
	local reference_name = content.reference_name

	if reference_name then
		local product_id = product.product_id
		local product_type = product.type

		if product_type == "item" then
			self:_unload_texture_by_reference(reference_name)
		elseif product_type == "dlc" then
			self:_unload_texture_by_reference(reference_name)
		end
	end
end

StoreItemPurchasePopup._create_material_instance = function (self, gui, new_material_name, template_material_name, reference_name)
	local cloned_materials_by_reference = self._cloned_materials_by_reference

	cloned_materials_by_reference[reference_name] = new_material_name

	return Gui.clone_material_from_template(gui, new_material_name, template_material_name)
end

StoreItemPurchasePopup._set_material_diffuse = function (self, gui, material_name, texture_path)
	local material = Gui.material(gui, material_name)

	if material then
		Material.set_texture(material, "diffuse_map", texture_path)
	end
end

StoreItemPurchasePopup._load_texture_package = function (self, package_name, reference_name, callback)
	local asynchronous = true
	local prioritize = true

	Managers.package:load(package_name, reference_name, callback, asynchronous, prioritize)

	local loaded_package_names = self._loaded_package_names

	loaded_package_names[reference_name] = package_name
end

StoreItemPurchasePopup._is_unique_reference_to_material = function (self, reference_name)
	local cloned_materials_by_reference = self._cloned_materials_by_reference
	local material_name = cloned_materials_by_reference[reference_name]

	fassert(material_name, "[StoreItemPurchasePopup] - Could not find a used material for reference name: (%s)", reference_name)

	for key, value in pairs(cloned_materials_by_reference) do
		if material_name == value and reference_name ~= key then
			return false
		end
	end

	return true
end

StoreItemPurchasePopup._unload_texture_by_reference = function (self, reference_name)
	local loaded_package_names = self._loaded_package_names
	local cloned_materials_by_reference = self._cloned_materials_by_reference
	local package_name = loaded_package_names[reference_name]

	fassert(package_name, "[StoreItemPurchasePopup] - Could not find a package to unload for reference name: (%s)", reference_name)
	Managers.package:unload(package_name, reference_name)

	loaded_package_names[reference_name] = nil

	if self:_is_unique_reference_to_material(reference_name) then
		local material_name = cloned_materials_by_reference[reference_name]
		local purchase_ui_renderer = self._purchase_ui_renderer
		local top_gui = purchase_ui_renderer.gui

		self:_set_material_diffuse(top_gui, material_name, PRODUCT_PLACEHOLDER_TEXTURE_PATH)
	end

	cloned_materials_by_reference[reference_name] = nil
end

StoreItemPurchasePopup._unload_all_textures = function (self)
	local loaded_package_names = self._loaded_package_names

	for reference_name, package_name in pairs(loaded_package_names) do
		self:_unload_texture_by_reference(reference_name)
	end
end

StoreItemPurchasePopup._calculate_discount_textures = function (self, widget, discount)
	local content = widget.content
	local style = widget.style
	local icons_style = style.discont_number_icons
	local icons_content = content.discont_number_icons
	local texture_sizes = icons_style.texture_sizes
	local texture_offsets = icons_style.texture_offsets
	local offset = icons_style.offset
	local default_offset = icons_style.default_offset
	local total_width = 0
	local previous_offset_x = 0
	local height_spacing = 9
	local area_length = 106
	local discount_string = tostring(math.floor(discount))
	local length = string.len(discount_string) + 2

	for i = 1, length do
		local texture_name

		if i == 1 then
			texture_name = "store_number_minus"
		elseif i == length then
			texture_name = "store_number_percent"
		else
			local char = string.sub(discount_string, i - 1, i - 1)

			texture_name = "store_number_" .. char
		end

		local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(texture_name)
		local size = {
			texture_settings.size[1],
			texture_settings.size[2],
		}

		icons_content[i] = texture_name
		texture_sizes[i] = size

		local x = -(total_width * 0.5 + height_spacing * 0.5 * i)
		local y = height_spacing * i

		texture_offsets[i] = {
			x,
			y,
			0,
		}
		total_width = total_width + size[1]
	end

	content.discount = true
end

StoreItemPurchasePopup._start_transition_animation = function (self, key, animation_name, optional_widgets)
	local params = {
		wwise_world = self._wwise_world,
		render_settings = self._render_settings,
		product_widget = self._product_widget,
	}
	local widgets = optional_widgets or self._widgets_by_name
	local anim_id = self._ui_animator:start_animation(animation_name, widgets, scenegraph_definition, params)

	self._animations[key] = anim_id

	return params
end

StoreItemPurchasePopup._popup_on_enter = function (self)
	local product = self._product
	local item = product.product_item or product.item
	local item_data = item.data
	local item_rarity = item_data.rarity
	local item_type = item_data.item_type
	local widgets_by_name = self._widgets_by_name
	local _, display_name = UIUtils.get_ui_information_from_item(item)
	local item_name_text = widgets_by_name.item_name_text

	item_name_text.content.text = Localize(display_name)

	local rarity_color = Colors.get_color_table_with_alpha(item_rarity, 255)

	item_name_text.style.text.text_color = rarity_color

	local scenegraph_id = "purchase_item_root"
	local product_widget = self:_create_popup_widget(product, scenegraph_id)

	self._product_widget = product_widget

	local content = product_widget.content
	local size = content.size

	product_widget.offset[1] = -size[1] / 2
	product_widget.offset[2] = size[2]

	local widgets_by_name = self._widgets_by_name
	local purchase_button = widgets_by_name.purchase_button

	if purchase_button then
		local button_content = purchase_button.content

		button_content.present_currency = false

		local button_style = purchase_button.style

		button_style.title_text.offset[1] = 0
		button_style.title_text.horizontal_alignment = "center"
		button_style.title_text_disabled.horizontal_alignment = "center"
		button_style.title_text_disabled.offset[1] = 0
		button_style.title_text_write_mask.offset[1] = 0
		button_style.title_text_write_mask.horizontal_alignment = "center"
		button_style.title_text_shadow.offset[1] = 2
		button_style.title_text_shadow.horizontal_alignment = "center"
	end

	local widgets_by_name = self._widgets_by_name
	local item_type_text = widgets_by_name.item_type_text

	if item_type_text then
		item_type_text.content.text = item_type
	end

	local anim_name = "on_enter"

	self:_start_transition_animation(anim_name, anim_name, self._widgets_by_name)
end

StoreItemPurchasePopup._create_popup_widget = function (self, product, scenegraph_id, display_as_owned)
	local product = self._product
	local product_id = product.product_id
	local item = product.product_item or product.item
	local masked = false
	local item_size = {
		260,
		220,
	}
	local definition = UIWidgets.create_store_item_definition(scenegraph_id, item_size, masked, product)
	local widget = UIWidget.init(definition)

	self:_populate_item_widget(widget, item, product_id, display_as_owned)

	return widget
end

StoreItemPurchasePopup._popup_update = function (self, input_service, dt, t)
	local input_pressed = input_service:get("toggle_menu", true)
	local back_pressed = input_service:get("back_menu", true)
	local purchase_pressed = input_service:get("confirm_press", true)
	local widgets_by_name = self._widgets_by_name
	local purchase_button = widgets_by_name.purchase_button
	local close_button = widgets_by_name.close_button

	UIWidgetUtils.animate_default_button(purchase_button, dt)
	UIWidgetUtils.animate_default_button(close_button, dt)

	if back_pressed or input_pressed or self:_is_button_pressed(close_button) then
		self:_play_sound("Play_hud_select")
		self:_change_state("aborted")
	else
		if self:_is_button_hover_enter(purchase_button) or self:_is_button_hover_enter(close_button) then
			self:_play_sound("Play_hud_hover")
		end

		if self:_is_button_pressed(purchase_button) or purchase_pressed then
			self:_play_sound("Play_hud_store_button_buy")
			self:_change_state("poll_result")
		end
	end
end

StoreItemPurchasePopup._popup_on_exit = function (self)
	self:_destroy_product_widget(self._product_widget, self._product)

	self._product_widget = nil
	self._blur_progress = nil
end

StoreItemPurchasePopup._poll_result_on_enter = function (self)
	local item_currency_settings = DLCSettings.store.currency_ui_settings
	local product = self._product
	local item = product.product_item or product.item
	local item_key = item.key
	local regular_prices = item.regular_prices
	local current_prices = item.current_prices
	local currency_type = "SM"

	if regular_prices or current_prices then
		for currency, settings in pairs(item_currency_settings) do
			local has_regular_price = regular_prices[currency]
			local has_current_price = current_prices[currency]

			if has_regular_price and has_current_price then
				currency_type = currency

				break
			end
		end
	end

	local price = current_prices[currency_type] or regular_prices[currency_type]
	local expected_amount = price
	local callback = callback(self, "_backend_result_callback")
	local store_interface = Managers.backend:get_interface("peddler")

	store_interface:exchange_chips(item_key, currency_type, expected_amount, callback)
end

StoreItemPurchasePopup._backend_result_callback = function (self, success, items)
	if self._destroyed then
		return
	end

	print("_backend_result_callback", success)

	if success then
		Managers.telemetry_events:store_product_purchased(self._product)
		self:_change_state("approved")
	else
		self:_change_state("exit")
	end
end

local item_backgrounds_by_rarirty = {
	common = "store_thumbnail_bg_common",
	exotic = "store_thumbnail_bg_exotic",
	magic = "store_thumbnail_bg_magic",
	plentiful = "store_thumbnail_bg_plentiful",
	promo = "store_thumbnail_bg_promo",
	rare = "store_thumbnail_bg_rare",
	unique = "store_thumbnail_bg_unique",
}

StoreItemPurchasePopup._populate_item_widget = function (self, widget, item, product_id, display_as_owned)
	local item_rarity_textures = UISettings.item_rarity_textures
	local item_type_store_icons = UISettings.item_type_store_icons
	local item_currency_settings = DLCSettings.store.currency_ui_settings
	local item_data = item.data
	local parent_id
	local has_parent = false
	local inventory_icon, display_name, description, rarity

	if item.data and item.data.parent then
		local parent_item_data = ItemMasterList[item.data.parent]

		inventory_icon = parent_item_data.inventory_icon
		display_name = parent_item_data.display_name
		description = parent_item_data.description
		rarity = parent_item_data.rarity
		parent_id = item.data.parent
		has_parent = true
	else
		inventory_icon, display_name, description = UIUtils.get_ui_information_from_item(item)
		rarity = item.rarity or item_data.rarity
	end

	local item_type = item_data.item_type
	local content = widget.content
	local style = widget.style
	local masked = style.icon.masked
	local rarity_background = item_backgrounds_by_rarirty[rarity]

	content.background = rarity_background

	local overlay_z = style.overlay.offset[3]
	local icon_z = style.icon.offset[3]

	style.icon.offset[3] = overlay_z
	style.overlay.offset[3] = icon_z

	local currency_type = "SM"
	local regular_prices = item.regular_prices
	local current_prices = item.current_prices

	if regular_prices or current_prices then
		for currency, settings in pairs(item_currency_settings) do
			local has_regular_price = regular_prices[currency]
			local has_current_price = current_prices[currency]

			if has_regular_price and has_current_price then
				currency_type = currency

				break
			end
		end

		local regular_price = regular_prices[currency_type]
		local current_price = current_prices[currency_type]

		if current_price ~= regular_price then
			local discount = 1 - current_price / regular_price

			self:_calculate_discount_textures(widget, math.round(100 * discount))
		end

		local real_currency = false
		local price_text = UIUtils.comma_value(tostring(current_price))

		self:_set_product_price_text(widget, price_text, real_currency)

		content.price_icon = item_currency_settings[currency_type].icon_small
	end

	local backend_items = Managers.backend:get_interface("items")
	local item_key = item.key
	local item_owned = backend_items:has_item(item_key)
	local item_data = item.data
	local item_type = item_data.item_type

	content.owned = display_as_owned or item_owned

	local allowed_store_item_types = DLCSettings.store.allowed_store_item_types
	local type_tag_icon

	if allowed_store_item_types[item_type] then
		type_tag_icon = item_type_store_icons[item_type]

		if rarity and rarity ~= "default" then
			type_tag_icon = type_tag_icon .. "_" .. rarity
		end
	else
		type_tag_icon = item_type_store_icons[item_type] or item_type_store_icons.default
	end

	content.type_tag_icon = type_tag_icon

	local purchase_ui_renderer = self._purchase_ui_renderer
	local gui = purchase_ui_renderer.gui
	local store_icon_override_key = item_data.store_icon_override_key

	self._reference_id = (self._reference_id or 0) + 1

	local reference_name = "StoreItemPurchasePopup_" .. product_id .. "_" .. self._reference_id
	local package_product_id = has_parent and parent_id and parent_id or store_icon_override_key or product_id
	local texture_name = "store_item_icon_" .. package_product_id
	local package_name = "resource_packages/store/item_icons/" .. texture_name
	local package_available = Application.can_get("package", package_name)

	if package_available then
		content.reference_name = reference_name

		local new_material_name = masked and texture_name .. "_masked" or texture_name
		local template_material_name = masked and "template_store_diffuse_masked" or "template_store_diffuse"

		self:_create_material_instance(gui, new_material_name, template_material_name, reference_name)

		local function callback()
			if self._destroyed then
				return
			end

			local texture_path = "gui/1080p/single_textures/store_item_icons/" .. texture_name .. "/" .. texture_name

			self:_set_material_diffuse(gui, new_material_name, texture_path)

			content.icon = new_material_name
		end

		self:_load_texture_package(package_name, reference_name, callback)
	else
		content.icon = inventory_icon

		Application.warning("Icon package not accessable for product_id: (%s) and texture_name: (%s)", product_id, texture_name)
	end
end

StoreItemPurchasePopup._set_product_price_text = function (self, widget, price_text, real_currency)
	local content = widget.content
	local style = widget.style
	local text_style
	local extra_spacing = 0

	if real_currency then
		text_style = style.price_text
		text_style.offset[1] = 23
		content.price_text = price_text
		content.draw_price_icon = false
		extra_spacing = -20
	else
		text_style = style.price_text
		text_style.offset[1] = 50
		content.price_text = price_text
		content.draw_price_icon = true
		extra_spacing = 5
	end

	local text_length = UIUtils.get_text_width(self._purchase_ui_renderer, text_style, price_text)
	local price_tag_style_right = style.background_price_right
	local tag_right_width = price_tag_style_right.default_size[1]
	local center_width = math.max(math.ceil(text_length - tag_right_width) + extra_spacing, 0)
	local price_tag_style_center = style.background_price_center

	price_tag_style_center.texture_size[1] = center_width

	local tag_right_offset = price_tag_style_right.offset
	local tag_right_default_offset = price_tag_style_right.default_offset

	tag_right_offset[1] = tag_right_default_offset[1] + center_width
end

StoreItemPurchasePopup._approved_on_enter = function (self)
	self._ui_animator = UIAnimator:new(self._ui_scenegraph, animation_definitions)

	local product = self._product
	local display_as_owned = true
	local scenegraph_id = "purchase_confirmation_approved"
	local product_widget = self:_create_popup_widget(product, scenegraph_id, display_as_owned)

	self._product_widget = product_widget

	local content = product_widget.content
	local size = content.size

	product_widget.offset[1] = -size[1] / 2
	product_widget.offset[2] = -size[2] / 2

	self:_create_ui_elements()

	local anim_name = "approved"

	self._approved_anim_params = self:_start_transition_animation(anim_name, anim_name, self._widgets_by_name)

	local widgets_by_name = self._widgets_by_name

	widgets_by_name.approved.content.visible = true
	self._purchase_confirmation_anim_duration = 0

	local widgets_by_name = self._widgets_by_name

	widgets_by_name.approved.content.visible = true
end

StoreItemPurchasePopup._approved_update = function (self, input_service, dt, t)
	local purchase_confirmation_anim_duration = self._purchase_confirmation_anim_duration

	if not purchase_confirmation_anim_duration then
		return
	end

	purchase_confirmation_anim_duration = purchase_confirmation_anim_duration + dt

	local progress = math.min(purchase_confirmation_anim_duration / 3, 1)
	local animation_progress = math.easeOutCubic(progress)
	local widgets_by_name = self._widgets_by_name
	local approved_widget = widgets_by_name.approved

	if progress == 1 then
		widgets_by_name.loading_icon.content.fade_out = false
		self._purchase_confirmation_anim_duration = nil
		self._approved_anim_params = nil

		self:_change_state("exit")
	else
		local blur_progress = self._approved_anim_params.blur_progress

		if blur_progress then
			self._blur_progress = blur_progress
		end

		self._purchase_confirmation_anim_duration = purchase_confirmation_anim_duration
	end
end

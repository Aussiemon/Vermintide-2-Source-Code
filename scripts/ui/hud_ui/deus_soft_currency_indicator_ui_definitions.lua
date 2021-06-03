local SIZE_X = 1920
local SIZE_Y = 1080
local coin_ui_multiplier = 1
local COIN_UI_WINDOW_SIZE = {
	325 * coin_ui_multiplier,
	50 * coin_ui_multiplier
}
local scenegraph_definition = {
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.hud
		},
		size = {
			SIZE_X,
			SIZE_Y
		}
	},
	coin_ui = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "right",
		position = {
			0,
			-25,
			0
		},
		size = COIN_UI_WINDOW_SIZE
	}
}

local function create_coin_widget_definition()
	local background_texture = "weaves_essence_bar_backdrop"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local base_height = background_texture_settings.size[2] * 0.5
	local base_offset_x = background_texture_settings.size[1] * 0.5
	local base_offset_y = -2
	local icon_size = {
		base_height,
		base_height
	}

	return {
		scenegraph_id = "coin_ui",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background",
					content_check_function = function (content)
						local current_mechanism_state = Managers.mechanism:get_state()
						local show_background = current_mechanism_state ~= "map_deus"

						return show_background
					end
				},
				{
					pass_type = "texture",
					style_id = "background_glow",
					texture_id = "background_glow"
				},
				{
					pass_type = "texture",
					style_id = "coin_icon",
					texture_id = "coin_icon"
				},
				{
					pass_type = "texture",
					style_id = "coin_icon_mask",
					texture_id = "coin_icon_mask"
				},
				{
					pass_type = "texture",
					style_id = "coin_icon_fx",
					texture_id = "coin_icon_fx"
				},
				{
					pass_type = "texture",
					style_id = "coin_icon_highlight",
					texture_id = "coin_icon_highlight"
				},
				{
					pass_type = "texture",
					style_id = "coin_icon_bloom",
					texture_id = "coin_icon_bloom"
				},
				{
					style_id = "coins_label",
					pass_type = "text",
					text_id = "coins_label"
				},
				{
					style_id = "coins_label_shadow",
					pass_type = "text",
					text_id = "coins_label"
				},
				{
					style_id = "coin_count",
					pass_type = "text",
					text_id = "coin_count_text"
				},
				{
					style_id = "coin_count_shadow",
					pass_type = "text",
					text_id = "coin_count_text"
				},
				{
					style_id = "coin_delta",
					pass_type = "text",
					text_id = "coin_delta"
				}
			}
		},
		content = {
			coin_count_text = "NaN",
			coin_icon = "deus_icons_coin",
			coin_icon_mask = "deus_icons_coin_mask",
			coin_icon_fx = "deus_icons_coin_fx",
			coin_delta = "",
			coin_icon_bloom = "quest_glow",
			background_glow = "horizontal_gradient",
			coin_icon_highlight = "deus_icons_coin_highlight",
			coins_label = "deus_collect_coins_text",
			background = background_texture
		},
		style = {
			background = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				texture_size = background_texture_settings.size,
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
			background_glow = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				texture_size = background_texture_settings.size,
				color = {
					0,
					74,
					243,
					255
				},
				offset = {
					0,
					0,
					0
				}
			},
			coin_icon = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					icon_size[1],
					icon_size[2]
				},
				base_size = {
					icon_size[1],
					icon_size[2]
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					base_offset_x - 155,
					base_offset_y,
					10
				}
			},
			coin_icon_mask = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					icon_size[1],
					icon_size[2]
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					base_offset_x - 155,
					base_offset_y,
					11
				}
			},
			coin_icon_fx = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					icon_size[1],
					icon_size[2]
				},
				color = {
					0,
					255,
					255,
					255
				},
				base_offset = {
					base_offset_x - 155,
					base_offset_y,
					12
				},
				offset = {
					base_offset_x - 155,
					base_offset_y,
					11
				}
			},
			coin_icon_highlight = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					icon_size[1] * 2,
					icon_size[2] * 2
				},
				color = {
					0,
					74,
					243,
					255
				},
				offset = {
					base_offset_x - 155,
					base_offset_y,
					13
				}
			},
			coin_icon_bloom = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					icon_size[1] * 1.75,
					icon_size[2] * 1.75
				},
				base_texture_size = {
					icon_size[1] * 1.75,
					icon_size[2] * 1.75
				},
				color = {
					0,
					74,
					243,
					255
				},
				offset = {
					base_offset_x - 155,
					base_offset_y,
					13
				}
			},
			coins_label = {
				word_wrap = false,
				upper_case = false,
				localize = true,
				font_size = 22,
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				text_color = {
					255,
					255,
					255,
					255
				},
				offset = {
					80,
					-48,
					1
				},
				size = {
					COIN_UI_WINDOW_SIZE[1] - 80,
					COIN_UI_WINDOW_SIZE[2]
				}
			},
			coins_label_shadow = {
				word_wrap = false,
				upper_case = false,
				localize = true,
				font_size = 22,
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				text_color = {
					255,
					0,
					0,
					0
				},
				offset = {
					82,
					-50,
					0
				},
				size = {
					COIN_UI_WINDOW_SIZE[1] - 80,
					COIN_UI_WINDOW_SIZE[2]
				}
			},
			coin_count = {
				word_wrap = false,
				upper_case = false,
				localize = false,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				font_type = "hell_shark_header",
				base_font_size = base_height,
				font_size = base_height,
				text_color = {
					255,
					255,
					255,
					255
				},
				offset = {
					base_offset_x + icon_size[1] + 5,
					base_offset_y - 2,
					1
				}
			},
			coin_count_shadow = {
				word_wrap = false,
				upper_case = false,
				localize = false,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				font_type = "hell_shark_header",
				font_size = base_height,
				text_color = {
					255,
					0,
					0,
					0
				},
				offset = {
					(base_offset_x + icon_size[1] + 5) - 2,
					base_offset_y - 2 - 2,
					0
				}
			},
			coin_delta = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				localize = false,
				font_type = "hell_shark_header",
				font_size = base_height,
				text_color = {
					255,
					200,
					200,
					200
				},
				base_offset = {
					(base_offset_x + icon_size[1] + 5) - 2 + 60,
					base_offset_y - 2 - 2,
					3
				},
				offset = {
					(base_offset_x + icon_size[1] + 5) - 2 + 60,
					base_offset_y - 2 - 2,
					3
				}
			}
		}
	}
end

local animation_definitions = {
	coin_change = {
		{
			name = "count",
			duration = 1.2,
			init = function (ui_scenegraph, scenegraph_definition, coin_widget, params)
				coin_widget.content.coin_delta = string.format("%+d", params.coin_delta)
				params.delta_dir = math.sign(params.coin_delta)
				local coin_delta_color = coin_widget.style.coin_delta.text_color
				coin_delta_color[2] = (params.delta_dir <= 0 and 255) or 200
			end,
			update = function (ui_scenegraph, scenegraph_definition, coin_widget, progress, params)
				local p = 1 - (1 - progress)^2
				local coin_count = math.lerp(params.from_coin_count or 0, params.to_coin_count or 100, p)
				coin_widget.content.coin_count_text = string.format("%d", coin_count)
			end,
			on_complete = NOP
		},
		{
			name = "delta",
			duration = 2,
			init = function (ui_scenegraph, scenegraph_definition, coin_widget, params)
				params.delta_dir = math.sign(params.coin_delta)
				coin_widget.content.coin_delta = string.format("%+d", params.coin_delta)
			end,
			update = function (ui_scenegraph, scenegraph_definition, coin_widget, progress, params)
				local coin_delta_style = coin_widget.style.coin_delta
				coin_delta_style.offset[2] = coin_delta_style.base_offset[2] + params.delta_dir * (progress - 0.5) * 40
				coin_delta_style.text_color[1] = math.clamp((255 * (1 - progress)) / 0.8, 0, 255)
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, coin_widget, params)
				coin_widget.style.coin_delta.text_color[1] = 0
			end
		},
		{
			name = "grow",
			delay = 0.2,
			duration = 0.2,
			init = function (ui_scenegraph, scenegraph_definition, coin_widget, params)
				params.icon_size_x = coin_widget.style.coin_icon.texture_size[1]
				params.icon_size_y = coin_widget.style.coin_icon.texture_size[2]
			end,
			update = function (ui_scenegraph, scenegraph_definition, coin_widget, progress, params)
				local s = 1 - (1 - progress) * (1 - progress)
				local size_multiplier = 1 + 0.5 * s
				local style = coin_widget.style
				local coin_count_style = style.coin_count
				local coin_icon_style = style.coin_icon
				local coin_mask_style = style.coin_icon_mask
				local coin_bloom_style = style.coin_icon_bloom
				local size_x = size_multiplier * params.icon_size_x
				local size_y = size_multiplier * params.icon_size_y
				coin_icon_style.texture_size[1] = size_x
				coin_icon_style.texture_size[2] = size_y
				coin_mask_style.texture_size[1] = size_x
				coin_mask_style.texture_size[2] = size_y
				coin_bloom_style.texture_size[1] = size_multiplier * coin_bloom_style.base_texture_size[1]
				coin_bloom_style.texture_size[2] = size_multiplier * coin_bloom_style.base_texture_size[2]
			end,
			on_complete = NOP
		},
		{
			name = "shrink",
			delay = 0.4,
			duration = 0.4,
			init = function (ui_scenegraph, scenegraph_definition, coin_widget, params)
				params.icon_size_x = coin_widget.style.coin_icon.texture_size[1]
				params.icon_size_y = coin_widget.style.coin_icon.texture_size[2]
			end,
			update = function (ui_scenegraph, scenegraph_definition, coin_widget, progress, params)
				local s = 1 - progress * progress
				local size_multiplier = 1 + 0.5 * s
				local style = coin_widget.style
				local coin_count_style = style.coin_count
				local coin_icon_style = style.coin_icon
				local coin_mask_style = style.coin_icon_mask
				local coin_bloom_style = style.coin_icon_bloom
				local size_x = size_multiplier * params.icon_size_x
				local size_y = size_multiplier * params.icon_size_y
				coin_icon_style.texture_size[1] = size_x
				coin_icon_style.texture_size[2] = size_y
				coin_mask_style.texture_size[1] = size_x
				coin_mask_style.texture_size[2] = size_y
				coin_bloom_style.texture_size[1] = size_multiplier * coin_bloom_style.base_texture_size[1]
				coin_bloom_style.texture_size[2] = size_multiplier * coin_bloom_style.base_texture_size[2]
			end,
			on_complete = NOP
		},
		{
			name = "background_glow",
			delay = 0,
			duration = 0.8,
			init = function (ui_scenegraph, scenegraph_definition, coin_widget, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, coin_widget, progress, params)
				local s = 4 * progress * (1 - progress)
				coin_widget.style.background_glow.color[1] = 96 * s
			end,
			on_complete = NOP
		},
		{
			name = "glow",
			delay = 0.3,
			duration = 0.4,
			init = function (ui_scenegraph, scenegraph_definition, coin_widget, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, coin_widget, progress, params)
				local s = 4 * progress * (1 - progress)
				coin_widget.style.coin_icon_highlight.color[1] = 0
				coin_widget.style.coin_icon_bloom.color[1] = 127 * s
			end,
			on_complete = NOP
		},
		{
			name = "reflection",
			delay = 0.5,
			duration = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, coin_widget, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, coin_widget, progress, params)
				local coin_fx_style = coin_widget.style.coin_icon_fx
				coin_fx_style.offset[1] = coin_fx_style.base_offset[1] + (2 * progress - 1) * coin_fx_style.texture_size[1]
				coin_fx_style.color[1] = 255
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, coin_widget, params)
				coin_widget.style.coin_icon_fx.color[1] = 0
			end
		}
	}
}

return {
	scenegraph_definition = scenegraph_definition,
	coin_widget_definition = create_coin_widget_definition(),
	animation_definitions = animation_definitions
}

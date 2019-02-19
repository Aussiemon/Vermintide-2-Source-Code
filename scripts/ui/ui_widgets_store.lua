require("scripts/settings/ui_frame_settings")
require("scripts/settings/ui_player_portrait_frame_settings")

UIWidgets = UIWidgets or {}

UIWidgets.create_store_category_entry_definition = function (scenegraph_id, size, masked)
	local frame_name = "button_frame_02_gold"
	local frame_settings = UIFrameSettings[frame_name]
	local frame_spacing = frame_settings.texture_sizes.horizontal[2]
	local hover_frame_name = "frame_outer_glow_04"
	local hover_frame_settings = UIFrameSettings[hover_frame_name]
	local hover_frame_spacing = hover_frame_settings.texture_sizes.horizontal[2]
	local pulse_frame_name = "frame_outer_glow_04_big"
	local pulse_frame_settings = UIFrameSettings[pulse_frame_name]
	local pulse_frame_spacing = pulse_frame_settings.texture_sizes.horizontal[2]
	local widget = {
		element = {}
	}
	local passes = {
		{
			style_id = "hotspot",
			pass_type = "hotspot",
			content_id = "hotspot"
		},
		{
			pass_type = "tiled_texture",
			style_id = "background",
			texture_id = "background"
		},
		{
			pass_type = "texture",
			style_id = "background_fade",
			texture_id = "background_fade"
		},
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame"
		},
		{
			pass_type = "texture_frame",
			style_id = "hover_frame",
			texture_id = "hover_frame"
		},
		{
			pass_type = "texture_frame",
			style_id = "pulse_frame",
			texture_id = "pulse_frame"
		},
		{
			style_id = "title",
			pass_type = "text",
			text_id = "title"
		},
		{
			style_id = "title_shadow",
			pass_type = "text",
			text_id = "title"
		},
		{
			style_id = "counter",
			pass_type = "text",
			text_id = "counter"
		},
		{
			style_id = "counter_shadow",
			pass_type = "text",
			text_id = "counter"
		},
		{
			pass_type = "texture",
			style_id = "category_texture",
			texture_id = "category_texture",
			content_check_function = function (content)
				return content.category_texture
			end
		}
	}
	local content = {
		counter = "n/a",
		title = "n/a",
		background_fade = "options_window_fade_01",
		background = "menu_frame_bg_03",
		category_texture = "store_category_icon_hats",
		hotspot = {},
		hover_frame = hover_frame_settings.texture,
		pulse_frame = pulse_frame_settings.texture,
		frame = frame_settings.texture,
		size = size
	}
	local style = {
		hotspot = {
			size = size,
			offset = {
				0,
				0,
				0
			}
		},
		background = {
			vertical_alignment = "bottom",
			horizontal_alignment = "left",
			masked = masked,
			color = {
				255,
				100,
				100,
				100
			},
			texture_tiling_size = {
				256,
				256
			},
			texture_size = size,
			offset = {
				0,
				0,
				0
			}
		},
		background_fade = {
			vertical_alignment = "bottom",
			horizontal_alignment = "left",
			masked = masked,
			texture_size = {
				size[1] - frame_spacing * 2,
				size[2] - frame_spacing * 2
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				frame_spacing,
				frame_spacing,
				1
			}
		},
		frame = {
			horizontal_alignment = "left",
			vertical_alignment = "bottom",
			masked = masked,
			area_size = size,
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			frame_margins = {
				0,
				0
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
		hover_frame = {
			horizontal_alignment = "left",
			vertical_alignment = "bottom",
			masked = masked,
			area_size = size,
			texture_size = hover_frame_settings.texture_size,
			texture_sizes = hover_frame_settings.texture_sizes,
			frame_margins = {
				-hover_frame_spacing,
				-hover_frame_spacing
			},
			color = {
				0,
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
		pulse_frame = {
			horizontal_alignment = "left",
			vertical_alignment = "bottom",
			masked = masked,
			area_size = size,
			texture_size = pulse_frame_settings.texture_size,
			texture_sizes = pulse_frame_settings.texture_sizes,
			frame_margins = {
				-pulse_frame_spacing,
				-pulse_frame_spacing
			},
			color = {
				0,
				255,
				255,
				255
			},
			offset = {
				0,
				0,
				12
			}
		},
		category_texture = {
			vertical_alignment = "bottom",
			horizontal_alignment = "right",
			masked = masked,
			size = {
				size[1],
				size[2]
			},
			texture_size = {
				258,
				80
			},
			color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				0,
				3
			}
		},
		title = {
			word_wrap = true,
			upper_case = false,
			localize = false,
			font_size = 42,
			horizontal_alignment = "left",
			vertical_alignment = "center",
			dynamic_font_size = true,
			font_type = (masked and "hell_shark_header_masked") or "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
			select_text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				30,
				0,
				5
			},
			size = {
				size[1] - 40,
				size[2]
			}
		},
		title_shadow = {
			word_wrap = true,
			upper_case = false,
			localize = false,
			font_size = 42,
			horizontal_alignment = "left",
			vertical_alignment = "center",
			dynamic_font_size = true,
			font_type = (masked and "hell_shark_header_masked") or "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			normal_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				32,
				-2,
				4
			},
			size = {
				size[1] - 40,
				size[2]
			}
		},
		counter = {
			word_wrap = true,
			font_size = 20,
			localize = false,
			horizontal_alignment = "right",
			vertical_alignment = "bottom",
			dynamic_font_size = true,
			font_type = (masked and "hell_shark_masked") or "hell_shark",
			text_color = {
				255,
				120,
				120,
				120
			},
			default_text_color = {
				255,
				120,
				120,
				120
			},
			select_text_color = Colors.get_color_table_with_alpha("font_default", 255),
			offset = {
				-frame_spacing,
				0,
				5
			},
			size = size
		},
		counter_shadow = {
			word_wrap = true,
			font_size = 20,
			localize = false,
			horizontal_alignment = "right",
			vertical_alignment = "bottom",
			dynamic_font_size = true,
			font_type = (masked and "hell_shark_masked") or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			normal_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				-frame_spacing + 1,
				-1,
				4
			},
			size = size
		}
	}
	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

UIWidgets.create_store_item_definition = function (scenegraph_id, size, masked)
	local frame_name = "menu_frame_16"
	local frame_settings = UIFrameSettings[frame_name]
	local hover_frame_name = "frame_outer_glow_04"
	local hover_frame_settings = UIFrameSettings[hover_frame_name]
	local hover_frame_spacing = hover_frame_settings.texture_sizes.horizontal[2]
	local pulse_frame_name = "frame_outer_glow_04_big"
	local pulse_frame_settings = UIFrameSettings[pulse_frame_name]
	local pulse_frame_spacing = pulse_frame_settings.texture_sizes.horizontal[2]
	local widget = {
		element = {}
	}
	local passes = {
		{
			style_id = "hotspot",
			pass_type = "hotspot",
			content_id = "hotspot"
		},
		{
			pass_type = "texture",
			style_id = "overlay",
			texture_id = "rect",
			content_check_function = function (content)
				return true
			end
		},
		{
			pass_type = "texture",
			style_id = "background",
			texture_id = "rect"
		},
		{
			pass_type = "texture",
			style_id = "background_price",
			texture_id = "background_price",
			content_check_function = function (content)
				return not content.owned
			end
		},
		{
			pass_type = "texture",
			style_id = "price_icon",
			texture_id = "price_icon",
			content_check_function = function (content)
				return not content.owned
			end
		},
		{
			style_id = "price_text",
			pass_type = "text",
			text_id = "price_text",
			content_check_function = function (content)
				return not content.owned
			end
		},
		{
			pass_type = "texture",
			style_id = "owned_icon",
			texture_id = "owned_icon",
			content_check_function = function (content)
				return content.owned
			end
		},
		{
			pass_type = "texture",
			style_id = "owned_icon_bg",
			texture_id = "owned_icon_bg",
			content_check_function = function (content)
				return content.owned
			end
		},
		{
			pass_type = "texture",
			style_id = "discount_bg",
			texture_id = "discount_bg",
			content_check_function = function (content)
				return content.discount
			end
		},
		{
			pass_type = "multi_texture",
			style_id = "discont_number_icons",
			texture_id = "discont_number_icons",
			content_check_function = function (content)
				return content.discount
			end
		},
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame"
		},
		{
			pass_type = "texture_frame",
			style_id = "hover_frame",
			texture_id = "hover_frame"
		},
		{
			pass_type = "texture_frame",
			style_id = "pulse_frame",
			texture_id = "pulse_frame"
		},
		{
			pass_type = "texture",
			style_id = "icon",
			texture_id = "icon",
			content_check_function = function (content)
				return content.icon
			end
		},
		{
			pass_type = "texture",
			style_id = "type_tag_icon",
			texture_id = "type_tag_icon"
		},
		{
			pass_type = "multi_texture",
			style_id = "career_icons",
			texture_id = "career_icons"
		}
	}
	local content = {
		background_price = "store_thumbnail_pricetag",
		price_icon = "store_icon_currency_ingame",
		owned_icon = "store_owned_sigil",
		discount_bg = "store_thumbnail_sale",
		owned = false,
		price_text = "-",
		owned_icon_bg = "store_owned_ribbon",
		type_tag_icon = "store_tag_icon_dlc",
		discount = false,
		hotspot = {},
		career_icons = {},
		discont_number_icons = {},
		rect = (masked and "rect_masked") or "simple_rect_texture",
		frame = frame_settings.texture,
		hover_frame = hover_frame_settings.texture,
		pulse_frame = pulse_frame_settings.texture,
		size = size
	}
	local style = {
		hotspot = {
			size = size,
			offset = {
				0,
				-size[2],
				0
			}
		},
		price_text = {
			upper_case = false,
			localize = false,
			font_size = 28,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			dynamic_font_size = false,
			size = {
				45,
				40
			},
			font_type = (masked and "hell_shark_header_masked") or "hell_shark_header",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			offset = {
				46,
				-(size[2] + 4),
				12
			}
		},
		background = {
			vertical_alignment = "top",
			horizontal_alignment = "left",
			masked = masked,
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
		overlay = {
			vertical_alignment = "top",
			horizontal_alignment = "left",
			masked = masked,
			texture_size = size,
			color = {
				80,
				5,
				5,
				5
			},
			offset = {
				0,
				0,
				8
			}
		},
		type_tag_icon = {
			vertical_alignment = "top",
			horizontal_alignment = "left",
			masked = masked,
			texture_size = {
				56,
				56
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				size[1] - 56,
				0,
				6
			}
		},
		career_icons = {
			axis = 1,
			direction = 2,
			masked = masked,
			texture_size = {
				56,
				56
			},
			spacing = {
				-10,
				0,
				0
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				size[1] - 5,
				-size[2] + 5,
				6
			}
		},
		background_price = {
			vertical_alignment = "top",
			horizontal_alignment = "left",
			masked = masked,
			texture_size = {
				114,
				100
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				-6,
				-(size[2] - 90),
				10
			}
		},
		price_icon = {
			vertical_alignment = "top",
			horizontal_alignment = "left",
			masked = masked,
			texture_size = {
				58,
				58
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				3,
				-(size[2] - 46),
				11
			}
		},
		owned_icon = {
			vertical_alignment = "bottom",
			horizontal_alignment = "left",
			masked = masked,
			texture_size = {
				53,
				53
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				5,
				-(size[2] - 5),
				11
			}
		},
		owned_icon_bg = {
			vertical_alignment = "bottom",
			horizontal_alignment = "left",
			masked = masked,
			texture_size = {
				34,
				50
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				15,
				-(size[2] + 8),
				10
			}
		},
		discount_bg = {
			vertical_alignment = "top",
			horizontal_alignment = "left",
			masked = masked,
			texture_size = {
				124,
				112
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				-3,
				4,
				11
			}
		},
		discont_number_icons = {
			axis = 1,
			direction = 1,
			masked = masked,
			texture_sizes = {},
			texture_offsets = {},
			spacing = {
				0,
				0,
				0
			},
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				25,
				-82,
				12
			},
			default_offset = {
				25,
				-82,
				12
			}
		},
		icon = {
			vertical_alignment = "top",
			horizontal_alignment = "left",
			masked = masked,
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
		frame = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			masked = masked,
			area_size = size,
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			frame_margins = {
				0,
				0
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
				9
			}
		},
		hover_frame = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			masked = masked,
			area_size = size,
			texture_size = hover_frame_settings.texture_size,
			texture_sizes = hover_frame_settings.texture_sizes,
			frame_margins = {
				-hover_frame_spacing,
				-hover_frame_spacing
			},
			color = {
				0,
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
		pulse_frame = {
			horizontal_alignment = "left",
			vertical_alignment = "top",
			masked = masked,
			area_size = size,
			texture_size = pulse_frame_settings.texture_size,
			texture_sizes = pulse_frame_settings.texture_sizes,
			frame_margins = {
				-pulse_frame_spacing,
				-pulse_frame_spacing
			},
			color = {
				0,
				255,
				255,
				255
			},
			offset = {
				0,
				0,
				12
			}
		}
	}
	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

UIWidgets.create_store_purchase_button = function (scenegraph_id, size, text, font_size, disable_with_gamepad)
	local background_texture = "menu_frame_bg_07"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local frame_name = "button_frame_01_gold"
	local frame_settings = (frame_name and UIFrameSettings[frame_name]) or UIFrameSettings.button_frame_01
	local frame_width = frame_settings.texture_sizes.corner[1]
	local side_detail_texture = "button_detail_09_gold"
	local side_detail_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(side_detail_texture)
	local side_detail_texture_size = side_detail_texture_settings.size

	return {
		element = {
			passes = {
				{
					style_id = "frame",
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					texture_id = "frame",
					style_id = "frame",
					pass_type = "texture_frame"
				},
				{
					style_id = "background",
					pass_type = "texture_uv",
					content_id = "background"
				},
				{
					texture_id = "background_fade",
					style_id = "background_fade",
					pass_type = "texture"
				},
				{
					texture_id = "hover_glow",
					style_id = "hover_glow",
					pass_type = "texture"
				},
				{
					pass_type = "rect",
					style_id = "clicked_rect"
				},
				{
					style_id = "disabled_overlay",
					pass_type = "texture_uv",
					content_id = "disabled_overlay",
					content_check_function = function (content)
						local parent = content.parent
						local button_hotspot = parent.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					style_id = "owned_text_write_mask",
					pass_type = "text",
					text_id = "owned_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					texture_id = "owned_text_gradient",
					style_id = "owned_text_gradient",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					pass_type = "texture",
					style_id = "owned_icon",
					texture_id = "owned_icon",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					pass_type = "texture",
					style_id = "owned_icon_bg",
					texture_id = "owned_icon_bg",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					style_id = "side_detail_right",
					pass_type = "texture_uv",
					content_id = "side_detail"
				},
				{
					texture_id = "texture_id",
					style_id = "side_detail_left",
					pass_type = "texture",
					content_id = "side_detail"
				},
				{
					style_id = "currency_text",
					pass_type = "text",
					text_id = "currency_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end
				},
				{
					style_id = "currency_text_shadow",
					pass_type = "text",
					text_id = "currency_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end
				},
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end
				},
				{
					style_id = "title_text_disabled",
					pass_type = "text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disable_button
					end
				},
				{
					style_id = "title_text_shadow",
					pass_type = "text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end
				},
				{
					style_id = "title_text_write_mask",
					pass_type = "text",
					text_id = "title_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end
				},
				{
					texture_id = "title_text_gradient",
					style_id = "title_text_gradient",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end
				},
				{
					texture_id = "glass",
					style_id = "glass",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end
				},
				{
					texture_id = "glass_top",
					style_id = "glass_top",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end
				},
				{
					texture_id = "currency_icon",
					style_id = "currency_icon",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disable_button
					end
				}
			}
		},
		content = {
			hover_glow = "button_state_default",
			owned_text_gradient = "store_button_bg_02",
			currency_icon = "store_icon_currency_ingame_big",
			glass = "game_options_fg",
			owned_icon = "store_owned_sigil",
			glass_top = "button_glass_02",
			owned_text = "menu_store_purchase_button_owned",
			owned_icon_bg = "store_owned_ribbon",
			title_text_gradient = "text_gradient",
			background_fade = "button_bg_fade",
			currency_text = "n/a",
			button_hotspot = {
				disable_button = false
			},
			disabled_overlay = {
				texture_id = "store_button_bg_01",
				uvs = {
					{
						0,
						0
					},
					{
						1,
						1
					}
				}
			},
			side_detail = {
				uvs = {
					{
						1,
						0
					},
					{
						0,
						1
					}
				},
				texture_id = side_detail_texture
			},
			title_text = text or "n/a",
			frame = frame_settings.texture,
			background = {
				uvs = {
					{
						0,
						1 - size[2] / background_texture_settings.size[2]
					},
					{
						size[1] / background_texture_settings.size[1],
						1
					}
				},
				texture_id = background_texture
			},
			disable_with_gamepad = disable_with_gamepad,
			frame_width = frame_width
		},
		style = {
			background = {
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
			background_fade = {
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					frame_width,
					frame_width - 2,
					2
				},
				size = {
					size[1] - frame_width * 2,
					size[2] - frame_width * 2
				}
			},
			hover_glow = {
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					0,
					frame_width - 2,
					3
				},
				size = {
					size[1],
					math.min(size[2] - 5, 80)
				}
			},
			clicked_rect = {
				color = {
					0,
					0,
					0,
					0
				},
				offset = {
					0,
					0,
					7
				}
			},
			currency_icon = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				texture_size = {
					64,
					64
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
					4
				}
			},
			currency_text = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				select_text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					20,
					0,
					4
				}
			},
			currency_text_shadow = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					20,
					-2,
					3
				}
			},
			title_text = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				select_text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					20,
					0,
					4
				}
			},
			title_text_disabled = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				default_text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					20,
					0,
					4
				}
			},
			title_text_shadow = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					22,
					-2,
					3
				}
			},
			title_text_write_mask = {
				upper_case = true,
				word_wrap = true,
				horizontal_alignment = "left",
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark_header_write_mask",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					20,
					0,
					6
				}
			},
			owned_text_write_mask = {
				word_wrap = true,
				upper_case = true,
				localize = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark_header_write_mask",
				font_size = font_size or 24,
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					0,
					0,
					6
				}
			},
			title_text_gradient = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				masked = true,
				color = {
					255,
					97,
					180,
					141
				},
				offset = {
					0,
					0,
					5
				},
				texture_size = {
					size[1],
					size[2] * 0.5
				}
			},
			owned_text_gradient = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				masked = true,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					8
				},
				texture_size = {
					size[1],
					62
				}
			},
			owned_icon = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					53,
					53
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					-4,
					11
				}
			},
			owned_icon_bg = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					34,
					50
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					-24,
					10
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
					8
				}
			},
			glass_top = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					size[2] - (frame_width + 11),
					4
				},
				size = {
					size[1],
					11
				}
			},
			glass = {
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
			disabled_overlay = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					7
				},
				texture_size = {
					size[1],
					62
				}
			},
			side_detail_left = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-55,
					0,
					9
				},
				texture_size = {
					side_detail_texture_size[1],
					side_detail_texture_size[2]
				}
			},
			side_detail_right = {
				vertical_alignment = "center",
				horizontal_alignment = "right",
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					55,
					0,
					9
				},
				texture_size = {
					side_detail_texture_size[1],
					side_detail_texture_size[2]
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			0,
			0
		}
	}
end

UIWidgets.create_store_panel_button = function (scenegraph_id, size, text, font_size, optional_offset, optional_horizontal_alignment)
	local new_marker_offset = {
		-19,
		-25,
		10
	}
	local selection_offset = {
		0,
		-8,
		0
	}
	local shadow_offset = {
		2,
		3,
		3
	}
	local marker_offset = {
		0,
		0,
		2
	}

	return {
		element = {
			passes = {
				{
					style_id = "button_hotspot",
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					style_id = "text_shadow",
					pass_type = "text",
					text_id = "text_field"
				},
				{
					style_id = "text_hover",
					pass_type = "text",
					text_id = "text_field",
					content_check_function = function (content)
						return not content.button_hotspot.disable_button and (content.button_hotspot.is_hover or content.button_hotspot.is_selected)
					end
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text_field",
					content_check_function = function (content)
						return not content.button_hotspot.disable_button and not content.button_hotspot.is_hover and not content.button_hotspot.is_selected
					end
				},
				{
					style_id = "text_disabled",
					pass_type = "text",
					text_id = "text_field",
					content_check_function = function (content)
						return content.button_hotspot.disable_button
					end
				},
				{
					texture_id = "new_marker",
					style_id = "new_marker",
					pass_type = "texture",
					content_check_function = function (content)
						return content.new
					end
				},
				{
					texture_id = "edge_left",
					style_id = "edge_left",
					pass_type = "texture"
				},
				{
					texture_id = "edge_right",
					style_id = "edge_right",
					pass_type = "texture"
				},
				{
					texture_id = "edge_center",
					style_id = "edge_center",
					pass_type = "texture"
				}
			}
		},
		content = {
			edge_center = "store_menu_button_middle",
			edge_left = "store_menu_button_left",
			new_marker = "list_item_tag_new",
			edge_right = "store_menu_button_right",
			button_hotspot = {},
			text_field = text,
			default_font_size = font_size,
			size = size
		},
		style = {
			button_hotspot = {
				size = size
			},
			text = {
				word_wrap = false,
				upper_case = true,
				localize = true,
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				font_size = font_size,
				horizontal_alignment = optional_horizontal_alignment or "left",
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				default_offset = {
					0,
					10,
					4
				},
				offset = {
					0,
					5,
					4
				},
				size = size
			},
			text_shadow = {
				word_wrap = false,
				upper_case = true,
				localize = true,
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				font_size = font_size,
				horizontal_alignment = optional_horizontal_alignment or "left",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				default_offset = shadow_offset,
				offset = shadow_offset,
				size = size
			},
			text_hover = {
				word_wrap = false,
				upper_case = true,
				localize = true,
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				font_size = font_size,
				horizontal_alignment = optional_horizontal_alignment or "left",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				default_offset = {
					0,
					10,
					4
				},
				offset = {
					0,
					5,
					4
				},
				size = size
			},
			text_disabled = {
				word_wrap = false,
				upper_case = true,
				localize = true,
				vertical_alignment = "center",
				dynamic_font_size = true,
				font_type = "hell_shark_header",
				font_size = font_size,
				horizontal_alignment = optional_horizontal_alignment or "left",
				text_color = Colors.get_color_table_with_alpha("gray", 50),
				default_offset = {
					0,
					10,
					4
				},
				offset = {
					0,
					5,
					4
				},
				size = size
			},
			new_marker = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					math.floor(88.19999999999999),
					math.floor(35.699999999999996)
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					new_marker_offset[1],
					new_marker_offset[2],
					new_marker_offset[3]
				},
				size = size
			},
			edge_left = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				texture_size = {
					13,
					64
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					marker_offset[1],
					marker_offset[2],
					marker_offset[3]
				},
				size = size
			},
			edge_right = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				texture_size = {
					13,
					64
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					marker_offset[1],
					marker_offset[2],
					marker_offset[3]
				},
				size = size
			},
			edge_center = {
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					1
				},
				size = size
			}
		},
		offset = optional_offset or {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}
end

return

local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			UILayer.cutscene
		},
		size = {
			1920,
			1080
		}
	},
	screen = {
		scale = "fit",
		position = {
			0,
			0,
			UILayer.cutscene
		},
		size = {
			1920,
			1080
		}
	},
	letterbox_top_bar = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			1920,
			UISettings.cutscene_ui.letterbox.bar_height
		},
		position = {
			0,
			0,
			1
		}
	},
	letterbox_bottom_bar = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "center",
		size = {
			1920,
			UISettings.cutscene_ui.letterbox.bar_height
		},
		position = {
			0,
			0,
			1
		}
	},
	fx_fade_rect = {
		vertical_alignment = "bottom",
		parent = "root",
		horizontal_alignment = "left",
		size = {
			1920,
			1080
		},
		position = {
			0,
			0,
			2
		}
	},
	fx_text_popup = {
		vertical_alignment = "center",
		parent = "root",
		horizontal_alignment = "center",
		size = {
			1920,
			200
		},
		position = {
			0,
			140,
			2
		}
	},
	transparent_game_logo = {
		vertical_alignment = "center",
		parent = "root",
		horizontal_alignment = "center",
		size = {
			1237,
			538
		},
		position = {
			0,
			0,
			1
		}
	}
}
local widget_definitions = {
	transparent_game_logo = UIWidgets.create_simple_texture("vermintide_logo_transparent", "transparent_game_logo"),
	letterbox = {
		scenegraph_id = "screen",
		element = {
			passes = {
				{
					scenegraph_id = "letterbox_top_bar",
					style_id = "letterbox_top_bar",
					pass_type = "rect"
				},
				{
					scenegraph_id = "letterbox_bottom_bar",
					style_id = "letterbox_bottom_bar",
					pass_type = "rect"
				}
			}
		},
		content = {},
		style = {
			letterbox_top_bar = {
				vertical_alignment = "top",
				horizontal_alignment = "center",
				color = {
					255,
					0,
					0,
					0
				}
			},
			letterbox_bottom_bar = {
				vertical_alignment = "bottom",
				horizontal_alignment = "center",
				color = {
					255,
					0,
					0,
					0
				}
			}
		}
	},
	fx_fade = {
		scenegraph_id = "screen",
		element = {
			passes = {
				{
					scenegraph_id = "screen",
					style_id = "fx_fade_rect",
					pass_type = "rect",
					content_check_function = function (content, style_data)
						if not content or not style_data then
							return 
						end

						local alpha = content.fx_fade_alpha*255
						style_data.color[1] = alpha

						return 0 < alpha
					end
				}
			}
		},
		content = {
			fx_fade_alpha = 0
		},
		style = {
			fx_fade_rect = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				color = {
					0,
					0,
					0,
					0
				}
			}
		}
	},
	fx_text_popup = {
		scenegraph_id = "fx_text_popup",
		element = {
			passes = {
				{
					pass_type = "text",
					text_id = "text",
					content_check_function = function (content, style_data)
						if not content or not style_data then
							return 
						end

						local alpha = content.fx_text_popup_alpha*255
						style_data.text_color[1] = alpha

						return 0 < alpha
					end
				}
			}
		},
		content = {
			fx_text_popup_alpha = 0,
			text = ""
		},
		style = {
			vertical_alignment = "top",
			dynamic_font = true,
			localize = true,
			word_wrap = true,
			font_size = 50,
			horizontal_alignment = "center",
			font_type = "hell_shark",
			text_color = {
				0,
				255,
				255,
				255
			}
		}
	}
}

return {
	scenegraph = scenegraph_definition,
	widgets = widget_definitions
}

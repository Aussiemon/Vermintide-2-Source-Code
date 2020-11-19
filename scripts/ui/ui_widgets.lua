local_require("scripts/ui/ui_widgets_honduras")

UIWidgets = UIWidgets or {}

UIWidgets.create_hover_button = function (scenegraph_id, normal_texture, hover_texture)
	return {
		element = UIElements.SimpleButton,
		content = {
			texture_id = normal_texture,
			texture_hover_id = hover_texture,
			button_hotspot = {}
		},
		style = {},
		scenegraph_id = scenegraph_id
	}
end

local function get_gamepad_text_pass(button_name)
	return {
		pass_type = "text",
		text_id = button_name,
		style_id = button_name,
		content_check_function = function (content)
			return content[button_name]
		end
	}
end

local function get_gamepad_text_pass_win32(button_name, optional_style_sufix, condition_flag_name)
	local function content_check_function_texture_1_text(content)
		return content[button_name] and not content[condition_flag_name]
	end

	local function content_check_function_texture_2_text(content)
		return content[button_name] and content[condition_flag_name]
	end

	return {
		pass_type = "text",
		text_id = button_name,
		style_id = (optional_style_sufix and button_name .. optional_style_sufix) or button_name,
		content_check_function = (optional_style_sufix and content_check_function_texture_2_text) or content_check_function_texture_1_text
	}
end

local function get_gamepad_layout_text_style(horizontal_alignment, offset)
	return {
		vertical_alignment = "center",
		font_size = 18,
		localize = false,
		word_wrap = false,
		font_type = "hell_shark_masked",
		horizontal_alignment = horizontal_alignment,
		text_color = Colors.get_table("font_default"),
		offset = offset
	}
end

UIWidgets.create_gamepad_layout_win32 = function (bg_texture1, texture_size1, bg_texture2, texture_size2, offset, scenegraph_id)
	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "background1",
					texture_id = "background1",
					content_check_function = function (content)
						return not content.use_texture2_layout
					end
				},
				{
					pass_type = "texture",
					style_id = "background2",
					texture_id = "background2",
					content_check_function = function (content)
						return content.use_texture2_layout
					end
				},
				get_gamepad_text_pass_win32("left_trigger", nil, "use_texture2_layout"),
				get_gamepad_text_pass_win32("left_shoulder", nil, "use_texture2_layout"),
				get_gamepad_text_pass_win32("right_trigger", nil, "use_texture2_layout"),
				get_gamepad_text_pass_win32("right_shoulder", nil, "use_texture2_layout"),
				get_gamepad_text_pass_win32("ls", nil, "use_texture2_layout"),
				get_gamepad_text_pass_win32("rs", nil, "use_texture2_layout"),
				get_gamepad_text_pass_win32("left_thumb", nil, "use_texture2_layout"),
				get_gamepad_text_pass_win32("right_thumb", nil, "use_texture2_layout"),
				get_gamepad_text_pass_win32("d_up", nil, "use_texture2_layout"),
				get_gamepad_text_pass_win32("d_down", nil, "use_texture2_layout"),
				get_gamepad_text_pass_win32("d_left", nil, "use_texture2_layout"),
				get_gamepad_text_pass_win32("d_right", nil, "use_texture2_layout"),
				get_gamepad_text_pass_win32("back", nil, "use_texture2_layout"),
				get_gamepad_text_pass_win32("start", nil, "use_texture2_layout"),
				get_gamepad_text_pass_win32("x", nil, "use_texture2_layout"),
				get_gamepad_text_pass_win32("y", nil, "use_texture2_layout"),
				get_gamepad_text_pass_win32("a", nil, "use_texture2_layout"),
				get_gamepad_text_pass_win32("b", nil, "use_texture2_layout"),
				get_gamepad_text_pass_win32("left_trigger", "_texture2", "use_texture2_layout"),
				get_gamepad_text_pass_win32("left_shoulder", "_texture2", "use_texture2_layout"),
				get_gamepad_text_pass_win32("right_trigger", "_texture2", "use_texture2_layout"),
				get_gamepad_text_pass_win32("right_shoulder", "_texture2", "use_texture2_layout"),
				get_gamepad_text_pass_win32("ls", "_texture2", "use_texture2_layout"),
				get_gamepad_text_pass_win32("rs", "_texture2", "use_texture2_layout"),
				get_gamepad_text_pass_win32("left_thumb", "_texture2", "use_texture2_layout"),
				get_gamepad_text_pass_win32("right_thumb", "_texture2", "use_texture2_layout"),
				get_gamepad_text_pass_win32("d_up", "_texture2", "use_texture2_layout"),
				get_gamepad_text_pass_win32("d_down", "_texture2", "use_texture2_layout"),
				get_gamepad_text_pass_win32("d_left", "_texture2", "use_texture2_layout"),
				get_gamepad_text_pass_win32("d_right", "_texture2", "use_texture2_layout"),
				get_gamepad_text_pass_win32("back", "_texture2", "use_texture2_layout"),
				get_gamepad_text_pass_win32("start", "_texture2", "use_texture2_layout"),
				get_gamepad_text_pass_win32("x", "_texture2", "use_texture2_layout"),
				get_gamepad_text_pass_win32("y", "_texture2", "use_texture2_layout"),
				get_gamepad_text_pass_win32("a", "_texture2", "use_texture2_layout"),
				get_gamepad_text_pass_win32("b", "_texture2", "use_texture2_layout")
			}
		},
		content = {
			background1 = bg_texture1,
			background2 = bg_texture2
		},
		style = {
			use_texture2_layout = false,
			size = texture_size1,
			offset = offset,
			background1 = {
				color = {
					255,
					255,
					255,
					255
				},
				size = texture_size1,
				offset = {
					offset[1],
					offset[2],
					offset[3] + 15
				}
			},
			background2 = {
				color = {
					255,
					255,
					255,
					255
				},
				size = texture_size2,
				offset = {
					offset[1],
					offset[2],
					offset[3] + 15
				}
			},
			left_trigger = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				(offset[2] + 400) - 40,
				offset[3] + 16
			}),
			left_shoulder = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				(offset[2] + 400) - 78,
				offset[3] + 16
			}),
			right_trigger = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size1[1]) - 5,
				(offset[2] + 400) - 40,
				offset[3] + 16
			}),
			right_shoulder = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size1[1]) - 5,
				(offset[2] + 400) - 78,
				offset[3] + 16
			}),
			ls = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				(offset[2] + 400) - 176,
				offset[3] + 16
			}),
			rs = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size1[1]) - 5,
				(offset[2] + 400) - 334,
				offset[3] + 16
			}),
			left_thumb = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				(offset[2] + 400) - 196,
				offset[3] + 16
			}),
			right_thumb = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size1[1]) - 5,
				(offset[2] + 400) - 354,
				offset[3] + 16
			}),
			d_up = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				(offset[2] + 400) - 240,
				offset[3] + 16
			}),
			d_down = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				(offset[2] + 400) - 318,
				offset[3] + 16
			}),
			d_left = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				(offset[2] + 400) - 280,
				offset[3] + 16
			}),
			d_right = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				(offset[2] + 400) - 354,
				offset[3] + 16
			}),
			back = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				offset[2] + 400 + 2,
				offset[3] + 16
			}),
			start = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size1[1]) - 5,
				offset[2] + 400 + 2,
				offset[3] + 16
			}),
			x = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size1[1]) - 5,
				(offset[2] + 400) - 290,
				offset[3] + 16
			}),
			y = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size1[1]) - 5,
				(offset[2] + 400) - 126,
				offset[3] + 16
			}),
			a = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size1[1]) - 5,
				(offset[2] + 400) - 244,
				offset[3] + 16
			}),
			b = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size1[1]) - 5,
				(offset[2] + 400) - 182,
				offset[3] + 16
			}),
			left_trigger_texture2 = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				(offset[2] + 400) - 40,
				offset[3] + 16
			}),
			left_shoulder_texture2 = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				(offset[2] + 400) - 78,
				offset[3] + 16
			}),
			right_trigger_texture2 = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size2[1]) - 5,
				(offset[2] + 400) - 40,
				offset[3] + 16
			}),
			right_shoulder_texture2 = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size2[1]) - 5,
				(offset[2] + 400) - 78,
				offset[3] + 16
			}),
			ls_texture2 = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				(offset[2] + 440) - 346,
				offset[3] + 16
			}),
			rs_texture2 = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size2[1]) - 5,
				(offset[2] + 440) - 348,
				offset[3] + 16
			}),
			left_thumb_texture2 = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				(offset[2] + 440) - 366,
				offset[3] + 16
			}),
			right_thumb_texture2 = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size2[1]) - 5,
				(offset[2] + 440) - 368,
				offset[3] + 16
			}),
			d_up_texture2 = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				(offset[2] + 440) - 156,
				offset[3] + 16
			}),
			d_down_texture2 = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				(offset[2] + 440) - 248,
				offset[3] + 16
			}),
			d_left_texture2 = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				(offset[2] + 440) - 202,
				offset[3] + 16
			}),
			d_right_texture2 = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				(offset[2] + 440) - 298,
				offset[3] + 16
			}),
			back_texture2 = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				(offset[2] + 440) - 38,
				offset[3] + 16
			}),
			start_texture2 = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size2[1]) - 5,
				(offset[2] + 440) - 38,
				offset[3] + 16
			}),
			x_texture2 = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size2[1]) - 5,
				(offset[2] + 440) - 300,
				offset[3] + 16
			}),
			y_texture2 = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size2[1]) - 5,
				(offset[2] + 440) - 156,
				offset[3] + 16
			}),
			a_texture2 = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size2[1]) - 5,
				(offset[2] + 440) - 250,
				offset[3] + 16
			}),
			b_texture2 = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size2[1]) - 5,
				(offset[2] + 440) - 204,
				offset[3] + 16
			})
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_gamepad_layout_xb1 = function (bg_texture, texture_size, offset, scenegraph_id)
	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background"
				},
				get_gamepad_text_pass("left_trigger"),
				get_gamepad_text_pass("left_shoulder"),
				get_gamepad_text_pass("right_trigger"),
				get_gamepad_text_pass("right_shoulder"),
				get_gamepad_text_pass("ls"),
				get_gamepad_text_pass("rs"),
				get_gamepad_text_pass("left_thumb"),
				get_gamepad_text_pass("right_thumb"),
				get_gamepad_text_pass("d_up"),
				get_gamepad_text_pass("d_down"),
				get_gamepad_text_pass("d_left"),
				get_gamepad_text_pass("d_right"),
				get_gamepad_text_pass("back"),
				get_gamepad_text_pass("start"),
				get_gamepad_text_pass("x"),
				get_gamepad_text_pass("y"),
				get_gamepad_text_pass("a"),
				get_gamepad_text_pass("b")
			}
		},
		content = {
			background = bg_texture
		},
		style = {
			size = texture_size,
			offset = offset,
			background = {
				color = {
					255,
					255,
					255,
					255
				},
				size = texture_size,
				offset = {
					offset[1],
					offset[2],
					offset[3] + 15
				}
			},
			left_trigger = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				(offset[2] + 400) - 40,
				offset[3] + 16
			}),
			left_shoulder = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				(offset[2] + 400) - 78,
				offset[3] + 16
			}),
			right_trigger = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size[1]) - 5,
				(offset[2] + 400) - 40,
				offset[3] + 16
			}),
			right_shoulder = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size[1]) - 5,
				(offset[2] + 400) - 78,
				offset[3] + 16
			}),
			ls = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				(offset[2] + 400) - 176,
				offset[3] + 16
			}),
			rs = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size[1]) - 5,
				(offset[2] + 400) - 334,
				offset[3] + 16
			}),
			left_thumb = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				(offset[2] + 400) - 196,
				offset[3] + 16
			}),
			right_thumb = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size[1]) - 5,
				(offset[2] + 400) - 354,
				offset[3] + 16
			}),
			d_up = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				(offset[2] + 400) - 240,
				offset[3] + 16
			}),
			d_down = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				(offset[2] + 400) - 318,
				offset[3] + 16
			}),
			d_left = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				(offset[2] + 400) - 280,
				offset[3] + 16
			}),
			d_right = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				(offset[2] + 400) - 354,
				offset[3] + 16
			}),
			back = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				offset[2] + 400 + 2,
				offset[3] + 16
			}),
			start = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size[1]) - 5,
				offset[2] + 400 + 2,
				offset[3] + 16
			}),
			x = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size[1]) - 5,
				(offset[2] + 400) - 290,
				offset[3] + 16
			}),
			y = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size[1]) - 5,
				(offset[2] + 400) - 126,
				offset[3] + 16
			}),
			a = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size[1]) - 5,
				(offset[2] + 400) - 244,
				offset[3] + 16
			}),
			b = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size[1]) - 5,
				(offset[2] + 400) - 182,
				offset[3] + 16
			})
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_gamepad_layout_ps4 = function (bg_texture, texture_size, offset, scenegraph_id)
	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background"
				},
				get_gamepad_text_pass("l2"),
				get_gamepad_text_pass("l1"),
				get_gamepad_text_pass("r2"),
				get_gamepad_text_pass("r1"),
				get_gamepad_text_pass("ls"),
				get_gamepad_text_pass("rs"),
				get_gamepad_text_pass("l3"),
				get_gamepad_text_pass("r3"),
				get_gamepad_text_pass("up"),
				get_gamepad_text_pass("down"),
				get_gamepad_text_pass("left"),
				get_gamepad_text_pass("right"),
				get_gamepad_text_pass("touch"),
				get_gamepad_text_pass("options"),
				get_gamepad_text_pass("square"),
				get_gamepad_text_pass("triangle"),
				get_gamepad_text_pass("cross"),
				get_gamepad_text_pass("circle")
			}
		},
		content = {
			options = "toggle_menu",
			down = "down",
			l1 = "l1",
			r3 = "r3",
			triangle = "triangle",
			cross = "cross",
			rs = "look_raw_controller",
			circle = "circle",
			ls = "move_controller",
			up = "up",
			touch = "ingame_player_list_toggle",
			square = "square",
			left = "left",
			l3 = "l3",
			r2 = "r2",
			l2 = "l2",
			r1 = "r1",
			right = "right",
			background = bg_texture
		},
		style = {
			size = texture_size,
			offset = offset,
			background = {
				color = {
					255,
					255,
					255,
					255
				},
				size = texture_size,
				offset = {
					offset[1],
					offset[2],
					offset[3] + 15
				}
			},
			l2 = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				(offset[2] + 400) - 40,
				offset[3] + 16
			}),
			l1 = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				(offset[2] + 400) - 78,
				offset[3] + 16
			}),
			r2 = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size[1]) - 5,
				(offset[2] + 400) - 40,
				offset[3] + 16
			}),
			r1 = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size[1]) - 5,
				(offset[2] + 400) - 78,
				offset[3] + 16
			}),
			ls = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				(offset[2] + 440) - 346,
				offset[3] + 16
			}),
			rs = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size[1]) - 5,
				(offset[2] + 440) - 348,
				offset[3] + 16
			}),
			l3 = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				(offset[2] + 440) - 366,
				offset[3] + 16
			}),
			r3 = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size[1]) - 5,
				(offset[2] + 440) - 368,
				offset[3] + 16
			}),
			up = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				(offset[2] + 440) - 156,
				offset[3] + 16
			}),
			down = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				(offset[2] + 440) - 248,
				offset[3] + 16
			}),
			left = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				(offset[2] + 440) - 202,
				offset[3] + 16
			}),
			right = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				(offset[2] + 440) - 298,
				offset[3] + 16
			}),
			touch = get_gamepad_layout_text_style("left", {
				offset[1] + 5,
				(offset[2] + 440) - 38,
				offset[3] + 16
			}),
			options = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size[1]) - 5,
				(offset[2] + 440) - 38,
				offset[3] + 16
			}),
			square = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size[1]) - 5,
				(offset[2] + 440) - 300,
				offset[3] + 16
			}),
			triangle = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size[1]) - 5,
				(offset[2] + 440) - 156,
				offset[3] + 16
			}),
			cross = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size[1]) - 5,
				(offset[2] + 440) - 250,
				offset[3] + 16
			}),
			circle = get_gamepad_layout_text_style("right", {
				(offset[1] + texture_size[1]) - 5,
				(offset[2] + 440) - 204,
				offset[3] + 16
			})
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_menu_button = function (text_field_id, scenegraph_id, optional_text_size, optional_word_wrap, optional_text_area_size, optional_x_offset)
	return {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot",
					content_check_function = function (content)
						return not content.disabled
					end
				},
				{
					pass_type = "texture",
					texture_id = "texture_id",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disabled and not button_hotspot.is_hover and button_hotspot.is_clicked > 0 and not button_hotspot.is_selected
					end
				},
				{
					pass_type = "texture",
					texture_id = "texture_hover_id",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disabled and not button_hotspot.is_selected and button_hotspot.is_hover and button_hotspot.is_clicked > 0
					end
				},
				{
					pass_type = "texture",
					texture_id = "texture_click_id",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disabled and button_hotspot.is_clicked == 0
					end
				},
				{
					pass_type = "texture",
					texture_id = "texture_selected_id",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disabled and button_hotspot.is_selected and button_hotspot.is_clicked > 0
					end
				},
				{
					pass_type = "texture",
					texture_id = "texture_disabled_id",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disabled
					end
				},
				{
					pass_type = "texture_uv",
					style_id = "left_detail",
					texture_id = "left_texture_id",
					content_check_function = function (content)
						return not content.disable_side_textures
					end
				},
				{
					pass_type = "texture",
					style_id = "right_detail",
					texture_id = "right_texture_id",
					content_check_function = function (content)
						return not content.disable_side_textures
					end
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text_field",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disabled and not button_hotspot.is_hover and not button_hotspot.is_selected and button_hotspot.is_clicked > 0
					end
				},
				{
					style_id = "text_hover",
					pass_type = "text",
					text_id = "text_field",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disabled and not button_hotspot.is_selected and button_hotspot.is_hover and button_hotspot.is_clicked > 0
					end
				},
				{
					style_id = "text_click",
					pass_type = "text",
					text_id = "text_field",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disabled and button_hotspot.is_clicked == 0
					end
				},
				{
					style_id = "text_selected",
					pass_type = "text",
					text_id = "text_field",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disabled and button_hotspot.is_selected and button_hotspot.is_clicked ~= 0
					end
				},
				{
					style_id = "text_disabled",
					pass_type = "text",
					text_id = "text_field",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disabled
					end
				}
			}
		},
		content = {
			texture_disabled_id = "medium_button_disabled",
			right_texture_id = "medium_button_selected_detail",
			texture_hover_id = "medium_button_hover",
			disable_side_textures = false,
			texture_click_id = "medium_button_selected",
			texture_id = "medium_button_normal",
			left_texture_id = "medium_button_selected_detail",
			texture_selected_id = "medium_button_hover",
			button_hotspot = {
				is_hover = false,
				is_clicked = 10
			},
			text_field = text_field_id,
			hover_color = {
				0,
				255,
				255,
				255
			},
			uvs = {
				{
					1,
					0
				},
				{
					0,
					1
				}
			}
		},
		style = {
			text = {
				horizontal_alignment = "center",
				localize = true,
				vertical_alignment = "center",
				font_type = "hell_shark",
				word_wrap = optional_word_wrap,
				font_size = optional_text_size or 24,
				size = optional_text_area_size,
				offset = {
					optional_x_offset or 0,
					0,
					2
				},
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
				text_color_enabled = table.clone(Colors.color_definitions.cheeseburger),
				text_color_disabled = table.clone(Colors.color_definitions.gray)
			},
			text_hover = {
				horizontal_alignment = "center",
				localize = true,
				vertical_alignment = "center",
				font_type = "hell_shark",
				word_wrap = optional_word_wrap,
				font_size = optional_text_size or 24,
				size = optional_text_area_size,
				offset = {
					optional_x_offset or 0,
					0,
					2
				},
				text_color = Colors.get_color_table_with_alpha("white", 255)
			},
			text_click = {
				horizontal_alignment = "center",
				localize = true,
				vertical_alignment = "center",
				font_type = "hell_shark",
				word_wrap = optional_word_wrap,
				font_size = optional_text_size or 24,
				size = optional_text_area_size,
				offset = {
					optional_x_offset or 0,
					-2,
					2
				},
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255)
			},
			text_selected = {
				horizontal_alignment = "center",
				localize = true,
				vertical_alignment = "center",
				font_type = "hell_shark",
				word_wrap = optional_word_wrap,
				font_size = optional_text_size or 24,
				size = optional_text_area_size,
				offset = {
					optional_x_offset or 0,
					0,
					2
				},
				text_color = Colors.get_color_table_with_alpha("white", 255)
			},
			text_disabled = {
				horizontal_alignment = "center",
				localize = true,
				vertical_alignment = "center",
				font_type = "hell_shark",
				word_wrap = optional_word_wrap,
				font_size = optional_text_size or 24,
				size = optional_text_area_size,
				offset = {
					optional_x_offset or 0,
					0,
					2
				},
				text_color = Colors.get_color_table_with_alpha("gray", 255)
			},
			right_detail = {
				offset = {
					294,
					12,
					-1
				},
				size = {
					24,
					60
				}
			},
			left_detail = {
				offset = {
					1,
					12,
					-1
				},
				size = {
					24,
					60
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_menu_button_medium = function (text_field_id, scenegraph_id, disable_localization, optional_font_size)
	return {
		element = UIElements.ButtonMenuSteps,
		content = {
			texture_click_id = "medium_button_selected",
			texture_id = "medium_button_normal",
			texture_hover_id = "medium_button_hover",
			texture_selected_id = "medium_button_hover",
			texture_disabled_id = "medium_button_disabled",
			text_field = text_field_id,
			button_hotspot = {}
		},
		style = {
			texture = {
				color = {
					255,
					255,
					255,
					255
				}
			},
			text = {
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark",
				localize = not disable_localization and true,
				font_size = optional_font_size or 24,
				offset = {
					0,
					0,
					2
				},
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
				text_color_enabled = table.clone(Colors.color_definitions.cheeseburger),
				text_color_disabled = table.clone(Colors.color_definitions.gray)
			},
			text_hover = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = not disable_localization and true,
				font_size = optional_font_size or 24,
				offset = {
					0,
					0,
					2
				},
				text_color = Colors.get_color_table_with_alpha("white", 255)
			},
			text_selected = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = not disable_localization and true,
				font_size = optional_font_size or 24,
				offset = {
					0,
					-2,
					2
				},
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255)
			},
			text_disabled = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				horizontal_alignment = "center",
				localize = not disable_localization and true,
				font_size = optional_font_size or 24,
				offset = {
					0,
					0,
					2
				},
				text_color = Colors.get_color_table_with_alpha("gray", 255)
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_popup_button_long = function (text_field_id, scenegraph_id, disable_localization)
	return {
		element = UIElements.ButtonMenuSteps,
		content = {
			texture_click_id = "popup_button_selected",
			texture_id = "popup_button_normal",
			texture_hover_id = "popup_button_hover",
			texture_selected_id = "popup_button_hover",
			texture_disabled_id = "popup_button_disabled",
			text_field = text_field_id,
			button_hotspot = {}
		},
		style = {
			texture = {
				color = {
					255,
					255,
					255,
					255
				}
			},
			text = {
				font_size = 32,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark",
				localize = not disable_localization and true,
				offset = {
					0,
					0,
					2
				},
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
				text_color_enabled = table.clone(Colors.color_definitions.cheeseburger),
				text_color_disabled = table.clone(Colors.color_definitions.gray)
			},
			text_hover = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 32,
				horizontal_alignment = "center",
				localize = not disable_localization and true,
				offset = {
					0,
					0,
					2
				},
				text_color = Colors.get_color_table_with_alpha("white", 255)
			},
			text_selected = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 32,
				horizontal_alignment = "center",
				localize = not disable_localization and true,
				offset = {
					0,
					-2,
					2
				},
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255)
			},
			text_disabled = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 32,
				horizontal_alignment = "center",
				localize = not disable_localization and true,
				offset = {
					0,
					0,
					2
				},
				text_color = Colors.get_color_table_with_alpha("gray", 255)
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_quest_screen_button = function (text_field_id, scenegraph_id, disable_localization)
	return {
		element = UIElements.ButtonMenuSteps,
		content = {
			texture_click_id = "quest_screen_button_selected",
			texture_id = "quest_screen_button_normal",
			texture_hover_id = "quest_screen_button_hover",
			texture_selected_id = "quest_screen_button_hover",
			texture_disabled_id = "quest_screen_button_disabled",
			text_field = text_field_id,
			button_hotspot = {}
		},
		style = {
			texture = {
				color = {
					255,
					255,
					255,
					255
				}
			},
			text = {
				font_size = 24,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark",
				localize = not disable_localization and true,
				offset = {
					0,
					0,
					2
				},
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
				text_color_enabled = table.clone(Colors.color_definitions.cheeseburger),
				text_color_disabled = table.clone(Colors.color_definitions.gray)
			},
			text_hover = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "center",
				localize = not disable_localization and true,
				offset = {
					0,
					0,
					2
				},
				text_color = Colors.get_color_table_with_alpha("white", 255)
			},
			text_selected = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "center",
				localize = not disable_localization and true,
				offset = {
					0,
					-2,
					2
				},
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255)
			},
			text_disabled = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "center",
				localize = not disable_localization and true,
				offset = {
					0,
					0,
					2
				},
				text_color = Colors.get_color_table_with_alpha("gray", 255)
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_menu_button_small = function (text_field_id, scenegraph_id)
	return {
		element = UIElements.ButtonMenuSteps,
		content = {
			texture_click_id = "small_button_02_selected",
			texture_id = "small_button_02_normal",
			texture_hover_id = "small_button_02_hover",
			texture_selected_id = "small_button_02_hover",
			texture_disabled_id = "small_button_02_disabled",
			text_field = text_field_id,
			button_hotspot = {}
		},
		style = {
			texture = {
				color = {
					255,
					255,
					255,
					255
				}
			},
			text = {
				font_size = 24,
				localize = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark",
				offset = {
					0,
					0,
					2
				},
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
				text_color_enabled = table.clone(Colors.color_definitions.cheeseburger),
				text_color_disabled = table.clone(Colors.color_definitions.gray)
			},
			text_hover = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				localize = true,
				font_size = 24,
				horizontal_alignment = "center",
				offset = {
					0,
					0,
					2
				},
				text_color = Colors.get_color_table_with_alpha("white", 255)
			},
			text_selected = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				localize = true,
				font_size = 24,
				horizontal_alignment = "center",
				offset = {
					0,
					-2,
					2
				},
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255)
			},
			text_disabled = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				localize = true,
				font_size = 24,
				horizontal_alignment = "center",
				offset = {
					0,
					0,
					2
				},
				text_color = Colors.get_color_table_with_alpha("gray", 255)
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_octagon_button = function (icons, tooltips, scenegraph_id)
	return {
		element = UIElements.ToggleIconButton,
		content = {
			click_texture = "octagon_button_clicked",
			toggle_hover_texture = "octagon_button_toggled_hover",
			toggle_texture = "octagon_button_toggled",
			hover_texture = "octagon_button_hover",
			normal_texture = "octagon_button_normal",
			icon_texture = icons[1] or "map_icon_friends_01",
			icon_hover_texture = icons[2] or "map_icon_friends_02",
			tooltip_text = tooltips[1] or "",
			toggled_tooltip_text = tooltips[2] or "",
			button_hotspot = {}
		},
		style = {
			normal_texture = {
				color = {
					255,
					255,
					255,
					255
				}
			},
			hover_texture = {
				color = {
					255,
					255,
					255,
					255
				}
			},
			click_texture = {
				color = {
					255,
					255,
					255,
					255
				}
			},
			toggle_texture = {
				color = {
					255,
					255,
					255,
					255
				}
			},
			toggle_hover_texture = {
				color = {
					255,
					255,
					255,
					255
				}
			},
			icon_texture = {
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
			icon_hover_texture = {
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
			icon_click_texture = {
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					-1,
					1
				}
			},
			tooltip_text = {
				font_size = 24,
				max_width = 500,
				localize = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				line_colors = {},
				offset = {
					0,
					0,
					20
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_menu_button_medium_with_timer = function (text_field_id, timer_text_field_id, timer_scenegraph_id, scenegraph_id)
	return {
		element = UIElements.ButtonMenuStepsWithTimer,
		content = {
			texture_click_id = "medium_button_selected",
			texture_id = "medium_button_normal",
			texture_hover_id = "medium_button_hover",
			texture_selected_id = "medium_button_hover",
			texture_disabled_id = "medium_button_disabled",
			text_field = text_field_id,
			button_hotspot = {},
			timer_text_field = timer_text_field_id
		},
		style = {
			text = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				localize = true,
				font_size = 24,
				horizontal_alignment = "center",
				offset = {
					0,
					0,
					2
				},
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255)
			},
			text_hover = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				localize = true,
				font_size = 24,
				horizontal_alignment = "center",
				offset = {
					0,
					0,
					2
				},
				text_color = Colors.get_color_table_with_alpha("white", 255)
			},
			text_selected = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				localize = true,
				font_size = 24,
				horizontal_alignment = "center",
				offset = {
					0,
					-2,
					2
				},
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255)
			},
			text_disabled = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				localize = true,
				font_size = 24,
				horizontal_alignment = "center",
				offset = {
					0,
					0,
					2
				},
				text_color = Colors.get_color_table_with_alpha("gray", 255)
			},
			timer_text_field = {
				horizontal_alignment = "right",
				font_size = 18,
				pixel_perfect = true,
				vertical_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
				offset = {
					0,
					0,
					4
				},
				scenegraph_id = timer_scenegraph_id
			},
			timer_text_field_hover = {
				horizontal_alignment = "right",
				font_size = 18,
				pixel_perfect = true,
				vertical_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					4
				},
				scenegraph_id = timer_scenegraph_id
			},
			timer_text_field_selected = {
				horizontal_alignment = "right",
				font_size = 18,
				pixel_perfect = true,
				vertical_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
				offset = {
					0,
					-2,
					4
				},
				scenegraph_id = timer_scenegraph_id
			},
			timer_text_field_disabled = {
				horizontal_alignment = "right",
				font_size = 18,
				pixel_perfect = true,
				vertical_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					0,
					0,
					4
				},
				scenegraph_id = timer_scenegraph_id
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_chain_scrollbar = function (scenegraph_id, scroll_area_scenegraph_id, size, optional_style, disable_background, gamepad_always_hover)
	local optional_thumb_suffix, optional_chain_suffix = nil

	if optional_style == "gold" then
		optional_thumb_suffix = "_gold"
		optional_chain_suffix = "_blue"
	else
		optional_thumb_suffix = ""
		optional_chain_suffix = ""
	end

	local passes = {
		{
			pass_type = "local_offset",
			content_check_function = function (content)
				return content.scroll_bar_info.bar_height_percentage < 1
			end,
			offset_function = function (ui_scenegraph, ui_style, ui_content, input_service)
				local scroll_bar_info = ui_content.scroll_bar_info
				local axis = scroll_bar_info.axis
				local thumb_middle = ui_style.thumb_middle
				local thumb_bottom = ui_style.thumb_bottom
				local thumb_top = ui_style.thumb_top
				local thumb_top_length = thumb_top.size[axis]
				local thumb_middle_length = thumb_middle.size[axis]
				local thumb_bottom_length = thumb_bottom.size[axis]
				local hotspot = ui_style.hotspot
				local scroll_length = scroll_bar_info.scroll_length
				local min_height = thumb_top_length + thumb_bottom_length
				local min_percentage = min_height / scroll_length
				local bar_height_percentage = scroll_bar_info.bar_height_percentage
				local percentage = math.max(bar_height_percentage, min_percentage)
				hotspot.size[axis] = scroll_length * percentage
				thumb_middle.size[axis] = math.max(math.floor(scroll_length * percentage) - min_height, 0)
			end
		},
		{
			style_id = "hotspot",
			pass_type = "held",
			content_id = "scroll_bar_info",
			content_check_function = function (content)
				return content.bar_height_percentage < 1
			end,
			held_function = function (ui_scenegraph, ui_style, ui_content, input_service)
				local axis = ui_content.axis
				local gamepad_active = Managers.input:is_device_active("gamepad")
				local base_cursor = input_service:get("cursor")
				local cursor = UIInverseScaleVectorToResolution(base_cursor)
				local cursor_y = cursor[axis]

				if PLATFORM == "xb1" and not gamepad_active then
					cursor_y = 1080 - base_cursor.y
				end

				local world_pos = UISceneGraph.get_world_position(ui_scenegraph, ui_content.scenegraph_id)
				local world_pos_y = world_pos[axis]
				local scroll_length = ui_content.scroll_length
				local input_coordinate = math.clamp(cursor_y - world_pos_y, 0, scroll_length)
				local size = ui_style.size
				local thumb_length = size[axis]

				if not ui_content.input_offset then
					local input_offset = input_coordinate - ui_style.offset[axis]
					ui_content.input_offset = input_offset
				end

				local input_offset = ui_content.input_offset
				local start_position = 0
				local end_position = scroll_length - thumb_length
				local current_position = input_coordinate - input_offset
				current_position = math.clamp(current_position, start_position, end_position)
				local percentage = current_position / end_position
				ui_content.value = 1 - percentage
			end,
			release_function = function (ui_scenegraph, ui_style, ui_content, input_service)
				ui_content.input_offset = nil
			end
		},
		{
			style_id = "hotspot",
			pass_type = "hotspot",
			content_id = "scroll_bar_info"
		},
		{
			pass_type = "local_offset",
			content_id = "scroll_bar_info",
			content_check_function = function (content)
				return content.bar_height_percentage < 1
			end,
			offset_function = function (ui_scenegraph, ui_style, ui_content, input_service)
				local axis = ui_content.axis
				local hotspot = ui_style.hotspot
				local value = 1 - ui_content.value
				local scroll_length = ui_content.scroll_length
				local thumb_length = hotspot.size[axis]
				local start_position = 0
				local end_position = scroll_length - thumb_length
				local current_position = end_position * value
				current_position = math.clamp(current_position, start_position, end_position)
				hotspot.offset[axis] = current_position
				local thumb_middle = ui_style.thumb_middle
				local thumb_bottom = ui_style.thumb_bottom
				local thumb_top = ui_style.thumb_top
				local thumb_top_length = thumb_top.size[axis]
				local thumb_middle_length = thumb_middle.size[axis]
				local thumb_bottom_length = thumb_bottom.size[axis]
				thumb_bottom.offset[axis] = current_position
				thumb_middle.offset[axis] = current_position + thumb_bottom_length
				thumb_top.offset[axis] = current_position + thumb_bottom_length + thumb_middle_length
			end
		},
		{
			style_id = "thumb_middle",
			pass_type = "texture",
			texture_id = "thumb_middle",
			content_change_function = function (content, style)
				local is_hover = content.scroll_bar_info.is_hover
				local color = style.color
				local color_value = (is_hover and 255) or 200
				color[2] = color_value
				color[3] = color_value
				color[4] = color_value
			end,
			content_check_function = function (content)
				return content.scroll_bar_info.bar_height_percentage < 1
			end
		},
		{
			style_id = "thumb_top",
			pass_type = "texture",
			texture_id = "thumb_top",
			content_change_function = function (content, style)
				local is_hover = content.scroll_bar_info.is_hover
				local color = style.color
				local color_value = (is_hover and 255) or 200
				color[2] = color_value
				color[3] = color_value
				color[4] = color_value
			end,
			content_check_function = function (content)
				return content.scroll_bar_info.bar_height_percentage < 1
			end
		},
		{
			style_id = "thumb_bottom",
			pass_type = "texture",
			texture_id = "thumb_bottom",
			content_change_function = function (content, style)
				local is_hover = content.scroll_bar_info.is_hover
				local color = style.color
				local color_value = (is_hover and 255) or 200
				color[2] = color_value
				color[3] = color_value
				color[4] = color_value
			end,
			content_check_function = function (content)
				return content.scroll_bar_info.bar_height_percentage < 1
			end
		},
		{
			pass_type = "tiled_texture",
			style_id = "background",
			texture_id = "background",
			content_check_function = function (content)
				return not content.disable_background
			end
		}
	}
	local content = {
		disable_frame = false,
		scroll = {
			allow_multi_hover = true
		},
		disable_background = disable_background,
		scroll_bar_info = {
			axis = 2,
			value = 0,
			allow_multi_hover = true,
			scroll_amount = 0,
			button_scroll_step = 0.1,
			bar_height_percentage = 1,
			scenegraph_id = scenegraph_id,
			scroll_length = size[2],
			gamepad_always_hover = gamepad_always_hover
		},
		background = "chain_link_01" .. (optional_chain_suffix or ""),
		thumb_top = "chain_scrollbutton_top" .. (optional_thumb_suffix or ""),
		thumb_bottom = "chain_scrollbutton_bottom" .. (optional_thumb_suffix or ""),
		thumb_middle = "chain_scrollbutton_middle" .. (optional_thumb_suffix or "")
	}
	local style = {
		background = {
			offset = {
				0,
				0,
				0
			},
			texture_tiling_size = {
				16,
				19
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		hotspot = {
			offset = {
				size[1] / 2 - 16,
				0,
				2
			},
			size = {
				32,
				size[2]
			}
		},
		thumb_top = {
			offset = {
				size[1] / 2 - 16,
				0,
				2
			},
			size = {
				32,
				28
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		thumb_bottom = {
			offset = {
				size[1] / 2 - 16,
				0,
				2
			},
			size = {
				32,
				27
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		thumb_middle = {
			offset = {
				size[1] / 2 - 16,
				0,
				2
			},
			start_offset = {
				size[1] / 2 - 16,
				0,
				2
			},
			size = {
				32,
				size[2]
			},
			color = {
				255,
				255,
				255,
				255
			}
		}
	}

	if scroll_area_scenegraph_id then
		passes[#passes + 1] = {
			style_id = "scroll_area_hotspot",
			pass_type = "scroll",
			content_id = "scroll_area_hotspot",
			scroll_function = function (ui_scenegraph, ui_style, ui_content, input_service, scroll_axis, dt)
				local axis_input = scroll_axis.y * -1
				local parent_content = ui_content.parent
				local scroll_bar_info = parent_content.scroll_bar_info
				local gamepad_active = scroll_bar_info.gamepad_active
				local axis_input = scroll_axis.y * -1 * ((gamepad_active and 0.2) or 1)
				local total_scroll_height = scroll_bar_info.total_scroll_height
				local scroll_amount = scroll_bar_info.scroll_amount
				local gamepad_always_hover = gamepad_active and scroll_bar_info.gamepad_always_hover

				if axis_input ~= 0 and (ui_content.is_hover or gamepad_always_hover) then
					scroll_bar_info.axis_input = axis_input
					local previous_scroll_add = scroll_bar_info.scroll_add or 0
					scroll_bar_info.scroll_add = previous_scroll_add + axis_input * scroll_amount
				else
					axis_input = scroll_bar_info.axis_input
				end

				local scroll_add = scroll_bar_info.scroll_add

				if scroll_add then
					local speed = scroll_bar_info.scroll_speed or 5
					local step = scroll_add * dt * speed
					scroll_add = scroll_add - step

					if math.abs(scroll_add) > scroll_amount / 20 then
						scroll_bar_info.scroll_add = scroll_add
					else
						scroll_bar_info.scroll_add = nil
					end

					local current_scroll_value = scroll_bar_info.scroll_value

					if current_scroll_value then
						scroll_bar_info.scroll_value = math.clamp(current_scroll_value + step, 0, 1)
					end
				end
			end
		}
		style.scroll_area_hotspot = {
			offset = {
				0,
				0,
				0
			},
			scenegraph_id = scroll_area_scenegraph_id
		}
		content.scroll_area_hotspot = {}
	end

	local definition = {
		element = {
			passes = passes
		},
		content = content,
		style = style,
		scenegraph_id = scenegraph_id
	}

	return definition
end

UIWidgets.create_horizontal_chain_scrollbar = function (scenegraph_id, scroll_area_scenegraph_id, size, optional_style, disable_background)
	local optional_thumb_suffix, optional_chain_suffix = nil

	if optional_style == "gold" then
		optional_thumb_suffix = "_gold"
		optional_chain_suffix = "_blue"
	else
		optional_thumb_suffix = ""
		optional_chain_suffix = ""
	end

	local passes = {
		{
			pass_type = "local_offset",
			content_check_function = function (content)
				return content.scroll_bar_info.bar_length_percentage < 1
			end,
			offset_function = function (ui_scenegraph, ui_style, ui_content, input_service)
				local scroll_bar_info = ui_content.scroll_bar_info
				local axis = scroll_bar_info.axis
				local thumb_left = ui_style.thumb_left
				local thumb_right = ui_style.thumb_right
				local thumb_middle = ui_style.thumb_middle
				local thumb_left_length = thumb_left.size[axis]
				local thumb_right_length = thumb_right.size[axis]
				local thumb_middle_length = thumb_middle.size[axis]
				local hotspot = ui_style.hotspot
				local scroll_length = scroll_bar_info.scroll_length
				local min_height = thumb_right_length + thumb_left_length
				local min_percentage = min_height / scroll_length
				local bar_length_percentage = scroll_bar_info.bar_length_percentage
				local percentage = math.max(bar_length_percentage, min_percentage)
				hotspot.size[axis] = scroll_length * percentage
				thumb_middle.size[axis] = math.max(math.floor(scroll_length * percentage) - min_height, 0)
			end
		},
		{
			style_id = "hotspot",
			pass_type = "held",
			content_id = "scroll_bar_info",
			content_check_function = function (content)
				return content.bar_length_percentage < 1
			end,
			held_function = function (ui_scenegraph, ui_style, ui_content, input_service)
				local axis = ui_content.axis
				local gamepad_active = Managers.input:is_device_active("gamepad")
				local base_cursor = input_service:get("cursor")
				local cursor = UIInverseScaleVectorToResolution(base_cursor)
				local cursor_y = cursor[axis]

				if PLATFORM == "xb1" and not gamepad_active then
					cursor_y = 1080 - base_cursor.y
				end

				local world_pos = UISceneGraph.get_world_position(ui_scenegraph, ui_content.scenegraph_id)
				local world_pos_y = world_pos[axis]
				local scroll_length = ui_content.scroll_length
				local input_coordinate = math.clamp(cursor_y - world_pos_y, 0, scroll_length)
				local size = ui_style.size
				local thumb_length = size[axis]

				if not ui_content.input_offset then
					local input_offset = input_coordinate - ui_style.offset[axis]
					ui_content.input_offset = input_offset
				end

				local input_offset = ui_content.input_offset
				local start_position = 0
				local end_position = scroll_length - thumb_length
				local current_position = input_coordinate - input_offset
				current_position = math.clamp(current_position, start_position, end_position)
				local percentage = current_position / end_position
				ui_content.value = percentage
			end,
			release_function = function (ui_scenegraph, ui_style, ui_content, input_service)
				ui_content.input_offset = nil
			end
		},
		{
			style_id = "hotspot",
			pass_type = "hotspot",
			content_id = "scroll_bar_info"
		},
		{
			pass_type = "local_offset",
			content_id = "scroll_bar_info",
			content_check_function = function (content)
				return content.bar_length_percentage < 1
			end,
			offset_function = function (ui_scenegraph, ui_style, ui_content, input_service)
				local axis = ui_content.axis
				local hotspot = ui_style.hotspot
				local value = ui_content.value
				local scroll_length = ui_content.scroll_length
				local thumb_length = hotspot.size[axis]
				local start_position = 0
				local end_position = scroll_length - thumb_length
				local current_position = end_position * value
				current_position = math.clamp(current_position, start_position, end_position)
				hotspot.offset[axis] = current_position
				local thumb_left = ui_style.thumb_left
				local thumb_right = ui_style.thumb_right
				local thumb_middle = ui_style.thumb_middle
				local thumb_left_length = thumb_left.size[axis]
				local thumb_right_length = thumb_right.size[axis]
				local thumb_middle_length = thumb_middle.size[axis]
				thumb_left.offset[axis] = current_position
				thumb_middle.offset[axis] = current_position + thumb_left_length
				thumb_right.offset[axis] = current_position + thumb_left_length + thumb_middle_length
			end
		},
		{
			style_id = "thumb_middle",
			pass_type = "texture",
			texture_id = "thumb_middle",
			content_change_function = function (content, style)
				local is_hover = content.scroll_bar_info.is_hover
				local color = style.color
				local color_value = (is_hover and 255) or 200
				color[2] = color_value
				color[3] = color_value
				color[4] = color_value
			end,
			content_check_function = function (content)
				return content.scroll_bar_info.bar_length_percentage < 1
			end
		},
		{
			style_id = "thumb_left",
			pass_type = "texture",
			texture_id = "thumb_left",
			content_change_function = function (content, style)
				local is_hover = content.scroll_bar_info.is_hover
				local color = style.color
				local color_value = (is_hover and 255) or 200
				color[2] = color_value
				color[3] = color_value
				color[4] = color_value
			end,
			content_check_function = function (content)
				return content.scroll_bar_info.bar_length_percentage < 1
			end
		},
		{
			style_id = "thumb_right",
			pass_type = "texture",
			texture_id = "thumb_right",
			content_change_function = function (content, style)
				local is_hover = content.scroll_bar_info.is_hover
				local color = style.color
				local color_value = (is_hover and 255) or 200
				color[2] = color_value
				color[3] = color_value
				color[4] = color_value
			end,
			content_check_function = function (content)
				return content.scroll_bar_info.bar_length_percentage < 1
			end
		},
		{
			pass_type = "tiled_texture",
			style_id = "background",
			texture_id = "background",
			content_check_function = function (content)
				return not content.disable_background
			end
		}
	}
	local content = {
		disable_frame = false,
		scroll = {},
		disable_background = disable_background,
		scroll_bar_info = {
			button_scroll_step = 0.1,
			axis = 1,
			value = 0,
			bar_length_percentage = 1,
			scenegraph_id = scenegraph_id,
			scroll_length = size[1]
		},
		background = "chain_link_horizontal_01" .. (optional_chain_suffix or ""),
		thumb_left = "chain_scrollbutton_left" .. (optional_thumb_suffix or ""),
		thumb_right = "chain_scrollbutton_right" .. (optional_thumb_suffix or ""),
		thumb_middle = "chain_scrollbutton_horizontal_middle" .. (optional_thumb_suffix or "")
	}
	local style = {
		background = {
			offset = {
				0,
				0,
				0
			},
			texture_tiling_size = {
				19,
				16
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		hotspot = {
			offset = {
				0,
				size[2] / 2 - 16,
				2
			},
			size = {
				size[1],
				32
			}
		},
		thumb_left = {
			offset = {
				0,
				size[2] / 2 - 16,
				2
			},
			size = {
				27,
				32
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		thumb_right = {
			offset = {
				0,
				size[2] / 2 - 16,
				20
			},
			size = {
				28,
				32
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		thumb_middle = {
			offset = {
				0,
				size[2] / 2 - 16,
				2
			},
			size = {
				size[1],
				32
			},
			color = {
				255,
				255,
				255,
				255
			}
		}
	}

	if scroll_area_scenegraph_id then
		passes[#passes + 1] = {
			style_id = "scroll_area_hotspot",
			pass_type = "scroll",
			content_id = "scroll_area_hotspot",
			scroll_function = function (ui_scenegraph, ui_style, ui_content, input_service, scroll_axis, dt)
				local axis_input = scroll_axis.x * -1
				local parent_content = ui_content.parent
				local scroll_bar_info = parent_content.scroll_bar_info
				local total_scroll_height = scroll_bar_info.total_scroll_height

				if axis_input ~= 0 and ui_content.is_hover then
					scroll_bar_info.axis_input = axis_input
					scroll_bar_info.scroll_add = axis_input * scroll_bar_info.scroll_amount
				else
					axis_input = scroll_bar_info.axis_input
				end

				local scroll_add = scroll_bar_info.scroll_add

				if scroll_add then
					local step = scroll_add * dt * 5
					scroll_add = scroll_add - step

					if math.abs(scroll_add) > 0 then
						scroll_bar_info.scroll_add = scroll_add
					else
						scroll_bar_info.scroll_add = nil
					end

					local current_scroll_value = scroll_bar_info.scroll_value
					scroll_bar_info.scroll_value = math.clamp(current_scroll_value + step, 0, 1)
				end
			end
		}
		style.scroll_area_hotspot = {
			offset = {
				0,
				0,
				0
			},
			scenegraph_id = scroll_area_scenegraph_id
		}
		content.scroll_area_hotspot = {}
	end

	local definition = {
		element = {
			passes = passes
		},
		content = content,
		style = style,
		scenegraph_id = scenegraph_id
	}

	return definition
end

UIWidgets.create_scrollbar = function (scenegraph_id, size, scroll_area_scenegraph_id, thumb_color, track_color, thumb_width, corner_radius)
	local passes = {
		{
			pass_type = "local_offset",
			content_check_function = function (content)
				return content.scroll_bar_info.bar_height_percentage < 1
			end,
			offset_function = function (ui_scenegraph, ui_style, ui_content, input_service)
				local scroll_bar_info = ui_content.scroll_bar_info
				local axis = scroll_bar_info.axis
				local hotspot = ui_style.hotspot
				local scroll_bar_box = ui_style.scroll_bar_box
				local scroll_length = scroll_bar_info.scroll_length
				local bar_height_percentage = scroll_bar_info.bar_height_percentage
				hotspot.size[axis] = scroll_length * bar_height_percentage
				scroll_bar_box.size[axis] = scroll_length * bar_height_percentage
			end
		},
		{
			style_id = "hotspot",
			pass_type = "held",
			content_id = "scroll_bar_info",
			content_check_function = function (content)
				return content.bar_height_percentage < 1
			end,
			held_function = function (ui_scenegraph, ui_style, ui_content, input_service)
				local axis = ui_content.axis
				local gamepad_active = Managers.input:is_device_active("gamepad")
				local base_cursor = input_service:get("cursor")
				local cursor = UIInverseScaleVectorToResolution(base_cursor)
				local cursor_y = cursor[axis]

				if PLATFORM == "xb1" and not gamepad_active then
					cursor_y = 1080 - base_cursor.y
				end

				local world_pos = UISceneGraph.get_world_position(ui_scenegraph, ui_content.scenegraph_id)
				local world_pos_y = world_pos[axis]
				local scroll_length = ui_content.scroll_length
				local input_coordinate = math.clamp(cursor_y - world_pos_y, 0, scroll_length)
				local size = ui_style.size
				local thumb_length = size[axis]

				if not ui_content.input_offset then
					local input_offset = input_coordinate - ui_style.offset[axis]
					ui_content.input_offset = input_offset
				end

				local input_offset = ui_content.input_offset
				local start_position = 0
				local end_position = scroll_length - thumb_length
				local current_position = input_coordinate - input_offset
				current_position = math.clamp(current_position, start_position, end_position)
				local percentage = current_position / end_position
				ui_content.value = 1 - percentage
			end,
			release_function = function (ui_scenegraph, ui_style, ui_content, input_service)
				ui_content.input_offset = nil
			end
		},
		{
			style_id = "hotspot",
			pass_type = "hotspot",
			content_id = "scroll_bar_info"
		},
		{
			pass_type = "local_offset",
			content_id = "scroll_bar_info",
			content_check_function = function (content)
				return content.bar_height_percentage < 1
			end,
			offset_function = function (ui_scenegraph, ui_style, ui_content, input_service)
				local axis = ui_content.axis
				local hotspot = ui_style.hotspot
				local value = 1 - ui_content.value
				local scroll_length = ui_content.scroll_length
				local thumb_length = hotspot.size[axis]
				local start_position = 0
				local end_position = scroll_length - thumb_length
				local current_position = end_position * value
				current_position = math.clamp(current_position, start_position, end_position)
				hotspot.offset[axis] = current_position
				local scroll_bar_box = ui_style.scroll_bar_box
				scroll_bar_box.offset[axis] = current_position
			end
		},
		{
			pass_type = "rounded_background",
			style_id = "background"
		},
		{
			pass_type = "rounded_background",
			style_id = "scroll_bar_box"
		}
	}
	local content = {
		disable_frame = false,
		scroll = {},
		scroll_bar_info = {
			button_scroll_step = 0.1,
			axis = 2,
			value = 0,
			bar_height_percentage = 1,
			scenegraph_id = scenegraph_id,
			scroll_length = size[2]
		},
		button_up_hotspot = {},
		button_down_hotspot = {}
	}
	local style = {
		background = {
			corner_radius = corner_radius or 2,
			color = track_color or {
				255,
				5,
				5,
				5
			}
		},
		scroll_bar_box = {
			corner_radius = corner_radius or 2,
			offset = {
				(thumb_width and size[1] / 2 - thumb_width * 0.5) or 0,
				0,
				1
			},
			size = {
				thumb_width,
				size[2]
			},
			color = thumb_color or Colors.get_color_table_with_alpha("font_button_normal", 255)
		},
		hotspot = {
			offset = {
				0,
				0,
				2
			},
			size = {
				size[1],
				size[2]
			}
		}
	}
	local definition = {
		element = {
			passes = passes
		},
		content = content,
		style = style,
		scenegraph_id = scenegraph_id
	}

	if scroll_area_scenegraph_id then
		passes[#passes + 1] = {
			style_id = "scroll_area_hotspot",
			pass_type = "scroll",
			content_id = "scroll_area_hotspot",
			scroll_function = function (ui_scenegraph, ui_style, ui_content, input_service, scroll_axis, dt)
				local axis_input = scroll_axis.y * -1
				local parent_content = ui_content.parent
				local scroll_bar_info = parent_content.scroll_bar_info
				local total_scroll_height = scroll_bar_info.total_scroll_height
				local scroll_amount = scroll_bar_info.scroll_amount

				if axis_input ~= 0 and ui_content.is_hover then
					scroll_bar_info.axis_input = axis_input
					local previous_scroll_add = scroll_bar_info.scroll_add or 0
					scroll_bar_info.scroll_add = previous_scroll_add + axis_input * scroll_amount
				else
					axis_input = scroll_bar_info.axis_input
				end

				local scroll_add = scroll_bar_info.scroll_add

				if scroll_add then
					local speed = scroll_bar_info.scroll_speed or 5
					local step = scroll_add * dt * speed
					scroll_add = scroll_add - step

					if math.abs(scroll_add) > scroll_amount / 20 then
						scroll_bar_info.scroll_add = scroll_add
					else
						scroll_bar_info.scroll_add = nil
					end

					local current_scroll_value = scroll_bar_info.scroll_value

					if current_scroll_value then
						scroll_bar_info.scroll_value = math.clamp(current_scroll_value + step, 0, 1)
					end
				end
			end
		}
		style.scroll_area_hotspot = {
			offset = {
				0,
				0,
				0
			},
			scenegraph_id = scroll_area_scenegraph_id
		}
		content.scroll_area_hotspot = {}
	end

	return definition
end

UIWidgets.create_lock_icon = function (scenegraph_id, level)
	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "unlock_texture",
					texture_id = "unlock_texture"
				},
				{
					style_id = "level_text",
					pass_type = "text",
					text_id = "level_text"
				}
			}
		},
		content = {
			unlock_texture = "locked_icon_01",
			level_text = tostring(level)
		},
		style = {
			unlock_texture = {
				size = {
					30,
					38
				},
				offset = {
					0,
					0,
					1
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			level_text = {
				vertical_alignment = "center",
				word_wrap = false,
				horizontal_alignment = "center",
				font_size = 28,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
				offset = {
					15,
					-15,
					2
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_quest_navigation_button = function (scenegraph_id, uvs, tooltip_text)
	return {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot",
					content_check_function = function (content)
						return not content.disabled
					end
				},
				{
					pass_type = "hotspot",
					content_id = "tooltip_hotspot",
					content_check_function = function (content)
						return not content.disabled
					end
				},
				{
					pass_type = "texture_uv",
					style_id = "texture_id",
					texture_id = "texture_id",
					content_id = "texture_id",
					content_check_function = function (content)
						local button_hotspot = content.parent.button_hotspot

						return not button_hotspot.is_hover and button_hotspot.is_clicked ~= 0 and not button_hotspot.disabled
					end
				},
				{
					pass_type = "texture_uv",
					style_id = "texture_hover_id",
					texture_id = "texture_hover_id",
					content_id = "texture_hover_id",
					content_check_function = function (content)
						local button_hotspot = content.parent.button_hotspot

						return button_hotspot.is_selected or (button_hotspot.is_hover and button_hotspot.is_clicked ~= 0 and not button_hotspot.disabled)
					end
				},
				{
					pass_type = "texture_uv",
					style_id = "texture_click_id",
					texture_id = "texture_click_id",
					content_id = "texture_click_id",
					content_check_function = function (content)
						return content.parent.button_hotspot.is_clicked == 0 and not content.parent.button_hotspot.disabled
					end
				},
				{
					pass_type = "texture_uv",
					style_id = "texture_disabled_id",
					texture_id = "texture_disabled_id",
					content_id = "texture_disabled_id",
					content_check_function = function (content)
						return content.parent.button_hotspot.disabled
					end
				},
				{
					style_id = "tooltip_text",
					pass_type = "tooltip_text",
					text_id = "tooltip_text",
					content_check_function = function (content)
						return content.tooltip_text and content.button_hotspot.is_hover and content.tooltip_hotspot.is_hover and not content.button_hotspot.disabled
					end
				}
			}
		},
		content = {
			texture_id = {
				texture_id = "quest_board_arrow_normal",
				uvs = uvs
			},
			texture_hover_id = {
				texture_hover_id = "quest_board_arrow_hover",
				uvs = uvs
			},
			texture_click_id = {
				texture_click_id = "quest_board_arrow_hover",
				uvs = uvs
			},
			texture_disabled_id = {
				texture_disabled_id = "quest_board_arrow_hover",
				uvs = uvs
			},
			tooltip_text = tooltip_text,
			button_hotspot = {},
			tooltip_hotspot = {}
		},
		style = {
			texture_id = {
				size = {
					42,
					64
				},
				offset = {
					0,
					0,
					0
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			texture_hover_id = {
				size = {
					42,
					64
				},
				offset = {
					0,
					0,
					0
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			texture_click_id = {
				size = {
					38,
					58
				},
				offset = {
					2,
					3,
					0
				},
				color = {
					255,
					200,
					200,
					200
				}
			},
			texture_disabled_id = {
				size = {
					42,
					64
				},
				offset = {
					0,
					0,
					0
				},
				color = {
					190,
					120,
					120,
					120
				}
			},
			tooltip_text = {
				font_size = 18,
				max_width = 500,
				localize = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				line_colors = {},
				offset = {
					0,
					0,
					50
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_gold_button_3_state = function (text, scenegraph_id, normal_texture, hover_texture, click_texture)
	return {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					pass_type = "texture",
					texture_id = "texture_id",
					content_check_function = function (content)
						return not content.button_hotspot.is_hover and content.button_hotspot.is_clicked > 0
					end
				},
				{
					pass_type = "texture",
					texture_id = "texture_hover_id",
					content_check_function = function (content)
						return content.button_hotspot.is_selected or (content.button_hotspot.is_hover and content.button_hotspot.is_clicked > 0)
					end
				},
				{
					pass_type = "texture",
					texture_id = "texture_click_id",
					content_check_function = function (content)
						return content.button_hotspot.is_clicked == 0
					end
				},
				{
					localize = true,
					style_id = "text",
					pass_type = "text",
					text_id = "text_field"
				}
			}
		},
		content = {
			texture_id = normal_texture or "small_button_gold_normal",
			texture_hover_id = hover_texture or "small_button_gold_hover",
			texture_click_id = click_texture or "small_button_gold_selected",
			text_field = Localize(text),
			button_hotspot = {}
		},
		style = {
			text = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					2
				},
				scenegraph_id = scenegraph_id
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_gamepad_bar_input_extension = function (parent_scenegraph_id)
	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "input_bg",
					texture_id = "input_bg",
					content_check_function = function (content)
						return content.is_gamepad_active
					end
				},
				{
					texture_id = "input_icon",
					style_id = "input_icon",
					pass_type = "texture",
					content_check_function = function (content)
						return content.is_gamepad_active and content.show_input
					end
				},
				{
					texture_id = "input_icon_overlay",
					style_id = "input_icon_overlay",
					pass_type = "texture",
					content_check_function = function (content)
						return content.is_gamepad_active and content.charging
					end
				}
			}
		},
		content = {
			input_bg = "forge_button_gamepad_icon_holder",
			input_icon_overlay = "input_button_icon_overlay_01",
			show_input = false,
			chargring = false,
			input_icon = "xbone_button_icon_y"
		},
		style = {
			input_icon = {
				size = {
					34,
					34
				},
				offset = {
					97,
					42,
					3
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			input_icon_overlay = {
				size = {
					34,
					34
				},
				offset = {
					97,
					42,
					4
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			input_bg = {
				size = {
					81,
					44
				},
				offset = {
					71,
					36,
					2
				},
				color = {
					255,
					255,
					255,
					255
				}
			}
		},
		scenegraph_id = parent_scenegraph_id
	}
end

UIWidgets.create_forge_merge_button = function (scenegraph_id, text_scenegraph_id, token_scenegraph_id, eye_glow_scenegraph_id, progress_scenegraph_id)
	return {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot",
					content_check_function = function (content)
						return (not content.charging or content.show_cancel_text) and not content.disabled
					end
				},
				{
					pass_type = "texture",
					texture_id = "texture_id",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not content.is_gamepad_active and not button_hotspot.disabled and not button_hotspot.is_hover and (not button_hotspot.is_clicked or (button_hotspot.is_clicked and button_hotspot.is_clicked > 0))
					end
				},
				{
					pass_type = "texture",
					texture_id = "texture_hover_id",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not content.is_gamepad_active and not button_hotspot.disabled and button_hotspot.is_hover and (not button_hotspot.is_clicked or (button_hotspot.is_clicked and button_hotspot.is_clicked > 0))
					end
				},
				{
					pass_type = "texture",
					texture_id = "texture_click_id",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return (not content.is_gamepad_active and not button_hotspot.disabled and button_hotspot.is_clicked and button_hotspot.is_clicked == 0) or button_hotspot.is_selected
					end
				},
				{
					pass_type = "texture",
					texture_id = "texture_disabled_id",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not content.is_gamepad_active and button_hotspot.disabled
					end
				},
				{
					texture_id = "texture_token_type",
					style_id = "texture_token_type",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not content.charging and not content.show_cancel_text and content.show_tokens and content.texture_token_type and (not button_hotspot.is_clicked or (button_hotspot.is_clicked and button_hotspot.is_clicked > 0)) and not button_hotspot.is_selected
					end
				},
				{
					texture_id = "texture_token_type",
					style_id = "texture_token_type_selected",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return (not content.charging and not content.show_cancel_text and content.show_tokens and content.texture_token_type and button_hotspot.is_clicked == 0) or button_hotspot.is_selected
					end
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text_field",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not content.charging and not content.show_cancel_text and not button_hotspot.is_hover and content.show_tokens and (not button_hotspot.is_clicked or (button_hotspot.is_clicked and button_hotspot.is_clicked > 0)) and not button_hotspot.is_selected
					end
				},
				{
					style_id = "text_hover",
					pass_type = "text",
					text_id = "text_field",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.is_hover and content.show_tokens and (not button_hotspot.is_clicked or (button_hotspot.is_clicked and button_hotspot.is_clicked > 0)) and not button_hotspot.is_selected
					end
				},
				{
					style_id = "text_selected",
					pass_type = "text",
					text_id = "text_field",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return (not content.charging and not content.show_cancel_text and content.show_tokens and button_hotspot.is_clicked == 0) or button_hotspot.is_selected
					end
				},
				{
					style_id = "text_disabled",
					pass_type = "text",
					text_id = "text_field",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disabled and content.is_disabled
					end
				},
				{
					style_id = "text_center",
					pass_type = "text",
					text_id = "text_field_center",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not content.charging and not content.show_cancel_text and not button_hotspot.disabled and not button_hotspot.is_hover and not button_hotspot.is_selected and not content.show_tokens
					end
				},
				{
					style_id = "text_hover_center",
					pass_type = "text",
					text_id = "text_field_center",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not content.charging and not content.show_cancel_text and not button_hotspot.disabled and button_hotspot.is_hover and button_hotspot.is_clicked > 0 and not content.show_tokens
					end
				},
				{
					style_id = "text_selected_center",
					pass_type = "text",
					text_id = "text_field_center",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not content.charging and not content.show_cancel_text and not content.is_disabled and (button_hotspot.is_clicked == 0 or button_hotspot.is_selected) and not content.show_tokens
					end
				},
				{
					style_id = "token_text",
					pass_type = "text",
					text_id = "token_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not content.charging and not content.show_cancel_text and not button_hotspot.is_hover and content.show_tokens and (not button_hotspot.is_clicked or (button_hotspot.is_clicked and button_hotspot.is_clicked > 0)) and not button_hotspot.is_selected
					end
				},
				{
					style_id = "token_text_hover",
					pass_type = "text",
					text_id = "token_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not content.charging and not content.show_cancel_text and button_hotspot.is_hover and content.show_tokens and (not button_hotspot.is_clicked or (button_hotspot.is_clicked and button_hotspot.is_clicked > 0)) and not button_hotspot.is_selected
					end
				},
				{
					style_id = "token_text_selected",
					pass_type = "text",
					text_id = "token_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return (not content.charging and not content.show_cancel_text and content.show_tokens and button_hotspot.is_clicked == 0) or button_hotspot.is_selected
					end
				},
				{
					style_id = "text_charge_cancelled",
					pass_type = "text",
					text_id = "text_charge_cancelled",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return content.is_gamepad_active and content.show_cancel_text
					end
				},
				{
					pass_type = "texture",
					texture_id = "progress_frame",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return content.is_gamepad_active and not button_hotspot.disabled
					end
				},
				{
					pass_type = "texture",
					texture_id = "progress_frame_disabled",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return content.is_gamepad_active and button_hotspot.disabled
					end
				},
				{
					pass_type = "texture",
					style_id = "progress_frame_bg",
					texture_id = "progress_frame_bg",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return content.is_gamepad_active and not button_hotspot.disabled
					end
				},
				{
					pass_type = "texture",
					style_id = "progress_frame_bg",
					texture_id = "progress_frame_bg_disabled",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return content.is_gamepad_active and button_hotspot.disabled
					end
				},
				{
					style_id = "progress_fill",
					pass_type = "texture_uv",
					content_id = "progress_fill",
					content_check_function = function (content)
						local parent_content = content.parent

						return parent_content.is_gamepad_active
					end
				},
				{
					texture_id = "progress_fill_glow",
					style_id = "progress_fill_glow",
					pass_type = "texture",
					content_check_function = function (content)
						return content.is_gamepad_active
					end
				},
				{
					texture_id = "progress_input_icon",
					style_id = "progress_input_icon",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return content.is_gamepad_active and not button_hotspot.disabled
					end
				},
				{
					texture_id = "progress_input_icon_overlay",
					style_id = "progress_input_icon_overlay",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return content.is_gamepad_active and not button_hotspot.disabled and content.charging
					end
				},
				{
					texture_id = "eye_glow_texture",
					style_id = "eye_glow_texture",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not content.is_gamepad_active and content.use_eye_glow and not button_hotspot.disabled
					end
				},
				{
					texture_id = "gamepad_glow_texture",
					style_id = "gamepad_glow_texture",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return content.is_gamepad_active and not button_hotspot.disabled
					end
				}
			}
		},
		content = {
			show_tokens = false,
			progress_frame_bg_disabled = "forge_button_gamepad_bg_disabled",
			is_disabled = true,
			show_cancel_text = false,
			progress_fill_glow = "forge_button_gamepad_glow_02",
			progress_frame_bg = "forge_button_gamepad_bg",
			charging = false,
			texture_hover_id = "forge_button_03_hover",
			texture_click_id = "forge_button_03_selected",
			eye_glow_texture = "forge_button_03_glow_effect",
			token_text = "",
			progress_frame_disabled = "forge_button_gamepad_disabled",
			progress_input_icon = "xbone_button_icon_y",
			progress_input_icon_overlay = "input_button_icon_overlay_01",
			progress_frame = "forge_button_gamepad_frame",
			gamepad_glow_texture = "forge_button_gamepad_glow",
			texture_disabled_id = "forge_button_03_disabled",
			texture_id = "forge_button_03_normal",
			use_eye_glow = (eye_glow_scenegraph_id and true) or false,
			text_field = Localize("merge"),
			text_field_center = Localize("merge"),
			button_hotspot = {},
			text_charge_cancelled = Localize("forge_screen_melt_abort"),
			progress_fill = {
				texture_id = "forge_button_gamepad_fill_02",
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
			}
		},
		style = {
			eye_glow_texture = {
				color = {
					0,
					255,
					255,
					255
				},
				scenegraph_id = eye_glow_scenegraph_id
			},
			gamepad_glow_texture = {
				size = {
					304,
					20
				},
				offset = {
					17,
					81,
					4
				},
				color = {
					0,
					255,
					255,
					255
				}
			},
			progress_fill = {
				offset = {
					0,
					0,
					0
				},
				color = {
					0,
					255,
					255,
					255
				},
				scenegraph_id = progress_scenegraph_id
			},
			progress_input_icon = {
				size = {
					34,
					34
				},
				offset = {
					152,
					85,
					3
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			progress_input_icon_overlay = {
				size = {
					34,
					34
				},
				offset = {
					152,
					85,
					4
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			progress_frame_bg = {
				size = {
					305,
					67
				},
				offset = {
					0,
					0,
					-1
				},
				scenegraph_id = progress_scenegraph_id
			},
			progress_fill_glow = {
				size = {
					341,
					104
				},
				offset = {
					-17,
					-18,
					5
				},
				color = {
					0,
					255,
					255,
					255
				},
				scenegraph_id = progress_scenegraph_id
			},
			text_charge_cancelled = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("red", 255),
				offset = {
					0,
					-10,
					2
				}
			},
			texture_token_type = {
				color = {
					255,
					255,
					255,
					255
				},
				scenegraph_id = token_scenegraph_id
			},
			texture_token_type_selected = {
				offset = {
					0,
					-2,
					0
				},
				scenegraph_id = token_scenegraph_id
			},
			text = {
				font_size = 24,
				horizontal_alignment = "left",
				pixel_perfect = true,
				vertical_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
				offset = {
					10,
					0,
					2
				},
				scenegraph_id = text_scenegraph_id
			},
			text_hover = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "left",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					10,
					0,
					2
				},
				scenegraph_id = text_scenegraph_id
			},
			text_selected = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "left",
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
				offset = {
					10,
					-2,
					2
				},
				scenegraph_id = text_scenegraph_id
			},
			text_center = {
				vertical_alignment = "center",
				dynamic_font = true,
				horizontal_alignment = "center",
				font_size = 24,
				pixel_perfect = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
				offset = {
					0,
					-10,
					2
				}
			},
			text_hover_center = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					-10,
					2
				}
			},
			text_selected_center = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
				offset = {
					0,
					-10,
					2
				}
			},
			token_text = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "right",
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
				offset = {
					180,
					0,
					2
				},
				scenegraph_id = text_scenegraph_id
			},
			token_text_hover = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "right",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					180,
					0,
					2
				},
				scenegraph_id = text_scenegraph_id
			},
			token_text_selected = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "right",
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
				offset = {
					180,
					-2,
					2
				},
				scenegraph_id = text_scenegraph_id
			},
			text_disabled = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					0,
					-10,
					2
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_altar_button = function (button_text, scenegraph_id, text_scenegraph_id, token_scenegraph_id, progress_scenegraph_id)
	return {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot",
					content_check_function = function (content)
						return not content.disabled
					end
				},
				{
					pass_type = "texture",
					texture_id = "texture_id",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						if content.enable_charge and content.is_gamepad_active then
							return false
						end

						return not button_hotspot.disabled and not button_hotspot.is_hover and (not button_hotspot.is_clicked or (button_hotspot.is_clicked and button_hotspot.is_clicked > 0))
					end
				},
				{
					pass_type = "texture",
					texture_id = "texture_hover_id",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						if content.enable_charge and content.is_gamepad_active then
							return false
						end

						return not button_hotspot.disabled and button_hotspot.is_hover and (not button_hotspot.is_clicked or (button_hotspot.is_clicked and button_hotspot.is_clicked > 0))
					end
				},
				{
					pass_type = "texture",
					texture_id = "texture_click_id",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						if content.enable_charge and content.is_gamepad_active then
							return false
						end

						return (not button_hotspot.disabled and button_hotspot.is_clicked and button_hotspot.is_clicked == 0) or button_hotspot.is_selected
					end
				},
				{
					pass_type = "texture",
					texture_id = "texture_disabled_id",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						if content.enable_charge and content.is_gamepad_active then
							return false
						end

						return button_hotspot.disabled
					end
				},
				{
					texture_id = "texture_token_type",
					style_id = "texture_token_type",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						if content.enable_charge and (content.charging or content.show_cancel_text) then
							return false
						end

						return (not button_hotspot.disabled or (button_hotspot.disabled and content.default_text_on_disable)) and content.texture_token_type and (not button_hotspot.is_clicked or (button_hotspot.is_clicked and button_hotspot.is_clicked > 0)) and not button_hotspot.is_selected
					end
				},
				{
					texture_id = "texture_token_type",
					style_id = "texture_token_type_selected",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						if content.enable_charge and (content.charging or content.show_cancel_text) then
							return false
						end

						return not button_hotspot.disabled and content.texture_token_type and (button_hotspot.is_selected or (button_hotspot.is_clicked and button_hotspot.is_clicked == 0))
					end
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text_field",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						if content.enable_charge and (content.charging or content.show_cancel_text) then
							return false
						end

						return (not button_hotspot.disabled or (button_hotspot.disabled and content.default_text_on_disable)) and not button_hotspot.is_hover and (not button_hotspot.is_clicked or (button_hotspot.is_clicked and button_hotspot.is_clicked > 0)) and not button_hotspot.is_selected
					end
				},
				{
					style_id = "text_hover",
					pass_type = "text",
					text_id = "text_field",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						if content.enable_charge and (content.charging or content.show_cancel_text) then
							return false
						end

						return not button_hotspot.disabled and button_hotspot.is_hover and (not button_hotspot.is_clicked or (button_hotspot.is_clicked and button_hotspot.is_clicked > 0)) and not button_hotspot.is_selected
					end
				},
				{
					style_id = "text_selected",
					pass_type = "text",
					text_id = "text_field",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						if content.enable_charge and (content.charging or content.show_cancel_text) then
							return false
						end

						return (not button_hotspot.disabled and button_hotspot.is_clicked == 0) or button_hotspot.is_selected
					end
				},
				{
					style_id = "text_disabled",
					pass_type = "text",
					text_id = "text_field",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disabled and not content.default_text_on_disable
					end
				},
				{
					style_id = "token_text",
					pass_type = "text",
					text_id = "token_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						if content.enable_charge and (content.charging or content.show_cancel_text) then
							return false
						end

						return (not button_hotspot.disabled or (button_hotspot.disabled and content.default_text_on_disable)) and not button_hotspot.is_hover and (not button_hotspot.is_clicked or (button_hotspot.is_clicked and button_hotspot.is_clicked > 0)) and not button_hotspot.is_selected
					end
				},
				{
					style_id = "token_text_hover",
					pass_type = "text",
					text_id = "token_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						if content.enable_charge and (content.charging or content.show_cancel_text) then
							return false
						end

						return not button_hotspot.disabled and button_hotspot.is_hover and (not button_hotspot.is_clicked or (button_hotspot.is_clicked and button_hotspot.is_clicked > 0)) and not button_hotspot.is_selected
					end
				},
				{
					style_id = "token_text_selected",
					pass_type = "text",
					text_id = "token_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return (not content.charging and not content.show_cancel_text and not button_hotspot.disabled and button_hotspot.is_clicked == 0) or button_hotspot.is_selected
					end
				},
				{
					pass_type = "texture",
					style_id = "button_frame_texture",
					texture_id = "button_frame_texture",
					content_check_function = function (content)
						return not content.is_gamepad_active and content.show_frame
					end
				},
				{
					pass_type = "texture",
					style_id = "button_frame_glow_texture",
					texture_id = "button_frame_glow_texture",
					content_check_function = function (content)
						return content.show_glow
					end
				},
				{
					pass_type = "texture",
					texture_id = "progress_frame",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return content.enable_charge and content.is_gamepad_active
					end
				},
				{
					pass_type = "texture",
					style_id = "progress_frame_bg",
					texture_id = "progress_frame_bg",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return content.enable_charge and content.is_gamepad_active and not button_hotspot.disabled
					end
				},
				{
					pass_type = "texture",
					style_id = "progress_frame_bg",
					texture_id = "progress_frame_bg_disabled",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return content.enable_charge and content.is_gamepad_active and button_hotspot.disabled
					end
				},
				{
					style_id = "progress_fill",
					pass_type = "texture_uv",
					content_id = "progress_fill",
					content_check_function = function (content)
						local parent_content = content.parent

						return parent_content.enable_charge and parent_content.is_gamepad_active
					end
				},
				{
					texture_id = "progress_fill_glow",
					style_id = "progress_fill_glow",
					pass_type = "texture",
					content_check_function = function (content)
						return content.enable_charge and content.is_gamepad_active
					end
				},
				{
					texture_id = "progress_input_icon",
					style_id = "progress_input_icon",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not content.disable_input_icon and (content.enable_input_icon or content.enable_charge) and content.is_gamepad_active and not button_hotspot.disabled
					end
				},
				{
					texture_id = "progress_input_bg",
					style_id = "progress_input_bg",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return (content.enable_input_icon or content.enable_charge) and content.is_gamepad_active
					end
				},
				{
					texture_id = "progress_input_icon_overlay",
					style_id = "progress_input_icon_overlay",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return (content.enable_input_icon or content.enable_charge) and content.is_gamepad_active and not button_hotspot.disabled and content.charging
					end
				},
				{
					style_id = "text_charge_cancelled",
					pass_type = "text",
					text_id = "text_charge_cancelled",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return content.enable_charge and content.is_gamepad_active and content.show_cancel_text
					end
				}
			}
		},
		content = {
			enable_input_icon = false,
			enable_charge = false,
			progress_fill_glow = "forge_button_gamepad_glow_03",
			progress_frame_bg = "forge_button_gamepad_bg",
			progress_frame_disabled = "forge_button_gamepad_disabled",
			button_frame_texture = "button_frame_large",
			charging = false,
			progress_input_bg = "forge_button_gamepad_icon_holder",
			texture_click_id = "medium_button_selected",
			progress_input_icon_overlay = "input_button_icon_overlay_01",
			progress_frame = "altar_button_gamepad_frame_02",
			disable_input_icon = false,
			texture_hover_id = "medium_button_hover",
			progress_input_icon = "xbone_button_icon_y",
			button_frame_glow_texture = "reroll_glow_button",
			show_cancel_text = false,
			show_frame = false,
			show_glow = true,
			progress_frame_bg_disabled = "forge_button_gamepad_bg_disabled",
			token_text = "",
			texture_disabled_id = "medium_button_disabled",
			default_text_on_disable = false,
			texture_id = "medium_button_normal",
			text_charge_cancelled = Localize("forge_screen_melt_abort"),
			progress_fill = {
				texture_id = "forge_button_gamepad_fill",
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
			text_field = Localize(button_text),
			button_hotspot = {}
		},
		style = {
			progress_fill = {
				offset = {
					-10,
					9,
					0
				},
				color = {
					0,
					255,
					255,
					255
				},
				scenegraph_id = progress_scenegraph_id
			},
			progress_input_icon = {
				size = {
					34,
					34
				},
				offset = {
					142,
					78,
					3
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			progress_input_bg = {
				size = {
					81,
					44
				},
				offset = {
					116,
					72,
					2
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			progress_input_icon_overlay = {
				size = {
					34,
					34
				},
				offset = {
					142,
					78,
					4
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			progress_frame_bg = {
				size = {
					305,
					67
				},
				offset = {
					-9,
					10,
					-1
				},
				scenegraph_id = progress_scenegraph_id
			},
			progress_fill_glow = {
				size = {
					341,
					104
				},
				offset = {
					-27,
					-9,
					5
				},
				color = {
					0,
					255,
					255,
					255
				},
				scenegraph_id = progress_scenegraph_id
			},
			text_charge_cancelled = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("red", 255),
				offset = {
					0,
					-4,
					2
				}
			},
			button_frame_texture = {
				size = {
					343,
					106
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-12,
					-15,
					0
				}
			},
			button_frame_glow_texture = {
				size = {
					400,
					140
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-42,
					-29,
					-3
				}
			},
			texture_token_type = {
				color = {
					255,
					255,
					255,
					255
				},
				scenegraph_id = token_scenegraph_id
			},
			texture_token_type_selected = {
				offset = {
					0,
					-2,
					0
				},
				scenegraph_id = token_scenegraph_id
			},
			text = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
				horizontal_alignment = (text_scenegraph_id and "left") or "center",
				offset = {
					(text_scenegraph_id and 10) or 0,
					0,
					2
				},
				scenegraph_id = text_scenegraph_id
			},
			text_hover = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				horizontal_alignment = (text_scenegraph_id and "left") or "center",
				offset = {
					(text_scenegraph_id and 10) or 0,
					0,
					2
				},
				scenegraph_id = text_scenegraph_id
			},
			text_selected = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
				horizontal_alignment = (text_scenegraph_id and "left") or "center",
				offset = {
					(text_scenegraph_id and 10) or 0,
					-2,
					2
				},
				scenegraph_id = text_scenegraph_id
			},
			token_text = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "right",
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
				offset = {
					180,
					0,
					2
				},
				scenegraph_id = text_scenegraph_id
			},
			token_text_hover = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "right",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					180,
					0,
					2
				},
				scenegraph_id = text_scenegraph_id
			},
			token_text_selected = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "right",
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
				offset = {
					180,
					-2,
					2
				},
				scenegraph_id = text_scenegraph_id
			},
			text_disabled = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					0,
					-4,
					2
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_dice_game_button = function (scenegraph_id)
	return {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot",
					content_check_function = function (content)
						return not content.disabled
					end
				},
				{
					pass_type = "texture",
					texture_id = "texture_id",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disabled and not button_hotspot.is_hover and button_hotspot.is_clicked and button_hotspot.is_clicked > 0
					end
				},
				{
					pass_type = "texture",
					texture_id = "texture_hover_id",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disabled and button_hotspot.is_hover and button_hotspot.is_clicked and button_hotspot.is_clicked > 0
					end
				},
				{
					pass_type = "texture",
					texture_id = "texture_click_id",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return (not button_hotspot.disabled and button_hotspot.is_clicked and button_hotspot.is_clicked == 0) or button_hotspot.is_selected
					end
				},
				{
					pass_type = "texture",
					texture_id = "texture_disabled_id",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disabled
					end
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text_field",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disabled and not button_hotspot.is_hover and not button_hotspot.is_selected
					end
				},
				{
					style_id = "text_hover",
					pass_type = "text",
					text_id = "text_field",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disabled and button_hotspot.is_hover and button_hotspot.is_clicked > 0
					end
				},
				{
					style_id = "text_selected",
					pass_type = "text",
					text_id = "text_field",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disabled and button_hotspot.is_hover and button_hotspot.is_clicked == 0
					end
				},
				{
					style_id = "text_disabled",
					pass_type = "text",
					text_id = "text_field",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disabled
					end
				}
			}
		},
		content = {
			texture_click_id = "forge_button_03_selected",
			texture_id = "forge_button_03_normal",
			texture_hover_id = "forge_button_03_hover",
			texture_disabled_id = "forge_button_03_disabled",
			text_field = Localize("merge"),
			button_hotspot = {}
		},
		style = {
			text = {
				vertical_alignment = "center",
				dynamic_font = true,
				horizontal_alignment = "center",
				font_size = 24,
				pixel_perfect = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
				offset = {
					0,
					-10,
					2
				}
			},
			text_hover = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					-10,
					2
				}
			},
			text_selected = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
				offset = {
					0,
					-12,
					2
				}
			},
			text_disabled = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					0,
					-10,
					2
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_altar_craft_reagent_button = function (scenegraph_id, texture, required_hover_scenegraph_id, tooltip_text, masked)
	return {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot",
					content_check_function = function (content)
						return not content.disabled
					end
				},
				{
					style_id = "required_hover_hotspot",
					pass_type = "hotspot",
					content_id = "required_hover_hotspot",
					content_check_function = function (content)
						return not content.disabled
					end
				},
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "texture_id"
				},
				{
					style_id = "tooltip_text",
					pass_type = "tooltip_text",
					text_id = "tooltip_text",
					content_check_function = function (ui_content)
						return ui_content.tooltip_text and ui_content.button_hotspot.is_hover and ui_content.required_hover_hotspot.is_hover
					end
				}
			}
		},
		content = {
			texture_id = texture,
			button_hotspot = {},
			required_hover_hotspot = {},
			tooltip_text = tooltip_text
		},
		style = {
			required_hover_hotspot = {
				scenegraph_id = required_hover_scenegraph_id
			},
			texture_id = {
				masked = masked,
				color = {
					255,
					255,
					255,
					255
				}
			},
			tooltip_text = {
				vertical_alignment = "top",
				font_type = "hell_shark",
				horizontal_alignment = "left",
				font_size = 18,
				max_width = 500,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				line_colors = {},
				offset = {
					0,
					0,
					50
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_forge_upgrade_button = function (scenegraph_id, text_scenegraph_id, token_scenegraph_id, eye_glow_scenegraph_id, progress_scenegraph_id)
	return {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot",
					content_check_function = function (content)
						return (not content.charging or content.show_cancel_text) and not content.disabled
					end
				},
				{
					pass_type = "texture",
					texture_id = "texture_id",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not content.is_gamepad_active and not button_hotspot.disabled and not button_hotspot.is_hover and (not button_hotspot.is_clicked or (button_hotspot.is_clicked and button_hotspot.is_clicked > 0))
					end
				},
				{
					pass_type = "texture",
					texture_id = "texture_hover_id",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not content.is_gamepad_active and not button_hotspot.disabled and button_hotspot.is_hover and (not button_hotspot.is_clicked or (button_hotspot.is_clicked and button_hotspot.is_clicked > 0))
					end
				},
				{
					pass_type = "texture",
					texture_id = "texture_click_id",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return (not content.is_gamepad_active and not button_hotspot.disabled and button_hotspot.is_clicked and button_hotspot.is_clicked == 0) or button_hotspot.is_selected
					end
				},
				{
					pass_type = "texture",
					texture_id = "texture_disabled_id",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not content.is_gamepad_active and button_hotspot.disabled
					end
				},
				{
					texture_id = "texture_token_type",
					style_id = "texture_token_type",
					pass_type = "texture",
					content_check_function = function (content)
						if content.texture_token_type then
							local button_hotspot = content.button_hotspot

							return not content.charging and not content.show_cancel_text and not content.show_title and content.texture_token_type and (not button_hotspot.is_clicked or (button_hotspot.is_clicked and button_hotspot.is_clicked > 0)) and not button_hotspot.is_selected
						end
					end
				},
				{
					texture_id = "texture_token_type",
					style_id = "texture_token_type_selected",
					pass_type = "texture",
					content_check_function = function (content)
						if content.texture_token_type then
							local button_hotspot = content.button_hotspot

							return (not content.charging and not content.show_cancel_text and not content.show_title and content.texture_token_type and button_hotspot.is_selected) or (button_hotspot.is_clicked and button_hotspot.is_clicked == 0)
						end
					end
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text_field",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not content.charging and not content.show_cancel_text and not button_hotspot.is_hover and not content.show_title and (not button_hotspot.is_clicked or (button_hotspot.is_clicked and button_hotspot.is_clicked > 0)) and not button_hotspot.is_selected
					end
				},
				{
					style_id = "text_hover",
					pass_type = "text",
					text_id = "text_field",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not content.charging and not content.show_cancel_text and button_hotspot.is_hover and not content.show_title and (not button_hotspot.is_clicked or (button_hotspot.is_clicked and button_hotspot.is_clicked > 0)) and not button_hotspot.is_selected
					end
				},
				{
					style_id = "token_text",
					pass_type = "text",
					text_id = "token_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not content.charging and not content.show_cancel_text and not button_hotspot.is_hover and not content.show_title and (not button_hotspot.is_clicked or (button_hotspot.is_clicked and button_hotspot.is_clicked > 0)) and not button_hotspot.is_selected
					end
				},
				{
					style_id = "token_text_hover",
					pass_type = "text",
					text_id = "token_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not content.charging and not content.show_cancel_text and button_hotspot.is_hover and not content.show_title and (not button_hotspot.is_clicked or (button_hotspot.is_clicked and button_hotspot.is_clicked > 0)) and not button_hotspot.is_selected
					end
				},
				{
					style_id = "text_selected",
					pass_type = "text",
					text_id = "text_field",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return (not content.charging and not content.show_cancel_text and not content.show_title and button_hotspot.is_clicked == 0) or button_hotspot.is_selected
					end
				},
				{
					style_id = "token_text_selected",
					pass_type = "text",
					text_id = "token_text",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return (not content.charging and not content.show_cancel_text and not content.show_title and button_hotspot.is_clicked == 0) or button_hotspot.is_selected
					end
				},
				{
					style_id = "text_disabled",
					pass_type = "text",
					text_id = "text_field",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.disabled and content.show_title
					end
				},
				{
					style_id = "text_charge_cancelled",
					pass_type = "text",
					text_id = "text_charge_cancelled",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return content.is_gamepad_active and content.show_cancel_text
					end
				},
				{
					pass_type = "texture",
					texture_id = "progress_frame",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return content.is_gamepad_active and not button_hotspot.disabled
					end
				},
				{
					pass_type = "texture",
					texture_id = "progress_frame_disabled",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return content.is_gamepad_active and button_hotspot.disabled
					end
				},
				{
					pass_type = "texture",
					style_id = "progress_frame_bg",
					texture_id = "progress_frame_bg",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return content.is_gamepad_active and not button_hotspot.disabled
					end
				},
				{
					pass_type = "texture",
					style_id = "progress_frame_bg",
					texture_id = "progress_frame_bg_disabled",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return content.is_gamepad_active and button_hotspot.disabled
					end
				},
				{
					style_id = "progress_fill",
					pass_type = "texture_uv",
					content_id = "progress_fill",
					content_check_function = function (content)
						local parent_content = content.parent

						return parent_content.is_gamepad_active
					end
				},
				{
					texture_id = "progress_fill_glow",
					style_id = "progress_fill_glow",
					pass_type = "texture",
					content_check_function = function (content)
						return content.is_gamepad_active
					end
				},
				{
					texture_id = "progress_input_icon",
					style_id = "progress_input_icon",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return content.is_gamepad_active and not button_hotspot.disabled
					end
				},
				{
					texture_id = "progress_input_icon_overlay",
					style_id = "progress_input_icon_overlay",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return content.is_gamepad_active and not button_hotspot.disabled and content.charging
					end
				},
				{
					texture_id = "eye_glow_texture",
					style_id = "eye_glow_texture",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not content.is_gamepad_active and content.use_eye_glow and not button_hotspot.disabled
					end
				},
				{
					texture_id = "gamepad_glow_texture",
					style_id = "gamepad_glow_texture",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return content.is_gamepad_active and not button_hotspot.disabled
					end
				}
			}
		},
		content = {
			show_cancel_text = false,
			progress_frame_bg_disabled = "forge_button_gamepad_bg_disabled",
			progress_frame_bg = "forge_button_gamepad_bg",
			progress_fill_glow = "forge_button_gamepad_glow_02",
			show_title = true,
			charging = false,
			texture_click_id = "forge_button_03_selected",
			eye_glow_texture = "forge_button_03_glow_effect",
			progress_frame_disabled = "forge_button_gamepad_disabled",
			token_text = "",
			progress_input_icon_overlay = "input_button_icon_overlay_01",
			progress_input_icon = "xbone_button_icon_y",
			progress_frame = "forge_button_gamepad_frame",
			texture_hover_id = "forge_button_03_hover",
			gamepad_glow_texture = "forge_button_gamepad_glow",
			texture_disabled_id = "forge_button_03_disabled",
			texture_id = "forge_button_03_normal",
			progress_fill = {
				texture_id = "forge_button_gamepad_fill_02",
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
			use_eye_glow = (eye_glow_scenegraph_id and true) or false,
			text_field = Localize("upgrade"),
			button_hotspot = {},
			text_charge_cancelled = Localize("forge_screen_melt_abort")
		},
		style = {
			eye_glow_texture = {
				color = {
					0,
					255,
					255,
					255
				},
				scenegraph_id = eye_glow_scenegraph_id
			},
			gamepad_glow_texture = {
				size = {
					304,
					20
				},
				offset = {
					17,
					81,
					4
				},
				color = {
					0,
					255,
					255,
					255
				}
			},
			progress_input_icon = {
				size = {
					34,
					34
				},
				offset = {
					152,
					85,
					3
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			progress_input_icon_overlay = {
				size = {
					34,
					34
				},
				offset = {
					152,
					85,
					4
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			progress_frame_bg = {
				size = {
					305,
					67
				},
				offset = {
					0,
					0,
					-1
				},
				scenegraph_id = progress_scenegraph_id
			},
			progress_fill = {
				offset = {
					0,
					0,
					0
				},
				color = {
					0,
					255,
					255,
					255
				},
				scenegraph_id = progress_scenegraph_id
			},
			progress_fill_glow = {
				size = {
					341,
					104
				},
				offset = {
					-17,
					-18,
					4
				},
				color = {
					0,
					255,
					255,
					255
				},
				scenegraph_id = progress_scenegraph_id
			},
			text_charge_cancelled = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("red", 255),
				offset = {
					0,
					-10,
					2
				}
			},
			texture_token_type = {
				color = {
					255,
					255,
					255,
					255
				},
				scenegraph_id = token_scenegraph_id
			},
			texture_token_type_selected = {
				offset = {
					0,
					-2,
					0
				},
				color = {
					255,
					255,
					255,
					255
				},
				scenegraph_id = token_scenegraph_id
			},
			text = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "left",
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
				offset = {
					10,
					0,
					2
				},
				scenegraph_id = text_scenegraph_id
			},
			text_hover = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "left",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					10,
					0,
					2
				},
				scenegraph_id = text_scenegraph_id
			},
			text_selected = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "left",
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
				offset = {
					10,
					-2,
					2
				},
				scenegraph_id = text_scenegraph_id
			},
			token_text = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "right",
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
				offset = {
					180,
					0,
					2
				},
				scenegraph_id = text_scenegraph_id
			},
			token_text_hover = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "right",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					180,
					0,
					2
				},
				scenegraph_id = text_scenegraph_id
			},
			token_text_selected = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "right",
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
				offset = {
					180,
					-2,
					2
				},
				scenegraph_id = text_scenegraph_id
			},
			text_disabled = {
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = 24,
				horizontal_alignment = "center",
				text_color = Colors.get_color_table_with_alpha("gray", 255),
				offset = {
					0,
					-10,
					2
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_menu_selection_bar = function (scenegraph_definition, textures, icons, tooltips, offset, scenegraph_base, size, icon_size)
	local passes = {}
	local element = {
		passes = passes
	}
	local style = {}
	local content_data = {}

	assert(textures.texture_hover_id, "missing texture")
	assert(textures.texture_click_id, "missing texture")

	local widget = {
		style = style,
		content = content_data,
		element = element,
		scenegraph_id = scenegraph_base
	}
	local num_buttons = #icons

	for i = 1, num_buttons, 1 do
		local button_hotspot_name = i
		local tooltip_text = "tooltip_text_" .. i
		local button_style_name = string.format("button_style_%d", i)
		local button_click_style_name = string.format("button_click_style_%d", i)
		local icon_texture_id = string.format("icon_%d", i)
		local icon_click_texture_id = string.format("icon_click_%d", i)
		local disabled_overlay_name = string.format("disabled_overlay_%d", i)

		table.append_varargs(passes, {
			pass_type = "hotspot",
			content_id = button_hotspot_name,
			style_id = button_hotspot_name
		}, {
			pass_type = "texture",
			texture_id = button_click_style_name,
			style_id = button_click_style_name
		}, {
			pass_type = "texture",
			texture_id = button_style_name,
			style_id = button_style_name
		}, {
			pass_type = "texture",
			texture_id = icon_texture_id,
			style_id = icon_texture_id
		}, {
			pass_type = "texture",
			texture_id = icon_click_texture_id,
			style_id = icon_click_texture_id
		}, {
			pass_type = "tooltip_text",
			text_id = tooltip_text,
			style_id = tooltip_text,
			content_check_function = function (content)
				return content[button_hotspot_name].is_hover
			end
		}, {
			pass_type = "rect",
			style_id = disabled_overlay_name,
			content_check_function = function (content)
				return content[button_hotspot_name].disable_button
			end
		})

		local scenegraph_id = string.format("%s_%d", scenegraph_base, i)
		scenegraph_definition[scenegraph_id] = {
			parent = (i == 1 and scenegraph_base) or string.format("%s_%d", scenegraph_base, i - 1),
			size = size,
			offset = (i ~= 1 and offset) or nil
		}
		local style_scenegraph_id = string.format("%s_icon_%d", scenegraph_base, i)
		scenegraph_definition[style_scenegraph_id] = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			parent = scenegraph_id,
			size = icon_size,
			offset = {
				0,
				0,
				5
			}
		}
		content_data[button_hotspot_name] = {}
		content_data[tooltip_text] = tooltips[i]
		content_data[button_style_name] = textures.texture_hover_id
		content_data[icon_texture_id] = icons[i].texture_hover_id
		content_data[button_click_style_name] = textures.texture_click_id
		content_data[icon_click_texture_id] = icons[i].texture_click_id
		style[tooltip_text] = {
			font_size = 24,
			max_width = 500,
			localize = true,
			horizontal_alignment = "left",
			vertical_alignment = "top",
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("white", 255),
			line_colors = {},
			offset = {
				0,
				0,
				250
			}
		}
		style[disabled_overlay_name] = {
			scenegraph_id = scenegraph_id,
			size = {
				size[1] - 12,
				size[2] - 12
			},
			offset = {
				6,
				6,
				5
			},
			color = {
				178,
				0,
				0,
				0
			}
		}
		style[button_hotspot_name] = {
			scenegraph_id = scenegraph_id,
			size = {
				size[1] - 12,
				size[2] - 12
			},
			offset = {
				6,
				6,
				0
			}
		}
		style[button_style_name] = {
			scenegraph_id = scenegraph_id,
			color = {
				178.5,
				255,
				255,
				255
			},
			size = size
		}
		style[icon_texture_id] = {
			scenegraph_id = style_scenegraph_id,
			color = {
				178.5,
				255,
				255,
				255
			},
			size = icon_size
		}
		style[button_click_style_name] = {
			scenegraph_id = scenegraph_id,
			color = {
				0,
				255,
				255,
				255
			},
			offset = {
				0,
				0,
				1
			},
			size = size
		}
		style[icon_click_texture_id] = {
			scenegraph_id = style_scenegraph_id,
			color = {
				0,
				255,
				255,
				255
			},
			offset = {
				0,
				0,
				2
			},
			size = icon_size
		}
	end

	return widget
end

UIWidgets.create_tiled_texture = function (scenegraph_id, texture, texture_size, offset, masked, color)
	return {
		element = {
			passes = {
				{
					pass_type = "tiled_texture",
					style_id = "tiling_texture",
					texture_id = "tiling_texture"
				}
			}
		},
		content = {
			tiling_texture = texture
		},
		style = {
			tiling_texture = {
				masked = masked,
				offset = offset or {
					0,
					0,
					0
				},
				texture_tiling_size = texture_size,
				color = color or {
					255,
					255,
					255,
					255
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_texture_with_text = function (texture, text, scenegraph_id, text_scenegraph_id, text_style)
	return {
		element = {
			passes = {
				{
					texture_id = "texture_id",
					style_id = "texture_id",
					pass_type = "texture"
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text"
				}
			}
		},
		content = {
			texture_id = texture,
			text = text
		},
		style = {
			text = text_style or {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				word_wrap = true,
				font_size = 20,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				scenegraph_id = text_scenegraph_id
			},
			texture_id = {
				color = {
					255,
					255,
					255,
					255
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_texture_with_text_and_tooltip = function (texture, text, tooltip_text, scenegraph_id, text_scenegraph_id, text_style, tooltip_style)
	return {
		element = {
			passes = {
				{
					texture_id = "texture_id",
					style_id = "texture_id",
					pass_type = "texture"
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text"
				},
				{
					pass_type = "hotspot",
					content_id = "tooltip_hotspot",
					content_check_function = function (ui_content)
						return not ui_content.disabled
					end
				},
				{
					style_id = "tooltip_text",
					pass_type = "tooltip_text",
					text_id = "tooltip_text",
					content_check_function = function (ui_content)
						return ui_content.tooltip_hotspot.is_hover
					end
				}
			}
		},
		content = {
			tooltip_hotspot = {},
			texture_id = texture,
			tooltip_text = tooltip_text,
			text = text
		},
		style = {
			text = text_style or {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				word_wrap = true,
				font_size = 20,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				scenegraph_id = text_scenegraph_id
			},
			tooltip_text = tooltip_style or {
				font_size = 24,
				max_width = 500,
				localize = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				line_colors = {},
				offset = {
					0,
					0,
					50
				}
			},
			texture_id = {
				color = {
					255,
					255,
					255,
					255
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_simple_tooltip = function (text, scenegraph_id, max_width, optional_style)
	return {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "tooltip_hotspot"
				},
				{
					style_id = "tooltip_text",
					pass_type = "tooltip_text",
					text_id = "tooltip_text",
					content_check_function = function (ui_content)
						return ui_content.tooltip_hotspot.is_hover
					end
				}
			}
		},
		content = {
			tooltip_text = text,
			tooltip_hotspot = {}
		},
		style = {
			tooltip_text = optional_style or {
				font_size = 24,
				localize = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark",
				max_width = max_width,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				line_colors = {},
				offset = {
					0,
					0,
					3
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_additional_option_tooltip = function (scenegraph_id, size, content_passes, tooltip_data, max_width, horizontal_alignment, vertical_alignment, grow_downwards, offset)
	return {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					style_id = "tooltip",
					additional_option_id = "tooltip",
					pass_type = "additional_option_tooltip",
					content_passes = content_passes or {
						"additional_option_info"
					},
					content_check_function = function (content)
						return content.tooltip and content.button_hotspot.is_hover
					end
				}
			}
		},
		content = {
			tooltip = tooltip_data or nil,
			button_hotspot = {
				allow_multi_hover = true
			}
		},
		style = {
			tooltip = {
				grow_downwards = grow_downwards,
				max_width = max_width or 300,
				horizontal_alignment = horizontal_alignment or "center",
				vertical_alignment = vertical_alignment or "bottom",
				offset = offset or {
					0,
					0,
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

UIWidgets.create_simple_hotspot = function (scenegraph_id, allow_multi_hover)
	return {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "hotspot"
				}
			}
		},
		content = {
			hotspot = {
				allow_multi_hover = allow_multi_hover
			}
		},
		style = {},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_simple_two_state_button = function (scenegraph_id, normal_texture, hover_texture)
	return {
		element = UIElements.SimpleButton,
		content = {
			texture_id = normal_texture,
			texture_hover_id = hover_texture,
			button_hotspot = {}
		},
		style = {},
		offset = {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_simple_rect = function (scenegraph_id, color, layer, offset)
	slot4 = {
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "rect"
				}
			}
		},
		content = {}
	}
	slot5 = {}
	slot6 = {
		color = color or {
			255,
			255,
			255,
			255
		}
	}

	if not offset then
		slot7 = {
			0,
			0,
			layer or 0
		}
	end

	slot6.offset = slot7
	slot5.rect = slot6
	slot4.style = slot5
	slot4.offset = {
		0,
		0,
		0
	}
	slot4.scenegraph_id = scenegraph_id

	return slot4
end

UIWidgets.create_simple_rounded_rect = function (scenegraph_id, corner_radius, color)
	return {
		element = {
			passes = {
				{
					pass_type = "rounded_background",
					style_id = "rect"
				}
			}
		},
		content = {},
		style = {
			rect = {
				color = color or {
					255,
					255,
					255,
					255
				},
				corner_radius = corner_radius or 0,
				offset = {
					0,
					0,
					0
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_simple_texture = function (texture, scenegraph_id, masked, retained, color, layer)
	return {
		element = {
			passes = {
				{
					texture_id = "texture_id",
					style_id = "texture_id",
					pass_type = "texture",
					retained_mode = retained
				}
			}
		},
		content = {
			texture_id = texture
		},
		style = {
			texture_id = {
				color = color or {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				},
				masked = masked
			}
		},
		offset = {
			0,
			0,
			layer or 0
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_aligned_texture = function (texture, texture_size, horizontal_alignment, vertical_alignment, scenegraph_id, masked, retained, color, layer, offset)
	slot10 = {
		element = {
			passes = {
				{
					texture_id = "texture_id",
					style_id = "texture_id",
					pass_type = "texture",
					retained_mode = retained
				}
			}
		},
		content = {
			texture_id = texture
		},
		style = {
			texture_id = {
				vertical_alignment = vertical_alignment,
				horizontal_alignment = horizontal_alignment,
				texture_size = texture_size,
				color = color or {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				},
				masked = masked
			}
		}
	}

	if not offset or not offset then
		slot11 = {
			0,
			0,
			layer or 0
		}
	end

	slot10.offset = slot11
	slot10.scenegraph_id = scenegraph_id

	return slot10
end

UIWidgets.create_simple_centered_texture_amount = function (texture, texture_size, scenegraph_id, amount, masked, color)
	local textures = {}
	local texture_colors = {}

	for i = 1, amount, 1 do
		textures[i] = texture
		texture_colors[i] = color or {
			255,
			255,
			255,
			255
		}
	end

	return {
		element = {
			passes = {
				{
					pass_type = "centered_texture_amount",
					style_id = "texture_id",
					texture_id = "texture_id"
				}
			}
		},
		content = {
			texture_id = textures
		},
		style = {
			texture_id = {
				texture_axis = 1,
				spacing = 8,
				texture_size = texture_size,
				texture_amount = amount,
				color = color or {
					255,
					255,
					255,
					255
				},
				texture_colors = texture_colors,
				offset = {
					0,
					0,
					0
				},
				masked = masked
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

UIWidgets.create_simple_multi_texture = function (textures, texture_sizes, axis, direction, spacing, scenegraph_id, masked)
	return {
		element = {
			passes = {
				{
					texture_id = "texture_id",
					style_id = "texture_id",
					pass_type = "multi_texture"
				}
			}
		},
		content = {
			texture_id = textures or {}
		},
		style = {
			texture_id = {
				draw_count = (textures and #textures) or 0,
				axis = axis or 1,
				spacing = spacing or {
					0,
					0
				},
				direction = direction or 1,
				texture_sizes = texture_sizes or {},
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
				},
				masked = masked
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_simple_centered_uv_texture_amount = function (texture, texture_size, amount, axis, scenegraph_id, masked)
	local texture_uvs = {}
	local texture_sizes = {}

	for i = 1, amount, 1 do
		texture_uvs[i] = {
			{
				0,
				0
			},
			{
				1,
				1
			}
		}
		texture_sizes[i] = {
			texture_size[1],
			texture_size[2]
		}
	end

	return {
		element = {
			passes = {
				{
					texture_id = "texture_id",
					style_id = "texture_id",
					pass_type = "centered_uv_texture_amount"
				}
			}
		},
		content = {
			texture_id = texture
		},
		style = {
			texture_id = {
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
				},
				texture_size = texture_size or {
					10,
					10
				},
				texture_axis = axis or 1,
				texture_amount = amount or 3,
				texture_uvs = texture_uvs,
				texture_sizes = texture_sizes,
				masked = masked
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_texture_with_style = function (texture, scenegraph_id, style)
	return {
		element = {
			passes = {
				{
					texture_id = "texture_id",
					style_id = "texture_id",
					pass_type = "texture"
				}
			}
		},
		content = {
			texture_id = texture
		},
		style = {
			texture_id = style
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_simple_gradient_mask_texture = function (texture, scenegraph_id, color)
	return {
		element = {
			passes = {
				{
					texture_id = "texture_id",
					style_id = "texture_id",
					pass_type = "gradient_mask_texture"
				}
			}
		},
		content = {
			texture_id = texture
		},
		style = {
			texture_id = {
				gradient_threshold = 0,
				offset = {
					0,
					0,
					0
				},
				color = color or {
					255,
					255,
					255,
					255
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_simple_rotated_texture = function (texture, angle, pivot, scenegraph_id, masked, retained, color, layer, offset)
	return {
		element = {
			passes = {
				{
					texture_id = "texture_id",
					style_id = "texture_id",
					pass_type = "rotated_texture",
					retained_mode = retained
				}
			}
		},
		content = {
			texture_id = texture
		},
		style = {
			texture_id = {
				masked = masked,
				angle = angle,
				pivot = pivot,
				color = color or {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					layer or 0
				}
			}
		},
		offset = offset or {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_simple_uv_rotated_texture = function (texture, uvs, angle, pivot, scenegraph_id, masked, retained, color, layer, offset)
	return {
		element = {
			passes = {
				{
					texture_id = "texture_id",
					style_id = "texture_id",
					pass_type = "rotated_texture",
					retained_mode = retained
				}
			}
		},
		content = {
			texture_id = texture
		},
		style = {
			texture_id = {
				masked = masked,
				angle = angle,
				pivot = pivot,
				uvs = uvs,
				color = color or {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					layer or 0
				}
			}
		},
		offset = offset or {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_simple_uv_texture = function (texture, uvs, scenegraph_id, masked, retained, color, layer)
	return {
		element = {
			passes = {
				{
					style_id = "texture_id",
					pass_type = "texture_uv",
					content_id = "texture_id",
					retained_mode = retained
				}
			}
		},
		content = {
			texture_id = {
				uvs = uvs,
				texture_id = texture
			}
		},
		style = {
			texture_id = {
				masked = masked,
				offset = {
					0,
					0,
					layer or 0
				},
				color = color or {
					255,
					255,
					255,
					255
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

UIWidgets.create_simple_frame = function (texture, texture_size, corner_size, vertical_size, horizontal_size, scenegraph_id, optional_style)
	if not optional_style then
		local style = {
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
		}
	end

	style.texture_size = texture_size
	style.texture_sizes = {
		corner = corner_size,
		vertical = vertical_size,
		horizontal = horizontal_size
	}

	return {
		element = {
			passes = {
				{
					texture_id = "texture_id",
					style_id = "texture_id",
					pass_type = "texture_frame"
				}
			}
		},
		content = {
			texture_id = texture
		},
		style = {
			texture_id = style
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_uv_texture_with_style = function (texture, uvs, scenegraph_id, style)
	return {
		element = {
			passes = {
				{
					style_id = "texture_id",
					pass_type = "texture_uv",
					content_id = "texture_id"
				}
			}
		},
		content = {
			texture_id = {
				uvs = uvs,
				texture_id = texture
			}
		},
		style = {
			texture_id = style
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_simple_text = function (text, scenegraph_id, size, color, text_style, optional_font_style, retained)
	local text_offset = (text_style and text_style.offset) or {
		0,
		0,
		2
	}
	local text_color = (text_style and text_style.text_color) or color or {
		255,
		255,
		255,
		255
	}

	if not text_style then
		text_style = {
			vertical_alignment = "center",
			localize = true,
			horizontal_alignment = "center",
			word_wrap = true,
			font_size = size,
			font_type = optional_font_style or "hell_shark",
			text_color = text_color,
			offset = text_offset
		}
	end

	local text_shadow_style = table.clone(text_style)
	local text_shadow_style_color = text_style.shadow_color or {
		255,
		0,
		0,
		0
	}
	local text_shadow_offset = text_style.shadow_offset or {
		2,
		2,
		0
	}
	text_shadow_style_color[1] = text_color[1]
	text_shadow_style.text_color = text_shadow_style_color
	text_shadow_style.offset = {
		text_offset[1] + text_shadow_offset[1],
		text_offset[2] - text_shadow_offset[2],
		text_offset[3] - 1
	}

	return {
		element = {
			passes = {
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text",
					retained_mode = retained
				},
				{
					style_id = "text_shadow",
					pass_type = "text",
					text_id = "text",
					content_check_function = function (content)
						return content.use_shadow
					end,
					retained_mode = retained
				}
			}
		},
		content = {
			text = text,
			color = text_color,
			use_shadow = (text_style and text_style.use_shadow) or false
		},
		style = {
			text = text_style,
			text_shadow = text_shadow_style
		},
		offset = {
			0,
			0,
			0
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_simple_text_tooltip = function (text, tooltip_text, scenegraph_id, size, color, text_style, tooltip_style)
	return {
		element = {
			passes = {
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text"
				},
				{
					pass_type = "hotspot",
					content_id = "tooltip_hotspot"
				},
				{
					style_id = "tooltip_text",
					pass_type = "tooltip_text",
					text_id = "tooltip_text",
					content_check_function = function (ui_content)
						return ui_content.tooltip_hotspot.is_hover
					end
				}
			}
		},
		content = {
			text = text,
			tooltip_text = tooltip_text,
			tooltip_hotspot = {},
			color = (text_style and text_style.text_color) or color
		},
		style = {
			text = text_style or {
				vertical_alignment = "center",
				localize = true,
				horizontal_alignment = "center",
				word_wrap = true,
				font_type = "hell_shark",
				font_size = size,
				text_color = color,
				offset = {
					0,
					0,
					2
				}
			},
			tooltip_text = tooltip_style or {
				font_size = 24,
				max_width = 500,
				localize = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				line_colors = {},
				offset = {
					0,
					0,
					50
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_simple_rect_text = function (scenegraph_id, text, font_size, color, rect_color, text_style)
	slot6 = {
		element = {
			passes = {
				{
					style_id = "text",
					pass_type = "rect_text",
					text_id = "text"
				}
			}
		},
		content = {
			text = text
		}
	}
	slot7 = {}

	if not text_style then
		slot8 = {
			localize = false,
			horizontal_alignment = "left",
			vertical_alignment = "top",
			font_type = "hell_shark",
			font_size = font_size or 24,
			text_color = color or Colors.get_color_table_with_alpha("white", 255),
			rect_color = rect_color or Colors.get_color_table_with_alpha("black", 150),
			line_colors = {},
			offset = {
				0,
				0,
				50
			}
		}
	end

	slot7.text = slot8
	slot6.style = slot7
	slot6.scenegraph_id = scenegraph_id

	return slot6
end

UIWidgets.create_forge_toggle_button = function (normal_texture, normal_hover_texture, selected_texture, selected_hover_texture, scenegraph_id, hotspot_scenegraph_id)
	return {
		element = {
			passes = {
				{
					style_id = "button_hotspot",
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					pass_type = "texture",
					texture_id = "texture_id",
					content_check_function = function (content)
						return not content.is_selected and not content.button_hotspot.is_hover
					end
				},
				{
					pass_type = "texture",
					texture_id = "texture_hover_id",
					content_check_function = function (content)
						return not content.is_selected and content.button_hotspot.is_hover
					end
				},
				{
					pass_type = "texture",
					texture_id = "texture_selected_id",
					content_check_function = function (content)
						return content.is_selected and not content.button_hotspot.is_hover
					end
				},
				{
					pass_type = "texture",
					texture_id = "texture_selected_hover_id",
					content_check_function = function (content)
						return content.is_selected and content.button_hotspot.is_hover
					end
				}
			}
		},
		content = {
			button_hotspot = {},
			texture_id = normal_texture,
			texture_hover_id = normal_hover_texture,
			texture_selected_id = selected_texture,
			texture_selected_hover_id = selected_hover_texture
		},
		style = {
			button_hotspot = {
				scenegraph_id = hotspot_scenegraph_id
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_button_2_state = function (normal_texture, selected_texture, scenegraph_id, hotspot_scenegraph_id)
	return {
		element = {
			passes = {
				{
					style_id = "button_hotspot",
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					pass_type = "texture",
					texture_id = "texture_id",
					content_check_function = function (content)
						return not content.is_selected
					end
				},
				{
					pass_type = "texture",
					texture_id = "texture_selected_id",
					content_check_function = function (content)
						return content.is_selected
					end
				}
			}
		},
		content = {
			button_hotspot = {},
			texture_id = normal_texture,
			texture_selected_id = selected_texture
		},
		style = {
			button_hotspot = {
				scenegraph_id = hotspot_scenegraph_id
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_title_text = function (text, scenegraph_id)
	return {
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
			text = text
		},
		style = {
			text = {
				font_size = 36,
				localize = true,
				word_wrap = true,
				pixel_perfect = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark_header",
				text_color = Colors.get_table("cheeseburger"),
				offset = {
					0,
					0,
					2
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_matchmaking_portrait = function (size, scenegraph_id)
	return {
		element = {
			passes = {
				{
					texture_id = "slot_bg",
					style_id = "slot_bg",
					pass_type = "texture"
				},
				{
					texture_id = "portrait",
					style_id = "portrait",
					pass_type = "texture",
					content_check_function = function (content)
						return not content.is_connecting and content.is_connected
					end
				},
				{
					texture_id = "ready_icon",
					style_id = "ready_icon",
					pass_type = "texture",
					content_check_function = function (content)
						return not content.is_connecting and content.is_connected and content.is_ready
					end
				},
				{
					texture_id = "voted_yes_icon",
					style_id = "voted_yes_icon",
					pass_type = "texture",
					content_check_function = function (content)
						return not content.is_connecting and content.is_connected and content.is_voting and content.voted_yes
					end
				},
				{
					texture_id = "waiting_for_vote",
					style_id = "waiting_for_vote",
					pass_type = "texture",
					content_check_function = function (content)
						return not content.is_connecting and content.is_connected and content.is_voting and not content.voted_yes
					end
				},
				{
					texture_id = "connecting_icon",
					style_id = "connecting_icon",
					pass_type = "rotated_texture",
					content_check_function = function (content)
						return content.is_connecting
					end
				}
			}
		},
		content = {
			portrait = "small_unit_frame_portrait_default",
			is_connecting = false,
			is_connected = false,
			slot_bg = "small_unit_frame_portrait_default",
			waiting_for_vote = "matchmaking_checkbox",
			connecting_icon = "journal_icon_02",
			ready_icon = "matchmaking_checkbox",
			voted_yes_icon = "matchmaking_checkbox",
			is_ready = false
		},
		style = {
			slot_bg = {
				offset = {
					0,
					0,
					0
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			portrait = {
				offset = {
					0,
					0,
					1
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			ready_icon = {
				size = {
					37,
					31
				},
				offset = {
					size[1] / 2 - 18.5,
					size[2] / 2 - 15.5,
					3
				},
				color = {
					255,
					0,
					255,
					0
				}
			},
			voted_yes_icon = {
				size = {
					37,
					31
				},
				offset = {
					size[1] / 2 - 18.5,
					size[2] / 2 - 15.5,
					3
				},
				color = {
					255,
					0,
					255,
					0
				}
			},
			waiting_for_vote = {
				size = {
					37,
					31
				},
				offset = {
					size[1] / 2 - 18.5,
					size[2] / 2 - 15.5,
					3
				},
				color = {
					255,
					255,
					168,
					0
				}
			},
			connecting_icon = {
				angle = 0,
				size = {
					30,
					30
				},
				pivot = {
					15,
					15
				},
				offset = {
					size[1] / 2 - 15,
					size[2] / 2 - 15,
					2
				},
				color = {
					255,
					255,
					255,
					255
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_small_trait_button = function (scenegraph_id, hotspot_scenegraph_id, masked)
	return {
		element = {
			passes = {
				{
					style_id = "button_hotspot",
					pass_type = "hotspot",
					content_id = "button_hotspot",
					content_check_function = function (content)
						return not content.disabled and not content.is_selected
					end
				},
				{
					pass_type = "texture",
					style_id = "texture_bg_id",
					texture_id = "texture_bg_id",
					content_check_function = function (content)
						return content.use_background
					end
				},
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "texture_id",
					content_check_function = function (content)
						return content.texture_id
					end
				},
				{
					pass_type = "texture",
					style_id = "texture_hover_id",
					texture_id = "texture_hover_id",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.is_hover and not button_hotspot.is_selected and not button_hotspot.disabled
					end
				},
				{
					pass_type = "texture",
					style_id = "texture_selected_id",
					texture_id = "texture_selected_id",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.is_selected and not button_hotspot.disabled
					end
				},
				{
					pass_type = "texture",
					style_id = "texture_lock_id",
					texture_id = "texture_lock_id",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.locked and not button_hotspot.disabled
					end
				},
				{
					pass_type = "texture",
					style_id = "texture_glow_id",
					texture_id = "texture_glow_id",
					content_check_function = function (content)
						return content.use_glow
					end
				},
				{
					pass_type = "texture",
					style_id = "texture_trait_cover_id",
					texture_id = "texture_trait_cover_id",
					content_check_function = function (content)
						return content.button_hotspot.disabled and content.use_trait_cover and content.texture_id
					end
				}
			}
		},
		content = {
			use_glow = true,
			texture_lock_id = "trait_icon_selected_frame_locked",
			use_trait_cover = false,
			texture_glow_id = "item_slot_glow_03",
			texture_hover_id = "trait_icon_mouseover_frame",
			texture_selected_id = "trait_icon_selected_frame",
			use_background = true,
			texture_bg_id = "trait_slot",
			texture_id = "trait_icon_empty",
			texture_trait_cover_id = "trait_slot_cover",
			button_hotspot = {
				disabled = false,
				locked = false
			}
		},
		style = {
			button_hotspot = {
				scenegraph_id = hotspot_scenegraph_id
			},
			texture_bg_id = {
				masked = masked,
				size = {
					54,
					58
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-7,
					-10,
					-1
				}
			},
			texture_id = {
				masked = masked,
				color = {
					255,
					255,
					255,
					255
				}
			},
			texture_hover_id = {
				masked = masked,
				offset = {
					0,
					0,
					1
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			texture_selected_id = {
				masked = masked,
				offset = {
					0,
					0,
					2
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			texture_lock_id = {
				masked = masked,
				offset = {
					0,
					0,
					3
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			texture_glow_id = {
				masked = masked,
				size = {
					104,
					104
				},
				offset = {
					-32,
					-32,
					4
				},
				color = {
					0,
					255,
					255,
					255
				}
			},
			texture_trait_cover_id = {
				masked = masked,
				size = {
					40,
					41
				},
				offset = {
					0,
					0,
					5
				},
				color = {
					255,
					255,
					255,
					255
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_small_reroll_trait_button = function (scenegraph_id, hotspot_scenegraph_id)
	return {
		element = {
			passes = {
				{
					style_id = "button_hotspot",
					pass_type = "hotspot",
					content_id = "button_hotspot",
					content_check_function = function (content)
						return not content.disabled and not content.is_selected
					end
				},
				{
					pass_type = "texture",
					style_id = "texture_bg_id",
					texture_id = "texture_bg_id",
					content_check_function = function (content)
						return content.use_background
					end
				},
				{
					pass_type = "texture",
					style_id = "texture_slot_id",
					texture_id = "texture_slot_id",
					content_check_function = function (content)
						return content.use_background
					end
				},
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "texture_id",
					content_check_function = function (content)
						return content.texture_id
					end
				},
				{
					pass_type = "texture",
					style_id = "texture_hover_id",
					texture_id = "texture_hover_id",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.is_hover and not button_hotspot.is_selected and not button_hotspot.disabled
					end
				},
				{
					pass_type = "texture",
					style_id = "texture_selected_id",
					texture_id = "texture_selected_id",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.is_selected and not button_hotspot.disabled
					end
				},
				{
					pass_type = "texture",
					style_id = "texture_lock_id",
					texture_id = "texture_lock_id",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return button_hotspot.locked and content.texture_id
					end
				},
				{
					pass_type = "texture",
					style_id = "texture_glow_id",
					texture_id = "texture_glow_id",
					content_check_function = function (content)
						return content.use_glow
					end
				}
			}
		},
		content = {
			use_glow = true,
			texture_slot_id = "reroll_trait_slot_01",
			texture_glow_id = "reroll_glow_small",
			texture_hover_id = "trait_icon_mouseover_frame",
			use_background = true,
			texture_bg_id = "reroll_trait_slot_01_bg",
			texture_id = "trait_icon_empty",
			texture_selected_id = "trait_icon_selected_frame",
			texture_lock_id = "trait_icon_selected_frame_locked",
			button_hotspot = {
				disabled = false,
				locked = false
			}
		},
		style = {
			button_hotspot = {
				scenegraph_id = hotspot_scenegraph_id
			},
			texture_bg_id = {
				size = {
					68,
					68
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-14,
					-15,
					-1
				}
			},
			texture_slot_id = {
				size = {
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
					-9,
					-9,
					0
				}
			},
			texture_id = {
				color = {
					255,
					255,
					255,
					255
				}
			},
			texture_hover_id = {
				offset = {
					0,
					0,
					2
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			texture_selected_id = {
				offset = {
					0,
					0,
					3
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			texture_lock_id = {
				offset = {
					0,
					0,
					4
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			texture_glow_id = {
				size = {
					140,
					140
				},
				offset = {
					-50,
					-50,
					5
				},
				color = {
					0,
					255,
					255,
					255
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_attach_icon_button = function (background_texture, scenegraph_id, icon_scenegraph_id, drag_texture_size, animation_scenegraph_id, animation_glow_texture, disable_interaction)
	return {
		element = {
			passes = {
				{
					style_id = "button_hotspot",
					pass_type = "hotspot",
					content_id = "button_hotspot",
					content_check_function = function (content)
						return not content.disable_interaction
					end
				},
				{
					style_id = "tooltip_text",
					pass_type = "tooltip_text",
					text_id = "tooltip_text",
					content_check_function = function (content)
						return content.icon_texture_id and content.tooltip_enabled and content.button_hotspot.is_hover and not content.button_hotspot.disable_interaction
					end
				},
				{
					style_id = "tooltip_text",
					pass_type = "tooltip_text",
					text_id = "tooltip_text_no_item",
					content_check_function = function (content)
						return not content.icon_texture_id and content.tooltip_enabled and content.button_hotspot.is_hover and not content.button_hotspot.disable_interaction
					end
				},
				{
					texture_id = "background_texture_id",
					style_id = "background_texture_id",
					pass_type = "texture",
					content_check_function = function (content)
						return content.background_texture_id
					end
				},
				{
					texture_id = "bg_overlay_texture_id",
					style_id = "bg_overlay_texture_id",
					pass_type = "texture",
					content_check_function = function (content)
						return content.bg_overlay_texture_id
					end
				},
				{
					texture_id = "icon_texture_id",
					style_id = "icon_texture_id",
					pass_type = "texture",
					content_check_function = function (content)
						return content.icon_texture_id
					end
				},
				{
					pass_type = "texture",
					style_id = "icon_frame_texture_id",
					texture_id = "icon_frame_texture_id",
					content_check_function = function (ui_content)
						return ui_content.icon_texture_id or ui_content.bg_overlay_texture_id
					end
				},
				{
					texture_id = "glow_animation",
					style_id = "glow_animation",
					pass_type = "texture"
				},
				{
					texture_id = "icon_texture_id",
					style_id = "background_texture_id",
					pass_type = "drag",
					content_check_function = function (content)
						return not content.button_hotspot.disable_interaction
					end
				},
				{
					pass_type = "texture",
					style_id = "hover_texture",
					texture_id = "hover_texture",
					content_check_function = function (content)
						return content.button_hotspot.is_hover and content.icon_texture_id and not content.is_dragging
					end
				},
				{
					pass_type = "texture",
					style_id = "drag_select_frame",
					texture_id = "drag_select_frame"
				}
			}
		},
		content = {
			tooltip_enabled = true,
			drag_select_frame = "item_slot_drag",
			tooltip_text_no_item = "forge_screen_merge_empy_slot_tooltip",
			hover_texture = "item_slot_hover",
			icon_frame_texture_id = "frame_01",
			tooltip_text = "forge_screen_merge_full_slot_tooltip",
			drag_texture_size = drag_texture_size,
			button_hotspot = {
				disable_interaction = disable_interaction
			},
			background_texture_id = background_texture,
			glow_animation = animation_glow_texture or "icons_placeholder"
		},
		style = {
			background_texture_id = {
				color = {
					255,
					255,
					255,
					255
				}
			},
			bg_overlay_texture_id = {
				color = {
					255,
					255,
					255,
					255
				}
			},
			icon_texture_id = {
				color = {
					255,
					255,
					255,
					255
				},
				scenegraph_id = icon_scenegraph_id
			},
			icon_frame_texture_id = {
				offset = {
					0,
					0,
					1
				},
				color = {
					255,
					255,
					255,
					255
				},
				scenegraph_id = icon_scenegraph_id
			},
			glow_animation = {
				color = {
					0,
					255,
					255,
					255
				},
				scenegraph_id = animation_scenegraph_id
			},
			hover_texture = {
				color = {
					0,
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
			drag_select_frame = {
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					-24.5,
					-24,
					3
				},
				size = {
					127,
					127
				}
			},
			tooltip_text = {
				font_size = 24,
				max_width = 500,
				localize = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				line_colors = {},
				offset = {
					0,
					0,
					250
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_input_description_widgets = function (scenegraph_definition, parent_scenegraph_id, amount)
	local input_description_widgets = {}

	for i = 1, amount, 1 do
		local scenegraph_root_id = "input_description_root_" .. i
		local scenegraph_id = "input_description_" .. i
		local scenegraph_icon_id = "input_description_icon_" .. i
		local scenegraph_text_id = "input_description_text_" .. i
		scenegraph_definition[scenegraph_root_id] = {
			vertical_alignment = "center",
			horizontal_alignment = "left",
			parent = parent_scenegraph_id,
			size = {
				1,
				1
			},
			postion = {
				0,
				0,
				1
			}
		}
		scenegraph_definition[scenegraph_id] = {
			vertical_alignment = "center",
			horizontal_alignment = "left",
			parent = scenegraph_root_id,
			size = {
				200,
				40
			},
			postion = {
				0,
				0,
				1
			}
		}
		scenegraph_definition[scenegraph_icon_id] = {
			vertical_alignment = "center",
			horizontal_alignment = "left",
			parent = scenegraph_id,
			size = {
				40,
				40
			},
			postion = {
				0,
				0,
				1
			}
		}
		scenegraph_definition[scenegraph_text_id] = {
			vertical_alignment = "center",
			horizontal_alignment = "left",
			parent = scenegraph_icon_id,
			size = {
				160,
				40
			},
			postion = {
				40,
				0,
				1
			}
		}
		local widget_definition = {
			element = {
				passes = {
					{
						style_id = "text",
						pass_type = "text",
						text_id = "text"
					},
					{
						pass_type = "texture",
						style_id = "icon",
						texture_id = "icon"
					}
				}
			},
			content = {
				text = "",
				icon = "xbone_button_icon_a"
			},
			style = {
				text = {
					font_size = 24,
					word_wrap = true,
					pixel_perfect = true,
					horizontal_alignment = "left",
					vertical_alignment = "center",
					dynamic_font = true,
					font_type = "hell_shark",
					text_color = Colors.get_color_table_with_alpha("white", 255),
					offset = {
						0,
						0,
						1
					},
					scenegraph_id = scenegraph_text_id
				},
				icon = {
					scenegraph_id = scenegraph_icon_id
				}
			},
			scenegraph_id = scenegraph_id
		}
		input_description_widgets[#input_description_widgets + 1] = UIWidget.init(widget_definition)
	end

	return input_description_widgets
end

UIWidgets.create_hero_button = function (hero, scenegraph_id, hero_scenegraph_id)
	local hero_texture_normal_id = "tabs_class_icon_" .. hero .. "_normal"
	local hero_texture_hover_id = "tabs_class_icon_" .. hero .. "_hover"
	local hero_texture_selected_id = "tabs_class_icon_" .. hero .. "_selected"
	local hero_text = nil

	if hero == "all_heroes" then
		hero_texture_normal_id, hero_texture_hover_id, hero_texture_selected_id = nil
		hero_text = "ALL"
	end

	return {
		element = {
			passes = {
				{
					style_id = "button_hotspot",
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					texture_id = "texture_id",
					style_id = "texture_id",
					pass_type = "texture",
					content_check_function = function (content)
						return not content.button_hotspot.is_hover and not content.button_hotspot.is_selected
					end
				},
				{
					texture_id = "texture_hover_id",
					style_id = "texture_hover_id",
					pass_type = "texture",
					content_check_function = function (content)
						return content.button_hotspot.is_hover and not content.button_hotspot.is_selected
					end
				},
				{
					texture_id = "texture_selected_id",
					style_id = "texture_selected_id",
					pass_type = "texture",
					content_check_function = function (content)
						return content.button_hotspot.is_selected
					end
				},
				{
					texture_id = "hero_texture_normal_id",
					style_id = "hero_texture_normal_id",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return content.hero_texture_normal_id and not button_hotspot.is_hover and not button_hotspot.is_selected
					end
				},
				{
					texture_id = "hero_texture_hover_id",
					style_id = "hero_texture_hover_id",
					pass_type = "texture",
					content_check_function = function (content)
						return content.hero_texture_hover_id and content.button_hotspot.is_hover
					end
				},
				{
					texture_id = "hero_texture_selected_id",
					style_id = "hero_texture_selected_id",
					pass_type = "texture",
					content_check_function = function (content)
						return content.hero_texture_selected_id and content.button_hotspot.is_selected
					end
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text",
					content_check_function = function (content)
						return content.text
					end
				}
			}
		},
		content = {
			texture_id = "tab_normal",
			texture_hover_id = "tab_hover",
			texture_selected_id = "tab_selected",
			button_hotspot = {},
			hero_texture_normal_id = hero_texture_normal_id,
			hero_texture_hover_id = hero_texture_hover_id,
			hero_texture_selected_id = hero_texture_selected_id,
			text = hero_text
		},
		style = {
			texture_id = {},
			texture_hover_id = {},
			texture_selected_id = {},
			hero_texture_normal_id = {
				scenegraph_id = hero_scenegraph_id
			},
			hero_texture_hover_id = {
				scenegraph_id = hero_scenegraph_id
			},
			hero_texture_selected_id = {
				scenegraph_id = hero_scenegraph_id
			},
			text = {
				font_size = 24,
				localize = true,
				word_wrap = true,
				pixel_perfect = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark",
				text_color = Colors.get_table("cheeseburger"),
				offset = {
					0,
					0,
					2
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_trait_button = function (text, scenegraph_id, text_scenegraph_id, icon_scenegraph_id, animation_scenegraph_id)
	return {
		element = {
			passes = {
				{
					style_id = "button_hotspot",
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					texture_id = "trait_owned_normal",
					style_id = "trait_owned_normal",
					pass_type = "texture",
					content_check_function = function (content)
						return content.owned and not content.button_hotspot.is_hover and not content.button_hotspot.is_selected
					end
				},
				{
					texture_id = "trait_owned_hover",
					style_id = "trait_owned_hover",
					pass_type = "texture",
					content_check_function = function (content)
						return content.owned and content.button_hotspot.is_hover and not content.button_hotspot.is_selected
					end
				},
				{
					texture_id = "trait_owned_selected",
					style_id = "trait_owned_selected",
					pass_type = "texture",
					content_check_function = function (content)
						return content.owned and content.button_hotspot.is_selected
					end
				},
				{
					texture_id = "trait_purchase_normal",
					style_id = "trait_purchase_normal",
					pass_type = "texture",
					content_check_function = function (content)
						return not content.button_hotspot.is_hover and not content.button_hotspot.is_selected and not content.owned and not content.locked
					end
				},
				{
					texture_id = "trait_purchase_hover",
					style_id = "trait_purchase_hover",
					pass_type = "texture",
					content_check_function = function (content)
						return content.button_hotspot.is_hover and not content.button_hotspot.is_selected and not content.owned and not content.locked
					end
				},
				{
					texture_id = "trait_purchase_selected",
					style_id = "trait_purchase_selected",
					pass_type = "texture",
					content_check_function = function (content)
						return content.button_hotspot.is_selected and not content.owned and not content.locked
					end
				},
				{
					texture_id = "trait_locked_normal",
					style_id = "trait_locked_normal",
					pass_type = "texture",
					content_check_function = function (content)
						return content.locked and not content.button_hotspot.is_hover and not content.button_hotspot.is_selected
					end
				},
				{
					texture_id = "trait_locked_hover",
					style_id = "trait_locked_hover",
					pass_type = "texture",
					content_check_function = function (content)
						return content.locked and content.button_hotspot.is_hover and not content.button_hotspot.is_selected
					end
				},
				{
					texture_id = "trait_locked_selected",
					style_id = "trait_locked_selected",
					pass_type = "texture",
					content_check_function = function (content)
						return content.locked and content.button_hotspot.is_selected
					end
				},
				{
					texture_id = "trait_icon",
					style_id = "trait_icon",
					pass_type = "texture"
				},
				{
					texture_id = "trait_unlock_animation",
					style_id = "trait_unlock_animation",
					pass_type = "texture"
				},
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "description_text",
					pass_type = "text",
					text_id = "description_text"
				}
			}
		},
		content = {
			trait_purchase_normal = "forge_item_box_rock_normal",
			trait_purchase_hover = "forge_item_box_rock_hover",
			trait_locked_normal = "forge_item_box_locked_normal",
			trait_icon = "icons_placeholder",
			trait_unlock_animation = "forge_item_box_glow_effect",
			trait_owned_normal = "forge_item_box_gold_normal",
			trait_locked_hover = "forge_item_box_locked_hover",
			trait_owned_hover = "forge_item_box_gold_hover",
			owned = false,
			trait_locked_selected = "forge_item_box_locked_selected",
			locked = false,
			description_text = "description",
			trait_owned_selected = "forge_item_box_gold_selected",
			trait_purchase_selected = "forge_item_box_rock_selected",
			button_hotspot = {},
			title_text = text
		},
		style = {
			trait_owned_selected = {},
			trait_owned_hover = {},
			trait_owned_normal = {},
			trait_purchase_selected = {},
			trait_purchase_hover = {},
			trait_purchase_normal = {},
			trait_locked_selected = {},
			trait_locked_hover = {},
			trait_locked_normal = {},
			trait_icon = {
				scenegraph_id = icon_scenegraph_id
			},
			title_text = {
				vertical_alignment = "center",
				dynamic_font = true,
				horizontal_alignment = "right",
				font_size = 32,
				pixel_perfect = true,
				font_type = "hell_shark",
				text_color = Colors.get_table("white"),
				scenegraph_id = text_scenegraph_id
			},
			description_text = {
				font_size = 16,
				pixel_perfect = true,
				horizontal_alignment = "right",
				vertical_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark",
				text_color = Colors.get_table("white"),
				scenegraph_id = text_scenegraph_id,
				offset = {
					0,
					-20,
					0
				}
			},
			trait_unlock_animation = {
				color = {
					0,
					255,
					255,
					255
				},
				scenegraph_id = animation_scenegraph_id
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_scoreboard_topic_widget = function (scenegraph_id)
	return {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					pass_type = "on_click",
					click_check_content_id = "button_hotspot",
					click_function = function (ui_scenegraph, ui_style, ui_content, input_service)
						ui_content.button_hotspot.is_selected = true
					end
				},
				{
					texture_id = "texture_hover_id",
					style_id = "background_hover",
					pass_type = "texture",
					content_check_function = function (content)
						return not content.disabled
					end
				},
				{
					texture_id = "texture_select_id",
					style_id = "background_select",
					pass_type = "texture",
					content_check_function = function (content)
						return not content.disabled
					end
				},
				{
					style_id = "background",
					pass_type = "texture_uv_dynamic_color_uvs_size_offset",
					content_id = "background",
					dynamic_function = function (content, style, size, dt)
						local fraction = content.fraction
						local direction = content.direction
						local color = style.color
						local uv_start_pixels = style.uv_start_pixels
						local uv_scale_pixels = style.uv_scale_pixels
						local uv_pixels = uv_start_pixels + uv_scale_pixels * fraction
						local uvs = style.uvs
						local uv_scale_axis = style.scale_axis

						if direction == 1 then
							uvs[1][uv_scale_axis] = 0
							uvs[2][uv_scale_axis] = uv_pixels / (uv_start_pixels + uv_scale_pixels)
							size[uv_scale_axis] = uv_pixels
							compact_topic_offset[uv_scale_axis] = 0
						else
							uvs[2][uv_scale_axis] = 1
							uvs[1][uv_scale_axis] = 1 - uv_pixels / (uv_start_pixels + uv_scale_pixels)
							size[uv_scale_axis] = uv_pixels
							compact_topic_offset[uv_scale_axis] = -(uv_pixels - (uv_start_pixels + uv_scale_pixels))
						end

						return style.color, uvs, size, compact_topic_offset
					end
				},
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "player_name",
					pass_type = "text",
					text_id = "player_name"
				},
				{
					style_id = "score_text",
					pass_type = "text",
					text_id = "score_text"
				}
			}
		},
		content = {
			score_text = "score_text",
			title_text = "title_text",
			player_name = "player_name",
			texture_hover_id = "scoreboard_topic_button_hover",
			texture_select_id = "scoreboard_topic_button_highlight",
			background = {
				texture_id = "scoreboard_topic_button_normal",
				direction = 1,
				fraction = 1
			},
			button_hotspot = {}
		},
		style = {
			background_hover = {
				scenegraph_id = "compact_preview_background_1",
				color = {
					0,
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
			background_select = {
				scenegraph_id = "compact_preview_background_1",
				size = {
					350,
					260
				},
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					-23,
					-23,
					-1
				}
			},
			background = {
				uv_start_pixels = 0,
				scenegraph_id = "compact_preview_background_1",
				uv_scale_pixels = 304,
				offset_scale = 1,
				scale_axis = 1,
				color = {
					255,
					255,
					255,
					255
				},
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
			score_text = {
				font_size = 56,
				word_wrap = true,
				pixel_perfect = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					5,
					5
				}
			},
			title_text = {
				font_size = 36,
				word_wrap = true,
				pixel_perfect = true,
				horizontal_alignment = "center",
				vertical_alignment = "top",
				dynamic_font = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
				offset = {
					0,
					-30,
					5
				}
			},
			player_name = {
				font_size = 24,
				word_wrap = true,
				pixel_perfect = true,
				horizontal_alignment = "center",
				vertical_alignment = "bottom",
				dynamic_font = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					50,
					5
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_splash_video = function (input, video_player_reference)
	return {
		element = {
			passes = {
				{
					style_id = "background",
					scenegraph_id = "background",
					pass_type = "rect",
					content_check_function = function (content)
						local w, h = Gui.resolution()
						local aspect_ratio = w / h
						local default_aspect_ratio = 1.7777777777777777
						local height = h
						local width = w

						if math.abs(aspect_ratio - default_aspect_ratio) > 0.005 then
							return true
						end
					end
				},
				{
					style_id = "video_style",
					pass_type = "splash_video",
					content_id = "video_content"
				}
			}
		},
		content = {
			video_content = {
				video_completed = false,
				video_player_reference = video_player_reference,
				material_name = input.material_name
			}
		},
		style = {
			background = {
				color = Colors.color_definitions.black
			},
			video_style = {}
		},
		scenegraph_id = input.scenegraph_id
	}
end

UIWidgets.create_video = function (scenegraph_id, material_name, video_player_reference)
	return {
		element = {
			passes = {
				{
					style_id = "video_style",
					pass_type = "video",
					content_id = "video_content"
				}
			}
		},
		content = {
			video_content = {
				video_completed = false,
				video_player_reference = video_player_reference,
				material_name = material_name
			}
		},
		style = {
			video_style = {
				color = {
					255,
					255,
					255,
					255
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_splash_texture = function (input)
	return {
		element = {
			passes = {
				{
					style_id = "foreground",
					scenegraph_id = "foreground",
					pass_type = "rect",
					content_check_function = function (content)
						return content.foreground.disable_foreground ~= true
					end
				},
				{
					style_id = "background",
					scenegraph_id = "background",
					pass_type = "rect",
					content_check_function = function (content)
						return content.foreground.disable_background ~= true
					end
				},
				{
					texture_id = "material_name",
					style_id = "texture_style",
					pass_type = "texture",
					content_id = "texture_content",
					scenegraph_id = input.scenegraph_id,
					content_check_function = function (content)
						return content.material_name
					end
				},
				{
					style_id = "texts_style",
					pass_type = "multiple_texts",
					texts_id = "texts",
					content_id = "texts_content",
					scenegraph_id = input.texts_scenegraph_id,
					content_check_function = function (content)
						return content.texts.texts ~= nil
					end
				}
			}
		},
		content = {
			texture_content = {
				material_name = input.material_name
			},
			texts = {
				texts = input.texts
			},
			foreground = {
				disable_foreground = input.disable_foreground
			}
		},
		style = {
			foreground = {
				color = Colors.color_definitions.black
			},
			background = {
				color = Colors.color_definitions.black
			},
			texture_style = {
				size = input.texture_size,
				offset = input.texture_offset or {
					0,
					0,
					0
				}
			},
			texts_style = {
				scenegraph_id = "texts",
				text_color = Colors.color_definitions.white,
				font_size = input.font_size,
				dynamic_font = input.dynamic_font,
				pixel_perfect = input.pixel_perfect,
				font_type = input.font_type,
				localize = input.localize,
				horizontal_alignment = input.text_horizontal_alignment,
				vertical_alignment = input.text_vertical_alignment,
				spacing = input.spacing,
				size = input.size,
				axis = input.axis,
				direction = input.direction,
				offset = input.offset
			}
		},
		scenegraph_id = input.scenegraph_id
	}
end

UIWidgets.create_loader_icon = function (scenegraph_id)
	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "loader_icon",
					texture_id = "loader_icon"
				},
				{
					pass_type = "rotated_texture",
					style_id = "loader_part_1",
					texture_id = "loader_part_1"
				},
				{
					pass_type = "rotated_texture",
					style_id = "loader_part_2",
					texture_id = "loader_part_2"
				}
			}
		},
		content = {
			loader_part_1 = "matchmaking_loading_icon_part_01",
			loader_part_2 = "matchmaking_loading_icon_part_02",
			loader_icon = "matchmaking_loading_icon_part_03"
		},
		style = {
			loader_icon = {
				offset = {
					10,
					10,
					3
				},
				size = {
					52,
					52
				}
			},
			loader_part_1 = {
				angle = 0,
				offset = {
					10,
					10,
					1
				},
				size = {
					52,
					52
				},
				pivot = {
					26,
					26
				}
			},
			loader_part_2 = {
				angle = 0,
				offset = {
					10,
					10,
					2
				},
				size = {
					52,
					52
				},
				pivot = {
					26,
					26
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_partner_splash_widget = function (input)
	return {
		element = {
			passes = {
				{
					style_id = "foreground",
					scenegraph_id = "foreground",
					pass_type = "rect",
					content_check_function = function (content)
						return content.foreground.disable_foreground ~= true
					end
				},
				{
					style_id = "background",
					scenegraph_id = "background",
					pass_type = "rect"
				},
				{
					style_id = "texts_style",
					pass_type = "multiple_texts",
					texts_id = "texts",
					content_id = "texts_content",
					scenegraph_id = input.texts_scenegraph_id,
					content_check_function = function (content)
						return content.texts.texts ~= nil
					end
				},
				{
					texture_id = "material_name_1",
					style_id = "texture_style_1",
					pass_type = "texture",
					content_id = "texture_content",
					scenegraph_id = input.scenegraph_id,
					content_check_function = function (content)
						return content.material_name_1
					end
				},
				{
					texture_id = "material_name_2",
					style_id = "texture_style_2",
					pass_type = "texture",
					content_id = "texture_content",
					scenegraph_id = input.scenegraph_id,
					content_check_function = function (content)
						return content.material_name_2
					end
				},
				{
					texture_id = "material_name_3",
					style_id = "texture_style_3",
					pass_type = "texture",
					content_id = "texture_content",
					scenegraph_id = input.scenegraph_id,
					content_check_function = function (content)
						return content.material_name_3
					end
				},
				{
					texture_id = "material_name_4",
					style_id = "texture_style_4",
					pass_type = "texture",
					content_id = "texture_content",
					scenegraph_id = input.scenegraph_id,
					content_check_function = function (content)
						return content.material_name_4
					end
				},
				{
					texture_id = "material_name_5",
					style_id = "texture_style_5",
					pass_type = "texture",
					content_id = "texture_content",
					scenegraph_id = input.scenegraph_id,
					content_check_function = function (content)
						return content.material_name_5
					end
				},
				{
					texture_id = "material_name_6",
					style_id = "texture_style_6",
					pass_type = "texture",
					content_id = "texture_content",
					scenegraph_id = input.scenegraph_id,
					content_check_function = function (content)
						return content.material_name_6
					end
				},
				{
					texture_id = "material_name_7",
					style_id = "texture_style_7",
					pass_type = "texture",
					content_id = "texture_content",
					scenegraph_id = input.scenegraph_id,
					content_check_function = function (content)
						return content.material_name_7
					end
				},
				{
					texture_id = "material_name_8",
					style_id = "texture_style_8",
					pass_type = "texture",
					content_id = "texture_content",
					scenegraph_id = input.scenegraph_id,
					content_check_function = function (content)
						return content.material_name_8
					end
				}
			}
		},
		content = {
			texture_content = {
				material_name_1 = input.texture_materials[1],
				material_name_2 = input.texture_materials[2],
				material_name_3 = input.texture_materials[3],
				material_name_4 = input.texture_materials[4],
				material_name_5 = input.texture_materials[5],
				material_name_6 = input.texture_materials[6],
				material_name_7 = input.texture_materials[7],
				material_name_8 = input.texture_materials[8]
			},
			texts = {
				texts = input.texts
			},
			foreground = {
				disable_foreground = input.disable_foreground
			}
		},
		style = {
			foreground = {
				color = Colors.color_definitions.black
			},
			background = {
				color = Colors.color_definitions.black
			},
			texture_style_1 = {
				scenegraph_id = input.texture_scenegraph_ids[1]
			},
			texture_style_2 = {
				scenegraph_id = input.texture_scenegraph_ids[2]
			},
			texture_style_3 = {
				scenegraph_id = input.texture_scenegraph_ids[3]
			},
			texture_style_4 = {
				scenegraph_id = input.texture_scenegraph_ids[4]
			},
			texture_style_5 = {
				scenegraph_id = input.texture_scenegraph_ids[5]
			},
			texture_style_6 = {
				scenegraph_id = input.texture_scenegraph_ids[6]
			},
			texture_style_7 = {
				scenegraph_id = input.texture_scenegraph_ids[7]
			},
			texture_style_8 = {
				scenegraph_id = input.texture_scenegraph_ids[8]
			},
			texts_style = {
				scenegraph_id = "texts",
				text_color = Colors.color_definitions.white,
				font_size = input.font_size,
				dynamic_font = input.dynamic_font,
				pixel_perfect = input.pixel_perfect,
				font_type = input.font_type,
				localize = input.localize,
				horizontal_alignment = input.text_horizontal_alignment,
				vertical_alignment = input.text_vertical_alignment,
				spacing = input.spacing,
				size = input.size,
				axis = input.axis,
				direction = input.direction,
				offset = input.offset
			}
		},
		scenegraph_id = input.scenegraph_id
	}
end

UIWidgets.create_map_player_entry = function (scenegraph_id, gamepad_selection_scenegraph_id)
	return {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text"
				},
				{
					style_id = "hero_icon",
					pass_type = "hotspot",
					content_id = "hero_icon_hotspot"
				},
				{
					pass_type = "texture",
					style_id = "host_icon",
					texture_id = "host_icon_texture",
					content_check_function = function (content)
						return content.is_host
					end
				},
				{
					pass_type = "texture",
					style_id = "hero_icon",
					texture_id = "hero_icon_texture"
				},
				{
					style_id = "hero_icon_tooltip_text",
					pass_type = "tooltip_text",
					text_id = "hero_icon_tooltip_text",
					content_check_function = function (content)
						return content.hero_icon_hotspot.is_hover
					end
				},
				{
					style_id = "kick_button_texture",
					pass_type = "hotspot",
					content_id = "kick_button_hotspot"
				},
				{
					pass_type = "texture",
					style_id = "kick_button_texture",
					texture_id = "kick_button_texture",
					content_check_function = function (content)
						return not content.is_host and (content.always_show_icons or (content.kick_enabled and content.button_hotspot.is_hover and not content.kick_button_hotspot.is_hover))
					end
				},
				{
					pass_type = "texture",
					style_id = "kick_button_texture_hover",
					texture_id = "kick_button_texture",
					content_check_function = function (content)
						return content.kick_enabled and content.button_hotspot.is_hover and content.kick_button_hotspot.is_hover
					end
				},
				{
					style_id = "kick_button_tooltip_text",
					pass_type = "tooltip_text",
					text_id = "kick_button_tooltip_text",
					content_check_function = function (content)
						return content.kick_enabled and content.kick_button_hotspot.is_hover
					end
				},
				{
					pass_type = "texture",
					style_id = "hover_texture",
					texture_id = "hover_texture",
					content_check_function = function (content)
						if not content.on_console then
							return content.button_hotspot.is_selected or content.button_hotspot.is_hover
						end
					end
				},
				{
					pass_type = "texture",
					style_id = "console_hover_texture",
					texture_id = "console_hover_texture",
					content_check_function = function (content)
						if content.on_console then
							return content.button_hotspot.is_selected or content.button_hotspot.is_hover
						end
					end
				}
			}
		},
		content = {
			kick_button_tooltip_text = "map_setting_kick_player",
			always_show_icons = false,
			on_console = false,
			hero_icon_tooltip_text = "hero_icon",
			kick_enabled = false,
			is_host = false,
			hero_icon_texture = "tabs_class_icon_dwarf_ranger_normal",
			hover_texture = "map_setting_bg_fade",
			text = "n/a",
			console_hover_texture = "party_selection_glow",
			host_icon_texture = "host_icon",
			kick_button_texture = "kick_player_icon",
			button_hotspot = {},
			hero_icon_hotspot = {},
			kick_button_hotspot = {}
		},
		style = {
			gamepad_selection = (gamepad_selection_scenegraph_id and {
				texture_size = {
					30,
					30
				},
				scenegraph_id = gamepad_selection_scenegraph_id
			}) or nil,
			text = {
				vertical_alignment = "center",
				font_size = 24,
				localize = false,
				horizontal_alignment = "left",
				word_wrap = true,
				font_type = "hell_shark",
				text_color = Colors.get_table("white"),
				offset = {
					40,
					0,
					2
				}
			},
			hero_icon = {
				size = {
					34,
					34
				},
				offset = {
					0,
					3,
					0
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			host_icon = {
				size = {
					18,
					14
				},
				offset = {
					343,
					13,
					0
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			hero_icon_tooltip_text = {
				font_size = 24,
				max_width = 500,
				localize = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				line_colors = {},
				size = {
					34,
					34
				},
				offset = {
					0,
					3,
					4
				}
			},
			console_hover_texture = {
				size = {
					446,
					37
				},
				offset = {
					-1,
					1,
					-1
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			hover_texture = {
				size = {
					308,
					28
				},
				offset = {
					26,
					6,
					-1
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			kick_button_texture = {
				size = {
					34,
					34
				},
				offset = {
					336,
					6,
					1
				},
				color = {
					180,
					255,
					255,
					255
				}
			},
			kick_button_texture_hover = {
				size = {
					34,
					34
				},
				offset = {
					336,
					6,
					1
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			kick_button_tooltip_text = {
				font_size = 24,
				max_width = 500,
				localize = true,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				line_colors = {},
				size = {
					26,
					26
				},
				offset = {
					344,
					0,
					4
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_map_settings_stepper = function (scenegraph_id, gamepad_selection_scenegraph_id)
	return {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					pass_type = "texture",
					style_id = "hover_texture",
					texture_id = "hover_texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return (not button_hotspot.gamepad_active and button_hotspot.is_selected) or button_hotspot.is_hover
					end
				},
				{
					style_id = "left_button_texture",
					pass_type = "hotspot",
					content_id = "left_button_hotspot"
				},
				{
					style_id = "right_button_texture",
					pass_type = "hotspot",
					content_id = "right_button_hotspot"
				},
				{
					style_id = "setting_text",
					pass_type = "text",
					text_id = "setting_text"
				},
				{
					pass_type = "texture",
					style_id = "left_button_texture",
					texture_id = "left_button_texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						if button_hotspot.gamepad_active then
							return button_hotspot.is_selected
						else
							return true
						end
					end
				},
				{
					pass_type = "rotated_texture",
					style_id = "right_button_texture",
					texture_id = "right_button_texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						if button_hotspot.gamepad_active then
							return button_hotspot.is_selected
						else
							return true
						end
					end
				},
				{
					pass_type = "texture",
					style_id = "left_button_texture_clicked",
					texture_id = "left_button_texture_clicked",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						if button_hotspot.gamepad_active then
							return button_hotspot.is_selected
						else
							return true
						end
					end
				},
				{
					pass_type = "rotated_texture",
					style_id = "right_button_texture_clicked",
					texture_id = "right_button_texture_clicked",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						if button_hotspot.gamepad_active then
							return button_hotspot.is_selected
						else
							return true
						end
					end
				}
			}
		},
		content = {
			left_button_texture = "settings_arrow_normal",
			hover_texture = "map_setting_bg_fade",
			setting_text = "test_text",
			right_button_texture_clicked = "settings_arrow_clicked",
			right_button_texture = "settings_arrow_normal",
			left_button_texture_clicked = "settings_arrow_clicked",
			button_hotspot = {},
			left_button_hotspot = {},
			right_button_hotspot = {}
		},
		style = {
			gamepad_selection = (gamepad_selection_scenegraph_id and {
				texture_size = {
					40,
					40
				},
				scenegraph_id = gamepad_selection_scenegraph_id
			}) or nil,
			hover_texture = {
				size = {
					410,
					50
				},
				offset = {
					-55,
					-8,
					0
				}
			},
			left_button_texture = {
				size = {
					28,
					34
				},
				offset = {
					-40,
					-3,
					1
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			right_button_texture = {
				angle = 3.1415926499999998,
				pivot = {
					14,
					17
				},
				size = {
					28,
					34
				},
				offset = {
					315,
					-3,
					1
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			left_button_texture_clicked = {
				color = {
					0,
					255,
					255,
					255
				},
				size = {
					28,
					34
				},
				offset = {
					-40,
					-3,
					1
				}
			},
			right_button_texture_clicked = {
				angle = 3.1415926499999998,
				color = {
					0,
					255,
					255,
					255
				},
				pivot = {
					14,
					17
				},
				size = {
					28,
					34
				},
				offset = {
					315,
					-3,
					1
				}
			},
			setting_text = {
				font_size = 28,
				word_wrap = true,
				pixel_perfect = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					4
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_default_stepper = function (scenegraph_id, size)
	return {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					style_id = "setting_text",
					pass_type = "text",
					text_id = "setting_text"
				},
				{
					style_id = "left_arrow",
					pass_type = "hotspot",
					content_id = "left_hotspot"
				},
				{
					style_id = "right_arrow",
					pass_type = "hotspot",
					content_id = "right_hotspot"
				},
				{
					texture_id = "texture_id",
					style_id = "left_arrow",
					pass_type = "texture",
					content_id = "arrow"
				},
				{
					texture_id = "texture_id",
					style_id = "right_arrow",
					pass_type = "texture_uv",
					content_id = "arrow"
				},
				{
					texture_id = "texture_id",
					style_id = "left_arrow_hover",
					pass_type = "texture",
					content_id = "arrow_hover"
				},
				{
					texture_id = "texture_id",
					style_id = "right_arrow_hover",
					pass_type = "texture_uv",
					content_id = "arrow_hover"
				}
			}
		},
		content = {
			hover_texture = "map_setting_bg_fade",
			setting_text = "",
			arrow = {
				texture_id = "settings_arrow_normal",
				uvs = {
					{
						1,
						0
					},
					{
						0,
						1
					}
				}
			},
			arrow_hover = {
				texture_id = "settings_arrow_clicked",
				uvs = {
					{
						1,
						0
					},
					{
						0,
						1
					}
				}
			},
			button_hotspot = {},
			left_hotspot = {},
			right_hotspot = {}
		},
		style = {
			field = {
				size = {
					size[1] - 70,
					size[2]
				},
				offset = {
					35,
					0,
					0
				},
				color = {
					255,
					5,
					5,
					5
				}
			},
			field_top = {
				size = {
					size[1] - 70 - 2,
					size[2] - 2
				},
				offset = {
					37,
					0,
					0
				},
				color = {
					255,
					15,
					15,
					15
				}
			},
			left_arrow = {
				size = {
					19,
					27
				},
				default_size = {
					19,
					27
				},
				offset = {
					0,
					size[2] / 2 - 13.5,
					2
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			left_arrow_hover = {
				size = {
					30,
					35
				},
				offset = {
					6,
					size[2] / 2 - 17.5,
					1
				},
				color = {
					0,
					255,
					255,
					255
				}
			},
			right_arrow = {
				size = {
					19,
					27
				},
				default_size = {
					19,
					27
				},
				offset = {
					size[1] - 19,
					size[2] / 2 - 13.5,
					2
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			right_arrow_hover = {
				size = {
					30,
					35
				},
				offset = {
					size[1] - 36,
					size[2] / 2 - 17.5,
					1
				},
				color = {
					0,
					255,
					255,
					255
				}
			},
			setting_text = {
				vertical_alignment = "center",
				upper_case = true,
				localize = false,
				horizontal_alignment = "center",
				font_size = 28,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
				offset = {
					0,
					0,
					2
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_checkbox_widget = function (text, tooltip_text, scenegraph_id, checkbox_offset, optional_text_offset, optional_tooltip_text_disabled)
	local frame_settings = UIFrameSettings.menu_frame_06

	return {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					style_id = "tooltip_text",
					pass_type = "tooltip_text",
					text_id = "tooltip_text",
					content_check_function = function (ui_content)
						return ui_content.button_hotspot.is_hover and ui_content.tooltip_text ~= "" and not ui_content.is_disabled
					end
				},
				{
					style_id = "tooltip_text",
					pass_type = "tooltip_text",
					text_id = "tooltip_text_disabled",
					content_check_function = function (ui_content)
						return ui_content.button_hotspot.is_hover and ui_content.tooltip_text_disabled ~= "" and ui_content.is_disabled
					end
				},
				{
					style_id = "setting_text",
					pass_type = "text",
					text_id = "setting_text",
					content_check_function = function (content)
						return not content.button_hotspot.is_hover and not content.is_disabled
					end
				},
				{
					style_id = "setting_text_disabled",
					pass_type = "text",
					text_id = "setting_text",
					content_check_function = function (content)
						return content.is_disabled
					end
				},
				{
					style_id = "setting_text_hover",
					pass_type = "text",
					text_id = "setting_text",
					content_check_function = function (content)
						return content.button_hotspot.is_hover and not content.is_disabled
					end
				},
				{
					pass_type = "texture",
					style_id = "checkbox_marker",
					texture_id = "checkbox_marker",
					content_check_function = function (content)
						return content.checked and not content.is_disabled
					end
				},
				{
					pass_type = "texture",
					style_id = "checkbox_marker_disabled",
					texture_id = "checkbox_marker",
					content_check_function = function (content)
						return content.checked and content.is_disabled
					end
				},
				{
					pass_type = "rect",
					style_id = "checkbox_background"
				},
				{
					pass_type = "texture_frame",
					style_id = "checkbox_frame",
					texture_id = "checkbox_frame",
					content_check_function = function (content)
						return not content.is_disabled
					end
				},
				{
					pass_type = "texture_frame",
					style_id = "checkbox_frame_disabled",
					texture_id = "checkbox_frame",
					content_check_function = function (content)
						return content.is_disabled
					end
				}
			}
		},
		content = {
			checked = false,
			checkbox_marker = "matchmaking_checkbox",
			button_hotspot = {},
			tooltip_text = tooltip_text,
			setting_text = text,
			tooltip_text_disabled = optional_tooltip_text_disabled or "",
			checkbox_frame = frame_settings.texture
		},
		style = {
			checkbox_style = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				offset = {
					checkbox_offset,
					0,
					1
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			checkbox_style_disabled = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				offset = {
					checkbox_offset,
					0,
					1
				},
				color = {
					96,
					255,
					255,
					255
				}
			},
			checkbox_background = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				texture_size = {
					40,
					40
				},
				offset = {
					checkbox_offset,
					0,
					0
				},
				color = {
					255,
					0,
					0,
					0
				}
			},
			checkbox_frame = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				area_size = {
					40,
					40
				},
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				offset = {
					checkbox_offset,
					0,
					1
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			checkbox_frame_disabled = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				area_size = {
					40,
					40
				},
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes,
				offset = {
					checkbox_offset,
					0,
					1
				},
				color = {
					96,
					255,
					255,
					255
				}
			},
			checkbox_marker = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				texture_size = {
					37,
					31
				},
				offset = {
					checkbox_offset + 4,
					6,
					1
				},
				color = Colors.get_color_table_with_alpha("font_title", 255)
			},
			checkbox_marker_disabled = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				texture_size = {
					37,
					31
				},
				offset = {
					checkbox_offset + 4,
					6,
					1
				},
				color = Colors.get_color_table_with_alpha("white", 96)
			},
			setting_text = {
				vertical_alignment = "center",
				upper_case = true,
				localize = true,
				horizontal_alignment = "right",
				font_size = 24,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = optional_text_offset or {
					-50,
					0,
					4
				}
			},
			setting_text_disabled = {
				vertical_alignment = "center",
				upper_case = true,
				localize = true,
				horizontal_alignment = "right",
				font_size = 24,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 96),
				offset = optional_text_offset or {
					-50,
					0,
					4
				}
			},
			setting_text_hover = {
				vertical_alignment = "center",
				upper_case = true,
				localize = true,
				horizontal_alignment = "right",
				font_size = 24,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = optional_text_offset or {
					-50,
					0,
					4
				}
			},
			tooltip_text = {
				font_size = 24,
				max_width = 500,
				localize = true,
				cursor_side = "left",
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				line_colors = {},
				offset = {
					0,
					0,
					50
				},
				cursor_offset = {
					-10,
					-27
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_story_level_map_widget = function (scenegraph_id, level_key, debug_level)
	local show_debug_levels = UISettings.map.show_debug_levels
	local level_data_list = {}
	local debug_level_counter = 0
	local widget_template = {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					pass_type = "on_click",
					click_check_content_id = "button_hotspot",
					click_function = function (ui_scenegraph, ui_style, ui_content, input_service)
						ui_content.button_hotspot.is_selected = true
					end
				},
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background"
				},
				{
					pass_type = "texture",
					style_id = "selected",
					texture_id = "selected"
				},
				{
					pass_type = "texture",
					style_id = "hover",
					texture_id = "hover"
				},
				{
					pass_type = "tiled_texture",
					style_id = "text_background_center",
					texture_id = "text_background_center"
				},
				{
					pass_type = "texture",
					style_id = "text_background_left",
					texture_id = "text_background_left"
				},
				{
					pass_type = "texture",
					style_id = "text_background_right",
					texture_id = "text_background_right"
				},
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					pass_type = "texture",
					style_id = "difficulty_icon_1",
					texture_id = "difficulty_icon_1"
				},
				{
					pass_type = "texture",
					style_id = "difficulty_icon_2",
					texture_id = "difficulty_icon_2"
				},
				{
					pass_type = "texture",
					style_id = "difficulty_icon_3",
					texture_id = "difficulty_icon_3"
				},
				{
					pass_type = "texture",
					style_id = "difficulty_icon_4",
					texture_id = "difficulty_icon_4"
				},
				{
					pass_type = "texture",
					style_id = "difficulty_icon_5",
					texture_id = "difficulty_icon_5"
				},
				{
					pass_type = "texture",
					style_id = "new_flag",
					texture_id = "new_flag"
				}
			}
		},
		content = {
			text_background_center = "level_title_banner_middle",
			hover = "level_location_long_icon_hover",
			text_background_right = "level_title_banner_right",
			selected = "level_location_long_icon_selected",
			unlocked = "menu_map_level_unlocked_icon",
			difficulty_icon_3 = "difficulty_icon_small_02",
			difficulty_icon_2 = "difficulty_icon_small_02",
			difficulty_icon_4 = "difficulty_icon_small_02",
			difficulty_icon_1 = "difficulty_icon_small_02",
			background = "level_location_icon_01",
			difficulty_icon_5 = "difficulty_icon_small_02",
			new_flag = "list_item_tag_new",
			text_background_left = "level_title_banner_left",
			button_hotspot = {},
			title_text = level_key
		},
		style = {
			new_flag = {
				size = {
					126,
					51
				},
				offset = {
					-21,
					-25,
					10
				},
				color = {
					0,
					255,
					255,
					255
				}
			},
			difficulty_icon_1 = {
				size = {
					15,
					21
				},
				offset = {
					-5,
					54,
					4
				}
			},
			difficulty_icon_2 = {
				size = {
					15,
					21
				},
				offset = {
					10,
					66,
					4
				}
			},
			difficulty_icon_3 = {
				size = {
					15,
					21
				},
				offset = {
					29,
					69,
					4
				}
			},
			difficulty_icon_4 = {
				size = {
					15,
					21
				},
				offset = {
					48,
					66,
					4
				}
			},
			difficulty_icon_5 = {
				size = {
					15,
					21
				},
				offset = {
					63,
					54,
					4
				}
			},
			background = {
				color = {
					255,
					255,
					255,
					255
				}
			},
			selected = {
				color = {
					0,
					255,
					255,
					255
				}
			},
			hover = {
				color = {
					0,
					255,
					255,
					255
				}
			},
			unlocked = {
				color = {
					255,
					255,
					255,
					255
				}
			},
			text_background_left = {},
			text_background_right = {},
			text_background_center = {
				offset = {
					0,
					0,
					0
				},
				texture_tiling_size = {
					26,
					35
				}
			},
			title_text = {
				localize = false,
				font_size = 28,
				pixel_perfect = true,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				dynamic_font = true,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					0,
					0,
					1
				}
			},
			title_text_highlight = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				localize = false,
				font_size = 28,
				font_type = "hell_shark",
				text_color = Colors.get_color_table_with_alpha("yellow", 255),
				offset = {
					0,
					-35,
					5
				}
			}
		},
		scenegraph_id = scenegraph_id
	}

	return {
		game_type = "long",
		level_key = level_key,
		widget = UIWidget.init(widget_template)
	}
end

UIWidgets.create_text_button = function (scenegraph_id, text, font_size, optional_offset, optional_horizontal_alignment, optional_default_color_name)
	return {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_text"
				},
				{
					style_id = "text_hover",
					pass_type = "text",
					text_id = "text_field",
					content_check_function = function (content)
						return not content.button_text.disable_button and (content.button_text.is_hover or content.button_text.is_selected)
					end
				},
				{
					style_id = "text",
					pass_type = "text",
					text_id = "text_field",
					content_check_function = function (content)
						return not content.button_text.disable_button and not content.button_text.is_hover and not content.button_text.is_selected
					end
				},
				{
					style_id = "text_disabled",
					pass_type = "text",
					text_id = "text_field",
					content_check_function = function (content)
						return content.button_text.disable_button
					end
				}
			}
		},
		content = {
			button_text = {},
			text_field = text,
			default_font_size = font_size
		},
		style = {
			text = {
				word_wrap = false,
				upper_case = true,
				localize = true,
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = font_size,
				horizontal_alignment = optional_horizontal_alignment or "left",
				text_color = Colors.get_color_table_with_alpha(optional_default_color_name or "font_button_normal", 255),
				offset = optional_offset or {
					0,
					0,
					4
				}
			},
			text_hover = {
				word_wrap = false,
				upper_case = true,
				localize = true,
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = font_size,
				horizontal_alignment = optional_horizontal_alignment or "left",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = optional_offset or {
					0,
					0,
					4
				}
			},
			text_disabled = {
				word_wrap = false,
				upper_case = true,
				localize = true,
				vertical_alignment = "center",
				font_type = "hell_shark",
				font_size = font_size,
				horizontal_alignment = optional_horizontal_alignment or "left",
				text_color = Colors.get_color_table_with_alpha("gray", 50),
				offset = optional_offset or {
					0,
					0,
					4
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_console_panel_button = function (scenegraph_id, size, text, font_size, optional_offset, optional_horizontal_alignment)
	local new_marker_offset = {
		-19,
		-25,
		10
	}
	local marker_offset = {
		0,
		0,
		1
	}
	local selection_offset = {
		0,
		-4,
		0
	}
	local shadow_offset = {
		2,
		3,
		3
	}

	if optional_offset then
		shadow_offset[1] = shadow_offset[1] + optional_offset[1]
		shadow_offset[2] = shadow_offset[2] + optional_offset[2]
		shadow_offset[3] = optional_offset[3] - 1
		selection_offset[1] = selection_offset[1] + optional_offset[1]
		selection_offset[2] = selection_offset[2] + optional_offset[2]
		selection_offset[3] = optional_offset[3] - 3
		marker_offset[1] = marker_offset[1] + optional_offset[1]
		marker_offset[2] = marker_offset[2] + optional_offset[2]
		marker_offset[3] = optional_offset[3] - 2
		new_marker_offset[1] = new_marker_offset[1] + optional_offset[1]
		new_marker_offset[2] = new_marker_offset[2] + optional_offset[2]
		new_marker_offset[3] = optional_offset[3] - 2
	end

	return {
		element = {
			passes = {
				{
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
					texture_id = "selected_texture",
					style_id = "selected_texture",
					pass_type = "texture",
					content_check_function = function (content)
						return not content.button_hotspot.disable_button
					end
				},
				{
					texture_id = "marker",
					style_id = "marker_left",
					pass_type = "texture"
				},
				{
					texture_id = "marker",
					style_id = "marker_right",
					pass_type = "texture"
				},
				{
					texture_id = "new_marker",
					style_id = "new_marker",
					pass_type = "texture",
					content_check_function = function (content)
						return content.new
					end
				}
			}
		},
		content = {
			marker = "frame_detail_04",
			new_marker = "list_item_tag_new",
			selected_texture = "hero_panel_selection_glow",
			button_hotspot = {},
			text_field = text,
			default_font_size = font_size
		},
		style = {
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
				default_offset = optional_offset or {
					0,
					10,
					4
				},
				offset = optional_offset or {
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
				default_offset = optional_offset or {
					0,
					10,
					4
				},
				offset = optional_offset or {
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
				default_offset = optional_offset or {
					0,
					10,
					4
				},
				offset = optional_offset or {
					0,
					5,
					4
				},
				size = size
			},
			selected_texture = {
				vertical_alignment = "top",
				horizontal_alignment = "center",
				texture_size = {
					169,
					35
				},
				color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = selection_offset
			},
			marker_left = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				texture_size = {
					55,
					28
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					marker_offset[1] - 27.5,
					marker_offset[2],
					marker_offset[3]
				}
			},
			marker_right = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				texture_size = {
					55,
					28
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					marker_offset[1] + 27.5,
					marker_offset[2],
					marker_offset[3]
				}
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

UIWidgets.create_compare_menu_trait_widget = function (scenegraph_id, description_scenegraph_id, masked, use_divider)
	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "texture_bg_id",
					texture_id = "texture_bg_id",
					content_check_function = function (content)
						return content.use_background
					end
				},
				{
					pass_type = "texture",
					style_id = "texture_id",
					texture_id = "texture_id",
					content_check_function = function (content)
						return content.texture_id
					end
				},
				{
					pass_type = "texture",
					style_id = "texture_lock_id",
					texture_id = "texture_lock_id",
					content_check_function = function (content)
						return content.locked and not content.disabled
					end
				},
				{
					pass_type = "texture",
					style_id = "texture_glow_id",
					texture_id = "texture_glow_id",
					content_check_function = function (content)
						return content.use_glow
					end
				},
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text"
				},
				{
					style_id = "description_text",
					pass_type = "text",
					text_id = "description_text"
				},
				{
					pass_type = "texture",
					style_id = "text_divider_texture",
					texture_id = "text_divider_texture",
					content_check_function = function (content)
						return content.use_divider
					end
				}
			}
		},
		content = {
			use_glow = true,
			locked = false,
			texture_lock_id = "trait_icon_selected_frame_locked",
			texture_glow_id = "item_slot_glow_03",
			title_text = "test_title_text",
			use_background = true,
			texture_bg_id = "trait_slot",
			texture_id = "trait_icon_empty",
			disabled = false,
			description_text = "test_description_text",
			text_divider_texture = "summary_screen_line_breaker",
			use_divider = use_divider
		},
		style = {
			text_divider_texture = {
				masked = masked,
				size = {
					386,
					22
				},
				offset = {
					40,
					60,
					0
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			title_text = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				localize = false,
				font_size = 20,
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
				offset = {
					55,
					0,
					1
				}
			},
			description_text = {
				word_wrap = true,
				localize = false,
				font_size = 18,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = (masked and "hell_shark_masked") or "hell_shark",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					0
				},
				scenegraph_id = description_scenegraph_id
			},
			texture_bg_id = {
				masked = masked,
				size = {
					54,
					58
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-7,
					-10,
					-1
				}
			},
			texture_id = {
				masked = masked,
				color = {
					255,
					255,
					255,
					255
				}
			},
			texture_lock_id = {
				masked = masked,
				offset = {
					0,
					0,
					3
				},
				color = {
					255,
					255,
					255,
					255
				}
			},
			texture_glow_id = {
				masked = masked,
				size = {
					104,
					104
				},
				offset = {
					-32,
					-32,
					4
				},
				color = {
					0,
					255,
					255,
					255
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_corner_frame_animation_widget = function (scenegraph_id, scenegraph_id_top_left, scenegraph_id_top_right, scenegraph_id_bottom_left, scenegraph_id_bottom_right)
	local texture_color = {
		0,
		255,
		255,
		255
	}
	local glow_skull_color = {
		0,
		255,
		255,
		255
	}
	local glow_corner_color = {
		0,
		255,
		255,
		255
	}

	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "top_left_texture_id",
					global_color_id = "texture_color",
					texture_id = "top_left_texture_id"
				},
				{
					pass_type = "texture",
					style_id = "top_right_texture_id",
					global_color_id = "texture_color",
					texture_id = "top_right_texture_id"
				},
				{
					pass_type = "texture",
					style_id = "bottom_left_texture_id",
					global_color_id = "texture_color",
					texture_id = "bottom_left_texture_id"
				},
				{
					pass_type = "texture",
					style_id = "bottom_right_texture_id",
					global_color_id = "texture_color",
					texture_id = "bottom_right_texture_id"
				},
				{
					pass_type = "texture",
					style_id = "top_left_skull_glow",
					texture_id = "skull_eye_glow_texture",
					global_color_id = "glow_skull_color",
					content_check_function = function (content)
						return content.draw_skull_glow
					end
				},
				{
					pass_type = "texture",
					style_id = "top_right_skull_glow",
					texture_id = "skull_eye_glow_texture",
					global_color_id = "glow_skull_color",
					content_check_function = function (content)
						return content.draw_skull_glow
					end
				},
				{
					pass_type = "texture",
					style_id = "bottom_left_skull_glow",
					texture_id = "skull_eye_glow_texture",
					global_color_id = "glow_skull_color",
					content_check_function = function (content)
						return content.draw_skull_glow
					end
				},
				{
					pass_type = "texture",
					style_id = "bottom_right_skull_glow",
					texture_id = "skull_eye_glow_texture",
					global_color_id = "glow_skull_color",
					content_check_function = function (content)
						return content.draw_skull_glow
					end
				},
				{
					style_id = "top_left_corner_glow",
					pass_type = "texture_uv",
					global_color_id = "glow_corner_color",
					content_id = "top_left_corner_glow",
					content_check_function = function (content)
						return content.draw_corner_glow
					end
				},
				{
					style_id = "top_right_corner_glow",
					pass_type = "texture_uv",
					global_color_id = "glow_corner_color",
					content_id = "top_right_corner_glow",
					content_check_function = function (content)
						return content.draw_corner_glow
					end
				},
				{
					style_id = "bottom_left_corner_glow",
					pass_type = "texture_uv",
					global_color_id = "glow_corner_color",
					content_id = "bottom_left_corner_glow",
					content_check_function = function (content)
						return content.draw_corner_glow
					end
				},
				{
					style_id = "bottom_right_corner_glow",
					pass_type = "texture_uv",
					global_color_id = "glow_corner_color",
					content_id = "bottom_right_corner_glow",
					content_check_function = function (content)
						return content.draw_corner_glow
					end
				}
			}
		},
		content = {
			skull_eye_glow_texture = "reroll_glow_skull",
			top_right_texture_id = "corner_detail_03",
			draw_skull_glow = true,
			top_left_texture_id = "corner_detail_01",
			bottom_right_texture_id = "corner_detail_04",
			bottom_left_texture_id = "corner_detail_02",
			top_left_corner_glow = {
				texture_id = "reroll_glow_corner",
				draw_corner_glow = true,
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
			top_right_corner_glow = {
				texture_id = "reroll_glow_corner",
				draw_corner_glow = true,
				uvs = {
					{
						1,
						0
					},
					{
						0,
						1
					}
				}
			},
			bottom_left_corner_glow = {
				texture_id = "reroll_glow_corner",
				draw_corner_glow = true,
				uvs = {
					{
						0,
						1
					},
					{
						1,
						0
					}
				}
			},
			bottom_right_corner_glow = {
				texture_id = "reroll_glow_corner",
				draw_corner_glow = true,
				uvs = {
					{
						1,
						1
					},
					{
						0,
						0
					}
				}
			}
		},
		style = {
			top_left_texture_id = {
				offset = {
					0,
					0,
					0
				},
				scenegraph_id = scenegraph_id_top_left
			},
			top_right_texture_id = {
				offset = {
					0,
					0,
					0
				},
				scenegraph_id = scenegraph_id_top_right
			},
			bottom_left_texture_id = {
				offset = {
					0,
					0,
					0
				},
				scenegraph_id = scenegraph_id_bottom_left
			},
			bottom_right_texture_id = {
				offset = {
					0,
					0,
					0
				},
				scenegraph_id = scenegraph_id_bottom_right
			},
			top_left_skull_glow = {
				size = {
					60,
					60
				},
				offset = {
					-10,
					188,
					0
				},
				scenegraph_id = scenegraph_id_top_left
			},
			top_right_skull_glow = {
				size = {
					60,
					60
				},
				offset = {
					104,
					188,
					0
				},
				scenegraph_id = scenegraph_id_top_right
			},
			bottom_left_skull_glow = {
				size = {
					60,
					60
				},
				offset = {
					-10,
					-7,
					0
				},
				scenegraph_id = scenegraph_id_bottom_left
			},
			bottom_right_skull_glow = {
				size = {
					60,
					60
				},
				offset = {
					104,
					-7,
					0
				},
				scenegraph_id = scenegraph_id_bottom_right
			},
			top_left_corner_glow = {
				size = {
					180,
					200
				},
				offset = {
					22.5,
					19,
					-1
				},
				scenegraph_id = scenegraph_id_top_left
			},
			top_right_corner_glow = {
				size = {
					180,
					200
				},
				offset = {
					-42,
					19,
					-1
				},
				scenegraph_id = scenegraph_id_top_right
			},
			bottom_left_corner_glow = {
				size = {
					180,
					200
				},
				offset = {
					22.5,
					22.5,
					-1
				},
				scenegraph_id = scenegraph_id_bottom_left
			},
			bottom_right_corner_glow = {
				size = {
					180,
					200
				},
				offset = {
					-42,
					22.5,
					-1
				},
				scenegraph_id = scenegraph_id_bottom_right
			}
		},
		style_global = {
			texture_color = texture_color,
			glow_skull_color = glow_skull_color,
			glow_corner_color = glow_corner_color
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_journal_tab = function (scenegraph_id, texture, masked)
	return {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					texture_id = "texture_id",
					style_id = "texture_id",
					pass_type = "texture"
				},
				{
					texture_id = "texture_hover_id",
					style_id = "texture_id",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disabled and button_hotspot.is_hover
					end
				},
				{
					texture_id = "texture_selected_id",
					style_id = "texture_id",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disabled and (button_hotspot.is_clicked == 0 or button_hotspot.is_selected)
					end
				},
				{
					texture_id = "new_texture_id",
					style_id = "new_texture_id",
					pass_type = "texture",
					content_check_function = function (content)
						return content.new
					end
				}
			}
		},
		content = {
			new = false,
			new_texture_id = "journal_icon_02",
			button_hotspot = {},
			texture_id = texture,
			texture_hover_id = texture .. "_selected",
			texture_selected_id = texture .. "_hover"
		},
		style = {
			texture_id = {
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
				},
				masked = masked
			},
			new_texture_id = {
				size = {
					30,
					30
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					5,
					105,
					1
				},
				masked = masked
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_journal_page_arrow_button = function (scenegraph_id, uvs, masked)
	local passes = nil
	local content = {
		texture_hover_id = "journal_arrow_01",
		texture_selected_id = "journal_arrow_01_clicked",
		texture_id = "journal_arrow_01",
		button_hotspot = {}
	}

	if uvs then
		passes = {
			{
				pass_type = "hotspot",
				content_id = "button_hotspot"
			},
			{
				texture_id = "texture_id",
				style_id = "texture_id",
				pass_type = "texture_uv",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return not button_hotspot.disabled and not button_hotspot.is_hover and (not button_hotspot.is_clicked or button_hotspot.is_clicked ~= 0)
				end
			},
			{
				texture_id = "texture_hover_id",
				style_id = "texture_hover_id",
				pass_type = "texture_uv",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return not button_hotspot.disabled and button_hotspot.is_hover and (not button_hotspot.is_clicked or button_hotspot.is_clicked ~= 0)
				end
			},
			{
				texture_id = "texture_selected_id",
				style_id = "texture_selected_id",
				pass_type = "texture_uv",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return not button_hotspot.disabled and (button_hotspot.is_clicked == 0 or button_hotspot.is_selected)
				end
			}
		}
		content.uvs = uvs
	else
		passes = {
			{
				pass_type = "hotspot",
				content_id = "button_hotspot"
			},
			{
				texture_id = "texture_id",
				style_id = "texture_id",
				pass_type = "texture",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return not button_hotspot.disabled and not button_hotspot.is_hover and (not button_hotspot.is_clicked or button_hotspot.is_clicked ~= 0)
				end
			},
			{
				texture_id = "texture_hover_id",
				style_id = "texture_hover_id",
				pass_type = "texture",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return not button_hotspot.disabled and button_hotspot.is_hover and (not button_hotspot.is_clicked or button_hotspot.is_clicked ~= 0)
				end
			},
			{
				texture_id = "texture_selected_id",
				style_id = "texture_selected_id",
				pass_type = "texture",
				content_check_function = function (content)
					local button_hotspot = content.button_hotspot

					return not button_hotspot.disabled and (button_hotspot.is_clicked == 0 or button_hotspot.is_selected)
				end
			}
		}
	end

	return {
		element = {
			passes = passes
		},
		content = content,
		style = {
			texture_id = {
				color = {
					200,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				},
				masked = masked
			},
			texture_hover_id = {
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
				},
				masked = masked
			},
			texture_selected_id = {
				size = {
					41,
					33
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-4,
					-5,
					0
				},
				masked = masked
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_journal_back_arrow_button = function (scenegraph_id, masked)
	return {
		element = {
			passes = {
				{
					pass_type = "hotspot",
					content_id = "button_hotspot"
				},
				{
					texture_id = "texture_id",
					style_id = "texture_id",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disabled and not button_hotspot.is_hover and (not button_hotspot.is_clicked or button_hotspot.is_clicked ~= 0)
					end
				},
				{
					texture_id = "texture_hover_id",
					style_id = "texture_hover_id",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disabled and button_hotspot.is_hover and (not button_hotspot.is_clicked or button_hotspot.is_clicked ~= 0)
					end
				},
				{
					texture_id = "texture_selected_id",
					style_id = "texture_selected_id",
					pass_type = "texture",
					content_check_function = function (content)
						local button_hotspot = content.button_hotspot

						return not button_hotspot.disabled and (button_hotspot.is_clicked == 0 or button_hotspot.is_selected)
					end
				}
			}
		},
		content = {
			texture_hover_id = "journal_arrow_02",
			texture_selected_id = "journal_arrow_02_clicked",
			texture_id = "journal_arrow_02",
			button_hotspot = {}
		},
		style = {
			texture_id = {
				color = {
					200,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				},
				masked = masked
			},
			texture_hover_id = {
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
				},
				masked = masked
			},
			texture_selected_id = {
				size = {
					100,
					100
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-25,
					-25,
					0
				},
				masked = masked
			}
		},
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_journal_reveal_mask = function (textures, scenegraph_ids, scenegraph_id)
	local passes = {}
	local content = {}
	local style = {}
	local num_textures = #textures

	for i = 1, num_textures + 1, 1 do
		local is_last_pass = i == num_textures + 1

		if is_last_pass then
			local texture_id = "cover_rect"
			passes[i] = {
				pass_type = "texture",
				texture_id = texture_id,
				style_id = texture_id
			}
			content[texture_id] = "mask_rect"
			style[texture_id] = {
				color = {
					0,
					0,
					0,
					0
				},
				offset = {
					0,
					0,
					0
				}
			}
		else
			local texture_id = "texture_" .. i
			local texture_scenegraph_id = scenegraph_ids[i]
			passes[i] = {
				pass_type = "texture",
				style_id = texture_id,
				texture_id = texture_id
			}
			style[texture_id] = {
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				},
				scenegraph_id = texture_scenegraph_id
			}
			content[texture_id] = textures[i]
		end
	end

	content.num_textures = num_textures

	return {
		element = {
			passes = passes
		},
		content = content,
		style = style,
		scenegraph_id = scenegraph_id
	}
end

UIWidgets.create_gamepad_selection = function (scenegraph_id, retained, masked, optional_texture_size)
	return {
		element = {
			passes = {
				{
					texture_id = "texture_top_left",
					style_id = "texture_top_left",
					pass_type = "texture",
					retained_mode = retained
				},
				{
					texture_id = "texture_top_right",
					style_id = "texture_top_right",
					pass_type = "texture",
					retained_mode = retained
				},
				{
					texture_id = "texture_bottom_left",
					style_id = "texture_bottom_left",
					pass_type = "texture",
					retained_mode = retained
				},
				{
					texture_id = "texture_bottom_right",
					style_id = "texture_bottom_right",
					pass_type = "texture",
					retained_mode = retained
				}
			}
		},
		content = {
			texture_bottom_left = "gold_frame_01_lower_left_corner",
			texture_bottom_right = "gold_frame_01_lower_right_corner",
			texture_top_left = "gold_frame_01_upper_left_corner",
			texture_top_right = "gold_frame_01_upper_right_corner"
		},
		style = {
			texture_top_left = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				texture_size = optional_texture_size or {
					40,
					40
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
				},
				masked = masked
			},
			texture_top_right = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				texture_size = optional_texture_size or {
					40,
					40
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
				},
				masked = masked
			},
			texture_bottom_left = {
				vertical_alignment = "bottom",
				horizontal_alignment = "left",
				texture_size = optional_texture_size or {
					40,
					40
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
				},
				masked = masked
			},
			texture_bottom_right = {
				vertical_alignment = "bottom",
				horizontal_alignment = "right",
				texture_size = optional_texture_size or {
					40,
					40
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
				},
				masked = masked
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

UIWidgets.create_simple_atlas_texture = function (texture, scenegraph_id, masked, retained, color, layer, horizontal_alignment, vertical_alignment)
	local texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(texture)
	local definition = {
		element = {
			passes = {
				{
					texture_id = "texture_id",
					style_id = "texture_id",
					pass_type = "texture",
					retained_mode = retained
				}
			}
		},
		content = {
			texture_id = texture
		},
		style = {
			texture_id = {
				texture_size = texture_settings.size,
				color = color or {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					0,
					0
				},
				masked = masked,
				horizontal_alignment = horizontal_alignment,
				vertical_alignment = vertical_alignment
			}
		},
		offset = {
			0,
			0,
			layer or 0
		},
		scenegraph_id = scenegraph_id
	}

	return definition
end

return

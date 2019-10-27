local SIZE_X = 1920
local SIZE_Y = 1080
local multiplier = 1.5
local BAR_SIZE = {
	250 * multiplier,
	22 * multiplier
}
local TIP_SIZE = {
	21 * multiplier,
	21 * multiplier
}
local ICON_SIZE = {
	42.5,
	42.5
}
local WINDOW_SIZE = {
	325 * multiplier,
	50 * multiplier
}
local progress_ui_multiplier = 1
local PROGRESS_UI_WINDOW_SIZE = {
	325 * progress_ui_multiplier,
	50 * progress_ui_multiplier
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
	progress_ui = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "right",
		position = {
			0,
			-25,
			0
		},
		size = PROGRESS_UI_WINDOW_SIZE
	},
	progress_window = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "right",
		position = {
			-20,
			-20,
			0
		},
		size = WINDOW_SIZE
	},
	progress_icon = {
		vertical_alignment = "center",
		parent = "progress_window",
		horizontal_alignment = "left",
		position = {
			60,
			0,
			1
		},
		size = ICON_SIZE
	},
	progress_bar = {
		vertical_alignment = "center",
		parent = "progress_window",
		horizontal_alignment = "right",
		position = {
			0,
			0,
			1
		},
		size = BAR_SIZE
	}
}

local function create_progress_bar(scenegraph_id, texture)
	local frame_settings = UIFrameSettings.button_frame_02

	return {
		element = {
			passes = {
				{
					pass_type = "rect",
					style_id = "background"
				},
				{
					pass_type = "texture",
					style_id = "mask",
					texture_id = "mask_id"
				},
				{
					pass_type = "texture",
					style_id = "glass",
					texture_id = "glass_id"
				},
				{
					style_id = "progress_bar_fill",
					pass_type = "texture_uv",
					content_id = "progress_bar_fill_id",
					content_change_function = function (content, style)
						style.texture_size[1] = content.parent.bar_progress * BAR_SIZE[1]
						content.uvs[2][1] = content.parent.bar_progress
					end
				},
				{
					style_id = "progress_bar_tip",
					texture_id = "progress_bar_tip_id",
					pass_type = "texture",
					content_change_function = function (content, style)
						style.offset[1] = content.bar_progress * BAR_SIZE[1] - 4
					end
				},
				{
					texture_id = "frame_id",
					style_id = "frame",
					pass_type = "texture_frame"
				},
				{
					style_id = "progress_bar_end_left",
					pass_type = "texture_uv",
					content_id = "progress_bar_end_left_id"
				},
				{
					pass_type = "texture",
					style_id = "progress_bar_end_right",
					texture_id = "progress_bar_end_id"
				},
				{
					style_id = "progress_bar_fill_bg",
					pass_type = "texture_uv",
					content_id = "progress_bar_fill_bg_id",
					content_check_function = function (content, style)
						return content.parent.bar_progress < content.parent.progress
					end,
					content_change_function = function (content, style)
						style.texture_size[1] = content.parent.progress * BAR_SIZE[1]
						content.uvs[2][1] = content.parent.progress
					end
				},
				{
					style_id = "glow",
					pass_type = "texture_uv",
					content_id = "glow_id",
					content_check_function = function (content, style)
						return content.parent.bar_progress < content.parent.progress or content.parent.bar_progress == 1
					end,
					content_change_function = function (content, style, ui_animation, dt)
						if content.parent.bar_progress == 1 then
							content.timer = content.timer + dt * 3
							style.color[1] = 96 + math.cos(content.timer) * 96
							style.texture_size[1] = BAR_SIZE[1]
							style.offset[1] = 0
						else
							content.uvs[1][1] = 1 - (content.parent.progress - content.parent.bar_progress)
							content.uvs[2][1] = 1
							style.offset[1] = content.parent.bar_progress * BAR_SIZE[1]
							style.texture_size[1] = (content.parent.progress - content.parent.bar_progress) * BAR_SIZE[1]
						end
					end
				},
				{
					style_id = "progress_bar_glow_tip",
					texture_id = "progress_bar_tip_id",
					pass_type = "texture",
					content_check_function = function (content, style)
						return content.bar_progress < content.progress
					end,
					content_change_function = function (content, style)
						style.offset[1] = content.progress * BAR_SIZE[1] - 4
					end
				},
				{
					scenegraph_id = "progress_icon",
					style_id = "progress_icon_effect",
					pass_type = "texture_uv",
					content_id = "progress_icon_effect"
				},
				{
					texture_id = "mask_texture",
					style_id = "mask_top",
					pass_type = "texture"
				},
				{
					texture_id = "mask_texture",
					style_id = "mask_bottom",
					pass_type = "texture"
				}
			}
		},
		content = {
			progress_bar_end_id = "weave_bar_end",
			progress = 0,
			progress_bar_tip_id = "weave_bar_fill_gain_glow_progress_end",
			test = "weave_bar_fill_gain_progress_glow",
			glass_id = "button_glass_01",
			mask_id = "bar_blur",
			bar_progress = 0,
			mask_texture = "mask_rect",
			progress_bar_fill_id = {
				texture_id = "weave_bar_fill_progress",
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
			progress_bar_fill_bg_id = {
				texture_id = "weave_bar_fill_progress",
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
			glow_id = {
				timer = 0,
				texture_id = "weave_bar_fill_gain_progress_glow",
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
			frame_id = frame_settings.texture,
			progress_bar_end_left_id = {
				texture_id = "weave_bar_end",
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
			progress_icon_effect = {
				texture_id = "weave_progress_effect",
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
			progress_icon_effect = {
				vertical_alignment = "bottom",
				horizontal_alignment = "center",
				texture_size = {
					67.5,
					87.5
				},
				offset = {
					-0,
					-2,
					50
				},
				color = {
					255,
					255,
					131,
					0
				}
			},
			background = {
				color = {
					128,
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
			mask = {
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
					0
				},
				texture_size = {
					BAR_SIZE[1] + 15,
					BAR_SIZE[2] + 18
				}
			},
			mask_top = {
				vertical_alignment = "top",
				horizontal_alignment = "center",
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					BAR_SIZE[2] * 0.25,
					10
				},
				texture_size = {
					BAR_SIZE[1] - 17 * multiplier * 2,
					BAR_SIZE[2] * 0.4
				}
			},
			mask_bottom = {
				vertical_alignment = "bottom",
				horizontal_alignment = "center",
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					0,
					-BAR_SIZE[2] * 0.25,
					10
				},
				texture_size = {
					BAR_SIZE[1] - 17 * multiplier * 2,
					BAR_SIZE[2] * 0.4
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
					4
				},
				texture_size = {
					BAR_SIZE[1],
					BAR_SIZE[2]
				}
			},
			progress_bar_fill = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					3
				},
				texture_size = {
					BAR_SIZE[1],
					BAR_SIZE[2] + 22
				}
			},
			progress_bar_tip = {
				masked = true,
				color = {
					255,
					255,
					255,
					255
				},
				texture_size = TIP_SIZE,
				offset = {
					0,
					0,
					3
				}
			},
			frame = {
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
				},
				texture_size = frame_settings.texture_size,
				texture_sizes = frame_settings.texture_sizes
			},
			progress_bar_end_right = {
				vertical_alignment = "center",
				horizontal_alignment = "right",
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
				},
				texture_size = {
					17 * multiplier,
					21 * multiplier
				}
			},
			progress_bar_end_left = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
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
				},
				texture_size = {
					17 * multiplier,
					21 * multiplier
				}
			},
			progress_bar_fill_bg = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					0,
					0,
					2
				},
				texture_size = {
					0,
					BAR_SIZE[2] + 22
				}
			},
			glow = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					12,
					0,
					6
				},
				texture_size = {
					BAR_SIZE[1],
					BAR_SIZE[2] + 16
				}
			},
			progress_bar_glow_tip = {
				masked = true,
				color = {
					255,
					255,
					255,
					255
				},
				texture_size = TIP_SIZE,
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

local function create_progress_ui(scenegraph_id)
	local background_texture = "weaves_essence_bar_backdrop"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local bar_texture = "weaves_essence_bar_fill"
	local bar_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(bar_texture)
	local bar_bg_texture = "weaves_essence_bar_bg"
	local bar_bg_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(bar_bg_texture)
	local bar_edge_glow_texture = "weaves_essence_bar_edge_glow"
	local bar_edge_glow_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(bar_edge_glow_texture)
	local background_filled_texture = "weaves_essence_bar_backdrop_highlight"
	local background_filled_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_filled_texture)
	local essence_icon_texture = "icon_essence_small"
	local essence_icon_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(essence_icon_texture)
	local bubble_icon_texture = "weaves_icon_boss"
	local bubble_icon_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(bubble_icon_texture)
	local bubble_icon_grayscale_texture = "weaves_icon_boss_greyscale"
	local bubble_icon_grayscale_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(bubble_icon_grayscale_texture)
	local max_essence = WeaveSettings.score[#WeaveSettings.score].essence

	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "background",
					texture_id = "background_id"
				},
				{
					pass_type = "texture",
					style_id = "background_filled",
					texture_id = "background_filled_id"
				},
				{
					pass_type = "texture",
					style_id = "essence_icon",
					texture_id = "essence_icon_id"
				},
				{
					style_id = "bar",
					pass_type = "texture_uv",
					content_id = "bar_content",
					content_change_function = function (content, style)
						local parent_content = content.parent
						local progress = parent_content.bar_progress
						local uvs = content.uvs
						uvs[2][1] = progress
						local base_offset_x = style.base_offset_x
						style.texture_size[1] = progress * bar_texture_settings.size[1]
					end
				},
				{
					style_id = "bar_glow",
					pass_type = "rect",
					content_change_function = function (content, style)
						local progress = content.progress
						style.texture_size[1] = progress * bar_texture_settings.size[1]
					end
				},
				{
					style_id = "bar_edge_glow",
					texture_id = "bar_edge_glow_id",
					pass_type = "texture",
					content_change_function = function (content, style)
						local size = bar_texture_settings.size[1]
						local progress = content.bar_progress
						local base_offset_x = style.base_offset_x
						style.offset[1] = base_offset_x + progress * size
						local time = Managers.time:time("main")
						style.color[1] = 192 + 63 * math.sin(time * 4)
					end
				},
				{
					pass_type = "texture",
					style_id = "bubble_icon",
					texture_id = "bubble_icon_id",
					content_check_function = function (content)
						local bar_cutoff = content.bar_cutoff
						local current_bar_score = Managers.weave:current_bar_score()

						return bar_cutoff < 100 and bar_cutoff <= current_bar_score
					end
				},
				{
					pass_type = "texture",
					style_id = "bubble_icon",
					texture_id = "bubble_icon_grayscale_id",
					content_check_function = function (content)
						local bar_cutoff = content.bar_cutoff
						local current_bar_score = Managers.weave:current_bar_score()

						return bar_cutoff < 100 and current_bar_score < bar_cutoff
					end
				},
				{
					pass_type = "texture",
					style_id = "bar_bg",
					texture_id = "bar_bg_id"
				},
				{
					style_id = "standard_objective",
					pass_type = "text",
					text_id = "standard_objective_text_id"
				},
				{
					style_id = "standard_objective_shadow",
					pass_type = "text",
					text_id = "standard_objective_text_id"
				},
				{
					style_id = "bonus_time",
					pass_type = "text",
					text_id = "bonus_time"
				},
				{
					style_id = "bonus_time_shadow",
					pass_type = "text",
					text_id = "bonus_time"
				}
			}
		},
		content = {
			progress = 0,
			bar_cutoff = 100,
			bonus_time = "+ 0:00",
			essence_id = "Essence:",
			bar_progress = 0,
			standard_objective_text_id = "objective_kill_enemies",
			bubble_icon_id = bubble_icon_texture,
			bubble_icon_grayscale_id = bubble_icon_grayscale_texture,
			essence_icon_id = essence_icon_texture,
			background_id = background_texture,
			background_filled_id = background_filled_texture,
			bar_content = {
				texture_id = bar_texture,
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
			bar_edge_glow_id = bar_edge_glow_texture,
			bar_bg_id = bar_bg_texture,
			essence_amount_id = max_essence .. "/" .. max_essence
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
			background_filled = {
				vertical_alignment = "top",
				horizontal_alignment = "right",
				texture_size = background_filled_texture_settings.size,
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					0,
					26,
					1
				}
			},
			essence_icon = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				texture_size = essence_icon_texture_settings.size,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					45,
					3,
					10
				}
			},
			bar = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				texture_size = bar_texture_settings.size,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					80,
					0,
					10
				}
			},
			bar_glow = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				texture_size = {
					0,
					6
				},
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					80,
					0,
					9
				}
			},
			bar_edge_glow = {
				vertical_alignment = "center",
				base_offset_x = 57,
				horizontal_alignment = "left",
				texture_size = bar_edge_glow_texture_settings.size,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					57,
					0,
					7
				}
			},
			bubble_icon = {
				vertical_alignment = "center",
				horizontal_alignment = "left",
				texture_size = bubble_icon_texture_settings.size,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					200,
					5,
					10
				},
				base_offset_x = 53 + bubble_icon_texture_settings.size[1] * 0.5
			},
			bar_bg = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = bar_bg_texture_settings.size,
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					15,
					0,
					5
				}
			},
			essence = {
				word_wrap = false,
				upper_case = false,
				localize = false,
				font_size = 16,
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				font_type = "hell_shark_header",
				text_color = {
					255,
					231,
					99,
					253
				},
				offset = {
					80,
					-3,
					5
				}
			},
			essence_shadow = {
				word_wrap = false,
				upper_case = false,
				localize = false,
				font_size = 16,
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				font_type = "hell_shark_header",
				text_color = {
					255,
					0,
					0,
					0
				},
				offset = {
					82,
					-5,
					4
				}
			},
			essence_amount = {
				word_wrap = false,
				upper_case = false,
				localize = false,
				font_size = 16,
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				font_type = "hell_shark_header",
				text_color = {
					255,
					255,
					255,
					255
				},
				offset = {
					-120,
					-3,
					5
				}
			},
			essence_amount_shadow = {
				word_wrap = false,
				upper_case = false,
				localize = false,
				font_size = 16,
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				font_type = "hell_shark_header",
				text_color = {
					255,
					0,
					0,
					0
				},
				offset = {
					-118,
					-5,
					4
				}
			},
			standard_objective = {
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
					PROGRESS_UI_WINDOW_SIZE[1] - 80,
					PROGRESS_UI_WINDOW_SIZE[2]
				}
			},
			standard_objective_shadow = {
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
					PROGRESS_UI_WINDOW_SIZE[1] - 80,
					PROGRESS_UI_WINDOW_SIZE[2]
				}
			},
			bonus_time = {
				word_wrap = false,
				upper_case = false,
				localize = false,
				font_size = 16,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark_header",
				text_color = {
					255,
					255,
					255,
					255
				},
				offset = {
					62,
					-19,
					1
				}
			},
			bonus_time_shadow = {
				word_wrap = false,
				upper_case = false,
				localize = false,
				font_size = 16,
				horizontal_alignment = "center",
				vertical_alignment = "center",
				font_type = "hell_shark_header",
				text_color = {
					255,
					0,
					0,
					0
				},
				offset = {
					64,
					-21,
					0
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

local function create_bonus_objective_header_func()
	local scenegraph_id = "progress_ui"

	return {
		element = {
			passes = {
				{
					style_id = "bonus_objective",
					pass_type = "text",
					text_id = "bonus_objective_text_id"
				},
				{
					style_id = "bonus_objective_shadow",
					pass_type = "text",
					text_id = "bonus_objective_text_id"
				}
			}
		},
		content = {
			bonus_objective_text_id = "weave_bonus_essence_header"
		},
		style = {
			bonus_objective = {
				word_wrap = false,
				upper_case = false,
				localize = true,
				font_size = 26,
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("font_default", 255),
				offset = {
					80,
					-90,
					1
				}
			},
			bonus_objective_shadow = {
				word_wrap = false,
				upper_case = false,
				localize = true,
				font_size = 26,
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				font_type = "hell_shark_header",
				text_color = {
					255,
					0,
					0,
					0
				},
				offset = {
					82,
					-92,
					0
				}
			}
		},
		scenegraph_id = scenegraph_id
	}
end

local function create_bonus_objective_func(display_name, score, index, stack_name, objective_name)
	local scenegraph_id = "progress_ui"
	local checkmark_texture = "matchmaking_checkbox"
	local checkmark_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(checkmark_texture)
	local bullet_texture = "weaves_objective_bullet"
	local bullet_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(bullet_texture)
	local essence_icon_texture = "icon_essence_small"
	local essence_icon_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(essence_icon_texture)

	return {
		element = {
			passes = {
				{
					style_id = "stroke",
					pass_type = "rect",
					content_check_function = function (content)
						return content.is_done
					end
				},
				{
					pass_type = "texture",
					style_id = "bullet",
					texture_id = "bullet_id",
					content_check_function = function (content)
						return not content.is_done
					end
				},
				{
					pass_type = "texture",
					style_id = "checkmark",
					texture_id = "checkmark_id",
					content_check_function = function (content)
						return content.is_done
					end
				},
				{
					pass_type = "texture",
					style_id = "checkmark_shadow",
					texture_id = "checkmark_id",
					content_check_function = function (content)
						return content.is_done
					end
				},
				{
					style_id = "objective_name",
					pass_type = "text",
					text_id = "objective_name_id",
					content_change_function = function (content)
						if not content.stack then
							return
						end

						content.objective_name_id = content.base_objective_name_id
						local stack = content.stack
						local done_stack = content.done_stack
						content.objective_name_id = content.objective_name_id .. " " .. table.size(done_stack) .. "/" .. table.size(stack)
					end
				},
				{
					style_id = "objective_name_shadow",
					pass_type = "text",
					text_id = "objective_name_id"
				}
			}
		},
		content = {
			show_marker = false,
			is_done = false,
			essence_icon_id = essence_icon_texture,
			checkmark_id = checkmark_texture,
			bullet_id = bullet_texture,
			score_id = score,
			base_objective_name_id = Localize(display_name),
			objective_name_id = Localize(display_name),
			stack = objective_name and {
				objective_name
			},
			done_stack = {},
			stack_name = stack_name,
			is_done_func = function (content, objective_name)
				if content.is_done or content.stack == false then
					return true
				end

				return table.find(content.done_stack, objective_name)
			end
		},
		style = {
			stroke = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				texture_size = {
					0,
					2
				},
				color = Colors.get_color_table_with_alpha("black", 128),
				offset = {
					80,
					-97,
					1
				}
			},
			bullet = {
				vertical_alignment = "top",
				horizontal_alignment = "left",
				texture_size = bullet_texture_settings.size,
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					65,
					-90,
					1
				}
			},
			checkmark = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					checkmark_texture_settings.size[1] * 0.5,
					checkmark_texture_settings.size[2] * 0.5
				},
				color = Colors.get_color_table_with_alpha("font_title", 255),
				offset = {
					-90,
					-72,
					1
				}
			},
			checkmark_shadow = {
				vertical_alignment = "center",
				horizontal_alignment = "center",
				texture_size = {
					checkmark_texture_settings.size[1],
					checkmark_texture_settings.size[2]
				},
				color = Colors.get_color_table_with_alpha("black", 255),
				offset = {
					-88,
					-74,
					0
				}
			},
			objective_name = {
				word_wrap = false,
				upper_case = false,
				localize = false,
				font_size = 22,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					80,
					-85,
					1
				}
			},
			objective_name_shadow = {
				word_wrap = false,
				upper_case = false,
				localize = false,
				font_size = 22,
				horizontal_alignment = "left",
				vertical_alignment = "top",
				font_type = "hell_shark_header",
				text_color = {
					255,
					0,
					0,
					0
				},
				offset = {
					82,
					-87,
					0
				}
			},
			essence_icon = {
				vertical_alignment = "bottom",
				horizontal_alignment = "left",
				texture_size = {
					essence_icon_texture_settings.size[1] * 0.75,
					essence_icon_texture_settings.size[2] * 0.75
				},
				color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					80,
					-82,
					1
				}
			},
			score = {
				word_wrap = false,
				upper_case = false,
				localize = false,
				font_size = 18,
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				font_type = "hell_shark_header",
				text_color = Colors.get_color_table_with_alpha("white", 255),
				offset = {
					105,
					-85,
					1
				}
			},
			score_shadow = {
				word_wrap = false,
				upper_case = false,
				localize = false,
				font_size = 18,
				horizontal_alignment = "left",
				vertical_alignment = "bottom",
				font_type = "hell_shark_header",
				text_color = {
					255,
					0,
					0,
					0
				},
				offset = {
					107,
					-87,
					0
				}
			}
		},
		scenegraph_id = scenegraph_id,
		offset = {
			0,
			-50 + index * -25,
			5
		}
	}
end

local widgets = {
	progress_ui = create_progress_ui("progress_ui")
}

return {
	scenegraph_definition = scenegraph_definition,
	create_bonus_objective_header_func = create_bonus_objective_header_func,
	create_bonus_objective_func = create_bonus_objective_func,
	widgets = widgets
}

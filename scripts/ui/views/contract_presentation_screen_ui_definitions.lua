local SIZE_X = 1920
local SIZE_Y = 1080
local RETAINED_MODE_ENABLED = nil
local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			UILayer.end_screen + 2
		},
		size = {
			SIZE_X,
			SIZE_Y
		}
	},
	screen = {
		vertical_alignment = "center",
		parent = "root",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			SIZE_X,
			SIZE_Y
		}
	},
	pivot = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "center",
		position = {
			0.5,
			-300,
			1
		},
		size = {
			0,
			0
		}
	},
	entry_1 = {
		vertical_alignment = "center",
		parent = "pivot",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			899,
			259
		}
	},
	entry_2 = {
		vertical_alignment = "center",
		parent = "pivot",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			899,
			259
		}
	},
	entry_3 = {
		vertical_alignment = "center",
		parent = "pivot",
		horizontal_alignment = "center",
		position = {
			0,
			0,
			1
		},
		size = {
			899,
			259
		}
	},
	input_description_text = {
		vertical_alignment = "bottom",
		parent = "screen",
		horizontal_alignment = "center",
		position = {
			0,
			80,
			1
		},
		size = {
			1200,
			50
		}
	},
	title_text = {
		vertical_alignment = "top",
		parent = "screen",
		horizontal_alignment = "center",
		position = {
			0,
			-80,
			1
		},
		size = {
			1200,
			50
		}
	}
}

local function create_entry(index)
	local bg_width = 899
	local bg_height = 259
	local task_bg_width = 860
	local task_bg_height = 127

	return {
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "texture_bg",
					texture_id = "texture_bg",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					style_id = "title_text",
					pass_type = "text",
					text_id = "title_text",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					style_id = "bar_text",
					pass_type = "text",
					text_id = "bar_text",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					style_id = "progress_bar",
					pass_type = "texture_uv",
					content_id = "progress_bar",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					pass_type = "centered_texture_amount",
					style_id = "texture_divider",
					texture_id = "texture_divider",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return 0 < style.texture_amount
					end
				},
				{
					pass_type = "texture",
					style_id = "texture_completed",
					texture_id = "texture_completed",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					texture_id = "overlay_mask",
					style_id = "overlay",
					pass_type = "texture",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					texture_id = "overlay",
					style_id = "overlay",
					pass_type = "texture",
					retained_mode = RETAINED_MODE_ENABLED
				},
				{
					style_id = "task_text_1",
					pass_type = "text",
					text_id = "task_text_1",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return 0 < content.task_amount and not content.texture_task_icon_1
					end
				},
				{
					style_id = "task_value_1",
					pass_type = "text",
					text_id = "task_value_1",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return 0 < content.task_amount
					end
				},
				{
					pass_type = "texture",
					style_id = "texture_task_icon_1",
					texture_id = "texture_task_icon_1",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.texture_task_icon_1 and 0 < content.task_amount
					end
				},
				{
					pass_type = "gradient_mask_texture",
					style_id = "texture_task_marker_1",
					texture_id = "texture_task_marker_1",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.task_completed_1 and 0 < content.task_amount
					end
				},
				{
					pass_type = "texture",
					style_id = "texture_task_glow_1",
					texture_id = "texture_task_glow",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return 0 < content.task_amount
					end
				},
				{
					style_id = "task_text_2",
					pass_type = "text",
					text_id = "task_text_2",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						local task_amount = content.task_amount

						return 1 < task_amount and not content.texture_task_icon_2
					end
				},
				{
					style_id = "task_value_2",
					pass_type = "text",
					text_id = "task_value_2",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						local task_amount = content.task_amount

						return 1 < task_amount
					end
				},
				{
					pass_type = "texture",
					style_id = "texture_task_icon_2",
					texture_id = "texture_task_icon_2",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.texture_task_icon_2 and 1 < content.task_amount
					end
				},
				{
					pass_type = "gradient_mask_texture",
					style_id = "texture_task_marker_2",
					texture_id = "texture_task_marker_2",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						local task_amount = content.task_amount

						return content.task_completed_2 and 1 < task_amount
					end
				},
				{
					pass_type = "texture",
					style_id = "texture_task_glow_2",
					texture_id = "texture_task_glow",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return 1 < content.task_amount
					end
				},
				{
					style_id = "task_text_3",
					pass_type = "text",
					text_id = "task_text_3",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						local task_amount = content.task_amount

						return 2 < task_amount and not content.texture_task_icon_3
					end
				},
				{
					style_id = "task_value_3",
					pass_type = "text",
					text_id = "task_value_3",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						local task_amount = content.task_amount

						return 2 < task_amount
					end
				},
				{
					pass_type = "texture",
					style_id = "texture_task_icon_3",
					texture_id = "texture_task_icon_3",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return content.texture_task_icon_3 and 2 < content.task_amount
					end
				},
				{
					pass_type = "gradient_mask_texture",
					style_id = "texture_task_marker_3",
					texture_id = "texture_task_marker_3",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						local task_amount = content.task_amount

						return content.task_completed_3 and 2 < task_amount
					end
				},
				{
					pass_type = "texture",
					style_id = "texture_task_glow_3",
					texture_id = "texture_task_glow",
					retained_mode = RETAINED_MODE_ENABLED,
					content_check_function = function (content, style)
						return 2 < content.task_amount
					end
				}
			}
		},
		content = {
			texture_bg = "contract_progress_bg",
			title_text = "n/a",
			texture_completed = "contract_progress_completed",
			task_value_2 = "n/a",
			task_amount = 1,
			task_text_3 = "n/a",
			overlay = "rect_masked",
			task_value_1 = "n/a",
			visible = false,
			overlay_mask = "contract_masked_overlay",
			task_text_2 = "n/a",
			texture_divider = "contract_progress_divider",
			task_text_1 = "n/a",
			bar_text = "Contract Progress: 80%",
			task_value_3 = "n/a",
			texture_task_glow = "quest_endscreen_glow",
			texture_task_marker_1 = "quest_contract_checkmark_" .. index .. "_1",
			texture_task_marker_2 = "quest_contract_checkmark_" .. index .. "_2",
			texture_task_marker_3 = "quest_contract_checkmark_" .. index .. "_3",
			progress_bar = {
				bar_value_position = 0,
				bar_value_size = 0,
				texture_id = "contract_progress_bar",
				internal_bar_value_position = 0,
				bar_value = 0,
				bar_value_offset = 0,
				internal_bar_value = 0,
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
			task_start_offset = 20,
			task_bg_size = {
				task_bg_width,
				task_bg_height
			},
			overlay = {
				size = {
					880,
					235
				},
				color = {
					0,
					0,
					0,
					0
				},
				offset = {
					0,
					23,
					7
				}
			},
			texture_bg = {
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
			texture_completed = {
				size = {
					408,
					179
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
					0
				}
			},
			title_text = {
				vertical_alignment = "top",
				horizontal_alignment = "center",
				font_type = "hell_shark",
				font_size = 32,
				offset = {
					0,
					-15,
					4
				},
				text_color = {
					150,
					0,
					0,
					0
				}
			},
			bar_text = {
				vertical_alignment = "center",
				font_size = 16,
				horizontal_alignment = "left",
				debug_draw_box = false,
				font_type = "hell_shark",
				size = {
					task_bg_width,
					20
				},
				offset = {
					20,
					35,
					4
				},
				text_color = {
					150,
					0,
					0,
					0
				}
			},
			progress_bar = {
				uv_start_pixels = 0,
				uv_scale_pixels = 859,
				scale_axis = 1,
				size = {
					859,
					17
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					11,
					58,
					1
				}
			},
			texture_divider = {
				texture_amount = 2,
				texture_axis = 1,
				color = {
					255,
					255,
					255,
					255
				},
				size = {
					task_bg_width,
					task_bg_height
				},
				offset = {
					20,
					73,
					2
				},
				texture_size = {
					11,
					132
				}
			},
			task_text_1 = {
				vertical_alignment = "top",
				font_size = 18,
				horizontal_alignment = "center",
				debug_draw_box = false,
				font_type = "hell_shark",
				size = {
					task_bg_width,
					75
				},
				offset = {
					20,
					113,
					4
				},
				text_color = {
					150,
					0,
					0,
					0
				}
			},
			task_value_1 = {
				vertical_alignment = "center",
				font_size = 32,
				horizontal_alignment = "center",
				debug_draw_box = false,
				font_type = "hell_shark",
				size = {
					task_bg_width,
					37
				},
				offset = {
					20,
					76,
					4
				},
				text_color = {
					150,
					0,
					0,
					0
				}
			},
			texture_task_marker_1 = {
				gradient_threshold = 0,
				size = {
					164,
					108
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					20,
					80,
					2
				}
			},
			texture_task_icon_1 = {
				size = {
					80,
					80
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					20,
					115,
					5
				}
			},
			texture_task_glow_1 = {
				size = {
					300,
					104
				},
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					20,
					76,
					3
				}
			},
			task_text_2 = {
				vertical_alignment = "top",
				font_size = 18,
				horizontal_alignment = "center",
				debug_draw_box = false,
				font_type = "hell_shark",
				size = {
					task_bg_width,
					75
				},
				offset = {
					20,
					113,
					4
				},
				text_color = {
					150,
					0,
					0,
					0
				}
			},
			task_value_2 = {
				vertical_alignment = "center",
				font_size = 32,
				horizontal_alignment = "center",
				debug_draw_box = false,
				font_type = "hell_shark",
				size = {
					task_bg_width,
					37
				},
				offset = {
					20,
					76,
					4
				},
				text_color = {
					150,
					0,
					0,
					0
				}
			},
			texture_task_marker_2 = {
				gradient_threshold = 0,
				size = {
					164,
					108
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					20,
					80,
					2
				}
			},
			texture_task_icon_2 = {
				size = {
					80,
					80
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					20,
					115,
					5
				}
			},
			texture_task_glow_2 = {
				size = {
					300,
					104
				},
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					20,
					76,
					3
				}
			},
			task_text_3 = {
				vertical_alignment = "top",
				font_size = 18,
				horizontal_alignment = "center",
				debug_draw_box = false,
				font_type = "hell_shark",
				size = {
					task_bg_width,
					75
				},
				offset = {
					20,
					113,
					4
				},
				text_color = {
					150,
					0,
					0,
					0
				}
			},
			task_value_3 = {
				vertical_alignment = "center",
				font_size = 32,
				horizontal_alignment = "center",
				debug_draw_box = false,
				font_type = "hell_shark",
				size = {
					task_bg_width,
					37
				},
				offset = {
					20,
					76,
					4
				},
				text_color = {
					150,
					0,
					0,
					0
				}
			},
			texture_task_marker_3 = {
				gradient_threshold = 0,
				size = {
					164,
					108
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					20,
					80,
					2
				}
			},
			texture_task_icon_3 = {
				size = {
					80,
					80
				},
				color = {
					255,
					255,
					255,
					255
				},
				offset = {
					20,
					115,
					5
				}
			},
			texture_task_glow_3 = {
				size = {
					300,
					104
				},
				color = {
					0,
					255,
					255,
					255
				},
				offset = {
					20,
					76,
					3
				}
			}
		},
		offset = {
			0,
			0,
			0
		},
		scenegraph_id = "entry_" .. index
	}
end

local entry_widget_definitions = {}

for i = 1, 3, 1 do
	entry_widget_definitions[i] = create_entry(i)
end

local widget_definitions = {
	input_description_text = UIWidgets.create_simple_text("press_any_key_to_continue", "input_description_text", 18, Colors.get_color_table_with_alpha("white", 255)),
	title_text = UIWidgets.create_simple_text("dlc1_3_1_contract_presentation_title", "title_text", 36, Colors.get_color_table_with_alpha("cheeseburger", 255))
}
local animation_definitions = {
	contract_entry = {
		{
			name = "reset",
			start_progress = 0,
			end_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local alpha = 0
				local widget_index = params.widget_index
				local widget = widgets[widget_index]
				local widget_style = widget.style
				local widget_content = widget.content
				widget_style.texture_divider.color[1] = alpha
				widget_style.progress_bar.color[1] = alpha
				widget_style.texture_bg.color[1] = alpha
				widget_style.bar_text.text_color[1] = alpha
				widget_style.title_text.text_color[1] = alpha
				widget_style.texture_task_marker_1.color[1] = alpha
				widget_style.texture_task_marker_2.color[1] = alpha
				widget_style.texture_task_marker_3.color[1] = alpha
				widget_style.task_text_1.text_color[1] = alpha
				widget_style.task_text_2.text_color[1] = alpha
				widget_style.task_text_3.text_color[1] = alpha
				widget_style.task_value_1.text_color[1] = alpha
				widget_style.task_value_2.text_color[1] = alpha
				widget_style.task_value_3.text_color[1] = alpha
				widget_style.texture_task_icon_1.color[1] = alpha
				widget_style.texture_task_icon_2.color[1] = alpha
				widget_style.texture_task_icon_3.color[1] = alpha
				local scenegraph_id = "entry_" .. widget_index
				local position = ui_scenegraph[scenegraph_id].local_position
				position[2] = scenegraph_definition[scenegraph_id].position[2]

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				WwiseWorld.trigger_event(params.wwise_world, "Play_hud_quest_menu_select_quest")

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local alpha = math.easeCubic(progress)*255
				local text_alpha = math.easeCubic(progress)*150
				local widget_index = params.widget_index
				local widget = widgets[widget_index]
				local widget_style = widget.style
				widget_style.texture_divider.color[1] = alpha
				widget_style.progress_bar.color[1] = alpha
				widget_style.texture_bg.color[1] = alpha
				widget_style.bar_text.text_color[1] = text_alpha
				widget_style.title_text.text_color[1] = text_alpha
				widget_style.texture_task_marker_1.color[1] = alpha
				widget_style.texture_task_marker_2.color[1] = alpha
				widget_style.texture_task_marker_3.color[1] = alpha
				widget_style.texture_task_icon_1.color[1] = alpha
				widget_style.texture_task_icon_2.color[1] = alpha
				widget_style.texture_task_icon_3.color[1] = alpha
				widget_style.task_text_1.text_color[1] = text_alpha
				widget_style.task_text_2.text_color[1] = text_alpha
				widget_style.task_text_3.text_color[1] = text_alpha
				widget_style.task_value_1.text_color[1] = text_alpha
				widget_style.task_value_2.text_color[1] = text_alpha
				widget_style.task_value_3.text_color[1] = text_alpha

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		}
	},
	contract_move = {
		{
			name = "move",
			start_progress = 0,
			end_progress = 0.3,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				local start_heights = {}
				local widget_index = params.widget_index
				local num_widgets = params.num_widgets

				for i = 1, widget_index, 1 do
					local scenegraph_id = "entry_" .. i
					local position = ui_scenegraph[scenegraph_id].local_position
					start_heights[i] = position[2]
				end

				params.start_heights = start_heights

				WwiseWorld.trigger_event(params.wwise_world, "Play_hud_shift")

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local widget_index = params.widget_index
				local num_widgets = params.num_widgets
				local start_heights = params.start_heights

				for i = 1, widget_index, 1 do
					local scenegraph_id = "entry_" .. i
					local default_position = scenegraph_definition[scenegraph_id].position
					local position = ui_scenegraph[scenegraph_id].local_position
					local start_height = start_heights[i]
					local distance_per_entry = 260
					position[2] = start_height - distance_per_entry*math.easeOutCubic(progress)
				end

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		}
	},
	contract_task_progress = {
		{
			name = "fade_in_selection",
			start_progress = 0,
			end_progress = 0.15,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local alpha = math.easeOutCubic(progress)*255
				local widget_index = params.widget_index
				local task_index = params.task_index
				local widget = widgets[widget_index]
				local widget_style = widget.style
				local texture_task_glow_style = widget_style["texture_task_glow_" .. task_index]
				texture_task_glow_style.color[1] = alpha

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "font_size",
			start_progress = 0.1,
			end_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local widget_index = params.widget_index
				local task_index = params.task_index
				local task_data = params.task_data
				local data = task_data[task_index]

				if data and data.session_value then
					local widget = widgets[widget_index]
					local widget_style = widget.style
					local name = "task_value_" .. task_index
					widget_style[name].font_size = math.catmullrom(progress, -0.5, 1, 1, -0.5)*32
				end

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "set_new_value",
			start_progress = 0.2,
			end_progress = 0.4,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local widget_index = params.widget_index
				local task_index = params.task_index
				local task_data = params.task_data
				local data = task_data[task_index]

				if data and data.session_value then
					local widget = widgets[widget_index]
					local widget_style = widget.style
					local widget_content = widget.content
					local value = data.value
					local session_value = data.session_value
					local end_value = data.end_value
					local new_value = math.floor(session_value*progress)
					local name = "task_value_" .. task_index
					widget_content[name] = tostring(value + new_value) .. "/" .. tostring(end_value)

					if end_value <= value + session_value then
						params.task_completed = true
					end
				end

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "set_completed",
			start_progress = 0.45,
			end_progress = 0.6,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				if params.task_completed then
					WwiseWorld.trigger_event(params.wwise_world, "Play_hud_quest_menu_finish_quest_end_screen")
				end

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				if params.task_completed then
					local widget_index = params.widget_index
					local widget = widgets[widget_index]
					local widget_content = widget.content
					local widget_style = widget.style
					local task_index = params.task_index
					local anim_progress = math.easeOutCubic(progress)
					widget_content["task_completed_" .. task_index] = true
					local marker_style = widget_style["texture_task_marker_" .. task_index]
					local marker_color = marker_style.color
					marker_color[1] = 255
					marker_style.gradient_threshold = anim_progress
				end

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "fade_out_selection",
			start_progress = 0.6,
			end_progress = 0.75,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local alpha = math.easeOutCubic(progress)*255 - 255
				local widget_index = params.widget_index
				local task_index = params.task_index
				local widget = widgets[widget_index]
				local widget_style = widget.style
				local texture_task_glow_style = widget_style["texture_task_glow_" .. task_index]
				texture_task_glow_style.color[1] = alpha

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		}
	},
	contract_summary = {
		{
			name = "bar_progress",
			start_progress = 0,
			end_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				WwiseWorld.trigger_event(params.wwise_world, "Play_hud_quest_menu_finish_quest_end_screen_progress")

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local widget_index = params.widget_index
				local widget = widgets[widget_index]
				local widget_content = widget.content
				local widget_style = widget.style
				local contract_start_progress = params.contract_start_progress
				local contract_session_progress = params.contract_session_progress
				local progress_bar_style = widget_style.progress_bar
				local progress_bar_content = widget_content.progress_bar
				local bar_progress = math.min(contract_start_progress + contract_session_progress*math.easeCubic(progress), 1)
				progress_bar_style.size[1] = progress_bar_style.uv_scale_pixels*bar_progress
				progress_bar_content.uvs[2][progress_bar_style.scale_axis] = bar_progress

				if progress == 1 and bar_progress == 1 then
					params.play_completed = true
				end

				bar_progress = math.floor(bar_progress*100, 0)
				local text = Localize("dlc1_3_1_contract_presentation_progress_prefix")
				widget_content.bar_text = text .. ": " .. tostring(bar_progress) .. "%"

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "completed_stamp",
			start_progress = 0.5,
			end_progress = 0.7,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				WwiseWorld.trigger_event(params.wwise_world, "Play_hud_quest_menu_finish_quest_end_screen_completed")

				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				if params.play_completed then
					local widget_index = params.widget_index
					local widget = widgets[widget_index]
					local widget_content = widget.content
					local widget_style = widget.style
					local anim_progress = math.easeInCubic(progress)
					local alpha = math.min(anim_progress*120 + 20, 120)
					local completed_style = widget_style.texture_completed
					local color = completed_style.color
					color[1] = alpha
					local offset = completed_style.offset
					local size = completed_style.size
					local catmullrom_progress = math.catmullrom(anim_progress, 1.8, 1.8, 1.2, 1.2)
					local default_width = 408
					local default_height = 179
					size[1] = math.floor(default_width*catmullrom_progress)
					size[2] = math.floor(default_height*catmullrom_progress)
					local default_offset_x = 250
					local default_offset_y = 40
					offset[1] = default_offset_x - (size[1] - default_width)*0.5
					offset[2] = default_offset_y - (size[2] - default_height)*0.5
				end

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		},
		{
			name = "delay",
			start_progress = 0.7,
			end_progress = 0.8,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		}
	},
	no_progress = {
		{
			name = "overlay_fade_in",
			start_progress = 0,
			end_progress = 0.5,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local alpha = math.easeOutCubic(progress)*50
				local widget_index = params.widget_index
				local task_index = params.task_index
				local widget = widgets[widget_index]
				local widget_style = widget.style
				local overlay_style = widget_style.overlay
				overlay_style.color[1] = alpha

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		}
	},
	contracts_exit = {
		{
			name = "fade_in",
			start_progress = 0,
			end_progress = 0.6,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local alpha = math.easeCubic(progress)*255 - 255
				local text_alpha = math.easeCubic(progress)*150 - 150
				local overlay_alpha = math.easeCubic(progress)*50 - 50
				local completed_alpha = math.easeCubic(progress)*120 - 120
				local num_widgets = params.num_widgets

				for i = 1, num_widgets, 1 do
					local widget = widgets[i]
					local widget_style = widget.style

					if overlay_alpha < widget_style.overlay.color[1] then
						widget_style.overlay.color[1] = overlay_alpha
					end

					if completed_alpha < widget_style.texture_completed.color[1] then
						widget_style.texture_completed.color[1] = completed_alpha
					end

					widget_style.texture_divider.color[1] = alpha
					widget_style.progress_bar.color[1] = alpha
					widget_style.texture_bg.color[1] = alpha
					widget_style.bar_text.text_color[1] = text_alpha
					widget_style.title_text.text_color[1] = text_alpha
					widget_style.texture_task_marker_1.color[1] = alpha
					widget_style.texture_task_marker_2.color[1] = alpha
					widget_style.texture_task_marker_3.color[1] = alpha
					widget_style.texture_task_icon_1.color[1] = alpha
					widget_style.texture_task_icon_2.color[1] = alpha
					widget_style.texture_task_icon_3.color[1] = alpha
					widget_style.task_text_1.text_color[1] = text_alpha
					widget_style.task_text_2.text_color[1] = text_alpha
					widget_style.task_text_3.text_color[1] = text_alpha
					widget_style.task_value_1.text_color[1] = text_alpha
					widget_style.task_value_2.text_color[1] = text_alpha
					widget_style.task_value_3.text_color[1] = text_alpha
				end

				return 
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return 
			end
		}
	}
}

return {
	scenegraph_definition = scenegraph_definition,
	entry_widget_definitions = entry_widget_definitions,
	widget_definitions = widget_definitions,
	animation_definitions = animation_definitions
}

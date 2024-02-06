﻿-- chunkname: @scripts/ui/hud_ui/item_received_feedback_ui_definitions.lua

local_require("scripts/ui/ui_widgets")

local FONT_SIZE = 18
local MAX_NUMBER_OF_MESSAGES = 1
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
	message_animated_parent = {
		horizontal_alignment = "center",
		parent = "root",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			-300,
			0,
			0,
		},
	},
	message_animated = {
		parent = "message_animated_parent",
		size = {
			0,
			0,
		},
		position = {
			0,
			0,
			0,
		},
	},
	message_animated_dragger = {
		parent = "message_animated",
		size = {
			200,
			50,
		},
		position = {
			0,
			0,
			0,
		},
	},
}
local widget_definitions = {
	message_animated = {
		scenegraph_id = "message_animated",
		element = {
			passes = {
				{
					pass_type = "texture",
					style_id = "icon_1",
					texture_id = "icon_1",
					content_check_function = function (content)
						if not content.icon_1 then
							return false
						end

						return true
					end,
				},
				{
					pass_type = "texture",
					style_id = "icon_2",
					texture_id = "icon_2",
					content_check_function = function (content)
						if not content.icon_2 then
							return false
						end

						return true
					end,
				},
				{
					pass_type = "texture",
					style_id = "icon_3",
					texture_id = "icon_3",
					content_check_function = function (content)
						if not content.icon_3 then
							return false
						end

						return true
					end,
				},
			},
		},
		content = {
			icon_texture = "",
			text = "",
			message_tables = {},
		},
		style = {
			text = {
				dynamic_font = true,
				font_type = "hell_shark",
				horizontal_alignment = "right",
				vertical_alignment = "bottom",
				font_size = FONT_SIZE,
				text_color = Colors.get_table("white"),
				offset = {
					0,
					-25,
					0,
				},
			},
			icon_1 = {
				size = {
					50,
					50,
				},
				offset = {
					0,
					0,
					0,
				},
				color = Colors.get_table("white"),
			},
			icon_2 = {
				size = {
					50,
					50,
				},
				offset = {
					75,
					0,
					0,
				},
				color = Colors.get_table("white"),
			},
			icon_3 = {
				size = {
					50,
					50,
				},
				offset = {
					150,
					0,
					0,
				},
				color = Colors.get_table("white"),
			},
		},
	},
}

local function create_message_widgets(number_of_slots)
	local entries = {}

	for i = 1, number_of_slots do
		local message = {
			scenegraph_id = "message_animated",
			element = {
				passes = {
					{
						pass_type = "texture",
						style_id = "icon_1",
						texture_id = "icon_1",
						content_check_function = function (content)
							if not content.icon_1 then
								return false
							end

							return true
						end,
					},
					{
						pass_type = "texture",
						style_id = "icon_2",
						texture_id = "icon_2",
						content_check_function = function (content)
							if not content.icon_2 then
								return false
							end

							return true
						end,
					},
					{
						pass_type = "texture",
						style_id = "icon_3",
						texture_id = "icon_3",
						content_check_function = function (content)
							if not content.icon_3 then
								return false
							end

							return true
						end,
					},
				},
			},
			content = {
				icon_texture = "hud_tutorial_icon_info",
				text = "",
				message_tables = {},
			},
			style = {
				text = {
					dynamic_font = true,
					font_type = "hell_shark",
					horizontal_alignment = "right",
					vertical_alignment = "bottom",
					font_size = FONT_SIZE,
					text_color = Colors.get_table("white"),
					offset = {
						0,
						-25,
						0,
					},
				},
				icon_1 = {
					size = {
						50,
						50,
					},
					offset = {
						0,
						0,
						0,
					},
					color = Colors.get_table("white"),
				},
				icon_2 = {
					size = {
						50,
						50,
					},
					offset = {
						75,
						0,
						0,
					},
					color = Colors.get_table("white"),
				},
				icon_3 = {
					size = {
						50,
						50,
					},
					offset = {
						150,
						0,
						0,
					},
					color = Colors.get_table("white"),
				},
			},
			offset = {
				0,
				0,
				0,
			},
		}

		entries[i] = message
	end

	return entries
end

local function create_reinforcement_widget(index, scenegraph_id, frame_settings_name, scale, retained_mode)
	scale = scale or 1

	local frame_settings = UIPlayerPortraitFrameSettings[frame_settings_name]
	local default_color = {
		255,
		255,
		255,
		255,
	}
	local default_offset = {
		0,
		0,
		0,
	}
	local widget = {
		element = {},
	}
	local passes = {}
	local content = {
		scale = scale,
		frame_settings_name = frame_settings_name,
	}
	local style = {}
	local text_style_ids = {}
	local widget_length = 150
	local center_icon_name = "icon"

	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = center_icon_name,
		style_id = center_icon_name,
		retained_mode = retained_mode,
	}
	content[center_icon_name] = "icons_placeholder"
	style[center_icon_name] = {
		color = table.clone(default_color),
		offset = {
			widget_length / 2 - 20 - 8,
			-20,
			2,
		},
		size = {
			40,
			40,
		},
	}
	text_style_ids[#text_style_ids + 1] = center_icon_name

	local arrow_name = "arrow"

	passes[#passes + 1] = {
		pass_type = "texture",
		texture_id = arrow_name,
		style_id = arrow_name,
		retained_mode = retained_mode,
	}
	content[arrow_name] = "reinforcement_arrow"
	style[arrow_name] = {
		color = table.clone(default_color),
		offset = {
			0,
			-13,
			1,
		},
		size = {
			35,
			26,
		},
	}
	text_style_ids[#text_style_ids + 1] = arrow_name

	for i = 1, 1 do
		local portrait_offset = {
			0,
			0,
			3,
		}
		local portrait_texture = "icons_placeholder"
		local portrait_size = {
			86,
			108,
		}

		portrait_size[1] = portrait_size[1] * scale
		portrait_size[2] = portrait_size[2] * scale

		local offset = table.clone(default_offset)

		offset[1] = portrait_offset[1] - portrait_size[1] / 2 + offset[1] * scale
		offset[2] = portrait_offset[2] - portrait_size[2] / 2 + offset[2] * scale
		offset[3] = portrait_offset[3]

		local portrait_name = "portrait_" .. i

		passes[#passes + 1] = {
			pass_type = "texture_uv",
			content_id = portrait_name,
			style_id = portrait_name,
			retained_mode = retained_mode,
		}

		local uvs = i == 1 and {
			{
				0,
				0,
			},
			{
				1,
				1,
			},
		} or {
			{
				1,
				0,
			},
			{
				0,
				1,
			},
		}

		content[portrait_name] = {
			texture_id = portrait_texture,
			uvs = uvs,
		}
		style[portrait_name] = {
			color = default_color,
			offset = offset,
			size = portrait_size,
			portrait_offset = portrait_offset,
		}
		text_style_ids[#text_style_ids + 1] = portrait_name
	end

	content.text_style_ids = text_style_ids
	widget.element.passes = passes
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		(index - 1) * 10,
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

local message_widgets = {}

for i = 1, MAX_NUMBER_OF_MESSAGES do
	local widget = create_reinforcement_widget(i, "message_animated", "positive_reinforcement", 1)

	message_widgets[i] = widget
end

return {
	scenegraph_definition = scenegraph_definition,
	animated_message_widget = widget_definitions.message_animated,
	message_widgets = message_widgets,
	MAX_NUMBER_OF_MESSAGES = MAX_NUMBER_OF_MESSAGES,
}

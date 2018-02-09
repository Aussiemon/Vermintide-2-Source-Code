local scenegraph_definition = {
	root = {
		is_root = true,
		position = {
			0,
			0,
			UILayer.popup + 1
		},
		size = {
			1920,
			1080
		}
	},
	base_area = {
		vertical_alignment = "bottom",
		parent = "root",
		horizontal_alignment = "center",
		position = {
			0,
			150,
			10
		},
		size = {
			800,
			110
		}
	},
	multiple_choice_base_area = {
		vertical_alignment = "bottom",
		parent = "base_area",
		horizontal_alignment = "center",
		position = {
			0,
			50,
			1
		}
	},
	timer_rect = {
		vertical_alignment = "center",
		parent = "base_area",
		horizontal_alignment = "center",
		size = {
			100,
			90
		}
	},
	input_rect = {
		vertical_alignment = "top",
		parent = "base_area",
		horizontal_alignment = "center",
		position = {
			0,
			-20,
			0
		},
		size = {
			400,
			50
		}
	},
	vote_rect = {
		vertical_alignment = "bottom",
		parent = "base_area",
		horizontal_alignment = "center",
		position = {
			0,
			20,
			0
		},
		size = {
			600,
			30
		}
	},
	vote_rect_a = {
		horizontal_alignment = "left",
		parent = "vote_rect"
	},
	vote_rect_b = {
		vertical_alignment = "center",
		parent = "vote_rect",
		horizontal_alignment = "right"
	},
	vote_a = {
		vertical_alignment = "center",
		parent = "base_area",
		horizontal_alignment = "left"
	},
	vote_b = {
		vertical_alignment = "center",
		parent = "base_area",
		horizontal_alignment = "right"
	},
	vote_icon = {
		vertical_alignment = "center",
		parent = "vote_rect",
		horizontal_alignment = "center",
		size = {
			30,
			30
		},
		position = {
			0,
			0,
			30
		}
	}
}

local function create_vote_function(vote_data)
	local scenegraph_id = "base_area"
	local vote_template_a = vote_data.vote_template_a
	local vote_template_b = vote_data.vote_template_b
	local vote_texture_a = (vote_template_a and vote_template_a.texture_id) or "twitch_rat_ogre"
	local vote_texture_b = (vote_template_b and vote_template_b.texture_id) or "twitch_healing_draught"
	local vote_input_a = vote_data.inputs[1] or "#A"
	local vote_input_b = vote_data.inputs[2] or "#B"
	local frame_settings = UIFrameSettings.twitch_vote_frame_01
	local widget = {
		element = {}
	}
	local passes = {
		{
			texture_id = "tile_texture_id",
			style_id = "inner_timer_rect",
			pass_type = "shader_tiled_texture"
		},
		{
			texture_id = "frame_texture",
			style_id = "outer_timer_rect",
			pass_type = "texture_frame"
		},
		{
			pass_type = "rect",
			style_id = "inner_vote_area_rect"
		},
		{
			texture_id = "inner_vote_area_glass",
			style_id = "inner_vote_area_glass",
			pass_type = "texture"
		},
		{
			texture_id = "frame_texture",
			style_id = "outer_vote_area_rect",
			pass_type = "texture_frame"
		},
		{
			pass_type = "rect",
			style_id = "inner_input_rect"
		},
		{
			texture_id = "frame_texture",
			style_id = "outer_input_rect",
			pass_type = "texture_frame"
		},
		{
			pass_type = "texture",
			style_id = "vote_a",
			texture_id = "vote_a_texture_id",
			content_check_function = function (content, style)
				style.texture_size[1] = (content.vote_data.vote_percentages[1] or 0)*150*0.5 + 150
				style.texture_size[2] = (content.vote_data.vote_percentages[1] or 0)*143*0.5 + 143
				style.offset[1] = (content.vote_data.vote_percentages[1] or 0)*-150*0.25

				return true
			end
		},
		{
			pass_type = "texture",
			style_id = "vote_b",
			texture_id = "vote_b_texture_id",
			content_check_function = function (content, style)
				style.texture_size[1] = (content.vote_data.vote_percentages[2] or 0)*150*0.5 + 150
				style.texture_size[2] = (content.vote_data.vote_percentages[2] or 0)*143*0.5 + 143
				style.offset[1] = (content.vote_data.vote_percentages[2] or 0)*150*0.25

				return true
			end
		},
		{
			pass_type = "texture",
			style_id = "vote_a_bar",
			texture_id = "vote_a_bar_id",
			content_check_function = function (content, style)
				style.texture_size[1] = (content.vote_data.vote_percentages[1] or 0)*250
				style.offset[1] = style.texture_size[1] - 250

				return true
			end
		},
		{
			pass_type = "texture",
			style_id = "vote_b_bar",
			texture_id = "vote_b_bar_id",
			content_check_function = function (content, style)
				style.texture_size[1] = (content.vote_data.vote_percentages[2] or 0)*250
				style.offset[1] = style.texture_size[1] + -250

				return true
			end
		},
		{
			style_id = "timer",
			pass_type = "text",
			text_id = "timer_text",
			content_check_function = function (content, style)
				if not content.vote_data.timer then
					return false
				end

				local timer = math.abs(math.ceil(content.vote_data.timer))

				if timer <= 0 then
					return false
				end

				content.timer_text = tostring(timer)

				return true
			end
		},
		{
			style_id = "complete_text",
			pass_type = "text",
			text_id = "complete_text"
		},
		{
			style_id = "vote_a_input",
			pass_type = "text",
			text_id = "vote_a_input",
			content_check_function = function (content, style)
				if not content.vote_data.timer then
					return false
				end

				local timer = math.abs(math.ceil(content.vote_data.timer))

				if timer <= 0 then
					return false
				end

				return true
			end
		},
		{
			style_id = "vote_b_input",
			pass_type = "text",
			text_id = "vote_b_input",
			content_check_function = function (content, style)
				if not content.vote_data.timer then
					return false
				end

				local timer = math.abs(math.ceil(content.vote_data.timer))

				if timer <= 0 then
					return false
				end

				return true
			end
		}
	}
	local content = {
		tile_texture_id = "tile_texture_01",
		vote_a_bar_id = "vote_a",
		inner_vote_area_glass = "twitch_frame_glass",
		icon_area_size = 125,
		complete_text = "",
		vote_b_bar_id = "vote_b",
		timer_text = "",
		vote_data = vote_data,
		vote_a_texture_id = vote_texture_a,
		vote_b_texture_id = vote_texture_b,
		vote_a_input = string.upper(vote_input_a),
		vote_b_input = string.upper(vote_input_b),
		frame_texture = frame_settings.texture,
		icon_offsets = {
			-138,
			138
		},
		icon_offset_func = function (content, style, vote_index)
			local base_offset = content.icon_offsets[vote_index]
			local icon_area_size = content.icon_area_size
			local offset = Math.random(base_offset - icon_area_size*0.5, base_offset + icon_area_size*0.5)

			return offset
		end,
		icon_texture_func = function (content, style, vote_index)
			if vote_index == 1 then
				return content.vote_a_texture_id
			else
				return content.vote_b_texture_id
			end

			return 
		end
	}
	local style = {
		inner_timer_rect = {
			vertical_alignment = "bottom",
			scenegraph_id = "base_area",
			horizontal_alignment = "center",
			corner_radius = 10,
			offset = {
				0,
				10,
				20
			},
			texture_size = {
				100,
				90
			},
			tile_size = {
				128,
				128
			},
			tile_offset = {
				true,
				false
			}
		},
		outer_timer_rect = {
			scenegraph_id = "timer_rect",
			vertical_alignment = "bottom",
			horizontal_alignment = "center",
			corner_radius = 10,
			offset = {
				-2,
				-2,
				21
			},
			size = {
				104,
				94
			},
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes
		},
		inner_vote_area_rect = {
			vertical_alignment = "center",
			scenegraph_id = "vote_rect",
			horizontal_alignment = "center",
			corner_radius = 10,
			color = {
				255,
				0,
				0,
				0
			},
			offset = {
				0,
				0,
				6
			},
			size = {
				600,
				30
			}
		},
		inner_vote_area_glass = {
			scenegraph_id = "vote_rect",
			offset = {
				0,
				0,
				8
			},
			texture_size = {
				600,
				24
			}
		},
		outer_vote_area_rect = {
			scenegraph_id = "vote_rect",
			vertical_alignment = "center",
			horizontal_alignment = "center",
			corner_radius = 10,
			offset = {
				-2,
				-2,
				9
			},
			size = {
				604,
				34
			},
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes
		},
		inner_input_rect = {
			vertical_alignment = "center",
			scenegraph_id = "input_rect",
			horizontal_alignment = "center",
			corner_radius = 10,
			color = {
				255,
				20,
				20,
				20
			},
			offset = {
				0,
				0,
				1
			}
		},
		outer_input_rect = {
			scenegraph_id = "input_rect",
			vertical_alignment = "center",
			horizontal_alignment = "center",
			corner_radius = 10,
			offset = {
				-2,
				-2,
				1
			},
			size = {
				404,
				54
			},
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes
		},
		vote_a = {
			vertical_alignment = "center",
			scenegraph_id = "vote_a",
			horizontal_alignment = "left",
			pixel_perfect = false,
			offset = {
				20,
				0,
				10
			},
			texture_size = {
				150,
				143
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		vote_b = {
			vertical_alignment = "center",
			scenegraph_id = "vote_b",
			horizontal_alignment = "right",
			pixel_perfect = false,
			offset = {
				-20,
				0,
				10
			},
			texture_size = {
				150,
				143
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		vote_a_bar = {
			gradient_threshold = 1,
			scenegraph_id = "vote_rect_a",
			texture_size = {
				250,
				30
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
				7
			}
		},
		vote_b_bar = {
			gradient_threshold = 1,
			scenegraph_id = "vote_rect_b",
			horizontal_alignment = "right",
			texture_size = {
				250,
				30
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
				7
			}
		},
		timer = {
			word_wrap = true,
			scenegraph_id = "base_area",
			font_size = 60,
			pixel_perfect = true,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			dynamic_font = true,
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				0,
				21
			}
		},
		complete_text = {
			word_wrap = true,
			scenegraph_id = "base_area",
			font_size = 32,
			pixel_perfect = true,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			dynamic_font = true,
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("white", 0),
			offset = {
				0,
				0,
				25
			}
		},
		vote_a_input = {
			word_wrap = true,
			scenegraph_id = "input_rect",
			font_size = 32,
			pixel_perfect = true,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			dynamic_font = true,
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
			offset = {
				-125,
				5,
				10
			}
		},
		vote_b_input = {
			word_wrap = true,
			scenegraph_id = "input_rect",
			font_size = 32,
			pixel_perfect = true,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			dynamic_font = true,
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
			offset = {
				125,
				5,
				10
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

local portrait_offsets = {
	{
		0
	},
	{
		-55,
		55
	},
	{
		-110,
		0,
		110
	},
	{
		-165,
		-55,
		55,
		165
	},
	{
		-220,
		-110,
		0,
		110,
		220
	}
}
local portrait_size = {
	100,
	130
}

local function create_multiple_vote_function(vote_data, gui)
	local scenegraph_id = "multiple_choice_base_area"
	local max_name_width = 85
	local frame_settings = UIFrameSettings.twitch_vote_frame_01
	local widget = {
		element = {}
	}
	local passes = {
		{
			pass_type = "rect",
			content_id = "precalculate_id",
			content_check_function = function (content, style)
				local content = content.parent
				content.icon_1 = nil
				content.icon_2 = nil
				content.icon_3 = nil
				content.icon_4 = nil
				content.icon_5 = nil
				content.num_players = 0
				content.portrait_offset_index = 1
				local players = Managers.player:human_and_bot_players()

				for _, player in pairs(players) do
					local profile_index = player.profile_index(player)
					local player_profile = SPProfiles[profile_index]
					local career_index = player.career_index(player)

					if player_profile then
						content["icon_" .. profile_index] = true
						content.num_players = content.num_players + 1
						local player_name_id = "icon_" .. profile_index .. "_name"
						local name = player.name(player)
						local name_style = style[player_name_id]
						local cropped_name = UIRenderer.crop_text_width(content.ui_renderer, name, max_name_width, name_style)
						content[player_name_id] = cropped_name
						content[player_name_id .. "_full"] = name
						local career_settings = player_profile.careers[career_index]
						local base_portrait = career_settings.portrait_image
						content["icon_" .. profile_index .. "_texture"] = base_portrait .. "_twitch"
						content["icon_" .. profile_index .. "_masked"] = base_portrait .. "_masked"
						content["icon_" .. profile_index .. "_vote_icon"] = base_portrait .. "_twitch_icon"
					end
				end

				return false
			end
		},
		{
			pass_type = "texture",
			style_id = "icon_1",
			texture_id = "icon_1_texture",
			content_check_function = function (content, style)
				if not content.icon_1 then
					return false
				end

				local offsets = portrait_offsets[content.num_players]
				style.offset[1] = offsets[content.portrait_offset_index]
				content.portrait_offset_index = content.portrait_offset_index + 1

				return true
			end
		},
		{
			pass_type = "texture",
			style_id = "icon_2",
			texture_id = "icon_2_texture",
			content_check_function = function (content, style)
				if not content.icon_2 then
					return false
				end

				local offsets = portrait_offsets[content.num_players]
				style.offset[1] = offsets[content.portrait_offset_index]
				content.portrait_offset_index = content.portrait_offset_index + 1

				return true
			end
		},
		{
			pass_type = "texture",
			style_id = "icon_3",
			texture_id = "icon_3_texture",
			content_check_function = function (content, style)
				if not content.icon_3 then
					return false
				end

				local offsets = portrait_offsets[content.num_players]
				style.offset[1] = offsets[content.portrait_offset_index]
				content.portrait_offset_index = content.portrait_offset_index + 1

				return true
			end
		},
		{
			pass_type = "texture",
			style_id = "icon_4",
			texture_id = "icon_4_texture",
			content_check_function = function (content, style)
				if not content.icon_4 then
					return false
				end

				local offsets = portrait_offsets[content.num_players]
				style.offset[1] = offsets[content.portrait_offset_index]
				content.portrait_offset_index = content.portrait_offset_index + 1

				return true
			end
		},
		{
			pass_type = "texture",
			style_id = "icon_5",
			texture_id = "icon_5_texture",
			content_check_function = function (content, style)
				if not content.icon_5 then
					return false
				end

				local offsets = portrait_offsets[content.num_players]
				style.offset[1] = offsets[content.portrait_offset_index]
				content.portrait_offset_index = content.portrait_offset_index + 1

				return true
			end
		},
		{
			pass_type = "texture",
			style_id = "icon_1_masked",
			texture_id = "icon_1_masked",
			content_check_function = function (content, style)
				if not content.icon_1 then
					return false
				end

				local offsets = portrait_offsets[content.num_players]
				style.offset[1] = style.parent.icon_1.offset[1]

				return true
			end
		},
		{
			pass_type = "texture",
			style_id = "icon_2_masked",
			texture_id = "icon_2_masked",
			content_check_function = function (content, style)
				if not content.icon_2 then
					return false
				end

				local offsets = portrait_offsets[content.num_players]
				style.offset[1] = style.parent.icon_2.offset[1]

				return true
			end
		},
		{
			pass_type = "texture",
			style_id = "icon_3_masked",
			texture_id = "icon_3_masked",
			content_check_function = function (content, style)
				if not content.icon_3 then
					return false
				end

				local offsets = portrait_offsets[content.num_players]
				style.offset[1] = style.parent.icon_3.offset[1]

				return true
			end
		},
		{
			pass_type = "texture",
			style_id = "icon_4_masked",
			texture_id = "icon_4_masked",
			content_check_function = function (content, style)
				if not content.icon_4 then
					return false
				end

				local offsets = portrait_offsets[content.num_players]
				style.offset[1] = style.parent.icon_4.offset[1]

				return true
			end
		},
		{
			pass_type = "texture",
			style_id = "icon_5_masked",
			texture_id = "icon_5_masked",
			content_check_function = function (content, style)
				if not content.icon_5 then
					return false
				end

				local offsets = portrait_offsets[content.num_players]
				style.offset[1] = style.parent.icon_5.offset[1]

				return true
			end
		},
		{
			pass_type = "texture",
			style_id = "icon_1_mask",
			texture_id = "mask",
			content_check_function = function (content, style)
				if not content.icon_1 then
					return false
				end

				local offsets = portrait_offsets[content.num_players]
				style.offset[1] = style.parent.icon_1.offset[1]

				if not content.vote_data.completed then
					style.texture_size[2] = style.base_size[1]*content.vote_data.vote_percentages[1]
				end

				return true
			end
		},
		{
			pass_type = "texture",
			style_id = "icon_2_mask",
			texture_id = "mask",
			content_check_function = function (content, style)
				if not content.icon_2 then
					return false
				end

				local offsets = portrait_offsets[content.num_players]
				style.offset[1] = style.parent.icon_2.offset[1]

				if not content.vote_data.completed then
					style.texture_size[2] = style.base_size[1]*content.vote_data.vote_percentages[2]
				end

				return true
			end
		},
		{
			pass_type = "texture",
			style_id = "icon_3_mask",
			texture_id = "mask",
			content_check_function = function (content, style)
				if not content.icon_3 then
					return false
				end

				local offsets = portrait_offsets[content.num_players]
				style.offset[1] = style.parent.icon_3.offset[1]

				if not content.vote_data.completed then
					style.texture_size[2] = style.base_size[1]*content.vote_data.vote_percentages[3]
				end

				return true
			end
		},
		{
			pass_type = "texture",
			style_id = "icon_4_mask",
			texture_id = "mask",
			content_check_function = function (content, style)
				if not content.icon_4 then
					return false
				end

				local offsets = portrait_offsets[content.num_players]
				style.offset[1] = style.parent.icon_4.offset[1]

				if not content.vote_data.completed then
					style.texture_size[2] = style.base_size[1]*content.vote_data.vote_percentages[4]
				end

				return true
			end
		},
		{
			pass_type = "texture",
			style_id = "icon_5_mask",
			texture_id = "mask",
			content_check_function = function (content, style)
				if not content.icon_5 then
					return false
				end

				local offsets = portrait_offsets[content.num_players]
				style.offset[1] = style.parent.icon_5.offset[1]

				if not content.vote_data.completed then
					style.texture_size[2] = style.base_size[1]*content.vote_data.vote_percentages[5]
				end

				return true
			end
		},
		{
			pass_type = "texture",
			style_id = "icon_1_frame",
			texture_id = "icon_1_frame",
			content_check_function = function (content, style)
				if not content.icon_1 then
					return false
				end

				style.offset[1] = style.parent.icon_1.offset[1]

				return true
			end
		},
		{
			pass_type = "texture",
			style_id = "icon_2_frame",
			texture_id = "icon_2_frame",
			content_check_function = function (content, style)
				if not content.icon_2 then
					return false
				end

				style.offset[1] = style.parent.icon_2.offset[1]

				return true
			end
		},
		{
			pass_type = "texture",
			style_id = "icon_3_frame",
			texture_id = "icon_3_frame",
			content_check_function = function (content, style)
				if not content.icon_3 then
					return false
				end

				style.offset[1] = style.parent.icon_3.offset[1]

				return true
			end
		},
		{
			pass_type = "texture",
			style_id = "icon_4_frame",
			texture_id = "icon_4_frame",
			content_check_function = function (content, style)
				if not content.icon_4 then
					return false
				end

				style.offset[1] = style.parent.icon_4.offset[1]

				return true
			end
		},
		{
			pass_type = "texture",
			style_id = "icon_5_frame",
			texture_id = "icon_5_frame",
			content_check_function = function (content, style)
				if not content.icon_5 then
					return false
				end

				style.offset[1] = style.parent.icon_5.offset[1]

				return true
			end
		},
		{
			pass_type = "texture",
			style_id = "icon_1_frame",
			texture_id = "icon_1_frame_bg",
			content_check_function = function (content, style)
				if not content.icon_1 then
					return false
				end

				style.offset[1] = style.parent.icon_1.offset[1]

				return true
			end
		},
		{
			pass_type = "texture",
			style_id = "icon_2_frame",
			texture_id = "icon_2_frame_bg",
			content_check_function = function (content, style)
				if not content.icon_2 then
					return false
				end

				style.offset[1] = style.parent.icon_2.offset[1]

				return true
			end
		},
		{
			pass_type = "texture",
			style_id = "icon_3_frame",
			texture_id = "icon_3_frame_bg",
			content_check_function = function (content, style)
				if not content.icon_3 then
					return false
				end

				style.offset[1] = style.parent.icon_3.offset[1]

				return true
			end
		},
		{
			pass_type = "texture",
			style_id = "icon_4_frame",
			texture_id = "icon_4_frame_bg",
			content_check_function = function (content, style)
				if not content.icon_4 then
					return false
				end

				style.offset[1] = style.parent.icon_4.offset[1]

				return true
			end
		},
		{
			pass_type = "texture",
			style_id = "icon_5_frame",
			texture_id = "icon_5_frame_bg",
			content_check_function = function (content, style)
				if not content.icon_5 then
					return false
				end

				style.offset[1] = style.parent.icon_5.offset[1]

				return true
			end
		},
		{
			style_id = "icon_1_inner_rect",
			pass_type = "rounded_background",
			content_check_function = function (content, style)
				if not content.icon_1 then
					return false
				end

				style.offset[1] = style.parent.icon_1.offset[1]

				return true
			end
		},
		{
			style_id = "icon_2_inner_rect",
			pass_type = "rounded_background",
			content_check_function = function (content, style)
				if not content.icon_2 then
					return false
				end

				style.offset[1] = style.parent.icon_2.offset[1]

				return true
			end
		},
		{
			style_id = "icon_3_inner_rect",
			pass_type = "rounded_background",
			content_check_function = function (content, style)
				if not content.icon_3 then
					return false
				end

				style.offset[1] = style.parent.icon_3.offset[1]

				return true
			end
		},
		{
			style_id = "icon_4_inner_rect",
			pass_type = "rounded_background",
			content_check_function = function (content, style)
				if not content.icon_4 then
					return false
				end

				style.offset[1] = style.parent.icon_4.offset[1]

				return true
			end
		},
		{
			style_id = "icon_5_inner_rect",
			pass_type = "rounded_background",
			content_check_function = function (content, style)
				if not content.icon_5 then
					return false
				end

				style.offset[1] = style.parent.icon_5.offset[1]

				return true
			end
		},
		{
			texture_id = "frame_texture",
			style_id = "icon_1_outer_rect",
			pass_type = "texture_frame",
			content_check_function = function (content, style)
				if not content.icon_1 then
					return false
				end

				style.offset[1] = style.parent.icon_1.offset[1]

				return true
			end
		},
		{
			texture_id = "frame_texture",
			style_id = "icon_2_outer_rect",
			pass_type = "texture_frame",
			content_check_function = function (content, style)
				if not content.icon_2 then
					return false
				end

				style.offset[1] = style.parent.icon_2.offset[1]

				return true
			end
		},
		{
			texture_id = "frame_texture",
			style_id = "icon_3_outer_rect",
			pass_type = "texture_frame",
			content_check_function = function (content, style)
				if not content.icon_3 then
					return false
				end

				style.offset[1] = style.parent.icon_3.offset[1]

				return true
			end
		},
		{
			texture_id = "frame_texture",
			style_id = "icon_4_outer_rect",
			pass_type = "texture_frame",
			content_check_function = function (content, style)
				if not content.icon_4 then
					return false
				end

				style.offset[1] = style.parent.icon_4.offset[1]

				return true
			end
		},
		{
			texture_id = "frame_texture",
			style_id = "icon_5_outer_rect",
			pass_type = "texture_frame",
			content_check_function = function (content, style)
				if not content.icon_5 then
					return false
				end

				style.offset[1] = style.parent.icon_5.offset[1]

				return true
			end
		},
		{
			style_id = "icon_1_name_inner_rect",
			pass_type = "rounded_background",
			content_check_function = function (content, style)
				if not content.icon_1 then
					return false
				end

				style.offset[1] = style.parent.icon_1.offset[1]

				return true
			end
		},
		{
			texture_id = "frame_texture",
			style_id = "icon_1_name_outer_rect",
			pass_type = "texture_frame",
			content_check_function = function (content, style)
				if not content.icon_1 then
					return false
				end

				style.offset[1] = style.parent.icon_1.offset[1]

				return true
			end
		},
		{
			style_id = "icon_2_name_inner_rect",
			pass_type = "rounded_background",
			content_check_function = function (content, style)
				if not content.icon_2 then
					return false
				end

				style.offset[1] = style.parent.icon_2.offset[1]

				return true
			end
		},
		{
			texture_id = "frame_texture",
			style_id = "icon_2_name_outer_rect",
			pass_type = "texture_frame",
			content_check_function = function (content, style)
				if not content.icon_2 then
					return false
				end

				style.offset[1] = style.parent.icon_2.offset[1]

				return true
			end
		},
		{
			style_id = "icon_3_name_inner_rect",
			pass_type = "rounded_background",
			content_check_function = function (content, style)
				if not content.icon_3 then
					return false
				end

				style.offset[1] = style.parent.icon_3.offset[1]

				return true
			end
		},
		{
			texture_id = "frame_texture",
			style_id = "icon_3_name_outer_rect",
			pass_type = "texture_frame",
			content_check_function = function (content, style)
				if not content.icon_3 then
					return false
				end

				style.offset[1] = style.parent.icon_3.offset[1]

				return true
			end
		},
		{
			style_id = "icon_4_name_inner_rect",
			pass_type = "rounded_background",
			content_check_function = function (content, style)
				if not content.icon_4 then
					return false
				end

				style.offset[1] = style.parent.icon_4.offset[1]

				return true
			end
		},
		{
			texture_id = "frame_texture",
			style_id = "icon_4_name_outer_rect",
			pass_type = "texture_frame",
			content_check_function = function (content, style)
				if not content.icon_4 then
					return false
				end

				style.offset[1] = style.parent.icon_4.offset[1]

				return true
			end
		},
		{
			style_id = "icon_5_name_inner_rect",
			pass_type = "rounded_background",
			content_check_function = function (content, style)
				if not content.icon_5 then
					return false
				end

				style.offset[1] = style.parent.icon_5.offset[1]

				return true
			end
		},
		{
			texture_id = "frame_texture",
			style_id = "icon_5_name_outer_rect",
			pass_type = "texture_frame",
			content_check_function = function (content, style)
				if not content.icon_5 then
					return false
				end

				style.offset[1] = style.parent.icon_5.offset[1]

				return true
			end
		},
		{
			style_id = "icon_1_vote_text",
			pass_type = "text",
			text_id = "icon_1_vote_text",
			content_check_function = function (content, style)
				if not content.icon_1 then
					return false
				end

				style.offset[1] = style.parent.icon_1.offset[1] + 3

				return true
			end
		},
		{
			style_id = "icon_2_vote_text",
			pass_type = "text",
			text_id = "icon_2_vote_text",
			content_check_function = function (content, style)
				if not content.icon_2 then
					return false
				end

				style.offset[1] = style.parent.icon_2.offset[1] + 3

				return true
			end
		},
		{
			style_id = "icon_3_vote_text",
			pass_type = "text",
			text_id = "icon_3_vote_text",
			content_check_function = function (content, style)
				if not content.icon_3 then
					return false
				end

				style.offset[1] = style.parent.icon_3.offset[1] + 3

				return true
			end
		},
		{
			style_id = "icon_4_vote_text",
			pass_type = "text",
			text_id = "icon_4_vote_text",
			content_check_function = function (content, style)
				if not content.icon_4 then
					return false
				end

				style.offset[1] = style.parent.icon_4.offset[1] + 3

				return true
			end
		},
		{
			style_id = "icon_5_vote_text",
			pass_type = "text",
			text_id = "icon_5_vote_text",
			content_check_function = function (content, style)
				if not content.icon_5 then
					return false
				end

				style.offset[1] = style.parent.icon_5.offset[1] + 3

				return true
			end
		},
		{
			style_id = "icon_1_name",
			pass_type = "text",
			text_id = "icon_1_name",
			content_check_function = function (content, style)
				if not content.icon_1 then
					content.icon_1_name = "-"

					return false
				end

				style.offset[1] = style.parent.icon_1.offset[1] + 3

				return true
			end
		},
		{
			style_id = "icon_2_name",
			pass_type = "text",
			text_id = "icon_2_name",
			content_check_function = function (content, style)
				if not content.icon_2 then
					content.icon_2_name = "-"

					return false
				end

				style.offset[1] = style.parent.icon_2.offset[1] + 3

				return true
			end
		},
		{
			style_id = "icon_3_name",
			pass_type = "text",
			text_id = "icon_3_name",
			content_check_function = function (content, style)
				if not content.icon_3 then
					content.icon_3_name = "-"

					return false
				end

				style.offset[1] = style.parent.icon_3.offset[1] + 3

				return true
			end
		},
		{
			style_id = "icon_4_name",
			pass_type = "text",
			text_id = "icon_4_name",
			content_check_function = function (content, style)
				if not content.icon_4 then
					content.icon_4_name = "-"

					return false
				end

				style.offset[1] = style.parent.icon_4.offset[1] + 3

				return true
			end
		},
		{
			style_id = "icon_5_name",
			pass_type = "text",
			text_id = "icon_5_name",
			content_check_function = function (content, style)
				if not content.icon_5 then
					content.icon_5_name = "-"

					return false
				end

				style.offset[1] = style.parent.icon_5.offset[1] + 3

				return true
			end
		},
		{
			texture_id = "inner_rect_texture",
			style_id = "inner_rect",
			pass_type = "shader_tiled_texture",
			content_check_function = function (content, style)
				style.texture_size[1] = content.num_players*110 + 100 + style.extra_texture_size[1]

				return true
			end
		},
		{
			texture_id = "frame_texture",
			style_id = "outer_rect",
			pass_type = "texture_frame",
			content_check_function = function (content, style)
				style.area_size[1] = content.num_players*110 + 100 + style.extra_area_size[1]

				return true
			end
		},
		{
			style_id = "inner_timer_rect",
			pass_type = "rounded_background",
			content_check_function = function (content, style)
				style.offset[1] = (content.num_players*110 + 100)*0.5 + 30 + style.extra_offset[1]

				return true
			end
		},
		{
			texture_id = "frame_texture",
			style_id = "outer_timer_rect",
			pass_type = "texture_frame",
			content_check_function = function (content, style)
				style.offset[1] = (content.num_players*110 + 100)*0.5 + 30 + style.extra_offset[1]

				return true
			end
		},
		{
			style_id = "timer",
			pass_type = "text",
			text_id = "timer_text",
			content_check_function = function (content, style)
				local timer = math.abs(math.ceil(content.vote_data.timer or 30))
				style.offset[1] = (content.num_players*110 + 100)*0.5 + 30
				content.timer_text = tostring(timer)

				return true
			end
		},
		{
			pass_type = "texture",
			style_id = "vote",
			texture_id = "vote_texture_id",
			content_check_function = function (content, style)
				style.offset[1] = ((content.num_players*110 + 100)*0.5 + 30)*-1 + style.extra_offset[1]

				return true
			end
		},
		{
			style_id = "win_text",
			pass_type = "text",
			text_id = "win_text"
		},
		{
			style_id = "name_tag",
			pass_type = "text",
			text_id = "name_tag"
		}
	}
	local content = {
		icon_1_masked = "unit_frame_portrait_victor_zealot_masked",
		icon_4_masked = "unit_frame_portrait_kerillian_shade_masked",
		icon_3_texture = "unit_frame_portrait_bardin_slayer_twitch",
		icon_4_texture = "unit_frame_portrait_kerillian_shade_twitch",
		icon_2_masked = "unit_frame_portrait_sienna_adept_masked",
		icon_2_frame = "portrait_bg_01",
		icon_5_vote_icon = "unit_frame_portrait_kruber_knight_twitch_icon",
		icon_4_vote_icon = "unit_frame_portrait_kerillian_shade_twitch_icon",
		icon_3_vote_icon = "unit_frame_portrait_bardin_slayer_twitch_icon",
		icon_2_vote_icon = "unit_frame_portrait_sienna_adept_twitch_icon",
		icon_1_vote_icon = "unit_frame_portrait_victor_zealot_twitch_icon",
		icon_1_frame = "portrait_bg_01",
		icon_5_frame = "portrait_bg_01",
		icon_5_name = "-",
		icon_5_texture = "unit_frame_portrait_kruber_knight_twitch",
		win_text = "",
		name_tag = "-",
		icon_2_frame_bg = "portrait_frame_hero_selection",
		icon_4_frame_bg = "portrait_frame_hero_selection",
		icon_2_texture = "unit_frame_portrait_sienna_adept_twitch",
		icon_2 = false,
		icon_4 = false,
		icon_3 = false,
		icon_1_name = "-",
		icon_5 = false,
		inner_rect_texture = "tile_texture_01",
		icon_3_frame = "portrait_bg_01",
		icon_1_frame_bg = "portrait_frame_hero_selection",
		icon_3_frame_bg = "portrait_frame_hero_selection",
		mask = "mask_rect",
		icon_3_masked = "unit_frame_portrait_bardin_slayer_masked",
		icon_3_name = "-",
		icon_area_size = 50,
		icon_1 = false,
		icon_1_texture = "unit_frame_portrait_victor_zealot_twitch",
		icon_5_masked = "unit_frame_portrait_kruber_knight_masked",
		timer_text = "",
		icon_4_name = "-",
		icon_5_frame_bg = "portrait_frame_hero_selection",
		icon_4_frame = "portrait_bg_01",
		num_players = 0,
		icon_2_name = "-",
		vote_texture_id = vote_data.vote_template.texture_id,
		vote_data = vote_data or {},
		ui_renderer = {
			gui = gui
		},
		icon_1_vote_text = string.upper(vote_data.inputs[1]),
		icon_2_vote_text = string.upper(vote_data.inputs[2]),
		icon_3_vote_text = string.upper(vote_data.inputs[3]),
		icon_4_vote_text = string.upper(vote_data.inputs[4]),
		icon_5_vote_text = string.upper(vote_data.inputs[5]),
		frame_texture = frame_settings.texture,
		portrait_lookup = {
			"icon_1",
			"icon_2",
			"icon_3",
			"icon_4",
			"icon_5"
		},
		icon_offset_func = function (content, style, vote_index)
			local style = style["icon_" .. vote_index]
			local base_offset = style.offset[1]
			local icon_area_size = content.icon_area_size
			local offset = Math.random(base_offset - icon_area_size*0.5, base_offset + icon_area_size*0.5)

			return offset
		end,
		icon_texture_func = function (content, style, vote_index)
			return content["icon_" .. vote_index .. "_vote_icon"]
		end
	}
	local style = {
		icon_1 = {
			horizontal_alignment = "center",
			texture_size = {
				100,
				130
			},
			offset = {
				0,
				0,
				-4
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		icon_2 = {
			horizontal_alignment = "center",
			texture_size = {
				100,
				130
			},
			offset = {
				0,
				0,
				-4
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		icon_3 = {
			horizontal_alignment = "center",
			texture_size = {
				100,
				130
			},
			offset = {
				0,
				0,
				-4
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		icon_4 = {
			horizontal_alignment = "center",
			texture_size = {
				100,
				130
			},
			offset = {
				0,
				0,
				-4
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		icon_5 = {
			horizontal_alignment = "center",
			texture_size = {
				100,
				130
			},
			offset = {
				0,
				0,
				-4
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		icon_1_masked = {
			horizontal_alignment = "center",
			texture_size = {
				100,
				130
			},
			offset = {
				0,
				0,
				-3
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		icon_2_masked = {
			horizontal_alignment = "center",
			texture_size = {
				100,
				130
			},
			offset = {
				0,
				0,
				-3
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		icon_3_masked = {
			horizontal_alignment = "center",
			texture_size = {
				100,
				130
			},
			offset = {
				0,
				0,
				-3
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		icon_4_masked = {
			horizontal_alignment = "center",
			texture_size = {
				100,
				130
			},
			offset = {
				0,
				0,
				-3
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		icon_5_masked = {
			horizontal_alignment = "center",
			texture_size = {
				100,
				130
			},
			offset = {
				0,
				0,
				-3
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		icon_1_mask = {
			horizontal_alignment = "center",
			texture_size = {
				100,
				130
			},
			offset = {
				0,
				0,
				0
			},
			base_size = {
				100,
				195
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		icon_2_mask = {
			horizontal_alignment = "center",
			texture_size = {
				100,
				130
			},
			offset = {
				0,
				0,
				0
			},
			base_size = {
				100,
				195
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		icon_3_mask = {
			horizontal_alignment = "center",
			texture_size = {
				100,
				130
			},
			offset = {
				0,
				0,
				0
			},
			base_size = {
				100,
				195
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		icon_4_mask = {
			horizontal_alignment = "center",
			texture_size = {
				100,
				130
			},
			offset = {
				0,
				0,
				0
			},
			base_size = {
				100,
				195
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		icon_5_mask = {
			horizontal_alignment = "center",
			texture_size = {
				100,
				130
			},
			offset = {
				0,
				0,
				0
			},
			base_size = {
				100,
				195
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		icon_1_frame = {
			horizontal_alignment = "center",
			texture_size = {
				83,
				83
			},
			offset = {
				0,
				0,
				-5
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		icon_2_frame = {
			horizontal_alignment = "center",
			texture_size = {
				83,
				83
			},
			offset = {
				0,
				0,
				-5
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		icon_3_frame = {
			horizontal_alignment = "center",
			texture_size = {
				83,
				83
			},
			offset = {
				0,
				0,
				-5
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		icon_4_frame = {
			horizontal_alignment = "center",
			texture_size = {
				83,
				83
			},
			offset = {
				0,
				0,
				-5
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		icon_5_frame = {
			horizontal_alignment = "center",
			texture_size = {
				83,
				83
			},
			offset = {
				0,
				0,
				-5
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		icon_1_inner_rect = {
			vertical_alignment = "bottom",
			horizontal_alignment = "center",
			corner_radius = 10,
			color = {
				255,
				16,
				11,
				10
			},
			color = {
				255,
				16,
				11,
				10
			},
			offset = {
				0,
				-30,
				8
			},
			rect_size = {
				60,
				40
			}
		},
		icon_2_inner_rect = {
			vertical_alignment = "bottom",
			horizontal_alignment = "center",
			corner_radius = 10,
			color = {
				255,
				16,
				11,
				10
			},
			offset = {
				0,
				-30,
				9
			},
			rect_size = {
				60,
				40
			}
		},
		icon_3_inner_rect = {
			vertical_alignment = "bottom",
			horizontal_alignment = "center",
			corner_radius = 10,
			color = {
				255,
				16,
				11,
				10
			},
			offset = {
				0,
				-30,
				9
			},
			rect_size = {
				60,
				40
			}
		},
		icon_4_inner_rect = {
			vertical_alignment = "bottom",
			horizontal_alignment = "center",
			corner_radius = 10,
			color = {
				255,
				16,
				11,
				10
			},
			offset = {
				0,
				-30,
				9
			},
			rect_size = {
				60,
				40
			}
		},
		icon_5_inner_rect = {
			vertical_alignment = "bottom",
			horizontal_alignment = "center",
			corner_radius = 10,
			color = {
				255,
				16,
				11,
				10
			},
			offset = {
				0,
				-30,
				9
			},
			rect_size = {
				60,
				40
			}
		},
		icon_1_outer_rect = {
			corner_radius = 10,
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			area_size = {
				64,
				44
			},
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				-2,
				-32,
				9
			},
			extra_offset = {
				0,
				0,
				0
			},
			extra_area_size = {
				0,
				0,
				0
			}
		},
		icon_2_outer_rect = {
			corner_radius = 10,
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			area_size = {
				64,
				44
			},
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				-2,
				-32,
				9
			},
			extra_offset = {
				0,
				0,
				0
			},
			extra_area_size = {
				0,
				0,
				0
			}
		},
		icon_3_outer_rect = {
			corner_radius = 10,
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			area_size = {
				64,
				44
			},
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				-2,
				-32,
				9
			},
			extra_offset = {
				0,
				0,
				0
			},
			extra_area_size = {
				0,
				0,
				0
			}
		},
		icon_4_outer_rect = {
			corner_radius = 10,
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			area_size = {
				64,
				44
			},
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				-2,
				-32,
				9
			},
			extra_offset = {
				0,
				0,
				0
			},
			extra_area_size = {
				0,
				0,
				0
			}
		},
		icon_5_outer_rect = {
			corner_radius = 10,
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			area_size = {
				64,
				44
			},
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				-2,
				-32,
				9
			},
			extra_offset = {
				0,
				0,
				0
			},
			extra_area_size = {
				0,
				0,
				0
			}
		},
		inner_rect = {
			vertical_alignment = "center",
			corner_radius = 10,
			horizontal_alignment = "center",
			texture_size = {
				0,
				60
			},
			extra_texture_size = {
				0,
				0,
				0
			},
			offset = {
				0,
				-65,
				-7
			},
			tile_size = {
				128,
				128
			},
			tile_offset = {
				true,
				false
			}
		},
		outer_rect = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			area_size = {
				4,
				64
			},
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
				-65,
				-6
			},
			extra_offset = {
				0,
				0,
				0
			},
			extra_size = {
				0,
				0,
				0
			},
			extra_area_size = {
				0,
				0,
				0
			}
		},
		icon_1_name_inner_rect = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			corner_radius = 10,
			color = {
				255,
				16,
				11,
				10
			},
			rect_size = {
				100,
				30
			},
			offset = {
				0,
				-102,
				11
			}
		},
		icon_1_name_outer_rect = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			area_size = {
				104,
				34
			},
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
				-102,
				11
			},
			extra_offset = {
				0,
				0,
				0
			},
			extra_size = {
				0,
				0,
				0
			},
			extra_area_size = {
				0,
				0,
				0
			}
		},
		icon_2_name_inner_rect = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			corner_radius = 10,
			color = {
				255,
				16,
				11,
				10
			},
			rect_size = {
				100,
				30
			},
			offset = {
				0,
				-102,
				10
			}
		},
		icon_2_name_outer_rect = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			area_size = {
				104,
				34
			},
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
				-102,
				11
			},
			extra_offset = {
				0,
				0,
				0
			},
			extra_size = {
				0,
				0,
				0
			},
			extra_area_size = {
				0,
				0,
				0
			}
		},
		icon_3_name_inner_rect = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			corner_radius = 10,
			color = {
				255,
				16,
				11,
				10
			},
			rect_size = {
				100,
				30
			},
			offset = {
				0,
				-102,
				10
			}
		},
		icon_3_name_outer_rect = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			area_size = {
				104,
				34
			},
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
				-102,
				11
			},
			extra_offset = {
				0,
				0,
				0
			},
			extra_size = {
				0,
				0,
				0
			},
			extra_area_size = {
				0,
				0,
				0
			}
		},
		icon_4_name_inner_rect = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			corner_radius = 10,
			color = {
				255,
				16,
				11,
				10
			},
			rect_size = {
				100,
				30
			},
			offset = {
				0,
				-102,
				10
			}
		},
		icon_4_name_outer_rect = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			area_size = {
				104,
				34
			},
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
				-102,
				11
			},
			extra_offset = {
				0,
				0,
				0
			},
			extra_size = {
				0,
				0,
				0
			},
			extra_area_size = {
				0,
				0,
				0
			}
		},
		icon_5_name_inner_rect = {
			vertical_alignment = "center",
			horizontal_alignment = "center",
			corner_radius = 10,
			color = {
				255,
				16,
				11,
				10
			},
			rect_size = {
				100,
				30
			},
			offset = {
				0,
				-102,
				10
			}
		},
		icon_5_name_outer_rect = {
			horizontal_alignment = "center",
			vertical_alignment = "center",
			area_size = {
				104,
				34
			},
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
				-102,
				11
			},
			extra_offset = {
				0,
				0,
				0
			},
			extra_size = {
				0,
				0,
				0
			},
			extra_area_size = {
				0,
				0,
				0
			}
		},
		inner_timer_rect = {
			vertical_alignment = "bottom",
			corner_radius = 10,
			horizontal_alignment = "center",
			color = {
				255,
				16,
				11,
				10
			},
			offset = {
				-20,
				-60,
				-2
			},
			extra_offset = {
				0,
				0,
				0
			},
			extra_rect_size = {
				0,
				0,
				0
			},
			rect_size = {
				120,
				100
			}
		},
		outer_timer_rect = {
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			corner_radius = 10,
			area_size = {
				124,
				105
			},
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255
			},
			offset = {
				-18,
				-62,
				-1
			},
			extra_offset = {
				0,
				0,
				0
			},
			extra_size = {
				0,
				0,
				0
			}
		},
		vote = {
			vertical_alignment = "bottom",
			horizontal_alignment = "center",
			pixel_perfect = false,
			offset = {
				0,
				-65,
				10
			},
			extra_offset = {
				0,
				0,
				0
			},
			texture_size = {
				135,
				128.70000000000002
			},
			color = {
				255,
				255,
				255,
				255
			}
		},
		timer = {
			word_wrap = true,
			font_size = 60,
			pixel_perfect = true,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			dynamic_font = true,
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				-65,
				22
			}
		},
		icon_1_vote_text = {
			word_wrap = true,
			font_size = 28,
			pixel_perfect = true,
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			dynamic_font = true,
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
			offset = {
				0,
				-32,
				10
			}
		},
		icon_2_vote_text = {
			word_wrap = true,
			font_size = 28,
			pixel_perfect = true,
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			dynamic_font = true,
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
			offset = {
				0,
				-32,
				10
			}
		},
		icon_3_vote_text = {
			word_wrap = true,
			font_size = 28,
			pixel_perfect = true,
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			dynamic_font = true,
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
			offset = {
				0,
				-32,
				10
			}
		},
		icon_4_vote_text = {
			word_wrap = true,
			font_size = 28,
			pixel_perfect = true,
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			dynamic_font = true,
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
			offset = {
				0,
				-32,
				10
			}
		},
		icon_5_vote_text = {
			word_wrap = true,
			font_size = 28,
			pixel_perfect = true,
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			dynamic_font = true,
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("cheeseburger", 255),
			offset = {
				0,
				-32,
				10
			}
		},
		icon_1_name = {
			word_wrap = true,
			font_size = 18,
			pixel_perfect = true,
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			dynamic_font = true,
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				-60,
				15
			}
		},
		icon_2_name = {
			word_wrap = true,
			font_size = 18,
			pixel_perfect = true,
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			dynamic_font = true,
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				-60,
				15
			}
		},
		icon_3_name = {
			word_wrap = true,
			font_size = 18,
			pixel_perfect = true,
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			dynamic_font = true,
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				-60,
				15
			}
		},
		icon_4_name = {
			word_wrap = true,
			font_size = 18,
			pixel_perfect = true,
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			dynamic_font = true,
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				-60,
				15
			}
		},
		icon_5_name = {
			word_wrap = true,
			font_size = 18,
			pixel_perfect = true,
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			dynamic_font = true,
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("white", 255),
			offset = {
				0,
				-60,
				15
			}
		},
		win_text = {
			word_wrap = true,
			font_size = 32,
			pixel_perfect = true,
			horizontal_alignment = "center",
			vertical_alignment = "bottom",
			dynamic_font = true,
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("white", 0),
			offset = {
				0,
				-30,
				15
			}
		},
		name_tag = {
			word_wrap = true,
			font_size = 18,
			pixel_perfect = true,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			dynamic_font = true,
			font_type = "hell_shark",
			text_color = Colors.get_color_table_with_alpha("white", 0),
			offset = {
				315,
				-5,
				15
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

return {
	widgets = {},
	scenegraph_definition = scenegraph_definition,
	create_vote_function = create_vote_function,
	create_multiple_vote_function = create_multiple_vote_function
}

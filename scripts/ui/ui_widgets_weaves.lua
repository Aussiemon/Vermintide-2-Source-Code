﻿-- chunkname: @scripts/ui/ui_widgets_weaves.lua

UIWidgets = UIWidgets or {}

UIWidgets.create_leaderboard_entry_definition = function (scenegraph_id, size, masked)
	local background_spacing = 8
	local width_spacing = 4
	local ranking_size = {
		math.floor(size[1] * 0.18),
		size[2],
	}
	local weave_size = {
		math.floor(size[1] * 0.1),
		size[2],
	}
	local score_size = {
		math.floor(size[1] * 0.15),
		size[2],
	}
	local background_height = ranking_size[2] - background_spacing
	local career_icon_size = {
		background_height,
		background_height,
	}
	local spare_width = size[1] - (ranking_size[1] + weave_size[1] + score_size[1] + width_spacing * 3)
	local name_size = {
		math.floor(spare_width),
		size[2],
	}
	local ranking_offset = {
		0,
		0,
		0,
	}
	local name_offset = {
		ranking_offset[2] + ranking_size[1] + width_spacing,
		0,
		0,
	}
	local weave_offset = {
		name_offset[1] + name_size[1] + width_spacing,
		0,
		0,
	}
	local score_offset = {
		weave_offset[1] + weave_size[1] + width_spacing,
		0,
		0,
	}
	local frame_name = "menu_frame_17"
	local frame_settings = UIFrameSettings[frame_name]
	local local_player_color = {
		50,
		100,
		65,
		164,
	}
	local passes = {
		{
			content_id = "button_hotspot",
			pass_type = "hotspot",
			style_id = "name_frame",
		},
		{
			pass_type = "texture",
			style_id = "ranking_background_local_player",
			texture_id = "background",
			content_check_function = function (content)
				return content.local_player
			end,
		},
		{
			pass_type = "texture",
			style_id = "ranking_background",
			texture_id = "background",
			content_check_function = function (content)
				return not content.local_player
			end,
			content_change_function = function (content, style)
				if IS_WINDOWS then
					return
				end

				style.color = content.button_hotspot.is_hover and style.selected_color or style.base_color
			end,
		},
		{
			pass_type = "texture_frame",
			style_id = "ranking_frame",
			texture_id = "frame",
		},
		{
			pass_type = "text",
			style_id = "ranking",
			text_id = "ranking",
		},
		{
			pass_type = "text",
			style_id = "ranking_shadow",
			text_id = "ranking",
		},
		{
			pass_type = "texture",
			style_id = "name_background_local_player",
			texture_id = "background",
			content_check_function = function (content)
				return content.local_player
			end,
		},
		{
			pass_type = "texture",
			style_id = "name_background",
			texture_id = "background",
			content_check_function = function (content)
				return not content.local_player
			end,
			content_change_function = function (content, style)
				if IS_WINDOWS then
					return
				end

				style.color = content.button_hotspot.is_hover and style.selected_color or style.base_color
			end,
		},
		{
			pass_type = "texture_frame",
			style_id = "name_frame",
			texture_id = "frame",
		},
		{
			pass_type = "texture",
			style_id = "career_icon",
			texture_id = "career_icon",
			content_check_function = function (content)
				return content.career_icon
			end,
		},
		{
			pass_type = "text",
			style_id = "name",
			text_id = "name",
		},
		{
			pass_type = "text",
			style_id = "name_shadow",
			text_id = "name",
		},
		{
			pass_type = "texture",
			style_id = "weave_background_local_player",
			texture_id = "background",
			content_check_function = function (content)
				return content.local_player
			end,
		},
		{
			pass_type = "texture",
			style_id = "weave_background",
			texture_id = "background",
			content_check_function = function (content)
				return not content.local_player
			end,
			content_change_function = function (content, style)
				if IS_WINDOWS then
					return
				end

				style.color = content.button_hotspot.is_hover and style.selected_color or style.base_color
			end,
		},
		{
			pass_type = "texture_frame",
			style_id = "weave_frame",
			texture_id = "frame",
		},
		{
			pass_type = "text",
			style_id = "weave",
			text_id = "weave",
		},
		{
			pass_type = "text",
			style_id = "weave_shadow",
			text_id = "weave",
		},
		{
			pass_type = "texture",
			style_id = "score_background_local_player",
			texture_id = "background",
			content_check_function = function (content)
				return content.local_player
			end,
		},
		{
			pass_type = "texture",
			style_id = "score_background",
			texture_id = "background",
			content_check_function = function (content)
				return not content.local_player
			end,
			content_change_function = function (content, style)
				if IS_WINDOWS then
					return
				end

				style.color = content.button_hotspot.is_hover and style.selected_color or style.base_color
			end,
		},
		{
			pass_type = "texture_frame",
			style_id = "score_frame",
			texture_id = "frame",
		},
		{
			pass_type = "text",
			style_id = "score",
			text_id = "score",
		},
		{
			pass_type = "text",
			style_id = "score_shadow",
			text_id = "score",
		},
	}
	local content = {
		career_icon = "icons_placeholder",
		local_player = false,
		name = "Unassigned",
		ranking = "000",
		score = "000",
		weave = "000",
		button_hotspot = {
			allow_multi_hover = false,
		},
		background = masked and "rect_masked" or "simple_rect_texture",
		frame = frame_settings.texture,
		size = size,
	}
	local style = {
		ranking = {
			dynamic_font_size = true,
			font_size = 22,
			horizontal_alignment = "center",
			localize = false,
			upper_case = true,
			vertical_alignment = "center",
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			size = ranking_size,
			offset = {
				ranking_offset[1],
				ranking_offset[2],
				ranking_offset[3] + 2,
			},
		},
		ranking_shadow = {
			dynamic_font_size = true,
			font_size = 22,
			horizontal_alignment = "center",
			localize = false,
			upper_case = true,
			vertical_alignment = "center",
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			size = ranking_size,
			offset = {
				ranking_offset[1] + 2,
				ranking_offset[2] - 2,
				ranking_offset[3] + 1,
			},
		},
		ranking_frame = {
			masked = masked,
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = ranking_offset,
			size = ranking_size,
		},
		ranking_background = {
			masked = masked,
			size = {
				ranking_size[1] - background_spacing,
				ranking_size[2] - background_spacing,
			},
			base_color = {
				120,
				0,
				0,
				0,
			},
			selected_color = {
				120,
				128,
				128,
				128,
			},
			color = {
				120,
				0,
				0,
				0,
			},
			offset = {
				ranking_offset[1] + background_spacing / 2,
				ranking_offset[2] + background_spacing / 2,
				ranking_offset[3],
			},
		},
		ranking_background_local_player = {
			masked = masked,
			size = {
				ranking_size[1] - background_spacing,
				ranking_size[2] - background_spacing,
			},
			color = local_player_color,
			offset = {
				ranking_offset[1] + background_spacing / 2,
				ranking_offset[2] + background_spacing / 2,
				ranking_offset[3],
			},
		},
		name = {
			dynamic_font_size = true,
			font_size = 22,
			horizontal_alignment = "left",
			localize = false,
			upper_case = false,
			vertical_alignment = "center",
			font_type = masked and "arial_masked" or "arial",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			size = {
				name_size[1] - (career_icon_size[1] + 30),
				name_size[2],
			},
			offset = {
				name_offset[1] + career_icon_size[1] + 15,
				name_offset[2],
				name_offset[3] + 2,
			},
		},
		name_shadow = {
			dynamic_font_size = true,
			font_size = 22,
			horizontal_alignment = "left",
			localize = false,
			upper_case = false,
			vertical_alignment = "center",
			font_type = masked and "arial_masked" or "arial",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			size = {
				name_size[1] - (career_icon_size[2] + 30),
				name_size[2],
			},
			offset = {
				name_offset[1] + career_icon_size[1] + 17,
				name_offset[2] - 2,
				name_offset[3] + 1,
			},
		},
		name_frame = {
			masked = masked,
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = name_offset,
			size = name_size,
		},
		name_background = {
			masked = masked,
			size = {
				name_size[1] - background_spacing,
				name_size[2] - background_spacing,
			},
			base_color = {
				120,
				0,
				0,
				0,
			},
			selected_color = {
				120,
				128,
				128,
				128,
			},
			color = {
				120,
				0,
				0,
				0,
			},
			offset = {
				name_offset[1] + background_spacing / 2,
				name_offset[2] + background_spacing / 2,
				name_offset[3],
			},
		},
		name_background_local_player = {
			masked = masked,
			size = {
				name_size[1] - background_spacing,
				name_size[2] - background_spacing,
			},
			color = local_player_color,
			offset = {
				name_offset[1] + background_spacing / 2,
				name_offset[2] + background_spacing / 2,
				name_offset[3],
			},
		},
		career_icon = {
			masked = masked,
			size = career_icon_size,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = {
				name_offset[1] + background_spacing / 2,
				name_offset[2] + background_spacing / 2,
				name_offset[3],
			},
		},
		weave = {
			dynamic_font_size = true,
			font_size = 22,
			horizontal_alignment = "center",
			localize = false,
			upper_case = true,
			vertical_alignment = "center",
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			size = weave_size,
			offset = {
				weave_offset[1],
				weave_offset[2],
				weave_offset[3] + 2,
			},
		},
		weave_shadow = {
			dynamic_font_size = true,
			font_size = 22,
			horizontal_alignment = "center",
			localize = false,
			upper_case = true,
			vertical_alignment = "center",
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			size = weave_size,
			offset = {
				weave_offset[1] + 2,
				weave_offset[2] - 2,
				weave_offset[3] + 1,
			},
		},
		weave_frame = {
			masked = masked,
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = weave_offset,
			size = weave_size,
		},
		weave_background = {
			masked = masked,
			size = {
				weave_size[1] - background_spacing,
				weave_size[2] - background_spacing,
			},
			base_color = {
				120,
				0,
				0,
				0,
			},
			selected_color = {
				120,
				128,
				128,
				128,
			},
			color = {
				120,
				0,
				0,
				0,
			},
			offset = {
				weave_offset[1] + background_spacing / 2,
				weave_offset[2] + background_spacing / 2,
				weave_offset[3],
			},
		},
		weave_background_local_player = {
			masked = masked,
			size = {
				weave_size[1] - background_spacing,
				weave_size[2] - background_spacing,
			},
			color = local_player_color,
			offset = {
				weave_offset[1] + background_spacing / 2,
				weave_offset[2] + background_spacing / 2,
				weave_offset[3],
			},
		},
		score = {
			dynamic_font_size = true,
			font_size = 22,
			horizontal_alignment = "center",
			localize = false,
			upper_case = true,
			vertical_alignment = "center",
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("font_default", 255),
			size = score_size,
			offset = {
				score_offset[1],
				score_offset[2],
				score_offset[3] + 2,
			},
		},
		score_shadow = {
			dynamic_font_size = true,
			font_size = 22,
			horizontal_alignment = "center",
			localize = false,
			upper_case = true,
			vertical_alignment = "center",
			font_type = masked and "hell_shark_masked" or "hell_shark",
			text_color = Colors.get_color_table_with_alpha("black", 255),
			size = score_size,
			offset = {
				score_offset[1] + 2,
				score_offset[2] - 2,
				score_offset[3] + 1,
			},
		},
		score_frame = {
			masked = masked,
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			color = {
				255,
				255,
				255,
				255,
			},
			offset = score_offset,
			size = score_size,
		},
		score_background = {
			masked = masked,
			size = {
				score_size[1] - background_spacing,
				score_size[2] - background_spacing,
			},
			base_color = {
				120,
				0,
				0,
				0,
			},
			selected_color = {
				120,
				128,
				128,
				128,
			},
			color = {
				120,
				0,
				0,
				0,
			},
			offset = {
				score_offset[1] + background_spacing / 2,
				score_offset[2] + background_spacing / 2,
				score_offset[3],
			},
		},
		score_background_local_player = {
			masked = masked,
			size = {
				score_size[1] - background_spacing,
				score_size[2] - background_spacing,
			},
			color = local_player_color,
			offset = {
				score_offset[1] + background_spacing / 2,
				score_offset[2] + background_spacing / 2,
				score_offset[3],
			},
		},
	}
	local widget = {}
	local element = {}

	element.passes = passes
	widget.element = element
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0,
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

UIWidgets.create_leaderboard_loading_icon = function (scenegraph_id, overlay_scenegraph_ids, optional_loading_texture)
	local loading_texture = optional_loading_texture or "loot_loading"
	local loading_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(loading_texture)
	local loading_texture_size = loading_texture_settings.size
	local passes = {
		{
			pass_type = "rotated_texture",
			style_id = "texture_id",
			texture_id = "texture_id",
			content_change_function = function (content, style, _, dt)
				local progress = style.progress or 0

				progress = (progress + dt) % 1

				local angle = math.pow(2, math.smoothstep(progress, 0, 1)) * (math.pi * 2)

				style.angle = angle
				style.progress = progress
			end,
		},
	}
	local content = {
		texture_id = loading_texture,
	}
	local style = {
		texture_id = {
			angle = 0,
			horizontal_alignment = "center",
			vertical_alignment = "center",
			texture_size = {
				loading_texture_size[1],
				loading_texture_size[2],
			},
			pivot = {
				loading_texture_size[1] / 2,
				loading_texture_size[2] / 2,
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
				1,
			},
		},
	}

	if overlay_scenegraph_ids then
		for i = 1, #overlay_scenegraph_ids do
			local style_id = "overlay_" .. i
			local overlay_scenegraph_id = overlay_scenegraph_ids[i]
			local pass = {
				pass_type = "rect",
				style_id = style_id,
			}

			table.insert(passes, pass)

			style[style_id] = {
				scenegraph_id = overlay_scenegraph_id,
				color = {
					200,
					10,
					10,
					10,
				},
				offset = {
					0,
					0,
					19,
				},
			}
		end
	end

	local widget = {}
	local element = {}

	element.passes = passes
	widget.element = element
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0,
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

UIWidgets.create_leaderboard_error_icon = function (scenegraph_id, overlay_scenegraph_ids)
	local passes = {
		{
			pass_type = "texture",
			style_id = "texture_id",
			texture_id = "texture_id",
		},
	}
	local content = {
		texture_id = "icon_connection_lost",
	}
	local style = {
		texture_id = {
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
	}

	for i = 1, #overlay_scenegraph_ids do
		local style_id = "overlay_" .. i
		local overlay_scenegraph_id = overlay_scenegraph_ids[i]
		local pass = {
			pass_type = "rect",
			style_id = style_id,
		}

		table.insert(passes, pass)

		style[style_id] = {
			scenegraph_id = overlay_scenegraph_id,
			color = {
				200,
				10,
				10,
				10,
			},
			offset = {
				0,
				0,
				19,
			},
		}
	end

	local widget = {}
	local element = {}

	element.passes = passes
	widget.element = element
	widget.content = content
	widget.style = style
	widget.offset = {
		0,
		0,
		0,
	}
	widget.scenegraph_id = scenegraph_id

	return widget
end

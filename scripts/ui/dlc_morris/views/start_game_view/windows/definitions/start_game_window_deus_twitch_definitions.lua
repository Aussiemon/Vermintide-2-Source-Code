-- chunkname: @scripts/ui/dlc_morris/views/start_game_view/windows/definitions/start_game_window_deus_twitch_definitions.lua

local window_default_settings = UISettings.game_start_windows
local window_frame = window_default_settings.frame
local window_size = window_default_settings.size
local window_frame_height = UIFrameSettings[window_frame].texture_sizes.horizontal[2]
local game_option_size = {
	window_size[1],
	194,
}
local window_text_width = window_size[1]
local login_text_area_size = {
	window_text_width - 20 - 160,
	50,
}
local journey_widget_settings = {
	spacing_x = 40,
	width = 72,
}
local animation_definitions = {
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
	on_exit = {
		{
			end_progress = 0.3,
			name = "fade_out",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				params.render_settings.alpha_multiplier = 1
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				params.render_settings.alpha_multiplier = 1
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	right_arrow_flick = {
		{
			end_progress = 0.6,
			name = "right_arrow_flick",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				params.right_key.color[1] = 255 * (1 - math.easeOutCubic(progress))
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				widgets.content.right_arrow_pressed = false
			end,
		},
	},
	left_arrow_flick = {
		{
			end_progress = 0.6,
			name = "left_arrow_flick",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				params.left_key.color[1] = 255 * (1 - math.easeOutCubic(progress))
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				widgets.content.left_arrow_pressed = false
			end,
		},
	},
	gamemode_text_swap = {
		{
			end_progress = 0.2,
			name = "gamemode_swap_text_fade_out",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)

				widgets.style.game_mode_text.text_color[1] = 255 * (1 - anim_progress)
				widgets.style.press_key_text.text_color[1] = 255 * (1 - anim_progress)
				widgets.style.expedition_highlight_text.text_color[1] = 255 * (1 - anim_progress)

				if widgets.content.show_note then
					widgets.style.note_text.text_color[1] = 255 * (1 - anim_progress)
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
		{
			end_progress = 0.4,
			name = "gamemode_swap_text_fade_in",
			start_progress = 0.2,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				if widgets.content.is_showing_info then
					widgets.content.game_mode_text = Localize("expedition_info")
					widgets.content.show_note = true
				else
					widgets.content.game_mode_text = Localize("start_game_window_deus_twitch_desc")
					widgets.content.show_note = false
				end

				widgets.style.game_mode_text.text_color[1] = 255 * math.easeOutCubic(progress)
				widgets.style.press_key_text.text_color[1] = 255 * math.easeOutCubic(progress)
				widgets.style.expedition_highlight_text.text_color[1] = 255 * math.easeOutCubic(progress)

				if widgets.content.show_note then
					widgets.style.note_text.text_color[1] = 255 * math.easeOutCubic(progress)
				end
			end,
			on_complete = function (ui_scenegraph, scenegraph_definition, widgets, params)
				return
			end,
		},
	},
	difficulty_info_enter = {
		{
			end_progress = 0.6,
			name = "difficulty_info_enter",
			start_progress = 0,
			init = function (ui_scenegraph, scenegraph_definition, widgets, params)
				widgets.difficulty_info.content.visible = true

				local diff_info_style = widgets.difficulty_info.style

				diff_info_style.background.color[1] = 0
				diff_info_style.border.color[1] = 0
				diff_info_style.difficulty_description.text_color[1] = 0
				diff_info_style.highest_obtainable_level.text_color[1] = 0
				diff_info_style.difficulty_separator.color[1] = 0
			end,
			update = function (ui_scenegraph, scenegraph_definition, widgets, progress, params)
				local anim_progress = math.easeOutCubic(progress)
				local diff_info = widgets.difficulty_info
				local diff_info_style = widgets.difficulty_info.style
				local diff_info_content = widgets.difficulty_info.content

				diff_info.offset[1] = 50 * anim_progress
				widgets.upsell_button.offset[1] = 50 * anim_progress

				local alpha = 200 * anim_progress

				diff_info_style.background.color[1] = alpha
				diff_info_style.border.color[1] = alpha
				alpha = 255 * anim_progress
				diff_info_style.difficulty_description.text_color[1] = alpha
				diff_info_style.highest_obtainable_level.text_color[1] = alpha
				diff_info_style.difficulty_separator.color[1] = alpha

				if diff_info_content.should_show_diff_lock_text then
					diff_info_style.difficulty_lock_text.text_color[1] = alpha
				end

				if diff_info_content.should_show_dlc_lock then
					diff_info_style.dlc_lock_text.text_color[1] = alpha
				end
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
	root_fit = {
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
	menu_root = {
		horizontal_alignment = "center",
		parent = "root",
		vertical_alignment = "center",
		size = {
			1920,
			1080,
		},
		position = {
			0,
			0,
			0,
		},
	},
	window = {
		horizontal_alignment = "left",
		parent = "menu_root",
		vertical_alignment = "center",
		size = {
			window_size[1],
			window_size[2] + 100,
		},
		position = {
			220,
			-50,
			1,
		},
	},
	level_root_node = {
		horizontal_alignment = "left",
		parent = "window",
		vertical_alignment = "center",
		size = {
			0,
			0,
		},
		position = {
			285,
			40,
			10,
		},
	},
	brush_stroke = {
		horizontal_alignment = "left",
		parent = "level_root_node",
		vertical_alignment = "center",
		size = {
			700,
			100,
		},
		position = {
			-390,
			-10,
			0,
		},
	},
	window_game_mode_root = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = {
			window_size[1],
			window_frame_height,
		},
		position = {
			0,
			-window_frame_height,
			1,
		},
	},
	login_text_area = {
		horizontal_alignment = "center",
		parent = "twitch_background",
		vertical_alignment = "bottom",
		size = {
			window_text_width,
			50,
		},
		position = {
			0,
			80,
			1,
		},
	},
	login_text_frame = {
		horizontal_alignment = "left",
		parent = "login_text_area",
		vertical_alignment = "center",
		size = login_text_area_size,
		position = {
			10,
			0,
			1,
		},
	},
	login_text_box = {
		horizontal_alignment = "center",
		parent = "login_text_frame",
		vertical_alignment = "center",
		size = {
			300,
			42,
		},
		position = {
			0,
			0,
			1,
		},
	},
	twitch_background = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = {
			window_size[1] + 70,
			280,
		},
		position = {
			0,
			-75,
			1,
		},
	},
	twitch_texture = {
		horizontal_alignment = "center",
		parent = "twitch_background",
		vertical_alignment = "top",
		size = {
			130,
			29,
		},
		position = {
			0,
			45,
			2,
		},
	},
	client_disclaimer_background = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "top",
		size = {
			window_size[1] + 70,
			150,
		},
		position = {
			0,
			-380,
			1,
		},
	},
	client_disclaimer_description = {
		horizontal_alignment = "center",
		parent = "client_disclaimer_background",
		vertical_alignment = "center",
		size = {
			window_text_width,
			100,
		},
		position = {
			0,
			0,
			1,
		},
	},
	game_option_3 = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1],
			game_option_size[2],
		},
		position = {
			-15,
			-15,
			1,
		},
	},
	game_option_2 = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1],
			game_option_size[2],
		},
		position = {
			-15,
			-15 + game_option_size[2],
			1,
		},
	},
	game_option_1 = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1],
			game_option_size[2],
		},
		position = {
			-15,
			-15 + game_option_size[2] * 2,
			1,
		},
	},
	play_button = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1],
			72,
		},
		position = {
			0,
			60,
			1,
		},
	},
	difficulty_stepper = {
		horizontal_alignment = "center",
		parent = "window",
		vertical_alignment = "bottom",
		size = {
			game_option_size[1],
			game_option_size[2] + 22,
		},
		position = {
			0,
			165,
			1,
		},
	},
	difficulty_info = {
		horizontal_alignment = "center",
		parent = "difficulty_stepper",
		vertical_alignment = "bottom",
		size = {
			500,
			200,
		},
		position = {
			500,
			0,
			1,
		},
	},
	upsell_button = {
		horizontal_alignment = "center",
		parent = "difficulty_info",
		vertical_alignment = "center",
		size = {
			28,
			28,
		},
		position = {
			218,
			0,
			2,
		},
	},
	connecting = {
		horizontal_alignment = "center",
		parent = "login_text_area",
		vertical_alignment = "center",
		size = login_text_area_size,
		position = {
			0,
			0,
			1,
		},
	},
	connect_button = {
		horizontal_alignment = "right",
		parent = "login_text_area",
		vertical_alignment = "center",
		size = {
			160,
			45,
		},
		position = {
			-10,
			-2,
			10,
		},
	},
	connect_button_frame = {
		horizontal_alignment = "center",
		parent = "connect_button",
		vertical_alignment = "center",
		size = {
			160,
			50,
		},
		position = {
			0,
			2,
			11,
		},
	},
	disconnect_button = {
		horizontal_alignment = "center",
		parent = "login_text_area",
		vertical_alignment = "center",
		size = {
			window_size[1] - 20,
			45,
		},
		position = {
			0,
			-2,
			10,
		},
	},
	disconnect_button_frame = {
		horizontal_alignment = "center",
		parent = "disconnect_button",
		vertical_alignment = "center",
		size = {
			window_size[1] - 20,
			50,
		},
		position = {
			0,
			2,
			11,
		},
	},
	chat_feed_area_mask = {
		horizontal_alignment = "right",
		parent = "menu_root",
		vertical_alignment = "center",
		size = {
			600,
			window_size[2] - 220,
		},
		position = {
			0,
			-145,
			0,
		},
	},
	chat_feed_area = {
		horizontal_alignment = "right",
		parent = "chat_feed_area_mask",
		vertical_alignment = "bottom",
		size = {
			600,
			window_size[2] - 220,
		},
		position = {
			10,
			-120,
			1,
		},
	},
	chat_text_box = {
		horizontal_alignment = "right",
		parent = "chat_feed_area",
		vertical_alignment = "bottom",
		size = {
			600,
			window_size[2] - 220,
		},
	},
}

if IS_XB1 then
	scenegraph_definition.connect_button = {
		horizontal_alignment = "center",
		parent = "login_text_area",
		vertical_alignment = "center",
		size = {
			160,
			45,
		},
		position = {
			0,
			-2,
			1,
		},
	}
	scenegraph_definition.connect_button_frame = {
		horizontal_alignment = "center",
		parent = "connect_button",
		vertical_alignment = "center",
		size = {
			160,
			50,
		},
		position = {
			0,
			2,
			10,
		},
	}
end

function create_button(scenegraph_id, size, text, font_size, content_check_function)
	local background_texture = "button_bg_01"
	local background_texture_settings = UIAtlasHelper.get_atlas_settings_by_texture_name(background_texture)
	local widget = {
		element = {},
	}
	local passes = {}
	local content = {}
	local style = {}
	local offset = {
		0,
		0,
		0,
	}
	local hotspot_name = "button_hotspot"

	passes[#passes + 1] = {
		pass_type = "hotspot",
		content_id = hotspot_name,
		style_id = hotspot_name,
		content_check_function = content_check_function,
	}
	style[hotspot_name] = {
		size = size,
		offset = offset,
	}
	content[hotspot_name] = {}

	local hotspot_content = content[hotspot_name]
	local background_name = "background"

	passes[#passes + 1] = {
		pass_type = "texture_uv",
		content_id = background_name,
		style_id = background_name,
		content_check_function = content_check_function,
	}
	style[background_name] = {
		size = size,
		color = {
			255,
			255,
			255,
			255,
		},
		offset = {
			offset[1],
			offset[2],
			0,
		},
	}
	content[background_name] = {
		uvs = {
			{
				0,
				1 - math.min(size[2] / background_texture_settings.size[2], 1),
			},
			{
				math.min(size[1] / background_texture_settings.size[1], 1),
				1,
			},
		},
		texture_id = background_texture,
	}

	local background_fade_name = "background_fade"

	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = background_fade_name,
		style_id = background_fade_name,
		content_check_function = content_check_function,
	}
	style[background_fade_name] = {
		size = {
			size[1],
			size[2],
		},
		color = {
			255,
			255,
			255,
			255,
		},
		offset = {
			offset[1],
			offset[2],
			1,
		},
	}
	hotspot_content[background_fade_name] = "button_bg_fade"

	local hover_glow_name = "hover_glow"

	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = hover_glow_name,
		style_id = hover_glow_name,
		content_check_function = content_check_function,
	}
	style[hover_glow_name] = {
		size = {
			size[1],
			math.min(size[2] - 5, 80),
		},
		color = {
			255,
			255,
			255,
			255,
		},
		offset = {
			offset[1],
			offset[2] + 5,
			2,
		},
	}
	hotspot_content[hover_glow_name] = "button_state_default"

	local clicked_rect_name = "clicked_rect"

	passes[#passes + 1] = {
		pass_type = "rect",
		content_id = hotspot_name,
		style_id = clicked_rect_name,
		content_check_function = content_check_function,
	}
	style[clicked_rect_name] = {
		size = size,
		color = {
			100,
			0,
			0,
			0,
		},
		offset = {
			offset[1],
			offset[2],
			6,
		},
	}

	local glass_top_name = "glass_top"

	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = glass_top_name,
		style_id = glass_top_name,
		content_check_function = content_check_function,
	}
	style[glass_top_name] = {
		size = {
			size[1],
			11,
		},
		color = {
			255,
			255,
			255,
			255,
		},
		offset = {
			offset[1],
			offset[2] + size[2] - 11,
			5,
		},
	}
	hotspot_content[glass_top_name] = "button_glass_02"

	local glass_bottom_name = "glass_bottom"

	passes[#passes + 1] = {
		pass_type = "texture",
		content_id = hotspot_name,
		texture_id = glass_bottom_name,
		style_id = glass_bottom_name,
		content_check_function = content_check_function,
	}
	style[glass_bottom_name] = {
		size = {
			size[1],
			11,
		},
		color = {
			100,
			255,
			255,
			255,
		},
		offset = {
			offset[1],
			offset[2] - 3,
			5,
		},
	}
	hotspot_content[glass_bottom_name] = "button_glass_02"

	local text_name = "text"

	passes[#passes + 1] = {
		pass_type = "text",
		content_id = hotspot_name,
		text_id = text_name,
		style_id = text_name,
		content_check_function = content_check_function,
	}
	style[text_name] = {
		dynamic_font_size = true,
		font_type = "hell_shark",
		horizontal_alignment = "center",
		localize = false,
		upper_case = true,
		vertical_alignment = "center",
		word_wrap = true,
		font_size = font_size,
		text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
		default_text_color = Colors.get_color_table_with_alpha("font_button_normal", 255),
		select_text_color = Colors.get_color_table_with_alpha("white", 255),
		offset = {
			10 + offset[1],
			offset[2] + 3,
			4,
		},
		size = {
			size[1] - 20,
			size[2],
		},
	}
	hotspot_content[text_name] = text

	local text_shadow_name = "text_shadow"

	passes[#passes + 1] = {
		pass_type = "text",
		content_id = hotspot_name,
		text_id = text_name,
		style_id = text_shadow_name,
		content_check_function = content_check_function,
	}
	style[text_shadow_name] = {
		dynamic_font_size = true,
		font_type = "hell_shark",
		horizontal_alignment = "center",
		localize = false,
		upper_case = true,
		vertical_alignment = "center",
		word_wrap = true,
		font_size = font_size,
		text_color = Colors.get_color_table_with_alpha("black", 255),
		offset = {
			10 + offset[1] + 2,
			offset[2] + 2,
			3,
		},
		size = {
			size[1] - 20,
			size[2],
		},
	}
	widget.element.passes = passes
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

local chat_output_widget = {
	scenegraph_id = "chat_feed_area",
	element = {
		passes = {
			{
				pass_type = "text_area_chat",
				style_id = "chat_text_box",
				text_id = "text_field",
				content_check_function = function (content)
					return Managers.twitch:is_connected()
				end,
			},
		},
	},
	content = {
		mask_id = "mask_rect",
		text_start_offset = 0,
		message_tables = {},
	},
	style = {
		chat_text_box = {
			dynamic_font = true,
			font_size = 18,
			font_type = "chat_output_font_masked",
			pixel_perfect = false,
			spacing = 0,
			vertical_alignment = "top",
			word_wrap = true,
			text_color = Colors.get_table("white"),
			name_color = Colors.get_table("sky_blue"),
			name_color_dev = Colors.get_table("cheeseburger"),
			name_color_system = Colors.get_table("gold"),
			offset = {
				0,
				45,
				10,
			},
		},
	},
	offset = {
		0,
		0,
		0,
	},
}

local function create_window(scenegraph_id, size)
	local widget = {
		element = {},
	}
	local passes = {
		{
			content_id = "text_input_hotspot",
			pass_type = "hotspot",
			scenegraph_id = "login_text_box",
		},
		{
			content_id = "frame_hotspot",
			pass_type = "hotspot",
			scenegraph_id = "window",
		},
		{
			content_id = "screen_hotspot",
			pass_type = "hotspot",
			scenegraph_id = "menu_root",
		},
		{
			pass_type = "rect",
			style_id = "login_rect_bg",
			content_check_function = function (content, style)
				return not Managers.twitch:is_connected() and not Managers.twitch:is_connecting()
			end,
		},
		{
			pass_type = "text",
			style_id = "login_hint",
			text_id = "login_hint",
			content_check_function = function (content, style)
				local hotspot = content.text_input_hotspot

				if hotspot.is_hover then
					style.text_color = {
						128,
						255,
						255,
						255,
					}
				else
					style.text_color = {
						60,
						255,
						255,
						255,
					}
				end

				return content.twitch_name == "" and not Managers.twitch:is_connected() and not content.text_field_active and not Managers.twitch:is_connecting()
			end,
		},
		{
			pass_type = "text",
			style_id = "twitch_name",
			text_id = "twitch_name",
			content_check_function = function (content, style)
				if not content.text_field_active then
					style.caret_color[1] = 0
				else
					style.caret_color[1] = 128 + math.sin(Managers.time:time("ui") * 5) * 128
				end

				return not Managers.twitch:is_connected() and not Managers.twitch:is_connecting()
			end,
		},
		{
			pass_type = "text",
			style_id = "connecting",
			text_id = "connecting_id",
			content_check_function = function (content, style)
				if not Managers.twitch:is_connecting() then
					return
				end

				local timer = 10 * Managers.time:time("ui")
				local dot_str = string.rep(".", timer % 5)

				content.connecting_id = Localize("start_game_window_twitch_connecting") .. dot_str

				return true
			end,
		},
	}
	local content = {
		caret_index = 1,
		connecting_id = "Connecting",
		error_id = "",
		text_field_active = false,
		text_index = 1,
		text_start_offset = 0,
		twitch_name = "",
		login_hint = Localize("start_game_window_twitch_login_hint"),
		text_input_hotspot = {},
		screen_hotspot = {
			allow_multi_hover = true,
		},
		frame_hotspot = {
			allow_multi_hover = true,
		},
	}
	local style = {
		login_rect_bg = {
			scenegraph_id = "login_text_frame",
			color = {
				255,
				0,
				0,
				0,
			},
			offset = {
				0,
				0,
				-1,
			},
			size = login_text_area_size,
		},
		login_hint = {
			dynamic_font_size = true,
			font_size = 24,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			pixel_perfect = true,
			scenegraph_id = "login_text_box",
			vertical_alignment = "center",
			word_wrap = true,
			text_color = {
				60,
				255,
				255,
				255,
			},
			offset = {
				5,
				0,
				10,
			},
			size = {
				290,
				42,
			},
		},
		connecting = {
			dynamic_font = true,
			font_size = 24,
			font_type = "hell_shark",
			horizontal_alignment = "center",
			pixel_perfect = true,
			scenegraph_id = "connecting",
			vertical_alignment = "center",
			word_wrap = false,
			text_color = {
				90,
				255,
				255,
				255,
			},
			offset = {
				0,
				0,
				10,
			},
		},
		twitch_name = {
			dynamic_font = true,
			font_size = 28,
			font_type = "hell_shark_arial",
			horizontal_alignment = "left",
			horizontal_scroll = true,
			pixel_perfect = true,
			scenegraph_id = "login_text_box",
			vertical_alignment = "center",
			word_wrap = false,
			text_color = Colors.get_table("white"),
			offset = {
				10,
				10,
				10,
			},
			caret_size = {
				2,
				26,
			},
			caret_offset = {
				0,
				-4,
				4,
			},
			caret_color = Colors.get_table("white"),
		},
	}

	widget.element.passes = passes
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

function create_twitch_rect_with_outer_frame(scenegraph_id, size, frame_style, layer, color, frame_color)
	color = color or {
		255,
		255,
		255,
		255,
	}

	local frame_settings = frame_style and UIFrameSettings[frame_style] or UIFrameSettings.frame_outer_fade_02
	local edge_height = frame_settings.texture_sizes.horizontal[2]
	local frame_size = {
		size[1] + edge_height * 2,
		size[2] + edge_height * 2,
	}
	local widget = {
		element = {},
	}
	local passes = {
		{
			pass_type = "texture_frame",
			style_id = "frame",
			texture_id = "frame",
			content_check_function = function (content, style)
				return Managers.twitch:is_connected()
			end,
		},
		{
			pass_type = "rect",
			style_id = "rect",
			content_check_function = function (content, style)
				return Managers.twitch:is_connected()
			end,
		},
	}
	local content = {
		frame = frame_settings.texture,
	}
	local style = {
		frame = {
			color = frame_color or color,
			size = frame_size,
			texture_size = frame_settings.texture_size,
			texture_sizes = frame_settings.texture_sizes,
			offset = {
				-edge_height,
				-edge_height,
				layer or 0,
			},
		},
		rect = {
			color = color,
			offset = {
				0,
				0,
				layer or 0,
			},
		},
	}

	widget.element.passes = passes
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

local client_disclaimer_description_style = {
	font_size = 28,
	font_type = "hell_shark_header",
	horizontal_alignment = "center",
	localize = false,
	upper_case = false,
	use_shadow = true,
	vertical_alignment = "top",
	word_wrap = true,
	text_color = Colors.get_color_table_with_alpha("red", 255),
	offset = {
		0,
		0,
		2,
	},
}

local function connected_content_check_function(content)
	return not Managers.twitch:is_connecting() and not Managers.twitch:is_connected() and not Managers.input:is_device_active("gamepad")
end

local function disconnected_content_check_function(content)
	return not Managers.twitch:is_connecting() and Managers.twitch:is_connected() and not Managers.input:is_device_active("gamepad")
end

local streaming_desc_str = Localize("start_game_window_deus_twitch_desc")
local client_disclaimer_desc_str = "start_game_window_twitch_client_disclaimer_description"
local disable_with_gamepad = true
local selection_widgets = {
	difficulty_stepper = UIWidgets.create_start_game_difficulty_stepper("difficulty_stepper", Localize("start_game_window_difficulty"), "difficulty_option_1"),
	play_button = UIWidgets.create_start_game_deus_play_button("play_button", scenegraph_definition.play_button.size, Localize("start_game_window_play"), 34, disable_with_gamepad),
}
local client_widgets = {
	client_disclaimer_background = UIWidgets.create_rect_with_outer_frame("client_disclaimer_background", scenegraph_definition.client_disclaimer_background.size, "frame_outer_fade_02", nil, UISettings.console_start_game_menu_rect_color),
	client_disclaimer_description = UIWidgets.create_simple_text(Localize(client_disclaimer_desc_str), "client_disclaimer_description", nil, nil, client_disclaimer_description_style),
}
local server_widgets = {
	brush_stroke = UIWidgets.create_simple_texture("brush_stroke", "brush_stroke"),
}
local widgets = {
	twitch_texture = UIWidgets.create_simple_texture("twitch_logo_new", "twitch_texture"),
	twitch_gamemode_info_box = UIWidgets.create_start_game_deus_gamemode_info_box("twitch_background", scenegraph_definition.twitch_background.size, nil, streaming_desc_str, true),
	button_1 = create_button("connect_button", scenegraph_definition.connect_button.size, Localize("start_game_window_twitch_connect"), 24, connected_content_check_function),
	button_2 = create_button("disconnect_button", scenegraph_definition.disconnect_button.size, string.format(Localize("start_game_window_twitch_disconnect"), "N/A"), 24, disconnected_content_check_function),
	connect_button_frame = UIWidgets.create_frame("connect_button_frame", scenegraph_definition.connect_button_frame.size, window_frame, 1),
	disconnect_button_frame = UIWidgets.create_frame("disconnect_button_frame", scenegraph_definition.disconnect_button_frame.size, window_frame, 1),
	login_text_frame = UIWidgets.create_frame("login_text_frame", {
		window_text_width,
		50,
	}, "menu_frame_09", 1),
	frame_widget = create_window("twitch_background", scenegraph_definition.twitch_background.size),
	difficulty_info = UIWidgets.create_start_game_deus_difficulty_info_box("difficulty_info", scenegraph_definition.difficulty_info.size),
	upsell_button = UIWidgets.create_simple_two_state_button("upsell_button", "icon_redirect", "icon_redirect_hover"),
	chat_output_widget = chat_output_widget,
	chat_mask = UIWidgets.create_simple_texture("mask_rect", "chat_feed_area_mask"),
	chat_output_background = create_twitch_rect_with_outer_frame("chat_feed_area_mask", scenegraph_definition.chat_feed_area_mask.size, "frame_outer_fade_02", nil, UISettings.console_start_game_menu_rect_color),
}

widgets.login_text_frame.element.passes[1].content_check_function = connected_content_check_function
widgets.connect_button_frame.element.passes[1].content_check_function = connected_content_check_function
widgets.disconnect_button_frame.element.passes[1].content_check_function = disconnected_content_check_function

local additional_settings_widgets = {}
local selector_input_definition = {
	{
		enter_requirements = function (self)
			return self._is_server
		end,
		on_enter = function (self, dt, t)
			self._expedition_level_index = 1

			local expedition_widgets = self._expedition_widgets

			for i = 1, #expedition_widgets do
				local widget = expedition_widgets[i]

				widget.content.gamepad_selected = false
			end

			local widget = expedition_widgets[self._expedition_level_index]

			widget.content.gamepad_selected = true
		end,
		update = function (self, input_service, dt, t)
			local expedition_widgets = self._expedition_widgets
			local expedition_level_index = self._expedition_level_index

			if input_service:get("move_left") then
				expedition_level_index = math.max(expedition_level_index - 1, 1)
			elseif input_service:get("move_right") then
				expedition_level_index = math.min(expedition_level_index + 1, #expedition_widgets)
			elseif input_service:get("confirm_press") then
				if self._expeditions_selection_index then
					local old_widget = self._expedition_widgets[self._expeditions_selection_index]

					old_widget.content.button_hotspot.is_selected = nil
				end

				local new_widget = self._expedition_widgets[expedition_level_index]

				new_widget.content.button_hotspot.is_selected = true

				local journey_name = new_widget.content.journey_name

				self._parent:set_selected_level_id(journey_name)

				self._expeditions_selection_index = expedition_level_index

				self:_play_sound("play_gui_lobby_button_01_difficulty_select_normal")
			end

			if expedition_level_index ~= self._expedition_level_index then
				local new_widget = expedition_widgets[expedition_level_index]

				if not new_widget.content.locked then
					new_widget.content.gamepad_selected = true

					local old_widget = expedition_widgets[self._expedition_level_index]

					old_widget.content.gamepad_selected = false
					self._expedition_level_index = expedition_level_index

					self._parent:play_sound("play_gui_lobby_button_02_mission_act_click")
				end
			end
		end,
		on_exit = function (self, dt, t)
			local expedition_level_index = self._expedition_level_index or 1
			local expedition_widgets = self._expedition_widgets
			local widget = expedition_widgets[expedition_level_index]

			if widget then
				widget.content.gamepad_selected = false
			end

			if self._expeditions_selection_index then
				local widget = expedition_widgets[self._expeditions_selection_index]

				widget.content.gamepad_selected = true
			end
		end,
	},
	{
		enter_requirements = function (self)
			return self._is_server
		end,
		on_enter = function (self, dt, t)
			local selection_widgets_by_name = self._selection_widgets_by_name
			local difficulty_setting_widget = selection_widgets_by_name.difficulty_stepper

			difficulty_setting_widget.content.is_selected = true
		end,
		update = function (self, input_service, dt, t)
			local selection_widgets_by_name = self._selection_widgets_by_name
			local difficulty_stepper = selection_widgets_by_name.difficulty_stepper
			local widgets = {
				difficulty_info = self._widgets_by_name.difficulty_info,
				upsell_button = self._widgets_by_name.upsell_button,
			}

			if not self.diff_info_anim_played then
				self._diff_anim_id = self._ui_animator:start_animation("difficulty_info_enter", widgets, scenegraph_definition)
				self.diff_info_anim_played = true
			end

			local anim_params = {}

			if input_service:get("move_left") then
				self:_option_selected("difficulty_stepper", "left_arrow", t)

				difficulty_stepper.content.left_arrow_pressed = true
				anim_params.left_key = difficulty_stepper.style.left_arrow_gamepad_highlight

				if self._arrow_anim_id then
					self._ui_animator:stop_animation(self._arrow_anim_id)

					difficulty_stepper.style.right_arrow_gamepad_highlight.color[1] = 0
				end

				local anim_id = self._ui_animator:start_animation("left_arrow_flick", difficulty_stepper, scenegraph_definition, anim_params)

				self._arrow_anim_id = anim_id
			elseif input_service:get("move_right") then
				self:_option_selected("difficulty_stepper", "right_arrow", t)

				difficulty_stepper.content.right_arrow_pressed = true
				anim_params.right_key = difficulty_stepper.style.right_arrow_gamepad_highlight

				if self._arrow_anim_id then
					self._ui_animator:stop_animation(self._arrow_anim_id)

					difficulty_stepper.style.left_arrow_gamepad_highlight.color[1] = 0
				end

				local anim_id = self._ui_animator:start_animation("right_arrow_flick", difficulty_stepper, scenegraph_definition, anim_params)

				self._arrow_anim_id = anim_id
			end

			if input_service:get("confirm_press", true) and self._dlc_locked then
				Managers.unlock:open_dlc_page(self._dlc_name)
			end

			self:_update_difficulty_lock()
		end,
		on_exit = function (self, dt, t)
			local selection_widgets_by_name = self._selection_widgets_by_name
			local difficulty_setting_widget = selection_widgets_by_name.difficulty_stepper

			difficulty_setting_widget.content.is_selected = false

			local upsell_button = self._widgets_by_name.upsell_button
			local difficulty_info = self._widgets_by_name.difficulty_info

			if self._diff_anim_id then
				self._ui_animator:stop_animation(self._diff_anim_id)
			end

			difficulty_info.content.visible = false
			upsell_button.content.visible = false
			self.diff_info_anim_played = false
		end,
	},
	{
		enter_requirements = function (self)
			local gamepad_active = Managers.input:is_device_active("gamepad")

			return not gamepad_active and self._is_server and Managers.twitch:is_connected()
		end,
		on_enter = function (self, dt, t)
			local selection_widgets_by_name = self._selection_widgets_by_name
			local difficulty_setting_widget = selection_widgets_by_name.play_button

			difficulty_setting_widget.content.is_selected = true
		end,
		update = function (self, input_service, dt, t)
			if input_service:get("confirm_press") and Managers.twitch:is_connected() then
				self:_option_selected("play_button", nil, t)
			end
		end,
		on_exit = function (self, dt, t)
			local selection_widgets_by_name = self._selection_widgets_by_name
			local difficulty_setting_widget = selection_widgets_by_name.play_button

			difficulty_setting_widget.content.is_selected = false
		end,
	},
}

return {
	scenegraph_definition = scenegraph_definition,
	widgets = widgets,
	selection_widgets = selection_widgets,
	client_widgets = client_widgets,
	server_widgets = server_widgets,
	additional_settings_widgets = additional_settings_widgets,
	animation_definitions = animation_definitions,
	selector_input_definition = selector_input_definition,
	journey_widget_settings = journey_widget_settings,
	twitch_keyboard_anchor_point = {
		230,
		350,
	},
}
